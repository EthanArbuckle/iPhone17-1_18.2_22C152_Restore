@interface AFSiriActivationConnection
- (AFSiriActivationConnection)init;
- (AFSiriActivationConnection)initWithServicePort:(int64_t)a3;
- (id)_connection;
- (void)_connectionInterrupted;
- (void)_connectionInvalidated;
- (void)_invalidate;
- (void)activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
- (void)deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6;
- (void)dealloc;
- (void)handleContext:(id)a3 completion:(id)a4;
- (void)handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5;
- (void)handleIntentForwardingAction:(id)a3 inBackgroundApplicationWithBundleIdentifier:(id)a4 completionHandler:(id)a5;
- (void)invalidate;
- (void)prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5;
@end

@implementation AFSiriActivationConnection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)_invalidate
{
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    [(NSXPCConnection *)xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection invalidate];
    v4 = self->_xpcConnection;
    self->_xpcConnection = 0;
  }
}

- (void)_connectionInvalidated
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFSiriActivationConnection _connectionInvalidated]";
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AFSiriActivationConnection__connectionInvalidated__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__AFSiriActivationConnection__connectionInvalidated__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)_connectionInterrupted
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  v3 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[AFSiriActivationConnection _connectionInterrupted]";
    _os_log_error_impl(&dword_19CF1D000, v3, OS_LOG_TYPE_ERROR, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__AFSiriActivationConnection__connectionInterrupted__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __52__AFSiriActivationConnection__connectionInterrupted__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (id)_connection
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  xpcConnection = self->_xpcConnection;
  if (!xpcConnection)
  {
    int64_t servicePort = self->_servicePort;
    if ((unint64_t)(servicePort - 4) >= 0xFFFFFFFFFFFFFFFDLL)
    {
      v9 = (void *)AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        v10 = v9;
        v11 = off_1E5925428[servicePort];
        *(_DWORD *)buf = 136315394;
        v32 = "-[AFSiriActivationConnection _connection]";
        __int16 v33 = 2112;
        v34 = v11;
        _os_log_impl(&dword_19CF1D000, v10, OS_LOG_TYPE_INFO, "%s int64_t servicePort = %@ (incoming, effective)", buf, 0x16u);
      }
    }
    else
    {
      if (AFIsHorseman_onceToken != -1) {
        dispatch_once(&AFIsHorseman_onceToken, &__block_literal_global_220_45602);
      }
      if (AFIsHorseman_isHorseman) {
        int64_t servicePort = 2;
      }
      else {
        int64_t servicePort = 1;
      }
      v5 = AFSiriLogContextConnection;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
      {
        unint64_t v6 = self->_servicePort;
        v7 = v5;
        if (v6 > 3) {
          uint64_t v8 = @"(unknown)";
        }
        else {
          uint64_t v8 = off_1E5925428[v6];
        }
        v12 = v8;
        *(_DWORD *)buf = 136315394;
        v32 = "-[AFSiriActivationConnection _connection]";
        __int16 v33 = 2112;
        v34 = v12;
        _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s int64_t servicePort = %@ (incoming)", buf, 0x16u);

        v5 = AFSiriLogContextConnection;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v13 = v5;
        v14 = off_1E5925428[servicePort];
        *(_DWORD *)buf = 136315394;
        v32 = "-[AFSiriActivationConnection _connection]";
        __int16 v33 = 2112;
        v34 = v14;
        _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s int64_t servicePort = %@ (effective)", buf, 0x16u);
      }
    }
    AFSiriActivationServiceGetMachServiceName(servicePort);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v16 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v32 = "-[AFSiriActivationConnection _connection]";
      __int16 v33 = 2112;
      v34 = v15;
      _os_log_impl(&dword_19CF1D000, v16, OS_LOG_TYPE_INFO, "%s machServiceName = %@", buf, 0x16u);
    }
    v17 = (NSXPCConnection *)[objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:v15 options:0];
    v18 = self->_xpcConnection;
    self->_xpcConnection = v17;

    [(NSXPCConnection *)self->_xpcConnection _setQueue:self->_queue];
    v19 = self->_xpcConnection;
    v20 = AFSiriActivationServiceGetXPCInterface();
    [(NSXPCConnection *)v19 setRemoteObjectInterface:v20];

    [(NSXPCConnection *)self->_xpcConnection setExportedObject:0];
    [(NSXPCConnection *)self->_xpcConnection setExportedInterface:0];
    objc_initWeak((id *)buf, self);
    v21 = self->_xpcConnection;
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __41__AFSiriActivationConnection__connection__block_invoke;
    v29[3] = &unk_1E592B978;
    objc_copyWeak(&v30, (id *)buf);
    [(NSXPCConnection *)v21 setInterruptionHandler:v29];
    v22 = self->_xpcConnection;
    uint64_t v24 = MEMORY[0x1E4F143A8];
    uint64_t v25 = 3221225472;
    v26 = __41__AFSiriActivationConnection__connection__block_invoke_2;
    v27 = &unk_1E592B978;
    objc_copyWeak(&v28, (id *)buf);
    [(NSXPCConnection *)v22 setInvalidationHandler:&v24];
    [(NSXPCConnection *)self->_xpcConnection resume];
    objc_destroyWeak(&v28);
    objc_destroyWeak(&v30);
    objc_destroyWeak((id *)buf);

    xpcConnection = self->_xpcConnection;
  }
  return xpcConnection;
}

