@interface DBRootStatusBarViewController
- (BOOL)_isDualStatusBarLayout;
- (DBAppDockViewController)appDockViewController;
- (DBEnvironment)environment;
- (DBRootStatusBarViewController)initWithEnvironment:(id)a3 iconProvider:(id)a4 climateViewController:(id)a5 audioNotificationViewController:(id)a6 stateProvider:(id)a7 layout:(unint64_t)a8;
- (DBStatusBarBackgroundView)backgroundView;
- (DBStatusBarHomeButton)homeButton;
- (DBStatusBarScreenResizeButton)screenResizeButton;
- (DBStatusBarViewController)statusBarViewController;
- (NSArray)activeConstraints;
- (NSArray)homeButtonConstraints;
- (NSArray)resizeButtonConstraints;
- (NSTimer)homeButtonTimer;
- (SiriActivityAssertion)homeButtonAssertion;
- (SiriAssertion)siriPrewarmAssertion;
- (SiriLongPressButtonSource)homeButtonSource;
- (UIEdgeInsets)extraSafeAreaInsets;
- (UITapGestureRecognizer)backPressGestureRecognizer;
- (UIView)cornerRadiusView;
- (UIView)keylineView;
- (UIView)maskView;
- (_TtC9DashBoard23DBClimateViewController)climateViewController;
- (_TtC9DashBoard33DBAudioNotificationViewController)audioNotificationViewController;
- (double)lastHomeButtonDownTime;
- (id)_appDockConstraintsWithStatusBarEdge:(unint64_t)a3;
- (id)_focusHighlightColor;
- (id)_homeButtonConstraintsWithStatusBarEdge:(unint64_t)a3;
- (id)_keylineViewConstraintsWithStatusBarEdge:(unint64_t)a3;
- (int64_t)colorVariantOverride;
- (unint64_t)currentStatusBarEdge;
- (unint64_t)layout;
- (unint64_t)transitionControlType;
- (void)_handleBackPressGesture:(id)a3;
- (void)_handleLongPressActivation;
- (void)_resizeButtonPressed:(id)a3;
- (void)_setDualStatusBarCornerRadius;
- (void)_setupAppDockViewController;
- (void)_setupHomeButton;
- (void)_setupStatusBarViewController;
- (void)_updateAdditionalSafeAreaInsets;
- (void)_updateConstraintsForStatusBar;
- (void)_updateScreenResizeButton;
- (void)appDockViewController:(id)a3 didSelectBundleID:(id)a4;
- (void)dealloc;
- (void)homeButtonCancel:(id)a3;
- (void)homeButtonDown:(id)a3;
- (void)homeButtonUp:(id)a3;
- (void)setActiveConstraints:(id)a3;
- (void)setAppDockViewController:(id)a3;
- (void)setAudioNotificationViewController:(id)a3;
- (void)setBackPressGestureRecognizer:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setClimateViewController:(id)a3;
- (void)setColorVariantOverride:(int64_t)a3;
- (void)setCornerRadiusView:(id)a3;
- (void)setCurrentStatusBarEdge:(unint64_t)a3;
- (void)setEnvironment:(id)a3;
- (void)setExtraSafeAreaInsets:(UIEdgeInsets)a3;
- (void)setHomeButton:(id)a3;
- (void)setHomeButtonAssertion:(id)a3;
- (void)setHomeButtonConstraints:(id)a3;
- (void)setHomeButtonSource:(id)a3;
- (void)setHomeButtonTimer:(id)a3;
- (void)setKeylineView:(id)a3;
- (void)setLastHomeButtonDownTime:(double)a3;
- (void)setLayout:(unint64_t)a3;
- (void)setMaskView:(id)a3;
- (void)setResizeButtonConstraints:(id)a3;
- (void)setScreenResizeButton:(id)a3;
- (void)setSiriPrewarmAssertion:(id)a3;
- (void)setStatusBarViewController:(id)a3;
- (void)setTransitionControlType:(unint64_t)a3;
- (void)statusBarHomeButtonStateManager:(id)a3 didChangeToDisplayState:(unint64_t)a4;
- (void)statusBarStyleServiceUpdatedOverride:(id)a3 animationSettings:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAppearanceForWallpaper;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5;
@end

@implementation DBRootStatusBarViewController

- (DBRootStatusBarViewController)initWithEnvironment:(id)a3 iconProvider:(id)a4 climateViewController:(id)a5 audioNotificationViewController:(id)a6 stateProvider:(id)a7 layout:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v30.receiver = self;
  v30.super_class = (Class)DBRootStatusBarViewController;
  v19 = [(DBRootStatusBarViewController *)&v30 init];
  v20 = v19;
  if (v19)
  {
    objc_storeWeak((id *)&v19->_environment, v14);
    v21 = [v14 environmentConfiguration];
    v20->_layout = a8;
    long long v22 = *(_OWORD *)(MEMORY[0x263F834E8] + 16);
    *(_OWORD *)&v20->_extraSafeAreaInsets.top = *MEMORY[0x263F834E8];
    *(_OWORD *)&v20->_extraSafeAreaInsets.bottom = v22;
    objc_storeStrong((id *)&v20->_climateViewController, a5);
    objc_storeStrong((id *)&v20->_audioNotificationViewController, a6);
    if (v15)
    {
      v23 = [DBAppDockViewController alloc];
      v24 = [v21 appHistory];
      uint64_t v25 = [(DBAppDockViewController *)v23 initWithAppHistory:v24 iconProvider:v15 environmentConfiguration:v21];
      appDockViewController = v20->_appDockViewController;
      v20->_appDockViewController = (DBAppDockViewController *)v25;
    }
    v27 = [[DBStatusBarViewController alloc] initWithStateProvider:v18 layout:a8 environmentConfiguration:v21];
    statusBarViewController = v20->_statusBarViewController;
    v20->_statusBarViewController = v27;

    v20->_colorVariantOverride = -1;
  }

  return v20;
}

- (void)setExtraSafeAreaInsets:(UIEdgeInsets)a3
{
  self->_extraSafeAreaInsets = a3;
  [(DBRootStatusBarViewController *)self _updateConstraintsForStatusBar];
  [(DBRootStatusBarViewController *)self _updateAdditionalSafeAreaInsets];
}

- (void)setClimateViewController:(id)a3
{
  objc_storeStrong((id *)&self->_climateViewController, a3);
  id v5 = a3;
  id v6 = [(DBRootStatusBarViewController *)self traitCollection];
  objc_msgSend(v5, "updateStatusBarWithStyle:", objc_msgSend(v6, "userInterfaceStyle"));
}

- (void)setAudioNotificationViewController:(id)a3
{
  objc_storeStrong((id *)&self->_audioNotificationViewController, a3);
  id v5 = a3;
  id v6 = [(DBRootStatusBarViewController *)self traitCollection];
  objc_msgSend(v5, "updateInterfaceWithStyle:", objc_msgSend(v6, "userInterfaceStyle"));
}

