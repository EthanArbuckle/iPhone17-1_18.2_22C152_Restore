@interface BKUIPearlEnrollViewController
+ (BOOL)_shouldShowAccessibilityOptionForState:(int)a3 poseStatus:(id)a4;
+ (BOOL)_shouldShowEscapeHatchForState:(int)a3 inBuddy:(BOOL)a4;
+ (void)preloadWithCompletion:(id)a3;
- (BKUIAnalyticsManager)analyticsManager;
- (BKUIButtonTray)buttonTray;
- (BKUIPearlEnrollAudioManager)audioManager;
- (BKUIPearlEnrollControllerPreloadedState)preloadedState;
- (BKUIPearlEnrollView)enrollView;
- (BKUIPearlEnrollViewBottomContainer)bottomContainer;
- (BKUIPearlEnrollViewController)initWithPreloadedState:(id)a3;
- (BKUIPearlEnrollViewControllerDelegate)delegate;
- (BKUIPearlInstructionView)animatingInstructionView;
- (BKUIPearlInstructionView)instructionView;
- (BKUIPeriocularEnableSplashViewController)midFlowPeriocularSplashController;
- (BOOL)darkBackground;
- (BOOL)enrollmentAlreadyHasExistingPeriocularTemplate;
- (BOOL)hasPeriocularIdentityEnrolled;
- (BOOL)inBuddy;
- (BOOL)inBuddyGlassesFollowUp;
- (BOOL)inSheet;
- (BOOL)isDisplayZoomEnabled;
- (BOOL)isFinalEnrollment;
- (BOOL)isGlassesEnrollmentOnly;
- (BOOL)isModalInPresentation;
- (BOOL)midFlowPeriocularSplashShowing;
- (BOOL)showGlassesSkipUI;
- (BioStreamsEventHelper)bioStreamEventHelper;
- (NSArray)instructionViewConstraints;
- (NSLayoutConstraint)enrollViewHeightConstraint;
- (NSLayoutConstraint)enrollViewTopConstraint;
- (NSLayoutConstraint)instructionViewTopConstraint;
- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintShort;
- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintTall;
- (NSMutableArray)operationHandlers;
- (NSString)progressString;
- (UIButton)escapeHatchButton;
- (UIButton)nextStateButton;
- (UIButton)retryMatchOperationButton;
- (UILayoutGuide)instructionBaselineLayoutGuide;
- (UITraitChangeRegistration)traitChangeRegistration;
- (UIView)nextStateButtonContainer;
- (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager)workItemsManager;
- (double)percentOfPillsCompleted;
- (id)_escapeHatchTitleForState:(int)a3;
- (id)_nextStateButtonTitleForState:(int)a3;
- (id)_nextStateButtonTitleForState:(int)a3 subState:(int)a4;
- (id)currentOperationHandler;
- (id)getEnrollview;
- (int)previousState;
- (int)state;
- (int)substate;
- (int64_t)glassesMidFlowUpsell;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)enrollmentConfiguration;
- (void)_cancelEnrollOperationForEscapeHatchButtonTap;
- (void)_enableEnrollUI;
- (void)_endEnrollFlowWithError:(id)a3;
- (void)_handleEnrollStateOnAppear;
- (void)_handleGlassesSkipAction;
- (void)_logRemovePeriocularFailure:(id)a3;
- (void)_setState:(int)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_setSubstate:(int)a3 animated:(BOOL)a4;
- (void)_setSuspended:(BOOL)a3;
- (void)_setupUI;
- (void)_updateDebugLabel;
- (void)_updateLeftBarButtonItem;
- (void)animateInstruction;
- (void)animateToSuccessCompletionLayout:(int64_t)a3;
- (void)animateWithOrientation:(int64_t)a3;
- (void)cancelEnroll;
- (void)cancelEnrollForRotationIfNeeded:(int64_t)a3;
- (void)cleanupEnrollView;
- (void)clearPendingStateWorkItems;
- (void)dealloc;
- (void)didBecomeActive:(id)a3;
- (void)didEnterBackground:(id)a3;
- (void)didReachLargeNudgePeakForEnrollView:(id)a3;
- (void)didReachSmallNudgePeakForEnrollView:(id)a3;
- (void)endEnrollFlowWithError:(id)a3;
- (void)enrollOperation:(id)a3 finishedWithIdentity:(id)a4 animateImmediately:(BOOL)a5;
- (void)enrollView:(id)a3 didNudgeInDirection:(unint64_t)a4 nudgeCount:(unint64_t)a5;
- (void)enrollView:(id)a3 willNudgeInDirection:(unint64_t)a4 nudgeCount:(unint64_t)a5;
- (void)escapeHatchButtonPressed;
- (void)finalizeInstructionAnimation;
- (void)forceDarkBackground:(BOOL)a3 animated:(BOOL)a4;
- (void)invalidateSubstateTimer;
- (void)navigateToMidFlowPeriocularSplashScreenWithPrepareAction:(id)a3 completionAction:(id)a4;
- (void)nextStateButtonPressed:(id)a3;
- (void)pearlEnrollControllerCompleted;
- (void)prepareBottomContainerForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6;
- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4;
- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6;
- (void)primeWithExternalizedAuthContext:(id)a3;
- (void)primeWithPasscode:(id)a3;
- (void)refreshEscapeHatchForCurrentState;
- (void)removeGlassesUI;
- (void)restartEnroll;
- (void)retryPressed;
- (void)returnToEnroll;
- (void)setAnalyticsManager:(id)a3;
- (void)setAnimatingInstructionView:(id)a3;
- (void)setAudioManager:(id)a3;
- (void)setBioStreamEventHelper:(id)a3;
- (void)setBottomContainer:(id)a3;
- (void)setButtonTray:(id)a3;
- (void)setCustomDetailString:(id)a3 forState:(int)a4;
- (void)setCustomInstructionString:(id)a3 forState:(int)a4;
- (void)setDarkBackground:(BOOL)a3;
- (void)setDelegate:(id)a3;
- (void)setEnrollMovieViewHidden:(BOOL)a3;
- (void)setEnrollView:(id)a3;
- (void)setEnrollViewHeightConstraint:(id)a3;
- (void)setEnrollViewTopConstraint:(id)a3;
- (void)setEnrollmentAlreadyHasExistingPeriocularTemplate:(BOOL)a3;
- (void)setEnrollmentConfiguration:(unint64_t)a3;
- (void)setEscapeHatchButton:(id)a3;
- (void)setExistingIdentity:(id)a3;
- (void)setGlassesMidFlowUpsell:(int64_t)a3;
- (void)setInBuddy:(BOOL)a3;
- (void)setInBuddyGlassesFollowUp:(BOOL)a3;
- (void)setInSheet:(BOOL)a3;
- (void)setInstructionBaselineLayoutGuide:(id)a3;
- (void)setInstructionView:(id)a3;
- (void)setInstructionViewConstraints:(id)a3;
- (void)setInstructionViewTopConstraint:(id)a3;
- (void)setIsDisplayZoomEnabled:(BOOL)a3;
- (void)setMidFlowPeriocularSplashController:(id)a3;
- (void)setNextStateButton:(id)a3;
- (void)setNextStateButtonContainer:(id)a3;
- (void)setNextStateButtonContainerBottomConstraintShort:(id)a3;
- (void)setNextStateButtonContainerBottomConstraintTall:(id)a3;
- (void)setOperationHandlers:(id)a3;
- (void)setPreloadedState:(id)a3;
- (void)setPreviousState:(int)a3;
- (void)setProgressString:(id)a3;
- (void)setRetryMatchOperationButton:(id)a3;
- (void)setState:(int)a3;
- (void)setState:(int)a3 animated:(BOOL)a4;
- (void)setState:(int)a3 animated:(BOOL)a4 afterDelay:(double)a5;
- (void)setStatus:(id)a3;
- (void)setSubstate:(int)a3;
- (void)setSubstate:(int)a3 animated:(BOOL)a4 afterDelay:(double)a5;
- (void)setTraitChangeRegistration:(id)a3;
- (void)setWorkItemsManager:(id)a3;
- (void)setupDebugLabel;
- (void)showMaskAndGlassesTutorialWithCompletion:(id)a3;
- (void)startEnroll;
- (void)toggleDebug;
- (void)toggleDebugAndSave;
- (void)traceAnalyticsForEndEnrollFlowWithError:(id)a3;
- (void)transitionToSuccessFromPeriocularSplash;
- (void)updateButtonsVisibility;
- (void)updatePeriocularEnrollmentSettings:(id)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)willResignActive:(id)a3;
@end

@implementation BKUIPearlEnrollViewController

- (void)nextStateButtonPressed:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(BKUIPearlEnrollViewController *)self nextStateButton];
  [v5 setEnabled:0];

  if ([(BKUIPearlEnrollViewController *)self state] == 2)
  {
    v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Next state button pressed, startEnroll...", buf, 2u);
    }

    v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v7 supportsPeriocularEnrollment])
    {
      v8 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      char v9 = [v8 isEnrollmentAugmentationOnly];

      if (v9)
      {
        v10 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        [v10 matchUserForSecondPhaseEnrollmentWithCompletionAction:0];

        goto LABEL_44;
      }
    }
    else
    {
    }
    [(BKUIPearlEnrollViewController *)self startEnroll];
    goto LABEL_44;
  }
  if ([(BKUIPearlEnrollViewController *)self state] != 9)
  {
    if ([(BKUIPearlEnrollViewController *)self state] != 6
      && [(BKUIPearlEnrollViewController *)self state] != 8
      && ![(BKUIPearlEnrollViewController *)self midFlowPeriocularSplashShowing])
    {
      if ([(BKUIPearlEnrollViewController *)self state] == 10)
      {
        if (![(BKUIPearlEnrollViewController *)self inBuddy])
        {
          id v37 = objc_alloc_init((Class)getBYFlowSkipControllerClass());
          v38 = getBYFlowSkipIdentifierFaceID();
          [v37 didCompleteFlow:v38];
        }
        objc_initWeak((id *)buf, self);
        aBlock[0] = MEMORY[0x1E4F143A8];
        aBlock[1] = 3221225472;
        aBlock[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_4;
        aBlock[3] = &unk_1E6EA2268;
        objc_copyWeak(&v49, (id *)buf);
        aBlock[4] = self;
        v39 = _Block_copy(aBlock);
        v40 = [(BKUIPearlEnrollViewController *)self bioStreamEventHelper];
        [v40 sendSuccessfulEnrollEvent];

        [(BKUIPearlEnrollViewController *)self updatePeriocularEnrollmentSettings:v39];
        objc_destroyWeak(&v49);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_44;
    }
    if ([(BKUIPearlEnrollViewController *)self state] == 8)
    {
      v21 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        v22 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        v23 = [v22 enrollOperation];
        if (!v23)
        {
          v45 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
          int v46 = [v45 supportsPeriocularEnrollment];

          if (v46) {
            [(BKUIPearlEnrollViewController *)self updatePeriocularEnrollmentSettings:0];
          }
          goto LABEL_23;
        }
      }
    }
LABEL_23:
    v24 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    int v25 = [v24 supportsPeriocularEnrollment];

    v26 = _BKUILoggingFacility();
    BOOL v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);
    if (v25)
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4B6C000, v26, OS_LOG_TYPE_DEFAULT, "Button Pressed match then start second phase enrollment ...", buf, 2u);
      }

      objc_initWeak((id *)buf, self);
      v28 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_3;
      v50[3] = &unk_1E6EA2098;
      objc_copyWeak(&v51, (id *)buf);
      [v28 matchUserForSecondPhaseEnrollmentWithCompletionAction:v50];

      objc_destroyWeak(&v51);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      if (v27)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4B6C000, v26, OS_LOG_TYPE_DEFAULT, "Button Pressed start second phase enrollment ...", buf, 2u);
      }

      [(BKUIPearlEnrollViewController *)self setState:7 animated:1];
      [(BKUIPearlEnrollViewController *)self setSubstate:0 animated:1 afterDelay:0.0];
    }
    goto LABEL_44;
  }
  v11 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  if ([v11 supportsPeriocularEnrollment])
  {
    v12 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    int v13 = [v12 glassesFound];

    if (v13)
    {
      v14 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      v15 = [v14 enrollOperation];

      if (v15)
      {
        v16 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        id v53 = 0;
        int v17 = [v16 completeCurrentEnrollOperationWithError:&v53];
        id v18 = v53;

        v19 = _BKUILoggingFacility();
        BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
        if (v17)
        {
          if (v20)
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1E4B6C000, v19, OS_LOG_TYPE_DEFAULT, "Enroll marked as completed by partial capture!", buf, 2u);
          }
        }
        else
        {
          if (v20)
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v18;
            _os_log_impl(&dword_1E4B6C000, v19, OS_LOG_TYPE_DEFAULT, "Failed to complete enroll: %@", buf, 0xCu);
          }

          v47 = [NSString stringWithFormat:@"Failed to complete enroll for partial capture: %@", v18];
          [(BKUIPearlEnrollViewController *)self setStatus:v47];
        }
      }
      else
      {
        v41 = _BKUILoggingFacility();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1E4B6C000, v41, OS_LOG_TYPE_DEFAULT, "Enroll marked subsequent enrollment as completed by partial capture, starting match operation for Glasses Enrollment.", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v42 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        v54[0] = MEMORY[0x1E4F143A8];
        v54[1] = 3221225472;
        v54[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke;
        v54[3] = &unk_1E6EA2098;
        objc_copyWeak(&v55, (id *)buf);
        [v42 matchUserForSecondPhaseEnrollmentWithCompletionAction:v54];

        objc_destroyWeak(&v55);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_44;
    }
  }
  else
  {
  }
  v29 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  id v52 = 0;
  int v30 = [v29 completeCurrentEnrollOperationWithError:&v52];
  id v31 = v52;

  if (v30)
  {
    v32 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v32 enrollmentType] != 1)
    {
LABEL_34:

LABEL_35:
      v34 = _BKUILoggingFacility();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1E4B6C000, v34, OS_LOG_TYPE_DEFAULT, "Enroll marked as completed by partial capture!", buf, 2u);
      }

      goto LABEL_44;
    }
    v33 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v33 isEnrollmentAugmentationOnly])
    {

      goto LABEL_34;
    }
    BOOL v43 = [(BKUIPearlEnrollViewController *)self enrollmentConfiguration] == 0;

    if (v43) {
      goto LABEL_35;
    }
    v44 = _BKUILoggingFacility();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1E4B6C000, v44, OS_LOG_TYPE_DEFAULT, "Enroll marked initial enrollment as completed by partial capture navigate to mid flow Periocular Enable Splash Pane.", buf, 2u);
    }

    [(BKUIPearlEnrollViewController *)self navigateToMidFlowPeriocularSplashScreenWithPrepareAction:0 completionAction:0];
  }
  else
  {
    v35 = _BKUILoggingFacility();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v57 = v31;
      _os_log_impl(&dword_1E4B6C000, v35, OS_LOG_TYPE_DEFAULT, "Failed to complete enroll: %@", buf, 0xCu);
    }

    v36 = [NSString stringWithFormat:@"Failed to complete enroll for partial capture: %@", v31];
    [(BKUIPearlEnrollViewController *)self setStatus:v36];
  }
LABEL_44:
}

void __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if ([WeakRetained isFinalEnrollment]) {
    [WeakRetained setSubstate:0];
  }
  [WeakRetained setState:3 animated:1];
}

void __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    uint64_t v4 = [WeakRetained enrollmentConfiguration];
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Button Pressed matched second phase enrollment started ... setting UI to Match enrollment config: %li", (uint8_t *)&v3, 0xCu);
  }

  if ([WeakRetained isFinalEnrollment]) {
    [WeakRetained setSubstate:0];
  }
  [WeakRetained setState:3 animated:1];
}

