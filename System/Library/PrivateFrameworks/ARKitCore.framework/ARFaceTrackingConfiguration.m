@interface ARFaceTrackingConfiguration
+ (BOOL)isSupported;
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
+ (BOOL)supportsWorldTracking;
+ (NSInteger)supportedNumberOfTrackedFaces;
+ (id)_querySupportedVideoFormats;
+ (id)_querySupportedVideoFormatsForWorldTracking;
+ (id)fallbackVideoFormat;
+ (id)fallbackVideoFormatWithCaptureDeviceType:(id)a3;
+ (id)supportedVideoFormats;
+ (id)supportedVideoFormatsForWorldTracking;
- (ARFaceTrackingConfiguration)init;
- (BOOL)isEqual:(id)a3;
- (BOOL)isWorldTrackingEnabled;
- (BOOL)lowPower;
- (NSInteger)maximumNumberOfTrackedFaces;
- (id)copyWithZone:(_NSZone *)a3;
- (id)imageSensorSettings;
- (id)imageSensorSettingsForLowPower;
- (id)imageSensorSettingsForWorldTracking;
- (id)parentImageSensorSettings;
- (id)secondaryTechniques;
- (void)createTechniques:(id)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setLightEstimationEnabled:(BOOL)a3;
- (void)setLowPower:(BOOL)a3;
- (void)setMaximumNumberOfTrackedFaces:(NSInteger)maximumNumberOfTrackedFaces;
- (void)setWorldTrackingEnabled:(BOOL)worldTrackingEnabled;
@end

@implementation ARFaceTrackingConfiguration

+ (BOOL)supportsWorldTracking
{
  int v2 = ARDeviceSupportsMulticamMode();
  if (v2)
  {
    LOBYTE(v2) = ARUserDefaultsMulticamModeEnabled();
  }
  return v2;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  if (a3 <= 1 && (ARAppleNeuralEngine() & 1) != 0) {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARFaceTrackingConfiguration;
  return objc_msgSendSuper2(&v6, sel_supportsFrameSemantics_, a3);
}

- (ARFaceTrackingConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARFaceTrackingConfiguration;
  int v2 = [(ARConfiguration *)&v5 initPrivate];
  v3 = v2;
  if (v2)
  {
    [(ARFaceTrackingConfiguration *)v2 setLightEstimationEnabled:1];
    [(ARFaceTrackingConfiguration *)v3 setWorldTrackingEnabled:0];
    [(ARFaceTrackingConfiguration *)v3 setMaximumNumberOfTrackedFaces:1];
    [(ARFaceTrackingConfiguration *)v3 setLowPower:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.faceTracking.lowPowerMode.enabled"]];
  }
  return v3;
}

- (void)setLightEstimationEnabled:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = 2;
  }
  else {
    uint64_t v3 = 0;
  }
  [(ARConfiguration *)self setLightEstimation:v3];
}

- (void)setCameraPosition:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.faceTracking.backCamera.allowed"])
  {
    if (a3
      && ([(ARConfiguration *)self videoFormat],
          objc_super v5 = objc_claimAutoreleasedReturnValue(),
          uint64_t v6 = [v5 captureDevicePosition],
          v5,
          v6 != a3))
    {
      v14.receiver = self;
      v14.super_class = (Class)ARFaceTrackingConfiguration;
      [(ARConfiguration *)&v14 setCameraPosition:a3];
    }
    else
    {
      v7 = [(id)objc_opt_class() supportedVideoFormats];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __49__ARFaceTrackingConfiguration_setCameraPosition___block_invoke;
      v13[3] = &__block_descriptor_40_e30_B32__0__ARVideoFormat_8Q16_B24l;
      v13[4] = a3;
      objc_msgSend(v7, "ar_firstObjectPassingTest:", v13);
      v8 = (ARVideoFormat *)objc_claimAutoreleasedReturnValue();
      videoFormat = self->super._videoFormat;
      self->super._videoFormat = v8;

      self->super._cameraPosition = a3;
    }
  }
  else
  {
    v10 = _ARLogGeneral_6();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = (objc_class *)objc_opt_class();
      v12 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543618;
      v16 = v12;
      __int16 v17 = 2048;
      v18 = self;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: setCameraPosition failed: The camera position for face tracking cannot be changed.", buf, 0x16u);
    }
  }
}

