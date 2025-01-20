@interface FLNetworkObserver
+ (id)sharedNetworkObserver;
- (BOOL)_isWiFiEnabled;
- (BOOL)isAirplaneModeActiveWithoutWiFi;
- (BOOL)isNetworkReachable;
- (FLNetworkObserver)init;
- (id)_init;
- (id)addNetworkReachableBlock:(id)a3;
- (void)_networkReachabilityDidChange;
- (void)_startPathMonitor;
- (void)_stopPathMonitor;
- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4;
- (void)dealloc;
- (void)disableAirplaneMode;
- (void)removeNetworkReachableObserver:(id)a3;
@end

@implementation FLNetworkObserver

- (FLNetworkObserver)init
{
  return 0;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)FLNetworkObserver;
  v2 = [(FLNetworkObserver *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.CoreFollowUpUI.FLNetworkObserver", 0);
    observerQueue = v2->_observerQueue;
    v2->_observerQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x263EFF9A0] dictionary];
    invocationByObserver = v2->_invocationByObserver;
    v2->_invocationByObserver = (NSMutableDictionary *)v5;

    [(FLNetworkObserver *)v2 _startPathMonitor];
  }
  return v2;
}

- (void)dealloc
{
  [(FLNetworkObserver *)self _stopPathMonitor];
  invocationByObserver = self->_invocationByObserver;
  self->_invocationByObserver = 0;

  v4.receiver = self;
  v4.super_class = (Class)FLNetworkObserver;
  [(FLNetworkObserver *)&v4 dealloc];
}

+ (id)sharedNetworkObserver
{
  if (sharedNetworkObserver_onceToken != -1) {
    dispatch_once(&sharedNetworkObserver_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)sharedNetworkObserver_networkObserver;

  return v2;
}

uint64_t __42__FLNetworkObserver_sharedNetworkObserver__block_invoke()
{
  sharedNetworkObserver_networkObserver = [[FLNetworkObserver alloc] _init];

  return MEMORY[0x270F9A758]();
}

- (void)disableAirplaneMode
{
  dispatch_queue_t v3 = _FLLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_221DA3000, v3, OS_LOG_TYPE_DEFAULT, "Disabling airplane mode and waiting for network change.", v5, 2u);
  }

  objc_super v4 = (void *)[objc_alloc(MEMORY[0x263F255D8]) initWithQueue:self->_observerQueue];
  [v4 setAirplaneMode:0];
}

- (BOOL)isAirplaneModeActiveWithoutWiFi
{
  dispatch_queue_t v3 = (void *)[objc_alloc(MEMORY[0x263F255D8]) initWithQueue:self->_observerQueue];
  BOOL v4 = [v3 airplaneMode] && !-[FLNetworkObserver _isWiFiEnabled](self, "_isWiFiEnabled");

  return v4;
}

- (void)_startPathMonitor
{
  pathMonitor = self->_pathMonitor;
  if (!pathMonitor)
  {
    BOOL v4 = (OS_nw_path_monitor *)nw_path_monitor_create();
    uint64_t v5 = self->_pathMonitor;
    self->_pathMonitor = v4;

    pathMonitor = self->_pathMonitor;
  }
  nw_path_monitor_set_queue(pathMonitor, (dispatch_queue_t)self->_observerQueue);
  objc_initWeak(&location, self);
  v6 = self->_pathMonitor;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __38__FLNetworkObserver__startPathMonitor__block_invoke;
  v7[3] = &unk_2645F2498;
  objc_copyWeak(&v8, &location);
  nw_path_monitor_set_update_handler(v6, v7);
  nw_path_monitor_start((nw_path_monitor_t)self->_pathMonitor);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

void __38__FLNetworkObserver__startPathMonitor__block_invoke(uint64_t a1, void *a2)
{
  path = a2;
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v4 = (nw_path_get_status(path) & 0xFFFFFFFD) == 1 && nw_path_has_dns(path);
    int v5 = WeakRetained[32];
    WeakRetained[32] = v4;
    WeakRetained[33] = nw_path_uses_interface_type(path, nw_interface_type_wifi);
    if (v5 != v4) {
      [WeakRetained _networkReachabilityDidChange];
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

- (void)_networkReachabilityDidChange
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v2 = [(NSMutableDictionary *)self->_invocationByObserver allValues];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v11;
    v6 = MEMORY[0x263EF83A0];
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        block[0] = MEMORY[0x263EF8330];
        block[1] = 3221225472;
        block[2] = __50__FLNetworkObserver__networkReachabilityDidChange__block_invoke;
        block[3] = &unk_2645F2380;
        block[4] = v8;
        dispatch_async(v6, block);
        ++v7;
      }
      while (v4 != v7);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

uint64_t __50__FLNetworkObserver__networkReachabilityDidChange__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) invoke];
}

- (BOOL)isNetworkReachable
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __39__FLNetworkObserver_isNetworkReachable__block_invoke;
  v5[3] = &unk_2645F24C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __39__FLNetworkObserver_isNetworkReachable__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 32);
  return result;
}

- (BOOL)_isWiFiEnabled
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  observerQueue = self->_observerQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __35__FLNetworkObserver__isWiFiEnabled__block_invoke;
  v5[3] = &unk_2645F24C0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(observerQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __35__FLNetworkObserver__isWiFiEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 33);
  return result;
}

- (void)addNetworkReachableObserver:(id)a3 selector:(SEL)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 methodSignatureForSelector:a4];
  uint64_t v8 = [MEMORY[0x263EFF958] invocationWithMethodSignature:v7];
  [v8 setSelector:a4];
  [v8 setTarget:v6];
  char v9 = [MEMORY[0x263F08D40] valueWithNonretainedObject:v6];

  observerQueue = self->_observerQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__FLNetworkObserver_addNetworkReachableObserver_selector___block_invoke;
  block[3] = &unk_2645F24E8;
  block[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  dispatch_sync(observerQueue, block);
}

uint64_t __58__FLNetworkObserver_addNetworkReachableObserver_selector___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
}

- (id)addNetworkReachableBlock:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  uint64_t v5 = [_FLNetworkObserverBlock alloc];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __46__FLNetworkObserver_addNetworkReachableBlock___block_invoke;
  v9[3] = &unk_2645F2510;
  objc_copyWeak(&v11, &location);
  id v6 = v4;
  id v10 = v6;
  id v7 = [(_FLNetworkObserverBlock *)v5 _initWithBlock:v9 networkObserver:self];
  [(FLNetworkObserver *)self addNetworkReachableObserver:v7 selector:sel_executeBlock];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

  return v7;
}

void __46__FLNetworkObserver_addNetworkReachableBlock___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), [WeakRetained isNetworkReachable]);
    id WeakRetained = v3;
  }
}

- (void)removeNetworkReachableObserver:(id)a3
{
  id v4 = [MEMORY[0x263F08D40] valueWithNonretainedObject:a3];
  observerQueue = self->_observerQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__FLNetworkObserver_removeNetworkReachableObserver___block_invoke;
  v7[3] = &unk_2645F2538;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(observerQueue, v7);
}

uint64_t __52__FLNetworkObserver_removeNetworkReachableObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_invocationByObserver, 0);
  objc_storeStrong((id *)&self->_observerQueue, 0);

  objc_storeStrong((id *)&self->_pathMonitor, 0);
}

@end