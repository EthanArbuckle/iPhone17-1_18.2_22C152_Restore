@interface AAUIGenericTermsRemoteUI
- (AAUIGenericTermsRemoteUI)initWithAccount:(id)a3 inStore:(id)a4;
- (AAUIGenericTermsRemoteUI)initWithAccount:(id)a3 inStore:(id)a4 termsEntries:(id)a5;
- (AAUIGenericTermsRemoteUIDelegate)delegate;
- (AAUIServerHookHandlerDelegate)hookHandlerDelegate;
- (ACAccount)account;
- (ACAccountStore)accountStore;
- (BOOL)_isUnauthorizedError:(id)a3;
- (NSDictionary)additionalHeaders;
- (RUIServerHookHandler)serverHookHandler;
- (RemoteUIController)remoteUIController;
- (UIViewController)originatingViewController;
- (id)_authContextForRenewCredentials;
- (id)_sessionConfiguration;
- (id)_viewControllerForAlertPresentation;
- (void)_addHeadersToRequest:(id)a3;
- (void)_agreeToTermsWithURLString:(id)a3 serverInfo:(id)a4 preferPassword:(BOOL)a5 completion:(id)a6;
- (void)_cleanUpAndDismissWithSuccess:(BOOL)a3 agreeURL:(id)a4 serverInfo:(id)a5;
- (void)_cleanupRUILoader;
- (void)_disagreeToTermsWithURLString:(id)a3 serverInfo:(id)a4;
- (void)_displayConnectionErrorAndDismiss;
- (void)_loadRequestPreferringPassword:(BOOL)a3;
- (void)_renewCredentialsWithCompletion:(id)a3;
- (void)_reportTermsUserAction:(id)a3 agreeUrl:(id)a4;
- (void)_sendAcceptedTermsInfo:(id)a3;
- (void)_setupActionForButtons;
- (void)presentFromViewController:(id)a3 modal:(BOOL)a4;
- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)setAccount:(id)a3;
- (void)setAccountStore:(id)a3;
- (void)setAdditionalHeaders:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHookHandlerDelegate:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)setServerHookHandler:(id)a3;
@end

@implementation AAUIGenericTermsRemoteUI

- (AAUIGenericTermsRemoteUI)initWithAccount:(id)a3 inStore:(id)a4
{
  v31[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  v25.receiver = self;
  v25.super_class = (Class)AAUIGenericTermsRemoteUI;
  v9 = [(AAUIGenericTermsRemoteUI *)&v25 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_account, a3);
    objc_storeStrong((id *)&v10->_accountStore, a4);
    v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x263F637E8]);
    remoteUIController = v10->_remoteUIController;
    v10->_remoteUIController = v11;

    [(RemoteUIController *)v10->_remoteUIController setDelegate:v10];
    v13 = [(AAUIGenericTermsRemoteUI *)v10 _sessionConfiguration];
    [(RemoteUIController *)v10->_remoteUIController setSessionConfiguration:v13];

    id v14 = objc_alloc(MEMORY[0x263F637C0]);
    v15 = v10->_remoteUIController;
    uint64_t v27 = 0;
    v28 = &v27;
    uint64_t v29 = 0x2050000000;
    v16 = (void *)getFALaunchScreenTimeSetupHookClass_softClass_0;
    uint64_t v30 = getFALaunchScreenTimeSetupHookClass_softClass_0;
    if (!getFALaunchScreenTimeSetupHookClass_softClass_0)
    {
      v26[0] = MEMORY[0x263EF8330];
      v26[1] = 3221225472;
      v26[2] = __getFALaunchScreenTimeSetupHookClass_block_invoke_0;
      v26[3] = &unk_263F92608;
      v26[4] = &v27;
      __getFALaunchScreenTimeSetupHookClass_block_invoke_0((uint64_t)v26);
      v16 = (void *)v28[3];
    }
    v17 = v16;
    _Block_object_dispose(&v27, 8);
    id v18 = objc_alloc_init(v17);
    v31[0] = v18;
    v19 = [MEMORY[0x263EFF8C0] arrayWithObjects:v31 count:1];
    uint64_t v20 = [v14 initWithRemoteUIController:v15 hooks:v19];
    serverHookHandler = v10->_serverHookHandler;
    v10->_serverHookHandler = (RUIServerHookHandler *)v20;

    v22 = objc_alloc_init(AAUIServerHookHandlerDelegate);
    hookHandlerDelegate = v10->_hookHandlerDelegate;
    v10->_hookHandlerDelegate = v22;

    [(RUIServerHookHandler *)v10->_serverHookHandler setDelegate:v10->_hookHandlerDelegate];
    [(AAUIGenericTermsRemoteUI *)v10 _setupActionForButtons];
  }

  return v10;
}