- (void)_setDualStatusBarCornerRadius
{
  v84[2] = *MEMORY[0x263EF8340];
  id v3 = objc_alloc(MEMORY[0x263F313B0]);
  double v4 = *MEMORY[0x263F001A8];
  double v5 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v6 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v7 = *(double *)(MEMORY[0x263F001A8] + 24);
  v8 = objc_msgSend(v3, "initWithFrame:", *MEMORY[0x263F001A8], v5, v6, v7);
  [(DBRootStatusBarViewController *)self setCornerRadiusView:v8];

  v9 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  v10 = [MEMORY[0x263F825C8] clearColor];
  v11 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  [v11 setBackgroundColor:v10];

  v12 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  v13 = [v12 layer];
  [v13 setShadowOpacity:0.0];

  id v14 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  id v15 = [v14 layer];
  [v15 setAllowsHitTesting:0];

  id v16 = objc_msgSend(objc_alloc(MEMORY[0x263F313B0]), "initWithFrame:", v4, v5, v6, v7);
  [(DBRootStatusBarViewController *)self setMaskView:v16];

  id v17 = [(DBRootStatusBarViewController *)self maskView];
  [v17 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v18 = [MEMORY[0x263F825C8] blackColor];
  v19 = [(DBRootStatusBarViewController *)self maskView];
  [v19 setBackgroundColor:v18];

  v20 = [(DBRootStatusBarViewController *)self maskView];
  v21 = [v20 layer];
  [v21 setCornerRadius:13.0];

  uint64_t v22 = *MEMORY[0x263F15A20];
  v23 = [(DBRootStatusBarViewController *)self maskView];
  v24 = [v23 layer];
  [v24 setCornerCurve:v22];

  uint64_t v25 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B90]];
  v26 = [(DBRootStatusBarViewController *)self maskView];
  v27 = [v26 layer];
  [v27 setCompositingFilter:v25];

  v28 = [(DBRootStatusBarViewController *)self maskView];
  v29 = [v28 layer];
  [v29 setShadowOpacity:0.0];

  objc_super v30 = [(DBRootStatusBarViewController *)self maskView];
  v31 = [v30 layer];
  [v31 setAllowsHitTesting:0];

  v32 = [(DBRootStatusBarViewController *)self view];
  v33 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  [v32 addSubview:v33];

  v34 = [(DBRootStatusBarViewController *)self view];
  v35 = [(DBRootStatusBarViewController *)self maskView];
  [v34 addSubview:v35];

  v36 = [(DBRootStatusBarViewController *)self view];
  v37 = [(DBRootStatusBarViewController *)self maskView];
  [v36 bringSubviewToFront:v37];

  if ([(DBRootStatusBarViewController *)self layout] == 1)
  {
    v76 = (void *)MEMORY[0x263F08938];
    v80 = [(DBRootStatusBarViewController *)self cornerRadiusView];
    v38 = [v80 leftAnchor];
    v39 = [(DBRootStatusBarViewController *)self view];
    v40 = [v39 rightAnchor];
    v78 = v38;
    v41 = [v38 constraintEqualToAnchor:v40];
    v84[0] = v41;
    v42 = [(DBRootStatusBarViewController *)self maskView];
    v43 = [v42 leftAnchor];
    v44 = [(DBRootStatusBarViewController *)self view];
    v45 = [v44 rightAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    v84[1] = v46;
    v47 = (void *)MEMORY[0x263EFF8C0];
    v48 = v84;
LABEL_5:
    v50 = [v47 arrayWithObjects:v48 count:2];
    [v76 activateConstraints:v50];

    goto LABEL_6;
  }
  if ([(DBRootStatusBarViewController *)self layout] == 2)
  {
    v76 = (void *)MEMORY[0x263F08938];
    v80 = [(DBRootStatusBarViewController *)self cornerRadiusView];
    v49 = [v80 rightAnchor];
    v39 = [(DBRootStatusBarViewController *)self view];
    v40 = [v39 leftAnchor];
    v78 = v49;
    v41 = [v49 constraintEqualToAnchor:v40];
    v83[0] = v41;
    v42 = [(DBRootStatusBarViewController *)self maskView];
    v43 = [v42 rightAnchor];
    v44 = [(DBRootStatusBarViewController *)self view];
    v45 = [v44 leftAnchor];
    v46 = [v43 constraintEqualToAnchor:v45];
    v83[1] = v46;
    v47 = (void *)MEMORY[0x263EFF8C0];
    v48 = v83;
    goto LABEL_5;
  }
LABEL_6:
  v67 = (void *)MEMORY[0x263F08938];
  v81 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  v77 = [v81 topAnchor];
  v79 = [(DBRootStatusBarViewController *)self view];
  v75 = [v79 topAnchor];
  v74 = [v77 constraintEqualToAnchor:v75];
  v82[0] = v74;
  v73 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  v71 = [v73 bottomAnchor];
  v72 = [(DBRootStatusBarViewController *)self view];
  v70 = [v72 bottomAnchor];
  v69 = [v71 constraintEqualToAnchor:v70];
  v82[1] = v69;
  v68 = [(DBRootStatusBarViewController *)self cornerRadiusView];
  v66 = [v68 widthAnchor];
  v65 = [v66 constraintEqualToConstant:13.0];
  v82[2] = v65;
  v64 = [(DBRootStatusBarViewController *)self maskView];
  v62 = [v64 topAnchor];
  v63 = [(DBRootStatusBarViewController *)self view];
  v61 = [v63 topAnchor];
  v51 = [v62 constraintEqualToAnchor:v61];
  v82[3] = v51;
  v52 = [(DBRootStatusBarViewController *)self maskView];
  v53 = [v52 widthAnchor];
  v54 = [v53 constraintEqualToConstant:26.0];
  v82[4] = v54;
  v55 = [(DBRootStatusBarViewController *)self maskView];
  v56 = [v55 bottomAnchor];
  v57 = [(DBRootStatusBarViewController *)self view];
  v58 = [v57 bottomAnchor];
  v59 = [v56 constraintEqualToAnchor:v58];
  v82[5] = v59;
  v60 = [MEMORY[0x263EFF8C0] arrayWithObjects:v82 count:6];
  [v67 activateConstraints:v60];
}

- (void)dealloc
{
  id v3 = [(DBRootStatusBarViewController *)self homeButtonSource];
  [v3 invalidate];

  v4.receiver = self;
  v4.super_class = (Class)DBRootStatusBarViewController;
  [(DBRootStatusBarViewController *)&v4 dealloc];
}

- (void)viewWillLayoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)DBRootStatusBarViewController;
  [(DBRootStatusBarViewController *)&v10 viewWillLayoutSubviews];
  unint64_t v3 = [(DBRootStatusBarViewController *)self currentStatusBarEdge];
  objc_super v4 = [(DBRootStatusBarViewController *)self environment];
  double v5 = [v4 environmentConfiguration];
  uint64_t v6 = [v5 currentStatusBarEdge];

  if (v3 != v6)
  {
    double v7 = [(DBRootStatusBarViewController *)self environment];
    v8 = [v7 environmentConfiguration];
    -[DBRootStatusBarViewController setCurrentStatusBarEdge:](self, "setCurrentStatusBarEdge:", [v8 currentStatusBarEdge]);

    v9 = [(DBRootStatusBarViewController *)self statusBarViewController];
    [v9 statusBarEdgeUpdated];

    [(DBRootStatusBarViewController *)self _updateConstraintsForStatusBar];
    [(DBRootStatusBarViewController *)self _updateAdditionalSafeAreaInsets];
  }
}

- (void)_updateAdditionalSafeAreaInsets
{
  if ([(DBRootStatusBarViewController *)self _isDualStatusBarLayout]) {
    return;
  }
  unint64_t v3 = [(DBRootStatusBarViewController *)self screenResizeButton];
  if (v3)
  {
    objc_super v4 = [(DBRootStatusBarViewController *)self screenResizeButton];
    int v5 = [v4 isHidden] ^ 1;
  }
  else
  {
    int v5 = 0;
  }

  uint64_t v6 = [(DBRootStatusBarViewController *)self environment];
  double v7 = [v6 environmentConfiguration];
  if ([v7 currentStatusBarEdge] == 1)
  {

LABEL_8:
    if (v5) {
      double v11 = 80.0;
    }
    else {
      double v11 = 41.0;
    }
    v12 = [(DBRootStatusBarViewController *)self environment];
    v13 = [v12 environmentConfiguration];
    int v14 = [v13 isRightHandDrive];

    double v15 = 0.0;
    double v16 = self->_extraSafeAreaInsets.top + 0.0;
    if (v14) {
      double v17 = 0.0;
    }
    else {
      double v17 = v11;
    }
    double v18 = v17 + self->_extraSafeAreaInsets.left;
    double v19 = self->_extraSafeAreaInsets.bottom + 0.0;
    if (v14) {
      double v15 = v11;
    }
    double v20 = v15 + self->_extraSafeAreaInsets.right;
    goto LABEL_21;
  }
  v8 = [(DBRootStatusBarViewController *)self environment];
  v9 = [v8 environmentConfiguration];
  uint64_t v10 = [v9 currentStatusBarEdge];

  if (v10 == 3) {
    goto LABEL_8;
  }
  if (v5) {
    double v16 = 24.0;
  }
  else {
    double v16 = 5.0;
  }
  double v19 = 27.0;
  double v18 = 0.0;
  double v20 = 0.0;
LABEL_21:
  id v21 = [(DBRootStatusBarViewController *)self statusBarViewController];
  objc_msgSend(v21, "setAdditionalSafeAreaInsets:", v16, v18, v19, v20);
}

