@interface MRUActivityNowPlayingViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isExpanded;
- (BOOL)isOnScreen;
- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3;
- (BOOL)wasPlayingDuringLastPreferredLayoutUpdate;
- (BSInvalidatable)hardwareVolumeControlAssertion;
- (MPMediaControls)mediaControls;
- (MPVolumeController)volumeController;
- (MRUActivityNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (MRUHapticViewController)hapticViewController;
- (MRUNowPlayingController)controller;
- (MRUWaveformController)waveformController;
- (MRUWaveformViewController)waveformViewController;
- (MSVTimer)inactiveTransitionTimer;
- (NSDate)lastLeftButtonTapDate;
- (NSSet)backgroundActivitiesToSuppress;
- (NSString)associatedAppBundleIdentifier;
- (NSString)elementIdentifier;
- (NSURL)launchURL;
- (SBUISystemApertureAccessoryView)detachedMinimalView;
- (SBUISystemApertureAccessoryView)leadingView;
- (SBUISystemApertureAccessoryView)minimalView;
- (SBUISystemApertureAccessoryView)trailingView;
- (UITapGestureRecognizer)launchNowPlayingGestureRecognizer;
- (double)preferredHeightForBottomSafeArea;
- (int64_t)activeLayoutMode;
- (int64_t)artworkTransitionDirection;
- (int64_t)contentRole;
- (int64_t)maximumLayoutMode;
- (int64_t)preferredLayoutMode;
- (unint64_t)presentationBehaviors;
- (void)createHapticViewController;
- (void)createWaveformViewController;
- (void)didSelectArtworkView:(id)a3;
- (void)didSelectLabelView:(id)a3;
- (void)didSelectLaunchNowPlaying:(id)a3;
- (void)didTapTransportButton:(id)a3;
- (void)loadView;
- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5;
- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeBundleID:(id)a5;
- (void)registerHapticObserver;
- (void)setActiveLayoutMode:(int64_t)a3;
- (void)setController:(id)a3;
- (void)setHapticViewController:(id)a3;
- (void)setHardwareVolumeControlAssertion:(id)a3;
- (void)setInactiveTransitionTimer:(id)a3;
- (void)setLastLeftButtonTapDate:(id)a3;
- (void)setLaunchNowPlayingGestureRecognizer:(id)a3;
- (void)setMediaControls:(id)a3;
- (void)setVolumeController:(id)a3;
- (void)setWasPlayingDuringLastPreferredLayoutUpdate:(BOOL)a3;
- (void)setWaveformController:(id)a3;
- (void)setWaveformViewController:(id)a3;
- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4;
- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4;
- (void)updateArtwork;
- (void)updateBundleID;
- (void)updateEverything;
- (void)updateLayout;
- (void)updateLayoutModesPreferringImmediateTransition:(BOOL)a3 deferInCustomLayout:(BOOL)a4 reason:(id)a5;
- (void)updateNowPlayingInfo;
- (void)updateRouteLabel;
- (void)updateRoutingButton;
- (void)updateTimeControls;
- (void)updateTransportControls;
- (void)updateVolumeControls;
- (void)updateWaveformVisibility;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation MRUActivityNowPlayingViewController

- (MRUActivityNowPlayingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  v11.receiver = self;
  v11.super_class = (Class)MRUActivityNowPlayingViewController;
  v4 = [(MRUActivityNowPlayingViewController *)&v11 initWithNibName:a3 bundle:a4];
  v5 = v4;
  if (v4)
  {
    v4->_wasPlayingDuringLastPreferredLayoutUpdate = 0;
    v4->_preferredLayoutMode = 1;
    v4->_maximumLayoutMode = 1;
    v6 = +[MRUEndpointController proactiveUserSelectedEndpointController];
    v7 = [[MRUNowPlayingController alloc] initWithEndpointController:v6];
    controller = v5->_controller;
    v5->_controller = v7;

    v9 = [(MRUNowPlayingController *)v5->_controller tvRemoteController];
    [v9 setContext:7];

    [(MRUNowPlayingController *)v5->_controller addObserver:v5];
  }
  return v5;
}

- (void)loadView
{
  v3 = objc_alloc_init(MRUActivityNowPlayingView);
  [(MRUActivityNowPlayingViewController *)self setView:v3];
}

- (void)viewDidLoad
{
  v22.receiver = self;
  v22.super_class = (Class)MRUActivityNowPlayingViewController;
  [(MRUActivityNowPlayingViewController *)&v22 viewDidLoad];
  v3 = objc_alloc_init(MRUVisualStylingProvider);
  v4 = [(MRUActivityNowPlayingViewController *)self view];
  [v4 setStylingProvider:v3];

  v5 = [MEMORY[0x1E4FB1618] systemWhiteColor];
  v6 = [(MRUActivityNowPlayingViewController *)self view];
  v7 = [v6 stylingProvider];
  [v7 setPrimaryColor:v5];

  v8 = [(MRUActivityNowPlayingViewController *)self view];
  v9 = [v8 artworkViews];
  v10 = [v9 firstObject];
  [v10 addTarget:self action:sel_didSelectArtworkView_ forControlEvents:64];

  objc_super v11 = [(MRUActivityNowPlayingViewController *)self view];
  v12 = [v11 headerView];
  v13 = [v12 labelView];
  [v13 addTarget:self action:sel_didSelectLabelView_ forControlEvents:64];

  v14 = [(MRUActivityNowPlayingViewController *)self view];
  v15 = [v14 transportControlsView];
  [v15 setDelegate:self];

  v16 = (void *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel_didSelectLaunchNowPlaying_];
  [(MRUActivityNowPlayingViewController *)self setLaunchNowPlayingGestureRecognizer:v16];

  v17 = [(MRUActivityNowPlayingViewController *)self view];
  v18 = [(MRUActivityNowPlayingViewController *)self launchNowPlayingGestureRecognizer];
  [v17 addGestureRecognizer:v18];

  [(MRUActivityNowPlayingViewController *)self createWaveformViewController];
  [(MRUActivityNowPlayingViewController *)self createHapticViewController];
  [(MRUActivityNowPlayingViewController *)self updateEverything];
  [(MRUActivityNowPlayingViewController *)self registerHapticObserver];
  v19 = [(MRUActivityNowPlayingViewController *)self view];
  v20 = [v19 transportControlsView];
  v21 = [v20 leftButton];
  [v21 addTarget:self action:sel_didTapTransportButton_ forControlEvents:64];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  v9.receiver = self;
  v9.super_class = (Class)MRUActivityNowPlayingViewController;
  id v7 = a4;
  -[MRUActivityNowPlayingViewController viewWillTransitionToSize:withTransitionCoordinator:](&v9, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __90__MRUActivityNowPlayingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v8[3] = &unk_1E5F0E4A8;
  v8[4] = self;
  [v7 animateAlongsideTransition:v8 completion:&__block_literal_global_37];
}

void __90__MRUActivityNowPlayingViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateLayout];
  v2 = [*(id *)(a1 + 32) view];
  [v2 setNeedsLayout];

  id v3 = [*(id *)(a1 + 32) view];
  [v3 layoutIfNeeded];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didSelectArtworkView:(id)a3
{
  id v3 = [(MRUNowPlayingController *)self->_controller endpointController];
  [v3 launchNowPlayingApp];
}

- (void)didSelectLabelView:(id)a3
{
  id v3 = [(MRUNowPlayingController *)self->_controller endpointController];
  [v3 launchNowPlayingApp];
}

- (void)didSelectLaunchNowPlaying:(id)a3
{
  id v3 = [(MRUNowPlayingController *)self->_controller endpointController];
  [v3 launchNowPlayingApp];
}

- (void)didTapTransportButton:(id)a3
{
  id v4 = a3;
  v5 = [(MRUActivityNowPlayingViewController *)self view];
  v6 = [v5 transportControlsView];
  id v7 = [v6 leftButton];

  if (v7 == v4)
  {
    id v8 = [MEMORY[0x1E4F1C9C8] now];
    [(MRUActivityNowPlayingViewController *)self setLastLeftButtonTapDate:v8];
  }
}

- (NSURL)launchURL
{
  if (objc_msgSend(MEMORY[0x1E4F28B50], "mru_isMusicBundleIdentifier:", self->_associatedAppBundleIdentifier))
  {
    id v3 = @"music://show-now-playing";
LABEL_5:
    id v4 = [MEMORY[0x1E4F1CB10] URLWithString:v3];
    goto LABEL_7;
  }
  if (objc_msgSend(MEMORY[0x1E4F28B50], "mru_isPodcastsBundleIdentifier:", self->_associatedAppBundleIdentifier))
  {
    id v3 = @"podcasts://nowPlaying";
    goto LABEL_5;
  }
  id v4 = 0;
LABEL_7:

  return (NSURL *)v4;
}

- (void)updateLayoutModesPreferringImmediateTransition:(BOOL)a3 deferInCustomLayout:(BOOL)a4 reason:(id)a5
{
  BOOL v43 = a4;
  BOOL v5 = a3;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v44 = a5;
  id v7 = MCLogCategoryDefault();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    id v49 = v44;
    _os_log_impl(&dword_1AE7DF000, v7, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] updateLayoutModes for %@", buf, 0xCu);
  }

  id v8 = [(MRUNowPlayingController *)self->_controller metadataController];
  objc_super v9 = [v8 nowPlayingInfo];
  int v10 = [v9 isPlaying];

  objc_super v11 = [(MRUNowPlayingController *)self->_controller metadataController];
  v45 = [v11 bundleID];

  if (v45)
  {
    v12 = [(MRUNowPlayingController *)self->_controller metadataController];
    v13 = [v12 nowPlayingInfo];
    v14 = [v13 identifier];
    BOOL v15 = v14 != 0;
  }
  else
  {
    BOOL v15 = 0;
  }
  int64_t preferredLayoutMode = self->_preferredLayoutMode;
  int v17 = v10 & v15;
  if ((v10 & v15) != 0) {
    int64_t v18 = 3;
  }
  else {
    int64_t v18 = 1;
  }
  v19 = [(MRUActivityNowPlayingViewController *)self inactiveTransitionTimer];
  if (v19)
  {
    BOOL v20 = self->_activeLayoutMode == 4;

    if ((v20 | v17))
    {
      v21 = MCLogCategoryDefault();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AE7DF000, v21, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] Cancel transition timer.", buf, 2u);
      }

      objc_super v22 = [(MRUActivityNowPlayingViewController *)self inactiveTransitionTimer];
      [v22 invalidate];

      [(MRUActivityNowPlayingViewController *)self setInactiveTransitionTimer:0];
    }
  }
  BOOL v23 = 0;
  if (self->_wasPlayingDuringLastPreferredLayoutUpdate && (v10 & 1) == 0) {
    BOOL v23 = self->_activeLayoutMode == 1;
  }
  self->_wasPlayingDuringLastPreferredLayoutUpdate = v10;
  if (preferredLayoutMode != v18 || v5)
  {
    if (((!v15 || v5 || v23) | v10) == 1)
    {
      v24 = [(MRUActivityNowPlayingViewController *)self inactiveTransitionTimer];
      [v24 invalidate];

      [(MRUActivityNowPlayingViewController *)self setInactiveTransitionTimer:0];
      v25 = MCLogCategoryDefault();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        v26 = SBUISystemApertureLayoutModeDescription();
        v27 = SBUISystemApertureLayoutModeDescription();
        *(_DWORD *)buf = 138412546;
        id v49 = v26;
        __int16 v50 = 2112;
        v51 = v27;
        _os_log_impl(&dword_1AE7DF000, v25, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] Updating preferred layout from %@ to %@.", buf, 0x16u);
      }
      self->_int64_t preferredLayoutMode = v18;
      int64_t v28 = 4;
      if ((v17 & 1) == 0) {
        int64_t v28 = 1;
      }
      self->_maximumLayoutMode = v28;
      if (v5)
      {
        if (v43 && self->_activeLayoutMode == 4)
        {
          v29 = MCLogCategoryDefault();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1AE7DF000, v29, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] Defer immediate transition for custom layout.", buf, 2u);
          }
          goto LABEL_30;
        }
        v39 = MCLogCategoryDefault();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v42 = SBUISystemApertureLayoutModeDescription();
          *(_DWORD *)buf = 138412290;
          id v49 = v42;
          _os_log_impl(&dword_1AE7DF000, v39, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] requestTransitionToPreferredLayoutMode %@", buf, 0xCu);
        }
      }
      else
      {
        if (self->_activeLayoutMode == 4) {
          goto LABEL_19;
        }
        v39 = MCLogCategoryDefault();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
        {
          v40 = SBUISystemApertureLayoutModeDescription();
          *(_DWORD *)buf = 138412290;
          id v49 = v40;
          _os_log_impl(&dword_1AE7DF000, v39, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] requestTransitionToPreferredLayoutMode %@", buf, 0xCu);
        }
      }

      v41 = [(MRUActivityNowPlayingViewController *)self systemApertureElementContext];
      [v41 requestTransitionToPreferredLayoutMode];

      goto LABEL_19;
    }
    if (!v43 || self->_activeLayoutMode != 4)
    {
      v30 = [(MRUActivityNowPlayingViewController *)self inactiveTransitionTimer];
      BOOL v31 = v30 == 0;

      if (v31)
      {
        v32 = MCLogCategoryDefault();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AE7DF000, v32, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] Defer update layouts.", buf, 2u);
        }

        objc_initWeak((id *)buf, self);
        v33 = (void *)MEMORY[0x1E4F77A30];
        v34 = [MEMORY[0x1E4F770F0] currentSettings];
        [v34 quickControlsInactiveTimeout];
        double v36 = v35;
        id v37 = MEMORY[0x1E4F14428];
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __113__MRUActivityNowPlayingViewController_updateLayoutModesPreferringImmediateTransition_deferInCustomLayout_reason___block_invoke;
        v46[3] = &unk_1E5F0DA00;
        objc_copyWeak(&v47, (id *)buf);
        v38 = [v33 timerWithInterval:0 repeats:MEMORY[0x1E4F14428] queue:v46 block:v36];
        [(MRUActivityNowPlayingViewController *)self setInactiveTransitionTimer:v38];

        objc_destroyWeak(&v47);
        objc_destroyWeak((id *)buf);
      }
      goto LABEL_19;
    }
    v29 = MCLogCategoryDefault();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AE7DF000, v29, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] Skip update for custom layout.", buf, 2u);
    }
