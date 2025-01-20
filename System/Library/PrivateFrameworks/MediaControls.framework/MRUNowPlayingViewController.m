@interface MRUNowPlayingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)hasPendingTraitCollectionUpdates;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)isPlaying;
- (BOOL)isShowingMediaSuggestions;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)pendingTimelineInvalidation;
- (BOOL)shouldAutomaticallyForwardAppearanceMethods;
- (BOOL)shouldShowMediaSuggestions;
- (BOOL)showArtworkView;
- (BOOL)showRouteLabel;
- (BOOL)supportsHorizontalLayout;
- (BSInvalidatable)hardwareVolumeControlAssertion;
- (MPAVOutputDevicePlaybackDataSource)playbackDataSource;
- (MPMediaControls)mediaControls;
- (MRUArtworkView)artworkView;
- (MRUMediaSuggestionsViewController)suggestionsViewController;
- (MRUNowPlayingController)controller;
- (MRUNowPlayingViewController)initWithController:(id)a3 routeControlsPresentation:(int64_t)a4;
- (MRUNowPlayingViewController)initWithRouteUID:(id)a3;
- (MRUNowPlayingViewController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5;
- (MRUNowPlayingViewControllerDelegate)delegate;
- (MRURoutingViewController)routingViewController;
- (MRUVisualStylingProvider)pendingVisualStylingProvider;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUVolumeGroupCoordinator)volumeGroupCoordinator;
- (NSArray)restrictedRects;
- (NSNumber)pendingDimmed;
- (NSString)description;
- (UIEdgeInsets)contentEdgeInsets;
- (id)_stateDumpObject;
- (id)_timelinesForDateInterval:(id)a3;
- (id)backlightSceneEnvironment;
- (id)configureRoutingButton;
- (id)contextString;
- (id)coordinatedDismissalBlock;
- (id)destination;
- (int64_t)context;
- (int64_t)layout;
- (int64_t)routeControlsPresentation;
- (unint64_t)stateHandle;
- (void)_setStylingProvider:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)createRoutingViewController;
- (void)createSuggestionsViewController;
- (void)dealloc;
- (void)didSelectArtworkView:(id)a3;
- (void)didSelectQuickControl:(id)a3;
- (void)initiateQueueHandoffTansitionWithCoordinator:(id)a3;
- (void)invalidateAllTimelinesForReason:(id)a3;
- (void)launchNowPlayingApp;
- (void)loadView;
- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTimeControls:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTransportControls:(id)a5;
- (void)nowPlayingController:(id)a3 queueHandoffCoordinator:(id)a4 didChangeState:(int64_t)a5;
- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5;
- (void)presentRoutingControlsFromSourceView:(id)a3;
- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4;
- (void)routingViewControllerDidUpdateItems:(id)a3;
- (void)schedulePendingTraitCollectionUpdates;
- (void)setConfigureRoutingButton:(id)a3;
- (void)setContentEdgeInsets:(UIEdgeInsets)a3;
- (void)setContext:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setCoordinatedDismissalBlock:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setHardwareVolumeControlAssertion:(id)a3;
- (void)setHasPendingTraitCollectionUpdates:(BOOL)a3;
- (void)setLayout:(int64_t)a3;
- (void)setMediaControls:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPendingDimmed:(id)a3;
- (void)setPendingTimelineInvalidation:(BOOL)a3;
- (void)setPendingVisualStylingProvider:(id)a3;
- (void)setPlaybackDataSource:(id)a3;
- (void)setPlaying:(BOOL)a3;
- (void)setRoutingViewController:(id)a3;
- (void)setShowArtworkView:(BOOL)a3;
- (void)setStateHandle:(unint64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestionsViewController:(id)a3;
- (void)setSupportsHorizontalLayout:(BOOL)a3;
- (void)setVolumeGroupCoordinator:(id)a3;
- (void)trackStartedShowingMediaSuggestions;
- (void)trackSuggestionSelected:(id)a3 atIndex:(unint64_t)a4 error:(id)a5;
- (void)trackSuggestionsDisplayed:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4;
- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4;
- (void)updateArtwork;
- (void)updateContentAnimated:(id)a3 completion:(id)a4;
- (void)updateDimmed;
- (void)updateLayout;
- (void)updateNowPlayingInfo;
- (void)updateQuickControl;
- (void)updateRouteLabel;
- (void)updateRoutingButton;
- (void)updateRoutingButtonAnimated:(BOOL)a3;
- (void)updateRoutingContentEdgeInsets;
- (void)updateRoutingDiscoveryMode;
- (void)updateSuggestionContext;
- (void)updateSuggestions;
- (void)updateTimeControls;
- (void)updateTimeControlsForPresentationInterval:(id)a3;
- (void)updateTransportControls;
- (void)updateVisibility;
- (void)updateVolumeControls;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)volumeControlsView:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MRUNowPlayingViewController

- (void)trackSuggestionsDisplayed:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28BD0]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v32 + 1) + 8 * i) bundleID];
        v11 = (void *)v10;
        if (v10) {
          v12 = (__CFString *)v10;
        }
        else {
          v12 = @"unspecified";
        }
        v13 = v12;

        [v4 addObject:v13];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v32 objects:v37 count:16];
    }
    while (v7);
  }

  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke;
  v30[3] = &unk_1E5F0D780;
  v30[4] = self;
  id v21 = v5;
  id v31 = v21;
  +[MRUAnalytics sendEvent:@"com.apple.mediaremote.suggestions-displayed" withError:0 payload:v30];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v27 != v17) {
          objc_enumerationMutation(v14);
        }
        uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * j);
        v23[0] = MEMORY[0x1E4F143A8];
        v23[1] = 3221225472;
        v23[2] = __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke_2;
        v23[3] = &unk_1E5F0D7A8;
        v23[4] = v19;
        id v20 = v14;
        id v24 = v20;
        v25 = self;
        +[MRUAnalytics sendEvent:@"com.apple.mediaremote.suggestion-provider-displayed" withError:0 payload:v23];
      }
      uint64_t v16 = [v20 countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v16);
  }
}

id __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke(uint64_t a1)
{
  v13[4] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) destination];
  id v3 = [v2 designatedGroupLeader];
  [v3 deviceSubtype];
  id v4 = (void *)MRAVOutputDeviceSubtypeCopyDescription();

  v12[0] = @"populatedItemsCount";
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 40), "count"));
  v13[0] = v5;
  v12[1] = @"context";
  uint64_t v6 = [*(id *)(a1 + 32) contextString];
  v13[1] = v6;
  v13[2] = v4;
  v12[2] = 0x1F0653960;
  v12[3] = @"isRemoteDestination";
  uint64_t v7 = NSNumber;
  uint64_t v8 = [*(id *)(a1 + 32) destination];
  v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "isLocalEndpoint") ^ 1);
  v13[3] = v9;
  uint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:4];

  return v10;
}

id __68__MRUNowPlayingViewController_Analytics__trackSuggestionsDisplayed___block_invoke_2(uint64_t a1)
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *(void *)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v9[0] = v3;
  v8[0] = 0x1F0653940;
  v8[1] = @"suggestionsCount";
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v2, "countForObject:"));
  v9[1] = v4;
  v8[2] = @"context";
  id v5 = [*(id *)(a1 + 48) contextString];
  v9[2] = v5;
  uint64_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (void)trackSuggestionSelected:(id)a3 atIndex:(unint64_t)a4 error:(id)a5
{
  id v8 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __80__MRUNowPlayingViewController_Analytics__trackSuggestionSelected_atIndex_error___block_invoke;
  v10[3] = &unk_1E5F0D7D0;
  v10[4] = self;
  id v11 = v8;
  unint64_t v12 = a4;
  id v9 = v8;
  +[MRUAnalytics sendEvent:@"com.apple.mediaremote.suggestion-selected" withError:a5 payload:v10];
}

id __80__MRUNowPlayingViewController_Analytics__trackSuggestionSelected_atIndex_error___block_invoke(uint64_t a1)
{
  v14[5] = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) destination];
  uint64_t v3 = [v2 designatedGroupLeader];
  [v3 deviceSubtype];
  id v4 = (void *)MRAVOutputDeviceSubtypeCopyDescription();

  v13[0] = 0x1F0653940;
  id v5 = [*(id *)(a1 + 40) bundleID];
  v14[0] = v5;
  v13[1] = @"selectedIndex";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:*(void *)(a1 + 48)];
  v14[1] = v6;
  v14[2] = v4;
  v13[2] = 0x1F0653960;
  v13[3] = @"isRemoteDestination";
  uint64_t v7 = NSNumber;
  id v8 = [*(id *)(a1 + 32) destination];
  id v9 = objc_msgSend(v7, "numberWithInt:", objc_msgSend(v8, "isLocalEndpoint") ^ 1);
  v14[3] = v9;
  v13[4] = @"context";
  uint64_t v10 = [*(id *)(a1 + 32) contextString];
  v14[4] = v10;
  id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:v13 count:5];

  return v11;
}

- (id)contextString
{
  uint64_t v2 = [(MRUNowPlayingViewController *)self context];

  return MRUNowPlayingContextDescription(v2);
}

- (id)destination
{
  uint64_t v2 = [(MRUNowPlayingViewController *)self controller];
  uint64_t v3 = [v2 endpointController];
  id v4 = [v3 route];
  id v5 = [v4 endpoint];

  return v5;
}

