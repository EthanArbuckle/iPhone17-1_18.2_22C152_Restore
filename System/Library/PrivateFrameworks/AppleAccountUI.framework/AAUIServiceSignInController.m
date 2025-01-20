@interface AAUIServiceSignInController
- (AAUIServiceSignInConfiguration)signInConfig;
- (AAUIServiceSignInController)initWithSignInConfiguration:(id)a3;
- (AAUISignInFlowControllerDelegate)flowControllerDelegate;
- (AAUISignInViewController)signInViewController;
- (AIDAServiceOwnerProtocol)serviceOwnersManager;
- (AKAppleIDAuthenticationController)authenticationController;
- (AKURLBag)akURLBag;
- (BOOL)_allowsAccountCreation;
- (BOOL)_isAuthenticatingPrimary:(id)a3;
- (BOOL)_showsServiceIcons;
- (id)_alertControllerForReusingAccount:(id)a3 serviceType:(id)a4 inViewController:(id)a5 completion:(id)a6;
- (id)_serviceContextForCloudAndInactiveStoreWithAuthResults:(id)a3 parentViewController:(id)a4;
- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4;
- (id)_serviceOwnersManager;
- (id)_spinnerMessageForService:(id)a3;
- (id)_spinnerViewController;
- (void)_attemptReauthAndSignInToServices;
- (void)_attemptSignInForServices:(id)a3 serviceContext:(id)a4;
- (void)_authenticateExistingAccount:(id)a3 serviceType:(id)a4 inViewController:(id)a5 completion:(id)a6;
- (void)_commonInit;
- (void)_delegate_serviceSignInControllerDidCancel;
- (void)_delegate_signInControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4;
- (void)_mainQueue_continueSignInWithAuthenticationResults:(id)a3 parentViewController:(id)a4;
- (void)_mainQueue_presentAlertForError:(id)a3 inViewController:(id)a4 completion:(id)a5;
- (void)_mainQueue_presentContinueUsingInViewController:(id)a3 account:(id)a4 serviceType:(id)a5 completion:(id)a6;
- (void)_mainQueue_presentSpinnerViewControllerInParentViewController:(id)a3 withCompletion:(id)a4;
- (void)_prepareToSignInForServices:(id)a3 withAuthenticationResults:(id)a4 parentViewController:(id)a5;
- (void)_setInitialViewController:(id)a3;
- (void)continueSignInWithAuthenticationResults:(id)a3 viewController:(id)a4 completion:(id)a5;
- (void)controllerFinishedWithAIDAResults:(id)a3;
- (void)loadViewControllerForPresentation;
- (void)prepareInViewController:(id)a3 completion:(id)a4;
- (void)setAkURLBag:(id)a3;
- (void)setAuthenticationController:(id)a3;
- (void)setFlowControllerDelegate:(id)a3;
- (void)setServiceOwnersManager:(id)a3;
- (void)setSignInConfig:(id)a3;
- (void)setSignInViewController:(id)a3;
- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4;
- (void)signInViewControllerDidCancel:(id)a3;
- (void)signInViewControllerDidSelectChildSignIn:(id)a3;
- (void)signInViewControllerDidSelectOtherOptions:(id)a3;
- (void)signInViewControllerDidSkip:(id)a3;
- (void)startSplitAcountSignInFlow;
- (void)willAuthenticateWithContext:(id)a3;
@end

@implementation AAUIServiceSignInController

- (AAUIServiceSignInController)initWithSignInConfiguration:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)AAUIServiceSignInController;
  v6 = [(AAUIServiceSignInController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_signInConfig, a3);
    [(AAUIServiceSignInController *)v7 _commonInit];
  }

  return v7;
}

- (void)_commonInit
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v3 = [a1 userPersonaNickName];
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_209754000, a2, OS_LOG_TYPE_DEBUG, "Initializing AAUIServiceSignInController with persona type %@", v4, 0xCu);
}

- (void)loadViewControllerForPresentation
{
  v3 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
  v4 = [v3 navigationBar];
  [v4 setAccessibilityIdentifier:@"sign-in-nav-bar"];

  if ([(AAUIServiceSignInConfiguration *)self->_signInConfig newSignInReauth]
    && ([(AAUIServiceSignInConfiguration *)self->_signInConfig username],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "Service sign in configuration signaled for reauth.", buf, 2u);
    }

    v7 = [(AAUIServiceSignInController *)self _spinnerViewController];
    [(AAUIServiceSignInController *)self _setInitialViewController:v7];

    [(AAUIServiceSignInController *)self _attemptReauthAndSignInToServices];
  }
  else
  {
    v8 = [(AAUIServiceSignInConfiguration *)self->_signInConfig authenticationResults];

    objc_super v9 = _AAUILogSystem();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Continuing sign in with authentication results...", v15, 2u);
      }

      v11 = [(AAUIServiceSignInController *)self _spinnerViewController];
      [(AAUIServiceSignInController *)self _setInitialViewController:v11];

      v12 = [(AAUIServiceSignInConfiguration *)self->_signInConfig authenticationResults];
      v13 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
      [(AAUIServiceSignInController *)self _mainQueue_continueSignInWithAuthenticationResults:v12 parentViewController:v13];
    }
    else
    {
      if (v10)
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "No authentication results found, displaying sign in...", v14, 2u);
      }

      v12 = [(AAUIServiceSignInController *)self signInViewController];
      [(AAUIServiceSignInController *)self _setInitialViewController:v12];
    }
  }
}

- (void)_setInitialViewController:(id)a3
{
  v12[1] = *MEMORY[0x263EF8340];
  signInConfig = self->_signInConfig;
  id v5 = a3;
  v6 = [(AAUIServiceSignInConfiguration *)signInConfig navigationController];
  v7 = [v6 viewControllers];
  uint64_t v8 = [v7 count];

  objc_super v9 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
  id v11 = v9;
  if (v8)
  {
    [v9 pushViewController:v5 animated:1];
  }
  else
  {
    v12[0] = v5;
    BOOL v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:1];

    [v11 setViewControllers:v10 animated:0];
  }
}

- (void)_attemptReauthAndSignInToServices
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke;
  aBlock[3] = &unk_263F92F30;
  aBlock[4] = self;
  v3 = _Block_copy(aBlock);
  v4 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [(id)objc_opt_class() supportedServices];
  uint64_t v5 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    v16 = v3;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        BOOL v10 = objc_msgSend(v4, "accountForService:", v9, v16);
        id v11 = [v10 username];
        v12 = [(AAUIServiceSignInConfiguration *)self->_signInConfig username];
        int v13 = [v11 isEqualToString:v12];

        if (v13)
        {
          v14 = _AAUILogSystem();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v24 = v9;
            _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Found account for service %{public}@, prompting for sign in...", buf, 0xCu);
          }

          v15 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
          v3 = v16;
          [(AAUIServiceSignInController *)self _authenticateExistingAccount:v10 serviceType:v9 inViewController:v15 completion:v16];

          goto LABEL_13;
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v25 count:16];
      v3 = v16;
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

void __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (a3)
  {
    uint64_t v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke_cold_1();
    }

    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
    uint64_t v8 = [*(id *)(a1 + 32) signInViewController];
    [v7 pushViewController:v8 animated:1];
  }
  else
  {
    [*(id *)(*(void *)(a1 + 32) + 88) setAuthenticationResults:v5];
    uint64_t v9 = *(id **)(a1 + 32);
    BOOL v10 = [v9[11] authenticationResults];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
    objc_msgSend(v9, "_mainQueue_continueSignInWithAuthenticationResults:parentViewController:", v10, v11);
  }
}