LABEL_30:
  }
LABEL_19:
}

void __113__MRUActivityNowPlayingViewController_updateLayoutModesPreferringImmediateTransition_deferInCustomLayout_reason___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateLayoutModesPreferringImmediateTransition:1 deferInCustomLayout:1 reason:@"inactiveTransitionTimer"];
}

- (void)setActiveLayoutMode:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_activeLayoutMode != a3)
  {
    BOOL v5 = MCLogCategoryDefault();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = SBUISystemApertureLayoutModeDescription();
      id v7 = SBUISystemApertureLayoutModeDescription();
      int v9 = 138412546;
      int v10 = v6;
      __int16 v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1AE7DF000, v5, OS_LOG_TYPE_DEBUG, "[MRUActivityVC] setActiveLayoutMode from %@ to %@", (uint8_t *)&v9, 0x16u);
    }
    self->_activeLayoutMode = a3;
    [(MRUActivityNowPlayingViewController *)self updateLayoutModesPreferringImmediateTransition:0 deferInCustomLayout:1 reason:@"setActiveLayoutMode"];
    id v8 = [(MRUActivityNowPlayingViewController *)self controller];
    [v8 updateAutomaticResponseLoading];

    [(MRUActivityNowPlayingViewController *)self updateEverything];
  }
}