- (AAUIGenericTermsRemoteUI)initWithAccount:(id)a3 inStore:(id)a4 termsEntries:(id)a5
{
  id v9 = a5;
  v10 = [(AAUIGenericTermsRemoteUI *)self initWithAccount:a3 inStore:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_termsEntries, a5);
  }

  return v11;
}

- (void)presentFromViewController:(id)a3 modal:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v6 = a3;
  objc_storeWeak((id *)&self->_originatingViewController, v6);
  id v7 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  [v7 setHostViewController:v6];

  id v8 = [v6 navigationController];
  objc_storeWeak((id *)&self->_parentNavController, v8);

  self->_isModal = v4;
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if (v4) {
      v10 = @"YES";
    }
    else {
      v10 = @"NO";
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parentNavController);
    v12 = [WeakRetained viewControllers];
    int v13 = 138412802;
    id v14 = v10;
    __int16 v15 = 2112;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v12;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Terms: Attempting to show terms UI modally: %@ on parent: %@ with children: %@", (uint8_t *)&v13, 0x20u);
  }
  [(AAUIGenericTermsRemoteUI *)self _loadRequestPreferringPassword:1];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [MEMORY[0x263F63770] signalWithType:*a5];
    int v13 = 138412290;
    id v14 = v9;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Terms: Got object model with signal: %@", (uint8_t *)&v13, 0xCu);
  }
  if (*a5 == 1)
  {
    [(AAUIGenericTermsRemoteUI *)self _cleanUpAndDismissWithSuccess:0 agreeURL:0 serverInfo:0];
    v10 = [v7 clientInfo];
    v11 = _AAUILogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[AAUIGenericTermsRemoteUI remoteUIController:didReceiveObjectModel:actionSignal:]();
    }

    v12 = [v10 objectForKeyedSubscript:@"agreeUrl"];
    [(AAUIGenericTermsRemoteUI *)self _reportTermsUserAction:@"Dismiss" agreeUrl:v12];
  }
}

- (void)remoteUIController:(id)a3 didPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a4;
  id v8 = [(AAUIGenericTermsRemoteUI *)self serverHookHandler];
  [v8 processObjectModel:v7 isModal:v5];
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v8 = (void (**)(id, uint64_t, void))a6;
  [(AAUIGenericTermsRemoteUI *)self _addHeadersToRequest:a4];
  v8[2](v8, 1, 0);
}

- (BOOL)_isUnauthorizedError:(id)a3
{
  id v3 = a3;
  if ([v3 code] == -1012)
  {
    BOOL v4 = [v3 domain];
    char v5 = [v4 isEqualToString:*MEMORY[0x263F08570]];

    if (v5) {
      goto LABEL_5;
    }
  }
  id v6 = [v3 domain];
  if ([v6 isEqualToString:*MEMORY[0x263F63820]])
  {
    id v7 = [v3 userInfo];
    id v8 = [v7 objectForKeyedSubscript:@"statusCode"];
    uint64_t v9 = [v8 integerValue];

    if (v9 == 401)
    {
LABEL_5:
      BOOL v10 = 1;
      goto LABEL_11;
    }
  }
  else
  {
  }
  v11 = [v3 domain];
  if ([v11 isEqualToString:*MEMORY[0x263F63830]])
  {
    v12 = [v3 userInfo];
    int v13 = [v12 objectForKeyedSubscript:@"statusCode"];
    BOOL v10 = [v13 integerValue] == 401;
  }
  else
  {
    BOOL v10 = 0;
  }

LABEL_11:
  return v10;
}