- (void)_updateConstraintsForStatusBar
{
  id v16 = objc_alloc_init(MEMORY[0x263EFF980]);
  unint64_t v3 = [(DBRootStatusBarViewController *)self activeConstraints];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F08938];
    int v5 = [(DBRootStatusBarViewController *)self activeConstraints];
    [v4 deactivateConstraints:v5];
  }
  uint64_t v6 = [(DBRootStatusBarViewController *)self environment];
  double v7 = [v6 environmentConfiguration];
  uint64_t v8 = [v7 currentStatusBarEdge];

  v9 = [(DBRootStatusBarViewController *)self appDockViewController];

  if (v9)
  {
    uint64_t v10 = [(DBRootStatusBarViewController *)self _appDockConstraintsWithStatusBarEdge:v8];
    [v16 addObjectsFromArray:v10];
  }
  double v11 = [(DBRootStatusBarViewController *)self homeButton];

  if (v11)
  {
    v12 = [(DBRootStatusBarViewController *)self _homeButtonConstraintsWithStatusBarEdge:v8];
    [v16 addObjectsFromArray:v12];
  }
  v13 = [(DBRootStatusBarViewController *)self keylineView];

  if (v13)
  {
    int v14 = [(DBRootStatusBarViewController *)self _keylineViewConstraintsWithStatusBarEdge:v8];
    [v16 addObjectsFromArray:v14];
  }
  [MEMORY[0x263F08938] activateConstraints:v16];
  double v15 = (void *)[v16 copy];
  [(DBRootStatusBarViewController *)self setActiveConstraints:v15];
}

- (id)_appDockConstraintsWithStatusBarEdge:(unint64_t)a3
{
  v54[4] = *MEMORY[0x263EF8340];
  v50 = [(DBRootStatusBarViewController *)self appDockViewController];
  v48 = [v50 view];
  v46 = [v48 heightAnchor];
  v44 = [v46 constraintEqualToConstant:111.0];
  v54[0] = v44;
  v42 = [(DBRootStatusBarViewController *)self appDockViewController];
  v40 = [v42 view];
  v36 = [v40 centerXAnchor];
  v38 = [(DBRootStatusBarViewController *)self view];
  v34 = [v38 centerXAnchor];
  v32 = [v36 constraintEqualToAnchor:v34];
  v54[1] = v32;
  objc_super v30 = [(DBRootStatusBarViewController *)self appDockViewController];
  v28 = [v30 view];
  v26 = [v28 centerYAnchor];
  objc_super v4 = [(DBRootStatusBarViewController *)self view];
  int v5 = [v4 centerYAnchor];
  uint64_t v6 = [v26 constraintEqualToAnchor:v5];
  v54[2] = v6;
  double v7 = [(DBRootStatusBarViewController *)self appDockViewController];
  uint64_t v8 = [v7 view];
  v9 = [v8 widthAnchor];
  uint64_t v10 = [(DBRootStatusBarViewController *)self view];
  double v11 = [v10 widthAnchor];
  v12 = [v9 constraintEqualToAnchor:v11];
  v54[3] = v12;
  v52 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:4];

  if ([(DBRootStatusBarViewController *)self layout] == 1 || (a3 & 0xFFFFFFFFFFFFFFFDLL) != 1)
  {
    v23 = v52;
    id v22 = v52;
  }
  else
  {
    v51 = [(DBRootStatusBarViewController *)self appDockViewController];
    v49 = [v51 view];
    v47 = [v49 widthAnchor];
    v45 = [v47 constraintEqualToConstant:111.0];
    v53[0] = v45;
    v43 = [(DBRootStatusBarViewController *)self appDockViewController];
    v41 = [v43 view];
    v37 = [v41 centerXAnchor];
    v39 = [(DBRootStatusBarViewController *)self view];
    v35 = [v39 centerXAnchor];
    v33 = [v37 constraintEqualToAnchor:v35];
    v53[1] = v33;
    v31 = [(DBRootStatusBarViewController *)self appDockViewController];
    v29 = [v31 view];
    v27 = [v29 centerYAnchor];
    v13 = [(DBRootStatusBarViewController *)self view];
    int v14 = [v13 centerYAnchor];
    double v15 = [v27 constraintEqualToAnchor:v14];
    v53[2] = v15;
    id v16 = [(DBRootStatusBarViewController *)self appDockViewController];
    double v17 = [v16 view];
    double v18 = [v17 heightAnchor];
    double v19 = [(DBRootStatusBarViewController *)self view];
    double v20 = [v19 heightAnchor];
    id v21 = [v18 constraintEqualToAnchor:v20];
    v53[3] = v21;
    id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v53 count:4];

    v23 = v52;
  }

  return v22;
}

- (id)_homeButtonConstraintsWithStatusBarEdge:(unint64_t)a3
{
  v41[4] = *MEMORY[0x263EF8340];
  if (a3 == 2)
  {
    v31 = [(DBRootStatusBarViewController *)self homeButton];
    v28 = [v31 leadingAnchor];
    objc_super v30 = [(DBRootStatusBarViewController *)self view];
    uint64_t v29 = [v30 leadingAnchor];
    v38 = [v28 constraintEqualToAnchor:v29];
    v41[0] = v38;
    v37 = [(DBRootStatusBarViewController *)self homeButton];
    objc_super v4 = [v37 trailingAnchor];
    v35 = [(DBRootStatusBarViewController *)self view];
    [v35 trailingAnchor];
    v34 = v36 = v4;
    v33 = objc_msgSend(v4, "constraintEqualToAnchor:");
    v41[1] = v33;
    v32 = [(DBRootStatusBarViewController *)self homeButton];
    int v5 = [v32 bottomAnchor];
    uint64_t v6 = [(DBRootStatusBarViewController *)self view];
    double v7 = [v6 bottomAnchor];
    uint64_t v8 = [v5 constraintEqualToAnchor:v7];
    v41[2] = v8;
    v9 = [(DBRootStatusBarViewController *)self homeButton];
    uint64_t v10 = [v9 heightAnchor];
    double v11 = [(DBRootStatusBarViewController *)self homeButton];
    v12 = [v11 widthAnchor];
    v13 = [v10 constraintEqualToAnchor:v12 multiplier:1.0];
    v41[3] = v13;
    int v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v41 count:4];

    double v15 = v28;
    id v16 = v31;

    double v17 = (void *)v29;
    double v18 = v30;
  }
  else
  {
    double v19 = [(DBRootStatusBarViewController *)self environment];
    double v20 = [v19 environmentConfiguration];
    int v21 = [v20 isRightHandDrive];

    id v22 = [(DBRootStatusBarViewController *)self homeButton];
    id v16 = v22;
    if (v21)
    {
      double v15 = [v22 rightAnchor];
      double v18 = [(DBRootStatusBarViewController *)self view];
      double v17 = [v18 rightAnchor];
      v38 = [v15 constraintEqualToAnchor:v17 constant:-self->_extraSafeAreaInsets.right];
      v40[0] = v38;
      v37 = [(DBRootStatusBarViewController *)self homeButton];
      v36 = [v37 imageView];
      v23 = [v36 centerYAnchor];
      v34 = [(DBRootStatusBarViewController *)self view];
      [v34 centerYAnchor];
      v33 = v35 = v23;
      v32 = objc_msgSend(v23, "constraintEqualToAnchor:");
      v40[1] = v32;
      int v5 = [(DBRootStatusBarViewController *)self homeButton];
      uint64_t v6 = [v5 heightAnchor];
      double v7 = [(DBRootStatusBarViewController *)self homeButton];
      uint64_t v8 = [v7 widthAnchor];
      v9 = [v6 constraintEqualToAnchor:v8 multiplier:1.0];
      v40[2] = v9;
      v24 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v25 = v40;
    }
    else
    {
      double v15 = [v22 leftAnchor];
      double v18 = [(DBRootStatusBarViewController *)self view];
      double v17 = [v18 leftAnchor];
      v38 = [v15 constraintEqualToAnchor:v17 constant:self->_extraSafeAreaInsets.left];
      v39[0] = v38;
      v37 = [(DBRootStatusBarViewController *)self homeButton];
      v36 = [v37 imageView];
      v26 = [v36 centerYAnchor];
      v34 = [(DBRootStatusBarViewController *)self view];
      [v34 centerYAnchor];
      v33 = v35 = v26;
      v32 = objc_msgSend(v26, "constraintEqualToAnchor:");
      v39[1] = v32;
      int v5 = [(DBRootStatusBarViewController *)self homeButton];
      uint64_t v6 = [v5 heightAnchor];
      double v7 = [(DBRootStatusBarViewController *)self homeButton];
      uint64_t v8 = [v7 widthAnchor];
      v9 = [v6 constraintEqualToAnchor:v8 multiplier:1.0];
      v39[2] = v9;
      v24 = (void *)MEMORY[0x263EFF8C0];
      uint64_t v25 = v39;
    }
    int v14 = [v24 arrayWithObjects:v25 count:3];
  }

  return v14;
}

