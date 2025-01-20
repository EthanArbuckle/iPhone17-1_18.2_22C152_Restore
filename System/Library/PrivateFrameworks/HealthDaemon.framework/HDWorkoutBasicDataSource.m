@interface HDWorkoutBasicDataSource
- (HDWorkoutBasicDataSource)initWithConfiguration:(id)a3 client:(id)a4;
- (HKDataFlowLink)workoutDataFlowLink;
- (NSSet)sampleTypesToCollect;
- (NSUUID)workoutDataProcessorUUID;
- (id)_takeHeartRateCollectionAssertion;
- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5;
- (uint64_t)_stopCollection;
- (void)_stopObservingSampleTypes:(uint64_t)a1;
- (void)aggregator:(id)a3 didCollectSensorData:(id)a4 objectType:(id)a5 device:(id)a6;
- (void)dataCollectionObservationStateDidChangeForClient:(id)a3;
- (void)dealloc;
- (void)setSampleTypesToCollect:(id)a3;
- (void)setSessionServer:(id)a3;
- (void)setWorkoutConfiguration:(id)a3;
- (void)stopCollectionOnConnectionInvalidation;
- (void)workoutDataDestination:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5;
- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4;
- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5;
- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6;
- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6;
@end

@implementation HDWorkoutBasicDataSource

- (HDWorkoutBasicDataSource)initWithConfiguration:(id)a3 client:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)HDWorkoutBasicDataSource;
  v9 = [(HDWorkoutBasicDataSource *)&v23 init];
  if (v9)
  {
    v10 = [v8 profile];
    objc_storeWeak((id *)&v9->_profile, v10);

    objc_storeStrong((id *)&v9->_client, a4);
    objc_storeStrong((id *)&v9->_workoutConfiguration, a3);
    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    lock = v9->_lock;
    v9->_lock = v11;

    v13 = (NSUUID *)objc_alloc_init(MEMORY[0x1E4F29128]);
    workoutDataProcessorUUID = v9->_workoutDataProcessorUUID;
    v9->_workoutDataProcessorUUID = v13;

    _HKInitializeLogging();
    id v15 = objc_alloc(MEMORY[0x1E4F2AEC0]);
    uint64_t v16 = [v15 initWithProcessor:v9 sourceProtocol:&unk_1F17F7298 destinationProtocol:&unk_1F180F9A8 loggingCategory:*MEMORY[0x1E4F29FB8]];
    workoutDataFlowLink = v9->_workoutDataFlowLink;
    v9->_workoutDataFlowLink = (HKDataFlowLink *)v16;

    uint64_t v18 = [MEMORY[0x1E4F1CAD0] set];
    sampleTypesToCollect = v9->_sampleTypesToCollect;
    v9->_sampleTypesToCollect = (NSSet *)v18;

    v20 = [[HDClientDataCollectionObservationStateMonitor alloc] initWithClient:v8 delegate:v9];
    clientStateMonitor = v9->_clientStateMonitor;
    v9->_clientStateMonitor = v20;

    v9->_collectionStopped = 0;
  }

  return v9;
}

- (void)stopCollectionOnConnectionInvalidation
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29F10];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F10], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138543362;
    v5 = self;
    _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@:stopping collection on connection invalidation", (uint8_t *)&v4, 0xCu);
  }
  -[HDWorkoutBasicDataSource _stopCollection]((uint64_t)self);
}

- (uint64_t)_stopCollection
{
  if (result)
  {
    v1 = *(void **)(result + 32);
    v2[0] = MEMORY[0x1E4F143A8];
    v2[1] = 3221225472;
    v2[2] = __43__HDWorkoutBasicDataSource__stopCollection__block_invoke;
    v2[3] = &unk_1E62F3208;
    v2[4] = result;
    return objc_msgSend(v1, "hk_withLock:", v2);
  }
  return result;
}

- (void)dealloc
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v4 = v3;
    v5 = [(HDWorkoutBasicDataSource *)self workoutDataProcessorUUID];
    *(_DWORD *)buf = 138412290;
    id v8 = v5;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "Basic data source deallocated: %@.", buf, 0xCu);
  }
  -[HDWorkoutBasicDataSource _stopCollection]((uint64_t)self);
  v6.receiver = self;
  v6.super_class = (Class)HDWorkoutBasicDataSource;
  [(HDWorkoutBasicDataSource *)&v6 dealloc];
}

void __43__HDWorkoutBasicDataSource__stopCollection__block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v2 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 104);
  _HKInitializeLogging();
  v3 = *MEMORY[0x1E4F29FB8];
  BOOL v4 = os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      uint64_t v5 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v5;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection already ended", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v4)
    {
      uint64_t v6 = *(void *)(a1 + 32);
      int v8 = 138543362;
      uint64_t v9 = v6;
      _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending collection", (uint8_t *)&v8, 0xCu);
    }
    -[HDWorkoutBasicDataSource _stopObservingSampleTypes:](*(void *)(a1 + 32), *(void **)(*(void *)(a1 + 32) + 64));
    [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
    [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
    [*(id *)(*(void *)(a1 + 32) + 96) invalidate];
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
    [WeakRetained removeObserver:*(void *)(a1 + 32)];

    *(unsigned char *)(*(void *)(a1 + 32) + 104) = 1;
  }
}

