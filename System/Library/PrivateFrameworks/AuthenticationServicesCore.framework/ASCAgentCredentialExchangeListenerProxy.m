@interface ASCAgentCredentialExchangeListenerProxy
- (ASCAgentCredentialExchangeListenerProxy)init;
- (id)_reconnectIfNecessary;
- (id)_remoteObjectProxyWithErrorHandler:(id)a3;
- (void)_setUpConnection:(id)a3;
- (void)exportCredentials:(id)a3 windowSceneIdentifier:(id)a4 completionHandler:(id)a5;
- (void)importCredentialsWithToken:(id)a3 completionHandler:(id)a4;
- (void)setTokenForImport:(id)a3;
@end

@implementation ASCAgentCredentialExchangeListenerProxy

- (ASCAgentCredentialExchangeListenerProxy)init
{
  v9.receiver = self;
  v9.super_class = (Class)ASCAgentCredentialExchangeListenerProxy;
  v2 = [(ASCAgentCredentialExchangeListenerProxy *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.AuthenticationServicesCore.AuthenticationServicesAgent.CredentialExchange" options:0];
    connection = v2->_connection;
    v2->_connection = (NSXPCConnection *)v3;

    [(ASCAgentCredentialExchangeListenerProxy *)v2 _setUpConnection:v2->_connection];
    os_activity_t v5 = _os_activity_create(&dword_219326000, "Credential Exchange listener", MEMORY[0x263EF8420], OS_ACTIVITY_FLAG_DEFAULT);
    activity = v2->_activity;
    v2->_activity = (OS_os_activity *)v5;

    v7 = v2;
  }

  return v2;
}

- (void)_setUpConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  os_activity_t v5 = ASCAgentCredentialExchangeListenerInterface();
  [v4 setRemoteObjectInterface:v5];

  uint64_t v8 = MEMORY[0x263EF8330];
  uint64_t v9 = 3221225472;
  v10 = __60__ASCAgentCredentialExchangeListenerProxy__setUpConnection___block_invoke;
  v11 = &unk_26439F518;
  objc_copyWeak(&v12, &location);
  v6 = _Block_copy(&v8);
  objc_msgSend(v4, "setInvalidationHandler:", v6, v8, v9, v10, v11);
  [v4 setInterruptionHandler:v6];
  v7 = ASCAgentCredentialExchangeListenerInterface();
  [v4 setExportedInterface:v7];

  [v4 setExportedObject:self];
  [v4 resume];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __60__ASCAgentCredentialExchangeListenerProxy__setUpConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
      __60__ASCAgentCredentialExchangeListenerProxy__setUpConnection___block_invoke_cold_1(v2);
    }
    [WeakRetained[1] invalidate];
    id v3 = WeakRetained[1];
    WeakRetained[1] = 0;
  }
}

- (id)_reconnectIfNecessary
{
  connection = self->_connection;
  if (!connection)
  {
    id v4 = (NSXPCConnection *)[objc_alloc(MEMORY[0x263F08D68]) initWithMachServiceName:@"com.apple.AuthenticationServicesCore.AuthenticationServicesAgent.CredentialExchange" options:0];
    os_activity_t v5 = self->_connection;
    self->_connection = v4;

    [(ASCAgentCredentialExchangeListenerProxy *)self _setUpConnection:self->_connection];
    connection = self->_connection;
  }
  v6 = connection;

  return v6;
}

- (id)_remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4 = a3;
  os_activity_t v5 = [(ASCAgentCredentialExchangeListenerProxy *)self _reconnectIfNecessary];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __78__ASCAgentCredentialExchangeListenerProxy__remoteObjectProxyWithErrorHandler___block_invoke;
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
    v10 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentProxy _remoteObjectProxyWithErrorHandler:](v10);
    }
    v11 = objc_msgSend(MEMORY[0x263F087E8], "safari_errorWithDomain:code:privacyPreservingDescription:", *MEMORY[0x263F08438], 14, @"Failed to acquire remote object proxy.");
    (*((void (**)(id, void *))v6 + 2))(v6, v11);
  }

  return v8;
}