- (MRUNowPlayingViewController)initWithController:(id)a3 routeControlsPresentation:(int64_t)a4
{
  id v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MRUNowPlayingViewController;
  id v8 = [(MRUNowPlayingViewController *)&v16 init];
  id v9 = v8;
  if (v8)
  {
    v8->_routeControlsPresentation = a4;
    objc_storeStrong((id *)&v8->_controller, a3);
    uint64_t v10 = objc_alloc_init(MRUVisualStylingProvider);
    stylingProvider = v9->_stylingProvider;
    v9->_stylingProvider = v10;

    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke;
    v14[3] = &unk_1E5F0DEA0;
    unint64_t v12 = v9;
    uint64_t v15 = v12;
    v12->_stateHandle = __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke((uint64_t)v14);
    *(_OWORD *)&v12->_contentEdgeInsets.top = MRUNowPlayingContentEdgeInsetsDefault;
    *(_OWORD *)&v12->_contentEdgeInsets.bottom = *(_OWORD *)&qword_1AE963918;
    v12->_showArtworkView = 1;
  }
  return v9;
}

uint64_t __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  uint64_t v2 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), *(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke_2;
  v5[3] = &unk_1E5F0DE78;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __76__MRUNowPlayingViewController_initWithController_routeControlsPresentation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (*(_DWORD *)(a2 + 16) == 3)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    uint64_t v3 = WeakRetained;
    if (WeakRetained)
    {
      id v4 = [WeakRetained _stateDumpObject];
    }
    else
    {
      id v4 = 0;
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (MRUNowPlayingViewController)initWithRouteUID:(id)a3 client:(id)a4 player:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[MRUEndpointController alloc] initWithRouteUID:v10 client:v9 player:v8];

  unint64_t v12 = [[MRUNowPlayingController alloc] initWithEndpointController:v11];
  v13 = [(MRUNowPlayingViewController *)self initWithController:v12 routeControlsPresentation:2];

  return v13;
}

- (MRUNowPlayingViewController)initWithRouteUID:(id)a3
{
  return [(MRUNowPlayingViewController *)self initWithRouteUID:a3 client:0 player:0];
}

- (void)loadView
{
  uint64_t v3 = objc_alloc_init(MRUNowPlayingView);
  [(MRUNowPlayingViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v31.receiver = self;
  v31.super_class = (Class)MRUNowPlayingViewController;
  [(MRUNowPlayingViewController *)&v31 viewDidLoad];
  int64_t layout = self->_layout;
  id v4 = [(MRUNowPlayingViewController *)self view];
  [v4 setLayout:layout];

  int64_t context = self->_context;
  id v6 = [(MRUNowPlayingViewController *)self view];
  [v6 setContext:context];

  BOOL supportsHorizontalLayout = self->_supportsHorizontalLayout;
  id v8 = [(MRUNowPlayingViewController *)self view];
  [v8 setSupportsHorizontalLayout:supportsHorizontalLayout];

  double top = self->_contentEdgeInsets.top;
  double left = self->_contentEdgeInsets.left;
  double bottom = self->_contentEdgeInsets.bottom;
  double right = self->_contentEdgeInsets.right;
  v13 = [(MRUNowPlayingViewController *)self view];
  objc_msgSend(v13, "setContentEdgeInsets:", top, left, bottom, right);

  stylingProvider = self->_stylingProvider;
  uint64_t v15 = [(MRUNowPlayingViewController *)self view];
  [v15 setStylingProvider:stylingProvider];

  objc_super v16 = [(MRUNowPlayingViewController *)self view];
  uint64_t v17 = [v16 artworkView];
  [v17 addTarget:self action:sel_didSelectArtworkView_ forControlEvents:64];

  v18 = [(MRUNowPlayingViewController *)self view];
  uint64_t v19 = [v18 headerView];
  id v20 = [v19 labelView];
  [v20 addTarget:self action:sel_didSelectLabelView_ forControlEvents:64];

  id v21 = [(MRUNowPlayingViewController *)self view];
  v22 = [v21 headerView];
  v23 = [v22 routingButton];
  [v23 addTarget:self action:sel_didSelectRoutingButton_ forControlEvents:64];

  id v24 = [(MRUNowPlayingViewController *)self view];
  v25 = [v24 transportControlsView];
  [v25 setDelegate:self];

  long long v26 = [(MRUNowPlayingViewController *)self view];
  long long v27 = [v26 volumeControlsView];
  [v27 setDelegate:self];

  long long v28 = [(MRUNowPlayingViewController *)self view];
  long long v29 = [v28 artworkView];
  [v29 addObserver:self];

  [(MRUNowPlayingController *)self->_controller addObserver:self];
  v30 = +[MRUCallMonitor sharedMonitor];
  [v30 addObserver:self];

  [(MRUNowPlayingViewController *)self createRoutingViewController];
  [(MRUNowPlayingViewController *)self updateDimmed];
  [(MRUNowPlayingViewController *)self updateRoutingButton];
  [(MRUNowPlayingViewController *)self updateRouteLabel];
  [(MRUNowPlayingViewController *)self updateArtwork];
  [(MRUNowPlayingViewController *)self updateNowPlayingInfo];
  [(MRUNowPlayingViewController *)self updateTimeControls];
  [(MRUNowPlayingViewController *)self updateTransportControls];
  [(MRUNowPlayingViewController *)self updateQuickControl];
  [(MRUNowPlayingViewController *)self updateVolumeControls];
  [(MRUNowPlayingViewController *)self updateVisibility];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewWillAppear:](&v7, sel_viewWillAppear_);
  [(MRUNowPlayingViewController *)self setOnScreen:1];
  id v5 = [(MRUNowPlayingViewController *)self view];
  int v6 = [v5 showSuggestionsView];

  if (v6) {
    [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController beginAppearanceTransition:1 animated:v3];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUNowPlayingViewController;
  [(MRUNowPlayingViewController *)&v6 viewDidAppear:a3];
  id v4 = [(MRUNowPlayingViewController *)self view];
  int v5 = [v4 showSuggestionsView];

  if (v5) {
    [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController endAppearanceTransition];
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MRUNowPlayingViewController;
  -[MRUNowPlayingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  [(MRUNowPlayingViewController *)self setOnScreen:0];
  int v5 = [(MRUNowPlayingViewController *)self view];
  int v6 = [v5 showSuggestionsView];

  if (v6) {
    [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController beginAppearanceTransition:0 animated:v3];
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)MRUNowPlayingViewController;
  [(MRUNowPlayingViewController *)&v6 viewDidDisappear:a3];
  id v4 = [(MRUNowPlayingViewController *)self view];
  int v5 = [v4 showSuggestionsView];

  if (v5) {
    [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController endAppearanceTransition];
  }
}

- (void)dealloc
{
  os_state_remove_handler();
  [(MRUNowPlayingController *)self->_controller updateAutomaticResponseLoading];
  v3.receiver = self;
  v3.super_class = (Class)MRUNowPlayingViewController;
  [(MRUNowPlayingViewController *)&v3 dealloc];
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (NSString)description
{
  objc_super v3 = NSString;
  uint64_t v4 = objc_opt_class();
  int v5 = [(MRUNowPlayingViewController *)self controller];
  objc_super v6 = [v5 endpointController];
  objc_super v7 = [v6 route];
  id v8 = [v3 stringWithFormat:@"<%@: %p route: %@", v4, self, v7];

  return (NSString *)v8;
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    int v5 = [(MRUNowPlayingViewController *)self controller];
    [v5 updateAutomaticResponseLoading];

    [(MRUNowPlayingViewController *)self updateRoutingButton];
    [(MRUNowPlayingViewController *)self updateRouteLabel];
    [(MRUNowPlayingViewController *)self updateArtwork];
    [(MRUNowPlayingViewController *)self updateNowPlayingInfo];
    [(MRUNowPlayingViewController *)self updateTransportControls];
    [(MRUNowPlayingViewController *)self updateQuickControl];
    [(MRUNowPlayingViewController *)self updateRoutingDiscoveryMode];
    [(MRUNowPlayingViewController *)self updateSuggestions];
    [(MRUNowPlayingViewController *)self trackStartedShowingMediaSuggestions];
    [(MRUNowPlayingViewController *)self updateTimeControls];
    [(MRUNowPlayingViewController *)self updateVolumeControls];
    [(MRUNowPlayingViewController *)self updateVisibility];
    if (v3)
    {
      id v7 = [(MRUNowPlayingViewController *)self controller];
      objc_super v6 = [v7 mediaSuggestionsController];
      [v6 refreshMediaSuggestions];
    }
  }
}

- (MRUArtworkView)artworkView
{
  uint64_t v2 = [(MRUNowPlayingViewController *)self view];
  BOOL v3 = [v2 artworkView];

  return (MRUArtworkView *)v3;
}

- (void)setController:(id)a3
{
  uint64_t v4 = (MRUNowPlayingController *)a3;
  [(MRUNowPlayingController *)self->_controller removeObserver:self];
  controller = self->_controller;
  self->_controller = v4;
  objc_super v6 = v4;

  [(MRUNowPlayingController *)self->_controller addObserver:self];
  [(MRUNowPlayingController *)v6 updateAutomaticResponseLoading];
  int64_t v7 = [(MRUNowPlayingViewController *)self context];
  id v8 = [(MRUNowPlayingController *)v6 tvRemoteController];

  [v8 setContext:v7];
  [(MRUNowPlayingViewController *)self createRoutingViewController];
  id v9 = [(MRUNowPlayingViewController *)self controller];
  id v10 = [v9 mediaSuggestionsController];
  [v10 refreshMediaSuggestions];

  [(MRUNowPlayingViewController *)self updateRoutingButton];
  [(MRUNowPlayingViewController *)self updateRouteLabel];
  [(MRUNowPlayingViewController *)self updateArtwork];
  [(MRUNowPlayingViewController *)self updateNowPlayingInfo];
  [(MRUNowPlayingViewController *)self updateTimeControls];
  [(MRUNowPlayingViewController *)self updateTransportControls];
  [(MRUNowPlayingViewController *)self updateQuickControl];
  [(MRUNowPlayingViewController *)self updateVolumeControls];
  [(MRUNowPlayingViewController *)self updateVisibility];
  [(MRUNowPlayingViewController *)self updateRoutingDiscoveryMode];
  [(MRUNowPlayingViewController *)self updateSuggestions];

  [(MRUNowPlayingViewController *)self trackStartedShowingMediaSuggestions];
}

- (void)setLayout:(int64_t)a3
{
  int64_t layout = self->_layout;
  if (layout != a3)
  {
    self->_int64_t layout = a3;
    objc_super v6 = [(MRUNowPlayingViewController *)self viewIfLoaded];
    [v6 setLayout:a3];

    int64_t v7 = [(MRUNowPlayingViewController *)self suggestionsViewController];
    [v7 setLayout:a3 == 4];

    [(MRUNowPlayingViewController *)self updateRoutingContentEdgeInsets];
    [(MRUNowPlayingViewController *)self updateArtwork];
    [(MRUNowPlayingViewController *)self updateRoutingButton];
    [(MRUNowPlayingViewController *)self updateRouteLabel];
    [(MRUNowPlayingViewController *)self updateNowPlayingInfo];
    [(MRUNowPlayingViewController *)self updateVolumeControls];
    [(MRUNowPlayingViewController *)self updateRoutingDiscoveryMode];
    [(MRUNowPlayingViewController *)self updateSuggestions];
    [(MRUNowPlayingViewController *)self updateVisibility];
    BOOL v8 = a3 != 1 || layout == 1;
    BOOL v9 = !v8;
    if (!v8 || a3 != 1 && layout == 1)
    {
      [(MRURoutingViewController *)self->_routingViewController beginAppearanceTransition:v9 animated:1];
      routingViewController = self->_routingViewController;
      [(MRURoutingViewController *)routingViewController endAppearanceTransition];
    }
  }
}

- (void)setContext:(int64_t)a3
{
  if (self->_context != a3)
  {
    self->_int64_t context = a3;
    int v5 = [(MRUNowPlayingViewController *)self viewIfLoaded];
    [v5 setContext:a3];

    objc_super v6 = [(MRUNowPlayingViewController *)self controller];
    int64_t v7 = [v6 tvRemoteController];
    [v7 setContext:a3];

    [(MRUNowPlayingViewController *)self updateSuggestionContext];
    [(MRUNowPlayingViewController *)self updateVolumeControls];
  }
}

- (void)setSupportsHorizontalLayout:(BOOL)a3
{
  if (self->_supportsHorizontalLayout != a3)
  {
    BOOL v3 = a3;
    self->_BOOL supportsHorizontalLayout = a3;
    int v5 = [(MRUNowPlayingViewController *)self viewIfLoaded];
    [v5 setSupportsHorizontalLayout:v3];

    id v6 = [(MRUNowPlayingViewController *)self suggestionsViewController];
    [v6 setSupportsHorizontalLayout:v3];
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
    unint64_t v12 = [(MRUNowPlayingViewController *)self viewIfLoaded];
    objc_msgSend(v12, "setContentEdgeInsets:", top, left, bottom, right);

    v13 = [(MRUNowPlayingViewController *)self suggestionsViewController];
    objc_msgSend(v13, "setContentEdgeInsets:", top, left, bottom, right);

    [(MRUNowPlayingViewController *)self updateRoutingContentEdgeInsets];
  }
}

- (void)_setStylingProvider:(id)a3
{
  p_stylingProvider = &self->_stylingProvider;
  BOOL v9 = (MRUVisualStylingProvider *)a3;
  if (*p_stylingProvider != v9)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)*p_stylingProvider setTraitChangeObservable:self];
    id v6 = [(MRUNowPlayingViewController *)self viewIfLoaded];
    [v6 setStylingProvider:v9];

    double v7 = [(MRUNowPlayingViewController *)self suggestionsViewController];
    [v7 setStylingProvider:v9];

    BOOL v8 = [(MRUNowPlayingViewController *)self routingViewController];
    [v8 setStylingProvider:v9];
  }
}

- (void)setStylingProvider:(id)a3
{
  [(MRUNowPlayingViewController *)self setPendingVisualStylingProvider:a3];

  [(MRUNowPlayingViewController *)self schedulePendingTraitCollectionUpdates];
}

- (void)setPlaybackDataSource:(id)a3
{
  obuint64_t j = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDataSource);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_playbackDataSource, obj);
    int v5 = [(MRUNowPlayingViewController *)self routingViewController];
    id v6 = [v5 routingController];
    [v6 setPlaybackDataSource:obj];
  }
}