- (void)_setupActionForButtons
{
  objc_initWeak(&location, self);
  id v3 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke;
  v10[3] = &unk_263F93848;
  objc_copyWeak(&v11, &location);
  v10[4] = self;
  [v3 setHandlerForButtonName:@"agree" handler:v10];

  BOOL v4 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_90;
  v8[3] = &unk_263F93870;
  objc_copyWeak(&v9, &location);
  [v4 setHandlerForButtonName:@"defer" handler:v8];

  char v5 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_94;
  v6[3] = &unk_263F93870;
  objc_copyWeak(&v7, &location);
  [v5 setHandlerForButtonName:@"disagree" handler:v6];

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    char v5 = [v3 clientInfo];
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_2();
    }

    id v7 = [v5 objectForKey:@"agreeUrl"];
    id v8 = [v5 objectForKey:@"agreeDialogTitle"];
    id v9 = [v5 objectForKey:@"agreeDialogText"];
    BOOL v10 = [v5 objectForKey:@"agreeDialogOK"];
    id v11 = [v5 objectForKey:@"agreeDialogCancel"];
    uint64_t v12 = [v5 objectForKey:@"SLAVersion"];
    uint64_t v13 = *(void *)(a1 + 32);
    id v14 = *(void **)(v13 + 56);
    *(void *)(v13 + 56) = v12;

    uint64_t v15 = [v3 serverInfo];
    id v16 = [v15 objectForKeyedSubscript:@"serverInfoKey"];

    if (v9 && v10 && v11)
    {
      v36 = v10;
      __int16 v17 = _AAUILogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v17, OS_LOG_TYPE_DEFAULT, "Attempting to show alert view", buf, 2u);
      }

      id v18 = (void *)MEMORY[0x263F82418];
      v37[0] = MEMORY[0x263EF8330];
      v37[1] = 3221225472;
      v37[2] = __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_84;
      v37[3] = &unk_263F93820;
      id v19 = WeakRetained;
      id v38 = v19;
      id v39 = v7;
      v40 = v16;
      v35 = v9;
      uint64_t v20 = [v18 alertWithTitle:v8 message:v9 cancelButtonTitle:v11 defaultButtonTitle:v36 actionHandler:v37];
      v21 = _AAUILogSystem();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        [v19 remoteUIController];
        v22 = v34 = v7;
        [v22 currentPresentationContext];
        v23 = v33 = v8;
        *(_DWORD *)buf = 138412290;
        v42 = v23;
        _os_log_impl(&dword_209754000, v21, OS_LOG_TYPE_DEFAULT, "Attempting to present terms and conditions alert on current presentation context %@", buf, 0xCu);

        id v8 = v33;
        id v7 = v34;
      }

      v24 = [v19 remoteUIController];
      objc_super v25 = [v24 currentPresentationContext];
      [v25 presentViewController:v20 animated:1 completion:0];

      id v9 = v35;
      BOOL v10 = v36;
    }
    else
    {
      [WeakRetained _cleanUpAndDismissWithSuccess:1 agreeURL:v7 serverInfo:v16];
    }
  }
  else
  {
    char v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(v5, v26, v27, v28, v29, v30, v31, v32);
    }
  }
}

uint64_t __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_84(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) _cleanUpAndDismissWithSuccess:1 agreeURL:*(void *)(result + 40) serverInfo:*(void *)(result + 48)];
  }
  return result;
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_90(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v5 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained _cleanUpAndDismissWithSuccess:1 agreeURL:0 serverInfo:0];
    id v6 = [v3 clientInfo];
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_90_cold_2();
    }

    id v8 = [v6 objectForKeyedSubscript:@"agreeUrl"];
    [v5 _reportTermsUserAction:@"Not Now" agreeUrl:v8];
  }
  else
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(v6, v9, v10, v11, v12, v13, v14, v15);
    }
  }
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    char v5 = [v3 clientInfo];
    id v6 = [v5 objectForKeyedSubscript:@"disagreeUrl"];
    id v7 = [v3 serverInfo];
    id v8 = [v7 objectForKeyedSubscript:@"serverInfoKey"];

    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_94_cold_2();
    }

    [WeakRetained _disagreeToTermsWithURLString:v6 serverInfo:v8];
    [WeakRetained _cleanUpAndDismissWithSuccess:0 agreeURL:0 serverInfo:0];
    uint64_t v10 = [v5 objectForKeyedSubscript:@"agreeUrl"];
    [WeakRetained _reportTermsUserAction:@"Decline" agreeUrl:v10];
  }
  else
  {
    char v5 = _AAUILogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(v5, v11, v12, v13, v14, v15, v16, v17);
    }
  }
}

