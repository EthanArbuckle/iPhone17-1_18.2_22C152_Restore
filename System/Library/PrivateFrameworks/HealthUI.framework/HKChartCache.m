@interface HKChartCache
- (BOOL)shouldBufferFetchOperations;
- (HKChartCache)init;
- (HKChartCacheDataSource)dataSource;
- (HKChartCachePriorityDelegate)priorityDelegateForBufferedIdentifiers;
- (HKOutstandingFetchOperationManager)operationManager;
- (NSArray)bufferedIdentifiers;
- (id)_operationForIdentifier:(id)a3 priorityDelegate:(id)a4;
- (id)cachedResultsForIdentifier:(id)a3;
- (id)dataSourceRespectingType;
- (int64_t)maxRetryCount;
- (unint64_t)stateForIdentifier:(id)a3;
- (void)_addFetchOperationsForIdentifiers:(id)a3 priorityDelegate:(id)a4;
- (void)_alertObserversDidUpdateResults;
- (void)_handleOperationCompletionWithOperation:(id)a3 identifier:(id)a4 priorityDelegate:(id)a5 results:(id)a6 error:(id)a7;
- (void)_removeFetchOperationsForIdentifiers:(id)a3;
- (void)addObserver:(id)a3;
- (void)fetchResultsForIdentifiers:(id)a3 priorityDelegate:(id)a4;
- (void)invalidateCache;
- (void)invalidateResultsForIdentifiers:(id)a3;
- (void)removeObserver:(id)a3;
- (void)setBufferedIdentifiers:(id)a3;
- (void)setDataSource:(id)a3;
- (void)setMaxRetryCount:(int64_t)a3;
- (void)setOperationManager:(id)a3;
- (void)setPriorityDelegateForBufferedIdentifiers:(id)a3;
- (void)setShouldBufferFetchOperations:(BOOL)a3;
@end

@implementation HKChartCache

- (HKChartCache)init
{
  v13.receiver = self;
  v13.super_class = (Class)HKChartCache;
  v2 = [(HKChartCache *)&v13 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    observers = v2->_observers;
    v2->_observers = (NSHashTable *)v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cachedResultsByIdentifier = v2->_cachedResultsByIdentifier;
    v2->_cachedResultsByIdentifier = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    resultsLoadedByIdentifier = v2->_resultsLoadedByIdentifier;
    v2->_resultsLoadedByIdentifier = v7;

    v9 = objc_alloc_init(_HKChartCachePendingFetchOperationManager);
    pendingFetchOperationsManager = v2->_pendingFetchOperationsManager;
    v2->_pendingFetchOperationsManager = v9;

    v2->_shouldBufferFetchOperations = 0;
    bufferedIdentifiers = v2->_bufferedIdentifiers;
    v2->_maxRetryCount = 3;
    v2->_bufferedIdentifiers = 0;

    objc_storeWeak((id *)&v2->_priorityDelegateForBufferedIdentifiers, 0);
  }
  return v2;
}

- (id)dataSourceRespectingType
{
  return self->_dataSource;
}

- (void)setShouldBufferFetchOperations:(BOOL)a3
{
  BOOL shouldBufferFetchOperations = self->_shouldBufferFetchOperations;
  self->_BOOL shouldBufferFetchOperations = a3;
  if (shouldBufferFetchOperations != a3 && !a3)
  {
    v5 = [(HKChartCache *)self bufferedIdentifiers];

    if (v5)
    {
      v6 = [(HKChartCache *)self bufferedIdentifiers];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_priorityDelegateForBufferedIdentifiers);
      [(HKChartCache *)self fetchResultsForIdentifiers:v6 priorityDelegate:WeakRetained];

      [(HKChartCache *)self setBufferedIdentifiers:0];
      [(HKChartCache *)self setPriorityDelegateForBufferedIdentifiers:0];
    }
  }
}

- (void)addObserver:(id)a3
{
}

- (void)removeObserver:(id)a3
{
}

- (void)_alertObserversDidUpdateResults
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v3 = self->_observers;
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
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "chartCacheDidUpdate:", self, (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSHashTable *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (unint64_t)stateForIdentifier:(id)a3
{
  uint64_t v3 = [(NSMutableDictionary *)self->_resultsLoadedByIdentifier objectForKeyedSubscript:a3];
  uint64_t v4 = v3;
  if (v3)
  {
    if ([v3 BOOLValue]) {
      unint64_t v5 = 2;
    }
    else {
      unint64_t v5 = 1;
    }
  }
  else
  {
    unint64_t v5 = 0;
  }

  return v5;
}

- (id)cachedResultsForIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_cachedResultsByIdentifier objectForKeyedSubscript:a3];
}

