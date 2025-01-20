@interface DMCEnrollmentInterface
+ (Class)preferredViewControllerClassForAccount:(id)a3 preferiCloudAccount:(BOOL)a4;
+ (id)accountControllerFromSpecifier:(id)a3 baseViewController:(id)a4 preferiCloudAccount:(BOOL)a5;
- (BOOL)isUpdatingEnrollment;
- (DMCAccountSpecifierProvider)accountSpecifierProvider;
- (DMCEnrollmentDelegate)delegate;
- (DMCEnrollmentFlowController)enrollmentFlowController;
- (DMCEnrollmentFlowMCBridge)mcHelper;
- (DMCUnenrollmentFlowController)unenrollmentFlowController;
- (PSSpecifier)managedSignInButton;
- (UIViewController)parentViewController;
- (id)_specifiersForManagedAccountSignIn;
- (id)enrollmentResultBlock;
- (id)initFromViewController:(id)a3 delegate:(id)a4;
- (id)initFromViewController:(id)a3 enrollmentResultBlock:(id)a4;
- (id)initFromViewController:(id)a3 enrollmentResultBlock:(id)a4 managedConfigurationHelper:(id)a5;
- (id)specifiersForManagedAccounts;
- (void)setAccountSpecifierProvider:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollmentFlowController:(id)a3;
- (void)setEnrollmentResultBlock:(id)a3;
- (void)setIsUpdatingEnrollment:(BOOL)a3;
- (void)setManagedSignInButton:(id)a3;
- (void)setManagedSignInButtonEnabled:(BOOL)a3;
- (void)setMcHelper:(id)a3;
- (void)setParentViewController:(id)a3;
- (void)setUnenrollmentFlowController:(id)a3;
- (void)startBYODEnrollment;
- (void)startInBuddyEnrollment;
- (void)startReauthWithRMAccountID:(id)a3;
- (void)startUnenrollmentWithAltDSID:(id)a3 silent:(BOOL)a4;
@end

@implementation DMCEnrollmentInterface

- (id)initFromViewController:(id)a3 enrollmentResultBlock:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = objc_opt_new();
  id v9 = [(DMCEnrollmentInterface *)self initFromViewController:v7 enrollmentResultBlock:v6 managedConfigurationHelper:v8];

  return v9;
}

- (id)initFromViewController:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  [(DMCEnrollmentInterface *)self setDelegate:a4];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __58__DMCEnrollmentInterface_initFromViewController_delegate___block_invoke;
  v10[3] = &unk_2645E95F0;
  v11 = self;
  id v7 = objc_opt_new();
  id v8 = [(DMCEnrollmentInterface *)v11 initFromViewController:v6 enrollmentResultBlock:v10 managedConfigurationHelper:v7];

  return v8;
}

void __58__DMCEnrollmentInterface_initFromViewController_delegate___block_invoke(uint64_t a1, int a2, int a3, void *a4)
{
  id v9 = a4;
  id v7 = [*(id *)(a1 + 32) delegate];
  id v8 = v7;
  if (a2)
  {
    [v7 enrollmentDidSucceed];
  }
  else if (a3)
  {
    [v7 enrollmentWasCanceled];
  }
  else
  {
    [v7 enrollmentDidFailWithError:v9];
  }
}

- (id)initFromViewController:(id)a3 enrollmentResultBlock:(id)a4 managedConfigurationHelper:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)DMCEnrollmentInterface;
  v11 = [(DMCEnrollmentInterface *)&v19 init];
  if (v11)
  {
    v12 = [DMCAccountSpecifierProvider alloc];
    v13 = [MEMORY[0x263EFB210] defaultStore];
    uint64_t v14 = [(DMCAccountSpecifierProvider *)v12 initWithAccountStore:v13];
    accountSpecifierProvider = v11->_accountSpecifierProvider;
    v11->_accountSpecifierProvider = (DMCAccountSpecifierProvider *)v14;

    objc_storeWeak((id *)&v11->_parentViewController, v8);
    uint64_t v16 = MEMORY[0x223C90320](v9);
    id enrollmentResultBlock = v11->_enrollmentResultBlock;
    v11->_id enrollmentResultBlock = (id)v16;

    objc_storeStrong((id *)&v11->_mcHelper, a5);
    v11->_isUpdatingEnrollment = 0;
  }

  return v11;
}

