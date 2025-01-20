@interface DBDashboardRootViewController
- (BOOL)invalidated;
- (BSInvalidatable)homeScreenElementAssertion;
- (CARObserverHashTable)viewStateObservers;
- (CPUIPassthroughView)borderView;
- (CPUIPassthroughView)contentView;
- (DBAppDockViewController)appDockViewController;
- (DBDashboardHomeViewController)homeViewController;
- (DBDashboardLayoutEngine)layoutEngine;
- (DBDashboardRootViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4;
- (DBDashboardWorkspaceEntityPresenting)currentBaseViewController;
- (DBDashboardWorkspaceEntityPresenting)currentStackedViewController;
- (DBEnvironment)environment;
- (DBStatusBarBackgroundView)stackedPrimaryStatusBarBackgroundView;
- (DBStatusBarBackgroundView)stackedSecondaryStatusBarBackgroundView;
- (NSArray)homeViewConstraints;
- (UIView)backgroundView;
- (UIView)baseContainerView;
- (UIView)stackedContainerView;
- (_TtC9DashBoard22DBDashboardDimmingView)dimmingView;
- (double)contentCornerRadius;
- (id)preferredFocusEnvironments;
- (unint64_t)currentViewState;
- (void)_dismissBaseViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_dismissStackedViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)_dismissViewController:(id)a3 andPresentBaseViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6;
- (void)_presentBaseViewController:(id)a3 animated:(BOOL)a4 launchSource:(unint64_t)a5 completion:(id)a6;
- (void)_presentStackedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_updateCurrentViewState;
- (void)_updateHomeConstraints;
- (void)_updateHomeScreenLayoutElementIfNeeded;
- (void)addViewStateObserver:(id)a3;
- (void)dismissBaseViewControllerAnimated:(BOOL)a3 completion:(id)a4;
- (void)handleEvent:(id)a3;
- (void)invalidate;
- (void)loadView;
- (void)presentBaseViewController:(id)a3 animated:(BOOL)a4 launchSource:(unint64_t)a5 completion:(id)a6;
- (void)presentStackedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)removeViewStateObserver:(id)a3;
- (void)setAppDockViewController:(id)a3;
- (void)setBackgroundView:(id)a3;
- (void)setBaseContainerView:(id)a3;
- (void)setBorderView:(id)a3;
- (void)setContentCornerRadius:(double)a3;
- (void)setContentView:(id)a3;
- (void)setCurrentBaseViewController:(id)a3;
- (void)setCurrentStackedViewController:(id)a3;
- (void)setCurrentViewState:(unint64_t)a3;
- (void)setDimmingView:(id)a3;
- (void)setEnvironment:(id)a3;
- (void)setHomeScreenElementAssertion:(id)a3;
- (void)setHomeViewConstraints:(id)a3;
- (void)setInvalidated:(BOOL)a3;
- (void)setLayoutEngine:(id)a3;
- (void)setStackedContainerView:(id)a3;
- (void)setStackedPrimaryStatusBarBackgroundView:(id)a3;
- (void)setStackedSecondaryStatusBarBackgroundView:(id)a3;
- (void)setViewStateObservers:(id)a3;
- (void)statusBarStyleServiceUpdatedOverride:(id)a3 animationSettings:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateAppearanceForWallpaper;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation DBDashboardRootViewController

- (DBDashboardRootViewController)initWithEnvironment:(id)a3 layoutEngine:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)DBDashboardRootViewController;
  v8 = [(DBDashboardRootViewController *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x263F30E18]) initWithProtocol:&unk_26E1CEDF8];
    viewStateObservers = v8->_viewStateObservers;
    v8->_viewStateObservers = (CARObserverHashTable *)v9;

    objc_storeWeak((id *)&v8->_environment, v6);
    objc_storeStrong((id *)&v8->_layoutEngine, a4);
    v11 = [[DBDashboardHomeViewController alloc] initWithEnvironment:v6 layoutEngine:v7];
    homeViewController = v8->_homeViewController;
    v8->_homeViewController = v11;
  }
  return v8;
}

- (void)presentBaseViewController:(id)a3 animated:(BOOL)a4 launchSource:(unint64_t)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v13 = a3;
  id v10 = a6;
  v11 = [(DBDashboardRootViewController *)self currentBaseViewController];

  if (v11)
  {
    v12 = [(DBDashboardRootViewController *)self currentBaseViewController];
    [(DBDashboardRootViewController *)self _dismissViewController:v12 andPresentBaseViewController:v13 animated:v8 completion:v10];
  }
  else
  {
    [(DBDashboardRootViewController *)self _presentBaseViewController:v13 animated:v8 launchSource:a5 completion:v10];
  }
}

- (void)dismissBaseViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBDashboardRootViewController *)self currentBaseViewController];

  if (v7)
  {
    [(DBDashboardRootViewController *)self _dismissBaseViewControllerAnimated:v4 completion:v6];
  }
  else if (v6)
  {
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__DBDashboardRootViewController_dismissBaseViewControllerAnimated_completion___block_invoke;
    block[3] = &unk_2649B4EC8;
    id v9 = v6;
    dispatch_async(MEMORY[0x263EF83A0], block);
  }
}

uint64_t __78__DBDashboardRootViewController_dismissBaseViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)presentStackedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = [(DBDashboardRootViewController *)self currentStackedViewController];

  if (v10)
  {
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __82__DBDashboardRootViewController_presentStackedViewController_animated_completion___block_invoke;
    v11[3] = &unk_2649B5C88;
    v11[4] = self;
    id v12 = v8;
    BOOL v14 = v6;
    id v13 = v9;
    [(DBDashboardRootViewController *)self _dismissStackedViewControllerAnimated:v6 completion:v11];
  }
  else
  {
    [(DBDashboardRootViewController *)self _presentStackedViewController:v8 animated:v6 completion:v9];
  }
}

uint64_t __82__DBDashboardRootViewController_presentStackedViewController_animated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _presentStackedViewController:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 56) completion:*(void *)(a1 + 48)];
}

- (void)addViewStateObserver:(id)a3
{
  id v5 = a3;
  BOOL v4 = [(DBDashboardRootViewController *)self viewStateObservers];
  [v4 addObserver:v5];

  objc_msgSend(v5, "dashboardRootViewController:didChangeToViewState:", self, -[DBDashboardRootViewController currentViewState](self, "currentViewState"));
}

- (void)removeViewStateObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(DBDashboardRootViewController *)self viewStateObservers];
  [v5 removeObserver:v4];
}

- (void)setContentCornerRadius:(double)a3
{
  self->_contentCornerRadius = a3;
  id v5 = [(DBDashboardRootViewController *)self contentView];
  BOOL v6 = [v5 layer];
  [v6 setCornerRadius:a3];

  id v7 = [(DBDashboardRootViewController *)self baseContainerView];
  id v8 = [v7 layer];
  [v8 setCornerRadius:a3];

  id v9 = [(DBDashboardRootViewController *)self dimmingView];
  [v9 setCornerRadius:a3];

  id v11 = [(DBDashboardRootViewController *)self borderView];
  id v10 = [v11 layer];
  [v10 setCornerRadius:a3];
}

- (void)updateAppearanceForWallpaper
{
  v3 = [(DBDashboardRootViewController *)self environment];
  id v4 = [v3 environmentConfiguration];
  id v5 = [v4 wallpaperPreferences];
  BOOL v6 = [v5 currentWallpaper];
  id v7 = [v6 traits];
  int v8 = [v7 supportsDynamicAppearance];

  id v9 = [(DBDashboardRootViewController *)self dimmingView];
  [v9 setHidden:v8 ^ 1u];

  [(DBDashboardRootViewController *)self contentCornerRadius];
  if (v10 <= 0.0 || (v8 & 1) != 0)
  {
    id v19 = [MEMORY[0x263F825C8] clearColor];
    uint64_t v20 = [v19 CGColor];
    v21 = [(DBDashboardRootViewController *)self borderView];
    v22 = [v21 layer];
    [v22 setBorderColor:v20];

    v23 = [(DBDashboardRootViewController *)self borderView];
    v24 = [v23 layer];
    [v24 setBorderWidth:0.0];

    id v25 = [(DBDashboardRootViewController *)self borderView];
    v17 = [v25 layer];
    [v17 setCompositingFilter:0];
  }
  else
  {
    id v11 = [MEMORY[0x263F825C8] colorWithWhite:0.149019608 alpha:1.0];
    uint64_t v12 = [v11 CGColor];
    id v13 = [(DBDashboardRootViewController *)self borderView];
    BOOL v14 = [v13 layer];
    [v14 setBorderColor:v12];

    v15 = [(DBDashboardRootViewController *)self borderView];
    v16 = [v15 layer];
    [v16 setBorderWidth:1.0];

    id v25 = [MEMORY[0x263F157C8] filterWithType:*MEMORY[0x263F15CB8]];
    v17 = [(DBDashboardRootViewController *)self borderView];
    v18 = [v17 layer];
    [v18 setCompositingFilter:v25];
  }
}

