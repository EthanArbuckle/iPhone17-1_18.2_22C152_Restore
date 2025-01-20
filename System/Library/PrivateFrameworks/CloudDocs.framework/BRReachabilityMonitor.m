@interface BRReachabilityMonitor
+ (id)sharedReachabilityMonitor;
- (BOOL)isNetworkReachable;
- (BRReachabilityMonitor)init;
- (void)addObserver:(id)a3;
- (void)dealloc;
- (void)invalidate;
- (void)removeObserver:(id)a3;
@end

@implementation BRReachabilityMonitor

+ (id)sharedReachabilityMonitor
{
  if (sharedReachabilityMonitor_onceToken != -1) {
    dispatch_once(&sharedReachabilityMonitor_onceToken, &__block_literal_global_10);
  }
  v2 = (void *)sharedReachabilityMonitor_monitor;

  return v2;
}

uint64_t __50__BRReachabilityMonitor_sharedReachabilityMonitor__block_invoke()
{
  sharedReachabilityMonitor_monitor = objc_alloc_init(BRReachabilityMonitor);

  return MEMORY[0x1F41817F8]();
}

- (BRReachabilityMonitor)init
{
  v18.receiver = self;
  v18.super_class = (Class)BRReachabilityMonitor;
  v2 = [(BRReachabilityMonitor *)&v18 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    reachabilityObservers = v2->_reachabilityObservers;
    v2->_reachabilityObservers = (NSHashTable *)v3;

    v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    v6 = dispatch_queue_attr_make_with_autorelease_frequency(v5, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.reachability", v6);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

    objc_initWeak(&location, v2);
    v9 = v2->_queue;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __29__BRReachabilityMonitor_init__block_invoke;
    v14[3] = &unk_1E59AE158;
    objc_copyWeak(&v16, &location);
    v10 = v2;
    v15 = v10;
    uint64_t v11 = +[BRNWPathMonitorWrapper createPathMonitorWithQueue:v9 changeHandler:v14];
    pathMonitor = v10->_pathMonitor;
    v10->_pathMonitor = (OS_nw_path_monitor *)v11;

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __29__BRReachabilityMonitor_init__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    int v5 = (+[BRNWPathMonitorWrapper getStatusOfPath:v3] & 0xFFFFFFFD) == 1
      && +[BRNWPathMonitorWrapper pathHasDNS:v3];
    int v6 = WeakRetained[24];
    WeakRetained[24] = v5;
    if (v6 != v5)
    {
      dispatch_queue_t v7 = *((void *)WeakRetained + 2);
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __29__BRReachabilityMonitor_init__block_invoke_2;
      v8[3] = &unk_1E59AD648;
      v9 = WeakRetained;
      id v10 = *(id *)(a1 + 32);
      dispatch_async(v7, v8);
    }
  }
}

void __29__BRReachabilityMonitor_init__block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "reachabilityMonitor:didChangeReachabilityStatusTo:", *(void *)(a1 + 40), *(unsigned __int8 *)(*(void *)(a1 + 32) + 24), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)dealloc
{
  +[BRNWPathMonitorWrapper cancelPathMonitor:self->_pathMonitor];
  v3.receiver = self;
  v3.super_class = (Class)BRReachabilityMonitor;
  [(BRReachabilityMonitor *)&v3 dealloc];
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  long long v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __43__BRReachabilityMonitor_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E59AE180;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __43__BRReachabilityMonitor_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__BRReachabilityMonitor_addObserver___block_invoke;
  v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

uint64_t __37__BRReachabilityMonitor_addObserver___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 8) addObject:*(void *)(a1 + 40)];
  id v2 = *(void **)(a1 + 40);

  return objc_msgSend(v2, "reachabilityMonitor:didChangeReachabilityStatusTo:");
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __40__BRReachabilityMonitor_removeObserver___block_invoke;
  v7[3] = &unk_1E59AD648;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __40__BRReachabilityMonitor_removeObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 8) removeObject:*(void *)(a1 + 40)];
}

- (void)invalidate
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathMonitor, 0);
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_reachabilityObservers, 0);
}

@end