- (void)startBYODEnrollment
{
  v3 = [DMCBYODEnrollmentFlowUIPresenter alloc];
  v4 = [(DMCEnrollmentInterface *)self parentViewController];
  v5 = [(DMCEnrollmentFlowUIPresenterBase *)v3 initWithBaseViewController:v4];

  objc_initWeak(&location, self);
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke;
  v12[3] = &unk_2645E9398;
  objc_copyWeak(&v13, &location);
  [(DMCEnrollmentFlowUIPresenterBase *)v5 setDismissedCompletionBlock:v12];
  id v6 = objc_opt_new();
  [v6 setPresenter:v5];
  id v7 = [MEMORY[0x263F389C8] enrollmentFlowControllerWithPresenter:v5 managedConfigurationHelper:v6];
  [(DMCEnrollmentInterface *)self setEnrollmentFlowController:v7];

  [(DMCEnrollmentInterface *)self setIsUpdatingEnrollment:1];
  id v8 = [(DMCEnrollmentInterface *)self delegate];
  [v8 enrollmentDidBegin];

  id v9 = [(DMCEnrollmentInterface *)self enrollmentFlowController];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke_2;
  v10[3] = &unk_2645E9618;
  objc_copyWeak(&v11, &location);
  [v9 startBYODEnrollmentFlowRestartIfFail:1 completionHandler:v10];

  objc_destroyWeak(&v11);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);
}

void __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = [WeakRetained enrollmentFlowController];
    [v2 terminateEnrollmentFlow];

    id WeakRetained = v3;
  }
}

void __45__DMCEnrollmentInterface_startBYODEnrollment__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setIsUpdatingEnrollment:0];
    id v9 = [v8 enrollmentResultBlock];
    ((void (**)(void, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);
  }
}

- (void)startInBuddyEnrollment
{
  if ([MEMORY[0x263F38B68] isAppleInternal])
  {
    if ([MEMORY[0x263F38B58] ADETestModeEnabled])
    {
      id v3 = [DMCBYODEnrollmentFlowUIPresenter alloc];
      v4 = [(DMCEnrollmentInterface *)self parentViewController];
      v5 = [(DMCEnrollmentFlowUIPresenterBase *)v3 initWithBaseViewController:v4];

      id v6 = objc_opt_new();
      [v6 setPresenter:v5];
      id v7 = [MEMORY[0x263F389C8] enrollmentFlowControllerWithPresenter:v5 managedConfigurationHelper:v6];
      [(DMCEnrollmentInterface *)self setEnrollmentFlowController:v7];

      [(DMCEnrollmentInterface *)self setIsUpdatingEnrollment:1];
      id v8 = [(DMCEnrollmentInterface *)self delegate];
      [v8 enrollmentDidBegin];

      objc_initWeak(&location, self);
      id v9 = [(DMCEnrollmentInterface *)self enrollmentFlowController];
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __48__DMCEnrollmentInterface_startInBuddyEnrollment__block_invoke;
      v10[3] = &unk_2645E9618;
      objc_copyWeak(&v11, &location);
      [v9 startInBuddyEnrollmentFlowRestartIfFail:1 completionHandler:v10];

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
}

void __48__DMCEnrollmentInterface_startInBuddyEnrollment__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setIsUpdatingEnrollment:0];
    id v9 = [v8 enrollmentResultBlock];
    ((void (**)(void, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);
  }
}

- (void)startUnenrollmentWithAltDSID:(id)a3 silent:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v4)
  {
    id v7 = 0;
  }
  else
  {
    id v8 = [DMCUnenrollmentFlowUIPresenter alloc];
    id v9 = [(DMCEnrollmentInterface *)self parentViewController];
    id v7 = [(DMCEnrollmentFlowUIPresenterBase *)v8 initWithBaseViewController:v9];
  }
  id v10 = objc_opt_new();
  id v11 = (void *)[objc_alloc(MEMORY[0x263F389D8]) initWithPresenter:v7 managedConfigurationHelper:v10];
  [(DMCEnrollmentInterface *)self setUnenrollmentFlowController:v11];

  [(DMCEnrollmentInterface *)self setIsUpdatingEnrollment:1];
  objc_initWeak(&location, self);
  v12 = [(DMCEnrollmentInterface *)self unenrollmentFlowController];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __62__DMCEnrollmentInterface_startUnenrollmentWithAltDSID_silent___block_invoke;
  v13[3] = &unk_2645E9618;
  objc_copyWeak(&v14, &location);
  [v12 unenrollAccountWithAltDSID:v6 silent:v4 completionHandler:v13];

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __62__DMCEnrollmentInterface_startUnenrollmentWithAltDSID_silent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    [WeakRetained setIsUpdatingEnrollment:0];
    id v9 = [v8 enrollmentResultBlock];
    ((void (**)(void, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);
  }
}