- (void)setConfigureRoutingButton:(id)a3
{
  uint64_t v4 = (void *)[a3 copy];
  id configureRoutingButton = self->_configureRoutingButton;
  self->_id configureRoutingButton = v4;

  [(MRUNowPlayingViewController *)self updateRoutingButton];
}

- (void)setRoutingViewController:(id)a3
{
  id v10 = a3;
  p_routingViewController = &self->_routingViewController;
  [(MRURoutingViewController *)self->_routingViewController setDelegate:0];
  if (self->_layout == 1)
  {
    [(MRURoutingViewController *)*p_routingViewController beginAppearanceTransition:0 animated:0];
    [(MRURoutingViewController *)*p_routingViewController endAppearanceTransition];
  }
  [(MRURoutingViewController *)*p_routingViewController willMoveToParentViewController:0];
  [(MRURoutingViewController *)*p_routingViewController removeFromParentViewController];
  objc_storeStrong((id *)&self->_routingViewController, a3);
  id v6 = [(MRUNowPlayingController *)self->_controller endpointController];
  double v7 = [v6 route];
  [(MRURoutingViewController *)*p_routingViewController setEndpointRoute:v7];

  [(MRURoutingViewController *)*p_routingViewController setDelegate:self];
  [(MRURoutingViewController *)*p_routingViewController setVolumeGroupCoordinator:self->_volumeGroupCoordinator];
  [(MRURoutingViewController *)*p_routingViewController setStylingProvider:self->_stylingProvider];
  [(MRUNowPlayingViewController *)self updateRoutingContentEdgeInsets];
  [(MRUNowPlayingViewController *)self updateRoutingDiscoveryMode];
  [(MRUNowPlayingViewController *)self addChildViewController:v10];
  BOOL v8 = [v10 view];
  BOOL v9 = [(MRUNowPlayingViewController *)self view];
  [v9 setContentView:v8];

  [v10 didMoveToParentViewController:self];
  if (self->_layout == 1)
  {
    [(MRURoutingViewController *)*p_routingViewController beginAppearanceTransition:1 animated:0];
    [(MRURoutingViewController *)*p_routingViewController endAppearanceTransition];
  }
}

- (void)setShowArtworkView:(BOOL)a3
{
  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    [(MRUNowPlayingViewController *)self updateArtwork];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __50__MRUNowPlayingViewController_setShowArtworkView___block_invoke;
    v5[3] = &unk_1E5F0D8C0;
    void v5[4] = self;
    BOOL v6 = a3;
    [(MRUNowPlayingViewController *)self updateContentAnimated:v5 completion:0];
  }
}

void __50__MRUNowPlayingViewController_setShowArtworkView___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setShowArtworkView:v1];
}

- (NSArray)restrictedRects
{
  BOOL v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  uint64_t v4 = [(MRUNowPlayingViewController *)self view];
  if ([v4 showSuggestionsView])
  {
    int v5 = [(MRUNowPlayingViewController *)self view];
    BOOL v6 = [v5 suggestionsView];

    if (!v6) {
      goto LABEL_5;
    }
    double v7 = [(MRUNowPlayingViewController *)self view];
    BOOL v8 = [v7 suggestionsView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    uint64_t v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v10, v12, v14, v16);
    [v3 addObject:v4];
  }

LABEL_5:
  uint64_t v17 = [(MRUNowPlayingViewController *)self view];
  int v18 = [v17 showArtworkView];

  if (v18)
  {
    uint64_t v19 = [(MRUNowPlayingViewController *)self view];
    id v20 = [v19 artworkView];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    long long v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v22, v24, v26, v28);
    [v3 addObject:v29];
  }
  v30 = [(MRUNowPlayingViewController *)self view];
  objc_super v31 = [v30 headerView];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v33, v35, v37, v39);
  [v3 addObject:v40];

  v41 = [(MRUNowPlayingViewController *)self view];
  LODWORD(v31) = [v41 showTimeControlsView];

  if (v31)
  {
    v42 = [(MRUNowPlayingViewController *)self view];
    v43 = [v42 timeControlsView];
    [v43 frame];

    UIRectInset();
    v44 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
    [v3 addObject:v44];
  }
  v45 = [(MRUNowPlayingViewController *)self view];
  int v46 = [v45 showTransportControlsView];

  if (v46)
  {
    v47 = [(MRUNowPlayingViewController *)self view];
    v48 = [v47 transportControlsView];
    [v48 frame];

    UIRectInset();
    v49 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
    [v3 addObject:v49];
  }
  v50 = [(MRUNowPlayingViewController *)self view];
  int v51 = [v50 showVolumeControlsView];

  if (v51)
  {
    v52 = [(MRUNowPlayingViewController *)self view];
    v53 = [v52 volumeControlsView];
    [v53 frame];

    UIRectInset();
    v54 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
    [v3 addObject:v54];
  }
  v55 = (void *)[v3 copy];

  return (NSArray *)v55;
}

