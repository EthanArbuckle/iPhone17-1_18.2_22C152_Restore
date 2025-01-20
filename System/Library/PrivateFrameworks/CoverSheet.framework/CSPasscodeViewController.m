@interface CSPasscodeViewController
- (BOOL)_shouldEmulateInteractivePresentation;
- (BOOL)_shouldUseLightStylePasscodeView;
- (BOOL)biometricButtonsInitiallyVisible;
- (BOOL)confirmedNotInPocket;
- (BOOL)handleEvent:(id)a3;
- (BOOL)presentationCancelsTouches;
- (BOOL)showProudLock;
- (BOOL)useBiometricPresentation;
- (CAFrameRateRange)presentationPreferredFrameRateRange;
- (CSCoverSheetContextProviding)coverSheetContext;
- (CSFaceOcclusionMonitor)faceOcclusionMonitor;
- (CSPasscodeViewController)initWithOptions:(unint64_t)a3;
- (CSPasscodeViewControllerDelegate)delegate;
- (CSWallpaperColorProvider)wallpaperColorProvider;
- (NSString)unlockDestination;
- (SBUIProudLockContainerViewController)proudLockContainerViewControllerToUpdate;
- (UIColor)wallpaperAverageColorOverride;
- (id)_effectiveAverageWallpaperColor;
- (id)_newDisplayLayoutElement;
- (int64_t)presentationPriority;
- (int64_t)presentationStyle;
- (int64_t)presentationTransition;
- (int64_t)presentationType;
- (unsigned)presentationFrameRateRangeReason;
- (void)_emulateInteractivePresentation;
- (void)_passcodeLockViewPasscodeEntered:(id)a3 authenticationType:(unint64_t)a4;
- (void)_setBiometricAuthenticationEnabledForTransientAppearanceTransition:(BOOL)a3;
- (void)_updateProudLockViewControllerConfiguration;
- (void)_updateReduceTransparencyBackingColor;
- (void)aggregateAppearance:(id)a3;
- (void)aggregateBehavior:(id)a3;
- (void)beginInteractivePresentationTransitionForInitialTransition:(BOOL)a3;
- (void)commitingToEndTransitionToPresented:(BOOL)a3 forInitialTransition:(BOOL)a4;
- (void)dealloc;
- (void)endInteractiveTransitionToPresented:(BOOL)a3 forInitialTransition:(BOOL)a4;
- (void)loadView;
- (void)passcodeLockViewCancelButtonPressed:(id)a3;
- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3;
- (void)passcodeLockViewPasscodeDidChange:(id)a3;
- (void)passcodeLockViewPasscodeEntered:(id)a3;
- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3;
- (void)passcodeLockViewStateChange:(id)a3;
- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5;
- (void)setBiometricButtonsInitiallyVisible:(BOOL)a3;
- (void)setConfirmedNotInPocket:(BOOL)a3;
- (void)setCoverSheetContext:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFaceOcclusionMonitor:(id)a3;
- (void)setProudLockContainerViewControllerToUpdate:(id)a3;
- (void)setShowProudLock:(BOOL)a3;
- (void)setUnlockDestination:(id)a3;
- (void)setUseBiometricPresentation:(BOOL)a3;
- (void)setWallpaperAverageColorOverride:(id)a3;
- (void)setWallpaperColorProvider:(id)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateInteractiveTransitionWithPercent:(double)a3 forInitialTransition:(BOOL)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CSPasscodeViewController

- (CSPasscodeViewController)initWithOptions:(unint64_t)a3
{
  v10.receiver = self;
  v10.super_class = (Class)CSPasscodeViewController;
  v4 = [(CSPasscodeViewController *)&v10 init];
  v5 = v4;
  if (v4)
  {
    v4->_options = a3;
    v6 = +[CSLockScreenDomain rootSettings];
    uint64_t v7 = [v6 pearlSettings];
    pearlSettings = v5->_pearlSettings;
    v5->_pearlSettings = (CSLockScreenPearlSettings *)v7;

    [(PTSettings *)v5->_pearlSettings addKeyObserver:v5];
    [(CSPasscodeViewController *)v5 _updateProudLockViewControllerConfiguration];
  }
  return v5;
}

- (void)dealloc
{
  v3 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationManager];
  v4 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  [v3 setBiometricAutoUnlockingDisabled:0 forReason:v4];

  [(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion invalidate];
  [(CSPasscodeViewController *)self _setBiometricAuthenticationEnabledForTransientAppearanceTransition:0];
  v5.receiver = self;
  v5.super_class = (Class)CSPasscodeViewController;
  [(CSCoverSheetViewControllerBase *)&v5 dealloc];
}

