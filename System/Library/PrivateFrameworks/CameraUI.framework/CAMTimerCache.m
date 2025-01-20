@interface CAMTimerCache
- (BOOL)isRunningTimerForKey:(id)a3;
- (CAMTimerCache)init;
- (CAMTimerCacheDelegate)delegate;
- (NSMutableDictionary)_timersByType;
- (void)_handleTimer:(id)a3 forKey:(id)a4;
- (void)cancelAllTimers;
- (void)cancelTimerForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)startTimerForKey:(id)a3 duration:(double)a4;
@end

@implementation CAMTimerCache

- (CAMTimerCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CAMTimerCache;
  v2 = [(CAMTimerCache *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    timersByType = v2->__timersByType;
    v2->__timersByType = v3;
  }
  return v2;
}

- (void)startTimerForKey:(id)a3 duration:(double)a4
{
  id v6 = a3;
  v7 = [(CAMTimerCache *)self _timersByType];
  v8 = [v7 objectForKeyedSubscript:v6];
  if (v8)
  {
    v9 = v8;
    dispatch_suspend(v8);
  }
  else
  {
    objc_initWeak(&location, self);
    dispatch_source_t v10 = dispatch_source_create(MEMORY[0x263EF8400], 0, 0, MEMORY[0x263EF83A0]);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__CAMTimerCache_startTimerForKey_duration___block_invoke;
    v13[3] = &unk_263FA3388;
    objc_copyWeak(&v16, &location);
    v9 = v10;
    v14 = v9;
    id v15 = v6;
    dispatch_source_set_event_handler(v9, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  double v11 = a4 * 1000000000.0;
  dispatch_time_t v12 = dispatch_time(0, (uint64_t)v11);
  dispatch_source_set_timer(v9, v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)(uint64_t)v11 * 0.1));
  [v7 setObject:v9 forKeyedSubscript:v6];
  dispatch_resume(v9);
}

void __43__CAMTimerCache_startTimerForKey_duration___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _handleTimer:*(void *)(a1 + 32) forKey:*(void *)(a1 + 40)];
}

- (void)_handleTimer:(id)a3 forKey:(id)a4
{
  dispatch_source_t source = (dispatch_source_t)a3;
  id v6 = a4;
  v7 = [(CAMTimerCache *)self _timersByType];
  dispatch_source_t v8 = [v7 objectForKeyedSubscript:v6];

  v9 = source;
  if (v8 == source)
  {
    [v7 setObject:0 forKeyedSubscript:v6];
    dispatch_source_t v10 = [(CAMTimerCache *)self delegate];
    [v10 timerCache:self timerDidFireForKey:v6];

    v9 = source;
  }
  dispatch_source_cancel(v9);
}

- (void)cancelTimerForKey:(id)a3
{
  id v7 = a3;
  v4 = [(CAMTimerCache *)self _timersByType];
  v5 = [v4 objectForKeyedSubscript:v7];
  id v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);
    [v4 setObject:0 forKeyedSubscript:v7];
  }
}

- (void)cancelAllTimers
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  v2 = [(CAMTimerCache *)self _timersByType];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v3 = objc_msgSend(v2, "allValues", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
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
        dispatch_source_cancel(*(dispatch_source_t *)(*((void *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }

  [v2 removeAllObjects];
}

- (BOOL)isRunningTimerForKey:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CAMTimerCache *)self _timersByType];
  uint64_t v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (CAMTimerCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CAMTimerCacheDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSMutableDictionary)_timersByType
{
  return self->__timersByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timersByType, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end