@interface BKUIFingerPrintEnrollmentPhaseViewController
- (BKUIAlertView)alertView;
- (BKUICurvesView)mesaFirstEnrollView;
- (BKUICurvesView)mesaSecondEnrollView;
- (BKUIEmbeddedEnrollmentSelectionType)delegate;
- (BKUIIndicatorWindow)touchindicatorWindow;
- (BOOL)_isIPad;
- (BOOL)_topTouchButtonIpad;
- (BOOL)disableContentViewSizing;
- (BOOL)hideUnlockMessage;
- (BOOL)inBuddy;
- (BOOL)isSecondEnrollment;
- (BOOL)prefersStatusBarHidden;
- (BOOL)rotating;
- (BOOL)shouldAnimateEntireView;
- (BOOL)shouldShowFollowupFingerEnrollmentUpSell;
- (BOOL)showFollowUpEnrollmentUpSellContent;
- (CGPoint)anchorPoint;
- (CGSize)_idealEnrollCurveViewSize;
- (CGSize)buttonTraySize;
- (NSArray)mesaEnrollContainerConstraints;
- (NSLayoutConstraint)contentViewHeightConstraint;
- (NSLayoutConstraint)enrollCurvesViewCenterConstraint;
- (NSLayoutConstraint)enrollCurvesViewTopConstraint;
- (NSString)headerTitle;
- (OBTrayButton)continueButton;
- (OBTrayButton)retryButton;
- (OBTrayButton)skipButton;
- (UIButton)mesaEnrollErrorButtonRestartEnroll;
- (UIView)mesaEnrollErrorButtonsContainer;
- (double)_enrollViewTopPadding;
- (double)enrollProgress;
- (double)innerAndOuterCurvesViewHeightDiff;
- (id)_detailPhasesText;
- (id)_detailTextDonePhase;
- (id)_subtitleFont;
- (id)initInBuddy:(BOOL)a3 hideUnlockMessage:(BOOL)a4 headerTitle:(id)a5 firstEnrollView:(id)a6 secondEnrollView:(id)a7;
- (id)initInBuddy:(BOOL)a3 hideUnlockMessage:(BOOL)a4 showFollowUpSell:(BOOL)a5 headerTitle:(id)a6 firstEnrollView:(id)a7 secondEnrollView:(id)a8;
- (int64_t)initialInterfaceOrientation;
- (unint64_t)enrollViewState;
- (void)_continuePressed:(id)a3;
- (void)_enrollSkipped;
- (void)_forceLayout;
- (void)_forceResetCurvesLayerToPercent:(double)a3;
- (void)_handleViewState:(unint64_t)a3;
- (void)_updateButtonTraySize;
- (void)_updateContentViewSizeToMatchConstraints;
- (void)_updateEnrollViewsForSize:(CGSize)a3;
- (void)dealloc;
- (void)handleEnrollmentDone;
- (void)handleEnrollmentFailure;
- (void)removeTouchIndicator;
- (void)setAlertView:(id)a3;
- (void)setAnchorPoint:(CGPoint)a3;
- (void)setButtonTraySize:(CGSize)a3;
- (void)setContentViewHeightConstraint:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisableContentViewSizing:(BOOL)a3;
- (void)setEnrollCurvesViewCenterConstraint:(id)a3;
- (void)setEnrollCurvesViewTopConstraint:(id)a3;
- (void)setEnrollProgress:(double)a3;
- (void)setEnrollProgress:(float)a3 enrollView:(id)a4;
- (void)setEnrollViewState:(unint64_t)a3;
- (void)setHeaderTitle:(id)a3;
- (void)setHideUnlockMessage:(BOOL)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setInitialInterfaceOrientation:(int64_t)a3;
- (void)setInnerAndOuterCurvesViewHeightDiff:(double)a3;
- (void)setIsSecondEnrollment:(BOOL)a3;
- (void)setMesaEnrollContainerConstraints:(id)a3;
- (void)setMesaEnrollErrorButtonRestartEnroll:(id)a3;
- (void)setMesaEnrollErrorButtonsContainer:(id)a3;
- (void)setMesaFirstEnrollView:(id)a3;
- (void)setMesaSecondEnrollView:(id)a3;
- (void)setRetryButton:(id)a3;
- (void)setRotating:(BOOL)a3;
- (void)setShouldShowFollowupFingerEnrollmentUpSell:(BOOL)a3;
- (void)setShowFollowUpEnrollmentUpSellContent:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setTouchindicatorWindow:(id)a3;
- (void)shouldAnimateEntireView;
- (void)updateHeaderWithTitle:(id)a3 animated:(BOOL)a4 heightDifference:(id)a5;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKUIFingerPrintEnrollmentPhaseViewController

