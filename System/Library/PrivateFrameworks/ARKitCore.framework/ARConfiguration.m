@interface ARConfiguration
+ (ARVideoFormat)recommendedVideoFormatFor4KResolution;
+ (ARVideoFormat)recommendedVideoFormatForHighResolutionFrameCapturing;
+ (AVCaptureDevice)configurableCaptureDeviceForPrimaryCamera;
+ (BOOL)shouldProvideNonBinnedVideoFormats;
+ (BOOL)shouldProvideX420VideoFormat;
+ (BOOL)shouldUse30FPSJasperFormats;
+ (BOOL)supportsFrameSemantics:(ARFrameSemantics)frameSemantics;
+ (NSArray)supportedVideoFormats;
+ (id)_querySupportedVideoFormatsForJasper:(int64_t)a3;
+ (id)_supportedVideoFormatsForJasper:(int64_t)a3;
+ (void)setShouldProvideNonBinnedVideoFormats:(BOOL)a3;
+ (void)setShouldProvideX420VideoFormat:(BOOL)a3;
+ (void)setShouldUse30FPSJasperFormats:(BOOL)a3;
- (ARConfiguration)init;
- (ARFrameSemantics)frameSemantics;
- (ARImageSensorSettings)imageSensorSettings;
- (ARParentImageSensorSettings)parentImageSensorSettings;
- (ARReplaySensorProtocol)replaySensor;
- (ARVideoFormat)videoFormat;
- (ARWorldAlignment)worldAlignment;
- (BOOL)allowCameraInMultipleForegroundAppLayout;
- (BOOL)disableMLRelocalization;
- (BOOL)disableOcclusionForPersonSegmentation;
- (BOOL)disableRenderSyncScheduling;
- (BOOL)dropInitialFramesOutsideExposureTarget;
- (BOOL)focusPixelBlurScoreDeliveryEnabled;
- (BOOL)isAutoFocusEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isKindOfConfiguration:(Class)a3;
- (BOOL)isLightEstimationEnabled;
- (BOOL)isPersonMetadataEnabled;
- (BOOL)providesAudioData;
- (BOOL)shouldUseJasper;
- (BOOL)smartPersonOcclusionEnabled;
- (BOOL)videoHDRAllowed;
- (NSArray)customSensors;
- (NSString)deviceModel;
- (NSString)timeOfFlightProjectorMode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)depthSensorSettingsForJasper;
- (id)description;
- (id)descriptionWithoutBrackets;
- (id)getAsKindOfConfiguration:(Class)a3;
- (id)initPrivate;
- (id)secondaryTechniques;
- (id)techniques;
- (int64_t)_depthPrioritization;
- (int64_t)cameraPosition;
- (int64_t)depthSensorNumberOfPointsMode;
- (int64_t)jasperFrameRate;
- (int64_t)maxUltrawideImageForwardingFrameRate;
- (unint64_t)frameDebugOptions;
- (unint64_t)hash;
- (unint64_t)lightEstimation;
- (void)createTechniques:(id)a3;
- (void)setAllowCameraInMultipleForegroundAppLayout:(BOOL)a3;
- (void)setAutoFocusEnabled:(BOOL)a3;
- (void)setCameraPosition:(int64_t)a3;
- (void)setCustomSensors:(id)a3;
- (void)setDepthSensorNumberOfPointsMode:(int64_t)a3;
- (void)setDisableMLRelocalization:(BOOL)a3;
- (void)setDisableOcclusionForPersonSegmentation:(BOOL)a3;
- (void)setDisableRenderSyncScheduling:(BOOL)a3;
- (void)setDropInitialFramesOutsideExposureTarget:(BOOL)a3;
- (void)setFocusPixelBlurScoreDeliveryEnabled:(BOOL)a3;
- (void)setFrameDebugOptions:(unint64_t)a3;
- (void)setFrameSemantics:(ARFrameSemantics)frameSemantics;
- (void)setJasperFrameRate:(int64_t)a3;
- (void)setLightEstimation:(unint64_t)a3;
- (void)setLightEstimationEnabled:(BOOL)lightEstimationEnabled;
- (void)setMaxUltrawideImageForwardingFrameRate:(int64_t)a3;
- (void)setPersonMetadataEnabled:(BOOL)a3;
- (void)setProvidesAudioData:(BOOL)providesAudioData;
- (void)setSmartPersonOcclusionEnabled:(BOOL)a3;
- (void)setTimeOfFlightProjectorMode:(id)a3;
- (void)setVideoFormat:(ARVideoFormat *)videoFormat;
- (void)setVideoHDRAllowed:(BOOL)videoHDRAllowed;
- (void)setWorldAlignment:(ARWorldAlignment)worldAlignment;
@end

@implementation ARConfiguration

- (ARConfiguration)init
{
  return 0;
}

- (id)initPrivate
{
  v7.receiver = self;
  v7.super_class = (Class)ARConfiguration;
  v2 = [(ARConfiguration *)&v7 init];
  if (v2)
  {
    if (([v2 isMemberOfClass:objc_opt_class()] & 1) == 0)
    {
      v3 = [(id)objc_opt_class() supportedVideoFormats];
      uint64_t v4 = [v3 firstObject];
      v5 = (void *)*((void *)v2 + 2);
      *((void *)v2 + 2) = v4;
    }
    v2[35] = 0;
    *((void *)v2 + 6) = 0;
    *(_OWORD *)(v2 + 72) = xmmword_1B8A2E980;
    *((void *)v2 + 1) = 0;
    objc_storeStrong((id *)v2 + 11, @"ARTimeOfFlightProjectorModeNormalShortHybrid");
    *((void *)v2 + 12) = 0;
    v2[34] = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.personOcclusion.optimizationStrategy"] != 0;
    *((void *)v2 + 3) = 0;
    *((void *)v2 + 13) = -1;
    v2[33] = 0;
    v2[38] = 0;
    v2[41] = 0;
    v2[42] = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.initialFrameDrop.enabled"];
    v2[36] = 0;
  }
  return v2;
}

