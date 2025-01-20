@interface ARBodyTrackingConfiguration
+ (BOOL)allowsParallelPersonOcclusion;
+ (BOOL)allowsParallelSceneDepth;
+ (BOOL)isSupported;
+ (BOOL)supportsAppClipCodeTracking;
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
+ (BOOL)supportsUserFaceTracking;
+ (id)_querySupportedVideoFormatsForUltraWide;
+ (id)recommendedVideoFormatFor4KResolution;
+ (id)recommendedVideoFormatForHighResolutionFrameCapturing;
+ (id)supportedVideoFormats;
+ (id)supportedVideoFormatsForUltraWide;
+ (void)setAllowsParallelPersonOcclusion:(BOOL)a3;
+ (void)setAllowsParallelSceneDepth:(BOOL)a3;
- (ARBodyTrackingConfiguration)init;
- (AREnvironmentTexturing)environmentTexturing;
- (ARImageSensorSettings)imageSensorSettingsForUltraWide;
- (ARPlaneDetection)planeDetection;
- (ARWorldMap)initialWorldMap;
- (BOOL)alwaysUsePrimaryCameraForTracking;
- (BOOL)appClipCodeTrackingEnabled;
- (BOOL)automaticImageScaleEstimationEnabled;
- (BOOL)automaticSkeletonScaleEstimationEnabled;
- (BOOL)ignoreAppClipCodeURLLimitation;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowQosSchedulingEnabled;
- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3;
- (BOOL)shouldUseUltraWide;
- (BOOL)wantsHDREnvironmentTextures;
- (NSInteger)maximumNumberOfTrackedImages;
- (NSSet)detectionImages;
- (id)_trackingOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageSensorSettings;
- (id)imageSensorSettingsForUserFaceTracking;
- (id)parentImageSensorSettings;
- (void)createTechniques:(id)a3;
- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3;
- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled;
- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled;
- (void)setAutomaticSkeletonScaleEstimationEnabled:(BOOL)automaticSkeletonScaleEstimationEnabled;
- (void)setDetectionImages:(NSSet *)detectionImages;
- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing;
- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3;
- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap;
- (void)setLowQosSchedulingEnabled:(BOOL)a3;
- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages;
- (void)setPlaneDetection:(ARPlaneDetection)planeDetection;
- (void)setVideoFormat:(id)a3;
- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures;
@end

@implementation ARBodyTrackingConfiguration

+ (BOOL)isSupported
{
  int v2 = +[ARWorldTrackingConfiguration isSupported];
  if (v2)
  {
    LOBYTE(v2) = ARAppleNeuralEngine();
  }
  return v2;
}

+ (id)supportedVideoFormats
{
  if ([a1 isSupported])
  {
    int v2 = +[ARWorldTrackingConfiguration supportedVideoFormats];
  }
  else
  {
    int v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v2;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatFor4KResolution];
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  return +[ARWorldTrackingConfiguration recommendedVideoFormatForHighResolutionFrameCapturing];
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  if ([a1 allowsParallelPersonOcclusion]) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = 3;
  }
  int v6 = [a1 allowsParallelSceneDepth];
  uint64_t v7 = v5 | 0x18;
  if (v6) {
    uint64_t v7 = v5;
  }
  if (v7 & a3) == 0 && (ARAppleNeuralEngine()) {
    return 1;
  }
  v9.receiver = a1;
  v9.super_class = (Class)&OBJC_METACLASS___ARBodyTrackingConfiguration;
  return objc_msgSendSuper2(&v9, sel_supportsFrameSemantics_, a3);
}

- (ARBodyTrackingConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)ARBodyTrackingConfiguration;
  int v2 = [(ARConfiguration *)&v6 initPrivate];
  v3 = v2;
  if (v2)
  {
    [(ARConfiguration *)v2 setAutoFocusEnabled:1];
    [(ARBodyTrackingConfiguration *)v3 setMaximumNumberOfTrackedImages:0];
    v4 = objc_opt_new();
    [(ARBodyTrackingConfiguration *)v3 setDetectionImages:v4];

    [(ARBodyTrackingConfiguration *)v3 setWantsHDREnvironmentTextures:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.environmentTexturing.wantsHDR"]];
    [(ARBodyTrackingConfiguration *)v3 setLowQosSchedulingEnabled:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.enableLowQosScheduling"]];
    if ([(id)objc_opt_class() supportsFrameSemantics:4]) {
      [(ARConfiguration *)v3 setFrameSemantics:4];
    }
    [(ARBodyTrackingConfiguration *)v3 setAutomaticSkeletonScaleEstimationEnabled:0];
    v3->_alwaysUsePrimaryCameraForTracking = 0;
    v3->_ignoreAppClipCodeURLLimitation = 0;
    v3->_appClipCodeTrackingEnabled = 0;
  }
  return v3;
}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:maximumNumberOfTrackedImages];
}

