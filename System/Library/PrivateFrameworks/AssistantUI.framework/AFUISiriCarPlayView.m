@interface AFUISiriCarPlayView
- (AFUISiriCarPlayView)initWithFrame:(CGRect)a3 viewDelegate:(id)a4 instrumentationHandler:(id)a5;
- (BOOL)_deviceSupportsAI;
- (CGRect)orbViewRectInCarplayView;
- (UIView)remoteContentView;
- (id)_SUICOrbViewModeGetDescription:(int64_t)a3;
- (id)siriXIndicatorView;
- (int64_t)_orbViewModeForCurrentSessionState;
- (int64_t)mode;
- (int64_t)siriSessionState;
- (void)_animateEdgeLightToOffWithCompletion:(id)a3;
- (void)_animateEdgeLightToOn;
- (void)_animateLatencyLightToOff;
- (void)_animateLatencyLightToOn;
- (void)_orbHeldWithGestureRecognizer:(id)a3;
- (void)_orbTappedWithGestureRecognizer:(id)a3;
- (void)_setupContentViews;
- (void)_setupEdgeLightView;
- (void)_setupLatencyLightView;
- (void)_setupOrbView;
- (void)_updateEdgeLightBackgroundColor:(id)a3;
- (void)_updateEdgeLightToMatchSessionState:(int64_t)a3;
- (void)_updateOrbViewModeToMatchSessionState;
- (void)animateOrbViewToOffWithCompletion:(id)a3;
- (void)animateOutEdgeLight;
- (void)dealloc;
- (void)didMoveToWindow;
- (void)initializeEdgeLightForRequest:(id)a3;
- (void)layoutSubviews;
- (void)removeFromSuperview;
- (void)resetOrbViewToSiriSessionState;
- (void)setAuxiliaryViewsHidden:(BOOL)a3 animated:(BOOL)a4;
- (void)setContentViewsAlpha:(double)a3;
- (void)setInputPowerLevel:(float)a3;
- (void)setMode:(int64_t)a3;
- (void)setOutputPowerLevel:(float)a3;
- (void)setRemoteContentView:(id)a3;
- (void)setRequestHandlingStatus:(unint64_t)a3;
- (void)setSiriContentDelegate:(id)a3;
- (void)setSiriSessionState:(int64_t)a3;
- (void)setupEdgeLightBackgroundView;
- (void)updateVolumeInputdB:(float)a3;
@end

@implementation AFUISiriCarPlayView

- (AFUISiriCarPlayView)initWithFrame:(CGRect)a3 viewDelegate:(id)a4 instrumentationHandler:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v11 = a4;
  id v12 = a5;
  v17.receiver = self;
  v17.super_class = (Class)AFUISiriCarPlayView;
  v13 = -[AFUISiriCarPlayView initWithFrame:](&v17, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    v13->_mode = 5;
    objc_storeWeak((id *)&v13->_viewDelegate, v11);
    [(AFUISiriCarPlayView *)v14 setupEdgeLightBackgroundView];
    v15 = [(AFUISiriCarPlayView *)v14 layer];
    [v15 setAllowsGroupOpacity:0];

    [(AFUISiriCarPlayView *)v14 _setupContentViews];
    objc_storeStrong((id *)&v14->_viewHostingInstrumentationHandler, a5);
  }

  return v14;
}

