@interface MRUMediaControlsModuleNowPlayingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOnScreen;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)preview;
- (BOOL)resizing;
- (BOOL)shouldExpandModuleOnTouch:(id)a3;
- (BOOL)shouldRefreshUI;
- (BOOL)showRouteLabel;
- (BSInvalidatable)hardwareVolumeControlAssertion;
- (MRUArtworkView)artworkView;
- (MRUHapticViewController)hapticViewController;
- (MRUMediaControlsModuleNowPlayingViewController)init;
- (MRUMediaControlsModuleNowPlayingViewControllerDelegate)delegate;
- (MRUMediaSuggestionsViewController)suggestionsViewController;
- (MRUNowPlayingController)controller;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeController)volumeController;
- (MRUVolumeGroupCoordinator)volumeGroupCoordinator;
- (MRUWaveformController)waveformController;
- (MRUWaveformViewController)waveformViewController;
- (NSString)description;
- (UIEdgeInsets)contentEdgeInsets;
- (id)_stateDumpObject;
- (int64_t)layout;
- (unint64_t)stateHandle;
- (void)createHapticViewController;
- (void)createSuggestionsViewController;
- (void)createWaveformViewController;
- (void)dealloc;
- (void)didSelectQuickControl:(id)a3;
- (void)launchNowPlayingApp;
- (void)loadView;
- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeBundleID:(id)a5;
- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5;
- (void)registerHapticObserver;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setController:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setHapticViewController:(id)a3;
- (void)setHardwareVolumeControlAssertion:(id)a3;
- (void)setLayout:(int64_t)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPreview:(BOOL)a3;
- (void)setResizing:(BOOL)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestionsViewController:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setVolumeGroupCoordinator:(id)a3;
- (void)setWaveformController:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)toggleRoutePicker;
- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4;
- (void)updateArtwork;
- (void)updateEverything;
- (void)updateLayout;
- (void)updateNowPlayingInfo;
- (void)updateQuickControl;
- (void)updateRoute;
- (void)updateRoutingButton;
- (void)updateRoutingButtonAnimated:(BOOL)a3;
- (void)updateSuggestions;
- (void)updateTimeControls;
- (void)updateTransportControls;
- (void)updateVisibility;
- (void)updateVolumeControls;
- (void)updateWaveformVisibility;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation MRUMediaControlsModuleNowPlayingViewController

- (MRUMediaControlsModuleNowPlayingViewController)init
{
  v7.receiver = self;
  v7.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  v2 = [(MRUMediaControlsModuleNowPlayingViewController *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke;
    v5[3] = &unk_1E5F0DEA0;
    v6 = v2;
    v6->_stateHandle = __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke((uint64_t)v5);
  }
  return v3;
}

uint64_t __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), *(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke_2;
  v5[3] = &unk_1E5F0DE78;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __54__MRUMediaControlsModuleNowPlayingViewController_init__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      v4 = [WeakRetained _stateDumpObject];
    }
    else
    {
      v4 = 0;
    }
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(MRUMediaControlsModuleNowPlayingView);
  [(MRUMediaControlsModuleNowPlayingViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  v34.receiver = self;
  v34.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  [(MRUMediaControlsModuleNowPlayingViewController *)&v34 viewDidLoad];
  int64_t layout = self->_layout;
  v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  [v4 setLayout:layout];

  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  v9 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  objc_msgSend(v9, "setContentEdgeInsets:", top, left, bottom, right);

  stylingProvider = self->_stylingProvider;
  v11 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  [v11 setStylingProvider:stylingProvider];

  v12 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v13 = [v12 artworkView];
  [v13 addTarget:self action:sel_didSelectArtworkView_ forControlEvents:64];

  v14 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v15 = [v14 artworkView];
  [v15 addObserver:self];

  v16 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v17 = [v16 headerView];
  v18 = [v17 labelView];
  [v18 addTarget:self action:sel_didSelectLabelView_ forControlEvents:64];

  v19 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v20 = [v19 volumeControlsView];
  [v20 setDelegate:self];

  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  v21 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v22 = [v21 routingButtons];

  uint64_t v23 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v31 != v25) {
          objc_enumerationMutation(v22);
        }
        [*(id *)(*((void *)&v30 + 1) + 8 * i) addTarget:self action:sel_didSelectRouteButton_ forControlEvents:64];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v24);
  }

  v27 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v28 = [v27 transportControlsView];
  [v28 setDelegate:self];

  v29 = +[MRUCallMonitor sharedMonitor];
  [v29 addObserver:self];

  [(MRUMediaControlsModuleNowPlayingViewController *)self createWaveformViewController];
  [(MRUMediaControlsModuleNowPlayingViewController *)self createHapticViewController];
  [(MRUMediaControlsModuleNowPlayingViewController *)self registerHapticObserver];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  [(MRUMediaControlsModuleNowPlayingViewController *)&v4 viewWillAppear:a3];
  [(MRUMediaControlsModuleNowPlayingViewController *)self setOnScreen:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  [(MRUMediaControlsModuleNowPlayingViewController *)&v4 viewWillDisappear:a3];
  [(MRUMediaControlsModuleNowPlayingViewController *)self setOnScreen:0];
}