- (id)imageSensorSettings
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)ARBodyTrackingConfiguration;
  v3 = [(ARConfiguration *)&v15 imageSensorSettings];
  objc_msgSend(v3, "setVisionDataOutputEnabled:", -[ARBodyTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v3));
  if ([v3 visionDataOutputEnabled])
  {
    v4 = [(ARBodyTrackingConfiguration *)self _trackingOptions];
    [v4 setImageSensorSettings:v3];
    uint64_t v5 = [(ARBodyTrackingConfiguration *)self imageSensorSettingsForUltraWide];
    [v4 setImageSensorSettingsForUltraWide:v5];

    objc_super v6 = ARVisionDataParametersForWorldTrackingOptions(v4);
    if (v6)
    {
      [v3 setVisionDataOutputParameters:v6];
      uint64_t v7 = _ARLogGeneral_27();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v8 = (objc_class *)objc_opt_class();
        objc_super v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543874;
        v17 = v9;
        __int16 v18 = 2048;
        v19 = self;
        __int16 v20 = 2114;
        v21 = v6;
        v10 = "%{public}@ <%p>: Setting vision data output parameters for wide: %{public}@";
        v11 = v7;
        uint32_t v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
      }
    }
    else
    {
      uint64_t v7 = _ARLogGeneral_27();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        objc_super v9 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        v17 = v9;
        __int16 v18 = 2048;
        v19 = self;
        v10 = "%{public}@ <%p>: Did not receive vision data output parameters for wide.";
        v11 = v7;
        uint32_t v12 = 22;
        goto LABEL_7;
      }
    }
  }
  return v3;
}

- (id)_trackingOptions
{
  v3 = objc_alloc_init(ARWorldTrackingOptions);
  v4 = [(ARConfiguration *)self deviceModel];
  [(ARWorldTrackingOptions *)v3 setDeviceModel:v4];

  [(ARWorldTrackingOptions *)v3 setPlaneDetection:[(ARBodyTrackingConfiguration *)self planeDetection]];
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.mlOnANEDevices"])
  {
    uint64_t v5 = ARAppleNeuralEngine();
  }
  else
  {
    uint64_t v5 = 0;
  }
  [(ARWorldTrackingOptions *)v3 setMlModelEnabled:v5];
  objc_super v6 = [(ARBodyTrackingConfiguration *)self initialWorldMap];
  [(ARWorldTrackingOptions *)v3 setInitialWorldMap:v6];

  [(ARWorldTrackingOptions *)v3 setLowQosSchedulingEnabled:[(ARBodyTrackingConfiguration *)self isLowQosSchedulingEnabled]];
  uint64_t v7 = [(ARConfiguration *)self replaySensor];
  v8 = v7;
  if (v7 && [v7 replayMode]) {
    [(ARWorldTrackingOptions *)v3 setDeterministicMode:1];
  }
  [(ARWorldTrackingOptions *)v3 setAlwaysUsePrimaryCameraForTracking:[(ARBodyTrackingConfiguration *)self alwaysUsePrimaryCameraForTracking]];
  [(ARWorldTrackingOptions *)v3 setDisableMLRelocalization:[(ARConfiguration *)self disableMLRelocalization]];

  return v3;
}

- (void)setVideoFormat:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARBodyTrackingConfiguration;
  [(ARConfiguration *)&v6 setVideoFormat:v4];
  if ([v4 has4KVideoResolution]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v4 isX420PixelFormat];
  }
  [(ARBodyTrackingConfiguration *)self setAlwaysUsePrimaryCameraForTracking:v5];
}