- (void)_stopObservingSampleTypes:(uint64_t)a1
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    _HKInitializeLogging();
    BOOL v4 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v23 = a1;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Ending observation of types: %{public}@", buf, 0x16u);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v18 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
            v11 = [WeakRetained dataManager];
            v12 = [v11 quantitySeriesManager];
            [v12 removeObserver:a1 forType:v9];

            id v13 = objc_loadWeakRetained((id *)(a1 + 8));
            v14 = [v13 dataCollectionManager];
            id v15 = [v14 aggregatorForType:v9];

            [v15 unregisterSensorDataObserver:a1];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (void)setSampleTypesToCollect:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  +[HDActiveDataCollectionObserverServer launchObservingProcessesForTypes:v4];
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  lock = self->_lock;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke;
  v27[3] = &unk_1E62FEE30;
  v29 = &v30;
  v27[4] = self;
  id v6 = v4;
  id v28 = v6;
  [(NSLock *)lock hk_withLock:v27];
  if (*((unsigned char *)v31 + 24))
  {
    _HKInitializeLogging();
    uint64_t v7 = *MEMORY[0x1E4F29FB8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v35 = self;
      _os_log_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Attempting to set samples types and collection already ended", buf, 0xCu);
    }
  }
  else
  {
    self->_sampleTypesContainHeartRate = 0;
    int v8 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_391;
    v24[3] = &unk_1E6309E10;
    id v9 = v8;
    id v25 = v9;
    uint64_t v26 = self;
    uint64_t v10 = objc_msgSend(v6, "hk_mapToDictionary:", v24);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
    v12 = [WeakRetained dataCollectionManager];
    id v13 = [(HDHealthStoreClient *)self->_client process];
    v14 = [v13 applicationIdentifier];
    id v15 = [(HDClientDataCollectionObservationStateMonitor *)self->_clientStateMonitor currentObserverState];
    uint64_t v16 = [v12 takeCollectionAssertionWithOwnerIdentifier:v14 collectionIntervalsByType:v10 observerState:v15];

    long long v17 = -[HDWorkoutBasicDataSource _takeHeartRateCollectionAssertion]((id *)&self->super.isa);
    long long v18 = self->_lock;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_2;
    v21[3] = &unk_1E62F30F8;
    v21[4] = self;
    id v19 = v16;
    id v22 = v19;
    id v20 = v17;
    id v23 = v20;
    [(NSLock *)v18 hk_withLock:v21];
  }
  _Block_object_dispose(&v30, 8);
}

void __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke(uint64_t a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(unsigned char *)(*(void *)(a1 + 32) + 104);
  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
  {
    uint64_t v1 = a1;
    if (([*(id *)(a1 + 40) isEqual:*(void *)(*(void *)(a1 + 32) + 64)] & 1) == 0)
    {
      _HKInitializeLogging();
      int v2 = (os_log_t *)MEMORY[0x1E4F29FB8];
      id v3 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(v1 + 32);
        uint64_t v5 = *(void *)(v1 + 40);
        id v6 = *(void **)(v4 + 64);
        *(_DWORD *)buf = 138543874;
        uint64_t v39 = v4;
        __int16 v40 = 2114;
        id v41 = v6;
        __int16 v42 = 2114;
        uint64_t v43 = v5;
        _os_log_impl(&dword_1BCB7D000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Adjusting collected sample types: %{public}@ -> %{public}@", buf, 0x20u);
      }
      uint64_t v7 = objc_msgSend(*(id *)(v1 + 40), "hk_minus:", *(void *)(*(void *)(v1 + 32) + 64));
      int v8 = objc_msgSend(*(id *)(*(void *)(v1 + 32) + 64), "hk_minus:", *(void *)(v1 + 40));
      uint64_t v9 = *(void *)(v1 + 32);
      id v10 = v7;
      if (v9)
      {
        _HKInitializeLogging();
        v11 = *v2;
        if (os_log_type_enabled(*v2, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v39 = v9;
          __int16 v40 = 2114;
          id v41 = v10;
          _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Beginning observation of types: %{public}@", buf, 0x16u);
        }
        uint64_t v30 = v8;
        uint64_t v31 = v1;
        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v29 = v10;
        id obj = v10;
        uint64_t v12 = [obj countByEnumeratingWithState:&v34 objects:buf count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v35;
          do
          {
            uint64_t v15 = 0;
            do
            {
              if (*(void *)v35 != v14) {
                objc_enumerationMutation(obj);
              }
              uint64_t v16 = *(void *)(*((void *)&v34 + 1) + 8 * v15);
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id WeakRetained = objc_loadWeakRetained((id *)(v9 + 8));
                long long v18 = [WeakRetained dataManager];
                id v19 = [v18 quantitySeriesManager];
                [v19 addSynchronousObserver:v9 forType:v16];

                id v20 = objc_loadWeakRetained((id *)(v9 + 8));
                v21 = [v20 dataCollectionManager];
                id v22 = [v21 aggregatorForType:v16];

                [v22 registerSensorDataObserver:v9 queue:0];
              }
              ++v15;
            }
            while (v13 != v15);
            uint64_t v13 = [obj countByEnumeratingWithState:&v34 objects:buf count:16];
          }
          while (v13);
        }

        id v23 = objc_loadWeakRetained((id *)(v9 + 8));
        __int16 v24 = [v23 dataCollectionManager];
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        v33[0] = MEMORY[0x1E4F143A8];
        v33[1] = 3221225472;
        v33[2] = __55__HDWorkoutBasicDataSource__startObservingSampleTypes___block_invoke;
        v33[3] = &unk_1E62F2978;
        v33[4] = v9;
        [v24 requestAggregationThroughDate:v25 types:obj mode:0 options:1 completion:v33];

        int v8 = v30;
        uint64_t v1 = v31;
        id v10 = v29;
      }

      -[HDWorkoutBasicDataSource _stopObservingSampleTypes:](*(void *)(v1 + 32), v8);
      uint64_t v26 = [*(id *)(v1 + 40) copy];
      uint64_t v27 = *(void *)(v1 + 32);
      id v28 = *(void **)(v27 + 64);
      *(void *)(v27 + 64) = v26;
    }
  }
}

