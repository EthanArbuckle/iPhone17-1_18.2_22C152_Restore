@interface ARImageSensor
+ ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensionsForVideoFormat:(id)a3 maximumHeight:(int)a4;
+ (float)defaultLensPosition;
+ (void)registerSignPostForImageData:(id)a3;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_createCMTimeFractionFromDecimalDuration:(SEL)a3;
- (ARBufferPopulationMonitor)bufferPopulationMonitor;
- (ARImageSensor)init;
- (ARImageSensor)initWithSettings:(id)a3 captureSession:(id)a4 captureQueue:(id)a5;
- (ARImageSensorDataSource)dataSource;
- (ARImageSensorSettings)mutableSettings;
- (ARImageSensorSettings)settings;
- (ARSensorDelegate)delegate;
- (AVCaptureCameraCalibrationDataOutput)calibrationOutput;
- (AVCaptureConnection)calibrationConnection;
- (AVCaptureConnection)videoConnection;
- (AVCaptureConnection)visionDataConnection;
- (AVCaptureDataOutputSynchronizer)outputSynchronizer;
- (AVCaptureDevice)captureDevice;
- (AVCaptureDeviceInput)videoInput;
- (AVCapturePhotoOutput)photoOutput;
- (AVCaptureSession)captureSession;
- (AVCaptureVideoDataOutput)videoOutput;
- (BOOL)canReconfigure:(id)a3;
- (BOOL)interrupted;
- (BOOL)runningSingleShotAutoFocus;
- (NSArray)outputsForSynchronizer;
- (NSMutableArray)connections;
- (NSString)description;
- (OS_dispatch_queue)captureQueue;
- (float)defaultLensPosition;
- (id)_configurePhotoOutputForCaptureSession:(id)a3;
- (id)_configureVisionDataOutputForSession:(id)a3;
- (id)_defaultPhotoSettings;
- (id)configureCaptureSession;
- (id)configureCaptureSessionCalibration;
- (id)logPrefix;
- (id)prepareToStart;
- (id)setActiveFormat;
- (int64_t)captureFramesPerSecond;
- (unint64_t)powerUsage;
- (unint64_t)providedDataTypes;
- (void)_configureCameraExposureForDevice:(id)a3;
- (void)_configureCameraFocusForDevice:(id)a3;
- (void)_configureCameraWhiteBalanceForDevice:(id)a3;
- (void)_configureFrameRateForDevice:(id)a3 frameRate:(double)a4;
- (void)_configureImageControlModeForDevice:(id)a3;
- (void)_dispatchImageData:(id)a3;
- (void)_logIfDataIsMissingWithVideoData:(id)a3 visionData:(id)a4 calibrationData:(id)a5;
- (void)cameraCalibrationDataOutput:(id)a3 didDropCameraCalibrationDataAtTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6;
- (void)cameraCalibrationDataOutput:(id)a3 didOutputCameraCalibrationData:(id)a4 timestamp:(id *)a5 connection:(id)a6;
- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3;
- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)configureCaptureDevice;
- (void)configureFrameRateForDevice:(id)a3;
- (void)configureGeometricDistortionCorrectionForDevice:(id)a3;
- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4;
- (void)dealloc;
- (void)enableAutoFocusForDevice:(id)a3;
- (void)enableContinuousAutoFocusIfPossible;
- (void)enableSensor:(BOOL)a3;
- (void)forceUpdatePowerUsage:(unint64_t)a3;
- (void)reconfigure:(id)a3;
- (void)resetExposureTracking;
- (void)setBufferPopulationMonitor:(id)a3;
- (void)setCaptureFramesPerSecond:(int64_t)a3;
- (void)setConnections:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setDefaultLensPosition:(float)a3;
- (void)setDelegate:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setPowerUsage:(unint64_t)a3;
- (void)setRunningSingleShotAutoFocus:(BOOL)a3;
- (void)setVideoConnection:(id)a3;
- (void)setVideoInput:(id)a3;
- (void)start;
- (void)stop;
- (void)teardown;
- (void)trackExposureTargetOffsetIfNeededForImageData:(id)a3 shouldDrop:(BOOL *)a4;
- (void)triggerVisionDataBurst;
- (void)updateCaptureDeviceFrameRate:(double)a3;
@end

@implementation ARImageSensor

- (ARImageSensor)initWithSettings:(id)a3 captureSession:(id)a4 captureQueue:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (OS_dispatch_queue *)a5;
  v11 = [v8 videoFormat];
  v12 = [v11 device];

  if (v12)
  {
    v35.receiver = self;
    v35.super_class = (Class)ARImageSensor;
    v13 = [(ARImageSensor *)&v35 init];
    if (v13)
    {
      uint64_t v14 = [v8 copy];
      settings = v13->_settings;
      v13->_settings = (ARImageSensorSettings *)v14;

      if ([v8 autoFocusEnabled]) {
        float v16 = *MEMORY[0x1E4F15868];
      }
      else {
        +[ARImageSensor defaultLensPosition];
      }
      v13->_defaultLensPosition = v16;
      objc_storeStrong((id *)&v13->_captureSession, a4);
      v18 = [v8 videoFormat];
      uint64_t v19 = [v18 device];
      captureDevice = v13->_captureDevice;
      v13->_captureDevice = (AVCaptureDevice *)v19;

      v13->_captureQueue = v10;
      v13->_powerUsage = 0;
      uint64_t v21 = objc_opt_new();
      connections = v13->_connections;
      v13->_connections = (NSMutableArray *)v21;

      uint64_t v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"deviceWhiteBalanceGains", @"exposureTargetOffset", @"ISO", 0);
      captureDeviceKeysObserved = v13->_captureDeviceKeysObserved;
      v13->_captureDeviceKeysObserved = (NSMutableArray *)v23;

      long long v33 = 0u;
      long long v34 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      v25 = v13->_captureDeviceKeysObserved;
      uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v32;
        do
        {
          uint64_t v29 = 0;
          do
          {
            if (*(void *)v32 != v28) {
              objc_enumerationMutation(v25);
            }
            [(AVCaptureDevice *)v13->_captureDevice addObserver:v13 forKeyPath:*(void *)(*((void *)&v31 + 1) + 8 * v29++) options:1 context:v13];
          }
          while (v27 != v29);
          uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v31 objects:v36 count:16];
        }
        while (v27);
      }
    }
    self = v13;
    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (ARImageSensor)init
{
}

- (void)dealloc
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v4 = (objc_class *)objc_opt_class();
    v5 = NSStringFromClass(v4);
    v6 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    id v9 = v5;
    __int16 v10 = 2048;
    v11 = self;
    __int16 v12 = 2112;
    v13 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ dealloc", buf, 0x20u);
  }
  [(ARImageSensor *)self stop];
  [(ARImageSensor *)self teardown];
  v7.receiver = self;
  v7.super_class = (Class)ARImageSensor;
  [(ARImageSensor *)&v7 dealloc];
}

- (ARImageSensorSettings)settings
{
  v2 = (void *)[(ARImageSensorSettings *)self->_settings copy];
  return (ARImageSensorSettings *)v2;
}

- (ARImageSensorSettings)mutableSettings
{
  return self->_settings;
}

- (NSArray)outputsForSynchronizer
{
  if (self->_visionDataOutput || self->_calibrationOutput)
  {
    v3 = objc_opt_new();
    v4 = v3;
    if (self->_videoOutput) {
      objc_msgSend(v3, "addObject:");
    }
    if (self->_visionDataOutput) {
      objc_msgSend(v4, "addObject:");
    }
    if (self->_calibrationOutput) {
      objc_msgSend(v4, "addObject:");
    }
  }
  else
  {
    v4 = 0;
  }
  return (NSArray *)v4;
}

- (BOOL)canReconfigure:(id)a3
{
  settings = self->_settings;
  id v4 = a3;
  v5 = (void *)[(ARImageSensorSettings *)settings copy];
  objc_msgSend(v5, "setAutoFocusEnabled:", objc_msgSend(v4, "autoFocusEnabled"));
  objc_msgSend(v5, "setEnabled:", objc_msgSend(v4, "isEnabled"));
  char v6 = [v5 isEqual:v4];

  return v6;
}

- (void)reconfigure:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ARImageSensor *)self canReconfigure:v4])
  {
    int v5 = [v4 autoFocusEnabled];
    if (v5 != [(ARImageSensorSettings *)self->_settings autoFocusEnabled])
    {
      -[ARImageSensorSettings setAutoFocusEnabled:](self->_settings, "setAutoFocusEnabled:", [v4 autoFocusEnabled]);
      LODWORD(v6) = *MEMORY[0x1E4F15868];
      [(ARImageSensor *)self setDefaultLensPosition:v6];
      captureDevice = self->_captureDevice;
      id v18 = 0;
      BOOL v8 = [(AVCaptureDevice *)captureDevice lockForConfiguration:&v18];
      id v9 = v18;
      if (v8)
      {
        [(ARImageSensor *)self _configureCameraFocusForDevice:self->_captureDevice];
        [(AVCaptureDevice *)self->_captureDevice unlockForConfiguration];
      }
      else
      {
        __int16 v10 = _ARLogSensor_9();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v11 = (objc_class *)objc_opt_class();
          __int16 v12 = NSStringFromClass(v11);
          v13 = [(ARImageSensor *)self logPrefix];
          uint64_t v14 = [v9 description];
          *(_DWORD *)buf = 138544130;
          v20 = v12;
          __int16 v21 = 2048;
          v22 = self;
          __int16 v23 = 2112;
          v24 = v13;
          __int16 v25 = 2112;
          uint64_t v26 = v14;
          _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock device for configuring focus mode change: %@", buf, 0x2Au);
        }
      }
    }
    int v15 = [v4 isEnabled];
    if (v15 != [(ARImageSensorSettings *)self->_settings isEnabled])
    {
      -[ARImageSensorSettings setEnabled:](self->_settings, "setEnabled:", [v4 isEnabled]);
      float v16 = [(ARImageSensor *)self captureSession];
      [v16 beginConfiguration];

      [(ARImageSensor *)self enableSensor:[(ARImageSensorSettings *)self->_settings isEnabled]];
      v17 = [(ARImageSensor *)self captureSession];
      [v17 commitConfiguration];
    }
  }
}

- (id)logPrefix
{
  v3 = [(ARImageSensor *)self settings];
  id v4 = [v3 videoFormat];
  int v5 = [v4 captureDeviceType];

  double v6 = [(ARImageSensor *)self settings];
  objc_super v7 = [v6 videoFormat];
  BOOL v8 = NSStringFromAVCaptureDevicePosition([v7 captureDevicePosition]);

  id v9 = [NSString stringWithFormat:@"(%@ - %@):", v5, v8];

  return v9;
}

- (void)triggerVisionDataBurst
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    double v6 = [(ARImageSensor *)self logPrefix];
    int v7 = 138543874;
    BOOL v8 = v5;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2112;
    __int16 v12 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Vision data burst triggered", (uint8_t *)&v7, 0x20u);
  }
  [(AVCaptureVisionDataOutput *)self->_visionDataOutput triggerBurst];
}

- (unint64_t)providedDataTypes
{
  return 1;
}

- (id)prepareToStart
{
  v84[1] = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    double v6 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    id v74 = v5;
    __int16 v75 = 2048;
    v76 = self;
    __int16 v77 = 2112;
    uint64_t v78 = (uint64_t)v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ preparing to start", buf, 0x20u);
  }
  int v7 = [(ARImageSensor *)self setActiveFormat];
  if (v7
    || ([(ARImageSensor *)self configureCaptureSession],
        (int v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = v7;
    goto LABEL_6;
  }
  __int16 v10 = [(ARImageSensor *)self outputsForSynchronizer];
  __int16 v11 = [(AVCaptureDataOutputSynchronizer *)self->_outputSynchronizer dataOutputs];
  char v12 = [v11 isEqualToArray:v10];

  if ((unint64_t)[v10 count] < 2 || (v12 & 1) == 0)
  {
    [(AVCaptureDataOutputSynchronizer *)self->_outputSynchronizer setDelegate:0 queue:0];
    outputSynchronizer = self->_outputSynchronizer;
    self->_outputSynchronizer = 0;
  }
  if ((unint64_t)[v10 count] < 2) {
    char v14 = 1;
  }
  else {
    char v14 = v12;
  }
  if ((v14 & 1) == 0)
  {
    int v15 = _ARLogSensor_9();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      float v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      id v18 = [(ARImageSensor *)self logPrefix];
      uint64_t v19 = [v10 description];
      *(_DWORD *)buf = 138544130;
      id v74 = v17;
      __int16 v75 = 2048;
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v18;
      __int16 v79 = 2112;
      Float64 v80 = *(double *)&v19;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Outputs added to synchronizer: %@", buf, 0x2Au);
    }
    v20 = (AVCaptureDataOutputSynchronizer *)[objc_alloc(MEMORY[0x1E4F16418]) initWithDataOutputs:v10];
    __int16 v21 = self->_outputSynchronizer;
    self->_outputSynchronizer = v20;
  }
  [(AVCaptureDataOutputSynchronizer *)self->_outputSynchronizer setDelegate:self queue:self->_captureQueue];
  v22 = [(ARImageSensor *)self captureDevice];
  id v72 = 0;
  int v23 = [v22 lockForConfiguration:&v72];
  id v24 = v72;

  if (v23)
  {
    [(ARImageSensor *)self configureCaptureDevice];
    __int16 v25 = [(ARImageSensor *)self captureDevice];
    [v25 unlockForConfiguration];
    id v8 = v24;
  }
  else
  {
    uint64_t v26 = _ARLogSensor_9();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      uint64_t v27 = (objc_class *)objc_opt_class();
      uint64_t v28 = NSStringFromClass(v27);
      uint64_t v29 = [(ARImageSensor *)self logPrefix];
      v30 = [v24 description];
      *(_DWORD *)buf = 138544130;
      id v74 = v28;
      __int16 v75 = 2048;
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v29;
      __int16 v79 = 2112;
      Float64 v80 = *(double *)&v30;
      _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device for configuration: %@", buf, 0x2Au);
    }
    if (v24)
    {
      uint64_t v83 = *MEMORY[0x1E4F28A50];
      v84[0] = v24;
      __int16 v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v84 forKeys:&v83 count:1];
    }
    else
    {
      __int16 v25 = (void *)MEMORY[0x1E4F1CC08];
    }
    ARErrorWithCodeAndUserInfo(101, v25);
    id v8 = (id)objc_claimAutoreleasedReturnValue();

    if (!v24) {
      goto LABEL_28;
    }
  }

