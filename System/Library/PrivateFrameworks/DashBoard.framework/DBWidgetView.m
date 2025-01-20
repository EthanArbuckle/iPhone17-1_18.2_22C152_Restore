@interface DBWidgetView
- (BOOL)_canFade;
- (BOOL)canBecomeFirstResponder;
- (BOOL)canBecomeFocused;
- (BOOL)focusFaded;
- (DBEnvironmentConfiguration)environmentConfiguration;
- (DBWidgetFocusRingView)focusRingView;
- (DBWidgetView)initWithFrame:(CGRect)a3 focusEnabledProvider:(id)a4 environmentConfiguration:(id)a5;
- (DBWidgetViewFocusEnabledProviding)focusEnabledProvider;
- (MTShadowView)shadowView;
- (NSTimer)focusFadeTimer;
- (UIView)contentView;
- (UIView)highContrastBackgroundColorView;
- (_TtC9DashBoard22DBDashboardPlatterView)platterView;
- (void)_evaluateFocusFade;
- (void)_fadeFocusRing;
- (void)_startFadeTimerIfNecessary;
- (void)_unfadeFocusRing;
- (void)_wheelChangedWithEvent:(id)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)session:(id)a3 didUpdateNightMode:(BOOL)a4;
- (void)setContentView:(id)a3;
- (void)setEnvironmentConfiguration:(id)a3;
- (void)setFocusEnabledProvider:(id)a3;
- (void)setFocusFadeTimer:(id)a3;
- (void)setFocusFaded:(BOOL)a3;
- (void)setFocusRingView:(id)a3;
- (void)setHighContrastBackgroundColorView:(id)a3;
- (void)setPlatterView:(id)a3;
- (void)setShadowView:(id)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAppearanceForWallpaper;
@end

@implementation DBWidgetView

