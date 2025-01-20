@interface DIVClient
- (BOOL)isDisconnected;
- (DIVClient)init;
- (id)context;
- (id)createDaemonDisconnectedError;
- (id)remoteObjectProxyWithErrorHandler:(id)a3;
- (id)serverConnection;
- (void)concludeVerification:(id)a3;
- (void)configure:(id)a3 completion:(id)a4;
- (void)confirmVerificationCompletedWithFeedback:(id)a3;
- (void)createDaemonDisconnectedError;
- (void)dealloc;
- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4;
- (void)init;
- (void)invalidate;
- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4;
- (void)setContext:(id)a3;
- (void)setIsDisconnected:(BOOL)a3;
- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4;
@end

@implementation DIVClient

- (DIVClient)init
{
  v40.receiver = self;
  v40.super_class = (Class)DIVClient;
  v2 = [(DIVClient *)&v40 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v2->_isDisconnected = 0;
    v4 = DIV_LOG_SIGNPOST();
    v5 = DIV_LOG_SIGNPOST();
    os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, v3);

    if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_2147E0000, v4, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sessionLifetime", "", (uint8_t *)&buf, 2u);
    }

    v7 = DIV_LOG_SIGNPOST();
    v8 = DIV_LOG_SIGNPOST();
    os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, v3);

    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_2147E0000, v7, OS_SIGNPOST_INTERVAL_BEGIN, v9, "initThroughShare", "", (uint8_t *)&buf, 2u);
    }

    v10 = DIV_LOG_CLIENT_1();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[DIVClient init](v10);
    }

    uint64_t v11 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.coreidvd.proofing" options:4096];
    serverConnection = v3->_serverConnection;
    v3->_serverConnection = (NSXPCConnection *)v11;

    v13 = [MEMORY[0x263F08D80] interfaceWithProtocol:&unk_26C581930];
    [(NSXPCConnection *)v3->_serverConnection setRemoteObjectInterface:v13];

    v36 = (void *)MEMORY[0x263EFFA08];
    uint64_t v35 = objc_opt_class();
    uint64_t v34 = objc_opt_class();
    uint64_t v33 = objc_opt_class();
    uint64_t v32 = objc_opt_class();
    uint64_t v31 = objc_opt_class();
    uint64_t v30 = objc_opt_class();
    uint64_t v29 = objc_opt_class();
    uint64_t v28 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v17 = objc_opt_class();
    uint64_t v18 = objc_opt_class();
    uint64_t v19 = objc_opt_class();
    uint64_t v20 = objc_opt_class();
    uint64_t v21 = objc_opt_class();
    uint64_t v22 = objc_opt_class();
    objc_msgSend(v36, "setWithObjects:", v35, v34, v33, v32, v31, v30, v29, v28, v14, v15, v16, v17, v18, v19, v20, v21, v22,
      objc_opt_class(),
    v23 = 0);
    v24 = [(NSXPCConnection *)v3->_serverConnection remoteObjectInterface];
    [v24 setClasses:v23 forSelector:sel_performVerificationWithAttributes_completion_ argumentIndex:0 ofReply:1];

    v25 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", objc_opt_class(), 0);

    v26 = [(NSXPCConnection *)v3->_serverConnection remoteObjectInterface];
    [v26 setClasses:v25 forSelector:sel_shareVerificationResultWithOptions_completion_ argumentIndex:0 ofReply:1];

    objc_initWeak(&buf, v3);
    v37[0] = MEMORY[0x263EF8330];
    v37[1] = 3221225472;
    v37[2] = __17__DIVClient_init__block_invoke;
    v37[3] = &unk_26421C478;
    objc_copyWeak(&v38, &buf);
    [(NSXPCConnection *)v3->_serverConnection setInterruptionHandler:v37];
    [(NSXPCConnection *)v3->_serverConnection activate];
    objc_destroyWeak(&v38);
    objc_destroyWeak(&buf);
  }
  return v3;
}

