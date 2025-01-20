@interface HDCoreMotionWorkoutInterface
- (CMWorkout)currentWorkout;
- (CMWorkoutManager)cmWorkoutManager;
- (HDCoreMotionWorkoutInterface)init;
- (dispatch_queue_t)_queue_coreMotionWorkoutManager;
- (id)_queue_cmWorkoutForConfiguration:(void *)a3 sessionUUID:(uint64_t)a4 error:;
- (id)takeCMWorkoutAssertionForOwnerIdentifier:(id)a3 sessionUUID:(id)a4 workoutConfiguration:(id)a5 activityConfigurations:(id)a6 enableWorkoutChangeDetection:(BOOL)a7;
- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4;
- (void)averageMETsForWorkoutSessionUUID:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)pauseWorkoutForWorkoutSessionUUID:(id)a3;
- (void)resumeWorkoutForWorkoutSessionUUID:(id)a3;
- (void)setCurrentActivity:(id)a3 isManualTransition:(BOOL)a4;
- (void)unitTest_addCoreMotionAssertionObserver:(id)a3;
- (void)unitTest_setCMWorkoutManager:(id)a3;
@end

@implementation HDCoreMotionWorkoutInterface

- (HDCoreMotionWorkoutInterface)init
{
  v8.receiver = self;
  v8.super_class = (Class)HDCoreMotionWorkoutInterface;
  v2 = [(HDCoreMotionWorkoutInterface *)&v8 init];
  if (v2)
  {
    uint64_t v3 = HKCreateSerialDispatchQueue();
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (HDAssertionManager *)objc_alloc_init(MEMORY[0x1E4F65CD0]);
    assertionManager = v2->_assertionManager;
    v2->_assertionManager = v5;

    [(HDAssertionManager *)v2->_assertionManager addObserver:v2 forAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierCoreMotion" queue:v2->_queue];
  }
  return v2;
}

- (CMWorkoutManager)cmWorkoutManager
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__207;
  v10 = __Block_byref_object_dispose__207;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__HDCoreMotionWorkoutInterface_cmWorkoutManager__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CMWorkoutManager *)v3;
}

void __48__HDCoreMotionWorkoutInterface_cmWorkoutManager__block_invoke(uint64_t a1)
{
  uint64_t v2 = -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager](*(dispatch_queue_t **)(a1 + 32));
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (dispatch_queue_t)_queue_coreMotionWorkoutManager
{
  if (a1)
  {
    uint64_t v2 = a1;
    dispatch_assert_queue_V2(a1[1]);
    if (!v2[2] && [MEMORY[0x1E4F222E8] isAvailable])
    {
      uint64_t v3 = objc_alloc_init(MEMORY[0x1E4F222E8]);
      dispatch_queue_t v4 = v2[2];
      v2[2] = v3;
    }
    a1 = v2[2];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (CMWorkout)currentWorkout
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__207;
  v10 = __Block_byref_object_dispose__207;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__HDCoreMotionWorkoutInterface_currentWorkout__block_invoke;
  v5[3] = &unk_1E62F3230;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (CMWorkout *)v3;
}

void __46__HDCoreMotionWorkoutInterface_currentWorkout__block_invoke(uint64_t a1)
{
}

- (void)dealloc
{
  [(HDAssertionManager *)self->_assertionManager removeObserver:self];
  v3.receiver = self;
  v3.super_class = (Class)HDCoreMotionWorkoutInterface;
  [(HDCoreMotionWorkoutInterface *)&v3 dealloc];
}

- (id)takeCMWorkoutAssertionForOwnerIdentifier:(id)a3 sessionUUID:(id)a4 workoutConfiguration:(id)a5 activityConfigurations:(id)a6 enableWorkoutChangeDetection:(BOOL)a7
{
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [_HDCoreMotionAssertion alloc];
  id v17 = v14;
  id v18 = v13;
  id v19 = v12;
  if (v16)
  {
    v30.receiver = v16;
    v30.super_class = (Class)_HDCoreMotionAssertion;
    v20 = [(HDCoreMotionWorkoutInterface *)&v30 initWithAssertionIdentifier:@"HDWorkoutSessionAssertionIdentifierCoreMotion" ownerIdentifier:v15];
    v16 = (_HDCoreMotionAssertion *)v20;
    if (v20)
    {
      objc_storeStrong((id *)&v20[1]._cmWorkoutMets, a4);
      objc_storeStrong((id *)&v16->_workoutConfiguration, a5);
      objc_storeStrong((id *)&v16->_activityConfigurations, a6);
      v16->_enableWorkoutChangeDetection = a7;
    }
  }

  v21 = [(HDAssertion *)v16 ownerIdentifier];
  appIdentifier = self->_appIdentifier;
  self->_appIdentifier = v21;

  if ([(HDAssertionManager *)self->_assertionManager takeAssertion:v16])
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __158__HDCoreMotionWorkoutInterface_takeCMWorkoutAssertionForOwnerIdentifier_sessionUUID_workoutConfiguration_activityConfigurations_enableWorkoutChangeDetection___block_invoke;
    block[3] = &unk_1E62F31C0;
    block[4] = self;
    v24 = v16;
    v29 = v24;
    dispatch_sync(queue, block);
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }

  return v25;
}

