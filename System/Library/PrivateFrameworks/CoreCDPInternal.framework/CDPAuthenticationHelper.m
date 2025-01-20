@interface CDPAuthenticationHelper
+ (id)_authContextForContext:(id)a3;
+ (id)_contextForPrimaryAccount;
+ (id)_contextForPrimaryAccountSilentAuth;
+ (id)authController;
+ (void)_authWithContext:(id)a3 completion:(id)a4;
+ (void)silentAuthenticationForContext:(id)a3 withCompletion:(id)a4;
+ (void)silentAuthenticationForPrimaryAccountWithClientAppName:(id)a3 clientAppBundleId:(id)a4 withCompletion:(id)a5;
+ (void)silentAuthenticationForPrimaryAccountWithCompletion:(id)a3;
@end

@implementation CDPAuthenticationHelper

+ (void)silentAuthenticationForPrimaryAccountWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() _contextForPrimaryAccountSilentAuth];
  [a1 _authWithContext:v5 completion:v4];
}

+ (void)silentAuthenticationForPrimaryAccountWithClientAppName:(id)a3 clientAppBundleId:(id)a4 withCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(id)objc_opt_class() _contextForPrimaryAccountSilentAuth];
  [v11 _setProxiedAppName:v10];

  [v11 _setProxiedAppBundleID:v9];
  [a1 _authWithContext:v11 completion:v8];
}

+ (void)silentAuthenticationForContext:(id)a3 withCompletion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(id)objc_opt_class() _authContextForContext:v7];

  [v8 setAuthenticationType:1];
  [v8 setIsUsernameEditable:0];
  [a1 _authWithContext:v8 completion:v6];
}

+ (id)authController
{
  id v2 = objc_alloc_init(MEMORY[0x263F29118]);
  return v2;
}

+ (void)_authWithContext:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = objc_alloc_init(_TtC15CoreCDPInternal28CDPExponentialRetryScheduler);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke;
  v9[3] = &unk_26432F1E0;
  id v10 = v5;
  id v8 = v5;
  [(CDPExponentialRetryScheduler *)v7 retrySilentAuthWithAuthContext:v6 completionHandler:v9];
}

void __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = _CDPLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      id v9 = *(void (**)(void))(v8 + 16);
LABEL_8:
      v9();
    }
  }
  else
  {
    uint64_t v10 = *(void *)(a1 + 32);
    if (v10)
    {
      id v9 = *(void (**)(void))(v10 + 16);
      goto LABEL_8;
    }
  }
}

+ (id)_contextForPrimaryAccountSilentAuth
{
  id v2 = [a1 _contextForPrimaryAccount];
  [v2 setAuthenticationType:1];
  [v2 setIsUsernameEditable:0];
  return v2;
}

+ (id)_authContextForContext:(id)a3
{
  v3 = (objc_class *)MEMORY[0x263F29110];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  id v6 = [v4 dsid];
  id v7 = [v6 stringValue];
  [v5 setDSID:v7];

  uint64_t v8 = [v4 altDSID];
  [v5 setAltDSID:v8];

  id v9 = [v4 appleID];
  [v5 setUsername:v9];

  uint64_t v10 = [v4 password];

  [v5 _setPassword:v10];
  return v5;
}

+ (id)_contextForPrimaryAccount
{
  id v2 = [MEMORY[0x263F34328] sharedInstance];
  v3 = [v2 primaryAccountAltDSID];

  id v4 = [MEMORY[0x263F34328] sharedInstance];
  id v5 = [v4 primaryAccountUsername];

  id v6 = objc_alloc_init(MEMORY[0x263F29110]);
  [v6 setAltDSID:v3];
  [v6 setUsername:v5];

  return v6;
}

void __55__CDPAuthenticationHelper__authWithContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_218640000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch authentication results due to %@", (uint8_t *)&v2, 0xCu);
}

@end