- (void)loadView
{
  v27.receiver = self;
  v27.super_class = (Class)CSPasscodeViewController;
  [(CSCoverSheetViewControllerBase *)&v27 loadView];
  v3 = [(CSPasscodeViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  if ([(CSPasscodeViewController *)self _shouldUseLightStylePasscodeView]) {
    [MEMORY[0x1E4FA7CC0] lightPasscodeLockViewForUsersCurrentStyle];
  }
  else {
  v12 = [MEMORY[0x1E4FA7CC0] passcodeLockViewForUsersCurrentStyle];
  }
  passcodeLockView = self->_passcodeLockView;
  self->_passcodeLockView = v12;

  v14 = self->_passcodeLockView;
  v15 = [MEMORY[0x1E4F428B8] clearColor];
  [(SBUIPasscodeLockView_Internal *)v14 setCustomBackgroundColor:v15];

  v16 = self->_passcodeLockView;
  v17 = (void *)[(CSWallpaperColorProvider *)self->_wallpaperColorProvider newLegibilitySettingsProvider];
  [(SBUIPasscodeLockView_Internal *)v16 setBackgroundLegibilitySettingsProvider:v17];

  v18 = self->_passcodeLockView;
  if (self->_options)
  {
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setShowsEmergencyCallButton:0];
  }
  else
  {
    v19 = [(CSCoverSheetContextProviding *)self->_coverSheetContext telephonyStatusProvider];
    -[SBUIPasscodeLockView_Internal setShowsEmergencyCallButton:](v18, "setShowsEmergencyCallButton:", [v19 isEmergencyCallSupported]);
  }
  v20 = self->_passcodeLockView;
  v21 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationStatusProvider];
  -[SBUIPasscodeLockView_Internal _noteDeviceHasBeenUnlockedOnceSinceBoot:](v20, "_noteDeviceHasBeenUnlockedOnceSinceBoot:", [v21 hasAuthenticatedAtLeastOnceSinceBoot]);

  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setScreenOn:1];
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setDelegate:self];
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setShowsProudLock:0];
  [(CSPasscodeViewController *)self _updateProudLockViewControllerConfiguration];
  v22 = self->_passcodeLockView;
  [v3 bounds];
  -[SBUIPasscodeLockView_Internal setFrame:](v22, "setFrame:");
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setAutoresizingMask:18];
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setUsesBiometricPresentation:[(CSPasscodeViewController *)self useBiometricPresentation]];
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setBiometricPresentationAncillaryButtonsVisible:[(CSPasscodeViewController *)self biometricButtonsInitiallyVisible]];
  v23 = self->_passcodeLockView;
  v24 = [(CSPasscodeViewController *)self unlockDestination];
  [(SBUIPasscodeLockView_Internal *)v23 setUnlockDestination:v24];

  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setConfirmedNotInPocket:[(CSPasscodeViewController *)self confirmedNotInPocket]];
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setCanSuggestSwipeToRetry:1];
  [v3 addSubview:self->_passcodeLockView];
  v25 = objc_alloc_init(CSPasscodeBackgroundView);
  backgroundView = self->_backgroundView;
  self->_backgroundView = v25;

  [(CSPasscodeBackgroundView *)self->_backgroundView setAutoresizingMask:18];
  -[CSPasscodeBackgroundView setFrame:](self->_backgroundView, "setFrame:", v5, v7, v9, v11);
  [(CSPasscodeViewController *)self _updateReduceTransparencyBackingColor];
  [v3 addSubview:self->_backgroundView];
  [v3 sendSubviewToBack:self->_backgroundView];
}