- (void)dealloc
{
  os_state_remove_handler();
  [(MRUNowPlayingController *)self->_controller updateAutomaticResponseLoading];
  v3.receiver = self;
  v3.super_class = (Class)MRUMediaControlsModuleNowPlayingViewController;
  [(MRUMediaControlsModuleNowPlayingViewController *)&v3 dealloc];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  v5 = [(MRUMediaControlsModuleNowPlayingViewController *)self controller];
  id v6 = [v5 endpointController];
  objc_super v7 = [v6 route];
  v8 = [v3 stringWithFormat:@"<%@: %p route: %@", v4, self, v7];

  return (NSString *)v8;
}

- (MRUArtworkView)artworkView
{
  v2 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  objc_super v3 = [v2 artworkView];

  return (MRUArtworkView *)v3;
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateEverything];
  }
}

- (void)updateEverything
{
  if ([(MRUMediaControlsModuleNowPlayingViewController *)self shouldRefreshUI])
  {
    objc_super v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self controller];
    [v3 updateAutomaticResponseLoading];

    uint64_t v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self controller];
    v5 = [v4 mediaSuggestionsController];
    [v5 refreshMediaSuggestions];

    [(MRUMediaControlsModuleNowPlayingViewController *)self updateRoute];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateRoutingButton];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateArtwork];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateNowPlayingInfo];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateTimeControls];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateTransportControls];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateQuickControl];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateSuggestions];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateVisibility];
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateWaveformVisibility];
  }
  if (!self->_preview)
  {
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateVolumeControls];
  }
}

- (void)setController:(id)a3
{
  uint64_t v4 = (MRUNowPlayingController *)a3;
  [(MRUNowPlayingController *)self->_controller removeObserver:self];
  controller = self->_controller;
  self->_controller = v4;
  id v6 = v4;

  [(MRUNowPlayingController *)self->_controller addObserver:self];
  [(MRUWaveformController *)self->_waveformController setNowPlayingController:v6];
  [(MRUHapticViewController *)self->_hapticViewController setNowPlayingController:v6];
  objc_super v7 = [(MRUNowPlayingController *)self->_controller tvRemoteController];

  [v7 setContext:1];

  [(MRUMediaControlsModuleNowPlayingViewController *)self updateEverything];
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
  id v5 = a3;
  id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  objc_super v7 = [v6 volumeControlsView];
  [v7 setVolumeController:v5];

  [(MRUMediaControlsModuleNowPlayingViewController *)self updateVolumeControls];
}

- (void)setVolumeGroupCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, a3);
  id v5 = a3;
  id v7 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v6 = [v7 volumeControlsView];
  [v6 setVolumeGroupCoordinator:v5];
}

