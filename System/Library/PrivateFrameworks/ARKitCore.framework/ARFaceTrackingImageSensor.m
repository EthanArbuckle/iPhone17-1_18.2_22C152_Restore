@interface ARFaceTrackingImageSensor
- (ARFaceTrackingImageSensor)initWithSettings:(id)a3 captureSession:(id)a4 captureQueue:(id)a5;
- (BOOL)recordingMode;
- (id)_configureMetaDataOutput;
- (id)configureCaptureSession;
- (id)configureCaptureSessionCalibration;
- (id)outputsForSynchronizer;
- (id)prepareToStart;
- (int64_t)_videoOrientation;
- (unint64_t)providedDataTypes;
- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)capturedSynchedOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromVideoConnection:(id)a5 metaDataOutput:(id)a6 didOutputMetadataObjects:(id)a7 didOutputDepthData:(id)a8 atTime:(id *)a9;
- (void)configureCaptureDevice;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)dealloc;
- (void)reconfigure:(id)a3;
- (void)setRecordingMode:(BOOL)a3;
- (void)stop;
@end

@implementation ARFaceTrackingImageSensor

- (ARFaceTrackingImageSensor)initWithSettings:(id)a3 captureSession:(id)a4 captureQueue:(id)a5
{
  v9.receiver = self;
  v9.super_class = (Class)ARFaceTrackingImageSensor;
  v5 = [(ARImageSensor *)&v9 initWithSettings:a3 captureSession:a4 captureQueue:a5];
  if (v5)
  {
    dispatch_semaphore_t v6 = dispatch_semaphore_create(1);
    faceDataSemaphore = v5->_faceDataSemaphore;
    v5->_faceDataSemaphore = (OS_dispatch_semaphore *)v6;
  }
  return v5;
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    dispatch_semaphore_t v6 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    objc_super v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ dealloc", buf, 0x20u);
  }
  [(ARFaceTrackingImageSensor *)self stop];
  v7.receiver = self;
  v7.super_class = (Class)ARFaceTrackingImageSensor;
  [(ARImageSensor *)&v7 dealloc];
}

- (unint64_t)providedDataTypes
{
  return 49;
}

- (id)outputsForSynchronizer
{
  v3 = objc_opt_new();
  v4 = [(ARImageSensor *)self videoOutput];

  if (v4)
  {
    v5 = [(ARImageSensor *)self videoOutput];
    [v3 addObject:v5];
  }
  if (self->_depthDataOutput) {
    objc_msgSend(v3, "addObject:");
  }
  if (self->_metaDataOutput)
  {
    dispatch_semaphore_t v6 = [(ARImageSensor *)self settings];
    objc_super v7 = [v6 metaData];
    int v8 = [v7 isEqualToString:*MEMORY[0x1E4F15E48]];

    if (v8) {
      [v3 addObject:self->_metaDataOutput];
    }
  }
  return v3;
}

- (void)reconfigure:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ARFaceTrackingImageSensor;
  [(ARImageSensor *)&v15 reconfigure:v4];
  if ([(ARImageSensor *)self canReconfigure:v4])
  {
    uint64_t v5 = [v4 maximumNumberOfTrackedFaces];
    dispatch_semaphore_t v6 = [(ARImageSensor *)self settings];
    LOBYTE(v5) = v5 == [v6 maximumNumberOfTrackedFaces];

    if ((v5 & 1) == 0)
    {
      if ([(AVCaptureMetadataOutput *)self->_metaDataOutput isFaceTrackingSupported]&& [(AVCaptureMetadataOutput *)self->_metaDataOutput isFaceTrackingMetadataObjectTypesAvailable])
      {
        -[AVCaptureMetadataOutput setFaceTrackingMaxFaces:](self->_metaDataOutput, "setFaceTrackingMaxFaces:", [v4 maximumNumberOfTrackedFaces]);
        objc_super v7 = _ARLogSensor();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          int v8 = (objc_class *)objc_opt_class();
          NSStringFromClass(v8);
          id v9 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v10 = [(AVCaptureMetadataOutput *)self->_metaDataOutput faceTrackingMaxFaces];
          int v11 = [(AVCaptureMetadataOutput *)self->_metaDataOutput isFaceTrackingUsingFaceRecognition];
          __int16 v12 = @"NO";
          *(_DWORD *)buf = 138544130;
          id v17 = v9;
          __int16 v18 = 2048;
          if (v11) {
            __int16 v12 = @"YES";
          }
          v19 = self;
          __int16 v20 = 2048;
          uint64_t v21 = v10;
          __int16 v22 = 2112;
          v23 = v12;
          _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Reconfigured to maxFaces: %li, faceRecognition enabled: %@", buf, 0x2Au);
        }
      }
      uint64_t v13 = [v4 maximumNumberOfTrackedFaces];
      uint64_t v14 = [(ARImageSensor *)self mutableSettings];
      [v14 setMaximumNumberOfTrackedFaces:v13];
    }
  }
}

