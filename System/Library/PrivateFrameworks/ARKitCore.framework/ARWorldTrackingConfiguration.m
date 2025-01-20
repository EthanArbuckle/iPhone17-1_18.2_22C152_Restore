@interface ARWorldTrackingConfiguration
+ (BOOL)isSupported;
+ (BOOL)shouldProvide30FPSVideoFormats;
+ (BOOL)supportsAppClipCodeTracking;
+ (BOOL)supportsFrameSemantics:(unint64_t)a3;
+ (BOOL)supportsSceneReconstruction:(ARSceneReconstruction)sceneReconstruction;
+ (BOOL)supportsUserFaceTracking;
+ (id)_availableCaptureDeviceTypeForBackdropCameraOverride;
+ (id)_querySupportedVideoFormats;
+ (id)_querySupportedVideoFormatsForUltraWide;
+ (id)_querySupportedVideoFormatsForUserFaceTracking;
+ (id)recommendedVideoFormatFor4KResolution;
+ (id)recommendedVideoFormatForHighResolutionFrameCapturing;
+ (id)supportedVideoFormats;
+ (id)supportedVideoFormatsForUltraWide;
+ (id)supportedVideoFormatsForUserFaceTracking;
+ (int64_t)backdropCameraOverride;
+ (void)setBackdropCameraOverride:(int64_t)a3;
+ (void)setShouldProvide30FPSVideoFormats:(BOOL)a3;
- (AREnvironmentTexturing)environmentTexturing;
- (ARImageSensorSettings)imageSensorSettingsForUltraWide;
- (ARPlaneDetection)planeDetection;
- (ARSceneReconstruction)sceneReconstruction;
- (ARSceneReconstructionOptions)sceneReconstructionOptions;
- (ARSpatialMappingParameters)spatialMappingParameters;
- (ARWorldMap)initialWorldMap;
- (ARWorldTrackingConfiguration)init;
- (BOOL)alwaysUsePrimaryCameraForTracking;
- (BOOL)appClipCodeTrackingEnabled;
- (BOOL)automaticImageScaleEstimationEnabled;
- (BOOL)deliverRawSceneUnderstandingResults;
- (BOOL)depthOptimizedForStaticScene;
- (BOOL)depthTemporalSmoothingEnabled;
- (BOOL)disableFrontCamera;
- (BOOL)ignoreAppClipCodeURLLimitation;
- (BOOL)isAccuratePlaneExtentCheckEnabled;
- (BOOL)isCollaborationEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLowQosSchedulingEnabled;
- (BOOL)isMLModelEnabled;
- (BOOL)isPlaneBundleAdjustmentEnabled;
- (BOOL)recordForGeoTracking;
- (BOOL)relocalizationEnabled;
- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3;
- (BOOL)shouldUseJasper;
- (BOOL)shouldUseUltraWide;
- (BOOL)shouldUseUltraWideIfAvailable;
- (BOOL)useLidarIfAvailable;
- (BOOL)userFaceTrackingEnabled;
- (BOOL)wantsHDREnvironmentTextures;
- (NSInteger)maximumNumberOfTrackedImages;
- (NSSet)detectionImages;
- (NSSet)detectionObjects;
- (NSString)slamConfiguration;
- (double)minVergenceAngle;
- (id)_trackingOptions;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)imageSensorSettings;
- (id)imageSensorSettingsForUserFaceTracking;
- (id)parentImageSensorSettings;
- (id)planeDetectionPoseUpdateCallback;
- (id)planeDetectionVIOPoseCallback;
- (id)secondaryTechniques;
- (id)singleShotPlaneCallback;
- (id)trackedPlaneCallback;
- (int64_t)_depthPrioritization;
- (int64_t)appClipCodePerformanceTestingMode;
- (void)createTechniques:(id)a3;
- (void)setAccuratePlaneExtentCheckEnabled:(BOOL)a3;
- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3;
- (void)setAppClipCodePerformanceTestingMode:(int64_t)a3;
- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled;
- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled;
- (void)setCollaborationEnabled:(BOOL)collaborationEnabled;
- (void)setDeliverRawSceneUnderstandingResults:(BOOL)a3;
- (void)setDepthOptimizedForStaticScene:(BOOL)a3;
- (void)setDepthTemporalSmoothingEnabled:(BOOL)a3;
- (void)setDetectionImages:(NSSet *)detectionImages;
- (void)setDetectionObjects:(NSSet *)detectionObjects;
- (void)setDisableFrontCamera:(BOOL)a3;
- (void)setEnvironmentTexturing:(AREnvironmentTexturing)environmentTexturing;
- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3;
- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap;
- (void)setLowQosSchedulingEnabled:(BOOL)a3;
- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages;
- (void)setMinVergenceAngle:(double)a3;
- (void)setMlModelEnabled:(BOOL)a3;
- (void)setPlaneBundleAdjustmentEnabled:(BOOL)a3;
- (void)setPlaneDetection:(ARPlaneDetection)planeDetection;
- (void)setPlaneDetectionPoseUpdateCallback:(id)a3;
- (void)setPlaneDetectionVIOPoseCallback:(id)a3;
- (void)setRecordForGeoTracking:(BOOL)a3;
- (void)setRelocalizationEnabled:(BOOL)a3;
- (void)setSceneReconstruction:(ARSceneReconstruction)sceneReconstruction;
- (void)setSceneReconstructionOptions:(id)a3;
- (void)setShouldUseUltraWideIfAvailable:(BOOL)a3;
- (void)setSingleShotPlaneCallback:(id)a3;
- (void)setSlamConfiguration:(id)a3;
- (void)setSpatialMappingParameters:(ARSpatialMappingParameters)a3;
- (void)setTrackedPlaneCallback:(id)a3;
- (void)setUseLidarIfAvailable:(BOOL)a3;
- (void)setUserFaceTrackingEnabled:(BOOL)userFaceTrackingEnabled;
- (void)setVideoFormat:(id)a3;
- (void)setWantsHDREnvironmentTextures:(BOOL)wantsHDREnvironmentTextures;
@end

@implementation ARWorldTrackingConfiguration

+ (BOOL)isSupported
{
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___ARWorldTrackingConfiguration;
  unsigned int v2 = objc_msgSendSuper2(&v4, sel_isSupported);
  if (v2) {
    LOBYTE(v2) = +[ARWorldTrackingTechnique isSupported];
  }
  return v2;
}

- (ARWorldTrackingConfiguration)init
{
  v15.receiver = self;
  v15.super_class = (Class)ARWorldTrackingConfiguration;
  unsigned int v2 = [(ARConfiguration *)&v15 initPrivate];
  if (v2)
  {
    if (ARShouldSupport1440pAndAutofocus())
    {
      [(ARConfiguration *)v2 setAutoFocusEnabled:1];
      [(ARWorldTrackingConfiguration *)v2 setMaximumNumberOfTrackedImages:0];
    }
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.environmentTexturing.wantsHDR"])
    {
      uint64_t v3 = ARLinkedOnOrAfterYukon();
    }
    else
    {
      uint64_t v3 = 0;
    }
    [(ARWorldTrackingConfiguration *)v2 setWantsHDREnvironmentTextures:v3];
    uint64_t v4 = objc_opt_new();
    detectionImages = v2->_detectionImages;
    v2->_detectionImages = (NSSet *)v4;

    uint64_t v6 = objc_opt_new();
    detectionObjects = v2->_detectionObjects;
    v2->_detectionObjects = (NSSet *)v6;

    v8 = objc_opt_new();
    v2->_relocalizationEnabled = [v8 relocalizationEnabled];
    [v8 minVergenceAngle];
    v2->_minVergenceAngle = v9;
    int v10 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.mlOnANEDevices"];
    if (v10) {
      LOBYTE(v10) = ARAppleNeuralEngine();
    }
    v2->_mlModelEnabled = v10;
    v2->_lowQosSchedulingEnabled = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.planeEstimation.enableLowQosScheduling"];
    v2->_accuratePlaneExtentCheckEnabled = 1;
    slamConfiguration = v2->_slamConfiguration;
    v2->_slamConfiguration = (NSString *)@"ARKitiOS";

    v2->_userFaceTrackingEnabled = 0;
    v2->_shouldUseUltraWideIfAvailable = 1;
    v2->_depthTemporalSmoothingEnabled = 0;
    v2->_depthOptimizedForStaticScene = 0;
    v2->_alwaysUsePrimaryCameraForTracking = 0;
    v2->_disableFrontCamera = 0;
    v2->_ignoreAppClipCodeURLLimitation = 0;
    v2->_appClipCodeTrackingEnabled = 0;
    uint64_t v12 = objc_opt_new();
    sceneReconstructionOptions = v2->_sceneReconstructionOptions;
    v2->_sceneReconstructionOptions = (ARSceneReconstructionOptions *)v12;

    v2->_recordForGeoTracking = 0;
    v2->_planeBundleAdjustmentEnabled = 0;
    v2->_useLidarIfAvailable = 1;
  }
  return v2;
}