void __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (UIAccessibilityIsVoiceOverRunning())
  {
    int v3 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v4 = [MEMORY[0x1E4F42948] modelSpecificLocalizedStringKeyForKey:@"ENROLL_WITH_VOICEOVER_ALERT_MESSAGE"];
    uint64_t v5 = [v3 localizedStringForKey:v4 value:&stru_1F4081468 table:@"Pearl-periocular"];

    v6 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v7 = [v6 localizedStringForKey:@"ENROLL_WITH_VOICEOVER_ALERT_TITLE" value:&stru_1F4081468 table:@"Pearl-periocular"];
    v8 = +[BKUIAlertController alertControllerWithTitle:v7 message:v5 preferredStyle:1];

    char v9 = (void *)MEMORY[0x1E4F42720];
    v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    v11 = [v10 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"Pearl-periocular"];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_2;
    v13[3] = &unk_1E6EA21F8;
    v13[4] = WeakRetained;
    v12 = [v9 actionWithTitle:v11 style:0 handler:v13];
    [v8 addAction:v12];

    [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
  }
  else
  {
    [WeakRetained endEnrollFlowWithError:0];
  }
}

uint64_t __84__BKUIPearlEnrollViewController_ButtonActionWithNavigation__nextStateButtonPressed___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) endEnrollFlowWithError:0];
}

- (void)updatePeriocularEnrollmentSettings:(id)a3
{
  uint64_t v4 = (void (**)(void))a3;
  uint64_t v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  id v16 = 0;
  id v17 = 0;
  v6 = [v5 getAuthContextForCredentialError:&v17 authContext:&v16];
  id v7 = v17;
  id v8 = v16;

  if (v7)
  {
    char v9 = _BKUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      [(BKUIPearlEnrollViewController(ButtonActionWithNavigation) *)v7 updatePeriocularEnrollmentSettings:v9];
    }
  }
  unint64_t v10 = [(BKUIPearlEnrollViewController *)self enrollmentConfiguration];
  if (v10 - 3 < 2 || v10 == 1)
  {
    if (![(BKUIPearlEnrollViewController *)self enrollmentAlreadyHasExistingPeriocularTemplate])
    {
      v11 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      v12 = [v11 identity];
      int v13 = [v12 hasPeriocularEnrollment];

      v14 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      v15 = [v14 device];
      +[BKUIPeriocularEnableSplashViewController setPeriocularFaceIDMatchEnabledForUserConfigurationWithDevice:v15 credentialSet:v6 authContext:v8 enabled:v13 != 0 completion:v4];

      goto LABEL_13;
    }
  }
  else if (v10)
  {
    goto LABEL_13;
  }
  if (v4) {
    v4[2](v4);
  }
LABEL_13:
}

- (BOOL)midFlowPeriocularSplashShowing
{
  v2 = [(BKUIPearlEnrollViewController *)self midFlowPeriocularSplashController];
  int v3 = [v2 view];
  uint64_t v4 = [v3 window];
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)navigateToMidFlowPeriocularSplashScreenWithPrepareAction:(id)a3 completionAction:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BKUIPearlEnrollViewController *)self delegate];
  char v9 = [v8 containerView];
  [v9 setClipsToBounds:1];

  dispatch_time_t v10 = dispatch_time(0, 700000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke;
  block[3] = &unk_1E6EA2308;
  block[4] = self;
  id v14 = v7;
  id v15 = v6;
  id v11 = v6;
  id v12 = v7;
  dispatch_after(v10, MEMORY[0x1E4F14428], block);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke(uint64_t a1)
{
  v58[4] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [BKUIPeriocularEnableSplashViewController alloc];
  uint64_t v3 = [*(id *)(a1 + 32) inBuddy];
  uint64_t v4 = [*(id *)(a1 + 32) currentOperationHandler];
  BOOL v5 = [v4 device];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2;
  v54[3] = &unk_1E6EA22E0;
  void v54[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v56, &location);
  id v55 = *(id *)(a1 + 40);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2_30;
  v52[3] = &unk_1E6EA2098;
  objc_copyWeak(&v53, &location);
  id v6 = [(BKUIPeriocularEnableSplashViewController *)v2 initInBuddy:v3 bkDevice:v5 upsell:0 withEndEnrollmentActionPrimary:v54 enrollmentActionSecondary:v52];
  [*(id *)(a1 + 32) setMidFlowPeriocularSplashController:v6];

  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_31;
  v50[3] = &unk_1E6EA2098;
  objc_copyWeak(&v51, &location);
  id v7 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  [v7 setUserSkippedAction:v50];

  id v8 = [*(id *)(a1 + 32) parentViewController];
  char v9 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  [v8 addChildViewController:v9];

  dispatch_time_t v10 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  id v11 = [v10 view];
  [v11 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v12 = [*(id *)(a1 + 32) delegate];
  int v13 = [v12 containerView];
  id v14 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  id v15 = [v14 view];
  [v13 addSubview:v15];

  v28 = (void *)MEMORY[0x1E4F28DC8];
  v48 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  v47 = [v48 view];
  v44 = [v47 leadingAnchor];
  int v46 = [*(id *)(a1 + 32) delegate];
  v45 = [v46 containerView];
  BOOL v43 = [v45 leadingAnchor];
  v42 = [v44 constraintEqualToAnchor:v43];
  v58[0] = v42;
  v41 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  v40 = [v41 view];
  id v37 = [v40 trailingAnchor];
  v39 = [*(id *)(a1 + 32) delegate];
  v38 = [v39 containerView];
  v36 = [v38 trailingAnchor];
  v35 = [v37 constraintEqualToAnchor:v36];
  v58[1] = v35;
  v34 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  v33 = [v34 view];
  int v30 = [v33 topAnchor];
  v32 = [*(id *)(a1 + 32) delegate];
  id v31 = [v32 containerView];
  v29 = [v31 topAnchor];
  id v16 = [v30 constraintEqualToAnchor:v29];
  v58[2] = v16;
  id v17 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  id v18 = [v17 view];
  v19 = [v18 bottomAnchor];
  BOOL v20 = [*(id *)(a1 + 32) delegate];
  v21 = [v20 containerView];
  v22 = [v21 bottomAnchor];
  v23 = [v19 constraintEqualToAnchor:v22];
  v58[3] = v23;
  v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v58 count:4];
  [v28 activateConstraints:v24];

  uint64_t v25 = *(void *)(a1 + 48);
  if (v25) {
    (*(void (**)(void))(v25 + 16))();
  }
  v26 = +[BKUIPearlEnrollAnimationManager sharedManager];
  BOOL v27 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_4;
  v49[3] = &unk_1E6EA20C0;
  v49[4] = *(void *)(a1 + 32);
  [v26 transitionTo:v27 completion:v49];

  objc_destroyWeak(&v51);
  objc_destroyWeak(&v53);

  objc_destroyWeak(&v56);
  objc_destroyWeak(&location);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) setState:3 animated:0];
  dispatch_time_t v2 = dispatch_time(0, 650000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3;
  block[3] = &unk_1E6EA22B8;
  objc_copyWeak(&v6, (id *)(a1 + 48));
  uint64_t v3 = *(void **)(a1 + 40);
  block[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_after(v2, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v6);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (([WeakRetained midFlowPeriocularSplashShowing] & 1) == 0)
  {
    uint64_t v3 = _BKUILoggingFacility();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_cold_1(v3);
    }
  }
  uint64_t v4 = [WeakRetained midFlowPeriocularSplashController];
  id v5 = [v4 view];
  id v6 = [v5 layer];
  [v6 removeAllAnimations];

  [MEMORY[0x1E4F39CF8] flush];
  id v7 = [WeakRetained delegate];
  id v8 = [v7 containerView];
  char v9 = [WeakRetained view];
  [v8 bringSubviewToFront:v9];

  dispatch_time_t v10 = [WeakRetained view];
  objc_msgSend(v10, "setOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  id v11 = +[BKUIPearlEnrollAnimationManager sharedManager];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_29;
  v14[3] = &unk_1E6EA2290;
  uint64_t v12 = *(void *)(a1 + 32);
  int v13 = *(void **)(a1 + 40);
  v14[4] = WeakRetained;
  v14[5] = v12;
  id v15 = v13;
  [v11 transitionTo:WeakRetained completion:v14];
}

uint64_t __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_29(uint64_t a1)
{
  [*(id *)(a1 + 32) nextStateButtonPressed:*(void *)(a1 + 32)];
  dispatch_time_t v2 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  uint64_t v3 = [v2 view];
  [v3 removeFromSuperview];

  uint64_t v4 = [*(id *)(a1 + 32) parentViewController];
  id v5 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  [v4 removeChildViewController:v5];

  [*(id *)(a1 + 40) setNeedsStatusBarAppearanceUpdate];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_2_30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained transitionToSuccessFromPeriocularSplash];
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_31(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained transitionToSuccessFromPeriocularSplash];
}

uint64_t __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_4(uint64_t a1)
{
  dispatch_time_t v2 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  [v2 didMoveToParentViewController:*(void *)(a1 + 32)];

  uint64_t v3 = [*(id *)(a1 + 32) view];
  uint64_t v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  objc_msgSend(v3, "setOrigin:", v5, 0.0);

  id v6 = *(void **)(a1 + 32);

  return [v6 setNeedsStatusBarAppearanceUpdate];
}

- (void)escapeHatchButtonPressed
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  if ([(BKUIPearlEnrollViewController *)self showGlassesSkipUI])
  {
    [(BKUIPearlEnrollViewController *)self _handleGlassesSkipAction];
  }
  else if ([(BKUIPearlEnrollViewController *)self state] == 3 {
         && ([(BKUIPearlEnrollViewController *)self currentOperationHandler],
  }
             uint64_t v3 = objc_claimAutoreleasedReturnValue(),
             int v4 = [v3 shouldShowRetryUI],
             v3,
             v4))
  {
    double v5 = _BKUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Pressed escape hatch during match operation fail, showing retry UI ... user skipped", (uint8_t *)&buf, 2u);
    }

    [(BKUIPearlEnrollViewController *)self _cancelEnrollOperationForEscapeHatchButtonTap];
    objc_initWeak(&buf, self);
    id v6 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    id v7 = [v6 device];
    id v8 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    char v9 = [v8 identity];
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke;
    v44[3] = &unk_1E6EA2330;
    objc_copyWeak(&v45, &buf);
    [v7 removePeriocularEnrollmentsFromIdentity:v9 removeAll:1 reply:v44];

    objc_destroyWeak(&v45);
    objc_destroyWeak(&buf);
  }
  else if (objc_msgSend((id)objc_opt_class(), "_shouldShowEscapeHatchForState:inBuddy:", -[BKUIPearlEnrollViewController state](self, "state"), -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy")))
  {
    dispatch_time_t v10 = _BKUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Pressed escape hatch", (uint8_t *)&buf, 2u);
    }

    id v11 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    BOOL v12 = [v11 enrollmentType] == 1;

    if (v12)
    {
      int v13 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-2 userInfo:0];
      [(BKUIPearlEnrollViewController *)self endEnrollFlowWithError:v13];
    }
    else
    {
      v22 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      int v23 = [v22 isEnrollmentAugmentationOnly];

      if (v23)
      {
        objc_initWeak(&buf, self);
        v24 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        uint64_t v25 = [v24 device];
        v26 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        BOOL v27 = [v26 identity];
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_36;
        v42[3] = &unk_1E6EA2330;
        objc_copyWeak(&v43, &buf);
        [v25 removePeriocularEnrollmentsFromIdentity:v27 removeAll:1 reply:v42];

        objc_destroyWeak(&v43);
        objc_destroyWeak(&buf);
      }
      else
      {
        [(BKUIPearlEnrollViewController *)self _cancelEnrollOperationForEscapeHatchButtonTap];
        v28 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        v29 = [v28 enrollOperation];
        [v29 setDelegate:0];

        int v30 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        int v46 = v30;
        id v31 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v46 count:1];
        v32 = (void *)[v31 mutableCopy];
        [(BKUIPearlEnrollViewController *)self setOperationHandlers:v32];

        objc_initWeak(&buf, self);
        v33 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        v34 = [v33 device];
        v35 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        v36 = [v35 identity];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_3;
        v39[3] = &unk_1E6EA2358;
        objc_copyWeak(&v41, &buf);
        id v37 = v30;
        id v40 = v37;
        [v34 removePeriocularEnrollmentsFromIdentity:v36 removeAll:1 reply:v39];

        objc_destroyWeak(&v41);
        objc_destroyWeak(&buf);
      }
    }
  }
  else
  {
    id v14 = objc_opt_class();
    uint64_t v15 = [(BKUIPearlEnrollViewController *)self state];
    id v16 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    id v17 = [v16 poseStatus];
    LODWORD(v14) = [v14 _shouldShowAccessibilityOptionForState:v15 poseStatus:v17];

    if (v14)
    {
      id v18 = _BKUILoggingFacility();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 67109120;
        HIDWORD(buf) = [(BKUIPearlEnrollViewController *)self state];
        _os_log_impl(&dword_1E4B6C000, v18, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Pressed accessibility escape hatch, state = %i", (uint8_t *)&buf, 8u);
      }

      [(BKUIPearlEnrollViewController *)self setState:9 animated:1];
    }
    else if ([(BKUIPearlEnrollViewController *)self state] == 10)
    {
      v19 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      int v20 = [v19 supportsPeriocularEnrollment];

      if (v20)
      {
        v21 = _BKUILoggingFacility();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl(&dword_1E4B6C000, v21, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Enroll has completed, but we do have Periocular enrollment support!", (uint8_t *)&buf, 2u);
        }

        v38[0] = MEMORY[0x1E4F143A8];
        v38[1] = 3221225472;
        v38[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_38;
        v38[3] = &unk_1E6EA20C0;
        v38[4] = self;
        [(BKUIPearlEnrollViewController *)self updatePeriocularEnrollmentSettings:v38];
      }
    }
  }
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (v5 || (a2 & 1) == 0) {
    [WeakRetained _logRemovePeriocularFailure:v5];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2;
  block[3] = &unk_1E6EA20C0;
  block[4] = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-2 userInfo:0];
  [v1 endEnrollFlowWithError:v2];
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_36(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (v5 || (a2 & 1) == 0) {
    [WeakRetained _logRemovePeriocularFailure:v5];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2_37;
  block[3] = &unk_1E6EA20C0;
  block[4] = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_2_37(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-2 userInfo:0];
  [v1 endEnrollFlowWithError:v2];
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_3(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v7 = WeakRetained;
  if (v5 || (a2 & 1) == 0) {
    [WeakRetained _logRemovePeriocularFailure:v5];
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_4;
  v8[3] = &unk_1E6EA2268;
  objc_copyWeak(&v10, (id *)(a1 + 40));
  id v9 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], v8);

  objc_destroyWeak(&v10);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_4(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v4 = [WeakRetained enrollView];
  id v5 = [v4 pillContainer];
  [v5 setHidden:0];

  id v6 = [WeakRetained enrollView];
  [v6 setPillsHidden:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_5;
  v7[3] = &unk_1E6EA2268;
  objc_copyWeak(&v9, v2);
  id v8 = *(id *)(a1 + 32);
  [WeakRetained _setState:10 animated:1 completion:v7];

  objc_destroyWeak(&v9);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [*(id *)(a1 + 32) enrollOperation];
  uint64_t v3 = [*(id *)(a1 + 32) identity];
  [WeakRetained enrollOperation:v2 finishedWithIdentity:v3 animateImmediately:1];
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_38(uint64_t a1)
{
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "BKUIPearl: updatePeriocularEnrollmentSettings: endEnrollAction completion invoked", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_39;
  block[3] = &unk_1E6EA20C0;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
  uint64_t v3 = [*(id *)(a1 + 32) parentViewController];
  [v3 startInternalGlassesFlow];
}

uint64_t __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation__escapeHatchButtonPressed__block_invoke_39(uint64_t a1)
{
  return [*(id *)(a1 + 32) cleanupEnrollView];
}

- (void)_logRemovePeriocularFailure:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = _BKUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [v3 localizedDescription];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "removePeriocularEnrollmentsFromIdentity unsucesful %@", (uint8_t *)&v6, 0xCu);
  }
}

- (void)_cancelEnrollOperationForEscapeHatchButtonTap
{
  id v3 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  uint64_t v4 = [v3 enrollmentType];

  id v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  id v6 = v5;
  if (v4 == 1) {
    [v5 cancelEnroll];
  }
  else {
    [v5 cancelEnrollPreserveIdentity];
  }
}

+ (BOOL)_shouldShowEscapeHatchForState:(int)a3 inBuddy:(BOOL)a4
{
  return (a3 - 3) < 2 && a4;
}

+ (BOOL)_shouldShowAccessibilityOptionForState:(int)a3 poseStatus:(id)a4
{
  id v5 = a4;
  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:8];
    BOOL v7 = [v6 integerValue] == 3;
  }
  else
  {
    BOOL v7 = 0;
  }
  BOOL v8 = (a3 & 0xFFFFFFFD) == 5 && v7;

  return v8;
}