- (void)setVideoFormat:(ARVideoFormat *)videoFormat
{
  uint64_t v4 = videoFormat;
  v5 = [(id)objc_opt_class() supportedVideoFormats];
  uint64_t v6 = [v5 indexOfObject:v4];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v8 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Video format not supported by this configuration" userInfo:0];
    objc_exception_throw(v8);
  }
  objc_super v7 = self->_videoFormat;
  self->_videoFormat = v4;
}

- (ARParentImageSensorSettings)parentImageSensorSettings
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  uint64_t v4 = [(ARConfiguration *)self imageSensorSettings];
  objc_msgSend(v4, "setDropsInitialFramesOutsideExposureTargetOffsetThreshold:", -[ARConfiguration dropInitialFramesOutsideExposureTarget](self, "dropInitialFramesOutsideExposureTarget"));
  v7[0] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];
  [v3 setSettings:v5];

  objc_msgSend(v3, "setAudioCaptureEnabled:", -[ARConfiguration providesAudioData](self, "providesAudioData"));
  objc_msgSend(v3, "setAllowCameraInMultipleForegroundAppLayout:", -[ARConfiguration allowCameraInMultipleForegroundAppLayout](self, "allowCameraInMultipleForegroundAppLayout"));

  return (ARParentImageSensorSettings *)v3;
}

- (ARImageSensorSettings)imageSensorSettings
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v3 = [ARImageSensorSettings alloc];
  uint64_t v4 = [(ARConfiguration *)self videoFormat];
  v5 = [(ARImageSensorSettings *)v3 initWithVideoFormat:v4];

  [(ARImageSensorSettings *)v5 setAutoFocusEnabled:[(ARConfiguration *)self isAutoFocusEnabled]];
  [(ARImageSensorSettings *)v5 setVideoHDRAllowed:[(ARConfiguration *)self videoHDRAllowed]];
  [(ARImageSensorSettings *)v5 setSupportsCapturingHighResolutionFrames:1];
  [(ARImageSensorSettings *)v5 setFocusPixelBlurScoreDeliveryEnabled:[(ARConfiguration *)self focusPixelBlurScoreDeliveryEnabled]];
  uint64_t v6 = [(ARConfiguration *)self videoFormat];
  uint64_t v7 = [v6 captureDevicePosition];

  if (v7 == 2)
  {
    id v8 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.face.mirror"];
    v9 = v8;
    if (v8)
    {
      uint64_t v10 = [v8 BOOLValue];
      if (_ARLogSensor_onceToken_4 != -1) {
        dispatch_once(&_ARLogSensor_onceToken_4, &__block_literal_global_475);
      }
      v11 = (void *)_ARLogSensor_logObj_4;
      if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_4, OS_LOG_TYPE_DEFAULT))
      {
        v12 = v11;
        v13 = (objc_class *)objc_opt_class();
        v14 = NSStringFromClass(v13);
        v15 = "disabled";
        *(_DWORD *)v17 = 138543874;
        *(void *)&v17[4] = v14;
        if (v10) {
          v15 = "enabled";
        }
        *(_WORD *)&v17[12] = 2048;
        *(void *)&v17[14] = self;
        __int16 v18 = 2080;
        v19 = v15;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Face tracking image sensor mirrored video output %s by user defaults", v17, 0x20u);
      }
    }
    else
    {
      uint64_t v10 = 1;
    }
    -[ARImageSensorSettings setMirrorVideoOutput:](v5, "setMirrorVideoOutput:", v10, *(_OWORD *)v17);
  }
  return v5;
}

- (BOOL)shouldUseJasper
{
  return 0;
}

