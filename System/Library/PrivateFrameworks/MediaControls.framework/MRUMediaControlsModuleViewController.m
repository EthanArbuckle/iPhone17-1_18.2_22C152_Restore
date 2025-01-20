@interface MRUMediaControlsModuleViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)canDismissPresentedContent;
- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4;
- (BOOL)isExpanded;
- (BOOL)isOnScreen;
- (BOOL)isResizing;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)providesOwnPlatter;
- (BOOL)shouldBeginTransitionToExpandedContentModule;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)shouldPerformHoverInteraction;
- (BOOL)shouldRefreshUI;
- (BOOL)showMoreButton;
- (CCUIModuleContentMetrics)contentMetrics;
- (MRUMediaControlsModuleNowPlayingViewController)nowPlayingViewController;
- (MRUMediaControlsModuleViewController)initWithManager:(id)a3;
- (MRUNowPlayingControllerManager)manager;
- (MRURoutingViewController)routingViewController;
- (UICollectionViewDiffableDataSource)dataSource;
- (UIViewController)alertViewController;
- (double)compactContinuousCornerRadius;
- (double)preferredExpandedContentHeight;
- (double)preferredExpandedContentWidth;
- (id)activeIdentifier;
- (id)dismissalBlock;
- (id)homeGestureDismissalAllowedBlock;
- (id)routingCornerViewTappedBlock;
- (int64_t)discoveryMode;
- (int64_t)expandedLayout;
- (int64_t)gridSizeClass;
- (unint64_t)contentRenderingMode;
- (unint64_t)implicitlyExpandedGridSizeClasses;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)createNowPlayingViewController;
- (void)createRoutingViewController;
- (void)didSelectListState:(id)a3;
- (void)didSelectQuickControl:(id)a3;
- (void)dismiss;
- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4;
- (void)dismissWithCompletion:(id)a3;
- (void)loadView;
- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)nowPlayingControllerManager:(id)a3 didChangeActiveController:(id)a4;
- (void)nowPlayingControllerManager:(id)a3 didChangeControllers:(id)a4;
- (void)nowPlayingViewController:(id)a3 applyLayout:(int64_t)a4;
- (void)nowPlayingViewController:(id)a3 cordinateDismissal:(id)a4;
- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4;
- (void)setActiveController:(id)a3;
- (void)setAlertViewController:(id)a3;
- (void)setCompactContinuousCornerRadius:(double)a3;
- (void)setContentMetrics:(id)a3;
- (void)setContentRenderingMode:(unint64_t)a3;
- (void)setDataSource:(id)a3;
- (void)setDiscoveryMode:(int64_t)a3;
- (void)setDismissalBlock:(id)a3;
- (void)setExpandedLayout:(int64_t)a3;
- (void)setGridSizeClass:(int64_t)a3;
- (void)setHomeGestureDismissalAllowedBlock:(id)a3;
- (void)setIsExpanded:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setNowPlayingViewController:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setRoutingCornerViewTappedBlock:(id)a3;
- (void)setRoutingViewController:(id)a3;
- (void)transitionToLayout:(int64_t)a3 completion:(id)a4;
- (void)updateActiveViewController;
- (void)updateCell:(id)a3 forIdentifier:(id)a4;
- (void)updateCellForIdentifier:(id)a3;
- (void)updateCornerRadius;
- (void)updateDiscoveryMode;
- (void)updateLayout;
- (void)updateMoreButton;
- (void)updateNowPlayingControllers;
- (void)updateRoutingContentEdgeInsets;
- (void)updateRoutingController;
- (void)updateRoutingDataControllers;
- (void)updateRoutingDiscoveryMode;
- (void)updateVisibilityForActiveCell:(BOOL)a3 inActiveCells:(BOOL)a4;
- (void)updateVolumeController;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToExpandedContentMode:(BOOL)a3;
@end

@implementation MRUMediaControlsModuleViewController

- (MRUMediaControlsModuleViewController)initWithManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUMediaControlsModuleViewController;
  v6 = [(MRUMediaControlsModuleViewController *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_expandedLayout = 0x7FFFFFFFFFFFFFFFLL;
    v6->_gridSizeClass = 4;
    objc_storeStrong((id *)&v6->_manager, a3);
    [(MRUNowPlayingControllerManager *)v7->_manager addObserver:v7];
  }

  return v7;
}

- (void)loadView
{
  v3 = [MRUMediaControlsModuleView alloc];
  v4 = -[MRUMediaControlsModuleView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(MRUMediaControlsModuleViewController *)self setView:v4];
}

- (void)viewDidLoad
{
  v25.receiver = self;
  v25.super_class = (Class)MRUMediaControlsModuleViewController;
  [(MRUMediaControlsModuleViewController *)&v25 viewDidLoad];
  [(MRUMediaControlsModuleViewController *)self setOverrideUserInterfaceStyle:2];
  v3 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_dismiss];
  [v3 setDelegate:self];
  v4 = [(MRUMediaControlsModuleViewController *)self view];
  [v4 addGestureRecognizer:v3];

  id v5 = [(MRUMediaControlsModuleViewController *)self contentMetrics];
  v6 = [(MRUMediaControlsModuleViewController *)self view];
  [v6 setContentMetrics:v5];

  v7 = [(MRUMediaControlsModuleViewController *)self view];
  v8 = [v7 moreButton];
  [v8 addTarget:self action:sel_didSelectListState_ forControlEvents:64];

  objc_super v9 = [(MRUMediaControlsModuleViewController *)self view];
  v10 = [v9 collectionView];
  [v10 setDelegate:self];

  objc_initWeak(&location, self);
  v11 = (void *)MEMORY[0x1E4FB1578];
  uint64_t v12 = objc_opt_class();
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke;
  v22[3] = &unk_1E5F10250;
  objc_copyWeak(&v23, &location);
  v13 = [v11 registrationWithCellClass:v12 configurationHandler:v22];
  id v14 = objc_alloc(MEMORY[0x1E4FB1598]);
  v15 = [(MRUMediaControlsModuleViewController *)self view];
  v16 = [v15 collectionView];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke_2;
  v20[3] = &unk_1E5F0E570;
  id v17 = v13;
  id v21 = v17;
  v18 = (UICollectionViewDiffableDataSource *)[v14 initWithCollectionView:v16 cellProvider:v20];
  dataSource = self->_dataSource;
  self->_dataSource = v18;

  [(MRUMediaControlsModuleViewController *)self createNowPlayingViewController];
  [(MRUMediaControlsModuleViewController *)self createRoutingViewController];
  [(MRUMediaControlsModuleViewController *)self updateLayout];

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);
}

void __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = (id *)(a1 + 32);
  id v6 = a4;
  id v7 = a2;
  id WeakRetained = objc_loadWeakRetained(v5);
  [WeakRetained updateCell:v7 forIdentifier:v6];
}

