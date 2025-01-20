@interface CRSUIVolumeNotificationService
- (BOOL)hasConnectionForBundleIdentifier:(id)a3;
- (BOOL)isNotificationBlockedForBundleIdentifier:(id)a3;
- (BSServiceConnectionListener)listener;
- (CARObserverHashTable)observers;
- (CRSUIVolumeNotificationService)init;
- (NSMutableDictionary)connections;
- (OS_dispatch_queue)connectionQueue;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)addObserver:(id)a3;
- (void)clientCancelSuspension;
- (void)clientSuspendNotifications;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CRSUIVolumeNotificationService

- (CRSUIVolumeNotificationService)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)CRSUIVolumeNotificationService;
  v2 = [(CRSUIVolumeNotificationService *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26C95C3B0];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    v5 = [MEMORY[0x263F29C50] serial];
    uint64_t v6 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    connections = v2->_connections;
    v2->_connections = v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = objc_opt_new();
    lock_assertions = v2->_lock_assertions;
    v2->_lock_assertions = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x263F3F6A0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __38__CRSUIVolumeNotificationService_init__block_invoke;
    v19[3] = &unk_2643076D0;
    v13 = v2;
    v20 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v19];
    id v15 = v13[3];
    v13[3] = (id)v14;

    v16 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v13[3];
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_21817A000, v16, OS_LOG_TYPE_DEFAULT, "Volume notification activating listener! %@", buf, 0xCu);
    }

    [v13[3] activate];
  }
  return v2;
}

void __38__CRSUIVolumeNotificationService_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay.VolumeNotification"];
  uint64_t v3 = +[CRSUIVolumeNotificationSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (BOOL)isNotificationBlockedForBundleIdentifier:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = [(CRSUIVolumeNotificationService *)self connections];
  v7 = [v6 objectForKeyedSubscript:v5];

  uint64_t v8 = [v7 instance];
  v9 = (void *)v8;
  if (v7 && v8)
  {
    lock_assertions = self->_lock_assertions;
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __75__CRSUIVolumeNotificationService_isNotificationBlockedForBundleIdentifier___block_invoke;
    v15[3] = &unk_264307C98;
    id v16 = v7;
    uint64_t v11 = [(NSMutableArray *)lock_assertions indexOfObjectWithOptions:2 passingTest:v15];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      os_unfair_lock_unlock(p_lock);
      char v12 = 0;
    }
    else
    {
      v13 = [(NSMutableArray *)self->_lock_assertions objectAtIndex:v11];
      char v12 = [v13 blockNotification];
      os_unfair_lock_unlock(p_lock);
    }
  }
  else
  {
    os_unfair_lock_unlock(p_lock);
    char v12 = 0;
  }

  return v12;
}

uint64_t __75__CRSUIVolumeNotificationService_isNotificationBlockedForBundleIdentifier___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 identifier];
  id v4 = [*(id *)(a1 + 32) instance];
  uint64_t v5 = [v3 isEqual:v4];

  return v5;
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIVolumeNotificationService *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIVolumeNotificationService *)self observers];
  [v5 removeObserver:v4];
}