- (void)dealloc
{
  [(SUICOrbView *)self->_orbView invalidate];
  [(CRSUIStatusBarStyleAssertion *)self->_statusBarStyleAssertion invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AFUISiriCarPlayView;
  [(AFUISiriCarPlayView *)&v3 dealloc];
}

- (void)removeFromSuperview
{
  v6.receiver = self;
  v6.super_class = (Class)AFUISiriCarPlayView;
  [(AFUISiriCarPlayView *)&v6 removeFromSuperview];
  if ([(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    statusBarStyleAssertion = self->_statusBarStyleAssertion;
    v4 = [MEMORY[0x263F29BC8] settingsWithDuration:0.0];
    [(CRSUIStatusBarStyleAssertion *)statusBarStyleAssertion relinquishWithAnimationSettings:v4];

    [(CRSUIStatusBarStyleAssertion *)self->_statusBarStyleAssertion invalidate];
    v5 = self->_statusBarStyleAssertion;
    self->_statusBarStyleAssertion = 0;
  }
}

- (void)didMoveToWindow
{
  v10.receiver = self;
  v10.super_class = (Class)AFUISiriCarPlayView;
  [(AFUISiriCarPlayView *)&v10 didMoveToWindow];
  objc_super v3 = [(AFUISiriCarPlayView *)self window];

  if (v3 && [(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    statusBarStyleAssertion = self->_statusBarStyleAssertion;
    v5 = [MEMORY[0x263F29BC8] settingsWithDuration:0.0];
    [(CRSUIStatusBarStyleAssertion *)statusBarStyleAssertion acquireWithAnimationSettings:v5];

    edgeLightMask = self->_edgeLightMask;
    v7 = [(AFUISiriCarPlayView *)self window];
    v8 = [v7 screen];
    [(SUICEdgeLightMaskMetalLayer *)edgeLightMask setScreen:v8];

    if (self->_launchIntoEdgeLightAnimation)
    {
      v9 = [(AFUISiriCarPlayView *)self window];
      [v9 bounds];
      -[AFUISiriCarPlayView setFrame:](self, "setFrame:");

      self->_launchIntoEdgeLightAnimation = 0;
      [(AFUISiriCarPlayView *)self _animateEdgeLightToOn];
    }
  }
}

- (void)animateOutEdgeLight
{
  if ([(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    id v3 = [MEMORY[0x263F825C8] clearColor];
    [(AFUISiriCarPlayView *)self _updateEdgeLightBackgroundColor:v3];
  }
}

- (int64_t)siriSessionState
{
  return self->_siriSessionState;
}

- (CGRect)orbViewRectInCarplayView
{
  orbContainerView = self->_orbContainerView;
  [(SUICOrbView *)self->_orbView frame];

  -[UIView convertRect:toView:](orbContainerView, "convertRect:toView:", self);
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (id)siriXIndicatorView
{
  return self->_siriXIndicatorView;
}

- (void)setRemoteContentView:(id)a3
{
  v26[4] = *MEMORY[0x263EF8340];
  double v5 = (UIView *)a3;
  p_remoteContentView = &self->_remoteContentView;
  remoteContentView = self->_remoteContentView;
  if (remoteContentView != v5)
  {
    if (remoteContentView)
    {
      v8 = (void *)MEMORY[0x263F08938];
      v9 = [(UIView *)remoteContentView constraints];
      [v8 deactivateConstraints:v9];

      [(UIView *)*p_remoteContentView removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_remoteContentView, a3);
    if (*p_remoteContentView)
    {
      [(UIView *)*p_remoteContentView setTranslatesAutoresizingMaskIntoConstraints:0];
      BOOL v10 = [(AFUISiriCarPlayView *)self _deviceSupportsAI];
      id v11 = *p_remoteContentView;
      if (v10) {
        [(AFUISiriCarPlayView *)self insertSubview:v11 aboveSubview:self->_edgeLightBackgroundView];
      }
      else {
        [(AFUISiriCarPlayView *)self insertSubview:v11 atIndex:0];
      }
      v25 = [(UIView *)*p_remoteContentView topAnchor];
      v24 = [(AFUISiriCarPlayView *)self topAnchor];
      v23 = [v25 constraintEqualToAnchor:v24];
      v26[0] = v23;
      v22 = [(UIView *)*p_remoteContentView leadingAnchor];
      id v12 = [(AFUISiriCarPlayView *)self leadingAnchor];
      v13 = [v22 constraintEqualToAnchor:v12];
      v26[1] = v13;
      v14 = [(UIView *)*p_remoteContentView trailingAnchor];
      v15 = [(AFUISiriCarPlayView *)self trailingAnchor];
      v16 = [v14 constraintEqualToAnchor:v15];
      v26[2] = v16;
      objc_super v17 = [(UIView *)*p_remoteContentView bottomAnchor];
      v18 = [(AFUISiriCarPlayView *)self bottomAnchor];
      v19 = [v17 constraintEqualToAnchor:v18];
      v26[3] = v19;
      v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v26 count:4];
      [v21 activateConstraints:v20];
    }
  }
}

- (void)setSiriSessionState:(int64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (self->_siriSessionState != a3)
  {
    double v5 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      double v6 = v5;
      double v7 = SRUIFSiriSessionStateGetDescription();
      v8 = SRUIFSiriSessionStateGetDescription();
      int v9 = 136315650;
      BOOL v10 = "-[AFUISiriCarPlayView setSiriSessionState:]";
      __int16 v11 = 2112;
      id v12 = v7;
      __int16 v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_223099000, v6, OS_LOG_TYPE_DEFAULT, "%s session state %@ -> %@", (uint8_t *)&v9, 0x20u);
    }
    self->_siriSessionState = a3;
    if ([MEMORY[0x263F286B8] isSAEEnabled]) {
      [(AFUISiriCarPlayView *)self _updateEdgeLightToMatchSessionState:a3];
    }
    else {
      [(AFUISiriCarPlayView *)self _updateOrbViewModeToMatchSessionState];
    }
  }
}

- (void)resetOrbViewToSiriSessionState
{
  if (self->_siriSessionState || [(SUICOrbView *)self->_orbView mode])
  {
    [(AFUISiriCarPlayView *)self _updateOrbViewModeToMatchSessionState];
  }
}

- (void)_updateOrbViewModeToMatchSessionState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v3 = [(SUICOrbView *)self->_orbView mode];
  int64_t v4 = [(AFUISiriCarPlayView *)self _orbViewModeForCurrentSessionState];
  double v5 = (void *)*MEMORY[0x263F28348];
  BOOL v6 = os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT);
  if (v3 == v4)
  {
    if (v6)
    {
      double v7 = v5;
      v8 = [(AFUISiriCarPlayView *)self _SUICOrbViewModeGetDescription:v3];
      int v12 = 136315394;
      __int16 v13 = "-[AFUISiriCarPlayView _updateOrbViewModeToMatchSessionState]";
      __int16 v14 = 2112;
      uint64_t v15 = v8;
      _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation mode stays at %@", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    if (v6)
    {
      int v9 = v5;
      BOOL v10 = [(AFUISiriCarPlayView *)self _SUICOrbViewModeGetDescription:v3];
      __int16 v11 = [(AFUISiriCarPlayView *)self _SUICOrbViewModeGetDescription:v4];
      int v12 = 136315650;
      __int16 v13 = "-[AFUISiriCarPlayView _updateOrbViewModeToMatchSessionState]";
      __int16 v14 = 2112;
      uint64_t v15 = v10;
      __int16 v16 = 2112;
      objc_super v17 = v11;
      _os_log_impl(&dword_223099000, v9, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation mode %@ -> %@", (uint8_t *)&v12, 0x20u);
    }
    [(SUICOrbView *)self->_orbView setMode:v4];
  }
}

- (void)setAuxiliaryViewsHidden:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  [(SUICOrbView *)self->_orbView alpha];
  if (v5)
  {
    if (v7 == 0.0) {
      return;
    }
    v8 = [(UIView *)self->_orbContainerView layer];
    [v8 setAllowsHitTesting:0];
  }
  else if (v7 == 1.0)
  {
    return;
  }
  double v9 = 0.200000003;
  if (!v4) {
    double v9 = 0.0;
  }
  v12[0] = MEMORY[0x263EF8330];
  v12[1] = 3221225472;
  v12[2] = __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke;
  v12[3] = &unk_2646919B0;
  v12[4] = self;
  BOOL v13 = v5;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke_2;
  v10[3] = &unk_264693038;
  BOOL v11 = v5;
  v10[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:v12 animations:v10 completion:v9];
}

uint64_t __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke(uint64_t a1)
{
  double v1 = 0.0;
  if (!*(unsigned char *)(a1 + 40)) {
    double v1 = 1.0;
  }
  return [*(id *)(*(void *)(a1 + 32) + 448) setAlpha:v1];
}

void __56__AFUISiriCarPlayView_setAuxiliaryViewsHidden_animated___block_invoke_2(uint64_t a1)
{
  if (!*(unsigned char *)(a1 + 40))
  {
    id v1 = [*(id *)(*(void *)(a1 + 32) + 480) layer];
    [v1 setAllowsHitTesting:1];
  }
}

- (void)setSiriContentDelegate:(id)a3
{
  id obj = a3;
  p_siriContentDelegate = &self->_siriContentDelegate;
  id WeakRetained = objc_loadWeakRetained((id *)p_siriContentDelegate);

  BOOL v6 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)p_siriContentDelegate, obj);
    BOOL v6 = obj;
  }
}

- (void)setRequestHandlingStatus:(unint64_t)a3
{
  siriXIndicatorView = self->_siriXIndicatorView;
  AFUISiriRequestHandlingStatusColor(a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(UIView *)siriXIndicatorView setBackgroundColor:v4];
}

- (void)setupEdgeLightBackgroundView
{
  if ([(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    uint64_t v3 = objc_alloc_init(AFUITouchPassThroughView);
    edgeLightBackgroundView = self->_edgeLightBackgroundView;
    self->_edgeLightBackgroundView = v3;

    -[AFUITouchPassThroughView setFrame:](self->_edgeLightBackgroundView, "setFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    BOOL v5 = [(AFUITouchPassThroughView *)self->_edgeLightBackgroundView layer];
    [v5 setAllowsHitTesting:0];

    BOOL v6 = [MEMORY[0x263F825C8] clearColor];
    [(AFUITouchPassThroughView *)self->_edgeLightBackgroundView setBackgroundColor:v6];

    [(AFUITouchPassThroughView *)self->_edgeLightBackgroundView setAutoresizingMask:18];
    double v7 = self->_edgeLightBackgroundView;
    [(AFUISiriCarPlayView *)self addSubview:v7];
  }
}

- (void)initializeEdgeLightForRequest:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_lastRequestOptions, a3);
  uint64_t v5 = [v13 requestSource];
  if (v5 == 14)
  {
    edgeLightMask = self->_edgeLightMask;
    uint64_t v7 = 0;
  }
  else
  {
    unint64_t v8 = v5;
    int v9 = [v13 isRightHandDrive];
    [(AFUISiriCarPlayView *)self safeAreaInsets];
    if (v10 > 0.0
      || ([(AFUISiriCarPlayView *)self safeAreaInsets], v11 > 0.0)
      || v8 <= 0x2B && ((1 << v8) & 0x80000001100) != 0)
    {
      edgeLightMask = self->_edgeLightMask;
      if (v9) {
        uint64_t v7 = 4;
      }
      else {
        uint64_t v7 = 3;
      }
    }
    else
    {
      edgeLightMask = self->_edgeLightMask;
      uint64_t v7 = 2;
    }
  }
  [(SUICEdgeLightMaskMetalLayer *)edgeLightMask setBurstStartPosition:v7];
  self->_edgeLightOffAndInitialized = 1;
  if (+[AFUICarPlayUtilities isRequestForDirectAction:v13])
  {
    LODWORD(v12) = 1045220557;
    [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask setMinimumPowerLevel:v12];
    self->_edgeLightMinimumPowerEnabled = 1;
    [(AFUISiriCarPlayView *)self _animateEdgeLightToOn];
  }
}

- (void)_updateEdgeLightToMatchSessionState:(int64_t)a3
{
  if (a3 == 2)
  {
    if ([(UIView *)self->_latencyLightView isHidden])
    {
      [(AFUISiriCarPlayView *)self _animateLatencyLightToOn];
    }
  }
  else
  {
    if (a3 == 1)
    {
      [(AFUISiriCarPlayView *)self _animateEdgeLightToOn];
      if (self->_edgeLightMinimumPowerEnabled) {
        [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask setMinimumPowerLevel:0.0];
      }
    }
    if (![(UIView *)self->_latencyLightView isHidden])
    {
      [(AFUISiriCarPlayView *)self _animateLatencyLightToOff];
    }
  }
}

- (void)_animateEdgeLightToOn
{
  if (self->_edgeLightOffAndInitialized)
  {
    uint64_t v3 = [(AFUISiriCarPlayView *)self window];

    if (v3)
    {
      self->_edgeLightOffAndInitialized = 0;
      objc_initWeak(&location, self);
      edgeLightMask = self->_edgeLightMask;
      v15[0] = MEMORY[0x263EF8330];
      v15[1] = 3221225472;
      v15[2] = __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke;
      v15[3] = &unk_2646919D8;
      objc_copyWeak(&v16, &location);
      [(SUICEdgeLightMaskMetalLayer *)edgeLightMask animateOnWithCompletion:v15];
      uint64_t v5 = [(AFUISiriCarPlayView *)self traitCollection];
      BOOL v6 = [v5 userInterfaceStyle] == 1;

      uint64_t v7 = (void *)MEMORY[0x263F82E00];
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      double v11 = __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke_2;
      double v12 = &unk_264691B40;
      objc_copyWeak(&v13, &location);
      BOOL v14 = v6;
      [v7 animateWithDuration:&v9 animations:0.419999987];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);
      objc_msgSend(WeakRetained, "playCarPlayShockwave", v9, v10, v11, v12);

      objc_destroyWeak(&v13);
      objc_destroyWeak(&v16);
      objc_destroyWeak(&location);
    }
    else
    {
      self->_launchIntoEdgeLightAnimation = 1;
    }
  }
}

void __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[64] appearanceDidChange:1 machAbsoluteTime:mach_absolute_time()];
    id WeakRetained = v2;
  }
}

