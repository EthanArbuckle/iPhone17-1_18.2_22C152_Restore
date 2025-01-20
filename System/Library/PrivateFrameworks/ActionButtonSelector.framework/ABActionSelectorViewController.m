@interface ABActionSelectorViewController
+ (id)assistantSelectorWithActionItems:(id)a3 selectedIndex:(int64_t)a4 welcomeView:(id)a5 detailsView:(id)a6;
+ (id)settingsSelectorWithActionItems:(id)a3 selectedIndex:(int64_t)a4 detailsView:(id)a5;
- (ABActionSelectorViewController)initWithActionItems:(id)a3 selectedIndex:(int64_t)a4 welcomeView:(id)a5 detailsView:(id)a6;
- (ABActionSelectorViewControllerDelegate)delegate;
- (int64_t)selectedIndex;
- (void)_clipDuringNavigationTransiton;
- (void)_didTapToZoomIn;
- (void)_doRevealScene;
- (void)_renderWithTargetTimestamp:(double)a3 duration:(double)a4;
- (void)_revealSceneIfNeeded;
- (void)_updateSubviews;
- (void)carouselView:(id)a3 didDragToOffset:(double)a4 initialOffset:(double)a5;
- (void)carouselView:(id)a3 didSelectItemAtIndex:(int64_t)a4;
- (void)carouselViewWillEndDragging:(id)a3;
- (void)carouselViewWillStartDragging:(id)a3;
- (void)dealloc;
- (void)deviceSceneViewControllerWillRenderScene:(id)a3;
- (void)overrideSceneParamsWithZoomedOutParams:(id)a3 zoomedInParams:(id)a4;
- (void)pauseSceneUpdates;
- (void)resumeSceneUpdates;
- (void)selectActionItemWithIndex:(int64_t)a3 animated:(BOOL)a4;
- (void)setDelegate:(id)a3;
- (void)updateActionItems:(id)a3 animated:(BOOL)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)zoomIn;
- (void)zoomOut;
@end

@implementation ABActionSelectorViewController

+ (id)assistantSelectorWithActionItems:(id)a3 selectedIndex:(int64_t)a4 welcomeView:(id)a5 detailsView:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  v13 = (void *)[objc_alloc((Class)a1) initWithActionItems:v12 selectedIndex:a4 welcomeView:v11 detailsView:v10];

  return v13;
}

+ (id)settingsSelectorWithActionItems:(id)a3 selectedIndex:(int64_t)a4 detailsView:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = (void *)[objc_alloc((Class)a1) initWithActionItems:v9 selectedIndex:a4 welcomeView:0 detailsView:v8];

  return v10;
}

- (ABActionSelectorViewController)initWithActionItems:(id)a3 selectedIndex:(int64_t)a4 welcomeView:(id)a5 detailsView:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v22.receiver = self;
  v22.super_class = (Class)ABActionSelectorViewController;
  v13 = [(ABActionSelectorViewController *)&v22 initWithNibName:0 bundle:0];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_welcomeView, a5);
    objc_storeStrong((id *)&v14->_detailsView, a6);
    objc_initWeak(&location, v14);
    v15 = [ABActionSelectorDriver alloc];
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __92__ABActionSelectorViewController_initWithActionItems_selectedIndex_welcomeView_detailsView___block_invoke;
    v19[3] = &unk_265212E10;
    objc_copyWeak(&v20, &location);
    v16 = -[ABActionSelectorDriver initWithItems:selectedIndex:isInWelcomeMode:renderBlock:]((id *)&v15->super.isa, v10, (void *)a4, v11 != 0, v19);
    driver = v14->_driver;
    v14->_driver = (ABActionSelectorDriver *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __92__ABActionSelectorViewController_initWithActionItems_selectedIndex_welcomeView_detailsView___block_invoke(uint64_t a1, double a2, double a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _renderWithTargetTimestamp:a2 duration:a3];
}

