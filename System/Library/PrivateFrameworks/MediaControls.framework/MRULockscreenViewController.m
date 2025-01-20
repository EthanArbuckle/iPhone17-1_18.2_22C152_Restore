@interface MRULockscreenViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4;
- (BOOL)hasPendingTraitCollectionUpdates;
- (BOOL)isDimmed;
- (BOOL)isOnScreen;
- (BOOL)isShowingMediaSuggestions;
- (BOOL)lockScreenPresentsOverrideRoutePicker;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)pendingTimelineInvalidation;
- (BOOL)showArtworkView;
- (BSInvalidatable)hardwareVolumeControlAssertion;
- (MPMediaControls)mediaControls;
- (MRUArtworkView)artworkView;
- (MRUHapticViewController)hapticViewController;
- (MRULockscreenViewControllerDelegate)delegate;
- (MRUMediaSuggestionsViewController)suggestionsViewController;
- (MRUNowPlayingController)nowPlayingController;
- (MRUVisualStylingProvider)pendingVisualStylingProvider;
- (MRUVisualStylingProvider)stylingProvider;
- (MRUWaveformController)waveformController;
- (MRUWaveformViewController)waveformViewController;
- (NSArray)restrictedRects;
- (NSNumber)pendingDimmed;
- (id)_stateDumpObject;
- (id)_timelinesForDateInterval:(id)a3;
- (id)backlightSceneEnvironment;
- (int64_t)lockScreenInternalRoutePickerOverrideWithDefaultStyle:(int64_t)a3;
- (unint64_t)stateHandle;
- (void)_setStylingProvider:(id)a3;
- (void)_updateWithFrameSpecifier:(id)a3;
- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4;
- (void)createHapticViewController;
- (void)createNowPlayingController;
- (void)createSuggestionsViewController;
- (void)createWaveformViewController;
- (void)dealloc;
- (void)didSelectArtworkView:(id)a3;
- (void)didSelectLabelView:(id)a3;
- (void)invalidateAllTimelinesForReason:(id)a3;
- (void)loadView;
- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTimeControls:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTransportControls:(id)a5;
- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5;
- (void)registerHapticObserver;
- (void)schedulePendingTraitCollectionUpdates;
- (void)setDelegate:(id)a3;
- (void)setDimmed:(BOOL)a3;
- (void)setHapticViewController:(id)a3;
- (void)setHardwareVolumeControlAssertion:(id)a3;
- (void)setHasPendingTraitCollectionUpdates:(BOOL)a3;
- (void)setMediaControls:(id)a3;
- (void)setOnScreen:(BOOL)a3;
- (void)setPendingDimmed:(id)a3;
- (void)setPendingTimelineInvalidation:(BOOL)a3;
- (void)setPendingVisualStylingProvider:(id)a3;
- (void)setShowArtworkView:(BOOL)a3;
- (void)setShowArtworkView:(BOOL)a3 completion:(id)a4;
- (void)setStateHandle:(unint64_t)a3;
- (void)setStylingProvider:(id)a3;
- (void)setSuggestionsViewController:(id)a3;
- (void)setWaveformController:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4;
- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4;
- (void)updateArtwork;
- (void)updateDimmed;
- (void)updateEverything;
- (void)updateLayoutDependantProperties;
- (void)updateLayoutDependantPropertiesWithCompletion:(id)a3;
- (void)updateLayoutWithAnimations:(id)a3 completion:(id)a4;
- (void)updateNowPlayingInfo;
- (void)updatePreferredContentSize;
- (void)updateRestrictedRects;
- (void)updateRouteLabel;
- (void)updateRoutingButton;
- (void)updateRoutingButtonAnimated:(BOOL)a3;
- (void)updateSuggestions;
- (void)updateTimeControls;
- (void)updateTimeControlsForPresentationInterval:(id)a3;
- (void)updateTransportControls;
- (void)updateVisibility;
- (void)updateVisualStyling;
- (void)updateVolumeControls;
- (void)updateWaveformVisibility;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)volumeControlsView:(id)a3 volumeValueDidChange:(float)a4;
@end

@implementation MRULockscreenViewController

- (void)loadView
{
  v3 = objc_alloc_init(MRULockscreenView);
  [(MRULockscreenViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v23[1] = *MEMORY[0x1E4F143B8];
  v21.receiver = self;
  v21.super_class = (Class)MRULockscreenViewController;
  [(MRULockscreenViewController *)&v21 viewDidLoad];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __42__MRULockscreenViewController_viewDidLoad__block_invoke;
  v20[3] = &unk_1E5F0DEA0;
  v20[4] = self;
  self->_stateHandle = __42__MRULockscreenViewController_viewDidLoad__block_invoke((uint64_t)v20);
  v3 = [(MRULockscreenViewController *)self view];
  objc_msgSend(v3, "setContentEdgeInsets:", 14.0, 14.0, 14.0, 14.0);

  self->_showArtworkView = 1;
  v4 = [(MRULockscreenViewController *)self view];
  v5 = [v4 artworkView];
  [v5 addObserver:self];

  v6 = [(MRULockscreenViewController *)self view];
  v7 = [v6 artworkView];
  [v7 addTarget:self action:sel_didSelectArtworkView_ forControlEvents:64];

  v8 = [(MRULockscreenViewController *)self view];
  v9 = [v8 headerView];
  v10 = [v9 labelView];
  [v10 addTarget:self action:sel_didSelectLabelView_ forControlEvents:64];

  v11 = [(MRULockscreenViewController *)self view];
  v12 = [v11 transportControlsView];
  [v12 setDelegate:self];

  v13 = [(MRULockscreenViewController *)self view];
  v14 = [v13 volumeControlsView];
  [v14 setDelegate:self];

  v23[0] = objc_opt_class();
  v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];
  id v16 = (id)[(MRULockscreenViewController *)self registerForTraitChanges:v15 withAction:sel_updateVisualStyling];

  uint64_t v22 = objc_opt_class();
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
  id v18 = (id)[(MRULockscreenViewController *)self registerForTraitChanges:v17 withAction:sel_updatePreferredContentSize];

  v19 = +[MRUCallMonitor sharedMonitor];
  [v19 addObserver:self];

  [(MRULockscreenViewController *)self createNowPlayingController];
  [(MRULockscreenViewController *)self createWaveformViewController];
  [(MRULockscreenViewController *)self createHapticViewController];
  [(MRULockscreenViewController *)self registerHapticObserver];
  [(MRULockscreenViewController *)self updateEverything];
}

uint64_t __42__MRULockscreenViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  objc_initWeak(&location, *(id *)(a1 + 32));
  v2 = [NSString stringWithFormat:@"%@: %p", objc_opt_class(), *(void *)(a1 + 32)];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __42__MRULockscreenViewController_viewDidLoad__block_invoke_2;
  v5[3] = &unk_1E5F0DE78;
  objc_copyWeak(&v6, &location);
  uint64_t v3 = MCLogAddStateHandlerWithName(v2, v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
  return v3;
}

id __42__MRULockscreenViewController_viewDidLoad__block_invoke_2(uint64_t a1, uint64_t a2)
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

- (void)viewWillAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRULockscreenViewController;
  [(MRULockscreenViewController *)&v4 viewWillAppear:a3];
  [(MRULockscreenViewController *)self setOnScreen:1];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)MRULockscreenViewController;
  [(MRULockscreenViewController *)&v4 viewWillDisappear:a3];
  [(MRULockscreenViewController *)self setOnScreen:0];
}

