@interface APHideEducationViewController
- (APEducationViewControllerDelegate)delegate;
- (BOOL)wantsAnimatedPresentation;
- (id)initForApplication:(id)a3;
- (void)phase1ViewCancelButtonPressed:(id)a3;
- (void)phase1ViewContinueButtonPressed:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation APHideEducationViewController

- (id)initForApplication:(id)a3
{
  id v5 = a3;
  v65.receiver = self;
  v65.super_class = (Class)APHideEducationViewController;
  v6 = [(APHideEducationViewController *)&v65 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_app, a3);
    v8 = -[APWrappingView initWithFrame:]([APWrappingView alloc], "initWithFrame:", 0.0, 0.0, 50.0, 50.0);
    id v64 = v5;
    containerView = v7->_containerView;
    v7->_containerView = v8;

    v10 = v7->_containerView;
    v11 = [MEMORY[0x263F825C8] systemBackgroundColor];
    [(APWrappingView *)v10 setBackgroundColor:v11];

    [(APHideEducationViewController *)v7 setView:v7->_containerView];
    app = v7->_app;
    v13 = v7;
    v14 = [(APApplication *)app findApplicationRecordWithError:0];
    v15 = [v14 localizedName];

    v16 = NSString;
    id v17 = v15;
    v18 = APGetPreferredAuthenticationMechanismLocKey();
    v19 = [v16 stringWithFormat:@"HIDE_PROMPT_%@_FMT", v18];
    v20 = APUILocStr(v19);

    v63 = v17;
    v62 = objc_msgSend(NSString, "stringWithFormat:", v20, v17);

    v21 = NSString;
    v22 = APGetPreferredAuthenticationMechanismLocKey();
    v23 = [v21 stringWithFormat:@"HIDE_PROMPT_DETAIL_%@", v22];
    v61 = APUILocStr(v23);

    id v24 = objc_alloc(MEMORY[0x263F5B918]);
    v25 = APEducationIconForEnableableFeature(2);
    v26 = (void *)[v24 initWithTitle:v62 detailText:v61 icon:v25];

    v27 = APUIFrameworkBundle();
    v28 = [v27 localizedStringForKey:@"HIDDEN_ON_HOME_SCREEN" value:&stru_26FC11A68 table:@"Localizable"];
    v29 = APUIFrameworkBundle();
    v30 = [v29 localizedStringForKey:@"HIDDEN_ON_HOME_SCREEN_DETAIL" value:&stru_26FC11A68 table:@"Localizable"];
    [v26 addBulletedListItemWithTitle:v28 description:v30 symbolName:@"app.dashed"];

    v31 = +[APFeatureSemioticsManager sharedManager];
    v32 = [v31 systemImageNameForCurrentBestAuthenticationMechanism];

    v33 = NSString;
    v34 = APGetPreferredAuthenticationMechanismLocKey();
    v35 = [v33 stringWithFormat:@"AUTH_REQUIRED_ITEM_HEADER_%@", v34];
    v36 = APUILocStr(v35);

    v37 = NSString;
    v38 = APGetPreferredAuthenticationMechanismLocKey();
    v39 = [v37 stringWithFormat:@"AUTH_REQUIRED_ITEM_BODY_%@", v38];
    v40 = APUILocStr(v39);

    [v26 addBulletedListItemWithTitle:v36 description:v40 symbolName:v32];
    v41 = APUIFrameworkBundle();
    v42 = [v41 localizedStringForKey:@"NOTIFICATIONS_TURNED_OFF" value:&stru_26FC11A68 table:@"Localizable"];
    v43 = APUIFrameworkBundle();
    v44 = [v43 localizedStringForKey:@"NOTIFICATIONS_TURNED_OFF_DETAIL" value:&stru_26FC11A68 table:@"Localizable"];
    [v26 addBulletedListItemWithTitle:v42 description:v44 symbolName:@"bell.badge.slash"];

    v45 = [MEMORY[0x263F5B898] boldButton];
    v46 = +[APFeatureSemioticsManager sharedManager];
    v47 = [v46 titleForEnablementAction:1 ofFeature:2];

    [v45 setTitle:v47 forState:0];
    v48 = [v26 buttonTray];
    [v48 addButton:v45];

    [v45 addTarget:v13 action:sel_phase1ViewContinueButtonPressed_ forControlEvents:0x2000];
    v49 = [MEMORY[0x263F5B8D0] linkButton];
    v50 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v51 = [v50 localizedStringForKey:@"CANCEL" value:&stru_26FC11A68 table:@"Localizable"];
    [v49 setTitle:v51 forState:0];

    v52 = [v26 buttonTray];
    [v52 addButton:v49];

    [v49 addTarget:v13 action:sel_phase1ViewCancelButtonPressed_ forControlEvents:0x2000];
    id v53 = v13[124];
    v13[124] = v26;

    [v13 addChildViewController:v13[124]];
    v54 = [v13[124] view];
    v55 = [v13 view];
    [v55 bounds];
    objc_msgSend(v54, "setFrame:");

    v56 = [v13 view];
    v57 = [v13[124] view];
    [v56 addSubview:v57];

    id v5 = v64;
    [v13[124] didMoveToParentViewController:v13];
    v58 = [MEMORY[0x263F82670] currentDevice];
    uint64_t v59 = [v58 userInterfaceIdiom];

    if (!v59) {
      [v13 setModalPresentationStyle:5];
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
    _os_log_impl(&dword_247E02000, v4, OS_LOG_TYPE_DEFAULT, "Cancel pressed for hide edu VC", v6, 2u);
  }

  id v5 = [(APHideEducationViewController *)self delegate];
  [v5 educationViewControllerRequestsDismissal:self withResult:0];
}

- (void)phase1ViewContinueButtonPressed:(id)a3
{
  id v4 = a3;
  id v5 = APUIDefaultFrameworkLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_247E02000, v5, OS_LOG_TYPE_DEFAULT, "Continue pressed for hide edu VC", buf, 2u);
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
  v8 = [(APHideEducationViewController *)self delegate];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke;
  v10[3] = &unk_26522D9B0;
  v10[4] = self;
  id v11 = v7;
  id v9 = v7;
  [v8 educationViewController:self requestAuthenticationWithCompletion:v10];
}

void __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    uint64_t v4 = *(void *)(a1 + 32);
    uint64_t v5 = *(void *)(v4 + 976);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2;
    v7[3] = &unk_26522D9B0;
    v7[4] = v4;
    id v8 = *(id *)(a1 + 40);
    [v3 educationViewController:v4 requestHideOfApplication:v5 completion:v7];
  }
  else
  {
    v6 = *(void **)(a1 + 40);
    [v6 setEnabled:1];
  }
}

uint64_t __65__APHideEducationViewController_phase1ViewContinueButtonPressed___block_invoke_2(uint64_t a1, int a2)
{
  if (a2)
  {
    v3 = [*(id *)(a1 + 32) delegate];
    [v3 educationViewControllerRequestsDismissal:*(void *)(a1 + 32) withResult:2];
  }
  uint64_t v4 = *(void **)(a1 + 40);

  return [v4 setEnabled:1];
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
  objc_storeStrong((id *)&self->_welcomeController, 0);
  objc_storeStrong((id *)&self->_containerView, 0);

  objc_storeStrong((id *)&self->_app, 0);
}

@end