- (DBWidgetView)initWithFrame:(CGRect)a3 focusEnabledProvider:(id)a4 environmentConfiguration:(id)a5
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v81[4] = *MEMORY[0x263EF8340];
  id v11 = a4;
  id v12 = a5;
  v79.receiver = self;
  v79.super_class = (Class)DBWidgetView;
  v13 = -[DBWidgetView initWithFrame:](&v79, sel_initWithFrame_, x, y, width, height);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_environmentConfiguration, a5);
    objc_storeWeak((id *)&v14->_focusEnabledProvider, v11);
    v15 = [v12 session];
    [v15 addObserver:v14];

    uint64_t v76 = 1065353216;
    long long v77 = xmmword_22D86EDD0;
    uint64_t v78 = 0x4010000000000000;
    uint64_t v16 = [objc_alloc(MEMORY[0x263F53FF0]) initWithShadowAttributes:&v76 maskCornerRadius:9.0];
    shadowView = v14->_shadowView;
    v14->_shadowView = (MTShadowView *)v16;

    [(DBWidgetView *)v14 addSubview:v14->_shadowView];
    v18 = [DBWidgetFocusRingView alloc];
    v19 = -[DBWidgetFocusRingView initWithFrame:](v18, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
    [(DBWidgetFocusRingView *)v19 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(DBWidgetFocusRingView *)v19 setHidden:1];
    focusRingView = v14->_focusRingView;
    v14->_focusRingView = v19;
    v21 = v19;

    [(DBWidgetView *)v14 addSubview:v21];
    v63 = (void *)MEMORY[0x263F08938];
    v71 = [(DBWidgetView *)v14 topAnchor];
    v69 = [(DBWidgetFocusRingView *)v21 topAnchor];
    v67 = [v71 constraintEqualToAnchor:v69 constant:4.0];
    v81[0] = v67;
    v65 = [(DBWidgetView *)v14 bottomAnchor];
    [(DBWidgetFocusRingView *)v21 bottomAnchor];
    v22 = id v75 = v11;
    v23 = [v65 constraintEqualToAnchor:v22 constant:-4.0];
    v81[1] = v23;
    v24 = [(DBWidgetView *)v14 leftAnchor];
    v25 = v21;
    v73 = v21;
    v26 = [(DBWidgetFocusRingView *)v21 leftAnchor];
    v27 = [v24 constraintEqualToAnchor:v26 constant:4.0];
    v81[2] = v27;
    v28 = [(DBWidgetView *)v14 rightAnchor];
    v29 = [(DBWidgetFocusRingView *)v25 rightAnchor];
    [v28 constraintEqualToAnchor:v29 constant:-4.0];
    v30 = id v74 = v12;
    v81[3] = v30;
    v31 = [MEMORY[0x263EFF8C0] arrayWithObjects:v81 count:4];
    [v63 activateConstraints:v31];

    v32 = objc_alloc_init(_TtC9DashBoard22DBDashboardPlatterView);
    [(DBDashboardPlatterView *)v32 setPlatterCornerRadius:9.0];
    [(DBDashboardPlatterView *)v32 setTranslatesAutoresizingMaskIntoConstraints:0];
    platterView = v14->_platterView;
    v14->_platterView = v32;
    v34 = v32;

    [(DBWidgetView *)v14 addSubview:v34];
    v35 = (UIView *)objc_alloc_init(MEMORY[0x263F82E00]);
    [(UIView *)v35 setTranslatesAutoresizingMaskIntoConstraints:0];
    v36 = objc_msgSend(MEMORY[0x263F825C8], "crsui_dashboardWidgetBackgroundColor");
    [(UIView *)v35 setBackgroundColor:v36];

    v37 = [(UIView *)v35 layer];
    [v37 setCornerRadius:9.0];

    v38 = [(UIView *)v35 layer];
    [v38 setCornerCurve:*MEMORY[0x263F15A20]];

    [(DBWidgetView *)v14 addSubview:v35];
    highContrastBackgroundColorView = v14->_highContrastBackgroundColorView;
    v14->_highContrastBackgroundColorView = v35;
    v40 = v35;

    v55 = (void *)MEMORY[0x263F08938];
    v72 = [(DBWidgetView *)v14 topAnchor];
    v70 = [(DBDashboardPlatterView *)v34 topAnchor];
    v68 = [v72 constraintEqualToAnchor:v70];
    v80[0] = v68;
    v66 = [(DBWidgetView *)v14 bottomAnchor];
    v64 = [(DBDashboardPlatterView *)v34 bottomAnchor];
    v62 = [v66 constraintEqualToAnchor:v64];
    v80[1] = v62;
    v61 = [(DBWidgetView *)v14 leftAnchor];
    v60 = [(DBDashboardPlatterView *)v34 leftAnchor];
    v59 = [v61 constraintEqualToAnchor:v60];
    v80[2] = v59;
    v58 = [(DBWidgetView *)v14 rightAnchor];
    v57 = [(DBDashboardPlatterView *)v34 rightAnchor];
    v56 = [v58 constraintEqualToAnchor:v57];
    v80[3] = v56;
    v54 = [(DBWidgetView *)v14 topAnchor];
    v53 = [(UIView *)v40 topAnchor];
    v52 = [v54 constraintEqualToAnchor:v53];
    v80[4] = v52;
    v51 = [(DBWidgetView *)v14 bottomAnchor];
    v50 = [(UIView *)v40 bottomAnchor];
    v49 = [v51 constraintEqualToAnchor:v50];
    v80[5] = v49;
    v41 = [(DBWidgetView *)v14 leftAnchor];
    v42 = [(UIView *)v40 leftAnchor];
    v43 = [v41 constraintEqualToAnchor:v42];
    v80[6] = v43;
    v44 = [(DBWidgetView *)v14 rightAnchor];
    v45 = [(UIView *)v40 rightAnchor];
    v46 = [v44 constraintEqualToAnchor:v45];
    v80[7] = v46;
    v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:v80 count:8];
    [v55 activateConstraints:v47];

    id v11 = v75;
    id v12 = v74;

    [(DBWidgetView *)v14 updateAppearanceForWallpaper];
  }

  return v14;
}

- (BOOL)canBecomeFocused
{
  v2 = [(DBWidgetView *)self focusEnabledProvider];
  char v3 = [v2 entireWidgetFocusable];

  return v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  v5 = [a3 nextFocusedItem];

  if (v5 == self)
  {
    v8 = [(DBWidgetView *)self focusRingView];
    [v8 setHidden:0];

    v9 = [(DBWidgetView *)self focusRingView];
    [v9 setAlpha:1.0];

    [(DBWidgetView *)self _evaluateFocusFade];
  }
  else
  {
    v6 = [(DBWidgetView *)self focusFadeTimer];
    [v6 invalidate];

    [(DBWidgetView *)self setFocusFadeTimer:0];
    v7 = [(DBWidgetView *)self focusRingView];
    [v7 setHidden:1];
  }
  [(DBWidgetView *)self setNeedsDisplay];
}

