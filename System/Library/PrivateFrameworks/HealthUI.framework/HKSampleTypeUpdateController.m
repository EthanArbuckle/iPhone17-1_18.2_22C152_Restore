@interface HKSampleTypeUpdateController
- (BOOL)_isHighFrequencyDataType:(id)a3;
- (BOOL)_typeRequiresNewQuery:(id)a3;
- (BOOL)isQueryStateRunningForType:(id)a3;
- (HKSampleTypeUpdateController)initWithHealthStore:(id)a3;
- (id)_allObservedTypes;
- (id)_failedQuerySampleTypes;
- (id)_findThrottledUpdateData:(id)a3;
- (id)_observersForType:(id)a3;
- (int64_t)_queryStateForType:(id)a3;
- (void)_applicationMovingToBackground:(id)a3;
- (void)_applicationMovingToForeground:(id)a3;
- (void)_callObservers:(id)a3 withType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
- (void)_createQueryForType:(id)a3;
- (void)_drainAllThrottledDataIfNecessary;
- (void)_drainThrottledDataIfNecessary:(id)a3 recoveringFromError:(BOOL)a4;
- (void)_errorRecoveryCallbacksForType:(id)a3;
- (void)_handleHighFrequencyObserverCallbacksForType:(id)a3;
- (void)_handleQueryCallbackForType:(id)a3 samplesAdded:(id)a4 objectsDeleted:(id)a5 error:(id)a6;
- (void)_handleQueryErrorForType:(id)a3 error:(id)a4;
- (void)_handleQuerySuccessForType:(id)a3 samplesAdded:(id)a4 objectsRemoved:(id)a5;
- (void)_installThrottlingTimer;
- (void)_removeQueryForType:(id)a3 queryState:(int64_t)a4;
- (void)_removeThrottlingTimer;
- (void)_resumeFailedQueries;
- (void)_sendThrottledUpdatesToObservers:(id)a3 recoveringFromError:(BOOL)a4;
- (void)_setQueryState:(int64_t)a3 forType:(id)a4;
- (void)addObserver:(id)a3 forType:(id)a4;
- (void)removeObserver:(id)a3 forType:(id)a4;
@end

@implementation HKSampleTypeUpdateController

- (void)_applicationMovingToForeground:(id)a3
{
  self->_applicationIsInBackground = 0;
  [(HKSampleTypeUpdateController *)self _resumeFailedQueries];
}

- (HKSampleTypeUpdateController)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)HKSampleTypeUpdateController;
  v6 = [(HKSampleTypeUpdateController *)&v20 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    outstandingQueriesByType = v7->_outstandingQueriesByType;
    v7->_outstandingQueriesByType = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryStatesByType = v7->_queryStatesByType;
    v7->_queryStatesByType = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByType = v7->_observersByType;
    v7->_observersByType = v12;

    v7->_applicationIsInBackground = 0;
    v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel__applicationMovingToForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel__applicationMovingToBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    throttledDataBySampleType = v7->_throttledDataBySampleType;
    v7->_throttledDataBySampleType = v16;

    throttlePollTimer = v7->_throttlePollTimer;
    v7->_throttlePollTimer = 0;
  }
  return v7;
}

- (void)_resumeFailedQueries
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v3 = [(HKSampleTypeUpdateController *)self _failedQuerySampleTypes];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v18;
    v8 = (os_log_t *)MEMORY[0x1E4F29FB0];
    *(void *)&long long v5 = 138543619;
    long long v15 = v5;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v3);
        }
        v10 = *(void **)(*((void *)&v17 + 1) + 8 * v9);
        _HKInitializeLogging();
        os_log_t v11 = *v8;
        if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        {
          v12 = v11;
          v13 = objc_opt_class();
          id v16 = v13;
          v14 = [v10 identifier];
          *(_DWORD *)buf = v15;
          v22 = v13;
          __int16 v23 = 2113;
          v24 = v14;
          _os_log_error_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Resuming failed query from background (%{private}@)", buf, 0x16u);
        }
        -[HKSampleTypeUpdateController _errorRecoveryCallbacksForType:](self, "_errorRecoveryCallbacksForType:", v10, v15);
        [(HKSampleTypeUpdateController *)self _createQueryForType:v10];
        ++v9;
      }
      while (v6 != v9);
      uint64_t v6 = [v3 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v6);
  }
}

