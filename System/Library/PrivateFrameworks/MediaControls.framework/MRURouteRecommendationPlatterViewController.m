@interface MRURouteRecommendationPlatterViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasPendingTraitCollectionUpdates;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (MRUNowPlayingController)nowPlayingController;
- (MRURouteRecommendationPlatterViewController)init;
- (MRURouteRecommendationPlatterViewController)initWithRouteIdentifier:(id)a3;
- (MRURouteTextFormatter)routeTextFormatter;
- (NSNumber)pendingDimmed;
- (NSString)routeIdentifier;
- (id)_timelinesForDateInterval:(id)a3;
- (id)backlightSceneEnvironment;
- (void)_acceptRecommendation;
- (void)handleActionButtonTap:(id)a3;
- (void)invalidateAllTimelinesForReason:(id)a3;
- (void)loadView;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)schedulePendingTraitCollectionUpdates;
- (void)setDimmed:(BOOL)a3;
- (void)setHasPendingTraitCollectionUpdates:(BOOL)a3;
- (void)setNowPlayingController:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPendingDimmed:(id)a3;
- (void)setRouteIdentifier:(id)a3;
- (void)setRouteTextFormatter:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)updateActionType;
- (void)updateDimmed;
- (void)updateMarqueeAnimation;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation MRURouteRecommendationPlatterViewController

- (MRURouteRecommendationPlatterViewController)init
{
  return [(MRURouteRecommendationPlatterViewController *)self initWithRouteIdentifier:0];
}

- (MRURouteRecommendationPlatterViewController)initWithRouteIdentifier:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)MRURouteRecommendationPlatterViewController;
  v5 = [(MRURouteRecommendationPlatterViewController *)&v15 init];
  if (v5)
  {
    v6 = _MRLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v17 = v4;
      __int16 v18 = 2048;
      v19 = v5;
      _os_log_impl(&dword_1AE7DF000, v6, OS_LOG_TYPE_DEFAULT, ">>+ MRURPVC got %@ (self = %p)", buf, 0x16u);
    }

    if ([v4 length])
    {
      v7 = [[MRUEndpointController alloc] initWithRouteUID:v4 client:0 player:0];
    }
    else
    {
      v7 = +[MRUEndpointController proactiveRecommendedEndpointController];
    }
    v8 = v7;
    v9 = [[MRUNowPlayingController alloc] initWithEndpointController:v7];
    nowPlayingController = v5->_nowPlayingController;
    v5->_nowPlayingController = v9;

    v11 = objc_alloc_init(MRURouteTextFormatter);
    routeTextFormatter = v5->_routeTextFormatter;
    v5->_routeTextFormatter = v11;

    v13 = [(MRURouteTextFormatter *)v5->_routeTextFormatter configuration];
    [v13 setOmitGroupLeaderName:1];
  }
  return v5;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)loadView
{
  v3 = objc_alloc_init(MRURouteRecommendationPlatterView);
  [(MRURouteRecommendationPlatterViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v7.receiver = self;
  v7.super_class = (Class)MRURouteRecommendationPlatterViewController;
  [(MRURouteRecommendationPlatterViewController *)&v7 viewDidLoad];
  v3 = [(MRURouteRecommendationPlatterViewController *)self view];
  [v3 addTarget:self action:sel_handleTap_ forControlEvents:64];

  id v4 = [(MRURouteRecommendationPlatterViewController *)self view];
  v5 = [v4 actionButton];
  [v5 addTarget:self action:sel_handleActionButtonTap_ forControlEvents:64];

  v6 = [(MRURouteRecommendationPlatterViewController *)self nowPlayingController];
  [v6 addObserver:self];

  [(MRURouteRecommendationPlatterViewController *)self updateActionType];
}

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRURouteRecommendationPlatterViewController;
  [(MRURouteRecommendationPlatterViewController *)&v4 viewWillAppear:a3];
  [(MRURouteRecommendationPlatterViewController *)self setOnScreen:1];
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  [(MRURouteRecommendationPlatterViewController *)self setOnScreen:0];
  v5.receiver = self;
  v5.super_class = (Class)MRURouteRecommendationPlatterViewController;
  [(MRURouteRecommendationPlatterViewController *)&v5 viewDidDisappear:v3];
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    self->_onScreen = a3;
    objc_super v4 = [(MRURouteRecommendationPlatterViewController *)self nowPlayingController];
    [v4 updateAutomaticResponseLoading];
  }

  [(MRURouteRecommendationPlatterViewController *)self updateMarqueeAnimation];
}