- (void)startReauthWithRMAccountID:(id)a3
{
  id v4 = a3;
  v5 = [DMCBYODEnrollmentFlowUIPresenter alloc];
  id v6 = [(DMCEnrollmentInterface *)self parentViewController];
  id v7 = [(DMCEnrollmentFlowUIPresenterBase *)v5 initWithBaseViewController:v6];

  id v8 = objc_opt_new();
  id v9 = [MEMORY[0x263F389C8] enrollmentFlowControllerWithPresenter:v7 managedConfigurationHelper:v8];
  [(DMCEnrollmentInterface *)self setEnrollmentFlowController:v9];

  objc_initWeak(&location, self);
  id v10 = [(DMCEnrollmentInterface *)self enrollmentFlowController];
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __53__DMCEnrollmentInterface_startReauthWithRMAccountID___block_invoke;
  v11[3] = &unk_2645E9618;
  objc_copyWeak(&v12, &location);
  [v10 reauthBYODEnrollmentFlowRestartIfFail:0 rmAccountIdentifier:v4 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__DMCEnrollmentInterface_startReauthWithRMAccountID___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v10 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = WeakRetained;
  if (WeakRetained)
  {
    id v9 = [WeakRetained enrollmentResultBlock];
    ((void (**)(void, uint64_t, uint64_t, id))v9)[2](v9, a2, a3, v10);
  }
}

- (void)setManagedSignInButtonEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(DMCEnrollmentInterface *)self managedSignInButton];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setProperty:v4 forKey:*MEMORY[0x263F600A8]];
}

- (id)_specifiersForManagedAccountSignIn
{
  v18[2] = *MEMORY[0x263EF8340];
  BOOL v3 = (void *)MEMORY[0x263F5FC40];
  id v4 = +[DMCAccountSpecifierProvider groupSpecifierID];
  id v5 = [v3 groupSpecifierWithID:v4];

  id v6 = [(DMCEnrollmentInterface *)self managedSignInButton];

  if (!v6)
  {
    id v7 = (void *)MEMORY[0x263F5FC40];
    id v8 = DMCLocalizedString();
    id v9 = [v7 preferenceSpecifierNamed:v8 target:self set:0 get:0 detail:0 cell:13 edit:0];

    [v9 setButtonAction:sel_startBYODEnrollment];
    uint64_t v10 = MEMORY[0x263EFFA88];
    [v9 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [v9 setProperty:v10 forKey:*MEMORY[0x263F600A8]];
    [(DMCEnrollmentInterface *)self setManagedSignInButton:v9];
  }
  id v11 = (void *)MEMORY[0x263EFF980];
  v18[0] = v5;
  id v12 = [(DMCEnrollmentInterface *)self managedSignInButton];
  v18[1] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:2];
  id v14 = [v11 arrayWithArray:v13];

  if ([MEMORY[0x263F38B68] isAppleInternal]
    && [MEMORY[0x263F38B58] ADETestModeEnabled])
  {
    v15 = [MEMORY[0x263F5FC40] preferenceSpecifierNamed:@"Start Setup Assistant Enrollment…" target:self set:0 get:0 detail:0 cell:13 edit:0];
    [v15 setButtonAction:sel_startInBuddyEnrollment];
    uint64_t v16 = MEMORY[0x263EFFA88];
    [v15 setProperty:MEMORY[0x263EFFA88] forKey:*MEMORY[0x263F5FEF8]];
    [v15 setProperty:v16 forKey:*MEMORY[0x263F600A8]];
    [v14 addObject:v15];
  }
  return v14;
}

