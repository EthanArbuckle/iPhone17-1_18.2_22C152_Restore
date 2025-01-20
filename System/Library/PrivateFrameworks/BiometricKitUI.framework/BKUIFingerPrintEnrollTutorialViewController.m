@interface BKUIFingerPrintEnrollTutorialViewController
- (BKUIAnimationView)animationView;
- (BKUIEmbeddedEnrollmentSelectionType)delegate;
- (BKUIFingerPrintPosedVideoPlayerView)posedVideoPlayerView;
- (BOOL)_topTouchButtonIpad;
- (BOOL)inBuddy;
- (BOOL)isSecondEnrollment;
- (BOOL)showFollowUpEnrollmentUpSellContent;
- (CGRect)displayRect;
- (NSLayoutConstraint)contentViewTopConstraint;
- (NSTimer)animationTimer;
- (OBAnimationController)animationController;
- (OBTrayButton)continueButton;
- (OBTrayButton)skipButton;
- (UIImageView)enrollTutorialImageView;
- (UITraitChangeRegistration)traitChangeRegistration;
- (double)_contentViewHeight;
- (double)_contentViewTopOffset;
- (id)_detailTextPhase1;
- (id)_devicePrefix;
- (id)_headerTitlePhase1;
- (id)_headerTitlePhase2;
- (id)_videoAssetName;
- (id)combinedTutorialText;
- (id)initInBuddy:(BOOL)a3 displayRect:(CGRect)a4;
- (id)tutorialImage;
- (id)tutorialText;
- (int64_t)initialInterfaceOrientation;
- (unint64_t)enrollViewState;
- (void)_continuePressed:(id)a3;
- (void)_enrollSkipped:(id)a3;
- (void)_performInitialAnimationSetup;
- (void)_restartAnimation;
- (void)_setupTouchIDAnimation;
- (void)loadAVPlayer;
- (void)setAnimationController:(id)a3;
- (void)setAnimationTimer:(id)a3;
- (void)setAnimationView:(id)a3;
- (void)setContentViewTopConstraint:(id)a3;
- (void)setContinueButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayRect:(CGRect)a3;
- (void)setEnrollTutorialImageView:(id)a3;
- (void)setEnrollViewState:(unint64_t)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setInitialInterfaceOrientation:(int64_t)a3;
- (void)setIsSecondEnrollment:(BOOL)a3;
- (void)setPosedVideoPlayerView:(id)a3;
- (void)setShowFollowUpEnrollmentUpSellContent:(BOOL)a3;
- (void)setSkipButton:(id)a3;
- (void)setTraitChangeRegistration:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation BKUIFingerPrintEnrollTutorialViewController

- (id)initInBuddy:(BOOL)a3 displayRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  BOOL v8 = a3;
  v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v11 = [v10 localizedStringForKey:@"SET_UP_MESA" value:&stru_1F4081468 table:@"BiometricKitUI"];
  v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v13 = [v12 localizedStringForKey:@"INTRO_TEXT" value:&stru_1F4081468 table:@"BiometricKitUI"];
  v18.receiver = self;
  v18.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  v14 = [(BKUIFingerPrintEnrollTutorialViewController *)&v18 initWithTitle:v11 detailText:v13 icon:0 contentLayout:1];

  if (v14)
  {
    [(BKUIFingerPrintEnrollTutorialViewController *)v14 setInBuddy:v8];
    v14->_enrollViewState = 0;
    v14->_displayRect.origin.CGFloat x = x;
    v14->_displayRect.origin.CGFloat y = y;
    v14->_displayRect.size.CGFloat width = width;
    v14->_displayRect.size.CGFloat height = height;
    v15 = [(BKUIFingerPrintEnrollTutorialViewController *)v14 tutorialImage];
    v16 = [(BKUIFingerPrintEnrollTutorialViewController *)v14 enrollTutorialImageView];
    [v16 setImage:v15];
  }
  return v14;
}