- (id)_keylineViewConstraintsWithStatusBarEdge:(unint64_t)a3
{
  v41[4] = *MEMORY[0x263EF8340];
  int v5 = [(DBRootStatusBarViewController *)self traitCollection];
  [v5 displayScale];
  double v7 = 1.0 / v6;

  if (a3 == 1)
  {
    uint64_t v8 = [(DBRootStatusBarViewController *)self keylineView];
    v9 = [v8 bottomAnchor];
    uint64_t v10 = [(DBRootStatusBarViewController *)self view];
    uint64_t v11 = [v10 topAnchor];
  }
  else
  {
    if (a3 != 3)
    {
      v24 = [(DBRootStatusBarViewController *)self environment];
      uint64_t v25 = [v24 environmentConfiguration];
      int v26 = [v25 isRightHandDrive];

      v27 = [(DBRootStatusBarViewController *)self keylineView];
      v28 = v27;
      if (v26)
      {
        uint64_t v29 = [v27 rightAnchor];
        objc_super v30 = [(DBRootStatusBarViewController *)self view];
        [v30 leftAnchor];
      }
      else
      {
        uint64_t v29 = [v27 leftAnchor];
        objc_super v30 = [(DBRootStatusBarViewController *)self view];
        [v30 rightAnchor];
      v31 = };
      uint64_t v32 = [v29 constraintEqualToAnchor:v31];

      v39 = (void *)v32;
      v40[0] = v32;
      v38 = [(DBRootStatusBarViewController *)self keylineView];
      v37 = [v38 widthAnchor];
      v36 = [v37 constraintEqualToConstant:v7];
      v40[1] = v36;
      v35 = [(DBRootStatusBarViewController *)self keylineView];
      int v14 = [v35 topAnchor];
      double v15 = [(DBRootStatusBarViewController *)self view];
      id v16 = [v15 topAnchor];
      double v17 = [v14 constraintEqualToAnchor:v16];
      v40[2] = v17;
      double v18 = [(DBRootStatusBarViewController *)self keylineView];
      double v19 = [v18 bottomAnchor];
      double v20 = [(DBRootStatusBarViewController *)self view];
      int v21 = [v20 bottomAnchor];
      id v22 = [v19 constraintEqualToAnchor:v21];
      void v40[3] = v22;
      v23 = v40;
      goto LABEL_10;
    }
    uint64_t v8 = [(DBRootStatusBarViewController *)self keylineView];
    v9 = [v8 topAnchor];
    uint64_t v10 = [(DBRootStatusBarViewController *)self view];
    uint64_t v11 = [v10 bottomAnchor];
  }
  v12 = (void *)v11;
  uint64_t v13 = [v9 constraintEqualToAnchor:v11];

  v39 = (void *)v13;
  v41[0] = v13;
  v38 = [(DBRootStatusBarViewController *)self keylineView];
  v37 = [v38 heightAnchor];
  v36 = [v37 constraintEqualToConstant:v7];
  v41[1] = v36;
  v35 = [(DBRootStatusBarViewController *)self keylineView];
  int v14 = [v35 leftAnchor];
  double v15 = [(DBRootStatusBarViewController *)self view];
  id v16 = [v15 leftAnchor];
  double v17 = [v14 constraintEqualToAnchor:v16];
  v41[2] = v17;
  double v18 = [(DBRootStatusBarViewController *)self keylineView];
  double v19 = [v18 rightAnchor];
  double v20 = [(DBRootStatusBarViewController *)self view];
  int v21 = [v20 rightAnchor];
  id v22 = [v19 constraintEqualToAnchor:v21];
  v41[3] = v22;
  v23 = v41;
LABEL_10:
  v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];

  return v33;
}

- (void)viewDidLoad
{
  v56[2] = *MEMORY[0x263EF8340];
  v53.receiver = self;
  v53.super_class = (Class)DBRootStatusBarViewController;
  [(DBRootStatusBarViewController *)&v53 viewDidLoad];
  unint64_t v3 = [(DBRootStatusBarViewController *)self view];
  objc_super v4 = [v3 layer];
  [v4 setHitTestsAsOpaque:1];

  int v5 = [DBStatusBarBackgroundView alloc];
  double v6 = [(DBRootStatusBarViewController *)self environment];
  double v7 = [(DBStatusBarBackgroundView *)v5 initWithEnvironment:v6];
  [(DBRootStatusBarViewController *)self setBackgroundView:v7];

  uint64_t v8 = [(DBRootStatusBarViewController *)self backgroundView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(DBRootStatusBarViewController *)self backgroundView];
  v52 = v3;
  [v3 addSubview:v9];

  unint64_t v10 = 0x263F08000uLL;
  if ([(DBRootStatusBarViewController *)self _isDualStatusBarLayout])
  {
    [(DBRootStatusBarViewController *)self _setDualStatusBarCornerRadius];
    unint64_t v11 = [(DBRootStatusBarViewController *)self layout];
    v12 = [(DBRootStatusBarViewController *)self backgroundView];
    uint64_t v13 = [v12 leftAnchor];
    if (v11 == 1) {
      [(DBRootStatusBarViewController *)self view];
    }
    else {
    v24 = [(DBRootStatusBarViewController *)self cornerRadiusView];
    }
    uint64_t v25 = [v24 leftAnchor];
    v23 = [v13 constraintEqualToAnchor:v25];

    int v26 = [(DBRootStatusBarViewController *)self backgroundView];
    v27 = [v26 rightAnchor];
    if (v11 == 1) {
      [(DBRootStatusBarViewController *)self cornerRadiusView];
    }
    else {
    v28 = [(DBRootStatusBarViewController *)self view];
    }
    uint64_t v29 = [v28 rightAnchor];
    int v14 = [v27 constraintEqualToAnchor:v29];

    objc_super v30 = (void *)MEMORY[0x263F08938];
    v56[0] = v23;
    v56[1] = v14;
    double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v56 count:2];
    [v30 activateConstraints:v15];
  }
  else
  {
    v46 = (void *)MEMORY[0x263F08938];
    v50 = [(DBRootStatusBarViewController *)self backgroundView];
    int v14 = [v50 leftAnchor];
    double v15 = [(DBRootStatusBarViewController *)self view];
    v48 = [v15 leftAnchor];
    id v16 = [v14 constraintEqualToAnchor:v48];
    v55[0] = v16;
    double v17 = [(DBRootStatusBarViewController *)self backgroundView];
    double v18 = [v17 rightAnchor];
    double v19 = [(DBRootStatusBarViewController *)self view];
    double v20 = [v19 rightAnchor];
    int v21 = [v18 constraintEqualToAnchor:v20];
    v55[1] = v21;
    id v22 = [MEMORY[0x263EFF8C0] arrayWithObjects:v55 count:2];
    [v46 activateConstraints:v22];

    unint64_t v10 = 0x263F08000;
    v23 = v50;
  }
  v47 = *(void **)(v10 + 2360);
  v51 = [(DBRootStatusBarViewController *)self backgroundView];
  v49 = [v51 topAnchor];
  v31 = [(DBRootStatusBarViewController *)self view];
  uint64_t v32 = [v31 topAnchor];
  v33 = [v49 constraintEqualToAnchor:v32];
  v54[0] = v33;
  v34 = [(DBRootStatusBarViewController *)self backgroundView];
  v35 = [v34 bottomAnchor];
  v36 = [(DBRootStatusBarViewController *)self view];
  v37 = [v36 bottomAnchor];
  v38 = [v35 constraintEqualToAnchor:v37];
  v54[1] = v38;
  v39 = [MEMORY[0x263EFF8C0] arrayWithObjects:v54 count:2];
  [v47 activateConstraints:v39];

  if (![(DBRootStatusBarViewController *)self _isDualStatusBarLayout])
  {
    v40 = objc_opt_new();
    [(DBRootStatusBarViewController *)self setKeylineView:v40];

    v41 = [MEMORY[0x263F825C8] colorWithWhite:1.0 alpha:0.3];
    v42 = [(DBRootStatusBarViewController *)self keylineView];
    [v42 setBackgroundColor:v41];

    v43 = [(DBRootStatusBarViewController *)self keylineView];
    [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

    v44 = [(DBRootStatusBarViewController *)self keylineView];
    [v52 addSubview:v44];
  }
  BOOL v45 = [(DBRootStatusBarViewController *)self _isDualStatusBarLayout];
  [(DBRootStatusBarViewController *)self _setupStatusBarViewController];
  if (!v45 || [(DBRootStatusBarViewController *)self layout] == 1)
  {
    [(DBRootStatusBarViewController *)self _setupAppDockViewController];
    [(DBRootStatusBarViewController *)self _setupHomeButton];
  }
  [(DBRootStatusBarViewController *)self _updateConstraintsForStatusBar];
}

