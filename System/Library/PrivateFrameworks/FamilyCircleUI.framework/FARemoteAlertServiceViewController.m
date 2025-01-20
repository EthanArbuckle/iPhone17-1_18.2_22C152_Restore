@interface FARemoteAlertServiceViewController
- (FAFamilyPresenterHostProtocol)hostProxy;
- (id)_account;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)_dismissAndExit;
- (void)_handleSignedOutAcceptInvitation;
- (void)_invalidateLookupConnection;
- (void)_main_dismissAndExit;
- (void)_setupRemoteProxy;
- (void)_showFamilyFlow;
- (void)configureWithContext:(id)a3 completion:(id)a4;
- (void)dealloc;
- (void)handleButtonActions:(id)a3;
- (void)setHostProxy:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation FARemoteAlertServiceViewController

- (void)viewDidLoad
{
  v2 = (void *)MEMORY[0x263EFF960];
  v3 = [MEMORY[0x263EFF960] currentLocale];
  v4 = [v3 languageCode];
  uint64_t v5 = [v2 characterDirectionForLanguage:v4];

  if (v5 == 2)
  {
    id v6 = [MEMORY[0x263F82E00] appearance];
    [v6 setSemanticContentAttribute:4];
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)FARemoteAlertServiceViewController;
  [(FARemoteAlertServiceViewController *)&v7 viewWillAppear:a3];
  v4 = [(FARemoteAlertServiceViewController *)self view];
  uint64_t v5 = [v4 window];
  id v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];

  [(FARemoteAlertServiceViewController *)self setNeedsStatusBarAppearanceUpdate];
  [(FARemoteAlertServiceViewController *)self _setupRemoteProxy];
  [(FARemoteAlertServiceViewController *)self _showFamilyFlow];
}

- (void)_setupRemoteProxy
{
  id v2 = [(FARemoteAlertServiceViewController *)self _remoteViewControllerProxy];
  [v2 setShouldDisableFadeInAnimation:1];
  [v2 setAllowsMenuButtonDismissal:1];
  [v2 setAllowsSiri:0];
  [v2 setAllowsAlertStacking:1];
  [v2 setDesiredHardwareButtonEvents:16];
  [v2 setSwipeDismissalStyle:0];
  [v2 setDismissalAnimationStyle:1];
}

- (id)_account
{
  id v2 = [MEMORY[0x263EFB210] defaultStore];
  v3 = objc_msgSend(v2, "aa_primaryAppleAccount");

  return v3;
}

- (void)_handleSignedOutAcceptInvitation
{
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke;
  aBlock[3] = &unk_264349538;
  aBlock[4] = self;
  v20 = _Block_copy(aBlock);
  v3 = objc_msgSend(MEMORY[0x263F087E8], "fa_familyErrorWithCode:", -1004);
  v4 = (void *)MEMORY[0x263F82418];
  uint64_t v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_TITLE" value:&stru_26CA2C800 table:@"Localizable"];
  objc_super v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v8 = [v7 localizedStringForKey:@"FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_MESSAGE" value:&stru_26CA2C800 table:@"Localizable"];
  v9 = [v4 alertControllerWithTitle:v6 message:v8 preferredStyle:1];

  v10 = (void *)MEMORY[0x263F82400];
  v11 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v12 = [v11 localizedStringForKey:@"FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_NOT_NOW" value:&stru_26CA2C800 table:@"Localizable"];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_2;
  v24[3] = &unk_264349560;
  id v13 = v20;
  id v25 = v3;
  id v26 = v13;
  id v21 = v3;
  v14 = [v10 actionWithTitle:v12 style:1 handler:v24];

  [v9 addAction:v14];
  v15 = (void *)MEMORY[0x263F82400];
  v16 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v17 = [v16 localizedStringForKey:@"FAMILY_ACCEPT_INVITE_SIGNEDOUT_ALERT_SIGN_IN" value:&stru_26CA2C800 table:@"Localizable"];
  v22[0] = MEMORY[0x263EF8330];
  v22[1] = 3221225472;
  v22[2] = __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_3;
  v22[3] = &unk_264349588;
  id v23 = v13;
  id v18 = v13;
  v19 = [v15 actionWithTitle:v17 style:0 handler:v22];

  [v9 addAction:v19];
  [v9 setPreferredAction:v19];
  [(FARemoteAlertServiceViewController *)self presentViewController:v9 animated:1 completion:0];
}

void __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = (objc_class *)MEMORY[0x263F3BEF0];
  id v6 = a3;
  id v7 = (id)[[v5 alloc] initWithLoadSuccess:a2 error:v6 userInfo:0];

  [*(id *)(*(void *)(a1 + 32) + 1000) operationFinishedWithResponse:v7];
  [*(id *)(a1 + 32) _dismissAndExit];
}

