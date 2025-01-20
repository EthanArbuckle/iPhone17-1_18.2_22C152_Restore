@interface ARSession
+ (BOOL)_supportsConfiguration:(id)a3;
+ (id)_applySessionOverrides:(id)a3 outError:(id *)a4;
+ (id)_fullDescription;
+ (id)_runningSessions;
+ (void)forceEnvironmentTexturingTechniqueToManualMode:(id)a3;
+ (void)initialize;
+ (void)setRenderType:(unint64_t)a3;
- (ARConfiguration)configuration;
- (ARConfiguration)configurationInternal;
- (ARDeviceOrientationData)latestDeviceOrientationData;
- (ARFrame)currentFrame;
- (ARLocationData)latestLocationData;
- (ARParentTechnique)secondaryTechnique;
- (ARParentTechnique)technique;
- (ARQATracer)tracer;
- (ARRemoteGeoTrackingTechnique)geoTrackingTechnique;
- (ARSession)init;
- (ARSessionMetrics)metrics;
- (ARTrackedRaycast)trackedRaycast:(ARRaycastQuery *)query updateHandler:(void *)updateHandler;
- (BOOL)_exposeInternalDepthData;
- (BOOL)_shouldSkipAnchorCreationForData:(id)a3;
- (BOOL)_shouldUpdateLocationSensorForFusion;
- (BOOL)forceAddSceneReconstructionKeyframePointCloudWithColor;
- (BOOL)is6DofFaceTracking;
- (BOOL)isPrimaryImageData:(id)a3;
- (BOOL)isUserFaceTracking;
- (BOOL)querySceneReconstructionOccupancyWithPoints:(id)a3 callback:(id)a4;
- (BOOL)relocalizing;
- (BOOL)wantsPredictedAnchorTracking;
- (NSArray)availableSensors;
- (NSArray)raycast:(ARRaycastQuery *)query;
- (NSMutableDictionary)geoAnchorToAltitude;
- (NSString)description;
- (NSUUID)identifier;
- (__n128)_cameraTransformForResultData:(void *)a3 previousFrame:(void *)a4;
- (__n128)originTransform;
- (__n128)predictedDeviceTransformAtTimestamp:(uint64_t)a1;
- (dispatch_queue_t)delegateQueue;
- (id)_frameContextByConsumingPendingChanges;
- (id)_fullDescription;
- (id)_getGeoAnchorAltitude:(id)a3;
- (id)_getObservers;
- (id)_imageSensorForConfiguration:(id)a3 existingSensor:(id)a4;
- (id)_prepareTechniquesQueue;
- (id)adPipelineParameters;
- (id)annotateAnchorToRaycastResults:(id)a3;
- (id)beforeRunningAVCaptureSession;
- (id)delegate;
- (id)replaySensor;
- (id)stateQueue;
- (unint64_t)pausedSensors;
- (unint64_t)powerUsage;
- (unint64_t)runningSensors;
- (unint64_t)state;
- (void)_addObserver:(id)a3;
- (void)_changePowerUsage:(unint64_t)a3;
- (void)_changePowerUsage:(unint64_t)a3 forced:(BOOL)a4;
- (void)_configureSensorsForRecording;
- (void)_endInterruption;
- (void)_interruptSession;
- (void)_lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4;
- (void)_lookupAltitudeForAnchor:(id)a3;
- (void)_pauseWaitingForOutstandingCallbacks:(BOOL)a3;
- (void)_removeGeoAnchorAltitude:(id)a3;
- (void)_removeObserver:(id)a3;
- (void)_replaceOrAddSensor:(id)a3;
- (void)_saveGraphFileInFileName:(id *)a3;
- (void)_sessionCameraDidChangeTrackingState:(id)a3;
- (void)_sessionDidAddAnchors:(id)a3;
- (void)_sessionDidCaptureHighResolutionFrame:(id)a3 error:(id)a4;
- (void)_sessionDidChangeGeoTrackingStatus:(id)a3;
- (void)_sessionDidFailWithError:(id)a3;
- (void)_sessionDidOutputAudioData:(id)a3;
- (void)_sessionDidOutputCollaborationData:(id)a3;
- (void)_sessionDidRemoveAnchors:(id)a3;
- (void)_sessionDidUpdateAnchors:(id)a3;
- (void)_sessionDidUpdateExternalAnchors:(id)a3;
- (void)_sessionDidUpdateFrame:(id)a3;
- (void)_sessionDidUpdateSpatialMappingPointClouds:(id)a3;
- (void)_sessionRequestedRunWithConfiguration:(id)a3 options:(unint64_t)a4;
- (void)_sessionShouldAttemptRelocalization;
- (void)_sessionWillRunWithConfiguration:(id)a3;
- (void)_setGeoAnchorAltitude:(id)a3 pair:(id)a4;
- (void)_setPrimaryTechnique:(id)a3;
- (void)_setPrimaryTechnique:(id)a3 secondaryTechnique:(id)a4;
- (void)_startSensorsWithRequiredDataTypes:(unint64_t)a3 optionalDataTypes:(unint64_t)a4;
- (void)_stopAllSensorsWaitingForOutstandingCallbacks:(BOOL)a3;
- (void)_stopSensorsWithDataTypes:(unint64_t)a3 keepingDataTypes:(unint64_t)a4;
- (void)_updateAnchorsForFrame:(id)a3 resultDatas:(id)a4 context:(id)a5 addedAnchors:(id)a6 updatedAnchors:(id)a7 removedAnchors:(id)a8 externalAnchors:(id)a9;
- (void)_updateFeaturePointsForFrame:(id)a3 previousFrame:(id)a4 trackingStateChanged:(BOOL)a5 context:(id)a6;
- (void)_updateOriginTransformForFrame:(id)a3 previousFrame:(id)a4 modifiers:(unint64_t)a5 context:(id)a6;
- (void)_updatePowerPressureLevelWithToken:(int)a3;
- (void)_updatePowerUsage;
- (void)_updatePowerUsageForced:(BOOL)a3;
- (void)_updateSensorsWithConfiguration:(id)a3;
- (void)_updateSessionStateWithConfiguration:(id)a3 options:(unint64_t)a4;
- (void)_updateSessionWithConfiguration:(id)a3 options:(unint64_t)a4;
- (void)_updateThermalState:(id)a3;
- (void)addAnchor:(ARAnchor *)anchor;
- (void)captureHighResolutionFrameWithCompletion:(void *)completion;
- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3 completion:(id)a4;
- (void)createReferenceObjectWithTransform:(simd_float4x4)transform center:(simd_float3)center extent:(simd_float3)extent completionHandler:(void *)completionHandler;
- (void)dealloc;
- (void)forceEnvironmentTexturingToManualMode:(BOOL)a3;
- (void)getCurrentWorldMapWithCompletionHandler:(void *)completionHandler;
- (void)getGeoLocationForPoint:(simd_float3)position completionHandler:(void *)completionHandler;
- (void)pause;
- (void)removeAnchor:(ARAnchor *)anchor;
- (void)runWithConfiguration:(ARConfiguration *)configuration;
- (void)runWithConfiguration:(ARConfiguration *)configuration options:(ARSessionRunOptions)options;
- (void)sensor:(id)a3 didFailWithError:(id)a4;
- (void)sensor:(id)a3 didOutputSensorData:(id)a4;
- (void)sensorDidPause:(id)a3;
- (void)sensorDidRestart:(id)a3;
- (void)setAvailableSensors:(id)a3;
- (void)setBeforeRunningAVCaptureSession:(id)a3;
- (void)setConfigurationInternal:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue;
- (void)setForceAddSceneReconstructionKeyframePointCloudWithColor:(BOOL)a3;
- (void)setGeoAnchorToAltitude:(id)a3;
- (void)setGeoTrackingTechnique:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLatestDeviceOrientationData:(id)a3;
- (void)setLatestLocationData:(id)a3;
- (void)setOriginTransform:(__n128)a3;
- (void)setPausedSensors:(unint64_t)a3;
- (void)setPowerUsage:(unint64_t)a3;
- (void)setRelocalizing:(BOOL)a3;
- (void)setRunningSensors:(unint64_t)a3;
- (void)setSecondaryTechnique:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setTechnique:(id)a3;
- (void)setTracer:(id)a3;
- (void)setWorldOrigin:(simd_float4x4)relativeTransform;
- (void)setupResultRequestSyncScheduler:(id)a3 forTechnique:(id)a4;
- (void)setupSessionForTechniques:(id)a3;
- (void)technique:(id)a3 didChangeState:(int64_t)a4;
- (void)technique:(id)a3 didFailWithError:(id)a4;
- (void)technique:(id)a3 didOutputCollaborationData:(id)a4;
- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6;
- (void)updateWithCollaborationData:(ARCollaborationData *)collaborationData;
@end

@implementation ARSession

- (unint64_t)state
{
  return self->_state;
}

void __23__ARSession_initialize__block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = _os_activity_create(&dword_1B88A2000, "ARKit Session", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v3 = (void *)arkitActivity;
  arkitActivity = (uint64_t)v2;

  v4 = _ARLogSession_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    uint64_t v7 = *(void *)(a1 + 32);
    v8 = ARKitCoreBuildVersionString();
    *(_DWORD *)buf = 138543874;
    v14 = v6;
    __int16 v15 = 2048;
    uint64_t v16 = v7;
    __int16 v17 = 2114;
    *(void *)v18 = v8;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>:  ==== Loading ARKit %{public}@ ====", buf, 0x20u);
  }
  CV3DGetVersionInfo();
  v9 = _ARLogSession_0();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (objc_class *)objc_opt_class();
    v11 = NSStringFromClass(v10);
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138544386;
    v14 = v11;
    __int16 v15 = 2048;
    uint64_t v16 = v12;
    __int16 v17 = 1024;
    *(_DWORD *)v18 = 0;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = 0;
    __int16 v19 = 1024;
    int v20 = 0;
    _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>:  ==== Using AppleCV3D %u.%u.%u  ====", buf, 0x28u);
  }
}

- (void)_addObserver:(id)a3
{
  observersSemaphore = self->_observersSemaphore;
  id v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSHashTable *)self->_observers addObject:v5];

  v6 = self->_observersSemaphore;
  dispatch_semaphore_signal(v6);
}

- (ARSession)init
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  v78.receiver = self;
  v78.super_class = (Class)ARSession;
  os_activity_t v2 = [(ARSession *)&v78 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F29128] UUID];
    v4 = (void *)*((void *)v2 + 55);
    *((void *)v2 + 55) = v3;

    *((void *)v2 + 58) = 0;
    dispatch_semaphore_t v5 = dispatch_semaphore_create(1);
    v6 = (void *)*((void *)v2 + 17);
    *((void *)v2 + 17) = v5;

    dispatch_semaphore_t v7 = dispatch_semaphore_create(1);
    v8 = (void *)*((void *)v2 + 19);
    *((void *)v2 + 19) = v7;

    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_USER_INTERACTIVE, 0);

    v11 = dispatch_queue_create("com.apple.arkit.stateSerialQueue", v10);
    dispatch_queue_set_specific(v11, &kARSessionStateQueueSpecificKey, (void *)kARSessionStateQueueSpecificValue, 0);
    objc_storeStrong((id *)v2 + 20, v11);
    *((void *)v2 + 61) = 0;
    uint64_t v12 = objc_opt_new();
    v13 = (void *)*((void *)v2 + 60);
    *((void *)v2 + 60) = v12;

    uint64_t v14 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    __int16 v15 = (void *)*((void *)v2 + 21);
    *((void *)v2 + 21) = v14;

    dispatch_semaphore_t v16 = dispatch_semaphore_create(1);
    __int16 v17 = (void *)*((void *)v2 + 22);
    *((void *)v2 + 22) = v16;

    uint64_t v18 = objc_opt_new();
    __int16 v19 = (void *)*((void *)v2 + 65);
    *((void *)v2 + 65) = v18;

    uint64_t v20 = objc_opt_new();
    uint64_t v21 = (void *)*((void *)v2 + 18);
    *((void *)v2 + 18) = v20;

    dispatch_semaphore_t v22 = dispatch_semaphore_create(1);
    v23 = (void *)*((void *)v2 + 7);
    *((void *)v2 + 7) = v22;

    uint64_t v24 = MEMORY[0x1E4F149A0];
    long long v25 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
    *((_OWORD *)v2 + 4) = *MEMORY[0x1E4F149A0];
    *((_OWORD *)v2 + 5) = v25;
    long long v26 = *(_OWORD *)(v24 + 48);
    *((_OWORD *)v2 + 6) = *(_OWORD *)(v24 + 32);
    *((_OWORD *)v2 + 7) = v26;
    dispatch_semaphore_t v27 = dispatch_semaphore_create(1);
    v28 = (void *)*((void *)v2 + 39);
    *((void *)v2 + 39) = v27;

    dispatch_semaphore_t v29 = dispatch_semaphore_create(1);
    v30 = (void *)*((void *)v2 + 47);
    *((void *)v2 + 47) = v29;

    *((unsigned char *)v2 + 384) = 0;
    uint64_t v31 = objc_opt_new();
    v32 = (void *)*((void *)v2 + 44);
    *((void *)v2 + 44) = v31;

    if (+[ARQATracer isEnabled])
    {
      uint64_t v33 = objc_opt_new();
      v34 = (void *)*((void *)v2 + 64);
      *((void *)v2 + 64) = v33;

      [v2 _addObserver:*((void *)v2 + 64)];
    }
    *((unsigned char *)v2 + 50) = +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.personDetectionTechnique.renderBoundingBoxesIntoCapturedImage"];
    *((void *)v2 + 27) = 0x4010000000000000;
    v35 = +[ARKitUserDefaults numberForKey:@"com.apple.arkit.session.defaultRelocalizationTimeout"];
    v36 = v35;
    if (v35)
    {
      [v35 doubleValue];
      *((void *)v2 + 27) = v37;
      v38 = _ARLogSession_0();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = (objc_class *)objc_opt_class();
        v40 = NSStringFromClass(v39);
        v41 = (void *)*((void *)v2 + 27);
        *(_DWORD *)buf = 138543874;
        id v80 = v40;
        __int16 v81 = 2048;
        v82 = v2;
        __int16 v83 = 2048;
        v84 = v41;
        _os_log_impl(&dword_1B88A2000, v38, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Overriding default relocalization timeout: %f", buf, 0x20u);
      }
    }
    *((void *)v2 + 31) = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.session.featurePointAccumulationCount"];
    v42 = _ARLogSession_0();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = (objc_class *)objc_opt_class();
      v44 = NSStringFromClass(v43);
      v45 = (void *)*((void *)v2 + 31);
      *(_DWORD *)buf = 138543874;
      id v80 = v44;
      __int16 v81 = 2048;
      v82 = v2;
      __int16 v83 = 2048;
      v84 = v45;
      _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Feature point accumulation set to %ld", buf, 0x20u);
    }
    objc_initWeak(&location, v2);
    v46 = objc_opt_new();
    [v46 setUnderlyingQueue:v11];
    handler[0] = MEMORY[0x1E4F143A8];
    handler[1] = 3221225472;
    handler[2] = __17__ARSession_init__block_invoke;
    handler[3] = &unk_1E6187148;
    objc_copyWeak(&v76, &location);
    notify_register_dispatch("com.apple.system.peakpowerpressurelevel", (int *)v2 + 50, v11, handler);
    [v2 _updatePowerPressureLevelWithToken:v2[50]];
    v47 = [MEMORY[0x1E4F28EB8] defaultCenter];
    v73[0] = MEMORY[0x1E4F143A8];
    v73[1] = 3221225472;
    v73[2] = __17__ARSession_init__block_invoke_2;
    v73[3] = &unk_1E6187170;
    objc_copyWeak(&v74, &location);
    uint64_t v48 = [v47 addObserverForName:*MEMORY[0x1E4F287F0] object:0 queue:v46 usingBlock:v73];
    v49 = (void *)*((void *)v2 + 23);
    *((void *)v2 + 23) = v48;

    v50 = [MEMORY[0x1E4F28F80] processInfo];
    [v2 _updateThermalState:v50];

    [v2 _updatePowerUsage];
    uint64_t v51 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.technique.prepare");
    v52 = (void *)*((void *)v2 + 34);
    *((void *)v2 + 34) = v51;

    v53 = [[ARTrackedRaycastPostProcessor alloc] initWithSession:v2];
    v54 = (void *)*((void *)v2 + 40);
    *((void *)v2 + 40) = v53;

    uint64_t v55 = +[ARBKSAccelerometer sharedAccelerometerHandle];
    v56 = (void *)*((void *)v2 + 41);
    *((void *)v2 + 41) = v55;

    v57 = _ARLogSession_0();
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v58 = v10;
      v59 = (objc_class *)objc_opt_class();
      NSStringFromClass(v59);
      id v60 = (id)objc_claimAutoreleasedReturnValue();
      v61 = [v2 identifier];
      *(_DWORD *)buf = 138543874;
      id v80 = v60;
      __int16 v81 = 2048;
      v82 = v2;
      __int16 v83 = 2112;
      v84 = v61;
      _os_log_impl(&dword_1B88A2000, v57, OS_LOG_TYPE_INFO, "%{public}@ <%p>: initialized with identifier %@", buf, 0x20u);

      v10 = v58;
    }

    uint64_t v62 = [objc_alloc(MEMORY[0x1E4F28F50]) initWithOptions:261];
    v63 = (void *)*((void *)v2 + 45);
    *((void *)v2 + 45) = v62;

    v64 = objc_opt_class();
    uint64_t v65 = objc_sync_enter(v64);
    v66 = (void *)MEMORY[0x1BA9C6160](v65);
    id v67 = +[ARSession _runningSessions];
    [(id)_weakSessions addPointer:v2];
    objc_sync_exit(v64);

    uint64_t v68 = [MEMORY[0x1E4F1CA60] dictionary];
    v69 = (void *)*((void *)v2 + 70);
    *((void *)v2 + 70) = v68;

    v2[7] = 0;
    *(void *)(v2 + 97) = 0;
    *((void *)v2 + 50) = ARCreateCV3DLoggingHandle(+[ARKitUserDefaults integerForKey:](ARKitUserDefaults, "integerForKey:", @"com.apple.arkit.slamManager.cv3dLoggingLevel.api"), +[ARKitUserDefaults integerForKey:@"com.apple.arkit.slamManager.cv3dLoggingLevel.internal"]);
    v70 = [[ARRecon3DLogger alloc] initWithInternalLogging:1];
    v71 = (void *)*((void *)v2 + 51);
    *((void *)v2 + 51) = v70;

    objc_destroyWeak(&v74);
    objc_destroyWeak(&v76);

    objc_destroyWeak(&location);
  }
  return (ARSession *)v2;
}

void __29__ARSession__runningSessions__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28F50] weakObjectsPointerArray];
  v1 = (void *)_weakSessions;
  _weakSessions = v0;
}

uint64_t __18__ARSession_pause__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) state])
  {
    [*(id *)(a1 + 32) _pauseWaitingForOutstandingCallbacks:1];
    [*(id *)(a1 + 32) setState:0];
    os_activity_t v2 = _ARLogSession_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = (objc_class *)objc_opt_class();
      v4 = NSStringFromClass(v3);
      uint64_t v5 = *(void *)(a1 + 32);
      int v10 = 138543618;
      v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = v5;
      v6 = "%{public}@ <%p>: paused";
LABEL_6:
      _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, 0x16u);
    }
  }
  else
  {
    os_activity_t v2 = _ARLogSession_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      dispatch_semaphore_t v7 = (objc_class *)objc_opt_class();
      v4 = NSStringFromClass(v7);
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543618;
      v11 = v4;
      __int16 v12 = 2048;
      uint64_t v13 = v8;
      v6 = "%{public}@ <%p>: already paused";
      goto LABEL_6;
    }
  }

  return kdebug_trace();
}

- (unint64_t)powerUsage
{
  return self->_powerUsage;
}

- (void)pause
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  uint64_t v3 = _os_activity_create(&dword_1B88A2000, "Pausing session", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  v4 = _ARLogSession_0();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = (objc_class *)objc_opt_class();
    v6 = NSStringFromClass(v5);
    *(_DWORD *)buf = 138543618;
    v11 = v6;
    __int16 v12 = 2048;
    uint64_t v13 = self;
    _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: begin pause", buf, 0x16u);
  }
  kdebug_trace();
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__ARSession_pause__block_invoke;
  block[3] = &unk_1E61851B0;
  block[4] = self;
  dispatch_async(stateQueue, block);
  os_activity_scope_leave(&state);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 440, 1);
}

- (void)_updateThermalState:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int64_t v4 = [a3 thermalState];
  self->_int64_t thermalState = v4;
  [(ARSessionMetrics *)self->_metrics sessionUpdateThermalState:v4];
  uint64_t v5 = _ARLogSession_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (objc_class *)objc_opt_class();
    dispatch_semaphore_t v7 = NSStringFromClass(v6);
    int64_t thermalState = self->_thermalState;
    int v9 = 138543874;
    int v10 = v7;
    __int16 v11 = 2048;
    __int16 v12 = self;
    __int16 v13 = 2048;
    int64_t v14 = thermalState;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_INFO, "%{public}@ <%p>: thermal state: %li", (uint8_t *)&v9, 0x20u);
  }
}

- (void)_updatePowerUsage
{
}

- (void)_updatePowerUsageForced:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v5 = ARPowerUsageForThermalState(self->_thermalState);
  unint64_t v6 = ARPowerUsageForPowerPressureLevel(self->_peakPowerPressureLevel);
  if (v5 <= v6) {
    unint64_t v7 = v6;
  }
  else {
    unint64_t v7 = v5;
  }
  [(ARSession *)self _changePowerUsage:v7 forced:v3];
}

- (void)_updatePowerPressureLevelWithToken:(int)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t state64 = 0;
  if (notify_get_state(a3, &state64))
  {
    self->_peakPowerPressureLevel = 0;
    int64_t v4 = _ARLogSession_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      unint64_t v5 = (objc_class *)objc_opt_class();
      unint64_t v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      int64_t v14 = v6;
      __int16 v15 = 2048;
      dispatch_semaphore_t v16 = self;
      unint64_t v7 = "%{public}@ <%p>: could not read peak power";
      uint64_t v8 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_ERROR;
      uint32_t v10 = 22;
LABEL_6:
      _os_log_impl(&dword_1B88A2000, v8, v9, v7, buf, v10);
    }
  }
  else
  {
    self->_peakPowerPressureLevel = state64;
    int64_t v4 = _ARLogSession_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = (objc_class *)objc_opt_class();
      unint64_t v6 = NSStringFromClass(v11);
      *(_DWORD *)buf = 138543874;
      int64_t v14 = v6;
      __int16 v15 = 2048;
      dispatch_semaphore_t v16 = self;
      __int16 v17 = 2048;
      uint64_t v18 = state64;
      unint64_t v7 = "%{public}@ <%p>: peak power level: %llu";
      uint64_t v8 = v4;
      os_log_type_t v9 = OS_LOG_TYPE_INFO;
      uint32_t v10 = 32;
      goto LABEL_6;
    }
  }
}

- (void)_changePowerUsage:(unint64_t)a3 forced:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([(ARSession *)self powerUsage] != a3 || v4)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    unint64_t v7 = _os_activity_create(&dword_1B88A2000, "Power usage changed", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v7, &state);

    unint64_t v8 = [(ARSession *)self powerUsage];
    [(ARSession *)self setPowerUsage:a3];
    if (a3)
    {
      os_log_type_t v9 = _ARLogSession_0();
      BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
      if (v8 <= a3)
      {
        if (v10)
        {
          dispatch_semaphore_t v16 = (objc_class *)objc_opt_class();
          NSStringFromClass(v16);
          id v17 = (id)objc_claimAutoreleasedReturnValue();
          unint64_t v18 = [(ARSession *)self powerUsage];
          *(_DWORD *)buf = 138543874;
          id v33 = v17;
          __int16 v34 = 2048;
          v35 = self;
          __int16 v36 = 2048;
          unint64_t v37 = v18;
          _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Increasing power utilization [%li]", buf, 0x20u);
        }
      }
      else if (v10)
      {
        __int16 v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v13 = [(ARSession *)self powerUsage];
        *(_DWORD *)buf = 138543874;
        id v33 = v12;
        __int16 v34 = 2048;
        v35 = self;
        __int16 v36 = 2048;
        unint64_t v37 = v13;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Decreasing power utilization [%li]", buf, 0x20u);
      }
    }
    else
    {
      os_log_type_t v9 = _ARLogSession_0();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v14 = (objc_class *)objc_opt_class();
        __int16 v15 = NSStringFromClass(v14);
        *(_DWORD *)buf = 138543618;
        id v33 = v15;
        __int16 v34 = 2048;
        v35 = self;
        _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Restoring normal power utilization", buf, 0x16u);
      }
    }

    uint64_t v19 = [(ARSession *)self technique];
    [v19 setPowerUsage:a3];

    uint64_t v20 = [(ARSession *)self secondaryTechnique];
    [v20 setPowerUsage:a3];

    kdebug_trace();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v21 = [(ARSession *)self availableSensors];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v27;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v27 != v23) {
            objc_enumerationMutation(v21);
          }
          long long v25 = *(void **)(*((void *)&v26 + 1) + 8 * v24);
          if (objc_opt_respondsToSelector()) {
            [v25 setPowerUsage:a3];
          }
          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = [v21 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v22);
    }

    kdebug_trace();
    os_activity_scope_leave(&state);
  }
}

+ (void)initialize
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__ARSession_initialize__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (initialize_onceToken != -1) {
    dispatch_once(&initialize_onceToken, block);
  }
}

+ (id)_runningSessions
{
  if (_runningSessions_sessionsOnceToken != -1) {
    dispatch_once(&_runningSessions_sessionsOnceToken, &__block_literal_global_69);
  }
  objc_msgSend((id)_weakSessions, "ar_compactZeroedWeakPointers");
  os_activity_t v2 = (void *)_weakSessions;
  return (id)[v2 allObjects];
}

- (BOOL)wantsPredictedAnchorTracking
{
  return 0;
}

void __17__ARSession_init__block_invoke(uint64_t a1, uint64_t a2)
{
  BOOL v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updatePowerPressureLevelWithToken:a2];

  id v5 = objc_loadWeakRetained(v3);
  [v5 _updatePowerUsage];
}

void __17__ARSession_init__block_invoke_2(uint64_t a1, void *a2)
{
  os_activity_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 object];

  [WeakRetained _updateThermalState:v5];
  id v6 = objc_loadWeakRetained(v2);
  [v6 _updatePowerUsage];
}

- (void)dealloc
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __20__ARSession_dealloc__block_invoke;
  v7[3] = &unk_1E61851B0;
  v7[4] = self;
  id v3 = (void (**)(void))MEMORY[0x1BA9C63E0](v7, a2);
  if (dispatch_get_specific(&kARSessionStateQueueSpecificKey) == (void *)kARSessionStateQueueSpecificValue) {
    v3[2](v3);
  }
  else {
    dispatch_sync((dispatch_queue_t)self->_stateQueue, v3);
  }
  if (self->_thermalStateObserver)
  {
    BOOL v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 removeObserver:self->_thermalStateObserver];
  }
  int peakPowerPressureToken = self->_peakPowerPressureToken;
  if (peakPowerPressureToken) {
    notify_cancel(peakPowerPressureToken);
  }
  +[ARKitUserDefaults clearUserDefaultsCache];
  CV3DLoggingReleaseHandle();

  v6.receiver = self;
  v6.super_class = (Class)ARSession;
  [(ARSession *)&v6 dealloc];
}

uint64_t __20__ARSession_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t result = [*(id *)(a1 + 32) state];
  if (result)
  {
    id v3 = _ARLogSession_0();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      BOOL v4 = (objc_class *)objc_opt_class();
      id v5 = NSStringFromClass(v4);
      uint64_t v6 = *(void *)(a1 + 32);
      int v7 = 138543618;
      unint64_t v8 = v5;
      __int16 v9 = 2048;
      uint64_t v10 = v6;
      _os_log_impl(&dword_1B88A2000, v3, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ARSession is being deallocated without being paused. Please pause running sessions explicitly.", (uint8_t *)&v7, 0x16u);
    }
    return [*(id *)(a1 + 32) _pauseWaitingForOutstandingCallbacks:0];
  }
  return result;
}

- (ARFrame)currentFrame
{
  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  id v3 = self->_lastProcessedFrame;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
  [(ARFrame *)v3 timestamp];
  kdebug_trace();
  return v3;
}

- (ARConfiguration)configuration
{
  kdebug_trace();
  id v3 = [(ARSession *)self configurationInternal];
  BOOL v4 = (void *)[v3 copy];

  kdebug_trace();
  return (ARConfiguration *)v4;
}

- (void)runWithConfiguration:(ARConfiguration *)configuration
{
}

- (void)runWithConfiguration:(ARConfiguration *)configuration options:(ARSessionRunOptions)options
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = configuration;
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  int v7 = _os_activity_create(&dword_1B88A2000, "Running with configuration", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v7, &state);

  id v8 = (id)[(ARConfiguration *)v6 copy];
  if ([(ARSession *)self forceAddSceneReconstructionKeyframePointCloudWithColor])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v9 = v8;
      objc_msgSend(v9, "setSceneReconstruction:", objc_msgSend(v9, "sceneReconstruction") | 0x18);
      uint64_t v10 = _ARLogSession_0();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = (objc_class *)objc_opt_class();
        NSStringFromClass(v11);
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        unint64_t v13 = NSStringFromARSceneReconstruction([v9 sceneReconstruction]);
        *(_DWORD *)buf = 138543874;
        id v36 = v12;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2112;
        id v40 = v13;
        _os_log_impl(&dword_1B88A2000, v10, OS_LOG_TYPE_INFO, "%{public}@ <%p>: SceneReconstruction after enforcing addition of KeyframePointCloudWithColor=%@", buf, 0x20u);
      }
    }
  }
  [(ARSession *)self _sessionRequestedRunWithConfiguration:v8 options:options];
  kdebug_trace();
  BOOL v14 = +[ARSession _supportsConfiguration:v8];
  __int16 v15 = _ARLogSession_0();
  dispatch_semaphore_t v16 = v15;
  if (v14)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (objc_class *)objc_opt_class();
      NSStringFromClass(v17);
      id v18 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = ARSessionRunOptionsToString(options);
      *(_DWORD *)buf = 138544130;
      id v36 = v18;
      __int16 v37 = 2048;
      uint64_t v38 = self;
      __int16 v39 = 2114;
      id v40 = v8;
      __int16 v41 = 2114;
      v42 = v19;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: begin run with configuration\nConfiguration: %{public}@\nOptions: %{public}@", buf, 0x2Au);
    }
    uint64_t v20 = (void *)MEMORY[0x1BA9C6160]();
    id v33 = 0;
    uint64_t v21 = +[ARSession _applySessionOverrides:v8 outError:&v33];
    id v22 = v33;

    if (v21)
    {
      [(ARSessionMetrics *)self->_metrics sessionStarted:self withConfiguration:v21];
      stateQueue = self->_stateQueue;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __42__ARSession_runWithConfiguration_options___block_invoke;
      v29[3] = &unk_1E61871C0;
      id v8 = v21;
      id v30 = v8;
      uint64_t v31 = self;
      ARSessionRunOptions v32 = options;
      dispatch_async(stateQueue, v29);
    }
    else
    {
      long long v26 = _ARLogSession_0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        long long v27 = (objc_class *)objc_opt_class();
        long long v28 = NSStringFromClass(v27);
        *(_DWORD *)buf = 138543874;
        id v36 = v28;
        __int16 v37 = 2048;
        uint64_t v38 = self;
        __int16 v39 = 2112;
        id v40 = v22;
        _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to apply overrides to configuration. Error: %@", buf, 0x20u);
      }
      [(ARSession *)self _sessionDidFailWithError:v22];
      kdebug_trace();
      id v8 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v24 = (objc_class *)objc_opt_class();
      long long v25 = NSStringFromClass(v24);
      *(_DWORD *)buf = 138543874;
      id v36 = v25;
      __int16 v37 = 2048;
      uint64_t v38 = self;
      __int16 v39 = 2112;
      id v40 = v8;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to run the session, configuration is not supported on this device: %@", buf, 0x20u);
    }
    ARErrorWithCodeAndUserInfo(100, 0);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
    [(ARSession *)self _sessionDidFailWithError:v22];
    kdebug_trace();
  }

  os_activity_scope_leave(&state);
}

void __42__ARSession_runWithConfiguration_options___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) isKindOfConfiguration:objc_opt_class()]) {
    goto LABEL_4;
  }
  if (+[ARGeoTrackingConfiguration verifyLocationPermissions])
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 152), 0xFFFFFFFFFFFFFFFFLL);
    os_activity_t v2 = [*(id *)(*(void *)(a1 + 40) + 144) anchorsToAdd];
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __42__ARSession_runWithConfiguration_options___block_invoke_39;
    v34[3] = &unk_1E6187198;
    v34[4] = *(void *)(a1 + 40);
    [v2 enumerateObjectsUsingBlock:v34];
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 152));

LABEL_4:
    uint64_t v3 = *(void *)(a1 + 48);
    BOOL v4 = [*(id *)(a1 + 40) configurationInternal];
    int v5 = [v4 isEqual:*(void *)(a1 + 32)];

    if (objc_opt_respondsToSelector())
    {
      uint64_t v6 = [*(id *)(a1 + 32) initialWorldMap];
      BOOL v7 = v6 != 0;
    }
    else
    {
      BOOL v7 = 0;
    }
    int v8 = v5 ^ 1;
    if (((v5 ^ 1) & 1) == 0 && !v7 && (v3 & 1) != 0 && [*(id *)(a1 + 40) relocalizing])
    {
      v3 &= ~1uLL;
      [*(id *)(*(void *)(a1 + 40) + 8) clearMap];
    }
    if ([*(id *)(*(void *)(a1 + 40) + 296) finishedReplaying])
    {
      id v9 = *(void **)(*(void *)(a1 + 40) + 296);
      uint64_t v10 = [*(id *)(a1 + 32) replaySensor];
      LOBYTE(v9) = v9 != v10;

      uint64_t v11 = v3 | 3;
      if (v9) {
        v3 |= 3uLL;
      }
    }
    else
    {
      uint64_t v11 = v3 | 3;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        uint64_t v3 = v11;
      }
    }
    id v12 = _ARLogSession_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v13 = (objc_class *)objc_opt_class();
      BOOL v14 = NSStringFromClass(v13);
      uint64_t v16 = *(void *)(a1 + 32);
      uint64_t v15 = *(void *)(a1 + 40);
      id v17 = ARSessionRunOptionsToString(v3);
      *(_DWORD *)buf = 138544130;
      id v36 = v14;
      __int16 v37 = 2048;
      uint64_t v38 = v15;
      __int16 v39 = 2112;
      uint64_t v40 = v16;
      __int16 v41 = 2112;
      v42 = v17;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: running with configuration\nConfiguration: %@\nOptions: %@", buf, 0x2Au);
    }
    BOOL v18 = [*(id *)(a1 + 40) state] == 0;
    uint64_t v20 = *(void *)(a1 + 32);
    uint64_t v19 = *(void **)(a1 + 40);
    if ((v18 | v3 | v8)) {
      [v19 _updateSessionWithConfiguration:v20 options:v3];
    }
    else {
      [v19 _updateSessionStateWithConfiguration:v20 options:v3];
    }
    if ([*(id *)(a1 + 40) state] == 2 && objc_msgSend(*(id *)(a1 + 40), "pausedSensors"))
    {
      uint64_t v21 = _ARLogSession_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        id v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        uint64_t v24 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v36 = v23;
        __int16 v37 = 2048;
        uint64_t v38 = v24;
        long long v25 = "%{public}@ <%p>: deferring run due to paused sensors";
LABEL_31:
        _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_DEFAULT, v25, buf, 0x16u);
      }
    }
    else
    {
      [*(id *)(a1 + 40) setState:1];
      uint64_t v21 = _ARLogSession_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        long long v26 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v26);
        uint64_t v27 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138543618;
        id v36 = v23;
        __int16 v37 = 2048;
        uint64_t v38 = v27;
        long long v25 = "%{public}@ <%p>: running";
        goto LABEL_31;
      }
    }

    kdebug_trace();
    return;
  }
  long long v28 = _ARLogSession_0();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
  {
    long long v29 = (objc_class *)objc_opt_class();
    id v30 = NSStringFromClass(v29);
    uint64_t v31 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v36 = v30;
    __int16 v37 = 2048;
    uint64_t v38 = v31;
    _os_log_impl(&dword_1B88A2000, v28, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Location permissions not sufficient to run geo tracking.", buf, 0x16u);
  }
  ARSessionRunOptions v32 = *(void **)(a1 + 40);
  id v33 = ARErrorWithCodeAndUserInfo(105, 0);
  [v32 _sessionDidFailWithError:v33];
}

void __42__ARSession_runWithConfiguration_options___block_invoke_39(uint64_t a1, void *a2)
{
  id v6 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v4 = v6;
  if (isKindOfClass)
  {
    id v5 = v6;
    if (([v5 isAltitudeAvailable] & 1) == 0) {
      [*(id *)(a1 + 32) _lookupAltitudeForAnchor:v5];
    }

    BOOL v4 = v6;
  }
}

- (void)addAnchor:(ARAnchor *)anchor
{
  BOOL v4 = anchor;
  id v5 = [(ARAnchor *)v4 identifier];
  objc_msgSend(v5, "ar_integerValue");
  kdebug_trace();

  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __23__ARSession_addAnchor___block_invoke;
  v8[3] = &unk_1E6185160;
  id v9 = v4;
  uint64_t v10 = self;
  BOOL v7 = v4;
  dispatch_async(stateQueue, v8);
}

uint64_t __23__ARSession_addAnchor___block_invoke(uint64_t a1)
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = *(id *)(a1 + 32);
    if (([v2 isAltitudeAvailable] & 1) == 0) {
      [*(id *)(a1 + 40) _lookupAltitudeForAnchor:v2];
    }
  }
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 136), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(*(void *)(a1 + 40) + 128) timestamp];
  objc_msgSend(*(id *)(a1 + 32), "setLastUpdateTimestamp:");
  if ([*(id *)(*(void *)(a1 + 40) + 128) referenceOriginTransformAvailable])
  {
    [*(id *)(*(void *)(a1 + 40) + 128) referenceOriginTransform];
    simd_float4x4 v22 = __invert_f4(v21);
    float32x4_t v13 = (float32x4_t)v22.columns[1];
    float32x4_t v14 = (float32x4_t)v22.columns[0];
    float32x4_t v11 = (float32x4_t)v22.columns[3];
    float32x4_t v12 = (float32x4_t)v22.columns[2];
    [*(id *)(a1 + 32) transform];
    uint64_t v3 = 0;
    v15[0] = v4;
    v15[1] = v5;
    v15[2] = v6;
    v15[3] = v7;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    do
    {
      *(long long *)((char *)&v16 + v3 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v14, COERCE_FLOAT(v15[v3])), v13, *(float32x2_t *)&v15[v3], 1), v12, (float32x4_t)v15[v3], 2), v11, (float32x4_t)v15[v3], 3);
      ++v3;
    }
    while (v3 != 4);
    objc_msgSend(*(id *)(a1 + 32), "setReferenceTransform:", *(double *)&v16, *(double *)&v17, *(double *)&v18, *(double *)&v19);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 136));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 152), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(*(void *)(a1 + 40) + 144) addAnchor:*(void *)(a1 + 32)];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 40) + 152));
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = *(void **)(*(void *)(a1 + 40) + 40);
  return [v9 recordAddedAnchor:v8];
}