- (id)_failedQuerySampleTypes
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = self->_queryStatesByType;
  uint64_t v5 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v10 = -[NSMutableDictionary objectForKeyedSubscript:](self->_queryStatesByType, "objectForKeyedSubscript:", v9, (void)v13);
        os_log_t v11 = v10;
        if (v10 && [v10 integerValue] == 3) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [(NSMutableDictionary *)v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  return v3;
}

- (void)_installThrottlingTimer
{
  if (!self->_throttlePollTimer)
  {
    objc_initWeak(&location, self);
    id v3 = (void *)MEMORY[0x1E4F1CB00];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __55__HKSampleTypeUpdateController__installThrottlingTimer__block_invoke;
    v6[3] = &unk_1E6D51810;
    objc_copyWeak(&v7, &location);
    uint64_t v4 = [v3 scheduledTimerWithTimeInterval:1 repeats:v6 block:1.0];
    throttlePollTimer = self->_throttlePollTimer;
    self->_throttlePollTimer = v4;

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __55__HKSampleTypeUpdateController__installThrottlingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _drainAllThrottledDataIfNecessary];
}

- (void)_removeThrottlingTimer
{
  throttlePollTimer = self->_throttlePollTimer;
  if (throttlePollTimer)
  {
    [(NSTimer *)throttlePollTimer invalidate];
    uint64_t v4 = self->_throttlePollTimer;
    self->_throttlePollTimer = 0;
  }
}

- (void)_drainAllThrottledDataIfNecessary
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = self->_throttledDataBySampleType;
  uint64_t v4 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (!v4)
  {

LABEL_11:
    [(HKSampleTypeUpdateController *)self _removeThrottlingTimer];
    return;
  }
  uint64_t v5 = v4;
  char v6 = 0;
  uint64_t v7 = *(void *)v11;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v11 != v7) {
        objc_enumerationMutation(v3);
      }
      uint64_t v9 = -[NSMutableDictionary objectForKeyedSubscript:](self->_throttledDataBySampleType, "objectForKeyedSubscript:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      [(HKSampleTypeUpdateController *)self _drainThrottledDataIfNecessary:v9 recoveringFromError:0];
      v6 |= [v9 incomingUpdateCountSinceLastDrain] > 2;
    }
    uint64_t v5 = [(NSMutableDictionary *)v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  }
  while (v5);

  if ((v6 & 1) == 0) {
    goto LABEL_11;
  }
}

- (void)_sendThrottledUpdatesToObservers:(id)a3 recoveringFromError:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id obj = [v6 throttledObservers];
  uint64_t v7 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(obj);
        }
        long long v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        long long v12 = [v6 throttledSampleType];
        long long v13 = [v6 throttledSamplesAdded];
        long long v14 = [v6 throttledDeletedObjects];
        [v11 updateController:self didReceiveUpdateForType:v12 samplesAdded:v13 objectsRemoved:v14 recoveringFromError:v4];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [obj countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }
}

- (void)_drainThrottledDataIfNecessary:(id)a3 recoveringFromError:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  if ([v11 incomingUpdateCountSinceLastDrain])
  {
    id v6 = [v11 throttledObservers];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      if ([v11 incomingUpdateCountSinceLastDrain] > 2)
      {
        [(HKSampleTypeUpdateController *)self _installThrottlingTimer];
        double v8 = CACurrentMediaTime();
        if (v4 || (double v9 = v8, [v11 lastDrainTime], v8 = v9 - v10, v8 >= 1.0))
        {
          -[HKSampleTypeUpdateController _sendThrottledUpdatesToObservers:recoveringFromError:](self, "_sendThrottledUpdatesToObservers:recoveringFromError:", v11, v4, v8);
          [v11 clearThrottlingData];
          [v11 updateDrainTime];
        }
      }
      else
      {
        [(HKSampleTypeUpdateController *)self _sendThrottledUpdatesToObservers:v11 recoveringFromError:v4];
        [v11 clearThrottlingData];
      }
    }
  }
}

- (void)addObserver:(id)a3 forType:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = [(HKSampleTypeUpdateController *)self _observersForType:v6];
  [v7 addObject:v8];
  if ([(HKSampleTypeUpdateController *)self _typeRequiresNewQuery:v6]) {
    [(HKSampleTypeUpdateController *)self _createQueryForType:v6];
  }
  else {
    [v8 updateController:self didReceiveUpdateForType:v6 samplesAdded:MEMORY[0x1E4F1CBF0] objectsRemoved:MEMORY[0x1E4F1CBF0] recoveringFromError:0];
  }
}

