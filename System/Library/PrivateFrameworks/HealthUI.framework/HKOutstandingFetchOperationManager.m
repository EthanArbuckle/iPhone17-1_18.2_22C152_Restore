@interface HKOutstandingFetchOperationManager
+ (id)sharedOperationManager;
+ (void)setSharedOperationManager:(id)a3;
- (BOOL)_noHighPriorityActiveOperations;
- (BOOL)_removeFetchOperationFromActiveOperations:(id)a3;
- (BOOL)_removeFetchOperationFromPendingOperations:(id)a3;
- (HKOutstandingFetchOperationManager)initWithMaxConcurrentFetchOperations:(int64_t)a3;
- (int64_t)maxConcurrentFetchOperations;
- (void)_executeFetchOperation:(id)a3;
- (void)_fillActiveFetchOperations;
- (void)_logOperationCompletion:(id)a3;
- (void)_logOperationStart:(id)a3;
- (void)_rebalanceFetchOperations;
- (void)_setNeedsRebalanceFetchOperations;
- (void)addFetchOperation:(id)a3;
- (void)addFetchOperations:(id)a3;
- (void)fetchOperationDidUpdatePriority:(id)a3;
- (void)removeFetchOperation:(id)a3;
- (void)removeFetchOperations:(id)a3;
- (void)setMaxConcurrentFetchOperations:(int64_t)a3;
@end

@implementation HKOutstandingFetchOperationManager

+ (void)setSharedOperationManager:(id)a3
{
}

+ (id)sharedOperationManager
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HKOutstandingFetchOperationManager_sharedOperationManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedOperationManager_onceToken != -1) {
    dispatch_once(&sharedOperationManager_onceToken, block);
  }
  v2 = (void *)_outstandingFetchOperationManager;
  return v2;
}

void __60__HKOutstandingFetchOperationManager_sharedOperationManager__block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  v2 = [[HKOutstandingFetchOperationManager alloc] initWithMaxConcurrentFetchOperations:5];
  [v1 setSharedOperationManager:v2];
}

- (HKOutstandingFetchOperationManager)initWithMaxConcurrentFetchOperations:(int64_t)a3
{
  v13.receiver = self;
  v13.super_class = (Class)HKOutstandingFetchOperationManager;
  v4 = [(HKOutstandingFetchOperationManager *)&v13 init];
  v5 = v4;
  if (v4)
  {
    v4->_maxConcurrentFetchOperations = a3;
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingNormalPriorityFetchOperations = v5->_pendingNormalPriorityFetchOperations;
    v5->_pendingNormalPriorityFetchOperations = v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    pendingHighPriorityFetchOperations = v5->_pendingHighPriorityFetchOperations;
    v5->_pendingHighPriorityFetchOperations = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    activeFetchOperations = v5->_activeFetchOperations;
    v5->_activeFetchOperations = v10;
  }
  return v5;
}

- (void)setMaxConcurrentFetchOperations:(int64_t)a3
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  self->_maxConcurrentFetchOperations = a3;
  [(HKOutstandingFetchOperationManager *)self _setNeedsRebalanceFetchOperations];
}

- (void)addFetchOperations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HKOutstandingFetchOperationManager *)self addFetchOperation:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)addFetchOperation:(id)a3
{
  id v10 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v5 = [v10 _delegate];

  if (v5 != self)
  {
    uint64_t v6 = [v10 _delegate];

    if (v6)
    {
      long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
      [v9 handleFailureInMethod:a2, self, @"HKOutstandingFetchOperationManager.m", 103, @"Invalid parameter not satisfying: %@", @"[fetchOperation _delegate] == nil" object file lineNumber description];
    }
    [v10 _setDelegate:self];
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    objc_msgSend(v10, "setQueueTime:");
    int v7 = [v10 highPriority];
    uint64_t v8 = 16;
    if (v7) {
      uint64_t v8 = 24;
    }
    [*(id *)((char *)&self->super.isa + v8) addObject:v10];
    [(HKOutstandingFetchOperationManager *)self _setNeedsRebalanceFetchOperations];
  }
}

