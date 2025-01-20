@interface DMCEnrollmentAuthenticationController
- (void)authenticateWithAuthenticationResults:(id)a3 ephemeral:(BOOL)a4 requireAppleMAID:(BOOL)a5 presentingViewController:(id)a6 completionHandler:(id)a7;
- (void)authenticateWithUsername:(id)a3 password:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 presentingViewController:(id)a7 completionHandler:(id)a8;
- (void)fetchAuthenticationModeForUsername:(id)a3 requireAppleMAID:(BOOL)a4 completionHandler:(id)a5;
@end

@implementation DMCEnrollmentAuthenticationController

- (void)fetchAuthenticationModeForUsername:(id)a3 requireAppleMAID:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  v9 = [MEMORY[0x263F38B70] simluatedMDMAccountDrivenEnrollmentAuthenticationResults];

  if (v9)
  {
    dispatch_time_t v10 = dispatch_time(0, 500000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __111__DMCEnrollmentAuthenticationController_fetchAuthenticationModeForUsername_requireAppleMAID_completionHandler___block_invoke;
    block[3] = &unk_2645E9320;
    id v14 = v8;
    dispatch_after(v10, MEMORY[0x263EF83A0], block);
  }
  else
  {
    v11 = objc_opt_new();
    v12 = objc_opt_new();
    [v11 setUsername:v7];
    [v11 setIsEphemeral:1];
    if (v6 && ([MEMORY[0x263F38B70] allowAnyMAIDToSignIn] & 1) == 0) {
      [v11 setAppProvidedContext:*MEMORY[0x263F52868]];
    }
    [v12 fetchAuthModeWithContext:v11 completion:v8];
  }
}

uint64_t __111__DMCEnrollmentAuthenticationController_fetchAuthenticationModeForUsername_requireAppleMAID_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)authenticateWithUsername:(id)a3 password:(id)a4 ephemeral:(BOOL)a5 requireAppleMAID:(BOOL)a6 presentingViewController:(id)a7 completionHandler:(id)a8
{
  BOOL v9 = a6;
  BOOL v10 = a5;
  v29[1] = *MEMORY[0x263EF8340];
  id v13 = a8;
  id v14 = a7;
  id v15 = a4;
  id v16 = a3;
  v17 = objc_opt_new();
  [v17 setUsername:v16];

  [v17 _setPassword:v15];
  [v17 setPresentingViewController:v14];

  [v17 setIsEphemeral:v10];
  [v17 setIsUsernameEditable:0];
  v28 = @"shouldAllowManagedAppleIDOnly";
  v29[0] = MEMORY[0x263EFFA88];
  v18 = [NSDictionary dictionaryWithObjects:v29 forKeys:&v28 count:1];
  v19 = (void *)[v18 mutableCopy];

  if (v10)
  {
    uint64_t v20 = MEMORY[0x263EFFA88];
    [v19 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"upgradeTokenWithTrust"];
    [v19 setObject:v20 forKeyedSubscript:@"PreMDMEnrolledDevice"];
  }
  v21 = (void *)[v19 copy];
  [v17 setAppProvidedData:v21];

  [v17 setAuthenticationType:0];
  if (v9 && ([MEMORY[0x263F38B70] allowAnyMAIDToSignIn] & 1) == 0)
  {
    [v17 setAppProvidedContext:*MEMORY[0x263F52868]];
    uint64_t v27 = *MEMORY[0x263F52978];
    v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v27 count:1];
    [v17 setServiceIdentifiers:v22];
  }
  id v23 = objc_alloc_init(MEMORY[0x263F29118]);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __145__DMCEnrollmentAuthenticationController_authenticateWithUsername_password_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke;
  v25[3] = &unk_2645E9050;
  id v26 = v13;
  id v24 = v13;
  [v23 authenticateWithContext:v17 completion:v25];
}

void __145__DMCEnrollmentAuthenticationController_authenticateWithUsername_password_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_DEFAULT, "Authentication finished with results: %@, error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    id v8 = [v6 domain];
    if ([v8 isEqualToString:*MEMORY[0x263F28F30]])
    {
      uint64_t v9 = [v6 code];

      if (v9 == -7003)
      {
        BOOL v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
        v10();
        goto LABEL_10;
      }
    }
    else
    {
    }
    BOOL v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_10:
}

- (void)authenticateWithAuthenticationResults:(id)a3 ephemeral:(BOOL)a4 requireAppleMAID:(BOOL)a5 presentingViewController:(id)a6 completionHandler:(id)a7
{
  BOOL v9 = a5;
  BOOL v10 = a4;
  v28[1] = *MEMORY[0x263EF8340];
  id v11 = a3;
  id v12 = a7;
  id v13 = a6;
  id v14 = objc_opt_new();
  uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x263F29010]];
  [v14 setUsername:v15];

  id v16 = [v11 objectForKeyedSubscript:*MEMORY[0x263F28F58]];
  [v14 setAltDSID:v16];

  [v14 setPresentingViewController:v13];
  [v14 setIsEphemeral:v10];
  [v14 setAuthenticationType:1];
  [v14 setIsUsernameEditable:0];
  uint64_t v27 = @"shouldAllowManagedAppleIDOnly";
  v28[0] = MEMORY[0x263EFFA88];
  v17 = [NSDictionary dictionaryWithObjects:v28 forKeys:&v27 count:1];
  v18 = (void *)[v17 mutableCopy];

  if (v10)
  {
    uint64_t v19 = MEMORY[0x263EFFA88];
    [v18 setObject:MEMORY[0x263EFFA88] forKeyedSubscript:@"upgradeTokenWithTrust"];
    [v18 setObject:v19 forKeyedSubscript:@"PreMDMEnrolledDevice"];
  }
  uint64_t v20 = (void *)[v18 copy];
  [v14 setAppProvidedData:v20];

  v21 = [v11 objectForKeyedSubscript:*MEMORY[0x263F28FB8]];
  [v14 _setIdentityToken:v21];

  v22 = [v11 objectForKeyedSubscript:*MEMORY[0x263F28F68]];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    objc_msgSend(v14, "setIsMDMInformationRequired:", objc_msgSend(v22, "BOOLValue"));
  }
  if (v9 && ([MEMORY[0x263F38B70] allowAnyMAIDToSignIn] & 1) == 0) {
    [v14 setAppProvidedContext:*MEMORY[0x263F52868]];
  }
  id v23 = objc_alloc_init(MEMORY[0x263F29118]);
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __149__DMCEnrollmentAuthenticationController_authenticateWithAuthenticationResults_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke;
  v25[3] = &unk_2645E9050;
  id v26 = v12;
  id v24 = v12;
  [v23 authenticateWithContext:v14 completion:v25];
}

void __149__DMCEnrollmentAuthenticationController_authenticateWithAuthenticationResults_ephemeral_requireAppleMAID_presentingViewController_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 138412546;
    id v12 = v5;
    __int16 v13 = 2114;
    id v14 = v6;
    _os_log_impl(&dword_221CC5000, v7, OS_LOG_TYPE_DEFAULT, "Authentication finished with results: %@, error: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (*(void *)(a1 + 32))
  {
    id v8 = [v6 domain];
    if ([v8 isEqualToString:*MEMORY[0x263F28F30]])
    {
      uint64_t v9 = [v6 code];

      if (v9 == -7003)
      {
        BOOL v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_9:
        v10();
        goto LABEL_10;
      }
    }
    else
    {
    }
    BOOL v10 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_9;
  }
LABEL_10:
}

@end