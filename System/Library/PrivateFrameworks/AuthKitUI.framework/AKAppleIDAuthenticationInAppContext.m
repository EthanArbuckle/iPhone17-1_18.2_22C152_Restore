@interface AKAppleIDAuthenticationInAppContext
- (AKAppleIDAuthenticationInAppContextAlertDelegate)alertDelegate;
- (AKAppleIDAuthenticationInAppContextDelegate)delegate;
- (AKAppleIDAuthenticationInAppContextPasswordDelegate)_passwordDelegate;
- (AKInAppAuthenticationUIProvider)inAppAuthUIProvider;
- (BOOL)forceInlinePresentation;
- (BOOL)isPresentingServerUI;
- (CDPStateUIProvider)cdpUiProvider;
- (UIViewController)presentingViewController;
- (id)_remoteUIControllerDelegate;
- (id)prepareRUIController;
- (id)remoteUIStyle;
- (id)serverDataHarvester;
- (void)_assertValidPresentingViewController;
- (void)_cleanUpBasicLoginWithCompletion:(id)a3;
- (void)_contextDidEndPresentingSecondaryUI;
- (void)_contextWillBeginPresentingSecondaryUIWithCompletion:(id)a3;
- (void)_dismissServerProvidedUIWithCompletion:(id)a3;
- (void)_handleBackButtonTap:(id)a3;
- (void)_presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7;
- (void)_setCdpUiProvider:(id)a3;
- (void)_setPasswordDelegate:(id)a3;
- (void)activateProximitySession:(id)a3 completion:(id)a4;
- (void)cdpUiProvider;
- (void)completeWithError:(id)a3;
- (void)dismissBasicLoginUIWithCompletion:(id)a3;
- (void)dismissKeepUsingUIWithCompletion:(id)a3;
- (void)dismissNativeRecoveryUIWithCompletion:(id)a3;
- (void)dismissProximityPairingUIWithCompletion:(id)a3;
- (void)dismissSecondFactorUIWithCompletion:(id)a3;
- (void)dismissServerProvidedUIWithCompletion:(id)a3;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4;
- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5;
- (void)presentKeepUsingUIForAppleID:(id)a3 completion:(id)a4;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentNativeRecoveryUIWithContext:(id)a3 completion:(id)a4;
- (void)presentProximityBroadcastUIWithCompletion:(id)a3;
- (void)presentProximityPairingUIWithVerificationCode:(id)a3 completion:(id)a4;
- (void)presentProximityPinCodeUIWithCompletion:(id)a3;
- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)presentSecondFactorUIWithCompletion:(id)a3;
- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4;
- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4;
- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5;
- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5;
- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6;
- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4;
- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5;
- (void)setAlertDelegate:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setForceInlinePresentation:(BOOL)a3;
- (void)setInAppAuthUIProvider:(id)a3;
- (void)setPrepareRUIController:(id)a3;
- (void)setPresentingServerUI:(BOOL)a3;
- (void)setPresentingViewController:(id)a3;
- (void)showProximityErrorWithCompletion:(id)a3;
- (void)willPresentModalNavigationController:(id)a3;
@end

@implementation AKAppleIDAuthenticationInAppContext

- (AKInAppAuthenticationUIProvider)inAppAuthUIProvider
{
  inAppAuthUIProvider = self->_inAppAuthUIProvider;
  if (!inAppAuthUIProvider)
  {
    v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "InApp Remote UI Provider initialized", v8, 2u);
    }

    v5 = [[AKInAppAuthenticationRemoteUIProvider alloc] initWithContext:self];
    v6 = self->_inAppAuthUIProvider;
    self->_inAppAuthUIProvider = (AKInAppAuthenticationUIProvider *)v5;

    inAppAuthUIProvider = self->_inAppAuthUIProvider;
  }

  return inAppAuthUIProvider;
}