+ (void)setShouldProvide30FPSVideoFormats:(BOOL)a3
{
  if (s_provide30FPSVideoFormats != a3)
  {
    s_provide30FPSVideoFormats = a3;
    uint64_t v3 = (void *)s_supportedFormatsCache;
    if (s_supportedFormatsCache)
    {
      s_supportedFormatsCache = MEMORY[0x1E4F1CBF0];
    }
  }
}

+ (BOOL)shouldProvide30FPSVideoFormats
{
  BOOL result = ARLinkedOnOrAfterSydney();
  if (s_provide30FPSVideoFormats) {
    return 1;
  }
  return result;
}

+ (void)setBackdropCameraOverride:(int64_t)a3
{
  if (s_backdropCameraOverride != a3)
  {
    s_backdropCameraOverride = a3;
    uint64_t v3 = (void *)s_supportedFormatsCache;
    if (s_supportedFormatsCache)
    {
      s_supportedFormatsCache = MEMORY[0x1E4F1CBF0];
    }
  }
}

+ (int64_t)backdropCameraOverride
{
  return s_backdropCameraOverride;
}

+ (id)_availableCaptureDeviceTypeForBackdropCameraOverride
{
  if ((unint64_t)s_backdropCameraOverride <= 2) {
    id v2 = **((id **)&unk_1E6186C20 + s_backdropCameraOverride);
  }
  if (+[ARVideoFormat isCaptureDeviceTypeAvailable:v2 position:1])
  {
    uint64_t v3 = v2;
  }
  else
  {
    uint64_t v3 = (void *)*MEMORY[0x1E4F15830];
  }
  id v4 = v3;

  return v4;
}

+ (id)_querySupportedVideoFormats
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _availableCaptureDeviceTypeForBackdropCameraOverride];
  id v4 = objc_opt_new();
  if ((ARLinkedOnOrAfterSydney() & 1) != 0 || ![a1 shouldProvide30FPSVideoFormats])
  {
    v5 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:1 deviceType:v3];
  }
  else
  {
    v5 = +[ARVideoFormat supportedVideoFormatsForDevicePosition:1 deviceType:v3 frameRate:30.0];
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
  v30 = v4;
  if (v7)
  {
    uint64_t v9 = v7;
    uint64_t v10 = *(void *)v36;
    *(void *)&long long v8 = 138543874;
    long long v28 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v36 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        objc_msgSend(v12, "imageResolution", v28);
        if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
        {
          [v4 addObject:v12];
        }
        else
        {
          v13 = _ARLogGeneral_14();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v14 = (objc_class *)objc_opt_class();
            objc_super v15 = NSStringFromClass(v14);
            *(_DWORD *)buf = v28;
            v41 = v15;
            __int16 v42 = 2048;
            id v43 = a1;
            __int16 v44 = 2114;
            v45 = v12;
            _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Filtering out video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

            id v4 = v30;
          }
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v9);
  }

  if (ARLinkedOnOrAfterSydney())
  {
    v16 = +[ARVideoFormat supportedVideoFormatsForStillImageCaptureForDevicePosition:1 deviceType:v3];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v6 = v16;
    uint64_t v17 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
    if (v17)
    {
      uint64_t v19 = v17;
      uint64_t v20 = *(void *)v32;
      *(void *)&long long v18 = 138543874;
      long long v29 = v18;
      do
      {
        for (uint64_t j = 0; j != v19; ++j)
        {
          if (*(void *)v32 != v20) {
            objc_enumerationMutation(v6);
          }
          v22 = *(void **)(*((void *)&v31 + 1) + 8 * j);
          objc_msgSend(v22, "imageResolution", v29);
          if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
          {
            [v4 addObject:v22];
          }
          else
          {
            v23 = _ARLogGeneral_14();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = (objc_class *)objc_opt_class();
              v25 = NSStringFromClass(v24);
              *(_DWORD *)buf = v29;
              v41 = v25;
              __int16 v42 = 2048;
              id v43 = a1;
              __int16 v44 = 2114;
              v45 = v22;
              _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Filtering out video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);

              id v4 = v30;
            }
          }
        }
        uint64_t v19 = [v6 countByEnumeratingWithState:&v31 objects:v39 count:16];
      }
      while (v19);
    }

    v26 = +[ARVideoFormat supportedVideoFormatsForHiResOrX420ForDevicePosition:1 deviceType:v3];
    [v4 addObjectsFromArray:v26];
  }
  return v4;
}

+ (id)supportedVideoFormats
{
  if ([a1 isSupported])
  {
    if (s_supportedFormatsCache && ![(id)s_supportedFormatsCache count])
    {
      uint64_t v3 = [a1 _querySupportedVideoFormats];
      id v4 = (void *)s_supportedFormatsCache;
      s_supportedFormatsCache = v3;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormats_onceToken_0 != -1) {
      dispatch_once(&supportedVideoFormats_onceToken_0, block);
    }
    id v5 = (id)s_supportedFormatsCache;
    if (([(id)objc_opt_class() shouldProvideX420VideoFormat] & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_40];
      uint64_t v7 = [v5 filteredArrayUsingPredicate:v6];

      id v5 = (id)v7;
    }
    if (([(id)objc_opt_class() shouldProvideNonBinnedVideoFormats] & 1) == 0)
    {
      long long v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_14];
      uint64_t v9 = [v5 filteredArrayUsingPredicate:v8];

      id v5 = (id)v9;
    }
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormats];
  id v2 = (void *)s_supportedFormatsCache;
  s_supportedFormatsCache = v1;
}

uint64_t __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isX420PixelFormat] ^ 1;
}

uint64_t __53__ARWorldTrackingConfiguration_supportedVideoFormats__block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = [a2 deviceFormat];
  uint64_t v3 = [v2 isVideoBinned];

  return v3;
}

+ (id)recommendedVideoFormatFor4KResolution
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_16_1];
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormats];
  id v4 = [v3 filteredArrayUsingPredicate:v2];

  if ([v4 count])
  {
    id v5 = [v4 firstObject];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __69__ARWorldTrackingConfiguration_recommendedVideoFormatFor4KResolution__block_invoke(uint64_t a1, void *a2)
{
  return [a2 has4KVideoResolution];
}

+ (id)recommendedVideoFormatForHighResolutionFrameCapturing
{
  id v2 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_18];
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormats];
  id v4 = [v3 filteredArrayUsingPredicate:v2];

  if ([v4 count])
  {
    id v5 = [v4 firstObject];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

uint64_t __85__ARWorldTrackingConfiguration_recommendedVideoFormatForHighResolutionFrameCapturing__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isRecommendedForHighResolutionFrameCapturing];
}

