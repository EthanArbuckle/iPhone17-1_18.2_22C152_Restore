@interface CSSiriQueueMonitor
+ (id)sharedMonitor;
- (CSSiriQueueMonitor)init;
- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)_beginMonitoring;
- (void)_endMonitoring;
- (void)_removeQueue:(id)a3;
- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6;
- (void)beginMonitoring;
- (void)endMonitoring;
- (void)removeQueue:(id)a3;
@end

@implementation CSSiriQueueMonitor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_endMonitoring
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t numberOfTransactions = self->_numberOfTransactions;
  if (numberOfTransactions == 1)
  {
    v4 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSSiriQueueMonitor _endMonitoring]";
      _os_log_debug_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(NSMutableDictionary *)self->_observersByIdentifier allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) stop];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    int64_t numberOfTransactions = self->_numberOfTransactions;
  }
  self->_int64_t numberOfTransactions = numberOfTransactions - 1;
}

- (void)_beginMonitoring
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int64_t numberOfTransactions = self->_numberOfTransactions;
  if (!numberOfTransactions)
  {
    v4 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSSiriQueueMonitor _beginMonitoring]";
      _os_log_debug_impl(&dword_1C9338000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
    v5 = [(NSMutableDictionary *)self->_observersByIdentifier allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v11;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v11 != v8) {
            objc_enumerationMutation(v5);
          }
          [*(id *)(*((void *)&v10 + 1) + 8 * v9++) startWithQueue:self->_queue];
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
      }
      while (v7);
    }

    int64_t numberOfTransactions = self->_numberOfTransactions;
  }
  self->_int64_t numberOfTransactions = numberOfTransactions + 1;
}

- (void)_removeQueue:(id)a3
{
  v4 = (objc_class *)NSString;
  v5 = a3;
  id v6 = [v4 alloc];
  label = dispatch_queue_get_label(v5);

  id v9 = (id)[v6 initWithUTF8String:label];
  uint64_t v8 = -[NSMutableDictionary objectForKey:](self->_observersByIdentifier, "objectForKey:");
  if (v8)
  {
    [(NSMutableDictionary *)self->_observersByIdentifier removeObjectForKey:v9];
    [v8 stop];
  }
}

- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v10 = a3;
  long long v11 = (objc_class *)NSString;
  id v12 = a6;
  long long v13 = (void *)[[v11 alloc] initWithUTF8String:dispatch_queue_get_label(v10)];
  v14 = [(NSMutableDictionary *)self->_observersByIdentifier objectForKey:v13];

  if (v14)
  {
    v15 = *MEMORY[0x1E4F4E368];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = "-[CSSiriQueueMonitor _addQueue:heartBeatInterval:timeoutInterval:timeoutHandler:]";
      __int16 v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1C9338000, v15, OS_LOG_TYPE_ERROR, "%s Queue %@ is already being observed.", (uint8_t *)&v17, 0x16u);
    }
  }
  [(CSSiriQueueMonitor *)self _removeQueue:v10];
  v16 = [[_CSSiriQueueObserver alloc] initWithQueue:v10 heartBeatInterval:v12 timeoutInterval:a4 timeoutHandler:a5];

  [(NSMutableDictionary *)self->_observersByIdentifier setObject:v16 forKey:v13];
  if (self->_numberOfTransactions >= 1) {
    [(_CSSiriQueueObserver *)v16 startWithQueue:self->_queue];
  }
}

- (void)endMonitoring
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[CSSiriQueueMonitor endMonitoring]";
    _os_log_debug_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CSSiriQueueMonitor_endMonitoring__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __35__CSSiriQueueMonitor_endMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endMonitoring];
}

- (void)beginMonitoring
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = *MEMORY[0x1E4F4E368];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F4E368], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v7 = "-[CSSiriQueueMonitor beginMonitoring]";
    _os_log_debug_impl(&dword_1C9338000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__CSSiriQueueMonitor_beginMonitoring__block_invoke;
  block[3] = &unk_1E658D4D8;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __37__CSSiriQueueMonitor_beginMonitoring__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _beginMonitoring];
}

- (void)removeQueue:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __34__CSSiriQueueMonitor_removeQueue___block_invoke;
  v7[3] = &unk_1E658D4B0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __34__CSSiriQueueMonitor_removeQueue___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeQueue:*(void *)(a1 + 40)];
}

- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __80__CSSiriQueueMonitor_addQueue_heartBeatInterval_timeoutInterval_timeoutHandler___block_invoke;
  block[3] = &unk_1E658BA68;
  block[4] = self;
  id v16 = v10;
  double v18 = a4;
  double v19 = a5;
  id v17 = v11;
  id v13 = v11;
  id v14 = v10;
  dispatch_async(queue, block);
}

uint64_t __80__CSSiriQueueMonitor_addQueue_heartBeatInterval_timeoutInterval_timeoutHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _addQueue:*(void *)(a1 + 40) heartBeatInterval:*(void *)(a1 + 48) timeoutInterval:*(double *)(a1 + 56) timeoutHandler:*(double *)(a1 + 64)];
}

- (CSSiriQueueMonitor)init
{
  v9.receiver = self;
  v9.super_class = (Class)CSSiriQueueMonitor;
  v2 = [(CSSiriQueueMonitor *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.assistant.queue-monitor", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    observersByIdentifier = v2->_observersByIdentifier;
    v2->_observersByIdentifier = v6;
  }
  return v2;
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_20180 != -1) {
    dispatch_once(&sharedMonitor_onceToken_20180, &__block_literal_global_20181);
  }
  v2 = (void *)sharedMonitor_sharedMonitor_20182;
  return v2;
}

void __35__CSSiriQueueMonitor_sharedMonitor__block_invoke()
{
  v0 = objc_alloc_init(CSSiriQueueMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor_20182;
  sharedMonitor_sharedMonitor_20182 = (uint64_t)v0;
}

@end