- (void)loadView
{
  id v3 = objc_alloc(MEMORY[0x263F82E00]);
  id v4 = [MEMORY[0x263F82B60] mainScreen];
  [v4 bounds];
  id v8 = (id)objc_msgSend(v3, "initWithFrame:");

  id v5 = [v8 layer];
  BOOL v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  [v5 setName:v7];

  [v8 setAutoresizingMask:18];
  [v8 setAutoresizesSubviews:1];
  [(DBDashboardRootViewController *)self setView:v8];
}

- (void)viewWillLayoutSubviews
{
  v29.receiver = self;
  v29.super_class = (Class)DBDashboardRootViewController;
  [(DBDashboardRootViewController *)&v29 viewWillLayoutSubviews];
  [(DBDashboardRootViewController *)self additionalSafeAreaInsets];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  -[DBDashboardRootViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", *MEMORY[0x263F834E8], *(double *)(MEMORY[0x263F834E8] + 8), *(double *)(MEMORY[0x263F834E8] + 16), *(double *)(MEMORY[0x263F834E8] + 24));
  -[DBDashboardRootViewController setAdditionalSafeAreaInsets:](self, "setAdditionalSafeAreaInsets:", v4, v6, v8, v10);
  [(DBDashboardRootViewController *)self _updateHomeConstraints];
  [(DBDashboardLayoutEngine *)self->_layoutEngine primaryStatusBarWindowFrame];
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  id v19 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  objc_msgSend(v19, "setFrame:", v12, v14, v16, v18);

  [(DBDashboardLayoutEngine *)self->_layoutEngine secondaryStatusBarWindowFrame];
  double v21 = v20;
  double v23 = v22;
  double v25 = v24;
  double v27 = v26;
  v28 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  objc_msgSend(v28, "setFrame:", v21, v23, v25, v27);
}

- (void)viewDidLayoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)DBDashboardRootViewController;
  [(DBDashboardRootViewController *)&v13 viewDidLayoutSubviews];
  double v3 = [(DBDashboardRootViewController *)self contentView];
  [v3 frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v12 = [(DBDashboardRootViewController *)self dimmingView];
  objc_msgSend(v12, "setContentFrame:", v5, v7, v9, v11);
}

- (void)traitCollectionDidChange:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)DBDashboardRootViewController;
  [(DBDashboardRootViewController *)&v4 traitCollectionDidChange:a3];
  [(DBDashboardRootViewController *)self updateAppearanceForWallpaper];
}

- (void)_updateHomeConstraints
{
  v39[4] = *MEMORY[0x263EF8340];
  double v3 = [(DBDashboardRootViewController *)self homeViewConstraints];

  if (v3)
  {
    objc_super v4 = (void *)MEMORY[0x263F08938];
    double v5 = [(DBDashboardRootViewController *)self homeViewConstraints];
    [v4 deactivateConstraints:v5];
  }
  double v6 = [(DBDashboardRootViewController *)self homeViewController];
  double v7 = [v6 view];

  double v8 = [(DBDashboardRootViewController *)self layoutEngine];
  [v8 homeViewControllerInsets];
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  double v16 = v15;

  v37 = [v7 leftAnchor];
  v38 = [(DBDashboardRootViewController *)self view];
  v36 = [v38 safeAreaLayoutGuide];
  v35 = [v36 leftAnchor];
  v34 = [v37 constraintEqualToAnchor:v35 constant:v12];
  v39[0] = v34;
  v31 = [v7 rightAnchor];
  v33 = [(DBDashboardRootViewController *)self view];
  v30 = [v33 safeAreaLayoutGuide];
  objc_super v29 = [v30 rightAnchor];
  v28 = [v31 constraintEqualToAnchor:v29 constant:-v16];
  v39[1] = v28;
  v32 = v7;
  double v26 = [v7 topAnchor];
  double v27 = [(DBDashboardRootViewController *)self view];
  double v17 = [v27 safeAreaLayoutGuide];
  double v18 = [v17 topAnchor];
  id v19 = [v26 constraintEqualToAnchor:v18 constant:v10];
  v39[2] = v19;
  double v20 = [v7 bottomAnchor];
  double v21 = [(DBDashboardRootViewController *)self view];
  double v22 = [v21 safeAreaLayoutGuide];
  double v23 = [v22 bottomAnchor];
  double v24 = [v20 constraintEqualToAnchor:v23 constant:-v14];
  v39[3] = v24;
  double v25 = [MEMORY[0x263EFF8C0] arrayWithObjects:v39 count:4];

  [MEMORY[0x263F08938] activateConstraints:v25];
  [(DBDashboardRootViewController *)self setHomeViewConstraints:v25];
}