- (void)removeObserver:(id)a3 forType:(id)a4
{
  v22[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    v22[0] = v7;
    double v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:1];
  }
  else
  {
    double v9 = [(HKSampleTypeUpdateController *)self _allObservedTypes];
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        long long v16 = -[HKSampleTypeUpdateController _observersForType:](self, "_observersForType:", v15, (void)v17);
        [v16 removeObject:v6];
        if (![v16 count]) {
          [(HKSampleTypeUpdateController *)self _removeQueryForType:v15 queryState:0];
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }
}

- (id)_observersForType:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_observersByType objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = [MEMORY[0x1E4F28D30] hashTableWithOptions:5];
    [(NSMutableDictionary *)self->_observersByType setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (id)_findThrottledUpdateData:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(NSMutableDictionary *)self->_throttledDataBySampleType objectForKeyedSubscript:v4];
  if (!v5)
  {
    uint64_t v5 = [[HKThrottledUpdateData alloc] initWithSampleType:v4];
    [(NSMutableDictionary *)self->_throttledDataBySampleType setObject:v5 forKeyedSubscript:v4];
  }

  return v5;
}

- (void)_callObservers:(id)a3 withType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  BOOL v7 = a7;
  id v19 = a4;
  uint64_t v13 = (void *)MEMORY[0x1E4F29060];
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  if (([v13 isMainThread] & 1) == 0)
  {
    long long v18 = [MEMORY[0x1E4F28B00] currentHandler];
    [v18 handleFailureInMethod:a2 object:self file:@"HKSampleTypeUpdateController.m" lineNumber:214 description:@"HKSampleTypeUpdateController _callObservers must be delivered on main thread"];
  }
  long long v17 = [(HKSampleTypeUpdateController *)self _findThrottledUpdateData:v19];
  [v17 addThrottledObservers:v16 samplesAdded:v15 objectsRemoved:v14];

  [(HKSampleTypeUpdateController *)self _drainThrottledDataIfNecessary:v17 recoveringFromError:v7];
}

- (id)_allObservedTypes
{
  return (id)[(NSMutableDictionary *)self->_observersByType allKeys];
}

- (BOOL)isQueryStateRunningForType:(id)a3
{
  return [(HKSampleTypeUpdateController *)self _queryStateForType:a3] == 2;
}

- (BOOL)_typeRequiresNewQuery:(id)a3
{
  return (unint64_t)([(HKSampleTypeUpdateController *)self _queryStateForType:a3] - 3) < 0xFFFFFFFFFFFFFFFELL;
}

- (int64_t)_queryStateForType:(id)a3
{
  id v3 = [(NSMutableDictionary *)self->_queryStatesByType objectForKeyedSubscript:a3];
  id v4 = v3;
  if (v3) {
    int64_t v5 = [v3 integerValue];
  }
  else {
    int64_t v5 = 0;
  }

  return v5;
}

- (void)_setQueryState:(int64_t)a3 forType:(id)a4
{
  id v6 = NSNumber;
  id v7 = a4;
  id v8 = [v6 numberWithInteger:a3];
  [(NSMutableDictionary *)self->_queryStatesByType setObject:v8 forKeyedSubscript:v7];
}

