@interface HDWorkoutLocationSmoother
- (HDWorkoutLocationSmoother)initWithProfile:(id)a3;
- (id)_queue_createNewSeriesFromTask:(void *)a3 locations:(void *)a4 error:;
- (id)_workoutWithUUIDString:(uint64_t *)a3 error:;
- (id)didCompleteAllPendingSmoothingTasksHandler;
- (id)unitTest_wilTriggerSmoothing;
- (uint64_t)_shouldObserveWorkouts;
- (void)_associationsSyncedForWorkout:(id)a3;
- (void)_finishSmoothingSampleWithTask:(uint64_t)a1;
- (void)_queue_cancelTimeout;
- (void)_queue_deleteRoutesForTasks:(uint64_t)a1;
- (void)_queue_locationManagerDidSmoothRoutes:(void *)a3 forTask:(void *)a4 error:;
- (void)_queue_scheduleSmoothingTimeoutTimerForTask:(dispatch_queue_t *)a1;
- (void)_queue_smoothAllUnsmoothedLocationSeries;
- (void)_queue_smoothNextSample;
- (void)_queue_smoothingDidFailForTask:(void *)a3 error:(int)a4 shouldRetry:;
- (void)_queue_startSmoothingTask:(uint64_t)a1;
- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4;
- (void)dealloc;
- (void)foregroundClientProcessesDidChange:(id)a3 previouslyForegroundBundleIdentifiers:(id)a4;
- (void)profileDidBecomeReady:(id)a3;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setDidCompleteAllPendingSmoothingTasksHandler:(id)a3;
- (void)setUnitTest_wilTriggerSmoothing:(id)a3;
- (void)smoothRouteWithWorkoutUUID:(id)a3 completion:(id)a4;
- (void)unitTest_smoothRouteSample:(id)a3 withSmoother:(id)a4 completion:(id)a5;
@end

@implementation HDWorkoutLocationSmoother

- (HDWorkoutLocationSmoother)initWithProfile:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDWorkoutLocationSmoother;
  v5 = [(HDWorkoutLocationSmoother *)&v13 init];
  if (v5)
  {
    uint64_t v6 = HKCreateSerialUtilityDispatchQueue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    objc_storeWeak((id *)&v5->_profile, v4);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingSmoothingTasks = v5->_pendingSmoothingTasks;
    v5->_pendingSmoothingTasks = v8;

    currentSmoothingTask = v5->_currentSmoothingTask;
    v5->_currentSmoothingTask = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    [WeakRetained registerProfileReadyObserver:v5 queue:v5->_queue];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v5 = [WeakRetained database];
  [v5 removeProtectedDataObserver:self];

  id v6 = objc_loadWeakRetained((id *)&self->_profile);
  v7 = [v6 daemon];
  v8 = [v7 processStateManager];
  [v8 unregisterForegroundClientProcessObserver:self];

  if (-[HDWorkoutLocationSmoother _shouldObserveWorkouts]((uint64_t)self))
  {
    id v9 = objc_loadWeakRetained((id *)&self->_profile);
    v10 = [v9 dataManager];
    v11 = [MEMORY[0x1E4F2B2C0] workoutType];
    [v10 removeObserver:self forDataType:v11];
  }
  v12.receiver = self;
  v12.super_class = (Class)HDWorkoutLocationSmoother;
  [(HDWorkoutLocationSmoother *)&v12 dealloc];
}

- (uint64_t)_shouldObserveWorkouts
{
  if (!a1) {
    return 0;
  }
  v1 = (id *)(a1 + 24);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
  v3 = [WeakRetained daemon];
  id v4 = [v3 behavior];
  if ([v4 isAppleWatch])
  {
    id v5 = objc_loadWeakRetained(v1);
    id v6 = [v5 daemon];
    v7 = [v6 behavior];
    uint64_t v8 = [v7 supportsWorkoutRouteSmoothing];
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (void)_associationsSyncedForWorkout:(id)a3
{
  _HKInitializeLogging();
  id v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[routes] Workout-sample associations occurred, start smoothing if unlocked.", buf, 2u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__HDWorkoutLocationSmoother__associationsSyncedForWorkout___block_invoke;
  block[3] = &unk_1E62F3208;
  block[4] = self;
  dispatch_async(queue, block);
}

void __59__HDWorkoutLocationSmoother__associationsSyncedForWorkout___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  v3 = [WeakRetained database];
  int v4 = [v3 isProtectedDataAvailable];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v4)
  {
    -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](v5);
  }
  else
  {
    *(unsigned char *)(v5 + 56) = 1;
  }
}

- (void)_queue_smoothAllUnsmoothedLocationSeries
{
  v40[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = [MEMORY[0x1E4F2B448] dataTypeWithCode:102];
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
    v25 = (void *)v2;
    int v4 = +[HDSampleEntity entityEnumeratorWithType:v2 profile:WeakRetained];

    id v5 = objc_loadWeakRetained((id *)(a1 + 24));
    id v6 = [v5 metadataManager];
    v7 = [v6 predicateWithMetadataKey:*MEMORY[0x1E4F2BBF0] value:0 operatorType:5];

    [v4 setPredicate:v7];
    uint64_t v8 = [MEMORY[0x1E4F65D50] orderingTermWithProperty:@"end_date" entityClass:objc_opt_class() ascending:1];
    v40[0] = v8;
    id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
    [v4 setOrderingTerms:v9];

    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v34 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __69__HDWorkoutLocationSmoother__queue_smoothAllUnsmoothedLocationSeries__block_invoke;
    v32[3] = &unk_1E62FD310;
    v32[4] = a1;
    id v11 = v10;
    id v33 = v11;
    char v26 = [v4 enumerateWithError:&v34 handler:v32];
    id v27 = v34;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v12 = v11;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          v18 = [HDSmoothingTask alloc];
          v19 = [v12 objectForKeyedSubscript:v17];
          id v20 = -[HDSmoothingTask _initWithWorkout:routes:](v18, v17, v19);

          [*(id *)(a1 + 32) addObject:v20];
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v28 objects:v39 count:16];
      }
      while (v14);
    }

    if ([*(id *)(a1 + 32) count]) {
      -[HDWorkoutLocationSmoother _queue_smoothNextSample](a1);
    }
    if (v26)
    {
      char v21 = 0;
      v22 = v25;
      v23 = v27;
    }
    else
    {
      _HKInitializeLogging();
      v24 = *MEMORY[0x1E4F29FB8];
      v23 = v27;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v36 = v27;
        __int16 v37 = 2112;
        v38 = v4;
        _os_log_error_impl(&dword_1BCB7D000, v24, OS_LOG_TYPE_ERROR, "[routes] Error occurred in enumerator: %{public}@ %@", buf, 0x16u);
      }
      char v21 = 1;
      v22 = v25;
    }
    *(unsigned char *)(a1 + 56) = v21;
    *(unsigned char *)(a1 + 57) = 0;
  }
}

uint64_t __69__HDWorkoutLocationSmoother__queue_smoothAllUnsmoothedLocationSeries__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = [v3 metadata];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F2BBF0]];

  id v6 = *(id **)(a1 + 32);
  id v22 = 0;
  v7 = -[HDWorkoutLocationSmoother _workoutWithUUIDString:error:](v6, v5, (uint64_t *)&v22);
  id v8 = v22;
  if (v7)
  {
    _HKInitializeLogging();
    id v9 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v10 = v9;
      id v11 = [v3 UUID];
      *(_DWORD *)buf = 138412546;
      v24 = v11;
      __int16 v25 = 2112;
      char v26 = v5;
      _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "[routes] Will smooth route: %@, workout: %@", buf, 0x16u);
    }
    id v12 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];

    if (!v12)
    {
      id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [*(id *)(a1 + 40) setObject:v13 forKeyedSubscript:v7];
    }
    uint64_t v14 = [*(id *)(a1 + 40) objectForKeyedSubscript:v7];
    [v14 addObject:v3];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v15 = (void *)*MEMORY[0x1E4F29FB8];
    BOOL v16 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR);
    if (v8)
    {
      if (!v16) {
        goto LABEL_12;
      }
      uint64_t v14 = v15;
      v17 = [v3 UUID];
      *(_DWORD *)buf = 138412802;
      v24 = v5;
      __int16 v25 = 2112;
      char v26 = v17;
      __int16 v27 = 2112;
      id v28 = v8;
      v18 = "[routes] Unable to fetch workout %@ for route %@. Error: %@";
      v19 = v14;
      uint32_t v20 = 32;
    }
    else
    {
      if (!v16) {
        goto LABEL_12;
      }
      uint64_t v14 = v15;
      v17 = [v3 UUID];
      *(_DWORD *)buf = 138412546;
      v24 = v17;
      __int16 v25 = 2112;
      char v26 = v5;
      v18 = "[routes] Route %@ is orphaned, workout %@ doesn't exist.";
      v19 = v14;
      uint32_t v20 = 22;
    }
    _os_log_error_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_ERROR, v18, buf, v20);
  }
