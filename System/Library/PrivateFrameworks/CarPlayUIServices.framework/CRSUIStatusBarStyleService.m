@interface CRSUIStatusBarStyleService
- (BOOL)isSiriPresentation;
- (BSServiceConnectionListener)listener;
- (CARObserverHashTable)observers;
- (CRSUIStatusBarStyleService)init;
- (NSHashTable)connections;
- (OS_dispatch_queue)connectionQueue;
- (int64_t)colorVariant;
- (int64_t)interfaceStyle;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)addObserver:(id)a3;
- (void)clientAcquireForSiriPresentationWithFenceHandle:(id)a3 animationSettings:(id)a4;
- (void)clientAcquireWithInterfaceStyle:(id)a3 colorVariant:(id)a4 fenceHandle:(id)a5 animationSettings:(id)a6;
- (void)clientReliquishWithFenceHandle:(id)a3 animationSettings:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)removeObserver:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setListener:(id)a3;
- (void)setObservers:(id)a3;
@end

@implementation CRSUIStatusBarStyleService

- (CRSUIStatusBarStyleService)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)CRSUIStatusBarStyleService;
  v2 = [(CRSUIStatusBarStyleService *)&v21 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26C95C350];
    observers = v2->_observers;
    v2->_observers = (CARObserverHashTable *)v3;

    v5 = [MEMORY[0x263F29C50] serial];
    uint64_t v6 = BSDispatchQueueCreate();
    connectionQueue = v2->_connectionQueue;
    v2->_connectionQueue = (OS_dispatch_queue *)v6;

    uint64_t v8 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    connections = v2->_connections;
    v2->_connections = (NSHashTable *)v8;

    v2->_lock._os_unfair_lock_opaque = 0;
    uint64_t v10 = objc_opt_new();
    lock_assertions = v2->_lock_assertions;
    v2->_lock_assertions = (NSMutableArray *)v10;

    v12 = (void *)MEMORY[0x263F3F6A0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __34__CRSUIStatusBarStyleService_init__block_invoke;
    v19[3] = &unk_2643076D0;
    v13 = v2;
    v20 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v19];
    id v15 = v13[4];
    v13[4] = (id)v14;

    v16 = CRSUILogForCategory(0);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v13[4];
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_21817A000, v16, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    [v13[4] activate];
  }
  return v2;
}

void __34__CRSUIStatusBarStyleService_init__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay.StatusBar"];
  uint64_t v3 = +[CRSUIStatusBarStyleSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)addObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIStatusBarStyleService *)self observers];
  [v5 addObserver:v4];
}

- (void)removeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIStatusBarStyleService *)self observers];
  [v5 removeObserver:v4];
}

- (int64_t)interfaceStyle
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  lock_assertions = self->_lock_assertions;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __44__CRSUIStatusBarStyleService_interfaceStyle__block_invoke;
  v7[3] = &unk_264307BD0;
  v7[4] = &v8;
  [(NSMutableArray *)lock_assertions enumerateObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_lock);
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __44__CRSUIStatusBarStyleService_interfaceStyle__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 interfaceStyle])
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 interfaceStyle];
    *a4 = 1;
  }
}

- (int64_t)colorVariant
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = -1;
  lock_assertions = self->_lock_assertions;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __42__CRSUIStatusBarStyleService_colorVariant__block_invoke;
  v7[3] = &unk_264307BD0;
  v7[4] = &v8;
  [(NSMutableArray *)lock_assertions enumerateObjectsUsingBlock:v7];
  os_unfair_lock_unlock(p_lock);
  int64_t v5 = v9[3];
  _Block_object_dispose(&v8, 8);
  return v5;
}

void __42__CRSUIStatusBarStyleService_colorVariant__block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  if ([v6 colorVariant] != -1)
  {
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v6 colorVariant];
    *a4 = 1;
  }
}

- (BOOL)isSiriPresentation
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_lock_assertions lastObject];
  char v5 = [v4 isSiriPresentation];
  os_unfair_lock_unlock(p_lock);

  return v5;
}