void __44__AFUISiriCarPlayView__animateEdgeLightToOn__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:dbl_2230F5E70[*(unsigned char *)(a1 + 40) == 0]];
  [WeakRetained _updateEdgeLightBackgroundColor:v2];
}

- (void)_animateEdgeLightToOffWithCompletion:(id)a3
{
  self->_edgeLightOffAndInitialized = 0;
  [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask animateOffWithCompletion:a3];
}

- (void)_animateLatencyLightToOn
{
  [(UIView *)self->_latencyLightView setAlpha:0.0];
  [(UIView *)self->_latencyLightView setHidden:0];
  objc_initWeak(&location, self);
  uint64_t v3 = (void *)MEMORY[0x263F82E00];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __47__AFUISiriCarPlayView__animateLatencyLightToOn__block_invoke;
  v4[3] = &unk_2646919D8;
  objc_copyWeak(&v5, &location);
  [v3 animateWithDuration:v4 animations:0.419999987];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __47__AFUISiriCarPlayView__animateLatencyLightToOn__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[59] setAlpha:1.0];
    id WeakRetained = v2;
  }
}

- (void)_animateLatencyLightToOff
{
  objc_initWeak(&location, self);
  v2 = (void *)MEMORY[0x263F82E00];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke;
  v5[3] = &unk_2646919D8;
  objc_copyWeak(&v6, &location);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke_2;
  v3[3] = &unk_264691A00;
  objc_copyWeak(&v4, &location);
  [v2 animateWithDuration:v5 animations:v3 completion:0.419999987];
  objc_destroyWeak(&v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[59] setAlpha:0.0];
    id WeakRetained = v2;
  }
}

