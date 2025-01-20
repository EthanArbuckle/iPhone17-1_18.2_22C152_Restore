@interface HDHeartRateWidgetDataManager
- (BOOL)_isFirstSampleHeartRate:(id)a3;
- (BOOL)_isFirstSampleWorkout:(id)a3;
- (BOOL)_isSampleFromWatch:(id)a3;
- (HDHeartRateWidgetDataManager)initWithProfile:(id)a3;
- (HKSampleType)workoutType;
- (void)_queue_reloadHRWidgets;
- (void)_queue_reloadRelevances;
- (void)_queue_reloadWorkoutHRWidgets;
- (void)_reloadWidgetsWithReason:(int64_t)a3;
- (void)_reloadWorkoutRelevanceAndWidgetWithReason:(int64_t)a3;
- (void)_startObservingHeartRateSamples;
- (void)_startObservingWorkoutSamples;
- (void)_stopObservingHeartRateSamples;
- (void)_stopObservingWorkoutSamples;
- (void)daemonReady:(id)a3;
- (void)dealloc;
- (void)samplesAdded:(id)a3 anchor:(id)a4;
- (void)setWorkoutType:(id)a3;
@end

@implementation HDHeartRateWidgetDataManager

- (HDHeartRateWidgetDataManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)HDHeartRateWidgetDataManager;
  v5 = [(HDHeartRateWidgetDataManager *)&v28 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_profile, v4);
    uint64_t v7 = [MEMORY[0x1E4F2B448] workoutType];
    workoutType = v6->_workoutType;
    v6->_workoutType = (HKSampleType *)v7;

    uint64_t v9 = HKCreateSerialDispatchQueue();
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v9;

    id WeakRetained = objc_loadWeakRetained((id *)&v6->_profile);
    v12 = [WeakRetained daemon];
    [v12 registerDaemonReadyObserver:v6 queue:v6->_queue];

    objc_initWeak(&location, v6);
    id v13 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v14 = v6->_queue;
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke;
    v25[3] = &unk_1E69B4A60;
    objc_copyWeak(&v26, &location);
    uint64_t v15 = [v13 initWithMode:0 clock:1 queue:v14 delay:v25 block:30.0];
    reloadOperation = v6->_reloadOperation;
    v6->_reloadOperation = (_HKDelayedOperation *)v15;

    id v17 = objc_alloc(MEMORY[0x1E4F2B8C8]);
    v18 = v6->_queue;
    double v19 = *MEMORY[0x1E4F67D80];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke_2;
    v23[3] = &unk_1E69B4A60;
    objc_copyWeak(&v24, &location);
    uint64_t v20 = [v17 initWithMode:0 clock:1 queue:v18 delay:v23 block:v19];
    relevanceReloadOperation = v6->_relevanceReloadOperation;
    v6->_relevanceReloadOperation = (_HKDelayedOperation *)v20;

    objc_destroyWeak(&v24);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadHRWidgets");
}

void __48__HDHeartRateWidgetDataManager_initWithProfile___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_queue_reloadRelevances");
}

- (void)dealloc
{
  [(HDHeartRateWidgetDataManager *)self _stopObservingHeartRateSamples];
  [(HDHeartRateWidgetDataManager *)self _stopObservingWorkoutSamples];
  v3.receiver = self;
  v3.super_class = (Class)HDHeartRateWidgetDataManager;
  [(HDHeartRateWidgetDataManager *)&v3 dealloc];
}

- (void)_startObservingHeartRateSamples
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  [v3 addObserver:self forDataType:v4];
}

- (void)_stopObservingHeartRateSamples
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  id v4 = [MEMORY[0x1E4F2B448] quantityTypeForIdentifier:*MEMORY[0x1E4F2A828]];
  [v3 removeObserver:self forDataType:v4];
}

- (void)_startObservingWorkoutSamples
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  [v3 addObserver:self forDataType:self->_workoutType];
}

- (void)_stopObservingWorkoutSamples
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  objc_super v3 = [WeakRetained dataManager];
  [v3 removeObserver:self forDataType:self->_workoutType];
}

- (void)daemonReady:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _HKInitializeLogging();
  id v4 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    v5 = v4;
    *(_DWORD *)buf = 138543362;
    id v12 = (id)objc_opt_class();
    id v6 = v12;
    _os_log_impl(&dword_1D3AC6000, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] daemonReady", buf, 0xCu);
  }
  [(HDHeartRateWidgetDataManager *)self _startObservingHeartRateSamples];
  [(HDHeartRateWidgetDataManager *)self _startObservingWorkoutSamples];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v8 = [WeakRetained database];
  queue = self->_queue;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __44__HDHeartRateWidgetDataManager_daemonReady___block_invoke;
  v10[3] = &unk_1E69B41B8;
  v10[4] = self;
  [v8 performWhenDataProtectedByFirstUnlockIsAvailableOnQueue:queue block:v10];
}