LABEL_12:

  return 1;
}

- (id)_workoutWithUUIDString:(uint64_t *)a3 error:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  if (a1)
  {
    id v6 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v5];
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    a1 = +[HDDataEntity objectWithUUID:v6 encodingOptions:0 profile:WeakRetained error:a3];

    if (!a1)
    {
      _HKInitializeLogging();
      id v8 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        uint64_t v10 = *a3;
        int v11 = 138412546;
        id v12 = v5;
        __int16 v13 = 2114;
        uint64_t v14 = v10;
        _os_log_error_impl(&dword_1BCB7D000, v8, OS_LOG_TYPE_ERROR, "[routes] Failed to find workout with UUID=%@: %{public}@", (uint8_t *)&v11, 0x16u);
      }
      a1 = 0;
    }
  }

  return a1;
}

- (void)_queue_smoothNextSample
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v2 = (id *)(a1 + 40);
    if (!*(void *)(a1 + 40))
    {
      id v3 = objc_msgSend(*(id *)(a1 + 32), "hk_dequeue");
      id obj = v3;
      if (v3)
      {
        int v4 = v3;
        id v5 = +[HKDaemonTransaction transactionWithOwner:a1];
        -[HDSmoothingTask setTransaction:]((uint64_t)v4, v5);

        id v6 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
        char v7 = objc_msgSend(v6, "hk_BOOLForKey:defaultValue:", @"HDLocationSmootherSmoothWithZeroLocations", 0);

        id v8 = [v4[2] metadata];
        id v9 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2BC30]];

        if (-[HDSmoothingTask totalLocations]((uint64_t)v4) || v9 || (v7 & 1) != 0)
        {
          v4[7] = (id)1;
          _HKInitializeLogging();
          char v21 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            v24 = v4;
            _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[routes] New smoothing task will run: %{public}@", buf, 0xCu);
          }
          objc_storeStrong(v2, obj);
          -[HDWorkoutLocationSmoother _queue_scheduleSmoothingTimeoutTimerForTask:]((dispatch_queue_t *)a1, v4);
          -[HDWorkoutLocationSmoother _queue_startSmoothingTask:](a1, v4);
        }
        else
        {
          _HKInitializeLogging();
          uint64_t v10 = (void *)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            id v11 = v4[2];
            id v12 = v10;
            __int16 v13 = [v11 UUID];
            *(_DWORD *)buf = 138543362;
            v24 = v13;
            _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[routes] Workout %{public}@ has 0 locations; deleting it.",
              buf,
              0xCu);
          }
          -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](a1, v4);
          -[HDWorkoutLocationSmoother _finishSmoothingSampleWithTask:](a1, v4);
        }
      }
      else
      {
        uint64_t v14 = [(id)a1 didCompleteAllPendingSmoothingTasksHandler];
        int v4 = (id *)v14;
        if (v14) {
          (*(void (**)(uint64_t))(v14 + 16))(v14);
        }
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 24));
        BOOL v16 = [WeakRetained nanoSyncManager];
        [v16 syncHealthDataWithOptions:0 reason:@"Workout route smoothed" completion:&__block_literal_global_77];

        v17 = (void *)[objc_alloc(MEMORY[0x1E4F2ACC0]) initWithPush:1 pull:0 lite:1];
        id v18 = objc_loadWeakRetained((id *)(a1 + 24));
        v19 = [v18 cloudSyncManager];
        uint32_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F2AD68]) initWithChangesSyncRequest:v17];
        [v19 syncWithRequest:v20 reason:@"Workout route smoothed" completion:&__block_literal_global_352];
      }
    }
  }
}

- (void)profileDidBecomeReady:(id)a3
{
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v6 = [WeakRetained database];
  int v7 = [v6 isProtectedDataAvailable];

  if (v7)
  {
    id v8 = (objc_class *)objc_opt_class();
    id v9 = NSStringFromClass(v8);
    queue = self->_queue;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __51__HDWorkoutLocationSmoother_profileDidBecomeReady___block_invoke;
    v31[3] = &unk_1E62F3208;
    v31[4] = self;
    id v11 = +[HDMaintenanceOperation maintenanceOperationWithName:v9 queue:queue synchronousBlock:v31];

    id v12 = objc_loadWeakRetained((id *)p_profile);
    __int16 v13 = [v12 daemon];
    uint64_t v14 = [v13 maintenanceWorkCoordinator];
    [v14 enqueueMaintenanceOperation:v11];
  }
  else if (!self)
  {
    return;
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  id v15 = objc_loadWeakRetained((id *)p_profile);
  BOOL v16 = [v15 daemon];
  v17 = [v16 behavior];
  int v18 = [v17 isCompanionCapable];

  if (v18)
  {
    _HKInitializeLogging();
    v19 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BCB7D000, v19, OS_LOG_TYPE_DEFAULT, "[routes] Set up location observers", buf, 2u);
    }
    self->_isFirstLaunchAndNotYetSmoothed = 1;
    uint32_t v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:self selector:sel__associationsSyncedForWorkout_ name:@"HDAssociationEntityDidReceiveSyncObjectsNotification" object:0];

    id v21 = objc_loadWeakRetained((id *)p_profile);
    id v22 = [v21 database];
    [v22 addProtectedDataObserver:self queue:self->_queue];

    id v23 = objc_loadWeakRetained((id *)p_profile);
    v24 = [v23 daemon];
    uint64_t v25 = [v24 processStateManager];
    [v25 registerForegroundClientProcessObserver:self];
  }
  if (-[HDWorkoutLocationSmoother _shouldObserveWorkouts]((uint64_t)self))
  {
    id v26 = objc_loadWeakRetained((id *)p_profile);
    __int16 v27 = [v26 database];
    [v27 addProtectedDataObserver:self queue:self->_queue];

    id v28 = objc_loadWeakRetained((id *)p_profile);
    uint64_t v29 = [v28 dataManager];
    long long v30 = [MEMORY[0x1E4F2B2C0] workoutType];
    [v29 addObserver:self forDataType:v30];
  }
}

void __51__HDWorkoutLocationSmoother_profileDidBecomeReady___block_invoke(uint64_t a1)
{
}

- (void)foregroundClientProcessesDidChange:(id)a3 previouslyForegroundBundleIdentifiers:(id)a4
{
  if ([a3 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    id v6 = [WeakRetained database];
    int v7 = [v6 isProtectedDataAvailable];

    if (v7)
    {
      queue = self->_queue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __102__HDWorkoutLocationSmoother_foregroundClientProcessesDidChange_previouslyForegroundBundleIdentifiers___block_invoke;
      block[3] = &unk_1E62F3208;
      block[4] = self;
      dispatch_async(queue, block);
    }
  }
}

void __102__HDWorkoutLocationSmoother_foregroundClientProcessesDidChange_previouslyForegroundBundleIdentifiers___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(a1 + 32) + 57))
  {
    _HKInitializeLogging();
    uint64_t v2 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[routes] Activity app launched, is first launch, and is unlocked.", v3, 2u);
    }
    -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](*(void *)(a1 + 32));
  }
}

