@interface APLockEducationViewController
- (APEducationViewControllerDelegate)delegate;
- (BOOL)wantsAnimatedPresentation;
- (id)initForApplication:(id)a3;
- (void)continueFlowAfterPhase1;
- (void)createTCCAccessDisclosureController;
- (void)phase1ViewCancelButtonPressed:(id)a3;
- (void)phase1ViewContinueButtonPressed:(id)a3;
- (void)phase3ViewCancelButtonPressed:(id)a3;
- (void)phase3ViewContinueButtonPressed:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation APLockEducationViewController

- (id)initForApplication:(id)a3
{
  v66[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)APLockEducationViewController;
  v6 = [(APLockEducationViewController *)&v65 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    id v64 = v5;
    objc_storeStrong((id *)&v6->_app, a3);
    v8 = -[APWrappingView initWithFrame:]([APWrappingView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    v10 = v7->_containerView;
    v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(APWrappingView *)v10 setBackgroundColor:v11];

    [(APLockEducationViewController *)v7 setView:v7->_containerView];
    v12 = (OBNavigationController *)objc_alloc_init(MEMORY[0x263F5B8E0]);
    navController = v7->_navController;
    v7->_navController = v12;

    [(APLockEducationViewController *)v7 addChildViewController:v7->_navController];
    v14 = [(OBNavigationController *)v7->_navController view];
    v15 = [(APLockEducationViewController *)v7 view];
    [v15 bounds];
    objc_msgSend(v14, "setFrame:");

    v16 = [(APLockEducationViewController *)v7 view];
    v17 = [(OBNavigationController *)v7->_navController view];
    [v16 addSubview:v17];

    [(OBNavigationController *)v7->_navController didMoveToParentViewController:v7];
    app = v7->_app;
    v19 = v7;
    v20 = [(APApplication *)app findApplicationRecordWithError:0];
    v21 = [v20 localizedName];
    v63 = v20;
    v22 = [v20 bundleIdentifier];
    int v23 = [v22 isEqualToString:@"com.apple.Passbook"];

    if (v23)
    {
      uint64_t v24 = APUILocStr(@"WALLET_AND_APPLE_PAY");

      v21 = (void *)v24;
    }
    id v25 = objc_alloc(MEMORY[0x263F5B918]);
    v26 = NSString;
    id v27 = v21;
    v28 = APGetPreferredAuthenticationMechanismLocKey();
    v29 = [v26 stringWithFormat:@"REQUIRE_AUTH_PROMPT_%@_FMT", v28];
    v30 = APUILocStr(v29);
    v31 = objc_msgSend(v26, "stringWithFormat:", v30, v27);

    v32 = APEducationIconForEnableableFeature(1);
    v33 = (OBWelcomeController *)[v25 initWithTitle:v31 detailText:0 icon:v32];

    v34 = +[APFeatureSemioticsManager sharedManager];
    v62 = [v34 systemImageNameForCurrentBestAuthenticationMechanism];

    v35 = NSString;
    v36 = APGetPreferredAuthenticationMechanismLocKey();
    v37 = [v35 stringWithFormat:@"AUTH_REQUIRED_ITEM_HEADER_%@", v36];
    v38 = APUILocStr(v37);

    v39 = NSString;
    v40 = APGetPreferredAuthenticationMechanismLocKey();
    v41 = [v39 stringWithFormat:@"AUTH_REQUIRED_ITEM_BODY_%@", v40];
    v42 = APUILocStr(v41);

    [(OBWelcomeController *)v33 addBulletedListItemWithTitle:v38 description:v42 symbolName:v62];
    v43 = APUIFrameworkBundle();
    v44 = [v43 localizedStringForKey:@"NOTIFICATION_CONTENT_HIDDEN" value:&stru_26FC11A68 table:@"Localizable"];
    v45 = APUIFrameworkBundle();
    v46 = [v45 localizedStringForKey:@"NOTIFICATION_CONTENT_HIDDEN_DETAIL" value:&stru_26FC11A68 table:@"Localizable"];
    [(OBWelcomeController *)v33 addBulletedListItemWithTitle:v44 description:v46 symbolName:@"bell.badge.slash"];

    v47 = [MEMORY[0x263F5B898] boldButton];
    v48 = NSString;
    v49 = APGetPreferredAuthenticationMechanismLocKey();
    v50 = [v48 stringWithFormat:@"REQUIRE_AUTH_%@", v49];
    v51 = APUILocStr(v50);

    [v47 setTitle:v51 forState:0];
    v52 = [(OBWelcomeController *)v33 buttonTray];
    [v52 addButton:v47];

    [v47 addTarget:v19 action:sel_phase1ViewContinueButtonPressed_ forControlEvents:0x2000];
    v53 = [MEMORY[0x263F5B8D0] linkButton];
    v54 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v55 = [v54 localizedStringForKey:@"CANCEL" value:&stru_26FC11A68 table:@"Localizable"];
    [v53 setTitle:v55 forState:0];

    v56 = [(OBWelcomeController *)v33 buttonTray];
    [v56 addButton:v53];

    [v53 addTarget:v19 action:sel_phase1ViewCancelButtonPressed_ forControlEvents:0x2000];
    welcomeController = v19->_welcomeController;
    v19->_welcomeController = v33;

    v66[0] = v19->_welcomeController;
    v58 = [MEMORY[0x263EFF8C0] arrayWithObjects:v66 count:1];
    [(OBNavigationController *)v7->_navController setViewControllers:v58];

    [(APLockEducationViewController *)v19 createTCCAccessDisclosureController];
    v59 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v60 = [v59 userInterfaceIdiom];

    id v5 = v64;
    if (!v60) {
      [(APLockEducationViewController *)v19 setModalPresentationStyle:5];
    }
  }

  return v7;
}

- (BOOL)wantsAnimatedPresentation
{
  return 1;
}

- (void)phase1ViewCancelButtonPressed:(id)a3
{
  v4 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_247E02000, v4, OS_LOG_TYPE_DEFAULT, "Cancel pressed for lock edu VC", v6, 2u);
  }

  id v5 = [(APLockEducationViewController *)self delegate];
  [v5 educationViewControllerRequestsDismissal:self withResult:0];
}

