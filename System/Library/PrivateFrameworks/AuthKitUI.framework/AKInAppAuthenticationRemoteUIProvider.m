@interface AKInAppAuthenticationRemoteUIProvider
- (AKAppleIDAuthenticationInAppContext)context;
- (AKInAppAuthenticationRemoteUIDelegate)remoteUIControllerDelegate;
- (AKInAppAuthenticationRemoteUIProvider)initWithContext:(id)a3;
- (AKProximityAuthViewController)proximityAuthViewController;
- (BOOL)_shouldShowAsView;
- (BOOL)_shouldUsePasswordDelegate;
- (RemoteUIController)remoteUIController;
- (RemoteUIControllerPreferences)ruiPreferences;
- (id)_actionsForLoginWithCompletion:(id)a3;
- (id)_navController;
- (id)_secondFactorActionsForAlert:(id)a3 completion:(id)a4;
- (id)presentationAnchorForWebAuthenticationSession:(id)a3;
- (void)_clearRemoteUIController;
- (void)_configureProximityAuthLoginOptionsWithCompletion:(id)a3;
- (void)_contextDidDismissLoginAlertController;
- (void)_contextDidPresentLoginController;
- (void)_contextWillDismissLoginAlertController;
- (void)_disableIdleTimerIfNeeded;
- (void)_enableIdleTimerIfNeeded;
- (void)_showMaxAttemptAlertWithCompletion:(id)a3;
- (void)_showPasswordFieldWithCompletion:(id)a3;
- (void)_startAnimating;
- (void)_updateReason;
- (void)activateProximitySession:(id)a3 completion:(id)a4;
- (void)cleanUpBasicLoginWithCompletion:(id)a3;
- (void)completeProximityAuth;
- (void)dealloc;
- (void)dismissBasicLoginUIWithCompletion:(id)a3;
- (void)dismissKeepUsingUIWithCompletion:(id)a3;
- (void)dismissNativeRecoveryUIWithCompletion:(id)a3;
- (void)dismissProximityPairingUIWithCompletion:(id)a3;
- (void)dismissSecondFactorUIWithCompletion:(id)a3;
- (void)dismissServerProvidedUIWithCompletion:(id)a3;
- (void)presentBasicLoginUIAsAlertWithCompletion:(id)a3;
- (void)presentBasicLoginUIAsViewWithCompletion:(id)a3;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4;
- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5;
- (void)presentIDPProvidedUIWithConfiguration:(id)a3 completion:(id)a4;
- (void)presentKeepUsingUIForAppleID:(id)a3 completion:(id)a4;
- (void)presentLoginAlertUIAsViewWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7;
- (void)presentNativeRecoveryUIWithContext:(id)a3 completion:(id)a4;
- (void)presentProximityBroadcastUIWithCompletion:(id)a3;
- (void)presentProximityPairingUIWithVerificationCode:(id)a3 completion:(id)a4;
- (void)presentProximityPinCodeUIWithCompletion:(id)a3;
- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentSecondFactorUIWithCompletion:(id)a3;
- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4;
- (void)proximitySetupCompletedWithResult:(id)a3;
- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4;
- (void)remoteUIController;
- (void)setContext:(id)a3;
- (void)setProximityAuthViewController:(id)a3;
- (void)setRemoteUIController:(id)a3;
- (void)setRuiPreferences:(id)a3;
- (void)setupPasscodeAndBiometricWithCompletion:(id)a3;
- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4;
- (void)showProximityErrorWithCompletion:(id)a3;
@end

@implementation AKInAppAuthenticationRemoteUIProvider

- (AKInAppAuthenticationRemoteUIProvider)initWithContext:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AKInAppAuthenticationRemoteUIProvider;
  v5 = [(AKInAppAuthenticationRemoteUIProvider *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_context, v4);
    v7 = [[AKInAppAuthenticationRemoteUIDelegate alloc] initWithContext:v4];
    remoteUIControllerDelegate = v6->_remoteUIControllerDelegate;
    v6->_remoteUIControllerDelegate = v7;
  }
  return v6;
}

- (void)dealloc
{
  if (self->_remoteUIController) {
    [(AKInAppAuthenticationRemoteUIProvider *)self _clearRemoteUIController];
  }
  v3.receiver = self;
  v3.super_class = (Class)AKInAppAuthenticationRemoteUIProvider;
  [(AKInAppAuthenticationRemoteUIProvider *)&v3 dealloc];
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  if ([(AKInAppAuthenticationRemoteUIProvider *)self _shouldShowAsView]) {
    [(AKInAppAuthenticationRemoteUIProvider *)self presentBasicLoginUIAsViewWithCompletion:v4];
  }
  else {
    [(AKInAppAuthenticationRemoteUIProvider *)self presentBasicLoginUIAsAlertWithCompletion:v4];
  }
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (objc_msgSend(v10, "ak_isAuthenticationErrorWithCode:", -7012)
    && [(AKInAppAuthenticationRemoteUIProvider *)self _shouldUsePasswordDelegate])
  {
    v14 = _AKLogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v14, OS_LOG_TYPE_DEFAULT, "Username is present but password is missing and required. Client should provide us with password.", buf, 2u);
    }

    v15 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
    v16 = [v15 username];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke;
    block[3] = &unk_1E648FA30;
    block[4] = self;
    id v19 = v16;
    id v20 = v13;
    id v17 = v16;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else if ([(AKInAppAuthenticationRemoteUIProvider *)self _shouldShowAsView])
  {
    [(AKInAppAuthenticationRemoteUIProvider *)self presentLoginAlertUIAsViewWithError:v10 title:v11 message:v12 waitForInteraction:0 completion:v13];
  }
  else
  {
    [(AKInAppAuthenticationRemoteUIProvider *)self presentLoginAlertWithError:v10 title:v11 message:v12 waitForInteraction:0 completion:v13];
  }
}

void __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke(id *a1)
{
  int v2 = [a1[4] _shouldShowAsView];
  objc_super v3 = [a1[4] _actionsForLoginWithCompletion:a1[6]];
  uint64_t v4 = 8;
  if (v2) {
    uint64_t v4 = 16;
  }
  [*(id *)((char *)a1[4] + v4) setLoginActions:v3];

  v5 = [a1[4] context];
  v6 = [v5 _passwordDelegate];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke_2;
  v7[3] = &unk_1E648FA08;
  id v9 = a1[6];
  id v8 = a1[5];
  [v6 context:v5 needsPasswordWithCompletion:v7];
}

uint64_t __93__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_completion___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, 0, a3);
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke_2;
  v2[3] = &unk_1E648FA58;
  v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 cleanUpBasicLoginWithCompletion:v2];
}

uint64_t __75__AKInAppAuthenticationRemoteUIProvider_dismissBasicLoginUIWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentProximityBroadcastUIWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  id v5 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  v6 = [v5 presentingViewController];
  WeakRetained = (AKProximityAuthViewController *)objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  if (WeakRetained)
  {
    id v8 = WeakRetained;
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKInAppAuthenticationRemoteUIProvider presentProximityBroadcastUIWithCompletion:]();
    }

    if (v4)
    {
      id v10 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13003 userInfo:0];
      v4[2](v4, 0, v10);
    }
  }
  else
  {
    [(AKInAppAuthenticationRemoteUIProvider *)self _disableIdleTimerIfNeeded];
    id v11 = _AKLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "Creating new proximity pairing view.", buf, 2u);
    }

    id v12 = [[AKProximityMessageViewModel alloc] initWithType:0];
    id v8 = [[AKProximityAuthViewController alloc] initWithViewModel:v12];
    objc_storeWeak((id *)&self->_proximityAuthViewController, v8);

    [(AKInAppAuthenticationRemoteUIProvider *)self _configureProximityAuthLoginOptionsWithCompletion:v4];
    id v13 = _AKLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1C38C1000, v13, OS_LOG_TYPE_DEFAULT, "Presenting Proximity Pairing View", v17, 2u);
    }

    v14 = objc_msgSend(v6, "ak_topPresentedViewController");

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 pushViewController:v8 animated:1];
    }
    else
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v8];
      v16 = objc_msgSend(v14, "ak_topPresentedViewController");
      [v16 presentViewController:v15 animated:1 completion:0];
    }
    v6 = v14;
  }
}

- (void)presentProximityPairingUIWithVerificationCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v17 = 0;
    _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Updating Proximity view to show visual pairing.", v17, 2u);
  }

  id v9 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  id v10 = [v9 presentingViewController];
  id v11 = [[AKProximityMessageViewModel alloc] initWithType:1];
  WeakRetained = (AKProximityAuthViewController *)objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  id v13 = WeakRetained;
  if (!WeakRetained)
  {
    id v13 = [[AKProximityAuthViewController alloc] initWithViewModel:v11];
    objc_storeWeak((id *)&self->_proximityAuthViewController, v13);
  }
  [(AKProximityAuthViewController *)v13 setVerificationCode:v6];
  [(AKInAppAuthenticationRemoteUIProvider *)self _configureProximityAuthLoginOptionsWithCompletion:v7];

  if (WeakRetained)
  {
    [(AKProximityAuthViewController *)v13 updateViewWithViewModel:v11];
    v14 = v10;
  }
  else
  {
    v14 = objc_msgSend(v10, "ak_topPresentedViewController");

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 pushViewController:v13 animated:1];
    }
    else
    {
      v15 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v13];
      v16 = objc_msgSend(v14, "ak_topPresentedViewController");
      [v16 presentViewController:v15 animated:1 completion:0];
    }
  }
}

- (void)presentProximityPinCodeUIWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11[0] = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Updating Proximity view to show PIN code.", (uint8_t *)v11, 2u);
  }

  id v6 = [[AKProximityMessageViewModel alloc] initWithType:2];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained updateViewWithViewModel:v6];
    if (v4) {
      v4[2](v4, 1, 0);
    }
  }
  else
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AKInAppAuthenticationRemoteUIProvider presentProximityPinCodeUIWithCompletion:]();
    }

    if (v4)
    {
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7013);
      ((void (**)(id, uint64_t, void *))v4)[2](v4, 0, v10);
    }
  }
}