- (int64_t)_videoOrientation
{
  v3 = [(ARImageSensor *)self settings];
  id v4 = [v3 videoFormat];
  uint64_t v5 = [v4 captureDevicePosition];

  dispatch_semaphore_t v6 = [(ARImageSensor *)self settings];
  objc_super v7 = v6;
  if (v5 == 2)
  {
    if ([v6 mirrorVideoOutput]) {
      int64_t v8 = 3;
    }
    else {
      int64_t v8 = 4;
    }
  }
  else if ([v6 mirrorVideoOutput])
  {
    int64_t v8 = 4;
  }
  else
  {
    int64_t v8 = 3;
  }

  return v8;
}

- (id)configureCaptureSession
{
  v69[1] = *MEMORY[0x1E4F143B8];
  v60.receiver = self;
  v60.super_class = (Class)ARFaceTrackingImageSensor;
  v3 = [(ARImageSensor *)&v60 configureCaptureSession];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = v4;
    goto LABEL_9;
  }
  if (!ARHasH10())
  {
    dispatch_semaphore_t v6 = [(ARImageSensor *)self videoOutput];
    [v6 setAlwaysDiscardsLateVideoFrames:0];
  }
  objc_super v7 = [(ARImageSensor *)self videoOutput];
  int64_t v8 = [v7 connectionWithMediaType:*MEMORY[0x1E4F15C18]];

  id v9 = [(ARImageSensor *)self settings];
  objc_msgSend(v8, "setVideoMirrored:", objc_msgSend(v9, "mirrorVideoOutput"));

  objc_msgSend(v8, "setVideoOrientation:", -[ARFaceTrackingImageSensor _videoOrientation](self, "_videoOrientation"));
  if (self->_depthDataOutput) {
    goto LABEL_7;
  }
  uint64_t v10 = [(ARImageSensor *)self captureDevice];
  int v11 = [v10 deviceType];
  BOOL v12 = v11 == (void *)*MEMORY[0x1E4F15820];

  if (!v12) {
    goto LABEL_7;
  }
  uint64_t v14 = (AVCaptureDepthDataOutput *)objc_opt_new();
  depthDataOutput = self->_depthDataOutput;
  self->_depthDataOutput = v14;

  v16 = [(ARImageSensor *)self captureSession];
  int v17 = [v16 canAddOutput:self->_depthDataOutput];

  if (!v17)
  {
    v48 = _ARLogSensor();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_ERROR))
    {
      v49 = (objc_class *)objc_opt_class();
      v50 = NSStringFromClass(v49);
      v51 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v62 = v50;
      __int16 v63 = 2048;
      v64 = self;
      __int16 v65 = 2112;
      v66 = v51;
      _os_log_impl(&dword_1B88A2000, v48, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add depth data output to the capture session.", buf, 0x20u);
    }
    uint64_t v5 = ARErrorWithCodeAndUserInfo(102, 0);
    goto LABEL_33;
  }
  __int16 v18 = [(ARImageSensor *)self captureSession];
  [v18 addOutputWithNoConnections:self->_depthDataOutput];

  v19 = _ARLogSensor();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    __int16 v20 = (objc_class *)objc_opt_class();
    uint64_t v21 = NSStringFromClass(v20);
    __int16 v22 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    id v62 = v21;
    __int16 v63 = 2048;
    v64 = self;
    __int16 v65 = 2112;
    v66 = v22;
    _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Added depth data output to the capture session", buf, 0x20u);
  }
  if (self->_depthConnection) {
    goto LABEL_7;
  }
  v23 = [(ARImageSensor *)self videoInput];
  uint64_t v24 = [(ARImageSensor *)self videoInput];
  v25 = [v24 device];
  v26 = [v25 deviceType];
  v27 = [(ARImageSensor *)self videoInput];
  v28 = [v27 device];
  uint64_t v29 = [v28 position];
  v30 = [v23 portsWithMediaType:*MEMORY[0x1E4F15BD0] sourceDeviceType:v26 sourceDevicePosition:v29];
  v59 = [v30 firstObject];

  if (!v59)
  {
    v52 = _ARLogSensor();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v53 = (objc_class *)objc_opt_class();
      v54 = NSStringFromClass(v53);
      v55 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v62 = v54;
      __int16 v63 = 2048;
      v64 = self;
      __int16 v65 = 2112;
      v66 = v55;
      _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find depth data input port on the video input.", buf, 0x20u);
    }
    goto LABEL_32;
  }
  v31 = (void *)MEMORY[0x1E4F16410];
  v69[0] = v59;
  v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:1];
  v33 = [v31 connectionWithInputPorts:v32 output:self->_depthDataOutput];
  depthConnection = self->_depthConnection;
  self->_depthConnection = v33;

  v35 = [(ARImageSensor *)self captureSession];
  LOBYTE(v31) = [v35 canAddConnection:self->_depthConnection];

  if ((v31 & 1) == 0)
  {
    v52 = _ARLogSensor();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      v56 = (objc_class *)objc_opt_class();
      v57 = NSStringFromClass(v56);
      v58 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v62 = v57;
      __int16 v63 = 2048;
      v64 = self;
      __int16 v65 = 2112;
      v66 = v58;
      _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add depth connection to the capture session.", buf, 0x20u);
    }
