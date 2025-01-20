@interface HUHomeTheaterSetupViewController
- (Class)onboardingFlowClass;
- (HMAccessory)accessory;
- (HMHome)home;
- (HUConfigurationViewControllerDelegate)delegate;
- (HUHomeTheaterAudioItemModule)tableViewControllerModule;
- (HUHomeTheaterSetupViewController)initWithAppleTVAccessory:(id)a3 inHome:(id)a4;
- (HUHomeTheaterSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6;
- (HUHomeTheaterSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6;
- (HUSimpleItemModuleTableViewController)tableViewController;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (NSLayoutConstraint)tableViewHeightConstraint;
- (OBLinkTrayButton)notNowButton;
- (OBTrayButton)useHomeTheaterButton;
- (UIEdgeInsets)contentInsets;
- (UIImageView)contentImageView;
- (id)hu_preloadContent;
- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4;
- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4;
- (void)_activateHomeTheater:(id)a3;
- (void)_doNotActivateHomeTheater:(id)a3;
- (void)_updateHeightConstraints;
- (void)homeTheaterItemModuleDidChangeSelectedDestination:(id)a3;
- (void)setAccessory:(id)a3;
- (void)setContentImageView:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHome:(id)a3;
- (void)setNotNowButton:(id)a3;
- (void)setTableViewController:(id)a3;
- (void)setTableViewControllerModule:(id)a3;
- (void)setTableViewHeightConstraint:(id)a3;
- (void)setUseHomeTheaterButton:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation HUHomeTheaterSetupViewController

- (HUHomeTheaterSetupViewController)initWithAppleTVAccessory:(id)a3 inHome:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = objc_msgSend(v7, "hf_displayName");
  v16 = HULocalizedStringWithFormat(@"HUHomeTheaterSetup_Title", @"%@", v10, v11, v12, v13, v14, v15, (uint64_t)v9);

  v17 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSetup_Detail", @"HUHomeTheaterSetup_Detail", 1);
  v20.receiver = self;
  v20.super_class = (Class)HUHomeTheaterSetupViewController;
  v18 = [(HUHomeTheaterSetupViewController *)&v20 initWithTitle:v16 detailText:v17 icon:0 contentLayout:2];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_accessory, a3);
    objc_storeStrong((id *)&v18->_home, a4);
    *(_OWORD *)&v18->_contentInsets.top = xmmword_1BEA19F30;
    *(_OWORD *)&v18->_contentInsets.bottom = xmmword_1BEA19F30;
  }

  return v18;
}

- (HUHomeTheaterSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 contentLayout:(int64_t)a6
{
  id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithAppleTVAccessory_inHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeTheaterSetupViewController.m", 62, @"%s is unavailable; use %@ instead",
    "-[HUHomeTheaterSetupViewController initWithTitle:detailText:symbolName:contentLayout:]",
    v9);

  return 0;
}

- (HUHomeTheaterSetupViewController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 contentLayout:(int64_t)a6
{
  id v8 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3, a4, a5, a6);
  v9 = NSStringFromSelector(sel_initWithAppleTVAccessory_inHome_);
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HUHomeTheaterSetupViewController.m", 67, @"%s is unavailable; use %@ instead",
    "-[HUHomeTheaterSetupViewController initWithTitle:detailText:icon:contentLayout:]",
    v9);

  return 0;
}