- (void)retryPressed
{
  if ([(BKUIPearlEnrollViewController *)self state] == 3)
  {
    id v3 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    int v4 = [v3 shouldShowRetryUI];

    if (v4)
    {
      id v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      [v5 retryPressed];

      id v7 = [(BKUIPearlEnrollViewController *)self buttonTray];
      id v6 = [v7 topLinkButton];
      [v6 setEnabled:0];
    }
  }
}

- (void)_handleGlassesSkipAction
{
  if ([(BKUIPearlEnrollViewController *)self state] == 3)
  {
    id v3 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v3 shouldShowRetryUI])
    {
      int v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      int v5 = [v4 glassesEnforcementError];

      if (v5)
      {
        id v6 = _BKUILoggingFacility();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_10;
        }
        LOWORD(buf[0]) = 0;
        id v7 = "Pressed escape hatch during glasses enforcement error in BKUIPearlEnrollStateNeedsPositioning, showing retr"
             "y UI ... user skip tapped";
        goto LABEL_9;
      }
    }
    else
    {
    }
  }
  id v6 = _BKUILoggingFacility();
  if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT)) {
    goto LABEL_10;
  }
  LOWORD(buf[0]) = 0;
  id v7 = "Pressed escape hatch during upsell in BKUIPearlEnrollStateSubsequentScanComplete, showing retry UI ... user skip tapped";
LABEL_9:
  _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)buf, 2u);
LABEL_10:

  BOOL v8 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  id v9 = [v8 enrollOperation];
  [v9 setDelegate:0];

  objc_initWeak(buf, self);
  if ([(BKUIPearlEnrollViewController *)self enrollmentConfiguration] == 4)
  {
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v10 localizedStringForKey:@"DYNAMIC_MATCH_GLASSES_ENROLL_SKIP_ALERT_BODY" value:&stru_1F4081468 table:@"Pearl-periocular"];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    [v10 localizedStringForKey:@"GLASSES_ENROLL_SKIP_ALERT_BODY" value:&stru_1F4081468 table:@"Pearl-periocular"];
  id v11 = };

  BOOL v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  int v13 = [v12 localizedStringForKey:@"GLASSES_ENROLL_SKIP_ALERT_TITLE" value:&stru_1F4081468 table:@"Pearl-periocular"];
  id v14 = +[BKUIAlertController alertControllerWithTitle:v13 message:v11 preferredStyle:1];

  uint64_t v15 = (void *)MEMORY[0x1E4F42720];
  id v16 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v17 = [v16 localizedStringForKey:@"GLASSES_ENROLL_SKIP_ALERT_SKIP_ACTION" value:&stru_1F4081468 table:@"Pearl-periocular"];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke;
  v25[3] = &unk_1E6EA2380;
  v25[4] = self;
  objc_copyWeak(&v26, buf);
  id v18 = [v15 actionWithTitle:v17 style:0 handler:v25];

  v19 = (void *)MEMORY[0x1E4F42720];
  int v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v21 = [v20 localizedStringForKey:@"GLASSES_ENROLL_SKIP_ALERT_DONT_SKIP_ACTION" value:&stru_1F4081468 table:@"Pearl-periocular"];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_3;
  v23[3] = &unk_1E6EA23A8;
  objc_copyWeak(&v24, buf);
  v22 = [v19 actionWithTitle:v21 style:1 handler:v23];
  [v14 addAction:v22];

  objc_msgSend(v14, "bkui_addPreferredAction:", v18);
  [(BKUIPearlEnrollViewController *)self presentViewController:v14 animated:1 completion:0];
  objc_destroyWeak(&v24);

  objc_destroyWeak(&v26);
  objc_destroyWeak(buf);
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke(uint64_t a1)
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) currentOperationHandler];
  uint64_t v3 = [*(id *)(a1 + 32) enrollmentConfiguration];
  int v4 = _BKUILoggingFacility();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3 == 4)
  {
    if (v5)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Pressed escape hatch during glasses enforcement error for BKUIPearlEnrollmentConfigurationDynamicMatchWithGlassesAugmentation, user confirmed skip", buf, 2u);
    }

    id v6 = *(void **)(a1 + 32);
    id v7 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-2 userInfo:0];
    [v6 endEnrollFlowWithError:v7];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Pressed escape hatch during during upsell for normal enrollment, user confirmed skip", buf, 2u);
    }

    v21[0] = v2;
    BOOL v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:1];
    id v9 = (void *)[v8 mutableCopy];
    [*(id *)(a1 + 32) setOperationHandlers:v9];

    id v10 = [*(id *)(a1 + 32) operationHandlers];
    id v11 = [v10 lastObject];
    [v11 setGlassesFound:0];

    BOOL v12 = [*(id *)(a1 + 32) enrollView];
    int v13 = [v12 pillContainer];
    int v14 = [v13 squareNeedsPositionLayout];

    if (v14) {
      int64_t v15 = 1000000000;
    }
    else {
      int64_t v15 = 0;
    }
    dispatch_time_t v16 = dispatch_time(0, v15);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_52;
    v17[3] = &unk_1E6EA2268;
    objc_copyWeak(&v19, (id *)(a1 + 40));
    id v18 = v2;
    dispatch_after(v16, MEMORY[0x1E4F14428], v17);

    objc_destroyWeak(&v19);
  }
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_52(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v3 = [WeakRetained enrollView];
  [v3 setAlpha:1.0];

  int v4 = [WeakRetained enrollView];
  BOOL v5 = [v4 pillContainer];
  [v5 setHidden:0];

  id v6 = [WeakRetained enrollView];
  [v6 setPillsHidden:0];

  if ([WeakRetained state] == 8)
  {
    id v7 = [WeakRetained getEnrollview];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_2;
    v10[3] = &unk_1E6EA2180;
    v10[4] = WeakRetained;
    id v11 = *(id *)(a1 + 32);
    [v7 setState:6 completion:v10];
  }
  else
  {
    BOOL v8 = [*(id *)(a1 + 32) enrollOperation];
    id v9 = [*(id *)(a1 + 32) identity];
    [WeakRetained enrollOperation:v8 finishedWithIdentity:v9 animateImmediately:1];
  }
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_2(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [*(id *)(a1 + 40) enrollOperation];
  uint64_t v3 = [*(id *)(a1 + 40) identity];
  [v2 enrollOperation:v4 finishedWithIdentity:v3 animateImmediately:1];
}

void __85__BKUIPearlEnrollViewController_ButtonActionWithNavigation___handleGlassesSkipAction__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained currentOperationHandler];
  id v2 = [WeakRetained currentOperationHandler];
  uint64_t v3 = [v2 enrollOperation];
  [v3 setDelegate:v1];
}

+ (void)preloadWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(BKUIPearlEnrollControllerPreloadedState);
  BOOL v5 = dispatch_group_create();
  id v6 = dispatch_get_global_queue(25, 0);
  dispatch_group_enter(v5);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke;
  block[3] = &unk_1E6EA2180;
  id v7 = v4;
  v22 = v7;
  BOOL v8 = v5;
  int v23 = v8;
  dispatch_async(v6, block);
  dispatch_group_enter(v8);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_6;
  v17[3] = &unk_1E6EA21A8;
  id v18 = v6;
  id v9 = v7;
  id v19 = v9;
  int v20 = v8;
  id v10 = v8;
  id v11 = v6;
  dispatch_async(MEMORY[0x1E4F14428], v17);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_9;
  v14[3] = &unk_1E6EA2C98;
  int64_t v15 = v9;
  id v16 = v3;
  BOOL v12 = v9;
  id v13 = v3;
  dispatch_group_notify(v10, v11, v14);
}

void __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke(uint64_t a1)
{
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: Will create audio session", buf, 2u);
  }

  id v3 = objc_alloc_init(BKUIPearlAudioSession);
  [*(id *)(a1 + 32) cacheAudioSession:v3];
  id v4 = _BKUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v5 = 0;
    _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Did finish create audio session", v5, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_6(uint64_t a1)
{
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: Will create video capture session", buf, 2u);
  }

  id v3 = objc_alloc_init(BKUIPearlVideoCaptureSession);
  id v4 = _BKUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Did finish create video capture session", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_8;
  block[3] = &unk_1E6EA21A8;
  BOOL v8 = v3;
  BOOL v5 = *(NSObject **)(a1 + 32);
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v6 = v3;
  dispatch_async(v5, block);
}

void __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_8(uint64_t a1)
{
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: Will start video capture session", buf, 2u);
  }

  [*(id *)(a1 + 32) startCapture];
  [*(id *)(a1 + 40) cacheVideoCaptureSession:*(void *)(a1 + 32)];
  id v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "Pearl: Did start video capture session", v4, 2u);
  }

  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

uint64_t __55__BKUIPearlEnrollViewController_preloadWithCompletion___block_invoke_9(uint64_t a1)
{
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Pearl: All preloading complete", v4, 2u);
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(uint64_t, void))(result + 16))(result, *(void *)(a1 + 32));
  }
  return result;
}

- (BKUIPearlEnrollViewController)initWithPreloadedState:(id)a3
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v24.receiver = self;
  v24.super_class = (Class)BKUIPearlEnrollViewController;
  id v6 = [(BKUIPearlEnrollViewController *)&v24 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_preloadedState, a3);
    dispatch_semaphore_t v8 = dispatch_semaphore_create(0);
    stateSema = v7->_stateSema;
    v7->_stateSema = (OS_dispatch_semaphore *)v8;

    id v10 = objc_alloc_init(BKUIPearlEnrollAudioManager);
    audioManager = v7->_audioManager;
    v7->_audioManager = v10;

    [(BKUIPearlEnrollAudioManager *)v7->_audioManager setStateDelegate:v7];
    [(BKUIPearlEnrollAudioManager *)v7->_audioManager setPreloadedState:v7->_preloadedState];
    uint64_t v12 = objc_opt_new();
    analyticsManager = v7->_analyticsManager;
    v7->_analyticsManager = (BKUIAnalyticsManager *)v12;

    int v14 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v14 addObserver:v7 selector:sel_didBecomeActive_ name:*MEMORY[0x1E4F43648] object:0];

    int64_t v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 addObserver:v7 selector:sel_willResignActive_ name:*MEMORY[0x1E4F43710] object:0];

    id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v16 addObserver:v7 selector:sel_didEnterBackground_ name:*MEMORY[0x1E4F43660] object:0];

    id v17 = [[BKUIFaceIDEnrollOperationsHandler alloc] initWithBKPearlEnrollmentType:1];
    v25[0] = v17;
    id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    uint64_t v19 = [v18 mutableCopy];
    operationHandlers = v7->_operationHandlers;
    v7->_operationHandlers = (NSMutableArray *)v19;

    v21 = objc_alloc_init(_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager);
    workItemsManager = v7->_workItemsManager;
    v7->_workItemsManager = v21;
  }
  return v7;
}

- (id)currentOperationHandler
{
  id v2 = [(BKUIPearlEnrollViewController *)self operationHandlers];
  id v3 = [v2 firstObject];

  return v3;
}

- (void)setEnrollmentConfiguration:(unint64_t)a3
{
  if (a3 == 2) {
    unint64_t v4 = 3;
  }
  else {
    unint64_t v4 = a3;
  }
  BOOL v5 = [(BKUIPearlEnrollViewController *)self inBuddy];
  id v10 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  id v6 = [v10 credential];
  id v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  dispatch_semaphore_t v8 = [v7 externalizedAuthContext];
  id v9 = +[BKUIFaceIDEnrollOperationsHandler handlersForEnrollmentConfiguration:v4 inBuddy:v5 delegate:self credential:v6 externalizedAuthContext:v8];
  [(BKUIPearlEnrollViewController *)self setOperationHandlers:v9];
}

- (unint64_t)enrollmentConfiguration
{
  id v2 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  unint64_t v3 = [v2 enrollmentConfiguration];

  return v3;
}

- (id)getEnrollview
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  enrollView = self->_enrollView;

  return enrollView;
}

- (void)cleanupEnrollView
{
  unint64_t v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: cleanupEnrollView", v7, 2u);
  }

  unint64_t v4 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v4 postEnrollDeActivate];

  BOOL v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v5 cleanupEnroll];

  id v6 = [(BKUIPearlEnrollViewController *)self audioManager];
  [v6 cleanupHapticsAndSound];

  [(BKUIPearlEnrollViewController *)self setOperationHandlers:0];
}

- (void)_endEnrollFlowWithError:(id)a3
{
  id v7 = a3;
  [(BKUIPearlEnrollViewController *)self cleanupEnrollView];
  unint64_t v4 = [(BKUIPearlEnrollViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if (v5)
  {
    id v6 = [(BKUIPearlEnrollViewController *)self delegate];
    [v6 pearlEnrollViewController:self finishedEnrollWithError:v7];
  }
}

- (void)endEnrollFlowWithError:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localizedDescription];
    *(_DWORD *)id buf = 138412290;
    uint64_t v48 = v6;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Pearl: end enroll flow with error %@", buf, 0xCu);
  }
  [(BKUIPearlEnrollViewController *)self traceAnalyticsForEndEnrollFlowWithError:v4];
  id v7 = [v4 domain];
  if ([v7 isEqualToString:@"com.apple.biometrickitui.pearl_enroll"]) {
    BOOL v8 = [v4 code] == -1;
  }
  else {
    BOOL v8 = 0;
  }

  id v9 = [v4 domain];
  if ([v9 isEqualToString:@"com.apple.biometrickitui.pearl_enroll"]) {
    BOOL v10 = [v4 code] == -2;
  }
  else {
    BOOL v10 = 0;
  }

  if (v4) {
    char v11 = v8;
  }
  else {
    char v11 = 1;
  }
  if ((v11 & 1) == 0 && !v10)
  {
    BOOL v12 = [(BKUIPearlEnrollViewController *)self inBuddy];
    id v13 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v14 = [v13 localizedStringForKey:@"ENROLL_FAILED_GENERIC" value:&stru_1F4081468 table:@"Pearl-periocular"];

    int64_t v15 = [v4 domain];
    if ([v15 isEqualToString:@"com.apple.biometrickitui.biokit"])
    {
      uint64_t v16 = [v4 code];

      switch(v16)
      {
        case 5:
          BOOL v42 = v12;
          BOOL v17 = [(BKUIPearlEnrollViewController *)self inBuddy];
          id v18 = @"ENROLL_FAILED_TOO_HOT_SETTINGS";
          uint64_t v19 = @"ENROLL_FAILED_TOO_HOT_BUDDY";
          goto LABEL_28;
        case 6:
          BOOL v27 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v28 = [v27 localizedStringForKey:@"ENROLL_FAILED_DIFFERENT_FACE_TITLE" value:&stru_1F4081468 table:@"Pearl-periocular"];

          v22 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v26 = [v22 localizedStringForKey:@"ENROLL_FAILED_DIFFERENT_FACE_MESSAGE" value:&stru_1F4081468 table:@"Pearl-periocular"];
          uint64_t v25 = 0;
          BOOL v42 = 0;
          int v14 = (void *)v28;
          goto LABEL_36;
        case 7:
          BOOL v42 = v12;
          BOOL v17 = [(BKUIPearlEnrollViewController *)self inBuddy];
          id v18 = @"ENROLL_FAILED_TOO_COLD_SETTINGS";
          uint64_t v19 = @"ENROLL_FAILED_TOO_COLD_BUDDY";
LABEL_28:
          if (v17) {
            id v18 = v19;
          }
          uint64_t v25 = v18;
          v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v22 = [v29 localizedStringForKey:v25 value:&stru_1F4081468 table:@"Pearl-periocular"];
          break;
        case 8:
          BOOL v42 = v12;
          int v30 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          uint64_t v31 = [v30 localizedStringForKey:@"ENROLL_FAILED_INTERLOCKED_TITLE" value:&stru_1F4081468 table:@"Pearl-periocular"];

          BOOL v32 = [(BKUIPearlEnrollViewController *)self inBuddy];
          v33 = @"ENROLL_FAILED_INTERLOCKED_MESSAGE_SETTINGS";
          if (v32) {
            v33 = @"ENROLL_FAILED_INTERLOCKED_MESSAGE_BUDDY";
          }
          uint64_t v25 = v33;
          v29 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
          v22 = [v29 localizedStringForKey:v25 value:&stru_1F4081468 table:@"Pearl-periocular"];
          int v14 = (void *)v31;
          break;
        default:
          BOOL v42 = v12;
          goto LABEL_19;
      }

      v34 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v35 = [v34 userInterfaceIdiom];

      if ((v35 & 0xFFFFFFFFFFFFFFFBLL) != 1) {
        goto LABEL_37;
      }
      v36 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      uint64_t v26 = [v36 localizedStringForKey:v25 value:&stru_1F4081468 table:@"Pearl-j3xx"];

      v22 = v36;
    }
    else
    {
      BOOL v42 = v12;

      uint64_t v16 = 0;
LABEL_19:
      int v20 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      if ([(BKUIPearlEnrollViewController *)self inBuddy]) {
        v21 = @"ENROLL_FAILED_MESSAGE_BUDDY";
      }
      else {
        v21 = @"ENROLL_FAILED_MESSAGE_SETTINGS";
      }
      v22 = [v20 localizedStringForKey:v21 value:&stru_1F4081468 table:@"Pearl-periocular"];

      int v23 = [MEMORY[0x1E4F42948] currentDevice];
      int v24 = objc_msgSend(v23, "bkui_IsInternalInstall");

      uint64_t v25 = 0;
      if (!v24 || !v16) {
        goto LABEL_37;
      }
      uint64_t v26 = objc_msgSend(v22, "stringByAppendingFormat:", @"\nInternal Message: Reason %i", v16);
      uint64_t v25 = 0;
    }
LABEL_36:

    v22 = (void *)v26;
LABEL_37:
    id v37 = +[BKUIAlertController alertControllerWithTitle:v14 message:v22 preferredStyle:1];
    v38 = (void *)MEMORY[0x1E4F42720];
    v39 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v40 = [v39 localizedStringForKey:@"OK" value:&stru_1F4081468 table:@"Pearl-periocular"];
    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __56__BKUIPearlEnrollViewController_endEnrollFlowWithError___block_invoke;
    v43[3] = &unk_1E6EA2CC0;
    BOOL v46 = v42;
    id v44 = v4;
    id v45 = self;
    id v41 = [v38 actionWithTitle:v40 style:0 handler:v43];
    [v37 addAction:v41];

    [(BKUIPearlEnrollViewController *)self presentViewController:v37 animated:1 completion:0];
    goto LABEL_38;
  }
  [(BKUIPearlEnrollViewController *)self _endEnrollFlowWithError:v4];