- (CDPStateUIProvider)cdpUiProvider
{
  cdpUiProvider = self->_cdpUiProvider;
  if (!cdpUiProvider)
  {
    v4 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
    v5 = [v4 remoteUIControllerDelegate];
    v6 = [v5 modalRemoteUINavController];
    if (v6)
    {
      v7 = [v4 remoteUIControllerDelegate];
      [v7 modalRemoteUINavController];
    }
    else
    {
      v7 = [v4 remoteUIController];
      [v7 navigationController];
    v8 = };

    v9 = _AKLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      [(AKAppleIDAuthenticationInAppContext *)(uint64_t)v8 cdpUiProvider];
    }

    v10 = [MEMORY[0x1E4F4EFF0] accountRecoveryControllerWithPresentingViewController:v8];
    [v10 setForceInlinePresentation:1];
    v11 = self->_cdpUiProvider;
    self->_cdpUiProvider = (CDPStateUIProvider *)v10;

    cdpUiProvider = self->_cdpUiProvider;
  }

  return cdpUiProvider;
}

- (void)_assertValidPresentingViewController
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C38C1000, log, OS_LOG_TYPE_ERROR, "Presenting view controller is missing!!! Dragons ahead!", v1, 2u);
}

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _passwordDelegate];
  v3 = [*(id *)(a1 + 32) username];
  uint64_t v4 = [v3 length];

  if (v4) {
    BOOL v5 = v2 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  if (v5)
  {
    [*(id *)(a1 + 32) _assertValidPresentingViewController];
    v6 = [*(id *)(a1 + 32) inAppAuthUIProvider];
    [v6 presentBasicLoginUIWithCompletion:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "Username is present but password is missing and required. Client should provide us with password.", buf, 2u);
    }

    v9 = [*(id *)(a1 + 32) username];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke_17;
    v13[3] = &unk_1E648FA08;
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(id *)(a1 + 40);
    id v14 = v9;
    id v15 = v11;
    id v12 = v9;
    [v2 context:v10 needsPasswordWithCompletion:v13];
  }
}

uint64_t __73__AKAppleIDAuthenticationInAppContext_presentBasicLoginUIWithCompletion___block_invoke_17(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void, void, uint64_t, void, uint64_t))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), a2, 0, a3);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v14 presentLoginAlertWithError:v13 title:v12 message:v11 completion:v10];
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v5 dismissBasicLoginUIWithCompletion:v4];
}

- (void)presentKeepUsingUIForAppleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v8 presentKeepUsingUIForAppleID:v7 completion:v6];
}

- (void)dismissKeepUsingUIWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v5 dismissKeepUsingUIWithCompletion:v4];
}

- (void)presentSecondFactorUIWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v5 presentSecondFactorUIWithCompletion:v4];
}

- (void)presentSecondFactorAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v14 presentSecondFactorAlertWithError:v13 title:v12 message:v11 completion:v10];
}

- (void)dismissSecondFactorUIWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v5 dismissSecondFactorUIWithCompletion:v4];
}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v8 presentBiometricOrPasscodeValidationForAppleID:v7 completion:v6];
}

- (void)presentServerProvidedUIWithConfiguration:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 request];

  if (v8)
  {
    [(AKAppleIDAuthenticationInAppContext *)self _assertValidPresentingViewController];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke;
    block[3] = &unk_1E648F510;
    block[4] = self;
    id v11 = v6;
    id v12 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v9 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7029);
    (*((void (**)(id, void, void, void *))v7 + 2))(v7, 0, 0, v9);
  }
}

void __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke(uint64_t a1)
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_2;
  v5[3] = &unk_1E648F510;
  v2 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v6 = v3;
  uint64_t v7 = v4;
  id v8 = *(id *)(a1 + 48);
  [v2 _contextWillBeginPresentingSecondaryUIWithCompletion:v5];
}

