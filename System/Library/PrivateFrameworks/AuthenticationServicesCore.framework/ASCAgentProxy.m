@interface ASCAgentProxy
- (ASCAgentProxy)init;
- (ASCAgentProxy)initWithFailureHandler:(id)a3;
- (id)_reconnectIfNecessary;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (id)_savedAccountContextFromSafariApplicationWithRequestContext:(id)a3;
- (void)_setUpConnection:(id)a3;
- (void)browserPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4;
- (void)cancelCurrentRequest;
- (void)clearAllPlatformPublicKeyCredentialsWithCompletionHandler:(id)a3;
- (void)dealloc;
- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4;
- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5;
- (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4;
- (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3;
- (void)openCABLEURL:(id)a3 fromSourceApplication:(id)a4 withCompletionHandler:(id)a5;
- (void)openCredentialProviderAppSettingsWithCompletionHandler:(id)a3;
- (void)openVerificationCodeAppSettingsWithCompletionHandler:(id)a3;
- (void)performAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4;
- (void)performSilentAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4;
- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3;
- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5;
- (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3;
@end

@implementation ASCAgentProxy

- (ASCAgentProxy)init
{
  return [(ASCAgentProxy *)self initWithFailureHandler:0];
}

- (ASCAgentProxy)initWithFailureHandler:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASCAgentProxy;
  v5 = [(ASCAgentProxy *)&v14 init];
  if (v5)
  {
    id v6 = objc_alloc(MEMORY[0x263F08D68]);
    v7 = ASCAgentServiceName();
    uint64_t v8 = [v6 initWithMachServiceName:v7 options:0];
    connection = v5->_connection;
    v5->_connection = (NSXPCConnection *)v8;

    v5->_connectionLock._os_unfair_lock_opaque = 0;
    v10 = _Block_copy(v4);
    id failureHandler = v5->_failureHandler;
    v5->_id failureHandler = v10;

    [(ASCAgentProxy *)v5 _setUpConnection:v5->_connection];
    v12 = v5;
  }

  return v5;
}

- (void)_setUpConnection:(id)a3
{
  id v4 = a3;
  v5 = +[ASCAgentInterface xpcInterface];
  [v4 setRemoteObjectInterface:v5];
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __34__ASCAgentProxy__setUpConnection___block_invoke;
  aBlock[3] = &unk_26439F210;
  objc_copyWeak(&v10, &location);
  id v6 = v4;
  id v9 = v6;
  v7 = _Block_copy(aBlock);
  [v6 setInvalidationHandler:v7];
  [v6 setInterruptionHandler:v7];
  [v6 resume];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __34__ASCAgentProxy__setUpConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained + 4;
    v7 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    id v4 = v7;
    v5 = *(void **)(a1 + 32);
    if (v5 == *(void **)&v7[2]._os_unfair_lock_opaque)
    {
      *(void *)&v7[2]._os_unfair_lock_opaque = 0;

      id v4 = v7;
    }
    uint64_t v6 = *(void *)&v4[8]._os_unfair_lock_opaque;
    if (v6) {
      (*(void (**)(void))(v6 + 16))();
    }
    os_unfair_lock_unlock(v3);
    WeakRetained = v7;
  }
}

- (void)dealloc
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  id v4 = self->_connection;
  os_unfair_lock_unlock(p_connectionLock);
  [(NSXPCConnection *)v4 invalidate];

  v5.receiver = self;
  v5.super_class = (Class)ASCAgentProxy;
  [(ASCAgentProxy *)&v5 dealloc];
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(ASCAgentProxy *)self _reconnectIfNecessary];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke;
  v13[3] = &unk_26439F238;
  id v6 = v4;
  id v14 = v6;
  v7 = [v5 remoteObjectProxyWithErrorHandler:v13];
  uint64_t v8 = v7;
  if (v7)
  {
    id v9 = v7;
  }
  else
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](v10);
    }
    v11 = objc_msgSend(MEMORY[0x263F087E8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x263F08438], 14, @"Failed to acquire remote object proxy.");
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }

  return v8;
}