LABEL_28:
  if (v8)
  {
    id v31 = v8;
  }
  else
  {
    long long v32 = [(AVCaptureVideoDataOutput *)self->_videoOutput connectionWithMediaType:*MEMORY[0x1E4F15C18]];
    int v33 = [v32 isCameraIntrinsicMatrixDeliverySupported];
    if (v33) {
      [v32 setCameraIntrinsicMatrixDeliveryEnabled:1];
    }
    long long v34 = _ARLogSensor_9();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      objc_super v35 = (objc_class *)objc_opt_class();
      v36 = NSStringFromClass(v35);
      uint64_t v37 = [(ARImageSensor *)self logPrefix];
      v38 = (void *)v37;
      v39 = @"unsupported";
      *(_DWORD *)buf = 138544130;
      __int16 v75 = 2048;
      id v74 = v36;
      if (v33) {
        v39 = @"supported";
      }
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = v37;
      __int16 v79 = 2112;
      Float64 v80 = *(double *)&v39;
      _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Intrinsics delivery is %@ by the connection", buf, 0x2Au);
    }
    v40 = _ARLogSensor_9();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = (objc_class *)objc_opt_class();
      v42 = NSStringFromClass(v41);
      v43 = [(ARImageSensor *)self logPrefix];
      v44 = [(AVCaptureDevice *)self->_captureDevice activeFormat];
      v45 = v44;
      if (v44) {
        [v44 minExposureDuration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      v47 = [(AVCaptureDevice *)self->_captureDevice activeFormat];
      v48 = v47;
      if (v47) {
        [v47 maxExposureDuration];
      }
      else {
        memset(&v70, 0, sizeof(v70));
      }
      Float64 v49 = CMTimeGetSeconds(&v70);
      *(_DWORD *)buf = 138544386;
      id v74 = v42;
      __int16 v75 = 2048;
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v43;
      __int16 v79 = 2048;
      Float64 v80 = Seconds;
      __int16 v81 = 2048;
      Float64 v82 = v49;
      _os_log_impl(&dword_1B88A2000, v40, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Exposure duration supported: %f - %f", buf, 0x34u);
    }
    v50 = _ARLogSensor_9();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      v51 = (objc_class *)objc_opt_class();
      NSStringFromClass(v51);
      id v52 = (id)objc_claimAutoreleasedReturnValue();
      id v53 = [(ARImageSensor *)self logPrefix];
      captureDevice = self->_captureDevice;
      if (captureDevice) {
        [(AVCaptureDevice *)captureDevice activeVideoMinFrameDuration];
      }
      else {
        memset(&v69, 0, sizeof(v69));
      }
      Float64 v55 = CMTimeGetSeconds(&v69);
      v56 = self->_captureDevice;
      if (v56) {
        [(AVCaptureDevice *)v56 activeVideoMaxFrameDuration];
      }
      else {
        memset(&v68, 0, sizeof(v68));
      }
      Float64 v57 = CMTimeGetSeconds(&v68);
      *(_DWORD *)buf = 138544386;
      id v74 = v52;
      __int16 v75 = 2048;
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v53;
      __int16 v79 = 2048;
      Float64 v80 = v55;
      __int16 v81 = 2048;
      Float64 v82 = v57;
      _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Video frame duration: %f - %f", buf, 0x34u);
    }
    v58 = _ARLogSensor_9();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      v59 = (objc_class *)objc_opt_class();
      v60 = NSStringFromClass(v59);
      v61 = [(ARImageSensor *)self logPrefix];
      if ([(AVCaptureDevice *)self->_captureDevice isVideoHDREnabled]) {
        v62 = @"Enabled";
      }
      else {
        v62 = @"Disabled";
      }
      if ([(AVCaptureDevice *)self->_captureDevice automaticallyAdjustsVideoHDREnabled])
      {
        *(double *)&v63 = COERCE_DOUBLE(@"Enabled");
      }
      else
      {
        *(double *)&v63 = COERCE_DOUBLE(@"Disabled");
      }
      *(_DWORD *)buf = 138544386;
      id v74 = v60;
      __int16 v75 = 2048;
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v61;
      __int16 v79 = 2112;
      Float64 v80 = *(double *)&v62;
      __int16 v81 = 2112;
      Float64 v82 = *(double *)&v63;
      _os_log_impl(&dword_1B88A2000, v58, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Video HDR: %@, Automatically adjusts video HDR: %@", buf, 0x34u);
    }
    v64 = _ARLogSensor_9();
    if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
    {
      v65 = (objc_class *)objc_opt_class();
      v66 = NSStringFromClass(v65);
      v67 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v74 = v66;
      __int16 v75 = 2048;
      v76 = self;
      __int16 v77 = 2112;
      uint64_t v78 = (uint64_t)v67;
      _os_log_impl(&dword_1B88A2000, v64, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ prepare to start complete", buf, 0x20u);
    }
  }

LABEL_6:
  return v8;
}

- (void)stop
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(AVCaptureDataOutputSynchronizer *)self->_outputSynchronizer setDelegate:0 queue:0];
  [(AVCaptureVideoDataOutput *)self->_videoOutput setSampleBufferDelegate:0 queue:0];
  [(AVCaptureCameraCalibrationDataOutput *)self->_calibrationOutput setDelegate:0 callbackQueue:0];
  [(ARImageSensor *)self resetExposureTracking];
  v3 = _ARLogSensor_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    double v6 = [(ARImageSensor *)self logPrefix];
    int v7 = 138543874;
    id v8 = v5;
    __int16 v9 = 2048;
    __int16 v10 = self;
    __int16 v11 = 2112;
    char v12 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARImageSensor stop complete", (uint8_t *)&v7, 0x20u);
  }
}

- (void)teardown
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = self->_captureDeviceKeysObserved;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[AVCaptureDevice removeObserver:forKeyPath:context:](self->_captureDevice, "removeObserver:forKeyPath:context:", self, *(void *)(*((void *)&v9 + 1) + 8 * v7++), self, (void)v9);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  [(NSMutableArray *)self->_captureDeviceKeysObserved removeAllObjects];
  if (self->_videoInput)
  {
    -[AVCaptureSession removeInput:](self->_captureSession, "removeInput:");
    videoInput = self->_videoInput;
    self->_videoInput = 0;
  }
}

- (void)start
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = _ARLogSensor_9();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    uint64_t v6 = [(ARImageSensor *)self logPrefix];
    int v7 = 138543874;
    id v8 = v5;
    __int16 v9 = 2048;
    long long v10 = self;
    __int16 v11 = 2112;
    long long v12 = v6;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ start called on a child image sensor instead of parent image sensor", (uint8_t *)&v7, 0x20u);
  }
}

- (void)forceUpdatePowerUsage:(unint64_t)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _ARLogSensor_9();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    id v8 = [(ARImageSensor *)self logPrefix];
    unint64_t powerUsage = self->_powerUsage;
    *(_DWORD *)buf = 138544386;
    id v30 = v7;
    __int16 v31 = 2048;
    long long v32 = self;
    __int16 v33 = 2112;
    id v34 = v8;
    __int16 v35 = 2048;
    Float64 v36 = *(double *)&powerUsage;
    __int16 v37 = 2048;
    unint64_t v38 = a3;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Power usage changed from %li to %li", buf, 0x34u);
  }
  self->_unint64_t powerUsage = a3;
  captureDevice = self->_captureDevice;
  id v28 = 0;
  BOOL v11 = [(AVCaptureDevice *)captureDevice lockForConfiguration:&v28];
  id v12 = v28;
  if (v11)
  {
    [(ARImageSensor *)self configureFrameRateForDevice:self->_captureDevice];
    uint64_t v13 = _ARLogSensor_9();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = [(ARImageSensor *)self logPrefix];
      v17 = self->_captureDevice;
      if (v17) {
        [(AVCaptureDevice *)v17 activeVideoMinFrameDuration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      id v24 = self->_captureDevice;
      if (v24) {
        [(AVCaptureDevice *)v24 activeVideoMaxFrameDuration];
      }
      else {
        memset(&v26, 0, sizeof(v26));
      }
      Float64 v25 = CMTimeGetSeconds(&v26);
      *(_DWORD *)buf = 138544386;
      id v30 = v15;
      __int16 v31 = 2048;
      long long v32 = self;
      __int16 v33 = 2112;
      id v34 = v16;
      __int16 v35 = 2048;
      Float64 v36 = Seconds;
      __int16 v37 = 2048;
      unint64_t v38 = *(void *)&v25;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Power usage changed, video frame duration adjusted to %f-%f", buf, 0x34u);
    }
    [(AVCaptureDevice *)self->_captureDevice unlockForConfiguration];
  }
  else
  {
    id v18 = _ARLogSensor_9();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      uint64_t v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      __int16 v21 = [(ARImageSensor *)self logPrefix];
      v22 = [v12 description];
      *(_DWORD *)buf = 138544130;
      id v30 = v20;
      __int16 v31 = 2048;
      long long v32 = self;
      __int16 v33 = 2112;
      id v34 = v21;
      __int16 v35 = 2112;
      Float64 v36 = *(double *)&v22;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device to change frame rate due to power usage: %@", buf, 0x2Au);
    }
  }
}

- (void)setPowerUsage:(unint64_t)a3
{
  if (self->_powerUsage != a3) {
    -[ARImageSensor forceUpdatePowerUsage:](self, "forceUpdatePowerUsage:");
  }
}

- (void)enableSensor:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [(ARImageSensor *)self connections];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v8++) setEnabled:v3];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (NSString)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  v14.receiver = self;
  v14.super_class = (Class)ARImageSensor;
  uint64_t v4 = [(ARImageSensor *)&v14 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ ", v4];

  uint64_t v6 = [(ARImageSensor *)self captureDevice];
  [v5 appendFormat:@" %@", v6];

  uint64_t v7 = [(ARImageSensor *)self captureDevice];
  uint64_t v8 = [v7 deviceType];
  [v5 appendFormat:@" %@", v8];

  long long v9 = [(ARImageSensor *)self captureDevice];
  long long v10 = NSStringFromAVCaptureDevicePosition([v9 position]);
  [v5 appendFormat:@" %@", v10];

  objc_msgSend(v5, "appendFormat:", @" (%li fps)\n", -[ARImageSensor captureFramesPerSecond](self, "captureFramesPerSecond"));
  long long v11 = [(ARImageSensorSettings *)self->_settings description];
  long long v12 = [v11 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v5 appendFormat:@"%@\n", v12];

  return (NSString *)v5;
}

- (id)configureCaptureSession
{
  uint64_t v131 = *MEMORY[0x1E4F143B8];
  videoInput = self->_videoInput;
  if (videoInput)
  {
    uint64_t v4 = [(AVCaptureDeviceInput *)videoInput device];
    captureDevice = self->_captureDevice;

    if (v4 != captureDevice)
    {
      uint64_t v6 = _ARLogSensor_9();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        long long v9 = [(ARImageSensor *)self logPrefix];
        double v10 = [(AVCaptureDeviceInput *)self->_videoInput device];
        *(_DWORD *)buf = 138544130;
        v122 = v8;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v9;
        __int16 v127 = 2112;
        Float64 v128 = v10;
        _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported capture device: %@", buf, 0x2Au);
      }
LABEL_19:

      v42 = ARErrorWithCodeAndUserInfo(150, 0);
      goto LABEL_86;
    }
    long long v11 = [(AVCaptureDeviceInput *)self->_videoInput device];
    long long v12 = [v11 activeFormat];
    FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)[v12 formatDescription]);

    if (MediaSubType != 875704422)
    {
      uint64_t v6 = _ARLogSensor_9();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        uint64_t v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138544130;
        v122 = v40;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v41;
        __int16 v127 = 1024;
        LODWORD(v128) = MediaSubType;
        _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unsupported pixel format: %d", buf, 0x26u);
      }
      goto LABEL_19;
    }
    if (self->_videoInput)
    {
      id v14 = 0;
      goto LABEL_50;
    }
  }
  id v15 = objc_alloc(MEMORY[0x1E4F16450]);
  id v16 = self->_captureDevice;
  id v117 = 0;
  v17 = (AVCaptureDeviceInput *)[v15 initWithDevice:v16 error:&v117];
  id v14 = v117;
  id v18 = self->_videoInput;
  self->_videoInput = v17;

  uint64_t v19 = self->_videoInput;
  if (v19)
  {
    [(AVCaptureDeviceInput *)v19 setCenterStageAllowed:0];
    [(AVCaptureDeviceInput *)self->_videoInput setBackgroundBlurAllowed:0];
    if (![(ARImageSensorSettings *)self->_settings visionDataOutputEnabled]) {
      goto LABEL_24;
    }
    v20 = [(ARImageSensor *)self captureDevice];
    __int16 v21 = [v20 activeFormat];
    int v22 = [v21 isVisionDataDeliverySupported];

    if (v22)
    {
      [(AVCaptureDeviceInput *)self->_videoInput setVisionDataDeliveryEnabled:1];
      int v23 = _ARLogSensor_9();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        id v24 = (objc_class *)objc_opt_class();
        Float64 v25 = NSStringFromClass(v24);
        CMTime v26 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v122 = v25;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v26;
        uint64_t v27 = "%{public}@ <%p>: %@ Vision data delivery enabled";
        id v28 = v23;
        os_log_type_t v29 = OS_LOG_TYPE_DEFAULT;
LABEL_22:
        _os_log_impl(&dword_1B88A2000, v28, v29, v27, buf, 0x20u);
      }
    }
    else
    {
      int v23 = _ARLogSensor_9();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v43 = (objc_class *)objc_opt_class();
        Float64 v25 = NSStringFromClass(v43);
        CMTime v26 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v122 = v25;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v26;
        uint64_t v27 = "%{public}@ <%p>: %@ Vision data delivery requested but not supported by device format. Sensor will continu"
              "e with standard outputs.";
        id v28 = v23;
        os_log_type_t v29 = OS_LOG_TYPE_ERROR;
        goto LABEL_22;
      }
    }