void __48__AFUISiriCarPlayView__animateLatencyLightToOff__block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained[59] setHidden:1];
    id WeakRetained = v2;
  }
}

- (void)_updateEdgeLightBackgroundColor:(id)a3
{
}

- (void)_orbTappedWithGestureRecognizer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    uint64_t v7 = v5;
    unint64_t v8 = objc_msgSend(v6, "numberWithInteger:", objc_msgSend(v4, "state"));
    int v10 = 136315394;
    double v11 = "-[AFUISiriCarPlayView _orbTappedWithGestureRecognizer:]";
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbUIInteraction Mic Button Tapped State %@", (uint8_t *)&v10, 0x16u);
  }
  if ([v4 state] == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    [WeakRetained siriContentDidReceiveOrbTappedAction:self];
  }
}

- (void)_orbHeldWithGestureRecognizer:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v4 = [a3 state];
  id v5 = (void *)*MEMORY[0x263F28348];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = NSNumber;
    uint64_t v7 = v5;
    unint64_t v8 = [v6 numberWithInteger:v4];
    int v10 = 136315394;
    double v11 = "-[AFUISiriCarPlayView _orbHeldWithGestureRecognizer:]";
    __int16 v12 = 2112;
    id v13 = v8;
    _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #OrbUIInteraction Mic Button Held State %@", (uint8_t *)&v10, 0x16u);
  }
  if (v4 == 1)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    [WeakRetained siriContentDidReceiveOrbHoldDidBeginAction:self];
  }
  else
  {
    if ((unint64_t)(v4 - 3) > 1) {
      return;
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_siriContentDelegate);
    [WeakRetained siriContentDidReceiveOrbHoldDidEndAction:self];
  }
}

