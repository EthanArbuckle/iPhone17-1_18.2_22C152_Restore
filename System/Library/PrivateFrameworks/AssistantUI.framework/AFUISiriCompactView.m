@interface AFUISiriCompactView
+ (id)sharedSiriUISettingsDefaults;
+ (void)_animateView:(id)a3 fromYPosition:(double)a4 toYPosition:(double)a5 fade:(int64_t)a6 completion:(id)a7;
- (AFUISiriCompactView)initWithFrame:(CGRect)a3 compactViewDelegate:(id)a4 edgeLightViewProvider:(id)a5 showsSensitiveUI:(BOOL)a6;
- (AFUISiriCompactView)initWithFrame:(CGRect)a3 eyesFreeMode:(int64_t)a4 edgeLightViewProvider:(id)a5 showsSensitiveUI:(BOOL)a6;
- (AFUISiriEdgelightViewProvider)edgeLightViewProvider;
- (BOOL)_shouldShowBugReportButton;
- (BOOL)isBlurViewVisible;
- (BOOL)isDimmingViewVisible;
- (BOOL)passcodeView:(id)a3 attemptUnlockWithPassword:(id)a4;
- (BOOL)shouldRequestStatusBar;
- (CGRect)_lockViewFrame;
- (CGRect)_orbViewContainerFrame;
- (CGRect)_remoteContentViewFrame;
- (CGSize)_sizeForOrbView;
- (CGSize)_sizeForOrbViewContainer;
- (UIView)foregroundContainerView;
- (UIView)remoteContentView;
- (double)_originXForOrbContainer;
- (double)bugReportDimension;
- (double)siriXIndicatorDimension;
- (int64_t)currentInterfaceOrientation;
- (int64_t)mode;
- (int64_t)siriSessionState;
- (void)_animateLockViewIsAnimatingIn:(BOOL)a3 completion:(id)a4;
- (void)_constructAndAddBugReportButtonWithImage:(id)a3;
- (void)_constructAndAddSiriXIndicator;
- (void)_handleTouchEndedForNonAttendingConfiguration;
- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3;
- (void)_orbButtonHeld:(id)a3;
- (void)_playHaptic;
- (void)_reportBugButtonLongPressed;
- (void)_reportBugButtonTapped;
- (void)_setUpEyesFreePresentation:(int64_t)a3;
- (void)_setupBugReportButtonIfNeeded;
- (void)_setupContentViews;
- (void)_setupOrb;
- (void)_setupVoiceActivationMaskView;
- (void)animateOrbViewDismissalWithCompletion:(id)a3;
- (void)animateOrbViewToOffWithCompletion:(id)a3;
- (void)backgroundBlurViewController:(id)a3 didSetBlurVisibilityTo:(BOOL)a4;
- (void)dealloc;
- (void)dismissalBlur:(float)a3;
- (void)keyboardWillHide:(id)a3;
- (void)keyboardWillShow:(id)a3;
- (void)layoutSubviews;
- (void)passcodeView:(id)a3 animateShowPasscodeWithCompletionHandler:(id)a4;
- (void)passcodeView:(id)a3 hideLockViewWithResult:(int64_t)a4 unlockCompletionHandler:(id)a5;
- (void)reduceOrbOpacity:(BOOL)a3;
- (void)requestBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5;
- (void)setAuxiliaryViewsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentViewsAlpha:(double)a3;
- (void)setCurrentInterfaceOrientation:(int64_t)a3;
- (void)setDockFrame:(CGRect)a3;
- (void)setEdgeLightViewProvider:(id)a3;
- (void)setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4;
- (void)setInFluidDismissal:(BOOL)a3;
- (void)setInputPowerLevel:(float)a3;
- (void)setMode:(int64_t)a3;
- (void)setOutputPowerLevel:(float)a3;
- (void)setRemoteContentView:(id)a3;
- (void)setRequestHandlingStatus:(unint64_t)a3;
- (void)setSiriContentDelegate:(id)a3;
- (void)setSiriSessionState:(int64_t)a3;
- (void)setTamaleView:(id)a3;
- (void)setVoiceActivationMaskViewVisible:(BOOL)a3;
- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6;
- (void)touchesBeganForInputView:(id)a3;
- (void)touchesEndedForInputView:(id)a3;
- (void)updateVolumeInputdB:(float)a3;
@end

@implementation AFUISiriCompactView

+ (id)sharedSiriUISettingsDefaults
{
  if (sharedSiriUISettingsDefaults_onceToken_0 != -1) {
    dispatch_once(&sharedSiriUISettingsDefaults_onceToken_0, &__block_literal_global_10);
  }
  v2 = (void *)sharedSiriUISettingsDefaults_defaults_0;

  return v2;
}

uint64_t __51__AFUISiriCompactView_sharedSiriUISettingsDefaults__block_invoke()
{
  sharedSiriUISettingsDefaults_defaults_0 = [objc_alloc(MEMORY[0x263EFFA40]) initWithSuiteName:@"com.apple.siri.internal"];

  return MEMORY[0x270F9A758]();
}

- (AFUISiriCompactView)initWithFrame:(CGRect)a3 compactViewDelegate:(id)a4 edgeLightViewProvider:(id)a5 showsSensitiveUI:(BOOL)a6
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v13 = a4;
  id v14 = a5;
  v21.receiver = self;
  v21.super_class = (Class)AFUISiriCompactView;
  v15 = -[AFUISiriCompactView initWithFrame:](&v21, sel_initWithFrame_, x, y, width, height);
  if (v15)
  {
    v15->_saeEnabled = [MEMORY[0x263F286B8] isSAEEnabled] & a6;
    v15->_remoteContentViewHidden = 0;
    v15->_lockViewHidden = 1;
    v15->_inFluidDismissal = 0;
    v15->_ignoreSiriSessionUpdates = 0;
    v15->_mode = 7;
    objc_storeWeak((id *)&v15->_compactViewDelegate, v13);
    v15->_shouldUpdatePowerLevel = 1;
    objc_storeWeak((id *)&v15->_edgeLightViewProvider, v14);
    v16 = +[AFUISiriCompactView sharedSiriUISettingsDefaults];
    v17 = [v16 valueForKey:@"ForceOrbGraphic"];
    if ([v17 intValue]) {
      v15->_saeEnabled = 0;
    }
    [(AFUISiriCompactView *)v15 _setupContentViews];
    [(AFUISiriCompactView *)v15 _setupBugReportButtonIfNeeded];
    v18 = [MEMORY[0x263F08A00] defaultCenter];
    [v18 addObserver:v15 selector:sel_keyboardWillShow_ name:*MEMORY[0x263F83808] object:0];

    v19 = [MEMORY[0x263F08A00] defaultCenter];
    [v19 addObserver:v15 selector:sel_keyboardWillHide_ name:*MEMORY[0x263F83800] object:0];
  }
  return v15;
}

- (AFUISiriCompactView)initWithFrame:(CGRect)a3 eyesFreeMode:(int64_t)a4 edgeLightViewProvider:(id)a5 showsSensitiveUI:(BOOL)a6
{
  v7 = -[AFUISiriCompactView initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:](self, "initWithFrame:compactViewDelegate:edgeLightViewProvider:showsSensitiveUI:", 0, a5, a6, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v8 = v7;
  if (v7) {
    [(AFUISiriCompactView *)v7 _setUpEyesFreePresentation:a4];
  }
  return v8;
}

- (BOOL)shouldRequestStatusBar
{
  int64_t v3 = [(AFUISiriEyesFreeView *)self->_eyesFreeView eyesFreeMode];
  if (v3 != 1)
  {
    LOBYTE(v3) = [(AFUISiriCompactView *)self isBlurViewVisible];
  }
  return v3;
}

- (void)_orbButtonHeld:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 state];
  v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSNumber;
    v7 = v5;
    v8 = [v6 numberWithInteger:v4];
    int v11 = 136315394;
    v12 = "-[AFUISiriCompactView _orbButtonHeld:]";
    __int16 v13 = 2112;
    id v14 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbUIInteraction Mic Button Held State %@", (uint8_t *)&v11, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  [WeakRetained siriContentDidReceiveOrbTappedAction:self];

  if (v4 == 1)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    [v10 siriContentDidReceiveOrbHoldDidBeginAction:self];
  }
  else
  {
    if ((unint64_t)(v4 - 3) > 1) {
      return;
    }
    id v10 = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    [v10 siriContentDidReceiveOrbHoldDidEndAction:self];
  }
}