LABEL_24:
    [(ARImageSensorSettings *)self->_settings maxGainOverride];
    if (v44 <= 0.0)
    {
LABEL_32:
      if ([(ARImageSensorSettings *)self->_settings calibrationDataOutputEnabled])
      {
        Float64 v55 = [(AVCaptureDevice *)self->_captureDevice activeFormat];
        int v56 = [v55 isCameraCalibrationDataDeliverySupported];

        if (v56)
        {
          [(AVCaptureDeviceInput *)self->_videoInput setCameraCalibrationDataDeliveryEnabled:1];
        }
        else
        {
          Float64 v57 = _ARLogSensor_9();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_ERROR))
          {
            v58 = (objc_class *)objc_opt_class();
            v59 = NSStringFromClass(v58);
            v60 = [(ARImageSensor *)self logPrefix];
            *(_DWORD *)buf = 138543874;
            v122 = v59;
            __int16 v123 = 2048;
            v124 = self;
            __int16 v125 = 2112;
            v126 = v60;
            _os_log_impl(&dword_1B88A2000, v57, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Does not support camera calibration delivery", buf, 0x20u);
          }
        }
      }
      if (![(AVCaptureSession *)self->_captureSession canAddInput:self->_videoInput])
      {
        v76 = _ARLogSensor_9();
        if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
        {
LABEL_70:

          uint64_t v82 = 102;
          __int16 v81 = 0;
          goto LABEL_71;
        }
        __int16 v77 = (objc_class *)objc_opt_class();
        uint64_t v78 = NSStringFromClass(v77);
        __int16 v79 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v122 = v78;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v79;
        Float64 v80 = "%{public}@ <%p>: %@ Cannot add video data input to the capture session";
LABEL_69:
        _os_log_impl(&dword_1B88A2000, v76, OS_LOG_TYPE_ERROR, v80, buf, 0x20u);

        goto LABEL_70;
      }
      [(AVCaptureSession *)self->_captureSession addInputWithNoConnections:self->_videoInput];
      v61 = _ARLogSensor_9();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        v64 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v122 = v63;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v64;
        _os_log_impl(&dword_1B88A2000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data input to the capture session", buf, 0x20u);
      }
      v65 = [(ARImageSensorSettings *)self->_settings videoFormat];
      v66 = [v65 frameRatesByPowerUsage];
      v67 = [v66 objectAtIndexedSubscript:0];
      [v67 doubleValue];
      double v69 = v68;

      CMTimeMake(&v116, 1, (int)v69);
      CMTime v70 = self->_videoInput;
      CMTime v115 = v116;
      [(AVCaptureDeviceInput *)v70 setVideoMinFrameDurationOverride:&v115];
      v71 = _ARLogSensor_9();
      if (os_log_type_enabled(v71, OS_LOG_TYPE_DEFAULT))
      {
        id v72 = (objc_class *)objc_opt_class();
        v73 = NSStringFromClass(v72);
        id v74 = [(ARImageSensor *)self logPrefix];
        __int16 v75 = self->_videoInput;
        if (v75) {
          [(AVCaptureDeviceInput *)v75 videoMinFrameDurationOverride];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        Float64 Seconds = CMTimeGetSeconds(&time);
        *(_DWORD *)buf = 138544130;
        v122 = v73;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v74;
        __int16 v127 = 2048;
        Float64 v128 = Seconds;
        _os_log_impl(&dword_1B88A2000, v71, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Video min frame duration override set to %f", buf, 0x2Au);
      }
LABEL_50:
      if (self->_videoOutput) {
        goto LABEL_55;
      }
      v84 = (AVCaptureVideoDataOutput *)objc_opt_new();
      videoOutput = self->_videoOutput;
      self->_videoOutput = v84;

      if ([(AVCaptureSession *)self->_captureSession canAddOutput:self->_videoOutput])
      {
        [(AVCaptureSession *)self->_captureSession addOutputWithNoConnections:self->_videoOutput];
        v86 = _ARLogSensor_9();
        if (os_log_type_enabled(v86, OS_LOG_TYPE_DEBUG))
        {
          v87 = (objc_class *)objc_opt_class();
          v88 = NSStringFromClass(v87);
          v89 = [(ARImageSensor *)self logPrefix];
          *(_DWORD *)buf = 138543874;
          v122 = v88;
          __int16 v123 = 2048;
          v124 = self;
          __int16 v125 = 2112;
          v126 = v89;
          _os_log_impl(&dword_1B88A2000, v86, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data output to the capture session", buf, 0x20u);
        }
LABEL_55:
        v90 = self->_videoInput;
        if (self->_videoConnection) {
          goto LABEL_56;
        }
        uint64_t v93 = *MEMORY[0x1E4F15C18];
        v94 = [(AVCaptureDeviceInput *)self->_videoInput device];
        v95 = [v94 deviceType];
        v96 = [(AVCaptureDeviceInput *)self->_videoInput device];
        v97 = -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](v90, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v93, v95, [v96 position]);
        Float64 v36 = [v97 firstObject];

        if (v36)
        {
          v98 = (void *)MEMORY[0x1E4F16410];
          v118 = v36;
          v99 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v118 count:1];
          v100 = [v98 connectionWithInputPorts:v99 output:self->_videoOutput];
          videoConnection = self->_videoConnection;
          self->_videoConnection = v100;

          if ([(AVCaptureSession *)self->_captureSession canAddConnection:self->_videoConnection])
          {
            [(NSMutableArray *)self->_connections addObject:self->_videoConnection];
            [(AVCaptureSession *)self->_captureSession addConnection:self->_videoConnection];
            v102 = _ARLogSensor_9();
            if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
            {
              v103 = (objc_class *)objc_opt_class();
              v104 = NSStringFromClass(v103);
              v105 = [(ARImageSensor *)self logPrefix];
              *(_DWORD *)buf = 138543874;
              v122 = v104;
              __int16 v123 = 2048;
              v124 = self;
              __int16 v125 = 2112;
              v126 = v105;
              _os_log_impl(&dword_1B88A2000, v102, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added video data connection to the capture session", buf, 0x20u);
            }
            v90 = self->_videoInput;
LABEL_56:
            if ([(AVCaptureDeviceInput *)v90 isCameraCalibrationDataDeliveryEnabled])
            {
              v91 = [(ARImageSensor *)self configureCaptureSessionCalibration];

              if (v91)
              {
LABEL_61:
                id v92 = v91;
LABEL_83:
                id v14 = v92;
                goto LABEL_84;
              }
              id v14 = 0;
            }
            [(AVCaptureVideoDataOutput *)self->_videoOutput setAlwaysDiscardsLateVideoFrames:1];
            [(AVCaptureVideoDataOutput *)self->_videoOutput setSampleBufferDelegate:self queue:self->_captureQueue];
            if ([(AVCaptureDeviceInput *)self->_videoInput isVisionDataDeliveryEnabled])
            {
              v91 = [(ARImageSensor *)self _configureVisionDataOutputForSession:self->_captureSession];

              if (v91) {
                goto LABEL_61;
              }
              id v14 = 0;
            }
            if (![(ARImageSensorSettings *)self->_settings supportsCapturingHighResolutionFrames])
            {
              v42 = 0;
              goto LABEL_85;
            }
            v42 = [(ARImageSensor *)self _configurePhotoOutputForCaptureSession:self->_captureSession];

            if (!v42)
            {
              id v14 = 0;
              goto LABEL_85;
            }
            id v92 = v42;
            goto LABEL_83;
          }
          v107 = _ARLogSensor_9();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR)) {
            goto LABEL_77;
          }
          v112 = (objc_class *)objc_opt_class();
          v109 = NSStringFromClass(v112);
          v110 = [(ARImageSensor *)self logPrefix];
          *(_DWORD *)buf = 138543874;
          v122 = v109;
          __int16 v123 = 2048;
          v124 = self;
          __int16 v125 = 2112;
          v126 = v110;
          v111 = "%{public}@ <%p>: %@ Cannot add video connection to capture session";
        }
        else
        {
          v107 = _ARLogSensor_9();
          if (!os_log_type_enabled(v107, OS_LOG_TYPE_ERROR))
          {
LABEL_77:

            uint64_t v37 = 102;
            unint64_t v38 = 0;
            goto LABEL_78;
          }
          v108 = (objc_class *)objc_opt_class();
          v109 = NSStringFromClass(v108);
          v110 = [(ARImageSensor *)self logPrefix];
          *(_DWORD *)buf = 138543874;
          v122 = v109;
          __int16 v123 = 2048;
          v124 = self;
          __int16 v125 = 2112;
          v126 = v110;
          v111 = "%{public}@ <%p>: %@ Cannot find a video port in the input added to the capture session";
        }
        _os_log_impl(&dword_1B88A2000, v107, OS_LOG_TYPE_ERROR, v111, buf, 0x20u);

        goto LABEL_77;
      }
      v76 = _ARLogSensor_9();
      if (!os_log_type_enabled(v76, OS_LOG_TYPE_ERROR)) {
        goto LABEL_70;
      }
      v106 = (objc_class *)objc_opt_class();
      uint64_t v78 = NSStringFromClass(v106);
      __int16 v79 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v122 = v78;
      __int16 v123 = 2048;
      v124 = self;
      __int16 v125 = 2112;
      v126 = v79;
      Float64 v80 = "%{public}@ <%p>: %@ Cannot add video data output to the capture session";
      goto LABEL_69;
    }
    if ([(AVCaptureDeviceInput *)self->_videoInput isMaxGainOverrideSupported])
    {
      [(ARImageSensorSettings *)self->_settings maxGainOverride];
      -[AVCaptureDeviceInput setMaxGainOverride:](self->_videoInput, "setMaxGainOverride:");
      v45 = _ARLogSensor_9();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        v46 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v46);
        v48 = [(ARImageSensor *)self logPrefix];
        [(AVCaptureDeviceInput *)self->_videoInput maxGainOverride];
        *(_DWORD *)buf = 138544130;
        v122 = v47;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v48;
        __int16 v127 = 2048;
        Float64 v128 = v49;
        v50 = "%{public}@ <%p>: %@ Camera max gain override set to %f";
        v51 = v45;
        os_log_type_t v52 = OS_LOG_TYPE_DEFAULT;
        uint32_t v53 = 42;
LABEL_30:
        _os_log_impl(&dword_1B88A2000, v51, v52, v50, buf, v53);
      }
    }
    else
    {
      v45 = _ARLogSensor_9();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
      {
        v54 = (objc_class *)objc_opt_class();
        v47 = NSStringFromClass(v54);
        v48 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v122 = v47;
        __int16 v123 = 2048;
        v124 = self;
        __int16 v125 = 2112;
        v126 = v48;
        v50 = "%{public}@ <%p>: %@ Overriding max gain is not supported by the device.";
        v51 = v45;
        os_log_type_t v52 = OS_LOG_TYPE_ERROR;
        uint32_t v53 = 32;
        goto LABEL_30;
      }
    }

    goto LABEL_32;
  }
  id v30 = _ARLogSensor_9();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    __int16 v31 = (objc_class *)objc_opt_class();
    long long v32 = NSStringFromClass(v31);
    __int16 v33 = [(ARImageSensor *)self logPrefix];
    double v34 = [v14 description];
    __int16 v35 = self->_captureDevice;
    *(_DWORD *)buf = 138544386;
    v122 = v32;
    __int16 v123 = 2048;
    v124 = self;
    __int16 v125 = 2112;
    v126 = v33;
    __int16 v127 = 2112;
    Float64 v128 = v34;
    __int16 v129 = 2112;
    v130 = v35;
    _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Error creating capture input for image sensor: %@ (%@)", buf, 0x34u);
  }
  if (!v14)
  {
    __int16 v81 = (void *)MEMORY[0x1E4F1CC08];
    uint64_t v82 = 101;
LABEL_71:
    ARErrorWithCodeAndUserInfo(v82, v81);
    id v92 = (id)objc_claimAutoreleasedReturnValue();
LABEL_84:
    v42 = v92;
    goto LABEL_85;
  }
  uint64_t v119 = *MEMORY[0x1E4F28A50];
  id v120 = v14;
  Float64 v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v120 forKeys:&v119 count:1];
  uint64_t v37 = 101;
  unint64_t v38 = v36;
LABEL_78:
  v42 = ARErrorWithCodeAndUserInfo(v37, v38);

LABEL_85:
LABEL_86:
  return v42;
}

- (id)_configurePhotoOutputForCaptureSession:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_photoOutput)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v6 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.imagesensor.back.wide.photoQualityPrioritization"];
    uint64_t v7 = v6;
    if (v6) {
      uint64_t v8 = [v6 integerValue] + 1;
    }
    else {
      uint64_t v8 = 1;
    }
    long long v9 = _ARLogSensor_9();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      double v10 = (objc_class *)objc_opt_class();
      long long v11 = NSStringFromClass(v10);
      long long v12 = [(ARImageSensor *)self logPrefix];
      int v19 = 138544130;
      v20 = v11;
      __int16 v21 = 2048;
      int v22 = self;
      __int16 v23 = 2112;
      id v24 = v12;
      __int16 v25 = 2048;
      uint64_t v26 = v8;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Using photo quality prioritization: %ld", (uint8_t *)&v19, 0x2Au);
    }
    uint64_t v13 = (AVCapturePhotoOutput *)objc_opt_new();
    photoOutput = self->_photoOutput;
    self->_photoOutput = v13;

    [(AVCapturePhotoOutput *)self->_photoOutput setMaxPhotoQualityPrioritization:v8];
    if ([v4 canAddOutput:self->_photoOutput])
    {
      [v4 addOutput:self->_photoOutput];
      id v15 = objc_opt_class();
      id v16 = [(AVCaptureDevice *)self->_captureDevice activeFormat];
      -[AVCapturePhotoOutput setMaxPhotoDimensions:](self->_photoOutput, "setMaxPhotoDimensions:", [v15 maxPhotoDimensionsForVideoFormat:v16 maximumHeight:3024]);

      v17 = [(AVCapturePhotoOutput *)self->_photoOutput connectionWithMediaType:*MEMORY[0x1E4F15C18]];
      [(NSMutableArray *)self->_connections addObject:v17];

      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F15AC0] code:-11861 userInfo:0];
    }
    if ([(ARImageSensorSettings *)self->_settings focusPixelBlurScoreDeliveryEnabled]&& [(AVCapturePhotoOutput *)self->_photoOutput isFocusPixelBlurScoreSupported])
    {
      [(AVCapturePhotoOutput *)self->_photoOutput setFocusPixelBlurScoreEnabled:1];
    }
  }
  return v5;
}

- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(ARImageSensor *)self _defaultPhotoSettings];
  }
  uint64_t v6 = v5;
  [(AVCapturePhotoOutput *)self->_photoOutput capturePhotoWithSettings:v5 delegate:self];
}

- (void)captureOutput:(id)a3 didFinishProcessingPhoto:(id)a4 error:(id)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = (__CVBuffer *)[v6 pixelBuffer];
  if (v7)
  {
    uint64_t v8 = v7;
    double Width = (double)CVPixelBufferGetWidth(v7);
    double Height = (double)CVPixelBufferGetHeight(v8);
    [(AVCameraCalibrationData *)self->_cameraCalibrationData intrinsicMatrix];
    double v39 = v12;
    double v40 = v11;
    double v38 = v13;
    [(AVCameraCalibrationData *)self->_cameraCalibrationData intrinsicMatrixReferenceDimensions];
    if (v14 != Width || v15 != Height)
    {
      *(float *)&double v17 = ARAdjustIntrinsicsForViewportSize(*(float *)&v40, v39, v38, v14, v15, Width, Height);
      double v39 = v18;
      double v40 = v17;
      double v38 = v19;
    }
    v20 = [v6 metadata];
    uint64_t v37 = [v20 objectForKeyedSubscript:*MEMORY[0x1E4F2F800]];

    __int16 v21 = [v6 metadata];
    int v22 = [v21 objectForKeyedSubscript:*MEMORY[0x1E4F2FD40]];

    [v6 focusPixelBlurScore];
    CVBufferSetAttachment(v8, @"FocusPixelBlurScore", (CFTypeRef)objc_msgSend(NSNumber, "numberWithFloat:"), kCVAttachmentMode_ShouldPropagate);
    __int16 v23 = [v6 metadata];
    id v24 = [v23 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];

    uint64_t v25 = ARCaptureLensFromMakerNotesDictionary(v24);
    uint64_t v26 = [ARImageData alloc];
    int64_t v27 = [(ARImageSensor *)self captureFramesPerSecond];
    id v28 = [(ARImageSensor *)self captureDevice];
    os_log_type_t v29 = [(ARImageSensor *)self captureSession];
    if (v6) {
      [v6 timestamp];
    }
    else {
      memset(v41, 0, sizeof(v41));
    }
    __int16 v35 = v26;
    double v34 = (void *)v37;
    Float64 v36 = -[ARImageData initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:captureLens:](v35, "initWithPixelBuffer:captureFramePerSecond:captureDevice:captureSession:timestamp:intrinsics:exif:tiff:captureLens:", v8, v27, v28, v29, v41, v37, v40, v39, v38, v22, v25);

    [(ARImageData *)v36 setHighResolution:1];
    [(ARImageData *)v36 setCalibrationData:self->_cameraCalibrationData];
    +[ARImageSensor registerSignPostForImageData:v36];
    [(ARImageSensor *)self _dispatchImageData:v36];
  }
  else
  {
    id v30 = _ARLogSensor_9();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    {
      __int16 v31 = (objc_class *)objc_opt_class();
      long long v32 = NSStringFromClass(v31);
      __int16 v33 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v43 = v32;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2112;
      v47 = v33;
      _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Failed to capture a high resolution frame.", buf, 0x20u);
    }
    double v34 = [(ARImageSensor *)self delegate];
    int v22 = ARErrorWithCodeAndUserInfo(107, 0);
    [v34 sensor:self didFailWithError:v22];
  }
}