void __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)performAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(ASCAgentProxy *)self _savedAccountContextFromSafariApplicationWithRequestContext:v7];
  [v7 setSavedAccountContext:v8];

  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke;
  v14[3] = &unk_26439F260;
  v14[4] = self;
  id v9 = v6;
  id v15 = v9;
  id v10 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v14];
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_7;
  v12[3] = &unk_26439ED68;
  id v13 = v9;
  id v11 = v9;
  [v10 performAuthorizationRequestsForContext:v7 withCompletionHandler:v12];
}

void __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2;
  block[3] = &unk_26439ED00;
  id v7 = v3;
  id v5 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

uint64_t __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_7(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)clearAllPlatformPublicKeyCredentialsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke;
  v9[3] = &unk_26439F2B0;
  v9[4] = self;
  SEL v11 = a2;
  id v6 = v5;
  id v10 = v6;
  id v7 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v9];
  uint64_t v8 = v7;
  if (v7) {
    [v7 clearAllPlatformPublicKeyCredentialsWithCompletionHandler:v6];
  }
}

void __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 24);
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2;
  v10[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v11 = v3;
  uint64_t v12 = v5;
  id v6 = v3;
  os_activity_apply(v4, v10);
  (*(void (**)(void, uint64_t, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v7, v8, v9);
}

void __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)getShouldUseAlternateCredentialStoreWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  uint64_t v9 = __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke;
  id v10 = &unk_26439F260;
  id v11 = self;
  id v12 = v4;
  id v5 = v4;
  id v6 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:&v7];
  objc_msgSend(v6, "getShouldUseAlternateCredentialStoreWithCompletionHandler:", v5, v7, v8, v9, v10, v11);
}

void __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke_2;
  block[3] = &unk_26439ED00;
  id v7 = v3;
  id v5 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __75__ASCAgentProxy_getShouldUseAlternateCredentialStoreWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)getArePasskeysDisallowedForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  id v12 = __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke;
  id v13 = &unk_26439F260;
  id v14 = self;
  id v15 = v6;
  id v7 = v6;
  id v8 = a3;
  uint64_t v9 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:&v10];
  objc_msgSend(v9, "getArePasskeysDisallowedForRelyingParty:withCompletionHandler:", v8, v7, v10, v11, v12, v13, v14);
}

void __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2;
  block[3] = &unk_26439ED00;
  id v7 = v3;
  id v5 = v3;
  os_activity_apply(v4, block);
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __79__ASCAgentProxy_getArePasskeysDisallowedForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)openCABLEURL:(id)a3 fromSourceApplication:(id)a4 withCompletionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  activity = self->_activity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke;
  block[3] = &unk_26439EFE0;
  id v13 = v9;
  id v22 = v13;
  id v14 = v10;
  id v23 = v14;
  os_activity_apply(activity, block);
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_9;
  v18[3] = &unk_26439F2B0;
  v18[4] = self;
  SEL v20 = a2;
  id v15 = v11;
  id v19 = v15;
  v16 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v18];
  v17 = v16;
  if (v16) {
    [v16 openCABLEURL:v13 fromSourceApplication:v14 withCompletionHandler:v15];
  }
}

void __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v5 = 138478083;
    uint64_t v6 = v3;
    __int16 v7 = 2112;
    uint64_t v8 = v4;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_DEFAULT, "Open caBLE URL: %{private}@, sourceApplication: %@", (uint8_t *)&v5, 0x16u);
  }
}