LABEL_32:

    uint64_t v5 = ARErrorWithCodeAndUserInfo(102, 0);

LABEL_33:
    id v4 = 0;
    goto LABEL_8;
  }
  v36 = [(ARImageSensor *)self connections];
  [v36 addObject:self->_depthConnection];

  v37 = [(ARImageSensor *)self captureSession];
  [v37 addConnection:self->_depthConnection];

  v38 = _ARLogSensor();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
  {
    v39 = (objc_class *)objc_opt_class();
    v40 = NSStringFromClass(v39);
    v41 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    id v62 = v40;
    __int16 v63 = 2048;
    v64 = self;
    __int16 v65 = 2112;
    v66 = v41;
    _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added depth data output to the capture session", buf, 0x20u);
  }
  [(AVCaptureDepthDataOutput *)self->_depthDataOutput setAlwaysDiscardsLateDepthData:1];
  [(AVCaptureDepthDataOutput *)self->_depthDataOutput setFilteringEnabled:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imageSensor.face.depthDataFiltering"]];
  v42 = _ARLogSensor();
  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
  {
    v43 = (objc_class *)objc_opt_class();
    NSStringFromClass(v43);
    id v44 = (id)objc_claimAutoreleasedReturnValue();
    v45 = [(ARImageSensor *)self logPrefix];
    BOOL v46 = [(AVCaptureDepthDataOutput *)self->_depthDataOutput isFilteringEnabled];
    v47 = @"disabled";
    *(_DWORD *)buf = 138544130;
    id v62 = v44;
    __int16 v63 = 2048;
    if (v46) {
      v47 = @"enabled";
    }
    v64 = self;
    __int16 v65 = 2112;
    v66 = v45;
    __int16 v67 = 2112;
    v68 = v47;
    _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Depth data filtering is %@.", buf, 0x2Au);
  }
  -[AVCaptureConnection setVideoMirrored:](self->_depthConnection, "setVideoMirrored:", [v8 isVideoMirrored]);
  -[AVCaptureConnection setVideoOrientation:](self->_depthConnection, "setVideoOrientation:", [v8 videoOrientation]);

LABEL_7:
  id v4 = [(ARFaceTrackingImageSensor *)self _configureMetaDataOutput];
  uint64_t v5 = v4;
LABEL_8:

LABEL_9:
  return v5;
}

- (void)configureCaptureDevice
{
  v4.receiver = self;
  v4.super_class = (Class)ARFaceTrackingImageSensor;
  [(ARImageSensor *)&v4 configureCaptureDevice];
  v3 = [(ARImageSensor *)self captureDevice];
  [v3 setFaceDetectionDrivenImageProcessingEnabled:1];
}

- (id)configureCaptureSessionCalibration
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    dispatch_semaphore_t v6 = [(ARImageSensor *)self logPrefix];
    int v8 = 138543874;
    id v9 = v5;
    __int16 v10 = 2048;
    int v11 = self;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ skipping configuration for camera calibration output", (uint8_t *)&v8, 0x20u);
  }
  return 0;
}

- (id)prepareToStart
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    dispatch_semaphore_t v6 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    v19 = v5;
    __int16 v20 = 2048;
    uint64_t v21 = self;
    __int16 v22 = 2112;
    v23 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ preparing to start", buf, 0x20u);
  }
  self->_signpostFirstFrameDone = 0;
  self->_signpostFirstFaceDone = 0;
  kdebug_trace();
  kdebug_trace();
  v17.receiver = self;
  v17.super_class = (Class)ARFaceTrackingImageSensor;
  objc_super v7 = [(ARImageSensor *)&v17 prepareToStart];
  int v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    __int16 v10 = [MEMORY[0x1E4F1C9C8] date];
    [v10 timeIntervalSince1970];
    self->_startTime = v11;

    self->_droppedFramesPerSec = 0;
    __int16 v12 = _ARLogSensor();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      objc_super v15 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v19 = v14;
      __int16 v20 = 2048;
      uint64_t v21 = self;
      __int16 v22 = 2112;
      v23 = v15;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ prepare to start complete", buf, 0x20u);
    }
  }

  return v8;
}

