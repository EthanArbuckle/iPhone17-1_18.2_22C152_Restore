@interface BKUIPeriocularEnableSplashViewController
+ (void)setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:(id)a3 credentialSet:(id)a4 authContext:(id)a5 enabled:(BOOL)a6 completion:(id)a7;
+ (void)setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:(id)a3 credentialSet:(id)a4 enabled:(BOOL)a5;
- (BKDevice)device;
- (BKUIPeriocularSelectionCell)cellBottom;
- (BKUIPeriocularSelectionCell)cellTop;
- (BOOL)inBuddy;
- (BOOL)upsell;
- (OBAnimationController)animationController;
- (OBPrivacyLinkController)linkController;
- (OBTrayButton)continueButton;
- (OBTrayButton)skipButton;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)headerViewBottomToTableViewTopPadding;
- (double)maxCellHeight;
- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4;
- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4;
- (id)_createCellForIndexPath:(id)a3;
- (id)endEnrollActionPrimary;
- (id)endEnrollActionSecondary;
- (id)initInBuddy:(BOOL)a3 bkDevice:(id)a4 upsell:(BOOL)a5 withEndEnrollmentActionPrimary:(id)a6 enrollmentActionSecondary:(id)a7;
- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4;
- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4;
- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4;
- (id)userSkippedAction;
- (int64_t)numberOfSectionsInTableView:(id)a3;
- (int64_t)preferredStatusBarStyle;
- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4;
- (void)_continuePressed:(id)a3;
- (void)_enrollSkipped:(id)a3;
- (void)_showPrivacyLink;
- (void)setAnimationController:(id)a3;
- (void)setCellBottom:(id)a3;
- (void)setCellTop:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDevice:(id)a3;
- (void)setEndEnrollActionPrimary:(id)a3;
- (void)setEndEnrollActionSecondary:(id)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setLinkController:(id)a3;
- (void)setMaxCellHeight:(double)a3;
- (void)setSkipButton:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setUpsell:(BOOL)a3;
- (void)setUserSkippedAction:(id)a3;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation BKUIPeriocularEnableSplashViewController

- (id)initInBuddy:(BOOL)a3 bkDevice:(id)a4 upsell:(BOOL)a5 withEndEnrollmentActionPrimary:(id)a6 enrollmentActionSecondary:(id)a7
{
  LODWORD(v9) = a5;
  id v10 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v51 = a6;
  id v50 = a7;
  if (v9)
  {
    id v55 = 0;
    v13 = [v12 identitiesForUser:getuid() error:&v55];
    id v14 = v55;
    v15 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_6];
    v16 = [v13 filteredArrayUsingPredicate:v15];

    if (![v16 count])
    {
      v32 = _BKUILoggingFacility();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v14;
        _os_log_impl(&dword_1E4B6C000, v32, OS_LOG_TYPE_DEFAULT, "BKUIPearl:BKUIPeriocularEnableSplashViewController no identities found returning nil to init ... error?:%@", buf, 0xCu);
      }

      goto LABEL_19;
    }
    id v54 = v14;
    v17 = [v12 systemProtectedConfigurationWithError:&v54];
    id v18 = v54;

    if (v18)
    {
      v19 = _BKUILoggingFacility();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[BKUIPeriocularEnableSplashViewController initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:]((uint64_t)v18, v19);
      }
    }
    id v53 = v18;
    v20 = [v12 protectedConfigurationForUser:getuid() error:&v53];
    id v21 = v53;

    if (v21)
    {
      v22 = _BKUILoggingFacility();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[BKUIPeriocularEnableSplashViewController initInBuddy:bkDevice:upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:]((uint64_t)v21, v22);
      }
    }
    v23 = [v17 periocularFaceIDMatchEnabled];
    if ([v23 BOOLValue])
    {
      [v20 periocularFaceIDMatchEnabled];
      char v48 = (char)v9;
      id v9 = v10;
      id v24 = v12;
      id v25 = v21;
      v26 = v20;
      v27 = v16;
      v29 = v28 = v17;
      int v30 = [v29 BOOLValue];

      v17 = v28;
      v16 = v27;
      v20 = v26;
      id v21 = v25;
      id v12 = v24;
      id v10 = v9;
      LOBYTE(v9) = v48;

      if (v30)
      {
        v31 = _BKUILoggingFacility();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4B6C000, v31, OS_LOG_TYPE_DEFAULT, "BKUIPearl:User already has periocularFaceIDMatchEnabled for both system and user thus bailing out early returning nil to init ...", buf, 2u);
        }