- (int64_t)contentRole
{
  return 2;
}

- (NSString)elementIdentifier
{
  return (NSString *)(id)*MEMORY[0x1E4FA7F30];
}

- (double)preferredHeightForBottomSafeArea
{
  v2 = [(MRUActivityNowPlayingViewController *)self view];
  [v2 preferredHeightForBottomSafeArea];
  double v4 = v3;

  return v4;
}

- (SBUISystemApertureAccessoryView)leadingView
{
  v2 = [(MRUActivityNowPlayingViewController *)self view];
  double v3 = [v2 leadingView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)trailingView
{
  v2 = [(MRUActivityNowPlayingViewController *)self view];
  double v3 = [v2 trailingView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)minimalView
{
  v2 = [(MRUActivityNowPlayingViewController *)self view];
  double v3 = [v2 leadingView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (SBUISystemApertureAccessoryView)detachedMinimalView
{
  v2 = [(MRUActivityNowPlayingViewController *)self view];
  double v3 = [v2 detachedMinimalView];

  return (SBUISystemApertureAccessoryView *)v3;
}

- (unint64_t)presentationBehaviors
{
  if (MRUseInternalUI()) {
    return 24;
  }
  else {
    return 9;
  }
}

- (NSSet)backgroundActivitiesToSuppress
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", *MEMORY[0x1E4FA95B0], 0);
}

- (BOOL)nowPlayingControllerShouldAutomaticallyUpdateResponse:(id)a3
{
  return self->_activeLayoutMode < 5uLL;
}

- (void)nowPlayingController:(id)a3 endpointController:(id)a4 didChangeRoute:(id)a5
{
  [(MRUActivityNowPlayingViewController *)self updateBundleID];
  [(MRUActivityNowPlayingViewController *)self updateRouteLabel];
  [(MRUActivityNowPlayingViewController *)self updateRoutingButton];
  [(MRUActivityNowPlayingViewController *)self updateVolumeControls];

  [(MRUActivityNowPlayingViewController *)self updateWaveformVisibility];
}

- (void)nowPlayingController:(id)a3 metadataController:(id)a4 didChangeBundleID:(id)a5
{
  [(MRUActivityNowPlayingViewController *)self updateBundleID];

  [(MRUActivityNowPlayingViewController *)self updateRoutingButton];
}

- (void)transportControlsView:(id)a3 didSelectTVRemoteButton:(id)a4
{
  BOOL v5 = [(MRUNowPlayingController *)self->_controller tvRemoteController];
  [v5 presentTVRemoteUsingApp:1];

  [(MRUActivityNowPlayingViewController *)self updateLayoutModesPreferringImmediateTransition:1 deferInCustomLayout:0 reason:@"didSelectTVRemoteButton"];
}

- (void)transportControlsView:(id)a3 didSelectRoutingButton:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F31910]);
  if (!+[MRUFeatureFlagProvider isCayenneEnabled])
  {
    int v9 = [MEMORY[0x1E4F28B50] mainBundle];
    int v10 = [v9 bundleIdentifier];
    [v8 setPresentingAppBundleID:v10];
  }
  if (MRAVOutputContextGetSharedAudioPresentationContext())
  {
    __int16 v11 = (void *)MRAVOutputContextCopyUniqueIdentifier();
    [v8 setRoutingContextUID:v11];
  }
  objc_initWeak(&location, self);
  v12 = (MPMediaControls *)[objc_alloc(MEMORY[0x1E4F31908]) initWithConfiguration:v8 shouldObserveRoutingContextUIDChanges:0];
  mediaControls = self->_mediaControls;
  self->_mediaControls = v12;

  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __84__MRUActivityNowPlayingViewController_transportControlsView_didSelectRoutingButton___block_invoke;
  v16[3] = &unk_1E5F0DA00;
  objc_copyWeak(&v17, &location);
  [(MPMediaControls *)self->_mediaControls setDismissHandler:v16];
  v14 = MCLogCategoryDefault();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)BOOL v15 = 0;
    _os_log_impl(&dword_1AE7DF000, v14, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] will present RoutePicker", v15, 2u);
  }

  [(MPMediaControls *)self->_mediaControls present];
  [(MRUActivityNowPlayingViewController *)self updateLayoutModesPreferringImmediateTransition:1 deferInCustomLayout:0 reason:@"didSelectRoutingButton"];
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);
}

