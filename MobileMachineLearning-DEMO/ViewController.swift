//
//  ViewController.swift
//  MobileMachineLearning-DEMO
//
//  Created by Doyoung Gwak on 03/04/2019.
//  Copyright © 2019 Doyoung Gwak. All rights reserved.
//

import UIKit
// import Vision <# TODO #>
import CoreMedia

class ViewController: UIViewController {

    // MARK: - UI Properties
    @IBOutlet weak var videoPreview: UIView!
    //@IBOutlet weak var jointView: DrawingJointView!
    
    @IBOutlet weak var inferenceLabel: UILabel!
    @IBOutlet weak var etimeLabel: UILabel!
    @IBOutlet weak var fpsLabel: UILabel!
    
    // MARK - Performance Measurement Property
    private let 👨‍🔧 = 📏()
    
    /* <# TODO #>
    // MARK - Core ML model
     typealias EstimationModel = <# Core ML Model Name #>
    
    // MARK: - Vision Properties
    var request: VNCoreMLRequest?
    var visionModel: VNCoreMLModel?
    */
    
    // MARK: - AV Property
    var videoCapture: VideoCapture!
    
    // MARK: - View Controller Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // setup the model
        //setUpModel()
        
        // setup camera
        setUpCamera()
        
        // setup delegate for performance measurement
        👨‍🔧.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.videoCapture.start()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.videoCapture.stop()
    }
    
    /* <# TODO #>
    // MARK: - Setup Core ML
    func setUpModel() {
        if let visionModel = try? VNCoreMLModel(for: EstimationModel().model) {
            self.visionModel = visionModel
            request = VNCoreMLRequest(model: visionModel, completionHandler: visionRequestDidComplete)
            request?.imageCropAndScaleOption = .scaleFill
        } else {
            fatalError()
        }
    }
     */
    
    // MARK: - SetUp Video
    func setUpCamera() {
        videoCapture = VideoCapture()
        videoCapture.delegate = self
        videoCapture.fps = 30
        videoCapture.setUp(sessionPreset: .vga640x480) { success in
            
            if success {
                // add preview view on the layer
                if let previewLayer = self.videoCapture.previewLayer {
                    self.videoPreview.layer.addSublayer(previewLayer)
                    self.resizePreviewLayer()
                }
                
                // start video preview when setup is done
                self.videoCapture.start()
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        resizePreviewLayer()
    }
    
    func resizePreviewLayer() {
        videoCapture.previewLayer?.frame = videoPreview.bounds
    }
}

// MARK: - VideoCaptureDelegate
extension ViewController: VideoCaptureDelegate {
    func videoCapture(_ capture: VideoCapture, didCaptureVideoFrame pixelBuffer: CVPixelBuffer?, timestamp: CMTime) {
        // the captured image from camera is contained on pixelBuffer
        if let pixelBuffer = pixelBuffer {
            // start of measure <# TODO #>
            //self.👨‍🔧.🎬👏()
            
            // predict! <# TODO #>
            //self.predictUsingVision(pixelBuffer: pixelBuffer)
        }
    }
}

extension ViewController {
    /* <# TODO #>
    func predictUsingVision(pixelBuffer: CVPixelBuffer) {
        guard let request = request else { fatalError() }
        // vision framework configures the input size of image following our model's input configuration automatically
        let handler = VNImageRequestHandler(cvPixelBuffer: pixelBuffer)
        try? handler.perform([request])
    }
    */
    
    /* <# TODO #>
    // MARK: - Poseprocessing
    func visionRequestDidComplete(request: VNRequest, error: Error?) {
        self.👨‍🔧.🏷(with: "endInference")
        if let observations = request.results as? [VNCoreMLFeatureValueObservation],
            let result = observations.first?.featureValue.multiArrayValue <# TODO #> {
            
            // post processing
            // <# TODO #>
            
            DispatchQueue.main.sync {
                // show the result
                // <# TODO #>
     
                // end of measure
                self.👨‍🔧.🎬🤚()
            }
        } else {
            // end of measure
            self.👨‍🔧.🎬🤚()
        }
    }
     */
}

// MARK: - 📏(Performance Measurement) Delegate
extension ViewController: 📏Delegate {
    func updateMeasure(inferenceTime: Double, executionTime: Double, fps: Int) {
        //print(executionTime, fps)
        self.inferenceLabel.text = "inference: \(Int(inferenceTime*1000.0)) mm"
        self.etimeLabel.text = "execution: \(Int(executionTime*1000.0)) mm"
        self.fpsLabel.text = "fps: \(fps)"
    }
}
