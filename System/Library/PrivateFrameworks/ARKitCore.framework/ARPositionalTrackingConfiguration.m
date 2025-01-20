@interface ARPositionalTrackingConfiguration
+ (BOOL)isSupported;
+ (id)_querySupportedVideoFormats;
+ (id)supportedVideoFormats;
- (ARPlaneDetection)planeDetection;
- (ARPositionalTrackingConfiguration)init;
- (ARWorldMap)initialWorldMap;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRelocalizationEnabled;
- (BOOL)isVIOFusionEnabled;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageSensorSettings;
- (id)worldTrackingOptions;
- (void)createTechniques:(id)a3;
- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap;
- (void)setPlaneDetection:(ARPlaneDetection)planeDetection;
- (void)setRelocalizationEnabled:(BOOL)a3;
- (void)setVioFusionEnabled:(BOOL)a3;
@end

@implementation ARPositionalTrackingConfiguration

+ (BOOL)isSupported
{
  return +[ARWorldTrackingConfiguration isSupported];
}

- (ARPositionalTrackingConfiguration)init
{
  v5.receiver = self;
  v5.super_class = (Class)ARPositionalTrackingConfiguration;
  v2 = [(ARConfiguration *)&v5 initPrivate];
  v3 = v2;
  if (v2)
  {
    [(ARConfiguration *)v2 setLightEstimationEnabled:0];
    [(ARConfiguration *)v3 setAutoFocusEnabled:1];
    v3->_relocalizationEnabled = 1;
  }
  return v3;
}

+ (id)supportedVideoFormats
{
  if ([a1 isSupported])
  {
    if (supportedVideoFormats_supportedFormats_0
      && ![(id)supportedVideoFormats_supportedFormats_0 count])
    {
      uint64_t v3 = [a1 _querySupportedVideoFormats];
      v4 = (void *)supportedVideoFormats_supportedFormats_0;
      supportedVideoFormats_supportedFormats_0 = v3;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__ARPositionalTrackingConfiguration_supportedVideoFormats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormats_onceToken_1 != -1) {
      dispatch_once(&supportedVideoFormats_onceToken_1, block);
    }
    id v5 = (id)supportedVideoFormats_supportedFormats_0;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __58__ARPositionalTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormats];
  v2 = (void *)supportedVideoFormats_supportedFormats_0;
  supportedVideoFormats_supportedFormats_0 = v1;
}

