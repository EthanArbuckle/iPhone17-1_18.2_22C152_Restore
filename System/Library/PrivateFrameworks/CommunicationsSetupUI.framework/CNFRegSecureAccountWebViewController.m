@interface CNFRegSecureAccountWebViewController
- (CNFRegSecureAccountWebViewController)initWithRegController:(id)a3 account:(id)a4;
- (IMAccount)account;
- (id)authIdHeaderValue;
- (id)authTokenHeaderValue;
- (void)_incrementSigninFailureCount;
- (void)_launchForgotPasswordUrl;
- (void)_resetSigninFailureCount;
- (void)_setupAccountHandlers;
- (void)_showBadPasswordAlert;
- (void)_showForgotPasswordAlert;
- (void)_showRegistrationFailureWithError:(id)a3;
- (void)_showRequestPasswordAlert;
- (void)doHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6;
- (void)setAccount:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CNFRegSecureAccountWebViewController

- (CNFRegSecureAccountWebViewController)initWithRegController:(id)a3 account:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFRegSecureAccountWebViewController;
  v7 = [(CNFRegAccountWebViewController *)&v10 initWithRegController:a3];
  v8 = v7;
  if (v7)
  {
    [(CNFRegSecureAccountWebViewController *)v7 setAccount:v6];
    v8->_gotNewCredential = 0;
  }

  return v8;
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CNFRegSecureAccountWebViewController;
  [(CNFRegAccountWebViewController *)&v4 viewDidAppear:a3];
  [(CNFRegSecureAccountWebViewController *)self _setupAccountHandlers];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)CNFRegSecureAccountWebViewController;
  [(CNFRegAccountWebViewController *)&v5 viewWillDisappear:a3];
  objc_super v4 = [(CNFRegServerWebViewController *)self regController];
  [v4 removeAllHandlers];
}

- (void)doHandoffWithStatus:(int)a3 appleID:(id)a4 authID:(id)a5 authToken:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([(CNFRegServerWebViewController *)self _shouldLog])
  {
    v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      int v20 = v8;
      _os_log_impl(&dword_21ED18000, v13, OS_LOG_TYPE_DEFAULT, "Got handoff with status : %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v18 = v8;
      IMLogString();
    }
  }
  if (v8 == 5000)
  {
    BOOL v14 = !self->_triedGettingNewCredentials;
    BOOL v15 = [(CNFRegServerWebViewController *)self _shouldLog];
    if (v14)
    {
      if (v15)
      {
        v17 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v17, OS_LOG_TYPE_DEFAULT, "Account was unauthenticated. Obtaining new auth credentials", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
      }
      self->_triedGettingNewCredentials = 1;
      [(CNFRegSecureAccountWebViewController *)self _showRequestPasswordAlert];
    }
    else
    {
      if (v15)
      {
        v16 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v16, OS_LOG_TYPE_DEFAULT, "Account was unauthenticated, and a previous attempt has been made to acquire auth credentials. Bailing.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
      }
      [(CNFRegAccountWebViewController *)self _showURLDidNotLoadAlert];
    }
  }
  else
  {
    [(CNFRegAccountWebViewController *)self completeHandoffWithStatus:v8 appleID:v10 authID:v11 authToken:v12];
  }
}

