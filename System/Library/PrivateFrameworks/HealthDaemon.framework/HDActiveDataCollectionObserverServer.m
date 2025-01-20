@interface HDActiveDataCollectionObserverServer
+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
+ (void)launchObservingProcessesForTypes:(id)a3;
- (HDActiveDataCollectionObserverServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6;
- (id)exportedInterface;
- (id)remoteInterface;
- (void)_queue_computeActivelyCollectedTypesForWorkout:(char)a3 alwaysNotify:;
- (void)_queue_didUpdateCurrentWorkout:(uint64_t)a1;
- (void)remote_subscribeForQuantityTypes:(id)a3;
- (void)remote_unsubscribeForQuantityTypes:(id)a3;
- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5;
- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4;
@end

@implementation HDActiveDataCollectionObserverServer

- (HDActiveDataCollectionObserverServer)initWithUUID:(id)a3 configuration:(id)a4 client:(id)a5 delegate:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)HDActiveDataCollectionObserverServer;
  v6 = [(HDStandardTaskServer *)&v12 initWithUUID:a3 configuration:a4 client:a5 delegate:a6];
  if (v6)
  {
    uint64_t v7 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSSet *)objc_alloc_init(MEMORY[0x1E4F1CAD0]);
    observedTypes = v6->_observedTypes;
    v6->_observedTypes = v9;
  }
  return v6;
}

+ (void)launchObservingProcessesForTypes:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self;
  v5 = (void *)MEMORY[0x1E4F1CAD0];
  v6 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A650]];
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F2B3B8], "quantityTypeForIdentifier:", *MEMORY[0x1E4F2A660], v6);
  *(void *)&v14[4] = v7;
  v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A668]];
  v15 = v8;
  v9 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  v16 = v9;
  v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v13 count:4];
  v11 = [v5 setWithArray:v10];

  LODWORD(v6) = [v4 intersectsSet:v11];
  if (v6)
  {
    notify_post((const char *)*MEMORY[0x1E4F2BDE0]);
    _HKInitializeLogging();
    objc_super v12 = *MEMORY[0x1E4F29F10];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 138543362;
      *(void *)v14 = a1;
      _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Posting notification for Bluetooth to start collection", (uint8_t *)&v13, 0xCu);
    }
  }
}

+ (id)taskIdentifier
{
  return (id)*MEMORY[0x1E4F29628];
}

+ (id)requiredEntitlements
{
  v4[1] = *MEMORY[0x1E4F143B8];
  v4[0] = *MEMORY[0x1E4F2A548];
  v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];

  return v2;
}

+ (BOOL)validateConfiguration:(id)a3 client:(id)a4 error:(id *)a5
{
  return 1;
}

- (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F2AB90] serverInterface];
}

- (id)remoteInterface
{
  return (id)[MEMORY[0x1E4F2AB90] clientInterface];
}

- (void)remote_subscribeForQuantityTypes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke(uint64_t a1)
{
  if (![*(id *)(*(void *)(a1 + 32) + 48) count] && objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v2 = [*(id *)(a1 + 32) profile];
    v3 = [v2 dataCollectionManager];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_2;
    v12[3] = &unk_1E6300F88;
    v12[4] = *(void *)(a1 + 32);
    [v3 _setAggregatorConfigurationChangeHandler:v12];

    id v4 = [*(id *)(a1 + 32) profile];
    v5 = [v4 workoutManager];
    [v5 registerCurrentWorkoutObserver:*(void *)(a1 + 32)];
  }
  uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 48) setByAddingObjectsFromArray:*(void *)(a1 + 40)];
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 48);
  *(void *)(v7 + 48) = v6;

  v9 = [*(id *)(a1 + 32) profile];
  v10 = [v9 workoutManager];
  v11 = [v10 currentWorkoutSessionServer];

  -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](*(void *)(a1 + 32), v11, 1);
}