void __41__AFSiriActivationConnection__connection__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInterrupted];
}

void __41__AFSiriActivationConnection__connection__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _connectionInvalidated];
}

- (void)invalidate
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__AFSiriActivationConnection_invalidate__block_invoke;
  block[3] = &unk_1E592C678;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __40__AFSiriActivationConnection_invalidate__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _invalidate];
}

- (void)handleIntentForwardingAction:(id)a3 inBackgroundApplicationWithBundleIdentifier:(id)a4 completionHandler:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[AFSiriActivationConnection handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completionHandler:]";
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s intent = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke;
  v16[3] = &unk_1E592A8F8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(queue, v16);
}

void __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2;
  v8[3] = &unk_1E592B9A0;
  id v9 = *(id *)(a1 + 56);
  v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_17;
  v6[3] = &unk_1E5929658;
  id v7 = *(id *)(a1 + 56);
  [v3 handleIntentForwardingAction:v4 inBackgroundApplicationWithBundleIdentifier:v5 completionHandler:v6];
}

void __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSiriActivationConnection handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:completio"
         "nHandler:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
  }
}

void __121__AFSiriActivationConnection_handleIntentForwardingAction_inBackgroundApplicationWithBundleIdentifier_completionHandler___block_invoke_17(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v6 = 136315394;
      id v7 = "-[AFSiriActivationConnection handleIntentForwardingAction:inBackgroundApplicationWithBundleIdentifier:complet"
           "ionHandler:]_block_invoke";
      __int16 v8 = 2112;
      id v9 = v3;
      _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s intentForwardingActionResponse = %@", (uint8_t *)&v6, 0x16u);
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

- (void)handleIntent:(id)a3 inBackgroundAppWithBundleId:(id)a4 reply:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]";
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s intent = %@", buf, 0x16u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke;
  v16[3] = &unk_1E592A8F8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(queue, v16);
}

void __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2;
  v8[3] = &unk_1E592B9A0;
  id v9 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_15;
  v6[3] = &unk_1E5925598;
  id v7 = *(id *)(a1 + 56);
  [v3 handleIntent:v4 inBackgroundAppWithBundleId:v5 reply:v6];
}

void __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    int v6 = 136315394;
    id v7 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, 0, v3);
  }
}