- (void)dealloc
{
  os_state_remove_handler();
  [(MRUNowPlayingController *)self->_nowPlayingController updateAutomaticResponseLoading];
  v3.receiver = self;
  v3.super_class = (Class)MRULockscreenViewController;
  [(MRULockscreenViewController *)&v3 dealloc];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)MRULockscreenViewController;
  [(MRULockscreenViewController *)&v3 viewDidLayoutSubviews];
  [(MRULockscreenViewController *)self updateRestrictedRects];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)setOnScreen:(BOOL)a3
{
  if (self->_onScreen != a3)
  {
    BOOL v3 = a3;
    self->_onScreen = a3;
    v5 = [(MRULockscreenViewController *)self nowPlayingController];
    [v5 updateAutomaticResponseLoading];

    id v6 = [(MRULockscreenViewController *)self nowPlayingController];
    v7 = [v6 mediaSuggestionsController];
    [v7 refreshMediaSuggestions];

    v8 = [(MRULockscreenViewController *)self view];
    [v8 setOnScreen:v3];

    [(MRULockscreenViewController *)self updateEverything];
  }
}

- (MRUNowPlayingController)nowPlayingController
{
  nowPlayingController = self->_nowPlayingController;
  if (!nowPlayingController)
  {
    [(MRULockscreenViewController *)self createNowPlayingController];
    nowPlayingController = self->_nowPlayingController;
  }

  return nowPlayingController;
}

- (MRUArtworkView)artworkView
{
  v2 = [(MRULockscreenViewController *)self view];
  BOOL v3 = [v2 artworkView];

  return (MRUArtworkView *)v3;
}

- (BOOL)isShowingMediaSuggestions
{
  v2 = [(MRULockscreenViewController *)self view];
  char v3 = [v2 showSuggestionsView];

  return v3;
}

- (void)_setStylingProvider:(id)a3
{
  p_stylingProvider = &self->_stylingProvider;
  v8 = (MRUVisualStylingProvider *)a3;
  if (*p_stylingProvider != v8)
  {
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    [(MRUVisualStylingProvider *)*p_stylingProvider setTraitChangeObservable:self];
    id v6 = [(MRULockscreenViewController *)self viewIfLoaded];
    [v6 setStylingProvider:v8];

    v7 = [(MRULockscreenViewController *)self suggestionsViewController];
    [v7 setStylingProvider:v8];
  }
}

- (void)setStylingProvider:(id)a3
{
  [(MRULockscreenViewController *)self setPendingVisualStylingProvider:a3];

  [(MRULockscreenViewController *)self schedulePendingTraitCollectionUpdates];
}

- (void)setShowArtworkView:(BOOL)a3
{
}

- (void)setShowArtworkView:(BOOL)a3 completion:(id)a4
{
  if (self->_showArtworkView != a3)
  {
    self->_showArtworkView = a3;
    id v5 = a4;
    [(MRULockscreenViewController *)self updateArtwork];
    [(MRULockscreenViewController *)self updateLayoutDependantPropertiesWithCompletion:v5];
  }
}

- (NSArray)restrictedRects
{
  char v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:4];
  objc_super v4 = [(MRULockscreenViewController *)self view];
  if ([v4 showSuggestionsView])
  {
    id v5 = [(MRULockscreenViewController *)self view];
    id v6 = [v5 suggestionsView];

    if (!v6) {
      goto LABEL_5;
    }
    v7 = [(MRULockscreenViewController *)self view];
    v8 = [v7 suggestionsView];
    [v8 frame];
    double v10 = v9;
    double v12 = v11;
    double v14 = v13;
    double v16 = v15;

    objc_super v4 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v10, v12, v14, v16);
    [v3 addObject:v4];
  }

LABEL_5:
  v17 = [(MRULockscreenViewController *)self view];
  int v18 = [v17 showArtworkView];

  if (v18)
  {
    v19 = [(MRULockscreenViewController *)self view];
    v20 = [v19 artworkView];
    [v20 frame];
    double v22 = v21;
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;

    v29 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v22, v24, v26, v28);
    [v3 addObject:v29];
  }
  v30 = [(MRULockscreenViewController *)self view];
  v31 = [v30 headerView];
  [v31 frame];
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  double v39 = v38;

  v40 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:", v33, v35, v37, v39);
  [v3 addObject:v40];

  v41 = [(MRULockscreenViewController *)self view];
  v42 = [v41 timeControlsView];
  [v42 frame];

  UIRectInset();
  v43 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
  [v3 addObject:v43];

  v44 = [(MRULockscreenViewController *)self view];
  v45 = [v44 transportControlsView];
  [v45 frame];

  UIRectInset();
  v46 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
  [v3 addObject:v46];

  v47 = [(MRULockscreenViewController *)self view];
  LODWORD(v45) = [v47 showVolumeControlsView];

  if (v45)
  {
    v48 = [(MRULockscreenViewController *)self view];
    v49 = [v48 volumeControlsView];
    [v49 frame];

    UIRectInset();
    v50 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRect:");
    [v3 addObject:v50];
  }
  v51 = (void *)[v3 copy];

  return (NSArray *)v51;
}