+ (id)_querySupportedVideoFormats
{
  v43[2] = *MEMORY[0x1E4F143B8];
  id v3 = (id)*MEMORY[0x1E4F15830];
  if (ARDeviceSupportsUltraWideCamera())
  {
    id v4 = (id)*MEMORY[0x1E4F15828];

    id v3 = v4;
  }
  BOOL v5 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.back.wide.videoBinned"];
  v6 = +[ARKitUserDefaults resolutionDictionaryForKey:@"com.apple.arkit.imagesensor.back.wide.resolution"];
  if (v6 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v7 = v6;
    v8 = [v7 objectForKeyedSubscript:@"width"];
    uint64_t v9 = [v7 objectForKeyedSubscript:@"height"];
    v10 = (void *)v9;
    if (v8) {
      BOOL v11 = v9 == 0;
    }
    else {
      BOOL v11 = 1;
    }
    if (v11)
    {
      uint64_t v12 = 480;
      unsigned int v13 = 640;
    }
    else
    {
      unsigned int v13 = [v8 intValue];
      uint64_t v12 = [v10 intValue];
      if (_ARLogSensor_onceToken_8 != -1) {
        dispatch_once(&_ARLogSensor_onceToken_8, &__block_literal_global_44);
      }
      v14 = (void *)_ARLogSensor_logObj_8;
      if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_8, OS_LOG_TYPE_DEFAULT))
      {
        v15 = v14;
        v16 = (objc_class *)objc_opt_class();
        v35 = NSStringFromClass(v16);
        *(_DWORD *)buf = 138544130;
        v39 = v35;
        __int16 v40 = 2048;
        id v41 = a1;
        __int16 v42 = 1024;
        LODWORD(v43[0]) = v13;
        WORD2(v43[0]) = 1024;
        *(_DWORD *)((char *)v43 + 6) = v12;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution set to %i, %i by user defaults", buf, 0x22u);
      }
    }
  }
  else
  {
    uint64_t v12 = 480;
    unsigned int v13 = 640;
  }
  v17 = +[ARVideoFormat bestVideoFormatForDevicePosition:1 deviceType:v3 resolution:v13 | (unint64_t)(v12 << 32) frameRate:v5 videoBinned:10.0];
  v18 = v17;
  if (v17)
  {
    [v17 imageResolution];
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v37 = v18;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v37 count:1];
      v20 = v18;
      goto LABEL_34;
    }
    v21 = _ARLogGeneral_16();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      v22 = (objc_class *)objc_opt_class();
      v23 = NSStringFromClass(v22);
      *(_DWORD *)buf = 138543874;
      v39 = v23;
      __int16 v40 = 2048;
      id v41 = a1;
      __int16 v42 = 2114;
      v43[0] = v18;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);
    }
  }
  v20 = +[ARVideoFormat bestVideoFormatForDevicePosition:1 deviceType:v3 resolution:0x2D000000500 frameRate:v5 videoBinned:10.0];

  if (v20)
  {
    [v20 imageResolution];
    BOOL v24 = +[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3);
    v25 = _ARLogGeneral_16();
    BOOL v26 = os_log_type_enabled(v25, OS_LOG_TYPE_INFO);
    if (v24)
    {
      if (v26)
      {
        v27 = (objc_class *)objc_opt_class();
        v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138543618;
        v39 = v28;
        __int16 v40 = 2048;
        id v41 = a1;
        _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Falling back to 1280x720 for positional tracking configuration", buf, 0x16u);
      }
      v36 = v20;
      v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v36 count:1];
      goto LABEL_34;
    }
    if (v26)
    {
      v29 = (objc_class *)objc_opt_class();
      v30 = NSStringFromClass(v29);
      *(_DWORD *)buf = 138543874;
      v39 = v30;
      __int16 v40 = 2048;
      id v41 = a1;
      __int16 v42 = 2114;
      v43[0] = v20;
      _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);
    }
  }
  v31 = _ARLogGeneral_16();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    v32 = (objc_class *)objc_opt_class();
    v33 = NSStringFromClass(v32);
    *(_DWORD *)buf = 138543618;
    v39 = v33;
    __int16 v40 = 2048;
    id v41 = a1;
    _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Video format not found for positional tracking configuration", buf, 0x16u);
  }
  v19 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_34:

  return v19;
}

- (id)imageSensorSettings
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)ARPositionalTrackingConfiguration;
  id v3 = [(ARConfiguration *)&v11 imageSensorSettings];
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.visionData"])
  {
    uint64_t v4 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.simulateHWFeatureDetection"] ^ 1;
  }
  else
  {
    uint64_t v4 = 0;
  }
  [v3 setVisionDataOutputEnabled:v4];
  if ([v3 visionDataOutputEnabled])
  {
    BOOL v5 = [(ARPositionalTrackingConfiguration *)self worldTrackingOptions];
    [v5 setImageSensorSettings:v3];
    v6 = ARVisionDataParametersForWorldTrackingOptions(v5);
    if (v6)
    {
      [v3 setVisionDataOutputParameters:v6];
    }
    else
    {
      id v7 = _ARLogGeneral_16();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = (objc_class *)objc_opt_class();
        uint64_t v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543618;
        unsigned int v13 = v9;
        __int16 v14 = 2048;
        v15 = self;
        _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error reading vision data output parameters.", buf, 0x16u);
      }
    }
  }
  return v3;
}

- (id)worldTrackingOptions
{
  id v3 = objc_opt_new();
  uint64_t v4 = [(ARConfiguration *)self deviceModel];
  [v3 setDeviceModel:v4];

  objc_msgSend(v3, "setRelocalizationEnabled:", -[ARPositionalTrackingConfiguration isRelocalizationEnabled](self, "isRelocalizationEnabled"));
  objc_msgSend(v3, "setPlaneDetection:", -[ARPositionalTrackingConfiguration planeDetection](self, "planeDetection"));
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.mlOnANEDevices"])
  {
    uint64_t v5 = ARAppleNeuralEngine();
  }
  else
  {
    uint64_t v5 = 0;
  }
  [v3 setMlModelEnabled:v5];
  v6 = [(ARPositionalTrackingConfiguration *)self initialWorldMap];
  [v3 setInitialWorldMap:v6];

  id v7 = [(ARConfiguration *)self replaySensor];
  v8 = v7;
  if (v7 && [v7 replayMode]) {
    [v3 setDeterministicMode:1];
  }
  if (self->_vioFusionEnabled) {
    [v3 setSlamConfiguration:@"CoreLocationIntegration"];
  }
  [v3 setPlaneEstimationShouldUseJasperData:0];

  return v3;
}