- (void)viewDidLoad
{
  v81[4] = *MEMORY[0x1E4F143B8];
  v78.receiver = self;
  v78.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  [(OBBaseWelcomeController *)&v78 viewDidLoad];
  v3 = (OS_os_log *)os_log_create("com.apple.biometrickitui", "TouchID Tutorial Animation View");
  bkui_animation_view_log = self->bkui_animation_view_log;
  self->bkui_animation_view_log = v3;

  v5 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
  [v5 setPrivacyLinkForBundles:&unk_1F40946F0];

  v6 = [MEMORY[0x1E4F83A80] boldButton];
  [(BKUIFingerPrintEnrollTutorialViewController *)self setContinueButton:v6];

  v7 = [(BKUIFingerPrintEnrollTutorialViewController *)self continueButton];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v8 = [(BKUIFingerPrintEnrollTutorialViewController *)self continueButton];
  v9 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v10 = [v9 localizedStringForKey:@"CONTINUE" value:&stru_1F4081468 table:@"BiometricKitUI"];
  [v8 setTitle:v10 forState:0];

  v11 = [(BKUIFingerPrintEnrollTutorialViewController *)self continueButton];
  [v11 addTarget:self action:sel__continuePressed_ forControlEvents:64];

  v12 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
  v13 = [(BKUIFingerPrintEnrollTutorialViewController *)self continueButton];
  [v12 addButton:v13];

  if ([(BKUIFingerPrintEnrollTutorialViewController *)self inBuddy])
  {
    v14 = [MEMORY[0x1E4F83AB8] linkButton];
    [(BKUIFingerPrintEnrollTutorialViewController *)self setSkipButton:v14];

    v15 = [(BKUIFingerPrintEnrollTutorialViewController *)self skipButton];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    v16 = [(BKUIFingerPrintEnrollTutorialViewController *)self skipButton];
    v17 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v18 = [v17 localizedStringForKey:@"SKIP_ENROLL" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [v16 setTitle:v18 forState:0];

    v19 = [(BKUIFingerPrintEnrollTutorialViewController *)self skipButton];
    [v19 addTarget:self action:sel__enrollSkipped_ forControlEvents:64];

    v20 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
    v21 = [(BKUIFingerPrintEnrollTutorialViewController *)self skipButton];
    [v20 addButton:v21];
  }
  [(BKUIFingerPrintEnrollTutorialViewController *)self setEnrollViewState:0];
  v22 = [(BKUIFingerPrintEnrollTutorialViewController *)self scrollView];
  v23 = [v22 layer];
  [v23 setMasksToBounds:0];

  if ([(BKUIFingerPrintEnrollTutorialViewController *)self _topTouchButtonIpad])
  {
    v24 = [BKUIFingerPrintPosedVideoPlayerView alloc];
    v25 = [(BKUIFingerPrintEnrollTutorialViewController *)self _videoAssetName];
    v26 = [(BKUIFingerPrintEnrollTutorialViewController *)self _devicePrefix];
    v27 = [(BKUIFingerPrintPosedVideoPlayerView *)v24 initWithAssetName:v25 subdirectory:v26];
    [(BKUIFingerPrintEnrollTutorialViewController *)self setPosedVideoPlayerView:v27];

    v28 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    [v28 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v29 = objc_alloc(MEMORY[0x1E4F42FF0]);
    v74 = objc_msgSend(v29, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [v74 setTranslatesAutoresizingMaskIntoConstraints:0];
    v30 = [v74 layer];
    [v30 setMasksToBounds:1];

    v31 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    [v74 addSubview:v31];

    v59 = (void *)MEMORY[0x1E4F28DC8];
    v72 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    v70 = [v72 leadingAnchor];
    v68 = [v74 leadingAnchor];
    v66 = [v70 constraintEqualToAnchor:v68];
    v81[0] = v66;
    v64 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    v62 = [v64 trailingAnchor];
    v61 = [v74 trailingAnchor];
    v60 = [v62 constraintEqualToAnchor:v61];
    v81[1] = v60;
    v32 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    v33 = [v32 topAnchor];
    v34 = [v74 topAnchor];
    v35 = [v33 constraintEqualToAnchor:v34];
    v81[2] = v35;
    v36 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    v37 = [v36 bottomAnchor];
    v38 = [v74 bottomAnchor];
    v39 = [v37 constraintEqualToAnchor:v38];
    v81[3] = v39;
    v40 = [MEMORY[0x1E4F1C978] arrayWithObjects:v81 count:4];
    [v59 activateConstraints:v40];
  }
  else
  {
    v74 = [(BKUIFingerPrintEnrollTutorialViewController *)self enrollTutorialImageView];
  }
  v41 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentView];
  [v41 addSubview:v74];

  v42 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentView];
  v43 = [MEMORY[0x1E4F428B8] secondarySystemBackgroundColor];
  [v42 setBackgroundColor:v43];

  v44 = [v74 topAnchor];
  v45 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentView];
  v46 = [v45 topAnchor];
  [(BKUIFingerPrintEnrollTutorialViewController *)self _contentViewTopOffset];
  v47 = objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46);
  [(BKUIFingerPrintEnrollTutorialViewController *)self setContentViewTopConstraint:v47];

  v63 = (void *)MEMORY[0x1E4F28DC8];
  v73 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentViewTopConstraint];
  v80[0] = v73;
  v69 = [v74 bottomAnchor];
  v71 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentView];
  v67 = [v71 bottomAnchor];
  v65 = [v69 constraintEqualToAnchor:v67];
  v80[1] = v65;
  v48 = [v74 leadingAnchor];
  v49 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentView];
  v50 = [v49 leadingAnchor];
  v51 = [v48 constraintEqualToAnchor:v50];
  v80[2] = v51;
  v52 = [v74 trailingAnchor];
  v53 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentView];
  v54 = [v53 trailingAnchor];
  v55 = [v52 constraintEqualToAnchor:v54];
  v80[3] = v55;
  v56 = [MEMORY[0x1E4F1C978] arrayWithObjects:v80 count:4];
  [v63 activateConstraints:v56];

  [(BKUIFingerPrintEnrollTutorialViewController *)self _setupTouchIDAnimation];
  [(BKUIFingerPrintEnrollTutorialViewController *)self loadAVPlayer];
  objc_initWeak(&location, self);
  uint64_t v79 = objc_opt_class();
  v57 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v79 count:1];
  v75[0] = MEMORY[0x1E4F143A8];
  v75[1] = 3221225472;
  v75[2] = __58__BKUIFingerPrintEnrollTutorialViewController_viewDidLoad__block_invoke;
  v75[3] = &unk_1E6EA2070;
  objc_copyWeak(&v76, &location);
  v58 = [(BKUIFingerPrintEnrollTutorialViewController *)self registerForTraitChanges:v57 withHandler:v75];
  [(BKUIFingerPrintEnrollTutorialViewController *)self setTraitChangeRegistration:v58];

  objc_destroyWeak(&v76);
  objc_destroyWeak(&location);
}