void __158__HDCoreMotionWorkoutInterface_takeCMWorkoutAssertionForOwnerIdentifier_sessionUUID_workoutConfiguration_activityConfigurations_enableWorkoutChangeDetection___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = (id *)*(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
    if (v2)
    {
      id v3 = v2[11];
      id v4 = v2[12];
    }
    else
    {
      id v3 = 0;
      id v4 = 0;
    }
    id v61 = 0;
    id v5 = v4;
    uint64_t v6 = -[HDCoreMotionWorkoutInterface _queue_cmWorkoutForConfiguration:sessionUUID:error:](v1, v3, v5, (uint64_t)&v61);
    id v7 = v61;
    if (v2)
    {
      objc_storeStrong(v2 + 13, v6);

      if (v2[13])
      {
        uint64_t v8 = (id *)(v1 + 40);
        if (!*(void *)(v1 + 40))
        {
          v10 = -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)v1);
          if (v10)
          {
            id v11 = v2[12];
            id v60 = 0;
            id v12 = v11;
            id v13 = v2;
            id v14 = v12;
            id v15 = v13;
            id v59 = v14;
            dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 8));
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (*((unsigned char *)v13 + 80) && [v13[14] count])
            {
              id v58 = v7;
              v57 = v10;
              _HKInitializeLogging();
              id v17 = (void *)*MEMORY[0x1E4F29FB8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
              {
                id v18 = v17;
                id v19 = objc_opt_class();
                *(_DWORD *)buf = 138543362;
                v67 = v19;
                id v20 = v19;
                _os_log_impl(&dword_1BCB7D000, v18, OS_LOG_TYPE_DEFAULT, "[%{public}@] Adding Multiple workouts to Workout Overview", buf, 0xCu);
              }
              long long v64 = 0u;
              long long v65 = 0u;
              long long v62 = 0u;
              long long v63 = 0u;
              id v21 = v13[14];
              uint64_t v22 = [v21 countByEnumeratingWithState:&v62 objects:buf count:16];
              if (v22)
              {
                uint64_t v23 = v22;
                uint64_t v24 = *(void *)v63;
                while (2)
                {
                  for (uint64_t i = 0; i != v23; ++i)
                  {
                    if (*(void *)v63 != v24) {
                      objc_enumerationMutation(v21);
                    }
                    v26 = *(void **)(*((void *)&v62 + 1) + 8 * i);
                    v27 = [MEMORY[0x1E4F29128] UUID];
                    v28 = -[HDCoreMotionWorkoutInterface _queue_cmWorkoutForConfiguration:sessionUUID:error:](v1, v26, v27, (uint64_t)&v60);

                    if (!v28)
                    {

                      uint64_t v34 = 0;
                      v10 = v57;
                      id v7 = v58;
                      uint64_t v8 = (id *)(v1 + 40);
                      id v15 = v13;
                      v33 = v59;
                      goto LABEL_28;
                    }
                    [v16 addObject:v28];
                  }
                  uint64_t v23 = [v21 countByEnumeratingWithState:&v62 objects:buf count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }

              v29 = [v16 firstObject];
              id v15 = v13;
              objc_storeStrong(v13 + 13, v29);
              v10 = v57;
              id v7 = v58;
              uint64_t v8 = (id *)(v1 + 40);
            }
            else
            {
              [v16 addObject:v13[13]];
              _HKInitializeLogging();
              v29 = (id)*MEMORY[0x1E4F29FB8];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                objc_super v30 = objc_opt_class();
                id v31 = v13[13];
                *(_DWORD *)buf = 138543618;
                v67 = v30;
                __int16 v68 = 2114;
                id v69 = v31;
                id v32 = v30;
                _os_log_impl(&dword_1BCB7D000, v29, OS_LOG_TYPE_DEFAULT, "[%{public}@] Single workout added to Workout Overview: %{public}@", buf, 0x16u);

                id v15 = v13;
              }
            }

            v33 = v59;
            uint64_t v34 = [objc_alloc(MEMORY[0x1E4F222F8]) initWithOverviewId:v59 workouts:v16];
LABEL_28:

            id v35 = v60;
            v36 = *(void **)(v1 + 48);
            *(void *)(v1 + 48) = v34;

            uint64_t v37 = *(void *)(v1 + 48);
            _HKInitializeLogging();
            v38 = (void *)*MEMORY[0x1E4F29FB8];
            if (v37)
            {
              v39 = v38;
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
              {
                v40 = objc_opt_class();
                id v41 = v15[13];
                *(_DWORD *)buf = 138543618;
                v67 = v40;
                __int16 v68 = 2114;
                id v69 = v41;
                v42 = v15;
                id v43 = v40;
                _os_log_impl(&dword_1BCB7D000, v39, OS_LOG_TYPE_DEFAULT, "[%{public}@] Starting CM workout: %{public}@", buf, 0x16u);

                id v15 = v42;
              }

              [v10 beginWorkoutSession:*(void *)(v1 + 48) withWorkout:v15[13] enableWorkoutChangeDetection:*((unsigned __int8 *)v15 + 80)];
              objc_storeStrong(v8, v15[13]);
              uint64_t v44 = [*(id *)(v1 + 48) overviewId];
              v45 = *(void **)(v1 + 56);
              *(void *)(v1 + 56) = v44;
            }
            else if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
            {
              v51 = v38;
              v52 = objc_opt_class();
              *(_DWORD *)buf = 138543618;
              v67 = v52;
              __int16 v68 = 2114;
              id v69 = v35;
              id v53 = v52;
              _os_log_error_impl(&dword_1BCB7D000, v51, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to create CMWorkoutOverview: %{public}@", buf, 0x16u);
            }
          }

          goto LABEL_39;
        }
        _HKInitializeLogging();
        v9 = (id)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          v46 = objc_opt_class();
          id v47 = v2[13];
          id v48 = v46;
          v49 = [v47 sessionId];
          v50 = [*(id *)(v1 + 40) sessionId];
          *(_DWORD *)buf = 138543874;
          v67 = v46;
          __int16 v68 = 2112;
          id v69 = v49;
          __int16 v70 = 2112;
          v71 = v50;
          _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Not starting CM workout %@ because workout %@ is in progress", buf, 0x20u);
        }
        goto LABEL_9;
      }
    }
    else
    {
    }
    _HKInitializeLogging();
    v54 = (void *)*MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
      goto LABEL_39;
    }
    v9 = v54;
    v55 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    v67 = v55;
    __int16 v68 = 2114;
    id v69 = v7;
    id v56 = v55;
    _os_log_error_impl(&dword_1BCB7D000, v9, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to create CMWorkout: %{public}@", buf, 0x16u);

LABEL_9:
LABEL_39:
  }
}