+ (id)_querySupportedVideoFormatsForUserFaceTracking
{
  v13[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 _availableCaptureDeviceTypeForBackdropCameraOverride];
  id v4 = +[ARVideoFormat bestVideoFormatForDevicePosition:2 deviceType:v3 resolution:0x2D000000500 frameRates:&unk_1F125BE10 videoBinned:1];
  if (v4
    || (+[ARFaceTrackingConfiguration fallbackVideoFormatWithCaptureDeviceType:v3], (id v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v13[0] = v4;
    id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  }
  else
  {
    id v4 = _ARLogGeneral_14();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      long long v8 = NSStringFromClass(v7);
      int v9 = 138543618;
      uint64_t v10 = v8;
      __int16 v11 = 2048;
      id v12 = a1;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not find supported video format for running user face tracking in multicam mode.", (uint8_t *)&v9, 0x16u);
    }
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)supportedVideoFormatsForUserFaceTracking
{
  if ([a1 supportsUserFaceTracking])
  {
    if (supportedVideoFormatsForUserFaceTracking_supportedFormats
      && ![(id)supportedVideoFormatsForUserFaceTracking_supportedFormats count])
    {
      uint64_t v3 = [a1 _querySupportedVideoFormatsForUserFaceTracking];
      id v4 = (void *)supportedVideoFormatsForUserFaceTracking_supportedFormats;
      supportedVideoFormatsForUserFaceTracking_supportedFormats = v3;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __72__ARWorldTrackingConfiguration_supportedVideoFormatsForUserFaceTracking__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForUserFaceTracking_onceToken != -1) {
      dispatch_once(&supportedVideoFormatsForUserFaceTracking_onceToken, block);
    }
    id v5 = (id)supportedVideoFormatsForUserFaceTracking_supportedFormats;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __72__ARWorldTrackingConfiguration_supportedVideoFormatsForUserFaceTracking__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormatsForUserFaceTracking];
  id v2 = (void *)supportedVideoFormatsForUserFaceTracking_supportedFormats;
  supportedVideoFormatsForUserFaceTracking_supportedFormats = v1;
}

+ (id)_querySupportedVideoFormatsForUltraWide
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = (id)*MEMORY[0x1E4F15828];
  uint64_t v4 = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.back.ultrawide.videoBinned"];
  id v5 = +[ARKitUserDefaults resolutionDictionaryForKey:@"com.apple.arkit.imagesensor.back.ultrawide.resolution"];
  if (v5 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    uint64_t v7 = [v6 objectForKeyedSubscript:@"width"];
    uint64_t v8 = [v6 objectForKeyedSubscript:@"height"];
    int v9 = (void *)v8;
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
      unsigned int v41 = v4;
      unsigned int v11 = [v7 intValue];
      uint64_t v12 = [v9 intValue];
      v13 = _ARLogSensor_4();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        objc_super v15 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v15);
        *(_DWORD *)buf = 138544386;
        v46 = v40;
        __int16 v47 = 2048;
        id v48 = a1;
        __int16 v49 = 2112;
        double v50 = *(double *)&v3;
        __int16 v51 = 1024;
        unsigned int v52 = v11;
        __int16 v53 = 1024;
        int v54 = v12;
        _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat resolution for %@ set to %i, %i by user defaults", buf, 0x2Cu);
      }
      uint64_t v4 = v41;
    }
  }
  else
  {
    uint64_t v12 = 480;
    unsigned int v11 = 640;
  }
  v16 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.back.ultrawide.frameRate"];
  uint64_t v17 = v16;
  if (v16)
  {
    [v16 doubleValue];
    double v19 = v18;
    uint64_t v20 = _ARLogSensor_4();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (objc_class *)objc_opt_class();
      v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543874;
      v46 = v22;
      __int16 v47 = 2048;
      id v48 = a1;
      __int16 v49 = 2048;
      double v50 = v19;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: ARVideoFormat frame rate set to %f by user defaults", buf, 0x20u);
    }
  }
  else
  {
    double v19 = 10.0;
  }
  v23 = (void *)MGCopyAnswer();
  if (([v23 BOOLValue] & 1) == 0 && ARDeviceSupportsJasper())
  {
    v24 = -[ARVideoFormat initWithImageResolution:captureDevicePosition:captureDeviceType:]([ARVideoFormat alloc], "initWithImageResolution:captureDevicePosition:captureDeviceType:", 1, v3, 640.0, 480.0);
    v25 = [NSNumber numberWithDouble:v19];
    v44[0] = v25;
    v26 = [NSNumber numberWithDouble:v19];
    v44[1] = v26;
    v27 = [NSNumber numberWithDouble:v19];
    v44[2] = v27;
    long long v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
    [(ARVideoFormat *)v24 setFrameRatesByPowerUsage:v28];

    id v43 = v24;
    long long v29 = (void *)MEMORY[0x1E4F1C978];
    v30 = &v43;
LABEL_25:
    long long v32 = [v29 arrayWithObjects:v30 count:1];
    goto LABEL_32;
  }
  long long v31 = +[ARVideoFormat bestVideoFormatForDevicePosition:1 deviceType:v3 resolution:v11 | (unint64_t)(v12 << 32) frameRate:v4 videoBinned:v19];
  v24 = v31;
  if (v31)
  {
    [(ARVideoFormat *)v31 imageResolution];
    if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:](ARWorldTrackingTechnique, "supportsVideoResolution:forDeviceType:", v3))
    {
      __int16 v42 = v24;
      long long v29 = (void *)MEMORY[0x1E4F1C978];
      v30 = &v42;
      goto LABEL_25;
    }
    long long v33 = _ARLogGeneral_14();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      long long v34 = (objc_class *)objc_opt_class();
      long long v35 = NSStringFromClass(v34);
      *(_DWORD *)buf = 138543874;
      v46 = v35;
      __int16 v47 = 2048;
      id v48 = a1;
      __int16 v49 = 2114;
      double v50 = *(double *)&v24;
      _os_log_impl(&dword_1B88A2000, v33, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Not returning video format %{public}@ because world tracking technique does not support its video resolution on current device", buf, 0x20u);
    }
  }
  long long v36 = _ARLogGeneral_14();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
  {
    long long v37 = (objc_class *)objc_opt_class();
    long long v38 = NSStringFromClass(v37);
    *(_DWORD *)buf = 138543618;
    v46 = v38;
    __int16 v47 = 2048;
    id v48 = a1;
    _os_log_impl(&dword_1B88A2000, v36, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Video format not found for using ultra wide in world tracking", buf, 0x16u);
  }
  long long v32 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_32:

  return v32;
}

+ (id)supportedVideoFormatsForUltraWide
{
  if ([a1 isSupported])
  {
    if (supportedVideoFormatsForUltraWide_supportedFormats
      && ![(id)supportedVideoFormatsForUltraWide_supportedFormats count])
    {
      uint64_t v3 = [a1 _querySupportedVideoFormatsForUltraWide];
      uint64_t v4 = (void *)supportedVideoFormatsForUltraWide_supportedFormats;
      supportedVideoFormatsForUltraWide_supportedFormats = v3;
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__ARWorldTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0l;
    block[4] = a1;
    if (supportedVideoFormatsForUltraWide_onceToken != -1) {
      dispatch_once(&supportedVideoFormatsForUltraWide_onceToken, block);
    }
    id v5 = (id)supportedVideoFormatsForUltraWide_supportedFormats;
  }
  else
  {
    id v5 = (id)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

void __65__ARWorldTrackingConfiguration_supportedVideoFormatsForUltraWide__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) _querySupportedVideoFormatsForUltraWide];
  id v2 = (void *)supportedVideoFormatsForUltraWide_supportedFormats;
  supportedVideoFormatsForUltraWide_supportedFormats = v1;
}

- (void)setVideoFormat:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)ARWorldTrackingConfiguration;
  [(ARConfiguration *)&v6 setVideoFormat:v4];
  if ([v4 has4KVideoResolution]) {
    uint64_t v5 = 1;
  }
  else {
    uint64_t v5 = [v4 isX420PixelFormat];
  }
  [(ARWorldTrackingConfiguration *)self setAlwaysUsePrimaryCameraForTracking:v5];
}

- (id)parentImageSensorSettings
{
  v10.receiver = self;
  v10.super_class = (Class)ARWorldTrackingConfiguration;
  uint64_t v3 = [(ARConfiguration *)&v10 parentImageSensorSettings];
  id v4 = [v3 settings];
  uint64_t v5 = (void *)[v4 mutableCopy];

  if ([(id)objc_opt_class() supportsUserFaceTracking]
    && !self->_disableFrontCamera
    && !+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", @"com.apple.arkit.worldTracking.forceDisableFrontCamera")&& ![(id)objc_opt_class() backdropCameraOverride]&& !-[ARWorldTrackingConfiguration recordForGeoTracking](self, "recordForGeoTracking"))
  {
    objc_super v6 = [(ARWorldTrackingConfiguration *)self imageSensorSettingsForUserFaceTracking];
    objc_msgSend(v6, "setEnabled:", -[ARWorldTrackingConfiguration userFaceTrackingEnabled](self, "userFaceTrackingEnabled"));
    if (v6) {
      [v5 addObject:v6];
    }
  }
  uint64_t v7 = [(ARWorldTrackingConfiguration *)self imageSensorSettingsForUltraWide];
  if (v7) {
    [v5 addObject:v7];
  }
  uint64_t v8 = [(ARConfiguration *)self depthSensorSettingsForJasper];
  if (v8) {
    [v5 addObject:v8];
  }
  [v3 setSettings:v5];

  return v3;
}

- (id)imageSensorSettings
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)ARWorldTrackingConfiguration;
  uint64_t v3 = [(ARConfiguration *)&v15 imageSensorSettings];
  objc_msgSend(v3, "setVisionDataOutputEnabled:", -[ARWorldTrackingConfiguration shouldEnableVisionDataForImageSensorSettings:](self, "shouldEnableVisionDataForImageSensorSettings:", v3));
  if ([v3 visionDataOutputEnabled])
  {
    id v4 = [(ARWorldTrackingConfiguration *)self _trackingOptions];
    [v4 setImageSensorSettings:v3];
    uint64_t v5 = [(ARWorldTrackingConfiguration *)self imageSensorSettingsForUltraWide];
    [v4 setImageSensorSettingsForUltraWide:v5];

    objc_super v6 = ARVisionDataParametersForWorldTrackingOptions(v4);
    if (v6)
    {
      [v3 setVisionDataOutputParameters:v6];
      uint64_t v7 = _ARLogGeneral_14();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v8 = (objc_class *)objc_opt_class();
        int v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543874;
        uint64_t v17 = v9;
        __int16 v18 = 2048;
        double v19 = self;
        __int16 v20 = 2114;
        v21 = v6;
        objc_super v10 = "%{public}@ <%p>: Setting vision data output parameters for wide: %{public}@";
        unsigned int v11 = v7;
        uint32_t v12 = 32;
LABEL_7:
        _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, v10, buf, v12);
      }
    }
    else
    {
      uint64_t v7 = _ARLogGeneral_14();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        v13 = (objc_class *)objc_opt_class();
        int v9 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138543618;
        uint64_t v17 = v9;
        __int16 v18 = 2048;
        double v19 = self;
        objc_super v10 = "%{public}@ <%p>: Did not receive vision data output parameters for wide.";
        unsigned int v11 = v7;
        uint32_t v12 = 22;
        goto LABEL_7;
      }
    }
  }
  return v3;
}

