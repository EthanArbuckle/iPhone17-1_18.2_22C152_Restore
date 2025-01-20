@interface ARWorldTrackingTechnique
+ (BOOL)isSupported;
+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3;
+ (BOOL)supportsVideoResolution:(CGSize)a3 forDeviceType:(id)a4;
- (ARSceneReconstructionHandler)sceneReconstructionHandler;
- (ARTrackedRaycastPostProcessor)trackedRaycastPostProcessor;
- (ARWorldMap)serializeWorldMapWithReferenceOrigin:(double)a3;
- (ARWorldTrackingOptions)mutableOptions;
- (ARWorldTrackingOptions)options;
- (ARWorldTrackingTechnique)init;
- (ARWorldTrackingTechnique)initWithOptions:(id)a3;
- (BOOL)_isBravoCamOtherThanWideUsed;
- (BOOL)_isRelocalizing;
- (BOOL)deterministicMode;
- (BOOL)hasLoadedSurfaceData;
- (BOOL)hasQualityKeyframe;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMultiSessionMode;
- (BOOL)querySceneReconstructionOccupancyWithPoints:(id)a3 callback:(id)a4;
- (BOOL)reconfigurableFrom:(id)a3;
- (CV3DPosePredictionContext)predictorHandle;
- (CV3DSLAMSession)slamSessionHandle;
- (__n128)reconstructionFrameBundleToWorld;
- (__n128)setReconstructionFrameBundleToWorld:(__n128)a3;
- (double)extrinsicsToWideSensor;
- (double)referenceOriginTransform;
- (double)requiredTimeInterval;
- (id).cxx_construct;
- (id)_featurePointDataFromSLAMState:(const CV3DSLAMStateContext *)a3;
- (id)_fullDescription;
- (id)getObservers;
- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4;
- (id)processData:(id)a3;
- (id)raycast:(id)a3;
- (id)raycastResultFrom:(CV3DHitTestResult *)a3;
- (id)resultDataClasses;
- (id)serializeSurfaceData;
- (id)trackedRaycast:(id)a3 updateHandler:(id)a4;
- (int)_updatePoseData:(id)x2_0 forTimeStamp:(double)a4 updateTrackingState:(BOOL)a5;
- (int)extentCheckFromConfiguration;
- (int64_t)_initializeSLAMAndPredictorHandle;
- (int64_t)_mappingStatusFromMapSize:(int)a3 keyframeQuality:(int)a4 isTrackingMap:(BOOL)a5 timestamp:(double)a6;
- (int64_t)captureBehavior;
- (int64_t)vioHandleState;
- (shared_ptr<PlaneDetectionSession>)planeDetectionSession;
- (shared_ptr<RaycastSession>)raycastSession;
- (unint64_t)requiredSensorDataTypes;
- (unint64_t)techniqueIndex;
- (unint64_t)vioSessionIdentifier;
- (unsigned)CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:(int64_t)a3;
- (unsigned)_trackingCameraID:(CV3DSLAMStateContext *)a3;
- (void)_configureMeshPlaneHarmonization;
- (void)_didFailWithError:(id)a3;
- (void)_handleCV3DError:(__CFError *)a3 withDescription:(id)a4 failTechnique:(BOOL)a5;
- (void)_handlePlaneDetectionCallback:(CV3DPlaneDetectionPlaneList *)a3;
- (void)_handleRaycastResultCallback:(CV3DRaycastResultMap *)a3;
- (void)_handleSLAMError:(id)a3;
- (void)_handleSingleShotPlaneDetectionCallback:(CV3DPlaneDetectionSingleShotPlaneList *)a3;
- (void)_initializeSurfaceDetection:(const PlaneDetectionConfiguration *)a3;
- (void)_pushWTResultDataForTimestamp:(double)a3;
- (void)_reconfigureSceneReconstruction;
- (void)_removeAllMeshAnchors;
- (void)_reportCollaborationData:(id)a3 type:(unsigned __int8)a4 metadata:(const void *)a5;
- (void)_resetSurfaceDetection;
- (void)_setupSceneReconstruction;
- (void)_startSceneReconstruction;
- (void)_updateTrackingState:(id)a3 slamState:(const CV3DSLAMStateContext *)a4;
- (void)_updateVIOLineDetectionPolicy;
- (void)addObserver:(id)a3;
- (void)addReferenceAnchors:(id)a3;
- (void)annotateDepth:(id)a3 withSemantics:(id)a4 toTargetSemanticsImage:(__CVBuffer *)a5 targetConfidenceBuffer:(__CVBuffer *)a6 targetUncertaintyBuffer:(__CVBuffer *)a7;
- (void)annotateDepth:(id)a3 withSemantics:(id)a4 toTargetSemanticsImage:(__CVBuffer *)a5 targetConfidenceBuffer:(__CVBuffer *)a6 targetUncertaintyBuffer:(__CVBuffer *)a7 useGpu:(BOOL)a8;
- (void)clearMap;
- (void)dealloc;
- (void)didReceiveKeyframesUpdatedCallback:(CV3DReconKeyframeList *)a3;
- (void)didUpdateRaycastResult:(CV3DHitTestResults *)a3;
- (void)invalidateAllRaycasts;
- (void)loadSurfaceData:(id)a3;
- (void)mergeResultData:(id)a3 intoData:(id)a4 context:(id)a5;
- (void)onMetadataCallback:(CV3DSLAMStateContext *)a3;
- (void)prepare:(BOOL)a3;
- (void)prepareResultData:(id)a3 forContext:(id)a4;
- (void)pushCollaborationData:(id)a3;
- (void)pushToHitTestingDepth:(id)a3 pose:(id)a4;
- (void)pushToSceneUnderstandingDepth:(id)a3 segmentation:(id)a4 pose:(id)a5;
- (void)pushToSceneUnderstandingSegmentation:(id)a3 pose:(id)a4;
- (void)reconfigureFrom:(id)a3;
- (void)removeObserver:(id)a3;
- (void)removePlanesByUUIDs:(id)a3;
- (void)removeReferenceAnchors:(id)a3;
- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4;
- (void)resetSceneReconstruction;
- (void)sceneReconstructionHandler:(id)a3 didFailWithError:(id)a4;
- (void)sceneReconstructionHandler:(id)a3 didOutputKeyframeList:(CV3DReconKeyframeList *)a4 withTimestamp:(double)a5;
- (void)sceneReconstructionHandler:(id)a3 didOutputMeshList:(CV3DReconMeshList *)a4 withTimestamp:(double)a5;
- (void)setExtrinsicsToWideSensor:(__n128)a3;
- (void)setHasQualityKeyframe:(BOOL)a3;
- (void)setMutableOptions:(id)a3;
- (void)setPlaneDetectionSession:(shared_ptr<PlaneDetectionSession>)a3;
- (void)setPredictorHandle:(CV3DPosePredictionContext *)a3;
- (void)setRaycastSession:(shared_ptr<RaycastSession>)a3;
- (void)setReferenceOriginTransform:(__n128)a3;
- (void)setSlamSessionHandle:(CV3DSLAMSession *)a3;
- (void)setTechniqueIndex:(unint64_t)a3;
- (void)setTrackedRaycastPostProcessor:(id)a3;
- (void)stopAllRaycasts;
- (void)stopRaycast:(id)a3;
- (void)updateSurfaceDetectionConfiguration;
@end

@implementation ARWorldTrackingTechnique

+ (BOOL)isSupported
{
  if (+[ARWorldTrackingTechnique isSupported]::onceToken != -1) {
    dispatch_once(&+[ARWorldTrackingTechnique isSupported]::onceToken, &__block_literal_global_36);
  }
  return +[ARWorldTrackingTechnique isSupported]::supported;
}

uint64_t __39__ARWorldTrackingTechnique_isSupported__block_invoke()
{
  uint64_t result = CV3DVIOIsVideoModeSupported();
  +[ARWorldTrackingTechnique isSupported]::supported = result == *MEMORY[0x1E4F4D490];
  return result;
}

+ (BOOL)supportsVideoResolution:(CGSize)a3 forDeviceType:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  id v6 = a4;
  {
    +[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution = *MEMORY[0x1E4F1DB30];
  }
  {
    +[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution = *MEMORY[0x1E4F1DB30];
  }
  if (+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::onceToken[0] != -1) {
    dispatch_once(+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::onceToken, &__block_literal_global_9);
  }
  if ((id)*MEMORY[0x1E4F15830] == v6
    && (*(double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution == width
      ? (BOOL v7 = *((double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution
              + 1) == height)
      : (BOOL v7 = 0),
        v7)
    || (id v8 = (id)*MEMORY[0x1E4F15828], (id)*MEMORY[0x1E4F15828] == v6)
    && (*(double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution == width
      ? (BOOL v9 = *((double *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution
              + 1) == height)
      : (BOOL v9 = 0),
        v9))
  {
    BOOL v10 = 1;
  }
  else if (ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v6))
  {
    if (width == 640.0 && height == 480.0
      || width == 1280.0 && height == 720.0
      || width == 1440.0 && height == 1080.0
      || width == 1920.0 && height == 1080.0
      || (BOOL v10 = 0, width == 1920.0) && height == 1440.0)
    {
LABEL_38:
      BOOL v10 = CV3DVIOIsVideoModeSupported() == *MEMORY[0x1E4F4D490];
    }
  }
  else if (v8 == v6)
  {
    if (width == 640.0 && height == 480.0) {
      goto LABEL_38;
    }
    BOOL v10 = 0;
    if (width == 1920.0 && height == 1440.0) {
      goto LABEL_38;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __66__ARWorldTrackingTechnique_supportsVideoResolution_forDeviceType___block_invoke()
{
  v0 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.worldtracking.calibrationParameters.back.wide"];
  if (v0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v1 = [v0 objectForKeyedSubscript:ARWorldTrackingBackWideCalibrationParametersKeyImageWidth];
      [v1 doubleValue];
      uint64_t v3 = v2;

      v4 = [v0 objectForKeyedSubscript:ARWorldTrackingBackWideCalibrationParametersKeyImageHeight];
      [v4 doubleValue];
      uint64_t v6 = v5;

      *(void *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution = v3;
      *((void *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customWideVideoResolution + 1) = v6;
    }
  }
  v15 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.worldtracking.calibrationParameters.back.ultrawide"];

  BOOL v7 = v15;
  if (v15)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    BOOL v7 = v15;
    if (isKindOfClass)
    {
      BOOL v9 = [v15 objectForKeyedSubscript:ARWorldTrackingBackWideCalibrationParametersKeyImageWidth];
      [v9 doubleValue];
      uint64_t v11 = v10;

      v12 = [v15 objectForKeyedSubscript:ARWorldTrackingBackWideCalibrationParametersKeyImageHeight];
      [v12 doubleValue];
      uint64_t v14 = v13;

      *(void *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution = v11;
      *((void *)&+[ARWorldTrackingTechnique supportsVideoResolution:forDeviceType:]::customUltraWideVideoResolution + 1) = v14;
      BOOL v7 = v15;
    }
  }
}

- (ARWorldTrackingTechnique)init
{
  uint64_t v3 = objc_opt_new();
  v4 = [(ARWorldTrackingTechnique *)self initWithOptions:v3];

  return v4;
}

- (ARWorldTrackingTechnique)initWithOptions:(id)a3
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v96.receiver = self;
  v96.super_class = (Class)ARWorldTrackingTechnique;
  uint64_t v5 = [(ARImageBasedTechnique *)&v96 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v5->_observers;
    v5->_observers = (NSHashTable *)v6;

    dispatch_semaphore_t v8 = dispatch_semaphore_create(1);
    observersSemaphore = v5->_observersSemaphore;
    v5->_observersSemaphore = (OS_dispatch_semaphore *)v8;

    uint64_t v10 = [v4 copy];
    mutableOptions = v5->_mutableOptions;
    v5->_mutableOptions = (ARWorldTrackingOptions *)v10;

    dispatch_semaphore_t v12 = dispatch_semaphore_create(1);
    resultSemaphore = v5->_resultSemaphore;
    v5->_resultSemaphore = (OS_dispatch_semaphore *)v12;

    dispatch_semaphore_t v14 = dispatch_semaphore_create(1);
    sessionHandleStateSemaphore = v5->_sessionHandleStateSemaphore;
    v5->_sessionHandleStateSemaphore = (OS_dispatch_semaphore *)v14;

    v5->_surfaceDetectionSessionLock._os_unfair_lock_opaque = 0;
    v5->_raycastSessionLock._os_unfair_lock_opaque = 0;
    if ([(id)objc_opt_class() isSupported])
    {
      v5->_lastRelocalizationTimestamp = 0.0;
      v5->_relocalizationState = 0;
      v5->_wasEverInNominalState = 0;
      uint64_t v16 = [MEMORY[0x1E4F1CA80] set];
      anchorsReceived = v5->_anchorsReceived;
      v5->_anchorsReceived = (NSMutableSet *)v16;

      uint64_t v18 = [MEMORY[0x1E4F1CA80] set];
      participantAnchors = v5->_participantAnchors;
      v5->_participantAnchors = (NSMutableSet *)v18;

      v5->_participantAnchorsEnabled = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.participantAnchors"];
      v5->_resultLatency = 0.008;
      v20 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.worldTracking.resultLatency"];
      v21 = v20;
      if (v20)
      {
        [(ARWorldTrackingTechnique *)v20 doubleValue];
        v5->_resultLatency = v22 * 0.001;
      }
      v23 = _ARLogTechnique();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = (objc_class *)objc_opt_class();
        v25 = NSStringFromClass(v24);
        double v26 = v5->_resultLatency * 1000.0;
        *(_DWORD *)buf = 138543874;
        v98 = v25;
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2048;
        *(double *)&long long v102 = v26;
        _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_INFO, "%{public}@ <%p>: World tracking result latency %fms", buf, 0x20u);
      }
      CV3DGetVersionInfo();
      v27 = _ARLogTechnique();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        v28 = (objc_class *)objc_opt_class();
        v29 = NSStringFromClass(v28);
        *(_DWORD *)buf = 138544386;
        v98 = v29;
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 1024;
        LODWORD(v102) = 0;
        WORD2(v102) = 1024;
        *(_DWORD *)((char *)&v102 + 6) = 0;
        WORD5(v102) = 1024;
        HIDWORD(v102) = 0;
        _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: AppleCV3D version %u.%u.%u", buf, 0x28u);
      }
      v5->_sessionHandleState = 1;
      v30 = _ARLogTechnique();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        v31 = (objc_class *)objc_opt_class();
        v32 = NSStringFromClass(v31);
        predictorHandle = v5->_predictorHandle;
        *(_DWORD *)buf = 138543874;
        v98 = v32;
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2048;
        *(void *)&long long v102 = predictorHandle;
        _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Created pose predictor handle: %p", buf, 0x20u);
      }
      v34 = [(ARWorldTrackingOptions *)v5->_mutableOptions imageSensorSettings];
      v35 = [v34 videoFormat];
      v95 = [v35 captureDeviceType];

      if (v95) {
        unsigned int v36 = -[ARWorldTrackingOptions cameraIdForCaptureDeviceType:](v5->_mutableOptions, "cameraIdForCaptureDeviceType:");
      }
      else {
        unsigned int v36 = 0;
      }
      v5->_unsigned int visualizationCameraID = v36;
      v37 = _ARLogTechnique();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        v38 = (objc_class *)objc_opt_class();
        v39 = NSStringFromClass(v38);
        unsigned int visualizationCameraID = v5->_visualizationCameraID;
        *(_DWORD *)buf = 138544130;
        v98 = v39;
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 1024;
        LODWORD(v102) = visualizationCameraID;
        WORD2(v102) = 2112;
        *(void *)((char *)&v102 + 6) = v95;
        _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking visualization camera identifier: %u, visualization capture device type: %@", buf, 0x26u);
      }
      v5->_BOOL useFixedIntrinsics = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldtracking.fixedIntrinsics"];
      v41 = _ARLogTechnique();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
      {
        v42 = (objc_class *)objc_opt_class();
        v43 = NSStringFromClass(v42);
        BOOL useFixedIntrinsics = v5->_useFixedIntrinsics;
        *(_DWORD *)buf = 138543874;
        v98 = v43;
        if (useFixedIntrinsics) {
          v45 = @"fixed";
        }
        else {
          v45 = @"varying";
        }
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2112;
        *(void *)&long long v102 = v45;
        _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking will use %@ intrinsics", buf, 0x20u);
      }
      v5->_BOOL shouldPushVisionDataIntrinsics = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldtracking.pushVisionDataIntrinsics"];
      v46 = _ARLogTechnique();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        v47 = (objc_class *)objc_opt_class();
        v48 = NSStringFromClass(v47);
        BOOL shouldPushVisionDataIntrinsics = v5->_shouldPushVisionDataIntrinsics;
        *(_DWORD *)buf = 138543874;
        v98 = v48;
        if (shouldPushVisionDataIntrinsics) {
          v50 = &stru_1F120C8F0;
        }
        else {
          v50 = @"not ";
        }
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2112;
        *(void *)&long long v102 = v50;
        _os_log_impl(&dword_1B88A2000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking will %@push vision data intrinsics", buf, 0x20u);
      }
      v5->_BOOL shouldUseFullResolutionVisionDataIntrinsics = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldtracking.useFullResolutionVisionDataIntrinsics"];
      v51 = _ARLogTechnique();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
      {
        v52 = (objc_class *)objc_opt_class();
        v53 = NSStringFromClass(v52);
        BOOL shouldUseFullResolutionVisionDataIntrinsics = v5->_shouldUseFullResolutionVisionDataIntrinsics;
        *(_DWORD *)buf = 138543874;
        v98 = v53;
        if (shouldUseFullResolutionVisionDataIntrinsics) {
          v55 = &stru_1F120C8F0;
        }
        else {
          v55 = @"not ";
        }
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2112;
        *(void *)&long long v102 = v55;
        _os_log_impl(&dword_1B88A2000, v51, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking will %@push scale vision intrinsics for full resolution", buf, 0x20u);
      }
      +[ARKitUserDefaults doubleForKey:@"com.apple.arkit.worldtracking.minVergenceAngle"];
      double v57 = v56;
      v5->_minVergenceAngleCosine = cos(v56 * 3.14159265 / 180.0);
      v58 = _ARLogTechnique();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
      {
        v59 = (objc_class *)objc_opt_class();
        v60 = NSStringFromClass(v59);
        *(_DWORD *)buf = 138543874;
        v98 = v60;
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2048;
        *(double *)&long long v102 = v57;
        _os_log_impl(&dword_1B88A2000, v58, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking will use %.03f° as minimum vergence angle threshold", buf, 0x20u);
      }
      v5->_BOOL allowPoseGraphUpdates = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldtracking.poseGraphUpdates"];
      v61 = _ARLogTechnique();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        v62 = (objc_class *)objc_opt_class();
        v63 = NSStringFromClass(v62);
        BOOL allowPoseGraphUpdates = v5->_allowPoseGraphUpdates;
        *(_DWORD *)buf = 138543874;
        v98 = v63;
        if (allowPoseGraphUpdates) {
          v65 = @"allowed";
        }
        else {
          v65 = @"disallowed";
        }
        __int16 v99 = 2048;
        v100 = v5;
        __int16 v101 = 2112;
        *(void *)&long long v102 = v65;
        _os_log_impl(&dword_1B88A2000, v61, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking pose graph update custom setting: %@", buf, 0x20u);
      }
      v66 = v5->_mutableOptions;
      uint64_t v67 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.planeEstimation.minDetectionCount"];
      uint64_t v68 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.planeEstimation.minVergenceAngle"];
      uint64_t v69 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.planeEstimation.lineFeaturesAlwaysOn"];
      BOOL v70 = [(ARWorldTrackingTechnique *)v5 deterministicMode];
      uint64_t v71 = +[ARKitUserDefaults stringForKey:@"com.apple.arkit.planeEstimation.detectionMethod"];
      options = v5->_surfaceDetectionParametrization.options;
      v5->_surfaceDetectionParametrization.options = v66;

      detectionCountUserDefaultValue = v5->_surfaceDetectionParametrization.detectionCountUserDefaultValue;
      v5->_surfaceDetectionParametrization.detectionCountUserDefaultValue = (NSNumber *)v67;

      minVergenceAngleDegreesUserDefaultValue = v5->_surfaceDetectionParametrization.minVergenceAngleDegreesUserDefaultValue;
      v5->_surfaceDetectionParametrization.minVergenceAngleDegreesUserDefaultValue = (NSNumber *)v68;

      lineFeaturesAlwaysOnUserDefaultValue = v5->_surfaceDetectionParametrization.lineFeaturesAlwaysOnUserDefaultValue;
      v5->_surfaceDetectionParametrization.lineFeaturesAlwaysOnUserDefaultValue = (deterministicMode *)v69;

      v5->_surfaceDetectionParametrization.var0 = v70;
      detectionPolicyString = v5->_surfaceDetectionParametrization.detectionPolicyString;
      v5->_surfaceDetectionParametrization.detectionPolicyString = (NSString *)v71;

      uint64_t v77 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.worldTracking.resultData");
      resultDataQueue = v5->_resultDataQueue;
      v5->_resultDataQueue = (OS_dispatch_queue *)v77;

      if (ARDeviceSupportsJasper())
      {
        uint64_t v79 = [MEMORY[0x1E4F1CA48] array];
        latestSpatialMappingData = v5->_latestSpatialMappingData;
        v5->_latestSpatialMappingData = (NSMutableArray *)v79;

        v5->_latestSpatialMappingDataLock._os_unfair_lock_opaque = 0;
        v81 = (MTLDevice *)MTLCreateSystemDefaultDevice();
        sharedMetalDevice = v5->_sharedMetalDevice;
        v5->_sharedMetalDevice = v81;

        uint64_t v83 = [(MTLDevice *)v5->_sharedMetalDevice newCommandQueue];
        spatialMappingCommandQueue = v5->_spatialMappingCommandQueue;
        v5->_spatialMappingCommandQueue = (MTLCommandQueue *)v83;

        uint64_t v85 = [MEMORY[0x1E4F1CA60] dictionary];
        spatialMappingPointClouds = v5->_spatialMappingPointClouds;
        v5->_spatialMappingPointClouds = (NSMutableDictionary *)v85;

        v5->_spatialMappingPointCloudsLock._os_unfair_lock_opaque = 0;
        v87 = ARKitCoreBundle();
        v88 = [v87 URLForResource:@"default" withExtension:@"metallib"];

        v89 = (void *)[(MTLDevice *)v5->_sharedMetalDevice newLibraryWithURL:v88 error:0];
        uint64_t v90 = [v89 newFunctionWithName:@"annotateDepthData"];
        annotateDepthDataKernelFunction = v5->_annotateDepthDataKernelFunction;
        v5->_annotateDepthDataKernelFunction = (MTLFunction *)v90;

        uint64_t v92 = [MEMORY[0x1E4F1CA60] dictionary];
        spatialMappingResultDataWaitingForSemantics = v5->_spatialMappingResultDataWaitingForSemantics;
        v5->_spatialMappingResultDataWaitingForSemantics = (NSMutableDictionary *)v92;
      }
    }
    else
    {
      v21 = v5;
      uint64_t v5 = 0;
    }
  }
  return v5;
}

- (ARWorldTrackingOptions)options
{
  uint64_t v2 = [(ARWorldTrackingTechnique *)self mutableOptions];
  uint64_t v3 = (void *)[v2 copy];

  return (ARWorldTrackingOptions *)v3;
}

- (int64_t)vioHandleState
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  int64_t sessionHandleState = self->_sessionHandleState;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  return sessionHandleState;
}

- (void)dealloc
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  depth16grayBufferPool = self->_depth16grayBufferPool;
  if (depth16grayBufferPool)
  {
    CVPixelBufferPoolRelease(depth16grayBufferPool);
    self->_depth16grayBufferPool = 0;
  }
  confidence8BufferPool = self->_confidence8BufferPool;
  if (confidence8BufferPool)
  {
    CVPixelBufferPoolRelease(confidence8BufferPool);
    self->_confidence8BufferPool = 0;
  }
  poolForSemanticsAnnotatedDepth = self->_poolForSemanticsAnnotatedDepth;
  if (poolForSemanticsAnnotatedDepth)
  {
    CVPixelBufferPoolRelease(poolForSemanticsAnnotatedDepth);
    self->_poolForSemanticsAnnotatedDepth = 0;
  }
  poolForConfidenceAnnotatedDepth = self->_poolForConfidenceAnnotatedDepth;
  if (poolForConfidenceAnnotatedDepth)
  {
    CVPixelBufferPoolRelease(poolForConfidenceAnnotatedDepth);
    self->_poolForConfidenceAnnotatedDepth = 0;
  }
  poolForUncertaintyAnnotatedDepth = self->_poolForUncertaintyAnnotatedDepth;
  if (poolForUncertaintyAnnotatedDepth)
  {
    CVPixelBufferPoolRelease(poolForUncertaintyAnnotatedDepth);
    self->_poolForUncertaintyAnnotatedDepth = 0;
  }
  poolForUncertaintyMaskedSemanticsDepth = self->_poolForUncertaintyMaskedSemanticsDepth;
  if (poolForUncertaintyMaskedSemanticsDepth)
  {
    CVPixelBufferPoolRelease(poolForUncertaintyMaskedSemanticsDepth);
    self->_poolForUncertaintyMaskedSemanticsDepth = 0;
  }
  os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
  cntrl = self->_planeDetectionSession.__cntrl_;
  self->_planeDetectionSession.__ptr_ = 0;
  self->_planeDetectionSession.__cntrl_ = 0;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
  os_unfair_lock_lock(&self->_raycastSessionLock);
  uint64_t v10 = self->_raycastSession.__cntrl_;
  self->_raycastSession.__ptr_ = 0;
  self->_raycastSession.__cntrl_ = 0;
  if (v10) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v10);
  }
  os_unfair_lock_unlock(&self->_raycastSessionLock);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_slamSessionHandle)
  {
    uint64_t v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      dispatch_semaphore_t v12 = (objc_class *)objc_opt_class();
      uint64_t v13 = NSStringFromClass(v12);
      slamSessionHandle = self->_slamSessionHandle;
      *(_DWORD *)buf = 138543874;
      v27 = v13;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2048;
      v31 = slamSessionHandle;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing SLAM handle: %p …", buf, 0x20u);
    }
    CV3DSLAMSessionWait();
    CV3DSLAMSessionRelease();
    self->_slamSessionHandle = 0;
    self->_int64_t sessionHandleState = 0;
    v15 = _ARLogTechnique();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = (objc_class *)objc_opt_class();
      v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      __int16 v28 = 2048;
      v29 = self;
      _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: SLAM handle released", buf, 0x16u);
    }
  }
  if (self->_predictorHandle)
  {
    uint64_t v18 = _ARLogTechnique();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      v19 = (objc_class *)objc_opt_class();
      v20 = NSStringFromClass(v19);
      predictorHandle = self->_predictorHandle;
      *(_DWORD *)buf = 138543874;
      v27 = v20;
      __int16 v28 = 2048;
      v29 = self;
      __int16 v30 = 2048;
      v31 = predictorHandle;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Releasing predictor handle: %p …", buf, 0x20u);
    }
    CV3DPosePredictionRelease();
    self->_predictorHandle = 0;
    double v22 = _ARLogTechnique();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v23 = (objc_class *)objc_opt_class();
      v24 = NSStringFromClass(v23);
      *(_DWORD *)buf = 138543618;
      v27 = v24;
      __int16 v28 = 2048;
      v29 = self;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Predictor handle released", buf, 0x16u);
    }
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  v25.receiver = self;
  v25.super_class = (Class)ARWorldTrackingTechnique;
  [(ARWorldTrackingTechnique *)&v25 dealloc];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ARWorldTrackingTechnique;
  if ([(ARTechnique *)&v10 isEqual:v4])
  {
    id v5 = v4;
    uint64_t v6 = [(ARWorldTrackingTechnique *)self mutableOptions];
    BOOL v7 = [v5 mutableOptions];
    char v8 = [v6 isEqual:v7];
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)_fullDescription
{
  uint64_t v3 = (void *)MEMORY[0x1E4F28E78];
  v10.receiver = self;
  v10.super_class = (Class)ARWorldTrackingTechnique;
  id v4 = [(ARImageBasedTechnique *)&v10 _fullDescription];
  id v5 = [v3 stringWithFormat:@"%@\n", v4];

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0))
  {
    uint64_t v6 = @"Busy";
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    uint64_t v6 = @"NotBusy";
  }
  [v5 appendFormat:@"\tResult is %@\n", v6];
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0))
  {
    BOOL v7 = @"Busy";
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
    BOOL v7 = @"NotBusy";
  }
  [v5 appendFormat:@"\tState is %@\n", v7];
  objc_msgSend(v5, "appendFormat:", @"\tslamSessionHandle state(%li)\n", self->_sessionHandleState);
  objc_msgSend(v5, "appendFormat:", @"\tpredictorHandle state(%li)\n", self->_predictorHandle);
  objc_msgSend(v5, "appendFormat:", @"\tresult latency(%lf)\n", *(void *)&self->_resultLatency);
  objc_msgSend(v5, "appendFormat:", @"\tkeyframe count(%d)\n", self->_previousKeyframeCount);
  if (self->_hasQualityKeyframe) {
    char v8 = @"YES";
  }
  else {
    char v8 = @"NO";
  }
  [v5 appendFormat:@"\tQualityKeyframe: %@\n", v8];
  objc_msgSend(v5, "appendFormat:", @"\tQualityKeyframeTimestamp(%lf)\n", *(void *)&self->_lastQualityKeyframeTimestamp);
  objc_msgSend(v5, "appendFormat:", @"\tReinitializationAttempts(%i)\n", self->_reinitializationAttempts);
  objc_msgSend(v5, "appendFormat:", @"\tReinitializationAttemptsAtInitialization(%li)\n", self->_reinitializationAttemptsAtInitialization);
  objc_msgSend(v5, "appendFormat:", @"\tLastRelocalizationTimestamp(%lf)\n", *(void *)&self->_lastRelocalizationTimestamp);
  objc_msgSend(v5, "appendFormat:", @"\tOriginTimestamp(%lf)\n", *(void *)&self->_originTimestamp);
  [v5 appendFormat:@"\tErrorData: %@\n", self->_errorData];
  return v5;
}

