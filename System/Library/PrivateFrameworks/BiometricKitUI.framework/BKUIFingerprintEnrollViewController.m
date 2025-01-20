@interface BKUIFingerprintEnrollViewController
- (BKDeviceTouchID)bkDevice;
- (BKEnrollTouchIDOperation)bkEnroll;
- (BKExtendEnrollTouchIDOperation)bkExtendEnroll;
- (BKIdentity)bkIdentity;
- (BKIdentity)firstFollowUpIdentity;
- (BKUIFingerPrintEnrollTutorialViewController)tutorialController;
- (BKUIFingerPrintEnrollmentPhaseViewController)enrollmentControlller;
- (BKUIFingerprintEnrollViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (BOOL)_shouldHideUnlockMessage;
- (BOOL)_topTouchButtonIpad;
- (BOOL)_useAlertHud;
- (BOOL)fingerOn;
- (BOOL)followUPEnrollmentUpSell;
- (BOOL)isModalInPresentation;
- (BOOL)waitForFingerLift;
- (BioStreamsEventHelper)bioStreamEventHelper;
- (CGSize)preferredContentSize;
- (id)_deviceAwareLocalizedStringForKey:(id)a3;
- (id)_liftFingerString;
- (id)_placeFingerString;
- (id)_readyString;
- (id)_subtitleFont;
- (id)bundleAlertView;
- (id)menuAction;
- (int64_t)bkProgress;
- (unint64_t)_bkDeviceIdentityCount;
- (unint64_t)_bkIdentityCount;
- (void)_animateHeaderTitle:(id)a3;
- (void)_bkIdentityCount;
- (void)_cancelActiveEnrollOperation;
- (void)_cancelEnrollmentAndRestart:(BOOL)a3;
- (void)_cancelEnrollmentMatch;
- (void)_enrollHapticFeedback:(id)a3;
- (void)_failEnrollment:(int)a3 withMessage:(id)a4;
- (void)_finishEnrollmentPhaseTwo;
- (void)_hapticFeedback:(BOOL)a3;
- (void)_messageTimeout;
- (void)_requestNewAuthToken;
- (void)_resetUI;
- (void)_resetUIWithTransitionToTutorial:(BOOL)a3;
- (void)_restartEnrollment;
- (void)_sendEnrollResult:(int)a3 identity:(id)a4;
- (void)_setTapRecognizer:(id)a3;
- (void)_showDirtOnSensorAlertView;
- (void)_showLiftYourFinger;
- (void)_showLiftYourFingerWithDelay;
- (void)_showSkipEnrollmentAlert;
- (void)_showSmallCoverageAlertView;
- (void)_skipEnrollment;
- (void)_startEnrollOperation;
- (void)_startExtendEnrollOperation;
- (void)_startInitialTutorialAnimated:(BOOL)a3;
- (void)_startMessageTimer:(double)a3;
- (void)_startTutorial:(BOOL)a3;
- (void)_stopBiometricOperations;
- (void)_stopMessageTimer;
- (void)_stopTutorialTransitionToEnrollView;
- (void)_transitionPromptMessage:(id)a3;
- (void)_tutorialContinueButtonPressed;
- (void)animationDidStop:(id)a3 finished:(BOOL)a4;
- (void)applicationWillResignActive:(id)a3;
- (void)cancelEnroll;
- (void)constructAlertView;
- (void)createEnrollUI;
- (void)dealloc;
- (void)didSelectPrimaryButton:(id)a3;
- (void)didSelectSecondaryButton:(id)a3;
- (void)enrollDoneContinueButtonPressed;
- (void)enrollOperation:(id)a3 failedWithReason:(int64_t)a4;
- (void)enrollOperation:(id)a3 finishedWithIdentity:(id)a4;
- (void)enrollOperation:(id)a3 percentCompleted:(int64_t)a4;
- (void)enrollOperation:(id)a3 progressedWithTouchIDInfo:(id)a4;
- (void)enrollProgress:(id)a3;
- (void)extendEnroll:(id)a3 hasUpdated:(BOOL)a4;
- (void)fingerprintCaptureOperation:(id)a3 encounteredCaptureError:(int64_t)a4;
- (void)handleProgress:(unsigned int)a3;
- (void)homeButtonPressed;
- (void)initPromptMessage;
- (void)loadView;
- (void)operation:(id)a3 finishedWithReason:(int64_t)a4;
- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4;
- (void)operation:(id)a3 stateChanged:(int64_t)a4;
- (void)respondToTapGesture:(id)a3;
- (void)restartEnroll;
- (void)restartEnrollPressed:(id)a3;
- (void)setBioStreamEventHelper:(id)a3;
- (void)setBkDevice:(id)a3;
- (void)setBkEnroll:(id)a3;
- (void)setBkExtendEnroll:(id)a3;
- (void)setBkIdentity:(id)a3;
- (void)setBkProgress:(int64_t)a3;
- (void)setEnrollmentControlller:(id)a3;
- (void)setFingerOn:(BOOL)a3;
- (void)setFirstFollowUpIdentity:(id)a3;
- (void)setFollowUPEnrollmentUpSell:(BOOL)a3;
- (void)setTutorialController:(id)a3;
- (void)setWaitForFingerLift:(BOOL)a3;
- (void)showSecondFingerEnrollmentUpSell;
- (void)skipEnrollmentPressed:(id)a3;
- (void)statusMessage:(unsigned int)a3;
- (void)transitionToEnrollView:(BOOL)a3;
- (void)transitionToTutorialView:(BOOL)a3;
- (void)transitionToTutorialView:(BOOL)a3 completion:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation BKUIFingerprintEnrollViewController

- (BKUIFingerprintEnrollViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)BKUIFingerprintEnrollViewController;
  v4 = [(BKUIFingerprintEnrollViewController *)&v12 initWithNibName:a3 bundle:a4];
  if (v4)
  {
    os_log_t v5 = os_log_create("com.apple.biometrickitui", "ResultDelegate");
    bkui_result_delegate_log = v4->bkui_result_delegate_log;
    v4->bkui_result_delegate_log = (OS_os_log *)v5;

    os_log_t v7 = os_log_create("com.apple.biometrickitui", "BiometricKitDelegate");
    bkui_biometric_kit_delegate_log = v4->bkui_biometric_kit_delegate_log;
    v4->bkui_biometric_kit_delegate_log = (OS_os_log *)v7;

    os_log_t v9 = os_log_create("com.apple.biometrickitui", "FingerprintEnrollViewController");
    bkui_fingerprint_enroll_view_controller_log = v4->bkui_fingerprint_enroll_view_controller_log;
    v4->bkui_fingerprint_enroll_view_controller_log = (OS_os_log *)v9;
  }
  return v4;
}

- (BOOL)isModalInPresentation
{
  float currentProgress = self->_currentProgress;
  v3 = [(BKUIFingerprintEnrollViewController *)self bkIdentity];

  return currentProgress != 0.0 || v3 != 0;
}

- (void)dealloc
{
  [(BKUIFingerprintEnrollViewController *)self _stopMessageTimer];
  [(BKEnrollTouchIDOperation *)self->_bkEnroll cancel];
  v3.receiver = self;
  v3.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIFingerprintEnrollViewController *)&v3 dealloc];
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIFingerprintEnrollViewController *)&v5 loadView];
  objc_super v3 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  v4 = [(BKUIFingerprintEnrollViewController *)self view];
  [v4 setBackgroundColor:v3];

  [(BKUIFingerprintEnrollViewController *)self setEdgesForExtendedLayout:15];
}

- (void)constructAlertView
{
  if (!self->_alertView)
  {
    objc_super v3 = objc_alloc_init(BKUIAlertView);
    alertView = self->_alertView;
    self->_alertView = v3;

    if ([(BKUIFingerprintEnrollViewController *)self _useAlertHud])
    {
      +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollAlertHudWhite"];
      if (v5 == 0.0) {
        float v5 = 0.9;
      }
      self->_alertHudWhite = v5;
      +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollAlertHudAlpha"];
      if (v6 == 0.0) {
        float v6 = 0.8;
      }
      self->_alertHudAlpha = v6;
      +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollAlertHudCorners"];
      if (v7 == 0.0) {
        float v7 = 10.0;
      }
      self->_double alertHudCorners = v7;
      +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollAlertHudBorder"];
      if (v8 == 0.0) {
        float v8 = 30.0;
      }
      self->_alertHudBorder = v8;
      +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollAlertHudTimeout"];
      [(BKUIAlertView *)self->_alertView setAlertHudTimeout:v9];
      [(BKUIAlertView *)self->_alertView alertHudTimeout];
      if (v10 == 0.0) {
        [(BKUIAlertView *)self->_alertView setAlertHudTimeout:3.0];
      }
      +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollAlertHudMinDisplayTime"];
      [(BKUIAlertView *)self->_alertView setAlertHudMinDisplayTime:v11];
      [(BKUIAlertView *)self->_alertView alertHudMinDisplayTime];
      if (v12 == 0.0) {
        [(BKUIAlertView *)self->_alertView setAlertHudMinDisplayTime:1.0];
      }
      v13 = (UIView *)objc_alloc_init(MEMORY[0x1E4F42FF0]);
      alertHudView = self->_alertHudView;
      self->_alertHudView = v13;

      v15 = [MEMORY[0x1E4F428B8] clearColor];
      [(UIView *)self->_alertHudView setBackgroundColor:v15];

      [(UIView *)self->_alertHudView setTranslatesAutoresizingMaskIntoConstraints:0];
      double alertHudCorners = self->_alertHudCorners;
      v17 = [(UIView *)self->_alertHudView layer];
      [v17 setCornerRadius:alertHudCorners];

      v18 = [(UIView *)self->_alertHudView layer];
      [v18 setMasksToBounds:1];

      v19 = [(BKUIFingerprintEnrollViewController *)self view];
      [v19 addSubview:self->_alertHudView];

      [(UIView *)self->_alertHudView setHidden:1];
      v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
      alertHudText = self->_alertHudText;
      self->_alertHudText = v20;

      [(UILabel *)self->_alertHudText setTranslatesAutoresizingMaskIntoConstraints:0];
      v22 = self->_alertHudText;
      v23 = [(BKUIFingerprintEnrollViewController *)self _subtitleFont];
      [(UILabel *)v22 setFont:v23];

      [(UILabel *)self->_alertHudText setNumberOfLines:0];
      [(UILabel *)self->_alertHudText setTextAlignment:1];
      [(UIView *)self->_alertHudView addSubview:self->_alertHudText];
      [(BKUIAlertView *)self->_alertView setAlertHudView:self->_alertHudView];
      [(BKUIAlertView *)self->_alertView setAlertHudText:self->_alertHudText];
    }
    v24 = self->_alertHudView;
    if (v24)
    {
      v25 = [(UIView *)v24 widthAnchor];
      v26 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v27 = [v26 contentView];
      v28 = [v27 widthAnchor];
      v29 = [v25 constraintEqualToAnchor:v28];
      [v29 setActive:1];

      v30 = [(BKUIFingerprintEnrollViewController *)self view];
      v31 = (void *)MEMORY[0x1E4F28DC8];
      v32 = self->_alertHudView;
      v33 = [(BKUIFingerprintEnrollViewController *)self view];
      v34 = [v31 constraintWithItem:v32 attribute:9 relatedBy:0 toItem:v33 attribute:9 multiplier:1.0 constant:0.0];
      [v30 addConstraint:v34];

      v35 = [(BKUIFingerprintEnrollViewController *)self view];
      v36 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_alertHudView attribute:10 relatedBy:0 toItem:self->_mesaFirstEnrollView attribute:10 multiplier:1.0 constant:0.0];
      [v35 addConstraint:v36];

      v37 = self->_alertHudView;
      v38 = (void *)MEMORY[0x1E4F28DC8];
      v39 = _NSDictionaryOfVariableBindings(&cfstr_Alerthudtext.isa, self->_alertHudText, 0);
      v40 = [v38 constraintsWithVisualFormat:@"H:|-[_alertHudText]-|" options:0 metrics:0 views:v39];
      [(UIView *)v37 addConstraints:v40];

      v41 = self->_alertHudView;
      v42 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_alertHudText attribute:9 relatedBy:0 toItem:v41 attribute:9 multiplier:1.0 constant:0.0];
      [(UIView *)v41 addConstraint:v42];

      v43 = self->_alertHudView;
      v44 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_alertHudText attribute:10 relatedBy:0 toItem:v43 attribute:10 multiplier:1.0 constant:0.0];
      [(UIView *)v43 addConstraint:v44];

      id v46 = [(BKUIFingerprintEnrollViewController *)self view];
      v45 = [MEMORY[0x1E4F28DC8] constraintWithItem:self->_alertHudView attribute:8 relatedBy:0 toItem:self->_alertHudText attribute:8 multiplier:1.0 constant:self->_alertHudBorder];
      [v46 addConstraint:v45];
    }
  }
}