- (id)imageSensorSettingsForUserFaceTracking
{
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForUserFaceTracking];
  id v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = [[ARImageSensorSettings alloc] initWithVideoFormat:v4];
    [(ARImageSensorSettings *)v5 setAutoFocusEnabled:[(ARConfiguration *)self isAutoFocusEnabled]];
    [(ARImageSensorSettings *)v5 setMirrorVideoOutput:1];
    [(ARImageSensorSettings *)v5 setCalibrationDataOutputEnabled:0];
    [(ARImageSensorSettings *)v5 setMetaData:*MEMORY[0x1E4F15E48]];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

- (ARImageSensorSettings)imageSensorSettingsForUltraWide
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (![(ARWorldTrackingConfiguration *)self shouldUseUltraWide])
  {
    uint64_t v5 = 0;
    goto LABEL_14;
  }
  uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForUltraWide];
  id v4 = [v3 firstObject];

  if (v4)
  {
    uint64_t v5 = [[ARImageSensorSettings alloc] initWithVideoFormat:v4];
    LODWORD(v6) = 1126170624;
    [(ARImageSensorSettings *)v5 setMaxGainOverride:v6];
    [(ARImageSensorSettings *)v5 setVisionDataOutputEnabled:[(ARWorldTrackingConfiguration *)self shouldEnableVisionDataForImageSensorSettings:v5]];
    if ([(ARImageSensorSettings *)v5 visionDataOutputEnabled])
    {
      uint64_t v7 = [(ARWorldTrackingConfiguration *)self _trackingOptions];
      uint64_t v8 = [(ARWorldTrackingConfiguration *)self imageSensorSettings];
      [v7 setImageSensorSettings:v8];

      [v7 setImageSensorSettingsForUltraWide:v5];
      int v9 = ARVisionDataParametersForWorldTrackingOptions(v7);
      if (v9)
      {
        [(ARImageSensorSettings *)v5 setVisionDataOutputParameters:v9];
        objc_super v10 = _ARLogGeneral_14();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          unsigned int v11 = (objc_class *)objc_opt_class();
          uint32_t v12 = NSStringFromClass(v11);
          int v18 = 138543874;
          double v19 = v12;
          __int16 v20 = 2048;
          v21 = self;
          __int16 v22 = 2114;
          v23 = v9;
          v13 = "%{public}@ <%p>: Setting vision data output parameters for ultra wide: %{public}@";
          v14 = v10;
          uint32_t v15 = 32;
LABEL_11:
          _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, v13, (uint8_t *)&v18, v15);
        }
      }
      else
      {
        objc_super v10 = _ARLogGeneral_14();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          v16 = (objc_class *)objc_opt_class();
          uint32_t v12 = NSStringFromClass(v16);
          int v18 = 138543618;
          double v19 = v12;
          __int16 v20 = 2048;
          v21 = self;
          v13 = "%{public}@ <%p>: Did not receive vision data output parameters for ultra wide.";
          v14 = v10;
          uint32_t v15 = 22;
          goto LABEL_11;
        }
      }
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

LABEL_14:
  return v5;
}

