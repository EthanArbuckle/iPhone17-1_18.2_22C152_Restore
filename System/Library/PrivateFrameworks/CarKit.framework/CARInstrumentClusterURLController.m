@interface CARInstrumentClusterURLController
- (BSServiceConnection)connection;
- (CARInstrumentClusterURLController)init;
- (OS_dispatch_queue)callbackQueue;
- (void)fetchInstrumentClusterURLs:(id)a3;
- (void)invalidate;
- (void)setCallbackQueue:(id)a3;
- (void)setConnection:(id)a3;
@end

@implementation CARInstrumentClusterURLController

- (CARInstrumentClusterURLController)init
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)CARInstrumentClusterURLController;
  v2 = [(CARInstrumentClusterURLController *)&v21 init];
  if (v2)
  {
    v3 = (void *)MEMORY[0x1E4F50BB8];
    v4 = +[CARAppHistoryServiceSpecification identifier];
    v5 = [v3 endpointForMachName:@"com.apple.CarPlayApp.service" service:v4 instance:0];

    v6 = +[CARAppHistoryServiceSpecification serviceQuality];
    [v6 serviceClass];
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();

    objc_storeStrong((id *)&v2->_callbackQueue, SerialWithQoS);
    uint64_t v8 = [MEMORY[0x1E4F50BA0] connectionWithEndpoint:v5];
    connection = v2->_connection;
    v2->_connection = (BSServiceConnection *)v8;

    v10 = v2->_connection;
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    v17 = __41__CARInstrumentClusterURLController_init__block_invoke;
    v18 = &unk_1E5E3BD50;
    v19 = v2;
    id v11 = SerialWithQoS;
    id v20 = v11;
    [(BSServiceConnection *)v10 configureConnection:&v15];
    v12 = CarGeneralLogging();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v2->_connection;
      *(_DWORD *)buf = 138412290;
      v23 = v13;
      _os_log_impl(&dword_1ABB00000, v12, OS_LOG_TYPE_DEFAULT, "Activating connection! %@", buf, 0xCu);
    }

    [(BSServiceConnection *)v2->_connection activate];
  }
  return v2;
}

void __41__CARInstrumentClusterURLController_init__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = +[CARAppHistoryServiceSpecification serviceQuality];
  [v5 setServiceQuality:v3];

  v4 = +[CARAppHistoryServiceSpecification interface];
  [v5 setInterface:v4];

  [v5 setInterfaceTarget:*(void *)(a1 + 32)];
  [v5 setActivationHandler:&__block_literal_global_27];
  [v5 setInterruptionHandler:&__block_literal_global_72];
  [v5 setInvalidationHandler:&__block_literal_global_75];
  [v5 setTargetQueue:*(void *)(a1 + 40)];
}

void __41__CARInstrumentClusterURLController_init__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "Connection activated! %@", (uint8_t *)&v4, 0xCu);
  }
}

void __41__CARInstrumentClusterURLController_init__block_invoke_70(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "[CRSAppHistoryController] connection interrupted! Reactivating... %@", (uint8_t *)&v4, 0xCu);
  }

  [v2 activate];
}

void __41__CARInstrumentClusterURLController_init__block_invoke_73(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "Connection invalidated! %@", (uint8_t *)&v4, 0xCu);
  }
}

- (void)fetchInstrumentClusterURLs:(id)a3
{
  id v4 = a3;
  id v5 = CarGeneralLogging();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1ABB00000, v5, OS_LOG_TYPE_DEFAULT, "Received request for cluster urls.", buf, 2u);
  }

  if (v4)
  {
    uint64_t v6 = [(CARInstrumentClusterURLController *)self connection];

    if (v6)
    {
      v7 = [(CARInstrumentClusterURLController *)self connection];
      uint64_t v8 = [v7 remoteTarget];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke;
      v11[3] = &unk_1E5E3AB10;
      id v12 = v4;
      [v8 serviceFetchInstrumentClusterURLs:v11];
    }
    else
    {
      v10 = CarGeneralLogging();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        -[CARInstrumentClusterURLController fetchInstrumentClusterURLs:](v10);
      }

      (*((void (**)(id, void, void))v4 + 2))(v4, MEMORY[0x1E4F1CBF0], 0);
    }
  }
  else
  {
    v9 = CarGeneralLogging();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[CARInstrumentClusterURLController fetchInstrumentClusterURLs:](v9);
    }
  }
}

void __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = CarGeneralLogging();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v5;
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1ABB00000, v7, OS_LOG_TYPE_DEFAULT, "received urls: %@ error: %@", (uint8_t *)&v9, 0x16u);
  }

  uint64_t v8 = objc_msgSend(v5, "bs_compactMap:", &__block_literal_global_80);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke_77(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [MEMORY[0x1E4F1CB10] URLWithString:v2];
  if (!v3)
  {
    id v4 = CarGeneralLogging();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke_77_cold_1((uint64_t)v2, v4);
    }
  }
  return v3;
}

- (void)invalidate
{
  v3 = CarGeneralLogging();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1ABB00000, v3, OS_LOG_TYPE_DEFAULT, "[CARInstrumentClusterURLController] invalidating connection.", v5, 2u);
  }

  id v4 = [(CARInstrumentClusterURLController *)self connection];
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

- (void)fetchInstrumentClusterURLs:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "No completion handler provided to return URLs.", v1, 2u);
}

- (void)fetchInstrumentClusterURLs:(os_log_t)log .cold.2(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1ABB00000, log, OS_LOG_TYPE_ERROR, "No service connection available to fetch URLs.", v1, 2u);
}

void __64__CARInstrumentClusterURLController_fetchInstrumentClusterURLs___block_invoke_77_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1ABB00000, a2, OS_LOG_TYPE_ERROR, "Error creating URL from string: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end