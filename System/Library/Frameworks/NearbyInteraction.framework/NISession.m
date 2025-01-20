@interface NISession
+ (BOOL)_supportedPlatform:(id)a3;
+ (BOOL)isSupported;
+ (NIInternalDeviceCapability)internalDeviceCapabilities;
+ (NSArray)activelyInteractingDiscoveryTokens;
+ (NSArray)interactableDiscoveryTokens;
+ (NSDictionary)cachedPlatformCapabilities;
+ (id)_localDeviceLogger;
+ (id)deviceCapabilities;
+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4;
+ (id)generateFindingDiscoveryToken;
+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3;
+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3;
+ (id)localDevicePrintableState;
+ (id)observerSession;
+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4;
+ (id)setLocalDeviceDebugParameters:(id)a3;
+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3;
+ (void)_queryAndCacheCapabilities;
+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3;
+ (void)getAsyncInteractableDiscoveryTokens:(id)a3;
+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4;
+ (void)setCachedPlatformCapabilities:(id)a3;
- (BOOL)_isInternalClient;
- (BOOL)_isValidARSession:(id)a3 andConfiguration:(id)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExtendedDistanceMeasurementAllowed;
- (BOOL)isPreciseRangingAllowed;
- (BOOL)isRangingLimitExceeded;
- (NIAcwgEventNotifier)acwgEventNotifier;
- (NICarKeyEventNotifier)carKeyEventNotifier;
- (NIConfiguration)configuration;
- (NIDevicePresenceNotifier)devicePresenceNotifier;
- (NIDiscoveryToken)discoveryToken;
- (NIFindingNotifier)findingNotifier;
- (NIInternalSessionDelegate)internalDelegate;
- (NISession)init;
- (NISystemEventNotifier)systemEventNotifier;
- (NSDictionary)activationResponse;
- (NSError)invalidationError;
- (NSString)description;
- (dispatch_queue_t)delegateQueue;
- (double)lightEstimateFromARLightEstimate:(id)a3;
- (id).cxx_construct;
- (id)_getSessionFailureError;
- (id)_initAndConnectToServerWithOptions:(unint64_t)a3;
- (id)_remoteObject;
- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4;
- (id)_setURSKTTL:(unint64_t)a3;
- (id)_synchronousRemoteObject;
- (id)_verifyError:(id)a3;
- (id)delegate;
- (id)deleteURSKs;
- (id)getInternalConnectionQueue;
- (id)getInternalIdentifier;
- (id)getInternalLogObject;
- (int)internalState;
- (int64_t)motionState;
- (int64_t)niVisionInputTrackingStateFromARTRackingState:(int64_t)a3;
- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object;
- (unint64_t)hash;
- (void)_addObject:(id)a3;
- (void)_addRegionPredicate:(id)a3;
- (void)_configureAndRunInternalARSession;
- (void)_handleARSession:(id)a3 willRunWithConfiguration:(id)a4;
- (void)_handleARSessionDidChangeState:(unint64_t)a3;
- (void)_handleARSessionDidFailWithError:(id)a3;
- (void)_handleARSessionDidUpdateFrame:(id)a3;
- (void)_handleARSessionInterruptionEnded;
- (void)_handleARSessionWasInterrupted;
- (void)_handleActivationError:(id)a3;
- (void)_handleActivationSuccess:(id)a3;
- (void)_handlePauseSessionError:(id)a3;
- (void)_handlePauseSessionSuccess;
- (void)_handleRunSessionError:(id)a3;
- (void)_handleRunSessionSuccess;
- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4;
- (void)_invalidateInternal;
- (void)_invalidateInternalARSessionIfNeeded;
- (void)_invalidateSessionAndNotifyError:(id)a3;
- (void)_logDurationAndSubmit:(BOOL)a3;
- (void)_logTime;
- (void)_notifyDidInvalidateWithError:(id)a3;
- (void)_osLogNearbyObjectUpdate:(id)a3;
- (void)_pauseInternalARSessionIfNeeded;
- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4;
- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5;
- (void)_processUpdatedLockState:(unsigned __int16)a3;
- (void)_provideTruthTag:(id)a3;
- (void)_reinterruptSessionWithCachedInterruption;
- (void)_removeObject:(id)a3;
- (void)_removeRegionPredicate:(id)a3;
- (void)_serverConnectionInterrupted;
- (void)_serverConnectionInvalidated;
- (void)_setARSessionInternal:(id)a3;
- (void)_submitErrorMetric:(id)a3;
- (void)dealloc;
- (void)didDiscoverNearbyObject:(id)a3;
- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4;
- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4;
- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4;
- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4;
- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4;
- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4;
- (void)didStartAcwgRanging:(int64_t)a3;
- (void)didSuspendAcwgRanging:(int64_t)a3;
- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4;
- (void)didUpdateHealthStatus:(int64_t)a3;
- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3;
- (void)didUpdateLocalDiscoveryToken:(id)a3;
- (void)didUpdateMotionState:(int64_t)a3;
- (void)didUpdateNearbyObjects:(id)a3;
- (void)discoveryToken;
- (void)invalidate;
- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5;
- (void)pause;
- (void)prefetchAcwgUrsk:(unsigned int)a3;
- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4;
- (void)processAcwgM3Msg:(id)a3;
- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4;
- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4;
- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5;
- (void)processDCKMessage:(id)a3 responseCallback:(id)a4;
- (void)processVisionInput:(id)a3;
- (void)relayDCKMessage:(id)a3;
- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)runWithConfiguration:(NIConfiguration *)configuration;
- (void)session:(id)a3 didChangeState:(unint64_t)a4;
- (void)session:(id)a3 didFailWithError:(id)a4;
- (void)session:(id)a3 didUpdateFrame:(id)a4;
- (void)session:(id)a3 willRunWithConfiguration:(id)a4;
- (void)sessionInterruptionEnded:(id)a3;
- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4;
- (void)sessionWasInterrupted:(id)a3;
- (void)setARSession:(ARSession *)session;
- (void)setActivationResponse:(id)a3;
- (void)setConfigurationForTesting:(id)a3;
- (void)setDelegate:(id)delegate;
- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue;
- (void)setInternalDelegate:(id)a3;
- (void)setInternalState:(int)a3;
- (void)setInvalidationError:(id)a3;
- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4;
- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4;
- (void)systemDidUpdateState:(id)a3;
- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4;
- (void)uwbSessionDidFailWithError:(id)a3;
- (void)uwbSessionDidInvalidateWithError:(id)a3;
- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4;
- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4;
@end

@implementation NISession

+ (BOOL)isSupported
{
  if (+[NIPlatformInfo supportsUWB]) {
    return 1;
  }
  v3 = +[NISession cachedPlatformCapabilities];

  if (!v3) {
    +[NISession _queryAndCacheCapabilities];
  }
  v4 = +[NISession cachedPlatformCapabilities];
  BOOL v2 = +[NISession _supportedPlatform:v4];

  return v2;
}

+ (NSDictionary)cachedPlatformCapabilities
{
  return (NSDictionary *)(id)_cachedPlatformCapabilities;
}

+ (void)setCachedPlatformCapabilities:(id)a3
{
}

- (int64_t)motionState
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __24__NISession_motionState__block_invoke;
  v5[3] = &unk_1E5AC2590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  int64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __24__NISession_motionState__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 120);
  return result;
}

- (id)_initAndConnectToServerWithOptions:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)NISession;
  v4 = [(NISession *)&v34 init];
  v5 = v4;
  if (v4)
  {
    v4->_connectionOptions = a3;
    uint64_t v6 = [MEMORY[0x1E4F29128] UUID];
    internalID = v5->_internalID;
    v5->_internalID = (NSUUID *)v6;

    atomic_store(0, (unsigned __int8 *)&v5->_readyForCallbacks);
    v5->_startTime = 0.0;
    v5->_duration = 0.0;
    v5->_updatedNearbyObjects = 0;
    os_log_t v8 = os_log_create("com.apple.NearbyInteraction", "NISession");
    log = v5->_log;
    v5->_log = (OS_os_log *)v8;

    v10 = objc_alloc_init(NISessionVisionContext);
    visionContext = v5->_visionContext;
    v5->_visionContext = v10;

    [(NISession *)v5 setInternalState:0];
    [(NISession *)v5 setInvalidationError:0];
    v12 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v13 = dispatch_queue_create("com.apple.NearbyInteraction", v12);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v13;

    objc_storeStrong((id *)&v5->_delegateQueue, MEMORY[0x1E4F14428]);
    v15 = [[NIExportedObjectForwarder alloc] initWithExportedObject:v5];
    exportedObjectForwarder = v5->_exportedObjectForwarder;
    v5->_exportedObjectForwarder = v15;

    atomic_store(a3 & 1, (unsigned __int8 *)&v5->_isObserverSession);
    v17 = [[NIServerConnection alloc] initWithSessionID:v5->_internalID queue:v5->_queue exportedObject:v5->_exportedObjectForwarder options:a3];
    connection = v5->_connection;
    v5->_connection = v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(0);
    discoveryTokenSemaphore = v5->_discoveryTokenSemaphore;
    v5->_discoveryTokenSemaphore = (OS_dispatch_semaphore *)v19;

    objc_initWeak(&location, v5);
    v21 = v5->_connection;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __48__NISession__initAndConnectToServerWithOptions___block_invoke;
    v31[3] = &unk_1E5AC25B8;
    objc_copyWeak(&v32, &location);
    [(NIServerConnection *)v21 setInterruptionHandler:v31];
    v22 = v5->_connection;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __48__NISession__initAndConnectToServerWithOptions___block_invoke_2;
    v29[3] = &unk_1E5AC25B8;
    objc_copyWeak(&v30, &location);
    [(NIServerConnection *)v22 setInvalidationHandler:v29];
    [(NIServerConnection *)v5->_connection resume];
    if (+[NIPlatformInfo isInternalBuild])
    {
      v23 = v5->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = v5->_internalID;
        *(_DWORD *)buf = 138412290;
        v36 = v24;
        _os_log_impl(&dword_1A2C3F000, v23, OS_LOG_TYPE_DEFAULT, "NISession init [%@]", buf, 0xCu);
      }
    }
    v25 = [(NISession *)v5 _remoteObject];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __48__NISession__initAndConnectToServerWithOptions___block_invoke_732;
    v27[3] = &unk_1E5AC25E0;
    v28 = v5;
    [v25 activate:v27];

    objc_destroyWeak(&v30);
    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
  return v5;
}

void __48__NISession__initAndConnectToServerWithOptions___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverConnectionInterrupted];
}

void __48__NISession__initAndConnectToServerWithOptions___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _serverConnectionInvalidated];
}

void __48__NISession__initAndConnectToServerWithOptions___block_invoke_732(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v5) {
    [v6 _handleActivationError:v5];
  }
  else {
    [v6 _handleActivationSuccess:v7];
  }
}

+ (BOOL)_supportedPlatform:(id)a3
{
  int64_t v3 = [a3 objectForKey:@"SupportedPlatform"];
  char v4 = [v3 BOOLValue];

  return v4;
}

+ (void)_queryAndCacheCapabilities
{
  BOOL v2 = +[NIServerConnection createOneShotConnectionAndResume:1];
  int64_t v3 = [v2 remoteObjectProxy];
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy_;
  v17 = __Block_byref_object_dispose_;
  id v18 = 0;
  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __39__NISession__queryAndCacheCapabilities__block_invoke;
  v10 = &unk_1E5AC2608;
  v12 = &v13;
  id v5 = v4;
  v11 = v5;
  [v3 queryDeviceCapabilities:&v7];
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v5, v6);
  objc_msgSend(v2, "invalidate", v7, v8, v9, v10);
  +[NISession setCachedPlatformCapabilities:v14[5]];

  _Block_object_dispose(&v13, 8);
}

void __39__NISession__queryAndCacheCapabilities__block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_osLogNearbyObjectUpdate:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [MEMORY[0x1E4F1C9C8] now];
  ++self->_objectUpdateLogging.totalUpdates;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __38__NISession__osLogNearbyObjectUpdate___block_invoke;
  v14[3] = &unk_1E5AC2630;
  v14[4] = self;
  [v4 enumerateObjectsUsingBlock:v14];
  if (self->_lastObjectUpdateLogTime)
  {
    objc_msgSend(v5, "timeIntervalSinceDate:");
    double v7 = v6;
    if (v6 < 5.0) {
      goto LABEL_13;
    }
  }
  else
  {
    double v7 = 0.0;
  }
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, v5);
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28E78]) initWithFormat:@"DelegateProxy: nearbyObjectUpdates [last %0.1f s]. Updates %d, objects %d, w/dist %d, w/HA %d.", *(void *)&v7, self->_objectUpdateLogging.totalUpdates, self->_objectUpdateLogging.totalObjects, self->_objectUpdateLogging.objectsWithDistance, self->_objectUpdateLogging.objectsWithHorizontalAngle];
  uint64_t v9 = v8;
  if (self->_objectUpdateLogging.objectsWithDistance >= 1) {
    [v8 appendFormat:@" Distance: first %0.2f m, last %0.2f m, min %0.2f m, max %0.2f m.", self->_objectUpdateLogging.firstDistance, self->_objectUpdateLogging.lastDistance, self->_objectUpdateLogging.minDistance, self->_objectUpdateLogging.maxDistance];
  }
  if (self->_objectUpdateLogging.objectsWithHorizontalAngle >= 1) {
    [v9 appendFormat:@" HA: first %0.1f deg, last %0.1f deg.", self->_objectUpdateLogging.firstHorizontalAngleRad * 57.2957795, self->_objectUpdateLogging.lastHorizontalAngleRad * 57.2957795];
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v16 = v9;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "%{private}@", buf, 0xCu);
    }
  }
  v11 = &NINearbyObjectDistanceNotAvailable;
  float v12 = NINearbyObjectAngleNotAvailable;
  *(void *)&self->_objectUpdateLogging.totalUpdates = 0;
  *(void *)&self->_objectUpdateLogging.objectsWithDistance = 0;
  float32x4_t v13 = vld1q_dup_f32(v11);
  *(float32x4_t *)&self->_objectUpdateLogging.firstDistance = v13;
  self->_objectUpdateLogging.firstHorizontalAngleRad = v12;
  self->_objectUpdateLogging.lastHorizontalAngleRad = v12;

LABEL_13:
}

void __38__NISession__osLogNearbyObjectUpdate___block_invoke(uint64_t a1, void *a2)
{
  id v14 = a2;
  [v14 distance];
  float v4 = v3;
  [v14 horizontalAngle];
  ++*(_DWORD *)(*(void *)(a1 + 32) + 212);
  float v6 = NINearbyObjectDistanceNotAvailable;
  if (v4 != NINearbyObjectDistanceNotAvailable)
  {
    ++*(_DWORD *)(*(void *)(a1 + 32) + 216);
    *(float *)(*(void *)(a1 + 32) + 228) = v4;
    double v7 = *(float **)(a1 + 32);
    if (v7[56] == v6)
    {
      v7[56] = v4;
      double v7 = *(float **)(a1 + 32);
    }
    float v8 = v7[58];
    if (v8 == v6 || v8 > v4)
    {
      v7[58] = v4;
      double v7 = *(float **)(a1 + 32);
    }
    float v10 = v7[59];
    if (v10 == v6 || v10 < v4) {
      v7[59] = v4;
    }
  }
  float v12 = NINearbyObjectAngleNotAvailable;
  if (v5 != NINearbyObjectAngleNotAvailable)
  {
    ++*(_DWORD *)(*(void *)(a1 + 32) + 220);
    *(float *)(*(void *)(a1 + 32) + 244) = v5;
    uint64_t v13 = *(void *)(a1 + 32);
    if (*(float *)(v13 + 240) == v12) {
      *(float *)(v13 + 240) = v5;
    }
  }
}

