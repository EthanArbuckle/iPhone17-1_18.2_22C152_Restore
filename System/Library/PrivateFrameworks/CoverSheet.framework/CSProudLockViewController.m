@interface CSProudLockViewController
- (BOOL)_shouldApplyScaleAndBlurForAuthenticated;
- (BOOL)handleEvent:(id)a3;
- (BOOL)hasPasscodeSet;
- (BOOL)isBiometricLockedOut;
- (BOOL)proudLockContainerViewControllerIsCoverSheetVisible:(id)a3;
- (BOOL)suspendLockUpdates;
- (CSProudLockViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (CSProudLockViewControllerDelegate)delegate;
- (SBFAuthenticationStatusProvider)authenticationStatusProvider;
- (SBUIBiometricResource)biometricResource;
- (SBUIProudLockContainerViewController)proudLockContainerViewController;
- (UIView)cameraCoveredView;
- (UIView)proudLockView;
- (id)transientSubtitleText;
- (void)_clearFaceDetectAssertion;
- (void)_createFaceDetectAssertion;
- (void)_updateForAuthenticated:(BOOL)a3;
- (void)_updateForProudLockStateChangeAnimated:(BOOL)a3;
- (void)_updateForProudLockStateChangeDuration:(double)a3 completion:(id)a4;
- (void)_updateProudLockViewControllerConfiguration;
- (void)aggregateAppearance:(id)a3;
- (void)proudLockContainerViewController:(id)a3 guidanceTextVisibilityDidChange:(id)a4 animated:(BOOL)a5;
- (void)setAuthenticationStatusProvider:(id)a3;
- (void)setBiometricResource:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setProudLockContainerViewController:(id)a3;
- (void)setSuspendLockUpdates:(BOOL)a3;
- (void)settings:(id)a3 changedValueForKey:(id)a4;
- (void)updateLockForBiometricMatchFailure;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CSProudLockViewController

- (CSProudLockViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)CSProudLockViewController;
  result = [(CSCoverSheetViewControllerBase *)&v5 initWithNibName:a3 bundle:a4];
  if (result) {
    result->_deferredAuthenticationState = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)CSProudLockViewController;
  [(CSCoverSheetViewControllerBase *)&v7 viewDidLoad];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FA7D10]) initWithAuthenticationInformationProvider:self];
  [v3 setSuppressAlongsideCoaching:_os_feature_enabled_impl()];
  [v3 setDelegate:self];
  [(CSProudLockViewController *)self bs_addChildViewController:v3];
  [(CSProudLockViewController *)self setProudLockContainerViewController:v3];
  v4 = +[CSLockScreenDomain rootSettings];
  objc_super v5 = [v4 pearlSettings];
  pearlSettings = self->_pearlSettings;
  self->_pearlSettings = v5;

  [(PTSettings *)self->_pearlSettings addKeyObserver:self];
  [(CSProudLockViewController *)self _updateProudLockViewControllerConfiguration];
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)CSProudLockViewController;
  [(CSCoverSheetViewControllerBase *)&v13 viewDidLayoutSubviews];
  v3 = [(CSProudLockViewController *)self view];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  v12 = [(SBUIProudLockContainerViewController *)self->_proudLockContainerViewController view];
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSProudLockViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewWillAppear:a3];
  [(CSProudLockViewController *)self _createFaceDetectAssertion];
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSProudLockViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidAppear:a3];
  [(CSProudLockViewController *)self _clearFaceDetectAssertion];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSProudLockViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSProudLockViewController *)self _clearFaceDetectAssertion];
}

- (void)updateLockForBiometricMatchFailure
{
  if (!self->_suspendLockUpdates)
  {
    id v2 = [(CSProudLockViewController *)self proudLockContainerViewController];
    [v2 updateLockForBiometricMatchFailure];
  }
}

