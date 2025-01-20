@interface SOServiceConnection
- (BOOL)_connectToService;
- (NSXPCConnection)xpcConnection;
- (OS_dispatch_queue)queue;
- (SOServiceConnection)initWithQueue:(id)a3;
- (id)_doConnectWithOptions:(unint64_t)a3;
- (void)_connectToService;
- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)cancelAuthorization:(id)a3 completion:(id)a4;
- (void)configurationWithCompletion:(id)a3;
- (void)dealloc;
- (void)debugHintsWithCompletion:(id)a3;
- (void)finishAuthorization:(id)a3 completion:(id)a4;
- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5;
- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4;
- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4;
- (void)profilesWithExtensionBundleIdentifier:(id)a3 completion:(id)a4;
- (void)realmsWithCompletion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setXpcConnection:(id)a3;
@end

@implementation SOServiceConnection

- (SOServiceConnection)initWithQueue:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SOServiceConnection;
  v5 = [(SOServiceConnection *)&v8 init];
  v6 = v5;
  if (v5)
  {
    [(SOServiceConnection *)v5 setQueue:v4];
    [(SOServiceConnection *)v6 _connectToService];
  }

  return v6;
}

- (void)setQueue:(id)a3
{
}

- (void)configurationWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(SOServiceConnection *)self _connectToService])
  {
    v5 = [(SOServiceConnection *)self xpcConnection];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __51__SOServiceConnection_configurationWithCompletion___block_invoke;
    v9[3] = &unk_1E6A6EE00;
    id v6 = v4;
    id v10 = v6;
    v7 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v9];
    [v7 configurationWithCompletion:v6];
  }
  else if (v4)
  {
    objc_super v8 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v8);
  }
}

- (BOOL)_connectToService
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(SOServiceConnection *)self xpcConnection];

  if (v3)
  {
    id v4 = SO_LOG_SOServiceConnection();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SOServiceConnection _connectToService]();
    }

    return 1;
  }
  v5 = [(SOServiceConnection *)self _doConnectWithOptions:4096];
  [(SOServiceConnection *)self setXpcConnection:v5];

  id v6 = [(SOServiceConnection *)self xpcConnection];

  if (v6)
  {
    v7 = +[SOInternalProtocols interfaceWithInternalProtocol:&unk_1F2EB2AD0];
    objc_super v8 = [(SOServiceConnection *)self xpcConnection];
    [v8 setRemoteObjectInterface:v7];

    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __40__SOServiceConnection__connectToService__block_invoke;
    v19[3] = &unk_1E6A6EE48;
    objc_copyWeak(&v20, &location);
    v9 = [(SOServiceConnection *)self xpcConnection];
    [v9 setInvalidationHandler:v19];

    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __40__SOServiceConnection__connectToService__block_invoke_71;
    v17[3] = &unk_1E6A6EE48;
    objc_copyWeak(&v18, &location);
    id v10 = [(SOServiceConnection *)self xpcConnection];
    [v10 setInterruptionHandler:v17];

    v11 = [(SOServiceConnection *)self xpcConnection];
    v12 = [(SOServiceConnection *)self queue];
    [v11 _setQueue:v12];

    v13 = [(SOServiceConnection *)self xpcConnection];
    [v13 resume];

    v14 = SO_LOG_SOServiceConnection();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v23 = self;
      _os_log_impl(&dword_1D7206000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: new XPC connection", buf, 0xCu);
    }

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    return 1;
  }
  v16 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    -[SOServiceConnection _connectToService]();
  }

  return 0;
}

- (NSXPCConnection)xpcConnection
{
  return (NSXPCConnection *)objc_getProperty(self, a2, 8, 1);
}

- (void)setXpcConnection:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 16, 1);
}

- (id)_doConnectWithOptions:(unint64_t)a3
{
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.AppSSO.service-xpc" options:a3];
  return v3;
}

- (void)dealloc
{
  v3 = [(SOServiceConnection *)self xpcConnection];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)SOServiceConnection;
  [(SOServiceConnection *)&v4 dealloc];
}