void __17__DIVClient_init__block_invoke(uint64_t a1)
{
  v2 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __17__DIVClient_init__block_invoke_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setIsDisconnected:1];
  }
}

- (void)dealloc
{
  [(DIVClient *)self invalidate];
  v3 = DIV_LOG_SIGNPOST();
  v4 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v5 = os_signpost_id_make_with_pointer(v4, self);

  if (v5 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v3))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v3, OS_SIGNPOST_INTERVAL_END, v5, "sessionLifetime", "", buf, 2u);
  }

  v6.receiver = self;
  v6.super_class = (Class)DIVClient;
  [(DIVClient *)&v6 dealloc];
}

- (void)configure:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v9 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, self);

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v10, "configure", "", buf, 2u);
  }

  if (v6
    && ([v6 serviceName], uint64_t v11 = objc_claimAutoreleasedReturnValue(), v11, v11))
  {
    [(DIVClient *)self setContext:v6];
    v12 = DIV_LOG_CLIENT_1();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[DIVClient configure:completion:](self, v12);
    }

    if (![(DIVClient *)self isDisconnected])
    {
      aBlock[0] = MEMORY[0x263EF8330];
      aBlock[1] = 3221225472;
      aBlock[2] = __34__DIVClient_configure_completion___block_invoke;
      aBlock[3] = &unk_26421C4A0;
      aBlock[4] = self;
      id v21 = v7;
      uint64_t v15 = _Block_copy(aBlock);
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __34__DIVClient_configure_completion___block_invoke_84;
      v18[3] = &unk_26421C3D0;
      id v19 = v15;
      id v16 = v15;
      uint64_t v17 = [(DIVClient *)self remoteObjectProxyWithErrorHandler:v18];
      [v17 configure:v6 completion:v16];

      goto LABEL_14;
    }
    v13 = [(DIVClient *)self createDaemonDisconnectedError];
  }
  else
  {
    v13 = [MEMORY[0x263F087E8] errorWithDomain:@"DIVError" code:-2 userInfo:0];
    uint64_t v14 = DIV_LOG_CLIENT_1();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[DIVClient configure:completion:]();
    }
  }
  (*((void (**)(id, void *))v7 + 2))(v7, v13);

LABEL_14:
}

void __34__DIVClient_configure_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v5 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v6 = os_signpost_id_make_with_pointer(v5, *(const void **)(a1 + 32));

  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)id v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v4, OS_SIGNPOST_INTERVAL_END, v6, "configure", "", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __34__DIVClient_configure_completion___block_invoke_84(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performVerificationWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DIVClient performVerificationWithAttributes:completion:]();
  }

  os_signpost_id_t v9 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v10 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "performVerificationWithAttributes", "", buf, 2u);
  }

  if ([(DIVClient *)self isDisconnected])
  {
    v12 = [(DIVClient *)self createDaemonDisconnectedError];
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v12);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__DIVClient_performVerificationWithAttributes_completion___block_invoke;
    aBlock[3] = &unk_26421C4C8;
    aBlock[4] = self;
    id v19 = v7;
    v13 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __58__DIVClient_performVerificationWithAttributes_completion___block_invoke_86;
    v16[3] = &unk_26421C3D0;
    id v17 = v13;
    id v14 = v13;
    uint64_t v15 = [(DIVClient *)self remoteObjectProxyWithErrorHandler:v16];
    [v15 performVerificationWithAttributes:v6 completion:v14];
  }
}

