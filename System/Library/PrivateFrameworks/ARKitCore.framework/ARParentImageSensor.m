@interface ARParentImageSensor
- (ARParentImageSensor)initWithSettings:(id)a3;
- (ARParentImageSensorSettings)settings;
- (ARSensorDelegate)delegate;
- (AVCaptureAudioDataOutput)audioOutput;
- (AVCaptureConnection)audioConnection;
- (AVCaptureDeviceInput)audioInput;
- (AVCaptureSession)captureSession;
- (BOOL)_addSensorForSettings:(id)a3;
- (BOOL)_startWithError:(id *)a3;
- (BOOL)_validateCameraAuthorization;
- (BOOL)_validateMicrophoneAuthorizationWithError:(id *)a3;
- (BOOL)canReconfigure:(id)a3;
- (BOOL)interrupted;
- (BOOL)recordingMode;
- (BOOL)running;
- (BOOL)unrecoverable;
- (NSMutableArray)sensors;
- (NSString)description;
- (id)beforeRunningAVCaptureSession;
- (id)captureDeviceTypeToExtrinsicsMapForImageSensor:(id)a3;
- (unint64_t)powerUsage;
- (unint64_t)providedDataTypes;
- (void)_addSensors;
- (void)_captureSessionStateChanged:(id)a3;
- (void)_configureAudioCapture;
- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3;
- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5;
- (void)captureSessionStateChanged:(id)a3;
- (void)dealloc;
- (void)forceUpdatePowerUsage:(unint64_t)a3;
- (void)reconfigure:(id)a3;
- (void)setBeforeRunningAVCaptureSession:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInterrupted:(BOOL)a3;
- (void)setPowerUsage:(unint64_t)a3;
- (void)setRecordingMode:(BOOL)a3;
- (void)setRunning:(BOOL)a3;
- (void)setSensors:(id)a3;
- (void)setUnrecoverable:(BOOL)a3;
- (void)start;
- (void)stop;
- (void)teardown;
- (void)waitForOutstandingCallbacks;
@end

@implementation ARParentImageSensor

- (ARParentImageSensor)initWithSettings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)ARParentImageSensor;
  id v5 = [(ARParentImageSensor *)&v23 init];
  if (v5)
  {
    if (!ARDeviceSupportsMulticamMode() || (ARUserDefaultsMulticamModeEnabled() & 1) == 0) {
      ARDeviceSupportsJasper();
    }
    uint64_t v6 = objc_opt_new();
    v7 = (void *)*((void *)v5 + 10);
    *((void *)v5 + 10) = v6;

    uint64_t v8 = objc_opt_new();
    v9 = (void *)*((void *)v5 + 1);
    *((void *)v5 + 1) = v8;

    uint64_t v10 = objc_opt_new();
    v11 = (void *)*((void *)v5 + 7);
    *((void *)v5 + 7) = v10;

    uint64_t v12 = [v4 copy];
    v13 = (void *)*((void *)v5 + 6);
    *((void *)v5 + 6) = v12;

    *((unsigned char *)v5 + 40) = 0;
    *((unsigned char *)v5 + 43) = 0;
    if ([v4 allowCameraInMultipleForegroundAppLayout])
    {
      v14 = _ARLogSensor_1();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138543618;
        v25 = v16;
        __int16 v26 = 2048;
        id v27 = v5;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Setting authorization to use camera in multiple foreground apps.", buf, 0x16u);
      }
      AVCaptureSessionSetAuthorizedToUseCameraInMultipleForegroundAppLayout();
    }
    uint64_t v17 = ARCreateFixedPriorityDispatchQueueWithPropagatedQOS("com.apple.arkit.capture", QOS_CLASS_USER_INTERACTIVE, 0);
    v18 = (void *)*((void *)v5 + 2);
    *((void *)v5 + 2) = v17;

    v19 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v20 = dispatch_queue_create_with_target_V2("com.apple.arkit.ARParentImageSensor.captureSessionNotificationsQueue", v19, *((dispatch_queue_t *)v5 + 2));
    v21 = (void *)*((void *)v5 + 4);
    *((void *)v5 + 4) = v20;

    *((_DWORD *)v5 + 6) = 0;
    [v5 _addSensors];
  }

  return (ARParentImageSensor *)v5;
}

- (void)_addSensors
{
  v3 = [(ARParentImageSensorSettings *)self->_settings settings];
  id v6 = (id)[v3 mutableCopy];

  if ([v6 count])
  {
    unint64_t v4 = 0;
    do
    {
      id v5 = [v6 objectAtIndexedSubscript:v4];
      if ([(ARParentImageSensor *)self _addSensorForSettings:v5]) {
        ++v4;
      }
      else {
        [v6 removeObjectAtIndex:v4];
      }
    }
    while (v4 < [v6 count]);
  }
  [(ARParentImageSensorSettings *)self->_settings setSettings:v6];
}