void __84__MRUActivityNowPlayingViewController_transportControlsView_didSelectRoutingButton___block_invoke(uint64_t a1)
{
  v2 = MCLogCategoryDefault();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1AE7DF000, v2, OS_LOG_TYPE_DEFAULT, "[MRUActivityVC] will dismiss RoutePicker", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setMediaControls:0];
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

  BOOL v5 = [[MRUWaveformViewController alloc] initWithContext:0 waveformController:self->_waveformController];
  waveformViewController = self->_waveformViewController;
  self->_waveformViewController = v5;

  [(MRUWaveformController *)self->_waveformController setNowPlayingController:self->_controller];
  id v7 = [(MRUActivityNowPlayingViewController *)self view];
  id v8 = [v7 artworkViews];
  int v9 = [v8 firstObject];
  [v9 addObserver:self->_waveformController];

  [(MRUActivityNowPlayingViewController *)self addChildViewController:self->_waveformViewController];
  int v10 = [(MRUWaveformViewController *)self->_waveformViewController view];
  __int16 v11 = [(MRUActivityNowPlayingViewController *)self view];
  v12 = [v11 trailingView];
  [v12 setWaveformView:v10];

  uint64_t v13 = self->_waveformViewController;

  [(MRUWaveformViewController *)v13 didMoveToParentViewController:self];
}