- (id)depthSensorSettingsForJasper
{
  if ([(ARConfiguration *)self shouldUseJasper])
  {
    v3 = [(id)objc_opt_class() _supportedVideoFormatsForJasper:self->_depthSensorNumberOfPointsMode];
    uint64_t v4 = [v3 firstObject];

    if (v4)
    {
      v5 = [[ARDepthSensorSettings alloc] initWithVideoFormat:v4];
      uint64_t v6 = [(ARConfiguration *)self timeOfFlightProjectorMode];

      if (v6 != @"ARTimeOfFlightProjectorModeNone")
      {
        uint64_t v7 = [(ARConfiguration *)self timeOfFlightProjectorMode];
        [(ARDepthSensorSettings *)v5 setTimeOfFlightProjectorMode:v7];
      }
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

+ (id)_querySupportedVideoFormatsForJasper:(int64_t)a3
{
  v28[3] = *MEMORY[0x1E4F143B8];
  if (s_customJasperFrameRate)
  {
    v5 = objc_msgSend(NSNumber, "numberWithInteger:");
    v28[0] = v5;
    v28[1] = &unk_1F125C350;
    v28[2] = &unk_1F125C350;
    uint64_t v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:3];
  }
  else
  {
    uint64_t v6 = 0;
  }
  uint64_t v7 = +[ARKitUserDefaults objectForKey:@"com.apple.arkit.jasper.framerate"];
  id v8 = v7;
  if (v7)
  {
    v9 = [v7 componentsSeparatedByString:@","];
    uint64_t v10 = (void *)[v9 mutableCopy];

    if ([v10 count] == 3)
    {
      v11 = v6;
      uint64_t v6 = v10;
    }
    else
    {
      v11 = _ARLogGeneral_9();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (objc_class *)objc_opt_class();
        NSStringFromClass(v12);
        id v13 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543874;
        id v23 = v13;
        __int16 v24 = 2048;
        id v25 = a1;
        __int16 v26 = 2048;
        uint64_t v27 = [v6 count];
        _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Expected 3 jasper frame rate values: %lu", buf, 0x20u);
      }
    }
  }
  uint64_t v14 = +[ARVideoFormat bestTimeOfFlightFormatForDevicePosition:1 depthSensorNumberOfPointsMode:a3 frameRates:v6];
  v15 = (void *)v14;
  if (v14)
  {
    uint64_t v21 = v14;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  }
  else if (ARDeviceSupportsJasper())
  {
    v17 = [ARVideoFormat alloc];
    __int16 v18 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:](v17, "initWithImageResolution:captureDevicePosition:captureDeviceType:", 1, *MEMORY[0x1E4F15810], 512.0, 256.0);
    uint64_t v20 = v18;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

+ (id)_supportedVideoFormatsForJasper:(int64_t)a3
{
  if ([a1 isSupported])
  {
    v5 = [(id)s_supportedJasperFormatsCache firstObject];
    uint64_t v6 = [v5 device];

    if (!v6 || s_supportedJasperFormatsCache && ![(id)s_supportedJasperFormatsCache count])
    {
      uint64_t v7 = [a1 _querySupportedVideoFormatsForJasper:a3];
      id v8 = (void *)s_supportedJasperFormatsCache;
      s_supportedJasperFormatsCache = v7;
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __51__ARConfiguration__supportedVideoFormatsForJasper___block_invoke;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = a1;
    v11[5] = a3;
    if (_supportedVideoFormatsForJasper__onceToken != -1) {
      dispatch_once(&_supportedVideoFormatsForJasper__onceToken, v11);
    }
    id v9 = (id)s_supportedJasperFormatsCache;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v9;
}

void __51__ARConfiguration__supportedVideoFormatsForJasper___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormatsForJasper:*(void *)(a1 + 40)];
  v2 = (void *)s_supportedJasperFormatsCache;
  s_supportedJasperFormatsCache = v1;
}

- (void)setCustomSensors:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (v5)
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
    if (!v8) {
      goto LABEL_24;
    }
    uint64_t v9 = *(void *)v41;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v41 != v9) {
        objc_enumerationMutation(v7);
      }
      v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
      if ([v11 conformsToProtocol:&unk_1F1276560]) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v8 = [v7 countByEnumeratingWithState:&v40 objects:v44 count:16];
        if (v8) {
          goto LABEL_4;
        }
        goto LABEL_24;
      }
    }
    v12 = v11;
    id v13 = (id)*MEMORY[0x1E4F15830];
    id v14 = objc_initWeak(&location, self);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v16 = objc_loadWeakRetained(&location);
      v17 = [v16 templateConfiguration];
      objc_storeWeak(&location, v17);
    }
    id v18 = objc_loadWeakRetained(&location);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
    }
    else
    {
      id v24 = objc_loadWeakRetained(&location);
      objc_opt_class();
      char v25 = objc_opt_isKindOfClass();

      if ((v25 & 1) == 0)
      {
        uint64_t v27 = 1;
        goto LABEL_20;
      }
    }
    id v26 = (id)*MEMORY[0x1E4F15820];

    uint64_t v27 = 2;
    id v13 = v26;
LABEL_20:
    v28 = [ARVideoFormat alloc];
    [v12 imageResolution];
    v29 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:](v28, "initWithImageResolution:captureDevicePosition:captureDeviceType:", v27, v13);
    videoFormat = self->_videoFormat;
    self->_videoFormat = v29;

    v31 = _ARLogGeneral_9();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      id v33 = (id)objc_claimAutoreleasedReturnValue();
      v34 = [(ARVideoFormat *)self->_videoFormat description];
      *(_DWORD *)buf = 138543874;
      id v46 = v33;
      __int16 v47 = 2048;
      v48 = self;
      __int16 v49 = 2114;
      v50 = v34;
      _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Video format updated from replay sensor: %{public}@", buf, 0x20u);
    }
    objc_destroyWeak(&location);

    goto LABEL_23;
  }
  id v7 = [(id)objc_opt_class() supportedVideoFormats];
  v19 = [v7 firstObject];
  uint64_t v20 = self->_videoFormat;
  self->_videoFormat = v19;

  v12 = _ARLogGeneral_9();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    uint64_t v21 = (objc_class *)objc_opt_class();
    v22 = NSStringFromClass(v21);
    id v23 = [(ARVideoFormat *)self->_videoFormat description];
    *(_DWORD *)buf = 138543874;
    id v46 = v22;
    __int16 v47 = 2048;
    v48 = self;
    __int16 v49 = 2114;
    v50 = v23;
    _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Video format reset to default: %{public}@", buf, 0x20u);
  }
LABEL_23:

LABEL_24:
  objc_storeStrong((id *)&self->_customSensors, a3);
  v35 = _ARLogGeneral_9();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v36 = (objc_class *)objc_opt_class();
    v37 = NSStringFromClass(v36);
    customSensors = self->_customSensors;
    *(_DWORD *)buf = 138543874;
    id v46 = v37;
    __int16 v47 = 2048;
    v48 = self;
    __int16 v49 = 2048;
    v50 = customSensors;
    _os_log_impl(&dword_1B88A2000, v35, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Custom sensors set: %p", buf, 0x20u);
  }
}