- (BOOL)_addSensorForSettings:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 videoFormat];
  if ([v5 captureDevicePosition] == 2) {
    goto LABEL_4;
  }
  id v6 = [v4 metaData];
  if ([v6 isEqualToString:*MEMORY[0x1E4F15E30]])
  {

LABEL_4:
    goto LABEL_5;
  }
  v9 = [v4 metaData];
  char v10 = [v9 isEqualToString:*MEMORY[0x1E4F15E48]];

  if ((v10 & 1) == 0)
  {
    v11 = [v4 videoFormat];
    uint64_t v12 = [v11 captureDevicePosition];

    if (v12 == 1)
    {
      v13 = [v4 videoFormat];
      v14 = [v13 captureDeviceType];
      int v15 = [v14 isEqualToString:*MEMORY[0x1E4F15810]];

      if (v15) {
        v16 = ARDepthSensor;
      }
      else {
        v16 = ARImageSensor;
      }
      v7 = (ARFaceTrackingImageSensor *)[[v16 alloc] initWithSettings:v4 captureSession:self->_captureSession captureQueue:self->_captureQueue];
      if (v7) {
        goto LABEL_6;
      }
    }
    else
    {
      if (_ARLogGeneral_onceToken_8 != -1) {
        dispatch_once(&_ARLogGeneral_onceToken_8, &__block_literal_global_245_0);
      }
      uint64_t v17 = (void *)_ARLogGeneral_logObj_8;
      if (os_log_type_enabled((os_log_t)_ARLogGeneral_logObj_8, OS_LOG_TYPE_ERROR))
      {
        v18 = v17;
        v19 = (objc_class *)objc_opt_class();
        dispatch_queue_t v20 = NSStringFromClass(v19);
        int v22 = 138543874;
        objc_super v23 = v20;
        __int16 v24 = 2048;
        v25 = self;
        __int16 v26 = 2114;
        id v27 = v4;
        _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to create image sensor for settings: %{public}@", (uint8_t *)&v22, 0x20u);
      }
    }
LABEL_17:
    BOOL v8 = 0;
    goto LABEL_18;
  }
LABEL_5:
  v7 = [[ARFaceTrackingImageSensor alloc] initWithSettings:v4 captureSession:self->_captureSession captureQueue:self->_captureQueue];
  [(ARFaceTrackingImageSensor *)v7 setRecordingMode:self->_recordingMode];
  if (!v7) {
    goto LABEL_17;
  }
LABEL_6:
  [(ARImageSensor *)v7 setBufferPopulationMonitor:self->_bufferPopulationMonitor];
  [(ARImageSensor *)v7 setDataSource:self];
  [(NSMutableArray *)self->_sensors addObject:v7];

  BOOL v8 = 1;
LABEL_18:

  return v8;
}

- (void)setDelegate:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_storeWeak((id *)&self->_delegate, v4);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_sensors;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * v9++), "setDelegate:", v4, (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)forceUpdatePowerUsage:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_powerUsage = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_sensors;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "forceUpdatePowerUsage:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)setPowerUsage:(unint64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  self->_powerUsage = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v4 = self->_sensors;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
        objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setPowerUsage:", a3, (void)v9);
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (BOOL)canReconfigure:(id)a3
{
  id v4 = a3;
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ([(ARParentImageSensor *)self unrecoverable])
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = (void *)[(ARParentImageSensorSettings *)self->_settings copy];
    objc_msgSend(v7, "setAudioCaptureEnabled:", objc_msgSend(v4, "audioCaptureEnabled"));
    uint64_t v8 = [v4 settings];
    uint64_t v9 = [v8 count];
    long long v10 = [v7 settings];
    uint64_t v11 = [v10 count];

    if (v9 == v11
      && ([v4 settings],
          long long v12 = objc_claimAutoreleasedReturnValue(),
          [v7 setSettings:v12],
          v12,
          [v7 isEqual:v4]))
    {
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x2020000000;
      char v19 = 1;
      long long v13 = [v4 settings];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __38__ARParentImageSensor_canReconfigure___block_invoke;
      v15[3] = &unk_1E6186358;
      v15[4] = self;
      v15[5] = &v16;
      [v13 enumerateObjectsUsingBlock:v15];

      BOOL v6 = *((unsigned char *)v17 + 24) != 0;
      _Block_object_dispose(&v16, 8);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_stateLock);

  return v6;
}

void __38__ARParentImageSensor_canReconfigure___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 56);
  id v8 = a2;
  uint64_t v9 = [v7 objectAtIndexedSubscript:a3];
  LOBYTE(v7) = [v9 canReconfigure:v8];

  if ((v7 & 1) == 0)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)reconfigure:(id)a3
{
  id v4 = a3;
  if ([(ARParentImageSensor *)self canReconfigure:v4])
  {
    os_unfair_lock_lock(&self->_stateLock);
    uint64_t v5 = [v4 settings];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __35__ARParentImageSensor_reconfigure___block_invoke;
    v13[3] = &unk_1E6186380;
    v13[4] = self;
    [v5 enumerateObjectsUsingBlock:v13];

    LODWORD(v5) = [v4 audioCaptureEnabled];
    if (v5 == [(ARParentImageSensorSettings *)self->_settings audioCaptureEnabled])
    {
      id v8 = (ARParentImageSensorSettings *)[v4 copy];
      settings = self->_settings;
      self->_settings = v8;
    }
    else
    {
      if ([v4 audioCaptureEnabled])
      {
        id v12 = 0;
        if (![(ARParentImageSensor *)self _validateMicrophoneAuthorizationWithError:&v12])
        {
          id v10 = v12;
          os_unfair_lock_unlock(&self->_stateLock);
          uint64_t v11 = [(ARParentImageSensor *)self delegate];
          [v11 sensor:self didFailWithError:v10];

          goto LABEL_8;
        }
      }
      BOOL v6 = (ARParentImageSensorSettings *)[v4 copy];
      uint64_t v7 = self->_settings;
      self->_settings = v6;

      [(AVCaptureSession *)self->_captureSession beginConfiguration];
      [(ARParentImageSensor *)self _configureAudioCapture];
      [(AVCaptureSession *)self->_captureSession commitConfiguration];
    }
    os_unfair_lock_unlock(&self->_stateLock);
  }
LABEL_8:
}