- (void)setSuspendLockUpdates:(BOOL)a3
{
  if (self->_suspendLockUpdates != a3)
  {
    self->_suspendLockUpdates = a3;
    if (!a3)
    {
      [(CSProudLockViewController *)self _updateProudLockViewControllerConfiguration];
      if (self->_deferredAuthenticationState != 0x7FFFFFFFFFFFFFFFLL)
      {
        [(CSProudLockViewController *)self _updateForAuthenticated:BSSettingFlagIsYes()];
        self->_deferredAuthenticationState = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
}

- (UIView)proudLockView
{
  id v2 = [(CSProudLockViewController *)self proudLockContainerViewController];
  v3 = [v2 view];

  return (UIView *)v3;
}

- (UIView)cameraCoveredView
{
  id v2 = [(CSProudLockViewController *)self proudLockContainerViewController];
  v3 = [v2 cameraCoveredView];

  return (UIView *)v3;
}

- (BOOL)isBiometricLockedOut
{
  id v2 = [(CSProudLockViewController *)self biometricResource];
  BOOL v3 = [v2 biometricLockoutState] != 0;

  return v3;
}

- (BOOL)hasPasscodeSet
{
  id v2 = [(CSProudLockViewController *)self authenticationStatusProvider];
  char v3 = [v2 hasPasscodeSet];

  return v3;
}

- (void)proudLockContainerViewController:(id)a3 guidanceTextVisibilityDidChange:(id)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  id v9 = a4;
  if (v5)
  {
    double v7 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.3];
  }
  else
  {
    double v7 = 0;
  }
  double v8 = [(CSProudLockViewController *)self delegate];
  [v8 proudLockDidChangeToCoachingText:v9];

  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self withAnimationSettings:v7 completion:0];
}

- (BOOL)proudLockContainerViewControllerIsCoverSheetVisible:(id)a3
{
  char v3 = [(CSProudLockViewController *)self delegate];
  char v4 = [v3 proudLockViewControllerIsCoverSheetVisible];

  return v4;
}

- (id)transientSubtitleText
{
  id v2 = [(CSProudLockViewController *)self delegate];
  char v3 = [v2 transientSubtitleText];

  return v3;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)CSProudLockViewController;
  if (![(CSCoverSheetViewControllerBase *)&v22 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    char v5 = 0;
    if (v6 <= 15)
    {
      switch(v6)
      {
        case 1:
          double v11 = [(CSCoverSheetViewControllerBase *)self activeAppearance];
          v12 = [v11 legibilitySettings];

          objc_super v13 = [(CSProudLockViewController *)self proudLockContainerViewController];
          [v13 setLegibilitySettings:v12];

          break;
        case 13:
          v17 = [v4 value];
          uint64_t v18 = [v17 BOOLValue];

          if (self->_suspendLockUpdates)
          {
            char v5 = 0;
            self->_deferredAuthenticationState = BSSettingFlagForBool();
            goto LABEL_28;
          }
          [(CSProudLockViewController *)self _updateForAuthenticated:v18];
          break;
        case 15:
          double v7 = [v4 value];
          uint64_t v8 = [v7 integerValue];

          if (!self->_suspendLockUpdates)
          {
            id v9 = [(CSProudLockViewController *)self proudLockContainerViewController];
            [v9 handleBiometricEvent:v8];
          }
          if (v8 == 27 && [(CSProudLockViewController *)self isBiometricLockedOut]) {
            [(CSProudLockViewController *)self _createFaceDetectAssertion];
          }
          break;
        default:
          goto LABEL_28;
      }
LABEL_27:
      char v5 = 0;
      goto LABEL_28;
    }
    switch(v6)
    {
      case 16:
        v14 = [v4 value];
        [v14 floatValue];
        float v16 = v15;

        if (v16 > 0.0) {
          goto LABEL_27;
        }
        double v10 = [(CSProudLockViewController *)self proudLockContainerViewController];
        [v10 updateForScreenWillTurnOff];
        break;
      case 24:
        if (self->_suspendLockUpdates) {
          goto LABEL_27;
        }
        v19 = [v4 value];
        uint64_t v20 = [v19 integerValue];

        double v10 = [(CSProudLockViewController *)self proudLockContainerViewController];
        [v10 setScreenOn:1 fromUnlockSource:v20];
        break;
      case 25:
        if (self->_suspendLockUpdates) {
          goto LABEL_27;
        }
        double v10 = [(CSProudLockViewController *)self proudLockContainerViewController];
        [v10 setScreenOn:0];
        break;
      default:
        goto LABEL_28;
    }

    goto LABEL_27;
  }
  char v5 = [v4 isConsumable];
LABEL_28:

  return v5;
}