uint64_t __51__MRUMediaControlsModuleViewController_viewDidLoad__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  return [a2 dequeueConfiguredReusableCellWithRegistration:*(void *)(a1 + 32) forIndexPath:a3 item:a4];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleViewController;
  [(MRUMediaControlsModuleViewController *)&v4 viewWillAppear:a3];
  [(MRUMediaControlsModuleViewController *)self setOnScreen:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleViewController;
  [(MRUMediaControlsModuleViewController *)&v4 viewWillDisappear:a3];
  [(MRUMediaControlsModuleViewController *)self setOnScreen:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUMediaControlsModuleViewController;
  [(MRUMediaControlsModuleViewController *)&v3 viewWillLayoutSubviews];
  [(MRUMediaControlsModuleViewController *)self updateCornerRadius];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v10.receiver = self;
  v10.super_class = (Class)MRUMediaControlsModuleViewController;
  id v7 = a4;
  -[MRUMediaControlsModuleViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[4] = self;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v9[3] = &unk_1E5F0E4A8;
  v9[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
  v8[3] = &unk_1E5F0E4A8;
  [v7 animateAlongsideTransition:v9 completion:v8];
}

void __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setTransitioning:1];

  [*(id *)(a1 + 32) updateLayout];
  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

uint64_t __91__MRUMediaControlsModuleViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setTransitioning:0];

  [*(id *)(a1 + 32) updateNowPlayingControllers];
  id v3 = *(void **)(a1 + 32);

  return [v3 updateActiveViewController];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRUMediaControlsModuleViewController *)self updateDiscoveryMode];
    id v4 = [(MRUMediaControlsModuleViewController *)self manager];
    [v4 updateAutomaticResponseLoading];
  }
}

- (void)setLayout:(int64_t)a3
{
  id v5 = [(MRUMediaControlsModuleViewController *)self view];
  [v5 setLayout:a3];

  id v6 = [(MRUMediaControlsModuleViewController *)self nowPlayingViewController];
  [v6 setLayout:a3];

  [(MRUMediaControlsModuleViewController *)self updateDiscoveryMode];
  [(MRUMediaControlsModuleViewController *)self updateRoutingDiscoveryMode];
  [(MRUMediaControlsModuleViewController *)self updateMoreButton];
  id v7 = [(MRUMediaControlsModuleViewController *)self manager];
  [v7 updateAutomaticResponseLoading];

  double v8 = MRUMediaModuleContentInsetsForLayout(a3);
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [(MRUMediaControlsModuleViewController *)self view];
  v16 = [v15 backgroundView];
  objc_msgSend(v16, "setContentEdgeInsets:", v8, v10, v12, v14);

  double v17 = MRUMediaModuleContentInsetsForLayout(a3);
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  v24 = [(MRUMediaControlsModuleViewController *)self nowPlayingViewController];
  objc_msgSend(v24, "setContentEdgeInsets:", v17, v19, v21, v23);

  [(MRUMediaControlsModuleViewController *)self updateRoutingContentEdgeInsets];
  if (self->_resizing)
  {
    objc_super v25 = [(MRUMediaControlsModuleViewController *)self view];
    [v25 layoutIfNeeded];
  }
  v26 = [(MRUMediaControlsModuleViewController *)self alertViewController];

  if (a3 != 6 && v26) {
    [(MRUMediaControlsModuleViewController *)self setAlertViewController:0];
  }
  id homeGestureDismissalAllowedBlock = self->_homeGestureDismissalAllowedBlock;
  if (homeGestureDismissalAllowedBlock)
  {
    v28 = (void (*)(void))*((void *)homeGestureDismissalAllowedBlock + 2);
    v28();
  }
}

- (id)activeIdentifier
{
  v2 = [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController controller];
  id v3 = [v2 identifier];

  return v3;
}

- (void)setAlertViewController:(id)a3
{
  id v5 = (UIViewController *)a3;
  alertViewController = self->_alertViewController;
  if (alertViewController != v5)
  {
    id v7 = alertViewController;
    objc_storeStrong((id *)&self->_alertViewController, a3);
    [(UIViewController *)v7 willMoveToParentViewController:0];
    [(UIViewController *)v7 beginAppearanceTransition:0 animated:1];
    if (v5)
    {
      [(MRUMediaControlsModuleViewController *)self addChildViewController:v5];
      double v8 = [(UIViewController *)v5 view];
      double v9 = [(MRUMediaControlsModuleViewController *)self view];
      [v9 setAlertView:v8];

      double v10 = [(MRUMediaControlsModuleViewController *)self view];
      [v10 layoutIfNeeded];
    }
    else
    {
      double v10 = [(MRUMediaControlsModuleViewController *)self view];
      [v10 setAlertView:0];
    }

    double v11 = (void *)MEMORY[0x1E4FB1EB0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke;
    v17[3] = &unk_1E5F0DC48;
    double v18 = v7;
    double v19 = self;
    double v20 = v5;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke_2;
    v13[3] = &unk_1E5F0DC70;
    double v14 = v18;
    v15 = v20;
    v16 = self;
    double v12 = v18;
    objc_msgSend(v11, "mru_animateUsingType:animations:completion:", 0, v17, v13);
  }
}

void __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 setAlpha:0.0];

  BOOL v3 = *(void *)(a1 + 48) != 0;
  id v4 = [*(id *)(a1 + 40) view];
  [v4 setShowAlertView:v3];

  id v5 = [*(id *)(a1 + 40) view];
  [v5 layoutIfNeeded];
}

uint64_t __63__MRUMediaControlsModuleViewController_setAlertViewController___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  [*(id *)(a1 + 32) removeFromParentViewController];
  [*(id *)(a1 + 32) endAppearanceTransition];
  BOOL v3 = *(void **)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 48);

  return [v3 didMoveToParentViewController:v4];
}

- (void)setContentMetrics:(id)a3
{
  double v9 = (CCUIModuleContentMetrics *)a3;
  id v5 = self->_contentMetrics;
  id v6 = v9;
  if (v5 != v9)
  {
    id v7 = v5;
    char v8 = [(CCUIModuleContentMetrics *)v5 isEqual:v9];

    if (v8) {
      goto LABEL_5;
    }
    objc_storeStrong((id *)&self->_contentMetrics, a3);
    id v6 = [(MRUMediaControlsModuleViewController *)self view];
    [v6 setContentMetrics:v9];
  }

LABEL_5:
}

- (void)dismiss
{
}

- (void)didSelectListState:(id)a3
{
  [(MRUMediaControlsModuleViewController *)self updateNowPlayingControllers];
  uint64_t v4 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v5 = [v4 layout];

  if ((unint64_t)(v5 - 6) <= 3) {
    self->_expandedLayout = qword_1AE964300[v5 - 6];
  }
  if (self->_isExpanded)
  {
    [(MRUMediaControlsModuleViewController *)self updateLayout];
  }
  else
  {
    id v6 = (void (*)(void))*((void *)self->_routingCornerViewTappedBlock + 2);
    v6();
  }
}

