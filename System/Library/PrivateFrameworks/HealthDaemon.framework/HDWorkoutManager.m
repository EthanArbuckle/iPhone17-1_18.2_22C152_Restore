@interface HDWorkoutManager
- (BOOL)allowBackgroundStartForApplicationIdentifier:(id)a3;
- (BOOL)currentActivityRequiresExtendedMode;
- (BOOL)finishAllWorkoutsForClient:(id)a3 error:(id *)a4;
- (BOOL)hasAnyActiveWorkouts;
- (BOOL)isInHeartRateRecovery;
- (HDAlertSuppressor)alertSuppressor;
- (HDLocationManager)locationManager;
- (HDProfile)profile;
- (HDWorkoutLocationSmoother)locationSmoother;
- (HDWorkoutManager)initWithProfile:(id)a3;
- (HDWorkoutMirroringManager)mirroringManager;
- (HDWorkoutSessionServer)currentWorkout;
- (NSDictionary)sessionServers;
- (OS_dispatch_queue)queue;
- (id)currentWorkoutClient;
- (id)currentWorkoutConfiguration;
- (id)currentWorkoutSessionServer;
- (id)diagnosticDescription;
- (id)newBiomeInterface;
- (id)newCMSkiTracker;
- (id)newCMSwimTracker;
- (id)recoveredWorkoutSessionServerWithIdentifier:(id)a3 error:(id *)a4;
- (id)sessionServerWithConfiguration:(id)a3 sessionUUID:(id)a4 clientBundleIdentifier:(id)a5 taskServer:(id)a6;
- (id)unitTest_currentWorkoutSession;
- (uint64_t)_postWorkoutUpdatedNotification;
- (void)_didCreateMirroredSessionServer:(id)a3;
- (void)_finishAllDetachedWorkoutBuilders;
- (void)_finishAllWorkoutsWithExclusionHandler:(uint64_t)a1;
- (void)_queue_beginTransitionToWorkoutSession:(uint64_t)a1;
- (void)_queue_sessionFinished:(uint64_t)a1;
- (void)_queue_setCurrentWorkout:(uint64_t)a1;
- (void)_receivedStartWorkoutAppRequest:(id)a3 completion:(id)a4;
- (void)_sendStartWorkoutAppResponse:(id)a3 error:(id)a4;
- (void)_setupNewSessionServer:(void *)a3 withTaskServer:;
- (void)_startWatchAppWithRequest:(void *)a3 completion:;
- (void)_startWatchAppWithWorkoutConfiguration:(id)a3 client:(id)a4 completion:(id)a5;
- (void)_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5;
- (void)_takeBackgroundStartAssertionForApplicationIdentifier:(id)a3;
- (void)dealloc;
- (void)devicePowerMonitor:(id)a3 primaryPowerSourceIsCharging:(BOOL)a4;
- (void)endHeartRateRecovery;
- (void)generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4;
- (void)getCurrentWorkoutSnapshotWithCompletion:(id)a3;
- (void)hk_fakeLapEventWithDate:(id)a3 strokeStyle:(int64_t)a4;
- (void)hk_fakeStopEventWithDate:(id)a3;
- (void)mirroredSessionServerWithUUID:(id)a3 completion:(id)a4;
- (void)performWhenPostLaunchSessionRecoveryHasCompleted:(id)a3;
- (void)profileDidBecomeReady:(id)a3;
- (void)recoverWorkoutSessionForClient:(id)a3 server:(id)a4 completion:(id)a5;
- (void)registerCurrentWorkoutObserver:(id)a3;
- (void)sessionServerFromSessionIdentifier:(id)a3 completion:(id)a4;
- (void)setLocationSmoother:(id)a3;
- (void)tearDownMirroredWorkoutSession:(id)a3;
- (void)unitTest_smoothRoute:(id)a3 withSmoother:(id)a4 completion:(id)a5;
- (void)unregisterCurrentWorkoutObserver:(id)a3;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
- (void)workoutSession:(id)a3 didUpdateDataAccumulator:(id)a4;
@end

@implementation HDWorkoutManager

- (BOOL)hasAnyActiveWorkouts
{
  v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__HDWorkoutManager_hasAnyActiveWorkouts__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __40__HDWorkoutManager_hasAnyActiveWorkouts__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 8) != 0;
  return result;
}

- (id)currentWorkoutClient
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__180;
  v11 = __Block_byref_object_dispose__180;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __40__HDWorkoutManager_currentWorkoutClient__block_invoke;
  v6[3] = &unk_1E62F6E80;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __40__HDWorkoutManager_currentWorkoutClient__block_invoke(uint64_t a1)
{
  if ([*(id *)(*(void *)(a1 + 32) + 8) isActive])
  {
    uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) client];
    uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
    id v4 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v2;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (HDProfile)profile
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);

  return (HDProfile *)WeakRetained;
}

- (void)_startWatchAppWithWorkoutConfiguration:(id)a3 client:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  v10 = [a4 process];
  v11 = [v10 applicationIdentifier];

  id v12 = [(HDWorkoutManager *)self profile];
  v13 = [v12 daemon];
  v14 = [v13 processStateManager];
  int v15 = [v14 applicationIsForeground:v11];

  _HKInitializeLogging();
  v16 = *MEMORY[0x1E4F29FB8];
  v17 = *MEMORY[0x1E4F29FB8];
  if (v15)
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      int v22 = 138543618;
      v23 = v11;
      __int16 v24 = 2114;
      id v25 = v8;
      _os_log_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_DEFAULT, "Starting workout app %{public}@ on watch. configuration: %{public}@", (uint8_t *)&v22, 0x16u);
    }
    v18 = objc_alloc_init(HDCodableStartWorkoutAppRequest);
    [(HDCodableStartWorkoutAppRequest *)v18 setApplicationIdentifier:v11];
    v19 = [v8 codableRepresentationForSync];
    [(HDCodableStartWorkoutAppRequest *)v18 setWorkoutConfiguration:v19];

    v20 = [MEMORY[0x1E4F29128] UUID];
    v21 = [v20 UUIDString];
    [(HDCodableStartWorkoutAppRequest *)v18 setRequestIdentifier:v21];

    -[HDWorkoutManager _startWatchAppWithRequest:completion:](self, v18, v9);
  }
  else
  {
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v22) = 0;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Cannot start watch app when phone app is in background", (uint8_t *)&v22, 2u);
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 550, @"Cannot start watch app when phone app is in background");
    v18 = (HDCodableStartWorkoutAppRequest *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, void, HDCodableStartWorkoutAppRequest *))v9 + 2))(v9, 0, v18);
  }
}

- (void)_startWatchAppWithRequest:(void *)a3 completion:
{
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v7 = [a1 queue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke;
    block[3] = &unk_1E62F69F0;
    block[4] = a1;
    id v10 = v6;
    id v9 = v5;
    dispatch_async(v7, block);
  }
}

- (void)_startWatchAppWithWorkoutPlanData:(id)a3 processIdentifier:(int)a4 completion:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(HDWorkoutManager *)self profile];
  v11 = [v10 daemon];
  id v12 = [v11 processStateManager];
  LODWORD(v6) = [v12 processIsForeground:v6];

  if (v6)
  {
    v13 = objc_alloc_init(HDCodableStartWorkoutAppRequest);
    [(HDCodableStartWorkoutAppRequest *)v13 setWorkoutPlanData:v8];
    v14 = [MEMORY[0x1E4F29128] UUID];
    int v15 = [v14 UUIDString];
    [(HDCodableStartWorkoutAppRequest *)v13 setRequestIdentifier:v15];

    -[HDWorkoutManager _startWatchAppWithRequest:completion:](self, v13, v9);
  }
  else
  {
    _HKInitializeLogging();
    v16 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v18 = 0;
      _os_log_error_impl(&dword_1BCB7D000, v16, OS_LOG_TYPE_ERROR, "Cannot start watch app when phone app is in background", v18, 2u);
    }
    v17 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 550, @"Cannot start watch app when phone app is in background");
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v17);
  }
}