- (void)didSelectArtworkView:(id)a3
{
  id v4 = a3;
  id v5 = [(MRULockscreenViewController *)self delegate];
  char v6 = [v5 lockscreenViewController:self didSelectArtworkView:v4];

  if ((v6 & 1) == 0)
  {
    id v7 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
    [v7 launchNowPlayingApp];
  }
}

- (void)didSelectLabelView:(id)a3
{
  id v3 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  [v3 launchNowPlayingApp];
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_onScreen;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  [(MRULockscreenViewController *)self updateRouteLabel];
  [(MRULockscreenViewController *)self updateVolumeControls];
  [(MRULockscreenViewController *)self updateWaveformVisibility];
  [(MRULockscreenViewController *)self updateRoutingButtonAnimated:1];

  [(MRULockscreenViewController *)self invalidateAllTimelinesForReason:@"route changed"];
}

- (void)nowPlayingController:(id)a3 tvRemoteController:(id)a4 didChangeShowTVRemote:(BOOL)a5
{
  uint64_t v6 = objc_msgSend(a4, "showTVRemote", a3);
  id v8 = [(MRULockscreenViewController *)self view];
  id v7 = [v8 transportControlsView];
  [v7 setShowTVRemoteButton:v6];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeNowPlayingInfo:(id)a5
{
  [(MRULockscreenViewController *)self updateNowPlayingInfo];

  [(MRULockscreenViewController *)self invalidateAllTimelinesForReason:@"now playing info changed"];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTimeControls:(id)a5
{
  [(MRULockscreenViewController *)self updateTimeControls];

  [(MRULockscreenViewController *)self invalidateAllTimelinesForReason:@"time controls changed"];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeTransportControls:(id)a5
{
  [(MRULockscreenViewController *)self updateTransportControls];

  [(MRULockscreenViewController *)self invalidateAllTimelinesForReason:@"transport controls changed"];
}

- (void)mediaSuggestionsViewController:(id)a3 didSelectSuggestion:(id)a4 completion:(id)a5
{
  id v7 = a5;
  nowPlayingController = self->_nowPlayingController;
  id v9 = a4;
  double v10 = [(MRUNowPlayingController *)nowPlayingController mediaSuggestionsController];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __93__MRULockscreenViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke;
  v12[3] = &unk_1E5F0DEC8;
  id v13 = v7;
  id v11 = v7;
  [v10 playSuggestion:v9 completion:v12];
}

uint64_t __93__MRULockscreenViewController_mediaSuggestionsViewController_didSelectSuggestion_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  id v4 = [(MRUNowPlayingController *)self->_nowPlayingController tvRemoteController];
  [v4 presentTVRemoteUsingApp:0];
}

- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F31910]);
  if (!+[MRUFeatureFlagProvider isCayenneEnabled])
  {
    id v9 = [MEMORY[0x1E4F28B50] mainBundle];
    double v10 = [v9 bundleIdentifier];
    [v8 setPresentingAppBundleID:v10];

    id v11 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
    double v12 = [v11 routeUID];
    [v8 setRouteUID:v12];
  }
  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    id v13 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    [v8 setRoutingContextUID:v13];
  }
  if ([(MRULockscreenViewController *)self lockScreenPresentsOverrideRoutePicker])
  {
    int64_t v14 = [(MRULockscreenViewController *)self lockScreenInternalRoutePickerOverrideWithDefaultStyle:2];
  }
  else
  {
    int64_t v14 = 2;
  }
  [v8 setStyle:v14];
  objc_initWeak(&location, self);
  double v15 = (MPMediaControls *)[objc_alloc(MEMORY[0x1E4F31908]) initWithConfiguration:v8 shouldObserveRoutingContextUIDChanges:0];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v15;

  uint64_t v17 = MEMORY[0x1E4F143A8];
  uint64_t v18 = 3221225472;
  v19 = __76__MRULockscreenViewController_transportControlsView_didSelectRoutingButton___block_invoke;
  v20 = &unk_1E5F0DA00;
  objc_copyWeak(&v21, &location);
  [(MPMediaControls *)self->_mediaControls setDismissHandler:&v17];
  [(MPMediaControls *)self->_mediaControls present];
  objc_destroyWeak(&v21);
  objc_destroyWeak(&location);
}

void __76__MRULockscreenViewController_transportControlsView_didSelectRoutingButton___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMediaControls:0];
}

- (void)volumeControlsView:(id)a3 volumeValueDidChange:(float)a4
{
}

- (void)artworkView:(id)a3 didChangeArtworkImage:(id)a4
{
}

- (void)registerHapticObserver
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel_handleHapticEnabledStatusChangedNotification_ name:*MEMORY[0x1E4F311F8] object:0];
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  return 1;
}

- (void)traitCollectionDidChange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MRULockscreenViewController;
  [(MRULockscreenViewController *)&v13 traitCollectionDidChange:v4];
  int v5 = objc_msgSend(v4, "mr_shouldDim");
  id v6 = [(MRULockscreenViewController *)self traitCollection];
  uint64_t v7 = objc_msgSend(v6, "mr_shouldDim");

  if (v5 != v7)
  {
    id v8 = MCLogCategoryDefault();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [v4 _backlightLuminance];
      double v10 = [(MRULockscreenViewController *)self traitCollection];
      uint64_t v11 = [v10 _backlightLuminance];
      *(_DWORD *)buf = 134218240;
      uint64_t v15 = v9;
      __int16 v16 = 2048;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1AE7DF000, v8, OS_LOG_TYPE_DEFAULT, "[AOD] Backlight luminance changed from %ld to %ld", buf, 0x16u);
    }
    double v12 = [NSNumber numberWithBool:v7];
    [(MRULockscreenViewController *)self setPendingDimmed:v12];

    [(MRULockscreenViewController *)self schedulePendingTraitCollectionUpdates];
  }
}