- (void)_showRegistrationFailureWithError:(id)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v6 = [v4 code];
    if ([(CNFRegServerWebViewController *)self _shouldLog])
    {
      v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v40 = v5;
        __int16 v41 = 2048;
        uint64_t v42 = v6;
        _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Received sign in error : %@ (%ld)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
      {
        v33 = v5;
        uint64_t v34 = v6;
        IMLogString();
      }
    }
  }
  uint64_t v8 = [(CNFRegServerWebViewController *)self regController];
  int v9 = [v8 shouldShowAlertForError:v5];

  if (v9)
  {
    id v10 = [v5 userInfo];
    id v11 = [v10 objectForKey:@"cnf-customTitle"];
    id v12 = v11;
    if (v11)
    {
      id v13 = v11;
    }
    else
    {
      BOOL v14 = CommunicationsSetupUIBundle();
      BOOL v15 = CNFRegStringTableName();
      id v13 = [v14 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v15];
    }
    v16 = [v5 localizedDescription];
    v17 = v16;
    if (v16)
    {
      id v18 = v16;
    }
    else
    {
      v19 = CommunicationsSetupUIBundle();
      int v20 = CNFRegStringTableName();
      id v18 = [v19 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v20];
    }
    uint64_t v21 = [v5 userInfo];
    v22 = [v21 objectForKey:@"cnf-customButton"];
    v23 = v22;
    if (v22)
    {
      id v24 = v22;
    }
    else
    {
      v25 = CommunicationsSetupUIBundle();
      v26 = CNFRegStringTableName();
      id v24 = [v25 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v26];
    }
    v27 = [MEMORY[0x263F82418] alertControllerWithTitle:v13 message:v18 preferredStyle:1];
    v38[0] = MEMORY[0x263EF8330];
    v38[1] = 3221225472;
    v38[2] = __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke;
    v38[3] = &unk_2644F0988;
    v38[4] = self;
    v28 = [MEMORY[0x263F82400] actionWithTitle:v24 style:0 handler:v38];
    [v27 addAction:v28];

    v29 = [v5 userInfo];
    v30 = [v29 objectForKey:@"cnf-customActionTitle"];

    if (v30)
    {
      v31 = (void *)MEMORY[0x263F82400];
      v35[0] = MEMORY[0x263EF8330];
      v35[1] = 3221225472;
      v35[2] = __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke_2;
      v35[3] = &unk_2644F0A80;
      id v36 = v5;
      v37 = self;
      v32 = [v31 actionWithTitle:v30 style:0 handler:v35];
      [v27 addAction:v32];
    }
    [(CNFRegSecureAccountWebViewController *)self presentViewController:v27 animated:1 completion:0];
  }
}

uint64_t __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  if (v1[133] >= 3uLL) {
    return [v1 _showForgotPasswordAlert];
  }
  else {
    return [v1 _showRequestPasswordAlert];
  }
}

void __74__CNFRegSecureAccountWebViewController__showRegistrationFailureWithError___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userInfo];
  objc_super v5 = [v4 objectForKey:@"cnf-customActionURLString"];

  if (v5)
  {
    uint64_t v6 = [NSURL URLWithString:v5];
    if (v6)
    {
      if ([*(id *)(a1 + 40) _shouldLog])
      {
        v7 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v11 = v6;
          _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Launching URL : %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          int v9 = v6;
          IMLogString();
        }
      }
      uint64_t v8 = objc_msgSend(*(id *)(a1 + 40), "regController", v9);
      [v8 openURL:v6];
    }
  }
}

- (void)_showBadPasswordAlert
{
  int v3 = _os_feature_enabled_impl();
  id v4 = CommunicationsSetupUIBundle();
  objc_super v5 = CNFRegStringTableName();
  if (v3) {
    uint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT";
  }
  else {
    uint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

  uint64_t v8 = CommunicationsSetupUIBundle();
  int v9 = CNFRegStringTableName();
  id v10 = [v8 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_INVALID_CREDENTIALS_FOR_%@" value:&stru_26D05D4F8 table:v9];

  id v11 = [(CNFRegSecureAccountWebViewController *)self account];
  uint64_t v12 = [v11 loginDisplayString];

  id v13 = objc_msgSend(NSString, "stringWithFormat:", v10, v12);
  BOOL v14 = CommunicationsSetupUIBundle();
  BOOL v15 = CNFRegStringTableName();
  v16 = [v14 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v15];

  v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v13 preferredStyle:1];
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __61__CNFRegSecureAccountWebViewController__showBadPasswordAlert__block_invoke;
  v19[3] = &unk_2644F0988;
  v19[4] = self;
  id v18 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:v19];
  [v17 addAction:v18];

  [(CNFRegSecureAccountWebViewController *)self presentViewController:v17 animated:1 completion:0];
}