- (id)_serviceOwnersManager
{
  serviceOwnersManager = self->_serviceOwnersManager;
  if (!serviceOwnersManager)
  {
    id v4 = objc_alloc_init(MEMORY[0x263EFB210]);
    id v5 = (AIDAServiceOwnerProtocol *)[objc_alloc(MEMORY[0x263F26D88]) initWithAccountStore:v4];
    uint64_t v6 = self->_serviceOwnersManager;
    self->_serviceOwnersManager = v5;

    serviceOwnersManager = self->_serviceOwnersManager;
  }
  return serviceOwnersManager;
}

- (AKAppleIDAuthenticationController)authenticationController
{
  authenticationController = self->_authenticationController;
  if (authenticationController) {
    v3 = authenticationController;
  }
  else {
    v3 = (AKAppleIDAuthenticationController *)objc_alloc_init(MEMORY[0x263F29118]);
  }
  return v3;
}

- (id)_spinnerMessageForService:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_18;
  }
  if ([v3 isEqualToString:*MEMORY[0x263F26D28]])
  {
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (([@"SIGN_IN_SPINNER_LABEL_ICLOUD" containsString:@"REBRAND"] & 1) == 0
      && (_os_feature_enabled_impl() & 1) != 0)
    {
      uint64_t v6 = @"SIGN_IN_SPINNER_LABEL_ICLOUD";
LABEL_21:
      BOOL v10 = [(__CFString *)v6 stringByAppendingString:@"_REBRAND"];
      id v11 = [v5 localizedStringForKey:v10 value:&stru_26BD39CD8 table:@"Localizable"];

      goto LABEL_25;
    }
    uint64_t v8 = @"SIGN_IN_SPINNER_LABEL_ICLOUD";
LABEL_23:
    uint64_t v7 = v5;
    goto LABEL_24;
  }
  if (![v4 isEqualToString:*MEMORY[0x263F26D48]])
  {
    if ([v4 isEqualToString:*MEMORY[0x263F26D40]])
    {
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v7;
      uint64_t v8 = @"SIGN_IN_SPINNER_LABEL_IMESSAGE";
      goto LABEL_24;
    }
    if ([v4 isEqualToString:*MEMORY[0x263F26D30]])
    {
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v7;
      uint64_t v8 = @"SIGN_IN_SPINNER_LABEL_FACETIME";
      goto LABEL_24;
    }
    if ([v4 isEqualToString:*MEMORY[0x263F26D38]])
    {
      uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
      id v5 = v7;
      uint64_t v8 = @"SIGN_IN_SPINNER_LABEL_GAMECENTER";
      goto LABEL_24;
    }
    uint64_t v9 = _AAUILogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[AAUIServiceSignInController _spinnerMessageForService:]();
    }

LABEL_18:
    id v5 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    if (([@"SIGN_IN_SPINNER_LABEL" containsString:@"REBRAND"] & 1) == 0
      && (_os_feature_enabled_impl() & 1) != 0)
    {
      uint64_t v6 = @"SIGN_IN_SPINNER_LABEL";
      goto LABEL_21;
    }
    uint64_t v8 = @"SIGN_IN_SPINNER_LABEL";
    goto LABEL_23;
  }
  uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  id v5 = v7;
  uint64_t v8 = @"SIGN_IN_SPINNER_LABEL_STORE";
LABEL_24:
  id v11 = [v7 localizedStringForKey:v8 value:&stru_26BD39CD8 table:@"Localizable"];
LABEL_25:

  return v11;
}

- (id)_spinnerViewController
{
  spinnerViewController = self->_spinnerViewController;
  if (!spinnerViewController)
  {
    if (+[AAUIFeatureFlags isNewSignInProgressEnabled])
    {
      id v4 = +[AAUISpinnerViewController newSignInProgressViewWithFullName:&stru_26BD39CD8];
    }
    else
    {
      id v4 = objc_alloc_init(AAUISpinnerViewController);
      id v5 = [(AAUISpinnerViewController *)v4 label];
      uint64_t v6 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
      uint64_t v7 = [(AAUIServiceSignInController *)self _spinnerMessageForService:v6];
      [v5 setText:v7];
    }
    uint64_t v8 = self->_spinnerViewController;
    self->_spinnerViewController = &v4->super;

    spinnerViewController = self->_spinnerViewController;
  }
  return spinnerViewController;
}

- (BOOL)_showsServiceIcons
{
  uint64_t v3 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  if (!v3) {
    return 1;
  }
  id v4 = (void *)v3;
  BOOL v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig splitSignIn];

  return v5;
}

- (BOOL)_allowsAccountCreation
{
  uint64_t v3 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
  uint64_t v4 = [v3 count];

  BOOL v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
  if ([v5 count] == 1)
  {
    uint64_t v6 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
    uint64_t v7 = [v6 objectAtIndexedSubscript:0];
    BOOL v8 = v7 == (void *)*MEMORY[0x263F26D28];
  }
  else
  {
    BOOL v8 = 0;
  }

  return !v4 || v8;
}

- (BOOL)_isAuthenticatingPrimary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  if (v5
    && (uint64_t v6 = (void *)v5,
        [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        int v8 = [v7 isEqualToString:v4],
        v7,
        v6,
        !v8))
  {
    BOOL v11 = 0;
  }
  else
  {
    uint64_t v9 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
    BOOL v10 = [v9 accountForService:v4];

    BOOL v11 = v10 == 0;
  }

  return v11;
}

- (id)_serviceContextWithResults:(id)a3 parentViewController:(id)a4
{
  id v6 = a3;
  signInConfig = self->_signInConfig;
  id v8 = a4;
  uint64_t v9 = [(AAUIServiceSignInConfiguration *)signInConfig serviceContext];

  if (v9
    && ([(AAUIServiceSignInConfiguration *)self->_signInConfig serviceContext],
        BOOL v10 = objc_claimAutoreleasedReturnValue(),
        id v11 = (id)[v10 mutableCopy],
        v10,
        v11))
  {
    v12 = _AAUILogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[AAUIServiceSignInController _serviceContextWithResults:parentViewController:]();
    }

    char v13 = 0;
  }
  else
  {
    id v11 = objc_alloc_init(MEMORY[0x263F26D78]);
    objc_msgSend(v11, "setShouldForceOperation:", -[AAUIServiceSignInConfiguration shouldForceOperation](self->_signInConfig, "shouldForceOperation"));
    char v13 = 1;
  }
  [v11 setAuthenticationResults:v6];
  objc_msgSend(v11, "setOperationUIPermissions:", -[AAUIServiceSignInConfiguration aidaOperationUIPermissions](self->_signInConfig, "aidaOperationUIPermissions"));
  [v11 setViewController:v8];

  id v14 = objc_alloc(MEMORY[0x263F34A10]);
  v15 = [v11 viewController];
  v16 = (CDPUIController *)[v14 initWithPresentingViewController:v15];
  cdpUIController = self->_cdpUIController;
  self->_cdpUIController = v16;

  [(CDPUIController *)self->_cdpUIController setForceInlinePresentation:1];
  [v11 setCdpUiProvider:self->_cdpUIController];
  long long v18 = [v11 signInContexts];
  long long v19 = v18;
  if (v13)
  {
    long long v20 = (void *)[v18 mutableCopy];
    long long v21 = v20;
    if (v20) {
      id v22 = v20;
    }
    else {
      id v22 = (id)objc_opt_new();
    }
    v25 = v22;

    uint64_t v26 = [AAUISignInFlowControllerDelegate alloc];
    v27 = [v11 viewController];
    v28 = [(AAUISignInFlowControllerDelegate *)v26 initWithPresentingViewController:v27];
    flowControllerDelegate = self->_flowControllerDelegate;
    self->_flowControllerDelegate = v28;

    [(AAUISignInFlowControllerDelegate *)self->_flowControllerDelegate setProgressViewAlreadyPresented:self->_spinnerViewController != 0];
    [v25 setObject:self->_flowControllerDelegate forKeyedSubscript:*MEMORY[0x263F26D28]];
    [v11 setSignInContexts:v25];
  }
  else
  {
    v23 = [v18 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
    uint64_t v24 = self->_flowControllerDelegate;
    self->_flowControllerDelegate = v23;

    v25 = [v11 viewController];
    [(AAUISignInFlowControllerDelegate *)self->_flowControllerDelegate setPresentingViewController:v25];
  }

  v30 = [(AAUIServiceSignInConfiguration *)self->_signInConfig localSecret];
  if (v30)
  {
  }
  else if (![(AAUIServiceSignInConfiguration *)self->_signInConfig isAttemptingBackupRestore])
  {
    goto LABEL_19;
  }
  v31 = (void *)[objc_alloc(MEMORY[0x263F34350]) initWithAuthenticationResults:v6];
  objc_msgSend(v31, "setIsAttemptingBackupRestore:", -[AAUIServiceSignInConfiguration isAttemptingBackupRestore](self->_signInConfig, "isAttemptingBackupRestore"));
  v32 = [(AAUIServiceSignInConfiguration *)self->_signInConfig localSecret];

  if (v32)
  {
    v33 = [(AAUIServiceSignInConfiguration *)self->_signInConfig localSecret];
    v34 = [v33 validatedSecret];
    [v31 setCachedLocalSecret:v34];

    v35 = [(AAUIServiceSignInConfiguration *)self->_signInConfig localSecret];
    objc_msgSend(v31, "setCachedLocalSecretType:", objc_msgSend(v35, "secretType"));
  }
  [(AAUISignInFlowControllerDelegate *)self->_flowControllerDelegate setCdpContext:v31];

LABEL_19:
  return v11;
}