- (void)createEnrollUI
{
  v108[8] = *MEMORY[0x1E4F143B8];
  objc_super v3 = [(BKUIFingerprintEnrollViewController *)self parentViewController];

  if (v3)
  {
    v4 = [(BKUIFingerprintEnrollViewController *)self view];
    [v4 layoutIfNeeded];
  }
  float v5 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  if (v5)
  {
  }
  else
  {
    float v6 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];

    if (!v6)
    {
      float v7 = [BKUIFingerPrintEnrollTutorialViewController alloc];
      BOOL inBuddy = self->_inBuddy;
      float v9 = [(BKUIFingerprintEnrollViewController *)self parentViewController];
      double v10 = [v9 view];
      [v10 bounds];
      id v11 = -[BKUIFingerPrintEnrollTutorialViewController initInBuddy:displayRect:](v7, "initInBuddy:displayRect:", inBuddy);
      [(BKUIFingerprintEnrollViewController *)self setTutorialController:v11];

      BOOL v12 = [(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell];
      v13 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      [v13 setShowFollowUpEnrollmentUpSellContent:v12];

      v14 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v15 = [v14 view];
      [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

      v16 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      [(BKUIFingerprintEnrollViewController *)self addChildViewController:v16];

      v17 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v18 = [v17 view];
      v19 = [(BKUIFingerprintEnrollViewController *)self view];
      [v19 bounds];
      objc_msgSend(v18, "setFrame:");

      v20 = [(BKUIFingerprintEnrollViewController *)self view];
      v21 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v22 = [v21 view];
      [v20 addSubview:v22];

      v23 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      [v23 didMoveToParentViewController:self];

      v24 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      [v24 setDelegate:self];

      v25 = objc_alloc_init(BKUICurvesView);
      mesaFirstEnrollView = self->_mesaFirstEnrollView;
      self->_mesaFirstEnrollView = v25;

      [(BKUICurvesView *)self->_mesaFirstEnrollView setTranslatesAutoresizingMaskIntoConstraints:0];
      v27 = objc_alloc_init(BKUICurvesView);
      mesaSecondEnrollView = self->_mesaSecondEnrollView;
      self->_mesaSecondEnrollView = v27;

      [(BKUICurvesView *)self->_mesaSecondEnrollView setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      v30 = self->_mesaFirstEnrollView;
      v31 = [MEMORY[0x1E4F428B8] colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
      [(BKUICurvesView *)v30 loadDataFromXML:v29 name:@"drawing" color:v31];

      [(BKUICurvesView *)self->_mesaFirstEnrollView setSpeed:&unk_1F40949C8];
      v32 = self->_mesaSecondEnrollView;
      v33 = [MEMORY[0x1E4F428B8] colorWithRed:0.8 green:0.8 blue:0.8 alpha:1.0];
      v107 = (void *)v29;
      [(BKUICurvesView *)v32 loadDataFromXML:v29 name:@"extended" color:v33];

      [(BKUICurvesView *)self->_mesaSecondEnrollView setSpeed:&unk_1F40949C8];
      v34 = [BKUIFingerPrintEnrollmentPhaseViewController alloc];
      BOOL v35 = self->_inBuddy;
      BOOL v36 = [(BKUIFingerprintEnrollViewController *)self _shouldHideUnlockMessage];
      BOOL v37 = [(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell];
      v38 = [(BKUIFingerprintEnrollViewController *)self _placeFingerString];
      id v39 = [(BKUIFingerPrintEnrollmentPhaseViewController *)v34 initInBuddy:v35 hideUnlockMessage:v36 showFollowUpSell:v37 headerTitle:v38 firstEnrollView:self->_mesaFirstEnrollView secondEnrollView:self->_mesaSecondEnrollView];
      [(BKUIFingerprintEnrollViewController *)self setEnrollmentControlller:v39];

      BOOL v40 = [(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell];
      v41 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      [v41 setShouldShowFollowupFingerEnrollmentUpSell:v40];

      v42 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v43 = [v42 view];
      [v43 setTranslatesAutoresizingMaskIntoConstraints:0];

      v44 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      [(BKUIFingerprintEnrollViewController *)self addChildViewController:v44];

      v45 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      id v46 = [v45 view];
      v47 = [(BKUIFingerprintEnrollViewController *)self view];
      [v47 bounds];
      objc_msgSend(v46, "setFrame:");

      v48 = [(BKUIFingerprintEnrollViewController *)self view];
      v49 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v50 = [v49 view];
      [v48 addSubview:v50];

      v51 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      [v51 didMoveToParentViewController:self];

      v52 = [(BKUIFingerprintEnrollViewController *)self view];
      v53 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v54 = [v53 view];
      [v52 bringSubviewToFront:v54];

      v55 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      [v55 setDelegate:self];

      v86 = (void *)MEMORY[0x1E4F28DC8];
      v106 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v105 = [v106 view];
      v103 = [v105 leadingAnchor];
      v104 = [(BKUIFingerprintEnrollViewController *)self view];
      v102 = [v104 leadingAnchor];
      v101 = [v103 constraintEqualToAnchor:v102];
      v108[0] = v101;
      v100 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v99 = [v100 view];
      v97 = [v99 trailingAnchor];
      v98 = [(BKUIFingerprintEnrollViewController *)self view];
      v96 = [v98 trailingAnchor];
      v95 = [v97 constraintEqualToAnchor:v96];
      v108[1] = v95;
      v94 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v93 = [v94 view];
      v91 = [v93 topAnchor];
      v92 = [(BKUIFingerprintEnrollViewController *)self view];
      v90 = [v92 topAnchor];
      v89 = [v91 constraintEqualToAnchor:v90];
      v108[2] = v89;
      v88 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v87 = [v88 view];
      v84 = [v87 bottomAnchor];
      v85 = [(BKUIFingerprintEnrollViewController *)self view];
      v83 = [v85 bottomAnchor];
      v82 = [v84 constraintEqualToAnchor:v83];
      v108[3] = v82;
      v81 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v80 = [v81 view];
      v78 = [v80 leadingAnchor];
      v79 = [(BKUIFingerprintEnrollViewController *)self view];
      v77 = [v79 leadingAnchor];
      v76 = [v78 constraintEqualToAnchor:v77];
      v108[4] = v76;
      v75 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v74 = [v75 view];
      v72 = [v74 trailingAnchor];
      v73 = [(BKUIFingerprintEnrollViewController *)self view];
      v71 = [v73 trailingAnchor];
      v70 = [v72 constraintEqualToAnchor:v71];
      v108[5] = v70;
      v69 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v68 = [v69 view];
      v66 = [v68 topAnchor];
      v67 = [(BKUIFingerprintEnrollViewController *)self view];
      v56 = [v67 topAnchor];
      v57 = [v66 constraintEqualToAnchor:v56];
      v108[6] = v57;
      v58 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v59 = [v58 view];
      v60 = [v59 bottomAnchor];
      v61 = [(BKUIFingerprintEnrollViewController *)self view];
      v62 = [v61 bottomAnchor];
      v63 = [v60 constraintEqualToAnchor:v62];
      v108[7] = v63;
      v64 = [MEMORY[0x1E4F1C978] arrayWithObjects:v108 count:8];
      [v86 activateConstraints:v64];

      [(BKUIFingerprintEnrollViewController *)self constructAlertView];
      if (self->_alertHudView)
      {
        v65 = [(BKUIFingerprintEnrollViewController *)self view];
        [v65 bringSubviewToFront:self->_alertHudView];
      }
    }
  }
}

- (void)viewDidLoad
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  v25.receiver = self;
  v25.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIFingerprintEnrollViewController *)&v25 viewDidLoad];
  objc_super v3 = [MEMORY[0x1E4F50518] availableDevices];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v21 objects:v28 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    float v7 = 0;
    uint64_t v8 = *(void *)v22;
    *(void *)&long long v5 = 138412290;
    long long v19 = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        double v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v10, "type", v19) == 1)
        {
          id v20 = v7;
          id v11 = [MEMORY[0x1E4F50500] deviceWithDescriptor:v10 error:&v20];
          id v12 = v20;

          bkDevice = self->_bkDevice;
          self->_bkDevice = v11;

          if (v12)
          {
            bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
            if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v19;
              id v27 = v12;
              _os_log_fault_impl(&dword_1E4B6C000, bkui_biometric_kit_delegate_log, OS_LOG_TYPE_FAULT, "BKDevice failed to create. Error: %@", buf, 0xCu);
            }
            float v7 = v12;
          }
          else
          {
            float v7 = 0;
          }
        }
      }
      uint64_t v6 = [v3 countByEnumeratingWithState:&v21 objects:v28 count:16];
    }
    while (v6);
  }
  else
  {
    float v7 = 0;
  }
  +[BKUIBundleSettings setDefaultSettingsValues];
  v15 = [(BiometricKitUIEnrollViewController *)self propertyForKey:@"IN_BUDDY"];
  self->_BOOL inBuddy = [v15 BOOLValue];

  if (!+[BKUIBundleSettings BOOLForUserDefaultsKey:@"hideEnrollTapScreenMessage"])
  {
    v16 = [(BKUIFingerprintEnrollViewController *)self view];
    [(BKUIFingerprintEnrollViewController *)self _setTapRecognizer:v16];
  }
  v17 = [(BKUIFingerprintEnrollViewController *)self navigationItem];
  [v17 setRightBarButtonItem:0];

  self->_mesaEnrollCompactContainer = 0;
  self->_displayingFirstTitle = 1;
  self->_cancelForRestart = 0;
  v18 = [[BioStreamsEventHelper alloc] initWithBKDeviceType:1 inBuddy:self->_inBuddy];
  [(BKUIFingerprintEnrollViewController *)self setBioStreamEventHelper:v18];
}