- (void)_logTime
{
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v4 = v3;
  double startTime = self->_startTime;
  if (startTime != 0.0)
  {
    self->_duration = v4 - startTime + self->_duration;
    AnalyticsSendEventLazy();
  }
  self->_double startTime = v4;
}

id __21__NISession__logTime__block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  double v4 = @"duration";
  v1 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 104)];
  v5[0] = v1;
  BOOL v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)_logDurationAndSubmit:(BOOL)a3
{
  BOOL v3 = a3;
  if (self->_startTime != 0.0)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    self->_duration = self->_duration + v5 - self->_startTime;
    self->_double startTime = 0.0;
  }
  if (v3) {
    AnalyticsSendEventLazy();
  }
}

id __35__NISession__logDurationAndSubmit___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  double v4 = @"duration";
  v1 = [NSNumber numberWithDouble:*(double *)(*(void *)(a1 + 32) + 104)];
  v5[0] = v1;
  BOOL v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)_submitErrorMetric:(id)a3
{
  id v3 = a3;
  double v4 = v3;
  if (v3)
  {
    double v5 = [v3 userInfo];

    if (v5)
    {
      float v6 = [v4 userInfo];
      double v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F28588]];

      if (!v7)
      {
        float v8 = [v4 userInfo];
        double v7 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F28568]];

        if (!v7) {
          double v7 = &stru_1EF5D0E08;
        }
      }
    }
    else
    {
      double v7 = &stru_1EF5D0E08;
    }
    id v10 = v4;
    v11 = v7;
    uint64_t v9 = v7;
    AnalyticsSendEventLazy();
  }
}

id __32__NISession__submitErrorMetric___block_invoke(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  v8[0] = @"domain";
  BOOL v2 = (id *)(a1 + 32);
  id v3 = [*(id *)(a1 + 32) domain];
  v9[0] = v3;
  v8[1] = @"code";
  double v4 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(*v2, "code"));
  v8[2] = @"string";
  uint64_t v5 = *(void *)(a1 + 40);
  v9[1] = v4;
  v9[2] = v5;
  float v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)setDelegate:(id)delegate
{
  id v4 = delegate;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__NISession_setDelegate___block_invoke;
  v7[3] = &unk_1E5AC26A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

id __25__NISession_setDelegate___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (+[NIPlatformInfo isInternalBuild])
  {
    BOOL v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v5 = 134283521;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "Set delegate: %{private}p", (uint8_t *)&v5, 0xCu);
    }
  }
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 256), *(id *)(a1 + 40));
}

- (void)setDelegateQueue:(dispatch_queue_t)delegateQueue
{
  int v5 = delegateQueue;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 509, @"Invalid parameter not satisfying: %@", @"delegateQueue" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__NISession_setDelegateQueue___block_invoke;
  block[3] = &unk_1E5AC26A8;
  block[4] = self;
  id v10 = v5;
  uint64_t v7 = v5;
  dispatch_sync(queue, block);
}

void __30__NISession_setDelegateQueue___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (+[NIPlatformInfo isInternalBuild])
  {
    BOOL v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      int v4 = 134283521;
      uint64_t v5 = v3;
      _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "Set delegate queue: %{private}p", (uint8_t *)&v4, 0xCu);
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 264), *(id *)(a1 + 40));
}

+ (id)deviceCapabilities
{
  BOOL v2 = [[NIDeviceCapabilities alloc] initWithFineRangingSupport:+[NIPlatformInfo supportsUWB](NIPlatformInfo, "supportsUWB") aoaSupport:+[NIPlatformInfo supportsAoA](NIPlatformInfo, "supportsAoA") extendedDistanceMeasurementSupport:+[NIPlatformInfo supportsNBAMMS](NIPlatformInfo, "supportsNBAMMS") syntheticApertureSupport:+[NIPlatformInfo supportsSyntheticAperture]];

  return v2;
}

- (NIConfiguration)configuration
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __26__NISession_configuration__block_invoke;
  v5[3] = &unk_1E5AC2590;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NIConfiguration *)v3;
}

void __26__NISession_configuration__block_invoke(uint64_t a1)
{
}

- (NIDiscoveryToken)discoveryToken
{
  uint64_t v14 = 0;
  uint64_t v15 = &v14;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = __Block_byref_object_copy_;
  id v18 = __Block_byref_object_dispose_;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__NISession_discoveryToken__block_invoke;
  block[3] = &unk_1E5AC2590;
  block[4] = self;
  void block[5] = &v14;
  dispatch_sync(queue, block);
  int v4 = (void *)v15[5];
  if (!v4)
  {
    uint64_t v5 = self->_queue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __27__NISession_discoveryToken__block_invoke_2;
    v12[3] = &unk_1E5AC26D0;
    v12[4] = self;
    dispatch_sync(v5, v12);
    discoveryTokenSemaphore = self->_discoveryTokenSemaphore;
    dispatch_time_t v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(discoveryTokenSemaphore, v7);
    uint64_t v8 = self->_queue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __27__NISession_discoveryToken__block_invoke_3;
    v11[3] = &unk_1E5AC2590;
    v11[4] = self;
    v11[5] = &v14;
    dispatch_sync(v8, v11);
    if (!v15[5]
      && +[NIPlatformInfo isInternalBuild]
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[NISession discoveryToken]();
    }
    int v4 = (void *)v15[5];
  }
  id v9 = v4;
  _Block_object_dispose(&v14, 8);

  return (NIDiscoveryToken *)v9;
}

void __27__NISession_discoveryToken__block_invoke(uint64_t a1)
{
}

void __27__NISession_discoveryToken__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) _remoteObject];
  [v1 generateDiscoveryToken];
}

void __27__NISession_discoveryToken__block_invoke_3(uint64_t a1)
{
}

- (BOOL)_isInternalClient
{
  BOOL v2 = [(NISession *)self activationResponse];
  id v3 = [v2 objectForKey:@"InternalClient"];

  BOOL v4 = 0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 && ([v3 BOOLValue]) {
      BOOL v4 = 1;
    }
  }

  return v4;
}

- (NISession)init
{
  return (NISession *)[(NISession *)self _initAndConnectToServerWithOptions:0];
}

- (void)runWithConfiguration:(NIConfiguration *)configuration
{
  uint64_t v5 = configuration;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 626, @"Invalid parameter not satisfying: %@", @"configuration" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NISession_runWithConfiguration___block_invoke;
  block[3] = &unk_1E5AC26A8;
  block[4] = self;
  id v10 = v5;
  dispatch_time_t v7 = v5;
  dispatch_sync(queue, block);
}

void __34__NISession_runWithConfiguration___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) internalState];
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
      if ((v2 - 1) > 7) {
        uint64_t v5 = @"Activating";
      }
      else {
        uint64_t v5 = off_1E5AC2C20[v2 - 1];
      }
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v4;
      __int16 v20 = 2112;
      v21 = v5;
      __int16 v22 = 2112;
      uint64_t v23 = v6;
      dispatch_time_t v7 = v3;
      _os_log_impl(&dword_1A2C3F000, v7, OS_LOG_TYPE_DEFAULT, "Client: runWithConfiguration [%@]. State: %@. Config: %@.", buf, 0x20u);
    }
  }
  atomic_store(1u, (unsigned __int8 *)(*(void *)(a1 + 32) + 80));
  v16[5] = MEMORY[0x1E4F143A8];
  v16[6] = 3221225472;
  v16[7] = __34__NISession_runWithConfiguration___block_invoke_780;
  v16[8] = &__block_descriptor_36_e19___NSDictionary_8__0l;
  int v17 = v2;
  AnalyticsSendEventLazy();
  switch(v2)
  {
    case 0:
    case 1:
    case 4:
    case 5:
      goto LABEL_8;
    case 2:
    case 3:
      if ([*(id *)(*(void *)(a1 + 32) + 40) isEqual:*(void *)(a1 + 40)]) {
        goto LABEL_10;
      }
LABEL_8:
      [*(id *)(a1 + 32) setInternalState:2];
      uint64_t v8 = [*(id *)(a1 + 40) copy];
      id v9 = *(void **)(*(void *)(a1 + 32) + 40);
      *(void *)(*(void *)(a1 + 32) + 40) = v8;

      [*(id *)(a1 + 32) _logTime];
      id v10 = [*(id *)(a1 + 32) _remoteObject];
      uint64_t v11 = *(void *)(a1 + 40);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __34__NISession_runWithConfiguration___block_invoke_785;
      v16[3] = &unk_1E5AC2718;
      v16[4] = *(void *)(a1 + 32);
      [v10 runWithConfiguration:v11 reply:v16];

      break;
    case 6:
      [*(id *)(a1 + 32) _reinterruptSessionWithCachedInterruption];
      return;
    case 7:
    case 8:
      uint64_t v13 = [*(id *)(a1 + 32) invalidationError];
      uint64_t v14 = *(void **)(a1 + 32);
      if (v13) {
        [v14 invalidationError];
      }
      else {
      uint64_t v15 = [v14 _getSessionFailureError];
      }

      [*(id *)(a1 + 32) _notifyDidInvalidateWithError:v15];
      return;
    default:
LABEL_10:
      if (+[NIPlatformInfo isInternalBuild])
      {
        float v12 = *(NSObject **)(*(void *)(a1 + 32) + 88);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A2C3F000, v12, OS_LOG_TYPE_DEFAULT, "Not runnable", buf, 2u);
        }
      }
      break;
  }
}

id __34__NISession_runWithConfiguration___block_invoke_780(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = @"state";
  unsigned int v1 = *(_DWORD *)(a1 + 32) - 1;
  if (v1 > 7) {
    int v2 = @"Activating";
  }
  else {
    int v2 = off_1E5AC2C20[v1];
  }
  v6[0] = v2;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

void __34__NISession_runWithConfiguration___block_invoke_785(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (v3) {
    [v4 _handleRunSessionError:v3];
  }
  else {
    [v4 _handleRunSessionSuccess];
  }
}

- (void)pause
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __18__NISession_pause__block_invoke;
  block[3] = &unk_1E5AC26D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

void __18__NISession_pause__block_invoke(uint64_t a1)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int v2 = [*(id *)(a1 + 32) internalState];
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v3 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 32) + 16);
      if ((v2 - 1) > 7) {
        id v5 = @"Activating";
      }
      else {
        id v5 = off_1E5AC2C20[v2 - 1];
      }
      *(_DWORD *)buf = 138412546;
      uint64_t v15 = v4;
      __int16 v16 = 2112;
      int v17 = v5;
      uint64_t v6 = v3;
      _os_log_impl(&dword_1A2C3F000, v6, OS_LOG_TYPE_DEFAULT, "Client: pause [%@]. State: %@.", buf, 0x16u);
    }
  }
  if ((v2 - 2) < 2)
  {
    id v10 = *(void **)(a1 + 32);
    id v9 = (id *)(a1 + 32);
    [v10 setInternalState:4];
    [*v9 _pauseInternalARSessionIfNeeded];
    uint64_t v11 = [*v9 _remoteObject];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __18__NISession_pause__block_invoke_787;
    v13[3] = &unk_1E5AC2718;
    v13[4] = *v9;
    [v11 pause:v13];
  }
  else if ((v2 - 7) >= 2)
  {
    if (v2 == 6) {
      [*(id *)(a1 + 32) _reinterruptSessionWithCachedInterruption];
    }
  }
  else
  {
    dispatch_time_t v7 = [*(id *)(a1 + 32) invalidationError];
    uint64_t v8 = *(void **)(a1 + 32);
    if (v7) {
      [v8 invalidationError];
    }
    else {
    float v12 = [v8 _getSessionFailureError];
    }

    [*(id *)(a1 + 32) _notifyDidInvalidateWithError:v12];
  }
}

void __18__NISession_pause__block_invoke_787(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = v3;
  if (v3) {
    [v4 _handlePauseSessionError:v3];
  }
  else {
    [v4 _handlePauseSessionSuccess];
  }
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__NISession_invalidate__block_invoke;
  block[3] = &unk_1E5AC26D0;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __23__NISession_invalidate__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (+[NIPlatformInfo isInternalBuild])
  {
    int v2 = *(id *)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = *(void **)(a1 + 32);
      uint64_t v4 = v3[2];
      unsigned int v5 = [v3 internalState] - 1;
      if (v5 > 7) {
        uint64_t v6 = @"Activating";
      }
      else {
        uint64_t v6 = off_1E5AC2C20[v5];
      }
      int v8 = 138412546;
      uint64_t v9 = v4;
      __int16 v10 = 2112;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "Client: invalidate [%@]. State: %@.", (uint8_t *)&v8, 0x16u);
    }
  }
  return [*(id *)(a1 + 32) _invalidateInternal];
}

- (void)dealloc
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      *(_DWORD *)buf = 138412290;
      dispatch_time_t v7 = internalID;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "Client: dealloc [%@]", buf, 0xCu);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)NISession;
  [(NISession *)&v5 dealloc];
}

- (void)setARSession:(ARSession *)session
{
  uint64_t v4 = session;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "setARSession", buf, 2u);
    }
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __26__NISession_setARSession___block_invoke;
  void v8[3] = &unk_1E5AC26A8;
  v8[4] = self;
  uint64_t v9 = v4;
  dispatch_time_t v7 = v4;
  dispatch_sync(queue, v8);
}

uint64_t __26__NISession_setARSession___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setARSessionInternal:*(void *)(a1 + 40)];
}

- (void)_setARSessionInternal:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([v4 state] == 1)
  {
    objc_super v5 = [v4 configuration];
    [(NISession *)self _handleARSession:v4 willRunWithConfiguration:v5];
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v6 = [(NISessionVisionContext *)self->_visionContext arSession];
    if ([v6 state] == 2)
    {
      uint64_t v7 = [v4 state];

      if (v7 != 2)
      {
        if (+[NIPlatformInfo isInternalBuild])
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)__int16 v10 = 0;
            _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "_setARSessionInternal: ARSession was interrupted, new ARSession created in uninterrupted state.", v10, 2u);
          }
        }
        [(NISession *)self _handleARSessionInterruptionEnded];
      }
    }
    else
    {
    }
  }
  [(NISessionVisionContext *)self->_visionContext setArSession:v4];
  uint64_t v9 = [(NISessionVisionContext *)self->_visionContext arSession];
  [v9 _addObserver:self];
}

- (simd_float4x4)worldTransformForObject:(NINearbyObject *)object
{
  id v4 = object;
  uint64_t v18 = 0;
  uint64_t v19 = (simd_float4 *)&v18;
  uint64_t v20 = 0x7012000000;
  v21 = __Block_byref_object_copy__791;
  __int16 v22 = __Block_byref_object_dispose__792;
  uint64_t v23 = &unk_1A2C7DE5B;
  simd_float4x4 v24 = NINearbyObjectWorldTransformNotAvailable;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NISession_worldTransformForObject___block_invoke;
  block[3] = &unk_1E5AC2740;
  block[4] = self;
  __int16 v16 = v4;
  int v17 = &v18;
  uint64_t v6 = v4;
  dispatch_sync(queue, block);
  simd_float4 v13 = v19[5];
  simd_float4 v14 = v19[6];
  simd_float4 v11 = v19[3];
  simd_float4 v12 = v19[4];

  _Block_object_dispose(&v18, 8);
  simd_float4 v7 = v11;
  simd_float4 v8 = v12;
  simd_float4 v9 = v13;
  simd_float4 v10 = v14;
  result.columns[3] = v10;
  result.columns[2] = v9;
  result.columns[1] = v8;
  result.columns[0] = v7;
  return result;
}