- (void)averageMETsForWorkoutSessionUUID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__207;
  id v18 = __Block_byref_object_dispose__207;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke;
  block[3] = &unk_1E62F3230;
  block[4] = self;
  void block[5] = &v14;
  dispatch_sync(queue, block);
  v9 = (void *)v15[5];
  if (v9)
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke_2;
    v11[3] = &unk_1E630E9A8;
    id v12 = v7;
    [v9 queryWorkoutMetsWithSessionId:v6 handler:v11];
    v10 = v12;
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:description:", 110, @"Workout METs are not available for current device");
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v10);
  }

  _Block_object_dispose(&v14, 8);
}

void __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (v2)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v2 + 8));
    if (!*(void *)(v2 + 24) && [MEMORY[0x1E4F222F0] isAvailable])
    {
      id v3 = objc_alloc_init(MEMORY[0x1E4F222F0]);
      id v4 = *(void **)(v2 + 24);
      *(void *)(v2 + 24) = v3;
    }
    id v5 = *(id *)(v2 + 24);
  }
  else
  {
    id v5 = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

void __76__HDCoreMotionWorkoutInterface_averageMETsForWorkoutSessionUUID_completion___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v9 = a2;
  if (!v9 || a3)
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    id v5 = [MEMORY[0x1E4F2B618] unitFromString:@"kcal/(kg*hr)"];
    uint64_t v6 = (void *)MEMORY[0x1E4F2B370];
    id v7 = [v9 mets];
    [v7 doubleValue];
    uint64_t v8 = objc_msgSend(v6, "quantityWithUnit:doubleValue:", v5);

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

- (void)setCurrentActivity:(id)a3 isManualTransition:(BOOL)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__HDCoreMotionWorkoutInterface_setCurrentActivity_isManualTransition___block_invoke;
  block[3] = &unk_1E62FF4F8;
  block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_sync(queue, block);
}

