@interface CRSInCallAssertionService
+ (id)sharedInstance;
- (BSServiceConnectionListener)listener;
- (CARObserverHashTable)observers;
- (NSHashTable)activatedConnections;
- (NSHashTable)bannersAllowedConnections;
- (NSMutableDictionary)connections;
- (OS_dispatch_queue)connectionQueue;
- (id)_init;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)addObserver:(id)a3;
- (void)addObserver:(id)a3 notifyIfNeeded:(BOOL)a4;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)presentInCallService;
- (void)removeObserver:(id)a3;
- (void)setActivatedConnections:(id)a3;
- (void)setAllowsBanners:(id)a3;
- (void)setBannersAllowedConnections:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CRSInCallAssertionService

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedInstance___sharedInstance;
  return v2;
}

uint64_t __43__CRSInCallAssertionService_sharedInstance__block_invoke()
{
  sharedInstance___sharedInstance = [[CRSInCallAssertionService alloc] _init];
  return MEMORY[0x270F9A758]();
}

- (id)_init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)CRSInCallAssertionService;
  v2 = [(CRSInCallAssertionService *)&v21 init];
  if (v2)
  {
    v3 = [MEMORY[0x263F29C50] serial];
    uint64_t v4 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v4;

    uint64_t v6 = objc_opt_new();
    connections = v2->_connections;
    v2->_connections = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    activatedConnections = v2->_activatedConnections;
    v2->_activatedConnections = (NSHashTable *)v8;

    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    bannersAllowedConnections = v2->_bannersAllowedConnections;
    v2->_bannersAllowedConnections = (NSHashTable *)v10;

    v12 = (void *)MEMORY[0x263F2B9E0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __34__CRSInCallAssertionService__init__block_invoke;
    v19[3] = &unk_264443130;
    v13 = v2;
    v20 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v19];
    id v15 = v13[2];
    v13[2] = (id)v14;

    v16 = CRSLogForCategory(2uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = v13[2];
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_21D3CC000, v16, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    [v13[2] activate];
  }
  return v2;
}

void __34__CRSInCallAssertionService__init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay.non-launching"];
  v3 = +[CRSInCallAssertionSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
}

- (void)addObserver:(id)a3 notifyIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    observers = self->_observers;
    if (!observers)
    {
      uint64_t v8 = (CARObserverHashTable *)[objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26CDCFA30];
      v9 = self->_observers;
      self->_observers = v8;

      observers = self->_observers;
    }
    [(CARObserverHashTable *)observers addObserver:v6];
  }
  if (v4)
  {
    uint64_t v10 = [(CRSInCallAssertionService *)self activatedConnections];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      v12 = CRSLogForCategory(2uLL);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21D3CC000, v12, OS_LOG_TYPE_INFO, "Notifying new observer of activation request!", v13, 2u);
      }

      [v6 inCallAssertionServiceDidPresent:self];
    }
  }
}

- (void)removeObserver:(id)a3
{
  if (a3) {
    -[CARObserverHashTable removeObserver:](self->_observers, "removeObserver:");
  }
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [v6 instance];
    *(_DWORD *)buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    v18 = v8;
    _os_log_impl(&dword_21D3CC000, v7, OS_LOG_TYPE_INFO, "Received connection! %@, reason: %@", buf, 0x16u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke;
  v14[3] = &unk_264443180;
  v14[4] = self;
  [v6 configureConnection:v14];
  v9 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v16 = v6;
    _os_log_impl(&dword_21D3CC000, v9, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
  }

  uint64_t v10 = [(CRSInCallAssertionService *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_83;
  block[3] = &unk_2644431A8;
  block[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(v10, block);

  [v11 activate];
}

void __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = +[CRSInCallAssertionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSInCallAssertionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_264443158;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
  id v6 = [*(id *)(a1 + 32) connectionQueue];
  [v3 setTargetQueue:v6];
}

void __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21D3CC000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __71__CRSInCallAssertionService_listener_didReceiveConnection_withContext___block_invoke_83(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
}

- (void)presentInCallService
{
  id v3 = [(CRSInCallAssertionService *)self connectionQueue];
  BSDispatchQueueAssert();

  BOOL v4 = [(CRSInCallAssertionService *)self connections];
  int v5 = [MEMORY[0x263F2B9B8] currentContext];
  id v6 = [v5 instance];
  uint64_t v7 = [v4 objectForKey:v6];

  uint64_t v8 = [(CRSInCallAssertionService *)self activatedConnections];
  [v8 addObject:v7];

  v9 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
  uint64_t v10 = [v9 count];
  id v11 = [(CRSInCallAssertionService *)self connections];
  uint64_t v12 = [v11 count];

  id v13 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21D3CC000, v13, OS_LOG_TYPE_DEFAULT, "Received presentation request!", buf, 2u);
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __49__CRSInCallAssertionService_presentInCallService__block_invoke;
  v14[3] = &unk_2644430E0;
  v14[4] = self;
  BOOL v15 = v10 == v12;
  dispatch_async(MEMORY[0x263EF83A0], v14);
}

void __49__CRSInCallAssertionService_presentInCallService__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) observers];
  [v2 inCallAssertionServiceDidPresent:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) observers];
  [v3 inCallAssertionService:*(void *)(a1 + 32) didSetBannersEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)setAllowsBanners:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CRSInCallAssertionService *)self connectionQueue];
  BSDispatchQueueAssert();

  id v6 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
  uint64_t v7 = [v6 count];
  uint64_t v8 = [(CRSInCallAssertionService *)self connections];
  uint64_t v9 = [v8 count];

  uint64_t v10 = [(CRSInCallAssertionService *)self connections];
  id v11 = [MEMORY[0x263F2B9B8] currentContext];
  uint64_t v12 = [v11 instance];
  id v13 = [v10 objectForKey:v12];

  LODWORD(v10) = [v4 BOOLValue];
  uint64_t v14 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
  BOOL v15 = v14;
  if (v10) {
    [v14 addObject:v13];
  }
  else {
    [v14 removeObject:v13];
  }

  id v16 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v17 = [(CRSInCallAssertionService *)self connections];
    uint64_t v18 = [v17 count];
    uint64_t v19 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
    *(_DWORD *)buf = 134217984;
    uint64_t v28 = v18 - [v19 count];
    _os_log_impl(&dword_21D3CC000, v16, OS_LOG_TYPE_DEFAULT, "Number of assertions preventing banners: %ld", buf, 0xCu);
  }
  BOOL v20 = v7 != v9;

  objc_super v21 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
  uint64_t v22 = [v21 count];
  id v23 = [(CRSInCallAssertionService *)self connections];
  uint64_t v24 = [v23 count];

  if (((v20 ^ (v22 == v24)) & 1) == 0)
  {
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __46__CRSInCallAssertionService_setAllowsBanners___block_invoke;
    v25[3] = &unk_2644430E0;
    v25[4] = self;
    BOOL v26 = v22 == v24;
    dispatch_async(MEMORY[0x263EF83A0], v25);
  }
}

