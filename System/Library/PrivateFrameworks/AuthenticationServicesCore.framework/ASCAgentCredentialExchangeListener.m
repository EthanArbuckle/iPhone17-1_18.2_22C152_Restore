@interface ASCAgentCredentialExchangeListener
- (ASCAgentCredentialExchangeListener)init;
- (BOOL)_atLeastOneAppAvailableForImportForConnection:(id)a3;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (void)exportCredentials:(id)a3 windowSceneIdentifier:(id)a4 completionHandler:(id)a5;
- (void)importCredentialsWithToken:(id)a3 completionHandler:(id)a4;
- (void)setTokenForImport:(id)a3;
@end

@implementation ASCAgentCredentialExchangeListener

- (ASCAgentCredentialExchangeListener)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASCAgentCredentialExchangeListener;
  v2 = [(ASCAgentCredentialExchangeListener *)&v7 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x263F08D88]) initWithMachServiceName:@"com.apple.AuthenticationServicesCore.AuthenticationServicesAgent.CredentialExchange"];
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v3;

    [(NSXPCListener *)v2->_listener setDelegate:v2];
    v2->_internalLock._os_unfair_lock_opaque = 0;
    [(NSXPCListener *)v2->_listener resume];
    v5 = v2;
  }

  return v2;
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  long long v18 = 0u;
  long long v19 = 0u;
  if (v7) {
    [v7 auditToken];
  }
  *(_OWORD *)location = v18;
  long long v17 = v19;
  if ((WBSAuditTokenHasEntitlement() & 1) != 0
    || (*(_OWORD *)location = v18, long long v17 = v19, (WBSAuditTokenHasEntitlement() & 1) != 0))
  {
    os_unfair_lock_lock(&self->_internalLock);
    connection = self->_connection;
    BOOL v10 = connection == 0;
    if (!connection)
    {
      v11 = ASCAgentCredentialExchangeListenerInterface();
      [v8 setExportedInterface:v11];

      [v8 setExportedObject:self];
      objc_initWeak(location, self);
      v14[0] = MEMORY[0x263EF8330];
      v14[1] = 3221225472;
      v14[2] = __73__ASCAgentCredentialExchangeListener_listener_shouldAcceptNewConnection___block_invoke;
      v14[3] = &unk_26439F518;
      objc_copyWeak(&v15, location);
      [v8 setInvalidationHandler:v14];
      [v8 resume];
      objc_destroyWeak(&v15);
      objc_destroyWeak(location);
    }
    os_unfair_lock_unlock(&self->_internalLock);
  }
  else
  {
    v12 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener listener:shouldAcceptNewConnection:]();
    }
    BOOL v10 = 0;
  }

  return v10;
}

void __73__ASCAgentCredentialExchangeListener_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained + 4;
    v4 = WeakRetained;
    os_unfair_lock_lock(WeakRetained + 4);
    uint64_t v3 = *(void **)&v4[8]._os_unfair_lock_opaque;
    *(void *)&v4[8]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v2);
    WeakRetained = v4;
  }
}

- (void)exportCredentials:(id)a3 windowSceneIdentifier:(id)a4 completionHandler:(id)a5
{
  v31[1] = *MEMORY[0x263EF8340];
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, id))a5;
  v12 = [MEMORY[0x263F08D68] currentConnection];
  if (([MEMORY[0x263F662A0] isCredentialExchangeEnabled] & 1) == 0)
  {
    v20 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener exportCredentials:windowSceneIdentifier:completionHandler:]();
    }
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v30 = *MEMORY[0x263F08338];
    v31[0] = @"Developer mode must be enabled for this API. You can find the toggle for this in Settings > Developer in the Authentication Services Testing section.";
    v22 = NSDictionary;
    v23 = (__CFString **)v31;
    v24 = &v30;
    goto LABEL_11;
  }
  if (![(ASCAgentCredentialExchangeListener *)self _atLeastOneAppAvailableForImportForConnection:v12])
  {
    v25 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener exportCredentials:windowSceneIdentifier:completionHandler:]();
    }
    v21 = (void *)MEMORY[0x263F087E8];
    uint64_t v28 = *MEMORY[0x263F08338];
    v29 = @"No apps available for import";
    v22 = NSDictionary;
    v23 = &v29;
    v24 = &v28;
LABEL_11:
    id v13 = [v22 dictionaryWithObjects:v23 forKeys:v24 count:1];
    id v15 = [v21 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:19 userInfo:v13];
LABEL_12:
    v11[2](v11, v15);
    goto LABEL_13;
  }
  id v13 = objc_alloc_init(MEMORY[0x263F10468]);
  id v27 = 0;
  char v14 = [v13 canEvaluatePolicy:WBSAuthenticationPolicyForPasswordManager() error:&v27];
  id v15 = v27;
  if ((v14 & 1) == 0)
  {
    v26 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener exportCredentials:windowSceneIdentifier:completionHandler:]();
    }
    goto LABEL_12;
  }
  objc_storeStrong((id *)&self->_exportedCredentialData, a3);
  v16 = objc_alloc_init(ASCAuthorizationPresenter);
  presenter = self->_presenter;
  self->_presenter = v16;

  long long v18 = self->_presenter;
  uint64_t v19 = [MEMORY[0x263F29CB8] processHandleForNSXPCConnection:v12];
  [(ASCAuthorizationPresenter *)v18 presentExportFlowWithData:v9 forProcess:v19 windowSceneIdentifier:v10 completionHandler:v11];

  id v15 = (id)v19;