- (void)removeAnchor:(ARAnchor *)anchor
{
  long long v4 = anchor;
  long long v5 = [(ARAnchor *)v4 identifier];
  objc_msgSend(v5, "ar_integerValue");
  kdebug_trace();

  stateQueue = self->_stateQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__ARSession_removeAnchor___block_invoke;
  v8[3] = &unk_1E6185160;
  void v8[4] = self;
  id v9 = v4;
  long long v7 = v4;
  dispatch_async(stateQueue, v8);
}

uint64_t __26__ARSession_removeAnchor___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 152), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(*(void *)(a1 + 32) + 144) removeAnchor:*(void *)(a1 + 40)];
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 152));
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 40);
  return [v3 recordRemovedAnchor:v2];
}

- (void)setWorldOrigin:(simd_float4x4)relativeTransform
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __28__ARSession_setWorldOrigin___block_invoke;
  v4[3] = &unk_1E61871E8;
  long long v6 = self;
  simd_float4x4 v5 = relativeTransform;
  dispatch_async(stateQueue, v4);
}

intptr_t __28__ARSession_setWorldOrigin___block_invoke(uint64_t a1)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 96) + 152), 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 96) + 136), 0xFFFFFFFFFFFFFFFFLL);
  uint64_t v2 = *(void *)(a1 + 96);
  uint64_t v3 = *(void **)(v2 + 128);
  if (v3)
  {
    [v3 sessionOriginTransform];
    simd_float4x4 v28 = __invert_f4(v27);
    float32x4_t v20 = (float32x4_t)v28.columns[1];
    float32x4_t v21 = (float32x4_t)v28.columns[0];
    float32x4_t v18 = (float32x4_t)v28.columns[3];
    float32x4_t v19 = (float32x4_t)v28.columns[2];
    uint64_t v2 = *(void *)(a1 + 96);
  }
  else
  {
    float32x4_t v20 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 16);
    float32x4_t v21 = *(float32x4_t *)MEMORY[0x1E4F149A0];
    float32x4_t v18 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
    float32x4_t v19 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(v2 + 136));
  uint64_t v4 = 0;
  long long v5 = *(_OWORD *)(a1 + 48);
  long long v6 = *(_OWORD *)(a1 + 64);
  long long v7 = *(_OWORD *)(a1 + 80);
  v22[0] = *(_OWORD *)(a1 + 32);
  v22[1] = v5;
  v22[2] = v6;
  v22[3] = v7;
  memset(buf, 0, sizeof(buf));
  long long v24 = 0u;
  *(_OWORD *)long long v25 = 0u;
  do
  {
    *(float32x4_t *)&buf[v4 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v21, COERCE_FLOAT(v22[v4])), v20, *(float32x2_t *)&v22[v4], 1), v19, (float32x4_t)v22[v4], 2), v18, (float32x4_t)v22[v4], 3);
    ++v4;
  }
  while (v4 != 4);
  objc_msgSend(*(id *)(*(void *)(a1 + 96) + 144), "setSessionTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v24, v25[0]);
  uint64_t v8 = _ARLogSession_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    id v9 = (objc_class *)objc_opt_class();
    uint64_t v10 = NSStringFromClass(v9);
    uint64_t v11 = *(void *)(a1 + 96);
    [*(id *)(v11 + 144) sessionTransform];
    long long v16 = ARMatrix4x4Description(0, v12, v13, v14, v15);
    *(_DWORD *)buf = 138543874;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    *(void *)&buf[24] = v16;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: world origin updated %@", buf, 0x20u);
  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 96) + 152));
}

+ (void)forceEnvironmentTexturingTechniqueToManualMode:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    long long v5 = -[AREnvironmentTexturingTechnique initWithOptions:wantsHDREnvironmentTextures:]([AREnvironmentTexturingTechnique alloc], "initWithOptions:wantsHDREnvironmentTextures:", 1, [v4 wantsHDREnvironmentTextures]);
    if (([v4 isEqual:v5] & 1) == 0)
    {
      long long v6 = _ARLogSession_0();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        long long v7 = (objc_class *)objc_opt_class();
        uint64_t v8 = NSStringFromClass(v7);
        int v9 = 138543618;
        uint64_t v10 = v8;
        __int16 v11 = 2048;
        id v12 = a1;
        _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Forcing environment texturing technique to manual mode", (uint8_t *)&v9, 0x16u);
      }
      [v4 reconfigureFrom:v5];
    }
  }
}

- (void)forceEnvironmentTexturingToManualMode:(BOOL)a3
{
  stateQueue = self->_stateQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __51__ARSession_forceEnvironmentTexturingToManualMode___block_invoke;
  v4[3] = &unk_1E6187210;
  void v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(stateQueue, v4);
}

uint64_t __51__ARSession_forceEnvironmentTexturingToManualMode___block_invoke(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  int v2 = *(unsigned __int8 *)(result + 40);
  if (*(unsigned __int8 *)(v1 + 32) != v2 && v2 != 0)
  {
    uint64_t v4 = result;
    uint64_t result = +[ARSession forceEnvironmentTexturingTechniqueToManualMode:*(void *)(v1 + 16)];
    LOBYTE(v2) = *(unsigned char *)(v4 + 40);
    uint64_t v1 = *(void *)(v4 + 32);
  }
  *(unsigned char *)(v1 + 32) = v2;
  return result;
}

- (void)getCurrentWorldMapWithCompletionHandler:(void *)completionHandler
{
  id v4 = completionHandler;
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E61852B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(stateQueue, v7);
}

void __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke(uint64_t a1)
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = v2;
  if (v2
    && ([v2 mutableOptions],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v4 slamConfiguration],
        BOOL v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 isEqualToString:@"ObjectDetectionMapBuilding"],
        v5,
        v4,
        !v6))
  {
    __int16 v11 = [*(id *)(a1 + 32) currentFrame];
    kdebug_trace();
    uint64_t v38 = v11;
    if (v11
      && [v3 hasQualityKeyframe]
      && ([v11 gravityAlignedReferenceOriginTransform],
          objc_msgSend(v3, "serializeWorldMapWithReferenceOrigin:"),
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v13 = (void *)v12;
      __n128 v14 = [v3 serializeSurfaceData];
      [v13 setSurfaceData:v14];

      __n128 v15 = [v11 anchors];
      long long v16 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_64_0];
      long long v17 = [v15 filteredArrayUsingPredicate:v16];
      [v13 setAnchors:v17];

      float32x4_t v18 = *(void **)(*(void *)(a1 + 32) + 520);
      uint64_t v19 = [v11 worldMappingStatus];
      float32x4_t v20 = [v13 rawFeaturePoints];
      objc_msgSend(v18, "recordSaveMap:numberOfFeaturePoints:", v19, objc_msgSend(v20, "count"));

      objc_msgSend(v13, "trackingData", 0);
    }
    else
    {
      v45[0] = *MEMORY[0x1E4F28588];
      float32x4_t v21 = ARKitCoreBundle();
      simd_float4x4 v22 = [v21 localizedStringForKey:@"Not enough features have been recorded to create a world map yet." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v46[0] = v22;
      v45[1] = *MEMORY[0x1E4F285A0];
      uint64_t v23 = ARKitCoreBundle();
      long long v24 = [v23 localizedStringForKey:@"Make sure that tracking has initialized and continue to scan the environment." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v46[1] = v24;
      long long v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v46 forKeys:v45 count:2];

      uint64_t v37 = ARErrorWithCodeAndUserInfo(400, v25);

      uint64_t v13 = 0;
      objc_msgSend(0, "trackingData", v37);
    uint64_t v26 = };
    [v26 length];
    simd_float4x4 v27 = [v13 surfaceData];
    [v27 length];
    simd_float4x4 v28 = [v13 rawFeaturePoints];
    [v28 count];
    long long v29 = [v13 anchors];
    [v29 count];
    kdebug_trace();

    id v30 = *(NSObject **)(*(void *)(a1 + 32) + 456);
    uint64_t v31 = v30;
    if (!v30)
    {
      uint64_t v31 = MEMORY[0x1E4F14428];
      id v32 = MEMORY[0x1E4F14428];
    }
    v39[0] = MEMORY[0x1E4F143A8];
    v39[1] = 3221225472;
    v39[2] = __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_4;
    v39[3] = &unk_1E6187238;
    id v33 = *(id *)(a1 + 40);
    id v40 = v13;
    id v41 = v36;
    id v42 = v33;
    id v34 = v36;
    id v35 = v13;
    dispatch_async(v31, v39);
    if (!v30) {

    }
    uint64_t v10 = v38;
  }
  else
  {
    long long v7 = *(NSObject **)(*(void *)(a1 + 32) + 456);
    id v8 = v7;
    if (!v7)
    {
      id v8 = MEMORY[0x1E4F14428];
      id v9 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_2;
    block[3] = &unk_1E6186510;
    id v44 = *(id *)(a1 + 40);
    dispatch_async(v8, block);
    if (!v7) {

    }
    uint64_t v10 = v44;
  }
}

void __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F28588];
  id v2 = ARKitCoreBundle();
  uint64_t v3 = [v2 localizedStringForKey:@"Getting the current world map requires that world tracking is configured." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E4F285A0];
  id v4 = ARKitCoreBundle();
  BOOL v5 = [v4 localizedStringForKey:@"Make sure that an ARWorldTrackingConfiguration is being used." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  v10[1] = v5;
  int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = ARErrorWithCodeAndUserInfo(303, v6);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

uint64_t __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    char v3 = 0;
  }
  else
  {
    objc_opt_class();
    char v3 = objc_opt_isKindOfClass() ^ 1;
  }

  return v3 & 1;
}

uint64_t __53__ARSession_getCurrentWorldMapWithCompletionHandler___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (id)adPipelineParameters
{
  v14[1] = *MEMORY[0x1E4F143B8];
  char v3 = [(ARSession *)self technique];

  if (!v3) {
    goto LABEL_10;
  }
  uint64_t v4 = objc_opt_class();
  BOOL v5 = [(ARSession *)self technique];
  v14[0] = v5;
  int v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:1];
  uint64_t v7 = +[ARTechnique techniqueOfClass:v4 inArray:v6];

  if (!v7)
  {
LABEL_10:
    uint64_t v7 = [(ARSession *)self secondaryTechnique];

    if (v7)
    {
      uint64_t v8 = objc_opt_class();
      id v9 = [(ARSession *)self secondaryTechnique];
      uint64_t v13 = v9;
      uint64_t v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:1];
      uint64_t v7 = +[ARTechnique techniqueOfClass:v8 inArray:v10];
    }
  }
  __int16 v11 = [v7 pipelineParameters];

  return v11;
}

- (void)createReferenceObjectWithTransform:(simd_float4x4)transform center:(simd_float3)center extent:(simd_float3)extent completionHandler:(void *)completionHandler
{
  id v7 = completionHandler;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke;
  block[3] = &unk_1E6187260;
  long long v17 = self;
  id v18 = v7;
  simd_float4x4 v14 = transform;
  simd_float3 v15 = center;
  simd_float3 v16 = extent;
  id v9 = v7;
  dispatch_async(stateQueue, block);
}

void __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke(uint64_t a1)
{
  v34[2] = *MEMORY[0x1E4F143B8];
  id v2 = *(id *)(*(void *)(a1 + 128) + 8);
  char v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 mutableOptions];
    BOOL v5 = [v4 slamConfiguration];
    char v6 = [v5 isEqualToString:@"ObjectDetectionMapBuilding"];

    if (v6)
    {
      id v7 = [*(id *)(a1 + 128) currentFrame];
      kdebug_trace();
      if (v7)
      {
        [v7 gravityAlignedReferenceOriginTransform];
        uint64_t v8 = objc_msgSend(v3, "serializeWorldMapWithReferenceOrigin:");
        id v9 = v8;
        if (v8)
        {
          uint64_t v10 = objc_msgSend(v8, "extractReferenceObjectWithTransform:center:extent:error:", 0, *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80), *(double *)(a1 + 96), *(double *)(a1 + 112));
          if (v10)
          {
            __int16 v11 = (void *)v10;
            uint64_t v12 = 0;
LABEL_14:
            kdebug_trace();
            float32x4_t v21 = *(NSObject **)(*(void *)(a1 + 128) + 456);
            simd_float4x4 v22 = v21;
            if (!v21)
            {
              simd_float4x4 v22 = MEMORY[0x1E4F14428];
              id v23 = MEMORY[0x1E4F14428];
            }
            v27[0] = MEMORY[0x1E4F143A8];
            v27[1] = 3221225472;
            v27[2] = __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_3;
            v27[3] = &unk_1E6187238;
            id v24 = *(id *)(a1 + 136);
            id v29 = v12;
            id v30 = v24;
            id v28 = v11;
            id v25 = v12;
            id v26 = v11;
            dispatch_async(v22, v27);
            if (!v21) {

            }
            goto LABEL_19;
          }
        }
      }
      else
      {
        id v9 = 0;
      }
      v33[0] = *MEMORY[0x1E4F28588];
      simd_float3 v16 = ARKitCoreBundle();
      long long v17 = [v16 localizedStringForKey:@"Not enough features have been recorded to create a reference object at this position." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
      v34[0] = v17;
      v33[1] = *MEMORY[0x1E4F285A0];
      id v18 = ARKitCoreBundle();
      uint64_t v19 = [v18 localizedStringForKey:@"Make sure the bounds of the object are correct, or scan the object further and try again.", &stru_1F120C8F0, @"Localizable_iOS" value table];
      v34[1] = v19;
      float32x4_t v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:v33 count:2];

      uint64_t v12 = ARErrorWithCodeAndUserInfo(400, v20);

      __int16 v11 = 0;
      goto LABEL_14;
    }
  }
  uint64_t v13 = *(NSObject **)(*(void *)(a1 + 128) + 456);
  simd_float4x4 v14 = v13;
  if (!v13)
  {
    simd_float4x4 v14 = MEMORY[0x1E4F14428];
    id v15 = MEMORY[0x1E4F14428];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_2;
  block[3] = &unk_1E6186510;
  id v32 = *(id *)(a1 + 136);
  dispatch_async(v14, block);
  if (!v13) {

  }
  id v7 = v32;
LABEL_19:
}

void __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_2(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  v9[0] = *MEMORY[0x1E4F28588];
  id v2 = ARKitCoreBundle();
  char v3 = [v2 localizedStringForKey:@"Creating a reference object requires that object scanning is configured." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  v10[0] = v3;
  v9[1] = *MEMORY[0x1E4F285A0];
  uint64_t v4 = ARKitCoreBundle();
  BOOL v5 = [v4 localizedStringForKey:@"Make sure that an ARObjectScanningConfiguration is being used." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  v10[1] = v5;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = ARErrorWithCodeAndUserInfo(303, v6);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

uint64_t __80__ARSession_createReferenceObjectWithTransform_center_extent_completionHandler___block_invoke_3(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_pauseWaitingForOutstandingCallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  resultRequestScheduler = self->_resultRequestScheduler;
  self->_resultRequestScheduler = 0;

  secondaryResultRequestScheduler = self->_secondaryResultRequestScheduler;
  self->_secondaryResultRequestScheduler = 0;

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_pendingHiResFrameCaptureCompletionBlock)
  {
    self->_isHiResFrameCaptureInProgress = 0;
    id v7 = (id)MEMORY[0x1BA9C63E0]();
    id pendingHiResFrameCaptureCompletionBlock = self->_pendingHiResFrameCaptureCompletionBlock;
    self->_id pendingHiResFrameCaptureCompletionBlock = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    if (v7)
    {
      id v9 = [(ARSession *)self delegateQueue];
      uint64_t v10 = v9;
      if (!v9)
      {
        uint64_t v10 = MEMORY[0x1E4F14428];
        id v11 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __50__ARSession__pauseWaitingForOutstandingCallbacks___block_invoke;
      block[3] = &unk_1E6186510;
      id v7 = v7;
      id v13 = v7;
      dispatch_async(v10, block);
      if (!v9) {
    }
      }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    id v7 = 0;
  }
  [(ARSessionMetrics *)self->_metrics sessionStopped];
  [(ARSession *)self _stopAllSensorsWaitingForOutstandingCallbacks:v3];
}

void __50__ARSession__pauseWaitingForOutstandingCallbacks___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v2 = NSString;
  BOOL v3 = ARKitCoreBundle();
  uint64_t v4 = [v3 localizedStringForKey:@"Could not complete high-resolution frame capturing because the session was paused." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  BOOL v5 = [v2 stringWithFormat:v4];

  uint64_t v9 = *MEMORY[0x1E4F28588];
  v10[0] = v5;
  char v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = ARErrorWithCodeAndUserInfo(107, v6);
  (*(void (**)(uint64_t, void, void *))(v7 + 16))(v7, 0, v8);
}

- (BOOL)_shouldUpdateLocationSensorForFusion
{
  return self->_vioFusionEnabled;
}

- (void)setState:(unint64_t)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_os_activity_scope_state_s state = a3;
    kdebug_trace();
    if ([(ARSession *)self _shouldUpdateLocationSensorForFusion]) {
      [(ARRemoteLocationSensor *)self->_locationSensor updateARSessionState:a3];
    }
    BOOL v5 = [(ARSession *)self _getObservers];
    kdebug_trace();
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = *(void **)(*((void *)&v12 + 1) + 8 * v10);
          if (objc_opt_respondsToSelector()) {
            objc_msgSend(v11, "session:didChangeState:", self, self->_state, (void)v12);
          }
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    kdebug_trace();
  }
}

- (__n128)originTransform
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 136), 0xFFFFFFFFFFFFFFFFLL);
  [*(id *)(a1 + 128) sessionOriginTransform];
  unsigned long long v4 = (unsigned __int128)__invert_f4(v5);
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 136));
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 152), 0xFFFFFFFFFFFFFFFFLL);
  if ([*(id *)(a1 + 144) sessionTransformUpdated])
  {
    [*(id *)(a1 + 144) sessionTransform];
    unsigned long long v4 = v2;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 152));
  return (__n128)v4;
}

- (void)setOriginTransform:(__n128)a3
{
  simd_float4x4 v5 = *(NSObject **)(a1 + 160);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __32__ARSession_setOriginTransform___block_invoke;
  v6[3] = &unk_1E61871E8;
  uint64_t v11 = a1;
  __n128 v7 = a2;
  __n128 v8 = a3;
  __n128 v9 = a4;
  __n128 v10 = a5;
  dispatch_async(v5, v6);
}

intptr_t __32__ARSession_setOriginTransform___block_invoke(uint64_t a1)
{
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 96) + 152), 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(*(id *)(*(void *)(a1 + 96) + 144), "setSessionTransform:", *(double *)(a1 + 32), *(double *)(a1 + 48), *(double *)(a1 + 64), *(double *)(a1 + 80));
  unsigned long long v2 = *(NSObject **)(*(void *)(a1 + 96) + 152);
  return dispatch_semaphore_signal(v2);
}

- (__n128)predictedDeviceTransformAtTimestamp:(uint64_t)a1
{
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  unsigned long long v4 = _os_activity_create(&dword_1B88A2000, "Predicted device transform", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v4, &state);

  kdebug_trace();
  simd_float4x4 v5 = [(id)a1 technique];
  if (v5
    && ([(id)a1 configurationInternal],
        id v6 = objc_claimAutoreleasedReturnValue(),
        uint64_t v7 = [v6 worldAlignment],
        v6,
        v7 != 2))
  {
    __n128 v8 = objc_opt_new();
    __n128 v9 = [(id)a1 configurationInternal];
    __n128 v10 = [v9 videoFormat];
    objc_msgSend(v8, "setCameraPosition:", objc_msgSend(v10, "captureDevicePosition"));

    uint64_t v11 = [v5 predictedResultDataAtTimestamp:v8 context:a2];
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 136), 0xFFFFFFFFFFFFFFFFLL);
    [(id)a1 _cameraTransformForResultData:v11 previousFrame:*(void *)(a1 + 128)];
    float32x4_t v25 = v13;
    float32x4_t v26 = v12;
    float32x4_t v23 = v15;
    float32x4_t v24 = v14;
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 136));
    __n128 v16 = ARDisplayCenterTransformForCaptureDevicePosition([v8 cameraPosition]);
    simd_float4 v29 = v17;
    simd_float4 v31 = (simd_float4)v16;
    simd_float4 v27 = v19;
    simd_float4 v28 = v18;
    kdebug_trace();
    v41.columns[1] = v29;
    v41.columns[0] = v31;
    v41.columns[3] = v27;
    v41.columns[2] = v28;
    simd_float4x4 v42 = __invert_f4(v41);
    unint64_t v20 = 0;
    simd_float4 v33 = v31;
    simd_float4 v34 = v29;
    simd_float4 v35 = v28;
    simd_float4 v36 = v27;
    simd_float4 v37 = 0u;
    simd_float4 v38 = 0u;
    simd_float4 v39 = 0u;
    simd_float4 v40 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v37 + v20) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v26, COERCE_FLOAT(*(_OWORD *)((char *)&v33 + v20))), v25, *(float32x2_t *)&v33.f32[v20 / 4], 1), v24, *(float32x4_t *)((char *)&v33 + v20), 2), v23, *(float32x4_t *)((char *)&v33 + v20), 3);
      v20 += 16;
    }
    while (v20 != 64);
    unint64_t v21 = 0;
    simd_float4 v33 = v37;
    simd_float4 v34 = v38;
    simd_float4 v35 = v39;
    simd_float4 v36 = v40;
    simd_float4 v37 = 0u;
    simd_float4 v38 = 0u;
    simd_float4 v39 = 0u;
    simd_float4 v40 = 0u;
    do
    {
      *(float32x4_t *)((char *)&v37 + v21) = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32((float32x4_t)v42.columns[0], COERCE_FLOAT(*(_OWORD *)((char *)&v33 + v21))), (float32x4_t)v42.columns[1], *(float32x2_t *)&v33.f32[v21 / 4], 1), (float32x4_t)v42.columns[2], *(float32x4_t *)((char *)&v33 + v21), 2), (float32x4_t)v42.columns[3], *(float32x4_t *)((char *)&v33 + v21), 3);
      v21 += 16;
    }
    while (v21 != 64);
    simd_float4 v30 = v37;
  }
  else
  {
    simd_float4 v30 = *(simd_float4 *)MEMORY[0x1E4F149A0];
  }

  os_activity_scope_leave(&state);
  return (__n128)v30;
}

- (void)_interruptSession
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if ([(ARSession *)self state] == 1)
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    BOOL v3 = _os_activity_create(&dword_1B88A2000, "Session was interrupted", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v8);

    unsigned long long v4 = _ARLogSession_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      simd_float4x4 v5 = (objc_class *)objc_opt_class();
      NSStringFromClass(v5);
      id v6 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v7 = ARSensorDataTypesToString([(ARSession *)self pausedSensors]);
      *(_DWORD *)buf = 138543874;
      id v10 = v6;
      __int16 v11 = 2048;
      float32x4_t v12 = self;
      __int16 v13 = 2112;
      float32x4_t v14 = v7;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_INFO, "%{public}@ <%p>: was interrupted: paused sensor type(s) %@", buf, 0x20u);
    }
    [(ARSession *)self _stopSensorsWithDataTypes:[(ARSession *)self runningSensors] keepingDataTypes:[(ARSession *)self pausedSensors]];
    [(ARSession *)self setState:2];
    os_activity_scope_leave(&v8);
  }
}

- (void)_endInterruption
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([(ARSession *)self state] == 2)
  {
    v8.opaque[0] = 0;
    v8.opaque[1] = 0;
    BOOL v3 = _os_activity_create(&dword_1B88A2000, "Session interruption ended", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v3, &v8);

    unsigned long long v4 = _ARLogSession_0();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      simd_float4x4 v5 = (objc_class *)objc_opt_class();
      id v6 = NSStringFromClass(v5);
      *(_DWORD *)buf = 138543618;
      id v10 = v6;
      __int16 v11 = 2048;
      float32x4_t v12 = self;
      _os_log_impl(&dword_1B88A2000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: interruption ended", buf, 0x16u);
    }
    uint64_t v7 = [(ARSession *)self configurationInternal];
    [(ARSession *)self _updateSessionWithConfiguration:v7 options:0];

    [(ARSession *)self setState:1];
    os_activity_scope_leave(&v8);
  }
}

- (void)_changePowerUsage:(unint64_t)a3
{
}

- (BOOL)_shouldSkipAnchorCreationForData:(id)a3
{
  return 0;
}

- (id)stateQueue
{
  return self->_stateQueue;
}

- (id)_prepareTechniquesQueue
{
  return self->_prepareTechniquesQueue;
}

- (id)_frameContextByConsumingPendingChanges
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  BOOL v3 = [(ARFrameContextHandler *)self->_frameContextHandler createdContextByConsumingPendingChanges];
  unsigned long long v4 = [(ARSession *)self configurationInternal];
  objc_msgSend(v3, "setWorldAlignment:", objc_msgSend(v4, "worldAlignment"));

  simd_float4x4 v5 = [(ARSession *)self configurationInternal];
  objc_msgSend(v3, "setFrameDebugOptions:", objc_msgSend(v5, "frameDebugOptions"));

  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique)
  {
    uint64_t v7 = [(ARWorldTrackingTechnique *)worldTrackingTechnique mutableOptions];
    os_activity_scope_state_s v8 = [v7 initialWorldMap];
    [v3 setWorldMap:v8];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  return v3;
}

+ (BOOL)_supportsConfiguration:(id)a3
{
  id v3 = a3;
  unsigned long long v4 = [v3 deviceModel];
  if (v4)
  {
  }
  else if (([(id)objc_opt_class() isSupported] & 1) == 0)
  {
    BOOL v6 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if ([v3 userFaceTrackingEnabled])
    {
      BOOL v5 = +[ARWorldTrackingConfiguration supportsUserFaceTracking];
LABEL_10:
      BOOL v6 = v5;
      goto LABEL_13;
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 isWorldTrackingEnabled])
    {
      BOOL v5 = +[ARFaceTrackingConfiguration supportsWorldTracking];
      goto LABEL_10;
    }
  }
  BOOL v6 = 1;
LABEL_13:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v3;
    os_activity_scope_state_s v8 = v7;
    if (v6)
    {
      BOOL v6 = 1;
    }
    else if ([v7 supportEnablementOptions])
    {
      BOOL v6 = +[ARGeoTrackingConfiguration isSupportedWithOptions:](ARGeoTrackingConfiguration, "isSupportedWithOptions:", [v8 supportEnablementOptions]);
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (NSString)description
{
  id v3 = (void *)MEMORY[0x1E4F28E78];
  unsigned long long v4 = (objc_class *)objc_opt_class();
  BOOL v5 = NSStringFromClass(v4);
  BOOL v6 = [v3 stringWithFormat:@"<%@: %p", v5, self];

  dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_msgSend(v6, "appendFormat:", @" currentFrame=%p", self->_lastProcessedFrame);
  [(ARFrame *)self->_lastProcessedFrame timestamp];
  objc_msgSend(v6, "appendFormat:", @" timestamp=%f", v7);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
  os_activity_scope_state_s v8 = [(ARSession *)self configurationInternal];
  [v6 appendFormat:@" configuration=%@", v8];

  [v6 appendString:@">"];
  return (NSString *)v6;
}

- (id)_fullDescription
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)MEMORY[0x1E4F28E78];
  unsigned long long v4 = [(ARSession *)self description];
  BOOL v5 = [v3 stringWithFormat:@"%@\n", v4];

  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0))
  {
    BOOL v6 = @"Busy";
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
    BOOL v6 = @"NotBusy";
  }
  [v5 appendFormat:@"nextFrameContextHandler: %@\n", v6];
  if (dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0))
  {
    uint64_t v7 = @"Busy";
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
    uint64_t v7 = @"NotBusy";
  }
  [v5 appendFormat:@"lastProcessedFrame: %@\n", v7];
  if (self->_relocalizationRequested) {
    os_activity_scope_state_s v8 = @"YES";
  }
  else {
    os_activity_scope_state_s v8 = @"NO";
  }
  [v5 appendFormat:@"RelocalizationRequested: %@\n", v8];
  [v5 appendFormat:@"RelocalizationTimeoutDate: %@\n", self->_relocalizationTimeoutDate];
  __n128 v9 = [(ARSession *)self technique];
  id v10 = [v9 _fullDescription];
  [v5 appendFormat:@"Technique:\n%@\n", v10];

  __int16 v11 = [(ARSession *)self secondaryTechnique];
  float32x4_t v12 = [v11 _fullDescription];
  [v5 appendFormat:@"Secondary Technique: \n%@\n", v12];

  [v5 appendFormat:@"Sensors:\n"];
  if ([(NSArray *)self->_availableSensors count])
  {
    NSUInteger v13 = 0;
    do
    {
      NSUInteger v14 = v13 + 1;
      uint64_t v15 = -[NSArray objectAtIndexedSubscript:](self->_availableSensors, "objectAtIndexedSubscript:");
      __n128 v16 = [v15 description];
      simd_float4 v17 = [v16 stringByReplacingOccurrencesOfString:@"\n" withString:@"\n\t\t"];
      [v5 appendFormat:@"\t%lu: %@\n", v14, v17];

      NSUInteger v18 = [(NSArray *)self->_availableSensors count];
      NSUInteger v13 = v14;
    }
    while (v14 < v18);
  }
  p_weakPixelBuffersLock = &self->_weakPixelBuffersLock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(v5, "appendFormat:", @"Alive Pixel Buffers: %ld\n", -[NSPointerArray count](self->_weakPixelBuffers, "count"));
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  unint64_t v20 = self->_weakPixelBuffers;
  uint64_t v21 = [(NSPointerArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        float32x4_t v25 = (__CFString *)CFCopyDescription(*(CFTypeRef *)(*((void *)&v27 + 1) + 8 * i));
        [v5 appendFormat:@"\t| - %@\n", v25];
      }
      uint64_t v22 = [(NSPointerArray *)v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  os_unfair_lock_unlock(p_weakPixelBuffersLock);
  return v5;
}

+ (id)_fullDescription
{
  unsigned long long v2 = +[ARSession _runningSessions];
  if ((unint64_t)[v2 count] < 2)
  {
    unsigned long long v4 = [v2 firstObject];
    id v3 = [v4 _fullDescription];
  }
  else
  {
    id v3 = [v2 description];
  }

  return v3;
}

- (NSArray)raycast:(ARRaycastQuery *)query
{
  unsigned long long v4 = query;
  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique)
  {
    if (self->_tracer)
    {
      [(ARQATracer *)self->_tracer traceRaycastQuery:v4];
      worldTrackingTechnique = self->_worldTrackingTechnique;
    }
    BOOL v6 = [(ARWorldTrackingTechnique *)worldTrackingTechnique raycast:v4];
    uint64_t v7 = [(ARSession *)self annotateAnchorToRaycastResults:v6];

    tracer = self->_tracer;
    if (tracer) {
      [(ARQATracer *)tracer traceRaycastResults:v7];
    }
    [(ARSessionMetrics *)self->_metrics recordRaycast:v4 tracked:0];
  }
  else
  {
    uint64_t v7 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v7;
}

- (ARTrackedRaycast)trackedRaycast:(ARRaycastQuery *)query updateHandler:(void *)updateHandler
{
  metrics = self->_metrics;
  uint64_t v7 = updateHandler;
  os_activity_scope_state_s v8 = query;
  [(ARSessionMetrics *)metrics recordRaycast:v8 tracked:1];
  __n128 v9 = [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique trackedRaycast:v8 updateHandler:v7];

  return (ARTrackedRaycast *)v9;
}

- (id)annotateAnchorToRaycastResults:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [MEMORY[0x1E4F1CA48] array];
  BOOL v6 = [(ARSession *)self currentFrame];
  if (v6)
  {
    long long v28 = v5;
    long long v27 = v6;
    uint64_t v7 = [v6 anchors];
    os_activity_scope_state_s v8 = ARDictionaryFromAnchors(v7);

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = v4;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(v9);
          }
          NSUInteger v14 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v15 = [v14 anchorIdentifier];

          if (v15)
          {
            __n128 v16 = [v14 anchorIdentifier];
            simd_float4 v17 = [v8 objectForKeyedSubscript:v16];

            BOOL v18 = v17 != 0;
            if (v17)
            {
              [v14 setAnchor:v17];
              [v17 transform];
              simd_float4x4 v46 = __invert_f4(v45);
              float32x4_t v31 = (float32x4_t)v46.columns[1];
              float32x4_t v32 = (float32x4_t)v46.columns[0];
              float32x4_t v29 = (float32x4_t)v46.columns[3];
              float32x4_t v30 = (float32x4_t)v46.columns[2];
              [v14 worldTransform];
              uint64_t v19 = 0;
              v37[0] = v20;
              v37[1] = v21;
              v37[2] = v22;
              v37[3] = v23;
              long long v38 = 0u;
              long long v39 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              do
              {
                *(long long *)((char *)&v38 + v19 * 16) = (__int128)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v32, COERCE_FLOAT(v37[v19])), v31, *(float32x2_t *)&v37[v19], 1), v30, (float32x4_t)v37[v19], 2), v29, (float32x4_t)v37[v19], 3);
                ++v19;
              }
              while (v19 != 4);
              objc_msgSend(v14, "setLocalTransform:", *(double *)&v38, *(double *)&v39, *(double *)&v40, *(double *)&v41);
            }
          }
          else
          {
            BOOL v18 = 0;
          }
          uint64_t v24 = [v14 target];
          if (v18 || v24 == 2) {
            [v28 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v33 objects:v42 count:16];
      }
      while (v11);
    }

    BOOL v5 = v28;
    id v25 = v28;

    BOOL v6 = v27;
  }
  else
  {
    id v25 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v25;
}

- (void)updateWithCollaborationData:(ARCollaborationData *)collaborationData
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = collaborationData;
  uint64_t v5 = [(ARCollaborationData *)v4 vioSessionID];
  unint64_t v6 = [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique vioSessionIdentifier];
  uint64_t v7 = _ARLogSession_0();
  os_activity_scope_state_s v8 = v7;
  if (v5 == v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      id v9 = (objc_class *)objc_opt_class();
      uint64_t v10 = NSStringFromClass(v9);
      uint64_t v11 = [(ARSession *)self identifier];
      uint64_t v12 = [v11 UUIDString];
      int v17 = 138543874;
      BOOL v18 = v10;
      __int16 v19 = 2048;
      long long v20 = self;
      __int16 v21 = 2112;
      long long v22 = v12;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Ignoring collaboration data originating from own session with ID: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSUInteger v13 = (objc_class *)objc_opt_class();
      NSUInteger v14 = NSStringFromClass(v13);
      uint64_t v15 = NSStringFromARCollaborationData(v4);
      int v17 = 138543874;
      BOOL v18 = v14;
      __int16 v19 = 2048;
      long long v20 = self;
      __int16 v21 = 2112;
      long long v22 = v15;
      _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: updateWithCollaborationData: %@", (uint8_t *)&v17, 0x20u);
    }
    [(ARCollaborationData *)v4 timestamp];
    [(ARCollaborationData *)v4 vioDataType];
    __n128 v16 = [(ARCollaborationData *)v4 vioData];
    [v16 length];
    [(ARCollaborationData *)v4 vioSessionID];
    kdebug_trace();

    [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique pushCollaborationData:v4];
    [(ARCollaborationData *)v4 timestamp];
    [(ARCollaborationData *)v4 vioSessionID];
    kdebug_trace();
    [(ARRecordingTechniquePublic *)self->_recordingTechnique recordCollaborationData:v4 localSession:0];
  }
}

- (id)_getGeoAnchorAltitude:(id)a3
{
  p_geoAnchorToAltitudeLock = &self->_geoAnchorToAltitudeLock;
  id v5 = a3;
  os_unfair_lock_lock(p_geoAnchorToAltitudeLock);
  unint64_t v6 = [(ARSession *)self geoAnchorToAltitude];
  uint64_t v7 = [v6 objectForKey:v5];

  os_unfair_lock_unlock(p_geoAnchorToAltitudeLock);
  return v7;
}

- (void)_setGeoAnchorAltitude:(id)a3 pair:(id)a4
{
  p_geoAnchorToAltitudeLock = &self->_geoAnchorToAltitudeLock;
  id v7 = a4;
  id v8 = a3;
  os_unfair_lock_lock(p_geoAnchorToAltitudeLock);
  id v9 = [(ARSession *)self geoAnchorToAltitude];
  [v9 setObject:v7 forKey:v8];

  os_unfair_lock_unlock(p_geoAnchorToAltitudeLock);
}

- (void)_removeGeoAnchorAltitude:(id)a3
{
  p_geoAnchorToAltitudeLock = &self->_geoAnchorToAltitudeLock;
  id v5 = a3;
  os_unfair_lock_lock(p_geoAnchorToAltitudeLock);
  unint64_t v6 = [(ARSession *)self geoAnchorToAltitude];
  [v6 removeObjectForKey:v5];

  os_unfair_lock_unlock(p_geoAnchorToAltitudeLock);
}