- (void)database:(id)a3 protectedDataDidBecomeAvailable:(BOOL)a4
{
  BOOL v4 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (v4)
  {
    if (self->_isFirstLaunchAndNotYetSmoothed)
    {
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
LABEL_9:
        -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries]((uint64_t)self);
        return;
      }
      __int16 v10 = 0;
      int v7 = "[routes] Protected data available and isFirstLaunch; Attempting to smooth unsmoothed routes.";
      id v8 = (uint8_t *)&v10;
    }
    else
    {
      if (!self->_needToCheckForLocationSeriesOnUnlock) {
        return;
      }
      _HKInitializeLogging();
      id v6 = *MEMORY[0x1E4F29FB8];
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_9;
      }
      __int16 v9 = 0;
      int v7 = "[routes] Protected data available; location samples were possibly added while locked; check for workout route.";
      id v8 = (uint8_t *)&v9;
    }
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    goto LABEL_9;
  }
}

- (void)_queue_locationManagerDidSmoothRoutes:(void *)a3 forTask:(void *)a4 error:
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    __int16 v10 = (os_log_t *)MEMORY[0x1E4F29FB8];
    id v11 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v11;
      int v35 = 134217984;
      uint64_t v36 = [v7 count];
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[routes] Successfully smoothed %lu routes", (uint8_t *)&v35, 0xCu);
    }
    if (v8 && ((_BYTE)v8[1] & 1) != 0)
    {
      _HKInitializeLogging();
      os_log_t v19 = *v10;
      if (os_log_type_enabled(*v10, OS_LOG_TYPE_ERROR))
      {
        id v20 = v8[2];
        id v21 = v19;
        id v22 = [v20 UUID];
        int v35 = 138543362;
        uint64_t v36 = (uint64_t)v22;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[routes] Did finish smoothing locations after timeout for workout %{public}@, locations will be ignored.", (uint8_t *)&v35, 0xCu);
      }
    }
    else
    {
      -[HDWorkoutLocationSmoother _queue_cancelTimeout](a1);
      if (v9)
      {
        __int16 v13 = [v9 domain];
        int v14 = [v13 isEqualToString:@"CLSmootherErrorDomain"];

        if (v14 && (unint64_t)([v9 code] - 3) <= 1)
        {
          uint64_t v15 = a1;
          BOOL v16 = v8;
          id v17 = v9;
          uint64_t v18 = 1;
        }
        else
        {
          uint64_t v15 = a1;
          BOOL v16 = v8;
          id v17 = v9;
          uint64_t v18 = 0;
        }
        -[HDWorkoutLocationSmoother _queue_smoothingDidFailForTask:error:shouldRetry:](v15, v16, v17, v18);
      }
      else
      {
        _HKInitializeLogging();
        os_log_t v23 = *v10;
        if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
        {
          if (v8) {
            id v24 = v8[2];
          }
          else {
            id v24 = 0;
          }
          id v25 = v24;
          id v26 = v23;
          __int16 v27 = [v25 UUID];
          int v35 = 138543362;
          uint64_t v36 = (uint64_t)v27;
          _os_log_impl(&dword_1BCB7D000, v26, OS_LOG_TYPE_DEFAULT, "[routes] Did finish smoothing locations for workout %{public}@", (uint8_t *)&v35, 0xCu);
        }
        if (![v7 count] && !-[HDSmoothingTask totalLocations]((uint64_t)v8))
        {
          _HKInitializeLogging();
          os_log_t v28 = *v10;
          if (os_log_type_enabled(*v10, OS_LOG_TYPE_DEFAULT))
          {
            if (v8) {
              id v29 = v8[2];
            }
            else {
              id v29 = 0;
            }
            id v30 = v29;
            long long v31 = v28;
            v32 = [v30 UUID];
            int v35 = 138543362;
            uint64_t v36 = (uint64_t)v32;
            _os_log_impl(&dword_1BCB7D000, v31, OS_LOG_TYPE_DEFAULT, "[routes] Smoothed route has 0 locations for workout %{public}@, deleting it", (uint8_t *)&v35, 0xCu);
          }
          -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](a1, v8);
        }
        if (v8)
        {
          id v33 = v8[5];
          if (v33)
          {
            id v34 = (void (**)(id, id, id, void))v33;
            v34[2](v34, v7, v8[7], 0);
          }
        }
        -[HDWorkoutLocationSmoother _finishSmoothingSampleWithTask:](a1, v8);
      }
    }
  }
}

- (void)_queue_cancelTimeout
{
  uint64_t v2 = *(NSObject **)(a1 + 48);
  if (v2)
  {
    dispatch_source_cancel(v2);
    id v3 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;
  }
}

- (void)_queue_smoothingDidFailForTask:(void *)a3 error:(int)a4 shouldRetry:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  if (!a1) {
    goto LABEL_32;
  }
  if (!a4 || v7 && *((void *)v7 + 7) > 2uLL)
  {
    _HKInitializeLogging();
    int v14 = (os_log_t *)MEMORY[0x1E4F29FB8];
    uint64_t v15 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_FAULT))
    {
      if (v7) {
        id v30 = (void *)*((void *)v7 + 2);
      }
      else {
        id v30 = 0;
      }
      id v31 = v30;
      v32 = v15;
      id v33 = [v31 UUID];
      id WeakRetained = objc_loadWeakRetained(a1 + 3);
      int v35 = [WeakRetained daemon];
      uint64_t v36 = [v35 behavior];
      int v37 = [v36 isAppleWatch];
      v38 = @"Phone";
      *(_DWORD *)buf = 138544130;
      __int16 v43 = 2048;
      id v42 = v33;
      uint64_t v44 = 3;
      if (v37) {
        v38 = @"Watch";
      }
      __int16 v45 = 2112;
      v46 = v38;
      __int16 v47 = 2112;
      id v48 = v8;
      _os_log_fault_impl(&dword_1BCB7D000, v32, OS_LOG_TYPE_FAULT, "[routes] Couldn't smooth routes for workout %{public}@ after %ld attempts on device %@, marking as v2. Error: %@", buf, 0x2Au);
    }
    if (-[HDSmoothingTask totalLocations]((uint64_t)v7))
    {
      if (v7)
      {
        id v16 = *((id *)v7 + 3);
        id v17 = (void *)*((void *)v7 + 2);
      }
      else
      {
        id v16 = 0;
        id v17 = 0;
      }
      id v39 = 0;
      id v18 = v17;
      os_log_t v19 = -[HDWorkoutLocationSmoother _queue_createNewSeriesFromTask:locations:error:](a1, v7, 0, &v39);
      id v20 = v39;

      if (!v19)
      {
        _HKInitializeLogging();
        id v21 = *v14;
        if (os_log_type_enabled(*v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          id v42 = v20;
          _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[routes] An error occurred marking routes as V2: %{public}@", buf, 0xCu);
        }
      }

      if (!v7) {
        goto LABEL_31;
      }
    }
    else
    {
      _HKInitializeLogging();
      os_log_t v22 = *v14;
      if (os_log_type_enabled(*v14, OS_LOG_TYPE_DEFAULT))
      {
        if (v7) {
          os_log_t v23 = (void *)*((void *)v7 + 2);
        }
        else {
          os_log_t v23 = 0;
        }
        id v24 = v23;
        id v25 = v22;
        id v26 = [v24 UUID];
        *(_DWORD *)buf = 138543362;
        id v42 = v26;
        _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[routes] v2 route has 0 locations for workout %{public}@, deleting it", buf, 0xCu);
      }
      -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:]((uint64_t)a1, v7);
      os_log_t v19 = 0;
      if (!v7) {
        goto LABEL_31;
      }
    }
    __int16 v27 = (void *)*((void *)v7 + 5);
    if (v27)
    {
      if (v19)
      {
        v40 = v19;
        os_log_t v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v40 count:1];
        __int16 v27 = (void *)*((void *)v7 + 5);
      }
      else
      {
        os_log_t v28 = 0;
      }
      id v29 = v27;
      v29[2](v29, v28, *((void *)v7 + 7), v8);
    }
LABEL_31:
    -[HDWorkoutLocationSmoother _finishSmoothingSampleWithTask:]((uint64_t)a1, v7);

    goto LABEL_32;
  }
  _HKInitializeLogging();
  id v9 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    if (v7) {
      __int16 v10 = (void *)*((void *)v7 + 2);
    }
    else {
      __int16 v10 = 0;
    }
    id v11 = v10;
    id v12 = v9;
    __int16 v13 = [v11 UUID];
    *(_DWORD *)buf = 138543618;
    id v42 = v13;
    __int16 v43 = 2112;
    uint64_t v44 = (uint64_t)v8;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "[routes] Smoothing did fail for workout %{public}@ with error: %@", buf, 0x16u);
  }
  if (v7) {
    ++*((void *)v7 + 7);
  }
  -[HDWorkoutLocationSmoother _queue_scheduleSmoothingTimeoutTimerForTask:](a1, v7);
  -[HDWorkoutLocationSmoother _queue_startSmoothingTask:]((uint64_t)a1, v7);