- (void)createHapticViewController
{
  id v3 = [[MRUHapticViewController alloc] initWithContext:0 nowPlayingController:self->_controller];
  hapticViewController = self->_hapticViewController;
  self->_hapticViewController = v3;

  BOOL v5 = [(MRUActivityNowPlayingViewController *)self view];
  id v6 = [v5 artworkViews];
  id v7 = [v6 firstObject];
  [v7 addObserver:self->_hapticViewController];

  [(MRUActivityNowPlayingViewController *)self addChildViewController:self->_hapticViewController];
  id v8 = [(MRUHapticViewController *)self->_hapticViewController view];
  int v9 = [(MRUActivityNowPlayingViewController *)self view];
  int v10 = [v9 trailingView];
  [v10 setHapticView:v8];

  waveformViewController = self->_waveformViewController;

  [(MRUWaveformViewController *)waveformViewController didMoveToParentViewController:self];
}

- (void)updateEverything
{
  [(MRUActivityNowPlayingViewController *)self updateBundleID];
  [(MRUActivityNowPlayingViewController *)self updateArtwork];
  [(MRUActivityNowPlayingViewController *)self updateNowPlayingInfo];
  [(MRUActivityNowPlayingViewController *)self updateTimeControls];
  [(MRUActivityNowPlayingViewController *)self updateTransportControls];
  [(MRUActivityNowPlayingViewController *)self updateRouteLabel];
  [(MRUActivityNowPlayingViewController *)self updateRoutingButton];
  [(MRUActivityNowPlayingViewController *)self updateLayout];
  [(MRUActivityNowPlayingViewController *)self updateWaveformVisibility];

  [(MRUActivityNowPlayingViewController *)self updateVolumeControls];
}

- (void)updateBundleID
{
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  obj = [v3 bundleID];

  if (MRMediaRemoteApplicationIsSystemMediaApplication())
  {
    uint64_t v4 = MRMediaRemoteCopyLocalDeviceSystemMediaApplicationDisplayID();
LABEL_5:
    BOOL v5 = obj;
    obj = (__CFString *)v4;
LABEL_6:

    goto LABEL_7;
  }
  if (MRMediaRemoteApplicationIsSystemPodcastApplication())
  {
    uint64_t v4 = MRMediaRemoteCopyLocalDeviceSystemPodcastApplicationDisplayID();
    goto LABEL_5;
  }
  if (obj)
  {
    BOOL v5 = [(MRUNowPlayingController *)self->_controller endpointController];
    if ([v5 isDeviceSystemRoute]) {
      goto LABEL_6;
    }
    int v10 = [(MRUNowPlayingController *)self->_controller endpointController];
    char v11 = [v10 isAirPlaying];

    if ((v11 & 1) == 0)
    {
      BOOL v5 = obj;
      obj = &stru_1F06524E0;
      goto LABEL_6;
    }
  }
  else
  {
    obj = 0;
  }
LABEL_7:
  id v6 = self->_associatedAppBundleIdentifier;
  if (v6 == (NSString *)obj)
  {
  }
  else
  {
    id v7 = v6;
    char v8 = [(NSString *)v6 isEqual:obj];

    if ((v8 & 1) == 0)
    {
      objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, obj);
      int v9 = [(MRUActivityNowPlayingViewController *)self systemApertureElementContext];
      [v9 setElementNeedsUpdate];

      [(MRUActivityNowPlayingViewController *)self updateLayoutModesPreferringImmediateTransition:1 deferInCustomLayout:1 reason:@"updateBundleID"];
    }
  }
}