void __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) profile];
  uint64_t v3 = [v2 nanoSyncManager];

  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke_2;
    v6[3] = &unk_1E6301AF0;
    uint64_t v4 = *(void *)(a1 + 40);
    id v7 = *(id *)(a1 + 48);
    [v3 sendStartWorkoutAppRequest:v4 completion:v6];
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 550, @"Unable to launch watch app");
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

void __67__HDWorkoutManager_Platform___startWatchAppWithRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    (*(void (**)(void, uint64_t, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [a2 success], v5);
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      int v7 = 138543362;
      id v8 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Error launching watch app: %{public}@", (uint8_t *)&v7, 0xCu);
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, v5);
  }
}

- (void)_receivedStartWorkoutAppRequest:(id)a3 completion:(id)a4
{
  id v5 = a4;
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v8 = 0;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Received unsupported start workout app message non-watch device.", v8, 2u);
  }
  int v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 100, @"Start workout app request not supported on non-watch devices");
  [(HDWorkoutManager *)self _sendStartWorkoutAppResponse:v5 error:v7];
}

- (HDWorkoutManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)HDWorkoutManager;
  id v5 = [(HDWorkoutManager *)&v27 init];
  uint64_t v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionCreationHandlers = v6->_sessionCreationHandlers;
    v6->_sessionCreationHandlers = v9;

    v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sessionServers = v6->_sessionServers;
    v6->_sessionServers = v11;

    v13 = objc_alloc_init(HDLocationManager);
    locationManager = v6->_locationManager;
    v6->_locationManager = v13;

    int v15 = [[HDWorkoutLocationSmoother alloc] initWithProfile:v4];
    locationSmoother = v6->_locationSmoother;
    v6->_locationSmoother = v15;

    v17 = [[HDWorkoutMirroringManager alloc] initWithWorkoutManager:v6];
    mirroringManager = v6->_mirroringManager;
    v6->_mirroringManager = v17;

    v19 = [MEMORY[0x1E4F65CF8] sharedDiagnosticManager];
    [v19 addObject:v6];

    id v20 = objc_alloc(MEMORY[0x1E4F2B2D0]);
    uint64_t v21 = [v20 initWithName:@"current-workout-observers" loggingCategory:*MEMORY[0x1E4F29FB8]];
    currentWorkoutObservers = v6->_currentWorkoutObservers;
    v6->_currentWorkoutObservers = (HKObserverSet *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backgroundStartAssertions = v6->_backgroundStartAssertions;
    v6->_backgroundStartAssertions = v23;

    v6->_assertionsLock._os_unfair_lock_opaque = 0;
    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    [WeakRetained registerProfileReadyObserver:v6 queue:0];
  }
  return v6;
}

- (void)dealloc
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(HDAssertion *)self->_currentWorkoutAssertion invalidate];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v4 = [WeakRetained sessionAssertionManager];
  id v5 = [v4 activeAssertionsForIdentifier:@"HDAssertionIdentifierBackgroundWorkoutStart"];

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
        [*(id *)(*((void *)&v11 + 1) + 8 * v9++) invalidate];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  v10.receiver = self;
  v10.super_class = (Class)HDWorkoutManager;
  [(HDWorkoutManager *)&v10 dealloc];
}

- (HDWorkoutSessionServer)currentWorkout
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__180;
  objc_super v10 = __Block_byref_object_dispose__180;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HDWorkoutManager_currentWorkout__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (HDWorkoutSessionServer *)v3;
}

void __34__HDWorkoutManager_currentWorkout__block_invoke(uint64_t a1)
{
}

- (NSDictionary)sessionServers
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__180;
  objc_super v10 = __Block_byref_object_dispose__180;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__HDWorkoutManager_sessionServers__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

void __34__HDWorkoutManager_sessionServers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)recoveredWorkoutSessionServerWithIdentifier:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v39 = 0;
  v40 = &v39;
  uint64_t v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__180;
  v43 = __Block_byref_object_dispose__180;
  id v44 = 0;
  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__180;
  v37 = __Block_byref_object_dispose__180;
  id v38 = 0;
  uint64_t v27 = 0;
  v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__180;
  v31 = __Block_byref_object_dispose__180;
  id v32 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDWorkoutManager_recoveredWorkoutSessionServerWithIdentifier_error___block_invoke;
  block[3] = &unk_1E630B368;
  __int16 v24 = &v39;
  block[4] = self;
  id v8 = v6;
  id v23 = v8;
  id v25 = &v27;
  uint64_t v26 = &v33;
  dispatch_sync(queue, block);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = (id)v28[5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v45 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v19 != v11) {
          objc_enumerationMutation(v9);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v18 + 1) + 8 * i) + 16))(*(void *)(*((void *)&v18 + 1) + 8 * i));
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v18 objects:v45 count:16];
    }
    while (v10);
  }

  long long v13 = (void *)v40[5];
  if (!v13)
  {
    id v14 = (id)v34[5];
    int v15 = v14;
    if (v14)
    {
      if (a4) {
        *a4 = v14;
      }
      else {
        _HKLogDroppedError();
      }
    }

    long long v13 = (void *)v40[5];
  }
  id v16 = v13;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  _Block_object_dispose(&v39, 8);

  return v16;
}

void __70__HDWorkoutManager_recoveredWorkoutSessionServerWithIdentifier_error___block_invoke(uint64_t *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[6] + 8) + 40))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
    uint64_t v6 = a1[5];
    id v17 = 0;
    uint64_t v7 = +[HDWorkoutSessionServer recoveredSessionServerWithProfile:WeakRetained sessionUUID:v6 error:&v17];
    id v8 = v17;
    id v9 = v17;
    uint64_t v10 = *(void *)(a1[6] + 8);
    uint64_t v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v7;

    uint64_t v12 = *(void *)(*(void *)(a1[6] + 8) + 40);
    if (v12)
    {
      [*(id *)(a1[4] + 32) setObject:v12 forKeyedSubscript:a1[5]];
      [*(id *)(*(void *)(a1[6] + 8) + 40) addObserver:a1[4] queue:*(void *)(a1[4] + 136)];
      uint64_t v13 = [*(id *)(a1[4] + 40) objectForKeyedSubscript:a1[5]];
      uint64_t v14 = *(void *)(a1[7] + 8);
      int v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      [*(id *)(a1[4] + 40) removeObjectForKey:a1[5]];
      uint64_t v16 = [*(id *)(*(void *)(a1[6] + 8) + 40) state];
      if ((unint64_t)(v16 - 4) < 0xB || v16 == 17) {
        -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:](a1[4], *(void **)(*(void *)(a1[6] + 8) + 40));
      }
    }
    else
    {
      objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), v8);
    }
  }
}

- (void)_queue_beginTransitionToWorkoutSession:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = v4;
  if (!a1) {
    goto LABEL_22;
  }
  id v6 = *(id *)(a1 + 8);
  if (v6 == v4)
  {
    [v4 didBecomeCurrent];
    goto LABEL_22;
  }
  uint64_t v7 = (id *)(a1 + 24);
  if (*(id *)(a1 + 24) != v4)
  {
    if (!v6)
    {
      -[HDWorkoutManager _queue_setCurrentWorkout:](a1, v4);
LABEL_19:
      uint64_t v12 = [v5 applicationIdentifier];

      if (v12)
      {
        uint64_t v13 = [HDWatchAppStateMonitor alloc];
        uint64_t v14 = [v5 applicationIdentifier];
        uint64_t v15 = [(HDWatchAppStateMonitor *)v13 initWithBundleIdentifier:v14];
        uint64_t v16 = *(void **)(a1 + 56);
        *(void *)(a1 + 56) = v15;
      }
      goto LABEL_22;
    }
    if (([v4 shouldStopPreviousSession] & 1) == 0
      && [*(id *)(a1 + 8) isActive])
    {
      id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 551, @"Cannot start when another session is active");
      [v5 didResignCurrentWithError:v8];

      goto LABEL_22;
    }
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 8, @"Another session is starting");
    if (_HDWorkoutSessionCanReplaceSession(*(void **)(a1 + 8), v5))
    {
      if (!*v7)
      {
LABEL_15:
        objc_storeStrong((id *)(a1 + 24), a2);
        [*(id *)(a1 + 8) didResignCurrentWithError:v10];
        _HKInitializeLogging();
        uint64_t v11 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          int v17 = 138543362;
          long long v18 = v5;
          _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) In line as next workout.", (uint8_t *)&v17, 0xCu);
        }

        goto LABEL_19;
      }
      if (_HDWorkoutSessionCanReplaceSession(*v7, v5))
      {
        [*v7 didResignCurrentWithError:v10];
        goto LABEL_15;
      }
    }
    [v5 didResignCurrentWithError:v10];

    goto LABEL_22;
  }
  _HKInitializeLogging();
  id v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138543362;
    long long v18 = v5;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w1) Ignorning become-current request while already in line as the next workout.", (uint8_t *)&v17, 0xCu);
  }
