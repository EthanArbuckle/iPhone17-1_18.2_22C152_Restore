@interface CRSIconLayoutService
- (BSInvalidatable)temporaryWatchdogMonitoringAssertion;
- (BSServiceConnectionListener)listener;
- (CRSIconLayoutService)initWithDelegate:(id)a3;
- (CRSIconLayoutServiceDelegate)delegate;
- (NSHashTable)connections;
- (OS_dispatch_queue)connectionQueue;
- (id)_newInvalidRequestErrorDueToNilVehicleID;
- (void)_connectionQueue_addConnection:(id)a3;
- (void)_connectionQueue_removeConnection:(id)a3;
- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 vehicleID:(id)a4 drawBorder:(id)a5 completion:(id)a6;
- (void)fetchIconStateForVehicleID:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)resetIconStateForVehicleID:(id)a3;
- (void)setConnectionQueue:(id)a3;
- (void)setConnections:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIconState:(id)a3 forVehicleID:(id)a4;
- (void)setListener:(id)a3;
- (void)setTemporaryWatchdogMonitoringAssertion:(id)a3;
@end

@implementation CRSIconLayoutService

- (CRSIconLayoutService)initWithDelegate:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)CRSIconLayoutService;
  v5 = [(CRSIconLayoutService *)&v21 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = [MEMORY[0x263F29C50] serial];
    uint64_t v8 = BSDispatchQueueCreate();
    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    uint64_t v10 = [MEMORY[0x263F088B0] hashTableWithOptions:512];
    connections = v6->_connections;
    v6->_connections = (NSHashTable *)v10;

    v12 = (void *)MEMORY[0x263F2B9E0];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __41__CRSIconLayoutService_initWithDelegate___block_invoke;
    v19[3] = &unk_264443130;
    v13 = v6;
    v20 = v13;
    uint64_t v14 = [v12 listenerWithConfigurator:v19];
    id v15 = v13[2];
    v13[2] = (id)v14;

    v16 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = v13[2];
      *(_DWORD *)buf = 138412290;
      id v23 = v17;
      _os_log_impl(&dword_21D3CC000, v16, OS_LOG_TYPE_INFO, "Activating listener! %@", buf, 0xCu);
    }

    [v13[2] activate];
  }

  return v6;
}

void __41__CRSIconLayoutService_initWithDelegate___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  [v4 setDomain:@"com.apple.CarPlay"];
  v3 = +[CRSIconLayoutServiceSpecification identifier];
  [v4 setService:v3];

  [v4 setDelegate:*(void *)(a1 + 32)];
}

- (void)invalidate
{
}

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  v7 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_21D3CC000, v7, OS_LOG_TYPE_INFO, "Received connection! %@", buf, 0xCu);
  }

  uint64_t v8 = [v6 remoteProcess];
  char v9 = [v8 hasEntitlement:@"com.apple.private.CarPlayServices.icon-layout"];

  if (v9)
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke;
    v15[3] = &unk_264443180;
    v15[4] = self;
    [v6 configureConnection:v15];
    uint64_t v10 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_21D3CC000, v10, OS_LOG_TYPE_INFO, "Activating connection... %@", buf, 0xCu);
    }

    v11 = [(CRSIconLayoutService *)self connectionQueue];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_16;
    block[3] = &unk_2644431A8;
    block[4] = self;
    id v14 = v6;
    dispatch_async(v11, block);
  }
  else
  {
    v12 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[CRSIconLayoutService listener:didReceiveConnection:withContext:](v6, v12);
    }

    [v6 invalidate];
  }
}

void __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[CRSIconLayoutServiceSpecification serviceQuality];
  [v3 setServiceQuality:v4];

  v5 = +[CRSIconLayoutServiceSpecification interface];
  [v3 setInterface:v5];

  [v3 setInterfaceTarget:*(void *)(a1 + 32)];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_2;
  v7[3] = &unk_264443158;
  v7[4] = *(void *)(a1 + 32);
  [v3 setInvalidationHandler:v7];
  id v6 = [*(id *)(a1 + 32) connectionQueue];
  [v3 setTargetQueue:v6];
}