- (void)viewDidLoad
{
  v201[24] = *MEMORY[0x263EF8340];
  v200.receiver = self;
  v200.super_class = (Class)DBDashboardRootViewController;
  [(DBDashboardRootViewController *)&v200 viewDidLoad];
  double v3 = objc_opt_new();
  [(DBDashboardRootViewController *)self setBackgroundView:v3];

  objc_super v4 = [(DBDashboardRootViewController *)self backgroundView];
  [v4 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v5 = [(DBDashboardRootViewController *)self backgroundView];
  [v5 setUserInteractionEnabled:0];

  double v6 = [(DBDashboardRootViewController *)self view];
  double v7 = [(DBDashboardRootViewController *)self backgroundView];
  [v6 addSubview:v7];

  double v8 = [_TtC9DashBoard22DBDashboardDimmingView alloc];
  double v9 = -[DBDashboardDimmingView initWithFrame:](v8, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
  [(DBDashboardRootViewController *)self setDimmingView:v9];

  double v10 = [(DBDashboardRootViewController *)self dimmingView];
  [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v11 = [(DBDashboardRootViewController *)self dimmingView];
  [v11 setUserInteractionEnabled:0];

  double v12 = [(DBDashboardRootViewController *)self view];
  double v13 = [(DBDashboardRootViewController *)self dimmingView];
  [v12 addSubview:v13];

  double v14 = objc_opt_new();
  [(DBDashboardRootViewController *)self setContentView:v14];

  uint64_t v15 = *MEMORY[0x263F15A20];
  double v16 = [(DBDashboardRootViewController *)self contentView];
  double v17 = [v16 layer];
  [v17 setCornerCurve:v15];

  double v18 = [(DBDashboardRootViewController *)self contentView];
  id v19 = [v18 layer];
  [v19 setMasksToBounds:1];

  double v20 = [(DBDashboardRootViewController *)self contentView];
  [v20 setTranslatesAutoresizingMaskIntoConstraints:0];

  double v21 = [(DBDashboardRootViewController *)self view];
  double v22 = [(DBDashboardRootViewController *)self contentView];
  [v21 addSubview:v22];

  double v23 = [(DBDashboardRootViewController *)self homeViewController];
  double v24 = [(DBDashboardRootViewController *)self contentView];
  v199[0] = MEMORY[0x263EF8330];
  v199[1] = 3221225472;
  v199[2] = __44__DBDashboardRootViewController_viewDidLoad__block_invoke;
  v199[3] = &unk_2649B5CB0;
  v199[4] = self;
  [(DBDashboardRootViewController *)self bs_addChildViewController:v23 withSuperview:v24 animated:0 transitionBlock:v199];

  double v25 = objc_opt_new();
  [(DBDashboardRootViewController *)self setBaseContainerView:v25];

  double v26 = [(DBDashboardRootViewController *)self baseContainerView];
  [v26 setHidden:1];

  double v27 = [(DBDashboardRootViewController *)self baseContainerView];
  [v27 setTranslatesAutoresizingMaskIntoConstraints:0];

  v28 = [(DBDashboardRootViewController *)self contentView];
  objc_super v29 = [(DBDashboardRootViewController *)self baseContainerView];
  [v28 addSubview:v29];

  v30 = [DBStatusBarBackgroundView alloc];
  v31 = [(DBDashboardRootViewController *)self environment];
  v32 = [(DBStatusBarBackgroundView *)v30 initWithEnvironment:v31];
  [(DBDashboardRootViewController *)self setStackedPrimaryStatusBarBackgroundView:v32];

  v33 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  [v33 setHidden:1];

  [(DBDashboardLayoutEngine *)self->_layoutEngine primaryStatusBarWindowFrame];
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;
  double v41 = v40;
  v42 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  objc_msgSend(v42, "setFrame:", v35, v37, v39, v41);

  v43 = [(DBDashboardRootViewController *)self contentView];
  v44 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  [v43 addSubview:v44];

  v45 = [DBStatusBarBackgroundView alloc];
  v46 = [(DBDashboardRootViewController *)self environment];
  v47 = [(DBStatusBarBackgroundView *)v45 initWithEnvironment:v46];
  [(DBDashboardRootViewController *)self setStackedSecondaryStatusBarBackgroundView:v47];

  v48 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  [v48 setHidden:1];

  [(DBDashboardLayoutEngine *)self->_layoutEngine secondaryStatusBarWindowFrame];
  double v50 = v49;
  double v52 = v51;
  double v54 = v53;
  double v56 = v55;
  v57 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  objc_msgSend(v57, "setFrame:", v50, v52, v54, v56);

  v58 = [(DBDashboardRootViewController *)self contentView];
  v59 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  [v58 addSubview:v59];

  v60 = objc_opt_new();
  [(DBDashboardRootViewController *)self setStackedContainerView:v60];

  v61 = [(DBDashboardRootViewController *)self stackedContainerView];
  [v61 setHidden:1];

  v62 = [(DBDashboardRootViewController *)self stackedContainerView];
  [v62 setTranslatesAutoresizingMaskIntoConstraints:0];

  v63 = [(DBDashboardRootViewController *)self contentView];
  v64 = [(DBDashboardRootViewController *)self stackedContainerView];
  [v63 addSubview:v64];

  v65 = objc_opt_new();
  [(DBDashboardRootViewController *)self setBorderView:v65];

  v66 = [(DBDashboardRootViewController *)self borderView];
  v67 = [v66 layer];
  [v67 setCornerCurve:v15];

  v68 = [(DBDashboardRootViewController *)self borderView];
  v69 = [v68 layer];
  [v69 setMasksToBounds:1];

  v70 = [(DBDashboardRootViewController *)self borderView];
  [v70 setTranslatesAutoresizingMaskIntoConstraints:0];

  v71 = [(DBDashboardRootViewController *)self view];
  v72 = [(DBDashboardRootViewController *)self borderView];
  [v71 addSubview:v72];

  v145 = (void *)MEMORY[0x263F08938];
  v198 = [(DBDashboardRootViewController *)self dimmingView];
  v196 = [v198 leadingAnchor];
  v197 = [(DBDashboardRootViewController *)self view];
  v195 = [v197 leadingAnchor];
  v194 = [v196 constraintEqualToAnchor:v195];
  v201[0] = v194;
  v193 = [(DBDashboardRootViewController *)self dimmingView];
  v191 = [v193 trailingAnchor];
  v192 = [(DBDashboardRootViewController *)self view];
  v190 = [v192 trailingAnchor];
  v189 = [v191 constraintEqualToAnchor:v190];
  v201[1] = v189;
  v188 = [(DBDashboardRootViewController *)self dimmingView];
  v186 = [v188 topAnchor];
  v187 = [(DBDashboardRootViewController *)self view];
  v185 = [v187 topAnchor];
  v184 = [v186 constraintEqualToAnchor:v185];
  v201[2] = v184;
  v183 = [(DBDashboardRootViewController *)self dimmingView];
  v181 = [v183 bottomAnchor];
  v182 = [(DBDashboardRootViewController *)self view];
  v180 = [v182 bottomAnchor];
  v179 = [v181 constraintEqualToAnchor:v180];
  v201[3] = v179;
  v178 = [(DBDashboardRootViewController *)self backgroundView];
  v176 = [v178 leadingAnchor];
  v177 = [(DBDashboardRootViewController *)self view];
  v175 = [v177 leadingAnchor];
  v174 = [v176 constraintEqualToAnchor:v175];
  v201[4] = v174;
  v173 = [(DBDashboardRootViewController *)self backgroundView];
  v171 = [v173 trailingAnchor];
  v172 = [(DBDashboardRootViewController *)self view];
  v170 = [v172 trailingAnchor];
  v169 = [v171 constraintEqualToAnchor:v170];
  v201[5] = v169;
  v168 = [(DBDashboardRootViewController *)self backgroundView];
  v166 = [v168 topAnchor];
  v167 = [(DBDashboardRootViewController *)self view];
  v165 = [v167 topAnchor];
  v164 = [v166 constraintEqualToAnchor:v165];
  v201[6] = v164;
  v163 = [(DBDashboardRootViewController *)self backgroundView];
  v161 = [v163 bottomAnchor];
  v162 = [(DBDashboardRootViewController *)self view];
  v160 = [v162 bottomAnchor];
  v159 = [v161 constraintEqualToAnchor:v160];
  v201[7] = v159;
  v158 = [(DBDashboardRootViewController *)self contentView];
  v156 = [v158 leadingAnchor];
  v157 = [(DBDashboardRootViewController *)self view];
  v155 = [v157 safeAreaLayoutGuide];
  v154 = [v155 leadingAnchor];
  v153 = [v156 constraintEqualToAnchor:v154];
  v201[8] = v153;
  v152 = [(DBDashboardRootViewController *)self contentView];
  v150 = [v152 trailingAnchor];
  v151 = [(DBDashboardRootViewController *)self view];
  v149 = [v151 safeAreaLayoutGuide];
  v148 = [v149 trailingAnchor];
  v147 = [v150 constraintEqualToAnchor:v148];
  v201[9] = v147;
  v146 = [(DBDashboardRootViewController *)self contentView];
  v143 = [v146 topAnchor];
  v144 = [(DBDashboardRootViewController *)self view];
  v142 = [v144 safeAreaLayoutGuide];
  v141 = [v142 topAnchor];
  v140 = [v143 constraintEqualToAnchor:v141];
  v201[10] = v140;
  v139 = [(DBDashboardRootViewController *)self contentView];
  v137 = [v139 bottomAnchor];
  v138 = [(DBDashboardRootViewController *)self view];
  v136 = [v138 safeAreaLayoutGuide];
  v135 = [v136 bottomAnchor];
  v134 = [v137 constraintEqualToAnchor:v135];
  v201[11] = v134;
  v133 = [(DBDashboardRootViewController *)self baseContainerView];
  v131 = [v133 leadingAnchor];
  v132 = [(DBDashboardRootViewController *)self contentView];
  v130 = [v132 leadingAnchor];
  v129 = [v131 constraintEqualToAnchor:v130];
  v201[12] = v129;
  v128 = [(DBDashboardRootViewController *)self baseContainerView];
  v126 = [v128 trailingAnchor];
  v127 = [(DBDashboardRootViewController *)self contentView];
  v125 = [v127 trailingAnchor];
  v124 = [v126 constraintEqualToAnchor:v125];
  v201[13] = v124;
  v123 = [(DBDashboardRootViewController *)self baseContainerView];
  v121 = [v123 topAnchor];
  v122 = [(DBDashboardRootViewController *)self contentView];
  v120 = [v122 topAnchor];
  v119 = [v121 constraintEqualToAnchor:v120];
  v201[14] = v119;
  v118 = [(DBDashboardRootViewController *)self baseContainerView];
  v116 = [v118 bottomAnchor];
  v117 = [(DBDashboardRootViewController *)self contentView];
  v115 = [v117 bottomAnchor];
  v114 = [v116 constraintEqualToAnchor:v115];
  v201[15] = v114;
  v113 = [(DBDashboardRootViewController *)self stackedContainerView];
  v111 = [v113 leadingAnchor];
  v112 = [(DBDashboardRootViewController *)self contentView];
  v110 = [v112 leadingAnchor];
  v109 = [v111 constraintEqualToAnchor:v110];
  v201[16] = v109;
  v108 = [(DBDashboardRootViewController *)self stackedContainerView];
  v106 = [v108 trailingAnchor];
  v107 = [(DBDashboardRootViewController *)self contentView];
  v105 = [v107 trailingAnchor];
  v104 = [v106 constraintEqualToAnchor:v105];
  v201[17] = v104;
  v103 = [(DBDashboardRootViewController *)self stackedContainerView];
  v101 = [v103 topAnchor];
  v102 = [(DBDashboardRootViewController *)self contentView];
  v100 = [v102 topAnchor];
  v99 = [v101 constraintEqualToAnchor:v100];
  v201[18] = v99;
  v98 = [(DBDashboardRootViewController *)self stackedContainerView];
  v96 = [v98 bottomAnchor];
  v97 = [(DBDashboardRootViewController *)self contentView];
  v95 = [v97 bottomAnchor];
  v94 = [v96 constraintEqualToAnchor:v95];
  v201[19] = v94;
  v93 = [(DBDashboardRootViewController *)self borderView];
  v91 = [v93 leadingAnchor];
  v92 = [(DBDashboardRootViewController *)self contentView];
  v90 = [v92 leadingAnchor];
  v89 = [v91 constraintEqualToAnchor:v90];
  v201[20] = v89;
  v88 = [(DBDashboardRootViewController *)self borderView];
  v86 = [v88 trailingAnchor];
  v87 = [(DBDashboardRootViewController *)self contentView];
  v85 = [v87 trailingAnchor];
  v84 = [v86 constraintEqualToAnchor:v85];
  v201[21] = v84;
  v83 = [(DBDashboardRootViewController *)self borderView];
  v82 = [v83 topAnchor];
  v73 = [(DBDashboardRootViewController *)self contentView];
  v74 = [v73 topAnchor];
  v75 = [v82 constraintEqualToAnchor:v74];
  v201[22] = v75;
  v76 = [(DBDashboardRootViewController *)self borderView];
  v77 = [v76 bottomAnchor];
  v78 = [(DBDashboardRootViewController *)self contentView];
  v79 = [v78 bottomAnchor];
  v80 = [v77 constraintEqualToAnchor:v79];
  v201[23] = v80;
  v81 = [MEMORY[0x263EFF8C0] arrayWithObjects:v201 count:24];
  [v145 activateConstraints:v81];

  [(DBDashboardRootViewController *)self _updateHomeScreenLayoutElementIfNeeded];
}

void __44__DBDashboardRootViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  double v6 = a2;
  objc_super v4 = [v3 homeViewController];
  double v5 = [v4 view];
  [v5 setTranslatesAutoresizingMaskIntoConstraints:0];

  [*(id *)(a1 + 32) _updateHomeConstraints];
  v6[2]();
}

- (void)handleEvent:(id)a3
{
  id v8 = a3;
  objc_super v4 = [(DBDashboardRootViewController *)self currentStackedViewController];

  if (v4)
  {
    double v5 = [(DBDashboardRootViewController *)self currentStackedViewController];
  }
  else
  {
    double v6 = [(DBDashboardRootViewController *)self currentBaseViewController];

    if (v6)
    {
      double v5 = [(DBDashboardRootViewController *)self currentBaseViewController];
    }
    else
    {
      if ([v8 type] == 10) {
        goto LABEL_8;
      }
      double v5 = [(DBDashboardRootViewController *)self homeViewController];
    }
  }
  double v7 = v5;
  [v5 handleEvent:v8];

LABEL_8:
}

- (void)statusBarStyleServiceUpdatedOverride:(id)a3 animationSettings:(id)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 isSiriPresentation] ^ 1;
  double v7 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  [v7 setHidden:v6];

  uint64_t v8 = [v5 isSiriPresentation] ^ 1;
  double v9 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  [v9 setHidden:v8];

  uint64_t v10 = [v5 interfaceStyle];
  double v11 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  [v11 setOverrideUserInterfaceStyle:v10];

  uint64_t v12 = [v5 interfaceStyle];
  double v13 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  [v13 setOverrideUserInterfaceStyle:v12];

  double v14 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  objc_msgSend(v14, "setColorVariantOverride:", objc_msgSend(v5, "colorVariant"));

  id v16 = [(DBDashboardRootViewController *)self stackedSecondaryStatusBarBackgroundView];
  uint64_t v15 = [v5 colorVariant];

  [v16 setColorVariantOverride:v15];
}