- (AAUISignInViewController)signInViewController
{
  signInViewController = self->_signInViewController;
  if (signInViewController) {
    goto LABEL_14;
  }
  [MEMORY[0x263F25908] verifyAndFixPersonaIfNeeded:self->_originalPersona desiredContext:self->_originalPersonaContext];
  id v4 = objc_alloc_init(AAUISignInViewController);
  uint64_t v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  [(AAUISignInViewController *)v4 _setAkServiceType:AKServiceTypeFromAIDAServiceType(v5)];

  id v6 = [(AAUIServiceSignInConfiguration *)self->_signInConfig username];
  [(AAUISignInViewController *)v4 setUsername:v6];

  uint64_t v7 = [(AAUIServiceSignInConfiguration *)self->_signInConfig privacyLinkIdentifiers];
  [(AAUISignInViewController *)v4 setPrivacyLinkIdentifiers:v7];

  [(AAUISignInViewController *)v4 setAllowSkip:[(AAUIServiceSignInConfiguration *)self->_signInConfig allowSkip]];
  [(AAUISignInViewController *)v4 setShouldShowSystemBackButton:[(AAUIServiceSignInConfiguration *)self->_signInConfig shouldShowSystemBackButton]];
  [(AAUISignInViewController *)v4 setHidesBackOrCancelButton:[(AAUIServiceSignInConfiguration *)self->_signInConfig hidesBackOrCancelButton]];
  if (![(AAUIServiceSignInConfiguration *)self->_signInConfig canEditUsername])
  {
    [(AAUISignInViewController *)v4 setCanEditUsername:0];
    goto LABEL_6;
  }
  if ([(AAUIServiceSignInConfiguration *)self->_signInConfig shouldDisableAccountCreation])
  {
LABEL_6:
    BOOL v8 = 0;
    goto LABEL_7;
  }
  BOOL v8 = [(AAUIServiceSignInController *)self _allowsAccountCreation];
LABEL_7:
  [(AAUISignInViewController *)v4 setAllowsAccountCreation:v8];
  if ([(AAUIServiceSignInConfiguration *)self->_signInConfig offeriCloudAMSSplitSignIn]) {
    [(AAUISignInViewController *)v4 setShowOtherOptions:1];
  }
  [(AAUISignInViewController *)v4 setDelegate:self];
  [(AAUISignInViewController *)v4 setShowServiceIcons:[(AAUIServiceSignInController *)self _showsServiceIcons]];
  uint64_t v9 = +[AAUIServiceSignInMessageProvider messageForConfiguration:self->_signInConfig];
  if (v9) {
    [(AAUISignInViewController *)v4 setMessageLabel:v9];
  }
  if ([(AAUIServiceSignInController *)self _isAuthenticatingPrimary:*MEMORY[0x263F26D28]])
  {
    [(AAUISignInViewController *)v4 _setShouldAnticipatePiggybacking:1];
    [(AAUISignInViewController *)v4 _setAkServiceType:1];
  }
  [(AAUISignInViewController *)v4 setShowsChildSignIn:[(AAUIServiceSignInConfiguration *)self->_signInConfig showsChildSignIn]];
  BOOL v10 = [(AAUIServiceSignInController *)self akURLBag];
  [(AAUISignInViewController *)v4 setAKURLBag:v10];

  id v11 = self->_signInViewController;
  self->_signInViewController = v4;

  signInViewController = self->_signInViewController;
LABEL_14:
  return signInViewController;
}

