@interface IKConcurrentEvaluator
+ (id)idleEvaluator;
- (IKConcurrentEvaluator)initWithQueue:(id)a3;
- (IKConcurrentEvaluator)initWithQueue:(id)a3 concurrencyCount:(int64_t)a4;
- (OS_dispatch_queue)queue;
- (id)_getterForKey:(id)a3;
- (id)_removeFetcherForKey:(id)a3;
- (id)objectForKey:(id)a3;
- (int64_t)concurrencyCount;
- (void)_insertFetcher:(id)a3 getter:(id)a4 forKey:(id)a5;
- (void)_scheduleFetchRelayed:(BOOL)a3;
- (void)addEvaluationBlock:(id)a3 forKey:(id)a4;
- (void)lockSchedulingForEvaluation:(id)a3;
@end

@implementation IKConcurrentEvaluator

+ (id)idleEvaluator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__IKConcurrentEvaluator_idleEvaluator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (idleEvaluator_onceToken != -1) {
    dispatch_once(&idleEvaluator_onceToken, block);
  }
  v2 = (void *)idleEvaluator_idleEvaluator;
  return v2;
}

void __38__IKConcurrentEvaluator_idleEvaluator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc(*(Class *)(a1 + 32));
  dispatch_get_global_queue(-32768, 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 initWithQueue:v4 concurrencyCount:1];
  v3 = (void *)idleEvaluator_idleEvaluator;
  idleEvaluator_idleEvaluator = v2;
}

- (IKConcurrentEvaluator)initWithQueue:(id)a3
{
  return [(IKConcurrentEvaluator *)self initWithQueue:a3 concurrencyCount:10];
}

- (IKConcurrentEvaluator)initWithQueue:(id)a3 concurrencyCount:(int64_t)a4
{
  id v7 = a3;
  v14.receiver = self;
  v14.super_class = (Class)IKConcurrentEvaluator;
  v8 = [(IKConcurrentEvaluator *)&v14 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_queue, a3);
    int64_t v10 = 10;
    if (a4 < 10) {
      int64_t v10 = a4;
    }
    v9->_concurrencyCount = v10;
    dispatch_semaphore_t v11 = dispatch_semaphore_create(1);
    schedulingLock = v9->_schedulingLock;
    v9->_schedulingLock = (OS_dispatch_semaphore *)v11;
  }
  return v9;
}

- (void)addEvaluationBlock:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_initWeak(&location, self);
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__5;
  v23[4] = __Block_byref_object_dispose__5;
  id v24 = 0;
  dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __51__IKConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke;
  v19[3] = &unk_1E6DE4418;
  objc_copyWeak(&v22, &location);
  v9 = v8;
  v20 = v9;
  v21 = v23;
  int64_t v10 = (void *)MEMORY[0x1E4E65800](v19);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __51__IKConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke_2;
  v15[3] = &unk_1E6DE4440;
  v18 = v23;
  id v11 = v6;
  id v17 = v11;
  v12 = v9;
  v16 = v12;
  v13 = (void *)MEMORY[0x1E4E65800](v15);
  objc_super v14 = self;
  objc_sync_enter(v14);
  [(IKConcurrentEvaluator *)v14 _insertFetcher:v13 getter:v10 forKey:v7];
  [(IKConcurrentEvaluator *)v14 _scheduleFetchRelayed:0];
  objc_sync_exit(v14);

  objc_destroyWeak(&v22);
  _Block_object_dispose(v23, 8);

  objc_destroyWeak(&location);
}

id __51__IKConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    dispatch_semaphore_wait(*(dispatch_semaphore_t *)(a1 + 32), 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
    id v3 = *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  else
  {
    id v3 = 0;
  }

  return v3;
}

intptr_t __51__IKConcurrentEvaluator_addEvaluationBlock_forKey___block_invoke_2(void *a1)
{
  kdebug_trace();
  uint64_t v2 = (*(void (**)(void))(a1[5] + 16))();
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  kdebug_trace();
  v5 = a1[4];
  return dispatch_semaphore_signal(v5);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(IKConcurrentEvaluator *)v5 _getterForKey:v4];
  objc_sync_exit(v5);

  if (v6)
  {
    id v7 = v6[2](v6);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void)lockSchedulingForEvaluation:(id)a3
{
  id v4 = self;
  v5 = (void (**)(void))a3;
  objc_sync_enter(v4);
  int64_t numberOfSchedulingLocksAcquired = v4->_numberOfSchedulingLocksAcquired;
  v4->_int64_t numberOfSchedulingLocksAcquired = numberOfSchedulingLocksAcquired + 1;
  if (!numberOfSchedulingLocksAcquired) {
    dispatch_semaphore_wait((dispatch_semaphore_t)v4->_schedulingLock, 0xFFFFFFFFFFFFFFFFLL);
  }
  objc_sync_exit(v4);

  v5[2](v5);
  obj = v4;
  objc_sync_enter(obj);
  uint64_t v7 = v4->_numberOfSchedulingLocksAcquired - 1;
  v4->_int64_t numberOfSchedulingLocksAcquired = v7;
  if (!v7) {
    dispatch_semaphore_signal(obj[6]);
  }
  objc_sync_exit(obj);
}

