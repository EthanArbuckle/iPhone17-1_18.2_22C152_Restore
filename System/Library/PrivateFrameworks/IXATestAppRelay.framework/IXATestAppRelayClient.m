@interface IXATestAppRelayClient
- (IXATestAppRelayClient)init;
- (NSXPCConnection)connection;
- (void)_disconnect;
- (void)_initializeConnection;
- (void)dealloc;
- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4;
- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7;
- (void)setConnection:(id)a3;
- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4;
@end

@implementation IXATestAppRelayClient

- (IXATestAppRelayClient)init
{
  v5.receiver = self;
  v5.super_class = (Class)IXATestAppRelayClient;
  v2 = [(IXATestAppRelayClient *)&v5 init];
  v3 = v2;
  if (v2) {
    [(IXATestAppRelayClient *)v2 _initializeConnection];
  }
  return v3;
}

- (void)dealloc
{
  [(IXATestAppRelayClient *)self _disconnect];
  v3.receiver = self;
  v3.super_class = (Class)IXATestAppRelayClient;
  [(IXATestAppRelayClient *)&v3 dealloc];
}

- (void)_initializeConnection
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_2529B8000, log, OS_LOG_TYPE_ERROR, "Client is establishing connection to server.", v1, 2u);
}

- (void)_disconnect
{
  if (self->_connection)
  {
    objc_super v3 = IXATestAppRelayLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v5 = 0;
      _os_log_impl(&dword_2529B8000, v3, OS_LOG_TYPE_DEFAULT, "Client is disconnecting from server.", v5, 2u);
    }

    [(NSXPCConnection *)self->_connection invalidate];
    connection = self->_connection;
    self->_connection = 0;
  }
}

- (void)registerEndpoint:(id)a3 forServiceName:(id)a4 withEntitlement:(id)a5 canReplace:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  v16 = [(IXATestAppRelayClient *)self connection];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke;
  v19[3] = &unk_265385A68;
  id v20 = v12;
  id v17 = v12;
  v18 = [v16 synchronousRemoteObjectProxyWithErrorHandler:v19];

  [v18 registerEndpoint:v15 forServiceName:v14 withEntitlement:v13 canReplace:v7 completion:v17];
}

void __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = IXATestAppRelayLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)unregisterEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(IXATestAppRelayClient *)self connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __69__IXATestAppRelayClient_unregisterEndpointForServiceName_completion___block_invoke;
  v11[3] = &unk_265385A68;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

  [v10 unregisterEndpointForServiceName:v7 completion:v9];
}

void __69__IXATestAppRelayClient_unregisterEndpointForServiceName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = IXATestAppRelayLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)fetchEndpointForServiceName:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [(IXATestAppRelayClient *)self connection];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __64__IXATestAppRelayClient_fetchEndpointForServiceName_completion___block_invoke;
  v11[3] = &unk_265385A68;
  id v12 = v6;
  id v9 = v6;
  v10 = [v8 synchronousRemoteObjectProxyWithErrorHandler:v11];

  [v10 fetchEndpointForServiceName:v7 completion:v9];
}

void __64__IXATestAppRelayClient_fetchEndpointForServiceName_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = IXATestAppRelayLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(v3);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (NSXPCConnection)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

void __95__IXATestAppRelayClient_registerEndpoint_forServiceName_withEntitlement_canReplace_completion___block_invoke_cold_1(void *a1)
{
  id v1 = [a1 description];
  [v1 UTF8String];
  OUTLINED_FUNCTION_0(&dword_2529B8000, v2, v3, "Remote object proxy error: %{private}s", v4, v5, v6, v7, 3u);
}

@end