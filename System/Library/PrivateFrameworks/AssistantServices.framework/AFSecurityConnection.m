@interface AFSecurityConnection
- (AFSecurityConnection)init;
- (AFSecurityConnection)initWithInstanceContext:(id)a3;
- (id)_connection;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5;
- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5;
- (void)_invalidateConnection;
- (void)_processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)_processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)dealloc;
- (void)internalAuthAppleConnectServiceTicket:(id)a3;
- (void)internalAuthSessionToken:(id)a3;
- (void)invalidate;
- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5;
- (void)setInternalAuthAppleConnectServiceTicket:(id)a3 completion:(id)a4;
- (void)setInternalAuthSessionToken:(id)a3 completion:(id)a4;
- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6;
@end

@implementation AFSecurityConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_instanceContext, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_dispatchCallbackForProcessedDataMap:(id)a3 errorMap:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__AFSecurityConnection__dispatchCallbackForProcessedDataMap_errorMap_completion___block_invoke;
    block[3] = &unk_1E592C598;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(callbackQueue, block);
  }
}

uint64_t __81__AFSecurityConnection__dispatchCallbackForProcessedDataMap_errorMap_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_dispatchCallbackForProcessedData:(id)a3 error:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = v10;
  if (v10)
  {
    callbackQueue = self->_callbackQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __75__AFSecurityConnection__dispatchCallbackForProcessedData_error_completion___block_invoke;
    block[3] = &unk_1E592C598;
    id v16 = v10;
    id v14 = v8;
    id v15 = v9;
    dispatch_async(callbackQueue, block);
  }
}

uint64_t __75__AFSecurityConnection__dispatchCallbackForProcessedData_error_completion___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AFSecurityConnection *)self _connection];
  if (v10)
  {
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke;
    v18[3] = &unk_1E5924CC0;
    objc_copyWeak(&v20, &location);
    id v11 = v9;
    id v19 = v11;
    v12 = [v10 remoteObjectProxyWithErrorHandler:v18];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke_2;
    v15[3] = &unk_1E5924D10;
    objc_copyWeak(&v17, &location);
    id v16 = v11;
    [v12 processDataMap:v8 usingProcedure:a4 completion:v15];

    objc_destroyWeak(&v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }
  else
  {
    v22 = @"error";
    v13 = +[AFError errorWithCode:1606];
    v23[0] = v13;
    id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
    [(AFSecurityConnection *)self _dispatchCallbackForProcessedDataMap:0 errorMap:v14 completion:v9];
  }
}

void __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke(uint64_t a1, void *a2)
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  v7 = @"error";
  v8[0] = v4;
  v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
  [WeakRetained _dispatchCallbackForProcessedDataMap:0 errorMap:v6 completion:*(void *)(a1 + 32)];
}

void __66__AFSecurityConnection__processDataMap_usingProcedure_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _dispatchCallbackForProcessedDataMap:v7 errorMap:v6 completion:*(void *)(a1 + 32)];
}

- (void)_processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = [(AFSecurityConnection *)self _connection];
  if (v10)
  {
    objc_initWeak(&location, self);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke;
    v17[3] = &unk_1E5924CC0;
    objc_copyWeak(&v19, &location);
    id v11 = v9;
    id v18 = v11;
    v12 = [v10 remoteObjectProxyWithErrorHandler:v17];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke_2;
    v14[3] = &unk_1E5924CE8;
    objc_copyWeak(&v16, &location);
    id v15 = v11;
    [v12 processData:v8 usingProcedure:a4 completion:v14];

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
  else
  {
    v13 = +[AFError errorWithCode:1606];
    [(AFSecurityConnection *)self _dispatchCallbackForProcessedData:0 error:v13 completion:v9];
  }
}

void __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke(uint64_t a1, void *a2)
{
  v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained _dispatchCallbackForProcessedData:0 error:v4 completion:*(void *)(a1 + 32)];
}

void __63__AFSecurityConnection__processData_usingProcedure_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  v5 = (id *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained _dispatchCallbackForProcessedData:v7 error:v6 completion:*(void *)(a1 + 32)];
}

- (void)_connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    id v7 = "-[AFSecurityConnection _connectionInvalidated]";
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__AFSecurityConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __46__AFSecurityConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateConnection];
}

