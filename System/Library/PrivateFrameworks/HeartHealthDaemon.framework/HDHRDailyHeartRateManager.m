@interface HDHRDailyHeartRateManager
- (HDHRDailyHeartRateManager)initWithProfile:(id)a3;
- (void)_queue_cleanupValuesForTodayCacheIndex:(int64_t)a3 yesterdayCacheIndex:(int64_t)a4;
- (void)_queue_deleteHeartRateOfType:(id)a3 forCacheIndex:(int64_t)a4 replacementUUID:(id)a5;
- (void)_queue_replaceHeartRate:(id)a3 ofType:(id)a4 forCacheIndex:(int64_t)a5 dateInterval:(id)a6 heartRateByCacheIndex:(id)a7;
- (void)activityCacheManager:(id)a3 changedHeartRateSummary:(id)a4 isToday:(BOOL)a5;
- (void)daemonReady:(id)a3;
- (void)dealloc;
@end

@implementation HDHRDailyHeartRateManager

- (HDHRDailyHeartRateManager)initWithProfile:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HDHRDailyHeartRateManager;
  v5 = [(HDHRDailyHeartRateManager *)&v20 init];
  if (v5)
  {
    _HKInitializeLogging();
    v6 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      v7 = v6;
      v8 = (objc_class *)objc_opt_class();
      v9 = NSStringFromClass(v8);
      *(_DWORD *)buf = 138543362;
      v22 = v9;
      _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] Initializing", buf, 0xCu);
    }
    objc_storeWeak((id *)&v5->_profile, v4);
    v10 = (const char *)HDDispatchQueueName();
    dispatch_queue_t v11 = dispatch_queue_create(v10, 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v11;

    id WeakRetained = objc_loadWeakRetained((id *)&v5->_profile);
    v14 = [WeakRetained healthDaemon];
    [v14 registerForDaemonReady:v5];

    uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
    restingHeartRateByActivityCacheIndex = v5->_restingHeartRateByActivityCacheIndex;
    v5->_restingHeartRateByActivityCacheIndex = (NSMutableDictionary *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    walkingAverageHeartRateByActivityCacheIndex = v5->_walkingAverageHeartRateByActivityCacheIndex;
    v5->_walkingAverageHeartRateByActivityCacheIndex = (NSMutableDictionary *)v17;
  }
  return v5;
}

- (void)dealloc
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  [WeakRetained removeActivityCacheObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HDHRDailyHeartRateManager;
  [(HDHRDailyHeartRateManager *)&v4 dealloc];
}

- (void)daemonReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  objc_super v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    v6 = (objc_class *)objc_opt_class();
    v7 = NSStringFromClass(v6);
    int v11 = 138543362;
    v12 = v7;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received daemon ready", (uint8_t *)&v11, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v9 = [WeakRetained activityCacheInterface];
  objc_storeWeak((id *)&self->_activityCacheInterface, v9);

  id v10 = objc_loadWeakRetained((id *)&self->_activityCacheInterface);
  [v10 addActivityCacheObserver:self];
}

- (void)activityCacheManager:(id)a3 changedHeartRateSummary:(id)a4 isToday:(BOOL)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  _HKInitializeLogging();
  v7 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (objc_class *)objc_opt_class();
    id v10 = NSStringFromClass(v9);
    int v11 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v6, "activityCacheIndex"));
    v12 = [v6 restingHeartRate];
    uint64_t v13 = [v6 walkingAverageHeartRate];
    *(_DWORD *)buf = 138544130;
    objc_super v20 = v10;
    __int16 v21 = 2114;
    v22 = v11;
    __int16 v23 = 2112;
    v24 = v12;
    __int16 v25 = 2112;
    v26 = v13;
    _os_log_impl(&dword_1D3AC6000, v8, OS_LOG_TYPE_DEFAULT, "[%{public}@] Received heart rate summary (%{public}@) with resting: %@, walking: %@", buf, 0x2Au);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __82__HDHRDailyHeartRateManager_activityCacheManager_changedHeartRateSummary_isToday___block_invoke;
  v16[3] = &unk_1E69B4578;
  id v17 = v6;
  v18 = self;
  id v15 = v6;
  dispatch_async(queue, v16);
}