LABEL_32:
}

- (void)_queue_deleteRoutesForTasks:(uint64_t)a1
{
  v41[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v25 = v3;
  if (v3) {
    BOOL v4 = (void *)*((void *)v3 + 3);
  }
  else {
    BOOL v4 = 0;
  }
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    location = (id *)(a1 + 24);
    uint64_t v28 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v30 != v28) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(id *)(*((void *)&v29 + 1) + 8 * i);
        id v9 = objc_alloc_init(HDDataDeletionConfiguration);
        [(HDDataDeletionConfiguration *)v9 setNotifyObservers:0];
        id WeakRetained = objc_loadWeakRetained(location);
        id v11 = [WeakRetained dataManager];
        id v12 = [v8 UUID];
        v41[0] = v12;
        __int16 v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v41 count:1];
        id v33 = 0;
        char v14 = [v11 deleteObjectsWithUUIDCollection:v13 configuration:v9 error:&v33];
        id v15 = v33;

        id v16 = 0;
        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          id v17 = (void *)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            os_log_t v22 = v17;
            os_log_t v23 = [v8 UUID];
            uint64_t v24 = [v8 count];
            *(_DWORD *)buf = 138543874;
            id v36 = v23;
            __int16 v37 = 2048;
            uint64_t v38 = v24;
            __int16 v39 = 2114;
            id v40 = v15;
            _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "[routes] Error deleting route sample %{public}@ with %lu location(s): %{public}@", buf, 0x20u);
          }
          id v18 = v15;
          id v16 = v18;
          if (v18) {
            id v19 = v18;
          }
        }
        id v20 = v16;
        if ((v14 & 1) == 0)
        {
          _HKInitializeLogging();
          id v21 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            id v36 = v20;
            _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[routes] An error occurred deleting old route series %{public}@", buf, 0xCu);
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v6);
  }
}

- (void)_finishSmoothingSampleWithTask:(uint64_t)a1
{
  id v3 = a2;
  BOOL v4 = *(NSObject **)(a1 + 16);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __60__HDWorkoutLocationSmoother__finishSmoothingSampleWithTask___block_invoke;
  v6[3] = &unk_1E62F31C0;
  v6[4] = a1;
  id v5 = v3;
  id v7 = v5;
  dispatch_async(v4, v6);
}

void __52__HDWorkoutLocationSmoother__queue_smoothNextSample__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FB8];
  uint64_t v6 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[routes] Successfully synced smoothed route", (uint8_t *)&v7, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    int v7 = 138543362;
    id v8 = v4;
    _os_log_error_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_ERROR, "[routes] Failed to sync smoothed workout route with error: %{public}@", (uint8_t *)&v7, 0xCu);
  }
}

void __52__HDWorkoutLocationSmoother__queue_smoothNextSample__block_invoke_350(uint64_t a1, char a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    _HKInitializeLogging();
    id v5 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v6 = v5;
      int v7 = [v4 localizedDescription];
      int v8 = 138543362;
      uint64_t v9 = v7;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "Failed to cloud sync after route smoothing: %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)_queue_scheduleSmoothingTimeoutTimerForTask:(dispatch_queue_t *)a1
{
  id v3 = a2;
  -[HDWorkoutLocationSmoother _queue_cancelTimeout]((uint64_t)a1);
  dispatch_source_t v4 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, a1[2]);
  dispatch_queue_t v5 = a1[6];
  a1[6] = v4;

  objc_initWeak(&location, a1);
  uint64_t v6 = a1[6];
  if (v3) {
    int64_t v7 = (uint64_t)(v3[8] * 1000000000.0);
  }
  else {
    int64_t v7 = 0;
  }
  dispatch_time_t v8 = dispatch_time(0, v7);
  dispatch_source_set_timer(v6, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
  uint64_t v9 = a1[6];
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __73__HDWorkoutLocationSmoother__queue_scheduleSmoothingTimeoutTimerForTask___block_invoke;
  handler[3] = &unk_1E62F74E0;
  uint64_t v10 = v3;
  id v12 = v10;
  objc_copyWeak(&v13, &location);
  dispatch_source_set_event_handler(v9, handler);
  dispatch_resume(a1[6]);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&location);
}