void __35__ARParentImageSensor_reconfigure___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 56);
  id v5 = a2;
  id v6 = [v4 objectAtIndexedSubscript:a3];
  [v6 reconfigure:v5];
}

- (void)setRecordingMode:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_recordingMode = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(ARParentImageSensor *)self sensors];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v10 + 1) + 8 * v8);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          [v9 setRecordingMode:v3];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (unint64_t)providedDataTypes
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_sensors;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    unint64_t v5 = 0;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "providedDataTypes", (void)v9);
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (void)setInterrupted:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_interrupted != a3)
  {
    self->_interrupted = a3;
    long long v9 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    uint64_t v4 = self->_sensors;
    uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
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
          objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * v8++), "setInterrupted:", self->_interrupted, (void)v9);
        }
        while (v6 != v8);
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
}

- (void)start
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(ARParentImageSensor *)self _validateCameraAuthorization])
  {
    os_unfair_lock_lock(&self->_stateLock);
    uint64_t v3 = [(ARParentImageSensor *)self settings];
    int v4 = [v3 audioCaptureEnabled];

    if (v4
      && (id v18 = 0,
          ![(ARParentImageSensor *)self _validateMicrophoneAuthorizationWithError:&v18]))
    {
      id v7 = v18;
      os_unfair_lock_unlock(&self->_stateLock);
      uint64_t v5 = [(ARParentImageSensor *)self delegate];
      [v5 sensor:self didFailWithError:v7];
    }
    else
    {
      uint64_t v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v5 addObserver:self selector:sel_captureSessionStateChanged_ name:*MEMORY[0x1E4F159D0] object:self->_captureSession];
      [v5 addObserver:self selector:sel_captureSessionStateChanged_ name:*MEMORY[0x1E4F159A0] object:self->_captureSession];
      [v5 addObserver:self selector:sel_captureSessionStateChanged_ name:*MEMORY[0x1E4F159C8] object:self->_captureSession];
      id v17 = 0;
      BOOL v6 = [(ARParentImageSensor *)self _startWithError:&v17];
      id v7 = v17;
      os_unfair_lock_unlock(&self->_stateLock);
      uint64_t v8 = [(ARParentImageSensor *)self delegate];
      long long v9 = v8;
      if (v6)
      {
        char v10 = objc_opt_respondsToSelector();

        if (v10)
        {
          long long v11 = [(ARParentImageSensor *)self delegate];
          [v11 sensorDidStart:self];
        }
        if ([(ARParentImageSensor *)self interrupted])
        {
          long long v12 = [(ARParentImageSensor *)self delegate];
          char v13 = objc_opt_respondsToSelector();

          if (v13)
          {
            uint64_t v14 = [(ARParentImageSensor *)self delegate];
            [v14 sensorDidPause:self];
          }
        }
        long long v9 = _ARLogSensor_1();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          uint64_t v15 = (objc_class *)objc_opt_class();
          uint64_t v16 = NSStringFromClass(v15);
          *(_DWORD *)buf = 138543618;
          dispatch_queue_t v20 = v16;
          __int16 v21 = 2048;
          int v22 = self;
          _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: started", buf, 0x16u);
        }
      }
      else
      {
        [v8 sensor:self didFailWithError:v7];
      }
    }
  }
}