LABEL_19:
        v33 = 0;
        v35 = v50;
        v34 = v51;
        goto LABEL_25;
      }
    }
    else
    {
    }
  }
  v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v37 = [v36 localizedStringForKey:@"FACE_MASK_ID" value:&stru_1F4081468 table:@"Pearl-periocular"];
  v38 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v39 = [v38 localizedStringForKey:@"FACE_MASK_ID_SUBTEXT" value:&stru_1F4081468 table:@"Pearl-periocular"];
  v52.receiver = self;
  v52.super_class = (Class)BKUIPeriocularEnableSplashViewController;
  v40 = [(OBTableWelcomeController *)&v52 initWithTitle:v37 detailText:v39 icon:0 adoptTableViewScrollView:1];

  v35 = v50;
  v34 = v51;
  if (v40)
  {
    v40->_upsell = (char)v9;
    v40->_inBuddy = a3;
    v41 = _Block_copy(v51);
    id endEnrollActionPrimary = v40->_endEnrollActionPrimary;
    v40->_id endEnrollActionPrimary = v41;

    v43 = _Block_copy(v50);
    id endEnrollActionSecondary = v40->_endEnrollActionSecondary;
    v40->_id endEnrollActionSecondary = v43;

    objc_storeStrong((id *)&v40->_device, v10);
    v40->_maxCellHeight = -1.0;
    v45 = [(BKUIPeriocularEnableSplashViewController *)v40 headerView];
    v46 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v45 setTintColor:v46];
  }
  self = v40;
  v33 = self;
LABEL_25:

  return v33;
}

uint64_t __129__BKUIPeriocularEnableSplashViewController_initInBuddy_bkDevice_upsell_withEndEnrollmentActionPrimary_enrollmentActionSecondary___block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPeriocularEnrollment];
}

