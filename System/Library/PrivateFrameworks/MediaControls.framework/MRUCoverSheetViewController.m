@interface MRUCoverSheetViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (CGSize)preferredContentSize;
- (MRUCoordinatedUpdateController)coordinatedUpdateController;
- (MRUCoverSheetViewControllerDelegate)delegate;
- (MRUNowPlayingViewController)nowPlayingViewController;
- (MRUVisualStylingProvider)stylingProvider;
- (MediaControlsInteractionRecognizer)interactionRecognizer;
- (NSArray)requiredVisualStyleCategories;
- (id)_childViewControllersForAlwaysOnTimelines;
- (id)preferredContentSizeBlock;
- (int64_t)layout;
- (void)coordinatedUpdateController:(id)a3 processCoordinatedUpdates:(id)a4 completion:(id)a5;
- (void)didReceiveInteraction:(id)a3;
- (void)loadView;
- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5;
- (void)setCoordinatedUpdateController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setInteractionRecognizer:(id)a3;
- (void)setNowPlayingViewController:(id)a3;
- (void)setPreferredContentSizeBlock:(id)a3;
- (void)setStylingProvider:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)updatePreferredContentSize;
- (void)updateRestrictedRects;
- (void)updateVisualStyling;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation MRUCoverSheetViewController

- (void)loadView
{
  v3 = objc_alloc_init(MRUCoverSheetView);
  [(MRUCoverSheetViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v16.receiver = self;
  v16.super_class = (Class)MRUCoverSheetViewController;
  [(MRUCoverSheetViewController *)&v16 viewDidLoad];
  v3 = [[MediaControlsInteractionRecognizer alloc] initWithTarget:self action:sel_didReceiveInteraction_];
  interactionRecognizer = self->_interactionRecognizer;
  self->_interactionRecognizer = v3;

  [(MediaControlsInteractionRecognizer *)self->_interactionRecognizer setCancelsTouchesInView:0];
  [(MediaControlsInteractionRecognizer *)self->_interactionRecognizer setDelegate:self];
  v5 = [(MRUCoverSheetViewController *)self view];
  [v5 addGestureRecognizer:self->_interactionRecognizer];

  v6 = [(MRUCoverSheetViewController *)self nowPlayingViewController];
  [v6 setDelegate:self];

  v7 = [(MRUCoverSheetViewController *)self nowPlayingViewController];
  [(MRUCoverSheetViewController *)self addChildViewController:v7];

  v8 = [(MRUCoverSheetViewController *)self nowPlayingViewController];
  v9 = [v8 view];
  v10 = [(MRUCoverSheetViewController *)self view];
  [v10 setContentView:v9];

  v11 = [(MRUCoverSheetViewController *)self nowPlayingViewController];
  [v11 didMoveToParentViewController:self];

  v12 = objc_alloc_init(MRUCoordinatedUpdateController);
  coordinatedUpdateController = self->_coordinatedUpdateController;
  self->_coordinatedUpdateController = v12;

  [(MRUCoordinatedUpdateController *)self->_coordinatedUpdateController setCadence:0.25];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  [(MRUCoordinatedUpdateController *)self->_coordinatedUpdateController setContext:v15];

  [(MRUCoordinatedUpdateController *)self->_coordinatedUpdateController setDelegate:self];
  [(MRUCoverSheetViewController *)self updatePreferredContentSize];
  [(MRUCoverSheetViewController *)self updateRestrictedRects];
  [(MRUCoverSheetViewController *)self updateVisualStyling];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRUCoverSheetViewController;
  [(MRUCoverSheetViewController *)&v3 viewDidLayoutSubviews];
  [(MRUCoverSheetViewController *)self updateRestrictedRects];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MRUCoverSheetViewController;
  [(MRUCoverSheetViewController *)&v11 traitCollectionDidChange:v4];
  uint64_t v5 = [v4 userInterfaceStyle];
  v6 = [(MRUCoverSheetViewController *)self traitCollection];
  uint64_t v7 = [v6 userInterfaceStyle];

  if (v5 != v7) {
    [(MRUCoverSheetViewController *)self updateVisualStyling];
  }
  v8 = [v4 preferredContentSizeCategory];
  v9 = [(MRUCoverSheetViewController *)self traitCollection];
  v10 = [v9 preferredContentSizeCategory];

  if (v8 != v10) {
    [(MRUCoverSheetViewController *)self updatePreferredContentSize];
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int64_t)layout
{
  return [(MRUNowPlayingViewController *)self->_nowPlayingViewController isShowingMediaSuggestions];
}

- (MRUNowPlayingViewController)nowPlayingViewController
{
  nowPlayingViewController = self->_nowPlayingViewController;
  if (!nowPlayingViewController)
  {
    id v4 = +[MRUEndpointController proactiveEndpointController];
    uint64_t v5 = [[MRUNowPlayingController alloc] initWithEndpointController:v4];
    v6 = [[MRUNowPlayingViewController alloc] initWithController:v5 routeControlsPresentation:1];
    uint64_t v7 = self->_nowPlayingViewController;
    self->_nowPlayingViewController = v6;

    [(MRUNowPlayingViewController *)self->_nowPlayingViewController setContext:2];
    [(MRUNowPlayingViewController *)self->_nowPlayingViewController setLayout:4];

    nowPlayingViewController = self->_nowPlayingViewController;
  }

  return nowPlayingViewController;
}

- (void)didReceiveInteraction:(id)a3
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector()) {
    [WeakRetained coverSheetViewController:self didReceiveInteractionEvent:v5];
  }
}

- (void)nowPlayingViewController:(id)a3 didChangeSizeWithAnimations:(id)a4 completion:(id)a5
{
  id v14 = a3;
  id v8 = a4;
  id v9 = a5;
  int64_t v10 = [(MRUCoverSheetViewController *)self layout];
  if ([v14 isShowingMediaSuggestions]
    && ![v14 shouldShowMediaSuggestions])
  {
    int64_t v10 = 0;
  }
  else if ([v14 shouldShowMediaSuggestions] {
         && ![v14 isShowingMediaSuggestions])
  }
  {
    int64_t v10 = 1;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    if (v9) {
      v12 = v9;
    }
    else {
      v12 = &__block_literal_global_30;
    }
    v13 = _Block_copy(v12);
    [WeakRetained coverSheetViewController:self willChangeToLayout:v10 animations:v8 completion:v13];
  }
  else
  {
    [(MRUCoordinatedUpdateController *)self->_coordinatedUpdateController addUpdate:v8 completion:v9];
  }
}

- (void)coordinatedUpdateController:(id)a3 processCoordinatedUpdates:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = (void *)MEMORY[0x1E4FB1EB0];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke;
  v14[3] = &unk_1E5F0DFB8;
  v14[4] = self;
  id v15 = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke_2;
  v12[3] = &unk_1E5F0E5C0;
  v12[4] = self;
  id v13 = v8;
  id v10 = v8;
  id v11 = v7;
  objc_msgSend(v9, "mru_animateUsingType:animations:completion:", 0, v14, v12);
}