- (void)getAuthorizationHintsWithURL:(id)a3 responseCode:(int64_t)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if ([(SOServiceConnection *)self _connectToService])
  {
    id v10 = [(SOServiceConnection *)self xpcConnection];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke;
    v14[3] = &unk_1E6A6EE00;
    id v11 = v9;
    id v15 = v11;
    v12 = [v10 synchronousRemoteObjectProxyWithErrorHandler:v14];
    [v12 getAuthorizationHintsWithURL:v8 responseCode:a4 completion:v11];
  }
  else if (v9)
  {
    v13 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v9 + 2))(v9, 0, v13);
  }
}

void __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)performAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SOServiceConnection *)self _connectToService])
  {
    id v8 = [(SOServiceConnection *)self xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__SOServiceConnection_performAuthorizationWithRequestParameters_completion___block_invoke;
    v12[3] = &unk_1E6A6EE00;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v12];
    [v10 performAuthorizationWithRequestParameters:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __76__SOServiceConnection_performAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)beginAuthorizationWithRequestParameters:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SOServiceConnection *)self _connectToService])
  {
    id v8 = [(SOServiceConnection *)self xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __74__SOServiceConnection_beginAuthorizationWithRequestParameters_completion___block_invoke;
    v12[3] = &unk_1E6A6EE00;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v12];
    [v10 beginAuthorizationWithRequestParameters:v6 completion:v9];
  }
  else if (v7)
  {
    id v11 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v11);
  }
}

void __74__SOServiceConnection_beginAuthorizationWithRequestParameters_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, void, id))(v5 + 16))(v5, 0, 0, v3);
  }
}

- (void)cancelAuthorization:(id)a3 completion:(id)a4
{
  id v9 = a3;
  id v6 = (void (**)(id, void, void *))a4;
  if ([(SOServiceConnection *)self _connectToService])
  {
    id v7 = [(SOServiceConnection *)self xpcConnection];
    id v8 = [v7 synchronousRemoteObjectProxyWithErrorHandler:&__block_literal_global_1];
    [v8 cancelAuthorization:v9 completion:v6];
  }
  else
  {
    if (!v6) {
      goto LABEL_6;
    }
    id v7 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    v6[2](v6, 0, v7);
  }

LABEL_6:
}

void __54__SOServiceConnection_cancelAuthorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }
}

void __51__SOServiceConnection_configurationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_super v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)realmsWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[SOServiceConnection realmsWithCompletion:]";
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if ([(SOServiceConnection *)self _connectToService])
  {
    id v6 = [(SOServiceConnection *)self xpcConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __44__SOServiceConnection_realmsWithCompletion___block_invoke;
    v10[3] = &unk_1E6A6EE00;
    id v7 = v4;
    id v11 = v7;
    id v8 = [v6 synchronousRemoteObjectProxyWithErrorHandler:v10];
    [v8 realmsWithCompletion:v7];

    id v9 = v11;
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __44__SOServiceConnection_realmsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)debugHintsWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v13 = "-[SOServiceConnection debugHintsWithCompletion:]";
    __int16 v14 = 2112;
    id v15 = self;
    _os_log_impl(&dword_1D7206000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if ([(SOServiceConnection *)self _connectToService])
  {
    id v6 = [(SOServiceConnection *)self xpcConnection];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__SOServiceConnection_debugHintsWithCompletion___block_invoke;
    v10[3] = &unk_1E6A6EE00;
    id v7 = v4;
    id v11 = v7;
    id v8 = [v6 remoteObjectProxyWithErrorHandler:v10];
    [v8 debugHintsWithCompletion:v7];

    id v9 = v11;
LABEL_7:

    goto LABEL_8;
  }
  if (v4)
  {
    id v9 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v4 + 2))(v4, 0, v9);
    goto LABEL_7;
  }
LABEL_8:
}

