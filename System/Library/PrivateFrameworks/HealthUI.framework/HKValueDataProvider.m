@interface HKValueDataProvider
- (BOOL)_currentlyFetchingValue;
- (BOOL)_requiresValueFetch;
- (BOOL)hasLoadedData;
- (HKDateCache)dateCache;
- (HKDisplayType)displayType;
- (HKHealthStore)healthStore;
- (HKValueDataProvider)initWithHealthStore:(id)a3 updateController:(id)a4 dateCache:(id)a5 displayType:(id)a6;
- (id)currentValue;
- (id)fetchOperationWithCompletion:(id)a3;
- (id)secondaryValue;
- (id)value;
- (void)_alertObserversDidUpdateValues;
- (void)_fetchValueWithRetryCount:(int64_t)a3;
- (void)_handleUnitPreferencesDidChangeNotification:(id)a3;
- (void)_refreshValueIfNecessary;
- (void)_setNeedsReFetchValue;
- (void)_transitionToFetchFailure;
- (void)_updateValueWithValue:(id)a3;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidateValue;
- (void)removeObserver:(id)a3;
- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7;
@end

@implementation HKValueDataProvider

- (HKValueDataProvider)initWithHealthStore:(id)a3 updateController:(id)a4 dateCache:(id)a5 displayType:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)HKValueDataProvider;
  v15 = [(HKValueDataProvider *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_healthStore, a3);
    objc_storeStrong((id *)&v16->_dateCache, a5);
    uint64_t v17 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v16->_observers;
    v16->_observers = (NSHashTable *)v17;

    if (([v14 isActivitySummary] & 1) == 0)
    {
      v19 = [v14 sampleType];
      [v12 addObserver:v16 forType:v19];
    }
    v20 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v20 addObserver:v16 selector:sel__handleUnitPreferencesDidChangeNotification_ name:@"HKUnitPreferenceControllerUnitPreferencesDidChangeNotification" object:0];

    objc_storeStrong((id *)&v16->_displayType, a6);
    v16->_resultsLoaded = 0;
    [(HKDateCache *)v16->_dateCache registerObserver:v16];
  }

  return v16;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)HKValueDataProvider;
  [(HKValueDataProvider *)&v4 dealloc];
}

- (id)value
{
  [(HKValueDataProvider *)self _refreshValueIfNecessary];
  id value = self->_value;
  return value;
}

- (id)currentValue
{
  return 0;
}

- (id)secondaryValue
{
  return 0;
}

- (BOOL)hasLoadedData
{
  v3 = [(HKValueDataProvider *)self value];
  if (v3) {
    BOOL resultsLoaded = 1;
  }
  else {
    BOOL resultsLoaded = self->_resultsLoaded;
  }

  return resultsLoaded;
}

- (void)invalidateValue
{
  self->_BOOL resultsLoaded = 0;
  if ([(HKValueDataProvider *)self _currentlyFetchingValue]) {
    [(HKValueDataProvider *)self _setNeedsReFetchValue];
  }
  [(HKValueDataProvider *)self _alertObserversDidUpdateValues];
}

- (void)_setNeedsReFetchValue
{
  self->_needsToReFetchValue = 1;
}

- (BOOL)_currentlyFetchingValue
{
  return self->_outstandingFetchOperation != 0;
}

- (BOOL)_requiresValueFetch
{
  if (self->_resultsLoaded) {
    return 0;
  }
  else {
    return ![(HKValueDataProvider *)self _currentlyFetchingValue];
  }
}

- (void)_refreshValueIfNecessary
{
  if ([(HKValueDataProvider *)self _requiresValueFetch])
  {
    [(HKValueDataProvider *)self _fetchValueWithRetryCount:3];
  }
}

- (void)_fetchValueWithRetryCount:(int64_t)a3
{
  if (a3)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke;
    v7[3] = &unk_1E6D52D18;
    v7[4] = self;
    v7[5] = a3;
    objc_super v4 = [(HKValueDataProvider *)self fetchOperationWithCompletion:v7];
    outstandingFetchOperation = self->_outstandingFetchOperation;
    self->_outstandingFetchOperation = v4;

    [(HKFetchOperation *)self->_outstandingFetchOperation setHighPriority:1];
    v6 = +[HKOutstandingFetchOperationManager sharedOperationManager];
    [v6 addFetchOperation:self->_outstandingFetchOperation];
  }
  else
  {
    [(HKValueDataProvider *)self _transitionToFetchFailure];
  }
}