- (void)createTechniques:(id)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(ARBodyTrackingConfiguration *)self _trackingOptions];
  objc_super v6 = [(ARBodyTrackingConfiguration *)self imageSensorSettings];
  [v5 setImageSensorSettings:v6];

  uint64_t v7 = [(ARBodyTrackingConfiguration *)self imageSensorSettingsForUltraWide];
  [v5 setImageSensorSettingsForUltraWide:v7];

  if ([(ARBodyTrackingConfiguration *)self environmentTexturing]) {
    objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x80);
  }
  v8 = [(ARConfiguration *)self replaySensor];
  objc_super v9 = v8;
  if (v8 && [v8 replayMode]) {
    [v5 setDeterministicMode:1];
  }
  if ([v5 planeDetection])
  {
    BOOL v10 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.accuratePlaneExtentCheck"];
    v11 = _ARLogGeneral_27();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint32_t v12 = (objc_class *)objc_opt_class();
      v13 = NSStringFromClass(v12);
      v14 = @"disabled";
      *(_DWORD *)buf = 138543874;
      v71 = v13;
      if (v10) {
        v14 = @"enabled";
      }
      __int16 v72 = 2048;
      v73 = self;
      __int16 v74 = 2114;
      v75 = v14;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);
    }
    if (v10) {
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v5, "planeDetection") | 0x200);
    }
  }
  objc_super v15 = [[ARWorldTrackingTechnique alloc] initWithOptions:v5];
  if (v15)
  {
    v16 = [MEMORY[0x1E4F1CA48] array];
    [v16 addObject:v15];
    v17 = [(ARBodyTrackingConfiguration *)self detectionImages];
    uint64_t v18 = [v17 count];

    if (v18)
    {
      v19 = [ARImageDetectionTechnique alloc];
      __int16 v20 = [(ARBodyTrackingConfiguration *)self detectionImages];
      v21 = [v20 allObjects];
      uint64_t v22 = [(ARImageDetectionTechnique *)v19 initWithReferenceImages:v21 maximumNumberOfTrackedImages:[(ARBodyTrackingConfiguration *)self maximumNumberOfTrackedImages]];

      [(ARImageDetectionTechnique *)v22 setEnableAutomaticImageScaleEstimation:[(ARBodyTrackingConfiguration *)self automaticImageScaleEstimationEnabled]];
      [v16 addObject:v22];
    }
    if ([(ARBodyTrackingConfiguration *)self appClipCodeTrackingEnabled])
    {
      v23 = [[ARAppClipCodeTechnique alloc] initWithIgnoreURLLimitation:[(ARBodyTrackingConfiguration *)self ignoreAppClipCodeURLLimitation]];
      [v16 addObject:v23];
    }
    v24 = [(ARWorldTrackingTechnique *)v15 options];
    uint64_t v25 = [v24 planeDetection];

    if (v25)
    {
      v26 = [[ARPlaneEstimationTechnique alloc] initWithTrackingTechnique:v15];
      [v4 addObject:v26];
    }
    if ([(ARBodyTrackingConfiguration *)self environmentTexturing])
    {
      v27 = [[AREnvironmentTexturingTechnique alloc] initWithOptions:[(ARBodyTrackingConfiguration *)self environmentTexturing] wantsHDREnvironmentTextures:self->_wantsHDREnvironmentTextures];
      [v4 addObject:v27];
    }
    v28 = [[ARParentTechnique alloc] initWithParallelTechniques:v16];
    [v4 insertObject:v28 atIndex:0];
    v67.receiver = self;
    v67.super_class = (Class)ARBodyTrackingConfiguration;
    [(ARConfiguration *)&v67 createTechniques:v4];
    if ([(ARBodyTrackingConfiguration *)self planeDetection])
    {
      v29 = [(ARBodyTrackingConfiguration *)self _trackingOptions];
      int v30 = [v29 mlModelEnabled];

      if (v30)
      {
        int v31 = ARDeviceSupportsJasper();
        uint64_t v32 = [(ARConfiguration *)self maxUltrawideImageForwardingFrameRate];
        if (v31) {
          ARAddJasperTechniquesToParent(v28, v4, 1, 0, v32);
        }
        else {
          ARAddNonJasperSemanticsToParent(v28, v4, v32, 1);
        }
      }
    }
    if (([(ARConfiguration *)self frameSemantics] & 4) != 0)
    {
      v61 = v28;
      v33 = +[ARParentTechnique parentTechniqueOfClass:objc_opt_class() inArray:v4];
      v34 = (void *)MEMORY[0x1E4F1CA48];
      v35 = [v33 techniques];
      v36 = [v34 arrayWithArray:v35];

      uint64_t v37 = objc_opt_new();
      v38 = objc_opt_new();
      objc_msgSend(v38, "setAutomaticSkeletonScaleEstimationEnabled:", -[ARBodyTrackingConfiguration automaticSkeletonScaleEstimationEnabled](self, "automaticSkeletonScaleEstimationEnabled"));
      v39 = objc_opt_new();
      v62 = (void *)v37;
      [v36 addObject:v37];
      v63 = v36;
      v64 = v33;
      [v33 setTechniques:v36];
      [v4 addObject:v38];
      [v4 addObject:v39];
      v40 = (void *)MEMORY[0x1E4F1CAD0];
      v69[0] = objc_opt_class();
      v69[1] = objc_opt_class();
      v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:v69 count:2];
      uint64_t v42 = [v40 setWithArray:v41];

      v60 = (void *)v42;
      v43 = [[ARSplitTechniqueSynchronizerTechnique alloc] initWithSynchronizedResultDataClasses:v42];
      objc_msgSend(v4, "insertObject:atIndex:", v43, objc_msgSend(v4, "indexOfObjectPassingTest:", &__block_literal_global_70));
      v44 = objc_opt_new();
      [v44 setDelegate:v43];
      v68 = v44;
      v45 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v68 count:1];
      v59 = v39;
      [v39 setSplitTechniques:v45];

      if (ARDeviceSupportsJasper())
      {
        id v46 = objc_alloc(MEMORY[0x1E4F1CAD0]);
        uint64_t v47 = objc_opt_class();
        v48 = objc_msgSend(v46, "initWithObjects:", v47, objc_opt_class(), 0);
        v49 = (void *)MEMORY[0x1E4F28F60];
        v65[0] = MEMORY[0x1E4F143A8];
        v65[1] = 3221225472;
        v65[2] = __48__ARBodyTrackingConfiguration_createTechniques___block_invoke_2;
        v65[3] = &unk_1E6187300;
        id v58 = v48;
        id v66 = v58;
        v50 = [v49 predicateWithBlock:v65];
        v51 = +[ARTechnique techniqueMatchingPredicate:v50 inArray:v4];

        if (!v51)
        {
          v56 = +[ARParentTechnique parentTechniqueOfClass:objc_opt_class() inArray:v4];
          v57 = objc_opt_new();
          v52 = [v56 splitTechniques];
          v53 = [v52 arrayByAddingObject:v57];
          [v56 setSplitTechniques:v53];

          v54 = [[ARFrameRateLimitingStrategy alloc] initWithFrameRate:10];
          [v56 setSplitTechniqueFowardingStrategy:v54];

          v55 = [[ARSplitTechniqueSynchronizerTechnique alloc] initWithSynchronizedResultDataClasses:v58];
          [v57 setDelegate:v55];
          [v4 insertObject:v55 atIndex:0];

          v51 = 0;
        }
      }
      v28 = v61;
    }
  }
}