BOOL __49__ARFaceTrackingConfiguration_setCameraPosition___block_invoke(uint64_t a1, void *a2)
{
  return !*(void *)(a1 + 32) || [a2 captureDevicePosition] == *(void *)(a1 + 32);
}

+ (BOOL)isSupported
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ARFaceTrackingConfiguration;
  unsigned int v2 = objc_msgSendSuper2(&v4, sel_isSupported);
  if (v2) {
    LOBYTE(v2) = +[ARFaceTrackingTechnique isSupported];
  }
  return v2;
}

+ (NSInteger)supportedNumberOfTrackedFaces
{
  return (int)CVAFaceTrackingMaximumNumberOfTrackedFaces();
}

+ (id)supportedVideoFormats
{
  if (supportedVideoFormats_supportedFormats && ![(id)supportedVideoFormats_supportedFormats count])
  {
    uint64_t v3 = [a1 _querySupportedVideoFormats];
    objc_super v4 = (void *)supportedVideoFormats_supportedFormats;
    supportedVideoFormats_supportedFormats = v3;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__ARFaceTrackingConfiguration_supportedVideoFormats__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (supportedVideoFormats_onceToken != -1) {
    dispatch_once(&supportedVideoFormats_onceToken, block);
  }
  objc_super v5 = (void *)supportedVideoFormats_supportedFormats;
  return v5;
}

void __52__ARFaceTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormats];
  unsigned int v2 = (void *)supportedVideoFormats_supportedFormats;
  supportedVideoFormats_supportedFormats = v1;
}

+ (id)fallbackVideoFormat
{
  uint64_t v3 = ARFaceTrackingDevice();
  objc_super v4 = [a1 fallbackVideoFormatWithCaptureDeviceType:v3];

  return v4;
}

+ (id)fallbackVideoFormatWithCaptureDeviceType:(id)a3
{
  return +[ARVideoFormat bestVideoFormatForDevicePosition:2 deviceType:a3 resolution:0x2D000000500 frameRate:0 videoBinned:30.0];
}

+ (id)_querySupportedVideoFormats
{
  uint64_t v3 = objc_opt_new();
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.faceTracking.backCamera.allowed"])
  {
    objc_super v4 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:1 deviceType:*MEMORY[0x1E4F15830]];
    [v3 addObjectsFromArray:v4];
  }
  objc_super v5 = ARFaceTrackingDevice();
  uint64_t v6 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:2 deviceType:v5];
  [v3 addObjectsFromArray:v6];

  if (ARRGBFaceTrackingEnabled() && ![v3 count])
  {
    v7 = [a1 fallbackVideoFormat];
    if (v7) {
      [v3 addObject:v7];
    }
  }
  return v3;
}

+ (id)supportedVideoFormatsForWorldTracking
{
  if ([(id)objc_opt_class() supportsWorldTracking]
    && +[ARWorldTrackingConfiguration isSupported])
  {
    if (supportedVideoFormatsForWorldTracking_supportedFormats
      && ![(id)supportedVideoFormatsForWorldTracking_supportedFormats count])
    {
      uint64_t v3 = [a1 _querySupportedVideoFormatsForWorldTracking];
      objc_super v4 = (void *)supportedVideoFormatsForWorldTracking_supportedFormats;
      supportedVideoFormatsForWorldTracking_supportedFormats = v3;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__ARFaceTrackingConfiguration_supportedVideoFormatsForWorldTracking__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForWorldTracking_onceToken != -1) {
      dispatch_once(&supportedVideoFormatsForWorldTracking_onceToken, block);
    }
    id v5 = (id)supportedVideoFormatsForWorldTracking_supportedFormats;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __68__ARFaceTrackingConfiguration_supportedVideoFormatsForWorldTracking__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormatsForWorldTracking];
  unsigned int v2 = (void *)supportedVideoFormatsForWorldTracking_supportedFormats;
  supportedVideoFormatsForWorldTracking_supportedFormats = v1;
}

