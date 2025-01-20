@interface DBWidgetViewController
- (BOOL)entireWidgetFocusable;
- (BOOL)isHidden;
- (BOOL)wantsLargeSize;
- (DBEnvironment)environment;
- (DBWidgetViewController)initWithEnvironment:(id)a3;
- (NSArray)linearFocusItems;
- (UIView)contentView;
- (UIView)dimmingView;
- (id)snapshotViewAfterScreenUpdates:(BOOL)a3;
- (void)loadView;
- (void)pressesBegan:(id)a3 withEvent:(id)a4;
- (void)pressesCancelled:(id)a3 withEvent:(id)a4;
- (void)pressesEnded:(id)a3 withEvent:(id)a4;
- (void)setContentView:(id)a3;
- (void)setDimmingView:(id)a3;
- (void)setHidden:(BOOL)a3;
- (void)setWantsLargeSize:(BOOL)a3;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)updateAppearanceForWallpaper;
@end

@implementation DBWidgetViewController

- (DBWidgetViewController)initWithEnvironment:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DBWidgetViewController;
  v5 = [(DBWidgetViewController *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_environment, v4);
  }

  return v6;
}

- (void)loadView
{
  v46[8] = *MEMORY[0x263EF8340];
  v3 = [DBWidgetView alloc];
  id v4 = [(DBWidgetViewController *)self environment];
  v5 = [v4 environmentConfiguration];
  double v6 = *MEMORY[0x263F001A8];
  double v7 = *(double *)(MEMORY[0x263F001A8] + 8);
  double v8 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v9 = *(double *)(MEMORY[0x263F001A8] + 24);
  v10 = self;
  v11 = -[DBWidgetView initWithFrame:focusEnabledProvider:environmentConfiguration:](v3, "initWithFrame:focusEnabledProvider:environmentConfiguration:", self, v5, *MEMORY[0x263F001A8], v7, v8, v9);

  v12 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
  [v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  [v12 setClipsToBounds:1];
  v45 = [v12 layer];
  [v45 setCornerRadius:9.0];
  [v45 setCornerCurve:*MEMORY[0x263F15A20]];
  v13 = v10;
  v44 = v10;
  [(DBWidgetViewController *)v10 setContentView:v12];
  [(DBWidgetView *)v11 addSubview:v12];
  v14 = objc_msgSend(objc_alloc(MEMORY[0x263F82E00]), "initWithFrame:", v6, v7, v8, v9);
  v15 = [MEMORY[0x263F825C8] blackColor];
  [v14 setBackgroundColor:v15];

  [v14 setAlpha:0.0];
  [v14 setTranslatesAutoresizingMaskIntoConstraints:0];
  [(DBWidgetViewController *)v13 setDimmingView:v14];
  [(DBWidgetView *)v11 addSubview:v14];
  v32 = (void *)MEMORY[0x263F08938];
  v42 = [v12 topAnchor];
  v41 = [(DBWidgetView *)v11 topAnchor];
  v40 = [v42 constraintEqualToAnchor:v41];
  v46[0] = v40;
  v39 = [v12 bottomAnchor];
  v38 = [(DBWidgetView *)v11 bottomAnchor];
  v37 = [v39 constraintEqualToAnchor:v38];
  v46[1] = v37;
  v43 = v12;
  v36 = [v12 leftAnchor];
  v35 = [(DBWidgetView *)v11 leftAnchor];
  v34 = [v36 constraintEqualToAnchor:v35];
  v46[2] = v34;
  v33 = [v12 rightAnchor];
  v31 = [(DBWidgetView *)v11 rightAnchor];
  v30 = [v33 constraintEqualToAnchor:v31];
  v46[3] = v30;
  v29 = [v14 topAnchor];
  v28 = [(DBWidgetView *)v11 topAnchor];
  v27 = [v29 constraintEqualToAnchor:v28];
  v46[4] = v27;
  v26 = [v14 bottomAnchor];
  v25 = [(DBWidgetView *)v11 bottomAnchor];
  v16 = [v26 constraintEqualToAnchor:v25];
  v46[5] = v16;
  v17 = [v14 leftAnchor];
  v18 = [(DBWidgetView *)v11 leftAnchor];
  v19 = [v17 constraintEqualToAnchor:v18];
  v46[6] = v19;
  v20 = [v14 rightAnchor];
  v21 = [(DBWidgetView *)v11 rightAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v46[7] = v22;
  v23 = [MEMORY[0x263EFF8C0] arrayWithObjects:v46 count:8];
  [v32 activateConstraints:v23];

  [(DBWidgetViewController *)v44 setView:v11];
  v24 = [MEMORY[0x263F08A00] defaultCenter];
  [v24 addObserver:v44 selector:sel__wallpaperChanged_ name:*MEMORY[0x263F31418] object:0];
}

- (void)setHidden:(BOOL)a3
{
  BOOL v3 = a3;
  self->_hidden = a3;
  v5 = [(DBWidgetViewController *)self view];
  double v6 = [v5 shadowView];
  [v6 setHidden:v3];

  double v7 = [(DBWidgetViewController *)self view];
  [v7 setUserInteractionEnabled:v3 ^ 1];

  [(DBWidgetViewController *)self setNeedsFocusUpdate];
}

- (id)snapshotViewAfterScreenUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  v5 = [(DBWidgetViewController *)self contentView];
  double v6 = [v5 snapshotViewAfterScreenUpdates:v3];

  double v7 = [(DBWidgetViewController *)self environment];
  double v8 = [v7 environmentConfiguration];
  double v9 = [v8 wallpaperPreferences];
  v10 = [v9 currentWallpaper];

  v11 = [v10 traits];
  LODWORD(v8) = [v11 supportsDashboardPlatterMaterials];

  if (v8)
  {
    v12 = objc_alloc_init(_TtC9DashBoard22DBDashboardPlatterView);
    [(DBDashboardPlatterView *)v12 setPlatterCornerRadius:9.0];
    v13 = [(DBWidgetViewController *)self view];
    [v13 bounds];
    -[DBDashboardPlatterView setFrame:](v12, "setFrame:");

    [(DBDashboardPlatterView *)v12 addSubview:v6];
  }
  else
  {
    v12 = v6;
  }

  return v12;
}

- (void)updateAppearanceForWallpaper
{
  id v2 = [(DBWidgetViewController *)self view];
  [v2 updateAppearanceForWallpaper];
}

- (BOOL)entireWidgetFocusable
{
  return 1;
}

- (NSArray)linearFocusItems
{
  v5[1] = *MEMORY[0x263EF8340];
  id v2 = [(DBWidgetViewController *)self view];
  v5[0] = v2;
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return (NSArray *)v3;
}

- (void)pressesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DBWidgetViewController;
  [(DBWidgetViewController *)&v10 pressesBegan:v6 withEvent:a4];
  if ([(DBWidgetViewController *)self entireWidgetFocusable])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___DBPressesContainsPressType_block_invoke_1;
    v11[3] = &__block_descriptor_40_e21_B24__0__UIPress_8_B16l;
    v11[4] = 4;
    double v7 = [v6 objectsPassingTest:v11];
    uint64_t v8 = [v7 count];

    if (v8)
    {
      double v9 = [(DBWidgetViewController *)self dimmingView];
      [v9 setAlpha:0.2];
    }
  }
}