- (id)initInBuddy:(BOOL)a3 hideUnlockMessage:(BOOL)a4 headerTitle:(id)a5 firstEnrollView:(id)a6 secondEnrollView:(id)a7
{
  BOOL v11 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  v23.receiver = self;
  v23.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  v16 = [(BKUIFingerPrintEnrollmentPhaseViewController *)&v23 initWithTitle:v13 detailText:0 icon:0 contentLayout:2];
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_mesaFirstEnrollView, a6);
    objc_storeStrong((id *)&v17->_mesaSecondEnrollView, a7);
    [(BKUICurvesView *)v17->_mesaSecondEnrollView setAlpha:0.0];
    v18 = [(BKUIFingerPrintEnrollmentPhaseViewController *)v17 headerView];
    v19 = [MEMORY[0x1E4F428B8] systemBlueColor];
    [v18 setTintColor:v19];

    [(BKUIFingerPrintEnrollmentPhaseViewController *)v17 setInBuddy:v11];
    v20 = [(BKUIFingerPrintEnrollmentPhaseViewController *)v17 headerView];
    v21 = [(BKUIFingerPrintEnrollmentPhaseViewController *)v17 _detailPhasesText];
    [v20 setDetailText:v21];

    [(BKUIFingerPrintEnrollmentPhaseViewController *)v17 setEnrollViewState:0];
    v17->_hideUnlockMessage = a4;
    objc_storeStrong((id *)&v17->_headerTitle, a5);
    v17->_buttonTraySize = (CGSize)*MEMORY[0x1E4F1DB30];
  }

  return v17;
}

- (id)initInBuddy:(BOOL)a3 hideUnlockMessage:(BOOL)a4 showFollowUpSell:(BOOL)a5 headerTitle:(id)a6 firstEnrollView:(id)a7 secondEnrollView:(id)a8
{
  v9 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self initInBuddy:a3 hideUnlockMessage:a4 headerTitle:a6 firstEnrollView:a7 secondEnrollView:a8];
  v10 = v9;
  if (v9)
  {
    v9[1194] = a5;
    BOOL v11 = [v9 headerView];
    v12 = [v10 _detailPhasesText];
    [v11 setDetailText:v12];
  }
  return v10;
}

- (void)_updateContentViewSizeToMatchConstraints
{
  v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self navigationController];
  v4 = [v3 navigationBar];
  [v4 frame];
  double MaxY = CGRectGetMaxY(v21);

  v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v6 frame];
  double v8 = v7;

  v9 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  [v9 frame];
  double v11 = v10;

  v12 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
  [v12 frame];
  double v14 = v13;

  if (!self->_disableContentViewSizing || [(BKUIFingerPrintEnrollmentPhaseViewController *)self rotating])
  {
    id v15 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
    [v15 frame];
    -[BKUIFingerPrintEnrollmentPhaseViewController setAnchorPoint:](self, "setAnchorPoint:");

    float v16 = v8 - MaxY - v11 - v14 + -10.0;
    double v17 = fmaxf(v16, 241.2);
    v18 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentViewHeightConstraint];
    [v18 setConstant:v17];

    id v19 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
    [v19 layoutIfNeeded];
  }
}

- (void)viewDidLoad
{
  v34.receiver = self;
  v34.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  [(OBBaseWelcomeController *)&v34 viewDidLoad];
  v3 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "FingerprintEnrollViewController");
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  self->bkui_fingerprint_enroll_view_controller_log = v3;

  v5 = [MEMORY[0x1E4F83A80] boldButton];
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self setContinueButton:v5];

  v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self continueButton];
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v7 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self continueButton];
  double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v9 = [v8 localizedStringForKey:@"CONTINUE" value:&stru_1F4081468 table:@"BiometricKitUI"];
  [v7 setTitle:v9 forState:0];

  double v10 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self continueButton];
  [v10 addTarget:self action:sel__continuePressed_ forControlEvents:64];

  double v11 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  [v11 addSubview:self->_mesaFirstEnrollView];

  v12 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  [v12 addSubview:self->_mesaSecondEnrollView];

  double v13 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentViewHeightConstraint];
  [v13 setActive:0];

  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self inBuddy])
  {
    double v14 = [MEMORY[0x1E4F83AB8] linkButton];
    [(BKUIFingerPrintEnrollmentPhaseViewController *)self setSkipButton:v14];

    id v15 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self skipButton];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    float v16 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self skipButton];
    double v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"SKIP_ENROLL" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [v16 setTitle:v18 forState:0];

    id v19 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self skipButton];
    [v19 addTarget:self action:sel__enrollSkipped forControlEvents:64];

    v20 = [MEMORY[0x1E4F83A80] boldButton];
    [(BKUIFingerPrintEnrollmentPhaseViewController *)self setRetryButton:v20];

    CGRect v21 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self retryButton];
    [v21 setTranslatesAutoresizingMaskIntoConstraints:0];

    v22 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self retryButton];
    objc_super v23 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v24 = [v23 localizedStringForKey:@"RESTART_ENROLL" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [v22 setTitle:v24 forState:0];

    v25 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self retryButton];
    [v25 addTarget:self action:sel__continuePressed_ forControlEvents:64];
  }
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self setEnrollViewState:0];
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self _topTouchButtonIpad])
  {
    objc_initWeak(&location, self);
    v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v27 = *MEMORY[0x1E4F44290];
    uint64_t v28 = MEMORY[0x1E4F14428];
    id v29 = MEMORY[0x1E4F14428];
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __59__BKUIFingerPrintEnrollmentPhaseViewController_viewDidLoad__block_invoke;
    v31[3] = &unk_1E6EA2798;
    objc_copyWeak(&v32, &location);
    id v30 = (id)[v26 addObserverForName:v27 object:0 queue:v28 usingBlock:v31];

    objc_destroyWeak(&v32);
    objc_destroyWeak(&location);
  }
}