void __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl(&dword_21D3CC000, v4, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_removeConnection:", v3);
}

uint64_t __66__CRSIconLayoutService_listener_didReceiveConnection_withContext___block_invoke_16(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_connectionQueue_addConnection:", *(void *)(a1 + 40));
  v2 = *(void **)(a1 + 40);
  return [v2 activate];
}

- (void)fetchIconStateForVehicleID:(id)a3 completion:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v6;
    _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_DEFAULT, "Received request for icon state for vehicle: %{public}@", buf, 0xCu);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__CRSIconLayoutService_fetchIconStateForVehicleID_completion___block_invoke;
  block[3] = &unk_2644431D0;
  v13 = self;
  id v14 = v7;
  id v12 = v6;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__CRSIconLayoutService_fetchIconStateForVehicleID_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) delegate];
    id v4 = [v2 iconLayoutService:*(void *)(a1 + 40) dataProviderForVehicleID:*(void *)(a1 + 32)];

    [v4 getIconStateWithCompletion:*(void *)(a1 + 48)];
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 48);
    if (!v3) {
      return;
    }
    id v4 = (id)[*(id *)(a1 + 40) _newInvalidRequestErrorDueToNilVehicleID];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)setIconState:(id)a3 forVehicleID:(id)a4
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v14 = v7;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_21D3CC000, v8, OS_LOG_TYPE_DEFAULT, "Received request to set icon state for vehicle: %{public}@ to %@", buf, 0x16u);
  }

  if (v7)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __50__CRSIconLayoutService_setIconState_forVehicleID___block_invoke;
    block[3] = &unk_2644431F8;
    void block[4] = self;
    id v11 = v7;
    id v12 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
  else
  {
    id v9 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CRSIconLayoutService setIconState:forVehicleID:](v9);
    }
  }
}

void __50__CRSIconLayoutService_setIconState_forVehicleID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 iconLayoutService:*(void *)(a1 + 32) dataProviderForVehicleID:*(void *)(a1 + 40)];

  [v3 setIconState:*(void *)(a1 + 48)];
}

- (void)resetIconStateForVehicleID:(id)a3
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v10 = v4;
    _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received request to reset icon state for vehicle: %{public}@", buf, 0xCu);
  }

  if (v4)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __51__CRSIconLayoutService_resetIconStateForVehicleID___block_invoke;
    v7[3] = &unk_2644431A8;
    v7[4] = self;
    id v8 = v4;
    dispatch_async(MEMORY[0x263EF83A0], v7);
  }
  else
  {
    id v6 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[CRSIconLayoutService resetIconStateForVehicleID:](v6);
    }
  }
}

void __51__CRSIconLayoutService_resetIconStateForVehicleID___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 iconLayoutService:*(void *)(a1 + 32) dataProviderForVehicleID:*(void *)(a1 + 40)];

  [v3 resetIconState];
}