- (void)setLayout:(int64_t)a3
{
  if (self->_layout != a3)
  {
    self->_int64_t layout = a3;
    id v5 = [(MRUMediaControlsModuleNowPlayingViewController *)self viewIfLoaded];
    [v5 setLayout:a3];

    id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self suggestionsViewController];
    [v6 setLayout:0];

    [(MRUMediaControlsModuleNowPlayingViewController *)self updateEverything];
  }
}

- (void)setContentEdgeInsets:(UIEdgeInsets)a3
{
  double right = a3.right;
  double bottom = a3.bottom;
  double left = a3.left;
  double top = a3.top;
  double v7 = self->_contentEdgeInsets.top;
  if (self->_contentEdgeInsets.left != a3.left
    || v7 != top
    || self->_contentEdgeInsets.right != a3.right
    || self->_contentEdgeInsets.bottom != a3.bottom)
  {
    self->_contentEdgeInsets.double top = top;
    self->_contentEdgeInsets.double left = a3.left;
    self->_contentEdgeInsets.double bottom = a3.bottom;
    self->_contentEdgeInsets.double right = a3.right;
    v12 = [(MRUMediaControlsModuleNowPlayingViewController *)self viewIfLoaded];
    objc_msgSend(v12, "setContentEdgeInsets:", top, left, bottom, right);

    id v13 = [(MRUMediaControlsModuleNowPlayingViewController *)self suggestionsViewController];
    objc_msgSend(v13, "setContentEdgeInsets:", top, left, bottom, right);
  }
}

- (void)setPreview:(BOOL)a3
{
  if (self->_preview != a3)
  {
    self->_preview = a3;
    [(MRUMediaControlsModuleNowPlayingViewController *)self updateEverything];
  }
}

- (void)setResizing:(BOOL)a3
{
  if (self->_resizing != a3)
  {
    BOOL v3 = a3;
    self->_resizing = a3;
    id v5 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
    [v5 setResizing:v3];

    [(MRUMediaControlsModuleNowPlayingViewController *)self updateSuggestions];
  }
}

- (void)setStylingProvider:(id)a3
{
  p_stylingProvider = &self->_stylingProvider;
  v8 = (MRUVisualStylingProvider *)a3;
  if (*p_stylingProvider != v8)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)*p_stylingProvider setTraitChangeObservable:self];
    id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self viewIfLoaded];
    [v6 setStylingProvider:v8];

    double v7 = [(MRUMediaControlsModuleNowPlayingViewController *)self suggestionsViewController];
    [v7 setStylingProvider:v8];
  }
}

- (BOOL)shouldExpandModuleOnTouch:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v6 = [v5 transportControlsView];

  [v6 frame];
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  v15 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  [v4 locationInView:v15];
  v33.x = v16;
  v33.y = v17;
  v34.origin.x = v8;
  v34.origin.y = v10;
  v34.size.width = v12;
  v34.size.height = v14;
  int v18 = !CGRectContainsPoint(v34, v33);

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v19 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  v20 = [v19 routingButtons];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v28 != v23) {
          objc_enumerationMutation(v20);
        }
        uint64_t v25 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v4 locationInView:v25];
        if (v18) {
          int v18 = objc_msgSend(v25, "pointInside:withEvent:", 0) ^ 1;
        }
        else {
          LOBYTE(v18) = 0;
        }
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v22);
  }

  return v18;
}

- (void)didSelectQuickControl:(id)a3
{
  BOOL v3 = [(MRUNowPlayingController *)self->_controller quickControlItem];
  uint64_t v5 = [v3 mainAction];

  id v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    id v4 = (void *)v5;
  }
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen && !self->_preview;
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeBundleID:(id)a5
{
  [(MRUMediaControlsModuleNowPlayingViewController *)self updateRoute];

  [(MRUMediaControlsModuleNowPlayingViewController *)self updateRoutingButton];
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  [(MRUMediaControlsModuleNowPlayingViewController *)self updateNowPlayingInfo];
  [(MRUMediaControlsModuleNowPlayingViewController *)self updateVolumeControls];
  [(MRUMediaControlsModuleNowPlayingViewController *)self updateRoutingButtonAnimated:1];

  [(MRUMediaControlsModuleNowPlayingViewController *)self updateLayout];
}

- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(a4, "showTVRemote", a3);
  id v8 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  double v7 = [v8 transportControlsView];
  [v7 setShowTVRemoteButton:v6];
}

- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5
{
  id v7 = a5;
  controller = self->_controller;
  id v9 = a4;
  CGFloat v10 = [(MRUNowPlayingController *)controller mediaSuggestionsController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __112__MRUMediaControlsModuleNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke;
  v12[3] = &unk_1E5F0DEC8;
  id v13 = v7;
  id v11 = v7;
  [v10 playSuggestion:v9 completion:v12];
}

uint64_t __112__MRUMediaControlsModuleNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __96__MRUMediaControlsModuleNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke;
  v6[3] = &unk_1E5F0D7F8;
  v6[4] = self;
  [WeakRetained nowPlayingViewController:self cordinateDismissal:v6];
}

void __96__MRUMediaControlsModuleNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controller];
  v1 = [v2 tvRemoteController];
  [v1 presentTVRemoteUsingApp:0];
}

- (void)registerHapticObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleHapticEnabledStatusChangedNotification_ name:*MEMORY[0x1E4F311F8] object:0];
}

- (void)createWaveformViewController
{
  id v3 = objc_alloc_init(MRUWaveformController);
  waveformController = self->_waveformController;
  self->_waveformController = v3;

  uint64_t v5 = [[MRUWaveformViewController alloc] initWithContext:1 waveformController:self->_waveformController];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  [(MRUWaveformController *)self->_waveformController setNowPlayingController:self->_controller];
  [(MRUMediaControlsModuleNowPlayingViewController *)self addChildViewController:self->_waveformViewController];
  id v7 = [(MRUWaveformViewController *)self->_waveformViewController view];
  id v8 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v9 = [v8 headerView];
  [v9 setWaveformView:v7];

  CGFloat v10 = self->_waveformViewController;

  [(MRUWaveformViewController *)v10 didMoveToParentViewController:self];
}

- (void)createHapticViewController
{
  id v3 = [[MRUHapticViewController alloc] initWithContext:1 nowPlayingController:self->_controller];
  hapticViewController = self->_hapticViewController;
  self->_hapticViewController = v3;

  [(MRUMediaControlsModuleNowPlayingViewController *)self addChildViewController:self->_hapticViewController];
  uint64_t v5 = [(MRUHapticViewController *)self->_hapticViewController view];
  uint64_t v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v7 = [v6 headerView];
  [v7 setHapticView:v5];

  waveformViewController = self->_waveformViewController;

  [(MRUWaveformViewController *)waveformViewController didMoveToParentViewController:self];
}

- (void)createSuggestionsViewController
{
  id v3 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
  id v9 = [v3 mediaSuggestions];

  id v4 = [[MRUMediaSuggestionsViewController alloc] initWithMediaSuggestions:v9];
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v4;

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setDelegate:self];
  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setLayout:0];
  uint64_t v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self stylingProvider];
  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setStylingProvider:v6];

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setSupportsHorizontalLayout:1];
  -[MRUMediaSuggestionsViewController setContentEdgeInsets:](self->_suggestionsViewController, "setContentEdgeInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right);
  [(MRUMediaControlsModuleNowPlayingViewController *)self addChildViewController:self->_suggestionsViewController];
  id v7 = [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController view];
  id v8 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  [v8 setSuggestionsView:v7];

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController didMoveToParentViewController:self];
}

- (BOOL)shouldRefreshUI
{
  return self->_onScreen && !self->_preview;
}