- (void)activateProximitySession:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Activating Proximity message session...", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  id v10 = WeakRetained;
  if (WeakRetained)
  {
    id v11 = [WeakRetained navigationController];
    id v12 = [[AKProximityMessageViewModel alloc] initWithType:3];
    [v10 updateViewWithViewModel:v12];
  }
  else
  {
    _AKLogSystem();
    id v12 = (AKProximityMessageViewModel *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v12->super, OS_LOG_TYPE_ERROR)) {
      -[AKInAppAuthenticationRemoteUIProvider activateProximitySession:completion:]();
    }
    id v11 = 0;
  }

  [(AKInAppAuthenticationRemoteUIProvider *)self _configureProximityAuthLoginOptionsWithCompletion:v6];
  id v13 = (void *)MEMORY[0x1C8777520](v6);

  id proxAuthCompletion = self->_proxAuthCompletion;
  self->_id proxAuthCompletion = v13;

  PASUIDependentViewPresenterClass = (objc_class *)ProximityAppleIDSetupUILibraryCore();
  if (PASUIDependentViewPresenterClass) {
    PASUIDependentViewPresenterClass = (objc_class *)getPASUIDependentViewPresenterClass();
  }
  v16 = (PASUIDependentViewPresenter *)objc_alloc_init(PASUIDependentViewPresenterClass);
  pasViewPresenter = self->_pasViewPresenter;
  self->_pasViewPresenter = v16;

  [(PASUIDependentViewPresenter *)self->_pasViewPresenter setDelegate:self];
  char v18 = objc_opt_respondsToSelector();
  id v19 = _AKLogSystem();
  id v20 = v19;
  if (v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[AKInAppAuthenticationRemoteUIProvider activateProximitySession:completion:]((uint64_t *)&self->_pasViewPresenter, v20);
    }

    [(PASUIDependentViewPresenter *)self->_pasViewPresenter setShouldSignInForSelf:1];
  }
  else
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      -[AKInAppAuthenticationRemoteUIProvider activateProximitySession:completion:]((uint64_t *)&self->_pasViewPresenter, v20);
    }
  }
  v21 = self->_pasViewPresenter;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke;
  v23[3] = &unk_1E648F2C8;
  v23[4] = self;
  id v24 = v11;
  id v22 = v11;
  [(PASUIDependentViewPresenter *)v21 activateWithTemplateMessageSession:v7 completionHandler:v23];
}

void __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke_2;
  v2[3] = &unk_1E648F2C8;
  v1 = *(void **)(a1 + 40);
  void v2[4] = *(void *)(a1 + 32);
  id v3 = v1;
  dispatch_async(MEMORY[0x1E4F14428], v2);
}

uint64_t __77__AKInAppAuthenticationRemoteUIProvider_activateProximitySession_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 40) startFlowWithNavigationController:*(void *)(a1 + 40)];
}

- (void)_configureProximityAuthLoginOptionsWithCompletion:(id)a3
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  id v6 = [WeakRetained presentingViewController];

  id v7 = objc_msgSend(v6, "ak_topPresentedViewController");

  objc_opt_class();
  BOOL v8 = (objc_opt_isKindOfClass() & 1) == 0;
  objc_initWeak(&location, self);
  id v9 = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  id v10 = (void *)MEMORY[0x1C8777520](v4);
  id proxAuthCompletion = self->_proxAuthCompletion;
  self->_id proxAuthCompletion = v10;

  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke;
  v21[3] = &unk_1E648F448;
  objc_copyWeak(&v22, &location);
  BOOL v23 = v8;
  [v9 setPrimaryButtonAction:v21];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3;
  v18[3] = &unk_1E648F448;
  objc_copyWeak(&v19, &location);
  BOOL v20 = v8;
  [v9 setAlternateButtonAction:v18];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3_51;
  v16[3] = &unk_1E648F498;
  objc_copyWeak(&v17, &location);
  [v9 setAlternateButtonAction:v16];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_53;
  v14[3] = &unk_1E648F498;
  objc_copyWeak(&v15, &location);
  [v9 setCancelAction:v14];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_55;
  v12[3] = &unk_1E648F498;
  objc_copyWeak(&v13, &location);
  [v9 setDeallocAction:v12];
  objc_destroyWeak(&v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);

  objc_destroyWeak(&location);
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke(uint64_t a1)
{
  int v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User choose primary fallback to proximity auth.", buf, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 13);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13008 userInfo:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_47;
    v14[3] = &unk_1E648F398;
    void v14[4] = v4;
    id v7 = (void (**)(void, void, void))MEMORY[0x1C8777520](v14);
    BOOL v8 = v7;
    if (*(unsigned char *)(a1 + 40))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2;
      v11[3] = &unk_1E648FA80;
      id v13 = v7;
      id v12 = v6;
      [v5 dismissViewControllerAnimated:1 completion:v11];
    }
    else
    {
      id v9 = [v5 navigationController];
      id v10 = (id)[v9 popViewControllerAnimated:1];

      ((void (**)(void, void, void *))v8)[2](v8, 0, v6);
    }
  }
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_47(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[6];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[6]);
    int v2 = *(void **)(a1 + 32);
  }

  return [v2 completeProximityAuth];
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3(uint64_t a1)
{
  int v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User choose primary fallback to proximity auth.", buf, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 13);
    id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13009 userInfo:0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_49;
    v14[3] = &unk_1E648F398;
    void v14[4] = v4;
    id v7 = (void (**)(void, void, void))MEMORY[0x1C8777520](v14);
    BOOL v8 = v7;
    if (*(unsigned char *)(a1 + 40))
    {
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_50;
      v11[3] = &unk_1E648FA80;
      id v13 = v7;
      id v12 = v6;
      [v5 dismissViewControllerAnimated:1 completion:v11];
    }
    else
    {
      id v9 = [v5 navigationController];
      id v10 = (id)[v9 popViewControllerAnimated:1];

      ((void (**)(void, void, void *))v8)[2](v8, 0, v6);
    }
  }
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_49(uint64_t a1)
{
  int v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[6];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[6]);
    int v2 = *(void **)(a1 + 32);
  }

  return [v2 completeProximityAuth];
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_50(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_3_51(uint64_t a1)
{
  int v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User choose secondary fallback to proximity auth.", buf, 2u);
  }

  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = WeakRetained;
  if (WeakRetained)
  {
    id v5 = objc_loadWeakRetained(WeakRetained + 13);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_52;
    v6[3] = &unk_1E648EF28;
    v6[4] = v4;
    [v5 dismissViewControllerAnimated:1 completion:v6];
    [v4 completeProximityAuth];
  }
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_52(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 48);
  if (v1)
  {
    id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13009 userInfo:0];
    (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
  }
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_53(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User canceled proximity auth.", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_54;
  v4[3] = &unk_1E648F398;
  v4[4] = WeakRetained;
  [WeakRetained dismissProximityPairingUIWithCompletion:v4];
}

uint64_t __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_54(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = v2[6];
  if (v3)
  {
    (*(void (**)(void))(v3 + 16))(v2[6]);
    id v2 = *(void **)(a1 + 32);
  }

  return [v2 completeProximityAuth];
}

void __91__AKInAppAuthenticationRemoteUIProvider__configureProximityAuthLoginOptionsWithCompletion___block_invoke_2_55(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = WeakRetained;
  if (WeakRetained && WeakRetained[6])
  {
    uint64_t v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Calling end proximity auth on view dealloc", v6, 2u);
    }

    id v4 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13006 userInfo:0];
    uint64_t v5 = v2[6];
    if (v5) {
      (*(void (**)(uint64_t, void, void *))(v5 + 16))(v5, 0, v4);
    }
    [v2 completeProximityAuth];
  }
}

- (void)completeProximityAuth
{
  objc_storeWeak((id *)&self->_proximityAuthViewController, 0);
  navController = self->_navController;
  self->_navController = 0;

  id proxAuthCompletion = self->_proxAuthCompletion;
  self->_id proxAuthCompletion = 0;

  proxAuthResults = self->_proxAuthResults;
  self->_proxAuthResults = 0;

  pasViewPresenter = self->_pasViewPresenter;
  self->_pasViewPresenter = 0;

  proxSetupError = self->_proxSetupError;
  self->_proxSetupError = 0;

  [(AKInAppAuthenticationRemoteUIProvider *)self _enableIdleTimerIfNeeded];
}

- (void)_enableIdleTimerIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Skipping enabling idle timer...", v2, v3, v4, v5, v6);
}

- (void)_disableIdleTimerIfNeeded
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Disabling idle timer...", v2, v3, v4, v5, v6);
}

- (void)dismissProximityPairingUIWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Dismissing Proximity Pairing UI...", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke;
  block[3] = &unk_1E648F510;
  id v10 = WeakRetained;
  id v11 = self;
  id v12 = v4;
  id v7 = v4;
  id v8 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke_2;
    v7[3] = &unk_1E648F2A0;
    uint64_t v3 = (void *)a1[6];
    void v7[4] = a1[5];
    id v8 = v3;
    [v2 dismissViewControllerAnimated:1 completion:v7];
  }
  else
  {
    id v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint8_t v6 = 0;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Proximity Pairing UI is not shown, nothing to clean up", v6, 2u);
    }

    uint64_t v5 = a1[6];
    if (v5) {
      (*(void (**)(uint64_t, void, void))(v5 + 16))(v5, 0, 0);
    }
  }
}

uint64_t __81__AKInAppAuthenticationRemoteUIProvider_dismissProximityPairingUIWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13004 userInfo:0];
  uint64_t v3 = *(void **)(*(void *)(a1 + 32) + 64);
  if (v3)
  {
    id v6 = (id)v2;
    v3;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    uint64_t v4 = (*(uint64_t (**)(uint64_t, void))(v4 + 16))(v4, 0);
  }

  return MEMORY[0x1F4181820](v4);
}

- (void)showProximityErrorWithCompletion:(id)a3
{
  id v4 = a3;
  uint64_t v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Showing Proximity Error UI...", buf, 2u);
  }

  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-130011 userInfo:0];
  proxSetupError = self->_proxSetupError;
  self->_proxSetupError = v6;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __74__AKInAppAuthenticationRemoteUIProvider_showProximityErrorWithCompletion___block_invoke;
  block[3] = &unk_1E648FA30;
  id v13 = self;
  id v14 = v4;
  id v12 = WeakRetained;
  id v9 = v4;
  id v10 = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __74__AKInAppAuthenticationRemoteUIProvider_showProximityErrorWithCompletion___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v4 = [[AKProximityMessageViewModel alloc] initWithType:4];
    [*(id *)(a1 + 32) updateViewWithViewModel:v4];
  }
  else
  {
    uint64_t v2 = _AKLogSystem();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Proximity Pairing UI is not shown, nothing to clean up", buf, 2u);
    }

    uint64_t v3 = *(void *)(a1 + 48);
    if (v3) {
      (*(void (**)(uint64_t, void, void))(v3 + 16))(v3, 0, *(void *)(*(void *)(a1 + 40) + 64));
    }
  }
}