- (void)stop
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_super v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    dispatch_semaphore_t v6 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    objc_super v15 = v5;
    __int16 v16 = 2048;
    objc_super v17 = self;
    __int16 v18 = 2112;
    v19 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ stopping", buf, 0x20u);
  }
  v13.receiver = self;
  v13.super_class = (Class)ARFaceTrackingImageSensor;
  [(ARImageSensor *)&v13 stop];
  [(AVCaptureMetadataOutput *)self->_metaDataOutput setMetadataObjectsDelegate:0 queue:0];
  availableMetadataObjectTypes = self->_availableMetadataObjectTypes;
  self->_availableMetadataObjectTypes = 0;

  latestFaceData = self->_latestFaceData;
  self->_latestFaceData = 0;

  self->_droppedFramesPerSec = 0;
  self->_startTime = 0.0;
  id v9 = _ARLogSensor();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    __int16 v10 = (objc_class *)objc_opt_class();
    double v11 = NSStringFromClass(v10);
    __int16 v12 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    objc_super v15 = v11;
    __int16 v16 = 2048;
    objc_super v17 = self;
    __int16 v18 = 2112;
    v19 = v12;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ stop complete", buf, 0x20u);
  }
}

- (id)_configureMetaDataOutput
{
  v100[1] = *MEMORY[0x1E4F143B8];
  v3 = [(ARImageSensor *)self settings];
  objc_super v4 = [v3 metaData];

  if (!v4)
  {
    v25 = [(ARImageSensor *)self captureSession];
    [v25 removeOutput:self->_metaDataOutput];

    metaDataOutput = self->_metaDataOutput;
    self->_metaDataOutput = 0;

    objc_super v17 = _ARLogSensor();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      uint64_t v29 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v93 = v28;
      __int16 v94 = 2048;
      v95 = self;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v29;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Removed metadata output from the capture session", buf, 0x20u);
    }
    goto LABEL_29;
  }
  if (self->_metaDataOutput)
  {
LABEL_3:
    uint64_t v5 = self->_metaDataOutput;
    dispatch_semaphore_t v6 = [(ARImageSensor *)self captureQueue];
    [(AVCaptureMetadataOutput *)v5 setMetadataObjectsDelegate:self queue:v6];

    objc_super v7 = [(ARImageSensor *)self captureSession];
    int v8 = [v7 outputs];
    int v9 = [v8 containsObject:self->_metaDataOutput];

    if (!v9)
    {
      v30 = [(ARImageSensor *)self delegate];
      char v31 = objc_opt_respondsToSelector();

      if (v31)
      {
        v32 = [MEMORY[0x1E4F1CA60] dictionary];
        v33 = ARKitCoreBundle();
        v34 = [v33 localizedStringForKey:@"Could not add metadata output to capture session" value:&stru_1F120C8F0 table:@"Localizable_iOS"];
        [v32 setObject:v34 forKeyedSubscript:*MEMORY[0x1E4F28588]];

        v35 = ARErrorWithCodeAndUserInfo(102, v32);

        goto LABEL_31;
      }
      goto LABEL_30;
    }
    if ([(AVCaptureMetadataOutput *)self->_metaDataOutput isFaceTrackingSupported])
    {
      [(AVCaptureMetadataOutput *)self->_metaDataOutput setFaceTrackingMetadataObjectTypesAvailable:1];
      __int16 v10 = [(ARImageSensor *)self settings];
      -[AVCaptureMetadataOutput setFaceTrackingMaxFaces:](self->_metaDataOutput, "setFaceTrackingMaxFaces:", [v10 maximumNumberOfTrackedFaces]);

      double v11 = _ARLogSensor();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        __int16 v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v14 = [(AVCaptureMetadataOutput *)self->_metaDataOutput faceTrackingMaxFaces];
        int v15 = [(AVCaptureMetadataOutput *)self->_metaDataOutput isFaceTrackingUsingFaceRecognition];
        __int16 v16 = @"NO";
        *(_DWORD *)buf = 138544130;
        id v93 = v13;
        __int16 v94 = 2048;
        if (v15) {
          __int16 v16 = @"YES";
        }
        v95 = self;
        __int16 v96 = 2048;
        uint64_t v97 = v14;
        __int16 v98 = 2112;
        v99 = v16;
        _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: maxFaces: %li, faceRecognition enabled: %@", buf, 0x2Au);
      }
    }
    objc_super v17 = [(AVCaptureMetadataOutput *)self->_metaDataOutput availableMetadataObjectTypes];
    __int16 v18 = [(ARImageSensor *)self settings];
    v19 = [v18 metaData];
    int v20 = [v17 containsObject:v19];

    if (v20)
    {
      uint64_t v21 = self->_metaDataOutput;
      __int16 v22 = [(ARImageSensor *)self settings];
      v23 = [v22 metaData];
      v91 = v23;
      uint64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
      [(AVCaptureMetadataOutput *)v21 setMetadataObjectTypes:v24];
    }
    else
    {
      v64 = [(ARImageSensor *)self captureSession];
      [v64 removeOutput:self->_metaDataOutput];

      __int16 v65 = self->_metaDataOutput;
      self->_metaDataOutput = 0;

      v66 = _ARLogSensor();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
      {
        __int16 v67 = (objc_class *)objc_opt_class();
        NSStringFromClass(v67);
        id v68 = (id)objc_claimAutoreleasedReturnValue();
        v69 = [(ARImageSensor *)self settings];
        v70 = [v69 metaData];
        *(_DWORD *)buf = 138544130;
        id v93 = v68;
        __int16 v94 = 2048;
        v95 = self;
        __int16 v96 = 2112;
        uint64_t v97 = (uint64_t)v70;
        __int16 v98 = 2112;
        v99 = v17;
        _os_log_impl(&dword_1B88A2000, v66, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Metadata %@ is not supported. Available metadata types are %@", buf, 0x2Au);
      }
      v71 = [(ARImageSensor *)self delegate];
      char v72 = objc_opt_respondsToSelector();

      if (v72)
      {
        v73 = [MEMORY[0x1E4F1CA60] dictionary];
        v74 = ARKitCoreBundle();
        v75 = [v74 localizedStringForKey:@"AVFoundation failed to deliver the requested metadata object types." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
        [v73 setObject:v75 forKeyedSubscript:*MEMORY[0x1E4F28588]];

        v35 = ARErrorWithCodeAndUserInfo(102, v73);

        goto LABEL_31;
      }
    }
LABEL_29:

LABEL_30:
    v76 = [(AVCaptureMetadataOutput *)self->_metaDataOutput availableMetadataObjectTypes];
    availableMetadataObjectTypes = self->_availableMetadataObjectTypes;
    self->_availableMetadataObjectTypes = v76;

    v35 = 0;
    goto LABEL_31;
  }
  v36 = (AVCaptureMetadataOutput *)objc_opt_new();
  v37 = self->_metaDataOutput;
  self->_metaDataOutput = v36;

  v38 = [(ARImageSensor *)self captureSession];
  int v39 = [v38 canAddOutput:self->_metaDataOutput];

  if (v39)
  {
    v40 = [(ARImageSensor *)self captureSession];
    [v40 addOutputWithNoConnections:self->_metaDataOutput];

    v41 = _ARLogSensor();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    {
      v42 = (objc_class *)objc_opt_class();
      v43 = NSStringFromClass(v42);
      id v44 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v93 = v43;
      __int16 v94 = 2048;
      v95 = self;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v44;
      _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added metadata output to the capture session", buf, 0x20u);
    }
    if (self->_metadataConnection) {
      goto LABEL_3;
    }
    v45 = [(ARImageSensor *)self videoInput];
    BOOL v46 = [(ARImageSensor *)self videoInput];
    v47 = [v46 device];
    v48 = [v47 deviceType];
    v49 = [(ARImageSensor *)self videoInput];
    v50 = [v49 device];
    uint64_t v51 = [v50 position];
    v52 = [v45 portsWithMediaType:*MEMORY[0x1E4F15BE8] sourceDeviceType:v48 sourceDevicePosition:v51];
    v90 = [v52 firstObject];

    if (v90)
    {
      v53 = (void *)MEMORY[0x1E4F16410];
      v100[0] = v90;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:v100 count:1];
      v55 = [v53 connectionWithInputPorts:v54 output:self->_metaDataOutput];
      metadataConnection = self->_metadataConnection;
      self->_metadataConnection = v55;

      v57 = [(ARImageSensor *)self captureSession];
      LOBYTE(v53) = [v57 canAddConnection:self->_metadataConnection];

      if (v53)
      {
        v58 = [(ARImageSensor *)self connections];
        [v58 addObject:self->_metadataConnection];

        v59 = [(ARImageSensor *)self captureSession];
        [v59 addConnection:self->_metadataConnection];

        objc_super v60 = _ARLogSensor();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          v61 = (objc_class *)objc_opt_class();
          id v62 = NSStringFromClass(v61);
          __int16 v63 = [(ARImageSensor *)self logPrefix];
          *(_DWORD *)buf = 138543874;
          id v93 = v62;
          __int16 v94 = 2048;
          v95 = self;
          __int16 v96 = 2112;
          uint64_t v97 = (uint64_t)v63;
          _os_log_impl(&dword_1B88A2000, v60, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added metadata connection to the capture session", buf, 0x20u);
        }
        goto LABEL_3;
      }
      v83 = _ARLogSensor();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v87 = (objc_class *)objc_opt_class();
        v88 = NSStringFromClass(v87);
        v89 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        id v93 = v88;
        __int16 v94 = 2048;
        v95 = self;
        __int16 v96 = 2112;
        uint64_t v97 = (uint64_t)v89;
        _os_log_impl(&dword_1B88A2000, v83, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add meta data connection to capture session.", buf, 0x20u);
      }
    }
    else
    {
      v83 = _ARLogSensor();
      if (os_log_type_enabled(v83, OS_LOG_TYPE_ERROR))
      {
        v84 = (objc_class *)objc_opt_class();
        v85 = NSStringFromClass(v84);
        v86 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        id v93 = v85;
        __int16 v94 = 2048;
        v95 = self;
        __int16 v96 = 2112;
        uint64_t v97 = (uint64_t)v86;
        _os_log_impl(&dword_1B88A2000, v83, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find meta data input port on the video input.", buf, 0x20u);
      }
    }

    v35 = ARErrorWithCodeAndUserInfo(102, 0);
  }
  else
  {
    v79 = _ARLogSensor();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_ERROR))
    {
      v80 = (objc_class *)objc_opt_class();
      v81 = NSStringFromClass(v80);
      v82 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v93 = v81;
      __int16 v94 = 2048;
      v95 = self;
      __int16 v96 = 2112;
      uint64_t v97 = (uint64_t)v82;
      _os_log_impl(&dword_1B88A2000, v79, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add mete data output to the capture session.", buf, 0x20u);
    }
    v35 = ARErrorWithCodeAndUserInfo(102, 0);
  }
