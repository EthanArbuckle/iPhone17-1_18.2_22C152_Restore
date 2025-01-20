@interface CNFAccountRegistrar
- (CNFAccountRegistrar)initWithServiceType:(int64_t)a3 presentationViewController:(id)a4;
- (IMAccount)account;
- (NSTimer)registrationTimer;
- (UIViewController)presentationViewController;
- (id)completionBlock;
- (int64_t)serviceType;
- (void)_accountRegistrationStatusChanged:(id)a3;
- (void)_configureAliasesForAccount:(id)a3;
- (void)_continueRegisteringAuthenticatedAccount:(id)a3;
- (void)_registrationTimerFired:(id)a3;
- (void)_startTimer;
- (void)_stopTimer;
- (void)continueRegistrationForAccount:(id)a3 completionBlock:(id)a4;
- (void)dealloc;
- (void)registerAccountWithUsername:(id)a3 password:(id)a4 service:(id)a5 completionBlock:(id)a6;
- (void)setAccount:(id)a3;
- (void)setCompletionBlock:(id)a3;
- (void)setPresentationViewController:(id)a3;
- (void)setRegistrationTimer:(id)a3;
- (void)setServiceType:(int64_t)a3;
@end

@implementation CNFAccountRegistrar

- (CNFAccountRegistrar)initWithServiceType:(int64_t)a3 presentationViewController:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)CNFAccountRegistrar;
  v7 = [(CNFAccountRegistrar *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(CNFAccountRegistrar *)v7 setServiceType:a3];
    [(CNFAccountRegistrar *)v8 setPresentationViewController:v6];
  }

  return v8;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4 = [MEMORY[0x263F4A568] sharedInstance];
  [v4 removeListenerID:@"CNFAccountRegistrar"];

  v5.receiver = self;
  v5.super_class = (Class)CNFAccountRegistrar;
  [(CNFAccountRegistrar *)&v5 dealloc];
}

- (void)_startTimer
{
  [(CNFAccountRegistrar *)self _stopTimer];
  v3 = [MEMORY[0x263EFFA20] timerWithTimeInterval:self target:sel__registrationTimerFired_ selector:0 userInfo:0 repeats:180.0];
  [(CNFAccountRegistrar *)self setRegistrationTimer:v3];

  id v5 = [MEMORY[0x263EFF9F0] mainRunLoop];
  v4 = [(CNFAccountRegistrar *)self registrationTimer];
  [v5 addTimer:v4 forMode:*MEMORY[0x263EFF478]];
}

- (void)_stopTimer
{
  v3 = [(CNFAccountRegistrar *)self registrationTimer];
  [v3 invalidate];

  [(CNFAccountRegistrar *)self setRegistrationTimer:0];
}

- (void)_configureAliasesForAccount:(id)a3
{
  id v3 = a3;
  v4 = [v3 aliasesToRegister];
  [v3 addAliases:v4];

  id v5 = [v3 aliasesToRegister];
  [v3 validateAliases:v5];

  id v6 = [MEMORY[0x263F3BB18] sharedInstance];
  if ([v6 supportsSMS])
  {
    uint64_t v7 = [v3 accountType];

    if (v7 == 1)
    {
      v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Adding sentinel alias since this is an AppleID account", v9, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
        IMLogString();
      }
      [v3 addAlias:*MEMORY[0x263F4A280]];
    }
  }
  else
  {
  }
}