+ (id)_querySupportedVideoFormatsForWorldTracking
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = (id)*MEMORY[0x1E4F15830];
  if (ARDeviceSupportsUltraWideCamera())
  {
    id v4 = (id)*MEMORY[0x1E4F15828];

    id v3 = v4;
  }
  id v5 = +[ARVideoFormat bestVideoFormatForDevicePosition:1 deviceType:v3 resolution:0x1E000000280 frameRates:&unk_1F125BC90 videoBinned:1];
  uint64_t v6 = v5;
  if (v5)
  {
    [v5 imageResolution];
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v7 = v6;
LABEL_11:
      uint64_t v19 = v6;
      v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v19 count:1];
      goto LABEL_18;
    }
  }
  v8 = _ARLogGeneral_6();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138543874;
    v21 = v10;
    __int16 v22 = 2048;
    id v23 = a1;
    __int16 v24 = 2112;
    v25 = v6;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The resolution of video format %@ is not supported by the world tracking technique on current device, trying a fallback video format", buf, 0x20u);
  }
  v7 = +[ARVideoFormat bestVideoFormatForDevicePosition:1 deviceType:v3 resolution:0x2D000000500 frameRates:&unk_1F125BCA8 videoBinned:1];

  if (v7)
  {
    [v7 imageResolution];
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      uint64_t v6 = v7;
      goto LABEL_11;
    }
    v12 = _ARLogGeneral_6();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (objc_class *)objc_opt_class();
      objc_super v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138543874;
      v21 = v14;
      __int16 v22 = 2048;
      id v23 = a1;
      __int16 v24 = 2114;
      v25 = v7;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The resolution of video format %{public}@ is not supported by the world tracking technique on current device", buf, 0x20u);
    }
  }
  v15 = _ARLogGeneral_6();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    v16 = (objc_class *)objc_opt_class();
    __int16 v17 = NSStringFromClass(v16);
    *(_DWORD *)buf = 138543618;
    v21 = v17;
    __int16 v22 = 2048;
    id v23 = a1;
    _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find supported video format for running world tracking in multicam mode.", buf, 0x16u);
  }
  v11 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_18:

  return v11;
}

- (void)createTechniques:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ARFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces] < 1) {
    goto LABEL_4;
  }
  id v5 = [[ARFaceTrackingTechnique alloc] initWithMaximumNumberOfTrackedFaces:[(ARFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces]];
  if (v5)
  {
    uint64_t v6 = v5;
    v7 = [ARParentTechnique alloc];
    v11[0] = v6;
    v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
    v9 = [(ARParentTechnique *)v7 initWithParallelTechniques:v8];

    [v4 addObject:v9];
LABEL_4:
    v10.receiver = self;
    v10.super_class = (Class)ARFaceTrackingConfiguration;
    [(ARConfiguration *)&v10 createTechniques:v4];
  }
}

- (id)secondaryTechniques
{
  v14[1] = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  if ([(id)objc_opt_class() supportsWorldTracking]
    && [(ARFaceTrackingConfiguration *)self isWorldTrackingEnabled])
  {
    id v4 = [(ARFaceTrackingConfiguration *)self imageSensorSettingsForWorldTracking];
    id v5 = [[ARWorldTrackingOptions alloc] initWithImageSensorSettings:v4];
    [(ARWorldTrackingOptions *)v5 setPlaneEstimationShouldUseJasperData:0];
    uint64_t v6 = [(ARConfiguration *)self replaySensor];
    v7 = v6;
    if (v6 && [v6 replayMode]) {
      [(ARWorldTrackingOptions *)v5 setDeterministicMode:1];
    }
    v8 = [[ARWorldTrackingTechnique alloc] initWithOptions:v5];
    if (v8)
    {
      v9 = [ARParentTechnique alloc];
      v14[0] = v8;
      objc_super v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
      v11 = [(ARParentTechnique *)v9 initWithParallelTechniques:v10];
      [v3 addObject:v11];
    }
    v12 = [[ARWorldAlignmentTechnique alloc] initWithAlignment:[(ARConfiguration *)self worldAlignment] cameraPosition:1];
    [v3 addObject:v12];
  }
  return v3;
}

