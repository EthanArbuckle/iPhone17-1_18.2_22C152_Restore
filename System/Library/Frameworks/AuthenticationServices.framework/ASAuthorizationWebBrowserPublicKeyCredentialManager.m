@interface ASAuthorizationWebBrowserPublicKeyCredentialManager
- (ASAuthorizationWebBrowserPublicKeyCredentialManager)init;
- (ASAuthorizationWebBrowserPublicKeyCredentialManagerAuthorizationState)authorizationStateForPlatformCredentials;
- (void)corePlatformCredentialsForRelyingParty:(id)a3 completionHandler:(id)a4;
- (void)platformCredentialsForRelyingParty:(NSString *)relyingParty completionHandler:(void *)completionHandler;
- (void)requestAuthorizationForPublicKeyCredentials:(void *)completionHandler;
@end

@implementation ASAuthorizationWebBrowserPublicKeyCredentialManager

- (ASAuthorizationWebBrowserPublicKeyCredentialManager)init
{
  v7.receiver = self;
  v7.super_class = (Class)ASAuthorizationWebBrowserPublicKeyCredentialManager;
  v2 = [(ASAuthorizationWebBrowserPublicKeyCredentialManager *)&v7 init];
  if (v2)
  {
    v3 = (ASCAgentProxy *)objc_alloc_init(MEMORY[0x263F293B0]);
    agentProxy = v2->_agentProxy;
    v2->_agentProxy = v3;

    v5 = v2;
  }

  return v2;
}

- (void)platformCredentialsForRelyingParty:(NSString *)relyingParty completionHandler:(void *)completionHandler
{
  id v6 = completionHandler;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __108__ASAuthorizationWebBrowserPublicKeyCredentialManager_platformCredentialsForRelyingParty_completionHandler___block_invoke;
  v8[3] = &unk_264396688;
  id v9 = v6;
  id v7 = v6;
  [(ASAuthorizationWebBrowserPublicKeyCredentialManager *)self corePlatformCredentialsForRelyingParty:relyingParty completionHandler:v8];
}

void __108__ASAuthorizationWebBrowserPublicKeyCredentialManager_platformCredentialsForRelyingParty_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "safari_mapObjectsUsingBlock:", &__block_literal_global_19);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

ASAuthorizationWebBrowserPlatformPublicKeyCredential *__108__ASAuthorizationWebBrowserPublicKeyCredentialManager_platformCredentialsForRelyingParty_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [[ASAuthorizationWebBrowserPlatformPublicKeyCredential alloc] initWithCorePasskey:v2];

  return v3;
}

- (void)requestAuthorizationForPublicKeyCredentials:(void *)completionHandler
{
  id v3 = completionHandler;
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, "Requesting TCC access for passkey browser requests.", buf, 2u);
  }
  id v6 = v3;
  id v5 = v3;
  TCCAccessRequest();
}

uint64_t __99__ASAuthorizationWebBrowserPublicKeyCredentialManager_requestAuthorizationForPublicKeyCredentials___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = a2;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, "TCC access: %{BOOL}d", (uint8_t *)v6, 8u);
  }
  return (*(uint64_t (**)(void, BOOL))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2 == 0);
}

- (ASAuthorizationWebBrowserPublicKeyCredentialManagerAuthorizationState)authorizationStateForPlatformCredentials
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v2 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_21918F000, v2, OS_LOG_TYPE_INFO, "Checking TCC access for passkey browser requests.", (uint8_t *)v6, 2u);
  }
  unsigned int v3 = TCCAccessPreflight();
  v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109120;
    v6[1] = v3;
    _os_log_impl(&dword_21918F000, v4, OS_LOG_TYPE_INFO, "TCC access: %d", (uint8_t *)v6, 8u);
  }
  if (v3 >= 2) {
    return 2;
  }
  else {
    return (unint64_t)v3;
  }
}

- (void)corePlatformCredentialsForRelyingParty:(id)a3 completionHandler:(id)a4
{
}

- (void).cxx_destruct
{
}

@end