- (void)initiateQueueHandoffTansitionWithCoordinator:(id)a3
{
}

- (void)didSelectArtworkView:(id)a3
{
  uint64_t v4 = [(MRUNowPlayingViewController *)self delegate];
  char v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) == 0
    || ([(MRUNowPlayingViewController *)self delegate],
        BOOL v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 nowPlayingViewControllerDidSelectArtworkView:self],
        v6,
        (v7 & 1) == 0))
  {
    [(MRUNowPlayingViewController *)self launchNowPlayingApp];
  }
}

- (void)didSelectQuickControl:(id)a3
{
  BOOL v3 = [(MRUNowPlayingController *)self->_controller quickControlItem];
  uint64_t v5 = [v3 mainAction];

  uint64_t v4 = (void *)v5;
  if (v5)
  {
    (*(void (**)(uint64_t))(v5 + 16))(v5);
    uint64_t v4 = (void *)v5;
  }
}

- (void)volumeControlsView:(id)a3 volumeValueDidChange:(float)a4
{
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  [(MRUNowPlayingViewController *)self updateRouteLabel];
  [(MRUNowPlayingViewController *)self updateVolumeControls];
  [(MRUNowPlayingViewController *)self updateRoutingButtonAnimated:1];
  [(MRUNowPlayingViewController *)self updateLayout];

  [(MRUNowPlayingViewController *)self invalidateAllTimelinesForReason:@"route changed"];
}

- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(a4, "showTVRemote", a3);
  id v8 = [(MRUNowPlayingViewController *)self view];
  char v7 = [v8 transportControlsView];
  [v7 setShowTVRemoteButton:v6];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  self->_playing = objc_msgSend(a5, "isPlaying", a3, a4);
  [(MRUNowPlayingViewController *)self updateNowPlayingInfo];

  [(MRUNowPlayingViewController *)self invalidateAllTimelinesForReason:@"now playing info changed"];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTimeControls:(id)a5
{
  [(MRUNowPlayingViewController *)self updateTimeControls];

  [(MRUNowPlayingViewController *)self invalidateAllTimelinesForReason:@"time controls changed"];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTransportControls:(id)a5
{
  [(MRUNowPlayingViewController *)self updateTransportControls];

  [(MRUNowPlayingViewController *)self invalidateAllTimelinesForReason:@"transport controls changed"];
}

- (void)nowPlayingController:(id)a3 queueHandoffCoordinator:(id)a4 didChangeState:(int64_t)a5
{
  id v25 = a3;
  id v8 = a4;
  double v9 = v8;
  if (a5 == 4)
  {
    uint64_t v19 = [(MRUNowPlayingViewController *)self artworkView];
    double v21 = [v19 layer];
    [v21 removeAllAnimations];
  }
  else
  {
    if (a5 == 2)
    {
      double v22 = *MEMORY[0x1E4F1DB30];
      double v23 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      double v24 = [(MRUNowPlayingViewController *)self view];
      objc_msgSend(v24, "setArtworkOverrideSize:", v22, v23);

      int v18 = [(MRUNowPlayingViewController *)self view];
      uint64_t v19 = v18;
      BOOL v20 = 0;
    }
    else
    {
      if (a5 != 1) {
        goto LABEL_12;
      }
      [v8 artworkSize];
      double v11 = v10;
      double v13 = v12;
      double v14 = [(MRUNowPlayingViewController *)self view];
      objc_msgSend(v14, "setArtworkOverrideSize:", v11, v13);

      [v9 artworkSize];
      BOOL v17 = v16 != *(double *)(MEMORY[0x1E4F1DB30] + 8) || v15 != *MEMORY[0x1E4F1DB30];
      int v18 = [(MRUNowPlayingViewController *)self view];
      uint64_t v19 = v18;
      BOOL v20 = v17;
    }
    [v18 setUseArtworkOverrideSize:v20];
  }

LABEL_12:
}

- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  double v10 = [a3 mediaSuggestions];
  uint64_t v11 = [v10 indexOfObject:v8];

  double v12 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __93__MRUNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke;
  v15[3] = &unk_1E5F0F560;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  uint64_t v18 = v11;
  id v13 = v9;
  id v14 = v8;
  [v12 playSuggestion:v14 completion:v15];
}

uint64_t __93__MRUNowPlayingViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) trackSuggestionSelected:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 56) error:a2];
  BOOL v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

- (void)routingViewController:(id)a3 didSelectRoutingViewItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 actionIdentifier];
  if ([v8 isEqualToString:*MEMORY[0x1E4F31288]])
  {
    id v9 = [(MRUNowPlayingViewController *)self delegate];
    char v10 = objc_opt_respondsToSelector();

    if (v10)
    {
      objc_initWeak(&location, self);
      objc_copyWeak(&v11, &location);
      SBSRequestPasscodeUnlockAlertUI();
      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }
  else
  {
  }
}

void __78__MRUNowPlayingViewController_routingViewController_didSelectRoutingViewItem___block_invoke(uint64_t a1, int a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2)
  {
    uint64_t v4 = [MEMORY[0x1E4F9F760] instantiateViewController];
    [v4 setFlags:1];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __78__MRUNowPlayingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2;
    v7[3] = &unk_1E5F0DCC0;
    id v5 = WeakRetained;
    id v8 = v5;
    [v4 setCompletion:v7];
    id v6 = [v5 delegate];
    [v6 nowPlayingViewController:v5 showViewController:v4];
  }
}

void __78__MRUNowPlayingViewController_routingViewController_didSelectRoutingViewItem___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = objc_opt_class();
    id v9 = [v5 mediaRouteIdentifier];
    int v11 = 138412802;
    uint64_t v12 = v8;
    __int16 v13 = 2112;
    id v14 = v9;
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEFAULT, "%@ ShareAudio dismissed: RouteID %@, Error %@", (uint8_t *)&v11, 0x20u);
  }
  char v10 = [*(id *)(a1 + 32) delegate];
  [v10 nowPlayingViewController:*(void *)(a1 + 32) showViewController:0];
}

- (void)routingViewControllerDidUpdateItems:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (self->_layout == 1)
  {
    id v5 = WeakRetained;
    if (objc_opt_respondsToSelector()) {
      [v5 nowPlayingViewController:self didChangeSizeWithAnimations:0 completion:0];
    }
  }

  MEMORY[0x1F4181820]();
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_coordinatedDismissalBlock)
  {
    uint64_t v8 = [(MRUNowPlayingController *)self->_controller tvRemoteController];
    objc_initWeak(&location, v8);

    coordinatedDismissalBlock = (void (**)(id, void *))self->_coordinatedDismissalBlock;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __77__MRUNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke;
    v11[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v12, &location);
    coordinatedDismissalBlock[2](coordinatedDismissalBlock, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    char v10 = [(MRUNowPlayingController *)self->_controller tvRemoteController];
    [v10 presentTVRemoteUsingApp:0];
  }
}

void __77__MRUNowPlayingViewController_transportControlsView_didSelectTVRemoteButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentTVRemoteUsingApp:0];
}

- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4
{
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRUNowPlayingViewController;
  [(MRUNowPlayingViewController *)&v13 traitCollectionDidChange:v4];
  int v5 = objc_msgSend(v4, "mr_shouldDim");
  id v6 = [(MRUNowPlayingViewController *)self traitCollection];
  uint64_t v7 = objc_msgSend(v6, "mr_shouldDim");

  if (v5 != v7)
  {
    uint64_t v8 = MCLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v4 _backlightLuminance];
      char v10 = [(MRUNowPlayingViewController *)self traitCollection];
      uint64_t v11 = [v10 _backlightLuminance];
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[AOD] Backlight luminance changed from %ld to %ld", buf, 0x16u);
    }
    id v12 = [NSNumber numberWithBool:v7];
    [(MRUNowPlayingViewController *)self setPendingDimmed:v12];

    [(MRUNowPlayingViewController *)self schedulePendingTraitCollectionUpdates];
  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (self->_dimmed && self->_playing)
  {
    BOOL v3 = objc_msgSend(MEMORY[0x1E4F77108], "currentSettings", a3);
    [v3 flipBookUpdateInterval];
    uint64_t v5 = (uint64_t)(60.0 / v4);

    uint64_t v6 = [MEMORY[0x1E4F4F4B0] timelineWithPerMinuteUpdateFrequency:v5 identifier:@"aod-on" configure:0];
  }
  else
  {
    uint64_t v6 = [MEMORY[0x1E4F4F4B0] emptyTimelineWithIdentifier:@"aod-off"];
  }
  uint64_t v7 = (void *)v6;
  v10[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];

  return v8;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4 = [a3 presentationInterval];
  [(MRUNowPlayingViewController *)self updateTimeControlsForPresentationInterval:v4];
}