void __82__HDHRDailyHeartRateManager_activityCacheManager_changedHeartRateSummary_isToday___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) activityCacheIndex];
  id v15 = [*(id *)(a1 + 32) heartRateDateInterval];
  v3 = *(void **)(a1 + 40);
  objc_super v4 = [*(id *)(a1 + 32) restingHeartRate];
  v5 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A8A0]];
  objc_msgSend(v3, "_queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:", v4, v5, v2, v15, *(void *)(*(void *)(a1 + 40) + 32));

  id v6 = *(void **)(a1 + 40);
  v7 = [*(id *)(a1 + 32) walkingAverageHeartRate];
  v8 = [MEMORY[0x1E4F2B3B8] quantityTypeForIdentifier:*MEMORY[0x1E4F2A930]];
  objc_msgSend(v6, "_queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:", v7, v8, v2, v15, *(void *)(*(void *)(a1 + 40) + 40));

  v9 = *(id **)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained(v9 + 2);
  int v11 = [WeakRetained currentActivityCache];
  uint64_t v12 = [v11 cacheIndex];
  id v13 = objc_loadWeakRetained((id *)(*(void *)(a1 + 40) + 16));
  v14 = [v13 yesterdayActivityCache];
  objc_msgSend(v9, "_queue_cleanupValuesForTodayCacheIndex:yesterdayCacheIndex:", v12, objc_msgSend(v14, "cacheIndex"));
}

- (void)_queue_replaceHeartRate:(id)a3 ofType:(id)a4 forCacheIndex:(int64_t)a5 dateInterval:(id)a6 heartRateByCacheIndex:(id)a7
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v16 = [v13 identifier];
  if (v12 && ![v12 _isZero])
  {
    v24 = [NSNumber numberWithLongLong:a5];
    v53 = v15;
    __int16 v25 = [v15 objectForKeyedSubscript:v24];
    int v26 = [v12 isEqual:v25];

    if (v26)
    {
      _HKInitializeLogging();
      uint64_t v27 = (void *)*MEMORY[0x1E4F29F48];
      id v15 = v53;
      if (!os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_16;
      }
      v28 = NSNumber;
      v19 = v27;
      objc_super v20 = [v28 numberWithLongLong:a5];
      *(_DWORD *)buf = 138543874;
      v59 = v20;
      __int16 v60 = 2114;
      v61 = v16;
      __int16 v62 = 2112;
      id v63 = v12;
      __int16 v21 = "[Daily HR] ignoring activity cache (%{public}@) for %{public}@ because value (%@) did not change";
      v22 = v19;
      uint32_t v23 = 32;
      goto LABEL_5;
    }
    uint64_t v56 = *MEMORY[0x1E4F2BAA8];
    v29 = [NSNumber numberWithLongLong:a5];
    v57 = v29;
    uint64_t v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v57 forKeys:&v56 count:1];

    v31 = (void *)MEMORY[0x1E4F2B388];
    v32 = [v14 startDate];
    id v52 = v14;
    v33 = [v14 endDate];
    v51 = (void *)v30;
    uint64_t v34 = [v31 quantitySampleWithType:v13 quantity:v12 startDate:v32 endDate:v33 metadata:v30];

    v47 = self;
    p_profile = &self->_profile;
    id WeakRetained = objc_loadWeakRetained((id *)p_profile);
    v37 = [WeakRetained dataManager];
    v49 = (void *)v34;
    uint64_t v55 = v34;
    v38 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
    id v39 = objc_loadWeakRetained((id *)p_profile);
    v40 = [v39 dataProvenanceManager];
    v41 = [v40 defaultLocalDataProvenance];
    id v54 = 0;
    int v48 = [v37 insertDataObjects:v38 withProvenance:v41 creationDate:&v54 error:CFAbsoluteTimeGetCurrent()];
    id v50 = v54;

    _HKInitializeLogging();
    v42 = *MEMORY[0x1E4F29F48];
    if (v48)
    {
      id v15 = v53;
      v43 = v49;
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543618;
        v59 = v16;
        __int16 v60 = 2112;
        v61 = v49;
        _os_log_impl(&dword_1D3AC6000, v42, OS_LOG_TYPE_DEFAULT, "[Daily HR] saved new %{public}@: %@", buf, 0x16u);
      }
      v44 = [NSNumber numberWithLongLong:a5];
      [v53 setObject:v12 forKeyedSubscript:v44];

      v45 = [v49 UUID];
      [(HDHRDailyHeartRateManager *)v47 _queue_deleteHeartRateOfType:v13 forCacheIndex:a5 replacementUUID:v45];

      v46 = v50;
    }
    else
    {
      id v15 = v53;
      v43 = v49;
      v46 = v50;
      if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR)) {
        -[HDHRDailyHeartRateManager _queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:]();
      }
    }

    id v14 = v52;
  }
  else
  {
    _HKInitializeLogging();
    id v17 = (void *)*MEMORY[0x1E4F29F48];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSNumber;
      v19 = v17;
      objc_super v20 = [v18 numberWithLongLong:a5];
      *(_DWORD *)buf = 138543618;
      v59 = v20;
      __int16 v60 = 2114;
      v61 = v16;
      __int16 v21 = "[Daily HR] ignoring activity cache (%{public}@) with no value for %{public}@";
      v22 = v19;
      uint32_t v23 = 22;
LABEL_5:
      _os_log_impl(&dword_1D3AC6000, v22, OS_LOG_TYPE_DEFAULT, v21, buf, v23);
    }
  }