LABEL_22:
}

- (void)sessionServerFromSessionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__HDWorkoutManager_sessionServerFromSessionIdentifier_completion___block_invoke;
  block[3] = &unk_1E62F69F0;
  uint64_t v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(queue, block);
}

void __66__HDWorkoutManager_sessionServerFromSessionIdentifier_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    objc_msgSend(*(id *)(*(void *)(a1 + 40) + 32), "objectForKeyedSubscript:");
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    else
    {
      id v3 = [*(id *)(*(void *)(a1 + 40) + 40) objectForKeyedSubscript:*(void *)(a1 + 32)];
      if (!v3)
      {
        id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        [*(id *)(*(void *)(a1 + 40) + 40) setObject:v3 forKeyedSubscript:*(void *)(a1 + 32)];
      }
      id v4 = (void *)[*(id *)(a1 + 48) copy];
      id v5 = _Block_copy(v4);
      [v3 addObject:v5];
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "Unable to fetch session server because Session Identifier is unexpectedly nil", buf, 2u);
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (id)sessionServerWithConfiguration:(id)a3 sessionUUID:(id)a4 clientBundleIdentifier:(id)a5 taskServer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x3032000000;
  uint64_t v29 = __Block_byref_object_copy__180;
  v30 = __Block_byref_object_dispose__180;
  id v31 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __97__HDWorkoutManager_sessionServerWithConfiguration_sessionUUID_clientBundleIdentifier_taskServer___block_invoke;
  block[3] = &unk_1E62FEE30;
  id v25 = &v26;
  void block[4] = self;
  id v15 = v11;
  id v24 = v15;
  dispatch_sync(queue, block);
  uint64_t v16 = (void *)v27[5];
  if (!v16)
  {
    int v17 = [HDWorkoutSessionServer alloc];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v19 = [(HDWorkoutSessionServer *)v17 initWithProfile:WeakRetained configuration:v10 sessionUUID:v15];
    long long v20 = (void *)v27[5];
    v27[5] = v19;

    -[HDWorkoutManager _setupNewSessionServer:withTaskServer:]((uint64_t)self, (void *)v27[5], v13);
    uint64_t v16 = (void *)v27[5];
  }
  id v21 = v16;

  _Block_object_dispose(&v26, 8);

  return v21;
}

void __97__HDWorkoutManager_sessionServerWithConfiguration_sessionUUID_clientBundleIdentifier_taskServer___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 32) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_setupNewSessionServer:(void *)a3 withTaskServer:
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (a1)
  {
    uint64_t v21 = 0;
    int v22 = &v21;
    uint64_t v23 = 0x3032000000;
    id v24 = __Block_byref_object_copy__180;
    id v25 = __Block_byref_object_dispose__180;
    id v26 = 0;
    id v7 = *(NSObject **)(a1 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__HDWorkoutManager__setupNewSessionServer_withTaskServer___block_invoke;
    block[3] = &unk_1E630B390;
    void block[4] = a1;
    id v17 = v5;
    long long v20 = sel__setupNewSessionServer_withTaskServer_;
    id v18 = v6;
    uint64_t v19 = &v21;
    dispatch_sync(v7, block);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v8 = (id)v22[5];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v27 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
          ++v11;
        }
        while (v9 != v11);
        uint64_t v9 = [v8 countByEnumeratingWithState:&v12 objects:v27 count:16];
      }
      while (v9);
    }

    _Block_object_dispose(&v21, 8);
  }
}

- (void)mirroredSessionServerWithUUID:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke;
  v12[3] = &unk_1E62F7100;
  v12[4] = self;
  id v13 = v7;
  id v14 = v8;
  SEL v15 = a2;
  id v10 = v8;
  id v11 = v7;
  dispatch_async(queue, v12);
}

void __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = v2;
  if (v2)
  {
    if ([v2 sessionType] != 1)
    {
      id v5 = [MEMORY[0x1E4F28B00] currentHandler];
      [v5 handleFailureInMethod:*(void *)(a1 + 56), *(void *)(a1 + 32), @"HDWorkoutManager.m", 274, @"Expected session %@ type to be mirrored", *(void *)(a1 + 40) object file lineNumber description];
    }
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v4 = *(void **)(*(void *)(a1 + 32) + 128);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke_2;
    v6[3] = &unk_1E62FA1A8;
    id v7 = *(id *)(a1 + 48);
    [v4 recoverMirroredWorkoutSessionWithCompletion:v6];
  }
}

uint64_t __61__HDWorkoutManager_mirroredSessionServerWithUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __58__HDWorkoutManager__setupNewSessionServer_withTaskServer___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v3 = [*(id *)(a1 + 40) identifier];
  id v16 = [v2 objectForKeyedSubscript:v3];

  if ([v16 sessionType] == 1)
  {
    -[HDWorkoutManager _queue_sessionFinished:](*(void *)(a1 + 32), v16);
  }
  else if (v16)
  {
    SEL v15 = [MEMORY[0x1E4F28B00] currentHandler];
    [v15 handleFailureInMethod:*(void *)(a1 + 64) object:*(void *)(a1 + 32) file:@"HDWorkoutManager.m" lineNumber:295 description:@"Conflicting session creation."];
  }
  id v4 = *(void **)(a1 + 40);
  id v5 = *(void **)(*(void *)(a1 + 32) + 32);
  id v6 = [v4 identifier];
  [v5 setObject:v4 forKeyedSubscript:v6];

  [*(id *)(a1 + 40) setTaskServer:*(void *)(a1 + 48)];
  [*(id *)(a1 + 48) observeWorkoutSessionServer:*(void *)(a1 + 40)];
  [*(id *)(a1 + 40) addObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 136)];
  id v7 = *(void **)(*(void *)(a1 + 32) + 40);
  id v8 = [*(id *)(a1 + 40) identifier];
  uint64_t v9 = [v7 objectForKeyedSubscript:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 56) + 8);
  id v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  long long v12 = *(void **)(a1 + 40);
  id v13 = *(void **)(*(void *)(a1 + 32) + 40);
  id v14 = [v12 identifier];
  [v13 removeObjectForKey:v14];
}

- (void)_queue_sessionFinished:(uint64_t)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
    if (*(id *)(a1 + 8) == v3)
    {
      _HKInitializeLogging();
      id v5 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) Finished while current.", buf, 0xCu);
      }
      [*(id *)(a1 + 8) removeObserver:a1];
      id v6 = *(void **)(a1 + 8);
      *(void *)(a1 + 8) = 0;

      id v7 = *(void **)(a1 + 88);
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __43__HDWorkoutManager__queue_sessionFinished___block_invoke;
      v13[3] = &unk_1E630B460;
      v13[4] = a1;
      [v7 notifyObservers:v13];
      if (![v3 sessionType])
      {
        [*(id *)(a1 + 16) invalidate];
        id v8 = *(void **)(a1 + 16);
        *(void *)(a1 + 16) = 0;
      }
      -[HDWorkoutManager _postWorkoutUpdatedNotification](a1);
      uint64_t v9 = *(void **)(a1 + 24);
      if (!v9) {
        goto LABEL_13;
      }
      -[HDWorkoutManager _queue_setCurrentWorkout:](a1, v9);
    }
    else
    {
      if (*(id *)(a1 + 24) != v3)
      {
LABEL_13:
        id v11 = *(void **)(a1 + 32);
        long long v12 = [v3 identifier];
        [v11 removeObjectForKey:v12];

        goto LABEL_14;
      }
      _HKInitializeLogging();
      id v4 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        id v15 = v3;
        _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) Finished while pending.", buf, 0xCu);
      }
    }
    uint64_t v10 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    goto LABEL_13;
  }
