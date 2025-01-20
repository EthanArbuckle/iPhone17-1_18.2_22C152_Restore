@interface CRSSessionService
- (BOOL)isActive;
- (BSServiceConnectionListener)listener;
- (CRSSessionService)initWithDelegate:(id)a3;
- (CRSSessionServiceDelegate)delegate;
- (NSHashTable)lock_connections;
- (OS_dispatch_queue)connectionQueue;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)setConnectionQueue:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
- (void)setLock_connections:(id)a3;
@end

@implementation CRSSessionService

- (CRSSessionService)initWithDelegate:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRSSessionService;
  v5 = [(CRSSessionService *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x263F29C50] serial];
    uint64_t v8 = BSDispatchQueueCreate();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    lock_connections = v6->_lock_connections;
    v6->_lock_connections = (NSHashTable *)v10;

    v12 = (void *)MEMORY[0x263F2B9E0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __38__CRSSessionService_initWithDelegate___block_invoke;
    v19[3] = &unk_264443130;
    v13 = v6;
    v20 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v19];
    id v15 = v13[3];
    v13[3] = (id)v14;

    v16 = CRSLogForCategory(3uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = v13[3];
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_21D3CC000, v16, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    [v13[3] activate];
  }

  return v6;
}

void __38__CRSSessionService_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay"];
  v3 = +[CRSSessionSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (BOOL)isActive
{
  v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = [(NSHashTable *)v2->_lock_connections count] != 0;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_21D3CC000, v7, OS_LOG_TYPE_DEFAULT, "Received connection! %@", buf, 0xCu);
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke;
  v13[3] = &unk_264443180;
  v13[4] = self;
  [v6 configureConnection:v13];
  uint64_t v8 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v15 = v6;
    _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
  }

  v9 = [(CRSSessionService *)self connectionQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_10;
  block[3] = &unk_2644431A8;
  block[4] = self;
  id v12 = v6;
  id v10 = v6;
  dispatch_async(v9, block);

  [v10 activate];
}

void __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSSessionSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSSessionSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_264443158;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
  id v6 = [*(id *)(a1 + 32) connectionQueue];
  [v3 setTargetQueue:v6];
}

void __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21D3CC000, v4, OS_LOG_TYPE_DEFAULT, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __63__CRSSessionService_listener_didReceiveConnection_withContext___block_invoke_10(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
}

- (void)_connectionQueue_addConnection:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_connections addObject:v5];

  id v6 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v7 = [(NSHashTable *)self->_lock_connections count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v10 = v7;
    _os_log_impl(&dword_21D3CC000, v6, OS_LOG_TYPE_DEFAULT, "Connection count: %ld", buf, 0xCu);
  }

  os_unfair_lock_unlock(p_lock);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__CRSSessionService__connectionQueue_addConnection___block_invoke;
  block[3] = &unk_264443420;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__CRSSessionService__connectionQueue_addConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sessionServiceBecameActive:*(void *)(a1 + 32)];
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSHashTable *)self->_lock_connections removeObject:v5];

  id v6 = CRSLogForCategory(3uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    NSUInteger v7 = [(NSHashTable *)self->_lock_connections count];
    *(_DWORD *)buf = 134217984;
    NSUInteger v12 = v7;
    _os_log_impl(&dword_21D3CC000, v6, OS_LOG_TYPE_DEFAULT, "Connection count: %ld", buf, 0xCu);
  }

  NSUInteger v8 = [(NSHashTable *)self->_lock_connections count];
  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    v9 = CRSLogForCategory(3uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D3CC000, v9, OS_LOG_TYPE_DEFAULT, "No more connections!", buf, 2u);
    }

    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __55__CRSSessionService__connectionQueue_removeConnection___block_invoke;
    block[3] = &unk_264443420;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

void __55__CRSSessionService__connectionQueue_removeConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 sessionServiceBecameInactive:*(void *)(a1 + 32)];
}

- (CRSSessionServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSSessionServiceDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
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

- (NSHashTable)lock_connections
{
  return self->_lock_connections;
}

- (void)setLock_connections:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end