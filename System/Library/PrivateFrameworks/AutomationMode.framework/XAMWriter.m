@interface XAMWriter
+ (XAMWriter)sharedInstance;
+ (void)resetSharedWriter;
- (BOOL)_usingSyncProxy:(id)a3 withError:(id *)a4;
- (BOOL)createNoAuthenticationRequiredCookieWithError:(id *)a3;
- (BOOL)disableAutomationModeWithError:(id *)a3;
- (BOOL)enableAutomationModeWithError:(id *)a3;
- (BOOL)removeNoAuthenticationRequiredCookieWithError:(id *)a3;
- (XAMAuthorizationProvider)authorizationProvider;
- (XAMWriter)initWithWriterConnectionFactory:(id)a3 authorizationProvider:(id)a4;
- (id)writerConnectionFactory;
- (void)_authenticateAndEnableAutomationModeWithProxy:(id)a3 completion:(id)a4;
- (void)_enableAutomationModeWithProxy:(id)a3 authorization:(id)a4 completion:(id)a5;
- (void)_enableAutomationModeWithProxy:(id)a3 completion:(id)a4;
- (void)_setAutomationModeEnabled:(BOOL)a3 withCompletion:(id)a4;
- (void)_usingAsyncProxyEnablePasswordlessAutomation:(BOOL)a3 withCompletion:(id)a4;
- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3;
- (void)disableAutomationModeWithCompletion:(id)a3;
- (void)enableAutomationModeWithCompletion:(id)a3;
- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3;
@end

@implementation XAMWriter

+ (void)resetSharedWriter
{
  id obj = a1;
  objc_sync_enter(obj);
  v2 = (void *)XAMSharedWriter;
  XAMSharedWriter = 0;

  objc_sync_exit(obj);
}

+ (XAMWriter)sharedInstance
{
  id v2 = a1;
  objc_sync_enter(v2);
  if (!XAMSharedWriter)
  {
    v3 = [XAMWriter alloc];
    v4 = objc_opt_new();
    uint64_t v5 = [(XAMWriter *)v3 initWithWriterConnectionFactory:&__block_literal_global authorizationProvider:v4];
    v6 = (void *)XAMSharedWriter;
    XAMSharedWriter = v5;
  }
  objc_sync_exit(v2);

  v7 = (void *)XAMSharedWriter;
  return (XAMWriter *)v7;
}

id __27__XAMWriter_sharedInstance__block_invoke()
{
  v0 = XAMAutomationModeWriterMachServiceName();
  v1 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:v0 options:0];
  id v2 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26EFDD7F0];
  [v1 setRemoteObjectInterface:v2];

  [v1 resume];
  return v1;
}

- (XAMWriter)initWithWriterConnectionFactory:(id)a3 authorizationProvider:(id)a4
{
  v6 = (XAMAuthorizationProvider *)a4;
  v13.receiver = self;
  v13.super_class = (Class)XAMWriter;
  id v7 = a3;
  v8 = [(XAMWriter *)&v13 init];
  uint64_t v9 = objc_msgSend(v7, "copy", v13.receiver, v13.super_class);

  id writerConnectionFactory = v8->_writerConnectionFactory;
  v8->_id writerConnectionFactory = (id)v9;

  authorizationProvider = v8->_authorizationProvider;
  v8->_authorizationProvider = v6;

  return v8;
}

- (void)disableAutomationModeWithCompletion:(id)a3
{
}

- (void)enableAutomationModeWithCompletion:(id)a3
{
}

- (void)_setAutomationModeEnabled:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (*((void (**)(void))self->_writerConnectionFactory + 2))();
  v8 = XAMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_23C1A0000, v8, OS_LOG_TYPE_DEFAULT, "Created new connection %@.", buf, 0xCu);
  }

  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke;
  v21[3] = &unk_264E36770;
  id v9 = v7;
  id v22 = v9;
  id v10 = v6;
  id v23 = v10;
  v11 = (void *)MEMORY[0x23ECDD0A0](v21);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14;
  v19[3] = &unk_264E36798;
  id v12 = v11;
  id v20 = v12;
  objc_super v13 = [v9 remoteObjectProxyWithErrorHandler:v19];
  if (v4)
  {
    v17[0] = MEMORY[0x263EF8330];
    v17[1] = 3221225472;
    v17[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_15;
    v17[3] = &unk_264E36798;
    v14 = &v18;
    id v18 = v12;
    [(XAMWriter *)self _enableAutomationModeWithProxy:v13 completion:v17];
  }
  else
  {
    v15[0] = MEMORY[0x263EF8330];
    v15[1] = 3221225472;
    v15[2] = __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_2;
    v15[3] = &unk_264E36798;
    v14 = &v16;
    id v16 = v12;
    [v13 disableAutomationModeWithCompletion:v15];
  }
}

void __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_23C1A0000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@.", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_15(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_enableAutomationModeWithProxy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = XAMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C1A0000, v8, OS_LOG_TYPE_DEFAULT, "Sending enable request to writer daemon.", buf, 2u);
  }

  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke;
  v11[3] = &unk_264E367C0;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [v10 enableAutomationModeWithCompletion:v11];
}