- (void)_setupAppDockViewController
{
  id v6 = [(DBRootStatusBarViewController *)self appDockViewController];
  [v6 setAppDockViewControllerDelegate:self];
  [v6 willMoveToParentViewController:self];
  [(DBRootStatusBarViewController *)self addChildViewController:v6];
  unint64_t v3 = [v6 view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];

  objc_super v4 = [(DBRootStatusBarViewController *)self view];
  int v5 = [v6 view];
  [v4 addSubview:v5];

  [v6 didMoveToParentViewController:self];
}

- (void)_setupHomeButton
{
  unint64_t v3 = [DBStatusBarHomeButton alloc];
  objc_super v4 = -[DBStatusBarHomeButton initWithFrame:](v3, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DBRootStatusBarViewController *)self setHomeButton:v4];

  int v5 = [(DBRootStatusBarViewController *)self homeButton];
  [v5 addTarget:self action:sel_homeButtonDown_ forControlEvents:16777217];

  id v6 = [(DBRootStatusBarViewController *)self homeButton];
  [v6 addTarget:self action:sel_homeButtonUp_ forControlEvents:33554496];

  double v7 = [(DBRootStatusBarViewController *)self homeButton];
  [v7 addTarget:self action:sel_homeButtonCancel_ forControlEvents:384];

  uint64_t v8 = [(DBRootStatusBarViewController *)self homeButton];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  v9 = [(DBRootStatusBarViewController *)self view];
  unint64_t v10 = [(DBRootStatusBarViewController *)self homeButton];
  [v9 addSubview:v10];

  unint64_t v11 = [MEMORY[0x263F6C778] longPressButtonForIdentifier:5];
  [(DBRootStatusBarViewController *)self setHomeButtonSource:v11];

  [(DBRootStatusBarViewController *)self _updateAdditionalSafeAreaInsets];
  id v13 = (id)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__handleBackPressGesture_];
  [v13 setAllowedPressTypes:&unk_26E17EFC0];
  v12 = [(DBRootStatusBarViewController *)self view];
  [v12 addGestureRecognizer:v13];

  [(DBRootStatusBarViewController *)self setBackPressGestureRecognizer:v13];
}

- (void)_setupStatusBarViewController
{
  v33[4] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(DBRootStatusBarViewController *)self statusBarViewController];
  [v3 willMoveToParentViewController:self];
  [(DBRootStatusBarViewController *)self addChildViewController:v3];
  objc_super v4 = [v3 view];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  int v5 = [(DBRootStatusBarViewController *)self view];
  id v6 = [v3 view];
  [v5 addSubview:v6];

  int v21 = (void *)MEMORY[0x263F08938];
  uint64_t v32 = [v3 view];
  objc_super v30 = [v32 topAnchor];
  v31 = [(DBRootStatusBarViewController *)self view];
  uint64_t v29 = [v31 safeAreaLayoutGuide];
  v28 = [v29 topAnchor];
  v27 = [v30 constraintEqualToAnchor:v28];
  v33[0] = v27;
  int v26 = [v3 view];
  v24 = [v26 bottomAnchor];
  uint64_t v25 = [(DBRootStatusBarViewController *)self view];
  v23 = [v25 safeAreaLayoutGuide];
  id v22 = [v23 bottomAnchor];
  double v20 = [v24 constraintEqualToAnchor:v22];
  v33[1] = v20;
  double v19 = [v3 view];
  double v17 = [v19 leftAnchor];
  double v18 = [(DBRootStatusBarViewController *)self view];
  id v16 = [v18 safeAreaLayoutGuide];
  double v7 = [v16 leftAnchor];
  uint64_t v8 = [v17 constraintEqualToAnchor:v7];
  v33[2] = v8;
  v9 = [v3 view];
  unint64_t v10 = [v9 rightAnchor];
  unint64_t v11 = [(DBRootStatusBarViewController *)self view];
  v12 = [v11 safeAreaLayoutGuide];
  id v13 = [v12 rightAnchor];
  int v14 = [v10 constraintEqualToAnchor:v13];
  v33[3] = v14;
  double v15 = [MEMORY[0x263EFF8C0] arrayWithObjects:v33 count:4];
  [v21 activateConstraints:v15];
}

- (void)_handleBackPressGesture:(id)a3
{
  if ([a3 state] == 3)
  {
    id v5 = [(DBRootStatusBarViewController *)self environment];
    objc_super v4 = +[DBEvent eventWithType:3 context:0];
    [v5 handleEvent:v4];
  }
}

- (void)updateAppearanceForWallpaper
{
  unint64_t v3 = [(DBRootStatusBarViewController *)self backgroundView];
  objc_super v4 = [(DBRootStatusBarViewController *)self traitCollection];
  objc_msgSend(v3, "updateMaterialForStyle:", objc_msgSend(v4, "userInterfaceStyle"));

  id v5 = [(DBRootStatusBarViewController *)self environment];
  id v36 = [v5 environmentConfiguration];

  id v6 = [v36 wallpaperPreferences];
  double v7 = [v6 currentWallpaper];

  int64_t v8 = [(DBRootStatusBarViewController *)self colorVariantOverride];
  int64_t v9 = [(DBRootStatusBarViewController *)self colorVariantOverride];
  unint64_t v10 = [(DBRootStatusBarViewController *)self environment];
  unint64_t v11 = [v10 environmentConfiguration];
  int v12 = [v11 currentViewAreaSupportsUIOutsideSafeArea];

  id v13 = [(DBRootStatusBarViewController *)self environment];
  int v14 = [v13 workspace];
  double v15 = [v14 state];
  id v16 = [v15 activeBundleIdentifier];

  if (v16) {
    int v17 = [v16 isEqualToString:@"com.apple.CarPlay.dashboard"];
  }
  else {
    int v17 = 1;
  }
  double v18 = [v7 traits];
  unsigned int v19 = [v18 supportsDashboardPlatterMaterials];

  BOOL v20 = [(DBRootStatusBarViewController *)self _isDualStatusBarLayout];
  if (v9) {
    int v21 = v20;
  }
  else {
    int v21 = 1;
  }
  if (((v21 | v12) & 1) == 0)
  {
    if (v8 == 1)
    {
LABEL_11:
      uint64_t v25 = [(DBRootStatusBarViewController *)self keylineView];
      [v25 setAlpha:1.0];

      uint64_t v26 = 0;
      goto LABEL_14;
    }
    id v22 = [v7 traits];
    if ([v22 isBlack])
    {
      v23 = [(DBRootStatusBarViewController *)self traitCollection];
      uint64_t v24 = [v23 userInterfaceStyle];

      if (v24 == 2) {
        goto LABEL_11;
      }
    }
    else
    {
    }
  }
  v27 = [(DBRootStatusBarViewController *)self keylineView];
  [v27 setAlpha:0.0];

  uint64_t v26 = [(DBRootStatusBarViewController *)self _isDualStatusBarLayout] ^ 1;
LABEL_14:
  uint64_t v28 = v17 & v19;
  uint64_t v29 = [(DBRootStatusBarViewController *)self view];
  objc_super v30 = [v29 window];
  [v30 setClipsToBounds:v26];

  v31 = [(DBRootStatusBarViewController *)self _focusHighlightColor];
  uint64_t v32 = [(DBRootStatusBarViewController *)self appDockViewController];
  [v32 setButtonFocusHighlightColor:v31];

  v33 = [(DBRootStatusBarViewController *)self appDockViewController];
  [v33 setFocusHighlightCompositingFilterEnabled:v28];

  v34 = [(DBRootStatusBarViewController *)self homeButton];
  [v34 setFocusHighlightColor:v31];

  v35 = [(DBRootStatusBarViewController *)self homeButton];
  [v35 setCompositingFilterEnabled:v28];
}