- (void)presentKeepUsingUIForAppleID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke;
  block[3] = &unk_1E648F510;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke(id *a1)
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138412290;
    id v43 = v3;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Presenting keep using alert for %@", buf, 0xCu);
  }

  id v4 = [a1[5] context];
  uint64_t v5 = NSString;
  id v6 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v7 = @"KEEP_USING_ALERT_TITLE";
  char v8 = [@"KEEP_USING_ALERT_TITLE" containsString:@"REBRAND"];
  if (v8)
  {
    int v9 = 0;
  }
  else
  {
    v33 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v33 isAABrandingEnabled])
    {
      id v7 = [@"KEEP_USING_ALERT_TITLE" stringByAppendingString:@"_REBRAND"];
      int v9 = 1;
    }
    else
    {
      int v9 = 0;
    }
  }
  id v10 = [v6 localizedStringForKey:v7 value:&stru_1F1EE8138 table:@"Localizable"];
  id v11 = [MEMORY[0x1E4F4F0E0] formattedUsernameFromUsername:a1[4]];
  [v4 serviceType];
  id v12 = AKLocStringFromServiceType();
  id v13 = objc_msgSend(v5, "stringWithFormat:", v10, v11, v12);

  if (v9) {
  if ((v8 & 1) == 0)
  }

  id v14 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v13 message:0 preferredStyle:1];
  id v15 = (void *)MEMORY[0x1E4F42720];
  v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v17 = [v16 localizedStringForKey:@"KEEP_USING_ALERT_YES_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_81;
  v38[3] = &unk_1E648FAA8;
  id v18 = v4;
  id v39 = v18;
  id v40 = a1[4];
  id v41 = a1[6];
  id v19 = [v15 actionWithTitle:v17 style:0 handler:v38];
  [v14 addAction:v19];

  BOOL v20 = (void *)MEMORY[0x1E4F42720];
  v21 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v22 = @"KEEP_USING_ALERT_NO_BUTTON";
  char v23 = [@"KEEP_USING_ALERT_NO_BUTTON" containsString:@"REBRAND"];
  if (v23)
  {
    int v24 = 0;
  }
  else
  {
    v32 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v32 isAABrandingEnabled])
    {
      id v22 = [@"KEEP_USING_ALERT_NO_BUTTON" stringByAppendingString:@"_REBRAND"];
      int v24 = 1;
    }
    else
    {
      int v24 = 0;
    }
  }
  v25 = [v21 localizedStringForKey:v22 value:&stru_1F1EE8138 table:@"Localizable"];
  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_86;
  v36[3] = &unk_1E648F320;
  id v37 = a1[6];
  v26 = [v20 actionWithTitle:v25 style:0 handler:v36];
  [v14 addAction:v26];

  if (v24) {
  if ((v23 & 1) == 0)
  }

  v27 = (void *)MEMORY[0x1E4F42720];
  v28 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  v29 = [v28 localizedStringForKey:@"KEEP_USING_ALERT_CANCEL_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_90;
  v34[3] = &unk_1E648F320;
  id v35 = a1[6];
  v30 = [v27 actionWithTitle:v29 style:0 handler:v34];
  [v14 addAction:v30];

  v31 = [v18 presentingViewController];
  [v31 presentViewController:v14 animated:1 completion:0];
}

uint64_t __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_81(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User accepted using the suggested Apple ID.", v4, 2u);
  }

  [*(id *)(a1 + 32) setUsername:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setIsUsernameEditable:0];
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_86(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User opted to use another Apple ID.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  if (v3)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7119);
    (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
  }
}

void __81__AKInAppAuthenticationRemoteUIProvider_presentKeepUsingUIForAppleID_completion___block_invoke_90(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User opted to cancel using the suggested Apple ID.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

- (void)dismissKeepUsingUIWithCompletion:(id)a3
{
}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void **)(a1 + 32);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke_2;
  v2[3] = &unk_1E648F2A0;
  void v2[4] = v1;
  id v3 = *(id *)(a1 + 40);
  [v1 cleanUpBasicLoginWithCompletion:v2];
}

void __77__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorUIWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 presentingViewController];
  id v4 = [v3 presentedViewController];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    uint64_t v6 = [v3 presentedViewController];
  }
  else
  {
    int v7 = [v2 piggybackingForTrustedDevice];
    char v8 = [AKBasicLoginAlertController alloc];
    if (v7)
    {
      id v15 = [(AKBasicLoginAlertController *)v8 initWithAlertStyle:5];
      int v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v10 = [v9 localizedStringForKey:@"ENTER_VERIFICATION_CODE_REPAIR" value:&stru_1F1EE8138 table:@"Localizable"];
      [(AKBasicLoginAlertController *)v15 setReason:v10];
      goto LABEL_9;
    }
    uint64_t v6 = [(AKBasicLoginAlertController *)v8 initWithAlertStyle:4];
  }
  id v15 = (AKBasicLoginAlertController *)v6;
  int v9 = [v2 _message];
  if (v9)
  {
    [(AKBasicLoginAlertController *)v15 setReason:v9];
    goto LABEL_10;
  }
  id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v10 localizedStringForKey:@"ENTER_VERIFICATION_CODE" value:&stru_1F1EE8138 table:@"Localizable"];
  [(AKBasicLoginAlertController *)v15 setReason:v11];

LABEL_9:
LABEL_10:

  id v12 = [v2 username];
  [(AKBasicLoginAlertController *)v15 setUsername:v12];

  [(AKBasicLoginAlertController *)v15 setDelegate:*(void *)(a1 + 32)];
  id v13 = [*(id *)(a1 + 32) _secondFactorActionsForAlert:v15 completion:*(void *)(a1 + 40)];
  [(AKBasicLoginAlertController *)v15 setSecondFactorActions:v13];

  id v14 = [(AKBasicLoginAlertController *)v15 presentingViewController];

  if (!v14) {
    [v3 presentViewController:v15 animated:1 completion:0];
  }
}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke;
  block[3] = &unk_1E648FAF8;
  void block[4] = self;
  id v19 = v10;
  id v21 = v12;
  id v22 = v13;
  id v20 = v11;
  id v14 = v12;
  id v15 = v11;
  id v16 = v13;
  id v17 = v10;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v3 = [v2 presentingViewController];
  id v4 = [*(id *)(a1 + 40) domain];
  if ([v4 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v5 = [*(id *)(a1 + 40) code];

    if (v5 == -7036)
    {
      uint64_t v6 = [v3 presentedViewController];
      [v6 jiggleAView];
      [v6 clearSecondFactorEntry];
      [v6 setPasscodeFieldDisabled:0];
      if ([v2 piggybackingForTrustedDevice])
      {
        int v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        char v8 = [v7 localizedStringForKey:@"ENTER_VERIFICATION_CODE_REPAIR" value:&stru_1F1EE8138 table:@"Localizable"];
        [v6 setReason:v8];
      }
      else
      {
        int v7 = [v2 _message];
        if (v7)
        {
          [v6 setReason:v7];
LABEL_11:

          id v18 = [*(id *)(a1 + 32) _secondFactorActionsForAlert:v6 completion:*(void *)(a1 + 64)];
          [v6 setSecondFactorActions:v18];

          goto LABEL_12;
        }
        char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v17 = [v8 localizedStringForKey:@"ENTER_VERIFICATION_CODE" value:&stru_1F1EE8138 table:@"Localizable"];
        [v6 setReason:v17];
      }
      goto LABEL_11;
    }
  }
  else
  {
  }
  [v3 dismissViewControllerAnimated:1 completion:0];
  uint64_t v6 = [MEMORY[0x1E4F42728] alertControllerWithTitle:*(void *)(a1 + 48) message:*(void *)(a1 + 56) preferredStyle:1];
  int v9 = (void *)MEMORY[0x1E4F42720];
  id v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2;
  v21[3] = &unk_1E648F320;
  id v22 = *(id *)(a1 + 64);
  id v12 = [v9 actionWithTitle:v11 style:1 handler:v21];
  [v6 addAction:v12];

  id v13 = (void *)MEMORY[0x1E4F42720];
  id v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v15 = [v14 localizedStringForKey:@"TRY_AGAIN" value:&stru_1F1EE8138 table:@"Localizable"];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_104;
  v19[3] = &unk_1E648FAD0;
  v19[4] = *(void *)(a1 + 32);
  id v20 = *(id *)(a1 + 64);
  id v16 = [v13 actionWithTitle:v15 style:0 handler:v19];
  [v6 addAction:v16];

  [v3 presentViewController:v6 animated:1 completion:0];
LABEL_12:
}

void __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User canceled second-factor entry!", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

uint64_t __100__AKInAppAuthenticationRemoteUIProvider_presentSecondFactorAlertWithError_title_message_completion___block_invoke_104(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentSecondFactorUIWithCompletion:*(void *)(a1 + 40)];
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__AKInAppAuthenticationRemoteUIProvider_dismissSecondFactorUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__AKInAppAuthenticationRemoteUIProvider_dismissSecondFactorUIWithCompletion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 96) clearObjectModel];
  uint64_t v2 = [*(id *)(a1 + 32) context];
  id v4 = [v2 presentingViewController];

  uint64_t v3 = [v4 presentedViewController];

  if (v3) {
    [v4 dismissViewControllerAnimated:1 completion:0];
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)presentIDPProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  ASWebAuthenticationSessionClass = (objc_class *)AuthenticationServicesLibraryCore();
  if (ASWebAuthenticationSessionClass) {
    ASWebAuthenticationSessionClass = (objc_class *)getASWebAuthenticationSessionClass();
  }
  id v9 = [ASWebAuthenticationSessionClass alloc];
  id v10 = [v6 request];
  id v11 = +[AKIDPUtility idpURLFromRequest:v10];
  id v12 = AKIDPUtilityIDPScheme;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke;
  v24[3] = &unk_1E648FB48;
  id v13 = v6;
  id v25 = v13;
  v26 = self;
  id v14 = v7;
  id v27 = v14;
  id v15 = (ASWebAuthenticationSession *)[v9 initWithURL:v11 callbackURLScheme:v12 completionHandler:v24];
  webAuthenticationSession = self->_webAuthenticationSession;
  self->_webAuthenticationSession = v15;

  [(ASWebAuthenticationSession *)self->_webAuthenticationSession setPrefersEphemeralWebBrowserSession:1];
  [(ASWebAuthenticationSession *)self->_webAuthenticationSession setPresentationContextProvider:self];
  [(ASWebAuthenticationSession *)self->_webAuthenticationSession start];
  id v17 = [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate modalRemoteUINavController];

  if (v17)
  {
    [(AKInAppAuthenticationRemoteUIProvider *)self _contextDidPresentLoginController];
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    id v19 = [WeakRetained presentingViewController];
    id v20 = objc_alloc(MEMORY[0x1E4F42BF8]);
    id v21 = objc_opt_new();
    id v22 = (void *)[v20 initWithRootViewController:v21];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_2;
    v23[3] = &unk_1E648EF28;
    v23[4] = self;
    [v19 presentViewController:v22 animated:1 completion:v23];
  }
}