uint64_t __61__CNFRegSecureAccountWebViewController__showBadPasswordAlert__block_invoke(uint64_t a1)
{
  CNFRegLogBacktrace();
  v2 = *(void **)(a1 + 32);
  return [v2 _showRequestPasswordAlert];
}

- (void)_showRequestPasswordAlert
{
  int v3 = _os_feature_enabled_impl();
  id v4 = CommunicationsSetupUIBundle();
  objc_super v5 = CNFRegStringTableName();
  if (v3) {
    uint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT";
  }
  else {
    uint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

  uint64_t v8 = [(CNFRegSecureAccountWebViewController *)self account];
  int v9 = [v8 loginDisplayString];

  id v10 = CommunicationsSetupUIBundle();
  id v11 = CNFRegStringTableName();
  uint64_t v12 = [v10 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v11];

  id v13 = CommunicationsSetupUIBundle();
  BOOL v14 = CNFRegStringTableName();
  BOOL v15 = [v13 localizedStringForKey:@"FACETIME_SIGNIN_BUTTON_LABEL" value:&stru_26D05D4F8 table:v14];

  v16 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v9 preferredStyle:1];
  [v16 addTextFieldWithConfigurationHandler:&__block_literal_global_9];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_2;
  v24[3] = &unk_2644F0988;
  v24[4] = self;
  v17 = [MEMORY[0x263F82400] actionWithTitle:v12 style:0 handler:v24];
  [v16 addAction:v17];

  id v18 = (void *)MEMORY[0x263F82400];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_3;
  v21[3] = &unk_2644F0A80;
  id v22 = v16;
  v23 = self;
  id v19 = v16;
  int v20 = [v18 actionWithTitle:v15 style:0 handler:v21];
  [v19 addAction:v20];

  [(CNFRegSecureAccountWebViewController *)self presentViewController:v19 animated:1 completion:0];
}

uint64_t __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSecureTextEntry:1];
}

uint64_t __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelTapped];
}

void __65__CNFRegSecureAccountWebViewController__showRequestPasswordAlert__block_invoke_3(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) textFields];
  id v12 = [v2 firstObject];

  int v3 = [v12 text];
  id v4 = v3;
  if (v3 && [v3 length])
  {
    [*(id *)(a1 + 40) showSpinner];
    objc_super v5 = [*(id *)(a1 + 40) account];
    uint64_t v6 = [*(id *)(a1 + 40) account];
    v7 = [v6 authorizationID];
    [v5 updateAuthorizationCredentials:v7 token:0];

    uint64_t v8 = [*(id *)(a1 + 40) account];
    [v8 setTemporaryPassword:v4];

    int v9 = [MEMORY[0x263F4A520] sharedInstance];
    id v10 = [*(id *)(a1 + 40) account];
    [v9 activateAccount:v10];

    id v11 = [*(id *)(a1 + 40) account];
    [v11 registerAccount];

    [*(id *)(a1 + 40) _startTimeoutWithDuration:20.0];
  }
  else
  {
    [*(id *)(a1 + 40) _showBadPasswordAlert];
  }
}

- (void)_launchForgotPasswordUrl
{
  id v3 = [MEMORY[0x263F82438] sharedApplication];
  v2 = CNFRegiForgotURL();
  [v3 openURL:v2 withCompletionHandler:0];
}

- (void)_resetSigninFailureCount
{
  self->_signinFailureCount = 0;
}

- (void)_incrementSigninFailureCount
{
  unint64_t signinFailureCount = self->_signinFailureCount;
  if (signinFailureCount != -1) {
    self->_unint64_t signinFailureCount = signinFailureCount + 1;
  }
}