- (id)_alertControllerForReusingAccount:(id)a3 serviceType:(id)a4 inViewController:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v62 = a6;
  uint64_t v13 = AALocalizedStringForServiceType();
  id v14 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  uint64_t v15 = AALocalizedStringForServiceType();

  uint64_t v16 = [v10 userFullName];
  v68 = (void *)v16;
  v69 = (void *)v13;
  v73 = (void *)v15;
  v70 = v10;
  v64 = v12;
  v66 = v11;
  v61 = self;
  if (v16)
  {
    uint64_t v17 = v16;
    long long v18 = NSString;
    long long v19 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    long long v20 = [v19 localizedStringForKey:@"SIGN_IN_CONTINUE_USING_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];
    v72 = objc_msgSend(v18, "stringWithFormat:", v20, v15, v17);

    long long v21 = NSString;
    id v22 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v23 = @"SIGN_IN_CONTINUE_USING_MESSAGE";
    uint64_t v24 = v17;
    if (([@"SIGN_IN_CONTINUE_USING_MESSAGE" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v25 = 0;
    }
    else
    {
      v23 = [@"SIGN_IN_CONTINUE_USING_MESSAGE" stringByAppendingString:@"_REBRAND"];
      int v25 = 1;
    }
    uint64_t v26 = [v22 localizedStringForKey:v23 value:&stru_26BD39CD8 table:@"Localizable"];
    v27 = objc_msgSend(v70, "aa_formattedUsername");
    uint64_t v28 = objc_msgSend(v21, "stringWithFormat:", v26, v13, v27, v24, v73);

    if (v25) {
    v29 = NSString;
    }
    v30 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v31 = [v30 localizedStringForKey:@"SIGN_IN_CONTINUE_USING_DIFFERENT" value:&stru_26BD39CD8 table:@"Localizable"];
    v60 = objc_msgSend(v29, "stringWithFormat:", v31, v24);
  }
  else
  {
    v30 = objc_msgSend(v10, "aa_formattedUsername");
    v32 = NSString;
    v33 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v34 = [v33 localizedStringForKey:@"SIGN_IN_CONTINUE_USING_TITLE_USERNAME" value:&stru_26BD39CD8 table:@"Localizable"];
    v72 = objc_msgSend(v32, "stringWithFormat:", v34, v15, v30);

    v35 = NSString;
    v36 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v37 = @"SIGN_IN_CONTINUE_USING_MESSAGE_USERNAME";
    if (([@"SIGN_IN_CONTINUE_USING_MESSAGE_USERNAME" containsString:@"REBRAND"] & 1) != 0
      || !_os_feature_enabled_impl())
    {
      int v38 = 0;
    }
    else
    {
      v37 = [@"SIGN_IN_CONTINUE_USING_MESSAGE_USERNAME" stringByAppendingString:@"_REBRAND"];
      int v38 = 1;
    }
    v39 = [v36 localizedStringForKey:v37 value:&stru_26BD39CD8 table:@"Localizable"];
    uint64_t v28 = objc_msgSend(v35, "stringWithFormat:", v39, v13, v30, v30, v73);

    if (v38) {
    v40 = NSString;
    }
    v31 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v41 = [v31 localizedStringForKey:@"SIGN_IN_CONTINUE_USING_DIFFERENT_USERNAME" value:&stru_26BD39CD8 table:@"Localizable"];
    v60 = objc_msgSend(v40, "stringWithFormat:", v41, v30);
  }
  v42 = v62;
  v63 = (void *)v28;

  v43 = [MEMORY[0x263F82418] alertWithTitle:v72 message:v28];
  v44 = (void *)MEMORY[0x263F82400];
  v45 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v46 = [v45 localizedStringForKey:@"SIGN_IN_CONTINUE_USING_SAME" value:&stru_26BD39CD8 table:@"Localizable"];
  v78[0] = MEMORY[0x263EF8330];
  v78[1] = 3221225472;
  v78[2] = __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke;
  v78[3] = &unk_263F94568;
  v78[4] = v61;
  id v79 = v70;
  id v80 = v66;
  id v81 = v64;
  id v47 = v42;
  id v82 = v47;
  id v65 = v64;
  id v67 = v66;
  id v71 = v70;
  v48 = [v44 actionWithTitle:v46 style:0 handler:v78];
  [v43 addAction:v48];

  v49 = (void *)MEMORY[0x263F82400];
  v76[0] = MEMORY[0x263EF8330];
  v76[1] = 3221225472;
  v76[2] = __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_109;
  v76[3] = &unk_263F93260;
  id v50 = v47;
  id v77 = v50;
  v51 = [v49 actionWithTitle:v60 style:0 handler:v76];
  [v43 addAction:v51];

  v52 = (void *)MEMORY[0x263F82400];
  v53 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v54 = [v53 localizedStringForKey:@"SIGN_IN_CONTINUE_USING_CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];
  v74[0] = MEMORY[0x263EF8330];
  v74[1] = 3221225472;
  v74[2] = __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_113;
  v74[3] = &unk_263F93260;
  id v75 = v50;
  id v55 = v50;
  v56 = [v52 actionWithTitle:v54 style:0 handler:v74];
  [v43 addAction:v56];

  v57 = [v43 actions];
  v58 = [v57 firstObject];
  [v43 setPreferredAction:v58];

  return v43;
}

uint64_t __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User opted to continue using account.", v4, 2u);
  }

  return [*(id *)(a1 + 32) _authenticateExistingAccount:*(void *)(a1 + 40) serviceType:*(void *)(a1 + 48) inViewController:*(void *)(a1 + 56) completion:*(void *)(a1 + 64)];
}

uint64_t __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_109(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User opted to sign in as a different account.", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __105__AAUIServiceSignInController__alertControllerForReusingAccount_serviceType_inViewController_completion___block_invoke_113(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_209754000, v2, OS_LOG_TYPE_DEFAULT, "User canceled option to continue using...", v5, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -1);
  (*(void (**)(uint64_t, void, void *))(v3 + 16))(v3, 0, v4);
}

- (void)prepareInViewController:(id)a3 completion:(id)a4
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v23 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__AAUIServiceSignInController_prepareInViewController_completion___block_invoke;
  aBlock[3] = &unk_263F939A8;
  aBlock[4] = self;
  id v22 = v6;
  id v29 = v22;
  long long v21 = _Block_copy(aBlock);
  uint64_t v7 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  BOOL v8 = [(id)objc_opt_class() supportedServices];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v25 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        id v14 = [v7 accountForService:v13];
        uint64_t v15 = [v14 username];
        uint64_t v16 = [v15 length];

        if (v16)
        {
          long long v20 = _AAUILogSystem();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v31 = v13;
            _os_log_impl(&dword_209754000, v20, OS_LOG_TYPE_DEFAULT, "Found account for service %{public}@, prompting for sign in...", buf, 0xCu);
          }

          long long v19 = v23;
          long long v18 = v21;
          [(AAUIServiceSignInController *)self _mainQueue_presentContinueUsingInViewController:v23 account:v14 serviceType:v13 completion:v21];

          goto LABEL_15;
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v24 objects:v32 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v17 = _AAUILogSystem();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_209754000, v17, OS_LOG_TYPE_DEFAULT, "No primary account to attempt continuation against, bailing...", buf, 2u);
  }

  long long v18 = v21;
  (*((void (**)(void *, void, void))v21 + 2))(v21, 0, 0);
  long long v19 = v23;
LABEL_15:
}

void __66__AAUIServiceSignInController_prepareInViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a3;
  id v5 = a2;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [*(id *)(*(void *)(a1 + 32) + 88) setAuthenticationResults:v5];

  uint64_t v6 = *(void *)(a1 + 40);
  if (v6) {
    (*(void (**)(uint64_t, BOOL))(v6 + 16))(v6, v7 == 0);
  }
}

- (void)_mainQueue_presentContinueUsingInViewController:(id)a3 account:(id)a4 serviceType:(id)a5 completion:(id)a6
{
  id v10 = a6;
  v14[0] = MEMORY[0x263EF8330];
  v14[1] = 3221225472;
  v14[2] = __110__AAUIServiceSignInController__mainQueue_presentContinueUsingInViewController_account_serviceType_completion___block_invoke;
  v14[3] = &unk_263F94590;
  id v15 = v10;
  id v11 = v10;
  id v12 = a3;
  uint64_t v13 = [(AAUIServiceSignInController *)self _alertControllerForReusingAccount:a4 serviceType:a5 inViewController:v12 completion:v14];
  [v12 presentViewController:v13 animated:1 completion:0];
}

void __110__AAUIServiceSignInController__mainQueue_presentContinueUsingInViewController_account_serviceType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  uint64_t v6 = v5;
  if (v12)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
LABEL_5:
    v7();
    goto LABEL_6;
  }
  if (v5)
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    goto LABEL_5;
  }
  BOOL v8 = [MEMORY[0x263F29218] sharedNetworkObserver];
  char v9 = [v8 isNetworkReachable];

  uint64_t v10 = *(void *)(a1 + 32);
  if (v9)
  {
    (*(void (**)(uint64_t, void, void))(v10 + 16))(v10, 0, 0);
  }
  else
  {
    id v11 = [MEMORY[0x263F087E8] errorWithDomain:*MEMORY[0x263F25710] code:-8009 userInfo:0];
    (*(void (**)(uint64_t, void, void *))(v10 + 16))(v10, 0, v11);
  }
LABEL_6:
}