void __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 40);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_3;
  v7[3] = &unk_1E62F31C0;
  v7[4] = v4;
  id v8 = v3;
  id v6 = v3;
  dispatch_async(v5, v7);
}

void __73__HDActiveDataCollectionObserverServer_remote_subscribeForQuantityTypes___block_invoke_3(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  if (v1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(v1 + 40));
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if ([*(id *)(v1 + 48) containsObject:v5])
      {
        v2 = [(id)v1 profile];
        id v3 = [v2 workoutManager];
        uint64_t v4 = [v3 currentWorkoutSessionServer];

        -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](v1, v4, 0);
      }
    }
  }
}

- (void)_queue_computeActivelyCollectedTypesForWorkout:(char)a3 alwaysNotify:
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (!a1) {
    goto LABEL_39;
  }
  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
  id v5 = (void *)[*(id *)(a1 + 48) copy];
  id v6 = [(id)a1 profile];
  uint64_t v7 = [v6 dataCollectionManager];

  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v33 = a1;
  v9 = [(id)a1 profile];
  v10 = [v9 workoutManager];
  int v37 = [v10 isInHeartRateRecovery];

  int v39 = [v4 isActive];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v5;
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  v36 = v8;
  if (!v11) {
    goto LABEL_28;
  }
  uint64_t v12 = v11;
  uint64_t v13 = *(void *)v42;
  uint64_t v34 = *MEMORY[0x1E4F2A7B0];
  uint64_t v32 = *MEMORY[0x1E4F2BCF0];
  v35 = v7;
  do
  {
    for (uint64_t i = 0; i != v12; ++i)
    {
      if (*(void *)v42 != v13) {
        objc_enumerationMutation(obj);
      }
      v15 = *(void **)(*((void *)&v41 + 1) + 8 * i);
      v16 = [v7 aggregatorForType:v15];
      uint64_t v17 = [v16 configuration];

      if (v4)
      {
        if (v39) {
          int v18 = [v17 hasActiveWorkout];
        }
        else {
          int v18 = 0;
        }
        if ([v15 code] == 5)
        {
          if ((v18 | v37)) {
            goto LABEL_25;
          }
        }
        else if (([v4 isGymKit] & 1) == 0 && ((v18 ^ 1) & 1) == 0)
        {
          id v19 = v15;
          id v20 = v4;
          v21 = [v19 identifier];
          int v22 = [v21 isEqualToString:v34];

          if (!v22
            || ([v20 currentActivityConfiguration],
                v23 = objc_claimAutoreleasedReturnValue(),
                uint64_t v24 = [v23 locationType],
                v23,
                v24 != 3))
          {

            uint64_t v7 = v35;
            id v8 = v36;
LABEL_25:
            [v8 addObject:v15];
            goto LABEL_26;
          }
          uint64_t v25 = [(id)v33 client];
          v26 = [(id)v25 sourceBundleIdentifier];

          LOBYTE(v25) = [v26 isEqualToString:v32];
          uint64_t v7 = v35;
          id v8 = v36;
          if ((v25 & 1) == 0) {
            goto LABEL_25;
          }
        }
      }
      else if ([v15 code] == 5 {
             && (([v17 hasForegroundObserver] & 1) != 0
      }
              || [v17 hasBackgroundObserver]))
      {
        goto LABEL_25;
      }
LABEL_26:
    }
    uint64_t v12 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
  }
  while (v12);