- (void)invalidate
{
  id v2 = [(CRSUIStatusBarStyleService *)self listener];
  [v2 invalidate];
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
    _os_log_impl(&dword_21817A000, v7, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  uint64_t v8 = [v6 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.private.CarPlayUIServices.status-bar-style"];

  if (v9)
  {
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke;
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

    uint64_t v11 = [(CRSUIStatusBarStyleService *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_113;
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

void __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSUIStatusBarStyleSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  char v5 = +[CRSUIStatusBarStyleSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_264307BF8;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
  id v6 = [*(id *)(a1 + 32) connectionQueue];
  [v3 setTargetQueue:v6];
}

void __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __72__CRSUIStatusBarStyleService_listener_didReceiveConnection_withContext___block_invoke_113(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
}

- (void)clientAcquireWithInterfaceStyle:(id)a3 colorVariant:(id)a4 fenceHandle:(id)a5 animationSettings:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v27 = a6;
  v13 = [(CRSUIStatusBarStyleService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  uint64_t v14 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v35 = v10;
    __int16 v36 = 2112;
    id v37 = v11;
    _os_log_impl(&dword_21817A000, v14, OS_LOG_TYPE_DEFAULT, "Received override request! Style: %@, color variant: %@", buf, 0x16u);
  }

  if (v10)
  {
    uint64_t v15 = [v10 integerValue];
    if (v11)
    {
LABEL_5:
      uint64_t v16 = [v11 integerValue];
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v15 = 0;
    if (v11) {
      goto LABEL_5;
    }
  }
  uint64_t v16 = -1;
LABEL_8:
  id v17 = [MEMORY[0x263F3F688] currentContext];
  id v18 = [v17 instance];
  uint64_t v19 = v18;
  if (v18)
  {
    id v26 = v12;
    lock_assertions = self->_lock_assertions;
    v32[0] = MEMORY[0x263EF8330];
    v32[1] = 3221225472;
    v32[2] = __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke;
    v32[3] = &unk_264307C48;
    id v21 = v18;
    id v33 = v21;
    uint64_t v22 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v32];
    if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v22];
    }
    id v23 = objc_alloc_init(CRSUIStatusBarStyleAssertionData);
    [(CRSUIStatusBarStyleAssertionData *)v23 setIdentifier:v21];
    [(CRSUIStatusBarStyleAssertionData *)v23 setInterfaceStyle:v15];
    [(CRSUIStatusBarStyleAssertionData *)v23 setColorVariant:v16];
    [(NSMutableArray *)self->_lock_assertions addObject:v23];

    id v12 = v26;
  }
  os_unfair_lock_unlock(&self->_lock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke_2;
  block[3] = &unk_264307C70;
  id v29 = v12;
  v30 = self;
  id v31 = v27;
  id v24 = v27;
  id v25 = v12;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __105__CRSUIStatusBarStyleService_clientAcquireWithInterfaceStyle_colorVariant_fenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x263F1CBD0] _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) observers];
  [v2 statusBarStyleServiceUpdatedOverride:*(void *)(a1 + 40) animationSettings:*(void *)(a1 + 48)];
}

- (void)clientAcquireForSiriPresentationWithFenceHandle:(id)a3 animationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRSUIStatusBarStyleService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  char v9 = CRSUILogForCategory(0);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21817A000, v9, OS_LOG_TYPE_DEFAULT, "Received Siri presentation override request!", buf, 2u);
  }

  id v10 = [MEMORY[0x263F3F688] currentContext];
  id v11 = [v10 instance];
  id v12 = v11;
  if (v11)
  {
    lock_assertions = self->_lock_assertions;
    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke;
    v23[3] = &unk_264307C48;
    id v14 = v11;
    id v24 = v14;
    uint64_t v15 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v23];
    if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v15];
    }
    uint64_t v16 = objc_alloc_init(CRSUIStatusBarStyleAssertionData);
    [(CRSUIStatusBarStyleAssertionData *)v16 setIdentifier:v14];
    [(CRSUIStatusBarStyleAssertionData *)v16 setInterfaceStyle:0];
    [(CRSUIStatusBarStyleAssertionData *)v16 setColorVariant:-1];
    [(CRSUIStatusBarStyleAssertionData *)v16 setSiriPresentation:1];
    [(NSMutableArray *)self->_lock_assertions addObject:v16];
  }
  os_unfair_lock_unlock(&self->_lock);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke_2;
  v19[3] = &unk_264307C70;
  id v20 = v6;
  id v21 = self;
  id v22 = v7;
  id v17 = v7;
  id v18 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v19);
}

uint64_t __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __96__CRSUIStatusBarStyleService_clientAcquireForSiriPresentationWithFenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x263F1CBD0] _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) observers];
  [v2 statusBarStyleServiceUpdatedOverride:*(void *)(a1 + 40) animationSettings:*(void *)(a1 + 48)];
}

- (void)clientReliquishWithFenceHandle:(id)a3 animationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(CRSUIStatusBarStyleService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  char v9 = [MEMORY[0x263F3F688] currentContext];
  id v10 = [v9 instance];
  id v11 = v10;
  if (v10)
  {
    lock_assertions = self->_lock_assertions;
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke;
    v20[3] = &unk_264307C48;
    id v21 = v10;
    uint64_t v13 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v20];
    if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v13];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke_2;
  v16[3] = &unk_264307C70;
  id v17 = v6;
  id v18 = self;
  id v19 = v7;
  id v14 = v7;
  id v15 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v16);
}

uint64_t __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __79__CRSUIStatusBarStyleService_clientReliquishWithFenceHandle_animationSettings___block_invoke_2(uint64_t a1)
{
  [MEMORY[0x263F1CBD0] _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
  id v2 = [*(id *)(a1 + 40) observers];
  [v2 statusBarStyleServiceUpdatedOverride:*(void *)(a1 + 40) animationSettings:*(void *)(a1 + 48)];
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIStatusBarStyleService *)self connections];
  [v5 addObject:v4];
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIStatusBarStyleService *)self connections];
  [v5 removeObject:v4];

  os_unfair_lock_lock(&self->_lock);
  id v6 = [v4 instance];

  if (v6)
  {
    lock_assertions = self->_lock_assertions;
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke;
    v10[3] = &unk_264307C48;
    id v11 = v6;
    uint64_t v8 = [(NSMutableArray *)lock_assertions indexOfObjectPassingTest:v10];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      [(NSMutableArray *)self->_lock_assertions removeObjectAtIndex:v8];
    }
  }
  os_unfair_lock_unlock(&self->_lock);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke_2;
  v9[3] = &unk_264307AF0;
  v9[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 identifier];
  uint64_t v4 = [v3 isEqual:*(void *)(a1 + 32)];

  return v4;
}

void __64__CRSUIStatusBarStyleService__connectionQueue_removeConnection___block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) observers];
  [v2 statusBarStyleServiceUpdatedOverride:*(void *)(a1 + 32) animationSettings:0];
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

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_lock_assertions, 0);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [a1 remoteProcess];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_21817A000, a2, OS_LOG_TYPE_ERROR, "Process does not have the required entitlement: %@", (uint8_t *)&v4, 0xCu);
}

@end