- (int64_t)artworkTransitionDirection
{
  if (!self->_lastLeftButtonTapDate) {
    return 0;
  }
  id v3 = [MEMORY[0x1E4F1C9C8] now];
  [v3 timeIntervalSinceDate:self->_lastLeftButtonTapDate];
  int64_t v5 = v4 < 3.0;

  return v5;
}

- (void)updateArtwork
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  double v4 = [v3 artwork];

  int64_t v5 = [(MRUActivityNowPlayingViewController *)self artworkTransitionDirection];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(MRUActivityNowPlayingViewController *)self view];
  id v7 = [v6 artworkViews];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v12 + 1) + 8 * v11++) setArtwork:v4 transitionDirection:v5];
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  [(MRUActivityNowPlayingViewController *)self setLastLeftButtonTapDate:0];
}

- (void)updateNowPlayingInfo
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  double v4 = [v3 nowPlayingInfo];

  int64_t v5 = [(MRUActivityNowPlayingViewController *)self view];
  id v6 = [v5 headerView];
  id v7 = [v6 labelView];

  uint64_t v8 = [(MRUActivityNowPlayingViewController *)self view];
  uint64_t v9 = [v8 artworkViews];

  uint64_t v10 = [(MRUActivityNowPlayingViewController *)self view];
  uint64_t v11 = [v10 leadingView];

  long long v12 = [(MRUNowPlayingController *)self->_controller endpointController];
  long long v13 = [v12 route];
  [v7 setRoute:v13];

  long long v14 = [v4 stringForComponents:1];
  [v7 setTitle:v14];

  long long v15 = [v4 stringForComponents:122];
  [v7 setSubtitle:v15];

  v16 = [v4 placeholder];
  [v7 setPlaceholder:v16];

  objc_msgSend(v7, "setShowPlaceholder:", objc_msgSend(v4, "showPlaceholder"));
  uint64_t v17 = [v4 stringForComponents:59];
  [v11 setAccessibilityLabel:v17];

  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v18 = v9;
  uint64_t v19 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        BOOL v23 = *(void **)(*((void *)&v25 + 1) + 8 * v22);
        objc_msgSend(v23, "setPlaying:", objc_msgSend(v4, "isPlaying", (void)v25));
        v24 = [v4 identifier];
        [v23 setItemIdentifier:v24];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  [(MRUActivityNowPlayingViewController *)self updateLayoutModesPreferringImmediateTransition:0 deferInCustomLayout:1 reason:@"updateNowPlayingInfo"];
}

- (void)updateTimeControls
{
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v6 = [v3 timeControls];

  double v4 = [(MRUActivityNowPlayingViewController *)self view];
  int64_t v5 = [v4 timeControlsView];

  [v5 setTimeControls:v6];
}

- (void)updateTransportControls
{
  id v3 = [(MRUNowPlayingController *)self->_controller metadataController];
  id v7 = [v3 transportControls];

  double v4 = [(MRUActivityNowPlayingViewController *)self view];
  int64_t v5 = [v4 transportControlsView];

  [v5 setTransportControls:v7];
  id v6 = [(MRUNowPlayingController *)self->_controller tvRemoteController];
  objc_msgSend(v5, "setShowTVRemoteButton:", objc_msgSend(v6, "showTVRemote"));
}

- (void)updateRouteLabel
{
  id v3 = [(MRUActivityNowPlayingViewController *)self view];
  double v4 = [v3 headerView];
  id v14 = [v4 labelView];

  int64_t v5 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v6 = [v5 route];
  id v7 = [(MRUActivityNowPlayingViewController *)self view];
  uint64_t v8 = [v7 headerView];
  uint64_t v9 = [v8 labelView];
  [v9 setRoute:v6];

  uint64_t v10 = [(MRUNowPlayingController *)self->_controller endpointController];
  if ([v10 isDeviceSystemRoute])
  {
    uint64_t v11 = [(MRUNowPlayingController *)self->_controller endpointController];
    uint64_t v12 = [v11 isAirPlaying];
  }
  else
  {
    uint64_t v12 = 1;
  }

  if (v12 != [v14 showRoute])
  {
    [v14 setShowRoute:v12];
    long long v13 = [(MRUActivityNowPlayingViewController *)self systemApertureElementContext];
    [v13 setElementNeedsUpdate];
  }
}