void __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2;
  v11[3] = &unk_1E6D52CF0;
  uint64_t v8 = *(void *)(a1 + 40);
  v11[4] = *(void *)(a1 + 32);
  id v12 = v7;
  id v13 = v6;
  uint64_t v14 = v8;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v11);
}

uint64_t __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2(uint64_t a1)
{
  v3 = (void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 32);
  objc_super v4 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  if (*(void *)(a1 + 40))
  {
    _HKInitializeLogging();
    v5 = (void *)*MEMORY[0x1E4F29FB0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_ERROR)) {
      __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2_cold_1(v3, v5, (uint64_t *)(a1 + 40));
    }
    return [*(id *)(a1 + 32) _fetchValueWithRetryCount:*(void *)(a1 + 56) - 1];
  }
  else
  {
    id v7 = *(void **)(a1 + 32);
    uint64_t v8 = *(void *)(a1 + 48);
    return [v7 _updateValueWithValue:v8];
  }
}

- (void)_transitionToFetchFailure
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  _HKInitializeLogging();
  v3 = (void *)*MEMORY[0x1E4F29FB0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FB0], OS_LOG_TYPE_DEFAULT))
  {
    objc_super v4 = v3;
    v5 = [(HKValueDataProvider *)self displayType];
    int v7 = 138543618;
    uint64_t v8 = self;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_1E0B26000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Reached max retry count for %@. Aborting", (uint8_t *)&v7, 0x16u);
  }
  outstandingFetchOperation = self->_outstandingFetchOperation;
  self->_outstandingFetchOperation = 0;

  self->_BOOL resultsLoaded = 0;
}

- (void)_updateValueWithValue:(id)a3
{
  objc_storeStrong(&self->_value, a3);
  self->_BOOL resultsLoaded = 1;
  if (self->_needsToReFetchValue)
  {
    *(_WORD *)&self->_BOOL resultsLoaded = 0;
    [(HKValueDataProvider *)self _fetchValueWithRetryCount:3];
  }
  [(HKValueDataProvider *)self didUpdateValue];
  [(HKValueDataProvider *)self _alertObserversDidUpdateValues];
}

- (void)updateController:(id)a3 didReceiveUpdateForType:(id)a4 samplesAdded:(id)a5 objectsRemoved:(id)a6 recoveringFromError:(BOOL)a7
{
  BOOL v7 = a7;
  id v10 = a6;
  if ([a5 count] || objc_msgSend(v10, "count") || v7) {
    [(HKValueDataProvider *)self invalidateValue];
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_alertObserversDidUpdateValues
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = self->_observers;
  uint64_t v4 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "dataProviderDidUpdateValues:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_handleUnitPreferencesDidChangeNotification:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__HKValueDataProvider__handleUnitPreferencesDidChangeNotification___block_invoke;
  v6[3] = &unk_1E6D513B0;
  id v7 = v4;
  long long v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __67__HKValueDataProvider__handleUnitPreferencesDidChangeNotification___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userInfo];
  id v7 = [v2 objectForKeyedSubscript:@"HKUnitPreferenceControllerUnitPreferenceChangedKey"];

  v3 = [*(id *)(a1 + 40) displayType];
  id v4 = [v3 sampleType];

  if (v4) {
    int v5 = [v7 containsObject:v4];
  }
  else {
    int v5 = 0;
  }
  if ([v7 count]) {
    BOOL v6 = v5 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (!v6) {
    [*(id *)(a1 + 40) unitPreferencesDidUpdate];
  }
}

- (HKHealthStore)healthStore
{
  return self->_healthStore;
}

- (HKDateCache)dateCache
{
  return self->_dateCache;
}

- (HKDisplayType)displayType
{
  return self->_displayType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayType, 0);
  objc_storeStrong((id *)&self->_dateCache, 0);
  objc_storeStrong((id *)&self->_healthStore, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_outstandingFetchOperation, 0);
  objc_storeStrong(&self->_value, 0);
}

- (id)fetchOperationWithCompletion:(id)a3
{
  return 0;
}

void __49__HKValueDataProvider__fetchValueWithRetryCount___block_invoke_2_cold_1(void **a1, void *a2, uint64_t *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = *a1;
  int v5 = a2;
  BOOL v6 = [v4 displayType];
  uint64_t v7 = *a3;
  int v8 = 138543874;
  long long v9 = v4;
  __int16 v10 = 2114;
  long long v11 = v6;
  __int16 v12 = 2114;
  uint64_t v13 = v7;
  _os_log_error_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_ERROR, "%{public}@: Received error fetching data for %{public}@: %{public}@", (uint8_t *)&v8, 0x20u);
}

@end