- (void)dealloc
{
  -[ABActionSelectorDriver pause]((uint64_t)self->_driver);
  v3.receiver = self;
  v3.super_class = (Class)ABActionSelectorViewController;
  [(ABActionSelectorViewController *)&v3 dealloc];
}

- (void)resumeSceneUpdates
{
}

- (void)pauseSceneUpdates
{
}

- (void)zoomIn
{
}

- (void)zoomOut
{
}

- (int64_t)selectedIndex
{
  return -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
}

- (void)selectActionItemWithIndex:(int64_t)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  if (!-[ABCarouselView isDragging]((BOOL)self->_carouselView))
  {
    uint64_t v7 = -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
    if ((a3 & 0x8000000000000000) == 0 && v7 != a3)
    {
      id v8 = -[ABActionSelectorDriver items]((uint64_t)self->_driver);
      unint64_t v9 = [v8 count];

      if (v9 > a3)
      {
        -[ABActionSelectorDriver updateSelectedIndex:animateButtonColor:]((uint64_t)self->_driver, a3, v4);
        carouselView = self->_carouselView;
        -[ABCarouselView scrollToItemAtIndex:animated:]((id *)&carouselView->super.super.super.super.super.isa, a3, v4);
      }
    }
  }
}

- (void)updateActionItems:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  driver = self->_driver;
  id v7 = a3;
  -[ABActionSelectorDriver updateItems:animateButtonColor:]((uint64_t)driver, v7, v4);
  carouselView = self->_carouselView;
  carouselItems(v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  -[ABCarouselView reloadWithItems:animated:]((uint64_t)carouselView, v9, v4);
}

- (void)overrideSceneParamsWithZoomedOutParams:(id)a3 zoomedInParams:(id)a4
{
}