- (void)_setupContentViews
{
  v21[4] = *MEMORY[0x263EF8340];
  if ([(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    [(AFUISiriCarPlayView *)self _setupEdgeLightView];
    [(AFUISiriCarPlayView *)self _setupLatencyLightView];
  }
  else
  {
    [(AFUISiriCarPlayView *)self _setupOrbView];
  }
  if (+[AFUIUtilities shouldShowSiriXIndicator])
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    uint64_t v4 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    siriXIndicatorView = self->_siriXIndicatorView;
    self->_siriXIndicatorView = v4;

    [(UIView *)self->_siriXIndicatorView setTranslatesAutoresizingMaskIntoConstraints:0];
    id v6 = [(UIView *)self->_siriXIndicatorView layer];
    [v6 setCornerRadius:2.5];

    uint64_t v7 = [(UIView *)self->_siriXIndicatorView layer];
    [v7 setAllowsHitTesting:0];

    [(AFUISiriCarPlayView *)self setRequestHandlingStatus:0];
    [(AFUISiriCarPlayView *)self addSubview:self->_siriXIndicatorView];
    v19 = [(UIView *)self->_siriXIndicatorView leadingAnchor];
    v20 = [(AFUISiriCarPlayView *)self safeAreaLayoutGuide];
    uint64_t v18 = [v20 leadingAnchor];
    objc_super v17 = [v19 constraintEqualToAnchor:v18 constant:5.0];
    v21[0] = v17;
    unint64_t v8 = [(UIView *)self->_siriXIndicatorView bottomAnchor];
    uint64_t v9 = [(AFUISiriCarPlayView *)self safeAreaLayoutGuide];
    int v10 = [v9 bottomAnchor];
    double v11 = [v8 constraintEqualToAnchor:v10 constant:-5.0];
    v21[1] = v11;
    __int16 v12 = [(UIView *)self->_siriXIndicatorView widthAnchor];
    id v13 = [v12 constraintEqualToConstant:5.0];
    v21[2] = v13;
    uint64_t v14 = [(UIView *)self->_siriXIndicatorView heightAnchor];
    uint64_t v15 = [v14 constraintEqualToConstant:5.0];
    v21[3] = v15;
    id v16 = [MEMORY[0x263EFF8C0] arrayWithObjects:v21 count:4];
    [v3 addObjectsFromArray:v16];

    [MEMORY[0x263F08938] activateConstraints:v3];
  }
}

- (void)_setupEdgeLightView
{
  v35[1] = *MEMORY[0x263EF8340];
  id v3 = (SUICEdgeLightMaskMetalLayer *)objc_opt_new();
  edgeLightMask = self->_edgeLightMask;
  self->_edgeLightMask = v3;

  [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask setAllowsHitTesting:0];
  id v5 = self->_edgeLightMask;
  [(AFUISiriCarPlayView *)self bounds];
  -[SUICEdgeLightMaskMetalLayer setFrame:](v5, "setFrame:");
  [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask setUserInterfaceIdiom:3];
  LODWORD(v6) = 1058642330;
  [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask setFlameScale:v6];
  [(SUICEdgeLightMaskMetalLayer *)self->_edgeLightMask setCompositingFilter:*MEMORY[0x263F15D10]];
  id v7 = objc_alloc(MEMORY[0x263F83008]);
  [(AFUISiriCarPlayView *)self bounds];
  unint64_t v8 = (UIView *)objc_msgSend(v7, "initWithFrame:preferringAudioReactivity:", 1);
  systemLightView = self->_systemLightView;
  self->_systemLightView = v8;

  [(UIView *)self->_systemLightView setUserInteractionEnabled:0];
  int v10 = [(UIView *)self->_systemLightView layer];
  double v11 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15B40]];
  __int16 v12 = (void *)MEMORY[0x263F08D40];
  CAColorMatrixMakeMultiplyColor();
  id v13 = [v12 valueWithCAColorMatrix:v33];
  [v11 setValue:v13 forKey:*MEMORY[0x263F15C30]];

  [v11 setValue:MEMORY[0x263EFFA80] forKey:*MEMORY[0x263F15BE8]];
  v35[0] = v11;
  uint64_t v14 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:1];
  [v10 setFilters:v14];

  [v10 setOpaque:0];
  [v10 setAllowsHitTesting:0];
  v32 = v10;
  [v10 addSublayer:self->_edgeLightMask];
  [(AFUISiriCarPlayView *)self addSubview:self->_systemLightView];
  [(UIView *)self->_systemLightView setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = (void *)MEMORY[0x263EFF980];
  v31 = [(UIView *)self->_systemLightView bottomAnchor];
  v30 = [(AFUISiriCarPlayView *)self bottomAnchor];
  v29 = [v31 constraintEqualToAnchor:v30 constant:0.0];
  v34[0] = v29;
  v28 = [(UIView *)self->_systemLightView topAnchor];
  v27 = [(AFUISiriCarPlayView *)self topAnchor];
  id v16 = [v28 constraintEqualToAnchor:v27 constant:0.0];
  v34[1] = v16;
  objc_super v17 = [(UIView *)self->_systemLightView leadingAnchor];
  uint64_t v18 = [(AFUISiriCarPlayView *)self leadingAnchor];
  v19 = [v17 constraintEqualToAnchor:v18 constant:0.0];
  v34[2] = v19;
  v20 = [(UIView *)self->_systemLightView trailingAnchor];
  id v21 = [(AFUISiriCarPlayView *)self trailingAnchor];
  v22 = [v20 constraintEqualToAnchor:v21 constant:0.0];
  v34[3] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:4];
  v24 = [v15 arrayWithArray:v23];

  [MEMORY[0x263F08938] activateConstraints:v24];
  if (!self->_statusBarStyleAssertion)
  {
    v25 = (CRSUIStatusBarStyleAssertion *)[objc_alloc(MEMORY[0x263F31580]) initForSiriPresentation];
    statusBarStyleAssertion = self->_statusBarStyleAssertion;
    self->_statusBarStyleAssertion = v25;
  }
}