void __70__HDCoreMotionWorkoutInterface_setCurrentActivity_isManualTransition___block_invoke(uint64_t a1)
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  if (*(void *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 40) workoutConfiguration];
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = [*(id *)(a1 + 40) UUID];
    id v39 = 0;
    id v5 = -[HDCoreMotionWorkoutInterface _queue_cmWorkoutForConfiguration:sessionUUID:error:](v3, v2, v4, (uint64_t)&v39);
    id v6 = v39;

    if (v5)
    {
      uint64_t v7 = *(void *)(a1 + 32);
      id v8 = [v2 suggestedActivityUUID];
      id v9 = v5;
      id v10 = v8;
      if (!v7) {
        goto LABEL_12;
      }
      BOOL v11 = *(void **)(v7 + 40);
      if (!v11) {
        goto LABEL_12;
      }
      uint64_t v12 = [v11 type];
      if (v12 != [v9 type]) {
        goto LABEL_12;
      }
      uint64_t v13 = [*(id *)(v7 + 40) locationType];
      if (v13 != [v9 locationType]) {
        goto LABEL_12;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          goto LABEL_12;
        }
        uint64_t v14 = *(void **)(v7 + 40);
        id v15 = v9;
        uint64_t v16 = [v14 location];
        uint64_t v17 = [v15 location];

        if (v16 != v17) {
          goto LABEL_12;
        }
      }
      if (!v10
        || ([*(id *)(v7 + 40) sessionId],
            id v18 = (id)objc_claimAutoreleasedReturnValue(),
            v18,
            v18 == v10))
      {

        _HKInitializeLogging();
        v29 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          objc_super v30 = v29;
          id v31 = objc_opt_class();
          id v32 = v31;
          [v2 activityType];
          v33 = _HKWorkoutActivityNameForActivityType();
          [v2 locationType];
          uint64_t v34 = _HKWorkoutSessionLocationTypeName();
          *(_DWORD *)buf = 138543874;
          id v41 = v31;
          __int16 v42 = 2112;
          id v43 = v33;
          __int16 v44 = 2112;
          id v45 = v34;
          _os_log_impl(&dword_1BCB7D000, v30, OS_LOG_TYPE_DEFAULT, "[%{public}@] Skipping current activity %@ (%@) since it matches previous", buf, 0x20u);
        }
      }
      else
      {
LABEL_12:

        id v19 = -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager](*(dispatch_queue_t **)(a1 + 32));
        if (v19)
        {
          _HKInitializeLogging();
          id v20 = (void *)*MEMORY[0x1E4F29FB8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
          {
            id v21 = v20;
            uint64_t v22 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v41 = v22;
            __int16 v42 = 2114;
            id v43 = v9;
            id v23 = v22;
            _os_log_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_DEFAULT, "[%{public}@] Setting current workout type to: %{public}@", buf, 0x16u);
          }
          [v19 setCurrentWorkoutType:v9 isManualTransition:*(unsigned __int8 *)(a1 + 48)];
          objc_storeStrong((id *)(*(void *)(a1 + 32) + 40), v5);
        }
      }
    }
    else
    {
      _HKInitializeLogging();
      v28 = (void *)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
      {
        id v35 = v28;
        v36 = objc_opt_class();
        uint64_t v37 = *(void **)(a1 + 40);
        *(_DWORD *)buf = 138543874;
        id v41 = v36;
        __int16 v42 = 2112;
        id v43 = v37;
        __int16 v44 = 2114;
        id v45 = v6;
        id v38 = v36;
        _os_log_error_impl(&dword_1BCB7D000, v35, OS_LOG_TYPE_ERROR, "[%{public}@] Failed to start %@ because we could not create a CMWorkout: %{public}@", buf, 0x20u);
      }
    }
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v24 = (void *)*MEMORY[0x1E4F29FB8];
    if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR)) {
      return;
    }
    uint64_t v2 = v24;
    v25 = objc_opt_class();
    v26 = *(void **)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    id v41 = v25;
    __int16 v42 = 2112;
    id v43 = v26;
    id v27 = v25;
    _os_log_error_impl(&dword_1BCB7D000, v2, OS_LOG_TYPE_ERROR, "[%{public}@] Not begining CM workout activity %@ because workout session did not start", buf, 0x16u);
  }
}