- (void)_updateCurrentViewState
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  double v3 = [(DBDashboardRootViewController *)self currentStackedViewController];
  objc_super v4 = [v3 entity];
  char v5 = [v4 isOEMPunchthroughEntity];

  if (v5)
  {
    uint64_t v6 = 2;
  }
  else
  {
    uint64_t v7 = [(DBDashboardRootViewController *)self currentStackedViewController];
    if (!v7) {
      goto LABEL_5;
    }
    uint64_t v8 = (void *)v7;
    double v9 = [(DBDashboardRootViewController *)self currentStackedViewController];
    uint64_t v10 = [v9 entity];
    int v11 = [v10 isSiriEntity];

    if (!v11)
    {
      uint64_t v6 = 1;
    }
    else
    {
LABEL_5:
      uint64_t v12 = [(DBDashboardRootViewController *)self currentBaseViewController];
      uint64_t v6 = v12 != 0;
    }
  }
  [(DBDashboardRootViewController *)self setCurrentViewState:v6];
  double v13 = DBLogForCategory(6uLL);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    double v14 = off_2649B5E38[v6];
    int v16 = 138412290;
    double v17 = v14;
    _os_log_impl(&dword_22D6F0000, v13, OS_LOG_TYPE_DEFAULT, "Updating to view state: %@", (uint8_t *)&v16, 0xCu);
  }

  uint64_t v15 = [(DBDashboardRootViewController *)self viewStateObservers];
  [v15 dashboardRootViewController:self didChangeToViewState:v6];
}

- (void)_updateHomeScreenLayoutElementIfNeeded
{
  double v3 = [(DBDashboardRootViewController *)self currentBaseViewController];
  if (v3)
  {
    BOOL v4 = 0;
  }
  else
  {
    char v5 = [(DBDashboardRootViewController *)self currentStackedViewController];
    BOOL v4 = v5 == 0;
  }
  if ([(DBDashboardRootViewController *)self invalidated]
    || !v4
    || ([(DBDashboardRootViewController *)self homeScreenElementAssertion],
        uint64_t v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v6))
  {
    if (!v4)
    {
      uint64_t v7 = [(DBDashboardRootViewController *)self homeScreenElementAssertion];

      if (v7)
      {
        uint64_t v8 = DBLogForCategory(6uLL);
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)double v22 = 0;
          _os_log_impl(&dword_22D6F0000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating home screen layout element", v22, 2u);
        }

        double v9 = [(DBDashboardRootViewController *)self homeScreenElementAssertion];
        [v9 invalidate];

        [(DBDashboardRootViewController *)self setHomeScreenElementAssertion:0];
      }
    }
  }
  else
  {
    uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263F3F718]) initWithIdentifier:@"com.apple.CarPlayApp.home-screen"];
    [v10 setLevel:0];
    [v10 setFillsDisplayBounds:1];
    int v11 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_22D6F0000, v11, OS_LOG_TYPE_DEFAULT, "Activating home screen layout element", buf, 2u);
    }

    uint64_t v12 = [(DBDashboardRootViewController *)self environment];
    double v13 = [v12 environmentConfiguration];
    double v14 = [v13 displayLayoutPublisher];
    uint64_t v15 = [v14 addElement:v10];
    [(DBDashboardRootViewController *)self setHomeScreenElementAssertion:v15];
  }
  int v16 = [(DBDashboardRootViewController *)self currentBaseViewController];
  BOOL v17 = v16 == 0;

  uint64_t v18 = [(DBDashboardRootViewController *)self homeViewController];
  [v18 setTodayViewForeground:v17];

  id v19 = [(DBDashboardRootViewController *)self homeViewController];
  double v20 = [(DBDashboardRootViewController *)self currentStackedViewController];
  [v19 setTodayViewActive:v20 == 0];

  double v21 = [(DBDashboardRootViewController *)self homeViewController];
  [v21 setAccessibilityElementsActive:v4];
}

- (void)_presentBaseViewController:(id)a3 animated:(BOOL)a4 launchSource:(unint64_t)a5 completion:(id)a6
{
  BOOL v7 = a4;
  id v9 = a3;
  id v10 = a6;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke;
  aBlock[3] = &unk_2649B55B0;
  aBlock[4] = self;
  id v11 = v10;
  id v91 = v11;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  [(DBDashboardRootViewController *)self setCurrentBaseViewController:v9];
  double v13 = [(DBDashboardRootViewController *)self baseContainerView];
  [v13 setHidden:0];

  [(DBDashboardRootViewController *)self _updateCurrentViewState];
  double v14 = [v9 view];
  uint64_t v15 = [(DBDashboardRootViewController *)self environment];
  int v16 = [v15 environmentConfiguration];

  int v17 = [v9 presentsUnderStatusBar];
  int v18 = [v9 presentsFullScreen];
  double v19 = 0.0;
  if ((v18 & 1) == 0 && (v17 & 1) == 0 && [v16 isStatusBarDriveSide])
  {
    if ([v16 isRightHandDrive]) {
      double v19 = 0.0;
    }
    else {
      double v19 = 45.0;
    }
  }
  v75 = v16;
  if (v18) {
    [(DBDashboardRootViewController *)self view];
  }
  else {
  double v20 = [(DBDashboardRootViewController *)self baseContainerView];
  }
  v87[0] = MEMORY[0x263EF8330];
  v87[1] = 3221225472;
  v87[2] = __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke_2;
  v87[3] = &unk_2649B5CD8;
  id v21 = v14;
  id v88 = v21;
  id v22 = v20;
  id v89 = v22;
  [(DBDashboardRootViewController *)self bs_addChildViewController:v9 withSuperview:v22 animated:0 transitionBlock:v87];
  if (v7)
  {
    v71 = v12;
    id v23 = [v9 presentationViewWithIdentifier:@"kCARHomeToAppAnimationIdentifier"];
    if (!v23)
    {
      double v24 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[DBDashboardRootViewController _presentBaseViewController:animated:launchSource:completion:](v24, v25, v26, v27, v28, v29, v30, v31);
      }

      id v23 = objc_alloc_init(MEMORY[0x263F82E00]);
    }
    v32 = [(DBDashboardRootViewController *)self homeViewController];
    uint64_t v70 = [v32 view];

    id v33 = objc_alloc_init(MEMORY[0x263F82E00]);
    if (v18)
    {
      double v34 = [(DBDashboardRootViewController *)self view];
      [v34 addSubview:v33];

      double v35 = [(DBDashboardRootViewController *)self view];
    }
    else
    {
      double v39 = [(DBDashboardRootViewController *)self contentView];
      double v40 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
      [v39 insertSubview:v33 belowSubview:v40];

      if (!v17)
      {
        if ([v75 isStatusBarDriveSide])
        {
          double v41 = [(DBDashboardRootViewController *)self contentView];
          [v41 bounds];
          double v46 = v49 - 45.0;
          double v50 = [(DBDashboardRootViewController *)self contentView];
          [v50 bounds];
          double v48 = v51;
          double v44 = 0.0;
        }
        else
        {
          if ([v75 currentStatusBarEdge] == 3) {
            double v44 = 45.0;
          }
          else {
            double v44 = 0.0;
          }
          double v41 = [(DBDashboardRootViewController *)self contentView];
          [v41 bounds];
          double v46 = v52;
          double v50 = [(DBDashboardRootViewController *)self contentView];
          [v50 bounds];
          double v48 = v53 - 45.0;
        }

LABEL_28:
        unint64_t v54 = a5;
        double v55 = (void *)v70;

        objc_msgSend(v33, "setFrame:", v19, v44, v46, v48);
        uint64_t v56 = [v9 identifier];
        id v72 = v11;
        v74 = (void *)v56;
        if (v54 == 3)
        {
          uint64_t v60 = v56;
          v57 = [(DBDashboardRootViewController *)self homeViewController];
          v58 = v57;
          uint64_t v59 = v60;
        }
        else
        {
          if (v54 != 2)
          {
            v61 = 0;
            goto LABEL_34;
          }
          v57 = [(DBDashboardRootViewController *)self homeViewController];
          v58 = v57;
          uint64_t v59 = *MEMORY[0x263F31298];
        }
        v61 = objc_msgSend(v57, "visibleIconViewForIdentifier:", v59, v70);

LABEL_34:
        v80[0] = MEMORY[0x263EF8330];
        v80[1] = 3221225472;
        v80[2] = __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke_187;
        v80[3] = &unk_2649B5D00;
        id v62 = v9;
        id v81 = v62;
        id v82 = v61;
        id v83 = v23;
        id v63 = v33;
        id v84 = v63;
        id v85 = v55;
        v86 = self;
        id v64 = v55;
        id v65 = v23;
        id v66 = v61;
        v67 = +[DBHomeToAppAnimation animationWithSettings:v80];
        v68 = [v62 view];
        [v68 setHidden:1];

        v76[0] = MEMORY[0x263EF8330];
        v76[1] = 3221225472;
        v76[2] = __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke_2_189;
        v76[3] = &unk_2649B5D28;
        id v79 = v71;
        id v77 = v62;
        id v78 = v63;
        id v69 = v63;
        [v67 startAnimationWithCompletion:v76];

        uint64_t v12 = (void (**)(void))v71;
        id v11 = v72;
        double v38 = v75;
        goto LABEL_35;
      }
      double v35 = [(DBDashboardRootViewController *)self contentView];
    }
    double v41 = v35;
    objc_msgSend(v35, "bounds", v70);
    double v19 = v42;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
    goto LABEL_28;
  }
  double v36 = [(DBDashboardRootViewController *)self appDockViewController];
  double v37 = [v9 identifier];
  [v36 setActiveBundleIdentifier:v37 animated:0];

  v12[2](v12);
  double v38 = v75;