void __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_391(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  uint64_t v5 = a3;
  if ([v11 isEqual:*(void *)(a1 + 32)])
  {
    *(unsigned char *)(*(void *)(a1 + 40) + 88) = 1;
  }
  else
  {
    id v6 = NSNumber;
    uint64_t v7 = [v11 code];
    BOOL v8 = v7 == 179 || v7 == 75;
    double v9 = 60.0;
    if (!v8) {
      double v9 = 0.5;
    }
    id v10 = [v6 numberWithDouble:v9];
    v5[2](v5, v11, v10);
  }
}

- (id)_takeHeartRateCollectionAssertion
{
  uint64_t v1 = a1;
  v16[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    int v2 = [MEMORY[0x1E4F2B2C0] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
    if (*((unsigned char *)v1 + 88))
    {
      id WeakRetained = objc_loadWeakRetained(v1 + 1);
      uint64_t v4 = [WeakRetained dataCollectionManager];
      uint64_t v5 = [v1[3] process];
      id v6 = [v5 applicationIdentifier];
      uint64_t v15 = v2;
      uint64_t v7 = NSNumber;
      uint64_t v8 = [v2 code];
      BOOL v9 = v8 == 179 || v8 == 75;
      double v10 = 60.0;
      if (!v9) {
        double v10 = 0.5;
      }
      id v11 = [v7 numberWithDouble:v10];
      v16[0] = v11;
      uint64_t v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v16 forKeys:&v15 count:1];
      uint64_t v13 = [v1[12] currentObserverState];
      uint64_t v1 = [v4 takeCollectionAssertionWithOwnerIdentifier:v6 collectionIntervalsByType:v12 observerState:v13];
    }
    else
    {
      uint64_t v1 = 0;
    }
  }

  return v1;
}

void __52__HDWorkoutBasicDataSource_setSampleTypesToCollect___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 72) invalidate];
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  int v2 = *(void **)(a1 + 48);
  id v3 = (id *)(*(void *)(a1 + 32) + 80);

  objc_storeStrong(v3, v2);
}

- (NSSet)sampleTypesToCollect
{
  [(NSLock *)self->_lock lock];
  id v3 = self->_sampleTypesToCollect;
  [(NSLock *)self->_lock unlock];

  return v3;
}

void __55__HDWorkoutBasicDataSource__startObservingSampleTypes___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  uint64_t v7 = *MEMORY[0x1E4F29FB8];
  if (a2)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      int v10 = 138543362;
      uint64_t v11 = v8;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@: Completed initial aggregation request for newly observed types.", (uint8_t *)&v10, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v9;
    __int16 v12 = 2114;
    id v13 = v5;
    _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: Initial aggregation upon observation start failed: %{public}@", (uint8_t *)&v10, 0x16u);
  }
}

uint64_t __86__HDWorkoutBasicDataSource__enumerateSamplesOfType_from_to_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  return 1;
}