- (void)getGeoLocationForPoint:(simd_float3)position completionHandler:(void *)completionHandler
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v5 = completionHandler;
  unint64_t v6 = [(ARSession *)self geoTrackingTechnique];
  id v7 = v6;
  if (v6)
  {
    id v37 = 0;
    [v6 getLocationFromWorldPosition:&v37 error:*(double *)position.i64];
    id v8 = v37;
    if (v8)
    {
      delegateQueue = self->_delegateQueue;
      uint64_t v10 = delegateQueue;
      if (!delegateQueue)
      {
        uint64_t v10 = MEMORY[0x1E4F14428];
        id v11 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_2;
      block[3] = &unk_1E6187288;
      id v34 = v5;
      id v33 = v8;
      dispatch_async(v10, block);
      if (!delegateQueue) {

      }
      uint64_t v12 = v34;
    }
    else
    {
      long long v25 = v36;
      long long v26 = v35;
      __int16 v19 = _ARLogSession_0();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
      {
        long long v20 = (objc_class *)objc_opt_class();
        __int16 v21 = NSStringFromClass(v20);
        *(_DWORD *)buf = 138545155;
        long long v41 = v21;
        __int16 v42 = 2048;
        uint64_t v43 = self;
        __int16 v44 = 2049;
        double v45 = position.f32[0];
        __int16 v46 = 2049;
        double v47 = position.f32[1];
        __int16 v48 = 2049;
        double v49 = position.f32[2];
        __int16 v50 = 2049;
        uint64_t v51 = v26;
        __int16 v52 = 2049;
        uint64_t v53 = *((void *)&v26 + 1);
        __int16 v54 = 2049;
        uint64_t v55 = v25;
        _os_log_impl(&dword_1B88A2000, v19, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Converted to geo location point: %{private}f, %{private}f, %{private}f -> %{private}f, %{private}f, %{private}f", buf, 0x52u);
      }
      long long v22 = self->_delegateQueue;
      uint64_t v23 = v22;
      if (!v22)
      {
        uint64_t v23 = MEMORY[0x1E4F14428];
        id v24 = MEMORY[0x1E4F14428];
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_174;
      v28[3] = &unk_1E61872B0;
      id v31 = v5;
      long long v29 = v26;
      long long v30 = v25;
      dispatch_async(v23, v28);
      if (!v22) {

      }
      uint64_t v12 = v31;
    }
  }
  else
  {
    NSUInteger v13 = _ARLogSession_0();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      NSUInteger v14 = (objc_class *)objc_opt_class();
      uint64_t v15 = NSStringFromClass(v14);
      *(_DWORD *)buf = 138543618;
      long long v41 = v15;
      __int16 v42 = 2048;
      uint64_t v43 = self;
      _os_log_impl(&dword_1B88A2000, v13, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: ARGeoTrackingConfiguration is not running. Cannot call getGeoLocationForPoint.", buf, 0x16u);
    }
    __n128 v16 = self->_delegateQueue;
    int v17 = v16;
    if (!v16)
    {
      int v17 = MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
    }
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke;
    v38[3] = &unk_1E6186510;
    id v39 = v5;
    dispatch_async(v17, v38);
    if (!v16) {

    }
    id v8 = v39;
  }
}

void __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  uint64_t v6 = *MEMORY[0x1E4F28588];
  unsigned long long v2 = ARKitCoreBundle();
  id v3 = [v2 localizedStringForKey:@"Unable to call method as ARGeoTrackingConfiguration is not running." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
  v7[0] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
  id v5 = ARErrorWithCodeAndUserInfo(501, v4);

  (*(void (**)(double, double, double))(*(void *)(a1 + 32) + 16))(*MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8), 0.0);
}

uint64_t __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, double, double, double))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *MEMORY[0x1E4F1E750], *(double *)(MEMORY[0x1E4F1E750] + 8), 0.0);
}

uint64_t __54__ARSession_getGeoLocationForPoint_completionHandler___block_invoke_174(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 64);
  CLLocationCoordinate2D v5 = CLLocationCoordinate2DMake(*(CLLocationDegrees *)(a1 + 32), *(CLLocationDegrees *)(a1 + 40));
  v4.n128_f64[0] = v5.longitude;
  v3.n128_f64[0] = v5.latitude;
  uint64_t v6 = *(uint64_t (**)(uint64_t, void, __n128, __n128, __n128))(v2 + 16);
  v7.n128_u64[0] = *(void *)(a1 + 48);
  return v6(v2, 0, v3, v4, v7);
}

- (BOOL)querySceneReconstructionOccupancyWithPoints:(id)a3 callback:(id)a4
{
  id v6 = a4;
  __n128 v7 = v6;
  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __66__ARSession_querySceneReconstructionOccupancyWithPoints_callback___block_invoke;
    v11[3] = &unk_1E61872D8;
    id v12 = v6;
    BOOL v9 = [(ARWorldTrackingTechnique *)worldTrackingTechnique querySceneReconstructionOccupancyWithPoints:a3 callback:v11];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

void __66__ARSession_querySceneReconstructionOccupancyWithPoints_callback___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    uint64_t Width = CV3DReconOccupancyQueryResultGetWidth();
    a2 = [MEMORY[0x1E4F1C9B8] dataWithBytes:CV3DReconOccupancyQueryResultGetRawPtr() length:Width];
  }
  id v4 = (id)a2;
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  CV3DReconOccupancyQueryResultRelease();
}

- (void)_removeObserver:(id)a3
{
  observersSemaphore = self->_observersSemaphore;
  id v5 = a3;
  dispatch_semaphore_wait(observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(NSHashTable *)self->_observers removeObject:v5];

  id v6 = self->_observersSemaphore;
  dispatch_semaphore_signal(v6);
}

- (id)_getObservers
{
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_observersSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  __n128 v3 = [(NSHashTable *)self->_observers allObjects];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_observersSemaphore);
  return v3;
}

- (void)_setPrimaryTechnique:(id)a3
{
}

- (void)_setPrimaryTechnique:(id)a3 secondaryTechnique:(id)a4
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  id v6 = (ARRenderSyncScheduler *)a3;
  __n128 v7 = (ARRenderSyncScheduler *)a4;
  id v8 = [MEMORY[0x1E4F1CA48] array];
  BOOL v9 = [(ARSession *)self technique];
  uint64_t v10 = [(ARSession *)self secondaryTechnique];
  if (v9 != v6)
  {
    id v11 = _ARLogSession_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = (objc_class *)objc_opt_class();
      NSUInteger v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138544130;
      v77 = v13;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 2048;
      __int16 v81 = v9;
      __int16 v82 = 2048;
      __int16 v83 = v6;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing session primary technique %p with %p", buf, 0x2Au);
    }
    [(ARRenderSyncScheduler *)v9 setDelegate:0];
    resultRequestScheduler = self->_resultRequestScheduler;
    if (!resultRequestScheduler)
    {
      uint64_t v15 = [[ARRenderSyncScheduler alloc] initWithExpectedFramesPerSecond:60];
      __n128 v16 = self->_resultRequestScheduler;
      self->_resultRequestScheduler = v15;

      int v17 = _ARLogSession_0();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = (objc_class *)objc_opt_class();
        __int16 v19 = NSStringFromClass(v18);
        long long v20 = self->_resultRequestScheduler;
        *(_DWORD *)buf = 138543874;
        v77 = v19;
        __int16 v78 = 2048;
        v79 = self;
        __int16 v80 = 2048;
        __int16 v81 = v20;
        _os_log_impl(&dword_1B88A2000, v17, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating primary renderSyncScheduler <%p>", buf, 0x20u);
      }
      resultRequestScheduler = self->_resultRequestScheduler;
    }
    [(ARSession *)self setupResultRequestSyncScheduler:resultRequestScheduler forTechnique:v6];
    __int16 v21 = _ARLogSession_0();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      long long v22 = (objc_class *)objc_opt_class();
      uint64_t v23 = NSStringFromClass(v22);
      [(ARRenderSyncScheduler *)self->_resultRequestScheduler inputJitterBufferInterval];
      long long v25 = v24;
      [(ARRenderSyncScheduler *)self->_resultRequestScheduler vsyncOffset];
      *(_DWORD *)buf = 138544130;
      v77 = v23;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 2048;
      __int16 v81 = v25;
      __int16 v82 = 2048;
      __int16 v83 = v26;
      _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Primary render sync scheduler jitter buffer interval: %f, vsync offset: %f", buf, 0x2Au);
    }
    long long v27 = _ARLogSession_0();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      long long v28 = (objc_class *)objc_opt_class();
      long long v29 = NSStringFromClass(v28);
      [(ARRenderSyncScheduler *)v6 bonusLatency];
      *(_DWORD *)buf = 138543874;
      v77 = v29;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 2048;
      __int16 v81 = v30;
      _os_log_impl(&dword_1B88A2000, v27, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Primary technique bonus latency %f", buf, 0x20u);
    }
  }
  [v8 addObject:v6];
  if (v10 != v7)
  {
    id v31 = _ARLogSession_0();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      float32x4_t v32 = (objc_class *)objc_opt_class();
      id v33 = NSStringFromClass(v32);
      *(_DWORD *)buf = 138544130;
      v77 = v33;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 2048;
      __int16 v81 = v10;
      __int16 v82 = 2048;
      __int16 v83 = v7;
      _os_log_impl(&dword_1B88A2000, v31, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing session secondary technique %p with %p", buf, 0x2Au);
    }
    [(ARRenderSyncScheduler *)v10 setDelegate:0];
    secondaryResultRequestScheduler = self->_secondaryResultRequestScheduler;
    if (!secondaryResultRequestScheduler)
    {
      long long v35 = [[ARRenderSyncScheduler alloc] initWithExpectedFramesPerSecond:60];
      long long v36 = self->_secondaryResultRequestScheduler;
      self->_secondaryResultRequestScheduler = v35;

      id v37 = _ARLogSession_0();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        long long v38 = (objc_class *)objc_opt_class();
        id v39 = NSStringFromClass(v38);
        long long v40 = self->_secondaryResultRequestScheduler;
        *(_DWORD *)buf = 138543874;
        v77 = v39;
        __int16 v78 = 2048;
        v79 = self;
        __int16 v80 = 2048;
        __int16 v81 = v40;
        _os_log_impl(&dword_1B88A2000, v37, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating secondary renderSyncScheduler <%p>", buf, 0x20u);
      }
      secondaryResultRequestScheduler = self->_secondaryResultRequestScheduler;
    }
    [(ARSession *)self setupResultRequestSyncScheduler:secondaryResultRequestScheduler forTechnique:v7];
    long long v41 = _ARLogSession_0();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      __int16 v42 = (objc_class *)objc_opt_class();
      uint64_t v43 = NSStringFromClass(v42);
      [(ARRenderSyncScheduler *)self->_secondaryResultRequestScheduler inputJitterBufferInterval];
      double v45 = v44;
      [(ARRenderSyncScheduler *)self->_secondaryResultRequestScheduler vsyncOffset];
      *(_DWORD *)buf = 138544130;
      v77 = v43;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 2048;
      __int16 v81 = v45;
      __int16 v82 = 2048;
      __int16 v83 = v46;
      _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Secondary render sync scheduler jitter buffer interval: %f, vsync offset: %f", buf, 0x2Au);
    }
    double v47 = _ARLogSession_0();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      __int16 v48 = (objc_class *)objc_opt_class();
      double v49 = NSStringFromClass(v48);
      [(ARRenderSyncScheduler *)v7 bonusLatency];
      *(_DWORD *)buf = 138543874;
      v77 = v49;
      __int16 v78 = 2048;
      v79 = self;
      __int16 v80 = 2048;
      __int16 v81 = v50;
      _os_log_impl(&dword_1B88A2000, v47, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Secondary technique bonus latency %f", buf, 0x20u);
    }
  }
  if (v7) {
    [v8 addObject:v7];
  }
  [(ARSession *)self setupSessionForTechniques:v8];
  [(ARSession *)self setTechnique:v6];
  [(ARSession *)self setSecondaryTechnique:v7];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  [(ARFrameContextHandler *)self->_frameContextHandler clearInFlightContextsReapplyingChanges];
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  if (ARDeviceSupportsJasper())
  {
    uint64_t v51 = [(ARSession *)self adPipelineParameters];
    __int16 v52 = [v51 aggregationParameters];

    if (v52) {
      [(ARDepthPointCloudCoalescer *)self->_depthPointCloudCoalescer setAggregationParameters:v52];
    }
  }
  if (ARLinkedOnOrAfterAzulC())
  {
    uint64_t v65 = v10;
    v66 = v8;
    id v67 = v7;
    uint64_t v68 = objc_opt_new();
    long long v71 = 0u;
    long long v72 = 0u;
    long long v73 = 0u;
    long long v74 = 0u;
    uint64_t v53 = self;
    __int16 v54 = [(ARSession *)self currentFrame];
    uint64_t v55 = [v54 anchors];

    id obj = v55;
    uint64_t v56 = [v55 countByEnumeratingWithState:&v71 objects:v75 count:16];
    if (v56)
    {
      uint64_t v57 = v56;
      uint64_t v58 = *(void *)v72;
      do
      {
        for (uint64_t i = 0; i != v57; ++i)
        {
          if (*(void *)v72 != v58) {
            objc_enumerationMutation(obj);
          }
          uint64_t v60 = *(void *)(*((void *)&v71 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            v70[0] = MEMORY[0x1E4F143A8];
            v70[1] = 3221225472;
            v70[2] = __53__ARSession__setPrimaryTechnique_secondaryTechnique___block_invoke;
            v70[3] = &unk_1E6187300;
            v70[4] = v60;
            v61 = [MEMORY[0x1E4F28F60] predicateWithBlock:v70];
            uint64_t v62 = [(ARSession *)v53 technique];
            v63 = [v62 techniqueMatchingPredicate:v61];

            if (!v63)
            {
              v64 = [(ARSession *)v53 secondaryTechnique];
              v63 = [v64 techniqueMatchingPredicate:v61];

              if (!v63) {
                [v68 addObject:v60];
              }
            }
          }
        }
        uint64_t v57 = [obj countByEnumeratingWithState:&v71 objects:v75 count:16];
      }
      while (v57);
    }

    if ([v68 count])
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v53->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      [(ARFrameContextHandler *)v53->_frameContextHandler stopTrackingAnchors:v68];
      dispatch_semaphore_signal((dispatch_semaphore_t)v53->_frameContextHandlerSemaphore);
    }

    __n128 v7 = v67;
    id v8 = v66;
    uint64_t v10 = v65;
  }
}

uint64_t __53__ARSession__setPrimaryTechnique_secondaryTechnique___block_invoke()
{
  uint64_t v0 = objc_opt_class();
  uint64_t v1 = objc_opt_class();
  return [v0 producesResultDataForAnchorOfClass:v1];
}

- (void)setupSessionForTechniques:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v39 != v7) {
          objc_enumerationMutation(v4);
        }
        BOOL v9 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        [v9 setDelegate:self];
        objc_msgSend(v9, "setPowerUsage:", -[ARSession powerUsage](self, "powerUsage"));
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v38 objects:v43 count:16];
    }
    while (v6);
  }
  uint64_t v10 = off_1E6184000;
  id v11 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v4];
  id v12 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v4];
  NSUInteger v13 = v12;
  if (v11) {
    [v12 setMotionManager:self->_motionManger];
  }
  p_worldTrackingTechnique = &self->_worldTrackingTechnique;
  worldTrackingTechnique = self->_worldTrackingTechnique;
  if (worldTrackingTechnique != v11)
  {
    [(ARWorldTrackingTechnique *)worldTrackingTechnique invalidateAllRaycasts];
    [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique removeObserver:self];
  }
  objc_storeStrong((id *)&self->_worldTrackingTechnique, v11);
  __n128 v16 = *p_worldTrackingTechnique;
  if (*p_worldTrackingTechnique)
  {
    [(ARWorldTrackingTechnique *)v16 setTrackedRaycastPostProcessor:self->_trackedRaycastPostProcessor];
    int v17 = [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique mutableOptions];
    id v18 = [v17 slamConfiguration];
    self->_vioFusionEnabled = [v18 isEqualToString:@"CoreLocationIntegration"];

    __n128 v16 = self->_worldTrackingTechnique;
  }
  [(ARWorldTrackingTechnique *)v16 addObserver:self];
  __int16 v19 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v4];
  [(ARSession *)self setGeoTrackingTechnique:v19];

  long long v20 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v4];
  self->_techniquesWantPredictedPoseForWideCam = v20 != 0;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v21 = v4;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    id v33 = v13;
    uint64_t v24 = *(void *)v35;
    while (2)
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        long long v26 = [*(id *)(*((void *)&v34 + 1) + 8 * j) resultDataClasses];
        char v27 = [v26 containsObject:objc_opt_class()];

        if (v27)
        {
          BOOL v28 = 1;
          goto LABEL_24;
        }
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v42 count:16];
      if (v23) {
        continue;
      }
      break;
    }
    BOOL v28 = 0;
LABEL_24:
    uint64_t v10 = off_1E6184000;
    NSUInteger v13 = v33;
  }
  else
  {
    BOOL v28 = 0;
  }

  self->_configuredForWorldTracking = v28;
  long long v29 = [(__objc2_class *)v10[120] techniqueOfClass:objc_opt_class() inArray:v21];
  environmentTexturingTechnique = self->_environmentTexturingTechnique;
  self->_environmentTexturingTechnique = v29;

  id v31 = [(__objc2_class *)v10[120] techniqueOfClass:objc_opt_class() inArray:v21];
  recordingTechnique = self->_recordingTechnique;
  self->_recordingTechnique = v31;
}

- (void)setupResultRequestSyncScheduler:(id)a3 forTechnique:(id)a4
{
  id v27 = a4;
  id v6 = a3;
  char v7 = [v27 requiredSensorDataTypes];
  id v8 = [v27 techniqueOfClass:objc_opt_class()];
  BOOL v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 mutableOptions];
    id v11 = [v10 imageSensorSettings];
    int v12 = [v11 visionDataOutputEnabled];

    NSUInteger v13 = [v9 mutableOptions];
    NSUInteger v14 = [v13 imageSensorSettingsForUltraWide];
    int v15 = [v14 visionDataOutputEnabled];

    int v16 = (v12 | v15) ^ 1;
    char v17 = v15 ^ 1;
    if ((v7 & 0x10) == 0)
    {
LABEL_3:
      char v18 = v16 | v17;
      double v19 = 0.005;
      if (!v16) {
        double v19 = 0.015;
      }
      if ((v18 & 1) == 0)
      {
        BOOL v20 = [(ARSession *)self isUserFaceTracking];
        double v19 = 0.035;
        if (!v20) {
          double v19 = 0.015;
        }
      }
      goto LABEL_12;
    }
  }
  else
  {
    char v17 = 1;
    int v16 = 1;
    if ((v7 & 0x10) == 0) {
      goto LABEL_3;
    }
  }
  BOOL v21 = ARHasH10();
  double v19 = 0.018;
  if (v21) {
    double v19 = 0.01;
  }
LABEL_12:
  [v6 setInputJitterBufferInterval:v19];
  [v6 inputJitterBufferInterval];
  double v23 = v22 * 0.75;
  [v27 setBonusLatency:v22 * 0.75];
  [v27 requiredTimeInterval];
  double v25 = v24 - v23;
  if (v25 >= 0.0) {
    double v26 = v25;
  }
  else {
    double v26 = 0.0;
  }
  [v6 setVsyncOffset:-(ARDispatchAfterLeewayForTimeInterval(v26) + v26 + 0.003)];
}

- (void)_updateSessionWithConfiguration:(id)a3 options:(unint64_t)a4
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 techniques];
  id v8 = [v6 secondaryTechniques];
  BOOL v9 = [v6 customSensors];

  if (v9)
  {
    uint64_t v10 = [v6 replaySensor];
    if (v10)
    {
      id v11 = (void *)v10;
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) == 0)
      {
        NSUInteger v13 = [ARReplayConfiguration alloc];
        NSUInteger v14 = [v6 replaySensor];
        int v15 = [(ARReplayConfiguration *)v13 initWithBaseConfiguration:v6 replaySensor:v14];

        uint64_t v16 = [(ARCustomTechniquesConfiguration *)v15 techniques];

        uint64_t v17 = [(ARReplayConfiguration *)v15 secondaryTechniques];

        id v8 = (void *)v17;
        char v7 = (void *)v16;
      }
    }
  }
  v88 = v7;
  v90 = v8;
  if (!v7)
  {
    long long v35 = _ARLogSession_0();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      long long v36 = (objc_class *)objc_opt_class();
      long long v37 = NSStringFromClass(v36);
      *(_DWORD *)buf = 138543874;
      v108 = v37;
      __int16 v109 = 2048;
      v110 = self;
      __int16 v111 = 2112;
      id v112 = v6;
      _os_log_impl(&dword_1B88A2000, v35, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to run the session, configuration is not supported on this device: %@", buf, 0x20u);
    }
    ARErrorWithCodeAndUserInfo(100, 0);
    long long v38 = (ARParentTechnique *)objc_claimAutoreleasedReturnValue();
    -[ARSession _sessionDidFailWithError:](self, "_sessionDidFailWithError:", v38, 0, v8);
    goto LABEL_65;
  }
  if (self->_forceEnvironmentTexturingToManualMode)
  {
    char v18 = objc_opt_new();
    objc_msgSend(v18, "addObjectsFromArray:", v7, v7, v8);
    [v18 addObjectsFromArray:v8];
    double v19 = +[ARTechnique techniqueOfClass:objc_opt_class() inArray:v7];
    +[ARSession forceEnvironmentTexturingTechniqueToManualMode:v19];
  }
  if ([v6 isKindOfConfiguration:objc_opt_class()])
  {
    BOOL v20 = [v6 replaySensor];

    if (v20)
    {
      BOOL v21 = objc_opt_new();
      [v21 configureForReplay];
      double v22 = _ARLogSession_0();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        double v23 = (objc_class *)objc_opt_class();
        double v24 = NSStringFromClass(v23);
        *(_DWORD *)buf = 138543874;
        v108 = v24;
        __int16 v109 = 2048;
        v110 = self;
        __int16 v111 = 2048;
        id v112 = v21;
        _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Creating location sensor for replay: %p", buf, 0x20u);
      }
      double v25 = [v6 replaySensor];
      v106[0] = v25;
      v106[1] = v21;
      double v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v106 count:2];

      [v6 setCustomSensors:v26];
    }
  }
  v91 = v6;
  -[ARSession _updateSensorsWithConfiguration:](self, "_updateSensorsWithConfiguration:", v6, v88);
  long long v102 = 0u;
  long long v103 = 0u;
  long long v101 = 0u;
  long long v100 = 0u;
  id v27 = v7;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v100 objects:v105 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = 0;
    uint64_t v31 = *(void *)v101;
    uint64_t v32 = 1;
    do
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v101 != v31) {
          objc_enumerationMutation(v27);
        }
        long long v34 = *(void **)(*((void *)&v100 + 1) + 8 * i);
        v32 |= [v34 requiredSensorDataTypes];
        v30 |= [v34 optionalSensorDataTypes];
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v100 objects:v105 count:16];
    }
    while (v29);
  }
  else
  {
    uint64_t v30 = 0;
    uint64_t v32 = 1;
  }

  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v39 = v8;
  uint64_t v40 = [v39 countByEnumeratingWithState:&v96 objects:v104 count:16];
  if (v40)
  {
    uint64_t v41 = v40;
    uint64_t v42 = *(void *)v97;
    do
    {
      for (uint64_t j = 0; j != v41; ++j)
      {
        if (*(void *)v97 != v42) {
          objc_enumerationMutation(v39);
        }
        uint64_t v44 = *(void **)(*((void *)&v96 + 1) + 8 * j);
        v32 |= [v44 requiredSensorDataTypes];
        v30 |= [v44 optionalSensorDataTypes];
      }
      uint64_t v41 = [v39 countByEnumeratingWithState:&v96 objects:v104 count:16];
    }
    while (v41);
  }

  id v6 = v91;
  if ([v91 isKindOfConfiguration:objc_opt_class()])
  {
    double v45 = [v91 replaySensor];

    if (v45)
    {
      __int16 v46 = _ARLogSession_0();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        double v47 = (objc_class *)objc_opt_class();
        __int16 v48 = NSStringFromClass(v47);
        *(_DWORD *)buf = 138543618;
        v108 = v48;
        __int16 v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B88A2000, v46, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Disabling location data type because of replay.", buf, 0x16u);
      }
      v32 &= ~0x40uLL;
      v30 &= ~0x40uLL;
    }
  }
  unint64_t v49 = [(ARSession *)self runningSensors];
  unint64_t v50 = ([(ARSession *)self runningSensors] ^ (v32 | v30)) & v49;
  unint64_t v51 = [(ARSession *)self runningSensors];
  [(ARSession *)self _stopSensorsWithDataTypes:v50 keepingDataTypes:v32 | v30];
  [(ARSession *)self _updateSessionStateWithConfiguration:v91 options:a4];
  [(ARSession *)self setConfigurationInternal:v91];
  [(ARSession *)self _sessionWillRunWithConfiguration:v91];
  if ([(ARSession *)self state] != 2 || ![(ARSession *)self pausedSensors])
  {
    __int16 v52 = [(ARSession *)self technique];

    uint64_t v53 = _ARLogSession_0();
    BOOL v54 = os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG);
    if ((a4 & 1) != 0 || !v52)
    {
      if (v54)
      {
        uint64_t v60 = (objc_class *)objc_opt_class();
        v61 = NSStringFromClass(v60);
        *(_DWORD *)buf = 138543618;
        v108 = v61;
        __int16 v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B88A2000, v53, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using all new techniques.", buf, 0x16u);
      }
      uint64_t v57 = [[ARParentTechnique alloc] initWithTechniques:v27 delegate:self];
    }
    else
    {
      if (v54)
      {
        uint64_t v55 = (objc_class *)objc_opt_class();
        uint64_t v56 = NSStringFromClass(v55);
        *(_DWORD *)buf = 138543618;
        v108 = v56;
        __int16 v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B88A2000, v53, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Re-using existing techniques if possible.", buf, 0x16u);
      }
      uint64_t v57 = [[ARParentTechnique alloc] initWithTechniques:v27 delegate:self];
      uint64_t v58 = [(ARSession *)self technique];
      v59 = [v58 techniques];
      [(ARParentTechnique *)v57 reuseTechniques:v59];
    }
    unint64_t v62 = v51 ^ v50;
    if ([v39 count])
    {
      v63 = [(ARSession *)self secondaryTechnique];

      v64 = _ARLogSession_0();
      BOOL v65 = os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG);
      if ((a4 & 1) != 0 || !v63)
      {
        if (v65)
        {
          long long v71 = (objc_class *)objc_opt_class();
          long long v72 = NSStringFromClass(v71);
          *(_DWORD *)buf = 138543618;
          v108 = v72;
          __int16 v109 = 2048;
          v110 = self;
          _os_log_impl(&dword_1B88A2000, v64, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Using all new secondary techniques.", buf, 0x16u);
        }
        uint64_t v68 = [[ARParentTechnique alloc] initWithTechniques:v39 delegate:self];
      }
      else
      {
        if (v65)
        {
          v66 = (objc_class *)objc_opt_class();
          id v67 = NSStringFromClass(v66);
          *(_DWORD *)buf = 138543618;
          v108 = v67;
          __int16 v109 = 2048;
          v110 = self;
          _os_log_impl(&dword_1B88A2000, v64, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Re-using existing techniques if possible.", buf, 0x16u);
        }
        uint64_t v68 = [[ARParentTechnique alloc] initWithTechniques:v39 delegate:self];
        v69 = [(ARSession *)self secondaryTechnique];
        v70 = [v69 techniques];
        [(ARParentTechnique *)v68 reuseTechniques:v70];
      }
    }
    else
    {
      uint64_t v68 = 0;
    }
    uint64_t v73 = v32 & ~v62;
    unint64_t v74 = v30 & ~v62;
    [(ARSession *)self _setPrimaryTechnique:v57 secondaryTechnique:v68];
    v75 = [(ARSession *)self configurationInternal];
    id v76 = [v75 parentImageSensorSettings];
    v77 = [v76 settings];
    __int16 v78 = [v77 firstObject];
    v79 = [v78 videoFormat];
    primaryVideoFormat = self->_primaryVideoFormat;
    self->_primaryVideoFormat = v79;

    __int16 v81 = [v91 replaySensor];
    uint64_t v82 = [v81 replayMode];
    prepareTechniquesQueue = self->_prepareTechniquesQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__ARSession__updateSessionWithConfiguration_options___block_invoke;
    block[3] = &unk_1E6186188;
    long long v38 = v57;
    v93 = v38;
    BOOL v95 = v82 != 0;
    uint64_t v84 = v68;
    v94 = v84;
    dispatch_async(prepareTechniquesQueue, block);
    if (v81) {
      dispatch_sync((dispatch_queue_t)self->_prepareTechniquesQueue, &__block_literal_global_190_0);
    }
    [(ARRenderSyncScheduler *)self->_resultRequestScheduler setExcessiveCallbackOptions:v81 != 0];
    [(ARRenderSyncScheduler *)self->_secondaryResultRequestScheduler setExcessiveCallbackOptions:v81 != 0];
    if (v82 || [v91 disableRenderSyncScheduling])
    {
      [(ARRenderSyncScheduler *)self->_resultRequestScheduler setSchedulingActive:0];
      [(ARRenderSyncScheduler *)self->_secondaryResultRequestScheduler setSchedulingActive:0];
      uint64_t v85 = _ARLogSession_0();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        v86 = (objc_class *)objc_opt_class();
        v87 = NSStringFromClass(v86);
        *(_DWORD *)buf = 138543618;
        v108 = v87;
        __int16 v109 = 2048;
        v110 = self;
        _os_log_impl(&dword_1B88A2000, v85, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Disabling scheduling for ResultRequestSchedulers", buf, 0x16u);
      }
    }
    [(ARSession *)self _startSensorsWithRequiredDataTypes:v73 optionalDataTypes:v74];
    [(ARSession *)self _configureSensorsForRecording];
    [(ARSession *)self _saveGraphFileInFileName:0];

    id v6 = v91;
LABEL_65:
  }
}

uint64_t __53__ARSession__updateSessionWithConfiguration_options___block_invoke(uint64_t a1)
{
  kdebug_trace();
  [*(id *)(a1 + 32) prepare:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 40) prepare:*(unsigned __int8 *)(a1 + 48)];
  return kdebug_trace();
}

- (void)_updateSessionStateWithConfiguration:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if ((v4 & 2) != 0)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v6 = [(ARFrame *)self->_lastProcessedFrame anchors];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          [(ARFrameContextHandler *)self->_frameContextHandler removeAnchor:*(void *)(*((void *)&v18 + 1) + 8 * v10++)];
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v8);
    }

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_lastProcessedFrameSemaphore);
    [(ARFrameContextHandler *)self->_frameContextHandler clearAddedAnchors];
    id v11 = _ARLogSession_0();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = (objc_class *)objc_opt_class();
      NSUInteger v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138543618;
      double v23 = v13;
      __int16 v24 = 2048;
      double v25 = self;
      _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Removing existing anchors", buf, 0x16u);
    }
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 8) == 0) {
        goto LABEL_4;
      }
LABEL_17:
      [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique resetSceneReconstruction];
      if ((v4 & 1) == 0) {
        goto LABEL_21;
      }
      goto LABEL_18;
    }
  }
  else if ((v4 & 4) == 0)
  {
    goto LABEL_3;
  }
  [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique stopAllRaycasts];
  if ((v4 & 8) != 0) {
    goto LABEL_17;
  }
LABEL_4:
  if ((v4 & 1) == 0) {
    goto LABEL_21;
  }
LABEL_18:
  [(ARFrameContextHandler *)self->_frameContextHandler resetSessionTransform];
  NSUInteger v14 = _ARLogSession_0();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    int v15 = (objc_class *)objc_opt_class();
    uint64_t v16 = NSStringFromClass(v15);
    *(_DWORD *)buf = 138543618;
    double v23 = v16;
    __int16 v24 = 2048;
    double v25 = self;
    _os_log_impl(&dword_1B88A2000, v14, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reset session transform", buf, 0x16u);
  }
LABEL_21:
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_resultDataOfSecondaryFrameContextsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  resultDatasOfSecondaryFrameContexts = self->resultDatasOfSecondaryFrameContexts;
  self->resultDatasOfSecondaryFrameContexts = 0;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_resultDataOfSecondaryFrameContextsSemaphore);
}

- (BOOL)_exposeInternalDepthData
{
  if (_exposeInternalDepthData_onceToken != -1) {
    dispatch_once(&_exposeInternalDepthData_onceToken, &__block_literal_global_192);
  }
  return _exposeInternalDepthData_exposeInternalDepthData;
}

void __37__ARSession__exposeInternalDepthData__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v1 = [v0 bundleIdentifier];

  uint64_t v2 = +[ARKitUserDefaults listForKey:@"com.apple.arkit.appleDepthSPI.bundleID.approvedList"];
  __n128 v3 = [v2 arrayByAddingObject:@"com.apple."];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __37__ARSession__exposeInternalDepthData__block_invoke_2;
  v6[3] = &unk_1E6187328;
  id v7 = v1;
  id v4 = v1;
  uint64_t v5 = objc_msgSend(v3, "ar_firstObjectPassingTest:", v6);
  if (v5) {
    _exposeInternalDepthData_exposeInternalDepthData = 1;
  }
}

uint64_t __37__ARSession__exposeInternalDepthData__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) hasPrefix:a2];
  *a4 = result;
  return result;
}