- (unint64_t)requiredSensorDataTypes
{
  uint64_t v3 = [(ARWorldTrackingTechnique *)self mutableOptions];
  id v4 = [v3 slamConfiguration];
  if ([v4 isEqualToString:@"CoreLocationIntegration"])
  {

    return 71;
  }
  id v5 = [(ARWorldTrackingTechnique *)self mutableOptions];
  int v6 = [v5 recordForGeoTracking];

  if (v6) {
    return 71;
  }
  return 7;
}

- (int64_t)captureBehavior
{
  return 1;
}

- (BOOL)deterministicMode
{
  uint64_t v2 = [(ARWorldTrackingTechnique *)self mutableOptions];
  char v3 = [v2 deterministicMode];

  return v3;
}

- (double)requiredTimeInterval
{
  return self->_resultLatency;
}

- (id)resultDataClasses
{
  uint64_t v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  return (id)objc_msgSend(v2, "setWithObjects:", v3, v4, v5, objc_opt_class(), 0);
}

- (void)_handleCV3DError:(__CFError *)a3 withDescription:(id)a4 failTechnique:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  BOOL v9 = a3;
  if (v9)
  {
    objc_super v10 = _ARLogTechnique();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      dispatch_semaphore_t v12 = NSStringFromClass(v11);
      int v14 = 138544130;
      v15 = v12;
      __int16 v16 = 2048;
      v17 = self;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      v21 = v9;
      _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: %@ => %@", (uint8_t *)&v14, 0x2Au);
    }
    if (v5)
    {
      uint64_t v13 = ARErrorWithCodeAndUserInfo(200, 0);
      [(ARWorldTrackingTechnique *)self _didFailWithError:v13];
    }
  }
}

- (BOOL)reconfigurableFrom:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(ARWorldTrackingTechnique *)self vioHandleState] == 4
    || ![v4 isMemberOfClass:objc_opt_class()])
  {
    LOBYTE(v7) = 0;
  }
  else
  {
    BOOL v5 = [v4 options];
    int v6 = [(ARWorldTrackingTechnique *)self mutableOptions];
    if ([v6 isEqual:v5])
    {
      int v7 = 1;
    }
    else
    {
      id v8 = [v6 imageSensorSettings];
      BOOL v9 = [v5 imageSensorSettings];
      char v10 = [v8 isEqual:v9];

      if ((v10 & 1) == 0)
      {
        uint64_t v11 = [v6 imageSensorSettings];
        uint64_t v12 = [v11 autoFocusEnabled];
        uint64_t v13 = [v5 imageSensorSettings];
        [v13 setAutoFocusEnabled:v12];
      }
      objc_msgSend(v5, "setPlaneDetection:", objc_msgSend(v6, "planeDetection"));
      [v6 minVergenceAngle];
      objc_msgSend(v5, "setMinVergenceAngle:");
      objc_msgSend(v5, "setMlModelEnabled:", objc_msgSend(v6, "mlModelEnabled"));
      objc_msgSend(v5, "setSceneReconstruction:", objc_msgSend(v6, "sceneReconstruction"));
      int v14 = [v6 sceneReconstructionOptions];
      [v5 setSceneReconstructionOptions:v14];

      objc_msgSend(v5, "setDepthBuffersWillBeProvided:", objc_msgSend(v6, "depthBuffersWillBeProvided"));
      objc_msgSend(v5, "setPlaneBundleAdjustmentEnabled:", objc_msgSend(v6, "planeBundleAdjustmentEnabled"));
      v15 = [v6 singleShotPlaneCallback];
      [v5 setSingleShotPlaneCallback:v15];

      __int16 v16 = [v6 trackedPlaneCallback];
      [v5 setTrackedPlaneCallback:v16];

      v17 = [v6 planeDetectionVIOPoseCallback];
      [v5 setPlaneDetectionVIOPoseCallback:v17];

      __int16 v18 = [v6 planeDetectionPoseUpdateCallback];
      [v5 setPlaneDetectionPoseUpdateCallback:v18];

      int v7 = [v6 isEqual:v5];
    }
    id v19 = _ARLogTechnique();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      __int16 v20 = (objc_class *)objc_opt_class();
      v21 = NSStringFromClass(v20);
      uint64_t v22 = @"not ";
      int v24 = 138543874;
      objc_super v25 = v21;
      if (v7) {
        uint64_t v22 = &stru_1F120C8F0;
      }
      __int16 v26 = 2048;
      v27 = self;
      __int16 v28 = 2112;
      v29 = v22;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: is %@reconfigurable", (uint8_t *)&v24, 0x20u);
    }
  }

  return v7;
}

- (void)reconfigureFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(ARWorldTrackingTechnique *)self mutableOptions];
  int v6 = [v4 mutableOptions];
  char v7 = [v5 isEqual:v6];

  if ((v7 & 1) == 0)
  {
    id v8 = [v4 mutableOptions];
    if ([v8 depthBuffersWillBeProvided])
    {
    }
    else
    {
      ptr = self->_raycastSession.__ptr_;

      if (ptr) {
        RaycastSession::InvalidateDenseFrame(self->_raycastSession.__ptr_);
      }
    }
    char v10 = [v4 options];
    [(ARWorldTrackingTechnique *)self setMutableOptions:v10];

    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.options, *((id *)v4 + 42));
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.detectionCountUserDefaultValue, *((id *)v4 + 43));
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.minVergenceAngleDegreesUserDefaultValue, *((id *)v4 + 44));
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.lineFeaturesAlwaysOnUserDefaultValue, *((id *)v4 + 45));
    self->_surfaceDetectionParametrization.var0 = *((unsigned char *)v4 + 368);
    objc_storeStrong((id *)&self->_surfaceDetectionParametrization.detectionPolicyString, *((id *)v4 + 47));
    uint64_t v11 = self->_planeDetectionSession.__ptr_;
    if (v11)
    {
      unsigned __int16 v12 = PlaneDetectionSession::DidParametersOrConfigurationChanged(v11, &self->_surfaceDetectionParametrization);
      BOOL v13 = v12 != 0;
      BOOL v14 = v12 < 0x100u;
    }
    else
    {
      BOOL v13 = 0;
      BOOL v14 = 1;
    }
    if ([(ARWorldTrackingTechnique *)self vioHandleState] == 3)
    {
      if (v13)
      {
        [(ARWorldTrackingTechnique *)self _initializeSurfaceDetection:&self->_surfaceDetectionParametrization];
      }
      else if (!v14)
      {
        [(ARWorldTrackingTechnique *)self updateSurfaceDetectionConfiguration];
      }
      v15 = _ARLogTechnique();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        id v17 = (id)objc_claimAutoreleasedReturnValue();
        __int16 v18 = [(ARWorldTrackingTechnique *)self mutableOptions];
        id v19 = NSStringFromARPlaneDetection([v18 planeDetection]);
        int v23 = 138543874;
        id v24 = v17;
        __int16 v25 = 2048;
        __int16 v26 = self;
        __int16 v27 = 2112;
        __int16 v28 = v19;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: reconfigured for detection type(s): %@", (uint8_t *)&v23, 0x20u);
      }
      __int16 v20 = [(ARWorldTrackingTechnique *)self mutableOptions];
      BOOL v21 = [v20 sceneReconstruction] == 0;

      if (v21)
      {
        uint64_t v22 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];
        [v22 pause];
      }
      else
      {
        [(ARWorldTrackingTechnique *)self _startSceneReconstruction];
      }
    }
  }
}

- (void)updateSurfaceDetectionConfiguration
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  ptr = self->_planeDetectionSession.__ptr_;
  if (ptr)
  {
    if (PlaneDetectionSession::UpdateConfiguration(ptr, &self->_surfaceDetectionParametrization))
    {
      [(ARWorldTrackingTechnique *)self _updateVIOLineDetectionPolicy];
    }
    else
    {
      id v4 = _ARLogTechnique();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        BOOL v5 = (objc_class *)objc_opt_class();
        int v6 = NSStringFromClass(v5);
        int v8 = 138543618;
        BOOL v9 = v6;
        __int16 v10 = 2048;
        uint64_t v11 = self;
        _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error updating surface detection configuration", (uint8_t *)&v8, 0x16u);
      }
      char v7 = ARErrorWithCodeAndUserInfo(200, 0);
      [(ARWorldTrackingTechnique *)self _didFailWithError:v7];
    }
  }
}

- (void)prepare:(BOOL)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  kdebug_trace();
  v15 = [(ARWorldTrackingTechnique *)self getObservers];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_sessionHandleState == 1)
  {
    self->_int64_t sessionHandleState = 2;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v4 = v15;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v4);
          }
          int v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v8 technique:self didChangeState:2];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v25 count:16];
      }
      while (v5);
    }

    int64_t v9 = [(ARWorldTrackingTechnique *)self _initializeSLAMAndPredictorHandle];
    if (v9 == 3) {
      [(ARWorldTrackingTechnique *)self _initializeSurfaceDetection:&self->_surfaceDetectionParametrization];
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_int64_t sessionHandleState = v9;
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
    if (v9 != 2)
    {
      long long v18 = 0u;
      long long v19 = 0u;
      long long v16 = 0u;
      long long v17 = 0u;
      id v10 = v4;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v17;
        do
        {
          for (uint64_t j = 0; j != v11; ++j)
          {
            if (*(void *)v17 != v12) {
              objc_enumerationMutation(v10);
            }
            BOOL v14 = *(void **)(*((void *)&v16 + 1) + 8 * j);
            if (objc_opt_respondsToSelector()) {
              [v14 technique:self didChangeState:v9];
            }
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v16 objects:v24 count:16];
        }
        while (v11);
      }
    }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  }
  kdebug_trace();
}

- (id)processData:(id)a3
{
  uint64_t v137 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v124.receiver = self;
  v124.super_class = (Class)ARWorldTrackingTechnique;
  id v8 = [(ARImageBasedTechnique *)&v124 processData:v7];
  if ([(ARWorldTrackingTechnique *)self vioHandleState] != 3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      [(ARImageBasedTechnique *)self pushResultData:MEMORY[0x1E4F1CBF0] forFrame:0];
    }
    goto LABEL_83;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = v7;
    self->_lastCaptureLens = [v9 captureLens];
    id v10 = [(ARWorldTrackingTechnique *)self mutableOptions];
    int v11 = [v10 alwaysUsePrimaryCameraForTracking];
    if (v11)
    {
      uint64_t v3 = [(ARWorldTrackingTechnique *)self mutableOptions];
      id v4 = [v3 imageSensorSettingsForUltraWide];
      if (v4)
      {
        uint64_t v5 = [v9 cameraType];
        if (ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v5))
        {

          goto LABEL_84;
        }
        int v34 = 1;
      }
      else
      {
        int v34 = 0;
      }
    }
    else
    {
      int v34 = 0;
    }
    char v62 = [v9 isHighResolution];
    if (v34)
    {

      if ((v11 & 1) == 0)
      {
LABEL_51:

LABEL_54:
        if (v62) {
          goto LABEL_84;
        }
        v63 = [(ARWorldTrackingTechnique *)self mutableOptions];
        v64 = [v63 imageSensorSettingsForUltraWide];
        if (v64)
        {
          v65 = [v9 cameraType];
          int v66 = [v65 isEqualToString:*MEMORY[0x1E4F15828]];

          if (v66)
          {
            [v9 extrinsicMatrixToDeviceType:*MEMORY[0x1E4F15830]];
            -[ARWorldTrackingTechnique setExtrinsicsToWideSensor:](self, "setExtrinsicsToWideSensor:");
          }
        }
        else
        {
        }
        [v9 timestamp];
        kdebug_trace();
        uint64_t v67 = [(ARWorldTrackingTechnique *)self mutableOptions];
        uint64_t v68 = [v9 cameraType];
        [v67 cameraIdForCaptureDeviceType:v68];

        [v9 timestamp];
        [v9 visionData];
        kdebug_trace();
        uint64_t v136 = 0;
        memset(buf, 0, sizeof(buf));
        [v9 cameraIntrinsics];
        ARMatrix3x3RowMajorArray(buf, v69, v70, v71);
        uint64_t v134 = 0;
        long long v132 = 0u;
        long long v133 = 0u;
        float64x2_t v130 = 0u;
        long long v131 = 0u;
        v72 = CMGetAttachment((CMAttachmentBearerRef)[v9 visionData], @"VisionDataCameraIntrinsicMatrix", 0);
        v73 = v72;
        if (v72 && self->_shouldPushVisionDataIntrinsics)
        {
          *(double *)v74.i64 = ARMatrix3x3FromNSData(v72);
          int8x16_t v111 = v74;
          int8x16_t v113 = v75;
          int8x16_t v115 = (int8x16_t)v76;
          if (self->_shouldUseFullResolutionVisionDataIntrinsics)
          {
            uint64_t v77 = [(ARWorldTrackingTechnique *)self mutableOptions];
            v78 = [v77 imageSensorSettings];
            uint64_t v79 = [v78 visionDataOutputParameters];
            v80 = [v79 valueForKey:*MEMORY[0x1E4F4D4D8]];
            [v80 floatValue];
            float v109 = v81;

            *(float *)v82.i32 = v109 * *(float *)v111.i32;
            v82.i32[1] = v111.i32[1];
            v82.i64[1] = v111.u32[2];
            v83.i64[0] = __PAIR64__(COERCE_UNSIGNED_INT(vmuls_lane_f32(v109, *(float32x2_t *)v113.i8, 1)), v113.u32[0]);
            v83.i64[1] = v113.u32[2];
            v84.n128_u64[0] = (unint64_t)vmul_n_f32(*(float32x2_t *)v115.i8, v109);
            v84.n128_u64[1] = vextq_s8(v115, v115, 8uLL).u32[0];
            int8x16_t v74 = v82;
            int8x16_t v75 = v83;
            __n128 v76 = v84;
          }
          else
          {
            v74.i32[3] = 0;
            v75.i32[3] = 0;
            v76.n128_u32[3] = 0;
          }
          ARMatrix3x3RowMajorArray(&v130, v74, v75, v76);
        }
        [v9 ISO];
        double v123 = v85;
        [v9 exposureDuration];
        uint64_t v122 = v86;
        [v9 temperature];
        double v121 = v87;
        kdebug_trace();
        kdebug_trace();
        id v120 = 0;
        [v9 pixelBuffer];
        [v9 timestamp];
        uint64_t v88 = CV3DSLAMCameraFrameCreate();
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v117 = __40__ARWorldTrackingTechnique_processData___block_invoke;
        v118 = &__block_descriptor_40_e5_v8__0l;
        uint64_t v119 = v88;
        if (!v88)
        {
          v89 = _ARLogTechnique();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
          {
            uint64_t v90 = (objc_class *)objc_opt_class();
            v91 = NSStringFromClass(v90);
            *(_DWORD *)v125 = 138543874;
            *(void *)&v125[4] = v91;
            __int16 v126 = 2048;
            v127 = self;
            __int16 v128 = 2112;
            id v129 = v120;
            _os_log_impl(&dword_1B88A2000, v89, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not create camera frame: %@", v125, 0x20u);
          }
          uint64_t v92 = ARErrorWithCodeAndUserInfo(200, 0);
          [(ARWorldTrackingTechnique *)self _didFailWithError:v92];
        }
        if ([v9 visionData])
        {
          kdebug_trace();
          [v9 visionData];
          if ((CV3DSLAMCameraFrameAddHWFPWithIntrinsics() & 1) == 0)
          {
            v93 = _ARLogTechnique();
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              v94 = (objc_class *)objc_opt_class();
              v95 = NSStringFromClass(v94);
              *(_DWORD *)v125 = 138543874;
              *(void *)&v125[4] = v95;
              __int16 v126 = 2048;
              v127 = self;
              __int16 v128 = 2112;
              id v129 = v120;
              _os_log_impl(&dword_1B88A2000, v93, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Could not add HWFP: %@", v125, 0x20u);
            }
            objc_super v96 = ARErrorWithCodeAndUserInfo(200, 0);
            [(ARWorldTrackingTechnique *)self _didFailWithError:v96];
          }
        }
        if ((CV3DSLAMSessionPushCamera() & 1) == 0)
        {
          v97 = _ARLogTechnique();
          if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          {
            v98 = (objc_class *)objc_opt_class();
            __int16 v99 = NSStringFromClass(v98);
            *(_DWORD *)v125 = 138543874;
            *(void *)&v125[4] = v99;
            __int16 v126 = 2048;
            v127 = self;
            __int16 v128 = 2112;
            id v129 = 0;
            _os_log_impl(&dword_1B88A2000, v97, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Pushing camera failed: %@", v125, 0x20u);
          }
          v100 = ARErrorWithCodeAndUserInfo(200, 0);
          [(ARWorldTrackingTechnique *)self _didFailWithError:v100];
        }
        kdebug_trace();
        v117((uint64_t)v116);

        goto LABEL_80;
      }
    }
    else if (!v11)
    {
      goto LABEL_51;
    }

    goto LABEL_54;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v12 = v7;
    v130.f64[0] = 0.0;
    [v12 acceleration];
    [v12 acceleration];
    [v12 acceleration];
    [v12 timestamp];
    if ((CV3DSLAMSessionPushAccel() & 1) == 0)
    {
      BOOL v13 = _ARLogTechnique();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        BOOL v14 = (objc_class *)objc_opt_class();
        v15 = NSStringFromClass(v14);
        float64_t v16 = v130.f64[0];
        LODWORD(buf[0].f64[0]) = 138543874;
        *(void *)((char *)buf[0].f64 + 4) = v15;
        WORD2(buf[0].f64[1]) = 2048;
        *(void *)((char *)&buf[0].f64[1] + 6) = self;
        HIWORD(buf[1].f64[0]) = 2112;
        buf[1].f64[1] = v130.f64[0];
        _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing accelometer data: %@", (uint8_t *)buf, 0x20u);
      }
      long long v17 = ARErrorWithCodeAndUserInfo(200, 0);
      [(ARWorldTrackingTechnique *)self _didFailWithError:v17];
    }
    [v12 acceleration];
    [v12 acceleration];
    [v12 acceleration];
    [v12 timestamp];
    unsigned int v18 = CV3DPosePredictionPushAccel();
    if (!v18) {
      goto LABEL_80;
    }
    long long v19 = _ARLogTechnique();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      long long v20 = (objc_class *)objc_opt_class();
      long long v21 = NSStringFromClass(v20);
      long long v22 = NSStringFromCV3DPosePredictionReturn(v18);
      LODWORD(buf[0].f64[0]) = 138543874;
      *(void *)((char *)buf[0].f64 + 4) = v21;
      WORD2(buf[0].f64[1]) = 2048;
      *(void *)((char *)&buf[0].f64[1] + 6) = self;
      HIWORD(buf[1].f64[0]) = 2112;
      *(void *)&buf[1].f64[1] = v22;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing accelometer data to predictor: %@", (uint8_t *)buf, 0x20u);
    }
    goto LABEL_17;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v24 = v7;
    v130.f64[0] = 0.0;
    [v24 rotationRate];
    [v24 rotationRate];
    [v24 rotationRate];
    [v24 timestamp];
    if ((CV3DSLAMSessionPushGyro() & 1) == 0)
    {
      __int16 v25 = _ARLogTechnique();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        uint64_t v26 = (objc_class *)objc_opt_class();
        __int16 v27 = NSStringFromClass(v26);
        float64_t v28 = v130.f64[0];
        LODWORD(buf[0].f64[0]) = 138543874;
        *(void *)((char *)buf[0].f64 + 4) = v27;
        WORD2(buf[0].f64[1]) = 2048;
        *(void *)((char *)&buf[0].f64[1] + 6) = self;
        HIWORD(buf[1].f64[0]) = 2112;
        buf[1].f64[1] = v130.f64[0];
        _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing gyro data: %@", (uint8_t *)buf, 0x20u);
      }
      uint64_t v29 = ARErrorWithCodeAndUserInfo(200, 0);
      [(ARWorldTrackingTechnique *)self _didFailWithError:v29];
    }
    [v24 rotationRate];
    [v24 rotationRate];
    [v24 rotationRate];
    [v24 timestamp];
    unsigned int v30 = CV3DPosePredictionPushGyro();
    if (!v30) {
      goto LABEL_80;
    }
    long long v19 = _ARLogTechnique();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v31 = (objc_class *)objc_opt_class();
      uint64_t v32 = NSStringFromClass(v31);
      v33 = NSStringFromCV3DPosePredictionReturn(v30);
      LODWORD(buf[0].f64[0]) = 138543874;
      *(void *)((char *)buf[0].f64 + 4) = v32;
      WORD2(buf[0].f64[1]) = 2048;
      *(void *)((char *)&buf[0].f64[1] + 6) = self;
      HIWORD(buf[1].f64[0]) = 2112;
      *(void *)&buf[1].f64[1] = v33;
      _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CV3DPosePredictionPushAccel error: %@", (uint8_t *)buf, 0x20u);
    }
LABEL_17:

    long long v23 = ARErrorWithCodeAndUserInfo(200, 0);
    [(ARWorldTrackingTechnique *)self _didFailWithError:v23];

    goto LABEL_80;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_81;
  }
  id v35 = v7;
  unsigned int v36 = [v35 pointCloud];
  CV3DSLAMJasperPointCloudCreateFromADPointCloud();

  -[ARWorldTrackingTechnique CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:](self, "CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:", [v35 projectorMode]);
  unsigned int v37 = CV3DSLAMJasperPointCloudSetProjectorMode();
  if (v37)
  {
    v38 = _ARLogTechnique();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v39 = (objc_class *)objc_opt_class();
      v40 = NSStringFromClass(v39);
      v41 = NSStringFromCV3DSLAMJasperPointCloudReturn(v37);
      LODWORD(buf[0].f64[0]) = 138543874;
      *(void *)((char *)buf[0].f64 + 4) = v40;
      WORD2(buf[0].f64[1]) = 2048;
      *(void *)((char *)&buf[0].f64[1] + 6) = self;
      HIWORD(buf[1].f64[0]) = 2112;
      *(void *)&buf[1].f64[1] = v41;
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error setting jasper projector mode: %@", (uint8_t *)buf, 0x20u);
    }
  }
  *(void *)v125 = 0;
  [v35 timestamp];
  if ((CV3DSLAMSessionPushJasperPointCloud() & 1) == 0)
  {
    v42 = _ARLogTechnique();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      v45 = *(void **)v125;
      LODWORD(buf[0].f64[0]) = 138543874;
      *(void *)((char *)buf[0].f64 + 4) = v44;
      WORD2(buf[0].f64[1]) = 2048;
      *(void *)((char *)&buf[0].f64[1] + 6) = self;
      HIWORD(buf[1].f64[0]) = 2112;
      buf[1].f64[1] = *(float64_t *)v125;
      _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error pushing jasper buffer to SLAM: %@", (uint8_t *)buf, 0x20u);
    }
    v46 = ARErrorWithCodeAndUserInfo(200, 0);
    [(ARWorldTrackingTechnique *)self _didFailWithError:v46];
  }
  if (self->_planeDetectionSession.__ptr_ || self->_raycastSession.__ptr_)
  {
    [v35 extrinsicsToWideSensor];
    ARMatrix4x4FromMatrix4x3();
    simd_float4 v112 = v48;
    simd_float4 v114 = v47;
    simd_float4 v108 = v50;
    simd_float4 v110 = v49;
    [v35 visionCameraTransform];
    long long v106 = v52;
    float64x2_t v107 = v51;
    long long v104 = v54;
    long long v105 = v53;
    v139.columns[1] = v112;
    v139.columns[0] = v114;
    v139.columns[3] = v108;
    v139.columns[2] = v110;
    simd_float4x4 v140 = __invert_f4(v139);
    unint64_t v55 = 0;
    float32x4_t v56 = vmulq_f32((float32x4_t)v140.columns[3], (float32x4_t)vdupq_n_s32(0x3A83126Fu));
    v56.i32[3] = v140.columns[3].i32[3];
    float64x2_t v130 = v107;
    long long v131 = v106;
    long long v132 = v105;
    long long v133 = v104;
    do
    {
      buf[v55 / 2] = (float64x2_t)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v140.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v130 + v55 * 8))), (float32x4_t)v140.columns[1], *(float32x2_t *)&v130.f64[v55], 1), (float32x4_t)v140.columns[2], *(float32x4_t *)((char *)&v130 + v55 * 8), 2), v56, *(float32x4_t *)((char *)&v130 + v55 * 8), 3);
      v55 += 2;
    }
    while (v55 != 8);
  }
  os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
  if (self->_planeDetectionSession.__ptr_)
  {
    double v57 = [(ARWorldTrackingTechnique *)self mutableOptions];
    BOOL v58 = [v57 planeDetection] == 0;

    if (!v58)
    {
      double v123 = 0.0;
      CV3DSLAMSessionCopyJasperCameraCalibration();
      ARMatrix3x3MakeRowMajorTransform(buf[0].f64);
      ptr = self->_planeDetectionSession.__ptr_;
      v60 = [v35 pointCloud];
      [v35 timestamp];
      uint64_t v103 = v61;
      PlaneDetectionSession::PushJasperPointCloud((uint64_t)ptr, v60);
    }
  }
  os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
  os_unfair_lock_lock(&self->_raycastSessionLock);
  if (self->_raycastSession.__ptr_)
  {
    [v35 timestamp];
    CV3DRaycastPushJasperPointCloud();
  }
  os_unfair_lock_unlock(&self->_raycastSessionLock);
  CV3DSLAMJasperPointCloudRelease();