void __78__ASCAgentCredentialExchangeListenerProxy__remoteObjectProxyWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __78__ASCAgentCredentialExchangeListenerProxy__remoteObjectProxyWithErrorHandler___block_invoke_cold_1(v4, v3);
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)exportCredentials:(id)a3 windowSceneIdentifier:(id)a4 completionHandler:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke;
  v15[3] = &unk_26439F2B0;
  v15[4] = self;
  SEL v17 = a2;
  id v12 = v11;
  id v16 = v12;
  v13 = [(ASCAgentCredentialExchangeListenerProxy *)self _remoteObjectProxyWithErrorHandler:v15];
  id v14 = v13;
  if (v13) {
    [v13 exportCredentials:v9 windowSceneIdentifier:v10 completionHandler:v12];
  }
}

void __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 16);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke_2;
  v9[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v10 = v3;
  uint64_t v11 = v5;
  id v6 = v3;
  os_activity_apply(v4, v9);
  (*(void (**)(void, id, uint64_t, uint64_t))(a1[5] + 16))(a1[5], v6, v7, v8);
}

void __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)setTokenForImport:(id)a3
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __61__ASCAgentCredentialExchangeListenerProxy_setTokenForImport___block_invoke;
  v8[3] = &unk_26439F2D8;
  v8[4] = self;
  v8[5] = a2;
  id v6 = [(ASCAgentCredentialExchangeListenerProxy *)self _remoteObjectProxyWithErrorHandler:v8];
  uint64_t v7 = v6;
  if (v6) {
    [v6 setTokenForImport:v5];
  }
}

void __61__ASCAgentCredentialExchangeListenerProxy_setTokenForImport___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __61__ASCAgentCredentialExchangeListenerProxy_setTokenForImport___block_invoke_2;
  v7[3] = &unk_26439F288;
  uint64_t v5 = *(void *)(a1 + 40);
  id v8 = v3;
  uint64_t v9 = v5;
  id v6 = v3;
  os_activity_apply(v4, v7);
}

void __61__ASCAgentCredentialExchangeListenerProxy_setTokenForImport___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void)importCredentialsWithToken:(id)a3 completionHandler:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __88__ASCAgentCredentialExchangeListenerProxy_importCredentialsWithToken_completionHandler___block_invoke;
  v12[3] = &unk_26439F2B0;
  v12[4] = self;
  SEL v14 = a2;
  id v9 = v8;
  id v13 = v9;
  id v10 = [(ASCAgentCredentialExchangeListenerProxy *)self _remoteObjectProxyWithErrorHandler:v12];
  uint64_t v11 = v10;
  if (v10) {
    [v10 importCredentialsWithToken:v7 completionHandler:v9];
  }
}

void __88__ASCAgentCredentialExchangeListenerProxy_importCredentialsWithToken_completionHandler___block_invoke(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(a1[4] + 16);
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __88__ASCAgentCredentialExchangeListenerProxy_importCredentialsWithToken_completionHandler___block_invoke_2;
  v8[3] = &unk_26439F288;
  uint64_t v5 = a1[6];
  id v9 = v3;
  uint64_t v10 = v5;
  id v6 = v3;
  os_activity_apply(v4, v8);
  (*(void (**)(void, void, id, uint64_t))(a1[5] + 16))(a1[5], 0, v6, v7);
}

void __88__ASCAgentCredentialExchangeListenerProxy_importCredentialsWithToken_completionHandler___block_invoke_2(uint64_t a1)
{
  v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke_2_cold_1(a1, v2);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

void __60__ASCAgentCredentialExchangeListenerProxy__setUpConnection___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_219326000, log, OS_LOG_TYPE_ERROR, "Connection to AuthenticationServicesAgent closed", v1, 2u);
}

void __78__ASCAgentCredentialExchangeListenerProxy__remoteObjectProxyWithErrorHandler___block_invoke_cold_1(void *a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = a1;
  id v4 = objc_msgSend(a2, "safari_privacyPreservingDescription");
  int v5 = 138543362;
  id v6 = v4;
  _os_log_error_impl(&dword_219326000, v3, OS_LOG_TYPE_ERROR, "Remote proxy object error handler invoked with error: %{public}@", (uint8_t *)&v5, 0xCu);
}

void __101__ASCAgentCredentialExchangeListenerProxy_exportCredentials_windowSceneIdentifier_completionHandler___block_invoke_2_cold_1(uint64_t a1, void *a2)
{
  id v3 = *(const char **)(a1 + 40);
  id v4 = a2;
  int v5 = NSStringFromSelector(v3);
  id v6 = objc_msgSend(*(id *)(a1 + 32), "safari_privacyPreservingDescription");
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1_0(&dword_219326000, v7, v8, "Could not create AuthenticationServicesAgent proxy object in %{public}@: %{public}@", v9, v10, v11, v12, v13);
}

@end