void __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_3;
  block[3] = &unk_1E648F510;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = *(void *)(a1 + 40);
  uint64_t v4 = *(void **)(a1 + 48);
  id v6 = v2;
  uint64_t v7 = v3;
  id v8 = v4;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __91__AKAppleIDAuthenticationInAppContext_presentServerProvidedUIWithConfiguration_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) requestType];
  if (v2 == 1)
  {
    uint64_t v7 = _AKLogSystem();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = [*(id *)(a1 + 32) request];
      v9 = [v8 URL];
      int v10 = 138412290;
      id v11 = v9;
      _os_log_impl(&dword_1C38C1000, v7, OS_LOG_TYPE_DEFAULT, "Presenting IDP flow at url: %@", (uint8_t *)&v10, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) inAppAuthUIProvider];
    [v6 presentIDPProvidedUIWithConfiguration:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
  else
  {
    if (v2) {
      return;
    }
    uint64_t v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(a1 + 32) request];
      id v5 = [v4 URL];
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Presenting RUI flow at url: %@", (uint8_t *)&v10, 0xCu);
    }
    id v6 = [*(id *)(a1 + 40) inAppAuthUIProvider];
    [v6 presentServerProvidedUIWithConfiguration:*(void *)(a1 + 32) completion:*(void *)(a1 + 48)];
  }
}

- (void)_dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v5 dismissServerProvidedUIWithCompletion:v4];
}

- (void)presentProximityBroadcastUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __81__AKAppleIDAuthenticationInAppContext_presentProximityBroadcastUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __81__AKAppleIDAuthenticationInAppContext_presentProximityBroadcastUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inAppAuthUIProvider];
  [v2 presentProximityBroadcastUIWithCompletion:*(void *)(a1 + 40)];
}

- (void)presentProximityPairingUIWithVerificationCode:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__AKAppleIDAuthenticationInAppContext_presentProximityPairingUIWithVerificationCode_completion___block_invoke;
  block[3] = &unk_1E648F510;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __96__AKAppleIDAuthenticationInAppContext_presentProximityPairingUIWithVerificationCode_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _assertValidPresentingViewController];
  id v2 = [*(id *)(a1 + 32) inAppAuthUIProvider];
  [v2 presentProximityPairingUIWithVerificationCode:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)presentProximityPinCodeUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__AKAppleIDAuthenticationInAppContext_presentProximityPinCodeUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __79__AKAppleIDAuthenticationInAppContext_presentProximityPinCodeUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inAppAuthUIProvider];
  [v2 presentProximityPinCodeUIWithCompletion:*(void *)(a1 + 40)];
}

- (void)activateProximitySession:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __75__AKAppleIDAuthenticationInAppContext_activateProximitySession_completion___block_invoke;
  block[3] = &unk_1E648F510;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __75__AKAppleIDAuthenticationInAppContext_activateProximitySession_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inAppAuthUIProvider];
  [v2 activateProximitySession:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

- (void)dismissProximityPairingUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __79__AKAppleIDAuthenticationInAppContext_dismissProximityPairingUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __79__AKAppleIDAuthenticationInAppContext_dismissProximityPairingUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inAppAuthUIProvider];
  [v2 dismissProximityPairingUIWithCompletion:*(void *)(a1 + 40)];
}

- (void)showProximityErrorWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__AKAppleIDAuthenticationInAppContext_showProximityErrorWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __72__AKAppleIDAuthenticationInAppContext_showProximityErrorWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) inAppAuthUIProvider];
  [v2 showProximityErrorWithCompletion:*(void *)(a1 + 40)];
}

- (void)presentNativeRecoveryUIWithContext:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__AKAppleIDAuthenticationInAppContext_presentNativeRecoveryUIWithContext_completion___block_invoke;
  block[3] = &unk_1E648F510;
  id v11 = v6;
  id v12 = self;
  id v13 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __85__AKAppleIDAuthenticationInAppContext_presentNativeRecoveryUIWithContext_completion___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v12 = 138412290;
    uint64_t v13 = v3;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Starting native recovery flow with context: %@", (uint8_t *)&v12, 0xCu);
  }

  id v4 = objc_alloc(MEMORY[0x1E4F4F068]);
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = [*(id *)(a1 + 40) cdpUiProvider];
  id v7 = [*(id *)(a1 + 40) telemetryFlowID];
  uint64_t v8 = [v4 initWithContext:v5 uiProvider:v6 flowID:v7];
  uint64_t v9 = *(void *)(a1 + 40);
  int v10 = *(void **)(v9 + 648);
  *(void *)(v9 + 648) = v8;

  return [*(id *)(*(void *)(a1 + 40) + 648) presentNativeRecoveryUIWithCompletion:*(void *)(a1 + 48)];
}