- (id)_queue_cmWorkoutForConfiguration:(void *)a3 sessionUUID:(uint64_t)a4 error:
{
  id v7 = a2;
  id v8 = a3;
  if (a1)
  {
    id v9 = [v7 predictionSessionUUID];
    id v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      uint64_t v12 = [v7 suggestedActivityUUID];
      uint64_t v13 = (void *)v12;
      if (v12) {
        uint64_t v14 = (void *)v12;
      }
      else {
        uint64_t v14 = v8;
      }
      id v11 = v14;
    }
    uint64_t v15 = [v7 locationType];
    unint64_t v16 = [v7 activityType];
    int v17 = [v7 shouldDisambiguateLocation];
    if (*MEMORY[0x1E4F2BC60] == v16)
    {
      unint64_t v16 = 0;
    }
    else
    {
      switch(v16)
      {
        case 1uLL:
          unint64_t v16 = 42;
          break;
        case 3uLL:
          unint64_t v16 = 41;
          break;
        case 4uLL:
          unint64_t v16 = 52;
          break;
        case 5uLL:
          unint64_t v16 = 60;
          break;
        case 6uLL:
          unint64_t v16 = 50;
          break;
        case 8uLL:
          unint64_t v16 = 64;
          break;
        case 0xAuLL:
          unint64_t v16 = 61;
          break;
        case 0xDuLL:
          uint64_t v36 = 4;
          if (v15 == 2) {
            uint64_t v36 = 5;
          }
          BOOL v37 = v17 == 0;
          uint64_t v38 = 3;
          goto LABEL_69;
        case 0x10uLL:
          unint64_t v16 = 9;
          break;
        case 0x14uLL:
          unint64_t v16 = 28;
          break;
        case 0x15uLL:
          unint64_t v16 = 27;
          break;
        case 0x17uLL:
          unint64_t v16 = 57;
          break;
        case 0x18uLL:
          break;
        case 0x19uLL:
          if (v15 == 2) {
            unint64_t v16 = 48;
          }
          else {
            unint64_t v16 = 49;
          }
          break;
        case 0x1BuLL:
          unint64_t v16 = 45;
          break;
        case 0x1FuLL:
          unint64_t v16 = 38;
          break;
        case 0x22uLL:
          unint64_t v16 = 53;
          break;
        case 0x23uLL:
          if (v15 == 2) {
            unint64_t v16 = 12;
          }
          else {
            unint64_t v16 = 35;
          }
          break;
        case 0x24uLL:
          unint64_t v16 = 44;
          break;
        case 0x25uLL:
          uint64_t v36 = 17;
          if (v15 == 2) {
            uint64_t v36 = 18;
          }
          BOOL v37 = v17 == 0;
          uint64_t v38 = 2;
LABEL_69:
          if (v37) {
            unint64_t v16 = v36;
          }
          else {
            unint64_t v16 = v38;
          }
          break;
        case 0x27uLL:
          BOOL v39 = v15 == 2;
          uint64_t v40 = 46;
          goto LABEL_74;
        case 0x29uLL:
          BOOL v39 = v15 == 2;
          uint64_t v40 = 39;
LABEL_74:
          if (v39) {
            unint64_t v16 = v40 + 1;
          }
          else {
            unint64_t v16 = v40;
          }
          break;
        case 0x2AuLL:
          unint64_t v16 = 59;
          break;
        case 0x2BuLL:
          unint64_t v16 = 56;
          break;
        case 0x2CuLL:
          unint64_t v16 = 11;
          break;
        case 0x2EuLL:
          unint64_t v16 = 19;
          break;
        case 0x2FuLL:
          unint64_t v16 = 62;
          break;
        case 0x30uLL:
          unint64_t v16 = 51;
          break;
        case 0x31uLL:
          unint64_t v16 = 58;
          break;
        case 0x33uLL:
          unint64_t v16 = 55;
          break;
        case 0x34uLL:
          uint64_t v41 = 15;
          if (v15 == 2) {
            uint64_t v41 = 16;
          }
          if (v17) {
            unint64_t v16 = 1;
          }
          else {
            unint64_t v16 = v41;
          }
          break;
        case 0x39uLL:
          unint64_t v16 = 6;
          break;
        case 0x3BuLL:
          unint64_t v16 = 30;
          break;
        case 0x3CuLL:
          unint64_t v16 = 36;
          break;
        case 0x3DuLL:
          unint64_t v16 = 23;
          break;
        case 0x3FuLL:
          unint64_t v16 = 22;
          break;
        case 0x40uLL:
          unint64_t v16 = 63;
          break;
        case 0x41uLL:
          unint64_t v16 = 34;
          break;
        case 0x42uLL:
          unint64_t v16 = 32;
          break;
        case 0x43uLL:
          unint64_t v16 = 37;
          break;
        case 0x46uLL:
          unint64_t v16 = 20;
          break;
        case 0x47uLL:
          unint64_t v16 = 21;
          break;
        case 0x48uLL:
          unint64_t v16 = 31;
          break;
        case 0x4BuLL:
          unint64_t v16 = 43;
          break;
        case 0x4DuLL:
          unint64_t v16 = 7;
          break;
        case 0x4FuLL:
          unint64_t v16 = 54;
          break;
        case 0x50uLL:
          unint64_t v16 = 29;
          break;
        case 0x53uLL:
          unint64_t v16 = 33;
          break;
        default:
          unint64_t v16 = 14;
          break;
      }
    }
    int v18 = [v7 shouldDisambiguateLocation];
    uint64_t v19 = 1;
    if (v15 != 2) {
      uint64_t v19 = 2;
    }
    if (v18) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = v19;
    }
    BOOL v21 = 0;
    if ([v7 shouldUseExtendedMode])
    {
      self;
      if (v16 <= 0x18 && ((1 << v16) & 0x1028006) != 0) {
        BOOL v21 = 1;
      }
    }
    uint64_t v22 = [v7 fitnessPlusCatalogWorkoutId];

    if (v22)
    {
      id v23 = objc_alloc(MEMORY[0x1E4F22200]);
      uint64_t v24 = [v7 fitnessPlusCatalogWorkoutId];
      uint64_t v25 = [v7 fitnessPlusMediaType];
      if ((unint64_t)(v25 - 1) >= 3) {
        uint64_t v26 = 0;
      }
      else {
        uint64_t v26 = v25;
      }
      id v27 = (void *)[v23 initWithSessionId:v11 type:v16 catalogWorkoutId:v24 mediaType:v26 locationType:v20 error:a4];
    }
    else if ([v7 activityType] == 46)
    {
      BOOL v28 = ([v7 swimmingLocationType] & 0xFFFFFFFFFFFFFFFDLL) == 0;
      v29 = [v7 lapLength];
      if (v29)
      {
        objc_super v30 = [MEMORY[0x1E4F2B618] meterUnit];
        [v29 doubleValueForUnit:v30];
        double v32 = v31;
      }
      else
      {
        double v32 = 0.0;
      }
      id v27 = (void *)[objc_alloc(MEMORY[0x1E4F222B0]) initWithSessionId:v11 location:v28 poolLength:v32];
    }
    else
    {
      if (v16 == 14)
      {
        uint64_t v33 = objc_msgSend(objc_alloc(MEMORY[0x1E4F22208]), "initWithSessionId:workoutLabel:", v11, objc_msgSend(v7, "activityType"));
      }
      else
      {
        uint64_t v34 = [v7 fitnessMachineSessionUUID];

        if (v34) {
          uint64_t v33 = [objc_alloc(MEMORY[0x1E4F221F8]) initWithSessionId:v11 workoutType:v16 manufacturerName:@"GymKit" model:@"Fitness Machine"];
        }
        else {
          uint64_t v33 = [objc_alloc(MEMORY[0x1E4F222E0]) initWithSessionId:v11 type:v16 locationType:v20 mode:v21];
        }
      }
      id v27 = (void *)v33;
    }
    [v27 setAppId:*(void *)(a1 + 64)];
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (void)resumeWorkoutForWorkoutSessionUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __67__HDCoreMotionWorkoutInterface_resumeWorkoutForWorkoutSessionUUID___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __67__HDCoreMotionWorkoutInterface_resumeWorkoutForWorkoutSessionUUID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 56) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 40))
    {
      uint64_t v3 = -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)v2);
      if (v3)
      {
        _HKInitializeLogging();
        id v4 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          id v5 = v4;
          id v6 = objc_opt_class();
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
          *(_DWORD *)uint64_t v15 = 138543618;
          *(void *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2114;
          *(void *)&v15[14] = v7;
          id v8 = v6;
          _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Resuming CM workout: %{public}@", v15, 0x16u);
        }
        -[NSObject resumeWorkout:](v3, "resumeWorkout:", *(void *)(*(void *)(a1 + 32) + 40), *(_OWORD *)v15, *(void *)&v15[16]);
      }
      goto LABEL_7;
    }
  }
  _HKInitializeLogging();
  id v9 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = v9;
    id v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
    id v13 = v10;
    uint64_t v14 = [v12 sessionId];
    *(_DWORD *)uint64_t v15 = 138543874;
    *(void *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2112;
    *(void *)&v15[14] = v11;
    *(_WORD *)&v15[22] = 2112;
    unint64_t v16 = v14;
    _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Not resuming CM workout %@ because workout %@ is in progress", v15, 0x20u);

LABEL_7:
  }
}