- (void)_setupLatencyLightView
{
  id v3 = objc_alloc_init(_TtC11AssistantUI26AFUISiriCarPlayLatencyView);
  latencyLightView = self->_latencyLightView;
  self->_latencyLightView = &v3->super;

  id v5 = self->_latencyLightView;
  [(AFUISiriCarPlayView *)self bounds];
  -[UIView setFrame:](v5, "setFrame:");
  [(UIView *)self->_latencyLightView setAutoresizingMask:18];
  [(UIView *)self->_latencyLightView setHidden:1];
  double v6 = [(UIView *)self->_latencyLightView layer];
  [v6 setAllowsHitTesting:0];

  id v7 = self->_latencyLightView;
  systemLightView = self->_systemLightView;

  [(AFUISiriCarPlayView *)self insertSubview:v7 aboveSubview:systemLightView];
}

- (void)_setupOrbView
{
  v47[8] = *MEMORY[0x263EF8340];
  id v3 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
  orbContainerView = self->_orbContainerView;
  self->_orbContainerView = v3;

  [(UIView *)self->_orbContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
  id v5 = [(UIView *)self->_orbContainerView layer];
  [v5 setHitTestsAsOpaque:1];

  [(AFUISiriCarPlayView *)self addSubview:self->_orbContainerView];
  double v6 = [MEMORY[0x263F82B60] _carScreen];
  [v6 scale];
  UISizeRoundToScale();
  double v8 = v7;
  double v10 = v9;

  double v11 = (void *)[objc_alloc(MEMORY[0x263F82938]) initWithTarget:self action:sel__orbHeldWithGestureRecognizer_];
  [v11 setMinimumPressDuration:0.25];
  v46 = v11;
  [(UIView *)self->_orbContainerView addGestureRecognizer:v11];
  v45 = (void *)[objc_alloc(MEMORY[0x263F82CB0]) initWithTarget:self action:sel__orbTappedWithGestureRecognizer_];
  [v45 requireGestureRecognizerToFail:v11];
  [(UIView *)self->_orbContainerView addGestureRecognizer:v45];
  __int16 v12 = [MEMORY[0x263F82B60] _carScreen];
  [v12 scale];
  UISizeRoundToScale();
  double v14 = v13;
  double v16 = v15;

  objc_super v17 = (SUICOrbView *)objc_msgSend(objc_alloc(MEMORY[0x263F75438]), "initWithFrame:", 0.0, 0.0, v14, v16);
  orbView = self->_orbView;
  self->_orbView = v17;

  [(SUICOrbView *)self->_orbView setTranslatesAutoresizingMaskIntoConstraints:0];
  v19 = [(SUICOrbView *)self->_orbView layer];
  [v19 setAllowsHitTesting:0];

  [(UIView *)self->_orbContainerView addSubview:self->_orbView];
  v35 = (void *)MEMORY[0x263EFF980];
  v43 = [(UIView *)self->_orbContainerView bottomAnchor];
  v44 = [(AFUISiriCarPlayView *)self safeAreaLayoutGuide];
  v42 = [v44 bottomAnchor];
  v41 = [v43 constraintEqualToAnchor:v42 constant:-12.5];
  v47[0] = v41;
  v39 = [(UIView *)self->_orbContainerView centerXAnchor];
  v40 = [(AFUISiriCarPlayView *)self safeAreaLayoutGuide];
  v38 = [v40 centerXAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v47[1] = v37;
  v36 = [(UIView *)self->_orbContainerView widthAnchor];
  v34 = [v36 constraintEqualToConstant:v8];
  v47[2] = v34;
  v33 = [(UIView *)self->_orbContainerView heightAnchor];
  v32 = [v33 constraintEqualToConstant:v10];
  v47[3] = v32;
  v31 = [(SUICOrbView *)self->_orbView centerYAnchor];
  v30 = [(UIView *)self->_orbContainerView centerYAnchor];
  v20 = [v31 constraintEqualToAnchor:v30];
  v47[4] = v20;
  id v21 = [(SUICOrbView *)self->_orbView centerXAnchor];
  v22 = [(UIView *)self->_orbContainerView centerXAnchor];
  v23 = [v21 constraintEqualToAnchor:v22];
  v47[5] = v23;
  v24 = [(SUICOrbView *)self->_orbView widthAnchor];
  v25 = [v24 constraintEqualToConstant:v14];
  v47[6] = v25;
  v26 = [(SUICOrbView *)self->_orbView heightAnchor];
  v27 = [v26 constraintEqualToConstant:v16];
  v47[7] = v27;
  v28 = [MEMORY[0x263EFF8C0] arrayWithObjects:v47 count:8];
  v29 = [v35 arrayWithArray:v28];

  [MEMORY[0x263F08938] activateConstraints:v29];
}

- (id)_SUICOrbViewModeGetDescription:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2) {
    return @"Off";
  }
  else {
    return off_264693058[a3 - 1];
  }
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)AFUISiriCarPlayView;
  [(AFUISiriCarPlayView *)&v4 layoutSubviews];
  if ([(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    edgeLightMask = self->_edgeLightMask;
    [(AFUISiriCarPlayView *)self bounds];
    -[SUICEdgeLightMaskMetalLayer setFrame:](edgeLightMask, "setFrame:");
  }
}

- (void)updateVolumeInputdB:(float)a3
{
}

- (int64_t)_orbViewModeForCurrentSessionState
{
  v2 = (void *)MEMORY[0x263F744A8];
  int64_t siriSessionState = self->_siriSessionState;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_viewDelegate);
  int64_t v5 = objc_msgSend(v2, "orbViewModeForSiriSessionState:isAttending:", siriSessionState, objc_msgSend(WeakRetained, "requestSessionAttendingState"));

  return v5;
}