- (void)setCameraPosition:(int64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (a3
    && ([(ARConfiguration *)self videoFormat],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 captureDevicePosition],
        v5,
        v6 != a3))
  {
    id v7 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:a3 deviceType:*MEMORY[0x1E4F15830]];
    uint64_t v10 = [v7 firstObject];
    videoFormat = self->_videoFormat;
    self->_videoFormat = v10;

    v12 = _ARLogGeneral_9();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = (objc_class *)objc_opt_class();
      id v14 = NSStringFromClass(v13);
      v15 = [(ARVideoFormat *)self->_videoFormat description];
      int v16 = 138543874;
      v17 = v14;
      __int16 v18 = 2048;
      v19 = self;
      __int16 v20 = 2114;
      uint64_t v21 = v15;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using custom video format for configuration, it may not be supported: %{public}@", (uint8_t *)&v16, 0x20u);
    }
  }
  else
  {
    id v7 = [(id)objc_opt_class() supportedVideoFormats];
    uint64_t v8 = [v7 firstObject];
    uint64_t v9 = self->_videoFormat;
    self->_videoFormat = v8;
  }
  self->_cameraPosition = a3;
}

- (BOOL)isLightEstimationEnabled
{
  return [(ARConfiguration *)self lightEstimation] != 0;
}

- (void)setLightEstimationEnabled:(BOOL)lightEstimationEnabled
{
}

- (void)setFrameSemantics:(ARFrameSemantics)frameSemantics
{
  if (([(id)objc_opt_class() supportsFrameSemantics:frameSemantics] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"This set of frame semantics is not supported on this configuration" userInfo:0];
    objc_exception_throw(v6);
  }
  self->_frameSemantics = frameSemantics;
  BOOL v5 = (frameSemantics & 0x18) == 0
    && +[ARKitUserDefaults integerForKey:@"com.apple.arkit.personOcclusion.optimizationStrategy"] != 0;
  self->_smartPersonOcclusionEnabled = v5;
}

+ (BOOL)supportsFrameSemantics:(ARFrameSemantics)frameSemantics
{
  return frameSemantics == 0;
}

- (NSString)deviceModel
{
  v3 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.worldtracking.deviceModel"];
  uint64_t v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v6 = [(ARConfiguration *)self replaySensor];
    id v5 = [v6 deviceModel];
  }
  return (NSString *)v5;
}

- (ARReplaySensorProtocol)replaySensor
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = [(ARConfiguration *)self customSensors];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        id v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if ([v6 conformsToProtocol:&unk_1F1276560])
        {
          id v3 = v6;
          goto LABEL_11;
        }
      }
      id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (ARReplaySensorProtocol *)v3;
}

- (void)setTimeOfFlightProjectorMode:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"ARTimeOfFlightProjectorModeNone"] & 1) == 0
    && ([(id)objc_opt_class() supportsTimeOfFlightProjectorMode] & 1) == 0)
  {
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Projector Mode is not supported on this device" userInfo:0];
    objc_exception_throw(v6);
  }
  timeOfFlightProjectorMode = self->_timeOfFlightProjectorMode;
  self->_timeOfFlightProjectorMode = (NSString *)v4;
}

- (id)techniques
{
  id v3 = objc_opt_new();
  id v4 = (void *)MEMORY[0x1BA9C6160]();
  [(ARConfiguration *)self createTechniques:v3];
  if ([v3 count]) {
    id v5 = v3;
  }
  else {
    id v5 = 0;
  }
  id v6 = v5;

  return v6;
}