- (void)setDockFrame:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  p_dockFrame = &self->_dockFrame;
  if (!CGRectEqualToRect(self->_dockFrame, a3))
  {
    p_dockFrame->origin.CGFloat x = x;
    p_dockFrame->origin.CGFloat y = y;
    p_dockFrame->size.CGFloat width = width;
    p_dockFrame->size.CGFloat height = height;
    orbViewContainer = self->_orbViewContainer;
    [(AFUISiriCompactView *)self _orbViewContainerFrame];
    -[UIView setFrame:](orbViewContainer, "setFrame:");
    touchInputView = self->_touchInputView;
    [(UIView *)self->_orbViewContainer frame];
    -[AFUITouchInputView setFrame:](touchInputView, "setFrame:");
  }
}

- (void)setInFluidDismissal:(BOOL)a3
{
  self->_inFluidDismissal = a3;
}

- (void)_setupContentViews
{
  int64_t v3 = objc_alloc_init(AFUISiriCompactDimmingView);
  dimmingBackdropView = self->_dimmingBackdropView;
  self->_dimmingBackdropView = v3;

  [(AFUISiriCompactView *)self addSubview:self->_dimmingBackdropView];
  id v5 = objc_alloc(MEMORY[0x263F82E00]);
  [(AFUISiriCompactView *)self frame];
  double v7 = v6;
  [(AFUISiriCompactView *)self frame];
  v8 = (UIView *)objc_msgSend(v5, "initWithFrame:", 0.0, 0.0, v7);
  foregroundContainerView = self->_foregroundContainerView;
  self->_foregroundContainerView = v8;

  [(AFUISiriCompactView *)self addSubview:self->_foregroundContainerView];
  if (!self->_saeEnabled) {
    [(AFUISiriCompactView *)self _setupOrb];
  }
  id v10 = objc_alloc(MEMORY[0x263F82E00]);
  double v11 = *MEMORY[0x263F001A8];
  double v12 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v13 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v14 = *(double *)(MEMORY[0x263F001A8] + 24);
  uint64_t v15 = (UIView *)objc_msgSend(v10, "initWithFrame:", *MEMORY[0x263F001A8], v12, v13, v14);
  blurringAndLockContainer = self->_blurringAndLockContainer;
  self->_blurringAndLockContainer = v15;

  [(UIView *)self->_foregroundContainerView addSubview:self->_blurringAndLockContainer];
  v17 = (SiriUIBackgroundBlurViewController *)[objc_alloc(MEMORY[0x263F75398]) initWithDelegate:self];
  fullScreenBlurViewController = self->_fullScreenBlurViewController;
  self->_fullScreenBlurViewController = v17;

  v19 = [(SiriUIBackgroundBlurViewController *)self->_fullScreenBlurViewController view];
  [(AFUISiriCompactView *)self insertSubview:v19 aboveSubview:self->_dimmingBackdropView];

  v20 = -[AFUIPasscodeContainerView initWithFrame:backdropView:mode:passcodeViewFactoryClass:]([AFUIPasscodeContainerView alloc], "initWithFrame:backdropView:mode:passcodeViewFactoryClass:", 0, self->_mode, objc_opt_class(), v11, v12, v13, v14);
  lockContainerView = self->_lockContainerView;
  self->_lockContainerView = v20;

  [(AFUIPasscodeContainerView *)self->_lockContainerView setDelegate:self];
  [(UIView *)self->_blurringAndLockContainer addSubview:self->_lockContainerView];
  v22 = self->_blurringAndLockContainer;

  [(UIView *)v22 setUserInteractionEnabled:0];
}

- (void)_setupOrb
{
  [(AFUISiriCompactView *)self _sizeForOrbViewContainer];
  double v4 = v3;
  double v6 = v5;
  [(AFUISiriCompactView *)self _sizeForOrbView];
  double v8 = v7;
  double v10 = v9;
  [(AFUISiriCompactView *)self _originXForOrbContainer];
  double v12 = v11;
  [(AFUISiriCompactView *)self frame];
  double v13 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v12, CGRectGetHeight(v39) - v6 + -44.0, v4, v6);
  orbViewContainer = self->_orbViewContainer;
  self->_orbViewContainer = v13;

  [(UIView *)self->_foregroundContainerView addSubview:self->_orbViewContainer];
  double v15 = (v4 - v8) * 0.5;
  double v16 = (v6 - v10) * 0.5;
  id v17 = objc_alloc(MEMORY[0x263F75438]);
  v18 = [MEMORY[0x263F82B60] mainScreen];
  [v18 scale];
  BOOL v20 = v19 < 2.0;
  double v21 = ceil(v15);
  double v22 = ceil(v16);
  double v23 = ceil(v8);
  double v24 = ceil(v10);
  if (!v20)
  {
    double v21 = v15;
    double v22 = v16;
    double v23 = v8;
    double v24 = v10;
  }
  v25 = (SUICOrbView *)objc_msgSend(v17, "initWithFrame:", v21, v22, v23, v24);
  orbView = self->_orbView;
  self->_orbView = v25;

  v27 = [(SUICOrbView *)self->_orbView layer];
  [v27 setAllowsHitTesting:0];

  [(UIView *)self->_orbViewContainer addSubview:self->_orbView];
  v28 = [AFUITouchInputView alloc];
  [(UIView *)self->_orbViewContainer frame];
  v29 = -[AFUITouchInputView initWithFrame:](v28, "initWithFrame:");
  touchInputView = self->_touchInputView;
  self->_touchInputView = v29;

  v31 = self->_touchInputView;
  v32 = [MEMORY[0x263F825C8] clearColor];
  [(AFUITouchInputView *)v31 setBackgroundColor:v32];

  v33 = [(AFUITouchInputView *)self->_touchInputView layer];
  [v33 setHitTestsAsOpaque:1];

  [(AFUITouchInputView *)self->_touchInputView setDelegate:self];
  v34 = (UILongPressGestureRecognizer *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__orbButtonHeld_];
  longPressRecognizer = self->_longPressRecognizer;
  self->_longPressRecognizer = v34;

  [(UILongPressGestureRecognizer *)self->_longPressRecognizer setMinimumPressDuration:0.1];
  [(UILongPressGestureRecognizer *)self->_longPressRecognizer setDelegate:self];
  [(AFUITouchInputView *)self->_touchInputView addGestureRecognizer:self->_longPressRecognizer];
  foregroundContainerView = self->_foregroundContainerView;
  v37 = self->_touchInputView;

  [(UIView *)foregroundContainerView addSubview:v37];
}

- (double)_originXForOrbContainer
{
  int IsPad = SiriUIDeviceIsPad();
  double v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 scale];
  double v6 = v5;
  [(AFUISiriCompactView *)self frame];
  double Width = CGRectGetWidth(v13);
  [(AFUISiriCompactView *)self _sizeForOrbViewContainer];
  double v9 = (Width - v8) * 0.5;
  double v10 = ceil(v9);
  if (v6 >= 2.0) {
    double v11 = v9;
  }
  else {
    double v11 = v10;
  }

  if (IsPad)
  {
    if (SiriLanguageIsRTL()) {
      return 44.0;
    }
    else {
      return v11 + v11 + -44.0;
    }
  }
  return v11;
}

- (void)requestBlurVisible:(BOOL)a3 reason:(int64_t)a4 fence:(id)a5
{
  id v8 = a5;
  objc_initWeak(&location, self);
  objc_copyWeak(v10, &location);
  id v9 = v8;
  v10[1] = (id)a4;
  BOOL v11 = a3;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(v10);
  objc_destroyWeak(&location);
}