- (BOOL)_startWithError:(id *)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_stateLock);
  [(AVCaptureSession *)self->_captureSession setSessionPreset:*MEMORY[0x1E4F159B8]];
  [(AVCaptureSession *)self->_captureSession beginConfiguration];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v5 = self->_sensors;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v37;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v36 + 1) + 8 * i), "prepareToStart", (void)v36);
        if (v10)
        {
          v31 = (void *)v10;
          [(AVCaptureSession *)self->_captureSession commitConfiguration];
          if (a3) {
            *a3 = v31;
          }

          return 0;
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }

  long long v11 = [(ARParentImageSensorSettings *)self->_settings settings];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    unint64_t v13 = 0;
    do
    {
      uint64_t v14 = -[NSMutableArray objectAtIndexedSubscript:](self->_sensors, "objectAtIndexedSubscript:", v13, (void)v36);
      uint64_t v15 = [(ARParentImageSensorSettings *)self->_settings settings];
      uint64_t v16 = [v15 objectAtIndexedSubscript:v13];
      objc_msgSend(v14, "enableSensor:", objc_msgSend(v16, "isEnabled"));

      ++v13;
      id v17 = [(ARParentImageSensorSettings *)self->_settings settings];
      unint64_t v18 = [v17 count];
    }
    while (v18 > v13);
  }
  [(ARParentImageSensor *)self _configureAudioCapture];
  char v19 = [(ARParentImageSensor *)self beforeRunningAVCaptureSession];

  if (v19)
  {
    dispatch_queue_t v20 = [(ARParentImageSensor *)self beforeRunningAVCaptureSession];
    ((void (**)(void, AVCaptureSession *))v20)[2](v20, self->_captureSession);
  }
  [(AVCaptureSession *)self->_captureSession commitConfiguration];
  __int16 v21 = _ARLogSensor_1();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    int v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    *(_DWORD *)buf = 138543618;
    v41 = v23;
    __int16 v42 = 2048;
    v43 = self;
    _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: startRunning capture session", buf, 0x16u);
  }
  [(AVCaptureSession *)self->_captureSession startRunning];
  if (![(AVCaptureSession *)self->_captureSession isRunning])
  {
    __int16 v24 = _ARLogSensor_1();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = (objc_class *)objc_opt_class();
      __int16 v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138543618;
      v41 = v26;
      __int16 v42 = 2048;
      v43 = self;
      _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was started but the AVCaptureSession hasn't started running yet", buf, 0x16u);
    }
  }
  [(ARParentImageSensor *)self setRunning:1];
  if ([(AVCaptureSession *)self->_captureSession isInterrupted])
  {
    id v27 = _ARLogSensor_1();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v28 = (objc_class *)objc_opt_class();
      v29 = NSStringFromClass(v28);
      *(_DWORD *)buf = 138543618;
      v41 = v29;
      __int16 v42 = 2048;
      v43 = self;
      _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: starting interrupted", buf, 0x16u);
    }
    BOOL v30 = 1;
    [(ARParentImageSensor *)self setInterrupted:1];
  }
  else
  {
    if ([(ARParentImageSensor *)self interrupted])
    {
      v32 = _ARLogSensor_1();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        v33 = (objc_class *)objc_opt_class();
        v34 = NSStringFromClass(v33);
        *(_DWORD *)buf = 138543618;
        v41 = v34;
        __int16 v42 = 2048;
        v43 = self;
        _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting sensor and forcing interrupted to NO", buf, 0x16u);
      }
      [(ARParentImageSensor *)self setInterrupted:0];
    }
    return 1;
  }
  return v30;
}

- (void)stop
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  if ([(ARParentImageSensor *)self running])
  {
    int v4 = _ARLogSensor_1();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = (objc_class *)objc_opt_class();
      uint64_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v6;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARImageSensor stopping", buf, 0x16u);
    }
    [(ARParentImageSensor *)self setRunning:0];
    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x1E4F159D0] object:self->_captureSession];
    [v7 removeObserver:self name:*MEMORY[0x1E4F159A0] object:self->_captureSession];
    [v7 removeObserver:self name:*MEMORY[0x1E4F159C8] object:self->_captureSession];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v8 = self->_sensors;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12++), "stop", (void)v15);
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(AVCaptureSession *)self->_captureSession stopRunning];
    os_unfair_lock_unlock(p_stateLock);
  }
  else
  {
    os_unfair_lock_unlock(p_stateLock);
    uint64_t v7 = _ARLogSensor_1();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      unint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543618;
      __int16 v21 = v14;
      __int16 v22 = 2048;
      uint64_t v23 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Skipping the request to stop the sensor as it is not running.", buf, 0x16u);
    }
  }
}

- (void)waitForOutstandingCallbacks
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_captureQueue);
  captureQueue = self->_captureQueue;
  dispatch_sync(captureQueue, &__block_literal_global_27);
}

- (void)teardown
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  p_stateLock = &self->_stateLock;
  os_unfair_lock_lock(&self->_stateLock);
  [(AVCaptureSession *)self->_captureSession beginConfiguration];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  int v4 = self->_sensors;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "teardown", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [(AVCaptureSession *)self->_captureSession commitConfiguration];
  os_unfair_lock_unlock(p_stateLock);
}

- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3
{
  id v4 = a3;
  sensors = self->_sensors;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__ARParentImageSensor_captureHighResolutionFrameWithPhotoSettings___block_invoke;
  v7[3] = &unk_1E61863A8;
  id v8 = v4;
  id v6 = v4;
  [(NSMutableArray *)sensors enumerateObjectsUsingBlock:v7];
}

void __67__ARParentImageSensor_captureHighResolutionFrameWithPhotoSettings___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  id v6 = [v8 settings];
  int v7 = [v6 supportsCapturingHighResolutionFrames];

  if (v7)
  {
    [v8 captureHighResolutionFrameWithPhotoSettings:*(void *)(a1 + 32)];
    *a4 = 1;
  }
}