LABEL_38:
}

void __56__BKUIPearlEnrollViewController_endEnrollFlowWithError___block_invoke(uint64_t a1, void *a2)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(id *)(a1 + 32);
  char v5 = v4;
  if (*(unsigned char *)(a1 + 48))
  {
    id v6 = (void *)MEMORY[0x1E4F28C58];
    if (v4)
    {
      uint64_t v9 = *MEMORY[0x1E4F28A50];
      v10[0] = v4;
      id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
    }
    else
    {
      id v7 = 0;
    }
    BOOL v8 = [v6 errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-2 userInfo:v7];

    if (v5) {
  }
    }
  else
  {
    BOOL v8 = v4;
  }
  [*(id *)(a1 + 40) _endEnrollFlowWithError:v8];
}

- (void)traceAnalyticsForEndEnrollFlowWithError:(id)a3
{
  id v18 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionary];
  char v5 = objc_msgSend(NSNumber, "numberWithBool:", -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy"));
  [v4 setObject:v5 forKey:@"inBuddy"];

  id v6 = [NSNumber numberWithUnsignedInt:self->_state];
  [v4 setObject:v6 forKey:@"enrollmentState"];

  id v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];

  if (v7)
  {
    BOOL v8 = NSNumber;
    uint64_t v9 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    BOOL v10 = objc_msgSend(v8, "numberWithInteger:", objc_msgSend(v9, "enrollmentType"));
    [v4 setObject:v10 forKey:@"enrollmentType"];

    char v11 = NSNumber;
    BOOL v12 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    id v13 = objc_msgSend(v11, "numberWithInteger:", objc_msgSend(v12, "glassesRequirement"));
    [v4 setObject:v13 forKey:@"enrollmentNeedsGlasses"];
  }
  if (v18)
  {
    int v14 = [v18 domain];
    int64_t v15 = objc_msgSend(v14, "stringByAppendingFormat:", @" (%li)", objc_msgSend(v18, "code"));
    [v4 setObject:v15 forKey:@"error"];
  }
  uint64_t v16 = [(BKUIPearlEnrollViewController *)self analyticsManager];
  BOOL v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v4];
  [v16 traceEvent:@"com.apple.BKUI.FaceIDEnrollmentEnded" withPayload:v17];
}

- (void)didBecomeActive:(id)a3
{
  id v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  int v5 = [v4 isActive];

  if (v5)
  {
    id v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Pearl: Resuming enroll due to become active", v7, 2u);
    }

    [(BKUIPearlEnrollViewController *)self _setSuspended:0];
  }
}

- (void)willResignActive:(id)a3
{
  id v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  int v5 = [v4 isActive];

  if (v5)
  {
    id v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Pearl: Suspending enroll due to resign active", v7, 2u);
    }

    [(BKUIPearlEnrollViewController *)self _setSuspended:1];
  }
}

- (void)didEnterBackground:(id)a3
{
  id v4 = _BKUILoggingFacility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id buf = 0;
    _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Entering background now", buf, 2u);
  }

  int v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  if ([v5 isActive])
  {

LABEL_5:
    id v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v16 = 0;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Pearl: Ending enroll due to enter background", v16, 2u);
    }

    if ([(BKUIPearlEnrollViewController *)self hasPeriocularIdentityEnrolled]
      && [(BKUIPearlEnrollViewController *)self enrollmentConfiguration] == 4
      && [(BKUIPearlEnrollViewController *)self inBuddy])
    {
      id v7 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v8 = -2;
LABEL_13:
      BOOL v10 = [v7 errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:v8 userInfo:0];
      [(BKUIPearlEnrollViewController *)self endEnrollFlowWithError:v10];

      return;
    }
    uint64_t v9 = [(BKUIPearlEnrollViewController *)self operationHandlers];
    [v9 enumerateObjectsUsingBlock:&__block_literal_global_8];
LABEL_12:

    id v7 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v8 = -1;
    goto LABEL_13;
  }
  if ((self->_state - 1) >= 9)
  {
  }
  else
  {
    char v11 = [(BKUIPearlEnrollViewController *)self parentViewController];
    BOOL v12 = [v11 navigationController];
    id v13 = [v12 topViewController];
    int v14 = [(BKUIPearlEnrollViewController *)self parentViewController];

    if (v13 == v14) {
      goto LABEL_5;
    }
  }
  if (![(BKUIPearlEnrollViewController *)self inBuddy])
  {
    uint64_t v9 = _BKUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int64_t v15 = 0;
      _os_log_impl(&dword_1E4B6C000, v9, OS_LOG_TYPE_DEFAULT, "Pearl: Ending enroll due to enter background in Settings", v15, 2u);
    }
    goto LABEL_12;
  }
}

uint64_t __52__BKUIPearlEnrollViewController_didEnterBackground___block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancelEnroll];
}

- (void)_setSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Pearl: Set suspended: %i", (uint8_t *)v8, 8u);
  }

  self->_suspended = v3;
  [(NSTimer *)self->_substateDelayTimer invalidate];
  if (self->_state >= 3u)
  {
    id v6 = [(BKUIPearlEnrollViewController *)self enrollView];
    [v6 setSuspended:v3];
  }
  id v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v7 setSuspend:v3];
}

- (void)dealloc
{
  BOOL v3 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v3 cancelCurrentEnrollmentOperationIfUnfinished];

  [(BKUIPearlEnrollView *)self->_enrollView setState:0 completion:0];
  id v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v4 cleanupEnroll];

  int v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self];

  v6.receiver = self;
  v6.super_class = (Class)BKUIPearlEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v6 dealloc];
}

- (BOOL)isModalInPresentation
{
  return [(BKUIPearlEnrollViewController *)self state] > 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKUIPearlEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v9 viewWillAppear:a3];
  id v4 = [(BKUIPearlEnrollViewController *)self navigationController];
  int v5 = [v4 navigationBar];
  [v5 setBarStyle:1];

  objc_super v6 = [(BKUIPearlEnrollViewController *)self view];
  [v6 layoutIfNeeded];

  [(BKUIPearlEnrollViewController *)self _handleEnrollStateOnAppear];
  id v7 = [(BKUIPearlEnrollViewController *)self audioManager];
  [v7 setupSound];

  uint64_t v8 = [(BKUIPearlEnrollViewController *)self audioManager];
  [v8 setUpHaptics];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)BKUIPearlEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v9 viewDidDisappear:a3];
  id v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v4 cancelCurrentEnrollmentOperationIfUnfinished];

  int v5 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v5 didDisappear];

  if ([(BKUIPearlEnrollViewController *)self inBuddy])
  {
    objc_super v6 = +[BKUIStyle sharedStyle];
    id v7 = [(BKUIPearlEnrollViewController *)self parentViewController];
    uint64_t v8 = [v7 navigationController];
    [v6 applyThemeToNavigationController:v8];
  }
}

- (void)forceDarkBackground:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_darkBackground != a3)
  {
    BOOL v4 = a4;
    self->_darkBackground = a3;
    if (self->_state == 10 && !a3)
    {
      [(_UIBackdropView *)self->_darkTrayBackdrop setHidden:1];
      [(_UIBackdropView *)self->_lightTrayBackdrop setHidden:1];
    }
    double v7 = 0.3;
    v8[1] = 3221225472;
    v8[0] = MEMORY[0x1E4F143A8];
    _DWORD v8[2] = __62__BKUIPearlEnrollViewController_forceDarkBackground_animated___block_invoke;
    v8[3] = &unk_1E6EA2858;
    if (!v4) {
      double v7 = 0.0;
    }
    BOOL v9 = a3;
    void v8[4] = self;
    +[UIView bkui_animateWithDuration:animations:](v7, MEMORY[0x1E4F42FF0], v8);
  }
}

void __62__BKUIPearlEnrollViewController_forceDarkBackground_animated___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    [MEMORY[0x1E4F428B8] blackColor];
  }
  else {
  id v9 = [MEMORY[0x1E4F428B8] systemBackgroundColor];
  }
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setBackgroundColor:v9];

  BOOL v3 = [*(id *)(a1 + 32) view];
  BOOL v4 = [v3 superview];
  [v4 setBackgroundColor:v9];

  int v5 = [*(id *)(a1 + 32) enrollView];
  [v5 setBackgroundColor:v9];

  if (*(unsigned char *)(a1 + 40)) {
    double v6 = 1.0;
  }
  else {
    double v6 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 992) setAlpha:v6];
  if (*(unsigned char *)(a1 + 40)) {
    double v7 = 0.0;
  }
  else {
    double v7 = 1.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1000) setAlpha:v7];
  uint64_t v8 = [*(id *)(a1 + 32) instructionView];
  [v8 setDarkMode:*(unsigned __int8 *)(a1 + 40)];

  [*(id *)(a1 + 32) setNeedsStatusBarAppearanceUpdate];
}

- (void)setInSheet:(BOOL)a3
{
  BOOL v3 = a3;
  self->_inSheet = a3;
  id v4 = [(BKUIPearlEnrollViewController *)self getEnrollview];
  [v4 setInSheet:v3];
}

- (BOOL)isGlassesEnrollmentOnly
{
  return [(BKUIPearlEnrollViewController *)self enrollmentConfiguration] == 4;
}

- (void)viewDidLoad
{
  v12[4] = *MEMORY[0x1E4F143B8];
  v11.receiver = self;
  v11.super_class = (Class)BKUIPearlEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v11 viewDidLoad];
  BOOL v3 = _BKUILoggingFacility();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1E4B6C000, v3, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Setting up enrollVC", (uint8_t *)&buf, 2u);
  }

  [(BKUIPearlEnrollViewController *)self _setupUI];
  id v4 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v4 setDelegate:self];

  [(BKUIPearlEnrollViewController *)self setupDebugLabel];
  int v5 = [[BioStreamsEventHelper alloc] initWithBKDeviceType:2 inBuddy:[(BKUIPearlEnrollViewController *)self inBuddy]];
  [(BKUIPearlEnrollViewController *)self setBioStreamEventHelper:v5];

  [(BKUIPearlEnrollViewController *)self setEnrollmentAlreadyHasExistingPeriocularTemplate:[(BKUIPearlEnrollViewController *)self hasPeriocularIdentityEnrolled]];
  objc_initWeak(&buf, self);
  v12[0] = objc_opt_class();
  v12[1] = objc_opt_class();
  v12[2] = objc_opt_class();
  v12[3] = objc_opt_class();
  double v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __44__BKUIPearlEnrollViewController_viewDidLoad__block_invoke;
  v8[3] = &unk_1E6EA2070;
  objc_copyWeak(&v9, &buf);
  double v7 = [(BKUIPearlEnrollViewController *)self registerForTraitChanges:v6 withHandler:v8];
  [(BKUIPearlEnrollViewController *)self setTraitChangeRegistration:v7];

  objc_destroyWeak(&v9);
  objc_destroyWeak(&buf);
}

void __44__BKUIPearlEnrollViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained view];
  [v1 layoutIfNeeded];
}

- (void)setupDebugLabel
{
  BOOL v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
  debugLabel = self->_debugLabel;
  self->_debugLabel = v3;

  int v5 = self->_debugLabel;
  double v6 = [MEMORY[0x1E4F428B8] whiteColor];
  [(UILabel *)v5 setTextColor:v6];

  [(UILabel *)self->_debugLabel setTextAlignment:1];
  [(UILabel *)self->_debugLabel setNumberOfLines:0];
  [(UILabel *)self->_debugLabel setHidden:1];
  double v7 = [(BKUIPearlEnrollViewController *)self view];
  [v7 addSubview:self->_debugLabel];

  if (os_variant_has_internal_ui())
  {
    uint64_t v8 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    int v9 = [v8 BOOLForKey:@"pearlDebugEnroll"];

    if (v9)
    {
      [(BKUIPearlEnrollViewController *)self toggleDebug];
    }
  }
}