uint32x4_t __37__NISession_worldTransformForObject___block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(a1 + 32) + 192);
  if (v2)
  {
    id v3 = [v2 latestARFrame];

    if (v3)
    {
      objc_super v5 = [*(id *)(*(void *)(a1 + 32) + 192) latestARFrame];
      uint64_t v6 = [v5 camera];
      uint64_t v7 = [v6 trackingState];

      if (v7 == 2)
      {
        [*(id *)(a1 + 40) worldPosition];
        uint32x4_t result = (uint32x4_t)vceqq_f32(v8, (float32x4_t)NINearbyObjectWorldPositionNotAvailable);
        result.i32[3] = result.i32[2];
        result.i32[0] = vminvq_u32(result);
        if ((result.i32[0] & 0x80000000) == 0)
        {
          [*(id *)(a1 + 40) worldPosition];
          result.i32[3] = 1.0;
          uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
          *(_OWORD *)(v9 + 48) = xmmword_1A2C7A9D0;
          *(_OWORD *)(v9 + 64) = xmmword_1A2C7A9E0;
          *(_OWORD *)(v9 + 80) = xmmword_1A2C7AAA0;
          *(uint32x4_t *)(v9 + 96) = result;
        }
      }
    }
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (NISession *)a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (v4 == self) {
      char v5 = 1;
    }
    else {
      char v5 = [(NSUUID *)self->_internalID isEqual:v4->_internalID];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  return [(NSUUID *)self->_internalID hash];
}

- (NSString)description
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v3 = objc_alloc(MEMORY[0x1E4F28E78]);
  id v4 = (objc_class *)objc_opt_class();
  char v5 = NSStringFromClass(v4);
  id v22 = (id)[v3 initWithFormat:@"<%@: %@", v5, self->_internalID];

  uint64_t v6 = +[NISession deviceCapabilities];
  uint64_t v7 = (void *)v18[5];
  if ([v6 supportsPreciseDistanceMeasurement]) {
    float32x4_t v8 = @"YES";
  }
  else {
    float32x4_t v8 = @"NO";
  }
  [v7 appendFormat:@", preciseDistance: %@", v8];
  uint64_t v9 = (void *)v18[5];
  if ([v6 supportsDirectionMeasurement]) {
    simd_float4 v10 = @"YES";
  }
  else {
    simd_float4 v10 = @"NO";
  }
  [v9 appendFormat:@", direction: %@", v10];
  simd_float4 v11 = (void *)v18[5];
  if ([v6 supportsCameraAssistance]) {
    simd_float4 v12 = @"YES";
  }
  else {
    simd_float4 v12 = @"NO";
  }
  [v11 appendFormat:@", cameraAssistance: %@", v12];
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __24__NISession_description__block_invoke;
  block[3] = &unk_1E5AC2590;
  block[4] = self;
  void block[5] = &v17;
  dispatch_sync(queue, block);
  [(id)v18[5] appendString:@">"];
  id v14 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return (NSString *)v14;
}

void __24__NISession_description__block_invoke(uint64_t a1)
{
  int v2 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v5 = [*(id *)(*(void *)(a1 + 32) + 128) descriptionInternal];
  [v2 appendFormat:@", Token: %@", v5];

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v6 = [*(id *)(v3 + 40) descriptionInternal];
  [v4 appendFormat:@", Config: %@", v6];
}

- (void)setConfigurationForTesting:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NISession_setConfigurationForTesting___block_invoke;
  v7[3] = &unk_1E5AC26A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __40__NISession_setConfigurationForTesting___block_invoke(uint64_t a1)
{
}

- (id)getInternalIdentifier
{
  return self->_internalID;
}

- (id)getInternalLogObject
{
  return self->_log;
}

- (id)getInternalConnectionQueue
{
  return self->_queue;
}

- (void)_serverConnectionInvalidated
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  int v3 = [(NISession *)self internalState];
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if ((v3 - 1) > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1E5AC2C20[v3 - 1];
      }
      *(_DWORD *)uint64_t v9 = 138412546;
      *(void *)&void v9[4] = internalID;
      *(_WORD *)&v9[12] = 2112;
      *(void *)&v9[14] = v6;
      uint64_t v7 = log;
      _os_log_impl(&dword_1A2C3F000, v7, OS_LOG_TYPE_DEFAULT, "Server connection invalidated [%@]. State: %@.", v9, 0x16u);
    }
  }
  -[NISession setInternalState:](self, "setInternalState:", 8, *(_OWORD *)v9, *(void *)&v9[16], v10);
  if (v3 != 7)
  {
    id v8 = [(NISession *)self _getSessionFailureError];
    [(NISession *)self _notifyDidInvalidateWithError:v8];
  }
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
}

- (void)_serverConnectionInterrupted
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    int v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = [(NISession *)self internalState] - 1;
      if (v5 > 7) {
        id v6 = @"Activating";
      }
      else {
        id v6 = off_1E5AC2C20[v5];
      }
      *(_DWORD *)buf = 138412546;
      simd_float4 v13 = internalID;
      __int16 v14 = 2112;
      uint64_t v15 = v6;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Server connection interrupted [%@]. State: %@.", buf, 0x16u);
    }
  }
  uint64_t v7 = *MEMORY[0x1E4F285A0];
  v10[0] = *MEMORY[0x1E4F28588];
  v10[1] = v7;
  v11[0] = @"The session token has been invalidated. This session cannot be restarted.";
  v11[1] = @"Create a new session and exchange token again.";
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  uint64_t v9 = NIErrorWithCodeAndUserInfo(-5887, v8);

  [(NISession *)self _invalidateSessionAndNotifyError:v9];
}

- (id)_remoteObject
{
  return [(NIServerConnection *)self->_connection remoteObjectProxy];
}

- (id)_synchronousRemoteObject
{
  return [(NIServerConnection *)self->_connection synchronousRemoteObjectProxy];
}

- (void)didRemoveNearbyObjects:(id)a3 withReason:(unint64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109379;
      int v12 = a4;
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: removed objects with reason: %d. Objects: %{private}@", buf, 0x12u);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [(NISession *)self _pauseInternalARSessionIfNeeded];
    [(NISession *)self setInternalState:5];
  }
  if (a4 == 1)
  {
    id v8 = v9;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __47__NISession_didRemoveNearbyObjects_withReason___block_invoke_2;
    v9[3] = &unk_1E5AC26A8;
    void v9[4] = self;
    v9[5] = v6;
    [(NISession *)self _performBlockOnDelegateQueue:v9 ifRespondsToSelector:sel_session_didRemoveNearbyObjects_withReason_];
    goto LABEL_11;
  }
  if (!a4)
  {
    id v8 = v10;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    void v10[2] = __47__NISession_didRemoveNearbyObjects_withReason___block_invoke;
    v10[3] = &unk_1E5AC26A8;
    v10[4] = self;
    v10[5] = v6;
    [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:sel_session_didRemoveNearbyObjects_withReason_];
LABEL_11:
  }
  AnalyticsSendEventLazy();
}

void __47__NISession_didRemoveNearbyObjects_withReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didRemoveNearbyObjects:*(void *)(a1 + 40) withReason:0];
}

void __47__NISession_didRemoveNearbyObjects_withReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didRemoveNearbyObjects:*(void *)(a1 + 40) withReason:1];
}

id __47__NISession_didRemoveNearbyObjects_withReason___block_invoke_3(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  id v4 = @"reason";
  unsigned int v1 = UWBTrackingStopReasonInternalToString(*(void *)(a1 + 32));
  v5[0] = v1;
  int v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];

  return v2;
}

- (void)didUpdateNearbyObjects:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __36__NISession_didUpdateNearbyObjects___block_invoke;
  uint64_t v18 = &unk_1E5AC26A8;
  uint64_t v19 = self;
  id v5 = v4;
  id v20 = v5;
  [(NISession *)self _performBlockOnDelegateQueue:&v15 ifRespondsToSelector:sel_session_didUpdateNearbyObjects_];
  self->_updatedNearbyObjects = 1;
  -[NISession _osLogNearbyObjectUpdate:](self, "_osLogNearbyObjectUpdate:", v5, v15, v16, v17, v18, v19);
  id v6 = [v5 firstObject];
  int v7 = [v6 resetARSession];

  if (v7)
  {
    id v8 = [(NISessionVisionContext *)self->_visionContext arSession];

    uint64_t v9 = [(NISessionVisionContext *)self->_visionContext arSession];
    uint64_t v10 = [v9 state];

    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        BOOL v22 = v8 != 0;
        __int16 v23 = 1024;
        BOOL v24 = v10 == 1;
        _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: reset ARSession (Exists: %d. Running: %d)", buf, 0xEu);
      }
    }
    if (v8 && v10 == 1)
    {
      int v12 = [(NISessionVisionContext *)self->_visionContext arSession];
      __int16 v13 = [(NISessionVisionContext *)self->_visionContext arSession];
      id v14 = [v13 configuration];
      [v12 runWithConfiguration:v14 options:15];
    }
  }
}

void __36__NISession_didUpdateNearbyObjects___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didUpdateNearbyObjects:*(void *)(a1 + 40)];
}

- (void)uwbSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession uwbSessionDidFailWithError:]();
  }
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)uwbSessionDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession uwbSessionDidInvalidateWithError:]();
  }
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)uwbSessionInterruptedWithReason:(int64_t)a3 timestamp:(double)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    int v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NISession *)self internalState] - 1;
      if (v8 > 7) {
        uint64_t v9 = @"Activating";
      }
      else {
        uint64_t v9 = off_1E5AC2C20[v8];
      }
      uint64_t v10 = UWBSessionInterruptionReasonInternalToString(a3);
      *(_DWORD *)buf = 138478339;
      v27 = v9;
      __int16 v28 = 2113;
      v29 = v10;
      __int16 v30 = 2048;
      double v31 = a4;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason started. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);
    }
  }
  begin = (unint64_t *)self->_interruptions.__begin_;
  p_interruptions = &self->_interruptions;
  if (begin == (unint64_t *)self->_interruptions.__end_)
  {
    __int16 v13 = &stru_1EF5D0E08;
    end = self->_interruptions.__begin_;
  }
  else
  {
    UWBSessionInterruptionReasonInternalToString(*begin);
    __int16 v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
    end = self->_interruptions.__end_;
  }
  value = self->_interruptions.__end_cap_.__value_;
  if (end >= value)
  {
    uint64_t v17 = p_interruptions->__begin_;
    uint64_t v18 = (end - p_interruptions->__begin_) >> 4;
    unint64_t v19 = v18 + 1;
    if ((unint64_t)(v18 + 1) >> 60) {
      std::vector<unsigned short>::__throw_length_error[abi:ne180100]();
    }
    uint64_t v20 = value - v17;
    if (v20 >> 3 > v19) {
      unint64_t v19 = v20 >> 3;
    }
    if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFF0) {
      unint64_t v21 = 0xFFFFFFFFFFFFFFFLL;
    }
    else {
      unint64_t v21 = v19;
    }
    if (v21)
    {
      BOOL v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<UWBSessionInterruptionBookkeeping>>((uint64_t)&self->_interruptions.__end_cap_, v21);
      uint64_t v17 = self->_interruptions.__begin_;
      end = self->_interruptions.__end_;
    }
    else
    {
      BOOL v22 = 0;
    }
    __int16 v23 = &v22[16 * v18];
    BOOL v24 = (UWBSessionInterruptionBookkeeping *)&v22[16 * v21];
    *(void *)__int16 v23 = a3;
    *((double *)v23 + 1) = a4;
    uint64_t v16 = (UWBSessionInterruptionBookkeeping *)(v23 + 16);
    if (end != v17)
    {
      do
      {
        *((_OWORD *)v23 - 1) = *((_OWORD *)end - 1);
        v23 -= 16;
        end = (UWBSessionInterruptionBookkeeping *)((char *)end - 16);
      }
      while (end != v17);
      uint64_t v17 = p_interruptions->__begin_;
    }
    self->_interruptions.__begin_ = (UWBSessionInterruptionBookkeeping *)v23;
    self->_interruptions.__end_ = v16;
    self->_interruptions.__end_cap_.__value_ = v24;
    if (v17) {
      operator delete(v17);
    }
  }
  else
  {
    *(void *)end = a3;
    *((double *)end + 1) = a4;
    uint64_t v16 = (UWBSessionInterruptionBookkeeping *)((char *)end + 16);
  }
  self->_interruptions.__end_ = v16;
  uint64_t v25 = v13;
  AnalyticsSendEventLazy();
  [(NISession *)self _interruptSessionWithInternalReason:a3 cachedInterruption:0];
}

id __55__NISession_uwbSessionInterruptedWithReason_timestamp___block_invoke(uint64_t a1)
{
  void v8[3] = *MEMORY[0x1E4F143B8];
  v7[0] = @"reason";
  int v2 = UWBSessionInterruptionReasonInternalToString(*(void *)(a1 + 40));
  v8[0] = v2;
  v7[1] = @"reinterrupted";
  int v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  v7[2] = @"previousReason";
  uint64_t v4 = *(void *)(a1 + 32);
  v8[1] = v3;
  v8[2] = v4;
  id v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:3];

  return v5;
}

- (void)uwbSessionInterruptionReasonEnded:(int64_t)a3 timestamp:(double)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    int v7 = self->_log;
    if (os_log_type_enabled((os_log_t)v7, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v8 = [(NISession *)self internalState] - 1;
      if (v8 > 7) {
        uint64_t v9 = @"Activating";
      }
      else {
        uint64_t v9 = off_1E5AC2C20[v8];
      }
      uint64_t v10 = UWBSessionInterruptionReasonInternalToString(a3);
      *(_DWORD *)buf = 138478339;
      v26 = v9;
      __int16 v27 = 2113;
      __int16 v28 = v10;
      __int16 v29 = 2048;
      double v30 = a4;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v7, OS_LOG_TYPE_DEFAULT, "DelegateProxy: suspension reason ended. State: %{private}@. Reason: %{private}@. Timestamp: %f", buf, 0x20u);
    }
  }
  begin = self->_interruptions.__begin_;
  end = self->_interruptions.__end_;
  if (begin == end)
  {
LABEL_12:
    if (+[NIPlatformInfo isInternalBuild])
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR)) {
        -[NISession uwbSessionInterruptionReasonEnded:timestamp:]();
      }
    }
  }
  else
  {
    uint64_t v13 = 0;
    while (*(void *)((char *)begin + v13) != a3)
    {
      v13 += 16;
      if ((UWBSessionInterruptionBookkeeping *)((char *)begin + v13) == end) {
        goto LABEL_12;
      }
    }
    id v14 = (char *)begin + v13;
    uint64_t v15 = *(void *)((char *)begin + v13 + 8);
    uint64_t v16 = (UWBSessionInterruptionBookkeeping *)((char *)begin + v13 + 16);
    int64_t v17 = end - v16;
    if (end != v16)
    {
      memmove((char *)begin + v13, v16, end - v16);
      begin = self->_interruptions.__begin_;
    }
    self->_interruptions.__end_ = (UWBSessionInterruptionBookkeeping *)&v14[v17];
    v24[5] = MEMORY[0x1E4F143A8];
    v24[6] = 3221225472;
    v24[7] = __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke;
    v24[8] = &__block_descriptor_56_e19___NSDictionary_8__0l;
    BOOL v18 = begin == (UWBSessionInterruptionBookkeeping *)&v14[v17];
    v24[9] = a3;
    *(double *)&v24[10] = a4;
    v24[11] = v15;
    AnalyticsSendEventLazy();
    if (v18)
    {
      [(NISession *)self setInternalState:5];
      if (+[NIPlatformInfo isInternalBuild])
      {
        log = self->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
        {
          internalID = self->_internalID;
          *(_DWORD *)buf = 138412290;
          v26 = internalID;
          _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension ended [%@]", buf, 0xCu);
        }
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_844;
      v24[3] = &unk_1E5AC26D0;
      v24[4] = self;
      [(NISession *)self _performBlockOnDelegateQueue:v24 ifRespondsToSelector:sel_sessionSuspensionEnded_];
    }
    if ((unint64_t)(a3 - 1) > 6) {
      uint64_t v21 = 0;
    }
    else {
      uint64_t v21 = qword_1A2C7AAB0[a3 - 1];
    }
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_2;
    v22[3] = &unk_1E5AC27D0;
    v22[4] = self;
    v22[5] = v21;
    BOOL v23 = v18;
    [(NISession *)self _performBlockOnDelegateQueue:v22 ifRespondsToSelector:sel_session_suspensionReasonEnded_isNoLongerSuspended_];
  }
}