LABEL_14:
}

- (void)_queue_setCurrentWorkout:(uint64_t)a1
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 136));
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v18 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ (#w0) Become current.", buf, 0xCu);
  }
  objc_storeStrong((id *)(a1 + 8), a2);
  id v6 = *(void **)(a1 + 88);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __45__HDWorkoutManager__queue_setCurrentWorkout___block_invoke;
  v16[3] = &unk_1E630B460;
  v16[4] = a1;
  [v6 notifyObservers:v16];
  [*(id *)(a1 + 8) didBecomeCurrent];
  id v7 = [v4 applicationIdentifier];

  if (v7)
  {
    id v8 = [v4 applicationIdentifier];
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 104));
    uint64_t v9 = [*(id *)(a1 + 96) objectForKeyedSubscript:v8];
    [*(id *)(a1 + 96) setObject:0 forKeyedSubscript:v8];

    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 104));
    [v9 invalidate];
  }
  if (![v4 sessionType])
  {
    uint64_t v10 = [v4 clientProcessBundleIdentifier];
    id v11 = *(id *)(a1 + 16);
    if (v10)
    {
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F65CC8]) initWithAssertionIdentifier:@"HDCurrentWorkoutSessionAssertion" ownerIdentifier:v10];
      id v13 = *(void **)(a1 + 16);
      *(void *)(a1 + 16) = v12;
    }
    [v11 invalidate];
    if (*(void *)(a1 + 16))
    {
      id v14 = [(id)a1 profile];
      id v15 = [v14 sessionAssertionManager];
      [v15 takeAssertion:*(void *)(a1 + 16)];
    }
  }
  -[HDWorkoutManager _postWorkoutUpdatedNotification](a1);
}

- (void)_sendStartWorkoutAppResponse:(id)a3 error:(id)a4
{
  id v5 = a4;
  id v6 = (void (**)(id, id, id))a3;
  id v7 = objc_alloc_init(HDCodableStartWorkoutAppResponse);
  uint64_t v9 = v7;
  if (v5)
  {
    [(HDCodableStartWorkoutAppResponse *)v7 setSuccess:0];
    id v8 = objc_msgSend(v5, "hk_codableError");
    [(HDCodableStartWorkoutAppResponse *)v9 setLaunchError:v8];
  }
  else
  {
    [(HDCodableStartWorkoutAppResponse *)v7 setSuccess:1];
  }
  v6[2](v6, v9, v5);
}

- (id)newBiomeInterface
{
  return objc_alloc_init(HDBiomeInterface);
}

- (id)newCMSwimTracker
{
  return objc_alloc_init(MEMORY[0x1E4F222A8]);
}

- (id)newCMSkiTracker
{
  return objc_alloc_init(MEMORY[0x1E4F22288]);
}

uint64_t __61__HDWorkoutManager__queue_sessionServerForRecoveryForClient___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 applicationIdentifier];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (BOOL)finishAllWorkoutsForClient:(id)a3 error:(id *)a4
{
  id v6 = a3;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)p_profile);
  BOOL v9 = +[HDWorkoutSessionServer finishAllWorkoutSessionsForClient:v6 profile:WeakRetained error:a4];

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)p_profile);
    BOOL v11 = +[HDWorkoutBuilderServer finishAllWorkoutBuildersForClient:v6 profile:v10 error:a4];
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (void)recoverWorkoutSessionForClient:(id)a3 server:(id)a4 completion:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__HDWorkoutManager_recoverWorkoutSessionForClient_server_completion___block_invoke;
  block[3] = &unk_1E62F4E40;
  void block[4] = self;
  id v13 = v7;
  id v14 = v8;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(queue, block);
}

void __69__HDWorkoutManager_recoverWorkoutSessionForClient_server_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!v2) {
    goto LABEL_7;
  }
  id v3 = *(NSObject **)(v2 + 136);
  id v4 = *(id *)(a1 + 40);
  dispatch_assert_queue_V2(v3);
  id v5 = [v4 process];

  id v6 = [v5 applicationIdentifier];

  id v7 = [*(id *)(v2 + 8) applicationIdentifier];
  LODWORD(v5) = [v7 isEqualToString:v6];

  if (v5)
  {
    id v8 = *(id *)(v2 + 8);
  }
  else
  {
    BOOL v9 = [*(id *)(v2 + 32) allValues];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __61__HDWorkoutManager__queue_sessionServerForRecoveryForClient___block_invoke;
    v13[3] = &unk_1E630B3B8;
    id v14 = v6;
    objc_msgSend(v9, "hk_firstObjectPassingTest:", v13);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  if (v8)
  {
    id v12 = 0;
    id v10 = [v8 taskServerConfigurationForRecoveryWithError:&v12];
    id v11 = v12;
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
LABEL_7:
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v8 = 0;
  }
}

void __45__HDWorkoutManager__activeSessionIdentifiers__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __61__HDWorkoutManager__scheduleFinishAllDetachedWorkoutBuilders__block_invoke(uint64_t a1)
{
}

- (void)_finishAllDetachedWorkoutBuilders
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 136));
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v15 = 0x3032000000;
    uint64_t v16 = __Block_byref_object_copy__180;
    id v17 = __Block_byref_object_dispose__180;
    id v18 = 0;
    uint64_t v2 = *(NSObject **)(a1 + 136);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__HDWorkoutManager__activeSessionIdentifiers__block_invoke;
    block[3] = &unk_1E62F3230;
    void block[4] = a1;
    void block[5] = &buf;
    dispatch_sync(v2, block);
    id v3 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);

    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    id v12 = 0;
    BOOL v6 = +[HDWorkoutBuilderServer finishAllDetachedWorkoutBuildersExcludingSessions:v4 profile:WeakRetained error:&v12];
    id v7 = v12;

    _HKInitializeLogging();
    id v8 = *MEMORY[0x1E4F29FB8];
    BOOL v9 = *MEMORY[0x1E4F29FB8];
    if (v6)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = v8;
        id v11 = [v3 componentsJoinedByString:@", "];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v11;
        _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "Finished all detached workout builders, excluding active sessions (%@)", (uint8_t *)&buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LODWORD(buf) = 138543362;
      *(void *)((char *)&buf + 4) = v7;
      _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "Failed to finish detached workout builders: %{public}@", (uint8_t *)&buf, 0xCu);
    }
  }
}

- (id)currentWorkoutConfiguration
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__180;
  id v11 = __Block_byref_object_dispose__180;
  id v12 = 0;
  queue = self->_queue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __47__HDWorkoutManager_currentWorkoutConfiguration__block_invoke;
  v6[3] = &unk_1E62F3230;
  void v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __47__HDWorkoutManager_currentWorkoutConfiguration__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) currentActivityConfiguration];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)generatePauseOrResumeRequestAllowingBackgroundRuntime:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  _HKInitializeLogging();
  id v8 = (os_log_t *)MEMORY[0x1E4F29FB8];
  uint64_t v9 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    id v10 = @"NO";
    if (v4) {
      id v10 = @"YES";
    }
    *(_DWORD *)long long buf = 138543618;
    id v26 = self;
    __int16 v27 = 2112;
    uint64_t v28 = v10;
    _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: Received pause/resume request, allow background runtime: %@", buf, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v12 = [WeakRetained database];
  int v13 = [v12 isProtectedDataAvailable];

  BOOL v14 = [(HDWorkoutSessionServer *)self->_currentWorkout canBePaused];
  BOOL v15 = [(HDWatchAppStateMonitor *)self->_appStateMonitor appIsActive];
  if (((v13 & 1) != 0 || v14) && (((v13 ^ 1 | v15) & 1) != 0 || v4))
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke;
    block[3] = &unk_1E62FFD00;
    void block[4] = self;
    id v23 = v7;
    SEL v24 = a2;
    dispatch_async(queue, block);
  }
  else
  {
    _HKInitializeLogging();
    os_log_t v16 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v16;
      HKStringFromBool();
      id v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v19 = HKStringFromBool();
      long long v20 = HKStringFromBool();
      *(_DWORD *)long long buf = 138544130;
      id v26 = self;
      __int16 v27 = 2114;
      uint64_t v28 = v18;
      __int16 v29 = 2114;
      v30 = v19;
      __int16 v31 = 2114;
      id v32 = v20;
      _os_log_impl(&dword_1BCB7D000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: Ignoring pause/resume request. { unlocked=%{public}@, can be paused=%{public}@, active=%{public}@.", buf, 0x2Au);
    }
    (*((void (**)(id, uint64_t, void))v7 + 2))(v7, 1, 0);
  }
}