void __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (!v3)
  {
    id v7 = XAMLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_23C1A0000, v7, OS_LOG_TYPE_DEFAULT, "Writer daemon returned success (no error).", v10, 2u);
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_12;
  }
  uint64_t v5 = [v3 domain];
  if (![v5 isEqualToString:@"com.apple.dt.AutomationMode.writer.error"])
  {

    goto LABEL_9;
  }
  uint64_t v6 = [v4 code];

  if (v6 != 1)
  {
LABEL_9:
    id v9 = XAMLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke_cold_1();
    }

    uint64_t v8 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_12:
    v8();
    goto LABEL_13;
  }
  [*(id *)(a1 + 32) _authenticateAndEnableAutomationModeWithProxy:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
LABEL_13:
}

- (void)_authenticateAndEnableAutomationModeWithProxy:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = XAMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C1A0000, v8, OS_LOG_TYPE_DEFAULT, "Writer daemon requires authentication to enable automation mode.", buf, 2u);
  }

  id v9 = [(XAMWriter *)self authorizationProvider];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __70__XAMWriter__authenticateAndEnableAutomationModeWithProxy_completion___block_invoke;
  v12[3] = &unk_264E367E8;
  v12[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  [v9 requestAuthorizationWithReply:v12];
}

uint64_t __70__XAMWriter__authenticateAndEnableAutomationModeWithProxy_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2) {
    return [*(id *)(a1 + 32) _enableAutomationModeWithProxy:*(void *)(a1 + 40) authorization:a2 completion:*(void *)(a1 + 48)];
  }
  else {
    return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
  }
}

- (void)_enableAutomationModeWithProxy:(id)a3 authorization:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  id v10 = XAMLog();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_23C1A0000, v10, OS_LOG_TYPE_DEFAULT, "User authenticated, forwarding authorization to writer daemon.", buf, 2u);
  }

  id v11 = [v7 externalizedContext];
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __69__XAMWriter__enableAutomationModeWithProxy_authorization_completion___block_invoke;
  v14[3] = &unk_264E36770;
  id v15 = v7;
  id v16 = v8;
  id v12 = v8;
  id v13 = v7;
  [v9 enableAutomationModeWithAuthorization:v11 completion:v14];
}

void __69__XAMWriter__enableAutomationModeWithProxy_authorization_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_23C1A0000, v4, OS_LOG_TYPE_DEFAULT, "Writer daemon finished, invalidating authorization.", v5, 2u);
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_usingAsyncProxyEnablePasswordlessAutomation:(BOOL)a3 withCompletion:(id)a4
{
  BOOL v4 = a3;
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = (*((void (**)(void))self->_writerConnectionFactory + 2))();
  id v8 = XAMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v7;
    _os_log_impl(&dword_23C1A0000, v8, OS_LOG_TYPE_DEFAULT, "Created new connection %@.", buf, 0xCu);
  }

  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke;
  v17[3] = &unk_264E36770;
  id v9 = v7;
  id v18 = v9;
  id v19 = v6;
  id v10 = v6;
  id v11 = (void *)MEMORY[0x23ECDD0A0](v17);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke_17;
  v15[3] = &unk_264E36798;
  id v12 = v11;
  id v16 = v12;
  id v13 = [v9 remoteObjectProxyWithErrorHandler:v15];
  id v14 = v13;
  if (v4) {
    [v13 createNoAuthenticationRequiredCookieWithCompletion:v12];
  }
  else {
    [v13 removeNoAuthenticationRequiredCookieWithCompletion:v12];
  }
}

void __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v3 = a2;
  BOOL v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_impl(&dword_23C1A0000, v4, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@.", (uint8_t *)&v6, 0xCu);
  }

  [*(id *)(a1 + 32) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __73__XAMWriter__usingAsyncProxyEnablePasswordlessAutomation_withCompletion___block_invoke_17(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)createNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
}

- (void)removeNoAuthenticationRequiredCookieWithCompletion:(id)a3
{
}

- (BOOL)_usingSyncProxy:(id)a3 withError:(id *)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  int v6 = (void (**)(id, void *))a3;
  uint64_t v7 = (*((void (**)(void))self->_writerConnectionFactory + 2))();
  uint64_t v8 = XAMLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_23C1A0000, v8, OS_LOG_TYPE_DEFAULT, "Created new connection %@.", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __39__XAMWriter__usingSyncProxy_withError___block_invoke;
  v15[3] = &unk_264E36810;
  void v15[4] = &buf;
  id v9 = [v7 synchronousRemoteObjectProxyWithErrorHandler:v15];
  id v10 = v6[2](v6, v9);
  id v11 = v10;
  if (!v10) {
    id v11 = *(void **)(*((void *)&buf + 1) + 40);
  }
  id v12 = v11;

  id v13 = XAMLog();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id v16 = 138412290;
    v17 = v7;
    _os_log_impl(&dword_23C1A0000, v13, OS_LOG_TYPE_DEFAULT, "Invalidating connection %@.", v16, 0xCu);
  }

  [v7 invalidate];
  if (a4) {
    *a4 = v12;
  }

  _Block_object_dispose(&buf, 8);
  return v12 == 0;
}