- (void)_authenticateExistingAccount:(id)a3 serviceType:(id)a4 inViewController:(id)a5 completion:(id)a6
{
  uint64_t v38 = *MEMORY[0x263EF8340];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = objc_alloc_init(MEMORY[0x263F292A8]);
  [v14 setShouldOfferSecurityUpgrade:0];
  id v15 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  uint64_t v16 = [v15 altDSIDForAccount:v10 service:v11];
  [v14 setAltDSID:v16];

  uint64_t v17 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  long long v18 = [v17 DSIDForAccount:v10 service:v11];
  [v14 setDSID:v18];

  long long v19 = [v10 username];
  objc_msgSend(v14, "setIsUsernameEditable:", objc_msgSend(v19, "length") == 0);

  [v14 setPresentingViewController:v12];
  long long v20 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  [v14 setServiceType:AKServiceTypeFromAIDAServiceType(v20)];

  long long v21 = [v10 username];
  [v14 setUsername:v21];

  LODWORD(v18) = [(AAUIServiceSignInController *)self _isAuthenticatingPrimary:*MEMORY[0x263F26D28]];
  id v22 = _AAUILogSystem();
  BOOL v23 = os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v23)
    {
      long long v24 = (objc_class *)objc_opt_class();
      long long v25 = NSStringFromClass(v24);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_209754000, v22, OS_LOG_TYPE_DEFAULT, "%@ detected primary iCloud sign in.", (uint8_t *)&buf, 0xCu);
    }
    [v14 setAnticipateEscrowAttempt:1];
    [v14 setServiceType:1];
    [v14 setAuthenticationType:2];
    [v14 setShouldOfferSecurityUpgrade:1];
    [v14 setSupportsPiggybacking:1];
  }
  else
  {
    if (v23)
    {
      long long v26 = (objc_class *)objc_opt_class();
      long long v27 = NSStringFromClass(v26);
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v27;
      _os_log_impl(&dword_209754000, v22, OS_LOG_TYPE_DEFAULT, "%@ detected non-primary iCloud sign in.", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__14;
  v36 = __Block_byref_object_dispose__14;
  id v37 = [(AAUIServiceSignInController *)self authenticationController];
  uint64_t v28 = *(void **)(*((void *)&buf + 1) + 40);
  v30[0] = MEMORY[0x263EF8330];
  v30[1] = 3221225472;
  v30[2] = __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke;
  v30[3] = &unk_263F945B8;
  p_long long buf = &buf;
  id v29 = v13;
  id v31 = v29;
  [v28 authenticateWithContext:v14 completion:v30];

  _Block_object_dispose(&buf, 8);
}

void __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  BOOL v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = 0;

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke_2;
  block[3] = &unk_263F92460;
  id v9 = *(id *)(a1 + 32);
  id v14 = v6;
  id v15 = v9;
  id v13 = v5;
  id v10 = v6;
  id v11 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __100__AAUIServiceSignInController__authenticateExistingAccount_serviceType_inViewController_completion___block_invoke_2(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)_mainQueue_continueSignInWithAuthenticationResults:(id)a3 parentViewController:(id)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke;
  aBlock[3] = &unk_263F929D0;
  aBlock[4] = self;
  BOOL v8 = _Block_copy(aBlock);
  id v9 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
  uint64_t v10 = [v9 count];

  id v11 = _AAUILogSystem();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
      *(_DWORD *)long long buf = 138543362;
      uint64_t v17 = v13;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "Client opted to sign in %{public}@, attempting sign in now...", buf, 0xCu);
    }
    uint64_t v14 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
    [(AAUIServiceSignInController *)self _prepareToSignInForServices:v14 withAuthenticationResults:v7 parentViewController:v6];

    id v6 = v7;
    id v7 = (id)v14;
  }
  else
  {
    if (v12)
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209754000, v11, OS_LOG_TYPE_DEFAULT, "No service specified by client, attempting sign in for all...", buf, 2u);
    }

    [(AAUIServiceSignInController *)self continueSignInWithAuthenticationResults:v7 viewController:v6 completion:v8];
  }
}

void __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  id v6 = _AAUILogSystem();
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "AAUISignInController signed in with authentication results successfully!", buf, 2u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_cold_1();
  }

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_118;
  block[3] = &unk_263F945E0;
  uint64_t v8 = *(void *)(a1 + 32);
  char v12 = a2;
  void block[4] = v8;
  id v11 = v5;
  id v9 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_118(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_delegate_signInControllerDidCompleteWithSuccess:error:", *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 40));
}

- (void)continueSignInWithAuthenticationResults:(id)a3 viewController:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = [(AAUIServiceSignInController *)self _serviceContextWithResults:a3 parentViewController:a4];
  uint64_t v10 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v12 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke;
    v14[3] = &unk_263F92B30;
    id v15 = v8;
    [v12 signInToAllServicesInBackgroundUsingContext:v9 completion:v14];
  }
  else
  {
    id v13 = _AAUILogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[AAUIServiceSignInController continueSignInWithAuthenticationResults:viewController:completion:]();
    }

    if (v8) {
      (*((void (**)(id, void, void))v8 + 2))(v8, 0, 0);
    }
  }
}

void __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v5 = a3;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_2;
  aBlock[3] = &unk_263F93908;
  id v11 = *(id *)(a1 + 32);
  char v12 = a2;
  id v6 = v5;
  id v10 = v6;
  id v7 = (void (**)(void))_Block_copy(aBlock);
  if ((a2 & 1) == 0)
  {
    id v8 = _AAUILogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138543362;
      id v14 = v6;
      _os_log_impl(&dword_209754000, v8, OS_LOG_TYPE_DEFAULT, "Sign in attempt for iCloud failed, error: %{public}@", buf, 0xCu);
    }
  }
  v7[2](v7);
}

void __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_2(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_3;
  block[3] = &unk_263F93908;
  id v4 = *(id *)(a1 + 40);
  char v5 = *(unsigned char *)(a1 + 48);
  id v3 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __97__AAUIServiceSignInController_continueSignInWithAuthenticationResults_viewController_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void, void))(result + 16))(result, *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
  }
  return result;
}

- (void)_delegate_signInControllerDidCompleteWithSuccess:(BOOL)a3 error:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x3032000000;
  v22[3] = __Block_byref_object_copy__14;
  v22[4] = __Block_byref_object_dispose__14;
  uint64_t v7 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  id v8 = (void *)v7;
  id v9 = (void *)*MEMORY[0x263F26D28];
  if (v7) {
    id v9 = (void *)v7;
  }
  id v23 = v9;

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke;
  aBlock[3] = &unk_263F94608;
  void aBlock[4] = self;
  void aBlock[5] = v22;
  id v10 = _Block_copy(aBlock);
  id v11 = (void (**)(void, void, void))v10;
  if (!v6)
  {
    (*((void (**)(void *, BOOL, void))v10 + 2))(v10, v4, 0);
    goto LABEL_14;
  }
  char v12 = [v6 domain];
  int v13 = [v12 isEqualToString:*MEMORY[0x263F342B0]];

  if (v13)
  {
    if (![v6 shouldDisplayToUser])
    {
LABEL_6:
      id v14 = _AAUILogSystem();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:]();
      }

      ((void (**)(void, BOOL, id))v11)[2](v11, v4, v6);
      goto LABEL_14;
    }
  }
  else if (objc_msgSend(v6, "aa_isAASignInErrorWithCode:", -8006))
  {
    goto LABEL_6;
  }
  uint64_t v15 = _AAUILogSystem();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:]();
  }

  uint64_t v16 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
  v17[0] = MEMORY[0x263EF8330];
  v17[1] = 3221225472;
  v17[2] = __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_125;
  v17[3] = &unk_263F94630;
  id v18 = v6;
  long long v19 = v11;
  BOOL v20 = v4;
  [(AAUIServiceSignInController *)self _mainQueue_presentAlertForError:v18 inViewController:v16 completion:v17];