void __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke(void *a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1[4] + 8) identifier];
  _HKInitializeLogging();
  uint64_t v3 = (os_log_t *)MEMORY[0x1E4F29FB8];
  BOOL v4 = *MEMORY[0x1E4F29FB8];
  BOOL v5 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v5)
    {
      uint64_t v6 = a1[4];
      *(_DWORD *)long long buf = 138543618;
      uint64_t v30 = v6;
      __int16 v31 = 2114;
      id v32 = v2;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Generating pause/resume request for session %{public}@.", buf, 0x16u);
    }
    id v7 = objc_alloc(MEMORY[0x1E4F2B990]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F28C18]);
    uint64_t v9 = (void *)[v7 initWithEventType:10 sessionId:v2 dateInterval:v8 metadata:0];

    [*(id *)(a1[4] + 8) generateEvent:v9];
    id v10 = [*(id *)(a1[4] + 8) clientProcessBundleIdentifier];
    id v28 = 0;
    BOOL v11 = +[HDBackgroundWorkoutRunner hasBackgroundPermissionForBundleIdentifier:v10 errorOut:&v28];
    id v12 = v28;

    _HKInitializeLogging();
    int v13 = *v3;
    if (os_log_type_enabled(*v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = a1[4];
      BOOL v15 = @"NO";
      *(_DWORD *)long long buf = 138543874;
      if (v11) {
        BOOL v15 = @"YES";
      }
      uint64_t v30 = v14;
      __int16 v31 = 2114;
      id v32 = v15;
      __int16 v33 = 2114;
      id v34 = v12;
      _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Client process has background permission: %{public}@, error: %{public}@", buf, 0x20u);
    }
    if (v12) {
      char v16 = 1;
    }
    else {
      char v16 = v11;
    }
    if ((v16 & 1) == 0)
    {
      id v17 = [*(id *)(a1[4] + 8) client];
      id v18 = +[HDBackgroundWorkoutRunner acquireBKSAssertionForClient:v17];

      dispatch_time_t v19 = dispatch_time(0, 10000000000);
      uint64_t v20 = a1[4];
      uint64_t v21 = *(NSObject **)(v20 + 136);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_348;
      block[3] = &unk_1E62F31C0;
      id v26 = v18;
      uint64_t v27 = v20;
      id v22 = v18;
      dispatch_after(v19, v21, block);
    }
    (*(void (**)(void))(a1[5] + 16))();
  }
  else
  {
    if (v5)
    {
      uint64_t v23 = a1[4];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v30 = v23;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Rejecting pause/resume request; no current workout.",
        buf,
        0xCu);
    }
    uint64_t v24 = a1[5];
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_errorForInvalidArgument:class:selector:format:", @"@\"\", objc_opt_class(), a1[6], @"No current workout to pause or resume"");
    (*(void (**)(uint64_t, void, void *))(v24 + 16))(v24, 0, v9);
  }
}

void __85__HDWorkoutManager_generatePauseOrResumeRequestAllowingBackgroundRuntime_completion___block_invoke_348(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [*(id *)(*(void *)(a1 + 40) + 8) client];
  +[HDBackgroundWorkoutRunner releaseBKSAssertion:v1 forClient:v2];
}

- (BOOL)allowBackgroundStartForApplicationIdentifier:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([&unk_1F17EAC38 containsObject:v4])
  {
    _HKInitializeLogging();
    BOOL v5 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543618;
      BOOL v11 = self;
      __int16 v12 = 2114;
      id v13 = v4;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Workout session allowed to start for %{public}@ because it is listed", (uint8_t *)&v10, 0x16u);
    }
    BOOL v6 = 1;
  }
  else
  {
    os_unfair_lock_lock(&self->_assertionsLock);
    id v7 = [(NSMutableDictionary *)self->_backgroundStartAssertions objectForKeyedSubscript:v4];
    os_unfair_lock_unlock(&self->_assertionsLock);
    if (v7 && [v7 state] != 3)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        int v10 = 138543618;
        BOOL v11 = self;
        __int16 v12 = 2114;
        id v13 = v4;
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: Workout session allowed to start for %{public}@ because an assertion is held", (uint8_t *)&v10, 0x16u);
      }
      BOOL v6 = 1;
    }
    else
    {
      BOOL v6 = 0;
    }
  }
  return v6;
}

- (void)_takeBackgroundStartAssertionForApplicationIdentifier:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F65CC8];
  id v5 = a3;
  id v9 = (id)[[v4 alloc] initWithAssertionIdentifier:@"HDAssertionIdentifierBackgroundWorkoutStart" ownerIdentifier:v5];
  [v9 setBudget:30.0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained sessionAssertionManager];
  [v7 takeAssertion:v9];

  os_unfair_lock_lock(&self->_assertionsLock);
  id v8 = [(NSMutableDictionary *)self->_backgroundStartAssertions objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_backgroundStartAssertions setObject:v9 forKeyedSubscript:v5];

  os_unfair_lock_unlock(&self->_assertionsLock);
  [v8 invalidate];
}

void __61__HDWorkoutManager__scheduleFinishForDetachedWorkoutBuilders__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v1 = objc_loadWeakRetained(WeakRetained + 14);
    id v2 = [v1 database];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __61__HDWorkoutManager__scheduleFinishAllDetachedWorkoutBuilders__block_invoke;
    v4[3] = &unk_1E62F3208;
    v4[4] = WeakRetained;
    [v2 performAsynchronously:v4];
  }
}