void __58__BKUIFingerPrintEnrollTutorialViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained tutorialImage];
  v2 = [WeakRetained enrollTutorialImageView];
  [v2 setImage:v1];
}

- (void)viewDidLayoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  [(OBBaseWelcomeController *)&v6 viewDidLayoutSubviews];
  [(BKUIFingerPrintEnrollTutorialViewController *)self _contentViewTopOffset];
  double v4 = v3;
  v5 = [(BKUIFingerPrintEnrollTutorialViewController *)self contentViewTopConstraint];
  [v5 setConstant:v4];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(BKUIFingerPrintEnrollTutorialViewController *)self performSelector:sel__performInitialAnimationSetup withObject:0 afterDelay:0.5];
}

- (void)_performInitialAnimationSetup
{
  double v3 = [(BKUIFingerPrintEnrollTutorialViewController *)self animationTimer];

  if (!v3)
  {
    objc_super v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self animationController];
    [v4 startAnimation];

    id v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__restartAnimation selector:0 userInfo:1 repeats:5.0];
    [(BKUIFingerPrintEnrollTutorialViewController *)self setAnimationTimer:v5];
  }
}

- (void)_restartAnimation
{
  double v3 = [(BKUIFingerPrintEnrollTutorialViewController *)self animationController];
  [v3 stopAnimation];

  id v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self animationController];
  [v4 startAnimation];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  [(BKUIFingerPrintEnrollTutorialViewController *)&v5 viewDidDisappear:a3];
  id v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self animationTimer];
  [v4 invalidate];

  [(BKUIFingerPrintEnrollTutorialViewController *)self setAnimationTimer:0];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)BKUIFingerPrintEnrollTutorialViewController;
  id v7 = a4;
  -[OBBaseWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98__BKUIFingerPrintEnrollTutorialViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E6EA2770;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:0];
}