LABEL_14:
  _Block_object_dispose(v22, 8);
}

void __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v11 = a3;
  char v5 = [*(id *)(*(void *)(a1 + 32) + 88) serviceDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
    [v5 serviceSignInController:v6 didCompleteWithSuccess:a2 error:v11];
  }
  if (objc_opt_respondsToSelector())
  {
    id v7 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    id v8 = (void *)[objc_alloc(MEMORY[0x263F26D80]) initWithSuccess:a2 error:v11 type:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
    [v7 setObject:v8 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];

    id v9 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
    id v10 = (void *)[v7 copy];
    [v5 serviceSignInController:v9 didCompleteWithOperationsResults:v10];
  }
}

uint64_t __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_125(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_125_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (void)controllerFinishedWithAIDAResults:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke;
  aBlock[3] = &unk_263F94678;
  void aBlock[4] = self;
  uint64_t v5 = (void (**)(void *, id))_Block_copy(aBlock);
  uint64_t v6 = *MEMORY[0x263F26D28];
  uint64_t v7 = [v4 objectForKeyedSubscript:*MEMORY[0x263F26D28]];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [v4 objectForKeyedSubscript:v6];
    id v10 = [v9 error];

    if (v10)
    {
      id v11 = [v4 objectForKeyedSubscript:v6];
      char v12 = [v11 error];

      int v13 = [v12 domain];
      char v14 = [v13 isEqualToString:*MEMORY[0x263F342B0]];

      if (v14)
      {
        if (![v12 shouldDisplayToUser])
        {
LABEL_5:
          uint64_t v15 = _AAUILogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
            -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:]();
          }

          v5[2](v5, v4);
LABEL_13:

          goto LABEL_14;
        }
      }
      else if (objc_msgSend(v12, "aa_isAASignInErrorWithCode:", -8006))
      {
        goto LABEL_5;
      }
      uint64_t v16 = _AAUILogSystem();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        -[AAUIServiceSignInController _delegate_signInControllerDidCompleteWithSuccess:error:]();
      }

      uint64_t v17 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
      v18[0] = MEMORY[0x263EF8330];
      v18[1] = 3221225472;
      v18[2] = __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_129;
      v18[3] = &unk_263F92348;
      id v19 = v12;
      long long v21 = v5;
      id v20 = v4;
      [(AAUIServiceSignInController *)self _mainQueue_presentAlertForError:v19 inViewController:v17 completion:v18];

      goto LABEL_13;
    }
  }
  v5[2](v5, v4);
LABEL_14:
}

void __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = [*(id *)(*(void *)(a1 + 32) + 88) serviceDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
    [v4 serviceSignInController:v5 didCompleteWithOperationsResults:v3];
  }
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [v3 objectForKey:*MEMORY[0x263F26D28]];
    if (v6)
    {
      uint64_t v7 = _AAUILogSystem();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = [v6 error];
        int v17 = 138412290;
        id v18 = v8;
        _os_log_impl(&dword_209754000, v7, OS_LOG_TYPE_DEFAULT, "AAUIServiceSignInController calling deprecated delegate callback for cloud service type %@", (uint8_t *)&v17, 0xCu);
      }
      id v9 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
      id v10 = [v6 error];
      id v11 = [v6 error];
      [v4 serviceSignInController:v9 didCompleteWithSuccess:v10 == 0 error:v11];
    }
    else
    {
      char v12 = [v3 allValues];
      id v9 = objc_msgSend(v12, "aaf_filter:", &__block_literal_global_23);

      if ([v9 count])
      {
        id v10 = [v9 firstObject];
        int v13 = _AAUILogSystem();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_cold_1(v10, v13);
        }

        char v14 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
        uint64_t v15 = [v10 error];
        [v4 serviceSignInController:v14 didCompleteWithSuccess:0 error:v15];
      }
      else
      {
        uint64_t v16 = _AAUILogSystem();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_209754000, v16, OS_LOG_TYPE_DEFAULT, "AAUIServiceSignInController calling deprecated delegate callback for success", (uint8_t *)&v17, 2u);
        }

        id v10 = [*(id *)(*(void *)(a1 + 32) + 88) navigationController];
        [v4 serviceSignInController:v10 didCompleteWithSuccess:1 error:0];
      }
    }
  }
}

uint64_t __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_126(uint64_t a1, void *a2)
{
  return [a2 success] ^ 1;
}

uint64_t __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_129(uint64_t a1)
{
  v2 = _AAUILogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_125_cold_1(a1, v2, v3, v4, v5, v6, v7, v8);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (void)_prepareToSignInForServices:(id)a3 withAuthenticationResults:(id)a4 parentViewController:(id)a5
{
  v18[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 count] == 1
    && ([v8 objectAtIndexedSubscript:0],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = (void *)*MEMORY[0x263F26D28],
        v11,
        v11 == v12))
  {
    char v14 = _AAUILogSystem();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v17 = 0;
      _os_log_impl(&dword_209754000, v14, OS_LOG_TYPE_DEFAULT, "Detected cloud only service sign in.", v17, 2u);
    }

    int v13 = [(AAUIServiceSignInController *)self _serviceContextForCloudAndInactiveStoreWithAuthResults:v9 parentViewController:v10];
    uint64_t v15 = *MEMORY[0x263F26D48];
    v18[0] = v11;
    v18[1] = v15;
    uint64_t v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];

    id v8 = (id)v16;
  }
  else
  {
    int v13 = [(AAUIServiceSignInController *)self _serviceContextWithResults:v9 parentViewController:v10];
  }
  [(AAUIServiceSignInController *)self _attemptSignInForServices:v8 serviceContext:v13];
}

- (void)_attemptSignInForServices:(id)a3 serviceContext:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AAUILogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[AAUIServiceSignInController _attemptSignInForServices:serviceContext:](v8);
  }

  [MEMORY[0x263F25908] verifyAndFixPersonaIfNeeded:self->_originalPersona desiredContext:self->_originalPersonaContext];
  id v9 = _AAUILogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138543362;
    id v22 = v6;
    _os_log_impl(&dword_209754000, v9, OS_LOG_TYPE_DEFAULT, "Attempting sign in for services %{public}@ with authentication results", buf, 0xCu);
  }

  id v10 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    char v12 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
    v18[0] = MEMORY[0x263EF8330];
    v18[1] = 3221225472;
    v18[2] = __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke;
    void v18[3] = &unk_263F946A0;
    void v18[4] = self;
    [v12 signInToServices:v6 usingContext:v7 completion:v18];
  }
  else
  {
    int v13 = _AALogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[AAUIServiceSignInController _attemptSignInForServices:serviceContext:]();
    }

    id v14 = objc_alloc(MEMORY[0x263F26D80]);
    uint64_t v15 = objc_msgSend(MEMORY[0x263F087E8], "aa_errorWithCode:", -3);
    uint64_t v16 = *MEMORY[0x263F26D28];
    char v12 = (void *)[v14 initWithSuccess:0 error:v15 type:*MEMORY[0x263F26D28]];

    uint64_t v19 = v16;
    id v20 = v12;
    int v17 = [NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    [(AAUIServiceSignInController *)self controllerFinishedWithAIDAResults:v17];
  }
}

void __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (a2)
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_209754000, v6, OS_LOG_TYPE_DEFAULT, "AAUISignInController sign in for services completed successfully! %@ ", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke_130;
  v8[3] = &unk_263F926B8;
  v8[4] = *(void *)(a1 + 32);
  id v9 = v5;
  id v7 = v5;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