void __63__HDWorkoutManager__recoverActiveWorkoutSessionServersIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  id v46 = 0;
  uint64_t v3 = +[HDWorkoutSessionServer sessionIdentifierForRecoveryInProfile:WeakRetained error:&v46];
  id v4 = v46;

  if (v3)
  {
    id v5 = [*(id *)(*(void *)(a1 + 32) + 32) objectForKeyedSubscript:v3];

    if (v5)
    {
      _HKInitializeLogging();
      BOOL v6 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = *(void *)(a1 + 32);
        id v8 = *(void **)(v7 + 32);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v48 = v7;
        __int16 v49 = 2114;
        id v50 = v8;
        _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping automatic current workout recovery: session servers (%{public}@) already exist.", buf, 0x16u);
      }
LABEL_8:
      -[HDWorkoutManager _postWorkoutUpdatedNotification](*(void *)(a1 + 32));
      goto LABEL_29;
    }
    id v11 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    __int16 v12 = [v11 daemon];
    id v13 = [v12 devicePowerMonitor];
    int v14 = [v13 primarySourceIsCharging];

    if (v14)
    {
      _HKInitializeLogging();
      BOOL v15 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v48 = v16;
        __int16 v49 = 2114;
        id v50 = v3;
        _os_log_impl(&dword_1BCB7D000, v15, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping automatic current workout recovery (%{public}@): primary power source is currently charging.", buf, 0x16u);
      }
      id v17 = v4;
    }
    else
    {
      id v19 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
      id v45 = v4;
      uint64_t v20 = +[HDWorkoutSessionServer recoveredSessionServerWithProfile:v19 sessionUUID:v3 error:&v45];
      id v17 = v45;

      uint64_t v21 = [v20 workoutConfiguration];
      if (v20)
      {
        id v22 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
        uint64_t v23 = [v22 daemon];
        uint64_t v24 = [v23 devicePowerMonitor];
        int v25 = [v24 primarySourceIsCharging];

        if (v25)
        {
          _HKInitializeLogging();
          id v26 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v27 = *(void *)(a1 + 32);
            *(_DWORD *)long long buf = 138543618;
            uint64_t v48 = v27;
            __int16 v49 = 2114;
            id v50 = v3;
            _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping automatic current workout recovery (%{public}@): primary power source is currently charging.", buf, 0x16u);
          }
        }
        else
        {
          uint64_t v32 = [v20 state];
          if ((unint64_t)(v32 - 4) < 0xB || v32 == 17)
          {
            _HKInitializeLogging();
            __int16 v33 = *MEMORY[0x1E4F29FB8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v34 = *(void *)(a1 + 32);
              *(_DWORD *)long long buf = 138543618;
              uint64_t v48 = v34;
              __int16 v49 = 2114;
              id v50 = v20;
              _os_log_impl(&dword_1BCB7D000, v33, OS_LOG_TYPE_DEFAULT, "%{public}@: Automatically recovering latest workout session %{public}@ after restart.", buf, 0x16u);
            }
            uint64_t v35 = *(void **)(*(void *)(a1 + 32) + 32);
            v36 = [v20 identifier];
            [v35 setObject:v20 forKeyedSubscript:v36];

            [v20 addObserver:*(void *)(a1 + 32) queue:*(void *)(*(void *)(a1 + 32) + 136)];
            -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:](*(void *)(a1 + 32), v20);

            goto LABEL_26;
          }
          _HKInitializeLogging();
          id v38 = (void *)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v39 = *(void *)(a1 + 32);
            v40 = v38;
            [v20 state];
            uint64_t v41 = _HKWorkoutSessionServerStateToString();
            *(_DWORD *)long long buf = 138543874;
            uint64_t v48 = v39;
            __int16 v49 = 2114;
            id v50 = v20;
            __int16 v51 = 2114;
            id v52 = v41;
            _os_log_impl(&dword_1BCB7D000, v40, OS_LOG_TYPE_DEFAULT, "%{public}@: Not automatically recovering workout session %{public}@ after restart; state %{public}@ does n"
              "ot indicate a current workout",
              buf,
              0x20u);
          }
        }
      }
      else
      {
        _HKInitializeLogging();
        id v28 = *MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
        {
          uint64_t v43 = *(void *)(a1 + 32);
          *(_DWORD *)long long buf = 138543874;
          uint64_t v48 = v43;
          __int16 v49 = 2114;
          id v50 = v3;
          __int16 v51 = 2114;
          id v52 = v17;
          _os_log_error_impl(&dword_1BCB7D000, v28, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover workout session %{public}@ after restart with error %{public}@", buf, 0x20u);
        }
      }

      if (v21)
      {
LABEL_25:
        uint64_t v30 = (void *)[*(id *)(a1 + 32) newBiomeInterface];
        [v30 stopSessionWithIdentifier:v3 recoveredWorkoutConfiguration:v21];

LABEL_26:
        id v4 = v17;
        goto LABEL_29;
      }
    }
    id v29 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    id v44 = v17;
    uint64_t v21 = +[HDWorkoutSessionServer workoutConfigurationForRecoveryWithProfile:v29 sessionUUID:v3 error:&v44];
    id v4 = v44;

    if (v21)
    {
      id v17 = v4;
      goto LABEL_25;
    }
    _HKInitializeLogging();
    __int16 v31 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v42 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543874;
      uint64_t v48 = v42;
      __int16 v49 = 2114;
      id v50 = v3;
      __int16 v51 = 2114;
      id v52 = v4;
      _os_log_error_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_ERROR, "%{public}@: Failed to recover workout configuration for session %{public}@ after restart with error %{public}@", buf, 0x20u);
    }
  }
  else
  {
    _HKInitializeLogging();
    id v9 = *MEMORY[0x1E4F29FB8];
    int v10 = *MEMORY[0x1E4F29FB8];
    if (v4)
    {
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        uint64_t v37 = *(void *)(a1 + 32);
        *(_DWORD *)long long buf = 138543618;
        uint64_t v48 = v37;
        __int16 v49 = 2114;
        id v50 = v4;
        _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "%{public}@: No workout session available for automatic recovery after restart: %{public}@", buf, 0x16u);
      }
      goto LABEL_8;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = *(void *)(a1 + 32);
      *(_DWORD *)long long buf = 138543362;
      uint64_t v48 = v18;
      _os_log_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@: No workout session available for automatic recovery after restart", buf, 0xCu);
    }
    id v4 = 0;
  }
LABEL_29:
}

- (uint64_t)_postWorkoutUpdatedNotification
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    _HKInitializeLogging();
    id v1 = *MEMORY[0x1E4F29FB8];
    BOOL v2 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
    uint64_t v3 = (const char *)*MEMORY[0x1E4F2BDF0];
    if (v2)
    {
      int v4 = 136315138;
      id v5 = v3;
      _os_log_impl(&dword_1BCB7D000, v1, OS_LOG_TYPE_DEFAULT, "Posting %s notification", (uint8_t *)&v4, 0xCu);
    }
    notify_post(v3);
    return HKDispatchAsyncOnGlobalConcurrentQueue();
  }
  return result;
}

- (void)_finishAllWorkoutsWithExclusionHandler:(uint64_t)a1
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 136));
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__180;
    uint64_t v24 = __Block_byref_object_dispose__180;
    id v25 = 0;
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 112));
    id v5 = [WeakRetained database];
    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    int v14 = __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke;
    BOOL v15 = &unk_1E630B410;
    uint64_t v16 = a1;
    uint64_t v18 = &v20;
    id v19 = 0;
    id v17 = v3;
    BOOL v6 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v5 error:&v19 block:&v12];
    id v7 = v19;

    if (v6)
    {
      _HKInitializeLogging();
      id v8 = (id)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        id v9 = objc_msgSend((id)v21[5], "allObjects", v12, v13, v14, v15, v16);
        int v10 = [v9 componentsJoinedByString:@", "];
        *(_DWORD *)long long buf = 138412290;
        id v27 = v10;
        _os_log_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_DEFAULT, "Finished all unrecovered workouts, excluding active sessions (%@)", buf, 0xCu);
      }
    }
    else
    {
      _HKInitializeLogging();
      id v11 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138543362;
        id v27 = v7;
        _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "Failed to finish unrecovered workouts: %{public}@", buf, 0xCu);
      }
    }

    _Block_object_dispose(&v20, 8);
  }
}

BOOL __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  uint64_t v23 = 0;
  uint64_t v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  uint64_t v20 = __Block_byref_object_copy__180;
  uint64_t v21 = __Block_byref_object_dispose__180;
  id v22 = 0;
  BOOL v6 = *(NSObject **)(*(void *)(a1 + 32) + 136);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke_2;
  block[3] = &unk_1E630B3E8;
  long long v12 = *(_OWORD *)(a1 + 40);
  id v7 = (id)v12;
  long long v14 = v12;
  void block[4] = *(void *)(a1 + 32);
  BOOL v15 = &v23;
  uint64_t v16 = &v17;
  dispatch_sync(v6, block);
  if (*((unsigned char *)v24 + 24))
  {
    BOOL v8 = 1;
  }
  else
  {
    id v9 = (id)v18[5];
    int v10 = v9;
    if (v9)
    {
      if (a3) {
        *a3 = v9;
      }
      else {
        _HKLogDroppedError();
      }
    }

    BOOL v8 = *((unsigned char *)v24 + 24) != 0;
  }

  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v23, 8);

  return v8;
}

void __59__HDWorkoutManager__finishAllWorkoutsWithExclusionHandler___block_invoke_2(void *a1)
{
  uint64_t v2 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = *(void *)(a1[6] + 8);
  int v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  uint64_t v5 = *(void *)(*(void *)(a1[6] + 8) + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 112));
  id v11 = 0;
  BOOL v7 = +[HDWorkoutSessionServer finishAllWorkoutsExcludingSessions:v5 profile:WeakRetained error:&v11];
  id v8 = v11;
  *(unsigned char *)(*(void *)(a1[7] + 8) + 24) = v7;

  uint64_t v9 = *(void *)(a1[8] + 8);
  int v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v8;
}