void __98__BKUIFingerPrintEnrollTutorialViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) posedVideoPlayerView];
  v2 = [*(id *)(a1 + 32) view];
  double v3 = [v2 window];
  id v4 = [v3 windowScene];
  objc_msgSend(v5, "transitionToOrientation:", objc_msgSend(v4, "interfaceOrientation"));
}

- (id)tutorialText
{
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"SCAN_FINGER_HOME" value:&stru_1F4081468 table:@"BiometricKitUI"];

  if ([(BKUIFingerPrintEnrollTutorialViewController *)self _topTouchButtonIpad])
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"SCAN_FINGER_HOME_FOLLOW_UP" value:&stru_1F4081468 table:@"Mesa-j307"];

    id v4 = (void *)v6;
  }

  return v4;
}

- (id)combinedTutorialText
{
  double v3 = NSString;
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v5 = [v4 localizedStringForKey:@"INTRO_TEXT" value:&stru_1F4081468 table:@"BiometricKitUI"];
  uint64_t v6 = [(BKUIFingerPrintEnrollTutorialViewController *)self tutorialText];
  id v7 = [v3 stringWithFormat:@"%@\n\n%@", v5, v6];

  return v7;
}

- (UIImageView)enrollTutorialImageView
{
  enrollTutorialImageView = self->_enrollTutorialImageView;
  if (!enrollTutorialImageView)
  {
    id v4 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4F42AA0]);
    id v5 = self->_enrollTutorialImageView;
    self->_enrollTutorialImageView = v4;

    [(UIImageView *)self->_enrollTutorialImageView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIImageView *)self->_enrollTutorialImageView setContentMode:2];
    [(UIImageView *)self->_enrollTutorialImageView setClipsToBounds:0];
    [(UIImageView *)self->_enrollTutorialImageView setAccessibilityIgnoresInvertColors:1];
    uint64_t v6 = [(BKUIFingerPrintEnrollTutorialViewController *)self tutorialImage];
    [(UIImageView *)self->_enrollTutorialImageView setImage:v6];

    enrollTutorialImageView = self->_enrollTutorialImageView;
  }

  return enrollTutorialImageView;
}

- (id)tutorialImage
{
  v2 = (void *)MEMORY[0x1E4F42A80];
  double v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v2 userInterfaceStyleSpecificImageInBundle:v3];

  return v4;
}

- (void)_continuePressed:(id)a3
{
  id v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self delegate];
  [v4 didSelectPrimaryButton:self];
}

- (void)_enrollSkipped:(id)a3
{
  id v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self delegate];
  [v4 didSelectSecondaryButton:self];
}