- (void)_loadRequestPreferringPassword:(BOOL)a3
{
  self->_isPreferringPassword = a3;
  termsEntries = self->_termsEntries;
  if (termsEntries)
  {
    char v5 = termsEntries;
  }
  else
  {
    objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", *MEMORY[0x263F25738], 0);
    char v5 = (NSSet *)objc_claimAutoreleasedReturnValue();
  }
  id v6 = v5;
  id v7 = (void *)[objc_alloc(MEMORY[0x263F25870]) initWithAccount:self->_account termsEntries:v5];
  [v7 setPreferPassword:self->_isPreferringPassword];
  id v8 = [(AAUIGenericTermsRemoteUI *)self additionalHeaders];
  [v7 setAdditionalHeaders:v8];

  if (objc_opt_respondsToSelector())
  {
    uint64_t v9 = [(ACAccount *)self->_account _aa_termsServerInfo];
    [v7 setServerInfo:v9];

    [(ACAccount *)self->_account _aa_setTermsServerInfo:0];
  }
  uint64_t v10 = [v7 urlRequest];
  uint64_t v11 = (void *)[v10 mutableCopy];

  [(AAUIGenericTermsRemoteUI *)self _addHeadersToRequest:v11];
  uint64_t v12 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke;
  v13[3] = &unk_263F929D0;
  v13[4] = self;
  [v12 loadRequest:v11 completion:v13];
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if (v5 || (a2 & 1) == 0)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_3();
    }

    if ([*(id *)(a1 + 32) _isUnauthorizedError:v5]
      && (uint64_t v7 = *(void *)(a1 + 32), *(unsigned char *)(v7 + 49)))
    {
      if (*(unsigned char *)(v7 + 50))
      {
        id v8 = _AAUILogSystem();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
          __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_2();
        }

        [*(id *)(a1 + 32) _loadRequestPreferringPassword:0];
      }
      else
      {
        *(unsigned char *)(v7 + 50) = 1;
        uint64_t v10 = _AAUILogSystem();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_1();
        }

        uint64_t v11 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x263EF8330];
        v14[1] = 3221225472;
        v14[2] = __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_99;
        v14[3] = &unk_263F92968;
        v14[4] = v11;
        [v11 _renewCredentialsWithCompletion:v14];
      }
    }
    else
    {
      uint64_t v9 = _AAUILogSystem();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Presenting failure alert to user", buf, 2u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_100;
      block[3] = &unk_263F92168;
      block[4] = *(void *)(a1 + 32);
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
}

uint64_t __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_99(uint64_t a1, uint64_t a2)
{
  BOOL v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_ERROR);
  if (a2)
  {
    if (v5) {
      __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_99_cold_1();
    }
  }
  else if (v5)
  {
    __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_99_cold_2();
  }

  return [*(id *)(a1 + 32) _loadRequestPreferringPassword:a2];
}

uint64_t __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_100(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayConnectionErrorAndDismiss];
}

- (id)_viewControllerForAlertPresentation
{
  id v3 = [(AAUIGenericTermsRemoteUI *)self delegate];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BOOL v4 = [(AAUIGenericTermsRemoteUI *)self delegate];
    int v5 = [v4 parentViewControllerPresentsErrorAlert];

    if (v5)
    {
      id v6 = _AAUILogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Sign in controller supports displaying it's own error", buf, 2u);
      }
      uint64_t v7 = 0;
      goto LABEL_10;
    }
  }
  else
  {
  }
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v10 = 0;
    _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Presenting alert on remoteUIController currentPresentationContext", v10, 2u);
  }

  id v6 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  uint64_t v7 = [v6 currentPresentationContext];
