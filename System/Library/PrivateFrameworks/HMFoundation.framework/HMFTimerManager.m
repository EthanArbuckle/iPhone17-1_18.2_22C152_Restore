@interface HMFTimerManager
- (BOOL)_cancelTimerManagerIfEmpty;
- (HMFTimerManager)initWithOptions:(unint64_t)a3;
- (HMFTimerManager)initWithOptions:(unint64_t)a3 dataSource:(id)a4;
- (HMFTimerManagerDelegate)delegate;
- (OS_dispatch_queue)delegateQueue;
- (id)_removeExpiredTimerContextsAndRefreshNextTimer;
- (id)startTimerWithTimeInterval:(double)a3 andReplaceObject:(id)a4;
- (id)startTimerWithTimeInterval:(double)a3 object:(id)a4;
- (id)startTimerWithTimeInterval:(double)a3 object:(id)a4 shouldReplace:(BOOL)a5;
- (void)_addTimerContext:(id)a3;
- (void)_refreshNextTimerIfNeededWithTimeInterval:(double)a3;
- (void)_removeTimerContext:(id)a3;
- (void)_removeTimerContextsWithMatchingObject:(id)a3;
- (void)cancelTimerForContext:(id)a3;
- (void)notifyDidFireForTimerContexts:(id)a3 shouldDispatch:(BOOL)a4;
- (void)refreshTimerManager;
- (void)refreshTimerManagerWithShouldDispatchNotifications:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setDelegateQueue:(id)a3;
- (void)timerDidFire:(id)a3;
@end

@implementation HMFTimerManager

- (void)setDelegateQueue:(id)a3
{
}

- (void)setDelegate:(id)a3
{
}

- (HMFTimerManager)initWithOptions:(unint64_t)a3
{
  v5 = objc_alloc_init(HMFTimerManagerDefaultDataSource);
  v6 = [(HMFTimerManager *)self initWithOptions:a3 dataSource:v5];

  return v6;
}

- (HMFTimerManager)initWithOptions:(unint64_t)a3 dataSource:(id)a4
{
  id v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)HMFTimerManager;
  v8 = [(HMFTimerManager *)&v18 init];
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    sortedTimerContexts = v9->_sortedTimerContexts;
    v9->_sortedTimerContexts = v10;

    nextTimer = v9->_nextTimer;
    v9->_nextTimer = 0;

    nextTimerContext = v9->_nextTimerContext;
    v9->_nextTimerContext = 0;

    v9->_options = a3;
    objc_storeStrong((id *)&v9->_dataSource, a4);
    v14 = (const char *)HMFDispatchQueueName(v9, 0);
    dispatch_queue_t v15 = dispatch_queue_create(v14, 0);
    delegateQueue = v9->_delegateQueue;
    v9->_delegateQueue = (OS_dispatch_queue *)v15;
  }
  return v9;
}

- (id)startTimerWithTimeInterval:(double)a3 object:(id)a4
{
  return [(HMFTimerManager *)self startTimerWithTimeInterval:a4 object:0 shouldReplace:a3];
}

- (id)startTimerWithTimeInterval:(double)a3 andReplaceObject:(id)a4
{
  return [(HMFTimerManager *)self startTimerWithTimeInterval:a4 object:1 shouldReplace:a3];
}

- (id)startTimerWithTimeInterval:(double)a3 object:(id)a4 shouldReplace:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  v9 = [HMFTimerManagerTimerContext alloc];
  [(HMFTimerManagerDataSource *)self->_dataSource currentTime];
  v11 = [(HMFTimerManagerTimerContext *)v9 initWithObject:v8 expirationTime:v10 + a3];
  os_unfair_lock_lock_with_options();
  if (v8 && v5) {
    [(HMFTimerManager *)self _removeTimerContextsWithMatchingObject:v8];
  }
  [(HMFTimerManager *)self _addTimerContext:v11];
  os_unfair_lock_unlock(&self->_lock);
  [(HMFTimerManager *)self refreshTimerManager];

  return v11;
}

- (void)cancelTimerForContext:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock_with_options();
  [(HMFTimerManager *)self _removeTimerContext:v4];
  os_unfair_lock_unlock(&self->_lock);
  [(HMFTimerManager *)self refreshTimerManager];
}

- (void)_addTimerContext:(id)a3
{
  p_lock = &self->_lock;
  id v9 = a3;
  os_unfair_lock_assert_owner(p_lock);
  sortedTimerContexts = self->_sortedTimerContexts;
  uint64_t v6 = [(NSMutableArray *)sortedTimerContexts count];
  id v7 = +[HMFTimerManagerTimerContext comparator];
  uint64_t v8 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](sortedTimerContexts, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, v6, 1024, v7);

  [(NSMutableArray *)self->_sortedTimerContexts insertObject:v9 atIndex:v8];
}

- (void)_removeTimerContextsWithMatchingObject:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  sortedTimerContexts = self->_sortedTimerContexts;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __58__HMFTimerManager__removeTimerContextsWithMatchingObject___block_invoke;
  v8[3] = &unk_1E5957708;
  id v9 = v4;
  id v6 = v4;
  id v7 = [(NSMutableArray *)sortedTimerContexts indexesOfObjectsPassingTest:v8];
  [(NSMutableArray *)self->_sortedTimerContexts removeObjectsAtIndexes:v7];
}