- (void)viewDidLoad
{
  v72[2] = *MEMORY[0x1E4F143B8];
  v70.receiver = self;
  v70.super_class = (Class)BKUIPeriocularEnableSplashViewController;
  [(OBTableWelcomeController *)&v70 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"State 1" darkStateName:@"Dark 1" transitionDuration:0.01 transitionSpeed:1.0];
  v72[0] = v3;
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F83A68]) initWithStateName:@"State 2" darkStateName:@"Dark 2" transitionDuration:1.5 transitionSpeed:0.8];
  v72[1] = v4;
  v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v72 count:2];

  id v6 = objc_alloc(MEMORY[0x1E4F83A60]);
  v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v8 = [v7 URLForResource:@"FaceMaskID" withExtension:@"ca"];
  id v9 = [(BKUIPeriocularEnableSplashViewController *)self headerView];
  id v10 = [v9 animationView];
  v11 = [v5 objectAtIndexedSubscript:0];
  id v12 = (void *)[v6 initWithUrlToPackage:v8 animationView:v10 animatedStates:v5 startAtFirstState:v11];
  [(BKUIPeriocularEnableSplashViewController *)self setAnimationController:v12];

  v13 = +[BKUIDevice sharedInstance];
  LODWORD(v8) = [v13 isN69];

  if (v8) {
    double v14 = 0.0333333333;
  }
  else {
    double v14 = 0.0666666667;
  }
  v15 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:0];
  v16 = [(BKUIPeriocularEnableSplashViewController *)self _createCellForIndexPath:v15];
  [(BKUIPeriocularEnableSplashViewController *)self setCellTop:v16];

  v17 = [MEMORY[0x1E4F28D58] indexPathForItem:0 inSection:1];
  id v18 = [(BKUIPeriocularEnableSplashViewController *)self _createCellForIndexPath:v17];
  [(BKUIPeriocularEnableSplashViewController *)self setCellBottom:v18];

  v19 = [(BKUIPeriocularEnableSplashViewController *)self headerView];
  v20 = [v19 animationView];
  [v20 defaultScale];
  double v22 = v21;
  v23 = [(BKUIPeriocularEnableSplashViewController *)self headerView];
  id v24 = [v23 animationView];
  [v24 setScale:v14 + v22];

  id v25 = objc_alloc(MEMORY[0x1E4F42E98]);
  v26 = objc_msgSend(v25, "initWithFrame:style:", 2, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(OBTableWelcomeController *)self setTableView:v26];

  v27 = [(OBTableWelcomeController *)self tableView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(OBTableWelcomeController *)self tableView];
  [v28 setDelegate:self];

  v29 = [(OBTableWelcomeController *)self tableView];
  [v29 setDataSource:self];

  int v30 = [(OBTableWelcomeController *)self tableView];
  [v30 setRowHeight:*MEMORY[0x1E4F43D18]];

  v31 = [(OBTableWelcomeController *)self tableView];
  [v31 setEstimatedRowHeight:0.0];

  v32 = [MEMORY[0x1E4F428B8] clearColor];
  v33 = [(OBTableWelcomeController *)self tableView];
  [v33 setBackgroundColor:v32];

  v34 = [(OBTableWelcomeController *)self tableView];
  [v34 reloadData];

  v35 = [(OBBaseWelcomeController *)self navigationItem];
  [v35 setHidesBackButton:1];

  v36 = [MEMORY[0x1E4F83AB8] linkButton];
  [(BKUIPeriocularEnableSplashViewController *)self setSkipButton:v36];

  v37 = [(BKUIPeriocularEnableSplashViewController *)self skipButton];
  [v37 setTranslatesAutoresizingMaskIntoConstraints:0];

  v38 = [(BKUIPeriocularEnableSplashViewController *)self skipButton];
  [v38 addTarget:self action:sel__enrollSkipped_ forControlEvents:64];

  v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v40 = [v39 localizedStringForKey:@"SET_UP_LATER" value:&stru_1F4081468 table:@"Pearl-periocular"];

  if ([(BKUIPeriocularEnableSplashViewController *)self inBuddy])
  {
    v41 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v42 = [v41 localizedStringForKey:@"SET_UP_LATER_IN_SETTINGS" value:&stru_1F4081468 table:@"Pearl-periocular"];

    v40 = (void *)v42;
  }
  v43 = [(BKUIPeriocularEnableSplashViewController *)self skipButton];
  [v43 setTitle:v40 forState:0];

  v44 = [(BKUIPeriocularEnableSplashViewController *)self buttonTray];
  v45 = [(BKUIPeriocularEnableSplashViewController *)self skipButton];
  [v44 addButton:v45];

  v46 = [MEMORY[0x1E4F83A98] accessoryButton];
  v47 = (void *)MEMORY[0x1E4F83AC8];
  char v48 = [MEMORY[0x1E4F83A88] bundleWithIdentifier:@"com.apple.onboarding.faceid"];
  v49 = [v47 flowWithBundle:v48];

  id v50 = [v49 localizedButtonTitle];
  [v46 setTitle:v50 forState:0];

  [v46 addTarget:self action:sel__showPrivacyLink forControlEvents:64];
  id v51 = [(BKUIPeriocularEnableSplashViewController *)self headerView];
  [v51 addAccessoryButton:v46];

  objc_super v52 = [(BKUIPeriocularEnableSplashViewController *)self buttonTray];
  [v52 setNeedsLayout];

  id v53 = [(BKUIPeriocularEnableSplashViewController *)self buttonTray];
  [v53 layoutIfNeeded];

  id v54 = [(BKUIPeriocularEnableSplashViewController *)self cellTop];
  id v55 = [(BKUIPeriocularEnableSplashViewController *)self cellTop];
  [v55 bounds];
  objc_msgSend(v54, "systemLayoutSizeFittingSize:", v56, 0.0);
  double v58 = v57;

  v59 = [(BKUIPeriocularEnableSplashViewController *)self cellBottom];
  v60 = [(BKUIPeriocularEnableSplashViewController *)self cellTop];
  [v60 bounds];
  objc_msgSend(v59, "systemLayoutSizeFittingSize:", v61, 0.0);
  double v63 = v62;

  if (v63 >= v58) {
    double v64 = v63;
  }
  else {
    double v64 = v58;
  }
  [(BKUIPeriocularEnableSplashViewController *)self setMaxCellHeight:v64];
  objc_initWeak(&location, self);
  v71[0] = objc_opt_class();
  v71[1] = objc_opt_class();
  v65 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:2];
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = __55__BKUIPeriocularEnableSplashViewController_viewDidLoad__block_invoke;
  v67[3] = &unk_1E6EA2070;
  objc_copyWeak(&v68, &location);
  v66 = [(BKUIPeriocularEnableSplashViewController *)self registerForTraitChanges:v65 withHandler:v67];
  [(BKUIPeriocularEnableSplashViewController *)self setTraitChangeRegistration:v66];

  objc_destroyWeak(&v68);
  objc_destroyWeak(&location);
}

void __55__BKUIPeriocularEnableSplashViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMaxCellHeight:-1.0];
  v1 = [WeakRetained cellTop];
  v2 = [WeakRetained cellTop];
  [v2 bounds];
  objc_msgSend(v1, "systemLayoutSizeFittingSize:", v3, 0.0);
  double v5 = v4;

  id v6 = [WeakRetained cellBottom];
  v7 = [WeakRetained cellTop];
  [v7 bounds];
  objc_msgSend(v6, "systemLayoutSizeFittingSize:", v8, 0.0);
  double v10 = v9;

  if (v10 >= v5) {
    double v11 = v10;
  }
  else {
    double v11 = v5;
  }
  [WeakRetained setMaxCellHeight:v11];
  id v12 = [WeakRetained tableView];
  [v12 reloadData];

  v13 = [WeakRetained view];
  [v13 setNeedsLayout];

  double v14 = [WeakRetained view];
  [v14 layoutIfNeeded];
}

- (void)viewWillAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIPeriocularEnableSplashViewController;
  [(OBTableWelcomeController *)&v6 viewWillAppear:a3];
  double v4 = [(BKUIPeriocularEnableSplashViewController *)self animationController];
  [v4 startAnimation];

  double v5 = [(OBTableWelcomeController *)self tableView];
  [v5 reloadData];
}

- (void)_showPrivacyLink
{
  id v3 = [MEMORY[0x1E4F83AD8] presenterForPrivacySplashWithIdentifier:@"com.apple.onboarding.faceid"];
  [v3 setPresentingViewController:self];
  [v3 present];
}

- (void)_continuePressed:(id)a3
{
  double v4 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionPrimary];

  if (v4)
  {
    double v5 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionPrimary];
    v5[2]();
  }
}

- (void)_enrollSkipped:(id)a3
{
  double v4 = [(BKUIPeriocularEnableSplashViewController *)self skipButton];
  [v4 setUserInteractionEnabled:0];

  if ([(BKUIPeriocularEnableSplashViewController *)self inBuddy]
    && ([(BKUIPeriocularEnableSplashViewController *)self userSkippedAction],
        double v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    uint64_t v6 = [(BKUIPeriocularEnableSplashViewController *)self userSkippedAction];
  }
  else
  {
    v7 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionSecondary];

    if (!v7) {
      return;
    }
    uint64_t v6 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionSecondary];
  }
  id v8 = (id)v6;
  (*(void (**)(void))(v6 + 16))();
}

+ (void)setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:(id)a3 credentialSet:(id)a4 enabled:(BOOL)a5
{
}

