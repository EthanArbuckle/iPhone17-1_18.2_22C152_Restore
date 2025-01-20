@interface AAUISettingsHelper
+ (void)repairPrimaryAppleAccountInViewController:(id)a3 completion:(id)a4;
+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4;
+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4 highlightRowIdentifier:(id)a5;
@end

@implementation AAUISettingsHelper

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    *(_DWORD *)buf = 138412290;
    v18 = v10;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v6);
  objc_initWeak(&location, v7);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke;
  v12[3] = &unk_263F94320;
  objc_copyWeak(&v14, (id *)buf);
  objc_copyWeak(v15, &location);
  id v11 = v7;
  id v13 = v11;
  v15[1] = a1;
  [a1 repairPrimaryAppleAccountInViewController:v6 completion:v12];

  objc_destroyWeak(v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __75__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 40));
  objc_copyWeak(&v20, (id *)(a1 + 48));
  id v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&v20);
    if (!v7) {
      a2 = 0;
    }

    if (a2)
    {
      v8 = MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      dispatch_assert_queue_V2(v8);

      if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled])
      {
        v10 = _AAUILogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_1(v10);
        }

        id v11 = +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:*(void *)(a1 + 32)];
        v12 = +[AAUIRecoveryContactsViewFactory createWithViewModel:v11];
        id v13 = objc_loadWeakRetained(&to);
        [v13 showViewController:v12 sender:*(void *)(a1 + 56)];
      }
      else
      {
        id v14 = [AAUIAccountRecoveryViewController alloc];
        id v15 = objc_loadWeakRetained(&v20);
        id v11 = [(AAUIAccountRecoveryViewController *)v14 initWithAccountManager:v15];

        id v13 = objc_loadWeakRetained(&to);
        [v13 showViewController:v11 sender:v13];
        v12 = v13;
      }
    }
  }
  v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_loadWeakRetained(&to);
    v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412546;
    v23 = v19;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&to);
}

+ (void)showAccountRecoveryFromViewController:(id)a3 accountManager:(id)a4 highlightRowIdentifier:(id)a5
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = _AAUILogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (objc_class *)objc_opt_class();
    id v13 = NSStringFromClass(v12);
    *(_DWORD *)buf = 138412290;
    v23 = v13;
    _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "%@: Starting Account recovery flow.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, v8);
  objc_initWeak(&location, v9);
  v16[0] = MEMORY[0x263EF8330];
  v16[1] = 3221225472;
  v16[2] = __98__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke;
  v16[3] = &unk_263F94348;
  objc_copyWeak(&v19, (id *)buf);
  objc_copyWeak(v20, &location);
  id v14 = v9;
  id v17 = v14;
  v20[1] = a1;
  id v15 = v10;
  id v18 = v15;
  [a1 repairPrimaryAppleAccountInViewController:v8 completion:v16];

  objc_destroyWeak(v20);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)buf);
}

void __98__AAUISettingsHelper_showAccountRecoveryFromViewController_accountManager_highlightRowIdentifier___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_copyWeak(&to, (id *)(a1 + 48));
  objc_copyWeak(&v20, (id *)(a1 + 56));
  id v6 = objc_loadWeakRetained(&to);
  if (v6)
  {
    id v7 = objc_loadWeakRetained(&v20);
    if (!v7) {
      a2 = 0;
    }

    if (a2)
    {
      id v8 = MEMORY[0x263EF83A0];
      id v9 = MEMORY[0x263EF83A0];
      dispatch_assert_queue_V2(v8);

      if (+[AAUIFeatureFlags isSignInSecurityRedesignEnabled])
      {
        id v10 = _AAUILogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __99__AAUIAccountRecoveryManagementHook__showAccountRecoveryManagementWithServerAttributes_completion___block_invoke_cold_1(v10);
        }

        id v11 = +[AAUIRecoveryContactsViewFactory createViewModelWithAccountManager:*(void *)(a1 + 32)];
        v12 = +[AAUIRecoveryContactsViewFactory createWithViewModel:v11];
        id v13 = objc_loadWeakRetained(&to);
        [v13 showViewController:v12 sender:*(void *)(a1 + 64)];
      }
      else
      {
        id v14 = [AAUIAccountRecoveryViewController alloc];
        id v15 = objc_loadWeakRetained(&v20);
        id v11 = [(AAUIAccountRecoveryViewController *)v14 initWithAccountManager:v15 highlightRowIdentifier:*(void *)(a1 + 40)];

        id v13 = objc_loadWeakRetained(&to);
        [v13 showViewController:v11 sender:v13];
        v12 = v13;
      }
    }
  }
  v16 = _AAUILogSystem();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = objc_loadWeakRetained(&to);
    id v18 = (objc_class *)objc_opt_class();
    id v19 = NSStringFromClass(v18);
    *(_DWORD *)buf = 138412546;
    v23 = v19;
    __int16 v24 = 2112;
    id v25 = v5;
    _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "%@: Account recovery flow completed with error: %@", buf, 0x16u);
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(&to);
}

+ (void)repairPrimaryAppleAccountInViewController:(id)a3 completion:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [[AAUID2DEncryptionFlowContext alloc] initWithType:2];
  id v7 = [[AAUIManateeStateValidator alloc] initWithFlowContext:v8 withPresentingViewController:v6];

  [(AAUIManateeStateValidator *)v7 repairIfPrimaryAppleAccountIsCDP:v5];
}

@end