@interface CRSAppHistoryController
- (BSServiceConnection)connection;
- (CRSAppHistoryController)init;
- (OS_dispatch_queue)callbackQueue;
- (void)addAnalyticsValues:(id)a3 toEvent:(unint64_t)a4 completion:(id)a5;
- (void)fetchDockAppForCategory:(unint64_t)a3 completion:(id)a4;
- (void)fetchSessionEchoContextsWithCompletion:(id)a3;
- (void)fetchSessionUIContextsWithCompletion:(id)a3;
- (void)fetchUIContextsWithCompletion:(id)a3;
- (void)invalidate;
- (void)setCallbackQueue:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation CRSAppHistoryController

- (CRSAppHistoryController)init
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v21.receiver = self;
  v21.super_class = (Class)CRSAppHistoryController;
  v2 = [(CRSAppHistoryController *)&v21 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x263F2B9C0];
    v4 = [MEMORY[0x263F30DF0] identifier];
    v5 = [v3 endpointForMachName:@"com.apple.CarPlayApp.service" service:v4 instance:0];

    v6 = [MEMORY[0x263F30DF0] serviceQuality];
    [v6 serviceClass];
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();

    objc_storeStrong((id *)&v2->_callbackQueue, SerialWithQoS);
    uint64_t v8 = [MEMORY[0x263F2B9B8] connectionWithEndpoint:v5];
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v8;

    v10 = v2->_connection;
    uint64_t v15 = MEMORY[0x263EF8330];
    uint64_t v16 = 3221225472;
    v17 = __31__CRSAppHistoryController_init__block_invoke;
    v18 = &unk_2644435D8;
    v19 = v2;
    id v11 = SerialWithQoS;
    id v20 = v11;
    [(BSServiceConnection *)v10 configureConnection:&v15];
    v12 = CRSLogForCategory(1uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_21D3CC000, v12, OS_LOG_TYPE_INFO, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v2->_connection activate];
  }
  return v2;
}

void __31__CRSAppHistoryController_init__block_invoke(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x263F30DF0];
  id v6 = a2;
  v4 = [v3 serviceQuality];
  [v6 setServiceQuality:v4];

  v5 = [MEMORY[0x263F30DF0] interface];
  [v6 setInterface:v5];

  [v6 setInterfaceTarget:*(void *)(a1 + 32)];
  [v6 setActivationHandler:&__block_literal_global_6];
  [v6 setInterruptionHandler:&__block_literal_global_42];
  [v6 setInvalidationHandler:&__block_literal_global_45];
  [v6 setTargetQueue:*(void *)(a1 + 40)];
}

void __31__CRSAppHistoryController_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }
}

void __31__CRSAppHistoryController_init__block_invoke_40(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "[CRSAppHistoryController] connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __31__CRSAppHistoryController_init__block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  v3 = CRSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)fetchDockAppForCategory:(unint64_t)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a4;
  if (v6)
  {
    v7 = CRSLogForCategory(0);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [NSNumber numberWithUnsignedInteger:a3];
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_21D3CC000, v7, OS_LOG_TYPE_DEFAULT, "Received request for dock app in category %@.", buf, 0xCu);
    }
    v9 = [(CRSAppHistoryController *)self connection];
    v10 = [v9 remoteTarget];
    id v11 = [NSNumber numberWithUnsignedInteger:a3];
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    v12[2] = __62__CRSAppHistoryController_fetchDockAppForCategory_completion___block_invoke;
    v12[3] = &unk_264443600;
    id v13 = v6;
    [v10 fetchDockAppInCategory:v11 completion:v12];
  }
}

uint64_t __62__CRSAppHistoryController_fetchDockAppForCategory_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchUIContextsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = CRSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received UI Context fetch.", buf, 2u);
    }

    id v6 = [(CRSAppHistoryController *)self connection];
    v7 = [v6 remoteTarget];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __57__CRSAppHistoryController_fetchUIContextsWithCompletion___block_invoke;
    v8[3] = &unk_264443628;
    id v9 = v4;
    [v7 fetchUIContextStatesWithCompletion:v8];
  }
}

uint64_t __57__CRSAppHistoryController_fetchUIContextsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionUIContextsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = CRSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received session UI Context fetch.", buf, 2u);
    }

    id v6 = [(CRSAppHistoryController *)self connection];
    v7 = [v6 remoteTarget];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __64__CRSAppHistoryController_fetchSessionUIContextsWithCompletion___block_invoke;
    v8[3] = &unk_264443628;
    id v9 = v4;
    [v7 fetchSessionUIContextStatesWithCompletion:v8];
  }
}

uint64_t __64__CRSAppHistoryController_fetchSessionUIContextsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchSessionEchoContextsWithCompletion:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = CRSLogForCategory(0);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21D3CC000, v5, OS_LOG_TYPE_DEFAULT, "Received session Echo Context fetch.", buf, 2u);
    }

    id v6 = [(CRSAppHistoryController *)self connection];
    v7 = [v6 remoteTarget];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __66__CRSAppHistoryController_fetchSessionEchoContextsWithCompletion___block_invoke;
    v8[3] = &unk_264443628;
    id v9 = v4;
    [v7 fetchSessionEchoContextStatesWithCompletion:v8];
  }
}

uint64_t __66__CRSAppHistoryController_fetchSessionEchoContextsWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)addAnalyticsValues:(id)a3 toEvent:(unint64_t)a4 completion:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  if (a5)
  {
    id v9 = a5;
    v10 = CRSLogForCategory(0);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [NSNumber numberWithUnsignedInteger:a4];
      v12 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      int v16 = 138412546;
      v17 = v11;
      __int16 v18 = 2112;
      v19 = v12;
      _os_log_impl(&dword_21D3CC000, v10, OS_LOG_TYPE_DEFAULT, "Sending session analytics payload for event %@ with %@ item(s).", (uint8_t *)&v16, 0x16u);
    }
    id v13 = [(CRSAppHistoryController *)self connection];
    v14 = [v13 remoteTarget];
    uint64_t v15 = [NSNumber numberWithUnsignedInteger:a4];
    [v14 setAnalyticsValues:v8 onEvent:v15 completion:v9];
  }
}

- (void)invalidate
{
  v3 = CRSLogForCategory(0);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_21D3CC000, v3, OS_LOG_TYPE_INFO, "[CRSAppHistoryController] invalidating connection.", v5, 2u);
  }

  id v4 = [(CRSAppHistoryController *)self connection];
  [v4 invalidate];
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

@end