- (id)_timelinesForDateInterval:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_dimmed
    && ([(MRUNowPlayingController *)self->_nowPlayingController metadataController],
        int v5 = objc_claimAutoreleasedReturnValue(),
        [v5 nowPlayingInfo],
        id v6 = objc_claimAutoreleasedReturnValue(),
        int v7 = [v6 isPlaying],
        v6,
        v5,
        v7))
  {
    id v8 = [MEMORY[0x1E4F77108] currentSettings];
    [v8 flipBookUpdateInterval];
    uint64_t v10 = (uint64_t)(60.0 / v9);

    uint64_t v11 = [MEMORY[0x1E4F4F4B0] timelineWithPerMinuteUpdateFrequency:v10 identifier:@"aod-on" configure:0];
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F4F4B0] emptyTimelineWithIdentifier:@"aod-off"];
  }
  double v12 = (void *)v11;
  v15[0] = v11;
  objc_super v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];

  return v13;
}

- (void)_updateWithFrameSpecifier:(id)a3
{
  id v4 = [a3 presentationInterval];
  [(MRULockscreenViewController *)self updateTimeControlsForPresentationInterval:v4];
}

- (void)schedulePendingTraitCollectionUpdates
{
  if (![(MRULockscreenViewController *)self hasPendingTraitCollectionUpdates])
  {
    [(MRULockscreenViewController *)self setHasPendingTraitCollectionUpdates:1];
    dispatch_time_t v3 = dispatch_time(0, 100000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__MRULockscreenViewController_schedulePendingTraitCollectionUpdates__block_invoke;
    block[3] = &unk_1E5F0D7F8;
    block[4] = self;
    dispatch_after(v3, MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__MRULockscreenViewController_schedulePendingTraitCollectionUpdates__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) pendingDimmed];

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
    int v5 = *(void **)(a1 + 32);
    id v6 = [v5 pendingVisualStylingProvider];
    [v5 _setStylingProvider:v6];

    [*(id *)(a1 + 32) setPendingVisualStylingProvider:0];
  }
  int v7 = *(void **)(a1 + 32);

  return [v7 setHasPendingTraitCollectionUpdates:0];
}

- (id)backlightSceneEnvironment
{
  v2 = [(MRULockscreenViewController *)self view];
  dispatch_time_t v3 = [v2 window];
  id v4 = [v3 windowScene];
  int v5 = [v4 _backlightSceneEnvironment];

  return v5;
}

- (void)invalidateAllTimelinesForReason:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(MRULockscreenViewController *)self isDimmed])
  {
    int v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEFAULT, "[AOD] Enqueueing timeline invalidation because %@", buf, 0xCu);
    }

    if (![(MRULockscreenViewController *)self pendingTimelineInvalidation])
    {
      [(MRULockscreenViewController *)self setPendingTimelineInvalidation:1];
      dispatch_time_t v6 = dispatch_time(0, 500000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__MRULockscreenViewController_invalidateAllTimelinesForReason___block_invoke;
      block[3] = &unk_1E5F0D7F8;
      block[4] = self;
      dispatch_after(v6, MEMORY[0x1E4F14428], block);
    }
  }
}

void __63__MRULockscreenViewController_invalidateAllTimelinesForReason___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setPendingTimelineInvalidation:0];
  v2 = MCLogCategoryDefault();
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
  [(MRULockscreenViewController *)self invalidateAllTimelinesForReason:@"backlight luminance changed"];
  [(MRULockscreenViewController *)self updateVisibility];
  [(MRULockscreenViewController *)self updateTimeControls];

  [(MRULockscreenViewController *)self updateWaveformVisibility];
}

- (void)createNowPlayingController
{
  id v8 = +[MRUEndpointController proactiveUserSelectedEndpointController];
  dispatch_time_t v3 = [[MRUNowPlayingController alloc] initWithEndpointController:v8];
  nowPlayingController = self->_nowPlayingController;
  self->_nowPlayingController = v3;

  int v5 = [(MRUNowPlayingController *)self->_nowPlayingController tvRemoteController];
  [v5 setContext:2];

  uint64_t v6 = *MEMORY[0x1E4F76F98];
  int v7 = [(MRUNowPlayingController *)self->_nowPlayingController mediaSuggestionsController];
  [v7 setContext:v6];

  [(MRUNowPlayingController *)self->_nowPlayingController addObserver:self];
}

- (void)createWaveformViewController
{
  dispatch_time_t v3 = objc_alloc_init(MRUWaveformController);
  waveformController = self->_waveformController;
  self->_waveformController = v3;

  int v5 = [[MRUWaveformViewController alloc] initWithContext:1 waveformController:self->_waveformController];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  [(MRUWaveformController *)self->_waveformController setNowPlayingController:self->_nowPlayingController];
  [(MRULockscreenViewController *)self addChildViewController:self->_waveformViewController];
  int v7 = [(MRUWaveformViewController *)self->_waveformViewController view];
  id v8 = [(MRULockscreenViewController *)self view];
  id v9 = [v8 headerView];
  [v9 setWaveformView:v7];

  uint64_t v10 = self->_waveformViewController;

  [(MRUWaveformViewController *)v10 didMoveToParentViewController:self];
}