- (void)createTechniques:(id)a3
{
  v72[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = ~[(ARConfiguration *)self frameSemantics] & 3;
  char v6 = [(ARConfiguration *)self frameSemantics];
  char v7 = [(ARConfiguration *)self frameSemantics];
  char v8 = [(ARConfiguration *)self frameSemantics];
  ARFrameSemantics v9 = [(ARConfiguration *)self frameSemantics];
  if (!v5 && [(id)objc_opt_class() supportsFrameSemantics:3])
  {
    if (ARDeviceSupportsJasper()) {
      long long v10 = [[ARDepthTechnique alloc] initWithPrioritization:[(ARConfiguration *)self _depthPrioritization] temporalSmoothing:(v9 >> 4) & 1];
    }
    else {
      long long v10 = (ARDepthTechnique *)objc_opt_new();
    }
    long long v11 = v10;
    ARFrameSemantics v26 = v8 & 8 | v9 & 0x10;
    v12 = (ARParentTechnique *)objc_opt_new();
    uint64_t v27 = objc_opt_new();
    [v27 setShouldOperateOnHighResolutionImages:1];
    ARAddScalingTechniquesToTechniques(v4, !self->_disableOcclusionForPersonSegmentation, 0, 256.0, 192.0, 0.002, 0.005);
    id v28 = objc_alloc(MEMORY[0x1E4F1CA48]);
    v29 = objc_opt_new();
    v30 = objc_msgSend(v28, "initWithObjects:", v12, v27, v29, 0);

    if (v26 && ARDeviceSupportsJasper())
    {
      v31 = [ARParentTechnique alloc];
      v72[0] = v11;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:1];
      id v33 = [(ARParentTechnique *)v31 initWithParallelTechniques:v32];

      [v4 addObject:v33];
    }
    else
    {
      [v30 addObject:v11];
    }
    if (!self->_disableOcclusionForPersonSegmentation)
    {
      v34 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      v35 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      [(ARMLImageMattingMetadataTechnique *)v35 setShouldOperateOnHighResolutionImages:1];
      [v30 addObject:v34];
      [v30 addObject:v35];
    }
    v17 = [(ARParentTechnique *)[ARPersonOcclusionParentTechnique alloc] initWithParallelTechniques:v30];
    if ([(ARConfiguration *)self smartPersonOcclusionEnabled]) {
      int64_t v36 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.personOcclusion.optimizationStrategy"];
    }
    else {
      int64_t v36 = 0;
    }
    [(ARPersonOcclusionParentTechnique *)v17 setOptimizationStrategy:v36];
    [v4 addObject:v17];
    v37 = objc_opt_new();
    [v4 addObject:v37];

    goto LABEL_32;
  }
  if ((v6 & 1) != 0 && [(id)objc_opt_class() supportsFrameSemantics:1])
  {
    ARAddScalingTechniquesToTechniques(v4, !self->_disableOcclusionForPersonSegmentation, 0, 256.0, 192.0, 0.002, 0.005);
    long long v11 = (ARDepthTechnique *)objc_opt_new();
    v12 = (ARParentTechnique *)objc_opt_new();
    [(ARParentTechnique *)v12 setShouldOperateOnHighResolutionImages:1];
    uint64_t v13 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", v11, v12, 0);
    if (!self->_disableOcclusionForPersonSegmentation)
    {
      id v14 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      v15 = objc_alloc_init(ARMLImageMattingMetadataTechnique);
      [(ARMLImageMattingMetadataTechnique *)v15 setShouldOperateOnHighResolutionImages:1];
      [v13 addObject:v14];
      [v13 addObject:v15];
    }
    ARFrameSemantics v16 = v8 & 8 | v9 & 0x10;
    v17 = [(ARParentTechnique *)[ARPersonOcclusionParentTechnique alloc] initWithParallelTechniques:v13];
    if ([(ARConfiguration *)self smartPersonOcclusionEnabled]) {
      uint64_t v18 = 2;
    }
    else {
      uint64_t v18 = 0;
    }
    [(ARPersonOcclusionParentTechnique *)v17 setOptimizationStrategy:v18];
    [v4 addObject:v17];
    if (v16 && ARDeviceSupportsJasper())
    {
      v19 = [[ARDepthTechnique alloc] initWithPrioritization:[(ARConfiguration *)self _depthPrioritization] temporalSmoothing:(v9 >> 4) & 1];
      __int16 v20 = [ARParentTechnique alloc];
      v71 = v19;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v71 count:1];
      uint64_t v22 = [(ARParentTechnique *)v20 initWithParallelTechniques:v21];

      [v4 addObject:v22];
    }

LABEL_32:
    char v25 = 1;
    if ((v7 & 4) == 0) {
      goto LABEL_45;
    }
    goto LABEL_33;
  }
  if (v8 & 8 | v9 & 0x10 && ARDeviceSupportsJasper())
  {
    long long v11 = [[ARDepthTechnique alloc] initWithPrioritization:[(ARConfiguration *)self _depthPrioritization] temporalSmoothing:(v9 >> 4) & 1];
    id v23 = [ARParentTechnique alloc];
    v70 = v11;
    id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v70 count:1];
    v12 = [(ARParentTechnique *)v23 initWithParallelTechniques:v24];

    ARAddScalingTechniquesToTechniques(v4, 0, 0, 256.0, 192.0, 0.002, 0.005);
    [v4 addObject:v12];
    v17 = 0;
    goto LABEL_32;
  }
  v17 = 0;
  char v25 = 0;
  if ((v7 & 4) == 0) {
    goto LABEL_45;
  }
LABEL_33:
  if ([(id)objc_opt_class() supportsFrameSemantics:4])
  {
    if ((v25 & 1) == 0)
    {
      +[AR2DSkeletonDetectionTechnique inputDimensionsForMLModel];
      double v39 = v38;
      double v41 = v40;
      long long v42 = _ARLogGeneral_9();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        long long v43 = (objc_class *)objc_opt_class();
        v44 = NSStringFromClass(v43);
        *(_DWORD *)buf = 138544130;
        v63 = v44;
        __int16 v64 = 2048;
        v65 = self;
        __int16 v66 = 2048;
        double v67 = v39;
        __int16 v68 = 2048;
        double v69 = v41;
        _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_INFO, "%{public}@ <%p>: ARConfiguration for Body Detection Scaler dimensions: (%f,%f)", buf, 0x2Au);
      }
      if (ARIsANEVersionEqualOrPriorToH12()) {
        double v45 = 0.00600000005;
      }
      else {
        double v45 = 0.00800000038;
      }
      ARAddScalingTechniquesToTechniques(v4, 0, 0, v39, v41, v45, 0.012);
    }
    id v46 = objc_opt_new();
    __int16 v47 = objc_opt_new();
    v48 = [ARParentTechnique alloc];
    v61[0] = v46;
    v61[1] = v47;
    __int16 v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:2];
    v50 = [(ARParentTechnique *)v48 initWithTechniques:v49];

    if (v17)
    {
      uint64_t v51 = [(ARParentTechnique *)v17 techniques];
      v52 = [(ARParentTechnique *)v51 arrayByAddingObject:v50];
      [(ARPersonOcclusionParentTechnique *)v17 setTechniques:v52];
    }
    else
    {
      v53 = [ARParentTechnique alloc];
      v60 = v50;
      v54 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
      uint64_t v51 = [(ARParentTechnique *)v53 initWithParallelTechniques:v54];

      [v4 addObject:v51];
    }
  }