id __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke(uint64_t a1)
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"reason";
  int v2 = UWBSessionInterruptionReasonInternalToString(*(void *)(a1 + 32));
  v6[1] = @"duration";
  v7[0] = v2;
  int v3 = [NSNumber numberWithDouble:*(double *)(a1 + 40) - *(double *)(a1 + 48)];
  v7[1] = v3;
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

void __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_844(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained sessionSuspensionEnded:*(void *)(a1 + 32)];
}

void __57__NISession_uwbSessionInterruptionReasonEnded_timestamp___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) suspensionReasonEnded:*(void *)(a1 + 40) isNoLongerSuspended:*(unsigned __int8 *)(a1 + 48)];
}

- (void)didUpdateLocalDiscoveryToken:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v9 = v5;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated token %{private}@", buf, 0xCu);
    }
  }
  objc_storeStrong((id *)&self->_discoveryToken, a3);
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_discoveryTokenSemaphore);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__NISession_didUpdateLocalDiscoveryToken___block_invoke;
  void v7[3] = &unk_1E5AC26D0;
  v7[4] = self;
  [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:sel_sessionDidUpdateDiscoveryToken_];
}

void __42__NISession_didUpdateLocalDiscoveryToken___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained sessionDidUpdateDiscoveryToken:*(void *)(a1 + 32)];
}

- (void)didReceiveRangingAuthRecommendation:(BOOL)a3 forObject:(id)a4
{
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__NISession_didReceiveRangingAuthRecommendation_forObject___block_invoke;
  void v8[3] = &unk_1E5AC27F8;
  void v8[4] = self;
  BOOL v10 = a3;
  id v7 = v6;
  id v9 = v7;
  [(NISession *)self _performBlockOnDelegateQueue:v8 ifRespondsToSelector:sel_session_didReceiveRangingAuthRecommendation_forObject_];
}

void __59__NISession_didReceiveRangingAuthRecommendation_forObject___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didReceiveRangingAuthRecommendation:*(unsigned __int8 *)(a1 + 48) forObject:*(void *)(a1 + 40)];
}

- (void)didDiscoverNearbyObject:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v10 = v4;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: discovered object: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__NISession_didDiscoverNearbyObject___block_invoke;
  void v7[3] = &unk_1E5AC26A8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:sel_session_didDiscoverNearbyObject_];
}

void __37__NISession_didDiscoverNearbyObject___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didDiscoverNearbyObject:*(void *)(a1 + 40)];
}

- (void)object:(id)a3 didUpdateRegion:(id)a4 previousRegion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478339;
      id v20 = v9;
      __int16 v21 = 2113;
      id v22 = v10;
      __int16 v23 = 2113;
      id v24 = v8;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: updated region %{private}@ (previous: %{private}@). Object: %{private}@", buf, 0x20u);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__NISession_object_didUpdateRegion_previousRegion___block_invoke;
  v15[3] = &unk_1E5AC2820;
  v15[4] = self;
  id v12 = v8;
  id v16 = v12;
  id v13 = v9;
  id v17 = v13;
  id v14 = v10;
  id v18 = v14;
  [(NISession *)self _performBlockOnDelegateQueue:v15 ifRespondsToSelector:sel_session_object_didUpdateRegion_previousRegion_];
}

void __51__NISession_object_didUpdateRegion_previousRegion___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] object:a1[5] didUpdateRegion:a1[6] previousRegion:a1[7]];
}

- (void)didUpdateMotionState:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  self->_motionState = a3;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __34__NISession_didUpdateMotionState___block_invoke;
  v5[3] = &unk_1E5AC2848;
  v5[4] = self;
  v5[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v5 ifRespondsToSelector:sel_session_didUpdateLocalMotionState_];
}

void __34__NISession_didUpdateMotionState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didUpdateLocalMotionState:*(void *)(a1 + 40)];
}

- (void)didUpdateHomeDeviceUWBRangingAvailability:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __55__NISession_didUpdateHomeDeviceUWBRangingAvailability___block_invoke;
  v5[3] = &unk_1E5AC2870;
  v5[4] = self;
  BOOL v6 = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v5 ifRespondsToSelector:sel_session_didUpdateHomeDeviceUWBRangingAvailability_];
}

void __55__NISession_didUpdateHomeDeviceUWBRangingAvailability___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didUpdateHomeDeviceUWBRangingAvailability:*(unsigned __int8 *)(a1 + 40)];
}

- (void)relayDCKMessage:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __29__NISession_relayDCKMessage___block_invoke;
  v6[3] = &unk_1E5AC26A8;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(NISession *)self _performBlockOnDelegateQueue:v6 ifRespondsToSelector:sel_session_relayDCKMessage_];
}

void __29__NISession_relayDCKMessage___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) relayDCKMessage:*(void *)(a1 + 40)];
}

- (void)didUpdateHealthStatus:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__NISession_didUpdateHealthStatus___block_invoke;
  v3[3] = &unk_1E5AC2848;
  v3[4] = self;
  v3[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v3 ifRespondsToSelector:sel_session_didUpdateHealthStatus_];
}

void __35__NISession_didUpdateHealthStatus___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didUpdateHealthStatus:*(void *)(a1 + 40)];
}

- (void)didProcessAcwgM1MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __51__NISession_didProcessAcwgM1MsgWithResponse_error___block_invoke;
  v10[3] = &unk_1E5AC2898;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:sel_session_didProcessAcwgM1MsgWithResponse_error_];
}

void __51__NISession_didProcessAcwgM1MsgWithResponse_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] didProcessAcwgM1MsgWithResponse:a1[5] error:a1[6]];
}

- (void)didProcessAcwgM3MsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __51__NISession_didProcessAcwgM3MsgWithResponse_error___block_invoke;
  v10[3] = &unk_1E5AC2898;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:sel_session_didProcessAcwgM3MsgWithResponse_error_];
}

void __51__NISession_didProcessAcwgM3MsgWithResponse_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] didProcessAcwgM3MsgWithResponse:a1[5] error:a1[6]];
}

- (void)didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __76__NISession_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error___block_invoke;
  v10[3] = &unk_1E5AC2898;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:sel_session_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error_];
}

void __76__NISession_didProcessAcwgRangingSessionResumeRequestMsgWithResponse_error___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] didProcessAcwgRangingSessionResumeRequestMsgWithResponse:a1[5] error:a1[6]];
}

- (void)requestAcwgRangingSessionSuspend:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __71__NISession_requestAcwgRangingSessionSuspend_withSuspendTriggerReason___block_invoke;
  v4[3] = &unk_1E5AC28C0;
  unsigned int v5 = a3;
  v4[4] = self;
  v4[5] = a4;
  [(NISession *)self _performBlockOnDelegateQueue:v4 ifRespondsToSelector:sel_session_requestAcwgRangingSessionSuspend_withSuspendTriggerReason_];
}

void __71__NISession_requestAcwgRangingSessionSuspend_withSuspendTriggerReason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) requestAcwgRangingSessionSuspend:*(unsigned int *)(a1 + 48) withSuspendTriggerReason:*(void *)(a1 + 40)];
}

- (void)didStartAcwgRanging:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __33__NISession_didStartAcwgRanging___block_invoke;
  v3[3] = &unk_1E5AC2848;
  v3[4] = self;
  v3[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v3 ifRespondsToSelector:sel_session_didStartAcwgRanging_];
}

void __33__NISession_didStartAcwgRanging___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didStartAcwgRanging:*(void *)(a1 + 40)];
}

- (void)didSuspendAcwgRanging:(int64_t)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __35__NISession_didSuspendAcwgRanging___block_invoke;
  v3[3] = &unk_1E5AC2848;
  v3[4] = self;
  v3[5] = a3;
  [(NISession *)self _performBlockOnDelegateQueue:v3 ifRespondsToSelector:sel_session_didSuspendAcwgRanging_];
}

void __35__NISession_didSuspendAcwgRanging___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didSuspendAcwgRanging:*(void *)(a1 + 40)];
}

- (void)didPrefetchAcwgUrsk:(unsigned int)a3 error:(id)a4
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __39__NISession_didPrefetchAcwgUrsk_error___block_invoke;
  void v8[3] = &unk_1E5AC28E8;
  unsigned int v10 = a3;
  void v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v8 ifRespondsToSelector:sel_session_didPrefetchAcwgUrsk_error_];
}

void __39__NISession_didPrefetchAcwgUrsk_error___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didPrefetchAcwgUrsk:*(unsigned int *)(a1 + 48) error:*(void *)(a1 + 40)];
}

- (void)didGenerateShareableConfigurationData:(id)a3 forObject:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138478083;
      id v15 = v6;
      __int16 v16 = 2113;
      id v17 = v7;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: generated shareable config: %{private}@. Object: %{private}@", buf, 0x16u);
    }
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  void v11[2] = __61__NISession_didGenerateShareableConfigurationData_forObject___block_invoke;
  v11[3] = &unk_1E5AC2898;
  v11[4] = self;
  id v9 = v6;
  id v12 = v9;
  id v10 = v7;
  id v13 = v10;
  [(NISession *)self _performBlockOnDelegateQueue:v11 ifRespondsToSelector:sel_session_didGenerateShareableConfigurationData_forObject_];
}

void __61__NISession_didGenerateShareableConfigurationData_forObject___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] didGenerateShareableConfigurationData:a1[5] forObject:a1[6]];
}

- (void)systemDidUpdateState:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      id v10 = v4;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated state: %{private}@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__NISession_systemDidUpdateState___block_invoke;
  void v7[3] = &unk_1E5AC26A8;
  v7[4] = self;
  id v6 = v4;
  id v8 = v6;
  [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:sel_systemConfigurator_didUpdateState_];
}

void __34__NISession_systemDidUpdateState___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained systemConfigurator:*(void *)(a1 + 32) didUpdateState:*(void *)(a1 + 40)];
}

- (void)systemDidUpdateResourceUsageLimitExceeded:(BOOL)a3 forSessionConfigurationTypeWithName:(id)a4
{
  BOOL v4 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = (NSString *)a4;
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67174915;
      BOOL v12 = v4;
      __int16 v13 = 2113;
      id v14 = v6;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: system updated resource usage limit exceeded: %{private}d. Configuration type: %{private}@", buf, 0x12u);
    }
  }
  Class v8 = NSClassFromString(v6);
  if (v8)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __91__NISession_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName___block_invoke;
    v9[3] = &unk_1E5AC2910;
    BOOL v10 = v4;
    void v9[4] = self;
    v9[5] = v8;
    [(NISession *)self _performBlockOnDelegateQueue:v9 ifRespondsToSelector:sel_systemConfigurator_didUpdateResourceUsageLimitExceeded_forSessionConfigurationType_];
  }
}

void __91__NISession_systemDidUpdateResourceUsageLimitExceeded_forSessionConfigurationTypeWithName___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained systemConfigurator:*(void *)(a1 + 32) didUpdateResourceUsageLimitExceeded:*(unsigned __int8 *)(a1 + 48) forSessionConfigurationType:*(void *)(a1 + 40)];
}

- (void)didUpdateAlgorithmState:(id)a3 forObject:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 convergence];
  id v9 = objc_opt_new();
  if ([v6 insufficientSignalStrength]) {
    [v9 addObject:@"insufficientSignalStrength"];
  }
  if ([v6 insufficientHorizontalSweep]) {
    [v9 addObject:@"insufficientHorizontalSweep"];
  }
  if ([v6 insufficientVerticalSweep]) {
    [v9 addObject:@"insufficientVerticalSweep"];
  }
  if ([v6 insufficientMovement]) {
    [v9 addObject:@"insufficientMovement"];
  }
  if ([v6 insufficientLighting]) {
    [v9 addObject:@"insufficientLighting"];
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109635;
      int v23 = v8;
      __int16 v24 = 2113;
      id v25 = v7;
      __int16 v26 = 2113;
      __int16 v27 = v9;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "DelegateProxy: algorithm convergence status: %d. Object: %{private}@. Reasons: %{private}@", buf, 0x1Cu);
    }
  }
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __47__NISession_didUpdateAlgorithmState_forObject___block_invoke;
  v18[3] = &unk_1E5AC2938;
  v18[4] = self;
  uint64_t v21 = v8;
  id v11 = v9;
  id v19 = v11;
  id v12 = v7;
  id v20 = v12;
  [(NISession *)self _performBlockOnDelegateQueue:v18 ifRespondsToSelector:sel_session_didUpdateAlgorithmConvergence_forObject_];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __47__NISession_didUpdateAlgorithmState_forObject___block_invoke_2;
  v15[3] = &unk_1E5AC2898;
  v15[4] = self;
  id v13 = v6;
  id v16 = v13;
  id v14 = v12;
  id v17 = v14;
  [(NISession *)self _performBlockOnDelegateQueue:v15 ifRespondsToSelector:sel_session_didUpdateAlgorithmState_forObject_];
}

void __47__NISession_didUpdateAlgorithmState_forObject___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  uint64_t v2 = a1[4];
  int v3 = [[NIAlgorithmConvergence alloc] initWithStatus:a1[7] andReasons:a1[5]];
  [WeakRetained session:v2 didUpdateAlgorithmConvergence:v3 forObject:a1[6]];
}

void __47__NISession_didUpdateAlgorithmState_forObject___block_invoke_2(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] didUpdateAlgorithmState:a1[5] forObject:a1[6]];
}

- (void)session:(id)a3 didUpdateFrame:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __36__NISession_session_didUpdateFrame___block_invoke;
  void v8[3] = &unk_1E5AC26A8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __36__NISession_session_didUpdateFrame___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleARSessionDidUpdateFrame:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 didFailWithError:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __38__NISession_session_didFailWithError___block_invoke;
  void v8[3] = &unk_1E5AC26A8;
  void v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(queue, v8);
}

uint64_t __38__NISession_session_didFailWithError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleARSessionDidFailWithError:*(void *)(a1 + 40)];
}