LABEL_10:

  return v7;
}

- (void)_agreeToTermsWithURLString:(id)a3 serverInfo:(id)a4 preferPassword:(BOOL)a5 completion:(id)a6
{
  BOOL v6 = a5;
  id v10 = a6;
  uint64_t v11 = (objc_class *)MEMORY[0x263F259E8];
  id v12 = a4;
  id v13 = a3;
  uint64_t v14 = (void *)[[v11 alloc] initWithURLString:v13 account:self->_account];

  uint64_t v15 = [(AAUIGenericTermsRemoteUI *)self additionalHeaders];
  [v14 setAdditionalHeaders:v15];

  [v14 setPreferPassword:v6];
  [v14 setServerInfo:v12];

  if (self->_slaVersion)
  {
    uint64_t v16 = _AAUILogSystem();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[AAUIGenericTermsRemoteUI _agreeToTermsWithURLString:serverInfo:preferPassword:completion:]();
    }

    [v14 setSlaVersion:self->_slaVersion];
  }
  v18[0] = MEMORY[0x263EF8330];
  v18[1] = 3221225472;
  v18[2] = __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke;
  v18[3] = &unk_263F93898;
  v18[4] = self;
  id v19 = v10;
  id v17 = v10;
  [v14 performRequestWithHandler:v18];
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3();
  }

  if ((unint64_t)([v6 statusCode] - 200) > 0x63)
  {
    uint64_t v16 = _AAUILogSystem();
    BOOL v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
    if (v7)
    {
      if (v17) {
        __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2();
      }
    }
    else if (v17)
    {
      __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v18 = 0;
      _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Successfully agreed to iCloud terms!", v18, 2u);
    }

    id v10 = *(void **)(a1 + 32);
    id v11 = v6;
    id v12 = [v11 acceptedTermsInfo];
    [v10 _sendAcceptedTermsInfo:v12];

    uint64_t v13 = *(void *)(a1 + 40);
    uint64_t v14 = [v11 responseDictionary];
    uint64_t v15 = [v14 objectForKeyedSubscript:@"serverInfo"];
    (*(void (**)(uint64_t, uint64_t, void *))(v13 + 16))(v13, 1, v15);
  }
}

- (void)_disagreeToTermsWithURLString:(id)a3 serverInfo:(id)a4
{
  id v6 = (objc_class *)MEMORY[0x263F259F0];
  id v7 = a4;
  id v8 = a3;
  id v10 = (id)[[v6 alloc] initWithURLString:v8 account:self->_account];

  uint64_t v9 = [(AAUIGenericTermsRemoteUI *)self additionalHeaders];
  [v10 setAdditionalHeaders:v9];

  [v10 setServerInfo:v7];
  [v10 performRequestWithHandler:&__block_literal_global_15];
}

void __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    id v7 = _AAUILogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_2();
    }
  }
  else
  {
    uint64_t v8 = [v5 statusCode];
    uint64_t v9 = _AAUILogSystem();
    id v7 = v9;
    if (v8 == 200)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Marked terms as disagreed in iCloud", v10, 2u);
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_1(v5, v7);
    }
  }
}

- (void)_sendAcceptedTermsInfo:(id)a3
{
  id v7 = a3;
  if ([v7 count])
  {
    BOOL v4 = [(AAUIGenericTermsRemoteUI *)self delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      id v6 = [(AAUIGenericTermsRemoteUI *)self delegate];
      [v6 genericTermsRemoteUI:self acceptedTermsInfo:v7];
    }
  }
}