- (void)respondToTapGesture:(id)a3
{
  id v17 = a3;
  if (!self->_enrollInProgress && !self->_matchInProgress
    || ![(BKUIAlertView *)self->_alertView isAlertHidden])
  {
    goto LABEL_11;
  }
  BOOL enrollmentPhaseTwo = self->_enrollmentPhaseTwo;
  if (self->_enrollmentPhaseTwo)
  {
    objc_super v3 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    uint64_t v4 = [v3 view];
    if (![v4 isHidden]) {
      goto LABEL_10;
    }
  }
  float v7 = [v17 view];
  [v17 locationInView:v7];
  double v9 = v8;
  double v10 = [(BKUIFingerprintEnrollViewController *)self view];
  [v10 frame];
  double v12 = v11 - (double)self->_ignoreTouchOffset;

  if (enrollmentPhaseTwo)
  {
  }
  if (v9 < v12)
  {
    alertView = self->_alertView;
    objc_super v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [v3 localizedStringForKey:@"SET_UP_MESA" value:&stru_1F4081468 table:@"BiometricKitUI"];
    v14 = [(BKUIFingerprintEnrollViewController *)self _deviceAwareLocalizedStringForKey:@"TOUCH_AND_COVER"];
    v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v16 = [v15 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [(BKUIAlertView *)alertView show:v4 message:v14 cancelButtonTitle:v16 viewController:self];

LABEL_10:
  }
LABEL_11:
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  self->_didDisappear = 0;
  [(BKUIFingerprintEnrollViewController *)self createEnrollUI];
  long long v5 = [(BiometricKitUIEnrollViewController *)self propertyForKey:@"userid"];

  if (v5)
  {
    uint64_t v6 = [(BiometricKitUIEnrollViewController *)self propertyForKey:@"userid"];
    self->_unsigned int userid = [v6 unsignedIntegerValue];

    bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
    if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int userid = self->_userid;
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = userid;
      double v9 = "BiometricKitUI: Custom userid is set to %d";
LABEL_6:
      _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, v9, buf, 8u);
    }
  }
  else
  {
    self->_unsigned int userid = getuid();
    bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
    if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v10 = self->_userid;
      *(_DWORD *)buf = 67109120;
      unsigned int v14 = v10;
      double v9 = "BiometricKitUI: Default user is set to %d";
      goto LABEL_6;
    }
  }
  v12.receiver = self;
  v12.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIFingerprintEnrollViewController *)&v12 viewWillAppear:v3];
  double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 addObserver:self selector:sel_applicationWillResignActive_ name:*MEMORY[0x1E4F43710] object:0];

  [(BKUIFingerprintEnrollViewController *)self _resetUI];
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIBundleEnrollViewController *)&v7 viewDidAppear:a3];
  if (!self->_enrollInProgress)
  {
    [(BKUIFingerprintEnrollViewController *)self _startEnrollOperation];
    [(BKUIFingerprintEnrollViewController *)self setNeedsStatusBarAppearanceUpdate];
    uint64_t v4 = [(BKUIFingerprintEnrollViewController *)self view];
    long long v5 = [v4 window];
    uint64_t v6 = [v5 windowScene];
    [v6 _setReachabilitySupported:0 forReason:@"BKUI TouchID enrollment"];
  }
}

- (CGSize)preferredContentSize
{
  [MEMORY[0x1E4F83AF8] preferredContentSize];
  result.height = v3;
  result.width = v2;
  return result;
}

- (void)didSelectPrimaryButton:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIFingerprintEnrollViewController *)self tutorialController];

  if (v5 == v4)
  {
    [(BKUIFingerprintEnrollViewController *)self tutorialContinueButtonPressed:self];
  }
  else
  {
    uint64_t v6 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    if ([v6 enrollViewState] == 3)
    {

LABEL_8:
      [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:1];
      [(BKUIFingerprintEnrollViewController *)self _resetUI];
      [(BKUIFingerprintEnrollViewController *)self restartEnroll];
      self->_cancelForRestart = 1;
      return;
    }
    objc_super v7 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    uint64_t v8 = [v7 enrollViewState];

    if (v8 == 4) {
      goto LABEL_8;
    }
    if ([(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell]
      && ([(BKUIFingerprintEnrollViewController *)self enrollmentControlller],
          double v9 = objc_claimAutoreleasedReturnValue(),
          int v10 = [v9 shouldShowFollowupFingerEnrollmentUpSell],
          v9,
          v10))
    {
      [(BKUIFingerprintEnrollViewController *)self showSecondFingerEnrollmentUpSell];
      id v11 = [(BKUIFingerprintEnrollViewController *)self bkIdentity];
      [(BKUIFingerprintEnrollViewController *)self setFirstFollowUpIdentity:v11];
    }
    else
    {
      [(BKUIFingerprintEnrollViewController *)self enrollDoneContinueButtonPressed];
    }
  }
}

- (void)showSecondFingerEnrollmentUpSell
{
  double v3 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  [v3 setIsSecondEnrollment:1];

  id v4 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v4 setShouldShowFollowupFingerEnrollmentUpSell:0];

  id v5 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v5 setIsSecondEnrollment:1];

  uint64_t v6 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  [v6 setEnrollViewState:0];

  [(BKUIFingerprintEnrollViewController *)self _requestNewAuthToken];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke;
  v7[3] = &unk_1E6EA20C0;
  v7[4] = self;
  [(BKUIFingerprintEnrollViewController *)self transitionToTutorialView:1 completion:v7];
}

void __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 1248), OS_LOG_TYPE_DEBUG)) {
    __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke_cold_1();
  }
  double v2 = *(unsigned char **)(a1 + 32);
  if (v2[1120] || v2[1027] || v2[1121])
  {
    v2[1088] = 1;
    [*(id *)(a1 + 32) _stopBiometricOperations];
    double v2 = *(unsigned char **)(a1 + 32);
  }
  [v2 setFingerOn:0];
  [*(id *)(a1 + 32) setWaitForFingerLift:0];
  [*(id *)(a1 + 32) _resetUIWithTransitionToTutorial:0];
  [*(id *)(a1 + 32) _startEnrollOperation];
  double v3 = [*(id *)(a1 + 32) enrollmentControlller];
  [v3 setEnrollViewState:0];
}

- (void)didSelectSecondaryButton:(id)a3
{
  if ([(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell])
  {
    id v4 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    if ([v4 showFollowUpEnrollmentUpSellContent])
    {
      id v5 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      int v6 = [v5 isSecondEnrollment];

      if (v6)
      {
        [(BKUIFingerprintEnrollViewController *)self enrollDoneContinueButtonPressed];
        return;
      }
    }
    else
    {
    }
  }

  [(BKUIFingerprintEnrollViewController *)self tutorialSkipButtonPressed:self];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIBundleEnrollViewController *)&v7 viewWillDisappear:a3];
  id v4 = [(BKUIFingerprintEnrollViewController *)self view];
  id v5 = [v4 window];
  int v6 = [v5 windowScene];
  [v6 _setReachabilitySupported:1 forReason:@"BKUI TouchID enrollment done."];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  self->_didDisappear = 1;
  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:*MEMORY[0x1E4F43660] object:0];

  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showLiftYourFinger object:0];
  }
  [(BKUIFingerprintEnrollViewController *)self _stopBiometricOperations];
  v13.receiver = self;
  v13.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIFingerprintEnrollViewController *)&v13 viewDidDisappear:v3];
  int v6 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  objc_super v7 = [v6 view];
  [v7 setHidden:1];

  uint64_t v8 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  double v9 = [v8 view];
  [v9 setNeedsLayout];

  int v10 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  id v11 = [v10 view];
  [v11 layoutIfNeeded];

  objc_super v12 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v12 removeTouchIndicator];

  [(BKUIFingerprintEnrollViewController *)self setNeedsStatusBarAppearanceUpdate];
}

- (void)applicationWillResignActive:(id)a3
{
  id v4 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController applicationWillResignActive:]();
  }
  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showLiftYourFinger object:0];
  }
  [(BKUIFingerprintEnrollViewController *)self _stopBiometricOperations];
  if (self->_bkIdentity)
  {
    id v5 = [(BKUIFingerprintEnrollViewController *)self bkDevice];
    bkIdentity = self->_bkIdentity;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke;
    v11[3] = &unk_1E6EA26A8;
    v11[4] = self;
    [v5 removeIdentity:bkIdentity reply:v11];
  }
  objc_super v7 = [(BKUIFingerprintEnrollViewController *)self firstFollowUpIdentity];

  if (v7)
  {
    uint64_t v8 = [(BKUIFingerprintEnrollViewController *)self bkDevice];
    double v9 = [(BKUIFingerprintEnrollViewController *)self firstFollowUpIdentity];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_99;
    v10[3] = &unk_1E6EA26A8;
    v10[4] = self;
    [v8 removeIdentity:v9 reply:v10];
  }
}

void __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = *(NSObject **)(*(void *)(a1 + 32) + 1248);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_cold_1(v6);
    }
  }
}

void __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_99(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    int v6 = *(NSObject **)(*(void *)(a1 + 32) + 1248);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_cold_1(v6);
    }
  }
}

- (void)_stopBiometricOperations
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Stopping Biometric Operations", v2, v3, v4, v5, v6);
}

- (void)enrollProgress:(id)a3
{
  id v4 = a3;
  bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
  if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController enrollProgress:](bkui_biometric_kit_delegate_log, v4);
  }
  if (self->_didDisappear || [v4 progress] > 254) {
    goto LABEL_20;
  }
  if ([v4 message] == 1)
  {
    uint8_t v6 = [v4 messageDetails];
    objc_super v7 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F50550]];
    if ([v7 integerValue])
    {
      BOOL v8 = +[BKUIBundleSettings BOOLForUserDefaultsKey:@"hideEnrollNewComponentMessage"];

      if (!v8)
      {
        int v9 = self->_movedFingerCount + 1;
        self->_movedFingerCount = v9;
        if (v9 == self->_movedFingerThr)
        {
          self->_movedFingerCount = 0;
          if (!self->_movedFingerAlertShown)
          {
            if ([(BKUIAlertView *)self->_alertView isAlertHidden])
            {
              self->_movedFingerAlertShown = 1;
              alertView = self->_alertView;
              id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              objc_super v12 = [v11 localizedStringForKey:@"FINGER_MOVED" value:&stru_1F4081468 table:@"BiometricKitUI"];
              objc_super v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              unsigned int v14 = v13;
              uint64_t v15 = @"DONT_MOVE_MUCH";
LABEL_18:
              id v17 = [v13 localizedStringForKey:v15 value:&stru_1F4081468 table:@"BiometricKitUI"];
              v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              long long v19 = [v18 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI"];
              [(BKUIAlertView *)alertView show:v12 message:v17 cancelButtonTitle:v19 viewController:self];

              goto LABEL_19;
            }
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  self->_movedFingerCount = 0;
  id v11 = [v4 messageDetails];
  objc_super v12 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F50558]];
  if ([v12 integerValue] != 1)
  {
LABEL_19:

    goto LABEL_20;
  }
  BOOL v16 = +[BKUIBundleSettings BOOLForUserDefaultsKey:@"hideEnrollStillFingerMessage"];

  if (!v16 && !self->_stillFingerAlertShown && [(BKUIAlertView *)self->_alertView isAlertHidden])
  {
    self->_stillFingerAlertShown = 1;
    alertView = self->_alertView;
    id v11 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v12 = [v11 localizedStringForKey:@"MOVE_FINGER_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI"];
    objc_super v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unsigned int v14 = v13;
    uint64_t v15 = @"MOVE_FINGER";
    goto LABEL_18;
  }
LABEL_20:
  [(BKUIFingerprintEnrollViewController *)self _enrollHapticFeedback:v4];
}

- (void)_enrollHapticFeedback:(id)a3
{
  id v4 = a3;
  if (!+[BKUIBundleSettings isFpEnrollHapticFeedbackDisabled])
  {
    unsigned int v3 = [v4 message];
    if (v3 <= 3) {
      +[BKUIUtils vibrateForBiometricEvent:(0xEu >> (v3 & 0xF)) & 1];
    }
  }
}

- (void)_hapticFeedback:(BOOL)a3
{
  BOOL v3 = a3;
  if (!+[BKUIBundleSettings isFpEnrollHapticFeedbackDisabled])
  {
    +[BKUIUtils vibrateForBiometricEvent:v3];
  }
}

- (void)animationDidStop:(id)a3 finished:(BOOL)a4
{
  self->_displayingFirstTitle ^= 1u;
}

- (void)statusMessage:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  unint64_t v6 = [v5 enrollViewState];

  if (v6 > 1) {
    return;
  }
  bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
  if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_INFO))
  {
    BOOL v8 = bkui_biometric_kit_delegate_log;
    int v9 = +[BKUIUtils nameForMessage:v3];
    *(_DWORD *)buf = 67109378;
    int v35 = v3;
    __int16 v36 = 2112;
    BOOL v37 = v9;
    _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_INFO, "BiometricKitUI: statusMessage = %3d (%@)", buf, 0x12u);
  }
  if (v3 == 64 && self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showLiftYourFinger object:0];