- (id)parentImageSensorSettings
{
  v21.receiver = self;
  v21.super_class = (Class)ARFaceTrackingConfiguration;
  id v3 = [(ARConfiguration *)&v21 parentImageSensorSettings];
  id v4 = [v3 settings];
  id v5 = (void *)[v4 mutableCopy];

  if ([(id)objc_opt_class() supportsWorldTracking])
  {
    uint64_t v6 = [(ARFaceTrackingConfiguration *)self imageSensorSettingsForWorldTracking];
    uint64_t v7 = [v6 videoFormat];
    if (v7)
    {
      v8 = (void *)v7;
      uint64_t v9 = [(ARConfiguration *)self videoFormat];
      if (v9)
      {
        objc_super v10 = (void *)v9;
        v11 = [v6 videoFormat];
        uint64_t v12 = [v11 captureDevicePosition];
        v13 = [(ARConfiguration *)self videoFormat];
        if (v12 == [v13 captureDevicePosition])
        {
          v20 = [v6 videoFormat];
          [v20 captureDeviceType];
          objc_super v14 = v18 = v11;
          v15 = [(ARConfiguration *)self videoFormat];
          v16 = [v15 captureDeviceType];
          char v19 = [v14 isEqualToString:v16];

          if (v19) {
            goto LABEL_10;
          }
        }
        else
        {
        }
        objc_msgSend(v6, "setEnabled:", -[ARFaceTrackingConfiguration isWorldTrackingEnabled](self, "isWorldTrackingEnabled"));
        [v5 addObject:v6];
      }
      else
      {
      }
    }
LABEL_10:
  }
  [v3 setSettings:v5];

  return v3;
}

- (id)imageSensorSettingsForLowPower
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(ARVideoFormat *)self->super._videoFormat imageResolution];
  uint64_t v4 = (int)v3;
  [(ARVideoFormat *)self->super._videoFormat imageResolution];
  uint64_t v6 = (int)v5;
  AVCaptureDevicePosition v7 = [(ARVideoFormat *)self->super._videoFormat captureDevicePosition];
  v8 = +[ARVideoFormat bestVideoFormatForDevicePosition:v7 deviceType:*MEMORY[0x1E4F15830] resolution:v4 | (v6 << 32) frameRate:1 videoBinned:(double)[(ARVideoFormat *)self->super._videoFormat framesPerSecond]];
  uint64_t v9 = [[ARImageSensorSettings alloc] initWithVideoFormat:v8];
  [(ARImageSensorSettings *)v9 setAutoFocusEnabled:[(ARConfiguration *)self isAutoFocusEnabled]];
  [(ARImageSensorSettings *)v9 setSupportsCapturingHighResolutionFrames:1];
  if ([(ARVideoFormat *)self->super._videoFormat captureDevicePosition] == AVCaptureDevicePositionFront)
  {
    objc_super v10 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.face.mirror"];
    v11 = v10;
    if (v10)
    {
      uint64_t v12 = [v10 BOOLValue];
      if (_ARLogSensor_onceToken_2 != -1) {
        dispatch_once(&_ARLogSensor_onceToken_2, &__block_literal_global_99);
      }
      v13 = (void *)_ARLogSensor_logObj_2;
      if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_2, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v14 = v13;
        v15 = (objc_class *)objc_opt_class();
        v16 = NSStringFromClass(v15);
        __int16 v17 = "disabled";
        *(_DWORD *)char v19 = 138543874;
        *(void *)&v19[4] = v16;
        if (v12) {
          __int16 v17 = "enabled";
        }
        *(_WORD *)&v19[12] = 2048;
        *(void *)&v19[14] = self;
        __int16 v20 = 2080;
        objc_super v21 = v17;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Face tracking image sensor mirrored video output %s by user defaults", v19, 0x20u);
      }
    }
    else
    {
      uint64_t v12 = 1;
    }
    -[ARImageSensorSettings setMirrorVideoOutput:](v9, "setMirrorVideoOutput:", v12, *(_OWORD *)v19);
  }
  return v9;
}