- (void)viewDidLoad
{
  v148[12] = *MEMORY[0x1E4F143B8];
  v143.receiver = self;
  v143.super_class = (Class)HUHomeTheaterSetupViewController;
  [(OBBaseWelcomeController *)&v143 viewDidLoad];
  v3 = [(HUHomeTheaterSetupViewController *)self headerView];
  v4 = [v3 subviews];
  +[HUAccessibilityIdentifierUtilities setAccessibilityIDForViews:v4 withIDDictionary:&unk_1F19B5ED0];

  v5 = [MEMORY[0x1E4F83A80] boldButton];
  [(HUHomeTheaterSetupViewController *)self setUseHomeTheaterButton:v5];

  v6 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v7 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  id v8 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSetup_UseHomeTheaterButton", @"HUHomeTheaterSetup_UseHomeTheaterButton", 1);
  [v7 setTitle:v8 forState:0];

  v9 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  [v9 setAccessibilityIdentifier:@"Home.OnboardingView.HomeTheater.SetUp.UseHomeTheaterButton"];

  uint64_t v10 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  [v10 addTarget:self action:sel__activateHomeTheater_ forControlEvents:64];

  uint64_t v11 = [(HUHomeTheaterSetupViewController *)self buttonTray];
  uint64_t v12 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  [v11 addButton:v12];

  uint64_t v13 = [MEMORY[0x1E4F83AB8] linkButton];
  [(HUHomeTheaterSetupViewController *)self setNotNowButton:v13];

  uint64_t v14 = [(HUHomeTheaterSetupViewController *)self notNowButton];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];

  uint64_t v15 = [(HUHomeTheaterSetupViewController *)self notNowButton];
  v16 = _HULocalizedStringWithDefaultValue(@"HUHomeTheaterSetup_NotNowButton", @"HUHomeTheaterSetup_NotNowButton", 1);
  [v15 setTitle:v16 forState:0];

  v17 = [(HUHomeTheaterSetupViewController *)self notNowButton];
  [v17 setAccessibilityIdentifier:@"Home.OnboardingView.HomeTheater.SetUp.NotNowButton"];

  v18 = [(HUHomeTheaterSetupViewController *)self notNowButton];
  [v18 addTarget:self action:sel__doNotActivateHomeTheater_ forControlEvents:64];

  v19 = [(HUHomeTheaterSetupViewController *)self buttonTray];
  objc_super v20 = [(HUHomeTheaterSetupViewController *)self notNowButton];
  [v19 addButton:v20];

  [(HUHomeTheaterSetupViewController *)self setModalInPresentation:1];
  id v21 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v22 = HUImageNamed(@"Onboarding-HomeTheater");
  v23 = (void *)[v21 initWithImage:v22];
  [(HUHomeTheaterSetupViewController *)self setContentImageView:v23];

  v24 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  [v24 setTranslatesAutoresizingMaskIntoConstraints:0];

  v25 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  [v25 setContentMode:1];

  v26 = [(HUHomeTheaterSetupViewController *)self contentView];
  v27 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  [v26 addSubview:v27];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __47__HUHomeTheaterSetupViewController_viewDidLoad__block_invoke;
  aBlock[3] = &unk_1E6387A08;
  aBlock[4] = self;
  v141 = _Block_copy(aBlock);
  v28 = [[HUSimpleItemModuleTableViewController alloc] initWithTableViewStyle:1 moduleCreator:v141 moduleControllerBuilder:&__block_literal_global_225];
  [(HUHomeTheaterSetupViewController *)self setTableViewController:v28];

  v29 = [MEMORY[0x1E4F428B8] clearColor];
  v30 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v31 = [v30 view];
  [v31 setBackgroundColor:v29];

  v32 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v33 = [v32 tableView];
  [v33 setScrollEnabled:0];

  v34 = [(HUHomeTheaterSetupViewController *)self traitCollection];
  BOOL v35 = [v34 userInterfaceStyle] != 2;
  v36 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  [v36 setShouldUseAlternateCellColor:v35];

  v37 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  [v37 setWantsPreferredContentSize:1];

  v38 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v39 = [v38 view];
  [v39 setTranslatesAutoresizingMaskIntoConstraints:0];

  v40 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v41 = [v40 tableView];
  objc_msgSend(v41, "setLayoutMargins:", 0.0, 1.0, 0.0, 1.0);

  v42 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  [v42 setSectionContentInsetFollowsLayoutMargins:1];

  v43 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  [(HUHomeTheaterSetupViewController *)self addChildViewController:v43];

  v44 = [(HUHomeTheaterSetupViewController *)self contentView];
  v45 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v46 = [v45 view];
  [v44 addSubview:v46];

  v47 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v48 = [v47 view];
  v49 = [v48 heightAnchor];
  v50 = [v49 constraintEqualToConstant:1.0];
  tableViewHeightConstraint = self->_tableViewHeightConstraint;
  self->_tableViewHeightConstraint = v50;

  v52 = [(HUHomeTheaterSetupViewController *)self contentView];
  v53 = [v52 heightAnchor];
  v54 = [v53 constraintLessThanOrEqualToConstant:1.0];
  LODWORD(v55) = 1148829696;
  objc_msgSend(v54, "hu_constraintWithPriority:", v55);
  v56 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  contentViewHeightConstraint = self->_contentViewHeightConstraint;
  self->_contentViewHeightConstraint = v56;

  v58 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v59 = [v58 widthAnchor];
  v60 = [(HUHomeTheaterSetupViewController *)self contentView];
  v61 = [v60 layoutMarginsGuide];
  v62 = [v61 widthAnchor];
  [(HUHomeTheaterSetupViewController *)self contentInsets];
  double v64 = -v63;
  [(HUHomeTheaterSetupViewController *)self contentInsets];
  v66 = [v59 constraintLessThanOrEqualToAnchor:v62 constant:v64 - v65];

  LODWORD(v67) = 1148846080;
  [v66 setPriority:v67];
  v68 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v69 = [v68 image];
  [v69 size];
  double v71 = v70;
  v72 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v73 = [v72 image];
  [v73 size];
  double v75 = v71 / v74;

  v117 = (void *)MEMORY[0x1E4F28DC8];
  v139 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v136 = [v139 topAnchor];
  v138 = [(HUHomeTheaterSetupViewController *)self contentView];
  v137 = [v138 layoutMarginsGuide];
  v135 = [v137 topAnchor];
  [(HUHomeTheaterSetupViewController *)self contentInsets];
  v134 = objc_msgSend(v136, "constraintEqualToAnchor:constant:", v135);
  v148[0] = v134;
  v133 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v131 = [v133 centerXAnchor];
  v132 = [(HUHomeTheaterSetupViewController *)self contentView];
  v130 = [v132 layoutMarginsGuide];
  v129 = [v130 centerXAnchor];
  v128 = [v131 constraintEqualToAnchor:v129];
  v148[1] = v128;
  v127 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v125 = [v127 widthAnchor];
  v126 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v124 = [v126 image];
  [v124 size];
  v123 = objc_msgSend(v125, "constraintLessThanOrEqualToConstant:");
  LODWORD(v76) = 1148846080;
  v122 = objc_msgSend(v123, "hu_constraintWithPriority:", v76);
  v148[2] = v122;
  v121 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v120 = [v121 heightAnchor];
  v119 = [v120 constraintGreaterThanOrEqualToConstant:150.0];
  LODWORD(v77) = 1148846080;
  v118 = objc_msgSend(v119, "hu_constraintWithPriority:", v77);
  v148[3] = v118;
  v116 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v114 = [v116 heightAnchor];
  v115 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v113 = [v115 widthAnchor];
  v112 = [v114 constraintEqualToAnchor:v113 multiplier:v75];
  LODWORD(v78) = 1148846080;
  v111 = objc_msgSend(v112, "hu_constraintWithPriority:", v78);
  v148[4] = v111;
  v110 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v109 = [v110 view];
  v107 = [v109 topAnchor];
  v108 = [(HUHomeTheaterSetupViewController *)self contentImageView];
  v106 = [v108 bottomAnchor];
  v105 = [v107 constraintEqualToSystemSpacingBelowAnchor:v106 multiplier:1.0];
  v148[5] = v105;
  v104 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v103 = [v104 view];
  v101 = [v103 leadingAnchor];
  v102 = [(HUHomeTheaterSetupViewController *)self contentView];
  v100 = [v102 leadingAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v148[6] = v99;
  v98 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v97 = [v98 view];
  v95 = [v97 trailingAnchor];
  v96 = [(HUHomeTheaterSetupViewController *)self contentView];
  v94 = [v96 trailingAnchor];
  v93 = [v95 constraintEqualToAnchor:v94];
  v148[7] = v93;
  v92 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  v79 = [v92 view];
  v80 = [v79 bottomAnchor];
  v81 = [(HUHomeTheaterSetupViewController *)self contentView];
  v82 = [v81 layoutMarginsGuide];
  v83 = [v82 bottomAnchor];
  [(HUHomeTheaterSetupViewController *)self contentInsets];
  v85 = [v80 constraintEqualToAnchor:v83 constant:v84];
  v148[8] = v85;
  v148[9] = v66;
  v140 = v66;
  v86 = [(HUHomeTheaterSetupViewController *)self contentViewHeightConstraint];
  v148[10] = v86;
  v87 = [(HUHomeTheaterSetupViewController *)self tableViewHeightConstraint];
  v148[11] = v87;
  v88 = [MEMORY[0x1E4F1C978] arrayWithObjects:v148 count:12];
  [v117 activateConstraints:v88];

  [(HUHomeTheaterSetupViewController *)self updateViewConstraints];
  v89 = HFLogForCategory();
  if (os_log_type_enabled(v89, OS_LOG_TYPE_DEFAULT))
  {
    v90 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v145 = self;
    __int16 v146 = 2112;
    v147 = v90;
    _os_log_impl(&dword_1BE345000, v89, OS_LOG_TYPE_DEFAULT, "%@:%@: presented: HTSVC", buf, 0x16u);
  }
}