void __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)a1[4];
  id v7 = a2;
  char v8 = [v6 request];
  id v9 = +[AKIDPUtility parametersFromResponseURL:v7 request:v8];

  id v10 = _AKLogSystem();
  id v11 = v10;
  if (v5)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_cold_1((uint64_t)v5, v11);
    }
  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v20 = v9;
    _os_log_impl(&dword_1C38C1000, v11, OS_LOG_TYPE_DEFAULT, "IDP ASWebAuthenticationSession completed parameters: %@", buf, 0xCu);
  }

  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_106;
  v15[3] = &unk_1E648FB20;
  id v12 = (void *)a1[6];
  v15[4] = a1[5];
  id v17 = v5;
  id v18 = v12;
  id v16 = v9;
  id v13 = v5;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], v15);
}

void __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_106(uint64_t a1)
{
  [*(id *)(a1 + 32) _contextWillDismissLoginAlertController];
  uint64_t v2 = *(void *)(a1 + 56);
  uint64_t v3 = *(void *)(a1 + 40);
  id v4 = +[AKIDPUtility convertError:*(void *)(a1 + 48)];
  (*(void (**)(uint64_t, void, uint64_t, id))(v2 + 16))(v2, 0, v3, v4);
}

uint64_t __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _contextDidPresentLoginController];
}

- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  char v8 = _AKLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v29 = self;
    __int16 v30 = 2112;
    id v31 = v6;
    _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "%@: Presenting server provided UI with configuration (%@)", buf, 0x16u);
  }

  id v9 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  if ([v9 forceInlinePresentation] && objc_msgSend(v6, "presentationType") != 2) {
    [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate setOverrideFirstActionSignal:1];
  }
  id v10 = [[AKAppleIDServerUIContextController alloc] initWithRequestConfiguration:v6 completion:v7];

  [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate setServerUIContextController:v10];
  id v11 = [v9 presentingViewController];
  id v12 = [(AKInAppAuthenticationRemoteUIProvider *)self remoteUIController];
  id v13 = objc_msgSend(v11, "ak_topPresentedViewController");
  [v12 setHostViewController:v13];

  id v14 = [(AKInAppAuthenticationRemoteUIProvider *)self ruiPreferences];

  if (v14)
  {
    id v15 = [(AKInAppAuthenticationRemoteUIProvider *)self remoteUIController];
    id v16 = [(AKInAppAuthenticationRemoteUIProvider *)self ruiPreferences];
    [v15 presentLoadingSheet:v16];
  }
  id v17 = [(AKInAppAuthenticationRemoteUIProvider *)self remoteUIController];
  uint64_t v18 = *MEMORY[0x1E4F4ED18];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke;
  v26[3] = &unk_1E648FB70;
  id v27 = v10;
  id v19 = v10;
  [v17 setHandlerForElementName:v18 handler:v26];

  if (self->_basicLoginAlertController || self->_basicLoginViewController)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke_2;
    v23[3] = &unk_1E648F278;
    v23[4] = self;
    id v24 = v11;
    id v25 = v6;
    [(AKInAppAuthenticationRemoteUIProvider *)self cleanUpBasicLoginWithCompletion:v23];
  }
  else
  {
    id v20 = [(AKInAppAuthenticationRemoteUIProvider *)self remoteUIController];
    uint64_t v21 = [v6 request];
    id v22 = (void *)[v21 mutableCopy];
    [v20 loadRequest:v22 completion:0];
  }
}

void __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v6 = [a4 objectForKeyedSubscript:*MEMORY[0x1E4F4ED40]];
  if (([*(id *)(a1 + 32) handleAuthKitActionAttribute:v6] & 1) == 0
    && [v6 isEqualToString:*MEMORY[0x1E4F4ED48]])
  {
    id v7 = [*(id *)(a1 + 32) serverDataHarvester];
    [v7 harvestDataFromServerUIObjectModel:v8];
  }
}

void __93__AKInAppAuthenticationRemoteUIProvider_presentServerProvidedUIWithConfiguration_completion___block_invoke_2(id *a1)
{
  uint64_t v2 = [a1[4] remoteUIController];
  uint64_t v3 = objc_msgSend(a1[5], "ak_topPresentedViewController");
  [v2 setHostViewController:v3];

  id v6 = [a1[4] remoteUIController];
  id v4 = [a1[6] request];
  id v5 = (void *)[v4 mutableCopy];
  [v6 loadRequest:v5 completion:0];
}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4 = (void (**)(id, uint64_t, void))a3;
  id v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Client was asked to dismiss server-provided UI.", v12, 2u);
  }

  id v6 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  id v7 = [v6 presentingViewController];
  if (([v6 isPresentingServerUI] & 1) == 0)
  {
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKInAppAuthenticationRemoteUIProvider dismissServerProvidedUIWithCompletion:]();
    }
    goto LABEL_11;
  }
  id v8 = [(UINavigationController *)self->_navController viewControllers];
  if ([v8 containsObject:self->_basicLoginAlertController])
  {

    goto LABEL_9;
  }
  id v10 = [(UINavigationController *)self->_navController viewControllers];
  int v11 = [v10 containsObject:self->_basicLoginViewController];

  if (v11)
  {
LABEL_9:
    id v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[AKInAppAuthenticationRemoteUIProvider dismissServerProvidedUIWithCompletion:]();
    }
LABEL_11:

    goto LABEL_12;
  }
  if (([v6 forceInlinePresentation] & 1) == 0) {
    [v7 dismissViewControllerAnimated:1 completion:0];
  }
LABEL_12:
  [v6 setPresentingServerUI:0];
  [(AKInAppAuthenticationRemoteUIProvider *)self _clearRemoteUIController];
  v4[2](v4, 1, 0);
}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke;
  v7[3] = &unk_1E648F2A0;
  void v7[4] = self;
  id v8 = v5;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

void __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke(uint64_t a1)
{
  v37[2] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_opt_new();
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v4 = [v3 localizedStringForKey:@"CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];
  [v2 setLocalizedCancelTitle:v4];

  [v2 setTouchIDAuthenticationAllowableReuseDuration:20.0];
  [v2 setTouchIDAuthenticationRetryLimit:&unk_1F1F03720];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:@"SIGN_IN" value:&stru_1F1EE8138 table:@"Localizable"];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  uint64_t v8 = [WeakRetained title];
  id v9 = (void *)v8;
  if (v8) {
    id v10 = (void *)v8;
  }
  else {
    id v10 = v6;
  }
  int v11 = v10;

  id v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v13 = [v12 localizedStringForKey:@"AUTHORIZE_PASSCODE_VALIDATION_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];

  id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  if ([v14 isPasscodeOnlyPolicy])
  {
    id v15 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    uint64_t v16 = [v15 serviceType];

    if (v16 != 2) {
      goto LABEL_11;
    }

    id v14 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
    id v17 = [v14 title];
    uint64_t v18 = v17;
    if (v17)
    {
      id v19 = v17;
    }
    else
    {
      id v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v19 = [v20 localizedStringForKey:@"PASSCODE_AUTHENTICATION_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];

      id v13 = v20;
    }

    int v11 = &stru_1F1EE8138;
    id v13 = v19;
  }

LABEL_11:
  v36[0] = &unk_1F1F03738;
  v36[1] = &unk_1F1F03750;
  v37[0] = v11;
  v37[1] = v13;
  uint64_t v21 = 2;
  id v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v37 forKeys:v36 count:2];
  id v23 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  if ([v23 isPasscodeOnlyPolicy]) {
    uint64_t v21 = 1007;
  }

  id v33 = 0;
  int v24 = [v2 canEvaluatePolicy:v21 error:&v33];
  id v25 = v33;
  if (v24)
  {
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_128;
    v31[3] = &unk_1E648F4C0;
    v26 = &v32;
    id v32 = *(id *)(a1 + 40);
    [v2 evaluatePolicy:v21 options:v22 reply:v31];
  }
  else
  {
    id v27 = _AKLogSystem();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v35 = v25;
      _os_log_impl(&dword_1C38C1000, v27, OS_LOG_TYPE_DEFAULT, "Cannot Evaluate Policy error %@", buf, 0xCu);
    }

    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_130;
    v28[3] = &unk_1E648FA80;
    v26 = &v30;
    id v30 = *(id *)(a1 + 40);
    id v29 = v25;
    dispatch_async(MEMORY[0x1E4F14428], v28);
  }
}

void __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  v29[1] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 code];
    id v9 = _AKLogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8 == -2)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "User canceled the biometric authentication!", buf, 2u);
      }

      int v11 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v28 = *MEMORY[0x1E4F28A50];
      v29[0] = v7;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:&v28 count:1];
      id v13 = v11;
      uint64_t v14 = -7003;
    }
    else
    {
      if (v10)
      {
        *(_DWORD *)buf = 138412290;
        id v27 = v7;
        _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "Biometric authentication failed with error: %@", buf, 0xCu);
      }

      uint64_t v16 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v24 = *MEMORY[0x1E4F28A50];
      id v25 = v7;
      id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v25 forKeys:&v24 count:1];
      id v13 = v16;
      uint64_t v14 = -7068;
    }
    id v15 = objc_msgSend(v13, "ak_errorWithCode:userInfo:", v14, v12);
  }
  else
  {
    id v15 = 0;
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_129;
  block[3] = &unk_1E648FB98;
  id v17 = *(id *)(a1 + 32);
  id v22 = v15;
  id v23 = v17;
  id v21 = v5;
  id v18 = v15;
  id v19 = v5;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_129(void *a1)
{
  return (*(uint64_t (**)(void, BOOL, void))(a1[6] + 16))(a1[6], a1[4] != 0, a1[5]);
}

uint64_t __99__AKInAppAuthenticationRemoteUIProvider_presentBiometricOrPasscodeValidationForAppleID_completion___block_invoke_130(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

- (void)presentNativeRecoveryUIWithContext:(id)a3 completion:(id)a4
{
  id v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (void)dismissNativeRecoveryUIWithCompletion:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F28C58];
  id v5 = a3;
  objc_msgSend(v4, "ak_errorWithCode:", -7027);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a3 + 2))(v5, 0, v6);
}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5
{
  id v6 = a5;
  id v7 = a4;
  uint64_t v8 = _AKLogFido();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AKInAppAuthenticationRemoteUIProvider presentFidoAuthForContext:fidoContext:completion:]();
  }

  id v9 = objc_alloc_init(AKFidoUIController);
  [(AKFidoUIController *)v9 verifyFidoKeyWithFidoContext:v7 completion:v6];
}