- (void)layoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)DBWidgetView;
  [(DBWidgetView *)&v14 layoutSubviews];
  char v3 = [(DBWidgetView *)self shadowView];
  v4 = [(DBWidgetView *)self platterView];
  [v4 frame];
  objc_msgSend(v3, "frameWithContentWithFrame:");
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(DBWidgetView *)self shadowView];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBWidgetView;
  [(DBWidgetView *)&v4 traitCollectionDidChange:a3];
  [(DBWidgetView *)self _evaluateFocusFade];
  [(DBWidgetView *)self updateAppearanceForWallpaper];
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DBWidgetView;
  id v6 = a3;
  [(DBWidgetView *)&v9 touchesBegan:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);

  uint64_t v8 = [v7 type];
  if (v8 == 1)
  {
    [(DBWidgetView *)self _unfadeFocusRing];
    [(DBWidgetView *)self _evaluateFocusFade];
  }
}

- (void)updateAppearanceForWallpaper
{
  char v3 = [(DBWidgetView *)self environmentConfiguration];
  objc_super v4 = [v3 wallpaperPreferences];
  id v14 = [v4 currentWallpaper];

  double v5 = [v14 traits];
  LODWORD(v4) = [v5 supportsDashboardPlatterMaterials];

  if (v4)
  {
    id v6 = [MEMORY[0x263F825C8] _carSystemPrimaryColor];
    double v7 = [(DBWidgetView *)self highContrastBackgroundColorView];
    [v7 setHidden:1];
    uint64_t v8 = 2;
  }
  else
  {
    id v6 = [MEMORY[0x263F825C8] _carSystemFocusColor];
    double v7 = [(DBWidgetView *)self highContrastBackgroundColorView];
    [v7 setHidden:0];
    uint64_t v8 = 0;
  }

  objc_super v9 = [(DBWidgetView *)self focusRingView];
  [v9 setRingColor:v6];

  double v10 = [(DBWidgetView *)self focusRingView];
  [v10 setOverrideUserInterfaceStyle:v8];

  double v11 = [v14 traits];
  uint64_t v12 = [v11 supportsDashboardPlatterMaterials] ^ 1;
  v13 = [(DBWidgetView *)self platterView];
  [v13 setHidden:v12];
}

- (void)_evaluateFocusFade
{
  BOOL v3 = [(DBWidgetView *)self _canFade];
  objc_super v4 = DBLogForCategory(2uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Starting focus ring fade timer", buf, 2u);
    }

    [(DBWidgetView *)self _startFadeTimerIfNecessary];
  }
  else
  {
    if (v5)
    {
      *(_WORD *)double v7 = 0;
      _os_log_impl(&dword_22D6F0000, v4, OS_LOG_TYPE_DEFAULT, "Not eligible for focus ring fade", v7, 2u);
    }

    id v6 = [(DBWidgetView *)self focusFadeTimer];
    [v6 invalidate];

    [(DBWidgetView *)self setFocusFadeTimer:0];
    if ([(DBWidgetView *)self focusFaded]) {
      [(DBWidgetView *)self _unfadeFocusRing];
    }
  }
}

- (void)_startFadeTimerIfNecessary
{
  if ([(DBWidgetView *)self _canFade])
  {
    if (![(DBWidgetView *)self focusFaded])
    {
      objc_initWeak(&location, self);
      BOOL v3 = [(DBWidgetView *)self focusFadeTimer];
      [v3 invalidate];

      objc_super v4 = (void *)MEMORY[0x263EFFA20];
      uint64_t v6 = MEMORY[0x263EF8330];
      uint64_t v7 = 3221225472;
      uint64_t v8 = __42__DBWidgetView__startFadeTimerIfNecessary__block_invoke;
      objc_super v9 = &unk_2649B5350;
      objc_copyWeak(&v10, &location);
      BOOL v5 = [v4 scheduledTimerWithTimeInterval:0 repeats:&v6 block:30.0];
      -[DBWidgetView setFocusFadeTimer:](self, "setFocusFadeTimer:", v5, v6, v7, v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(&location);
    }
  }
}

void __42__DBWidgetView__startFadeTimerIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _fadeFocusRing];
}