- (void)_configureAudioCapture
{
  v79[1] = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_stateLock);
  if ([(ARParentImageSensorSettings *)self->_settings audioCaptureEnabled] || self->_audioOutput)
  {
    BOOL v3 = [(ARParentImageSensorSettings *)self->_settings audioCaptureEnabled];
    audioOutput = self->_audioOutput;
    if (v3)
    {
      if (audioOutput) {
        return;
      }
    }
    else if (audioOutput)
    {
      uint64_t v5 = _ARLogSensor_1();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        id v6 = (objc_class *)objc_opt_class();
        int v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138543618;
        v74 = v7;
        __int16 v75 = 2048;
        v76 = self;
        _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Removing audio output", buf, 0x16u);
      }
      [(AVCaptureSession *)self->_captureSession removeOutput:self->_audioOutput];
      id v8 = self->_audioOutput;
      self->_audioOutput = 0;
    }
    if ([(ARParentImageSensorSettings *)self->_settings audioCaptureEnabled])
    {
      long long v9 = _ARLogSensor_1();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        long long v10 = (objc_class *)objc_opt_class();
        long long v11 = NSStringFromClass(v10);
        *(_DWORD *)buf = 138543618;
        v74 = v11;
        __int16 v75 = 2048;
        v76 = self;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Starting audio capture configuration", buf, 0x16u);
      }
      uint64_t v12 = [(ARParentImageSensorSettings *)self->_settings settings];
      uint64_t v13 = [v12 firstObject];
      uint64_t v14 = [v13 videoFormat];
      uint64_t v15 = [v14 captureDevicePosition];

      if (!self->_audioInput)
      {
        long long v16 = (void *)MEMORY[0x1E4F16448];
        v79[0] = *MEMORY[0x1E4F15800];
        long long v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v79 count:1];
        uint64_t v18 = *MEMORY[0x1E4F15BA8];
        char v19 = [v16 discoverySessionWithDeviceTypes:v17 mediaType:*MEMORY[0x1E4F15BA8] position:v15];

        dispatch_queue_t v20 = [v19 devices];
        __int16 v21 = [v20 firstObject];

        if (!v21)
        {
          __int16 v21 = [MEMORY[0x1E4F16440] defaultDeviceWithMediaType:v18];
        }
        id v71 = 0;
        __int16 v22 = [MEMORY[0x1E4F16450] deviceInputWithDevice:v21 error:&v71];
        id v23 = v71;
        audioInput = self->_audioInput;
        self->_audioInput = v22;

        if (self->_audioInput
          && ([(ARParentImageSensor *)self captureSession],
              v25 = objc_claimAutoreleasedReturnValue(),
              int v26 = [v25 canAddInput:self->_audioInput],
              v25,
              v26))
        {
          id v27 = [(ARParentImageSensor *)self captureSession];
          [v27 addInputWithNoConnections:self->_audioInput];
        }
        else
        {
          id v27 = _ARLogSensor_1();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            long long v36 = (objc_class *)objc_opt_class();
            long long v37 = NSStringFromClass(v36);
            long long v38 = [v23 description];
            *(_DWORD *)buf = 138543874;
            v74 = v37;
            __int16 v75 = 2048;
            v76 = self;
            __int16 v77 = 2112;
            v78 = v38;
            _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating audio input: %@", buf, 0x20u);
          }
        }
      }
      long long v39 = (AVCaptureAudioDataOutput *)objc_opt_new();
      v40 = self->_audioOutput;
      self->_audioOutput = v39;

      [(AVCaptureAudioDataOutput *)self->_audioOutput setSampleBufferDelegate:self queue:self->_captureQueue];
      v41 = [(ARParentImageSensor *)self captureSession];
      int v42 = [v41 canAddOutput:self->_audioOutput];

      v43 = _ARLogSensor_1();
      v44 = v43;
      if (v42)
      {
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v45 = (objc_class *)objc_opt_class();
          v46 = NSStringFromClass(v45);
          *(_DWORD *)buf = 138543618;
          v74 = v46;
          __int16 v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B88A2000, v44, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Adding audio output", buf, 0x16u);
        }
        v44 = [(ARParentImageSensor *)self captureSession];
        [v44 addOutputWithNoConnections:self->_audioOutput];
      }
      else if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
      {
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        *(_DWORD *)buf = 138543618;
        v74 = v48;
        __int16 v75 = 2048;
        v76 = self;
        _os_log_impl(&dword_1B88A2000, v44, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding audio output", buf, 0x16u);
      }
      if (!self->_audioConnection)
      {
        v49 = self->_audioInput;
        uint64_t v50 = *MEMORY[0x1E4F15BA8];
        v51 = [(AVCaptureDeviceInput *)v49 device];
        v52 = [v51 deviceType];
        v53 = [(AVCaptureDeviceInput *)v49 portsWithMediaType:v50 sourceDeviceType:v52 sourceDevicePosition:v15];
        p_super = [v53 firstObject];

        if (p_super) {
          goto LABEL_41;
        }
        v54 = self->_audioInput;
        v55 = [(AVCaptureDeviceInput *)v54 device];
        v56 = [v55 deviceType];
        v57 = [(AVCaptureDeviceInput *)v54 portsWithMediaType:v50 sourceDeviceType:v56 sourceDevicePosition:0];
        p_super = [v57 firstObject];

        v58 = _ARLogSensor_1();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          v59 = (objc_class *)objc_opt_class();
          v60 = NSStringFromClass(v59);
          *(_DWORD *)buf = 138543618;
          v74 = v60;
          __int16 v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B88A2000, v58, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Falling back to AVCaptureDevicePositionUnspecified.", buf, 0x16u);
        }
        if (p_super)
        {
LABEL_41:
          v61 = (void *)MEMORY[0x1E4F16410];
          v72 = p_super;
          v62 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v72 count:1];
          v63 = [v61 connectionWithInputPorts:v62 output:self->_audioOutput];
          audioConnection = self->_audioConnection;
          self->_audioConnection = v63;

          v65 = _ARLogSensor_1();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            v66 = (objc_class *)objc_opt_class();
            v67 = NSStringFromClass(v66);
            v68 = NSStringFromAVCaptureDevicePosition([p_super sourceDevicePosition]);
            *(_DWORD *)buf = 138543874;
            v74 = v67;
            __int16 v75 = 2048;
            v76 = self;
            __int16 v77 = 2112;
            v78 = v68;
            _os_log_impl(&dword_1B88A2000, v65, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Adding audio connection. Position: %@", buf, 0x20u);
          }
          [(AVCaptureSession *)self->_captureSession addConnection:self->_audioConnection];
        }
        else
        {
          p_super = _ARLogSensor_1();
          if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
          {
            v69 = (objc_class *)objc_opt_class();
            v70 = NSStringFromClass(v69);
            *(_DWORD *)buf = 138543618;
            v74 = v70;
            __int16 v75 = 2048;
            v76 = self;
            _os_log_impl(&dword_1B88A2000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error finding audio port", buf, 0x16u);
          }
        }
LABEL_44:
      }
    }
    else
    {
      if (self->_audioInput)
      {
        uint64_t v28 = _ARLogSensor_1();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          v29 = (objc_class *)objc_opt_class();
          BOOL v30 = NSStringFromClass(v29);
          *(_DWORD *)buf = 138543618;
          v74 = v30;
          __int16 v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Removing audio input", buf, 0x16u);
        }
        [(AVCaptureSession *)self->_captureSession removeInput:self->_audioInput];
        v31 = self->_audioInput;
        self->_audioInput = 0;
      }
      if (self->_audioConnection)
      {
        v32 = _ARLogSensor_1();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v33 = (objc_class *)objc_opt_class();
          v34 = NSStringFromClass(v33);
          *(_DWORD *)buf = 138543618;
          v74 = v34;
          __int16 v75 = 2048;
          v76 = self;
          _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Removing audio connection", buf, 0x16u);
        }
        p_super = &self->_audioConnection->super;
        self->_audioConnection = 0;
        goto LABEL_44;
      }
    }
  }
}