- (void)sessionWasInterrupted:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__NISession_sessionWasInterrupted___block_invoke;
  block[3] = &unk_1E5AC26D0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__NISession_sessionWasInterrupted___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleARSessionWasInterrupted];
}

- (void)sessionInterruptionEnded:(id)a3
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__NISession_sessionInterruptionEnded___block_invoke;
  block[3] = &unk_1E5AC26D0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __38__NISession_sessionInterruptionEnded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleARSessionInterruptionEnded];
}

- (void)session:(id)a3 didChangeState:(unint64_t)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __36__NISession_session_didChangeState___block_invoke;
  v5[3] = &unk_1E5AC2848;
  v5[4] = self;
  void v5[5] = a4;
  dispatch_async(queue, v5);
}

uint64_t __36__NISession_session_didChangeState___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleARSessionDidChangeState:*(void *)(a1 + 40)];
}

- (void)session:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__NISession_session_willRunWithConfiguration___block_invoke;
  block[3] = &unk_1E5AC2898;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

uint64_t __46__NISession_session_willRunWithConfiguration___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleARSession:*(void *)(a1 + 40) willRunWithConfiguration:*(void *)(a1 + 48)];
}

- (void)sessionShouldAttemptRelocalization:(id)a3 completion:(id)a4
{
  id v6 = a4;
  if (!v6)
  {
    id v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"NISession.mm", 1439, @"Invalid parameter not satisfying: %@", @"completion" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__NISession_sessionShouldAttemptRelocalization_completion___block_invoke;
  block[3] = &unk_1E5AC2960;
  block[4] = self;
  id v11 = v6;
  id v8 = v6;
  dispatch_async(queue, block);
}

uint64_t __59__NISession_sessionShouldAttemptRelocalization_completion___block_invoke(uint64_t a1)
{
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v2 = *(NSObject **)(*(void *)(a1 + 32) + 88);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v4 = 0;
      _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "Called with sessionShouldAttemptRelocalization", v4, 2u);
    }
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_handleARSessionDidUpdateFrame:(id)a3
{
  id v26 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] == 3)
  {
    [(NISessionVisionContext *)self->_visionContext setLatestARFrame:v26];
    BOOL v4 = [v26 camera];
    int64_t v5 = -[NISession niVisionInputTrackingStateFromARTRackingState:](self, "niVisionInputTrackingStateFromARTRackingState:", [v4 trackingState]);

    id v6 = [v26 worldTrackingState];

    if (v6)
    {
      id v7 = [v26 worldTrackingState];
      id v6 = (void *)[v7 majorRelocalization];

      id v8 = [v26 worldTrackingState];
      uint64_t v9 = [v8 minorRelocalization];
    }
    else
    {
      uint64_t v9 = 0;
    }
    id v10 = [NIVisionInput alloc];
    [v26 timestamp];
    double v12 = v11;
    id v13 = [v26 camera];
    [v13 transform];
    double v24 = v15;
    double v25 = v14;
    double v22 = v17;
    double v23 = v16;
    uint64_t v18 = [v26 lightEstimate];
    [(NISession *)self lightEstimateFromARLightEstimate:v18];
    id v20 = -[NIVisionInput initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:](v10, "initWithTimestamp:devicePose:trackingState:lightEstimate:majorRelocalization:minorRelocalization:", v5, v6, v9, v12, v25, v24, v23, v22, v19);

    uint64_t v21 = [(NISession *)self _remoteObject];
    [v21 processVisionInput:v20];
  }
}

- (void)_handleARSessionDidFailWithError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession _handleARSessionDidFailWithError:]();
  }
  int64_t v5 = [(NISession *)self _remoteObject];
  [v5 arSessionDidFailWithError:v4];
}

- (void)_handleARSessionWasInterrupted
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v5 = 0;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "ARSession: interrupted", v5, 2u);
    }
  }
  id v4 = [(NISession *)self _remoteObject];
  [v4 arSessionWasInterrupted];
}

- (void)_handleARSessionInterruptionEnded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v5 = 0;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "ARSession: interruption ended", v5, 2u);
    }
  }
  id v4 = [(NISession *)self _remoteObject];
  [v4 arSessionInterruptionEnded];
}

- (void)_handleARSessionDidChangeState:(unint64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = a3;
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "ARSession: changed state: %d", (uint8_t *)v6, 8u);
    }
  }
  [(NISessionVisionContext *)self->_visionContext setArSessionState:a3];
}

- (void)_handleARSession:(id)a3 willRunWithConfiguration:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NISession *)self _isValidARSession:v6 andConfiguration:v7])
  {
    if (+[NIPlatformInfo isInternalBuild]
      && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[NISession _handleARSession:willRunWithConfiguration:]();
    }
    id v8 = [(NISession *)self _remoteObject];
    [v8 arSessionWillRunWithInvalidConfiguration];
  }
}

- (void)_configureAndRunInternalARSession
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A2C3F000, v0, v1, "External ARSession provided but camera assistance requested in server", v2, v3, v4, v5, v6);
}

void __46__NISession__configureAndRunInternalARSession__block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void **)(a1 + 32);
  uint64_t v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Invalid camera assistance configuration.";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.NearbyInteraction" code:-5888 userInfo:v3];
  [v1 _invalidateSessionAndNotifyError:v4];
}

- (BOOL)_isValidARSession:(id)a3 andConfiguration:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6)
  {
    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      BOOL v12 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      double v15 = "_isValidARSession returning NO: session is nil";
LABEL_32:
      _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, v15, buf, 2u);
    }
LABEL_33:
    BOOL v12 = 0;
    goto LABEL_34;
  }
  visionContext = self->_visionContext;
  if (!visionContext
    || ![(NISessionVisionContext *)visionContext isARSessionInClientProcess])
  {
    __assert_rtn("-[NISession _isValidARSession:andConfiguration:]", "NISession.mm", 1573, "_visionContext && _visionContext.isARSessionInClientProcess");
  }
  if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal])
  {
    uint64_t v9 = [(NISessionVisionContext *)self->_visionContext arSession];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __48__NISession__isValidARSession_andConfiguration___block_invoke;
    v25[3] = &unk_1E5AC2988;
    v25[4] = self;
    [(NISession *)self sessionShouldAttemptRelocalization:v9 completion:v25];

    goto LABEL_6;
  }
  double v16 = [v6 delegate];
  if (!v16)
  {
    if (!+[NIPlatformInfo isInternalBuild]) {
      goto LABEL_28;
    }
    double v17 = self->_log;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    uint64_t v18 = "_isValidARSession returning NO: session.delegate is nil";
    goto LABEL_27;
  }
  if ((objc_opt_respondsToSelector() & 1) == 0
    || [v16 sessionShouldAttemptRelocalization:v6])
  {
    if (!+[NIPlatformInfo isInternalBuild]) {
      goto LABEL_28;
    }
    double v17 = self->_log;
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_28;
    }
    *(_WORD *)buf = 0;
    uint64_t v18 = "_isValidARSession returning NO: attempting relocalization is not disabled";
LABEL_27:
    _os_log_impl(&dword_1A2C3F000, v17, OS_LOG_TYPE_DEFAULT, v18, buf, 2u);
LABEL_28:

    goto LABEL_33;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v20 = self->_log;
    if (os_log_type_enabled((os_log_t)v20, OS_LOG_TYPE_DEFAULT))
    {
      int v21 = [v16 sessionShouldAttemptRelocalization:v6];
      double v22 = "NO";
      if (v21) {
        double v22 = "YES";
      }
      *(_DWORD *)buf = 136315138;
      __int16 v27 = v22;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v20, OS_LOG_TYPE_DEFAULT, "_isValidARSession got %s from sessionShouldAttemptRelocalization", buf, 0xCu);
    }
  }
LABEL_6:
  if (!v7)
  {
    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      BOOL v12 = 0;
      if (!os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_34;
      }
      *(_WORD *)buf = 0;
      double v15 = "_isValidARSession returning NO: configuration is nil";
      goto LABEL_32;
    }
    goto LABEL_33;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = v7;
    if ([v10 worldAlignment])
    {
      if (+[NIPlatformInfo isInternalBuild])
      {
        double v11 = self->_log;
        BOOL v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v13 = "_isValidARSession returning NO: world alignment is not gravity";
LABEL_50:
          _os_log_impl(&dword_1A2C3F000, v11, OS_LOG_TYPE_DEFAULT, v13, buf, 2u);
          goto LABEL_51;
        }
        goto LABEL_52;
      }
    }
    else
    {
      double v23 = [v10 initialWorldMap];
      BOOL v24 = v23 == 0;

      if (v24)
      {
        if (![v10 isCollaborationEnabled])
        {
          BOOL v12 = 1;
          goto LABEL_52;
        }
        if (!+[NIPlatformInfo isInternalBuild]) {
          goto LABEL_51;
        }
        double v11 = self->_log;
        BOOL v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v13 = "_isValidARSession returning NO: collaboration is not disabled";
          goto LABEL_50;
        }
        goto LABEL_52;
      }
      if (+[NIPlatformInfo isInternalBuild])
      {
        double v11 = self->_log;
        BOOL v12 = 0;
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          id v13 = "_isValidARSession returning NO: initial world map is non-nil";
          goto LABEL_50;
        }
LABEL_52:

        goto LABEL_34;
      }
    }
LABEL_51:
    BOOL v12 = 0;
    goto LABEL_52;
  }
  if (!+[NIPlatformInfo isInternalBuild]) {
    goto LABEL_33;
  }
  log = self->_log;
  BOOL v12 = 0;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    double v15 = "_isValidARSession returning NO: configuration is not ARWorldTrackingConfiguration";
    goto LABEL_32;
  }
LABEL_34:

  return v12;
}

void __48__NISession__isValidARSession_andConfiguration___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    if (+[NIPlatformInfo isInternalBuild])
    {
      uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 88);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)uint64_t v5 = 0;
        _os_log_impl(&dword_1A2C3F000, v3, OS_LOG_TYPE_DEFAULT, "_isValidARSession invalidating session: attempting relocalization is not disabled in internal session", v5, 2u);
      }
    }
    uint64_t v4 = [*(id *)(a1 + 32) _remoteObject];
    [v4 arSessionWillRunWithInvalidConfiguration];
  }
}

- (void)_pauseInternalARSessionIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal]
    && [(NISessionVisionContext *)self->_visionContext isARSessionInClientProcess])
  {
    id v3 = [(NISessionVisionContext *)self->_visionContext arSession];
    [v3 pause];
  }
}

- (void)_invalidateInternalARSessionIfNeeded
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISessionVisionContext *)self->_visionContext isARSessionInternal]
    && [(NISessionVisionContext *)self->_visionContext isARSessionInClientProcess])
  {
    id v3 = [(NISessionVisionContext *)self->_visionContext arSession];
    [v3 pause];

    uint64_t v4 = [(NISessionVisionContext *)self->_visionContext arSession];
    [v4 _removeObserver:self];

    visionContext = self->_visionContext;
    self->_visionContext = 0;
  }
}

- (int64_t)niVisionInputTrackingStateFromARTRackingState:(int64_t)a3
{
  if (a3 == 2) {
    return 2;
  }
  else {
    return a3 == 1;
  }
}

- (double)lightEstimateFromARLightEstimate:(id)a3
{
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3)
  {
    [v3 ambientIntensity];
    double v6 = v5;
  }
  else
  {
    double v6 = *(double *)&NIARLightEstimateNotAvailable;
  }

  return v6;
}

- (void)_invalidateSessionAndNotifyError:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _notifyDidInvalidateWithError:v4];
  [(NISession *)self _invalidateInternal];
}

- (void)_interruptSessionWithInternalReason:(int64_t)a3 cachedInterruption:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] != 6 || v4)
  {
    [(NISession *)self setInternalState:6];
    if (+[NIPlatformInfo isInternalBuild])
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
      {
        internalID = self->_internalID;
        *(_DWORD *)buf = 138412290;
        id v13 = internalID;
        _os_log_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_DEFAULT, "Delegate: notify suspension started [%@]", buf, 0xCu);
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke;
    v11[3] = &unk_1E5AC26D0;
    v11[4] = self;
    [(NISession *)self _performBlockOnDelegateQueue:v11 ifRespondsToSelector:sel_sessionWasSuspended_];
  }
  if ((unint64_t)(a3 - 1) > 6) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = qword_1A2C7AAB0[a3 - 1];
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke_2;
  v10[3] = &unk_1E5AC2848;
  v10[4] = self;
  void v10[5] = v9;
  [(NISession *)self _performBlockOnDelegateQueue:v10 ifRespondsToSelector:sel_session_suspendedWithReason_];
}

void __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained sessionWasSuspended:*(void *)(a1 + 32)];
}

void __68__NISession__interruptSessionWithInternalReason_cachedInterruption___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) suspendedWithReason:*(void *)(a1 + 40)];
}

- (void)_reinterruptSessionWithCachedInterruption
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A2C3F000, v0, v1, "No cached suspensions found.", v2, v3, v4, v5, v6);
}

- (void)_invalidateInternal
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  unsigned int v3 = [(NISession *)self internalState];
  if (+[NIPlatformInfo isInternalBuild])
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      if (v3 - 1 > 7) {
        uint8_t v6 = @"Activating";
      }
      else {
        uint8_t v6 = off_1E5AC2C20[v3 - 1];
      }
      int v9 = 138412546;
      id v10 = internalID;
      __int16 v11 = 2112;
      BOOL v12 = v6;
      id v7 = log;
      _os_log_impl(&dword_1A2C3F000, v7, OS_LOG_TYPE_DEFAULT, "invalidateInternal [%@]. State: %@.", (uint8_t *)&v9, 0x16u);
    }
  }
  if (v3 <= 6)
  {
    [(NISession *)self _logDurationAndSubmit:self->_updatedNearbyObjects];
    [(NISession *)self setInternalState:7];
    [(NIServerConnection *)self->_connection invalidate];
    currentConfiguration = self->_currentConfiguration;
    self->_currentConfiguration = 0;

    [(NISession *)self _invalidateInternalARSessionIfNeeded];
  }
}

- (void)_handleActivationError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        id v8 = @"Activating";
      }
      else {
        id v8 = off_1E5AC2C20[v7];
      }
      int v9 = 138412802;
      id v10 = internalID;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)_handleActivationSuccess:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        id v8 = @"Activating";
      }
      else {
        id v8 = off_1E5AC2C20[v7];
      }
      int v9 = 138412802;
      id v10 = internalID;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Activation success [%@]. State: %@. Response: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (![(NISession *)self internalState]) {
    [(NISession *)self setInternalState:1];
  }
  if (!v4) {
    __assert_rtn("-[NISession _handleActivationSuccess:]", "NISession.mm", 1772, "activationResponse != nil");
  }
  [(NISession *)self setActivationResponse:v4];
}

- (void)_handleRunSessionError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        id v8 = @"Activating";
      }
      else {
        id v8 = off_1E5AC2C20[v7];
      }
      int v9 = 138412802;
      id v10 = internalID;
      __int16 v11 = 2112;
      BOOL v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Run session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)_handleRunSessionSuccess
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = [(NISession *)self internalState] - 1;
      if (v5 > 7) {
        uint8_t v6 = @"Activating";
      }
      else {
        uint8_t v6 = off_1E5AC2C20[v5];
      }
      *(_DWORD *)buf = 138412546;
      int v9 = internalID;
      __int16 v10 = 2112;
      __int16 v11 = v6;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Run session succeeded [%@]. State: %@", buf, 0x16u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] == 2)
  {
    [(NISession *)self setInternalState:3];
    if ([(NIConfiguration *)self->_currentConfiguration _internalIsCameraAssistanceEnabled])
    {
      [(NISession *)self _configureAndRunInternalARSession];
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __37__NISession__handleRunSessionSuccess__block_invoke;
    void v7[3] = &unk_1E5AC26D0;
    v7[4] = self;
    [(NISession *)self _performBlockOnDelegateQueue:v7 ifRespondsToSelector:sel_sessionDidStartRunning_];
  }
}