void __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_9(void *a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(NSObject **)(a1[4] + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2;
  v9[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  os_activity_apply(v4, v9);
  (*(void (**)(void, id, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v6, v7, v8);
}

void __74__ASCAgentProxy_openCABLEURL_fromSourceApplication_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)browserPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  activity = self->_activity;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke;
  block[3] = &unk_26439ED00;
  id v10 = v7;
  id v22 = v10;
  os_activity_apply(activity, block);
  uint64_t v14 = MEMORY[0x263EF8330];
  uint64_t v15 = 3221225472;
  v16 = __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_10;
  v17 = &unk_26439F2B0;
  v18 = self;
  SEL v20 = a2;
  id v11 = v8;
  id v19 = v11;
  id v12 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:&v14];
  id v13 = v12;
  if (v12) {
    objc_msgSend(v12, "browserPasskeysForRelyingParty:completionHandler:", v10, v11, v14, v15, v16, v17, v18);
  }
}

void __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = 138477827;
    uint64_t v5 = v3;
    _os_log_impl(&dword_219326000, v2, OS_LOG_TYPE_INFO, "Browser requested passkeys for %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_10(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(a1[4] + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_2;
  v9[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  os_activity_apply(v4, v9);
  (*(void (**)(void, void, uint64_t, uint64_t))(a1[5] + 16))(a1[5], MEMORY[0x263EFFA68], v7, v8);
}

void __66__ASCAgentProxy_browserPasskeysForRelyingParty_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)getCanCurrentProcessAccessPasskeysForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke;
  v12[3] = &unk_26439F2B0;
  void v12[4] = self;
  SEL v14 = a2;
  id v9 = v8;
  id v13 = v9;
  id v10 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v12];
  uint64_t v11 = v10;
  if (v10) {
    [v10 getCanCurrentProcessAccessPasskeysForRelyingParty:v7 withCompletionHandler:v9];
  }
}

void __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(a1[4] + 24);
  uint64_t v7 = MEMORY[0x263EF8330];
  uint64_t v8 = 3221225472;
  id v9 = __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2;
  id v10 = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v11 = v3;
  uint64_t v12 = v5;
  id v6 = v3;
  os_activity_apply(v4, &v7);
  (*(void (**)(void, BOOL))(a1[5] + 16))(a1[5], objc_msgSend(v6, "code", v7, v8, v9, v10) == 4099);
}

void __89__ASCAgentProxy_getCanCurrentProcessAccessPasskeysForRelyingParty_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)performSilentAuthorizationRequestsForContext:(id)a3 withCompletionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "Asked to perform silent request.", buf, 2u);
  }
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke;
  aBlock[3] = &unk_26439ED68;
  id v9 = v6;
  id v19 = v9;
  id v10 = _Block_copy(aBlock);
  uint64_t v13 = MEMORY[0x263EF8330];
  uint64_t v14 = 3221225472;
  uint64_t v15 = __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2;
  v16 = &unk_26439F238;
  id v17 = v9;
  id v11 = v9;
  uint64_t v12 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:&v13];
  objc_msgSend(v12, "performSilentAuthorizationRequestsForContext:withCompletionHandler:", v7, v10, v13, v14, v15, v16);
}

uint64_t __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)getPasskeysDataForRelyingParty:(id)a3 withCompletionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v14 = v6;
    _os_log_impl(&dword_219326000, v8, OS_LOG_TYPE_INFO, "Asked to look up passkey data for %{public}@.", buf, 0xCu);
  }
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __70__ASCAgentProxy_getPasskeysDataForRelyingParty_withCompletionHandler___block_invoke;
  v11[3] = &unk_26439F238;
  id v12 = v7;
  id v9 = v7;
  id v10 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v11];
  [v10 getPasskeysDataForRelyingParty:v6 withCompletionHandler:v9];
}

void __70__ASCAgentProxy_getPasskeysDataForRelyingParty_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)deletePasskeyForRelyingParty:(id)a3 withCredentialID:(id)a4 completionHandler:(id)a5
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    id v20 = v10;
    __int16 v21 = 2114;
    id v22 = v9;
    _os_log_impl(&dword_219326000, v12, OS_LOG_TYPE_INFO, "Asked to delete passkey %{public}@ for %{public}@.", buf, 0x16u);
  }
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke;
  v16[3] = &unk_26439F2B0;
  v16[4] = self;
  SEL v18 = a2;
  id v13 = v11;
  id v17 = v13;
  id v14 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v16];
  uint64_t v15 = v14;
  if (v14) {
    [v14 deletePasskeyForRelyingParty:v9 withCredentialID:v10 completionHandler:v13];
  }
}