- (BOOL)_validateCameraAuthorization
{
  os_unfair_lock_assert_not_owner(&self->_stateLock);
  uint64_t v3 = *MEMORY[0x1E4F15C18];
  uint64_t v4 = [MEMORY[0x1E4F16440] authorizationStatusForMediaType:*MEMORY[0x1E4F15C18]];
  if (v4)
  {
    if (v4 == 2)
    {
      uint64_t v5 = [(ARParentImageSensor *)self delegate];
      id v8 = ARErrorWithCodeAndUserInfo(103, 0);
      [v5 sensor:self didFailWithError:v8];
      goto LABEL_6;
    }
    if (v4 == 1)
    {
      uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
      id v6 = ARKitCoreBundle();
      int v7 = [v6 localizedStringForKey:@"Camera use is restricted on this device." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      id v8 = [(ARParentImageSensor *)self delegate];
      long long v9 = ARErrorWithCodeAndUserInfo(101, v5);
      [v8 sensor:self didFailWithError:v9];

LABEL_6:
      return 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    long long v11 = (void *)MEMORY[0x1E4F16440];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __51__ARParentImageSensor__validateCameraAuthorization__block_invoke;
    v12[3] = &unk_1E61863D0;
    objc_copyWeak(&v13, &location);
    [v11 requestAccessForMediaType:v3 completionHandler:v12];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __51__ARParentImageSensor__validateCameraAuthorization__block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      int v5 = [WeakRetained running];
      uint64_t v4 = v8;
      if (v5)
      {
        id v6 = [v8 delegate];
        int v7 = ARErrorWithCodeAndUserInfo(103, 0);
        [v6 sensor:v8 didFailWithError:v7];

        uint64_t v4 = v8;
      }
    }
  }
}

- (BOOL)_validateMicrophoneAuthorizationWithError:(id *)a3
{
  uint64_t v5 = *MEMORY[0x1E4F15BA8];
  uint64_t v6 = [MEMORY[0x1E4F16440] authorizationStatusForMediaType:*MEMORY[0x1E4F15BA8]];
  if (v6)
  {
    if (v6 == 2)
    {
      if (a3)
      {
        ARErrorWithCodeAndUserInfo(104, 0);
        id v10 = (id)objc_claimAutoreleasedReturnValue();
        BOOL result = 0;
        *a3 = v10;
        return result;
      }
      return 0;
    }
    if (v6 == 1)
    {
      int v7 = [MEMORY[0x1E4F1CA60] dictionary];
      id v8 = ARKitCoreBundle();
      long long v9 = [v8 localizedStringForKey:@"Microphone use is restricted on this device." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      [v7 setObject:v9 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      if (a3)
      {
        ARErrorWithCodeAndUserInfo(101, v7);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }

      return 0;
    }
  }
  else
  {
    objc_initWeak(&location, self);
    uint64_t v12 = (void *)MEMORY[0x1E4F16440];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__ARParentImageSensor__validateMicrophoneAuthorizationWithError___block_invoke;
    v13[3] = &unk_1E61863D0;
    objc_copyWeak(&v14, &location);
    [v12 requestAccessForMediaType:v5 completionHandler:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  return 1;
}

void __65__ARParentImageSensor__validateMicrophoneAuthorizationWithError___block_invoke(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if ((a2 & 1) == 0)
  {
    if (WeakRetained)
    {
      id v8 = WeakRetained;
      int v5 = [WeakRetained running];
      uint64_t v4 = v8;
      if (v5)
      {
        uint64_t v6 = [v8 delegate];
        int v7 = ARErrorWithCodeAndUserInfo(104, 0);
        [v6 sensor:v8 didFailWithError:v7];

        uint64_t v4 = v8;
      }
    }
  }
}

- (void)dealloc
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogSensor_1();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = (objc_class *)objc_opt_class();
    int v5 = NSStringFromClass(v4);
    *(_DWORD *)buf = 138543618;
    id v8 = v5;
    __int16 v9 = 2048;
    id v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: dealloc", buf, 0x16u);
  }
  [(ARParentImageSensor *)self stop];
  [(ARParentImageSensor *)self teardown];
  v6.receiver = self;
  v6.super_class = (Class)ARParentImageSensor;
  [(ARParentImageSensor *)&v6 dealloc];
}

- (NSString)description
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F28E78];
  v22.receiver = self;
  v22.super_class = (Class)ARParentImageSensor;
  uint64_t v3 = [(ARParentImageSensor *)&v22 description];
  uint64_t v4 = [v2 stringWithFormat:@"%@", v3];

  os_unfair_lock_lock(&self->_stateLock);
  if (self->_running) {
    int v5 = @"Running";
  }
  else {
    int v5 = @"Stopped";
  }
  [v4 appendFormat:@" %@ ", v5];
  if (self->_interrupted) {
    [v4 appendFormat:@"Interrupted "];
  }
  if (self->_unrecoverable) {
    [v4 appendFormat:@"Unrecoverable "];
  }
  objc_super v6 = [(ARParentImageSensorSettings *)self->_settings description];
  int v7 = [v6 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
  [v4 appendFormat:@"\n\tImageSensorSettings: %@\n", v7];

  [v4 appendFormat:@"\tSensors:\n"];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v8 = self->_sensors;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) description];
        id v13 = [v12 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t|\t"];
        [v4 appendFormat:@"\t| - %@\n", v13];
      }
      uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v9);
  }

  bufferPopulationMonitor = self->_bufferPopulationMonitor;
  if (bufferPopulationMonitor)
  {
    uint64_t v15 = [(ARBufferPopulationMonitor *)bufferPopulationMonitor description];
    [v4 appendString:v15];
  }
  os_unfair_lock_unlock(&self->_stateLock);
  return (NSString *)v4;
}