LABEL_13:
}

- (BOOL)_atLeastOneAppAvailableForImportForConnection:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    [v3 auditToken];
  }
  else
  {
    long long v12 = 0u;
    long long v13 = 0u;
  }
  v5 = WBSApplicationIdentifierFromAuditToken();
  uint64_t v11 = 0;
  id v6 = objc_msgSend(v5, "safari_bundleIdentifierFromApplicationIdentifier:", &v11);
  if (v6)
  {
    id v7 = [MEMORY[0x263F66568] sharedManager];
    char v8 = [v7 atLeastOneAvailableExtensionSupportsCredentialExchange:v6];
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener _atLeastOneAppAvailableForImportForConnection:]();
    }
    char v8 = 0;
  }

  return v8;
}

- (void)setTokenForImport:(id)a3
{
  id v4 = a3;
  v5 = [MEMORY[0x263F08D68] currentConnection];
  id v6 = v5;
  if (v5) {
    [v5 auditToken];
  }
  if (WBSAuditTokenHasEntitlement())
  {
    id v7 = (NSUUID *)[v4 copy];
    importerToken = self->_importerToken;
    self->_importerToken = v7;
  }
  else
  {
    id v9 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener setTokenForImport:]();
    }
  }
}

- (void)importCredentialsWithToken:(id)a3 completionHandler:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  if (([MEMORY[0x263F662A0] isCredentialExchangeEnabled] & 1) == 0)
  {
    id v10 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener exportCredentials:windowSceneIdentifier:completionHandler:]();
    }
    uint64_t v11 = (void *)MEMORY[0x263F087E8];
    uint64_t v24 = *MEMORY[0x263F08338];
    v25[0] = @"Developer mode must be enabled for this API. You can find the toggle for this in Settings > Developer in the Authentication Services Testing section.";
    long long v12 = [NSDictionary dictionaryWithObjects:v25 forKeys:&v24 count:1];
    long long v13 = v11;
    uint64_t v14 = 19;
    goto LABEL_14;
  }
  if (([v6 isEqual:self->_importerToken] & 1) == 0)
  {
    id v15 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener importCredentialsWithToken:completionHandler:]();
    }
    v16 = (void *)MEMORY[0x263F087E8];
    uint64_t v22 = *MEMORY[0x263F08338];
    v23 = @"The import request came from a client that did not match the one selected by the user for import.";
    long long v12 = [NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    long long v13 = v16;
    uint64_t v14 = 18;
    goto LABEL_14;
  }
  exportedCredentialData = self->_exportedCredentialData;
  if (!exportedCredentialData)
  {
    long long v17 = WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[ASCAgentCredentialExchangeListener importCredentialsWithToken:completionHandler:]();
    }
    long long v18 = (void *)MEMORY[0x263F087E8];
    uint64_t v20 = *MEMORY[0x263F08338];
    v21 = @"Exported credential data not found.";
    long long v12 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
    long long v13 = v18;
    uint64_t v14 = 1;
LABEL_14:
    uint64_t v19 = [v13 errorWithDomain:@"com.apple.AuthenticationServicesCore.AuthorizationError" code:v14 userInfo:v12];
    v7[2](v7, 0, v19);

    goto LABEL_15;
  }
  ((void (**)(id, NSData *, void *))v7)[2](v7, exportedCredentialData, 0);
  id v9 = self->_exportedCredentialData;
  self->_exportedCredentialData = 0;

LABEL_15:
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_importerToken, 0);
  objc_storeStrong((id *)&self->_importerBundleID, 0);
  objc_storeStrong((id *)&self->_exportedCredentialData, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_presenter, 0);

  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:shouldAcceptNewConnection:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Rejecting connection from unentitled process", v2, v3, v4, v5, v6);
}

- (void)exportCredentials:windowSceneIdentifier:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Export not available because passcode and/or biometrics are not enabled", v2, v3, v4, v5, v6);
}

- (void)exportCredentials:windowSceneIdentifier:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "No apps available for import", v2, v3, v4, v5, v6);
}

- (void)exportCredentials:windowSceneIdentifier:completionHandler:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Developer mode must be enabled for this API. You can find the toggle for this in Settings > Developer in the Authentication Services Testing section.", v2, v3, v4, v5, v6);
}

- (void)_atLeastOneAppAvailableForImportForConnection:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Unable to get exporting app's bundle ID", v2, v3, v4, v5, v6);
}

- (void)setTokenForImport:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Token for importer must only be set by the view service", v2, v3, v4, v5, v6);
}

- (void)importCredentialsWithToken:completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Exported credential data not found", v2, v3, v4, v5, v6);
}

- (void)importCredentialsWithToken:completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_219326000, v0, v1, "Invalid importer token", v2, v3, v4, v5, v6);
}

@end