- (BOOL)_isHighFrequencyDataType:(id)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = *MEMORY[0x1E4F2A7F0];
    v9[0] = *MEMORY[0x1E4F2A820];
    v9[1] = v4;
    int64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
    id v6 = [v3 identifier];
    char v7 = [v5 containsObject:v6];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)_createQueryForType:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HKSampleTypeUpdateController *)self _setQueryState:1 forType:v4];
  int64_t v5 = [MEMORY[0x1E4F1CA48] array];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke;
  aBlock[3] = &unk_1E6D54488;
  aBlock[4] = self;
  id v6 = v4;
  id v37 = v6;
  char v7 = _Block_copy(aBlock);
  id v8 = objc_alloc(MEMORY[0x1E4F2ABF0]);
  double v9 = [MEMORY[0x1E4F2B3C8] latestAnchor];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_3;
  v34[3] = &unk_1E6D544B0;
  id v10 = v7;
  id v35 = v10;
  uint64_t v11 = (void *)[v8 initWithType:v6 predicate:0 anchor:v9 limit:0 resultsHandler:v34];

  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_4;
  v32[3] = &unk_1E6D544B0;
  id v12 = v10;
  id v33 = v12;
  [v11 setUpdateHandler:v32];
  [v5 addObject:v11];
  if ([(HKSampleTypeUpdateController *)self _isHighFrequencyDataType:v6])
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v40 = __Block_byref_object_copy__13;
    v41 = __Block_byref_object_dispose__13;
    id v42 = v6;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_303;
    v31[3] = &unk_1E6D544D8;
    v31[4] = self;
    v31[5] = buf;
    uint64_t v13 = _Block_copy(v31);
    id v14 = (void *)MEMORY[0x1E4F2B3C0];
    id v15 = [MEMORY[0x1E4F1C9C8] date];
    id v16 = [v14 predicateForSamplesWithStartDate:v15 endDate:0 options:0];

    id v17 = objc_alloc(MEMORY[0x1E4F2B2C8]);
    long long v18 = (void *)[v17 initWithSampleType:*(void *)(*(void *)&buf[8] + 40) predicate:v16 updateHandler:v13];
    [v18 setObserveUnfrozenSeries:1];
    [v5 addObject:v18];

    _Block_object_dispose(buf, 8);
  }
  _HKInitializeLogging();
  id v19 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEBUG))
  {
    v24 = v19;
    uint64_t v25 = [v5 count];
    uint64_t v26 = [v6 description];
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = self;
    *(_WORD *)&buf[12] = 2048;
    *(void *)&buf[14] = v25;
    *(_WORD *)&buf[22] = 2112;
    v40 = v26;
    _os_log_debug_impl(&dword_1E0B26000, v24, OS_LOG_TYPE_DEBUG, "HKSampleTypeUpdateController(%p): ChartDataUpdate: installing %ld queries for type %@", buf, 0x20u);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v20 = v5;
  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v20);
        }
        -[HKHealthStore executeQuery:](self->_healthStore, "executeQuery:", *(void *)(*((void *)&v27 + 1) + 8 * v23++), (void)v27);
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v38 count:16];
    }
    while (v21);
  }

  [(NSMutableDictionary *)self->_outstandingQueriesByType setObject:v20 forKeyedSubscript:v6];
}

void __52__HKSampleTypeUpdateController__createQueryForType___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_2;
  block[3] = &unk_1E6D54460;
  id v10 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v15 = v10;
  id v16 = v7;
  id v17 = v8;
  id v18 = v9;
  id v11 = v9;
  id v12 = v8;
  id v13 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _handleQueryCallbackForType:*(void *)(a1 + 40) samplesAdded:*(void *)(a1 + 48) objectsDeleted:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __52__HKSampleTypeUpdateController__createQueryForType___block_invoke_303(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (!a4) {
    return [*(id *)(result + 32) _handleHighFrequencyObserverCallbacksForType:*(void *)(*(void *)(*(void *)(result + 40) + 8) + 40)];
  }
  return result;
}

- (void)_removeQueryForType:(id)a3 queryState:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(NSMutableDictionary *)self->_outstandingQueriesByType objectForKeyedSubscript:v6];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [(HKHealthStore *)self->_healthStore stopQuery:*(void *)(*((void *)&v12 + 1) + 8 * v11++)];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
  [(NSMutableDictionary *)self->_outstandingQueriesByType removeObjectForKey:v6];
  [(HKSampleTypeUpdateController *)self _setQueryState:a4 forType:v6];
}

- (void)_handleQueryCallbackForType:(id)a3 samplesAdded:(id)a4 objectsDeleted:(id)a5 error:(id)a6
{
  if (a6) {
    -[HKSampleTypeUpdateController _handleQueryErrorForType:error:](self, "_handleQueryErrorForType:error:", a3, a6, a5);
  }
  else {
    [(HKSampleTypeUpdateController *)self _handleQuerySuccessForType:a3 samplesAdded:a4 objectsRemoved:a5];
  }
}

- (void)_handleQueryErrorForType:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  _HKInitializeLogging();
  uint64_t v8 = (os_log_t *)MEMORY[0x1E4F29FB0];
  uint64_t v9 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR))
  {
    long long v12 = v9;
    long long v13 = objc_opt_class();
    id v14 = v13;
    long long v15 = [v6 identifier];
    *(_DWORD *)buf = 138543875;
    id v19 = v13;
    __int16 v20 = 2113;
    uint64_t v21 = v15;
    __int16 v22 = 2114;
    id v23 = v7;
    _os_log_error_impl(&dword_1E0B26000, v12, OS_LOG_TYPE_ERROR, "%{public}@: Sample type error (%{private}@): %{public}@", buf, 0x20u);
  }
  [(HKSampleTypeUpdateController *)self _removeQueryForType:v6 queryState:3];
  if (self->_applicationIsInBackground)
  {
    _HKInitializeLogging();
    os_log_t v10 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR)) {
      -[HKSampleTypeUpdateController _handleQueryErrorForType:error:](v10);
    }
  }
  else
  {
    dispatch_time_t v11 = dispatch_time(0, 500000000);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke;
    v16[3] = &unk_1E6D513B0;
    v16[4] = self;
    id v17 = v6;
    dispatch_after(v11, MEMORY[0x1E4F14428], v16);
  }
}