- (void)pauseWorkoutForWorkoutSessionUUID:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __66__HDCoreMotionWorkoutInterface_pauseWorkoutForWorkoutSessionUUID___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __66__HDCoreMotionWorkoutInterface_pauseWorkoutForWorkoutSessionUUID___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([*(id *)(*(void *)(a1 + 32) + 56) isEqual:*(void *)(a1 + 40)])
  {
    uint64_t v2 = *(void *)(a1 + 32);
    if (*(void *)(v2 + 40))
    {
      uint64_t v3 = -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)v2);
      if (v3)
      {
        _HKInitializeLogging();
        id v4 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          id v5 = v4;
          id v6 = objc_opt_class();
          uint64_t v7 = *(void *)(*(void *)(a1 + 32) + 40);
          *(_DWORD *)uint64_t v15 = 138543618;
          *(void *)&v15[4] = v6;
          *(_WORD *)&v15[12] = 2114;
          *(void *)&v15[14] = v7;
          id v8 = v6;
          _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Pausing CM workout: %{public}@", v15, 0x16u);
        }
        -[NSObject pauseWorkout:](v3, "pauseWorkout:", *(void *)(*(void *)(a1 + 32) + 40), *(_OWORD *)v15, *(void *)&v15[16]);
      }
      goto LABEL_7;
    }
  }
  _HKInitializeLogging();
  id v9 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v3 = v9;
    id v10 = objc_opt_class();
    uint64_t v11 = *(void *)(a1 + 40);
    uint64_t v12 = *(void **)(*(void *)(a1 + 32) + 40);
    id v13 = v10;
    uint64_t v14 = [v12 sessionId];
    *(_DWORD *)uint64_t v15 = 138543874;
    *(void *)&v15[4] = v10;
    *(_WORD *)&v15[12] = 2112;
    *(void *)&v15[14] = v11;
    *(_WORD *)&v15[22] = 2112;
    unint64_t v16 = v14;
    _os_log_error_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_ERROR, "[%{public}@] Not pausing CM workout %@ because workout %@ is in progress", v15, 0x20u);