id __47__HUHomeTheaterSetupViewController_viewDidLoad__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [HUHomeTheaterAudioItemModule alloc];
  v6 = [*(id *)(a1 + 32) accessory];
  id v7 = [v6 mediaProfile];
  id v8 = [(HUHomeTheaterAudioItemModule *)v5 initWithItemUpdater:v4 mediaProfileContainer:v7 includeLocalDestinations:0];

  [(HUHomeTheaterAudioItemModule *)v8 setDisableAutomaticCommit:1];
  [(HUHomeTheaterAudioItemModule *)v8 setOnboardingDelegate:*(void *)(a1 + 32)];
  [*(id *)(a1 + 32) setTableViewControllerModule:v8];
  [*(id *)(a1 + 32) homeTheaterItemModuleDidChangeSelectedDestination:v8];
  v11[0] = v8;
  v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];

  return v9;
}

HUHomeTheaterAudioItemModuleController *__47__HUHomeTheaterSetupViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [(HUItemModuleController *)[HUHomeTheaterAudioItemModuleController alloc] initWithModule:v2];

  return v3;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HUHomeTheaterSetupViewController;
  [(HUHomeTheaterSetupViewController *)&v7 traitCollectionDidChange:a3];
  id v4 = [(HUHomeTheaterSetupViewController *)self traitCollection];
  BOOL v5 = [v4 userInterfaceStyle] != 2;
  v6 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  [v6 setShouldUseAlternateCellColor:v5];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)HUHomeTheaterSetupViewController;
  [(HUHomeTheaterSetupViewController *)&v3 viewWillLayoutSubviews];
  [(HUHomeTheaterSetupViewController *)self _updateHeightConstraints];
}