- (void)setInputPowerLevel:(float)a3
{
  if ([(SUICOrbView *)self->_orbView mode] == 1)
  {
    orbView = self->_orbView;
    *(float *)&double v5 = a3;
    [(SUICOrbView *)orbView setPowerLevel:v5];
  }
}

- (void)setOutputPowerLevel:(float)a3
{
  if ([(SUICOrbView *)self->_orbView mode] == 3)
  {
    orbView = self->_orbView;
    *(float *)&double v5 = a3;
    [(SUICOrbView *)orbView setPowerLevel:v5];
  }
}

- (void)animateOrbViewToOffWithCompletion:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(AFUISiriCarPlayView *)self _deviceSupportsAI])
  {
    [(AFUISiriCarPlayView *)self _animateEdgeLightToOffWithCompletion:v4];
  }
  else
  {
    double v5 = (void *)*MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_DEFAULT))
    {
      orbView = self->_orbView;
      double v7 = v5;
      double v8 = [(AFUISiriCarPlayView *)self _SUICOrbViewModeGetDescription:[(SUICOrbView *)orbView mode]];
      double v9 = [(AFUISiriCarPlayView *)self _SUICOrbViewModeGetDescription:0];
      int v10 = 136315650;
      double v11 = "-[AFUISiriCarPlayView animateOrbViewToOffWithCompletion:]";
      __int16 v12 = 2112;
      double v13 = v8;
      __int16 v14 = 2112;
      double v15 = v9;
      _os_log_impl(&dword_223099000, v7, OS_LOG_TYPE_DEFAULT, "%s #orbAnimation mode %@ -> %@", (uint8_t *)&v10, 0x20u);
    }
    [(SUICOrbView *)self->_orbView animateToOffWithCompletion:v4];
  }
}