void __55__AFUISiriCompactView_requestBlurVisible_reason_fence___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  double v3 = WeakRetained;
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      double v4 = [WeakRetained window];
      double v5 = [v4 windowScene];
      [v5 _synchronizeDrawingWithFence:*(void *)(a1 + 32)];
    }
    uint64_t v6 = *(void *)(a1 + 48);
    double v7 = 0.5;
    if (v6 == 4) {
      double v7 = 0.0;
    }
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __55__AFUISiriCompactView_requestBlurVisible_reason_fence___block_invoke_2;
    v8[3] = &unk_264692D80;
    char v9 = *(unsigned char *)(a1 + 56);
    v8[4] = v3;
    v8[5] = v6;
    [MEMORY[0x263F82E00] _animateUsingSpringWithDuration:0 delay:v8 options:0 mass:v7 stiffness:0.0 damping:3.0 initialVelocity:1000.0 animations:500.0 completion:0.0];
  }
}

uint64_t __55__AFUISiriCompactView_requestBlurVisible_reason_fence___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) requestBackgroundBlurVisible:*(unsigned __int8 *)(a1 + 48) forReason:*(void *)(a1 + 40)];
}

- (void)reduceOrbOpacity:(BOOL)a3
{
  if (a3)
  {
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    CGRect v13 = __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke;
    double v14 = &unk_264691A50;
    double v15 = self;
    double v3 = 0.5;
    double v4 = 0.0;
    double v5 = &v11;
  }
  else
  {
    uint64_t v6 = MEMORY[0x263EF8330];
    uint64_t v7 = 3221225472;
    id v8 = __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke_2;
    char v9 = &unk_264691A50;
    double v10 = self;
    double v4 = 0.2;
    double v3 = 0.5;
    double v5 = &v6;
  }
  objc_msgSend(MEMORY[0x263F82E00], "animateWithDuration:delay:options:animations:completion:", 4, v5, 0, v3, v4, v6, v7, v8, v9, v10, v11, v12, v13, v14, v15);
}

uint64_t __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:0.5];
}

uint64_t __40__AFUISiriCompactView_reduceOrbOpacity___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:1.0];
}

- (void)_setupBugReportButtonIfNeeded
{
  if ([(AFUISiriCompactView *)self _shouldShowBugReportButton])
  {
    objc_initWeak(&location, self);
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __52__AFUISiriCompactView__setupBugReportButtonIfNeeded__block_invoke;
    v3[3] = &unk_264692DD0;
    objc_copyWeak(&v4, &location);
    [(AFUISiriCompactView *)self _loadReportBugButtonTemplateImageInBackgroundWithCompletion:v3];
    objc_destroyWeak(&v4);
    objc_destroyWeak(&location);
  }
}

void __52__AFUISiriCompactView__setupBugReportButtonIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  SiriUIInvokeOnMainQueue();

  objc_destroyWeak(&v5);
}

void __52__AFUISiriCompactView__setupBugReportButtonIfNeeded__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _constructAndAddBugReportButtonWithImage:*(void *)(a1 + 32)];
}

- (double)bugReportDimension
{
  double result = 50.0;
  if (!self->_isEyesFree) {
    return 25.0;
  }
  return result;
}

- (double)siriXIndicatorDimension
{
  double result = 56.0;
  if (!self->_isEyesFree) {
    return 28.0;
  }
  return result;
}

- (void)keyboardWillShow:(id)a3
{
  id v11 = a3;
  self->_isKeyboardShowing = 1;
  if ([(AFUISiriCompactView *)self _shouldShowBugReportButton])
  {
    if (self->_reportBugButton)
    {
      id v4 = [v11 userInfo];
      id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x263F837B8]];
      [v5 CGRectValue];
      self->_keyboardFrame.origin.CGFloat x = v6;
      self->_keyboardFrame.origin.CGFloat y = v7;
      self->_keyboardFrame.size.CGFloat width = v8;
      self->_keyboardFrame.size.CGFloat height = v9;

      if (self->_saeEnabled)
      {
        double v10 = [MEMORY[0x263F08938] constraintWithItem:self->_reportBugButton attribute:3 relatedBy:0 toItem:self attribute:4 multiplier:1.0 constant:-(self->_keyboardFrame.size.height + 90.0)];
        [v10 setActive:1];

        [(SiriUIContentButton *)self->_reportBugButton setAlpha:0.9];
        [(SiriUIContentButton *)self->_reportBugButton setNeedsLayout];
        [(SiriUIContentButton *)self->_reportBugButton layoutIfNeeded];
      }
    }
  }
}

- (void)keyboardWillHide:(id)a3
{
  self->_isKeyboardShowing = 0;
}

- (void)_constructAndAddBugReportButtonWithImage:(id)a3
{
  id v4 = a3;
  id v36 = v4;
  if (self->_isEyesFree) {
    [MEMORY[0x263F753A8] eyesFreeButtonWithImageTemplate:v4 style:0];
  }
  else {
  id v5 = [MEMORY[0x263F753A8] buttonWithImageTemplate:v4 style:0];
  }
  reportBugButton = self->_reportBugButton;
  self->_reportBugButton = v5;

  CGFloat v7 = self->_reportBugButton;
  CGFloat v8 = [MEMORY[0x263F825C8] systemDarkGrayTintColor];
  CGFloat v9 = [v8 colorWithAlphaComponent:0.9];
  [(SiriUIContentButton *)v7 setBackgroundColor:v9];

  double v10 = [(SiriUIContentButton *)self->_reportBugButton layer];
  [(AFUISiriCompactView *)self bugReportDimension];
  [v10 setCornerRadius:v11 * 0.5];

  -[SiriUIContentButton _setTouchInsets:](self->_reportBugButton, "_setTouchInsets:", -0.5, -0.5, -0.5, -0.5);
  [(SiriUIContentButton *)self->_reportBugButton addTarget:self action:sel__reportBugButtonTapped forControlEvents:64];
  uint64_t v12 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__reportBugButtonLongPressed];
  [(SiriUIContentButton *)self->_reportBugButton addGestureRecognizer:v12];
  [(SiriUIContentButton *)self->_reportBugButton setHidden:0];
  CGRect v13 = self->_reportBugButton;
  double v14 = [MEMORY[0x263F825C8] whiteColor];
  [(SiriUIContentButton *)v13 setDefaultColorForTemplate:v14];

  [(AFUISiriCompactView *)self addSubview:self->_reportBugButton];
  [(SiriUIContentButton *)self->_reportBugButton setTranslatesAutoresizingMaskIntoConstraints:0];
  int v15 = [MEMORY[0x263F744A8] reportConcernButtonEnabled];
  if (v15) {
    uint64_t v16 = 1;
  }
  else {
    uint64_t v16 = 2;
  }
  double v17 = 15.0;
  if (!v15) {
    double v17 = -15.0;
  }
  v18 = [MEMORY[0x263F08938] constraintWithItem:self->_reportBugButton attribute:v16 relatedBy:0 toItem:self attribute:v16 multiplier:1.0 constant:v17];
  [v18 setActive:1];

  double v19 = (void *)MEMORY[0x263F08938];
  BOOL v20 = self->_reportBugButton;
  [(AFUISiriCompactView *)self bugReportDimension];
  double v22 = [v19 constraintWithItem:v20 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v21];
  [v22 setActive:1];

  double v23 = (void *)MEMORY[0x263F08938];
  double v24 = self->_reportBugButton;
  [(AFUISiriCompactView *)self bugReportDimension];
  v26 = [v23 constraintWithItem:v24 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v25];
  [v26 setActive:1];

  if (self->_saeEnabled)
  {
    [(AFUISiriCompactView *)self _sizeForOrbViewContainer];
    if (self->_isKeyboardShowing) {
      double v27 = self->_keyboardFrame.size.height + 90.0;
    }
    v28 = (void *)MEMORY[0x263F08938];
    v29 = self->_reportBugButton;
    double v30 = -v27;
    double v31 = 1.0;
    uint64_t v32 = 3;
    orbView = self;
    uint64_t v34 = 4;
  }
  else
  {
    v28 = (void *)MEMORY[0x263F08938];
    v29 = self->_reportBugButton;
    orbView = self->_orbView;
    double v31 = 1.0;
    double v30 = 0.0;
    uint64_t v32 = 10;
    uint64_t v34 = 10;
  }
  v35 = [v28 constraintWithItem:v29 attribute:v32 relatedBy:0 toItem:orbView attribute:v34 multiplier:v31 constant:v30];
  [v35 setActive:1];

  [(AFUISiriCompactView *)self _constructAndAddSiriXIndicator];
}