- (void)updateViewConstraints
{
  v3.receiver = self;
  v3.super_class = (Class)HUHomeTheaterSetupViewController;
  [(HUHomeTheaterSetupViewController *)&v3 updateViewConstraints];
  [(HUHomeTheaterSetupViewController *)self _updateHeightConstraints];
}

- (id)hu_preloadContent
{
  id v2 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  objc_super v3 = objc_msgSend(v2, "hu_preloadContent");
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F7A0D8] futureWithNoResult];
  }
  v6 = v5;

  return v6;
}

- (id)moduleController:(id)a3 presentViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performPresentationRequest:a4];
}

- (id)moduleController:(id)a3 dismissViewControllerForRequest:(id)a4
{
  return [(UIViewController *)self hu_performDismissalRequest:a4];
}

- (id)moduleController:(id)a3 textFieldForVisibleItem:(id)a4
{
  return 0;
}

- (void)homeTheaterItemModuleDidChangeSelectedDestination:(id)a3
{
  id v7 = a3;
  id v4 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  id v5 = [v7 tappedDestinationIdentifier];
  if (v5)
  {
    [v4 setEnabled:1];
  }
  else
  {
    v6 = [v7 selectedUncommittedItem];
    [v4 setEnabled:v6 != 0];
  }
}

- (void)_updateHeightConstraints
{
  objc_super v3 = [(HUHomeTheaterSetupViewController *)self tableViewController];
  [v3 preferredContentSize];
  double v5 = v4;
  v6 = [(HUHomeTheaterSetupViewController *)self tableViewHeightConstraint];
  [v6 setConstant:v5];

  id v7 = [(HUHomeTheaterSetupViewController *)self headerView];
  [v7 frame];
  double v9 = v8;

  uint64_t v10 = [(HUHomeTheaterSetupViewController *)self headerView];
  [v10 frame];
  double v12 = v11;
  uint64_t v13 = [(HUHomeTheaterSetupViewController *)self contentView];
  [v13 frame];
  double v15 = v14;
  v16 = [(HUHomeTheaterSetupViewController *)self headerView];
  [v16 frame];
  double v17 = v12 + v15 - CGRectGetMaxY(v27);

  v18 = [(HUHomeTheaterSetupViewController *)self buttonTray];
  [v18 frame];
  double v20 = v19;

  id v21 = [(HUHomeTheaterSetupViewController *)self scrollView];
  [v21 frame];
  double MaxY = CGRectGetMaxY(v28);
  v23 = [(HUHomeTheaterSetupViewController *)self buttonTray];
  [v23 frame];
  double v24 = MaxY - CGRectGetMaxY(v29);

  id v25 = [(HUHomeTheaterSetupViewController *)self contentViewHeightConstraint];
  [v25 setConstant:-v9 - v17 - v20 - v24];
}