- (id)configureCaptureSessionCalibration
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (self->_calibrationOutput) {
    goto LABEL_2;
  }
  id v5 = (AVCaptureCameraCalibrationDataOutput *)objc_alloc_init(MEMORY[0x1E4F16408]);
  calibrationOutput = self->_calibrationOutput;
  self->_calibrationOutput = v5;

  if ([(AVCaptureSession *)self->_captureSession canAddOutput:self->_calibrationOutput])
  {
    [(AVCaptureSession *)self->_captureSession addOutputWithNoConnections:self->_calibrationOutput];
    id v7 = _ARLogSensor_9();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = (objc_class *)objc_opt_class();
      long long v9 = NSStringFromClass(v8);
      double v10 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      double v38 = v9;
      __int16 v39 = 2048;
      double v40 = self;
      __int16 v41 = 2112;
      v42 = v10;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added calibration data output to the capture session", buf, 0x20u);
    }
    if (self->_calibrationConnection) {
      goto LABEL_10;
    }
    videoInput = self->_videoInput;
    uint64_t v16 = *MEMORY[0x1E4F15BC0];
    double v17 = [(AVCaptureDeviceInput *)videoInput device];
    double v18 = [v17 deviceType];
    double v19 = [(AVCaptureDeviceInput *)self->_videoInput device];
    v20 = -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](videoInput, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", v16, v18, [v19 position]);
    __int16 v21 = [v20 firstObject];

    if (v21)
    {
      int v22 = (void *)MEMORY[0x1E4F16410];
      Float64 v36 = v21;
      __int16 v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      id v24 = [v22 connectionWithInputPorts:v23 output:self->_calibrationOutput];
      calibrationConnection = self->_calibrationConnection;
      self->_calibrationConnection = v24;

      if ([(AVCaptureSession *)self->_captureSession canAddConnection:self->_calibrationConnection])
      {
        [(NSMutableArray *)self->_connections addObject:self->_calibrationConnection];
        [(AVCaptureSession *)self->_captureSession addConnection:self->_calibrationConnection];
        uint64_t v26 = _ARLogSensor_9();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          int64_t v27 = (objc_class *)objc_opt_class();
          id v28 = NSStringFromClass(v27);
          os_log_type_t v29 = [(ARImageSensor *)self logPrefix];
          *(_DWORD *)buf = 138543874;
          double v38 = v28;
          __int16 v39 = 2048;
          double v40 = self;
          __int16 v41 = 2112;
          v42 = v29;
          _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Added calibration data connection to the capture session", buf, 0x20u);
        }
LABEL_10:
        [(AVCaptureCameraCalibrationDataOutput *)self->_calibrationOutput setAlwaysDiscardsLateCameraCalibrationData:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.calibrationData.alwaysDiscardsLateData"]];
        [(AVCaptureCameraCalibrationDataOutput *)self->_calibrationOutput setDelegate:self callbackQueue:self->_captureQueue];
LABEL_2:
        v2 = 0;
        goto LABEL_3;
      }
      id v30 = _ARLogSensor_9();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        goto LABEL_24;
      }
      __int16 v35 = (objc_class *)objc_opt_class();
      long long v32 = NSStringFromClass(v35);
      __int16 v33 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      double v38 = v32;
      __int16 v39 = 2048;
      double v40 = self;
      __int16 v41 = 2112;
      v42 = v33;
      double v34 = "%{public}@ <%p>: %@ Cannot add calibration connection to capture session";
    }
    else
    {
      id v30 = _ARLogSensor_9();
      if (!os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      {
LABEL_24:

        v2 = ARErrorWithCodeAndUserInfo(102, 0);

        goto LABEL_3;
      }
      __int16 v31 = (objc_class *)objc_opt_class();
      long long v32 = NSStringFromClass(v31);
      __int16 v33 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      double v38 = v32;
      __int16 v39 = 2048;
      double v40 = self;
      __int16 v41 = 2112;
      v42 = v33;
      double v34 = "%{public}@ <%p>: %@ Cannot find a calibration port in the input added to the capture session";
    }
    _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_ERROR, v34, buf, 0x20u);

    goto LABEL_24;
  }
  double v11 = _ARLogSensor_9();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    double v12 = (objc_class *)objc_opt_class();
    double v13 = NSStringFromClass(v12);
    double v14 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138543874;
    double v38 = v13;
    __int16 v39 = 2048;
    double v40 = self;
    __int16 v41 = 2112;
    v42 = v14;
    _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add calibration data output to the capture session", buf, 0x20u);
  }
  v2 = ARErrorWithCodeAndUserInfo(102, 0);
LABEL_3:
  return v2;
}

- (void)configureCaptureDevice
{
  id v3 = [(ARImageSensor *)self captureDevice];
  [(ARImageSensor *)self configureFrameRateForDevice:v3];
  [(ARImageSensor *)self _configureCameraExposureForDevice:v3];
  [(ARImageSensor *)self _configureCameraWhiteBalanceForDevice:v3];
  [(ARImageSensor *)self _configureCameraFocusForDevice:v3];
  [(ARImageSensor *)self _configureImageControlModeForDevice:v3];
  [(ARImageSensor *)self configureGeometricDistortionCorrectionForDevice:v3];
}

- (void)updateCaptureDeviceFrameRate:(double)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = [(ARImageSensor *)self captureDevice];
  id v15 = 0;
  int v6 = [v5 lockForConfiguration:&v15];
  id v7 = v15;

  if (v6)
  {
    uint64_t v8 = [(ARImageSensor *)self captureDevice];
    [(ARImageSensor *)self _configureFrameRateForDevice:v8 frameRate:a3];

    long long v9 = [(ARImageSensor *)self captureDevice];
    [v9 unlockForConfiguration];
  }
  else
  {
    if (_ARLogSession_onceToken_2 != -1) {
      dispatch_once(&_ARLogSession_onceToken_2, &__block_literal_global_524);
    }
    double v10 = (void *)_ARLogSession_logObj_2;
    if (os_log_type_enabled((os_log_t)_ARLogSession_logObj_2, OS_LOG_TYPE_ERROR))
    {
      double v11 = v10;
      double v12 = (objc_class *)objc_opt_class();
      double v13 = NSStringFromClass(v12);
      double v14 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138544130;
      double v17 = v13;
      __int16 v18 = 2048;
      double v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = v14;
      __int16 v22 = 2112;
      id v23 = v7;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Encountered error updating capture device frame rate %@", buf, 0x2Au);
    }
  }
}

- (id)setActiveFormat
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = [(ARImageSensor *)self captureDevice];
  v31[0] = 0;
  int v4 = [v3 lockForConfiguration:v31];
  id v5 = v31[0];

  if (v4)
  {
    int v6 = [(ARImageSensorSettings *)self->_settings videoFormat];
    id v7 = [v6 deviceFormat];
    uint64_t v8 = [(ARImageSensor *)self captureDevice];
    [v8 setActiveFormat:v7];

    long long v9 = [(ARImageSensor *)self captureDevice];
    double v10 = [v9 deviceType];
    double v11 = (void *)*MEMORY[0x1E4F15820];
    LODWORD(v7) = v10 == (void *)*MEMORY[0x1E4F15820];

    if (v7)
    {
      double v12 = [(ARImageSensorSettings *)self->_settings videoFormat];
      double v13 = [v12 depthDataFormat];
      double v14 = [(ARImageSensor *)self captureDevice];
      [v14 setActiveDepthDataFormat:v13];
    }
    id v15 = _ARLogSensor_9();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      id v17 = (id)objc_claimAutoreleasedReturnValue();
      id v18 = [(ARImageSensor *)self logPrefix];
      double v19 = [(AVCaptureDevice *)self->_captureDevice activeFormat];
      __int16 v20 = [v19 description];
      *(_DWORD *)buf = 138544130;
      id v33 = v17;
      __int16 v34 = 2048;
      __int16 v35 = self;
      __int16 v36 = 2112;
      id v37 = v18;
      __int16 v38 = 2112;
      __int16 v39 = v20;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Active format selected: %@", buf, 0x2Au);
    }
    __int16 v21 = [(AVCaptureDevice *)self->_captureDevice deviceType];
    BOOL v22 = v21 == v11;

    if (v22)
    {
      id v23 = _ARLogSensor_9();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        id v25 = (id)objc_claimAutoreleasedReturnValue();
        id v26 = [(ARImageSensor *)self logPrefix];
        int64_t v27 = [(AVCaptureDevice *)self->_captureDevice activeDepthDataFormat];
        id v28 = [v27 description];
        *(_DWORD *)buf = 138544130;
        id v33 = v25;
        __int16 v34 = 2048;
        __int16 v35 = self;
        __int16 v36 = 2112;
        id v37 = v26;
        __int16 v38 = 2112;
        __int16 v39 = v28;
        _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Active depth data format selected: %@", buf, 0x2Au);
      }
    }
    os_log_type_t v29 = [(ARImageSensor *)self captureDevice];
    [v29 unlockForConfiguration];
  }
  return v5;
}

- (void)configureFrameRateForDevice:(id)a3
{
  settings = self->_settings;
  id v10 = a3;
  id v5 = [(ARImageSensorSettings *)settings videoFormat];
  int v6 = [v5 frameRatesByPowerUsage];
  id v7 = objc_msgSend(v6, "objectAtIndexedSubscript:", -[ARImageSensor powerUsage](self, "powerUsage"));
  [v7 doubleValue];
  double v9 = v8;

  [(ARImageSensor *)self _configureFrameRateForDevice:v10 frameRate:v9];
}

- (void)_configureFrameRateForDevice:(id)a3 frameRate:(double)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  CMTimeMake(&v24, 1, (int)a4);
  CMTime v23 = v24;
  [v6 setActiveVideoMinFrameDuration:&v23];
  CMTimeMake(&v22, 1, (int)a4);
  CMTime v21 = v22;
  [v6 setActiveVideoMaxFrameDuration:&v21];
  [(ARImageSensor *)self setCaptureFramesPerSecond:(uint64_t)a4];
  id v7 = _ARLogSensor_9();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    double v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    id v10 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138544130;
    id v26 = v9;
    __int16 v27 = 2048;
    id v28 = self;
    __int16 v29 = 2112;
    id v30 = v10;
    __int16 v31 = 2048;
    double v32 = a4;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ ARImageSensor Capture frames per second set to %f", buf, 0x2Au);
  }
  double v11 = [v6 deviceType];
  BOOL v12 = v11 == (void *)*MEMORY[0x1E4F15820];

  if (v12)
  {
    CMTimeMake(&v20, 1, (int)(a4 * 0.25));
    CMTime v19 = v20;
    [v6 setActiveDepthDataMinFrameDuration:&v19];
    double v13 = _ARLogSensor_9();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      double v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      id v15 = (id)objc_claimAutoreleasedReturnValue();
      id v16 = [(ARImageSensor *)self logPrefix];
      if (v6) {
        [v6 activeDepthDataMinFrameDuration];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      *(_DWORD *)buf = 138544130;
      id v26 = v15;
      __int16 v27 = 2048;
      id v28 = self;
      __int16 v29 = 2112;
      id v30 = v16;
      __int16 v31 = 2048;
      double v32 = Seconds;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Depth min frame duration changed to: %f", buf, 0x2Au);
    }
  }
}

- (void)_configureCameraExposureForDevice:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 position] != 1)
  {
    if ([v4 position] == 2)
    {
      id v7 = ARFrontFacingImageSensorISOUserDefaultsKey;
      double v8 = ARFrontFacingImageSensorExposureDurationUserDefaultsKey;
      goto LABEL_9;
    }
LABEL_7:
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    goto LABEL_10;
  }
  id v5 = [v4 deviceType];
  char v6 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v5);

  if ((v6 & 1) == 0)
  {
    id v9 = [v4 deviceType];
    id v10 = (void *)*MEMORY[0x1E4F15828];

    if (v9 == v10)
    {
      id v7 = ARBackFacingUltraWideImageSensorISOUserDefaultsKey;
      double v8 = ARBackFacingUltraWideImageSensorExposureDurationUserDefaultsKey;
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  id v7 = ARBackFacingWideImageSensorISOUserDefaultsKey;
  double v8 = ARBackFacingWideImageSensorExposureDurationUserDefaultsKey;
LABEL_9:
  uint64_t v12 = +[ARKitUserDefaults numberForKey:*v8];
  uint64_t v11 = +[ARKitUserDefaults numberForKey:*v7];
LABEL_10:
  if (v12 | v11)
  {
    CMTime v51 = *(CMTime *)*(void *)&MEMORY[0x1E4F15858];
    if (v12)
    {
      [(id)v12 doubleValue];
      CMTimeMake(&v51, (uint64_t)(v13 * 1000.0), 1000000);
    }
    if (v11)
    {
      [(id)v11 floatValue];
      unsigned int v15 = v14;
    }
    else
    {
      unsigned int v15 = *MEMORY[0x1E4F15860];
    }
    objc_initWeak((id *)&location, v4);
    v49[0] = MEMORY[0x1E4F143A8];
    v49[1] = 3221225472;
    v49[2] = __51__ARImageSensor__configureCameraExposureForDevice___block_invoke;
    v49[3] = &unk_1E6187ED0;
    v49[4] = self;
    objc_copyWeak(&v50, (id *)&location);
    CMTime v48 = v51;
    objc_msgSend(v4, "setExposureModeCustomWithDuration:ISO:completionHandler:", &v48, v49, COERCE_DOUBLE(__PAIR64__(HIDWORD(v51.value), v15)));
    objc_destroyWeak(&v50);
    objc_destroyWeak((id *)&location);
  }
  else if ([v4 isExposureModeSupported:2])
  {
    if ([v4 isExposurePointOfInterestSupported])
    {
      objc_msgSend(v4, "setExposurePointOfInterest:", 0.5, 0.5);
      id v16 = _ARLogSensor_9();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        id v17 = (objc_class *)objc_opt_class();
        id v18 = NSStringFromClass(v17);
        CMTime v19 = [(ARImageSensor *)self logPrefix];
        [v4 exposurePointOfInterest];
        double v21 = v20;
        [v4 exposurePointOfInterest];
        LODWORD(location.value) = 138544386;
        *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v18;
        LOWORD(location.flags) = 2048;
        *(void *)((char *)&location.flags + 2) = self;
        HIWORD(location.epoch) = 2112;
        uint32_t v53 = v19;
        __int16 v54 = 2048;
        Float64 v55 = v21;
        __int16 v56 = 2048;
        Float64 v57 = v22;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Exposure point of interest set at %f, %f", (uint8_t *)&location, 0x34u);
      }
    }
    [v4 setExposureMode:2];
    CMTime v23 = _ARLogSensor_9();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      CMTime v24 = (objc_class *)objc_opt_class();
      id v25 = NSStringFromClass(v24);
      id v26 = [(ARImageSensor *)self logPrefix];
      LODWORD(location.value) = 138543874;
      *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v25;
      LOWORD(location.flags) = 2048;
      *(void *)((char *)&location.flags + 2) = self;
      HIWORD(location.epoch) = 2112;
      uint32_t v53 = v26;
      _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Exposure mode set to AVCaptureExposureModeContinuousAutoExposure", (uint8_t *)&location, 0x20u);
    }
    memset(&v51, 0, sizeof(v51));
    CMTimeMake(&v51, 1, 60);
    __int16 v27 = [v4 activeFormat];
    id v28 = v27;
    if (v27) {
      [v27 maxExposureDuration];
    }
    else {
      memset(&time2, 0, sizeof(time2));
    }
    CMTime location = v51;
    BOOL v29 = CMTimeCompare(&location, &time2) < 1;

    if (v29)
    {
      CMTime v46 = v51;
      [v4 setActiveMaxExposureDuration:&v46];
      id v30 = _ARLogSensor_9();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        id v37 = (objc_class *)objc_opt_class();
        __int16 v38 = NSStringFromClass(v37);
        __int16 v39 = [(ARImageSensor *)self logPrefix];
        if (v4) {
          [v4 activeMaxExposureDuration];
        }
        else {
          memset(&time, 0, sizeof(time));
        }
        Float64 Seconds = CMTimeGetSeconds(&time);
        LODWORD(location.value) = 138544130;
        *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v38;
        LOWORD(location.flags) = 2048;
        *(void *)((char *)&location.flags + 2) = self;
        HIWORD(location.epoch) = 2112;
        uint32_t v53 = v39;
        __int16 v54 = 2048;
        Float64 v55 = Seconds;
        _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Max exposure set to %f", (uint8_t *)&location, 0x2Au);
      }
    }
    else
    {
      id v30 = _ARLogSensor_9();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        __int16 v31 = (objc_class *)objc_opt_class();
        double v32 = NSStringFromClass(v31);
        uint64_t v33 = [(ARImageSensor *)self logPrefix];
        CMTime location = v51;
        Float64 v34 = CMTimeGetSeconds(&location);
        __int16 v35 = [v4 activeFormat];
        __int16 v36 = v35;
        if (v35) {
          [v35 maxExposureDuration];
        }
        else {
          memset(&v44, 0, sizeof(v44));
        }
        Float64 v40 = CMTimeGetSeconds(&v44);
        LODWORD(location.value) = 138544386;
        *(CMTimeValue *)((char *)&location.value + 4) = (CMTimeValue)v32;
        LOWORD(location.flags) = 2048;
        *(void *)((char *)&location.flags + 2) = self;
        HIWORD(location.epoch) = 2112;
        uint32_t v53 = v33;
        __int16 v54 = 2048;
        Float64 v55 = v34;
        __int16 v56 = 2048;
        Float64 v57 = v40;
        _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Max exposure out of range: %f > %f", (uint8_t *)&location, 0x34u);
      }
    }
  }
  if ([(ARImageSensorSettings *)self->_settings videoHDRAllowed])
  {
    [v4 setAutomaticallyAdjustsVideoHDREnabled:1];
  }
  else
  {
    [v4 setAutomaticallyAdjustsVideoHDREnabled:0];
    v42 = [v4 activeFormat];
    int v43 = [v42 isVideoHDRSupported];

    if (v43) {
      [v4 setVideoHDREnabled:0];
    }
  }
}

