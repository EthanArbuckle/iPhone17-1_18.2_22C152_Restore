@interface CSMediaControlsViewController
+ (Class)viewClass;
- (BOOL)handleEvent:(id)a3;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (CGRect)_suggestedFrameForMediaControls;
- (CSMediaControlsViewController)init;
- (NSArray)requiredVisualStyleCategories;
- (double)_preferredMediaRemoteHeight;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (int64_t)presentationPriority;
- (int64_t)presentationType;
- (void)_layoutMediaControls;
- (void)_updatePersistentUpdatesEnabled:(BOOL)a3;
- (void)_updatePreferredContentSize;
- (void)coverSheetViewController:(id)a3 didReceiveInteractionEvent:(id)a4;
- (void)coverSheetViewController:(id)a3 willChangeToLayout:(int64_t)a4 animations:(id)a5 completion:(id)a6;
- (void)setContainerSize:(CGSize)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation CSMediaControlsViewController

- (CSMediaControlsViewController)init
{
  v6.receiver = self;
  v6.super_class = (Class)CSMediaControlsViewController;
  v2 = [(CSMediaControlsViewController *)&v6 init];
  if (v2)
  {
    v3 = (MRUCoverSheetViewController *)objc_alloc_init(MEMORY[0x1E4F74878]);
    mediaRemoteViewController = v2->_mediaRemoteViewController;
    v2->_mediaRemoteViewController = v3;

    [(MRUCoverSheetViewController *)v2->_mediaRemoteViewController setDelegate:v2];
    v2->_mediaRemoteLayout = [(MRUCoverSheetViewController *)v2->_mediaRemoteViewController layout];
  }
  return v2;
}

+ (Class)viewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3 = [(MRUCoverSheetViewController *)self->_mediaRemoteViewController view];
  mediaRemoteViewController = self->_mediaRemoteViewController;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__CSMediaControlsViewController_viewDidLoad__block_invoke;
  v7[3] = &unk_1E6AD8AF8;
  v7[4] = self;
  id v8 = v3;
  id v5 = v3;
  [(CSMediaControlsViewController *)self bs_addChildViewController:mediaRemoteViewController animated:0 transitionBlock:v7];
  [(CSCoverSheetViewControllerBase *)self registerView:v5 forRole:2];
  v6.receiver = self;
  v6.super_class = (Class)CSMediaControlsViewController;
  [(CSCoverSheetViewControllerBase *)&v6 viewDidLoad];
}

void __44__CSMediaControlsViewController_viewDidLoad__block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v5 = a2;
  [v3 _layoutMediaControls];
  v4 = [*(id *)(a1 + 32) view];
  [v4 addSubview:*(void *)(a1 + 40)];

  v5[2]();
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CSMediaControlsViewController;
  [(CSCoverSheetViewControllerBase *)&v4 viewDidDisappear:a3];
  [(CSMediaControlsViewController *)self bs_endAppearanceTransitionForChildViewController:self->_mediaRemoteViewController toVisible:0];
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)CSMediaControlsViewController;
  [(CSCoverSheetViewControllerBase *)&v3 viewWillLayoutSubviews];
  [(CSMediaControlsViewController *)self _layoutMediaControls];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (int64_t)presentationType
{
  return 1;
}

- (int64_t)presentationPriority
{
  return 5;
}

- (BOOL)handleEvent:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)CSMediaControlsViewController;
  if (![(CSCoverSheetViewControllerBase *)&v10 handleEvent:v4]
    || ([v4 isConsumable] & 1) == 0)
  {
    uint64_t v6 = [v4 type];
    if (v6 == 25)
    {
      v7 = self;
      uint64_t v8 = 0;
    }
    else
    {
      if (v6 != 24)
      {
LABEL_9:
        char v5 = 0;
        goto LABEL_10;
      }
      v7 = self;
      uint64_t v8 = 1;
    }
    [(CSMediaControlsViewController *)v7 _updatePersistentUpdatesEnabled:v8];
    goto LABEL_9;
  }
  char v5 = [v4 isConsumable];