- (void)removeFetchOperations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        [(HKOutstandingFetchOperationManager *)self removeFetchOperation:*(void *)(*((void *)&v9 + 1) + 8 * v8++)];
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (void)removeFetchOperation:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(HKOutstandingFetchOperationManager *)self _removeFetchOperationFromPendingOperations:v4]|| [(HKOutstandingFetchOperationManager *)self _removeFetchOperationFromActiveOperations:v4])
  {
    [(HKOutstandingFetchOperationManager *)self _setNeedsRebalanceFetchOperations];
  }
}

- (BOOL)_removeFetchOperationFromPendingOperations:(id)a3
{
  id v4 = a3;
  p_pendingNormalPriorityFetchOperations = &self->_pendingNormalPriorityFetchOperations;
  uint64_t v6 = [(NSMutableArray *)self->_pendingNormalPriorityFetchOperations indexOfObject:v4];
  if (v6 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v6;
LABEL_6:
    long long v12 = [(NSMutableArray *)*p_pendingNormalPriorityFetchOperations objectAtIndexedSubscript:v11];
    [v12 _setDelegate:0];
    [(NSMutableArray *)*p_pendingNormalPriorityFetchOperations removeObjectAtIndex:v11];

    BOOL v10 = 1;
    goto LABEL_7;
  }
  pendingHighPriorityFetchOperations = self->_pendingHighPriorityFetchOperations;
  p_pendingHighPriorityFetchOperations = &self->_pendingHighPriorityFetchOperations;
  uint64_t v9 = [(NSMutableArray *)pendingHighPriorityFetchOperations indexOfObject:v4];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v9;
    p_pendingNormalPriorityFetchOperations = p_pendingHighPriorityFetchOperations;
    goto LABEL_6;
  }
  BOOL v10 = 0;
LABEL_7:

  return v10;
}

- (BOOL)_removeFetchOperationFromActiveOperations:(id)a3
{
  uint64_t v4 = [(NSMutableArray *)self->_activeFetchOperations indexOfObject:a3];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v5 = [(NSMutableArray *)self->_activeFetchOperations objectAtIndexedSubscript:v4];
    [v5 stopOperation];
    [v5 _setDelegate:0];
    [(NSMutableArray *)self->_activeFetchOperations removeObjectAtIndex:v4];
  }
  return v4 != 0x7FFFFFFFFFFFFFFFLL;
}

- (void)_setNeedsRebalanceFetchOperations
{
  if (!self->_needsRebalanceFetchOperations)
  {
    self->_needsRebalanceFetchOperations = 1;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __71__HKOutstandingFetchOperationManager__setNeedsRebalanceFetchOperations__block_invoke;
    block[3] = &unk_1E6D50ED8;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __71__HKOutstandingFetchOperationManager__setNeedsRebalanceFetchOperations__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rebalanceFetchOperations];
}

- (void)_rebalanceFetchOperations
{
  if (self->_needsRebalanceFetchOperations)
  {
    [(HKOutstandingFetchOperationManager *)self _fillActiveFetchOperations];
    self->_needsRebalanceFetchOperations = 0;
  }
}