void __51__ARImageSensor__configureCameraExposureForDevice___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = _ARLogSensor_9();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    id v5 = *(void **)(a1 + 32);
    char v6 = [v5 logPrefix];
    id v7 = (id *)(a1 + 40);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v9 = WeakRetained;
    if (WeakRetained) {
      [WeakRetained exposureDuration];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    Float64 Seconds = CMTimeGetSeconds(&time);
    id v11 = objc_loadWeakRetained(v7);
    [v11 ISO];
    *(_DWORD *)buf = 138544386;
    unsigned int v15 = v4;
    __int16 v16 = 2048;
    id v17 = v5;
    __int16 v18 = 2112;
    CMTime v19 = v6;
    __int16 v20 = 2048;
    Float64 v21 = Seconds;
    __int16 v22 = 2048;
    double v23 = v12;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Exposure duration set at %f, ISO %f", buf, 0x34u);
  }
}

- (void)_configureCameraWhiteBalanceForDevice:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 position] == 1)
  {
    id v5 = [v4 deviceType];
    char v6 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v5);

    if (v6)
    {
      id v7 = ARBackFacingWideImageSensorWhiteBalanceUserDefaultsKey;
      goto LABEL_9;
    }
    double v8 = [v4 deviceType];
    id v9 = (void *)*MEMORY[0x1E4F15828];

    if (v8 != v9)
    {
LABEL_7:
      id v10 = 0;
      goto LABEL_15;
    }
    id v7 = ARBackFacingUltraWideImageSensorWhiteBalanceUserDefaultsKey;
  }
  else
  {
    if ([v4 position] != 2) {
      goto LABEL_7;
    }
    id v7 = ARFrontFacingImageSensorWhiteBalanceUserDefaultsKey;
  }
LABEL_9:
  id v11 = +[ARKitUserDefaults objectForKey:*v7];
  id v10 = v11;
  if (v11)
  {
    float v12 = [v11 componentsSeparatedByString:@","];
    if ([v12 count] == 3)
    {
      double v13 = [v12 objectAtIndexedSubscript:0];
      [v13 floatValue];
      int v15 = v14;

      __int16 v16 = [v12 objectAtIndexedSubscript:1];
      [v16 floatValue];
      int v18 = v17;

      CMTime v19 = [v12 objectAtIndexedSubscript:2];
      [v19 floatValue];
      int v21 = v20;

      objc_initWeak((id *)location, v4);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __55__ARImageSensor__configureCameraWhiteBalanceForDevice___block_invoke;
      v32[3] = &unk_1E6187EF8;
      objc_copyWeak(&v33, (id *)location);
      v32[4] = self;
      LODWORD(v22) = v15;
      LODWORD(v23) = v18;
      LODWORD(v24) = v21;
      objc_msgSend(v4, "setWhiteBalanceModeLockedWithDeviceWhiteBalanceGains:completionHandler:", v32, v22, v23, v24);
      objc_destroyWeak(&v33);
      objc_destroyWeak((id *)location);
LABEL_18:

      goto LABEL_19;
    }
    id v25 = _ARLogSensor_9();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      id v26 = (objc_class *)objc_opt_class();
      __int16 v27 = NSStringFromClass(v26);
      id v28 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)CMTime location = 138544130;
      *(void *)&location[4] = v27;
      __int16 v35 = 2048;
      __int16 v36 = self;
      __int16 v37 = 2112;
      __int16 v38 = v28;
      __int16 v39 = 2048;
      uint64_t v40 = [v12 count];
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Custom white balance user defaults does not contain 3 values as expected (number of values found: %tu) ", location, 0x2Au);
    }
  }
LABEL_15:
  if ([v4 isWhiteBalanceModeSupported:2])
  {
    [v4 setWhiteBalanceMode:2];
    float v12 = _ARLogSensor_9();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      BOOL v29 = (objc_class *)objc_opt_class();
      id v30 = NSStringFromClass(v29);
      __int16 v31 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)CMTime location = 138543874;
      *(void *)&location[4] = v30;
      __int16 v35 = 2048;
      __int16 v36 = self;
      __int16 v37 = 2112;
      __int16 v38 = v31;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Continuous auto white balance enabled", location, 0x20u);
    }
    goto LABEL_18;
  }
LABEL_19:
}

void __55__ARImageSensor__configureCameraWhiteBalanceForDevice___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained deviceWhiteBalanceGains];
  float v4 = v3;
  float v6 = v5;
  float v8 = v7;

  id v9 = _ARLogSensor_9();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    id v11 = NSStringFromClass(v10);
    float v12 = *(void **)(a1 + 32);
    double v13 = [v12 logPrefix];
    int v14 = 138544642;
    int v15 = v11;
    __int16 v16 = 2048;
    int v17 = v12;
    __int16 v18 = 2112;
    CMTime v19 = v13;
    __int16 v20 = 2048;
    double v21 = v4;
    __int16 v22 = 2048;
    double v23 = v6;
    __int16 v24 = 2048;
    double v25 = v8;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ Custom white balance gains set at %f, %f, %f", (uint8_t *)&v14, 0x3Eu);
  }
}

- (void)_configureCameraFocusForDevice:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  float v5 = _ARLogSensor_9();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    float v6 = (objc_class *)objc_opt_class();
    float v7 = NSStringFromClass(v6);
    float v8 = [(ARImageSensor *)self logPrefix];
    id v9 = [v4 activeFormat];
    *(_DWORD *)buf = 138544130;
    id v35 = v7;
    __int16 v36 = 2048;
    __int16 v37 = self;
    __int16 v38 = 2112;
    __int16 v39 = v8;
    __int16 v40 = 2048;
    double v41 = COERCE_DOUBLE([v9 autoFocusSystem]);
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Auto focus system: %li", buf, 0x2Au);
  }
  if ([v4 position] != 1)
  {
    id v10 = _ARLogSensor_9();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = (objc_class *)objc_opt_class();
      float v12 = NSStringFromClass(v11);
      double v13 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v35 = v12;
      __int16 v36 = 2048;
      __int16 v37 = self;
      __int16 v38 = 2112;
      __int16 v39 = v13;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Focus is only configured for back facing image sensor", buf, 0x20u);
    }
    goto LABEL_9;
  }
  if ([(ARImageSensorSettings *)self->_settings autoFocusEnabled])
  {
    if ([v4 isFocusModeSupported:1])
    {
      [v4 setFocusMode:1];
      [(ARImageSensor *)self setRunningSingleShotAutoFocus:1];
    }
    else
    {
      [(ARImageSensor *)self enableAutoFocusForDevice:v4];
    }
    goto LABEL_23;
  }
  if (![v4 isLockingFocusWithCustomLensPositionSupported])
  {
    id v10 = _ARLogSensor_9();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      double v21 = (objc_class *)objc_opt_class();
      __int16 v22 = NSStringFromClass(v21);
      double v23 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      id v35 = v22;
      __int16 v36 = 2048;
      __int16 v37 = self;
      __int16 v38 = 2112;
      __int16 v39 = v23;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Unable to lock lens position", buf, 0x20u);
    }
LABEL_9:

    goto LABEL_23;
  }
  [(ARImageSensor *)self defaultLensPosition];
  float v15 = v14;
  if ([v4 position] == 1
    && ([v4 deviceType],
        __int16 v16 = objc_claimAutoreleasedReturnValue(),
        int v17 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v16),
        v16,
        v17))
  {
    __int16 v18 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.imagesensor.back.wide.lensPosition"];
    CMTime v19 = v18;
    if (v18)
    {
      [v18 floatValue];
      float v15 = v20;
    }
  }
  else
  {
    CMTime v19 = 0;
  }
  objc_initWeak(&location, v4);
  objc_initWeak(&from, self);
  __int16 v24 = _ARLogSensor_9();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    double v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    id v26 = (id)objc_claimAutoreleasedReturnValue();
    __int16 v27 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138544130;
    id v35 = v26;
    __int16 v36 = 2048;
    __int16 v37 = self;
    __int16 v38 = 2112;
    __int16 v39 = v27;
    __int16 v40 = 2048;
    double v41 = v15;
    _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Setting lens position to %f", buf, 0x2Au);
  }
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __48__ARImageSensor__configureCameraFocusForDevice___block_invoke;
  v29[3] = &unk_1E6187F20;
  v29[4] = self;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(&v31, &location);
  *(float *)&double v28 = v15;
  [v4 setFocusModeLockedWithLensPosition:v29 completionHandler:v28];
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

LABEL_23:
}

void __48__ARImageSensor__configureCameraFocusForDevice___block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = _ARLogSensor_9();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    float v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    float v7 = [WeakRetained logPrefix];
    id v8 = objc_loadWeakRetained((id *)(a1 + 48));
    [v8 lensPosition];
    int v10 = 138544130;
    id v11 = v4;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    __int16 v14 = 2112;
    float v15 = v7;
    __int16 v16 = 2048;
    double v17 = v9;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Lens position set at %f", (uint8_t *)&v10, 0x2Au);
  }
}

- (void)_configureImageControlModeForDevice:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isImageControlModeSupported:1])
  {
    [v4 setAutomaticallyAdjustsImageControlMode:0];
    [v4 setImageControlMode:1];
  }
  uint64_t v5 = _ARLogSensor_9();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    float v6 = (objc_class *)objc_opt_class();
    float v7 = NSStringFromClass(v6);
    id v8 = [(ARImageSensor *)self logPrefix];
    int v9 = 138544386;
    int v10 = v7;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2112;
    __int16 v14 = v8;
    __int16 v15 = 1024;
    int v16 = [v4 automaticallyAdjustsImageControlMode];
    __int16 v17 = 2048;
    uint64_t v18 = [v4 imageControlMode];
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Capture device image control mode: %i, %li", (uint8_t *)&v9, 0x30u);
  }
}

- (void)configureGeometricDistortionCorrectionForDevice:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 position] == 2)
  {
    uint64_t v5 = _ARLogSensor_9();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      float v6 = (objc_class *)objc_opt_class();
      float v7 = NSStringFromClass(v6);
      id v8 = [(ARImageSensor *)self logPrefix];
      int v16 = 138543874;
      __int16 v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      double v21 = v8;
      int v9 = "%{public}@ <%p>: %@ Configuring geometric distortion correction on front facing camera is not supported";
LABEL_11:
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, 0x20u);
LABEL_12:
    }
  }
  else if ([v4 isGeometricDistortionCorrectionSupported])
  {
    int v10 = [(ARImageSensor *)self settings];
    objc_msgSend(v4, "setGeometricDistortionCorrectionEnabled:", objc_msgSend(v10, "backFacingCameraGeometricDistortionCorrectionEnabled"));

    uint64_t v5 = _ARLogSensor_9();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = (objc_class *)objc_opt_class();
      float v7 = NSStringFromClass(v11);
      id v8 = [(ARImageSensor *)self logPrefix];
      __int16 v12 = [(ARImageSensor *)self settings];
      int v13 = [v12 backFacingCameraGeometricDistortionCorrectionEnabled];
      __int16 v14 = @"disabled";
      int v16 = 138544130;
      __int16 v18 = 2048;
      __int16 v17 = v7;
      if (v13) {
        __int16 v14 = @"enabled";
      }
      uint64_t v19 = self;
      __int16 v20 = 2112;
      double v21 = v8;
      __int16 v22 = 2112;
      double v23 = v14;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Capture device geometric distortion correction: %@", (uint8_t *)&v16, 0x2Au);

      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v5 = _ARLogSensor_9();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = (objc_class *)objc_opt_class();
      float v7 = NSStringFromClass(v15);
      id v8 = [(ARImageSensor *)self logPrefix];
      int v16 = 138543874;
      __int16 v17 = v7;
      __int16 v18 = 2048;
      uint64_t v19 = self;
      __int16 v20 = 2112;
      double v21 = v8;
      int v9 = "%{public}@ <%p>: %@ Device doesn't support geometric distortion correction";
      goto LABEL_11;
    }
  }
}