- (void)_queue_startSmoothingTask:(uint64_t)a1
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v43 = a1;
  __int16 v45 = v3;
  if (!*(void *)(a1 + 8))
  {
    id v4 = objc_alloc_init(MEMORY[0x1E4F1E628]);
    dispatch_queue_t v5 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v4;

    id v3 = v45;
  }
  if (v3) {
    uint64_t v6 = (void *)v3[2];
  }
  else {
    uint64_t v6 = 0;
  }
  BOOL v7 = v3 == 0;
  dispatch_time_t v8 = [v6 metadata];
  id v42 = [v8 objectForKeyedSubscript:*MEMORY[0x1E4F2BC20]];

  char v41 = [v42 BOOLValue];
  group = dispatch_group_create();
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = __Block_byref_object_copy__72;
  v60[4] = __Block_byref_object_dispose__72;
  id v61 = 0;
  if (v7) {
    uint64_t v9 = 0;
  }
  else {
    uint64_t v9 = (void *)v45[2];
  }
  id v46 = v9;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = [v46 metadata];
  uint64_t v12 = *MEMORY[0x1E4F2BC30];
  uint64_t v44 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F2BC30]];

  if (v44)
  {
    id v13 = [v46 startDate];
    int v14 = objc_msgSend(v13, "hk_isBeforeDate:", v44);

    if (v14)
    {
      id v15 = objc_alloc(MEMORY[0x1E4F28C18]);
      id v16 = [v46 startDate];
      id v17 = (void *)[v15 initWithStartDate:v16 endDate:v44];

      [v10 addObject:v17];
    }
  }
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v18 = [v46 workoutEvents];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v63;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v63 != v20) {
          objc_enumerationMutation(v18);
        }
        os_log_t v22 = *(void **)(*((void *)&v62 + 1) + 8 * i);
        os_log_t v23 = [v22 metadata];
        uint64_t v24 = [v23 objectForKeyedSubscript:v12];

        if (v24)
        {
          id v25 = [v22 dateInterval];
          id v26 = [v25 startDate];

          if (objc_msgSend(v26, "hk_isBeforeDate:", v24))
          {
            __int16 v27 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v26 endDate:v24];
            [v10 addObject:v27];
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v19);
  }

  id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = v45;
  if (v45) {
    long long v29 = (void *)v45[2];
  }
  id v30 = v29;
  long long v31 = [v30 workoutActivities];

  dispatch_group_enter(group);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke;
  v51[3] = &unk_1E62FD3B0;
  id v32 = v31;
  id v52 = v32;
  uint64_t v53 = v43;
  id v33 = v45;
  id v54 = v33;
  v58 = v60;
  id v34 = v10;
  id v55 = v34;
  int v35 = group;
  v56 = v35;
  char v59 = v41;
  id v36 = v28;
  id v57 = v36;
  [v32 enumerateObjectsUsingBlock:v51];
  dispatch_group_leave(v35);
  __int16 v37 = *(NSObject **)(v43 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_4;
  block[3] = &unk_1E62F90E0;
  v50 = v60;
  block[4] = v43;
  uint64_t v38 = v33;
  id v48 = v38;
  id v49 = v36;
  id v39 = v36;
  dispatch_group_notify(v35, v37, block);

  _Block_object_dispose(v60, 8);
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  _HKInitializeLogging();
  uint64_t v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v74 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "[routes] Smoothing route for activity %@", buf, 0xCu);
  }
  BOOL v7 = [v5 workoutConfiguration];
  uint64_t v8 = [v7 activityType];

  if (a3)
  {
    uint64_t v9 = [v5 startDate];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if ([*(id *)(a1 + 32) count] - 1 <= a3)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [v5 endDate];
  }
  uint64_t v12 = *(void *)(a1 + 40);
  id v11 = *(void **)(a1 + 48);
  if (v11) {
    id v11 = (void *)v11[3];
  }
  id v63 = 0;
  id v13 = v11;
  id v14 = v9;
  id v15 = v10;
  uint64_t v55 = v8;
  if (v12)
  {
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    uint64_t v16 = [v13 countByEnumeratingWithState:&v69 objects:buf count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      unint64_t v18 = 0;
      uint64_t v19 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v70 != v19) {
            objc_enumerationMutation(v13);
          }
          v18 += [*(id *)(*((void *)&v69 + 1) + 8 * i) count];
        }
        uint64_t v17 = [v13 countByEnumeratingWithState:&v69 objects:buf count:16];
      }
      while (v17);
    }
    else
    {
      unint64_t v18 = 0;
    }
    id v21 = &off_1BD324000;
    if (v14)
    {
      if (v15)
      {
        [v15 timeIntervalSinceDate:v14];
        if (v22 > 0.0 && v22 < (double)v18) {
          unint64_t v18 = vcvtad_u64_f64(v22);
        }
      }
    }
    os_log_t v23 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    char v24 = objc_msgSend(v23, "hk_BOOLForKey:defaultValue:", @"HDLocationSmootherSmoothWithOverMaxRouteLength", 0);

    if (v18 < 0x8CA1 || (v24 & 1) != 0)
    {
      id v26 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v18];
      id WeakRetained = objc_loadWeakRetained((id *)(v12 + 24));
      id v28 = [WeakRetained database];
      v64[0] = MEMORY[0x1E4F143A8];
      v64[1] = 3221225472;
      v64[2] = __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke;
      v64[3] = &unk_1E62FB0D0;
      long long v65 = v13;
      id v66 = v14;
      id v67 = v15;
      id v68 = v26;
      id v29 = v26;
      BOOL v30 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v28 error:&v63 block:v64];

      if (v30) {
        long long v31 = v29;
      }
      else {
        long long v31 = 0;
      }
      id v25 = v31;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "hk_assignError:code:format:", &v63, 130, @"Cannot smooth route with estimated length %ld", v18);
      id v25 = 0;
    }
  }
  else
  {
    id v25 = 0;
    id v21 = &off_1BD324000;
  }

  id v32 = v63;
  if (v25)
  {
    id v33 = objc_alloc(MEMORY[0x1E4F28C18]);
    id v34 = [v5 startDate];
    int v35 = [v5 endDate];
    id v36 = (void *)[v33 initWithStartDate:v34 endDate:v35];

    __int16 v37 = *(void **)(a1 + 56);
    v61[0] = MEMORY[0x1E4F143A8];
    uint64_t v38 = *((void *)v21 + 454);
    v61[1] = v38;
    v61[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_357;
    v61[3] = &unk_1E62FD338;
    id v39 = v36;
    id v62 = v39;
    id v40 = objc_msgSend(v37, "hk_map:", v61);
    if ([v25 count] || objc_msgSend(v40, "count"))
    {
      dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
      uint64_t v41 = *(void *)(a1 + 40);
      id v42 = *(void **)(v41 + 8);
      uint64_t v43 = *(unsigned __int8 *)(a1 + 88);
      v56[0] = MEMORY[0x1E4F143A8];
      v56[1] = v38;
      v56[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_2;
      v56[3] = &unk_1E62FD388;
      uint64_t v44 = *(void *)(a1 + 80);
      v56[4] = v41;
      uint64_t v60 = v44;
      id v57 = *(id *)(a1 + 48);
      id v58 = *(id *)(a1 + 72);
      id v59 = *(id *)(a1 + 64);
      [v42 smoothLocations:v25 workoutActivityType:v55 shouldReconstructRoute:v43 timeIntervalsThatNeedPopulated:v40 handler:v56];
    }
  }
  else
  {
    uint64_t v45 = *(void *)(*(void *)(a1 + 80) + 8);
    id v48 = *(void **)(v45 + 40);
    id v46 = (id *)(v45 + 40);
    __int16 v47 = v48;
    if (v48) {
      id v49 = v47;
    }
    else {
      id v49 = v32;
    }
    objc_storeStrong(v46, v49);
    _HKInitializeLogging();
    v50 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      v51 = *(void **)(a1 + 48);
      if (v51) {
        v51 = (void *)v51[2];
      }
      id v52 = v51;
      uint64_t v53 = v50;
      id v54 = [v52 UUID];
      *(_DWORD *)buf = 138412546;
      id v74 = v54;
      __int16 v75 = 2114;
      id v76 = v32;
      _os_log_impl(&dword_1BCB7D000, v53, OS_LOG_TYPE_DEFAULT, "[routes] Failed to fetch locations for route with UUID=%@: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_357(uint64_t a1, void *a2)
{
  return [a2 intersectionWithDateInterval:*(void *)(a1 + 32)];
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(NSObject **)(v7 + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_3;
  block[3] = &unk_1E62FD360;
  uint64_t v9 = *(void *)(a1 + 64);
  id v13 = v6;
  uint64_t v14 = v7;
  uint64_t v19 = v9;
  id v15 = v5;
  id v16 = *(id *)(a1 + 40);
  id v17 = *(id *)(a1 + 48);
  id v18 = *(id *)(a1 + 56);
  id v10 = v5;
  id v11 = v6;
  dispatch_async(v8, block);
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 80) + 8);
  id v5 = *(void **)(v2 + 40);
  id v3 = (id *)(v2 + 40);
  id v4 = v5;
  if (!v5) {
    id v4 = *(void **)(a1 + 32);
  }
  objc_storeStrong(v3, v4);
  if (!*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 40))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    id v6 = *(void **)(a1 + 48);
    uint64_t v8 = *(void **)(a1 + 56);
    id v24 = 0;
    id v9 = v6;
    id v10 = v8;
    if (v7)
    {
      uint64_t v29 = 0;
      BOOL v30 = &v29;
      uint64_t v31 = 0x3032000000;
      id v32 = __Block_byref_object_copy__72;
      id v33 = __Block_byref_object_dispose__72;
      id v34 = 0;
      id v11 = objc_alloc_init(HDMutableDatabaseTransactionContext);
      [(HDMutableDatabaseTransactionContext *)v11 setCacheScope:1];
      id WeakRetained = objc_loadWeakRetained((id *)(v7 + 24));
      id v13 = [WeakRetained database];
      uint64_t v14 = +[HDDatabaseTransactionContext contextForWritingProtectedData];
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __68__HDWorkoutLocationSmoother__queue_saveLocations_forTask_saveError___block_invoke;
      v25[3] = &unk_1E62FD3D8;
      id v28 = &v29;
      v25[4] = v7;
      id v26 = v10;
      id v27 = v9;
      int v15 = [v13 performTransactionWithContext:v14 error:&v24 block:v25 inaccessibilityHandler:0];

      if (v15) {
        id v16 = (void *)v30[5];
      }
      else {
        id v16 = 0;
      }
      id v17 = v16;

      _Block_object_dispose(&v29, 8);
    }
    else
    {
      id v17 = 0;
    }

    id v18 = v24;
    if (v17)
    {
      [*(id *)(a1 + 64) addObject:v17];
    }
    else
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 80) + 8);
      double v22 = *(void **)(v19 + 40);
      uint64_t v20 = (id *)(v19 + 40);
      id v21 = v22;
      if (v22) {
        os_log_t v23 = v21;
      }
      else {
        os_log_t v23 = v18;
      }
      objc_storeStrong(v20, v23);
      *(unsigned char *)(*(void *)(a1 + 40) + 56) = 1;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 72));
}

void __55__HDWorkoutLocationSmoother__queue_startSmoothingTask___block_invoke_4(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(*(void *)(a1 + 56) + 8) + 40);
  uint64_t v3 = *(void *)(a1 + 32);
  if (v2) {
    id v4 = 0;
  }
  else {
    id v4 = *(void **)(a1 + 48);
  }
  -[HDWorkoutLocationSmoother _queue_locationManagerDidSmoothRoutes:forTask:error:](v3, v4, *(void **)(a1 + 40), v2);
}