LABEL_35:
}

uint64_t __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateHomeScreenLayoutElementIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v19[4] = *MEMORY[0x263EF8340];
  double v3 = *(void **)(a1 + 32);
  int v18 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v14 = (void *)MEMORY[0x263F08938];
  int v17 = [*(id *)(a1 + 32) leftAnchor];
  int v16 = [*(id *)(a1 + 40) leftAnchor];
  uint64_t v15 = [v17 constraintEqualToAnchor:v16];
  v19[0] = v15;
  BOOL v4 = [*(id *)(a1 + 32) rightAnchor];
  char v5 = [*(id *)(a1 + 40) rightAnchor];
  uint64_t v6 = [v4 constraintEqualToAnchor:v5];
  v19[1] = v6;
  BOOL v7 = [*(id *)(a1 + 32) topAnchor];
  uint64_t v8 = [*(id *)(a1 + 40) topAnchor];
  id v9 = [v7 constraintEqualToAnchor:v8];
  v19[2] = v9;
  id v10 = [*(id *)(a1 + 32) bottomAnchor];
  id v11 = [*(id *)(a1 + 40) bottomAnchor];
  uint64_t v12 = [v10 constraintEqualToAnchor:v11];
  v19[3] = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v19 count:4];
  [v14 activateConstraints:v13];

  v18[2]();
}

void __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke_187(uint64_t a1, void *a2)
{
  double v3 = *(void **)(a1 + 32);
  id v4 = a2;
  char v5 = [v3 identifier];
  [v4 setToIdentifier:v5];

  [v4 setIconView:*(void *)(a1 + 40)];
  [v4 setToView:*(void *)(a1 + 48)];
  [v4 setToTransitionContainerView:*(void *)(a1 + 56)];
  [v4 setFromView:*(void *)(a1 + 64)];
  [v4 setFromTransitionContainerView:0];
  uint64_t v6 = [*(id *)(a1 + 72) appDockViewController];
  [v4 setAppDockViewController:v6];

  id v7 = [*(id *)(a1 + 72) backgroundView];
  [v4 setRootContainerView:v7];
}

uint64_t __93__DBDashboardRootViewController__presentBaseViewController_animated_launchSource_completion___block_invoke_2_189(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  v2 = [*(id *)(a1 + 32) view];
  [v2 setHidden:0];

  [*(id *)(a1 + 32) invalidatePresentationViewForIdentifier:@"kCARHomeToAppAnimationIdentifier"];
  double v3 = *(void **)(a1 + 40);
  return [v3 removeFromSuperview];
}

- (void)_dismissViewController:(id)a3 andPresentBaseViewController:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v82 = a6;
  id v11 = v9;
  uint64_t v12 = [(DBDashboardRootViewController *)self environment];
  double v13 = [v12 environmentConfiguration];

  [(DBDashboardRootViewController *)self setCurrentBaseViewController:v10];
  double v14 = [(DBDashboardRootViewController *)self baseContainerView];
  [v14 setHidden:0];

  uint64_t v15 = [v10 view];
  int v16 = [v10 presentsUnderStatusBar];
  double v17 = 0.0;
  if ((v16 & 1) == 0 && [v13 isStatusBarDriveSide])
  {
    if ([v13 isRightHandDrive]) {
      double v17 = 0.0;
    }
    else {
      double v17 = 45.0;
    }
  }
  int v18 = [(DBDashboardRootViewController *)self baseContainerView];
  v97[0] = MEMORY[0x263EF8330];
  v97[1] = 3221225472;
  v97[2] = __105__DBDashboardRootViewController__dismissViewController_andPresentBaseViewController_animated_completion___block_invoke;
  v97[3] = &unk_2649B5CD8;
  id v83 = v15;
  id v98 = v83;
  v99 = self;
  [(DBDashboardRootViewController *)self bs_addChildViewController:v10 withSuperview:v18 animated:0 transitionBlock:v97];

  double v19 = [v10 view];
  [v19 setHidden:1];

  id v20 = [v11 presentationViewWithIdentifier:@"kCARAppToAppAnimationIdentifier"];
  if (!v20)
  {
    id v21 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      -[DBDashboardRootViewController _dismissViewController:andPresentBaseViewController:animated:completion:](v21, v22, v23, v24, v25, v26, v27, v28);
    }

    id v20 = objc_alloc_init(MEMORY[0x263F82E00]);
  }
  id v29 = [v10 presentationViewWithIdentifier:@"kCARAppToAppAnimationIdentifier"];
  if (!v29)
  {
    uint64_t v30 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      -[DBDashboardRootViewController _dismissViewController:andPresentBaseViewController:animated:completion:](v30, v31, v32, v33, v34, v35, v36, v37);
    }

    id v29 = objc_alloc_init(MEMORY[0x263F82E00]);
  }
  id v38 = objc_alloc_init(MEMORY[0x263F82E00]);
  double v39 = [(DBDashboardRootViewController *)self contentView];
  double v40 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  [v39 insertSubview:v38 belowSubview:v40];

  if (v16)
  {
    double v41 = [(DBDashboardRootViewController *)self contentView];
    [v41 bounds];
    double v17 = v42;
    double v44 = v43;
    double v46 = v45;
    double v48 = v47;
  }
  else
  {
    if ([v13 isStatusBarDriveSide])
    {
      double v41 = [(DBDashboardRootViewController *)self contentView];
      [v41 bounds];
      double v46 = v49 - 45.0;
      double v50 = [(DBDashboardRootViewController *)self contentView];
      [v50 bounds];
      double v48 = v51;
      double v44 = 0.0;
    }
    else
    {
      if ([v13 currentStatusBarEdge] == 3) {
        double v44 = 45.0;
      }
      else {
        double v44 = 0.0;
      }
      double v41 = [(DBDashboardRootViewController *)self contentView];
      [v41 bounds];
      double v46 = v52;
      double v50 = [(DBDashboardRootViewController *)self contentView];
      [v50 bounds];
      double v48 = v53 - 45.0;
    }
  }
  objc_msgSend(v38, "setFrame:", v17, v44, v46, v48);
  if ([v11 presentsUnderStatusBar])
  {
    unint64_t v54 = [(DBDashboardRootViewController *)self contentView];
    [v54 bounds];
    double v56 = v55;
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
  }
  else
  {
    double v56 = 0.0;
    if (([v13 isRightHandDrive] & 1) == 0)
    {
      if ([v13 isStatusBarDriveSide]) {
        double v56 = 45.0;
      }
      else {
        double v56 = 0.0;
      }
    }
    if ([v13 isStatusBarDriveSide])
    {
      unint64_t v54 = [(DBDashboardRootViewController *)self contentView];
      [v54 bounds];
      double v60 = v63 - 45.0;
      id v64 = [(DBDashboardRootViewController *)self contentView];
      [v64 bounds];
      double v62 = v65;
      double v58 = 0.0;
    }
    else
    {
      if ([v13 currentStatusBarEdge] == 3) {
        double v58 = 45.0;
      }
      else {
        double v58 = 0.0;
      }
      unint64_t v54 = [(DBDashboardRootViewController *)self contentView];
      [v54 bounds];
      double v60 = v66;
      id v64 = [(DBDashboardRootViewController *)self contentView];
      [v64 bounds];
      double v62 = v67 - 45.0;
    }
  }
  id v68 = objc_alloc_init(MEMORY[0x263F82E00]);
  id v69 = [(DBDashboardRootViewController *)self contentView];
  uint64_t v70 = [(DBDashboardRootViewController *)self stackedPrimaryStatusBarBackgroundView];
  [v69 insertSubview:v68 belowSubview:v70];

  objc_msgSend(v68, "setFrame:", v56, v58, v60, v62);
  v90[0] = MEMORY[0x263EF8330];
  v90[1] = 3221225472;
  v90[2] = __105__DBDashboardRootViewController__dismissViewController_andPresentBaseViewController_animated_completion___block_invoke_191;
  v90[3] = &unk_2649B5D50;
  id v91 = v29;
  id v71 = v38;
  id v92 = v71;
  id v93 = v20;
  id v72 = v68;
  id v94 = v72;
  v95 = self;
  id v73 = v10;
  id v96 = v73;
  id v74 = v20;
  id v75 = v29;
  v76 = +[DBAppToAppAnimation animationWithSettings:v90];
  [(DBDashboardRootViewController *)self _updateCurrentViewState];
  [v11 deactivateSceneWithReasonMask:32];
  v84[0] = MEMORY[0x263EF8330];
  v84[1] = 3221225472;
  v84[2] = __105__DBDashboardRootViewController__dismissViewController_andPresentBaseViewController_animated_completion___block_invoke_2;
  v84[3] = &unk_2649B5D78;
  v84[4] = self;
  id v85 = v11;
  id v86 = v73;
  id v87 = v71;
  id v88 = v72;
  id v89 = v82;
  id v77 = v82;
  id v78 = v72;
  id v79 = v71;
  id v80 = v73;
  id v81 = v11;
  [v76 startAnimationWithCompletion:v84];
}