- (void)didSelectQuickControl:(id)a3
{
  manager = self->_manager;
  uint64_t v4 = [a3 identifier];
  uint64_t v5 = [(MRUNowPlayingControllerManager *)manager controllerForIdentifier:v4];
  id v6 = [v5 quickControlItem];
  uint64_t v8 = [v6 mainAction];

  id v7 = (void *)v8;
  if (v8)
  {
    (*(void (**)(uint64_t))(v8 + 16))(v8);
    id v7 = (void *)v8;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [v6 deselectItemAtIndexPath:v7 animated:0];
  uint64_t v8 = [(UICollectionViewDiffableDataSource *)self->_dataSource itemIdentifierForIndexPath:v7];
  double v9 = [(MRUNowPlayingControllerManager *)self->_manager controllerForIdentifier:v8];
  double v10 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v11 = [v10 layout];

  objc_initWeak(&location, self);
  double v12 = [v9 endpointController];
  if (v11 == 1) {
    uint64_t v13 = 6;
  }
  else {
    uint64_t v13 = 7;
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke;
  v15[3] = &unk_1E5F10278;
  objc_copyWeak(v17, &location);
  id v14 = v9;
  id v16 = v14;
  v17[1] = (id)v13;
  [v12 connectAllowingAuthenticationWithCompletion:v15];

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
}

void __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v5 = WeakRetained;
  if (a2)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = [WeakRetained manager];
    [v7 setActiveController:v6];

    [v5 setActiveController:*(void *)(a1 + 32)];
    uint64_t v8 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2;
    v9[3] = &unk_1E5F0D7F8;
    id v10 = v5;
    [v10 transitionToLayout:v8 completion:v9];
  }
}

uint64_t __80__MRUMediaControlsModuleViewController_collectionView_didSelectItemAtIndexPath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateNowPlayingControllers];
}

- (void)nowPlayingControllerManager:(id)a3 didChangeActiveController:(id)a4
{
  [(MRUMediaControlsModuleViewController *)self setActiveController:a4];

  [(MRUMediaControlsModuleViewController *)self updateDiscoveryMode];
}

- (void)nowPlayingControllerManager:(id)a3 didChangeControllers:(id)a4
{
  uint64_t v5 = [(MRUMediaControlsModuleViewController *)self view];
  char v6 = [v5 isTransitioning];

  if ((v6 & 1) == 0)
  {
    [(MRUMediaControlsModuleViewController *)self updateNowPlayingControllers];
  }
}

- (void)nowPlayingViewController:(id)a3 applyLayout:(int64_t)a4
{
  self->_expandedLayout = a4;
  uint64_t v5 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v6 = [v5 layout];

  if ((unint64_t)(v6 - 6) > 3)
  {
    if (!+[MRUFeatureFlagProvider isNewControlsRouteExpandAllLayoutsEnabled])
    {
      routingCornerViewTappedBlock = (void (**)(void))self->_routingCornerViewTappedBlock;
      if (routingCornerViewTappedBlock) {
        routingCornerViewTappedBlock[2]();
      }
    }
  }
  else
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __77__MRUMediaControlsModuleViewController_nowPlayingViewController_applyLayout___block_invoke;
    v9[3] = &unk_1E5F0D7F8;
    void v9[4] = self;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:", 0, v9);
  }
  if (+[MRUFeatureFlagProvider isNewControlsRouteExpandAllLayoutsEnabled])
  {
    uint64_t v8 = (void (**)(void))self->_routingCornerViewTappedBlock;
    if (v8) {
      v8[2]();
    }
  }
}

void __77__MRUMediaControlsModuleViewController_nowPlayingViewController_applyLayout___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLayout];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

- (void)nowPlayingViewController:(id)a3 cordinateDismissal:(id)a4
{
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  uint64_t v4 = [(MRUMediaControlsModuleViewController *)self view];
  unint64_t v5 = [v4 layout];

  if (v5 > 9 || ((1 << v5) & 0x3C6) == 0) {
    return 0;
  }

  return [(MRUMediaControlsModuleViewController *)self shouldRefreshUI];
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6 = [a3 identifier];
  [(MRUMediaControlsModuleViewController *)self updateCellForIdentifier:v6];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6 = [a3 identifier];
  [(MRUMediaControlsModuleViewController *)self updateCellForIdentifier:v6];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6 = [a3 identifier];
  [(MRUMediaControlsModuleViewController *)self updateCellForIdentifier:v6];
}

- (void)nowPlayingController:(id)a3 didChangeQuickControlItem:(id)a4
{
  id v5 = [a3 identifier];
  [(MRUMediaControlsModuleViewController *)self updateCellForIdentifier:v5];
}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 actionIdentifier];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F31288]];

  if (v9)
  {
    objc_initWeak(&location, self);
    objc_copyWeak(&v10, &location);
    SBSRequestPasscodeUnlockAlertUI();
    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __87__MRUMediaControlsModuleViewController_routingViewController_didSelectRoutingViewItem___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F9F760] instantiateViewController];
    [v4 setFlags:1];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __87__MRUMediaControlsModuleViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2;
    v6[3] = &unk_1E5F0DCC0;
    id v5 = WeakRetained;
    id v7 = v5;
    [v4 setCompletion:v6];
    [v5 setAlertViewController:v4];
  }
}

void __87__MRUMediaControlsModuleViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    int v9 = [v5 mediaRouteIdentifier];
    int v10 = 138412802;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v9;
    __int16 v14 = 2112;
    id v15 = v6;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%@ ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v10, 0x20u);
  }
  [*(id *)(a1 + 32) setAlertViewController:0];
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v5 = a4;
  id v7 = [(MRUMediaControlsModuleViewController *)self view];
  id v6 = [v7 backgroundView];
  [v6 setBackdropImage:v5];
}

- (void)setGridSizeClass:(int64_t)a3
{
  self->_gridSizeClass = a3;
  self->_expandedLayout = 0x7FFFFFFFFFFFFFFFLL;
  [(MRUMediaControlsModuleViewController *)self updateLayout];
}

- (void)setCompactContinuousCornerRadius:(double)a3
{
  self->_compactContinuousCornerRadius = a3;
  [(MRUMediaControlsModuleViewController *)self updateCornerRadius];
}

- (void)setContentRenderingMode:(unint64_t)a3
{
  if (self->_contentRenderingMode != a3)
  {
    self->_contentRenderingMode = a3;
    BOOL v4 = a3 == 1;
    id v5 = [(MRUMediaControlsModuleViewController *)self nowPlayingViewController];
    [v5 setPreview:v4];

    [(MRUMediaControlsModuleViewController *)self updateLayout];
    [(MRUMediaControlsModuleViewController *)self updateDiscoveryMode];
    id v6 = [(MRUMediaControlsModuleViewController *)self manager];
    [v6 updateAutomaticResponseLoading];
  }
}

- (void)setResizing:(BOOL)a3
{
  self->_resizing = a3;
  -[MRUMediaControlsModuleNowPlayingViewController setResizing:](self->_nowPlayingViewController, "setResizing:");
}

- (double)preferredExpandedContentHeight
{
  id v2 = [(MRUMediaControlsModuleViewController *)self view];
  BOOL v3 = [v2 window];
  [v3 bounds];
  double Height = CGRectGetHeight(v6);

  return Height;
}