void __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(a1[4] + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke_2;
  v8[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v9 = v3;
  uint64_t v10 = v5;
  id v6 = v3;
  os_activity_apply(v4, v8);
  (*(void (**)(void, void, id, uint64_t))(a1[5] + 16))(a1[5], 0, v6, v7);
}

void __81__ASCAgentProxy_deletePasskeyForRelyingParty_withCredentialID_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)deleteAllPasskeysForRelyingParty:(id)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    id v17 = v7;
    _os_log_impl(&dword_219326000, v9, OS_LOG_TYPE_INFO, "Asked to delete all passkeys for %{public}@.", buf, 0xCu);
  }
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke;
  v13[3] = &unk_26439F2B0;
  void v13[4] = self;
  SEL v15 = a2;
  id v10 = v8;
  id v14 = v10;
  id v11 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v13];
  id v12 = v11;
  if (v11) {
    [v11 deleteAllPasskeysForRelyingParty:v7 completionHandler:v10];
  }
}

void __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  int v4 = *(NSObject **)(a1[4] + 24);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke_2;
  v8[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v9 = v3;
  uint64_t v10 = v5;
  id v6 = v3;
  os_activity_apply(v4, v8);
  (*(void (**)(void, void, id, uint64_t))(a1[5] + 16))(a1[5], 0, v6, v7);
}

void __68__ASCAgentProxy_deleteAllPasskeysForRelyingParty_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:(id)a3
{
  id v4 = a3;
  uint64_t v5 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_219326000, v5, OS_LOG_TYPE_INFO, "Asked to preflight creating passkey in iCloud Keychain.", buf, 2u);
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__ASCAgentProxy_preflightCanCreateICloudKeychainPasskeyWithCompletionHandler___block_invoke;
  v8[3] = &unk_26439F238;
  id v9 = v4;
  id v6 = v4;
  uint64_t v7 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v8];
  [v7 preflightCanCreateICloudKeychainPasskeyWithCompletionHandler:v6];
}

void __78__ASCAgentProxy_preflightCanCreateICloudKeychainPasskeyWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)renamePasskeyWithCredentialID:(id)a3 newName:(id)a4 completionHandler:(id)a5
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543619;
    id v17 = v8;
    __int16 v18 = 2113;
    id v19 = v9;
    _os_log_impl(&dword_219326000, v11, OS_LOG_TYPE_INFO, "Asked to rename passkey %{public}@ to %{private}@.", buf, 0x16u);
  }
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __73__ASCAgentProxy_renamePasskeyWithCredentialID_newName_completionHandler___block_invoke;
  v14[3] = &unk_26439F238;
  id v15 = v10;
  id v12 = v10;
  id v13 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v14];
  [v13 renamePasskeyWithCredentialID:v8 newName:v9 completionHandler:v12];
}

void __73__ASCAgentProxy_renamePasskeyWithCredentialID_newName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(v4);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)openCredentialProviderAppSettingsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke;
  v9[3] = &unk_26439F2B0;
  void v9[4] = self;
  SEL v11 = a2;
  id v6 = v5;
  id v10 = v6;
  uint64_t v7 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v9];
  id v8 = v7;
  if (v7) {
    [v7 openCredentialProviderAppSettingsWithCompletionHandler:v6];
  }
}

void __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  os_activity_apply(v4, v9);
  (*(void (**)(void, id, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v6, v7, v8);
}

void __72__ASCAgentProxy_openCredentialProviderAppSettingsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)openVerificationCodeAppSettingsWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke;
  v9[3] = &unk_26439F2B0;
  void v9[4] = self;
  SEL v11 = a2;
  id v6 = v5;
  id v10 = v6;
  uint64_t v7 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v9];
  uint64_t v8 = v7;
  if (v7) {
    [v7 openVerificationCodeAppSettingsWithCompletionHandler:v6];
  }
}

void __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  os_activity_apply(v4, v9);
  (*(void (**)(void, id, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v6, v7, v8);
}

void __70__ASCAgentProxy_openVerificationCodeAppSettingsWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)requestToTurnOnCredentialProviderExtensionWithCompletionHandler:(id)a3
{
  id v5 = a3;
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke;
  v9[3] = &unk_26439F2B0;
  void v9[4] = self;
  SEL v11 = a2;
  id v6 = v5;
  id v10 = v6;
  uint64_t v7 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v9];
  uint64_t v8 = v7;
  if (v7) {
    [v7 requestToTurnOnCredentialProviderExtensionWithCompletionHandler:v6];
  }
}

void __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 24);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  os_activity_apply(v4, v9);
  (*(void (**)(void, void, uint64_t, uint64_t))(a1[5] + 16))(a1[5], 0, v7, v8);
}