LABEL_31:
  return v35;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  __int16 v10 = [v9 output];
  double v11 = [(ARImageSensor *)self videoOutput];

  if (v10 == v11)
  {
    long long v12 = *MEMORY[0x1E4F1F9F8];
    uint64_t v13 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    [(ARFaceTrackingImageSensor *)self capturedSynchedOutput:v8 didOutputSampleBuffer:a4 fromVideoConnection:v9 metaDataOutput:0 didOutputMetadataObjects:0 didOutputDepthData:0 atTime:&v12];
  }
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v40 = a3;
  id v6 = a4;
  objc_super v7 = [(ARImageSensor *)self videoOutput];
  id v8 = [v6 objectForKeyedSubscript:v7];

  int v39 = [v6 objectForKeyedSubscript:self->_metaDataOutput];
  if (self->_depthDataOutput)
  {
    v38 = objc_msgSend(v6, "objectForKeyedSubscript:");
  }
  else
  {
    v38 = 0;
  }
  id v9 = [v40 dataOutputs];
  if ([v9 containsObject:self->_metaDataOutput])
  {
    __int16 v10 = [(AVCaptureMetadataOutput *)self->_metaDataOutput metadataObjectTypes];
    uint64_t v11 = *MEMORY[0x1E4F15E48];
    if ([v10 containsObject:*MEMORY[0x1E4F15E48]])
    {
      BOOL v12 = [(NSArray *)self->_availableMetadataObjectTypes containsObject:v11];
      if (v39) {
        int v13 = 0;
      }
      else {
        int v13 = v12;
      }
    }
    else
    {
      int v13 = 0;
    }
  }
  else
  {
    int v13 = 0;
  }

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v35 = v8;
      v36 = [(ARImageSensor *)self videoOutput];
      uint64_t v34 = [v35 sampleBuffer];
      uint64_t v14 = [(ARImageSensor *)self videoOutput];
      uint64_t v15 = *MEMORY[0x1E4F15C18];
      v37 = [v14 connectionWithMediaType:*MEMORY[0x1E4F15C18]];

      if (!self->_signpostFirstFrameDone)
      {
        self->_signpostFirstFrameDone = 1;
        kdebug_trace();
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v16 = v39;
        objc_super v17 = self->_metaDataOutput;
        __int16 v18 = [v16 metadataObjects];
        if ([(NSArray *)self->_availableMetadataObjectTypes containsObject:*MEMORY[0x1E4F15E48]])
        {
          v19 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
          int v20 = [v18 filteredArrayUsingPredicate:v19];

          if (![v20 count]) {
            int v13 = 1;
          }
        }
        if (!v37)
        {
          uint64_t v21 = [(ARImageSensor *)self videoOutput];
          uint64_t v22 = [v21 connectionWithMediaType:v15];

          v37 = (void *)v22;
        }
      }
      else
      {
        objc_super v17 = 0;
        __int16 v18 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v23 = [v38 depthData];
      }
      else
      {
        v23 = 0;
      }
      uint64_t v24 = [MEMORY[0x1E4F1C9C8] date];
      [v24 timeIntervalSince1970];
      double v26 = v25;

      if (v26 - self->_startTime > 1.0)
      {
        self->_startTime = v26;
        self->_unint64_t droppedFramesPerSec = 0;
      }
      if (v13)
      {
        BOOL v27 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.face.previousImageDataOnDrop"];
        BOOL v28 = self->_previousImageDataValid && v27;
        unint64_t droppedFramesPerSec = self->_droppedFramesPerSec;
        if (v28)
        {
          self->_unint64_t droppedFramesPerSec = droppedFramesPerSec + 1;
          self->_previousImageDataValid = 0;
          kdebug_trace();
LABEL_40:
          kdebug_trace();
LABEL_47:

          goto LABEL_48;
        }
        if (droppedFramesPerSec <= 4)
        {
          self->_unint64_t droppedFramesPerSec = droppedFramesPerSec + 1;
          v30 = _ARLogSensor();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            char v31 = (objc_class *)objc_opt_class();
            v32 = NSStringFromClass(v31);
            v33 = [(ARImageSensor *)self logPrefix];
            *(_DWORD *)buf = 138543874;
            v43 = v32;
            __int16 v44 = 2048;
            v45 = self;
            __int16 v46 = 2112;
            v47 = v33;
            _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Image frame was dropped.", buf, 0x20u);
          }
          goto LABEL_40;
        }
        kdebug_trace();
      }
      if (v34)
      {
        kdebug_trace();
        if (v38) {
          [v38 timestamp];
        }
        else {
          memset(v41, 0, sizeof(v41));
        }
        [(ARFaceTrackingImageSensor *)self capturedSynchedOutput:v36 didOutputSampleBuffer:v34 fromVideoConnection:v37 metaDataOutput:v17 didOutputMetadataObjects:v18 didOutputDepthData:v23 atTime:v41];
      }
      goto LABEL_47;
    }
  }