- (void)fetchResultsForIdentifiers:(id)a3 priorityDelegate:(id)a4
{
  id v12 = a3;
  if (self->_shouldBufferFetchOperations)
  {
    id v6 = a4;
    uint64_t v7 = [(HKChartCache *)self bufferedIdentifiers];

    if (v7)
    {
      long long v8 = [(HKChartCache *)self bufferedIdentifiers];
      long long v9 = [v8 arrayByAddingObjectsFromArray:v12];
      [(HKChartCache *)self setBufferedIdentifiers:v9];
    }
    else
    {
      [(HKChartCache *)self setBufferedIdentifiers:v12];
    }
    [(HKChartCache *)self setPriorityDelegateForBufferedIdentifiers:v6];
  }
  else
  {
    long long v10 = (void *)MEMORY[0x1E4F1CA80];
    id v11 = a4;
    id v6 = [v10 setWithArray:v12];
    [(HKChartCache *)self _addFetchOperationsForIdentifiers:v6 priorityDelegate:v11];
  }
}

- (void)_removeFetchOperationsForIdentifiers:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = -[_HKChartCachePendingFetchOperationManager fetchOperationForIdentifier:](self->_pendingFetchOperationsManager, "fetchOperationForIdentifier:", *(void *)(*((void *)&v12 + 1) + 8 * v10), (void)v12);
        [v5 addObject:v11];
        [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager removeFetchOperation:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }

  [(HKOutstandingFetchOperationManager *)self->_operationManager removeFetchOperations:v5];
}

- (void)_addFetchOperationsForIdentifiers:(id)a3 priorityDelegate:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v20;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v20 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void *)(*((void *)&v19 + 1) + 8 * v13);
        if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
        {
          uint64_t v17 = [MEMORY[0x1E4F28B00] currentHandler];
          [v17 handleFailureInMethod:a2 object:self file:@"HKChartCache.m" lineNumber:157 description:@"HKChartCache: fetch operation requested on non-main thread"];
        }
        if (![(HKChartCache *)self stateForIdentifier:v14])
        {
          uint64_t v15 = [(HKChartCache *)self _operationForIdentifier:v14 priorityDelegate:v7];
          if (v15)
          {
            v16 = (void *)v15;
            [v8 addObject:v15];
            [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager addFetchOperation:v16];
            [(NSMutableDictionary *)self->_resultsLoadedByIdentifier setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:v14];
          }
        }
        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v11);
  }

  [(HKOutstandingFetchOperationManager *)self->_operationManager addFetchOperations:v8];
}

- (void)invalidateResultsForIdentifiers:(id)a3
{
  [(NSMutableDictionary *)self->_resultsLoadedByIdentifier removeObjectsForKeys:a3];
  [(HKChartCache *)self _alertObserversDidUpdateResults];
}

- (void)invalidateCache
{
  [(NSMutableDictionary *)self->_resultsLoadedByIdentifier removeAllObjects];
  [(HKChartCache *)self _alertObserversDidUpdateResults];
}

- (id)_operationForIdentifier:(id)a3 priorityDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  dataSource = self->_dataSource;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke;
  v16 = &unk_1E6D56010;
  objc_copyWeak(&v19, &location);
  id v9 = v6;
  id v17 = v9;
  id v10 = v7;
  id v18 = v10;
  uint64_t v11 = [(HKChartCacheDataSource *)dataSource operationForIdentifier:v9 priorityDelegate:v10 completion:&v13];
  objc_msgSend(v11, "setIdentifier:", v9, v13, v14, v15, v16);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);

  return v11;
}

void __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke(id *a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke_2;
  v13[3] = &unk_1E6D55870;
  objc_copyWeak(&v19, a1 + 6);
  id v14 = v7;
  id v15 = a1[4];
  id v16 = a1[5];
  id v17 = v8;
  id v18 = v9;
  id v10 = v9;
  id v11 = v8;
  id v12 = v7;
  dispatch_async(MEMORY[0x1E4F14428], v13);

  objc_destroyWeak(&v19);
}