uint64_t __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
    __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke_cold_1(a1, v2);
  }
  [*(id *)(a1 + 32) _errorRecoveryCallbacksForType:*(void *)(a1 + 40)];
  return [*(id *)(a1 + 32) _createQueryForType:*(void *)(a1 + 40)];
}

- (void)_handleQuerySuccessForType:(id)a3 samplesAdded:(id)a4 objectsRemoved:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  [(HKSampleTypeUpdateController *)self _setQueryState:2 forType:v8];
  _HKInitializeLogging();
  dispatch_time_t v11 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEBUG))
  {
    id v14 = v11;
    long long v15 = [v8 identifier];
    int v16 = 134218755;
    id v17 = self;
    __int16 v18 = 2113;
    id v19 = v15;
    __int16 v20 = 2048;
    uint64_t v21 = [v9 count];
    __int16 v22 = 2048;
    uint64_t v23 = [v10 count];
    _os_log_debug_impl(&dword_1E0B26000, v14, OS_LOG_TYPE_DEBUG, "HKSampleTypeUpdateController(%p, %{private}@): ChartDataUpdate: adding %ld objects, removing %ld objects", (uint8_t *)&v16, 0x2Au);
  }
  long long v12 = [(HKSampleTypeUpdateController *)self _observersForType:v8];
  long long v13 = [v12 allObjects];
  [(HKSampleTypeUpdateController *)self _callObservers:v13 withType:v8 samplesAdded:v9 objectsRemoved:v10 recoveringFromError:0];
}

- (void)_handleHighFrequencyObserverCallbacksForType:(id)a3
{
  id v4 = a3;
  int64_t v5 = [(HKSampleTypeUpdateController *)self _observersForType:v4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__HKSampleTypeUpdateController__handleHighFrequencyObserverCallbacksForType___block_invoke;
  block[3] = &unk_1E6D51318;
  id v9 = v5;
  id v10 = self;
  id v11 = v4;
  id v6 = v4;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __77__HKSampleTypeUpdateController__handleHighFrequencyObserverCallbacksForType___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "updateController:didReceiveHighFrequencyUpdateForType:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)_errorRecoveryCallbacksForType:(id)a3
{
  id v6 = a3;
  uint64_t v4 = [(HKSampleTypeUpdateController *)self _observersForType:v6];
  uint64_t v5 = [v4 allObjects];
  [(HKSampleTypeUpdateController *)self _callObservers:v5 withType:v6 samplesAdded:MEMORY[0x1E4F1CBF0] objectsRemoved:MEMORY[0x1E4F1CBF0] recoveringFromError:1];

  if ([(HKSampleTypeUpdateController *)self _isHighFrequencyDataType:v6]) {
    [(HKSampleTypeUpdateController *)self _handleHighFrequencyObserverCallbacksForType:v6];
  }
}

- (void)_applicationMovingToBackground:(id)a3
{
  self->_applicationIsInBackground = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_throttlePollTimer, 0);
  objc_storeStrong((id *)&self->_throttledDataBySampleType, 0);
  objc_storeStrong((id *)&self->_observersByType, 0);
  objc_storeStrong((id *)&self->_queryStatesByType, 0);
  objc_storeStrong((id *)&self->_outstandingQueriesByType, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_handleQueryErrorForType:(void *)a1 error:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v1 = a1;
  int v3 = 138543362;
  id v4 = (id)objc_opt_class();
  id v2 = v4;
  _os_log_error_impl(&dword_1E0B26000, v1, OS_LOG_TYPE_ERROR, "%{public}@: Error occurred in background.  Query will be resumed in foreground", (uint8_t *)&v3, 0xCu);
}

void __63__HKSampleTypeUpdateController__handleQueryErrorForType_error___block_invoke_cold_1(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  id v4 = objc_opt_class();
  uint64_t v5 = *(void **)(a1 + 40);
  id v6 = v4;
  long long v7 = [v5 identifier];
  int v8 = 138543619;
  long long v9 = v4;
  __int16 v10 = 2113;
  id v11 = v7;
  _os_log_error_impl(&dword_1E0B26000, v3, OS_LOG_TYPE_ERROR, "%{public}@: Resuming failed query from foreground (%{private}@)", (uint8_t *)&v8, 0x16u);
}

@end