uint64_t __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __70__FARemoteAlertServiceViewController__handleSignedOutAcceptInvitation__block_invoke_3(uint64_t a1)
{
  id v5 = 0;
  id v2 = [MEMORY[0x263F3C010] urlDestinationTo:0 error:&v5];
  id v3 = v5;
  v4 = [MEMORY[0x263F01880] defaultWorkspace];
  [v4 openSensitiveURL:v2 withOptions:0];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_showFamilyFlow
{
  id v3 = [(FARemoteAlertServiceViewController *)self _account];
  if (v3)
  {

LABEL_7:
    id v6 = [[FACircleStateController alloc] initWithPresenter:self];
    circleContext = self->_circleContext;
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __53__FARemoteAlertServiceViewController__showFamilyFlow__block_invoke;
    v9[3] = &unk_2643495B0;
    v9[4] = self;
    v10 = v6;
    v8 = v6;
    [(FACircleStateController *)v8 _performOperationWithContext:circleContext viewController:self completion:v9];

    return;
  }
  v4 = [(FACircleContext *)self->_circleContext eventType];
  int v5 = [v4 isEqualToString:@"FACircleEventTypeAcceptInvitation"];

  if (!v5) {
    goto LABEL_7;
  }
  [(FARemoteAlertServiceViewController *)self _handleSignedOutAcceptInvitation];
}

uint64_t __53__FARemoteAlertServiceViewController__showFamilyFlow__block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(*(void *)(a1 + 32) + 1000) operationFinishedWithResponse:a2];
  id v3 = *(void **)(a1 + 32);
  return [v3 _dismissAndExit];
}

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  v8 = _FALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_2189F0000, v8, OS_LOG_TYPE_DEFAULT, "Configuring remote view service", (uint8_t *)buf, 2u);
  }

  v9 = [v6 userInfo];
  v10 = [v9 objectForKeyedSubscript:@"FARemoteAlertServiceUserInfoContextData"];

  if (v10)
  {
    v11 = +[FACircleContext contextWithData:v10];
    circleContext = self->_circleContext;
    self->_circleContext = v11;
  }
  else
  {
    circleContext = self->_circleContext;
    self->_circleContext = 0;
  }

  id v13 = objc_opt_new();
  v14 = [v6 xpcEndpoint];
  [v13 _setEndpoint:v14];

  v15 = (void *)[objc_alloc(MEMORY[0x263F08D68]) initWithListenerEndpoint:v13];
  v16 = [MEMORY[0x263F3BF38] XPCInterface];
  [v15 setRemoteObjectInterface:v16];

  [v15 resume];
  objc_storeStrong((id *)&self->_lookupConnection, v15);
  objc_initWeak(buf, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke;
  v19[3] = &unk_2643495D8;
  objc_copyWeak(&v20, buf);
  v17 = [v15 remoteObjectProxyWithErrorHandler:v19];
  hostProxy = self->_hostProxy;
  self->_hostProxy = v17;

  if (v7) {
    v7[2](v7);
  }
  objc_destroyWeak(&v20);
  objc_destroyWeak(buf);
}

void __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = _FALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke_cold_1((uint64_t)v3, v4);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAndExit];
}

- (int64_t)preferredStatusBarStyle
{
  return 0;
}

- (void)dealloc
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v6 = self;
    _os_log_impl(&dword_2189F0000, v3, OS_LOG_TYPE_DEFAULT, "%@ deallocated", buf, 0xCu);
  }

  [(FARemoteAlertServiceViewController *)self _invalidateLookupConnection];
  v4.receiver = self;
  v4.super_class = (Class)FARemoteAlertServiceViewController;
  [(SBUIRemoteAlertServiceViewController *)&v4 dealloc];
}

- (unint64_t)supportedInterfaceOrientations
{
  id v2 = [MEMORY[0x263F82670] currentDevice];
  uint64_t v3 = [v2 userInterfaceIdiom];

  if (v3 == 1) {
    return 30;
  }
  else {
    return 2;
  }
}

- (void)_dismissAndExit
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__FARemoteAlertServiceViewController__dismissAndExit__block_invoke;
  block[3] = &unk_2643489F8;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __53__FARemoteAlertServiceViewController__dismissAndExit__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_main_dismissAndExit");
}

- (void)_main_dismissAndExit
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(FARemoteAlertServiceViewController *)self dismissViewControllerAnimated:0 completion:0];
  id v3 = [(FARemoteAlertServiceViewController *)self _remoteViewControllerProxy];
  [v3 invalidate];
}

- (void)_invalidateLookupConnection
{
  [(NSXPCConnection *)self->_lookupConnection invalidate];
  lookupConnection = self->_lookupConnection;
  self->_lookupConnection = 0;
}

- (void)handleButtonActions:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v4);
        }
        if (([*(id *)(*((void *)&v9 + 1) + 8 * v8) events] & 0x10) != 0) {
          [(FARemoteAlertServiceViewController *)self _dismissAndExit];
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (FAFamilyPresenterHostProtocol)hostProxy
{
  return self->_hostProxy;
}

- (void)setHostProxy:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostProxy, 0);
  objc_storeStrong((id *)&self->_lookupConnection, 0);
  objc_storeStrong((id *)&self->_circleContext, 0);
}

void __70__FARemoteAlertServiceViewController_configureWithContext_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2189F0000, a2, OS_LOG_TYPE_ERROR, "listener lookup connection error: %@", (uint8_t *)&v2, 0xCu);
}

@end