- (BOOL)shouldUseUltraWide
{
  if (ARDeviceSupportsUltraWideCamera() && ARUserDefaultsMulticamModeEnabled())
  {
    uint64_t v3 = [(id)objc_opt_class() supportedVideoFormatsForUltraWide];
    if ([v3 count] && self->_shouldUseUltraWideIfAvailable)
    {
      uint64_t v4 = [(id)objc_opt_class() backdropCameraOverride];

      if (!v4)
      {
        int v5 = 1;
        if (ARDeviceSupportsMulticamMode()) {
          return v5;
        }
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  int v5 = 0;
LABEL_10:
  if (ARLinkedOnOrAfterYukon()) {
    LOBYTE(v5) = 0;
  }
  else {
    return v5 & ARDeviceSupportsJasper();
  }
  return v5;
}

- (BOOL)shouldUseJasper
{
  int v3 = ARDeviceSupportsJasper();
  if (v3)
  {
    LOBYTE(v3) = [(ARWorldTrackingConfiguration *)self useLidarIfAvailable];
  }
  return v3;
}

- (BOOL)shouldEnableVisionDataForImageSensorSettings:(id)a3
{
  uint64_t v4 = [a3 videoFormat];
  if (!v4) {
    goto LABEL_4;
  }
  BOOL v5 = [(ARWorldTrackingConfiguration *)self shouldUseUltraWide];
  double v6 = [v4 captureDeviceType];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = (void *)*MEMORY[0x1E4F15828];

    if (v7 != v8)
    {
LABEL_4:
      LOBYTE(v9) = 0;
      goto LABEL_10;
    }
  }
  else
  {
    int v10 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v6);

    if (!v10) {
      goto LABEL_4;
    }
  }
  unsigned int v11 = [(ARWorldTrackingConfiguration *)self _trackingOptions];
  uint32_t v12 = [v11 slamConfiguration];
  int v13 = [v12 isEqualToString:@"MeasureApp"];

  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.visionData"])
  {
    int v9 = (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.simulateHWFeatureDetection"] | v13) ^ 1;
  }
  else
  {
    LOBYTE(v9) = 0;
  }

LABEL_10:
  return v9;
}

- (void)setDetectionImages:(NSSet *)detectionImages
{
  uint64_t v4 = detectionImages;
  double v6 = v4;
  if (!v4) {
    uint64_t v4 = (NSSet *)objc_opt_new();
  }
  objc_storeStrong((id *)&self->_detectionImages, v4);
  BOOL v5 = v6;
  if (!v6)
  {

    BOOL v5 = 0;
  }
}

- (void)setMaximumNumberOfTrackedImages:(NSInteger)maximumNumberOfTrackedImages
{
  self->_maximumNumberOfTrackedImages = +[ARODTHandleManager actualNumberOfImagesTracked:maximumNumberOfTrackedImages];
}

- (void)createTechniques:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [(ARConfiguration *)self frameSemantics];
  if (![(ARWorldTrackingConfiguration *)self useLidarIfAvailable] && (v5 & 0x18) != 0)
  {
    if (_ARLogRuntimeIssues_onceToken_0 != -1) {
      dispatch_once(&_ARLogRuntimeIssues_onceToken_0, &__block_literal_global_378);
    }
    double v6 = (void *)_ARLogRuntimeIssues_logObj_0;
    if (os_log_type_enabled((os_log_t)_ARLogRuntimeIssues_logObj_0, OS_LOG_TYPE_FAULT))
    {
      uint64_t v7 = v6;
      uint64_t v8 = (objc_class *)objc_opt_class();
      int v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543618;
      v59 = v9;
      __int16 v60 = 2048;
      v61 = self;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_FAULT, "%{public}@ <%p>: Disabling Lidar (useLidarIfAvailable=false) and SceneDepth is not compatible (ARFrameSemanticSceneDepth | ARFrameSemanticSmoothedSceneDepth)", buf, 0x16u);
    }
  }
  int v10 = [(ARWorldTrackingConfiguration *)self _trackingOptions];
  unsigned int v11 = [(ARWorldTrackingConfiguration *)self imageSensorSettings];
  [v10 setImageSensorSettings:v11];

  uint32_t v12 = [(ARWorldTrackingConfiguration *)self imageSensorSettingsForUltraWide];
  [v10 setImageSensorSettingsForUltraWide:v12];

  if ([(ARWorldTrackingConfiguration *)self environmentTexturing]) {
    objc_msgSend(v10, "setPlaneDetection:", objc_msgSend(v10, "planeDetection") | 0x80);
  }
  int v13 = [(ARConfiguration *)self replaySensor];
  v14 = v13;
  if (v13 && [v13 replayMode])
  {
    [v10 setDeterministicMode:1];
    uint32_t v15 = [v10 sceneReconstructionOptions];
    [v15 setDeterministicMode:1];
  }
  if ([v10 planeDetection])
  {
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.accuratePlaneExtentCheck"])
    {
      BOOL accuratePlaneExtentCheckEnabled = self->_accuratePlaneExtentCheckEnabled;
    }
    else
    {
      BOOL accuratePlaneExtentCheckEnabled = 0;
    }
    uint64_t v17 = _ARLogGeneral_14();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      int v18 = (objc_class *)objc_opt_class();
      double v19 = NSStringFromClass(v18);
      __int16 v20 = @"disabled";
      *(_DWORD *)buf = 138543874;
      v59 = v19;
      if (accuratePlaneExtentCheckEnabled) {
        __int16 v20 = @"enabled";
      }
      __int16 v60 = 2048;
      v61 = self;
      __int16 v62 = 2114;
      double v63 = *(double *)&v20;
      _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Ray-cast accurate extent check: %{public}@", buf, 0x20u);
    }
    if (accuratePlaneExtentCheckEnabled) {
      objc_msgSend(v10, "setPlaneDetection:", objc_msgSend(v10, "planeDetection") | 0x200);
    }
  }
  v21 = [[ARWorldTrackingTechnique alloc] initWithOptions:v10];
  if (v21)
  {
    __int16 v22 = [MEMORY[0x1E4F1CA48] array];
    [v22 addObject:v21];
    v23 = [(ARWorldTrackingConfiguration *)self detectionImages];
    uint64_t v24 = [v23 count];

    if (v24)
    {
      v25 = [ARImageDetectionTechnique alloc];
      v26 = [(ARWorldTrackingConfiguration *)self detectionImages];
      v27 = [v26 allObjects];
      long long v28 = [(ARImageDetectionTechnique *)v25 initWithReferenceImages:v27 maximumNumberOfTrackedImages:[(ARWorldTrackingConfiguration *)self maximumNumberOfTrackedImages]];

      [(ARImageDetectionTechnique *)v28 setEnableAutomaticImageScaleEstimation:[(ARWorldTrackingConfiguration *)self automaticImageScaleEstimationEnabled]];
      [v22 addObject:v28];
    }
    if ([(ARWorldTrackingConfiguration *)self appClipCodeTrackingEnabled])
    {
      long long v29 = [[ARAppClipCodeTechnique alloc] initWithIgnoreURLLimitation:[(ARWorldTrackingConfiguration *)self ignoreAppClipCodeURLLimitation]];
      if ((unint64_t)(self->_appClipCodePerformanceTestingMode - 1) <= 1)
      {
        [v4 removeAllObjects];
        [v4 addObject:v29];
LABEL_48:

        goto LABEL_49;
      }
      [v22 addObject:v29];
    }
    v30 = [(ARWorldTrackingTechnique *)v21 options];
    uint64_t v31 = [v30 planeDetection];

    if (v31)
    {
      long long v32 = [[ARPlaneEstimationTechnique alloc] initWithTrackingTechnique:v21];
      [v4 addObject:v32];
    }
    if ([(ARWorldTrackingConfiguration *)self environmentTexturing])
    {
      long long v33 = [[AREnvironmentTexturingTechnique alloc] initWithOptions:[(ARWorldTrackingConfiguration *)self environmentTexturing] wantsHDREnvironmentTextures:self->_wantsHDREnvironmentTextures];
      [v4 addObject:v33];
    }
    long long v34 = [(ARWorldTrackingConfiguration *)self detectionObjects];
    uint64_t v35 = [v34 count];

    if (v35)
    {
      long long v36 = [ARObjectDetectionTechnique alloc];
      long long v37 = [(ARWorldTrackingConfiguration *)self detectionObjects];
      long long v38 = [v37 allObjects];
      v39 = [(ARObjectDetectionTechnique *)v36 initWithDetectionObjects:v38];

      [v22 addObject:v39];
    }
    long long v29 = [[ARParentTechnique alloc] initWithParallelTechniques:v22];
    [v4 insertObject:v29 atIndex:0];
    v57.receiver = self;
    v57.super_class = (Class)ARWorldTrackingConfiguration;
    [(ARConfiguration *)&v57 createTechniques:v4];
    if ([v10 planeDetection]) {
      int v40 = [(ARWorldTrackingConfiguration *)self isMLModelEnabled];
    }
    else {
      int v40 = 0;
    }
    ARSceneReconstruction v41 = [(ARWorldTrackingConfiguration *)self sceneReconstruction];
    if ([(ARWorldTrackingConfiguration *)self shouldUseJasper])
    {
      if (v41) {
        int v40 = 1;
      }
      ARAddJasperTechniquesToParent(v29, v4, v40, ([(ARConfiguration *)self frameSemantics] >> 4) & 1, [(ARConfiguration *)self maxUltrawideImageForwardingFrameRate]);
      __int16 v42 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v4];
      id v43 = v42;
      if (v42)
      {
        v56 = v14;
        __int16 v44 = [v42 pipelineParameters];
        [v44 confidenceBucketingHighThreshold];
        int v46 = v45;
        __int16 v47 = [(ARWorldTrackingTechnique *)v21 mutableOptions];
        id v48 = [v47 sceneReconstructionOptions];
        LODWORD(v49) = v46;
        [v48 setMinDepthUncertaintyThreshold:v49];

        double v50 = _ARLogGeneral_14();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
        {
          __int16 v51 = (objc_class *)objc_opt_class();
          unsigned int v52 = NSStringFromClass(v51);
          uint64_t v55 = [(ARWorldTrackingTechnique *)v21 mutableOptions];
          __int16 v53 = [v55 sceneReconstructionOptions];
          [v53 minDepthUncertaintyThreshold];
          *(_DWORD *)buf = 138543874;
          v59 = v52;
          __int16 v60 = 2048;
          v61 = self;
          __int16 v62 = 2048;
          double v63 = v54;
          _os_log_impl(&dword_1B88A2000, v50, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Changed the min depth uncertainty threshold of scene reconstruction to %f \n", buf, 0x20u);
        }
        v14 = v56;
      }
    }
    else if (v40)
    {
      ARAddNonJasperSemanticsToParent(v29, v4, [(ARConfiguration *)self maxUltrawideImageForwardingFrameRate], 1);
    }
    goto LABEL_48;
  }
LABEL_49:
}

- (id)secondaryTechniques
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if ([(id)objc_opt_class() supportsUserFaceTracking]
    && [(ARWorldTrackingConfiguration *)self userFaceTrackingEnabled])
  {
    int v3 = objc_opt_new();
    v6[0] = v3;
    id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];
  }
  else
  {
    id v4 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v4;
}

- (id)_trackingOptions
{
  int v3 = objc_opt_new();
  id v4 = [(ARConfiguration *)self deviceModel];
  [v3 setDeviceModel:v4];

  objc_msgSend(v3, "setRelocalizationEnabled:", -[ARWorldTrackingConfiguration relocalizationEnabled](self, "relocalizationEnabled"));
  char v5 = [(ARWorldTrackingConfiguration *)self initialWorldMap];
  [v3 setInitialWorldMap:v5];

  double v6 = [(ARWorldTrackingConfiguration *)self slamConfiguration];
  [v3 setSlamConfiguration:v6];

  objc_msgSend(v3, "setPlaneDetection:", -[ARWorldTrackingConfiguration planeDetection](self, "planeDetection"));
  [(ARWorldTrackingConfiguration *)self minVergenceAngle];
  objc_msgSend(v3, "setMinVergenceAngle:");
  objc_msgSend(v3, "setMlModelEnabled:", -[ARWorldTrackingConfiguration isMLModelEnabled](self, "isMLModelEnabled"));
  objc_msgSend(v3, "setLowQosSchedulingEnabled:", -[ARWorldTrackingConfiguration isLowQosSchedulingEnabled](self, "isLowQosSchedulingEnabled"));
  objc_msgSend(v3, "setCollaborationEnabled:", -[ARWorldTrackingConfiguration isCollaborationEnabled](self, "isCollaborationEnabled"));
  objc_msgSend(v3, "setSceneReconstruction:", -[ARWorldTrackingConfiguration sceneReconstruction](self, "sceneReconstruction"));
  uint64_t v7 = [(ARWorldTrackingConfiguration *)self sceneReconstructionOptions];
  [v3 setSceneReconstructionOptions:v7];

  LOBYTE(v7) = [(ARConfiguration *)self frameSemantics];
  [(ARConfiguration *)self frameSemantics];
  if ((v7 & 8) != 0 || [(ARWorldTrackingConfiguration *)self sceneReconstruction]) {
    [v3 setDepthBuffersWillBeProvided:1];
  }
  objc_msgSend(v3, "setAlwaysUsePrimaryCameraForTracking:", -[ARWorldTrackingConfiguration alwaysUsePrimaryCameraForTracking](self, "alwaysUsePrimaryCameraForTracking"));
  objc_msgSend(v3, "setRecordForGeoTracking:", -[ARWorldTrackingConfiguration recordForGeoTracking](self, "recordForGeoTracking"));
  objc_msgSend(v3, "setPlaneBundleAdjustmentEnabled:", -[ARWorldTrackingConfiguration isPlaneBundleAdjustmentEnabled](self, "isPlaneBundleAdjustmentEnabled"));
  uint64_t v8 = [(ARWorldTrackingConfiguration *)self singleShotPlaneCallback];
  [v3 setSingleShotPlaneCallback:v8];

  int v9 = [(ARWorldTrackingConfiguration *)self trackedPlaneCallback];
  [v3 setTrackedPlaneCallback:v9];

  int v10 = [(ARWorldTrackingConfiguration *)self planeDetectionVIOPoseCallback];
  [v3 setPlaneDetectionVIOPoseCallback:v10];

  unsigned int v11 = [(ARWorldTrackingConfiguration *)self planeDetectionPoseUpdateCallback];
  [v3 setPlaneDetectionPoseUpdateCallback:v11];

  objc_msgSend(v3, "setDisableMLRelocalization:", -[ARConfiguration disableMLRelocalization](self, "disableMLRelocalization"));
  objc_msgSend(v3, "setPlaneEstimationShouldUseJasperData:", -[ARWorldTrackingConfiguration shouldUseJasper](self, "shouldUseJasper"));
  return v3;
}