- (void)workspace:(id)a3 stateDidChangeFromState:(id)a4 toState:(id)a5
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v6 = a5;
  double v7 = [(DBRootStatusBarViewController *)self appDockViewController];
  [v7 setDockEnabled:1];

  int64_t v8 = [v6 activeBundleIdentifier];

  int64_t v9 = +[DBApplicationController sharedInstance];
  unint64_t v10 = [v9 applicationWithBundleIdentifier:v8];

  uint64_t v11 = [v10 presentsFullScreen];
  if (v11)
  {
    int v12 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      double v15 = v8;
      _os_log_impl(&dword_22D6F0000, v12, OS_LOG_TYPE_DEFAULT, "Hiding status bar for active identifier: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [(DBRootStatusBarViewController *)self view];
  [v13 setHidden:v11];
}

- (void)appDockViewController:(id)a3 didSelectBundleID:(id)a4
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a4;
  id v6 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v14 = 138412290;
    id v15 = v5;
    _os_log_impl(&dword_22D6F0000, v6, OS_LOG_TYPE_INFO, "Dock icon selected for ID: %@", (uint8_t *)&v14, 0xCu);
  }

  double v7 = [(DBRootStatusBarViewController *)self appDockViewController];
  [v7 setDockEnabled:0];

  int64_t v8 = +[DBApplicationController sharedInstance];
  int64_t v9 = [v8 applicationWithBundleIdentifier:v5];

  unint64_t v10 = objc_alloc_init(DBActivationSettings);
  [(DBActivationSettings *)v10 setLaunchSource:1];
  uint64_t v11 = +[DBApplicationLaunchInfo launchInfoForApplication:v9 withActivationSettings:v10];
  int v12 = [(DBRootStatusBarViewController *)self environment];
  id v13 = +[DBEvent eventWithType:4 context:v11];
  [v12 handleEvent:v13];
}

- (void)homeButtonDown:(id)a3
{
  objc_super v4 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v16 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Soft home button down", v16, 2u);
  }

  [(DBRootStatusBarViewController *)self setLastHomeButtonDownTime:CFAbsoluteTimeGetCurrent()];
  id v5 = [(DBRootStatusBarViewController *)self homeButtonAssertion];

  if (v5)
  {
    id v6 = DBLogForCategory(3uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[DBRootStatusBarViewController homeButtonDown:](v6);
    }

    [(DBRootStatusBarViewController *)self setHomeButtonAssertion:0];
    [(DBRootStatusBarViewController *)self setSiriPrewarmAssertion:0];
  }
  double v7 = [(DBRootStatusBarViewController *)self homeButtonSource];
  int64_t v8 = [v7 speechInteractionActivityWithTimestamp:CFAbsoluteTimeGetCurrent()];
  [(DBRootStatusBarViewController *)self setHomeButtonAssertion:v8];

  int64_t v9 = [(DBRootStatusBarViewController *)self homeButtonSource];
  unint64_t v10 = [v9 prepareForActivationWithTimestamp:CFAbsoluteTimeGetCurrent()];
  [(DBRootStatusBarViewController *)self setSiriPrewarmAssertion:v10];

  uint64_t v11 = [(DBRootStatusBarViewController *)self homeButtonTimer];

  if (v11)
  {
    int v12 = [(DBRootStatusBarViewController *)self homeButtonTimer];
    [v12 invalidate];

    [(DBRootStatusBarViewController *)self setHomeButtonTimer:0];
  }
  id v13 = (void *)MEMORY[0x263EFFA20];
  int v14 = [(DBRootStatusBarViewController *)self homeButtonSource];
  [v14 longPressInterval];
  id v15 = objc_msgSend(v13, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__handleLongPressActivation, 0, 0);
  [(DBRootStatusBarViewController *)self setHomeButtonTimer:v15];
}

- (void)homeButtonUp:(id)a3
{
  objc_super v4 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Soft home button up", buf, 2u);
  }

  double Current = CFAbsoluteTimeGetCurrent();
  id v6 = [(DBRootStatusBarViewController *)self homeButtonTimer];

  if (v6)
  {
    double v7 = [(DBRootStatusBarViewController *)self homeButtonTimer];
    [v7 invalidate];

    [(DBRootStatusBarViewController *)self setHomeButtonTimer:0];
  }
  int64_t v8 = [(DBRootStatusBarViewController *)self homeButtonAssertion];
  [v8 invalidatedAtTimestamp:Current];

  int64_t v9 = [(DBRootStatusBarViewController *)self siriPrewarmAssertion];
  [v9 invalidatedAtTimestamp:Current];

  [(DBRootStatusBarViewController *)self lastHomeButtonDownTime];
  double v11 = Current - v10;
  int v12 = [(DBRootStatusBarViewController *)self homeButtonSource];
  [v12 longPressInterval];
  double v14 = v13;

  if (v11 < v14)
  {
    id v15 = DBLogForCategory(4uLL);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v19 = 0;
      _os_log_impl(&dword_22D6F0000, v15, OS_LOG_TYPE_DEFAULT, "Soft home button tapped", v19, 2u);
    }

    uint64_t v16 = [(DBRootStatusBarViewController *)self homeButtonSource];
    [v16 didRecognizeButtonSinglePressUp];

    int v17 = [(DBRootStatusBarViewController *)self environment];
    double v18 = +[DBEvent eventWithType:1 context:&unk_26E17EC30];
    [v17 handleEvent:v18];
  }
  [(DBRootStatusBarViewController *)self setHomeButtonAssertion:0];
  [(DBRootStatusBarViewController *)self setSiriPrewarmAssertion:0];
}

- (void)homeButtonCancel:(id)a3
{
  objc_super v4 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int64_t v9 = 0;
    _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Soft home button cancelled", v9, 2u);
  }

  id v5 = [(DBRootStatusBarViewController *)self homeButtonTimer];

  if (v5)
  {
    id v6 = [(DBRootStatusBarViewController *)self homeButtonTimer];
    [v6 invalidate];

    [(DBRootStatusBarViewController *)self setHomeButtonTimer:0];
  }
  double v7 = [(DBRootStatusBarViewController *)self homeButtonAssertion];
  [v7 invalidatedAtTimestamp:CFAbsoluteTimeGetCurrent()];

  [(DBRootStatusBarViewController *)self setHomeButtonAssertion:0];
  int64_t v8 = [(DBRootStatusBarViewController *)self siriPrewarmAssertion];
  [v8 invalidatedAtTimestamp:CFAbsoluteTimeGetCurrent()];

  [(DBRootStatusBarViewController *)self setSiriPrewarmAssertion:0];
}

- (void)_handleLongPressActivation
{
  unint64_t v3 = DBLogForCategory(4uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Soft home button long pressed", v6, 2u);
  }

  objc_super v4 = [(DBRootStatusBarViewController *)self homeButtonSource];
  [v4 didRecognizeLongPress];

  id v5 = [(DBRootStatusBarViewController *)self homeButtonTimer];
  [v5 invalidate];

  [(DBRootStatusBarViewController *)self setHomeButtonTimer:0];
}