- (void)viewDidLoad
{
  v3 = [(CSPasscodeViewController *)self view];
  [(CSCoverSheetViewControllerBase *)self registerView:v3 forRole:3];

  v4.receiver = self;
  v4.super_class = (Class)CSPasscodeViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidLoad];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewWillAppear:](&v9, sel_viewWillAppear_);
  passcodeLockView = self->_passcodeLockView;
  double v6 = [(CSPasscodeViewController *)self proudLockContainerViewControllerToUpdate];
  [(SBUIPasscodeLockView_Internal *)passcodeLockView setOverrideProudLockContainerViewController:v6];

  [(CSPasscodeViewController *)self _setBiometricAuthenticationEnabledForTransientAppearanceTransition:1];
  double v7 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationManager];
  double v8 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  [v7 setBiometricAutoUnlockingDisabled:1 forReason:v8];

  if ([(CSFaceOcclusionMonitor *)self->_faceOcclusionMonitor faceOcclusionsSinceScreenOn] & 1) != 0&& (objc_opt_respondsToSelector())
  {
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView noteBottomFaceHasBeenOccluded];
  }
  if ([(CSFaceOcclusionMonitor *)self->_faceOcclusionMonitor faceOcclusionsSinceScreenOn] & 2) != 0&& (objc_opt_respondsToSelector())
  {
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView noteFaceHasBeenOccluded];
  }
  if (v3) {
    [(id)*MEMORY[0x1E4F43630] _performBlockAfterCATransactionCommits:&__block_literal_global_4];
  }
}

uint64_t __43__CSPasscodeViewController_viewWillAppear___block_invoke()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"DashBoardPasscodePresented" forTest:@"DashBoardPasscode"];
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"DashBoardPasscodePresented" forTest:@"DashBoardPasscode"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CSPasscodeViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidAppear:v3];
  double v5 = +[CSAction actionWithType:3];
  [(CSCoverSheetViewControllerBase *)self sendAction:v5];

  [(CSPasscodeViewController *)self _setBiometricAuthenticationEnabledForTransientAppearanceTransition:0];
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)CSPasscodeViewController;
  -[CSCoverSheetViewControllerBase viewWillDisappear:](&v8, sel_viewWillDisappear_);
  [(CSCoverSheetViewControllerBase *)self rebuildAppearance];
  if (v3) {
    [(id)*MEMORY[0x1E4F43630] _performBlockAfterCATransactionCommits:&__block_literal_global_29];
  }
  double v5 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationManager];
  [v5 setPasscodeVisible:0 animated:v3];

  [(CSPasscodeViewController *)self _setBiometricAuthenticationEnabledForTransientAppearanceTransition:0];
  objc_super v6 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationManager];
  double v7 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  [v6 setBiometricAutoUnlockingDisabled:0 forReason:v7];

  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView resignFirstResponder];
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setOverrideProudLockContainerViewController:0];
}