- (void)_loadReportBugButtonTemplateImageInBackgroundWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = dispatch_get_global_queue(9, 0);
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__AFUISiriCompactView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke;
  block[3] = &unk_264691AC8;
  id v7 = v3;
  id v5 = v3;
  dispatch_async(v4, block);
}

uint64_t __83__AFUISiriCompactView__loadReportBugButtonTemplateImageInBackgroundWithCompletion___block_invoke(uint64_t a1)
{
  [MEMORY[0x263F086E0] bundleWithPath:@"/AppleInternal/Library/Assistant/UIPlugins/Debug.siriUIBundle"];
  if (objc_claimAutoreleasedReturnValue())
  {
    v2 = objc_msgSend(MEMORY[0x263F827E8], "imageNamed:inBundle:", @"radarBug");
    id v3 = [v2 imageWithRenderingMode:2];

    uint64_t v4 = *(void *)(a1 + 32);
    if (v4) {
      (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v3);
    }
  }
  else
  {
    uint64_t v5 = *(void *)(a1 + 32);
    if (v5) {
      (*(void (**)(uint64_t, void))(v5 + 16))(v5, 0);
    }
  }

  return MEMORY[0x270F9A828]();
}

- (void)_reportBugButtonTapped
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  [WeakRetained siriContentDidReceiveReportBugAction:self];
}

- (void)_reportBugButtonLongPressed
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  [WeakRetained siriContentDidReceiveReportBugLongPress:self];
}

- (BOOL)_shouldShowBugReportButton
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  LOBYTE(v2) = [WeakRetained compactViewShouldShowDebugButton:v2];

  return (char)v2;
}

- (void)_constructAndAddSiriXIndicator
{
  if (self->_reportBugButton)
  {
    id v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    siriXIndicator = self->_siriXIndicator;
    self->_siriXIndicator = v3;

    uint64_t v5 = [(UIView *)self->_siriXIndicator layer];
    [(AFUISiriCompactView *)self siriXIndicatorDimension];
    [v5 setCornerRadius:v6 * 0.5];

    [(UIView *)self->_siriXIndicator setAlpha:0.6];
    [(AFUISiriCompactView *)self insertSubview:self->_siriXIndicator below:self->_reportBugButton];
    [(AFUISiriCompactView *)self setRequestHandlingStatus:0];
    [(UIView *)self->_siriXIndicator setTranslatesAutoresizingMaskIntoConstraints:0];
    id v7 = [MEMORY[0x263F08938] constraintWithItem:self->_siriXIndicator attribute:9 relatedBy:0 toItem:self->_reportBugButton attribute:9 multiplier:1.0 constant:0.0];
    [v7 setActive:1];

    CGFloat v8 = [MEMORY[0x263F08938] constraintWithItem:self->_siriXIndicator attribute:10 relatedBy:0 toItem:self->_reportBugButton attribute:10 multiplier:1.0 constant:0.0];
    [v8 setActive:1];

    CGFloat v9 = (void *)MEMORY[0x263F08938];
    double v10 = self->_siriXIndicator;
    [(AFUISiriCompactView *)self siriXIndicatorDimension];
    uint64_t v12 = [v9 constraintWithItem:v10 attribute:7 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v11];
    [v12 setActive:1];

    CGRect v13 = (void *)MEMORY[0x263F08938];
    double v14 = self->_siriXIndicator;
    [(AFUISiriCompactView *)self siriXIndicatorDimension];
    id v16 = [v13 constraintWithItem:v14 attribute:8 relatedBy:0 toItem:0 attribute:0 multiplier:1.0 constant:v15];
    [v16 setActive:1];
  }
}

- (void)setRequestHandlingStatus:(unint64_t)a3
{
  siriXIndicator = self->_siriXIndicator;
  AFUISiriRequestHandlingStatusColor(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)siriXIndicator setBackgroundColor:v4];
}

- (void)animateOrbViewDismissalWithCompletion:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = (os_log_t *)MEMORY[0x263F28348];
  double v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v7 = NSNumber;
    BOOL ignoreSiriSessionUpdates = self->_ignoreSiriSessionUpdates;
    CGFloat v9 = v6;
    double v10 = [v7 numberWithBool:ignoreSiriSessionUpdates];
    int v18 = 136315394;
    double v19 = "-[AFUISiriCompactView animateOrbViewDismissalWithCompletion:]";
    __int16 v20 = 2112;
    double v21 = v10;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v18, 0x16u);
  }
  self->_BOOL ignoreSiriSessionUpdates = 1;
  os_log_t v11 = *v5;
  if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = NSNumber;
    BOOL v13 = self->_ignoreSiriSessionUpdates;
    double v14 = v11;
    double v15 = [v12 numberWithBool:v13];
    int v18 = 136315394;
    double v19 = "-[AFUISiriCompactView animateOrbViewDismissalWithCompletion:]";
    __int16 v20 = 2112;
    double v21 = v15;
    _os_log_impl(&dword_223099000, v14, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v18, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
  double v17 = [WeakRetained edgeLightMaskMetalLayerForView:self];

  if (v17) {
    [v17 animateOffWithCompletion:v4];
  }
  else {
    [(SUICOrbView *)self->_orbView animateToOffWithCompletion:v4];
  }
}