- (void)_cleanUpAndDismissWithSuccess:(BOOL)a3 agreeURL:(id)a4 serverInfo:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  id v11 = [v10 currentPresentationContext];

  [(AAUIGenericTermsRemoteUI *)self _cleanupRUILoader];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke;
  aBlock[3] = &unk_263F93930;
  aBlock[4] = self;
  id v12 = v11;
  id v21 = v12;
  uint64_t v13 = _Block_copy(aBlock);
  uint64_t v14 = (void (**)(void, void, void))v13;
  if (v8 && v6)
  {
    uint64_t v15 = _AAUILogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v15, OS_LOG_TYPE_DEFAULT, "Marking account as agreed to terms...", buf, 2u);
    }

    [(ACAccount *)self->_account aa_setNeedsToVerifyTerms:0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_117;
    v16[3] = &unk_263F93958;
    id v18 = v14;
    v16[4] = self;
    id v17 = v8;
    [(AAUIGenericTermsRemoteUI *)self _agreeToTermsWithURLString:v17 serverInfo:v9 preferPassword:1 completion:v16];
  }
  else if (v6)
  {
    (*((void (**)(void *, uint64_t, void))v13 + 2))(v13, 1, 0);
  }
  else
  {
    [(ACAccount *)self->_account aa_setNeedsToVerifyTerms:1];
    v14[2](v14, 0, 0);
  }
}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_2;
  v8[3] = &unk_263F93418;
  BOOL v6 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  char v11 = a2;
  id v9 = v6;
  id v10 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_3;
  aBlock[3] = &unk_263F938E0;
  aBlock[4] = *(void *)(a1 + 32);
  v2 = _Block_copy(aBlock);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v4 = _AAUILogSystem();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (isKindOfClass)
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v6;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Dismissing presented RUINavigationController %@...", buf, 0xCu);
    }

    id v7 = *(void **)(a1 + 40);
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_116;
    v9[3] = &unk_263F93908;
    id v11 = v2;
    char v12 = *(unsigned char *)(a1 + 56);
    id v10 = *(id *)(a1 + 48);
    [v7 dismissViewControllerAnimated:1 completion:v9];
  }
  else
  {
    if (v5)
    {
      uint64_t v8 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v8;
      _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Terms error alert is not being presented %@. Skipping dismiss", buf, 0xCu);
    }

    (*((void (**)(void *, void, void))v2 + 2))(v2, *(unsigned __int8 *)(a1 + 56), *(void *)(a1 + 48));
  }
}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  id v10 = a3;
  BOOL v5 = [*(id *)(a1 + 32) delegate];
  char v6 = objc_opt_respondsToSelector();

  id v7 = [*(id *)(a1 + 32) delegate];
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  if (v6) {
    [v7 genericTermsRemoteUI:v9 didFinishWithSuccess:a2 serverInfo:v10];
  }
  else {
    [v7 genericTermsRemoteUI:v9 didFinishWithSuccess:a2];
  }
}

uint64_t __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_116(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed presented RUINavigationController", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_117(uint64_t a1, int a2, void *a3)
{
  if (a2)
  {
    uint64_t v4 = *(void *)(a1 + 48);
    BOOL v5 = *(void (**)(uint64_t, uint64_t, id))(v4 + 16);
    id v6 = a3;
    v5(v4, 1, v6);
  }
  else
  {
    id v7 = a3;
    uint64_t v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Failed to agree using PET, attempting with token...", buf, 2u);
    }

    uint64_t v9 = *(void **)(a1 + 32);
    uint64_t v10 = *(void *)(a1 + 40);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_118;
    v11[3] = &unk_263F92E68;
    id v12 = *(id *)(a1 + 48);
    [v9 _agreeToTermsWithURLString:v10 serverInfo:v7 preferPassword:0 completion:v11];

    id v6 = v12;
  }
}