- (void)invalidate
{
  uint64_t v3 = [(CRSUIVolumeNotificationService *)self connections];
  [v3 removeAllObjects];

  id v4 = [(CRSUIVolumeNotificationService *)self listener];
  [v4 invalidate];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_21817A000, v7, OS_LOG_TYPE_INFO, "Volume notification received connection! %@", buf, 0xCu);
  }

  uint64_t v8 = [v6 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.private.CarPlayUIServices.volume-notification"];

  if (v9)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke;
    v16[3] = &unk_264307C20;
    v16[4] = self;
    [v6 configureConnection:v16];
    uint64_t v10 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v6;
      _os_log_impl(&dword_21817A000, v10, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    uint64_t v11 = [(CRSUIVolumeNotificationService *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_99;
    block[3] = &unk_264307890;
    block[4] = self;
    id v12 = v6;
    id v15 = v12;
    dispatch_async(v11, block);

    [v12 activate];
  }
  else
  {
    v13 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[CRSUIStatusBarStyleService listener:didReceiveConnection:withContext:](v6, v13);
    }

    [v6 invalidate];
  }
}

void __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSUIVolumeNotificationSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  id v5 = +[CRSUIVolumeNotificationSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_264307BF8;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
  id v6 = [*(id *)(a1 + 32) connectionQueue];
  [v3 setTargetQueue:v6];
}

void __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __76__CRSUIVolumeNotificationService_listener_didReceiveConnection_withContext___block_invoke_99(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
}

- (void)clientSuspendNotifications
{
  id v3 = [(CRSUIVolumeNotificationService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  id v4 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21817A000, v4, OS_LOG_TYPE_DEFAULT, "Volume notification received override request!", buf, 2u);
  }

  id v5 = [MEMORY[0x263F3F688] currentContext];
  id v6 = [v5 instance];
  v7 = v6;
  if (v6)
  {
    lock_assertions = self->_lock_assertions;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke;
    v13[3] = &unk_264307C98;
    id v9 = v6;
    id v14 = v9;
    uint64_t v10 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v13];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v10];
    }
    uint64_t v11 = objc_alloc_init(CRSUIVolumeNotificationAssertionData);
    [(CRSUIVolumeNotificationAssertionData *)v11 setIdentifier:v9];
    [(CRSUIVolumeNotificationAssertionData *)v11 setBlockNotification:1];
    [(NSMutableArray *)self->_lock_assertions addObject:v11];
  }
  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke_2;
  v12[3] = &unk_264307AF0;
  v12[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v12);
}

uint64_t __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __60__CRSUIVolumeNotificationService_clientSuspendNotifications__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 volumeNotificationServiceUpdated:*(void *)(a1 + 32)];
}

- (BOOL)hasConnectionForBundleIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIVolumeNotificationService *)self connections];
  id v6 = [v5 objectForKeyedSubscript:v4];

  return v6 != 0;
}

- (void)clientCancelSuspension
{
  id v3 = CRSUILogForCategory(1uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21817A000, v3, OS_LOG_TYPE_DEFAULT, "Volume notification client relinquish received", buf, 2u);
  }

  id v4 = [(CRSUIVolumeNotificationService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  id v5 = [MEMORY[0x263F3F688] currentContext];
  id v6 = [v5 instance];
  v7 = v6;
  if (v6)
  {
    lock_assertions = self->_lock_assertions;
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke;
    v11[3] = &unk_264307C98;
    id v12 = v6;
    uint64_t v9 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v11];
    if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v9];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke_2;
  v10[3] = &unk_264307AF0;
  v10[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v10);
}

uint64_t __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __56__CRSUIVolumeNotificationService_clientCancelSuspension__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 volumeNotificationServiceUpdated:*(void *)(a1 + 32)];
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4 = a3;
  id v7 = [(CRSUIVolumeNotificationService *)self connections];
  id v5 = [v4 remoteProcess];
  id v6 = [v5 bundleIdentifier];
  [v7 setObject:v4 forKeyedSubscript:v6];
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIVolumeNotificationService *)self connections];
  id v6 = [v4 remoteProcess];
  id v7 = [v6 bundleIdentifier];
  [v5 removeObjectForKey:v7];

  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = [v4 instance];

  if (v8)
  {
    lock_assertions = self->_lock_assertions;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke;
    v12[3] = &unk_264307C98;
    id v13 = v8;
    uint64_t v10 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v12];
    if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v10];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke_2;
  v11[3] = &unk_264307AF0;
  void v11[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v11);
}

uint64_t __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __68__CRSUIVolumeNotificationService__connectionQueue_removeConnection___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 volumeNotificationServiceUpdated:*(void *)(a1 + 32)];
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

- (CARObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_lock_assertions, 0);
}

@end