void __59__BKUIFingerPrintEnrollmentPhaseViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  v4 = [WeakRetained view];
  v5 = [v4 window];
  v6 = [v5 windowScene];

  double v7 = [v3 object];

  if (v7 == v6)
  {
    double v8 = [WeakRetained touchindicatorWindow];
    objc_msgSend(v8, "setHidden:", objc_msgSend(v6, "_enhancedWindowingEnabled"));
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)&v5 viewWillAppear:a3];
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self _updateButtonTraySize];
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self _idealEnrollCurveViewSize];
  -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](self, "_updateEnrollViewsForSize:");
  v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
  [v4 layoutIfNeeded];
}

- (void)viewDidAppear:(BOOL)a3
{
  v20.receiver = self;
  v20.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  [(OBBaseWelcomeController *)&v20 viewDidAppear:a3];
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self _idealEnrollCurveViewSize];
  -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](self, "_updateEnrollViewsForSize:");
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self _topTouchButtonIpad])
  {
    v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
    objc_super v5 = [v4 window];
    v6 = [v5 windowScene];
    double v7 = [v6 windows];
    double v8 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_5];
    v9 = [v7 filteredArrayUsingPredicate:v8];
    double v10 = [v9 firstObject];

    if (v10)
    {
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self setTouchindicatorWindow:v10];
    }
    else
    {
      double v11 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
      v12 = [v11 window];
      double v13 = [v12 windowScene];
      double v14 = +[BKUIIndicatorWindow instanceWithWindowScene:v13];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self setTouchindicatorWindow:v14];
    }
    id v15 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
    float v16 = [v15 window];
    double v17 = [v16 windowScene];
    unsigned int v18 = [v17 _enhancedWindowingEnabled] ^ 1;

    id v19 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self touchindicatorWindow];
    [v19 setAlpha:(double)v18];
  }
}

uint64_t __62__BKUIFingerPrintEnrollmentPhaseViewController_viewDidAppear___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a4;
  v6 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v7 = [v6 userInterfaceIdiom];

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __99__BKUIFingerPrintEnrollmentPhaseViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
    v8[3] = &unk_1E6EA2770;
    v8[4] = self;
    [v5 animateAlongsideTransition:0 completion:v8];
  }
}

void __99__BKUIFingerPrintEnrollmentPhaseViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 setNeedsLayout];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self _updateContentViewSizeToMatchConstraints];
}

- (BOOL)prefersStatusBarHidden
{
  return 1;
}

- (void)removeTouchIndicator
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke;
  v3[3] = &unk_1E6EA20C0;
  v3[4] = self;
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke_2;
  v2[3] = &unk_1E6EA2108;
  v2[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v3 animations:v2 completion:0.300000012];
}

void __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) touchindicatorWindow];
  [v1 setAlpha:0.0];
}

uint64_t __68__BKUIFingerPrintEnrollmentPhaseViewController_removeTouchIndicator__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) touchindicatorWindow];
  [v2 resignKeyWindow];

  objc_super v3 = *(void **)(a1 + 32);
  return [v3 setTouchindicatorWindow:0];
}

- (void)setEnrollProgress:(float)a3 enrollView:(id)a4
{
  id v6 = a4;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollProgress];
  double v8 = v7;
  *(float *)&double v7 = a3;
  [v6 setProgress:v7];

  [(BKUIFingerPrintEnrollmentPhaseViewController *)self setEnrollProgress:a3];
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self showFollowUpEnrollmentUpSellContent]&& a3 > 0.0&& v8 == 0.0&& [(BKUIFingerPrintEnrollmentPhaseViewController *)self inBuddy])
  {
    id v10 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
    v9 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self _detailPhasesText];
    [v10 setDetailText:v9];
  }
}