BOOL __48__ARBodyTrackingConfiguration_createTechniques___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    id v4 = [v3 techniqueOfClass:objc_opt_class()];
  }
  else
  {
    id v4 = [v2 techniqueOfClass:objc_opt_class()];
  }

  return v4 != 0;
}

uint64_t __48__ARBodyTrackingConfiguration_createTechniques___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = *(void **)(a1 + 32);
    uint64_t v5 = [v3 synchronizedResultDataClasses];
    uint64_t v6 = [v4 isSubsetOfSet:v5];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

+ (void)setAllowsParallelPersonOcclusion:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (s_allowsParallelPersonOcclusion != a3)
  {
    BOOL v3 = a3;
    s_allowsParallelPersonOcclusion = a3;
    uint64_t v5 = _ARLogGeneral_27();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138543874;
      objc_super v9 = v7;
      __int16 v10 = 2048;
      id v11 = a1;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting parallel person occlusion to '%d'", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

+ (BOOL)allowsParallelPersonOcclusion
{
  return s_allowsParallelPersonOcclusion;
}

+ (void)setAllowsParallelSceneDepth:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (s_allowsParallelSceneDepth != a3)
  {
    BOOL v3 = a3;
    s_allowsParallelSceneDepth = a3;
    uint64_t v5 = _ARLogGeneral_27();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = (objc_class *)objc_opt_class();
      uint64_t v7 = NSStringFromClass(v6);
      int v8 = 138543874;
      objc_super v9 = v7;
      __int16 v10 = 2048;
      id v11 = a1;
      __int16 v12 = 1024;
      BOOL v13 = v3;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting parallel scene depth to '%d'", (uint8_t *)&v8, 0x1Cu);
    }
  }
}