LABEL_8:
    [(BKUIFingerprintEnrollViewController *)self setFingerOn:0];
    [(BKUIFingerprintEnrollViewController *)self setWaitForFingerLift:0];
    goto LABEL_9;
  }
  if (v3 == 64) {
    goto LABEL_8;
  }
  if (v3 == 63) {
    [(BKUIFingerprintEnrollViewController *)self setFingerOn:1];
  }
LABEL_9:
  +[BKUIUtils resetScreenDimming];
  if (self->_waitInProgress)
  {
    if (v3 == 63)
    {
      int v10 = [MEMORY[0x1E4F1C9C8] date];
      [v10 timeIntervalSinceDate:self->_enrollmentEndTime];
      double v12 = v11;

      if (v12 > 1.5)
      {
        [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
        [(BKUIFingerprintEnrollViewController *)self _sendEnrollResult:4 identity:0];
      }
    }
    return;
  }
  if (v3 == 90 && self->_cancelForRestart)
  {
    self->_cancelForRestart = 0;
    if (!self->_enrollmentPhaseTwo)
    {
      v31.receiver = self;
      v31.super_class = (Class)BKUIFingerprintEnrollViewController;
      [(BKUIBundleEnrollViewController *)&v31 statusMessage:90];
LABEL_17:
      -[BKUIBundleEnrollViewController afterStatusMessage:](&v30, sel_afterStatusMessage_, v3, self, BKUIFingerprintEnrollViewController);
      return;
    }
LABEL_21:
    objc_super v13 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    unsigned int v14 = [v13 view];
    int v15 = [v14 isHidden];

    if (v15)
    {
      v33.receiver = self;
      v33.super_class = (Class)BKUIFingerprintEnrollViewController;
      [(BKUIBundleEnrollViewController *)&v33 statusMessage:v3];
      if ((int)v3 <= 67)
      {
        switch(v3)
        {
          case '3':
            [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
            v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            long long v19 = v18;
            id v20 = @"ENROLL_FAILED";
LABEL_47:
            long long v21 = [v18 localizedStringForKey:v20 value:&stru_1F4081468 table:@"BiometricKitUI"];
            long long v22 = self;
            uint64_t v23 = 2;
LABEL_48:
            [(BKUIFingerprintEnrollViewController *)v22 _failEnrollment:v23 withMessage:v21];

            break;
          case '?':
            *(float *)&double v16 = 1.0 / (float)self->_mesaEnrollSecondPhaseSteps;
            [(BKUICurvesView *)self->_mesaSecondEnrollView estimateProgress:v16];
            break;
          case '@':
            [(BKUIFingerprintEnrollViewController *)self initPromptMessage];
            break;
        }
      }
      else
      {
        switch((int)v3)
        {
          case 'J':
            [(BKUIFingerprintEnrollViewController *)self _showLiftYourFingerWithDelay];
            break;
          case 'K':
          case 'L':
          case 'M':
          case 'O':
          case 'Q':
          case 'R':
          case 'S':
          case 'T':
          case 'Y':
          case 'Z':
          case '[':
          case '\\':
            break;
          case 'N':
          case 'U':
          case 'V':
          case 'W':
          case 'X':
            goto LABEL_24;
          case 'P':
            if (self->_cancelForRestart)
            {
              self->_cancelForRestart = 0;
              break;
            }
            [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
            long long v19 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
            long long v21 = [v19 localizedStringForKey:@"CANCELED" value:&stru_1F4081468 table:@"BiometricKitUI"];
            long long v22 = self;
            uint64_t v23 = 3;
            goto LABEL_48;
          case ']':
            [(BKUIFingerprintEnrollViewController *)self _showDirtOnSensorAlertView];
            break;
          default:
            if (v3 == 68)
            {
              [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
              v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              long long v19 = v18;
              id v20 = @"TIMEOUT";
              goto LABEL_47;
            }
            if (v3 == 98) {
LABEL_24:
            }
              [(BKUICurvesView *)self->_mesaSecondEnrollView estimateFailed];
            break;
        }
      }
      v32.receiver = self;
      v32.super_class = (Class)BKUIFingerprintEnrollViewController;
      -[BKUIBundleEnrollViewController afterStatusMessage:](&v32, sel_afterStatusMessage_, v3, v30.receiver, v30.super_class);
    }
    return;
  }
  if (self->_enrollmentPhaseTwo) {
    goto LABEL_21;
  }
  if (v3 < 0x64)
  {
    v31.receiver = self;
    v31.super_class = (Class)BKUIFingerprintEnrollViewController;
    [(BKUIBundleEnrollViewController *)&v31 statusMessage:v3];
    switch((int)v3)
    {
      case '?':
        if (!self->_cancelForRestart)
        {
          [(BKUIFingerprintEnrollViewController *)self _stopTutorialTransitionToEnrollView];
          LODWORD(v17) = 1039516303;
          [(BKUICurvesView *)self->_mesaFirstEnrollView estimateProgress:v17];
        }
        goto LABEL_17;
      case '@':
        if (self->_smallCoverageMessage)
        {
          self->_smallCoverageMessage = 0;
          self->_smallCoverageInRowCount = 0;
        }
        [(BKUIFingerprintEnrollViewController *)self initPromptMessage];
        goto LABEL_17;
      case 'A':
      case 'E':
      case 'F':
      case 'G':
      case 'H':
      case 'I':
      case 'K':
      case 'L':
      case 'M':
        goto LABEL_17;
      case 'B':
        if (self->_cancelForRestart)
        {
          self->_cancelForRestart = 0;
        }
        else
        {
          [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
          long long v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          objc_super v25 = [v24 localizedStringForKey:@"CANCELED" value:&stru_1F4081468 table:@"BiometricKitUI"];
          v26 = self;
          uint64_t v27 = 3;
LABEL_67:
          [(BKUIFingerprintEnrollViewController *)v26 _failEnrollment:v27 withMessage:v25];
        }
        return;
      case 'C':
        [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
        long long v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        objc_super v25 = [v24 localizedStringForKey:@"ENROLL_FAILED" value:&stru_1F4081468 table:@"BiometricKitUI"];
        v26 = self;
        uint64_t v27 = 2;
        goto LABEL_67;
      case 'D':
        [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
        long long v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        objc_super v25 = [v24 localizedStringForKey:@"TIMEOUT" value:&stru_1F4081468 table:@"BiometricKitUI"];
        v26 = self;
        uint64_t v27 = 6;
        goto LABEL_67;
      case 'J':
        [(BKUIFingerprintEnrollViewController *)self _showLiftYourFingerWithDelay];
        goto LABEL_17;
      case 'N':
        goto LABEL_39;
      default:
        if ((v3 - 85) > 0xD) {
          goto LABEL_17;
        }
        if (((1 << (v3 - 85)) & 0x200D) != 0) {
          goto LABEL_39;
        }
        if (v3 == 86)
        {
          if (self->_smallCoverageMessage)
          {
            int64_t v28 = self->_smallCoverageInRowCount + 1;
            self->_smallCoverageInRowCount = v28;
            if (v28 == 5)
            {
              self->_smallCoverageInRowCount = 0;
              self->_smallCoverageCount = 0;
              [(BKUIFingerprintEnrollViewController *)self _showSmallCoverageAlertView];
            }
          }
          else
          {
            self->_smallCoverageMessage = 1;
            self->_smallCoverageInRowCount = 1;
            int64_t v29 = self->_smallCoverageCount + 1;
            self->_smallCoverageCount = v29;
            if (v29 == self->_maxSmallCoverageCount)
            {
              self->_smallCoverageCount = 0;
              [(BKUIFingerprintEnrollViewController *)self _showSmallCoverageAlertView];
            }
LABEL_39:
            [(BKUICurvesView *)self->_mesaFirstEnrollView estimateFailed];
          }
        }
        else if (v3 == 93)
        {
          [(BKUIFingerprintEnrollViewController *)self _showDirtOnSensorAlertView];
        }
        goto LABEL_17;
    }
  }
  [(BKUIFingerprintEnrollViewController *)self handleProgress:v3];
}

- (void)_showDirtOnSensorAlertView
{
  if (!self->_didDisappear && [(BKUIAlertView *)self->_alertView isAlertHidden])
  {
    alertView = self->_alertView;
    id v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v4 = [v8 localizedStringForKey:@"DIRT_ON_SENSOR_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI"];
    uint64_t v5 = [(BKUIFingerprintEnrollViewController *)self _deviceAwareLocalizedStringForKey:@"DIRT_ON_SENSOR"];
    unint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    objc_super v7 = [v6 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [(BKUIAlertView *)alertView show:v4 message:v5 cancelButtonTitle:v7 viewController:self];
  }
}

- (void)_showSmallCoverageAlertView
{
  if (!self->_didDisappear && [(BKUIAlertView *)self->_alertView isAlertHidden])
  {
    alertView = self->_alertView;
    id v7 = [(BKUIFingerprintEnrollViewController *)self _deviceAwareLocalizedStringForKey:@"COVER_SENSOR_TITLE"];
    id v4 = [(BKUIFingerprintEnrollViewController *)self _deviceAwareLocalizedStringForKey:@"COVER_SENSOR"];
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    unint64_t v6 = [v5 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI"];
    [(BKUIAlertView *)alertView show:v7 message:v4 cancelButtonTitle:v6 viewController:self];
  }
}

- (void)handleProgress:(unsigned int)a3
{
  float v4 = (double)(a3 - 100) / 255.0;
  if (v4 == 1.0)
  {
    self->_float currentProgress = 1.0;
  }
  else
  {
    float v5 = (1.0 - self->_currentProgress) / (v4 * -8.0 + 10.0) + self->_currentProgress;
    self->_float currentProgress = v5;
  }
  id v7 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  *(float *)&double v6 = self->_currentProgress;
  [v7 setEnrollProgress:self->_mesaFirstEnrollView enrollView:v6];
}

- (void)_cancelEnrollmentAndRestart:(BOOL)a3
{
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController _cancelEnrollmentAndRestart:](a3, bkui_fingerprint_enroll_view_controller_log);
  }
  [(BKUIFingerprintEnrollViewController *)self _stopMessageTimer];
  if (self->_enrollInProgress)
  {
    [(BKEnrollTouchIDOperation *)self->_bkEnroll cancel];
    self->_enrollInProgress = 0;
  }
  self->_restartRequest = a3;
}

- (void)_restartEnrollment
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Restarting enrollment", v2, v3, v4, v5, v6);
}

- (void)_setTapRecognizer:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F42EC8];
  id v5 = a3;
  id v6 = (id)[[v4 alloc] initWithTarget:self action:sel_respondToTapGesture_];
  [v6 setNumberOfTapsRequired:1];
  [v5 addGestureRecognizer:v6];
}

- (void)_startTutorial:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController _startTutorial:]();
  }
  BOOL enrollmentPhaseTwo = self->_enrollmentPhaseTwo;
  id v6 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  [v6 setEnrollViewState:enrollmentPhaseTwo];

  [(BKUIFingerprintEnrollViewController *)self _transitionToTutorialView:v3];
}