- (void)aggregateAppearance:(id)a3
{
  id v4 = a3;
  v29.receiver = self;
  v29.super_class = (Class)CSProudLockViewController;
  [(CSCoverSheetViewControllerBase *)&v29 aggregateAppearance:v4];
  char v5 = [(CSProudLockViewController *)self proudLockContainerViewController];
  int v6 = [v5 isGuidanceTextVisible];

  if (v6)
  {
    double v7 = +[CSComponent footerCallToActionLabel];
    uint64_t v8 = [v7 priority:60];
    id v9 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
    double v10 = [v8 identifier:v9];
    double v11 = [v10 hidden:1];
    [v4 addComponent:v11];

    v12 = objc_opt_new();
    objc_super v13 = [v12 priority:60];
    v14 = [(CSCoverSheetViewControllerBase *)self coverSheetIdentifier];
    float v15 = [v13 identifier:v14];
    float v16 = [v15 suppressTeachableMomentsAnimation:1];
    [v4 addComponent:v16];
  }
  v17 = [(CSCoverSheetViewControllerBase *)self appearanceIdentifier];
  uint64_t v18 = [v17 stringByAppendingString:@"BlurRadius"];

  [v4 removeAllComponentsWithIdentifier:v18];
  if ([(CSProudLockViewController *)self _shouldApplyScaleAndBlurForAuthenticated])
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v26 = 0u;
    CSComponentTransitionInputsMake(0, (uint64_t)&v26, 0.5, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), 0.35, 4.0);
    v19 = objc_opt_new();
    uint64_t v20 = [v19 identifier:v18];
    v21 = [v20 priority:20];
    objc_super v22 = [v21 transitionModifiers:48];
    v25[0] = v26;
    v25[1] = v27;
    v25[2] = v28;
    v23 = [v22 transitionInputs:v25];
    v24 = [v23 hidden:1];
    [v4 addComponent:v24];

LABEL_8:
    goto LABEL_9;
  }
  if (self->_isAuthenticated && self->_hasReactedToAuthentication)
  {
    v19 = objc_opt_new();
    uint64_t v20 = [v19 identifier:v18];
    v21 = [v20 priority:20];
    objc_super v22 = [v21 hidden:1];
    [v4 addComponent:v22];
    goto LABEL_8;
  }
LABEL_9:
}

- (BOOL)_shouldApplyScaleAndBlurForAuthenticated
{
  return self->_isAuthenticated && self->_shouldReactToAuthentication && !self->_hasReactedToAuthentication;
}

- (void)_updateForAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL isAuthenticated = self->_isAuthenticated;
  self->_BOOL isAuthenticated = a3;
  if (!a3)
  {
    self->_shouldReactToAuthentication = 0;
    self->_hasReactedToAuthentication = 0;
  }
  objc_initWeak(&location, self);
  int v6 = [(CSProudLockViewController *)self proudLockContainerViewController];
  uint64_t v7 = MEMORY[0x1E4F143A8];
  uint64_t v8 = 3221225472;
  id v9 = __53__CSProudLockViewController__updateForAuthenticated___block_invoke;
  double v10 = &unk_1E6AD8A68;
  objc_copyWeak(&v12, &location);
  double v11 = self;
  BOOL v13 = isAuthenticated;
  [v6 setAuthenticated:v3 completion:&v7];

  if (v3) {
    [(CSProudLockViewController *)self _clearFaceDetectAssertion];
  }
  else {
    [(CSProudLockViewController *)self _createFaceDetectAssertion];
  }
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __53__CSProudLockViewController__updateForAuthenticated___block_invoke(uint64_t a1)
{
  id v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = WeakRetained;
  if (WeakRetained) {
    double v5 = dbl_1D8504D70[*((unsigned char *)WeakRetained + 1072) == 0];
  }
  else {
    double v5 = 0.3;
  }
  [*(id *)(a1 + 32) _updateForProudLockStateChangeDuration:0 completion:v5];
  dispatch_time_t v6 = dispatch_time(0, 450000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__CSProudLockViewController__updateForAuthenticated___block_invoke_2;
  block[3] = &unk_1E6AD8A68;
  objc_copyWeak(&v8, v2);
  char v9 = *(unsigned char *)(a1 + 48);
  block[4] = *(void *)(a1 + 32);
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  objc_destroyWeak(&v8);
}

void __53__CSProudLockViewController__updateForAuthenticated___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained && *(unsigned __int8 *)(a1 + 48) != WeakRetained[1072])
  {
    if (WeakRetained[1072])
    {
      WeakRetained[1073] = 1;
      WeakRetained[1074] = 0;
    }
    id v4 = [MEMORY[0x1E4F4F680] settingsWithDuration:0.5];
    uint64_t v5 = *(void *)(a1 + 32);
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__CSProudLockViewController__updateForAuthenticated___block_invoke_3;
    v6[3] = &unk_1E6AD8A40;
    id v7 = v3;
    [v7 updateAppearanceForController:v5 withAnimationSettings:v4 completion:v6];
  }
}