void __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  [*(id *)(a1 + 32) updatePreferredContentSize];
  id v2 = [*(id *)(a1 + 32) view];
  [v2 layoutIfNeeded];
}

uint64_t __96__MRUCoverSheetViewController_coordinatedUpdateController_processCoordinatedUpdates_completion___block_invoke_2(uint64_t a1)
{
  [*(id *)(a1 + 32) updateRestrictedRects];
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F069F2D8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v5 = a3;
  v6 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v5];

  [(MRUCoverSheetViewController *)self setStylingProvider:v6];

  [(MRUCoverSheetViewController *)self updateVisualStyling];
}

- (id)_childViewControllersForAlwaysOnTimelines
{
  v4[1] = *MEMORY[0x1E4F143B8];
  if (self->_nowPlayingViewController)
  {
    v4[0] = self->_nowPlayingViewController;
    id v2 = [MEMORY[0x1E4F1C978] arrayWithObjects:v4 count:1];
  }
  else
  {
    id v2 = 0;
  }

  return v2;
}

- (CGSize)preferredContentSize
{
  objc_super v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double Width = CGRectGetWidth(v13);

  id v5 = [(MRUCoverSheetViewController *)self view];
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  double v7 = v6;
  double v9 = v8;

  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)updatePreferredContentSize
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(MRUCoverSheetViewController *)self preferredContentSize];
  double v4 = v3;
  double v6 = v5;
  double v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    v22.width = v4;
    v22.height = v6;
    double v9 = NSStringFromCGSize(v22);
    double v10 = [(MRUCoverSheetViewController *)self view];
    [v10 frame];
    v23.width = v11;
    v23.height = v12;
    CGRect v13 = NSStringFromCGSize(v23);
    int v15 = 138543874;
    uint64_t v16 = v8;
    __int16 v17 = 2114;
    v18 = v9;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ preferred content size: %{public}@ | current: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  id v14 = [(MRUCoverSheetViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v14, "coverSheetViewController:didUpdatePreferredContentSize:", self, v4, v6);
  }
}

- (void)updateRestrictedRects
{
  id v4 = [(MRUCoverSheetViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    double v3 = [(MRUNowPlayingViewController *)self->_nowPlayingViewController restrictedRects];
    [v4 coverSheetViewController:self didUpdateRestrictedRects:v3];
  }
}

- (void)updateVisualStyling
{
  if (+[MRUFeatureFlagProvider isAutobahnEnabled])
  {
    double v3 = (void *)MEMORY[0x1E4F743E8];
    id v4 = [(MRUCoverSheetViewController *)self traitCollection];
    objc_msgSend(v3, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 1, 1, objc_msgSend(v4, "userInterfaceStyle"));
    id v7 = (id)objc_claimAutoreleasedReturnValue();

    double v5 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v7];
    double v6 = [(MRUCoverSheetViewController *)self nowPlayingViewController];
    [v6 setStylingProvider:v5];
  }
  else
  {
    id v7 = [(MRUCoverSheetViewController *)self stylingProvider];
    -[MRUNowPlayingViewController setStylingProvider:](self->_nowPlayingViewController, "setStylingProvider:");
  }
}

- (void)setNowPlayingViewController:(id)a3
{
}

- (MRUCoverSheetViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUCoverSheetViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (id)preferredContentSizeBlock
{
  return self->_preferredContentSizeBlock;
}

- (void)setPreferredContentSizeBlock:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (void)setStylingProvider:(id)a3
{
}

- (MRUCoordinatedUpdateController)coordinatedUpdateController
{
  return self->_coordinatedUpdateController;
}

- (void)setCoordinatedUpdateController:(id)a3
{
}

- (MediaControlsInteractionRecognizer)interactionRecognizer
{
  return self->_interactionRecognizer;
}

- (void)setInteractionRecognizer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interactionRecognizer, 0);
  objc_storeStrong((id *)&self->_coordinatedUpdateController, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_storeStrong(&self->_preferredContentSizeBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_nowPlayingViewController, 0);
}

@end