void __81__ASCAgentProxy_requestToTurnOnCredentialProviderExtensionWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)cancelCurrentRequest
{
  os_activity_apply((os_activity_t)self->_activity, &__block_literal_global_2);
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_11;
  v6[3] = &unk_26439F2D8;
  v6[4] = self;
  v6[5] = a2;
  id v4 = [(ASCAgentProxy *)self _remoteObjectProxyWithErrorHandler:v6];
  uint64_t v5 = v4;
  if (v4) {
    [v4 cancelCurrentRequest];
  }
}

void __37__ASCAgentProxy_cancelCurrentRequest__block_invoke()
{
  v0 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_219326000, v0, OS_LOG_TYPE_DEFAULT, "Client asked to cancel request.", v1, 2u);
  }
}

void __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_11(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_2;
  v7[3] = &unk_26439F288;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  os_activity_apply(v4, v7);
}

void __37__ASCAgentProxy_cancelCurrentRequest__block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (id)_savedAccountContextFromSafariApplicationWithRequestContext:(id)a3
{
  id v3 = a3;
  id v4 = [MEMORY[0x263F66398] defaultContext];
  uint64_t v5 = [MEMORY[0x263F086E0] mainBundle];
  char v6 = objc_msgSend(v5, "safari_isSafariFamilyApplicationBundle");

  if ((v6 & 1) != 0 && (Class v7 = NSClassFromString(&cfstr_Uiapplication.isa)) != 0)
  {
    Class v8 = v7;
    if (objc_opt_respondsToSelector())
    {
      uint64_t v9 = [(objc_class *)v8 sharedApplication];
    }
    else
    {
      uint64_t v9 = 0;
    }
    if ([v9 conformsToProtocol:&unk_26CAD1488])
    {
      uint64_t v11 = [v3 globalFrameID];
      id v12 = [v11 webPageID];
      uint64_t v13 = objc_msgSend(v9, "savedAccountContextForWebPageID:", objc_msgSend(v12, "unsignedLongLongValue"));

      id v4 = (void *)v13;
    }
    id v10 = v4;
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (id)_reconnectIfNecessary
{
  p_connectionLock = &self->_connectionLock;
  os_unfair_lock_lock(&self->_connectionLock);
  connection = self->_connection;
  if (!connection)
  {
    id v5 = objc_alloc(MEMORY[0x263F08D68]);
    char v6 = ASCAgentServiceName();
    Class v7 = (NSXPCConnection *)[v5 initWithMachServiceName:v6 options:0];
    Class v8 = self->_connection;
    self->_connection = v7;

    [(ASCAgentProxy *)self _setUpConnection:self->_connection];
    connection = self->_connection;
  }
  uint64_t v9 = connection;
  os_unfair_lock_unlock(p_connectionLock);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_failureHandler, 0);
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)_remoteObjectProxyWithErrorHandler:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219326000, log, OS_LOG_TYPE_ERROR, "Failed to acquire remote object proxy.", v1, 2u);
}

void __52__ASCAgentProxy__remoteObjectProxyWithErrorHandler___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Remote proxy object error handler invoked with error: %{public}@", v6, v7, v8, v9, v10);
}

void __78__ASCAgentProxy_performAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v5, v6, "Connection to agent service interrupted with error: %{public}@", v7, v8, v9, v10, v11);
}

void __75__ASCAgentProxy_clearAllPlatformPublicKeyCredentialsWithCompletionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  OUTLINED_FUNCTION_4(a1, a2);
  uint64_t v4 = (const char *)OUTLINED_FUNCTION_5();
  NSStringFromSelector(v4);
  objc_claimAutoreleasedReturnValue();
  uint64_t v5 = objc_msgSend((id)OUTLINED_FUNCTION_3_0(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_219326000, v6, v7, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v8, v9, v10, v11, v12);
}

void __84__ASCAgentProxy_performSilentAuthorizationRequestsForContext_withCompletionHandler___block_invoke_2_cold_1(void *a1)
{
  id v2 = a1;
  id v3 = objc_msgSend((id)OUTLINED_FUNCTION_1(), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_219326000, v4, v5, "Connection to agent service interrupted with error: %{public}@", v6, v7, v8, v9, v10);
}

@end