void __58__DIVClient_performVerificationWithAttributes_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6 = a4;
  id v7 = a2;
  v8 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v9 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v10 = os_signpost_id_make_with_pointer(v9, *(const void **)(a1 + 32));

  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)os_signpost_id_t v11 = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v8, OS_SIGNPOST_INTERVAL_END, v10, "performVerificationWithAttributes", "", v11, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __58__DIVClient_performVerificationWithAttributes_completion___block_invoke_86(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)shareVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DIVClient shareVerificationResultWithOptions:completion:]();
  }

  os_signpost_id_t v9 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v10 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "shareVerificationResultWithOptions", "", buf, 2u);
  }

  if ([(DIVClient *)self isDisconnected])
  {
    v12 = [(DIVClient *)self createDaemonDisconnectedError];
    v7[2](v7, 0, v12);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke;
    aBlock[3] = &unk_26421C4F0;
    aBlock[4] = self;
    id v19 = v7;
    v13 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke_88;
    v16[3] = &unk_26421C3D0;
    id v17 = v13;
    id v14 = v13;
    uint64_t v15 = [(DIVClient *)self remoteObjectProxyWithErrorHandler:v16];
    [v15 shareVerificationResultWithOptions:v6 completion:v14];
  }
}

void __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = DIV_LOG_SIGNPOST();
  v8 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)os_signpost_id_t v10 = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v7, OS_SIGNPOST_INTERVAL_END, v9, "shareVerificationResultWithOptions", "", v10, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __59__DIVClient_shareVerificationResultWithOptions_completion___block_invoke_88(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getVerificationResultWithOptions:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  v8 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[DIVClient getVerificationResultWithOptions:completion:]();
  }

  os_signpost_id_t v9 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v10 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v11 = os_signpost_id_make_with_pointer(v10, self);

  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v11, "getVerificationResultWithOptions", "", buf, 2u);
  }

  if ([(DIVClient *)self isDisconnected])
  {
    v12 = [(DIVClient *)self createDaemonDisconnectedError];
    v7[2](v7, 0, v12);
  }
  else
  {
    aBlock[0] = MEMORY[0x263EF8330];
    aBlock[1] = 3221225472;
    aBlock[2] = __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke;
    aBlock[3] = &unk_26421C518;
    aBlock[4] = self;
    id v19 = v7;
    v13 = _Block_copy(aBlock);
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke_90;
    v16[3] = &unk_26421C3D0;
    id v17 = v13;
    id v14 = v13;
    uint64_t v15 = [(DIVClient *)self remoteObjectProxyWithErrorHandler:v16];
    [v15 getVerificationResultWithOptions:v6 completion:v14];
  }
}

void __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = DIV_LOG_SIGNPOST();
  v8 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v9 = os_signpost_id_make_with_pointer(v8, *(const void **)(a1 + 32));

  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)id buf = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v7, OS_SIGNPOST_INTERVAL_END, v9, "getVerificationResultWithOptions", "", buf, 2u);
  }

  os_signpost_id_t v10 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v11 = DIV_LOG_SIGNPOST();
  os_signpost_id_t v12 = os_signpost_id_make_with_pointer(v11, *(const void **)(a1 + 32));

  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)id v14 = 0;
    _os_signpost_emit_with_name_impl(&dword_2147E0000, v10, OS_SIGNPOST_INTERVAL_END, v12, "initThroughShare", "", v14, 2u);
  }

  if (v5)
  {
    v13 = (void *)[NSString _newZStringWithString:v5];
  }
  else
  {
    v13 = 0;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t __57__DIVClient_getVerificationResultWithOptions_completion___block_invoke_90(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)invalidate
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "invalidate", v2, v3, v4, v5, v6);
}

- (void)concludeVerification:(id)a3
{
  id v4 = a3;
  if (![(DIVClient *)self isDisconnected])
  {
    uint64_t v5 = DIV_LOG_CLIENT_1();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[DIVClient concludeVerification:]();
    }

    uint8_t v6 = [(DIVClient *)self remoteObjectProxyWithErrorHandler:0];
    [v6 concludeVerification:v4];
  }
}