- (void)createHapticViewController
{
  dispatch_time_t v3 = [[MRUHapticViewController alloc] initWithContext:1 nowPlayingController:self->_nowPlayingController];
  hapticViewController = self->_hapticViewController;
  self->_hapticViewController = v3;

  [(MRULockscreenViewController *)self addChildViewController:self->_hapticViewController];
  int v5 = [(MRUHapticViewController *)self->_hapticViewController view];
  uint64_t v6 = [(MRULockscreenViewController *)self view];
  int v7 = [v6 headerView];
  [v7 setHapticView:v5];

  waveformViewController = self->_waveformViewController;

  [(MRUWaveformViewController *)waveformViewController didMoveToParentViewController:self];
}

- (void)createSuggestionsViewController
{
  dispatch_time_t v3 = [(MRUNowPlayingController *)self->_nowPlayingController mediaSuggestionsController];
  id v9 = [v3 mediaSuggestions];

  id v4 = [[MRUMediaSuggestionsViewController alloc] initWithMediaSuggestions:v9];
  suggestionsViewController = self->_suggestionsViewController;
  self->_suggestionsViewController = v4;

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setDelegate:self];
  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setLayout:1];
  uint64_t v6 = [(MRULockscreenViewController *)self stylingProvider];
  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setStylingProvider:v6];

  -[MRUMediaSuggestionsViewController setContentEdgeInsets:](self->_suggestionsViewController, "setContentEdgeInsets:", 14.0, 14.0, 14.0, 14.0);
  [(MRULockscreenViewController *)self addChildViewController:self->_suggestionsViewController];
  int v7 = [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController view];
  id v8 = [(MRULockscreenViewController *)self view];
  [v8 setSuggestionsView:v7];

  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController didMoveToParentViewController:self];
}

- (void)updateEverything
{
  [(MRULockscreenViewController *)self updateRouteLabel];
  [(MRULockscreenViewController *)self updateRoutingButton];
  [(MRULockscreenViewController *)self updateArtwork];
  [(MRULockscreenViewController *)self updateNowPlayingInfo];
  [(MRULockscreenViewController *)self updateTimeControls];
  [(MRULockscreenViewController *)self updateTransportControls];
  [(MRULockscreenViewController *)self updateSuggestions];
  [(MRULockscreenViewController *)self updateVolumeControls];
  [(MRULockscreenViewController *)self updateWaveformVisibility];
  [(MRULockscreenViewController *)self updateVisibility];
  [(MRULockscreenViewController *)self updateDimmed];
  [(MRULockscreenViewController *)self updatePreferredContentSize];
  [(MRULockscreenViewController *)self updateRestrictedRects];

  [(MRULockscreenViewController *)self updateVisualStyling];
}

- (void)updateArtwork
{
  if ([(MRULockscreenViewController *)self showArtworkView])
  {
    dispatch_time_t v3 = [(MRUNowPlayingController *)self->_nowPlayingController metadataController];
    id v6 = [v3 artwork];

    id v4 = [(MRULockscreenViewController *)self view];
    int v5 = [v4 artworkView];

    [v5 setArtwork:v6];
  }
}

- (void)updateRouteLabel
{
  dispatch_time_t v3 = [(MRULockscreenViewController *)self view];
  id v4 = [v3 headerView];
  id v7 = [v4 labelView];

  int v5 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  id v6 = [v5 route];

  [v7 setRoute:v6];
  [(MRULockscreenViewController *)self updateLayoutDependantProperties];
}

- (void)updateNowPlayingInfo
{
  dispatch_time_t v3 = [(MRUNowPlayingController *)self->_nowPlayingController metadataController];
  id v4 = [v3 nowPlayingInfo];

  int v5 = [(MRULockscreenViewController *)self view];
  id v6 = [v5 headerView];
  id v7 = [v6 labelView];

  id v8 = [v4 placeholder];
  [v7 setPlaceholder:v8];

  id v9 = [v4 stringForComponents:1];
  [v7 setTitle:v9];

  uint64_t v10 = [v4 stringForComponents:122];
  [v7 setSubtitle:v10];

  int v11 = [v4 showPlaceholder];
  if (v11 != [v7 showPlaceholder])
  {
    double v12 = (void *)MEMORY[0x1E4FB1EB0];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke;
    v14[3] = &unk_1E5F0DD10;
    char v17 = v11;
    id v15 = v7;
    __int16 v16 = self;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke_2;
    v13[3] = &unk_1E5F0EE58;
    v13[4] = self;
    objc_msgSend(v12, "mru_animateUsingType:animations:completion:", 0, v14, v13);
  }
}

void __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setShowPlaceholder:*(unsigned __int8 *)(a1 + 48)];
  id v2 = [*(id *)(a1 + 40) view];
  [v2 layoutIfNeeded];
}

uint64_t __51__MRULockscreenViewController_updateNowPlayingInfo__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateRestrictedRects];
}

- (void)updateTimeControlsForPresentationInterval:(id)a3
{
  nowPlayingController = self->_nowPlayingController;
  id v5 = a3;
  id v6 = [(MRUNowPlayingController *)nowPlayingController metadataController];
  id v9 = [v6 timeControls];

  id v7 = [(MRULockscreenViewController *)self view];
  id v8 = [v7 timeControlsView];

  [v8 setTimeControls:v9 forPresentationInterval:v5];
}

- (void)updateTimeControls
{
}

- (void)updateTransportControls
{
  dispatch_time_t v3 = [(MRUNowPlayingController *)self->_nowPlayingController metadataController];
  id v7 = [v3 transportControls];

  id v4 = [(MRULockscreenViewController *)self view];
  id v5 = [v4 transportControlsView];

  [v5 setTransportControls:v7];
  id v6 = [(MRUNowPlayingController *)self->_nowPlayingController tvRemoteController];
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));
}