- (void)enableAutoFocusForDevice:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  captureDevice = self->_captureDevice;
  id v43 = 0;
  BOOL v6 = [(AVCaptureDevice *)captureDevice lockForConfiguration:&v43];
  id v7 = v43;
  if (v6)
  {
    if ([v4 isFocusPointOfInterestSupported])
    {
      objc_msgSend(v4, "setFocusPointOfInterest:", 0.5, 0.5);
      id v8 = _ARLogSensor_9();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = (objc_class *)objc_opt_class();
        int v10 = NSStringFromClass(v9);
        __int16 v11 = [(ARImageSensor *)self logPrefix];
        [v4 focusPointOfInterest];
        int v13 = v12;
        [v4 focusPointOfInterest];
        *(_DWORD *)buf = 138544386;
        v45 = v10;
        __int16 v46 = 2048;
        v47 = self;
        __int16 v48 = 2112;
        float v49 = v11;
        __int16 v50 = 2048;
        CMTime v51 = v13;
        __int16 v52 = 2048;
        uint64_t v53 = v14;
        _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Focus point of interest at at %f, %f", buf, 0x34u);
      }
    }
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.back.wide.smoothAutoFocus"])
    {
      if (![v4 isSmoothAutoFocusSupported])
      {
LABEL_16:
        __int16 v22 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.imagesensor.back.wide.autoFocusRange"];
        if (!v22) {
          goto LABEL_30;
        }
        double v28 = [v4 deviceType];
        int v29 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v28);

        if (!v29) {
          goto LABEL_30;
        }
        if ([v22 isEqualToString:@"near"])
        {
          uint64_t v30 = 1;
        }
        else if ([v22 isEqualToString:@"far"])
        {
          uint64_t v30 = 2;
        }
        else
        {

          uint64_t v30 = 0;
          __int16 v22 = @"none";
        }
        if ([v4 isAutoFocusRangeRestrictionSupported])
        {
          [v4 setAutoFocusRangeRestriction:v30];
          id v31 = _ARLogSensor_9();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            double v32 = (objc_class *)objc_opt_class();
            id v33 = NSStringFromClass(v32);
            Float64 v34 = [(ARImageSensor *)self logPrefix];
            *(_DWORD *)buf = 138544130;
            v45 = v33;
            __int16 v46 = 2048;
            v47 = self;
            __int16 v48 = 2112;
            float v49 = v34;
            __int16 v50 = 2112;
            CMTime v51 = (__CFString *)v22;
            id v35 = "%{public}@ <%p>: %@ Focus range restriction set to %@";
            __int16 v36 = v31;
            uint32_t v37 = 42;
LABEL_28:
            _os_log_impl(&dword_1B88A2000, v36, OS_LOG_TYPE_INFO, v35, buf, v37);
          }
        }
        else
        {
          id v31 = _ARLogSensor_9();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            __int16 v38 = (objc_class *)objc_opt_class();
            id v33 = NSStringFromClass(v38);
            Float64 v34 = [(ARImageSensor *)self logPrefix];
            *(_DWORD *)buf = 138543874;
            v45 = v33;
            __int16 v46 = 2048;
            v47 = self;
            __int16 v48 = 2112;
            float v49 = v34;
            id v35 = "%{public}@ <%p>: %@ Device does not support auto focus range restriction";
            __int16 v36 = v31;
            uint32_t v37 = 32;
            goto LABEL_28;
          }
        }

LABEL_30:
        if ([v4 isFocusModeSupported:2])
        {
          [v4 setFocusMode:2];
          __int16 v39 = _ARLogSensor_9();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            __int16 v40 = (objc_class *)objc_opt_class();
            double v41 = NSStringFromClass(v40);
            uint64_t v42 = [(ARImageSensor *)self logPrefix];
            *(_DWORD *)buf = 138543874;
            v45 = v41;
            __int16 v46 = 2048;
            v47 = self;
            __int16 v48 = 2112;
            float v49 = v42;
            _os_log_impl(&dword_1B88A2000, v39, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Continuous auto focus enabled", buf, 0x20u);
          }
        }
        [v4 unlockForConfiguration];
        goto LABEL_35;
      }
      [v4 setSmoothAutoFocusEnabled:1];
      __int16 v15 = _ARLogSensor_9();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        __int16 v18 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138543874;
        v45 = v17;
        __int16 v46 = 2048;
        v47 = self;
        __int16 v48 = 2112;
        float v49 = v18;
        uint64_t v19 = "%{public}@ <%p>: %@ Smooth auto focus enabled";
        __int16 v20 = v15;
        uint32_t v21 = 32;
LABEL_14:
        _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_INFO, v19, buf, v21);
      }
    }
    else
    {
      __int16 v15 = _ARLogSensor_9();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v27 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v27);
        __int16 v18 = [(ARImageSensor *)self logPrefix];
        *(_DWORD *)buf = 138544130;
        v45 = v17;
        __int16 v46 = 2048;
        v47 = self;
        __int16 v48 = 2112;
        float v49 = v18;
        __int16 v50 = 2112;
        CMTime v51 = @"disabled";
        uint64_t v19 = "%{public}@ <%p>: %@ Smooth auto focus %@ by user defaults";
        __int16 v20 = v15;
        uint32_t v21 = 42;
        goto LABEL_14;
      }
    }

    goto LABEL_16;
  }
  __int16 v22 = _ARLogSensor_9();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    double v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = NSStringFromClass(v23);
    double v25 = [(ARImageSensor *)self logPrefix];
    id v26 = [v7 description];
    *(_DWORD *)buf = 138544130;
    v45 = v24;
    __int16 v46 = 2048;
    v47 = self;
    __int16 v48 = 2112;
    float v49 = v25;
    __int16 v50 = 2112;
    CMTime v51 = v26;
    _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Unable to lock capture device to enable auto focus: %@", buf, 0x2Au);
  }
LABEL_35:
}

- (id)_configureVisionDataOutputForSession:(id)a3
{
  v110[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_visionDataOutput)
  {
LABEL_2:
    uint64_t v5 = 0;
    goto LABEL_3;
  }
  id v7 = (AVCaptureVisionDataOutput *)objc_opt_new();
  visionDataOutput = self->_visionDataOutput;
  self->_visionDataOutput = v7;

  if ([v4 canAddOutput:self->_visionDataOutput]) {
    [v4 addOutputWithNoConnections:self->_visionDataOutput];
  }
  if (self->_visionDataConnection)
  {
LABEL_9:
    int v9 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];

    if (v9)
    {
      int v10 = _ARLogSensor_9();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = (objc_class *)objc_opt_class();
        __int16 v12 = NSStringFromClass(v11);
        int v13 = [(ARImageSensor *)self logPrefix];
        uint64_t v14 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        __int16 v15 = [v14 description];
        *(_DWORD *)buf = 138544130;
        v103 = v12;
        __int16 v104 = 2048;
        v105 = self;
        __int16 v106 = 2112;
        v107 = v13;
        __int16 v108 = 2112;
        v109 = v15;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: %@ Setting vision data output parameters from dictionary: %@", buf, 0x2Au);
      }
      int v16 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      __int16 v17 = [v16 valueForKey:*MEMORY[0x1E4F4D4A0]];
      uint64_t v18 = [v17 BOOLValue];

      uint64_t v19 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      __int16 v20 = [v19 valueForKey:*MEMORY[0x1E4F4D4B0]];
      [v20 floatValue];
      int v22 = v21;

      double v23 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      uint64_t v24 = [v23 valueForKey:*MEMORY[0x1E4F4D4C8]];
      uint64_t v25 = [v24 BOOLValue];

      id v26 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      __int16 v27 = [v26 valueForKey:*MEMORY[0x1E4F4D4D0]];
      uint64_t v28 = [v27 integerValue];

      int v29 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      uint64_t v30 = [v29 valueForKey:*MEMORY[0x1E4F4D4D8]];
      [v30 floatValue];
      int v32 = v31;

      id v33 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      Float64 v34 = [v33 valueForKey:*MEMORY[0x1E4F4D4F0]];
      [v34 floatValue];
      float v36 = v35;

      uint32_t v37 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      __int16 v38 = [v37 valueForKey:*MEMORY[0x1E4F4D4F8]];
      uint64_t v39 = [v38 integerValue];

      __int16 v40 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      double v41 = [v40 valueForKey:*MEMORY[0x1E4F4D500]];
      [v41 floatValue];
      float v43 = v42;

      CMTime v44 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      v45 = [v44 valueForKey:*MEMORY[0x1E4F4D508]];
      [v45 floatValue];
      float v47 = v46;

      [(AVCaptureVisionDataOutput *)self->_visionDataOutput setFeatureBinningEnabled:v18];
      LODWORD(v48) = v22;
      [(AVCaptureVisionDataOutput *)self->_visionDataOutput setKeypointDetectionThreshold:v48];
      [(AVCaptureVisionDataOutput *)self->_visionDataOutput setFeatureOrientationAssignmentEnabled:v25];
      [(AVCaptureVisionDataOutput *)self->_visionDataOutput setGaussianPyramidOctavesCount:v28];
      LODWORD(v49) = v32;
      [(AVCaptureVisionDataOutput *)self->_visionDataOutput setGaussianPyramidBaseOctaveDownscalingFactor:v49];
      CMTimeMakeWithSeconds(&v101, v36, 1000);
      __int16 v50 = self->_visionDataOutput;
      CMTime v100 = v101;
      [(AVCaptureVisionDataOutput *)v50 setMaxBurstDuration:&v100];
      [(AVCaptureVisionDataOutput *)self->_visionDataOutput setMaxKeypointsCount:v39];
      [(ARImageSensor *)self _createCMTimeFractionFromDecimalDuration:v43];
      CMTime v51 = self->_visionDataOutput;
      long long v96 = v98;
      uint64_t v97 = v99;
      [(AVCaptureVisionDataOutput *)v51 setMinBurstFrameDuration:&v96];
      CMTimeMakeWithSeconds(&v95, v47, 1000);
      __int16 v52 = self->_visionDataOutput;
      CMTime v94 = v95;
      [(AVCaptureVisionDataOutput *)v52 setMinFrameDuration:&v94];
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isDynamicThresholdingSupported])
      {
        uint64_t v53 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        uint64_t v54 = [v53 valueForKey:*MEMORY[0x1E4F4D498]];
        -[AVCaptureVisionDataOutput setDynamicThresholdingEnabled:](self->_visionDataOutput, "setDynamicThresholdingEnabled:", [v54 BOOLValue]);
      }
      Float64 v55 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
      __int16 v56 = [v55 valueForKey:*MEMORY[0x1E4F4D4A8]];
      uint64_t v57 = [v56 integerValue];

      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isKeypointDetectionFlowTypeSupported:v57])[(AVCaptureVisionDataOutput *)self->_visionDataOutput setKeypointDetectionFlowType:v57]; {
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isSubPixelThresholdSupported])
      }
      {
        uint64_t v58 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v59 = [v58 valueForKey:*MEMORY[0x1E4F4D528]];
        -[AVCaptureVisionDataOutput setSubPixelThreshold:](self->_visionDataOutput, "setSubPixelThreshold:", [v59 integerValue]);
      }
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isFeatureMatchingSupported])
      {
        v60 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v61 = [v60 valueForKey:*MEMORY[0x1E4F4D4C0]];
        -[AVCaptureVisionDataOutput setFeatureMatchingEnabled:](self->_visionDataOutput, "setFeatureMatchingEnabled:", [v61 BOOLValue]);

        v62 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v63 = [v62 valueForKey:*MEMORY[0x1E4F4D4B8]];
        -[AVCaptureVisionDataOutput setFeatureMatchingDescriptorSize:](self->_visionDataOutput, "setFeatureMatchingDescriptorSize:", [v63 integerValue]);
      }
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isOrientationDistanceThresholdSupported])
      {
        v64 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v65 = [v64 valueForKey:*MEMORY[0x1E4F4D510]];
        [v65 floatValue];
        -[AVCaptureVisionDataOutput setOrientationDistanceThreshold:](self->_visionDataOutput, "setOrientationDistanceThreshold:");
      }
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isSigmaDistanceThresholdSupported])
      {
        v66 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v67 = [v66 valueForKey:*MEMORY[0x1E4F4D518]];
        [v67 floatValue];
        -[AVCaptureVisionDataOutput setSigmaDistanceThreshold:](self->_visionDataOutput, "setSigmaDistanceThreshold:");
      }
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isSquareDistanceDisparityFractionSupported])
      {
        double v68 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        double v69 = [v68 valueForKey:*MEMORY[0x1E4F4D520]];
        [v69 floatValue];
        -[AVCaptureVisionDataOutput setSquareDistanceDisparityFraction:](self->_visionDataOutput, "setSquareDistanceDisparityFraction:");
      }
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isHammingDistanceThresholdSupported])
      {
        CMTime v70 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v71 = [v70 valueForKey:*MEMORY[0x1E4F4D4E0]];
        -[AVCaptureVisionDataOutput setHammingDistanceThreshold:](self->_visionDataOutput, "setHammingDistanceThreshold:", [v71 integerValue]);
      }
      if ([(AVCaptureVisionDataOutput *)self->_visionDataOutput isLACCConfigAndMetadataSupported])
      {
        id v72 = [(ARImageSensorSettings *)self->_settings visionDataOutputParameters];
        v73 = [v72 valueForKey:*MEMORY[0x1E4F4D4E8]];
        [(AVCaptureVisionDataOutput *)self->_visionDataOutput setLaccConfigAndMetadata:v73];
      }
    }
    goto LABEL_2;
  }
  id v74 = [(AVCaptureDeviceInput *)self->_videoInput device];
  __int16 v75 = [v74 deviceType];

  if (v75 == (void *)*MEMORY[0x1E4F157F0] || v75 == (void *)*MEMORY[0x1E4F157E8] || v75 == (void *)*MEMORY[0x1E4F15818])
  {
    id v78 = (id)*MEMORY[0x1E4F15830];

    __int16 v75 = v78;
  }
  videoInput = self->_videoInput;
  Float64 v80 = [(AVCaptureDeviceInput *)videoInput device];
  __int16 v81 = -[AVCaptureDeviceInput portsWithMediaType:sourceDeviceType:sourceDevicePosition:](videoInput, "portsWithMediaType:sourceDeviceType:sourceDevicePosition:", *MEMORY[0x1E4F15C20], v75, [v80 position]);
  uint64_t v82 = [v81 firstObject];

  if (v82)
  {
    uint64_t v83 = (void *)MEMORY[0x1E4F16410];
    v110[0] = v82;
    v84 = [MEMORY[0x1E4F1C978] arrayWithObjects:v110 count:1];
    v85 = [v83 connectionWithInputPorts:v84 output:self->_visionDataOutput];
    visionDataConnection = self->_visionDataConnection;
    self->_visionDataConnection = v85;

    if ([(AVCaptureSession *)self->_captureSession canAddConnection:self->_visionDataConnection])
    {
      [(NSMutableArray *)self->_connections addObject:self->_visionDataConnection];
      [(AVCaptureSession *)self->_captureSession addConnection:self->_visionDataConnection];

      goto LABEL_9;
    }
    v87 = _ARLogSensor_9();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v91 = (objc_class *)objc_opt_class();
      id v92 = NSStringFromClass(v91);
      uint64_t v93 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v103 = v92;
      __int16 v104 = 2048;
      v105 = self;
      __int16 v106 = 2112;
      v107 = v93;
      _os_log_impl(&dword_1B88A2000, v87, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot add vision data connection to capture session", buf, 0x20u);
    }
  }
  else
  {
    v87 = _ARLogSensor_9();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_ERROR))
    {
      v88 = (objc_class *)objc_opt_class();
      v89 = NSStringFromClass(v88);
      v90 = [(ARImageSensor *)self logPrefix];
      *(_DWORD *)buf = 138543874;
      v103 = v89;
      __int16 v104 = 2048;
      v105 = self;
      __int16 v106 = 2112;
      v107 = v90;
      _os_log_impl(&dword_1B88A2000, v87, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ Cannot find a vision data port in the input added to the capture session", buf, 0x20u);
    }
  }

  uint64_t v5 = ARErrorWithCodeAndUserInfo(102, 0);

LABEL_3:
  return v5;
}

- (void)enableContinuousAutoFocusIfPossible
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(ARImageSensor *)self runningSingleShotAutoFocus]
    && [(AVCaptureDevice *)self->_captureDevice focusMode] == AVCaptureFocusModeLocked)
  {
    [(ARImageSensor *)self setRunningSingleShotAutoFocus:0];
    float v3 = _ARLogSensor_9();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      id v4 = (objc_class *)objc_opt_class();
      uint64_t v5 = NSStringFromClass(v4);
      BOOL v6 = [(ARImageSensor *)self logPrefix];
      int v7 = 138543874;
      id v8 = v5;
      __int16 v9 = 2048;
      int v10 = self;
      __int16 v11 = 2112;
      __int16 v12 = v6;
      _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Enabling continuous auto focus after single shot auto focus is locked.", (uint8_t *)&v7, 0x20u);
    }
    [(ARImageSensor *)self enableAutoFocusForDevice:self->_captureDevice];
  }
}