- (CGSize)_sizeForOrbViewContainer
{
  double v2 = 66.0;
  double v3 = 66.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGSize)_sizeForOrbView
{
  double v2 = 198.0;
  double v3 = 198.0;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (CGRect)_remoteContentViewFrame
{
  [(AFUISiriCompactView *)self bounds];
  double v7 = v3;
  double v8 = v5;
  double v9 = v6;
  if (self->_remoteContentViewHidden) {
    double v10 = -CGRectGetHeight(*(CGRect *)&v3);
  }
  else {
    double v10 = 0.0;
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)_lockViewFrame
{
  [(AFUISiriCompactView *)self bounds];
  double v7 = v3;
  double v8 = v5;
  double v9 = v6;
  if (self->_lockViewHidden) {
    double Height = CGRectGetHeight(*(CGRect *)&v3);
  }
  else {
    double Height = 0.0;
  }
  double v11 = v7;
  double v12 = v8;
  double v13 = v9;
  result.size.CGFloat height = v13;
  result.size.CGFloat width = v12;
  result.origin.CGFloat y = Height;
  result.origin.CGFloat x = v11;
  return result;
}

- (CGRect)_orbViewContainerFrame
{
  char IsPad = SiriUIDeviceIsPad();
  [(AFUISiriCompactView *)self _sizeForOrbViewContainer];
  CGFloat v5 = v4;
  double v7 = v6;
  [(AFUISiriCompactView *)self _originXForOrbContainer];
  CGFloat v9 = v8;
  [(AFUISiriCompactView *)self frame];
  double v10 = CGRectGetHeight(v33) - v7 + -44.0;
  if (IsPad)
  {
    v38.origin.CGFloat x = v9;
    v38.origin.CGFloat y = v10;
    v38.size.CGFloat width = v5;
    v38.size.CGFloat height = v7;
    if (CGRectIntersectsRect(self->_dockFrame, v38) && !self->_saeEnabled) {
      double v10 = v10 - self->_dockFrame.size.height;
    }
  }
  p_orbViewContainerFrame = &self->_orbViewContainerFrame;
  v34.origin.CGFloat x = v9;
  v34.origin.CGFloat y = v10;
  v34.size.CGFloat width = v5;
  v34.size.CGFloat height = v7;
  if (!CGRectEqualToRect(v34, self->_orbViewContainerFrame))
  {
    p_orbViewContainerFrame->origin.CGFloat x = v9;
    self->_orbViewContainerFrame.origin.CGFloat y = v10;
    self->_orbViewContainerFrame.size.CGFloat width = v5;
    self->_orbViewContainerFrame.size.CGFloat height = v7;
    double v12 = [(AFUISiriCompactView *)self traitCollection];
    char v13 = [v12 isAmbientPresented];

    double v14 = [(UIView *)self->_orbViewContainer superview];
    -[AFUISiriCompactView convertRect:fromView:](self, "convertRect:fromView:", v14, p_orbViewContainerFrame->origin.x, self->_orbViewContainerFrame.origin.y, self->_orbViewContainerFrame.size.width, self->_orbViewContainerFrame.size.height);
    double v16 = v15;
    CGFloat v18 = v17;
    CGFloat v20 = v19;
    CGFloat v22 = v21;

    double v23 = 0.0;
    if ((v13 & 1) == 0)
    {
      [(AFUISiriCompactView *)self bounds];
      CGFloat Height = CGRectGetHeight(v35);
      CGFloat v25 = v16;
      double v26 = Height;
      v36.origin.CGFloat x = v25;
      v36.origin.CGFloat y = v18;
      v36.size.CGFloat width = v20;
      v36.size.CGFloat height = v22;
      double v23 = v26 - CGRectGetMinY(v36);
    }
    if (self->_saeEnabled) {
      double v27 = 0.0;
    }
    else {
      double v27 = v23;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
    [WeakRetained compactView:self bottomContentInsetDidChange:v27];
  }
  double v29 = v9;
  double v30 = v10;
  double v31 = v5;
  double v32 = v7;
  result.size.CGFloat height = v32;
  result.size.CGFloat width = v31;
  result.origin.CGFloat y = v30;
  result.origin.CGFloat x = v29;
  return result;
}

- (void)layoutSubviews
{
  v33.receiver = self;
  v33.super_class = (Class)AFUISiriCompactView;
  [(AFUISiriCompactView *)&v33 layoutSubviews];
  [(AFUISiriCompactView *)self bounds];
  double v7 = v3;
  double v8 = v4;
  double v9 = v5;
  double v10 = v6;
  if (!self->_inFluidDismissal) {
    -[UIView setFrame:](self->_foregroundContainerView, "setFrame:", v3, v4, v5, v6);
  }
  -[AFUISiriCompactDimmingView setFrame:](self->_dimmingBackdropView, "setFrame:", v7, v8, v9, v10);
  remoteContentView = self->_remoteContentView;
  [(AFUISiriCompactView *)self _remoteContentViewFrame];
  -[UIView setFrame:](remoteContentView, "setFrame:");
  -[UIView setFrame:](self->_blurringAndLockContainer, "setFrame:", v7, v8, v9, v10);
  lockContainerView = self->_lockContainerView;
  [(AFUISiriCompactView *)self _lockViewFrame];
  -[AFUIPasscodeContainerView setFrame:](lockContainerView, "setFrame:");
  orbViewContainer = self->_orbViewContainer;
  [(AFUISiriCompactView *)self _orbViewContainerFrame];
  -[UIView setFrame:](orbViewContainer, "setFrame:");
  if (!self->_saeEnabled)
  {
    [(AFUISiriCompactView *)self _sizeForOrbViewContainer];
    double v15 = v14;
    double v17 = v16;
    [(AFUISiriCompactView *)self _sizeForOrbView];
    double v19 = v18;
    double v21 = v20;
    double v22 = (v15 - v18) * 0.5;
    double v23 = (v17 - v20) * 0.5;
    orbView = self->_orbView;
    CGFloat v25 = [MEMORY[0x263F82B60] mainScreen];
    [v25 scale];
    BOOL v27 = v26 < 2.0;
    double v28 = ceil(v22);
    double v29 = ceil(v23);
    double v30 = ceil(v19);
    double v31 = ceil(v21);
    if (!v27)
    {
      double v28 = v22;
      double v29 = v23;
      double v30 = v19;
      double v31 = v21;
    }
    -[SUICOrbView setFrame:](orbView, "setFrame:", v28, v29, v30, v31);
  }
  touchInputView = self->_touchInputView;
  [(UIView *)self->_orbViewContainer frame];
  -[AFUITouchInputView setFrame:](touchInputView, "setFrame:");
  -[UIView setFrame:](self->_voiceActivationMaskView, "setFrame:", v7, v8, v9, v10);
  -[AFUISiriEyesFreeView setFrame:](self->_eyesFreeView, "setFrame:", v7, v8, v9, v10);
}

- (void)setRemoteContentView:(id)a3
{
  double v5 = (UIView *)a3;
  p_remoteContentView = &self->_remoteContentView;
  remoteContentView = self->_remoteContentView;
  if (remoteContentView != v5)
  {
    double v11 = v5;
    [(UIView *)remoteContentView removeFromSuperview];
    objc_storeStrong((id *)&self->_remoteContentView, a3);
    double v8 = *p_remoteContentView;
    if (*p_remoteContentView)
    {
      [(AFUISiriCompactView *)self frame];
      -[UIView setFrame:](v8, "setFrame:");
    }
    if (self->_voiceActivationMaskView)
    {
      foregroundContainerView = self->_foregroundContainerView;
      double v10 = *p_remoteContentView;
    }
    else
    {
      foregroundContainerView = self->_foregroundContainerView;
      double v10 = *p_remoteContentView;
      if (!self->_orbViewContainer)
      {
        remoteContentView = (UIView *)[(UIView *)foregroundContainerView addSubview:v10];
        goto LABEL_8;
      }
    }
    remoteContentView = (UIView *)-[UIView insertSubview:belowSubview:](foregroundContainerView, "insertSubview:belowSubview:", v10);
LABEL_8:
    double v5 = v11;
  }

  MEMORY[0x270F9A758](remoteContentView, v5);
}

- (void)setTamaleView:(id)a3
{
  double v5 = (SiriSharedUITamaleView *)a3;
  p_tamaleView = (id *)&self->_tamaleView;
  tamaleView = self->_tamaleView;
  if (tamaleView != v5)
  {
    double v11 = v5;
    [(SiriSharedUITamaleView *)tamaleView removeFromSuperview];
    objc_storeStrong((id *)&self->_tamaleView, a3);
    id v8 = *p_tamaleView;
    double v9 = [MEMORY[0x263F82B60] mainScreen];
    [v9 bounds];
    objc_msgSend(v8, "setFrame:");

    [*p_tamaleView setAlpha:0.0];
    id v10 = *p_tamaleView;
    if (self->_foregroundContainerView) {
      tamaleView = (SiriSharedUITamaleView *)-[AFUISiriCompactView insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v10);
    }
    else {
      tamaleView = (SiriSharedUITamaleView *)-[AFUISiriCompactView insertSubview:atIndex:](self, "insertSubview:atIndex:", v10);
    }
    double v5 = v11;
  }

  MEMORY[0x270F9A758](tamaleView, v5);
}

- (void)setSiriSessionState:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  double v5 = (os_log_t *)MEMORY[0x263F28348];
  double v6 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    double v7 = NSNumber;
    BOOL ignoreSiriSessionUpdates = self->_ignoreSiriSessionUpdates;
    double v9 = v6;
    id v10 = [v7 numberWithBool:ignoreSiriSessionUpdates];
    int v24 = 136315394;
    CGFloat v25 = "-[AFUISiriCompactView setSiriSessionState:]";
    __int16 v26 = 2112;
    BOOL v27 = v10;
    _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v24, 0x16u);
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  uint64_t v12 = [WeakRetained compactViewRequestAttendingState:self];

  if ((self->_siriSessionState != a3 || self->_isAttending != v12) && !self->_ignoreSiriSessionUpdates)
  {
    self->_isAttending = v12;
    -[SUICOrbView setMode:](self->_orbView, "setMode:", [MEMORY[0x263F744A8] orbViewModeForSiriSessionState:a3 isAttending:v12]);
    os_log_t v13 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      double v14 = NSNumber;
      BOOL v15 = self->_ignoreSiriSessionUpdates;
      double v16 = v13;
      double v17 = [v14 numberWithBool:v15];
      int v24 = 136315394;
      CGFloat v25 = "-[AFUISiriCompactView setSiriSessionState:]";
      __int16 v26 = 2112;
      BOOL v27 = v17;
      _os_log_impl(&dword_223099000, v16, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation _ignoreSiriSessionUpdates: %@", (uint8_t *)&v24, 0x16u);
    }
    os_log_t v18 = *v5;
    if (os_log_type_enabled(*v5, OS_LOG_TYPE_DEFAULT))
    {
      double v19 = NSNumber;
      int64_t siriSessionState = self->_siriSessionState;
      double v21 = v18;
      double v22 = [v19 numberWithInteger:siriSessionState];
      double v23 = [NSNumber numberWithInteger:a3];
      int v24 = 136315650;
      CGFloat v25 = "-[AFUISiriCompactView setSiriSessionState:]";
      __int16 v26 = 2112;
      BOOL v27 = v22;
      __int16 v28 = 2112;
      double v29 = v23;
      _os_log_impl(&dword_223099000, v21, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation old state: %@ | new  state:  %@", (uint8_t *)&v24, 0x20u);
    }
    self->_int64_t siriSessionState = a3;
  }
}

- (void)setSiriContentDelegate:(id)a3
{
  id obj = a3;
  p_siriContentDelegate = &self->_siriContentDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_siriContentDelegate);

  double v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_siriContentDelegate, obj);
    double v6 = obj;
  }
}