LABEL_80:

LABEL_81:
  if ([(ARWorldTrackingTechnique *)self deterministicMode]) {
    CV3DSLAMSessionWait();
  }
LABEL_83:
  id v101 = v7;
LABEL_84:

  return v7;
}

uint64_t __40__ARWorldTrackingTechnique_processData___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4109D50](*(void *)(a1 + 32));
}

- (id)predictedResultDataAtTimestamp:(double)a3 context:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  cachedPoseData = self->_cachedPoseData;
  if (cachedPoseData
    && ([(ARWorldTrackingPoseData *)cachedPoseData worldTrackingState],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 state],
        v8,
        v9))
  {
    id v10 = (ARWorldTrackingPoseData *)[(ARWorldTrackingPoseData *)self->_cachedPoseData copy];
    if (!v10) {
      id v10 = [[ARWorldTrackingPoseData alloc] initWithTimestamp:a3];
    }
    int v11 = [(ARWorldTrackingTechnique *)self _updatePoseData:v10 forTimeStamp:0 updateTrackingState:a3];
    if (v11)
    {
      id v12 = _ARLogTechnique();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        BOOL v13 = (objc_class *)objc_opt_class();
        BOOL v14 = NSStringFromClass(v13);
        *(_DWORD *)buf = 138544130;
        *(void *)&float64x2_t buf[4] = v14;
        __int16 buf_12 = 2048;
        *(void *)buf_14 = self;
        *(_WORD *)&buf_14[8] = 1024;
        int v38 = v11;
        __int16 v39 = 2048;
        v40[0] = a3;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to predict pose [%i] for timestamp %f", buf, 0x26u);
      }
      v15 = (void *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      id v12 = [v6 imageData];
      if ([v12 cameraPosition] == 2)
      {
        [(ARWorldTrackingPoseData *)v10 cameraTransform];
        float32x4_t v28 = v17;
        float32x4_t v29 = v16;
        float32x4_t v26 = v19;
        float32x4_t v27 = v18;
        *(double *)&long long v20 = ARFrontFacingCameraFlip();
        uint64_t v21 = 0;
        long long v30 = v20;
        long long v31 = v22;
        long long v32 = v23;
        long long v33 = v24;
        do
        {
          *(float32x4_t *)&buf[v21] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v29, COERCE_FLOAT(*(long long *)((char *)&v30 + v21))), v28, *(float32x2_t *)((char *)&v30 + v21), 1), v27, *(float32x4_t *)((char *)&v30 + v21), 2), v26, *(float32x4_t *)((char *)&v30 + v21), 3);
          v21 += 16;
        }
        while (v21 != 64);
        -[ARWorldTrackingPoseData setCameraTransform:](v10, "setCameraTransform:", *(double *)buf, *(double *)&buf_14[2], *(double *)((char *)v40 + 2), v41[0]);
      }
      int v34 = v10;
      v15 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v34, 1, *(_OWORD *)&v26, *(_OWORD *)&v27, *(_OWORD *)&v28, *(_OWORD *)&v29, v30, v31, v32, v33);
    }
  }
  else
  {
    v15 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v15;
}

- (void)mergeResultData:(id)a3 intoData:(id)a4 context:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t i = (uint64_t)a3;
  id v39 = a4;
  id v38 = a5;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  obuint64_t j = (id)i;
  uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  uint64_t v9 = 0;
  if (!v8)
  {
    v41 = 0;
    v43 = 0;
    v46 = 0;
    goto LABEL_18;
  }
  v41 = 0;
  v43 = 0;
  v46 = 0;
  uint64_t v10 = *(void *)v52;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v52 != v10) {
        objc_enumerationMutation(obj);
      }
      int v11 = *(void **)(*((void *)&v51 + 1) + 8 * i);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v12 = v46;
        BOOL v13 = v9;
        v46 = v11;
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v12 = v43;
          BOOL v13 = v9;
          v43 = v11;
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v12 = v41;
            BOOL v13 = v9;
            v41 = v11;
          }
          else
          {
            objc_opt_class();
            id v12 = v9;
            BOOL v13 = v11;
            if ((objc_opt_isKindOfClass() & 1) == 0) {
              continue;
            }
          }
        }
      }
      id v14 = v11;

      uint64_t v9 = v13;
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v51 objects:v56 count:16];
  }
  while (v8);
LABEL_18:

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v45 = v39;
  v15 = 0;
  uint64_t v16 = [v45 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v16)
  {
    uint64_t v42 = 0;
    v40 = 0;
    float32x4_t v17 = 0;
    uint64_t i = *(void *)v48;
    while (1)
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v48 != i) {
          objc_enumerationMutation(v45);
        }
        float32x4_t v19 = *(void **)(*((void *)&v47 + 1) + 8 * v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v20 = v15;
          v15 = v19;
LABEL_29:
          uint64_t v21 = v17;
LABEL_30:
          id v22 = v19;

          float32x4_t v17 = v21;
          goto LABEL_31;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v20 = v42;
          uint64_t v42 = v19;
          goto LABEL_29;
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v20 = v40;
          v40 = v19;
          goto LABEL_29;
        }
        objc_opt_class();
        long long v20 = v17;
        uint64_t v21 = v19;
        if (objc_opt_isKindOfClass()) {
          goto LABEL_30;
        }
LABEL_31:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v23 = [v45 countByEnumeratingWithState:&v47 objects:v55 count:16];
      uint64_t v16 = v23;
      if (!v23) {
        goto LABEL_38;
      }
    }
  }
  uint64_t v42 = 0;
  v40 = 0;
  float32x4_t v17 = 0;
LABEL_38:

  long long v24 = [v15 worldTrackingState];
  char v25 = [v24 majorRelocalization];
  if (v25)
  {
    uint64_t v26 = 1;
  }
  else
  {
    uint64_t i = [v46 worldTrackingState];
    uint64_t v26 = [(id)i majorRelocalization];
  }
  float32x4_t v27 = [v15 worldTrackingState];
  [v27 setMajorRelocalization:v26];

  if ((v25 & 1) == 0) {
  float32x4_t v28 = [v15 worldTrackingState];
  }
  char v29 = [v28 minorRelocalization];
  if (v29)
  {
    uint64_t v30 = 1;
  }
  else
  {
    uint64_t i = [v46 worldTrackingState];
    uint64_t v30 = [(id)i minorRelocalization];
  }
  long long v31 = [v15 worldTrackingState];
  [v31 setMinorRelocalization:v30];

  if ((v29 & 1) == 0) {
  long long v32 = [v15 worldTrackingState];
  }
  char v33 = [v32 poseGraphUpdated];
  if (v33)
  {
    uint64_t v34 = 1;
  }
  else
  {
    uint64_t i = [v46 worldTrackingState];
    uint64_t v34 = [(id)i poseGraphUpdated];
  }
  id v35 = [v15 worldTrackingState];
  [v35 setPoseGraphUpdated:v34];

  if ((v33 & 1) == 0) {
  objc_opt_class();
  }
  if (objc_opt_isKindOfClass())
  {
    id v36 = v45;
    unsigned int v37 = v36;
    if (v43 && !v42) {
      [v36 addObject:v43];
    }
    if (v41 && !v40) {
      [v37 addObject:v41];
    }
    if (v9 && !v17) {
      [v37 addObject:v9];
    }
  }
}

- (void)prepareResultData:(id)a3 forContext:(id)a4
{
  id v25 = a4;
  uint64_t v5 = [a3 firstObject];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v25 cameraPosition] == 2)
    {
      [v5 cameraTransform];
      float32x4_t v23 = v7;
      float32x4_t v24 = v6;
      float32x4_t v21 = v9;
      float32x4_t v22 = v8;
      *(double *)&long long v10 = ARFrontFacingCameraFlip();
      uint64_t v11 = 0;
      v26[0] = v10;
      v26[1] = v12;
      v26[2] = v13;
      v26[3] = v14;
      do
      {
        *(long long *)((char *)&v27 + v11 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v24, COERCE_FLOAT(v26[v11])), v23, *(float32x2_t *)&v26[v11], 1), v22, (float32x4_t)v26[v11], 2), v21, (float32x4_t)v26[v11], 3);
        ++v11;
      }
      while (v11 != 4);
      objc_msgSend(v5, "setCameraTransform:", *(double *)&v27, *(double *)&v28, *(double *)&v29, *(double *)&v30);
    }
    v15 = objc_msgSend(v25, "imageData", *(_OWORD *)&v21, *(_OWORD *)&v22, *(_OWORD *)&v23, *(_OWORD *)&v24);
    int v16 = [v15 isMirrored];

    if (v16)
    {
      [v5 cameraTransform];
      objc_msgSend(v5, "setCameraTransform:", ARMatrix4x4MirrorX(v17, v18, v19, v20));
    }
  }
}

- (void)requestResultDataAtTimestamp:(double)a3 context:(id)a4
{
  id v22 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_resultDataQueue);
  [(ARWorldTrackingTechnique *)self _pushWTResultDataForTimestamp:a3];
  float32x4_t v6 = [v22 resultDataOfClass:objc_opt_class()];
  float32x4_t v7 = [v6 firstObject];

  float32x4_t v8 = [v7 resultDataOfClass:objc_opt_class()];
  float32x4_t v9 = objc_msgSend(v8, "ar_firstObjectPassingTest:", &__block_literal_global_126_0);

  long long v10 = [v7 resultDataOfClass:objc_opt_class()];
  uint64_t v11 = objc_msgSend(v10, "ar_firstObjectPassingTest:", &__block_literal_global_130_0);
  long long v12 = [v7 resultDataOfClass:objc_opt_class()];

  float32x4_t v21 = v12;
  long long v13 = objc_msgSend(v12, "ar_firstObjectPassingTest:", &__block_literal_global_132_0);
  long long v14 = [v7 resultDataOfClass:objc_opt_class()];
  v15 = [v14 firstObject];

  resultDataQueue = self->_resultDataQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_4;
  block[3] = &unk_1E6186670;
  id v17 = v13;
  id v25 = v17;
  id v18 = v9;
  id v26 = v18;
  long long v27 = self;
  id v19 = v15;
  id v28 = v19;
  id v20 = v11;
  id v29 = v20;
  dispatch_sync(resultDataQueue, block);
  v23.receiver = self;
  v23.super_class = (Class)ARWorldTrackingTechnique;
  [(ARImageBasedTechnique *)&v23 requestResultDataAtTimestamp:v22 context:a3];
}

BOOL __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 source];
  if (v5 == 2) {
    *a4 = 1;
  }
  return v5 == 2;
}

BOOL __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 source];
  if (v5 == 1) {
    *a4 = 1;
  }
  return v5 == 1;
}

BOOL __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 source];
  if (v5 == 2) {
    *a4 = 1;
  }
  return v5 == 2;
}

CVPixelBufferRef __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  if (v2
    && [v2 segmentationBuffer]
    && [*(id *)(a1 + 40) singleFrameDepthBuffer]
    && ARDeviceSupportsJasper())
  {
    uint64_t v3 = (CVPixelBufferPoolRef *)(*(void *)(a1 + 48) + 464);
    id v4 = (__CVBuffer *)[*(id *)(a1 + 40) singleFrameDepthBuffer];
    if (v4)
    {
      uint64_t v5 = v4;
      double Width = (double)CVPixelBufferGetWidth(v4);
      double Height = (double)CVPixelBufferGetHeight(v5);
    }
    else
    {
      double Width = *MEMORY[0x1E4F1DB30];
      double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    OSType PixelFormatType = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[*(id *)(a1 + 32) segmentationBuffer]);
    CVPixelBufferRef result = ARCreateCVPixelBufferFromPool(v3, PixelFormatType, *(void **)(a1 + 48), @"segmentation annotated depth", Width, Height);
    if (!result) {
      return result;
    }
    CVPixelBufferRef v10 = result;
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v64 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_5;
    v65 = &__block_descriptor_40_e5_v8__0l;
    CVPixelBufferRef v66 = result;
    uint64_t v11 = *(void *)(a1 + 48);
    long long v12 = (__CVBuffer *)[*(id *)(a1 + 40) singleFrameDepthBuffer];
    long long v13 = v12;
    if (v12)
    {
      double v14 = (double)CVPixelBufferGetWidth(v12);
      double v15 = (double)CVPixelBufferGetHeight(v13);
    }
    else
    {
      double v14 = *MEMORY[0x1E4F1DB30];
      double v15 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    OSType v16 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[*(id *)(a1 + 32) confidenceBuffer]);
    CVPixelBufferRef v17 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v11 + 480), v16, *(void **)(a1 + 48), @"confidence annotated depth", v14, v15);
    CVPixelBufferRef v18 = v17;
    if (!v17) {
      return (CVPixelBufferRef)((uint64_t (*)(void *))v64)(v63);
    }
    v59[0] = MEMORY[0x1E4F143A8];
    v59[1] = 3221225472;
    v60 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_6;
    uint64_t v61 = &__block_descriptor_40_e5_v8__0l;
    CVPixelBufferRef v62 = v17;
    uint64_t v19 = [*(id *)(a1 + 32) uncertaintyBuffer];
    uint64_t v20 = *(void *)(a1 + 48);
    if (v19)
    {
      float32x4_t v21 = (__CVBuffer *)[*(id *)(a1 + 40) singleFrameDepthBuffer];
      id v22 = v21;
      if (v21)
      {
        double v23 = (double)CVPixelBufferGetWidth(v21);
        double v24 = (double)CVPixelBufferGetHeight(v22);
      }
      else
      {
        double v23 = *MEMORY[0x1E4F1DB30];
        double v24 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      OSType v25 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[*(id *)(a1 + 32) uncertaintyBuffer]);
      CVPixelBufferRef v26 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v20 + 472), v25, *(void **)(a1 + 48), @"uncertainty annotated depth", v23, v24);
      CVPixelBufferRef v27 = v26;
      if (!v26) {
        goto LABEL_27;
      }
      v55[0] = MEMORY[0x1E4F143A8];
      v55[1] = 3221225472;
      float32x4_t v56 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_7;
      uint64_t v57 = &__block_descriptor_40_e5_v8__0l;
      CVPixelBufferRef v58 = v26;
      uint64_t v28 = *(void *)(a1 + 48);
      id v29 = (__CVBuffer *)[*(id *)(a1 + 40) singleFrameDepthBuffer];
      long long v30 = v29;
      if (v29)
      {
        double v31 = (double)CVPixelBufferGetWidth(v29);
        double v32 = (double)CVPixelBufferGetHeight(v30);
      }
      else
      {
        double v31 = *MEMORY[0x1E4F1DB30];
        double v32 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      }
      OSType v33 = CVPixelBufferGetPixelFormatType((CVPixelBufferRef)[*(id *)(a1 + 32) segmentationBuffer]);
      CVPixelBufferRef v34 = ARCreateCVPixelBufferFromPool((CVPixelBufferPoolRef *)(v28 + 488), v33, *(void **)(a1 + 48), @"uncertainty masked segmentation buffer", v31, v32);
      CVPixelBufferRef v35 = v34;
      if (v34)
      {
        v51[0] = MEMORY[0x1E4F143A8];
        v51[1] = 3221225472;
        long long v52 = __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_8;
        long long v53 = &__block_descriptor_40_e5_v8__0l;
        CVPixelBufferRef v54 = v34;
        [*(id *)(a1 + 48) annotateDepth:*(void *)(a1 + 40) withSemantics:*(void *)(a1 + 32) toTargetSemanticsImage:v10 targetConfidenceBuffer:v18 targetUncertaintyBuffer:v27];
        [*(id *)(a1 + 32) setSemanticsSampledForDepth:v10];
        [*(id *)(a1 + 32) setConfidenceSampledForDepth:v18];
        [*(id *)(a1 + 32) setUncertaintySampledForDepth:v27];
        +[ARSISemanticSegmentationTechnique createUncertaintyMaskedSegmentationBuffer:v35 fromSegmentationBuffer:v10 uncertaintyBuffer:v27 maskValue:255];
        v52((uint64_t)v51);
      }
      v56((uint64_t)v55);
      if (!v35)
      {
LABEL_27:
        char v36 = 0;
LABEL_28:
        v60((uint64_t)v59);
        CVPixelBufferRef result = (CVPixelBufferRef)((uint64_t (*)(void *))v64)(v63);
        if ((v36 & 1) == 0) {
          return result;
        }
        goto LABEL_29;
      }
    }
    else
    {
      [*(id *)(a1 + 48) annotateDepth:*(void *)(a1 + 40) withSemantics:*(void *)(a1 + 32) toTargetSemanticsImage:v10 targetConfidenceBuffer:v18 targetUncertaintyBuffer:0];
      [*(id *)(a1 + 32) setSemanticsSampledForDepth:v10];
      [*(id *)(a1 + 32) setConfidenceSampledForDepth:v18];
    }
    [*(id *)(a1 + 32) setMaskedSemanticsSampledForDepth:v10];
    char v36 = 1;
    goto LABEL_28;
  }
LABEL_29:
  if (*(void *)(a1 + 56) && *(void *)(a1 + 32))
  {
    unsigned int v37 = [*(id *)(a1 + 48) mutableOptions];
    if ([v37 planeDetection])
    {
      id v38 = [*(id *)(a1 + 48) mutableOptions];
      int v39 = [v38 mlModelEnabled];

      if (v39)
      {
        os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 152));
        uint64_t v40 = *(void *)(a1 + 40);
        v41 = *(void **)(a1 + 48);
        if (v40) {
          [v41 pushToSceneUnderstandingDepth:v40 segmentation:*(void *)(a1 + 32) pose:*(void *)(a1 + 56)];
        }
        else {
          [v41 pushToSceneUnderstandingSegmentation:*(void *)(a1 + 32) pose:*(void *)(a1 + 56)];
        }
        uint64_t v42 = [*(id *)(a1 + 48) mutableOptions];
        v43 = [v42 planeDetectionVIOPoseCallback];

        if (v43)
        {
          v44 = [*(id *)(a1 + 48) mutableOptions];
          id v45 = [v44 planeDetectionVIOPoseCallback];
          v45[2](v45, *(void *)(a1 + 56));
        }
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 152));
      }
    }
    else
    {
    }
  }
  if (*(void *)(a1 + 40) && *(void *)(a1 + 56))
  {
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 156));
    [*(id *)(a1 + 48) pushToHitTestingDepth:*(void *)(a1 + 40) pose:*(void *)(a1 + 56)];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 156));
  }
  if (ARDeviceSupportsJasper())
  {
    v46 = [*(id *)(a1 + 48) mutableOptions];
    BOOL v47 = [v46 sceneReconstruction] == 0;
  }
  else
  {
    BOOL v47 = 1;
  }
  if (*(void *)(a1 + 40))
  {
    long long v48 = *(void **)(a1 + 56);
    if (v48)
    {
      if (*(void *)(a1 + 32)) {
        char v49 = v47;
      }
      else {
        char v49 = 1;
      }
      if ((v49 & 1) == 0)
      {
        [v48 visionCameraTransform];
        *(simd_float4x4 *)(*(void *)(a1 + 48) + 704) = __invert_f4(v67);
        long long v50 = [*(id *)(a1 + 48) sceneReconstructionHandler];
        [v50 pushDepth:*(void *)(a1 + 40) semanticSegmentation:*(void *)(a1 + 32) personSegmentation:*(void *)(a1 + 64) pose:*(void *)(a1 + 56)];
      }
    }
  }
  CVPixelBufferRef result = (CVPixelBufferRef)[*(id *)(a1 + 48) deterministicMode];
  if (result) {
    return (CVPixelBufferRef)CV3DSLAMSessionWait();
  }
  return result;
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_5(uint64_t a1)
{
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_6(uint64_t a1)
{
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_7(uint64_t a1)
{
}

void __65__ARWorldTrackingTechnique_requestResultDataAtTimestamp_context___block_invoke_8(uint64_t a1)
{
}

+ (BOOL)producesResultDataForAnchorOfClass:(Class)a3
{
  return (Class)objc_opt_class() == a3 || (Class)objc_opt_class() == a3 || objc_opt_class() == (void)a3;
}

- (void)annotateDepth:(id)a3 withSemantics:(id)a4 toTargetSemanticsImage:(__CVBuffer *)a5 targetConfidenceBuffer:(__CVBuffer *)a6 targetUncertaintyBuffer:(__CVBuffer *)a7
{
}

- (void)annotateDepth:(id)a3 withSemantics:(id)a4 toTargetSemanticsImage:(__CVBuffer *)a5 targetConfidenceBuffer:(__CVBuffer *)a6 targetUncertaintyBuffer:(__CVBuffer *)a7 useGpu:(BOOL)a8
{
  BOOL v8 = a8;
  id v112 = a3;
  id v113 = a4;
  uint64_t v11 = [v113 sourceImageData];
  [v11 timestamp];
  long long v12 = [v112 sourceImageData];
  [v12 timestamp];
  kdebug_trace();

  [v112 depthBufferSize];
  double v14 = v13;
  double v16 = v15;
  float32x4_t v126 = 0u;
  float32x4_t v127 = 0u;
  float32x4_t v124 = 0u;
  float32x4_t v125 = 0u;
  float32x4_t v122 = 0u;
  float32x4_t v123 = 0u;
  float32x4_t v120 = 0u;
  float32x4_t v121 = 0u;
  float32x4_t v118 = 0u;
  float32x4_t v119 = 0u;
  CVPixelBufferRef v17 = [v112 sourceImageData];
  [v17 extrinsicMatrixToDeviceType:*MEMORY[0x1E4F15828]];
  float32x4_t v91 = v19;
  float32x4_t v93 = v18;
  float32x4_t v101 = v21;
  float32x4_t v106 = v20;

  float32x4_t v118 = v93;
  float32x4_t v119 = v91;
  float32x4_t v120 = v106;
  float32x4_t v121 = vdivq_f32(v101, (float32x4_t)vdupq_n_s32(0x447A0000u));
  id v22 = [v113 sourceImageData];
  [v22 cameraIntrinsics];
  double v102 = v24;
  float v107 = v23;
  double v94 = v25;
  CVPixelBufferRef v26 = [v113 sourceImageData];
  [v26 imageResolution];
  double v28 = v27;
  double v30 = v29;
  double v31 = (__CVBuffer *)[v113 segmentationBuffer];
  double v32 = v31;
  if (v31)
  {
    size_t Width = CVPixelBufferGetWidth(v31);
    size_t Height = CVPixelBufferGetHeight(v32);
    double v35 = (double)Width;
    double v36 = (double)Height;
  }
  else
  {
    double v35 = *MEMORY[0x1E4F1DB30];
    double v36 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  v37.f32[0] = ARAdjustIntrinsicsForViewportSize(v107, v102, v94, v28, v30, v35, v36);
  float32x4_t v122 = v37;
  float32x4_t v123 = v38;
  float32x4_t v124 = v39;

  uint64_t v40 = [v112 sourceImageData];
  [v40 cameraIntrinsics];
  double v103 = v42;
  float v108 = v41;
  double v95 = v43;
  v44 = [v112 sourceImageData];
  [v44 imageResolution];
  v47.f32[0] = ARAdjustIntrinsicsForViewportSize(v108, v103, v95, v45, v46, v14, v16);
  simd_float3 v104 = v48;
  simd_float3 v109 = v47;
  simd_float3 v96 = v49;

  long long v50 = [v112 sourceImageData];
  long long v51 = [v50 cameraType];
  if (v51)
  {
    long long v52 = [(ARWorldTrackingTechnique *)self mutableOptions];
    long long v53 = [v112 sourceImageData];
    CVPixelBufferRef v54 = [v53 cameraType];
    [v52 cameraIdForCaptureDeviceType:v54];
  }
  kdebug_trace();
  kdebug_trace();
  CVPixelBufferGetWidth((CVPixelBufferRef)[v113 segmentationBuffer]);
  CVPixelBufferGetHeight((CVPixelBufferRef)[v113 segmentationBuffer]);
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  kdebug_trace();
  v128.columns[2] = v104;
  v128.columns[0] = v109;
  v128.columns[0].i32[3] = 0;
  v128.columns[1] = v96;
  v128.columns[1].i32[3] = 0;
  v128.columns[2].i32[3] = 0;
  simd_float3x3 v129 = __invert_f3(v128);
  float32x4_t v125 = (float32x4_t)v129.columns[0];
  float32x4_t v126 = (float32x4_t)v129.columns[1];
  float32x4_t v127 = (float32x4_t)v129.columns[2];
  if (v8)
  {
    float v85 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
    uint64_t v92 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v85, CVPixelBufferGetIOSurface((CVPixelBufferRef)[v112 depthBuffer]), 0);
    [v92 setLabel:@"depthTexture"];
    long long v105 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:13 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
    simd_float4 v110 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v105, CVPixelBufferGetIOSurface((CVPixelBufferRef)[v113 segmentationBuffer]), 0);
    [v110 setLabel:@"semanticsTexture"];
    v97 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
    v89 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v97, CVPixelBufferGetIOSurface((CVPixelBufferRef)[v113 confidenceBuffer]), 0);
    [v110 setLabel:@"confidenceTexture"];
    uint64_t v90 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:13 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
    [v90 setUsage:3];
    uint64_t v88 = (void *)[(MTLDevice *)self->_sharedMetalDevice newTextureWithDescriptor:v90 iosurface:CVPixelBufferGetIOSurface(a5) plane:0];
    [v88 setLabel:@"targetSemanticsTexture"];
    CVPixelBufferRef pixelBuffera = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
    [(__CVBuffer *)pixelBuffera setUsage:3];
    uint64_t v86 = (void *)[(MTLDevice *)self->_sharedMetalDevice newTextureWithDescriptor:pixelBuffera iosurface:CVPixelBufferGetIOSurface(a6) plane:0];
    [v86 setLabel:@"targetConfidenceTexture"];
    float v87 = (void *)[(MTLDevice *)self->_sharedMetalDevice newBufferWithBytes:&v118 length:160 options:0];
    unint64_t v55 = (void *)[(MTLDevice *)self->_sharedMetalDevice newComputePipelineStateWithFunction:self->_annotateDepthDataKernelFunction error:0];
    if (a7)
    {
      float32x4_t v56 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
      __n128 v84 = (void *)-[MTLDevice newTextureWithDescriptor:iosurface:plane:](self->_sharedMetalDevice, "newTextureWithDescriptor:iosurface:plane:", v56, CVPixelBufferGetIOSurface((CVPixelBufferRef)[v113 uncertaintyBuffer]), 0);
      [v110 setLabel:@"uncertaintyTexture"];
      uint64_t v57 = [MEMORY[0x1E4F35330] texture2DDescriptorWithPixelFormat:55 width:(unint64_t)v14 height:(unint64_t)v16 mipmapped:0];
      [v57 setUsage:3];
      CVPixelBufferRef v58 = (void *)[(MTLDevice *)self->_sharedMetalDevice newTextureWithDescriptor:v57 iosurface:CVPixelBufferGetIOSurface(a7) plane:0];
      v59 = v110;
      [v58 setLabel:@"targetUncertaintyTexture"];
      v60 = [(MTLCommandQueue *)self->_spatialMappingCommandQueue commandBuffer];
      uint64_t v61 = [v60 computeCommandEncoder];
      [v61 setComputePipelineState:v55];
      [v61 setBuffer:v87 offset:0 atIndex:0];
      [v61 setTexture:v92 atIndex:1];
      [v61 setTexture:v110 atIndex:2];
      [v61 setTexture:v89 atIndex:3];
      [v61 setTexture:v88 atIndex:5];
      [v61 setTexture:v86 atIndex:6];
      [v61 setTexture:v84 atIndex:4];
      [v61 setTexture:v58 atIndex:7];
      v117[0] = (unint64_t)v14;
      v117[1] = (unint64_t)v16;
      v117[2] = 1;
      v116[0] = [v55 threadExecutionWidth];
      v116[1] = (unint64_t)[v55 maxTotalThreadsPerThreadgroup] / v116[0];
      void v116[2] = 1;
      [v61 dispatchThreads:v117 threadsPerThreadgroup:v116];
      [v61 endEncoding];

      [v60 commit];
      [v60 waitUntilCompleted];
    }
    else
    {
      float32x4_t v56 = [(MTLCommandQueue *)self->_spatialMappingCommandQueue commandBuffer];
      v59 = v110;
      int8x16_t v83 = [v56 computeCommandEncoder];
      [v83 setComputePipelineState:v55];
      [v83 setBuffer:v87 offset:0 atIndex:0];
      [v83 setTexture:v92 atIndex:1];
      [v83 setTexture:v110 atIndex:2];
      [v83 setTexture:v89 atIndex:3];
      [v83 setTexture:v88 atIndex:5];
      [v83 setTexture:v86 atIndex:6];
      v115[0] = (unint64_t)v14;
      v115[1] = (unint64_t)v16;
      v115[2] = 1;
      v114[0] = [v55 threadExecutionWidth];
      v114[1] = (unint64_t)[v55 maxTotalThreadsPerThreadgroup] / v114[0];
      v114[2] = 1;
      [v83 dispatchThreads:v115 threadsPerThreadgroup:v114];
      [v83 endEncoding];

      [v56 commit];
      [v56 waitUntilCompleted];
    }
  }
  else
  {
    size_t BytesPerRow = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v112 depthBuffer]);
    size_t v63 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v113 segmentationBuffer]);
    size_t v64 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v113 confidenceBuffer]);
    size_t v65 = CVPixelBufferGetBytesPerRow((CVPixelBufferRef)[v113 uncertaintyBuffer]);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v113 segmentationBuffer], 1uLL);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v113 confidenceBuffer], 1uLL);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v113 uncertaintyBuffer], 1uLL);
    CVPixelBufferLockBaseAddress((CVPixelBufferRef)[v112 depthBuffer], 1uLL);
    CVPixelBufferLockBaseAddress(a5, 0);
    CVPixelBufferLockBaseAddress(a6, 0);
    CVPixelBufferLockBaseAddress(a7, 0);
    BaseAddress = (float *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v112 depthBuffer]);
    simd_float4x4 v67 = CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v113 segmentationBuffer]);
    uint64_t v68 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v113 confidenceBuffer]);
    int8x16_t v69 = (char *)CVPixelBufferGetBaseAddress((CVPixelBufferRef)[v113 uncertaintyBuffer]);
    int8x16_t v70 = CVPixelBufferGetBaseAddress(a5);
    __n128 v71 = (char *)CVPixelBufferGetBaseAddress(a6);
    v72 = (char *)CVPixelBufferGetBaseAddress(a7);
    if (v16 > 0.0)
    {
      unint64_t v75 = 0;
      do
      {
        if (v14 > 0.0)
        {
          unint64_t v76 = 0;
          *(float *)&double v74 = (float)v75;
          float32x4_t v77 = (float32x4_t)vdupq_lane_s32(*(int32x2_t *)&v74, 0);
          do
          {
            float32x4_t v78 = vmulq_n_f32(vaddq_f32(v127, vmlaq_f32(vmulq_n_f32(v125, (float)v76), v77, v126)), BaseAddress[v76]);
            float32x4_t v79 = vaddq_f32(v121, vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v118, v78.f32[0]), v119, *(float32x2_t *)v78.f32, 1), v120, v78, 2));
            float32x4_t v80 = vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v122, v79.f32[0]), v123, *(float32x2_t *)v79.f32, 1), v124, v79, 2);
            unint64_t v81 = vdivq_f32(v80, (float32x4_t)vdupq_laneq_s32((int32x4_t)v80, 2)).u64[0];
            LODWORD(v73) = llroundf(*((float *)&v81 + 1));
            if (v73 <= 0xBF)
            {
              unsigned int v82 = llroundf(*(float *)&v81);
              if ((v82 & 0x80000000) == 0 && (int)v82 <= 255)
              {
                v70[v76] = v67[v63 * (void)v73 + v82];
                *(_DWORD *)&v71[4 * v76] = *(_DWORD *)&v68[4 * v82 + v64 * (void)v73];
                v73 = &v69[v65 * (void)v73];
                *(_DWORD *)&v72[4 * v76] = *(_DWORD *)&v73[4 * v82];
              }
            }
            ++v76;
          }
          while (v14 > (double)v76);
        }
        double v74 = (double)++v75;
        v70 += v63;
        BaseAddress = (float *)((char *)BaseAddress + BytesPerRow);
        v71 += v64;
        v72 += v65;
      }
      while (v16 > (double)v75);
    }
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v112 depthBuffer], 1uLL);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v113 segmentationBuffer], 1uLL);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v113 confidenceBuffer], 1uLL);
    CVPixelBufferUnlockBaseAddress((CVPixelBufferRef)[v113 uncertaintyBuffer], 1uLL);
    CVPixelBufferUnlockBaseAddress(a5, 0);
    CVPixelBufferUnlockBaseAddress(a6, 0);
  }
  CVPixelBufferGetWidth(a6);
  CVPixelBufferGetHeight(a6);
  kdebug_trace();
  kdebug_trace();
}