- (void)_fillActiveFetchOperations
{
  for (i = self->_activeFetchOperations;
        (unint64_t)[(NSMutableArray *)i count] < self->_maxConcurrentFetchOperations
     && [(NSMutableArray *)self->_pendingHighPriorityFetchOperations count];
        i = self->_activeFetchOperations)
  {
    uint64_t v4 = [(NSMutableArray *)self->_pendingHighPriorityFetchOperations firstObject];
    [(HKOutstandingFetchOperationManager *)self _executeFetchOperation:v4];
    [(NSMutableArray *)self->_pendingHighPriorityFetchOperations removeObjectAtIndex:0];
  }
  if ([(HKOutstandingFetchOperationManager *)self _noHighPriorityActiveOperations])
  {
    while ((unint64_t)[(NSMutableArray *)self->_activeFetchOperations count] < self->_maxConcurrentFetchOperations
         && [(NSMutableArray *)self->_pendingNormalPriorityFetchOperations count])
    {
      uint64_t v5 = [(NSMutableArray *)self->_pendingNormalPriorityFetchOperations firstObject];
      [(HKOutstandingFetchOperationManager *)self _executeFetchOperation:v5];
      [(NSMutableArray *)self->_pendingNormalPriorityFetchOperations removeObjectAtIndex:0];
    }
  }
}

- (BOOL)_noHighPriorityActiveOperations
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v2 = self->_activeFetchOperations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "highPriority", (void)v9))
        {
          BOOL v7 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v7 = 1;
LABEL_11:

  return v7;
}

- (void)_executeFetchOperation:(id)a3
{
  id v4 = a3;
  [(HKOutstandingFetchOperationManager *)self _logOperationStart:v4];
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  objc_msgSend(v4, "setExecutionTime:");
  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  uint64_t v8 = __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke;
  long long v9 = &unk_1E6D556E8;
  long long v10 = self;
  id v11 = v4;
  id v5 = v4;
  [v5 startOperationWithCompletion:&v6];
  -[NSMutableArray addObject:](self->_activeFetchOperations, "addObject:", v5, v6, v7, v8, v9, v10);
}

void __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke_2;
  v2[3] = &unk_1E6D513B0;
  v1 = *(void **)(a1 + 40);
  v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __61__HKOutstandingFetchOperationManager__executeFetchOperation___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _logOperationCompletion:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) _removeFetchOperationFromActiveOperations:*(void *)(a1 + 40)];
  v2 = *(void **)(a1 + 32);
  return [v2 _setNeedsRebalanceFetchOperations];
}

- (void)_logOperationStart:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    id v4 = [v3 operationDescription];
  }
  else
  {
    id v4 = @"Redacted Description";
  }
  _HKInitializeLogging();
  id v5 = HKUILogCharting();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109378;
    v6[1] = [v3 highPriority];
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_1E0B26000, v5, OS_LOG_TYPE_DEFAULT, "ChartQuery: highpriority %d for %@", (uint8_t *)v6, 0x12u);
  }
}

- (void)_logOperationCompletion:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double v5 = v4;
  if ([MEMORY[0x1E4F2B860] isAppleInternalInstall])
  {
    uint64_t v6 = [v3 operationDescription];
  }
  else
  {
    uint64_t v6 = @"Redacted Description";
  }
  _HKInitializeLogging();
  __int16 v7 = HKUILogCharting();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    [v3 executionTime];
    double v9 = v5 - v8;
    [v3 executionTime];
    double v11 = v10;
    [v3 queueTime];
    int v13 = 134218498;
    double v14 = v9;
    __int16 v15 = 2048;
    double v16 = v11 - v12;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1E0B26000, v7, OS_LOG_TYPE_DEFAULT, "ChartQuery: running %lgs queued %lgs for %@", (uint8_t *)&v13, 0x20u);
  }
}

- (void)fetchOperationDidUpdatePriority:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  if ([(HKOutstandingFetchOperationManager *)self _removeFetchOperationFromPendingOperations:v4])
  {
    [(HKOutstandingFetchOperationManager *)self addFetchOperation:v4];
  }
}

- (int64_t)maxConcurrentFetchOperations
{
  return self->_maxConcurrentFetchOperations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeFetchOperations, 0);
  objc_storeStrong((id *)&self->_pendingHighPriorityFetchOperations, 0);
  objc_storeStrong((id *)&self->_pendingNormalPriorityFetchOperations, 0);
}

@end