void __55__HDWorkoutManager__notifyForPostLaunchSessionRecovery__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 72);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        dispatch_async(*(dispatch_queue_t *)(*(void *)(a1 + 32) + 80), *(dispatch_block_t *)(*((void *)&v9 + 1) + 8 * v6++));
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 72);
  *(void *)(v7 + 72) = 0;
}

void __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v3 = v2[17];
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v17 = 3221225472;
    uint64_t v18 = __63__HDWorkoutManager__recoverActiveWorkoutSessionServersIfNeeded__block_invoke;
    uint64_t v19 = &unk_1E62F3208;
    id v20 = v2;
    dispatch_sync(v3, &block);
    uint64_t v4 = *(void *)(a1 + 32);
  }
  else
  {
    uint64_t v4 = 0;
  }
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke_2;
  v14[3] = &unk_1E630B438;
  v14[4] = v4;
  -[HDWorkoutManager _finishAllWorkoutsWithExclusionHandler:](v4, v14);
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(v5 + 112));
    uint64_t v7 = [WeakRetained daemon];
    id v8 = [v7 behavior];
    int v9 = [v8 supportsWorkouts];

    if (v9)
    {
      objc_initWeak(&location, (id)v5);
      dispatch_time_t v10 = dispatch_time(0, 30000000000);
      long long v11 = *(NSObject **)(v5 + 136);
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __61__HDWorkoutManager__scheduleFinishForDetachedWorkoutBuilders__block_invoke;
      uint64_t v19 = &unk_1E62F6BD0;
      objc_copyWeak(&v20, &location);
      dispatch_after(v10, v11, &block);
      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
    long long v12 = *(void **)(a1 + 32);
    if (v12)
    {
      uint64_t v13 = v12[17];
      uint64_t block = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      uint64_t v18 = __55__HDWorkoutManager__notifyForPostLaunchSessionRecovery__block_invoke;
      uint64_t v19 = &unk_1E62F3208;
      id v20 = v12;
      dispatch_sync(v13, &block);
    }
  }
}

id __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke_2(uint64_t a1)
{
  id v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 32) allKeys];
  uint64_t v3 = [v1 setWithArray:v2];

  return v3;
}

- (void)performWhenPostLaunchSessionRecoveryHasCompleted:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__HDWorkoutManager_performWhenPostLaunchSessionRecoveryHasCompleted___block_invoke;
  v7[3] = &unk_1E62F4928;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __69__HDWorkoutManager_performWhenPostLaunchSessionRecoveryHasCompleted___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (!*(void *)(v2 + 80))
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 80);
    *(void *)(v4 + 80) = v3;

    uint64_t v2 = *(void *)(a1 + 32);
  }
  if (*(unsigned char *)(v2 + 64))
  {
    id v6 = *(NSObject **)(v2 + 80);
    uint64_t v7 = *(void **)(a1 + 40);
    dispatch_async(v6, v7);
  }
  else
  {
    id v8 = *(void **)(v2 + 72);
    if (!v8)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v10 = *(void *)(a1 + 32);
      long long v11 = *(void **)(v10 + 72);
      *(void *)(v10 + 72) = v9;

      id v8 = *(void **)(*(void *)(a1 + 32) + 72);
    }
    id v13 = (id)[*(id *)(a1 + 40) copy];
    long long v12 = _Block_copy(v13);
    [v8 addObject:v12];
  }
}

- (void)getCurrentWorkoutSnapshotWithCompletion:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"HDWorkoutManager.m", 800, @"Invalid parameter not satisfying: %@", @"completion != NULL" object file lineNumber description];
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HDWorkoutManager_getCurrentWorkoutSnapshotWithCompletion___block_invoke;
  block[3] = &unk_1E62F3CA8;
  void block[4] = self;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(queue, block);
}

void __60__HDWorkoutManager_getCurrentWorkoutSnapshotWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) currentWorkoutSnapshot];
  (*(void (**)(uint64_t, id, void))(v1 + 16))(v1, v2, 0);
}

- (void)registerCurrentWorkoutObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 88) registerObserver:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v4 = *(void **)(v3 + 88);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke_2;
  v6[3] = &unk_1E630B460;
  void v6[4] = v3;
  return [v4 notifyObserver:v2 handler:v6];
}

uint64_t __51__HDWorkoutManager_registerCurrentWorkoutObserver___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 workoutManager:*(void *)(a1 + 32) didUpdateCurrentWorkout:*(void *)(*(void *)(a1 + 32) + 8)];
}

- (void)unregisterCurrentWorkoutObserver:(id)a3
{
}

- (id)currentWorkoutSessionServer
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__180;
  id v10 = __Block_byref_object_dispose__180;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __47__HDWorkoutManager_currentWorkoutSessionServer__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__HDWorkoutManager_currentWorkoutSessionServer__block_invoke(uint64_t a1)
{
}

- (id)diagnosticDescription
{
  id v3 = [MEMORY[0x1E4F28E78] string];
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __41__HDWorkoutManager_diagnosticDescription__block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  uint64_t v6 = v10;
  id v7 = v5;

  return v7;
}

void __41__HDWorkoutManager_diagnosticDescription__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 8);
  if (v2)
  {
    id v7 = [v2 clientProcessBundleIdentifier];
    id v3 = *(void **)(a1 + 40);
    id v4 = [*(id *)(*(void *)(a1 + 32) + 8) client];
    id v5 = [v4 process];
    [v3 appendFormat:@"\nWorkout process: %@ (%d)\n", v7, objc_msgSend(v5, "processIdentifier")];

    [*(id *)(a1 + 40) appendFormat:@"Workout Session: %@\n", *(void *)(*(void *)(a1 + 32) + 8)];
  }
  else
  {
    uint64_t v6 = *(void **)(a1 + 40);
    [v6 appendString:@"\nNo currently active workouts."];
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  id v4 = [(HDWorkoutManager *)self profile];
  id v5 = [v4 daemon];
  uint64_t v6 = [v5 devicePowerMonitor];
  [v6 addDevicePowerObserver:self queue:0];

  if (self)
  {
    id v7 = [(HDWorkoutManager *)self profile];
    uint64_t v8 = [v7 daemon];
    id v9 = [v8 behavior];
    int v10 = [v9 supportsWorkouts];

    if (v10)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
      long long v12 = [WeakRetained database];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __60__HDWorkoutManager__recoverCurrentWorkoutSessionAfterLaunch__block_invoke;
      v13[3] = &unk_1E62F3208;
      void v13[4] = self;
      [v12 performWhenDataProtectedByFirstUnlockIsAvailable:v13];
    }
  }
}

- (void)devicePowerMonitor:(id)a3 primaryPowerSourceIsCharging:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    _HKInitializeLogging();
    uint64_t v6 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v9 = self;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Device is now charging; finishing all detached sessions and builders.",
        buf,
        0xCu);
    }
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __68__HDWorkoutManager_devicePowerMonitor_primaryPowerSourceIsCharging___block_invoke;
    v7[3] = &unk_1E630B438;
    v7[4] = self;
    -[HDWorkoutManager _finishAllWorkoutsWithExclusionHandler:]((uint64_t)self, v7);
    -[HDWorkoutManager _finishAllDetachedWorkoutBuilders]((uint64_t)self);
  }
}

id __68__HDWorkoutManager_devicePowerMonitor_primaryPowerSourceIsCharging___block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(*(void *)(a1 + 32) + 32) allValues];
  uint64_t v2 = objc_msgSend(v1, "hk_mapToSet:", &__block_literal_global_397_0);

  return v2;
}

id __68__HDWorkoutManager_devicePowerMonitor_primaryPowerSourceIsCharging___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 taskServer];
  if (v3)
  {
    BOOL v4 = [v2 identifier];
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)hk_fakeLapEventWithDate:(id)a3 strokeStyle:(int64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__HDWorkoutManager_hk_fakeLapEventWithDate_strokeStyle___block_invoke;
  block[3] = &unk_1E62F4978;
  void block[4] = self;
  id v10 = v6;
  int64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __56__HDWorkoutManager_hk_fakeLapEventWithDate_strokeStyle___block_invoke(void *a1)
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1[4] + 8) identifier];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F2B990]);
    BOOL v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:a1[5] duration:0.0];
    uint64_t v8 = *MEMORY[0x1E4F2A1E8];
    id v5 = [NSNumber numberWithInteger:a1[6]];
    v9[0] = v5;
    id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:&v8 count:1];
    id v7 = (void *)[v3 initWithEventType:5 sessionId:v2 dateInterval:v4 metadata:v6];

    if (v7) {
      [*(id *)(a1[4] + 8) generateEvent:v7];
    }
  }
}