- (id)specifiersForManagedAccounts
{
  if ([(DMCEnrollmentInterface *)self isUpdatingEnrollment])
  {
    BOOL v3 = [(DMCEnrollmentInterface *)self _specifiersForManagedAccountSignIn];
    goto LABEL_25;
  }
  id v4 = [(DMCEnrollmentInterface *)self accountSpecifierProvider];
  id v5 = [v4 specifiersWithTitle:1 includePrimaryAccounts:1];

  if ([v5 count])
  {
    id v6 = v5;
LABEL_23:
    BOOL v3 = v6;
    goto LABEL_24;
  }
  id v7 = [(DMCEnrollmentInterface *)self mcHelper];
  if (objc_opt_respondsToSelector())
  {
    id v8 = [(DMCEnrollmentInterface *)self mcHelper];
    int v9 = [v8 isDeviceMDMEnrolled];

    if (v9)
    {
      uint64_t v10 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        __int16 v22 = 0;
        id v11 = "No Managed Sign In button because we are enrolled in MDM";
        id v12 = (uint8_t *)&v22;
LABEL_19:
        _os_log_impl(&dword_221CC5000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
  }
  else
  {
  }
  id v13 = [(DMCEnrollmentInterface *)self mcHelper];
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {

LABEL_15:
    uint64_t v16 = [(DMCEnrollmentInterface *)self mcHelper];
    if (objc_opt_respondsToSelector())
    {
      v17 = [(DMCEnrollmentInterface *)self mcHelper];
      int v18 = [v17 isDeviceSharediPad];

      if (v18)
      {
        uint64_t v10 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          __int16 v20 = 0;
          id v11 = "No Managed Sign In button because we are in Shared iPad";
          id v12 = (uint8_t *)&v20;
          goto LABEL_19;
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
    id v6 = [(DMCEnrollmentInterface *)self _specifiersForManagedAccountSignIn];
    goto LABEL_23;
  }
  id v14 = [(DMCEnrollmentInterface *)self mcHelper];
  int v15 = [v14 isDeviceSupervised];

  if (!v15) {
    goto LABEL_15;
  }
  uint64_t v10 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    __int16 v21 = 0;
    id v11 = "No Managed Sign In button because we are Supervised";
    id v12 = (uint8_t *)&v21;
    goto LABEL_19;
  }
LABEL_20:
  BOOL v3 = 0;
LABEL_24:

LABEL_25:
  return v3;
}

+ (Class)preferredViewControllerClassForAccount:(id)a3 preferiCloudAccount:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (v4)
  {
    id v6 = [MEMORY[0x263EFB210] defaultStore];
    id v7 = objc_msgSend(v5, "dmc_altDSID");
    id v8 = objc_msgSend(v6, "dmc_iCloudAccountForRemoteManagingAccountWithAltDSID:", v7);

    if (v8)
    {
      id v9 = v8;

      id v5 = v9;
    }
    else
    {
      uint64_t v10 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v5;
        _os_log_impl(&dword_221CC5000, v10, OS_LOG_TYPE_INFO, "No iCloud account for DMC account %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  id v11 = [MEMORY[0x263F23138] sharedInstance];
  id v12 = (void *)[v11 viewControllerClassForViewingAccount:v5];

  if (!v12)
  {
    id v13 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v16 = 138412290;
      id v17 = v5;
      _os_log_impl(&dword_221CC5000, v13, OS_LOG_TYPE_ERROR, "No view controller available for DMC account %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v14 = v12;

  return v14;
}

+ (id)accountControllerFromSpecifier:(id)a3 baseViewController:(id)a4 preferiCloudAccount:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v8 propertyForKey:*MEMORY[0x263F23118]];
  if (v10)
  {
    id v11 = (id)[a1 preferredViewControllerClassForAccount:v10 preferiCloudAccount:v5];
    if (!v11) {
      goto LABEL_14;
    }
    id v12 = objc_opt_new();
    [v12 setSpecifier:v8];
    if (v9)
    {
      if (([v11 isSubclassOfClass:objc_opt_class()] & 1) == 0
        && ([v11 isSubclassOfClass:objc_opt_class()] & 1) == 0)
      {
        id v17 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v18 = 138412290;
          id v19 = v11;
          _os_log_impl(&dword_221CC5000, v17, OS_LOG_TYPE_INFO, "DMC is returning a dataclass configuration account page controller: %@", (uint8_t *)&v18, 0xCu);
        }
        id v11 = (id)[objc_alloc(MEMORY[0x263F5FC30]) initWithRootViewController:v12];
        [v11 setSpecifier:v8];
        [v11 setParentController:v9];
        [v12 setParentController:v11];
        [v12 setRootController:v11];
        goto LABEL_10;
      }
      id v13 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        id v19 = v11;
        _os_log_impl(&dword_221CC5000, v13, OS_LOG_TYPE_INFO, "DMC is returning an account page controller: %@", (uint8_t *)&v18, 0xCu);
      }
      [v12 setParentController:v9];
      id v14 = [v9 rootController];
      [v12 setRootController:v14];
    }
    id v11 = v12;
LABEL_10:

    goto LABEL_14;
  }
  int v15 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_221CC5000, v15, OS_LOG_TYPE_ERROR, "A DMC account cell was tapped but had no account associated with it! %@", (uint8_t *)&v18, 0xCu);
  }
  id v11 = 0;
LABEL_14:

  return v11;
}

- (DMCAccountSpecifierProvider)accountSpecifierProvider
{
  return self->_accountSpecifierProvider;
}

- (void)setAccountSpecifierProvider:(id)a3
{
}

- (UIViewController)parentViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
  return (UIViewController *)WeakRetained;
}