void __77__AFSiriActivationConnection_handleIntent_inBackgroundAppWithBundleId_reply___block_invoke_15(uint64_t a1, void *a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v5)
  {
    id v7 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
    {
      int v10 = 136315394;
      v11 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v5;
      _os_log_impl(&dword_19CF1D000, v7, OS_LOG_TYPE_INFO, "%s intentResponse = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  if (v6)
  {
    __int16 v8 = AFSiriLogContextConnection;
    if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136315394;
      v11 = "-[AFSiriActivationConnection handleIntent:inBackgroundAppWithBundleId:reply:]_block_invoke";
      __int16 v12 = 2112;
      id v13 = v6;
      _os_log_error_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_ERROR, "%s error = %@", (uint8_t *)&v10, 0x16u);
    }
  }
  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v5, v6);
  }
}

- (void)handleContext:(id)a3 completion:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[AFSiriActivationConnection handleContext:completion:]";
    __int16 v17 = 2048;
    id v18 = v6;
    _os_log_impl(&dword_19CF1D000, v8, OS_LOG_TYPE_INFO, "%s context = %p", buf, 0x16u);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke;
  block[3] = &unk_1E592C598;
  id v13 = v6;
  id v14 = v7;
  block[4] = self;
  id v10 = v6;
  id v11 = v7;
  dispatch_async(queue, block);
}

void __55__AFSiriActivationConnection_handleContext_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2;
  v7[3] = &unk_1E592B9A0;
  id v8 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v7];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2_14;
  v5[3] = &unk_1E592B5F8;
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  [v3 handleContext:v4 completion:v5];
}

void __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[AFSiriActivationConnection handleContext:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __55__AFSiriActivationConnection_handleContext_completion___block_invoke_13;
    v7[3] = &unk_1E59294E8;
    id v8 = v3;
    id v6 = +[AFSiriActivationResult newWithBuilder:v7];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __55__AFSiriActivationConnection_handleContext_completion___block_invoke_2_14(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[AFSiriActivationConnection handleContext:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __55__AFSiriActivationConnection_handleContext_completion___block_invoke_13(uint64_t a1, void *a2)
{
  return [a2 setError:*(void *)(a1 + 32)];
}

- (void)deactivateForReason:(int64_t)a3 options:(unint64_t)a4 context:(id)a5 completion:(id)a6
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  id v12 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    uint64_t v13 = v12;
    if ((unint64_t)a3 > 0x14) {
      id v14 = @"(unknown)";
    }
    else {
      id v14 = off_1E59287D8[a3];
    }
    id v15 = v14;
    v16 = AFSiriDeactivationOptionsGetNames(a4);
    *(_DWORD *)buf = 136315906;
    v26 = "-[AFSiriActivationConnection deactivateForReason:options:context:completion:]";
    __int16 v27 = 2112;
    id v28 = v15;
    __int16 v29 = 2112;
    id v30 = v16;
    __int16 v31 = 2112;
    id v32 = v10;
    _os_log_impl(&dword_19CF1D000, v13, OS_LOG_TYPE_INFO, "%s reason = %@, options = %@, context = %@", buf, 0x2Au);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke;
  block[3] = &unk_1E5929510;
  id v22 = v11;
  int64_t v23 = a3;
  unint64_t v24 = a4;
  block[4] = self;
  id v21 = v10;
  id v18 = v10;
  id v19 = v11;
  dispatch_async(queue, block);
}

void __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2;
  v9[3] = &unk_1E592B9A0;
  id v10 = *(id *)(a1 + 48);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v9];
  uint64_t v4 = *(void *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 64);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2_12;
  v7[3] = &unk_1E592B5F8;
  uint64_t v6 = *(void *)(a1 + 40);
  id v8 = *(id *)(a1 + 48);
  [v3 deactivateForReason:v4 options:v5 context:v6 completion:v7];
}