uint64_t __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke(uint64_t a1, uint64_t a2, double a3, double a4, double a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  if ((!*(void *)(a1 + 32) || *(double *)(a1 + 96) <= a7) && (!*(void *)(a1 + 40) || *(double *)(a1 + 104) >= a6))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) != a2)
    {
      uint64_t v19 = *(void *)(*(void *)(a1 + 88) + 8);
      id v20 = *(void **)(v19 + 40);
      *(void *)(v19 + 40) = 0;

      v21 = [NSNumber numberWithLongLong:a2];
      id v22 = HDDataEntityPredicateForRowID((uint64_t)v21, 1);
      [*(id *)(a1 + 48) setPredicate:v22];

      id v23 = *(void **)(a1 + 48);
      uint64_t v24 = *(void *)(a1 + 56);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke_2;
      v32[3] = &unk_1E62F2FE0;
      v32[4] = *(void *)(a1 + 88);
      uint64_t result = [v23 enumerateInTransaction:v24 error:a13 handler:v32];
      if (!result) {
        return result;
      }
      if (!*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)) {
        return 0;
      }
      *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = a2;
    }
    uint64_t v26 = [HDWorkoutSeriesQuantity alloc];
    uint64_t v27 = (void *)MEMORY[0x1E4F2B370];
    id v28 = [*(id *)(a1 + 64) canonicalUnit];
    id v29 = [v27 quantityWithUnit:v28 doubleValue:a5];
    uint64_t v30 = objc_msgSend(MEMORY[0x1E4F28C18], "hk_dateIntervalWithStart:end:", a6, a7);
    uint64_t v31 = [(HDWorkoutSeriesQuantity *)v26 initWithQuantity:v29 dateInterval:v30 series:*(void *)(*(void *)(*(void *)(a1 + 88) + 8) + 40)];

    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  return 1;
}

uint64_t __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke_2(uint64_t a1, void *a2)
{
  return 1;
}

uint64_t __47__HDWorkoutBasicDataSource__forwardQuantities___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addQuantities:*(void *)(a1 + 32) dataSource:*(void *)(a1 + 40)];
}

void __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) addOtherSamples:v3 dataSource:*(void *)(a1 + 40)];
  }
}

void __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v15 = v3;
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_5;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v15;
  }
  uint64_t v7 = [v3 startDate];
  char v8 = objc_msgSend(v7, "hk_isAfterDate:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  uint64_t v9 = v15;
  if ((v8 & 1) == 0)
  {
LABEL_5:
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v15];
    unint64_t v10 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    uint64_t v9 = v15;
    if (v10 >= 0x190)
    {
      uint64_t v11 = (void *)MEMORY[0x1C187C0E0]();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v12 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:400];
      uint64_t v13 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v14 = *(void **)(v13 + 40);
      *(void *)(v13 + 40) = v12;

      uint64_t v9 = v15;
    }
  }
}

void __97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 count]) {
    [*(id *)(a1 + 32) addQuantities:v3 dataSource:*(void *)(a1 + 40)];
  }
}

void __97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v16 = v3;
  if (*(unsigned char *)(a1 + 56)) {
    goto LABEL_5;
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
    id v6 = *(void **)(v5 + 40);
    *(void *)(v5 + 40) = v4;

    id v3 = v16;
  }
  uint64_t v7 = objc_msgSend(v3, "hdw_dateInterval");
  char v8 = [v7 startDate];
  char v9 = objc_msgSend(v8, "hk_isAfterDate:", *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

  unint64_t v10 = v16;
  if ((v9 & 1) == 0)
  {
LABEL_5:
    [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v16];
    unint64_t v11 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) count];
    unint64_t v10 = v16;
    if (v11 >= 0x190)
    {
      uint64_t v12 = (void *)MEMORY[0x1C187C0E0]();
      (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
      uint64_t v13 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:400];
      uint64_t v14 = *(void *)(*(void *)(a1 + 48) + 8);
      id v15 = *(void **)(v14 + 40);
      *(void *)(v14 + 40) = v13;

      unint64_t v10 = v16;
    }
  }
}

- (HKDataFlowLink)workoutDataFlowLink
{
  return self->_workoutDataFlowLink;
}

- (NSUUID)workoutDataProcessorUUID
{
  return self->_workoutDataProcessorUUID;
}

- (void)setWorkoutConfiguration:(id)a3
{
}

- (void)setSessionServer:(id)a3
{
  p_sessionServer = &self->_sessionServer;
  id v6 = a3;
  id v5 = objc_storeWeak((id *)p_sessionServer, v6);
  [v6 addObserver:self queue:0];
}

- (void)workoutDataDestination:(id)a3 requestsDataFrom:(id)a4 to:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  _HKInitializeLogging();
  unint64_t v11 = (os_log_t *)MEMORY[0x1E4F29FB8];
  uint64_t v12 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    uint64_t v31 = self;
    __int16 v32 = 2114;
    id v33 = v9;
    __int16 v34 = 2114;
    id v35 = v10;
    _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_INFO, "%{public}@: Fetching data from %{public}@ -> %{public}@", buf, 0x20u);
  }
  [(NSLock *)self->_lock lock];
  uint64_t v13 = (void *)[(NSSet *)self->_sampleTypesToCollect copy];
  [(NSLock *)self->_lock unlock];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = [WeakRetained database];
  id v29 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __71__HDWorkoutBasicDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke;
  v23[3] = &unk_1E6309ED8;
  id v16 = v13;
  id v24 = v16;
  id v25 = self;
  id v17 = v8;
  id v26 = v17;
  id v18 = v9;
  id v27 = v18;
  id v19 = v10;
  id v28 = v19;
  BOOL v20 = +[HDHealthEntity performReadTransactionWithHealthDatabase:v15 error:&v29 block:v23];
  id v21 = v29;

  if (!v20)
  {
    _HKInitializeLogging();
    id v22 = *v11;
    if (os_log_type_enabled(*v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      uint64_t v31 = self;
      __int16 v32 = 2114;
      id v33 = v21;
      _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Read transaction handling data request failed: %{public}@", buf, 0x16u);
    }
  }
}