LABEL_48:
}

uint64_t __88__ARFaceTrackingImageSensor_dataOutputSynchronizer_didOutputSynchronizedDataCollection___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)capturedSynchedOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromVideoConnection:(id)a5 metaDataOutput:(id)a6 didOutputMetadataObjects:(id)a7 didOutputDepthData:(id)a8 atTime:(id *)a9
{
  id v13 = a5;
  id v14 = a7;
  id v43 = a8;
  memset(&v50, 0, sizeof(v50));
  CMSampleBufferGetPresentationTimeStamp(&v50, a4);
  CMTime time = v50;
  CMTimeGetSeconds(&time);
  kdebug_trace();
  uint64_t v15 = [ARImageData alloc];
  int64_t v16 = [(ARImageSensor *)self captureFramesPerSecond];
  objc_super v17 = [(ARImageSensor *)self captureDevice];
  __int16 v18 = [(ARImageSensor *)self captureSession];
  v19 = [(ARImageData *)v15 initWithSampleBuffer:a4 captureFramePerSecond:v16 captureDevice:v17 captureSession:v18];

  -[ARImageData setMirrored:](v19, "setMirrored:", [v13 isVideoMirrored]);
  if (v19)
  {
    [(ARImageSensor *)self enableContinuousAutoFocusIfPossible];
    id v42 = v14;
    char v48 = 0;
    [(ARImageSensor *)self trackExposureTargetOffsetIfNeededForImageData:v19 shouldDrop:&v48];
    if (!v48)
    {
      int v20 = [(ARImageSensor *)self bufferPopulationMonitor];
      uint64_t v21 = [(ARImageData *)v19 pixelBuffer];
      uint64_t v22 = [(ARImageSensor *)self captureDevice];
      v23 = [v22 localizedName];
      [(ARImageData *)v19 timestamp];
      double v25 = v24;
      double v26 = [(ARImageSensor *)self captureDevice];
      BOOL v27 = [v26 deviceType];
      [v20 trackPixelBuffer:v21 withLabel:v23 timestamp:ARBufferPopulationMonitorSignpostTypeForCaptureDevice(v27) signpostType:v25];

      CMTime time1 = *(CMTime *)a9;
      CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
      if (CMTimeCompare(&time1, &time2))
      {
        $3CC8671D27C23BF42ADDB32F2B5E48AE v45 = *a9;
        BOOL v28 = [(ARImageSensor *)self captureSession];
        uint64_t v29 = +[ARImageData captureDateFromPresentationTimestamp:&v45 session:v28];

        [(ARImageData *)v19 timestamp];
        v30 = [(ARImageData *)v19 captureDate];
        [v30 timeIntervalSinceNow];
        [v29 timeIntervalSinceNow];
        kdebug_trace();
      }
      else
      {
        [(ARImageData *)v19 timestamp];
        uint64_t v29 = [(ARImageData *)v19 captureDate];
        [v29 timeIntervalSinceNow];
        kdebug_trace();
      }

      char v31 = [(ARImageSensor *)self outputSynchronizer];
      if (!v31) {
        goto LABEL_10;
      }
      v32 = [(ARImageSensor *)self outputSynchronizer];
      v33 = [v32 dataOutputs];
      int v34 = [v33 containsObject:self->_metaDataOutput];

      if (v34)
      {
        id v35 = -[ARFaceData initWithMetadataObjects:mirroredVideoInput:stripDetectionData:]([ARFaceData alloc], "initWithMetadataObjects:mirroredVideoInput:stripDetectionData:", v42, [v13 isVideoMirrored], -[ARFaceTrackingImageSensor recordingMode](self, "recordingMode") ^ 1);
        [(ARImageData *)v19 setFaceData:v35];
      }
      else
      {
LABEL_10:
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_faceDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        [(ARImageData *)v19 setFaceData:self->_latestFaceData];
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_faceDataSemaphore);
      }
      if (self->_depthDataOutput)
      {
        [(ARImageData *)v19 setDepthData:v43];
        CMTime v44 = *(CMTime *)a9;
        [(ARImageData *)v19 setDepthDataTimestamp:CMTimeGetSeconds(&v44)];
      }
      else
      {
        [(ARImageData *)v19 setDepthData:0];
      }
      self->_previousImageDataValid = 1;
      if (!self->_signpostFirstFaceDone)
      {
        v36 = [(ARImageData *)v19 faceData];
        v37 = [v36 faceMeshPayload];
        v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F4D7C8]];
        uint64_t v39 = [v38 count];

        if (v39)
        {
          self->_signpostFirstFaceDone = 1;
          kdebug_trace();
        }
      }
      +[ARImageSensor registerSignPostForImageData:v19];
      [(ARImageData *)v19 timestamp];
      kdebug_trace();
      id v40 = [(ARImageSensor *)self delegate];
      [v40 sensor:self didOutputSensorData:v19];

      [(ARImageData *)v19 timestamp];
      kdebug_trace();
      [(ARImageData *)v19 timestamp];
      v41 = [(ARImageData *)v19 cameraType];
      kdebug_trace();
    }
    id v14 = v42;
  }
  else
  {
    kdebug_trace();
  }
}