- (void)handleActionButtonTap:(id)a3
{
  objc_super v4 = [(MRUNowPlayingController *)self->_nowPlayingController tvRemoteController];
  int v5 = [v4 showTVRemote];

  if (v5)
  {
    id v6 = [(MRUNowPlayingController *)self->_nowPlayingController tvRemoteController];
    [v6 presentTVRemoteUsingApp:0];
  }
  else
  {
    [(MRURouteRecommendationPlatterViewController *)self _acceptRecommendation];
  }
}

- (void)_acceptRecommendation
{
  v2 = [(MRURouteRecommendationPlatterViewController *)self nowPlayingController];
  BOOL v3 = [v2 endpointController];
  objc_super v4 = [v3 route];
  int v5 = [v4 endpointObject];
  id v6 = [v5 outputDeviceUIDs];
  id v8 = [v6 firstObject];

  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F77100]) initWithOutputDeviceUID:v8 reason:@"Recommendation accepted"];
  [v7 perform:MEMORY[0x1E4F14428] completion:&__block_literal_global_11];
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  id v6 = a5;
  objc_super v7 = +[MRUAssetManager sharedManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __102__MRURouteRecommendationPlatterViewController_nowPlayingController_endpointController_didChangeRoute___block_invoke;
  v11[3] = &unk_1E5F0E270;
  v11[4] = self;
  [v7 imageForEndpointRoute:v6 completion:v11];

  id v8 = [(MRURouteTextFormatter *)self->_routeTextFormatter textForRoute:v6];

  v9 = [(MRURouteRecommendationPlatterViewController *)self view];
  v10 = [v9 labelView];
  [v10 setTitle:v8];

  [(MRURouteRecommendationPlatterViewController *)self invalidateAllTimelinesForReason:@"now playing route changed"];
}

uint64_t __102__MRURouteRecommendationPlatterViewController_nowPlayingController_endpointController_didChangeRoute___block_invoke(uint64_t a1, void *a2)
{
  BOOL v3 = *(void **)(a1 + 32);
  id v4 = a2;
  int v5 = [v3 view];
  id v6 = [v5 activityRouteView];
  objc_super v7 = [v6 deviceIconView];
  [v7 frame];
  v10 = objc_msgSend(v4, "mru_imageFittingSize:", v8, v9);

  v11 = [*(id *)(a1 + 32) view];
  v12 = [v11 activityRouteView];
  v13 = [v12 deviceIconView];
  [v13 setImage:v10];

  v14 = *(void **)(a1 + 32);

  return [v14 invalidateAllTimelinesForReason:@"now playing route image changed"];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeArtwork:(id)a5
{
  id v6 = a5;
  objc_super v7 = [(MRURouteRecommendationPlatterViewController *)self view];
  double v8 = [v7 activityRouteView];
  double v9 = [v8 artworkView];
  [v9 setArtwork:v6];

  [(MRURouteRecommendationPlatterViewController *)self invalidateAllTimelinesForReason:@"now playing artwork changed"];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  id v6 = a5;
  id v15 = [(MRURouteRecommendationPlatterViewController *)self view];
  objc_super v7 = [v6 stringForComponents:3];
  double v8 = [v15 labelView];
  [v8 setSubtitle:v7];

  uint64_t v9 = [v6 isPlaying] ^ 1;
  v10 = [v15 activityRouteView];
  v11 = [v10 artworkView];
  [v11 setHidden:v9];

  uint64_t v12 = [v6 isPlaying];
  v13 = [v15 activityRouteView];
  v14 = [v13 artworkView];
  [v14 setPlaying:v12];

  [(MRURouteRecommendationPlatterViewController *)self invalidateAllTimelinesForReason:@"now playing info changed"];
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)MRURouteRecommendationPlatterViewController;
  id v4 = a3;
  [(MRURouteRecommendationPlatterViewController *)&v9 traitCollectionDidChange:v4];
  int v5 = objc_msgSend(v4, "mr_shouldDim", v9.receiver, v9.super_class);

  id v6 = [(MRURouteRecommendationPlatterViewController *)self traitCollection];
  uint64_t v7 = objc_msgSend(v6, "mr_shouldDim");

  if (v5 != v7)
  {
    double v8 = [NSNumber numberWithBool:v7];
    [(MRURouteRecommendationPlatterViewController *)self setPendingDimmed:v8];

    [(MRURouteRecommendationPlatterViewController *)self schedulePendingTraitCollectionUpdates];
  }
}