uint64_t __46__CSPasscodeViewController_viewWillDisappear___block_invoke()
{
  return [(id)*MEMORY[0x1E4F43630] startedSubTest:@"DashBoardPasscodeDismissed" forTest:@"DashBoardPasscode"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  if (a3) {
    [(id)*MEMORY[0x1E4F43630] finishedSubTest:@"DashBoardPasscodeDismissed" forTest:@"DashBoardPasscode"];
  }
  v6.receiver = self;
  v6.super_class = (Class)CSPasscodeViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidDisappear:v3];
  [(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion invalidate];
  sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
  self->_sustainAuthenticationAssertion = 0;

  [(CSPasscodeViewController *)self _setBiometricAuthenticationEnabledForTransientAppearanceTransition:0];
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)CSPasscodeViewController;
  [(CSCoverSheetViewControllerBase *)&v42 aggregateAppearance:v4];
  double v5 = objc_opt_new();
  objc_super v6 = objc_msgSend(v5, "hidden:", -[CSPasscodeViewController showProudLock](self, "showProudLock") ^ 1);
  double v7 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  objc_super v8 = [v6 identifier:v7];
  objc_super v9 = [v8 priority:60];
  double v10 = [v9 prefersInlineCoaching:1];
  double v11 = [v10 supportsMaterialBackground:0];

  [v4 addComponent:v11];
  int v12 = SBUICurrentPasscodeStyleForUser();
  if (v12 == 3)
  {
    uint64_t v13 = [(id)*MEMORY[0x1E4F43630] activeInterfaceOrientation];
    if (v13 == 4 || v13 == 2)
    {
      v14 = +[CSComponent poseidon];
      v15 = [v14 priority:60];
      v16 = [v15 hidden:1];
      [v4 addComponent:v16];
    }
  }
  v17 = [(CSPasscodeViewController *)self delegate];
  uint64_t v18 = [v17 passcodeViewControllerShouldHideStatusBar:self];

  v19 = objc_opt_new();
  v20 = [v19 priority:60];
  v21 = [v20 hidden:v18];
  v22 = [v21 fakeStatusBar:0];
  [v4 addComponent:v22];

  if ([(CSPasscodeViewController *)self _shouldUseLightStylePasscodeView])
  {
    id v23 = objc_alloc(MEMORY[0x1E4F43228]);
    v24 = [MEMORY[0x1E4F428B8] blackColor];
    v25 = (void *)[v23 initWithStyle:2 contentColor:v24];
  }
  else
  {
    v25 = CSGetLegibilitySettingsForBackgroundStyle(7);
  }
  [v4 setLegibilitySettings:v25];

  if (SBFEffectiveHomeButtonType() == 2)
  {
    if (![(SBUIPasscodeLockView_Internal *)self->_passcodeLockView passcodeLockViewState])
    {
      v26 = objc_opt_new();
      objc_super v27 = [v26 priority:60];
      v28 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
      v29 = [v27 identifier:v28];
      v30 = [v29 hidden:1];
      v31 = [v30 suppressTeachableMomentsAnimation:1];
      [v4 addComponent:v31];

LABEL_19:
      goto LABEL_20;
    }
    if ([(SBUIPasscodeLockView_Internal *)self->_passcodeLockView passcodeLockViewState] != 1)
    {
LABEL_20:
      v39 = +[CSComponent controlCenterGrabber];
      v40 = [v39 priority:60];
      v41 = [v40 hidden:1];
      [v4 addComponent:v41];

      goto LABEL_21;
    }
    if (v12 == 3)
    {
      if (__sb__runningInSpringBoard())
      {
        if (SBFEffectiveDeviceClass() != 2) {
          goto LABEL_18;
        }
        goto LABEL_17;
      }
      v32 = [MEMORY[0x1E4F42948] currentDevice];
      uint64_t v33 = [v32 userInterfaceIdiom];

      if (v33 == 1)
      {
LABEL_17:
        v34 = objc_opt_new();
        v35 = [v34 priority:60];
        v36 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
        v37 = [v35 identifier:v36];
        v38 = [v37 suppressTeachableMomentsAnimation:1];
        [v4 addComponent:v38];
      }
    }
LABEL_18:
    v26 = +[CSComponent whitePoint];
    objc_super v27 = [v26 priority:60];
    v28 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
    v29 = [v27 identifier:v28];
    v30 = [v29 hidden:1];
    [v4 addComponent:v30];
    goto LABEL_19;
  }
LABEL_21:
}

- (void)aggregateBehavior:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CSPasscodeViewController;
  id v4 = a3;
  [(CSCoverSheetViewControllerBase *)&v6 aggregateBehavior:v4];
  objc_msgSend(v4, "setIdleTimerDuration:", 6, v6.receiver, v6.super_class);
  [v4 setIdleTimerMode:2];
  [v4 setIdleWarnMode:1];
  if ([(SBUIPasscodeLockView_Internal *)self->_passcodeLockView passcodeLockViewState] == 1) {
    uint64_t v5 = 2130112;
  }
  else {
    uint64_t v5 = 2134208;
  }
  [v4 setRestrictedCapabilities:v5];
}

- (id)_newDisplayLayoutElement
{
  id v2 = objc_alloc(MEMORY[0x1E4FA6A68]);
  BOOL v3 = (void *)[v2 initWithIdentifier:*MEMORY[0x1E4FA6F60]];
  [v3 setFillsDisplayBounds:1];
  [v3 setLayoutRole:6];
  return v3;
}

- (void)performCustomTransitionToVisible:(BOOL)a3 withAnimationSettings:(id)a4 completion:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v6)
  {
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke;
    v26[3] = &unk_1E6AD87F8;
    v26[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v26];
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView becomeActiveWithAnimationSettings:v8];
  }
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setKeypadVisible:v6 animated:v8 != 0];
  double v10 = [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView layer];
  double v11 = [v10 presentationModifiers];
  uint64_t v12 = [v11 count];

  if (v12)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F42FF0];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2;
    v24[3] = &unk_1E6AD8CD0;
    BOOL v25 = v6;
    v24[4] = self;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3;
    v22[3] = &unk_1E6AD8DE0;
    v14 = &v23;
    id v23 = v9;
    id v15 = v9;
    [v13 _animateUsingSpringWithTension:0 friction:v24 interactive:v22 animations:340.0 completion:30.0];
  }
  else
  {
    v16 = (void *)MEMORY[0x1E4F4F898];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_4;
    v20[3] = &unk_1E6AD8CD0;
    BOOL v21 = v6;
    v20[4] = self;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_5;
    v18[3] = &unk_1E6AD8B48;
    v14 = &v19;
    id v19 = v9;
    id v17 = v9;
    [v16 animateWithSettings:v8 options:2 actions:v20 completion:v18];
  }
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:0.0];
  id v2 = *(void **)(*(void *)(a1 + 32) + 1080);

  return [v2 setWeighting:0.0];
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_2(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:v2];
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1080);
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  return [v3 setWeighting:v4];
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_4(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40)) {
    double v2 = 1.0;
  }
  else {
    double v2 = 0.0;
  }
  [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:v2];
  BOOL v3 = *(void **)(*(void *)(a1 + 32) + 1080);
  if (*(unsigned char *)(a1 + 40)) {
    double v4 = 1.0;
  }
  else {
    double v4 = 0.0;
  }

  return [v3 setWeighting:v4];
}