LABEL_10:

  return v5;
}

- (void)coverSheetViewController:(id)a3 didReceiveInteractionEvent:(id)a4
{
  +[CSAction actionWithType:](CSAction, "actionWithType:", 3, a4);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  [(CSCoverSheetViewControllerBase *)self sendAction:v5];
}

- (void)coverSheetViewController:(id)a3 willChangeToLayout:(int64_t)a4 animations:(id)a5 completion:(id)a6
{
  v9 = (void (**)(void))a5;
  objc_super v10 = (void (**)(void))a6;
  if (_os_feature_enabled_impl())
  {
    self->_mediaRemoteLayout = a4;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke;
    v15[3] = &unk_1E6AD8B20;
    v15[4] = self;
    v16 = v9;
    v11 = (void *)MEMORY[0x1D9487300](v15);
    v12 = (void *)MEMORY[0x1E4F42FF0];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke_2;
    v13[3] = &unk_1E6AD8B48;
    v14 = v10;
    [v12 animateWithDuration:v11 animations:v13 completion:0.5];
  }
  else
  {
    v9[2](v9);
    v10[2](v10);
  }
}

uint64_t __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _updatePreferredContentSize];
  [*(id *)(a1 + 32) _layoutMediaControls];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

uint64_t __99__CSMediaControlsViewController_coverSheetViewController_willChangeToLayout_animations_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)setContainerSize:(CGSize)a3
{
  if (self->_containerSize.width != a3.width || self->_containerSize.height != a3.height)
  {
    self->_containerSize = a3;
    [(CSMediaControlsViewController *)self _updatePreferredContentSize];
  }
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  if (objc_opt_respondsToSelector())
  {
    id v5 = [(MRUCoverSheetViewController *)self->_mediaRemoteViewController visualStylingProviderForCategory:a3];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (NSArray)requiredVisualStyleCategories
{
  if (objc_opt_respondsToSelector())
  {
    objc_super v3 = [(MRUCoverSheetViewController *)self->_mediaRemoteViewController requiredVisualStyleCategories];
  }
  else
  {
    objc_super v3 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return (NSArray *)v3;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = a3;
  if (objc_opt_respondsToSelector()) {
    [(MRUCoverSheetViewController *)self->_mediaRemoteViewController setVisualStylingProvider:v6 forCategory:a4];
  }
}

- (double)_preferredMediaRemoteHeight
{
  int64_t mediaRemoteLayout = self->_mediaRemoteLayout;
  objc_super v3 = +[CSLockScreenDomain rootSettings];
  if (_os_feature_enabled_impl() && mediaRemoteLayout) {
    [v3 nowPlayingHeightExpanded];
  }
  else {
    [v3 nowPlayingHeightCompact];
  }
  double v5 = v4;

  return v5;
}

- (void)_layoutMediaControls
{
  id v3 = [(MRUCoverSheetViewController *)self->_mediaRemoteViewController view];
  [(CSMediaControlsViewController *)self _suggestedFrameForMediaControls];
  objc_msgSend(v3, "setFrame:");
}

- (void)_updatePersistentUpdatesEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v6 = self->_mediaRemoteViewController;
  BOOL v5 = [(CSMediaControlsViewController *)self _appearState] == 2 && v3;
  [(CSMediaControlsViewController *)self bs_endAppearanceTransitionForChildViewController:v6 toVisible:v5];
}

- (void)_updatePreferredContentSize
{
  [(CSMediaControlsViewController *)self _preferredMediaRemoteHeight];
  double v4 = v3;
  double width = self->_containerSize.width;

  -[CSMediaControlsViewController setPreferredContentSize:](self, "setPreferredContentSize:", width, v4);
}

- (CGRect)_suggestedFrameForMediaControls
{
  [(CSMediaControlsViewController *)self _preferredMediaRemoteHeight];
  SBFMainScreenScale();

  BSRectRoundForScale();
  result.size.height = v5;
  result.size.double width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void).cxx_destruct
{
}

@end