- (void)_updateEnrollViewsForSize:(CGSize)a3
{
  double height = a3.height;
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](bkui_fingerprint_enroll_view_controller_log);
  }
  double v6 = height * 0.00108695652 + 0.434782609;
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self _isIPad]) {
    [(BKUIFingerPrintEnrollmentPhaseViewController *)self inBuddy];
  }
  double v7 = v6 * 5.0;
  double v8 = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134219008;
    double v57 = height * 0.00108695652 + 0.434782609;
    __int16 v58 = 2048;
    double v59 = height;
    __int16 v60 = 2048;
    double v61 = v6 * 5.0;
    __int16 v62 = 2048;
    uint64_t v63 = 0;
    __int16 v64 = 2048;
    double v65 = v6 * -40.0;
    _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: SVG multiplier: %f (size: %f), svgHOffset: %f, svgVOffset: %f, svgVOffset2: %f", buf, 0x34u);
  }
  double v9 = v6 * 192.0;
  double v10 = v6 * 268.0;
  if (self->_mesaEnrollContainerConstraints)
  {
    double v11 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollCurvesViewTopConstraint];
    [v11 setActive:0];

    [MEMORY[0x1E4F28DC8] deactivateConstraints:self->_mesaEnrollContainerConstraints];
    v12 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v12 = [MEMORY[0x1E4F1CA48] array];
  }
  mesaEnrollContainerConstraints = self->_mesaEnrollContainerConstraints;
  self->_mesaEnrollContainerConstraints = v12;

  [(BKUIFingerPrintEnrollmentPhaseViewController *)self setInnerAndOuterCurvesViewHeightDiff:(v10 - v9) * 0.5];
  double v14 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v14 bounds];
  float v16 = v15 * 0.13;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self innerAndOuterCurvesViewHeightDiff];
  *(float *)&double v17 = v17;
  double v18 = fminf(v16, *(float *)&v17);

  id v19 = [(BKUICurvesView *)self->_mesaSecondEnrollView topAnchor];
  objc_super v20 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  CGRect v21 = [v20 topAnchor];
  v22 = [v19 constraintEqualToAnchor:v21 constant:v18];
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self setEnrollCurvesViewTopConstraint:v22];

  objc_super v23 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollCurvesViewTopConstraint];
  [v23 setActive:1];

  v24 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
  LODWORD(v20) = [v24 isHidden];

  if (v20) {
    double v25 = 25.0;
  }
  else {
    double v25 = 0.0;
  }
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollViewState])
  {
    double v26 = -v25;
  }
  else
  {
    [(BKUIFingerPrintEnrollmentPhaseViewController *)self innerAndOuterCurvesViewHeightDiff];
    double v26 = v27 - v25;
  }
  double v28 = v6 * 180.0;
  double v29 = v6 * 124.0;
  v54 = [(BKUICurvesView *)self->_mesaSecondEnrollView widthAnchor];
  v53 = [v54 constraintEqualToConstant:v28];
  v55[0] = v53;
  v52 = [(BKUICurvesView *)self->_mesaSecondEnrollView heightAnchor];
  v51 = [v52 constraintEqualToConstant:v10];
  v55[1] = v51;
  v49 = [(BKUICurvesView *)self->_mesaSecondEnrollView centerXAnchor];
  v50 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  v48 = [v50 centerXAnchor];
  v47 = [v49 constraintEqualToAnchor:v48 constant:v7];
  v55[2] = v47;
  v45 = [(BKUICurvesView *)self->_mesaSecondEnrollView bottomAnchor];
  v46 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  v44 = [v46 bottomAnchor];
  v43 = [v45 constraintEqualToAnchor:v44 constant:v26];
  v55[3] = v43;
  v42 = [(BKUICurvesView *)self->_mesaFirstEnrollView widthAnchor];
  v41 = [v42 constraintEqualToConstant:v29];
  v55[4] = v41;
  v40 = [(BKUICurvesView *)self->_mesaFirstEnrollView heightAnchor];
  v39 = [v40 constraintEqualToConstant:v9];
  v55[5] = v39;
  id v30 = [(BKUICurvesView *)self->_mesaFirstEnrollView centerXAnchor];
  v31 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  id v32 = [v31 centerXAnchor];
  v33 = [v30 constraintEqualToAnchor:v32];
  v55[6] = v33;
  objc_super v34 = [(BKUICurvesView *)self->_mesaFirstEnrollView centerYAnchor];
  v35 = [(BKUICurvesView *)self->_mesaSecondEnrollView centerYAnchor];
  v36 = [v34 constraintEqualToAnchor:v35];
  v55[7] = v36;
  v37 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:8];
  v38 = self->_mesaEnrollContainerConstraints;
  self->_mesaEnrollContainerConstraints = v37;

  [MEMORY[0x1E4F28DC8] activateConstraints:self->_mesaEnrollContainerConstraints];
  -[BKUICurvesView setSublayersSize:](self->_mesaFirstEnrollView, "setSublayersSize:", v29, v9);
  -[BKUICurvesView setSublayersSize:](self->_mesaSecondEnrollView, "setSublayersSize:", v28, v10);
}

- (void)handleEnrollmentFailure
{
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self inBuddy])
  {
    objc_super v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
    [v3 removeAllButtons];

    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __71__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentFailure__block_invoke;
    v4[3] = &unk_1E6EA20C0;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:0.3];
  }
}