- (void)_setupUI
{
  v135[2] = *MEMORY[0x1E4F143B8];
  BOOL v3 = [BKUIPearlEnrollView alloc];
  id v4 = [(BKUIPearlEnrollControllerPreloadedState *)self->_preloadedState acquireCachedVideoCaptureSession];
  int v5 = [(BKUIPearlEnrollView *)v3 initWithVideoCaptureSession:v4 inSheet:[(BKUIPearlEnrollViewController *)self inSheet] squareNeedsPositionLayout:0];
  [(BKUIPearlEnrollViewController *)self setEnrollView:v5];

  double v6 = [(BKUIPearlEnrollViewController *)self view];
  double v7 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v6 addSubview:v7];

  uint64_t v8 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v8 preEnrollActivate];

  int v9 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v9 setTranslatesAutoresizingMaskIntoConstraints:0];

  BOOL v10 = +[BKUIDevice sharedInstance];
  if ([v10 isZoomEnabled])
  {
    objc_super v11 = [MEMORY[0x1E4F42948] currentDevice];
    uint64_t v12 = [v11 userInterfaceIdiom];

    if (v12) {
      double v13 = 480.0;
    }
    else {
      double v13 = 384.000006;
    }
  }
  else
  {

    double v13 = 480.0;
  }
  int v14 = [(BKUIPearlEnrollViewController *)self enrollView];
  int64_t v15 = [v14 heightAnchor];
  uint64_t v16 = [v15 constraintEqualToConstant:v13];
  [(BKUIPearlEnrollViewController *)self setEnrollViewHeightConstraint:v16];

  BOOL v17 = [(BKUIPearlEnrollViewController *)self enrollView];
  id v18 = [v17 topAnchor];
  uint64_t v19 = [(BKUIPearlEnrollViewController *)self view];
  int v20 = [v19 safeAreaLayoutGuide];
  v21 = [v20 topAnchor];
  v22 = [v18 constraintEqualToAnchor:v21];
  [(BKUIPearlEnrollViewController *)self setEnrollViewTopConstraint:v22];

  int v23 = [(BKUIPearlEnrollViewController *)self view];
  [v23 frame];
  double v25 = v24;
  uint64_t v26 = [(BKUIPearlEnrollViewController *)self view];
  [v26 bounds];
  double v28 = v27;

  v29 = -[BKUIButtonTray initWithFrame:]([BKUIButtonTray alloc], "initWithFrame:", 0.0, 0.0, v25, v28);
  int v30 = -[BKUIButtonTray initWithFrame:]([BKUIButtonTray alloc], "initWithFrame:", 0.0, 0.0, v25, v28);
  if ([(BKUIPearlEnrollViewController *)self enrollmentConfiguration] != 4)
  {
    uint64_t v31 = [(BKUIButtonTray *)v30 nextStateButton];
    [v31 setAlpha:1.0];
  }
  BOOL v32 = [BKUIPearlEnrollViewBottomContainer alloc];
  BOOL inBuddy = self->_inBuddy;
  v132 = v29;
  v34 = -[BKUIContainerScrollView initWithFrame:buttonTray:]([BKUIContainerScrollView alloc], "initWithFrame:buttonTray:", v29, 0.0, 0.0, v25, v28);
  v131 = v30;
  uint64_t v35 = -[BKUIContainerScrollView initWithFrame:buttonTray:]([BKUIContainerScrollView alloc], "initWithFrame:buttonTray:", v30, 0.0, 0.0, v25, v28);
  v36 = -[BKUIPearlEnrollViewBottomContainer initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:](v32, "initWithFrame:inBuddy:scrollView:overlapScrollView:delegate:squareNeedsPositionLayout:", inBuddy, v34, v35, self, 0, 0.0, 0.0, v25, v28);
  [(BKUIPearlEnrollViewController *)self setBottomContainer:v36];

  id v37 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v38 = [v37 userInterfaceIdiom];

  unint64_t v39 = 0x1E4F1C000;
  if ((v38 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    id v40 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    id v41 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    [v41 setInstructionBaselineLayoutGuide:v40];

    BOOL v42 = [(BKUIPearlEnrollViewController *)self view];
    id v43 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    id v44 = [v43 instructionBaselineLayoutGuide];
    [v42 addLayoutGuide:v44];

    if ([(BKUIPearlEnrollViewController *)self isDisplayZoomEnabled]) {
      double v45 = 0.64;
    }
    else {
      double v45 = 0.62;
    }
    BOOL v46 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    v47 = [v46 instructionBaselineLayoutGuide];
    uint64_t v48 = [v47 heightAnchor];
    uint64_t v49 = [(BKUIPearlEnrollViewController *)self view];
    v50 = [v49 heightAnchor];
    uint64_t v51 = [v48 constraintEqualToAnchor:v50 multiplier:v45];

    id v52 = [(BKUIPearlEnrollViewController *)self enrollView];
    id v53 = [v52 heightAnchor];
    v54 = [(BKUIPearlEnrollViewController *)self view];
    id v55 = [v54 widthAnchor];
    BOOL v56 = [(BKUIPearlEnrollViewController *)self inSheet];
    double v57 = 1.0;
    if (v56) {
      double v57 = 0.75;
    }
    uint64_t v58 = [v53 constraintEqualToAnchor:v55 multiplier:v57];
    [(BKUIPearlEnrollViewController *)self setEnrollViewHeightConstraint:v58];

    id v59 = objc_alloc_init(MEMORY[0x1E4F42B48]);
    v60 = [(BKUIPearlEnrollViewController *)self view];
    [v60 addLayoutGuide:v59];

    v61 = [v59 topAnchor];
    v62 = [(BKUIPearlEnrollViewController *)self view];
    v63 = [v62 topAnchor];
    v64 = [v61 constraintEqualToAnchor:v63];
    [v64 setActive:1];

    v128 = v59;
    v65 = [v59 heightAnchor];
    v66 = [(BKUIPearlEnrollViewController *)self view];
    v67 = [v66 heightAnchor];
    v68 = [v65 constraintEqualToAnchor:v67 multiplier:0.07];
    [v68 setActive:1];

    v69 = [(BKUIPearlEnrollViewController *)self enrollView];
    v70 = [v69 topAnchor];
    v71 = [v59 bottomAnchor];
    v72 = [v70 constraintEqualToAnchor:v71];
    [(BKUIPearlEnrollViewController *)self setEnrollViewTopConstraint:v72];

    v73 = (void *)MEMORY[0x1E4F28DC8];
    v74 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    v75 = [v74 instructionBaselineLayoutGuide];
    v76 = [v75 topAnchor];
    v77 = [(BKUIPearlEnrollViewController *)self view];
    v78 = [v77 topAnchor];
    v79 = [v76 constraintEqualToAnchor:v78];
    v135[0] = v79;
    v135[1] = v51;
    v80 = (void *)v51;
    v81 = [MEMORY[0x1E4F1C978] arrayWithObjects:v135 count:2];
    v82 = v73;
    unint64_t v39 = 0x1E4F1C000uLL;
    [v82 activateConstraints:v81];
  }
  v120 = (void *)MEMORY[0x1E4F28DC8];
  v129 = [(BKUIPearlEnrollViewController *)self enrollViewHeightConstraint];
  v134[0] = v129;
  v126 = [(BKUIPearlEnrollViewController *)self enrollViewTopConstraint];
  v134[1] = v126;
  v124 = [(BKUIPearlEnrollViewController *)self enrollView];
  v122 = [v124 widthAnchor];
  v83 = [(BKUIPearlEnrollViewController *)self view];
  v84 = [v83 widthAnchor];
  v85 = [v122 constraintEqualToAnchor:v84];
  v134[2] = v85;
  v86 = [(BKUIPearlEnrollViewController *)self enrollView];
  v87 = [v86 centerXAnchor];
  v88 = [(BKUIPearlEnrollViewController *)self view];
  v89 = [v88 centerXAnchor];
  v90 = [v87 constraintEqualToAnchor:v89];
  v134[3] = v90;
  v91 = [*(id *)(v39 + 2424) arrayWithObjects:v134 count:4];
  [v120 activateConstraints:v91];

  v92 = [MEMORY[0x1E4F42948] currentDevice];
  LODWORD(v84) = objc_msgSend(v92, "bkui_IsInternalInstall");

  if (v84)
  {
    v93 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel_toggleDebugAndSave];
    [v93 setNumberOfTouchesRequired:3];
    v94 = [(BKUIPearlEnrollViewController *)self view];
    [v94 addGestureRecognizer:v93];
  }
  v95 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v95 setTranslatesAutoresizingMaskIntoConstraints:0];

  v96 = [(BKUIPearlEnrollViewController *)self view];
  v97 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v96 addSubview:v97];

  v98 = [MEMORY[0x1E4F42948] currentDevice];
  uint64_t v99 = [v98 userInterfaceIdiom];

  v100 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v101 = [v100 topAnchor];
  if ((v99 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v102 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    v103 = [v102 instructionBaselineLayoutGuide];
    v104 = [v103 bottomAnchor];
    v105 = [v101 constraintEqualToAnchor:v104];
    [v105 setActive:1];
  }
  else
  {
    v102 = [(BKUIPearlEnrollViewController *)self getEnrollview];
    v103 = [v102 bottomAnchor];
    v104 = [v101 constraintEqualToAnchor:v103 constant:-47.0];
    [v104 setActive:1];
  }

  v118 = (void *)MEMORY[0x1E4F28DC8];
  v130 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v125 = [v130 bottomAnchor];
  v127 = [(BKUIPearlEnrollViewController *)self view];
  v123 = [v127 bottomAnchor];
  v121 = [v125 constraintEqualToAnchor:v123];
  v133[0] = v121;
  v119 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v117 = [v119 leadingAnchor];
  v106 = [(BKUIPearlEnrollViewController *)self view];
  v107 = [v106 leadingAnchor];
  v108 = [v117 constraintEqualToAnchor:v107];
  v133[1] = v108;
  v109 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  v110 = [v109 trailingAnchor];
  v111 = [(BKUIPearlEnrollViewController *)self view];
  v112 = [v111 trailingAnchor];
  v113 = [v110 constraintEqualToAnchor:v112];
  v133[2] = v113;
  v114 = [MEMORY[0x1E4F1C978] arrayWithObjects:v133 count:3];
  [v118 activateConstraints:v114];

  v115 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v115 setupInitialUI];

  [(BKUIPearlEnrollViewController *)self _updateLeftBarButtonItem];
  [(BKUIPearlEnrollViewController *)self forceDarkBackground:1 animated:1];
  v116 = [(BKUIPearlEnrollViewController *)self buttonTray];
  [v116 updateButtonLayout];
}

- (BKUIPearlInstructionView)instructionView
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  BOOL v3 = [v2 instructionView];

  return (BKUIPearlInstructionView *)v3;
}

- (BKUIPearlEnrollView)enrollView
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  enrollView = self->_enrollView;

  return enrollView;
}

- (BKUIPearlEnrollViewBottomContainer)bottomContainer
{
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  bottomContainer = self->_bottomContainer;

  return bottomContainer;
}

- (void)viewDidLayoutSubviews
{
  v17.receiver = self;
  v17.super_class = (Class)BKUIPearlEnrollViewController;
  [(BKUIPearlEnrollViewController *)&v17 viewDidLayoutSubviews];
  BOOL v3 = [(BKUIPearlEnrollViewController *)self view];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  CGFloat v11 = v10;

  [(UILabel *)self->_debugLabel frame];
  -[UILabel textRectForBounds:limitedToNumberOfLines:](self->_debugLabel, "textRectForBounds:limitedToNumberOfLines:", 3, 0.0, 0.0, v9 * 0.9, 1.79769313e308);
  double v13 = v12;
  float v14 = (v9 - v9 * 0.9) * 0.5;
  double v15 = floorf(v14);
  v18.origin.x = v5;
  v18.origin.y = v7;
  v18.size.width = v9;
  v18.size.height = v11;
  -[UILabel setFrame:](self->_debugLabel, "setFrame:", v15, CGRectGetMaxY(v18) - v13 + -10.0, v9 * 0.9, v13);
  uint64_t v16 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v16 setNeedsLayout];
}

- (void)_updateLeftBarButtonItem
{
  int state = self->_state;
  if (state == 10)
  {
    CGFloat v7 = [(BKUIPearlEnrollViewController *)self parentViewController];
    double v8 = [v7 navigationItem];
    [v8 setLeftBarButtonItem:0];

    id v11 = [(BKUIPearlEnrollViewController *)self parentViewController];
    double v9 = [v11 navigationItem];
    [v9 setHidesBackButton:1];
  }
  else
  {
    if (state == 9)
    {
      id v4 = objc_alloc(MEMORY[0x1E4F427C0]);
      CGFloat v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      double v6 = [v5 localizedStringForKey:@"BACK" value:&stru_1F4081468 table:@"Pearl-periocular"];
      id v11 = (id)[v4 initWithTitle:v6 style:0 target:self action:sel_returnToEnroll];

      [v11 _setShowsBackButtonIndicator:1];
    }
    else
    {
      id v11 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel_cancelEnroll];
    }
    double v9 = [(BKUIPearlEnrollViewController *)self parentViewController];
    double v10 = [v9 navigationItem];
    [v10 setLeftBarButtonItem:v11];
  }
}

- (int64_t)preferredStatusBarStyle
{
  return self->_darkBackground;
}

- (id)_nextStateButtonTitleForState:(int)a3
{
  return [(BKUIPearlEnrollViewController *)self _nextStateButtonTitleForState:*(void *)&a3 subState:self->_substate];
}

- (id)_nextStateButtonTitleForState:(int)a3 subState:(int)a4
{
  CGFloat v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  if ([v7 supportsPeriocularEnrollment]) {
    BOOL v8 = [(BKUIPearlEnrollViewController *)self enrollmentConfiguration] != 0;
  }
  else {
    BOOL v8 = 0;
  }

  double v9 = 0;
  switch(a3)
  {
    case 2:
      if (a4 == 12) {
        goto LABEL_34;
      }
      double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v11 = v10;
      double v12 = @"START_ENROLL";
      goto LABEL_36;
    case 6:
      double v13 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      if ([v13 supportsPeriocularEnrollment])
      {
        unint64_t v14 = [(BKUIPearlEnrollViewController *)self enrollmentConfiguration];

        if (v14 == 1) {
          goto LABEL_34;
        }
      }
      else
      {
      }
      goto LABEL_35;
    case 8:
      if (![(BKUIPearlEnrollViewController *)self enrollmentConfiguration])
      {
        int v16 = 1;
        if (v8) {
          goto LABEL_24;
        }
LABEL_30:
        int v24 = 0;
        goto LABEL_33;
      }
      if (![(BKUIPearlEnrollViewController *)self isFinalEnrollment])
      {
        int v16 = 0;
        if (v8) {
          goto LABEL_24;
        }
        goto LABEL_30;
      }
      double v15 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      int v16 = [v15 glassesFound] ^ 1;

      if (!v8) {
        goto LABEL_30;
      }
LABEL_24:
      v21 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      if ([v21 glassesFound])
      {
        v22 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        int v23 = [v22 glassesFound];
        if (a4 == 15) {
          int v24 = 0;
        }
        else {
          int v24 = v23;
        }
      }
      else
      {
        int v24 = 1;
      }

LABEL_33:
      if ((v16 | v24))
      {
LABEL_34:
        double v9 = 0;
      }
      else
      {
LABEL_35:
        double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        id v11 = v10;
        double v12 = @"CONTINUE";
LABEL_36:
        double v9 = [v10 localizedStringForKey:v12 value:&stru_1F4081468 table:@"Pearl-periocular"];
      }
LABEL_37:
      return v9;
    case 9:
      objc_super v17 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      if ([v17 glassesFound])
      {
        CGRect v18 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if (isKindOfClass) {
          goto LABEL_35;
        }
      }
      else
      {
      }
      double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v11 = v10;
      double v12 = @"USE_PARTIAL_CAPTURE";
      goto LABEL_36;
    case 10:
      BOOL v20 = [(BKUIPearlEnrollViewController *)self inBuddy];
      double v10 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      id v11 = v10;
      if (v20) {
        double v12 = @"FINISH_ENROLL_BUTTON_BUDDY";
      }
      else {
        double v12 = @"FINISH_ENROLL_BUTTON_SETTINGS";
      }
      goto LABEL_36;
    default:
      goto LABEL_37;
  }
}

- (id)_escapeHatchTitleForState:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  if (self->_state == 9)
  {
    CGFloat v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v5 glassesFound])
    {
      double v6 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        CGFloat v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        BOOL v8 = [v7 enrollOperation];
        BOOL v9 = v8 == 0;
      }
      else
      {
        BOOL v9 = 0;
      }
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    BOOL v9 = 0;
  }
  if (v3 == 3)
  {
    double v10 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v10 shouldShowRetryUI])
    {
      id v11 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      int v12 = [v11 glassesEnforcementError];

      if (v12)
      {
LABEL_23:
        double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
        int v16 = v15;
        objc_super v17 = @"GLASSES_ENROLL_SKIP";
        goto LABEL_24;
      }
    }
    else
    {
    }
    double v13 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    int v14 = [v13 shouldShowRetryUI];

    if (v14) {
      goto LABEL_17;
    }
  }
  if (objc_msgSend((id)objc_opt_class(), "_shouldShowEscapeHatchForState:inBuddy:", v3, -[BKUIPearlEnrollViewController inBuddy](self, "inBuddy")))
  {
LABEL_17:
    double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    int v16 = v15;
    objc_super v17 = @"SET_UP_LATER_IN_SETTINGS";
LABEL_24:
    int v24 = [v15 localizedStringForKey:v17 value:&stru_1F4081468 table:@"Pearl-periocular"];

    goto LABEL_25;
  }
  CGRect v18 = objc_opt_class();
  uint64_t v19 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  BOOL v20 = [v19 poseStatus];
  if ([v18 _shouldShowAccessibilityOptionForState:v3 poseStatus:v20])
  {
    v21 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v21 bioKitCompletionPercentage];
    double v23 = v22;

    if (v23 >= 1.0)
    {
      double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v16 = v15;
      objc_super v17 = @"ACCESSIBILITY_OPTIONS";
      goto LABEL_24;
    }
  }
  else
  {
  }
  if (v9 || v3 == 8 && [(BKUIPearlEnrollViewController *)self substate] == 15) {
    goto LABEL_23;
  }
  if ([(BKUIPearlEnrollViewController *)self state] == 10)
  {
    uint64_t v26 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    int v27 = [v26 showAddGlassesButton];

    if (v27)
    {
      double v15 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      int v16 = v15;
      objc_super v17 = @"ADD_GLASSES";
      goto LABEL_24;
    }
  }
  int v24 = 0;