void __37__NISession__handleRunSessionSuccess__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained sessionDidStartRunning:*(void *)(a1 + 32)];
}

- (void)_handlePauseSessionError:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v5 = self->_log;
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v7 = [(NISession *)self internalState] - 1;
      if (v7 > 7) {
        id v8 = @"Activating";
      }
      else {
        id v8 = off_1E5AC2C20[v7];
      }
      int v9 = 138412802;
      __int16 v10 = internalID;
      __int16 v11 = 2112;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v5, OS_LOG_TYPE_DEFAULT, "Pause session error [%@]. State: %@. Error: %@", (uint8_t *)&v9, 0x20u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  [(NISession *)self _invalidateSessionAndNotifyError:v4];
}

- (void)_handlePauseSessionSuccess
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (+[NIPlatformInfo isInternalBuild])
  {
    unsigned int v3 = self->_log;
    if (os_log_type_enabled((os_log_t)v3, OS_LOG_TYPE_DEFAULT))
    {
      internalID = self->_internalID;
      unsigned int v5 = [(NISession *)self internalState] - 1;
      if (v5 > 7) {
        uint8_t v6 = @"Activating";
      }
      else {
        uint8_t v6 = off_1E5AC2C20[v5];
      }
      int v7 = 138412546;
      id v8 = internalID;
      __int16 v9 = 2112;
      __int16 v10 = v6;
      _os_log_impl(&dword_1A2C3F000, (os_log_t)v3, OS_LOG_TYPE_DEFAULT, "Pause session success [%@]. State: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if ([(NISession *)self internalState] == 4)
  {
    [(NISession *)self setInternalState:5];
    [(NISession *)self _logDurationAndSubmit:0];
  }
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4
{
}

- (void)_performBlockOnDelegateQueue:(id)a3 ifRespondsToSelector:(SEL)a4 evenIfNotRunning:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  __int16 v9 = v8;
  unsigned __int8 v10 = atomic_load((unsigned __int8 *)&self->_readyForCallbacks);
  if ((v10 & 1) != 0 || v5)
  {
    dispatch_block_t block = v8;
    if (a4)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) == 0)
      {

        goto LABEL_10;
      }
      delegateQueue = self->_delegateQueue;

      __int16 v9 = block;
      if (!delegateQueue) {
        goto LABEL_11;
      }
      __int16 v13 = self->_delegateQueue;
    }
    else
    {
      __int16 v13 = self->_delegateQueue;
      if (!v13) {
        goto LABEL_11;
      }
    }
    dispatch_async(v13, block);
LABEL_10:
    __int16 v9 = block;
  }
LABEL_11:
}

- (id)_verifyError:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 code];
  if ((unint64_t)(v5 + 5889) < 8)
  {
    uint64_t v6 = [v4 code];
    int v7 = [v4 userInfo];
    uint64_t v8 = NIErrorWithCodeAndUserInfo(v6, v7);
LABEL_5:
    __int16 v9 = (void *)v8;

    goto LABEL_6;
  }
  if ((unint64_t)(v5 + 10017) < 2)
  {
    int v7 = [v4 userInfo];
    uint64_t v8 = NIErrorWithCodeAndUserInfo(-5887, v7);
    goto LABEL_5;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v11 = self->_log;
    if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = [NSString stringWithFormat:@"Invalid error code blocked from being sent to NISessionDelegate.  Error: %@", v4];
      [(NISession *)v12 _verifyError:(os_log_t)v11];
    }
  }
  __int16 v9 = NIErrorWithCodeAndUserInfo(-5887, 0);
LABEL_6:

  return v9;
}

- (void)_notifyDidInvalidateWithError:(id)a3
{
  id v4 = a3;
  if ([(NISession *)self _isInternalClient])
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [(NISession *)self _verifyError:v4];
  }
  uint64_t v6 = v5;
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[NISession _notifyDidInvalidateWithError:]();
  }
  [(NISession *)self setInvalidationError:v6];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  unsigned __int8 v10 = __43__NISession__notifyDidInvalidateWithError___block_invoke;
  uint64_t v11 = &unk_1E5AC26A8;
  uint64_t v12 = self;
  id v7 = v6;
  id v13 = v7;
  [(NISession *)self _performBlockOnDelegateQueue:&v8 ifRespondsToSelector:sel_session_didInvalidateWithError_];
  -[NISession _submitErrorMetric:](self, "_submitErrorMetric:", v4, v8, v9, v10, v11, v12);
}

void __43__NISession__notifyDidInvalidateWithError___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didInvalidateWithError:*(void *)(a1 + 40)];
}

- (id)_getSessionFailureError
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F28588];
  v6[0] = @"This session object is invalidated. Dispose of it and create a new one instead.";
  uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  unsigned int v3 = NIErrorWithCodeAndUserInfo(-5887, v2);

  return v3;
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (dispatch_queue_t)delegateQueue
{
  return (dispatch_queue_t)self->_delegateQueue;
}

- (int)internalState
{
  return self->_internalState;
}

- (void)setInternalState:(int)a3
{
  self->_internalState = a3;
}

- (NSError)invalidationError
{
  return (NSError *)objc_getProperty(self, a2, 272, 1);
}

- (void)setInvalidationError:(id)a3
{
}

- (NSDictionary)activationResponse
{
  return (NSDictionary *)objc_getProperty(self, a2, 280, 1);
}

- (void)setActivationResponse:(id)a3
{
}

- (NIInternalSessionDelegate)internalDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_internalDelegate);

  return (NIInternalSessionDelegate *)WeakRetained;
}

- (void)setInternalDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_internalDelegate);
  objc_storeStrong((id *)&self->_activationResponse, 0);
  objc_storeStrong((id *)&self->_invalidationError, 0);
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_lastObjectUpdateLogTime, 0);
  objc_storeStrong((id *)&self->_visionContext, 0);
  objc_storeStrong((id *)&self->_systemEventNotifier, 0);
  objc_storeStrong((id *)&self->_findingNotifier, 0);
  objc_storeStrong((id *)&self->_devicePresenceNotifier, 0);
  objc_storeStrong((id *)&self->_acwgEventNotifier, 0);
  objc_storeStrong((id *)&self->_carKeyEventNotifier, 0);
  objc_storeStrong((id *)&self->_discoveryToken, 0);
  objc_storeStrong((id *)&self->_log, 0);
  begin = self->_interruptions.__begin_;
  if (begin)
  {
    self->_interruptions.__end_ = begin;
    operator delete(begin);
  }
  objc_storeStrong((id *)&self->_discoveryTokenSemaphore, 0);
  objc_storeStrong((id *)&self->_currentConfiguration, 0);
  objc_storeStrong((id *)&self->_exportedObjectForwarder, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_internalID, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

- (id).cxx_construct
{
  *((void *)self + 7) = 0;
  *((void *)self + 8) = 0;
  *((void *)self + 9) = 0;
  *((void *)self + 26) = 0;
  *((void *)self + 27) = 0;
  uint64_t v2 = &NINearbyObjectDistanceNotAvailable;
  float32x4_t v3 = vld1q_dup_f32(v2);
  *((float32x4_t *)self + 14) = v3;
  v3.f32[0] = NINearbyObjectAngleNotAvailable;
  *((float *)self + 60) = NINearbyObjectAngleNotAvailable;
  *((_DWORD *)self + 61) = v3.i32[0];
  return self;
}

+ (NIInternalDeviceCapability)internalDeviceCapabilities
{
  uint64_t v2 = +[NISession cachedPlatformCapabilities];

  if (!v2) {
    +[NISession _queryAndCacheCapabilities];
  }
  float32x4_t v3 = +[NISession cachedPlatformCapabilities];
  id v4 = [v3 objectForKey:@"UWBSupportedPlatform"];
  uint64_t v5 = [v4 BOOLValue];

  uint64_t v6 = +[NISession cachedPlatformCapabilities];
  id v7 = [v6 objectForKey:@"WifiSupportedPlatform"];
  uint64_t v8 = [v7 BOOLValue];

  uint64_t v9 = +[NISession cachedPlatformCapabilities];
  unsigned __int8 v10 = [v9 objectForKey:@"UWBSupportedPlatformPDOA"];
  uint64_t v11 = [v10 BOOLValue];

  uint64_t v12 = +[NISession cachedPlatformCapabilities];
  id v13 = [v12 objectForKey:@"UWBSupportedPlatformSyntheticAperture"];
  uint64_t v14 = [v13 BOOLValue];

  uint64_t v15 = +[NISession cachedPlatformCapabilities];
  double v16 = [v15 objectForKey:@"UWBSupportedPlatformExtendedDistance"];
  uint64_t v17 = [v16 BOOLValue];

  uint64_t v18 = [[NIDeviceCapabilities alloc] initWithFineRangingSupport:v5 coarseRangingSupport:v8 aoaSupport:v11 extendedDistanceMeasurementSupport:v17 syntheticApertureSupport:v14];

  return (NIInternalDeviceCapability *)v18;
}

- (void)_addObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 1982, @"Invalid parameter not satisfying: %@", @"discoveryToken" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NISession_Internal___addObject___block_invoke;
  block[3] = &unk_1E5AC26A8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

void __34__NISession_Internal___addObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _remoteObject];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __34__NISession_Internal___addObject___block_invoke_2;
  v4[3] = &unk_1E5AC2718;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 _addObject:v3 reply:v4];
}

void __34__NISession_Internal___addObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __34__NISession_Internal___addObject___block_invoke_3;
    v6[3] = &unk_1E5AC26A8;
    v6[4] = v5;
    id v7 = v3;
    [v5 _performBlockOnDelegateQueue:v6 ifRespondsToSelector:sel_session_didFailWithError_];
  }
}

void __34__NISession_Internal___addObject___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)_removeObject:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 1996, @"Invalid parameter not satisfying: %@", @"discoveryToken" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__NISession_Internal___removeObject___block_invoke;
  block[3] = &unk_1E5AC26A8;
  block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

void __37__NISession_Internal___removeObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _remoteObject];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__NISession_Internal___removeObject___block_invoke_2;
  v4[3] = &unk_1E5AC2718;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  [v2 _removeObject:v3 reply:v4];
}

void __37__NISession_Internal___removeObject___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    id v5 = *(void **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    void v6[2] = __37__NISession_Internal___removeObject___block_invoke_3;
    v6[3] = &unk_1E5AC26A8;
    v6[4] = v5;
    id v7 = v3;
    [v5 _performBlockOnDelegateQueue:v6 ifRespondsToSelector:sel_session_didFailWithError_];
  }
}

void __37__NISession_Internal___removeObject___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 256));
  [WeakRetained session:*(void *)(a1 + 32) didFailWithError:*(void *)(a1 + 40)];
}

- (void)_addRegionPredicate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2010 description:@"_addRegionPredicate is deprecated"];
}

- (void)_removeRegionPredicate:(id)a3
{
  objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [v5 handleFailureInMethod:a2 object:self file:@"NISession.mm" lineNumber:2014 description:@"_removeRegionPredicate is deprecated"];
}

+ (id)observerSession
{
  id v2 = [[NISession alloc] _initAndConnectToServerWithOptions:1];

  return v2;
}

- (BOOL)isPreciseRangingAllowed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __46__NISession_Internal__isPreciseRangingAllowed__block_invoke;
  v5[3] = &unk_1E5AC29D8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __46__NISession_Internal__isPreciseRangingAllowed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousRemoteObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __46__NISession_Internal__isPreciseRangingAllowed__block_invoke_2;
  v3[3] = &unk_1E5AC29B0;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 isPreciseRangingAllowed:v3];
}

void __46__NISession_Internal__isPreciseRangingAllowed__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    [*(id *)(a1 + 32) _invalidateSessionAndNotifyError:v5];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (BOOL)isExtendedDistanceMeasurementAllowed
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke;
  v5[3] = &unk_1E5AC29D8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousRemoteObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke_2;
  v3[3] = &unk_1E5AC29B0;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 isExtendedDistanceMeasurementAllowed:v3];
}

void __59__NISession_Internal__isExtendedDistanceMeasurementAllowed__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    [*(id *)(a1 + 32) _invalidateSessionAndNotifyError:v5];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (void)processBluetoothHostTimeSyncWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4 eventCounter:(unint64_t)a5
{
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke;
  v6[3] = &unk_1E5AC2A28;
  v6[4] = self;
  void v6[5] = a3;
  v6[6] = a4;
  v6[7] = a5;
  dispatch_sync(queue, v6);
}

void __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = *(void *)(a1 + 56);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_2;
  v6[3] = &unk_1E5AC2A00;
  v6[4] = *(void *)(a1 + 32);
  [v2 processBluetoothHostTimeSyncWithType:v3 btcClockTicks:v4 eventCounter:v5 reply:v6];
}

void __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 32);
  if (v6)
  {
    [v7 _invalidateSessionAndNotifyError:v6];
  }
  else
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_3;
    void v8[3] = &unk_1E5AC2898;
    void v8[4] = v7;
    id v9 = v5;
    id v10 = 0;
    [v7 _performBlockOnDelegateQueue:v8 ifRespondsToSelector:sel_session_didProcessBluetoothHostTimeSyncWithResponse_error_];
  }
}

void __87__NISession_Internal__processBluetoothHostTimeSyncWithType_btcClockTicks_eventCounter___block_invoke_3(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 256));
  [WeakRetained session:a1[4] didProcessBluetoothHostTimeSyncWithResponse:a1[5] error:a1[6]];
}

- (void)processDCKMessage:(id)a3 responseCallback:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  id v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"NISession.mm", 2182, @"Invalid parameter not satisfying: %@", @"dckMessage" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  double v16 = [MEMORY[0x1E4F28B00] currentHandler];
  [v16 handleFailureInMethod:a2, self, @"NISession.mm", 2183, @"Invalid parameter not satisfying: %@", @"responseCallback" object file lineNumber description];

LABEL_3:
  if ([v7 length])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_2;
    block[3] = &unk_1E5AC2AE8;
    block[4] = self;
    id v18 = v7;
    id v19 = v9;
    id v11 = v9;
    dispatch_sync(queue, block);

    uint64_t v12 = v18;
  }
  else
  {
    delegateQueue = self->_delegateQueue;
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke;
    v20[3] = &unk_1E5AC2A70;
    int v21 = v9;
    id v14 = v9;
    dispatch_async(delegateQueue, v20);
    uint64_t v12 = v21;
  }
}

void __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke(uint64_t a1)
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F28C58];
  uint64_t v5 = *MEMORY[0x1E4F28568];
  v6[0] = @"Received a nil or 0 length DCK message.";
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  uint64_t v4 = [v2 errorWithDomain:@"com.apple.NearbyInteraction" code:-19889 userInfo:v3];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_3;
  v4[3] = &unk_1E5AC2AC0;
  uint64_t v3 = *(void *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 48);
  [v2 processDCKMessage:v3 reply:v4];
}

