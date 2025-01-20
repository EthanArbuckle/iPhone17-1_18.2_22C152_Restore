@interface MRUAmbientNowPlayingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isOnScreen;
- (MPMediaControls)mediaControls;
- (MRUAmbientNowPlayingViewController)initWithNowPlayingController:(id)a3;
- (MRUBackdropControllerProtocol)backdropViewController;
- (MRUNowPlayingController)controller;
- (MSVTimer)artworkTransitionDirectionTimer;
- (int64_t)artworkTransitionDirection;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)embedBackdropViewController;
- (void)launchNowPlayingApp;
- (void)loadView;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5;
- (void)presentRoutingControlsFromSourceView:(id)a3;
- (void)removeBackdropViewController;
- (void)setArtworkTransitionDirection:(int64_t)a3;
- (void)setArtworkTransitionDirectionTimer:(id)a3;
- (void)setBackdropViewController:(id)a3;
- (void)setController:(id)a3;
- (void)setMediaControls:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)transportButtonTap:(id)a3;
- (void)updateArtwork;
- (void)updateEverything;
- (void)updateNowPlayingInfo;
- (void)updateRoute;
- (void)updateRoutingButton;
- (void)updateTimeControls;
- (void)updateTransportControls;
- (void)updateVolumeControls;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MRUAmbientNowPlayingViewController

- (MRUAmbientNowPlayingViewController)initWithNowPlayingController:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MRUAmbientNowPlayingViewController;
  v6 = [(MRUAmbientNowPlayingViewController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_controller, a3);
  }

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = objc_alloc_init(MRUAmbientNowPlayingView);
  [(MRUAmbientNowPlayingViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v14.receiver = self;
  v14.super_class = (Class)MRUAmbientNowPlayingViewController;
  [(MRUAmbientNowPlayingViewController *)&v14 viewDidLoad];
  v3 = [(MRUAmbientNowPlayingViewController *)self view];
  [v3 setOverrideUserInterfaceStyle:2];

  [(MRUNowPlayingController *)self->_controller addObserver:self];
  v4 = [(MRUAmbientNowPlayingViewController *)self view];
  id v5 = [v4 artworkView];
  [v5 addObserver:self];

  v6 = [(MRUAmbientNowPlayingViewController *)self view];
  v7 = [v6 routingButton];
  [v7 addTarget:self action:sel_didSelectRoutingButton_ forControlEvents:64];

  v8 = [(MRUAmbientNowPlayingViewController *)self view];
  objc_super v9 = [v8 leftButton];
  [v9 addTarget:self action:sel_transportButtonTap_ forControlEvents:64];

  v10 = [(MRUAmbientNowPlayingViewController *)self view];
  v11 = [v10 rightButton];
  [v11 addTarget:self action:sel_transportButtonTap_ forControlEvents:64];

  v12 = [(MRUAmbientNowPlayingViewController *)self view];
  v13 = [v12 labelView];
  [v13 addTarget:self action:sel_didSelectLabelView_ forControlEvents:64];

  [(MRUAmbientNowPlayingViewController *)self updateEverything];
}

- (void)viewWillAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)MRUAmbientNowPlayingViewController;
  [(MRUAmbientNowPlayingViewController *)&v7 viewWillAppear:a3];
  v4 = [MEMORY[0x1E4F743E8] _visualStylingProviderForRecipe:101 andCategory:1];
  id v5 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v4];
  [(MRUVisualStylingProvider *)v5 setTraitChangeObservable:self];
  v6 = [(MRUAmbientNowPlayingViewController *)self view];
  [v6 setStylingProvider:v5];

  [(MRUAmbientNowPlayingViewController *)self updateEverything];
  [(MRUAmbientNowPlayingViewController *)self setOnScreen:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRUAmbientNowPlayingViewController;
  [(MRUAmbientNowPlayingViewController *)&v4 viewDidDisappear:a3];
  [(MRUAmbientNowPlayingViewController *)self setOnScreen:0];
  [(MRUAmbientNowPlayingViewController *)self removeBackdropViewController];
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    id v5 = [(MRUAmbientNowPlayingViewController *)self view];
    [v5 setOnScreen:v3];

    controller = self->_controller;
    [(MRUNowPlayingController *)controller updateAutomaticResponseLoading];
  }
}

- (void)setBackdropViewController:(id)a3
{
  id v5 = (MRUBackdropControllerProtocol *)a3;
  if (self->_backdropViewController != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_backdropViewController, a3);
    [(MRUAmbientNowPlayingViewController *)self embedBackdropViewController];
    id v5 = v6;
  }
}