- (void)pressesEnded:(id)a3 withEvent:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)DBWidgetViewController;
  [(DBWidgetViewController *)&v10 pressesEnded:v6 withEvent:a4];
  double v7 = [(DBWidgetViewController *)self dimmingView];
  [v7 setAlpha:0.0];

  if ([(DBWidgetViewController *)self entireWidgetFocusable])
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = ___DBPressesContainsPressType_block_invoke_1;
    v11[3] = &__block_descriptor_40_e21_B24__0__UIPress_8_B16l;
    v11[4] = 4;
    uint64_t v8 = [v6 objectsPassingTest:v11];
    uint64_t v9 = [v8 count];

    if (v9) {
      [(DBWidgetViewController *)self widgetViewTapped];
    }
  }
}

- (void)pressesCancelled:(id)a3 withEvent:(id)a4
{
  v6.receiver = self;
  v6.super_class = (Class)DBWidgetViewController;
  [(DBWidgetViewController *)&v6 pressesCancelled:a3 withEvent:a4];
  v5 = [(DBWidgetViewController *)self dimmingView];
  [v5 setAlpha:0.0];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)DBWidgetViewController;
  id v6 = a3;
  [(DBWidgetViewController *)&v8 touchesEnded:v6 withEvent:a4];
  double v7 = objc_msgSend(v6, "anyObject", v8.receiver, v8.super_class);

  if (![v7 type]) {
    [(DBWidgetViewController *)self widgetViewTapped];
  }
}

- (UIView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (BOOL)isHidden
{
  return self->_hidden;
}

- (BOOL)wantsLargeSize
{
  return self->_wantsLargeSize;
}

- (void)setWantsLargeSize:(BOOL)a3
{
  self->_wantsLargeSize = a3;
}

- (UIView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_storeStrong((id *)&self->_contentView, 0);
}

@end