- (void)captureOutput:(id)a3 didOutputSampleBuffer:(opaqueCMSampleBuffer *)a4 fromConnection:(id)a5
{
  p_stateLock = &self->_stateLock;
  id v8 = a5;
  os_unfair_lock_lock(p_stateLock);
  uint64_t v9 = [v8 output];

  audioOutput = self->_audioOutput;
  os_unfair_lock_unlock(p_stateLock);
  if (v9 == audioOutput)
  {
    id v12 = [(ARParentImageSensor *)self delegate];
    uint64_t v11 = [[ARAudioData alloc] initWithSampleBuffer:a4];
    [v12 sensor:self didOutputSensorData:v11];
  }
}

- (void)_captureSessionStateChanged:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_stateLock);
  if (![(ARParentImageSensor *)self running]) {
    goto LABEL_9;
  }
  int v5 = _ARLogSensor_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v6 = (objc_class *)objc_opt_class();
    int v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    v35 = v7;
    __int16 v36 = 2048;
    long long v37 = self;
    __int16 v38 = 2114;
    id v39 = v4;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: capture state changed (%{public}@)", buf, 0x20u);
  }
  id v8 = [v4 name];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F159C8]];

  if (v9)
  {
    uint64_t v10 = [v4 userInfo];
    uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F15998]];

    if ([v11 code] == -11873)
    {
      [(ARParentImageSensor *)self setUnrecoverable:1];
    }
    else
    {
      BOOL v14 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.attemptfailurerecovery"];
      if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.attemptfailurerecoveryafterbackground"])
      {
        if (![(ARParentImageSensor *)self interrupted] && !v14) {
          goto LABEL_27;
        }
      }
      else if (!v14)
      {
        goto LABEL_27;
      }
      id v23 = _ARLogSensor_1();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        uint64_t v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        *(_DWORD *)buf = 138543874;
        v35 = v25;
        __int16 v36 = 2048;
        long long v37 = self;
        __int16 v38 = 2112;
        id v39 = v11;
        _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Recovering capture session due to AVCaptureSessionRuntimeErrorNotification. (%@)", buf, 0x20u);
      }
      BOOL v26 = [(ARParentImageSensor *)self interrupted];
      if ([(ARParentImageSensor *)self _startWithError:0])
      {
        [(ARParentImageSensor *)self setInterrupted:0];
        os_unfair_lock_unlock(&self->_stateLock);
        if (!v26) {
          goto LABEL_32;
        }
        id v27 = [(ARParentImageSensor *)self delegate];
        char v28 = objc_opt_respondsToSelector();

        if ((v28 & 1) == 0) {
          goto LABEL_32;
        }
        v29 = [(ARParentImageSensor *)self delegate];
        [v29 sensorDidRestart:self];
LABEL_31:

LABEL_32:
        goto LABEL_33;
      }
    }