- (id)_queue_createNewSeriesFromTask:(void *)a3 locations:(void *)a4 error:
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = a1 + 3;
    id WeakRetained = objc_loadWeakRetained(a1 + 3);
    id v11 = [WeakRetained sourceManager];
    v78 = a4;
    if (v7) {
      uint64_t v12 = (void *)v7[2];
    }
    else {
      uint64_t v12 = 0;
    }
    id v13 = v12;
    uint64_t v14 = [v13 _source];
    int v15 = [v14 bundleIdentifier];
    id v83 = 0;
    id v16 = [v11 localSourceForBundleIdentifier:v15 copyIfNecessary:1 error:&v83];
    id v79 = v83;

    if (v16)
    {
      id v17 = objc_alloc(MEMORY[0x1E4F1CA60]);
      v84[0] = *MEMORY[0x1E4F2A1F0];
      id v18 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v19 = [v18 UUIDString];
      v85[0] = v19;
      v84[1] = *MEMORY[0x1E4F2A1F8];
      uint64_t v20 = [NSNumber numberWithInteger:*MEMORY[0x1E4F2BFC8]];
      v85[1] = v20;
      id v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v85 forKeys:v84 count:2];
      double v22 = (void *)[v17 initWithDictionary:v21];

      uint64_t v76 = (uint64_t)a1;
      uint64_t v77 = v7;
      if (v7) {
        uint64_t v7 = (void *)v7[3];
      }
      id v23 = v22;
      __int16 v75 = v16;
      id v24 = v16;
      id v74 = v8;
      id v25 = v8;
      id v26 = v7;
      id v27 = [MEMORY[0x1E4F2B7A0] _workoutRouteWithDevice:0 metadata:0];
      id v28 = objc_loadWeakRetained(v9);
      uint64_t v29 = [v28 database];
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&uint8_t buf[16] = __97__HDWorkoutLocationSmoother__createWorkoutRouteWithMetadata_sourceEntity_locations_routes_error___block_invoke;
      v87 = &unk_1E62F99E8;
      uint64_t v88 = v76;
      id v89 = v27;
      id v30 = v24;
      id v90 = v30;
      id v31 = v25;
      id v91 = v31;
      id v32 = v26;
      id v92 = v32;
      id v33 = v23;
      id v93 = v33;
      a1 = v27;
      LODWORD(v26) = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v29 error:v78 block:buf];

      [a1 _setMetadata:v33];
      if (v26) {
        id v34 = a1;
      }
      else {
        id v34 = 0;
      }
      int v35 = v34;

      if (v35)
      {
        id v36 = objc_alloc_init(MEMORY[0x1E4F1CA58]);
        __int16 v37 = [v35 UUID];
        objc_msgSend(v36, "hk_appendBytesWithUUID:", v37);

        uint64_t v38 = v77;
        if (v77) {
          uint64_t v38 = (void *)v77[2];
        }
        id v39 = v38;
        id v40 = [v39 UUID];
        id v41 = objc_loadWeakRetained(v9);
        id v82 = v79;
        v73 = v36;
        BOOL v42 = +[HDAssociationEntity insertEntriesWithAssociationUUID:v40 objectUUIDsData:v36 type:0 destinationSubObjectReference:0 profile:v41 error:&v82];
        id v43 = v82;

        if (v42)
        {
          uint64_t v44 = [v35 UUID];
          id v45 = objc_loadWeakRetained(v9);
          id v81 = v43;
          id v46 = +[HDAssociationEntity associationUUIDsForObjectUUID:v44 subObjectReference:0 excludeDeleted:0 profile:v45 error:&v81];
          id v47 = v81;

          _HKInitializeLogging();
          id v48 = (id *)MEMORY[0x1E4F29FB8];
          id v49 = *MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v46;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v47;
            _os_log_impl(&dword_1BCB7D000, v49, OS_LOG_TYPE_DEFAULT, "[routes] Queried associations table after route insert with parent objects: %{public}@, error: %@", buf, 0x16u);
          }
          id v80 = v47;
          _HKInitializeLogging();
          v50 = *v48;
          uint64_t v7 = v77;
          id v16 = v75;
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = [v35 UUID];
            if (v77) {
              id v52 = (void *)v77[2];
            }
            else {
              id v52 = 0;
            }
            id v53 = v52;
            id v54 = [v53 UUID];
            *(_DWORD *)buf = 138543618;
            *(void *)&uint8_t buf[4] = v51;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v54;
            _os_log_impl(&dword_1BCB7D000, v50, OS_LOG_TYPE_DEFAULT, "[routes] Successfully smoothed route -> %{public}@ for workout %{public}@", buf, 0x16u);

            uint64_t v7 = v77;
            id v16 = v75;
          }

          _HKInitializeLogging();
          id v55 = *v48;
          if (os_log_type_enabled((os_log_t)*v48, OS_LOG_TYPE_DEFAULT))
          {
            if (v7)
            {
              v56 = v7;
              id v57 = (void *)v7[2];
            }
            else
            {
              v56 = 0;
              id v57 = 0;
            }
            id v58 = v57;
            id v59 = v55;
            uint64_t v60 = [v58 UUID];
            id v61 = [v60 UUIDString];
            *(_DWORD *)buf = 138543362;
            *(void *)&uint8_t buf[4] = v61;
            _os_log_impl(&dword_1BCB7D000, v59, OS_LOG_TYPE_DEFAULT, "[routes] Deleting old routes for workout %{public}@", buf, 0xCu);

            uint64_t v7 = v56;
          }
          -[HDWorkoutLocationSmoother _queue_deleteRoutesForTasks:](v76, v7);
          id v62 = v35;
          id v63 = v80;
        }
        else
        {
          _HKInitializeLogging();
          id v66 = (id)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR))
          {
            long long v69 = [v35 UUID];
            long long v70 = v77;
            if (v77) {
              long long v70 = (void *)v77[2];
            }
            id v71 = v70;
            long long v72 = [v71 UUID];
            *(_DWORD *)buf = 138543874;
            *(void *)&uint8_t buf[4] = v69;
            *(_WORD *)&buf[12] = 2114;
            *(void *)&buf[14] = v72;
            *(_WORD *)&buf[22] = 2114;
            v87 = v43;
            _os_log_error_impl(&dword_1BCB7D000, v66, OS_LOG_TYPE_ERROR, "[routes] Failed to associate route %{public}@ with workout %{public}@ %{public}@", buf, 0x20u);
          }
          id v67 = v43;
          id v46 = v67;
          uint64_t v7 = v77;
          if (v67)
          {
            id v16 = v75;
            if (v78)
            {
              id v46 = v67;
              a1 = 0;
              void *v78 = v46;
            }
            else
            {
              _HKLogDroppedError();
              a1 = 0;
            }
            id v63 = v46;
          }
          else
          {
            id v63 = 0;
            a1 = 0;
            id v16 = v75;
          }
        }
      }
      else
      {
        a1 = 0;
        uint64_t v7 = v77;
        id v16 = v75;
        id v63 = v79;
      }

      id v8 = v74;
    }
    else
    {
      _HKInitializeLogging();
      long long v64 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        *(void *)&uint8_t buf[4] = v79;
        _os_log_error_impl(&dword_1BCB7D000, v64, OS_LOG_TYPE_ERROR, "[routes] Could not fetch local device source. %{public}@", buf, 0xCu);
      }
      id v65 = v79;
      id v33 = v65;
      if (v65)
      {
        if (v78)
        {
          id v33 = v65;
          a1 = 0;
          void *v78 = v33;
        }
        else
        {
          _HKLogDroppedError();
          a1 = 0;
        }
        id v63 = v33;
      }
      else
      {
        id v63 = 0;
        a1 = 0;
      }
    }
  }

  return a1;
}

BOOL __68__HDWorkoutLocationSmoother__queue_saveLocations_forTask_saveError___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = -[HDWorkoutLocationSmoother _queue_createNewSeriesFromTask:locations:error:](*(id **)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 56) + 8);
  id v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  return *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) != 0;
}