- (double)preferredExpandedContentWidth
{
  id v2 = [(MRUMediaControlsModuleViewController *)self view];
  if (MRULayoutShouldBeVertical()) {
    double v3 = MRUExpandedTallWidth();
  }
  else {
    double v3 = MRUExpandedWideWidth();
  }
  double v4 = v3;

  return v4;
}

- (BOOL)providesOwnPlatter
{
  return 1;
}

- (BOOL)shouldPerformHoverInteraction
{
  return 0;
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  id v4 = a3;
  id v5 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v6 = [v5 layout];

  BOOL v7 = (unint64_t)(v6 - 5) >= 3
    && [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController shouldExpandModuleOnTouch:v4];

  return v7;
}

- (BOOL)shouldBeginTransitionToExpandedContentModule
{
  double v3 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v4 = [v3 layout];

  return (unint64_t)(v4 - 5) > 1 || self->_expandedLayout != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)canDismissPresentedContent
{
  double v3 = [(MRUMediaControlsModuleViewController *)self view];
  if ([v3 layout] == 1)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = [(MRUMediaControlsModuleViewController *)self view];
    BOOL v4 = [v5 layout] == 2;
  }
  return v4;
}

- (void)willTransitionToExpandedContentMode:(BOOL)a3
{
  BOOL v3 = a3;
  self->_isExpanded = a3;
  id v4 = [(MRUMediaControlsModuleViewController *)self view];
  [v4 setExpanded:v3];
}

- (unint64_t)implicitlyExpandedGridSizeClasses
{
  return 1536;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(MRUMediaControlsModuleViewController *)self view];
  if (MRULayoutShouldBeVertical()) {
    uint64_t v8 = 6;
  }
  else {
    uint64_t v8 = 7;
  }

  if ([(MRUMediaControlsModuleViewController *)self gridSizeClass] == 9
    || [(MRUMediaControlsModuleViewController *)self gridSizeClass] == 10)
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __83__MRUMediaControlsModuleViewController_dismissPresentedContentAnimated_completion___block_invoke;
    v9[3] = &unk_1E5F0E428;
    void v9[4] = self;
    id v10 = v6;
    [(MRUMediaControlsModuleViewController *)self transitionToLayout:v8 completion:v9];
  }
  else if (v4)
  {
    [(MRUMediaControlsModuleViewController *)self transitionToLayout:v8 completion:v6];
  }
  else
  {
    [(MRUMediaControlsModuleViewController *)self setLayout:v8];
  }
}

uint64_t __83__MRUMediaControlsModuleViewController_dismissPresentedContentAnimated_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissWithCompletion:*(void *)(a1 + 40)];
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5 = a4;
  id v6 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v7 = [v6 layout];

  if ((unint64_t)(v7 - 1) > 1)
  {
    BOOL v17 = 0;
  }
  else
  {
    uint64_t v8 = [(MRUMediaControlsModuleViewController *)self view];
    int v9 = [v8 collectionView];
    [v5 locationInView:v9];
    double v11 = v10;
    double v13 = v12;

    __int16 v14 = [(MRUMediaControlsModuleViewController *)self view];
    id v15 = [v14 collectionView];
    uint64_t v16 = objc_msgSend(v15, "indexPathForItemAtPoint:", v11, v13);
    BOOL v17 = v16 == 0;
  }
  return v17;
}

- (void)createNowPlayingViewController
{
  BOOL v3 = objc_alloc_init(MRUMediaControlsModuleNowPlayingViewController);
  [(MRUMediaControlsModuleNowPlayingViewController *)v3 setDelegate:self];
  BOOL v4 = [(MRUMediaControlsModuleViewController *)self view];
  id v5 = [v4 stylingProvider];
  [(MRUMediaControlsModuleNowPlayingViewController *)v3 setStylingProvider:v5];

  [(MRUMediaControlsModuleNowPlayingViewController *)v3 setPreview:self->_contentRenderingMode == 1];
  [(MRUMediaControlsModuleNowPlayingViewController *)v3 setResizing:self->_resizing];
  id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)v3 artworkView];
  [v6 addObserver:self];

  nowPlayingViewController = self->_nowPlayingViewController;
  self->_nowPlayingViewController = v3;
  uint64_t v8 = v3;

  [(MRUMediaControlsModuleViewController *)self addChildViewController:self->_nowPlayingViewController];
  int v9 = [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController view];
  double v10 = [(MRUMediaControlsModuleViewController *)self view];
  double v11 = [v10 containerView];
  [v11 setNowPlayingView:v9];

  [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController didMoveToParentViewController:self];

  [(MRUMediaControlsModuleViewController *)self updateActiveViewController];
}

- (void)createRoutingViewController
{
  BOOL v3 = objc_alloc_init(MRURoutingViewController);
  routingViewController = self->_routingViewController;
  self->_routingViewController = v3;

  [(MRURoutingViewController *)self->_routingViewController setDelegate:self];
  id v5 = [(MRUMediaControlsModuleViewController *)self view];
  id v6 = [v5 stylingProvider];
  [(MRURoutingViewController *)self->_routingViewController setStylingProvider:v6];

  [(MRUMediaControlsModuleViewController *)self updateRoutingDiscoveryMode];
  [(MRUMediaControlsModuleViewController *)self updateRoutingDataControllers];
  [(MRUMediaControlsModuleViewController *)self addChildViewController:self->_routingViewController];
  uint64_t v7 = [(MRURoutingViewController *)self->_routingViewController view];
  uint64_t v8 = [(MRUMediaControlsModuleViewController *)self view];
  int v9 = [v8 containerView];
  double v10 = [v9 routingView];
  [v10 setContentView:v7];

  [(MRURoutingViewController *)self->_routingViewController didMoveToParentViewController:self];

  [(MRUMediaControlsModuleViewController *)self updateRoutingController];
}

- (void)updateVolumeController
{
  BOOL v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController controller];
  BOOL v4 = [v3 endpointController];
  id v8 = [v4 route];

  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v8 outputDeviceRoute:0];
  id v6 = [(MPVolumeController *)[MRUVolumeController alloc] initWithDataSource:v5];
  uint64_t v7 = [[MRUVolumeGroupCoordinator alloc] initWithMainVolumeController:v6];
  [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController setVolumeController:v6];
  [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController setVolumeGroupCoordinator:v7];
  [(MRURoutingViewController *)self->_routingViewController setVolumeGroupCoordinator:v7];
}

- (void)updateRoutingController
{
  BOOL v3 = NSString;
  BOOL v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 stringWithFormat:@"%@(devices)", v5];

  uint64_t v7 = dispatch_get_global_queue(25, 0);
  objc_initWeak(&location, self);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke;
  block[3] = &unk_1E5F0D870;
  objc_copyWeak(&v11, &location);
  id v10 = v6;
  id v8 = v6;
  dispatch_async(v7, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
}