+ (BOOL)allowsParallelSceneDepth
{
  return s_allowsParallelSceneDepth;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ARBodyTrackingConfiguration;
  if ([(ARConfiguration *)&v18 isEqual:v4])
  {
    uint64_t v5 = (unsigned __int8 *)v4;
    uint64_t v6 = v5;
    if (self->_planeDetection == *((void *)v5 + 17)
      && self->_environmentTexturing == *((void *)v5 + 16)
      && self->_wantsHDREnvironmentTextures == v5[112])
    {
      initialWorldMap = self->_initialWorldMap;
      int v8 = [v5 initialWorldMap];
      if (initialWorldMap == v8 || [(ARWorldMap *)self->_initialWorldMap isEqual:*((void *)v6 + 15)])
      {
        detectionImages = self->_detectionImages;
        __int16 v10 = [v6 detectionImages];
        if ((detectionImages == v10
           || [(NSSet *)self->_detectionImages isEqual:*((void *)v6 + 18)])
          && self->_maximumNumberOfTrackedImages == *((void *)v6 + 19)
          && (int automaticImageScaleEstimationEnabled = self->_automaticImageScaleEstimationEnabled,
              automaticImageScaleEstimationEnabled == [v6 automaticImageScaleEstimationEnabled])&& (int automaticSkeletonScaleEstimationEnabled = self->_automaticSkeletonScaleEstimationEnabled, automaticSkeletonScaleEstimationEnabled == objc_msgSend(v6, "automaticSkeletonScaleEstimationEnabled"))&& self->_lowQosSchedulingEnabled == v6[118]&& (alwaysUsePrimaryCameraForTracking = self->_alwaysUsePrimaryCameraForTracking, alwaysUsePrimaryCameraForTracking == objc_msgSend(v6, "alwaysUsePrimaryCameraForTracking"))&& (ignoreAppClipCodeURLLimitation = self->_ignoreAppClipCodeURLLimitation, ignoreAppClipCodeURLLimitation == objc_msgSend(v6, "ignoreAppClipCodeURLLimitation")))
        {
          int appClipCodeTrackingEnabled = self->_appClipCodeTrackingEnabled;
          BOOL v16 = appClipCodeTrackingEnabled == [v6 appClipCodeTrackingEnabled];
        }
        else
        {
          BOOL v16 = 0;
        }
      }
      else
      {
        BOOL v16 = 0;
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ARBodyTrackingConfiguration;
  id v5 = -[ARConfiguration copyWithZone:](&v9, sel_copyWithZone_);
  *((void *)v5 + 17) = self->_planeDetection;
  *((void *)v5 + 16) = self->_environmentTexturing;
  *((unsigned char *)v5 + 112) = self->_wantsHDREnvironmentTextures;
  objc_storeStrong((id *)v5 + 15, self->_initialWorldMap);
  uint64_t v6 = [(NSSet *)self->_detectionImages copyWithZone:a3];
  uint64_t v7 = (void *)*((void *)v5 + 18);
  *((void *)v5 + 18) = v6;

  *((void *)v5 + 19) = self->_maximumNumberOfTrackedImages;
  *((unsigned char *)v5 + 113) = self->_automaticImageScaleEstimationEnabled;
  *((unsigned char *)v5 + 114) = self->_automaticSkeletonScaleEstimationEnabled;
  *((unsigned char *)v5 + 118) = self->_lowQosSchedulingEnabled;
  *((unsigned char *)v5 + 117) = self->_alwaysUsePrimaryCameraForTracking;
  *((unsigned char *)v5 + 116) = self->_ignoreAppClipCodeURLLimitation;
  *((unsigned char *)v5 + 115) = self->_appClipCodeTrackingEnabled;
  return v5;
}

- (id)description
{
  BOOL v3 = (void *)MEMORY[0x1E4F28E78];
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v7];

  if ([(ARConfiguration *)self isAutoFocusEnabled]) {
    int v8 = @"Enabled";
  }
  else {
    int v8 = @"Disabled";
  }
  [v6 appendFormat:@" autoFocus=%@", v8];
  objc_super v9 = NSStringFromAREnvironmentTexturing(self->_environmentTexturing);
  [v6 appendFormat:@" environmentTexturing=%@", v9];

  if ([(ARBodyTrackingConfiguration *)self wantsHDREnvironmentTextures]) {
    __int16 v10 = @"Enabled";
  }
  else {
    __int16 v10 = @"Disabled";
  }
  [v6 appendFormat:@" wantsHDREnvironmentTextures=%@", v10];
  id v11 = NSStringFromARPlaneDetection(self->_planeDetection);
  [v6 appendFormat:@" planeDetection=%@", v11];

  __int16 v12 = [(ARBodyTrackingConfiguration *)self initialWorldMap];

  if (v12)
  {
    BOOL v13 = [(ARBodyTrackingConfiguration *)self initialWorldMap];
    [v6 appendFormat:@" initialWorldMap=%@", v13];
  }
  uint64_t v14 = [(ARBodyTrackingConfiguration *)self detectionImages];
  uint64_t v15 = [v14 count];

  if (v15)
  {
    objc_msgSend(v6, "appendFormat:", @" maximumNumberOfTrackedImages=%ld", -[ARBodyTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
    if ([(ARBodyTrackingConfiguration *)self automaticImageScaleEstimationEnabled])
    {
      BOOL v16 = @"Enabled";
    }
    else
    {
      BOOL v16 = @"Disabled";
    }
    [v6 appendFormat:@" automaticImageScaleEstimation=%@", v16];
    v17 = [(ARBodyTrackingConfiguration *)self detectionImages];
    uint64_t v18 = [v17 count];
    v19 = [(ARBodyTrackingConfiguration *)self detectionImages];
    __int16 v20 = [v19 allObjects];
    v21 = objc_msgSend(v20, "ar_map:", &__block_literal_global_80_0);
    uint64_t v22 = [v21 componentsJoinedByString:@", "];
    [v6 appendFormat:@" detectionImages=[count: %ld, %@]", v18, v22];
  }
  if ([(ARBodyTrackingConfiguration *)self automaticSkeletonScaleEstimationEnabled])
  {
    v23 = @"Enabled";
  }
  else
  {
    v23 = @"Disabled";
  }
  [v6 appendFormat:@" automaticSkeletonScaleEstimation=%@", v23];
  if ([(ARBodyTrackingConfiguration *)self appClipCodeTrackingEnabled]) {
    v24 = @"Enabled";
  }
  else {
    v24 = @"Disabled";
  }
  [v6 appendFormat:@" appClipCodeTracking=%@", v24];
  [v6 appendString:@">"];
  return v6;
}

uint64_t __42__ARBodyTrackingConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortDebugDescription];
}

+ (BOOL)supportsUserFaceTracking
{
  return 0;
}

+ (BOOL)supportsAppClipCodeTracking
{
  if (ARAppleNeuralEngine()) {
    return 1;
  }
  return +[ARAppClipCodeTechnique shouldRunCameraOrScannerPerformanceTestingMode];
}

- (BOOL)appClipCodeTrackingEnabled
{
  if (!self->_appClipCodeTrackingEnabled) {
    return 0;
  }
  id v2 = objc_opt_class();
  return [v2 supportsAppClipCodeTracking];
}

- (id)parentImageSensorSettings
{
  v10.receiver = self;
  v10.super_class = (Class)ARBodyTrackingConfiguration;
  BOOL v3 = [(ARConfiguration *)&v10 parentImageSensorSettings];
  id v4 = [v3 settings];
  id v5 = (void *)[v4 mutableCopy];

  if ([(id)objc_opt_class() supportsUserFaceTracking]
    && !+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.forceDisableFrontCamera"])
  {
    uint64_t v6 = [(ARBodyTrackingConfiguration *)self imageSensorSettingsForUserFaceTracking];
    [v6 setEnabled:0];
    if (v6) {
      [v5 addObject:v6];
    }
  }
  uint64_t v7 = [(ARBodyTrackingConfiguration *)self imageSensorSettingsForUltraWide];
  if (v7) {
    [v5 addObject:v7];
  }
  int v8 = [(ARConfiguration *)self depthSensorSettingsForJasper];
  if (v8) {
    [v5 addObject:v8];
  }
  [v3 setSettings:v5];

  return v3;
}

+ (id)_querySupportedVideoFormatsForUltraWide
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v3 = (id)*MEMORY[0x1E4F15828];
  BOOL v4 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.back.ultrawide.videoBinned"];
  id v5 = +[ARKitUserDefaults resolutionDictionaryForKey:@"com.apple.arkit.imagesensor.back.ultrawide.resolution"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"width"];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"height"];
    objc_super v9 = (void *)v8;
    if (v7) {
      BOOL v10 = v8 == 0;
    }
    else {
      BOOL v10 = 1;
    }
    if (v10)
    {
      uint64_t v12 = 480;
      unsigned int v11 = 640;
    }
    else
    {
      id v34 = a1;
      unsigned int v11 = [v7 intValue];
      uint64_t v12 = [v9 intValue];
      BOOL v13 = _ARLogSensor_6();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v15 = (objc_class *)objc_opt_class();
        v33 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138544386;
        uint64_t v37 = v33;
        __int16 v38 = 2048;
        id v39 = v34;
        __int16 v40 = 2112;
        double v41 = *(double *)&v3;
        __int16 v42 = 1024;
        unsigned int v43 = v11;
        __int16 v44 = 1024;
        int v45 = v12;
        _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution for %@ set to %i, %i by user defaults", buf, 0x2Cu);
      }
      a1 = v34;
    }
  }
  else
  {
    uint64_t v12 = 480;
    unsigned int v11 = 640;
  }
  BOOL v16 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.back.ultrawide.frameRate"];
  v17 = v16;
  if (v16)
  {
    [v16 doubleValue];
    double v19 = v18;
    __int16 v20 = _ARLogSensor_6();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v22;
      __int16 v38 = 2048;
      id v39 = a1;
      __int16 v40 = 2048;
      double v41 = v19;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by user defaults", buf, 0x20u);
    }
  }
  else
  {
    double v19 = 10.0;
  }
  v23 = +[ARVideoFormat bestVideoFormatForDevicePosition:1 deviceType:v3 resolution:v11 | (unint64_t)(v12 << 32) frameRate:v4 videoBinned:v19];
  v24 = v23;
  if (v23)
  {
    [v23 imageResolution];
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      v35 = v24;
      uint64_t v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v35 count:1];
      goto LABEL_28;
    }
    v26 = _ARLogGeneral_27();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (objc_class *)objc_opt_class();
      v28 = NSStringFromClass(v27);
      *(_DWORD *)buf = 138543874;
      uint64_t v37 = v28;
      __int16 v38 = 2048;
      id v39 = a1;
      __int16 v40 = 2114;
      double v41 = *(double *)&v24;
      _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);
    }
  }
  v29 = _ARLogGeneral_27();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
  {
    int v30 = (objc_class *)objc_opt_class();
    int v31 = NSStringFromClass(v30);
    *(_DWORD *)buf = 138543618;
    uint64_t v37 = v31;
    __int16 v38 = 2048;
    id v39 = a1;
    _os_log_impl(&dword_1B88A2000, v29, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Video format not found for using ultra wide in world tracking", buf, 0x16u);
  }
  uint64_t v25 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_28:

  return v25;
}