void __105__DBDashboardRootViewController__dismissViewController_andPresentBaseViewController_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  v23[4] = *MEMORY[0x263EF8340];
  double v3 = *(void **)(a1 + 32);
  uint64_t v22 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  double v14 = (void *)MEMORY[0x263F08938];
  id v20 = [*(id *)(a1 + 32) leftAnchor];
  id v21 = [*(id *)(a1 + 40) baseContainerView];
  double v19 = [v21 leftAnchor];
  int v18 = [v20 constraintEqualToAnchor:v19];
  v23[0] = v18;
  int v16 = [*(id *)(a1 + 32) rightAnchor];
  double v17 = [*(id *)(a1 + 40) baseContainerView];
  uint64_t v15 = [v17 rightAnchor];
  id v4 = [v16 constraintEqualToAnchor:v15];
  v23[1] = v4;
  char v5 = [*(id *)(a1 + 32) topAnchor];
  uint64_t v6 = [*(id *)(a1 + 40) baseContainerView];
  id v7 = [v6 topAnchor];
  uint64_t v8 = [v5 constraintEqualToAnchor:v7];
  v23[2] = v8;
  id v9 = [*(id *)(a1 + 32) bottomAnchor];
  id v10 = [*(id *)(a1 + 40) baseContainerView];
  id v11 = [v10 bottomAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  v23[3] = v12;
  double v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v14 activateConstraints:v13];

  v22[2]();
}

void __105__DBDashboardRootViewController__dismissViewController_andPresentBaseViewController_animated_completion___block_invoke_191(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setToView:v3];
  [v4 setToTransitionContainerView:*(void *)(a1 + 40)];
  [v4 setFromView:*(void *)(a1 + 48)];
  [v4 setFromTransitionContainerView:*(void *)(a1 + 56)];
  char v5 = [*(id *)(a1 + 64) appDockViewController];
  [v4 setAppDockViewController:v5];

  uint64_t v6 = [*(id *)(a1 + 72) identifier];
  [v4 setToIdentifier:v6];

  id v7 = [*(id *)(a1 + 64) backgroundView];
  [v4 setRootContainerView:v7];
}

uint64_t __105__DBDashboardRootViewController__dismissViewController_andPresentBaseViewController_animated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:animated:transitionBlock:", *(void *)(a1 + 40), 0, 0);
  [*(id *)(a1 + 40) invalidatePresentationViewForIdentifier:@"kCARAppToAppAnimationIdentifier"];
  v2 = [*(id *)(a1 + 48) view];
  [v2 setHidden:0];

  [*(id *)(a1 + 48) invalidatePresentationViewForIdentifier:@"kCARAppToAppAnimationIdentifier"];
  [*(id *)(a1 + 56) removeFromSuperview];
  [*(id *)(a1 + 64) removeFromSuperview];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 72);
  return [v3 backgroundSceneWithCompletion:v4];
}

- (void)_dismissBaseViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBDashboardRootViewController *)self currentBaseViewController];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__DBDashboardRootViewController__dismissBaseViewControllerAnimated_completion___block_invoke;
  aBlock[3] = &unk_2649B5170;
  aBlock[4] = self;
  id v8 = v7;
  id v65 = v8;
  id v9 = v6;
  id v66 = v9;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  [(DBDashboardRootViewController *)self setCurrentBaseViewController:0];
  [(DBDashboardRootViewController *)self _updateCurrentViewState];
  if (v4)
  {
    id v11 = [(DBDashboardRootViewController *)self environment];
    uint64_t v12 = [v11 environmentConfiguration];

    id v13 = [v8 presentationViewWithIdentifier:@"kCARAppToHomeAnimationIdentifier"];
    if (!v13)
    {
      double v14 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DBDashboardRootViewController _dismissBaseViewControllerAnimated:completion:](v14, v15, v16, v17, v18, v19, v20, v21);
      }

      id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
    }
    uint64_t v22 = [(DBDashboardRootViewController *)self homeViewController];
    uint64_t v23 = [v22 view];

    id v24 = objc_alloc_init(MEMORY[0x263F82E00]);
    uint64_t v25 = [(DBDashboardRootViewController *)self contentView];
    [v25 addSubview:v24];

    if ([v8 presentsUnderStatusBar])
    {
      uint64_t v26 = [(DBDashboardRootViewController *)self contentView];
      [v26 bounds];
      double v28 = v27;
      double v30 = v29;
      double v32 = v31;
      double v34 = v33;
    }
    else
    {
      double v28 = 0.0;
      if (objc_msgSend(v12, "isStatusBarDriveSide", v12))
      {
        if ([v12 isRightHandDrive]) {
          double v28 = 0.0;
        }
        else {
          double v28 = 45.0;
        }
      }
      if ([v12 isStatusBarDriveSide])
      {
        uint64_t v26 = [(DBDashboardRootViewController *)self contentView];
        [v26 bounds];
        double v32 = v36 - 45.0;
        uint64_t v37 = [(DBDashboardRootViewController *)self contentView];
        [v37 bounds];
        double v34 = v38;
        double v30 = 0.0;
      }
      else
      {
        if ([v12 currentStatusBarEdge] == 3) {
          double v30 = 45.0;
        }
        else {
          double v30 = 0.0;
        }
        uint64_t v26 = [(DBDashboardRootViewController *)self contentView];
        [v26 bounds];
        double v32 = v39;
        uint64_t v37 = [(DBDashboardRootViewController *)self contentView];
        [v37 bounds];
        double v34 = v40 - 45.0;
      }
    }
    objc_msgSend(v24, "setFrame:", v28, v30, v32, v34);
    double v41 = [(DBDashboardRootViewController *)self homeViewController];
    double v42 = [v8 identifier];
    double v43 = [v41 visibleIconViewForIdentifier:v42];

    v57[0] = MEMORY[0x263EF8330];
    v57[1] = 3221225472;
    v57[2] = __79__DBDashboardRootViewController__dismissBaseViewControllerAnimated_completion___block_invoke_194;
    v57[3] = &unk_2649B5DA0;
    id v58 = v43;
    id v44 = v24;
    id v59 = v44;
    id v60 = v23;
    id v61 = v13;
    id v45 = v8;
    id v62 = v45;
    double v63 = self;
    id v46 = v13;
    id v47 = v23;
    id v48 = v43;
    double v49 = +[DBAppToHomeAnimation animationWithSettings:v57];
    double v50 = [v45 view];
    [v50 setHidden:1];

    [v45 deactivateSceneWithReasonMask:32];
    v53[0] = MEMORY[0x263EF8330];
    v53[1] = 3221225472;
    v53[2] = __79__DBDashboardRootViewController__dismissBaseViewControllerAnimated_completion___block_invoke_2;
    v53[3] = &unk_2649B5D28;
    double v56 = v10;
    id v54 = v45;
    id v55 = v44;
    id v51 = v44;
    [v49 startAnimationWithCompletion:v53];
  }
  else
  {
    uint64_t v35 = [(DBDashboardRootViewController *)self appDockViewController];
    [v35 setActiveBundleIdentifier:0 animated:0];

    v10[2](v10);
  }
}