uint64_t __78__AAUIGenericTermsRemoteUI__cleanUpAndDismissWithSuccess_agreeURL_serverInfo___block_invoke_118(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_cleanupRUILoader
{
  [(RemoteUIController *)self->_remoteUIController setDelegate:0];
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = 0;
}

- (id)_sessionConfiguration
{
  v2 = [MEMORY[0x263F08C00] defaultSessionConfiguration];
  id v3 = objc_alloc_init(MEMORY[0x263F29120]);
  objc_msgSend(v2, "set_appleIDContext:", v3);

  return v2;
}

- (void)_displayConnectionErrorAndDismiss
{
  id v3 = [(AAUIGenericTermsRemoteUI *)self remoteUIController];
  uint64_t v4 = [v3 currentPresentationContext];

  if (v4)
  {
    BOOL v5 = (void *)MEMORY[0x263F82418];
    id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v7 = [v6 localizedStringForKey:@"SERVER_UNREACHABLE_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
    uint64_t v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    uint64_t v9 = [v8 localizedStringForKey:@"OK" value:&stru_26BD39CD8 table:@"Localizable"];
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __61__AAUIGenericTermsRemoteUI__displayConnectionErrorAndDismiss__block_invoke;
    v11[3] = &unk_263F92168;
    void v11[4] = self;
    uint64_t v10 = [v5 alertWithTitle:v7 message:0 buttonTitle:v9 actionHandler:v11];

    [v4 presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    [(AAUIGenericTermsRemoteUI *)self _cleanUpAndDismissWithSuccess:0 agreeURL:0 serverInfo:0];
  }
}

uint64_t __61__AAUIGenericTermsRemoteUI__displayConnectionErrorAndDismiss__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _cleanUpAndDismissWithSuccess:0 agreeURL:0 serverInfo:0];
}

- (void)_addHeadersToRequest:(id)a3
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_msgSend(v4, "aa_addClientInfoHeaders");
  objc_msgSend(v4, "aa_addAuthTokenOrBasicAuthHeaderWithAccount:preferUsingPassword:", self->_account, self->_isPreferringPassword);
  BOOL v5 = [(AAUIGenericTermsRemoteUI *)self additionalHeaders];

  if (v5)
  {
    id v6 = [(AAUIGenericTermsRemoteUI *)self additionalHeaders];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __49__AAUIGenericTermsRemoteUI__addHeadersToRequest___block_invoke;
    v9[3] = &unk_263F93980;
    id v10 = v4;
    [v6 enumerateKeysAndObjectsUsingBlock:v9];
  }
  id v7 = _AAUILogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = [v4 allHTTPHeaderFields];
    *(_DWORD *)buf = 138412290;
    id v12 = v8;
    _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "Terms Secondary Request Headers: %@", buf, 0xCu);
  }
}

uint64_t __49__AAUIGenericTermsRemoteUI__addHeadersToRequest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) setValue:a3 forHTTPHeaderField:a2];
}

- (void)_renewCredentialsWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL v5 = v4;
  if (self->_account)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F29118]);
    id v7 = [(AAUIGenericTermsRemoteUI *)self _authContextForRenewCredentials];
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __60__AAUIGenericTermsRemoteUI__renewCredentialsWithCompletion___block_invoke;
    v8[3] = &unk_263F939A8;
    void v8[4] = self;
    id v9 = v5;
    [v6 authenticateWithContext:v7 completion:v8];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

void __60__AAUIGenericTermsRemoteUI__renewCredentialsWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v4 = [a2 objectForKeyedSubscript:*MEMORY[0x263F28FF0]];
    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "aa_setPassword:", v4);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    id v3 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v3();
  }
}

- (id)_authContextForRenewCredentials
{
  id v3 = objc_alloc_init(MEMORY[0x263F292A8]);
  id v4 = [(ACAccount *)self->_account username];
  [v3 setUsername:v4];

  [v3 setIsUsernameEditable:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatingViewController);
  [v3 setPresentingViewController:WeakRetained];

  [v3 setShouldOfferSecurityUpgrade:0];
  [v3 setServiceType:1];
  [v3 setAuthenticationType:0];
  id v6 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v7 = [v6 localizedStringForKey:@"PASSWORD_REQUIRED_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
  [v3 setTitle:v7];

  uint64_t v8 = NSString;
  id v9 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v10 = [v9 localizedStringForKey:@"RENEW_FOR_TERMS_AND_CONDITIONS_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  id v11 = [(ACAccount *)self->_account username];
  id v12 = objc_msgSend(v8, "stringWithFormat:", v10, v11);
  [v3 setReason:v12];

  return v3;
}

- (void)_reportTermsUserAction:(id)a3 agreeUrl:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x263EFF9A0]);
  uint64_t v12 = *MEMORY[0x263F25A28];
  v13[0] = v6;
  id v9 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  id v10 = (void *)[v8 initWithDictionary:v9];

  if (v7) {
    [v10 setObject:v7 forKeyedSubscript:@"agreeUrl"];
  }
  id v11 = (void *)[objc_alloc(MEMORY[0x263F259A0]) initWithAccount:self->_account parameters:v10];
  [v11 reportEvent];
}

- (AAUIGenericTermsRemoteUIDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (AAUIGenericTermsRemoteUIDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (UIViewController)originatingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_originatingViewController);
  return (UIViewController *)WeakRetained;
}

- (ACAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (ACAccountStore)accountStore
{
  return self->_accountStore;
}

- (void)setAccountStore:(id)a3
{
}

- (NSDictionary)additionalHeaders
{
  return self->_additionalHeaders;
}

- (void)setAdditionalHeaders:(id)a3
{
}

- (AAUIServerHookHandlerDelegate)hookHandlerDelegate
{
  return self->_hookHandlerDelegate;
}

- (void)setHookHandlerDelegate:(id)a3
{
}

- (RemoteUIController)remoteUIController
{
  return self->_remoteUIController;
}

- (void)setRemoteUIController:(id)a3
{
}

- (RUIServerHookHandler)serverHookHandler
{
  return self->_serverHookHandler;
}

- (void)setServerHookHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serverHookHandler, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_hookHandlerDelegate, 0);
  objc_storeStrong((id *)&self->_additionalHeaders, 0);
  objc_destroyWeak((id *)&self->_originatingViewController);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_slaVersion, 0);
  objc_storeStrong((id *)&self->_termsEntries, 0);
  objc_storeStrong((id *)&self->_accountStore, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_genericTermsUIViewController, 0);
  objc_destroyWeak((id *)&self->_parentNavController);
}

- (void)remoteUIController:didReceiveObjectModel:actionSignal:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "Terms dismiss handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "Terms agree handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_90_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "Terms defer handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
}

void __50__AAUIGenericTermsRemoteUI__setupActionForButtons__block_invoke_94_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_209754000, v0, v1, "Terms disagree handler, clientInfo dictionary %{private}@", v2, v3, v4, v5, v6);
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Is unauthorized error, will attempt renewCredentials", v2, v3, v4, v5, v6);
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Attempt with renewed credentials failed, reattempting request using token", v2, v3, v4, v5, v6);
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_cold_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 1024;
  int v4 = v0;
  _os_log_error_impl(&dword_209754000, v1, OS_LOG_TYPE_ERROR, "RUILoader didFailWithError: %@, success = %i", v2, 0x12u);
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_99_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Renew succeeded, reattempting request using PET", v2, v3, v4, v5, v6);
}

void __59__AAUIGenericTermsRemoteUI__loadRequestPreferringPassword___block_invoke_99_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Renew failed, reattempting request using token", v2, v3, v4, v5, v6);
}

- (void)_agreeToTermsWithURLString:serverInfo:preferPassword:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_debug_impl(&dword_209754000, v0, OS_LOG_TYPE_DEBUG, "Adding SLAVersion to the request.", v1, 2u);
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Error agreeing to iCloud terms!", v2, v3, v4, v5, v6);
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Error agreeing to iCloud terms: %@", v2, v3, v4, v5, v6);
}

void __92__AAUIGenericTermsRemoteUI__agreeToTermsWithURLString_serverInfo_preferPassword_completion___block_invoke_cold_3()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_debug_impl(&dword_209754000, v1, OS_LOG_TYPE_DEBUG, "AAiCloudTermsAgreeRequest response: %@. Error: %@", v2, 0x16u);
}

void __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  [a1 statusCode];
  OUTLINED_FUNCTION_3();
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "Failed to mark terms as disagreed in iCloud with HTTP status %ld", v3, 0xCu);
}

void __69__AAUIGenericTermsRemoteUI__disagreeToTermsWithURLString_serverInfo___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to mark terms as disagreed in iCloud with error %@", v2, v3, v4, v5, v6);
}

@end