- (void)technique:(id)a3 didOutputResultData:(id)a4 timestamp:(double)a5 context:(id)a6
{
  uint64_t v475 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id obj = a4;
  id v11 = a6;
  kdebug_trace();
  kdebug_trace();
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  v413 = v11;
  [(ARFrameContextHandler *)self->_frameContextHandler markFrameContextProcessed:v11];
  v414 = self;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  long long v456 = 0u;
  long long v457 = 0u;
  long long v458 = 0u;
  long long v459 = 0u;
  v362 = v10;
  int v12 = [v10 splitTechniques];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v456 objects:v474 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v457;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v457 != v14) {
          objc_enumerationMutation(v12);
        }
        [*(id *)(*((void *)&v456 + 1) + 8 * i) requestResultDataAtTimestamp:v413 context:a5];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v456 objects:v474 count:16];
    }
    while (v13);
  }

  if (!v413 || ([v413 imageData], (uint64_t v16 = objc_claimAutoreleasedReturnValue()) == 0))
  {
LABEL_23:
    if (v414->resultDatasOfSecondaryFrameContexts)
    {
      dispatch_semaphore_wait((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
      uint64_t v28 = [obj arrayByAddingObjectsFromArray:v414->resultDatasOfSecondaryFrameContexts];

      uint64_t v29 = [MEMORY[0x1E4F1CA48] array];
      long long v450 = 0u;
      long long v451 = 0u;
      long long v448 = 0u;
      long long v449 = 0u;
      uint64_t v30 = v414->resultDatasOfSecondaryFrameContexts;
      uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v448 objects:v472 count:16];
      if (v31)
      {
        uint64_t v32 = *(void *)v449;
        do
        {
          for (uint64_t j = 0; j != v31; ++j)
          {
            if (*(void *)v449 != v32) {
              objc_enumerationMutation(v30);
            }
            uint64_t v34 = *(void *)(*((void *)&v448 + 1) + 8 * j);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) == 0)
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0) {
                  continue;
                }
              }
            }
            [v29 addObject:v34];
          }
          uint64_t v31 = [(NSArray *)v30 countByEnumeratingWithState:&v448 objects:v472 count:16];
        }
        while (v31);
      }

      objc_storeStrong((id *)&v414->resultDatasOfSecondaryFrameContexts, v29);
      dispatch_semaphore_signal((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore);

      id obj = (id)v28;
    }
    long long v35 = [[ARFrame alloc] initWithTimestamp:v413 context:a5];
    dispatch_semaphore_wait((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore);
    long long v36 = [v413 orientationData];
    long long v37 = [v36 deviceMotion];
    [v37 heading];
    -[ARFrame setRawHeading:](v35, "setRawHeading:");

    long long v38 = [v413 locationData];
    id v39 = [v38 location];
    [(ARFrame *)v35 setRawLocation:v39];

    uint64_t v40 = [v413 locationData];
    [v40 timestamp];
    -[ARFrame setRawLocationTimestamp:](v35, "setRawLocationTimestamp:");

    uint64_t v41 = [v413 locationData];
    [v41 undulation];
    -[ARFrame setUndulation:](v35, "setUndulation:");

    if ((v414->_runningSensors & 0x40) != 0)
    {
      uint64_t v42 = _ARLogSession_0();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v43 = (objc_class *)objc_opt_class();
        NSStringFromClass(v43);
        id v44 = (id)objc_claimAutoreleasedReturnValue();
        [(ARFrame *)v35 rawHeading];
        *(_DWORD *)buf = 138543875;
        *(void *)&uint8_t buf[4] = v44;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v414;
        *(_WORD *)&buf[22] = 2049;
        *(void *)&buf[24] = v45;
        _os_log_impl(&dword_1B88A2000, v42, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: currentFrame.rawHeading,%{private}f", buf, 0x20u);
      }
      __int16 v46 = _ARLogSession_0();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        double v47 = (objc_class *)objc_opt_class();
        NSStringFromClass(v47);
        id v48 = (id)objc_claimAutoreleasedReturnValue();
        [(ARFrame *)v35 rawLocationTimestamp];
        uint64_t v50 = v49;
        unint64_t v51 = [(ARFrame *)v35 rawLocation];
        [v51 coordinate];
        uint64_t v53 = v52;
        BOOL v54 = [(ARFrame *)v35 rawLocation];
        [v54 coordinate];
        uint64_t v56 = v55;
        uint64_t v57 = [(ARFrame *)v35 rawLocation];
        [v57 altitudeWgs84];
        uint64_t v59 = v58;
        uint64_t v60 = [(ARFrame *)v35 rawLocation];
        int v61 = [v60 isAltitudeWgs84Available];
        *(_DWORD *)buf = 138544899;
        *(void *)&uint8_t buf[4] = v48;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v414;
        *(_WORD *)&buf[22] = 2049;
        *(void *)&buf[24] = v50;
        LOWORD(v470[0]) = 2049;
        *(void *)((char *)v470 + 2) = v53;
        WORD5(v470[0]) = 2049;
        *(void *)((char *)v470 + 12) = v56;
        WORD2(v470[1]) = 2049;
        *(void *)((char *)&v470[1] + 6) = v59;
        HIWORD(v470[1]) = 1024;
        int v471 = v61;
        _os_log_impl(&dword_1B88A2000, v46, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: currentFrame.rawLocation,%{private}lf,%{private}lf,%{private}lf,%{private}lf,%d", buf, 0x44u);
      }
    }
    if ([(ARFrame *)v35 isHighResolution])
    {
      unint64_t v62 = [(ARSession *)v414 technique];
      v63 = [v62 predictedResultDataAtTimestamp:v413 context:a5];

      v64 = [obj arrayByAddingObjectsFromArray:v63];
    }
    else
    {
      v64 = obj;
    }
    long long v446 = 0u;
    long long v447 = 0u;
    long long v444 = 0u;
    long long v445 = 0u;
    id obj = v64;
    uint64_t location = [obj countByEnumeratingWithState:&v444 objects:v468 count:16];
    if (location)
    {
      char v382 = 0;
      uint64_t v368 = 0;
      uint64_t v386 = *(void *)v445;
      do
      {
        for (uint64_t k = 0; k != location; ++k)
        {
          if (*(void *)v445 != v386) {
            objc_enumerationMutation(obj);
          }
          v66 = *(void **)(*((void *)&v444 + 1) + 8 * k);
          if (objc_opt_respondsToSelector())
          {
            [v66 cameraTransform];
            double v378 = v68;
            double v383 = v67;
            double v370 = v70;
            double v374 = v69;
            long long v71 = [(ARFrame *)v35 camera];
            objc_msgSend(v71, "setTransform:", v383, v378, v374, v370);

            char v382 = 1;
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && v414->_renderPersonBoundingBoxesIntoCapturedImage)
          {
            long long v442 = 0u;
            long long v443 = 0u;
            long long v440 = 0u;
            long long v441 = 0u;
            long long v72 = [v66 detectedObjects];
            uint64_t v73 = [v72 countByEnumeratingWithState:&v440 objects:v467 count:16];
            if (v73)
            {
              uint64_t v74 = *(void *)v441;
              do
              {
                for (uint64_t m = 0; m != v73; ++m)
                {
                  if (*(void *)v441 != v74) {
                    objc_enumerationMutation(v72);
                  }
                  [*(id *)(*((void *)&v440 + 1) + 8 * m) boundingBox];
                  ARDrawNormalizedCGRectIntoYUVPixelBuffer([(ARFrame *)v35 capturedImage], 255, v76, v77, v78, v79);
                }
                uint64_t v73 = [v72 countByEnumeratingWithState:&v440 objects:v467 count:16];
              }
              while (v73);
            }
          }
          if (objc_opt_respondsToSelector())
          {
            __int16 v80 = [v66 worldTrackingState];
            uint64_t v81 = [v80 state];
            uint64_t v82 = [(ARFrame *)v35 camera];
            [v82 setTrackingState:v81];

            uint64_t v83 = [v80 reason];
            uint64_t v84 = [(ARFrame *)v35 camera];
            [v84 setTrackingStateReason:v83];

            [(ARFrame *)v35 setWorldTrackingState:v80];
            objc_msgSend(v413, "setDidRelocalize:", objc_msgSend(v80, "majorRelocalization"));
            if ([v413 didRelocalize])
            {
              dispatch_semaphore_wait((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
              [v80 majorRelocalizationCameraTransform];
              float32x4_t v375 = v86;
              float32x4_t v379 = v85;
              float32x4_t v371 = v87;
              float32x4_t v363 = v88;
              v89 = [(ARFrame *)v414->_lastProcessedFrame camera];
              [v89 transform];
              simd_float4x4 v477 = __invert_f4(v476);
              uint64_t v90 = 0;
              simd_float4x4 v460 = v477;
              memset(buf, 0, sizeof(buf));
              memset(v470, 0, sizeof(v470));
              do
              {
                *(float32x4_t *)&buf[v90 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v379, COERCE_FLOAT(*(_OWORD *)&v460.columns[v90])), v375, *(float32x2_t *)v460.columns[v90].f32, 1), v371, (float32x4_t)v460.columns[v90], 2), v363, (float32x4_t)v460.columns[v90], 3);
                ++v90;
              }
              while (v90 != 4);
              float32x4_t v376 = *(float32x4_t *)&buf[16];
              float32x4_t v380 = *(float32x4_t *)buf;
              float32x4_t v372 = (float32x4_t)v470[0];
              float32x4_t v364 = (float32x4_t)v470[1];
              [(ARFrame *)v414->_lastProcessedFrame referenceOriginTransform];
              uint64_t v91 = 0;
              v460.columns[0] = v92;
              v460.columns[1] = v93;
              v460.columns[2] = v94;
              v460.columns[3] = v95;
              memset(buf, 0, sizeof(buf));
              memset(v470, 0, sizeof(v470));
              do
              {
                *(float32x4_t *)&buf[v91 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v380, COERCE_FLOAT(*(_OWORD *)&v460.columns[v91])), v376, *(float32x2_t *)v460.columns[v91].f32, 1), v372, (float32x4_t)v460.columns[v91], 2), v364, (float32x4_t)v460.columns[v91], 3);
                ++v91;
              }
              while (v91 != 4);
              objc_msgSend(v413, "setRelocalizationDeltaTransform:", *(double *)buf, *(double *)&buf[16], *(double *)v470, *(double *)&v470[1]);

              dispatch_semaphore_signal((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore);
              long long v96 = _ARLogSession_0();
              if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
              {
                long long v97 = (objc_class *)objc_opt_class();
                NSStringFromClass(v97);
                id v98 = (id)objc_claimAutoreleasedReturnValue();
                [v80 lastMajorRelocalizationTimestamp];
                uint64_t v100 = v99;
                [v413 relocalizationDeltaTransform];
                ARMatrix4x4Description(0, v101, v102, v103, v104);
                id v105 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138544130;
                *(void *)&uint8_t buf[4] = v98;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v414;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = v100;
                LOWORD(v470[0]) = 2112;
                *(void *)((char *)v470 + 2) = v105;
                _os_log_impl(&dword_1B88A2000, v96, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Relocalization time stamp: %f, delta transform: %@", buf, 0x2Au);
              }
            }
          }
          if (([v413 frameDebugOptions] & 4) != 0)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [(ARFrame *)v35 setWorldTrackingErrorData:v66];
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v106 = v66;
            -[ARFrame setWorldMappingStatus:](v35, "setWorldMappingStatus:", [v106 worldMappingStatus]);
            [v413 frameDebugOptions];
            v107 = [v106 lineCloud];
            [(ARFrame *)v35 setWorldTrackingLineCloud:v107];

            v108 = [v106 currentlyActiveVideoFormat];
            [(ARFrame *)v35 setCurrentlyActiveVideoFormat:v108];

            if ([(ARSession *)v414 _shouldUpdateLocationSensorForFusion])
            {
              locationSensor = v414->_locationSensor;
              v110 = [v413 imageData];
              [(ARRemoteLocationSensor *)locationSensor updateEstimationFromVIOPose:v106 imageData:v110];
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v111 = v66;
            id v112 = [v111 location];
            [(ARFrame *)v35 setLocation:v112];

            [v111 heading];
            -[ARFrame setHeading:](v35, "setHeading:");
            uint64_t v113 = _ARLogSession_0();
            if (os_log_type_enabled(v113, OS_LOG_TYPE_DEBUG))
            {
              v114 = (objc_class *)objc_opt_class();
              NSStringFromClass(v114);
              id v115 = (id)objc_claimAutoreleasedReturnValue();
              v116 = [(ARFrame *)v35 location];
              [v116 coordinate];
              uint64_t v118 = v117;
              v119 = [(ARFrame *)v35 location];
              [v119 coordinate];
              uint64_t v121 = v120;
              v122 = [(ARFrame *)v35 location];
              [v122 altitude];
              uint64_t v124 = v123;
              [(ARFrame *)v35 heading];
              *(_DWORD *)buf = 138544643;
              *(void *)&uint8_t buf[4] = v115;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v414;
              *(_WORD *)&buf[22] = 2049;
              *(void *)&buf[24] = v118;
              LOWORD(v470[0]) = 2049;
              *(void *)((char *)v470 + 2) = v121;
              WORD5(v470[0]) = 2049;
              *(void *)((char *)v470 + 12) = v124;
              WORD2(v470[1]) = 2049;
              *(void *)((char *)&v470[1] + 6) = v125;
              _os_log_impl(&dword_1B88A2000, v113, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: currentFrame.lat,lon,alt,heading: %{private}lf,%{private}lf,%{private}lf,%{private}lf", buf, 0x3Eu);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v126 = v66;
            [(ARFrame *)v35 setVlState:v126];
            v127 = [v126 trackingStatus];
            [(ARFrame *)v35 setGeoTrackingStatus:v127];

            v128 = [v126 fusedReplayLocation];
            [(ARFrame *)v35 setRawLocation:v128];

            [v126 fusedReplayLocationTimestamp];
            -[ARFrame setRawLocationTimestamp:](v35, "setRawLocationTimestamp:");
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v129 = v66;
            v130 = [v129 debugInfo];
            [(ARFrame *)v35 setVlDebugInfo:v130];
          }
          if (objc_opt_respondsToSelector())
          {
            if (objc_opt_respondsToSelector()) {
              uint64_t v368 = [v66 worldAlignmentModifiers];
            }
            if ((v368 & 1) == 0)
            {
              [v66 worldAlignmentTransform];
              -[ARFrame setWorldAlignmentTransform:](v35, "setWorldAlignmentTransform:");
            }
          }
          if (objc_opt_respondsToSelector())
          {
            v131 = [v66 lightEstimate];
            [(ARFrame *)v35 setLightEstimate:v131];

            LODWORD(v131) = ARLinkedOnOrAfterCrystal();
            v132 = [v66 lightEstimate];
            [v132 ambientIntensity];
            if (v131) {
              float v134 = v133 / 1000.0;
            }
            else {
              float v134 = v133;
            }
            float v135 = ARMapLightIntensity(v134);
            v136 = [(ARFrame *)v35 camera];
            *(float *)&double v137 = v135;
            [v136 setExposureOffset:v137];
          }
          if (objc_opt_respondsToSelector())
          {
            v138 = [v66 featurePoints];
            [(ARFrame *)v35 setReferenceFeaturePoints:v138];
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v139 = v66;
            if ([v139 source] == 1) {
              -[ARFrame setSegmentationBuffer:](v35, "setSegmentationBuffer:", [v139 segmentationBuffer]);
            }
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v140 = v66;
            -[ARFrame setDownSampledMattingPixelBuffer:](v35, "setDownSampledMattingPixelBuffer:", [v140 downSampledImageBuffer]);
            -[ARFrame setMattingScaleImagePixelBuffer:](v35, "setMattingScaleImagePixelBuffer:", [v140 mattingScaleImageBuffer]);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v141 = v66;
            -[ARFrame setEstimatedDepthData:](v35, "setEstimatedDepthData:", [v141 depthBuffer]);
          }
          if ([(ARSession *)v414 _exposeInternalDepthData])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v142 = v66;
              -[ARFrame setDepthMap:](v35, "setDepthMap:", [v142 depthMap]);
            }
          }
          if (([(ARConfiguration *)v414->_configurationInternal frameSemantics] & 8) != 0
            && ARDeviceSupportsJasper()
            && [v66 isMemberOfClass:objc_opt_class()])
          {
            id v143 = v66;
            v144 = objc_msgSend(objc_alloc(MEMORY[0x1E4F47878]), "initWithDepthMap:confidenceMap:", objc_msgSend(v143, "singleFrameDepthBuffer"), objc_msgSend(v143, "confidenceMap"));
            [(ARFrame *)v35 setSceneDepth:v144];
            -[ARFrame setDepthConfidenceData:](v35, "setDepthConfidenceData:", [v143 confidenceBuffer]);
          }
          if (([(ARConfiguration *)v414->_configurationInternal frameSemantics] & 0x10) != 0
            && ARDeviceSupportsJasper()
            && [v66 isMemberOfClass:objc_opt_class()])
          {
            id v145 = v66;
            v146 = objc_msgSend(objc_alloc(MEMORY[0x1E4F47878]), "initWithDepthMap:confidenceMap:", objc_msgSend(v145, "depthBuffer"), objc_msgSend(v145, "confidenceMap"));
            [(ARFrame *)v35 setSmoothedSceneDepth:v146];
            -[ARFrame setDepthConfidenceData:](v35, "setDepthConfidenceData:", [v145 confidenceBuffer]);
          }
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v147 = v66;
            v148 = objc_opt_new();
            v149 = [v147 trackedDetectionResult];

            if (v149)
            {
              v150 = [v147 trackedDetectionResult];
              [v148 addObject:v150];
            }
            v151 = [v147 alignedDetectionResult];

            if (v151)
            {
              v152 = [v147 alignedDetectionResult];
              [v148 addObject:v152];
            }
            v153 = objc_msgSend(v148, "ar_map:", &__block_literal_global_226);
            [(ARFrame *)v35 setDetectedBodies:v153];
          }
        }
        uint64_t location = [obj countByEnumeratingWithState:&v444 objects:v468 count:16];
      }
      while (location);
    }
    else
    {
      char v382 = 0;
      uint64_t v368 = 0;
    }

    v381 = objc_msgSend(obj, "ar_filter:", &__block_literal_global_231);
    if ([v381 count]) {
      [(ARSession *)v414 _sessionDidUpdateSpatialMappingPointClouds:v381];
    }
    v154 = [(ARSession *)v414 configurationInternal];
    if ([v154 isPersonMetadataEnabled]
      && [(ARFrame *)v35 segmentationBuffer])
    {
      BOOL v155 = [(ARFrame *)v35 estimatedDepthData] == 0;

      if (v155)
      {
LABEL_143:
        if (ARInternalOSBuild() && ([v413 frameDebugOptions] & 2) != 0) {
          [(ARFrame *)v35 setResultDatas:obj];
        }
        v162 = [(ARFrame *)v35 camera];
        BOOL v163 = [v162 trackingState] == 0;

        if (v163)
        {
          if ((v382 & 1) != 0 || [v413 worldAlignment] == 2)
          {
            BOOL v164 = !v414->_configuredForWorldTracking;
            v165 = [(ARFrame *)v35 camera];
            v166 = v165;
            if (v164)
            {
              [v165 setTrackingState:2];
            }
            else
            {
              [v165 setTrackingState:1];

              v166 = [(ARFrame *)v35 camera];
              [v166 setTrackingStateReason:1];
            }
          }
          else
          {
            if (([(ARSession *)v414 runningSensors] & 8) != 0) {
              goto LABEL_155;
            }
            v166 = [(ARFrame *)v35 camera];
            [v166 setTrackingState:2];
          }
        }
LABEL_155:
        if ([v413 frameDebugOptions])
        {
          v167 = objc_opt_new();
          v168 = [v413 imageData];
          v169 = [v168 captureDate];
          [v169 timeIntervalSinceNow];
          [v167 setVideoLatency:-v170];

          v171 = [v413 imageData];
          [v171 timestamp];
          [v167 addTimestamp:objc_opt_class() forDataOfClass:v172];

          long long v434 = 0u;
          long long v435 = 0u;
          long long v432 = 0u;
          long long v433 = 0u;
          id v173 = obj;
          uint64_t v174 = [v173 countByEnumeratingWithState:&v432 objects:v465 count:16];
          if (v174)
          {
            uint64_t v175 = *(void *)v433;
            do
            {
              for (uint64_t n = 0; n != v174; ++n)
              {
                if (*(void *)v433 != v175) {
                  objc_enumerationMutation(v173);
                }
                v177 = *(void **)(*((void *)&v432 + 1) + 8 * n);
                if (objc_opt_respondsToSelector())
                {
                  [v177 timestamp];
                  [v167 addTimestamp:objc_opt_class() forDataOfClass:v178];
                }
              }
              uint64_t v174 = [v173 countByEnumeratingWithState:&v432 objects:v465 count:16];
            }
            while (v174);
          }

          [(ARFrame *)v35 setTimingData:v167];
        }
        if ([(ARSession *)v414 powerUsage])
        {
          [(ARFrame *)v35 setShouldRestrictFrameRate:1];
        }
        else
        {
          [(ARFrame *)v35 setShouldRestrictFrameRate:0];
          v179 = [(ARSession *)v414 configurationInternal];
          v180 = [v179 videoFormat];
          uint64_t v181 = [v180 framesPerSecond];

          [(ARFrame *)v35 setRenderFramesPerSecond:(uint64_t)fmax((double)v181, 60.0)];
        }
        dispatch_semaphore_wait((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore, 0xFFFFFFFFFFFFFFFFLL);
        v182 = [(ARFrame *)v35 camera];
        uint64_t v183 = [v182 trackingStateReason];
        BOOL v384 = v183 == 4;
        if (v183 == 4)
        {
          v184 = [(ARFrame *)v35 camera];
          BOOL v185 = [v184 trackingState] == 1;

          if (!v185)
          {
            BOOL v384 = 0;
LABEL_176:
            v186 = v414;
LABEL_177:
            v187 = [(ARSession *)v186 technique];
            v373 = [v187 techniqueOfClass:objc_opt_class()];

            if (v373) {
              int v188 = [v373 finishedLoadingImages] ^ 1;
            }
            else {
              int v188 = 0;
            }
            v189 = [(ARSession *)v414 technique];
            v366 = [v189 techniqueOfClass:objc_opt_class()];

            if (v366) {
              int v190 = [v366 finishedLoadingObjects] ^ 1;
            }
            else {
              int v190 = 0;
            }
            if ((v188 | v190) == 1)
            {
              v191 = [(ARFrame *)v35 camera];
              BOOL v192 = [v191 trackingState] == 0;

              if (!v192)
              {
                v193 = [(ARFrame *)v35 camera];
                [v193 setTrackingState:1];

                v194 = [(ARFrame *)v35 camera];
                [v194 setTrackingStateReason:1];
              }
            }
            locationa = (id *)&v414->_lastProcessedFrame;
            v195 = [(ARFrame *)v414->_lastProcessedFrame camera];
            uint64_t v196 = [v195 trackingState];
            v197 = [(ARFrame *)v35 camera];
            if (v196 == [v197 trackingState])
            {
              v198 = [*locationa camera];
              uint64_t v199 = [v198 trackingStateReason];
              v200 = [(ARFrame *)v35 camera];
              BOOL v377 = v199 != [v200 trackingStateReason];
            }
            else
            {
              BOOL v377 = 1;
            }

            v201 = [(ARSession *)v414 geoTrackingTechnique];
            if (v201)
            {
              v202 = [(ARFrame *)v35 geoTrackingStatus];
              BOOL v203 = v202 == 0;

              if (v203)
              {
                v204 = +[ARGeoTrackingStatus initialStatus];
                [(ARFrame *)v35 setGeoTrackingStatus:v204];
              }
            }
            v205 = [(ARFrame *)v35 geoTrackingStatus];

            if (!v205)
            {
              int v365 = 0;
              goto LABEL_201;
            }
            v206 = [*locationa geoTrackingStatus];
            BOOL v207 = v206 == 0;

            if (v207)
            {
              int v365 = 1;
            }
            else
            {
              v208 = [(ARFrame *)v35 geoTrackingStatus];
              uint64_t v209 = [*locationa geoTrackingStatus];
              int v210 = [v208 isEqual:v209];

              v211 = [(ARFrame *)v35 geoTrackingStatus];
              v212 = [*locationa geoTrackingStatus];
              LOBYTE(v209) = [v211 isEqualPrivate:v212];

              int v365 = v210 ^ 1;
              if (v209) {
                goto LABEL_201;
              }
            }
            v213 = _ARLogSession_0();
            if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
            {
              v214 = (objc_class *)objc_opt_class();
              NSStringFromClass(v214);
              id v215 = (id)objc_claimAutoreleasedReturnValue();
              v405 = [(ARFrame *)v35 geoTrackingStatus];
              NSStringFromARGeoTrackingState([v405 state]);
              id v216 = (id)objc_claimAutoreleasedReturnValue();
              v401 = [(ARFrame *)v35 geoTrackingStatus];
              NSStringFromARGeoTrackingStateReason([v401 stateReason]);
              id v217 = (id)objc_claimAutoreleasedReturnValue();
              v218 = [(ARFrame *)v35 geoTrackingStatus];
              NSStringFromARGeoTrackingAccuracy([v218 accuracy]);
              id v219 = (id)objc_claimAutoreleasedReturnValue();
              v220 = [(ARFrame *)v35 geoTrackingStatus];
              NSStringFromARGeoTrackingInternalFailureReason([v220 failureReasons]);
              id v221 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138544642;
              *(void *)&uint8_t buf[4] = v215;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v414;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v216;
              LOWORD(v470[0]) = 2112;
              *(void *)((char *)v470 + 2) = v217;
              WORD5(v470[0]) = 2112;
              *(void *)((char *)v470 + 12) = v219;
              WORD2(v470[1]) = 2112;
              *(void *)((char *)&v470[1] + 6) = v221;
              _os_log_impl(&dword_1B88A2000, v213, OS_LOG_TYPE_INFO, "%{public}@ <%p>: GeoTrackingStatus changed: (%@), reason: (%@), accuracy: (%@), internal: (%@)", buf, 0x3Eu);
            }
LABEL_201:
            v222 = v414;
            if ([v413 didRelocalize])
            {
              os_unfair_lock_lock(&v414->_worldMapSurfaceDataLock);
              v223 = [v413 worldMap];
              v224 = [v223 surfaceData];
              if (v224)
              {
                BOOL v225 = [(ARWorldTrackingTechnique *)v414->_worldTrackingTechnique hasLoadedSurfaceData];

                v222 = v414;
                if (!v225)
                {
                  [(ARFrame *)v35 timestamp];
                  kdebug_trace();
                  worldTrackingTechnique = v414->_worldTrackingTechnique;
                  v227 = [v413 worldMap];
                  v228 = [v227 surfaceData];
                  [(ARWorldTrackingTechnique *)worldTrackingTechnique loadSurfaceData:v228];

                  dispatch_semaphore_wait((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
                  long long v428 = 0u;
                  long long v429 = 0u;
                  long long v430 = 0u;
                  long long v431 = 0u;
                  v229 = [(ARFrame *)v35 anchors];
                  uint64_t v230 = [v229 countByEnumeratingWithState:&v428 objects:v464 count:16];
                  if (v230)
                  {
                    uint64_t v231 = *(void *)v429;
                    do
                    {
                      for (iuint64_t i = 0; ii != v230; ++ii)
                      {
                        if (*(void *)v429 != v231) {
                          objc_enumerationMutation(v229);
                        }
                        uint64_t v233 = *(void *)(*((void *)&v428 + 1) + 8 * ii);
                        objc_opt_class();
                        if (objc_opt_isKindOfClass()) {
                          [(ARFrameContextHandler *)v414->_frameContextHandler removeAnchor:v233];
                        }
                      }
                      uint64_t v230 = [v229 countByEnumeratingWithState:&v428 objects:v464 count:16];
                    }
                    while (v230);
                  }

                  v222 = v414;
                  dispatch_semaphore_signal((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore);
                  [(ARFrame *)v35 timestamp];
                  kdebug_trace();
                }
              }
              else
              {

                v222 = v414;
              }
              os_unfair_lock_unlock(&v414->_worldMapSurfaceDataLock);
            }
            [(ARSession *)v222 _updateOriginTransformForFrame:v35 previousFrame:v222->_lastProcessedFrame modifiers:v368 context:v413];
            if ([(ARFrame *)v35 referenceOriginTransformAvailable])
            {
              if ([v413 worldAlignment] == 2)
              {
                v234 = [(ARFrame *)v35 camera];
                objc_msgSend(v234, "setTransform:", *MEMORY[0x1E4F149A0], *(double *)(MEMORY[0x1E4F149A0] + 16), *(double *)(MEMORY[0x1E4F149A0] + 32), *(double *)(MEMORY[0x1E4F149A0] + 48));
              }
              else
              {
                [(ARFrame *)v35 referenceOriginTransform];
                float32x4_t v402 = v236;
                float32x4_t v406 = v235;
                float32x4_t v393 = v238;
                float32x4_t v396 = v237;
                v234 = [(ARFrame *)v35 camera];
                [v234 transform];
                uint64_t v239 = 0;
                v460.columns[0] = v240;
                v460.columns[1] = v241;
                v460.columns[2] = v242;
                v460.columns[3] = v243;
                memset(buf, 0, sizeof(buf));
                memset(v470, 0, sizeof(v470));
                do
                {
                  *(float32x4_t *)&buf[v239 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v406, COERCE_FLOAT(*(_OWORD *)&v460.columns[v239])), v402, *(float32x2_t *)v460.columns[v239].f32, 1), v396, (float32x4_t)v460.columns[v239], 2), v393, (float32x4_t)v460.columns[v239], 3);
                  ++v239;
                }
                while (v239 != 4);
                double v403 = *(double *)&buf[16];
                double v407 = *(double *)buf;
                double v394 = *(double *)&v470[1];
                double v397 = *(double *)v470;
                v244 = [(ARFrame *)v35 camera];
                objc_msgSend(v244, "setTransform:", v407, v403, v397, v394);
              }
              if (v414->_worldTrackingTechnique)
              {
                [(ARFrame *)v35 referenceOriginTransform];
                -[ARWorldTrackingTechnique setReferenceOriginTransform:](v414->_worldTrackingTechnique, "setReferenceOriginTransform:");
              }
            }
            v395 = objc_msgSend(obj, "ar_firstObjectPassingTest:", &__block_literal_global_247);
            v245 = [v395 resultDataOfClass:objc_opt_class()];
            v404 = objc_msgSend(v245, "ar_firstObjectPassingTest:", &__block_literal_global_251);

            if (v404)
            {
              v246 = objc_alloc_init(ARRawSceneUnderstandingData);
              if ([v404 segmentationBuffer])
              {
                -[ARRawSceneUnderstandingData setSemanticSegmentationBuffer:](v246, "setSemanticSegmentationBuffer:", [v404 segmentationBuffer]);
                -[ARRawSceneUnderstandingData setSemanticSegmentationBufferSampledForDepth:](v246, "setSemanticSegmentationBufferSampledForDepth:", [v404 semanticsSampledForDepth]);
                -[ARRawSceneUnderstandingData setSemanticSegmentationConfidenceBuffer:](v246, "setSemanticSegmentationConfidenceBuffer:", [v404 confidenceBuffer]);
                -[ARRawSceneUnderstandingData setSemanticSegmentationConfidenceBufferSampledForDepth:](v246, "setSemanticSegmentationConfidenceBufferSampledForDepth:", [v404 confidenceSampledForDepth]);
                -[ARRawSceneUnderstandingData setSemanticSegmentationUncertaintyBuffer:](v246, "setSemanticSegmentationUncertaintyBuffer:", [v404 uncertaintyBuffer]);
              }
              v247 = [v395 resultDataOfClass:objc_opt_class()];
              v248 = objc_msgSend(v247, "ar_firstObjectPassingTest:", &__block_literal_global_256_0);

              if (v248)
              {
                -[ARRawSceneUnderstandingData setDepthBuffer:](v246, "setDepthBuffer:", [v248 singleFrameDepthBuffer]);
                -[ARRawSceneUnderstandingData setDepthConfidenceBuffer:](v246, "setDepthConfidenceBuffer:", [v248 singleFrameConfidenceBuffer]);
              }
              if (ARDeviceSupportsJasper()) {
                uint64_t v249 = [v248 normalsBuffer];
              }
              else {
                uint64_t v249 = [v404 normalsBuffer];
              }
              [(ARRawSceneUnderstandingData *)v246 setNormalsBuffer:v249];
              v250 = [v395 resultDataOfClass:objc_opt_class()];
              v251 = [v250 firstObject];

              if (v251)
              {
                [v251 timestamp];
                -[ARRawSceneUnderstandingData setTimestamp:](v246, "setTimestamp:");
                -[ARRawSceneUnderstandingData setCapturedImage:](v246, "setCapturedImage:", [v251 pixelBuffer]);
              }
              v252 = [v395 resultDataOfClass:objc_opt_class()];
              v253 = [v252 firstObject];

              if (v253) {
                BOOL v254 = v251 != 0;
              }
              else {
                BOOL v254 = 0;
              }
              if (v254)
              {
                id v255 = [[ARCamera alloc] initFromImageData:v251];
                [(ARFrame *)v35 referenceOriginTransform];
                float32x4_t v408 = v256;
                float32x4_t v398 = v257;
                float32x4_t v387 = v259;
                float32x4_t v390 = v258;
                [v253 cameraTransform];
                uint64_t v260 = 0;
                v460.columns[0] = v261;
                v460.columns[1] = v262;
                v460.columns[2] = v263;
                v460.columns[3] = v264;
                memset(buf, 0, sizeof(buf));
                memset(v470, 0, sizeof(v470));
                do
                {
                  *(float32x4_t *)&buf[v260 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v408, COERCE_FLOAT(*(_OWORD *)&v460.columns[v260])), v398, *(float32x2_t *)v460.columns[v260].f32, 1), v390, (float32x4_t)v460.columns[v260], 2), v387, (float32x4_t)v460.columns[v260], 3);
                  ++v260;
                }
                while (v260 != 4);
                objc_msgSend(v255, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)v470, *(double *)&v470[1]);
                [(ARRawSceneUnderstandingData *)v246 setWideCamera:v255];
              }
              BOOL v265 = v253 != 0;
              v266 = [v251 latestUltraWideImage];
              if (!v266) {
                BOOL v265 = 0;
              }

              if (v265)
              {
                v267 = [ARCamera alloc];
                v268 = [v251 latestUltraWideImage];
                id v269 = [(ARCamera *)v267 initFromImageData:v268];

                [(ARRawSceneUnderstandingData *)v246 setUltraWideCamera:v269];
              }
              v270 = [v395 resultDataOfClass:objc_opt_class()];
              v271 = [v270 firstObject];

              if (v271)
              {
                v272 = [v271 latestResizedUltraWideImageData];
                [(ARRawSceneUnderstandingData *)v246 setUltraWideDownscalingResultData:v272];
              }
              [(ARFrame *)v35 setRawSceneUnderstandingData:v246];
            }
            v273 = v414;
            if (v414->_configuredForWorldTracking)
            {
              BOOL v274 = [(ARSession *)v414 is6DofFaceTracking];
              v273 = v414;
              if (!v274)
              {
                [(ARSession *)v414 _updateFeaturePointsForFrame:v35 previousFrame:v414->_lastProcessedFrame trackingStateChanged:v377 context:v413];
                v273 = v414;
              }
            }
            if ([(ARSession *)v273 is6DofFaceTracking])
            {
              v275 = [(ARFrame *)v35 camera];
              [v275 transform];
              double v409 = ARFrontWideCameraTransformFromBackWideAngleCameraTransform(v276, v277, v278, v279);
              double v399 = v280;
              double v388 = v282;
              double v391 = v281;
              v283 = [(ARFrame *)v35 camera];
              objc_msgSend(v283, "setTransform:", v409, v399, v391, v388);
            }
            v284 = [(ARFrame *)v35 lightEstimate];
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              v286 = [(ARFrame *)v35 lightEstimate];
              v287 = [(ARFrame *)v35 camera];
              v288 = objc_msgSend(v286, "lightEstimateByApplyingRotation:", ARMatrix3x3FromMatrix4x4(objc_msgSend(v287, "transform")));
              [(ARFrame *)v35 setLightEstimate:v288];
            }
            v289 = [(ARFrame *)v414->_lastProcessedFrame anchors];
            [v289 count];
            kdebug_trace();

            v290 = [(ARFrame *)v414->_lastProcessedFrame anchors];
            [(ARFrame *)v35 setAnchors:v290];

            v291 = [(ARFrame *)v414->_lastProcessedFrame privateAnchors];
            [(ARFrame *)v35 setPrivateAnchors:v291];

            v400 = objc_opt_new();
            v389 = objc_opt_new();
            v410 = objc_opt_new();
            v392 = objc_opt_new();
            [(ARSession *)v414 _updateAnchorsForFrame:v35 resultDatas:obj context:v413 addedAnchors:v400 updatedAnchors:v389 removedAnchors:v410 externalAnchors:v392];
            v292 = [(ARFrame *)v35 anchors];
            [v292 count];
            kdebug_trace();

            if (v377)
            {
              v293 = [(ARFrame *)v35 camera];
              if ([v293 trackingState])
              {
                v294 = [(ARFrame *)v35 camera];
                BOOL v295 = [v294 trackingStateReason] == 1;

                if (!v295) {
                  goto LABEL_265;
                }
              }
              else
              {
              }
              if (*locationa)
              {
                v296 = [*locationa camera];
                if (![v296 trackingState])
                {

                  goto LABEL_265;
                }
                v297 = [*locationa camera];
                BOOL v298 = [v297 trackingStateReason] == 1;

                if (v298) {
                  goto LABEL_265;
                }
              }
              [(ARFrame *)v35 timestamp];
              v414->_currentTrackingStartingTimestamp = v299;
            }