- (void)enrollDoneContinueButtonPressed
{
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Continue Button Pressed", v4, 2u);
  }
  if (self->_waitInProgress) {
    [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_restartEnroll object:0];
  [(BKUIFingerprintEnrollViewController *)self _sendEnrollResult:4 identity:0];
}

- (void)skipEnrollmentPressed:(id)a3
{
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Skip enrollment pressed", v5, 2u);
  }
  [(BKUIFingerprintEnrollViewController *)self _skipEnrollment];
}

- (void)_skipEnrollment
{
  [(BKUIFingerprintEnrollViewController *)self _sendEnrollResult:3 identity:self->_bkIdentity];
  id v3 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v3 removeTouchIndicator];
}

- (void)restartEnrollPressed:(id)a3
{
  [(BKUIFingerprintEnrollViewController *)self _sendEnrollResult:9 identity:self->_bkIdentity];

  [(BKUIFingerprintEnrollViewController *)self restartEnroll];
}

- (void)_cancelEnrollmentMatch
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Canceling enroll match", v2, v3, v4, v5, v6);
}

- (void)homeButtonPressed
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    BOOL didDisappear = self->_didDisappear;
    alertView = self->_alertView;
    uint8_t v6 = bkui_fingerprint_enroll_view_controller_log;
    LODWORD(alertView) = [(BKUIAlertView *)alertView isAlertHidden];
    id v7 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    id v8 = [v7 view];
    v26[0] = 67109632;
    v26[1] = didDisappear;
    __int16 v27 = 1024;
    int v28 = (int)alertView;
    __int16 v29 = 1024;
    int v30 = [v8 isHidden];
    _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: WillDisappear %d, alerthidden %d, tutorialhidden %d", (uint8_t *)v26, 0x14u);
  }
  if (self->_inBuddy && [(BKUIFingerprintEnrollViewController *)self _topTouchButtonIpad])
  {
    int v9 = [(BKUIFingerprintEnrollViewController *)self menuAction];

    if (v9)
    {
      int v10 = [(BKUIFingerprintEnrollViewController *)self menuAction];
      v10[2]();
LABEL_7:
    }
  }
  else if (!self->_didDisappear)
  {
    if ([(BKUIAlertView *)self->_alertView isAlertHidden])
    {
      double v11 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      double v12 = [v11 view];
      int v13 = [v12 isHidden];

      if (v13)
      {
        int v14 = MGGetBoolAnswer();
        int v15 = self->_alertView;
        double v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        int v10 = v16;
        if (v14)
        {
          double v17 = [v16 localizedStringForKey:@"TOUCH_LIGHT" value:&stru_1F4081468 table:@"BiometricKitUI-SSHB"];
          v18 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          long long v19 = [v18 localizedStringForKey:@"LESS_FORCE" value:&stru_1F4081468 table:@"BiometricKitUI-SSHB"];
          id v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          long long v21 = [v20 localizedStringForKey:@"CONTINUE" value:&stru_1F4081468 table:@"BiometricKitUI"];
          [(BKUIAlertView *)v15 show:v17 message:v19 cancelButtonTitle:v21 viewController:self];
        }
        else
        {
          long long v22 = [v16 localizedStringForKey:@"YOU_CLICKED" value:&stru_1F4081468 table:@"BiometricKitUI"];
          uint64_t v23 = [(BKUIFingerprintEnrollViewController *)self _deviceAwareLocalizedStringForKey:@"REST_NOT_CLICK"];
          long long v24 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          objc_super v25 = [v24 localizedStringForKey:@"CONTINUE" value:&stru_1F4081468 table:@"BiometricKitUI"];
          [(BKUIAlertView *)v15 show:v22 message:v23 cancelButtonTitle:v25 viewController:self];
        }
        goto LABEL_7;
      }
    }
  }
}

- (void)_cancelActiveEnrollOperation
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Canceling active enroll operation", v2, v3, v4, v5, v6);
}

- (void)restartEnroll
{
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Restarting enroll", v4, 2u);
  }
  [(BKUIFingerprintEnrollViewController *)self _restartEnrollment];
  if (self->_enrollInProgress) {
    [(BKUIFingerprintEnrollViewController *)self _startInitialTutorialAnimated:1];
  }
}

- (void)cancelEnroll
{
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Canceling enroll", v4, 2u);
  }
  [(BKUIFingerprintEnrollViewController *)self _cancelActiveEnrollOperation];
}

- (id)bundleAlertView
{
  return self->_alertView;
}

- (void)_showLiftYourFingerWithDelay
{
  self->_showLiftYourFingerMsg = 1;
  [(BKUIFingerprintEnrollViewController *)self performSelector:sel__showLiftYourFinger withObject:0 afterDelay:self->_liftFingerMsgDelay];
}

- (void)_showLiftYourFinger
{
  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    id v3 = [(BKUIFingerprintEnrollViewController *)self _liftFingerString];
    [(BKUIFingerprintEnrollViewController *)self _animateHeaderTitle:v3];
  }
}

- (void)_startInitialTutorialAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController _startInitialTutorialAnimated:]();
  }
  uint64_t v5 = [(BKUIFingerprintEnrollViewController *)self bkDevice];

  if (v5)
  {
    if ([(BKUIFingerprintEnrollViewController *)self _bkDeviceIdentityCount])
    {
      uint8_t v6 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      id v7 = [v6 view];
      char v8 = [v7 isHidden];

      if ((v8 & 1) == 0) {
        [(BKUIFingerprintEnrollViewController *)self _transitionToEnrollView:v3];
      }
    }
    else
    {
      [(BKUIFingerprintEnrollViewController *)self _startTutorial:v3];
    }
  }
}

- (id)_subtitleFont
{
  BOOL v3 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v4 = [v3 userInterfaceIdiom];

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F42A30];
    if (self->_inBuddy)
    {
      double v6 = 20.0;
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F42A30];
  }
  double v6 = 18.0;
LABEL_6:
  id v7 = [v5 systemFontOfSize:v6];

  return v7;
}

- (void)_showSkipEnrollmentAlert
{
  self->_cancelForRestart = 1;
  [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
  long long v19 = (void *)MGCopyAnswer();
  BOOL v3 = (void *)MEMORY[0x1E4F42728];
  uint64_t v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v5 = [v4 localizedStringForKey:@"SKIP_ENROLLMENT_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI"];
  double v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v7 = [v19 uppercaseString];
  char v8 = [@"SKIP_ENROLLMENT_DESCRIPTION_" stringByAppendingString:v7];
  int v9 = [v6 localizedStringForKey:v8 value:&stru_1F4081468 table:@"BiometricKitUI"];
  int v10 = [v3 alertControllerWithTitle:v5 message:v9 preferredStyle:1];

  double v11 = (void *)MEMORY[0x1E4F42720];
  double v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v13 = [v12 localizedStringForKey:@"DONT_USE" value:&stru_1F4081468 table:@"BiometricKitUI"];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke;
  v21[3] = &unk_1E6EA21F8;
  v21[4] = self;
  int v14 = [v11 actionWithTitle:v13 style:0 handler:v21];

  int v15 = (void *)MEMORY[0x1E4F42720];
  double v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  double v17 = [v16 localizedStringForKey:@"SET_UP_TOUCH_ID" value:&stru_1F4081468 table:@"BiometricKitUI"];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke_2;
  v20[3] = &unk_1E6EA21F8;
  v20[4] = self;
  v18 = [v15 actionWithTitle:v17 style:0 handler:v20];

  [v10 addAction:v14];
  [v10 addAction:v18];
  [v10 setPreferredAction:v18];
  [(BKUIFingerprintEnrollViewController *)self presentViewController:v10 animated:1 completion:0];
}

uint64_t __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _skipEnrollment];
}

void __63__BKUIFingerprintEnrollViewController__showSkipEnrollmentAlert__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) _requestNewAuthToken];
  [*(id *)(a1 + 32) _startEnrollOperation];
  id v2 = [*(id *)(a1 + 32) enrollmentControlller];
  [v2 setEnrollViewState:0];
}

- (void)_sendEnrollResult:(int)a3 identity:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  bkui_result_delegate_log = self->bkui_result_delegate_log;
  if (os_log_type_enabled(bkui_result_delegate_log, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109378;
    v13[1] = v4;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1E4B6C000, bkui_result_delegate_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Sending Enroll Result Delegate: \"%i\" with identity: \"%@\"", (uint8_t *)v13, 0x12u);
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    char v8 = [(BiometricKitUIEnrollViewController *)self delegate];
    int v9 = v8;
    uint64_t v10 = v4;
    id v11 = v6;
LABEL_5:
    [v8 enrollResult:v10 bkIdentity:v11];

    goto LABEL_7;
  }
  if (!v6)
  {
    double v12 = [(BKUIFingerprintEnrollViewController *)self bkDevice];

    if (v12)
    {
      char v8 = [(BiometricKitUIEnrollViewController *)self delegate];
      int v9 = v8;
      uint64_t v10 = v4;
      id v11 = 0;
      goto LABEL_5;
    }
  }
LABEL_7:
}

- (void)_requestNewAuthToken
{
  BOOL v3 = [(BiometricKitUIEnrollViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(BiometricKitUIEnrollViewController *)self delegate];
    [v5 generateAuthToken];
  }
}

- (void)_startEnrollOperation
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1E4B6C000, v0, v1, "Failed to create BKEnrollOperation Error: %@", v2, v3, v4, v5, v6);
}

- (void)_startExtendEnrollOperation
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_1E4B6C000, v0, v1, "BiometricKitUI: BiometricKit extend enroll failed. Error: %@", v2, v3, v4, v5, v6);
}

- (void)enrollOperation:(id)a3 progressedWithTouchIDInfo:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
  if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = bkui_biometric_kit_delegate_log;
    *(_DWORD *)buf = 134218240;
    uint64_t v25 = [v7 progress];
    __int16 v26 = 1024;
    int v27 = [v7 message];
    _os_log_impl(&dword_1E4B6C000, v9, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Enroll progress: %li and message: %u", buf, 0x12u);
  }
  if (self->_didDisappear || [v7 progress] > 254) {
    goto LABEL_20;
  }
  if ([v7 message] == 1)
  {
    uint64_t v10 = [v7 messageDetails];
    id v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F50550]];
    if ([v11 integerValue])
    {
      BOOL v12 = +[BKUIBundleSettings BOOLForUserDefaultsKey:@"hideEnrollNewComponentMessage"];

      if (!v12)
      {
        int v13 = self->_movedFingerCount + 1;
        self->_movedFingerCount = v13;
        if (v13 == self->_movedFingerThr)
        {
          self->_movedFingerCount = 0;
          if (!self->_movedFingerAlertShown)
          {
            if ([(BKUIAlertView *)self->_alertView isAlertHidden])
            {
              self->_movedFingerAlertShown = 1;
              alertView = self->_alertView;
              __int16 v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              id v15 = [v14 localizedStringForKey:@"FINGER_MOVED" value:&stru_1F4081468 table:@"BiometricKitUI"];
              uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              double v17 = v16;
              v18 = @"DONT_MOVE_MUCH";
LABEL_18:
              id v20 = [v16 localizedStringForKey:v18 value:&stru_1F4081468 table:@"BiometricKitUI"];
              long long v21 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
              long long v22 = [v21 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"BiometricKitUI"];
              [(BKUIAlertView *)alertView show:v15 message:v20 cancelButtonTitle:v22 viewController:self];

              goto LABEL_19;
            }
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
    }
  }
  self->_movedFingerCount = 0;
  __int16 v14 = [v7 messageDetails];
  id v15 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F50558]];
  if ([v15 integerValue] != 1)
  {
LABEL_19:

    goto LABEL_20;
  }
  BOOL v19 = +[BKUIBundleSettings BOOLForUserDefaultsKey:@"hideEnrollStillFingerMessage"];

  if (!v19 && !self->_stillFingerAlertShown && [(BKUIAlertView *)self->_alertView isAlertHidden])
  {
    self->_stillFingerAlertShown = 1;
    alertView = self->_alertView;
    __int16 v14 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v15 = [v14 localizedStringForKey:@"MOVE_FINGER_TITLE" value:&stru_1F4081468 table:@"BiometricKitUI"];
    uint64_t v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    double v17 = v16;
    v18 = @"MOVE_FINGER";
    goto LABEL_18;
  }