void __60__HDWorkoutLocationSmoother__finishSmoothingSampleWithTask___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 40);
  *(void *)(v2 + 40) = 0;

  -[HDWorkoutLocationSmoother _queue_smoothNextSample](*(void *)(a1 + 32));
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v5 = *(void **)(v4 + 48);
  }
  else {
    uint64_t v5 = 0;
  }
  [v5 invalidate];
  uint64_t v6 = *(void *)(a1 + 40);

  -[HDSmoothingTask setTransaction:](v6, 0);
}

uint64_t __97__HDWorkoutLocationSmoother__createWorkoutRouteWithMetadata_sourceEntity_locations_routes_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  v61[1] = *MEMORY[0x1E4F143B8];
  id v47 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v6 = [WeakRetained dataManager];
  v61[0] = *(void *)(a1 + 40);
  uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v61 count:1];
  uint64_t v8 = *(void *)(a1 + 48);
  id v55 = 0;
  char v9 = [v6 insertDataObjects:v7 sourceEntity:v8 deviceEntity:0 sourceVersion:0 creationDate:&v55 error:CFAbsoluteTimeGetCurrent()];
  id v10 = v55;

  if ((v9 & 1) == 0)
  {
    _HKInitializeLogging();
    uint64_t v20 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      id v58 = v10;
      _os_log_error_impl(&dword_1BCB7D000, v20, OS_LOG_TYPE_ERROR, "[routes] Error occurred while saving new series sample: %{public}@", buf, 0xCu);
    }
    id v17 = v10;
    if (v17)
    {
      if (!a3) {
        goto LABEL_8;
      }
LABEL_13:
      id v17 = v17;
      uint64_t v18 = 0;
      *a3 = v17;
      id v19 = v17;
      goto LABEL_41;
    }
    goto LABEL_14;
  }
  uint64_t v11 = *(void *)(a1 + 56);
  if (!v11)
  {
    id v46 = a3;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v17 = *(id *)(a1 + 64);
    uint64_t v21 = [v17 countByEnumeratingWithState:&v50 objects:v56 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v51;
      while (2)
      {
        uint64_t v24 = 0;
        id v25 = v10;
        do
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v17);
          }
          id v26 = objc_msgSend(*(id *)(*((void *)&v50 + 1) + 8 * v24), "UUID", v46);
          id v27 = [*(id *)(a1 + 40) UUID];
          id v49 = v25;
          BOOL v28 = +[HDLocationSeriesSampleEntity copyLocationDataFromSeriesIdentifier:v26 toSeriesIdentifier:v27 transaction:v47 error:&v49];
          id v10 = v49;

          if (!v28)
          {
            _HKInitializeLogging();
            id v34 = (void *)*MEMORY[0x1E4F29FB8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
            {
              id v40 = *(void **)(a1 + 40);
              id v41 = v34;
              BOOL v42 = [v40 UUID];
              *(_DWORD *)buf = 138543618;
              id v58 = v42;
              __int16 v59 = 2114;
              id v60 = v10;
              _os_log_error_impl(&dword_1BCB7D000, v41, OS_LOG_TYPE_ERROR, "[routes] Couldn't copy location data for series sample %{public}@: %{public}@", buf, 0x16u);
            }
            id v19 = v10;
            if (v19)
            {
              if (v46) {
                void *v46 = v19;
              }
              else {
                _HKLogDroppedError();
              }
            }

            goto LABEL_40;
          }
          ++v24;
          id v25 = v10;
        }
        while (v22 != v24);
        uint64_t v22 = [v17 countByEnumeratingWithState:&v50 objects:v56 count:16];
        if (v22) {
          continue;
        }
        break;
      }
    }

    id v15 = v10;
    a3 = v46;
    goto LABEL_24;
  }
  uint64_t v12 = [*(id *)(a1 + 40) UUID];
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  id v54 = v10;
  BOOL v14 = +[HDLocationSeriesSampleEntity insertLocationData:v11 seriesIdentifier:v12 profile:v13 error:&v54];
  id v15 = v54;

  if (v14)
  {
LABEL_24:
    uint64_t v29 = objc_msgSend(*(id *)(a1 + 40), "sampleType", v46);
    id v30 = objc_msgSend((id)objc_msgSend(v29, "dataObjectClass"), "hd_dataEntityClass");

    id v31 = [*(id *)(a1 + 40) UUID];
    uint64_t v32 = *(void *)(a1 + 72);
    id v33 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
    id v48 = v15;
    id v17 = [v30 freezeSeriesWithIdentifier:v31 metadata:v32 profile:v33 error:&v48];
    id v19 = v48;

    if (v17)
    {
      uint64_t v18 = 1;
      goto LABEL_41;
    }
    _HKInitializeLogging();
    int v35 = (void *)*MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
    {
      id v43 = *(void **)(a1 + 40);
      uint64_t v44 = v35;
      id v45 = [v43 UUID];
      *(_DWORD *)buf = 138543618;
      id v58 = v45;
      __int16 v59 = 2114;
      id v60 = v19;
      _os_log_error_impl(&dword_1BCB7D000, v44, OS_LOG_TYPE_ERROR, "[routes] Couldn't freeze series %{public}@: %{public}@", buf, 0x16u);
    }
    id v19 = v19;
    if (v19)
    {
      if (a3) {
        *a3 = v19;
      }
      else {
        _HKLogDroppedError();
      }
    }

    id v17 = 0;
LABEL_40:
    uint64_t v18 = 0;
    goto LABEL_41;
  }
  _HKInitializeLogging();
  id v16 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    __int16 v37 = *(void **)(a1 + 40);
    uint64_t v38 = v16;
    id v39 = [v37 UUID];
    *(_DWORD *)buf = 138543618;
    id v58 = v39;
    __int16 v59 = 2114;
    id v60 = v15;
    _os_log_error_impl(&dword_1BCB7D000, v38, OS_LOG_TYPE_ERROR, "[routes] Couldn't insert location data for series sample %{public}@: %{public}@", buf, 0x16u);
  }
  id v17 = v15;
  if (!v17)
  {
LABEL_14:
    id v19 = 0;
    goto LABEL_40;
  }
  if (a3) {
    goto LABEL_13;
  }
LABEL_8:
  _HKLogDroppedError();
  uint64_t v18 = 0;
  id v19 = v17;
LABEL_41:

  return v18;
}

uint64_t __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v31 = a2;
  uint64_t v5 = [v31 databaseForEntityClass:objc_opt_class()];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v6 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    BOOL v28 = a3;
    uint64_t v8 = *(void *)v37;
    id v27 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v37 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v11 = [v10 UUID];
        uint64_t v12 = HDDataEntityPredicateForDataUUID();

        id v35 = 0;
        id v13 = +[HDDataEntity anyInDatabase:v5 predicate:v12 error:&v35];
        id v14 = v35;
        id v15 = v14;
        if (v13)
        {
          uint64_t v16 = *(void *)(a1 + 40);
          uint64_t v17 = *(void *)(a1 + 48);
          id v34 = 0;
          v32[0] = MEMORY[0x1E4F143A8];
          v32[1] = 3221225472;
          v32[2] = __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke_2;
          v32[3] = &unk_1E62FD400;
          id v33 = *(id *)(a1 + 56);
          LOBYTE(v16) = [v13 enumerateLocationDataInTransaction:v31 startDate:v16 endDate:v17 error:&v34 handler:v32];
          id v18 = v34;
          id v19 = v18;
          if (v16)
          {
            int v20 = 0;
          }
          else
          {
            id v21 = v18;
            uint64_t v22 = v21;
            BOOL v30 = v21 == 0;
            if (v21)
            {
              if (v28) {
                *BOOL v28 = v21;
              }
              else {
                _HKLogDroppedError();
              }
              uint64_t v5 = v27;
            }

            int v20 = 1;
          }
        }
        else if (v14)
        {
          if (v28)
          {
            BOOL v30 = 0;
            *BOOL v28 = v14;
          }
          else
          {
            _HKLogDroppedError();
            BOOL v30 = 0;
          }
          int v20 = 1;
          uint64_t v5 = v27;
        }
        else
        {
          uint64_t v23 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v24 = [v10 UUID];
          objc_msgSend(v23, "hk_assignError:code:format:", v28, 100, @"Did not find the expected route sample with UUID=%@", v24);

          BOOL v30 = 0;
          int v20 = 1;
        }

        if (v20)
        {
          char v25 = v30;
          goto LABEL_27;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  char v25 = 1;
LABEL_27:

  return v25 & 1;
}