- (void)_continueRegisteringAuthenticatedAccount:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v27 = (uint64_t)v4;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Continuing registration for authenticated account: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v21 = v4;
    IMLogString();
  }
  if (objc_msgSend(v4, "profileValidationStatus", v21) != 3)
  {
    uint64_t v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = [v4 profileValidationStatus];
      *(_DWORD *)buf = 134217984;
      uint64_t v27 = v8;
      _os_log_impl(&dword_21ED18000, v7, OS_LOG_TYPE_DEFAULT, "Profile is not validated. Current status: %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      uint64_t v22 = [v4 profileValidationStatus];
      IMLogString();
    }
    [(CNFAccountRegistrar *)self _stopTimer];
    v9 = [CNFRegLocaleController alloc];
    objc_super v10 = +[CNFRegController controllerForServiceType:[(CNFAccountRegistrar *)self serviceType]];
    v11 = [(CNFRegFirstRunController *)v9 initWithRegController:v10 account:v4];

    v23[0] = MEMORY[0x263EF8330];
    v23[1] = 3221225472;
    v23[2] = __64__CNFAccountRegistrar__continueRegisteringAuthenticatedAccount___block_invoke;
    v23[3] = &unk_2644F0C18;
    v23[4] = self;
    id v24 = v4;
    [(CNFRegLocaleController *)v11 setCompletionBlock:v23];
    v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21ED18000, v12, OS_LOG_TYPE_DEFAULT, "Showing region chooser.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    id v13 = objc_alloc_init(MEMORY[0x263F5FC30]);
    [(CNFRegLocaleController *)v11 setRootController:v13];
    [(CNFRegLocaleController *)v11 setParentController:v13];
    v14 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:1 target:v11 action:sel_dismiss];
    [(CNFRegFirstRunController *)v11 setCustomLeftButton:v14];
    v15 = (void *)[objc_alloc(MEMORY[0x263F824A8]) initWithBarButtonSystemItem:3 target:0 action:0];
    [(CNFRegFirstRunController *)v11 setCustomRightButton:v15];
    v25 = v11;
    v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v25 count:1];
    [v13 setViewControllers:v16];

    v17 = [(CNFAccountRegistrar *)self presentationViewController];
    v18 = [v17 presentedViewController];

    if (v18)
    {
      v19 = [(CNFAccountRegistrar *)self completionBlock];

      if (!v19)
      {
LABEL_28:

        goto LABEL_29;
      }
      v20 = [(CNFAccountRegistrar *)self completionBlock];
      ((void (**)(void, void, id))v20)[2](v20, 0, v13);
    }
    else
    {
      v20 = [(CNFAccountRegistrar *)self presentationViewController];
      [v20 presentModalViewController:v13 withTransition:3];
    }

    goto LABEL_28;
  }
  id v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Profile is validated. Continuing on with registration.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFAccountRegistrar *)self _configureAliasesForAccount:v4];
  [v4 registerAccount];
LABEL_29:
}

void __64__CNFAccountRegistrar__continueRegisteringAuthenticatedAccount___block_invoke(uint64_t a1, int a2)
{
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21ED18000, v4, OS_LOG_TYPE_DEFAULT, "Region chooser completed.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  if (a2)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)objc_super v10 = 0;
      _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Success setting region. Continuing on with registration", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (IMShouldLog()) {
        IMLogString();
      }
    }
    [*(id *)(a1 + 32) _startTimer];
    [*(id *)(a1 + 32) _configureAliasesForAccount:*(void *)(a1 + 40)];
    [*(id *)(a1 + 40) registerAccount];
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Failure setting region. Unregistering and calling out to completion block", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
    uint64_t v7 = [*(id *)(a1 + 32) completionBlock];

    if (v7)
    {
      [*(id *)(a1 + 40) unregisterAccount];
      uint64_t v8 = [*(id *)(a1 + 32) completionBlock];
      v8[2](v8, 0, 0);
    }
  }
}

- (void)continueRegistrationForAccount:(id)a3 completionBlock:(id)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v13 = v6;
    _os_log_impl(&dword_21ED18000, v8, OS_LOG_TYPE_DEFAULT, "Continuing registration for account: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
  {
    id v11 = v6;
    IMLogString();
  }
  -[CNFAccountRegistrar setAccount:](self, "setAccount:", v6, v11);
  [(CNFAccountRegistrar *)self setCompletionBlock:v7];
  v9 = [MEMORY[0x263F08A00] defaultCenter];
  [v9 removeObserver:self];
  [v9 addObserver:self selector:sel__accountRegistrationStatusChanged_ name:*MEMORY[0x263F4A458] object:0];
  objc_super v10 = [MEMORY[0x263F4A520] sharedInstance];
  [v10 activateAccount:v6];

  if ([v6 registrationStatus] > 1)
  {
    if ([v6 registrationStatus] == 3) {
      [(CNFAccountRegistrar *)self _continueRegisteringAuthenticatedAccount:v6];
    }
  }
  else
  {
    [v6 authenticateAccount];
  }
  [(CNFAccountRegistrar *)self _startTimer];
}