- (void)updateRoutingButton
{
  id v3 = [(MRUActivityNowPlayingViewController *)self view];
  double v4 = [v3 transportControlsView];

  int64_t v5 = [(MRUActivityNowPlayingViewController *)self view];
  id v6 = [v5 trailingView];

  id v7 = [(MRUNowPlayingController *)self->_controller endpointController];
  uint64_t v8 = [v7 route];
  uint64_t v9 = [v8 canModifyGroupMembership];

  [v4 setShowRoutingButton:v9];
  controller = self->_controller;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __58__MRUActivityNowPlayingViewController_updateRoutingButton__block_invoke;
  v13[3] = &unk_1E5F0E598;
  id v14 = v6;
  id v15 = v4;
  v16 = self;
  id v11 = v4;
  id v12 = v6;
  [(MRUNowPlayingController *)controller routingDeviceImage:v13];
}

void __58__MRUActivityNowPlayingViewController_updateRoutingButton__block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setRouteImage:v4];
  id v6 = +[MRUAsset image:v4];

  int64_t v5 = [*(id *)(a1 + 40) routingButton];
  objc_msgSend(v5, "setAsset:animated:", v6, objc_msgSend(*(id *)(a1 + 48), "isOnScreen"));
}

- (void)updateVolumeControls
{
  *(void *)&v33[13] = *MEMORY[0x1E4F143B8];
  id v3 = [(MRUNowPlayingController *)self->_controller endpointController];
  id v4 = [v3 route];

  int64_t v5 = [(MPVolumeController *)self->_volumeController dataSource];
  id v6 = v5;
  if (!self->_volumeController)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v4 outputDeviceRoute:0];

    uint64_t v10 = (MPVolumeController *)[objc_alloc(MEMORY[0x1E4F31A70]) initWithDataSource:v9];
    volumeController = self->_volumeController;
    self->_volumeController = v10;

    [(MPVolumeController *)self->_volumeController setDelegate:self];
    goto LABEL_5;
  }
  id v7 = [v5 groupRoute];
  char v8 = [v7 isEqual:v4];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = [objc_alloc(MEMORY[0x1E4F31A78]) initWithGroupRoute:v4 outputDeviceRoute:0];

    [(MPVolumeController *)self->_volumeController setDataSource:v9];
LABEL_5:
    id v6 = (void *)v9;
  }
  char v12 = [v6 volumeControlCapabilities];
  if ([(MRUActivityNowPlayingViewController *)self isExpanded]
    && ([v4 isDeviceRoute] & 1) == 0
    && (v12 & 3) != 0)
  {
    long long v13 = MCLogCategoryVolume();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v14 = objc_opt_class();
      BOOL v15 = [(MRUActivityNowPlayingViewController *)self isOnScreen];
      v16 = MRUNowPlayingContextDescription(7);
      int v26 = 138544386;
      uint64_t v27 = v14;
      __int16 v28 = 1024;
      BOOL v29 = v15;
      __int16 v30 = 2114;
      BOOL v31 = v16;
      __int16 v32 = 1024;
      *(_DWORD *)v33 = 1;
      v33[2] = 2114;
      *(void *)&v33[3] = v4;
      _os_log_impl(&dword_1AE7DF000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ taking hardware assertion: on screen: %{BOOL}u | context: %{public}@ | control: %{BOOL}u  | route: %{public}@", (uint8_t *)&v26, 0x2Cu);
    }
    uint64_t v17 = +[MRUHardwareVolumeController sharedInstance];
    id v18 = (objc_class *)objc_opt_class();
    uint64_t v19 = NSStringFromClass(v18);
    uint64_t v20 = [v17 requestControlsForVolumeDataSource:v6 reason:v19];
    hardwareVolumeControlAssertion = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = v20;

LABEL_16:
    goto LABEL_17;
  }
  if (self->_hardwareVolumeControlAssertion)
  {
    uint64_t v22 = MCLogCategoryVolume();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v23 = objc_opt_class();
      BOOL v24 = [(MRUActivityNowPlayingViewController *)self isOnScreen];
      long long v25 = MRUNowPlayingContextDescription(7);
      int v26 = 138544130;
      uint64_t v27 = v23;
      __int16 v28 = 1024;
      BOOL v29 = v24;
      __int16 v30 = 2114;
      BOOL v31 = v25;
      __int16 v32 = 2114;
      *(void *)v33 = v4;
      _os_log_impl(&dword_1AE7DF000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ removing hardware assertion: on screen: %{BOOL}u | context: %{public}@ | route: %{public}@", (uint8_t *)&v26, 0x26u);
    }
    uint64_t v17 = self->_hardwareVolumeControlAssertion;
    self->_hardwareVolumeControlAssertion = 0;
    goto LABEL_16;
  }
LABEL_17:
}

