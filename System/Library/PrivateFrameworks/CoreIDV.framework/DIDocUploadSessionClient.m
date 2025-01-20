@interface DIDocUploadSessionClient
- (DIDocUploadSessionClient)init;
- (NSXPCConnection)serverConnection;
- (id)createDaemonDisconnectedError;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (void)cancelUploads;
- (void)dealloc;
- (void)init;
- (void)setServerConnection:(id)a3;
- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5;
@end

@implementation DIDocUploadSessionClient

- (DIDocUploadSessionClient)init
{
  v3 = DIV_LOG_CLIENT();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    -[DIDocUploadSessionClient init]();
  }

  v16.receiver = self;
  v16.super_class = (Class)DIDocUploadSessionClient;
  v4 = [(DIDocUploadSessionClient *)&v16 init];
  if (v4)
  {
    v5 = DIV_LOG_CLIENT();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DIDocUploadSessionClient init](v5);
    }

    v6 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.coreidvd.docUpload.xpc" options:4096];
    [(DIDocUploadSessionClient *)v4 setServerConnection:v6];

    v7 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C57D6A0];
    v8 = [(DIDocUploadSessionClient *)v4 serverConnection];
    [v8 setRemoteObjectInterface:v7];

    v9 = (void *)MEMORY[0x263EFFA08];
    uint64_t v10 = objc_opt_class();
    v11 = objc_msgSend(v9, "setWithObjects:", v10, objc_opt_class(), 0);
    v12 = [(DIDocUploadSessionClient *)v4 serverConnection];
    v13 = [v12 remoteObjectInterface];
    [v13 setClasses:v11 forSelector:sel_uploadDocData_uploadSettings_completion_ argumentIndex:0 ofReply:0];

    v14 = [(DIDocUploadSessionClient *)v4 serverConnection];
    [v14 activate];
  }
  return v4;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "DIDocUploadSessionClient dealloc", v2, v3, v4, v5, v6);
}

- (void)uploadDocData:(id)a3 uploadSettings:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  v11 = DIV_LOG_CLIENT();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[DIDocUploadSessionClient uploadDocData:uploadSettings:completion:]();
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke;
  v17[3] = &unk_26421C3D0;
  id v12 = v8;
  id v18 = v12;
  v13 = [(DIDocUploadSessionClient *)self remoteObjectProxyWithErrorHandler:v17];
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2;
  v15[3] = &unk_26421C3F8;
  v15[4] = self;
  id v16 = v12;
  id v14 = v12;
  [v13 uploadDocData:v10 uploadSettings:v9 completion:v15];
}

uint64_t __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    v7 = DIV_LOG_CLIENT();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_2(v5, v7);
    }
  }
  if (v6)
  {
    id v8 = DIV_LOG_CLIENT();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_1((uint64_t)v6, v8);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)cancelUploads
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "DIDocUploadSessionClient cancelUploads", v2, v3, v4, v5, v6);
}

- (id)createDaemonDisconnectedError
{
  return (id)[MEMORY[0x263F087E8] errorWithDomain:@"DIDocUploadSession" code:-8001 userInfo:0];
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DIDocUploadSessionClient *)self serverConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_26421C420;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DIV_LOG_CLIENT();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
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
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "DIDocUploadSessionClient init called", v2, v3, v4, v5, v6);
}

- (void)uploadDocData:uploadSettings:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "DIDocUploadSessionClient uploadDocData", v2, v3, v4, v5, v6);
}

void __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2147E0000, a2, OS_LOG_TYPE_DEBUG, "DIDocUploadSessionClient uploadDocData returned error = %{public}@", (uint8_t *)&v2, 0xCu);
}

void __68__DIDocUploadSessionClient_uploadDocData_uploadSettings_completion___block_invoke_2_cold_2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 description];
  int v4 = 138543362;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_2147E0000, a2, OS_LOG_TYPE_DEBUG, "DIDocUploadSessionClient uploadDocData returned data = %{public}@", (uint8_t *)&v4, 0xCu);
}

void __62__DIDocUploadSessionClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2147E0000, a2, OS_LOG_TYPE_ERROR, "DIDocUploadSessionClient remote object proxy error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end