- (void)updateVolumeControls
{
  v40[3] = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = [(MRULockscreenViewController *)self view];
  id v4 = [v3 volumeControlsView];

  id v5 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  id v6 = [v5 route];

  id v7 = [v4 volumeController];
  id v8 = [v7 dataSource];

  id v9 = [v4 volumeController];

  if (v9)
  {
    uint64_t v10 = [v8 groupRoute];
    char v11 = [v10 isEqual:v6];

    if (v11) {
      goto LABEL_6;
    }
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v6 outputDeviceRoute:0];

    [v4 setDataSource:v12];
  }
  else
  {
    uint64_t v12 = [objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v6 outputDeviceRoute:0];

    objc_super v13 = [(MPVolumeController *)[MRUVolumeController alloc] initWithDataSource:v12];
    [v4 setVolumeController:v13];
  }
  id v8 = (void *)v12;
LABEL_6:
  int64_t v14 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  if ([v14 isDeviceSystemRoute])
  {
    id v15 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
    if ([v15 isAirPlaying])
    {
      unsigned int v16 = 1;
    }
    else
    {
      char v17 = [MEMORY[0x1E4F77108] currentSettings];
      unsigned int v16 = [v17 alwaysShowVolumeControls];
    }
  }
  else
  {
    unsigned int v16 = 1;
  }

  if (self->_onScreen) {
    uint64_t v18 = v16;
  }
  else {
    uint64_t v18 = 0;
  }
  v19 = +[MRUCallMonitor sharedMonitor];
  int v20 = [v19 isOnCall];

  char v21 = [v8 volumeControlCapabilities];
  double v22 = [(MRULockscreenViewController *)self view];
  double v23 = [v22 volumeControlsView];
  [v23 setOnScreen:v18];

  if (v18 == 1 && (v20 & 1) == 0 && ([v6 isDeviceRoute] & 1) == 0 && (v21 & 3) != 0)
  {
    double v24 = MCLogCategoryVolume();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138544642;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 1024;
      int v34 = 1;
      __int16 v35 = 1024;
      int v36 = 1;
      __int16 v37 = 1024;
      int v38 = 0;
      __int16 v39 = 1024;
      LODWORD(v40[0]) = 1;
      WORD2(v40[0]) = 2114;
      *(void *)((char *)v40 + 6) = v6;
      _os_log_impl(&dword_1AE7DF000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | control: %{BOOL}u | route: %{public}@", (uint8_t *)&v31, 0x2Eu);
    }

    double v25 = +[MRUHardwareVolumeController sharedInstance];
    double v26 = (objc_class *)objc_opt_class();
    double v27 = NSStringFromClass(v26);
    double v28 = [v25 requestControlsForVolumeDataSource:v8 reason:v27];
    hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = v28;

LABEL_26:
    goto LABEL_27;
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    v30 = MCLogCategoryVolume();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      int v31 = 138544386;
      uint64_t v32 = objc_opt_class();
      __int16 v33 = 1024;
      int v34 = v18;
      __int16 v35 = 1024;
      int v36 = v16;
      __int16 v37 = 1024;
      int v38 = v20;
      __int16 v39 = 2114;
      v40[0] = v6;
      _os_log_impl(&dword_1AE7DF000, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | show: %{BOOL}u | call: %{BOOL}u | route: %{public}@", (uint8_t *)&v31, 0x28u);
    }

    double v25 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_26;
  }
LABEL_27:
}

- (void)updateRoutingButton
{
}

- (void)updateRoutingButtonAnimated:(BOOL)a3
{
  id v5 = [(MRULockscreenViewController *)self view];
  id v6 = [v5 transportControlsView];

  id v7 = [v6 routingButton];
  id v8 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  id v9 = [v8 route];
  uint64_t v10 = [v9 canModifyGroupMembership];

  [v6 setShowRoutingButton:v10];
  nowPlayingController = self->_nowPlayingController;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__MRULockscreenViewController_updateRoutingButtonAnimated___block_invoke;
  v13[3] = &unk_1E5F0F5B0;
  id v14 = v7;
  id v15 = self;
  BOOL v16 = a3;
  id v12 = v7;
  [(MRUNowPlayingController *)nowPlayingController routingDeviceImage:v13];
}

void __59__MRULockscreenViewController_updateRoutingButtonAnimated___block_invoke(uint64_t a1, uint64_t a2)
{
  id v5 = +[MRUAsset image:a2];
  dispatch_time_t v3 = *(void **)(a1 + 32);
  if ([*(id *)(a1 + 40) isOnScreen]) {
    BOOL v4 = *(unsigned char *)(a1 + 48) != 0;
  }
  else {
    BOOL v4 = 0;
  }
  [v3 setAsset:v5 animated:v4];
}

