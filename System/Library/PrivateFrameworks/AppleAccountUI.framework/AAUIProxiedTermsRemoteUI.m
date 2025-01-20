@interface AAUIProxiedTermsRemoteUI
- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3;
- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3 proxiedDevice:(id)a4 anisetteDataProvider:(id)a5 appProvidedContext:(id)a6 termsEntries:(id)a7;
- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3 proxiedDevice:(id)a4 appProvidedContext:(id)a5;
- (id)_authContextForRenewCredentials;
- (id)_sessionConfiguration;
- (void)_addHeadersToRequest:(id)a3;
- (void)_agreeToTermsWithURLString:(id)a3 serverInfo:(id)a4 preferPassword:(BOOL)a5 completion:(id)a6;
- (void)_sendAcceptedTermsInfo:(id)a3;
@end

@implementation AAUIProxiedTermsRemoteUI

- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3
{
  id v3 = a3;
  __assert_rtn("-[AAUIProxiedTermsRemoteUI initWithAuthResults:]", "AAUIProxiedTermsRemoteUI.m", 23, "0");
}

- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3 proxiedDevice:(id)a4 appProvidedContext:(id)a5
{
  return [(AAUIProxiedTermsRemoteUI *)self initWithAuthResults:a3 proxiedDevice:a4 anisetteDataProvider:0 appProvidedContext:a5 termsEntries:0];
}