- (void)setArtworkTransitionDirection:(int64_t)a3
{
  self->_artworkTransitionDirection = a3;
  [(MSVTimer *)self->_artworkTransitionDirectionTimer invalidate];
  if (self->_artworkTransitionDirection == 1)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __68__MRUAmbientNowPlayingViewController_setArtworkTransitionDirection___block_invoke;
    v6[3] = &unk_1E5F0D7F8;
    v6[4] = self;
    objc_super v4 = [MEMORY[0x1E4F77A30] timerWithInterval:0 repeats:v6 block:3.0];
    artworkTransitionDirectionTimer = self->_artworkTransitionDirectionTimer;
    self->_artworkTransitionDirectionTimer = v4;
  }
}

uint64_t __68__MRUAmbientNowPlayingViewController_setArtworkTransitionDirection___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setArtworkTransitionDirection:0];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v6 = MCLogCategoryDefault();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v7 = MRUFlippingArtworkTransitionDirectionDescription([(MRUAmbientNowPlayingViewController *)self artworkTransitionDirection]);
    int v8 = 138412546;
    objc_super v9 = self;
    __int16 v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, "%@ updateArtwork direction:%@", (uint8_t *)&v8, 0x16u);
  }
  [(MRUAmbientNowPlayingViewController *)self updateArtwork];
  [(MRUAmbientNowPlayingViewController *)self setArtworkTransitionDirection:0];
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  [(MRUAmbientNowPlayingViewController *)self updateRoute];
  [(MRUAmbientNowPlayingViewController *)self updateVolumeControls];

  [(MRUAmbientNowPlayingViewController *)self updateRoutingButton];
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
  id v5 = a4;
  id v6 = [(MRUAmbientNowPlayingViewController *)self backdropViewController];
  [v6 updateImage:v5 animated:1];
}

- (void)transportButtonTap:(id)a3
{
  id v4 = a3;
  id v6 = [(MRUAmbientNowPlayingViewController *)self view];
  id v5 = [v6 leftButton];

  [(MRUAmbientNowPlayingViewController *)self setArtworkTransitionDirection:v5 == v4];
}

- (void)updateVolumeControls
{
  BOOL v3 = [(MRUAmbientNowPlayingViewController *)self view];
  id v4 = [v3 volumeControlsView];

  id v5 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v6 = [v5 route];

  objc_super v7 = [v4 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v8 = [v4 dataSource];
  }
  else
  {
    int v8 = 0;
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __58__MRUAmbientNowPlayingViewController_updateVolumeControls__block_invoke;
  aBlock[3] = &unk_1E5F0FBE8;
  id v9 = v6;
  id v18 = v9;
  __int16 v10 = (void (**)(void))_Block_copy(aBlock);
  v11 = [v4 volumeController];

  if (!v11)
  {
    v15 = [MRUVolumeController alloc];
    objc_super v14 = v10[2](v10);
    v16 = [(MPVolumeController *)v15 initWithDataSource:v14];
    [v4 setVolumeController:v16];

    goto LABEL_8;
  }
  uint64_t v12 = [v8 groupRoute];
  char v13 = [v12 isEqual:v9];

  if ((v13 & 1) == 0)
  {
    objc_super v14 = v10[2](v10);
    [v4 setDataSource:v14];
LABEL_8:
  }
}

id __58__MRUAmbientNowPlayingViewController_updateVolumeControls__block_invoke(uint64_t a1)
{
  v1 = (void *)[objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:*(void *)(a1 + 32) outputDeviceRoute:0];

  return v1;
}

- (void)updateRoute
{
  BOOL v3 = [(MRUAmbientNowPlayingViewController *)self view];
  id v5 = [v3 artworkView];

  id v4 = [(MRUNowPlayingController *)self->_controller deviceSymbolName];
  [v5 setPlaceholderSymbolName:v4];
}

- (void)updateRoutingButton
{
  BOOL v3 = [(MRUAmbientNowPlayingViewController *)self controller];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__MRUAmbientNowPlayingViewController_updateRoutingButton__block_invoke;
  v4[3] = &unk_1E5F0E270;
  v4[4] = self;
  [v3 routingDeviceImage:v4];
}

void __57__MRUAmbientNowPlayingViewController_updateRoutingButton__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  id v4 = [v2 view];
  [v4 setRoutingButtonImage:v3];
}

- (void)updateNowPlayingInfo
{
  id v5 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v3 = [v5 nowPlayingInfo];
  id v4 = [(MRUAmbientNowPlayingViewController *)self view];
  [v4 setNowPlayingInfo:v3];
}