- (void)confirmVerificationCompletedWithFeedback:(id)a3
{
  id v4 = a3;
  uint64_t v5 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[DIVClient confirmVerificationCompletedWithFeedback:]();
  }

  if ([(DIVClient *)self isDisconnected])
  {
    uint8_t v6 = DIV_LOG_CLIENT_1();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DIVClient confirmVerificationCompletedWithFeedback:]();
    }
  }
  else
  {
    id v7 = [MEMORY[0x263EFF910] date];
    [v4 setFinishDate:v7];

    uint8_t v6 = [(DIVClient *)self remoteObjectProxyWithErrorHandler:0];
    [v6 confirmVerificationCompletedWithFeedback:v4];
  }
}

- (id)serverConnection
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_serverConnection;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)context
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_context;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setContext:(id)a3
{
  id v4 = (DIVerificationSessionContext *)a3;
  os_unfair_lock_lock(&self->_lock);
  context = self->_context;
  self->_context = v4;

  os_unfair_lock_unlock(&self->_lock);
}

- (BOOL)isDisconnected
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isDisconnected;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setIsDisconnected:(BOOL)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  self->_isDisconnected = a3;
  os_unfair_lock_unlock(p_lock);
}

- (id)createDaemonDisconnectedError
{
  uint64_t v2 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    -[DIVClient createDaemonDisconnectedError]();
  }

  uint64_t v3 = [MEMORY[0x263F087E8] errorWithDomain:@"DIVError" code:-19 userInfo:0];
  return v3;
}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(DIVClient *)self serverConnection];
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke;
  v9[3] = &unk_26421C420;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 remoteObjectProxyWithErrorHandler:v9];

  return v7;
}

void __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DIV_LOG_CLIENT_1();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1((uint64_t)v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 40);
  if (v5)
  {
    id v6 = [*(id *)(a1 + 32) createDaemonDisconnectedError];
    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
}

- (void)init
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  int v1 = 138543618;
  uint64_t v2 = @"com.apple.coreidvd.proofing";
  __int16 v3 = 1024;
  int v4 = 4096;
  _os_log_debug_impl(&dword_2147E0000, log, OS_LOG_TYPE_DEBUG, "connecting to %{public}@ (%x)", (uint8_t *)&v1, 0x12u);
}

void __17__DIVClient_init__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "Connection with daemon interrupted", v2, v3, v4, v5, v6);
}

- (void)configure:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "configure failed due to empty service name", v2, v3, v4, v5, v6);
}

- (void)configure:(void *)a1 completion:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 context];
  uint64_t v4 = [v3 serviceName];
  int v5 = 138543362;
  uint8_t v6 = v4;
  _os_log_debug_impl(&dword_2147E0000, a2, OS_LOG_TYPE_DEBUG, "configure with context -> service name:%{public}@", (uint8_t *)&v5, 0xCu);
}

- (void)performVerificationWithAttributes:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "performVerificationWithAttributes", v2, v3, v4, v5, v6);
}

- (void)shareVerificationResultWithOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "shareVerificationResultWithOptions", v2, v3, v4, v5, v6);
}

- (void)getVerificationResultWithOptions:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "getVerificationResultWithOptions", v2, v3, v4, v5, v6);
}

- (void)concludeVerification:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "concludeVerification", v2, v3, v4, v5, v6);
}

- (void)confirmVerificationCompletedWithFeedback:.cold.1()
{
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_2147E0000, v0, OS_LOG_TYPE_ERROR, "confirmVerificationCompletedWithFeedback connection was disconnected", v1, 2u);
}

- (void)confirmVerificationCompletedWithFeedback:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "confirmVerificationCompletedWithFeedback", v2, v3, v4, v5, v6);
}

- (void)createDaemonDisconnectedError
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_2147E0000, v0, v1, "Daemon has disconnected; caller must create new session",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void __47__DIVClient_remoteObjectProxyWithErrorHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2147E0000, a2, OS_LOG_TYPE_ERROR, "DIVClient remote object proxy error: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end