LABEL_265:
            if (![(ARFrame *)v35 isHighResolution])
            {
              objc_storeStrong(locationa, v35);
              [(ARFrame *)v35 timestamp];
              kdebug_trace();
            }
            BOOL v300 = [(ARSession *)v414 relocalizing];
            [(ARSession *)v414 setRelocalizing:v384];
            int v301 = v384 ^ v300;
            int v369 = v384 ^ v300;
            if ((v384 & (v384 ^ v300)) == 1)
            {
              v302 = _ARLogSession_0();
              if (os_log_type_enabled(v302, OS_LOG_TYPE_INFO))
              {
                v303 = (objc_class *)objc_opt_class();
                NSStringFromClass(v303);
                id v304 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                *(void *)&uint8_t buf[4] = v304;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v414;
                _os_log_impl(&dword_1B88A2000, v302, OS_LOG_TYPE_INFO, "%{public}@ <%p>: world tracking did start relocalizing", buf, 0x16u);
              }
              v305 = [v413 worldMap];

              if (v305)
              {
                v306 = v414;
                v414->_relocalizationRequested = 1;
              }
              else
              {
                uint64_t v313 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:v414->_defaultRelocalizationDuration];
                relocalizationTimeoutDate = v414->_relocalizationTimeoutDate;
                v414->_relocalizationTimeoutDate = (NSDate *)v313;

                [(ARSession *)v414 _sessionShouldAttemptRelocalization];
                v306 = v414;
              }
            }
            else if (v384)
            {
              v306 = v414;
              if (!v414->_relocalizationRequested)
              {
                [(NSDate *)v414->_relocalizationTimeoutDate timeIntervalSinceNow];
                v306 = v414;
                if (v307 < 0.0)
                {
                  v308 = v414->_relocalizationTimeoutDate;
                  v414->_relocalizationTimeoutDate = 0;

                  v306 = v414;
                  stateQueue = v414->_stateQueue;
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_261;
                  block[3] = &unk_1E61851B0;
                  void block[4] = v414;
                  dispatch_async(stateQueue, block);
                }
              }
            }
            else
            {
              v306 = v414;
              if (v301)
              {
                v310 = _ARLogSession_0();
                if (os_log_type_enabled(v310, OS_LOG_TYPE_DEBUG))
                {
                  v311 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v311);
                  id v312 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138543618;
                  *(void *)&uint8_t buf[4] = v312;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v414;
                  _os_log_impl(&dword_1B88A2000, v310, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: world tracking ended relocalization", buf, 0x16u);
                }
                v306 = v414;
                v414->_relocalizationRequested = 0;
              }
            }
            [(ARSessionMetrics *)v306->_metrics sessionDidUpdateFrame:v35];
            v385 = v414->_worldTrackingTechnique;
            dispatch_semaphore_signal((dispatch_semaphore_t)v414->_lastProcessedFrameSemaphore);
            if ([v392 count])
            {
              v315 = (void *)[v392 copy];
              [(ARSession *)v414 _sessionDidUpdateExternalAnchors:v315];

              long long v425 = 0u;
              long long v426 = 0u;
              long long v423 = 0u;
              long long v424 = 0u;
              id v316 = v392;
              uint64_t v317 = [v316 countByEnumeratingWithState:&v423 objects:v463 count:16];
              if (v317)
              {
                uint64_t v318 = *(void *)v424;
                do
                {
                  for (juint64_t j = 0; jj != v317; ++jj)
                  {
                    if (*(void *)v424 != v318) {
                      objc_enumerationMutation(v316);
                    }
                    v320 = *(void **)(*((void *)&v423 + 1) + 8 * jj);
                    v321 = _ARLogSession_0();
                    if (os_log_type_enabled(v321, OS_LOG_TYPE_DEBUG))
                    {
                      v322 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v322);
                      id v323 = (id)objc_claimAutoreleasedReturnValue();
                      v324 = [v320 description];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v323;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v414;
                      *(_WORD *)&buf[22] = 2112;
                      *(void *)&buf[24] = v324;
                      _os_log_impl(&dword_1B88A2000, v321, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: External anchor updated: %@", buf, 0x20u);
                    }
                  }
                  uint64_t v317 = [v316 countByEnumeratingWithState:&v423 objects:v463 count:16];
                }
                while (v317);
              }
            }
            if ([v410 count])
            {
              v325 = (void *)[v410 copy];
              [(ARSession *)v414 _sessionDidRemoveAnchors:v325];

              long long v421 = 0u;
              long long v422 = 0u;
              long long v419 = 0u;
              long long v420 = 0u;
              id v326 = v410;
              uint64_t v327 = [v326 countByEnumeratingWithState:&v419 objects:v462 count:16];
              if (v327)
              {
                uint64_t v328 = *(void *)v420;
                do
                {
                  for (kuint64_t k = 0; kk != v327; ++kk)
                  {
                    if (*(void *)v420 != v328) {
                      objc_enumerationMutation(v326);
                    }
                    v330 = *(void **)(*((void *)&v419 + 1) + 8 * kk);
                    v331 = _ARLogSession_0();
                    if (os_log_type_enabled(v331, OS_LOG_TYPE_DEBUG))
                    {
                      v332 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v332);
                      id v333 = (id)objc_claimAutoreleasedReturnValue();
                      v334 = [v330 description];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v333;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v414;
                      *(_WORD *)&buf[22] = 2112;
                      *(void *)&buf[24] = v334;
                      _os_log_impl(&dword_1B88A2000, v331, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor removed: %@", buf, 0x20u);
                    }
                  }
                  uint64_t v327 = [v326 countByEnumeratingWithState:&v419 objects:v462 count:16];
                }
                while (v327);
              }
            }
            if ([v400 count])
            {
              v335 = (void *)[v400 copy];
              [(ARSession *)v414 _sessionDidAddAnchors:v335];

              long long v417 = 0u;
              long long v418 = 0u;
              long long v415 = 0u;
              long long v416 = 0u;
              id v336 = v400;
              uint64_t v337 = [v336 countByEnumeratingWithState:&v415 objects:v461 count:16];
              if (v337)
              {
                uint64_t v338 = *(void *)v416;
                do
                {
                  for (muint64_t m = 0; mm != v337; ++mm)
                  {
                    if (*(void *)v416 != v338) {
                      objc_enumerationMutation(v336);
                    }
                    v340 = *(void **)(*((void *)&v415 + 1) + 8 * mm);
                    v341 = _ARLogSession_0();
                    if (os_log_type_enabled(v341, OS_LOG_TYPE_DEBUG))
                    {
                      v342 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v342);
                      id v343 = (id)objc_claimAutoreleasedReturnValue();
                      v344 = [v340 description];
                      *(_DWORD *)buf = 138543874;
                      *(void *)&uint8_t buf[4] = v343;
                      *(_WORD *)&buf[12] = 2048;
                      *(void *)&buf[14] = v414;
                      *(_WORD *)&buf[22] = 2112;
                      *(void *)&buf[24] = v344;
                      _os_log_impl(&dword_1B88A2000, v341, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Anchor added: %@", buf, 0x20u);
                    }
                  }
                  uint64_t v337 = [v336 countByEnumeratingWithState:&v415 objects:v461 count:16];
                }
                while (v337);
              }
            }
            if ([v389 count])
            {
              v345 = (void *)[v389 copy];
              [(ARSession *)v414 _sessionDidUpdateAnchors:v345];
            }
            if (v377)
            {
              v346 = [(ARFrame *)v35 camera];
              [(ARSession *)v414 _sessionCameraDidChangeTrackingState:v346];
            }
            if (v365)
            {
              v347 = [(ARFrame *)v35 geoTrackingStatus];
              [(ARSession *)v414 _sessionDidChangeGeoTrackingStatus:v347];
            }
            if ([(ARFrame *)v35 isHighResolution]) {
              [(ARSession *)v414 _sessionDidCaptureHighResolutionFrame:v35 error:0];
            }
            else {
              [(ARSession *)v414 _sessionDidUpdateFrame:v35];
            }
            kdebug_trace();
            if (!v385) {
              goto LABEL_340;
            }
            if ([v410 count])
            {
              v348 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_264];
              v349 = [v410 filteredArrayUsingPredicate:v348];

              [(ARWorldTrackingTechnique *)v385 removeReferenceAnchors:v349];
            }
            v350 = [(ARFrame *)v35 camera];
            if ([v350 trackingState] == 1)
            {
              v351 = [(ARFrame *)v35 camera];
              if ([v351 trackingStateReason] == 1)
              {

                goto LABEL_339;
              }
              v360 = [(ARFrame *)v35 camera];
              BOOL v361 = [v360 trackingStateReason] == 4;

              if (v361) {
                goto LABEL_340;
              }
            }
            else
            {
            }
            BOOL v352 = [(ARFrame *)v35 referenceOriginTransformUpdated];
            v353 = [(ARFrame *)v35 anchors];
            if ([v353 count]) {
              int v354 = v369 ^ v352;
            }
            else {
              int v354 = 0;
            }

            if (v354)
            {
              v355 = [(ARFrame *)v35 anchors];
              v350 = ARAnchorsForPoseGraphUpdates(v355);

              [(ARWorldTrackingTechnique *)v385 addReferenceAnchors:v350];
              v356 = _ARLogSession_0();
              if (os_log_type_enabled(v356, OS_LOG_TYPE_DEBUG))
              {
                v357 = (objc_class *)objc_opt_class();
                NSStringFromClass(v357);
                id v358 = (id)objc_claimAutoreleasedReturnValue();
                uint64_t v359 = [v350 count];
                *(_DWORD *)buf = 138543874;
                *(void *)&uint8_t buf[4] = v358;
                *(_WORD *)&buf[12] = 2048;
                *(void *)&buf[14] = v414;
                *(_WORD *)&buf[22] = 2048;
                *(void *)&buf[24] = v359;
                _os_log_impl(&dword_1B88A2000, v356, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: all anchors re-added to pose graph updates: %tu", buf, 0x20u);
              }
            }
            else
            {
              if (![v400 count])
              {
LABEL_340:

                goto LABEL_341;
              }
              v350 = ARAnchorsForPoseGraphUpdates(v400);
              [(ARWorldTrackingTechnique *)v385 addReferenceAnchors:v350];
            }
LABEL_339:

            goto LABEL_340;
          }
          v186 = v414;
          if (v414->_relocalizationRequested)
          {
            BOOL v384 = 1;
            goto LABEL_177;
          }
          v182 = [(ARFrame *)v35 camera];
          [v182 setTrackingStateReason:1];
        }

        goto LABEL_176;
      }
      v154 = objc_msgSend(obj, "ar_firstObjectPassingTest:", &__block_literal_global_235_1);
      if (v154)
      {
        v156 = objc_opt_new();
        objc_msgSend(v154, "transformToCVPixelBuffer:depthBuffer:", -[ARFrame segmentationBuffer](v35, "segmentationBuffer"), -[ARFrame estimatedDepthData](v35, "estimatedDepthData"));
        long long v438 = 0u;
        long long v439 = 0u;
        long long v436 = 0u;
        long long v437 = 0u;
        id v157 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v158 = [v157 countByEnumeratingWithState:&v436 objects:v466 count:16];
        if (v158)
        {
          uint64_t v159 = *(void *)v437;
          do
          {
            for (uint64_t nn = 0; nn != v158; ++nn)
            {
              if (*(void *)v437 != v159) {
                objc_enumerationMutation(v157);
              }
              v161 = [[ARPersonMetadata alloc] initWithDepthBasedPersonDetectionResult:*(void *)(*((void *)&v436 + 1) + 8 * nn)];
              [v156 addObject:v161];
            }
            uint64_t v158 = [v157 countByEnumeratingWithState:&v436 objects:v466 count:16];
          }
          while (v158);
        }

        [(ARFrame *)v35 setDetectedPersonMetadata:v156];
      }
    }

    goto LABEL_143;
  }
  uint64_t v17 = [v413 imageData];
  if (([v17 isSecondary] & 1) == 0)
  {

    goto LABEL_23;
  }
  long long v18 = [v413 imageData];
  char v19 = [v18 isHighResolution];

  if (v19) {
    goto LABEL_23;
  }
  dispatch_semaphore_wait((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  objc_storeStrong((id *)&v414->resultDatasOfSecondaryFrameContexts, a4);
  dispatch_semaphore_signal((dispatch_semaphore_t)v414->_resultDataOfSecondaryFrameContextsSemaphore);
  dispatch_semaphore_wait((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  long long v452 = 0u;
  long long v453 = 0u;
  long long v454 = 0u;
  long long v455 = 0u;
  long long v20 = [v413 anchorsToRemove];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v452 objects:v473 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v453;
    do
    {
      for (uint64_t i1 = 0; i1 != v21; ++i1)
      {
        if (*(void *)v453 != v22) {
          objc_enumerationMutation(v20);
        }
        [(ARFrameContextHandler *)v414->_frameContextHandler removeAnchor:*(void *)(*((void *)&v452 + 1) + 8 * i1)];
      }
      uint64_t v21 = [v20 countByEnumeratingWithState:&v452 objects:v473 count:16];
    }
    while (v21);
  }

  __int16 v24 = [v413 anchorsToStopTracking];
  BOOL v25 = [v24 count] == 0;

  if (!v25)
  {
    frameContextHandler = v414->_frameContextHandler;
    uint64_t v27 = [v413 anchorsToStopTracking];
    [(ARFrameContextHandler *)frameContextHandler stopTrackingAnchors:v27];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)v414->_frameContextHandlerSemaphore);
LABEL_341:
}

ARBody2D *__61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  __n128 v3 = [ARBody2D alloc];
  id v4 = [[ARSkeleton2D alloc] initWithDetectedSkeleton:v2];

  uint64_t v5 = [(ARBody2D *)v3 initWithSkeleton2D:v4];
  return v5;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_245(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

BOOL __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_2_249(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 source];
  if (v5 == 2) {
    *a4 = 1;
  }
  return v5 == 2;
}

BOOL __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_3_253(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v5 = [a2 source];
  if (v5 == 2) {
    *a4 = 1;
  }
  return v5 == 2;
}

uint64_t __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_261(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = _ARLogSession_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    __n128 v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    uint64_t v8 = v4;
    __int16 v9 = 2048;
    uint64_t v10 = v5;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_INFO, "%{public}@ <%p>: default relocalization timed out", (uint8_t *)&v7, 0x16u);
  }
  return [*(id *)(*(void *)(a1 + 32) + 8) clearMap];
}

BOOL __61__ARSession_technique_didOutputResultData_timestamp_context___block_invoke_262()
{
  return (objc_opt_respondsToSelector() & 1) == 0;
}

- (void)technique:(id)a3 didFailWithError:(id)a4
{
}

- (__n128)_cameraTransformForResultData:(void *)a3 previousFrame:(void *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v33 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
  long long v35 = *MEMORY[0x1E4F149A0];
  long long v29 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
  long long v31 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v8 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v38;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v38 != v10) {
          objc_enumerationMutation(v6);
        }
        int v12 = *(void **)(*((void *)&v37 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector())
        {
          [v12 cameraTransform];
          long long v33 = v14;
          long long v35 = v13;
          long long v29 = v16;
          long long v31 = v15;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v6 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v9);
  }
  if (!objc_msgSend(v6, "count", v29, v31, v33, v35))
  {
    if (v7)
    {
      uint64_t v17 = [v7 camera];

      if (v17)
      {
        long long v18 = [v7 camera];
        [v18 transform];
        long long v36 = v19;

        goto LABEL_21;
      }
    }
    long long v20 = _ARLogGeneral_26();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      uint64_t v21 = (objc_class *)objc_opt_class();
      uint64_t v22 = NSStringFromClass(v21);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a1;
      _os_log_impl(&dword_1B88A2000, v20, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: prediction failure can lead to no resultData. Falling back to old camera transform", buf, 0x16u);
    }
  }
  if ([v7 referenceOriginTransformAvailable])
  {
    [v7 referenceOriginTransform];
    uint64_t v27 = 0;
    v41[0] = v36;
    v41[1] = v34;
    v41[2] = v32;
    v41[3] = v30;
    memset(buf, 0, sizeof(buf));
    long long v44 = 0u;
    long long v45 = 0u;
    do
    {
      *(float32x4_t *)&buf[v27 * 16] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v23, COERCE_FLOAT(v41[v27])), v24, *(float32x2_t *)&v41[v27], 1), v25, (float32x4_t)v41[v27], 2), v26, (float32x4_t)v41[v27], 3);
      ++v27;
    }
    while (v27 != 4);
    long long v36 = *(_OWORD *)buf;
  }
LABEL_21:

  return (__n128)v36;
}

- (void)_updateOriginTransformForFrame:(id)a3 previousFrame:(id)a4 modifiers:(unint64_t)a5 context:(id)a6
{
  unsigned __int8 v7 = a5;
  uint64_t v118 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (([v12 sessionTransformUpdated] & 1) == 0)
  {
    if ((v7 & 8) != 0)
    {
      [v12 resumeSessionCameraPositionAndHeading];
    }
    else if ((v7 & 4) != 0)
    {
      [v12 resumeSessionCameraPosition];
    }
  }
  if ([v12 didRelocalize])
  {
    long long v13 = [v12 worldMap];

    if (v13)
    {
      long long v14 = [v12 worldMap];
      [v14 referenceOriginTransform];
      simd_float4x4 v120 = __invert_f4(v119);
      objc_msgSend(v10, "setWorldAlignmentTransform:", *(double *)v120.columns[0].i64, *(double *)v120.columns[1].i64, *(double *)v120.columns[2].i64, *(double *)v120.columns[3].i64);

      [v12 resetSessionTransform];
    }
  }
  if (![v12 sessionTransformReset])
  {
    char v18 = [v12 sessionTransformUpdated];
    uint64_t v16 = (v7 >> 1) & 1;
    if (v18)
    {
      [v12 sessionTransform];
      simd_float4x4 v17 = __invert_f4(v121);
      if (!v11)
      {
        char v15 = 1;
        goto LABEL_37;
      }
      *(void *)&long long v104 = v17.columns[1].i64[0];
      *(void *)&long long v108 = v17.columns[2].i64[0];
      *(void *)&long long v112 = v17.columns[0].i64[0];
    }
    else
    {
      if (!v11)
      {
        long long v108 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
        long long v112 = *MEMORY[0x1E4F149A0];
        long long v100 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
        long long v104 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
LABEL_36:
        int v58 = [v11 sessionOriginTransformAvailable];
        char v15 = 0;
        v17.columns[3].i64[0] = v100;
        v17.columns[1].i64[0] = v104;
        v17.columns[2].i64[0] = v108;
        v17.columns[0].i64[0] = v112;
        if (!v58) {
          goto LABEL_38;
        }
LABEL_37:
        objc_msgSend(v10, "setSessionOriginTransform:", *(double *)v17.columns[0].i64, *(double *)v17.columns[1].i64, *(double *)v17.columns[2].i64, *(double *)v17.columns[3].i64);
        goto LABEL_38;
      }
      [v11 sessionOriginTransform];
      *(void *)&long long v108 = v17.columns[2].i64[0];
      *(void *)&long long v112 = v17.columns[0].i64[0];
      *(void *)&long long v104 = v17.columns[1].i64[0];
    }
    *(void *)&long long v100 = v17.columns[3].i64[0];
    if (([v12 sessionTransformShouldResumeCameraHeading] & 1) != 0
      || [v12 sessionTransformShouldResumeCameraPosition])
    {
      long long v19 = [v11 camera];
      [v19 transform];
      __n128 v91 = v21;
      __n128 v94 = v20;
      simd_float4 v87 = v22;
      simd_float4 v97 = v23;

      if ([v11 worldAlignment] == 2)
      {
        objc_msgSend(v11, "gravityAlignedReferenceOriginTransform", *(_OWORD *)&v87, *(_OWORD *)&v91, *(_OWORD *)&v94);
        float32x4_t v95 = v25;
        float32x4_t v98 = v24;
        float32x4_t v88 = v27;
        float32x4_t v92 = v26;
        [v11 referenceOriginTransform];
        simd_float4x4 v123 = __invert_f4(v122);
        uint64_t v28 = 0;
        simd_float4x4 v116 = v123;
        memset(&buf, 0, sizeof(buf));
        do
        {
          buf.columns[v28] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v98, COERCE_FLOAT(*(_OWORD *)&v116.columns[v28])), v95, *(float32x2_t *)v116.columns[v28].f32, 1), v92, (float32x4_t)v116.columns[v28], 2), v88, (float32x4_t)v116.columns[v28], 3);
          ++v28;
        }
        while (v28 != 4);
        __n128 v91 = (__n128)buf.columns[1];
        __n128 v94 = (__n128)buf.columns[0];
        simd_float4 v87 = buf.columns[2];
        simd_float4 v97 = buf.columns[3];
      }
      if (objc_msgSend(v12, "sessionTransformShouldResumeCameraHeading", *(_OWORD *)&v87))
      {
        v29.n128_f64[0] = AREulerAnglesFromMatrix(v94, v91, v89);
        __n128 v89 = v29;
        __float2 v30 = __sincosf_stret(vmuls_lane_f32(0.5, (float32x2_t)v29.n128_u64[0], 1));
        _Q0 = vmulq_n_f32((float32x4_t)xmmword_1B8A2B0D0, v30.__sinval);
        _S2 = _Q0.i32[1];
        _S4 = _Q0.i32[2];
        __asm { FMLS            S3, S4, V0.S[2] }
        float v39 = vmlas_n_f32(vmuls_lane_f32(v30.__cosval, _Q0, 2), _Q0.f32[1], _Q0.f32[0]);
        *(float *)&uint64_t v40 = _S3 + (float)(v30.__cosval * v30.__cosval);
        *((float *)&v40 + 1) = v39 + v39;
        *(void *)&long long v112 = v40;
        float v41 = vmlas_n_f32(-(float)(v30.__cosval * _Q0.f32[2]), _Q0.f32[1], _Q0.f32[0]);
        __asm
        {
          FMLA            S5, S2, V0.S[1]
          FMLS            S5, S0, V0.S[0]
          FMLA            S6, S4, V0.S[1]
        }
        *(float *)&uint64_t v45 = v41 + v41;
        HIDWORD(v45) = _S5;
        __asm
        {
          FMLA            S7, S0, V0.S[2]
          FMLA            S5, S4, V0.S[1]
          FMLA            S1, S4, V0.S[2]
          FMLS            S1, S0, V0.S[0]
          FMLS            S1, S2, V0.S[1]
        }
        *(float *)&uint64_t v51 = _S7 + _S7;
        *((float *)&v51 + 1) = _S5 + _S5;
        *(void *)&long long v104 = v45;
        *(void *)&long long v108 = v51;
        uint64_t v52 = _ARLogSession_0();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          uint64_t v53 = (objc_class *)objc_opt_class();
          BOOL v54 = NSStringFromClass(v53);
          buf.columns[0].i32[0] = 138543874;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v54;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)self;
          buf.columns[1].i16[3] = 2048;
          *(double *)&buf.columns[1].i64[1] = v89.n128_f32[1] * 180.0 / 3.14159265;
          _os_log_impl(&dword_1B88A2000, v52, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updated session heading (%0.2f°)", (uint8_t *)&buf, 0x20u);
        }
        *(void *)&long long v100 = 0;
      }
      if (objc_msgSend(v12, "sessionTransformShouldResumeCameraPosition", *(_OWORD *)&v89))
      {
        uint64_t v55 = _ARLogSession_0();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          uint64_t v56 = (objc_class *)objc_opt_class();
          uint64_t v57 = NSStringFromClass(v56);
          buf.columns[0].i32[0] = 138544386;
          *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v57;
          buf.columns[0].i16[6] = 2048;
          *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)self;
          buf.columns[1].i16[3] = 2048;
          *(double *)&buf.columns[1].i64[1] = v97.f32[0];
          buf.columns[2].i16[0] = 2048;
          *(double *)((char *)buf.columns[2].i64 + 2) = v97.f32[1];
          buf.columns[2].i16[5] = 2048;
          *(double *)((char *)&buf.columns[2].i64[1] + 4) = v97.f32[2];
          _os_log_impl(&dword_1B88A2000, v55, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Updated session origin (%f, %f, %f)", (uint8_t *)&buf, 0x34u);
        }
        uint64_t v16 = 1;
        char v15 = 1;
        v17.columns[2].i64[0] = v108;
        v17.columns[0].i64[0] = v112;
        v17.columns[1].i64[0] = v104;
        v17.columns[3].i64[0] = v97.i64[0];
        goto LABEL_37;
      }
      uint64_t v16 = 1;
      v17.columns[3].i64[0] = v100;
      char v15 = 1;
      goto LABEL_35;
    }
    if (v18)
    {
      char v15 = 1;
      v17.columns[3].i64[0] = v100;
LABEL_35:
      v17.columns[2].i64[0] = v108;
      v17.columns[0].i64[0] = v112;
      v17.columns[1].i64[0] = v104;
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  char v15 = [v11 sessionOriginTransformAvailable];
  uint64_t v16 = [v11 sessionOriginTransformAvailable];
LABEL_38:
  char v59 = objc_msgSend(v10, "worldAlignmentTransformAvailable", *(double *)v17.columns[0].i64, *(double *)v17.columns[1].i64, *(double *)v17.columns[2].i64, *(double *)v17.columns[3].i64);
  if (v7 & 1) != 0 || (v59)
  {
    if ([(ARConfiguration *)self->_configurationInternal worldAlignment] != ARWorldAlignmentCamera) {
      goto LABEL_55;
    }
LABEL_47:
    int v61 = [v10 camera];
    [v61 transform];
    simd_float4x4 v125 = __invert_f4(v124);
    objc_msgSend(v10, "setReferenceOriginTransform:", *(double *)v125.columns[0].i64, *(double *)v125.columns[1].i64, *(double *)v125.columns[2].i64, *(double *)v125.columns[3].i64);

    if (!v16)
    {
      [v10 setReferenceOriginTransformUpdated:1];
      [v10 setReferenceOriginChanged:0];
      goto LABEL_71;
    }
    [v11 sessionOriginTransform];
    float32x4_t v109 = v63;
    float32x4_t v113 = v62;
    float32x4_t v101 = v65;
    float32x4_t v105 = v64;
    [v10 sessionOriginTransform];
    simd_float4x4 v127 = __invert_f4(v126);
    uint64_t v66 = 0;
    simd_float4x4 v116 = v127;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v66] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v113, COERCE_FLOAT(*(_OWORD *)&v116.columns[v66])), v109, *(float32x2_t *)v116.columns[v66].f32, 1), v105, (float32x4_t)v116.columns[v66], 2), v101, (float32x4_t)v116.columns[v66], 3);
      ++v66;
    }
    while (v66 != 4);
    float32x4_t v96 = (float32x4_t)buf.columns[1];
    float32x4_t v99 = (float32x4_t)buf.columns[0];
    float32x4_t v90 = (float32x4_t)buf.columns[3];
    float32x4_t v93 = (float32x4_t)buf.columns[2];
    [v10 worldAlignmentTransform];
    float32x4_t v110 = v68;
    float32x4_t v114 = v67;
    float32x4_t v102 = v70;
    float32x4_t v106 = v69;
    [v11 worldAlignmentTransform];
    simd_float4x4 v129 = __invert_f4(v128);
    uint64_t v71 = 0;
    simd_float4x4 v116 = v129;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v71] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v99, COERCE_FLOAT(*(_OWORD *)&v116.columns[v71])), v96, *(float32x2_t *)v116.columns[v71].f32, 1), v93, (float32x4_t)v116.columns[v71], 2), v90, (float32x4_t)v116.columns[v71], 3);
      ++v71;
    }
    while (v71 != 4);
    uint64_t v72 = 0;
    simd_float4x4 v116 = buf;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v72] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v114, COERCE_FLOAT(*(_OWORD *)&v116.columns[v72])), v110, *(float32x2_t *)v116.columns[v72].f32, 1), v106, (float32x4_t)v116.columns[v72], 2), v102, (float32x4_t)v116.columns[v72], 3);
      ++v72;
    }
    while (v72 != 4);
    objc_msgSend(v10, "setReferenceOriginDelta:", *(double *)buf.columns[0].i64, *(double *)buf.columns[1].i64, *(double *)buf.columns[2].i64, *(double *)buf.columns[3].i64);
    uint64_t v60 = 1;
    goto LABEL_67;
  }
  if ([v11 worldAlignmentTransformAvailable])
  {
    [v11 worldAlignmentTransform];
    objc_msgSend(v10, "setWorldAlignmentTransform:");
  }
  if ([(ARConfiguration *)self->_configurationInternal worldAlignment] == ARWorldAlignmentCamera) {
    goto LABEL_47;
  }
  if ((v15 & 1) == 0)
  {
    if ([v11 referenceOriginTransformAvailable])
    {
      [v11 referenceOriginTransform];
      objc_msgSend(v10, "setReferenceOriginTransform:");
      uint64_t v60 = 0;
      goto LABEL_67;
    }
    uint64_t v60 = 0;
    goto LABEL_56;
  }
LABEL_55:
  uint64_t v60 = 1;
LABEL_56:
  if ([v10 sessionOriginTransformAvailable]
    && [v10 worldAlignmentTransformAvailable])
  {
    [v10 sessionOriginTransform];
    float32x4_t v111 = v74;
    float32x4_t v115 = v73;
    float32x4_t v103 = v76;
    float32x4_t v107 = v75;
    [v10 worldAlignmentTransform];
    simd_float4x4 v131 = __invert_f4(v130);
    uint64_t v77 = 0;
    simd_float4x4 v116 = v131;
    memset(&buf, 0, sizeof(buf));
    do
    {
      buf.columns[v77] = (simd_float4)vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v115, COERCE_FLOAT(*(_OWORD *)&v116.columns[v77])), v111, *(float32x2_t *)v116.columns[v77].f32, 1), v107, (float32x4_t)v116.columns[v77], 2), v103, (float32x4_t)v116.columns[v77], 3);
      ++v77;
    }
    while (v77 != 4);
    v78.columns[2].i64[0] = buf.columns[2].i64[0];
    v78.columns[3].i64[0] = buf.columns[3].i64[0];
    v78.columns[0].i64[0] = buf.columns[0].i64[0];
    v78.columns[1].i64[0] = buf.columns[1].i64[0];
  }
  else if ([v10 sessionOriginTransformAvailable])
  {
    [v10 sessionOriginTransform];
  }
  else
  {
    if (![v10 worldAlignmentTransformAvailable]) {
      goto LABEL_67;
    }
    [v10 worldAlignmentTransform];
    simd_float4x4 v78 = __invert_f4(v132);
  }
  objc_msgSend(v10, "setReferenceOriginTransform:", *(double *)v78.columns[0].i64, *(double *)v78.columns[1].i64, *(double *)v78.columns[2].i64, *(double *)v78.columns[3].i64);
LABEL_67:
  [v10 setReferenceOriginTransformUpdated:v60];
  [v10 setReferenceOriginChanged:v16];
  if (v16)
  {
    CGFloat v79 = _ARLogSession_0();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      __int16 v80 = (objc_class *)objc_opt_class();
      uint64_t v81 = NSStringFromClass(v80);
      [v10 referenceOriginTransform];
      float32x4_t v86 = ARMatrix4x4Description(0, v82, v83, v84, v85);
      buf.columns[0].i32[0] = 138543874;
      *(uint64_t *)((char *)buf.columns[0].i64 + 4) = (uint64_t)v81;
      buf.columns[0].i16[6] = 2048;
      *(uint64_t *)((char *)&buf.columns[0].i64[1] + 6) = (uint64_t)self;
      buf.columns[1].i16[3] = 2112;
      buf.columns[1].i64[1] = (uint64_t)v86;
      _os_log_impl(&dword_1B88A2000, v79, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reference origin changed %@", (uint8_t *)&buf, 0x20u);
    }
  }
LABEL_71:
}

- (void)_updateFeaturePointsForFrame:(id)a3 previousFrame:(id)a4 trackingStateChanged:(BOOL)a5 context:(id)a6
{
  BOOL v6 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (![v9 referenceOriginChanged])
  {
    char v18 = [v9 referenceFeaturePoints];
    if ([v18 count])
    {
      long long v19 = [v10 cachedPointClouds];
      __n128 v20 = [v9 referenceFeaturePoints];
      int v21 = [v19 containsObject:v20] ^ 1;
    }
    else
    {
      int v21 = 0;
    }

    if (v6)
    {
      simd_float4 v22 = [v9 camera];
      uint64_t v23 = [v22 trackingStateReason];

      if (v23 == 1)
      {

        id v10 = 0;
      }
    }
    if (v21)
    {
      float32x4_t v24 = [v10 cachedPointClouds];
      float32x4_t v25 = (void *)[v24 mutableCopy];
      float32x4_t v26 = v25;
      if (v25) {
        id v27 = v25;
      }
      else {
        id v27 = (id)objc_opt_new();
      }
      long long v33 = v27;

      long long v34 = [v9 referenceFeaturePoints];
      [v33 addObject:v34];

      if ((unint64_t)[v33 count] > self->_featurePointAccumulationCount) {
        [v33 removeObjectAtIndex:0];
      }
      [v9 setCachedPointClouds:v33];
      long long v35 = +[ARPointCloud concatPointClouds:v33];
      [v9 setReferenceFeaturePoints:v35];

      [v9 referenceOriginTransformUpdated];
      goto LABEL_27;
    }
    uint64_t v28 = [v9 referenceFeaturePoints];
    if (!v28)
    {
      uint64_t v28 = [v9 camera];
      if ([v28 trackingState] != 2)
      {
        __n128 v29 = [v9 camera];
        if ([v29 trackingStateReason] != 4)
        {
          float v39 = [v9 camera];
          uint64_t v40 = [v39 trackingStateReason];

          if (v40 != 1)
          {
            [v9 setFeaturePoints:0];
LABEL_21:
            if (![v9 referenceOriginTransformUpdated]) {
              goto LABEL_31;
            }
            goto LABEL_27;
          }
LABEL_20:
          __float2 v30 = [v10 cachedPointClouds];
          [v9 setCachedPointClouds:v30];

          long long v31 = [v10 referenceFeaturePoints];
          [v9 setReferenceFeaturePoints:v31];

          long long v32 = [v10 featurePoints];
          [v9 setFeaturePoints:v32];

          goto LABEL_21;
        }
      }
    }

    goto LABEL_20;
  }
  id v11 = _ARLogSession_0();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = (objc_class *)objc_opt_class();
    long long v13 = NSStringFromClass(v12);
    *(_DWORD *)simd_float4x4 buf = 138543618;
    uint64_t v43 = v13;
    __int16 v44 = 2048;
    uint64_t v45 = self;
    _os_log_impl(&dword_1B88A2000, v11, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Removing previous cached feature points, because reference origin changed", buf, 0x16u);
  }
  long long v14 = [v9 referenceFeaturePoints];

  if (v14)
  {
    char v15 = [v9 referenceFeaturePoints];
    float v41 = v15;
    uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v41 count:1];
    simd_float4x4 v17 = (void *)[v16 mutableCopy];
    [v9 setCachedPointClouds:v17];

LABEL_27:
    int v36 = [v9 referenceOriginTransformAvailable];
    long long v37 = [v9 referenceFeaturePoints];
    if (v36)
    {
      [v9 referenceOriginTransform];
      long long v38 = objc_msgSend(v37, "pointCloudByApplyingTransform:");
      [v9 setFeaturePoints:v38];
    }
    else
    {
      [v9 setFeaturePoints:v37];
    }
  }
LABEL_31:
}

- (void)setGeoTrackingTechnique:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (ARRemoteGeoTrackingTechnique *)a3;
  geoTrackingTechnique = self->_geoTrackingTechnique;
  unsigned __int8 v7 = _ARLogSession_0();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
  if (geoTrackingTechnique == v5)
  {
    if (v8)
    {
      long long v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      int v15 = 138543874;
      uint64_t v16 = v14;
      __int16 v17 = 2048;
      char v18 = self;
      __int16 v19 = 2112;
      __n128 v20 = v5;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: The specified geo tracking technique is already set: %@", (uint8_t *)&v15, 0x20u);
    }
  }
  else
  {
    p_geoTrackingTechnique = &self->_geoTrackingTechnique;
    if (v8)
    {
      id v10 = (objc_class *)objc_opt_class();
      id v11 = NSStringFromClass(v10);
      id v12 = self->_geoTrackingTechnique;
      int v15 = 138544130;
      uint64_t v16 = v11;
      __int16 v17 = 2048;
      char v18 = self;
      __int16 v19 = 2112;
      __n128 v20 = v12;
      __int16 v21 = 2112;
      simd_float4 v22 = v5;
      _os_log_impl(&dword_1B88A2000, v7, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Changing geo tracking technique - old: %@, new: %@", (uint8_t *)&v15, 0x2Au);
    }
    [(ARRemoteTechnique *)*p_geoTrackingTechnique setActive:0];
    objc_storeStrong((id *)&self->_geoTrackingTechnique, a3);
    [(ARRemoteTechnique *)*p_geoTrackingTechnique setActive:1];
  }
}

- (void)_lookupAltitudeAtCoordinate:(CLLocationCoordinate2D)a3 completionHandler:(id)a4
{
}

- (void)_lookupAltitudeForAnchor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  uint64_t v5 = [v4 identifier];
  BOOL v6 = [(ARSession *)self _getGeoAnchorAltitude:v5];
  if (v6)
  {
  }
  else
  {
    char v7 = [v4 isAltitudeLookupInProgress];

    if ((v7 & 1) == 0)
    {
      [v4 setIsAltitudeLookupInProgress:1];
      [v4 coordinate];
      CLLocationDegrees v9 = v8;
      [v4 coordinate];
      CLLocationCoordinate2D v11 = CLLocationCoordinate2DMake(v9, v10);
      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __38__ARSession__lookupAltitudeForAnchor___block_invoke;
      v12[3] = &unk_1E6187370;
      v12[4] = self;
      id v13 = v4;
      CLLocationCoordinate2D v14 = v11;
      -[ARSession _lookupAltitudeAtCoordinate:completionHandler:](self, "_lookupAltitudeAtCoordinate:completionHandler:", v12, v11.latitude, v11.longitude);
    }
  }
}

void __38__ARSession__lookupAltitudeForAnchor___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    [v3 uncertainty];
    if (v5 == -1.0) {
      uint64_t v6 = 2;
    }
    else {
      uint64_t v6 = 1;
    }
    char v7 = [ARAltitudeUndulationPair alloc];
    [v4 altitude];
    double v9 = v8;
    [v4 undulation];
    double v11 = v10;
    id v12 = v7;
    double v13 = v9;
    uint64_t v14 = 0;
    uint64_t v15 = v6;
    goto LABEL_13;
  }
  uint64_t v16 = _ARLogSession_0();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
  {
    __int16 v17 = (objc_class *)objc_opt_class();
    char v18 = NSStringFromClass(v17);
    uint64_t v19 = *(void *)(a1 + 32);
    int v28 = 138543618;
    __n128 v29 = v18;
    __int16 v30 = 2048;
    uint64_t v31 = v19;
    _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to look up altitude or undulation for anchor", (uint8_t *)&v28, 0x16u);
  }
  if ([*(id *)(a1 + 40) altitudeSource] != 3) {
    goto LABEL_12;
  }
  double v20 = ARGetFallbackUndulationValue(*(double *)(a1 + 48), *(double *)(a1 + 56));
  __int16 v21 = _ARLogSession_0();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    simd_float4 v22 = (objc_class *)objc_opt_class();
    uint64_t v23 = NSStringFromClass(v22);
    uint64_t v24 = *(void *)(a1 + 32);
    int v28 = 138543875;
    __n128 v29 = v23;
    __int16 v30 = 2048;
    uint64_t v31 = v24;
    __int16 v32 = 2049;
    double v33 = v20;
    _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Falling back to hardcoded undulation value: %{private}f", (uint8_t *)&v28, 0x20u);
  }
  float32x4_t v25 = [[ARAltitudeUndulationPair alloc] initWithAltitude:0 undulation:3 lookupFailed:0.0 source:v20];
  if (!v25)
  {
LABEL_12:
    id v12 = [ARAltitudeUndulationPair alloc];
    double v13 = NAN;
    double v11 = NAN;
    uint64_t v14 = 1;
    uint64_t v15 = 0;
LABEL_13:
    float32x4_t v25 = [(ARAltitudeUndulationPair *)v12 initWithAltitude:v14 undulation:v15 lookupFailed:v13 source:v11];
  }
  float32x4_t v26 = *(void **)(a1 + 32);
  id v27 = [*(id *)(a1 + 40) identifier];
  [v26 _setGeoAnchorAltitude:v27 pair:v25];

  [*(id *)(a1 + 40) setIsAltitudeLookupInProgress:0];
}