- (void)hk_fakeStopEventWithDate:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HDWorkoutManager_hk_fakeStopEventWithDate___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __45__HDWorkoutManager_hk_fakeStopEventWithDate___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) identifier];
  if (v2)
  {
    id v6 = v2;
    id v3 = objc_alloc(MEMORY[0x1E4F2B990]);
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:*(void *)(a1 + 40) duration:0.0];
    id v5 = (void *)[v3 initWithEventType:1 sessionId:v6 dateInterval:v4 metadata:0];

    if (v5) {
      [*(id *)(*(void *)(a1 + 32) + 8) generateEvent:v5];
    }

    id v2 = v6;
  }
}

- (void)unitTest_smoothRoute:(id)a3 withSmoother:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke;
  v15[3] = &unk_1E62F2F48;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  dispatch_async(queue, v15);
}

void __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = *(void **)(*(void *)(a1 + 32) + 144);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke_2;
  v4[3] = &unk_1E630B4A8;
  uint64_t v3 = *(void *)(a1 + 48);
  id v5 = *(id *)(a1 + 56);
  objc_msgSend(v2, "unitTest_smoothRouteSample:withSmoother:completion:", v1, v3, v4);
}

uint64_t __65__HDWorkoutManager_unitTest_smoothRoute_withSmoother_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)unitTest_currentWorkoutSession
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__180;
  id v10 = __Block_byref_object_dispose__180;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__HDWorkoutManager_unitTest_currentWorkoutSession__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __50__HDWorkoutManager_unitTest_currentWorkoutSession__block_invoke(uint64_t a1)
{
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  v19[1] = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (HDWorkoutSessionServer *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentWorkout != v8)
  {
    if ((a4 & 0xFFFFFFFFFFFFFFFELL) == 4)
    {
      -[HDWorkoutManager _queue_beginTransitionToWorkoutSession:]((uint64_t)self, v8);
      goto LABEL_10;
    }
    if (a4 != 16) {
      goto LABEL_10;
    }
LABEL_9:
    -[HDWorkoutManager _queue_sessionFinished:]((uint64_t)self, v8);
    goto LABEL_10;
  }
  id v9 = objc_msgSend(NSNumber, "numberWithInteger:", -[HDWorkoutSessionServer state](v8, "state"));
  id v18 = @"state";
  v19[0] = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:&v18 count:1];
  id v11 = kHDEventNameWorkoutSession;
  id v12 = [(HDWorkoutSessionServer *)self->_currentWorkout client];
  HDPowerLogForClient(v11, v12, v10);

  -[HDWorkoutManager _postWorkoutUpdatedNotification]((uint64_t)self);
  if (a4 == 16) {
    goto LABEL_9;
  }
  if (self->_nextWorkout)
  {
    id v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 8, @"Another session is starting");
    [(HDWorkoutSessionServer *)v8 didResignCurrentWithError:v13];
  }
  currentWorkoutObservers = self->_currentWorkoutObservers;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __67__HDWorkoutManager_workoutSession_didChangeToState_fromState_date___block_invoke;
  v15[3] = &unk_1E630B4D0;
  v15[4] = self;
  id v16 = v8;
  int64_t v17 = a4;
  [(HKObserverSet *)currentWorkoutObservers notifyObservers:v15];

LABEL_10:
}

void __67__HDWorkoutManager_workoutSession_didChangeToState_fromState_date___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutManager:a1[4] currentWorkout:a1[5] didChangeToState:a1[6]];
  }
}

- (void)workoutSession:(id)a3 didUpdateDataAccumulator:(id)a4
{
  uint64_t v6 = (HDWorkoutSessionServer *)a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (self->_currentWorkout == v6)
  {
    currentWorkoutObservers = self->_currentWorkoutObservers;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    void v9[2] = __60__HDWorkoutManager_workoutSession_didUpdateDataAccumulator___block_invoke;
    v9[3] = &unk_1E630B4F8;
    v9[4] = self;
    id v10 = v6;
    id v11 = v7;
    [(HKObserverSet *)currentWorkoutObservers notifyObservers:v9];
  }
}

void __60__HDWorkoutManager_workoutSession_didUpdateDataAccumulator___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  if (objc_opt_respondsToSelector()) {
    [v3 workoutManager:a1[4] currentWorkout:a1[5] didUpdateDataAccumulator:a1[6]];
  }
}

- (void)_didCreateMirroredSessionServer:(id)a3
{
  id v4 = a3;
  -[HDWorkoutManager _setupNewSessionServer:withTaskServer:]((uint64_t)self, v4, 0);
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__HDWorkoutManager__didCreateMirroredSessionServer___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __52__HDWorkoutManager__didCreateMirroredSessionServer___block_invoke(uint64_t a1)
{
}

uint64_t __45__HDWorkoutManager__queue_setCurrentWorkout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 workoutManager:*(void *)(a1 + 32) didUpdateCurrentWorkout:*(void *)(*(void *)(a1 + 32) + 8)];
}

uint64_t __43__HDWorkoutManager__queue_sessionFinished___block_invoke(uint64_t a1, void *a2)
{
  return [a2 workoutManager:*(void *)(a1 + 32) didUpdateCurrentWorkout:0];
}

void __51__HDWorkoutManager__postWorkoutUpdatedNotification__block_invoke()
{
  id v0 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v0 postNotificationName:@"HDWorkoutManagerStateDidChange" object:0];
}

- (BOOL)isInHeartRateRecovery
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = v2->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __41__HDWorkoutManager_isInHeartRateRecovery__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __41__HDWorkoutManager_isInHeartRateRecovery__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) state];
  if (result == 15)
  {
    BOOL v3 = 1;
  }
  else
  {
    uint64_t result = [*(id *)(*(void *)(a1 + 32) + 8) state];
    BOOL v3 = result == 14;
  }
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (void)endHeartRateRecovery
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__HDWorkoutManager_endHeartRateRecovery__block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__HDWorkoutManager_endHeartRateRecovery__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) endHeartRateRecovery];
}

- (BOOL)currentActivityRequiresExtendedMode
{
  id v2 = [(HDWorkoutManager *)self currentWorkoutConfiguration];
  char v3 = [v2 shouldUseExtendedMode];

  return v3;
}

- (void)tearDownMirroredWorkoutSession:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__HDWorkoutManager_tearDownMirroredWorkoutSession___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __51__HDWorkoutManager_tearDownMirroredWorkoutSession___block_invoke(uint64_t a1)
{
}

- (HDAlertSuppressor)alertSuppressor
{
  return self->_alertSuppressor;
}

- (HDLocationManager)locationManager
{
  return self->_locationManager;
}

- (HDWorkoutMirroringManager)mirroringManager
{
  return self->_mirroringManager;
}

- (HDWorkoutLocationSmoother)locationSmoother
{
  return self->_locationSmoother;
}

- (void)setLocationSmoother:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationSmoother, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_mirroringManager, 0);
  objc_storeStrong((id *)&self->_alertSuppressor, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_backgroundStartAssertions, 0);
  objc_storeStrong((id *)&self->_currentWorkoutObservers, 0);
  objc_storeStrong((id *)&self->_postLaunchRecoveryCallbackQueue, 0);
  objc_storeStrong((id *)&self->_postLaunchRecoveryBlocks, 0);
  objc_storeStrong((id *)&self->_appStateMonitor, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_sessionCreationHandlers, 0);
  objc_storeStrong((id *)&self->_sessionServers, 0);
  objc_storeStrong((id *)&self->_nextWorkout, 0);
  objc_storeStrong((id *)&self->_currentWorkoutAssertion, 0);

  objc_storeStrong((id *)&self->_currentWorkout, 0);
}

@end