- (void)viewDidLoad
{
  v94[5] = *MEMORY[0x263EF8340];
  v92.receiver = self;
  v92.super_class = (Class)ABActionSelectorViewController;
  [(ABActionSelectorViewController *)&v92 viewDidLoad];
  objc_super v3 = (ABDeviceSceneViewController *)objc_opt_new();
  sceneViewController = self->_sceneViewController;
  self->_sceneViewController = v3;

  [(ABActionSelectorViewController *)self addChildViewController:self->_sceneViewController];
  v5 = [(ABActionSelectorViewController *)self view];
  v6 = [(ABDeviceSceneViewController *)self->_sceneViewController view];
  [v5 addSubview:v6];

  id v7 = [(ABActionSelectorViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(ABDeviceSceneViewController *)self->_sceneViewController view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [(ABDeviceSceneViewController *)self->_sceneViewController view];
  [v17 setAutoresizingMask:18];

  v18 = [(ABDeviceSceneViewController *)self->_sceneViewController view];
  [v18 setUserInteractionEnabled:0];

  v19 = [(ABDeviceSceneViewController *)self->_sceneViewController view];
  [v19 setOpaque:1];

  -[ABDeviceSceneViewController setDelegate:]((id *)&self->_sceneViewController->super.super.super.isa, self);
  [(ABDeviceSceneViewController *)self->_sceneViewController didMoveToParentViewController:self];
  if (-[ABActionSelectorDriver isInWelcomeMode]((BOOL)self->_driver)) {
    +[ABLoadingSplashView assistantSplashView]();
  }
  else {
  id v20 = +[ABLoadingSplashView settingsSplashView]();
  }
  objc_storeStrong((id *)&self->_splashView, v20);

  v21 = [(ABActionSelectorViewController *)self view];
  [v21 addSubview:self->_splashView];

  objc_super v22 = [(ABActionSelectorViewController *)self view];
  [v22 bounds];
  -[UIView setFrame:](self->_splashView, "setFrame:");

  [(UIView *)self->_splashView setAutoresizingMask:18];
  v23 = [ABShadowView alloc];
  v24 = [(ABActionSelectorViewController *)self view];
  [v24 bounds];
  v25 = -[ABShadowView initWithFrame:](v23, "initWithFrame:");
  shadowView = self->_shadowView;
  self->_shadowView = v25;

  v27 = [(ABActionSelectorViewController *)self view];
  [v27 addSubview:self->_shadowView];

  [(ABShadowView *)self->_shadowView setUserInteractionEnabled:0];
  [(ABShadowView *)self->_shadowView setAutoresizingMask:18];
  v28 = (ABHitTestPassthroughView *)objc_opt_new();
  overlayContainerView = self->_overlayContainerView;
  self->_overlayContainerView = v28;

  v30 = [(ABActionSelectorViewController *)self view];
  [v30 addSubview:self->_overlayContainerView];

  v31 = [(ABHitTestPassthroughView *)self->_overlayContainerView layer];
  [v31 setAllowsGroupOpacity:0];

  v32 = [(ABHitTestPassthroughView *)self->_overlayContainerView layer];
  [v32 setAllowsGroupBlending:0];

  [(ABHitTestPassthroughView *)self->_overlayContainerView setAlpha:0.0];
  v33 = (ABTransformView *)objc_opt_new();
  overlayView = self->_overlayView;
  self->_overlayView = v33;

  v35 = [(ABTransformView *)self->_overlayView layer];
  [v35 setGeometryFlipped:1];

  [(ABHitTestPassthroughView *)self->_overlayContainerView addSubview:self->_overlayView];
  v36 = [ABCarouselView alloc];
  v37 = -[ABActionSelectorDriver items]((uint64_t)self->_driver);
  v38 = carouselItems(v37);
  v39 = (void *)-[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
  v40 = (ABCarouselView *)-[ABCarouselView initWithItems:selectedIndex:]((id *)&v36->super.super.super.super.super.isa, v38, v39);
  carouselView = self->_carouselView;
  self->_carouselView = v40;

  [(ABTransformView *)self->_overlayView addSubview:self->_carouselView];
  v42 = [(ABActionSelectorViewController *)self view];
  v43 = -[ABCarouselView scrollGestureRecognizer]((uint64_t)self->_carouselView);
  [v42 addGestureRecognizer:v43];

  -[ABCarouselView setDelegate:]((id *)&self->_carouselView->super.super.super.super.super.isa, self);
  v44 = (ABDeviceButtonHighlightView *)objc_opt_new();
  buttonHighlightView = self->_buttonHighlightView;
  self->_buttonHighlightView = v44;

  [(ABTransformView *)self->_overlayView addSubview:self->_buttonHighlightView];
  v46 = [(ABActionSelectorViewController *)self view];
  [v46 addSubview:self->_detailsView];

  [(UIView *)self->_detailsView setTranslatesAutoresizingMaskIntoConstraints:0];
  v74 = (void *)MEMORY[0x263F08938];
  v87 = [(UIView *)self->_detailsView centerXAnchor];
  v89 = [(ABActionSelectorViewController *)self view];
  v85 = [v89 centerXAnchor];
  v83 = [v87 constraintEqualToAnchor:v85];
  v94[0] = v83;
  v79 = [(UIView *)self->_detailsView leadingAnchor];
  v81 = [(ABActionSelectorViewController *)self view];
  v77 = [v81 leadingAnchor];
  v75 = [v79 constraintEqualToAnchor:v77];
  v94[1] = v75;
  v72 = [(UIView *)self->_detailsView trailingAnchor];
  v73 = [(ABActionSelectorViewController *)self view];
  v71 = [v73 trailingAnchor];
  v70 = [v72 constraintEqualToAnchor:v71];
  v94[2] = v70;
  v68 = [(UIView *)self->_detailsView bottomAnchor];
  v69 = [(ABActionSelectorViewController *)self view];
  v47 = [v69 safeAreaLayoutGuide];
  v48 = [v47 bottomAnchor];
  v49 = [v68 constraintEqualToAnchor:v48];
  v94[3] = v49;
  v50 = [(UIView *)self->_detailsView heightAnchor];
  v51 = [(ABActionSelectorViewController *)self view];
  v52 = [v51 heightAnchor];
  v53 = [v50 constraintEqualToAnchor:v52 multiplier:0.375];
  v94[4] = v53;
  v54 = [MEMORY[0x263EFF8C0] arrayWithObjects:v94 count:5];
  [v74 activateConstraints:v54];

  -[UIView setAlpha:](self->_detailsView, "setAlpha:", (double)!-[ABActionSelectorDriver isInWelcomeMode]((BOOL)self->_driver));
  if (self->_welcomeView)
  {
    v55 = [(ABActionSelectorViewController *)self view];
    [v55 addSubview:self->_welcomeView];

    [(UIView *)self->_welcomeView setTranslatesAutoresizingMaskIntoConstraints:0];
    v78 = (void *)MEMORY[0x263F08938];
    v90 = [(UIView *)self->_welcomeView leadingAnchor];
    v91 = [(ABActionSelectorViewController *)self view];
    v88 = [v91 leadingAnchor];
    v86 = [v90 constraintEqualToAnchor:v88];
    v93[0] = v86;
    v82 = [(UIView *)self->_welcomeView trailingAnchor];
    v84 = [(ABActionSelectorViewController *)self view];
    v80 = [v84 trailingAnchor];
    v76 = [v82 constraintEqualToAnchor:v80];
    v93[1] = v76;
    v56 = [(UIView *)self->_welcomeView bottomAnchor];
    v57 = [(ABActionSelectorViewController *)self view];
    v58 = [v57 bottomAnchor];
    v59 = [v56 constraintEqualToAnchor:v58];
    v93[2] = v59;
    v60 = [(UIView *)self->_welcomeView heightAnchor];
    v61 = [(ABActionSelectorViewController *)self view];
    v62 = [v61 heightAnchor];
    v63 = [v60 constraintEqualToAnchor:v62 multiplier:0.45];
    v93[3] = v63;
    v64 = [MEMORY[0x263EFF8C0] arrayWithObjects:v93 count:4];
    [v78 activateConstraints:v64];
  }
  v65 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x263F1CA70]) initWithTarget:self action:sel__didTapToZoomIn];
  tapToZoomInRecognizer = self->_tapToZoomInRecognizer;
  self->_tapToZoomInRecognizer = v65;

  v67 = [(ABActionSelectorViewController *)self view];
  [v67 addGestureRecognizer:self->_tapToZoomInRecognizer];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABActionSelectorViewController;
  [(ABActionSelectorViewController *)&v4 viewWillAppear:a3];
  [(ABActionSelectorViewController *)self _clipDuringNavigationTransiton];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)ABActionSelectorViewController;
  [(ABActionSelectorViewController *)&v4 viewWillDisappear:a3];
  [(ABActionSelectorViewController *)self _clipDuringNavigationTransiton];
}

