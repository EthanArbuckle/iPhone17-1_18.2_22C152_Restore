@interface HKSampleTypeDateRangeController
- (HKSampleTypeDateRangeController)initWithHealthStore:(id)a3;
- (NSDictionary)dateRangesBySampleType;
- (NSString)name;
- (id)_dateRangeSampleTypeForSampleType:(id)a3;
- (id)dateRangeForSampleType:(id)a3;
- (void)_alertObserverDidUpdateDateRanges:(id)a3;
- (void)_alertObserversDidUpdateDateRanges;
- (void)_applicationMovingToBackground:(id)a3;
- (void)_applicationMovingToForeground:(id)a3;
- (void)_beginUpdates;
- (void)_resultsDidUpdate:(id)a3;
- (void)_updateHandlerDidReceiveError:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)removeObserver:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HKSampleTypeDateRangeController

void __53__HKSampleTypeDateRangeController__resultsDidUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v9 = [v5 startDate];
  v7 = [v5 endDate];

  v8 = +[HKValueRange valueRangeWithMinValue:v9 maxValue:v7];
  [*(id *)(a1 + 32) setObject:v8 forKeyedSubscript:v6];
}

- (HKSampleTypeDateRangeController)initWithHealthStore:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKSampleTypeDateRangeController;
  id v6 = [(HKSampleTypeDateRangeController *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_healthStore, a3);
    uint64_t v8 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v8;

    *(_WORD *)&v7->_applicationIsInForeground = 1;
    v10 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v10 addObserver:v7 selector:sel__applicationMovingToForeground_ name:*MEMORY[0x1E4FB2730] object:0];

    v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 addObserver:v7 selector:sel__applicationMovingToBackground_ name:*MEMORY[0x1E4FB2640] object:0];

    [(HKSampleTypeDateRangeController *)v7 _beginUpdates];
  }

  return v7;
}

- (void)_beginUpdates
{
  objc_initWeak(&location, self);
  id v3 = objc_alloc(MEMORY[0x1E4F2B8B0]);
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke;
  v10 = &unk_1E6D53678;
  objc_copyWeak(&v11, &location);
  v4 = (_HKDateRangeQuery *)[v3 initWithDateIntervalHandler:&v7];
  dateRangeQuery = self->_dateRangeQuery;
  self->_dateRangeQuery = v4;

  id v6 = [(HKSampleTypeDateRangeController *)self name];
  [(_HKDateRangeQuery *)self->_dateRangeQuery setDebugIdentifier:v6];

  [(HKHealthStore *)self->_healthStore executeQuery:self->_dateRangeQuery];
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

- (NSString)name
{
  return self->_name;
}

- (void)_applicationMovingToForeground:(id)a3
{
  self->_applicationIsInForeground = 1;
  if (self->_lastQuerySufferedError) {
    [(HKSampleTypeDateRangeController *)self _beginUpdates];
  }
}

void __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v4 = WeakRetained;
  if (v2) {
    [WeakRetained _updateHandlerDidReceiveError:*(void *)(a1 + 32)];
  }
  else {
    [WeakRetained _resultsDidUpdate:*(void *)(a1 + 40)];
  }
}

- (void)_resultsDidUpdate:(id)a3
{
  self->_lastQuerySufferedError = 0;
  id v4 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__HKSampleTypeDateRangeController__resultsDidUpdate___block_invoke;
  v10[3] = &unk_1E6D536A0;
  uint64_t v7 = (NSDictionary *)v6;
  id v11 = v7;
  [v5 enumerateKeysAndObjectsUsingBlock:v10];

  dateRangesBySampleType = self->_dateRangesBySampleType;
  self->_dateRangesBySampleType = v7;
  id v9 = v7;

  [(HKSampleTypeDateRangeController *)self _alertObserversDidUpdateDateRanges];
}

- (void)_alertObserversDidUpdateDateRanges
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 24);
  id v4 = a2;
  int v5 = 134218240;
  uint64_t v6 = a1;
  __int16 v7 = 2048;
  uint64_t v8 = [v3 count];
  _os_log_debug_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEBUG, "HKSampleTypeDateRangeController(%p): ChartDataUpdate: Alerting %ld observers of new date ranges", (uint8_t *)&v5, 0x16u);
}