- (RemoteUIController)remoteUIController
{
  uint64_t v3 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  remoteUIController = self->_remoteUIController;
  if (!remoteUIController)
  {
    id v5 = [MEMORY[0x1E4F290F0] defaultSessionConfiguration];
    id v6 = objc_alloc_init(MEMORY[0x1E4F4EF78]);
    id v7 = [v3 proxiedDevice];

    if (v7)
    {
      uint64_t v8 = _AKLogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[AKInAppAuthenticationRemoteUIProvider remoteUIController]();
      }

      id v9 = [v3 anisetteDataProvider];
      [v6 setAnisetteDataProvider:v9];

      BOOL v10 = [v3 proxiedDevice];
      [v6 setPairedDevice:v10];
    }
    objc_msgSend(v5, "set_appleIDContext:", v6);
    int v11 = (RemoteUIController *)objc_alloc_init(MEMORY[0x1E4F95F70]);
    id v12 = self->_remoteUIController;
    self->_remoteUIController = v11;

    [(RemoteUIController *)self->_remoteUIController setSessionConfiguration:v5];
    [(RemoteUIController *)self->_remoteUIController setNavigationController:self->_navController];
    id v13 = self->_remoteUIController;
    uint64_t v14 = [v3 remoteUIStyle];
    [(RemoteUIController *)v13 setStyle:v14];

    [(RemoteUIController *)self->_remoteUIController setDelegate:v3];
    id v15 = [v3 prepareRUIController];

    if (v15)
    {
      uint64_t v16 = [v3 prepareRUIController];
      ((void (**)(void, RemoteUIController *))v16)[2](v16, self->_remoteUIController);
    }
    id v17 = [v3 cellularDataAttributionAppBundleID];

    if (v17)
    {
      id v18 = [v3 cellularDataAttributionAppBundleID];
      objc_msgSend(v5, "set_sourceApplicationBundleIdentifier:", v18);
    }
    AAUICDPStingrayRemoteUIControllerClass = (objc_class *)AppleAccountUILibraryCore();
    if (AAUICDPStingrayRemoteUIControllerClass) {
      AAUICDPStingrayRemoteUIControllerClass = (objc_class *)getAAUICDPStingrayRemoteUIControllerClass();
    }
    id v20 = (void *)[[AAUICDPStingrayRemoteUIControllerClass alloc] initWithRemoteUIController:self->_remoteUIController];
    [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate setStingrayController:v20];

    id v21 = [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate stingrayController];
    char v22 = objc_opt_respondsToSelector();

    id v23 = [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate stingrayController];
    uint64_t v24 = v23;
    if (v22)
    {
      id v25 = [v3 telemetryFlowID];
      [v24 attachAllHandlersWithTelemetryFlowID:v25];
    }
    else
    {
      [v23 attachAllHandlers];
    }

    remoteUIController = self->_remoteUIController;
  }
  if (([(RemoteUIController *)remoteUIController isListeningForHSATokenAutoFill] & 1) == 0) {
    [(RemoteUIController *)self->_remoteUIController startListeningForHSATokenAutoFill];
  }
  v26 = self->_remoteUIController;

  return v26;
}

- (void)_clearRemoteUIController
{
  if ([(RemoteUIController *)self->_remoteUIController isListeningForHSATokenAutoFill])[(RemoteUIController *)self->_remoteUIController stopListeningForHSATokenAutoFill]; {
  [(RemoteUIController *)self->_remoteUIController setDelegate:0];
  }
  remoteUIController = self->_remoteUIController;
  self->_remoteUIController = 0;
}

- (id)_navController
{
  navController = self->_navController;
  if (!navController)
  {
    id v4 = (UINavigationController *)objc_alloc_init(MEMORY[0x1E4F42BF8]);
    id v5 = self->_navController;
    self->_navController = v4;

    id v6 = [(UINavigationController *)self->_navController navigationItem];
    [v6 setHidesBackButton:1];

    id v7 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v8 = [v7 userInterfaceIdiom];

    if (v8 == 1) {
      [(UINavigationController *)self->_navController setModalPresentationStyle:2];
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    [WeakRetained willPresentModalNavigationController:self->_navController];

    navController = self->_navController;
  }

  return navController;
}

- (void)cleanUpBasicLoginWithCompletion:(id)a3
{
  id v4 = (void (**)(void))a3;
  if ([(AKInAppAuthenticationRemoteUIProvider *)self _shouldShowAsView])
  {
    basicLoginViewController = self->_basicLoginViewController;
    if (basicLoginViewController)
    {
      if ([(AKBasicLoginViewController *)basicLoginViewController isPresentedModally])
      {
        id v6 = _AKLogSystem();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Cleaning up Basic Login View", buf, 2u);
        }

        [(AKBasicLoginViewController *)self->_basicLoginViewController setLoginActions:0];
        [(AKBasicLoginViewController *)self->_basicLoginViewController stopAnimating];
        [(AKBasicLoginViewController *)self->_basicLoginViewController dismissViewControllerAnimated:1 completion:v4];
        basicLoginAlertController = self->_basicLoginViewController;
        self->_basicLoginViewController = 0;
LABEL_19:

        navController = self->_navController;
        self->_navController = 0;

        goto LABEL_20;
      }
    }
  }
  if (self->_basicLoginAlertController)
  {
    uint64_t v8 = _AKLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Cleaning up Basic Login Alert View", v13, 2u);
    }

    [(AKBasicLoginAlertController *)self->_basicLoginAlertController setLoginActions:0];
    [(AKBasicLoginAlertController *)self->_basicLoginAlertController setSecondFactorActions:0];
    [(AKBasicLoginAlertController *)self->_basicLoginAlertController stopAnimating];
    id v9 = [(AKBasicLoginViewController *)self->_basicLoginViewController presentingViewController];

    if (v9)
    {
      [(AKBasicLoginAlertController *)self->_basicLoginAlertController dismissViewControllerAnimated:1 completion:v4];
    }
    else if (v4)
    {
      v4[2](v4);
    }
    basicLoginAlertController = self->_basicLoginAlertController;
    self->_basicLoginAlertController = 0;
    goto LABEL_19;
  }
  if (v4)
  {
    BOOL v10 = _AKLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_1C38C1000, v10, OS_LOG_TYPE_DEFAULT, "Asked to cleanup Basic Login UI, but there is nothing to clean up.", v12, 2u);
    }

    v4[2](v4);
  }
LABEL_20:
}

- (void)_contextDidPresentLoginController
{
  id v3 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  uint64_t v2 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contextDidPresentLoginAlertController:v3];
  }
}

- (void)_contextWillDismissLoginAlertController
{
  id v3 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  uint64_t v2 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contextWillDismissLoginAlertController:v3];
  }
}

- (void)_contextDidDismissLoginAlertController
{
  id v3 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  uint64_t v2 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v2 contextDidDismissLoginAlertController:v3];
  }
}

- (BOOL)_shouldShowAsView
{
  return 1;
}

- (void)_showMaxAttemptAlertWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke;
  v6[3] = &unk_1E648FA80;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(AKInAppAuthenticationRemoteUIProvider *)self cleanUpBasicLoginWithCompletion:v6];
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v1 = (void *)MEMORY[0x1E4F4F010];
  if ([@"FORGOT_PASSWORD_ALERT_MESSAGE" containsString:@"REBRAND"])
  {
    uint64_t v2 = [v1 deviceSpecificLocalizedStringWithKey:@"FORGOT_PASSWORD_ALERT_MESSAGE"];
  }
  else
  {
    id v3 = [MEMORY[0x1E4F4F020] sharedManager];
    if ([v3 isAABrandingEnabled])
    {
      id v4 = [@"FORGOT_PASSWORD_ALERT_MESSAGE" stringByAppendingString:@"_REBRAND"];
      uint64_t v2 = [v1 deviceSpecificLocalizedStringWithKey:v4];
    }
    else
    {
      uint64_t v2 = [v1 deviceSpecificLocalizedStringWithKey:@"FORGOT_PASSWORD_ALERT_MESSAGE"];
    }
  }
  id v5 = (void *)MEMORY[0x1E4F42728];
  id v6 = objc_msgSend(MEMORY[0x1E4F28B50], "bundleWithIdentifier:", @"com.apple.AuthKit", v2);
  id v7 = [v6 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_TITLE" value:&stru_1F1EE8138 table:@"Localizable"];
  uint64_t v8 = [v5 alertControllerWithTitle:v7 message:v2 preferredStyle:1];

  id v9 = (void *)MEMORY[0x1E4F42720];
  BOOL v10 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  int v11 = [v10 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_CANCEL_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2;
  v23[3] = &unk_1E648F320;
  id v24 = *(id *)(a1 + 40);
  id v12 = [v9 actionWithTitle:v11 style:1 handler:v23];
  [v8 addAction:v12];

  id v13 = (void *)MEMORY[0x1E4F42720];
  uint64_t v14 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKit"];
  id v15 = [v14 localizedStringForKey:@"FORGOT_PASSWORD_ALERT_RESET_BUTTON" value:&stru_1F1EE8138 table:@"Localizable"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_160;
  v21[3] = &unk_1E648F320;
  id v22 = *(id *)(a1 + 40);
  uint64_t v16 = [v13 actionWithTitle:v15 style:0 handler:v21];
  [v8 addAction:v16];

  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 112));
  id v18 = [WeakRetained presentingViewController];
  [v18 presentViewController:v8 animated:1 completion:0];
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  (*(void (**)(uint64_t, void, void, void, void *))(v3 + 16))(v3, 0, 0, 0, v4);
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_160(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_160_cold_1();
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7017);
  (*(void (**)(uint64_t, void, void, void, void *))(v3 + 16))(v3, 0, 0, 0, v4);
}