- (void)pushToSceneUnderstandingSegmentation:(id)a3 pose:(id)a4
{
  float32x4_t v38 = (ARSegmentationData *)a3;
  id v6 = a4;
  if (self->_planeDetectionSession.__ptr_ && [(ARSegmentationData *)v38 normalsBuffer])
  {
    kdebug_trace();
    float32x4_t v7 = [(ARSegmentationData *)v38 segmentationBuffer];
    BOOL v8 = v7;
    if (v7)
    {
      double Width = (double)CVPixelBufferGetWidth(v7);
      double Height = (double)CVPixelBufferGetHeight(v8);
    }
    else
    {
      double Width = *MEMORY[0x1E4F1DB30];
      double Height = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    }
    uint64_t v11 = [(ARSegmentationData *)v38 sourceImageData];
    [v11 cameraIntrinsics];
    double v34 = v13;
    float v36 = v12;
    double v32 = v14;
    double v15 = [(ARSegmentationData *)v38 sourceImageData];
    [v15 imageResolution];
    v18.f32[0] = ARAdjustIntrinsicsForViewportSize(v36, v34, v32, v16, v17, Width, Height);
    simd_float3 v35 = v19;
    simd_float3 v37 = v18;
    simd_float3 v33 = v20;

    ptr = self->_planeDetectionSession.__ptr_;
    [v6 visionCameraTransform];
    simd_float4 v30 = v23;
    simd_float4 v31 = v22;
    simd_float4 v28 = v25;
    simd_float4 v29 = v24;
    [(ARSegmentationData *)v38 timestamp];
    double v27 = v26;
    v40.columns[1] = v35;
    v40.columns[0] = v37;
    v40.columns[0].i32[3] = 0;
    v40.columns[1].i32[3] = 0;
    v41.columns[0] = v31;
    v40.columns[2] = v33;
    v40.columns[2].i32[3] = 0;
    v41.columns[2] = v29;
    v41.columns[1] = v30;
    v41.columns[3] = v28;
    PlaneDetectionSession::PushSemanticsAndNormals(ptr, v38, v41, v40, v27);
    kdebug_trace();
  }
}

- (void)pushToHitTestingDepth:(id)a3 pose:(id)a4
{
  id v38 = a3;
  id v6 = a4;
  if (self->_raycastSession.__ptr_)
  {
    float32x4_t v7 = [v38 sourceImageData];
    [v7 cameraIntrinsics];
    double v34 = v9;
    float v36 = v8;
    double v32 = v10;
    uint64_t v11 = [v38 sourceImageData];
    [v11 imageResolution];
    double v13 = v12;
    double v15 = v14;
    [v38 depthBufferSize];
    v18.f32[0] = ARAdjustIntrinsicsForViewportSize(v36, v34, v32, v13, v15, v16, v17);
    simd_float3 v35 = v19;
    simd_float3 v37 = v18;
    simd_float3 v33 = v20;

    ptr = self->_raycastSession.__ptr_;
    simd_float4 v22 = (__CVBuffer *)[v38 singleFrameDepthBuffer];
    simd_float4 v23 = (__CVBuffer *)[v38 singleFrameConfidenceBuffer];
    [v6 visionCameraTransform];
    simd_float4 v25 = v24;
    simd_float4 v27 = v26;
    simd_float4 v29 = v28;
    simd_float4 v31 = v30;
    v40.columns[1] = v35;
    v40.columns[0] = v37;
    v40.columns[0].i32[3] = 0;
    v40.columns[1].i32[3] = 0;
    v40.columns[2] = v33;
    v40.columns[2].i32[3] = 0;
    v41.columns[0] = v25;
    v41.columns[1] = v27;
    v41.columns[2] = v29;
    v41.columns[3] = v31;
    RaycastSession::PushDenseFrame(ptr, v22, v23, v40, v41);
  }
}

- (void)pushToSceneUnderstandingDepth:(id)a3 segmentation:(id)a4 pose:(id)a5
{
  simd_float4x4 v41 = (ARMLDepthData *)a3;
  float v8 = (ARSegmentationData *)a4;
  id v9 = a5;
  if (self->_planeDetectionSession.__ptr_)
  {
    kdebug_trace();
    double v10 = [(ARMLDepthData *)v41 sourceImageData];
    [v10 cameraIntrinsics];
    double v37 = v12;
    float v39 = v11;
    double v35 = v13;
    double v14 = [(ARMLDepthData *)v41 sourceImageData];
    [v14 imageResolution];
    double v16 = v15;
    double v18 = v17;
    [(ARMLDepthData *)v41 depthBufferSize];
    v21.f32[0] = ARAdjustIntrinsicsForViewportSize(v39, v37, v35, v16, v18, v19, v20);
    simd_float3 v38 = v22;
    simd_float3 v40 = v21;
    simd_float3 v36 = v23;

    ptr = self->_planeDetectionSession.__ptr_;
    [v9 visionCameraTransform];
    simd_float4 v33 = v26;
    simd_float4 v34 = v25;
    simd_float4 v31 = v28;
    simd_float4 v32 = v27;
    [(ARSegmentationData *)v8 timestamp];
    double v30 = v29;
    v43.columns[1] = v38;
    v43.columns[0] = v40;
    v43.columns[0].i32[3] = 0;
    v43.columns[1].i32[3] = 0;
    v44.columns[0] = v34;
    v43.columns[2] = v36;
    v43.columns[2].i32[3] = 0;
    v44.columns[2] = v32;
    v44.columns[1] = v33;
    v44.columns[3] = v31;
    PlaneDetectionSession::PushDepthWithSemantics(ptr, v41, v8, v44, v43, v30);
    kdebug_trace();
  }
}

- (void)didReceiveKeyframesUpdatedCallback:(CV3DReconKeyframeList *)a3
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  CVPixelBufferRef v58 = 0;
  uint64_t Count = CV3DReconKeyframeListGetCount();
  kdebug_trace();
  kdebug_trace();
  double v45 = [MEMORY[0x1E4F1CA60] dictionary];
  if (!Count)
  {
LABEL_29:
    os_unfair_lock_lock(&self->_spatialMappingPointCloudsLock);
    [(NSMutableDictionary *)self->_spatialMappingPointClouds addEntriesFromDictionary:v45];
    os_unfair_lock_unlock(&self->_spatialMappingPointCloudsLock);
    kdebug_trace();
    goto LABEL_38;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t KeyframeUUIDAtIndex = CV3DReconKeyframeListGetKeyframeUUIDAtIndex();
    if (v58) {
      break;
    }
    float32x4_t v7 = (const void *)KeyframeUUIDAtIndex;
    float v8 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", KeyframeUUIDAtIndex);
    CFRelease(v7);
    CV3DReconKeyframeListGetKeyframeToWorldTransformAtIndex();
    double v46 = v9;
    double v47 = v10;
    double v48 = v11;
    double v49 = v12;
    if (v58)
    {
      simd_float3 v38 = _ARLogGeneral();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        float v39 = (objc_class *)objc_opt_class();
        simd_float3 v40 = NSStringFromClass(v39);
        simd_float4x4 v41 = v58;
        *(_DWORD *)buf = 138543874;
        v60 = v40;
        __int16 v61 = 2048;
        CVPixelBufferRef v62 = self;
        __int16 v63 = 2112;
        size_t v64 = v58;
        _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe transform: %@", buf, 0x20u);
      }
      goto LABEL_36;
    }
    uint64_t v13 = CV3DReconKeyframeListCopyKeyframeAtIndex();
    if (v58)
    {
      simd_float3 v38 = _ARLogGeneral();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
      {
        double v42 = (objc_class *)objc_opt_class();
        simd_float3x3 v43 = NSStringFromClass(v42);
        simd_float4x4 v44 = v58;
        *(_DWORD *)buf = 138543874;
        v60 = v43;
        __int16 v61 = 2048;
        CVPixelBufferRef v62 = self;
        __int16 v63 = 2112;
        size_t v64 = v58;
        _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe: %@", buf, 0x20u);
      }
LABEL_36:

      goto LABEL_37;
    }
    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    unint64_t v55 = __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke;
    float32x4_t v56 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v57 = v13;
    uint64_t PointCloud = CV3DReconKeyframeCreatePointCloud();
    if (v58)
    {
      double v15 = _ARLogGeneral();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        double v16 = (objc_class *)objc_opt_class();
        double v17 = NSStringFromClass(v16);
        double v18 = v58;
        *(_DWORD *)buf = 138543874;
        v60 = v17;
        __int16 v61 = 2048;
        CVPixelBufferRef v62 = self;
        __int16 v63 = 2112;
        size_t v64 = v58;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error creating point cloud keyframe: %@", buf, 0x20u);
      }
      int v19 = 1;
      goto LABEL_18;
    }
    uint64_t v20 = PointCloud;
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    long long v51 = __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke_177;
    long long v52 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v53 = PointCloud;
    CV3DReconKeyframeGetCreationTime();
    if (v58)
    {
      p_super = _ARLogGeneral();
      if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
      {
        simd_float3 v23 = (objc_class *)objc_opt_class();
        simd_float4 v24 = NSStringFromClass(v23);
        simd_float4 v25 = v58;
        *(_DWORD *)buf = 138543874;
        v60 = v24;
        __int16 v61 = 2048;
        CVPixelBufferRef v62 = self;
        __int16 v63 = 2112;
        size_t v64 = v58;
        _os_log_impl(&dword_1B88A2000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe timestamp: %@", buf, 0x20u);
      }
    }
    else
    {
      double v26 = v21;
      Pointsuint64_t Count = CV3DReconPointCloudGetPointsCount();
      if (v58)
      {
        p_super = _ARLogGeneral();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          simd_float4 v28 = (objc_class *)objc_opt_class();
          double v29 = NSStringFromClass(v28);
          double v30 = v58;
          *(_DWORD *)buf = 138543874;
          v60 = v29;
          __int16 v61 = 2048;
          CVPixelBufferRef v62 = self;
          __int16 v63 = 2112;
          size_t v64 = v58;
          _os_log_impl(&dword_1B88A2000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting point cloud size: %@", buf, 0x20u);
        }
      }
      else
      {
        if (!PointsCount)
        {
          simd_float4 v32 = [v45 objectForKeyedSubscript:v8];
          p_super = v32;
          if (v32) {
            -[NSObject updateTransform:](v32, "updateTransform:", v46, v47, v48, v49);
          }
          int v19 = 0;
          goto LABEL_17;
        }
        simd_float4 v31 = -[ARSpatialMappingPointCloud initWithPointCloud:smTransform:identifier:timestamp:]([ARSpatialMappingPointCloud alloc], "initWithPointCloud:smTransform:identifier:timestamp:", v20, v8, v46, v47, v48, v49, v26);
        if (v31)
        {
          [v45 setObject:v31 forKeyedSubscript:v8];
          int v19 = 0;
          p_super = &v31->super;
          goto LABEL_17;
        }
        p_super = _ARLogGeneral();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR))
        {
          simd_float4 v33 = (objc_class *)objc_opt_class();
          simd_float4 v34 = NSStringFromClass(v33);
          *(_DWORD *)buf = 138543618;
          v60 = v34;
          __int16 v61 = 2048;
          CVPixelBufferRef v62 = self;
          _os_log_impl(&dword_1B88A2000, p_super, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error constructing point cloud", buf, 0x16u);
        }
      }
    }
    int v19 = 1;
LABEL_17:

    v51((uint64_t)v50);
LABEL_18:
    v55((uint64_t)v54);

    if (v19) {
      goto LABEL_38;
    }
    if (Count == ++v5) {
      goto LABEL_29;
    }
  }
  float v8 = _ARLogGeneral();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    double v35 = (objc_class *)objc_opt_class();
    simd_float3 v36 = NSStringFromClass(v35);
    double v37 = v58;
    *(_DWORD *)buf = 138543874;
    v60 = v36;
    __int16 v61 = 2048;
    CVPixelBufferRef v62 = self;
    __int16 v63 = 2112;
    size_t v64 = v58;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting keyframe UUID: %@", buf, 0x20u);
  }
LABEL_37:

LABEL_38:
}

uint64_t __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F4147D98](*(void *)(a1 + 32));
}

uint64_t __63__ARWorldTrackingTechnique_didReceiveKeyframesUpdatedCallback___block_invoke_177(uint64_t a1)
{
  return MEMORY[0x1F4147EF8](*(void *)(a1 + 32));
}

- (ARWorldMap)serializeWorldMapWithReferenceOrigin:(double)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = objc_opt_new();
  if (CV3DSLAMSessionSerializeMap())
  {
    float32x4_t v7 = -[ARWorldMap initWithTrackingData:referenceOriginTransform:]([ARWorldMap alloc], "initWithTrackingData:referenceOriginTransform:", v6, a2, a3, a4, a5);
  }
  else
  {
    float v8 = _ARLogTechnique();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      double v9 = (objc_class *)objc_opt_class();
      double v10 = NSStringFromClass(v9);
      *(_DWORD *)buf = 138543874;
      double v17 = v10;
      __int16 v18 = 2048;
      uint64_t v19 = a1;
      __int16 v20 = 2112;
      uint64_t v21 = 0;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to serialize map: %@", buf, 0x20u);
    }
    float32x4_t v7 = 0;
  }

  return v7;
}

- (void)clearMap
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(ARWorldTrackingTechnique *)self vioHandleState] == 3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    self->_didClearMap = 1;
    [(ARWorldTrackingTechnique *)self setHasQualityKeyframe:0];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    kdebug_trace();
    char v3 = CV3DSLAMSessionClearMap();
    id v4 = _ARLogTechnique();
    uint64_t v5 = v4;
    if (v3)
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        id v6 = (objc_class *)objc_opt_class();
        float32x4_t v7 = NSStringFromClass(v6);
        *(_DWORD *)buf = 138543618;
        double v11 = v7;
        __int16 v12 = 2048;
        uint64_t v13 = self;
        _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: World map cleared", buf, 0x16u);
      }
      kdebug_trace();
      [(ARWorldTrackingTechnique *)self resetSceneReconstruction];
      [(ARWorldTrackingTechnique *)self _resetSurfaceDetection];
    }
    else
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        float v8 = (objc_class *)objc_opt_class();
        double v9 = NSStringFromClass(v8);
        *(_DWORD *)buf = 138543874;
        double v11 = v9;
        __int16 v12 = 2048;
        uint64_t v13 = self;
        __int16 v14 = 2112;
        uint64_t v15 = 0;
        _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error clearing vio map: %@", buf, 0x20u);
      }
    }
  }
}

- (id)serializeSurfaceData
{
  if (self->_planeDetectionSession.__ptr_)
  {
    p_surfaceDetectionSessionLock = &self->_surfaceDetectionSessionLock;
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    id v4 = PlaneDetectionSession::SerializePlanes(self->_planeDetectionSession.__ptr_);
    os_unfair_lock_unlock(p_surfaceDetectionSessionLock);
  }
  else
  {
    id v4 = 0;
  }
  return v4;
}

- (void)loadSurfaceData:(id)a3
{
  CFDataRef v4 = (const __CFData *)a3;
  if (self->_planeDetectionSession.__ptr_)
  {
    CFDataRef v5 = v4;
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    PlaneDetectionSession::LoadPlanes(self->_planeDetectionSession.__ptr_, v5);
    self->_hasLoadedSurfaceData = 1;
    os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
    CFDataRef v4 = v5;
  }
}

- (void)addReferenceAnchors:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_allowPoseGraphUpdates)
  {
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    id v45 = v4;
    obuint64_t j = v4;
    uint64_t v5 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v57;
      do
      {
        uint64_t v7 = 0;
        uint64_t v46 = v5;
        do
        {
          if (*(void *)v57 != v6) {
            objc_enumerationMutation(obj);
          }
          float v8 = *(void **)(*((void *)&v56 + 1) + 8 * v7);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              *(double *)v9.i64 = ARRenderingToVisionCoordinateTransform();
              float32x4_t v53 = v10;
              float32x4_t v54 = v9;
              float32x4_t v51 = v12;
              float32x4_t v52 = v11;
              [v8 referenceTransform];
              long long v49 = v14;
              long long v50 = v13;
              long long v47 = v16;
              long long v48 = v15;
              *(double *)&long long v17 = ARVisionToRenderingCoordinateTransform();
              uint64_t v21 = 0;
              long long v60 = v50;
              long long v61 = v49;
              long long v62 = v48;
              long long v63 = v47;
              do
              {
                *(float32x4_t *)&buf[v21] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v54, COERCE_FLOAT(*(long long *)((char *)&v60 + v21))), v53, *(float32x2_t *)((char *)&v60 + v21), 1), v52, *(float32x4_t *)((char *)&v60 + v21), 2), v51, *(float32x4_t *)((char *)&v60 + v21), 3);
                v21 += 16;
              }
              while (v21 != 64);
              uint64_t v22 = 0;
              float32x4_t v23 = *(float32x4_t *)buf;
              float32x4_t v24 = *(float32x4_t *)&buf[16];
              float32x4_t v25 = *(float32x4_t *)v66;
              float32x4_t v26 = *(float32x4_t *)&v66[16];
              long long v60 = v17;
              long long v61 = v18;
              long long v62 = v19;
              long long v63 = v20;
              do
              {
                *(float32x4_t *)&buf[v22] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(*(long long *)((char *)&v60 + v22))), v24, *(float32x2_t *)((char *)&v60 + v22), 1), v25, *(float32x4_t *)((char *)&v60 + v22), 2), v26, *(float32x4_t *)((char *)&v60 + v22), 3);
                v22 += 16;
              }
              while (v22 != 64);
              *(double *)v68.columns[0].i64 = ARNormalizedTransform(*(float32x4_t *)buf);
              __invert_f4(v68);
              simd_float4 v27 = [v8 identifier];
              simd_float4 v28 = (const void *)objc_msgSend(v27, "ar_createCFUUIDRef");

              *(void *)&long long v60 = 0;
              int v29 = CV3DSLAMSessionAddAnchor();
              if ((v29 & 1) == 0)
              {
                double v30 = _ARLogTechnique();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
                {
                  simd_float4 v31 = (objc_class *)objc_opt_class();
                  simd_float4 v32 = NSStringFromClass(v31);
                  simd_float4 v33 = (void *)v60;
                  *(_DWORD *)buf = 138543874;
                  *(void *)&uint8_t buf[4] = v32;
                  *(_WORD *)&unsigned char buf[12] = 2048;
                  *(void *)&buf[14] = self;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)&buf[24] = v60;
                  _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error adding anchor: %@", buf, 0x20u);
                }
              }
              simd_float4 v34 = _ARLogTechnique();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                double v35 = (objc_class *)objc_opt_class();
                NSStringFromClass(v35);
                id v36 = (id)objc_claimAutoreleasedReturnValue();
                double v37 = [v8 identifier];
                [v8 referenceTransform];
                uint64_t v42 = ARMatrix4x4Description(0, v38, v39, v40, v41);
                simd_float3x3 v43 = (void *)v42;
                *(_DWORD *)buf = 138544386;
                simd_float4x4 v44 = @"FAILED";
                if (v29) {
                  simd_float4x4 v44 = @"SUCESS";
                }
                *(void *)&uint8_t buf[4] = v36;
                *(_WORD *)&unsigned char buf[12] = 2048;
                *(void *)&buf[14] = self;
                *(_WORD *)&buf[22] = 2112;
                *(void *)&buf[24] = v37;
                *(_WORD *)CVPixelBufferRef v66 = 2112;
                *(void *)&v66[2] = v42;
                *(_WORD *)&v66[10] = 2112;
                *(void *)&v66[12] = v44;
                _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CV3DVIOAddAnchor: %@ - %@, %@", buf, 0x34u);
              }
              CFRelease(v28);
              uint64_t v5 = v46;
            }
          }
          ++v7;
        }
        while (v7 != v5);
        uint64_t v5 = [obj countByEnumeratingWithState:&v56 objects:v64 count:16];
      }
      while (v5);
    }

    id v4 = v45;
  }
}

- (void)removeReferenceAnchors:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  if (self->_allowPoseGraphUpdates && self->_slamSessionHandle)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    obuint64_t j = v24;
    uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v4)
    {
      uint64_t v26 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v28 != v26) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v7 = [v6 identifier];
          float v8 = (const void *)objc_msgSend(v7, "ar_createCFUUIDRef");

          int v9 = CV3DSLAMSessionRemoveAnchor();
          if ((v9 & 1) == 0)
          {
            float32x4_t v10 = _ARLogTechnique();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
            {
              float32x4_t v11 = (objc_class *)objc_opt_class();
              float32x4_t v12 = NSStringFromClass(v11);
              *(_DWORD *)buf = 138543874;
              id v32 = v12;
              __int16 v33 = 2048;
              simd_float4 v34 = self;
              __int16 v35 = 2112;
              id v36 = 0;
              _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error removing anchor: %@", buf, 0x20u);
            }
          }
          long long v13 = _ARLogTechnique();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            long long v14 = (objc_class *)objc_opt_class();
            NSStringFromClass(v14);
            id v15 = (id)objc_claimAutoreleasedReturnValue();
            long long v16 = [v6 identifier];
            [v6 referenceTransform];
            uint64_t v21 = ARMatrix4x4Description(0, v17, v18, v19, v20);
            uint64_t v22 = (void *)v21;
            *(_DWORD *)buf = 138544386;
            float32x4_t v23 = @"FAILED";
            if (v9) {
              float32x4_t v23 = @"SUCESS";
            }
            id v32 = v15;
            __int16 v33 = 2048;
            simd_float4 v34 = self;
            __int16 v35 = 2112;
            id v36 = v16;
            __int16 v37 = 2112;
            uint64_t v38 = v21;
            __int16 v39 = 2112;
            __n128 v40 = v23;
            _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: CV3DVIORemoveAnchor: %@ - %@, %@", buf, 0x34u);
          }
          CFRelease(v8);
        }
        uint64_t v4 = [obj countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v4);
    }
  }
}