- (void)_updateAnchorsForFrame:(id)a3 resultDatas:(id)a4 context:(id)a5 addedAnchors:(id)a6 updatedAnchors:(id)a7 removedAnchors:(id)a8 externalAnchors:(id)a9
{
  uint64_t v9 = MEMORY[0x1F4188790](self, a2, a3, a4, a5, a6, a7, a8);
  double v11 = v10;
  double v13 = v12;
  uint64_t v15 = v14;
  __int16 v17 = v16;
  uint64_t v19 = v18;
  uint64_t v415 = v9;
  uint64_t v519 = *MEMORY[0x1E4F143B8];
  id v21 = v20;
  id v353 = v19;
  id v355 = v17;
  id v354 = v15;
  id v352 = v13;
  id v351 = v11;
  id v350 = a9;
  if ([v21 referenceOriginTransformAvailable])
  {
    [v21 referenceOriginTransform];
    simd_float4x4 v521 = __invert_f4(v520);
    float32x4_t v414 = (float32x4_t)v521.columns[0];
    float32x4_t v409 = (float32x4_t)v521.columns[1];
    float32x4_t v403 = (float32x4_t)v521.columns[3];
    float32x4_t v405 = (float32x4_t)v521.columns[2];
  }
  else
  {
    float32x4_t v414 = *(float32x4_t *)MEMORY[0x1E4F149A0];
    float32x4_t v409 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 16);
    float32x4_t v403 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 48);
    float32x4_t v405 = *(float32x4_t *)(MEMORY[0x1E4F149A0] + 32);
  }
  simd_float4 v22 = [v21 anchors];
  v412 = v21;
  uint64_t v23 = [v21 privateAnchors];
  uint64_t v24 = [v22 arrayByAddingObjectsFromArray:v23];

  v348 = v24;
  float32x4_t v25 = ARDictionaryFromAnchors(v24);
  float32x4_t v408 = [MEMORY[0x1E4F1CA60] dictionary];
  v411 = [MEMORY[0x1E4F1CA60] dictionary];
  double v407 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v416 = [MEMORY[0x1E4F1CA60] dictionary];
  float32x4_t v26 = *(void **)(v415 + 128);
  if (v26
    && (objc_msgSend(v26, "worldTrackingState", v24),
        id v27 = objc_claimAutoreleasedReturnValue(),
        v27,
        v27))
  {
    int v28 = [v21 worldTrackingState];
    [v28 originTimestamp];
    double v30 = v29;
    uint64_t v31 = [*(id *)(v415 + 128) worldTrackingState];
    [v31 originTimestamp];
    BOOL v33 = v30 > v32;
  }
  else
  {
    BOOL v33 = 0;
  }
  BOOL v370 = v33;
  long long v492 = 0u;
  long long v491 = 0u;
  long long v490 = 0u;
  long long v489 = 0u;
  uint64_t v34 = objc_msgSend(v25, "allValues", v348);
  uint64_t v35 = [v34 countByEnumeratingWithState:&v489 objects:v515 count:16];
  if (v35)
  {
    uint64_t v36 = v35;
    uint64_t v37 = *(void *)v490;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v490 != v37) {
          objc_enumerationMutation(v34);
        }
        float v39 = *(void **)(*((void *)&v489 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v40 = v39;
          if (([v40 isAltitudeAvailable] & 1) == 0)
          {
            float v41 = [v40 identifier];
            uint64_t v42 = [(id)v415 _getGeoAnchorAltitude:v41];

            if (v42)
            {
              if ([v42 lookupFailed])
              {
                uint64_t v43 = [v40 identifier];
                [v407 setObject:v40 forKey:v43];
              }
              else
              {
                uint64_t v44 = [v42 source];
                [v42 altitude];
                double v46 = v45;
                if ([v40 altitudeSource] == 3)
                {
                  [v40 altitude];
                  double v46 = v47;
                  uint64_t v44 = 3;
                }
                [v40 coordinate];
                double v49 = v48;
                double v51 = v50;
                [v42 undulation];
                objc_msgSend(v40, "initWithCoordinate:altitude:altitudeSource:isAltitudeAvailable:undulation:", v44, 1, v49, v51, v46, v52);
              }
            }
          }
        }
      }
      uint64_t v36 = [v34 countByEnumeratingWithState:&v489 objects:v515 count:16];
    }
    while (v36);
  }

  long long v488 = 0u;
  long long v487 = 0u;
  long long v486 = 0u;
  long long v485 = 0u;
  uint64_t v53 = [v407 allValues];
  uint64_t v54 = [v53 countByEnumeratingWithState:&v485 objects:v514 count:16];
  v413 = v25;
  if (v54)
  {
    uint64_t v55 = v54;
    uint64_t v56 = *(void *)v486;
    do
    {
      for (uint64_t j = 0; j != v55; ++j)
      {
        if (*(void *)v486 != v56) {
          objc_enumerationMutation(v53);
        }
        int v58 = *(void **)(*((void *)&v485 + 1) + 8 * j);
        char v59 = _ARLogSession_0();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
        {
          uint64_t v60 = (objc_class *)objc_opt_class();
          NSStringFromClass(v60);
          id v61 = (id)objc_claimAutoreleasedReturnValue();
          float32x4_t v62 = [v58 identifier];
          *(_DWORD *)simd_float4x4 buf = 138543874;
          *(void *)&uint8_t buf[4] = v61;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v415;
          *(_WORD *)&buf[22] = 2112;
          *(void *)&buf[24] = v62;
          _os_log_impl(&dword_1B88A2000, v59, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Failed to look up geo anchor altitude. Removing anchor: %@", buf, 0x20u);

          float32x4_t v25 = v413;
        }

        float32x4_t v63 = [v58 identifier];
        [v25 removeObjectForKey:v63];

        float32x4_t v64 = [v58 identifier];
        [(id)v415 _removeGeoAnchorAltitude:v64];
      }
      uint64_t v55 = [v53 countByEnumeratingWithState:&v485 objects:v514 count:16];
    }
    while (v55);
  }

  float32x4_t v65 = v355;
  BOOL v66 = v370;
  if (v370)
  {
    long long v484 = 0u;
    long long v483 = 0u;
    long long v482 = 0u;
    long long v481 = 0u;
    float32x4_t v67 = [v25 allValues];
    uint64_t v68 = [v67 countByEnumeratingWithState:&v481 objects:v513 count:16];
    if (v68)
    {
      uint64_t v69 = v68;
      uint64_t v70 = *(void *)v482;
      do
      {
        for (uint64_t k = 0; k != v69; ++k)
        {
          if (*(void *)v482 != v70) {
            objc_enumerationMutation(v67);
          }
          uint64_t v72 = *(void **)(*((void *)&v481 + 1) + 8 * k);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            float32x4_t v73 = (void *)[v72 copy];
            float32x4_t v74 = [v73 identifier];
            [v25 setObject:v73 forKey:v74];

            id v75 = v73;
            [v75 setIsTracked:0];
            float32x4_t v76 = [v75 identifier];
            [v411 setObject:v75 forKey:v76];
          }
        }
        uint64_t v69 = [v67 countByEnumeratingWithState:&v481 objects:v513 count:16];
      }
      while (v69);
    }

    BOOL v66 = v370;
  }
  uint64_t v77 = v412;
  if ([v412 referenceOriginTransformUpdated])
  {
    long long v480 = 0u;
    long long v479 = 0u;
    long long v478 = 0u;
    long long v477 = 0u;
    simd_float4x4 v78 = [v25 allValues];
    uint64_t v374 = [v78 countByEnumeratingWithState:&v477 objects:v512 count:16];
    if (!v374) {
      goto LABEL_79;
    }
    uint64_t v79 = *(void *)v478;
    uint64_t v366 = *(void *)v478;
    while (1)
    {
      uint64_t v80 = 0;
      do
      {
        if (*(void *)v478 != v79) {
          objc_enumerationMutation(v78);
        }
        uint64_t v81 = *(void **)(*((void *)&v477 + 1) + 8 * v80);
        if (!v66 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || (id v82 = v81) == 0)
        {
          id v82 = (id)[v81 copy];
          __n128 v83 = [v82 identifier];
          [v413 setObject:v82 forKey:v83];
        }
        if ([v65 didRelocalize])
        {
          [v82 lastUpdateTimestamp];
          if (v84 > *(double *)(v415 + 240))
          {
            __n128 v85 = _ARLogSession_0();
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              float32x4_t v86 = (objc_class *)objc_opt_class();
              NSStringFromClass(v86);
              id v87 = (id)objc_claimAutoreleasedReturnValue();
              [v82 identifier];
              v89 = float32x4_t v88 = v78;
              [v65 relocalizationDeltaTransform];
              ARMatrix4x4Description(0, v90, v91, v92, v93);
              id v94 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)simd_float4x4 buf = 138544130;
              *(void *)&uint8_t buf[4] = v87;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v415;
              BOOL v66 = v370;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v89;
              LOWORD(v517) = 2112;
              *(void *)((char *)&v517 + 2) = v94;
              _os_log_impl(&dword_1B88A2000, v85, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Relocalization - Anchor (%@) left in place, delta %@", buf, 0x2Au);

              simd_float4x4 v78 = v88;
              uint64_t v79 = v366;

              float32x4_t v65 = v355;
              uint64_t v77 = v412;
            }

            [v65 relocalizationDeltaTransform];
            float32x4_t v391 = v96;
            *(_OWORD *)float32x4_t v396 = v95;
            float32x4_t v378 = v98;
            float32x4_t v386 = v97;
            [v82 referenceTransform];
            uint64_t v99 = 0;
            long long v493 = v100;
            long long v494 = v101;
            long long v495 = v102;
            long long v496 = v103;
            memset(buf, 0, sizeof(buf));
            long long v517 = 0u;
            long long v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v99] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v396, COERCE_FLOAT(*(long long *)((char *)&v493 + v99))), v391, *(float32x2_t *)((char *)&v493 + v99), 1), v386, *(float32x4_t *)((char *)&v493 + v99), 2), v378, *(float32x4_t *)((char *)&v493 + v99), 3);
              v99 += 16;
            }
            while (v99 != 64);
            objc_msgSend(v82, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
            [v77 referenceOriginTransform];
            float32x4_t v392 = v105;
            *(_OWORD *)double v397 = v104;
            float32x4_t v379 = v107;
            float32x4_t v387 = v106;
            [v82 referenceTransform];
            uint64_t v108 = 0;
            long long v493 = v109;
            long long v494 = v110;
            long long v495 = v111;
            long long v496 = v112;
            memset(buf, 0, sizeof(buf));
            long long v517 = 0u;
            long long v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v108] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v397, COERCE_FLOAT(*(long long *)((char *)&v493 + v108))), v392, *(float32x2_t *)((char *)&v493 + v108), 1), v387, *(float32x4_t *)((char *)&v493 + v108), 2), v379, *(float32x4_t *)((char *)&v493 + v108), 3);
              v108 += 16;
            }
            while (v108 != 64);
LABEL_72:
            objc_msgSend(v82, "setTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
            simd_float4x4 v131 = [v82 identifier];
            [v411 setObject:v82 forKey:v131];

            goto LABEL_73;
          }
        }
        if (![v77 referenceOriginChanged]
          || ([v77 referenceOriginDeltaAvailable] & 1) != 0)
        {
          if ([v77 referenceOriginDeltaAvailable])
          {
            [v77 referenceOriginDelta];
            float32x4_t v393 = v114;
            *(_OWORD *)float32x4_t v398 = v113;
            float32x4_t v380 = v116;
            float32x4_t v388 = v115;
            [v82 referenceTransform];
            uint64_t v117 = 0;
            long long v493 = v118;
            long long v494 = v119;
            long long v495 = v120;
            long long v496 = v121;
            memset(buf, 0, sizeof(buf));
            long long v517 = 0u;
            long long v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v117] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v398, COERCE_FLOAT(*(long long *)((char *)&v493 + v117))), v393, *(float32x2_t *)((char *)&v493 + v117), 1), v388, *(float32x4_t *)((char *)&v493 + v117), 2), v380, *(float32x4_t *)((char *)&v493 + v117), 3);
              v117 += 16;
            }
            while (v117 != 64);
            objc_msgSend(v82, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
          }
          [v77 referenceOriginTransform];
          float32x4_t v394 = v123;
          *(_OWORD *)double v399 = v122;
          float32x4_t v381 = v125;
          float32x4_t v389 = v124;
          [v82 referenceTransform];
          uint64_t v126 = 0;
          long long v493 = v127;
          long long v494 = v128;
          long long v495 = v129;
          long long v496 = v130;
          memset(buf, 0, sizeof(buf));
          long long v517 = 0u;
          long long v518 = 0u;
          do
          {
            *(float32x4_t *)&buf[v126] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(*(float32x4_t *)v399, COERCE_FLOAT(*(long long *)((char *)&v493 + v126))), v394, *(float32x2_t *)((char *)&v493 + v126), 1), v389, *(float32x4_t *)((char *)&v493 + v126), 2), v381, *(float32x4_t *)((char *)&v493 + v126), 3);
            v126 += 16;
          }
          while (v126 != 64);
          goto LABEL_72;
        }
        [v82 transform];
        uint64_t v132 = 0;
        long long v493 = v133;
        long long v494 = v134;
        long long v495 = v135;
        long long v496 = v136;
        memset(buf, 0, sizeof(buf));
        long long v517 = 0u;
        long long v518 = 0u;
        do
        {
          *(float32x4_t *)&buf[v132] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v414, COERCE_FLOAT(*(long long *)((char *)&v493 + v132))), v409, *(float32x2_t *)((char *)&v493 + v132), 1), v405, *(float32x4_t *)((char *)&v493 + v132), 2), v403, *(float32x4_t *)((char *)&v493 + v132), 3);
          v132 += 16;
        }
        while (v132 != 64);
        objc_msgSend(v82, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
LABEL_73:

        ++v80;
      }
      while (v80 != v374);
      uint64_t v137 = [v78 countByEnumeratingWithState:&v477 objects:v512 count:16];
      uint64_t v374 = v137;
      if (!v137)
      {
LABEL_79:

        float32x4_t v25 = v413;
        break;
      }
    }
  }
  long long v476 = 0u;
  long long v475 = 0u;
  long long v474 = 0u;
  long long v473 = 0u;
  v138 = [v65 anchorsToRemove];
  uint64_t v139 = [v138 countByEnumeratingWithState:&v473 objects:v511 count:16];
  if (v139)
  {
    uint64_t v140 = v139;
    uint64_t v141 = *(void *)v474;
    do
    {
      for (uint64_t m = 0; m != v140; ++m)
      {
        if (*(void *)v474 != v141) {
          objc_enumerationMutation(v138);
        }
        id v143 = [*(id *)(*((void *)&v473 + 1) + 8 * m) identifier];
        v144 = [v25 objectForKey:v143];

        if (v144)
        {
          id v145 = [v144 identifier];
          [v407 setObject:v144 forKey:v145];

          v146 = [v144 identifier];
          [v25 removeObjectForKey:v146];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v147 = [v144 identifier];
            [(id)v415 _removeGeoAnchorAltitude:v147];
          }
        }
      }
      uint64_t v140 = [v138 countByEnumeratingWithState:&v473 objects:v511 count:16];
    }
    while (v140);
  }

  if (ARLinkedOnOrAfterAzulC())
  {
    long long v472 = 0u;
    long long v471 = 0u;
    long long v470 = 0u;
    long long v469 = 0u;
    v148 = [v65 anchorsToStopTracking];
    uint64_t v149 = [v148 countByEnumeratingWithState:&v469 objects:v510 count:16];
    if (v149)
    {
      uint64_t v150 = v149;
      uint64_t v151 = *(void *)v470;
      do
      {
        for (uint64_t n = 0; n != v150; ++n)
        {
          if (*(void *)v470 != v151) {
            objc_enumerationMutation(v148);
          }
          v153 = [*(id *)(*((void *)&v469 + 1) + 8 * n) identifier];
          v154 = [v25 objectForKey:v153];

          if (objc_opt_respondsToSelector())
          {
            id v155 = v154;
            if ([v155 isTracked])
            {
              v156 = (void *)[v155 copy];
              if (objc_opt_respondsToSelector()) {
                [v156 setIsTracked:0];
              }
              id v157 = [v156 identifier];
              [v413 setObject:v156 forKey:v157];

              uint64_t v158 = [v156 identifier];
              [v411 setObject:v156 forKey:v158];

              float32x4_t v25 = v413;
            }
          }
        }
        uint64_t v150 = [v148 countByEnumeratingWithState:&v469 objects:v510 count:16];
      }
      while (v150);
    }

    float32x4_t v65 = v355;
  }
  uint64_t v159 = [MEMORY[0x1E4F1CA60] dictionary];
  v356 = objc_opt_new();
  if ([v65 didRelocalize])
  {
    v160 = [v65 worldMap];
    v161 = [v160 anchors];
    v162 = ARDictionaryFromAnchors(v161);

    BOOL v163 = v407;
    if ([*(id *)(v415 + 8) isMultiSessionMode]
      && +[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.worldTracking.enableMLCMRelocalization"])
    {
      BOOL v164 = [v355 worldMap];
      v165 = [v164 anchors];
      v166 = ARAnchorsForPoseGraphUpdates(v165);

      long long v468 = 0u;
      long long v467 = 0u;
      long long v466 = 0u;
      long long v465 = 0u;
      id v167 = v166;
      uint64_t v168 = [v167 countByEnumeratingWithState:&v465 objects:v509 count:16];
      if (v168)
      {
        uint64_t v169 = v168;
        uint64_t v170 = *(void *)v466;
        do
        {
          for (iuint64_t i = 0; ii != v169; ++ii)
          {
            if (*(void *)v466 != v170) {
              objc_enumerationMutation(v167);
            }
            double v172 = *(void **)(*((void *)&v465 + 1) + 8 * ii);
            id v173 = _ARLogGeneral_26();
            if (os_log_type_enabled(v173, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v174 = (objc_class *)objc_opt_class();
              NSStringFromClass(v174);
              id v175 = (id)objc_claimAutoreleasedReturnValue();
              v176 = [v172 identifier];
              *(_DWORD *)simd_float4x4 buf = 138543874;
              *(void *)&uint8_t buf[4] = v175;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v415;
              *(_WORD *)&buf[22] = 2114;
              *(void *)&buf[24] = v176;
              _os_log_impl(&dword_1B88A2000, v173, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: skipped adding anchor loaded from world map: %{public}@", buf, 0x20u);
            }
            v177 = [v172 identifier];
            [v162 removeObjectForKey:v177];
          }
          uint64_t v169 = [v167 countByEnumeratingWithState:&v465 objects:v509 count:16];
        }
        while (v169);
      }

      double v178 = v412;
      float32x4_t v25 = v413;
      BOOL v163 = v407;
    }
    else
    {
      double v178 = v412;
    }
  }
  else
  {
    v162 = v159;
    double v178 = v412;
    BOOL v163 = v407;
  }
  v179 = [v178 camera];
  uint64_t v180 = [v179 trackingState];

  if (v180)
  {
    long long v464 = 0u;
    long long v463 = 0u;
    long long v462 = 0u;
    long long v461 = 0u;
    id obj = v353;
    uint64_t v181 = [obj countByEnumeratingWithState:&v461 objects:v508 count:16];
    v182 = v412;
    if (!v181) {
      goto LABEL_155;
    }
    uint64_t v183 = v181;
    uint64_t v390 = *(void *)v462;
    while (1)
    {
      for (juint64_t j = 0; jj != v183; ++jj)
      {
        if (*(void *)v462 != v390) {
          objc_enumerationMutation(obj);
        }
        BOOL v185 = *(void **)(*((void *)&v461 + 1) + 8 * jj);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v186 = v185;
          v187 = [v182 camera];
          [v186 setCurrentCamera:v187];
        }
        if (objc_opt_respondsToSelector())
        {
          if ([(id)v415 isUserFaceTracking])
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              int v188 = [v182 camera];
              [v188 transform];
              double v193 = ARFrontWideCameraTransformFromBackWideAngleCameraTransformWithZFlip(v189, v190, v191, v192);
              double v375 = v194;
              double v382 = v193;
              double v367 = v196;
              double v371 = v195;

              [v182 referenceOriginTransform];
              double v361 = v198;
              double v363 = v197;
              double v357 = v200;
              double v359 = v199;
              v201 = [v25 allValues];
              v202 = objc_msgSend(v185, "anchorsForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v201, v356, v382, v375, v371, v367, v363, v361, v359, v357);
              goto LABEL_135;
            }
          }
          if ([(id)v415 _shouldSkipAnchorCreationForData:v185])
          {
            v202 = 0;
          }
          else
          {
            v201 = [v182 camera];
            [v201 transform];
            double v376 = v204;
            double v383 = v203;
            double v368 = v206;
            double v372 = v205;
            [v182 referenceOriginTransform];
            double v362 = v208;
            double v364 = v207;
            double v358 = v210;
            double v360 = v209;
            v211 = [v25 allValues];
            v202 = objc_msgSend(v185, "anchorsForCameraWithTransform:referenceOriginTransform:existingAnchors:anchorsToRemove:", v211, v356, v383, v376, v372, v368, v364, v362, v360, v358);

LABEL_135:
          }
          long long v460 = 0u;
          long long v459 = 0u;
          long long v458 = 0u;
          long long v457 = 0u;
          id v212 = v202;
          uint64_t v213 = [v212 countByEnumeratingWithState:&v457 objects:v507 count:16];
          if (v213)
          {
            uint64_t v214 = v213;
            uint64_t v215 = *(void *)v458;
            do
            {
              for (kuint64_t k = 0; kk != v214; ++kk)
              {
                if (*(void *)v458 != v215) {
                  objc_enumerationMutation(v212);
                }
                id v217 = *(void **)(*((void *)&v457 + 1) + 8 * kk);
                v218 = [v217 identifier];
                [v162 setObject:v217 forKey:v218];
              }
              uint64_t v214 = [v212 countByEnumeratingWithState:&v457 objects:v507 count:16];
            }
            while (v214);
          }

          v182 = v412;
          float32x4_t v25 = v413;
        }
        if (objc_opt_respondsToSelector())
        {
          [v182 referenceOriginTransform];
          double v377 = v220;
          double v384 = v219;
          double v369 = v222;
          double v373 = v221;
          v223 = [v25 allValues];
          v224 = objc_msgSend(v185, "externalAnchorsWithReferenceOriginTransform:existingAnchors:", v223, v384, v377, v373, v369);

          long long v455 = 0u;
          long long v456 = 0u;
          long long v453 = 0u;
          long long v454 = 0u;
          id v225 = v224;
          uint64_t v226 = [v225 countByEnumeratingWithState:&v453 objects:v506 count:16];
          if (v226)
          {
            uint64_t v227 = v226;
            uint64_t v228 = *(void *)v454;
            do
            {
              for (muint64_t m = 0; mm != v227; ++mm)
              {
                if (*(void *)v454 != v228) {
                  objc_enumerationMutation(v225);
                }
                uint64_t v230 = *(void **)(*((void *)&v453 + 1) + 8 * mm);
                uint64_t v231 = [v230 identifier];
                [v416 setObject:v230 forKey:v231];
              }
              uint64_t v227 = [v225 countByEnumeratingWithState:&v453 objects:v506 count:16];
            }
            while (v227);
          }

          v182 = v412;
        }
      }
      uint64_t v183 = [obj countByEnumeratingWithState:&v461 objects:v508 count:16];
      if (!v183)
      {
LABEL_155:

        BOOL v163 = v407;
        break;
      }
    }
  }
  long long v451 = 0u;
  long long v452 = 0u;
  long long v449 = 0u;
  long long v450 = 0u;
  id v232 = v356;
  uint64_t v233 = [v232 countByEnumeratingWithState:&v449 objects:v505 count:16];
  if (v233)
  {
    uint64_t v234 = v233;
    uint64_t v235 = *(void *)v450;
    do
    {
      for (uint64_t nn = 0; nn != v234; ++nn)
      {
        if (*(void *)v450 != v235) {
          objc_enumerationMutation(v232);
        }
        float32x4_t v237 = [*(id *)(*((void *)&v449 + 1) + 8 * nn) identifier];
        float32x4_t v238 = [v25 objectForKey:v237];

        if (v238)
        {
          uint64_t v239 = [v238 identifier];
          [v163 setObject:v238 forKey:v239];

          simd_float4 v240 = [v238 identifier];
          [v25 removeObjectForKey:v240];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            simd_float4 v241 = [v238 identifier];
            [(id)v415 _removeGeoAnchorAltitude:v241];
          }
        }
      }
      uint64_t v234 = [v232 countByEnumeratingWithState:&v449 objects:v505 count:16];
    }
    while (v234);
  }

  if (([v412 referenceOriginTransformUpdated] & 1) == 0)
  {
    long long v447 = 0u;
    long long v448 = 0u;
    long long v445 = 0u;
    long long v446 = 0u;
    simd_float4 v242 = [v25 allValues];
    uint64_t v243 = [v242 countByEnumeratingWithState:&v445 objects:v504 count:16];
    if (!v243) {
      goto LABEL_179;
    }
    uint64_t v244 = v243;
    uint64_t v245 = *(void *)v446;
    while (1)
    {
      for (uint64_t i1 = 0; i1 != v244; ++i1)
      {
        if (*(void *)v446 != v245) {
          objc_enumerationMutation(v242);
        }
        v247 = *(void **)(*((void *)&v445 + 1) + 8 * i1);
        v248 = [v247 identifier];
        uint64_t v249 = [v162 objectForKey:v248];
        if (v249)
        {
          v250 = (void *)v249;
        }
        else
        {
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();

          if (isKindOfClass) {
            continue;
          }
          v248 = (void *)[v247 copy];
          v250 = [v247 identifier];
          [v25 setObject:v248 forKey:v250];
        }
      }
      uint64_t v244 = [v242 countByEnumeratingWithState:&v445 objects:v504 count:16];
      if (!v244)
      {
LABEL_179:

        break;
      }
    }
  }
  v385 = v232;
  long long v443 = 0u;
  long long v444 = 0u;
  long long v441 = 0u;
  long long v442 = 0u;
  v400 = [v355 anchorsToAdd];
  uint64_t v252 = [v400 countByEnumeratingWithState:&v441 objects:v503 count:16];
  if (v252)
  {
    uint64_t v253 = v252;
    uint64_t v254 = *(void *)v442;
    do
    {
      for (uint64_t i2 = 0; i2 != v253; ++i2)
      {
        if (*(void *)v442 != v254) {
          objc_enumerationMutation(v400);
        }
        float32x4_t v256 = *(void **)(*((void *)&v441 + 1) + 8 * i2);
        float32x4_t v257 = [v256 identifier];
        float32x4_t v258 = [v413 objectForKey:v257];

        if (!v258)
        {
          if ([v412 referenceOriginTransformAvailable])
          {
            [v256 transform];
            uint64_t v259 = 0;
            long long v493 = v260;
            long long v494 = v261;
            long long v495 = v262;
            long long v496 = v263;
            memset(buf, 0, sizeof(buf));
            long long v517 = 0u;
            long long v518 = 0u;
            do
            {
              *(float32x4_t *)&buf[v259] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v414, COERCE_FLOAT(*(long long *)((char *)&v493 + v259))), v409, *(float32x2_t *)((char *)&v493 + v259), 1), v405, *(float32x4_t *)((char *)&v493 + v259), 2), v403, *(float32x4_t *)((char *)&v493 + v259), 3);
              v259 += 16;
            }
            while (v259 != 64);
            objc_msgSend(v256, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
          }
          simd_float4 v264 = [v256 identifier];
          BOOL v265 = [v407 objectForKey:v264];

          if (v265)
          {
            v266 = [v265 identifier];
            [v407 removeObjectForKey:v266];

            v267 = [v256 identifier];
            v268 = v411;
          }
          else
          {
            v267 = [v256 identifier];
            v268 = v408;
          }
          [v268 setObject:v256 forKey:v267];

          id v269 = [v256 identifier];
          [v413 setObject:v256 forKey:v269];
        }
      }
      uint64_t v253 = [v400 countByEnumeratingWithState:&v441 objects:v503 count:16];
    }
    while (v253);
  }

  long long v439 = 0u;
  long long v440 = 0u;
  long long v437 = 0u;
  long long v438 = 0u;
  v401 = [v162 allValues];
  uint64_t v270 = [v401 countByEnumeratingWithState:&v437 objects:v502 count:16];
  if (v270)
  {
    uint64_t v271 = v270;
    uint64_t v272 = *(void *)v438;
    do
    {
      for (uint64_t i3 = 0; i3 != v271; ++i3)
      {
        if (*(void *)v438 != v272) {
          objc_enumerationMutation(v401);
        }
        BOOL v274 = *(void **)(*((void *)&v437 + 1) + 8 * i3);
        if ([v412 referenceOriginTransformAvailable])
        {
          [v274 transform];
          uint64_t v275 = 0;
          long long v493 = v276;
          long long v494 = v277;
          long long v495 = v278;
          long long v496 = v279;
          memset(buf, 0, sizeof(buf));
          long long v517 = 0u;
          long long v518 = 0u;
          do
          {
            *(float32x4_t *)&buf[v275] = vmlaq_laneq_f32(vmlaq_laneq_f32(vmlaq_lane_f32(vmulq_n_f32(v414, COERCE_FLOAT(*(long long *)((char *)&v493 + v275))), v409, *(float32x2_t *)((char *)&v493 + v275), 1), v405, *(float32x4_t *)((char *)&v493 + v275), 2), v403, *(float32x4_t *)((char *)&v493 + v275), 3);
            v275 += 16;
          }
          while (v275 != 64);
          objc_msgSend(v274, "setReferenceTransform:", *(double *)buf, *(double *)&buf[16], *(double *)&v517, *(double *)&v518);
        }
        [v412 timestamp];
        objc_msgSend(v274, "setLastUpdateTimestamp:");
        double v280 = [v274 identifier];
        double v281 = [v413 objectForKey:v280];

        double v282 = [v274 identifier];
        if (v281) {
          v283 = v411;
        }
        else {
          v283 = v408;
        }
        [v283 setObject:v274 forKey:v282];

        v284 = [v274 identifier];
        [v413 setObject:v274 forKey:v284];
      }
      uint64_t v271 = [v401 countByEnumeratingWithState:&v437 objects:v502 count:16];
    }
    while (v271);
  }

  long long v435 = 0u;
  long long v436 = 0u;
  long long v433 = 0u;
  long long v434 = 0u;
  v285 = [v355 collaborationData];
  uint64_t v286 = [v285 countByEnumeratingWithState:&v433 objects:v501 count:16];
  v287 = v413;
  if (v286)
  {
    uint64_t v288 = v286;
    uint64_t v289 = *(void *)v434;
    v395 = v285;
    uint64_t v406 = *(void *)v434;
    do
    {
      uint64_t v290 = 0;
      uint64_t v402 = v288;
      do
      {
        if (*(void *)v434 != v289) {
          objc_enumerationMutation(v285);
        }
        v291 = *(void **)(*((void *)&v433 + 1) + 8 * v290);
        if ([v291 vioDataType] == 1)
        {
          uint64_t v410 = v290;
          v292 = [v291 anchorIdentifier];
          id v293 = [v287 objectForKey:v292];

          int v294 = [v293 isMemberOfClass:objc_opt_class()];
          BOOL v295 = _ARLogSession_0();
          BOOL v296 = os_log_type_enabled(v295, OS_LOG_TYPE_DEBUG);
          if (v294)
          {
            if (v296)
            {
              v297 = (objc_class *)objc_opt_class();
              NSStringFromClass(v297);
              id v298 = (id)objc_claimAutoreleasedReturnValue();
              double v299 = [v293 description];
              *(_DWORD *)simd_float4x4 buf = 138543874;
              *(void *)&uint8_t buf[4] = v298;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v415;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v299;
              _os_log_impl(&dword_1B88A2000, v295, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Sending collaboration data with anchor: %@", buf, 0x20u);

              v287 = v413;
            }

            BOOL v300 = [MEMORY[0x1E4F1CAD0] setWithObject:v293];
            [v291 setAnchors:v300];

            [(id)v415 _sessionDidOutputCollaborationData:v291];
          }
          else
          {
            if (v296)
            {
              v322 = (objc_class *)objc_opt_class();
              NSStringFromClass(v322);
              id v323 = (id)objc_claimAutoreleasedReturnValue();
              v324 = [v291 anchorIdentifier];
              v325 = [v293 description];
              *(_DWORD *)simd_float4x4 buf = 138544130;
              *(void *)&uint8_t buf[4] = v323;
              *(_WORD *)&buf[12] = 2048;
              *(void *)&buf[14] = v415;
              uint64_t v288 = v402;
              *(_WORD *)&buf[22] = 2112;
              *(void *)&buf[24] = v324;
              LOWORD(v517) = 2112;
              *(void *)((char *)&v517 + 2) = v325;
              _os_log_impl(&dword_1B88A2000, v295, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Not sending anchor data, it is not found or not a simple anchor: %@, %@", buf, 0x2Au);

              v287 = v413;
            }
          }
          uint64_t v289 = v406;
        }
        else
        {
          if ([v291 vioDataType] != 3) {
            goto LABEL_247;
          }
          v404 = v291;
          uint64_t v410 = v290;
          int v301 = [MEMORY[0x1E4F1CA80] set];
          long long v429 = 0u;
          long long v430 = 0u;
          long long v431 = 0u;
          long long v432 = 0u;
          v302 = [v287 allValues];
          uint64_t v303 = [v302 countByEnumeratingWithState:&v429 objects:v500 count:16];
          if (v303)
          {
            uint64_t v304 = v303;
            uint64_t v305 = *(void *)v430;
            do
            {
              for (uint64_t i4 = 0; i4 != v304; ++i4)
              {
                if (*(void *)v430 != v305) {
                  objc_enumerationMutation(v302);
                }
                double v307 = *(void **)(*((void *)&v429 + 1) + 8 * i4);
                if ([v307 isMemberOfClass:objc_opt_class()]) {
                  [v301 addObject:v307];
                }
              }
              uint64_t v304 = [v302 countByEnumeratingWithState:&v429 objects:v500 count:16];
            }
            while (v304);
          }

          v308 = (void *)[v301 copy];
          [v404 setAnchors:v308];

          v309 = _ARLogSession_0();
          if (os_log_type_enabled(v309, OS_LOG_TYPE_DEBUG))
          {
            v310 = (objc_class *)objc_opt_class();
            NSStringFromClass(v310);
            id v311 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v312 = [v301 count];
            *(_DWORD *)simd_float4x4 buf = 138543874;
            *(void *)&uint8_t buf[4] = v311;
            *(_WORD *)&buf[12] = 2048;
            *(void *)&buf[14] = v415;
            *(_WORD *)&buf[22] = 2048;
            *(void *)&buf[24] = v312;
            _os_log_impl(&dword_1B88A2000, v309, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Sending registration data with anchors: %tu", buf, 0x20u);
          }
          long long v427 = 0u;
          long long v428 = 0u;
          long long v425 = 0u;
          long long v426 = 0u;
          id v293 = v301;
          uint64_t v313 = [v293 countByEnumeratingWithState:&v425 objects:v499 count:16];
          if (v313)
          {
            uint64_t v314 = v313;
            uint64_t v315 = *(void *)v426;
            do
            {
              for (uint64_t i5 = 0; i5 != v314; ++i5)
              {
                if (*(void *)v426 != v315) {
                  objc_enumerationMutation(v293);
                }
                uint64_t v317 = *(void **)(*((void *)&v425 + 1) + 8 * i5);
                uint64_t v318 = _ARLogSession_0();
                if (os_log_type_enabled(v318, OS_LOG_TYPE_DEBUG))
                {
                  v319 = (objc_class *)objc_opt_class();
                  NSStringFromClass(v319);
                  id v320 = (id)objc_claimAutoreleasedReturnValue();
                  v321 = [v317 description];
                  *(_DWORD *)simd_float4x4 buf = 138543874;
                  *(void *)&uint8_t buf[4] = v320;
                  *(_WORD *)&buf[12] = 2048;
                  *(void *)&buf[14] = v415;
                  *(_WORD *)&buf[22] = 2112;
                  *(void *)&buf[24] = v321;
                  _os_log_impl(&dword_1B88A2000, v318, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Sending registration data with anchor: %@", buf, 0x20u);
                }
              }
              uint64_t v314 = [v293 countByEnumeratingWithState:&v425 objects:v499 count:16];
            }
            while (v314);
          }

          [(id)v415 _sessionDidOutputCollaborationData:v404];
          v287 = v413;
          v285 = v395;
          uint64_t v289 = v406;
          uint64_t v288 = v402;
        }

        uint64_t v290 = v410;
LABEL_247:
        ++v290;
      }
      while (v290 != v288);
      uint64_t v288 = [v285 countByEnumeratingWithState:&v433 objects:v501 count:16];
    }
    while (v288);
  }

  long long v423 = 0u;
  long long v424 = 0u;
  long long v421 = 0u;
  long long v422 = 0u;
  id v326 = [v287 allValues];
  uint64_t v327 = [v326 countByEnumeratingWithState:&v421 objects:v498 count:16];
  if (v327)
  {
    uint64_t v328 = v327;
    uint64_t v329 = *(void *)v422;
    do
    {
      for (uint64_t i6 = 0; i6 != v328; ++i6)
      {
        if (*(void *)v422 != v329) {
          objc_enumerationMutation(v326);
        }
        v331 = *(void **)(*((void *)&v421 + 1) + 8 * i6);
        v332 = [v331 sessionIdentifier];

        if (!v332)
        {
          id v333 = [(id)v415 identifier];
          [v331 setSessionIdentifier:v333];
        }
      }
      uint64_t v328 = [v326 countByEnumeratingWithState:&v421 objects:v498 count:16];
    }
    while (v328);
  }

  long long v419 = 0u;
  long long v420 = 0u;
  long long v417 = 0u;
  long long v418 = 0u;
  v334 = [v407 allValues];
  uint64_t v335 = [v334 countByEnumeratingWithState:&v417 objects:v497 count:16];
  if (v335)
  {
    uint64_t v336 = v335;
    uint64_t v337 = *(void *)v418;
    do
    {
      for (uint64_t i7 = 0; i7 != v336; ++i7)
      {
        if (*(void *)v418 != v337) {
          objc_enumerationMutation(v334);
        }
        [*(id *)(*((void *)&v417 + 1) + 8 * i7) setSessionIdentifier:0];
      }
      uint64_t v336 = [v334 countByEnumeratingWithState:&v417 objects:v497 count:16];
    }
    while (v336);
  }

  v339 = [v287 allValues];
  v340 = ARAnchorsForPublicDelegate(v339);
  [v412 setAnchors:v340];

  v341 = [v287 allValues];
  v342 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_280_0];
  id v343 = [v341 filteredArrayUsingPredicate:v342];

  [v412 setPrivateAnchors:v343];
  v344 = [v408 allValues];
  [v354 addObjectsFromArray:v344];

  v345 = [v411 allValues];
  [v352 addObjectsFromArray:v345];

  v346 = [v407 allValues];
  [v351 addObjectsFromArray:v346];

  v347 = [v416 allValues];
  [v350 addObjectsFromArray:v347];
}

uint64_t __115__ARSession__updateAnchorsForFrame_resultDatas_context_addedAnchors_updatedAnchors_removedAnchors_externalAnchors___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isHiddenFromPublicDelegate];
}

- (void)setAvailableSensors:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v35 = self;
  uint64_t v6 = self->_availableSensors;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v41 objects:v52 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v42 != v9) {
          objc_enumerationMutation(v6);
        }
        double v11 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        if ([v5 indexOfObjectIdenticalTo:v11] == 0x7FFFFFFFFFFFFFFFLL) {
          [v11 setDelegate:0];
        }
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v41 objects:v52 count:16];
    }
    while (v8);
  }
  uint64_t v34 = v5;

  id v12 = self;
  imageSensor = self->_imageSensor;
  self->_imageSensor = 0;

  replaySensor = self->_replaySensor;
  self->_replaySensor = 0;

  objc_storeStrong((id *)&self->_availableSensors, a3);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = self->_availableSensors;
  uint64_t v15 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v51 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    __int16 v17 = 0;
    uint64_t v18 = *(void *)v38;
    uint64_t v19 = off_1E6184000;
    id v20 = off_1E6184000;
    id v21 = &selRef_depthNormalData;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v38 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v37 + 1) + 8 * j);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v23, "setPowerUsage:", -[ARSession powerUsage](v12, "powerUsage", v34));
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_storeStrong((id *)&v35->_imageSensor, v23);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v24 = v21;
          float32x4_t v25 = v20;
          float32x4_t v26 = v19;
          id v27 = v23;

          __int16 v17 = v27;
          uint64_t v19 = v26;
          id v20 = v25;
          id v21 = v24;
          id v12 = v35;
        }
        if (objc_msgSend(v23, "conformsToProtocol:", v21[280], v34))
        {
          id v28 = v23;
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            [v28 setSession:v12];
          }
          double v29 = v12->_replaySensor;
          v12->_replaySensor = (ARReplaySensorProtocol *)v28;
        }
      }
      uint64_t v16 = [(NSArray *)obj countByEnumeratingWithState:&v37 objects:v51 count:16];
    }
    while (v16);
  }
  else
  {
    __int16 v17 = 0;
  }

  double v30 = _ARLogSession_0();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = (objc_class *)objc_opt_class();
    double v32 = NSStringFromClass(v31);
    *(_DWORD *)simd_float4x4 buf = 138543874;
    double v46 = v32;
    __int16 v47 = 2048;
    double v48 = v12;
    __int16 v49 = 2048;
    double v50 = v17;
    _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Setting new location sensor: %p", buf, 0x20u);
  }
  locationSensor = v12->_locationSensor;
  v12->_locationSensor = v17;
}

- (id)replaySensor
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = [(ARSession *)self availableSensors];
  id v3 = (id)[v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v3; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
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

  return v3;
}

- (void)_replaceOrAddSensor:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v6 = self->_availableSensors;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (!v7)
  {

LABEL_13:
    objc_msgSend(v5, "addObject:", v4, (void)v14);
    goto LABEL_14;
  }
  uint64_t v8 = v7;
  char v9 = 0;
  uint64_t v10 = *(void *)v15;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v15 != v10) {
        objc_enumerationMutation(v6);
      }
      id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
      uint64_t v13 = objc_msgSend(v12, "providedDataTypes", (void)v14);
      if (([v4 providedDataTypes] & v13) != 0)
      {
        [v12 stop];
        -[ARSession setRunningSensors:](self, "setRunningSensors:", -[ARSession runningSensors](self, "runningSensors") & ~[v12 providedDataTypes]);
        -[ARSession setPausedSensors:](self, "setPausedSensors:", -[ARSession pausedSensors](self, "pausedSensors") & ~[v12 providedDataTypes]);
        char v9 = 1;
        id v12 = v4;
      }
      [v5 addObject:v12];
    }
    uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  }
  while (v8);

  if ((v9 & 1) == 0) {
    goto LABEL_13;
  }
LABEL_14:
  [(ARSession *)self setAvailableSensors:v5];
}