- (void)updateLayout
{
  if (self->_activeLayoutMode == 4) {
    uint64_t v3 = 8;
  }
  else {
    uint64_t v3 = 7;
  }
  id v4 = [(MRUActivityNowPlayingViewController *)self view];
  int64_t v5 = [v4 artworkViews];
  id v6 = [v5 firstObject];
  [v6 setStyle:v3];

  BOOL v7 = self->_activeLayoutMode == 4;
  char v8 = [(MRUActivityNowPlayingViewController *)self view];
  uint64_t v9 = [v8 headerView];
  uint64_t v10 = [v9 labelView];
  [v10 setMarqueeEnabled:v7];

  BOOL v11 = self->_activeLayoutMode == 4;
  id v13 = [(MRUActivityNowPlayingViewController *)self view];
  char v12 = [v13 timeControlsView];
  [v12 setOnScreen:v11];
}

- (void)updateWaveformVisibility
{
  BOOL v3 = [(MRUWaveformController *)self->_waveformController routeSupportsWaveform];
  int64_t activeLayoutMode = self->_activeLayoutMode;
  int64_t v5 = [MEMORY[0x1E4F31208] sharedManager];
  if ([v5 musicHapticsEnabled])
  {
    id v6 = [(MRUNowPlayingController *)self->_controller metadataController];
    uint64_t v7 = [v6 appSupportsHaptics];
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (v3)
  {
    if (activeLayoutMode > 2) {
      uint64_t v8 = v7 ^ 1;
    }
    else {
      uint64_t v8 = 0;
    }
    if (activeLayoutMode > 2) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0;
    }
    [(MRUWaveformViewController *)self->_waveformViewController setOnScreen:v8];
  }
  else
  {
    [(MRUWaveformViewController *)self->_waveformViewController setOnScreen:0];
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  [(MRUHapticViewController *)self->_hapticViewController setOnScreen:v9];
  uint64_t v10 = [(MRUActivityNowPlayingViewController *)self view];
  BOOL v11 = [v10 trailingView];
  [v11 setShowWaveform:v3];

  char v12 = [(MRUActivityNowPlayingViewController *)self view];
  id v13 = [v12 trailingView];
  [v13 setShowHaptic:v7];

  id v14 = [(MRUActivityNowPlayingViewController *)self view];
  [v14 setShowTrailingAccessoryWhenExpanded:v3];
}

- (BOOL)isExpanded
{
  return self->_activeLayoutMode == 4;
}

- (BOOL)isOnScreen
{
  return (unint64_t)(self->_activeLayoutMode - 2) < 3;
}

- (int64_t)activeLayoutMode
{
  return self->_activeLayoutMode;
}

- (NSString)associatedAppBundleIdentifier
{
  return self->_associatedAppBundleIdentifier;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (int64_t)maximumLayoutMode
{
  return self->_maximumLayoutMode;
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

- (BSInvalidatable)hardwareVolumeControlAssertion
{
  return self->_hardwareVolumeControlAssertion;
}

- (void)setHardwareVolumeControlAssertion:(id)a3
{
}

- (MRUWaveformViewController)waveformViewController
{
  return self->_waveformViewController;
}

- (void)setWaveformViewController:(id)a3
{
}

- (MRUHapticViewController)hapticViewController
{
  return self->_hapticViewController;
}

- (void)setHapticViewController:(id)a3
{
}

- (MRUWaveformController)waveformController
{
  return self->_waveformController;
}

- (void)setWaveformController:(id)a3
{
}

- (UITapGestureRecognizer)launchNowPlayingGestureRecognizer
{
  return self->_launchNowPlayingGestureRecognizer;
}

- (void)setLaunchNowPlayingGestureRecognizer:(id)a3
{
}

- (MSVTimer)inactiveTransitionTimer
{
  return self->_inactiveTransitionTimer;
}

- (void)setInactiveTransitionTimer:(id)a3
{
}

- (BOOL)wasPlayingDuringLastPreferredLayoutUpdate
{
  return self->_wasPlayingDuringLastPreferredLayoutUpdate;
}

- (void)setWasPlayingDuringLastPreferredLayoutUpdate:(BOOL)a3
{
  self->_wasPlayingDuringLastPreferredLayoutUpdate = a3;
}

- (NSDate)lastLeftButtonTapDate
{
  return self->_lastLeftButtonTapDate;
}

- (void)setLastLeftButtonTapDate:(id)a3
{
}

- (MPVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong((id *)&self->_lastLeftButtonTapDate, 0);
  objc_storeStrong((id *)&self->_inactiveTransitionTimer, 0);
  objc_storeStrong((id *)&self->_launchNowPlayingGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_waveformController, 0);
  objc_storeStrong((id *)&self->_hapticViewController, 0);
  objc_storeStrong((id *)&self->_waveformViewController, 0);
  objc_storeStrong((id *)&self->_hardwareVolumeControlAssertion, 0);
  objc_storeStrong((id *)&self->_mediaControls, 0);
  objc_storeStrong((id *)&self->_controller, 0);

  objc_storeStrong((id *)&self->_associatedAppBundleIdentifier, 0);
}

@end