uint64_t __94__CSPasscodeViewController_performCustomTransitionToVisible_withAnimationSettings_completion___block_invoke_5(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (BOOL)presentationCancelsTouches
{
  return 0;
}

- (void)beginInteractivePresentationTransitionForInitialTransition:(BOOL)a3
{
  if (a3)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __87__CSPasscodeViewController_beginInteractivePresentationTransitionForInitialTransition___block_invoke;
    v4[3] = &unk_1E6AD87F8;
    v4[4] = self;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v4];
  }
  else
  {
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView beginTransitionToState:0];
  }
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setAllowsAutomaticBiometricPresentationTransition:0];
}

uint64_t __87__CSPasscodeViewController_beginInteractivePresentationTransitionForInitialTransition___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1072) setAlpha:0.0];
  double v2 = *(void **)(*(void *)(a1 + 32) + 1080);

  return [v2 setWeighting:0.0];
}

- (void)updateInteractiveTransitionWithPercent:(double)a3 forInitialTransition:(BOOL)a4
{
  if (a4)
  {
    double v6 = fmin(fmax(a3 * a3, 0.0), 1.0);
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setAlpha:v6];
    [(CSPasscodeBackgroundView *)self->_backgroundView setWeighting:v6];
  }
  else
  {
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView updateTransitionWithProgress:a3];
  }
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView bounds];
  double MidY = CGRectGetMidY(v16);
  passcodeLockView = self->_passcodeLockView;

  -[SBUIPasscodeLockView_Internal setFrame:](passcodeLockView, "setFrame:", v8, (1.0 - a3) * MidY, v10, v12);
}

- (void)commitingToEndTransitionToPresented:(BOOL)a3 forInitialTransition:(BOOL)a4
{
  if (!a3) {
    self->_isBeingDismissedAfterInterstitialTransitionCancelled = 1;
  }
  if (!a4)
  {
    BOOL v5 = !a3;
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView willEndTransitionToState:!a3];
    if (!v5)
    {
      passcodeLockView = self->_passcodeLockView;
      [(SBUIPasscodeLockView_Internal *)passcodeLockView _resumeBiometricMatchingAdvisory:0];
    }
  }
}

- (void)endInteractiveTransitionToPresented:(BOOL)a3 forInitialTransition:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(CSPasscodeBackgroundView *)self->_backgroundView setWeighting:1.0];
  if (([(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion isValid] & 1) == 0) {
    [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setAllowsAutomaticBiometricPresentationTransition:1];
  }
  if (v4)
  {
    if (v5) {
      [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView _resumeBiometricMatchingAdvisory:1];
    }
  }
  else
  {
    passcodeLockView = self->_passcodeLockView;
    if (v5)
    {
      [(SBUIPasscodeLockView_Internal *)passcodeLockView _resumeBiometricMatchingAdvisory:1];
    }
    else
    {
      [(SBUIPasscodeLockView_Internal *)passcodeLockView frame];
      CGFloat x = v13.origin.x;
      CGFloat width = v13.size.width;
      CGFloat height = v13.size.height;
      CGRectGetMinY(v13);
      if ((BSFloatIsZero() & 1) == 0)
      {
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke;
        v12[3] = &unk_1E6AD9720;
        v12[4] = self;
        *(CGFloat *)&v12[5] = x;
        v12[6] = 0;
        *(CGFloat *)&v12[7] = width;
        *(CGFloat *)&v12[8] = height;
        [MEMORY[0x1E4F42FF0] performWithoutAnimation:v12];
      }
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke_2;
    v11[3] = &unk_1E6AD9748;
    v11[4] = self;
    v11[5] = !v5;
    [MEMORY[0x1E4F42FF0] performWithoutAnimation:v11];
  }
  self->_isBeingDismissedAfterInterstitialTransitionCancelled = 0;
}

uint64_t __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 1072), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __85__CSPasscodeViewController_endInteractiveTransitionToPresented_forInitialTransition___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 1072) didEndTransitionToState:*(void *)(a1 + 40)];
}