void __71__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentFailure__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonTray];
  objc_super v3 = [*(id *)(a1 + 32) retryButton];
  [v2 addButton:v3];

  v4 = [*(id *)(a1 + 32) buttonTray];
  id v5 = [*(id *)(a1 + 32) skipButton];
  [v4 addButton:v5];

  id v6 = [*(id *)(a1 + 32) view];
  [v6 layoutIfNeeded];
}

- (void)handleEnrollmentDone
{
  objc_super v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
  [v3 removeAllButtons];

  v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self mesaSecondEnrollView];
  [v4 setAlpha:1.0];

  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __68__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentDone__block_invoke;
  v5[3] = &unk_1E6EA20C0;
  v5[4] = self;
  [MEMORY[0x1E4F42FF0] animateWithDuration:v5 animations:0.01];
}

uint64_t __68__BKUIFingerPrintEnrollmentPhaseViewController_handleEnrollmentDone__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonTray];
  objc_super v3 = [*(id *)(a1 + 32) continueButton];
  [v2 addButton:v3];

  v4 = *(void **)(a1 + 32);
  return [v4 _forceLayout];
}

- (void)setEnrollViewState:(unint64_t)a3
{
  if (self->_enrollViewState != a3)
  {
    self->_enrollViewState = a3;
    -[BKUIFingerPrintEnrollmentPhaseViewController _handleViewState:](self, "_handleViewState:");
  }
}

- (void)_handleViewState:(unint64_t)a3
{
  switch(a3)
  {
    case 0uLL:
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _forceResetCurvesLayerToPercent:0.0];
      v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
      [v4 removeAllButtons];

      id v5 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
      [v5 setTitleTrailingSymbol:&stru_1F4081468];

      id v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerTitle];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self setHeaderTitle:v6];

      double v7 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
      double v8 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self _detailPhasesText];
      [v7 setDetailText:v8];

      double v9 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self mesaSecondEnrollView];
      [v9 setAlpha:0.0];

      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _forceLayout];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _updateContentViewSizeToMatchConstraints];
      id v20 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self touchindicatorWindow];
      [v20 setShouldShow:1];
      goto LABEL_5;
    case 1uLL:
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _idealEnrollCurveViewSize];
      -[BKUIFingerPrintEnrollmentPhaseViewController _updateEnrollViewsForSize:](self, "_updateEnrollViewsForSize:");
      double v10 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerTitle];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self setHeaderTitle:v10];

      double v11 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
      v12 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self _detailPhasesText];
      [v11 setDetailText:v12];

      double v13 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self mesaSecondEnrollView];
      [v13 setAlpha:1.0];

      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _forceLayout];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _updateContentViewSizeToMatchConstraints];
      id v20 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
      [v20 origin];
      -[BKUIFingerPrintEnrollmentPhaseViewController setAnchorPoint:](self, "setAnchorPoint:");
      goto LABEL_5;
    case 2uLL:
      id v20 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self _detailTextDonePhase];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _forceLayout];
      double v14 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self touchindicatorWindow];
      [v14 setShouldShow:0];

      [(BKUIFingerPrintEnrollmentPhaseViewController *)self handleEnrollmentDone];
LABEL_5:

      return;
    case 3uLL:
      double v15 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
      float v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v17 = v16;
      double v18 = @"ENROLL_FAILED_PROMPT";
      goto LABEL_10;
    case 4uLL:
      double v15 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
      float v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v17 = v16;
      double v18 = @"TRY_AGAIN";
LABEL_10:
      id v19 = [v16 localizedStringForKey:v18 value:&stru_1F4081468 table:@"BiometricKitUI"];
      [v15 setDetailText:v19];

      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _forceLayout];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self handleEnrollmentFailure];
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self _forceResetCurvesLayerToPercent:0.0];
      break;
    default:
      return;
  }
}

- (void)_forceLayout
{
  objc_super v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v3 setNeedsLayout];

  id v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v4 layoutIfNeeded];
}

- (CGSize)_idealEnrollCurveViewSize
{
  objc_super v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v3 frame];
  double v5 = v4;
  id v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
  [v6 frame];
  double v8 = v7;

  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self _isIPad])
  {
    double v9 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
    [v9 frame];
    double v11 = v10;

    v12 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
    [v12 frame];
    double v14 = v13;

    if (v11 >= v14) {
      double v11 = v14;
    }
    double v15 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
    [v15 frame];
    double v17 = v11 - v16;

    uint64_t v18 = MGGetProductType();
    if (v18 == 2903084588 || v18 == 1895344378)
    {
      [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTraySize];
      double v17 = v17 - v19;
    }
  }
  else
  {
    double v17 = v5 - v8;
  }
  double v20 = 0.0;
  double v21 = v17;
  result.double height = v21;
  result.width = v20;
  return result;
}