- (id)_actionsForLoginWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = objc_opt_new();
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke;
  v24[3] = &unk_1E648FBC0;
  objc_copyWeak(&v26, &location);
  id v6 = v4;
  id v25 = v6;
  [v5 setAuthenticateAction:v24];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_163;
  v21[3] = &unk_1E648FBE8;
  objc_copyWeak(&v23, &location);
  id v7 = v6;
  id v22 = v7;
  objc_msgSend(v5, "setAk_cancelAction:", v21);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2;
  v18[3] = &unk_1E648FBE8;
  objc_copyWeak(&v20, &location);
  id v8 = v7;
  id v19 = v8;
  [v5 setCreateIDAction:v18];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_166;
  v15[3] = &unk_1E648FBE8;
  objc_copyWeak(&v17, &location);
  id v9 = v8;
  id v16 = v9;
  [v5 setUseIDAction:v15];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_168;
  v12[3] = &unk_1E648FC10;
  objc_copyWeak(&v14, &location);
  id v10 = v9;
  id v13 = v10;
  [v5 setForgotPasswordAction:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v23);

  objc_destroyWeak(&v26);
  objc_destroyWeak(&location);

  return v5;
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = _AKLogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "User is trying to sign in!", v10, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v9 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained _startAnimating];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_163(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User canceled!", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_164;
  v4[3] = &unk_1E648FA58;
  id v5 = *(id *)(a1 + 32);
  [WeakRetained cleanUpBasicLoginWithCompletion:v4];
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_164(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User is creating an AppleID!", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_165;
  v4[3] = &unk_1E648FA58;
  id v5 = *(id *)(a1 + 32);
  [WeakRetained cleanUpBasicLoginWithCompletion:v4];
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_165(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7016);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_166(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User is using an AppleID!", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_167;
  v4[3] = &unk_1E648F2A0;
  void v4[4] = WeakRetained;
  id v5 = *(id *)(a1 + 32);
  [WeakRetained cleanUpBasicLoginWithCompletion:v4];
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_167(uint64_t a1)
{
  id v8 = [*(id *)(a1 + 32) context];
  [v8 setShouldAllowAppleIDCreation:0];
  uint64_t v2 = [v8 username];
  if (v2
    && (uint64_t v3 = (void *)v2,
        [v8 username],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 length],
        v4,
        v3,
        v5))
  {
    id v6 = v8;
    uint64_t v7 = 0;
  }
  else
  {
    id v6 = v8;
    uint64_t v7 = 1;
  }
  [v6 setIsUsernameEditable:v7];
  [*(id *)(a1 + 32) presentBasicLoginUIWithCompletion:*(void *)(a1 + 40)];
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_2_168(uint64_t a1)
{
  uint64_t v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User forgot the password!", buf, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_169;
  v4[3] = &unk_1E648FA58;
  id v5 = *(id *)(a1 + 32);
  [WeakRetained cleanUpBasicLoginWithCompletion:v4];
}

void __72__AKInAppAuthenticationRemoteUIProvider__actionsForLoginWithCompletion___block_invoke_169(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7017);
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, void, void, id))(v1 + 16))(v1, 0, 0, 0, v2);
}

- (void)_startAnimating
{
  BOOL v3 = [(AKInAppAuthenticationRemoteUIProvider *)self _shouldShowAsView];
  uint64_t v4 = 8;
  if (v3) {
    uint64_t v4 = 16;
  }
  id v5 = *(Class *)((char *)&self->super.isa + v4);

  [v5 startAnimating];
}

- (id)_secondFactorActionsForAlert:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = objc_opt_new();
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke;
  v18[3] = &unk_1E648FA58;
  id v8 = v6;
  id v19 = v8;
  objc_msgSend(v7, "setAk_cancelAction:", v18);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_172;
  v16[3] = &unk_1E648FA58;
  id v9 = v8;
  id v17 = v9;
  [v7 setRegenerateCodeAction:v16];
  objc_initWeak(&location, v5);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_173;
  v12[3] = &unk_1E648FC10;
  objc_copyWeak(&v14, &location);
  id v10 = v9;
  id v13 = v10;
  [v7 setCodeEnteredAction:v12];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v7;
}

void __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User canceled second-factor entry!", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_172(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "User says they did not get a code.", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7035);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

void __81__AKInAppAuthenticationRemoteUIProvider__secondFactorActionsForAlert_completion___block_invoke_173(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412290;
    id v10 = v3;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "User entered code %@.", (uint8_t *)&v9, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = WeakRetained;
  if (WeakRetained) {
    [WeakRetained setPasscodeFieldDisabled:1];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v3, "integerValue"));
  (*(void (**)(uint64_t, void *, void))(v7 + 16))(v7, v8, 0);
}

- (void)_updateReason
{
  id v16 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  id v3 = [v16 reason];
  if (v3) {
    goto LABEL_2;
  }
  uint64_t v4 = [v16 username];
  if (v4)
  {
    id v5 = (void *)v4;
    char v6 = [v16 isUsernameEditable];

    if ((v6 & 1) == 0)
    {
      uint64_t v7 = [MEMORY[0x1E4F4F010] currentDevice];
      int v8 = [v7 isMultiUserMode];

      if (v8)
      {
        [v16 serviceType];
        id v3 = AKSharedDevicePasscodePromptAlertMessageWithServiceType();
        [v16 setReason:v3];
      }
      else
      {
        int v9 = NSString;
        id v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v10 = [v3 localizedStringForKey:@"DEFAULT_PLACEHOLDER_AUTHENTICATION_REASON" value:&stru_1F1EE8138 table:@"Localizable"];
        uint64_t v11 = (void *)MEMORY[0x1E4F4F0E0];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
        id v13 = [WeakRetained username];
        id v14 = [v11 formattedUsernameFromUsername:v13];
        id v15 = objc_msgSend(v9, "stringWithFormat:", v10, v14);
        [v16 setReason:v15];
      }
LABEL_2:
    }
  }
}

- (BOOL)_shouldUsePasswordDelegate
{
  id v2 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  id v3 = [v2 username];
  if ([v3 length])
  {
    uint64_t v4 = [v2 _password];
    if ([v4 length])
    {
      BOOL v5 = 0;
    }
    else
    {
      char v6 = [v2 _passwordDelegate];
      BOOL v5 = v6 != 0;
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_showPasswordFieldWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Attempting to show password field.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) context];
  int v4 = [*(id *)(a1 + 32) _shouldShowAsView];
  id v5 = [*(id *)(a1 + 32) _actionsForLoginWithCompletion:*(void *)(a1 + 40)];
  uint64_t v6 = 8;
  if (v4) {
    uint64_t v6 = 16;
  }
  [*(id *)(*(void *)(a1 + 32) + v6) setLoginActions:v5];

  id v7 = [v3 _passwordDelegate];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke_178;
  v9[3] = &unk_1E648FA08;
  id v8 = *(id *)(a1 + 40);
  v9[4] = *(void *)(a1 + 32);
  id v10 = v8;
  [v7 context:v3 needsPasswordWithCompletion:v9];
}

void __74__AKInAppAuthenticationRemoteUIProvider__showPasswordFieldWithCompletion___block_invoke_178(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = a3;
  id v7 = a2;
  id v9 = [v5 context];
  id v8 = [v9 username];
  (*(void (**)(uint64_t, void *, id, void, id))(v4 + 16))(v4, v8, v7, 0, v6);
}

- (void)presentBasicLoginUIAsAlertWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  id v6 = [v5 presentingViewController];
  basicLoginAlertController = self->_basicLoginAlertController;
  id v8 = _AKLogSystem();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (basicLoginAlertController)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Basic login UI is already on screen.", buf, 2u);
    }
  }
  else
  {
    if (v9)
    {
      *(_WORD *)id v29 = 0;
      _os_log_impl(&dword_1C38C1000, v8, OS_LOG_TYPE_DEFAULT, "Creating new basic login UI instance as alert.", v29, 2u);
    }

    id v10 = [[AKBasicLoginAlertController alloc] initWithNibName:0 bundle:0];
    uint64_t v11 = self->_basicLoginAlertController;
    self->_basicLoginAlertController = v10;

    id v12 = [v5 defaultButtonString];
    if (v12)
    {
      [(AKBasicLoginAlertController *)self->_basicLoginAlertController setAuthenticateButtonTitle:v12];
    }
    else
    {
      id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v14 = [v13 localizedStringForKey:@"SIGN_IN" value:&stru_1F1EE8138 table:@"Localizable"];
      [(AKBasicLoginAlertController *)self->_basicLoginAlertController setAuthenticateButtonTitle:v14];
    }
    id v15 = [v5 title];
    [(AKBasicLoginAlertController *)self->_basicLoginAlertController setAuthenticateTitle:v15];

    [(AKBasicLoginAlertController *)self->_basicLoginAlertController setDelegate:self];
    id v16 = [v5 username];
    [(AKBasicLoginAlertController *)self->_basicLoginAlertController setUsername:v16];

    if (([v5 isUsernameEditable] & 1) == 0 && (objc_msgSend(v5, "shouldAllowAppleIDCreation") & 1) == 0)
    {
      [(AKBasicLoginAlertController *)self->_basicLoginAlertController setAlertStyle:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
      id v18 = [WeakRetained username];

      if (!v18) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3B8] format:@"username must not be nil for pre-filled alert style"];
      }
    }
    [(AKInAppAuthenticationRemoteUIProvider *)self _updateReason];
    if ([v5 shouldAllowAppleIDCreation]) {
      [(AKBasicLoginAlertController *)self->_basicLoginAlertController setAlertStyle:2];
    }
    id v19 = self->_basicLoginAlertController;
    id v8 = [v5 _interpolatedReasonWithBlame];
    [(AKBasicLoginAlertController *)v19 setReason:v8];
  }

  id v20 = [(AKInAppAuthenticationRemoteUIProvider *)self _actionsForLoginWithCompletion:v4];

  [(AKBasicLoginAlertController *)self->_basicLoginAlertController setLoginActions:v20];
  if (!basicLoginAlertController)
  {
    id v21 = [v6 navigationController];
    id v22 = [v21 transitionCoordinator];
    if (v22
      || ([v6 view],
          id v24 = objc_claimAutoreleasedReturnValue(),
          [v24 superview],
          id v25 = objc_claimAutoreleasedReturnValue(),
          v25,
          v24,
          !v25))
    {
      id v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsAlertWithCompletion:]();
      }
    }
    id v26 = _AKLogSystem();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v27 = 0;
      _os_log_impl(&dword_1C38C1000, v26, OS_LOG_TYPE_DEFAULT, "Presenting basic login instance as alert...", v27, 2u);
    }

    [v6 presentViewController:self->_basicLoginAlertController animated:1 completion:0];
  }
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke;
  v20[3] = &unk_1E648FC88;
  v20[4] = self;
  id v21 = v12;
  id v23 = v14;
  id v24 = v15;
  id v22 = v13;
  BOOL v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v15;
  id v19 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "akd says there was an issue with the login. Will display alert.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) context];
  id v4 = [v3 presentingViewController];
  id v5 = [*(id *)(a1 + 40) domain];
  if ([v5 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v6 = [*(id *)(a1 + 40) code];

    if (v6 == -7028)
    {
      [*(id *)(a1 + 32) _showMaxAttemptAlertWithCompletion:*(void *)(a1 + 64)];
      goto LABEL_18;
    }
  }
  else
  {
  }
  id v7 = *(id *)(*(void *)(a1 + 32) + 8);
  uint64_t v16 = MEMORY[0x1E4F143A8];
  uint64_t v17 = 3221225472;
  id v18 = __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_183;
  id v19 = &unk_1E648FC60;
  id v20 = *(id *)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v8 = v7;
  uint64_t v9 = *(void *)(a1 + 32);
  id v22 = v8;
  uint64_t v23 = v9;
  id v26 = *(id *)(a1 + 64);
  char v27 = *(unsigned char *)(a1 + 72);
  id v24 = *(id *)(a1 + 40);
  id v25 = v4;
  id v10 = (void (**)(void))MEMORY[0x1C8777520](&v16);
  uint64_t v11 = objc_msgSend(v3, "alertDelegate", v16, v17, v18, v19);
  if (objc_opt_respondsToSelector())
  {
    id v12 = _AKLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_cold_1();
    }

    [v11 displayAlertForContext:v3 error:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
  }
  else if (v8)
  {
    int v13 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7006);
    id v14 = *(id **)(a1 + 32);
    if (v13)
    {
      [v14[1] stopAnimating];
      [*(id *)(*(void *)(a1 + 32) + 8) jiggleAView];
      [*(id *)(*(void *)(a1 + 32) + 8) clearPasswordField];
      id v15 = [*(id *)(a1 + 32) _actionsForLoginWithCompletion:*(void *)(a1 + 64)];
      [*(id *)(*(void *)(a1 + 32) + 8) setLoginActions:v15];
    }
    else
    {
      [v14 cleanUpBasicLoginWithCompletion:v10];
    }
  }
  else
  {
    v10[2](v10);
    if (!*(unsigned char *)(a1 + 72)) {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
    }
  }