- (BOOL)_isRelocalizing
{
  return self->_relocalizationState != 0;
}

- (void)addObserver:(id)a3
{
  observersSemaphore = self->_observersSemaphore;
  id v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSHashTable *)self->_observers addObject:v5];

  uint64_t v6 = self->_observersSemaphore;
  dispatch_semaphore_signal(v6);
}

- (void)removeObserver:(id)a3
{
  observersSemaphore = self->_observersSemaphore;
  id v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSHashTable *)self->_observers removeObject:v5];

  uint64_t v6 = self->_observersSemaphore;
  dispatch_semaphore_signal(v6);
}

- (id)getObservers
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  char v3 = [(NSHashTable *)self->_observers allObjects];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
  return v3;
}

- (void)pushCollaborationData:(id)a3
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v100 = a3;
  uint64_t v4 = [(ARWorldTrackingTechnique *)self mutableOptions];
  char v5 = [v4 isCollaborationEnabled];

  if (v5)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    id v106 = 0;
    if ([v100 vioDataType] == 7)
    {
      uint64_t v104 = 0;
      uint64_t v114 = 0;
      long long v112 = 0u;
      long long v113 = 0u;
      memset(v111, 0, sizeof(v111));
      uint64_t v108 = 0;
      uint64_t v109 = 0;
      uint64_t v110 = 0;
      uint64_t v6 = [v100 vioData];
      int CMPoseAnchorTransformation = CV3DSLAMSessionGetCMPoseAnchorTransformation();

      if (CMPoseAnchorTransformation)
      {
        *(double *)v8.i64 = ARMatrix4x4MakeRowMajorTransform((double *)v111);
        v101.columns[0] = v8;
        simd_float4 v94 = v10;
        simd_float4 v97 = v9;
        simd_float4 v91 = v11;
        *(double *)v12.i64 = ARVisionToRenderingCoordinateTransform();
        float32x4_t v89 = v13;
        float32x4_t v90 = v12;
        float32x4_t v87 = v15;
        float32x4_t v88 = v14;
        *(double *)v16.i64 = ARRenderingToVisionCoordinateTransform();
        simd_float4 v83 = v17;
        simd_float4 v84 = v16;
        simd_float4 v85 = v19;
        simd_float4 v86 = v18;
        v120.columns[0] = v101.columns[0];
        v120.columns[2] = v94;
        v120.columns[1] = v97;
        v120.columns[3] = v91;
        simd_float4x4 v121 = __invert_f4(v120);
        uint64_t v20 = 0;
        simd_float4x4 v115 = v121;
        do
        {
          *(float32x4_t *)&buf[v20 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v90, COERCE_FLOAT(*(_OWORD *)&v115.columns[v20])), v89, *(float32x2_t *)v115.columns[v20].f32, 1), v88, (float32x4_t)v115.columns[v20], 2), v87, (float32x4_t)v115.columns[v20], 3);
          ++v20;
        }
        while (v20 != 4);
        uint64_t v21 = 0;
        float32x4_t v22 = *(float32x4_t *)buf;
        float32x4_t v23 = *(float32x4_t *)&buf[16];
        float32x4_t v24 = v117;
        float32x4_t v25 = v118;
        v115.columns[0] = v84;
        v115.columns[1] = v83;
        v115.columns[2] = v86;
        v115.columns[3] = v85;
        do
        {
          *(float32x4_t *)&buf[v21 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v22, COERCE_FLOAT(*(_OWORD *)&v115.columns[v21])), v23, *(float32x2_t *)v115.columns[v21].f32, 1), v24, (float32x4_t)v115.columns[v21], 2), v25, (float32x4_t)v115.columns[v21], 3);
          ++v21;
        }
        while (v21 != 4);
        v101.columns[0] = *(simd_float4 *)buf;
        float32x4_t v95 = v117;
        float32x4_t v98 = *(float32x4_t *)&buf[16];
        float32x4_t v92 = v118;
        if (ARLinkedOnOrAfterAzul())
        {
          *(double *)v26.i64 = simd_matrix4x4((float32x4_t)_PromotedConst_1);
          uint64_t v27 = 0;
          v115.columns[0] = v26;
          v115.columns[1] = v28;
          v115.columns[2] = v29;
          v115.columns[3] = v30;
          do
          {
            *(float32x4_t *)&buf[v27 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v101.columns[0], COERCE_FLOAT(*(_OWORD *)&v115.columns[v27])), v98, *(float32x2_t *)v115.columns[v27].f32, 1), v95, (float32x4_t)v115.columns[v27], 2), v92, (float32x4_t)v115.columns[v27], 3);
            ++v27;
          }
          while (v27 != 4);
          v101.columns[0] = *(simd_float4 *)&buf[16];
          float32x4_t v96 = v117;
          float32x4_t v99 = *(float32x4_t *)buf;
          float32x4_t v93 = v118;
          *(double *)v31.i64 = simd_matrix4x4((float32x4_t)_PromotedConst_582);
          uint64_t v32 = 0;
          v115.columns[0] = v31;
          v115.columns[1] = v33;
          v115.columns[2] = v34;
          v115.columns[3] = v35;
          do
          {
            *(float32x4_t *)&buf[v32 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(_OWORD *)&v115.columns[v32])), (float32x4_t)v101.columns[0], *(float32x2_t *)v115.columns[v32].f32, 1), v96, (float32x4_t)v115.columns[v32], 2), v93, (float32x4_t)v115.columns[v32], 3);
            ++v32;
          }
          while (v32 != 4);
          v101.columns[0].i64[0] = *(void *)buf;
          v95.i64[0] = v117.i64[0];
          v98.i64[0] = *(void *)&buf[16];
          v92.i64[0] = v118.i64[0];
        }
        v115.columns[0] = v105;
        id v36 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:&v115];
        __int16 v37 = -[ARAnchor initWithIdentifier:transform:]([ARParticipantAnchor alloc], "initWithIdentifier:transform:", v36, *(double *)v101.columns[0].i64, *(double *)v98.i64, *(double *)v95.i64, *(double *)v92.i64);
        [(ARAnchor *)v37 setSessionIdentifier:v36];
        dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        [(NSMutableSet *)self->_participantAnchors removeObject:v37];
        [(NSMutableSet *)self->_participantAnchors addObject:v37];
        uint64_t v38 = _ARLogTechnique();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
        {
          __int16 v39 = (objc_class *)objc_opt_class();
          __n128 v40 = NSStringFromClass(v39);
          __n128 v41 = [(ARAnchor *)v37 description];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v40;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v41;
          _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Participant anchor updated: %@", buf, 0x20u);
        }
        dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
      }
      else
      {
        unint64_t v75 = _ARLogTechnique();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
        {
          unint64_t v76 = (objc_class *)objc_opt_class();
          float32x4_t v77 = NSStringFromClass(v76);
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v77;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v106;
          _os_log_impl(&dword_1B88A2000, v75, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error getting pose for participant anchor: %@", buf, 0x20u);
        }
      }
      float32x4_t v78 = self;
    }
    else
    {
      [v100 vioDataType];
      id v45 = [v100 vioData];
      [v45 length];
      [v100 vioSessionID];
      kdebug_trace();

      uint64_t v46 = [v100 anchors];

      if (v46)
      {
        anchorsReceived = self->_anchorsReceived;
        long long v48 = [v100 anchors];
        [(NSMutableSet *)anchorsReceived minusSet:v48];

        long long v49 = self->_anchorsReceived;
        long long v50 = [v100 anchors];
        [(NSMutableSet *)v49 unionSet:v50];

        float32x4_t v51 = _ARLogTechnique();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEBUG))
        {
          float32x4_t v52 = (objc_class *)objc_opt_class();
          NSStringFromClass(v52);
          id v53 = (id)objc_claimAutoreleasedReturnValue();
          float32x4_t v54 = [v100 anchors];
          uint64_t v55 = [v54 count];
          uint64_t v56 = [(NSMutableSet *)self->_anchorsReceived count];
          *(_DWORD *)int8x16_t v111 = 138544130;
          *(void *)&v111[4] = v53;
          *(_WORD *)&v111[12] = 2048;
          *(void *)&v111[14] = self;
          *(_WORD *)&v111[22] = 2048;
          *(void *)&v111[24] = v55;
          LOWORD(v112) = 2048;
          *(void *)((char *)&v112 + 2) = v56;
          _os_log_impl(&dword_1B88A2000, v51, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: collaboration data received with anchors: %tu => %tu", v111, 0x2Au);
        }
        long long v102 = 0u;
        long long v103 = 0u;
        memset(&v101.columns[2], 0, 32);
        long long v57 = self->_anchorsReceived;
        uint64_t v58 = [(NSMutableSet *)v57 countByEnumeratingWithState:&v101.columns[2] objects:v107 count:16];
        if (v58)
        {
          uint64_t v59 = *(void *)v101.columns[3].i64[0];
          do
          {
            for (uint64_t i = 0; i != v58; ++i)
            {
              if (*(void *)v101.columns[3].i64[0] != v59) {
                objc_enumerationMutation(v57);
              }
              long long v61 = *(void **)(v101.columns[2].i64[1] + 8 * i);
              long long v62 = _ARLogTechnique();
              if (os_log_type_enabled(v62, OS_LOG_TYPE_DEBUG))
              {
                long long v63 = (objc_class *)objc_opt_class();
                NSStringFromClass(v63);
                id v64 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v65 = [v61 description];
                *(_DWORD *)int8x16_t v111 = 138543874;
                *(void *)&v111[4] = v64;
                *(_WORD *)&v111[12] = 2048;
                *(void *)&v111[14] = self;
                *(_WORD *)&v111[22] = 2112;
                *(void *)&v111[24] = v65;
                _os_log_impl(&dword_1B88A2000, v62, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: received anchor: %@", v111, 0x20u);
              }
            }
            uint64_t v58 = [(NSMutableSet *)v57 countByEnumeratingWithState:&v101.columns[2] objects:v107 count:16];
          }
          while (v58);
        }
      }
      [v100 vioDataType];
      CVPixelBufferRef v66 = [v100 vioData];
      int v67 = CV3DSLAMSessionPushCMData();

      simd_float4x4 v68 = _ARLogTechnique();
      int8x16_t v69 = v68;
      if (v67)
      {
        if (os_log_type_enabled(v68, OS_LOG_TYPE_DEBUG))
        {
          int8x16_t v70 = (objc_class *)objc_opt_class();
          NSStringFromClass(v70);
          id v71 = (id)objc_claimAutoreleasedReturnValue();
          v72 = [v100 vioData];
          uint64_t v73 = [v72 length];
          double v74 = NSStringFromSLAMCMDataType([v100 vioDataType]);
          *(_DWORD *)int8x16_t v111 = 138544130;
          *(void *)&v111[4] = v71;
          *(_WORD *)&v111[12] = 2048;
          *(void *)&v111[14] = self;
          *(_WORD *)&v111[22] = 2048;
          *(void *)&v111[24] = v73;
          LOWORD(v112) = 2112;
          *(void *)((char *)&v112 + 2) = v74;
          _os_log_impl(&dword_1B88A2000, v69, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: collaboration data pushed to VIO: %lu, %@", v111, 0x2Au);
        }
      }
      else if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
      {
        float32x4_t v79 = (objc_class *)objc_opt_class();
        float32x4_t v80 = NSStringFromClass(v79);
        slamSessionHandle = self->_slamSessionHandle;
        id v82 = v106;
        *(_DWORD *)int8x16_t v111 = 138544130;
        *(void *)&v111[4] = v80;
        *(_WORD *)&v111[12] = 2048;
        *(void *)&v111[14] = self;
        *(_WORD *)&v111[22] = 2048;
        *(void *)&v111[24] = slamSessionHandle;
        LOWORD(v112) = 2112;
        *(void *)((char *)&v112 + 2) = v106;
        _os_log_impl(&dword_1B88A2000, v69, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error pushing SLAM data %p, %@", v111, 0x2Au);
      }
      [v100 vioSessionID];
      float32x4_t v78 = self;
      kdebug_trace();
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v78->_sessionHandleStateSemaphore);
  }
  else
  {
    uint64_t v42 = _ARLogTechnique();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
    {
      simd_float3x3 v43 = (objc_class *)objc_opt_class();
      simd_float4x4 v44 = NSStringFromClass(v43);
      *(_DWORD *)int8x16_t v111 = 138543618;
      *(void *)&v111[4] = v44;
      *(_WORD *)&v111[12] = 2048;
      *(void *)&v111[14] = self;
      _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: collaboration data cannot be pushed because the feature is disabled.", v111, 0x16u);
    }
  }
}

- (void)_reportCollaborationData:(id)a3 type:(unsigned __int8)a4 metadata:(const void *)a5
{
  unsigned int v6 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  simd_float4 v9 = _ARLogTechnique();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    simd_float4 v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = [v8 length];
    float32x4_t v13 = NSStringFromSLAMCMDataType(v6);
    *(_DWORD *)buf = 138544386;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = self;
    __int16 v37 = 2048;
    uint64_t v38 = v12;
    __int16 v39 = 2112;
    __n128 v40 = v13;
    __int16 v41 = 2048;
    uint64_t v42 = a5;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: collaboration data received from VIO: %lu, %@, %p", buf, 0x34u);
  }
  float32x4_t v14 = [[ARCollaborationData alloc] initWithVIOData:v8 type:v6 sessionID:[(ARWorldTrackingTechnique *)self vioSessionIdentifier]];
  if (v6 != 1) {
    goto LABEL_10;
  }
  char v34 = 0;
  long long v33 = 0uLL;
  uint64_t v32 = 0;
  if (!MEMORY[0x1BA9C47C0](a5, &v34, &v33, &v32))
  {
    simd_float4 v16 = _ARLogTechnique();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      simd_float4 v17 = (objc_class *)objc_opt_class();
      simd_float4 v18 = NSStringFromClass(v17);
      simd_float4 v19 = v32;
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = self;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v32;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to parse anchor metadata: %@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  if (v34)
  {
    *(_OWORD *)buf = v33;
    float32x4_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDBytes:buf];
    [(ARCollaborationData *)v14 setAnchorIdentifier:v15];

LABEL_10:
    [(ARWorldTrackingTechnique *)self getObservers];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v20 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v35 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v20);
          }
          float32x4_t v24 = *(void **)(*((void *)&v28 + 1) + 8 * v23);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v24, "technique:didOutputCollaborationData:", self, v14, (void)v28);
          }
          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v35 count:16];
      }
      while (v21);
    }

    goto LABEL_20;
  }
  float32x4_t v25 = _ARLogTechnique();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    simd_float4 v26 = (objc_class *)objc_opt_class();
    uint64_t v27 = NSStringFromClass(v26);
    *(_DWORD *)buf = 138543618;
    *(void *)&uint8_t buf[4] = v27;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1B88A2000, v25, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Not reporting non-user created anchor.", buf, 0x16u);
  }
LABEL_20:
}

- (void)removePlanesByUUIDs:(id)a3
{
  id v4 = a3;
  if (self->_planeDetectionSession.__ptr_)
  {
    id v5 = v4;
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    PlaneDetectionSession::ErasePlanes((uint64_t)self->_planeDetectionSession.__ptr_, v5);
    os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
    id v4 = v5;
  }
}

- (BOOL)isMultiSessionMode
{
  uint64_t v2 = [(ARWorldTrackingTechnique *)self mutableOptions];
  id v3 = [v2 slamConfiguration];
  [v3 UTF8String];
  BOOL v4 = CV3DSLAMConfigPresetFromString() == 26;

  return v4;
}

- (int)extentCheckFromConfiguration
{
  if (([(ARWorldTrackingOptions *)self->_mutableOptions planeDetection] & 0x200) != 0) {
    return 4;
  }
  else {
    return 2;
  }
}

- (id)raycast:(id)a3
{
  id v4 = a3;
  if (self->_raycastSession.__ptr_)
  {
    ARInitializeHitTestIntentWithExtentCheck((uint64_t)v12, v4, 0, [(ARWorldTrackingTechnique *)self extentCheckFromConfiguration], *(simd_float4 *)self->_anon_280, *(simd_float4 *)&self->_anon_280[16], *(simd_float4 *)&self->_anon_280[32], *(simd_float4 *)&self->_anon_280[48]);
    ptr = self->_raycastSession.__ptr_;
    [(ARWorldTrackingTechnique *)self referenceOriginTransform];
    simd_float4 v10 = RaycastSession::PerformHitTest(v6, v7, v8, v9, (uint64_t)ptr, (uint64_t)v12, v4);
    ARReleaseHitTestIntent((uint64_t)v12);
  }
  else
  {
    simd_float4 v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (id)trackedRaycast:(id)a3 updateHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_raycastSession.__ptr_)
  {
    ARInitializeHitTestIntentWithExtentCheck((uint64_t)v12, v6, 1, [(ARWorldTrackingTechnique *)self extentCheckFromConfiguration], *(simd_float4 *)self->_anon_280, *(simd_float4 *)&self->_anon_280[16], *(simd_float4 *)&self->_anon_280[32], *(simd_float4 *)&self->_anon_280[48]);
    float32x4_t v8 = RaycastSession::PerformHitTest(*(float32x4_t *)self->_anon_280, *(float32x4_t *)&self->_anon_280[16], *(float32x4_t *)&self->_anon_280[32], *(float32x4_t *)&self->_anon_280[48], (uint64_t)self->_raycastSession.__ptr_, (uint64_t)v12, v6);
    if ([v8 count])
    {
      float32x4_t v9 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", v13);
      ARReleaseHitTestIntent((uint64_t)v12);
      simd_float4 v10 = [[ARTrackedRaycast alloc] initWithIdentifier:v9 ray:v6 worldTrackingTechnique:self updateHandler:v7];
      [(ARTrackedRaycastPostProcessor *)self->_trackedRaycastPostProcessor addTrackedRaycast:v10 andProcessInitialResults:v8];
    }
    else
    {
      ARReleaseHitTestIntent((uint64_t)v12);
      simd_float4 v10 = 0;
    }
  }
  else
  {
    simd_float4 v10 = 0;
  }

  return v10;
}

- (void)stopRaycast:(id)a3
{
  id v4 = a3;
  trackedRaycastPostProcessor = self->_trackedRaycastPostProcessor;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__ARWorldTrackingTechnique_stopRaycast___block_invoke;
  v7[3] = &unk_1E6186698;
  id v8 = v4;
  float32x4_t v9 = self;
  id v6 = v4;
  [(ARTrackedRaycastPostProcessor *)trackedRaycastPostProcessor performBlockWhileLockingRaycasts:v7];
}

void __40__ARWorldTrackingTechnique_stopRaycast___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) identifier];
  CFUUIDRef v2 = (const __CFUUID *)objc_msgSend(v5, "ar_createCFUUIDRef");

  RaycastSession::StopRaycast(*(RaycastSession **)(*(void *)(a1 + 40) + 608), v2);
  id v3 = *(void **)(a1 + 32);
  id v4 = *(void **)(*(void *)(a1 + 40) + 592);
  id v6 = [v3 identifier];
  objc_msgSend(v4, "removeTrackedRaycastWithIdentifier:");
}

- (void)invalidateAllRaycasts
{
  trackedRaycastPostProcessor = self->_trackedRaycastPostProcessor;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__ARWorldTrackingTechnique_invalidateAllRaycasts__block_invoke;
  v3[3] = &unk_1E61866C0;
  v3[4] = self;
  [(ARTrackedRaycastPostProcessor *)trackedRaycastPostProcessor performBlockWhileLockingRaycasts:v3];
}

uint64_t __49__ARWorldTrackingTechnique_invalidateAllRaycasts__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 592) invalidateAllRaycasts];
}

- (void)stopAllRaycasts
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  long long v6 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  CFUUIDRef v2 = [(ARTrackedRaycastPostProcessor *)self->_trackedRaycastPostProcessor trackedRaycasts];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v7;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * v5++) stopTracking];
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

- (void)didUpdateRaycastResult:(CV3DHitTestResults *)a3
{
  id v14 = (id)objc_opt_new();
  unint64_t var1 = a3->var1;
  if (var1)
  {
    uint64_t v6 = 0;
    for (unint64_t i = 0; i < var1; ++i)
    {
      long long v8 = &a3->var0[v6];
      if (v8->var0)
      {
        long long v9 = [(ARWorldTrackingTechnique *)self raycastResultFrom:&a3->var0[v6]];
        simd_float4 v10 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithCFUUIDRef:", v8->var0);
        uint64_t v11 = [v14 objectForKeyedSubscript:v10];

        if (!v11)
        {
          uint64_t v12 = objc_opt_new();
          [v14 setObject:v12 forKeyedSubscript:v10];
        }
        uint64_t v13 = [v14 objectForKeyedSubscript:v10];
        [v13 addObject:v9];

        unint64_t var1 = a3->var1;
      }
      ++v6;
    }
  }
  [(ARTrackedRaycastPostProcessor *)self->_trackedRaycastPostProcessor processUpdatedResults:v14];
  CV3DReleaseHitTestResults();
}

- (void)_handleRaycastResultCallback:(CV3DRaycastResultMap *)a3
{
  [(ARWorldTrackingTechnique *)self referenceOriginTransform];
  ARRaycastResultsDictionaryFrom(a3, v7);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5) {
    [(ARTrackedRaycastPostProcessor *)self->_trackedRaycastPostProcessor processUpdatedResults:v5];
  }
}

- (id)raycastResultFrom:(CV3DHitTestResult *)a3
{
  [(ARWorldTrackingTechnique *)self referenceOriginTransform];
  return ARRaycastResultFrom(a3, v4);
}

- (void)_updateVIOLineDetectionPolicy
{
  uint64_t v3 = [(ARWorldTrackingTechnique *)self options];
  if ([v3 planeEstimationShouldUseJasperData])
  {
  }
  else
  {
    simd_float4x4 v4 = [(ARWorldTrackingTechnique *)self options];
    uint64_t v5 = [v4 planeDetection];

    if (v5)
    {
      uint64_t v6 = (unsigned __int8 *)MEMORY[0x1E4F4D448];
      goto LABEL_6;
    }
  }
  uint64_t v6 = (unsigned __int8 *)MEMORY[0x1E4F4D450];
LABEL_6:
  slamSessionHandle = self->_slamSessionHandle;
  uint64_t v8 = *v6;
  MEMORY[0x1F4109F10](slamSessionHandle, v8, 0);
}