uint64_t __73__HDWorkoutLocationSmoother__locationsForRoutes_startDate_endDate_error___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return 1;
}

void __73__HDWorkoutLocationSmoother__queue_scheduleSmoothingTimeoutTimerForTask___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  uint64_t v2 = (id)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 32);
    if (v3) {
      uint64_t v3 = (void *)v3[2];
    }
    uint64_t v4 = v3;
    uint64_t v5 = [v4 UUID];
    uint64_t v6 = (void *)v5;
    uint64_t v7 = *(void *)(a1 + 32);
    if (v7) {
      uint64_t v7 = *(void *)(v7 + 64);
    }
    int v11 = 138543618;
    uint64_t v12 = v5;
    __int16 v13 = 2048;
    uint64_t v14 = v7;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "[routes] Smoothing did timeout for workout %{public}@ after %f sec", (uint8_t *)&v11, 0x16u);
  }
  uint64_t v8 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 103, @"Smoothing task timed out");
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    *(unsigned char *)(v9 + 8) = 1;
  }
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  -[HDWorkoutLocationSmoother _queue_smoothingDidFailForTask:error:shouldRetry:](WeakRetained, *(void **)(a1 + 32), v8, 1);
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__HDWorkoutLocationSmoother_samplesAdded_anchor___block_invoke;
  block[3] = &unk_1E62F3208;
  void block[4] = self;
  dispatch_sync(queue, block);
}

void __49__HDWorkoutLocationSmoother_samplesAdded_anchor___block_invoke(uint64_t a1)
{
  _HKInitializeLogging();
  uint64_t v2 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_DEFAULT, "Workout Sample saved. Attempting to smooth all unsmoothed location series samples.", v9, 2u);
  }
  uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "unitTest_wilTriggerSmoothing");
  uint64_t v4 = (void *)v3;
  if (v3) {
    (*(void (**)(uint64_t))(v3 + 16))(v3);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 24));
  uint64_t v6 = [WeakRetained database];
  int v7 = [v6 isProtectedDataAvailable];

  uint64_t v8 = *(void *)(a1 + 32);
  if (v7) {
    -[HDWorkoutLocationSmoother _queue_smoothAllUnsmoothedLocationSeries](v8);
  }
  else {
    *(unsigned char *)(v8 + 56) = 1;
  }
}

- (void)smoothRouteWithWorkoutUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = HDDataEntityPredicateForDataUUID();
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v10 = [WeakRetained database];
  id v30 = 0;
  int v11 = +[HDHealthEntity anyWithPredicate:v8 healthDatabase:v10 error:&v30];
  id v12 = v30;

  if (v11)
  {
    __int16 v13 = [MEMORY[0x1E4F2B448] dataTypeWithCode:102];
    id v14 = objc_loadWeakRetained((id *)&self->_profile);
    uint64_t v15 = HDAssociationEntityPredicateForChildObjectsAssociatedWithParentObject([v11 persistentID]);
    id v29 = v12;
    uint64_t v16 = +[HDSampleEntity samplesWithType:v13 profile:v14 encodingOptions:0 predicate:v15 limit:0 anchor:0 error:&v29];
    id v17 = v29;

    if (v16)
    {
      id v18 = [v6 UUIDString];
      id v28 = v17;
      id v19 = -[HDWorkoutLocationSmoother _workoutWithUUIDString:error:]((id *)&self->super.isa, v18, (uint64_t *)&v28);
      id v20 = v28;

      if (v19)
      {
        queue = self->_queue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke;
        block[3] = &unk_1E62F2F48;
        id v24 = v16;
        id v22 = v19;
        id v25 = v22;
        id v26 = self;
        id v27 = v7;
        dispatch_sync(queue, block);
      }
      else
      {
        (*((void (**)(id, void, id))v7 + 2))(v7, 0, v20);
        id v22 = 0;
      }
    }
    else
    {
      id v20 = v17;
      id v22 = v20;
      if (!v20)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"Object not found");
        id v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      (*((void (**)(id, void, id))v7 + 2))(v7, 0, v22);
    }
  }
  else
  {
    id v20 = v12;
    __int16 v13 = v20;
    if (!v20)
    {
      __int16 v13 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 118, @"Object not found");
    }
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v13);
  }
}

void __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v19;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v19 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v18 + 1) + 8 * v6);
        uint64_t v8 = [HDSmoothingTask alloc];
        uint64_t v9 = *(void **)(a1 + 40);
        uint64_t v22 = v7;
        id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
        id v11 = -[HDSmoothingTask _initWithWorkout:routes:](v8, v9, v10);

        [*(id *)(*(void *)(a1 + 48) + 32) addObject:v11];
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v4);
  }

  if ([*(id *)(*(void *)(a1 + 48) + 32) count])
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke_2;
    v16[3] = &unk_1E62F2F20;
    id v17 = *(id *)(a1 + 56);
    [*(id *)(a1 + 48) setDidCompleteAllPendingSmoothingTasksHandler:v16];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 24));
    __int16 v13 = [WeakRetained database];
    int v14 = [v13 isProtectedDataAvailable];

    uint64_t v15 = *(void *)(a1 + 48);
    if (v14) {
      -[HDWorkoutLocationSmoother _queue_smoothNextSample](v15);
    }
    else {
      *(unsigned char *)(v15 + 56) = 1;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __67__HDWorkoutLocationSmoother_smoothRouteWithWorkoutUUID_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unitTest_smoothRouteSample:(id)a3 withSmoother:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__HDWorkoutLocationSmoother_unitTest_smoothRouteSample_withSmoother_completion___block_invoke;
  v15[3] = &unk_1E62F2F48;
  v15[4] = self;
  id v16 = v9;
  id v17 = v8;
  id v18 = v10;
  id v12 = v10;
  id v13 = v8;
  id v14 = v9;
  dispatch_async(queue, v15);
}

void __80__HDWorkoutLocationSmoother_unitTest_smoothRouteSample_withSmoother_completion___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 8), *(id *)(a1 + 40));
  _HKInitializeLogging();
  id v2 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void **)(a1 + 48);
    uint64_t v4 = v2;
    uint64_t v5 = [v3 UUID];
    *(_DWORD *)buf = 138412290;
    id v18 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "[routes] Will smooth sample %@", buf, 0xCu);
  }
  uint64_t v6 = [*(id *)(a1 + 48) metadata];
  uint64_t v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F2BBF0]];

  id v8 = *(id **)(a1 + 32);
  id v15 = 0;
  id v9 = -[HDWorkoutLocationSmoother _workoutWithUUIDString:error:](v8, v7, (uint64_t *)&v15);
  id v10 = v15;
  if (v9)
  {
    id v11 = [HDSmoothingTask alloc];
    uint64_t v16 = *(void *)(a1 + 48);
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v16 count:1];
    id v13 = -[HDSmoothingTask _initWithWorkout:routes:](v11, v9, v12);

    if (v13)
    {
      v13[8] = 0x3FC999999999999ALL;
      objc_setProperty_nonatomic_copy(v13, v14, *(id *)(a1 + 56), 40);
    }
    [*(id *)(*(void *)(a1 + 32) + 32) addObject:v13];
    -[HDWorkoutLocationSmoother _queue_smoothNextSample](*(void *)(a1 + 32));
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (id)didCompleteAllPendingSmoothingTasksHandler
{
  return self->_didCompleteAllPendingSmoothingTasksHandler;
}

- (void)setDidCompleteAllPendingSmoothingTasksHandler:(id)a3
{
}

- (id)unitTest_wilTriggerSmoothing
{
  return self->_unitTest_wilTriggerSmoothing;
}

- (void)setUnitTest_wilTriggerSmoothing:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_unitTest_wilTriggerSmoothing, 0);
  objc_storeStrong(&self->_didCompleteAllPendingSmoothingTasksHandler, 0);
  objc_storeStrong((id *)&self->_timeoutSource, 0);
  objc_storeStrong((id *)&self->_currentSmoothingTask, 0);
  objc_storeStrong((id *)&self->_pendingSmoothingTasks, 0);
  objc_destroyWeak((id *)&self->_profile);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_smoother, 0);
}

@end