uint64_t __71__HDWorkoutBasicDataSource_workoutDataDestination_requestsDataFrom_to___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v88 = a2;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id obj = *(id *)(a1 + 32);
  uint64_t v89 = [obj countByEnumeratingWithState:&v104 objects:v129 count:16];
  if (v89)
  {
    uint64_t v86 = *(void *)v105;
    v78 = &v121;
    v79 = &v120;
    v81 = &v137;
    v82 = &v119;
    v80 = &v138;
    v77 = &v133;
    v75 = &buf[16];
    v76 = &v134;
    *(void *)&long long v2 = 138543874;
    long long v74 = v2;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v105 != v86)
        {
          uint64_t v4 = v3;
          objc_enumerationMutation(obj);
          uint64_t v3 = v4;
        }
        uint64_t v100 = v3;
        id v5 = *(void **)(*((void *)&v104 + 1) + 8 * v3);
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();
        id v8 = *(id **)(a1 + 40);
        uint64_t v7 = *(void **)(a1 + 48);
        id v10 = *(void **)(a1 + 56);
        id v9 = *(void **)(a1 + 64);
        v103 = v8;
        if (isKindOfClass)
        {
          id v96 = v7;
          id v92 = v5;
          id v94 = v10;
          id v101 = v9;
          id v98 = v88;
          if (v8)
          {
            uint64_t aBlock = MEMORY[0x1E4F143A8];
            p_uint64_t aBlock = 3221225472;
            uint64_t v119 = (uint64_t)__97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke;
            v120 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E6309E60;
            v121 = (void (*)(uint64_t))v96;
            v122 = v8;
            unint64_t v11 = _Block_copy(&aBlock);
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v137 = __Block_byref_object_copy__170;
            v138 = __Block_byref_object_dispose__170;
            id v139 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:400];
            v130 = 0;
            v131 = &v130;
            uint64_t v132 = 0x3032000000;
            v133 = __Block_byref_object_copy__170;
            v134 = __Block_byref_object_dispose__170;
            id v135 = 0;
            id v116 = 0;
            uint64_t v108 = MEMORY[0x1E4F143A8];
            uint64_t v109 = 3221225472;
            v110 = __97__HDWorkoutBasicDataSource__workoutDataDestination_requestsQuantitiesOfType_from_to_transaction___block_invoke_2;
            v111 = &unk_1E6309EB0;
            BOOL v115 = v101 != 0;
            v113 = &v130;
            v114 = buf;
            id v12 = v11;
            id v112 = v12;
            id v13 = v92;
            id v14 = v94;
            id v15 = v101;
            id v90 = v98;
            id v16 = &v108;
            if (v15)
            {
              id v17 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"start_date" lessThanOrEqualToValue:v15];
              if (!v14) {
                goto LABEL_21;
              }
LABEL_16:
              id v33 = (void *)MEMORY[0x1E4F65D00];
              __int16 v34 = objc_msgSend(v14, "dateByAddingTimeInterval:", -86400.0, v74);
              id v35 = [v33 predicateWithProperty:@"start_date" greaterThanOrEqualToValue:v34];

              uint64_t v36 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"end_date" greaterThanOrEqualToValue:v14];
              long long v37 = (void *)v36;
              v38 = (void *)MEMORY[0x1E4F65D08];
              if (v17)
              {
                id v156 = v17;
                uint64_t v157 = (uint64_t)v35;
                uint64_t v158 = v36;
                uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v156 count:3];
                uint64_t v40 = [v38 predicateMatchingAllPredicates:v39];

                id v17 = (void *)v40;
              }
              else
              {
                id v156 = v35;
                uint64_t v157 = v36;
                uint64_t v39 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v156 count:2];
                id v17 = [v38 predicateMatchingAllPredicates:v39];
              }

              goto LABEL_21;
            }
            id v17 = 0;
            if (v14) {
              goto LABEL_16;
            }