- (void)schedulePendingTraitCollectionUpdates
{
  if (![(MRUNowPlayingViewController *)self hasPendingTraitCollectionUpdates])
  {
    [(MRUNowPlayingViewController *)self setHasPendingTraitCollectionUpdates:1];
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MRUNowPlayingViewController_schedulePendingTraitCollectionUpdates__block_invoke;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__MRUNowPlayingViewController_schedulePendingTraitCollectionUpdates__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingDimmed];

  if (v2)
  {
    dispatch_time_t v3 = [*(id *)(a1 + 32) pendingDimmed];
    objc_msgSend(*(id *)(a1 + 32), "setDimmed:", objc_msgSend(v3, "BOOLValue"));

    [*(id *)(a1 + 32) updateDimmed];
    [*(id *)(a1 + 32) setPendingDimmed:0];
  }
  id v4 = [*(id *)(a1 + 32) pendingVisualStylingProvider];

  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    uint64_t v6 = [v5 pendingVisualStylingProvider];
    [v5 _setStylingProvider:v6];

    [*(id *)(a1 + 32) setPendingVisualStylingProvider:0];
  }
  uint64_t v7 = *(void **)(a1 + 32);

  return [v7 setHasPendingTraitCollectionUpdates:0];
}

- (id)backlightSceneEnvironment
{
  id v2 = [(MRUNowPlayingViewController *)self view];
  dispatch_time_t v3 = [v2 window];
  id v4 = [v3 windowScene];
  uint64_t v5 = [v4 _backlightSceneEnvironment];

  return v5;
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRUNowPlayingViewController *)self isDimmed])
  {
    uint64_t v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[AOD] Enqueueing timeline invalidation because %@", buf, 0xCu);
    }

    if (![(MRUNowPlayingViewController *)self pendingTimelineInvalidation])
    {
      [(MRUNowPlayingViewController *)self setPendingTimelineInvalidation:1];
      dispatch_time_t v6 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MRUNowPlayingViewController_invalidateAllTimelinesForReason___block_invoke;
      block[3] = &unk_1E5F0D7F8;
      block[4] = self;
      dispatch_after(v6, MEMORY[0x1E4F14428], block);
    }
  }
}

void __63__MRUNowPlayingViewController_invalidateAllTimelinesForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingTimelineInvalidation:0];
  id v2 = MCLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "[AOD] Invalidating all timelines", v4, 2u);
  }

  dispatch_time_t v3 = [*(id *)(a1 + 32) backlightSceneEnvironment];
  [v3 invalidateAllTimelinesForReason:@"now playing state changed"];
}

- (void)updateDimmed
{
  [(MRUNowPlayingViewController *)self invalidateAllTimelinesForReason:@"backlight luminance changed"];
  [(MRUNowPlayingViewController *)self updateVisibility];

  [(MRUNowPlayingViewController *)self updateTimeControls];
}

- (void)createRoutingViewController
{
  if (!self->_routeControlsPresentation)
  {
    dispatch_time_t v3 = NSString;
    id v4 = (objc_class *)objc_opt_class();
    uint64_t v5 = NSStringFromClass(v4);
    dispatch_time_t v6 = [v3 stringWithFormat:@"%@(devices)", v5];

    uint64_t v7 = dispatch_get_global_queue(25, 0);
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke;
    block[3] = &unk_1E5F0D870;
    objc_copyWeak(&v11, &location);
    id v10 = v6;
    id v8 = v6;
    dispatch_async(v7, block);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

void __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    dispatch_time_t v3 = objc_alloc_init(MRUOutputDeviceRoutingDataSource);
    id v4 = [WeakRetained controller];
    uint64_t v5 = [v4 endpointController];
    dispatch_time_t v6 = [v5 route];
    [(MRUOutputDeviceRoutingDataSource *)v3 setEndpointRoute:v6];

    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      uint64_t v7 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      [(MRUOutputDeviceRoutingDataSource *)v3 setRoutingContextUID:v7];
    }
    [(MRUOutputDeviceRoutingDataSource *)v3 setSupportsMultipleSelection:1];
    [(MPAVRoutingDataSource *)v3 setFilterMode:0];
    [(MRUOutputDeviceRoutingDataSource *)v3 setInitiator:*MEMORY[0x1E4F49EE0]];
    [(MRUOutputDeviceRoutingDataSource *)v3 setDetachesRoutesToGroup:1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke_2;
    block[3] = &unk_1E5F0DC48;
    id v10 = v3;
    id v11 = *(id *)(a1 + 32);
    id v12 = WeakRetained;
    id v8 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

void __58__MRUNowPlayingViewController_createRoutingViewController__block_invoke_2(uint64_t a1)
{
  id v4 = (id)[objc_alloc(MEMORY[0x1E4F31850]) initWithDataSource:*(void *)(a1 + 32) name:*(void *)(a1 + 40)];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 1104));
  [v4 setPlaybackDataSource:WeakRetained];

  dispatch_time_t v3 = [[MRURoutingViewController alloc] initWithRoutingController:v4];
  [*(id *)(a1 + 48) setRoutingViewController:v3];
  [*(id *)(a1 + 32) setHearingAidDelegate:v3];
}

- (void)createSuggestionsViewController
{
  dispatch_time_t v3 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
  id v10 = [v3 mediaSuggestions];

  id v4 = [[MRUMediaSuggestionsViewController alloc] initWithMediaSuggestions:v10];
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v4;

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setDelegate:self];
  dispatch_time_t v6 = [(MRUNowPlayingViewController *)self view];
  -[MRUMediaSuggestionsViewController setLayout:](self->_suggestionsViewController, "setLayout:", [v6 layout] == 4);

  uint64_t v7 = [(MRUNowPlayingViewController *)self stylingProvider];
  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setStylingProvider:v7];

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setSupportsHorizontalLayout:self->_supportsHorizontalLayout];
  -[MRUMediaSuggestionsViewController setContentEdgeInsets:](self->_suggestionsViewController, "setContentEdgeInsets:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.left, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.right);
  [(MRUNowPlayingViewController *)self addChildViewController:self->_suggestionsViewController];
  id v8 = [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController view];
  id v9 = [(MRUNowPlayingViewController *)self view];
  [v9 setSuggestionsView:v8];

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController didMoveToParentViewController:self];
}

- (void)updateRoutingContentEdgeInsets
{
  if (self->_supportsHorizontalLayout
    && ([(MRUNowPlayingViewController *)self view],
        dispatch_time_t v3 = objc_claimAutoreleasedReturnValue(),
        BOOL ShouldBeVertical = MRULayoutShouldBeVertical(),
        v3,
        !ShouldBeVertical))
  {
    double v8 = 13.0;
    routingViewController = self->_routingViewController;
    double left = self->_contentEdgeInsets.left;
    double right = self->_contentEdgeInsets.right;
  }
  else
  {
    double left = self->_contentEdgeInsets.left;
    routingViewController = self->_routingViewController;
    double right = self->_contentEdgeInsets.right;
    double v8 = 0.0;
  }

  -[MRURoutingViewController setContentEdgeInsets:](routingViewController, "setContentEdgeInsets:", v8, left, 13.0, right);
}

- (void)updateRoutingDiscoveryMode
{
  if ([(MRUNowPlayingViewController *)self isOnScreen])
  {
    if ([(MRUNowPlayingViewController *)self layout] == 1) {
      uint64_t v3 = 3;
    }
    else {
      uint64_t v3 = 1;
    }
  }
  else
  {
    uint64_t v3 = 1;
  }
  routingViewController = self->_routingViewController;

  [(MRURoutingViewController *)routingViewController setDiscoveryMode:v3];
}

- (void)updateArtwork
{
  if ([(MRUNowPlayingViewController *)self showArtworkView])
  {
    uint64_t v3 = [(MRUNowPlayingController *)self->_controller metadataController];
    id v6 = [v3 artwork];

    id v4 = [(MRUNowPlayingViewController *)self view];
    uint64_t v5 = [v4 artworkView];

    [v5 setArtwork:v6];
  }
}

- (void)updateRouteLabel
{
  uint64_t v3 = [(MRUNowPlayingViewController *)self view];
  id v4 = [v3 artworkView];

  uint64_t v5 = [(MRUNowPlayingViewController *)self view];
  id v6 = [v5 headerView];
  uint64_t v7 = [v6 labelView];

  double v8 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v9 = [v8 route];

  id v10 = (void *)MEMORY[0x1E4FB1818];
  id v11 = [(MRUNowPlayingController *)self->_controller deviceSymbolName];
  id v12 = [v10 _systemImageNamed:v11];
  [v4 setPlaceholderImage:v12];

  [v7 setRoute:v9];
  int v13 = [(MRUNowPlayingViewController *)self showRouteLabel];
  if (v13 != [v7 showRoute])
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __47__MRUNowPlayingViewController_updateRouteLabel__block_invoke;
    v14[3] = &unk_1E5F0D8C0;
    id v15 = v7;
    char v16 = v13;
    [(MRUNowPlayingViewController *)self updateContentAnimated:v14 completion:0];
  }
}

