@interface DCPresentmentClient
- (DCPresentmentClient)init;
- (NSXPCConnection)serverConnection;
- (id)createDaemonDisconnectedError;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)buildCredentialResponseForSelection:(id)a3 completion:(id)a4;
- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4;
- (void)buildResponseForSelection:(id)a3 completion:(id)a4;
- (void)configureWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4;
- (void)init;
- (void)interpretRequest:(id)a3 completion:(id)a4;
- (void)invalidate;
- (void)setServerConnection:(id)a3;
@end

@implementation DCPresentmentClient

- (DCPresentmentClient)init
{
  v3 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient init]();
  }

  v17.receiver = self;
  v17.super_class = (Class)DCPresentmentClient;
  v4 = [(DCPresentmentClient *)&v17 init];
  if (v4)
  {
    v5 = DC_LOG_CLIENT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DCPresentmentClient init](v5);
    }

    v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.idcredd.presentment.xpc" options:4096];
    [(DCPresentmentClient *)v4 setServerConnection:v6];

    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C5A1E80];
    v8 = [(DCPresentmentClient *)v4 serverConnection];
    [v8 setRemoteObjectInterface:v7];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    uint64_t v11 = objc_opt_class();
    v12 = objc_msgSend(v9, "setWithObjects:", v10, v11, objc_opt_class(), 0);
    v13 = [(DCPresentmentClient *)v4 serverConnection];
    v14 = [v13 remoteObjectInterface];
    [v14 setClasses:v12 forSelector:sel_interpretRequest_completion_ argumentIndex:0 ofReply:1];

    v15 = [(DCPresentmentClient *)v4 serverConnection];
    [v15 activate];
  }
  return v4;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient dealloc called", v2, v3, v4, v5, v6);
}

- (void)configureWithPartitions:(id)a3 presentmentType:(unint64_t)a4 options:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient configureWithPartitions:presentmentType:options:completion:]();
  }

  v14 = [(DCPresentmentClient *)self remoteObjectProxyWithErrorHandler:v10];
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke;
  v16[3] = &unk_264228C90;
  v16[4] = self;
  id v17 = v10;
  id v15 = v10;
  [v14 configureWithPartitions:v12 presentmentType:a4 options:v11 completion:v16];
}

void __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DC_LOG_CLIENT();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG);
  if (v3)
  {
    if (v5) {
      __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_2();
    }
  }
  else if (v5)
  {
    __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)generateTransportKeyForSpecification:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  v7 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient generateTransportKeyForSpecification:completion:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke;
  v13[3] = &unk_264228CB8;
  id v8 = v6;
  id v14 = v8;
  v9 = [(DCPresentmentClient *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2;
  v11[3] = &unk_264228CE0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 generateTransportKeyForSpecification:a3 completion:v11];
}

uint64_t __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  v7 = DC_LOG_CLIENT();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)interpretRequest:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient interpretRequest:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __51__DCPresentmentClient_interpretRequest_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCPresentmentClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2;
  v12[3] = &unk_264228D08;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 interpretRequest:v7 completion:v12];
}

uint64_t __51__DCPresentmentClient_interpretRequest_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)buildResponseForSelection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient buildResponseForSelection:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCPresentmentClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2;
  v12[3] = &unk_264228CE0;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 buildResponseForSelection:v7 completion:v12];
}

uint64_t __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)buildCredentialResponseForSelection:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient buildCredentialResponseForSelection:completion:]();
  }

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke;
  v14[3] = &unk_264228CB8;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(DCPresentmentClient *)self remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2;
  v12[3] = &unk_264228D30;
  v12[4] = self;
  id v13 = v9;
  id v11 = v9;
  [v10 buildCredentialResponseForSelection:v7 completion:v12];
}

uint64_t __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)buildErrorResponseWithStatus:(unint64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[DCPresentmentClient buildErrorResponseWithStatus:completion:]();
  }

  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke;
  v13[3] = &unk_264228CB8;
  id v8 = v6;
  id v14 = v8;
  id v9 = [(DCPresentmentClient *)self remoteObjectProxyWithErrorHandler:v13];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2;
  v11[3] = &unk_264228CE0;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 buildErrorResponseWithStatus:a3 completion:v11];
}

uint64_t __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DC_LOG_CLIENT();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);
  if (v5)
  {
    if (v8) {
      __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_2();
    }
  }
  else if (v8)
  {
    __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCCredentialStoreClient invalidate", v2, v3, v4, v5, v6);
}

- (id)createDaemonDisconnectedError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"DCPresentmentSession" code:-5001 userInfo:0];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DCPresentmentClient *)self serverConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_264228C90;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DC_LOG_CLIENT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) createDaemonDisconnectedError];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)init
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient init called", v2, v3, v4, v5, v6);
}

- (void)configureWithPartitions:presentmentType:options:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient configure", v2, v3, v4, v5, v6);
}

void __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient configureWithPartitions returned successfully", v2, v3, v4, v5, v6);
}

void __82__DCPresentmentClient_configureWithPartitions_presentmentType_options_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCPresentmentClient configureWithPartitions returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)generateTransportKeyForSpecification:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient generateTransportKey", v2, v3, v4, v5, v6);
}

void __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient generateTransportKey returned successfully", v2, v3, v4, v5, v6);
}

void __71__DCPresentmentClient_generateTransportKeyForSpecification_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCPresentmentClient generateTransportKey returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)interpretRequest:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient interpretRequest", v2, v3, v4, v5, v6);
}

void __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient interpretRequest returned successfully", v2, v3, v4, v5, v6);
}

void __51__DCPresentmentClient_interpretRequest_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCPresentmentClient interpretRequest returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)buildResponseForSelection:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient buildResponseForSelection", v2, v3, v4, v5, v6);
}

void __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient buildResponseForSelection returned successfully", v2, v3, v4, v5, v6);
}

void __60__DCPresentmentClient_buildResponseForSelection_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCPresentmentClient buildResponseForSelection returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)buildCredentialResponseForSelection:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient buildCredentialResponseForSelection", v2, v3, v4, v5, v6);
}

void __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient buildCredentialResponseForSelection returned successfully", v2, v3, v4, v5, v6);
}

void __70__DCPresentmentClient_buildCredentialResponseForSelection_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCPresentmentClient buildCredentialResponseForSelection returned with error %{public}@", v2, v3, v4, v5, v6);
}

- (void)buildErrorResponseWithStatus:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient buildErrorResponseWithStatus", v2, v3, v4, v5, v6);
}

void __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_214B14000, v0, v1, "DCPresentmentClient buildErrorResponseWithStatus returned successfully", v2, v3, v4, v5, v6);
}

void __63__DCPresentmentClient_buildErrorResponseWithStatus_completion___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_214B14000, v0, v1, "DCPresentmentClient buildErrorResponseWithStatus returned with error %{public}@", v2, v3, v4, v5, v6);
}

void __57__DCPresentmentClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_214B14000, v0, OS_LOG_TYPE_ERROR, "DCPresentmentClient remote object proxy error: %{public}@", v1, 0xCu);
}

@end