LABEL_21:
            id v41 = (void *)MEMORY[0x1E4F65D08];
            __int16 v42 = HDSQLitePredicateForUnfrozenQuantitySeriesSamples();
            uint64_t v43 = [v41 disjunctionWithPredicate:v17 otherPredicate:v42];

            uint64_t v44 = (void *)MEMORY[0x1E4F65D08];
            v45 = HDSampleEntityPredicateForDataType(v13);
            uint64_t v46 = [v44 compoundPredicateWithPredicate:v43 otherPredicate:v45];

            [v14 timeIntervalSinceReferenceDate];
            uint64_t v48 = v47;
            [v15 timeIntervalSinceReferenceDate];
            uint64_t v50 = v49;
            id WeakRetained = objc_loadWeakRetained(v103 + 1);
            v52 = +[HDDataEntity entityEnumeratorWithProfile:WeakRetained];

            [v52 setIgnoreEntityClassAdditionalPredicateForEnumeration:1];
            v85 = (void *)v46;
            v53 = v16;
            id v152 = 0;
            v153 = &v152;
            uint64_t v154 = 0x2020000000;
            uint64_t v155 = -1;
            uint64_t v123 = 0;
            v124 = &v123;
            uint64_t v125 = 0x3032000000;
            v126 = __Block_byref_object_copy__170;
            v127 = __Block_byref_object_dispose__170;
            id v128 = 0;
            *(void *)v140 = MEMORY[0x1E4F143A8];
            *(void *)&v140[8] = 3221225472;
            *(void *)&v140[16] = __89__HDWorkoutBasicDataSource__enumerateQuantitiesOfType_from_to_transaction_error_handler___block_invoke;
            v141 = &unk_1E6309E38;
            id v54 = v14;
            id v142 = v54;
            uint64_t v150 = v48;
            v55 = (uint64_t *)v15;
            uint64_t v151 = v50;
            v143 = v55;
            v148 = &v152;
            v149 = &v123;
            v56 = v52;
            v144 = v56;
            id v57 = v90;
            id v145 = v57;
            id v58 = v13;
            id v146 = v58;
            v59 = v53;
            v147 = v59;
            BOOL v60 = +[HDQuantitySampleValueEnumerator orderedQuantityValuesForPredicate:v85 transaction:v57 options:5 error:&v116 handler:v140];

            _Block_object_dispose(&v123, 8);
            _Block_object_dispose(&v152, 8);

            id v61 = v116;
            if (!v60)
            {
              _HKInitializeLogging();
              v62 = *MEMORY[0x1E4F29FB8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v140 = v74;
                *(void *)&v140[4] = v103;
                *(_WORD *)&v140[12] = 2114;
                *(void *)&v140[14] = v58;
                *(_WORD *)&v140[22] = 2114;
                v141 = v61;
                _os_log_error_impl(&dword_1BCB7D000, v62, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate samples of type %{public}@: %{public}@", v140, 0x20u);
              }
            }
            (*((void (**)(id, void))v12 + 2))(v12, *(void *)(*(void *)&buf[8] + 40));

            _Block_object_dispose(&v130, 8);
            _Block_object_dispose(buf, 8);
          }
          goto LABEL_38;
        }
        id v95 = v7;
        id v91 = v5;
        id v93 = v10;
        id v102 = v9;
        id v97 = v88;
        if (v8)
        {
          uint64_t v108 = MEMORY[0x1E4F143A8];
          uint64_t v109 = 3221225472;
          v110 = __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke;
          v111 = &unk_1E6309E60;
          id v112 = v95;
          v113 = v8;
          id v18 = _Block_copy(&v108);
          uint64_t v123 = 0;
          v124 = &v123;
          uint64_t v125 = 0x3032000000;
          v126 = __Block_byref_object_copy__170;
          v127 = __Block_byref_object_dispose__170;
          id v128 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:400];
          uint64_t aBlock = 0;
          p_uint64_t aBlock = (uint64_t)&aBlock;
          uint64_t v119 = 0x3032000000;
          v120 = __Block_byref_object_copy__170;
          v121 = __Block_byref_object_dispose__170;
          v122 = 0;
          id v156 = 0;
          *(void *)v140 = MEMORY[0x1E4F143A8];
          *(void *)&v140[8] = 3221225472;
          *(void *)&v140[16] = __94__HDWorkoutBasicDataSource__workoutDataDestination_requestsSamplesOfType_from_to_transaction___block_invoke_2;
          v141 = &unk_1E6309E88;
          LOBYTE(v145) = v102 != 0;
          v143 = &aBlock;
          v144 = &v123;
          id v19 = v18;
          id v142 = v19;
          id v20 = v93;
          id v21 = v102;
          v84 = v140;
          id v22 = v97;
          id v99 = v91;
          id v23 = objc_loadWeakRetained(v103 + 1);
          id v24 = +[HDSampleEntity entityEnumeratorWithType:v99 profile:v23];

          if (v21)
          {
            id v25 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"start_date" lessThanOrEqualToValue:v21];
            id v26 = v25;
            if (v20)
            {
              id v27 = (void *)MEMORY[0x1E4F65D00];
              id v28 = [v20 dateByAddingTimeInterval:-86400.0];
              id v29 = [v27 predicateWithProperty:@"start_date" greaterThanOrEqualToValue:v28];

              uint64_t v30 = (void *)MEMORY[0x1E4F65D08];
              v130 = v26;
              v131 = v29;
              uint64_t v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:2];
              id v32 = [v30 predicateMatchingAllPredicates:v31];
            }
            else
            {
              id v32 = v25;
            }
          }
          else
          {
            id v32 = 0;
          }
          if (v20)
          {
            v63 = [MEMORY[0x1E4F65D00] predicateWithProperty:@"end_date" greaterThanOrEqualToValue:v20];
            v64 = v63;
            if (v32)
            {
              v65 = (void *)MEMORY[0x1E4F65D08];
              id v152 = v32;
              v153 = (id *)v63;
              v66 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v152 count:2];
              uint64_t v67 = [v65 predicateMatchingAllPredicates:v66];

              id v32 = (id)v67;
            }
            else
            {
              id v32 = v63;
            }
          }
          objc_msgSend(v24, "setPredicate:", v32, v74, v75, v76, v77, v78, v79, v80, v81, v82);
          *(void *)buf = MEMORY[0x1E4F143A8];
          *(void *)&buf[8] = 3221225472;
          *(void *)&buf[16] = __86__HDWorkoutBasicDataSource__enumerateSamplesOfType_from_to_transaction_error_handler___block_invoke;
          v137 = (uint64_t (*)(uint64_t, uint64_t))&unk_1E63011A0;
          v68 = v84;
          v138 = v68;
          char v69 = [v24 enumerateInTransaction:v22 error:&v156 handler:buf];

          LOBYTE(v116) = v69;
          char v70 = (char)v116;

          v71 = (uint64_t (*)(uint64_t, uint64_t))v156;
          if ((v70 & 1) == 0)
          {
            _HKInitializeLogging();
            v72 = *MEMORY[0x1E4F29FB8];
            if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v74;
              *(void *)&uint8_t buf[4] = v103;
              *(_WORD *)&buf[12] = 2114;
              *(void *)&buf[14] = v99;
              *(_WORD *)&buf[22] = 2114;
              v137 = v71;
              _os_log_error_impl(&dword_1BCB7D000, v72, OS_LOG_TYPE_ERROR, "%{public}@: Failed to enumerate samples of type %{public}@: %{public}@", buf, 0x20u);
            }
          }
          (*((void (**)(id, uint64_t))v19 + 2))(v19, v124[5]);

          _Block_object_dispose(&aBlock, 8);
          _Block_object_dispose(&v123, 8);
        }