- (void)createTechniques:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ARPositionalTrackingConfiguration *)self worldTrackingOptions];
  v6 = [(ARPositionalTrackingConfiguration *)self imageSensorSettings];
  [v5 setImageSensorSettings:v6];

  if ([v5 planeDetection])
  {
    BOOL v7 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.accuratePlaneExtentCheck"];
    v8 = _ARLogGeneral_16();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = (objc_class *)objc_opt_class();
      v10 = NSStringFromClass(v9);
      objc_super v11 = @"disabled";
      *(_DWORD *)buf = 138543874;
      v22 = v10;
      if (v7) {
        objc_super v11 = @"enabled";
      }
      __int16 v23 = 2048;
      BOOL v24 = self;
      __int16 v25 = 2114;
      BOOL v26 = v11;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);
    }
    if (v7) {
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x200);
    }
  }
  uint64_t v12 = [[ARWorldTrackingTechnique alloc] initWithOptions:v5];
  if (v12)
  {
    unsigned int v13 = [ARParentTechnique alloc];
    v20 = v12;
    __int16 v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    v15 = [(ARParentTechnique *)v13 initWithParallelTechniques:v14];

    [v4 addObject:v15];
    uint64_t v16 = [(ARWorldTrackingTechnique *)v12 options];
    uint64_t v17 = [v16 planeDetection];

    if (v17)
    {
      v18 = [[ARPlaneEstimationTechnique alloc] initWithTrackingTechnique:v12];
      [v4 addObject:v18];
    }
    v19.receiver = self;
    v19.super_class = (Class)ARPositionalTrackingConfiguration;
    [(ARConfiguration *)&v19 createTechniques:v4];
    if ([(ARPositionalTrackingConfiguration *)self planeDetection]) {
      ARAddNonJasperSemanticsToParent(v15, v4, [(ARConfiguration *)self maxUltrawideImageForwardingFrameRate], 0);
    }
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ARPositionalTrackingConfiguration;
  if ([(ARConfiguration *)&v12 isEqual:v4])
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    if (self->_planeDetection == *((void *)v5 + 15))
    {
      v6 = [(ARPositionalTrackingConfiguration *)self initialWorldMap];
      BOOL v7 = [v5 initialWorldMap];
      if (v6 == v7)
      {
        BOOL v10 = self->_relocalizationEnabled == v5[112] && self->_vioFusionEnabled == v5[113];
      }
      else
      {
        v8 = [(ARPositionalTrackingConfiguration *)self initialWorldMap];
        uint64_t v9 = [v5 initialWorldMap];
        BOOL v10 = ([v8 isEqual:v9] & 1) != 0
           && self->_relocalizationEnabled == v5[112]
           && self->_vioFusionEnabled == v5[113];
      }
    }
    else
    {
      BOOL v10 = 0;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)ARPositionalTrackingConfiguration;
  id v4 = [(ARConfiguration *)&v7 copyWithZone:a3];
  v4[15] = self->_planeDetection;
  uint64_t v5 = [(ARPositionalTrackingConfiguration *)self initialWorldMap];
  [v4 setInitialWorldMap:v5];

  *((unsigned char *)v4 + 112) = self->_relocalizationEnabled;
  *((unsigned char *)v4 + 113) = self->_vioFusionEnabled;
  return v4;
}

- (id)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  BOOL v7 = [(ARConfiguration *)self isAutoFocusEnabled];
  v8 = @"Disabled";
  if (v7) {
    v8 = @"Enabled";
  }
  [v6 appendFormat:@" autoFocus=%@", v8];
  uint64_t v9 = NSStringFromARPlaneDetection(self->_planeDetection);
  [v6 appendFormat:@" planeDetection=%@", v9];

  BOOL v10 = [(ARPositionalTrackingConfiguration *)self initialWorldMap];

  if (v10)
  {
    objc_super v11 = [(ARPositionalTrackingConfiguration *)self initialWorldMap];
    [v6 appendFormat:@" initialWorldMap=%@", v11];
  }
  objc_super v12 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v12];

  [v6 appendString:@">"];
  return v6;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap
{
}

- (BOOL)isRelocalizationEnabled
{
  return self->_relocalizationEnabled;
}

- (void)setRelocalizationEnabled:(BOOL)a3
{
  self->_relocalizationEnabled = a3;
}

- (BOOL)isVIOFusionEnabled
{
  return self->_vioFusionEnabled;
}

- (void)setVioFusionEnabled:(BOOL)a3
{
  self->_vioFusionEnabled = a3;
}

- (void).cxx_destruct
{
}

@end