- (void)setEnrollViewState:(unint64_t)a3
{
  self->_enrollViewState = a3;
  if (a3 - 2 >= 3)
  {
    if (a3 == 1)
    {
      objc_super v18 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
      v19 = [(BKUIFingerPrintEnrollTutorialViewController *)self _headerTitlePhase2];
      [v18 setTitle:v19];

      v20 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
      v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v22 = [v21 localizedStringForKey:@"KEEP_GOING" value:&stru_1F4081468 table:@"BiometricKitUI"];
      [v20 setDetailText:v22];

      v23 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
      [v23 layoutIfNeeded];

      v24 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
      [v24 removeAllButtons];

      v25 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
      v26 = [(BKUIFingerPrintEnrollTutorialViewController *)self continueButton];
      [v25 addButton:v26];

      v27 = [(BKUIFingerPrintEnrollTutorialViewController *)self tutorialImage];
      v28 = [(BKUIFingerPrintEnrollTutorialViewController *)self enrollTutorialImageView];
      [v28 setImage:v27];

      id v36 = [(BKUIFingerPrintEnrollTutorialViewController *)self view];
      [v36 layoutIfNeeded];
    }
    else
    {
      if (a3) {
        return;
      }
      id v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
      id v5 = [(BKUIFingerPrintEnrollTutorialViewController *)self _headerTitlePhase1];
      [v4 setTitle:v5];

      uint64_t v6 = [(BKUIFingerPrintEnrollTutorialViewController *)self tutorialImage];
      id v7 = [(BKUIFingerPrintEnrollTutorialViewController *)self enrollTutorialImageView];
      [v7 setImage:v6];

      BOOL v8 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
      [v8 layoutIfNeeded];

      objc_super v9 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
      [v9 removeAllButtons];

      if ([(BKUIFingerPrintEnrollTutorialViewController *)self inBuddy])
      {
        v10 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
        v11 = [(BKUIFingerPrintEnrollTutorialViewController *)self continueButton];
        [v10 addButton:v11];

        BOOL v12 = [(BKUIFingerPrintEnrollTutorialViewController *)self isSecondEnrollment];
        v13 = [(BKUIFingerPrintEnrollTutorialViewController *)self skipButton];
        v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        v15 = v14;
        if (v12)
        {
          v16 = @"SKIP_ENROLL_FOLLOW_UP";
          v17 = @"Mesa-j307";
        }
        else
        {
          v16 = @"SKIP_ENROLL";
          v17 = @"BiometricKitUI";
        }
        v31 = [v14 localizedStringForKey:v16 value:&stru_1F4081468 table:v17];
        [v13 setTitle:v31 forState:0];

        v32 = [(BKUIFingerPrintEnrollTutorialViewController *)self buttonTray];
        v33 = [(BKUIFingerPrintEnrollTutorialViewController *)self skipButton];
        [v32 addButton:v33];

        id v29 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
        uint64_t v30 = [(BKUIFingerPrintEnrollTutorialViewController *)self _detailTextPhase1];
      }
      else
      {
        id v29 = [(BKUIFingerPrintEnrollTutorialViewController *)self headerView];
        uint64_t v30 = [(BKUIFingerPrintEnrollTutorialViewController *)self combinedTutorialText];
      }
      v34 = (void *)v30;
      [v29 setDetailText:v30];

      id v36 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
      v35 = [(BKUIFingerPrintEnrollTutorialViewController *)self _videoAssetName];
      [v36 setAssetName:v35];
    }
  }
  else
  {
    [(BKUIFingerPrintEnrollTutorialViewController *)self setEnrollViewState:0];
  }
}

- (double)_contentViewHeight
{
  BOOL v3 = [(BKUIFingerPrintEnrollTutorialViewController *)self _topTouchButtonIpad];
  [(BKUIFingerPrintEnrollTutorialViewController *)self displayRect];
  float v5 = v4 * 0.36;
  float v6 = fmaxf(v5, 200.0);
  if (v3) {
    return (float)(v6 + 30.0);
  }
  return v6;
}

- (id)_headerTitlePhase1
{
  if ([(BKUIFingerPrintEnrollTutorialViewController *)self showFollowUpEnrollmentUpSellContent]&& [(BKUIFingerPrintEnrollTutorialViewController *)self isSecondEnrollment])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    float v5 = @"SET_UP_MESA_FOLLOW_UP";
    float v6 = @"Mesa-j307";
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    float v5 = @"SET_UP_MESA";
    float v6 = @"BiometricKitUI";
  }
  id v7 = [v3 localizedStringForKey:v5 value:&stru_1F4081468 table:v6];

  return v7;
}