LABEL_20:
  [(BKUIFingerprintEnrollViewController *)self _enrollHapticFeedback:v7];
}

- (void)enrollOperation:(id)a3 percentCompleted:(int64_t)a4
{
  self->_bkProgress = a4;
  id v6 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  double v5 = (double)self->_bkProgress / 100.0;
  *(float *)&double v5 = v5;
  [v6 setEnrollProgress:self->_mesaFirstEnrollView enrollView:v5];
}

- (void)enrollOperation:(id)a3 finishedWithIdentity:(id)a4
{
  double v5 = (BKIdentity *)a4;
  self->_enrollInProgress = 0;
  [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
  id v6 = [MEMORY[0x1E4F1C9C8] date];
  enrollmentEndTime = self->_enrollmentEndTime;
  self->_enrollmentEndTime = v6;

  self->_BOOL enrollmentPhaseTwo = 1;
  self->_float currentProgress = 0.0;
  bkIdentity = self->_bkIdentity;
  self->_bkIdentity = v5;
  int v9 = v5;

  [(BKUIAlertView *)self->_alertView hideAnimated:1];
  uint64_t v10 = [(BKUIFingerprintEnrollViewController *)self bioStreamEventHelper];
  [v10 sendSuccessfulEnrollEvent];

  [(BKUIFingerprintEnrollViewController *)self _sendEnrollResult:1 identity:v9];
  [(BKUIFingerprintEnrollViewController *)self _startTutorial:1];
  id v11 = [(BKUIFingerprintEnrollViewController *)self bkDevice];

  if (v11)
  {
    [(BKUIFingerprintEnrollViewController *)self _startExtendEnrollOperation];
  }
}

- (void)enrollOperation:(id)a3 failedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (a4 == 1)
  {
    if (self->_cancelForRestart)
    {
      self->_cancelForRestart = 0;
      goto LABEL_10;
    }
    id v13 = v6;
    [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
    char v8 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v10 = [v8 localizedStringForKey:@"CANCELED" value:&stru_1F4081468 table:@"BiometricKitUI"];
    id v11 = self;
    uint64_t v12 = 3;
  }
  else
  {
    if (a4 == 2)
    {
      id v13 = v6;
      [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
      id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v8 = v7;
      int v9 = @"FAILED";
    }
    else
    {
      if (a4 != 3) {
        goto LABEL_10;
      }
      id v13 = v6;
      [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentAndRestart:0];
      id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      char v8 = v7;
      int v9 = @"TIMEOUT";
    }
    uint64_t v10 = [v7 localizedStringForKey:v9 value:&stru_1F4081468 table:@"BiometricKitUI"];
    id v11 = self;
    uint64_t v12 = 2;
  }
  [(BKUIFingerprintEnrollViewController *)v11 _failEnrollment:v12 withMessage:v10];

  id v6 = v13;
LABEL_10:
}

- (void)fingerprintCaptureOperation:(id)a3 encounteredCaptureError:(int64_t)a4
{
  id v6 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  id v7 = [v6 view];
  int v8 = [v7 isHidden];

  if (v8)
  {
    if (os_log_type_enabled((os_log_t)self->bkui_biometric_kit_delegate_log, OS_LOG_TYPE_ERROR)) {
      -[BKUIFingerprintEnrollViewController fingerprintCaptureOperation:encounteredCaptureError:]();
    }
    switch(a4)
    {
      case 1:
      case 3:
      case 4:
      case 5:
      case 6:
        if (self->_enrollmentPhaseTwo)
        {
          uint64_t v9 = 1152;
          goto LABEL_7;
        }
        [(BKUICurvesView *)self->_mesaFirstEnrollView estimateFailed];
        v12.receiver = self;
        v12.super_class = (Class)BKUIFingerprintEnrollViewController;
        [(BKUIBundleEnrollViewController *)&v12 statusMessage:78];
        break;
      case 2:
        if (self->_smallCoverageMessage)
        {
          int64_t v10 = self->_smallCoverageInRowCount + 1;
          self->_smallCoverageInRowCount = v10;
          if (v10 == 5)
          {
            self->_smallCoverageInRowCount = 0;
            self->_smallCoverageCount = 0;
            [(BKUIFingerprintEnrollViewController *)self _showSmallCoverageAlertView];
          }
        }
        else
        {
          self->_smallCoverageMessage = 1;
          self->_smallCoverageInRowCount = 1;
          int64_t v11 = self->_smallCoverageCount + 1;
          self->_smallCoverageCount = v11;
          if (v11 == self->_maxSmallCoverageCount)
          {
            self->_smallCoverageCount = 0;
            [(BKUIFingerprintEnrollViewController *)self _showSmallCoverageAlertView];
          }
          uint64_t v9 = 1144;
LABEL_7:
          [*(id *)((char *)&self->super.super.super.super.super.isa + v9) estimateFailed];
        }
        break;
      case 7:
        [(BKUIFingerprintEnrollViewController *)self _showDirtOnSensorAlertView];
        break;
      default:
        return;
    }
  }
}

- (void)extendEnroll:(id)a3 hasUpdated:(BOOL)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  id v7 = [v6 view];
  int v8 = [v7 isHidden];

  if (v8)
  {
    [(BKUIFingerprintEnrollViewController *)self _hapticFeedback:1];
    self->_double currentProgress = self->_currentProgress + (float)(1.0 / (float)(self->_mesaEnrollSecondPhaseSteps << !a4));
    bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
    if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_INFO))
    {
      double currentProgress = self->_currentProgress;
      int v14 = 134217984;
      double v15 = currentProgress;
      _os_log_impl(&dword_1E4B6C000, bkui_biometric_kit_delegate_log, OS_LOG_TYPE_INFO, "BiometricKitUI: Extende enroll result current progress: %f", (uint8_t *)&v14, 0xCu);
    }
    float v11 = self->_currentProgress;
    if (v11 > 1.0) {
      float v11 = 1.0;
    }
    self->_double currentProgress = v11;
    objc_super v12 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    *(float *)&double v13 = self->_currentProgress;
    [v12 setEnrollProgress:self->_mesaSecondEnrollView enrollView:v13];

    if (self->_currentProgress == 1.0) {
      [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
    }
  }
}

- (void)operation:(id)a3 finishedWithReason:(int64_t)a4
{
  id v6 = a3;
  if (self->_enrollmentPhaseTwo)
  {
    id v11 = v6;
    self->_showLiftYourFingerMsg = 0;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showLiftYourFinger object:0];
    if ((unint64_t)(a4 - 3) < 2)
    {
      [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
      id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v8 = [v7 localizedStringForKey:@"FAILED" value:&stru_1F4081468 table:@"BiometricKitUI"];
      uint64_t v9 = self;
      uint64_t v10 = 2;
LABEL_4:
      [(BKUIFingerprintEnrollViewController *)v9 _failEnrollment:v10 withMessage:v8];

LABEL_5:
      id v6 = v11;
      goto LABEL_10;
    }
    id v6 = v11;
    if (a4 == 2)
    {
      if (self->_currentProgress >= 1.0)
      {
        [(BKUIFingerprintEnrollViewController *)self _finishEnrollmentPhaseTwo];
        goto LABEL_5;
      }
      if (!self->_cancelForRestart)
      {
        [(BKUIFingerprintEnrollViewController *)self _cancelEnrollmentMatch];
        id v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        int v8 = [v7 localizedStringForKey:@"CANCELED" value:&stru_1F4081468 table:@"BiometricKitUI"];
        uint64_t v9 = self;
        uint64_t v10 = 3;
        goto LABEL_4;
      }
      self->_cancelForRestart = 0;
    }
  }
LABEL_10:
}

- (void)operation:(id)a3 stateChanged:(int64_t)a4
{
  if (a4 == 5)
  {
    [(BKUIFingerprintEnrollViewController *)self _showLiftYourFingerWithDelay];
  }
  else if (a4 == 2 && self->_cancelForRestart)
  {
    self->_cancelForRestart = 0;
  }
}

- (void)operation:(id)a3 presenceStateChanged:(BOOL)a4
{
  BOOL v4 = a4;
  +[BKUIUtils resetScreenDimming];
  if (v4)
  {
    if (self->_enrollmentPhaseTwo)
    {
      id v6 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      id v7 = [v6 view];
      int v8 = [v7 isHidden];

      if (v8)
      {
        mesaSecondEnrollView = self->_mesaSecondEnrollView;
        *(float *)&double v9 = 1.0 / (float)self->_mesaEnrollSecondPhaseSteps;
LABEL_15:
        [(BKUICurvesView *)mesaSecondEnrollView estimateProgress:v9];
        return;
      }
      if (self->_enrollmentPhaseTwo) {
        return;
      }
    }
    if (self->_cancelForRestart) {
      return;
    }
    [(BKUIFingerprintEnrollViewController *)self _stopTutorialTransitionToEnrollView];
    mesaSecondEnrollView = self->_mesaFirstEnrollView;
    LODWORD(v9) = 1039516303;
    goto LABEL_15;
  }
  if (self->_showLiftYourFingerMsg)
  {
    self->_showLiftYourFingerMsg = 0;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__showLiftYourFinger object:0];
  }
  if (self->_enrollmentPhaseTwo)
  {
    id v11 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    objc_super v12 = [v11 view];
    int v13 = [v12 isHidden];

    if (v13)
    {
      [(BKUIFingerprintEnrollViewController *)self initPromptMessage];
      return;
    }
    if (self->_enrollmentPhaseTwo) {
      return;
    }
  }
  if (self->_smallCoverageMessage)
  {
    self->_smallCoverageMessage = 0;
    self->_smallCoverageInRowCount = 0;
  }
  [(BKUIFingerprintEnrollViewController *)self initPromptMessage];
  v14.receiver = self;
  v14.super_class = (Class)BKUIFingerprintEnrollViewController;
  [(BKUIBundleEnrollViewController *)&v14 afterStatusMessage:64];
}

- (void)_resetUI
{
}