LABEL_18:
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_183(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Displaying login alert...", buf, 2u);
  }

  id v3 = [MEMORY[0x1E4F42728] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  id v4 = (void *)MEMORY[0x1E4F42720];
  id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  uint64_t v6 = [v5 localizedStringForKey:@"OK" value:&stru_1F1EE8138 table:@"Localizable"];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_187;
  v10[3] = &unk_1E648FC38;
  id v7 = *(id *)(a1 + 48);
  uint64_t v8 = *(void *)(a1 + 56);
  id v11 = v7;
  uint64_t v12 = v8;
  id v14 = *(id *)(a1 + 80);
  char v15 = *(unsigned char *)(a1 + 88);
  id v13 = *(id *)(a1 + 64);
  uint64_t v9 = [v4 actionWithTitle:v6 style:1 handler:v10];
  [v3 addAction:v9];

  [*(id *)(a1 + 72) presentViewController:v3 animated:1 completion:0];
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_187(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_187_cold_1();
  }

  if (*(void *)(a1 + 32))
  {
    [*(id *)(a1 + 40) presentBasicLoginUIWithCompletion:*(void *)(a1 + 56)];
  }
  else if (*(unsigned char *)(a1 + 64))
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)presentBasicLoginUIAsViewWithCompletion:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
  uint64_t v6 = [v5 presentingViewController];
  p_basicLoginViewController = (uint64_t *)&self->_basicLoginViewController;
  basicLoginViewController = self->_basicLoginViewController;
  uint64_t v9 = _AKLogSystem();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (basicLoginViewController)
  {
    if (v10)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "Basic login UI is already on screen.", (uint8_t *)&v27, 2u);
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "Creating new basic login UI instance as view.", (uint8_t *)&v27, 2u);
    }

    id v11 = [[AKBasicLoginViewController alloc] initWithContext:v5];
    uint64_t v12 = self->_basicLoginViewController;
    self->_basicLoginViewController = v11;

    [v5 _setPasswordDelegate:self->_basicLoginViewController];
    [(AKBasicLoginViewController *)self->_basicLoginViewController setDelegate:self];
    [(AKInAppAuthenticationRemoteUIProvider *)self _updateReason];
  }
  id v13 = [(AKInAppAuthenticationRemoteUIProvider *)self _actionsForLoginWithCompletion:v4];

  [(AKBasicLoginViewController *)self->_basicLoginViewController setLoginActions:v13];
  if (basicLoginViewController)
  {
    id v14 = v6;
  }
  else
  {
    char v15 = [v6 navigationController];
    uint64_t v16 = [v15 transitionCoordinator];

    if (v16) {
      goto LABEL_11;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
    id v19 = [WeakRetained presentingViewController];
    id v20 = [v19 view];
    id v21 = [v20 superview];

    if (!v21)
    {
LABEL_11:
      uint64_t v17 = _AKLogSystem();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        -[AKInAppAuthenticationRemoteUIProvider presentBasicLoginUIAsAlertWithCompletion:]();
      }
    }
    id v22 = _AKLogSystem();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v27) = 0;
      _os_log_impl(&dword_1C38C1000, v22, OS_LOG_TYPE_DEFAULT, "Presenting basic login instance as view...", (uint8_t *)&v27, 2u);
    }

    id v14 = objc_msgSend(v6, "ak_topPresentedViewController");

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v23 = _AKLogSystem();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
        [(AKInAppAuthenticationRemoteUIProvider *)p_basicLoginViewController presentBasicLoginUIAsViewWithCompletion:v23];
      }

      [v14 pushViewController:*p_basicLoginViewController animated:1];
    }
    else
    {
      id v24 = [(AKInAppAuthenticationRemoteUIProvider *)self _navController];
      id v25 = _AKLogSystem();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v26 = *p_basicLoginViewController;
        int v27 = 138412802;
        uint64_t v28 = v26;
        __int16 v29 = 2112;
        id v30 = v24;
        __int16 v31 = 2112;
        id v32 = v14;
        _os_log_debug_impl(&dword_1C38C1000, v25, OS_LOG_TYPE_DEBUG, "Pushing %@ onto %@ and presenting on %@", (uint8_t *)&v27, 0x20u);
      }

      [v24 pushViewController:*p_basicLoginViewController animated:0];
      [v14 presentViewController:v24 animated:1 completion:&__block_literal_global_4];
    }
  }
}

- (void)presentLoginAlertUIAsViewWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke;
  v20[3] = &unk_1E648FC88;
  v20[4] = self;
  id v21 = v12;
  id v23 = v14;
  id v24 = v15;
  id v22 = v13;
  BOOL v25 = a6;
  id v16 = v14;
  id v17 = v13;
  id v18 = v15;
  id v19 = v12;
  dispatch_async(MEMORY[0x1E4F14428], v20);
}

void __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "akd says there was an issue with the login. Will display alert.", buf, 2u);
  }

  id v3 = [*(id *)(a1 + 32) context];
  id v4 = [*(id *)(a1 + 40) domain];
  if ([v4 isEqual:*MEMORY[0x1E4F4ED70]])
  {
    uint64_t v5 = [*(id *)(a1 + 40) code];

    if (v5 == -7028)
    {
      [*(id *)(a1 + 32) _showMaxAttemptAlertWithCompletion:*(void *)(a1 + 64)];
      goto LABEL_21;
    }
  }
  else
  {
  }
  uint64_t v6 = [v3 alertDelegate];
  char v7 = objc_opt_respondsToSelector();
  uint64_t v8 = _AKLogSystem();
  uint64_t v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_cold_1();
    }

    [v6 displayAlertForContext:v3 error:*(void *)(a1 + 40) completion:*(void *)(a1 + 64)];
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v9, OS_LOG_TYPE_DEFAULT, "Displaying login alert...", buf, 2u);
    }

    BOOL v10 = [MEMORY[0x1E4F42728] alertControllerWithTitle:*(void *)(a1 + 48) message:*(void *)(a1 + 56) preferredStyle:1];
    id v11 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
    id v12 = [v11 localizedStringForKey:@"OK" value:&stru_1F1EE8138 table:@"Localizable"];

    int v13 = objc_msgSend(*(id *)(a1 + 40), "ak_isAuthenticationErrorWithCode:", -7094);
    id v14 = &off_1C392E000;
    if (v13)
    {
      id v15 = (void *)MEMORY[0x1E4F42720];
      id v16 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
      id v17 = [v16 localizedStringForKey:@"CONTINUE" value:&stru_1F1EE8138 table:@"Localizable"];
      v35[0] = MEMORY[0x1E4F143A8];
      v35[1] = 3221225472;
      v35[2] = __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_194;
      v35[3] = &unk_1E648FCB0;
      char v38 = *(unsigned char *)(a1 + 72);
      id v37 = *(id *)(a1 + 64);
      id v36 = *(id *)(a1 + 40);
      id v18 = [v15 actionWithTitle:v17 style:0 handler:v35];

      [v10 addAction:v18];
      [v10 setPreferredAction:v18];
      id v19 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
      uint64_t v20 = [v19 localizedStringForKey:@"CANCEL" value:&stru_1F1EE8138 table:@"Localizable"];

      id v14 = &off_1C392E000;
      id v12 = (void *)v20;
    }
    id v21 = (void *)MEMORY[0x1E4F42720];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = *((void *)v14 + 95);
    id v30 = __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_200;
    __int16 v31 = &unk_1E648FCB0;
    char v34 = *(unsigned char *)(a1 + 72);
    id v33 = *(id *)(a1 + 64);
    id v32 = *(id *)(a1 + 40);
    id v22 = [v21 actionWithTitle:v12 style:1 handler:&v28];
    objc_msgSend(v10, "addAction:", v22, v28, v29, v30, v31);

    uint64_t v23 = *(void *)(a1 + 32);
    id v24 = *(void **)(v23 + 16);
    if (v24)
    {
      [v24 stopAnimating];
      [*(id *)(*(void *)(a1 + 32) + 16) clearPasswordField];
      BOOL v25 = [*(id *)(a1 + 32) _actionsForLoginWithCompletion:*(void *)(a1 + 64)];
      [*(id *)(*(void *)(a1 + 32) + 16) setLoginActions:v25];

      [*(id *)(*(void *)(a1 + 32) + 16) presentViewController:v10 animated:1 completion:0];
    }
    else
    {
      id WeakRetained = objc_loadWeakRetained((id *)(v23 + 112));
      int v27 = [WeakRetained presentingViewController];
      [v27 presentViewController:v10 animated:1 completion:0];

      if (!*(unsigned char *)(a1 + 72)) {
        (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      }
    }
  }
LABEL_21:
}