- (id)_detailTextPhase1
{
  if ([(BKUIFingerPrintEnrollTutorialViewController *)self showFollowUpEnrollmentUpSellContent]&& [(BKUIFingerPrintEnrollTutorialViewController *)self isSecondEnrollment])
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    float v5 = @"INTRO_TEXT_FOLLOW_UP_SECOND_FINGER_IPAD";
    float v6 = @"Mesa-j307";
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v4 = v3;
    float v5 = @"INTRO_TEXT";
    float v6 = @"BiometricKitUI";
  }
  id v7 = [v3 localizedStringForKey:v5 value:&stru_1F4081468 table:v6];

  return v7;
}

- (id)_headerTitlePhase2
{
  BOOL v2 = [(BKUIFingerPrintEnrollTutorialViewController *)self _topTouchButtonIpad];
  BOOL v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v4 = v3;
  if (v2)
  {
    float v5 = @"ADJUST_GRIP_FOLLOW_UP";
    float v6 = @"Mesa-j307";
  }
  else
  {
    float v5 = @"ADJUST_GRIP";
    float v6 = @"BiometricKitUI";
  }
  id v7 = [v3 localizedStringForKey:v5 value:&stru_1F4081468 table:v6];

  return v7;
}

- (id)_videoAssetName
{
  BOOL v3 = [(BKUIFingerPrintEnrollTutorialViewController *)self view];
  int64_t v4 = +[BKUIUtils activeInterfaceOrientationForView:v3];

  float v5 = @"_V";
  if (![(BKUIFingerPrintEnrollTutorialViewController *)self enrollViewState])
  {
    if ([(BKUIFingerPrintEnrollTutorialViewController *)self isSecondEnrollment])
    {
      int64_t v6 = [(BKUIFingerPrintEnrollTutorialViewController *)self initialInterfaceOrientation];
      id v7 = @"_V";
      BOOL v8 = @"_H_rotate";
      if ((unint64_t)(v4 - 3) >= 2) {
        BOOL v8 = @"_V";
      }
      if ((unint64_t)(v6 - 3) <= 1) {
        objc_super v9 = v8;
      }
      else {
        objc_super v9 = @"_V";
      }
      if ((unint64_t)(v4 - 3) < 2) {
        id v7 = @"_H";
      }
      if ((unint64_t)(v4 - 1) < 2) {
        id v7 = @"_V_rotate";
      }
      if ((unint64_t)(v6 - 1) <= 1) {
        float v5 = v7;
      }
      else {
        float v5 = v9;
      }
    }
    else if ((unint64_t)(v4 - 3) < 2)
    {
      float v5 = @"_H";
    }
  }
  v10 = [(BKUIFingerPrintEnrollTutorialViewController *)self _devicePrefix];
  v11 = [v10 stringByAppendingString:v5];

  return v11;
}

- (void)loadAVPlayer
{
  if (![(BKUIFingerPrintEnrollTutorialViewController *)self enrollViewState])
  {
    BOOL IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
    int64_t v4 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
    id v6 = v4;
    if (IsReduceMotionEnabled)
    {
      [v4 setAlpha:0.0];

      float v5 = [(BKUIFingerPrintEnrollTutorialViewController *)self posedVideoPlayerView];
      [v5 load];

      v7[0] = MEMORY[0x1E4F143A8];
      v7[1] = 3221225472;
      v7[2] = __59__BKUIFingerPrintEnrollTutorialViewController_loadAVPlayer__block_invoke;
      v7[3] = &unk_1E6EA20C0;
      v7[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v7 animations:1.0];
    }
    else
    {
      [v4 load];
    }
  }
}

void __59__BKUIFingerPrintEnrollTutorialViewController_loadAVPlayer__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) posedVideoPlayerView];
  [v1 setAlpha:1.0];
}