+ (id)_applySessionOverrides:(id)a3 outError:(id *)a4
{
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (ARRecordingConfiguration *)a3;
  uint64_t v7 = off_1E6184000;
  int64_t v8 = +[ARKitUserDefaults integerForKey:@"com.apple.arkit.session.cameraPosition"];
  if (v8)
  {
    int64_t v9 = v8;
    uint64_t v10 = [(ARRecordingConfiguration *)v6 videoFormat];
    uint64_t v11 = [v10 captureDevicePosition];

    if (v11 != v9)
    {
      [(ARCustomTechniquesConfiguration *)v6 setCameraPosition:v9];
      id v12 = _ARLogSession_0();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v13 = (objc_class *)objc_opt_class();
        long long v14 = NSStringFromClass(v13);
        long long v15 = @"Front";
        *(_DWORD *)simd_float4x4 buf = 138543874;
        __n128 v93 = v14;
        if (v9 == 1) {
          long long v15 = @"Back";
        }
        __int16 v94 = 2048;
        id v95 = a1;
        __int16 v96 = 2112;
        float32x4_t v97 = v15;
        _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Overriding default camera position to %@", buf, 0x20u);
      }
    }
  }
  uint64_t v16 = [(ARRecordingConfiguration *)v6 videoFormat];
  if (v16)
  {
    long long v17 = (void *)v16;
    uint64_t v18 = [(ARRecordingConfiguration *)v6 videoFormat];
    if ([v18 captureDevicePosition] == 1)
    {
      uint64_t v19 = [(ARRecordingConfiguration *)v6 videoFormat];
      id v20 = [v19 captureDeviceType];
      id v21 = (void *)*MEMORY[0x1E4F15830];

      BOOL v31 = v20 == v21;
      uint64_t v7 = off_1E6184000;
      if (!v31) {
        goto LABEL_19;
      }
      long long v17 = +[ARKitUserDefaults valueForKey:@"com.apple.arkit.imagesensor.back.wide.autoFocus"];
      if (!v17)
      {
LABEL_18:

        goto LABEL_19;
      }
      [(ARConfiguration *)v6 setAutoFocusEnabled:+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.imagesensor.back.wide.autoFocus"]];
      uint64_t v18 = _ARLogSession_0();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        simd_float4 v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        BOOL v24 = [(ARConfiguration *)v6 isAutoFocusEnabled];
        float32x4_t v25 = @"disabled";
        *(_DWORD *)simd_float4x4 buf = 138543874;
        __n128 v93 = v23;
        if (v24) {
          float32x4_t v25 = @"enabled";
        }
        __int16 v94 = 2048;
        id v95 = a1;
        __int16 v96 = 2112;
        float32x4_t v97 = v25;
        _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Image sensor auto focus %@ by user defaults", buf, 0x20u);
      }
    }

    goto LABEL_18;
  }
LABEL_19:
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    float32x4_t v26 = +[ARKitUserDefaults objectForKey:@"com.apple.arkit.imagedetection.assetcatalog"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v27 = v26;
      id v28 = [v27 objectForKey:@"path"];
      uint64_t v29 = [v27 objectForKey:@"imageGroup"];
      double v30 = (__CFString *)v29;
      if (v28) {
        BOOL v31 = v29 == 0;
      }
      else {
        BOOL v31 = 1;
      }
      if (v31)
      {
        double v32 = _ARLogSession_0();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v35 = id v34 = a1;
          *(_DWORD *)simd_float4x4 buf = 138543874;
          __n128 v93 = v35;
          __int16 v94 = 2048;
          id v95 = v34;
          __int16 v96 = 2112;
          float32x4_t v97 = @"com.apple.arkit.imagedetection.assetcatalog";
          _os_log_impl(&dword_1B88A2000, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: When using the default '%@' the options 'path' and 'recognition_group_name' need to be specified", buf, 0x20u);

          a1 = v34;
          uint64_t v7 = off_1E6184000;
        }
      }
      else
      {
        char v36 = [v28 isAbsolutePath];
        if ((v36 & 1) == 0)
        {
          long long v37 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
          long long v38 = [v37 lastObject];

          uint64_t v39 = [v38 stringByAppendingPathComponent:v28];

          id v28 = (void *)v39;
        }
        long long v40 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v28];
        double v32 = +[ARReferenceImage referenceImagesInGroupNamed:v30 catalogURL:v40];

        if (v32)
        {
          [(ARRecordingConfiguration *)v6 setDetectionImages:v32];
        }
        else
        {
          long long v41 = _ARLogSession_0();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            long long v42 = (objc_class *)objc_opt_class();
            NSStringFromClass(v42);
            v44 = id v43 = a1;
            *(_DWORD *)simd_float4x4 buf = 138544130;
            __n128 v93 = v44;
            __int16 v94 = 2048;
            id v95 = v43;
            __int16 v96 = 2112;
            float32x4_t v97 = v30;
            __int16 v98 = 2112;
            id v99 = v28;
            _os_log_impl(&dword_1B88A2000, v41, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: No recognition group named '%@' found in '%@'", buf, 0x2Au);

            a1 = v43;
            uint64_t v7 = off_1E6184000;
          }
        }
      }
    }
  }
  double v45 = [(__objc2_class *)v7[21] stringForKey:@"com.apple.arkit.session.replay.filepath"];
  if (!v45) {
    goto LABEL_54;
  }
  double v46 = objc_opt_new();
  if ([(__CFString *)v45 isAbsolutePath])
  {
    [v46 addObject:v45];
  }
  else
  {
    __int16 v47 = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 1uLL, 1);
    double v48 = [v47 lastObject];

    __int16 v49 = NSTemporaryDirectory();
    double v50 = [v49 stringByAppendingPathComponent:v45];
    [v46 addObject:v50];

    double v51 = [v48 stringByAppendingPathComponent:v45];
    [v46 addObject:v51];
  }
  uint64_t v52 = [v46 indexOfObjectPassingTest:&__block_literal_global_441];
  if (v52 != 0x7FFFFFFFFFFFFFFFLL)
  {
    int v58 = [v46 objectAtIndex:v52];
    char v59 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v58];
    uint64_t v60 = (objc_class *)ARReplaySensorClassForMovieURL(v59, a4);
    if (v60)
    {
      id v84 = a1;
      id v61 = (id)[[v60 alloc] initWithSequenceURL:v59 replayMode:0];
      float32x4_t v62 = [(ARRecordingConfiguration *)v6 parentImageSensorSettings];
      [v61 setParentImageSensorSettings:v62];

      if (!v61)
      {
        uint64_t v80 = _ARLogSession_0();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
        {
          uint64_t v81 = (objc_class *)objc_opt_class();
          id v82 = NSStringFromClass(v81);
          *(_DWORD *)simd_float4x4 buf = 138543874;
          __n128 v93 = v82;
          __int16 v94 = 2048;
          id v95 = a1;
          __int16 v96 = 2112;
          float32x4_t v97 = v59;
          _os_log_impl(&dword_1B88A2000, v80, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to create replay sensor for file: %@", buf, 0x20u);
        }
        goto LABEL_67;
      }
      id v91 = v61;
      float32x4_t v63 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v91 count:1];
      [(ARCustomTechniquesConfiguration *)v6 setCustomSensors:v63];
      float32x4_t v64 = _ARLogSession_0();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
      {
        float32x4_t v65 = (objc_class *)objc_opt_class();
        BOOL v66 = NSStringFromClass(v65);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        __n128 v93 = v66;
        __int16 v94 = 2048;
        id v95 = v84;
        __int16 v96 = 2112;
        float32x4_t v97 = (__CFString *)v58;
        _os_log_impl(&dword_1B88A2000, v64, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Forcing replay of sequence instead of live sensor capturing from file: %@", buf, 0x20u);

        uint64_t v7 = off_1E6184000;
      }

      a1 = v84;
    }

    if (!a4) {
      goto LABEL_53;
    }
    goto LABEL_50;
  }
  if (a4)
  {
    uint64_t v53 = v7;
    uint64_t v54 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v89 = *MEMORY[0x1E4F28568];
    uint64_t v55 = [NSString stringWithFormat:@"Replay URL points to a file which does not exist or which the app cannot access: %@", v45];
    __n128 v90 = v55;
    uint64_t v56 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
    uint64_t v57 = v54;
    uint64_t v7 = v53;
    *a4 = [v57 errorWithDomain:@"com.apple.arkit.error" code:102 userInfo:v56];

LABEL_50:
    if (*a4)
    {
      int v58 = _ARLogSession_0();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      {
        float32x4_t v67 = (objc_class *)objc_opt_class();
        uint64_t v68 = NSStringFromClass(v67);
        id v69 = *a4;
        *(_DWORD *)simd_float4x4 buf = 138544130;
        __n128 v93 = v68;
        __int16 v94 = 2048;
        id v95 = a1;
        __int16 v96 = 2112;
        float32x4_t v97 = v45;
        __int16 v98 = 2112;
        id v99 = v69;
        _os_log_impl(&dword_1B88A2000, v58, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Cannot force replay of file %@, because of file issue: %@", buf, 0x2Au);
      }
LABEL_67:

      uint64_t v79 = 0;
      goto LABEL_68;
    }
  }
LABEL_53:

LABEL_54:
  uint64_t v70 = [(__objc2_class *)v7[21] integerForKey:@"com.apple.arkit.session.forceRecording"];
  if (v70)
  {
    uint64_t v71 = v70;
    uint64_t v72 = _ARLogSession_0();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
    {
      float32x4_t v73 = (objc_class *)objc_opt_class();
      float32x4_t v74 = NSStringFromClass(v73);
      *(_DWORD *)simd_float4x4 buf = 138543874;
      __n128 v93 = v74;
      __int16 v94 = 2048;
      id v95 = a1;
      __int16 v96 = 2048;
      float32x4_t v97 = (__CFString *)v71;
      _os_log_impl(&dword_1B88A2000, v72, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Forcing %li second recording", buf, 0x20u);
    }
    id v75 = [[ARRecordingConfiguration alloc] initWithBaseConfiguration:v6 fileURL:0];
    [(ARRecordingConfiguration *)v75 startRecording];
    if (v71 >= 1)
    {
      float32x4_t v76 = [(ARRecordingConfiguration *)v75 recordingTechnique];
      dispatch_time_t v77 = dispatch_time(0, 1000000000 * v71);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __45__ARSession__applySessionOverrides_outError___block_invoke_447;
      block[3] = &unk_1E6186138;
      id v87 = a1;
      uint64_t v88 = v71;
      id v86 = v76;
      id v78 = v76;
      dispatch_after(v77, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
    id v75 = v6;
  }
  if (+[ARQATracer isEnabled]) {
    [(ARConfiguration *)v75 setFrameDebugOptions:[(ARConfiguration *)v75 frameDebugOptions] | 2];
  }
  uint64_t v6 = v75;
  uint64_t v79 = v6;
LABEL_68:

  return v79;
}

uint64_t __45__ARSession__applySessionOverrides_outError___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = (void *)MEMORY[0x1E4F28CB8];
  id v6 = a2;
  uint64_t v7 = [v5 defaultManager];
  uint64_t v8 = [v7 fileExistsAtPath:v6];

  if (v8) {
    *a4 = 1;
  }
  return v8;
}

uint64_t __45__ARSession__applySessionOverrides_outError___block_invoke_447(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = _ARLogSession_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = (objc_class *)objc_opt_class();
    id v4 = NSStringFromClass(v3);
    uint64_t v5 = *(void *)(a1 + 40);
    uint64_t v6 = *(void *)(a1 + 48);
    int v8 = 138543874;
    int64_t v9 = v4;
    __int16 v10 = 2048;
    uint64_t v11 = v5;
    __int16 v12 = 2048;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: Forcing recording end after %li seconds", (uint8_t *)&v8, 0x20u);
  }
  return [*(id *)(a1 + 32) finishRecording];
}

- (void)captureHighResolutionFrameWithCompletion:(void *)completion
{
}

- (void)captureHighResolutionFrameWithPhotoSettings:(id)a3 completion:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if ([(ARSession *)self state])
  {
    if (self->_isHiResFrameCaptureInProgress)
    {
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
      int v8 = [(ARSession *)self delegateQueue];
      int64_t v9 = v8;
      if (!v8)
      {
        int64_t v9 = MEMORY[0x1E4F14428];
        id v10 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_2;
      block[3] = &unk_1E6186510;
      id v26 = v7;
      dispatch_async(v9, block);
      if (!v8) {

      }
      uint64_t v11 = v26;
    }
    else
    {
      id v20 = (void *)MEMORY[0x1BA9C63E0](v7);
      id pendingHiResFrameCaptureCompletionBlock = self->_pendingHiResFrameCaptureCompletionBlock;
      self->_id pendingHiResFrameCaptureCompletionBlock = v20;

      self->_isHiResFrameCaptureInProgress = 1;
      dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
      simd_float4 v22 = [(ARSession *)self availableSensors];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_3;
      v23[3] = &unk_1E61873B8;
      id v24 = v6;
      [v22 enumerateObjectsUsingBlock:v23];

      [(ARSessionMetrics *)self->_metrics recordHiResFrameCapture];
      uint64_t v11 = v24;
    }
  }
  else
  {
    __int16 v12 = NSString;
    uint64_t v13 = ARKitCoreBundle();
    uint64_t v14 = [v13 localizedStringForKey:@"Cannot capture high-resolution frame while the session is paused." value:&stru_1F120C8F0 table:@"Localizable_iOS"];
    uint64_t v11 = [v12 stringWithFormat:v14];

    uint64_t v30 = *MEMORY[0x1E4F28588];
    v31[0] = v11;
    long long v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v31 forKeys:&v30 count:1];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    uint64_t v16 = [(ARSession *)self delegateQueue];
    long long v17 = v16;
    if (!v16)
    {
      long long v17 = MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
    }
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke;
    v27[3] = &unk_1E6187288;
    id v28 = v15;
    id v29 = v7;
    id v19 = v15;
    dispatch_async(v17, v27);
    if (!v16) {
  }
    }
}

void __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  ARErrorWithCodeAndUserInfo(107, *(void **)(a1 + 32));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  ARErrorWithCodeAndUserInfo(106, 0);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

void __68__ARSession_captureHighResolutionFrameWithPhotoSettings_completion___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v6 captureHighResolutionFrameWithPhotoSettings:*(void *)(a1 + 32)];
    *a4 = 1;
  }
}

- (void)_updateSensorsWithConfiguration:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 customSensors];

  if (v5)
  {
    id v6 = [(ARSession *)self availableSensors];
    id v7 = [v4 customSensors];
    if ([v6 isEqualToArray:v7])
    {
      if (([(ARReplaySensorProtocol *)self->_replaySensor finishedReplaying] & 1) == 0)
      {

        goto LABEL_20;
      }
      replaySensor = self->_replaySensor;
      int64_t v9 = [v4 replaySensor];

      if (replaySensor == v9) {
        goto LABEL_42;
      }
    }
    else
    {
    }
    [(ARSession *)self _stopAllSensorsWaitingForOutstandingCallbacks:1];
    id v6 = [v4 customSensors];
    [(ARSession *)self setAvailableSensors:v6];
LABEL_20:

    goto LABEL_42;
  }
  if (!self->_motionManger)
  {
    id v10 = (CMMotionManager *)objc_opt_new();
    motionManger = self->_motionManger;
    self->_motionManger = v10;

    __int16 v12 = _ARLogSession_0();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = (objc_class *)objc_opt_class();
      uint64_t v14 = NSStringFromClass(v13);
      long long v15 = self->_motionManger;
      *(_DWORD *)simd_float4x4 buf = 138543874;
      *(void *)&uint8_t buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = self;
      *(_WORD *)&buf[22] = 2048;
      double v48 = (uint64_t (*)(uint64_t, uint64_t))v15;
      _os_log_impl(&dword_1B88A2000, v12, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating new motion manager %p.", buf, 0x20u);
    }
  }
  uint64_t v16 = [(ARSession *)self configurationInternal];
  long long v17 = [v16 customSensors];
  if (v17)
  {

LABEL_12:
    id v18 = [MEMORY[0x1E4F1CA48] array];
    id v19 = [(ARSession *)self _imageSensorForConfiguration:v4 existingSensor:0];
    if (v19) {
      [v18 addObject:v19];
    }
    if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.useIOKit"])
    {
      id v20 = objc_alloc_init(ARIOMotionSensor);
      id v21 = _ARLogSession_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        simd_float4 v22 = (objc_class *)objc_opt_class();
        uint64_t v23 = NSStringFromClass(v22);
        *(_DWORD *)simd_float4x4 buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using IOKit for motion sensor", buf, 0x16u);
      }
    }
    else
    {
      id v20 = [[ARMotionSensor alloc] initWithMotionManager:self->_motionManger];
      id v21 = _ARLogSession_0();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v24 = (objc_class *)objc_opt_class();
        float32x4_t v25 = NSStringFromClass(v24);
        id v26 = self->_motionManger;
        *(_DWORD *)simd_float4x4 buf = 138543874;
        *(void *)&uint8_t buf[4] = v25;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = self;
        *(_WORD *)&buf[22] = 2048;
        double v48 = (uint64_t (*)(uint64_t, uint64_t))v26;
        _os_log_impl(&dword_1B88A2000, v21, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Using CoreMotion for motion sensor (%p).", buf, 0x20u);
      }
    }

    if (v20) {
      [v18 addObject:v20];
    }
    id v27 = -[ARDeviceOrientationSensor initWithMotionManager:alignment:]([ARDeviceOrientationSensor alloc], "initWithMotionManager:alignment:", self->_motionManger, [v4 worldAlignment]);
    if (v27) {
      [v18 addObject:v27];
    }
    id v28 = objc_opt_new();
    if (v28) {
      [v18 addObject:v28];
    }
    [(ARSession *)self _stopAllSensorsWaitingForOutstandingCallbacks:1];
    [(ARSession *)self setAvailableSensors:v18];

    goto LABEL_42;
  }
  id v29 = [(ARSession *)self availableSensors];
  BOOL v30 = [v29 count] == 0;

  if (v30) {
    goto LABEL_12;
  }
  *(void *)simd_float4x4 buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  double v48 = __Block_byref_object_copy__3;
  __int16 v49 = __Block_byref_object_dispose__3;
  id v50 = 0;
  BOOL v31 = [(ARSession *)self availableSensors];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __45__ARSession__updateSensorsWithConfiguration___block_invoke;
  v42[3] = &unk_1E61873E0;
  v42[4] = buf;
  [v31 enumerateObjectsUsingBlock:v42];

  double v32 = [(ARSession *)self _imageSensorForConfiguration:v4 existingSensor:*(void *)(*(void *)&buf[8] + 40)];
  if (v32)
  {
    BOOL v33 = _ARLogSession_0();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      id v34 = (objc_class *)objc_opt_class();
      uint64_t v35 = NSStringFromClass(v34);
      *(_DWORD *)id v43 = 138543618;
      long long v44 = v35;
      __int16 v45 = 2048;
      double v46 = self;
      _os_log_impl(&dword_1B88A2000, v33, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing image sensor", v43, 0x16u);
    }
    [(ARSession *)self _replaceOrAddSensor:v32];
  }
  char v36 = [(ARSession *)self configurationInternal];
  uint64_t v37 = [v36 worldAlignment];
  LOBYTE(v37) = v37 == [v4 worldAlignment];

  if ((v37 & 1) == 0)
  {
    long long v38 = -[ARDeviceOrientationSensor initWithMotionManager:alignment:]([ARDeviceOrientationSensor alloc], "initWithMotionManager:alignment:", self->_motionManger, [v4 worldAlignment]);
    if (v38)
    {
      uint64_t v39 = _ARLogSession_0();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        long long v40 = (objc_class *)objc_opt_class();
        long long v41 = NSStringFromClass(v40);
        *(_DWORD *)id v43 = 138543618;
        long long v44 = v41;
        __int16 v45 = 2048;
        double v46 = self;
        _os_log_impl(&dword_1B88A2000, v39, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Replacing orientation sensor because alignment has changed", v43, 0x16u);
      }
      [(ARSession *)self _replaceOrAddSensor:v38];
    }
  }
  _Block_object_dispose(buf, 8);

LABEL_42:
}

void __45__ARSession__updateSensorsWithConfiguration___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v7 = a2;
  if ([v7 providedDataTypes])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a4 = 1;
  }
}

- (id)_imageSensorForConfiguration:(id)a3 existingSensor:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = (ARParentImageSensor *)a4;
  id v7 = [a3 parentImageSensorSettings];
  BOOL v8 = [(ARParentImageSensor *)v6 canReconfigure:v7];
  int64_t v9 = _ARLogSession_0();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v10)
    {
      uint64_t v11 = (objc_class *)objc_opt_class();
      __int16 v12 = NSStringFromClass(v11);
      int v19 = 138543618;
      id v20 = v12;
      __int16 v21 = 2048;
      simd_float4 v22 = self;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Reconfiguring existing image sensor based on new settings...", (uint8_t *)&v19, 0x16u);
    }
    [(ARParentImageSensor *)v6 reconfigure:v7];
    uint64_t v13 = v6;
  }
  else
  {
    if (v10)
    {
      uint64_t v14 = (objc_class *)objc_opt_class();
      long long v15 = NSStringFromClass(v14);
      int v19 = 138543618;
      id v20 = v15;
      __int16 v21 = 2048;
      simd_float4 v22 = self;
      _os_log_impl(&dword_1B88A2000, v9, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Creating new image sensor, because settings are changed...", (uint8_t *)&v19, 0x16u);
    }
    uint64_t v13 = [[ARParentImageSensor alloc] initWithSettings:v7];
  }
  uint64_t v16 = v13;
  if (v13 == v6) {
    uint64_t v13 = 0;
  }
  long long v17 = v13;

  return v17;
}

- (void)_startSensorsWithRequiredDataTypes:(unint64_t)a3 optionalDataTypes:(unint64_t)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  unint64_t v4 = a4 | a3;
  if (a4 | a3)
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v5 = _os_activity_create(&dword_1B88A2000, "Start sensors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);

    kdebug_trace();
    id v6 = _ARLogSession_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = (objc_class *)objc_opt_class();
      NSStringFromClass(v7);
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      int64_t v9 = ARSensorDataTypesToString(v4);
      *(_DWORD *)simd_float4x4 buf = 138543874;
      id v46 = v8;
      __int16 v47 = 2048;
      double v48 = self;
      __int16 v49 = 2112;
      id v50 = v9;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Starting sensors with data type(s): %@ …", buf, 0x20u);
    }
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    BOOL v10 = self->_availableSensors;
    uint64_t v11 = 0;
    uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v41;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v41 != v13) {
            objc_enumerationMutation(v10);
          }
          long long v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          if (([v15 providedDataTypes] & v4) != 0)
          {
            [v15 setDelegate:self];
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v16 = v15;
              long long v17 = [(ARSession *)self beforeRunningAVCaptureSession];
              [v16 setBeforeRunningAVCaptureSession:v17];
            }
            [v15 start];
            v11 |= [v15 providedDataTypes];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v40 objects:v55 count:16];
      }
      while (v12);
    }

    [(ARSession *)self setRunningSensors:[(ARSession *)self runningSensors] | v11];
    id v18 = _ARLogSession_0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      id v20 = (id)objc_claimAutoreleasedReturnValue();
      __int16 v21 = ARSensorDataTypesToString(v11);
      *(_DWORD *)simd_float4x4 buf = 138543874;
      id v46 = v20;
      __int16 v47 = 2048;
      double v48 = self;
      __int16 v49 = 2112;
      id v50 = v21;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Started sensors with data type(s): %@", buf, 0x20u);
    }
    simd_float4 v22 = _ARLogSession_0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = (objc_class *)objc_opt_class();
      NSStringFromClass(v23);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      float32x4_t v25 = ARSensorDataTypesToString([(ARSession *)self runningSensors]);
      *(_DWORD *)simd_float4x4 buf = 138543874;
      id v46 = v24;
      __int16 v47 = 2048;
      double v48 = self;
      __int16 v49 = 2112;
      id v50 = v25;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Currently running sensors with data type(s): %@", buf, 0x20u);
    }
    if ((v11 & a3) != a3)
    {
      id v26 = _ARLogSession_0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        id v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        id v29 = ARSensorDataTypesToString(v11 & a3 ^ a3);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        id v46 = v28;
        __int16 v47 = 2048;
        double v48 = self;
        __int16 v49 = 2112;
        id v50 = v29;
        _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Unable to start required sensor(s) %@", buf, 0x20u);
      }
      BOOL v30 = _ARLogSession_0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        BOOL v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(v11);
        id v33 = (id)objc_claimAutoreleasedReturnValue();
        ARSensorDataTypesToString(a3);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = ARSensorDataTypesToString(a4);
        *(_DWORD *)simd_float4x4 buf = 138544386;
        id v46 = v32;
        __int16 v47 = 2048;
        double v48 = self;
        __int16 v49 = 2112;
        id v50 = v33;
        __int16 v51 = 2112;
        id v52 = v34;
        __int16 v53 = 2112;
        uint64_t v54 = v35;
        _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: startedSensorDataTypes: %@  VS.  requiredDataTypes: %@ optionalDataTypes: %@", buf, 0x34u);
      }
      char v36 = ARErrorWithCodeAndUserInfo(101, 0);
      [(ARSession *)self _sessionDidFailWithError:v36];
    }
    [(ARSession *)self runningSensors];
    kdebug_trace();
    os_activity_scope_leave(&state);
  }
}

- (void)_configureSensorsForRecording
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [(ARSession *)self technique];
  unint64_t v4 = [v3 techniqueOfClass:objc_opt_class()];

  if (v4)
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v5 = self->_availableSensors;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v15;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v5);
          }
          BOOL v10 = *(void **)(*((void *)&v14 + 1) + 8 * v9);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend(v10, "setRecordingMode:", 1, (void)v14);
          }
          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v7);
    }

    if (([(ARSession *)self runningSensors] & 0x40) != 0)
    {
      uint64_t v11 = [(ARSession *)self latestLocationData];

      if (v11)
      {
        uint64_t v12 = [(ARSession *)self latestLocationData];
        id v13 = (id)[v4 processData:v12];
      }
    }
  }
}

- (void)_stopSensorsWithDataTypes:(unint64_t)a3 keepingDataTypes:(unint64_t)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    uint64_t v8 = self->_availableSensors;
    uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v40 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v13 = [v12 providedDataTypes];
          if ((v13 & a3) != 0 && (v13 & a4) == 0)
          {
            [v12 setDelegate:0];
            [v7 addObject:v12];
          }
        }
        uint64_t v9 = [(NSArray *)v8 countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v9);
    }

    if ([v7 count])
    {
      state.opaque[0] = 0;
      state.opaque[1] = 0;
      long long v15 = _os_activity_create(&dword_1B88A2000, "Stopping sensors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
      os_activity_scope_enter(v15, &state);

      kdebug_trace();
      long long v16 = _ARLogSession_0();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        long long v17 = (objc_class *)objc_opt_class();
        NSStringFromClass(v17);
        id v18 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v19 = ARSensorDataTypesToString(a3);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        id v45 = v18;
        __int16 v46 = 2048;
        __int16 v47 = self;
        __int16 v48 = 2112;
        __int16 v49 = v19;
        _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopping sensors with data type(s): %@", buf, 0x20u);
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v20 = v7;
      uint64_t v21 = 0;
      uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v20);
            }
            float32x4_t v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            objc_msgSend(v25, "stop", (void)v34);
            v21 |= [v25 providedDataTypes];
          }
          uint64_t v22 = [v20 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v22);
      }

      [(ARSession *)self setRunningSensors:[(ARSession *)self runningSensors] & ~v21];
      [(ARSession *)self setPausedSensors:[(ARSession *)self pausedSensors] & ~v21];
      [(ARSession *)self runningSensors];
      kdebug_trace();
      id v26 = _ARLogSession_0();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        id v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        id v29 = ARSensorDataTypesToString(v21);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        id v45 = v28;
        __int16 v46 = 2048;
        __int16 v47 = self;
        __int16 v48 = 2112;
        __int16 v49 = v29;
        _os_log_impl(&dword_1B88A2000, v26, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopped sensors with data type(s): %@", buf, 0x20u);
      }
      BOOL v30 = _ARLogSession_0();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        BOOL v31 = (objc_class *)objc_opt_class();
        NSStringFromClass(v31);
        id v32 = (id)objc_claimAutoreleasedReturnValue();
        id v33 = ARSensorDataTypesToString([(ARSession *)self runningSensors]);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        id v45 = v32;
        __int16 v46 = 2048;
        __int16 v47 = self;
        __int16 v48 = 2112;
        __int16 v49 = v33;
        _os_log_impl(&dword_1B88A2000, v30, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Currently running sensors with data type(s): %@", buf, 0x20u);
      }
      os_activity_scope_leave(&state);
    }
  }
}

- (void)_stopAllSensorsWaitingForOutstandingCallbacks:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  if ([(NSArray *)self->_availableSensors count])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    uint64_t v5 = _os_activity_create(&dword_1B88A2000, "Stopping all sensors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v5, &state);

    [(ARSession *)self runningSensors];
    kdebug_trace();
    uint64_t v6 = _ARLogSession_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      *(_DWORD *)simd_float4x4 buf = 138543618;
      long long v42 = v8;
      __int16 v43 = 2048;
      long long v44 = self;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopping all sensors", buf, 0x16u);
    }
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v9 = self->_availableSensors;
    uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v40 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v34;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v34 != v11) {
            objc_enumerationMutation(v9);
          }
          [*(id *)(*((void *)&v33 + 1) + 8 * v12++) setDelegate:0];
        }
        while (v10 != v12);
        uint64_t v10 = [(NSArray *)v9 countByEnumeratingWithState:&v33 objects:v40 count:16];
      }
      while (v10);
    }

    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v13 = self->_availableSensors;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v30;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v30 != v15) {
            objc_enumerationMutation(v13);
          }
          [*(id *)(*((void *)&v29 + 1) + 8 * v16++) stop];
        }
        while (v14 != v16);
        uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v29 objects:v39 count:16];
      }
      while (v14);
    }

    if (v3)
    {
      long long v27 = 0u;
      long long v28 = 0u;
      long long v25 = 0u;
      long long v26 = 0u;
      long long v17 = self->_availableSensors;
      uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v38 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v26;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v26 != v19) {
              objc_enumerationMutation(v17);
            }
            uint64_t v21 = *(void **)(*((void *)&v25 + 1) + 8 * v20);
            if (objc_opt_respondsToSelector()) {
              objc_msgSend(v21, "waitForOutstandingCallbacks", (void)v25);
            }
            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [(NSArray *)v17 countByEnumeratingWithState:&v25 objects:v38 count:16];
        }
        while (v18);
      }
    }
    -[ARSession setRunningSensors:](self, "setRunningSensors:", 0, (void)v25);
    [(ARSession *)self setPausedSensors:0];
    [(ARSession *)self runningSensors];
    kdebug_trace();
    uint64_t v22 = _ARLogSession_0();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = (objc_class *)objc_opt_class();
      id v24 = NSStringFromClass(v23);
      *(_DWORD *)simd_float4x4 buf = 138543618;
      long long v42 = v24;
      __int16 v43 = 2048;
      long long v44 = self;
      _os_log_impl(&dword_1B88A2000, v22, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Stopped all sensors", buf, 0x16u);
    }
    os_activity_scope_leave(&state);
  }
}

- (BOOL)isPrimaryImageData:(id)a3
{
  id v4 = a3;
  primaryVideoFormat = self->_primaryVideoFormat;
  BOOL v7 = 1;
  if (primaryVideoFormat)
  {
    uint64_t v6 = [(ARVideoFormat *)primaryVideoFormat captureDevicePosition];
    if (v6 != [v4 cameraPosition] || objc_msgSend(v4, "isHighResolution")) {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (void)sensor:(id)a3 didOutputSensorData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 providedDataTypes];
  kdebug_trace();
  float32x4_t v65 = [(ARSession *)self technique];
  [(ARSession *)self secondaryTechnique];
  v64 = float32x4_t v63 = v6;
  if (self->_techniquesWantPredictedPoseForWideCam
    || ARDeviceSupportsJasper()
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
     || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)))
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = [(ARSession *)self configurationInternal];
    uint64_t v10 = [v9 videoFormat];
    objc_msgSend(v8, "setCameraPosition:", objc_msgSend(v10, "captureDevicePosition"));

    worldTrackingTechnique = self->_worldTrackingTechnique;
    [v7 timestamp];
    uint64_t v12 = -[ARWorldTrackingTechnique predictedResultDataAtTimestamp:context:](worldTrackingTechnique, "predictedResultDataAtTimestamp:context:", v8);
    uint64_t v13 = objc_msgSend(v12, "ar_firstObjectPassingTest:", &__block_literal_global_460);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v14 = v7;
      if (v13)
      {
        [v13 visionCameraTransform];
      }
      else
      {
        long long v15 = *MEMORY[0x1E4F149A0];
        long long v16 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
        long long v17 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
        long long v18 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
      }
      objc_msgSend(v14, "setVisionCameraTransform:", *(double *)&v15, *(double *)&v16, *(double *)&v17, *(double *)&v18);
      [(ARDepthPointCloudCoalescer *)self->_depthPointCloudCoalescer addDepthPointCloudData:v14];
    }
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v28 = [(ARRecordingTechniquePublic *)v65 processData:v7];
    id v29 = (id)[v64 processData:v7];
    goto LABEL_49;
  }
  id v19 = v7;
  if ([(ARSession *)self isPrimaryImageData:v19])
  {
    [v19 timestamp];
    kdebug_trace();
  }
  if (objc_msgSend(v19, "cameraPosition", v63) == 1)
  {
    uint64_t v20 = [v19 cameraType];
    int v21 = ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(v20);

    if (v21)
    {
      if (ARDeviceSupportsJasper())
      {
        uint64_t v22 = [(ARDepthPointCloudCoalescer *)self->_depthPointCloudCoalescer depthPointCloudWithPose:v13 imageData:v19];
        if (v22)
        {
          uint64_t v23 = [[ARPointCloud alloc] initWithDepthPointCloud:v22];
          [v19 setPointCloud:v23];
        }
        if (v13)
        {
          [v13 visionCameraTransform];
        }
        else
        {
          long long v24 = *MEMORY[0x1E4F149A0];
          long long v25 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 16);
          long long v26 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 32);
          long long v27 = *(_OWORD *)(MEMORY[0x1E4F149A0] + 48);
        }
        objc_msgSend(v19, "setVisionTransform:", *(double *)&v24, *(double *)&v25, *(double *)&v26, *(double *)&v27);
      }
      else if (v13)
      {
        [v13 visionCameraTransform];
        objc_msgSend(v19, "setVisionTransform:");
      }
    }
  }
  long long v30 = [v19 cameraType];
  uint64_t v31 = *MEMORY[0x1E4F15828];
  int v32 = [v30 isEqualToString:*MEMORY[0x1E4F15828]];

  if (v32)
  {
    long long v33 = (ARImageData *)v19;
    latestUltraWideImageData = self->_latestUltraWideImageData;
    self->_latestUltraWideImageData = v33;
  }
  else
  {
    latestUltraWideImageData = [v19 cameraType];
    if (ARIsSupportedAVCaptureDeviceTypeForRearCameraBackdrop(latestUltraWideImageData)
      && [v19 cameraPosition] == 1)
    {
      long long v35 = self->_latestUltraWideImageData;

      if (!v35) {
        goto LABEL_34;
      }
      [v19 setLatestUltraWideImage:self->_latestUltraWideImageData];
      [v19 timestamp];
      -[ARImageData setTimestampOfSynchronizedWideImageData:](self->_latestUltraWideImageData, "setTimestampOfSynchronizedWideImageData:");
      latestUltraWideImageData = self->_latestUltraWideImageData;
      self->_latestUltraWideImageData = 0;
    }
  }

LABEL_34:
  long long v36 = [v19 cameraType];
  if (![v36 isEqualToString:v31])
  {
LABEL_37:

LABEL_38:
    if ([(ARSession *)self isPrimaryImageData:v19])
    {
      id v38 = [(ARRecordingTechniquePublic *)v65 processData:v19];
      [v19 setVisionData:0];
    }
    else
    {
      if ([v19 isHighResolution])
      {
        recordingTechnique = v65;
      }
      else
      {
        [v19 setSecondary:1];
        id v44 = (id)[v64 processData:v19];
        recordingTechnique = self->_recordingTechnique;
      }
      id v45 = [(ARRecordingTechniquePublic *)recordingTechnique processData:v19];
    }

LABEL_49:
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [(ARSession *)self _sessionDidOutputAudioData:v7];
LABEL_75:
      kdebug_trace();
      goto LABEL_76;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v46 = v7;
      int v47 = [v46 isSecondary];
      uint64_t v48 = 256;
      if (v47) {
        uint64_t v48 = 264;
      }
      id v49 = *(id *)((char *)&self->super.isa + v48);
      if ([v49 schedulingActive] && !objc_msgSend(v46, "isHighResolution"))
      {
        uint64_t v56 = [v46 captureFramesPerSecond];
        uint64_t v57 = [(ARSession *)self configurationInternal];
        int v58 = [v57 isKindOfConfiguration:objc_opt_class()];

        if (v58)
        {
          uint64_t v56 = 60;
          uint64_t v59 = 60 / [v46 captureFramesPerSecond];
        }
        else
        {
          uint64_t v59 = 1;
        }
        objc_initWeak(&location, self);
        [v49 setExpectedFramesPerSecond:v56];
        if (v59 >= 1)
        {
          for (uint64_t i = 0; i != (char *)v59; ++i)
          {
            objc_msgSend(v46, "timestamp", v63);
            double v62 = 1.0 / (double)v56 * (double)(uint64_t)i + v61;
            kdebug_trace();
            v66[0] = MEMORY[0x1E4F143A8];
            v66[1] = 3221225472;
            v66[2] = __40__ARSession_sensor_didOutputSensorData___block_invoke_2;
            v66[3] = &unk_1E6187408;
            objc_copyWeak(v68, &location);
            v68[1] = *(id *)&v62;
            id v67 = v46;
            v68[2] = i;
            [v49 submitBlock:v66];

            objc_destroyWeak(v68);
          }
        }
        objc_destroyWeak(&location);
      }
      else
      {
        if (objc_msgSend(v46, "isSecondary", v63)) {
          [(ARSession *)self secondaryTechnique];
        }
        else {
        uint64_t v51 = [(ARSession *)self technique];
        }
        if (v51)
        {
          [v46 timestamp];
          kdebug_trace();
          id v52 = [(ARSession *)self _frameContextByConsumingPendingChanges];
          [v52 setImageData:v46];
          __int16 v53 = [(ARSession *)self latestDeviceOrientationData];
          [v52 setOrientationData:v53];

          uint64_t v54 = [(ARSession *)self latestLocationData];
          [v52 setLocationData:v54];

          [v46 timestamp];
          kdebug_trace();
          uint64_t v55 = [v52 imageData];
          [v55 timestamp];
          objc_msgSend(v51, "requestResultDataAtTimestamp:context:", v52);
        }
      }

      goto LABEL_75;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v50 = (void *)[v7 copy];
      [(ARSession *)self setLatestDeviceOrientationData:v50];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_75;
      }
      id v50 = (void *)[v7 copy];
      [(ARSession *)self setLatestLocationData:v50];
    }

    goto LABEL_75;
  }
  long long v37 = [(ARVideoFormat *)self->_primaryVideoFormat captureDeviceType];
  if ([v37 isEqualToString:v31])
  {

    goto LABEL_37;
  }
  BOOL v40 = [(ARSession *)self is6DofFaceTracking];

  if (v40) {
    goto LABEL_38;
  }
  if (self->_configuredForWorldTracking) {
    id v41 = [(ARWorldTrackingTechnique *)self->_worldTrackingTechnique processData:v19];
  }
  id v42 = [(AREnvironmentTexturingTechnique *)self->_environmentTexturingTechnique processData:v19];
  id v43 = [(ARRecordingTechniquePublic *)self->_recordingTechnique processData:v19];
  [v19 setVisionData:0];

