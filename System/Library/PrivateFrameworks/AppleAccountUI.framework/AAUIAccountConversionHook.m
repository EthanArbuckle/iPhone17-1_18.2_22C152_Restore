@interface AAUIAccountConversionHook
- (BOOL)shouldMatchElement:(id)a3;
- (BOOL)shouldMatchModel:(id)a3;
- (RUIServerHookDelegate)delegate;
- (void)_navigateBackToStartWithCompletion:(id)a3;
- (void)_signOutAccountsWithAccount:(id)a3 shouldRemoveAppleAccount:(BOOL)a4 viewController:(id)a5 completion:(id)a6;
- (void)_signOutWithAttributes:(id)a3 completion:(id)a4;
- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6;
- (void)processObjectModel:(id)a3 completion:(id)a4;
- (void)setDelegate:(id)a3;
- (void)signOutPrimaryAccountWithShouldRetainTrust:(BOOL)a3 viewController:(id)a4 completion:(id)a5;
@end

@implementation AAUIAccountConversionHook

- (BOOL)shouldMatchElement:(id)a3
{
  id v3 = a3;
  if (+[AAUIFeatureFlags isConvertToMAIDEnabled])
  {
    v4 = [v3 name];
    if ([v4 isEqualToString:@"account:signout"])
    {
      char v5 = 1;
    }
    else
    {
      v6 = [v3 name];
      char v5 = [v6 isEqualToString:@"account:navigateToSignIn"];
    }
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (BOOL)shouldMatchModel:(id)a3
{
  id v3 = a3;
  if (+[AAUIFeatureFlags isConvertToMAIDEnabled])
  {
    objc_opt_class();
    v4 = [v3 clientInfo];
    id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F63818]];
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }

    if ([v6 isEqualToString:@"account:signout"]) {
      char v7 = 1;
    }
    else {
      char v7 = [v6 isEqualToString:@"account:navigateToSignIn"];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (void)processElement:(id)a3 attributes:(id)a4 objectModel:(id)a5 completion:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a6;
  v11 = [v15 name];
  int v12 = [v11 isEqualToString:@"account:signout"];

  if (v12)
  {
    [(AAUIAccountConversionHook *)self _signOutWithAttributes:v9 completion:v10];
  }
  else
  {
    v13 = [v15 name];
    int v14 = [v13 isEqualToString:@"account:navigateToSignIn"];

    if (v14) {
      [(AAUIAccountConversionHook *)self _navigateBackToStartWithCompletion:v10];
    }
  }
}

- (void)processObjectModel:(id)a3 completion:(id)a4
{
  id v11 = a3;
  id v6 = a4;
  objc_opt_class();
  char v7 = [v11 clientInfo];
  id v8 = [v7 objectForKeyedSubscript:*MEMORY[0x263F63818]];
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }

  if ([v9 isEqualToString:@"account:signout"])
  {
    id v10 = [v11 clientInfo];
    [(AAUIAccountConversionHook *)self _signOutWithAttributes:v10 completion:v6];
  }
  else if ([v9 isEqualToString:@"account:navigateToSignIn"])
  {
    [(AAUIAccountConversionHook *)self _navigateBackToStartWithCompletion:v6];
  }
}

- (void)_signOutWithAttributes:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_opt_class();
  id v8 = [v7 objectForKeyedSubscript:@"retainTrust"];

  id v9 = v8;
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  uint64_t v11 = [v10 BOOLValue];
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  int v12 = [WeakRetained presentationContextForHook:self];
  [(AAUIAccountConversionHook *)self signOutPrimaryAccountWithShouldRetainTrust:v11 viewController:v12 completion:v6];
}

- (void)signOutPrimaryAccountWithShouldRetainTrust:(BOOL)a3 viewController:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[AAUIAccountConversionHook signOutPrimaryAccountWithShouldRetainTrust:viewController:completion:](v10);
  }

  uint64_t v11 = [MEMORY[0x263EFB210] defaultStore];
  int v12 = objc_msgSend(v11, "aa_primaryAppleAccount");

  if (v12)
  {
    v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = @"YES";
      if (v6) {
        int v14 = @"NO";
      }
      int v16 = 138412290;
      v17 = v14;
      _os_log_impl(&dword_209754000, v13, OS_LOG_TYPE_DEFAULT, "Account Conversion - Initating sign out with intent to remove the AppleAccount : %@", (uint8_t *)&v16, 0xCu);
    }

    [(AAUIAccountConversionHook *)self _signOutAccountsWithAccount:v12 shouldRemoveAppleAccount:!v6 viewController:v8 completion:v9];
  }
  else
  {
    id v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Account Conversion - The account has already been removed. Move straight to conversion.", (uint8_t *)&v16, 2u);
    }

    v9[2](v9, 1, 0);
  }
}