- (BOOL)_canFade
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  BOOL v3 = [(DBWidgetView *)self traitCollection];
  uint64_t v4 = [v3 userInterfaceStyle];

  BOOL v5 = [(DBWidgetView *)self environmentConfiguration];
  uint64_t v6 = [v5 session];
  uint64_t v7 = [v6 nightMode];
  char v8 = [v7 BOOLValue];

  objc_super v9 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = NSStringFromBOOL();
    double v11 = NSStringFromBOOL();
    int v16 = 138412546;
    v17 = v10;
    __int16 v18 = 2112;
    v19 = v11;
    _os_log_impl(&dword_22D6F0000, v9, OS_LOG_TYPE_DEFAULT, "Focus ring fade has correct interface style: %@, correct night setting: %@", (uint8_t *)&v16, 0x16u);
  }
  BOOL v12 = v4 == 2;

  v13 = [(DBWidgetView *)self focusRingView];
  char v14 = [v13 isHidden];

  return v12 & ~v14 & v8;
}

- (void)_fadeFocusRing
{
  BOOL v3 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Fading focus ring", buf, 2u);
  }

  [(DBWidgetView *)self becomeFirstResponder];
  [(DBWidgetView *)self setFocusFaded:1];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __30__DBWidgetView__fadeFocusRing__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v4 options:0 animations:3.0 completion:0.0];
}

void __30__DBWidgetView__fadeFocusRing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) focusRingView];
  [v1 setAlpha:0.3];
}

- (void)_unfadeFocusRing
{
  BOOL v3 = DBLogForCategory(2uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_22D6F0000, v3, OS_LOG_TYPE_DEFAULT, "Unfading focus ring", buf, 2u);
  }

  [(DBWidgetView *)self setFocusFaded:0];
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__DBWidgetView__unfadeFocusRing__block_invoke;
  v4[3] = &unk_2649B3E90;
  v4[4] = self;
  [MEMORY[0x263F82E00] animateWithDuration:0 delay:v4 options:0 animations:0.2 completion:0.0];
}

void __32__DBWidgetView__unfadeFocusRing__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) focusRingView];
  [v1 setAlpha:1.0];
}

- (void)_wheelChangedWithEvent:(id)a3
{
  id v4 = a3;
  if ([(DBWidgetView *)self focusFaded])
  {
    [(DBWidgetView *)self _unfadeFocusRing];
    [(DBWidgetView *)self _evaluateFocusFade];
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)DBWidgetView;
    [(DBWidgetView *)&v5 _wheelChangedWithEvent:v4];
  }
}

- (void)session:(id)a3 didUpdateNightMode:(BOOL)a4
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__DBWidgetView_session_didUpdateNightMode___block_invoke;
  block[3] = &unk_2649B3E90;
  block[4] = self;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __43__DBWidgetView_session_didUpdateNightMode___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _evaluateFocusFade];
}

- (DBEnvironmentConfiguration)environmentConfiguration
{
  return self->_environmentConfiguration;
}

- (void)setEnvironmentConfiguration:(id)a3
{
}

- (DBWidgetFocusRingView)focusRingView
{
  return self->_focusRingView;
}

- (void)setFocusRingView:(id)a3
{
}

- (_TtC9DashBoard22DBDashboardPlatterView)platterView
{
  return self->_platterView;
}

- (void)setPlatterView:(id)a3
{
}

- (UIView)highContrastBackgroundColorView
{
  return self->_highContrastBackgroundColorView;
}

- (void)setHighContrastBackgroundColorView:(id)a3
{
}

- (MTShadowView)shadowView
{
  return self->_shadowView;
}

- (void)setShadowView:(id)a3
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (DBWidgetViewFocusEnabledProviding)focusEnabledProvider
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_focusEnabledProvider);
  return (DBWidgetViewFocusEnabledProviding *)WeakRetained;
}

- (void)setFocusEnabledProvider:(id)a3
{
}

- (NSTimer)focusFadeTimer
{
  return self->_focusFadeTimer;
}

- (void)setFocusFadeTimer:(id)a3
{
}

- (BOOL)focusFaded
{
  return self->_focusFaded;
}

- (void)setFocusFaded:(BOOL)a3
{
  self->_focusFaded = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_focusFadeTimer, 0);
  objc_destroyWeak((id *)&self->_focusEnabledProvider);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_highContrastBackgroundColorView, 0);
  objc_storeStrong((id *)&self->_platterView, 0);
  objc_storeStrong((id *)&self->_focusRingView, 0);
  objc_storeStrong((id *)&self->_environmentConfiguration, 0);
}

@end