- (void)setVoiceActivationMaskViewVisible:(BOOL)a3
{
  if (a3)
  {
    [(AFUISiriCompactView *)self _setupVoiceActivationMaskView];
  }
  else if (self->_voiceActivationMaskView)
  {
    objc_initWeak(&location, self);
    double v3 = (void *)MEMORY[0x263F82E00];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke;
    v6[3] = &unk_2646919D8;
    objc_copyWeak(&v7, &location);
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke_2;
    v4[3] = &unk_264691A00;
    objc_copyWeak(&v5, &location);
    [v3 animateWithDuration:v6 animations:v4 completion:0.4];
    objc_destroyWeak(&v5);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

void __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v2 = WeakRetained;
    [WeakRetained[57] setAlpha:0.0];
    id WeakRetained = v2;
  }
}

void __57__AFUISiriCompactView_setVoiceActivationMaskViewVisible___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    double v3 = WeakRetained;
    [WeakRetained[57] removeFromSuperview];
    id v2 = v3[57];
    v3[57] = 0;

    id WeakRetained = v3;
  }
}

- (void)setAuxiliaryViewsHidden:(BOOL)a3 animated:(BOOL)a4
{
  if (self->_auxiliaryViewsHidden != a3)
  {
    self->_auxiliaryViewsHidden = a3;
    if (a3) {
      double v4 = 0.0;
    }
    else {
      double v4 = 1.0;
    }
    v6[1] = 3221225472;
    double v5 = 0.3;
    v6[0] = MEMORY[0x263EF8330];
    v6[2] = __56__AFUISiriCompactView_setAuxiliaryViewsHidden_animated___block_invoke;
    v6[3] = &unk_264692D80;
    void v6[4] = self;
    if (!a4) {
      double v5 = 0.0;
    }
    *(double *)&v6[5] = v4;
    BOOL v7 = a3;
    [MEMORY[0x263F82E00] animateWithDuration:v6 animations:v5];
  }
}

uint64_t __56__AFUISiriCompactView_setAuxiliaryViewsHidden_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 440) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 560) setAlpha:*(double *)(a1 + 40)];
  [*(id *)(*(void *)(a1 + 32) + 568) setHidden:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(*(void *)(a1 + 32) + 448) setHidden:*(unsigned __int8 *)(a1 + 48)];
  [*(id *)(a1 + 32) setNeedsLayout];
  id v2 = *(void **)(a1 + 32);

  return [v2 layoutIfNeeded];
}

- (void)_setupVoiceActivationMaskView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  [(AFUISiriCompactView *)self frame];
  double v4 = (UIView *)objc_msgSend(v3, "initWithFrame:");
  voiceActivationMaskView = self->_voiceActivationMaskView;
  self->_voiceActivationMaskView = v4;

  double v6 = self->_voiceActivationMaskView;
  BOOL v7 = [MEMORY[0x263F825C8] blackColor];
  [(UIView *)v6 setBackgroundColor:v7];

  foregroundContainerView = self->_foregroundContainerView;
  double v9 = self->_voiceActivationMaskView;
  orbViewContainer = self->_orbViewContainer;

  [(UIView *)foregroundContainerView insertSubview:v9 belowSubview:orbViewContainer];
}

- (void)setFullScreenDimmingLayerVisible:(BOOL)a3 animated:(BOOL)a4
{
  self->_dimmingViewVisible = a3;
  -[AFUISiriCompactDimmingView setVisible:animated:](self->_dimmingBackdropView, "setVisible:animated:");
}

- (void)backgroundBlurViewController:(id)a3 didSetBlurVisibilityTo:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v13 = *MEMORY[0x263EF8340];
  self->_blurViewVisible = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  [WeakRetained compactView:self blurVisibilityDidChange:v4];

  BOOL v7 = *MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v8 = @"not visible";
    if (v4) {
      id v8 = @"visible";
    }
    int v9 = 136315394;
    id v10 = "-[AFUISiriCompactView backgroundBlurViewController:didSetBlurVisibilityTo:]";
    __int16 v11 = 2112;
    uint64_t v12 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #compact Blur Visibility changed to %@", (uint8_t *)&v9, 0x16u);
  }
}

- (void)_setUpEyesFreePresentation:(int64_t)a3
{
  self->_isEyesFree = 1;
  double v5 = [AFUISiriEyesFreeView alloc];
  [(AFUISiriCompactView *)self bounds];
  double v6 = -[AFUISiriEyesFreeView initWithFrame:eyesFreeMode:](v5, "initWithFrame:eyesFreeMode:", a3);
  eyesFreeView = self->_eyesFreeView;
  self->_eyesFreeView = v6;

  [(AFUISiriEyesFreeView *)self->_eyesFreeView setAlpha:0.0];
  id v8 = [(AFUISiriCompactView *)self edgeLightViewProvider];

  if (v8)
  {
    id v11 = [(AFUISiriCompactView *)self edgeLightViewProvider];
    [v11 insertEyesFreeView:self->_eyesFreeView];
  }
  else
  {
    int v9 = self->_eyesFreeView;
    foregroundContainerView = self->_foregroundContainerView;
    [(AFUISiriCompactView *)self insertSubview:v9 belowSubview:foregroundContainerView];
  }
}

- (void)showPasscodeUnlockWithStatusText:(id)a3 subtitle:(id)a4 completionHandler:(id)a5 unlockCompletionHandler:(id)a6
{
}