- (void)trackExposureTargetOffsetIfNeededForImageData:(id)a3 shouldDrop:(BOOL *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([(ARImageSensorSettings *)self->_settings dropsInitialFramesOutsideExposureTargetOffsetThreshold]&& !self->_reachedExposureTargetOffsetThreshold)
  {
    [v6 timestamp];
    [v6 exposureTargetOffset];
    kdebug_trace();
    ++self->_initialImageDatasCounter;
    [v6 exposureTargetOffset];
    float v9 = v8;
    [(ARImageSensorSettings *)self->_settings negativeExposureTargetOffsetThreshold];
    if (v9 >= v10
      && ([v6 exposureTargetOffset],
          float v12 = v11,
          [(ARImageSensorSettings *)self->_settings positiveExposureTargetOffsetThreshold], v12 <= v13)|| (unint64_t v14 = self->_initialImageDatasCounter, v14 > [(ARImageSensorSettings *)self->_settings maximumNumberOfInitialFramesDropped]))
    {
      __int16 v15 = _ARLogSensor_9();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = (objc_class *)objc_opt_class();
        __int16 v17 = NSStringFromClass(v16);
        unint64_t initialImageDatasCounter = self->_initialImageDatasCounter;
        [v6 exposureTargetOffset];
        double v20 = v19;
        [(ARImageSensorSettings *)self->_settings negativeExposureTargetOffsetThreshold];
        double v22 = v21;
        [(ARImageSensorSettings *)self->_settings positiveExposureTargetOffsetThreshold];
        int v41 = 138544642;
        float v42 = v17;
        __int16 v43 = 2048;
        CMTime v44 = self;
        __int16 v45 = 2048;
        double v46 = *(double *)&initialImageDatasCounter;
        __int16 v47 = 2048;
        double v48 = v20;
        __int16 v49 = 2048;
        double v50 = v22;
        __int16 v51 = 2048;
        double v52 = v23;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Finished dropping initial frames after %lu frames due to absolute exposureTargetOffset value being below or above threshold: exposureTargetOffset=%f, negativeExposureTargetOffsetThreshold=%f, positiveExposureTargetOffsetThreshold=%f", (uint8_t *)&v41, 0x3Eu);
      }
      self->_reachedExposureTargetOffsetThreshold = 1;
      if (a4) {
        goto LABEL_4;
      }
      goto LABEL_6;
    }
    [v6 exposureTargetOffset];
    float v25 = v24;
    [(ARImageSensorSettings *)self->_settings negativeExposureTargetOffsetThreshold];
    if (v25 >= v26)
    {
      [v6 exposureTargetOffset];
      float v35 = v34;
      [(ARImageSensorSettings *)self->_settings positiveExposureTargetOffsetThreshold];
      if (v35 <= v36)
      {
LABEL_22:
        if (!a4) {
          goto LABEL_6;
        }
        BOOL v7 = 1;
        goto LABEL_5;
      }
      __int16 v27 = _ARLogSensor_9();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint32_t v37 = (objc_class *)objc_opt_class();
        int v29 = NSStringFromClass(v37);
        [v6 exposureTargetOffset];
        double v39 = v38;
        [(ARImageSensorSettings *)self->_settings positiveExposureTargetOffsetThreshold];
        int v41 = 138544130;
        float v42 = v29;
        __int16 v43 = 2048;
        CMTime v44 = self;
        __int16 v45 = 2048;
        double v46 = v39;
        __int16 v47 = 2048;
        double v48 = v40;
        id v33 = "%{public}@ <%p>: Dropping initial frame due to absolute exposureTargetOffset value being above positive th"
              "reshold: exposureTargetOffset=%f, positiveExposureTargetOffsetThreshold=%f";
        goto LABEL_20;
      }
    }
    else
    {
      __int16 v27 = _ARLogSensor_9();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = (objc_class *)objc_opt_class();
        int v29 = NSStringFromClass(v28);
        [v6 exposureTargetOffset];
        double v31 = v30;
        [(ARImageSensorSettings *)self->_settings negativeExposureTargetOffsetThreshold];
        int v41 = 138544130;
        float v42 = v29;
        __int16 v43 = 2048;
        CMTime v44 = self;
        __int16 v45 = 2048;
        double v46 = v31;
        __int16 v47 = 2048;
        double v48 = v32;
        id v33 = "%{public}@ <%p>: Dropping initial frame due to absolute exposureTargetOffset value being below negative th"
              "reshold: exposureTargetOffset=%f, negativeExposureTargetOffsetThreshold=%f";
LABEL_20:
        _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_INFO, v33, (uint8_t *)&v41, 0x2Au);
      }
    }

    goto LABEL_22;
  }
  if (a4)
  {
LABEL_4:
    BOOL v7 = 0;
LABEL_5:
    *a4 = v7;
  }
LABEL_6:
}

- (void)resetExposureTracking
{
  self->_reachedExposureTargetOffsetThreshold = 0;
  self->_unint64_t initialImageDatasCounter = 0;
}

- (void)setInterrupted:(BOOL)a3
{
  if (self->_interrupted != a3)
  {
    self->_interrupted = a3;
    if (a3) {
      [(ARImageSensor *)self resetExposureTracking];
    }
  }
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)_createCMTimeFractionFromDecimalDuration:(SEL)a3
{
  [&unk_1F125BA38 doubleValue];
  if (fabs(a4 + -1.0 / v6) >= 0.00001)
  {
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMakeWithSeconds((CMTime *)retstr, a4, 1000);
  }
  else
  {
    int32_t v7 = [&unk_1F125BA38 intValue];
    return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMTimeMake((CMTime *)retstr, 1, v7);
  }
}

- (id)_defaultPhotoSettings
{
  v19[1] = *MEMORY[0x1E4F143B8];
  float v3 = (void *)MEMORY[0x1E4F16488];
  uint64_t v18 = *MEMORY[0x1E4F24D70];
  v19[0] = &unk_1F125BA50;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  uint64_t v5 = [v3 photoSettingsWithFormat:v4];

  photoOutput = self->_photoOutput;
  if (photoOutput)
  {
    objc_msgSend(v5, "setPhotoQualityPrioritization:", -[AVCapturePhotoOutput maxPhotoQualityPrioritization](photoOutput, "maxPhotoQualityPrioritization"));
    objc_msgSend(v5, "setMaxPhotoDimensions:", -[AVCapturePhotoOutput maxPhotoDimensions](self->_photoOutput, "maxPhotoDimensions"));
  }
  else
  {
    int32_t v7 = _ARLogSensor_9();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      float v8 = (objc_class *)objc_opt_class();
      float v9 = NSStringFromClass(v8);
      float v10 = [(ARImageSensor *)self logPrefix];
      int v12 = 138543874;
      float v13 = v9;
      __int16 v14 = 2048;
      __int16 v15 = self;
      __int16 v16 = 2112;
      __int16 v17 = v10;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: %@ Could not set all properties for defaultPhotoSettings because photo output has not been created yet.", (uint8_t *)&v12, 0x20u);
    }
  }
  return v5;
}

+ (float)defaultLensPosition
{
  if (defaultLensPosition_onceToken != -1) {
    dispatch_once(&defaultLensPosition_onceToken, &__block_literal_global_101);
  }
  return *(float *)&defaultLensPosition_lensPosition;
}

uint64_t __36__ARImageSensor_defaultLensPosition__block_invoke()
{
  uint64_t result = MGIsDeviceOneOfType();
  if (result)
  {
    int v1 = 1062836634;
  }
  else
  {
    uint64_t result = MGIsDeviceOneOfType();
    if (!result) {
      return result;
    }
    int v1 = 1061997773;
  }
  defaultLensPosition_lensPosition = v1;
  return result;
}

+ ($2825F4736939C4A6D3AD43837233062D)maxPhotoDimensionsForVideoFormat:(id)a3 maximumHeight:(int)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int32_t v7 = [v6 supportedMaxPhotoDimensions];
  uint64_t v8 = [v7 count];

  if (!v8)
  {
    float v9 = _ARLogSensor_9();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      float v10 = (objc_class *)objc_opt_class();
      float v11 = NSStringFromClass(v10);
      int v12 = [v6 description];
      *(_DWORD *)buf = 138543874;
      double v31 = v11;
      __int16 v32 = 2048;
      id v33 = a1;
      __int16 v34 = 2112;
      float v35 = v12;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Returning {0, 0} for maxPhotoDimensions because the supportedMaxPhotoDimensions array is empty for video format: %@", buf, 0x20u);
    }
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  float v13 = objc_msgSend(v6, "supportedMaxPhotoDimensions", 0);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    LODWORD(v16) = 0;
    LODWORD(v17) = 0;
    uint64_t v18 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v13);
        }
        uint64_t v20 = [*(id *)(*((void *)&v25 + 1) + 8 * i) CMVideoDimensionsValue];
        BOOL v22 = (int)v17 >= (int)v20 || SHIDWORD(v20) > a4;
        if (v22) {
          uint64_t v16 = v16;
        }
        else {
          uint64_t v16 = HIDWORD(v20);
        }
        if (v22) {
          uint64_t v17 = v17;
        }
        else {
          uint64_t v17 = v20;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v15);
    uint64_t v23 = v16 << 32;
  }
  else
  {
    uint64_t v23 = 0;
    uint64_t v17 = 0;
  }

  return ($2825F4736939C4A6D3AD43837233062D)(v23 | v17);
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  objc_msgSend(a5, "output", a3);
  int32_t v7 = (AVCaptureVideoDataOutput *)objc_claimAutoreleasedReturnValue();
  videoOutput = self->_videoOutput;

  if (v7 == videoOutput)
  {
    float v9 = [ARImageData alloc];
    int64_t v10 = [(ARImageSensor *)self captureFramesPerSecond];
    float v11 = [(ARImageSensor *)self captureDevice];
    int v12 = [(ARImageSensor *)self captureSession];
    float v13 = [(ARImageData *)v9 initWithSampleBuffer:a4 captureFramePerSecond:v10 captureDevice:v11 captureSession:v12];

    +[ARImageSensor registerSignPostForImageData:v13];
    [(ARImageSensor *)self _dispatchImageData:v13];
  }
}

- (void)captureOutput:(id)a3 didDropSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int32_t v7 = CMGetAttachment(a4, (CFStringRef)*MEMORY[0x1E4F1F240], 0);
  CMSampleBufferGetPresentationTimeStamp(&time, a4);
  Float64 Seconds = CMTimeGetSeconds(&time);
  float v9 = _ARLogSensor_9();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v10 = (objc_class *)objc_opt_class();
    float v11 = NSStringFromClass(v10);
    int v12 = [(ARImageSensor *)self logPrefix];
    *(_DWORD *)buf = 138544386;
    uint64_t v15 = v11;
    __int16 v16 = 2048;
    uint64_t v17 = self;
    __int16 v18 = 2112;
    float v19 = v12;
    __int16 v20 = 2048;
    Float64 v21 = Seconds;
    __int16 v22 = 2112;
    uint64_t v23 = v7;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ capture session dropped video frame: %f, %@", buf, 0x34u);
  }
}

- (void)_logIfDataIsMissingWithVideoData:(id)a3 visionData:(id)a4 calibrationData:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    float v11 = _ARLogSensor_9();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    float v19 = (objc_class *)objc_opt_class();
    float v13 = NSStringFromClass(v19);
    uint64_t v14 = [(ARImageSensor *)self captureDevice];
    uint64_t v15 = [v14 deviceType];
    int v43 = 138543874;
    CMTime v44 = v13;
    __int16 v45 = 2048;
    double v46 = self;
    __int16 v47 = 2112;
    double v48 = v15;
    __int16 v16 = "%{public}@ <%p>: %@: No video frame received. Dropping frame!";
    goto LABEL_10;
  }
  if (![v8 sampleBufferWasDropped])
  {
    if ([v8 sampleBuffer]) {
      goto LABEL_13;
    }
    float v11 = _ARLogSensor_9();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_12;
    }
    __int16 v20 = (objc_class *)objc_opt_class();
    float v13 = NSStringFromClass(v20);
    uint64_t v14 = [(ARImageSensor *)self captureDevice];
    uint64_t v15 = [v14 deviceType];
    int v43 = 138543874;
    CMTime v44 = v13;
    __int16 v45 = 2048;
    double v46 = self;
    __int16 v47 = 2112;
    double v48 = v15;
    __int16 v16 = "%{public}@ <%p>: %@: No video frame received. Dropping frame! No reason provided";
LABEL_10:
    uint64_t v17 = v11;
    uint32_t v18 = 32;
    goto LABEL_11;
  }
  float v11 = _ARLogSensor_9();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    int v12 = (objc_class *)objc_opt_class();
    float v13 = NSStringFromClass(v12);
    uint64_t v14 = [(ARImageSensor *)self captureDevice];
    uint64_t v15 = [v14 deviceType];
    int v43 = 138544130;
    CMTime v44 = v13;
    __int16 v45 = 2048;
    double v46 = self;
    __int16 v47 = 2112;
    double v48 = v15;
    __int16 v49 = 2048;
    uint64_t v50 = [v8 droppedReason];
    __int16 v16 = "%{public}@ <%p>: %@: No video frame received. Dropping frame! Reason: %ld";
    uint64_t v17 = v11;
    uint32_t v18 = 42;
LABEL_11:
    _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v43, v18);
  }
LABEL_12:

LABEL_13:
  if (!v9) {
    goto LABEL_22;
  }
  if ([v9 visionDataWasDropped])
  {
    Float64 v21 = _ARLogSensor_9();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      __int16 v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      uint64_t v24 = [(ARImageSensor *)self captureDevice];
      long long v25 = [v24 deviceType];
      uint64_t v26 = [v9 droppedReason];
      int v43 = 138544130;
      CMTime v44 = v23;
      __int16 v45 = 2048;
      double v46 = self;
      __int16 v47 = 2112;
      double v48 = v25;
      __int16 v49 = 2048;
      uint64_t v50 = v26;
      long long v27 = "%{public}@ <%p>: %@: Video frame received without vision data. Reason: %ld";
      long long v28 = v21;
      uint32_t v29 = 42;
LABEL_20:
      _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_ERROR, v27, (uint8_t *)&v43, v29);
    }
  }
  else
  {
    if ([v9 visionDataPixelBuffer]) {
      goto LABEL_22;
    }
    Float64 v21 = _ARLogSensor_9();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      float v30 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v30);
      uint64_t v24 = [(ARImageSensor *)self captureDevice];
      long long v25 = [v24 deviceType];
      int v43 = 138543874;
      CMTime v44 = v23;
      __int16 v45 = 2048;
      double v46 = self;
      __int16 v47 = 2112;
      double v48 = v25;
      long long v27 = "%{public}@ <%p>: %@: Video frame received without vision data. No reason provided";
      long long v28 = v21;
      uint32_t v29 = 32;
      goto LABEL_20;
    }
  }