- (void)_showForgotPasswordAlert
{
  int v3 = _os_feature_enabled_impl();
  id v4 = CommunicationsSetupUIBundle();
  objc_super v5 = CNFRegStringTableName();
  if (v3) {
    uint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE_APPLEACCOUNT";
  }
  else {
    uint64_t v6 = @"FACETIME_FORGOT_PASSWORD_ALERT_TITLE";
  }
  v7 = [v4 localizedStringForKey:v6 value:&stru_26D05D4F8 table:v5];

  uint64_t v8 = CommunicationsSetupUIBundle();
  int v9 = CNFRegStringTableName();
  id v10 = [v8 localizedStringForKey:@"FACETIME_FORGOT_PASSWORD_ALERT_MESSAGE" value:&stru_26D05D4F8 table:v9];

  id v11 = CommunicationsSetupUIBundle();
  id v12 = CNFRegStringTableName();
  id v13 = [v11 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v12];

  BOOL v14 = CommunicationsSetupUIBundle();
  BOOL v15 = CNFRegStringTableName();
  v16 = [v14 localizedStringForKey:@"FACETIME_FORGOT_PASSWORD_ALERT_OK" value:&stru_26D05D4F8 table:v15];

  v17 = [MEMORY[0x263F82418] alertControllerWithTitle:v7 message:v10 preferredStyle:1];
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke;
  v21[3] = &unk_2644F0988;
  void v21[4] = self;
  id v18 = [MEMORY[0x263F82400] actionWithTitle:v13 style:1 handler:v21];
  [v17 addAction:v18];

  v20[0] = MEMORY[0x263EF8330];
  v20[1] = 3221225472;
  v20[2] = __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke_2;
  v20[3] = &unk_2644F0988;
  v20[4] = self;
  id v19 = [MEMORY[0x263F82400] actionWithTitle:v16 style:0 handler:v20];
  [v17 addAction:v19];

  [(CNFRegSecureAccountWebViewController *)self presentViewController:v17 animated:1 completion:0];
}

uint64_t __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _showRequestPasswordAlert];
}

uint64_t __64__CNFRegSecureAccountWebViewController__showForgotPasswordAlert__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _launchForgotPasswordUrl];
}

- (id)authIdHeaderValue
{
  v2 = [(CNFRegSecureAccountWebViewController *)self account];
  int v3 = [v2 authorizationID];

  return v3;
}

- (id)authTokenHeaderValue
{
  v2 = [(CNFRegSecureAccountWebViewController *)self account];
  int v3 = [v2 authorizationToken];

  return v3;
}

- (void)_setupAccountHandlers
{
  int v3 = [(CNFRegServerWebViewController *)self regController];
  [v3 removeAllHandlers];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__CNFRegSecureAccountWebViewController__setupAccountHandlers__block_invoke;
  v4[3] = &unk_2644F0B98;
  v4[4] = self;
  [v3 setAccountRegistrationBlock:v4];
}

void __61__CNFRegSecureAccountWebViewController__setupAccountHandlers__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(a1 + 32) account];
  if (v7 == v5 && (uint64_t v8 = *(unsigned char **)(a1 + 32), v8[1056]) && ([v8 timedOut] & 1) == 0)
  {
    int v9 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 1057);

    if (!v9)
    {
      if ([v5 CNFRegSignInComplete])
      {
        if ([*(id *)(a1 + 32) _shouldLog])
        {
          id v10 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)id v11 = 0;
            _os_log_impl(&dword_21ED18000, v10, OS_LOG_TYPE_DEFAULT, "Got new account credentials, reloading page", v11, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
            IMLogString();
          }
        }
        *(unsigned char *)(*(void *)(a1 + 32) + 1057) = 1;
        [*(id *)(a1 + 32) _resetSigninFailureCount];
        [*(id *)(a1 + 32) _stopTimeout];
        [*(id *)(a1 + 32) _reloadDelayed];
      }
      else if ([v5 CNFRegSignInFailed])
      {
        [*(id *)(a1 + 32) _incrementSigninFailureCount];
        [*(id *)(a1 + 32) _stopTimeout];
        [*(id *)(a1 + 32) _showRegistrationFailureWithError:v6];
      }
    }
  }
  else
  {
  }
}

- (IMAccount)account
{
  return self->_account;
}

- (void)setAccount:(id)a3
{
}

- (void).cxx_destruct
{
}

@end