+ (void)setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:(id)a3 credentialSet:(id)a4 authContext:(id)a5 enabled:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = objc_alloc_init(MEMORY[0x1E4F50540]);
  v16 = [NSNumber numberWithBool:v8];
  [v15 setPeriocularFaceIDMatchEnabled:v16];

  objc_initWeak(&location, v11);
  uint64_t v17 = getuid();
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke;
  v20[3] = &unk_1E6EA2C28;
  BOOL v24 = v13 != 0;
  id v18 = v13;
  id v21 = v18;
  BOOL v25 = v8;
  objc_copyWeak(&v23, &location);
  id v19 = v14;
  id v22 = v19;
  [v11 setProtectedConfiguration:v15 forUser:v17 credentialSet:v12 reply:v20];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = v5;
  if (*(unsigned char *)(a1 + 56) && !*(void *)(a1 + 32)) {
    __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_cold_1();
  }
  if (v5 || (a2 & 1) == 0)
  {
    v7 = _BKUILoggingFacility();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = *(unsigned __int8 *)(a1 + 57);
      *(_DWORD *)buf = 67109378;
      int v17 = v8;
      __int16 v18 = 2112;
      id v19 = v6;
      _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "Failed to set userProtectedConfigurationWithError with value:%i error: %@", buf, 0x12u);
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  double v10 = _BKUILoggingFacility();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    id v11 = [WeakRetained protectedConfigurationForUser:getuid() error:0];
    id v12 = [v11 periocularFaceIDMatchEnabled];
    int v13 = [v12 BOOLValue];
    *(_DWORD *)buf = 67109120;
    int v17 = v13;
    _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "Final protectedConfigurationForUser faceIDMatchEnabled value %i", buf, 8u);
  }
  if (*(void *)(a1 + 40))
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_67;
    block[3] = &unk_1E6EA2568;
    id v15 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_67(uint64_t a1)
{
  v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Final protectedConfigurationForUser: invoking completion block", v4, 2u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (double)headerViewBottomToTableViewTopPadding
{
  return 13.0;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E4F43D18];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result = 0.0;
  if (!a4) {
    return 10.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  double v4 = objc_opt_new();

  return v4;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  double v4 = objc_opt_new();

  return v4;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectRowAtIndexPath:v7 animated:1];
  [v6 setAllowsSelection:0];
  uint64_t v8 = [v7 section];

  if (v8 == 1)
  {
    double v9 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionPrimary];

    if (v9)
    {
      uint64_t v10 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionSecondary];
LABEL_6:
      id v12 = (void *)v10;
      (*(void (**)(void))(v10 + 16))();
    }
  }
  else
  {
    id v11 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionSecondary];

    if (v11)
    {
      uint64_t v10 = [(BKUIPeriocularEnableSplashViewController *)self endEnrollActionPrimary];
      goto LABEL_6;
    }
  }
  dispatch_time_t v13 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__BKUIPeriocularEnableSplashViewController_tableView_didSelectRowAtIndexPath___block_invoke;
  block[3] = &unk_1E6EA20C0;
  id v16 = v6;
  id v14 = v6;
  dispatch_after(v13, MEMORY[0x1E4F14428], block);
}

uint64_t __78__BKUIPeriocularEnableSplashViewController_tableView_didSelectRowAtIndexPath___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAllowsSelection:1];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  [(BKUIPeriocularEnableSplashViewController *)self maxCellHeight];
  if (v5 < 0.0) {
    return *MEMORY[0x1E4F43D18];
  }

  [(BKUIPeriocularEnableSplashViewController *)self maxCellHeight];
  return result;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  if (objc_msgSend(a4, "section", a3) == 1) {
    [(BKUIPeriocularEnableSplashViewController *)self cellBottom];
  }
  else {
  double v5 = [(BKUIPeriocularEnableSplashViewController *)self cellTop];
  }

  return v5;
}