- (void)updateArtwork
{
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v6 = [v3 artwork];

  id v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  uint64_t v5 = [v4 artworkView];

  [v5 setArtwork:v6];
}

- (void)updateRoute
{
  id v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v14 = [v3 artworkView];

  id v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  uint64_t v5 = [v4 headerView];
  id v6 = [v5 labelView];

  id v7 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v8 = [v7 route];

  id v9 = (void *)MEMORY[0x1E4FB1818];
  CGFloat v10 = [(MRUNowPlayingController *)self->_controller deviceSymbolName];
  id v11 = [v9 _systemImageNamed:v10];

  BOOL v12 = [(MRUMediaControlsModuleNowPlayingViewController *)self showRouteLabel];
  [v14 setPlaceholderImage:v11];
  [v6 setRoute:v8];
  [v6 setDeviceImage:v11];
  if ((unint64_t)(self->_layout - 1) >= 2)
  {
    [v6 setShowDevice:0];
  }
  else
  {
    id v13 = [v14 artworkImage];
    [v6 setShowDevice:v13 != 0];
  }
  if (v12 != [v6 showRoute]) {
    [v6 setShowRoute:v12];
  }
}

- (void)updateNowPlayingInfo
{
  id v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v4 = [v3 headerView];
  id v13 = [v4 labelView];

  uint64_t v5 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v6 = [v5 nowPlayingInfo];

  int v7 = [(MRUMediaControlsModuleNowPlayingViewController *)self showRouteLabel];
  uint64_t v8 = [v6 showPlaceholder];
  id v9 = [v6 placeholder];
  [v13 setPlaceholder:v9];

  if (v7) {
    uint64_t v10 = 59;
  }
  else {
    uint64_t v10 = 1;
  }
  id v11 = [v6 stringForComponents:v10];
  [v13 setTitle:v11];

  BOOL v12 = [v6 stringForComponents:58];
  [v13 setSubtitle:v12];

  if (v8 != [v13 showPlaceholder]
    || v7 == [v13 showSubtitle])
  {
    [v13 setShowPlaceholder:v8];
    [v13 setShowSubtitle:v7 ^ 1u];
  }
}

- (BOOL)showRouteLabel
{
  unint64_t layout = self->_layout;
  if (layout > 4) {
    return 0;
  }
  if (((1 << layout) & 0x19) == 0) {
    return 1;
  }
  id v4 = [(MRUNowPlayingController *)self->_controller endpointController];
  if ([v4 isDeviceSystemRoute])
  {
    uint64_t v5 = [(MRUNowPlayingController *)self->_controller endpointController];
    char v6 = [v5 isAirPlaying];
  }
  else
  {
    char v6 = 1;
  }

  return v6;
}

- (void)updateTimeControls
{
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v6 = [v3 timeControls];

  id v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  uint64_t v5 = [v4 timeControlsView];

  [v5 setTimeControls:v6];
}

- (void)updateTransportControls
{
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v7 = [v3 transportControls];

  id v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  uint64_t v5 = [v4 transportControlsView];

  [v5 setTransportControls:v7];
  id v6 = [(MRUNowPlayingController *)self->_controller tvRemoteController];
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));
}

- (void)updateQuickControl
{
  id v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v7 = [v3 headerView];

  id v4 = [(MRUNowPlayingController *)self->_controller quickControlItem];
  objc_msgSend(v7, "setShowTransportButton:", objc_msgSend(v4, "isEnabled"));
  uint64_t v5 = [v7 transportButton];
  id v6 = [v4 asset];
  [v5 setAsset:v6];
}