- (int64_t)_initializeSLAMAndPredictorHandle
{
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  uint64_t v119 = [(ARWorldTrackingTechnique *)self mutableOptions];
  [v119 initialWorldMap];
  v3 = CFUUIDRef v2 = self;

  if (v3) {
    self->_relocalizationState = 2;
  }
  kdebug_trace();
  uint64_t v155 = 0;
  int v4 = [v119 createSLAMCalibration:&v155];
  v151[0] = MEMORY[0x1E4F143A8];
  v151[1] = 3221225472;
  v152 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke;
  v153 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v154 = v155;
  if (!v4)
  {
    uint64_t v150 = 0;
    objc_msgSend(v119, "createSLAMConfig:calibration:", &v150);
    v145 = 0;
    v146[0] = MEMORY[0x1E4F143A8];
    v146[1] = 3221225472;
    v147 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_2;
    v148 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v149 = v150;
    if (!CV3DSLAMConfigAsString())
    {
      simd_float4 v10 = _ARLogTechnique();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v13 = [(ARWorldTrackingTechnique *)self mutableOptions];
        id v14 = [v13 slamConfiguration];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        __int16 v158 = 2112;
        v159 = v14;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Created SLAM configuration with configuration preset '%@'. SLAM config string:", buf, 0x20u);
      }
      float32x4_t v15 = (void *)[[NSString alloc] initWithUTF8String:v145];
      ARLogDebugNoClassLongMessage(v15, @"ARWorldTrackingTechnique");

      free(v145);
      CFUUIDRef v2 = self;
    }
    id v144 = 0;
    uint64_t v16 = CV3DSLAMSessionCreate();
    p_slamSessionHandle = &v2->_slamSessionHandle;
    v2->_slamSessionHandle = (CV3DSLAMSession *)v16;
    if (!v16)
    {
      uint64_t v23 = _ARLogTechnique();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        float32x4_t v24 = (objc_class *)objc_opt_class();
        float32x4_t v25 = NSStringFromClass(v24);
        simd_float4 v26 = *p_slamSessionHandle;
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        __int16 v158 = 2048;
        v159 = (const char *)v26;
        __int16 v160 = 2112;
        id v161 = v144;
        _os_log_impl(&dword_1B88A2000, v23, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error initializing SLAM handle (%p): %@", buf, 0x2Au);
      }
      uint64_t v27 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v28 = ARKitCoreBundle();
      long long v29 = [v28 localizedStringForKey:@"Unable to initialize tracking." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      [v27 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      long long v30 = ARErrorWithCodeAndUserInfo(200, v27);
      [(ARWorldTrackingTechnique *)self _didFailWithError:v30];

      int64_t v9 = 4;
      goto LABEL_23;
    }
    uint64_t v18 = CV3DPosePredictionConfigCreate();
    v140[0] = MEMORY[0x1E4F143A8];
    v140[1] = 3221225472;
    v141 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_201;
    v142 = &__block_descriptor_40_e5_v8__0l;
    uint64_t v143 = v18;
    int v19 = CV3DPosePredictionCreate();
    if (v19)
    {
      id v20 = _ARLogGeneral();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = (objc_class *)objc_opt_class();
        uint64_t v22 = NSStringFromClass(v21);
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v22;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = v2;
        __int16 v158 = 1024;
        LODWORD(v159) = v19;
        _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: CV3DPosePredictionCreate error: %d", buf, 0x1Cu);
      }
    }
    else
    {
      if (!CV3PosePredictionInitialize())
      {
        kdebug_trace();
        v138 = 0;
        simd_float4x4 v139 = 0;
        if (CV3DSLAMSessionGetSessionID())
        {
          v2->_vioSessionIdentifier = (unint64_t)v139;
          __n128 v40 = _ARLogTechnique();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            __int16 v41 = (objc_class *)objc_opt_class();
            uint64_t v42 = NSStringFromClass(v41);
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v42;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v2;
            __int16 v158 = 2048;
            v159 = v139;
            _os_log_impl(&dword_1B88A2000, v40, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with session identifier %llX", buf, 0x20u);
          }
        }
        else
        {
          __n128 v40 = _ARLogTechnique();
          if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
          {
            uint64_t v43 = (objc_class *)objc_opt_class();
            simd_float4x4 v44 = NSStringFromClass(v43);
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v44;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = v2;
            __int16 v158 = 2112;
            v159 = (const char *)v144;
            _os_log_impl(&dword_1B88A2000, v40, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: unable to read VIO session identifier: %@", buf, 0x20u);
          }
        }

        objc_initWeak(&location, self);
        v138 = 0;
        v135[1] = (id)MEMORY[0x1E4F143A8];
        v135[2] = (id)3221225472;
        v135[3] = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_202;
        v135[4] = &unk_1E61866E8;
        objc_copyWeak(&v136, &location);
        if ((CV3DSLAMSetNewStateBlock() & 1) == 0)
        {
          id v45 = _ARLogTechnique();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
          {
            uint64_t v46 = (objc_class *)objc_opt_class();
            long long v47 = NSStringFromClass(v46);
            long long v48 = *p_slamSessionHandle;
            long long v49 = v138;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v47;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = self;
            __int16 v158 = 2048;
            v159 = (const char *)v48;
            __int16 v160 = 2112;
            id v161 = v138;
            _os_log_impl(&dword_1B88A2000, v45, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error setting metadata callback (%p): %@", buf, 0x2Au);
          }
          id v50 = objc_loadWeakRetained(&location);
          float32x4_t v51 = ARErrorWithCodeAndUserInfo(200, 0);
          [v50 _didFailWithError:v51];
        }
        objc_destroyWeak(&v136);
        v138 = 0;
        v134[1] = (id)MEMORY[0x1E4F143A8];
        v134[2] = (id)3221225472;
        v134[3] = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_204;
        v134[4] = &unk_1E6186710;
        float32x4_t v118 = v135;
        objc_copyWeak(v135, &location);
        CV3DSLAMSetErrorBlock();
        if (v138)
        {
          float32x4_t v52 = _ARLogTechnique();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
          {
            id v53 = (objc_class *)objc_opt_class();
            float32x4_t v54 = NSStringFromClass(v53);
            uint64_t v55 = *p_slamSessionHandle;
            uint64_t v56 = v138;
            *(_DWORD *)buf = 138544130;
            *(void *)&uint8_t buf[4] = v54;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = self;
            __int16 v158 = 2048;
            v159 = (const char *)v55;
            __int16 v160 = 2112;
            id v161 = v138;
            _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error setting error callback (%p): %@", buf, 0x2Au);
          }
          id v57 = objc_loadWeakRetained(&location);
          uint64_t v58 = ARErrorWithCodeAndUserInfo(200, 0);
          [v57 _didFailWithError:v58];
        }
        v132[0] = MEMORY[0x1E4F143A8];
        v132[1] = 3221225472;
        v132[2] = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_206;
        v132[3] = &unk_1E6186738;
        v116 = &v133;
        objc_copyWeak(&v133, &location);
        v134[0] = (id)MEMORY[0x1BA9C63E0](v132);
        LOBYTE(from) = [(ARWorldTrackingTechnique *)self deterministicMode];
        std::allocate_shared[abi:ne180100]<RaycastSession,std::allocator<RaycastSession>,CV3DSLAMSession *&,void({block_pointer} {__strong}&)(CV3DRaycastResultMap const*),BOOL,void>(p_slamSessionHandle, v134, (unsigned __int8 *)&from, buf);
        shared_ptr<RaycastSession> v59 = *(shared_ptr<RaycastSession> *)buf;
        *(void *)buf = 0;
        *(void *)&buf[8] = 0;
        cntrl = self->_raycastSession.__cntrl_;
        self->_raycastSession = v59;
        if (cntrl)
        {
          std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
          if (*(void *)&buf[8]) {
            std::__shared_weak_count::__release_shared[abi:ne180100](*(std::__shared_weak_count **)&buf[8]);
          }
        }
        v138 = 0;
        char v61 = CV3DSLAMSessionSetOutputMapPoints();
        long long v62 = _ARLogTechnique();
        long long v63 = v62;
        if (v61)
        {
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            id v64 = (objc_class *)objc_opt_class();
            uint64_t v65 = NSStringFromClass(v64);
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v65;
            *(_WORD *)&unsigned char buf[12] = 2048;
            *(void *)&buf[14] = self;
            _os_log_impl(&dword_1B88A2000, v63, OS_LOG_TYPE_INFO, "%{public}@ <%p>: map points enabled", buf, 0x16u);
          }
        }
        else if (os_log_type_enabled(v62, OS_LOG_TYPE_ERROR))
        {
          CVPixelBufferRef v66 = (objc_class *)objc_opt_class();
          int v67 = NSStringFromClass(v66);
          simd_float4x4 v68 = v138;
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v67;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          __int16 v158 = 2112;
          v159 = (const char *)v138;
          _os_log_impl(&dword_1B88A2000, v63, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to enable map points: %@", buf, 0x20u);
        }
        [(ARWorldTrackingTechnique *)self _updateVIOLineDetectionPolicy];
        int8x16_t v69 = [(ARWorldTrackingTechnique *)self mutableOptions];
        int v70 = [v69 isCollaborationEnabled];

        if (v70)
        {
          objc_initWeak(&from, self);
          float64x2_t v130 = 0;
          uint64_t v125 = MEMORY[0x1E4F143A8];
          uint64_t v126 = 3221225472;
          float32x4_t v127 = __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_208;
          simd_float3x3 v128 = &unk_1E6186760;
          objc_copyWeak(&v129, &from);
          if ((CV3DSLAMSessionSetCMDataBlock() & 1) == 0)
          {
            id v71 = _ARLogGeneral();
            if (os_log_type_enabled(v71, OS_LOG_TYPE_ERROR))
            {
              v72 = (objc_class *)objc_opt_class();
              uint64_t v73 = NSStringFromClass(v72);
              double v74 = *p_slamSessionHandle;
              unint64_t v75 = v130;
              *(_DWORD *)buf = 138544130;
              *(void *)&uint8_t buf[4] = v73;
              *(_WORD *)&unsigned char buf[12] = 2048;
              *(void *)&buf[14] = self;
              __int16 v158 = 2048;
              v159 = (const char *)v74;
              __int16 v160 = 2112;
              id v161 = v130;
              _os_log_impl(&dword_1B88A2000, v71, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: error setting collaboration data callback (%p): %@", buf, 0x2Au);
            }
            unint64_t v76 = ARErrorWithCodeAndUserInfo(200, 0);
            -[ARWorldTrackingTechnique _didFailWithError:](self, "_didFailWithError:", v76, &v133, v135);
          }
          objc_destroyWeak(&v129);
          objc_destroyWeak(&from);
        }
        float32x4_t v77 = self;
        if ([(ARWorldTrackingTechnique *)self isMultiSessionMode])
        {
          if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.enableMLCMRelocalization"])
          {
            float32x4_t v78 = [(ARWorldTrackingTechnique *)self mutableOptions];
            float32x4_t v79 = [v78 initialWorldMap];
            float32x4_t v80 = [v79 anchors];
            BOOL v81 = [v80 count] == 0;

            float32x4_t v77 = self;
            if (!v81)
            {
              id v82 = [(ARWorldTrackingTechnique *)self mutableOptions];
              simd_float4 v83 = [v82 initialWorldMap];
              simd_float4 v84 = [v83 anchors];
              simd_float4 v85 = ARAnchorsForPoseGraphUpdates(v84);

              long long v123 = 0u;
              long long v124 = 0u;
              long long v121 = 0u;
              long long v122 = 0u;
              id v86 = v85;
              uint64_t v87 = [v86 countByEnumeratingWithState:&v121 objects:v156 count:16];
              if (v87)
              {
                uint64_t v88 = *(void *)v122;
                do
                {
                  for (uint64_t i = 0; i != v87; ++i)
                  {
                    if (*(void *)v122 != v88) {
                      objc_enumerationMutation(v86);
                    }
                    float32x4_t v90 = *(void **)(*((void *)&v121 + 1) + 8 * i);
                    simd_float4 v91 = _ARLogGeneral();
                    if (os_log_type_enabled(v91, OS_LOG_TYPE_DEBUG))
                    {
                      float32x4_t v92 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v92);
                      id v93 = (id)objc_claimAutoreleasedReturnValue();
                      simd_float4 v94 = [v90 identifier];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v93;
                      *(_WORD *)&unsigned char buf[12] = 2048;
                      *(void *)&buf[14] = self;
                      __int16 v158 = 2114;
                      v159 = v94;
                      _os_log_impl(&dword_1B88A2000, v91, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor received from loaded world map: %{public}@", buf, 0x20u);
                    }
                    [(NSMutableSet *)self->_anchorsReceived addObject:v90];
                  }
                  uint64_t v87 = [v86 countByEnumeratingWithState:&v121 objects:v156 count:16];
                }
                while (v87);
              }

              float32x4_t v77 = self;
            }
          }
        }
        if (ARDeviceSupportsJasper())
        {
          float32x4_t v95 = [(ARWorldTrackingTechnique *)v77 mutableOptions];
          BOOL v96 = [v95 sceneReconstruction] == 0;

          if (!v96) {
            [(ARWorldTrackingTechnique *)self _startSceneReconstruction];
          }
        }
        simd_float4 v97 = _ARLogTechnique();
        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
        {
          float32x4_t v98 = (objc_class *)objc_opt_class();
          NSStringFromClass(v98);
          id v99 = (id)objc_claimAutoreleasedReturnValue();
          id v100 = [(ARWorldTrackingTechnique *)self mutableOptions];
          int v101 = [v100 isCollaborationEnabled];
          long long v102 = "disabled";
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v99;
          if (v101) {
            long long v102 = "enabled";
          }
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          __int16 v158 = 2080;
          v159 = v102;
          _os_log_impl(&dword_1B88A2000, v97, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with collaboration %s", buf, 0x20u);
        }
        long long v103 = _ARLogTechnique();
        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
        {
          uint64_t v104 = (objc_class *)objc_opt_class();
          NSStringFromClass(v104);
          id v105 = (id)objc_claimAutoreleasedReturnValue();
          id v106 = [(ARWorldTrackingTechnique *)self mutableOptions];
          int v107 = [v106 relocalizationEnabled];
          uint64_t v108 = "disabled";
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v105;
          if (v107) {
            uint64_t v108 = "enabled";
          }
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          __int16 v158 = 2080;
          v159 = v108;
          _os_log_impl(&dword_1B88A2000, v103, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with relocalization %s", buf, 0x20u);
        }
        uint64_t v109 = _ARLogTechnique();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
        {
          uint64_t v110 = (objc_class *)objc_opt_class();
          NSStringFromClass(v110);
          id v111 = (id)objc_claimAutoreleasedReturnValue();
          long long v112 = [(ARWorldTrackingTechnique *)self mutableOptions];
          long long v113 = [v112 imageSensorSettings];
          uint64_t v114 = [v113 videoFormat];
          simd_float4x4 v115 = [v114 description];
          *(_DWORD *)buf = 138543874;
          *(void *)&uint8_t buf[4] = v111;
          *(_WORD *)&unsigned char buf[12] = 2048;
          *(void *)&buf[14] = self;
          __int16 v158 = 2112;
          v159 = v115;
          _os_log_impl(&dword_1B88A2000, v109, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with video format: %@", buf, 0x20u);
        }
        objc_destroyWeak(v117);
        objc_destroyWeak(v118);
        objc_destroyWeak(&location);
        int64_t v9 = 3;
        goto LABEL_22;
      }
      long long v31 = _ARLogTechnique();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
        uint64_t v32 = (objc_class *)objc_opt_class();
        long long v33 = NSStringFromClass(v32);
        predictorHandle = v2->_predictorHandle;
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v33;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        __int16 v158 = 2048;
        v159 = (const char *)predictorHandle;
        __int16 v160 = 2112;
        id v161 = v144;
        _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error initializing predictor handle (%p): %@", buf, 0x2Au);
      }
      simd_float4 v35 = [MEMORY[0x1E4F1CA60] dictionary];
      id v36 = ARKitCoreBundle();
      __int16 v37 = [v36 localizedStringForKey:@"Unable to initialize tracking." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      [v35 setObject:v37 forKeyedSubscript:*MEMORY[0x1E4F28588]];

      uint64_t v38 = ARErrorWithCodeAndUserInfo(200, v35);
      [(ARWorldTrackingTechnique *)self _didFailWithError:v38];
    }
    int64_t v9 = 4;
LABEL_22:
    v141((uint64_t)v140);
LABEL_23:
    ((void (*)(void *))v147)(v146);
    goto LABEL_24;
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = ARKitCoreBundle();
  simd_float4x4 v7 = [v6 localizedStringForKey:@"Unable to initialize tracking." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  [v5 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28588]];

  uint64_t v8 = ARErrorWithCodeAndUserInfo(200, v5);
  [(ARWorldTrackingTechnique *)self _didFailWithError:v8];

  int64_t v9 = 4;
LABEL_24:
  ((void (*)(void *))v152)(v151);

  return v9;
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke()
{
  return CV3DSLAMCalibrationRelease();
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_2()
{
  return CV3DSLAMConfigRelease();
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_201(uint64_t a1)
{
  return MEMORY[0x1F4109B98](*(void *)(a1 + 32));
}

void __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_202(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained onMetadataCallback:a2];
}

void __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_204(uint64_t a1, void *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSLAMError:a2];
}

void __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_206(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleRaycastResultCallback:a2];
}

uint64_t __61__ARWorldTrackingTechnique__initializeSLAMAndPredictorHandle__block_invoke_208(uint64_t a1, uint64_t a2, CFDataRef theData, uint64_t a4)
{
  CFDataGetLength(theData);
  kdebug_trace();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _reportCollaborationData:theData type:a2 metadata:a4];

  return kdebug_trace();
}

- (unsigned)CV3DSLAMJasperPointCloudProjectorModeFromAVTimeOfFlightProjectorMode:(int64_t)a3
{
  uint64_t v3 = (unsigned char *)*MEMORY[0x1E4F143B8];
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      goto LABEL_5;
    case 1:
      uint64_t v3 = (unsigned char *)MEMORY[0x1E4F4D438];
      goto LABEL_9;
    case 2:
      uint64_t v3 = (unsigned char *)MEMORY[0x1E4F4D440];
      goto LABEL_9;
    case 3:
    case 4:
      uint64_t v6 = _ARLogTechnique();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        simd_float4x4 v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        int v10 = 138543874;
        uint64_t v11 = v8;
        __int16 v12 = 2048;
        uint64_t v13 = self;
        __int16 v14 = 2048;
        int64_t v15 = a3;
        _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error, the following projector mode is not supported by CV3D (enum value %ld)", (uint8_t *)&v10, 0x20u);
      }
LABEL_5:
      uint64_t v3 = (unsigned char *)MEMORY[0x1E4F4D430];
      goto LABEL_9;
    case 6:
      uint64_t v3 = (unsigned char *)MEMORY[0x1E4F4D428];
LABEL_9:
      LOBYTE(v3) = *v3;
      break;
    default:
      return v3;
  }
  return v3;
}

- (void)_removeAllMeshAnchors
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    int v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing all mesh anchors", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = +[ARSpatialMappingResultData emptyResultData];
  os_unfair_lock_lock(&self->_latestSpatialMappingDataLock);
  [(NSMutableArray *)self->_latestSpatialMappingData addObject:v6];
  os_unfair_lock_unlock(&self->_latestSpatialMappingDataLock);
  os_unfair_lock_lock(&self->_spatialMappingPointCloudsLock);
  [(NSMutableDictionary *)self->_spatialMappingPointClouds removeAllObjects];
  os_unfair_lock_unlock(&self->_spatialMappingPointCloudsLock);
}

- (void)_setupSceneReconstruction
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v13 = 138543618;
    __int16 v14 = v5;
    __int16 v15 = 2048;
    uint64_t v16 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Start scene reconstruction", (uint8_t *)&v13, 0x16u);
  }
  uint64_t v6 = [ARSceneReconstructionHandler alloc];
  int v7 = [(ARWorldTrackingTechnique *)self mutableOptions];
  uint64_t v8 = [v7 sceneReconstruction];
  __int16 v9 = [(ARWorldTrackingTechnique *)self mutableOptions];
  int v10 = [v9 sceneReconstructionOptions];
  uint64_t v11 = [(ARSceneReconstructionHandler *)v6 initWithSceneReconstruction:v8 options:v10 slamSessionHandle:self->_slamSessionHandle];
  sceneReconstructionHandler = self->_sceneReconstructionHandler;
  self->_sceneReconstructionHandler = v11;

  [(ARSceneReconstructionHandler *)self->_sceneReconstructionHandler setDelegate:self];
  [(ARWorldTrackingTechnique *)self _removeAllMeshAnchors];
}

- (void)_reconfigureSceneReconstruction
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v12 = 138543618;
    int v13 = v5;
    __int16 v14 = 2048;
    __int16 v15 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring scene reconstruction", (uint8_t *)&v12, 0x16u);
  }
  uint64_t v6 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];
  int v7 = [(ARWorldTrackingTechnique *)self mutableOptions];
  uint64_t v8 = [v7 sceneReconstruction];
  __int16 v9 = [(ARWorldTrackingTechnique *)self mutableOptions];
  int v10 = [v9 sceneReconstructionOptions];
  uint64_t v11 = [v6 reconfigureSceneReconstruction:v8 options:v10];

  if (v11 == 2) {
    [(ARWorldTrackingTechnique *)self _removeAllMeshAnchors];
  }
}

- (void)_startSceneReconstruction
{
  uint64_t v3 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];

  if (v3) {
    [(ARWorldTrackingTechnique *)self _reconfigureSceneReconstruction];
  }
  else {
    [(ARWorldTrackingTechnique *)self _setupSceneReconstruction];
  }
  int v4 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];
  [v4 start];

  [(ARWorldTrackingTechnique *)self _configureMeshPlaneHarmonization];
}

- (void)resetSceneReconstruction
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    int v7 = 138543618;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    int v10 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Resetting scene reconstruction", (uint8_t *)&v7, 0x16u);
  }
  uint64_t v6 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];
  [v6 reset];

  [(ARWorldTrackingTechnique *)self _removeAllMeshAnchors];
}

- (void)_configureMeshPlaneHarmonization
{
  id v5 = [(ARWorldTrackingTechnique *)self mutableOptions];
  if ([v5 planeDetection])
  {
    unint64_t v4 = 1;
  }
  else
  {
    uint64_t v3 = [(ARWorldTrackingTechnique *)self mutableOptions];
    unint64_t v4 = ((unint64_t)[v3 planeDetection] >> 1) & 1;
  }
  id v6 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];
  [v6 meshPlaneHarmonizationShouldEnable:v4];
}

- (BOOL)querySceneReconstructionOccupancyWithPoints:(id)a3 callback:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  sceneReconstructionHandler = self->_sceneReconstructionHandler;
  if (sceneReconstructionHandler) {
    BOOL v9 = [(ARSceneReconstructionHandler *)sceneReconstructionHandler queryOccupancyWithPoints:v6 callback:v7];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (void)sceneReconstructionHandler:(id)a3 didFailWithError:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ARLogTechnique();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    BOOL v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    int v12 = 138544130;
    int v13 = v10;
    __int16 v14 = 2048;
    __int16 v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Scene reconstruction handler %p failed with error %@", (uint8_t *)&v12, 0x2Au);
  }
  uint64_t v11 = ARErrorWithCodeAndUserInfo(200, 0);
  [(ARWorldTrackingTechnique *)self _didFailWithError:v11];
}

- (void)sceneReconstructionHandler:(id)a3 didOutputMeshList:(CV3DReconMeshList *)a4 withTimestamp:(double)a5
{
  uint64_t v8 = [ARSpatialMappingResultData alloc];
  BOOL v9 = [(ARWorldTrackingTechnique *)self mutableOptions];
  int v10 = -[ARSpatialMappingResultData initWithMeshList:sceneReconstruction:timestamp:](v8, "initWithMeshList:sceneReconstruction:timestamp:", a4, [v9 sceneReconstruction], a5);

  os_unfair_lock_lock(&self->_latestSpatialMappingDataLock);
  [(NSMutableArray *)self->_latestSpatialMappingData addObject:v10];
  os_unfair_lock_unlock(&self->_latestSpatialMappingDataLock);
}

- (void)sceneReconstructionHandler:(id)a3 didOutputKeyframeList:(CV3DReconKeyframeList *)a4 withTimestamp:(double)a5
{
  -[ARWorldTrackingTechnique didReceiveKeyframesUpdatedCallback:](self, "didReceiveKeyframesUpdatedCallback:", a4, a5);
  CV3DReconKeyframeListRelease();
}

- (void)_handlePlaneDetectionCallback:(CV3DPlaneDetectionPlaneList *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = [(ARWorldTrackingTechnique *)self mutableOptions];
  id v6 = [v5 trackedPlaneCallback];

  if (v6)
  {
    id v7 = [[ARCV3DPlaneDetectionPlaneList alloc] initWithDetectionResult:a3];
    uint64_t v8 = [(ARWorldTrackingTechnique *)self mutableOptions];
    BOOL v9 = [v8 trackedPlaneCallback];
    ((void (**)(void, ARCV3DPlaneDetectionPlaneList *))v9)[2](v9, v7);
  }
  os_unfair_lock_lock(&self->_raycastSessionLock);
  if (self->_raycastSession.__ptr_) {
    CV3DRaycastPushPlanes();
  }
  os_unfair_lock_unlock(&self->_raycastSessionLock);
  int v10 = [(ARWorldTrackingTechnique *)self sceneReconstructionHandler];
  [v10 processPlaneList:a3];

  uint64_t v11 = [[ARPlaneData alloc] initWithDetectionResult:a3 detectionTypeMask:[(ARWorldTrackingOptions *)self->_mutableOptions planeDetection] sceneUnderstandingEnabled:[(ARWorldTrackingOptions *)self->_mutableOptions mlModelEnabled]];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  int v12 = [(ARWorldTrackingTechnique *)self getObservers];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v18;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v12);
        }
        __int16 v16 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if (objc_opt_respondsToSelector()) {
          [v16 technique:self didDetectPlane:v11 timestamp:0.0];
        }
        ++v15;
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v13);
  }
}

- (void)_handleSingleShotPlaneDetectionCallback:(CV3DPlaneDetectionSingleShotPlaneList *)a3
{
  id v5 = [(ARWorldTrackingTechnique *)self mutableOptions];
  id v6 = [v5 singleShotPlaneCallback];

  if (v6)
  {
    id v7 = [[ARCV3DPlaneDetectionSingleShotPlaneList alloc] initWithDetectionResult:a3];
    uint64_t v8 = [(ARWorldTrackingTechnique *)self mutableOptions];
    BOOL v9 = [v8 singleShotPlaneCallback];
    ((void (**)(void, ARCV3DPlaneDetectionSingleShotPlaneList *))v9)[2](v9, v7);
  }
  CV3DPlaneDetectionSingleShotPlaneListRelease();
}

- (void)_initializeSurfaceDetection:(const PlaneDetectionConfiguration *)a3
{
  objc_initWeak(&location, self);
  os_unfair_lock_lock_with_options();
  id v5 = [(ARWorldTrackingTechnique *)self mutableOptions];
  int v6 = [v5 planeBundleAdjustmentEnabled];

  if (v6)
  {
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke;
    v18[3] = &unk_1E6186788;
    id v7 = &v19;
    objc_copyWeak(&v19, &location);
    id v20 = (id)MEMORY[0x1BA9C63E0](v18);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_2;
    v15[3] = &unk_1E61867B0;
    objc_copyWeak(&v16, &location);
    id v17 = (id)MEMORY[0x1BA9C63E0](v15);
    std::allocate_shared[abi:ne180100]<PlaneDetectionSession,std::allocator<PlaneDetectionSession>,CV3DSLAMSession *&,PlaneDetectionConfiguration const&,void({block_pointer} {__strong}&)(CV3DPlaneDetectionPlaneList const*),void({block_pointer} {__strong}&)(CV3DPlaneDetectionSingleShotPlaneList const*),void>(&self->_slamSessionHandle, (uint64_t)a3, &v17, &v20, &v14);
    shared_ptr<PlaneDetectionSession> v8 = v14;
    shared_ptr<PlaneDetectionSession> v14 = (shared_ptr<PlaneDetectionSession>)0;
    cntrl = self->_planeDetectionSession.__cntrl_;
    self->_planeDetectionSession = v8;
    if (cntrl)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
      if (v14.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14.__cntrl_);
      }
    }

    objc_destroyWeak(&v16);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_3;
    v12[3] = &unk_1E61867B0;
    id v7 = &v13;
    objc_copyWeak(&v13, &location);
    id v20 = (id)MEMORY[0x1BA9C63E0](v12);
    std::allocate_shared[abi:ne180100]<PlaneDetectionSession,std::allocator<PlaneDetectionSession>,CV3DSLAMSession *&,PlaneDetectionConfiguration const&,void({block_pointer} {__strong}&)(CV3DPlaneDetectionPlaneList const*),void>(&self->_slamSessionHandle, (uint64_t)a3, &v20, &v14);
    shared_ptr<PlaneDetectionSession> v10 = v14;
    shared_ptr<PlaneDetectionSession> v14 = (shared_ptr<PlaneDetectionSession>)0;
    uint64_t v11 = self->_planeDetectionSession.__cntrl_;
    self->_planeDetectionSession = v10;
    if (v11)
    {
      std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v11);
      if (v14.__cntrl_) {
        std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v14.__cntrl_);
      }
    }
  }

  objc_destroyWeak(v7);
  os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
  objc_destroyWeak(&location);
}

void __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handleSingleShotPlaneDetectionCallback:a2];
}

void __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlaneDetectionCallback:a2];
}

void __56__ARWorldTrackingTechnique__initializeSurfaceDetection___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _handlePlaneDetectionCallback:a2];
}

- (void)_resetSurfaceDetection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _ARLogTechnique();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    unint64_t v4 = (objc_class *)objc_opt_class();
    id v5 = NSStringFromClass(v4);
    int v6 = 138543618;
    id v7 = v5;
    __int16 v8 = 2048;
    BOOL v9 = self;
    _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Resetting surface detection", (uint8_t *)&v6, 0x16u);
  }
  [(ARWorldTrackingTechnique *)self _initializeSurfaceDetection:&self->_surfaceDetectionParametrization];
}

- (int64_t)_mappingStatusFromMapSize:(int)a3 keyframeQuality:(int)a4 isTrackingMap:(BOOL)a5 timestamp:(double)a6
{
  BOOL v7 = a5;
  if (self->_previousKeyframeCount < a3)
  {
    self->_previousKeyframeuint64_t Count = a3;
    if (a4)
    {
      self->_lastQualityKeyframeTimestamp = a6;
      [(ARWorldTrackingTechnique *)self setHasQualityKeyframe:1];
    }
  }
  if (v7) {
    self->_lastPoseTrackingMapTimestamp = a6;
  }
  if (self->_previousKeyframeCount)
  {
    if (a6 - self->_lastQualityKeyframeTimestamp >= 1.0)
    {
      if (a6 - self->_lastPoseTrackingMapTimestamp >= 1.0) {
        int64_t v9 = 1;
      }
      else {
        int64_t v9 = 3;
      }
    }
    else
    {
      int64_t v9 = 2;
    }
  }
  else
  {
    int64_t v9 = 0;
  }
  kdebug_trace();
  return v9;
}

- (id)_featurePointDataFromSLAMState:(const CV3DSLAMStateContext *)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [MEMORY[0x1E4F1CA58] data];
  int PointCloud = CV3DSLAMStateGetPointCloud();
  if (PointCloud != *MEMORY[0x1E4F4D490] || CV3DSLAMStateGetTimestamp() != PointCloud)
  {
LABEL_7:
    int64_t v9 = 0;
    goto LABEL_8;
  }
  if (CV3DSLAMStateGetStatus() != PointCloud)
  {
    int v6 = _ARLogTechnique();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      BOOL v7 = (objc_class *)objc_opt_class();
      __int16 v8 = NSStringFromClass(v7);
      *(_DWORD *)buf = 138543874;
      id v13 = v8;
      __int16 v14 = 2048;
      uint64_t v15 = self;
      __int16 v16 = 2048;
      uint64_t v17 = 0;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Point cloud rejected because tracking state is not nominal: %f", buf, 0x20u);
    }
    goto LABEL_7;
  }
  [v4 length];
  int64_t v9 = [[ARWorldTrackingFeaturePointData alloc] initWithTimestamp:0.0];
  kdebug_trace();
  uint64_t v11 = [[ARPointCloud alloc] initWithCV3DPointData:v4 minVergenceAngleCosine:self->_minVergenceAngleCosine];
  [(ARWorldTrackingFeaturePointData *)v9 setVisionFeaturePoints:v11];

  kdebug_trace();