- (id)_createCellForIndexPath:(id)a3
{
  id v3 = a3;
  double v4 = [[BKUIPeriocularSelectionCell alloc] initWithStyle:3 reuseIdentifier:&stru_1F4081468];
  uint64_t v5 = [v3 section];

  id v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = v6;
  if (v5 == 1)
  {
    uint64_t v8 = [v6 localizedStringForKey:@"FACE_MASK_ID_DONT_USE" value:&stru_1F4081468 table:@"Pearl-periocular"];
    double v9 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
    [v9 setText:v8];

    uint64_t v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v11 = [v10 localizedStringForKey:@"FACE_MASK_ID_DONT_USE_DETAIL_TEXT" value:&stru_1F4081468 table:@"Pearl-periocular"];
    id v12 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
    [v12 setText:v11];

    dispatch_time_t v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"faceid"];
    id v14 = [(BKUIPeriocularSelectionCell *)v4 iconView];
    [v14 setImage:v13];
LABEL_7:

    goto LABEL_8;
  }
  id v15 = [v6 localizedStringForKey:@"FACE_MASK_ID_USE" value:&stru_1F4081468 table:@"Pearl-periocular"];
  id v16 = [(BKUIPeriocularSelectionCell *)v4 titleLabel];
  [v16 setText:v15];

  int v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v14 = [v17 localizedStringForKey:@"FACE_MASK_ID_USE_DETAIL_TEXT" value:&stru_1F4081468 table:@"Pearl-periocular"];
  __int16 v18 = [(BKUIPeriocularSelectionCell *)v4 subtitleLabel];
  [v18 setText:v14];

  dispatch_time_t v13 = [MEMORY[0x1E4F42A80] systemImageNamed:@"faceid.and.mask"];
  id v19 = v13;
  if (!v13)
  {
    uint64_t v20 = (void *)MEMORY[0x1E4F42A80];
    id v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v19 = [v20 imageNamed:@"local.faceid.and.mask" inBundle:v14 withConfiguration:0];
  }
  id v21 = [(BKUIPeriocularSelectionCell *)v4 iconView];
  [v21 setImage:v19];

  if (!v13)
  {

    goto LABEL_7;
  }
LABEL_8:

  [(BKUIPeriocularSelectionCell *)v4 setAccessoryType:1];

  return v4;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = [(BKUIPeriocularEnableSplashViewController *)self traitCollection];
  uint64_t v3 = [v2 userInterfaceStyle];

  if (v3 == 1) {
    return 3;
  }
  else {
    return 1;
  }
}

- (double)maxCellHeight
{
  return self->_maxCellHeight;
}

- (void)setMaxCellHeight:(double)a3
{
  self->_maxCellHeight = a3;
}

- (BKUIPeriocularSelectionCell)cellTop
{
  return self->_cellTop;
}

- (void)setCellTop:(id)a3
{
}

- (BKUIPeriocularSelectionCell)cellBottom
{
  return self->_cellBottom;
}

- (void)setCellBottom:(id)a3
{
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (id)endEnrollActionPrimary
{
  return self->_endEnrollActionPrimary;
}

- (void)setEndEnrollActionPrimary:(id)a3
{
}

- (id)endEnrollActionSecondary
{
  return self->_endEnrollActionSecondary;
}

- (void)setEndEnrollActionSecondary:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (BKDevice)device
{
  return self->_device;
}

- (void)setDevice:(id)a3
{
}

- (BOOL)upsell
{
  return self->_upsell;
}

- (void)setUpsell:(BOOL)a3
{
  self->_upsell = a3;
}

- (OBPrivacyLinkController)linkController
{
  return self->_linkController;
}

- (void)setLinkController:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (id)userSkippedAction
{
  return self->_userSkippedAction;
}

- (void)setUserSkippedAction:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong(&self->_userSkippedAction, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_linkController, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong(&self->_endEnrollActionSecondary, 0);
  objc_storeStrong(&self->_endEnrollActionPrimary, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_cellBottom, 0);

  objc_storeStrong((id *)&self->_cellTop, 0);
}

- (void)initInBuddy:(uint64_t)a1 bkDevice:(NSObject *)a2 upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "BKUIPearl:unable to fetch BKUserProtectedConfiguration and determine if the user already enabled Periocular Splash ... error?:%@", (uint8_t *)&v2, 0xCu);
}

- (void)initInBuddy:(uint64_t)a1 bkDevice:(NSObject *)a2 upsell:withEndEnrollmentActionPrimary:enrollmentActionSecondary:.cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_ERROR, "BKUIPearl:unable to fetch BKSystemProtectedConfiguration and determine if the user already enabled Periocular Splash ... error?:%@", (uint8_t *)&v2, 0xCu);
}

void __151__BKUIPeriocularEnableSplashViewController_setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice_credentialSet_authContext_enabled_completion___block_invoke_cold_1()
{
  __assert_rtn("+[BKUIPeriocularEnableSplashViewController setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:credentialSet:authContext:enabled:completion:]_block_invoke", "BKUIPeriocularEnableSplashViewController.m", 219, "authContext != nil");
}

@end