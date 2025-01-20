@interface CRSUIPunchThroughService
- (BSServiceConnectionListener)listener;
- (CRSUIPunchThroughService)initWithDelegate:(id)a3;
- (CRSUIPunchThroughServiceDelegate)delegate;
- (NSHashTable)connections;
- (NSMapTable)connectionToPunchThroughIdentifierMap;
- (OS_dispatch_queue)connectionQueue;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)clientRequestDismissalForPunchThroughIdentifier:(id)a3 completion:(id)a4;
- (void)clientRequestPresentationForPunchThroughIdentifier:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)punchThroughIdentifierDidDismiss:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnectionToPunchThroughIdentifierMap:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setListener:(id)a3;
@end

@implementation CRSUIPunchThroughService

- (CRSUIPunchThroughService)initWithDelegate:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CRSUIPunchThroughService;
  v5 = [(CRSUIPunchThroughService *)&v22 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v6->_lock._os_unfair_lock_opaque = 0;
    uint64_t Serial = BSDispatchQueueCreateSerial();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)Serial;

    uint64_t v9 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    connections = v6->_connections;
    v6->_connections = (NSHashTable *)v9;

    uint64_t v11 = [MEMORY[0x263F08968] strongToStrongObjectsMapTable];
    connectionToPunchThroughIdentifierMap = v6->_connectionToPunchThroughIdentifierMap;
    v6->_connectionToPunchThroughIdentifierMap = (NSMapTable *)v11;

    v13 = (void *)MEMORY[0x263F3F6A0];
    v20[0] = MEMORY[0x263EF8330];
    v20[1] = 3221225472;
    v20[2] = __45__CRSUIPunchThroughService_initWithDelegate___block_invoke;
    v20[3] = &unk_2643076D0;
    v14 = v6;
    v21 = v14;
    uint64_t v15 = [v13 listenerWithConfigurator:v20];
    id v16 = v14[3];
    v14[3] = (id)v15;

    v17 = CRSUILogForCategory(5uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      id v18 = v14[3];
      *(_DWORD *)buf = 138412290;
      id v24 = v18;
      _os_log_impl(&dword_21817A000, v17, OS_LOG_TYPE_DEFAULT, "Activating listener! %@", buf, 0xCu);
    }

    [v14[3] activate];
  }

  return v6;
}

void __45__CRSUIPunchThroughService_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay.PunchThrough"];
  v3 = +[CRSUIPunchThroughSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)punchThroughIdentifierDidDismiss:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v6 = self->_connectionToPunchThroughIdentifierMap;
  uint64_t v7 = [(NSMapTable *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        v12 = -[NSMapTable objectForKey:](self->_connectionToPunchThroughIdentifierMap, "objectForKey:", v11, (void)v16);
        if ([v12 isEqual:v4])
        {
          id v13 = v11;

          goto LABEL_11;
        }
      }
      uint64_t v8 = [(NSMapTable *)v6 countByEnumeratingWithState:&v16 objects:v24 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v13 = 0;
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  if (v13)
  {
    v14 = CRSUILogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      id v21 = v4;
      __int16 v22 = 2114;
      id v23 = v13;
      _os_log_impl(&dword_21817A000, v14, OS_LOG_TYPE_DEFAULT, "Punch through %{public}@ dismissed by server, informing client %{public}@", buf, 0x16u);
    }

    uint64_t v15 = [v13 remoteTarget];
    [v15 serverDismissedPunchThroughIdentifier:v4];
  }
}

- (void)invalidate
{
  v3 = CRSUILogForCategory(5uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21817A000, v3, OS_LOG_TYPE_DEFAULT, "Invalidating service", v5, 2u);
  }

  id v4 = [(CRSUIPunchThroughService *)self listener];
  [v4 invalidate];
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = CRSUILogForCategory(5uLL);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v28 = v9;
    _os_log_impl(&dword_21817A000, v11, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  v12 = [v9 remoteProcess];
  char v13 = [v12 hasEntitlement:@"com.apple.private.CarPlayUIServices.punch-through"];

  if (v13)
  {
    objc_initWeak(&location, self);
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke;
    v24[3] = &unk_264307868;
    objc_copyWeak(&v25, &location);
    [v9 configureConnection:v24];
    v14 = CRSUILogForCategory(5uLL);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v28 = v9;
      _os_log_impl(&dword_21817A000, v14, OS_LOG_TYPE_DEFAULT, "Activating connection... %@", buf, 0xCu);
    }

    uint64_t v15 = [(CRSUIPunchThroughService *)self connectionQueue];
    uint64_t v18 = MEMORY[0x263EF8330];
    uint64_t v19 = 3221225472;
    v20 = __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_13;
    id v21 = &unk_264307890;
    __int16 v22 = self;
    id v16 = v9;
    id v23 = v16;
    dispatch_async(v15, &v18);

    objc_msgSend(v16, "activate", v18, v19, v20, v21, v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak(&location);
  }
  else
  {
    long long v17 = CRSUILogForCategory(5uLL);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[CRSUIPunchThroughService listener:didReceiveConnection:withContext:](v9, v17);
    }

    [v9 invalidate];
  }
}