- (void)_insertFetcher:(id)a3 getter:(id)a4 forKey:(id)a5
{
  id v19 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_fetchers)
  {
    int64_t v10 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    fetchers = self->_fetchers;
    self->_fetchers = v10;
  }
  v12 = (void *)MEMORY[0x1E4E65800](v19);
  [(NSMutableDictionary *)self->_fetchers setObject:v12 forKeyedSubscript:v9];

  orderedKeys = self->_orderedKeys;
  if (!orderedKeys)
  {
    objc_super v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
    v15 = self->_orderedKeys;
    self->_orderedKeys = v14;

    orderedKeys = self->_orderedKeys;
  }
  [(NSMutableArray *)orderedKeys removeObject:v9];
  [(NSMutableArray *)self->_orderedKeys addObject:v9];
  if (!self->_getters)
  {
    v16 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:1];
    getters = self->_getters;
    self->_getters = v16;
  }
  v18 = (void *)MEMORY[0x1E4E65800](v8);
  [(NSMutableDictionary *)self->_getters setObject:v18 forKeyedSubscript:v9];
}

- (id)_removeFetcherForKey:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
LABEL_4:
    [(NSMutableArray *)self->_orderedKeys removeObject:v6];
    uint64_t v7 = [(NSMutableDictionary *)self->_fetchers objectForKeyedSubscript:v6];
    [(NSMutableDictionary *)self->_fetchers removeObjectForKey:v6];
    goto LABEL_5;
  }
  id v6 = [(NSMutableArray *)self->_orderedKeys firstObject];
  if (v6) {
    goto LABEL_4;
  }
  uint64_t v7 = 0;
LABEL_5:
  id v8 = (void *)MEMORY[0x1E4E65800](v7);

  return v8;
}

- (id)_getterForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IKConcurrentEvaluator *)self _removeFetcherForKey:v4];
  id v6 = (void *)v5;
  if (v5) {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
  }
  uint64_t v7 = [(NSMutableDictionary *)self->_getters objectForKeyedSubscript:v4];

  return v7;
}

- (void)_scheduleFetchRelayed:(BOOL)a3
{
  BOOL v3 = a3;
  objc_initWeak(&location, self);
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __47__IKConcurrentEvaluator__scheduleFetchRelayed___block_invoke;
  v12 = &unk_1E6DE3C70;
  objc_copyWeak(&v13, &location);
  uint64_t v5 = (void *)MEMORY[0x1E4E65800](&v9);
  if (v3) {
    --self->_activeFetchCount;
  }
  if ([(NSMutableArray *)self->_orderedKeys count])
  {
    int64_t activeFetchCount = self->_activeFetchCount;
    if (!activeFetchCount)
    {
      int64_t v7 = 1;
      goto LABEL_9;
    }
    if (activeFetchCount < [(IKConcurrentEvaluator *)self concurrencyCount]
      && !self->_numberOfSchedulingLocksAcquired)
    {
      int64_t v7 = self->_activeFetchCount + 1;
LABEL_9:
      self->_int64_t activeFetchCount = v7;
      id v8 = [(IKConcurrentEvaluator *)self queue];
      dispatch_async(v8, v5);
    }
  }

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __47__IKConcurrentEvaluator__scheduleFetchRelayed___block_invoke(uint64_t a1)
{
  id WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v5 = WeakRetained;
    dispatch_semaphore_wait(WeakRetained[6], 0xFFFFFFFFFFFFFFFFLL);
    dispatch_semaphore_signal(v5[6]);
    uint64_t v2 = v5;
    objc_sync_enter(v2);
    BOOL v3 = [(dispatch_semaphore_t *)v2 _removeFetcherForKey:0];
    [(dispatch_semaphore_t *)v2 _scheduleFetchRelayed:0];
    objc_sync_exit(v2);

    if (v3) {
      v3[2](v3);
    }
    id v4 = v2;
    objc_sync_enter(v4);
    [(dispatch_semaphore_t *)v4 _scheduleFetchRelayed:1];
    objc_sync_exit(v4);

    id WeakRetained = v5;
  }
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (int64_t)concurrencyCount
{
  return self->_concurrencyCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_schedulingLock, 0);
  objc_storeStrong((id *)&self->_getters, 0);
  objc_storeStrong((id *)&self->_fetchers, 0);
  objc_storeStrong((id *)&self->_orderedKeys, 0);
}

@end