- (void)updateVolumeControls
{
  *(void *)&v27[7] = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v4 = [v3 volumeControlsView];

  uint64_t v5 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v6 = [v5 route];

  id v7 = [(MPVolumeController *)self->_volumeController dataSource];
  BOOL v8 = (unint64_t)(self->_layout - 5) <= 4
    && [(MRUMediaControlsModuleNowPlayingViewController *)self shouldRefreshUI];
  id v9 = +[MRUCallMonitor sharedMonitor];
  int v10 = [v9 isOnCall];

  [v4 setOnScreen:v8];
  char v11 = [v7 volumeControlCapabilities];
  if (v8 && (v10 & 1) == 0)
  {
    char v12 = v11;
    if (([v6 isDeviceRoute] & 1) == 0 && (v12 & 3) != 0)
    {
      id v13 = MCLogCategoryVolume();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        int v20 = 138544386;
        uint64_t v21 = objc_opt_class();
        __int16 v22 = 1024;
        int v23 = 1;
        __int16 v24 = 1024;
        int v25 = 0;
        __int16 v26 = 1024;
        *(_DWORD *)long long v27 = 1;
        v27[2] = 2114;
        *(void *)&v27[3] = v6;
        _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | call: %{BOOL}u | control: %{BOOL}u | route: %{public}@", (uint8_t *)&v20, 0x28u);
      }

      id v14 = +[MRUHardwareVolumeController sharedInstance];
      v15 = (objc_class *)objc_opt_class();
      CGFloat v16 = NSStringFromClass(v15);
      CGFloat v17 = [v14 requestControlsForVolumeDataSource:v7 reason:v16];
      hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
      self->_hardwareVolumeControlAssertion = v17;

LABEL_15:
      goto LABEL_16;
    }
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    v19 = MCLogCategoryVolume();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138544130;
      uint64_t v21 = objc_opt_class();
      __int16 v22 = 1024;
      int v23 = v8;
      __int16 v24 = 1024;
      int v25 = v10;
      __int16 v26 = 2114;
      *(void *)long long v27 = v6;
      _os_log_impl(&dword_1AE7DF000, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | call: %{BOOL}u | route: %{public}@", (uint8_t *)&v20, 0x22u);
    }

    id v14 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_15;
  }
LABEL_16:
}

- (void)updateRoutingButton
{
}

- (void)updateRoutingButtonAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v6 = [v5 transportControlsView];

  id v7 = [(MRUNowPlayingController *)self->_controller endpointController];
  BOOL v8 = [v7 route];

  uint64_t v9 = [v8 canModifyGroupMembership];
  int v10 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  BOOL v11 = [v10 layout] == 8;

  char v12 = (void *)MEMORY[0x1E4FB1818];
  id v13 = [(MRUNowPlayingController *)self->_controller outputDevicesSymbolName];
  uint64_t v14 = [v12 _systemImageNamed:v13];

  long long v27 = (void *)v14;
  v15 = +[MRUAsset image:v14];
  [v6 setShowRoutingButton:v11];
  CGFloat v16 = [v6 routingButton];
  [v16 setEnabled:v9];

  CGFloat v17 = [v6 routingButton];
  [v17 setSelected:1];

  int v18 = [v6 routingButton];
  objc_msgSend(v18, "setAsset:animated:", v15, -[MRUMediaControlsModuleNowPlayingViewController shouldRefreshUI](self, "shouldRefreshUI") & v3);

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v19 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  int v20 = [v19 routingButtons];

  uint64_t v21 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        int v25 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        [v25 setRoute:v8];
        [v25 setEnabled:v9];
      }
      uint64_t v22 = [v20 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v22);
  }

  __int16 v26 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  [v26 setNeedsLayout];
}

- (void)updateLayout
{
  if ([(MRUMediaControlsModuleNowPlayingViewController *)self isViewLoaded])
  {
    id v5 = [(MRUNowPlayingController *)self->_controller endpointController];
    BOOL v3 = [v5 route];
    if ([v3 canModifyGroupMembership])
    {
    }
    else
    {
      int64_t layout = self->_layout;

      if (layout == 8)
      {
        [(MRUMediaControlsModuleNowPlayingViewController *)self setLayout:6];
      }
    }
  }
}