void __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[AFSiriActivationConnection deactivateForReason:options:context:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_11;
    v7[3] = &unk_1E59294E8;
    id v8 = v3;
    id v6 = +[AFSiriActivationResult newWithBuilder:v7];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_2_12(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[AFSiriActivationConnection deactivateForReason:options:context:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __77__AFSiriActivationConnection_deactivateForReason_options_context_completion___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 setError:*(void *)(a1 + 32)];
}

- (void)activateWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[AFSiriActivationConnection activateWithRequestInfo:context:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E592A8F8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(queue, v16);
}

void __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2;
  v8[3] = &unk_1E592B9A0;
  id v9 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2_10;
  v6[3] = &unk_1E592B5F8;
  id v7 = *(id *)(a1 + 56);
  [v3 activateWithRequestInfo:v4 context:v5 completion:v6];
}

void __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[AFSiriActivationConnection activateWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_9;
    v7[3] = &unk_1E59294E8;
    id v8 = v3;
    id v6 = +[AFSiriActivationResult newWithBuilder:v7];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_2_10(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[AFSiriActivationConnection activateWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __73__AFSiriActivationConnection_activateWithRequestInfo_context_completion___block_invoke_9(uint64_t a1, void *a2)
{
  return [a2 setError:*(void *)(a1 + 32)];
}

- (void)prewarmWithRequestInfo:(id)a3 context:(id)a4 completion:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  __int16 v11 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    id v21 = "-[AFSiriActivationConnection prewarmWithRequestInfo:context:completion:]";
    __int16 v22 = 2112;
    id v23 = v8;
    __int16 v24 = 2112;
    id v25 = v9;
    _os_log_impl(&dword_19CF1D000, v11, OS_LOG_TYPE_INFO, "%s requestInfo = %@, context = %@", buf, 0x20u);
  }
  queue = self->_queue;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke;
  v16[3] = &unk_1E592A8F8;
  v16[4] = self;
  id v17 = v8;
  id v18 = v9;
  id v19 = v10;
  id v13 = v9;
  id v14 = v8;
  id v15 = v10;
  dispatch_async(queue, v16);
}

void __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _connection];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2;
  v8[3] = &unk_1E592B9A0;
  id v9 = *(id *)(a1 + 56);
  id v3 = [v2 remoteObjectProxyWithErrorHandler:v8];
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2_6;
  v6[3] = &unk_1E592B5F8;
  id v7 = *(id *)(a1 + 56);
  [v3 prewarmWithRequestInfo:v4 context:v5 completion:v6];
}

void __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    id v10 = "-[AFSiriActivationConnection prewarmWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v11 = 2112;
    id v12 = v3;
    _os_log_error_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_ERROR, "%s error = %@", buf, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_3;
    v7[3] = &unk_1E59294E8;
    id v8 = v3;
    id v6 = +[AFSiriActivationResult newWithBuilder:v7];
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v6);
  }
}

void __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_2_6(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextConnection, OS_LOG_TYPE_INFO))
  {
    int v6 = 136315394;
    id v7 = "-[AFSiriActivationConnection prewarmWithRequestInfo:context:completion:]_block_invoke_2";
    __int16 v8 = 2112;
    id v9 = v3;
    _os_log_impl(&dword_19CF1D000, v4, OS_LOG_TYPE_INFO, "%s result = %@", (uint8_t *)&v6, 0x16u);
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  }
}

uint64_t __72__AFSiriActivationConnection_prewarmWithRequestInfo_context_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setError:*(void *)(a1 + 32)];
}

- (void)dealloc
{
  [(AFSiriActivationConnection *)self _invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFSiriActivationConnection;
  [(AFSiriActivationConnection *)&v3 dealloc];
}

- (AFSiriActivationConnection)initWithServicePort:(int64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)AFSiriActivationConnection;
  uint64_t v4 = [(AFSiriActivationConnection *)&v10 init];
  if (v4)
  {
    uint64_t v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_USER_INTERACTIVE, 0);

    dispatch_queue_t v7 = dispatch_queue_create("com.apple.siri.activation.connection", v6);
    queue = v4->_queue;
    v4->_queue = (OS_dispatch_queue *)v7;

    v4->_int64_t servicePort = a3;
  }
  return v4;
}

- (AFSiriActivationConnection)init
{
  return [(AFSiriActivationConnection *)self initWithServicePort:0];
}

@end