- (void)_resetUIWithTransitionToTutorial:(BOOL)a3
{
  BOOL v3 = a3;
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController _resetUIWithTransitionToTutorial:]();
  }
  self->_double currentProgress = 0.0;
  self->_showLiftYourFingerMsg = 0;
  self->_smallCoverageMessage = 0;
  self->_smallCoverageCount = 0;
  self->_smallCoverageInRowCount = 0;
  +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollMsgTransLength"];
  self->_msgTransLength = v5;
  if (v5 <= 0.0)
  {
    [MEMORY[0x1E4F42FD8] defaultDurationForTransition:1];
    self->_msgTransLength = v6;
  }
  +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollMsgShowTimeout"];
  double v8 = v7;
  BOOL v9 = v7 > 0.0;
  double v10 = 0.5;
  if (v9) {
    double v10 = v8;
  }
  self->_msgShowTimeout = v10;
  int64_t v11 = +[BKUIBundleSettings integerForUserDefaultsKey:@"fpEnrollIgnoreTouchOffset"];
  int64_t v12 = 40;
  if (v11) {
    int64_t v12 = v11;
  }
  self->_ignoreTouchOffset = v12;
  int64_t v13 = +[BKUIBundleSettings integerForUserDefaultsKey:@"fpEnrollSecondPhaseSteps"];
  int64_t v14 = 6;
  if (v13) {
    int64_t v14 = v13;
  }
  self->_mesaEnrollSecondPhaseSteps = v14;
  +[BKUIBundleSettings floatForUserDefaultsKey:@"fpEnrollLiftFingerMsgDelay"];
  double v16 = v15;
  BOOL v17 = v15 == 0.0;
  double v18 = 1.5;
  if (!v17) {
    double v18 = v16;
  }
  self->_liftFingerMsgDelay = v18;
  int64_t v19 = +[BKUIBundleSettings integerForUserDefaultsKey:@"fpMaxSmallCoverageCount"];
  if (v19) {
    int64_t v20 = v19;
  }
  else {
    int64_t v20 = 3;
  }
  self->_maxSmallCoverageCount = v20;
  int v21 = +[BKUIBundleSettings integerForUserDefaultsKey:@"fpMovedFingerCount"];
  self->_movedFingerThr = v21;
  if (!v21)
  {
    if (MGGetSInt32Answer() == 2) {
      int v22 = 5;
    }
    else {
      int v22 = 3;
    }
    self->_movedFingerThr = v22;
  }
  uint64_t v23 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v23 setEnrollProgress:self->_mesaSecondEnrollView enrollView:0.0];

  long long v24 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v24 setEnrollProgress:self->_mesaFirstEnrollView enrollView:0.0];

  uint64_t v25 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v25 setEnrollViewState:0];

  __int16 v26 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  [v26 setEnrollViewState:0];

  int v27 = [(BKUIFingerprintEnrollViewController *)self view];
  uint64_t v28 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  __int16 v29 = [v28 view];
  [v27 bringSubviewToFront:v29];

  int v30 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  uint64_t v31 = [v30 view];
  [v31 setHidden:1];

  objc_super v32 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  objc_super v33 = [v32 view];
  [v33 setNeedsLayout];

  v34 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  int v35 = [v34 view];
  [v35 setHidden:0];

  __int16 v36 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  BOOL v37 = [v36 view];
  [v37 setNeedsLayout];

  if (v3) {
    [(BKUIFingerprintEnrollViewController *)self _startInitialTutorialAnimated:0];
  }
  [(BKUIFingerprintEnrollViewController *)self setTitle:&stru_1F4081468];
}

- (void)_finishEnrollmentPhaseTwo
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Finishing enroll phase two", v2, v3, v4, v5, v6);
}

- (void)_failEnrollment:(int)a3 withMessage:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 138412290;
    id v18 = v6;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Finger enroll failed with message: \"%@\"", (uint8_t *)&v17, 0xCu);
  }
  if (!self->_cancelForRestart)
  {
    if (!self->_didDisappear)
    {
      double v8 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      BOOL v9 = [v8 view];
      char v10 = [v9 isHidden];

      if ((v10 & 1) == 0)
      {
        int64_t v11 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
        uint64_t v12 = [v11 enrollViewState];

        if (v12 != 3)
        {
          int64_t v13 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
          [v13 setEnrollViewState:3];
        }
        [(BKUIFingerprintEnrollViewController *)self _transitionToEnrollView:1];
      }
      [(BKUIAlertView *)self->_alertView hideAnimated:1];
      [(BKUIFingerprintEnrollViewController *)self _animateHeaderTitle:v6];
      int64_t v14 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      float v15 = v14;
      if (v4 == 2) {
        uint64_t v16 = 3;
      }
      else {
        uint64_t v16 = 4;
      }
      [v14 setEnrollViewState:v16];
    }
    if (!self->_inBuddy) {
      [(BKUIFingerprintEnrollViewController *)self _sendEnrollResult:v4 identity:self->_bkIdentity];
    }
  }
}

- (BOOL)_useAlertHud
{
  uint64_t v2 = [(BiometricKitUIEnrollViewController *)self propertyForKey:@"BMKUI_ALERT_HUD"];
  BOOL v3 = ([v2 BOOLValue] & 1) != 0
    || +[BKUIBundleSettings BOOLForUserDefaultsKey:@"fpEnrollAlertHud"];

  return v3;
}

- (BOOL)_shouldHideUnlockMessage
{
  uint64_t v2 = [(BiometricKitUIEnrollViewController *)self propertyForKey:@"BMKUI_HIDE_UNLOCK_MSG"];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (unint64_t)_bkIdentityCount
{
  char v3 = [(BKUIFingerprintEnrollViewController *)self bkDevice];
  uint64_t userid = self->_userid;
  id v10 = 0;
  uint64_t v5 = [v3 identitiesForUser:userid error:&v10];
  id v6 = v10;

  if (v6)
  {
    bkui_biometric_kit_delegate_log = self->bkui_biometric_kit_delegate_log;
    if (os_log_type_enabled(bkui_biometric_kit_delegate_log, OS_LOG_TYPE_ERROR)) {
      -[BKUIFingerprintEnrollViewController _bkIdentityCount](bkui_biometric_kit_delegate_log);
    }
  }
  unint64_t v8 = [v5 count];

  return v8;
}

- (unint64_t)_bkDeviceIdentityCount
{
  bkDevice = self->_bkDevice;
  uint64_t userid = self->_userid;
  uint64_t v7 = 0;
  uint64_t v4 = [(BKDeviceTouchID *)bkDevice identitiesForUser:userid error:&v7];
  unint64_t v5 = [v4 count];

  return v5;
}

- (void)_tutorialContinueButtonPressed
{
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Tutor button pressed", v4, 2u);
  }
  [(BKUIFingerprintEnrollViewController *)self _stopTutorialTransitionToEnrollView];
}

- (void)_stopTutorialTransitionToEnrollView
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Stopping tutorial", v2, v3, v4, v5, v6);
}

- (void)transitionToEnrollView:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: transition To Enroll View", buf, 2u);
  }
  uint8_t v6 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  uint64_t v7 = [v6 view];
  char v8 = [v7 isHidden];

  if ((v8 & 1) != 0 || !v3)
  {
    BOOL v9 = [(BKUIFingerprintEnrollViewController *)self view];
    id v10 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    int64_t v11 = [v10 view];
    [v9 bringSubviewToFront:v11];

    uint64_t v12 = [(BKUIFingerprintEnrollViewController *)self view];
    [v12 bounds];
    double v14 = v13;
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;

    int v21 = [MEMORY[0x1E4F42948] currentDevice];
    LODWORD(v10) = objc_msgSend(v21, "bkui_isRTL");

    int v22 = [(BKUIFingerprintEnrollViewController *)self view];
    [v22 bounds];
    double v24 = v23;

    double v25 = -v24;
    if (!v10) {
      double v25 = v24;
    }
    double v26 = v14 + v25;
    int v27 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    uint64_t v28 = [v27 view];
    [v28 setHidden:0];

    __int16 v29 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    int v30 = [v29 view];
    objc_msgSend(v30, "setFrame:", v26, v16, v18, v20);

    uint64_t v31 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    objc_super v32 = [v31 view];
    [v32 setAlpha:1.0];

    objc_super v33 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    v34 = [v33 view];
    [v34 setNeedsLayout];

    int v35 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    __int16 v36 = [v35 view];
    [v36 layoutIfNeeded];

    if (v3)
    {
      v52[0] = MEMORY[0x1E4F143A8];
      v52[1] = 3221225472;
      v52[2] = __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke;
      v52[3] = &unk_1E6EA20C0;
      v52[4] = self;
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke_2;
      v51[3] = &unk_1E6EA2108;
      v51[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v52 animations:v51 completion:0.3];
    }
    else
    {
      BOOL v37 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      uint64_t v38 = [v37 view];
      id v39 = [(BKUIFingerprintEnrollViewController *)self view];
      [v39 bounds];
      objc_msgSend(v38, "setFrame:");

      BOOL v40 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v41 = [v40 view];
      [v41 layoutIfNeeded];

      long long v55 = 0u;
      long long v56 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      v42 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      v43 = [v42 contentView];
      v44 = [v43 subviews];

      uint64_t v45 = [v44 countByEnumeratingWithState:&v53 objects:v58 count:16];
      if (v45)
      {
        uint64_t v46 = v45;
        uint64_t v47 = *(void *)v54;
        do
        {
          for (uint64_t i = 0; i != v46; ++i)
          {
            if (*(void *)v54 != v47) {
              objc_enumerationMutation(v44);
            }
            [*(id *)(*((void *)&v53 + 1) + 8 * i) setHidden:0];
          }
          uint64_t v46 = [v44 countByEnumeratingWithState:&v53 objects:v58 count:16];
        }
        while (v46);
      }

      v49 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v50 = [v49 view];
      [v50 setHidden:1];
    }
  }
}

void __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) enrollmentControlller];
  BOOL v3 = [v2 view];
  uint64_t v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  uint64_t v5 = [*(id *)(a1 + 32) enrollmentControlller];
  uint8_t v6 = [v5 view];
  [v6 layoutIfNeeded];

  id v8 = [*(id *)(a1 + 32) enrollmentControlller];
  uint64_t v7 = [v8 contentView];
  [v7 setHidden:0];
}

void __62__BKUIFingerprintEnrollViewController_transitionToEnrollView___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tutorialController];
  BOOL v3 = [v2 view];
  [v3 setHidden:1];

  id v5 = [*(id *)(a1 + 32) enrollmentControlller];
  uint64_t v4 = [v5 contentView];
  [v4 setHidden:0];
}

- (void)transitionToTutorialView:(BOOL)a3
{
}

- (void)transitionToTutorialView:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
  if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: transition To Tutorail View", buf, 2u);
  }
  id v8 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
  BOOL v9 = [v8 view];
  char v10 = [v9 isHidden];

  if ((v10 & 1) != 0 || !v4)
  {
    int64_t v11 = [(BKUIFingerprintEnrollViewController *)self view];
    uint64_t v12 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    double v13 = [v12 view];
    [v11 bringSubviewToFront:v13];

    double v14 = [(BKUIFingerprintEnrollViewController *)self view];
    [v14 bounds];
    double v16 = v15;
    double v18 = v17;
    double v20 = v19;
    double v22 = v21;

    double v23 = [MEMORY[0x1E4F42948] currentDevice];
    LODWORD(v12) = objc_msgSend(v23, "bkui_isRTL");

    double v24 = [(BKUIFingerprintEnrollViewController *)self view];
    [v24 bounds];
    double v26 = v25;

    double v27 = -v26;
    if (!v12) {
      double v27 = v26;
    }
    double v28 = v16 + v27;
    __int16 v29 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    int v30 = [v29 view];
    objc_msgSend(v30, "setFrame:", v28, v18, v20, v22);

    uint64_t v31 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    objc_super v32 = [v31 view];
    [v32 layoutIfNeeded];

    objc_super v33 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    v34 = [v33 view];
    [v34 setAlpha:1.0];

    int v35 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    __int16 v36 = [v35 view];
    [v36 setHidden:0];

    BOOL v37 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
    uint64_t v38 = v37;
    if (v4)
    {
      [v37 loadAVPlayer];

      id v39 = (void *)MEMORY[0x1E4F42FF0];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke;
      v48[3] = &unk_1E6EA20C0;
      v48[4] = self;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke_2;
      v46[3] = &unk_1E6EA2748;
      v46[4] = self;
      id v47 = v6;
      [v39 animateWithDuration:v48 animations:v46 completion:0.3];
    }
    else
    {
      BOOL v40 = [v37 view];
      v41 = [(BKUIFingerprintEnrollViewController *)self view];
      [v41 bounds];
      objc_msgSend(v40, "setFrame:");

      v42 = [(BKUIFingerprintEnrollViewController *)self tutorialController];
      v43 = [v42 view];
      [v43 layoutIfNeeded];

      v44 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
      uint64_t v45 = [v44 view];
      [v45 setHidden:1];
    }
  }
}