- (void)_activateHomeTheater:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v22 = self;
    __int16 v23 = 2112;
    double v24 = v7;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  double v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    NSStringFromSelector(a2);
    double v9 = (HUHomeTheaterSetupViewController *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v22 = v9;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "%@: Setting Up Home Theater", buf, 0xCu);
  }
  uint64_t v10 = [(HUHomeTheaterSetupViewController *)self tableViewControllerModule];
  double v11 = [v10 commitConfiguration];

  double v12 = [(HUHomeTheaterSetupViewController *)self useHomeTheaterButton];
  uint64_t v13 = [v12 activityIndicator];
  [v13 startAnimating];

  [v5 setEnabled:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke;
  v20[3] = &unk_1E6387DC8;
  v20[4] = self;
  double v14 = [v11 addSuccessBlock:v20];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke_72;
  v17[3] = &unk_1E638CA08;
  id v18 = v5;
  SEL v19 = a2;
  v17[4] = self;
  id v15 = v5;
  id v16 = (id)[v14 addFailureBlock:v17];
}

void __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke(uint64_t a1)
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CA60];
  v10[0] = &unk_1F19B4CD0;
  v9[0] = @"HUHomeTheaterOnboardingKey_UserInput";
  v9[1] = @"HUHomeTheaterOnboardingKey_Accessory";
  objc_super v3 = [*(id *)(a1 + 32) accessory];
  v10[1] = v3;
  double v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
  id v5 = [v2 dictionaryWithDictionary:v4];

  v6 = [*(id *)(a1 + 32) useHomeTheaterButton];
  id v7 = [v6 activityIndicator];
  [v7 stopAnimating];

  double v8 = [*(id *)(a1 + 32) delegate];
  [v8 viewController:*(void *)(a1 + 32) didFinishWithConfigurationResults:v5];
}

void __57__HUHomeTheaterSetupViewController__activateHomeTheater___block_invoke_72(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    v6 = NSStringFromSelector(*(SEL *)(a1 + 48));
    int v10 = 138412802;
    uint64_t v11 = v5;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    id v15 = v3;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "%@:%@ completed with error: %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 40) setEnabled:1];
  id v7 = [*(id *)(a1 + 32) useHomeTheaterButton];
  double v8 = [v7 activityIndicator];
  [v8 stopAnimating];

  double v9 = [MEMORY[0x1E4F69110] sharedHandler];
  [v9 handleError:v3];
}

- (void)_doNotActivateHomeTheater:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    id v15 = self;
    __int16 v16 = 2112;
    double v17 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@:%@ User tapped button", buf, 0x16u);
  }
  id v7 = (void *)MEMORY[0x1E4F1CA60];
  double v8 = [(HUHomeTheaterSetupViewController *)self accessory];
  v13[1] = v8;
  double v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:2];
  int v10 = [v7 dictionaryWithDictionary:v9];

  uint64_t v11 = [(HUHomeTheaterSetupViewController *)self delegate];
  [v11 viewController:self didFinishWithConfigurationResults:v10];
}

- (Class)onboardingFlowClass
{
  return (Class)objc_opt_class();
}

- (HUConfigurationViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HUConfigurationViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HMAccessory)accessory
{
  return self->_accessory;
}

- (void)setAccessory:(id)a3
{
}

- (HMHome)home
{
  return self->_home;
}

- (void)setHome:(id)a3
{
}

- (OBTrayButton)useHomeTheaterButton
{
  return self->_useHomeTheaterButton;
}

- (void)setUseHomeTheaterButton:(id)a3
{
}

- (OBLinkTrayButton)notNowButton
{
  return self->_notNowButton;
}

- (void)setNotNowButton:(id)a3
{
}

- (UIImageView)contentImageView
{
  return self->_contentImageView;
}

- (void)setContentImageView:(id)a3
{
}

- (HUSimpleItemModuleTableViewController)tableViewController
{
  return self->_tableViewController;
}

- (void)setTableViewController:(id)a3
{
}

- (HUHomeTheaterAudioItemModule)tableViewControllerModule
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tableViewControllerModule);

  return (HUHomeTheaterAudioItemModule *)WeakRetained;
}

- (void)setTableViewControllerModule:(id)a3
{
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  self->_contentInsets = a3;
}

- (NSLayoutConstraint)tableViewHeightConstraint
{
  return self->_tableViewHeightConstraint;
}

- (void)setTableViewHeightConstraint:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_tableViewHeightConstraint, 0);
  objc_destroyWeak((id *)&self->_tableViewControllerModule);
  objc_storeStrong((id *)&self->_tableViewController, 0);
  objc_storeStrong((id *)&self->_contentImageView, 0);
  objc_storeStrong((id *)&self->_notNowButton, 0);
  objc_storeStrong((id *)&self->_useHomeTheaterButton, 0);
  objc_storeStrong((id *)&self->_home, 0);
  objc_storeStrong((id *)&self->_accessory, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end