LABEL_8:

  return v9;
}

- (void)_updateTrackingState:(id)a3 slamState:(const CV3DSLAMStateContext *)a4
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  CV3DSLAMStateGetStatus();
  long long v46 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v47 = *MEMORY[0x1E4F149A0];
  long long v44 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  long long v45 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  if (CV3DSLAMStateGetRelocalizationTimestamp() == *MEMORY[0x1E4F4D490]
    && self->_lastRelocalizationTimestamp < 0.0)
  {
    CV3DSLAMStateIsGlobalRelocalization();
    CV3DSLAMStateRelocalizationSucceeded();
    kdebug_trace();
    id v5 = _ARLogTechnique();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = (objc_class *)objc_opt_class();
      BOOL v7 = NSStringFromClass(v6);
      *(_DWORD *)buf = 138544386;
      *(void *)&uint8_t buf[4] = v7;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = self;
      __int16 v50 = 2048;
      float32x4_t v51 = 0;
      __int16 v52 = 1024;
      *(_DWORD *)id v53 = 0;
      *(_WORD *)&v53[4] = 1024;
      *(_DWORD *)&v53[6] = 0;
      _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Relocalization event: %f, global %i, succeeded %i", buf, 0x2Cu);
    }
    self->_lastRelocalizationTimestamp = 0.0;
    char v8 = 1;
  }
  else
  {
    char v8 = 0;
  }
  if ([(ARWorldTrackingTechnique *)self _isRelocalizing]
    && self->_didClearMap)
  {
    int64_t v9 = _ARLogTechnique();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = (objc_class *)objc_opt_class();
      uint64_t v11 = NSStringFromClass(v10);
      int v12 = @"NO";
      BOOL didClearMap = self->_didClearMap;
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&unsigned char buf[12] = 2048;
      if (didClearMap) {
        int v12 = @"YES";
      }
      *(void *)&buf[14] = self;
      __int16 v50 = 2112;
      float32x4_t v51 = @"NO";
      __int16 v52 = 2112;
      *(void *)id v53 = v12;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Clearing relocalization after sensor data drop because major relocalization(%@) or clear map (%@) occurred.", buf, 0x2Au);
    }
    self->_relocalizationState = 0;
    if (v8)
    {
      p_originTimestamp = &self->_originTimestamp;
      if (!self->_didClearMap) {
        goto LABEL_18;
      }
    }
    else
    {
      p_originTimestamp = &self->_originTimestamp;
    }
LABEL_19:
    char v15 = 0;
    double v16 = *p_originTimestamp;
    if (*p_originTimestamp >= 2.22044605e-16) {
      goto LABEL_23;
    }
    goto LABEL_20;
  }
  p_originTimestamp = &self->_originTimestamp;
  if ((v8 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_18:
  char v15 = 1;
LABEL_20:
  [v48 timestamp];
  *(void *)p_originTimestamp = v17;
  uint64_t v18 = _ARLogTechnique();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    id v19 = (objc_class *)objc_opt_class();
    id v20 = NSStringFromClass(v19);
    uint64_t v21 = *(__CFString **)p_originTimestamp;
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v20;
    *(_WORD *)&unsigned char buf[12] = 2048;
    *(void *)&buf[14] = self;
    __int16 v50 = 2048;
    float32x4_t v51 = v21;
    _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: VIO origin timestamp: %f", buf, 0x20u);
  }
LABEL_23:
  if ([(ARWorldTrackingTechnique *)self _isRelocalizing])
  {
    if (self->_relocalizationState == 2 || self->_wasEverInNominalState) {
      unint64_t v22 = 4;
    }
    else {
      unint64_t v22 = 1;
    }
    int64_t reinitializationAttempts = self->_reinitializationAttempts;
    if (self->_reinitializationAttemptsAtInitialization != reinitializationAttempts)
    {
      self->_int64_t reinitializationAttemptsAtInitialization = reinitializationAttempts;
      float32x4_t v24 = _ARLogTechnique();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        float32x4_t v25 = (objc_class *)objc_opt_class();
        simd_float4 v26 = NSStringFromClass(v25);
        ARTrackingStateReasonToString(v22);
        uint64_t v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
        int64_t reinitializationAttemptsAtInitialization = self->_reinitializationAttemptsAtInitialization;
        *(_DWORD *)buf = 138544130;
        *(void *)&uint8_t buf[4] = v26;
        *(_WORD *)&unsigned char buf[12] = 2048;
        *(void *)&buf[14] = self;
        __int16 v50 = 2112;
        float32x4_t v51 = v27;
        __int16 v52 = 2048;
        *(void *)id v53 = reinitializationAttemptsAtInitialization;
        _os_log_impl(&dword_1B88A2000, v24, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting tracking state to limited with %@ after sensor data drop, resetting reinitialization attempts counter to %li", buf, 0x2Au);
      }
    }
    uint64_t v29 = 1;
  }
  else
  {
    unint64_t v22 = 3;
    uint64_t v30 = 1;
    if (self->_reinitializationAttemptsAtInitialization == self->_reinitializationAttempts)
    {
      unint64_t v22 = 0;
      self->_wasEverInNominalState = 1;
      uint64_t v30 = 2;
    }
    BOOL v31 = [(ARWorldTrackingTechnique *)self _isBravoCamOtherThanWideUsed];
    if (v31) {
      uint64_t v29 = 1;
    }
    else {
      uint64_t v29 = v30;
    }
    if (v31) {
      unint64_t v22 = 0;
    }
  }
  uint64_t v32 = (void *)CV3DSLAMStateCopyUpdatedAnchors();
  long long v33 = v32;
  if (v32) {
    BOOL v34 = [v32 count] != 0;
  }
  else {
    BOOL v34 = 0;
  }
  simd_float4 v35 = objc_opt_new();
  [v35 setState:v29];
  [v35 setReason:v22];
  [v35 setMajorRelocalization:0];
  [v35 setMinorRelocalization:v15 & 1];
  [v35 setPoseGraphUpdated:v34];
  objc_msgSend(v35, "setMajorRelocalizationCameraTransform:", *(double *)&v47, *(double *)&v46, *(double *)&v45, *(double *)&v44);
  [v35 setVioTrackingState:1];
  [v35 setLastMajorRelocalizationTimestamp:self->_lastMajorRelocalizationTimestamp];
  [v35 setOriginTimestamp:*p_originTimestamp];
  [v35 setCurrentVIOMapSize:self->_currentVIOMapSize];
  [v35 setNumberOfCameraSwitches:self->_numberOfCameraSwitches];
  [v35 setReinitializationAttempts:self->_reinitializationAttempts];
  [v48 setWorldTrackingState:v35];
}

- (BOOL)_isBravoCamOtherThanWideUsed
{
  uint64_t v3 = [(ARWorldTrackingTechnique *)self options];
  unint64_t v4 = [v3 imageSensorSettings];
  char v5 = [v4 isBravoCameraEnabled];

  if (self->_lastCaptureLens == 1) {
    return 0;
  }
  else {
    return v5;
  }
}

- (unsigned)_trackingCameraID:(CV3DSLAMStateContext *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = [MEMORY[0x1E4F1CA58] data];
  if (CV3DSLAMStateGetCameraSwitchingStatistics() == *MEMORY[0x1E4F4D490]
    && (id v5 = v4,
        int v6 = (unsigned int *)[v5 bytes],
        (unint64_t)([v5 length] - 24) <= 0x17))
  {
    uint64_t v7 = *v6;
    char v8 = [(ARWorldTrackingTechnique *)self mutableOptions];
    int64_t v9 = [v8 activeVideoFormatsMap];

    uint64_t v10 = [NSNumber numberWithUnsignedInt:v7];
    uint64_t v11 = [v9 objectForKeyedSubscript:v10];
    int v12 = [v11 captureDeviceType];

    lastCameraType = self->_lastCameraType;
    if (lastCameraType && lastCameraType != v12)
    {
      __int16 v14 = _ARLogTechnique();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        char v15 = (objc_class *)objc_opt_class();
        double v16 = NSStringFromClass(v15);
        uint64_t v17 = self->_lastCameraType;
        int v20 = 138544130;
        uint64_t v21 = v16;
        __int16 v22 = 2048;
        uint64_t v23 = self;
        __int16 v24 = 2112;
        float32x4_t v25 = v17;
        __int16 v26 = 2112;
        uint64_t v27 = v12;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Camera type changed from %@ to %@", (uint8_t *)&v20, 0x2Au);
      }
      if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.warningSounds"])
      {
        softLinkAudioServicesPlaySystemSound(0x454u);
      }
      ++self->_numberOfCameraSwitches;
    }
    uint64_t v18 = self->_lastCameraType;
    self->_lastCameraType = v12;
  }
  else
  {
    LODWORD(v7) = 0;
  }

  return v7;
}

- (int)_updatePoseData:(id)x2_0 forTimeStamp:(double)a4 updateTrackingState:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v8 = x2_0;
  uint64_t v9 = CV3DSLAMStateSnapshotCreate();
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  __int16 v50 = __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke;
  float32x4_t v51 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v52 = v9;
  unsigned int Pose = CV3DPosePredictionGetPose();
  if (Pose)
  {
    if (self->_lastPoseMetaDataTimestamp <= 0.0)
    {
LABEL_11:
      int v19 = 1;
      goto LABEL_26;
    }
    uint64_t v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      __int16 v14 = NSStringFromCV3DPosePredictionReturn(Pose);
      *(_DWORD *)buf = 138544130;
      *(void *)&uint8_t buf[4] = v13;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&unsigned char buf[22] = 2112;
      *(void *)&buf[24] = v14;
      LOWORD(v64) = 2048;
      *(double *)((char *)&v64 + 2) = a4;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to update pose [%@] for timestamp %f", buf, 0x2Au);
    }
LABEL_10:

    goto LABEL_11;
  }
  uint64_t SLAMState = CV3DSLAMStateSnapshotCreateSLAMState();
  uint64_t v16 = SLAMState;
  if (!SLAMState)
  {
    uint64_t v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      float32x4_t v25 = (objc_class *)objc_opt_class();
      __int16 v26 = NSStringFromClass(v25);
      *(_DWORD *)buf = 138543874;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&unsigned char buf[22] = 2048;
      *(double *)&buf[24] = a4;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create SLAM state for timestamp %f", buf, 0x20u);
    }
    goto LABEL_10;
  }
  v45[1] = 3221225472;
  v45[0] = MEMORY[0x1E4F143A8];
  long long v46 = __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke_224;
  long long v47 = &__block_descriptor_40_e5_v8__0l;
  uint64_t v48 = SLAMState;
  uint64_t v17 = [[ARSLAMState alloc] initWithSLAMState:SLAMState];
  [v8 setSlamState:v17];

  uint64_t v66 = 0;
  long long v64 = 0u;
  long long v65 = 0u;
  memset(buf, 0, sizeof(buf));
  uint64_t v60 = 0;
  uint64_t v61 = 0;
  uint64_t v62 = 0;
  uint64_t v18 = [(ARWorldTrackingTechnique *)self _trackingCameraID:v16];
  long long v43 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v44 = *MEMORY[0x1E4F149A0];
  long long v41 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  long long v42 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  int v19 = CV3DSLAMStateSnapshotGetPose();
  if (!v19)
  {
    uint64_t v59 = 0;
    long long v57 = 0u;
    long long v58 = 0u;
    memset(v56, 0, sizeof(v56));
    memset(v55, 0, sizeof(v55));
    uint64_t v27 = [(ARWorldTrackingTechnique *)self mutableOptions];
    uint64_t v28 = [v27 imageSensorSettingsForUltraWide];
    if (v28)
    {
      BOOL v29 = v18 == self->_visualizationCameraID;

      if (!v29)
      {
        int v20 = CV3DSLAMStateConvertPoseToCameraFrame();
        [(ARWorldTrackingTechnique *)self extrinsicsToWideSensor];
        ARCascadeTransform((double *)v56, v55, v68, v54, v53);
LABEL_17:
        double RowMajorTransform = ARMatrix4x4MakeRowMajorTransform((double *)v56);
        goto LABEL_18;
      }
    }
    else
    {
    }
    int v20 = CV3DSLAMStateConvertPoseToCameraFrame();
    goto LABEL_17;
  }
  int v20 = *MEMORY[0x1E4F4D470];
  double v22 = *(double *)&v43;
  double RowMajorTransform = *(double *)&v44;
  double v24 = *(double *)&v41;
  double v23 = *(double *)&v42;
LABEL_18:
  if (v20 == *MEMORY[0x1E4F4D490])
  {
    objc_msgSend(v8, "setVisionCameraTransform:", RowMajorTransform, v22, v23, v24);
    if (v5) {
      [(ARWorldTrackingTechnique *)self _updateTrackingState:v8 slamState:v16];
    }
    *(void *)uint64_t v56 = 0;
    CV3DSLAMStateGetTimestamp();
    double v30 = *(double *)v56;
    BOOL v31 = [v8 worldTrackingState];
    [v31 setPoseTimestamp:v30];
  }
  else
  {
    uint64_t v32 = _ARLogTechnique();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      long long v33 = (objc_class *)objc_opt_class();
      BOOL v34 = NSStringFromClass(v33);
      simd_float4 v35 = NSStringFromCV3DSLAMReturn(v20);
      *(_DWORD *)uint64_t v56 = 138543874;
      *(void *)&v56[4] = v34;
      *(_WORD *)&v56[12] = 2048;
      *(void *)&v56[14] = self;
      *(_WORD *)&v56[22] = 2112;
      *(void *)&v56[24] = v35;
      _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Error converting pose from IMU to camera frame: %@", v56, 0x20u);
    }
    int v19 = 1;
  }
  uint64_t v36 = [(ARWorldTrackingTechnique *)self mutableOptions];
  uint64_t v37 = [v36 activeVideoFormatsMap];
  uint64_t v38 = [NSNumber numberWithUnsignedInt:v18];
  uint64_t v39 = [v37 objectForKeyedSubscript:v38];
  [v8 setCurrentlyActiveVideoFormat:v39];

  ((void (*)(void *))v46)(v45);
LABEL_26:
  v50((uint64_t)v49);

  return v19;
}

uint64_t __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke(uint64_t a1)
{
  return MEMORY[0x1F410A060](*(void *)(a1 + 32));
}

uint64_t __77__ARWorldTrackingTechnique__updatePoseData_forTimeStamp_updateTrackingState___block_invoke_224()
{
  return CV3DSLAMStateRelease();
}

- (void)onMetadataCallback:(CV3DSLAMStateContext *)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int Timestamp = CV3DSLAMStateGetTimestamp();
  int v6 = *MEMORY[0x1E4F4D490];
  if (Timestamp != *MEMORY[0x1E4F4D490])
  {
    uint64_t v7 = _ARLogTechnique();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v8 = (objc_class *)objc_opt_class();
      uint64_t v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v9;
      __int16 v27 = 2048;
      uint64_t v28 = self;
      __int16 v29 = 1024;
      LODWORD(v30) = Timestamp;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: onMetadataCallback: CV3DSLAMStateGetTimestamp error: %d", buf, 0x1Cu);
    }
  }
  int v10 = CV3DPosePredictionPushSLAMMetadata();
  if (v10)
  {
    uint64_t v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543874;
      __int16 v26 = v13;
      __int16 v27 = 2048;
      uint64_t v28 = self;
      __int16 v29 = 1024;
      LODWORD(v30) = v10;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: onMetadataCallback: CV3DPosePredictionPushSLAMMetadata error: %d", buf, 0x1Cu);
    }
  }
  else
  {
    CV3DSLAMStateGetStatus();
    if (CV3DSLAMStateNumReinit() == v6 && self->_reinitializationAttempts)
    {
      __int16 v14 = _ARLogTechnique();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        char v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        int reinitializationAttempts = self->_reinitializationAttempts;
        *(_DWORD *)buf = 138544386;
        __int16 v26 = v16;
        __int16 v27 = 2048;
        uint64_t v28 = self;
        __int16 v29 = 2048;
        uint64_t v30 = 0;
        __int16 v31 = 1024;
        int v32 = reinitializationAttempts;
        __int16 v33 = 1024;
        int v34 = 0;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Reinitialization attempts changed at %f, %i => %i", buf, 0x2Cu);
      }
      self->_int reinitializationAttempts = 0;
      if (![(ARWorldTrackingTechnique *)self _isRelocalizing]
        && CV3DSLAMStateGetMapSize() == v6)
      {
        uint64_t v18 = _ARLogTechnique();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v19 = (objc_class *)objc_opt_class();
          int v20 = NSStringFromClass(v19);
          *(_DWORD *)buf = 138543618;
          __int16 v26 = v20;
          __int16 v27 = 2048;
          uint64_t v28 = self;
          _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: SLAM re-init with 0 mapsize. Triggering scene recon and surface detection reset", buf, 0x16u);
        }
        [(ARWorldTrackingTechnique *)self resetSceneReconstruction];
        [(ARWorldTrackingTechnique *)self _resetSurfaceDetection];
      }
    }
    kdebug_trace();
    os_unfair_lock_lock(&self->_raycastSessionLock);
    if (self->_raycastSession.__ptr_) {
      CV3DRaycastPushSlamState();
    }
    os_unfair_lock_unlock(&self->_raycastSessionLock);
    os_unfair_lock_lock(&self->_surfaceDetectionSessionLock);
    ptr = self->_planeDetectionSession.__ptr_;
    if (ptr) {
      PlaneDetectionSession::PushSlamState(ptr, a3);
    }
    os_unfair_lock_unlock(&self->_surfaceDetectionSessionLock);
    double v22 = [(ARWorldTrackingTechnique *)self mutableOptions];
    int v23 = [v22 isCollaborationEnabled];

    if (v23)
    {
      double v24 = [MEMORY[0x1E4F1CA48] array];
      CV3DSLAMStateGetMapMergeStats();
      [v24 count];
      kdebug_trace();
    }
  }
}

- (void)_pushWTResultDataForTimestamp:(double)a3
{
  uint64_t v197 = *MEMORY[0x1E4F143B8];
  obuint64_t j = [[ARWorldTrackingPoseData alloc] initWithTimestamp:a3];
  int v142 = -[ARWorldTrackingTechnique _updatePoseData:forTimeStamp:updateTrackingState:](self, "_updatePoseData:forTimeStamp:updateTrackingState:", a3);
  v152 = objc_opt_new();
  double v173 = 0.0;
  BOOL v5 = [(ARWorldTrackingPoseData *)obj slamState];
  uint64_t v154 = self;
  [v5 slamState];
  CV3DSLAMStateGetTimestamp();

  int v6 = self;
  if (self->_lastPoseMetaDataTimestamp >= 0.0) {
    goto LABEL_46;
  }
  kdebug_trace();
  self->_lastPoseMetaDataint Timestamp = v173;
  v182[0] = 0;
  uint64_t v7 = [(ARWorldTrackingPoseData *)obj slamState];
  [v7 slamState];
  uint64_t v150 = (void *)CV3DSLAMStateCopyUpdatedAnchors();

  if (!v150)
  {
    [(ARWorldTrackingTechnique *)self _handleCV3DError:v182[0] withDescription:@"Get updated anchors error" failTechnique:0];
    CFRelease(v182[0]);
  }
  id v8 = [(ARWorldTrackingPoseData *)obj slamState];
  [v8 slamState];
  v148 = (void *)CV3DSLAMStateCopyNewAnchors();

  if (!v148)
  {
    [(ARWorldTrackingTechnique *)self _handleCV3DError:v182[0] withDescription:@"Get added anchors error" failTechnique:0];
    CFRelease(v182[0]);
  }
  uint64_t v9 = [(ARWorldTrackingPoseData *)obj slamState];
  [v9 slamState];
  v146 = (void *)CV3DSLAMStateCopyRemovedAnchors();

  if (!v146)
  {
    [(ARWorldTrackingTechnique *)self _handleCV3DError:v182[0] withDescription:@"Get removed anchors error" failTechnique:0];
    CFRelease(v182[0]);
  }
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.enableMLCMRelocalization"])
  {
    int v10 = [(ARWorldTrackingPoseData *)obj slamState];
    [v10 slamState];
    ExternalAnchorNames = (void *)CV3DSLAMStateGetExternalAnchorNames();

    if (ExternalAnchorNames) {
      goto LABEL_12;
    }
    [(ARWorldTrackingTechnique *)self _handleCV3DError:v182[0] withDescription:@"Get external anchors error" failTechnique:0];
    CFRelease(v182[0]);
  }
  ExternalAnchorNames = 0;
LABEL_12:
  if ([v150 count]
    || [v148 count]
    || [v146 count]
    || [ExternalAnchorNames count])
  {
    [v150 count];
    [v148 count];
    [v146 count];
    kdebug_trace();
    uint64_t v11 = [ARWorldTrackingReferenceAnchorData alloc];
    int v12 = ARAnchorsFromCV3DAnchorsArray(v150, 0, a3);
    id v13 = ARAnchorsFromCV3DAnchorsArray(v148, 0, a3);
    __int16 v14 = ARAnchorsFromCV3DAnchorsArray(v146, 0, a3);
    char v15 = ARAnchorsFromCV3DAnchorsArray(ExternalAnchorNames, 0, a3);
    id v144 = [(ARWorldTrackingReferenceAnchorData *)v11 initWithUpdatedAnchors:v12 addedAnchors:v13 removedAnchors:v14 externalAnchors:v15];

    [(ARWorldTrackingReferenceAnchorData *)v144 setTimestamp:a3];
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    [(ARWorldTrackingReferenceAnchorData *)v144 setReceivedAnchors:self->_anchorsReceived];
    long long v171 = 0u;
    long long v172 = 0u;
    long long v169 = 0u;
    long long v170 = 0u;
    uint64_t v16 = [(ARWorldTrackingReferenceAnchorData *)v144 addedAnchors];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v169 objects:v196 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v170;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v170 != v18) {
            objc_enumerationMutation(v16);
          }
          int v20 = *(void **)(*((void *)&v169 + 1) + 8 * i);
          if ([(NSMutableSet *)v154->_anchorsReceived containsObject:v20])
          {
            uint64_t v21 = _ARLogTechnique();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            {
              double v22 = (objc_class *)objc_opt_class();
              NSStringFromClass(v22);
              id v23 = (id)objc_claimAutoreleasedReturnValue();
              double v24 = [v20 description];
              LODWORD(buf[0].f64[0]) = 138543874;
              *(void *)((char *)buf[0].f64 + 4) = v23;
              WORD2(buf[0].f64[1]) = 2048;
              *(void *)((char *)&buf[0].f64[1] + 6) = v154;
              HIWORD(buf[1].f64[0]) = 2112;
              *(void *)&buf[1].f64[1] = v24;
              _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: adding received anchor %@", (uint8_t *)buf, 0x20u);
            }
            [(NSMutableSet *)v154->_anchorsReceived removeObject:v20];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v169 objects:v196 count:16];
      }
      while (v17);
    }

    long long v167 = 0u;
    long long v168 = 0u;
    long long v165 = 0u;
    long long v166 = 0u;
    float32x4_t v25 = [(ARWorldTrackingReferenceAnchorData *)v144 externalAnchors];
    uint64_t v26 = [v25 countByEnumeratingWithState:&v165 objects:v195 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v166;
      do
      {
        for (uint64_t j = 0; j != v26; ++j)
        {
          if (*(void *)v166 != v27) {
            objc_enumerationMutation(v25);
          }
          __int16 v29 = *(void **)(*((void *)&v165 + 1) + 8 * j);
          uint64_t v30 = _ARLogTechnique();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            __int16 v31 = (objc_class *)objc_opt_class();
            NSStringFromClass(v31);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            __int16 v33 = [v29 description];
            LODWORD(buf[0].f64[0]) = 138543874;
            *(void *)((char *)buf[0].f64 + 4) = v32;
            WORD2(buf[0].f64[1]) = 2048;
            *(void *)((char *)&buf[0].f64[1] + 6) = v154;
            HIWORD(buf[1].f64[0]) = 2112;
            *(void *)&buf[1].f64[1] = v33;
            _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: updating external anchor %@", (uint8_t *)buf, 0x20u);
          }
        }
        uint64_t v26 = [v25 countByEnumeratingWithState:&v165 objects:v195 count:16];
      }
      while (v26);
    }

    int v34 = _ARLogTechnique();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      id v36 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v37 = [(NSMutableSet *)v154->_anchorsReceived count];
      LODWORD(buf[0].f64[0]) = 138543874;
      *(void *)((char *)buf[0].f64 + 4) = v36;
      WORD2(buf[0].f64[1]) = 2048;
      *(void *)((char *)&buf[0].f64[1] + 6) = v154;
      HIWORD(buf[1].f64[0]) = 2048;
      *(void *)&buf[1].f64[1] = v37;
      _os_log_impl(&dword_1B88A2000, v34, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: remaining received anchors to be added %tu", (uint8_t *)buf, 0x20u);
    }
    dispatch_semaphore_signal((dispatch_semaphore_t)v154->_sessionHandleStateSemaphore);
    [v152 addObject:v144];
    -[ARTrackedRaycastPostProcessor updateFromPoseGraphEventWithData:referenceOriginTransform:](v154->_trackedRaycastPostProcessor, "updateFromPoseGraphEventWithData:referenceOriginTransform:", v144, *(double *)v154->_anon_280, *(double *)&v154->_anon_280[16], *(double *)&v154->_anon_280[32], *(double *)&v154->_anon_280[48]);
    uint64_t v38 = _ARLogTechnique();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v39 = (objc_class *)objc_opt_class();
      NSStringFromClass(v39);
      id v40 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [v150 count];
      uint64_t v42 = [v148 count];
      uint64_t v43 = [v146 count];
      uint64_t v44 = [ExternalAnchorNames count];
      LODWORD(buf[0].f64[0]) = 138544898;
      *(void *)((char *)buf[0].f64 + 4) = v40;
      WORD2(buf[0].f64[1]) = 2048;
      *(void *)((char *)&buf[0].f64[1] + 6) = v154;
      HIWORD(buf[1].f64[0]) = 2048;
      buf[1].f64[1] = a3;
      LOWORD(buf[2].f64[0]) = 2048;
      *(void *)((char *)buf[2].f64 + 2) = v41;
      WORD1(buf[2].f64[1]) = 2048;
      *(void *)((char *)&buf[2].f64[1] + 4) = v42;
      WORD2(buf[3].f64[0]) = 2048;
      *(void *)((char *)buf[3].f64 + 6) = v43;
      HIWORD(buf[3].f64[1]) = 2048;
      uint64_t v190 = v44;
      _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: World tracking anchors changed at timestamp %f, updated %lu, added %lu, removed %lu, external %lu", (uint8_t *)buf, 0x48u);
    }
    self = v154;
  }
  long long v45 = [(ARWorldTrackingTechnique *)self mutableOptions];
  long long v46 = [v45 planeDetectionPoseUpdateCallback];
  BOOL v47 = v46 == 0;

  if (!v47)
  {
    uint64_t v48 = [(ARWorldTrackingTechnique *)v154 mutableOptions];
    long long v49 = [v48 planeDetectionPoseUpdateCallback];
    ((void (**)(void, void *))v49)[2](v49, v150);
  }
  os_unfair_lock_lock(&v154->_raycastSessionLock);
  if (v154->_raycastSession.__ptr_)
  {
    [(ARWorldTrackingPoseData *)obj visionCameraTransform];
    __invert_f4(v198);
    CV3DRaycastTriggerUpdateFromTrackableIntentsAsync();
  }
  os_unfair_lock_unlock(&v154->_raycastSessionLock);

  int v6 = v154;