LABEL_76:
}

uint64_t __40__ARSession_sensor_didOutputSensorData___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v5 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass) {
    *a4 = 1;
  }
  return isKindOfClass & 1;
}

void __40__ARSession_sensor_didOutputSensorData___block_invoke_2(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v21 = a1;
    kdebug_trace();
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v3 = WeakRetained[60];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v23 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if (objc_opt_respondsToSelector())
          {
            uint64_t v9 = [v8 providedDataTypes];
            if ((v9 & ~[WeakRetained runningSensors]) == 0)
            {
              uint64_t v10 = [v8 currentData];
              if (v10)
              {
                uint64_t v11 = [WeakRetained technique];
                id v12 = (id)[v11 processData:v10];

                uint64_t v13 = [WeakRetained secondaryTechnique];
                id v14 = (id)[v13 processData:v10];

                objc_opt_class();
                if (objc_opt_isKindOfClass())
                {
                  long long v15 = (void *)[v10 copy];
                  [WeakRetained setLatestDeviceOrientationData:v15];
                }
              }
            }
          }
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v5);
    }

    if ([*(id *)(v21 + 32) isSecondary]) {
      [WeakRetained secondaryTechnique];
    }
    else {
    long long v16 = [WeakRetained technique];
    }
    if (v16)
    {
      kdebug_trace();
      long long v17 = [WeakRetained _frameContextByConsumingPendingChanges];
      [v17 setImageData:*(void *)(v21 + 32)];
      long long v18 = [WeakRetained latestDeviceOrientationData];
      [v17 setOrientationData:v18];

      id v19 = [WeakRetained latestLocationData];
      [v17 setLocationData:v19];

      if (*(uint64_t *)(v21 + 56) < 1)
      {
        kdebug_trace();
        [v16 requestResultDataAtTimestamp:v17 context:*(double *)(v21 + 48)];
      }
      else
      {
        uint64_t v20 = [v16 predictedResultDataAtTimestamp:v17 context:*(double *)(v21 + 48)];
        [WeakRetained technique:v16 didOutputResultData:v20 timestamp:v17 context:*(double *)(v21 + 48)];
      }
    }
  }
  else
  {
    long long v16 = _ARLogSession_0();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)simd_float4x4 buf = 0;
      _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_DEBUG, "Ignoring request result call, because session is nil", buf, 2u);
    }
  }
}

- (void)sensor:(id)a3 didFailWithError:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(ARSession *)self configurationInternal];
  if ([v8 isKindOfConfiguration:objc_opt_class()])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) == 0) {
      goto LABEL_12;
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v8 = objc_msgSend(v7, "underlyingErrors", 0);
    uint64_t v10 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v20;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v8);
          }
          id v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if ([v14 code] == 102)
          {
            if (_ARLogSensor_onceToken_10 != -1) {
              dispatch_once(&_ARLogSensor_onceToken_10, &__block_literal_global_876);
            }
            long long v15 = (void *)_ARLogSensor_logObj_10;
            if (os_log_type_enabled((os_log_t)_ARLogSensor_logObj_10, OS_LOG_TYPE_DEBUG))
            {
              long long v16 = v15;
              long long v17 = (objc_class *)objc_opt_class();
              long long v18 = NSStringFromClass(v17);
              *(_DWORD *)simd_float4x4 buf = 138543874;
              long long v24 = v18;
              __int16 v25 = 2048;
              long long v26 = self;
              __int16 v27 = 2112;
              uint64_t v28 = v14;
              _os_log_impl(&dword_1B88A2000, v16, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Restarting device orientation sensor with magnetic north reference frame due to %@.", buf, 0x20u);
            }
            [v6 changeReferenceFrame:4];
            [(ARSessionMetrics *)self->_metrics recordTrueNorthUnavailable];

            goto LABEL_20;
          }
        }
        uint64_t v11 = [v8 countByEnumeratingWithState:&v19 objects:v29 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
  }

LABEL_12:
  if ([v7 code] == 107) {
    [(ARSession *)self _sessionDidCaptureHighResolutionFrame:0 error:v7];
  }
  else {
    [(ARSession *)self _sessionDidFailWithError:v7];
  }
LABEL_20:
}

- (void)sensorDidPause:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ARLogSession_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)simd_float4x4 buf = 138543618;
    long long v16 = v7;
    __int16 v17 = 2048;
    long long v18 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: begin interruption", buf, 0x16u);
  }
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__ARSession_sensorDidPause___block_invoke;
  block[3] = &unk_1E6185160;
  void block[4] = self;
  id v14 = v4;
  id v9 = v4;
  dispatch_async(stateQueue, block);
  dispatch_time_t v10 = dispatch_time(0, 400000000);
  uint64_t v11 = self->_stateQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __28__ARSession_sensorDidPause___block_invoke_3;
  v12[3] = &unk_1E61851B0;
  v12[4] = self;
  dispatch_after(v10, v11, v12);
}

uint64_t __28__ARSession_sensorDidPause___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![*(id *)(a1 + 32) pausedSensors])
  {
    [*(id *)(*(void *)(a1 + 32) + 520) sessionStopped];
    [*(id *)(a1 + 32) _getObservers];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v3; ++i)
        {
          if (*(void *)v16 != v4) {
            objc_enumerationMutation(v2);
          }
          id v6 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v6 sessionWasInterrupted:*(void *)(a1 + 32)];
          }
        }
        uint64_t v3 = [v2 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v3);
    }

    id v7 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, v7);
      uint64_t v8 = [*(id *)(a1 + 32) delegateQueue];
      id v9 = v8;
      if (!v8)
      {
        id v9 = MEMORY[0x1E4F14428];
        id v10 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __28__ARSession_sensorDidPause___block_invoke_2;
      block[3] = &unk_1E6185200;
      objc_copyWeak(&v13, &location);
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v9, block);
      if (!v8) {

      }
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "setPausedSensors:", objc_msgSend(*(id *)(a1 + 32), "pausedSensors") | objc_msgSend(*(id *)(a1 + 40), "providedDataTypes"));
}

void __28__ARSession_sensorDidPause___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sessionWasInterrupted:*(void *)(a1 + 32)];
}

void __28__ARSession_sensorDidPause___block_invoke_3(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) pausedSensors])
  {
    [*(id *)(a1 + 32) _interruptSession];
    id v2 = _ARLogSession_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = (objc_class *)objc_opt_class();
      uint64_t v4 = NSStringFromClass(v3);
      uint64_t v5 = *(void *)(a1 + 32);
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = v5;
      id v6 = "%{public}@ <%p>: interrupted";
LABEL_6:
      _os_log_impl(&dword_1B88A2000, v2, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    id v2 = _ARLogSession_0();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = (objc_class *)objc_opt_class();
      uint64_t v4 = NSStringFromClass(v7);
      uint64_t v8 = *(void *)(a1 + 32);
      int v9 = 138543618;
      id v10 = v4;
      __int16 v11 = 2048;
      uint64_t v12 = v8;
      id v6 = "%{public}@ <%p>: cancel interruption";
      goto LABEL_6;
    }
  }
}

- (void)sensorDidRestart:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _ARLogSession_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)simd_float4x4 buf = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2048;
    long long v15 = self;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ <%p>: end interruption", buf, 0x16u);
  }
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __30__ARSession_sensorDidRestart___block_invoke;
  void v10[3] = &unk_1E6185160;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(stateQueue, v10);
}

void __30__ARSession_sensorDidRestart___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  objc_msgSend(*(id *)(a1 + 32), "setPausedSensors:", objc_msgSend(*(id *)(a1 + 32), "pausedSensors") & ~objc_msgSend(*(id *)(a1 + 40), "providedDataTypes"));
  if (![*(id *)(a1 + 32) pausedSensors])
  {
    [*(id *)(a1 + 32) _endInterruption];
    id v2 = *(void **)(a1 + 32);
    uint64_t v3 = (void *)v2[65];
    id v4 = [v2 configurationInternal];
    [v3 sessionStarted:v2 withConfiguration:v4];

    [*(id *)(a1 + 32) _getObservers];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(v5);
          }
          id v9 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v9 sessionInterruptionEnded:*(void *)(a1 + 32)];
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }

    id v10 = [*(id *)(a1 + 32) delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, v10);
      id v11 = [*(id *)(a1 + 32) delegateQueue];
      uint64_t v12 = v11;
      if (!v11)
      {
        uint64_t v12 = MEMORY[0x1E4F14428];
        id v13 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __30__ARSession_sensorDidRestart___block_invoke_2;
      block[3] = &unk_1E6185200;
      objc_copyWeak(&v15, &location);
      void block[4] = *(void *)(a1 + 32);
      dispatch_async(v12, block);
      if (!v11) {

      }
      objc_destroyWeak(&v15);
      objc_destroyWeak(&location);
    }
  }
}

void __30__ARSession_sensorDidRestart___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained sessionInterruptionEnded:*(void *)(a1 + 32)];
}

- (void)_sessionWillRunWithConfiguration:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(ARSession *)self _getObservers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 session:self willRunWithConfiguration:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)_sessionRequestedRunWithConfiguration:(id)a3 options:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(ARSession *)self _getObservers];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v13 + 1) + 8 * v11);
        if (objc_opt_respondsToSelector()) {
          [v12 session:self requestedRunWithConfiguration:v6 options:a4];
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (void)_sessionDidUpdateFrame:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 timestamp];
  kdebug_trace();
  id v5 = (void *)[v4 capturedImage];
  uint64_t v6 = os_unfair_lock_lock_with_options();
  uint64_t v7 = (void *)MEMORY[0x1BA9C6160](v6);
  [(NSPointerArray *)self->_weakPixelBuffers ar_compactZeroedWeakPointers];
  if (![(NSPointerArray *)self->_weakPixelBuffers count]
    || [(NSPointerArray *)self->_weakPixelBuffers pointerAtIndex:[(NSPointerArray *)self->_weakPixelBuffers count] - 1] != v5)
  {
    [(NSPointerArray *)self->_weakPixelBuffers addPointer:v5];
  }
  NSUInteger v8 = [(NSPointerArray *)self->_weakPixelBuffers count];
  os_unfair_lock_unlock(&self->_weakPixelBuffersLock);
  if (v8 < 0xB || self->_replaySensor)
  {
    [(ARSession *)self _getObservers];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v25 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          if (objc_opt_respondsToSelector()) {
            [v13 session:self didUpdateFrame:v4];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v10);
    }

    long long v14 = [(ARSession *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak((id *)location, v14);
      long long v15 = [(ARSession *)self delegateQueue];
      long long v16 = v15;
      if (!v15)
      {
        long long v16 = MEMORY[0x1E4F14428];
        id v17 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__ARSession__sessionDidUpdateFrame___block_invoke;
      block[3] = &unk_1E6187430;
      objc_copyWeak(&v23, (id *)location);
      void block[4] = self;
      id v22 = v4;
      dispatch_async(v16, block);
      if (!v15) {

      }
      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)location);
    }
    [v4 timestamp];
    kdebug_trace();
  }
  else
  {
    uint64_t v18 = _ARLogSession_0();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      long long v19 = (objc_class *)objc_opt_class();
      long long v20 = NSStringFromClass(v19);
      *(_DWORD *)id location = 138543874;
      *(void *)&location[4] = v20;
      __int16 v30 = 2048;
      uint64_t v31 = self;
      __int16 v32 = 2048;
      NSUInteger v33 = v8;
      _os_log_impl(&dword_1B88A2000, v18, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: The delegate of ARSession is retaining %lu ARFrames. The camera will stop delivering camera images if the delegate keeps holding on to too many ARFrames. This could be a threading or memory management issue in the delegate and should be fixed.", location, 0x20u);
    }
    [v4 timestamp];
    kdebug_trace();
    kdebug_trace();
  }
}

void __36__ARSession__sessionDidUpdateFrame___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didUpdateFrame:*(void *)(a1 + 40)];
}

- (void)_sessionDidCaptureHighResolutionFrame:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_semaphore_wait((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore, 0xFFFFFFFFFFFFFFFFLL);
  if (self->_pendingHiResFrameCaptureCompletionBlock)
  {
    self->_isHiResFrameCaptureInProgress = 0;
    NSUInteger v8 = (void *)MEMORY[0x1BA9C63E0]();
    id pendingHiResFrameCaptureCompletionBlock = self->_pendingHiResFrameCaptureCompletionBlock;
    self->_id pendingHiResFrameCaptureCompletionBlock = 0;

    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
    if (v8)
    {
      uint64_t v10 = [(ARSession *)self delegateQueue];
      uint64_t v11 = v10;
      if (!v10)
      {
        uint64_t v11 = MEMORY[0x1E4F14428];
        id v12 = MEMORY[0x1E4F14428];
      }
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __57__ARSession__sessionDidCaptureHighResolutionFrame_error___block_invoke;
      block[3] = &unk_1E6187238;
      id v17 = v8;
      id v15 = v6;
      id v16 = v7;
      id v13 = v8;
      dispatch_async(v11, block);
      if (!v10) {
    }
      }
  }
  else
  {
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_pendingHiResFrameCaptureSemaphore);
  }
}

uint64_t __57__ARSession__sessionDidCaptureHighResolutionFrame_error___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_sessionCameraDidChangeTrackingState:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 trackingState];
  [v4 trackingStateReason];
  kdebug_trace();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1B88A2000, "Tracking state changed", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  id v6 = _ARLogSession_0();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    ARTrackingStateToString([v4 trackingState]);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = ARTrackingStateReasonToString([v4 trackingStateReason]);
    *(_DWORD *)simd_float4x4 buf = 138544130;
    id v30 = v8;
    __int16 v31 = 2048;
    __int16 v32 = self;
    __int16 v33 = 2112;
    id v34 = v9;
    __int16 v35 = 2112;
    long long v36 = v10;
    _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Tracking state changed: %@ reason: %@", buf, 0x2Au);
  }
  [(ARSession *)self _getObservers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v24 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v15 session:self cameraDidChangeTrackingState:v4];
        }
      }
      uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v12);
  }

  id v16 = [(ARSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak((id *)buf, v16);
    id v17 = [(ARSession *)self delegateQueue];
    uint64_t v18 = v17;
    if (!v17)
    {
      uint64_t v18 = MEMORY[0x1E4F14428];
      id v19 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __50__ARSession__sessionCameraDidChangeTrackingState___block_invoke;
    block[3] = &unk_1E6187430;
    objc_copyWeak(&v22, (id *)buf);
    void block[4] = self;
    id v21 = v4;
    dispatch_async(v18, block);
    if (!v17) {

    }
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }
  [v4 trackingState];
  [v4 trackingStateReason];
  kdebug_trace();

  os_activity_scope_leave(&state);
}

void __50__ARSession__sessionCameraDidChangeTrackingState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) cameraDidChangeTrackingState:*(void *)(a1 + 40)];
}

- (void)_sessionDidFailWithError:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ARLogSession_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    id v6 = (objc_class *)objc_opt_class();
    id v7 = NSStringFromClass(v6);
    *(_DWORD *)simd_float4x4 buf = 138543874;
    long long v26 = v7;
    __int16 v27 = 2048;
    uint64_t v28 = self;
    __int16 v29 = 2112;
    id v30 = v4;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: did fail with error: %@", buf, 0x20u);
  }
  [(ARSessionMetrics *)self->_metrics reportSessionFailure:v4];
  [v4 code];
  kdebug_trace();
  [(ARSession *)self pause];
  [(ARSession *)self _getObservers];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v12 session:self didFailWithError:v4];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(ARSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak((id *)buf, v13);
    long long v14 = [(ARSession *)self delegateQueue];
    id v15 = v14;
    if (!v14)
    {
      id v15 = MEMORY[0x1E4F14428];
      id v16 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__ARSession__sessionDidFailWithError___block_invoke;
    block[3] = &unk_1E6187430;
    objc_copyWeak(&v19, (id *)buf);
    void block[4] = self;
    id v18 = v4;
    dispatch_async(v15, block);
    if (!v14) {

    }
    objc_destroyWeak(&v19);
    objc_destroyWeak((id *)buf);
  }
  [v4 code];
  kdebug_trace();
}

void __38__ARSession__sessionDidFailWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)_sessionDidAddAnchors:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 count];
  kdebug_trace();
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  id v5 = _os_activity_create(&dword_1B88A2000, "Did add anchors", (os_activity_t)arkitActivity, OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v5, &state);

  [(ARSession *)self _getObservers];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v10 session:self didAddAnchors:v4];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v7);
  }

  id v11 = ARAnchorsForPublicDelegate(v4);
  if ([v11 count])
  {
    uint64_t v12 = [(ARSession *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, v12);
      uint64_t v13 = [(ARSession *)self delegateQueue];
      long long v14 = v13;
      if (!v13)
      {
        long long v14 = MEMORY[0x1E4F14428];
        id v15 = MEMORY[0x1E4F14428];
      }
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      id v18 = __35__ARSession__sessionDidAddAnchors___block_invoke;
      id v19 = &unk_1E6187430;
      objc_copyWeak(&v22, &location);
      long long v20 = self;
      id v21 = v11;
      dispatch_async(v14, &v16);
      if (!v13) {

      }
      objc_destroyWeak(&v22);
      objc_destroyWeak(&location);
    }
  }
  objc_msgSend(v4, "count", v16, v17, v18, v19, v20);
  kdebug_trace();

  os_activity_scope_leave(&state);
}

void __35__ARSession__sessionDidAddAnchors___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didAddAnchors:*(void *)(a1 + 40)];
}

- (void)_sessionDidUpdateAnchors:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 count];
  kdebug_trace();
  [(ARSession *)self _getObservers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 session:self didUpdateAnchors:v4];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  uint64_t v10 = ARAnchorsForPublicDelegate(v4);
  if ([v10 count])
  {
    id v11 = [(ARSession *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, v11);
      uint64_t v12 = [(ARSession *)self delegateQueue];
      uint64_t v13 = v12;
      if (!v12)
      {
        uint64_t v13 = MEMORY[0x1E4F14428];
        id v14 = MEMORY[0x1E4F14428];
      }
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __38__ARSession__sessionDidUpdateAnchors___block_invoke;
      id v18 = &unk_1E6187430;
      objc_copyWeak(&v21, &location);
      id v19 = self;
      id v20 = v10;
      dispatch_async(v13, &v15);
      if (!v12) {

      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  objc_msgSend(v4, "count", v15, v16, v17, v18, v19);
  kdebug_trace();
}

void __38__ARSession__sessionDidUpdateAnchors___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didUpdateAnchors:*(void *)(a1 + 40)];
}

- (void)_sessionDidRemoveAnchors:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 count];
  kdebug_trace();
  [(ARSession *)self _getObservers];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 session:self didRemoveAnchors:v4];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v6);
  }

  uint64_t v10 = ARAnchorsForPublicDelegate(v4);
  if ([v10 count])
  {
    id v11 = [(ARSession *)self delegate];
    if (objc_opt_respondsToSelector())
    {
      objc_initWeak(&location, v11);
      uint64_t v12 = [(ARSession *)self delegateQueue];
      uint64_t v13 = v12;
      if (!v12)
      {
        uint64_t v13 = MEMORY[0x1E4F14428];
        id v14 = MEMORY[0x1E4F14428];
      }
      uint64_t v15 = MEMORY[0x1E4F143A8];
      uint64_t v16 = 3221225472;
      uint64_t v17 = __38__ARSession__sessionDidRemoveAnchors___block_invoke;
      id v18 = &unk_1E6187430;
      objc_copyWeak(&v21, &location);
      id v19 = self;
      id v20 = v10;
      dispatch_async(v13, &v15);
      if (!v12) {

      }
      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);
    }
  }
  objc_msgSend(v4, "count", v15, v16, v17, v18, v19);
  kdebug_trace();
}

void __38__ARSession__sessionDidRemoveAnchors___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didRemoveAnchors:*(void *)(a1 + 40)];
}

- (void)_sessionDidUpdateExternalAnchors:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 count];
  kdebug_trace();
  id v5 = [(ARSession *)self _getObservers];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 session:self didUpdateExternalAnchors:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  [v4 count];
  kdebug_trace();
}

- (void)_sessionShouldAttemptRelocalization
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __48__ARSession__sessionShouldAttemptRelocalization__block_invoke;
  double v25[3] = &unk_1E6187458;
  v25[4] = self;
  objc_copyWeak(&v26, &location);
  v25[5] = v27;
  uint64_t v3 = (void *)MEMORY[0x1BA9C63E0](v25);
  [(ARSession *)self _getObservers];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v22 = 0u;
  long long v21 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v22 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          stateQueue = self->_stateQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_492;
          block[3] = &unk_1E6187238;
          id v9 = v3;
          void block[5] = self;
          id v20 = v9;
          void block[4] = v7;
          dispatch_async(stateQueue, block);
        }
        if (objc_opt_respondsToSelector()) {
          [v7 sessionShouldAttemptRelocalization:self completion:v3];
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v4);
  }

  uint64_t v10 = [(ARSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&from, v10);
    long long v11 = [(ARSession *)self delegateQueue];
    long long v12 = v11;
    if (!v11)
    {
      long long v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
    }
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_2;
    v15[3] = &unk_1E6187480;
    id v16 = v3;
    objc_copyWeak(&v17, &from);
    _OWORD v15[4] = self;
    dispatch_async(v12, v15);
    if (!v11) {

    }
    objc_destroyWeak(&v17);
    objc_destroyWeak(&from);
  }

  objc_destroyWeak(&v26);
  _Block_object_dispose(v27, 8);
  objc_destroyWeak(&location);
}

void __48__ARSession__sessionShouldAttemptRelocalization__block_invoke(uint64_t a1, int a2)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_wait(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 136), 0xFFFFFFFFFFFFFFFFLL);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v5 = WeakRetained;
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24)) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = WeakRetained == 0;
  }
  if (!v7)
  {
    *(unsigned char *)(v6 + 24) = 1;
    if ([WeakRetained relocalizing])
    {
      uint64_t v8 = _ARLogSession_0();
      BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
      if (a2)
      {
        if (v9)
        {
          uint64_t v10 = (objc_class *)objc_opt_class();
          long long v11 = NSStringFromClass(v10);
          uint64_t v12 = *(void *)(a1 + 32);
          int v18 = 138543618;
          id v19 = v11;
          __int16 v20 = 2048;
          uint64_t v21 = v12;
          _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: developer asked for relocalization", (uint8_t *)&v18, 0x16u);
        }
        v5[232] = 1;
      }
      else
      {
        if (v9)
        {
          id v13 = (objc_class *)objc_opt_class();
          long long v14 = NSStringFromClass(v13);
          uint64_t v15 = *(void *)(a1 + 32);
          int v18 = 138543618;
          id v19 = v14;
          __int16 v20 = 2048;
          uint64_t v21 = v15;
          _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_INFO, "%{public}@ <%p>: developer specifically declined relocalization", (uint8_t *)&v18, 0x16u);
        }
        uint64_t v16 = [MEMORY[0x1E4F1C9C8] date];
        id v17 = (void *)*((void *)v5 + 28);
        *((void *)v5 + 28) = v16;
      }
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 136));
}

uint64_t __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_492(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 48);
  uint64_t v2 = [*(id *)(a1 + 32) sessionShouldAttemptRelocalization:*(void *)(a1 + 40)];
  uint64_t v3 = *(uint64_t (**)(uint64_t, uint64_t))(v1 + 16);
  return v3(v1, v2);
}

void __48__ARSession__sessionShouldAttemptRelocalization__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, uint64_t))(v2 + 16))(v2, [WeakRetained sessionShouldAttemptRelocalization:*(void *)(a1 + 32)]);
}

- (void)_sessionDidOutputAudioData:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 timestamp];
  kdebug_trace();
  [(ARSession *)self _getObservers];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v9, "session:didOutputAudioSampleBuffer:", self, objc_msgSend(v4, "sampleBuffer"));
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [(ARSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, v10);
    long long v11 = [(ARSession *)self delegateQueue];
    uint64_t v12 = v11;
    if (!v11)
    {
      uint64_t v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
    }
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    void v14[2] = __40__ARSession__sessionDidOutputAudioData___block_invoke;
    v14[3] = &unk_1E6187430;
    objc_copyWeak(&v16, &location);
    v14[4] = self;
    id v15 = v4;
    dispatch_async(v12, v14);
    if (!v11) {

    }
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
}

void __40__ARSession__sessionDidOutputAudioData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "session:didOutputAudioSampleBuffer:", *(void *)(a1 + 32), objc_msgSend(*(id *)(a1 + 40), "sampleBuffer"));
}

- (void)_sessionDidOutputCollaborationData:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _ARLogSession_0();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = (objc_class *)objc_opt_class();
    uint64_t v7 = NSStringFromClass(v6);
    uint64_t v8 = NSStringFromARCollaborationData(v4);
    *(_DWORD *)simd_float4x4 buf = 138543874;
    char v28 = v7;
    __int16 v29 = 2048;
    uint64_t v30 = self;
    __int16 v31 = 2112;
    __int16 v32 = v8;
    _os_log_impl(&dword_1B88A2000, v5, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: didOutputCollaborationData: %@", buf, 0x20u);
  }
  [v4 timestamp];
  [v4 vioDataType];
  BOOL v9 = [v4 vioData];
  [v9 length];
  kdebug_trace();

  [(ARSession *)self _getObservers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v14 session:self didOutputCollaborationData:v4];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v11);
  }

  id v15 = [(ARSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak((id *)buf, v15);
    id v16 = [(ARSession *)self delegateQueue];
    id v17 = v16;
    if (!v16)
    {
      id v17 = MEMORY[0x1E4F14428];
      id v18 = MEMORY[0x1E4F14428];
    }
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__ARSession__sessionDidOutputCollaborationData___block_invoke;
    block[3] = &unk_1E6187430;
    objc_copyWeak(&v21, (id *)buf);
    void block[4] = self;
    id v20 = v4;
    dispatch_async(v17, block);
    if (!v16) {

    }
    objc_destroyWeak(&v21);
    objc_destroyWeak((id *)buf);
  }
  [(ARRecordingTechniquePublic *)self->_recordingTechnique recordCollaborationData:v4 localSession:1];
  [v4 timestamp];
  kdebug_trace();
}

void __48__ARSession__sessionDidOutputCollaborationData___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didOutputCollaborationData:*(void *)(a1 + 40)];
}

- (void)_sessionDidChangeGeoTrackingStatus:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 state];
  [v4 stateReason];
  [v4 accuracy];
  kdebug_trace();
  [(ARSession *)self _getObservers];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (objc_opt_respondsToSelector()) {
          [v9 session:self didChangeGeoTrackingStatus:v4];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v6);
  }

  id v10 = [(ARSession *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    objc_initWeak(&location, v10);
    uint64_t v11 = [(ARSession *)self delegateQueue];
    uint64_t v12 = v11;
    if (!v11)
    {
      uint64_t v12 = MEMORY[0x1E4F14428];
      id v13 = MEMORY[0x1E4F14428];
    }
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __48__ARSession__sessionDidChangeGeoTrackingStatus___block_invoke;
    id v17 = &unk_1E6187430;
    objc_copyWeak(&v20, &location);
    id v18 = self;
    id v19 = v4;
    dispatch_async(v12, &v14);
    if (!v11) {

    }
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  objc_msgSend(v4, "state", v14, v15, v16, v17, v18);
  [v4 stateReason];
  [v4 accuracy];
  kdebug_trace();
}

void __48__ARSession__sessionDidChangeGeoTrackingStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained session:*(void *)(a1 + 32) didChangeGeoTrackingStatus:*(void *)(a1 + 40)];
}

- (void)_sessionDidUpdateSpatialMappingPointClouds:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v5 = self->_observers;
  uint64_t v6 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "session:didUpdateSpatialMappingPointClouds:", self, v4, (void)v11);
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSHashTable *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)technique:(id)a3 didChangeState:(int64_t)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a4 == 3)
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F29128], "ar_UUIDWithIntegerValue:", objc_msgSend(a3, "vioSessionIdentifier"));
    [(ARSession *)self setIdentifier:v5];

    uint64_t v6 = _ARLogSession_0();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = (objc_class *)objc_opt_class();
      uint64_t v8 = NSStringFromClass(v7);
      uint64_t v9 = [(ARSession *)self identifier];
      int v10 = 138543874;
      long long v11 = v8;
      __int16 v12 = 2048;
      long long v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v9;
      _os_log_impl(&dword_1B88A2000, v6, OS_LOG_TYPE_INFO, "%{public}@ <%p>: identifier changed to %@", (uint8_t *)&v10, 0x20u);
    }
  }
}

- (void)technique:(id)a3 didOutputCollaborationData:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _ARLogSession_0();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = (objc_class *)objc_opt_class();
    int v10 = NSStringFromClass(v9);
    long long v11 = NSStringFromARCollaborationData(v7);
    int v12 = 138544130;
    long long v13 = v10;
    __int16 v14 = 2048;
    uint64_t v15 = self;
    __int16 v16 = 2048;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v11;
    _os_log_impl(&dword_1B88A2000, v8, OS_LOG_TYPE_DEBUG, "%{public}@ <%p>: Technique (%p) didOutputCollaborationData: %@", (uint8_t *)&v12, 0x2Au);
  }
  if ([v7 vioDataType] == 1 || objc_msgSend(v7, "vioDataType") == 3)
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_frameContextHandlerSemaphore, 0xFFFFFFFFFFFFFFFFLL);
    [(ARFrameContextHandler *)self->_frameContextHandler addCollaborationData:v7];
    dispatch_semaphore_signal((dispatch_semaphore_t)self->_frameContextHandlerSemaphore);
  }
  else
  {
    [(ARSession *)self _sessionDidOutputCollaborationData:v7];
  }
}

- (BOOL)is6DofFaceTracking
{
  uint64_t v3 = [(ARSession *)self configurationInternal];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [(ARSession *)self configurationInternal];
    uint64_t v5 = [v4 templateConfiguration];

    uint64_t v3 = (void *)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v3 isWorldTrackingEnabled];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)isUserFaceTracking
{
  uint64_t v3 = [(ARSession *)self configurationInternal];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    id v4 = [(ARSession *)self configurationInternal];
    uint64_t v5 = [v4 templateConfiguration];

    uint64_t v3 = (void *)v5;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    char v6 = [v3 userFaceTrackingEnabled];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (void)_saveGraphFileInFileName:(id *)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (+[ARKitUserDefaults BOOLForKey:@"com.apple.arkit.session.configuration.saveDotGraph"])
  {
    uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
    [v5 addObject:@"digraph g { "];
    [v5 addObject:@"node [shape=record]"];
    char v6 = [(ARSession *)self technique];
    [v6 dotGraphWithLines:v5];

    [v5 addObject:@"}"];
    id v7 = [v5 componentsJoinedByString:@"\n"];
    uint64_t v8 = NSTemporaryDirectory();
    uint64_t v9 = [(ARSession *)self configurationInternal];
    int v10 = (objc_class *)objc_opt_class();
    long long v11 = NSStringFromClass(v10);
    int v12 = [v8 stringByAppendingFormat:@"%@.dot", v11];

    id v20 = 0;
    [v7 writeToFile:v12 atomically:1 encoding:4 error:&v20];
    id v13 = v20;
    __int16 v14 = _ARLogGeneral_26();
    uint64_t v15 = v14;
    if (v13)
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        __int16 v16 = (objc_class *)objc_opt_class();
        id v17 = NSStringFromClass(v16);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        long long v22 = v17;
        __int16 v23 = 2048;
        long long v24 = self;
        __int16 v25 = 2112;
        id v26 = v13;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_ERROR, "%{public}@ <%p>: Graph: Could not write dot graph to file. Error: %@", buf, 0x20u);
      }
    }
    else
    {
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        __int16 v18 = (objc_class *)objc_opt_class();
        id v19 = NSStringFromClass(v18);
        *(_DWORD *)simd_float4x4 buf = 138543874;
        long long v22 = v19;
        __int16 v23 = 2048;
        long long v24 = self;
        __int16 v25 = 2114;
        id v26 = v12;
        _os_log_impl(&dword_1B88A2000, v15, OS_LOG_TYPE_INFO, "%{public}@ <%p>: Graph: Successfully wrote the configuration's dot file to '%{public}@'", buf, 0x20u);
      }
      if (a3) {
        *a3 = v12;
      }
    }
  }
}

+ (void)setRenderType:(unint64_t)a3
{
}

- (ARParentTechnique)technique
{
  return (ARParentTechnique *)objc_getProperty(self, a2, 424, 1);
}

- (void)setTechnique:(id)a3
{
}

- (ARParentTechnique)secondaryTechnique
{
  return (ARParentTechnique *)objc_getProperty(self, a2, 432, 1);
}

- (void)setSecondaryTechnique:(id)a3
{
}

- (void)setIdentifier:(id)a3
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return WeakRetained;
}

- (void)setDelegate:(id)delegate
{
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
}

- (ARConfiguration)configurationInternal
{
  return (ARConfiguration *)objc_getProperty(self, a2, 472, 1);
}

- (void)setConfigurationInternal:(id)a3
{
}

- (NSArray)availableSensors
{
  return self->_availableSensors;
}

- (unint64_t)runningSensors
{
  return self->_runningSensors;
}

- (void)setRunningSensors:(unint64_t)a3
{
  self->_runningSensors = a3;
}

- (unint64_t)pausedSensors
{
  return self->_pausedSensors;
}

- (void)setPausedSensors:(unint64_t)a3
{
  self->_pausedSensors = a3;
}

- (void)setPowerUsage:(unint64_t)a3
{
  self->_powerUsage = a3;
}

- (BOOL)forceAddSceneReconstructionKeyframePointCloudWithColor
{
  return self->_forceAddSceneReconstructionKeyframePointCloudWithColor;
}

- (void)setForceAddSceneReconstructionKeyframePointCloudWithColor:(BOOL)a3
{
  self->_forceAddSceneReconstructionKeyframePointCloudWithColor = a3;
}

- (ARQATracer)tracer
{
  return self->_tracer;
}

- (void)setTracer:(id)a3
{
}

- (ARSessionMetrics)metrics
{
  return self->_metrics;
}

- (ARDeviceOrientationData)latestDeviceOrientationData
{
  return (ARDeviceOrientationData *)objc_getProperty(self, a2, 528, 1);
}

- (void)setLatestDeviceOrientationData:(id)a3
{
}

- (ARLocationData)latestLocationData
{
  return (ARLocationData *)objc_getProperty(self, a2, 536, 1);
}

- (void)setLatestLocationData:(id)a3
{
}

- (id)beforeRunningAVCaptureSession
{
  return self->_beforeRunningAVCaptureSession;
}

- (void)setBeforeRunningAVCaptureSession:(id)a3
{
}

- (ARRemoteGeoTrackingTechnique)geoTrackingTechnique
{
  return self->_geoTrackingTechnique;
}

- (BOOL)relocalizing
{
  return self->_relocalizing;
}

- (void)setRelocalizing:(BOOL)a3
{
  self->_relocalizing = a3;
}

- (NSMutableDictionary)geoAnchorToAltitude
{
  return self->_geoAnchorToAltitude;
}

- (void)setGeoAnchorToAltitude:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoAnchorToAltitude, 0);
  objc_storeStrong((id *)&self->_geoTrackingTechnique, 0);
  objc_storeStrong(&self->_beforeRunningAVCaptureSession, 0);
  objc_storeStrong((id *)&self->_latestLocationData, 0);
  objc_storeStrong((id *)&self->_latestDeviceOrientationData, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_tracer, 0);
  objc_storeStrong((id *)&self->_availableSensors, 0);
  objc_storeStrong((id *)&self->_configurationInternal, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_dontUseDirectlySecondaryTechnique, 0);
  objc_storeStrong((id *)&self->_dontUseDirectlyTechnique, 0);
  objc_storeStrong((id *)&self->_recon3DLogging, 0);
  objc_storeStrong((id *)&self->_pendingHiResFrameCaptureSemaphore, 0);
  objc_storeStrong(&self->_pendingHiResFrameCaptureCompletionBlock, 0);
  objc_storeStrong((id *)&self->_weakPixelBuffers, 0);
  objc_storeStrong((id *)&self->_depthPointCloudCoalescer, 0);
  objc_storeStrong((id *)&self->_latestUltraWideImageData, 0);
  objc_storeStrong((id *)&self->_primaryVideoFormat, 0);
  objc_storeStrong((id *)&self->_bksAccelerometer, 0);
  objc_storeStrong((id *)&self->_trackedRaycastPostProcessor, 0);
  objc_storeStrong((id *)&self->_resultDataOfSecondaryFrameContextsSemaphore, 0);
  objc_storeStrong((id *)&self->resultDatasOfSecondaryFrameContexts, 0);
  objc_storeStrong((id *)&self->_replaySensor, 0);
  objc_storeStrong((id *)&self->_locationSensor, 0);
  objc_storeStrong((id *)&self->_imageSensor, 0);
  objc_storeStrong((id *)&self->_prepareTechniquesQueue, 0);
  objc_storeStrong((id *)&self->_secondaryResultRequestScheduler, 0);
  objc_storeStrong((id *)&self->_resultRequestScheduler, 0);
  objc_storeStrong((id *)&self->_relocalizationTimeoutDate, 0);
  objc_storeStrong((id *)&self->_motionManger, 0);
  objc_storeStrong(&self->_thermalStateObserver, 0);
  objc_storeStrong((id *)&self->_observersSemaphore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_frameContextHandlerSemaphore, 0);
  objc_storeStrong((id *)&self->_frameContextHandler, 0);
  objc_storeStrong((id *)&self->_lastProcessedFrameSemaphore, 0);
  objc_storeStrong((id *)&self->_lastProcessedFrame, 0);
  objc_storeStrong((id *)&self->_lastPredictedFrameSemaphore, 0);
  objc_storeStrong((id *)&self->_recordingTechnique, 0);
  objc_storeStrong((id *)&self->_environmentTexturingTechnique, 0);
  objc_storeStrong((id *)&self->_worldTrackingTechnique, 0);
}

@end