LABEL_7:
  }
}

- (void)assertionManager:(id)a3 assertionInvalidated:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    BOOL v39 = [MEMORY[0x1E4F28B00] currentHandler];
    [v39 handleFailureInMethod:a2, self, @"HDCoreMotionWorkoutInterface.m", 225, @"Invalid parameter not satisfying: %@", @"[assertion isKindOfClass:[_HDCoreMotionAssertion class]]" object file lineNumber description];
  }
  id v7 = v6;
  id v40 = v7;
  if (v7) {
    id v8 = (void *)*((void *)v7 + 12);
  }
  else {
    id v8 = 0;
  }
  id v9 = v8;
  id v10 = [(HDAssertionManager *)self->_assertionManager activeAssertionsForIdentifier:@"HDWorkoutSessionAssertionIdentifierCoreMotion"];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v41 objects:buf count:16];
  if (!v11)
  {

LABEL_19:
    id v17 = v40;
    dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
    if (v40
      && (id v18 = *((id *)v17 + 13)) != 0
      && (uint64_t v19 = v18,
          int v20 = [(NSUUID *)self->_currentSessionUUID isEqual:*((void *)v17 + 12)],
          v19,
          v20))
    {
      BOOL v21 = -[HDCoreMotionWorkoutInterface _queue_coreMotionWorkoutManager]((dispatch_queue_t *)self);
      if (v21)
      {
        _HKInitializeLogging();
        uint64_t v22 = (void *)*MEMORY[0x1E4F29FB8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
        {
          id v23 = v22;
          uint64_t v24 = objc_opt_class();
          uint64_t v25 = (void *)*((void *)v17 + 13);
          *(_DWORD *)buf = 138543618;
          uint64_t v46 = v24;
          __int16 v47 = 2114;
          id v48 = v25;
          id v26 = v24;
          _os_log_impl(&dword_1BCB7D000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] Stopping CM workout: %{public}@", buf, 0x16u);
        }
        [v21 endWorkoutSession:*((void *)v17 + 13)];
      }
      currentCMWorkout = self->_currentCMWorkout;
      self->_currentCMWorkout = 0;

      currentSessionUUID = self->_currentSessionUUID;
      self->_currentSessionUUID = 0;
    }
    else
    {
      _HKInitializeLogging();
      BOOL v21 = (id)*MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v29 = objc_opt_class();
        if (v40) {
          objc_super v30 = (void *)*((void *)v17 + 13);
        }
        else {
          objc_super v30 = 0;
        }
        id v31 = v30;
        id v32 = v29;
        uint64_t v33 = [v31 sessionId];
        if (v40) {
          uint64_t v34 = (void *)*((void *)v17 + 12);
        }
        else {
          uint64_t v34 = 0;
        }
        id v35 = self->_currentCMWorkout;
        id v36 = v34;
        BOOL v37 = [(CMWorkout *)v35 sessionId];
        uint64_t v38 = self->_currentSessionUUID;
        *(_DWORD *)buf = 138544386;
        uint64_t v46 = v29;
        __int16 v47 = 2114;
        id v48 = v33;
        __int16 v49 = 2114;
        v50 = v34;
        __int16 v51 = 2114;
        v52 = v37;
        __int16 v53 = 2114;
        v54 = v38;
        _os_log_error_impl(&dword_1BCB7D000, v21, OS_LOG_TYPE_ERROR, "[%{public}@] Not stopping CM workout %{public}@ (overview %{public}@) because workout %{public}@ (overview %{public}@) is in progress", buf, 0x34u);
      }
    }

    goto LABEL_29;
  }
  uint64_t v12 = v11;
  uint64_t v13 = 0;
  uint64_t v14 = *(void *)v42;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v42 != v14) {
        objc_enumerationMutation(v10);
      }
      unint64_t v16 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      if (v16) {
        unint64_t v16 = (void *)v16[12];
      }
      if (v16 == v9) {
        ++v13;
      }
    }
    uint64_t v12 = [v10 countByEnumeratingWithState:&v41 objects:buf count:16];
  }
  while (v12);

  if (!v13) {
    goto LABEL_19;
  }
LABEL_29:
}

- (void)unitTest_setCMWorkoutManager:(id)a3
{
}

- (void)unitTest_addCoreMotionAssertionObserver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appIdentifier, 0);
  objc_storeStrong((id *)&self->_currentSessionUUID, 0);
  objc_storeStrong((id *)&self->_cmWorkoutOverview, 0);
  objc_storeStrong((id *)&self->_currentCMWorkout, 0);
  objc_storeStrong((id *)&self->_assertionManager, 0);
  objc_storeStrong((id *)&self->_cmWorkoutMets, 0);
  objc_storeStrong((id *)&self->_cmWorkoutManager, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end