- (void)setWallpaperAverageColorOverride:(id)a3
{
  if (self->_wallpaperAverageColorOverride != a3)
  {
    self->_wallpaperAverageColorOverride = (UIColor *)a3;
    [(CSPasscodeViewController *)self _updateReduceTransparencyBackingColor];
  }
}

- (void)passcodeLockViewPasscodeDidChange:(id)a3
{
  coverSheetContext = self->_coverSheetContext;
  id v5 = a3;
  id v9 = [(CSCoverSheetContextProviding *)coverSheetContext passcodeFieldChangeObserver];
  double v6 = [v5 passcode];

  uint64_t v7 = [v6 length];
  if (v7) {
    [v9 notePasscodeEntryBegan];
  }
  else {
    [v9 notePasscodeEntryCancelled];
  }
  double v8 = +[CSAction actionWithType:4];
  [(CSCoverSheetViewControllerBase *)self sendAction:v8];
}

- (void)passcodeLockViewPasscodeEntered:(id)a3
{
}

- (void)passcodeLockViewPasscodeEnteredViaMesa:(id)a3
{
}

- (void)passcodeLockViewCancelButtonPressed:(id)a3
{
  BOOL v4 = +[CSAction actionWithType:4];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained passcodeViewControllerDidCancelPasscodeEntry:self];

  [(CSCoverSheetViewControllerBase *)self dismiss];
}

- (void)passcodeLockViewEmergencyCallButtonPressed:(id)a3
{
  BOOL v4 = +[CSAction actionWithType:4];
  [(CSCoverSheetViewControllerBase *)self sendAction:v4];

  id v5 = +[CSAction actionWithType:2];
  [(CSCoverSheetViewControllerBase *)self sendAction:v5];
}

- (void)passcodeLockViewStateChange:(id)a3
{
}

- (int64_t)presentationStyle
{
  return 2;
}

- (int64_t)presentationType
{
  return 2;
}

- (int64_t)presentationPriority
{
  return 550;
}

- (int64_t)presentationTransition
{
  return 1;
}

- (CAFrameRateRange)presentationPreferredFrameRateRange
{
  return CAFrameRateRangeMake(80.0, 120.0, 120.0);
}

- (unsigned)presentationFrameRateRangeReason
{
  return 1114125;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CSPasscodeViewController;
  if (![(CSCoverSheetViewControllerBase *)&v12 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 <= 23)
    {
      if (v6 == 5)
      {
        [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView resignFirstResponder];
      }
      else
      {
        if (v6 != 13) {
          goto LABEL_18;
        }
        uint64_t v7 = [v4 value];
        char v8 = [v7 BOOLValue];

        if ((v8 & 1) == 0)
        {
          id v9 = [(CSPasscodeViewController *)self proudLockContainerViewControllerToUpdate];
          [v9 setAuthenticated:0];
        }
      }
    }
    else
    {
      switch(v6)
      {
        case 24:
          [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setScreenOn:1];
          break;
        case 25:
          [(SBUIPasscodeLockView_Internal *)self->_passcodeLockView setScreenOn:0];
          [(SBFAuthenticationAssertion *)self->_sustainAuthenticationAssertion invalidate];
          sustainAuthenticationAssertion = self->_sustainAuthenticationAssertion;
          self->_sustainAuthenticationAssertion = 0;

          break;
        case 27:
          if ([(CSPasscodeViewController *)self _shouldEmulateInteractivePresentation])
          {
            [(CSPasscodeViewController *)self _emulateInteractivePresentation];
          }
          break;
        default:
          goto LABEL_18;
      }
    }
    char v5 = 0;
    goto LABEL_18;
  }
  char v5 = [v4 isConsumable];
LABEL_18:

  return v5;
}

- (void)_setBiometricAuthenticationEnabledForTransientAppearanceTransition:(BOOL)a3
{
}