- (void)fetchApplicationIconInformationForBundleIdentifier:(id)a3 vehicleID:(id)a4 drawBorder:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = CRSLogForCategory(1uLL);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v26 = v10;
    __int16 v27 = 2114;
    id v28 = v11;
    _os_log_impl(&dword_21D3CC000, v14, OS_LOG_TYPE_DEFAULT, "Received request for icon information for %{public}@, vehicle: %{public}@", buf, 0x16u);
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __107__CRSIconLayoutService_fetchApplicationIconInformationForBundleIdentifier_vehicleID_drawBorder_completion___block_invoke;
  block[3] = &unk_264443220;
  id v23 = v12;
  id v24 = v13;
  id v20 = v11;
  objc_super v21 = self;
  id v22 = v10;
  id v15 = v12;
  id v16 = v10;
  id v17 = v13;
  id v18 = v11;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __107__CRSIconLayoutService_fetchApplicationIconInformationForBundleIdentifier_vehicleID_drawBorder_completion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    v2 = [*(id *)(a1 + 40) delegate];
    id v4 = [v2 iconLayoutService:*(void *)(a1 + 40) dataProviderForVehicleID:*(void *)(a1 + 32)];

    objc_msgSend(v4, "getApplicationIconInformationForBundleID:drawBorder:completion:", *(void *)(a1 + 48), objc_msgSend(*(id *)(a1 + 56), "BOOLValue"), *(void *)(a1 + 64));
  }
  else
  {
    uint64_t v3 = *(void *)(a1 + 64);
    if (!v3) {
      return;
    }
    id v4 = (id)[*(id *)(a1 + 40) _newInvalidRequestErrorDueToNilVehicleID];
    (*(void (**)(uint64_t, void))(v3 + 16))(v3, 0);
  }
}

- (void)_connectionQueue_addConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(CRSIconLayoutService *)self connections];
  [v5 addObject:v4];

  id v6 = [(CRSIconLayoutService *)self temporaryWatchdogMonitoringAssertion];

  if (!v6)
  {
    id v8 = [MEMORY[0x263F3F510] sharedInstance];
    id v7 = [v8 assertWatchdogEnabledForLimitedDurationForReason:@"CarPlayIconLayoutService"];
    [(CRSIconLayoutService *)self setTemporaryWatchdogMonitoringAssertion:v7];
  }
}

- (void)_connectionQueue_removeConnection:(id)a3
{
  id v4 = a3;
  int v5 = [(CRSIconLayoutService *)self connections];
  [v5 removeObject:v4];

  id v6 = [(CRSIconLayoutService *)self connections];
  uint64_t v7 = [v6 count];

  if (!v7)
  {
    id v8 = [(CRSIconLayoutService *)self temporaryWatchdogMonitoringAssertion];
    [v8 invalidate];

    [(CRSIconLayoutService *)self setTemporaryWatchdogMonitoringAssertion:0];
  }
}

- (id)_newInvalidRequestErrorDueToNilVehicleID
{
  v8[1] = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x263F087E8];
  uint64_t v3 = CRSIconLayoutServiceErrorDomain;
  uint64_t v7 = *MEMORY[0x263F08320];
  v8[0] = @"Invalid request for a nil vehicle ID";
  id v4 = [NSDictionary dictionaryWithObjects:v8 forKeys:&v7 count:1];
  int v5 = [v2 errorWithDomain:v3 code:1 userInfo:v4];

  return v5;
}

- (CRSIconLayoutServiceDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (CRSIconLayoutServiceDelegate *)WeakRetained;
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

- (NSHashTable)connections
{
  return self->_connections;
}

- (void)setConnections:(id)a3
{
}

- (BSInvalidatable)temporaryWatchdogMonitoringAssertion
{
  return self->_temporaryWatchdogMonitoringAssertion;
}

- (void)setTemporaryWatchdogMonitoringAssertion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_temporaryWatchdogMonitoringAssertion, 0);
  objc_storeStrong((id *)&self->_connections, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)listener:(void *)a1 didReceiveConnection:(NSObject *)a2 withContext:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 remoteProcess];
  int v4 = 138412290;
  int v5 = v3;
  _os_log_error_impl(&dword_21D3CC000, a2, OS_LOG_TYPE_ERROR, "Process does not have the required entitlement: %@", (uint8_t *)&v4, 0xCu);
}

- (void)setIconState:(os_log_t)log forVehicleID:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D3CC000, log, OS_LOG_TYPE_ERROR, "Invalid request to set icon state for nil vehicle ID", v1, 2u);
}

- (void)resetIconStateForVehicleID:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21D3CC000, log, OS_LOG_TYPE_ERROR, "Invalid request to reset icon state for nil vehicle ID", v1, 2u);
}

@end