LABEL_27:
    os_unfair_lock_unlock(&self->_stateLock);
    if (v11)
    {
      uint64_t v32 = *MEMORY[0x1E4F28A50];
      v33 = v11;
      BOOL v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v33 forKeys:&v32 count:1];
      v29 = ARErrorWithCodeAndUserInfo(102, v30);
    }
    else
    {
      v29 = ARErrorWithCodeAndUserInfo(102, MEMORY[0x1E4F1CC08]);
    }
    v31 = [(ARParentImageSensor *)self delegate];
    [v31 sensor:self didFailWithError:v29];

    goto LABEL_31;
  }
  id v12 = [v4 name];
  int v13 = [v12 isEqualToString:*MEMORY[0x1E4F159D0]];

  if (v13)
  {
    if ([(ARParentImageSensor *)self interrupted])
    {
LABEL_9:
      os_unfair_lock_unlock(&self->_stateLock);
      goto LABEL_33;
    }
    [(ARParentImageSensor *)self setInterrupted:1];
    os_unfair_lock_unlock(&self->_stateLock);
    long long v21 = [(ARParentImageSensor *)self delegate];
    char v22 = objc_opt_respondsToSelector();

    if ((v22 & 1) == 0) {
      goto LABEL_33;
    }
    long long v20 = [(ARParentImageSensor *)self delegate];
    [v20 sensorDidPause:self];
LABEL_19:

    goto LABEL_33;
  }
  uint64_t v15 = [v4 name];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F159A0]];

  if (v16)
  {
    BOOL v17 = [(ARParentImageSensor *)self interrupted];
    [(ARParentImageSensor *)self setInterrupted:0];
    os_unfair_lock_unlock(&self->_stateLock);
    if (v17)
    {
      long long v18 = [(ARParentImageSensor *)self delegate];
      char v19 = objc_opt_respondsToSelector();

      if (v19)
      {
        long long v20 = [(ARParentImageSensor *)self delegate];
        [v20 sensorDidRestart:self];
        goto LABEL_19;
      }
    }
  }
LABEL_33:
}

- (void)captureSessionStateChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  captureSessionNotificationsQueue = self->_captureSessionNotificationsQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__ARParentImageSensor_captureSessionStateChanged___block_invoke;
  block[3] = &unk_1E6185200;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(captureSessionNotificationsQueue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __50__ARParentImageSensor_captureSessionStateChanged___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _captureSessionStateChanged:*(void *)(a1 + 32)];
}

- (id)captureDeviceTypeToExtrinsicsMapForImageSensor:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v20 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v5 = self->_sensors;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v21 + 1) + 8 * i) captureDevice];
        uint64_t v11 = [v10 uniqueID];
        id v12 = [v4 captureDevice];
        int v13 = [v12 uniqueID];
        char v14 = [v11 isEqualToString:v13];

        if ((v14 & 1) == 0)
        {
          uint64_t v15 = (void *)MEMORY[0x1E4F16440];
          int v16 = [v4 captureDevice];
          BOOL v17 = [v15 extrinsicMatrixFromDevice:v10 toDevice:v16];

          if (v17)
          {
            long long v18 = [v10 deviceType];
            [v20 setObject:v17 forKeyedSubscript:v18];
          }
        }
      }
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v7);
  }

  return v20;
}

- (ARParentImageSensorSettings)settings
{
  return self->_settings;
}

- (NSMutableArray)sensors
{
  return self->_sensors;
}

- (void)setSensors:(id)a3
{
}

- (ARSensorDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (ARSensorDelegate *)WeakRetained;
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (AVCaptureSession)captureSession
{
  return self->_captureSession;
}

- (AVCaptureDeviceInput)audioInput
{
  return self->_audioInput;
}

- (AVCaptureAudioDataOutput)audioOutput
{
  return self->_audioOutput;
}

- (AVCaptureConnection)audioConnection
{
  return self->_audioConnection;
}

- (BOOL)recordingMode
{
  return self->_recordingMode;
}

- (id)beforeRunningAVCaptureSession
{
  return self->_beforeRunningAVCaptureSession;
}

- (void)setBeforeRunningAVCaptureSession:(id)a3
{
}

- (BOOL)running
{
  return self->_running;
}

- (void)setRunning:(BOOL)a3
{
  self->_running = a3;
}

- (BOOL)interrupted
{
  return self->_interrupted;
}

- (BOOL)unrecoverable
{
  return self->_unrecoverable;
}

- (void)setUnrecoverable:(BOOL)a3
{
  self->_unrecoverable = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_beforeRunningAVCaptureSession, 0);
  objc_storeStrong((id *)&self->_audioConnection, 0);
  objc_storeStrong((id *)&self->_audioOutput, 0);
  objc_storeStrong((id *)&self->_audioInput, 0);
  objc_storeStrong((id *)&self->_captureSession, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sensors, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_captureSessionNotificationsQueue, 0);
  objc_storeStrong((id *)&self->_captureQueue, 0);
  objc_storeStrong((id *)&self->_bufferPopulationMonitor, 0);
}

@end