void __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSUIPunchThroughSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSUIPunchThroughSpecification interface];
  [v3 setInterface:v5];

  v6 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [v3 setInterfaceTarget:WeakRetained];

  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_2;
  v10[3] = &unk_2643076F8;
  objc_copyWeak(&v11, v6);
  [v3 setInvalidationHandler:v10];
  id v8 = objc_loadWeakRetained(v6);
  id v9 = [v8 connectionQueue];
  [v3 setTargetQueue:v9];

  objc_destroyWeak(&v11);
}

void __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = CRSUILogForCategory(5uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__CRSUIClusterThemeService_listener_didReceiveConnection_withContext___block_invoke_2_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_connectionQueue_removeConnection:", v3);
}

uint64_t __70__CRSUIPunchThroughService_listener_didReceiveConnection_withContext___block_invoke_13(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
}

- (void)clientRequestPresentationForPunchThroughIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [(CRSUIPunchThroughService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  id v9 = [MEMORY[0x263F3F688] currentContext];
  id v10 = [(CRSUIPunchThroughService *)self connectionToPunchThroughIdentifierMap];
  [v10 setObject:v6 forKey:v9];

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __90__CRSUIPunchThroughService_clientRequestPresentationForPunchThroughIdentifier_completion___block_invoke;
  v12[3] = &unk_264307890;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
  v7[2](v7, 0);
}

void __90__CRSUIPunchThroughService_clientRequestPresentationForPunchThroughIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 punchThroughService:*(void *)(a1 + 32) presentPunchThroughWithIdentifier:*(void *)(a1 + 40)];
}

- (void)clientRequestDismissalForPunchThroughIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(id, void))a4;
  id v8 = [(CRSUIPunchThroughService *)self connectionQueue];
  BSDispatchQueueAssert();

  os_unfair_lock_lock(&self->_lock);
  id v9 = [MEMORY[0x263F3F688] currentContext];
  id v10 = [(CRSUIPunchThroughService *)self connectionToPunchThroughIdentifierMap];
  [v10 removeObjectForKey:v9];

  os_unfair_lock_unlock(&self->_lock);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __87__CRSUIPunchThroughService_clientRequestDismissalForPunchThroughIdentifier_completion___block_invoke;
  v12[3] = &unk_264307890;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v12);
  v7[2](v7, 0);
}

void __87__CRSUIPunchThroughService_clientRequestDismissalForPunchThroughIdentifier_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 punchThroughService:*(void *)(a1 + 32) dismissPunchThroughWithIdentifier:*(void *)(a1 + 40)];
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIPunchThroughService *)self connections];
  [v5 addObject:v4];
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4 = a3;
  id v5 = [(CRSUIPunchThroughService *)self connections];
  [v5 removeObject:v4];

  os_unfair_lock_lock(&self->_lock);
  id v6 = [MEMORY[0x263F3F688] currentContext];
  uint64_t v7 = [(CRSUIPunchThroughService *)self connectionToPunchThroughIdentifierMap];
  id v8 = [v7 objectForKey:v6];

  if (v8)
  {
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __62__CRSUIPunchThroughService__connectionQueue_removeConnection___block_invoke;
    v9[3] = &unk_264307890;
    v9[4] = self;
    id v10 = v8;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
  os_unfair_lock_unlock(&self->_lock);
}

void __62__CRSUIPunchThroughService__connectionQueue_removeConnection___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 punchThroughService:*(void *)(a1 + 32) dismissPunchThroughWithIdentifier:*(void *)(a1 + 40)];
}

- (CRSUIPunchThroughServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSUIPunchThroughServiceDelegate *)WeakRetained;
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

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (NSMapTable)connectionToPunchThroughIdentifierMap
{
  return self->_connectionToPunchThroughIdentifierMap;
}

- (void)setConnectionToPunchThroughIdentifierMap:(id)a3
{
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setConnectionQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connectionToPunchThroughIdentifierMap, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
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