uint64_t __53__CSProudLockViewController__updateForAuthenticated___block_invoke_3(uint64_t result)
{
  uint64_t v1 = *(void *)(result + 32);
  if (v1)
  {
    if (*(unsigned char *)(v1 + 1072))
    {
      *(unsigned char *)(v1 + 1073) = 0;
      *(unsigned char *)(*(void *)(result + 32) + 1074) = 1;
    }
  }
  return result;
}

- (void)_updateForProudLockStateChangeAnimated:(BOOL)a3
{
  double v3 = 0.3;
  if (!a3) {
    double v3 = 0.0;
  }
  [(CSProudLockViewController *)self _updateForProudLockStateChangeDuration:0 completion:v3];
}

- (void)_updateForProudLockStateChangeDuration:(double)a3 completion:(id)a4
{
  id v7 = a4;
  if (BSFloatIsZero())
  {
    dispatch_time_t v6 = 0;
  }
  else
  {
    dispatch_time_t v6 = [MEMORY[0x1E4F4F680] settingsWithDuration:a3];
  }
  [(CSCoverSheetViewControllerBase *)self updateAppearanceForController:self withAnimationSettings:v6 completion:v7];
}

- (void)_createFaceDetectAssertion
{
  if (!self->_faceDetectWantedAssertion)
  {
    if ([(CSProudLockViewController *)self isBiometricLockedOut])
    {
      double v3 = [(CSProudLockViewController *)self biometricResource];
      int v4 = [v3 hasBiometricAuthenticationCapabilityEnabled];

      if (v4)
      {
        id v7 = [(CSProudLockViewController *)self biometricResource];
        uint64_t v5 = [v7 acquireFaceDetectionWantedAssertionForReason:@"FaceDetectForProudLock"];
        faceDetectWantedAssertion = self->_faceDetectWantedAssertion;
        self->_faceDetectWantedAssertion = v5;
      }
    }
  }
}

- (void)_clearFaceDetectAssertion
{
  faceDetectWantedAssertion = self->_faceDetectWantedAssertion;
  if (faceDetectWantedAssertion)
  {
    [(BSInvalidatable *)faceDetectWantedAssertion invalidate];
    int v4 = self->_faceDetectWantedAssertion;
    self->_faceDetectWantedAssertion = 0;
  }
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_pearlSettings == a3)
  {
    if ([a3 overrideCoachingConditionEnabled]) {
      unint64_t v5 = [(CSLockScreenPearlSettings *)self->_pearlSettings overrideCoachingBiometricEvent];
    }
    else {
      unint64_t v5 = 16;
    }
    dispatch_time_t v6 = [(CSProudLockViewController *)self proudLockContainerViewController];
    [v6 handleBiometricEvent:v5];

    [(CSProudLockViewController *)self _updateProudLockViewControllerConfiguration];
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
  int v4 = [(CSProudLockViewController *)self proudLockContainerViewController];
  v5[2] = v8;
  v5[3] = v9;
  v5[4] = v10;
  v5[0] = v6;
  v5[1] = v7;
  [v4 setConfiguration:v5];
}

- (SBUIProudLockContainerViewController)proudLockContainerViewController
{
  return self->_proudLockContainerViewController;
}

- (void)setProudLockContainerViewController:(id)a3
{
}

- (SBUIBiometricResource)biometricResource
{
  return self->_biometricResource;
}

- (void)setBiometricResource:(id)a3
{
}

- (SBFAuthenticationStatusProvider)authenticationStatusProvider
{
  return self->_authenticationStatusProvider;
}

- (void)setAuthenticationStatusProvider:(id)a3
{
}

- (BOOL)suspendLockUpdates
{
  return self->_suspendLockUpdates;
}

- (CSProudLockViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CSProudLockViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_authenticationStatusProvider, 0);
  objc_storeStrong((id *)&self->_biometricResource, 0);
  objc_storeStrong((id *)&self->_proudLockContainerViewController, 0);
  objc_storeStrong((id *)&self->_faceDetectWantedAssertion, 0);

  objc_storeStrong((id *)&self->_pearlSettings, 0);
}

@end