+ (id)supportedVideoFormatsForUltraWide
{
  if ([a1 isSupported])
  {
    if (supportedVideoFormatsForUltraWide_supportedFormats_0
      && ![(id)supportedVideoFormatsForUltraWide_supportedFormats_0 count])
    {
      uint64_t v3 = [a1 _querySupportedVideoFormatsForUltraWide];
      BOOL v4 = (void *)supportedVideoFormatsForUltraWide_supportedFormats_0;
      supportedVideoFormatsForUltraWide_supportedFormats_0 = v3;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__ARBodyTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForUltraWide_onceToken_0 != -1) {
      dispatch_once(&supportedVideoFormatsForUltraWide_onceToken_0, block);
    }
    id v5 = (id)supportedVideoFormatsForUltraWide_supportedFormats_0;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __64__ARBodyTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormatsForUltraWide];
  id v2 = (void *)supportedVideoFormatsForUltraWide_supportedFormats_0;
  supportedVideoFormatsForUltraWide_supportedFormats_0 = v1;
}

- (id)imageSensorSettingsForUserFaceTracking
{
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForUserFaceTracking];
  BOOL v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [[ARImageSensorSettings alloc] initWithVideoFormat:v4];
    [(ARImageSensorSettings *)v5 setAutoFocusEnabled:[(ARConfiguration *)self isAutoFocusEnabled]];
    [(ARImageSensorSettings *)v5 setMirrorVideoOutput:1];
    [(ARImageSensorSettings *)v5 setCalibrationDataOutputEnabled:0];
    [(ARImageSensorSettings *)v5 setMetaData:*MEMORY[0x1E4F15E48]];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(ARBodyTrackingConfiguration *)self shouldUseUltraWide])
  {
    id v5 = 0;
    goto LABEL_14;
  }
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForUltraWide];
  BOOL v4 = [v3 firstObject];

  if (v4)
  {
    id v5 = [[ARImageSensorSettings alloc] initWithVideoFormat:v4];
    LODWORD(v6) = 1126170624;
    [(ARImageSensorSettings *)v5 setMaxGainOverride:v6];
    [(ARImageSensorSettings *)v5 setVisionDataOutputEnabled:[(ARBodyTrackingConfiguration *)self shouldEnableVisionDataForImageSensorSettings:v5]];
    if ([(ARImageSensorSettings *)v5 visionDataOutputEnabled])
    {
      uint64_t v7 = [(ARBodyTrackingConfiguration *)self _trackingOptions];
      uint64_t v8 = [(ARBodyTrackingConfiguration *)self imageSensorSettings];
      [v7 setImageSensorSettings:v8];

      [v7 setImageSensorSettingsForUltraWide:v5];
      objc_super v9 = ARVisionDataParametersForWorldTrackingOptions(v7);
      if (v9)
      {
        [(ARImageSensorSettings *)v5 setVisionDataOutputParameters:v9];
        BOOL v10 = _ARLogGeneral_27();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v11 = (objc_class *)objc_opt_class();
          uint64_t v12 = NSStringFromClass(v11);
          int v18 = 138543874;
          double v19 = v12;
          __int16 v20 = 2048;
          v21 = self;
          __int16 v22 = 2114;
          v23 = v9;
          BOOL v13 = "%{public}@ <%p>: Setting vision data output parameters for ultra wide: %{public}@";
          uint64_t v14 = v10;
          uint32_t v15 = 32;
LABEL_11:
          _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, v15);
        }
      }
      else
      {
        BOOL v10 = _ARLogGeneral_27();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          BOOL v16 = (objc_class *)objc_opt_class();
          uint64_t v12 = NSStringFromClass(v16);
          int v18 = 138543618;
          double v19 = v12;
          __int16 v20 = 2048;
          v21 = self;
          BOOL v13 = "%{public}@ <%p>: Did not receive vision data output parameters for ultra wide.";
          uint64_t v14 = v10;
          uint32_t v15 = 22;
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    id v5 = 0;
  }