- (void)viewDidLayoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)ABActionSelectorViewController;
  [(ABActionSelectorViewController *)&v8 viewDidLayoutSubviews];
  objc_super v3 = [(ABActionSelectorViewController *)self view];
  [v3 bounds];
  double v5 = v4 * 0.5;
  v6 = [(ABActionSelectorViewController *)self view];
  [v6 bounds];
  -[ABHitTestPassthroughView setCenter:](self->_overlayContainerView, "setCenter:", v5, v7 * 0.5);
}

- (void)carouselViewWillStartDragging:(id)a3
{
}

- (void)carouselView:(id)a3 didDragToOffset:(double)a4 initialOffset:(double)a5
{
  driver = self->_driver;
  double v6 = a4 - a5;
  id v8 = [(ABActionSelectorViewController *)self view];
  [v8 bounds];
  -[ABActionSelectorDriver updateDragProgress:](driver, v6 / v7);
}

- (void)carouselViewWillEndDragging:(id)a3
{
}

- (void)carouselView:(id)a3 didSelectItemAtIndex:(int64_t)a4
{
  if ((a4 & 0x8000000000000000) == 0)
  {
    double v6 = -[ABActionSelectorDriver items]((uint64_t)self->_driver);
    unint64_t v7 = [v6 count];

    if (v7 > a4)
    {
      -[ABActionSelectorDriver updateSelectedIndex:animateButtonColor:]((uint64_t)self->_driver, a4, 1);
      id v8 = [(ABActionSelectorViewController *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        id v10 = [(ABActionSelectorViewController *)self delegate];
        [v10 actionSelectorViewController:self didSelectItemAtIndex:a4];
      }
    }
  }
}

- (void)deviceSceneViewControllerWillRenderScene:(id)a3
{
  memset(&v13, 0, sizeof(v13));
  [(ABDeviceSceneViewController *)(CATransform3D *)self->_sceneViewController actionButtonPerspectiveTransform];
  double v4 = -[ABDeviceSceneViewController actionButtonScreenScale]((uint64_t)self->_sceneViewController);
  CATransform3DMakeScale(&a, v4, v4, 1.0);
  CATransform3D b = v13;
  CATransform3DConcat(&v12, &a, &b);
  double v5 = [(ABCarouselView *)self->_carouselView layer];
  CATransform3D v9 = v12;
  [v5 setTransform:&v9];

  CATransform3D v8 = v13;
  double v6 = [(ABDeviceButtonHighlightView *)self->_buttonHighlightView layer];
  CATransform3D v7 = v8;
  [v6 setTransform:&v7];
}

- (void)_renderWithTargetTimestamp:(double)a3 duration:(double)a4
{
  if (-[ABDeviceSceneViewController isScenePresented]((BOOL)self->_sceneViewController)) {
    [(ABActionSelectorViewController *)self _revealSceneIfNeeded];
  }
  sceneViewController = self->_sceneViewController;
  [(ABActionSelectorDriver *)(uint64_t)self->_driver sceneRenderInputs];
  if (sceneViewController) {
    -[ABDeviceSceneViewController renderWithTargetTimestamp:duration:renderInputs:](sceneViewController, (uint64_t)v18, a3, a4);
  }
  else {

  }
  uint64_t v8 = [MEMORY[0x263F158F8] disableActions];
  [MEMORY[0x263F158F8] setDisableActions:1];
  [(ABActionSelectorViewController *)self _updateSubviews];
  [(ABActionSelectorDriver *)(uint64_t)self->_driver overlayRenderInputs];
  [(ABShadowView *)self->_shadowView setTopShadowRatio:v17];

  [MEMORY[0x263F158F8] setDisableActions:v8];
  [(ABActionSelectorDriver *)(uint64_t)self->_driver overlayRenderInputs];
  -[ABDeviceButtonHighlightView setHighlightRingVisible:]((uint64_t)self->_buttonHighlightView, v14);

  id v10 = [(ABActionSelectorViewController *)self presentedViewController];
  BOOL v11 = v10 != 0;

  if (self->_hasPresentedViewController != v11)
  {
    self->_hasPresentedViewController = v11;
    -[ABActionSelectorDriver occlusionDidChange:](self->_driver, (const char *)(v10 != 0));
  }
}

- (void)_updateSubviews
{
  [(ABDeviceSceneViewController *)(id *)&self->_sceneViewController->super.super.super.isa devicePerspectiveTransform];
  objc_super v3 = -[ABTransformView transformLayer](self->_overlayView);
  v17[4] = v18[4];
  v17[5] = v18[5];
  v17[6] = v18[6];
  v17[7] = v18[7];
  v17[0] = v18[0];
  v17[1] = v18[1];
  v17[2] = v18[2];
  v17[3] = v18[3];
  [v3 setSublayerTransform:v17];

  uint64_t v16 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  [(ABActionSelectorDriver *)(uint64_t)self->_driver overlayRenderInputs];
  [(UIView *)self->_detailsView setAlpha:*((double *)&v14 + 1)];
  [(UIView *)self->_welcomeView setAlpha:*(double *)&v15];
  [(UITapGestureRecognizer *)self->_tapToZoomInRecognizer setEnabled:v16];
  double v4 = -[ABDeviceSceneViewController actionButtonTranslationWithPressProgress:]((uint64_t)self->_sceneViewController, *(double *)&v12);
  carouselView = self->_carouselView;
  uint64_t v6 = -[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver);
  -[ABCarouselView setZPosition:forItemAtIndex:]((uint64_t)carouselView, v6, v4);
  -[ABDeviceButtonHighlightView setColor:]((uint64_t)self->_buttonHighlightView, *((void **)&v13 + 1));
  CATransform3D v7 = (void *)MEMORY[0x263F089C8];
  uint64_t v8 = -[ABCarouselView items]((id *)&self->_carouselView->super.super.super.super.super.isa);
  CATransform3D v9 = objc_msgSend(v7, "indexSetWithIndexesInRange:", 0, objc_msgSend(v8, "count"));

  if ((_BYTE)v13) {
    [v9 removeIndex:-[ABActionSelectorDriver selectedIndex]((uint64_t)self->_driver)];
  }
  -[ABCarouselView applyAlphaBlend:toItemsAtIndexes:]((void **)&self->_carouselView->super.super.super.super.super.isa, v9, *((double *)&v12 + 1));
  int v10 = BYTE1(v13);
  BOOL v11 = -[ABCarouselView scrollGestureRecognizer]((uint64_t)self->_carouselView);
  [v11 setEnabled:v10 != 0];
}

- (void)_revealSceneIfNeeded
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  if (!self->_didRevealScene)
  {
    objc_super v3 = ABLogger();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      CATransform3D v7 = self;
      _os_log_impl(&dword_24741F000, v3, OS_LOG_TYPE_DEFAULT, "(%{public}@) reveal the scene", buf, 0xCu);
    }

    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke;
    v5[3] = &unk_265212E38;
    v5[4] = self;
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke_2;
    v4[3] = &unk_265212E60;
    v4[4] = self;
    [MEMORY[0x263F1CB60] animateWithDuration:v5 animations:v4 completion:0.25];
    self->_didRevealScene = 1;
  }
}

