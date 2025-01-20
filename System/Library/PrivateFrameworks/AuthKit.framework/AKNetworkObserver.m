@interface AKNetworkObserver
+ (id)sharedNetworkObserver;
- (AKNetworkObserver)init;
- (BOOL)isNetworkReachable;
- (void)_onqueue_networkReachabilityDidChange;
- (void)_startPathMonitor;
- (void)_stopPathMonitor;
- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)removeNetworkReachableObserver:(id)a3;
@end

@implementation AKNetworkObserver

- (AKNetworkObserver)init
{
  v9.receiver = self;
  v9.super_class = (Class)AKNetworkObserver;
  v2 = [(AKNetworkObserver *)&v9 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.AuthKit.AKNetworkObserver", v3);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    callbacksByObserver = v2->_callbacksByObserver;
    v2->_callbacksByObserver = (NSMutableDictionary *)v6;

    [(AKNetworkObserver *)v2 _startPathMonitor];
  }
  return v2;
}

- (void)dealloc
{
  [(AKNetworkObserver *)self _stopPathMonitor];
  callbacksByObserver = self->_callbacksByObserver;
  self->_callbacksByObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)AKNetworkObserver;
  [(AKNetworkObserver *)&v4 dealloc];
}

+ (id)sharedNetworkObserver
{
  if (sharedNetworkObserver_onceToken != -1) {
    dispatch_once(&sharedNetworkObserver_onceToken, &__block_literal_global_43);
  }
  v2 = (void *)sharedNetworkObserver_networkObserver;

  return v2;
}

uint64_t __42__AKNetworkObserver_sharedNetworkObserver__block_invoke()
{
  sharedNetworkObserver_networkObserver = objc_alloc_init(AKNetworkObserver);

  return MEMORY[0x1F41817F8]();
}

- (void)_startPathMonitor
{
  pathMonitor = self->_pathMonitor;
  if (!pathMonitor)
  {
    objc_super v4 = (OS_nw_path_monitor *)nw_path_monitor_create();
    v5 = self->_pathMonitor;
    self->_pathMonitor = v4;

    pathMonitor = self->_pathMonitor;
  }
  nw_path_monitor_set_queue(pathMonitor, (dispatch_queue_t)self->_observerQueue);
  objc_initWeak(&location, self);
  uint64_t v6 = self->_pathMonitor;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__AKNetworkObserver__startPathMonitor__block_invoke;
  v7[3] = &unk_1E5761B90;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v6, v7);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__AKNetworkObserver__startPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  path = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v4 = (nw_path_get_status(path) & 0xFFFFFFFD) == 1 && nw_path_has_dns(path);
    int v5 = WeakRetained[32];
    WeakRetained[32] = v4;
    if (v5 != v4) {
      objc_msgSend(WeakRetained, "_onqueue_networkReachabilityDidChange");
    }
  }
}

- (void)_stopPathMonitor
{
  pathMonitor = self->_pathMonitor;
  if (pathMonitor)
  {
    nw_path_monitor_cancel(pathMonitor);
    int v4 = self->_pathMonitor;
    self->_pathMonitor = 0;
  }
}

- (void)_onqueue_networkReachabilityDidChange
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_observerQueue);
  BOOL isNetworkReachable = self->_isNetworkReachable;
  int v4 = [(NSMutableDictionary *)self->_callbacksByObserver allValues];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __58__AKNetworkObserver__onqueue_networkReachabilityDidChange__block_invoke;
  v6[3] = &unk_1E5761BB8;
  id v7 = v4;
  BOOL v8 = isNetworkReachable;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __58__AKNetworkObserver__onqueue_networkReachabilityDidChange__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void *)(*((void *)&v8 + 1) + 8 * v6);
        if (v7) {
          (*(void (**)(uint64_t, void))(v7 + 16))(v7, *(unsigned __int8 *)(a1 + 40));
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__AKNetworkObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_1E5760CB0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__AKNetworkObserver_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  objc_initWeak(&location, v6);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke;
  v15[3] = &unk_1E5761BE0;
  objc_copyWeak(v16, &location);
  v16[1] = (id)a4;
  uint64_t v7 = (void *)MEMORY[0x1996FE880](v15);
  uint64_t v8 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:v6];
  observerQueue = self->_observerQueue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke_2;
  v12[3] = &unk_1E5761C08;
  id v13 = v8;
  id v14 = v7;
  v12[4] = self;
  id v10 = v8;
  id v11 = v7;
  dispatch_sync(observerQueue, v12);

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
}

void __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke(uint64_t a1, char a2)
{
  char v7 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v4 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v5 = [WeakRetained methodSignatureForSelector:*(void *)(a1 + 40)];
    id v6 = [MEMORY[0x1E4F1CA18] invocationWithMethodSignature:v5];
    [v6 setSelector:*(void *)(a1 + 40)];
    [v6 setTarget:v4];
    [v6 setArgument:&v7 atIndex:2];
    [v6 invoke];
  }
}

void __58__AKNetworkObserver_addNetworkReachableObserver_selector___block_invoke_2(void *a1)
{
  id v2 = *(void **)(a1[4] + 24);
  id v3 = (id)MEMORY[0x1996FE880](a1[6]);
  [v2 setObject:v3 forKey:a1[5]];
}

- (void)removeNetworkReachableObserver:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F29238] valueWithNonretainedObject:a3];
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__AKNetworkObserver_removeNetworkReachableObserver___block_invoke;
  v7[3] = &unk_1E575F448;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __52__AKNetworkObserver_removeNetworkReachableObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbacksByObserver, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);

  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end