void __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_194(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F1CB10] URLWithString:@"prefs:root=General&path=ManagedConfigurationList"];
  id v3 = _AKLogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to redirect to device management landing page", v5, 2u);
  }

  id v4 = [MEMORY[0x1E4F223E0] defaultWorkspace];
  [v4 openSensitiveURL:v2 withOptions:0];

  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void __120__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertUIAsViewWithError_title_message_waitForInteraction_completion___block_invoke_200(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_187_cold_1();
  }

  if (*(unsigned char *)(a1 + 48)) {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

- (id)presentationAnchorForWebAuthenticationSession:(id)a3
{
  id v4 = [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate modalRemoteUINavController];

  if (v4)
  {
    uint64_t v5 = [(AKInAppAuthenticationRemoteUIDelegate *)self->_remoteUIControllerDelegate modalRemoteUINavController];
    uint64_t v6 = [v5 view];
    char v7 = [v6 window];
  }
  else
  {
    uint64_t v5 = [(AKInAppAuthenticationRemoteUIProvider *)self context];
    uint64_t v6 = [v5 presentingViewController];
    uint64_t v8 = [v6 view];
    char v7 = [v8 window];
  }

  return v7;
}

- (void)proximitySetupCompletedWithResult:(id)a3
{
  id v4 = a3;
  [(AKInAppAuthenticationRemoteUIProvider *)self _enableIdleTimerIfNeeded];
  uint64_t v5 = [v4 error];

  uint64_t v6 = _AKLogSystem();
  char v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AKInAppAuthenticationRemoteUIProvider proximitySetupCompletedWithResult:](v4, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    -[AKInAppAuthenticationRemoteUIProvider proximitySetupCompletedWithResult:](v4, v7);
  }

  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke;
  v22[3] = &unk_1E648FCD8;
  v22[4] = self;
  id v8 = v4;
  id v23 = v8;
  uint64_t v9 = (void (**)(void, void, void))MEMORY[0x1C8777520](v22);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  char v11 = [WeakRetained _shouldBroadcastForProximityAuthOnly];

  p_proximityAuthViewController = &self->_proximityAuthViewController;
  if (v11)
  {
    objc_storeWeak((id *)p_proximityAuthViewController, 0);
    int v13 = [v8 error];
    id v14 = [v8 error];
    uint64_t v15 = [v14 code];

    if (v15 == -7003)
    {
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F4ED80] code:-13004 userInfo:0];

      int v13 = (void *)v16;
    }
    id v17 = [v8 authResults];
    ((void (**)(void, void *, void *))v9)[2](v9, v17, v13);
  }
  else
  {
    id v18 = objc_loadWeakRetained((id *)p_proximityAuthViewController);
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_2;
    v19[3] = &unk_1E648FA30;
    v19[4] = self;
    id v21 = v9;
    id v20 = v8;
    [v18 dismissViewControllerAnimated:0 completion:v19];
  }
}

void __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v13 = a3;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void *)(v4 + 48);
  if (v5)
  {
    uint64_t v6 = [*(id *)(a1 + 40) authResults];
    if (v6)
    {
      char v7 = [*(id *)(a1 + 40) authResults];
      (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v7, v13);
    }
    else
    {
      (*(void (**)(uint64_t, void, id))(v5 + 16))(v5, *(void *)(*(void *)(a1 + 32) + 56), v13);
    }

    uint64_t v4 = *(void *)(a1 + 32);
    id v8 = *(void **)(v4 + 48);
  }
  else
  {
    id v8 = 0;
  }
  *(void *)(v4 + 48) = 0;

  uint64_t v9 = *(void *)(a1 + 32);
  BOOL v10 = *(void **)(v9 + 56);
  *(void *)(v9 + 56) = 0;

  uint64_t v11 = *(void *)(a1 + 32);
  id v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = 0;
}

void __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_2(uint64_t a1)
{
  objc_storeWeak((id *)(*(void *)(a1 + 32) + 104), 0);
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 24);
  *(void *)(v2 + 24) = 0;

  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = *(void **)(v4 + 16);
  if (v5)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_3;
    v9[3] = &unk_1E648FA30;
    v9[4] = v4;
    id v11 = *(id *)(a1 + 48);
    id v10 = *(id *)(a1 + 40);
    [v5 dismissViewControllerAnimated:0 completion:v9];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 48);
    id v8 = [*(id *)(a1 + 40) authResults];
    char v7 = [*(id *)(a1 + 40) error];
    (*(void (**)(uint64_t, id, void *))(v6 + 16))(v6, v8, v7);
  }
}

void __75__AKInAppAuthenticationRemoteUIProvider_proximitySetupCompletedWithResult___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 16);
  *(void *)(v2 + 16) = 0;

  uint64_t v4 = *(void *)(a1 + 48);
  id v6 = [*(id *)(a1 + 40) authResults];
  uint64_t v5 = [*(id *)(a1 + 40) error];
  (*(void (**)(uint64_t, id, void *))(v4 + 16))(v4, v6, v5);
}

- (void)setupPasscodeAndBiometricWithCompletion:(id)a3
{
}

- (void)setupPerformAIDASignInWith:(id)a3 completion:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_storeStrong((id *)&self->_proxAuthResults, a3);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);
  if ([WeakRetained _shouldBroadcastForProximityAuthOnly]
    && ([WeakRetained proximityAIDAHandler],
        id v10 = objc_claimAutoreleasedReturnValue(),
        v10,
        v10))
  {
    id v11 = [WeakRetained proximityAIDAHandler];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __79__AKInAppAuthenticationRemoteUIProvider_setupPerformAIDASignInWith_completion___block_invoke;
    v14[3] = &unk_1E648FA58;
    id v15 = v8;
    ((void (**)(void, id, void *))v11)[2](v11, v7, v14);
  }
  else
  {
    if ([WeakRetained _shouldBroadcastForProximityAuthOnly])
    {
      id v12 = v8;
      uint64_t v13 = 0;
    }
    else
    {
      id v12 = v8;
      uint64_t v13 = 1;
    }
    (*((void (**)(id, uint64_t))v8 + 2))(v12, v13);
  }
}

uint64_t __79__AKInAppAuthenticationRemoteUIProvider_setupPerformAIDASignInWith_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)proximitySetupSelectedAccount:(int64_t)a3 completion:(id)a4
{
}

- (RemoteUIControllerPreferences)ruiPreferences
{
  return self->_ruiPreferences;
}

- (void)setRuiPreferences:(id)a3
{
}

- (void)setRemoteUIController:(id)a3
{
}

- (AKInAppAuthenticationRemoteUIDelegate)remoteUIControllerDelegate
{
  return self->_remoteUIControllerDelegate;
}

- (AKProximityAuthViewController)proximityAuthViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_proximityAuthViewController);

  return (AKProximityAuthViewController *)WeakRetained;
}

- (void)setProximityAuthViewController:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContext)context
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_context);

  return (AKAppleIDAuthenticationInAppContext *)WeakRetained;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_context);
  objc_destroyWeak((id *)&self->_proximityAuthViewController);
  objc_storeStrong((id *)&self->_remoteUIControllerDelegate, 0);
  objc_storeStrong((id *)&self->_remoteUIController, 0);
  objc_storeStrong((id *)&self->_ruiPreferences, 0);
  objc_storeStrong((id *)&self->_proxSetupError, 0);
  objc_storeStrong((id *)&self->_proxAuthResults, 0);
  objc_storeStrong(&self->_proxAuthCompletion, 0);
  objc_storeStrong((id *)&self->_pasViewPresenter, 0);
  objc_storeStrong((id *)&self->_webAuthenticationSession, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_basicLoginViewController, 0);

  objc_storeStrong((id *)&self->_basicLoginAlertController, 0);
}

- (void)presentProximityBroadcastUIWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Proximity Authentication login UI is already on screen.", v2, v3, v4, v5, v6);
}

- (void)presentProximityPinCodeUIWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Attempting to show prox PIN code, but there is no prox view.", v2, v3, v4, v5, v6);
}

- (void)activateProximitySession:(uint64_t *)a1 completion:(NSObject *)a2 .cold.1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Setting 'shouldSignInForSelf=YES' for PAS view presenter (%@)", (uint8_t *)&v3, 0xCu);
}

- (void)activateProximitySession:(uint64_t *)a1 completion:(NSObject *)a2 .cold.2(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "PAS view presenter (%@) does not respond to 'shouldSignInForSelf' selector", (uint8_t *)&v3, 0xCu);
}

- (void)activateProximitySession:completion:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Missing navigation controller to initate set up for self...", v2, v3, v4, v5, v6);
}

void __90__AKInAppAuthenticationRemoteUIProvider_presentIDPProvidedUIWithConfiguration_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "IDP ASWebAuthenticationSession completed error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)dismissServerProvidedUIWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "We still have basic login UI in our nav stack. Ignoring dismiss request.", v2, v3, v4, v5, v6);
}

- (void)dismissServerProvidedUIWithCompletion:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Looks like the InApp UI has already been dismissed.", v2, v3, v4, v5, v6);
}

- (void)presentFidoAuthForContext:fidoContext:completion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Presenting Fido authentication flow in remote UI provider.", v2, v3, v4, v5, v6);
}

- (void)remoteUIController
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Proxying for another device, so attaching secondary Anisette controller to our URL session config.", v2, v3, v4, v5, v6);
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User canceled login error alert.", v2, v3, v4, v5, v6);
}

void __76__AKInAppAuthenticationRemoteUIProvider__showMaxAttemptAlertWithCompletion___block_invoke_160_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User asked to reset password in response to login error.", v2, v3, v4, v5, v6);
}

- (void)presentBasicLoginUIAsAlertWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1C38C1000, v0, v1, "Attempting to present basic login instance during animation or without a superview... dragons ahead...", v2, v3, v4, v5, v6);
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "Will skip showing login error alert.", v2, v3, v4, v5, v6);
}

void __112__AKInAppAuthenticationRemoteUIProvider_presentLoginAlertWithError_title_message_waitForInteraction_completion___block_invoke_187_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1C38C1000, v0, v1, "User dismissed login error alert.", v2, v3, v4, v5, v6);
}

- (void)presentBasicLoginUIAsViewWithCompletion:(os_log_t)log .cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Pushing %@ onto %@", (uint8_t *)&v4, 0x16u);
}

- (void)proximitySetupCompletedWithResult:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 authResults];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Proximity Setup Completed with auth results: %@", (uint8_t *)&v4, 0xCu);
}

- (void)proximitySetupCompletedWithResult:(void *)a1 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_ERROR, "Proximity Setup Completed with error: %@", (uint8_t *)&v4, 0xCu);
}

@end