LABEL_22:
  if (!v10)
  {
    double v31 = _ARLogSensor_9();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    float v40 = (objc_class *)objc_opt_class();
    id v33 = NSStringFromClass(v40);
    __int16 v34 = [(ARImageSensor *)self captureDevice];
    float v35 = [v34 deviceType];
    int v43 = 138543874;
    CMTime v44 = v33;
    __int16 v45 = 2048;
    double v46 = self;
    __int16 v47 = 2112;
    double v48 = v35;
    uint32_t v37 = "%{public}@ <%p>: %@: Video frame received without camera calibration data. Dropping frame!";
LABEL_31:
    float v38 = v31;
    uint32_t v39 = 32;
    goto LABEL_32;
  }
  if ([v10 cameraCalibrationDataWasDropped])
  {
    double v31 = _ARLogSensor_9();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      __int16 v32 = (objc_class *)objc_opt_class();
      id v33 = NSStringFromClass(v32);
      __int16 v34 = [(ARImageSensor *)self captureDevice];
      float v35 = [v34 deviceType];
      uint64_t v36 = [v10 droppedReason];
      int v43 = 138544130;
      CMTime v44 = v33;
      __int16 v45 = 2048;
      double v46 = self;
      __int16 v47 = 2112;
      double v48 = v35;
      __int16 v49 = 2048;
      uint64_t v50 = v36;
      uint32_t v37 = "%{public}@ <%p>: %@: Video frame received without camera calibration data. Dropping frame! Reason: %ld";
      float v38 = v31;
      uint32_t v39 = 42;
LABEL_32:
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, v37, (uint8_t *)&v43, v39);
    }
LABEL_33:

    goto LABEL_34;
  }
  int v41 = [v10 cameraCalibrationData];

  if (!v41)
  {
    double v31 = _ARLogSensor_9();
    if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      goto LABEL_33;
    }
    float v42 = (objc_class *)objc_opt_class();
    id v33 = NSStringFromClass(v42);
    __int16 v34 = [(ARImageSensor *)self captureDevice];
    float v35 = [v34 deviceType];
    int v43 = 138543874;
    CMTime v44 = v33;
    __int16 v45 = 2048;
    double v46 = self;
    __int16 v47 = 2112;
    double v48 = v35;
    uint32_t v37 = "%{public}@ <%p>: %@: Video frame received without camera calibration data. Dropping frame! No reason provided";
    goto LABEL_31;
  }
LABEL_34:
}

- (void)dataOutputSynchronizer:(id)a3 didOutputSynchronizedDataCollection:(id)a4
{
  id v5 = a4;
  [v5 count];
  kdebug_trace();
  id v6 = [v5 synchronizedDataForCaptureOutput:self->_videoOutput];
  int32_t v7 = [v5 synchronizedDataForCaptureOutput:self->_visionDataOutput];
  id v8 = [v5 synchronizedDataForCaptureOutput:self->_calibrationOutput];

  if (!self->_calibrationOutput
    || (-[ARImageSensor _logIfDataIsMissingWithVideoData:visionData:calibrationData:](self, "_logIfDataIsMissingWithVideoData:visionData:calibrationData:", v6, v7, v8), v8)&& ![v8 cameraCalibrationDataWasDropped]&& (objc_msgSend(v8, "cameraCalibrationData"), id v9 = objc_claimAutoreleasedReturnValue(), v9, v6)&& v9)
  {
    id v10 = [v8 cameraCalibrationData];
    cameraCalibrationData = self->_cameraCalibrationData;
    self->_cameraCalibrationData = v10;

    int v12 = [ARImageData alloc];
    uint64_t v13 = [v6 sampleBuffer];
    int64_t v14 = [(ARImageSensor *)self captureFramesPerSecond];
    uint64_t v15 = [(ARImageSensor *)self captureDevice];
    __int16 v16 = [(ARImageSensor *)self captureSession];
    uint64_t v17 = [(ARImageData *)v12 initWithSampleBuffer:v13 captureFramePerSecond:v14 captureDevice:v15 captureSession:v16];

    -[ARImageData setVisionData:](v17, "setVisionData:", [v7 visionDataPixelBuffer]);
    [(ARImageData *)v17 setCalibrationData:self->_cameraCalibrationData];
    +[ARImageSensor registerSignPostForImageData:v17];
    [(ARImageSensor *)self _dispatchImageData:v17];
    [(ARImageData *)v17 timestamp];
    if (v7)
    {
      [v7 timestamp];
      CMTimeGetSeconds(&time);
    }
    kdebug_trace();
  }
  else
  {
    kdebug_trace();
  }
}

- (void)cameraCalibrationDataOutput:(id)a3 didOutputCameraCalibrationData:(id)a4 timestamp:(id *)a5 connection:(id)a6
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int32_t v7 = _ARLogSensor_9();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    id v10 = [(ARImageSensor *)self logPrefix];
    int v11 = 138543874;
    int v12 = v9;
    __int16 v13 = 2048;
    int64_t v14 = self;
    __int16 v15 = 2112;
    __int16 v16 = v10;
    _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ cameraCalibrationDataOutput:didOutputCameraCalibrationData called without an AVCaptureDataOutputSynchronizer, not supported.", (uint8_t *)&v11, 0x20u);
  }
}

- (void)cameraCalibrationDataOutput:(id)a3 didDropCameraCalibrationDataAtTimestamp:(id *)a4 connection:(id)a5 reason:(int64_t)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v9 = _ARLogSensor_9();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = (objc_class *)objc_opt_class();
    int v11 = NSStringFromClass(v10);
    int v12 = [(ARImageSensor *)self logPrefix];
    $3CC8671D27C23BF42ADDB32F2B5E48AE v15 = *a4;
    double Seconds = CMTimeGetSeconds((CMTime *)&v15);
    if ((unint64_t)a6 > 3) {
      int64_t v14 = @"Undefined";
    }
    else {
      int64_t v14 = off_1E6187F40[a6];
    }
    LODWORD(v15.var0) = 138544386;
    *(int64_t *)((char *)&v15.var0 + 4) = (int64_t)v11;
    LOWORD(v15.var2) = 2048;
    *(void *)((char *)&v15.var2 + 2) = self;
    HIWORD(v15.var3) = 2112;
    __int16 v16 = v12;
    __int16 v17 = 2048;
    double v18 = Seconds;
    __int16 v19 = 2112;
    __int16 v20 = v14;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: %@ capture session dropped calibration data: %lf, %@", (uint8_t *)&v15, 0x34u);
  }
}

- (void)_dispatchImageData:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
LABEL_17:
    kdebug_trace();
    goto LABEL_18;
  }
  [(ARImageSensor *)self enableContinuousAutoFocusIfPossible];
  char v56 = 0;
  [(ARImageSensor *)self trackExposureTargetOffsetIfNeededForImageData:v4 shouldDrop:&v56];
  if (!v56)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      extrinsicsMap = self->_extrinsicsMap;
      if (!extrinsicsMap)
      {
        id v8 = objc_loadWeakRetained((id *)&self->_dataSource);
        id v9 = [v8 captureDeviceTypeToExtrinsicsMapForImageSensor:self];
        id v10 = self->_extrinsicsMap;
        self->_extrinsicsMap = v9;

        extrinsicsMap = self->_extrinsicsMap;
      }
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      int v11 = [(NSMutableDictionary *)extrinsicsMap allKeys];
      uint64_t v12 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v53;
        do
        {
          uint64_t v15 = 0;
          int v16 = v44;
          int v17 = v45;
          int v18 = v46;
          int v19 = v47;
          __int32 v20 = v48;
          __int32 v21 = v49;
          __int32 v22 = v50;
          __int32 v23 = v51;
          do
          {
            __int32 v50 = v22;
            __int32 v51 = v23;
            __int32 v48 = v20;
            __int32 v49 = v21;
            int v46 = v18;
            int v47 = v19;
            int v44 = v16;
            int v45 = v17;
            if (*(void *)v53 != v14) {
              objc_enumerationMutation(v11);
            }
            uint64_t v24 = *(void *)(*((void *)&v52 + 1) + 8 * v15);
            long long v25 = [(NSMutableDictionary *)self->_extrinsicsMap objectForKeyedSubscript:v24];
            *(double *)v26.i64 = ARMatrix4x3FromNSData(v25);
            simd_float4 v27 = v26;
            v27.i32[3] = v51;
            v59.columns[1].i32[3] = v50;
            v59.columns[2].i32[3] = v49;
            v59.columns[3].i32[3] = v48;
            v59.columns[0] = v27;
            [v4 addExtrinsicMatrix:v24 toDeviceType:ARMatrix4x3Inverse(v59)];

            int v16 = v44;
            int v17 = v45;
            int v18 = v46;
            int v19 = v47;
            __int32 v20 = v48;
            __int32 v21 = v49;
            __int32 v22 = v50;
            __int32 v23 = v51;
            ++v15;
          }
          while (v13 != v15);
          uint64_t v13 = [v11 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v13);
      }
    }
    long long v28 = [(ARImageSensor *)self bufferPopulationMonitor];
    uint64_t v29 = [v4 pixelBuffer];
    float v30 = [(ARImageSensor *)self captureDevice];
    double v31 = [v30 localizedName];
    [v4 timestamp];
    double v33 = v32;
    __int16 v34 = [(ARImageSensor *)self captureDevice];
    float v35 = [v34 deviceType];
    [v28 trackPixelBuffer:v29 withLabel:v31 timestamp:ARBufferPopulationMonitorSignpostTypeForCaptureDevice(v35) signpostType:v33];

    if ([v4 visionData])
    {
      uint64_t v36 = [(ARImageSensor *)self bufferPopulationMonitor];
      uint64_t v37 = [v4 visionData];
      float v38 = NSString;
      uint32_t v39 = [(ARImageSensor *)self captureDevice];
      float v40 = [v39 localizedName];
      int v41 = [v38 stringWithFormat:@"%@ Vision Data", v40];
      [v4 timestamp];
      objc_msgSend(v36, "trackPixelBuffer:withLabel:timestamp:signpostType:", v37, v41, 3);
    }
    [v4 timestamp];
    float v42 = [v4 captureDate];
    [v42 timeIntervalSinceNow];
    kdebug_trace();

    [v4 timestamp];
    kdebug_trace();
    int v43 = [(ARImageSensor *)self delegate];
    [v43 sensor:self didOutputSensorData:v4];

    [v4 timestamp];
    kdebug_trace();
    [v4 timestamp];
    goto LABEL_17;
  }
LABEL_18:
}

+ (void)registerSignPostForImageData:(id)a3
{
  id v18 = a3;
  [v18 isHighResolution];
  float v3 = [v18 cameraType];
  int v4 = [v3 isEqualToString:*MEMORY[0x1E4F15830]];

  if (v4)
  {
    uint64_t v5 = [v18 cameraPosition];
    if (v5 == 2)
    {
      [v18 timestamp];
      goto LABEL_25;
    }
    if (v5 == 1)
    {
      uint64_t v12 = v18;
LABEL_22:
      [v12 timestamp];
      [v18 imageResolution];
      [v18 imageResolution];
      goto LABEL_25;
    }
    char v6 = v18;
    if (v5) {
      goto LABEL_26;
    }
LABEL_11:
    int v11 = v6;
LABEL_13:
    [v11 timestamp];
LABEL_25:
    kdebug_trace();
    char v6 = v18;
    goto LABEL_26;
  }
  int32_t v7 = [v18 cameraType];
  if ([v7 isEqualToString:*MEMORY[0x1E4F157F0]])
  {
  }
  else
  {
    id v8 = [v18 cameraType];
    int v9 = [v8 isEqualToString:*MEMORY[0x1E4F15818]];

    if (!v9)
    {
      uint64_t v13 = [v18 cameraType];
      int v14 = [v13 isEqualToString:*MEMORY[0x1E4F15820]];

      if (v14)
      {
        [v18 cameraPosition];
        [v18 timestamp];
      }
      else
      {
        uint64_t v15 = [v18 cameraType];
        int v16 = [v15 isEqualToString:*MEMORY[0x1E4F15828]];

        char v6 = v18;
        if (!v16) {
          goto LABEL_26;
        }
        uint64_t v17 = [v18 cameraPosition];
        [v18 timestamp];
        if (v17 == 1)
        {
LABEL_24:
          [v18 imageResolution];
          [v18 imageResolution];
        }
      }
      goto LABEL_25;
    }
  }
  if ([v18 cameraPosition] != 1)
  {
    int v11 = v18;
    goto LABEL_13;
  }
  uint64_t v10 = [v18 captureLens];
  char v6 = v18;
  switch(v10)
  {
    case 0:
      goto LABEL_11;
    case 1:
      uint64_t v12 = v18;
      goto LABEL_22;
    case 2:
      [v18 timestamp];
      goto LABEL_24;
    case 3:
      [v18 timestamp];
      [v18 imageResolution];
      [v18 imageResolution];
      goto LABEL_25;
    default:
      break;
  }
LABEL_26:
  if ([v6 visionData])
  {
    [v18 timestamp];
    kdebug_trace();
  }
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (ARImageSensorDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  return (ARImageSensorDataSource *)WeakRetained;
}

- (void)setDataSource:(id)a3
{
}

- (AVCaptureDevice)captureDevice
{
  return self->_captureDevice;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (AVCaptureDeviceInput)videoInput
{
  return self->_videoInput;
}

- (void)setVideoInput:(id)a3
{
}

- (AVCaptureVideoDataOutput)videoOutput
{
  return self->_videoOutput;
}

- (AVCaptureConnection)videoConnection
{
  return self->_videoConnection;
}

- (void)setVideoConnection:(id)a3
{
}

- (AVCapturePhotoOutput)photoOutput
{
  return self->_photoOutput;
}

- (AVCaptureConnection)calibrationConnection
{
  return self->_calibrationConnection;
}

- (AVCaptureConnection)visionDataConnection
{
  return self->_visionDataConnection;
}

- (AVCaptureDataOutputSynchronizer)outputSynchronizer
{
  return self->_outputSynchronizer;
}

- (OS_dispatch_queue)captureQueue
{
  return self->_captureQueue;
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (int64_t)captureFramesPerSecond
{
  return self->_captureFramesPerSecond;
}

- (void)setCaptureFramesPerSecond:(int64_t)a3
{
  self->_captureFramesPerSecond = a3;
}

- (NSMutableArray)connections
{
  return (NSMutableArray *)objc_getProperty(self, a2, 184, 1);
}

- (void)setConnections:(id)a3
{
}

- (float)defaultLensPosition
{
  return self->_defaultLensPosition;
}

- (void)setDefaultLensPosition:(float)a3
{
  self->_defaultLensPosition = a3;
}

- (BOOL)runningSingleShotAutoFocus
{
  return self->_runningSingleShotAutoFocus;
}

- (void)setRunningSingleShotAutoFocus:(BOOL)a3
{
  self->_runningSingleShotAutoFocus = a3;
}

- (AVCaptureCameraCalibrationDataOutput)calibrationOutput
{
  return self->_calibrationOutput;
}

- (ARBufferPopulationMonitor)bufferPopulationMonitor
{
  return self->_bufferPopulationMonitor;
}

- (void)setBufferPopulationMonitor:(id)a3
{
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferPopulationMonitor, 0);
  objc_storeStrong((id *)&self->_calibrationOutput, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_outputSynchronizer, 0);
  objc_storeStrong((id *)&self->_visionDataConnection, 0);
  objc_storeStrong((id *)&self->_calibrationConnection, 0);
  objc_storeStrong((id *)&self->_photoOutput, 0);
  objc_storeStrong((id *)&self->_videoConnection, 0);
  objc_storeStrong((id *)&self->_videoOutput, 0);
  objc_storeStrong((id *)&self->_videoInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_storeStrong((id *)&self->_captureDevice, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_extrinsicsMap, 0);
  objc_storeStrong((id *)&self->_cameraCalibrationData, 0);
  objc_storeStrong((id *)&self->_captureDeviceKeysObserved, 0);
  objc_storeStrong((id *)&self->_visionDataOutput, 0);
}

@end