void __57__HKChartCache__operationForIdentifier_priorityDelegate___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 72));
  [WeakRetained _handleOperationCompletionWithOperation:*(void *)(a1 + 32) identifier:*(void *)(a1 + 40) priorityDelegate:*(void *)(a1 + 48) results:*(void *)(a1 + 56) error:*(void *)(a1 + 64)];
}

- (void)_handleOperationCompletionWithOperation:(id)a3 identifier:(id)a4 priorityDelegate:(id)a5 results:(id)a6 error:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager removeFetchOperation:a3];
  if (v15)
  {
    _HKInitializeLogging();
    id v16 = (NSObject **)MEMORY[0x1E4F29F28];
    id v17 = *MEMORY[0x1E4F29F28];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29F28], OS_LOG_TYPE_ERROR)) {
      -[HKChartCache _handleOperationCompletionWithOperation:identifier:priorityDelegate:results:error:]((uint64_t)self, (uint64_t)v15, v17);
    }
    [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager incrementRetryCountForIdentifier:v12];
    uint64_t v18 = [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager retryCountForIdentifier:v12];
    int64_t maxRetryCount = self->_maxRetryCount;
    _HKInitializeLogging();
    long long v20 = *v16;
    long long v21 = *v16;
    if (v18 <= maxRetryCount)
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        int v24 = 138412546;
        id v25 = v12;
        __int16 v26 = 2048;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1E0B26000, v20, OS_LOG_TYPE_DEFAULT, "[HKCC] Retrying fetch operation for identifier (%@) retry count (%ld)", (uint8_t *)&v24, 0x16u);
      }
      v23 = [MEMORY[0x1E4F1CAD0] setWithObject:v12];
      [(HKChartCache *)self _addFetchOperationsForIdentifiers:v23 priorityDelegate:v13];
    }
    else
    {
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[HKChartCache _handleOperationCompletionWithOperation:identifier:priorityDelegate:results:error:]((uint64_t)v12, v18, v20);
      }
      [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager resetRetryCountForIdentifier:v12];
    }
  }
  else
  {
    cachedResultsByIdentifier = self->_cachedResultsByIdentifier;
    if (v14) {
      [(NSMutableDictionary *)cachedResultsByIdentifier setObject:v14 forKeyedSubscript:v12];
    }
    else {
      [(NSMutableDictionary *)cachedResultsByIdentifier removeObjectForKey:v12];
    }
    [(NSMutableDictionary *)self->_resultsLoadedByIdentifier setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:v12];
    [(_HKChartCachePendingFetchOperationManager *)self->_pendingFetchOperationsManager resetRetryCountForIdentifier:v12];
    [(HKChartCache *)self _alertObserversDidUpdateResults];
  }
}

- (HKChartCacheDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (HKOutstandingFetchOperationManager)operationManager
{
  return self->_operationManager;
}

- (void)setOperationManager:(id)a3
{
}

- (BOOL)shouldBufferFetchOperations
{
  return self->_shouldBufferFetchOperations;
}

- (int64_t)maxRetryCount
{
  return self->_maxRetryCount;
}

- (void)setMaxRetryCount:(int64_t)a3
{
  self->_int64_t maxRetryCount = a3;
}

- (NSArray)bufferedIdentifiers
{
  return self->_bufferedIdentifiers;
}

- (void)setBufferedIdentifiers:(id)a3
{
}

- (HKChartCachePriorityDelegate)priorityDelegateForBufferedIdentifiers
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_priorityDelegateForBufferedIdentifiers);
  return (HKChartCachePriorityDelegate *)WeakRetained;
}

- (void)setPriorityDelegateForBufferedIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_priorityDelegateForBufferedIdentifiers);
  objc_storeStrong((id *)&self->_bufferedIdentifiers, 0);
  objc_storeStrong((id *)&self->_operationManager, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_resultsLoadedByIdentifier, 0);
  objc_storeStrong((id *)&self->_pendingFetchOperationsManager, 0);
  objc_storeStrong((id *)&self->_cachedResultsByIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

- (void)_handleOperationCompletionWithOperation:(NSObject *)a3 identifier:priorityDelegate:results:error:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2048;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "[HKCC] Fetch operation for identifier (%@) surpassed max retry count (%ld). Failing.", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)_handleOperationCompletionWithOperation:(NSObject *)a3 identifier:priorityDelegate:results:error:.cold.2(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = *(void *)(a1 + 48);
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  OUTLINED_FUNCTION_1_2(&dword_1E0B26000, a2, a3, "[HKCC] Error fetching results from data source %@: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

@end