LABEL_16:
}

- (void)_queue_deleteHeartRateOfType:(id)a3 forCacheIndex:(int64_t)a4 replacementUUID:(id)a5
{
  v35[3] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = HDSampleEntityPredicateForDataType();
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v13 = [WeakRetained metadataManager];
  uint64_t v14 = *MEMORY[0x1E4F2BAA8];
  id v15 = (void *)MEMORY[0x1E4F1CAD0];
  v16 = [NSNumber numberWithLongLong:a4];
  uint64_t v17 = [v15 setWithObject:v16];
  v18 = [v13 predicateWithMetadataKey:v14 allowedValues:v17];

  v19 = (void *)MEMORY[0x1E4F65D08];
  objc_super v20 = HDDataEntityPredicateForDataUUID();

  __int16 v21 = [v19 negatedPredicate:v20];

  v22 = (void *)MEMORY[0x1E4F65D08];
  v35[0] = v10;
  v35[1] = v18;
  v35[2] = v21;
  uint32_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:3];
  v24 = [v22 predicateMatchingAllPredicates:v23];

  uint64_t v34 = 0;
  id v25 = objc_loadWeakRetained((id *)p_profile);
  int v26 = [v25 dataManager];
  uint64_t v27 = HDSampleEntityClassForDataType();
  uint64_t v28 = *MEMORY[0x1E4F65DE0];
  id v33 = 0;
  LOBYTE(v32) = 0;
  LOBYTE(v17) = [v26 deleteDataObjectsOfClass:v27 predicate:v24 limit:v28 deletedSampleCount:&v34 notifyObservers:1 generateDeletedObjects:1 userRequested:v32 recursiveDeleteAuthorizationBlock:0 error:&v33];
  id v29 = v33;

  _HKInitializeLogging();
  uint64_t v30 = (void *)*MEMORY[0x1E4F29F48];
  v31 = *MEMORY[0x1E4F29F48];
  if (v17)
  {
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[HDHRDailyHeartRateManager _queue_deleteHeartRateOfType:forCacheIndex:replacementUUID:](v30, v8, &v34);
    }
  }
  else if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
  {
    -[HDHRDailyHeartRateManager _queue_deleteHeartRateOfType:forCacheIndex:replacementUUID:](v30, v8, (uint64_t)v29);
  }
}

- (void)_queue_cleanupValuesForTodayCacheIndex:(int64_t)a3 yesterdayCacheIndex:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F1CA48] array];
  v16 = id v15 = self;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = [(NSMutableDictionary *)self->_restingHeartRateByActivityCacheIndex allKeys];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
        int v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        id v12 = [NSNumber numberWithLongLong:a3];
        if ([v11 isEqualToNumber:v12])
        {
        }
        else
        {
          id v13 = [NSNumber numberWithLongLong:a4];
          char v14 = [v11 isEqualToNumber:v13];

          if ((v14 & 1) == 0) {
            [v16 addObject:v11];
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  [(NSMutableDictionary *)v15->_restingHeartRateByActivityCacheIndex removeObjectsForKeys:v16];
  [(NSMutableDictionary *)v15->_walkingAverageHeartRateByActivityCacheIndex removeObjectsForKeys:v16];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_walkingAverageHeartRateByActivityCacheIndex, 0);
  objc_storeStrong((id *)&self->_restingHeartRateByActivityCacheIndex, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_activityCacheInterface);

  objc_destroyWeak((id *)&self->_profile);
}

- (void)_queue_replaceHeartRate:ofType:forCacheIndex:dateInterval:heartRateByCacheIndex:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0_4();
  uint64_t v3 = v0;
  _os_log_error_impl(&dword_1D3AC6000, v1, OS_LOG_TYPE_ERROR, "[Daily HR] error saving new %{public}@: %@", v2, 0x16u);
}

- (void)_queue_deleteHeartRateOfType:(void *)a1 forCacheIndex:(void *)a2 replacementUUID:(void *)a3 .cold.1(void *a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v5 = a1;
  id v6 = [a2 identifier];
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:*a3];
  int v8 = 138412546;
  uint64_t v9 = v6;
  __int16 v10 = 2112;
  int v11 = v7;
  _os_log_debug_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEBUG, "[Daily HR] deleted %@ previous %@ heart rate sample(s)", (uint8_t *)&v8, 0x16u);
}

- (void)_queue_deleteHeartRateOfType:(void *)a1 forCacheIndex:(void *)a2 replacementUUID:(uint64_t)a3 .cold.2(void *a1, void *a2, uint64_t a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  v5 = a1;
  id v6 = [a2 identifier];
  OUTLINED_FUNCTION_0_4();
  uint64_t v8 = a3;
  _os_log_error_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_ERROR, "[Daily HR] error deleting %@ heart rate sample(s): %@", v7, 0x16u);
}

@end