LABEL_14:
  return v5;
}

- (BOOL)shouldUseUltraWide
{
  if (!ARDeviceSupportsUltraWideCamera()) {
    return 0;
  }
  if ((ARDeviceSupportsJasper() & 1) == 0)
  {
    if (ARDeviceSupportsMulticamMode() && ARUserDefaultsMulticamModeEnabled())
    {
      uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForUltraWide];
      BOOL v2 = [v3 count] != 0;

      return v2;
    }
    return 0;
  }
  return 1;
}

- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3
{
  BOOL v4 = [a3 videoFormat];
  if (v4
    && ((BOOL v5 = [(ARBodyTrackingConfiguration *)self shouldUseUltraWide],
         [v4 captureDeviceType],
         double v6 = objc_claimAutoreleasedReturnValue(),
         uint64_t v7 = v6,
         !v5)
      ? (uint64_t v8 = (void **)MEMORY[0x1E4F15830])
      : (uint64_t v8 = (void **)MEMORY[0x1E4F15828]),
        objc_super v9 = *v8,
        v6,
        v7 == v9))
  {
    unsigned int v11 = [(ARBodyTrackingConfiguration *)self _trackingOptions];
    uint64_t v12 = [v11 slamConfiguration];
    int v13 = [v12 isEqualToString:@"MeasureApp"];

    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.visionData"])
    {
      int v10 = (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.simulateHWFeatureDetection"] | v13) ^ 1;
    }
    else
    {
      LOBYTE(v10) = 0;
    }
  }
  else
  {
    LOBYTE(v10) = 0;
  }

  return v10;
}

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap
{
}

- (AREnvironmentTexturing)environmentTexturing
{
  return self->_environmentTexturing;
}

- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing
{
  self->_environmentTexturing = environmentTexturing;
}

- (BOOL)wantsHDREnvironmentTextures
{
  return self->_wantsHDREnvironmentTextures;
}

- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures
{
  self->_wantsHDREnvironmentTextures = wantsHDREnvironmentTextures;
}

- (ARPlaneDetection)planeDetection
{
  return self->_planeDetection;
}

- (void)setPlaneDetection:(ARPlaneDetection)planeDetection
{
  self->_planeDetection = planeDetection;
}

- (NSSet)detectionImages
{
  return self->_detectionImages;
}

- (void)setDetectionImages:(NSSet *)detectionImages
{
}

- (BOOL)automaticImageScaleEstimationEnabled
{
  return self->_automaticImageScaleEstimationEnabled;
}

- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled
{
  self->_int automaticImageScaleEstimationEnabled = automaticImageScaleEstimationEnabled;
}

- (BOOL)automaticSkeletonScaleEstimationEnabled
{
  return self->_automaticSkeletonScaleEstimationEnabled;
}

- (void)setAutomaticSkeletonScaleEstimationEnabled:(BOOL)automaticSkeletonScaleEstimationEnabled
{
  self->_int automaticSkeletonScaleEstimationEnabled = automaticSkeletonScaleEstimationEnabled;
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled
{
  self->_int appClipCodeTrackingEnabled = appClipCodeTrackingEnabled;
}

- (BOOL)ignoreAppClipCodeURLLimitation
{
  return self->_ignoreAppClipCodeURLLimitation;
}

- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3
{
  self->_int ignoreAppClipCodeURLLimitation = a3;
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_int alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_detectionImages, 0);
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
}

@end