- (void)updateArtwork
{
  id v6 = [(MRUAmbientNowPlayingViewController *)self view];
  id v3 = [v6 artworkView];
  id v4 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v5 = [v4 artwork];
  objc_msgSend(v3, "setArtwork:transitionDirection:", v5, -[MRUAmbientNowPlayingViewController artworkTransitionDirection](self, "artworkTransitionDirection"));
}

- (void)updateTimeControls
{
  id v6 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v3 = [v6 timeControls];
  id v4 = [(MRUAmbientNowPlayingViewController *)self view];
  id v5 = [v4 timeControlsView];
  [v5 setTimeControls:v3];
}

- (void)updateTransportControls
{
  id v5 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v3 = [v5 transportControls];
  id v4 = [(MRUAmbientNowPlayingViewController *)self view];
  [v4 setTransportControls:v3];
}

- (void)updateEverything
{
  [(MRUAmbientNowPlayingViewController *)self updateRoute];
  [(MRUAmbientNowPlayingViewController *)self updateVolumeControls];
  [(MRUAmbientNowPlayingViewController *)self updateRoutingButton];
  [(MRUAmbientNowPlayingViewController *)self updateNowPlayingInfo];
  [(MRUAmbientNowPlayingViewController *)self updateArtwork];
  [(MRUAmbientNowPlayingViewController *)self updateTimeControls];

  [(MRUAmbientNowPlayingViewController *)self updateTransportControls];
}

- (void)presentRoutingControlsFromSourceView:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F31910]);
  if (!+[MRUFeatureFlagProvider isCayenneEnabled])
  {
    id v6 = [MEMORY[0x1E4F28B50] mainBundle];
    objc_super v7 = [v6 bundleIdentifier];
    [v5 setPresentingAppBundleID:v7];
  }
  [v5 setStyle:2];
  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    int v8 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    [v5 setRoutingContextUID:v8];
  }
  objc_initWeak(&location, self);
  id v9 = (MPMediaControls *)[objc_alloc(MEMORY[0x1E4F31908]) initWithConfiguration:v5 shouldObserveRoutingContextUIDChanges:0];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v9;

  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  char v13 = __75__MRUAmbientNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke;
  objc_super v14 = &unk_1E5F0DA00;
  objc_copyWeak(&v15, &location);
  [(MPMediaControls *)self->_mediaControls setDismissHandler:&v11];
  [(MPMediaControls *)self->_mediaControls present];
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __75__MRUAmbientNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMediaControls:0];
}

- (void)embedBackdropViewController
{
  [(MRUAmbientNowPlayingViewController *)self addChildViewController:self->_backdropViewController];
  backdropViewController = self->_backdropViewController;
  id v4 = [(MRUAmbientNowPlayingViewController *)self view];
  id v5 = [v4 artworkView];
  id v6 = [v5 artworkImage];
  [(MRUBackdropControllerProtocol *)backdropViewController updateImage:v6 animated:0];

  [(MRUBackdropControllerProtocol *)self->_backdropViewController beginAppearanceTransition:1 animated:self->_onScreen];
  objc_super v7 = [(MRUBackdropControllerProtocol *)self->_backdropViewController view];
  int v8 = [(MRUAmbientNowPlayingViewController *)self view];
  [v8 setBackgroundView:v7];

  [(MRUBackdropControllerProtocol *)self->_backdropViewController didMoveToParentViewController:self];
  id v9 = self->_backdropViewController;

  [(MRUBackdropControllerProtocol *)v9 endAppearanceTransition];
}

- (void)removeBackdropViewController
{
  [(MRUBackdropControllerProtocol *)self->_backdropViewController willMoveToParentViewController:0];
  [(MRUBackdropControllerProtocol *)self->_backdropViewController beginAppearanceTransition:0 animated:self->_onScreen];
  id v3 = [(MRUAmbientNowPlayingViewController *)self view];
  [v3 setBackgroundView:0];

  [(MRUBackdropControllerProtocol *)self->_backdropViewController removeFromParentViewController];
  backdropViewController = self->_backdropViewController;

  [(MRUBackdropControllerProtocol *)backdropViewController endAppearanceTransition];
}

- (void)launchNowPlayingApp
{
  id v2 = [(MRUNowPlayingController *)self->_controller endpointController];
  [v2 launchNowPlayingApp];
}

- (MRUBackdropControllerProtocol)backdropViewController
{
  return self->_backdropViewController;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (void)setController:(id)a3
{
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (int64_t)artworkTransitionDirection
{
  return self->_artworkTransitionDirection;
}

- (MSVTimer)artworkTransitionDirectionTimer
{
  return self->_artworkTransitionDirectionTimer;
}

- (void)setArtworkTransitionDirectionTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkTransitionDirectionTimer, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_backdropViewController, 0);
}

@end