- (int64_t)_depthPrioritization
{
  if ([(ARWorldTrackingConfiguration *)self depthOptimizedForStaticScene]) {
    return 4;
  }
  else {
    return 1;
  }
}

+ (BOOL)supportsUserFaceTracking
{
  if (ARDeviceSupportsUltraWideCamera())
  {
    if ((ARDeviceSupportsMulticamWithTripleRGBStreaming() & 1) == 0) {
      return 0;
    }
  }
  else if (!ARDeviceSupportsMulticamMode())
  {
    return 0;
  }
  return ARUserDefaultsMulticamModeEnabled();
}

+ (BOOL)supportsSceneReconstruction:(ARSceneReconstruction)sceneReconstruction
{
  if (!ARDeviceSupportsJasper()) {
    return sceneReconstruction == 0;
  }
  BOOL result = 1;
  if ((sceneReconstruction & 1) == 0 && (sceneReconstruction & 8) == 0 && (sceneReconstruction & 0x80) == 0) {
    return sceneReconstruction == 0;
  }
  return result;
}

- (void)setSceneReconstruction:(ARSceneReconstruction)sceneReconstruction
{
  if (([(id)objc_opt_class() supportsSceneReconstruction:sceneReconstruction] & 1) == 0)
  {
    id v5 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Scene Reconstruction type not supported by this configuration" userInfo:0];
    objc_exception_throw(v5);
  }
  self->_sceneReconstruction = sceneReconstruction;
}

+ (BOOL)supportsFrameSemantics:(unint64_t)a3
{
  if ((a3 & 7) == 0 && (ARDeviceSupportsJasper() & 1) != 0
    || (a3 & 0x1B) == 0 && (ARAppleNeuralEngine() & 1) != 0
    || (a3 & 0x1C) == 0 && (ARAppleNeuralEngine() & 1) != 0
    || (a3 & 4) == 0 && ARAppleNeuralEngine() && (ARDeviceSupportsJasper() & 1) != 0)
  {
    return 1;
  }
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___ARWorldTrackingConfiguration;
  return objc_msgSendSuper2(&v6, sel_supportsFrameSemantics_, a3);
}

- (void)setSpatialMappingParameters:(ARSpatialMappingParameters)a3
{
  int64_t var1 = a3.var1;
  [(ARSceneReconstructionOptions *)self->_sceneReconstructionOptions setVoxelSize:a3.var0];
  sceneReconstructionOptions = self->_sceneReconstructionOptions;
  [(ARSceneReconstructionOptions *)sceneReconstructionOptions setBucketsCount:var1];
}