- (void)dismissNativeRecoveryUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Dismissing native recovery flow", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(void **)(v3 + 648);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke_22;
  v5[3] = &unk_1E648FED0;
  void v5[4] = v3;
  id v6 = *(id *)(a1 + 40);
  [v4 dismissNativeRecoveryUIWithCompletion:v5];
}

void __77__AKAppleIDAuthenticationInAppContext_dismissNativeRecoveryUIWithCompletion___block_invoke_22(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v5 = *(void *)(a1 + 32);
  id v6 = *(void **)(v5 + 648);
  *(void *)(v5 + 648) = 0;

  uint64_t v7 = *(void *)(a1 + 40);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a2, v8);
  }
}

- (void)dismissServerProvidedUIWithCompletion:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke;
  v6[3] = &unk_1E648F2A0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v6);
}

void __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _AKLogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1C38C1000, v2, OS_LOG_TYPE_DEFAULT, "Context was asked to dismiss server provided UI", buf, 2u);
  }

  uint64_t v3 = *(void **)(a1 + 32);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke_24;
  v4[3] = &unk_1E648FED0;
  v4[4] = v3;
  id v5 = *(id *)(a1 + 40);
  [v3 _dismissServerProvidedUIWithCompletion:v4];
}

void __77__AKAppleIDAuthenticationInAppContext_dismissServerProvidedUIWithCompletion___block_invoke_24(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _contextDidEndPresentingSecondaryUI];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

- (void)presentFidoAuthForContext:(id)a3 fidoContext:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = _AKLogFido();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    -[AKAppleIDAuthenticationInAppContext presentFidoAuthForContext:fidoContext:completion:](v11);
  }

  int v12 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v12 presentFidoAuthForContext:v10 fidoContext:v9 completion:v8];
}

- (void)_contextWillBeginPresentingSecondaryUIWithCompletion:(id)a3
{
  uint64_t v5 = (void (**)(void))a3;
  id v4 = [(AKAppleIDAuthenticationInAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    [v4 contextWillBeginPresentingSecondaryUI:self completion:v5];
  }
  else
  {
    if (objc_opt_respondsToSelector()) {
      [v4 contextWillBeginPresentingSecondaryUI:self];
    }
    if (v5) {
      v5[2]();
    }
  }
}

- (void)_contextDidEndPresentingSecondaryUI
{
  id v3 = [(AKAppleIDAuthenticationInAppContext *)self delegate];
  if (objc_opt_respondsToSelector()) {
    [v3 contextDidEndPresentingSecondaryUI:self];
  }
}

- (void)_cleanUpBasicLoginWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v5 cleanUpBasicLoginWithCompletion:v4];
}

- (void)_presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 waitForInteraction:(BOOL)a6 completion:(id)a7
{
  BOOL v7 = a6;
  id v12 = a7;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  id v16 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  [v16 presentLoginAlertWithError:v15 title:v14 message:v13 waitForInteraction:v7 completion:v12];
}

- (void)completeWithError:(id)a3
{
  id v4 = a3;
  id v7 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  id v5 = [v7 remoteUIControllerDelegate];
  id v6 = [v5 serverUIContextController];
  [v6 completeWithError:v4];
}

- (id)serverDataHarvester
{
  id v2 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  id v3 = [v2 remoteUIControllerDelegate];
  id v4 = [v3 serverUIContextController];
  id v5 = [v4 serverDataHarvester];

  return v5;
}

- (void)_handleBackButtonTap:(id)a3
{
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Handling back button tap, coercing into cancel", v6, 2u);
  }

  id v5 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  [(AKAppleIDAuthenticationInAppContext *)self completeWithError:v5];
}

- (id)remoteUIStyle
{
  id v2 = [(AKAppleIDAuthenticationInAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v3 = _AKLogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1C38C1000, v3, OS_LOG_TYPE_DEFAULT, "Context delegate handling RUI style", v6, 2u);
    }

    id v4 = [v2 remoteUIStyle];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4 = a3;
  id v5 = [(AKAppleIDAuthenticationInAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Context delegate handling willPresentModalNavigationController:", v7, 2u);
    }

    [v5 willPresentModalNavigationController:v4];
  }
}