LABEL_45:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || ([(ARConfiguration *)self isWorldTrackingEnabled] & 1) == 0)
  {
    v55 = [ARWorldAlignmentTechnique alloc];
    ARWorldAlignment v56 = [(ARConfiguration *)self worldAlignment];
    v57 = [(ARConfiguration *)self videoFormat];
    v58 = -[ARWorldAlignmentTechnique initWithAlignment:cameraPosition:](v55, "initWithAlignment:cameraPosition:", v56, [v57 captureDevicePosition]);
    [v4 addObject:v58];
  }
  if ([(ARConfiguration *)self lightEstimation] == 1
    || [(ARConfiguration *)self lightEstimation] == 2)
  {
    v59 = objc_opt_new();
    [v4 addObject:v59];
  }
}

- (int64_t)_depthPrioritization
{
  return 1;
}

- (id)secondaryTechniques
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (NSArray)supportedVideoFormats
{
  id v2 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Supported video formats should be called on individual configuration class." userInfo:0];
  objc_exception_throw(v2);
}

+ (void)setShouldUse30FPSJasperFormats:(BOOL)a3
{
  if (s_customJasperFrameRate != 30)
  {
    s_customJasperFrameRate = 30;
    id v3 = (void *)s_supportedJasperFormatsCache;
    if (s_supportedJasperFormatsCache)
    {
      s_supportedJasperFormatsCache = MEMORY[0x1E4F1CBF0];
    }
  }
}

+ (BOOL)shouldUse30FPSJasperFormats
{
  return s_customJasperFrameRate == 30;
}

- (void)setJasperFrameRate:(int64_t)a3
{
  if (self->_jasperFrameRate != a3)
  {
    self->_jasperFrameRate = a3;
    s_customJasperFrameRate = a3;
    id v3 = (void *)s_supportedJasperFormatsCache;
    if (s_supportedJasperFormatsCache)
    {
      s_supportedJasperFormatsCache = MEMORY[0x1E4F1CBF0];
    }
  }
}

- (int64_t)jasperFrameRate
{
  return self->_jasperFrameRate;
}

- (void)setDepthSensorNumberOfPointsMode:(int64_t)a3
{
  if (self->_depthSensorNumberOfPointsMode != a3 || s_customNumberOfPointsMode != a3)
  {
    self->_depthSensorNumberOfPointsMode = a3;
    s_customNumberOfPointsMode = a3;
    id v4 = (void *)s_supportedJasperFormatsCache;
    if (s_supportedJasperFormatsCache)
    {
      s_supportedJasperFormatsCache = MEMORY[0x1E4F1CBF0];
    }
  }
}

+ (AVCaptureDevice)configurableCaptureDeviceForPrimaryCamera
{
  SEL v2 = NSSelectorFromString(&cfstr_Supportedvideo.isa);
  objc_opt_class();
  if (objc_opt_respondsToSelector())
  {
    id v3 = [(id)objc_opt_class() performSelector:v2];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v4 = [v3 firstObject];

      if (v4)
      {
        id v4 = [MEMORY[0x1E4F16440] defaultDeviceWithDeviceType:*MEMORY[0x1E4F15830] mediaType:*MEMORY[0x1E4F15C18] position:1];
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }
  return (AVCaptureDevice *)v4;
}

+ (ARVideoFormat)recommendedVideoFormatFor4KResolution
{
  return 0;
}

+ (ARVideoFormat)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return 0;
}

+ (void)setShouldProvideX420VideoFormat:(BOOL)a3
{
  if (s_provideX420VideoFormat != a3) {
    s_provideX420VideoFormat = a3;
  }
}

+ (BOOL)shouldProvideX420VideoFormat
{
  return s_provideX420VideoFormat;
}

+ (void)setShouldProvideNonBinnedVideoFormats:(BOOL)a3
{
  if (s_provideNonBinnedVideoFormats != a3) {
    s_provideNonBinnedVideoFormats = a3;
  }
}

+ (BOOL)shouldProvideNonBinnedVideoFormats
{
  if (s_provideNonBinnedVideoFormats || (ARDeviceSupportsUltraWideCamera() & 1) != 0) {
    return 1;
  }
  return ARDeviceSupportsJasper();
}