- (void)_signOutAccountsWithAccount:(id)a3 shouldRemoveAppleAccount:(BOOL)a4 viewController:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  v33[1] = *MEMORY[0x263EF8340];
  id v24 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = objc_alloc_init(MEMORY[0x263F26D78]);
  [v12 setViewController:v10];
  v13 = [[AAUIAccountConversionSignOutFlowControllerDelegate alloc] initWithPresentingViewController:v10 shouldRemoveAppleAccount:v8];
  uint64_t v32 = *MEMORY[0x263F26D28];
  uint64_t v14 = v32;
  v33[0] = v13;
  id v15 = [NSDictionary dictionaryWithObjects:v33 forKeys:&v32 count:1];
  [v12 setSignOutContexts:v15];

  int v16 = [MEMORY[0x263EFB210] defaultStore];
  v17 = (AIDAServiceOwnerProtocol *)[objc_alloc(MEMORY[0x263F26D88]) initWithAccountStore:v16];
  serviceOwnersManager = self->_serviceOwnersManager;
  self->_serviceOwnersManager = v17;

  objc_initWeak(&location, self);
  v19 = self->_serviceOwnersManager;
  v20 = (void *)[v12 copy];
  v25[0] = MEMORY[0x263EF8330];
  v25[1] = 3221225472;
  v25[2] = __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke;
  v25[3] = &unk_263F93740;
  objc_copyWeak(&v29, &location);
  id v21 = v11;
  id v28 = v21;
  BOOL v30 = v8;
  id v22 = v12;
  id v26 = v22;
  id v23 = v24;
  id v27 = v23;
  [(AIDAServiceOwnerProtocol *)v19 signOutService:v14 withContext:v20 completion:v25];

  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  id v7 = _AAUILogSystem();
  BOOL v8 = v7;
  if (WeakRetained)
  {
    if (a2)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        if (*(unsigned char *)(a1 + 64)) {
          id v9 = @"YES";
        }
        else {
          id v9 = @"NO";
        }
        *(_DWORD *)buf = 138412290;
        v34 = v9;
        _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Account Conversion - Sign Out of iCloud service returned successfully with shouldRemoveAppleAccount: %@", buf, 0xCu);
      }

      id v10 = (void *)WeakRetained[1];
      id v11 = (void *)[*(id *)(a1 + 32) copy];
      v28[0] = MEMORY[0x263EF8330];
      v28[1] = 3221225472;
      v28[2] = __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_59;
      v28[3] = &unk_263F93718;
      objc_copyWeak(&v32, (id *)(a1 + 56));
      uint64_t v12 = *MEMORY[0x263F26D48];
      id v31 = *(id *)(a1 + 48);
      id v29 = *(id *)(a1 + 40);
      id v30 = *(id *)(a1 + 32);
      [v10 signOutService:v12 withContext:v11 completion:v28];

      objc_destroyWeak(&v32);
    }
    else
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
        __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_2((uint64_t)v5, v8, v22, v23, v24, v25, v26, v27);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_1(v8, v13, v14, v15, v16, v17, v18, v19);
    }

    uint64_t v20 = *(void *)(a1 + 48);
    id v21 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUIConversionToMAIDErrorDomain" code:-12001 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v20 + 16))(v20, 0, v21);
  }
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_59(id *a1, int a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  id v7 = _AAUILogSystem();
  BOOL v8 = v7;
  if (WeakRetained)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = @"NO";
      if (a2) {
        id v9 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v29 = v9;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Account Conversion - Store sign out completed with success %@, error: %@", buf, 0x16u);
    }

    id v10 = objc_alloc_init(AAUISignOutUtilities);
    uint64_t v11 = WeakRetained[1];
    uint64_t v12 = objc_msgSend(a1[4], "aa_altDSID");
    uint64_t v13 = objc_msgSend(a1[4], "aa_personID");
    uint64_t v14 = (void *)[a1[5] copy];
    v25[0] = MEMORY[0x263EF8330];
    v25[1] = 3221225472;
    v25[2] = __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_61;
    v25[3] = &unk_263F936F0;
    id v15 = a1[6];
    uint64_t v26 = v10;
    id v27 = v15;
    uint64_t v16 = v10;
    [(AAUISignOutUtilities *)v16 signOutServiceAccountsWithServiceOwnersManager:v11 forAltDSID:v12 DSID:v13 context:v14 completion:v25];
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_1(v8, v17, v18, v19, v20, v21, v22, v23);
    }

    uint64_t v24 = (void (**)(id, void, AAUISignOutUtilities *))a1[6];
    uint64_t v16 = [MEMORY[0x263F087E8] errorWithDomain:@"AAUIConversionToMAIDErrorDomain" code:-12001 userInfo:0];
    v24[2](v24, 0, v16);
  }
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_61(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  BOOL v6 = _AAUILogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = @"NO";
    if (a2) {
      id v7 = @"YES";
    }
    int v8 = 138412546;
    id v9 = v7;
    __int16 v10 = 2112;
    id v11 = v5;
    _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Account Conversion - Service accounts sign out completed with success %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)_navigateBackToStartWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke;
  v6[3] = &unk_263F92048;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
  id v3 = [WeakRetained presentationContextForHook:*(void *)(a1 + 32)];
  id v4 = [v3 navigationController];
  id v5 = (id)[v4 popViewControllerAnimated:1];

  BOOL v6 = dispatch_get_global_queue(25, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke_2;
  block[3] = &unk_263F920E8;
  id v8 = *(id *)(a1 + 40);
  dispatch_async(v6, block);
}

uint64_t __64__AAUIAccountConversionHook__navigateBackToStartWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (RUIServerHookDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);
  return (RUIServerHookDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
}

- (void)signOutPrimaryAccountWithShouldRetainTrust:(os_log_t)log viewController:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Account Conversion - Hook called to sign out the primary account if there is one signed in.", v1, 2u);
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __108__AAUIAccountConversionHook__signOutAccountsWithAccount_shouldRemoveAppleAccount_viewController_completion___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end