- (id)_remoteUIControllerDelegate
{
  id v2 = [(AKAppleIDAuthenticationInAppContext *)self inAppAuthUIProvider];
  id v3 = [v2 remoteUIControllerDelegate];

  return v3;
}

- (void)remoteUIController:(id)a3 shouldLoadRequest:(id)a4 redirectResponse:(id)a5 withCompletionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v14 remoteUIController:v13 shouldLoadRequest:v12 redirectResponse:v11 withCompletionHandler:v10];
}

- (void)remoteUIController:(id)a3 didReceiveHTTPResponse:(id)a4 forRequest:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v11 remoteUIController:v10 didReceiveHTTPResponse:v9 forRequest:v8];
}

- (void)remoteUIController:(id)a3 didFinishLoadWithError:(id)a4 forRequest:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v11 remoteUIController:v10 didFinishLoadWithError:v9 forRequest:v8];
}

- (void)remoteUIController:(id)a3 willPresentModalNavigationController:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v8 remoteUIController:v7 willPresentModalNavigationController:v6];
}

- (void)remoteUIController:(id)a3 didDismissModalNavigationWithObjectModels:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v8 remoteUIController:v7 didDismissModalNavigationWithObjectModels:v6];
}

- (void)remoteUIController:(id)a3 didReceiveObjectModel:(id)a4 actionSignal:(unint64_t *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v10 remoteUIController:v9 didReceiveObjectModel:v8 actionSignal:a5];
}

- (void)remoteUIController:(id)a3 willPresentObjectModel:(id)a4 modally:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v10 remoteUIController:v9 willPresentObjectModel:v8 modally:v5];
}

- (void)remoteUIController:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [(AKAppleIDAuthenticationInAppContext *)self _remoteUIControllerDelegate];
  [v11 remoteUIController:v10 didReceiveChallenge:v9 completionHandler:v8];
}

- (BOOL)forceInlinePresentation
{
  return self->_forceInlinePresentation;
}

- (void)setForceInlinePresentation:(BOOL)a3
{
  self->_forceInlinePresentation = a3;
}

- (UIViewController)presentingViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);

  return (UIViewController *)WeakRetained;
}

- (void)setPresentingViewController:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContextDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AKAppleIDAuthenticationInAppContextDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)isPresentingServerUI
{
  return self->_presentingServerUI;
}

- (void)setPresentingServerUI:(BOOL)a3
{
  self->_presentingServerUI = a3;
}

- (AKAppleIDAuthenticationInAppContextAlertDelegate)alertDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertDelegate);

  return (AKAppleIDAuthenticationInAppContextAlertDelegate *)WeakRetained;
}

- (void)setAlertDelegate:(id)a3
{
}

- (void)setInAppAuthUIProvider:(id)a3
{
}

- (void)_setCdpUiProvider:(id)a3
{
}

- (AKAppleIDAuthenticationInAppContextPasswordDelegate)_passwordDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__passwordDelegate);

  return (AKAppleIDAuthenticationInAppContextPasswordDelegate *)WeakRetained;
}

- (void)_setPasswordDelegate:(id)a3
{
}

- (id)prepareRUIController
{
  return self->_prepareRUIController;
}

- (void)setPrepareRUIController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_prepareRUIController, 0);
  objc_destroyWeak((id *)&self->__passwordDelegate);
  objc_storeStrong((id *)&self->_cdpUiProvider, 0);
  objc_storeStrong((id *)&self->_inAppAuthUIProvider, 0);
  objc_destroyWeak((id *)&self->_alertDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_presentingViewController);

  objc_storeStrong((id *)&self->_nativeRecoveryController, 0);
}

- (void)cdpUiProvider
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1C38C1000, a2, OS_LOG_TYPE_DEBUG, "Forcing inline presentation with presenter: %@", (uint8_t *)&v2, 0xCu);
}

- (void)presentFidoAuthForContext:(os_log_t)log fidoContext:completion:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C38C1000, log, OS_LOG_TYPE_DEBUG, "Presenting Fido authentication flow in the app UI provider.", v1, 2u);
}

@end