- (void)_animateLockViewIsAnimatingIn:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  [MEMORY[0x263F158F8] begin];
  if (v6) {
    [MEMORY[0x263F158F8] setCompletionBlock:v6];
  }
  [(AFUISiriCompactView *)self _remoteContentViewFrame];
  double MinY = CGRectGetMinY(v22);
  self->_remoteContentViewHidden = v4;
  id v8 = objc_opt_class();
  remoteContentView = self->_remoteContentView;
  [(AFUISiriCompactView *)self _remoteContentViewFrame];
  double v10 = CGRectGetMinY(v23);
  if (self->_remoteContentViewHidden) {
    uint64_t v11 = 2;
  }
  else {
    uint64_t v11 = 1;
  }
  [v8 _animateView:remoteContentView fromYPosition:v11 toYPosition:0 fade:MinY completion:v10];
  [(AFUISiriCompactView *)self _lockViewFrame];
  double v12 = CGRectGetMinY(v24);
  self->_lockViewHidden = !v4;
  uint64_t v13 = objc_opt_class();
  lockContainerView = self->_lockContainerView;
  [(AFUISiriCompactView *)self _lockViewFrame];
  double v15 = CGRectGetMinY(v25);
  if (self->_lockViewHidden) {
    uint64_t v16 = 2;
  }
  else {
    uint64_t v16 = 1;
  }
  [v13 _animateView:lockContainerView fromYPosition:v16 toYPosition:0 fade:v12 completion:v15];
  double v17 = 0.0;
  if (!self->_lockViewHidden) {
    double v17 = 1.0;
  }
  [(SUICOrbView *)self->_orbView setAlpha:v17];
  orbViewContainer = self->_orbViewContainer;
  [(AFUISiriCompactView *)self _orbViewContainerFrame];
  -[UIView setFrame:](orbViewContainer, "setFrame:");
  v21[0] = MEMORY[0x263EF8330];
  v21[1] = 3221225472;
  v21[2] = __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke;
  v21[3] = &unk_264691A50;
  v21[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v21 animations:0 completion:0.3];
  [(UIView *)self->_blurringAndLockContainer setUserInteractionEnabled:!self->_lockViewHidden];
  fullScreenBlurViewController = self->_fullScreenBlurViewController;
  if (fullScreenBlurViewController)
  {
    if (v4)
    {
      v20[0] = MEMORY[0x263EF8330];
      v20[1] = 3221225472;
      v20[2] = __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke_2;
      v20[3] = &unk_264691A50;
      v20[4] = self;
      [MEMORY[0x263F82E00] animateWithDuration:v20 animations:0 completion:1.0];
    }
    else
    {
      [(SiriUIBackgroundBlurViewController *)fullScreenBlurViewController requestBackgroundBlurVisible:1 forReason:2];
    }
  }
  [MEMORY[0x263F158F8] commit];
}

uint64_t __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  double v2 = 1.0;
  if (!*(unsigned char *)(v1 + 649)) {
    double v2 = 0.0;
  }
  return [*(id *)(v1 + 440) setAlpha:v2];
}

uint64_t __64__AFUISiriCompactView__animateLockViewIsAnimatingIn_completion___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 632) requestBackgroundBlurVisible:1 forReason:2];
}

+ (void)_animateView:(id)a3 fromYPosition:(double)a4 toYPosition:(double)a5 fade:(int64_t)a6 completion:(id)a7
{
  id v28 = a3;
  id v11 = a7;
  [MEMORY[0x263F158F8] begin];
  if (v11) {
    [MEMORY[0x263F158F8] setCompletionBlock:v11];
  }
  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  id v13 = objc_alloc_init(MEMORY[0x263F15890]);
  [v13 setKeyPath:@"position.y"];
  double v14 = [NSNumber numberWithDouble:a4];
  [v13 setFromValue:v14];

  double v15 = [NSNumber numberWithDouble:a5];
  [v13 setToValue:v15];

  [v13 setMass:4.0];
  [v13 setStiffness:600.0];
  [v13 setDamping:800.0];
  [v12 addObject:v13];
  if (a6)
  {
    BOOL v16 = a6 == 2;
    BOOL v17 = a6 != 2;
    uint64_t v18 = v16;
    if (v16) {
      double v19 = 0.1;
    }
    else {
      double v19 = 32.0;
    }
    double v20 = [NSNumber numberWithInt:v18];
    a6 = [NSNumber numberWithInt:v17];
    id v21 = objc_alloc_init(MEMORY[0x263F15890]);
    [v21 setKeyPath:@"opacity"];
    [v21 setFromValue:v20];
    [v21 setToValue:a6];
    [v21 setMass:v19];
    [v21 setStiffness:600.0];
    [v21 setDamping:800.0];
    [v12 addObject:v21];
  }
  id v22 = objc_alloc_init(MEMORY[0x263F15750]);
  [v22 setRemovedOnCompletion:1];
  CGRect v23 = [MEMORY[0x263F74478] defaultTimingFunction];
  [v22 setTimingFunction:v23];

  [MEMORY[0x263F74478] defaultAnimationDuration];
  objc_msgSend(v22, "setDuration:");
  [v22 setBeginTime:CACurrentMediaTime()];
  [v22 setFillMode:*MEMORY[0x263F15AA0]];
  [v22 setAnimations:v12];
  CGRect v24 = [v28 layer];
  [v24 addAnimation:v22 forKey:@"Animation Group"];

  [MEMORY[0x263F158F8] commit];
  if (a6)
  {
    CGRect v25 = [v28 layer];
    [(id)a6 floatValue];
    objc_msgSend(v25, "setOpacity:");
  }
  __int16 v26 = [v28 layer];
  objc_msgSend(v26, "setAnchorPoint:", 0.0, 0.0);

  BOOL v27 = [v28 layer];
  objc_msgSend(v27, "setPosition:", 0.0, a5);
}

- (void)passcodeView:(id)a3 hideLockViewWithResult:(int64_t)a4 unlockCompletionHandler:(id)a5
{
  BOOL v7 = _Block_copy(a5);
  if (v7)
  {
    [MEMORY[0x263F74478] defaultAnimationDuration];
    dispatch_time_t v9 = dispatch_time(0, (uint64_t)(v8 * 0.15 * 1000000000.0));
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke;
    block[3] = &unk_264691AF0;
    id v12 = v7;
    int64_t v13 = a4;
    dispatch_after(v9, MEMORY[0x263EF83A0], block);
  }
  self->_inHideUnlockViewAnimation = 1;
  self->_inShowUnlockViewAnimation = 0;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  id v10[2] = __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2;
  v10[3] = &unk_264691A50;
  v10[4] = self;
  [(AFUISiriCompactView *)self _animateLockViewIsAnimatingIn:0 completion:v10];
}

uint64_t __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

uint64_t __83__AFUISiriCompactView_passcodeView_hideLockViewWithResult_unlockCompletionHandler___block_invoke_2(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 652) = 0;
  return result;
}

- (BOOL)passcodeView:(id)a3 attemptUnlockWithPassword:(id)a4
{
  BOOL v4 = self;
  p_siriContentDelegate = &self->_siriContentDelegate;
  id v6 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)p_siriContentDelegate);
  LOBYTE(v4) = [WeakRetained siriView:v4 attemptUnlockWithPassword:v6];

  return (char)v4;
}

- (void)passcodeView:(id)a3 animateShowPasscodeWithCompletionHandler:(id)a4
{
  id v5 = a4;
  self->_inShowUnlockViewAnimation = 1;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke;
  v11[3] = &unk_264691A50;
  v11[4] = self;
  [(AFUISiriCompactView *)self _animateLockViewIsAnimatingIn:1 completion:v11];
  [MEMORY[0x263F74478] defaultAnimationDuration];
  dispatch_time_t v7 = dispatch_time(0, (uint64_t)(v6 * 0.15 * 1000000000.0));
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2;
  v9[3] = &unk_264691AC8;
  id v10 = v5;
  id v8 = v5;
  dispatch_after(v7, MEMORY[0x263EF83A0], v9);
}

void __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 651) = 0;
  [*(id *)(a1 + 32) setNeedsLayout];
  id v1 = [MEMORY[0x263F283F8] sharedAnalytics];
  [v1 logEventWithType:1433 context:0];
}

uint64_t __77__AFUISiriCompactView_passcodeView_animateShowPasscodeWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, 1);
  }
  return result;
}

- (void)dealloc
{
  [(SUICOrbView *)self->_orbView invalidate];
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)AFUISiriCompactView;
  [(AFUISiriCompactView *)&v4 dealloc];
}

- (void)updateVolumeInputdB:(float)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
  id v5 = [WeakRetained edgeLightMaskMetalLayerForView:self];
  *(float *)&double v6 = a3;
  [v5 updateVolumeInputdB:v6];
}

- (void)dismissalBlur:(float)a3
{
  if (self->_saeEnabled)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);
    id v5 = [WeakRetained edgeLightMaskMetalLayerForView:self];
    *(float *)&double v6 = a3;
    [v5 dismissalBlur:v6];
  }
}