LABEL_28:

  if ([v8 count]) {
    uint64_t v27 = [v4 isPaused] | v37;
  }
  else {
    uint64_t v27 = 1;
  }
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __100__HDActiveDataCollectionObserverServer__queue_computeActivelyCollectedTypesForWorkout_alwaysNotify___block_invoke;
  v40[3] = &unk_1E62F3170;
  v40[4] = v33;
  v28 = [(id)v33 remoteObjectProxyWithErrorHandler:v40];
  if (v28)
  {
    if (a3)
    {
      v29 = [v36 allObjects];
      objc_msgSend(v28, "client_updatedCollectedTypes:", v29);

      objc_storeStrong((id *)(v33 + 56), v36);
      goto LABEL_37;
    }
    if (([*(id *)(v33 + 56) isEqualToSet:v36] & 1) == 0
      && ([v36 allObjects],
          v30 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v28, "client_updatedCollectedTypes:", v30),
          v30,
          objc_storeStrong((id *)(v33 + 56), v36),
          (a3 & 1) != 0)
      || *(unsigned __int8 *)(v33 + 64) != v27)
    {
LABEL_37:
      objc_msgSend(v28, "client_didChangeAllowCollectionPause:", v27);
      *(unsigned char *)(v33 + 64) = v27;
    }
  }

LABEL_39:
}

- (void)remote_unsubscribeForQuantityTypes:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __75__HDActiveDataCollectionObserverServer_remote_unsubscribeForQuantityTypes___block_invoke;
  v7[3] = &unk_1E62F31C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

void __75__HDActiveDataCollectionObserverServer_remote_unsubscribeForQuantityTypes___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 48);
  id v3 = [MEMORY[0x1E4F1CAD0] setWithArray:*(void *)(a1 + 40)];
  uint64_t v4 = objc_msgSend(v2, "hk_minus:", v3);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v4;

  if (![*(id *)(*(void *)(a1 + 32) + 48) count])
  {
    uint64_t v7 = [*(id *)(a1 + 32) profile];
    id v8 = [v7 dataCollectionManager];
    [v8 _setAggregatorConfigurationChangeHandler:0];

    v9 = [*(id *)(a1 + 32) profile];
    v10 = [v9 workoutManager];
    [v10 unregisterCurrentWorkoutObserver:*(void *)(a1 + 32)];
  }
  uint64_t v11 = [*(id *)(a1 + 32) profile];
  uint64_t v12 = [v11 workoutManager];
  id v13 = [v12 currentWorkoutSessionServer];

  -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](*(void *)(a1 + 32), v13, 0);
}

- (void)workoutManager:(id)a3 didUpdateCurrentWorkout:(id)a4
{
  id v5 = a4;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__HDActiveDataCollectionObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke;
  v8[3] = &unk_1E62F31C0;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_sync(queue, v8);
}

void __79__HDActiveDataCollectionObserverServer_workoutManager_didUpdateCurrentWorkout___block_invoke(uint64_t a1)
{
}

- (void)_queue_didUpdateCurrentWorkout:(uint64_t)a1
{
  id v9 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 40));
    id v3 = [(id)a1 profile];
    uint64_t v4 = [v3 workoutManager];
    int v5 = [v4 isInHeartRateRecovery];

    int v6 = [v9 isPaused];
    int v7 = *(unsigned __int8 *)(a1 + 64);
    if (v7 != v6 || v7 != v5) {
      -[HDActiveDataCollectionObserverServer _queue_computeActivelyCollectedTypesForWorkout:alwaysNotify:](a1, v9, 0);
    }
  }
}

- (void)workoutManager:(id)a3 currentWorkout:(id)a4 didChangeToState:(int64_t)a5
{
  id v6 = a4;
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __87__HDActiveDataCollectionObserverServer_workoutManager_currentWorkout_didChangeToState___block_invoke;
  v9[3] = &unk_1E62F31C0;
  v9[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_sync(queue, v9);
}

void __87__HDActiveDataCollectionObserverServer_workoutManager_currentWorkout_didChangeToState___block_invoke(uint64_t a1)
{
}

void __100__HDActiveDataCollectionObserverServer__queue_computeActivelyCollectedTypesForWorkout_alwaysNotify___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  uint64_t v4 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138543618;
    uint64_t v7 = v5;
    __int16 v8 = 2114;
    id v9 = v3;
    _os_log_error_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Failed to notify client of actively collected types: %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_recentlyNotifiedTypes, 0);
  objc_storeStrong((id *)&self->_observedTypes, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

@end