void __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained manager];
    id v5 = [v4 activeController];
    id v6 = [v5 endpointController];
    uint64_t v7 = [v6 route];

    id v8 = [v3 routingViewController];
    int v9 = objc_alloc_init(MRUOutputDeviceRoutingDataSource);
    [(MRUOutputDeviceRoutingDataSource *)v9 setEndpointRoute:v7];
    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      id v10 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      [(MRUOutputDeviceRoutingDataSource *)v9 setRoutingContextUID:v10];
    }
    [(MRUOutputDeviceRoutingDataSource *)v9 setSupportsMultipleSelection:1];
    [(MPAVRoutingDataSource *)v9 setFilterMode:0];
    [(MRUOutputDeviceRoutingDataSource *)v9 setInitiator:*MEMORY[0x1E4F49EE0]];
    [(MRUOutputDeviceRoutingDataSource *)v9 setDetachesRoutesToGroup:1];
    [(MRUOutputDeviceRoutingDataSource *)v9 setHearingAidDelegate:v8];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke_2;
    block[3] = &unk_1E5F102A0;
    uint64_t v16 = v9;
    id v17 = *(id *)(a1 + 32);
    id v18 = v4;
    id v19 = v8;
    id v20 = v7;
    id v11 = v7;
    id v12 = v8;
    id v13 = v4;
    __int16 v14 = v9;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __63__MRUMediaControlsModuleViewController_updateRoutingController__block_invoke_2(uint64_t a1)
{
  id v2 = (id)[objc_alloc(MEMORY[0x1E4F31850]) initWithDataSource:*(void *)(a1 + 32) name:*(void *)(a1 + 40)];
  [v2 setPlaybackDataSource:*(void *)(a1 + 48)];
  [*(id *)(a1 + 56) setRoutingController:v2];
  [*(id *)(a1 + 56) setEndpointRoute:*(void *)(a1 + 64)];
}

- (void)updateLayout
{
  BOOL v3 = self->_contentRenderingMode == 1;
  BOOL v4 = [(MRUMediaControlsModuleViewController *)self view];
  [v4 setShowPreviewView:v3];

  int64_t expandedLayout = self->_expandedLayout;
  if (expandedLayout == 2 || expandedLayout == 1)
  {
    -[MRUMediaControlsModuleViewController transitionToLayout:completion:](self, "transitionToLayout:completion:");
    [(MRUMediaControlsModuleViewController *)self setExpandedLayout:0x7FFFFFFFFFFFFFFFLL];
    return;
  }
  if (expandedLayout == 0x7FFFFFFFFFFFFFFFLL && self->_isExpanded)
  {
    id v14 = [(MRUMediaControlsModuleViewController *)self view];
    if (MRULayoutShouldBeVertical()) {
      uint64_t v8 = 6;
    }
    else {
      uint64_t v8 = 7;
    }
    [(MRUMediaControlsModuleViewController *)self setLayout:v8];

    return;
  }
  if (self->_isExpanded)
  {
    [(MRUMediaControlsModuleViewController *)self setLayout:"setLayout:"];
    [(MRUMediaControlsModuleViewController *)self setExpandedLayout:0x7FFFFFFFFFFFFFFFLL];
    return;
  }
  int v9 = [(MRUMediaControlsModuleViewController *)self view];
  if ([v9 layout] == 6)
  {
    int64_t v10 = self->_expandedLayout;

    if (v10 == 8) {
      goto LABEL_26;
    }
  }
  else
  {
  }
  if (self->_isExpanded) {
    goto LABEL_28;
  }
  id v11 = [(MRUMediaControlsModuleViewController *)self view];
  if ([v11 layout] != 7)
  {

    goto LABEL_28;
  }
  int64_t v12 = self->_expandedLayout;

  if (v12 != 9)
  {
LABEL_28:
    uint64_t v13 = MRUMediaControlsModuleLayoutForGridSizeClass(self->_gridSizeClass);
    goto LABEL_29;
  }
LABEL_26:
  uint64_t v13 = self->_expandedLayout;
LABEL_29:

  [(MRUMediaControlsModuleViewController *)self setLayout:v13];
}

uint64_t __52__MRUMediaControlsModuleViewController_updateLayout__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateNowPlayingControllers];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateActiveViewController];
}

uint64_t __52__MRUMediaControlsModuleViewController_updateLayout__block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateNowPlayingControllers];
  id v2 = *(void **)(a1 + 32);

  return [v2 updateActiveViewController];
}

- (void)updateCornerRadius
{
  BOOL v3 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v4 = [v3 layout];

  switch(v4)
  {
    case 0:
    case 3:
    case 4:
    case 5:
      double compactContinuousCornerRadius = self->_compactContinuousCornerRadius;
      id v6 = [(MRUMediaControlsModuleViewController *)self view];
      [v6 setCornerRadius:compactContinuousCornerRadius];

      double v7 = self->_compactContinuousCornerRadius;
      goto LABEL_16;
    case 1:
    case 2:
      uint64_t v8 = [(MRUMediaControlsModuleViewController *)self view];
      [v8 setCornerRadius:25.0];

      int v9 = [(MRUMediaControlsModuleViewController *)self routingViewController];
      double v10 = 0.0;
      double v11 = 25.0;
      id v23 = v9;
      goto LABEL_20;
    case 6:
    case 8:
      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        double v13 = v12;
      }
      else
      {
        double v13 = self->_compactContinuousCornerRadius;
      }
      uint64_t v16 = [(MRUMediaControlsModuleViewController *)self view];
      [v16 setCornerRadius:v13];

      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        double v7 = v17;
      }
      else
      {
        double v7 = self->_compactContinuousCornerRadius;
      }
LABEL_16:
      int v9 = [(MRUMediaControlsModuleViewController *)self routingViewController];
      double v10 = 0.0;
      id v23 = v9;
      double v11 = v7;
      goto LABEL_20;
    case 7:
    case 9:
      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        double v15 = v14;
      }
      else
      {
        double v15 = self->_compactContinuousCornerRadius;
      }
      id v18 = [(MRUMediaControlsModuleViewController *)self view];
      [v18 setCornerRadius:v15];

      if (self->_isExpanded)
      {
        CCUIExpandedModuleContinuousCornerRadius();
        double v20 = v19;
        if (self->_isExpanded)
        {
          CCUIExpandedModuleContinuousCornerRadius();
          double v22 = v21;
          goto LABEL_19;
        }
      }
      else
      {
        double v20 = self->_compactContinuousCornerRadius;
      }
      double v22 = self->_compactContinuousCornerRadius;
LABEL_19:
      int v9 = [(MRUMediaControlsModuleViewController *)self routingViewController];
      id v23 = v9;
      double v10 = v20;
      double v11 = v22;
LABEL_20:
      objc_msgSend(v9, "setScrollIndicatorInsets:", v10, 0.0, v11, 0.0);

      return;
    default:
      return;
  }
}

- (void)updateRoutingContentEdgeInsets
{
  BOOL v3 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v4 = [v3 layout];

  id v5 = [(MRUMediaControlsModuleViewController *)self routingViewController];
  id v8 = v5;
  double v6 = 0.0;
  if (v4 == 9) {
    double v6 = 13.0;
  }
  double v7 = 12.0;
  if (v4 == 9) {
    double v7 = 13.0;
  }
  objc_msgSend(v5, "setContentEdgeInsets:", v6, 24.0, v7, 24.0);
}