- (ARSpatialMappingParameters)spatialMappingParameters
{
  int64_t v3 = [(ARSceneReconstructionOptions *)self->_sceneReconstructionOptions voxelSize];
  int64_t v4 = [(ARSceneReconstructionOptions *)self->_sceneReconstructionOptions bucketsCount];
  int64_t v5 = v3;
  result.int64_t var1 = v4;
  result.var0 = v5;
  return result;
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

- (BOOL)isEqual:(id)a3
{
  id v6 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ARWorldTrackingConfiguration;
  if ([(ARConfiguration *)&v42 isEqual:v6])
  {
    uint64_t v7 = (double *)v6;
    uint64_t v8 = v7;
    if (self->_planeDetection != *((void *)v7 + 18)
      || self->_minVergenceAngle != v7[25]
      || self->_mlModelEnabled != *((unsigned __int8 *)v7 + 118)
      || self->_lowQosSchedulingEnabled != *((unsigned __int8 *)v7 + 119)
      || self->_accuratePlaneExtentCheckEnabled != *((unsigned __int8 *)v7 + 120)
      || self->_deliverRawSceneUnderstandingResults != *((unsigned __int8 *)v7 + 121)
      || (slamConfiguration = self->_slamConfiguration, slamConfiguration != *((NSString **)v8 + 24))
      && !-[NSString isEqual:](slamConfiguration, "isEqual:")
      || self->_environmentTexturing != *((void *)v8 + 17)
      || self->_wantsHDREnvironmentTextures != *((unsigned __int8 *)v8 + 112)
      || self->_relocalizationEnabled != *((unsigned __int8 *)v8 + 117))
    {
      BOOL v13 = 0;
LABEL_18:

      goto LABEL_19;
    }
    int v10 = [(ARWorldTrackingConfiguration *)self initialWorldMap];
    unsigned int v11 = [v8 initialWorldMap];
    if (v10 != v11)
    {
      int64_t v3 = [(ARWorldTrackingConfiguration *)self initialWorldMap];
      int64_t v4 = [v8 initialWorldMap];
      if (![v3 isEqual:v4])
      {
        BOOL v12 = 0;
        goto LABEL_47;
      }
    }
    detectionImages = self->_detectionImages;
    v16 = [v8 detectionImages];
    if ((detectionImages == v16
       || [(NSSet *)self->_detectionImages isEqual:*((void *)v8 + 20)])
      && self->_maximumNumberOfTrackedImages == *((void *)v8 + 21))
    {
      detectionObjects = self->_detectionObjects;
      if (detectionObjects == *((NSSet **)v8 + 22) || -[NSSet isEqual:](detectionObjects, "isEqual:"))
      {
        int automaticImageScaleEstimationEnabled = self->_automaticImageScaleEstimationEnabled;
        if (automaticImageScaleEstimationEnabled == [v8 automaticImageScaleEstimationEnabled])
        {
          int collaborationEnabled = self->_collaborationEnabled;
          if (collaborationEnabled == [v8 isCollaborationEnabled])
          {
            int shouldUseUltraWideIfAvailable = self->_shouldUseUltraWideIfAvailable;
            if (shouldUseUltraWideIfAvailable == [v8 shouldUseUltraWideIfAvailable])
            {
              int userFaceTrackingEnabled = self->_userFaceTrackingEnabled;
              if (userFaceTrackingEnabled == [v8 userFaceTrackingEnabled])
              {
                int depthTemporalSmoothingEnabled = self->_depthTemporalSmoothingEnabled;
                if (depthTemporalSmoothingEnabled == [v8 depthTemporalSmoothingEnabled])
                {
                  int depthOptimizedForStaticScene = self->_depthOptimizedForStaticScene;
                  if (depthOptimizedForStaticScene == [v8 depthOptimizedForStaticScene]
                    && self->_sceneReconstruction == *((void *)v8 + 23))
                  {
                    sceneReconstructionOptions = self->_sceneReconstructionOptions;
                    if (sceneReconstructionOptions == *((ARSceneReconstructionOptions **)v8 + 26)
                      || -[ARSceneReconstructionOptions isEqual:](sceneReconstructionOptions, "isEqual:"))
                    {
                      int alwaysUsePrimaryCameraForTracking = self->_alwaysUsePrimaryCameraForTracking;
                      if (alwaysUsePrimaryCameraForTracking == [v8 alwaysUsePrimaryCameraForTracking])
                      {
                        int disableFrontCamera = self->_disableFrontCamera;
                        if (disableFrontCamera == [v8 disableFrontCamera])
                        {
                          int ignoreAppClipCodeURLLimitation = self->_ignoreAppClipCodeURLLimitation;
                          if (ignoreAppClipCodeURLLimitation == [v8 ignoreAppClipCodeURLLimitation])
                          {
                            int appClipCodeTrackingEnabled = self->_appClipCodeTrackingEnabled;
                            if (appClipCodeTrackingEnabled == [v8 appClipCodeTrackingEnabled])
                            {
                              int64_t appClipCodePerformanceTestingMode = self->_appClipCodePerformanceTestingMode;
                              if (appClipCodePerformanceTestingMode == [v8 appClipCodePerformanceTestingMode])
                              {
                                int recordForGeoTracking = self->_recordForGeoTracking;
                                if (recordForGeoTracking == [v8 recordForGeoTracking])
                                {
                                  int planeBundleAdjustmentEnabled = self->_planeBundleAdjustmentEnabled;
                                  if (planeBundleAdjustmentEnabled == [v8 isPlaneBundleAdjustmentEnabled])
                                  {
                                    id singleShotPlaneCallback = self->_singleShotPlaneCallback;
                                    id v33 = [v8 singleShotPlaneCallback];
                                    if (singleShotPlaneCallback == v33)
                                    {
                                      id trackedPlaneCallback = self->_trackedPlaneCallback;
                                      id v35 = [v8 trackedPlaneCallback];
                                      ARSceneReconstruction v41 = trackedPlaneCallback;
                                      if (trackedPlaneCallback == v35)
                                      {
                                        id planeDetectionVIOPoseCallback = self->_planeDetectionVIOPoseCallback;
                                        id v40 = [v8 planeDetectionVIOPoseCallback];
                                        if (planeDetectionVIOPoseCallback == v40)
                                        {
                                          id planeDetectionPoseUpdateCallback = self->_planeDetectionPoseUpdateCallback;
                                          id v39 = [v8 planeDetectionPoseUpdateCallback];
                                          if (planeDetectionPoseUpdateCallback == v39)
                                          {
                                            int useLidarIfAvailable = self->_useLidarIfAvailable;
                                            BOOL v12 = useLidarIfAvailable == [v8 useLidarIfAvailable];
                                          }
                                          else
                                          {
                                            BOOL v12 = 0;
                                          }
                                        }
                                        else
                                        {
                                          BOOL v12 = 0;
                                        }

                                        BOOL v13 = v12;
LABEL_46:
                                        if (v10 == v11)
                                        {
LABEL_48:

                                          goto LABEL_18;
                                        }
LABEL_47:

                                        BOOL v13 = v12;
                                        goto LABEL_48;
                                      }
                                    }
                                    else
                                    {
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

    BOOL v12 = 0;
    BOOL v13 = 0;
    goto LABEL_46;
  }
  BOOL v13 = 0;
LABEL_19:

  return v13;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v24.receiver = self;
  v24.super_class = (Class)ARWorldTrackingConfiguration;
  int64_t v5 = -[ARConfiguration copyWithZone:](&v24, sel_copyWithZone_);
  v5[18] = self->_planeDetection;
  v5[25] = *(void *)&self->_minVergenceAngle;
  *((unsigned char *)v5 + 118) = self->_mlModelEnabled;
  *((unsigned char *)v5 + 119) = self->_lowQosSchedulingEnabled;
  *((unsigned char *)v5 + 120) = self->_accuratePlaneExtentCheckEnabled;
  *((unsigned char *)v5 + 121) = self->_deliverRawSceneUnderstandingResults;
  uint64_t v6 = [(NSString *)self->_slamConfiguration copyWithZone:a3];
  uint64_t v7 = (void *)v5[24];
  v5[24] = v6;

  v5[17] = self->_environmentTexturing;
  *((unsigned char *)v5 + 112) = self->_wantsHDREnvironmentTextures;
  *((unsigned char *)v5 + 117) = self->_relocalizationEnabled;
  uint64_t v8 = [(ARWorldTrackingConfiguration *)self initialWorldMap];
  [v5 setInitialWorldMap:v8];

  uint64_t v9 = [(NSSet *)self->_detectionImages copyWithZone:a3];
  int v10 = (void *)v5[20];
  v5[20] = v9;

  v5[21] = self->_maximumNumberOfTrackedImages;
  uint64_t v11 = [(NSSet *)self->_detectionObjects copyWithZone:a3];
  BOOL v12 = (void *)v5[22];
  v5[22] = v11;

  *((unsigned char *)v5 + 113) = self->_automaticImageScaleEstimationEnabled;
  *((unsigned char *)v5 + 114) = self->_collaborationEnabled;
  *((unsigned char *)v5 + 115) = self->_userFaceTrackingEnabled;
  *((unsigned char *)v5 + 122) = self->_shouldUseUltraWideIfAvailable;
  *((unsigned char *)v5 + 124) = self->_depthTemporalSmoothingEnabled;
  *((unsigned char *)v5 + 125) = self->_depthOptimizedForStaticScene;
  v5[23] = self->_sceneReconstruction;
  id v13 = [(ARSceneReconstructionOptions *)self->_sceneReconstructionOptions copyWithZone:a3];
  v14 = (void *)v5[26];
  v5[26] = v13;

  *((unsigned char *)v5 + 127) = self->_alwaysUsePrimaryCameraForTracking;
  *((unsigned char *)v5 + 128) = self->_disableFrontCamera;
  *((unsigned char *)v5 + 126) = self->_ignoreAppClipCodeURLLimitation;
  *((unsigned char *)v5 + 116) = self->_appClipCodeTrackingEnabled;
  v5[27] = self->_appClipCodePerformanceTestingMode;
  *((unsigned char *)v5 + 129) = self->_recordForGeoTracking;
  *((unsigned char *)v5 + 130) = self->_planeBundleAdjustmentEnabled;
  uint64_t v15 = MEMORY[0x1BA9C63E0](self->_singleShotPlaneCallback);
  v16 = (void *)v5[28];
  v5[28] = v15;

  uint64_t v17 = MEMORY[0x1BA9C63E0](self->_trackedPlaneCallback);
  int v18 = (void *)v5[29];
  v5[29] = v17;

  uint64_t v19 = MEMORY[0x1BA9C63E0](self->_planeDetectionVIOPoseCallback);
  __int16 v20 = (void *)v5[30];
  v5[30] = v19;

  uint64_t v21 = MEMORY[0x1BA9C63E0](self->_planeDetectionPoseUpdateCallback);
  __int16 v22 = (void *)v5[31];
  v5[31] = v21;

  *((unsigned char *)v5 + 123) = self->_useLidarIfAvailable;
  return v5;
}

- (id)description
{
  int64_t v3 = (void *)MEMORY[0x1E4F28E78];
  int64_t v4 = (objc_class *)objc_opt_class();
  int64_t v5 = NSStringFromClass(v4);
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  uint64_t v7 = [(ARConfiguration *)self descriptionWithoutBrackets];
  [v6 appendString:v7];

  if ([(ARConfiguration *)self isAutoFocusEnabled]) {
    uint64_t v8 = @"Enabled";
  }
  else {
    uint64_t v8 = @"Disabled";
  }
  [v6 appendFormat:@" autoFocus=%@", v8];
  uint64_t v9 = NSStringFromAREnvironmentTexturing(self->_environmentTexturing);
  [v6 appendFormat:@" environmentTexturing=%@", v9];

  if ([(ARWorldTrackingConfiguration *)self wantsHDREnvironmentTextures]) {
    int v10 = @"Enabled";
  }
  else {
    int v10 = @"Disabled";
  }
  [v6 appendFormat:@" wantsHDREnvironmentTextures=%@", v10];
  uint64_t v11 = NSStringFromARPlaneDetection(self->_planeDetection);
  [v6 appendFormat:@" planeDetection=%@", v11];

  if ([(ARWorldTrackingConfiguration *)self isCollaborationEnabled]) {
    BOOL v12 = @"Enabled";
  }
  else {
    BOOL v12 = @"Disabled";
  }
  [v6 appendFormat:@" collaboration=%@", v12];
  if ([(ARWorldTrackingConfiguration *)self userFaceTrackingEnabled]) {
    id v13 = @"Enabled";
  }
  else {
    id v13 = @"Disabled";
  }
  [v6 appendFormat:@" userFaceTracking=%@", v13];
  v14 = NSStringFromARSceneReconstruction([(ARWorldTrackingConfiguration *)self sceneReconstruction]);
  [v6 appendFormat:@" sceneReconstruction=%@", v14];

  uint64_t v15 = [(ARWorldTrackingConfiguration *)self initialWorldMap];

  if (v15)
  {
    v16 = [(ARWorldTrackingConfiguration *)self initialWorldMap];
    [v6 appendFormat:@" initialWorldMap=%@", v16];
  }
  uint64_t v17 = [(ARWorldTrackingConfiguration *)self detectionImages];
  uint64_t v18 = [v17 count];

  if (v18)
  {
    objc_msgSend(v6, "appendFormat:", @" maximumNumberOfTrackedImages=%ld", -[ARWorldTrackingConfiguration maximumNumberOfTrackedImages](self, "maximumNumberOfTrackedImages"));
    if ([(ARWorldTrackingConfiguration *)self automaticImageScaleEstimationEnabled])
    {
      uint64_t v19 = @"Enabled";
    }
    else
    {
      uint64_t v19 = @"Disabled";
    }
    [v6 appendFormat:@" automaticImageScaleEstimation=%@", v19];
    __int16 v20 = [(ARWorldTrackingConfiguration *)self detectionImages];
    uint64_t v21 = [v20 count];
    __int16 v22 = [(ARWorldTrackingConfiguration *)self detectionImages];
    v23 = [v22 allObjects];
    objc_super v24 = objc_msgSend(v23, "ar_map:", &__block_literal_global_114);
    v25 = [v24 componentsJoinedByString:@", "];
    [v6 appendFormat:@" detectionImages=[count: %ld, %@]", v21, v25];
  }
  v26 = [(ARWorldTrackingConfiguration *)self detectionObjects];
  uint64_t v27 = [v26 count];

  if (v27)
  {
    long long v28 = [(ARWorldTrackingConfiguration *)self detectionObjects];
    long long v29 = [v28 allObjects];
    v30 = [v29 componentsJoinedByString:@", "];
    [v6 appendFormat:@" detectionObjects=[%@]", v30];
  }
  objc_msgSend(v6, "appendFormat:", @" useLidarIfAvailable=%d", self->_useLidarIfAvailable);
  if ([(ARWorldTrackingConfiguration *)self appClipCodeTrackingEnabled]) {
    uint64_t v31 = @"Enabled";
  }
  else {
    uint64_t v31 = @"Disabled";
  }
  [v6 appendFormat:@" appClipCodeTracking=%@", v31];
  [v6 appendString:@">"];
  return v6;
}

uint64_t __43__ARWorldTrackingConfiguration_description__block_invoke(uint64_t a1, void *a2)
{
  return [a2 shortDebugDescription];
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

- (ARWorldMap)initialWorldMap
{
  return self->_initialWorldMap;
}

- (void)setInitialWorldMap:(ARWorldMap *)initialWorldMap
{
}

- (NSSet)detectionImages
{
  return self->_detectionImages;
}

- (BOOL)automaticImageScaleEstimationEnabled
{
  return self->_automaticImageScaleEstimationEnabled;
}

- (void)setAutomaticImageScaleEstimationEnabled:(BOOL)automaticImageScaleEstimationEnabled
{
  self->_int automaticImageScaleEstimationEnabled = automaticImageScaleEstimationEnabled;
}

- (NSInteger)maximumNumberOfTrackedImages
{
  return self->_maximumNumberOfTrackedImages;
}

- (NSSet)detectionObjects
{
  return self->_detectionObjects;
}

- (void)setDetectionObjects:(NSSet *)detectionObjects
{
}

- (BOOL)isCollaborationEnabled
{
  return self->_collaborationEnabled;
}

- (void)setCollaborationEnabled:(BOOL)collaborationEnabled
{
  self->_int collaborationEnabled = collaborationEnabled;
}

- (BOOL)userFaceTrackingEnabled
{
  return self->_userFaceTrackingEnabled;
}

- (void)setUserFaceTrackingEnabled:(BOOL)userFaceTrackingEnabled
{
  self->_int userFaceTrackingEnabled = userFaceTrackingEnabled;
}

- (void)setAppClipCodeTrackingEnabled:(BOOL)appClipCodeTrackingEnabled
{
  self->_int appClipCodeTrackingEnabled = appClipCodeTrackingEnabled;
}

- (ARSceneReconstruction)sceneReconstruction
{
  return self->_sceneReconstruction;
}

- (BOOL)relocalizationEnabled
{
  return self->_relocalizationEnabled;
}

- (void)setRelocalizationEnabled:(BOOL)a3
{
  self->_relocalizationEnabled = a3;
}

- (NSString)slamConfiguration
{
  return self->_slamConfiguration;
}

- (void)setSlamConfiguration:(id)a3
{
}

- (double)minVergenceAngle
{
  return self->_minVergenceAngle;
}

- (void)setMinVergenceAngle:(double)a3
{
  self->_minVergenceAngle = a3;
}

- (BOOL)isMLModelEnabled
{
  return self->_mlModelEnabled;
}

- (void)setMlModelEnabled:(BOOL)a3
{
  self->_mlModelEnabled = a3;
}

- (BOOL)isLowQosSchedulingEnabled
{
  return self->_lowQosSchedulingEnabled;
}

- (void)setLowQosSchedulingEnabled:(BOOL)a3
{
  self->_lowQosSchedulingEnabled = a3;
}

- (BOOL)isAccuratePlaneExtentCheckEnabled
{
  return self->_accuratePlaneExtentCheckEnabled;
}

- (void)setAccuratePlaneExtentCheckEnabled:(BOOL)a3
{
  self->_BOOL accuratePlaneExtentCheckEnabled = a3;
}

- (BOOL)deliverRawSceneUnderstandingResults
{
  return self->_deliverRawSceneUnderstandingResults;
}

- (void)setDeliverRawSceneUnderstandingResults:(BOOL)a3
{
  self->_deliverRawSceneUnderstandingResults = a3;
}

- (BOOL)shouldUseUltraWideIfAvailable
{
  return self->_shouldUseUltraWideIfAvailable;
}

- (void)setShouldUseUltraWideIfAvailable:(BOOL)a3
{
  self->_int shouldUseUltraWideIfAvailable = a3;
}

- (BOOL)useLidarIfAvailable
{
  return self->_useLidarIfAvailable;
}

- (void)setUseLidarIfAvailable:(BOOL)a3
{
  self->_int useLidarIfAvailable = a3;
}

- (BOOL)depthTemporalSmoothingEnabled
{
  return self->_depthTemporalSmoothingEnabled;
}

- (void)setDepthTemporalSmoothingEnabled:(BOOL)a3
{
  self->_int depthTemporalSmoothingEnabled = a3;
}

- (BOOL)depthOptimizedForStaticScene
{
  return self->_depthOptimizedForStaticScene;
}

- (void)setDepthOptimizedForStaticScene:(BOOL)a3
{
  self->_int depthOptimizedForStaticScene = a3;
}

- (ARSceneReconstructionOptions)sceneReconstructionOptions
{
  return self->_sceneReconstructionOptions;
}

- (void)setSceneReconstructionOptions:(id)a3
{
}

- (BOOL)ignoreAppClipCodeURLLimitation
{
  return self->_ignoreAppClipCodeURLLimitation;
}

- (void)setIgnoreAppClipCodeURLLimitation:(BOOL)a3
{
  self->_int ignoreAppClipCodeURLLimitation = a3;
}

- (int64_t)appClipCodePerformanceTestingMode
{
  return self->_appClipCodePerformanceTestingMode;
}

- (void)setAppClipCodePerformanceTestingMode:(int64_t)a3
{
  self->_int64_t appClipCodePerformanceTestingMode = a3;
}

- (BOOL)alwaysUsePrimaryCameraForTracking
{
  return self->_alwaysUsePrimaryCameraForTracking;
}

- (void)setAlwaysUsePrimaryCameraForTracking:(BOOL)a3
{
  self->_int alwaysUsePrimaryCameraForTracking = a3;
}

- (BOOL)disableFrontCamera
{
  return self->_disableFrontCamera;
}

- (void)setDisableFrontCamera:(BOOL)a3
{
  self->_int disableFrontCamera = a3;
}

- (BOOL)recordForGeoTracking
{
  return self->_recordForGeoTracking;
}

- (void)setRecordForGeoTracking:(BOOL)a3
{
  self->_int recordForGeoTracking = a3;
}

- (BOOL)isPlaneBundleAdjustmentEnabled
{
  return self->_planeBundleAdjustmentEnabled;
}

- (void)setPlaneBundleAdjustmentEnabled:(BOOL)a3
{
  self->_int planeBundleAdjustmentEnabled = a3;
}

- (id)singleShotPlaneCallback
{
  return self->_singleShotPlaneCallback;
}

- (void)setSingleShotPlaneCallback:(id)a3
{
}

- (id)trackedPlaneCallback
{
  return self->_trackedPlaneCallback;
}

- (void)setTrackedPlaneCallback:(id)a3
{
}

- (id)planeDetectionVIOPoseCallback
{
  return self->_planeDetectionVIOPoseCallback;
}

- (void)setPlaneDetectionVIOPoseCallback:(id)a3
{
}

- (id)planeDetectionPoseUpdateCallback
{
  return self->_planeDetectionPoseUpdateCallback;
}

- (void)setPlaneDetectionPoseUpdateCallback:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_planeDetectionPoseUpdateCallback, 0);
  objc_storeStrong(&self->_planeDetectionVIOPoseCallback, 0);
  objc_storeStrong(&self->_trackedPlaneCallback, 0);
  objc_storeStrong(&self->_singleShotPlaneCallback, 0);
  objc_storeStrong((id *)&self->_sceneReconstructionOptions, 0);
  objc_storeStrong((id *)&self->_slamConfiguration, 0);
  objc_storeStrong((id *)&self->_detectionObjects, 0);
  objc_storeStrong((id *)&self->_detectionImages, 0);
  objc_storeStrong((id *)&self->_initialWorldMap, 0);
}

@end