- (void)_connectionInterrupted
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v3 = 136315138;
    id v4 = "-[AFSecurityConnection _connectionInterrupted]";
    _os_log_error_impl(&dword_19CF1D000, v2, OS_LOG_TYPE_ERROR, "%s ", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_invalidateConnection
{
  connection = self->_connection;
  if (connection)
  {
    [(NSXPCConnection *)connection invalidate];
    id v4 = self->_connection;
    self->_connection = 0;
  }
}

- (id)_connection
{
  connection = self->_connection;
  if (!connection)
  {
    instanceContext = self->_instanceContext;
    if (!instanceContext)
    {
      uint64_t v5 = +[AFInstanceContext defaultContext];
      id v6 = self->_instanceContext;
      self->_instanceContext = v5;

      instanceContext = self->_instanceContext;
    }
    id v7 = [(AFInstanceContext *)instanceContext createXPCConnectionWithMachServiceName:@"com.apple.assistant.security" options:0];
    uint64_t v8 = self->_connection;
    self->_connection = v7;

    [(NSXPCConnection *)self->_connection _setQueue:self->_connectionQueue];
    id v9 = self->_connection;
    id v10 = AFSecurityServiceGetXPCInterface();
    [(NSXPCConnection *)v9 setRemoteObjectInterface:v10];

    objc_initWeak(&location, self);
    id v11 = self->_connection;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __35__AFSecurityConnection__connection__block_invoke;
    v16[3] = &unk_1E592B978;
    objc_copyWeak(&v17, &location);
    [(NSXPCConnection *)v11 setInterruptionHandler:v16];
    v12 = self->_connection;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __35__AFSecurityConnection__connection__block_invoke_2;
    v14[3] = &unk_1E592B978;
    objc_copyWeak(&v15, &location);
    [(NSXPCConnection *)v12 setInvalidationHandler:v14];
    [(NSXPCConnection *)self->_connection resume];
    objc_destroyWeak(&v15);
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
    connection = self->_connection;
  }
  return connection;
}

void __35__AFSecurityConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __35__AFSecurityConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)internalAuthSessionToken:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self->_callbackQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke;
  v13[3] = &unk_1E5924C70;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  uint64_t v8 = (void *)MEMORY[0x19F3A50D0](v13);
  connectionQueue = self->_connectionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_3;
  v11[3] = &unk_1E592C6E8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(connectionQueue, v11);
}

void __49__AFSecurityConnection_internalAuthSessionToken___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_2;
    block[3] = &unk_1E592C598;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

void __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_4;
  v6[3] = &unk_1E592B9A0;
  id v7 = *(id *)(a1 + 40);
  int v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_5;
  v4[3] = &unk_1E5924C98;
  id v5 = *(id *)(a1 + 40);
  [v3 internalAuthSessionToken:v4];
}

uint64_t __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __49__AFSecurityConnection_internalAuthSessionToken___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)internalAuthAppleConnectServiceTicket:(id)a3
{
  id v4 = a3;
  id v5 = self->_callbackQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke;
  v13[3] = &unk_1E5924C70;
  id v14 = v5;
  id v15 = v4;
  id v6 = v5;
  id v7 = v4;
  uint64_t v8 = (void *)MEMORY[0x19F3A50D0](v13);
  connectionQueue = self->_connectionQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_3;
  v11[3] = &unk_1E592C6E8;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  dispatch_async(connectionQueue, v11);
}

void __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(void **)(a1 + 40);
  if (v7)
  {
    uint64_t v8 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_2;
    block[3] = &unk_1E592C598;
    id v12 = v7;
    id v10 = v5;
    id v11 = v6;
    dispatch_async(v8, block);
  }
}

void __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_4;
  v6[3] = &unk_1E592B9A0;
  id v7 = *(id *)(a1 + 40);
  int v3 = [v2 remoteObjectProxyWithErrorHandler:v6];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_5;
  v4[3] = &unk_1E5924C98;
  id v5 = *(id *)(a1 + 40);
  [v3 internalAuthAppleConnectServiceTicket:v4];
}

uint64_t __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __62__AFSecurityConnection_internalAuthAppleConnectServiceTicket___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)setInternalAuthSessionToken:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_callbackQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke;
  v18[3] = &unk_1E5929680;
  id v19 = v8;
  id v20 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x19F3A50D0](v18);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_3;
  block[3] = &unk_1E592C598;
  id v16 = v6;
  id v17 = v11;
  void block[4] = self;
  id v13 = v6;
  id v14 = v11;
  dispatch_async(connectionQueue, block);
}

void __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_2;
    v6[3] = &unk_1E592C6E8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_4;
  v7[3] = &unk_1E592B9A0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_5;
  v5[3] = &unk_1E592B9A0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 setInternalAuthSessionToken:v4 completion:v5];
}

uint64_t __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __63__AFSecurityConnection_setInternalAuthSessionToken_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setInternalAuthAppleConnectServiceTicket:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_callbackQueue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke;
  v18[3] = &unk_1E5929680;
  id v19 = v8;
  id v20 = v7;
  id v9 = v8;
  id v10 = v7;
  id v11 = (void *)MEMORY[0x19F3A50D0](v18);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_3;
  block[3] = &unk_1E592C598;
  id v16 = v6;
  id v17 = v11;
  void block[4] = self;
  id v13 = v6;
  id v14 = v11;
  dispatch_async(connectionQueue, block);
}

void __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_2;
    v6[3] = &unk_1E592C6E8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_4;
  v7[3] = &unk_1E592B9A0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_5;
  v5[3] = &unk_1E592B9A0;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 setInternalAuthAppleConnectServiceTicket:v4 completion:v5];
}