void __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__HKSampleTypeDateRangeController__beginUpdates__block_invoke_2;
  block[3] = &unk_1E6D53650;
  id v11 = v7;
  id v8 = v7;
  objc_copyWeak(&v13, (id *)(a1 + 32));
  id v12 = v6;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v13);
}

- (void)dealloc
{
  [(HKHealthStore *)self->_healthStore stopQuery:self->_dateRangeQuery];
  v3.receiver = self;
  v3.super_class = (Class)HKSampleTypeDateRangeController;
  [(HKSampleTypeDateRangeController *)&v3 dealloc];
}

- (id)dateRangeForSampleType:(id)a3
{
  id v4 = [(HKSampleTypeDateRangeController *)self _dateRangeSampleTypeForSampleType:a3];
  int v5 = [(NSDictionary *)self->_dateRangesBySampleType objectForKeyedSubscript:v4];
  id v6 = v5;
  if (v5) {
    id v7 = v5;
  }
  else {
    id v7 = objc_alloc_init(HKValueRange);
  }
  id v8 = v7;

  return v8;
}

- (id)_dateRangeSampleTypeForSampleType:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  int v5 = (void *)*MEMORY[0x1E4F2BA18];

  if (v4 == v5)
  {
    id v6 = [MEMORY[0x1E4F2ACB8] categoryTypeForIdentifier:*MEMORY[0x1E4F29870]];
  }
  else
  {
    id v6 = v3;
  }
  id v7 = v6;

  return v7;
}

- (void)_applicationMovingToBackground:(id)a3
{
  self->_applicationIsInForeground = 0;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  [(NSHashTable *)self->_observers addObject:v4];
  if (self->_dateRangesBySampleType)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __47__HKSampleTypeDateRangeController_addObserver___block_invoke;
    v5[3] = &unk_1E6D513B0;
    v5[4] = self;
    id v6 = v4;
    dispatch_async(MEMORY[0x1E4F14428], v5);
  }
}

uint64_t __47__HKSampleTypeDateRangeController_addObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _alertObserverDidUpdateDateRanges:*(void *)(a1 + 40)];
}

- (void)removeObserver:(id)a3
{
}

- (void)_alertObserverDidUpdateDateRanges:(id)a3
{
}

- (void)_updateHandlerDidReceiveError:(id)a3
{
  id v4 = a3;
  self->_lastQuerySufferedError = 1;
  [(HKHealthStore *)self->_healthStore stopQuery:self->_dateRangeQuery];
  dateRangeQuery = self->_dateRangeQuery;
  self->_dateRangeQuery = 0;

  if (self->_applicationIsInForeground && (HKIsUnitTesting() & 1) == 0)
  {
    _HKInitializeLogging();
    id v7 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      [(HKSampleTypeDateRangeController *)v7 _updateHandlerDidReceiveError:(uint64_t)v4];
    }
    dispatch_time_t v8 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__HKSampleTypeDateRangeController__updateHandlerDidReceiveError___block_invoke;
    block[3] = &unk_1E6D50ED8;
    void block[4] = self;
    dispatch_after(v8, MEMORY[0x1E4F14428], block);
  }
  else
  {
    _HKInitializeLogging();
    id v6 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      [(HKSampleTypeDateRangeController *)v6 _updateHandlerDidReceiveError:(uint64_t)v4];
    }
  }
}

uint64_t __65__HKSampleTypeDateRangeController__updateHandlerDidReceiveError___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginUpdates];
}

- (void)setName:(id)a3
{
}

- (NSDictionary)dateRangesBySampleType
{
  return self->_dateRangesBySampleType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateRangesBySampleType, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_dateRangeQuery, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
}

- (void)_updateHandlerDidReceiveError:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v6 = 138543618;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2114;
  uint64_t v9 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Ignoring background date range error: %{public}@", (uint8_t *)&v6, 0x16u);
}

- (void)_updateHandlerDidReceiveError:(uint64_t)a3 .cold.2(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v6 = 138543874;
  id v7 = (id)objc_opt_class();
  __int16 v8 = 2048;
  uint64_t v9 = 0x3FE0000000000000;
  __int16 v10 = 2114;
  uint64_t v11 = a3;
  id v5 = v7;
  _os_log_error_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_ERROR, "%{public}@: Retrying after %lg seconds due to foreground date range error: %{public}@", (uint8_t *)&v6, 0x20u);
}

@end