- (void)updateDimmed
{
  [(MRURouteRecommendationPlatterViewController *)self invalidateAllTimelinesForReason:@"backlight luminance changed"];

  [(MRURouteRecommendationPlatterViewController *)self updateMarqueeAnimation];
}

- (void)updateActionType
{
  BOOL v3 = [(MRURouteRecommendationPlatterViewController *)self nowPlayingController];
  id v4 = [v3 tvRemoteController];
  uint64_t v5 = [v4 showTVRemote];

  id v6 = [(MRURouteRecommendationPlatterViewController *)self view];
  [v6 setActionType:v5];
}

- (void)schedulePendingTraitCollectionUpdates
{
  if (![(MRURouteRecommendationPlatterViewController *)self hasPendingTraitCollectionUpdates])
  {
    [(MRURouteRecommendationPlatterViewController *)self setHasPendingTraitCollectionUpdates:1];
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __84__MRURouteRecommendationPlatterViewController_schedulePendingTraitCollectionUpdates__block_invoke;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __84__MRURouteRecommendationPlatterViewController_schedulePendingTraitCollectionUpdates__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingDimmed];

  if (v2)
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) pendingDimmed];
    objc_msgSend(*(id *)(a1 + 32), "setDimmed:", objc_msgSend(v3, "BOOLValue"));

    [*(id *)(a1 + 32) updateDimmed];
    [*(id *)(a1 + 32) setPendingDimmed:0];
  }
  id v4 = *(void **)(a1 + 32);

  return [v4 setHasPendingTraitCollectionUpdates:0];
}

- (void)updateMarqueeAnimation
{
  uint64_t v3 = [(MRURouteRecommendationPlatterViewController *)self isDimmed] ^ 1;
  id v5 = [(MRURouteRecommendationPlatterViewController *)self view];
  id v4 = [v5 labelView];
  [v4 setMarqueeEnabled:v3];
}

- (id)backlightSceneEnvironment
{
  v2 = [(MRURouteRecommendationPlatterViewController *)self view];
  uint64_t v3 = [v2 window];
  id v4 = [v3 windowScene];
  id v5 = [v4 _backlightSceneEnvironment];

  return v5;
}

- (id)_timelinesForDateInterval:(id)a3
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F4F4B0] emptyTimelineWithIdentifier:@"route recommendation platter"];
  v6[0] = v3;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

  return v4;
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  id v5 = a3;
  if ([(MRURouteRecommendationPlatterViewController *)self isDimmed])
  {
    id v4 = [(MRURouteRecommendationPlatterViewController *)self backlightSceneEnvironment];
    [v4 invalidateAllTimelinesForReason:v5];
  }
}

- (NSString)routeIdentifier
{
  return self->_routeIdentifier;
}

- (void)setRouteIdentifier:(id)a3
{
}

- (MRUNowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (MRURouteTextFormatter)routeTextFormatter
{
  return self->_routeTextFormatter;
}

- (void)setRouteTextFormatter:(id)a3
{
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_dimmed = a3;
}

- (NSNumber)pendingDimmed
{
  return self->_pendingDimmed;
}

- (void)setPendingDimmed:(id)a3
{
}

- (BOOL)hasPendingTraitCollectionUpdates
{
  return self->_hasPendingTraitCollectionUpdates;
}

- (void)setHasPendingTraitCollectionUpdates:(BOOL)a3
{
  self->_hasPendingTraitCollectionUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDimmed, 0);
  objc_storeStrong((id *)&self->_routeTextFormatter, 0);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);

  objc_storeStrong((id *)&self->_routeIdentifier, 0);
}

@end