uint64_t __44__HDHeartRateWidgetDataManager_daemonReady___block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v2 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v3 = v2;
    *(_DWORD *)id v6 = 138543362;
    *(void *)&v6[4] = objc_opt_class();
    id v4 = *(id *)&v6[4];
    _os_log_impl(&dword_1D3AC6000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] first unlock occurred", v6, 0xCu);
  }
  objc_msgSend(*(id *)(a1 + 32), "_reloadWidgetsWithReason:", 0, *(_OWORD *)v6);
  return [*(id *)(a1 + 32) _reloadWorkoutRelevanceAndWidgetWithReason:0];
}

- (void)_reloadWidgetsWithReason:(int64_t)a3
{
  queue = self->_queue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__HDHeartRateWidgetDataManager__reloadWidgetsWithReason___block_invoke;
  v4[3] = &unk_1E69B4A88;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __57__HDHeartRateWidgetDataManager__reloadWidgetsWithReason___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
  return [*(id *)(*(void *)(a1 + 32) + 32) execute];
}

- (void)_reloadWorkoutRelevanceAndWidgetWithReason:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v5 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    uint64_t v7 = objc_opt_class();
    id v8 = v7;
    uint64_t v9 = HDStringFromHeartRateWidgetDataManagerReloadReason(a3);
    *(_DWORD *)buf = 138543618;
    uint64_t v13 = v7;
    __int16 v14 = 2112;
    uint64_t v15 = v9;
    _os_log_impl(&dword_1D3AC6000, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] _reloadWorkoutRelevanceAndWidgetWithReason reason %@", buf, 0x16u);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __75__HDHeartRateWidgetDataManager__reloadWorkoutRelevanceAndWidgetWithReason___block_invoke;
  v11[3] = &unk_1E69B4A88;
  v11[4] = self;
  v11[5] = a3;
  dispatch_async(queue, v11);
}

uint64_t __75__HDHeartRateWidgetDataManager__reloadWorkoutRelevanceAndWidgetWithReason___block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = *(void *)(a1 + 40);
  [*(id *)(*(void *)(a1 + 32) + 40) execute];
  v2 = *(void **)(a1 + 32);

  return objc_msgSend(v2, "_queue_reloadWorkoutHRWidgets");
}

- (void)_queue_reloadHRWidgets
{
}

- (void)_queue_reloadWorkoutHRWidgets
{
}

- (void)_queue_reloadRelevances
{
}

- (void)samplesAdded:(id)a3 anchor:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  _HKInitializeLogging();
  id v6 = (void *)*MEMORY[0x1E4F29F48];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F48], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = v6;
    *(_DWORD *)buf = 138543362;
    id v32 = (id)objc_opt_class();
    id v8 = v32;
    _os_log_impl(&dword_1D3AC6000, v7, OS_LOG_TYPE_DEFAULT, "[%{public}@] samplesAdded", buf, 0xCu);
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([(HDHeartRateWidgetDataManager *)self _isFirstSampleHeartRate:v5])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v26;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v26 != v13) {
            objc_enumerationMutation(v10);
          }
          uint64_t v15 = *(void *)(*((void *)&v25 + 1) + 8 * i);
          if ([(HDHeartRateWidgetDataManager *)self _isSampleFromWatch:v15]) {
            [v9 addObject:v15];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v30 count:16];
      }
      while (v12);
    }

    if ([v9 count]) {
      [(HDHeartRateWidgetDataManager *)self _reloadWidgetsWithReason:1];
    }
  }
  if ([(HDHeartRateWidgetDataManager *)self _isFirstSampleWorkout:v5])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v16 = v5;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v22;
      while (2)
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v22 != v19) {
            objc_enumerationMutation(v16);
          }
          if (-[HDHeartRateWidgetDataManager _isSampleFromWatch:](self, "_isSampleFromWatch:", *(void *)(*((void *)&v21 + 1) + 8 * j), (void)v21))
          {
            [(HDHeartRateWidgetDataManager *)self _reloadWorkoutRelevanceAndWidgetWithReason:2];
            goto LABEL_26;
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v18) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
}

- (BOOL)_isSampleFromWatch:(id)a3
{
  objc_super v3 = [a3 _source];
  char v4 = [v3 _isAppleWatch];

  return v4;
}

- (BOOL)_isFirstSampleHeartRate:(id)a3
{
  objc_super v3 = [a3 firstObject];
  char v4 = [v3 sampleType];
  id v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F2A828]];

  return v6;
}

- (BOOL)_isFirstSampleWorkout:(id)a3
{
  objc_super v3 = [a3 firstObject];
  char v4 = [v3 sampleType];
  id v5 = [v4 identifier];
  char v6 = [v5 isEqualToString:*MEMORY[0x1E4F2AB78]];

  return v6;
}

- (HKSampleType)workoutType
{
  return self->_workoutType;
}

- (void)setWorkoutType:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workoutType, 0);
  objc_storeStrong((id *)&self->_relevanceReloadOperation, 0);
  objc_storeStrong((id *)&self->_reloadOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_destroyWeak((id *)&self->_profile);
}

@end