LABEL_25:

  return v24;
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4
{
}

- (void)prepareForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  uint64_t v8 = *(void *)&a3;
  v34[1] = *MEMORY[0x1E4F143B8];
  [(BKUIPearlEnrollViewController *)self prepareBottomContainerForAnimationToState:*(void *)&a3 fromState:*(void *)&a4 subState:*(void *)&a5 advancing:a6];
  if (a4 == 8 || a4 == 6)
  {
    double v6 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if (([v6 isEnrollmentAugmentationOnly] & 1) == 0) {
      [(BKUIPearlEnrollViewController *)self state];
    }
  }
  if (a4 == 8 || a4 == 6) {

  }
  double v10 = [(BKUIPearlEnrollViewController *)self _nextStateButtonTitleForState:v8];
  if (v10)
  {
    id v11 = [(BKUIPearlEnrollViewController *)self nextStateButton];
    [v11 setTitle:v10 forState:0];

    int v12 = [(BKUIPearlEnrollViewController *)self nextStateButton];
    double v13 = v12;
    if (v8 == 10) {
      int v14 = @"Done";
    }
    else {
      int v14 = 0;
    }
    [v12 setAccessibilityIdentifier:v14];
  }
  double v15 = [(BKUIPearlEnrollViewController *)self escapeHatchButton];
  int v16 = [(BKUIPearlEnrollViewController *)self _escapeHatchTitleForState:self->_state];
  [v15 setTitle:v16 forState:0];

  objc_super v17 = [(BKUIPearlEnrollViewController *)self nextStateButton];
  v34[0] = v17;
  CGRect v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
  uint64_t v19 = (void *)[v18 mutableCopy];

  BOOL v20 = [(BKUIPearlEnrollViewController *)self escapeHatchButton];

  if (v20)
  {
    v21 = [(BKUIPearlEnrollViewController *)self escapeHatchButton];
    [v19 addObject:v21];
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v22 = v19;
  uint64_t v23 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v30 != v25) {
          objc_enumerationMutation(v22);
        }
        int v27 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend(v27, "setNeedsLayout", (void)v29);
        [v27 layoutIfNeeded];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v24);
  }

  double v28 = [(BKUIPearlEnrollViewController *)self view];
  [v28 setNeedsLayout];
}

- (void)prepareBottomContainerForAnimationToState:(int)a3 fromState:(int)a4 subState:(int)a5 advancing:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a5;
  uint64_t v8 = *(void *)&a4;
  uint64_t v9 = *(void *)&a3;
  id v12 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  id v11 = [(BKUIPearlEnrollViewController *)self view];
  [v12 prepareForAnimationToState:v9 fromState:v8 subState:v7 advancing:v6 parentView:v11];
}

- (void)_setState:(int)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v6 = *(void *)&a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  uint64_t v9 = _BKUILoggingFacility();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = v6;
    _os_log_impl(&dword_1E4B6C000, v9, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Set state %i", (uint8_t *)&buf, 8u);
  }

  if (self->_state != v6)
  {
    double v10 = dispatch_group_create();
    self->_previousState = self->_state;
    [(BKUIPearlEnrollViewController *)self willChangeValueForKey:@"state"];
    self->_int state = v6;
    [(BKUIPearlEnrollViewController *)self didChangeValueForKey:@"state"];
    id v11 = [MEMORY[0x1E4F1C9C8] date];
    stateStart = self->_stateStart;
    self->_stateStart = v11;

    objc_initWeak(&buf, self);
    dispatch_group_enter(v10);
    double v13 = [(BKUIPearlEnrollViewController *)self enrollView];
    int v14 = [(BKUIPearlEnrollViewController *)self enrollView];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke;
    v27[3] = &unk_1E6EA2D08;
    int v31 = v6;
    objc_copyWeak(&v30, &buf);
    id v15 = v13;
    id v28 = v15;
    int v16 = v10;
    long long v29 = v16;
    [v14 setState:v6 completion:v27];

    if (v6 != 3 || self->_previousState == 8) {
      self->_subint state = 0;
    }
    self->_substatePending = 0;
    [(NSTimer *)self->_substateDelayTimer invalidate];
    [(BKUIPearlEnrollViewController *)self prepareForAnimationToState:v6 fromState:self->_previousState];
    if (v5) {
      self->_animatingState = 1;
    }
    [(BKUIPearlEnrollViewController *)self _updateLeftBarButtonItem];
    if (v6 != 3 || self->_previousState == 4)
    {
      objc_super v17 = [(BKUIPearlEnrollViewController *)self audioManager];
      [v17 triggerSoundHapticForTransitionToState:v6 fromState:self->_previousState];
    }
    dispatch_group_enter(v16);
    uint64_t v18 = MEMORY[0x1E4F42FF0];
    if (v5) {
      double v19 = 0.3;
    }
    else {
      double v19 = 0.0;
    }
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_2;
    v26[3] = &unk_1E6EA20C0;
    v26[4] = self;
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_3;
    v24[3] = &unk_1E6EA2D30;
    v24[4] = self;
    BOOL v20 = v16;
    uint64_t v25 = v20;
    +[UIView bkui_animateWithDuration:delay:options:animations:completion:](v19, 0.15, v18, 0, v26, v24);
    if (v6 == 10)
    {
      [(BKUIPearlEnrollViewController *)self forceDarkBackground:0 animated:1];
      if (!+[BKUIUtils containerEnrollmentStyleEnabled])
      {
        v21 = [(BKUIPearlEnrollViewController *)self enrollView];
        [v21 postEnrollDeActivate];
      }
      [(BKUIPearlEnrollViewController *)self animateToSuccessCompletionLayout:[(BKUIPearlEnrollViewController *)self interfaceOrientation]];
    }
    if (v8)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_4;
      block[3] = &unk_1E6EA25E0;
      void block[4] = self;
      id v23 = v8;
      dispatch_group_notify(v20, MEMORY[0x1E4F14428], block);
    }
    objc_destroyWeak(&v30);

    objc_destroyWeak(&buf);
  }
}

void __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    [WeakRetained setState:2 animated:1];
  }
  [*(id *)(a1 + 32) setNeedsLayout];
  [*(id *)(a1 + 32) layoutIfNeeded];
  if (*(_DWORD *)(a1 + 56) == 10
    && +[BKUIUtils containerEnrollmentStyleEnabled])
  {
    [*(id *)(a1 + 32) postEnrollDeActivate];
  }
  uint64_t v3 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v3);
}

uint64_t __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateInstruction];
}

void __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_3(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 1056) = 0;
  [*(id *)(a1 + 32) finalizeInstructionAnimation];
  id v2 = *(NSObject **)(a1 + 40);

  dispatch_group_leave(v2);
}

uint64_t __63__BKUIPearlEnrollViewController__setState_animated_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 976) contentSize];
  double v3 = v2;
  [*(id *)(*(void *)(a1 + 32) + 976) frame];
  double v5 = v4;
  [*(id *)(*(void *)(a1 + 32) + 976) contentInset];
  double v7 = v5 - v6;
  [*(id *)(*(void *)(a1 + 32) + 976) contentInset];
  if (v3 > v7 - v8) {
    [*(id *)(*(void *)(a1 + 32) + 976) flashScrollIndicators];
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v10 = *(uint64_t (**)(void))(result + 16);
    return v10();
  }
  return result;
}

- (void)_setSubstate:(int)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v5 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  double v7 = _BKUILoggingFacility();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)id buf = 67109120;
    int v28 = v5;
    _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "BKUIPearl: Set substate %i", buf, 8u);
  }

  self->_pendingSubunsigned int state = 0;
  self->_substatePending = 0;
  if ((v5 & 0xFFFFFFFE) == 0xE)
  {
    int v8 = 1;
  }
  else
  {
    if (v5) {
      BOOL v9 = 0;
    }
    else {
      BOOL v9 = self->_state == 8;
    }
    int v8 = v9;
  }
  subunsigned int state = self->_substate;
  if (substate != v5 && !self->_suspended)
  {
    unsigned int state = self->_state;
    BOOL v12 = state > 7;
    int v13 = (1 << state) & 0xB8;
    BOOL v14 = v12 || v13 == 0;
    if (!v14 || v8 != 0)
    {
      self->_subunsigned int state = v5;
      int v16 = [(BKUIPearlEnrollViewController *)self enrollView];
      [v16 setNudgesPaused:self->_substate != 0];

      objc_super v17 = [(BKUIPearlEnrollViewController *)self audioManager];
      [v17 triggerSoundHapticForTransitionToSubstate:v5 fromSubstate:substate];

      uint64_t v18 = [(BKUIPearlEnrollViewController *)self instructionView];
      uint64_t v19 = MEMORY[0x1E4F42FF0];
      if (v4) {
        double v20 = 0.15;
      }
      else {
        double v20 = 0.0;
      }
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke;
      v25[3] = &unk_1E6EA20C0;
      id v26 = v18;
      v22[0] = MEMORY[0x1E4F143A8];
      v22[1] = 3221225472;
      v22[2] = __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_2;
      v22[3] = &unk_1E6EA2D58;
      BOOL v24 = v4;
      v22[4] = self;
      id v23 = v26;
      id v21 = v26;
      +[UIView bkui_animateWithDuration:animations:completion:](v20, v19, v25, v22);
    }
  }
}

uint64_t __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:0.0];
}

void __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_2(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) bottomContainer];
  [v2 updateInstructionViewContentForState:*(unsigned int *)(*(void *)(a1 + 32) + 1100) substate:*(unsigned int *)(*(void *)(a1 + 32) + 1104)];

  uint64_t v3 = MEMORY[0x1E4F42FF0];
  if (*(unsigned char *)(a1 + 48)) {
    double v4 = 0.15;
  }
  else {
    double v4 = 0.0;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_3;
  v6[3] = &unk_1E6EA20C0;
  id v7 = *(id *)(a1 + 40);
  +[UIView bkui_animateWithDuration:animations:completion:](v4, v3, v6, 0);
  uint64_t v5 = [*(id *)(a1 + 32) view];
  [v5 setNeedsLayout];
}

uint64_t __55__BKUIPearlEnrollViewController__setSubstate_animated___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) setAlpha:1.0];
}

- (void)setSubstate:(int)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  BOOL v6 = a4;
  uint64_t v7 = *(void *)&a3;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (self->_substatePending) {
    uint64_t v9 = 1072;
  }
  else {
    uint64_t v9 = 1104;
  }
  if (*(_DWORD *)((char *)&self->super.super.super.isa + v9) != a3)
  {
    double v10 = _BKUILoggingFacility();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 134218240;
      double v17 = a5;
      __int16 v18 = 1024;
      int v19 = v7;
      _os_log_impl(&dword_1E4B6C000, v10, OS_LOG_TYPE_DEFAULT, "Invalidating current substate timer and waiting %f to go to %u", buf, 0x12u);
    }

    self->_pendingSubunsigned int state = v7;
    self->_substatePending = 1;
    [(NSTimer *)self->_substateDelayTimer invalidate];
    if (a5 == 0.0)
    {
      [(BKUIPearlEnrollViewController *)self _setSubstate:v7 animated:v6];
    }
    else
    {
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = __65__BKUIPearlEnrollViewController_setSubstate_animated_afterDelay___block_invoke;
      v13[3] = &unk_1E6EA2D80;
      v13[4] = self;
      int v14 = v7;
      BOOL v15 = v6;
      id v11 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:0 repeats:v13 block:a5];
      substateDelayTimer = self->_substateDelayTimer;
      self->_substateDelayTimer = v11;
    }
  }
}

uint64_t __65__BKUIPearlEnrollViewController_setSubstate_animated_afterDelay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setSubstate:*(unsigned int *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 44)];
}

- (void)setState:(int)a3 animated:(BOOL)a4 afterDelay:(double)a5
{
  uint64_t v6 = *(void *)&a3;
  int state = self->_state;
  if (state)
  {
    uint64_t v24 = 0;
    uint64_t v25 = &v24;
    uint64_t v26 = 0x2020000000;
    int v27 = state;
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke;
    aBlock[3] = &unk_1E6EA2DA8;
    aBlock[4] = self;
    int v21 = v6;
    BOOL v22 = a4;
    objc_copyWeak(&v20, &location);
    double v10 = _Block_copy(aBlock);
    id v11 = [(BKUIPearlEnrollViewController *)self workItemsManager];
    uint64_t v12 = *((unsigned int *)v25 + 6);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_3;
    v14[3] = &unk_1E6EA2DF8;
    objc_copyWeak(v17, &location);
    int v18 = v6;
    v17[1] = *(id *)&a5;
    int v16 = &v24;
    id v13 = v10;
    id v15 = v13;
    [v11 submitWorkItemFor:v6 startState:v12 work:v14];

    objc_destroyWeak(v17);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    _Block_object_dispose(&v24, 8);
  }
  else
  {
    -[BKUIPearlEnrollViewController _setState:animated:completion:](self, "_setState:animated:completion:", *(void *)&a3, a4, 0, a5);
  }
}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  uint64_t v3 = *(unsigned int *)(a1 + 48);
  uint64_t v4 = *(unsigned __int8 *)(a1 + 52);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_2;
  v5[3] = &unk_1E6EA2268;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5[4] = *(void *)(a1 + 32);
  [v2 _setState:v3 animated:v4 completion:v5];
  objc_destroyWeak(&v6);
}

uint64_t __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (dispatch_semaphore_t *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained) {
    dispatch_semaphore_signal(WeakRetained[130]);
  }
  uint64_t v3 = *(_DWORD **)(a1 + 32);
  if (v3[275] == 6)
  {
    uint64_t v4 = [v3 currentOperationHandler];
    if ([v4 isEnrollmentAugmentationOnly])
    {
    }
    else
    {
      uint64_t v5 = [*(id *)(a1 + 32) enrollmentConfiguration];

      if (v5) {
        [(dispatch_semaphore_t *)v7 navigateToMidFlowPeriocularSplashScreenWithPrepareAction:0 completionAction:0];
      }
    }
  }

  return MEMORY[0x1F41817F8]();
}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*((_DWORD *)WeakRetained + 275) != *(_DWORD *)(a1 + 64))
  {
    dispatch_time_t v3 = dispatch_time(0, (uint64_t)(*(double *)(a1 + 56) * 1000000000.0));
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_4;
    block[3] = &unk_1E6EA2DD0;
    void block[4] = WeakRetained;
    long long v7 = *(_OWORD *)(a1 + 32);
    id v4 = (id)v7;
    long long v9 = v7;
    int v10 = *(_DWORD *)(a1 + 64);
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
    uint64_t v5 = *((void *)WeakRetained + 130);
    dispatch_time_t v6 = dispatch_time(0, 3000000000);
    dispatch_semaphore_wait(v5, v6);
  }
}

void __62__BKUIPearlEnrollViewController_setState_animated_afterDelay___block_invoke_4(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(_DWORD *)(v2 + 1100);
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v3 == *(_DWORD *)(v4 + 24))
  {
    uint64_t v5 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    v5();
  }
  else if (*(_DWORD *)(a1 + 56) == 5)
  {
    *(_DWORD *)(v4 + 24) = v3;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    dispatch_time_t v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = *(_DWORD *)(a1 + 56);
      int v8 = *(_DWORD *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
      v10[0] = 67109376;
      v10[1] = v7;
      __int16 v11 = 1024;
      int v12 = v8;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "Ignoring state-startingState mismatch and moving to BKUIPearlEnrollStateInitialScanInProgress targetState:%i, startState:%i", (uint8_t *)v10, 0xEu);
    }
  }
  else
  {
    long long v9 = *(NSObject **)(v2 + 1040);
    dispatch_semaphore_signal(v9);
  }
}