uint64_t __47__MRUNowPlayingViewController_updateRouteLabel__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) setShowRoute:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateNowPlayingInfo
{
  uint64_t v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v4 = [v3 nowPlayingInfo];

  uint64_t v5 = [(MRUNowPlayingViewController *)self view];
  id v6 = [v5 headerView];
  uint64_t v7 = [v6 labelView];

  double v8 = [(MRUNowPlayingController *)self->_controller endpointController];
  if (([v8 isEndpointDiscovered] & 1) != 0
    || [(MRUNowPlayingViewController *)self context] != 3)
  {
    uint64_t v9 = [v4 placeholder];
  }
  else
  {
    uint64_t v9 = +[MRUStringsProvider controlsUnavailable];
  }
  id v10 = (void *)v9;
  [v7 setPlaceholder:v9];

  unint64_t layout = self->_layout;
  if (layout > 4)
  {
    uint64_t v13 = 58;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = qword_1AE963DC8[layout];
    uint64_t v13 = qword_1AE963DF0[layout];
  }
  id v14 = [v4 stringForComponents:v12];
  [v7 setTitle:v14];

  id v15 = [v4 stringForComponents:v13];
  [v7 setSubtitle:v15];

  int v16 = self->_layout != 3 || self->_context == 3;
  int v17 = [v4 showPlaceholder];
  if (v17 != [v7 showPlaceholder] || v16 != objc_msgSend(v7, "showSubtitle"))
  {
    uint64_t v19 = MEMORY[0x1E4F143A8];
    uint64_t v20 = 3221225472;
    double v21 = __51__MRUNowPlayingViewController_updateNowPlayingInfo__block_invoke;
    double v22 = &unk_1E5F0F588;
    id v23 = v7;
    char v24 = v17;
    char v25 = v16;
    [(MRUNowPlayingViewController *)self updateContentAnimated:&v19 completion:0];
  }
  uint64_t v18 = [(MRUNowPlayingViewController *)self view];
  [v18 setNeedsLayout];
}

uint64_t __51__MRUNowPlayingViewController_updateNowPlayingInfo__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowPlaceholder:*(unsigned __int8 *)(a1 + 40)];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 41);
  uint64_t v3 = *(void **)(a1 + 32);

  return [v3 setShowSubtitle:v2];
}

- (void)updateTimeControlsForPresentationInterval:(id)a3
{
  controller = self->_controller;
  id v5 = a3;
  id v6 = [(MRUNowPlayingController *)controller metadataController];
  id v9 = [v6 timeControls];

  uint64_t v7 = [(MRUNowPlayingViewController *)self view];
  double v8 = [v7 timeControlsView];

  [v8 setTimeControls:v9 forPresentationInterval:v5];
}

- (void)updateTimeControls
{
}

- (void)updateTransportControls
{
  uint64_t v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v7 = [v3 transportControls];

  id v4 = [(MRUNowPlayingViewController *)self view];
  id v5 = [v4 transportControlsView];

  [v5 setTransportControls:v7];
  id v6 = [(MRUNowPlayingController *)self->_controller tvRemoteController];
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));
}

- (void)updateQuickControl
{
  uint64_t v3 = [(MRUNowPlayingViewController *)self view];
  id v7 = [v3 headerView];

  id v4 = [(MRUNowPlayingController *)self->_controller quickControlItem];
  objc_msgSend(v7, "setShowTransportButton:", objc_msgSend(v4, "isEnabled"));
  id v5 = [v7 transportButton];
  id v6 = [v4 asset];
  [v5 setAsset:v6];
}

- (void)updateVolumeControls
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(MRUNowPlayingViewController *)self view];
  id v4 = [v3 volumeControlsView];

  id v5 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v6 = [v5 route];

  id v7 = [v4 volumeController];
  double v8 = [v7 dataSource];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v9 = [v4 volumeController];
    id v10 = [v9 dataSource];
  }
  else
  {
    id v10 = 0;
  }

  id v11 = [v4 volumeController];

  if (!v11)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v6 outputDeviceRoute:0];

    id v15 = [(MPVolumeController *)[MRUVolumeController alloc] initWithDataSource:v14];
    [v4 setVolumeController:v15];

    goto LABEL_8;
  }
  uint64_t v12 = [v10 groupRoute];
  char v13 = [v12 isEqual:v6];

  if ((v13 & 1) == 0)
  {
    uint64_t v14 = [objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v6 outputDeviceRoute:0];

    [v4 setDataSource:v14];
LABEL_8:
    id v10 = (void *)v14;
  }
  if (!self->_volumeGroupCoordinator && !self->_routeControlsPresentation)
  {
    int v16 = [MRUVolumeGroupCoordinator alloc];
    int v17 = [v4 volumeController];
    uint64_t v18 = [(MRUVolumeGroupCoordinator *)v16 initWithMainVolumeController:v17];
    volumeGroupCoordinator = self->_volumeGroupCoordinator;
    self->_volumeGroupCoordinator = v18;

    [v4 setVolumeGroupCoordinator:self->_volumeGroupCoordinator];
    [(MRURoutingViewController *)self->_routingViewController setVolumeGroupCoordinator:self->_volumeGroupCoordinator];
  }
  if ([(MRUNowPlayingViewController *)self context] == 2
    || [(MRUNowPlayingViewController *)self context] == 8)
  {
    uint64_t v20 = [(MRUNowPlayingController *)self->_controller endpointController];
    if ([v20 isDeviceSystemRoute])
    {
      double v21 = [(MRUNowPlayingController *)self->_controller endpointController];
      if ([v21 isAirPlaying])
      {
        int v22 = 1;
      }
      else
      {
        id v23 = [MEMORY[0x1E4F77108] currentSettings];
        int v22 = [v23 alwaysShowVolumeControls];
      }
    }
    else
    {
      int v22 = 1;
    }
  }
  else
  {
    int v22 = 1;
  }
  uint64_t v24 = 0;
  if (self->_onScreen && v22)
  {
    int64_t layout = self->_layout;
    if (layout) {
      BOOL v26 = layout == 3;
    }
    else {
      BOOL v26 = 1;
    }
    uint64_t v24 = !v26;
  }
  double v27 = +[MRUCallMonitor sharedMonitor];
  int v28 = [v27 isOnCall];

  char v29 = [v10 volumeControlCapabilities];
  if (+[MRUFeatureFlagProvider isAutobahnEnabled])
  {
    [(MRUNowPlayingViewController *)self view];
    objc_super v31 = v30 = v6;
    [v31 volumeControlsView];
    v33 = double v32 = v4;
    [v33 setOnScreen:v24];

    double v34 = [(MRUNowPlayingViewController *)self view];
    LODWORD(v33) = [v34 showVolumeControlsView];

    id v6 = v30;
    BOOL v26 = v22 == v33;
    id v4 = v32;
    if (!v26)
    {
      v53[0] = MEMORY[0x1E4F143A8];
      v53[1] = 3221225472;
      v53[2] = __51__MRUNowPlayingViewController_updateVolumeControls__block_invoke;
      v53[3] = &unk_1E5F0D8C0;
      v53[4] = self;
      char v54 = v22;
      [(MRUNowPlayingViewController *)self updateContentAnimated:v53 completion:0];
    }
  }
  if (((v24 ^ 1 | v28) & 1) == 0 && ([v6 isDeviceRoute] & 1) == 0 && (v29 & 3) != 0)
  {
    double v35 = MCLogCategoryVolume();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v36 = objc_opt_class();
      double v37 = MRUNowPlayingLayoutDescription(self->_layout);
      MRUNowPlayingContextDescription(self->_context);
      v39 = double v38 = v6;
      *(_DWORD *)buf = 138545154;
      uint64_t v56 = v36;
      __int16 v57 = 1024;
      int v58 = 1;
      __int16 v59 = 1024;
      int v60 = v22;
      __int16 v61 = 1024;
      int v62 = 0;
      __int16 v63 = 1024;
      *(_DWORD *)v64 = 1;
      *(_WORD *)&v64[4] = 2114;
      *(void *)&v64[6] = v37;
      *(_WORD *)&v64[14] = 2114;
      *(void *)&v64[16] = v39;
      *(_WORD *)&v64[24] = 2114;
      *(void *)&v64[26] = v38;
      _os_log_impl(&dword_1AE7DF000, v35, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | control: %{BOOL}u | layout: %{public}@ | context: %{public}@ | route: %{public}@", buf, 0x42u);

      id v6 = v38;
    }

    v40 = +[MRUHardwareVolumeController sharedInstance];
    v41 = (objc_class *)objc_opt_class();
    v42 = NSStringFromClass(v41);
    v43 = [v40 requestControlsForVolumeDataSource:v10 reason:v42];
    hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = v43;

LABEL_43:
    goto LABEL_44;
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    v45 = MCLogCategoryVolume();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
    {
      int v51 = v22;
      int v46 = v10;
      v47 = v6;
      uint64_t v48 = objc_opt_class();
      MRUNowPlayingLayoutDescription(self->_layout);
      v49 = v52 = v4;
      v50 = MRUNowPlayingContextDescription(self->_context);
      *(_DWORD *)buf = 138544898;
      uint64_t v56 = v48;
      id v6 = v47;
      id v10 = v46;
      __int16 v57 = 1024;
      int v58 = v24;
      __int16 v59 = 1024;
      int v60 = v51;
      __int16 v61 = 1024;
      int v62 = v28;
      __int16 v63 = 2114;
      *(void *)v64 = v49;
      *(_WORD *)&v64[8] = 2114;
      *(void *)&v64[10] = v50;
      *(_WORD *)&v64[18] = 2114;
      *(void *)&v64[20] = v6;
      _os_log_impl(&dword_1AE7DF000, v45, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | layout: %{public}@ | context: %{public}@ | route: %{public}@", buf, 0x3Cu);

      id v4 = v52;
    }

    v40 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_43;
  }
LABEL_44:
}