- (void)updateRoutingDiscoveryMode
{
  BOOL v3 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v4 = [v3 layout];

  BOOL v5 = [(MRUMediaControlsModuleViewController *)self shouldRefreshUI];
  uint64_t v6 = 3;
  if (!v5) {
    uint64_t v6 = 0;
  }
  if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 8) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = v5;
  }
  routingViewController = self->_routingViewController;

  [(MRURoutingViewController *)routingViewController setDiscoveryMode:v7];
}

- (void)updateNowPlayingControllers
{
  BOOL v3 = [(MRUNowPlayingControllerManager *)self->_manager controllers];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke;
  v11[3] = &unk_1E5F102C8;
  v11[4] = self;
  uint64_t v4 = objc_msgSend(v3, "msv_map:", v11);

  BOOL v5 = [(MRUMediaControlsModuleViewController *)self view];
  if ([v5 layout] == 1)
  {
    BOOL v6 = 1;
  }
  else
  {
    uint64_t v7 = [(MRUMediaControlsModuleViewController *)self view];
    BOOL v6 = [v7 layout] == 2;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4FB1360]);
  [v8 appendSectionsWithIdentifiers:&unk_1F069F320];
  [v8 appendItemsWithIdentifiers:v4];
  dataSource = self->_dataSource;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke_2;
  v10[3] = &unk_1E5F0D7F8;
  v10[4] = self;
  [(UICollectionViewDiffableDataSource *)dataSource applySnapshot:v8 animatingDifferences:v6 completion:v10];
  [(MRUMediaControlsModuleViewController *)self updateMoreButton];
  [(MRUMediaControlsModuleViewController *)self updateRoutingDataControllers];
}

id __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = a2;
  [v3 addObserver:v2];
  uint64_t v4 = [v3 identifier];

  return v4;
}

void __67__MRUMediaControlsModuleViewController_updateNowPlayingControllers__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) view];
  [v1 updateCollectionViewContentInset];
}

- (void)setActiveController:(id)a3
{
  id v7 = a3;
  uint64_t v4 = [(MRUMediaControlsModuleViewController *)self activeIdentifier];
  BOOL v5 = [v7 identifier];
  char v6 = [v4 isEqualToString:v5];

  if ((v6 & 1) == 0)
  {
    [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController setController:v7];
    [(MRUMediaControlsModuleViewController *)self updateRoutingController];
    [(MRUMediaControlsModuleViewController *)self updateVolumeController];
  }
}

- (void)updateActiveViewController
{
  id v3 = [(MRUNowPlayingControllerManager *)self->_manager activeController];
  [(MRUMediaControlsModuleViewController *)self setActiveController:v3];
}

- (void)updateRoutingDataControllers
{
  id v3 = [(MRUNowPlayingControllerManager *)self->_manager controllers];
  [(MRURoutingViewController *)self->_routingViewController setNowPlayingControllers:v3];
}

- (void)updateMoreButton
{
  id v3 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v4 = [v3 moreButton];

  BOOL v5 = [(MRUMediaControlsModuleViewController *)self showMoreButton];
  char v6 = [(MRUNowPlayingControllerManager *)self->_manager controllers];
  uint64_t v7 = [v6 count];

  [v4 setCount:v7];
  id v8 = [(MRUMediaControlsModuleViewController *)self view];
  unint64_t v9 = [v8 layout];

  if (v9 <= 9 && ((1 << v9) & 0x284) != 0)
  {
    uint64_t v10 = +[MRUStringsProvider controlOtherSpeakers];
  }
  else
  {
    uint64_t v10 = +[MRUStringsProvider controlOtherSpeakersMultipleLines];
  }
  double v11 = (void *)v10;
  [v4 setTitle:v10];

  if ([(MRUMediaControlsModuleViewController *)self shouldRefreshUI])
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __56__MRUMediaControlsModuleViewController_updateMoreButton__block_invoke;
    v13[3] = &unk_1E5F0D8C0;
    void v13[4] = self;
    BOOL v14 = v5;
    objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:", 0, v13);
  }
  else
  {
    double v12 = [(MRUMediaControlsModuleViewController *)self view];
    [v12 setShowMoreButton:v5];
  }
}

void __56__MRUMediaControlsModuleViewController_updateMoreButton__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setShowMoreButton:v1];
}

- (BOOL)showMoreButton
{
  id v3 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v4 = [v3 layout];

  if ((unint64_t)(v4 - 6) > 3) {
    return 0;
  }
  BOOL v5 = [(MRUNowPlayingControllerManager *)self->_manager controllers];
  if ((unint64_t)[v5 count] < 2)
  {
    BOOL ShouldBeVertical = 0;
  }
  else if (MRUIsSmallScreen())
  {
    char v6 = [(MRUMediaControlsModuleViewController *)self view];
    BOOL ShouldBeVertical = MRULayoutShouldBeVertical();
  }
  else
  {
    BOOL ShouldBeVertical = 1;
  }

  return ShouldBeVertical;
}

- (BOOL)shouldRefreshUI
{
  return self->_onScreen && self->_contentRenderingMode != 1;
}

- (void)updateDiscoveryMode
{
  id v3 = [(MRUMediaControlsModuleViewController *)self view];
  unint64_t v4 = [v3 layout];

  if (v4 > 9 || ((1 << v4) & 0x3C6) == 0)
  {
    if ([(MRUMediaControlsModuleViewController *)self shouldRefreshUI])
    {
      id v8 = [(MRUMediaControlsModuleNowPlayingViewController *)self->_nowPlayingViewController controller];
      unint64_t v9 = [v8 endpointController];
      int64_t v6 = [v9 isDeviceSystemRoute] ^ 1;
    }
    else
    {
      int64_t v6 = 0;
    }
  }
  else if ([(MRUMediaControlsModuleViewController *)self shouldRefreshUI])
  {
    int64_t v6 = 3;
  }
  else
  {
    int64_t v6 = 0;
  }
  self->_discoveryMode = v6;
  manager = self->_manager;

  [(MRUNowPlayingControllerManager *)manager updateDiscoveryMode];
}