- (void)registerAccountWithUsername:(id)a3 password:(id)a4 service:(id)a5 completionBlock:(id)a6
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v10 && v11 && v12)
  {
    uint64_t v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v12;
      _os_log_impl(&dword_21ED18000, v14, OS_LOG_TYPE_DEFAULT, "Registering account: %@ (service: %@)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
    {
      id v17 = v10;
      id v18 = v12;
      IMLogString();
    }
    -[CNFAccountRegistrar setCompletionBlock:](self, "setCompletionBlock:", v13, v17, v18);
    v15 = [MEMORY[0x263F08A00] defaultCenter];
    [v15 addObserver:self selector:sel__accountRegistrationStatusChanged_ name:*MEMORY[0x263F4A458] object:0];
    v21[0] = MEMORY[0x263EF8330];
    v21[1] = 3221225472;
    v21[2] = __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke;
    v21[3] = &unk_2644F0C40;
    id v22 = v12;
    id v23 = v10;
    id v24 = v11;
    v25 = self;
    v16 = (void (**)(void))MEMORY[0x223C3AA40](v21);
    if ([MEMORY[0x263F08B88] isMainThread])
    {
      v16[2](v16);
    }
    else
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke_2;
      block[3] = &unk_2644F0C68;
      v20 = v16;
      dispatch_sync(MEMORY[0x263EF83A0], block);
    }
    [(CNFAccountRegistrar *)self _startTimer];
  }
}

void __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263F4A568] sharedInstance];
  [v2 addListenerID:@"CNFAccountRegistrar" capabilities:*MEMORY[0x263F4A888]];

  id v3 = [MEMORY[0x263F4A568] sharedInstance];
  [v3 blockUntilConnected];

  id v6 = (id)[objc_alloc(MEMORY[0x263F4A518]) initWithService:*(void *)(a1 + 32)];
  [v6 setLogin:*(void *)(a1 + 40)];
  [v6 setAutoLogin:1];
  id v4 = [MEMORY[0x263F4A520] sharedInstance];
  [v4 addAccount:v6];

  [v6 updateAuthorizationCredentials:0 token:0];
  [v6 setTemporaryPassword:*(void *)(a1 + 48)];
  id v5 = [MEMORY[0x263F4A520] sharedInstance];
  [v5 activateAccount:v6];

  [v6 authenticateAccount];
  [*(id *)(a1 + 56) setAccount:v6];
}

uint64_t __84__CNFAccountRegistrar_registerAccountWithUsername_password_service_completionBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_registrationTimerFired:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v24 = 0;
    _os_log_impl(&dword_21ED18000, v5, OS_LOG_TYPE_DEFAULT, "Timed out internally, waiting on registration. Forcing failed state.", v24, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  [(CNFAccountRegistrar *)self _stopTimer];
  id v6 = [MEMORY[0x263F08A00] defaultCenter];
  [v6 removeObserver:self];

  id v7 = [MEMORY[0x263F4A520] sharedInstance];
  uint64_t v8 = [(CNFAccountRegistrar *)self account];
  [v7 deactivateAccount:v8];

  v9 = [MEMORY[0x263F4A520] sharedInstance];
  id v10 = [(CNFAccountRegistrar *)self account];
  [v9 deleteAccount:v10];

  [(CNFAccountRegistrar *)self setAccount:0];
  id v11 = [(CNFAccountRegistrar *)self completionBlock];

  if (v11)
  {
    id v12 = CommunicationsSetupUIBundle();
    id v13 = CNFRegStringTableName();
    uint64_t v14 = [v12 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v13];

    v15 = CommunicationsSetupUIBundle();
    v16 = CNFRegStringTableName();
    id v17 = [v15 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_GENERIC" value:&stru_26D05D4F8 table:v16];

    id v18 = CommunicationsSetupUIBundle();
    v19 = CNFRegStringTableName();
    v20 = [v18 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v19];

    id v21 = [MEMORY[0x263F82418] alertControllerWithTitle:v14 message:v17 preferredStyle:1];
    id v22 = [MEMORY[0x263F82400] actionWithTitle:v20 style:0 handler:0];
    [v21 addAction:v22];

    id v23 = [(CNFAccountRegistrar *)self completionBlock];
    ((void (**)(void, void, void *))v23)[2](v23, 0, v21);
  }
  if (_registrationTimerFired__onceToken != -1) {
    dispatch_once(&_registrationTimerFired__onceToken, &__block_literal_global_7);
  }
}

void __47__CNFAccountRegistrar__registrationTimerFired___block_invoke()
{
}

void __47__CNFAccountRegistrar__registrationTimerFired___block_invoke_2()
{
  v0 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_21ED18000, v0, OS_LOG_TYPE_DEFAULT, "First time we've timed out internally for this process.  Forcing imagent death.", v2, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
    IMLogString();
  }
  v1 = [MEMORY[0x263F4A568] sharedInstance];
  [v1 killDaemon];
}