uint64_t __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1016) setAlpha:1.0];
  v2 = *(void **)(*(void *)(a1 + 32) + 1000);

  return [v2 setAlpha:0.0];
}

uint64_t __54__ABActionSelectorViewController__revealSceneIfNeeded__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _doRevealScene];
}

- (void)_doRevealScene
{
  [(ABHitTestPassthroughView *)self->_overlayContainerView setAlpha:1.0];
  [(UIView *)self->_splashView setHidden:1];
  driver = self->_driver;

  -[ABActionSelectorDriver didRevealScene](driver);
}

- (void)_clipDuringNavigationTransiton
{
  objc_super v3 = [(ABActionSelectorViewController *)self view];
  char v4 = [v3 clipsToBounds];

  double v5 = [(ABActionSelectorViewController *)self view];
  [v5 setClipsToBounds:1];

  uint64_t v6 = [(ABActionSelectorViewController *)self transitionCoordinator];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __64__ABActionSelectorViewController__clipDuringNavigationTransiton__block_invoke;
  v7[3] = &unk_265212E88;
  v7[4] = self;
  char v8 = v4;
  [v6 animateAlongsideTransition:0 completion:v7];
}

void __64__ABActionSelectorViewController__clipDuringNavigationTransiton__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setClipsToBounds:v1];
}

- (void)_didTapToZoomIn
{
}

- (ABActionSelectorViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ABActionSelectorViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_tapToZoomInRecognizer, 0);
  objc_storeStrong((id *)&self->_buttonHighlightView, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_carouselView, 0);
  objc_storeStrong((id *)&self->_overlayView, 0);
  objc_storeStrong((id *)&self->_overlayContainerView, 0);
  objc_storeStrong((id *)&self->_sceneViewController, 0);
  objc_storeStrong((id *)&self->_splashView, 0);
  objc_storeStrong((id *)&self->_detailsView, 0);
  objc_storeStrong((id *)&self->_welcomeView, 0);

  objc_storeStrong((id *)&self->_driver, 0);
}

@end