- (BOOL)shouldAnimateEntireView
{
  objc_super v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  [v3 frame];
  double v5 = v4;
  [(BKUICurvesView *)self->_mesaFirstEnrollView bounds];
  double v7 = v5 + v6;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self _enrollViewTopPadding];
  double v9 = v8 + v7;

  double v10 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self buttonTray];
  [v10 frame];
  double v12 = v11;

  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    [(BKUIFingerPrintEnrollmentPhaseViewController *)bkui_fingerprint_enroll_view_controller_log shouldAnimateEntireView];
  }
  return v9 > v12;
}

- (double)_enrollViewTopPadding
{
  objc_super v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v3 bounds];
  float v5 = v4 * 0.13;
  double v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self contentView];
  [v6 frame];
  double v8 = v7;
  double v9 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self mesaSecondEnrollView];
  [v9 frame];
  float v11 = (v8 - v10) * 0.5;
  double v12 = fminf(v5, v11);

  return v12;
}

- (void)_continuePressed:(id)a3
{
  id v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self delegate];
  [v4 didSelectPrimaryButton:self];
}

- (void)_enrollSkipped
{
  id v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self delegate];
  [v3 didSelectSecondaryButton:self];
}

- (id)_subtitleFont
{
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self _isIPad];
  id v2 = [MEMORY[0x1E4F42A30] systemFontOfSize:18.0];
  return v2;
}

- (BOOL)_isIPad
{
  id v2 = [MEMORY[0x1E4F42948] currentDevice];
  BOOL v3 = [v2 userInterfaceIdiom] == 1;

  return v3;
}

- (void)updateHeaderWithTitle:(id)a3 animated:(BOOL)a4 heightDifference:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self setHeaderTitle:v8];
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollViewState] == 2)
  {
    double v10 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
    float v11 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self _detailTextDonePhase];
    [v10 setDetailText:v11];
  }
  double v12 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollCurvesViewCenterConstraint];
  [v12 setActive:0];

  double v13 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v13 bounds];
  float v15 = v14 * 0.13;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)self innerAndOuterCurvesViewHeightDiff];
  *(float *)&double v16 = v16;
  double v17 = fminf(v15, *(float *)&v16);

  objc_initWeak(&location, self);
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke;
  v18[3] = &unk_1E6EA2BD8;
  objc_copyWeak(v19, &location);
  v19[1] = *(id *)&v17;
  v18[4] = self;
  [(OBTouchIDEnrollmentWelcomeController *)self startTitleTransitionAnimated:v6 heightDifference:v18];
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
}

void __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke(uint64_t a1, double a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if ([WeakRetained shouldAnimateEntireView]) {
    goto LABEL_14;
  }
  float v5 = [WeakRetained contentView];
  [v5 frame];
  unint64_t v7 = (unint64_t)v6;
  [WeakRetained anchorPoint];
  unint64_t v9 = (unint64_t)v8;

  if (v7 != v9)
  {
    double v16 = *(double *)(a1 + 48);
    double v17 = [WeakRetained enrollCurvesViewTopConstraint];
    float v15 = v17;
    double v18 = v16;
LABEL_9:
    [v17 setConstant:v18];
LABEL_10:

    goto LABEL_11;
  }
  double v10 = *(double *)(a1 + 48) + a2;
  if (a2 >= 0.0)
  {
    double v17 = [WeakRetained enrollCurvesViewTopConstraint];
    float v15 = v17;
    double v18 = v10;
    goto LABEL_9;
  }
  float v11 = [WeakRetained enrollCurvesViewTopConstraint];
  objc_msgSend(v11, "setConstant:", fmax(v10, -15.0));

  double v12 = [WeakRetained enrollCurvesViewTopConstraint];
  [v12 constant];
  double v14 = v13;

  if (v14 < 10.0)
  {
    float v15 = _BKUILoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke_cold_1(v15);
    }
    goto LABEL_10;
  }
LABEL_11:
  double v19 = [WeakRetained view];
  [v19 layoutIfNeeded];

  if ([*(id *)(a1 + 32) enrollViewState] == 2
    && [*(id *)(a1 + 32) showFollowUpEnrollmentUpSellContent])
  {
    double v20 = [*(id *)(a1 + 32) headerView];
    [v20 setTitleTrailingSymbol:@"checkmark"];
  }
LABEL_14:
}

- (void)setHeaderTitle:(id)a3
{
  objc_storeStrong((id *)&self->_headerTitle, a3);
  id v5 = a3;
  id v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self headerView];
  [v6 setTitle:v5];
}

- (void)_forceResetCurvesLayerToPercent:(double)a3
{
  [(BKUICurvesView *)self->_mesaFirstEnrollView setProgress:0.0];
  *(float *)&a3 = a3;
  LODWORD(v5) = LODWORD(a3);
  [(BKUICurvesView *)self->_mesaFirstEnrollView setProgress:v5];
  [(BKUICurvesView *)self->_mesaSecondEnrollView setProgress:0.0];
  mesaSecondEnrollView = self->_mesaSecondEnrollView;
  LODWORD(v7) = LODWORD(a3);
  [(BKUICurvesView *)mesaSecondEnrollView setProgress:v7];
}