- (void)phase1ViewContinueButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "Continue pressed for lock edu VC", buf, 2u);
  }

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v6 = v4;
  }
  else {
    v6 = 0;
  }
  id v7 = v6;
  [v7 setEnabled:0];
  v8 = [(APLockEducationViewController *)self delegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke;
  v10[3] = &unk_26522D9B0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 educationViewController:self requestAuthenticationWithCompletion:v10];
}

void __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 976);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2;
    v7[3] = &unk_26522D9B0;
    v7[4] = v4;
    id v8 = *(id *)(a1 + 40);
    [v3 educationViewController:v4 requestLockOfApplication:v5 completion:v7];
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    [v6 setEnabled:1];
  }
}

uint64_t __65__APLockEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) continueFlowAfterPhase1];
  }
  v3 = *(void **)(a1 + 40);

  return [v3 setEnabled:1];
}

- (void)continueFlowAfterPhase1
{
  if (self->_TCCDisclosureController)
  {
    navController = self->_navController;
    -[OBNavigationController pushViewController:animated:](navController, "pushViewController:animated:");
  }
  else
  {
    uint64_t v4 = APUIDefaultFrameworkLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_247E02000, v4, OS_LOG_TYPE_DEFAULT, "No TCC services, dismiss now.", v6, 2u);
    }

    uint64_t v5 = [(APLockEducationViewController *)self delegate];
    [v5 educationViewControllerRequestsDismissal:self withResult:1];
  }
}

- (void)phase3ViewContinueButtonPressed:(id)a3
{
  uint64_t v4 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_247E02000, v4, OS_LOG_TYPE_DEFAULT, "phase 3 continue button pressed -> dismiss", v6, 2u);
  }

  uint64_t v5 = [(APLockEducationViewController *)self delegate];
  [v5 educationViewControllerRequestsDismissal:self withResult:1];
}

- (void)phase3ViewCancelButtonPressed:(id)a3
{
  uint64_t v4 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_247E02000, v4, OS_LOG_TYPE_DEFAULT, "phase 3 cancel button pressed -> dismiss", v6, 2u);
  }

  uint64_t v5 = [(APLockEducationViewController *)self delegate];
  [v5 educationViewControllerRequestsDismissal:self withResult:1];
}

- (void)createTCCAccessDisclosureController
{
  v3 = [MEMORY[0x263F25228] sharedManager];
  app = self->_app;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __68__APLockEducationViewController_createTCCAccessDisclosureController__block_invoke;
  v5[3] = &unk_26522D9D8;
  v5[4] = self;
  [v3 fetchUsersForRecord:app completion:v5];
}

void __68__APLockEducationViewController_createTCCAccessDisclosureController__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  if ([v6 count])
  {
    v3 = [[APTCCDisclosureController alloc] initWithApplication:*(void *)(*(void *)(a1 + 32) + 976) users:v6 includeDoneButton:1 scrollViewAssistant:0];
    [(APTCCDisclosureController *)v3 addDoneButtonTarget:*(void *)(a1 + 32) action:sel_phase3ViewContinueButtonPressed_];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void **)(v4 + 1008);
    *(void *)(v4 + 1008) = v3;
  }
}

- (APEducationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->delegate);

  return (APEducationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->delegate);
  objc_storeStrong((id *)&self->_TCCDisclosureController, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_navController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_app, 0);
}

@end