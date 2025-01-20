@interface LKAttentionAwareIdleTimer
+ (id)sharedInstance;
- (AWAttentionAwarenessClient)client;
- (AWAttentionAwarenessConfiguration)config;
- (LKAttentionAwareIdleTimer)init;
- (LKAttentionAwareIdleTimerDelegate)delegate;
- (NSMutableDictionary)timeoutDelegateMap;
- (OS_dispatch_queue)attentionAwarenessClientQueue;
- (OS_dispatch_queue)queue;
- (void)setAttentionAwarenessClientQueue:(id)a3;
- (void)setClient:(id)a3;
- (void)setConfig:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setQueue:(id)a3;
- (void)setTimeoutDelegateMap:(id)a3;
- (void)startMonitoringAttentionAwareIdleWithDelegate:(id)a3 timeout:(double)a4;
- (void)stopMonitoringAttentionAwareIdleWithDelegate:(id)a3 timeout:(double)a4;
@end

@implementation LKAttentionAwareIdleTimer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  }
  v2 = (void *)sharedInstance_sharedInstance;
  return v2;
}

uint64_t __43__LKAttentionAwareIdleTimer_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (LKAttentionAwareIdleTimer)init
{
  v10.receiver = self;
  v10.super_class = (Class)LKAttentionAwareIdleTimer;
  v2 = [(LKAttentionAwareIdleTimer *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create((const char *)[@"LKAttentionAwareIdleTimerQueue" UTF8String], 0);
    attentionAwarenessClientQueue = v2->_attentionAwarenessClientQueue;
    v2->_attentionAwarenessClientQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = objc_opt_new();
    timeoutDelegateMap = v2->_timeoutDelegateMap;
    v2->_timeoutDelegateMap = (NSMutableDictionary *)v5;

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.LoginUI.LUIAttentionAwareIdleTimer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;
  }
  return v2;
}

- (void)startMonitoringAttentionAwareIdleWithDelegate:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = [(LKAttentionAwareIdleTimer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__LKAttentionAwareIdleTimer_startMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke;
  block[3] = &unk_2645FC270;
  double v12 = a4;
  id v10 = v6;
  v11 = self;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __83__LKAttentionAwareIdleTimer_startMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v2 = [LKAttentionAwareIdleTimerClient alloc];
  double v3 = *(double *)(a1 + 48);
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = [*(id *)(a1 + 40) attentionAwarenessClientQueue];
  id v6 = [(LKAttentionAwareIdleTimerClient *)v2 initWithClientDelegate:v4 timeout:v5 queue:v3];

  dispatch_queue_t v7 = [*(id *)(a1 + 40) timeoutDelegateMap];
  id v8 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v9 = [v7 objectForKeyedSubscript:v8];

  if (!v9)
  {
    id v10 = [MEMORY[0x263EFF980] array];
    v11 = [*(id *)(a1 + 40) timeoutDelegateMap];
    double v12 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    [v11 setObject:v10 forKeyedSubscript:v12];
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v13 = objc_msgSend(*(id *)(a1 + 40), "timeoutDelegateMap", 0);
  v14 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v15 = [v13 objectForKeyedSubscript:v14];

  uint64_t v16 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v26;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(v15);
        }
        v20 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        v21 = [v20 clientDelegate];
        v22 = *(void **)(a1 + 32);

        if (v21 == v22)
        {
          [v20 resume];
          goto LABEL_13;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v25 objects:v29 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  [(LKAttentionAwareIdleTimerClient *)v6 resume];
  v15 = [*(id *)(a1 + 40) timeoutDelegateMap];
  v23 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  v24 = [v15 objectForKeyedSubscript:v23];
  [v24 addObject:v6];

LABEL_13:
}

- (void)stopMonitoringAttentionAwareIdleWithDelegate:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  dispatch_queue_t v7 = [(LKAttentionAwareIdleTimer *)self queue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __82__LKAttentionAwareIdleTimer_stopMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke;
  block[3] = &unk_2645FC270;
  double v11 = a4;
  void block[4] = self;
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);
}

void __82__LKAttentionAwareIdleTimer_stopMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [*(id *)(a1 + 32) timeoutDelegateMap];
  double v3 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
  uint64_t v4 = [v2 objectForKeyedSubscript:v3];

  if (v4)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    uint64_t v5 = objc_msgSend(*(id *)(a1 + 32), "timeoutDelegateMap", 0);
    id v6 = [NSNumber numberWithDouble:*(double *)(a1 + 48)];
    dispatch_queue_t v7 = [v5 objectForKeyedSubscript:v6];

    uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v16 != v10) {
            objc_enumerationMutation(v7);
          }
          double v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
          v13 = [v12 clientDelegate];
          v14 = *(void **)(a1 + 40);

          if (v13 == v14)
          {
            [v12 pause];
            goto LABEL_12;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
}

- (LKAttentionAwareIdleTimerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (LKAttentionAwareIdleTimerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (AWAttentionAwarenessConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (AWAttentionAwarenessClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
}

- (OS_dispatch_queue)attentionAwarenessClientQueue
{
  return self->_attentionAwarenessClientQueue;
}

- (void)setAttentionAwarenessClientQueue:(id)a3
{
}

- (NSMutableDictionary)timeoutDelegateMap
{
  return self->_timeoutDelegateMap;
}

- (void)setTimeoutDelegateMap:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeoutDelegateMap, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end