uint64_t __79__DBDashboardRootViewController__dismissBaseViewControllerAnimated_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:animated:transitionBlock:", *(void *)(a1 + 40), 0, 0);
  v2 = [*(id *)(a1 + 32) baseContainerView];
  [v2 setHidden:1];

  [*(id *)(a1 + 32) _updateHomeScreenLayoutElementIfNeeded];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 backgroundSceneWithCompletion:v4];
}

void __79__DBDashboardRootViewController__dismissBaseViewControllerAnimated_completion___block_invoke_194(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setIconView:v3];
  [v4 setFromTransitionContainerView:*(void *)(a1 + 40)];
  [v4 setToView:*(void *)(a1 + 48)];
  [v4 setFromView:*(void *)(a1 + 56)];
  [v4 setToTransitionContainerView:0];
  char v5 = [*(id *)(a1 + 64) identifier];
  [v4 setToIdentifier:v5];

  id v6 = [*(id *)(a1 + 72) appDockViewController];
  [v4 setAppDockViewController:v6];

  id v7 = [*(id *)(a1 + 72) backgroundView];
  [v4 setRootContainerView:v7];
}

uint64_t __79__DBDashboardRootViewController__dismissBaseViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  [*(id *)(a1 + 32) invalidatePresentationViewForIdentifier:@"kCARAppToHomeAnimationIdentifier"];
  v2 = *(void **)(a1 + 40);
  return [v2 removeFromSuperview];
}

- (void)_presentStackedViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke;
  aBlock[3] = &unk_2649B55B0;
  aBlock[4] = self;
  id v10 = v9;
  id v69 = v10;
  id v11 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v12 = [(DBDashboardRootViewController *)self stackedContainerView];
  [v12 setHidden:0];

  id v13 = [v8 view];
  double v14 = [(DBDashboardRootViewController *)self environment];
  uint64_t v15 = [v14 environmentConfiguration];

  int v16 = [v8 presentsUnderStatusBar];
  double v17 = 0.0;
  if (v16)
  {
    double v18 = 0.0;
  }
  else
  {
    double v18 = 0.0;
    if ([v15 isStatusBarDriveSide])
    {
      int v19 = [v15 isRightHandDrive];
      if (v19) {
        double v17 = -45.0;
      }
      else {
        double v17 = 0.0;
      }
      if (v19) {
        double v18 = 0.0;
      }
      else {
        double v18 = 45.0;
      }
    }
  }
  uint64_t v20 = [(DBDashboardRootViewController *)self stackedContainerView];
  v63[0] = MEMORY[0x263EF8330];
  v63[1] = 3221225472;
  v63[2] = __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke_2;
  v63[3] = &unk_2649B5DC8;
  id v21 = v13;
  id v64 = v21;
  id v65 = self;
  double v66 = v18;
  double v67 = v17;
  [(DBDashboardRootViewController *)self bs_addChildViewController:v8 withSuperview:v20 animated:0 transitionBlock:v63];

  [(DBDashboardRootViewController *)self setCurrentStackedViewController:v8];
  [(DBDashboardRootViewController *)self _updateCurrentViewState];
  if (v6)
  {
    id v22 = [v8 presentationViewWithIdentifier:@"kCARToStackedAppAnimationIdentifier"];
    if (!v22)
    {
      uint64_t v23 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[DBDashboardRootViewController _presentStackedViewController:animated:completion:](v23, v24, v25, v26, v27, v28, v29, v30);
      }

      id v22 = objc_alloc_init(MEMORY[0x263F82E00]);
    }
    id v31 = objc_alloc_init(MEMORY[0x263F82E00]);
    double v32 = [(DBDashboardRootViewController *)self contentView];
    [v32 addSubview:v31];

    if (v16)
    {
      double v33 = [(DBDashboardRootViewController *)self contentView];
      [v33 bounds];
      double v18 = v34;
      double v36 = v35;
      double v38 = v37;
      double v40 = v39;
    }
    else
    {
      if ([v15 isStatusBarDriveSide])
      {
        double v33 = [(DBDashboardRootViewController *)self contentView];
        [v33 bounds];
        double v38 = v43 - 45.0;
        id v44 = [(DBDashboardRootViewController *)self contentView];
        [v44 bounds];
        double v40 = v45;
        double v36 = 0.0;
      }
      else
      {
        if ([v15 currentStatusBarEdge] == 3) {
          double v36 = 45.0;
        }
        else {
          double v36 = 0.0;
        }
        double v33 = [(DBDashboardRootViewController *)self contentView];
        [v33 bounds];
        double v38 = v46;
        id v44 = [(DBDashboardRootViewController *)self contentView];
        [v44 bounds];
        double v40 = v47 - 45.0;
      }
    }
    objc_msgSend(v31, "setFrame:", v18, v36, v38, v40);
    v58[0] = MEMORY[0x263EF8330];
    v58[1] = 3221225472;
    v58[2] = __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke_197;
    v58[3] = &unk_2649B5DF0;
    id v48 = v31;
    id v59 = v48;
    id v60 = v22;
    id v49 = v8;
    id v61 = v49;
    id v62 = self;
    id v50 = v22;
    id v51 = +[DBToStackedAppAnimation animationWithSettings:v58];
    double v52 = [v49 view];
    [v52 setHidden:1];

    v54[0] = MEMORY[0x263EF8330];
    v54[1] = 3221225472;
    v54[2] = __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke_2_199;
    v54[3] = &unk_2649B5170;
    id v55 = v49;
    id v56 = v48;
    double v57 = v11;
    id v53 = v48;
    [v51 startAnimationWithCompletion:v54];
  }
  else
  {
    double v41 = [(DBDashboardRootViewController *)self appDockViewController];
    double v42 = [v8 identifier];
    [v41 setActiveBundleIdentifier:v42 animated:0];

    v11[2](v11);
  }
}

uint64_t __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updateHomeScreenLayoutElementIfNeeded];
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

void __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke_2(uint64_t a1, void *a2)
{
  v23[4] = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void **)(a1 + 32);
  id v22 = a2;
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v15 = (void *)MEMORY[0x263F08938];
  uint64_t v20 = [*(id *)(a1 + 32) leftAnchor];
  id v21 = [*(id *)(a1 + 40) stackedContainerView];
  int v19 = [v21 leftAnchor];
  double v18 = [v20 constraintEqualToAnchor:v19 constant:*(double *)(a1 + 48)];
  v23[0] = v18;
  int v16 = [*(id *)(a1 + 32) rightAnchor];
  double v17 = [*(id *)(a1 + 40) stackedContainerView];
  double v14 = [v17 rightAnchor];
  id v4 = [v16 constraintEqualToAnchor:v14 constant:*(double *)(a1 + 56)];
  v23[1] = v4;
  char v5 = [*(id *)(a1 + 32) topAnchor];
  BOOL v6 = [*(id *)(a1 + 40) stackedContainerView];
  id v7 = [v6 topAnchor];
  id v8 = [v5 constraintEqualToAnchor:v7];
  v23[2] = v8;
  id v9 = [*(id *)(a1 + 32) bottomAnchor];
  id v10 = [*(id *)(a1 + 40) stackedContainerView];
  id v11 = [v10 bottomAnchor];
  uint64_t v12 = [v9 constraintEqualToAnchor:v11];
  v23[3] = v12;
  id v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v23 count:4];
  [v15 activateConstraints:v13];

  v22[2]();
}

void __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke_197(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setToTransitionContainerView:v3];
  [v4 setToView:*(void *)(a1 + 40)];
  char v5 = [*(id *)(a1 + 48) identifier];
  [v4 setToIdentifier:v5];

  BOOL v6 = [*(id *)(a1 + 56) appDockViewController];
  [v4 setAppDockViewController:v6];

  id v7 = [*(id *)(a1 + 56) backgroundView];
  [v4 setRootContainerView:v7];
}

uint64_t __83__DBDashboardRootViewController__presentStackedViewController_animated_completion___block_invoke_2_199(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidatePresentationViewForIdentifier:@"kCARToStackedAppAnimationIdentifier"];
  [*(id *)(a1 + 40) removeFromSuperview];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setHidden:0];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v3();
}