void __51__MRUNowPlayingViewController_updateVolumeControls__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setShowVolumeControlsView:v1];
}

- (void)updateRoutingButton
{
}

- (void)updateRoutingButtonAnimated:(BOOL)a3
{
  v25[2] = *MEMORY[0x1E4F143B8];
  id v5 = [(MRUNowPlayingViewController *)self view];
  id v6 = [v5 headerView];

  id v7 = [(MRUNowPlayingViewController *)self view];
  double v8 = [v7 transportControlsView];

  id v9 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v10 = [v9 route];
  uint64_t v11 = [v10 canModifyGroupMembership];

  BOOL v12 = v11 && self->_context == 3 && self->_layout == 3;
  [v6 setShowRoutingButton:v12];
  [v8 setShowRoutingButton:v11];
  char v13 = [v8 routingButton];
  v25[0] = v13;
  uint64_t v14 = [v6 routingButton];
  v25[1] = v14;
  id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];

  id configureRoutingButton = (void (**)(id, uint64_t))self->_configureRoutingButton;
  if (configureRoutingButton)
  {
    int v17 = configureRoutingButton[2](configureRoutingButton, v11);
    uint64_t v18 = [v15 arrayByAddingObject:v17];

    id v15 = (void *)v18;
  }
  controller = self->_controller;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __59__MRUNowPlayingViewController_updateRoutingButtonAnimated___block_invoke;
  v21[3] = &unk_1E5F0F5B0;
  id v22 = v15;
  id v23 = self;
  BOOL v24 = a3;
  id v20 = v15;
  [(MRUNowPlayingController *)controller routingDeviceImage:v21];
}

void __59__MRUNowPlayingViewController_updateRoutingButtonAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[MRUAsset image:a2];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if (objc_msgSend(*(id *)(a1 + 40), "isOnScreen", (void)v11)) {
          BOOL v10 = *(unsigned char *)(a1 + 48) != 0;
        }
        else {
          BOOL v10 = 0;
        }
        [v9 setAsset:v3 animated:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

- (BOOL)showRouteLabel
{
  int64_t layout = self->_layout;
  if (!layout) {
    return 0;
  }
  if (layout == 2) {
    return self->_context != 3;
  }
  if (layout != 4 || [(MRUNowPlayingViewController *)self context] != 2) {
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

- (void)updateLayout
{
  if ([(MRUNowPlayingViewController *)self isViewLoaded])
  {
    id v5 = [(MRUNowPlayingController *)self->_controller endpointController];
    uint64_t v3 = [v5 route];
    if ([v3 canModifyGroupMembership])
    {
    }
    else
    {
      int64_t v4 = [(MRUNowPlayingViewController *)self layout];

      if (v4 == 1)
      {
        [(MRUNowPlayingViewController *)self setLayout:2];
      }
    }
  }
}

- (void)updateVisibility
{
  BOOL onScreen = self->_onScreen;
  int64_t v4 = [(MRUNowPlayingViewController *)self view];
  [v4 setOnScreen:onScreen];

  BOOL dimmed = self->_dimmed;
  char v6 = [(MRUNowPlayingViewController *)self view];
  [v6 setDimmed:dimmed];

  int64_t layout = self->_layout;
  if (layout) {
    BOOL v8 = layout == 3;
  }
  else {
    BOOL v8 = 1;
  }
  uint64_t v9 = !v8;
  BOOL v10 = [(MRUNowPlayingViewController *)self view];
  long long v11 = [v10 artworkView];
  [v11 setEnabled:v9];

  int64_t v12 = self->_layout;
  if (v12) {
    BOOL v13 = v12 == 3;
  }
  else {
    BOOL v13 = 1;
  }
  uint64_t v14 = !v13;
  id v15 = [(MRUNowPlayingViewController *)self view];
  uint64_t v16 = [v15 headerView];
  int v17 = [v16 labelView];
  [v17 setEnabled:v14];

  BOOL v18 = self->_layout == 3;
  id v20 = [(MRUNowPlayingViewController *)self view];
  uint64_t v19 = [v20 artworkView];
  [v19 setShowPlaceholder:v18];
}

- (void)updateSuggestionContext
{
  if ([(MRUNowPlayingViewController *)self context] == 3)
  {
    uint64_t v3 = *MEMORY[0x1E4F76F90];
    int64_t v4 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
    [v4 setContext:v3];
  }
  uint64_t v5 = *MEMORY[0x1E4F76F98];
  id v6 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
  [v6 setContext:v5];
}

- (void)updateSuggestions
{
  int v3 = [(MRUNowPlayingViewController *)self shouldShowMediaSuggestions];
  objc_initWeak(&location, self);
  int64_t v4 = [(MRUNowPlayingViewController *)self view];
  int v5 = [v4 showSuggestionsView];

  if (v3 == v5)
  {
    if (v3)
    {
      id v6 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
      uint64_t v7 = [v6 mediaSuggestions];
      [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setMediaSuggestions:v7];
    }
  }
  else
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __48__MRUNowPlayingViewController_updateSuggestions__block_invoke;
    v11[3] = &unk_1E5F0DEF0;
    objc_copyWeak(&v12, &location);
    char v13 = v3;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__MRUNowPlayingViewController_updateSuggestions__block_invoke_2;
    void v8[3] = &unk_1E5F0DEF0;
    objc_copyWeak(&v9, &location);
    char v10 = v3;
    [(MRUNowPlayingViewController *)self updateContentAnimated:v11 completion:v8];
    objc_destroyWeak(&v9);
    objc_destroyWeak(&v12);
  }
  objc_destroyWeak(&location);
}

void __48__MRUNowPlayingViewController_updateSuggestions__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (*(unsigned char *)(a1 + 40))
  {
    [WeakRetained createSuggestionsViewController];
    id WeakRetained = v7;
  }
  int v3 = [WeakRetained suggestionsViewController];
  [v3 beginAppearanceTransition:*(unsigned __int8 *)(a1 + 40) animated:0];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 40);
  int v5 = [v7 view];
  [v5 setShowSuggestionsView:v4];

  id v6 = [v7 suggestionsViewController];
  [v6 endAppearanceTransition];
}

void __48__MRUNowPlayingViewController_updateSuggestions__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained trackStartedShowingMediaSuggestions];
  if (!*(unsigned char *)(a1 + 40))
  {
    id v2 = [WeakRetained suggestionsViewController];
    [v2 willMoveToParentViewController:0];

    int v3 = [WeakRetained view];
    [v3 setSuggestionsView:0];

    uint64_t v4 = [WeakRetained suggestionsViewController];
    [v4 removeFromParentViewController];

    [WeakRetained setSuggestionsViewController:0];
  }
}

- (BOOL)shouldShowMediaSuggestions
{
  int64_t layout = self->_layout;
  BOOL v3 = layout == 4 || layout == 2;
  if (v3 && self->_context != 7)
  {
    id v6 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
    id v7 = [v6 mediaSuggestions];
    if (v7)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      char v5 = objc_opt_respondsToSelector();
    }
    else
    {
      char v5 = 0;
    }
  }
  else
  {
    char v5 = 0;
  }
  return v5 & 1;
}

- (BOOL)isShowingMediaSuggestions
{
  id v2 = [(MRUNowPlayingViewController *)self view];
  char v3 = [v2 showSuggestionsView];

  return v3;
}

- (void)trackStartedShowingMediaSuggestions
{
  if ([(MRUNowPlayingViewController *)self shouldShowMediaSuggestions]
    && [(MRUNowPlayingViewController *)self isOnScreen])
  {
    char v3 = [(MRUNowPlayingController *)self->_controller mediaSuggestionsController];
    id v4 = [v3 mediaSuggestions];

    [(MRUNowPlayingViewController *)self trackSuggestionsDisplayed:v4];
  }
}