- (void)setParentViewController:(id)a3
{
}

- (id)enrollmentResultBlock
{
  return self->_enrollmentResultBlock;
}

- (void)setEnrollmentResultBlock:(id)a3
{
}

- (DMCEnrollmentFlowMCBridge)mcHelper
{
  return self->_mcHelper;
}

- (void)setMcHelper:(id)a3
{
}

- (BOOL)isUpdatingEnrollment
{
  return self->_isUpdatingEnrollment;
}

- (void)setIsUpdatingEnrollment:(BOOL)a3
{
  self->_isUpdatingEnrollment = a3;
}

- (DMCEnrollmentFlowController)enrollmentFlowController
{
  return self->_enrollmentFlowController;
}

- (void)setEnrollmentFlowController:(id)a3
{
}

- (DMCUnenrollmentFlowController)unenrollmentFlowController
{
  return self->_unenrollmentFlowController;
}

- (void)setUnenrollmentFlowController:(id)a3
{
}

- (PSSpecifier)managedSignInButton
{
  return self->_managedSignInButton;
}

- (void)setManagedSignInButton:(id)a3
{
}

- (DMCEnrollmentDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (DMCEnrollmentDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedSignInButton, 0);
  objc_storeStrong((id *)&self->_unenrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_enrollmentFlowController, 0);
  objc_storeStrong((id *)&self->_mcHelper, 0);
  objc_storeStrong(&self->_enrollmentResultBlock, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_accountSpecifierProvider, 0);
}

@end