void __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(*(void *)(a1 + 32) + 264);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_4;
  block[3] = &unk_1E5AC2A98;
  id v8 = *(id *)(a1 + 40);
  id v13 = v6;
  id v14 = v8;
  id v12 = v5;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v7, block);
}

uint64_t __56__NISession_CarKey__processDCKMessage_responseCallback___block_invoke_4(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)processBluetoothEventWithType:(int64_t)a3 btcClockTicks:(unint64_t)a4
{
}

- (id)deleteURSKs
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __32__NISession_CarKey__deleteURSKs__block_invoke;
  v5[3] = &unk_1E5AC29D8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __32__NISession_CarKey__deleteURSKs__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousRemoteObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __32__NISession_CarKey__deleteURSKs__block_invoke_2;
  v3[3] = &unk_1E5AC2B10;
  void v3[4] = *(void *)(a1 + 40);
  [v2 deleteURSKs:v3];
}

void __32__NISession_CarKey__deleteURSKs__block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)_setDebugURSK:(id)a3 transactionIdentifier:(unsigned int)a4
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v17 = 0;
    id v18 = &v17;
    uint64_t v19 = 0x3032000000;
    id v20 = __Block_byref_object_copy_;
    int v21 = __Block_byref_object_dispose_;
    id v22 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke;
    block[3] = &unk_1E5AC2B38;
    void block[4] = self;
    unsigned int v16 = a4;
    id v14 = v6;
    uint64_t v15 = &v17;
    dispatch_sync(queue, block);
    id v9 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }
  else
  {
    id v10 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Given nil URSK.";
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    id v9 = [v10 errorWithDomain:@"com.apple.NearbyInteraction" code:-19886 userInfo:v11];
  }

  return v9;
}

void __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousRemoteObject];
  uint64_t v3 = *(unsigned int *)(a1 + 56);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke_2;
  v5[3] = &unk_1E5AC2B10;
  uint64_t v4 = *(void *)(a1 + 40);
  v5[4] = *(void *)(a1 + 48);
  [v2 _setDebugURSK:v4 transactionIdentifier:v3 reply:v5];
}

void __57__NISession_CarKey___setDebugURSK_transactionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)isRangingLimitExceeded
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = __43__NISession_CarKey__isRangingLimitExceeded__block_invoke;
  v5[3] = &unk_1E5AC29D8;
  v5[4] = self;
  void v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __43__NISession_CarKey__isRangingLimitExceeded__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousRemoteObject];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__NISession_CarKey__isRangingLimitExceeded__block_invoke_2;
  v3[3] = &unk_1E5AC29B0;
  long long v4 = *(_OWORD *)(a1 + 32);
  [v2 isRangingLimitExceeded:v3];
}

void __43__NISession_CarKey__isRangingLimitExceeded__block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id v6 = v5;
  if (v5) {
    [*(id *)(a1 + 32) _invalidateSessionAndNotifyError:v5];
  }
  else {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  }
}

- (NICarKeyEventNotifier)carKeyEventNotifier
{
  carKeyEventNotifier = self->_carKeyEventNotifier;
  if (!carKeyEventNotifier)
  {
    long long v4 = [[NICarKeyEventNotifier alloc] initWithParentSession:self];
    id v5 = self->_carKeyEventNotifier;
    self->_carKeyEventNotifier = v4;

    carKeyEventNotifier = self->_carKeyEventNotifier;
  }

  return carKeyEventNotifier;
}

- (id)_setURSKTTL:(unint64_t)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  id v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__NISession_CarKey_Project___setURSKTTL___block_invoke;
  block[3] = &unk_1E5AC2B60;
  void block[5] = &v7;
  void block[6] = a3;
  void block[4] = self;
  dispatch_sync(queue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __41__NISession_CarKey_Project___setURSKTTL___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _synchronousRemoteObject];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __41__NISession_CarKey_Project___setURSKTTL___block_invoke_2;
  v4[3] = &unk_1E5AC2B10;
  uint64_t v3 = *(void *)(a1 + 48);
  v4[4] = *(void *)(a1 + 40);
  [v2 _setURSKTTL:v3 reply:v4];
}

void __41__NISession_CarKey_Project___setURSKTTL___block_invoke_2(uint64_t a1, void *a2)
{
}

- (NIAcwgEventNotifier)acwgEventNotifier
{
  acwgEventNotifier = self->_acwgEventNotifier;
  if (!acwgEventNotifier)
  {
    id v4 = [[NIAcwgEventNotifier alloc] initWithParentSession:self];
    id v5 = self->_acwgEventNotifier;
    self->_acwgEventNotifier = v4;

    acwgEventNotifier = self->_acwgEventNotifier;
  }

  return acwgEventNotifier;
}

- (void)processAcwgM1Msg:(id)a3 withSessionTriggerReason:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    id v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"NISession.mm", 2355, @"Invalid parameter not satisfying: %@", @"m1Msg" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__NISession_Acwg__processAcwgM1Msg_withSessionTriggerReason___block_invoke;
  block[3] = &unk_1E5AC2B88;
  void block[4] = self;
  id v12 = v7;
  int64_t v13 = a4;
  id v9 = v7;
  dispatch_sync(queue, block);
}

void __61__NISession_Acwg__processAcwgM1Msg_withSessionTriggerReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 processAcwgM1Msg:*(void *)(a1 + 40) withSessionTriggerReason:*(void *)(a1 + 48)];
}

- (void)processAcwgM3Msg:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 2365, @"Invalid parameter not satisfying: %@", @"m3Msg" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__NISession_Acwg__processAcwgM3Msg___block_invoke;
  block[3] = &unk_1E5AC26A8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_sync(queue, block);
}

void __36__NISession_Acwg__processAcwgM3Msg___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 processAcwgM3Msg:*(void *)(a1 + 40)];
}

- (void)suspendAcwgRanging:(unsigned int)a3 withSuspendTriggerReason:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NISession_Acwg__suspendAcwgRanging_withSuspendTriggerReason___block_invoke;
  block[3] = &unk_1E5AC28C0;
  unsigned int v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_sync(queue, block);
}

void __63__NISession_Acwg__suspendAcwgRanging_withSuspendTriggerReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 suspendAcwgRanging:*(unsigned int *)(a1 + 48) withSuspendTriggerReason:*(void *)(a1 + 40)];
}

- (void)processAcwgRangingSessionResumeRequestMsg:(unsigned int)a3 withResumeTriggerReason:(int64_t)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__NISession_Acwg__processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason___block_invoke;
  block[3] = &unk_1E5AC28C0;
  unsigned int v6 = a3;
  void block[4] = self;
  void block[5] = a4;
  dispatch_sync(queue, block);
}

void __85__NISession_Acwg__processAcwgRangingSessionResumeRequestMsg_withResumeTriggerReason___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 processAcwgRangingSessionResumeRequestMsg:*(unsigned int *)(a1 + 48) withResumeTriggerReason:*(void *)(a1 + 40)];
}

- (void)prefetchAcwgUrsk:(unsigned int)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __36__NISession_Acwg__prefetchAcwgUrsk___block_invoke;
  v4[3] = &unk_1E5AC2BB0;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_sync(queue, v4);
}

void __36__NISession_Acwg__prefetchAcwgUrsk___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 prefetchAcwgUrsk:*(unsigned int *)(a1 + 40)];
}

- (void)_processUpdatedLockState:(unsigned __int16)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __44__NISession_Acwg___processUpdatedLockState___block_invoke;
  v4[3] = &unk_1E5AC2BD8;
  v4[4] = self;
  unsigned __int16 v5 = a3;
  dispatch_sync(queue, v4);
}

void __44__NISession_Acwg___processUpdatedLockState___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 processUpdatedLockState:*(unsigned __int16 *)(a1 + 40)];
}

- (void)updateResponderDeviceIdentifier:(id)a3 completionHandler:(id)a4
{
  id v10 = a3;
  id v7 = (void (**)(id, uint64_t, void))a4;
  if (v10)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"NISession.mm", 2410, @"Invalid parameter not satisfying: %@", @"deviceIdentifier" object file lineNumber description];

    if (v7) {
      goto LABEL_3;
    }
  }
  id v9 = [MEMORY[0x1E4F28B00] currentHandler];
  [v9 handleFailureInMethod:a2, self, @"NISession.mm", 2411, @"Invalid parameter not satisfying: %@", @"completionHandler" object file lineNumber description];

LABEL_3:
  v7[2](v7, 1, 0);
}

- (void)processVisionInput:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__NISession_Vision__processVisionInput___block_invoke;
  void v7[3] = &unk_1E5AC26A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __40__NISession_Vision__processVisionInput___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 processVisionInput:*(void *)(a1 + 40)];
}

- (NIDevicePresenceNotifier)devicePresenceNotifier
{
  devicePresenceNotifier = self->_devicePresenceNotifier;
  if (!devicePresenceNotifier)
  {
    id v4 = [[NIDevicePresenceNotifier alloc] initWithParentSession:self];
    unsigned __int16 v5 = self->_devicePresenceNotifier;
    self->_devicePresenceNotifier = v4;

    devicePresenceNotifier = self->_devicePresenceNotifier;
  }

  return devicePresenceNotifier;
}

+ (id)generateBluetoothDeviceTokenWithPublicAddress:(id)a3 IRK:(id)a4
{
  v17[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v8)
  {
    int64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, a1, @"NISession.mm", 2471, @"Invalid parameter not satisfying: %@", @"IRK" object file lineNumber description];
  }
  if ([v8 length] != 16)
  {
    id v14 = [MEMORY[0x1E4F28B00] currentHandler];
    [v14 handleFailureInMethod:a2, a1, @"NISession.mm", 2472, @"Invalid parameter not satisfying: %@", @"[IRK length] == NIDiscoveryTokenIRKLengthBytes" object file lineNumber description];
  }
  v16[0] = &unk_1EF5DB7E8;
  v16[1] = &unk_1EF5DB800;
  v17[0] = v8;
  v17[1] = v7;
  id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:2];
  id v10 = (void *)MEMORY[0x1A623D5F0](v9, 8, 0);
  if (!v10)
  {
    uint64_t v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:a2, a1, @"NISession.mm", 2478, @"Invalid parameter not satisfying: %@", @"tokenData" object file lineNumber description];
  }
  id v11 = [[NIDiscoveryToken alloc] initWithBytes:v10];

  return v11;
}

+ (id)generateFindingDiscoveryToken
{
  id v2 = NSRandomData();
  uint64_t v3 = +[NIDiscoveryToken generateFindingTokenWithIRK:v2];

  return v3;
}

+ (id)generateFindingDiscoveryTokenWithSharedSecret:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 16)
  {
    id v4 = +[NIDiscoveryToken generateFindingTokenWithIRK:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)generateFindingDiscoveryTokenWithIdentityResolvingKey:(id)a3
{
  id v3 = +[NISession generateFindingDiscoveryTokenWithSharedSecret:a3];

  return v3;
}

- (NIFindingNotifier)findingNotifier
{
  findingNotifier = self->_findingNotifier;
  if (!findingNotifier)
  {
    id v4 = [[NIFindingNotifier alloc] initWithParentSession:self];
    unsigned __int16 v5 = self->_findingNotifier;
    self->_findingNotifier = v4;

    findingNotifier = self->_findingNotifier;
  }

  return findingNotifier;
}

- (void)_provideTruthTag:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__NISession_Perf___provideTruthTag___block_invoke;
  void v7[3] = &unk_1E5AC26A8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __36__NISession_Perf___provideTruthTag___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) _remoteObject];
  [v2 _provideTruthTag:*(void *)(a1 + 40)];
}

- (NISystemEventNotifier)systemEventNotifier
{
  systemEventNotifier = self->_systemEventNotifier;
  if (!systemEventNotifier)
  {
    id v4 = [[NISystemEventNotifier alloc] initWithParentSession:self];
    unsigned __int16 v5 = self->_systemEventNotifier;
    self->_systemEventNotifier = v4;

    systemEventNotifier = self->_systemEventNotifier;
  }

  return systemEventNotifier;
}

+ (id)_localDeviceLogger
{
  if (+[NISession(LocalDeviceInteraction) _localDeviceLogger]::onceToken != -1) {
    dispatch_once(&+[NISession(LocalDeviceInteraction) _localDeviceLogger]::onceToken, &__block_literal_global_1);
  }
  id v2 = (void *)+[NISession(LocalDeviceInteraction) _localDeviceLogger]::logger;

  return v2;
}

void __55__NISession_LocalDeviceInteraction___localDeviceLogger__block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.NearbyInteraction", "LocalDeviceInteraction");
  uint64_t v1 = (void *)+[NISession(LocalDeviceInteraction) _localDeviceLogger]::logger;
  +[NISession(LocalDeviceInteraction) _localDeviceLogger]::logger = (uint64_t)v0;
}

+ (void)setAsyncLocalDeviceInteractableDiscoveryTokens:(id)a3 completion:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v5 copy];
  id v8 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v9 = v8;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = [v7 count];
      _os_log_impl(&dword_1A2C3F000, v9, OS_LOG_TYPE_DEFAULT, "setAsyncLocalDeviceInteractableDiscoveryTokens:completion: with %d tokens", buf, 8u);
    }
  }
  id v10 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v11 = [v10 remoteObjectProxy];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __95__NISession_LocalDeviceInteraction__setAsyncLocalDeviceInteractableDiscoveryTokens_completion___block_invoke;
  v15[3] = &unk_1E5AC2CC8;
  id v12 = v8;
  id v16 = v12;
  id v13 = v6;
  id v18 = v13;
  id v14 = v10;
  id v17 = v14;
  [v11 setLocalDeviceInteractableDiscoveryTokens:v7 reply:v15];
}

void __95__NISession_LocalDeviceInteraction__setAsyncLocalDeviceInteractableDiscoveryTokens_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v4 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1A2C3F000, v4, OS_LOG_TYPE_DEFAULT, "setAsyncLocalDeviceInteractableDiscoveryTokens:completion replied error: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  uint64_t v5 = *(void *)(a1 + 48);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
  [*(id *)(a1 + 40) invalidate];
}

+ (void)getAsyncInteractableDiscoveryTokens:(id)a3
{
  id v3 = a3;
  id v4 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2C3F000, v4, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens:", buf, 2u);
  }
  uint64_t v5 = +[NIServerConnection createOneShotConnectionAndResume:1];
  int v6 = [v5 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __73__NISession_LocalDeviceInteraction__getAsyncInteractableDiscoveryTokens___block_invoke;
  v10[3] = &unk_1E5AC2CF0;
  id v7 = v4;
  id v11 = v7;
  id v8 = v3;
  id v13 = v8;
  id v9 = v5;
  id v12 = v9;
  [v6 getInteractableDiscoveryTokens:v10];
}

void __73__NISession_LocalDeviceInteraction__getAsyncInteractableDiscoveryTokens___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v7 = *(id *)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = [v5 count];
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A2C3F000, v7, OS_LOG_TYPE_DEFAULT, "getAsyncInteractableDiscoveryTokens: replied %d tokens. Server error: %@", (uint8_t *)v9, 0x12u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  [*(id *)(a1 + 40) invalidate];
}