- (id)_detailPhasesText
{
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self _topTouchButtonIpad])
  {
    [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollProgress];
    if (v3 <= 0.0)
    {
      double v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v5 = v8;
      id v6 = @"SCAN_FINGER_START_FOLLOW_UP";
      unint64_t v9 = @"Mesa-j307";
      goto LABEL_13;
    }
    unint64_t v4 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollViewState];
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v4 == 1) {
      id v6 = @"LIFT_AND_REST_FOLLOW_UP";
    }
    else {
      id v6 = @"LIFT_AND_REST_LONGER_FOLLOW_UP";
    }
    unint64_t v9 = @"Mesa-j307";
  }
  else
  {
    unint64_t v7 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self enrollViewState];
    double v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v7 == 1) {
      id v6 = @"LIFT_AND_REST";
    }
    else {
      id v6 = @"LIFT_AND_REST_LONGER";
    }
    unint64_t v9 = @"BiometricKitUI";
  }
  double v8 = v5;
LABEL_13:
  double v10 = [v8 localizedStringForKey:v6 value:&stru_1F4081468 table:v9];

  return v10;
}

- (id)_detailTextDonePhase
{
  if ([(BKUIFingerPrintEnrollmentPhaseViewController *)self showFollowUpEnrollmentUpSellContent])
  {
    BOOL v3 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self isSecondEnrollment];
    unint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    if (v3) {
      double v5 = @"FINGER_CAN_BE_ADDED_DELETED_FOLLOW_UP";
    }
    else {
      double v5 = @"FINGER_READY_FOLLOW_UP";
    }
    unint64_t v7 = @"Mesa-j307";
    goto LABEL_8;
  }
  BOOL v6 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self hideUnlockMessage];
  unint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  if (v6)
  {
    double v5 = @"SENSOR_IS_READY";
    unint64_t v7 = @"BiometricKitUI";
LABEL_8:
    double v8 = [v4 localizedStringForKey:v5 value:&stru_1F4081468 table:v7];
    goto LABEL_10;
  }
  unint64_t v9 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"FINGER_CAN_BE_USED"];
  double v8 = [v4 localizedStringForKey:v9 value:&stru_1F4081468 table:@"BiometricKitUI"];

LABEL_10:
  return v8;
}

- (BOOL)_topTouchButtonIpad
{
  return MGGetSInt32Answer() == 2;
}

- (void)_updateButtonTraySize
{
  id v19 = (id)[objc_alloc(MEMORY[0x1E4F83AF8]) initWithTitle:&stru_1F4081468 detailText:&stru_1F4081468 icon:0];
  BOOL v3 = [MEMORY[0x1E4F83A80] boldButton];
  unint64_t v4 = [v19 buttonTray];
  [v4 addButton:v3];

  double v5 = [(BKUIFingerPrintEnrollmentPhaseViewController *)self view];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [v19 view];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  float v15 = [v19 view];
  [v15 layoutIfNeeded];

  double v16 = [v19 buttonTray];
  [v16 frame];
  -[BKUIFingerPrintEnrollmentPhaseViewController setButtonTraySize:](self, "setButtonTraySize:", v17, v18);
}

- (void)dealloc
{
  BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)BKUIFingerPrintEnrollmentPhaseViewController;
  [(BKUIFingerPrintEnrollmentPhaseViewController *)&v4 dealloc];
}