- (void)_dismissStackedViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v7 = [(DBDashboardRootViewController *)self currentBaseViewController];

  if (v7)
  {
    id v8 = [(DBDashboardRootViewController *)self currentBaseViewController];
    [v8 activateSceneWithSettings:0 completion:&__block_literal_global_22];
  }
  id v9 = [(DBDashboardRootViewController *)self currentStackedViewController];
  [(DBDashboardRootViewController *)self setCurrentStackedViewController:0];
  [(DBDashboardRootViewController *)self _updateCurrentViewState];
  aBlock[0] = MEMORY[0x263EF8330];
  aBlock[1] = 3221225472;
  aBlock[2] = __82__DBDashboardRootViewController__dismissStackedViewControllerAnimated_completion___block_invoke_2;
  aBlock[3] = &unk_2649B5170;
  aBlock[4] = self;
  id v10 = v9;
  id v39 = v10;
  id v11 = v6;
  id v40 = v11;
  uint64_t v12 = (void (**)(void))_Block_copy(aBlock);
  if (v4)
  {
    id v13 = [v10 presentationViewWithIdentifier:@"kCARFromStackedAppAnimationIdentifier"];
    if (!v13)
    {
      double v14 = DBLogForCategory(6uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[DBDashboardRootViewController _dismissStackedViewControllerAnimated:completion:](v14, v15, v16, v17, v18, v19, v20, v21);
      }

      id v13 = objc_alloc_init(MEMORY[0x263F82E00]);
    }
    id v22 = objc_alloc_init(MEMORY[0x263F82E00]);
    uint64_t v23 = [(DBDashboardRootViewController *)self contentView];
    [v23 addSubview:v22];

    v34[0] = MEMORY[0x263EF8330];
    v34[1] = 3221225472;
    v34[2] = __82__DBDashboardRootViewController__dismissStackedViewControllerAnimated_completion___block_invoke_201;
    v34[3] = &unk_2649B5E18;
    id v35 = v13;
    id v36 = v22;
    double v37 = self;
    id v24 = v22;
    id v25 = v13;
    uint64_t v26 = +[DBFromStackedAppAnimation animationWithSettings:v34];
    uint64_t v27 = [v10 view];
    [v27 setHidden:1];

    v31[0] = MEMORY[0x263EF8330];
    v31[1] = 3221225472;
    v31[2] = __82__DBDashboardRootViewController__dismissStackedViewControllerAnimated_completion___block_invoke_2_203;
    v31[3] = &unk_2649B55B0;
    id v32 = v10;
    double v33 = v12;
    [v26 startAnimationWithCompletion:v31];
  }
  else
  {
    uint64_t v28 = [(DBDashboardRootViewController *)self appDockViewController];
    uint64_t v29 = [(DBDashboardRootViewController *)self currentBaseViewController];
    uint64_t v30 = [v29 identifier];
    [v28 setActiveBundleIdentifier:v30 animated:0];

    v12[2](v12);
  }
}

uint64_t __82__DBDashboardRootViewController__dismissStackedViewControllerAnimated_completion___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "bs_removeChildViewController:animated:transitionBlock:", *(void *)(a1 + 40), 0, 0);
  v2 = [*(id *)(a1 + 32) stackedContainerView];
  [v2 setHidden:1];

  [*(id *)(a1 + 32) _updateHomeScreenLayoutElementIfNeeded];
  uint64_t v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);
  return [v3 backgroundSceneWithCompletion:v4];
}

void __82__DBDashboardRootViewController__dismissStackedViewControllerAnimated_completion___block_invoke_201(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  [v4 setFromView:v3];
  [v4 setFromTransitionContainerView:*(void *)(a1 + 40)];
  char v5 = [*(id *)(a1 + 48) appDockViewController];
  [v4 setAppDockViewController:v5];

  id v6 = [*(id *)(a1 + 48) currentBaseViewController];
  id v7 = [v6 identifier];
  [v4 setToIdentifier:v7];

  id v8 = [*(id *)(a1 + 48) backgroundView];
  [v4 setRootContainerView:v8];
}

uint64_t __82__DBDashboardRootViewController__dismissStackedViewControllerAnimated_completion___block_invoke_2_203(uint64_t a1)
{
  [*(id *)(a1 + 32) invalidatePresentationViewForIdentifier:@"kCARFromStackedAppAnimationIdentifier"];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setHidden:0];

  uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v3();
}

- (void)invalidate
{
  uint64_t v3 = [(DBDashboardRootViewController *)self homeViewController];
  [v3 invalidate];

  id v4 = [(DBDashboardRootViewController *)self homeScreenElementAssertion];

  if (v4)
  {
    char v5 = DBLogForCategory(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_22D6F0000, v5, OS_LOG_TYPE_DEFAULT, "Invalidating home screen layout element", v7, 2u);
    }

    id v6 = [(DBDashboardRootViewController *)self homeScreenElementAssertion];
    [v6 invalidate];

    [(DBDashboardRootViewController *)self setHomeScreenElementAssertion:0];
  }
  [(DBDashboardRootViewController *)self setInvalidated:1];
}

- (id)preferredFocusEnvironments
{
  v5[1] = *MEMORY[0x263EF8340];
  v2 = [(DBDashboardRootViewController *)self homeViewController];
  v5[0] = v2;
  uint64_t v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v5 count:1];

  return v3;
}

- (DBDashboardHomeViewController)homeViewController
{
  return self->_homeViewController;
}

- (CPUIPassthroughView)contentView
{
  return self->_contentView;
}

- (void)setContentView:(id)a3
{
}

- (DBAppDockViewController)appDockViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_appDockViewController);
  return (DBAppDockViewController *)WeakRetained;
}

- (void)setAppDockViewController:(id)a3
{
}

- (double)contentCornerRadius
{
  return self->_contentCornerRadius;
}

- (DBEnvironment)environment
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_environment);
  return (DBEnvironment *)WeakRetained;
}

- (void)setEnvironment:(id)a3
{
}

- (DBDashboardLayoutEngine)layoutEngine
{
  return self->_layoutEngine;
}

- (void)setLayoutEngine:(id)a3
{
}

- (BOOL)invalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (_TtC9DashBoard22DBDashboardDimmingView)dimmingView
{
  return self->_dimmingView;
}

- (void)setDimmingView:(id)a3
{
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIView)baseContainerView
{
  return self->_baseContainerView;
}

- (void)setBaseContainerView:(id)a3
{
}

- (UIView)stackedContainerView
{
  return self->_stackedContainerView;
}

- (void)setStackedContainerView:(id)a3
{
}

- (CPUIPassthroughView)borderView
{
  return self->_borderView;
}

- (void)setBorderView:(id)a3
{
}

- (DBStatusBarBackgroundView)stackedPrimaryStatusBarBackgroundView
{
  return self->_stackedPrimaryStatusBarBackgroundView;
}

- (void)setStackedPrimaryStatusBarBackgroundView:(id)a3
{
}

- (DBStatusBarBackgroundView)stackedSecondaryStatusBarBackgroundView
{
  return self->_stackedSecondaryStatusBarBackgroundView;
}

- (void)setStackedSecondaryStatusBarBackgroundView:(id)a3
{
}

- (DBDashboardWorkspaceEntityPresenting)currentBaseViewController
{
  return self->_currentBaseViewController;
}

- (void)setCurrentBaseViewController:(id)a3
{
}

- (DBDashboardWorkspaceEntityPresenting)currentStackedViewController
{
  return self->_currentStackedViewController;
}

- (void)setCurrentStackedViewController:(id)a3
{
}

- (CARObserverHashTable)viewStateObservers
{
  return self->_viewStateObservers;
}

- (void)setViewStateObservers:(id)a3
{
}

- (unint64_t)currentViewState
{
  return self->_currentViewState;
}

- (void)setCurrentViewState:(unint64_t)a3
{
  self->_currentViewState = a3;
}

- (BSInvalidatable)homeScreenElementAssertion
{
  return self->_homeScreenElementAssertion;
}

- (void)setHomeScreenElementAssertion:(id)a3
{
}

- (NSArray)homeViewConstraints
{
  return self->_homeViewConstraints;
}

- (void)setHomeViewConstraints:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeViewConstraints, 0);
  objc_storeStrong((id *)&self->_homeScreenElementAssertion, 0);
  objc_storeStrong((id *)&self->_viewStateObservers, 0);
  objc_storeStrong((id *)&self->_currentStackedViewController, 0);
  objc_storeStrong((id *)&self->_currentBaseViewController, 0);
  objc_storeStrong((id *)&self->_stackedSecondaryStatusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_stackedPrimaryStatusBarBackgroundView, 0);
  objc_storeStrong((id *)&self->_borderView, 0);
  objc_storeStrong((id *)&self->_stackedContainerView, 0);
  objc_storeStrong((id *)&self->_baseContainerView, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_dimmingView, 0);
  objc_storeStrong((id *)&self->_layoutEngine, 0);
  objc_destroyWeak((id *)&self->_environment);
  objc_destroyWeak((id *)&self->_appDockViewController);
  objc_storeStrong((id *)&self->_contentView, 0);
  objc_storeStrong((id *)&self->_homeViewController, 0);
}

- (void)_presentBaseViewController:(uint64_t)a3 animated:(uint64_t)a4 launchSource:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dismissViewController:(uint64_t)a3 andPresentBaseViewController:(uint64_t)a4 animated:(uint64_t)a5 completion:(uint64_t)a6 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dismissViewController:(uint64_t)a3 andPresentBaseViewController:(uint64_t)a4 animated:(uint64_t)a5 completion:(uint64_t)a6 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dismissBaseViewControllerAnimated:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_presentStackedViewController:(uint64_t)a3 animated:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_dismissStackedViewControllerAnimated:(uint64_t)a3 completion:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end