uint64_t __72__AAUIServiceSignInController__attemptSignInForServices_serviceContext___block_invoke_130(uint64_t a1)
{
  return [*(id *)(a1 + 32) controllerFinishedWithAIDAResults:*(void *)(a1 + 40)];
}

- (id)_serviceContextForCloudAndInactiveStoreWithAuthResults:(id)a3 parentViewController:(id)a4
{
  uint64_t v4 = [(AAUIServiceSignInController *)self _serviceContextWithResults:a3 parentViewController:a4];
  id v5 = [v4 signInContexts];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = objc_alloc_init(MEMORY[0x263F27E88]);
  [v7 setCanMakeAccountActive:0];
  [v6 setObject:v7 forKeyedSubscript:*MEMORY[0x263F26D48]];
  id v8 = (void *)[v6 copy];
  [v4 setSignInContexts:v8];

  id v9 = (void *)[v4 copy];
  return v9;
}

- (void)signInViewController:(id)a3 didCompleteWithAuthenticationResults:(id)a4
{
  id v8 = a4;
  id v9 = a3;
  id v10 = _AAUILogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_209754000, v10, OS_LOG_TYPE_DEFAULT, "Sign in view controller completed with authentication results!", buf, 2u);
  }

  id v11 = [v9 parentViewController];

  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__AAUIServiceSignInController_signInViewController_didCompleteWithAuthenticationResults___block_invoke;
  aBlock[3] = &unk_263F92758;
  void aBlock[4] = self;
  id v12 = v8;
  id v25 = v12;
  id v13 = v11;
  id v26 = v13;
  id v14 = (void (**)(void))_Block_copy(aBlock);
  if (!+[AAUIFeatureFlags isNewSignInProgressEnabled]) {
    goto LABEL_12;
  }
  uint64_t v15 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
  uint64_t v16 = [v15 count];
  if (v16)
  {
    uint64_t v17 = *MEMORY[0x263F26D28];
    goto LABEL_6;
  }
  uint64_t v21 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  if (!v21)
  {
LABEL_16:

    goto LABEL_17;
  }
  uint64_t v4 = (void *)v21;
  id v22 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceType];
  id v5 = v22;
  uint64_t v17 = *MEMORY[0x263F26D28];
  if (v22 == (void *)*MEMORY[0x263F26D28])
  {

    goto LABEL_16;
  }
LABEL_6:
  id v18 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes];
  char v19 = [v18 containsObject:v17];

  if (!v16)
  {
  }
  if ((v19 & 1) == 0)
  {
    id v20 = _AAUILogSystem();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[AAUIServiceSignInController signInViewController:didCompleteWithAuthenticationResults:]();
    }

LABEL_12:
    [(AAUIServiceSignInController *)self _mainQueue_presentSpinnerViewControllerInParentViewController:v13 withCompletion:v14];
    goto LABEL_20;
  }
LABEL_17:
  uint64_t v23 = _AAUILogSystem();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[AAUIServiceSignInController signInViewController:didCompleteWithAuthenticationResults:]();
  }

  v14[2](v14);
LABEL_20:
}

uint64_t __89__AAUIServiceSignInController_signInViewController_didCompleteWithAuthenticationResults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_mainQueue_continueSignInWithAuthenticationResults:parentViewController:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)signInViewControllerDidCancel:(id)a3
{
  uint64_t v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Sign in view controller canceled!", v11, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_splitAccountSignInController)
  {
    id v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
    id v6 = [v5 topViewController];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      id v8 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
      id v9 = (id)[v8 popViewControllerAnimated:1];
    }
    else
    {
      id v8 = _AAUILogSystem();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        -[AAUIServiceSignInController signInViewControllerDidCancel:]();
      }
    }

    splitAccountSignInController = self->_splitAccountSignInController;
    self->_splitAccountSignInController = 0;
  }
  else
  {
    [(AAUIServiceSignInController *)self _delegate_serviceSignInControllerDidCancel];
  }
}

- (void)_delegate_serviceSignInControllerDidCancel
{
  id v4 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceDelegate];
  if (objc_opt_respondsToSelector())
  {
    uint64_t v3 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
    [v4 serviceSignInControllerDidCancel:v3];
  }
}

- (void)signInViewControllerDidSkip:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Sign in view controller skipped!", v7, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
    [v5 serviceSignInController:v6 didSkipWithReason:0];
  }
}

- (void)signInViewControllerDidSelectChildSignIn:(id)a3
{
  id v4 = _AAUILogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_209754000, v4, OS_LOG_TYPE_DEFAULT, "Sign in view controller selected child sign in option", v7, 2u);
  }

  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v5 = [(AAUIServiceSignInConfiguration *)self->_signInConfig serviceDelegate];
  if (objc_opt_respondsToSelector())
  {
    id v6 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
    [v5 serviceSignInController:v6 didSkipWithReason:1];
  }
}

- (void)signInViewControllerDidSelectOtherOptions:(id)a3
{
  if ([(AAUIServiceSignInConfiguration *)self->_signInConfig offeriCloudAMSSplitSignIn]
    && ([(AAUIServiceSignInConfiguration *)self->_signInConfig serviceTypes],
        id v4 = objc_claimAutoreleasedReturnValue(),
        uint64_t v5 = [v4 count],
        v4,
        !v5))
  {
    id v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v6 = [v7 localizedStringForKey:@"SIGN_IN_OTHER_SIGN_IN_OPTIONS" value:&stru_26BD39CD8 table:@"Localizable"];

    id v8 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v9 = [v8 localizedStringForKey:@"SIGN_IN_OTHER_SIGN_IN_OPTIONS_USE_MULTIPLE" value:&stru_26BD39CD8 table:@"Localizable"];

    id v10 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"CANCEL" value:&stru_26BD39CD8 table:@"Localizable"];

    id v12 = [MEMORY[0x263F82418] alertWithTitle:v6 message:0];
    v16[0] = MEMORY[0x263EF8330];
    v16[1] = 3221225472;
    v16[2] = __73__AAUIServiceSignInController_signInViewControllerDidSelectOtherOptions___block_invoke;
    v16[3] = &unk_263F927A8;
    v16[4] = self;
    id v13 = [MEMORY[0x263F82400] actionWithTitle:v9 style:0 handler:v16];
    [v12 addAction:v13];

    id v14 = [MEMORY[0x263F82400] actionWithTitle:v11 style:1 handler:0];
    [v12 addAction:v14];

    uint64_t v15 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
    [v15 presentViewController:v12 animated:1 completion:0];
  }
  else
  {
    id v6 = _AAUILogSystem();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[AAUIServiceSignInController signInViewControllerDidSelectOtherOptions:]();
    }
  }
}

uint64_t __73__AAUIServiceSignInController_signInViewControllerDidSelectOtherOptions___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) startSplitAcountSignInFlow];
}