void __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) tutorialController];
  BOOL v3 = [v2 view];
  BOOL v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  objc_msgSend(v3, "setFrame:");

  id v6 = [*(id *)(a1 + 32) tutorialController];
  id v5 = [v6 view];
  [v5 layoutIfNeeded];
}

uint64_t __75__BKUIFingerprintEnrollViewController_transitionToTutorialView_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) enrollmentControlller];
  BOOL v3 = [v2 view];
  [v3 setHidden:1];

  BOOL v4 = [*(id *)(a1 + 32) enrollmentControlller];
  id v5 = [v4 view];
  [v5 setNeedsLayout];

  id v6 = [*(id *)(a1 + 32) tutorialController];
  uint64_t v7 = [v6 view];
  [v7 setHidden:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    BOOL v9 = *(uint64_t (**)(void))(result + 16);
    return v9();
  }
  return result;
}

- (void)initPromptMessage
{
  id v3 = [(BKUIFingerprintEnrollViewController *)self _placeFingerString];
  [(BKUIFingerprintEnrollViewController *)self _animateHeaderTitle:v3];
}

- (void)_animateHeaderTitle:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  BOOL v6 = [(NSTimer *)self->_messageTimer isValid];
  p_lastPromptMessage = &self->_lastPromptMessage;
  if (v6)
  {
    objc_storeStrong((id *)p_lastPromptMessage, a3);
  }
  else
  {
    id v8 = *p_lastPromptMessage;
    *p_lastPromptMessage = 0;

    BOOL v9 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    char v10 = [v9 headerTitle];
    char v11 = [v10 isEqualToString:v5];

    if (v11)
    {
      double msgShowTimeout = self->_msgShowTimeout;
    }
    else
    {
      bkui_fingerprint_enroll_view_controller_log = self->bkui_fingerprint_enroll_view_controller_log;
      if (os_log_type_enabled(bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v5;
        _os_log_impl(&dword_1E4B6C000, bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEFAULT, "BiometricKitUI: Current title set to: \"%@\"", (uint8_t *)&v14, 0xCu);
      }
      [(BKUIFingerprintEnrollViewController *)self _transitionPromptMessage:v5];
      double msgShowTimeout = self->_msgTransLength + self->_msgShowTimeout;
    }
    [(BKUIFingerprintEnrollViewController *)self _startMessageTimer:msgShowTimeout];
  }
}

- (void)_startMessageTimer:(double)a3
{
  [(BKUIFingerprintEnrollViewController *)self _stopMessageTimer];
  if (os_log_type_enabled((os_log_t)self->bkui_fingerprint_enroll_view_controller_log, OS_LOG_TYPE_DEBUG)) {
    -[BKUIFingerprintEnrollViewController _startMessageTimer:]();
  }
  id v5 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__messageTimeout selector:0 userInfo:0 repeats:a3];
  messageTimer = self->_messageTimer;
  self->_messageTimer = v5;
}

- (void)_stopMessageTimer
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Stopping Message Timer", v2, v3, v4, v5, v6);
}

- (void)_messageTimeout
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Message Timeout", v2, v3, v4, v5, v6);
}

- (void)_transitionPromptMessage:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  uint8_t v6 = [v5 view];
  uint64_t v7 = [v6 isHidden] ^ 1;

  id v8 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
  [v8 updateHeaderWithTitle:v4 animated:v7 heightDifference:0];
}

- (id)_liftFingerString
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v3 = [v2 localizedStringForKey:@"LIFT_YOUR_FINGER" value:&stru_1F4081468 table:@"BiometricKitUI"];

  return v3;
}

- (id)_placeFingerString
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"PLACE_YOUR_FINGER" value:&stru_1F4081468 table:@"BiometricKitUI"];

  if ([(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell])
  {
    uint64_t v5 = [(BKUIFingerprintEnrollViewController *)self enrollmentControlller];
    uint64_t v6 = [v5 enrollViewState];

    if (v6 == 1)
    {
      uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v8 = [v7 localizedStringForKey:@"PLACE_YOUR_FINGER_FOLLOW_UP" value:&stru_1F4081468 table:@"Mesa-j307"];

      id v4 = (void *)v8;
    }
  }
  return v4;
}

- (id)_readyString
{
  uint64_t v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v4 = [v3 localizedStringForKey:@"MESA_IS_READY" value:&stru_1F4081468 table:@"BiometricKitUI"];

  if ([(BKUIFingerprintEnrollViewController *)self followUPEnrollmentUpSell])
  {
    uint64_t v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v6 = [v5 localizedStringForKey:@"MESA_IS_READY_FOLLOW_UP" value:&stru_1F4081468 table:@"Mesa-j307"];

    id v4 = (void *)v6;
  }
  return v4;
}

- (BOOL)followUPEnrollmentUpSell
{
  if (!self->_inBuddy) {
    return 0;
  }
  uint64_t v2 = +[BKUIDevice sharedInstance];
  if ([v2 isIdiomPad]) {
    BOOL v3 = MGGetSInt32Answer() == 2;
  }
  else {
    BOOL v3 = 0;
  }

  return v3;
}

- (id)menuAction
{
  return [(BiometricKitUIEnrollViewController *)self propertyForKey:@"MENU_ACTION"];
}

- (BOOL)_topTouchButtonIpad
{
  if (MGGetBoolAnswer())
  {
    uint64_t v2 = +[BKUIDevice sharedInstance];
    [v2 isIdiomPad];
  }
  return MGGetSInt32Answer() == 2;
}

- (id)_deviceAwareLocalizedStringForKey:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BKUIFingerprintEnrollViewController *)self _topTouchButtonIpad];
  uint64_t v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v4 stringByAppendingString:@"_FOLLOW_UP"];

    BOOL v9 = [v7 localizedStringForKey:v8 value:&stru_1F4081468 table:@"Mesa-j307"];
    id v4 = (id)v8;
  }
  else
  {
    BOOL v9 = [v6 localizedStringForKey:v4 value:&stru_1F4081468 table:@"BiometricKitUI"];
  }

  return v9;
}

- (BKDeviceTouchID)bkDevice
{
  return (BKDeviceTouchID *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setBkDevice:(id)a3
{
}

- (BKEnrollTouchIDOperation)bkEnroll
{
  return (BKEnrollTouchIDOperation *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setBkEnroll:(id)a3
{
}

- (BKExtendEnrollTouchIDOperation)bkExtendEnroll
{
  return (BKExtendEnrollTouchIDOperation *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setBkExtendEnroll:(id)a3
{
}

- (BKIdentity)bkIdentity
{
  return (BKIdentity *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setBkIdentity:(id)a3
{
}

- (int64_t)bkProgress
{
  return self->_bkProgress;
}

- (void)setBkProgress:(int64_t)a3
{
  self->_bkProgress = a3;
}

- (BOOL)waitForFingerLift
{
  return self->_waitForFingerLift;
}

- (void)setWaitForFingerLift:(BOOL)a3
{
  self->_waitForFingerLift = a3;
}

- (BOOL)fingerOn
{
  return self->_fingerOn;
}

- (void)setFingerOn:(BOOL)a3
{
  self->_fingerOn = a3;
}

- (BKUIFingerPrintEnrollTutorialViewController)tutorialController
{
  return self->_tutorialController;
}

- (void)setTutorialController:(id)a3
{
}

- (BKUIFingerPrintEnrollmentPhaseViewController)enrollmentControlller
{
  return self->_enrollmentControlller;
}

- (void)setEnrollmentControlller:(id)a3
{
}

- (BioStreamsEventHelper)bioStreamEventHelper
{
  return self->_bioStreamEventHelper;
}

- (void)setBioStreamEventHelper:(id)a3
{
}

- (void)setFollowUPEnrollmentUpSell:(BOOL)a3
{
  self->_followUPEnrollmentUpSell = a3;
}

- (BKIdentity)firstFollowUpIdentity
{
  return self->_firstFollowUpIdentity;
}

- (void)setFirstFollowUpIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_firstFollowUpIdentity, 0);
  objc_storeStrong((id *)&self->_bioStreamEventHelper, 0);
  objc_storeStrong((id *)&self->_enrollmentControlller, 0);
  objc_storeStrong((id *)&self->_tutorialController, 0);
  objc_storeStrong((id *)&self->_bkIdentity, 0);
  objc_storeStrong((id *)&self->_bkExtendEnroll, 0);
  objc_storeStrong((id *)&self->_bkEnroll, 0);
  objc_storeStrong((id *)&self->_bkDevice, 0);
  objc_storeStrong((id *)&self->bkui_fingerprint_enroll_view_controller_log, 0);
  objc_storeStrong((id *)&self->bkui_biometric_kit_delegate_log, 0);
  objc_storeStrong((id *)&self->bkui_result_delegate_log, 0);
  objc_storeStrong((id *)&self->_alertHudText, 0);
  objc_storeStrong((id *)&self->_alertHudView, 0);
  objc_storeStrong((id *)&self->_mesaSecondEnrollView, 0);
  objc_storeStrong((id *)&self->_mesaFirstEnrollView, 0);
  objc_storeStrong((id *)&self->_alertView, 0);
  objc_storeStrong((id *)&self->_lastPromptMessage, 0);
  objc_storeStrong((id *)&self->_messageTimer, 0);
  objc_storeStrong((id *)&self->_enrollmentEndTime, 0);
}

void __71__BKUIFingerprintEnrollViewController_showSecondFingerEnrollmentUpSell__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "showSecondFingerEnrollmentUpSell: Restarting enrollment", v2, v3, v4, v5, v6);
}

- (void)applicationWillResignActive:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: App resigning active ... will remove unsaved identities", v2, v3, v4, v5, v6);
}

void __67__BKUIFingerprintEnrollViewController_applicationWillResignActive___block_invoke_cold_1(void *a1)
{
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() localizedDescription];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_1E4B6C000, v4, v5, "applicationWillResignActive failed to _bkIdentity identity failed. Err: %@", v6, v7, v8, v9, v10);
}

- (void)enrollProgress:(void *)a1 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a1;
  int v5 = 134218240;
  uint64_t v6 = [(id)OUTLINED_FUNCTION_5() progress];
  __int16 v7 = 1024;
  int v8 = [a2 message];
  _os_log_debug_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Enroll progress: %li and message: %i", (uint8_t *)&v5, 0x12u);
}

- (void)_cancelEnrollmentAndRestart:(char)a1 .cold.1(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_1E4B6C000, a2, OS_LOG_TYPE_DEBUG, "BiometricKitUI: Canceling enroll and restart: %i", (uint8_t *)v2, 8u);
}

- (void)_startTutorial:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Starting tutorial", v2, v3, v4, v5, v6);
}

- (void)_startInitialTutorialAnimated:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Start intial tutorial", v2, v3, v4, v5, v6);
}

- (void)fingerprintCaptureOperation:encounteredCaptureError:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1E4B6C000, v0, OS_LOG_TYPE_ERROR, "BiomtericKitUI: Fingerprint encountered capture error: %li", v1, 0xCu);
}

- (void)_resetUIWithTransitionToTutorial:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Resetting UI", v2, v3, v4, v5, v6);
}

- (void)_bkIdentityCount
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = a1;
  uint64_t v3 = [(id)OUTLINED_FUNCTION_5() localizedDescription];
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_1E4B6C000, v1, OS_LOG_TYPE_ERROR, "BiomtericKitUI: _bkIdentityCount fetch error: %@", v4, 0xCu);
}

- (void)_startMessageTimer:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_2(&dword_1E4B6C000, v0, v1, "BiometricKitUI: Starting Message Timer", v2, v3, v4, v5, v6);
}

@end