- (void)_passcodeLockViewPasscodeEntered:(id)a3 authenticationType:(unint64_t)a4
{
  id v6 = a3;
  if (!self->_attemptingUnlock)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained passcodeViewControllerDidBeginPasscodeEntry:self];

    self->_attemptingUnlock = 1;
    if (a4 == 1)
    {
      char v8 = [v6 passcode];
    }
    else
    {
      char v8 = 0;
    }
    id v9 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationAssertionProvider];
    double v10 = [v9 createGracePeriodAssertionWithReason:@"DashBoardAttemptUnlock"];
    [v10 activate];
    BOOL v11 = !self->_isBeingDismissedAfterInterstitialTransitionCancelled;
    objc_super v12 = [(CSCoverSheetContextProviding *)self->_coverSheetContext authenticationManager];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __80__CSPasscodeViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke;
    v15[3] = &unk_1E6AD9770;
    v15[4] = self;
    id v16 = v9;
    id v17 = v6;
    id v18 = v10;
    id v13 = v10;
    id v14 = v9;
    [v12 attemptUnlockWithPasscode:v8 finishUIUnlock:v11 completion:v15];
  }
}

uint64_t __80__CSPasscodeViewController__passcodeLockViewPasscodeEntered_authenticationType___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1112));
  [WeakRetained passcodeViewController:*(void *)(a1 + 32) didCompletePasscodeEntry:a2 & a3];

  if (a2)
  {
    if (a3)
    {
      if (!*(void *)(*(void *)(a1 + 32) + 1056))
      {
        uint64_t v7 = [*(id *)(a1 + 40) createKeybagUnlockAssertionWithReason:@"DashBoardSustainUnlock"];
        uint64_t v8 = *(void *)(a1 + 32);
        id v9 = *(void **)(v8 + 1056);
        *(void *)(v8 + 1056) = v7;

        [*(id *)(*(void *)(a1 + 32) + 1056) activate];
      }
      [*(id *)(a1 + 48) resetForSuccess];
    }
    else
    {
      [*(id *)(a1 + 48) resetForFailedPasscode];
    }
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 1048) = 0;
  double v10 = *(void **)(a1 + 56);

  return [v10 invalidate];
}

- (BOOL)_shouldUseLightStylePasscodeView
{
  BOOL IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  if (IsReduceTransparencyEnabled)
  {
    id v4 = [(CSPasscodeViewController *)self _effectiveAverageWallpaperColor];
    objc_msgSend(v4, "sb_brightness");
    char v5 = BSFloatGreaterThanFloat();

    LOBYTE(IsReduceTransparencyEnabled) = v5;
  }
  return IsReduceTransparencyEnabled;
}

- (void)_updateReduceTransparencyBackingColor
{
  if (UIAccessibilityIsReduceTransparencyEnabled())
  {
    id v13 = [(CSPasscodeViewController *)self _effectiveAverageWallpaperColor];
    objc_msgSend(v13, "sb_brightness");
    int v3 = BSFloatLessThanFloat();
    int v4 = BSFloatGreaterThanFloat();
    double v5 = 0.666666667;
    if (v4) {
      double v5 = 1.0;
    }
    if (v3) {
      double v5 = 0.5;
    }
    id v6 = [MEMORY[0x1E4F428B8] colorWithWhite:v5 alpha:1.0];
    passcodeLockView = self->_passcodeLockView;
    uint64_t v8 = objc_opt_class();
    id v9 = passcodeLockView;
    if (v8)
    {
      if (objc_opt_isKindOfClass()) {
        double v10 = v9;
      }
      else {
        double v10 = 0;
      }
    }
    else
    {
      double v10 = 0;
    }
    BOOL v11 = v10;

    objc_super v12 = [(SBUIPasscodeLockView_Internal *)v11 _numberPad];

    [v12 setReduceTransparencyButtonColor:v6];
    [(CSPasscodeBackgroundView *)self->_backgroundView setReduceTransparencyBackingColor:v13];
  }
}

- (id)_effectiveAverageWallpaperColor
{
  wallpaperAverageColorOverride = self->_wallpaperAverageColorOverride;
  if (wallpaperAverageColorOverride)
  {
    int v3 = wallpaperAverageColorOverride;
  }
  else
  {
    int v4 = [(CSWallpaperColorProvider *)self->_wallpaperColorProvider averageColorForCurrentWallpaper];
    double v5 = v4;
    if (v4)
    {
      id v6 = v4;
    }
    else
    {
      id v6 = [MEMORY[0x1E4F428B8] whiteColor];
    }
    int v3 = v6;
  }

  return v3;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_pearlSettings == a3) {
    [(CSPasscodeViewController *)self _updateProudLockViewControllerConfiguration];
  }
}