+ (void)getAsyncActivelyInteractingDiscoveryTokens:(id)a3
{
  id v3 = a3;
  id v4 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A2C3F000, v4, OS_LOG_TYPE_DEFAULT, "getAsyncActivelyInteractingDiscoveryTokens:", buf, 2u);
  }
  id v5 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v6 = [v5 remoteObjectProxy];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  void v10[2] = __80__NISession_LocalDeviceInteraction__getAsyncActivelyInteractingDiscoveryTokens___block_invoke;
  v10[3] = &unk_1E5AC2CF0;
  id v7 = v4;
  id v11 = v7;
  id v8 = v3;
  id v13 = v8;
  id v9 = v5;
  id v12 = v9;
  [v6 getActivelyInteractingDiscoveryTokens:v10];
}

void __80__NISession_LocalDeviceInteraction__getAsyncActivelyInteractingDiscoveryTokens___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v7 = *(id *)(a1 + 32);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109378;
      v9[1] = [v5 count];
      __int16 v10 = 2112;
      id v11 = v6;
      _os_log_impl(&dword_1A2C3F000, v7, OS_LOG_TYPE_DEFAULT, "getAsyncActivelyInteractingDiscoveryTokens: replied %d tokens. Server error: %@", (uint8_t *)v9, 0x12u);
    }
  }
  uint64_t v8 = *(void *)(a1 + 48);
  if (v8) {
    (*(void (**)(uint64_t, id, id))(v8 + 16))(v8, v5, v6);
  }
  [*(id *)(a1 + 40) invalidate];
}

+ (id)setLocalDeviceCanInteract:(BOOL)a3 withDiscoveryTokens:(id)a4
{
  BOOL v4 = a3;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = (void *)[v5 copy];
  id v7 = +[NISession _localDeviceLogger];
  if (v4) {
    uint64_t v8 = "YES";
  }
  else {
    uint64_t v8 = "NO";
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v9 = v7;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = [v6 count];
      _os_log_impl(&dword_1A2C3F000, v9, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s with %d tokens", buf, 0x12u);
    }
  }
  __int16 v10 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v11 = [v10 remoteObjectProxy];
  uint64_t v26 = 0;
  __int16 v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  uint64_t v37 = __Block_byref_object_copy__1;
  v38 = __Block_byref_object_dispose__1;
  id v39 = 0;
  dispatch_semaphore_t v12 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __83__NISession_LocalDeviceInteraction__setLocalDeviceCanInteract_withDiscoveryTokens___block_invoke;
  v22[3] = &unk_1E5AC2C00;
  BOOL v24 = &v26;
  double v25 = buf;
  id v13 = v12;
  uint64_t v23 = v13;
  [v11 setLocalDeviceCanInteract:v4 withDiscoveryTokens:v6 reply:v22];
  dispatch_time_t v14 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v13, v14);
  [v10 invalidate];
  if (!*((unsigned char *)v27 + 24))
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v34 = *MEMORY[0x1E4F28568];
    v35 = @"Server did not reply.";
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v35 forKeys:&v34 count:1];
    uint64_t v17 = [v15 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v16];
    id v18 = *(void **)(*(void *)&buf[8] + 40);
    *(void *)(*(void *)&buf[8] + 40) = v17;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = *(void *)(*(void *)&buf[8] + 40);
    *(_DWORD *)double v30 = 136315394;
    uint64_t v31 = v8;
    __int16 v32 = 2112;
    uint64_t v33 = v19;
    _os_log_impl(&dword_1A2C3F000, v7, OS_LOG_TYPE_DEFAULT, "setLocalDeviceCanInteract:%s return error: %@", v30, 0x16u);
  }
  id v20 = *(id *)(*(void *)&buf[8] + 40);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v26, 8);

  return v20;
}

void __83__NISession_LocalDeviceInteraction__setLocalDeviceCanInteract_withDiscoveryTokens___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)setLocalDeviceDebugParameters:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[v3 copy];
  id v5 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl(&dword_1A2C3F000, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters:%@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v7 = [v6 remoteObjectProxy];
  uint64_t v22 = 0;
  uint64_t v23 = &v22;
  uint64_t v24 = 0x2020000000;
  char v25 = 0;
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v31 = 0x3032000000;
  __int16 v32 = __Block_byref_object_copy__1;
  uint64_t v33 = __Block_byref_object_dispose__1;
  id v34 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __67__NISession_LocalDeviceInteraction__setLocalDeviceDebugParameters___block_invoke;
  v18[3] = &unk_1E5AC2C00;
  id v20 = &v22;
  p_long long buf = &buf;
  id v9 = v8;
  uint64_t v19 = v9;
  [v7 setLocalDeviceDebugParameters:v4 reply:v18];
  dispatch_time_t v10 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v9, v10);
  [v6 invalidate];
  if (!*((unsigned char *)v23 + 24))
  {
    id v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v28 = *MEMORY[0x1E4F28568];
    char v29 = @"Server did not reply.";
    dispatch_semaphore_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    uint64_t v13 = [v11 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v12];
    dispatch_time_t v14 = *(void **)(*((void *)&buf + 1) + 40);
    *(void *)(*((void *)&buf + 1) + 40) = v13;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = *(void *)(*((void *)&buf + 1) + 40);
    *(_DWORD *)uint64_t v26 = 138412290;
    uint64_t v27 = v15;
    _os_log_impl(&dword_1A2C3F000, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceDebugParameters return error: %@", v26, 0xCu);
  }
  id v16 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(&v22, 8);

  return v16;
}

void __67__NISession_LocalDeviceInteraction__setLocalDeviceDebugParameters___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)setLocalDeviceInteractableDiscoveryTokens:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[v3 copy];
  id v5 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild])
  {
    id v6 = v5;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = [v4 count];
      _os_log_impl(&dword_1A2C3F000, v6, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens with %d tokens", buf, 8u);
    }
  }
  id v7 = +[NIServerConnection createOneShotConnectionAndResume:1];
  dispatch_semaphore_t v8 = [v7 remoteObjectProxy];
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  *(void *)long long buf = 0;
  __int16 v32 = buf;
  uint64_t v33 = 0x3032000000;
  id v34 = __Block_byref_object_copy__1;
  uint64_t v35 = __Block_byref_object_dispose__1;
  id v36 = 0;
  dispatch_semaphore_t v9 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __79__NISession_LocalDeviceInteraction__setLocalDeviceInteractableDiscoveryTokens___block_invoke;
  v19[3] = &unk_1E5AC2C00;
  uint64_t v21 = &v23;
  uint64_t v22 = buf;
  dispatch_time_t v10 = v9;
  id v20 = v10;
  [v8 setLocalDeviceInteractableDiscoveryTokens:v4 reply:v19];
  dispatch_time_t v11 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v10, v11);
  [v7 invalidate];
  if (!*((unsigned char *)v24 + 24))
  {
    dispatch_semaphore_t v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    double v30 = @"Server did not reply.";
    uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    uint64_t v14 = [v12 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v13];
    uint64_t v15 = (void *)*((void *)v32 + 5);
    *((void *)v32 + 5) = v14;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v16 = *((void *)v32 + 5);
    *(_DWORD *)uint64_t v27 = 138412290;
    uint64_t v28 = v16;
    _os_log_impl(&dword_1A2C3F000, v5, OS_LOG_TYPE_DEFAULT, "setLocalDeviceInteractableDiscoveryTokens return error: %@", v27, 0xCu);
  }
  id v17 = *((id *)v32 + 5);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(&v23, 8);

  return v17;
}

void __79__NISession_LocalDeviceInteraction__setLocalDeviceInteractableDiscoveryTokens___block_invoke(uint64_t a1, void *a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (NSArray)interactableDiscoveryTokens
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens", buf, 2u);
  }
  id v3 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v4 = [v3 remoteObjectProxy];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  *(void *)long long buf = 0;
  uint64_t v33 = buf;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__1;
  id v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__1;
  double v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __64__NISession_LocalDeviceInteraction__interactableDiscoveryTokens__block_invoke;
  uint64_t v21 = &unk_1E5AC2D18;
  uint64_t v23 = &v38;
  uint64_t v24 = buf;
  uint64_t v25 = &v26;
  id v6 = v5;
  uint64_t v22 = v6;
  [v4 getInteractableDiscoveryTokens:&v18];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  objc_msgSend(v3, "invalidate", v18, v19, v20, v21);
  if (!*((unsigned char *)v39 + 24))
  {
    dispatch_semaphore_t v8 = (void *)*((void *)v33 + 5);
    *((void *)v33 + 5) = 0;

    dispatch_semaphore_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"Server did not reply.";
    dispatch_time_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    dispatch_semaphore_t v12 = (void *)v27[5];
    v27[5] = v11;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v13 = v2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [*((id *)v33 + 5) count];
      uint64_t v15 = v27[5];
      *(_DWORD *)v42 = 67109378;
      int v43 = v14;
      __int16 v44 = 2112;
      uint64_t v45 = v15;
      _os_log_impl(&dword_1A2C3F000, v13, OS_LOG_TYPE_DEFAULT, "interactableDiscoveryTokens return %d tokens. Server error: %@", v42, 0x12u);
    }
  }
  id v16 = *((id *)v33 + 5);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v38, 8);

  return (NSArray *)v16;
}

void __64__NISession_LocalDeviceInteraction__interactableDiscoveryTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (NSArray)activelyInteractingDiscoveryTokens
{
  v47[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens", buf, 2u);
  }
  id v3 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v4 = [v3 remoteObjectProxy];
  uint64_t v38 = 0;
  id v39 = &v38;
  uint64_t v40 = 0x2020000000;
  char v41 = 0;
  *(void *)long long buf = 0;
  uint64_t v33 = buf;
  uint64_t v34 = 0x3032000000;
  uint64_t v35 = __Block_byref_object_copy__1;
  id v36 = __Block_byref_object_dispose__1;
  id v37 = 0;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__1;
  double v30 = __Block_byref_object_dispose__1;
  id v31 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  id v20 = __71__NISession_LocalDeviceInteraction__activelyInteractingDiscoveryTokens__block_invoke;
  uint64_t v21 = &unk_1E5AC2D18;
  uint64_t v23 = &v38;
  uint64_t v24 = buf;
  uint64_t v25 = &v26;
  id v6 = v5;
  uint64_t v22 = v6;
  [v4 getActivelyInteractingDiscoveryTokens:&v18];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  objc_msgSend(v3, "invalidate", v18, v19, v20, v21);
  if (!*((unsigned char *)v39 + 24))
  {
    dispatch_semaphore_t v8 = (void *)*((void *)v33 + 5);
    *((void *)v33 + 5) = 0;

    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v46 = *MEMORY[0x1E4F28568];
    v47[0] = @"Server did not reply.";
    dispatch_time_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v47 forKeys:&v46 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    id v12 = (void *)v27[5];
    v27[5] = v11;
  }
  if (+[NIPlatformInfo isInternalBuild])
  {
    uint64_t v13 = v2;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = [*((id *)v33 + 5) count];
      uint64_t v15 = v27[5];
      *(_DWORD *)v42 = 67109378;
      int v43 = v14;
      __int16 v44 = 2112;
      uint64_t v45 = v15;
      _os_log_impl(&dword_1A2C3F000, v13, OS_LOG_TYPE_DEFAULT, "activelyInteractingDiscoveryTokens return %d tokens. Server error: %@", v42, 0x12u);
    }
  }
  id v16 = *((id *)v33 + 5);

  _Block_object_dispose(&v26, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v38, 8);

  return (NSArray *)v16;
}

void __71__NISession_LocalDeviceInteraction__activelyInteractingDiscoveryTokens__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (id)localDevicePrintableState
{
  v43[1] = *MEMORY[0x1E4F143B8];
  id v2 = +[NISession _localDeviceLogger];
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState", buf, 2u);
  }
  id v3 = +[NIServerConnection createOneShotConnectionAndResume:1];
  id v4 = [v3 remoteObjectProxy];
  uint64_t v36 = 0;
  id v37 = &v36;
  uint64_t v38 = 0x2020000000;
  char v39 = 0;
  *(void *)long long buf = 0;
  id v31 = buf;
  uint64_t v32 = 0x3032000000;
  uint64_t v33 = __Block_byref_object_copy__1;
  uint64_t v34 = __Block_byref_object_dispose__1;
  id v35 = 0;
  uint64_t v24 = 0;
  uint64_t v25 = &v24;
  uint64_t v26 = 0x3032000000;
  uint64_t v27 = __Block_byref_object_copy__1;
  uint64_t v28 = __Block_byref_object_dispose__1;
  id v29 = 0;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  uint64_t v18 = __62__NISession_LocalDeviceInteraction__localDevicePrintableState__block_invoke;
  uint64_t v19 = &unk_1E5AC2D40;
  uint64_t v21 = &v36;
  uint64_t v22 = buf;
  uint64_t v23 = &v24;
  id v6 = v5;
  id v20 = v6;
  [v4 getLocalDevicePrintableState:&v16];
  dispatch_time_t v7 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v6, v7);
  objc_msgSend(v3, "invalidate", v16, v17, v18, v19);
  if (!*((unsigned char *)v37 + 24))
  {
    dispatch_semaphore_t v8 = (void *)*((void *)v31 + 5);
    *((void *)v31 + 5) = 0;

    uint64_t v9 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v42 = *MEMORY[0x1E4F28568];
    v43[0] = @"Server did not reply.";
    dispatch_time_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v43 forKeys:&v42 count:1];
    uint64_t v11 = [v9 errorWithDomain:@"com.apple.NearbyInteraction" code:-10020 userInfo:v10];
    id v12 = (void *)v25[5];
    void v25[5] = v11;
  }
  if (+[NIPlatformInfo isInternalBuild]
    && os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v13 = v25[5];
    *(_DWORD *)uint64_t v40 = 138412290;
    uint64_t v41 = v13;
    _os_log_impl(&dword_1A2C3F000, v2, OS_LOG_TYPE_DEFAULT, "localDevicePrintableState error: %@", v40, 0xCu);
  }
  id v14 = *((id *)v31 + 5);

  _Block_object_dispose(&v24, 8);
  _Block_object_dispose(buf, 8);

  _Block_object_dispose(&v36, 8);

  return v14;
}

void __62__NISession_LocalDeviceInteraction__localDevicePrintableState__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  dispatch_semaphore_t v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
  dispatch_time_t v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)discoveryToken
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A2C3F000, v0, v1, "DiscoveryToken getter returning nil", v2, v3, v4, v5, v6);
}

- (void)uwbSessionDidFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A2C3F000, v0, v1, "DelegateProxy: session failed with error: %{private}@", v2, v3, v4, v5, v6);
}

- (void)uwbSessionDidInvalidateWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A2C3F000, v0, v1, "DelegateProxy: session invalidated with error: %{private}@", v2, v3, v4, v5, v6);
}

- (void)uwbSessionInterruptionReasonEnded:timestamp:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1(&dword_1A2C3F000, v0, v1, "Suspension end does not match any stored suspensions.", v2, v3, v4, v5, v6);
}

- (void)_handleARSessionDidFailWithError:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A2C3F000, v0, v1, "ARSession: failed with error: %{private}@", v2, v3, v4, v5, v6);
}

- (void)_handleARSession:willRunWithConfiguration:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A2C3F000, v0, v1, "ARSession: running with invalid config: %{private}@", v2, v3, v4, v5, v6);
}

- (void)_verifyError:(os_log_t)log .cold.1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)long long buf = 138477827;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1A2C3F000, log, OS_LOG_TYPE_ERROR, "%{private}@", buf, 0xCu);
}

- (void)_notifyDidInvalidateWithError:.cold.1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1A2C3F000, v1, OS_LOG_TYPE_ERROR, "Delegate: notify invalidation: %@. Sanitized: %@", v2, 0x16u);
}

@end