- (void)_accountRegistrationStatusChanged:(id)a3
{
  uint64_t v101 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = [(CNFAccountRegistrar *)self account];

  unint64_t v7 = 0x263F08000uLL;
  if (v5 == v6)
  {
    switch([v5 registrationStatus])
    {
      case -1:
        v9 = CommunicationsSetupUIBundle();
        id v10 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
        id v11 = [v9 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v10];

        id v12 = CommunicationsSetupUIBundle();
        id v13 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
        uint64_t v14 = [v12 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v13];

        v15 = CommunicationsSetupUIBundle();
        v16 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
        v89 = [v15 localizedStringForKey:@"FACETIME_ALERT_OK" value:&stru_26D05D4F8 table:v16];

        uint64_t v17 = [v5 registrationFailureReason];
        v90 = [v5 registrationFailureAlertInfo];
        id v18 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v19 = [NSNumber numberWithInteger:v17];
          *(_DWORD *)buf = 138412802;
          v96 = v5;
          __int16 v97 = 2112;
          v98 = v19;
          __int16 v99 = 2112;
          v100 = v90;
          _os_log_impl(&dword_21ED18000, v18, OS_LOG_TYPE_DEFAULT, "Account (%@) failed with failure reason: %@ and alert info %@.", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog())
        {
          v85 = [NSNumber numberWithInteger:v17];
          v86 = v90;
          v84 = v5;
          IMLogString();
        }
        BOOL v88 = v90 == 0;
        if (v90)
        {
          v20 = [v90 objectForKey:*MEMORY[0x263F4A448]];
          id v21 = v20;
          if (v20)
          {
            id v87 = v20;
          }
          else
          {
            v45 = CommunicationsSetupUIBundle();
            v46 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
            id v87 = [v45 localizedStringForKey:@"FACETIME_ACTIVATION_ERROR_TITLE" value:&stru_26D05D4F8 table:v46];

            id v11 = v45;
          }

          v47 = [v90 objectForKey:*MEMORY[0x263F4A440]];
          v48 = v47;
          if (v47)
          {
            id v35 = v47;
          }
          else
          {
            v49 = CommunicationsSetupUIBundle();
            v50 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
            id v35 = [v49 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_GENERIC" value:&stru_26D05D4F8 table:v50];

            uint64_t v14 = v49;
          }

          v51 = [v90 objectForKey:*MEMORY[0x263F4A438]];
          v52 = v51;
          if (v51)
          {
            id v38 = v51;
            v53 = v89;
          }
          else
          {
            v53 = CommunicationsSetupUIBundle();
            v54 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
            id v38 = [v53 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v54];
          }
          v39 = [v90 objectForKey:*MEMORY[0x263F4A420]];
          v44 = [v39 valueForKey:*MEMORY[0x263F4A418]];
          v43 = [v39 valueForKey:*MEMORY[0x263F4A430]];
          v40 = [v39 valueForKey:*MEMORY[0x263F4A428]];
          BOOL v42 = [v40 integerValue] == 1;
          goto LABEL_59;
        }
        if (!_os_feature_enabled_impl()) {
          goto LABEL_50;
        }
        if (v17 == 28)
        {
          v78 = CommunicationsSetupUIBundle();
          v79 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          id v87 = [v78 localizedStringForKey:@"MESSAGES_ACTIVATION_ERROR_TITLE_VERBOSE" value:&stru_26D05D4F8 table:v79];

          v80 = CommunicationsSetupUIBundle();
          v81 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          id v35 = [v80 localizedStringForKey:@"UPDATE_APPLEID_ERROR_MESSAGE" value:&stru_26D05D4F8 table:v81];

          v82 = CommunicationsSetupUIBundle();
          v83 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          id v38 = [v82 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v83];

          v39 = CommunicationsSetupUIBundle();
          v40 = CNFRegStringTableName();
          uint64_t v41 = [v39 localizedStringForKey:@"UPDATE_APPLEID_ERROR_ACTION" value:&stru_26D05D4F8 table:v40];
        }
        else
        {
          if (v17 != 29)
          {
LABEL_50:
            BOOL v42 = 0;
            BOOL v88 = 0;
            v43 = 0;
            v44 = 0;
LABEL_60:
            id v29 = objc_msgSend(MEMORY[0x263F82418], "alertControllerWithTitle:message:preferredStyle:", v11, v14, 1, v84, v85, v86);
            if (v43) {
              BOOL v55 = v42;
            }
            else {
              BOOL v55 = 0;
            }
            if (v55)
            {
              v56 = (void *)MEMORY[0x263F82400];
              v92[0] = MEMORY[0x263EF8330];
              v92[1] = 3221225472;
              v92[2] = __57__CNFAccountRegistrar__accountRegistrationStatusChanged___block_invoke_180;
              v92[3] = &unk_2644F0CB0;
              v93 = v43;
              BOOL v94 = v88;
              v57 = [v56 actionWithTitle:v44 style:0 handler:v92];
              [v29 addAction:v57];
            }
            v58 = [MEMORY[0x263F82400] actionWithTitle:v89 style:1 handler:0];
            [v29 addAction:v58];

            goto LABEL_66;
          }
          v31 = CommunicationsSetupUIBundle();
          v32 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          id v87 = [v31 localizedStringForKey:@"MESSAGES_ACTIVATION_ERROR_TITLE_VERBOSE" value:&stru_26D05D4F8 table:v32];

          v33 = CommunicationsSetupUIBundle();
          v34 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          id v35 = [v33 localizedStringForKey:@"WAITING_FOR_ICLOUD_ERROR_MESSAGE" value:&stru_26D05D4F8 table:v34];

          v36 = CommunicationsSetupUIBundle();
          v37 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          id v38 = [v36 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v37];

          v39 = CommunicationsSetupUIBundle();
          v40 = CNFRegStringTableNameForServiceType([(CNFAccountRegistrar *)self serviceType]);
          uint64_t v41 = [v39 localizedStringForKey:@"WAITING_FOR_ICLOUD_ERROR_ACTION" value:&stru_26D05D4F8 table:v40];
        }
        v44 = (void *)v41;
        v43 = @"prefs:root=APPLE_ACCOUNT&path=TRANSPARENCY";
        BOOL v42 = 1;
LABEL_59:

        v89 = v38;
        uint64_t v14 = v35;
        id v11 = v87;
        goto LABEL_60;
      case 0:
        id v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v22, OS_LOG_TYPE_DEFAULT, "Account is unknown.", buf, 2u);
        }

        unint64_t v7 = 0x263F08000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          goto LABEL_39;
        }
        break;
      case 1:
        id v23 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v23, OS_LOG_TYPE_DEFAULT, "Account is unregistered.", buf, 2u);
        }

        unint64_t v7 = 0x263F08000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          goto LABEL_39;
        }
        break;
      case 2:
        id v24 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v24, OS_LOG_TYPE_DEFAULT, "Account is authenticating.", buf, 2u);
        }

        unint64_t v7 = 0x263F08000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          goto LABEL_39;
        }
        break;
      case 3:
        v25 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v25, OS_LOG_TYPE_DEFAULT, "Account is authenticated.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        v26 = [v5 aliasesToRegister];
        if ([v26 count] || (objc_msgSend(v5, "canSendMessages") & 1) != 0)
        {
          [(CNFAccountRegistrar *)self _continueRegisteringAuthenticatedAccount:v5];
        }
        else
        {
          v63 = CommunicationsSetupUIBundle();
          v64 = CNFRegStringTableName();
          v91 = [v63 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_TITLE" value:&stru_26D05D4F8 table:v64];

          v65 = CommunicationsSetupUIBundle();
          v66 = CNFRegStringTableName();
          v67 = [v65 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_MESSAGE" value:&stru_26D05D4F8 table:v66];

          v68 = CommunicationsSetupUIBundle();
          v69 = CNFRegStringTableName();
          v70 = [v68 localizedStringForKey:@"FACETIME_SIGNIN_ERROR_NO_VALID_ALIASES_ACTION_TITLE" value:&stru_26D05D4F8 table:v69];

          v71 = CommunicationsSetupUIBundle();
          v72 = CNFRegStringTableName();
          v73 = [v71 localizedStringForKey:@"FACETIME_ALERT_CANCEL" value:&stru_26D05D4F8 table:v72];

          id v29 = [MEMORY[0x263F82418] alertControllerWithTitle:v91 message:v67 preferredStyle:1];
          v74 = [MEMORY[0x263F82400] actionWithTitle:v70 style:0 handler:&__block_literal_global_144];
          [v29 addAction:v74];

          v75 = [MEMORY[0x263F82400] actionWithTitle:v73 style:1 handler:0];
          [v29 addAction:v75];

          [(CNFAccountRegistrar *)self setAccount:0];
          v76 = [MEMORY[0x263F4A520] sharedInstance];
          [v76 deactivateAccount:v5];

          v77 = [MEMORY[0x263F4A520] sharedInstance];
          [v77 deleteAccount:v5];

LABEL_66:
          uint64_t v30 = 0;
LABEL_67:
          v59 = [(CNFAccountRegistrar *)self registrationTimer];
          [v59 invalidate];

          [(CNFAccountRegistrar *)self setRegistrationTimer:0];
          v60 = [(CNFAccountRegistrar *)self completionBlock];

          if (v60)
          {
            v61 = [(CNFAccountRegistrar *)self completionBlock];
            ((void (**)(void, uint64_t, void *))v61)[2](v61, v30, v29);
          }
          [(CNFAccountRegistrar *)self setAccount:0];
          v62 = [MEMORY[0x263F08A00] defaultCenter];
          [v62 removeObserver:self];
        }
        unint64_t v7 = 0x263F08000;
        break;
      case 4:
        id v27 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v27, OS_LOG_TYPE_DEFAULT, "Account is registering.", buf, 2u);
        }

        unint64_t v7 = 0x263F08000;
        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