- (id)_focusHighlightColor
{
  unint64_t v3 = [(DBRootStatusBarViewController *)self environment];
  objc_super v4 = [v3 environmentConfiguration];
  id v5 = [v4 wallpaperPreferences];
  id v6 = [v5 currentWallpaper];

  double v7 = [(DBRootStatusBarViewController *)self environment];
  int64_t v8 = [v7 workspace];
  int64_t v9 = [v8 state];
  double v10 = [v9 activeBundleIdentifier];

  if (v10) {
    char v11 = [v10 isEqualToString:@"com.apple.CarPlay.dashboard"] ^ 1;
  }
  else {
    char v11 = 0;
  }
  int v12 = [v6 traits];
  int v13 = [v12 supportsDashboardPlatterMaterials];

  if ((v11 & 1) != 0 || !v13)
  {
    uint64_t v14 = [MEMORY[0x263F825C8] _carSystemFocusColor];
  }
  else
  {
    uint64_t v14 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
  }
  id v15 = (void *)v14;

  return v15;
}

- (BOOL)_isDualStatusBarLayout
{
  unint64_t v3 = [(DBRootStatusBarViewController *)self layout];
  if (v3 != 1) {
    LOBYTE(v3) = [(DBRootStatusBarViewController *)self layout] == 2;
  }
  return v3;
}

- (void)statusBarHomeButtonStateManager:(id)a3 didChangeToDisplayState:(unint64_t)a4
{
  id v6 = [(DBRootStatusBarViewController *)self homeButton];
  [v6 setDisplayState:a4];

  [(DBRootStatusBarViewController *)self updateAppearanceForWallpaper];
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4 = [(DBRootStatusBarViewController *)self climateViewController];
  id v5 = [(DBRootStatusBarViewController *)self traitCollection];
  objc_msgSend(v4, "updateStatusBarWithStyle:", objc_msgSend(v5, "userInterfaceStyle"));

  id v7 = [(DBRootStatusBarViewController *)self audioNotificationViewController];
  id v6 = [(DBRootStatusBarViewController *)self traitCollection];
  objc_msgSend(v7, "updateInterfaceWithStyle:", objc_msgSend(v6, "userInterfaceStyle"));
}

- (void)statusBarStyleServiceUpdatedOverride:(id)a3 animationSettings:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = MEMORY[0x263EF8330];
  uint64_t v12 = 3221225472;
  int v13 = __88__DBRootStatusBarViewController_statusBarStyleServiceUpdatedOverride_animationSettings___block_invoke;
  uint64_t v14 = &unk_2649B3D30;
  id v8 = v6;
  id v15 = v8;
  uint64_t v16 = self;
  int64_t v9 = _Block_copy(&v11);
  double v10 = v9;
  if (v7) {
    objc_msgSend(MEMORY[0x263F29D20], "animateWithSettings:actions:", v7, v9, v11, v12, v13, v14);
  }
  else {
    (*((void (**)(void *))v9 + 2))(v9);
  }
}

uint64_t __88__DBRootStatusBarViewController_statusBarStyleServiceUpdatedOverride_animationSettings___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) interfaceStyle];
  objc_msgSend(*(id *)(a1 + 40), "setColorVariantOverride:", objc_msgSend(*(id *)(a1 + 32), "colorVariant"));
  unint64_t v3 = [*(id *)(a1 + 40) backgroundView];
  objc_msgSend(v3, "setColorVariantOverride:", objc_msgSend(*(id *)(a1 + 32), "colorVariant"));

  uint64_t v4 = [*(id *)(a1 + 32) isSiriPresentation];
  id v5 = [*(id *)(a1 + 40) backgroundView];
  [v5 setHidden:v4];

  [*(id *)(a1 + 40) setOverrideUserInterfaceStyle:v2];
  id v6 = [*(id *)(a1 + 40) climateViewController];
  [v6 updateStatusBarWithStyle:v2];

  id v7 = [*(id *)(a1 + 40) audioNotificationViewController];
  [v7 updateInterfaceWithStyle:v2];

  id v8 = *(void **)(a1 + 40);
  return [v8 updateAppearanceForWallpaper];
}

- (void)setTransitionControlType:(unint64_t)a3
{
  if (self->_transitionControlType != a3)
  {
    self->_transitionControlType = a3;
    [(DBRootStatusBarViewController *)self _updateScreenResizeButton];
  }
}

- (void)_resizeButtonPressed:(id)a3
{
  uint64_t v4 = [(DBRootStatusBarViewController *)self environment];
  id v5 = [v4 environmentConfiguration];
  id v6 = [v5 analytics];
  [v6 userPressedTransitionControl];

  id v13 = [(DBRootStatusBarViewController *)self environment];
  id v7 = [v13 environmentConfiguration];
  id v8 = [v7 session];
  int64_t v9 = [(DBRootStatusBarViewController *)self environment];
  double v10 = [v9 environmentConfiguration];
  uint64_t v11 = [v10 displayConfiguration];
  uint64_t v12 = [v11 hardwareIdentifier];
  [v8 requestAdjacentViewAreaForScreenID:v12];
}