void __39__XAMWriter__usingSyncProxy_withError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = XAMLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1();
  }

  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  int v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v3;
}

- (BOOL)disableAutomationModeWithError:(id *)a3
{
  return [(XAMWriter *)self _usingSyncProxy:&__block_literal_global_20 withError:a3];
}

id __44__XAMWriter_disableAutomationModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__XAMWriter_disableAutomationModeWithError___block_invoke_2;
  v5[3] = &unk_264E36810;
  v5[4] = &v6;
  [v2 disableAutomationModeWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __44__XAMWriter_disableAutomationModeWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)enableAutomationModeWithError:(id *)a3
{
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__XAMWriter_enableAutomationModeWithError___block_invoke;
  v4[3] = &unk_264E36858;
  v4[4] = self;
  return [(XAMWriter *)self _usingSyncProxy:v4 withError:a3];
}

id __43__XAMWriter_enableAutomationModeWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  id v22 = 0;
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __43__XAMWriter_enableAutomationModeWithError___block_invoke_2;
  v16[3] = &unk_264E36810;
  uint8_t v16[4] = &v17;
  [v3 enableAutomationModeWithCompletion:v16];
  BOOL v4 = (void *)v18[5];
  if (!v4) {
    goto LABEL_9;
  }
  id v5 = [v4 domain];
  if (![v5 isEqualToString:@"com.apple.dt.AutomationMode.writer.error"]) {
    goto LABEL_8;
  }
  uint64_t v6 = [(id)v18[5] code];

  if (v6 != 1)
  {
LABEL_9:
    id v5 = (id)v18[5];
    goto LABEL_10;
  }
  uint64_t v7 = XAMLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_23C1A0000, v7, OS_LOG_TYPE_DEFAULT, "Writer daemon requires authentication to enable automation mode.", buf, 2u);
  }

  uint64_t v8 = (void *)v18[5];
  v18[5] = 0;

  id v9 = [*(id *)(a1 + 32) authorizationProvider];
  id v14 = 0;
  id v10 = [v9 authorizationWithError:&v14];
  id v5 = v14;

  if (v10)
  {
    id v11 = *(void **)(a1 + 32);
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    v13[2] = __43__XAMWriter_enableAutomationModeWithError___block_invoke_21;
    v13[3] = &unk_264E36810;
    v13[4] = &v17;
    [v11 _enableAutomationModeWithProxy:v3 authorization:v10 completion:v13];

LABEL_8:
    goto LABEL_9;
  }
LABEL_10:
  _Block_object_dispose(&v17, 8);

  return v5;
}

void __43__XAMWriter_enableAutomationModeWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

void __43__XAMWriter_enableAutomationModeWithError___block_invoke_21(uint64_t a1, void *a2)
{
}

- (BOOL)createNoAuthenticationRequiredCookieWithError:(id *)a3
{
  return [(XAMWriter *)self _usingSyncProxy:&__block_literal_global_23 withError:a3];
}

id __59__XAMWriter_createNoAuthenticationRequiredCookieWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__XAMWriter_createNoAuthenticationRequiredCookieWithError___block_invoke_2;
  v5[3] = &unk_264E36810;
  v5[4] = &v6;
  [v2 createNoAuthenticationRequiredCookieWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__XAMWriter_createNoAuthenticationRequiredCookieWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (BOOL)removeNoAuthenticationRequiredCookieWithError:(id *)a3
{
  return [(XAMWriter *)self _usingSyncProxy:&__block_literal_global_25 withError:a3];
}

id __59__XAMWriter_removeNoAuthenticationRequiredCookieWithError___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy_;
  id v10 = __Block_byref_object_dispose_;
  id v11 = 0;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__XAMWriter_removeNoAuthenticationRequiredCookieWithError___block_invoke_2;
  v5[3] = &unk_264E36810;
  v5[4] = &v6;
  [v2 removeNoAuthenticationRequiredCookieWithCompletion:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __59__XAMWriter_removeNoAuthenticationRequiredCookieWithError___block_invoke_2(uint64_t a1, void *a2)
{
}

- (id)writerConnectionFactory
{
  return objc_getProperty(self, a2, 8, 1);
}

- (XAMAuthorizationProvider)authorizationProvider
{
  return (XAMAuthorizationProvider *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_authorizationProvider, 0);
  objc_storeStrong(&self->_writerConnectionFactory, 0);
}

void __54__XAMWriter__setAutomationModeEnabled_withCompletion___block_invoke_14_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C1A0000, v0, v1, "XPC Error: %{public}@", v2, v3, v4, v5, v6);
}

void __55__XAMWriter__enableAutomationModeWithProxy_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_23C1A0000, v0, v1, "Writer returned error: %{public}@", v2, v3, v4, v5, v6);
}

@end