- (void)setContentViewsAlpha:(double)a3
{
}

- (BOOL)_deviceSupportsAI
{
  return [MEMORY[0x263F286B8] isSAEEnabled];
}

- (UIView)remoteContentView
{
  return self->_remoteContentView;
}

- (int64_t)mode
{
  return self->_mode;
}

- (void)setMode:(int64_t)a3
{
  self->_mode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgeLightBackgroundView, 0);
  objc_storeStrong((id *)&self->_lastRequestOptions, 0);
  objc_storeStrong((id *)&self->_viewHostingInstrumentationHandler, 0);
  objc_storeStrong((id *)&self->_siriXIndicatorView, 0);
  objc_storeStrong((id *)&self->_statusBarStyleAssertion, 0);
  objc_storeStrong((id *)&self->_orbContainerView, 0);
  objc_storeStrong((id *)&self->_latencyLightView, 0);
  objc_storeStrong((id *)&self->_systemLightView, 0);
  objc_storeStrong((id *)&self->_edgeLightMask, 0);
  objc_storeStrong((id *)&self->_orbView, 0);
  objc_storeStrong((id *)&self->_remoteContentView, 0);
  objc_destroyWeak((id *)&self->_viewDelegate);

  objc_destroyWeak((id *)&self->_siriContentDelegate);
}

@end