- (AAUIProxiedTermsRemoteUI)initWithAuthResults:(id)a3 proxiedDevice:(id)a4 anisetteDataProvider:(id)a5 appProvidedContext:(id)a6 termsEntries:(id)a7
{
  v12 = (AKDevice *)a4;
  v13 = (AKAnisetteServiceProtocol *)a5;
  v14 = (NSString *)a6;
  proxiedDevice = self->_proxiedDevice;
  self->_proxiedDevice = v12;
  v16 = v12;
  id v17 = a7;
  id v18 = a3;

  appProvidedContext = self->_appProvidedContext;
  self->_appProvidedContext = v14;
  v20 = v14;

  anisetteDataProvider = self->_anisetteDataProvider;
  self->_anisetteDataProvider = v13;
  v22 = v13;

  id v23 = objc_alloc_init(MEMORY[0x263EFB210]);
  id v24 = objc_alloc(MEMORY[0x263EFB1F8]);
  v25 = [v23 accountTypeWithAccountTypeIdentifier:*MEMORY[0x263EFAE58]];
  v26 = (void *)[v24 initWithAccountType:v25];

  v27 = [v18 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  [v26 setUsername:v27];

  v28 = [v18 objectForKeyedSubscript:*MEMORY[0x263F28F80]];
  [v26 setAccountProperty:v28 forKey:@"personID"];

  v29 = [v18 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  objc_msgSend(v26, "_aa_setAltDSID:", v29);

  v30 = [v18 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];

  objc_msgSend(v26, "aa_setPassword:", v30);
  v33.receiver = self;
  v33.super_class = (Class)AAUIProxiedTermsRemoteUI;
  v31 = [(AAUIGenericTermsRemoteUI *)&v33 initWithAccount:v26 inStore:v23 termsEntries:v17];

  return v31;
}

- (id)_sessionConfiguration
{
  id v3 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  id v4 = objc_alloc_init(MEMORY[0x263F29120]);
  [v4 setPairedDevice:self->_proxiedDevice];
  [v4 setAnisetteDataProvider:self->_anisetteDataProvider];
  objc_msgSend(v3, "set_appleIDContext:", v4);

  return v3;
}

- (id)_authContextForRenewCredentials
{
  id v3 = objc_alloc_init(MEMORY[0x263F292A8]);
  id v4 = [(AAUIGenericTermsRemoteUI *)self account];
  v5 = [v4 username];
  [v3 setUsername:v5];

  [v3 setIsUsernameEditable:0];
  v6 = [(AAUIGenericTermsRemoteUI *)self originatingViewController];
  [v3 setPresentingViewController:v6];

  [v3 setShouldOfferSecurityUpgrade:0];
  [v3 setServiceType:1];
  [v3 setProxiedDevice:self->_proxiedDevice];
  [v3 setAppProvidedContext:self->_appProvidedContext];
  [v3 setAuthenticationType:0];
  v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"PASSWORD_REQUIRED_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  [v3 setTitle:v8];

  v9 = NSString;
  v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"RENEW_FOR_TERMS_AND_CONDITIONS_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  v12 = [(AAUIGenericTermsRemoteUI *)self account];
  v13 = [v12 username];
  v14 = objc_msgSend(v9, "stringWithFormat:", v11, v13);
  [v3 setReason:v14];

  return v3;
}

- (void)_addHeadersToRequest:(id)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "aa_addClientInfoHeaders");
  v5 = [(AAUIGenericTermsRemoteUI *)self account];
  objc_msgSend(v4, "aa_addProxiedAuthHeaderWithAccount:", v5);

  objc_msgSend(v4, "aa_addAppProvidedContext:", self->_appProvidedContext);
  v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = [v4 allHTTPHeaderFields];
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Proxied Terms Request Headers: %@", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_agreeToTermsWithURLString:(id)a3 serverInfo:(id)a4 preferPassword:(BOOL)a5 completion:(id)a6
{
  id v9 = a6;
  uint64_t v10 = (objc_class *)MEMORY[0x263F259E8];
  id v11 = a4;
  id v12 = a3;
  id v13 = [v10 alloc];
  v14 = [(AAUIGenericTermsRemoteUI *)self account];
  v15 = (void *)[v13 initWithURLString:v12 account:v14];

  [v15 setPreferPassword:1];
  id v16 = objc_alloc_init(MEMORY[0x263F089E0]);
  [(AAUIProxiedTermsRemoteUI *)self _addHeadersToRequest:v16];
  id v17 = [v16 allHTTPHeaderFields];
  [v15 setCustomHeaders:v17];

  [v15 setServerInfo:v11];
  proxiedDevice = self->_proxiedDevice;
  anisetteDataProvider = self->_anisetteDataProvider;
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke;
  v21[3] = &unk_263F93898;
  v21[4] = self;
  id v22 = v9;
  id v20 = v9;
  [v15 performRequestForDevice:proxiedDevice anisetteDataProvider:anisetteDataProvider withHandler:v21];
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  int v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3((uint64_t)v6, (uint64_t)v7, v8);
  }

  if ((unint64_t)([v6 statusCode] - 200) > 0x63)
  {
    id v16 = _AAUILogSystem();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v17) {
        __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2((uint64_t)v7, v16);
      }
    }
    else if (v17)
    {
      __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1(v16);
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Successfully agreed to iCloud terms!", v18, 2u);
    }

    uint64_t v10 = *(void **)(a1 + 32);
    id v11 = v6;
    id v12 = [v11 acceptedTermsInfo];
    [v10 _sendAcceptedTermsInfo:v12];

    uint64_t v13 = *(void *)(a1 + 40);
    v14 = [v11 responseDictionary];
    v15 = [v14 objectForKeyedSubscript:@"serverInfo"];
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 1, v15);
  }
}

- (void)_sendAcceptedTermsInfo:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    id v4 = [(AAUIGenericTermsRemoteUI *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(AAUIGenericTermsRemoteUI *)self delegate];
      [v6 genericTermsRemoteUI:self acceptedTermsInfo:v7];
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anisetteDataProvider, 0);
  objc_storeStrong((id *)&self->_appProvidedContext, 0);
  objc_storeStrong((id *)&self->_proxiedDevice, 0);
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_209754000, log, OS_LOG_TYPE_ERROR, "Error agreeing to iCloud terms!", v1, 2u);
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Error agreeing to iCloud terms: %@", (uint8_t *)&v2, 0xCu);
}

void __92__AAUIProxiedTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "AAiCloudTermsAgreeRequest response: %@. Error: %@", (uint8_t *)&v3, 0x16u);
}

@end