- (BOOL)_topTouchButtonIpad
{
  if (MGGetBoolAnswer())
  {
    BOOL v2 = +[BKUIDevice sharedInstance];
    [v2 isIdiomPad];
  }
  return MGGetSInt32Answer() == 2;
}

- (id)_devicePrefix
{
  BOOL v2 = @"iPadMini2021";
  uint64_t v3 = MGGetProductType();
  if (v3 > 2903084587)
  {
    if (v3 == 2903084588 || v3 == 2959111092) {
      return v2;
    }
    if (v3 != 4242862982) {
      return @"J307";
    }
    return @"iPadEDU2022";
  }
  if (v3 == 1878257790) {
    return @"iPadEDU2022";
  }
  if (v3 != 1895344378 && v3 != 2566016329) {
    return @"J307";
  }
  return v2;
}

- (void)_setupTouchIDAnimation
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_ERROR, "animation url not found in bundle", v1, 2u);
}

- (double)_contentViewTopOffset
{
  uint64_t v3 = [(BKUIFingerPrintEnrollTutorialViewController *)self navigationController];
  int64_t v4 = [v3 navigationBar];
  [v4 bounds];
  double v6 = -v5;
  id v7 = [(BKUIFingerPrintEnrollTutorialViewController *)self navigationController];
  BOOL v8 = [v7 view];
  objc_super v9 = [v8 window];
  v10 = [v9 windowScene];
  v11 = [v10 statusBarManager];
  [v11 statusBarFrame];
  double v13 = v6 - v12;

  uint64_t v14 = [(BKUIFingerPrintEnrollTutorialViewController *)self presentingViewController];
  if (v14)
  {
    v15 = (void *)v14;
    v16 = +[BKUIDevice sharedInstance];
    int v17 = [v16 isIdiomPad];

    if (v17)
    {
      objc_super v18 = [(BKUIFingerPrintEnrollTutorialViewController *)self navigationController];
      v19 = [v18 navigationBar];
      [v19 bounds];
      double v13 = -v20;
    }
  }
  return v13;
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
  self->_inBuddCGFloat y = a3;
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

- (OBTrayButton)skipButton
{
  return self->_skipButton;
}

- (void)setSkipButton:(id)a3
{
}

- (OBTrayButton)continueButton
{
  return self->_continueButton;
}

- (void)setContinueButton:(id)a3
{
}

- (CGRect)displayRect
{
  double x = self->_displayRect.origin.x;
  double y = self->_displayRect.origin.y;
  double width = self->_displayRect.size.width;
  double height = self->_displayRect.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setDisplayRect:(CGRect)a3
{
  self->_displayRect = a3;
}

- (void)setEnrollTutorialImageView:(id)a3
{
}

- (OBAnimationController)animationController
{
  return self->_animationController;
}

- (void)setAnimationController:(id)a3
{
}

- (BKUIAnimationView)animationView
{
  return self->_animationView;
}

- (void)setAnimationView:(id)a3
{
}

- (NSLayoutConstraint)contentViewTopConstraint
{
  return self->_contentViewTopConstraint;
}

- (void)setContentViewTopConstraint:(id)a3
{
}

- (BKUIFingerPrintPosedVideoPlayerView)posedVideoPlayerView
{
  return self->_posedVideoPlayerView;
}

- (void)setPosedVideoPlayerView:(id)a3
{
}

- (NSTimer)animationTimer
{
  return self->_animationTimer;
}

- (void)setAnimationTimer:(id)a3
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
  objc_storeStrong((id *)&self->_animationTimer, 0);
  objc_storeStrong((id *)&self->_posedVideoPlayerView, 0);
  objc_storeStrong((id *)&self->_contentViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_animationView, 0);
  objc_storeStrong((id *)&self->_animationController, 0);
  objc_storeStrong((id *)&self->_enrollTutorialImageView, 0);
  objc_storeStrong((id *)&self->_continueButton, 0);
  objc_storeStrong((id *)&self->_skipButton, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->bkui_animation_view_log, 0);
}

@end