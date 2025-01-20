@interface AKAppleIDAuthenticationWatchBuddyContext
- (NSString)password;
- (RUIStyle)remoteUIStyle;
- (void)dismissBasicLoginUIWithCompletion:(id)a3;
- (void)presentBasicLoginUIWithCompletion:(id)a3;
- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4;
- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6;
- (void)setPassword:(id)a3;
- (void)setRemoteUIStyle:(id)a3;
- (void)willPresentModalNavigationController:(id)a3;
@end

@implementation AKAppleIDAuthenticationWatchBuddyContext

- (void)presentBasicLoginUIWithCompletion:(id)a3
{
  id v4 = a3;
  v5 = _AKLogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_1C38C1000, v5, OS_LOG_TYPE_DEFAULT, "Asked to present basic login UI; Forwarding password to akd.",
      v10,
      2u);
  }

  uint64_t v6 = [(AKAppleIDAuthenticationWatchBuddyContext *)self username];
  if (!v6) {
    -[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:]();
  }
  v7 = (void *)v6;
  uint64_t v8 = [(AKAppleIDAuthenticationWatchBuddyContext *)self password];
  if (!v8) {
    -[AKAppleIDAuthenticationWatchBuddyContext presentBasicLoginUIWithCompletion:]();
  }
  v9 = (void *)v8;
  (*((void (**)(id, void *, uint64_t, void, void))v4 + 2))(v4, v7, v8, 0, 0);
}

- (void)dismissBasicLoginUIWithCompletion:(id)a3
{
  v3 = (void (**)(id, uint64_t, void))a3;
  id v4 = _AKLogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Asked to dismiss basic login UI.", v5, 2u);
  }

  v3[2](v3, 1, 0);
}

- (void)presentLoginAlertWithError:(id)a3 title:(id)a4 message:(id)a5 completion:(id)a6
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v12 = _AKLogSystem();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    id v23 = v10;
    _os_log_impl(&dword_1C38C1000, v12, OS_LOG_TYPE_DEFAULT, "Asked to present login error alert; Title: (%@); Message: (%@).",
      buf,
      0x16u);
  }

  [(AKAppleIDAuthenticationInAppContext *)self _assertValidPresentingViewController];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__AKAppleIDAuthenticationWatchBuddyContext_presentLoginAlertWithError_title_message_completion___block_invoke;
  block[3] = &unk_1E648F278;
  id v17 = v9;
  id v18 = v10;
  v19 = self;
  id v13 = v10;
  id v14 = v9;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v15 = objc_msgSend(MEMORY[0x1E4F28C58], "ak_errorWithCode:", -7003);
  (*((void (**)(id, void, void, void, void *))v11 + 2))(v11, 0, 0, 0, v15);
}

void __96__AKAppleIDAuthenticationWatchBuddyContext_presentLoginAlertWithError_title_message_completion___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F42728] alertControllerWithTitle:*(void *)(a1 + 32) message:*(void *)(a1 + 40) preferredStyle:1];
  v2 = (void *)MEMORY[0x1E4F42720];
  v3 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.AuthKitUI"];
  id v4 = [v3 localizedStringForKey:@"OK" value:&stru_1F1EE8138 table:@"Localizable"];
  v5 = [v2 actionWithTitle:v4 style:1 handler:&__block_literal_global_2];
  [v7 addAction:v5];

  uint64_t v6 = [*(id *)(a1 + 48) presentingViewController];
  [v6 presentViewController:v7 animated:1 completion:&__block_literal_global_46];
}

- (void)presentBiometricOrPasscodeValidationForAppleID:(id)a3 completion:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F28C58];
  id v6 = a4;
  objc_msgSend(v5, "ak_errorWithCode:", -7027);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  (*((void (**)(id, void, id))a4 + 2))(v6, 0, v7);
}

- (RUIStyle)remoteUIStyle
{
  v3 = [(AKAppleIDAuthenticationInAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v4 = _AKLogSystem();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v11[0] = 0;
      _os_log_impl(&dword_1C38C1000, v4, OS_LOG_TYPE_DEFAULT, "Watch buddy context delegate providing style", (uint8_t *)v11, 2u);
    }

    v5 = [v3 remoteUIStyle];
  }
  else
  {
    remoteUIStyle = self->_remoteUIStyle;
    if (!remoteUIStyle)
    {
      if (BridgePreferencesLibraryCore()) {
        getBPSRemoteUISetupStyleClass();
      }
      id v7 = (RUIStyle *)objc_opt_new();
      uint64_t v8 = self->_remoteUIStyle;
      self->_remoteUIStyle = v7;

      remoteUIStyle = self->_remoteUIStyle;
    }
    v5 = remoteUIStyle;
  }
  id v9 = v5;

  return v9;
}

- (void)willPresentModalNavigationController:(id)a3
{
  id v4 = a3;
  v5 = [(AKAppleIDAuthenticationInAppContext *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = _AKLogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v8 = 0;
      _os_log_impl(&dword_1C38C1000, v6, OS_LOG_TYPE_DEFAULT, "Watch buddy context delegate handling willPresentModalNavigationController:", v8, 2u);
    }

    [v5 willPresentModalNavigationController:v4];
  }
  else
  {
    id v7 = [v4 navigationBar];
    SBPSApplyStyleToNavBar(v7);
  }
}

- (NSString)password
{
  return self->_password;
}

- (void)setPassword:(id)a3
{
}

- (void)setRemoteUIStyle:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteUIStyle, 0);

  objc_storeStrong((id *)&self->_password, 0);
}

- (void)presentBasicLoginUIWithCompletion:.cold.1()
{
}

- (void)presentBasicLoginUIWithCompletion:.cold.2()
{
}

@end