- (void)captureOutput:(id)a3 didOutputMetadataObjects:(id)a4 fromConnection:(id)a5
{
  id v10 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_faceDataSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v6 = [ARFaceData alloc];
  objc_super v7 = [(ARImageSensor *)self settings];
  id v8 = -[ARFaceData initWithMetadataObjects:mirroredVideoInput:stripDetectionData:](v6, "initWithMetadataObjects:mirroredVideoInput:stripDetectionData:", v10, [v7 mirrorVideoOutput], -[ARFaceTrackingImageSensor recordingMode](self, "recordingMode") ^ 1);
  latestFaceData = self->_latestFaceData;
  self->_latestFaceData = v8;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_faceDataSemaphore);
}

- (BOOL)recordingMode
{
  return self->_recordingMode;
}

- (void)setRecordingMode:(BOOL)a3
{
  self->_recordingMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadataConnection, 0);
  objc_storeStrong((id *)&self->_depthConnection, 0);
  objc_storeStrong((id *)&self->_faceDataSemaphore, 0);
  objc_storeStrong((id *)&self->_latestFaceData, 0);
  objc_storeStrong((id *)&self->_depthDataOutput, 0);
  objc_storeStrong((id *)&self->_availableMetadataObjectTypes, 0);
  objc_storeStrong((id *)&self->_metaDataOutput, 0);
}

@end