void __46__CRSInCallAssertionService_setAllowsBanners___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 inCallAssertionService:*(void *)(a1 + 32) didSetBannersEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)_connectionQueue_addConnection:(id)a3
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CRSInCallAssertionService *)self connectionQueue];
  BSDispatchQueueAssert();

  id v6 = [(CRSInCallAssertionService *)self connections];
  uint64_t v7 = [v4 instance];
  [v6 setObject:v4 forKey:v7];

  uint64_t v8 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [(CRSInCallAssertionService *)self connections];
    int v10 = 134217984;
    uint64_t v11 = [v9 count];
    _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_INFO, "Connection count: %ld", (uint8_t *)&v10, 0xCu);
  }
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [(CRSInCallAssertionService *)self connectionQueue];
  BSDispatchQueueAssert();

  id v6 = [(CRSInCallAssertionService *)self activatedConnections];
  int v7 = [v6 containsObject:v4];

  if (v7)
  {
    uint64_t v8 = [(CRSInCallAssertionService *)self activatedConnections];
    [v8 removeObject:v4];
  }
  uint64_t v9 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
  int v10 = [v9 containsObject:v4];

  if (v10)
  {
    uint64_t v11 = [(CRSInCallAssertionService *)self bannersAllowedConnections];
    [v11 removeObject:v4];
  }
  uint64_t v12 = [(CRSInCallAssertionService *)self connections];
  id v13 = [v4 instance];
  [v12 removeObjectForKey:v13];

  uint64_t v14 = CRSLogForCategory(2uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    BOOL v15 = [(CRSInCallAssertionService *)self connections];
    *(_DWORD *)buf = 134217984;
    uint64_t v21 = [v15 count];
    _os_log_impl(&dword_21D3CC000, v14, OS_LOG_TYPE_INFO, "Connection count: %ld", buf, 0xCu);
  }
  id v16 = [(CRSInCallAssertionService *)self connections];
  uint64_t v17 = [v16 count];

  if (!v17)
  {
    uint64_t v18 = CRSLogForCategory(2uLL);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D3CC000, v18, OS_LOG_TYPE_DEFAULT, "No more connections, requesting dismissal", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __63__CRSInCallAssertionService__connectionQueue_removeConnection___block_invoke;
    block[3] = &unk_264443420;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __63__CRSInCallAssertionService__connectionQueue_removeConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 inCallAssertionServiceDidDismiss:*(void *)(a1 + 32)];

  id v3 = [*(id *)(a1 + 32) observers];
  [v3 inCallAssertionService:*(void *)(a1 + 32) didSetBannersEnabled:1];
}

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BSServiceConnectionListener)listener
{
  return self->_listener;
}

- (void)setListener:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (NSMutableDictionary)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (NSHashTable)activatedConnections
{
  return self->_activatedConnections;
}

- (void)setActivatedConnections:(id)a3
{
}

- (NSHashTable)bannersAllowedConnections
{
  return self->_bannersAllowedConnections;
}

- (void)setBannersAllowedConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannersAllowedConnections, 0);
  objc_storeStrong((id *)&self->_activatedConnections, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end