- (unint64_t)hash
{
  SEL v2 = (objc_class *)objc_opt_class();
  id v3 = NSStringFromClass(v2);
  unint64_t v4 = [v3 hash];

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v38.receiver = self;
  v38.super_class = (Class)ARConfiguration;
  if (![(ARConfiguration *)&v38 isEqual:v6])
  {
    if (![v6 isMemberOfClass:objc_opt_class()])
    {
      BOOL v7 = 0;
      goto LABEL_38;
    }
    id v8 = v6;
    ARFrameSemantics v9 = [(ARConfiguration *)self customSensors];
    uint64_t v10 = [v8 customSensors];
    if (v9 == (void *)v10)
    {
    }
    else
    {
      long long v11 = (void *)v10;
      id v3 = [(ARConfiguration *)self customSensors];
      unint64_t v4 = [v8 customSensors];
      int v12 = [v3 isEqualToArray:v4];

      if (!v12)
      {
        BOOL v7 = 0;
LABEL_37:

        goto LABEL_38;
      }
    }
    uint64_t v13 = [(ARConfiguration *)self videoFormat];
    id v14 = [v8 videoFormat];
    if (v13 != v14)
    {
      id v3 = [(ARConfiguration *)self videoFormat];
      unint64_t v4 = [v8 videoFormat];
      if (![v3 isEqual:v4])
      {
        LOBYTE(v15) = 0;
        goto LABEL_35;
      }
    }
    int v16 = [(ARConfiguration *)self isAutoFocusEnabled];
    if (v16 == [v8 isAutoFocusEnabled])
    {
      ARWorldAlignment v17 = [(ARConfiguration *)self worldAlignment];
      if (v17 == [v8 worldAlignment])
      {
        unint64_t v18 = [(ARConfiguration *)self lightEstimation];
        if (v18 == [v8 lightEstimation])
        {
          int v19 = [(ARConfiguration *)self providesAudioData];
          if (v19 == [v8 providesAudioData])
          {
            unint64_t v20 = [(ARConfiguration *)self frameDebugOptions];
            if (v20 == [v8 frameDebugOptions])
            {
              int64_t v21 = [(ARConfiguration *)self cameraPosition];
              if (v21 == [v8 cameraPosition])
              {
                int v22 = [(ARConfiguration *)self isPersonMetadataEnabled];
                if (v22 == [v8 isPersonMetadataEnabled])
                {
                  int v23 = [(ARConfiguration *)self allowCameraInMultipleForegroundAppLayout];
                  if (v23 == [v8 allowCameraInMultipleForegroundAppLayout])
                  {
                    int v24 = [(ARConfiguration *)self disableOcclusionForPersonSegmentation];
                    if (v24 == [v8 disableOcclusionForPersonSegmentation])
                    {
                      int v25 = [(ARConfiguration *)self disableMLRelocalization];
                      if (v25 == [v8 disableMLRelocalization])
                      {
                        int v26 = [(ARConfiguration *)self disableRenderSyncScheduling];
                        if (v26 == [v8 disableRenderSyncScheduling])
                        {
                          int v27 = [(ARConfiguration *)self dropInitialFramesOutsideExposureTarget];
                          if (v27 == [v8 dropInitialFramesOutsideExposureTarget])
                          {
                            ARFrameSemantics v28 = [(ARConfiguration *)self frameSemantics];
                            if (v28 == [v8 frameSemantics])
                            {
                              v29 = [(ARConfiguration *)self timeOfFlightProjectorMode];
                              v30 = [v8 timeOfFlightProjectorMode];
                              if (v29 == v30)
                              {
                                int64_t v31 = [(ARConfiguration *)self depthSensorNumberOfPointsMode];
                                if (v31 == [v8 depthSensorNumberOfPointsMode])
                                {
                                  int v32 = [(ARConfiguration *)self smartPersonOcclusionEnabled];
                                  if (v32 == [v8 smartPersonOcclusionEnabled])
                                  {
                                    int64_t v33 = [(ARConfiguration *)self jasperFrameRate];
                                    if (v33 == [v8 jasperFrameRate])
                                    {
                                      int v34 = [(ARConfiguration *)self videoHDRAllowed];
                                      if (v34 == [v8 videoHDRAllowed])
                                      {
                                        int64_t v35 = [(ARConfiguration *)self maxUltrawideImageForwardingFrameRate];
                                        if (v35 == [v8 maxUltrawideImageForwardingFrameRate])
                                        {
                                          BOOL v36 = [(ARConfiguration *)self focusPixelBlurScoreDeliveryEnabled];
                                          int v15 = v36 ^ [v8 focusPixelBlurScoreDeliveryEnabled] ^ 1;

                                          BOOL v7 = v15;
                                          goto LABEL_34;
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
    LOBYTE(v15) = 0;
    BOOL v7 = 0;
LABEL_34:
    if (v13 == v14)
    {
LABEL_36:

      goto LABEL_37;
    }
LABEL_35:

    BOOL v7 = v15;
    goto LABEL_36;
  }
  BOOL v7 = 1;
LABEL_38:

  return v7;
}

- (id)descriptionWithoutBrackets
{
  id v3 = objc_opt_new();
  unint64_t v4 = v3;
  unint64_t worldAlignment = self->_worldAlignment;
  if (worldAlignment > 2) {
    id v6 = @"Unknown";
  }
  else {
    id v6 = off_1E6186408[worldAlignment];
  }
  [v3 appendFormat:@" worldAlignment=%@", v6];
  unint64_t v7 = [(ARConfiguration *)self lightEstimation];
  id v8 = @"Enabled";
  if (!v7) {
    id v8 = @"Disabled";
  }
  [v4 appendFormat:@" lightEstimation=%@", v8];
  ARFrameSemantics v9 = NSStringFromARFrameSemantics([(ARConfiguration *)self frameSemantics]);
  [v4 appendFormat:@" frameSemantics=%@", v9];

  uint64_t v10 = [(ARConfiguration *)self videoFormat];
  [v4 appendFormat:@" videoFormat=%@", v10];

  return v4;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  unint64_t v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  unint64_t v7 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v7];

  [v6 appendString:@">"];
  return v6;
}

- (BOOL)isKindOfConfiguration:(Class)a3
{
  id v3 = [(ARConfiguration *)self getAsKindOfConfiguration:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)getAsKindOfConfiguration:(Class)a3
{
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = self;
    goto LABEL_8;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v5 = self;
    id v6 = [(ARConfiguration *)v5 templateConfiguration];
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      BOOL v4 = [(ARConfiguration *)v5 templateConfiguration];

      goto LABEL_8;
    }
  }
  BOOL v4 = 0;
LABEL_8:
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "initPrivate");
  objc_storeStrong((id *)(v5 + 16), self->_videoFormat);
  *(unsigned char *)(v5 + 35) = [(ARConfiguration *)self isAutoFocusEnabled];
  *(void *)(v5 + 48) = self->_worldAlignment;
  *(void *)(v5 + 72) = self->_lightEstimation;
  *(unsigned char *)(v5 + 32) = self->_providesAudioData;
  uint64_t v6 = [(NSArray *)self->_customSensors copyWithZone:a3];
  unint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  *(void *)(v5 + 80) = self->_frameDebugOptions;
  *(unsigned char *)(v5 + 37) = self->_personMetadataEnabled;
  *(void *)(v5 + 8) = self->_cameraPosition;
  *(unsigned char *)(v5 + 38) = self->_allowCameraInMultipleForegroundAppLayout;
  *(unsigned char *)(v5 + 39) = self->_disableOcclusionForPersonSegmentation;
  *(unsigned char *)(v5 + 40) = self->_disableMLRelocalization;
  *(unsigned char *)(v5 + 41) = self->_disableRenderSyncScheduling;
  *(unsigned char *)(v5 + 42) = self->_dropInitialFramesOutsideExposureTarget;
  *(void *)(v5 + 56) = self->_frameSemantics;
  objc_storeStrong((id *)(v5 + 88), self->_timeOfFlightProjectorMode);
  *(void *)(v5 + 96) = self->_depthSensorNumberOfPointsMode;
  *(unsigned char *)(v5 + 34) = self->_smartPersonOcclusionEnabled;
  *(void *)(v5 + 24) = self->_jasperFrameRate;
  *(unsigned char *)(v5 + 33) = self->_videoHDRAllowed;
  *(void *)(v5 + 104) = self->_maxUltrawideImageForwardingFrameRate;
  *(unsigned char *)(v5 + 36) = self->_focusPixelBlurScoreDeliveryEnabled;
  return (id)v5;
}

- (ARVideoFormat)videoFormat
{
  return self->_videoFormat;
}

- (ARWorldAlignment)worldAlignment
{
  return self->_worldAlignment;
}

- (void)setWorldAlignment:(ARWorldAlignment)worldAlignment
{
  self->_unint64_t worldAlignment = worldAlignment;
}

- (BOOL)providesAudioData
{
  return self->_providesAudioData;
}

- (void)setProvidesAudioData:(BOOL)providesAudioData
{
  self->_providesAudioData = providesAudioData;
}

- (ARFrameSemantics)frameSemantics
{
  return self->_frameSemantics;
}

- (BOOL)videoHDRAllowed
{
  return self->_videoHDRAllowed;
}

- (void)setVideoHDRAllowed:(BOOL)videoHDRAllowed
{
  self->_videoHDRAllowed = videoHDRAllowed;
}

- (BOOL)smartPersonOcclusionEnabled
{
  return self->_smartPersonOcclusionEnabled;
}

- (void)setSmartPersonOcclusionEnabled:(BOOL)a3
{
  self->_smartPersonOcclusionEnabled = a3;
}

- (BOOL)isAutoFocusEnabled
{
  return self->_autoFocusEnabled;
}

- (void)setAutoFocusEnabled:(BOOL)a3
{
  self->_autoFocusEnabled = a3;
}

- (BOOL)focusPixelBlurScoreDeliveryEnabled
{
  return self->_focusPixelBlurScoreDeliveryEnabled;
}

- (void)setFocusPixelBlurScoreDeliveryEnabled:(BOOL)a3
{
  self->_focusPixelBlurScoreDeliveryEnabled = a3;
}

- (NSArray)customSensors
{
  return self->_customSensors;
}

- (unint64_t)lightEstimation
{
  return self->_lightEstimation;
}

- (void)setLightEstimation:(unint64_t)a3
{
  self->_lightEstimation = a3;
}

- (unint64_t)frameDebugOptions
{
  return self->_frameDebugOptions;
}

- (void)setFrameDebugOptions:(unint64_t)a3
{
  self->_frameDebugOptions = a3;
}

- (BOOL)isPersonMetadataEnabled
{
  return self->_personMetadataEnabled;
}

- (void)setPersonMetadataEnabled:(BOOL)a3
{
  self->_personMetadataEnabled = a3;
}

- (int64_t)cameraPosition
{
  return self->_cameraPosition;
}

- (BOOL)allowCameraInMultipleForegroundAppLayout
{
  return self->_allowCameraInMultipleForegroundAppLayout;
}

- (void)setAllowCameraInMultipleForegroundAppLayout:(BOOL)a3
{
  self->_allowCameraInMultipleForegroundAppLayout = a3;
}

- (BOOL)disableOcclusionForPersonSegmentation
{
  return self->_disableOcclusionForPersonSegmentation;
}

- (void)setDisableOcclusionForPersonSegmentation:(BOOL)a3
{
  self->_disableOcclusionForPersonSegmentation = a3;
}

- (BOOL)disableMLRelocalization
{
  return self->_disableMLRelocalization;
}

- (void)setDisableMLRelocalization:(BOOL)a3
{
  self->_disableMLRelocalization = a3;
}

- (NSString)timeOfFlightProjectorMode
{
  return self->_timeOfFlightProjectorMode;
}

- (int64_t)depthSensorNumberOfPointsMode
{
  return self->_depthSensorNumberOfPointsMode;
}

- (int64_t)maxUltrawideImageForwardingFrameRate
{
  return self->_maxUltrawideImageForwardingFrameRate;
}

- (void)setMaxUltrawideImageForwardingFrameRate:(int64_t)a3
{
  self->_maxUltrawideImageForwardingFrameRate = a3;
}

- (BOOL)disableRenderSyncScheduling
{
  return self->_disableRenderSyncScheduling;
}

- (void)setDisableRenderSyncScheduling:(BOOL)a3
{
  self->_disableRenderSyncScheduling = a3;
}

- (BOOL)dropInitialFramesOutsideExposureTarget
{
  return self->_dropInitialFramesOutsideExposureTarget;
}

- (void)setDropInitialFramesOutsideExposureTarget:(BOOL)a3
{
  self->_dropInitialFramesOutsideExposureTarget = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeOfFlightProjectorMode, 0);
  objc_storeStrong((id *)&self->_customSensors, 0);
  objc_storeStrong((id *)&self->_videoFormat, 0);
}

@end