- (void)_updateScreenResizeButton
{
  v49[4] = *MEMORY[0x263EF8340];
  unint64_t v3 = [(DBRootStatusBarViewController *)self transitionControlType];
  uint64_t v4 = [(DBRootStatusBarViewController *)self screenResizeButton];
  id v5 = v4;
  if (v3)
  {

    if (!v5)
    {
      id v6 = +[DBStatusBarButton buttonWithType:0];
      [v6 addTarget:self action:sel__resizeButtonPressed_ forControlEvents:0x2000];
      id v7 = [(DBRootStatusBarViewController *)self view];
      [v7 addSubview:v6];

      [(DBRootStatusBarViewController *)self setScreenResizeButton:v6];
    }
    id v8 = [(DBRootStatusBarViewController *)self resizeButtonConstraints];

    if (v8)
    {
      int64_t v9 = (void *)MEMORY[0x263F08938];
      double v10 = [(DBRootStatusBarViewController *)self resizeButtonConstraints];
      [v9 deactivateConstraints:v10];
    }
    uint64_t v11 = [(DBRootStatusBarViewController *)self environment];
    uint64_t v12 = [v11 environmentConfiguration];
    if ([v12 currentStatusBarEdge] == 1)
    {
    }
    else
    {
      id v13 = [(DBRootStatusBarViewController *)self environment];
      uint64_t v14 = [v13 environmentConfiguration];
      uint64_t v15 = [v14 currentStatusBarEdge];

      if (v15 != 3)
      {
        v37 = [(DBRootStatusBarViewController *)self screenResizeButton];
        uint64_t v32 = [v37 topAnchor];
        BOOL v45 = [(DBRootStatusBarViewController *)self view];
        v44 = [v45 safeAreaLayoutGuide];
        [v44 topAnchor];
        v43 = v46 = v32;
        v42 = objc_msgSend(v32, "constraintEqualToAnchor:constant:", 5.0);
        v47[0] = v42;
        v41 = [(DBRootStatusBarViewController *)self screenResizeButton];
        v40 = [v41 heightAnchor];
        v39 = [v40 constraintEqualToConstant:18.0];
        v47[1] = v39;
        v38 = [(DBRootStatusBarViewController *)self screenResizeButton];
        id v22 = [v38 widthAnchor];
        v23 = [v22 constraintEqualToConstant:39.0];
        v47[2] = v23;
        uint64_t v24 = [(DBRootStatusBarViewController *)self screenResizeButton];
        uint64_t v25 = [v24 centerXAnchor];
        uint64_t v26 = [(DBRootStatusBarViewController *)self view];
        v27 = [v26 safeAreaLayoutGuide];
        uint64_t v28 = [v27 centerXAnchor];
        v31 = [v25 constraintEqualToAnchor:v28];
        v47[3] = v31;
        v33 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:4];
        [(DBRootStatusBarViewController *)self setResizeButtonConstraints:v33];

        unsigned int v19 = v37;
LABEL_15:

        v34 = (void *)MEMORY[0x263F08938];
        v35 = [(DBRootStatusBarViewController *)self resizeButtonConstraints];
        [v34 activateConstraints:v35];

        id v36 = [(DBRootStatusBarViewController *)self screenResizeButton];
        [v36 setHidden:0];

        id v5 = [(DBRootStatusBarViewController *)self screenResizeButton];
        objc_msgSend(v5, "setTransitionControlType:", -[DBRootStatusBarViewController transitionControlType](self, "transitionControlType"));
        goto LABEL_16;
      }
    }
    uint64_t v16 = [(DBRootStatusBarViewController *)self environment];
    int v17 = [v16 environmentConfiguration];
    int v18 = [v17 isRightHandDrive];

    unsigned int v19 = [(DBRootStatusBarViewController *)self screenResizeButton];
    BOOL v20 = [v19 centerYAnchor];
    BOOL v45 = [(DBRootStatusBarViewController *)self view];
    v44 = [v45 safeAreaLayoutGuide];
    [v44 centerYAnchor];
    v43 = v46 = v20;
    uint64_t v21 = objc_msgSend(v20, "constraintEqualToAnchor:constant:", 0.0);
    v42 = (void *)v21;
    if (v18)
    {
      v49[0] = v21;
      v41 = [(DBRootStatusBarViewController *)self screenResizeButton];
      v40 = [v41 heightAnchor];
      v39 = [v40 constraintEqualToConstant:18.0];
      v49[1] = v39;
      v38 = [(DBRootStatusBarViewController *)self screenResizeButton];
      id v22 = [v38 widthAnchor];
      v23 = [v22 constraintEqualToConstant:39.0];
      v49[2] = v23;
      uint64_t v24 = [(DBRootStatusBarViewController *)self screenResizeButton];
      uint64_t v25 = [v24 rightAnchor];
      uint64_t v26 = [(DBRootStatusBarViewController *)self homeButton];
      v27 = [v26 leftAnchor];
      uint64_t v28 = [v25 constraintEqualToAnchor:v27 constant:-4.0];
      v49[3] = v28;
      uint64_t v29 = (void *)MEMORY[0x263EFF8C0];
      objc_super v30 = v49;
    }
    else
    {
      v48[0] = v21;
      v41 = [(DBRootStatusBarViewController *)self screenResizeButton];
      v40 = [v41 heightAnchor];
      v39 = [v40 constraintEqualToConstant:18.0];
      v48[1] = v39;
      v38 = [(DBRootStatusBarViewController *)self screenResizeButton];
      id v22 = [v38 widthAnchor];
      v23 = [v22 constraintEqualToConstant:39.0];
      v48[2] = v23;
      uint64_t v24 = [(DBRootStatusBarViewController *)self screenResizeButton];
      uint64_t v25 = [v24 leftAnchor];
      uint64_t v26 = [(DBRootStatusBarViewController *)self homeButton];
      v27 = [v26 rightAnchor];
      uint64_t v28 = [v25 constraintEqualToAnchor:v27 constant:4.0];
      v48[3] = v28;
      uint64_t v29 = (void *)MEMORY[0x263EFF8C0];
      objc_super v30 = v48;
    }
    v31 = [v29 arrayWithObjects:v30 count:4];
    [(DBRootStatusBarViewController *)self setResizeButtonConstraints:v31];
    goto LABEL_15;
  }
  [v4 setHidden:1];
LABEL_16:

  [(DBRootStatusBarViewController *)self _updateAdditionalSafeAreaInsets];
}

- (UIEdgeInsets)extraSafeAreaInsets
{
  double top = self->_extraSafeAreaInsets.top;
  double left = self->_extraSafeAreaInsets.left;
  double bottom = self->_extraSafeAreaInsets.bottom;
  double right = self->_extraSafeAreaInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (_TtC9DashBoard23DBClimateViewController)climateViewController
{
  return self->_climateViewController;
}

- (_TtC9DashBoard33DBAudioNotificationViewController)audioNotificationViewController
{
  return self->_audioNotificationViewController;
}

- (DBAppDockViewController)appDockViewController
{
  return self->_appDockViewController;
}

- (void)setAppDockViewController:(id)a3
{
}

- (unint64_t)transitionControlType
{
  return self->_transitionControlType;
}

- (DBStatusBarHomeButton)homeButton
{
  return self->_homeButton;
}

- (void)setHomeButton:(id)a3
{
}

- (NSTimer)homeButtonTimer
{
  return self->_homeButtonTimer;
}

- (void)setHomeButtonTimer:(id)a3
{
}

- (double)lastHomeButtonDownTime
{
  return self->_lastHomeButtonDownTime;
}

- (void)setLastHomeButtonDownTime:(double)a3
{
  self->_lastHomeButtonDownTime = a3;
}

- (SiriLongPressButtonSource)homeButtonSource
{
  return self->_homeButtonSource;
}

- (void)setHomeButtonSource:(id)a3
{
}

- (SiriActivityAssertion)homeButtonAssertion
{
  return self->_homeButtonAssertion;
}

- (void)setHomeButtonAssertion:(id)a3
{
}

- (SiriAssertion)siriPrewarmAssertion
{
  return self->_siriPrewarmAssertion;
}

- (void)setSiriPrewarmAssertion:(id)a3
{
}

- (DBStatusBarScreenResizeButton)screenResizeButton
{
  return self->_screenResizeButton;
}

- (void)setScreenResizeButton:(id)a3
{
}

- (UIView)keylineView
{
  return self->_keylineView;
}

- (void)setKeylineView:(id)a3
{
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBStatusBarViewController)statusBarViewController
{
  return self->_statusBarViewController;
}

- (void)setStatusBarViewController:(id)a3
{
}

- (UITapGestureRecognizer)backPressGestureRecognizer
{
  return self->_backPressGestureRecognizer;
}

- (void)setBackPressGestureRecognizer:(id)a3
{
}

- (NSArray)homeButtonConstraints
{
  return self->_homeButtonConstraints;
}

- (void)setHomeButtonConstraints:(id)a3
{
}

- (NSArray)resizeButtonConstraints
{
  return self->_resizeButtonConstraints;
}

- (void)setResizeButtonConstraints:(id)a3
{
}

- (unint64_t)currentStatusBarEdge
{
  return self->_currentStatusBarEdge;
}

- (void)setCurrentStatusBarEdge:(unint64_t)a3
{
  self->_currentStatusBarEdge = a3;
}

- (NSArray)activeConstraints
{
  return self->_activeConstraints;
}

- (void)setActiveConstraints:(id)a3
{
}

- (int64_t)colorVariantOverride
{
  return self->_colorVariantOverride;
}

- (void)setColorVariantOverride:(int64_t)a3
{
  self->_colorVariantOverride = a3;
}

- (unint64_t)layout
{
  return self->_layout;
}

- (void)setLayout:(unint64_t)a3
{
  self->_layout = a3;
}

- (DBStatusBarBackgroundView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)cornerRadiusView
{
  return self->_cornerRadiusView;
}

- (void)setCornerRadiusView:(id)a3
{
}

- (UIView)maskView
{
  return self->_maskView;
}

- (void)setMaskView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_cornerRadiusView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_activeConstraints, 0);
  objc_storeStrong((id *)&self->_resizeButtonConstraints, 0);
  objc_storeStrong((id *)&self->_homeButtonConstraints, 0);
  objc_storeStrong((id *)&self->_backPressGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_statusBarViewController, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_keylineView, 0);
  objc_storeStrong((id *)&self->_screenResizeButton, 0);
  objc_storeStrong((id *)&self->_siriPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_homeButtonAssertion, 0);
  objc_storeStrong((id *)&self->_homeButtonSource, 0);
  objc_storeStrong((id *)&self->_homeButtonTimer, 0);
  objc_storeStrong((id *)&self->_homeButton, 0);
  objc_storeStrong((id *)&self->_appDockViewController, 0);
  objc_storeStrong((id *)&self->_audioNotificationViewController, 0);
  objc_storeStrong((id *)&self->_climateViewController, 0);
}

- (void)homeButtonDown:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_22D6F0000, log, OS_LOG_TYPE_ERROR, "Home button assertion being requested when one already exists", v1, 2u);
}

@end