- (void)setState:(int)a3 animated:(BOOL)a4
{
}

- (void)clearPendingStateWorkItems
{
  id v2 = [(BKUIPearlEnrollViewController *)self workItemsManager];
  [v2 removeAllWorkItems];
}

- (void)toggleDebug
{
  int v3 = [MEMORY[0x1E4F42948] currentDevice];
  int v4 = objc_msgSend(v3, "bkui_IsInternalInstall");

  if (v4)
  {
    uint64_t v5 = [(BKUIPearlEnrollViewController *)self enrollView];
    dispatch_time_t v6 = [(BKUIPearlEnrollViewController *)self enrollView];
    objc_msgSend(v5, "setDebugOverlayVisible:", objc_msgSend(v6, "debugOverlayVisible") ^ 1);

    debugLabel = self->_debugLabel;
    id v8 = [(BKUIPearlEnrollViewController *)self enrollView];
    -[UILabel setHidden:](debugLabel, "setHidden:", [v8 debugOverlayVisible] ^ 1);
  }
}

- (void)toggleDebugAndSave
{
  [(BKUIPearlEnrollViewController *)self toggleDebug];
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  objc_msgSend(v3, "setBool:forKey:", -[UILabel isHidden](self->_debugLabel, "isHidden") ^ 1, @"pearlDebugEnroll");
}

- (void)_updateDebugLabel
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  statusString = self->_statusString;
  if (statusString)
  {
    progressString = self->_progressString;
    if (progressString)
    {
      uint64_t v5 = [NSString stringWithFormat:@"%@\n%@", statusString, progressString];
      dispatch_time_t v6 = [(UILabel *)self->_debugLabel text];
      char v7 = [v5 isEqualToString:v6];

      if ((v7 & 1) == 0)
      {
        id v8 = _BKUILoggingFacility();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)id buf = 138412290;
          __int16 v11 = v5;
          _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "Status update: %@", buf, 0xCu);
        }

        [(UILabel *)self->_debugLabel setText:v5];
        long long v9 = [(BKUIPearlEnrollViewController *)self view];
        [v9 setNeedsLayout];
      }
    }
  }
}

- (void)setStatus:(id)a3
{
  id v5 = a3;
  if (([v5 isEqualToString:self->_statusString] & 1) == 0)
  {
    objc_storeStrong((id *)&self->_statusString, a3);
    [(BKUIPearlEnrollViewController *)self _updateDebugLabel];
  }
}

- (void)pearlEnrollControllerCompleted
{
  id v3 = [(BKUIPearlEnrollViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(BKUIPearlEnrollViewController *)self delegate];
    [v5 pearlEnrollControllerCompleted:self];
  }
}

- (double)percentOfPillsCompleted
{
  id v2 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v2 percentOfPillsCompleted];
  double v4 = v3;

  return v4;
}

- (void)setInBuddy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = [(BKUIPearlEnrollViewController *)self operationHandlers];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setInbuddy:v3];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  self->_BOOL inBuddy = v3;
}

- (void)enrollView:(id)a3 willNudgeInDirection:(unint64_t)a4 nudgeCount:(unint64_t)a5
{
  if (!self->_substate)
  {
    uint64_t v6 = [(BKUIPearlEnrollViewController *)self instructionView];
    uint64_t v7 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    uint64_t v8 = [v7 localizedStringForKey:@"NUDGE_TEXT" value:&stru_1F4081468 table:@"Pearl-periocular"];
    [v6 setInstruction:v8];

    uint64_t v9 = [(BKUIPearlEnrollViewController *)self instructionView];
    [v9 setDetail:&stru_1F4081468];

    id v10 = [(BKUIPearlEnrollViewController *)self view];
    [v10 setNeedsLayout];
  }
}

- (void)enrollView:(id)a3 didNudgeInDirection:(unint64_t)a4 nudgeCount:(unint64_t)a5
{
  id v6 = a3;
  if ((self->_state | 2) == 7 && !self->_substate)
  {
    id v19 = v6;
    uint64_t v7 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    uint64_t v8 = [v7 _instructionTextForState:self->_state substate:self->_substate];

    uint64_t v9 = [(BKUIPearlEnrollViewController *)self bottomContainer];
    id v10 = [v9 _detailTextForState:self->_state substate:self->_substate];

    long long v11 = [(BKUIPearlEnrollViewController *)self instructionView];
    long long v12 = [v11 instruction];
    if ([v8 isEqualToString:v12])
    {
      long long v13 = [(BKUIPearlEnrollViewController *)self instructionView];
      int v14 = [v13 description];
      char v15 = [v10 isEqualToString:v14];

      if (v15) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    int v16 = [(BKUIPearlEnrollViewController *)self instructionView];
    [v16 setInstruction:v8];

    double v17 = [(BKUIPearlEnrollViewController *)self instructionView];
    [v17 setDetail:v10];

    int v18 = [(BKUIPearlEnrollViewController *)self view];
    [v18 setNeedsLayout];

LABEL_8:
    id v6 = v19;
  }
}

- (void)setCustomInstructionString:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v7 setCustomInstructionString:v6 forState:v4];
}

- (void)setCustomDetailString:(id)a3 forState:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v7 setCustomDetailString:v6 forState:v4];
}

- (void)didReachSmallNudgePeakForEnrollView:(id)a3
{
  id v3 = [(BKUIPearlEnrollViewController *)self audioManager];
  [v3 playHaptic:11095 withDelay:0.0];
}

- (void)didReachLargeNudgePeakForEnrollView:(id)a3
{
  id v3 = [(BKUIPearlEnrollViewController *)self audioManager];
  [v3 playHaptic:17239 withDelay:0.0];
}

- (void)setEnrollMovieViewHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(BKUIPearlEnrollViewController *)self enrollView];
  [v4 setMovieViewHidden:v3];
}

- (void)cancelEnrollForRotationIfNeeded:(int64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = MGGetProductType();
  if (v5 > 2619317133)
  {
    if (v5 == 2619317134) {
      goto LABEL_7;
    }
    uint64_t v6 = 3241053352;
  }
  else
  {
    if (v5 == 555503454) {
      goto LABEL_7;
    }
    uint64_t v6 = 2487868872;
  }
  if (v5 == v6)
  {
LABEL_7:
    if ((unint64_t)(a3 - 1) <= 2)
    {
      id v7 = _BKUILoggingFacility();
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:

        uint64_t v8 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
        [v8 cancelEnrollForRotation];
        goto LABEL_17;
      }
      int v9 = 134217984;
      int64_t v10 = a3;
LABEL_10:
      _os_log_impl(&dword_1E4B6C000, v7, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotationIfNeeded: cancelling now for orientation: %ld", (uint8_t *)&v9, 0xCu);
      goto LABEL_11;
    }
    goto LABEL_15;
  }
  if ((unint64_t)(a3 - 2) < 3)
  {
    id v7 = _BKUILoggingFacility();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_11;
    }
    int v9 = 134217984;
    int64_t v10 = a3;
    goto LABEL_10;
  }
LABEL_15:
  uint64_t v8 = _BKUILoggingFacility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 134217984;
    int64_t v10 = a3;
    _os_log_impl(&dword_1E4B6C000, v8, OS_LOG_TYPE_DEFAULT, "cancelEnrollForRotationIfNeeded: will not cancel for orientation: %ld", (uint8_t *)&v9, 0xCu);
  }
LABEL_17:
}

- (void)animateWithOrientation:(int64_t)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = _BKUILoggingFacility();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 134217984;
    int64_t v7 = a3;
    _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "animateWithOrientation: will cancelEnrollForRotationIfNeeded with orientation: %lu", (uint8_t *)&v6, 0xCu);
  }

  [(BKUIPearlEnrollViewController *)self cancelEnrollForRotationIfNeeded:a3];
  if ([(BKUIPearlEnrollViewController *)self state] == 10) {
    [(BKUIPearlEnrollViewController *)self animateToSuccessCompletionLayout:a3];
  }
}

- (void)animateToSuccessCompletionLayout:(int64_t)a3
{
  id v4 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v4 layoutIfNeeded];

  id v5 = [(BKUIPearlEnrollViewController *)self view];
  [v5 layoutIfNeeded];
}

- (void)primeWithPasscode:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v5 setCredential:v4];
}

- (void)primeWithExternalizedAuthContext:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v5 setExternalizedAuthContext:v4];
}

- (void)refreshEscapeHatchForCurrentState
{
  id v13 = [(BKUIPearlEnrollViewController *)self escapeHatchButton];
  uint64_t v3 = [(BKUIPearlEnrollViewController *)self _escapeHatchTitleForState:self->_state];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = &stru_1F4081468;
  }
  int v6 = v5;

  uint64_t v7 = [v13 titleForState:0];
  uint64_t v8 = (void *)v7;
  if (v7) {
    int v9 = (__CFString *)v7;
  }
  else {
    int v9 = &stru_1F4081468;
  }
  int64_t v10 = v9;

  uint64_t v11 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  if ([v11 shouldShowRetryUI])
  {
  }
  else
  {
    char v12 = [(__CFString *)v10 isEqualToString:v6];

    if (v12) {
      goto LABEL_11;
    }
  }
  [v13 setTitle:v6 forState:0];
  [(BKUIPearlEnrollViewController *)self updateButtonsVisibility];
LABEL_11:
}

- (void)updateButtonsVisibility
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v2 updateButtonVisibility];
}

- (void)animateInstruction
{
  [(BKUIPearlEnrollViewController *)self updateButtonsVisibility];
  id v3 = [(BKUIPearlEnrollViewController *)self view];
  [v3 layoutIfNeeded];
}

- (void)transitionToSuccessFromPeriocularSplash
{
}

void __72__BKUIPearlEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  id v3 = [v2 view];
  id v4 = [v3 layer];
  [v4 removeAllAnimations];

  [MEMORY[0x1E4F39CF8] flush];
  id v5 = [*(id *)(a1 + 32) delegate];
  int v6 = [v5 containerView];
  uint64_t v7 = [*(id *)(a1 + 32) view];
  [v6 bringSubviewToFront:v7];

  uint64_t v8 = [*(id *)(a1 + 32) view];
  objc_msgSend(v8, "setOrigin:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));

  int v9 = +[BKUIPearlEnrollAnimationManager sharedManager];
  uint64_t v10 = *(void *)(a1 + 32);
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  id v13 = __72__BKUIPearlEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2;
  int v14 = &unk_1E6EA20C0;
  uint64_t v15 = v10;
  objc_msgSend(v9, "transitionTo:completion:");
}

uint64_t __72__BKUIPearlEnrollViewController_transitionToSuccessFromPeriocularSplash__block_invoke_2(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  id v3 = [v2 view];
  [v3 removeFromSuperview];

  id v4 = [*(id *)(a1 + 32) parentViewController];
  id v5 = [*(id *)(a1 + 32) midFlowPeriocularSplashController];
  [v4 removeChildViewController:v5];

  int v6 = *(void **)(a1 + 32);

  return [v6 setNeedsStatusBarAppearanceUpdate];
}

- (void)finalizeInstructionAnimation
{
  id v3 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  [v3 finalizeInstructionAnimation];

  [(BKUIPearlInstructionView *)self->_animatingInstructionView removeFromSuperview];
  animatingInstructionView = self->_animatingInstructionView;
  self->_animatingInstructionView = 0;

  id v5 = [(BKUIPearlEnrollViewController *)self view];
  [v5 setNeedsLayout];

  id v6 = [(BKUIPearlEnrollViewController *)self view];
  [v6 layoutIfNeeded];
}

- (void)setExistingIdentity:(id)a3
{
  id v4 = a3;
  id v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v5 setIdentity:v4];
}

- (void)_enableEnrollUI
{
}

- (void)invalidateSubstateTimer
{
}

- (void)startEnroll
{
  id v2 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  [v2 startEnroll];
}

- (void)restartEnroll
{
  if ([(BKUIPearlEnrollViewController *)self state] >= 3
    && [(BKUIPearlEnrollViewController *)self state] != 9
    && [(BKUIPearlEnrollViewController *)self state] != 8
    && [(BKUIPearlEnrollViewController *)self state] != 10)
  {
    id v3 = [(BKUIPearlEnrollViewController *)self getEnrollview];
    [v3 percentOfPillsCompleted];
    double v5 = v4;

    if (v5 < 1.0)
    {
      [(BKUIPearlEnrollViewController *)self _enableEnrollUI];
    }
  }
}

- (void)cancelEnroll
{
  if ([(BKUIPearlEnrollViewController *)self inBuddyGlassesFollowUp])
  {
    id v3 = [(BKUIPearlEnrollViewController *)self delegate];
    [v3 pearlEnrollViewController:self finishedEnrollWithError:0];

    double v4 = _BKUILoggingFacility();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id buf = 0;
      _os_log_impl(&dword_1E4B6C000, v4, OS_LOG_TYPE_DEFAULT, "Pearl: Moving forward in buddy making current followup enrollment as skip. User has already enrolled Pearl + Perioular + Glasses", buf, 2u);
    }
  }
  else
  {
    double v5 = _BKUILoggingFacility();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1E4B6C000, v5, OS_LOG_TYPE_DEFAULT, "Pearl: cancelEnroll", v7, 2u);
    }

    id v6 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v6 cancelEnroll];

    double v4 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.biometrickitui.pearl_enroll" code:-1 userInfo:0];
    [(BKUIPearlEnrollViewController *)self endEnrollFlowWithError:v4];
  }
}

- (void)returnToEnroll
{
  __assert_rtn("-[BKUIPearlEnrollViewController returnToEnroll]", "BKUIPearlEnrollViewController.m", 1220, "_state == BKUIPearlEnrollStatePartialCapture");
}

- (void)showMaskAndGlassesTutorialWithCompletion:(id)a3
{
  id v4 = a3;
  [(BKUIPearlEnrollViewController *)self prepareForAnimationToState:2 fromState:2 subState:12 advancing:1];
  self->_subint state = 12;
  uint64_t v5 = MEMORY[0x1E4F42FF0];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke;
  v9[3] = &unk_1E6EA20C0;
  v9[4] = self;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_2;
  v7[3] = &unk_1E6EA2748;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.3, 0.15, v5, 0, v9, v7);
}

uint64_t __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateInstruction];
}

void __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) finalizeInstructionAnimation];
  id v2 = [*(id *)(a1 + 32) nextStateButton];
  id v3 = [*(id *)(a1 + 32) _nextStateButtonTitleForState:*(unsigned int *)(*(void *)(a1 + 32) + 1100)];
  [v2 setTitle:v3 forState:0];

  id v4 = [*(id *)(a1 + 32) escapeHatchButton];
  uint64_t v5 = [*(id *)(a1 + 32) _escapeHatchTitleForState:*(unsigned int *)(*(void *)(a1 + 32) + 1100)];
  [v4 setTitle:v5 forState:0];

  [*(id *)(a1 + 32) updateButtonsVisibility];
  dispatch_time_t v6 = dispatch_time(0, 1500000000);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  _DWORD v8[2] = __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_3;
  v8[3] = &unk_1E6EA25E0;
  uint64_t v7 = *(void **)(a1 + 40);
  void v8[4] = *(void *)(a1 + 32);
  id v9 = v7;
  dispatch_after(v6, MEMORY[0x1E4F14428], v8);
}

uint64_t __74__BKUIPearlEnrollViewController_showMaskAndGlassesTutorialWithCompletion___block_invoke_3(uint64_t a1)
{
  *(_DWORD *)(*(void *)(a1 + 32) + 1104) = 0;
  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)removeGlassesUI
{
  id v5 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  if ([v5 supportsPeriocularEnrollment])
  {
    unint64_t v3 = [(BKUIPearlEnrollViewController *)self enrollmentConfiguration];

    if (v3)
    {
      dispatch_time_t v4 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke;
      block[3] = &unk_1E6EA20C0;
      void block[4] = self;
      dispatch_after(v4, MEMORY[0x1E4F14428], block);
    }
  }
  else
  {
  }
}