- (void)updateCellForIdentifier:(id)a3
{
  dataSource = self->_dataSource;
  id v5 = a3;
  id v9 = [(UICollectionViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v5];
  int64_t v6 = [(MRUMediaControlsModuleViewController *)self view];
  uint64_t v7 = [v6 collectionView];
  id v8 = [v7 cellForItemAtIndexPath:v9];

  [(MRUMediaControlsModuleViewController *)self updateCell:v8 forIdentifier:v5];
}

- (void)updateCell:(id)a3 forIdentifier:(id)a4
{
  manager = self->_manager;
  id v6 = a3;
  id v36 = [(MRUNowPlayingControllerManager *)manager controllerForIdentifier:a4];
  uint64_t v7 = [v36 endpointController];
  v35 = [v7 route];

  id v8 = [v36 metadataController];
  v34 = [v8 artwork];

  id v9 = [v36 metadataController];
  uint64_t v10 = [v9 nowPlayingInfo];

  double v11 = [v36 quickControlItem];
  double v12 = (void *)MEMORY[0x1E4FB1818];
  double v13 = [v36 deviceSymbolName];
  BOOL v14 = [v12 _systemImageNamed:v13];

  double v15 = [v6 cellContentView];
  uint64_t v16 = [v15 artworkView];

  double v17 = [v6 cellContentView];
  id v18 = [v17 headerView];

  double v19 = [v6 cellContentView];
  double v20 = [v19 headerView];
  double v21 = [v20 labelView];

  [v16 setArtwork:v34];
  [v16 setPlaceholderImage:v14];
  [v21 setRoute:v35];
  [v21 setDeviceImage:v14];
  double v22 = [v10 stringForComponents:59];
  [v21 setTitle:v22];

  id v23 = [v10 placeholder];
  [v21 setPlaceholder:v23];

  objc_msgSend(v21, "setShowPlaceholder:", objc_msgSend(v10, "showPlaceholder"));
  v24 = [v36 identifier];
  objc_super v25 = [v18 transportButton];
  [v25 setIdentifier:v24];

  objc_msgSend(v18, "setShowTransportButton:", objc_msgSend(v11, "isEnabled"));
  v26 = [v18 transportButton];
  v27 = [v11 asset];
  [v26 setAsset:v27];

  v28 = [v18 transportButton];
  [v28 addTarget:self action:sel_didSelectQuickControl_ forControlEvents:64];

  v29 = [(MRUMediaControlsModuleViewController *)self contentMetrics];
  [v6 setContentMetrics:v29];

  v30 = [(MRUMediaControlsModuleViewController *)self view];
  v31 = [v30 stylingProvider];
  v32 = [v6 cellContentView];
  [v32 setStylingProvider:v31];

  [v6 setContentEdgeInsets:MRUMediaModuleContentInsetsForLayout(1)];
  CCUINumberOfRowsForGridSizeClass();
  MEMORY[0x1B3E725A0]();
  CCUILayoutGutter();
  CCUICompactModuleContinuousCornerRadiusForGridSizeClass();
  objc_msgSend(v6, "setCornerRadius:");
}

- (void)updateVisibilityForActiveCell:(BOOL)a3 inActiveCells:(BOOL)a4
{
  BOOL v29 = a4;
  BOOL v27 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  dataSource = self->_dataSource;
  id v6 = [(MRUMediaControlsModuleViewController *)self activeIdentifier];
  uint64_t v7 = [(UICollectionViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v6];

  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = [(MRUMediaControlsModuleViewController *)self view];
  id v9 = [v8 collectionView];
  uint64_t v10 = [v9 visibleCells];

  id obj = v10;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v33;
    BOOL v14 = (_OWORD *)MEMORY[0x1E4F1DAB8];
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v33 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        double v17 = [(MRUMediaControlsModuleViewController *)self view];
        id v18 = [v17 collectionView];
        double v19 = [v18 indexPathForCell:v16];

        if ([v19 isEqual:v7])
        {
          long long v20 = v14[1];
          *(_OWORD *)&v31.a = *v14;
          *(_OWORD *)&v31.c = v20;
          *(_OWORD *)&v31.tx = v14[2];
          double v21 = &v31;
          double v22 = v16;
          BOOL v23 = v27;
        }
        else
        {
          uint64_t v24 = [v19 item];
          uint64_t v25 = [v7 item];
          memset(&v31, 0, sizeof(v31));
          if (v29)
          {
            long long v26 = v14[1];
            *(_OWORD *)&v31.a = *v14;
            *(_OWORD *)&v31.c = v26;
            *(_OWORD *)&v31.tx = v14[2];
          }
          else
          {
            CGAffineTransformMakeTranslation(&v31, 0.0, (double)(200 * (v24 - v25)));
          }
          CGAffineTransform v30 = v31;
          double v21 = &v30;
          double v22 = v16;
          BOOL v23 = v29;
        }
        [v22 setTransitionTransform:v21 isVisible:v23];
      }
      uint64_t v12 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v12);
  }
}