uint64_t __58__HMFTimerManager__removeTimerContextsWithMatchingObject___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 object];
  if (v4)
  {
    BOOL v5 = [v3 object];
    uint64_t v6 = [v5 isEqual:*(void *)(a1 + 32)];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (void)_removeTimerContext:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  sortedTimerContexts = self->_sortedTimerContexts;
  uint64_t v7 = [(NSMutableArray *)sortedTimerContexts count];
  uint64_t v8 = +[HMFTimerManagerTimerContext comparator];
  uint64_t v9 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](sortedTimerContexts, "indexOfObject:inSortedRange:options:usingComparator:", v5, 0, v7, 256, v8);

  if (v9 != 0x7FFFFFFFFFFFFFFFLL)
  {
    double v10 = self->_sortedTimerContexts;
    [(NSMutableArray *)v10 removeObjectAtIndex:v9];
  }
}

- (BOOL)_cancelTimerManagerIfEmpty
{
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = [(NSMutableArray *)self->_sortedTimerContexts count];
  if (!v3)
  {
    [(HMFTimer *)self->_nextTimer cancel];
    nextTimer = self->_nextTimer;
    self->_nextTimer = 0;

    nextTimerContext = self->_nextTimerContext;
    self->_nextTimerContext = 0;
  }
  return v3 == 0;
}

- (void)_refreshNextTimerIfNeededWithTimeInterval:(double)a3
{
  os_unfair_lock_assert_owner(&self->_lock);
  if (![(HMFTimerManager *)self _cancelTimerManagerIfEmpty])
  {
    nextTimerContext = self->_nextTimerContext;
    if (!nextTimerContext
      || ([(NSMutableArray *)self->_sortedTimerContexts firstObject],
          uint64_t v6 = (HMFTimerManagerTimerContext *)objc_claimAutoreleasedReturnValue(),
          v6,
          nextTimerContext != v6))
    {
      uint64_t v7 = [(NSMutableArray *)self->_sortedTimerContexts firstObject];
      uint64_t v8 = self->_nextTimerContext;
      self->_nextTimerContext = v7;

      uint64_t v9 = [(HMFTimerManagerDataSource *)self->_dataSource timerWithTimeInterval:self->_options options:a3];
      nextTimer = self->_nextTimer;
      self->_nextTimer = v9;

      [(HMFTimer *)self->_nextTimer setDelegate:self];
      [(HMFTimer *)self->_nextTimer setDelegateQueue:self->_delegateQueue];
      v11 = self->_nextTimer;
      [(HMFTimer *)v11 resume];
    }
  }
}

- (id)_removeExpiredTimerContextsAndRefreshNextTimer
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_assert_owner(&self->_lock);
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = self->_sortedTimerContexts;
  uint64_t v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v16 != v7) {
        objc_enumerationMutation(v4);
      }
      uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * v8);
      objc_msgSend(v9, "expirationTime", (void)v15);
      double v11 = v10;
      [(HMFTimerManagerDataSource *)self->_dataSource currentTime];
      double v13 = v11 - v12;
      if (v13 > 0.0) {
        break;
      }
      [v3 addObject:v9];
      if (v6 == ++v8)
      {
        uint64_t v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    double v13 = 0.0;
  }

  if ([v3 count]) {
    -[NSMutableArray removeObjectsInRange:](self->_sortedTimerContexts, "removeObjectsInRange:", 0, [v3 count]);
  }
  -[HMFTimerManager _refreshNextTimerIfNeededWithTimeInterval:](self, "_refreshNextTimerIfNeededWithTimeInterval:", v13, (void)v15);
  return v3;
}

- (void)refreshTimerManager
{
}

- (void)refreshTimerManagerWithShouldDispatchNotifications:(BOOL)a3
{
  BOOL v3 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if ([(HMFTimerManager *)self _cancelTimerManagerIfEmpty])
  {
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v6 = [(HMFTimerManager *)self _removeExpiredTimerContextsAndRefreshNextTimer];
    os_unfair_lock_unlock(p_lock);
    [(HMFTimerManager *)self notifyDidFireForTimerContexts:v6 shouldDispatch:v3];
  }
}

- (void)notifyDidFireForTimerContexts:(id)a3 shouldDispatch:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 count])
  {
    uint64_t v7 = [(HMFTimerManager *)self delegateQueue];
    uint64_t v8 = v7;
    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke;
      block[3] = &unk_1E5957730;
      block[4] = self;
      id v11 = v6;
      dispatch_async(v8, block);
    }
    else
    {
      dispatch_assert_queue_V2(v7);

      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke_2;
      v9[3] = &unk_1E5957758;
      v9[4] = self;
      objc_msgSend(v6, "na_each:", v9);
    }
  }
}

uint64_t __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) notifyDidFireForTimerContexts:*(void *)(a1 + 40) shouldDispatch:0];
}

void __64__HMFTimerManager_notifyDidFireForTimerContexts_shouldDispatch___block_invoke_2(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 delegate];
  [v5 timerManager:*(void *)(a1 + 32) didFireForTimerContext:v4];
}

- (void)timerDidFire:(id)a3
{
  id v4 = [(HMFTimerManager *)self delegateQueue];
  dispatch_assert_queue_V2(v4);

  [(HMFTimerManager *)self refreshTimerManagerWithShouldDispatchNotifications:0];
}

- (HMFTimerManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (HMFTimerManagerDelegate *)WeakRetained;
}

- (OS_dispatch_queue)delegateQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 64, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_sortedTimerContexts, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_nextTimerContext, 0);
  objc_storeStrong((id *)&self->_nextTimer, 0);
}

@end