- (void)presentRoutingControlsFromSourceView:(id)a3
{
  id v4 = a3;
  if (self->_routeControlsPresentation)
  {
    id WeakRetained = objc_alloc_init(MEMORY[0x1E4F31910]);
    if (!+[MRUFeatureFlagProvider isCayenneEnabled])
    {
      id v6 = [MEMORY[0x1E4F28B50] mainBundle];
      id v7 = [v6 bundleIdentifier];
      [WeakRetained setPresentingAppBundleID:v7];
    }
    [WeakRetained setStyle:2];
    if (MRAVOutputContextGetSharedAudioPresentationContext())
    {
      BOOL v8 = (void *)MRAVOutputContextCopyUniqueIdentifier();
      [WeakRetained setRoutingContextUID:v8];
    }
    if (self->_routeControlsPresentation == 2)
    {
      BOOL v9 = +[MRUFeatureFlagProvider isCayenneEnabled];
      char v10 = [(MRUNowPlayingController *)self->_controller endpointController];
      long long v11 = v10;
      if (v9)
      {
        id v12 = [v10 route];
        char v13 = [v12 designatedGroupLeaderRouteUID];
        [WeakRetained setRouteUID:v13];
      }
      else
      {
        id v12 = [v10 routeUID];
        [WeakRetained setRouteUID:v12];
      }
    }
    objc_initWeak(&location, self);
    if (objc_msgSend(MEMORY[0x1E4F28B50], "mru_isProximityControl"))
    {
      uint64_t v16 = objc_alloc_init(MRUViewServiceContainerViewController);
      [(MRUViewServiceContainerViewController *)v16 setConfiguration:WeakRetained];
      [(MRUViewServiceContainerViewController *)v16 setModalPresentationStyle:5];
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke;
      v29[3] = &unk_1E5F0DA00;
      objc_copyWeak(&v30, &location);
      [(MRUViewServiceContainerViewController *)v16 setDismissalBlock:v29];
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_2;
      v27[3] = &unk_1E5F0D7F8;
      int v17 = v16;
      int v28 = v17;
      [(MRUNowPlayingViewController *)self presentViewController:v17 animated:0 completion:v27];

      objc_destroyWeak(&v30);
    }
    else
    {
      BOOL v18 = (MPMediaControls *)[objc_alloc(MEMORY[0x1E4F31908]) initWithConfiguration:WeakRetained shouldObserveRoutingContextUIDChanges:0];
      mediaControls = self->_mediaControls;
      self->_mediaControls = v18;

      id v20 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v21 = [v20 userInterfaceIdiom];

      if ((v21 & 0xFFFFFFFFFFFFFFFBLL) == 1 && [(MRUNowPlayingViewController *)self context] != 2) {
        [(MPMediaControls *)self->_mediaControls setSourceView:v4];
      }
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      BOOL v24 = __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_3;
      char v25 = &unk_1E5F0DA00;
      objc_copyWeak(&v26, &location);
      [(MPMediaControls *)self->_mediaControls setDismissHandler:&v22];
      [(MPMediaControls *)self->_mediaControls present];
      objc_destroyWeak(&v26);
    }
    objc_destroyWeak(&location);
  }
  else
  {
    int64_t v14 = [(MRUNowPlayingViewController *)self layout];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (objc_opt_respondsToSelector())
    {
      if (v14 == 1) {
        uint64_t v15 = 2;
      }
      else {
        uint64_t v15 = 1;
      }
      [WeakRetained nowPlayingViewController:self applyLayout:v15];
    }
  }
}

void __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissViewControllerAnimated:0 completion:0];
}

uint64_t __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) transitionToVisible:1 animated:1];
}

void __68__MRUNowPlayingViewController_presentRoutingControlsFromSourceView___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMediaControls:0];
}

- (void)updateContentAnimated:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke;
  aBlock[3] = &unk_1E5F0E428;
  aBlock[4] = self;
  id v8 = v6;
  id v16 = v8;
  BOOL v9 = _Block_copy(aBlock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (objc_opt_respondsToSelector())
  {
    [WeakRetained nowPlayingViewController:self didChangeSizeWithAnimations:v9 completion:v7];
  }
  else
  {
    long long v11 = (void *)MEMORY[0x1E4FB1EB0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_3;
    v12[3] = &unk_1E5F0F5D8;
    id v13 = v9;
    id v14 = v7;
    objc_msgSend(v11, "mru_animateUsingType:animations:", 0, v12);
  }
}

void __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 bounds];
  if (v3 == 0.0)
  {

    goto LABEL_7;
  }
  id v4 = [*(id *)(a1 + 32) view];
  [v4 bounds];
  double v6 = v5;

  if (v6 == 0.0)
  {
LABEL_7:
    id v8 = (void *)MEMORY[0x1E4FB1EB0];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_2;
    v11[3] = &unk_1E5F0DFB8;
    id v9 = *(id *)(a1 + 40);
    void v11[4] = *(void *)(a1 + 32);
    id v12 = v9;
    [v8 performWithoutAnimation:v11];

    return;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v7 = [*(id *)(a1 + 32) view];
  [v7 setNeedsLayout];

  id v10 = [*(id *)(a1 + 32) view];
  [v10 layoutIfNeeded];
}

void __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

uint64_t __64__MRUNowPlayingViewController_updateContentAnimated_completion___block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)launchNowPlayingApp
{
  if (self->_coordinatedDismissalBlock)
  {
    id v3 = [(MRUNowPlayingController *)self->_controller endpointController];
    objc_initWeak(&location, v3);

    coordinatedDismissalBlock = (void (**)(id, void *))self->_coordinatedDismissalBlock;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__MRUNowPlayingViewController_launchNowPlayingApp__block_invoke;
    v6[3] = &unk_1E5F0DA00;
    objc_copyWeak(&v7, &location);
    coordinatedDismissalBlock[2](coordinatedDismissalBlock, v6);
    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
  else
  {
    id v5 = [(MRUNowPlayingController *)self->_controller endpointController];
    [v5 launchNowPlayingApp];
  }
}

void __50__MRUNowPlayingViewController_launchNowPlayingApp__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained launchNowPlayingApp];
}

- (id)_stateDumpObject
{
  v25[8] = *MEMORY[0x1E4F143B8];
  v24[0] = @"hardwareVolumeControlAssertion";
  uint64_t v3 = [(BSInvalidatable *)self->_hardwareVolumeControlAssertion description];
  id v4 = (void *)v3;
  if (v3) {
    id v5 = (__CFString *)v3;
  }
  else {
    id v5 = @"<NONE>";
  }
  v25[0] = v5;
  v24[1] = @"layout";
  uint64_t v6 = MRUNowPlayingLayoutDescription(self->_layout);
  id v7 = (void *)v6;
  if (v6) {
    id v8 = (__CFString *)v6;
  }
  else {
    id v8 = @"<NONE>";
  }
  v25[1] = v8;
  v24[2] = @"context";
  uint64_t v9 = MRUNowPlayingContextDescription(self->_context);
  id v10 = (void *)v9;
  if (v9) {
    long long v11 = (__CFString *)v9;
  }
  else {
    long long v11 = @"<NONE>";
  }
  v25[2] = v11;
  v24[3] = @"endpointController";
  uint64_t v12 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v13 = (void *)v12;
  if (v12) {
    id v14 = (__CFString *)v12;
  }
  else {
    id v14 = @"<NONE>";
  }
  controller = self->_controller;
  if (!controller) {
    controller = (MRUNowPlayingController *)@"<NONE>";
  }
  void v25[3] = v14;
  v25[4] = controller;
  v24[4] = @"dataController";
  v24[5] = @"routingViewController";
  routingViewController = self->_routingViewController;
  if (!routingViewController) {
    routingViewController = (MRURoutingViewController *)@"<NONE>";
  }
  mediaControls = self->_mediaControls;
  if (!mediaControls) {
    mediaControls = (MPMediaControls *)@"<NONE>";
  }
  v25[5] = routingViewController;
  v25[6] = mediaControls;
  v24[6] = @"mediaControls";
  v24[7] = @"window";
  BOOL v18 = [(MRUNowPlayingViewController *)self view];
  uint64_t v19 = [v18 window];
  id v20 = (void *)v19;
  if (v19) {
    uint64_t v21 = (__CFString *)v19;
  }
  else {
    uint64_t v21 = @"<NONE>";
  }
  v25[7] = v21;
  uint64_t v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:8];

  return v22;
}

- (MRUNowPlayingController)controller
{
  return self->_controller;
}

- (MRUNowPlayingViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRUNowPlayingViewControllerDelegate *)WeakRetained;
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

- (int64_t)context
{
  return self->_context;
}

- (BOOL)supportsHorizontalLayout
{
  return self->_supportsHorizontalLayout;
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
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

- (id)coordinatedDismissalBlock
{
  return self->_coordinatedDismissalBlock;
}

- (void)setCoordinatedDismissalBlock:(id)a3
{
}

- (MRUMediaSuggestionsViewController)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (void)setSuggestionsViewController:(id)a3
{
}

- (BOOL)isOnScreen
{
  return self->_onScreen;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (void)setDimmed:(BOOL)a3
{
  self->_BOOL dimmed = a3;
}

- (BOOL)isPlaying
{
  return self->_playing;
}

- (void)setPlaying:(BOOL)a3
{
  self->_playing = a3;
}

- (MRUVolumeGroupCoordinator)volumeGroupCoordinator
{
  return self->_volumeGroupCoordinator;
}

- (void)setVolumeGroupCoordinator:(id)a3
{
}

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
}

- (MPMediaControls)mediaControls
{
  return self->_mediaControls;
}

- (void)setMediaControls:(id)a3
{
}

- (unint64_t)stateHandle
{
  return self->_stateHandle;
}

- (void)setStateHandle:(unint64_t)a3
{
  self->_stateHandle = a3;
}

- (BOOL)pendingTimelineInvalidation
{
  return self->_pendingTimelineInvalidation;
}

- (void)setPendingTimelineInvalidation:(BOOL)a3
{
  self->_pendingTimelineInvalidation = a3;
}

- (MRUVisualStylingProvider)pendingVisualStylingProvider
{
  return self->_pendingVisualStylingProvider;
}

- (void)setPendingVisualStylingProvider:(id)a3
{
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

- (int64_t)routeControlsPresentation
{
  return self->_routeControlsPresentation;
}

- (MRURoutingViewController)routingViewController
{
  return self->_routingViewController;
}

- (MPAVOutputDevicePlaybackDataSource)playbackDataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playbackDataSource);

  return (MPAVOutputDevicePlaybackDataSource *)WeakRetained;
}

- (id)configureRoutingButton
{
  return self->_configureRoutingButton;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_configureRoutingButton, 0);
  objc_destroyWeak((id *)&self->_playbackDataSource);
  objc_storeStrong((id *)&self->_routingViewController, 0);
  objc_storeStrong((id *)&self->_pendingDimmed, 0);
  objc_storeStrong((id *)&self->_pendingVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_volumeGroupCoordinator, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong(&self->_coordinatedDismissalBlock, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_controller, 0);
}

@end