- (void)updateWaveformVisibility
{
  dispatch_time_t v3 = [(MRULockscreenViewController *)self view];
  id v11 = [v3 headerView];

  BOOL v4 = [(MRUWaveformController *)self->_waveformController routeSupportsWaveform];
  id v5 = [MEMORY[0x1E4F31208] sharedManager];
  if ([v5 musicHapticsEnabled])
  {
    id v6 = [(MRUNowPlayingController *)self->_nowPlayingController metadataController];
    uint64_t v7 = [v6 appSupportsHaptics];
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (v4)
  {
    if (self->_onScreen) {
      uint64_t v8 = v7 ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
    p_waveformViewController = &self->_waveformViewController;
    [(MRUWaveformViewController *)self->_waveformViewController setOnScreen:v8];
    if (self->_onScreen) {
      uint64_t v10 = v7;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    p_waveformViewController = &self->_waveformViewController;
    [(MRUWaveformViewController *)self->_waveformViewController setOnScreen:0];
    uint64_t v7 = 0;
    uint64_t v10 = 0;
  }
  [(MRUHapticViewController *)self->_hapticViewController setOnScreen:v10];
  [(MRUWaveformViewController *)*p_waveformViewController setDimmed:self->_dimmed];
  [(MRUHapticViewController *)self->_hapticViewController setDimmed:self->_dimmed];
  [v11 setShowWaveform:v4];
  [v11 setShowHaptic:v7];
}

- (void)updateVisibility
{
  BOOL onScreen = self->_onScreen;
  BOOL v4 = [(MRULockscreenViewController *)self view];
  [v4 setOnScreen:onScreen];

  BOOL dimmed = self->_dimmed;
  id v6 = [(MRULockscreenViewController *)self view];
  [v6 setDimmed:dimmed];
}

- (void)updateSuggestions
{
  dispatch_time_t v3 = [(MRUNowPlayingController *)self->_nowPlayingController mediaSuggestionsController];
  BOOL v4 = [v3 mediaSuggestions];
  [(MRUMediaSuggestionsViewController *)self->_suggestionsViewController setMediaSuggestions:v4];

  [(MRULockscreenViewController *)self updateLayoutDependantProperties];
}

- (void)updateLayoutDependantPropertiesWithCompletion:(id)a3
{
  id v4 = a3;
  BOOL showArtworkView = self->_showArtworkView;
  id v6 = [(MRULockscreenViewController *)self view];
  int v7 = [v6 showArtworkView];
  BOOL v8 = self->_showArtworkView;

  id v9 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  int v30 = v8;
  int v31 = v7;
  if ([v9 isDeviceSystemRoute])
  {
    uint64_t v10 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
    int v11 = [v10 isAirPlaying];
  }
  else
  {
    int v11 = 1;
  }

  id v12 = [(MRULockscreenViewController *)self view];
  objc_super v13 = [v12 headerView];
  id v14 = [v13 labelView];
  int v15 = v11 ^ [v14 showRoute];

  BOOL v16 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  char v29 = v11;
  if ([v16 isDeviceSystemRoute])
  {
    char v17 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
    if ([v17 isAirPlaying])
    {
      int v18 = 1;
    }
    else
    {
      char v21 = [MEMORY[0x1E4F77108] currentSettings];
      int v18 = [v21 alwaysShowVolumeControls];
    }
    BOOL v19 = showArtworkView;
    int v20 = v4;
  }
  else
  {
    BOOL v19 = showArtworkView;
    int v20 = v4;
    int v18 = 1;
  }

  double v22 = [(MRULockscreenViewController *)self view];
  int v23 = [v22 showVolumeControlsView];

  double v24 = [(MRUNowPlayingController *)self->_nowPlayingController mediaSuggestionsController];
  double v25 = [v24 mediaSuggestions];

  double v26 = [(MRULockscreenViewController *)self view];
  int v27 = [v26 showSuggestionsView];

  if (v30 == v31) {
    char v28 = v15;
  }
  else {
    char v28 = 1;
  }
  if ((v28 & 1) != 0 || ((v18 ^ v23) & 1) != 0 || (v25 != 0) != v27)
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke;
    v35[3] = &unk_1E5F100B0;
    v35[4] = self;
    BOOL v36 = v19;
    char v37 = v29;
    char v38 = v18;
    BOOL v39 = v25 != 0;
    char v40 = (v25 != 0) ^ v27;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke_2;
    v32[3] = &unk_1E5F100D8;
    v32[4] = self;
    BOOL v34 = v25 != 0;
    id v33 = v20;
    [(MRULockscreenViewController *)self updateLayoutWithAnimations:v35 completion:v32];
  }
}

uint64_t __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 40);
  dispatch_time_t v3 = [*(id *)(a1 + 32) view];
  [v3 setShowArtworkView:v2];

  uint64_t v4 = *(unsigned __int8 *)(a1 + 41);
  id v5 = [*(id *)(a1 + 32) view];
  id v6 = [v5 headerView];
  int v7 = [v6 labelView];
  [v7 setShowRoute:v4];

  uint64_t v8 = *(unsigned __int8 *)(a1 + 42);
  id v9 = [*(id *)(a1 + 32) view];
  [v9 setShowVolumeControlsView:v8];

  if (*(unsigned char *)(a1 + 43) && *(unsigned char *)(a1 + 44)) {
    [*(id *)(a1 + 32) createSuggestionsViewController];
  }
  uint64_t v10 = [*(id *)(a1 + 32) suggestionsViewController];
  [v10 beginAppearanceTransition:*(unsigned __int8 *)(a1 + 43) animated:0];

  uint64_t v11 = *(unsigned __int8 *)(a1 + 43);
  id v12 = [*(id *)(a1 + 32) view];
  [v12 setShowSuggestionsView:v11];

  objc_super v13 = [*(id *)(a1 + 32) view];
  [v13 layoutIfNeeded];

  id v14 = *(void **)(a1 + 32);

  return [v14 updatePreferredContentSize];
}

uint64_t __77__MRULockscreenViewController_updateLayoutDependantPropertiesWithCompletion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v4 = [*(id *)(a1 + 32) suggestionsViewController];
  [v4 endAppearanceTransition];

  if (!*(unsigned char *)(a1 + 48))
  {
    id v5 = [*(id *)(a1 + 32) suggestionsViewController];
    [v5 willMoveToParentViewController:0];

    id v6 = [*(id *)(a1 + 32) view];
    [v6 setSuggestionsView:0];

    int v7 = [*(id *)(a1 + 32) suggestionsViewController];
    [v7 removeFromParentViewController];

    [*(id *)(a1 + 32) setSuggestionsViewController:0];
  }
  [*(id *)(a1 + 32) updateRestrictedRects];
  uint64_t result = [*(id *)(a1 + 32) updatePreferredContentSize];
  if (a2)
  {
    uint64_t result = *(void *)(a1 + 40);
    if (result)
    {
      id v9 = *(uint64_t (**)(void))(result + 16);
      return v9();
    }
  }
  return result;
}

- (void)updateLayoutDependantProperties
{
}

- (void)updateLayoutWithAnimations:(id)a3 completion:(id)a4
{
  id v13 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  int v7 = [(MRULockscreenViewController *)self view];
  [v7 bounds];
  if (v8 == 0.0)
  {

    id v12 = v13;
  }
  else
  {
    id v9 = [(MRULockscreenViewController *)self view];
    [v9 bounds];
    double v11 = v10;

    id v12 = v13;
    if (v11 != 0.0)
    {
      objc_msgSend(MEMORY[0x1E4FB1EB0], "mru_animateUsingType:animations:completion:", 0, v13, v6);
      goto LABEL_6;
    }
  }
  [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v12];
  v6[2](v6, 1);
LABEL_6:
}