- (void)transitionToLayout:(int64_t)a3 completion:(id)a4
{
  id v6 = (void (**)(void))a4;
  uint64_t v7 = [(MRUMediaControlsModuleViewController *)self view];
  if ([v7 layout] == 6)
  {

    if ((unint64_t)(a3 - 1) <= 1) {
      goto LABEL_12;
    }
  }
  else
  {
    id v8 = [(MRUMediaControlsModuleViewController *)self view];
    if ([v8 layout] == 7)
    {

      if ((unint64_t)(a3 - 1) < 2) {
        goto LABEL_12;
      }
    }
    else
    {
      id v9 = [(MRUMediaControlsModuleViewController *)self view];
      if ([v9 layout] == 8)
      {

        if ((unint64_t)(a3 - 1) < 2)
        {
LABEL_12:
          uint64_t v12 = [(MRUMediaControlsModuleViewController *)self view];
          [v12 setTransitioning:1];

          uint64_t v13 = [(MRUMediaControlsModuleViewController *)self view];
          BOOL v14 = [v13 collectionViewLayout];
          [v14 invalidateLayout];

          dataSource = self->_dataSource;
          uint64_t v16 = [(MRUMediaControlsModuleViewController *)self activeIdentifier];
          double v17 = [(UICollectionViewDiffableDataSource *)dataSource indexPathForItemIdentifier:v16];

          id v18 = [(MRUMediaControlsModuleViewController *)self view];
          double v19 = [v18 collectionView];
          [v19 scrollToItemAtIndexPath:v17 atScrollPosition:2 animated:0];

          long long v20 = [(MRUMediaControlsModuleViewController *)self view];
          double v21 = [v20 collectionView];
          [v21 layoutIfNeeded];

          double v22 = [(MRUMediaControlsModuleViewController *)self view];
          BOOL v23 = [v22 collectionView];
          uint64_t v24 = [v23 cellForItemAtIndexPath:v17];

          uint64_t v25 = [(MRUMediaControlsModuleViewController *)self view];
          long long v26 = [v25 collectionView];
          [v24 frame];
          double v28 = v27;
          double v30 = v29;
          double v32 = v31;
          double v34 = v33;
          long long v35 = [(MRUMediaControlsModuleViewController *)self view];
          objc_msgSend(v26, "convertRect:toView:", v35, v28, v30, v32, v34);
          double v37 = v36;
          double v39 = v38;
          double v41 = v40;
          double v43 = v42;
          v44 = [(MRUMediaControlsModuleViewController *)self view];
          objc_msgSend(v44, "setTransitionFrame:", v37, v39, v41, v43);

          [(MRUMediaControlsModuleViewController *)self updateVisibilityForActiveCell:0 inActiveCells:0];
          v45 = (void *)MEMORY[0x1E4FB1EB0];
          v82[0] = MEMORY[0x1E4F143A8];
          v82[1] = 3221225472;
          v82[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke;
          v82[3] = &unk_1E5F0DDD8;
          id v83 = v24;
          int64_t v84 = a3;
          v82[4] = self;
          v80[0] = MEMORY[0x1E4F143A8];
          v80[1] = 3221225472;
          v80[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_2;
          v80[3] = &unk_1E5F0E5C0;
          v80[4] = self;
          v81 = v6;
          id v46 = v24;
          objc_msgSend(v45, "mru_animateUsingType:animations:completion:", 0, v82, v80);

LABEL_19:
          goto LABEL_23;
        }
      }
      else
      {
        uint64_t v10 = [(MRUMediaControlsModuleViewController *)self view];
        uint64_t v11 = [v10 layout];

        if ((unint64_t)(a3 - 1) <= 1 && v11 == 9) {
          goto LABEL_12;
        }
      }
    }
  }
  v47 = [(MRUMediaControlsModuleViewController *)self view];
  if ([v47 layout] != 1)
  {
    v48 = [(MRUMediaControlsModuleViewController *)self view];
    if ([v48 layout] != 2)
    {

      goto LABEL_21;
    }

    if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 6) {
      goto LABEL_21;
    }
LABEL_18:
    v49 = [(MRUMediaControlsModuleViewController *)self view];
    [v49 setTransitioning:1];

    v50 = self->_dataSource;
    v51 = [(MRUMediaControlsModuleViewController *)self activeIdentifier];
    double v17 = [(UICollectionViewDiffableDataSource *)v50 indexPathForItemIdentifier:v51];

    v52 = [(MRUMediaControlsModuleViewController *)self view];
    v53 = [v52 collectionView];
    v54 = [v53 cellForItemAtIndexPath:v17];

    v55 = [(MRUMediaControlsModuleViewController *)self view];
    v56 = [v55 collectionView];
    [v54 frame];
    double v58 = v57;
    double v60 = v59;
    double v62 = v61;
    double v64 = v63;
    v65 = [(MRUMediaControlsModuleViewController *)self view];
    objc_msgSend(v56, "convertRect:toView:", v65, v58, v60, v62, v64);
    double v67 = v66;
    double v69 = v68;
    double v71 = v70;
    double v73 = v72;
    v74 = [(MRUMediaControlsModuleViewController *)self view];
    objc_msgSend(v74, "setTransitionFrame:", v67, v69, v71, v73);

    v75 = [(MRUMediaControlsModuleViewController *)self view];
    [v75 layoutIfNeeded];

    [(MRUMediaControlsModuleViewController *)self updateVisibilityForActiveCell:0 inActiveCells:1];
    v76 = (void *)MEMORY[0x1E4FB1EB0];
    v79[0] = MEMORY[0x1E4F143A8];
    v79[1] = 3221225472;
    v79[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_3;
    v79[3] = &unk_1E5F0DBF8;
    v79[4] = self;
    v79[5] = a3;
    v77[0] = MEMORY[0x1E4F143A8];
    v77[1] = 3221225472;
    v77[2] = __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_4;
    v77[3] = &unk_1E5F0E5C0;
    v77[4] = self;
    v78 = v6;
    objc_msgSend(v76, "mru_animateUsingType:animations:completion:", 0, v79, v77);

    goto LABEL_19;
  }

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 6) {
    goto LABEL_18;
  }
LABEL_21:
  [(MRUMediaControlsModuleViewController *)self setLayout:a3];
  if (v6) {
    v6[2](v6);
  }
LABEL_23:
}

void __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setLayout:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) updateVisibilityForActiveCell:0 inActiveCells:1];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];

  id v22 = [*(id *)(a1 + 32) view];
  id v3 = [v22 collectionView];
  [*(id *)(a1 + 40) frame];
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  uint64_t v12 = [*(id *)(a1 + 32) view];
  objc_msgSend(v3, "convertRect:toView:", v12, v5, v7, v9, v11);
  double v14 = v13;
  double v16 = v15;
  double v18 = v17;
  double v20 = v19;
  double v21 = [*(id *)(a1 + 32) view];
  objc_msgSend(v21, "setTransitionFrame:", v14, v16, v18, v20);
}

uint64_t __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateVisibilityForActiveCell:1 inActiveCells:1];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setTransitioning:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

void __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_3(uint64_t a1)
{
  [*(id *)(a1 + 32) setLayout:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) updateVisibilityForActiveCell:0 inActiveCells:0];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t __70__MRUMediaControlsModuleViewController_transitionToLayout_completion___block_invoke_4(uint64_t a1)
{
  [*(id *)(a1 + 32) updateVisibilityForActiveCell:1 inActiveCells:1];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setTransitioning:0];

  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    double v4 = *(uint64_t (**)(void))(result + 16);
    return v4();
  }
  return result;
}

- (void)dismissWithCompletion:(id)a3
{
  dismissalBlock = (void (**)(id, id))self->_dismissalBlock;
  if (dismissalBlock) {
    dismissalBlock[2](dismissalBlock, a3);
  }
}

- (int64_t)discoveryMode
{
  return self->_discoveryMode;
}

- (void)setDiscoveryMode:(int64_t)a3
{
  self->_discoveryMode = a3;
}

- (CCUIModuleContentMetrics)contentMetrics
{
  return self->_contentMetrics;
}

- (id)homeGestureDismissalAllowedBlock
{
  return self->_homeGestureDismissalAllowedBlock;
}

- (void)setHomeGestureDismissalAllowedBlock:(id)a3
{
}

- (MRUNowPlayingControllerManager)manager
{
  return self->_manager;
}

- (id)routingCornerViewTappedBlock
{
  return self->_routingCornerViewTappedBlock;
}

- (void)setRoutingCornerViewTappedBlock:(id)a3
{
}

- (id)dismissalBlock
{
  return self->_dismissalBlock;
}

- (void)setDismissalBlock:(id)a3
{
}

- (int64_t)gridSizeClass
{
  return self->_gridSizeClass;
}

- (double)compactContinuousCornerRadius
{
  return self->_compactContinuousCornerRadius;
}

- (unint64_t)contentRenderingMode
{
  return self->_contentRenderingMode;
}

- (BOOL)isResizing
{
  return self->_resizing;
}

- (UICollectionViewDiffableDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
}

- (MRUMediaControlsModuleNowPlayingViewController)nowPlayingViewController
{
  return self->_nowPlayingViewController;
}

- (void)setNowPlayingViewController:(id)a3
{
}

- (MRURoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (void)setRoutingViewController:(id)a3
{
}

- (UIViewController)alertViewController
{
  return self->_alertViewController;
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isExpanded
{
  return self->_isExpanded;
}

- (void)setIsExpanded:(BOOL)a3
{
  self->_isExpanded = a3;
}

- (int64_t)expandedLayout
{
  return self->_expandedLayout;
}

- (void)setExpandedLayout:(int64_t)a3
{
  self->_int64_t expandedLayout = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertViewController, 0);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong(&self->_dismissalBlock, 0);
  objc_storeStrong(&self->_routingCornerViewTappedBlock, 0);
  objc_storeStrong((id *)&self->_manager, 0);
  objc_storeStrong(&self->_homeGestureDismissalAllowedBlock, 0);

  objc_storeStrong((id *)&self->_contentMetrics, 0);
}

@end