void __48__SOServiceConnection_debugHintsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)finishAuthorization:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SOServiceConnection finishAuthorization:completion:]";
    __int16 v17 = 2112;
    id v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if ([(SOServiceConnection *)self _connectToService])
  {
    id v9 = [(SOServiceConnection *)self xpcConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __54__SOServiceConnection_finishAuthorization_completion___block_invoke;
    v13[3] = &unk_1E6A6EE00;
    id v10 = v7;
    id v14 = v10;
    id v11 = [v9 remoteObjectProxyWithErrorHandler:v13];
    [v11 finishAuthorization:v6 completion:v10];

    v12 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v12 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

void __54__SOServiceConnection_finishAuthorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)isExtensionProcessWithAuditToken:(id *)a3 completion:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOServiceConnection isExtensionProcessWithAuditToken:completion:]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1D7206000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if ([(SOServiceConnection *)self _connectToService])
  {
    id v8 = [(SOServiceConnection *)self xpcConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __67__SOServiceConnection_isExtensionProcessWithAuditToken_completion___block_invoke;
    v13[3] = &unk_1E6A6EE00;
    id v9 = v6;
    id v14 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v13];
    long long v11 = *(_OWORD *)&a3->var0[4];
    *(_OWORD *)buf = *(_OWORD *)a3->var0;
    *(_OWORD *)&buf[16] = v11;
    [v10 isExtensionProcessWithAuditToken:buf completion:v9];

    v12 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v6)
  {
    v12 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v6 + 2))(v6, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

void __67__SOServiceConnection_isExtensionProcessWithAuditToken_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)profilesWithExtensionBundleIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v16 = "-[SOServiceConnection profilesWithExtensionBundleIdentifier:completion:]";
    __int16 v17 = 2112;
    id v18 = self;
    _os_log_impl(&dword_1D7206000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  if ([(SOServiceConnection *)self _connectToService])
  {
    id v9 = [(SOServiceConnection *)self xpcConnection];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __72__SOServiceConnection_profilesWithExtensionBundleIdentifier_completion___block_invoke;
    v13[3] = &unk_1E6A6EE00;
    id v10 = v7;
    id v14 = v10;
    long long v11 = [v9 synchronousRemoteObjectProxyWithErrorHandler:v13];
    [v11 profilesWithExtensionBundleIdentifier:v6 completion:v10];

    v12 = v14;
LABEL_7:

    goto LABEL_8;
  }
  if (v7)
  {
    v12 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v12);
    goto LABEL_7;
  }
LABEL_8:
}

void __72__SOServiceConnection_profilesWithExtensionBundleIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(SOServiceConnection *)self _connectToService])
  {
    id v8 = [(SOServiceConnection *)self xpcConnection];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __78__SOServiceConnection_isConfigurationActiveForExtensionIdentifier_completion___block_invoke;
    v12[3] = &unk_1E6A6EE00;
    id v9 = v7;
    id v13 = v9;
    id v10 = [v8 remoteObjectProxyWithErrorHandler:v12];
    [v10 isConfigurationActiveForExtensionIdentifier:v6 completion:v9];
  }
  else if (v7)
  {
    long long v11 = +[SOErrorHelper internalErrorWithMessage:@"Failed to connect to AppSSO service"];
    (*((void (**)(id, void, void *))v7 + 2))(v7, 0, v11);
  }
}

void __78__SOServiceConnection_isConfigurationActiveForExtensionIdentifier_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = SO_LOG_SOServiceConnection();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1();
  }

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __40__SOServiceConnection__connectToService__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setXpcConnection:0];
    id v3 = SO_LOG_SOServiceConnection();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __40__SOServiceConnection__connectToService__block_invoke_cold_1();
    }
  }
}

void __40__SOServiceConnection__connectToService__block_invoke_71(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = SO_LOG_SOServiceConnection();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __40__SOServiceConnection__connectToService__block_invoke_71_cold_1();
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

void __76__SOServiceConnection_getAuthorizationHintsWithURL_responseCode_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "XPC error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_connectToService
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D7206000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: XPC connection already exists", v1, 0xCu);
}

void __40__SOServiceConnection__connectToService__block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1D7206000, v0, OS_LOG_TYPE_DEBUG, "%{public}@: XPC connection invalidated", v1, 0xCu);
}

void __40__SOServiceConnection__connectToService__block_invoke_71_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1D7206000, v0, v1, "%{public}@: XPC connection interrupted", v2, v3, v4, v5, v6);
}

@end