void __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) prepareForAnimationToState:8 fromState:7 subState:15 advancing:1];
  *(_DWORD *)(*(void *)(a1 + 32) + 1104) = 15;
  id v2 = [*(id *)(a1 + 32) nextStateButton];
  unint64_t v3 = [*(id *)(a1 + 32) _nextStateButtonTitleForState:*(unsigned int *)(*(void *)(a1 + 32) + 1100)];
  [v2 setTitle:v3 forState:0];

  dispatch_time_t v4 = [*(id *)(a1 + 32) escapeHatchButton];
  id v5 = [*(id *)(a1 + 32) _escapeHatchTitleForState:*(unsigned int *)(*(void *)(a1 + 32) + 1100)];
  [v4 setTitle:v5 forState:0];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_2;
  v7[3] = &unk_1E6EA20C0;
  uint64_t v8 = *(void *)(a1 + 32);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_3;
  v6[3] = &unk_1E6EA2108;
  void v6[4] = v8;
  +[UIView bkui_animateWithDuration:delay:options:animations:completion:](0.3, 0.15, MEMORY[0x1E4F42FF0], 0, v7, v6);
}

uint64_t __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) animateInstruction];
}

uint64_t __48__BKUIPearlEnrollViewController_removeGlassesUI__block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) finalizeInstructionAnimation];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateButtonsVisibility];
}

- (void)enrollOperation:(id)a3 finishedWithIdentity:(id)a4 animateImmediately:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke;
  aBlock[3] = &unk_1E6EA2680;
  id v10 = v9;
  id v28 = v10;
  uint64_t v29 = self;
  BOOL v30 = v5;
  uint64_t v11 = (void (**)(void))_Block_copy(aBlock);
  if ([(BKUIPearlEnrollViewController *)self isFinalEnrollment]
    || [(BKUIPearlEnrollViewController *)self state] == 9
    && (![(BKUIPearlEnrollViewController *)self enrollmentConfiguration]
     || ([(BKUIPearlEnrollViewController *)self currentOperationHandler],
         uint64_t v12 = objc_claimAutoreleasedReturnValue(),
         char v13 = [v12 supportsPeriocularEnrollment],
         v12,
         (v13 & 1) == 0)))
  {
    if (v5)
    {
      v11[2](v11);
    }
    else
    {
      dispatch_time_t v24 = dispatch_time(0, 400000000);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      void v25[2] = __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke_188;
      v25[3] = &unk_1E6EA2568;
      uint64_t v26 = v11;
      dispatch_after(v24, MEMORY[0x1E4F14428], v25);
    }
  }
  else
  {
    int v14 = [(BKUIPearlEnrollViewController *)self operationHandlers];
    uint64_t v15 = [v14 firstObject];

    int v16 = [(BKUIPearlEnrollViewController *)self operationHandlers];
    [v16 removeObjectAtIndex:0];

    double v17 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v17 setIdentity:v10];

    uint64_t v18 = [v15 glassesFound];
    id v19 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v19 setGlassesFound:v18];

    id v20 = [v15 credential];
    int v21 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v21 setCredential:v20];

    BOOL v22 = [v15 externalizedAuthContext];
    id v23 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v23 setExternalizedAuthContext:v22];

    if ([(BKUIPearlEnrollViewController *)self isFinalEnrollment]
      && [(BKUIPearlEnrollViewController *)self enrollmentConfiguration])
    {
      if ([v10 canAddPeriocularEnrollment]
        && [v15 glassesFound])
      {
        [(BKUIPearlEnrollViewController *)self removeGlassesUI];
      }
      else
      {
        [(BKUIPearlEnrollViewController *)self enrollOperation:v8 finishedWithIdentity:v10 animateImmediately:0];
      }
    }
  }
}

void __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = _BKUILoggingFacility();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    dispatch_time_t v4 = [*(id *)(a1 + 40) getEnrollview];
    [v4 percentOfPillsCompleted];
    int v10 = 138412546;
    uint64_t v11 = v3;
    __int16 v12 = 2048;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1E4B6C000, v2, OS_LOG_TYPE_DEFAULT, "Finished with identity: %@, UI complete = %f", (uint8_t *)&v10, 0x16u);
  }
  [*(id *)(a1 + 40) setStatus:@"Enroll completed"];
  dispatch_time_t v6 = [*(id *)(a1 + 40) currentOperationHandler];
  [v6 setIdentity:*(void *)(a1 + 32)];

  [*(id *)(a1 + 40) pearlEnrollControllerCompleted];
  if (*(unsigned char *)(a1 + 48))
  {
    uint64_t v7 = [*(id *)(a1 + 40) getEnrollview];
    [v7 setPillsHidden:0];

    double v8 = 0.600000024;
    if (*(unsigned char *)(a1 + 48)) {
      double v8 = 0.0;
    }
  }
  else
  {
    double v8 = 0.600000024;
  }
  [*(id *)(a1 + 40) setState:10 animated:1 afterDelay:v8];
  id v9 = [*(id *)(a1 + 40) view];
  [v9 setNeedsLayout];
}

uint64_t __89__BKUIPearlEnrollViewController_enrollOperation_finishedWithIdentity_animateImmediately___block_invoke_188(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)isFinalEnrollment
{
  id v2 = [(BKUIPearlEnrollViewController *)self operationHandlers];
  BOOL v3 = [v2 count] == 1;

  return v3;
}

- (void)_handleEnrollStateOnAppear
{
  if ([(BKUIPearlEnrollViewController *)self isGlassesEnrollmentOnly])
  {
    [(BKUIPearlEnrollViewController *)self setState:3 animated:1];
    id v3 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    [v3 matchUserForSecondPhaseEnrollmentWithCompletionAction:0];
  }
  else
  {
    [(BKUIPearlEnrollViewController *)self setState:2 animated:0];
  }
}

- (BOOL)hasPeriocularIdentityEnrolled
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
  id v3 = [v2 device];
  id v10 = 0;
  dispatch_time_t v4 = [v3 identitiesWithError:&v10];
  id v5 = v10;

  if (v5)
  {
    dispatch_time_t v6 = _BKUILoggingFacility();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)id buf = 138412290;
      id v12 = v5;
      _os_log_impl(&dword_1E4B6C000, v6, OS_LOG_TYPE_DEFAULT, "BKUIPearl:hasPeriocularIdentityEnrolled Error fetching indentity :%@", buf, 0xCu);
    }
    BOOL v7 = 0;
  }
  else
  {
    dispatch_time_t v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_192];
    double v8 = [v4 filteredArrayUsingPredicate:v6];
    BOOL v7 = [v8 count] != 0;
  }
  return v7;
}

uint64_t __62__BKUIPearlEnrollViewController_hasPeriocularIdentityEnrolled__block_invoke(uint64_t a1, void *a2)
{
  return [a2 hasPeriocularEnrollment];
}

- (BOOL)showGlassesSkipUI
{
  if ([(BKUIPearlEnrollViewController *)self state] == 3)
  {
    id v3 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v3 shouldShowRetryUI])
    {
      dispatch_time_t v4 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      char v5 = [v4 glassesEnforcementError];
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  BOOL v6 = [(BKUIPearlEnrollViewController *)self state] == 8
    && [(BKUIPearlEnrollViewController *)self substate] == 15;
  if ([(BKUIPearlEnrollViewController *)self state] > 6)
  {
    char isKindOfClass = 0;
  }
  else
  {
    BOOL v7 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  if (self->_state == 9)
  {
    id v9 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
    if ([v9 glassesFound])
    {
      id v10 = [(BKUIPearlEnrollViewController *)self currentOperationHandler];
      objc_opt_class();
      char v11 = objc_opt_isKindOfClass();
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }
  return (v11 | v5 | v6 | isKindOfClass) & 1;
}

- (UIButton)nextStateButton
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  id v3 = [v2 nextStateButton];

  return (UIButton *)v3;
}

- (UIButton)escapeHatchButton
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  id v3 = [v2 bottomLinkButton];

  return (UIButton *)v3;
}

- (BKUIButtonTray)buttonTray
{
  id v2 = [(BKUIPearlEnrollViewController *)self bottomContainer];
  id v3 = [v2 buttonTray];

  return (BKUIButtonTray *)v3;
}

- (UIView)nextStateButtonContainer
{
  id v2 = [(BKUIPearlEnrollViewController *)self buttonTray];
  id v3 = [v2 nextStateButtonContainer];

  return (UIView *)v3;
}

- (UIButton)retryMatchOperationButton
{
  id v2 = [(BKUIPearlEnrollViewController *)self buttonTray];
  id v3 = [v2 topLinkButton];

  return (UIButton *)v3;
}

- (BKUIPearlEnrollViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BKUIPearlEnrollViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)inBuddy
{
  return self->_inBuddy;
}

- (BOOL)inSheet
{
  return self->_inSheet;
}

- (BOOL)isDisplayZoomEnabled
{
  return self->_isDisplayZoomEnabled;
}

- (void)setIsDisplayZoomEnabled:(BOOL)a3
{
  self->_isDisplayZoomEnabled = a3;
}

- (BOOL)inBuddyGlassesFollowUp
{
  return self->_inBuddyGlassesFollowUp;
}

- (void)setInBuddyGlassesFollowUp:(BOOL)a3
{
  self->_inBuddyGlassesFollowUp = a3;
}

- (void)setButtonTray:(id)a3
{
}

- (NSLayoutConstraint)enrollViewHeightConstraint
{
  return self->_enrollViewHeightConstraint;
}

- (void)setEnrollViewHeightConstraint:(id)a3
{
}

- (NSString)progressString
{
  return self->_progressString;
}

- (void)setProgressString:(id)a3
{
}

- (int)previousState
{
  return self->_previousState;
}

- (void)setPreviousState:(int)a3
{
  self->_previousState = a3;
}

- (BOOL)darkBackground
{
  return self->_darkBackground;
}

- (void)setDarkBackground:(BOOL)a3
{
  self->_darkBackground = a3;
}

- (NSLayoutConstraint)enrollViewTopConstraint
{
  return self->_enrollViewTopConstraint;
}

- (void)setEnrollViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintTall
{
  return self->_nextStateButtonContainerBottomConstraintTall;
}

- (void)setNextStateButtonContainerBottomConstraintTall:(id)a3
{
}

- (NSLayoutConstraint)nextStateButtonContainerBottomConstraintShort
{
  return self->_nextStateButtonContainerBottomConstraintShort;
}

- (void)setNextStateButtonContainerBottomConstraintShort:(id)a3
{
}

- (NSLayoutConstraint)instructionViewTopConstraint
{
  return self->_instructionViewTopConstraint;
}

- (void)setInstructionViewTopConstraint:(id)a3
{
}

- (BKUIPearlInstructionView)animatingInstructionView
{
  return self->_animatingInstructionView;
}

- (void)setAnimatingInstructionView:(id)a3
{
}

- (NSArray)instructionViewConstraints
{
  return self->_instructionViewConstraints;
}

- (void)setInstructionViewConstraints:(id)a3
{
}

- (BKUIPearlEnrollAudioManager)audioManager
{
  return self->_audioManager;
}

- (void)setAudioManager:(id)a3
{
}

- (UILayoutGuide)instructionBaselineLayoutGuide
{
  return self->_instructionBaselineLayoutGuide;
}

- (void)setInstructionBaselineLayoutGuide:(id)a3
{
}

- (_TtC14BiometricKitUI35EnrollStateDispatchWorkItemsManager)workItemsManager
{
  return self->_workItemsManager;
}

- (void)setWorkItemsManager:(id)a3
{
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
}

- (BKUIAnalyticsManager)analyticsManager
{
  return (BKUIAnalyticsManager *)objc_getProperty(self, a2, 1224, 1);
}

- (void)setAnalyticsManager:(id)a3
{
}

- (void)setBottomContainer:(id)a3
{
}

- (int)state
{
  return self->_state;
}

- (void)setState:(int)a3
{
  self->_int state = a3;
}

- (int)substate
{
  return self->_substate;
}

- (void)setSubstate:(int)a3
{
  self->_subint state = a3;
}

- (BKUIPeriocularEnableSplashViewController)midFlowPeriocularSplashController
{
  return self->_midFlowPeriocularSplashController;
}

- (void)setMidFlowPeriocularSplashController:(id)a3
{
}

- (void)setRetryMatchOperationButton:(id)a3
{
}

- (void)setNextStateButtonContainer:(id)a3
{
}

- (void)setNextStateButton:(id)a3
{
}

- (void)setEscapeHatchButton:(id)a3
{
}

- (void)setEnrollView:(id)a3
{
}

- (NSMutableArray)operationHandlers
{
  return self->_operationHandlers;
}

- (void)setOperationHandlers:(id)a3
{
}

- (BKUIPearlEnrollControllerPreloadedState)preloadedState
{
  return self->_preloadedState;
}

- (void)setPreloadedState:(id)a3
{
}

- (int64_t)glassesMidFlowUpsell
{
  return self->_glassesMidFlowUpsell;
}

- (void)setGlassesMidFlowUpsell:(int64_t)a3
{
  self->_glassesMidFlowUpsell = a3;
}

- (void)setInstructionView:(id)a3
{
}

- (BioStreamsEventHelper)bioStreamEventHelper
{
  return self->_bioStreamEventHelper;
}

- (void)setBioStreamEventHelper:(id)a3
{
}

- (BOOL)enrollmentAlreadyHasExistingPeriocularTemplate
{
  return self->_enrollmentAlreadyHasExistingPeriocularTemplate;
}

- (void)setEnrollmentAlreadyHasExistingPeriocularTemplate:(BOOL)a3
{
  self->_enrollmentAlreadyHasExistingPeriocularTemplate = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bioStreamEventHelper, 0);
  objc_storeStrong((id *)&self->_instructionView, 0);
  objc_storeStrong((id *)&self->_preloadedState, 0);
  objc_storeStrong((id *)&self->_operationHandlers, 0);
  objc_storeStrong((id *)&self->_enrollView, 0);
  objc_storeStrong((id *)&self->_escapeHatchButton, 0);
  objc_storeStrong((id *)&self->_nextStateButton, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainer, 0);
  objc_storeStrong((id *)&self->_retryMatchOperationButton, 0);
  objc_storeStrong((id *)&self->_midFlowPeriocularSplashController, 0);
  objc_storeStrong((id *)&self->_bottomContainer, 0);
  objc_storeStrong((id *)&self->_analyticsManager, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_workItemsManager, 0);
  objc_storeStrong((id *)&self->_instructionBaselineLayoutGuide, 0);
  objc_storeStrong((id *)&self->_audioManager, 0);
  objc_storeStrong((id *)&self->_instructionViewConstraints, 0);
  objc_storeStrong((id *)&self->_animatingInstructionView, 0);
  objc_storeStrong((id *)&self->_instructionViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintShort, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerBottomConstraintTall, 0);
  objc_storeStrong((id *)&self->_enrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_progressString, 0);
  objc_storeStrong((id *)&self->_enrollViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_buttonTray, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_substateDelayTimer, 0);
  objc_storeStrong((id *)&self->_lastFaceFoundDate, 0);
  objc_storeStrong((id *)&self->_stateStart, 0);
  objc_storeStrong((id *)&self->_stateSema, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_debugLabel, 0);
  objc_storeStrong((id *)&self->_buttonTrayToNextStateButtonContainerTopConstraint, 0);
  objc_storeStrong((id *)&self->_lightTrayBackdrop, 0);
  objc_storeStrong((id *)&self->_darkTrayBackdrop, 0);
  objc_storeStrong((id *)&self->_nextStateButtonContainerHorizontalPositionConstraint, 0);

  objc_storeStrong((id *)&self->_scrollView, 0);
}

void __135__BKUIPearlEnrollViewController_ButtonActionWithNavigation__navigateToMidFlowPeriocularSplashScreenWithPrepareAction_completionAction___block_invoke_3_cold_1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1E4B6C000, log, OS_LOG_TYPE_FAULT, "should always have midFlowPeriocularSplashShowing in side of this flow.", v1, 2u);
}

@end