LABEL_38:
        uint64_t v3 = v100 + 1;
      }
      while (v89 != v100 + 1);
      uint64_t v89 = [obj countByEnumeratingWithState:&v104 objects:v129 count:16];
    }
    while (v89);
  }

  return 1;
}

- (void)workoutDataDestination:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  if (a5 == 4 || a5 == 2) {
    -[HDWorkoutBasicDataSource _stopCollection]((uint64_t)self);
  }
}

- (void)workoutDataDestination:(id)a3 requestsFinalDataFrom:(id)a4 to:(id)a5 completion:(id)a6
{
}

- (void)workoutDataDestination:(id)a3 didUpdateConfiguration:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  [(HDWorkoutBasicDataSource *)self setWorkoutConfiguration:v5];
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_INFO))
  {
    int v7 = 138543618;
    id v8 = self;
    __int16 v9 = 2114;
    id v10 = v5;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_INFO, "%{public}@: Updated workout configuration : %{public}@", (uint8_t *)&v7, 0x16u);
  }
}

- (id)transactionalQuantityInsertHandlerForProfile:(id)a3 journaled:(BOOL)a4 count:(int64_t)a5
{
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __89__HDWorkoutBasicDataSource_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke;
  v10[3] = &unk_1E6309F00;
  id v11 = v6;
  id v12 = self;
  id v7 = v6;
  id v8 = _Block_copy(v10);

  return v8;
}

void __89__HDWorkoutBasicDataSource_transactionalQuantityInsertHandlerForProfile_journaled_count___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4, void *a5, uint64_t a6, int a7)
{
  id v11 = a5;
  id v12 = a4;
  id v13 = a2;
  id v18 = [[HDWorkoutSeriesQuantity alloc] initWithQuantity:v13 dateInterval:v12 series:v11];

  [*(id *)(a1 + 32) addObject:v18];
  if (a7)
  {
    uint64_t v14 = *(void *)(a1 + 40);
    id v15 = *(id *)(a1 + 32);
    id v16 = v15;
    if (v14)
    {
      id v17 = *(void **)(v14 + 40);
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __47__HDWorkoutBasicDataSource__forwardQuantities___block_invoke;
      v19[3] = &unk_1E62F3148;
      id v20 = v15;
      uint64_t v21 = v14;
      [v17 sendToDestinationProcessors:v19];
    }
  }
}