- (void)_updateProudLockViewControllerConfiguration
{
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  long long v6 = 0u;
  pearlSettings = self->_pearlSettings;
  if (pearlSettings) {
    [(CSLockScreenPearlSettings *)pearlSettings proudLockControllerViewControllerConfiguration];
  }
  passcodeLockView = self->_passcodeLockView;
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  [(SBUIPasscodeLockView_Internal *)passcodeLockView setProudLockConfiguration:v5];
}

- (BOOL)_shouldEmulateInteractivePresentation
{
  if (UIAccessibilityIsVoiceOverRunning()
    || UIAccessibilityIsSwitchControlRunning()
    || (int v2 = _AXSAssistiveTouchEnabled()) != 0)
  {
    LOBYTE(v2) = SBFEffectiveHomeButtonType() == 2;
  }
  return v2;
}

- (void)_emulateInteractivePresentation
{
  if ([(CSPasscodeViewController *)self _shouldEmulateInteractivePresentation])
  {
    if (([(CSPasscodeViewController *)self bs_isAppearingOrAppeared] & 1) == 0)
    {
      [(CSPasscodeViewController *)self beginInteractivePresentationTransitionForInitialTransition:0];
      [(CSPasscodeViewController *)self updateInteractiveTransitionWithPercent:0 forInitialTransition:0.0];
      v4[0] = MEMORY[0x1E4F143A8];
      v4[1] = 3221225472;
      v4[2] = __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke;
      v4[3] = &unk_1E6AD87F8;
      v4[4] = self;
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke_2;
      v3[3] = &unk_1E6AD8A40;
      v3[4] = self;
      [MEMORY[0x1E4F42FF0] animateWithDuration:v4 animations:v3 completion:0.4];
    }
  }
}

uint64_t __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateInteractiveTransitionWithPercent:0 forInitialTransition:1.0];
}

uint64_t __59__CSPasscodeViewController__emulateInteractivePresentation__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) commitingToEndTransitionToPresented:1 forInitialTransition:0];
  int v2 = *(void **)(a1 + 32);

  return [v2 endInteractiveTransitionToPresented:1 forInitialTransition:0];
}

- (CSPasscodeViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSPasscodeViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)useBiometricPresentation
{
  return self->_useBiometricPresentation;
}

- (void)setUseBiometricPresentation:(BOOL)a3
{
  self->_useBiometricPresentation = a3;
}

- (BOOL)biometricButtonsInitiallyVisible
{
  return self->_biometricButtonsInitiallyVisible;
}

- (void)setBiometricButtonsInitiallyVisible:(BOOL)a3
{
  self->_biometricButtonsInitiallyVisible = a3;
}

- (BOOL)showProudLock
{
  return self->_showProudLock;
}

- (void)setShowProudLock:(BOOL)a3
{
  self->_showProudLock = a3;
}

- (SBUIProudLockContainerViewController)proudLockContainerViewControllerToUpdate
{
  return self->_proudLockContainerViewControllerToUpdate;
}

- (void)setProudLockContainerViewControllerToUpdate:(id)a3
{
}

- (NSString)unlockDestination
{
  return self->_unlockDestination;
}

- (void)setUnlockDestination:(id)a3
{
}

- (UIColor)wallpaperAverageColorOverride
{
  return self->_wallpaperAverageColorOverride;
}

- (BOOL)confirmedNotInPocket
{
  return self->_confirmedNotInPocket;
}

- (void)setConfirmedNotInPocket:(BOOL)a3
{
  self->_confirmedNotInPocket = a3;
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (void)setCoverSheetContext:(id)a3
{
}

- (CSWallpaperColorProvider)wallpaperColorProvider
{
  return self->_wallpaperColorProvider;
}

- (void)setWallpaperColorProvider:(id)a3
{
}

- (CSFaceOcclusionMonitor)faceOcclusionMonitor
{
  return self->_faceOcclusionMonitor;
}

- (void)setFaceOcclusionMonitor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_faceOcclusionMonitor, 0);
  objc_storeStrong((id *)&self->_wallpaperColorProvider, 0);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
  objc_storeStrong((id *)&self->_unlockDestination, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewControllerToUpdate, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pearlSettings, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_passcodeLockView, 0);

  objc_storeStrong((id *)&self->_sustainAuthenticationAssertion, 0);
}

@end