LABEL_46:
  dispatch_semaphore_wait((dispatch_semaphore_t)v6->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  __int16 v50 = (int *)MEMORY[0x1E4F4D490];
  if (v142)
  {
    cachedPoseData = v6->_cachedPoseData;
    if (cachedPoseData)
    {
      [(ARWorldTrackingPoseData *)cachedPoseData timestamp];
      double v53 = v52;
      uint64_t v54 = _ARLogTechnique();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v55 = (objc_class *)objc_opt_class();
        NSStringFromClass(v55);
        id v56 = (id)objc_claimAutoreleasedReturnValue();
        [(ARWorldTrackingPoseData *)v154->_cachedPoseData timestamp];
        LODWORD(buf[0].f64[0]) = 138544386;
        *(void *)((char *)buf[0].f64 + 4) = v56;
        WORD2(buf[0].f64[1]) = 2048;
        *(void *)((char *)&buf[0].f64[1] + 6) = v154;
        HIWORD(buf[1].f64[0]) = 2048;
        buf[1].f64[1] = (a3 - v53) * 1000.0;
        LOWORD(buf[2].f64[0]) = 2048;
        *(double *)((char *)buf[2].f64 + 2) = a3;
        WORD1(buf[2].f64[1]) = 2048;
        *(void *)((char *)&buf[2].f64[1] + 4) = v57;
        _os_log_impl(&dword_1B88A2000, v54, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using cached pose data with age: %fms (%f - %f)", (uint8_t *)buf, 0x34u);
      }
      uint64_t v58 = [(ARWorldTrackingPoseData *)v154->_cachedPoseData copy];

      obuint64_t j = (ARWorldTrackingPoseData *)v58;
      [v152 addObject:v58];
    }
    goto LABEL_70;
  }
  [(ARWorldTrackingPoseData *)obj cameraTransform];
  [(ARWorldTrackingPoseData *)obj cameraTransform];
  [(ARWorldTrackingPoseData *)obj cameraTransform];
  kdebug_trace();
  uint64_t v59 = [(ARWorldTrackingPoseData *)obj worldTrackingState];
  BOOL v60 = [v59 state] == 0;

  if (!v60)
  {
    uint64_t v61 = v154->_cachedPoseData;
    if (v61)
    {
      [(ARWorldTrackingPoseData *)v61 visionCameraTransform];
      float32x4_t v149 = v63;
      float32x4_t v151 = v62;
      float32x4_t v145 = v65;
      float32x4_t v147 = v64;
      [(ARWorldTrackingPoseData *)obj visionCameraTransform];
      if (AREqualTransforms(v151, v149, v147, v145, v66, v67, v68, v69)) {
        kdebug_trace();
      }
    }
    objc_storeStrong((id *)&v154->_cachedPoseData, obj);
  }
  [v152 addObject:obj];
  if (v154->_didClearMap) {
    v154->_BOOL didClearMap = 0;
  }
  int v70 = [(ARWorldTrackingTechnique *)v154 mutableOptions];
  if ([v70 isCollaborationEnabled])
  {
    BOOL v71 = !v154->_participantAnchorsEnabled;

    if (v71) {
      goto LABEL_66;
    }
    int v70 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithIntegerValue:", -[ARWorldTrackingTechnique vioSessionIdentifier](v154, "vioSessionIdentifier"));
    v72 = (const void *)objc_msgSend(v70, "ar_createCFUUIDRef");
    *(void *)&long long v180 = 0;
    uint64_t v190 = 0;
    memset(buf, 0, sizeof(buf));
    float64x2_t v193 = 0uLL;
    uint64_t v194 = 0;
    [(ARWorldTrackingPoseData *)obj visionCameraTransform];
    ARMatrix4x4RowMajorRotationAndTranslation(buf, &v193, v73, v74, v75, v76);
    v199.columns[0] = (simd_float4)ARDisplayCenterTransformForCaptureDevicePosition(1);
    simd_float4x4 v200 = __invert_f4(v199);
    v200.columns[1] = (simd_float4)vcvtq_f64_f32(*(float32x2_t *)v200.columns[3].f32);
    v200.columns[2].i64[0] = *(_OWORD *)&vaddq_f64(v193, (float64x2_t)v200.columns[1]);
    v200.columns[2].i64[1] = *(void *)&vsubq_f64(v193, *(float64x2_t *)(&v200 + 16)).f64[1];
    simd_float4 v191 = v200.columns[2];
    uint64_t v192 = v194;
    *(void *)&long long v178 = 0;
    if (CV3DSLAMSessionCreateCMPoseAnchorData())
    {
      float32x4_t v77 = v180;
      [(ARWorldTrackingTechnique *)v154 _reportCollaborationData:(void)v180 type:7 metadata:0];
    }
    else
    {
      float32x4_t v77 = _ARLogTechnique();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG))
      {
        float32x4_t v78 = (objc_class *)objc_opt_class();
        NSStringFromClass(v78);
        id v79 = (id)objc_claimAutoreleasedReturnValue();
        float32x4_t v80 = (void *)v178;
        LODWORD(v182[0]) = 138543874;
        *(CFTypeRef *)((char *)v182 + 4) = v79;
        WORD2(v182[1]) = 2048;
        *(CFTypeRef *)((char *)&v182[1] + 6) = v154;
        HIWORD(v182[2]) = 2112;
        uint64_t v183 = v178;
        _os_log_impl(&dword_1B88A2000, v77, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Error creating participant anchor data: %@", (uint8_t *)v182, 0x20u);
      }
    }

    CFRelease(v72);
  }

LABEL_66:
  BOOL v81 = [MEMORY[0x1E4F1CA58] data];
  id v82 = [(ARWorldTrackingPoseData *)obj slamState];
  [v82 slamState];
  int LineCloud = CV3DSLAMStateGetLineCloud();

  if (LineCloud == *v50 && [v81 length])
  {
    simd_float4 v84 = [[ARLineCloud alloc] initWithLineCloudData:v81];
    [(ARWorldTrackingPoseData *)obj setLineCloud:v84];
  }
LABEL_70:
  simd_float4 v85 = [(ARWorldTrackingPoseData *)obj slamState];
  [v85 slamState];
  int OldestStateCovarianceMatrices = CV3DSLAMStateGetOldestStateCovarianceMatrices();

  int v87 = *v50;
  if (OldestStateCovarianceMatrices == *v50)
  {
    uint64_t v88 = [[ARInertialState alloc] initWithCovarianceMatrix:buf];
    *(CFTypeRef *)&long long v89 = v182[0];
    *(CFTypeRef *)&long long v90 = v182[1];
    *((void *)&v89 + 1) = v183;
    *((void *)&v90 + 1) = v184;
    *(void *)&long long v91 = v186;
    *(void *)&long long v92 = v187;
    *(CFTypeRef *)&long long v93 = v182[2];
    *((void *)&v93 + 1) = v185;
    *(void *)&long long v94 = v188;
    v164[0] = v89;
    v164[1] = v91;
    v164[2] = v90;
    v164[3] = v92;
    v164[4] = v93;
    v164[5] = v94;
    [(ARInertialState *)v88 setOrientation:v164];
    *(void *)&long long v95 = v179;
    v163[0] = v178;
    v163[1] = v95;
    [(ARInertialState *)v88 setPosition:v163];
    v96.i64[0] = v192;
    v162[0] = v191;
    v162[1] = v96;
    [(ARInertialState *)v88 setVelocity:v162];
    *(void *)&long long v97 = v181;
    v161[1] = v97;
    v161[0] = v180;
    [(ARInertialState *)v88 setAccelerometerBias:v161];
    *(void *)&long long v98 = v194;
    v160[0] = v193;
    v160[1] = v98;
    [(ARInertialState *)v88 setGyroscopeBias:v160];
    id v99 = [(ARWorldTrackingPoseData *)obj worldTrackingState];
    [v99 setInertialState:v88];
  }
  id v100 = [(ARWorldTrackingTechnique *)v154 mutableOptions];
  int v101 = [v100 isCollaborationEnabled];

  if (v101)
  {
    *(void *)v174 = 0;
    uint64_t v159 = 0;
    long long v102 = [(ARWorldTrackingPoseData *)obj slamState];
    [v102 slamState];
    int CollaborativeMapStatistics = CV3DSLAMStateGetCollaborativeMapStatistics();

    uint64_t v104 = *(void **)v174;
    if (CollaborativeMapStatistics == v87 && *(void *)v174)
    {
      id v105 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v159];
      id v106 = [(ARWorldTrackingPoseData *)obj worldTrackingState];
      [v106 setCollaborationStats:v105];

      uint64_t v104 = *(void **)v174;
    }
    free(v104);
    int v107 = objc_opt_new();
    uint64_t v108 = [(ARWorldTrackingPoseData *)obj slamState];
    [v108 slamState];
    int MapMergeStats = CV3DSLAMStateGetMapMergeStats();

    if (MapMergeStats == v87)
    {
      uint64_t v110 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v107, "count"));
      long long v157 = 0u;
      long long v158 = 0u;
      long long v155 = 0u;
      long long v156 = 0u;
      id v111 = v107;
      uint64_t v112 = [v111 countByEnumeratingWithState:&v155 objects:v177 count:16];
      if (v112)
      {
        uint64_t v113 = *(void *)v156;
        do
        {
          for (uint64_t k = 0; k != v112; ++k)
          {
            if (*(void *)v156 != v113) {
              objc_enumerationMutation(v111);
            }
            simd_float4x4 v115 = *(void **)(*((void *)&v155 + 1) + 8 * k);
            v116 = [v115 firstObject];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              float32x4_t v118 = [v115 firstObject];
              [v110 addObject:v118];
            }
          }
          uint64_t v112 = [v111 countByEnumeratingWithState:&v155 objects:v177 count:16];
        }
        while (v112);
      }

      uint64_t v119 = [(ARWorldTrackingPoseData *)obj worldTrackingState];
      [v119 setMergedSessionIdentifiers:v110];
    }
  }
  simd_float4x4 v120 = [(ARWorldTrackingTechnique *)v154 mutableOptions];
  long long v121 = [v120 slamConfiguration];
  char v122 = [v121 isEqualToString:@"ObjectDetectionMapBuilding"];

  p_isa = (id *)&v154->super.super.super.isa;
  if ((v122 & 1) == 0)
  {
    *(_DWORD *)v174 = 0;
    LODWORD(v159) = 0;
    long long v124 = [(ARWorldTrackingPoseData *)obj slamState];
    [v124 slamState];
    CV3DSLAMStateGetMapSize();

    v154->_currentVIOMapSize = *(int *)v174;
    uint64_t v125 = [(ARWorldTrackingPoseData *)obj slamState];
    [v125 slamState];
    CV3DSLAMStateGetMapKeyFrameQuality();

    uint64_t v126 = [(ARWorldTrackingPoseData *)obj slamState];
    [v126 slamState];
    CV3DSLAMStateWasTrackingMap();

    p_isa = (id *)&v154->super.super.super.isa;
    [(ARWorldTrackingPoseData *)obj setWorldMappingStatus:[(ARWorldTrackingTechnique *)v154 _mappingStatusFromMapSize:*(unsigned int *)v174 keyframeQuality:v159 isTrackingMap:0 timestamp:a3]];
  }
  float32x4_t v127 = [p_isa mutableOptions];
  if ([(ARWorldTrackingParticipantAnchorData *)v127 isCollaborationEnabled])
  {
    BOOL v128 = [p_isa[49] count] == 0;

    if (v128) {
      goto LABEL_94;
    }
    float32x4_t v127 = [[ARWorldTrackingParticipantAnchorData alloc] initWithAnchors:v154->_participantAnchors];
    [(NSMutableSet *)v154->_participantAnchors removeAllObjects];
    [v152 addObject:v127];
  }

LABEL_94:
  id v129 = v154;
  if (v154->_errorData)
  {
    objc_msgSend(v152, "addObject:");
    if (obj)
    {
      uint64_t v130 = [(ARWorldTrackingErrorData *)v154->_errorData errorCode];
      if (v130 == *MEMORY[0x1E4F4D420])
      {
        long long v131 = _ARLogTechnique();
        if (os_log_type_enabled(v131, OS_LOG_TYPE_DEBUG))
        {
          long long v132 = (objc_class *)objc_opt_class();
          NSStringFromClass(v132);
          id v133 = (id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v174 = 138543618;
          *(void *)&v174[4] = v133;
          __int16 v175 = 2048;
          v176 = v154;
          _os_log_impl(&dword_1B88A2000, v131, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting tracking state to initializing due to significant sensor data lose.", v174, 0x16u);
        }
        uint64_t v134 = objc_opt_new();
        [(ARWorldTrackingPoseData *)obj setWorldTrackingState:v134];

        v135 = [(ARWorldTrackingPoseData *)obj worldTrackingState];
        [v135 setState:0];

        id v136 = [(ARWorldTrackingPoseData *)obj worldTrackingState];
        [v136 setReason:1];

        id v129 = v154;
      }
    }
    errorData = v129->_errorData;
    v129->_errorData = 0;

    id v129 = v154;
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v129->_resultSemaphore);
  v138 = [(ARWorldTrackingPoseData *)obj slamState];
  simd_float4x4 v139 = -[ARWorldTrackingTechnique _featurePointDataFromSLAMState:](v129, "_featurePointDataFromSLAMState:", [v138 slamState]);

  simd_float4x4 v140 = v154;
  if (v139) {
    [v152 addObject:v139];
  }
  os_unfair_lock_lock(&v154->_latestSpatialMappingDataLock);
  if ([(NSMutableArray *)v154->_latestSpatialMappingData count])
  {
    [v152 addObjectsFromArray:v154->_latestSpatialMappingData];
    [(NSMutableArray *)v154->_latestSpatialMappingData removeAllObjects];
  }
  os_unfair_lock_unlock(&v154->_latestSpatialMappingDataLock);
  os_unfair_lock_lock(&v154->_spatialMappingPointCloudsLock);
  if ([(NSMutableDictionary *)v154->_spatialMappingPointClouds count])
  {
    v141 = [(NSMutableDictionary *)v154->_spatialMappingPointClouds allValues];
    [v152 addObjectsFromArray:v141];

    simd_float4x4 v140 = v154;
    [(NSMutableDictionary *)v154->_spatialMappingPointClouds removeAllObjects];
  }
  os_unfair_lock_unlock(&v154->_spatialMappingPointCloudsLock);
  [(ARImageBasedTechnique *)v140 pushResultData:v152 forTimestamp:a3];
  if (!obj)
  {
    if (!v139) {
      goto LABEL_111;
    }
    goto LABEL_109;
  }
  [(ARWorldTrackingPoseData *)obj timestamp];
  if (v139) {
LABEL_109:
  }
    [v139 timestamp];
LABEL_111:
  [v139 timestamp];
  kdebug_trace();
}

- (void)_handleSLAMError:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 code];
  kdebug_trace();
  BOOL v5 = _ARLogTechnique();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    int v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    *(_DWORD *)buf = 138543874;
    *(void *)&float64x2_t buf[4] = v7;
    __int16 v33 = 2048;
    int v34 = self;
    __int16 v35 = 2112;
    double v36 = *(double *)&v4;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: SLAM error callback: %@", buf, 0x20u);
  }
  double v8 = CACurrentMediaTime();
  uint64_t v9 = [v4 code];
  if (v9 == *MEMORY[0x1E4F4D420] || (uint64_t v10 = [v4 code], v10 == *MEMORY[0x1E4F4D418]))
  {
    uint64_t v11 = _ARLogTechnique();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543874;
      *(void *)&float64x2_t buf[4] = v13;
      __int16 v33 = 2048;
      int v34 = self;
      __int16 v35 = 2048;
      double v36 = v8;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: World tracking encountered a significant drop in sensor data, attempting to relocalize at time %f.", buf, 0x20u);
    }
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    if (self->_relocalizationState)
    {
      __int16 v14 = _ARLogTechnique();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        char v15 = (objc_class *)objc_opt_class();
        uint64_t v16 = NSStringFromClass(v15);
        unint64_t relocalizationState = self->_relocalizationState;
        *(_DWORD *)buf = 138543874;
        *(void *)&float64x2_t buf[4] = v16;
        __int16 v33 = 2048;
        int v34 = self;
        __int16 v35 = 2048;
        double v36 = *(double *)&relocalizationState;
        _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Not setting ARRelocalizationStateRelocalizingAfterSensorDataDrop, because we're already in state: %lu", buf, 0x20u);
      }
    }
    else
    {
      self->_unint64_t relocalizationState = 1;
    }
    self->_lastRelocalizationint Timestamp = 0.0;
    self->_originint Timestamp = 0.0;
    uint64_t v18 = (ARWorldTrackingErrorData *)[(ARWorldTrackingPoseData *)self->_cachedPoseData copy];
    int v19 = [(ARWorldTrackingPoseData *)self->_cachedPoseData worldTrackingState];
    [v19 setState:1];

    int v20 = [(ARWorldTrackingPoseData *)self->_cachedPoseData worldTrackingState];
    [v20 setReason:1];

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    if (v18)
    {
      __int16 v31 = v18;
      uint64_t v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
      [(ARImageBasedTechnique *)self pushResultData:v21 forFrame:0];
    }
    [v4 code];
    kdebug_trace();
LABEL_15:

    goto LABEL_16;
  }
  [v4 code];
  if (!CV3DSLAMIsFatalError())
  {
    uint64_t v30 = [v4 code];
    *(void *)buf = &v30;
    if (v8
       - *((double *)std::__tree<std::__value_type<long,double>,std::__map_value_compare<long,std::__value_type<long,double>,std::less<long>,true>,std::allocator<std::__value_type<long,double>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t **)&self->_lastErrorLogTimestamp, &v30, (uint64_t)&std::piecewise_construct, (uint64_t **)buf)+ 5) > 1.0)
    {
      uint64_t v30 = [v4 code];
      *(void *)buf = &v30;
      *((double *)std::__tree<std::__value_type<long,double>,std::__map_value_compare<long,std::__value_type<long,double>,std::less<long>,true>,std::allocator<std::__value_type<long,double>>>::__emplace_unique_key_args<long,std::piecewise_construct_t const&,std::tuple<long &&>,std::tuple<>>((uint64_t **)&self->_lastErrorLogTimestamp, &v30, (uint64_t)&std::piecewise_construct, (uint64_t **)buf)+ 5) = v8;
      uint64_t v26 = _ARLogTechnique();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        uint64_t v27 = (objc_class *)objc_opt_class();
        uint64_t v28 = NSStringFromClass(v27);
        uint64_t v29 = [v4 code];
        *(_DWORD *)buf = 138543874;
        *(void *)&float64x2_t buf[4] = v28;
        __int16 v33 = 2048;
        int v34 = self;
        __int16 v35 = 2048;
        double v36 = *(double *)&v29;
        _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: World tracking performance is being affected by resource constraints [%li]", buf, 0x20u);
      }
    }
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.warningSounds"])
    {
      softLinkAudioServicesPlaySystemSound(0x3EBu);
    }
    uint64_t v18 = [[ARWorldTrackingErrorData alloc] initWithTimestamp:v8];
    -[ARWorldTrackingErrorData setErrorCode:](v18, "setErrorCode:", [v4 code]);
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    objc_storeStrong((id *)&self->_errorData, v18);
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultSemaphore);
    [v4 code];
    kdebug_trace();
    goto LABEL_15;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_sessionHandleStateSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  self->_int64_t sessionHandleState = 4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_sessionHandleStateSemaphore);
  double v22 = _ARLogTechnique();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    id v23 = (objc_class *)objc_opt_class();
    double v24 = NSStringFromClass(v23);
    *(_DWORD *)buf = 138543618;
    *(void *)&float64x2_t buf[4] = v24;
    __int16 v33 = 2048;
    int v34 = self;
    _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: World tracking encountered fatal error.", buf, 0x16u);
  }
  float32x4_t v25 = ARErrorWithCodeAndUserInfo(200, 0);
  [(ARWorldTrackingTechnique *)self _didFailWithError:v25];

  [v4 code];
  kdebug_trace();
LABEL_16:
}

- (void)_didFailWithError:(id)a3
{
  id v7 = a3;
  id v4 = [(ARTechnique *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    int v6 = [(ARTechnique *)self delegate];
    [v6 technique:self didFailWithError:v7];
  }
}

- (BOOL)hasLoadedSurfaceData
{
  return self->_hasLoadedSurfaceData;
}

- (unint64_t)techniqueIndex
{
  return self->_techniqueIndex;
}

- (void)setTechniqueIndex:(unint64_t)a3
{
  self->_techniqueIndex = a3;
}

- (ARWorldTrackingOptions)mutableOptions
{
  return (ARWorldTrackingOptions *)objc_getProperty(self, a2, 560, 1);
}

- (void)setMutableOptions:(id)a3
{
}

- (double)referenceOriginTransform
{
  objc_copyStruct(&v2, (const void *)(a1 + 640), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setReferenceOriginTransform:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 640), v5, 64, 1, 0);
}

- (CV3DSLAMSession)slamSessionHandle
{
  return self->_slamSessionHandle;
}

- (void)setSlamSessionHandle:(CV3DSLAMSession *)a3
{
  self->_slamSessionHandle = a3;
}

- (CV3DPosePredictionContext)predictorHandle
{
  return self->_predictorHandle;
}

- (void)setPredictorHandle:(CV3DPosePredictionContext *)a3
{
  self->_predictorHandle = a3;
}

- (shared_ptr<RaycastSession>)raycastSession
{
  cntrl = self->_raycastSession.__cntrl_;
  *long long v2 = self->_raycastSession.__ptr_;
  v2[1] = (RaycastSession *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (RaycastSession *)self;
  return result;
}

- (void)setRaycastSession:(shared_ptr<RaycastSession>)a3
{
  p_raycastSession = &self->_raycastSession;
  char v5 = *(RaycastSession **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_raycastSession.__cntrl_;
  p_raycastSession->__ptr_ = v5;
  p_raycastSession->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (shared_ptr<PlaneDetectionSession>)planeDetectionSession
{
  cntrl = self->_planeDetectionSession.__cntrl_;
  *long long v2 = self->_planeDetectionSession.__ptr_;
  v2[1] = (PlaneDetectionSession *)cntrl;
  if (cntrl) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)cntrl + 1, 1uLL, memory_order_relaxed);
  }
  result.__cntrl_ = (__shared_weak_count *)a2;
  result.__ptr_ = (PlaneDetectionSession *)self;
  return result;
}

- (void)setPlaneDetectionSession:(shared_ptr<PlaneDetectionSession>)a3
{
  p_planeDetectionSession = &self->_planeDetectionSession;
  char v5 = *(PlaneDetectionSession **)a3.__ptr_;
  uint64_t v4 = *((void *)a3.__ptr_ + 1);
  if (v4) {
    atomic_fetch_add_explicit((atomic_ullong *volatile)(v4 + 8), 1uLL, memory_order_relaxed);
  }
  cntrl = self->_planeDetectionSession.__cntrl_;
  p_planeDetectionSession->__ptr_ = v5;
  p_planeDetectionSession->__cntrl_ = (__shared_weak_count *)v4;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
}

- (__n128)reconstructionFrameBundleToWorld
{
  return a1[44];
}

- (__n128)setReconstructionFrameBundleToWorld:(__n128)a3
{
  result[44] = a2;
  result[45] = a3;
  result[46] = a4;
  result[47] = a5;
  return result;
}

- (unint64_t)vioSessionIdentifier
{
  return self->_vioSessionIdentifier;
}

- (BOOL)hasQualityKeyframe
{
  return self->_hasQualityKeyframe;
}

- (void)setHasQualityKeyframe:(BOOL)a3
{
  self->_hasQualityKeyframe = a3;
}

- (ARTrackedRaycastPostProcessor)trackedRaycastPostProcessor
{
  return (ARTrackedRaycastPostProcessor *)objc_getProperty(self, a2, 592, 1);
}

- (void)setTrackedRaycastPostProcessor:(id)a3
{
}

- (double)extrinsicsToWideSensor
{
  objc_copyStruct(&v2, (const void *)(a1 + 768), 64, 1, 0);
  return *(double *)&v2;
}

- (void)setExtrinsicsToWideSensor:(__n128)a3
{
  v5[0] = a2;
  v5[1] = a3;
  v5[2] = a4;
  v5[3] = a5;
  objc_copyStruct((void *)(a1 + 768), v5, 64, 1, 0);
}

- (ARSceneReconstructionHandler)sceneReconstructionHandler
{
  return self->_sceneReconstructionHandler;
}

- (void).cxx_destruct
{
  cntrl = self->_planeDetectionSession.__cntrl_;
  if (cntrl) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)cntrl);
  }
  uint64_t v4 = self->_raycastSession.__cntrl_;
  if (v4) {
    std::__shared_weak_count::__release_shared[abi:ne180100]((std::__shared_weak_count *)v4);
  }
  objc_storeStrong((id *)&self->_sceneReconstructionHandler, 0);
  objc_storeStrong((id *)&self->_trackedRaycastPostProcessor, 0);
  objc_storeStrong((id *)&self->_mutableOptions, 0);
  objc_storeStrong((id *)&self->_resultDataQueue, 0);
  objc_storeStrong((id *)&self->_spatialMappingObjectRefinementQueue, 0);
  objc_storeStrong((id *)&self->_spatialMappingResultDataWaitingForSemantics, 0);
  objc_storeStrong((id *)&self->_spatialMappingPointClouds, 0);
  objc_storeStrong((id *)&self->_annotateDepthDataKernelFunction, 0);
  objc_storeStrong((id *)&self->_sharedMetalDevice, 0);
  objc_storeStrong((id *)&self->_spatialMappingCommandQueue, 0);
  objc_storeStrong((id *)&self->_latestSpatialMappingData, 0);
  objc_storeStrong((id *)&self->_participantAnchors, 0);
  objc_storeStrong((id *)&self->_anchorsReceived, 0);

  objc_storeStrong((id *)&self->_resultSemaphore, 0);
  objc_storeStrong((id *)&self->_lastCameraType, 0);
  objc_storeStrong((id *)&self->_cachedPoseData, 0);
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_sessionHandleStateSemaphore, 0);
  std::__tree<std::array<unsigned char,16ul>>::destroy((uint64_t)&self->_lastErrorLogTimestamp, (void *)self->_lastErrorLogTimestamp.__tree_.__pair1_.__value_.__left_);
  objc_storeStrong((id *)&self->_observersSemaphore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (id).cxx_construct
{
  *((void *)self + 15) = 0;
  *((void *)self + 14) = 0;
  *((void *)self + 13) = (char *)self + 112;
  *((void *)self + 47) = 0;
  *((_OWORD *)self + 21) = 0u;
  *((_OWORD *)self + 22) = 0u;
  *((unsigned char *)self + 368) = 0;
  *((void *)self + 76) = 0;
  *((void *)self + 77) = 0;
  *((void *)self + 78) = 0;
  *((void *)self + 79) = 0;
  return self;
}

@end