- (void)dataCollectionObservationStateDidChangeForClient:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FB8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543618;
    __int16 v9 = self;
    __int16 v10 = 2114;
    id v11 = v4;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Collection state changed for %{public}@", (uint8_t *)&v8, 0x16u);
  }
  id v6 = [(HDClientDataCollectionObservationStateMonitor *)self->_clientStateMonitor currentObserverState];
  [(HDDataCollectionAssertion *)self->_collectionAssertion setObserverState:v6];

  id v7 = [(HDClientDataCollectionObservationStateMonitor *)self->_clientStateMonitor currentObserverState];
  [(HDDataCollectionAssertion *)self->_heartRateDataCollectionAssertion setObserverState:v7];
}

- (void)aggregator:(id)a3 didCollectSensorData:(id)a4 objectType:(id)a5 device:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  __int16 v9 = [a5 identifier];
  int v10 = [v9 isEqualToString:*MEMORY[0x1E4F2A800]];

  if (v10)
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id obj = v8;
    uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v27;
      uint64_t v14 = *MEMORY[0x1E4F2BBE0];
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v27 != v13) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v26 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v30 = v14;
            id v17 = v16;
            id v18 = [v17 quantity];
            uint64_t v31 = v18;
            id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v31 forKeys:&v30 count:1];

            workoutDataFlowLink = self->_workoutDataFlowLink;
            v23[0] = MEMORY[0x1E4F143A8];
            v23[1] = 3221225472;
            v23[2] = __78__HDWorkoutBasicDataSource_aggregator_didCollectSensorData_objectType_device___block_invoke;
            v23[3] = &unk_1E62FEE58;
            void v23[4] = self;
            id v24 = v19;
            id v25 = v17;
            id v21 = v19;
            [(HKDataFlowLink *)workoutDataFlowLink sendToDestinationProcessors:v23];
          }
        }
        uint64_t v12 = [obj countByEnumeratingWithState:&v26 objects:v32 count:16];
      }
      while (v12);
    }
  }
}

void __78__HDWorkoutBasicDataSource_aggregator_didCollectSensorData_objectType_device___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([*(id *)(*(void *)(a1 + 32) + 56) activityType] == 82)
  {
    if (objc_opt_respondsToSelector())
    {
      uint64_t v3 = *(void *)(a1 + 40);
      id v4 = [*(id *)(a1 + 48) dateInterval];
      id v5 = [v4 startDate];
      [v6 addMetadataToWorkoutActivity:v3 withSampleStartDate:v5 dataSource:*(void *)(a1 + 32)];
    }
  }
  else
  {
    [v6 addMetadata:*(void *)(a1 + 40) dataSource:*(void *)(a1 + 32)];
  }
}

- (void)workoutSession:(id)a3 didChangeToState:(int64_t)a4 fromState:(int64_t)a5 date:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (a4 == 17)
  {
    lock = self->_lock;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke_2;
    v18[3] = &unk_1E62F3208;
    v18[4] = self;
    [(NSLock *)lock hk_withLock:v18];
  }
  else if (a4 == 7 && a5 == 17)
  {
    uint64_t v22 = 0;
    id v23 = &v22;
    uint64_t v24 = 0x2020000000;
    char v25 = 0;
    uint64_t v12 = self->_lock;
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke;
    v21[3] = &unk_1E62F3230;
    v21[4] = self;
    void v21[5] = &v22;
    [(NSLock *)v12 hk_withLock:v21];
    if (*((unsigned char *)v23 + 24))
    {
      _HKInitializeLogging();
      uint64_t v13 = *MEMORY[0x1E4F29FB8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB8], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        long long v27 = self;
        _os_log_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Entering running state and collection stopped. Will not take assertion.", buf, 0xCu);
      }
    }
    else
    {
      id v15 = -[HDWorkoutBasicDataSource _takeHeartRateCollectionAssertion]((id *)&self->super.isa);
      id v16 = self->_lock;
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke_418;
      v19[3] = &unk_1E62F31C0;
      void v19[4] = self;
      id v17 = v15;
      id v20 = v17;
      [(NSLock *)v16 hk_withLock:v19];
    }
    _Block_object_dispose(&v22, 8);
  }
}

uint64_t __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 104);
  return result;
}

void __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke_418(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
  long long v2 = *(void **)(a1 + 40);
  uint64_t v3 = (id *)(*(void *)(a1 + 32) + 80);

  objc_storeStrong(v3, v2);
}

uint64_t __75__HDWorkoutBasicDataSource_workoutSession_didChangeToState_fromState_date___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 80) invalidate];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientStateMonitor, 0);
  objc_storeStrong((id *)&self->_heartRateDataCollectionAssertion, 0);
  objc_storeStrong((id *)&self->_collectionAssertion, 0);
  objc_storeStrong((id *)&self->_sampleTypesToCollect, 0);
  objc_storeStrong((id *)&self->_workoutConfiguration, 0);
  objc_storeStrong((id *)&self->_workoutDataProcessorUUID, 0);
  objc_storeStrong((id *)&self->_workoutDataFlowLink, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_destroyWeak((id *)&self->_sessionServer);

  objc_destroyWeak((id *)&self->_profile);
}

@end