- (void)updateWaveformVisibility
{
  BOOL v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v11 = [v3 headerView];

  BOOL v4 = [(MRUWaveformController *)self->_waveformController routeSupportsWaveform];
  unsigned int v5 = (self->_layout < 9uLL) & (0x160u >> self->_layout);
  id v6 = [MEMORY[0x1E4F31208] sharedManager];
  if ([v6 musicHapticsEnabled])
  {
    id v7 = [(MRUNowPlayingController *)self->_controller metadataController];
    int v8 = [v7 appSupportsHaptics];
  }
  else
  {
    int v8 = 0;
  }

  if (v4 & v5)
  {
    [(MRUWaveformViewController *)self->_waveformViewController setOnScreen:[(MRUMediaControlsModuleNowPlayingViewController *)self shouldRefreshUI] & (v8 ^ 1)];
    uint64_t v9 = [(MRUMediaControlsModuleNowPlayingViewController *)self shouldRefreshUI] & v8;
  }
  else
  {
    [(MRUWaveformViewController *)self->_waveformViewController setOnScreen:0];
    uint64_t v9 = 0;
  }
  [(MRUHapticViewController *)self->_hapticViewController setOnScreen:v9];
  if (v4)
  {
    [v11 setShowWaveform:v5 & (v8 ^ 1)];
    uint64_t v10 = v5 & v8;
  }
  else
  {
    [v11 setShowWaveform:0];
    uint64_t v10 = 0;
  }
  [v11 setShowHaptic:v10];
}

- (void)updateVisibility
{
  BOOL v3 = [(MRUMediaControlsModuleNowPlayingViewController *)self shouldRefreshUI];
  BOOL v4 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  [v4 setOnScreen:v3];

  BOOL v5 = (unint64_t)(self->_layout - 5) < 3;
  id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v7 = [v6 artworkView];
  [v7 setEnabled:v5];

  BOOL v8 = self->_layout == 6;
  uint64_t v9 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  uint64_t v10 = [v9 headerView];
  id v11 = [v10 labelView];
  [v11 setEnabled:v8];

  BOOL v12 = (unint64_t)(self->_layout - 1) < 2;
  id v14 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  id v13 = [v14 artworkView];
  [v13 setShowPlaceholder:v12];
}

- (void)updateSuggestions
{
  if ((self->_layout & 0xFFFFFFFFFFFFFFFELL) == 6)
  {
    BOOL v3 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
    BOOL v4 = [v3 mediaSuggestions];
    int v5 = v4 && !self->_resizing && !self->_preview;
  }
  else
  {
    int v5 = 0;
  }
  objc_initWeak(&location, self);
  id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  int v7 = [v6 showSuggestionsView];

  if (v5 == v7)
  {
    if (v5)
    {
      uint64_t v9 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
      uint64_t v10 = [v9 mediaSuggestions];
      [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setMediaSuggestions:v10];
    }
  }
  else
  {
    BOOL v8 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke;
    v14[3] = &unk_1E5F0DEF0;
    objc_copyWeak(&v15, &location);
    char v16 = v5;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke_2;
    v11[3] = &unk_1E5F0DF18;
    objc_copyWeak(&v12, &location);
    char v13 = v5;
    [v8 animateWithDuration:v14 animations:v11 completion:0.25];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&v15);
  }
  objc_destroyWeak(&location);
}

void __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (*(unsigned char *)(a1 + 40))
  {
    [WeakRetained createSuggestionsViewController];
    id WeakRetained = v7;
  }
  BOOL v3 = [WeakRetained suggestionsViewController];
  [v3 beginAppearanceTransition:*(unsigned __int8 *)(a1 + 40) animated:0];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  int v5 = [v7 view];
  [v5 setShowSuggestionsView:v4];

  id v6 = [v7 suggestionsViewController];
  [v6 endAppearanceTransition];
}