- (BKUIEmbeddedEnrollmentSelectionType)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (BKUIEmbeddedEnrollmentSelectionType *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)enrollViewState
{
  return self->_enrollViewState;
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (void)setInBuddy:(BOOL)a3
{
  self->_inBuddy = a3;
}

- (NSString)headerTitle
{
  return self->_headerTitle;
}

- (BOOL)shouldShowFollowupFingerEnrollmentUpSell
{
  return self->_shouldShowFollowupFingerEnrollmentUpSell;
}

- (void)setShouldShowFollowupFingerEnrollmentUpSell:(BOOL)a3
{
  self->_shouldShowFollowupFingerEnrollmentUpSell = a3;
}

- (BOOL)showFollowUpEnrollmentUpSellContent
{
  return self->_showFollowUpEnrollmentUpSellContent;
}

- (void)setShowFollowUpEnrollmentUpSellContent:(BOOL)a3
{
  self->_showFollowUpEnrollmentUpSellContent = a3;
}

- (BOOL)isSecondEnrollment
{
  return self->_isSecondEnrollment;
}

- (void)setIsSecondEnrollment:(BOOL)a3
{
  self->_isSecondEnrollment = a3;
}

- (int64_t)initialInterfaceOrientation
{
  return self->_initialInterfaceOrientation;
}

- (void)setInitialInterfaceOrientation:(int64_t)a3
{
  self->_initialInterfaceOrientation = a3;
}

- (BKUIAlertView)alertView
{
  return self->_alertView;
}

- (void)setAlertView:(id)a3
{
}

- (UIView)mesaEnrollErrorButtonsContainer
{
  return self->_mesaEnrollErrorButtonsContainer;
}

- (void)setMesaEnrollErrorButtonsContainer:(id)a3
{
}

- (UIButton)mesaEnrollErrorButtonRestartEnroll
{
  return self->_mesaEnrollErrorButtonRestartEnroll;
}

- (void)setMesaEnrollErrorButtonRestartEnroll:(id)a3
{
}

- (BOOL)hideUnlockMessage
{
  return self->_hideUnlockMessage;
}

- (void)setHideUnlockMessage:(BOOL)a3
{
  self->_hideUnlockMessage = a3;
}

- (BKUICurvesView)mesaFirstEnrollView
{
  return self->_mesaFirstEnrollView;
}

- (void)setMesaFirstEnrollView:(id)a3
{
}

- (BKUICurvesView)mesaSecondEnrollView
{
  return self->_mesaSecondEnrollView;
}

- (void)setMesaSecondEnrollView:(id)a3
{
}

- (NSArray)mesaEnrollContainerConstraints
{
  return self->_mesaEnrollContainerConstraints;
}

- (void)setMesaEnrollContainerConstraints:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (OBTrayButton)retryButton
{
  return self->_retryButton;
}

- (void)setRetryButton:(id)a3
{
}

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (NSLayoutConstraint)contentViewHeightConstraint
{
  return self->_contentViewHeightConstraint;
}

- (void)setContentViewHeightConstraint:(id)a3
{
}

- (BOOL)rotating
{
  return self->_rotating;
}

- (void)setRotating:(BOOL)a3
{
  self->_rotating = a3;
}

- (CGPoint)anchorPoint
{
  double x = self->_anchorPoint.x;
  double y = self->_anchorPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setAnchorPoint:(CGPoint)a3
{
  self->_anchorPoint = a3;
}

- (NSLayoutConstraint)enrollCurvesViewTopConstraint
{
  return self->_enrollCurvesViewTopConstraint;
}

- (void)setEnrollCurvesViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)enrollCurvesViewCenterConstraint
{
  return self->_enrollCurvesViewCenterConstraint;
}

- (void)setEnrollCurvesViewCenterConstraint:(id)a3
{
}

- (BOOL)disableContentViewSizing
{
  return self->_disableContentViewSizing;
}

- (void)setDisableContentViewSizing:(BOOL)a3
{
  self->_disableContentViewSizing = a3;
}

- (double)innerAndOuterCurvesViewHeightDiff
{
  return self->_innerAndOuterCurvesViewHeightDiff;
}

- (void)setInnerAndOuterCurvesViewHeightDiff:(double)a3
{
  self->_innerAndOuterCurvesViewHeightDiff = a3;
}

- (double)enrollProgress
{
  return self->_enrollProgress;
}

- (void)setEnrollProgress:(double)a3
{
  self->_enrollProgress = a3;
}

- (BKUIIndicatorWindow)touchindicatorWindow
{
  return self->_touchindicatorWindow;
}

- (void)setTouchindicatorWindow:(id)a3
{
}

- (CGSize)buttonTraySize
{
  double width = self->_buttonTraySize.width;
  double height = self->_buttonTraySize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setButtonTraySize:(CGSize)a3
{
  self->_buttonTraySize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_touchindicatorWindow, 0);
  objc_storeStrong((id *)&self->_enrollCurvesViewCenterConstraint, 0);
  objc_storeStrong((id *)&self->_enrollCurvesViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_contentViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_storeStrong((id *)&self->_retryButton, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_mesaEnrollContainerConstraints, 0);
  objc_storeStrong((id *)&self->_mesaSecondEnrollView, 0);
  objc_storeStrong((id *)&self->_mesaFirstEnrollView, 0);
  objc_storeStrong((id *)&self->_mesaEnrollErrorButtonRestartEnroll, 0);
  objc_storeStrong((id *)&self->_mesaEnrollErrorButtonsContainer, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_headerTitle, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->bkui_fingerprint_enroll_view_controller_log, 0);
}

- (void)_updateEnrollViewsForSize:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Updating enroll views for new size.", v1, 2u);
}

- (void)shouldAnimateEntireView
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_DEBUG, "Enroll Height: %f\tButton Height: %f", (uint8_t *)&v3, 0x16u);
}

void __96__BKUIFingerPrintEnrollmentPhaseViewController_updateHeaderWithTitle_animated_heightDifference___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_fault_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_FAULT, "FingerPrintEnrollmentPhaseViewController: The translation content for the header view's title of enrollment is way too long!", v1, 2u);
}

@end