- (void)updatePreferredContentSize
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_time_t v3 = [MEMORY[0x1E4FB1BA8] mainScreen];
  [v3 bounds];
  double Width = CGRectGetWidth(v27);

  id v5 = [(MRULockscreenViewController *)self view];
  objc_msgSend(v5, "sizeThatFits:", Width, 1.79769313e308);
  double v7 = v6;
  double v9 = v8;

  double v10 = MCLogCategoryDefault();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v11 = objc_opt_class();
    v25.width = v7;
    v25.height = v9;
    id v12 = NSStringFromCGSize(v25);
    id v13 = [(MRULockscreenViewController *)self view];
    [v13 frame];
    v26.width = v14;
    v26.height = v15;
    BOOL v16 = NSStringFromCGSize(v26);
    int v18 = 138543874;
    uint64_t v19 = v11;
    __int16 v20 = 2114;
    char v21 = v12;
    __int16 v22 = 2114;
    int v23 = v16;
    _os_log_impl(&dword_1AE7DF000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ preferred content size: %{public}@ | current: %{public}@", (uint8_t *)&v18, 0x20u);
  }
  char v17 = [(MRULockscreenViewController *)self delegate];
  if (objc_opt_respondsToSelector()) {
    objc_msgSend(v17, "lockscreenViewController:didUpdatePreferredContentSize:", self, v7, v9);
  }
}

- (void)updateRestrictedRects
{
  id v4 = [(MRULockscreenViewController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    dispatch_time_t v3 = [(MRULockscreenViewController *)self restrictedRects];
    [v4 lockscreenViewController:self didUpdateRestrictedRects:v3];
  }
}

- (void)updateVisualStyling
{
  dispatch_time_t v3 = (void *)MEMORY[0x1E4F743E8];
  id v4 = [(MRULockscreenViewController *)self traitCollection];
  objc_msgSend(v3, "_visualStylingProviderForRecipe:category:andUserInterfaceStyle:", 1, 1, objc_msgSend(v4, "userInterfaceStyle"));
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  id v5 = [[MRUVisualStylingProvider alloc] initWithVisualStylingProvider:v6];
  [(MRULockscreenViewController *)self setStylingProvider:v5];
}

- (BOOL)lockScreenPresentsOverrideRoutePicker
{
  uint64_t v2 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Music"];
  dispatch_time_t v3 = [v2 stringForKey:@"LockScreenRoutingStyleOverride"];
  char v4 = [v3 isEqualToString:@"Default"] ^ 1;
  char v5 = MSVDeviceOSIsInternalInstall() & v4;

  return v5;
}

- (int64_t)lockScreenInternalRoutePickerOverrideWithDefaultStyle:(int64_t)a3
{
  char v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:@"com.apple.Music"];
  char v5 = [v4 stringForKey:@"LockScreenRoutingStyleOverride"];
  if (([v5 isEqualToString:@"Default"] & 1) == 0)
  {
    if ([v5 isEqualToString:@"ControlCenter"])
    {
      a3 = 0;
    }
    else if ([v5 isEqualToString:@"SingleSelect"])
    {
      a3 = 1;
    }
    else if ([v5 isEqualToString:@"MultiSelect"])
    {
      a3 = 2;
    }
    else if ([v5 isEqualToString:@"SharedQueue"])
    {
      a3 = 3;
    }
    else if ([v5 isEqualToString:@"VideoPicker"])
    {
      a3 = 4;
    }
    else if ([v5 isEqualToString:@"LocalTransportControls"])
    {
      a3 = 5;
    }
    else if ([v5 isEqualToString:@"AirPlayBluePill"])
    {
      a3 = 6;
    }
    else if ([v5 isEqualToString:@"MediumConfidenceVideoPicker"])
    {
      a3 = 7;
    }
    else if ([v5 isEqualToString:@"UpNextControls"])
    {
      a3 = 8;
    }
  }

  return a3;
}

- (id)_stateDumpObject
{
  v18[5] = *MEMORY[0x1E4F143B8];
  v17[0] = @"hardwareVolumeControlAssertion";
  uint64_t v3 = [(BSInvalidatable *)self->_hardwareVolumeControlAssertion description];
  char v4 = (void *)v3;
  if (v3) {
    char v5 = (__CFString *)v3;
  }
  else {
    char v5 = @"<NONE>";
  }
  v18[0] = v5;
  v17[1] = @"endpointController";
  uint64_t v6 = [(MRUNowPlayingController *)self->_nowPlayingController endpointController];
  double v7 = (void *)v6;
  if (v6) {
    double v8 = (__CFString *)v6;
  }
  else {
    double v8 = @"<NONE>";
  }
  nowPlayingController = self->_nowPlayingController;
  if (!nowPlayingController) {
    nowPlayingController = (MRUNowPlayingController *)@"<NONE>";
  }
  v18[1] = v8;
  v18[2] = nowPlayingController;
  v17[2] = @"dataController";
  v17[3] = @"mediaControls";
  mediaControls = self->_mediaControls;
  if (!mediaControls) {
    mediaControls = (MPMediaControls *)@"<NONE>";
  }
  v18[3] = mediaControls;
  v17[4] = @"window";
  uint64_t v11 = [(MRULockscreenViewController *)self view];
  uint64_t v12 = [v11 window];
  id v13 = (void *)v12;
  if (v12) {
    CGFloat v14 = (__CFString *)v12;
  }
  else {
    CGFloat v14 = @"<NONE>";
  }
  v18[4] = v14;
  CGFloat v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:5];

  return v15;
}

- (MRULockscreenViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MRULockscreenViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)showArtworkView
{
  return self->_showArtworkView;
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingDimmed, 0);
  objc_storeStrong((id *)&self->_pendingVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_hapticViewController, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_nowPlayingController, 0);
}

@end