void __67__MRUMediaControlsModuleNowPlayingViewController_updateSuggestions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!*(unsigned char *)(a1 + 40))
  {
    id v6 = WeakRetained;
    BOOL v3 = [WeakRetained suggestionsViewController];
    [v3 willMoveToParentViewController:0];

    uint64_t v4 = [v6 view];
    [v4 setSuggestionsView:0];

    int v5 = [v6 suggestionsViewController];
    [v5 removeFromParentViewController];

    [v6 setSuggestionsViewController:0];
    id WeakRetained = v6;
  }
}

- (void)toggleRoutePicker
{
  switch(self->_layout)
  {
    case 6:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v8 = WeakRetained;
      uint64_t v4 = self;
      uint64_t v5 = 8;
      goto LABEL_10;
    case 7:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v8 = WeakRetained;
      uint64_t v4 = self;
      uint64_t v5 = 9;
      goto LABEL_10;
    case 8:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v8 = WeakRetained;
      uint64_t v4 = self;
      uint64_t v5 = 6;
      goto LABEL_10;
    case 9:
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v8 = WeakRetained;
      uint64_t v4 = self;
      uint64_t v5 = 7;
LABEL_10:
      [WeakRetained nowPlayingViewController:v4 applyLayout:v5];
      break;
    default:
      id v8 = objc_loadWeakRetained((id *)&self->_delegate);
      id v6 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
      if (MRULayoutShouldBeVertical()) {
        uint64_t v7 = 8;
      }
      else {
        uint64_t v7 = 7;
      }
      [v8 nowPlayingViewController:self applyLayout:v7];

      break;
  }
}

- (void)launchNowPlayingApp
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__MRUMediaControlsModuleNowPlayingViewController_launchNowPlayingApp__block_invoke;
  v4[3] = &unk_1E5F0D7F8;
  v4[4] = self;
  [WeakRetained nowPlayingViewController:self cordinateDismissal:v4];
}

void __69__MRUMediaControlsModuleNowPlayingViewController_launchNowPlayingApp__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) controller];
  v1 = [v2 endpointController];
  [v1 launchNowPlayingApp];
}

- (id)_stateDumpObject
{
  v17[4] = *MEMORY[0x1E4F143B8];
  v16[0] = @"hardwareVolumeControlAssertion";
  uint64_t v3 = [(BSInvalidatable *)self->_hardwareVolumeControlAssertion description];
  uint64_t v4 = (void *)v3;
  if (v3) {
    uint64_t v5 = (__CFString *)v3;
  }
  else {
    uint64_t v5 = @"<NONE>";
  }
  v17[0] = v5;
  v16[1] = @"endpointController";
  uint64_t v6 = [(MRUNowPlayingController *)self->_controller endpointController];
  uint64_t v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"<NONE>";
  }
  controller = self->_controller;
  if (!controller) {
    controller = (MRUNowPlayingController *)@"<NONE>";
  }
  v17[1] = v8;
  v17[2] = controller;
  v16[2] = @"dataController";
  v16[3] = @"window";
  uint64_t v10 = [(MRUMediaControlsModuleNowPlayingViewController *)self view];
  uint64_t v11 = [v10 window];
  id v12 = (void *)v11;
  if (v11) {
    char v13 = (__CFString *)v11;
  }
  else {
    char v13 = @"<NONE>";
  }
  v17[3] = v13;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:4];

  return v14;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (MRUVolumeController)volumeController
{
  return self->_volumeController;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (MRUMediaControlsModuleNowPlayingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUMediaControlsModuleNowPlayingViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (int64_t)layout
{
  return self->_layout;
}

- (UIEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)preview
{
  return self->_preview;
}

- (BOOL)resizing
{
  return self->_resizing;
}

- (MRUMediaSuggestionsViewController)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (void)setSuggestionsViewController:(id)a3
{
}

- (MRUWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
}

- (MRUWaveformController)waveformController
{
  return self->_waveformController;
}

- (void)setWaveformController:(id)a3
{
}

- (MRUHapticViewController)hapticViewController
{
  return self->_hapticViewController;
}

- (void)setHapticViewController:(id)a3
{
}

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_hapticViewController, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end