- (id)imageSensorSettings
{
  if (self->_lowPower)
  {
    uint64_t v3 = [(ARFaceTrackingConfiguration *)self imageSensorSettingsForLowPower];
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)ARFaceTrackingConfiguration;
    uint64_t v3 = [(ARConfiguration *)&v8 imageSensorSettings];
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = [(ARFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces];
  uint64_t v6 = (void *)MEMORY[0x1E4F15E48];
  if (v5 <= 0) {
    uint64_t v6 = (void *)MEMORY[0x1E4F15E30];
  }
  [v4 setMetaData:*v6];
  objc_msgSend(v4, "setMaximumNumberOfTrackedFaces:", -[ARFaceTrackingConfiguration maximumNumberOfTrackedFaces](self, "maximumNumberOfTrackedFaces"));
  [v4 setCalibrationDataOutputEnabled:0];
  return v4;
}

- (id)imageSensorSettingsForWorldTracking
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForWorldTracking];
  uint64_t v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = [[ARImageSensorSettings alloc] initWithVideoFormat:v4];
    [(ARImageSensorSettings *)v5 setAutoFocusEnabled:[(ARConfiguration *)self isAutoFocusEnabled]];
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.visionData"])
    {
      uint64_t v6 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.simulateHWFeatureDetection"] ^ 1;
    }
    else
    {
      uint64_t v6 = 0;
    }
    [(ARImageSensorSettings *)v5 setVisionDataOutputEnabled:v6];
    if ([(ARImageSensorSettings *)v5 visionDataOutputEnabled])
    {
      AVCaptureDevicePosition v7 = [[ARWorldTrackingOptions alloc] initWithImageSensorSettings:v5];
      [(ARWorldTrackingOptions *)v7 setImageSensorSettings:v5];
      objc_super v8 = ARVisionDataParametersForWorldTrackingOptions(v7);
      if (v8)
      {
        [(ARImageSensorSettings *)v5 setVisionDataOutputParameters:v8];
      }
      else
      {
        uint64_t v9 = _ARLogGeneral_6();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          objc_super v10 = (objc_class *)objc_opt_class();
          v11 = NSStringFromClass(v10);
          int v13 = 138543618;
          objc_super v14 = v11;
          __int16 v15 = 2048;
          v16 = self;
          _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error reading vision data output parameters.", (uint8_t *)&v13, 0x16u);
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (void)setMaximumNumberOfTrackedFaces:(NSInteger)maximumNumberOfTrackedFaces
{
  if (ARLinkedOnOrAfterYukon())
  {
    NSInteger v5 = (int)+[ARFaceTrackingConfiguration supportedNumberOfTrackedFaces];
    if ((maximumNumberOfTrackedFaces & 0x8000000000000000) == 0) {
      goto LABEL_3;
    }
LABEL_6:
    self->_maximumNumberOfTrackedFaces = 0;
    return;
  }
  NSInteger v5 = 1;
  if (maximumNumberOfTrackedFaces < 0) {
    goto LABEL_6;
  }
LABEL_3:
  if (v5 >= maximumNumberOfTrackedFaces) {
    self->_maximumNumberOfTrackedFaces = maximumNumberOfTrackedFaces;
  }
  else {
    self->_maximumNumberOfTrackedFaces = v5;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ARFaceTrackingConfiguration;
  if ([(ARConfiguration *)&v11 isEqual:v4])
  {
    id v5 = v4;
    int v6 = [(ARFaceTrackingConfiguration *)self isWorldTrackingEnabled];
    if (v6 == [v5 isWorldTrackingEnabled]
      && (NSInteger v7 = [(ARFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces],
          v7 == [v5 maximumNumberOfTrackedFaces]))
    {
      BOOL v8 = [(ARFaceTrackingConfiguration *)self lowPower];
      int v9 = v8 ^ [v5 lowPower] ^ 1;
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ARFaceTrackingConfiguration;
  id v4 = [(ARConfiguration *)&v6 copyWithZone:a3];
  v4[112] = [(ARFaceTrackingConfiguration *)self isWorldTrackingEnabled];
  *((void *)v4 + 15) = [(ARFaceTrackingConfiguration *)self maximumNumberOfTrackedFaces];
  v4[113] = [(ARFaceTrackingConfiguration *)self lowPower];
  return v4;
}

- (NSInteger)maximumNumberOfTrackedFaces
{
  return self->_maximumNumberOfTrackedFaces;
}

- (BOOL)isWorldTrackingEnabled
{
  return self->_worldTrackingEnabled;
}

- (void)setWorldTrackingEnabled:(BOOL)worldTrackingEnabled
{
  self->_worldTrackingEnabled = worldTrackingEnabled;
}

- (BOOL)lowPower
{
  return self->_lowPower;
}

- (void)setLowPower:(BOOL)a3
{
  self->_lowPower = a3;
}

@end