uint64_t __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __76__AFSecurityConnection_setInternalAuthAppleConnectServiceTicket_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)setKeychainValue:(id)a3 forKey:(id)a4 accountIdentifier:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = self->_callbackQueue;
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke;
  v28[3] = &unk_1E5929680;
  v29 = v14;
  id v30 = v13;
  id v15 = v14;
  id v16 = v13;
  id v17 = (void *)MEMORY[0x19F3A50D0](v28);
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_3;
  block[3] = &unk_1E5928E40;
  id v26 = v12;
  id v27 = v17;
  void block[4] = self;
  id v24 = v10;
  id v25 = v11;
  id v19 = v12;
  id v20 = v11;
  id v21 = v10;
  id v22 = v17;
  dispatch_async(connectionQueue, block);
}

void __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void **)(a1 + 40);
  if (v4)
  {
    id v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_2;
    v6[3] = &unk_1E592C6E8;
    id v8 = v4;
    id v7 = v3;
    dispatch_async(v5, v6);
  }
}

void __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_4;
  v9[3] = &unk_1E592B9A0;
  id v10 = *(id *)(a1 + 64);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_5;
  v7[3] = &unk_1E592B9A0;
  uint64_t v6 = *(void *)(a1 + 56);
  id v8 = *(id *)(a1 + 64);
  [v3 setKeychainValue:v4 forKey:v5 accountIdentifier:v6 completion:v7];
}

uint64_t __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __77__AFSecurityConnection_setKeychainValue_forKey_accountIdentifier_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)processDataMap:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (a4)
    {
      if (v8)
      {
        connectionQueue = self->_connectionQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __65__AFSecurityConnection_processDataMap_usingProcedure_completion___block_invoke;
        block[3] = &unk_1E5926858;
        void block[4] = self;
        id v17 = v8;
        int64_t v19 = a4;
        id v18 = v9;
        dispatch_async(connectionQueue, block);

        goto LABEL_8;
      }
      id v20 = @"error";
      id v11 = +[AFError errorWithCode:1603];
      id v21 = v11;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      id v13 = &v21;
      id v14 = &v20;
    }
    else
    {
      id v22 = @"error";
      id v11 = +[AFError errorWithCode:1600];
      v23[0] = v11;
      id v12 = (void *)MEMORY[0x1E4F1C9E8];
      id v13 = (void **)v23;
      id v14 = &v22;
    }
    id v15 = [v12 dictionaryWithObjects:v13 forKeys:v14 count:1];
    [(AFSecurityConnection *)self _dispatchCallbackForProcessedDataMap:0 errorMap:v15 completion:v9];
  }
LABEL_8:
}

uint64_t __65__AFSecurityConnection_processDataMap_usingProcedure_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processDataMap:*(void *)(a1 + 40) usingProcedure:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)processData:(id)a3 usingProcedure:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (v9)
  {
    if (a4)
    {
      if (v8)
      {
        connectionQueue = self->_connectionQueue;
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __62__AFSecurityConnection_processData_usingProcedure_completion___block_invoke;
        v13[3] = &unk_1E5926858;
        void v13[4] = self;
        id v14 = v8;
        int64_t v16 = a4;
        id v15 = v9;
        dispatch_async(connectionQueue, v13);

        goto LABEL_8;
      }
      uint64_t v11 = 1603;
    }
    else
    {
      uint64_t v11 = 1600;
    }
    id v12 = +[AFError errorWithCode:v11];
    [(AFSecurityConnection *)self _dispatchCallbackForProcessedData:0 error:v12 completion:v9];
  }
LABEL_8:
}

uint64_t __62__AFSecurityConnection_processData_usingProcedure_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _processData:*(void *)(a1 + 40) usingProcedure:*(void *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)invalidate
{
  connectionQueue = self->_connectionQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__AFSecurityConnection_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  void block[4] = self;
  dispatch_async(connectionQueue, block);
}

uint64_t __34__AFSecurityConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidateConnection];
}

- (void)dealloc
{
  [(AFSecurityConnection *)self _invalidateConnection];
  v3.receiver = self;
  v3.super_class = (Class)AFSecurityConnection;
  [(AFSecurityConnection *)&v3 dealloc];
}

- (AFSecurityConnection)init
{
  return [(AFSecurityConnection *)self initWithInstanceContext:0];
}

- (AFSecurityConnection)initWithInstanceContext:(id)a3
{
  id v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFSecurityConnection;
  uint64_t v6 = [(AFSecurityConnection *)&v14 init];
  if (v6)
  {
    id v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.assistant.security.connection", v7);

    connectionQueue = v6->_connectionQueue;
    v6->_connectionQueue = (OS_dispatch_queue *)v8;

    id v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v11 = dispatch_queue_create("com.apple.assistant.security.callback", v10);

    callbackQueue = v6->_callbackQueue;
    v6->_callbackQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v6->_instanceContext, a3);
  }

  return v6;
}

@end