LABEL_39:
        }
          IMLogString();
        break;
      case 5:
        __int16 v28 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21ED18000, v28, OS_LOG_TYPE_DEFAULT, "Account is registered.", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
          IMLogString();
        }
        id v29 = 0;
        uint64_t v30 = 1;
        goto LABEL_67;
      default:
        break;
    }
  }
  uint64_t v8 = [*(id *)(v7 + 2560) defaultCenter];
  [v8 postNotificationName:@"CNFAccountRegistarStateChangedNotification" object:0];
}

void __57__CNFAccountRegistrar__accountRegistrationStatusChanged___block_invoke()
{
  id v1 = [MEMORY[0x263F82438] sharedApplication];
  v0 = [NSURL URLWithString:@"https://appleid.apple.com"];
  [v1 openURL:v0 withCompletionHandler:0];
}

void __57__CNFAccountRegistrar__accountRegistrationStatusChanged___block_invoke_180(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [NSURL URLWithString:*(void *)(a1 + 32)];
  if (v4)
  {
    if (*(unsigned char *)(a1 + 40))
    {
      id v5 = [MEMORY[0x263F01880] defaultWorkspace];
      [v5 openSensitiveURL:v4 withOptions:0];
    }
    else
    {
      id v5 = [MEMORY[0x263F82438] sharedApplication];
      [v5 openURL:v4 withCompletionHandler:0];
    }
  }
  else
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      uint64_t v9 = v7;
      _os_log_impl(&dword_21ED18000, v6, OS_LOG_TYPE_DEFAULT, "Invalid action URL %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && IMShouldLog()) {
      IMLogString();
    }
  }
}

- (id)completionBlock
{
  return objc_getProperty(self, a2, 8, 1);
}

- (void)setCompletionBlock:(id)a3
{
}

- (IMAccount)account
{
  return (IMAccount *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAccount:(id)a3
{
}

- (NSTimer)registrationTimer
{
  return (NSTimer *)objc_getProperty(self, a2, 24, 1);
}

- (void)setRegistrationTimer:(id)a3
{
}

- (int64_t)serviceType
{
  return self->_serviceType;
}

- (void)setServiceType:(int64_t)a3
{
  self->_serviceType = a3;
}

- (UIViewController)presentationViewController
{
  return (UIViewController *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPresentationViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationViewController, 0);
  objc_storeStrong((id *)&self->_registrationTimer, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong(&self->_completionBlock, 0);
}

@end