- (void)setInputPowerLevel:(float)a3
{
  if (self->_shouldUpdatePowerLevel)
  {
    id v5 = (void *)MEMORY[0x263F744A8];
    int64_t siriSessionState = self->_siriSessionState;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
    uint64_t v8 = objc_msgSend(v5, "orbViewModeForSiriSessionState:isAttending:", siriSessionState, objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self));

    if (v8 == 1)
    {
      orbView = self->_orbView;
      *(float *)&double v9 = a3;
      [(SUICOrbView *)orbView setPowerLevel:v9];
    }
  }
}

- (void)setOutputPowerLevel:(float)a3
{
  if (self->_shouldUpdatePowerLevel)
  {
    id v5 = (void *)MEMORY[0x263F744A8];
    int64_t siriSessionState = self->_siriSessionState;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
    uint64_t v8 = objc_msgSend(v5, "orbViewModeForSiriSessionState:isAttending:", siriSessionState, objc_msgSend(WeakRetained, "compactViewRequestAttendingState:", self));

    if (v8 == 3)
    {
      orbView = self->_orbView;
      *(float *)&double v9 = a3;
      [(SUICOrbView *)orbView setPowerLevel:v9];
    }
  }
}

- (void)animateOrbViewToOffWithCompletion:(id)a3
{
  p_edgeLightViewProvider = &self->_edgeLightViewProvider;
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_edgeLightViewProvider);
  id v7 = [WeakRetained edgeLightMaskMetalLayerForView:self];

  if (v7) {
    [v7 animateOffWithCompletion:v5];
  }
  else {
    [(SUICOrbView *)self->_orbView animateToOffWithCompletion:v5];
  }
}

- (void)setContentViewsAlpha:(double)a3
{
  -[UIView setAlpha:](self->_remoteContentView, "setAlpha:");
  eyesFreeView = self->_eyesFreeView;

  [(AFUISiriEyesFreeView *)eyesFreeView setAlpha:a3];
}

- (void)touchesBeganForInputView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  int v5 = [WeakRetained compactViewRequestAttendingState:self];

  if (v5)
  {
    self->_shouldUpdatePowerLevel = 0;
    LODWORD(v6) = -1039400960;
    [(SUICOrbView *)self->_orbView setPowerLevel:v6];
    [(AFUISiriCompactView *)self performSelector:sel__playHaptic withObject:0 afterDelay:0.2];
    [(AFUISiriCompactView *)self performSelector:sel_touchesEndedForInputView_ withObject:0 afterDelay:0.2];
    memset(&v9, 0, sizeof(v9));
    CATransform3DMakeScale(&v9, 1.12, 1.12, 1.0);
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    CATransform3D v8 = v9;
    v7[2] = __48__AFUISiriCompactView_touchesBeganForInputView___block_invoke;
    v7[3] = &unk_264692DF8;
    v7[4] = self;
    [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v7 tracking:0 dampingRatioSmoothing:0.4 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.008];
  }
}

void __48__AFUISiriCompactView_touchesBeganForInputView___block_invoke(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 120);
  long long v11 = *(_OWORD *)(a1 + 104);
  long long v12 = v1;
  long long v2 = *(_OWORD *)(a1 + 152);
  long long v13 = *(_OWORD *)(a1 + 136);
  long long v14 = v2;
  long long v3 = *(_OWORD *)(a1 + 56);
  long long v7 = *(_OWORD *)(a1 + 40);
  long long v8 = v3;
  long long v4 = *(_OWORD *)(a1 + 88);
  long long v9 = *(_OWORD *)(a1 + 72);
  long long v10 = v4;
  int v5 = [*(id *)(*(void *)(a1 + 32) + 440) layer];
  void v6[4] = v11;
  v6[5] = v12;
  void v6[6] = v13;
  v6[7] = v14;
  v6[0] = v7;
  v6[1] = v8;
  v6[2] = v9;
  v6[3] = v10;
  [v5 setTransform:v6];
}

- (void)touchesEndedForInputView:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_compactViewDelegate);
  char v5 = [WeakRetained compactViewRequestAttendingState:self];

  if (v5)
  {
    self->_shouldUpdatePowerLevel = 1;
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel__playHaptic object:0];
    [(id)objc_opt_class() cancelPreviousPerformRequestsWithTarget:self selector:sel_touchesEndedForInputView_ object:0];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __48__AFUISiriCompactView_touchesEndedForInputView___block_invoke;
    v6[3] = &unk_264691A50;
    void v6[4] = self;
    [MEMORY[0x263F82E00] _animateUsingSpringWithDampingRatio:1 response:v6 tracking:0 dampingRatioSmoothing:0.4 responseSmoothing:0.5 targetSmoothing:0.0 projectionDeceleration:0.0 retargetImpulse:0.0 animations:0.0 completion:0.008];
  }
  else
  {
    [(AFUISiriCompactView *)self _handleTouchEndedForNonAttendingConfiguration];
  }
}

void __48__AFUISiriCompactView_touchesEndedForInputView___block_invoke(uint64_t a1)
{
  long long v1 = [*(id *)(*(void *)(a1 + 32) + 440) layer];
  long long v2 = *(_OWORD *)(MEMORY[0x263F15740] + 80);
  void v6[4] = *(_OWORD *)(MEMORY[0x263F15740] + 64);
  void v6[5] = v2;
  long long v3 = *(_OWORD *)(MEMORY[0x263F15740] + 112);
  void v6[6] = *(_OWORD *)(MEMORY[0x263F15740] + 96);
  v6[7] = v3;
  long long v4 = *(_OWORD *)(MEMORY[0x263F15740] + 16);
  v6[0] = *MEMORY[0x263F15740];
  v6[1] = v4;
  long long v5 = *(_OWORD *)(MEMORY[0x263F15740] + 48);
  v6[2] = *(_OWORD *)(MEMORY[0x263F15740] + 32);
  v6[3] = v5;
  [v1 setTransform:v6];
}

- (void)_handleTouchEndedForNonAttendingConfiguration
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
  [WeakRetained siriContentDidReceiveOrbTappedAction:self];
}

- (void)_playHaptic
{
  id v2 = (id)[objc_alloc(MEMORY[0x263F82830]) initWithStyle:2];
  [v2 _setOutputMode:5];
  [v2 prepare];
  [v2 impactOccurred];
}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (int64_t)siriSessionState
{
  return self->_siriSessionState;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (UIView)foregroundContainerView
{
  return self->_foregroundContainerView;
}

- (BOOL)isBlurViewVisible
{
  return self->_blurViewVisible;
}

- (BOOL)isDimmingViewVisible
{
  return self->_dimmingViewVisible;
}

- (int64_t)currentInterfaceOrientation
{
  return self->_currentInterfaceOrientation;
}

- (void)setCurrentInterfaceOrientation:(int64_t)a3
{
  self->_currentInterfaceOrientation = a3;
}

- (AFUISiriEdgelightViewProvider)edgeLightViewProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_edgeLightViewProvider);

  return (AFUISiriEdgelightViewProvider *)WeakRetained;
}

- (void)setEdgeLightViewProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_edgeLightViewProvider);
  objc_storeStrong((id *)&self->_foregroundContainerView, 0);
  objc_storeStrong((id *)&self->_tamaleView, 0);
  objc_storeStrong((id *)&self->_lockContainerView, 0);
  objc_storeStrong((id *)&self->_fullScreenBlurViewController, 0);
  objc_storeStrong((id *)&self->_blurringAndLockContainer, 0);
  objc_storeStrong((id *)&self->_eyesFreeView, 0);
  objc_storeStrong((id *)&self->_siriXIndicator, 0);
  objc_storeStrong((id *)&self->_reportBugButton, 0);
  objc_destroyWeak((id *)&self->_compactViewDelegate);
  objc_destroyWeak((id *)&self->_siriContentDelegate);
  objc_storeStrong((id *)&self->_dimmingBackdropView, 0);
  objc_storeStrong((id *)&self->_longPressRecognizer, 0);
  objc_storeStrong((id *)&self->_voiceActivationMaskView, 0);
  objc_storeStrong((id *)&self->_touchInputView, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
  objc_storeStrong((id *)&self->_orbViewContainer, 0);

  objc_storeStrong((id *)&self->_remoteContentView, 0);
}

@end