- (void)startSplitAcountSignInFlow
{
  uint64_t v3 = [AAUIAppleIDSignInConfigSplitAccountiCloud alloc];
  id v4 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
  id v14 = [(AAUIAppleIDSignInConfigSplitAccountiCloud *)v3 initWithNavController:v4];

  uint64_t v5 = [[AAUIOnboardingSignInController alloc] initWithSetupSignInConfig:v14];
  splitAccountSignInController = self->_splitAccountSignInController;
  self->_splitAccountSignInController = v5;

  id v7 = [(AAUIServiceSignInController *)self authenticationController];
  id v8 = [(AAUIOnboardingSignInController *)self->_splitAccountSignInController serviceController];
  id v9 = [v8 signInViewController];
  [v9 setAuthenticationController:v7];

  id v10 = [(AAUIServiceSignInController *)self _serviceOwnersManager];
  id v11 = [(AAUIOnboardingSignInController *)self->_splitAccountSignInController serviceController];
  [v11 setServiceOwnersManager:v10];

  id v12 = [[AAUIOnboardingSplitSignInDelegate alloc] initWithServiceSignInController:self];
  splitSignInDelegate = self->_splitSignInDelegate;
  self->_splitSignInDelegate = v12;

  [(AAUIOnboardingSignInController *)self->_splitAccountSignInController setDelegate:self->_splitSignInDelegate];
  [(AAUIOnboardingSignInController *)self->_splitAccountSignInController start];
}

- (void)willAuthenticateWithContext:(id)a3
{
  id v3 = [(AAUIServiceSignInConfiguration *)self->_signInConfig navigationController];
  [v3 setModalInPresentation:1];
}

- (void)_mainQueue_presentSpinnerViewControllerInParentViewController:(id)a3 withCompletion:(id)a4
{
  id v8 = (void (**)(void))a4;
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  id v7 = [(AAUIServiceSignInController *)self _spinnerViewController];
  [v6 showViewController:v7 sender:self];

  v8[2]();
}

- (void)_mainQueue_presentAlertForError:(id)a3 inViewController:(id)a4 completion:(id)a5
{
  id v7 = a5;
  id v8 = (void *)MEMORY[0x263F086E0];
  id v9 = a4;
  id v10 = a3;
  id v11 = [v8 bundleForClass:objc_opt_class()];
  id v12 = [v11 localizedStringForKey:@"SIGN_IN_ERROR_TITLE" value:&stru_26BD39CD8 table:@"Localizable"];

  id v13 = [v10 userInfo];

  id v14 = [v13 objectForKeyedSubscript:*MEMORY[0x263F08320]];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
  }
  else
  {
    uint64_t v17 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    id v16 = [v17 localizedStringForKey:@"SIGN_IN_ERROR_MESSAGE" value:&stru_26BD39CD8 table:@"Localizable"];
  }
  id v18 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  char v19 = [v18 localizedStringForKey:@"SIGN_IN_ERROR_BUTTON" value:&stru_26BD39CD8 table:@"Localizable"];

  id v20 = [MEMORY[0x263F82418] alertWithTitle:v12 message:v16];
  uint64_t v21 = (void *)MEMORY[0x263F82400];
  v24[0] = MEMORY[0x263EF8330];
  v24[1] = 3221225472;
  v24[2] = __91__AAUIServiceSignInController__mainQueue_presentAlertForError_inViewController_completion___block_invoke;
  v24[3] = &unk_263F93260;
  id v25 = v7;
  id v22 = v7;
  uint64_t v23 = [v21 actionWithTitle:v19 style:0 handler:v24];
  [v20 addAction:v23];

  [v9 presentViewController:v20 animated:1 completion:0];
}

uint64_t __91__AAUIServiceSignInController__mainQueue_presentAlertForError_inViewController_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (AKURLBag)akURLBag
{
  return self->akURLBag;
}

- (void)setAkURLBag:(id)a3
{
}

- (AIDAServiceOwnerProtocol)serviceOwnersManager
{
  return self->_serviceOwnersManager;
}

- (void)setServiceOwnersManager:(id)a3
{
}

- (AAUISignInFlowControllerDelegate)flowControllerDelegate
{
  return self->_flowControllerDelegate;
}

- (void)setFlowControllerDelegate:(id)a3
{
}

- (void)setAuthenticationController:(id)a3
{
}

- (AAUIServiceSignInConfiguration)signInConfig
{
  return self->_signInConfig;
}

- (void)setSignInConfig:(id)a3
{
}

- (void)setSignInViewController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signInViewController, 0);
  objc_storeStrong((id *)&self->_signInConfig, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_flowControllerDelegate, 0);
  objc_storeStrong((id *)&self->_serviceOwnersManager, 0);
  objc_storeStrong((id *)&self->akURLBag, 0);
  objc_storeStrong((id *)&self->_originalPersonaContext, 0);
  objc_storeStrong((id *)&self->_originalPersona, 0);
  objc_storeStrong((id *)&self->_splitSignInDelegate, 0);
  objc_storeStrong((id *)&self->_splitAccountSignInController, 0);
  objc_storeStrong((id *)&self->_spinnerViewController, 0);
  objc_storeStrong((id *)&self->_cdpUIController, 0);
}

void __64__AAUIServiceSignInController__attemptReauthAndSignInToServices__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Service sign in controller encountered authentication error. Loading sign in UI.", v2, v3, v4, v5, v6);
}

- (void)_spinnerMessageForService:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Invalid service type (%{private}@) provided, please file a radar!", v2, v3, v4, v5, v6);
}

- (void)_serviceContextWithResults:parentViewController:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Client provided service context.", v2, v3, v4, v5, v6);
}

void __103__AAUIServiceSignInController__mainQueue_continueSignInWithAuthenticationResults_parentViewController___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_209754000, v0, v1, "Failed to sign in to service(s) with error: %@", v2, v3, v4, v5, v6);
}

- (void)continueSignInWithAuthenticationResults:viewController:completion:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Sign in attempt for iCloud failed due to incorrect service owners manager type.", v2, v3, v4, v5, v6);
}

- (void)_delegate_signInControllerDidCompleteWithSuccess:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Attempting to display error", v2, v3, v4, v5, v6);
}

- (void)_delegate_signInControllerDidCompleteWithSuccess:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Skipping alert. CDP Error should not be displayed.", v2, v3, v4, v5, v6);
}

void __86__AAUIServiceSignInController__delegate_signInControllerDidCompleteWithSuccess_error___block_invoke_125_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void __65__AAUIServiceSignInController_controllerFinishedWithAIDAResults___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a1 type];
  uint64_t v5 = [a1 error];
  int v6 = 138412546;
  id v7 = v4;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_error_impl(&dword_209754000, a2, OS_LOG_TYPE_ERROR, "AAUIServiceSignInController calling deprecated delegate callback for service %@ with error %@", (uint8_t *)&v6, 0x16u);
}

- (void)_attemptSignInForServices:serviceContext:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  _os_log_fault_impl(&dword_209754000, v0, OS_LOG_TYPE_FAULT, "Sign in to cloud service failed because sign in was attempted on an incomplete AIDAServiceOwnersManager", v1, 2u);
}

- (void)_attemptSignInForServices:(os_log_t)log serviceContext:.cold.2(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 136315138;
  uint64_t v2 = "-[AAUIServiceSignInController _attemptSignInForServices:serviceContext:]";
  _os_log_debug_impl(&dword_209754000, log, OS_LOG_TYPE_DEBUG, "Verifying persona in %s", (uint8_t *)&v1, 0xCu);
}

- (void)signInViewController:didCompleteWithAuthenticationResults:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Determined that cloud service type will be signed in, progress view will be presented automatically", v2, v3, v4, v5, v6);
}

- (void)signInViewController:didCompleteWithAuthenticationResults:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_209754000, v0, v1, "Not signing into cloud service, directly presenting progress view", v2, v3, v4, v5, v6);
}

- (void)signInViewControllerDidCancel:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Skipped popping the view controller because it's not our sign in controller.", v2, v3, v4, v5, v6);
}

- (void)signInViewControllerDidSelectOtherOptions:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_209754000, v0, v1, "Unexpected configuration when handling other options callback.", v2, v3, v4, v5, v6);
}

@end