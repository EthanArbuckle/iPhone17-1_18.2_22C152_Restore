@interface HUCameraController
- (AVHomeLoadingButtonControlItem)nextControlItem;
- (AVPlayerLayer)timelapsePlayerLayer;
- (AVPlayerLooper)looper;
- (AVPlayerViewController)playerViewController;
- (AVQueuePlayer)demoModeQueuePlayer;
- (BOOL)_shouldAutoPlayOnViewAppearance;
- (BOOL)applicationIsActive;
- (BOOL)displayingDetailsViewController;
- (BOOL)finishedFetchingCameraEvents;
- (BOOL)foundCameraClipWithInsufficientAnalysis;
- (BOOL)hasRecordedClips;
- (BOOL)homeHasMultipleCameraProfiles;
- (BOOL)hu_playbackControlsAreVisible;
- (BOOL)isDismissingViewController;
- (BOOL)isEnteringFullScreen;
- (BOOL)isObservingReadyForDisplay;
- (BOOL)isViewVisible;
- (BOOL)needsToFetchClip;
- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3;
- (BOOL)recordedClipInterfaceAvailable;
- (BOOL)shouldAutoPlayOnViewAppearance;
- (BOOL)shouldDisableLiveStreamAfterCameraStatusChange;
- (BOOL)shouldDisplayLandscapeMicrophoneInLine;
- (BOOL)shouldDisplayMicrophoneControl;
- (BOOL)shouldResumePlaying;
- (HFCameraAnalyticsCameraPlayerLaunchEvent)launchEvent;
- (HFCameraItem)cameraItem;
- (HFCameraPlaybackEngine)playbackEngine;
- (HFItemManager)itemManager;
- (HUCalendarScrubberContainerViewController)calendarContainerViewController;
- (HUCameraBlurViewController)blurViewController;
- (HUCameraController)initWithConfiguration:(id)a3 cameraDelegate:(id)a4;
- (HUCameraControllerDelegate)cameraDelegate;
- (HUCameraDateDisplayController)dateDisplayController;
- (HUCameraMicrophoneControl)landscapeMicrophoneControl;
- (HUCameraMicrophoneControl)portraitMicrophoneControl;
- (HUCameraPlayerAVBehavior)behavior;
- (HUCameraPlayerAccessoryViewController)accessoryViewController;
- (HUCameraPlayerConfiguration)playerConfiguration;
- (HUCameraPlayerFooterViewController)footerViewController;
- (HUCameraPlayerLiveContentViewController)liveContentViewController;
- (HUCameraPlayerPlaceholderContentViewController)placeholderContentViewController;
- (HUCameraRecordingPlayerView)demoPlayerView;
- (HUCameraStatusOverlayView)cameraStatusView;
- (HUCameraTimelapseController)timelapseController;
- (HUClipScrubberViewController)clipScrubberViewController;
- (HUDiagnosticsCameraPlayerController)diagnosticsController;
- (HUPresentationDelegate)presentationDelegate;
- (NAFuture)calendarScrubberDataSourceFuture;
- (NAFuture)ppt_clipsLoadedFuture;
- (NAUILayoutConstraintSet)calendarConstraintSet;
- (NAUILayoutConstraintSet)cameraStatusViewConstraintSet;
- (NAUILayoutConstraintSet)landscapeMicrophoneConstraintSet;
- (NAUILayoutConstraintSet)portraitMicrophoneConstraintSet;
- (NAUILayoutConstraintSet)scrubberConstraintSet;
- (NSArray)savedControlItems;
- (NSLayoutConstraint)accessoryViewHeightConstraint;
- (NSLayoutConstraint)accessoryViewWidthConstraint;
- (NSLayoutConstraint)cameraStatusViewTopConstraint;
- (NSLayoutConstraint)dayLabelBottomConstraint;
- (NSTimer)liveTimer;
- (OS_dispatch_queue)audioSessionQueue;
- (UIAlertController)airplaneAlertController;
- (UIButton)cameraPickerButton;
- (UILabel)dayLabel;
- (UILabel)timeLabel;
- (UIView)loadingOverlayView;
- (UIView)volumeControlView;
- (UIViewController)tipPopoverController;
- (double)cameraStatusViewConstantForTraitCollection;
- (double)currentScrubberResolutionForBehavior:(id)a3;
- (double)portraitMicrophoneOverlapOffset;
- (id)cameraPickerMenu;
- (id)cameraProfile;
- (id)finishPresentation:(id)a3 animated:(BOOL)a4;
- (id)home;
- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4;
- (id)ppt_clipCollectionView;
- (id)presentInternalViewController:(id)a3;
- (id)presentSettingsViewController;
- (id)tipsObserver;
- (unint64_t)lastTimeControlStatusPriorToCameraSwap;
- (unint64_t)pipState;
- (void)_didBeginPlayerViewControllerPresentation;
- (void)_didEndPlayerViewControllerPresentation;
- (void)_displayAirplaneModeAlert;
- (void)_finishDisplayingTimelineForClip:(id)a3;
- (void)_refreshClipCacheAndRefetchForClipUUID:(id)a3;
- (void)_reloadClipsWithUpdate:(BOOL)a3;
- (void)_resetStateAfterPIP;
- (void)_setupPlaybackEngine:(id)a3;
- (void)_submitTimelinePinchToZoomEvent;
- (void)_updateCanShowOverlayState;
- (void)_updateRecordedClipInterfaceAvailabilityWithAnimation:(BOOL)a3;
- (void)_updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4;
- (void)addCameraStatusOverlayAndPicker;
- (void)addFooterConstraints;
- (void)addFooterViewController;
- (void)cancelAnyPendingLaunchEventAnalytics;
- (void)cancelLiveTimer;
- (void)changeUnanalyzedCameraClipTipShouldDisplayTo:(BOOL)a3;
- (void)cleanUpConstraintSets;
- (void)cleanUpIdleTimerState;
- (void)configureCalendarContainerViewControllerIfNeeded;
- (void)configureClipScrubberViewController;
- (void)configureClipScrubberViewControllerIfNeeded;
- (void)dealloc;
- (void)disableAudioSession;
- (void)dismissEditInterface;
- (void)dismissTip;
- (void)displayCurrentTimeAndDate;
- (void)displayPlaybackUIWithUpdate:(BOOL)a3;
- (void)displayTimelineForClipUUID:(id)a3;
- (void)enableAudioSession;
- (void)executionEnvironmentDidBecomeOccluded:(id)a3;
- (void)executionEnvironmentDidBecomeVisible:(id)a3;
- (void)fetchRequestedClipUsingConfiguration;
- (void)handleSceneDidActivate:(id)a3;
- (void)handleSceneWillDeactivate:(id)a3;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)loadAccessoryViewControllersOnInit;
- (void)loadAuxilliaryViews;
- (void)loadControlItemsOnInit;
- (void)loadDependentViewControllers;
- (void)loadTimelapsePlayer;
- (void)networkDidBecomeUnavailable;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pauseEngineIfNeeded;
- (void)pictureInPictureDidToggleMicrophone;
- (void)playbackControlsDidChangePlayerVolume:(float)a3;
- (void)playbackControlsDidToggleMuted:(BOOL)a3;
- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3;
- (void)playbackEngine:(id)a3 didUpdateClipPlayer:(id)a4;
- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6;
- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4;
- (void)playbackEngine:(id)a3 didUpdateMicrophoneEnabled:(BOOL)a4;
- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4;
- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4;
- (void)playbackEngine:(id)a3 didUpdateScrubbingStatus:(BOOL)a4;
- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4;
- (void)playerViewController:(id)a3 contentViewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5;
- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4;
- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)playerViewControllerDidStartPictureInPicture:(id)a3;
- (void)playerViewControllerDidStopPictureInPicture:(id)a3;
- (void)playerViewControllerWillStartPictureInPicture:(id)a3;
- (void)playerViewControllerWillStopPictureInPicture:(id)a3;
- (void)presentNearbyAccessoriesViewController;
- (void)presentTip;
- (void)removePlaybackHistoryUI;
- (void)setAccessoryViewController:(id)a3;
- (void)setAccessoryViewHeightConstraint:(id)a3;
- (void)setAccessoryViewWidthConstraint:(id)a3;
- (void)setAirplaneAlertController:(id)a3;
- (void)setApplicationIsActive:(BOOL)a3;
- (void)setAudioSessionQueue:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setBlurViewController:(id)a3;
- (void)setCalendarConstraintSet:(id)a3;
- (void)setCalendarContainerViewController:(id)a3;
- (void)setCalendarScrubberDataSourceFuture:(id)a3;
- (void)setCameraDelegate:(id)a3;
- (void)setCameraItem:(id)a3;
- (void)setCameraPickerButton:(id)a3;
- (void)setCameraStatusView:(id)a3;
- (void)setCameraStatusViewConstraintSet:(id)a3;
- (void)setCameraStatusViewTopConstraint:(id)a3;
- (void)setClipScrubberViewController:(id)a3;
- (void)setDateDisplayController:(id)a3;
- (void)setDayLabel:(id)a3;
- (void)setDayLabelBottomConstraint:(id)a3;
- (void)setDemoModeQueuePlayer:(id)a3;
- (void)setDemoPlayerView:(id)a3;
- (void)setDiagnosticsController:(id)a3;
- (void)setDisplayingDetailsViewController:(BOOL)a3;
- (void)setEnteringFullScreen:(BOOL)a3;
- (void)setFinishedFetchingCameraEvents:(BOOL)a3;
- (void)setFooterViewController:(id)a3;
- (void)setFoundCameraClipWithInsufficientAnalysis:(BOOL)a3;
- (void)setHu_playbackControlsAreVisible:(BOOL)a3;
- (void)setIsDismissingViewController:(BOOL)a3;
- (void)setItemManager:(id)a3;
- (void)setLandscapeMicrophoneConstraintSet:(id)a3;
- (void)setLandscapeMicrophoneControl:(id)a3;
- (void)setLastTimeControlStatusPriorToCameraSwap:(unint64_t)a3;
- (void)setLaunchEvent:(id)a3;
- (void)setLiveContentViewController:(id)a3;
- (void)setLiveTimer:(id)a3;
- (void)setLoadingOverlayView:(id)a3;
- (void)setLooper:(id)a3;
- (void)setNeedsToFetchClip:(BOOL)a3;
- (void)setNextControlItem:(id)a3;
- (void)setObservingReadyForDisplay:(BOOL)a3;
- (void)setPipState:(unint64_t)a3;
- (void)setPlaceholderContentViewController:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPlayerConfiguration:(id)a3;
- (void)setPlayerViewController:(id)a3;
- (void)setPortraitMicrophoneConstraintSet:(id)a3;
- (void)setPortraitMicrophoneControl:(id)a3;
- (void)setPpt_clipsLoadedFuture:(id)a3;
- (void)setPresentationDelegate:(id)a3;
- (void)setRecordedClipInterfaceAvailable:(BOOL)a3;
- (void)setSavedControlItems:(id)a3;
- (void)setScrubberConstraintSet:(id)a3;
- (void)setShouldResumePlaying:(BOOL)a3;
- (void)setTimeLabel:(id)a3;
- (void)setTimelapseController:(id)a3;
- (void)setTimelapsePlayerLayer:(id)a3;
- (void)setTipPopoverController:(id)a3;
- (void)setTipsObserver:(id)a3;
- (void)setViewVisible:(BOOL)a3;
- (void)setupConstraintSets;
- (void)setupTipsObserver;
- (void)showCamera:(id)a3;
- (void)startLiveTimer;
- (void)tearDownTipsObserver;
- (void)toggleDemoModeLiveStreamVideo:(BOOL)a3;
- (void)toggleMicrophoneState;
- (void)updateBlurWithPlaybackEngine:(id)a3;
- (void)updateCalendarContainerVisibility:(BOOL)a3;
- (void)updateCameraPlayerForEventPlaybackPosition:(id)a3;
- (void)updateCameraStatus;
- (void)updateCanShowOverlayState;
- (void)updateIdleTimer;
- (void)updateIndicatorColor;
- (void)updateLivePreviewAspectRatio;
- (void)updateMicrophoneAndSpeakerStatus;
- (void)updateMicrophoneControlVisibility;
- (void)updateMicrophoneControls;
- (void)updatePIPBehaviorForDeviceAndConfiguration;
- (void)updatePlaceholderContent;
- (void)updatePlayerVolumeSliderState;
- (void)updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4;
- (void)updateStateForScrubbingStatus:(BOOL)a3 animated:(BOOL)a4;
- (void)updateUnanalyzedCameraClipTip;
- (void)updateViewConstraints;
- (void)updateVolumeControlVisibility;
@end

@implementation HUCameraController

- (void)setupTipsObserver
{
  v2 = self;
  HUCameraController.setupTipsObserver()();
}

- (void)tearDownTipsObserver
{
  v2 = self;
  HUCameraController.tearDownTipsObserver()();
}

- (void)changeUnanalyzedCameraClipTipShouldDisplayTo:(BOOL)a3
{
  int v3 = a3;
  uint64_t v4 = qword_1EA1115E8;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EBA453B8);
  __swift_project_value_buffer(v6, (uint64_t)qword_1EA12E2E0);
  swift_beginAccess();
  sub_1BE9C38A8();
  swift_endAccess();
  if (v7 != v3)
  {
    swift_beginAccess();
    sub_1BE9C38B8();
    swift_endAccess();
  }
}

- (void)presentTip
{
  v2 = self;
  sub_1BE46DB2C();
}

- (void)dismissTip
{
  v2 = self;
  sub_1BE46DFCC();
}

- (HUCameraController)initWithConfiguration:(id)a3 cameraDelegate:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  v56.receiver = self;
  v56.super_class = (Class)HUCameraController;
  v9 = [(HUCameraController *)&v56 init];
  if (v9)
  {
    v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v9;
      __int16 v59 = 2112;
      id v60 = v7;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "%@ init with config:%@", buf, 0x16u);
    }

    v11 = (HFCameraAnalyticsCameraPlayerLaunchEvent *)objc_alloc_init(MEMORY[0x1E4F68F50]);
    launchEvent = v9->_launchEvent;
    v9->_launchEvent = v11;

    v9->_applicationIsActive = 1;
    objc_storeWeak((id *)&v9->_cameraDelegate, v8);
    objc_storeStrong((id *)&v9->_playerConfiguration, a3);
    v13 = [v7 clipUUID];
    v9->_needsToFetchClip = v13 != 0;

    id v14 = objc_alloc(MEMORY[0x1E4F68F98]);
    v15 = [v7 cameraProfile];
    v16 = [v7 home];
    v17 = objc_msgSend(v16, "hf_characteristicValueManager");
    uint64_t v18 = [v14 initWithProfile:v15 valueSource:v17];
    cameraItem = v9->_cameraItem;
    v9->_cameraItem = (HFCameraItem *)v18;

    uint64_t v20 = objc_opt_new();
    ppt_clipsLoadedFuture = v9->_ppt_clipsLoadedFuture;
    v9->_ppt_clipsLoadedFuture = (NAFuture *)v20;

    v22 = [v7 playerViewController];
    v23 = v22;
    if (v22) {
      v24 = v22;
    }
    else {
      v24 = (AVPlayerViewController *)objc_alloc_init(MEMORY[0x1E4F16750]);
    }
    playerViewController = v9->_playerViewController;
    v9->_playerViewController = v24;

    [(AVPlayerViewController *)v9->_playerViewController setModalPresentationStyle:0];
    v26 = [MEMORY[0x1E4F428B8] clearColor];
    v27 = [(AVPlayerViewController *)v9->_playerViewController view];
    [v27 setBackgroundColor:v26];

    if (![(AVPlayerViewController *)v9->_playerViewController isReadyForDisplay]
      && ![(HUCameraController *)v9 isObservingReadyForDisplay])
    {
      [(HUCameraController *)v9 setObservingReadyForDisplay:1];
      v28 = [(HUCameraController *)v9 playerViewController];
      [v28 addObserver:v9 forKeyPath:@"readyForDisplay" options:0 context:HUCameraControllerReadyForDisplayContext];

      v29 = [(HUCameraController *)v9 playerViewController];
      [v29 addObserver:v9 forKeyPath:@"videoBounds" options:0 context:HUCameraControllerReadyForDisplayContext];

      v30 = [(HUCameraController *)v9 playerViewController];
      v31 = [v30 customControlsView];
      [v31 addObserver:v9 forKeyPath:@"bounds" options:0 context:HUCameraControllerReadyForDisplayContext];

      v32 = [(HUCameraController *)v9 volumeControlView];
      [v32 addObserver:v9 forKeyPath:@"bounds" options:3 context:HUCameraControllerReadyForDisplayContext];
    }
    v33 = [[HUCameraPlayerAVBehavior alloc] initWithDelegate:v9];
    behavior = v9->_behavior;
    v9->_behavior = v33;

    v35 = [(HUCameraController *)v9 playerViewController];
    [v35 addBehavior:v9->_behavior];

    v36 = [(AVHomeIPCameraBehavior *)v9->_behavior behaviorContext];
    [v36 setPlaybackControlsIncludeTransportControls:0];

    v37 = [(AVHomeIPCameraBehavior *)v9->_behavior behaviorContext];
    [v37 setPlaybackControlsIncludeDisplayModeControls:1];

    v38 = [(AVHomeIPCameraBehavior *)v9->_behavior behaviorContext];
    [v38 setZoomingEnabled:1];

    [(HUCameraController *)v9 updatePIPBehaviorForDeviceAndConfiguration];
    v39 = [(HUCameraController *)v9 playerViewController];
    [v39 setAllowsEnteringFullScreen:0];

    [(HUCameraController *)v9 _setupPlaybackEngine:v7];
    [(HUCameraController *)v9 _updateRecordedClipInterfaceAvailabilityWithAnimation:0];
    [(HUCameraController *)v9 loadControlItemsOnInit];
    [(HUCameraController *)v9 loadAccessoryViewControllersOnInit];
    v40 = [HUCameraPlayerLiveContentViewController alloc];
    v41 = [(HUCameraController *)v9 playbackEngine];
    uint64_t v42 = [(HUCameraPlayerLiveContentViewController *)v40 initWithPlaybackEngine:v41];
    liveContentViewController = v9->_liveContentViewController;
    v9->_liveContentViewController = (HUCameraPlayerLiveContentViewController *)v42;

    uint64_t v44 = [objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:v9 sourceItem:v9->_cameraItem];
    itemManager = v9->_itemManager;
    v9->_itemManager = (HFItemManager *)v44;

    v46 = [(HUCameraController *)v9 playerViewController];
    [v46 setDelegate:v9];

    v47 = [(HUCameraController *)v9 playerViewController];
    [v47 setUpdatesNowPlayingInfoCenter:0];

    [(HUCameraController *)v9 loadTimelapsePlayer];
    v48 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v48 addObserver:v9 selector:sel_handleShouldDifferentiateWithoutColorDidChange name:*MEMORY[0x1E4F43498] object:0];
    [v48 addObserver:v9 selector:sel_handleSceneWillDeactivate_ name:*MEMORY[0x1E4F43CA0] object:0];
    [v48 addObserver:v9 selector:sel_handleSceneDidActivate_ name:*MEMORY[0x1E4F43C78] object:0];
    dispatch_queue_t v49 = dispatch_queue_create("com.apple.Home.HUCameraController.AudioSessionQueue", 0);
    [(HUCameraController *)v9 setAudioSessionQueue:v49];

    v50 = [MEMORY[0x1E4F153E0] sharedInstance];
    uint64_t v51 = *MEMORY[0x1E4F14F98];
    id v55 = 0;
    [v50 setCategory:v51 error:&v55];
    v52 = (HUCameraController *)v55;

    if (v52)
    {
      v53 = HFLogForCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v52;
        _os_log_error_impl(&dword_1BE345000, v53, OS_LOG_TYPE_ERROR, "Unable to properly set audio playback session with error: %@", buf, 0xCu);
      }
    }
    else
    {
      [(HUCameraController *)v9 enableAudioSession];
    }
    [(HUCameraController *)v9 updateVolumeControlVisibility];
    [(HUCameraController *)v9 setPipState:0];
  }
  return v9;
}

- (void)loadControlItemsOnInit
{
  int v3 = objc_opt_new();
  objc_initWeak(&location, self);
  uint64_t v4 = (void *)[objc_alloc(MEMORY[0x1E4F16710]) initWithTitle:@"Settings" type:0];
  v5 = objc_msgSend(MEMORY[0x1E4F42A80], "hu_settingsImageUsingStandardSymbolConfiguration:", 0);
  [v4 setImage:v5];

  uint64_t v6 = MEMORY[0x1E4F143A8];
  uint64_t v7 = 3221225472;
  id v8 = __44__HUCameraController_loadControlItemsOnInit__block_invoke;
  v9 = &unk_1E63862A0;
  objc_copyWeak(&v10, &location);
  [v4 setAction:&v6];
  objc_msgSend(v3, "addObject:", v4, v6, v7, v8, v9);
  [(AVPlayerViewController *)self->_playerViewController setCustomControlItems:v3];
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __44__HUCameraController_loadControlItemsOnInit__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = (id)[WeakRetained presentSettingsViewController];
}

- (void)loadAccessoryViewControllersOnInit
{
  int v3 = objc_alloc_init(HUCameraBlurViewController);
  blurViewController = self->_blurViewController;
  self->_blurViewController = v3;

  v5 = [(HUCameraBlurViewController *)self->_blurViewController view];
  [v5 setAutoresizingMask:18];

  uint64_t v6 = [(HUCameraController *)self playerViewController];
  uint64_t v7 = [v6 contentOverlayView];
  [v7 bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  v16 = [(HUCameraBlurViewController *)self->_blurViewController view];
  objc_msgSend(v16, "setFrame:", v9, v11, v13, v15);

  v17 = [HUCameraPlayerAccessoryViewController alloc];
  uint64_t v18 = [(HUCameraController *)self playbackEngine];
  v19 = [(HUCameraPlayerAccessoryViewController *)v17 initWithPlaybackEngine:v18];
  accessoryViewController = self->_accessoryViewController;
  self->_accessoryViewController = v19;

  v21 = [HUCameraPlayerPlaceholderContentViewController alloc];
  v22 = [(HUCameraController *)self playbackEngine];
  v23 = [(HUCameraPlayerPlaceholderContentViewController *)v21 initWithPlaybackEngine:v22];
  placeholderContentViewController = self->_placeholderContentViewController;
  self->_placeholderContentViewController = v23;

  v25 = [(HUCameraPlayerPlaceholderContentViewController *)self->_placeholderContentViewController view];
  [v25 setAutoresizingMask:18];

  v26 = [(HUCameraController *)self playerViewController];
  v27 = [v26 contentOverlayView];
  [v27 bounds];
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  v36 = [(HUCameraPlayerPlaceholderContentViewController *)self->_placeholderContentViewController view];
  objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

  v37 = [(HUCameraController *)self playerViewController];
  v38 = [(HUCameraController *)self placeholderContentViewController];
  [v37 addChildViewController:v38];

  v39 = [(HUCameraController *)self placeholderContentViewController];
  v40 = [(HUCameraController *)self playerViewController];
  [v39 didMoveToParentViewController:v40];

  v41 = [(HUCameraController *)self playerViewController];
  uint64_t v42 = [(HUCameraController *)self accessoryViewController];
  [v41 addChildViewController:v42];

  v43 = [(HUCameraController *)self accessoryViewController];
  uint64_t v44 = [(HUCameraController *)self playerViewController];
  [v43 didMoveToParentViewController:v44];

  v45 = [(HUCameraController *)self playerViewController];
  v46 = [(HUCameraController *)self blurViewController];
  [v45 addChildViewController:v46];

  v47 = [(HUCameraController *)self blurViewController];
  v48 = [(HUCameraController *)self playerViewController];
  [v47 didMoveToParentViewController:v48];

  dispatch_queue_t v49 = [(HUCameraController *)self playerViewController];
  v50 = [v49 contentOverlayView];
  uint64_t v51 = [(HUCameraController *)self blurViewController];
  v52 = [v51 view];
  [v50 addSubview:v52];

  v53 = [(HUCameraController *)self loadingOverlayView];
  v54 = [(HUCameraController *)self accessoryViewController];
  [v54 setLoadingOverlayView:v53];

  id v55 = [(HUCameraController *)self playerViewController];
  objc_super v56 = [v55 contentOverlayView];
  v57 = [(HUCameraController *)self loadingOverlayView];
  [v56 addSubview:v57];

  v58 = [(HUCameraController *)self playerViewController];
  __int16 v59 = [v58 customControlsView];
  id v60 = [(HUCameraController *)self accessoryViewController];
  uint64_t v61 = [v60 view];
  [v59 addSubview:v61];

  v62 = [(HUCameraController *)self accessoryViewController];
  v63 = [v62 view];
  [v63 setTranslatesAutoresizingMaskIntoConstraints:0];

  v64 = [(HUCameraController *)self accessoryViewController];
  v65 = [v64 view];
  v66 = [v65 widthAnchor];
  v67 = [(HUCameraController *)self playerViewController];
  v68 = [v67 view];
  [v68 bounds];
  v70 = [v66 constraintEqualToConstant:v69];
  [(HUCameraController *)self setAccessoryViewWidthConstraint:v70];

  v71 = [(HUCameraController *)self accessoryViewWidthConstraint];
  [v71 setActive:1];

  v72 = [(HUCameraController *)self accessoryViewController];
  v73 = [v72 view];
  v74 = [v73 heightAnchor];
  v75 = [(HUCameraController *)self playerViewController];
  v76 = [v75 view];
  [v76 bounds];
  v78 = [v74 constraintEqualToConstant:v77];
  [(HUCameraController *)self setAccessoryViewHeightConstraint:v78];

  v79 = [(HUCameraController *)self accessoryViewHeightConstraint];
  [v79 setActive:1];

  v80 = [(HUCameraController *)self accessoryViewController];
  v81 = [v80 view];
  v82 = [v81 centerXAnchor];
  v83 = [(HUCameraController *)self playerViewController];
  v84 = [v83 customControlsView];
  v85 = [v84 centerXAnchor];
  v86 = [v82 constraintEqualToAnchor:v85];
  [v86 setActive:1];

  v87 = [(HUCameraController *)self accessoryViewController];
  v88 = [v87 view];
  v89 = [v88 centerYAnchor];
  v90 = [(HUCameraController *)self playerViewController];
  v91 = [v90 customControlsView];
  v92 = [v91 centerYAnchor];
  v93 = [v89 constraintEqualToAnchor:v92];
  [v93 setActive:1];

  v94 = [(HUCameraController *)self accessoryViewController];
  v95 = [v94 view];
  v96 = [v95 topAnchor];
  v97 = [(HUCameraController *)self playerViewController];
  v98 = [v97 customControlsView];
  v99 = [v98 topAnchor];
  v100 = [v96 constraintEqualToAnchor:v99];
  [v100 setActive:1];

  v101 = [(HUCameraController *)self accessoryViewController];
  v102 = [v101 view];
  v103 = [v102 bottomAnchor];
  v104 = [(HUCameraController *)self playerViewController];
  v105 = [v104 customControlsView];
  v106 = [v105 bottomAnchor];
  v107 = [v103 constraintEqualToAnchor:v106];
  [v107 setActive:1];

  id v111 = [(HUCameraController *)self playerViewController];
  v108 = [v111 contentOverlayView];
  v109 = [(HUCameraController *)self placeholderContentViewController];
  v110 = [v109 view];
  [v108 addSubview:v110];
}

- (void)loadTimelapsePlayer
{
  int v3 = [(HUCameraController *)self cameraProfile];
  uint64_t v4 = [v3 clipManager];
  v5 = [MEMORY[0x1E4F68FE8] sharedManager];
  [v5 setClipManager:v4];

  uint64_t v6 = [HUCameraTimelapseController alloc];
  uint64_t v7 = [(HUCameraController *)self cameraProfile];
  double v8 = [(HUCameraTimelapseController *)v6 initWithCameraProfile:v7];
  [(HUCameraController *)self setTimelapseController:v8];

  double v9 = [(HUCameraController *)self playerViewController];
  double v10 = [v9 customControlsView];
  double v11 = [v10 layer];
  double v12 = [(HUCameraController *)self timelapseController];
  double v13 = [v12 imageLayer];
  [v11 addSublayer:v13];

  id v18 = [(HUCameraController *)self playerViewController];
  double v14 = [v18 customControlsView];
  double v15 = [v14 layer];
  v16 = [(HUCameraController *)self timelapseController];
  v17 = [v16 playerLayer];
  [v15 addSublayer:v17];
}

- (void)loadDependentViewControllers
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  [(HUCameraController *)self addFooterViewController];
  [(HUCameraController *)self configureCalendarContainerViewControllerIfNeeded];
  [(HUCameraController *)self _updateRecordedClipInterfaceAvailabilityWithAnimation:0];
  [(HUCameraController *)self addCameraStatusOverlayAndPicker];
  [(HUCameraController *)self updatePlaceholderContent];
  int v3 = [(HUCameraController *)self playbackEngine];
  uint64_t v4 = [v3 playbackPosition];
  [(HUCameraController *)self updateStateForPlaybackPosition:v4 animated:0];

  v5 = [(HUCameraController *)self playerViewController];
  uint64_t v6 = [v5 customControlsView];
  uint64_t v7 = [(HUCameraController *)self portraitMicrophoneControl];
  [v6 addSubview:v7];

  double v8 = [(HUCameraController *)self playerViewController];
  double v9 = [v8 customControlsView];
  double v10 = [(HUCameraController *)self landscapeMicrophoneControl];
  [v9 addSubview:v10];

  double v11 = [(HUCameraController *)self cameraProfile];
  LODWORD(v9) = objc_msgSend(v11, "hf_supportsBidirectionalAudio");

  double v12 = HFLogForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v13)
    {
      double v14 = [(HUCameraController *)self cameraProfile];
      double v15 = [v14 accessory];
      v16 = [v15 name];
      *(_DWORD *)buf = 138412290;
      v75 = v16;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Display microphone control for %@.", buf, 0xCu);
    }
    v17 = [(HUCameraController *)self playbackEngine];
    uint64_t v18 = [v17 isMicrophoneEnabled];
    v19 = [(HUCameraController *)self portraitMicrophoneControl];
    [v19 setTalking:v18];

    double v12 = [(HUCameraController *)self playbackEngine];
    uint64_t v20 = [v12 isMicrophoneEnabled];
    v21 = [(HUCameraController *)self landscapeMicrophoneControl];
    [v21 setTalking:v20];
  }
  else if (v13)
  {
    v22 = [(HUCameraController *)self cameraProfile];
    v23 = [v22 accessory];
    v24 = [v23 name];
    *(_DWORD *)buf = 138412290;
    v75 = v24;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Hide microphone control for %@.", buf, 0xCu);
  }
  [(HUCameraController *)self setupConstraintSets];
  [(HUCameraController *)self updateMicrophoneControls];
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    v25 = [(HUCameraController *)self accessoryViewController];
    v26 = [v25 view];
    [v26 setHidden:1];

    v27 = [(HUCameraController *)self blurViewController];
    double v28 = [v27 view];
    [v28 setHidden:1];

    double v29 = [(HUCameraController *)self playerViewController];
    double v30 = [v29 view];
    double v31 = [(HUCameraController *)self dayLabel];
    [v30 addSubview:v31];

    double v32 = [(HUCameraController *)self playerViewController];
    double v33 = [v32 view];
    double v34 = [(HUCameraController *)self timeLabel];
    [v33 addSubview:v34];

    double v35 = [(HUCameraController *)self demoPlayerView];

    if (!v35)
    {
      v36 = (void *)MEMORY[0x1E4F690D8];
      v37 = [(HUCameraController *)self cameraProfile];
      v38 = [v37 accessory];
      v39 = [v38 name];
      uint64_t v40 = [v36 demoLiveStreamURLForCameraName:v39];

      v72 = (void *)v40;
      uint64_t v41 = [MEMORY[0x1E4F16620] playerItemWithURL:v40];
      id v42 = objc_alloc_init(MEMORY[0x1E4F16670]);
      [(HUCameraController *)self setDemoModeQueuePlayer:v42];
      v71 = (void *)v41;
      v43 = [MEMORY[0x1E4F16658] playerLooperWithPlayer:v42 templateItem:v41];
      [(HUCameraController *)self setLooper:v43];

      v70 = v42;
      uint64_t v44 = [[HUCameraRecordingPlayerView alloc] initWithPlayer:v42 displayingProgressView:0];
      [(HUCameraController *)self setDemoPlayerView:v44];

      v45 = [(HUCameraController *)self playerViewController];
      v46 = [v45 contentOverlayView];
      v47 = [(HUCameraController *)self demoPlayerView];
      [v46 addSubview:v47];

      v48 = [(HUCameraController *)self demoPlayerView];
      [v48 setTranslatesAutoresizingMaskIntoConstraints:0];
      LODWORD(v47) = [MEMORY[0x1E4F69758] isAMac];
      dispatch_queue_t v49 = [(HUCameraController *)self playerViewController];
      v50 = [v49 view];
      uint64_t v51 = v50;
      if (v47)
      {
        uint64_t v52 = [v50 safeAreaLayoutGuide];

        uint64_t v51 = (void *)v52;
      }

      v53 = [(HUCameraController *)self playerViewController];
      v54 = [v53 contentOverlayView];

      v64 = (void *)MEMORY[0x1E4F28DC8];
      double v69 = [v54 topAnchor];
      v68 = [v48 topAnchor];
      v67 = [v69 constraintEqualToAnchor:v68];
      v73[0] = v67;
      v66 = [v54 bottomAnchor];
      v65 = [v48 bottomAnchor];
      v63 = [v66 constraintEqualToAnchor:v65];
      v73[1] = v63;
      id v55 = [v54 leadingAnchor];
      objc_super v56 = [v48 leadingAnchor];
      v57 = [v55 constraintEqualToAnchor:v56];
      v73[2] = v57;
      v58 = [v54 trailingAnchor];
      __int16 v59 = [v48 trailingAnchor];
      id v60 = [v58 constraintEqualToAnchor:v59];
      v73[3] = v60;
      uint64_t v61 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:4];
      [v64 activateConstraints:v61];
    }
  }
  v62 = [(HUCameraController *)self portraitMicrophoneControl];
  [v62 layoutIfNeeded];
}

- (void)addCameraStatusOverlayAndPicker
{
  int v3 = [MEMORY[0x1E4F427E0] buttonWithType:0];
  [(HUCameraController *)self setCameraPickerButton:v3];

  uint64_t v4 = [(HUCameraController *)self cameraPickerButton];
  [v4 setAutoresizingMask:18];

  v5 = [(HUCameraController *)self cameraStatusView];
  [v5 bounds];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(HUCameraController *)self cameraPickerButton];
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

  double v15 = [(HUCameraController *)self cameraPickerButton];
  [v15 setTitle:@" " forState:0];

  v16 = [(HUCameraController *)self cameraStatusView];
  v17 = [(HUCameraController *)self cameraPickerButton];
  [v16 addSubview:v17];

  uint64_t v18 = [(HUCameraController *)self playerViewController];
  v19 = [v18 customControlsView];
  uint64_t v20 = [(HUCameraController *)self cameraStatusView];
  objc_msgSend(v19, "naui_addAutoLayoutSubview:", v20);

  if ([(HUCameraController *)self homeHasMultipleCameraProfiles])
  {
    v21 = [(HUCameraController *)self cameraPickerButton];
    [v21 setContextMenuInteractionEnabled:1];

    v22 = [(HUCameraController *)self cameraPickerButton];
    [v22 setShowsMenuAsPrimaryAction:1];

    id v25 = [(HUCameraController *)self cameraPickerMenu];
    v23 = [(HUCameraController *)self cameraPickerButton];
    [v23 setMenu:v25];
  }
  else
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v24, OS_LOG_TYPE_DEFAULT, "Not showing camera picker for single camera", buf, 2u);
    }
  }
}

- (void)loadAuxilliaryViews
{
  if ([(HUCameraController *)self hasRecordedClips])
  {
    int v3 = [(HUCameraController *)self dayLabel];
    [v3 alpha];
    double v5 = v4;

    if (v5 < 1.0)
    {
      double v6 = [(HUCameraController *)self dayLabel];
      [v6 setAlpha:1.0];

      double v7 = [(HUCameraController *)self timeLabel];
      [v7 setAlpha:1.0];

      double v8 = [(HUCameraController *)self dayLabelBottomConstraint];
      [v8 setConstant:120.0];
    }
  }
  [(HUCameraController *)self updatePlaceholderContent];
  if ([(HUCameraController *)self shouldAutoPlayOnViewAppearance])
  {
    double v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Autoplaying playback engine on viewWillAppear:.", buf, 2u);
    }

    if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
    {
      [(HUCameraController *)self toggleDemoModeLiveStreamVideo:1];
      double v10 = [(HUCameraController *)self demoPlayerView];
      double v11 = [v10 superview];
      double v12 = [(HUCameraController *)self demoPlayerView];
      [v11 bringSubviewToFront:v12];
    }
    else
    {
      double v10 = [(HUCameraController *)self playbackEngine];
      [v10 play];
    }
  }
  [(HUCameraController *)self setViewVisible:1];
  [(HUCameraController *)self updateMicrophoneControls];
  if ([(HUCameraController *)self needsToFetchClip]) {
    [(HUCameraController *)self fetchRequestedClipUsingConfiguration];
  }
  dispatch_time_t v13 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__HUCameraController_loadAuxilliaryViews__block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  dispatch_after(v13, MEMORY[0x1E4F14428], block);
}

void __41__HUCameraController_loadAuxilliaryViews__block_invoke(uint64_t a1)
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "did attempt to flash", v4, 2u);
  }

  int v3 = [*(id *)(a1 + 32) playerViewController];
  [v3 flashPlaybackControlsWithDuration:1.79769313e308];
}

- (void)_setupPlaybackEngine:(id)a3
{
  id v26 = a3;
  double v4 = [v26 playbackEngine];

  if (v4)
  {
    double v5 = [v26 playbackEngine];
    [(HUCameraController *)self setPlaybackEngine:v5];
    goto LABEL_12;
  }
  id v6 = objc_alloc(MEMORY[0x1E4F68FB8]);
  double v7 = [(HUCameraController *)self home];
  double v8 = [(HUCameraController *)self cameraProfile];
  double v5 = (void *)[v6 initWithHome:v7 cameraProfile:v8];

  double v9 = [(HUCameraController *)self behavior];
  [v5 setClipScrubber:v9];

  double v10 = [(HUCameraController *)self playerConfiguration];
  double v11 = [v10 startingPlaybackDate];

  if (v11)
  {
    double v12 = (void *)MEMORY[0x1E4F68FC8];
    dispatch_time_t v13 = [(HUCameraController *)self playerConfiguration];
    double v14 = [v13 startingPlaybackDate];
    double v15 = [v12 clipPositionWithDate:v14];
    [v5 setPlaybackPosition:v15];
  }
  id v16 = objc_alloc_init(MEMORY[0x1E4F68FB0]);
  [(HUCameraController *)self setPlaybackEngine:v16];

  id v17 = objc_alloc_init(MEMORY[0x1E4F68FC0]);
  [v17 setPeriodicTimeUpdateInterval:&unk_1F19B6310];
  uint64_t v18 = [(HUCameraController *)self playbackEngine];
  [v18 addObserver:self withOptions:v17];

  v19 = [(HUCameraController *)self playbackEngine];
  [v19 updateConfiguration:v5];

  uint64_t v20 = [(HUCameraController *)self cameraProfile];
  if (objc_msgSend(v20, "hf_supportsRecordingEvents"))
  {

    goto LABEL_8;
  }
  char v21 = [MEMORY[0x1E4F69758] isPressDemoModeEnabled];

  if (v21)
  {
LABEL_8:
    v22 = [(HUCameraController *)self playerConfiguration];
    v23 = [v22 clipUUID];

    if (v23)
    {
      v24 = [(HUCameraController *)self playerConfiguration];
      id v25 = [v24 clipUUID];
      [(HUCameraController *)self displayTimelineForClipUUID:v25];
    }
    else
    {
      [(HUCameraController *)self _reloadClipsWithUpdate:1];
    }
  }

LABEL_12:
}

- (id)home
{
  v2 = [(HUCameraController *)self playerConfiguration];
  int v3 = [v2 home];

  return v3;
}

- (id)cameraProfile
{
  v2 = [(HUCameraController *)self playerConfiguration];
  int v3 = [v2 cameraProfile];

  return v3;
}

- (BOOL)hasRecordedClips
{
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
    return 1;
  }
  double v4 = [(HUCameraController *)self cameraProfile];
  if (objc_msgSend(v4, "hf_supportsRecordingEvents"))
  {
    double v5 = [(HUCameraController *)self playbackEngine];
    id v6 = [v5 cameraClips];
    BOOL v3 = [v6 count] != 0;
  }
  else
  {
    BOOL v3 = 0;
  }

  return v3;
}

- (AVHomeLoadingButtonControlItem)nextControlItem
{
  nextControlItem = self->_nextControlItem;
  if (!nextControlItem)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F16720]);
    double v5 = _HULocalizedStringWithDefaultValue(@"HUCameraNextText", @"HUCameraNextText", 1);
    id v6 = (AVHomeLoadingButtonControlItem *)[v4 initWithTitle:v5 type:1];
    double v7 = self->_nextControlItem;
    self->_nextControlItem = v6;

    double v8 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(AVHomeLoadingButtonControlItem *)self->_nextControlItem setTintColor:v8];

    double v9 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
    [(AVHomeLoadingButtonControlItem *)self->_nextControlItem setTitleFont:v9];

    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __37__HUCameraController_nextControlItem__block_invoke;
    v11[3] = &unk_1E63862A0;
    objc_copyWeak(&v12, &location);
    [(AVHomeLoadingButtonControlItem *)self->_nextControlItem setAction:v11];
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
    nextControlItem = self->_nextControlItem;
  }

  return nextControlItem;
}

void __37__HUCameraController_nextControlItem__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HUCameraController_nextControlItem__block_invoke_2;
  block[3] = &unk_1E6386018;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x1E4F14428], block);
  v2 = [WeakRetained playbackEngine];
  [v2 pause];

  BOOL v3 = [WeakRetained clipScrubberViewController];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __37__HUCameraController_nextControlItem__block_invoke_3;
  v4[3] = &unk_1E6386018;
  v4[4] = WeakRetained;
  [v3 exportCurrentClipWithCompletion:v4];
}

void __37__HUCameraController_nextControlItem__block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nextControlItem];
  [v1 setShowsLoadingIndicator:1];
}

void __37__HUCameraController_nextControlItem__block_invoke_3(uint64_t a1)
{
  v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Handing off export to sharekit.", buf, 2u);
  }

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__HUCameraController_nextControlItem__block_invoke_131;
  block[3] = &unk_1E6386018;
  block[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __37__HUCameraController_nextControlItem__block_invoke_131(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) nextControlItem];
  [v1 setShowsLoadingIndicator:0];
}

- (void)setViewVisible:(BOOL)a3
{
  if (self->_viewVisible != a3)
  {
    self->_viewVisible = a3;
    [(HUCameraController *)self updateCanShowOverlayState];
  }
}

- (void)setEnteringFullScreen:(BOOL)a3
{
  if (self->_enteringFullScreen != a3)
  {
    self->_enteringFullScreen = a3;
    [(HUCameraController *)self updateCanShowOverlayState];
  }
}

- (id)ppt_clipCollectionView
{
  v2 = [(HUCameraController *)self clipScrubberViewController];
  BOOL v3 = [v2 view];
  id v4 = [v3 subviews];
  double v5 = objc_msgSend(v4, "na_firstObjectPassingTest:", &__block_literal_global_243);

  id v6 = [v5 clipCollectionView];

  return v6;
}

uint64_t __44__HUCameraController_ppt_clipCollectionView__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (double)cameraStatusViewConstantForTraitCollection
{
  BOOL v3 = [(HUCameraController *)self playerViewController];
  id v4 = [v3 traitCollection];
  int v5 = objc_msgSend(v4, "hu_hasExtendedWidth");

  if (v5) {
    double v6 = 0.0;
  }
  else {
    double v6 = 47.0;
  }
  double v7 = [(HUCameraController *)self playbackEngine];
  double v8 = [v7 playbackPosition];
  double v9 = [MEMORY[0x1E4F68FC8] livePosition];
  char v10 = [v8 isEqual:v9];

  if ((v10 & 1) == 0)
  {
    double v6 = v6 + 10.0;
    double v11 = [(HUCameraController *)self playbackEngine];
    int v12 = [v11 hasRecordingEvents];

    if (v12) {
      return v6 + 47.0;
    }
  }
  return v6;
}

- (void)setupConstraintSets
{
  objc_initWeak(&location, self);
  BOOL v3 = [(HUCameraController *)self cameraStatusView];
  id v4 = [v3 topAnchor];
  int v5 = [(HUCameraController *)self playerViewController];
  double v6 = [v5 customControlsView];
  double v7 = [v6 volumeControlsAreaLayoutGuide];
  double v8 = [v7 topAnchor];
  double v9 = [v4 constraintEqualToAnchor:v8];
  [(HUCameraController *)self setCameraStatusViewTopConstraint:v9];

  id v10 = objc_alloc(MEMORY[0x1E4F7A100]);
  double v11 = [(HUCameraController *)self cameraStatusView];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __41__HUCameraController_setupConstraintSets__block_invoke;
  v28[3] = &unk_1E638F990;
  objc_copyWeak(&v29, &location);
  int v12 = (void *)[v10 initWithOwningView:v11 constraintBuilder:v28];
  [(HUCameraController *)self setCameraStatusViewConstraintSet:v12];

  id v13 = objc_alloc(MEMORY[0x1E4F7A100]);
  double v14 = [(HUCameraController *)self playerViewController];
  double v15 = [v14 view];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __41__HUCameraController_setupConstraintSets__block_invoke_2;
  v26[3] = &unk_1E638F990;
  objc_copyWeak(&v27, &location);
  id v16 = (void *)[v13 initWithOwningView:v15 constraintBuilder:v26];
  [(HUCameraController *)self setPortraitMicrophoneConstraintSet:v16];

  id v17 = objc_alloc(MEMORY[0x1E4F7A100]);
  uint64_t v18 = [(HUCameraController *)self playerViewController];
  v19 = [v18 view];
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  v23 = __41__HUCameraController_setupConstraintSets__block_invoke_3;
  v24 = &unk_1E638F990;
  objc_copyWeak(&v25, &location);
  uint64_t v20 = (void *)[v17 initWithOwningView:v19 constraintBuilder:&v21];
  -[HUCameraController setLandscapeMicrophoneConstraintSet:](self, "setLandscapeMicrophoneConstraintSet:", v20, v21, v22, v23, v24);

  [(HUCameraController *)self addFooterConstraints];
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);
}

id __41__HUCameraController_setupConstraintSets__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v5 = [v3 superview];

  if (v5)
  {
    double v6 = [MEMORY[0x1E4F1CA48] array];
    double v7 = [WeakRetained playerViewController];
    double v8 = [v7 customControlsView];

    double v9 = [WeakRetained cameraStatusViewTopConstraint];
    [v6 addObject:v9];

    id v10 = [v3 heightAnchor];
    double v11 = [v10 constraintEqualToConstant:47.0];
    [v6 addObject:v11];

    int v12 = [WeakRetained cameraStatusViewTopConstraint];
    [v12 constant];
    double v14 = v13;

    if (v14 <= 0.0)
    {
      uint64_t v20 = [v3 leadingAnchor];
      uint64_t v21 = [v8 unobscuredTopAreaLayoutGuide];
      uint64_t v22 = [v21 leadingAnchor];
      v23 = [v20 constraintEqualToAnchor:v22];
      [v6 addObject:v23];

      uint64_t v18 = [v3 trailingAnchor];
      v19 = [v8 unobscuredTopAreaLayoutGuide];
      [v19 trailingAnchor];
    }
    else
    {
      double v15 = [v3 centerXAnchor];
      id v16 = [v8 centerXAnchor];
      id v17 = [v15 constraintEqualToAnchor:v16];
      [v6 addObject:v17];

      uint64_t v18 = [v3 widthAnchor];
      v19 = [v8 animatedUnobscuredCenterAreaLayoutGuide];
      [v19 widthAnchor];
    v24 = };
    id v25 = [v18 constraintEqualToAnchor:v24];
    [v6 addObject:v25];
  }
  else
  {
    double v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

id __41__HUCameraController_setupConstraintSets__block_invoke_2(uint64_t a1)
{
  v28[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v27 = [WeakRetained portraitMicrophoneControl];
  double v6 = [v27 centerXAnchor];
  id v25 = [WeakRetained playerViewController];
  v24 = [v25 customControlsView];
  [v24 centerXAnchor];
  v23 = id v26 = v6;
  uint64_t v22 = objc_msgSend(v6, "constraintEqualToAnchor:");
  v28[0] = v22;
  uint64_t v21 = [WeakRetained playbackEngine];
  int v20 = [v21 hasRecordingEvents];
  if (v20
    && ([WeakRetained timeLabel],
        v19 = objc_claimAutoreleasedReturnValue(),
        [v19 superview],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v18 = (void *)v7;
    id v17 = [WeakRetained portraitMicrophoneControl];
    double v8 = [v17 bottomAnchor];
    double v15 = [WeakRetained timeLabel];
    [v15 topAnchor];
    double v14 = v16 = v8;
    double v9 = objc_msgSend(v8, "constraintEqualToAnchor:constant:", -16.0);
    int v10 = 0;
    int v11 = 1;
  }
  else
  {
    double v8 = [WeakRetained portraitMicrophoneControl];
    id v1 = [v8 centerYAnchor];
    id v2 = [WeakRetained footerViewController];
    id v3 = [v2 view];
    id v4 = [v3 centerYAnchor];
    [WeakRetained portraitMicrophoneOverlapOffset];
    double v9 = objc_msgSend(v1, "constraintEqualToAnchor:constant:", v4);
    uint64_t v18 = 0;
    int v11 = 0;
    int v10 = 1;
  }
  v28[1] = v9;
  int v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:2];
  if (v10)
  {
  }
  if (v11)
  {
  }
  if (v20)
  {
  }

  return v12;
}

id __41__HUCameraController_setupConstraintSets__block_invoke_3(uint64_t a1)
{
  v21[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = [WeakRetained shouldDisplayLandscapeMicrophoneInLine];
  id v3 = [WeakRetained landscapeMicrophoneControl];
  id v4 = [v3 trailingAnchor];
  int v5 = [WeakRetained playerViewController];
  double v6 = [v5 customControlsView];
  uint64_t v7 = [v6 volumeControlsAreaLayoutGuide];
  double v8 = v7;
  if (v2)
  {
    double v9 = [v7 leadingAnchor];
    [v4 constraintGreaterThanOrEqualToAnchor:v9 constant:-16.0];
  }
  else
  {
    double v9 = [v7 trailingAnchor];
    [v4 constraintEqualToAnchor:v9];
  int v10 = };

  LODWORD(v11) = 1132068864;
  [v10 setPriority:v11];
  int v12 = [WeakRetained shouldDisplayLandscapeMicrophoneInLine];
  double v13 = [WeakRetained landscapeMicrophoneControl];
  double v14 = v13;
  if (v12)
  {
    double v15 = [v13 centerYAnchor];
    id v16 = [WeakRetained volumeControlView];
    id v17 = [v16 centerYAnchor];
    [v15 constraintEqualToAnchor:v17];
  }
  else
  {
    double v15 = [v13 topAnchor];
    id v16 = [WeakRetained volumeControlView];
    id v17 = [v16 bottomAnchor];
    [v15 constraintEqualToAnchor:v17 constant:20.0];
  uint64_t v18 = };
  v21[0] = v18;
  v21[1] = v10;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:2];

  return v19;
}

- (void)addFooterConstraints
{
  id v3 = [(HUCameraController *)self footerViewController];
  id v4 = [v3 view];
  int v5 = [v4 heightAnchor];
  double v6 = [v5 constraintEqualToConstant:44.0];
  [v6 setActive:1];

  uint64_t v7 = [(HUCameraController *)self footerViewController];
  double v8 = [v7 view];
  double v9 = [v8 leftAnchor];
  int v10 = [(HUCameraController *)self playerViewController];
  double v11 = [v10 customControlsView];
  int v12 = [v11 unobscuredCenterAreaLayoutGuide];
  double v13 = [v12 leftAnchor];
  double v14 = [v9 constraintEqualToAnchor:v13];
  [v14 setActive:1];

  double v15 = [(HUCameraController *)self footerViewController];
  id v16 = [v15 view];
  id v17 = [v16 rightAnchor];
  uint64_t v18 = [(HUCameraController *)self playerViewController];
  v19 = [v18 customControlsView];
  int v20 = [v19 unobscuredCenterAreaLayoutGuide];
  uint64_t v21 = [v20 rightAnchor];
  uint64_t v22 = [v17 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  id v30 = [(HUCameraController *)self footerViewController];
  v23 = [v30 view];
  v24 = [v23 bottomAnchor];
  id v25 = [(HUCameraController *)self playerViewController];
  id v26 = [v25 customControlsView];
  id v27 = [v26 transportControlsAreaLayoutGuide];
  double v28 = [v27 bottomAnchor];
  id v29 = [v24 constraintEqualToAnchor:v28];
  [v29 setActive:1];
}

- (void)updateViewConstraints
{
  id v3 = [(HUCameraController *)self cameraStatusViewConstraintSet];
  [v3 activateIfNeeded];

  id v4 = [(HUCameraController *)self scrubberConstraintSet];
  [v4 activateIfNeeded];

  int v5 = [(HUCameraController *)self calendarConstraintSet];
  [v5 activateIfNeeded];

  if ([(HUCameraController *)self shouldDisplayMicrophoneControl])
  {
    double v6 = [(HUCameraController *)self portraitMicrophoneConstraintSet];
    [v6 activateIfNeeded];

    id v7 = [(HUCameraController *)self landscapeMicrophoneConstraintSet];
    [v7 activateIfNeeded];
  }
}

- (void)configureClipScrubberViewControllerIfNeeded
{
  id v3 = [(HUCameraController *)self clipScrubberViewController];

  if (!v3)
  {
    [(HUCameraController *)self configureClipScrubberViewController];
    id v7 = [(HUCameraController *)self clipScrubberViewController];
    id v4 = [(HUCameraController *)self playbackEngine];
    int v5 = [(HUCameraController *)self playbackEngine];
    double v6 = [v5 playbackPosition];
    [v7 playbackEngine:v4 didUpdatePlaybackPosition:v6];
  }
}

- (void)configureClipScrubberViewController
{
  v93[6] = *MEMORY[0x1E4F143B8];
  id v3 = [HUClipScrubberViewController alloc];
  id v4 = [(HUCameraController *)self playbackEngine];
  int v5 = [(HUClipScrubberViewController *)v3 initWithPlaybackEngine:v4];
  [(HUCameraController *)self setClipScrubberViewController:v5];

  objc_initWeak(&location, self);
  v90[0] = MEMORY[0x1E4F143A8];
  v90[1] = 3221225472;
  v90[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke;
  v90[3] = &unk_1E63862A0;
  id v55 = &v91;
  objc_copyWeak(&v91, &location);
  double v6 = [(HUCameraController *)self clipScrubberViewController];
  [v6 setAccessoryButtonHandler:v90];

  v88[0] = MEMORY[0x1E4F143A8];
  v88[1] = 3221225472;
  v88[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke_2;
  v88[3] = &unk_1E63862A0;
  objc_super v56 = &v89;
  objc_copyWeak(&v89, &location);
  id v7 = [(HUCameraController *)self clipScrubberViewController];
  [v7 setBeginEditingHandler:v88];

  v86[0] = MEMORY[0x1E4F143A8];
  v86[1] = 3221225472;
  v86[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke_4;
  v86[3] = &unk_1E63862A0;
  v57 = &v87;
  objc_copyWeak(&v87, &location);
  double v8 = [(HUCameraController *)self clipScrubberViewController];
  [v8 setEndEditingHandler:v86];

  double v9 = [(HUCameraController *)self playerViewController];
  int v10 = [v9 customControlsView];
  double v11 = [(HUCameraController *)self dayLabel];
  [v10 addSubview:v11];

  int v12 = [(HUCameraController *)self playerViewController];
  double v13 = [v12 customControlsView];
  double v14 = [(HUCameraController *)self timeLabel];
  [v13 addSubview:v14];

  double v15 = [(HUCameraController *)self playerViewController];
  id v16 = [(HUCameraController *)self clipScrubberViewController];
  [v15 addChildViewController:v16];

  id v17 = [(HUCameraController *)self clipScrubberViewController];
  uint64_t v18 = [v17 view];
  [v18 setTranslatesAutoresizingMaskIntoConstraints:0];

  v19 = [(HUCameraController *)self playerViewController];
  int v20 = [v19 customControlsView];
  uint64_t v21 = [(HUCameraController *)self clipScrubberViewController];
  uint64_t v22 = [v21 view];
  [v20 addSubview:v22];

  v23 = [(HUCameraController *)self clipScrubberViewController];
  v24 = [(HUCameraController *)self playerViewController];
  [v23 didMoveToParentViewController:v24];

  id v25 = [(HUCameraController *)self dayLabel];
  id v26 = [v25 bottomAnchor];
  id v27 = [(HUCameraController *)self clipScrubberViewController];
  double v28 = [v27 view];
  id v29 = [v28 topAnchor];
  id v30 = [v26 constraintEqualToAnchor:v29 constant:120.0];
  [(HUCameraController *)self setDayLabelBottomConstraint:v30];

  v83 = [(HUCameraController *)self dayLabelBottomConstraint];
  v93[0] = v83;
  v82 = [(HUCameraController *)self dayLabel];
  v78 = [v82 leftAnchor];
  v81 = [(HUCameraController *)self playerViewController];
  v80 = [v81 customControlsView];
  v79 = [v80 safeAreaLayoutGuide];
  double v77 = [v79 leftAnchor];
  uint64_t v76 = [v78 constraintEqualToAnchor:v77];
  v93[1] = v76;
  v75 = [(HUCameraController *)self dayLabel];
  v71 = [v75 rightAnchor];
  v74 = [(HUCameraController *)self playerViewController];
  v73 = [v74 customControlsView];
  v72 = [v73 safeAreaLayoutGuide];
  v70 = [v72 rightAnchor];
  double v69 = [v71 constraintEqualToAnchor:v70];
  v93[2] = v69;
  v68 = [(HUCameraController *)self timeLabel];
  v66 = [v68 lastBaselineAnchor];
  v67 = [(HUCameraController *)self dayLabel];
  v65 = [v67 lastBaselineAnchor];
  v64 = [v66 constraintEqualToAnchor:v65 constant:-23.0];
  v93[3] = v64;
  v63 = [(HUCameraController *)self timeLabel];
  __int16 v59 = [v63 leftAnchor];
  v62 = [(HUCameraController *)self playerViewController];
  uint64_t v61 = [v62 customControlsView];
  id v60 = [v61 safeAreaLayoutGuide];
  double v31 = [v60 leftAnchor];
  double v32 = [v59 constraintEqualToAnchor:v31];
  v93[4] = v32;
  double v33 = [(HUCameraController *)self timeLabel];
  double v34 = [v33 rightAnchor];
  double v35 = [(HUCameraController *)self playerViewController];
  v36 = [v35 customControlsView];
  v37 = [v36 safeAreaLayoutGuide];
  v38 = [v37 rightAnchor];
  v39 = [v34 constraintEqualToAnchor:v38];
  v93[5] = v39;
  v58 = [MEMORY[0x1E4F1C978] arrayWithObjects:v93 count:6];

  [MEMORY[0x1E4F28DC8] activateConstraints:v58];
  id v40 = objc_alloc(MEMORY[0x1E4F7A100]);
  uint64_t v41 = [(HUCameraController *)self playerViewController];
  id v42 = [v41 view];
  v84[0] = MEMORY[0x1E4F143A8];
  v84[1] = 3221225472;
  v84[2] = __57__HUCameraController_configureClipScrubberViewController__block_invoke_5;
  v84[3] = &unk_1E638F990;
  objc_copyWeak(&v85, &location);
  v43 = (void *)[v40 initWithOwningView:v42 constraintBuilder:v84];
  [(HUCameraController *)self setScrubberConstraintSet:v43];

  uint64_t v44 = [(HUCameraController *)self scrubberConstraintSet];
  [v44 activateIfNeeded];

  v45 = [(HUCameraController *)self playerViewController];
  v46 = [v45 customControlsView];
  [v46 layoutIfNeeded];

  if ([MEMORY[0x1E4F68FF8] shouldDisplayInternalViews])
  {
    v47 = [HUDiagnosticsCameraPlayerController alloc];
    v48 = [(HUCameraController *)self playerViewController];
    dispatch_queue_t v49 = [(HUCameraController *)self playbackEngine];
    v50 = [(HUCameraController *)self clipScrubberViewController];
    uint64_t v51 = [v50 dataSource];
    uint64_t v52 = [(HUCameraController *)self playbackEngine];
    v53 = [v52 cameraProfile];
    v54 = [(HUDiagnosticsCameraPlayerController *)v47 initWithCameraPlayerViewController:v48 playbackEngine:v49 clipScrubberDataSource:v51 cameraProfile:v53];
    [(HUCameraController *)self setDiagnosticsController:v54];
  }
  objc_destroyWeak(&v85);

  objc_destroyWeak(v57);
  objc_destroyWeak(v56);
  objc_destroyWeak(v55);
  objc_destroyWeak(&location);
}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained presentNearbyAccessoriesViewController];
}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke_2(uint64_t a1)
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained cameraStatusView];
  [v3 setHidden:1];

  id v4 = objc_alloc(MEMORY[0x1E4F16710]);
  int v5 = _HULocalizedStringWithDefaultValue(@"HUCameraCancelText", @"HUCameraCancelText", 1);
  double v6 = (void *)[v4 initWithTitle:v5 type:0];

  id v7 = [MEMORY[0x1E4F42A30] preferredFontForTextStyle:*MEMORY[0x1E4F438A0]];
  [v6 setTitleFont:v7];

  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __57__HUCameraController_configureClipScrubberViewController__block_invoke_3;
  id v25 = &unk_1E63862A0;
  objc_copyWeak(&v26, v1);
  [v6 setAction:&v22];
  double v8 = objc_msgSend(WeakRetained, "behavior", v22, v23, v24, v25);
  double v9 = [v8 behaviorContext];
  [v9 setPlaybackControlsIncludeVolumeControls:0];

  int v10 = [WeakRetained behavior];
  double v11 = [v10 behaviorContext];
  [v11 setPlaybackControlsIncludeDisplayModeControls:0];

  int v12 = [WeakRetained behavior];
  double v13 = [v12 behaviorContext];
  double v14 = [MEMORY[0x1E4F428B8] systemYellowColor];
  double v15 = [WeakRetained nextControlItem];
  [v13 setBackgroundColor:v14 forContainerOfControlItem:v15];

  id v16 = [WeakRetained playerViewController];
  id v17 = [v16 customControlItems];
  [WeakRetained setSavedControlItems:v17];

  v27[0] = v6;
  uint64_t v18 = [WeakRetained nextControlItem];
  v27[1] = v18;
  v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  int v20 = [WeakRetained playerViewController];
  [v20 setCustomControlItems:v19];

  uint64_t v21 = [WeakRetained calendarContainerViewController];
  [v21 setIsEditing:1];

  objc_destroyWeak(&v26);
}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v1 = [WeakRetained clipScrubberViewController];
  [v1 dismissEditInterface];
}

void __57__HUCameraController_configureClipScrubberViewController__block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissEditInterface];
}

id __57__HUCameraController_configureClipScrubberViewController__block_invoke_5(uint64_t a1)
{
  v34[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = [WeakRetained clipScrubberViewController];
  id v3 = [v2 parentViewController];

  if (v3)
  {
    double v32 = [WeakRetained clipScrubberViewController];
    double v31 = [v32 view];
    id v30 = [v31 heightAnchor];
    id v29 = [v30 constraintEqualToConstant:120.0];
    v34[0] = v29;
    double v28 = [WeakRetained clipScrubberViewController];
    id v27 = [v28 view];
    v24 = [v27 leftAnchor];
    id v26 = [WeakRetained playerViewController];
    id v25 = [v26 customControlsView];
    uint64_t v23 = [v25 unobscuredCenterAreaLayoutGuide];
    uint64_t v22 = [v23 leftAnchor];
    uint64_t v21 = [v24 constraintEqualToAnchor:v22];
    v34[1] = v21;
    int v20 = [WeakRetained clipScrubberViewController];
    v19 = [v20 view];
    id v16 = [v19 bottomAnchor];
    uint64_t v18 = [WeakRetained playerViewController];
    id v17 = [v18 customControlsView];
    double v15 = [v17 transportControlsAreaLayoutGuide];
    double v14 = [v15 bottomAnchor];
    id v4 = [v16 constraintEqualToAnchor:v14];
    v34[2] = v4;
    int v5 = [WeakRetained clipScrubberViewController];
    double v6 = [v5 view];
    id v7 = [v6 rightAnchor];
    double v8 = [WeakRetained playerViewController];
    double v9 = [v8 customControlsView];
    int v10 = [v9 unobscuredCenterAreaLayoutGuide];
    double v11 = [v10 rightAnchor];
    int v12 = [v7 constraintEqualToAnchor:v11];
    v34[3] = v12;
    double v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:4];
  }
  else
  {
    double v33 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v33;
}

- (void)_updateRecordedClipInterfaceAvailabilityWithAnimation:(BOOL)a3
{
  if (![(HUCameraController *)self applicationIsActive])
  {
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v9 = "Application is not active. Bypassing scrubber UI update.";
LABEL_15:
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 2u);
    }
LABEL_16:

    return;
  }
  int v5 = [(HUCameraController *)self recordedClipInterfaceAvailable];
  if ([(HUCameraController *)self hasRecordedClips]
    && [(HUCameraController *)self finishedFetchingCameraEvents])
  {
    double v6 = [(HUCameraController *)self playerViewController];
    int v7 = [v6 isViewLoaded];
  }
  else
  {
    int v7 = 0;
  }
  if (![(HUCameraController *)self finishedFetchingCameraEvents])
  {
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      double v9 = "Timeline will not appear until initial clip fetch has been completed.";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  if (v5 != v7)
  {
    int v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Finished clip prep. Safe to update UI.", buf, 2u);
    }

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke;
    v11[3] = &unk_1E63907D0;
    void v11[4] = self;
    char v12 = v7;
    BOOL v13 = a3;
    dispatch_async(MEMORY[0x1E4F14428], v11);
  }
}

void __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setRecordedClipInterfaceAvailable:*(unsigned __int8 *)(a1 + 40)];
  if (*(unsigned char *)(a1 + 40))
  {
    [*(id *)(a1 + 32) configureClipScrubberViewControllerIfNeeded];
    [*(id *)(a1 + 32) configureCalendarContainerViewControllerIfNeeded];
    char v2 = [*(id *)(a1 + 32) scrubberConstraintSet];
    [v2 invalidate];

    id v3 = [*(id *)(a1 + 32) calendarConstraintSet];
    [v3 invalidate];

    id v4 = [*(id *)(a1 + 32) portraitMicrophoneConstraintSet];
    [v4 invalidate];

    int v5 = [*(id *)(a1 + 32) landscapeMicrophoneConstraintSet];
    [v5 invalidate];

    [*(id *)(a1 + 32) updateViewConstraints];
  }
  double v6 = [*(id *)(a1 + 32) cameraStatusView];
  int v7 = [*(id *)(a1 + 32) playbackEngine];
  [v6 updateStatusForPlaybackEngine:v7];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2;
  aBlock[3] = &unk_1E6386730;
  aBlock[4] = *(void *)(a1 + 32);
  double v8 = _Block_copy(aBlock);
  double v9 = [*(id *)(a1 + 32) playerViewController];
  int v10 = [v9 view];
  [v10 updateConstraintsIfNeeded];

  if (*(unsigned char *)(a1 + 41))
  {
    double v11 = (void *)MEMORY[0x1E4F42FF0];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3;
    v12[3] = &unk_1E63907A8;
    id v13 = v8;
    char v14 = *(unsigned char *)(a1 + 40);
    [v11 animateWithDuration:v12 animations:0.3];
  }
  else
  {
    (*((void (**)(void *, void))v8 + 2))(v8, *(unsigned __int8 *)(a1 + 40));
  }
}

void __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (a2) {
    double v4 = 47.0;
  }
  else {
    double v4 = 120.0;
  }
  int v5 = [*(id *)(a1 + 32) dayLabelBottomConstraint];
  [v5 setConstant:v4];

  double v6 = [*(id *)(a1 + 32) dayLabel];
  int v7 = [v6 superview];
  [v7 layoutIfNeeded];

  [*(id *)(a1 + 32) updateCalendarContainerVisibility:a2];
  double v8 = [*(id *)(a1 + 32) clipScrubberViewController];
  double v9 = [v8 view];
  [v9 setAlpha:(double)a2];

  id v11 = [*(id *)(a1 + 32) footerViewController];
  int v10 = [v11 view];
  [v10 setHidden:a2];
}

uint64_t __76__HUCameraController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)displayTimelineForClipUUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    double v6 = [(HUCameraController *)self playerConfiguration];
    int v7 = [v6 clipUUID];
    *(_DWORD *)buf = 138412290;
    char v14 = v7;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Fetch clip with UUID:%@", buf, 0xCu);
  }
  [(HUCameraController *)self setNeedsToFetchClip:0];
  objc_initWeak((id *)buf, self);
  double v8 = [(HUCameraController *)self playbackEngine];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __49__HUCameraController_displayTimelineForClipUUID___block_invoke;
  v10[3] = &unk_1E63907F8;
  objc_copyWeak(&v12, (id *)buf);
  id v9 = v4;
  id v11 = v9;
  [v8 fetchCameraClipForUUID:v9 withCompletion:v10];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __49__HUCameraController_displayTimelineForClipUUID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (v6)
  {
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      id v9 = [WeakRetained playerConfiguration];
      int v10 = [v9 clipUUID];
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Error fetching clip with UUID:%@ error:%@", (uint8_t *)&v11, 0x16u);
    }
  }
  if ([v5 isComplete]) {
    [WeakRetained _finishDisplayingTimelineForClip:v5];
  }
  else {
    [WeakRetained _refreshClipCacheAndRefetchForClipUUID:*(void *)(a1 + 32)];
  }
}

- (void)_refreshClipCacheAndRefetchForClipUUID:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [(HUCameraController *)self cameraProfile];
  id v6 = [v5 clipManager];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke;
  v8[3] = &unk_1E6386E70;
  objc_copyWeak(&v10, &location);
  id v7 = v4;
  id v9 = v7;
  [v6 performCloudPullWithCompletion:v8];

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v5 = [WeakRetained accessoryViewController];
  [v5 setForceLoadingIndicatorToDisplay:0];

  if (v3)
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v3;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(NC) Failure to perform cloud pull:%@.", buf, 0xCu);
    }
  }
  else
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 40));
    id v7 = [v6 playbackEngine];
    uint64_t v8 = *(void *)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke_145;
    v9[3] = &unk_1E6390820;
    id v10 = 0;
    int v11 = v6;
    [v7 fetchCameraClipForUUID:v8 withCompletion:v9];
  }
}

void __61__HUCameraController__refreshClipCacheAndRefetchForClipUUID___block_invoke_145(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (*(void *)(a1 + 32))
  {
    id v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = [*(id *)(a1 + 40) playerConfiguration];
      id v6 = [v5 clipUUID];
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 2112;
      uint64_t v11 = v7;
      _os_log_error_impl(&dword_1BE345000, v4, OS_LOG_TYPE_ERROR, "Error fetching clip with UUID:%@ error:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  [*(id *)(a1 + 40) _finishDisplayingTimelineForClip:v3];
}

- (void)_finishDisplayingTimelineForClip:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(HUCameraController *)self setFinishedFetchingCameraEvents:1];
  if (!v4
    || (id v5 = (void *)MEMORY[0x1E4F68FC8],
        [v4 dateOfOccurrence],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v5 clipPositionWithDate:v6],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    int v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Unable to find valid playback position for clip.dateOfOccurrence. Falling back to LIVE mode when it should have been playback.", buf, 2u);
    }

    uint64_t v7 = 0;
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v10 = [v4 uniqueIdentifier];
    uint64_t v11 = [(HUCameraController *)self cameraProfile];
    *(_DWORD *)buf = 138412802;
    v24 = v10;
    __int16 v25 = 2112;
    id v26 = v7;
    __int16 v27 = 2112;
    double v28 = v11;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Fetch request completed for UUID:%@. Start playback engine at %@ for profile:%@.", buf, 0x20u);
  }
  if ([v4 isComplete])
  {
    uint64_t v12 = [(HUCameraController *)self clipScrubberViewController];
    id v13 = [v12 dataSource];
    [v13 setCurrentTimelineState:2];

    uint64_t v14 = [(HUCameraController *)self playbackEngine];
    [v14 setTimelineState:2];

    uint64_t v15 = [(HUCameraController *)self playbackEngine];
    id v16 = [v4 dateOfOccurrence];
    [v15 updatePlaybackPositionToDate:v16 usingClip:v4];

    id v17 = [(HUCameraController *)self playbackEngine];
    [v17 play];
  }
  [(HUCameraController *)self _updateRecordedClipInterfaceAvailabilityWithAnimation:1];
  [(HUCameraController *)self displayPlaybackUIWithUpdate:1];
  uint64_t v18 = HFLogForCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = [(HUCameraController *)self cameraProfile];
    *(_DWORD *)buf = 138412290;
    v24 = v19;
    _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Requesting all events from HomeKit for camera profile:%@.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  int v20 = [(HUCameraController *)self playbackEngine];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __55__HUCameraController__finishDisplayingTimelineForClip___block_invoke;
  void v21[3] = &unk_1E638AC40;
  objc_copyWeak(&v22, (id *)buf);
  [v20 fetchCameraEventsWithCompletion:v21];

  objc_destroyWeak(&v22);
  objc_destroyWeak((id *)buf);
}

void __55__HUCameraController__finishDisplayingTimelineForClip___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = HFLogForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 134217984;
    uint64_t v25 = [v5 count];
    _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "HomeKit returned events for camera player (count:%lu).", (uint8_t *)&v24, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v9 = WeakRetained;
  if (v5)
  {
    __int16 v10 = objc_msgSend(WeakRetained, "ppt_clipsLoadedFuture");
    [v10 finishWithResult:v5];

LABEL_5:
    uint64_t v11 = HFLogForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v24) = 0;
      _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "Finished loading/display of all clips.", (uint8_t *)&v24, 2u);
    }
    goto LABEL_13;
  }
  uint64_t v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    id v22 = [v9 cameraProfile];
    uint64_t v23 = objc_msgSend(v22, "hf_prettyDescription");
    int v24 = 138412546;
    uint64_t v25 = (uint64_t)v23;
    __int16 v26 = 2112;
    id v27 = v6;
    _os_log_error_impl(&dword_1BE345000, v12, OS_LOG_TYPE_ERROR, "Failed to load clips for camera %@ with error %@", (uint8_t *)&v24, 0x16u);
  }
  id v13 = objc_msgSend(v9, "ppt_clipsLoadedFuture");
  [v13 finishWithError:v6];

  if (!v6) {
    goto LABEL_5;
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v24) = 0;
    _os_log_error_impl(&dword_1BE345000, v14, OS_LOG_TYPE_ERROR, "Bypassing scrubber/calendar updates. Force immediate display of live view.", (uint8_t *)&v24, 2u);
  }

  uint64_t v15 = [MEMORY[0x1E4F68FC8] livePosition];
  id v16 = [v9 playbackEngine];
  [v16 setPlaybackPosition:v15];

  id v17 = [v9 footerViewController];
  uint64_t v18 = [v17 view];
  [v18 setHidden:0];

  v19 = [v9 clipScrubberViewController];
  int v20 = [v19 view];
  [v20 setAlpha:0.0];

  uint64_t v11 = [v9 calendarContainerViewController];
  uint64_t v21 = [v11 view];
  [v21 setAlpha:0.0];

LABEL_13:
}

- (void)fetchRequestedClipUsingConfiguration
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUCameraController *)self playerConfiguration];
    id v5 = [v4 clipUUID];
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = v5;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Proceed to fetch clip with UUID:%@", buf, 0xCu);
  }
  [(HUCameraController *)self setNeedsToFetchClip:0];
  objc_initWeak((id *)buf, self);
  id v6 = [(HUCameraController *)self playbackEngine];
  uint64_t v7 = [v6 cameraProfile];
  int v8 = [v7 clipManager];
  id v9 = [(HUCameraController *)self playerConfiguration];
  __int16 v10 = [v9 clipUUID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke;
  v11[3] = &unk_1E6390848;
  objc_copyWeak(&v12, (id *)buf);
  [v8 fetchClipWithUUID:v10 completion:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

void __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke_2;
  block[3] = &unk_1E6385250;
  objc_copyWeak(&v12, (id *)(a1 + 32));
  id v10 = v6;
  id v11 = v5;
  id v7 = v5;
  id v8 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v12);
}

void __58__HUCameraController_fetchRequestedClipUsingConfiguration__block_invoke_2(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (*(void *)(a1 + 32))
  {
    id v3 = HFLogForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [WeakRetained playerConfiguration];
      v19 = [v18 clipUUID];
      int v20 = *(void **)(a1 + 32);
      int v21 = 138412546;
      id v22 = v19;
      __int16 v23 = 2112;
      int v24 = v20;
      _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Error fetching clip with UUID:%@ error:%@", (uint8_t *)&v21, 0x16u);
    }
  }
  id v4 = *(void **)(a1 + 40);
  if (!v4
    || (id v5 = (void *)MEMORY[0x1E4F68FC8],
        [v4 dateOfOccurrence],
        id v6 = objc_claimAutoreleasedReturnValue(),
        [v5 clipPositionWithDate:v6],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v21) = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Unable to find valid playback position for clip.dateOfOccurrence. Falling back to LIVE mode when it should have been playback.", (uint8_t *)&v21, 2u);
    }

    id v7 = 0;
  }
  id v9 = HFLogForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    id v10 = [WeakRetained playerConfiguration];
    id v11 = [v10 clipUUID];
    id v12 = [WeakRetained cameraProfile];
    int v21 = 138412802;
    id v22 = v11;
    __int16 v23 = 2112;
    int v24 = v7;
    __int16 v25 = 2112;
    __int16 v26 = v12;
    _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Proceed to fetch request completed for UUID:%@. Start playback engine at %@ for profile:%@.", (uint8_t *)&v21, 0x20u);
  }
  id v13 = [WeakRetained clipScrubberViewController];
  uint64_t v14 = [v13 dataSource];
  [v14 setCurrentTimelineState:2];

  uint64_t v15 = [WeakRetained playbackEngine];
  [v15 setTimelineState:2];

  id v16 = [WeakRetained playbackEngine];
  id v17 = [*(id *)(a1 + 40) dateOfOccurrence];
  [v16 updatePlaybackPositionToDate:v17 usingClip:*(void *)(a1 + 40)];

  [WeakRetained _updateRecordedClipInterfaceAvailabilityWithAnimation:1];
  [WeakRetained displayPlaybackUIWithUpdate:1];
}

- (void)_reloadClipsWithUpdate:(BOOL)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    id v5 = [(HUCameraController *)self cameraProfile];
    *(_DWORD *)buf = 138412290;
    id v10 = v5;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Requesting events from HomeKit for camera profile:%@.", buf, 0xCu);
  }
  objc_initWeak((id *)buf, self);
  id v6 = [(HUCameraController *)self playbackEngine];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__HUCameraController__reloadClipsWithUpdate___block_invoke;
  v7[3] = &unk_1E638AC40;
  objc_copyWeak(&v8, (id *)buf);
  [v6 fetchCameraEventsWithCompletion:v7];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __45__HUCameraController__reloadClipsWithUpdate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 count];
    id v10 = [WeakRetained cameraProfile];
    int v60 = 134218242;
    uint64_t v61 = v9;
    __int16 v62 = 2112;
    id v63 = v10;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "HomeKit returned %lu events for %@", (uint8_t *)&v60, 0x16u);
  }
  [WeakRetained setFinishedFetchingCameraEvents:1];
  if (v5)
  {
    uint64_t v11 = objc_msgSend(WeakRetained, "ppt_clipsLoadedFuture");
    [v11 finishWithResult:v5];
  }
  else
  {
    v19 = HFLogForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      v58 = [WeakRetained cameraProfile];
      __int16 v59 = objc_msgSend(v58, "hf_prettyDescription");
      int v60 = 138412546;
      uint64_t v61 = (uint64_t)v59;
      __int16 v62 = 2112;
      id v63 = v6;
      _os_log_error_impl(&dword_1BE345000, v19, OS_LOG_TYPE_ERROR, "Failed to load events for camera %@ with error %@", (uint8_t *)&v60, 0x16u);
    }
    int v20 = objc_msgSend(WeakRetained, "ppt_clipsLoadedFuture");
    [v20 finishWithError:v6];

    if (v6)
    {
      int v21 = HFLogForCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v60) = 0;
        _os_log_error_impl(&dword_1BE345000, v21, OS_LOG_TYPE_ERROR, "Bypassing scrubber/calendar updates. Force immediate display of live view.", (uint8_t *)&v60, 2u);
      }

      id v22 = [MEMORY[0x1E4F68FC8] livePosition];
      __int16 v23 = [WeakRetained playbackEngine];
      [v23 setPlaybackPosition:v22];

      int v24 = [WeakRetained footerViewController];
      __int16 v25 = [v24 view];
      [v25 setHidden:0];

      __int16 v26 = [WeakRetained clipScrubberViewController];
      uint64_t v27 = [v26 view];
      [v27 setAlpha:0.0];

      uint64_t v28 = [WeakRetained calendarContainerViewController];
      uint64_t v29 = [v28 view];
      [v29 setAlpha:0.0];
      goto LABEL_26;
    }
  }
  id v12 = [WeakRetained playerConfiguration];
  id v13 = [v12 clipUUID];

  if (!v13)
  {
    id v30 = [WeakRetained playerConfiguration];
    double v31 = [v30 startingPlaybackDate];

    if (!v31)
    {
LABEL_31:
      [WeakRetained _updateRecordedClipInterfaceAvailabilityWithAnimation:1];
      goto LABEL_32;
    }
    double v32 = [WeakRetained playbackEngine];
    double v33 = [v32 cameraEvents];
    double v34 = [v33 lastObject];

    if (v34)
    {
      double v35 = [WeakRetained playbackEngine];
      v36 = [WeakRetained playerConfiguration];
      v37 = [v36 startingPlaybackDate];
      v38 = [v35 findClipPositionForDate:v37];

      v39 = HFLogForCategory();
      BOOL v40 = os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT);
      if (v38)
      {
        if (v40)
        {
          uint64_t v41 = [WeakRetained playerConfiguration];
          id v42 = [v41 startingPlaybackDate];
          v43 = [v38 clip];
          uint64_t v44 = [WeakRetained cameraProfile];
          v45 = [v44 uniqueIdentifier];
          int v60 = 138412802;
          uint64_t v61 = (uint64_t)v42;
          __int16 v62 = 2112;
          id v63 = v43;
          __int16 v64 = 2112;
          v65 = v45;
          _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "Reload clips with update. Start playback engine at %@ for clip:%@ with profileUUID:%@.", (uint8_t *)&v60, 0x20u);
        }
        v46 = [WeakRetained playbackEngine];
        v47 = [v38 date];
        v48 = [v38 clip];
        [v46 updatePlaybackPositionToDate:v47 usingClip:v48];

        if (![WeakRetained lastTimeControlStatusPriorToCameraSwap]) {
          goto LABEL_30;
        }
        v39 = [WeakRetained playbackEngine];
        [v39 play];
      }
      else if (v40)
      {
        v54 = [WeakRetained playerConfiguration];
        id v55 = [v54 startingPlaybackDate];
        objc_super v56 = [WeakRetained cameraProfile];
        v57 = [v56 uniqueIdentifier];
        int v60 = 138412546;
        uint64_t v61 = (uint64_t)v55;
        __int16 v62 = 2112;
        id v63 = v57;
        _os_log_impl(&dword_1BE345000, v39, OS_LOG_TYPE_DEFAULT, "Unable to find clip after date:%@. Default to live stream for profileUUID:%@.", (uint8_t *)&v60, 0x16u);
      }
LABEL_30:

      goto LABEL_31;
    }
    dispatch_queue_t v49 = HFLogForCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      v50 = [WeakRetained playerConfiguration];
      uint64_t v51 = [v50 startingPlaybackDate];
      uint64_t v52 = [WeakRetained cameraProfile];
      v53 = [v52 uniqueIdentifier];
      int v60 = 138412546;
      uint64_t v61 = (uint64_t)v51;
      __int16 v62 = 2112;
      id v63 = v53;
      _os_log_impl(&dword_1BE345000, v49, OS_LOG_TYPE_DEFAULT, "Failed to find recordings for startDate:%@. Starting live stream for profileUUID:%@.", (uint8_t *)&v60, 0x16u);
    }
    uint64_t v28 = [MEMORY[0x1E4F68FC8] livePosition];
    uint64_t v29 = [WeakRetained playbackEngine];
    [v29 setPlaybackPosition:v28];
LABEL_26:

    goto LABEL_32;
  }
  uint64_t v14 = HFLogForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v15 = [WeakRetained playerConfiguration];
    id v16 = [v15 clipUUID];
    int v60 = 138412290;
    uint64_t v61 = (uint64_t)v16;
    _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Launching camera with clipUUID:%@. Defer launch until view has been loaded.", (uint8_t *)&v60, 0xCu);
  }
  id v17 = [WeakRetained playerViewController];
  int v18 = [v17 isViewLoaded];

  if (v18) {
    [WeakRetained fetchRequestedClipUsingConfiguration];
  }
LABEL_32:
}

- (void)displayPlaybackUIWithUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  [(HUCameraController *)self _updateRecordedClipInterfaceAvailabilityWithAnimation:1];
  if (v3)
  {
    id v5 = [(HUCameraController *)self playbackEngine];
    id v6 = [(HUCameraController *)self accessoryViewController];
    [v6 setPlaybackEngine:v5];

    [(HUCameraController *)self updatePlaceholderContent];
    id v7 = [(HUCameraController *)self playbackEngine];
    id v8 = [v7 playbackPosition];
    [(HUCameraController *)self updateStateForPlaybackPosition:v8 animated:0];

    uint64_t v9 = [(HUCameraController *)self cameraStatusView];
    id v10 = [(HUCameraController *)self playbackEngine];
    [v9 updateStatusForPlaybackEngine:v10];

    [(HUCameraController *)self updateIndicatorColor];
    uint64_t v11 = [(HUCameraController *)self cameraStatusViewConstraintSet];
    [v11 invalidate];
  }
  if ([(HUCameraController *)self shouldResumePlaying])
  {
    id v12 = [(HUCameraController *)self playbackEngine];
    [v12 play];
  }
}

- (void)updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([MEMORY[0x1E4F69758] isInternalTest])
  {
    [(HUCameraController *)self _updateStateForPlaybackPosition:v6 animated:v4];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__HUCameraController_updateStateForPlaybackPosition_animated___block_invoke;
    block[3] = &unk_1E6390870;
    void block[4] = self;
    id v8 = v6;
    BOOL v9 = v4;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __62__HUCameraController_updateStateForPlaybackPosition_animated___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateStateForPlaybackPosition:*(void *)(a1 + 40) animated:*(unsigned __int8 *)(a1 + 48)];
}

- (void)_updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([(HUCameraController *)self applicationIsActive])
  {
    uint64_t v6 = [v5 contentType];
    id v7 = HFLogForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v53 = 138412290;
      id v54 = v5;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "updateStateForPlaybackPosition: %@", (uint8_t *)&v53, 0xCu);
    }

    [(HUCameraController *)self cameraStatusViewConstantForTraitCollection];
    double v9 = v8;
    id v10 = [(HUCameraController *)self cameraStatusViewTopConstraint];
    [v10 constant];
    double v12 = v11;

    if (v12 != v9)
    {
      id v13 = [(HUCameraController *)self cameraStatusViewConstraintSet];
      [v13 invalidate];

      uint64_t v14 = [(HUCameraController *)self cameraStatusViewTopConstraint];
      [v14 setConstant:v9];

      uint64_t v15 = [(HUCameraController *)self cameraStatusViewConstraintSet];
      [v15 activateIfNeeded];
    }
    [(HUCameraController *)self updateIndicatorColor];
    if (v6)
    {
      id v16 = [(HUCameraController *)self liveContentViewController];
      id v17 = [v16 viewIfLoaded];
      [v17 removeFromSuperview];

      if (![MEMORY[0x1E4F69758] isPressDemoModeEnabled]) {
        goto LABEL_16;
      }
      int v18 = [(HUCameraController *)self demoPlayerView];
      [v18 setHidden:1];

      v19 = [(HUCameraController *)self demoModeQueuePlayer];
      [v19 pause];
    }
    else
    {
      int v21 = [(HUCameraController *)self playbackEngine];
      id v22 = [v21 cameraProfile];
      char v23 = objc_msgSend(v22, "hf_shouldDisableLiveStream");

      if ((v23 & 1) == 0)
      {
        int v24 = [(HUCameraController *)self behavior];
        __int16 v25 = [v24 behaviorContext];
        __int16 v26 = [v25 livePreviewContainerView];

        uint64_t v27 = [(HUCameraController *)self liveContentViewController];
        uint64_t v28 = [v27 view];
        objc_msgSend(v26, "naui_addAutoLayoutSubview:", v28);

        uint64_t v29 = (void *)MEMORY[0x1E4F28DC8];
        id v30 = [(HUCameraController *)self liveContentViewController];
        double v31 = [v30 view];
        double v32 = objc_msgSend(v29, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v31, v26);
        [v29 activateConstraints:v32];

        [(HUCameraController *)self updateLivePreviewAspectRatio];
        double v33 = [(HUCameraController *)self liveContentViewController];
        double v34 = [v33 cameraView];
        [v34 setBadgeHidden:1];
      }
      if (![MEMORY[0x1E4F69758] isPressDemoModeEnabled])
      {
LABEL_16:
        uint64_t v38 = v6 == 0;
        v39 = [(HUCameraController *)self behavior];
        BOOL v40 = [v39 behaviorContext];
        [v40 setLivePreviewActive:v38];

        if (v6)
        {
          uint64_t v38 = [(HUCameraController *)self playbackEngine];
          uint64_t v41 = [(id)v38 player];
        }
        else
        {
          uint64_t v41 = 0;
        }
        id v42 = [(HUCameraController *)self playerViewController];
        [v42 setPlayer:v41];

        if (v6)
        {
        }
        v43 = [(HUCameraController *)self playerViewController];
        uint64_t v44 = [v43 player];
        if (v44)
        {
          v45 = (void *)v44;
          v46 = [(HUCameraController *)self playerViewController];
          v47 = [v46 player];
          int v48 = [v47 allowsExternalPlayback];

          if (!v48)
          {
LABEL_25:
            int v20 = [(HUCameraController *)self playbackEngine];
            uint64_t v50 = [v20 prefersAudioEnabled] ^ 1;
            uint64_t v51 = [(HUCameraController *)self playerViewController];
            uint64_t v52 = [v51 playerController];
            [v52 setMuted:v50];

            goto LABEL_26;
          }
          v43 = [(HUCameraController *)self playerViewController];
          dispatch_queue_t v49 = [v43 player];
          [v49 setAllowsExternalPlayback:0];
        }
        goto LABEL_25;
      }
      double v35 = [(HUCameraController *)self demoPlayerView];
      [v35 setHidden:0];

      v36 = [(HUCameraController *)self demoModeQueuePlayer];
      [v36 play];

      v19 = [(HUCameraController *)self liveContentViewController];
      v37 = [v19 view];
      [v37 setHidden:1];
    }
    goto LABEL_16;
  }
  int v20 = HFLogForCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v53) = 0;
    _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "Application is not active. Bypassing playback position updates.", (uint8_t *)&v53, 2u);
  }
LABEL_26:
}

- (void)updateStateForScrubbingStatus:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    id v5 = [(HUCameraController *)self behavior];
    uint64_t v6 = [v5 behaviorContext];
    [v6 setPlaybackControlsIncludeDisplayModeControls:0];

    id v7 = [(HUCameraController *)self behavior];
    double v8 = [v7 behaviorContext];
    [v8 setPlaybackControlsIncludeVolumeControls:0];

    [(HUCameraController *)self updateCalendarContainerVisibility:0];
  }
}

- (void)removePlaybackHistoryUI
{
  [(HUCameraController *)self setRecordedClipInterfaceAvailable:0];
  BOOL v3 = [(HUCameraController *)self clipScrubberViewController];
  BOOL v4 = [v3 view];
  [v4 removeFromSuperview];

  id v5 = [(HUCameraController *)self clipScrubberViewController];
  [v5 removeFromParentViewController];

  [(HUCameraController *)self setClipScrubberViewController:0];
  uint64_t v6 = [(HUCameraController *)self playbackEngine];
  uint64_t v7 = [v6 engineMode];

  if (!v7)
  {
    double v8 = [(HUCameraController *)self calendarContainerViewController];
    double v9 = [v8 view];
    [v9 removeFromSuperview];

    id v10 = [(HUCameraController *)self calendarContainerViewController];
    [v10 removeFromParentViewController];

    [(HUCameraController *)self setCalendarContainerViewController:0];
  }
  double v11 = [(HUCameraController *)self dayLabel];
  [v11 removeFromSuperview];

  [(HUCameraController *)self setDayLabel:0];
  double v12 = [(HUCameraController *)self timeLabel];
  [v12 removeFromSuperview];

  [(HUCameraController *)self setTimeLabel:0];
  [(HUCameraController *)self setDateDisplayController:0];
  id v14 = [(HUCameraController *)self footerViewController];
  id v13 = [v14 view];
  [v13 setHidden:0];
}

- (void)updateIndicatorColor
{
  BOOL v3 = [(HUCameraController *)self playbackEngine];
  int v4 = [v3 isLiveStreaming];

  id v5 = [(HUCameraController *)self cameraProfile];
  uint64_t v6 = [v5 userSettings];
  uint64_t v7 = v6;
  if (v4)
  {
    double v8 = objc_msgSend(v6, "hu_indicatorColorForLiveStreaming");
    double v9 = [(HUCameraController *)self cameraStatusView];
    [v9 setStatusColor:v8];

    id v15 = [(HUCameraController *)self cameraProfile];
    id v10 = [v15 userSettings];
    objc_msgSend(v10, "hu_indicatorImageNameForLiveStreaming");
  }
  else
  {
    double v11 = objc_msgSend(v6, "hu_indicatorColorForCurrentAccessMode");
    double v12 = [(HUCameraController *)self cameraStatusView];
    [v12 setStatusColor:v11];

    id v15 = [(HUCameraController *)self cameraProfile];
    id v10 = [v15 userSettings];
    objc_msgSend(v10, "hu_indicatorImageNameForCurrentAccessMode");
  id v13 = };
  id v14 = [(HUCameraController *)self cameraStatusView];
  [v14 setStatusImageName:v13];
}

- (void)updateCameraStatus
{
  if ([(HUCameraController *)self applicationIsActive])
  {
    BOOL v3 = [(HUCameraController *)self cameraStatusView];
    int v4 = [(HUCameraController *)self playbackEngine];
    [v3 updateStatusForPlaybackEngine:v4];

    [(HUCameraController *)self updateIndicatorColor];
    id v5 = [(HUCameraController *)self accessoryViewController];
    objc_msgSend(v5, "hu_reloadData");

    uint64_t v6 = [(HUCameraController *)self placeholderContentViewController];
    objc_msgSend(v6, "hu_reloadData");

    [(HUCameraController *)self updatePlayerVolumeSliderState];
    uint64_t v7 = [(HUCameraController *)self playbackEngine];
    uint64_t v8 = [v7 engineMode];

    if (v8) {
      return;
    }
    [(HUCameraController *)self updatePIPBehaviorForDeviceAndConfiguration];
    if ([(HUCameraController *)self shouldDisableLiveStreamAfterCameraStatusChange])
    {
      id v14 = [(HUCameraController *)self playbackEngine];
      [v14 pause];
    }
    else
    {
      if ([(HUCameraController *)self displayingDetailsViewController]) {
        return;
      }
      id v10 = [(HUCameraController *)self playbackEngine];
      uint64_t v11 = [v10 timeControlStatus];

      if (v11) {
        return;
      }
      if (![(HUCameraController *)self applicationIsActive])
      {
        double v12 = [(HUCameraController *)self playbackEngine];
        int v13 = [v12 isPictureInPictureModeActive];

        if (!v13) {
          return;
        }
      }
      id v14 = [(HUCameraController *)self playbackEngine];
      [v14 play];
    }
  }
  else
  {
    double v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Bypassing camera status update since camera is not active.", buf, 2u);
    }
  }
}

- (BOOL)shouldDisableLiveStreamAfterCameraStatusChange
{
  char v2 = [(HUCameraController *)self cameraProfile];
  BOOL v3 = [v2 userSettings];
  uint64_t v4 = [v3 currentAccessMode];

  return !v4 || v4 == 3;
}

- (void)updateCanShowOverlayState
{
  if ([(HUCameraController *)self isViewVisible]) {
    uint64_t v3 = [(HUCameraController *)self isEnteringFullScreen] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [(HUCameraController *)self accessoryViewController];
  [v4 setCanShowOverlayContent:v3];
}

- (void)dismissEditInterface
{
  uint64_t v3 = [(HUCameraController *)self savedControlItems];

  if (v3)
  {
    id v4 = [(HUCameraController *)self cameraStatusView];
    [v4 setHidden:0];

    id v5 = [(HUCameraController *)self calendarContainerViewController];
    [v5 setIsEditing:0];

    uint64_t v6 = [(HUCameraController *)self behavior];
    uint64_t v7 = [v6 behaviorContext];
    [v7 setPlaybackControlsIncludeDisplayModeControls:1];

    uint64_t v8 = [(HUCameraController *)self behavior];
    double v9 = [v8 behaviorContext];
    [v9 setPlaybackControlsIncludeVolumeControls:1];

    id v10 = [(HUCameraController *)self behavior];
    uint64_t v11 = [v10 behaviorContext];
    double v12 = [(HUCameraController *)self nextControlItem];
    [v11 setBackgroundColor:0 forContainerOfControlItem:v12];

    int v13 = [(HUCameraController *)self savedControlItems];
    id v14 = [(HUCameraController *)self playerViewController];
    [v14 setCustomControlItems:v13];

    [(HUCameraController *)self setSavedControlItems:0];
    id v15 = [(HUCameraController *)self nextControlItem];
    [v15 setShowsLoadingIndicator:0];
  }
}

- (void)addFooterViewController
{
  uint64_t v3 = [(HUCameraController *)self footerViewController];

  if (!v3)
  {
    id v4 = objc_alloc_init(HUCameraPlayerFooterViewController);
    [(HUCameraController *)self setFooterViewController:v4];

    id v5 = [(HUCameraController *)self playerViewController];
    uint64_t v6 = [(HUCameraController *)self footerViewController];
    [v5 addChildViewController:v6];

    uint64_t v7 = [(HUCameraController *)self footerViewController];
    uint64_t v8 = [(HUCameraController *)self playerViewController];
    [v7 didMoveToParentViewController:v8];

    double v9 = [(HUCameraController *)self footerViewController];
    id v10 = [v9 view];
    [v10 setTranslatesAutoresizingMaskIntoConstraints:0];

    uint64_t v11 = [(HUCameraController *)self footerViewController];
    double v12 = [v11 nearbyAccessoryButton];
    [v12 addTarget:self action:sel_presentNearbyAccessoriesViewController forControlEvents:64];

    id v16 = [(HUCameraController *)self playerViewController];
    int v13 = [v16 customControlsView];
    id v14 = [(HUCameraController *)self footerViewController];
    id v15 = [v14 view];
    [v13 addSubview:v15];
  }
}

- (void)configureCalendarContainerViewControllerIfNeeded
{
  uint64_t v3 = [(HUCameraController *)self calendarContainerViewController];

  if (!v3)
  {
    id v4 = [HUCalendarScrubberDataSource alloc];
    id v5 = [(HUCameraController *)self playbackEngine];
    uint64_t v6 = [v5 cameraProfile];
    uint64_t v7 = [v6 clipManager];
    uint64_t v8 = [(HUCameraController *)self playbackEngine];
    double v9 = [v8 daysWithClips];
    id v10 = [(HUCalendarScrubberDataSource *)v4 initWithCameraClipManager:v7 datesWithClips:v9];

    uint64_t v11 = [HUCalendarScrubberContainerViewController alloc];
    double v12 = [(HUCameraController *)self playbackEngine];
    int v13 = [(HUCalendarScrubberContainerViewController *)v11 initWithPlaybackEngine:v12 calendarScrubberDataSource:v10];
    [(HUCameraController *)self setCalendarContainerViewController:v13];

    id v14 = [(HUCameraController *)self playerViewController];
    id v15 = [(HUCameraController *)self calendarContainerViewController];
    [v14 addChildViewController:v15];

    id v16 = [(HUCameraController *)self playerViewController];
    id v17 = [v16 customControlsView];
    int v18 = [(HUCameraController *)self calendarContainerViewController];
    v19 = [v18 view];
    objc_msgSend(v17, "naui_addAutoLayoutSubview:", v19);

    int v20 = [(HUCameraController *)self calendarContainerViewController];
    int v21 = [(HUCameraController *)self playerViewController];
    [v20 didMoveToParentViewController:v21];

    objc_initWeak(&location, self);
    id v22 = objc_alloc(MEMORY[0x1E4F7A100]);
    char v23 = [(HUCameraController *)self playerViewController];
    int v24 = [v23 view];
    uint64_t v29 = MEMORY[0x1E4F143A8];
    uint64_t v30 = 3221225472;
    double v31 = __70__HUCameraController_configureCalendarContainerViewControllerIfNeeded__block_invoke;
    double v32 = &unk_1E638F990;
    objc_copyWeak(&v33, &location);
    __int16 v25 = (void *)[v22 initWithOwningView:v24 constraintBuilder:&v29];
    -[HUCameraController setCalendarConstraintSet:](self, "setCalendarConstraintSet:", v25, v29, v30, v31, v32);

    __int16 v26 = [(HUCameraController *)self calendarConstraintSet];
    [v26 activateIfNeeded];

    uint64_t v27 = [(HUCameraController *)self playerViewController];
    uint64_t v28 = [v27 customControlsView];
    [v28 layoutIfNeeded];

    [(HUCameraController *)self setCalendarScrubberDataSourceFuture:0];
    objc_destroyWeak(&v33);
    objc_destroyWeak(&location);
  }
}

id __70__HUCameraController_configureCalendarContainerViewControllerIfNeeded__block_invoke(uint64_t a1)
{
  v88[5] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  char v2 = [WeakRetained calendarContainerViewController];
  uint64_t v3 = [v2 parentViewController];

  if (v3)
  {
    id v4 = [WeakRetained calendarContainerViewController];
    id v5 = [v4 view];
    uint64_t v6 = [v5 centerXAnchor];
    uint64_t v7 = [WeakRetained playerViewController];
    uint64_t v8 = [v7 customControlsView];
    double v9 = [v8 unobscuredTopAreaLayoutGuide];
    id v10 = [v9 centerXAnchor];
    uint64_t v11 = [v6 constraintEqualToAnchor:v10];

    LODWORD(v12) = 1148846080;
    id v87 = v11;
    [v11 setPriority:v12];
    int v13 = [WeakRetained calendarContainerViewController];
    id v14 = [v13 view];
    id v15 = [v14 leadingAnchor];
    id v16 = [WeakRetained playerViewController];
    id v17 = [v16 customControlsView];
    int v18 = [v17 displayModeControlsAreaLayoutGuide];
    v19 = [v18 trailingAnchor];
    int v20 = [v15 constraintGreaterThanOrEqualToAnchor:v19 constant:16.0];

    LODWORD(v21) = 1132068864;
    [v20 setPriority:v21];
    id v22 = [WeakRetained calendarContainerViewController];
    char v23 = [v22 view];
    int v24 = [v23 trailingAnchor];
    __int16 v25 = [WeakRetained playerViewController];
    __int16 v26 = [v25 customControlsView];
    uint64_t v27 = [v26 volumeControlsAreaLayoutGuide];
    uint64_t v28 = [v27 leadingAnchor];
    uint64_t v29 = [v24 constraintGreaterThanOrEqualToAnchor:v28 constant:-16.0];

    LODWORD(v30) = 1132068864;
    [v29 setPriority:v30];
    v84 = [WeakRetained playerViewController];
    v83 = [v84 traitCollection];
    LODWORD(v22) = objc_msgSend(v83, "hu_hasExtendedWidth");
    v82 = [WeakRetained calendarContainerViewController];
    v81 = [v82 view];
    double v31 = [v81 topAnchor];
    v79 = [WeakRetained playerViewController];
    double v32 = [v79 customControlsView];
    v78 = v32;
    if (v22) {
      [v32 volumeControlsAreaLayoutGuide];
    }
    else {
    double v77 = [v32 unobscuredCenterAreaLayoutGuide];
    }
    uint64_t v76 = [v77 topAnchor];
    v75 = objc_msgSend(v31, "constraintEqualToAnchor:");
    v88[0] = v75;
    v74 = [WeakRetained playerViewController];
    v73 = [v74 traitCollection];
    char v34 = objc_msgSend(v73, "hu_hasExtendedWidth");
    uint64_t v35 = (uint64_t)v20;
    char v72 = v34;
    if ((v34 & 1) == 0)
    {
      __int16 v64 = [WeakRetained calendarContainerViewController];
      id v63 = [v64 view];
      v36 = [v63 leadingAnchor];
      uint64_t v61 = [WeakRetained playerViewController];
      int v60 = [v61 customControlsView];
      __int16 v59 = [v60 displayModeControlsAreaLayoutGuide];
      [v59 leadingAnchor];
      v58 = __int16 v62 = v36;
      uint64_t v35 = objc_msgSend(v36, "constraintEqualToAnchor:");
    }
    v80 = v31;
    v86 = v20;
    uint64_t v66 = (void *)v35;
    v88[1] = v35;
    v71 = [WeakRetained playerViewController];
    v70 = [v71 traitCollection];
    id v85 = v29;
    char v69 = objc_msgSend(v70, "hu_hasExtendedWidth");
    if ((v69 & 1) == 0)
    {
      v57 = [WeakRetained calendarContainerViewController];
      objc_super v56 = [v57 view];
      v37 = [v56 trailingAnchor];
      id v54 = [WeakRetained playerViewController];
      int v53 = [v54 customControlsView];
      uint64_t v52 = [v53 volumeControlsAreaLayoutGuide];
      [v52 trailingAnchor];
      uint64_t v51 = v55 = v37;
      uint64_t v29 = objc_msgSend(v37, "constraintEqualToAnchor:");
    }
    v65 = v29;
    v88[2] = v29;
    v67 = [WeakRetained calendarContainerViewController];
    uint64_t v38 = [v67 view];
    v39 = [v38 heightAnchor];
    BOOL v40 = [v39 constraintEqualToConstant:47.0];
    v88[3] = v40;
    uint64_t v41 = [WeakRetained playerViewController];
    id v42 = [v41 traitCollection];
    char v43 = objc_msgSend(v42, "hu_hasExtendedWidth");
    uint64_t v44 = v87;
    if ((v43 & 1) == 0)
    {
      uint64_t v50 = [WeakRetained calendarContainerViewController];
      dispatch_queue_t v49 = [v50 view];
      v45 = [v49 centerXAnchor];
      v47 = [WeakRetained playerViewController];
      int v24 = [v47 customControlsView];
      uint64_t v27 = [v24 centerXAnchor];
      int v48 = v45;
      uint64_t v44 = [v45 constraintEqualToAnchor:v27];
    }
    void v88[4] = v44;
    uint64_t v68 = [MEMORY[0x1E4F1C978] arrayWithObjects:v88 count:5];
    if ((v43 & 1) == 0)
    {
    }
    if ((v69 & 1) == 0)
    {
    }
    if ((v72 & 1) == 0)
    {
    }
    id v33 = (void *)v68;
  }
  else
  {
    id v33 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v33;
}

- (void)updateCalendarContainerVisibility:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(HUCameraController *)self playbackEngine];
  if ([v5 isUserScrubbing])
  {
  }
  else
  {
    uint64_t v6 = [(HUCameraController *)self playbackEngine];
    char v7 = [v6 hasRecordingEvents];

    if (v7)
    {
      id v11 = [(HUCameraController *)self calendarContainerViewController];
      uint64_t v8 = [v11 view];
      double v9 = v8;
      double v10 = (double)v3;
      goto LABEL_6;
    }
  }
  id v11 = [(HUCameraController *)self calendarContainerViewController];
  uint64_t v8 = [v11 view];
  double v9 = v8;
  double v10 = 0.0;
LABEL_6:
  [v8 setAlpha:v10];
}

- (id)presentSettingsViewController
{
  BOOL v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v11 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Present settings.", v11, 2u);
  }

  [(HUCameraController *)self setDisplayingDetailsViewController:1];
  [(HUCameraController *)self pauseEngineIfNeeded];
  id v4 = [(HUCameraController *)self liveContentViewController];
  id v5 = [v4 view];
  [v5 setHidden:1];

  [(HUCameraController *)self setDisplayingDetailsViewController:1];
  uint64_t v6 = [(HUCameraController *)self cameraDelegate];
  char v7 = [(HUCameraController *)self cameraItem];
  uint64_t v8 = [v6 detailsViewControllerForCameraItem:v7];

  [v8 setPresentationDelegate:self];
  [v8 _setIgnoreAppSupportedOrientations:1];
  [v8 setModalInPresentation:1];
  double v9 = [(HUCameraController *)self presentInternalViewController:v8];

  return v9;
}

- (void)presentNearbyAccessoriesViewController
{
  BOOL v3 = [HUNearbyAccessoriesViewController alloc];
  id v4 = [(HUCameraController *)self cameraItem];
  uint64_t v6 = [(HUNearbyAccessoriesViewController *)v3 initWithSourceItem:v4 supportsQuickControls:1];

  [(HUNearbyAccessoriesViewController *)v6 setPresentationDelegate:self];
  [(HUNearbyAccessoriesViewController *)v6 _setIgnoreAppSupportedOrientations:1];
  id v5 = [(HUCameraController *)self presentInternalViewController:v6];
}

- (id)presentInternalViewController:(id)a3
{
  id v4 = a3;
  [(HUCameraController *)self cancelAnyPendingLaunchEventAnalytics];
  id v5 = [(HUCameraController *)self playerViewController];
  [v5 setAllowsPictureInPicturePlayback:0];

  uint64_t v6 = (void *)[objc_alloc(MEMORY[0x1E4F42BF8]) initWithRootViewController:v4];
  char v7 = objc_msgSend(MEMORY[0x1E4F428B8], "hf_keyColor");
  uint64_t v8 = [v6 navigationBar];
  [v8 setTintColor:v7];

  [v6 setModalPresentationStyle:2];
  [v6 _setIgnoreAppSupportedOrientations:1];
  double v9 = [(HUCameraController *)self playerViewController];
  double v10 = [v9 viewControllerForFullScreenPresentation];
  id v11 = objc_msgSend(v10, "hu_presentPreloadableViewController:animated:", v6, 1);

  return v11;
}

- (void)cancelAnyPendingLaunchEventAnalytics
{
  BOOL v3 = [(HUCameraController *)self launchEvent];

  if (v3)
  {
    [(HUCameraController *)self setLaunchEvent:0];
  }
}

- (void)_updateCanShowOverlayState
{
  if ([(HUCameraController *)self isViewVisible]) {
    uint64_t v3 = [(HUCameraController *)self isEnteringFullScreen] ^ 1;
  }
  else {
    uint64_t v3 = 0;
  }
  id v4 = [(HUCameraController *)self accessoryViewController];
  [v4 setCanShowOverlayContent:v3];
}

- (BOOL)_shouldAutoPlayOnViewAppearance
{
  uint64_t v3 = [(HUCameraController *)self playbackEngine];
  id v4 = [v3 playbackPosition];
  id v5 = [MEMORY[0x1E4F68FC8] livePosition];
  char v6 = [v4 isEqual:v5];

  if (v6) {
    return 1;
  }
  uint64_t v8 = [(HUCameraController *)self playerConfiguration];
  double v9 = [v8 startingPlaybackDate];

  if (!v9) {
    return 0;
  }
  double v10 = [(HUCameraController *)self playbackEngine];
  id v11 = [v10 currentClip];

  if (!v11) {
    return 0;
  }
  double v12 = [(HUCameraController *)self playbackEngine];
  int v13 = [v12 currentClip];
  id v14 = objc_msgSend(v13, "hf_dateInterval");
  id v15 = [(HUCameraController *)self playerConfiguration];
  id v16 = [v15 startingPlaybackDate];
  uint64_t v17 = objc_msgSend(v14, "hf_searchResultForDate:", v16);

  return v17 == 1;
}

- (void)updateMicrophoneControls
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  if ([(HUCameraController *)self shouldDisplayMicrophoneControl])
  {
    uint64_t v3 = [(HUCameraController *)self playbackEngine];
    uint64_t v4 = [v3 isMicrophoneEnabled];
    id v5 = [(HUCameraController *)self portraitMicrophoneControl];
    [v5 setTalking:v4];

    char v6 = [(HUCameraController *)self playbackEngine];
    uint64_t v7 = [v6 isMicrophoneEnabled];
    uint64_t v8 = [(HUCameraController *)self landscapeMicrophoneControl];
    [v8 setTalking:v7];

    double v9 = [(HUCameraController *)self portraitMicrophoneConstraintSet];
    [v9 invalidate];

    double v10 = [(HUCameraController *)self landscapeMicrophoneConstraintSet];
    [v10 invalidate];

    id v11 = [(HUCameraController *)self portraitMicrophoneConstraintSet];
    [v11 activateIfNeeded];

    double v12 = [(HUCameraController *)self landscapeMicrophoneConstraintSet];
    [v12 activateIfNeeded];
  }
  [(HUCameraController *)self updateMicrophoneControlVisibility];
  int v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    id v14 = [(HUCameraController *)self cameraProfile];
    int v15 = objc_msgSend(v14, "hf_supportsBidirectionalAudio");
    id v16 = [(HUCameraController *)self portraitMicrophoneControl];
    [v16 alpha];
    BOOL v18 = v17 == 0.0;
    v19 = [(HUCameraController *)self landscapeMicrophoneControl];
    [v19 alpha];
    BOOL v21 = v20 == 0.0;
    id v22 = [(HUCameraController *)self playbackEngine];
    v23[0] = 67109888;
    v23[1] = v15;
    __int16 v24 = 1024;
    BOOL v25 = v18;
    __int16 v26 = 1024;
    BOOL v27 = v21;
    __int16 v28 = 1024;
    int v29 = [v22 isLiveStreaming];
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Update microphone display: BiDirectionalAudio:%{BOOL}d PortraitControlHidden:%{BOOL}d LandscapeControlHidden:%{BOOL}d LiveStreaming:%{BOOL}d", (uint8_t *)v23, 0x1Au);
  }
}

- (void)updateMicrophoneControlVisibility
{
  if ([(HUCameraController *)self shouldDisplayMicrophoneControl])
  {
    uint64_t v3 = [(HUCameraController *)self playerViewController];
    uint64_t v4 = [v3 traitCollection];
    int v5 = objc_msgSend(v4, "hu_hasExtendedWidth");

    char v6 = [(HUCameraController *)self portraitMicrophoneControl];
    uint64_t v7 = v6;
    if (v5)
    {
      [v6 setAlpha:0.0];

      uint64_t v8 = [(HUCameraController *)self landscapeMicrophoneControl];
      double v9 = 1.0;
      goto LABEL_7;
    }
    double v10 = 1.0;
  }
  else
  {
    char v6 = [(HUCameraController *)self portraitMicrophoneControl];
    uint64_t v7 = v6;
    double v10 = 0.0;
  }
  [v6 setAlpha:v10];

  uint64_t v8 = [(HUCameraController *)self landscapeMicrophoneControl];
  double v9 = 0.0;
LABEL_7:
  id v11 = v8;
  [v8 setAlpha:v9];
}

- (BOOL)shouldDisplayMicrophoneControl
{
  uint64_t v3 = [(HUCameraController *)self cameraProfile];
  if (objc_msgSend(v3, "hf_supportsBidirectionalAudio"))
  {
    uint64_t v4 = [(HUCameraController *)self playbackEngine];
    if ([v4 engineMode])
    {
      BOOL v5 = 0;
    }
    else
    {
      char v6 = [(HUCameraController *)self playbackEngine];
      BOOL v5 = [v6 timeControlStatus] == 2
        && [(HUCameraController *)self hu_playbackControlsAreVisible];
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)toggleMicrophoneState
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = [(HUCameraController *)self playbackEngine];
    v8[0] = 67109120;
    v8[1] = [v4 isMicrophoneEnabled] ^ 1;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Toggling microphone state:%{BOOL}d using button.", (uint8_t *)v8, 8u);
  }
  BOOL v5 = [(HUCameraController *)self playbackEngine];
  uint64_t v6 = [v5 isMicrophoneEnabled] ^ 1;
  uint64_t v7 = [(HUCameraController *)self playbackEngine];
  [v7 setMicrophoneEnabled:v6];
}

- (double)portraitMicrophoneOverlapOffset
{
  uint64_t v3 = [(HUCameraController *)self footerViewController];
  uint64_t v4 = [v3 view];
  BOOL v5 = [(HUCameraController *)self footerViewController];
  uint64_t v6 = [v5 liveButton];
  [v6 frame];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  int v15 = [(HUCameraController *)self playerViewController];
  id v16 = [v15 view];
  objc_msgSend(v4, "convertRect:toView:", v16, v8, v10, v12, v14);
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  CGFloat v24 = v23;

  v38.origin.x = v18;
  v38.origin.y = v20;
  v38.size.width = v22;
  v38.size.height = v24;
  double MaxX = CGRectGetMaxX(v38);
  __int16 v26 = [(HUCameraController *)self playerViewController];
  BOOL v27 = [v26 view];
  [v27 layoutMargins];
  double v29 = MaxX + v28;

  uint64_t v30 = [(HUCameraController *)self playerViewController];
  double v31 = [v30 view];
  [v31 bounds];
  double v33 = v32;
  char v34 = [(HUCameraController *)self portraitMicrophoneControl];
  [v34 bounds];
  double v36 = v35 * -0.5 + v33 * 0.5;

  double result = -60.0;
  if (v29 <= v36) {
    return 0.0;
  }
  return result;
}

- (BOOL)shouldDisplayLandscapeMicrophoneInLine
{
  uint64_t v3 = [(HUCameraController *)self cameraStatusView];
  uint64_t v4 = [v3 superview];
  BOOL v5 = [(HUCameraController *)self cameraStatusView];
  [v5 frame];
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v14 = [(HUCameraController *)self playerViewController];
  int v15 = [v14 view];
  objc_msgSend(v4, "convertRect:toView:", v15, v7, v9, v11, v13);
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  CGFloat v21 = v20;
  CGFloat v23 = v22;

  v35.origin.x = v17;
  v35.origin.y = v19;
  v35.size.width = v21;
  v35.size.height = v23;
  double MaxX = CGRectGetMaxX(v35);
  BOOL v25 = [(HUCameraController *)self volumeControlView];
  [v25 bounds];
  double v27 = v26;

  double v28 = [(HUCameraController *)self landscapeMicrophoneControl];
  [v28 frame];
  double v30 = v27 + MaxX + 5.0 + v29 + 16.0;

  double v31 = [(HUCameraController *)self playerViewController];
  double v32 = [v31 view];
  [v32 frame];
  LOBYTE(v4) = v30 < v33;

  return (char)v4;
}

- (void)updateMicrophoneAndSpeakerStatus
{
  if ([(HUCameraController *)self applicationIsActive])
  {
    uint64_t v3 = [(HUCameraController *)self playbackEngine];
    int v4 = [v3 isMicrophoneEnabled];

    BOOL v5 = [(HUCameraController *)self portraitMicrophoneControl];
    double v6 = v5;
    if (v4)
    {
      [v5 setTalking:1];

      double v7 = [(HUCameraController *)self landscapeMicrophoneControl];
      [v7 setTalking:1];

      id v13 = [(HUCameraController *)self playerViewController];
      double v8 = [v13 playerController];
      [v8 setMuted:0];
    }
    else
    {
      [v5 setTalking:0];

      double v10 = [(HUCameraController *)self landscapeMicrophoneControl];
      [v10 setTalking:0];

      id v13 = [(HUCameraController *)self playbackEngine];
      uint64_t v11 = [v13 prefersAudioEnabled] ^ 1;
      double v8 = [(HUCameraController *)self playerViewController];
      double v12 = [v8 playerController];
      [v12 setMuted:v11];
    }
  }
  else
  {
    double v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Application is not active. Bypassing audio control updates.", buf, 2u);
    }
  }
}

- (void)updatePlayerVolumeSliderState
{
  id v7 = [(HUCameraController *)self playbackEngine];
  [v7 streamAudioVolume];
  double v4 = v3;
  BOOL v5 = [(HUCameraController *)self playerViewController];
  double v6 = [v5 playerController];
  [v6 setVolume:v4];
}

- (void)updateVolumeControlVisibility
{
  float v3 = [(HUCameraController *)self savedControlItems];

  if (!v3)
  {
    id v7 = [(HUCameraController *)self playbackEngine];
    uint64_t v4 = [v7 shouldDisplayVolumeControls];
    BOOL v5 = [(HUCameraController *)self behavior];
    double v6 = [v5 behaviorContext];
    [v6 setPlaybackControlsIncludeVolumeControls:v4];
  }
}

- (BOOL)homeHasMultipleCameraProfiles
{
  char v2 = [(HUCameraController *)self home];
  float v3 = objc_msgSend(v2, "hf_allCameraProfiles");
  BOOL v4 = (unint64_t)[v3 count] > 1;

  return v4;
}

- (void)showCamera:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(HUCameraController *)self cameraItem];
  double v6 = [v5 accessory];
  int v7 = [v4 isEqual:v6];

  if (v7)
  {
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      double v9 = [v4 uniqueIdentifier];
      *(_DWORD *)buf = 138412290;
      __int16 v59 = v9;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Not switching camera using picker since the selected camera was the same %@.", buf, 0xCu);
    }
  }
  else
  {
    double v10 = [MEMORY[0x1E4F68F90] sharedManager];
    [v10 resetForCameraDismissal];

    uint64_t v11 = [v4 cameraProfiles];
    double v8 = [v11 firstObject];

    double v12 = [v8 clipManager];
    id v13 = [MEMORY[0x1E4F68FE8] sharedManager];
    [v13 setClipManager:v12];

    double v14 = HFLogForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      objc_super v56 = [(HUCameraController *)self cameraProfile];
      int v15 = [v56 uniqueIdentifier];
      double v16 = [(HUCameraController *)self cameraProfile];
      CGFloat v17 = [v16 accessory];
      double v18 = [v17 name];
      [v4 uniqueIdentifier];
      CGFloat v19 = v57 = v4;
      double v20 = [v8 accessory];
      CGFloat v21 = [v20 name];
      *(_DWORD *)buf = 138413058;
      __int16 v59 = v15;
      __int16 v60 = 2112;
      uint64_t v61 = v18;
      __int16 v62 = 2112;
      id v63 = v19;
      __int16 v64 = 2112;
      v65 = v21;
      _os_log_impl(&dword_1BE345000, v14, OS_LOG_TYPE_DEFAULT, "Change camera picker from %@/%@ to %@/%@.", buf, 0x2Au);

      id v4 = v57;
    }

    double v22 = [HUCameraPlayerConfiguration alloc];
    CGFloat v23 = [(HUCameraController *)self home];
    CGFloat v24 = [(HUCameraPlayerConfiguration *)v22 initWithHome:v23 cameraProfile:v8 notificationUUID:0 clipUUID:0];

    BOOL v25 = [(HUCameraController *)self playbackEngine];
    double v26 = [v25 playbackPosition];
    double v27 = [v26 clipPlaybackDate];
    [(HUCameraPlayerConfiguration *)v24 setStartingPlaybackDate:v27];

    [(HUCameraController *)self setPlayerConfiguration:v24];
    double v28 = HFLogForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      double v29 = [(HUCameraController *)self playerConfiguration];
      *(_DWORD *)buf = 138412290;
      __int16 v59 = v29;
      _os_log_impl(&dword_1BE345000, v28, OS_LOG_TYPE_DEFAULT, "Changing camera using configuration:%@", buf, 0xCu);
    }
    id v30 = objc_alloc(MEMORY[0x1E4F68F98]);
    double v31 = [(HUCameraPlayerConfiguration *)v24 cameraProfile];
    double v32 = [(HUCameraPlayerConfiguration *)v24 home];
    double v33 = objc_msgSend(v32, "hf_characteristicValueManager");
    char v34 = (void *)[v30 initWithProfile:v31 valueSource:v33];
    [(HUCameraController *)self setCameraItem:v34];

    CGRect v35 = [(HUCameraController *)self playbackEngine];
    -[HUCameraController setLastTimeControlStatusPriorToCameraSwap:](self, "setLastTimeControlStatusPriorToCameraSwap:", [v35 timeControlStatus]);

    double v36 = [(HUCameraController *)self playbackEngine];
    [v36 pause];

    [(HUCameraController *)self removePlaybackHistoryUI];
    id v37 = objc_alloc(MEMORY[0x1E4F68FB8]);
    CGRect v38 = [(HUCameraController *)self home];
    v39 = [(HUCameraController *)self cameraProfile];
    BOOL v40 = (void *)[v37 initWithHome:v38 cameraProfile:v39];

    uint64_t v41 = [(HUCameraController *)self behavior];
    [v40 setClipScrubber:v41];

    id v42 = [(HUCameraController *)self playbackEngine];
    [v42 updateConfiguration:v40];

    id v43 = objc_alloc(MEMORY[0x1E4F69590]);
    uint64_t v44 = [(HUCameraController *)self cameraItem];
    v45 = (void *)[v43 initWithDelegate:self sourceItem:v44];
    [(HUCameraController *)self setItemManager:v45];

    v46 = [v8 accessory];
    v47 = [v46 name];
    int v48 = [(HUCameraController *)self cameraStatusView];
    [v48 setStatusString:v47];

    if ([(HUCameraPlayerConfiguration *)v24 isConfiguredForLiveStream])
    {
      dispatch_queue_t v49 = HFLogForCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v59 = v8;
        _os_log_impl(&dword_1BE345000, v49, OS_LOG_TYPE_DEFAULT, "Updating the live stream for camera profile:%@.", buf, 0xCu);
      }

      uint64_t v50 = [(HUCameraController *)self playbackEngine];
      [v50 updateLiveStreamForCameraProfile:v8];

      uint64_t v51 = [(HUCameraController *)self playbackEngine];
      [v51 play];

      uint64_t v52 = [(HUCameraController *)self cameraProfile];
      int v53 = objc_msgSend(v52, "hf_supportsBidirectionalAudio");

      if (v53)
      {
        id v54 = [(HUCameraController *)self portraitMicrophoneConstraintSet];
        [v54 activateIfNeeded];

        uint64_t v55 = [(HUCameraController *)self landscapeMicrophoneConstraintSet];
        [v55 activateIfNeeded];
      }
      [(HUCameraController *)self updateMicrophoneControls];
      [(HUCameraController *)self updateVolumeControlVisibility];
    }
    [(HUCameraController *)self _reloadClipsWithUpdate:1];
  }
}

- (id)cameraPickerMenu
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  float v3 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v4 = [(HUCameraController *)self home];
  BOOL v5 = [v4 accessories];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(v5);
        }
        double v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v11 = [v10 cameraProfiles];
        uint64_t v12 = [v11 count];

        if (v12) {
          [v3 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v7);
  }

  [v3 sortUsingComparator:&__block_literal_global_159];
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    double v29 = v3;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Camera picker menu contains cameras:%@", buf, 0xCu);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  double v20 = __38__HUCameraController_cameraPickerMenu__block_invoke_160;
  CGFloat v21 = &unk_1E63908E0;
  double v22 = self;
  id v23 = v14;
  id v15 = v14;
  [v3 enumerateObjectsUsingBlock:&v18];
  double v16 = objc_msgSend(MEMORY[0x1E4F42B80], "menuWithTitle:children:", &stru_1F18F92B8, v15, v18, v19, v20, v21, v22);

  return v16;
}

uint64_t __38__HUCameraController_cameraPickerMenu__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  BOOL v5 = [a2 name];
  uint64_t v6 = [v4 name];

  uint64_t v7 = [v5 caseInsensitiveCompare:v6];
  return v7;
}

void __38__HUCameraController_cameraPickerMenu__block_invoke_160(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  id v4 = [v3 name];
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    _HULocalizedStringWithDefaultValue(@"HUCameraPickerMissingCameraName", @"HUCameraPickerMissingCameraName", 1);
    id v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v7 = v6;

  uint64_t v8 = (void *)MEMORY[0x1E4F426E8];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __38__HUCameraController_cameraPickerMenu__block_invoke_2;
  v15[3] = &unk_1E63908B8;
  objc_copyWeak(&v17, &location);
  id v9 = v3;
  id v16 = v9;
  double v10 = [v8 actionWithTitle:v7 image:0 identifier:0 handler:v15];
  uint64_t v11 = [*(id *)(a1 + 32) cameraProfile];
  uint64_t v12 = [v11 accessory];
  id v13 = [v12 uniqueIdentifier];
  id v14 = [v9 uniqueIdentifier];
  objc_msgSend(v10, "setState:", objc_msgSend(v13, "isEqual:", v14));

  [*(id *)(a1 + 40) addObject:v10];
  objc_destroyWeak(&v17);

  objc_destroyWeak(&location);
}

void __38__HUCameraController_cameraPickerMenu__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained showCamera:*(void *)(a1 + 32)];
  char v2 = [WeakRetained cameraPickerMenu];
  id v3 = [WeakRetained cameraPickerButton];
  [v3 setMenu:v2];
}

- (void)playerViewController:(id)a3 contentViewWillTransitionToSize:(CGSize)a4 withTransitionCoordinator:(id)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __101__HUCameraController_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v5[3] = &unk_1E6390908;
  v5[4] = self;
  CGSize v6 = a4;
  [a5 animateAlongsideTransition:v5 completion:0];
}

uint64_t __101__HUCameraController_playerViewController_contentViewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) calendarConstraintSet];
  [v2 invalidate];

  id v3 = [*(id *)(a1 + 32) cameraStatusViewConstraintSet];
  [v3 invalidate];

  [*(id *)(a1 + 32) cameraStatusViewConstantForTraitCollection];
  double v5 = v4;
  CGSize v6 = [*(id *)(a1 + 32) cameraStatusViewTopConstraint];
  [v6 setConstant:v5];

  double v7 = *(double *)(a1 + 40);
  uint64_t v8 = [*(id *)(a1 + 32) accessoryViewWidthConstraint];
  [v8 setConstant:v7];

  double v9 = *(double *)(a1 + 48);
  double v10 = [*(id *)(a1 + 32) accessoryViewHeightConstraint];
  [v10 setConstant:v9];

  [*(id *)(a1 + 32) updateMicrophoneControls];
  [*(id *)(a1 + 32) updateVolumeControlVisibility];
  [*(id *)(a1 + 32) updatePIPBehaviorForDeviceAndConfiguration];
  uint64_t v11 = *(void **)(a1 + 32);

  return [v11 updateViewConstraints];
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v6 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  double v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v29) = v6;
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "transitioning to visibility %d", buf, 8u);
  }

  uint64_t v11 = [(HUCameraController *)self footerViewController];

  if (!v11)
  {
    uint64_t v12 = HFLogForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "loading the auxilliary views.", buf, 2u);
    }

    [(HUCameraController *)self loadDependentViewControllers];
    [(HUCameraController *)self loadAuxilliaryViews];
    [(HUCameraController *)self updateViewConstraints];
  }
  [(HUCameraController *)self setHu_playbackControlsAreVisible:v6];
  id v13 = HFLogForCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v29 = v8;
    __int16 v30 = 1024;
    BOOL v31 = v6;
    _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "Begin visibility transition for %@ visible:%{BOOL}d.", buf, 0x12u);
  }

  if (v6)
  {
    id v14 = [(HUCameraController *)self clipScrubberViewController];
    uint64_t v15 = [v14 displayMode];

    if (!v15)
    {
      id v16 = HFLogForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "Display AVKit controls since player is not editing.%@", buf, 0xCu);
      }

      id v17 = [(HUCameraController *)self behavior];
      uint64_t v18 = [v17 behaviorContext];
      [v18 setPlaybackControlsIncludeDisplayModeControls:1];

      uint64_t v19 = [(HUCameraController *)self behavior];
      double v20 = [v19 behaviorContext];
      [v20 setPlaybackControlsIncludeVolumeControls:1];
    }
  }
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v26[3] = &unk_1E6385A70;
  void v26[4] = self;
  BOOL v27 = v6;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2;
  v22[3] = &unk_1E6390930;
  BOOL v25 = v6;
  id v23 = v8;
  long long v24 = self;
  id v21 = v8;
  [v9 addCoordinatedAnimations:v26 completion:v22];
}

void __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) updateCalendarContainerVisibility:*(unsigned __int8 *)(a1 + 40)];
  LOBYTE(v2) = *(unsigned char *)(a1 + 40);
  double v3 = (double)v2;
  double v4 = [*(id *)(a1 + 32) clipScrubberViewController];
  double v5 = [v4 view];
  [v5 setAlpha:v3];

  if (*(unsigned char *)(a1 + 40)) {
    double v6 = 47.0;
  }
  else {
    double v6 = 120.0;
  }
  double v7 = [*(id *)(a1 + 32) dayLabelBottomConstraint];
  [v7 setConstant:v6];

  id v8 = [*(id *)(a1 + 32) dayLabel];
  id v9 = [v8 superview];
  [v9 layoutIfNeeded];

  uint64_t v10 = [*(id *)(a1 + 32) clipScrubberViewController];
  if (v10)
  {
    uint64_t v11 = (void *)v10;
    uint64_t v12 = [*(id *)(a1 + 32) clipScrubberViewController];
    int v13 = [v12 userIsScrubbing];

    if (v13)
    {
      id v14 = [*(id *)(a1 + 32) clipScrubberViewController];
      uint64_t v15 = [v14 view];
      [v15 setAlpha:1.0];

      id v16 = [*(id *)(a1 + 32) dayLabelBottomConstraint];
      [v16 setConstant:47.0];

      id v17 = [*(id *)(a1 + 32) dayLabel];
      uint64_t v18 = [v17 superview];
      [v18 layoutIfNeeded];
    }
  }
  [*(id *)(a1 + 32) updateUnanalyzedCameraClipTip];
  LOBYTE(v19) = *(unsigned char *)(a1 + 40);
  double v20 = (double)v19;
  id v21 = [*(id *)(a1 + 32) cameraStatusView];
  [v21 setAlpha:v20];

  [*(id *)(a1 + 32) updateMicrophoneControls];
  [*(id *)(a1 + 32) updateVolumeControlVisibility];
  if (!*(unsigned char *)(a1 + 40))
  {
    double v22 = [*(id *)(a1 + 32) portraitMicrophoneControl];
    [v22 setAlpha:0.0];

    id v23 = [*(id *)(a1 + 32) landscapeMicrophoneControl];
    [v23 setAlpha:0.0];
  }
  if ([*(id *)(a1 + 32) hasRecordedClips])
  {
    double v24 = (double)([*(id *)(a1 + 32) isDismissingViewController] ^ 1);
    BOOL v25 = [*(id *)(a1 + 32) dayLabel];
    [v25 setAlpha:v24];

    double v26 = (double)([*(id *)(a1 + 32) isDismissingViewController] ^ 1);
    BOOL v27 = [*(id *)(a1 + 32) timeLabel];
    [v27 setAlpha:v26];

    id v38 = [*(id *)(a1 + 32) footerViewController];
    double v28 = [v38 view];
    [v28 setHidden:1];
  }
  else
  {
    BOOL v29 = *(unsigned char *)(a1 + 40) == 0;
    __int16 v30 = [*(id *)(a1 + 32) footerViewController];
    uint64_t v31 = [v30 view];
    [(id)v31 setHidden:v29];

    uint64_t v32 = [*(id *)(a1 + 32) clipScrubberViewController];
    double v33 = [v32 view];
    [v33 setAlpha:0.0];

    char v34 = [*(id *)(a1 + 32) cameraProfile];
    CGRect v35 = [v34 accessory];
    LOBYTE(v31) = [v35 isReachable];

    if ((v31 & 1) == 0)
    {
      double v36 = [*(id *)(a1 + 32) footerViewController];
      id v37 = [v36 liveButton];
      [v37 setHidden:1];
    }
    id v38 = [*(id *)(a1 + 32) cameraStatusView];
    double v28 = [*(id *)(a1 + 32) playbackEngine];
    [v38 updateStatusForPlaybackEngine:v28];
  }
}

void __113__HUCameraController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = HFLogForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(unsigned __int8 *)(a1 + 48);
    int v9 = 138412546;
    uint64_t v10 = v3;
    __int16 v11 = 1024;
    int v12 = v4;
    _os_log_impl(&dword_1BE345000, v2, OS_LOG_TYPE_DEFAULT, "Completed willTransitionToVisibilityOfPlaybackControls:... %@ %{BOOL}d", (uint8_t *)&v9, 0x12u);
  }

  double v5 = [*(id *)(a1 + 40) playerViewController];
  double v6 = [v5 traitCollection];
  if (objc_msgSend(v6, "hu_hasExtendedWidth"))
  {
  }
  else
  {
    int v7 = *(unsigned __int8 *)(a1 + 48);

    if (!v7) {
      return;
    }
    id v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Flashing the playback controls.", (uint8_t *)&v9, 2u);
    }

    double v5 = [*(id *)(a1 + 40) playerViewController];
    [v5 flashPlaybackControlsWithDuration:1.79769313e308];
  }
}

- (void)playerViewController:(id)a3 willBeginFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v5 = a4;
  double v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "beginning full screen presentation", buf, 2u);
  }

  [(HUCameraController *)self setEnteringFullScreen:1];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __99__HUCameraController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v7[3] = &unk_1E6385548;
  void v7[4] = self;
  [v5 animateAlongsideTransition:0 completion:v7];
}

uint64_t __99__HUCameraController_playerViewController_willBeginFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setEnteringFullScreen:0];
  unint64_t v2 = [*(id *)(a1 + 32) playerViewController];
  [v2 flashPlaybackControlsWithDuration:1.79769313e308];

  uint64_t v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "beginning full screen presentation. Finished.", v5, 2u);
  }

  return [*(id *)(a1 + 32) _didBeginPlayerViewControllerPresentation];
}

- (id)playerViewController:(id)a3 targetViewForDismissalAnimationWithProposedTargetView:(id)a4
{
  -[HUCameraController setIsDismissingViewController:](self, "setIsDismissingViewController:", 1, a4);
  id v5 = [(HUCameraController *)self dayLabel];
  [v5 setAlpha:0.0];

  double v6 = [(HUCameraController *)self timeLabel];
  [v6 setAlpha:0.0];

  int v7 = [(HUCameraController *)self cameraDelegate];
  id v8 = [(HUCameraController *)self cameraProfile];
  int v9 = [v7 targetViewForDismissingCameraProfile:v8];

  return v9;
}

- (void)playerViewController:(id)a3 willEndFullScreenPresentationWithAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "ending full screen presentation", buf, 2u);
  }

  *(void *)buf = 0;
  int v12 = buf;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__32;
  uint64_t v15 = __Block_byref_object_dispose__32;
  id v16 = self;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke;
  v10[3] = &unk_1E6385548;
  void v10[4] = v16;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2;
  v9[3] = &unk_1E6390958;
  void v9[4] = v16;
  v9[5] = buf;
  [v7 animateAlongsideTransition:v10 completion:v9];
  _Block_object_dispose(buf, 8);
}

void __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke(uint64_t a1)
{
  unint64_t v2 = [*(id *)(a1 + 32) accessoryViewController];
  int v3 = [v2 showingError];

  if (v3)
  {
    id v5 = [*(id *)(a1 + 32) playerViewController];
    int v4 = [v5 view];
    [v4 setAlpha:0.0];
  }
}

void __97__HUCameraController_playerViewController_willEndFullScreenPresentationWithAnimationCoordinator___block_invoke_2(uint64_t a1)
{
  unint64_t v2 = [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) playerViewController];
  int v3 = [v2 view];
  int v4 = [v3 superview];

  id v5 = *(void **)(a1 + 32);
  if (v4)
  {
    [v5 setIsDismissingViewController:0];
    id v6 = [*(id *)(a1 + 32) dayLabel];
    [v6 setAlpha:1.0];

    id v7 = [*(id *)(a1 + 32) timeLabel];
    [v7 setAlpha:1.0];

    id v9 = [*(id *)(a1 + 32) playerViewController];
    id v8 = [v9 view];
    [v8 setAlpha:1.0];
  }
  else
  {
    [v5 _didEndPlayerViewControllerPresentation];
  }
}

- (void)_didBeginPlayerViewControllerPresentation
{
  int v3 = [MEMORY[0x1E4F69338] sharedInstance];
  [v3 addObserver:self];

  [(HUCameraController *)self setupTipsObserver];
}

- (void)_didEndPlayerViewControllerPresentation
{
  [(HUCameraController *)self _submitTimelinePinchToZoomEvent];
  int v3 = [MEMORY[0x1E4F69338] sharedInstance];
  [v3 removeObserver:self];

  [(HUCameraController *)self tearDownTipsObserver];
  [(HUCameraController *)self cleanUpIdleTimerState];
  id v5 = [(HUCameraController *)self cameraDelegate];
  int v4 = [(HUCameraController *)self cameraProfile];
  [v5 didDismissCameraController:self forProfile:v4];
}

- (void)setPipState:(unint64_t)a3
{
  if (a3 == 3)
  {
    id v5 = HFLogForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "PIP State: PIP finished", buf, 2u);
    }

    unint64_t pipState = self->_pipState;
    id v7 = HFLogForCategory();
    BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (pipState == 2)
    {
      if (v8)
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "PIP State: PIP handed back first", v17, 2u);
      }

      [(HUCameraController *)self setShouldResumePlaying:1];
      [(HUCameraController *)self _resetStateAfterPIP];
      id v9 = HFLogForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v16 = 0;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "PIP State: Starting stream", v16, 2u);
      }

      uint64_t v10 = [(HUCameraController *)self playbackEngine];
      [v10 play];
LABEL_16:

      goto LABEL_17;
    }
    if (v8)
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1BE345000, v7, OS_LOG_TYPE_DEFAULT, "PIP State: PIP did not hand back first", v15, 2u);
    }

    if (![(HUCameraController *)self applicationIsActive])
    {
      [(HUCameraController *)self setShouldResumePlaying:0];
      __int16 v11 = [(HUCameraController *)self playerViewController];
      int v12 = [v11 presentingViewController];
      id v13 = (id)objc_msgSend(v12, "hu_dismissViewControllerAnimated:", 0);

      [(HUCameraController *)self _didEndPlayerViewControllerPresentation];
      uint64_t v10 = HFLogForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "PIP State: App was backgrounded, killing everything", v14, 2u);
      }
      goto LABEL_16;
    }
    [(HUCameraController *)self setShouldResumePlaying:1];
    [(HUCameraController *)self _resetStateAfterPIP];
  }
LABEL_17:
  self->_unint64_t pipState = a3;
}

- (void)_resetStateAfterPIP
{
  int v3 = [(HUCameraController *)self playerViewController];
  [v3 setAllowsPictureInPicturePlayback:1];

  int v4 = [(HUCameraController *)self playbackEngine];
  [v4 setPictureInPictureModeActive:0];

  id v8 = [(HUCameraController *)self behavior];
  id v5 = [v8 behaviorContext];
  uint64_t v6 = [v5 isMicrophoneEnabled];
  id v7 = [(HUCameraController *)self playbackEngine];
  [v7 setMicrophoneEnabled:v6];
}

- (void)playerViewControllerWillStartPictureInPicture:(id)a3
{
  int v4 = [(HUCameraController *)self playerViewController];
  id v5 = [v4 view];
  [v5 setUserInteractionEnabled:0];

  uint64_t v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v14 = 0;
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerWillStartPictureInPicture.", v14, 2u);
  }

  id v7 = [(HUCameraController *)self cameraProfile];
  int v8 = objc_msgSend(v7, "hf_supportsBidirectionalAudio");

  if (v8)
  {
    id v9 = [(HUCameraController *)self playbackEngine];
    uint64_t v10 = [v9 isMicrophoneEnabled];
    __int16 v11 = [(HUCameraController *)self behavior];
    int v12 = [v11 behaviorContext];
    [v12 setMicrophoneEnabled:v10];
  }
  else
  {
    id v9 = [(HUCameraController *)self behavior];
    __int16 v11 = [v9 behaviorContext];
    [v11 setHasMicrophone:0];
  }

  id v13 = [(HUCameraController *)self playbackEngine];
  [v13 play];
}

- (void)playerViewControllerDidStartPictureInPicture:(id)a3
{
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerDidStartPictureInPicture.", v6, 2u);
  }

  id v5 = [(HUCameraController *)self playbackEngine];
  [v5 setPictureInPictureModeActive:1];

  [(HUCameraController *)self setPipState:1];
}

- (void)playerViewController:(id)a3 failedToStartPictureInPictureWithError:(id)a4
{
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "PIP: failedToStartPictureInPictureWithError. ", v7, 2u);
  }

  uint64_t v6 = [(HUCameraController *)self playbackEngine];
  [v6 setPictureInPictureModeActive:0];
}

- (void)playerViewControllerWillStopPictureInPicture:(id)a3
{
  int v3 = [(HUCameraController *)self playerViewController];
  int v4 = [v3 view];
  [v4 setUserInteractionEnabled:1];

  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v6 = 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerWillStopPictureInPicture.", v6, 2u);
  }
}

- (void)playerViewControllerDidStopPictureInPicture:(id)a3
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  int v4 = HFLogForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5[0] = 67109120;
    v5[1] = ![(HUCameraController *)self applicationIsActive];
    _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "PIP: Stop picture in picture. Will dismiss camera:%{BOOL}d.", (uint8_t *)v5, 8u);
  }

  [(HUCameraController *)self setPipState:3];
}

- (BOOL)playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart:(id)a3
{
  int v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "PIP: playerViewControllerShouldAutomaticallyDismissAtPictureInPictureStart.", v5, 2u);
  }

  return 0;
}

- (void)playerViewController:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = (void (**)(id, uint64_t))a4;
  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 138412546;
    id v10 = v6;
    __int16 v11 = 2112;
    int v12 = self;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "PIP: restoreUserInterfaceForPictureInPictureStopWithCompletionHandler %@ vs %@", (uint8_t *)&v9, 0x16u);
  }

  [(HUCameraController *)self setPipState:2];
  v7[2](v7, 1);
}

- (void)updatePIPBehaviorForDeviceAndConfiguration
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F42948] currentDevice];
  if (![v3 userInterfaceIdiom])
  {

    goto LABEL_5;
  }
  int v4 = [(HUCameraController *)self playerViewController];
  id v5 = [v4 traitCollection];
  char v6 = objc_msgSend(v5, "hu_hasExtendedWidth");

  if ((v6 & 1) == 0)
  {
LABEL_5:
    uint64_t v13 = [(HUCameraController *)self behavior];
    id v14 = [v13 behaviorContext];
    [v14 setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:0];

    int v9 = [(HUCameraController *)self behavior];
    id v10 = [v9 behaviorContext];
    __int16 v11 = v10;
    uint64_t v12 = 1;
    goto LABEL_6;
  }
  id v7 = [(HUCameraController *)self behavior];
  int v8 = [v7 behaviorContext];
  [v8 setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:1];

  int v9 = [(HUCameraController *)self behavior];
  id v10 = [v9 behaviorContext];
  __int16 v11 = v10;
  uint64_t v12 = 0;
LABEL_6:
  [v10 setPlaybackControlsIncludePictureInPictureButton:v12];

  if (-[HUCameraController shouldDisableLiveStreamAfterCameraStatusChange](self, "shouldDisableLiveStreamAfterCameraStatusChange")|| (-[HUCameraController cameraProfile](self, "cameraProfile"), uint64_t v15 = objc_claimAutoreleasedReturnValue(), [v15 accessory], v16 = objc_claimAutoreleasedReturnValue(), v17 = objc_msgSend(v16, "isReachable"), v16, v15, (v17 & 1) == 0))
  {
    uint64_t v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v19 = [(HUCameraController *)self cameraProfile];
      double v20 = [v19 accessory];
      v27[0] = 67109120;
      v27[1] = [v20 isReachable];
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "PIP: Unable to display PIP when live stream is disabled. Camera is reachable:%{BOOL}d.", (uint8_t *)v27, 8u);
    }
    id v21 = [(HUCameraController *)self behavior];
    double v22 = [v21 behaviorContext];
    [v22 setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:0];

    id v23 = [(HUCameraController *)self behavior];
    double v24 = [v23 behaviorContext];
    [v24 setPlaybackControlsIncludePictureInPictureButton:0];
  }
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    BOOL v25 = [(HUCameraController *)self behavior];
    double v26 = [v25 behaviorContext];
    [v26 setPlaybackControlsIncludePictureInPictureButton:0];
  }
}

- (void)playbackEngine:(id)a3 didUpdateClipPlayer:(id)a4
{
  id v5 = a3;
  char v6 = [(HUCameraController *)self timelapseController];
  [v6 resetForNewCamera];

  id v7 = [v5 playbackPosition];

  [(HUCameraController *)self updateStateForPlaybackPosition:v7 animated:1];
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = [v6 engineModeDescription];
    id v10 = [v6 timelineStateDescription];
    __int16 v11 = [v6 timeControlStatusDescription];
    int v36 = 138413058;
    id v37 = v7;
    __int16 v38 = 2112;
    v39 = v9;
    __int16 v40 = 2112;
    uint64_t v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Camera Player didUpdate playbackPosition:%@ engineMode:%@ timelineState:%@ timeControlStatus:%@.", (uint8_t *)&v36, 0x2Au);
  }
  [(HUCameraController *)self updateStateForPlaybackPosition:v7 animated:1];
  [(HUCameraController *)self updateBlurWithPlaybackEngine:v6];
  if ([v6 engineMode])
  {
    [(HUCameraController *)self updateCameraPlayerForEventPlaybackPosition:v7];
    uint64_t v12 = [(HUCameraController *)self playbackEngine];
    int v13 = [v12 isScrubbing];

    if (v13)
    {
      id v14 = [(HUCameraController *)self playbackEngine];
      if ([v14 timelineState] == 2)
      {

LABEL_15:
        objc_opt_class();
        double v22 = [(HUCameraController *)self playbackEngine];
        id v23 = [v22 currentClip];
        if (objc_opt_isKindOfClass()) {
          double v24 = v23;
        }
        else {
          double v24 = 0;
        }

        if (!v24)
        {
LABEL_24:
          if (![(HUCameraController *)self foundCameraClipWithInsufficientAnalysis])
          {
            __int16 v30 = [(HUCameraController *)self playbackEngine];
            uint64_t v31 = [v30 currentClip];
            int v32 = objc_msgSend(v31, "hf_hasInsufficientAnalysis");

            if (v32) {
              [(HUCameraController *)self setFoundCameraClipWithInsufficientAnalysis:1];
            }
          }
          goto LABEL_27;
        }
        BOOL v25 = [(HUCameraController *)self timelapseController];
        double v26 = [(HUCameraController *)self playbackEngine];
        BOOL v27 = [v26 currentClip];
        [v25 updateToPlaybackPosition:v7 forHighQualityClip:v27];

        uint64_t v28 = [(HUCameraController *)self accessoryViewController];
        [v28 setCanShowOverlayContent:0];
LABEL_23:

        goto LABEL_24;
      }
      double v20 = [(HUCameraController *)self playbackEngine];
      uint64_t v21 = [v20 scrubbingSpeed];

      if (v21 == 2) {
        goto LABEL_15;
      }
    }
    else
    {
      if ([(HUCameraController *)self isViewVisible]) {
        uint64_t v18 = [(HUCameraController *)self isEnteringFullScreen] ^ 1;
      }
      else {
        uint64_t v18 = 0;
      }
      BOOL v29 = [(HUCameraController *)self accessoryViewController];
      [v29 setCanShowOverlayContent:v18];
    }
    uint64_t v28 = [(HUCameraController *)self timelapseController];
    [v28 pauseTimelapseScrubbing];
    goto LABEL_23;
  }
  uint64_t v15 = [(HUCameraController *)self accessoryViewController];
  [v15 setCanShowOverlayContent:1];

  [(HUCameraController *)self displayCurrentTimeAndDate];
  id v16 = [(HUCameraController *)self playbackEngine];
  if ([v16 timeControlStatus] == 2)
  {
    BOOL v17 = [(HUCameraController *)self hu_playbackControlsAreVisible];

    if (v17) {
      [(HUCameraController *)self updateMicrophoneControlVisibility];
    }
  }
  else
  {
  }
  unint64_t v19 = [(HUCameraController *)self timelapseController];
  [v19 hideAllViews];

LABEL_27:
  double v33 = [(HUCameraController *)self diagnosticsController];

  if (v33)
  {
    char v34 = [(HUCameraController *)self diagnosticsController];
    CGRect v35 = [(HUCameraController *)self playbackEngine];
    [v34 updateWithPlaybackEngine:v35];
  }
}

- (void)updateCameraPlayerForEventPlaybackPosition:(id)a3
{
  id v4 = a3;
  [(HUCameraController *)self cancelLiveTimer];
  id v5 = [(HUCameraController *)self portraitMicrophoneControl];
  [v5 setAlpha:0.0];

  id v6 = [(HUCameraController *)self landscapeMicrophoneControl];
  [v6 setAlpha:0.0];

  id v7 = [v4 clipPlaybackDate];

  if (v7)
  {
    int v8 = [(HUCameraController *)self dateDisplayController];
    [v8 updateDisplayDateWithDate:v7 forType:0];
  }
  else
  {
    int v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)int v9 = 0;
      _os_log_error_impl(&dword_1BE345000, v8, OS_LOG_TYPE_ERROR, "Missing date for current position. Unable to update time/date labels.", v9, 2u);
    }
  }
}

- (void)playbackEngine:(id)a3 didUpdateScrubbingStatus:(BOOL)a4
{
}

- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if ([(HUCameraController *)self applicationIsActive])
  {
    [(HUCameraController *)self updateLivePreviewAspectRatio];
  }
  else
  {
    id v6 = HFLogForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Application is not active. Bypassing live camera source updates for sourc:%@.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = [(HUCameraController *)self launchEvent];

  if (a4 == 2 && v7)
  {
    id v8 = [(HUCameraController *)self playerConfiguration];
    uint64_t v9 = [v8 startingPlaybackDate];

    id v10 = HFLogForCategory();
    BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Send Clip playback launch event after time control update.", (uint8_t *)&v19, 2u);
      }

      uint64_t v12 = [v6 currentClip];
      int v13 = [(HUCameraController *)self launchEvent];
      [v13 setCameraClip:v12];

      id v14 = [(HUCameraController *)self launchEvent];
      [v14 launchedRecordingWithError:0];
    }
    else
    {
      if (v11)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Send Live Stream launch event after time control update.", (uint8_t *)&v19, 2u);
      }

      id v14 = [(HUCameraController *)self launchEvent];
      [v14 launchedStreamWithError:0];
    }

    [(HUCameraController *)self setLaunchEvent:0];
  }
  else if (a4 - 1 > 1)
  {
LABEL_17:
    BOOL v17 = [(HUCameraController *)self footerViewController];
    uint64_t v18 = [v17 liveButton];
    [v18 setHidden:a4 != 2];

    [(HUCameraController *)self updateBlurWithPlaybackEngine:v6];
    [(HUCameraController *)self updateIdleTimer];
    [(HUCameraController *)self updateIndicatorColor];
    [(HUCameraController *)self updateMicrophoneControls];
    [(HUCameraController *)self updateVolumeControlVisibility];
    if ([v6 isLiveStreaming])
    {
      [(HUCameraController *)self displayCurrentTimeAndDate];
      [(HUCameraController *)self startLiveTimer];
    }
    else
    {
      [(HUCameraController *)self cancelLiveTimer];
    }
    goto LABEL_20;
  }
  uint64_t v15 = [(HUCameraController *)self timelapseController];
  [v15 hideAllViews];

  if (![(HUCameraController *)self displayingDetailsViewController]) {
    goto LABEL_17;
  }
  id v16 = HFLogForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v19 = 138412290;
    double v20 = self;
    _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "%@ Preventing timeControlStatus update while displaying settings", (uint8_t *)&v19, 0xCu);
  }

LABEL_20:
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__HUCameraController_playbackEngine_didUpdatePlaybackError___block_invoke;
  block[3] = &unk_1E6386340;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

uint64_t __60__HUCameraController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  unint64_t v2 = [*(id *)(a1 + 32) launchEvent];

  if (v2)
  {
    if ([*(id *)(a1 + 40) engineMode])
    {
      if ([*(id *)(a1 + 40) engineMode] != 1)
      {
LABEL_11:
        [*(id *)(a1 + 32) setLaunchEvent:0];
        goto LABEL_12;
      }
      int v3 = HFLogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 48);
        int v12 = 138412290;
        uint64_t v13 = v4;
        _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Send Clip playback failure launch event for error:%@", (uint8_t *)&v12, 0xCu);
      }

      id v5 = [*(id *)(a1 + 40) currentClip];
      id v6 = [*(id *)(a1 + 32) launchEvent];
      [v6 setCameraClip:v5];

      id v7 = [*(id *)(a1 + 32) launchEvent];
      [v7 launchedRecordingWithError:*(void *)(a1 + 48)];
    }
    else
    {
      id v8 = HFLogForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = *(void *)(a1 + 48);
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Send stream failure launch event for error:%@", (uint8_t *)&v12, 0xCu);
      }

      id v7 = [*(id *)(a1 + 32) launchEvent];
      [v7 launchedStreamWithError:*(void *)(a1 + 48)];
    }

    goto LABEL_11;
  }
LABEL_12:
  id v10 = [*(id *)(a1 + 32) cameraStatusView];
  [v10 updateStatusForPlaybackEngine:*(void *)(a1 + 40)];

  [*(id *)(a1 + 32) updateIndicatorColor];
  return [*(id *)(a1 + 32) updateBlurWithPlaybackEngine:*(void *)(a1 + 40)];
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  if (objc_msgSend(a6, "count", a3, a4, a5) && !-[HUCameraController hasRecordedClips](self, "hasRecordedClips"))
  {
    [(HUCameraController *)self removePlaybackHistoryUI];
    [(HUCameraController *)self dismissEditInterface];
    id v8 = [MEMORY[0x1E4F68FC8] livePosition];
    id v7 = [(HUCameraController *)self playbackEngine];
    [v7 setPlaybackPosition:v8];
  }
  else
  {
    [(HUCameraController *)self _updateRecordedClipInterfaceAvailabilityWithAnimation:1];
  }
}

- (void)playbackEngine:(id)a3 didUpdateMicrophoneEnabled:(BOOL)a4
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = [v5 isMicrophoneEnabled];
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Playback engine did update microphone enabled:%{BOOL}d.", (uint8_t *)v7, 8u);
  }

  [(HUCameraController *)self updateMicrophoneAndSpeakerStatus];
}

- (void)pauseEngineIfNeeded
{
  int v3 = [(HUCameraController *)self playbackEngine];
  if ([v3 engineMode])
  {
  }
  else
  {
    uint64_t v4 = [(HUCameraController *)self playbackEngine];
    int v5 = [v4 isMicrophoneEnabled];

    if (v5) {
      [(HUCameraController *)self toggleMicrophoneState];
    }
  }
  id v6 = [(HUCameraController *)self playbackEngine];
  [v6 pause];
}

- (void)updateBlurWithPlaybackEngine:(id)a3
{
  id v4 = a3;
  int v5 = [(HUCameraController *)self blurViewController];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __51__HUCameraController_updateBlurWithPlaybackEngine___block_invoke;
  v6[3] = &unk_1E6386730;
  v6[4] = self;
  [v5 updateBlurWithPlaybackEngine:v4 completionHandler:v6];
}

void __51__HUCameraController_updateBlurWithPlaybackEngine___block_invoke(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) behavior];
  int v5 = [v4 behaviorContext];
  int v6 = [v5 isZoomingEnabled];

  if (v6 == a2)
  {
    id v8 = [*(id *)(a1 + 32) behavior];
    id v7 = [v8 behaviorContext];
    [v7 setZoomingEnabled:a2 ^ 1u];
  }
}

- (double)currentScrubberResolutionForBehavior:(id)a3
{
  int v3 = [(HUCameraController *)self clipScrubberViewController];
  [v3 currentScrubberResolution];
  double v5 = v4;

  return v5;
}

- (void)playbackControlsDidToggleMuted:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  double v5 = [(HUCameraController *)self cameraProfile];
  if ((objc_msgSend(v5, "hf_supportsBidirectionalAudio") & 1) == 0)
  {

    goto LABEL_5;
  }
  int v6 = [(HUCameraController *)self playbackEngine];
  char v7 = [v6 isMicrophoneEnabled];

  if ((v7 & 1) == 0)
  {
LABEL_5:
    id v8 = [(HUCameraController *)self playbackEngine];
    [v8 setPrefersAudioEnabled:!v3];
  }
  if ([MEMORY[0x1E4F69758] isAMac])
  {
    uint64_t v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(HUCameraController *)self playbackEngine];
      [v10 streamAudioVolume];
      int v14 = 134217984;
      double v15 = v11;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "Forcing volume update to %.02f.", (uint8_t *)&v14, 0xCu);
    }
    int v12 = [(HUCameraController *)self playbackEngine];
    uint64_t v13 = [(HUCameraController *)self playbackEngine];
    [v13 streamAudioVolume];
    objc_msgSend(v12, "setStreamAudioVolume:");
  }
}

- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUCameraController *)self accessoryViewController];
  [v4 setShouldShowLoadingIndicatorForClipPlayback:v3];
}

- (void)pictureInPictureDidToggleMicrophone
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUCameraController *)self playbackEngine];
  uint64_t v4 = [v3 isMicrophoneEnabled] ^ 1;
  double v5 = [(HUCameraController *)self playbackEngine];
  [v5 setMicrophoneEnabled:v4];

  int v6 = [(HUCameraController *)self playbackEngine];
  uint64_t v7 = [v6 isMicrophoneEnabled];
  id v8 = [(HUCameraController *)self behavior];
  uint64_t v9 = [v8 behaviorContext];
  [v9 setMicrophoneEnabled:v7];

  id v10 = HFLogForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    float v11 = [(HUCameraController *)self playbackEngine];
    v12[0] = 67109120;
    v12[1] = [v11 isMicrophoneEnabled];
    _os_log_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEFAULT, "Toggled microphone state on: %{BOOL}d.", (uint8_t *)v12, 8u);
  }
}

- (void)playbackControlsDidChangePlayerVolume:(float)a3
{
  id v5 = [(HUCameraController *)self playbackEngine];
  *(float *)&double v4 = a3;
  [v5 setStreamAudioVolume:v4];
}

- (id)finishPresentation:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 conformsToProtocol:&unk_1F19E7BA8]) {
    uint64_t v7 = v6;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;
  int v9 = [v8 requiresPresentingViewControllerDismissal];

  if (v9)
  {
    id v10 = [(HUCameraController *)self playerViewController];
    float v11 = [v10 presentingViewController];

    if (v11)
    {
      int v12 = [(HUCameraController *)self playerViewController];
      uint64_t v13 = [v12 presentingViewController];
      int v14 = objc_msgSend(v13, "hu_dismissViewControllerAnimated:", v4);

      goto LABEL_16;
    }
  }
  [(HUCameraController *)self setDisplayingDetailsViewController:0];
  double v15 = [(HUCameraController *)self liveContentViewController];
  uint64_t v16 = [v15 view];
  [v16 setHidden:0];

  BOOL v17 = [(HUCameraController *)self playerViewController];
  [v17 setAllowsPictureInPicturePlayback:1];

  if ([(HUCameraController *)self hasRecordedClips])
  {
    uint64_t v18 = [(HUCameraController *)self footerViewController];
    int v19 = [v18 view];
    [v19 setHidden:1];
  }
  else
  {
    [(HUCameraController *)self removePlaybackHistoryUI];
    double v20 = HFLogForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)BOOL v25 = 0;
      _os_log_impl(&dword_1BE345000, v20, OS_LOG_TYPE_DEFAULT, "Restarting the live stream after finished presentation.", v25, 2u);
    }

    uint64_t v18 = [MEMORY[0x1E4F68FC8] livePosition];
    int v19 = [(HUCameraController *)self playbackEngine];
    [v19 setPlaybackPosition:v18];
  }

  uint64_t v21 = [(HUCameraController *)self playbackEngine];
  if (![v21 engineMode])
  {
    double v22 = [(HUCameraController *)self playbackEngine];
    uint64_t v23 = [v22 timeControlStatus];

    if (v23) {
      goto LABEL_15;
    }
    uint64_t v21 = [(HUCameraController *)self playbackEngine];
    [v21 play];
  }

LABEL_15:
  int v12 = [(HUCameraController *)self playerViewController];
  int v14 = objc_msgSend(v12, "hu_dismissViewControllerAnimated:", v4);
LABEL_16:

  return v14;
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  id v5 = a4;
  id v6 = [(HUCameraController *)self cameraItem];
  int v7 = [v5 isEqual:v6];

  if (v7)
  {
    [(HUCameraController *)self updateCameraStatus];
  }
}

- (void)toggleDemoModeLiveStreamVideo:(BOOL)a3
{
  BOOL v4 = !a3;
  id v5 = [(HUCameraController *)self demoPlayerView];
  [v5 setHidden:v4];

  id v6 = [(HUCameraController *)self demoModeQueuePlayer];
  id v7 = v6;
  if (v4) {
    [v6 pause];
  }
  else {
    [v6 play];
  }
}

- (void)displayCurrentTimeAndDate
{
  id v4 = [MEMORY[0x1E4F1C9C8] date];
  BOOL v3 = [(HUCameraController *)self dateDisplayController];
  [v3 updateDisplayDateWithDate:v4 forType:1];
}

- (void)startLiveTimer
{
  BOOL v3 = [(HUCameraController *)self liveTimer];

  if (!v3)
  {
    objc_initWeak(&location, self);
    id v4 = (void *)MEMORY[0x1E4F1CB00];
    uint64_t v6 = MEMORY[0x1E4F143A8];
    uint64_t v7 = 3221225472;
    id v8 = __36__HUCameraController_startLiveTimer__block_invoke;
    int v9 = &unk_1E6389EE0;
    objc_copyWeak(&v10, &location);
    id v5 = [v4 scheduledTimerWithTimeInterval:1 repeats:&v6 block:1.0];
    -[HUCameraController setLiveTimer:](self, "setLiveTimer:", v5, v6, v7, v8, v9);

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
}

void __36__HUCameraController_startLiveTimer__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained displayCurrentTimeAndDate];
}

- (void)cancelLiveTimer
{
  BOOL v3 = [(HUCameraController *)self liveTimer];

  if (v3)
  {
    id v4 = [(HUCameraController *)self liveTimer];
    [v4 invalidate];

    [(HUCameraController *)self setLiveTimer:0];
  }
}

- (HUCameraMicrophoneControl)portraitMicrophoneControl
{
  portraitMicrophoneControl = self->_portraitMicrophoneControl;
  if (!portraitMicrophoneControl)
  {
    id v4 = -[HUCameraMicrophoneControl initWithFrame:]([HUCameraMicrophoneControl alloc], "initWithFrame:", 0.0, 0.0, 90.0, 44.0);
    [(HUCameraMicrophoneControl *)v4 setAlpha:0.0];
    [(HUCameraMicrophoneControl *)v4 addTarget:self action:sel_toggleMicrophoneState forEvents:64];
    id v5 = self->_portraitMicrophoneControl;
    self->_portraitMicrophoneControl = v4;

    portraitMicrophoneControl = self->_portraitMicrophoneControl;
  }

  return portraitMicrophoneControl;
}

- (HUCameraMicrophoneControl)landscapeMicrophoneControl
{
  landscapeMicrophoneControl = self->_landscapeMicrophoneControl;
  if (!landscapeMicrophoneControl)
  {
    id v4 = -[HUCameraMicrophoneControl initWithFrame:]([HUCameraMicrophoneControl alloc], "initWithFrame:", 0.0, 0.0, 90.0, 44.0);
    [(HUCameraMicrophoneControl *)v4 setAlpha:0.0];
    [(HUCameraMicrophoneControl *)v4 addTarget:self action:sel_toggleMicrophoneState forEvents:64];
    id v5 = self->_landscapeMicrophoneControl;
    self->_landscapeMicrophoneControl = v4;

    landscapeMicrophoneControl = self->_landscapeMicrophoneControl;
  }

  return landscapeMicrophoneControl;
}

- (UILabel)dayLabel
{
  dayLabel = self->_dayLabel;
  if (!dayLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    id v5 = [MEMORY[0x1E4F42A30] monospacedDigitSystemFontOfSize:18.0 weight:*MEMORY[0x1E4F43930]];
    [(UILabel *)v4 setFont:v5];

    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v4 setTextColor:v6];

    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UILabel *)v4 setTextAlignment:1];
    [(UILabel *)v4 setUserInteractionEnabled:0];
    uint64_t v7 = self->_dayLabel;
    self->_dayLabel = v4;

    dayLabel = self->_dayLabel;
  }

  return dayLabel;
}

- (UILabel)timeLabel
{
  timeLabel = self->_timeLabel;
  if (!timeLabel)
  {
    id v4 = (UILabel *)objc_alloc_init(MEMORY[0x1E4F42B38]);
    id v5 = [MEMORY[0x1E4F42A30] monospacedDigitSystemFontOfSize:18.0 weight:*MEMORY[0x1E4F43930]];
    [(UILabel *)v4 setFont:v5];

    [(UILabel *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemWhiteColor];
    [(UILabel *)v4 setTextColor:v6];

    [(UILabel *)v4 setUserInteractionEnabled:0];
    [(UILabel *)v4 setTextAlignment:1];
    uint64_t v7 = self->_timeLabel;
    self->_timeLabel = v4;

    timeLabel = self->_timeLabel;
  }

  return timeLabel;
}

- (HUCameraDateDisplayController)dateDisplayController
{
  dateDisplayController = self->_dateDisplayController;
  if (!dateDisplayController)
  {
    id v4 = [HUCameraDateDisplayController alloc];
    id v5 = [(HUCameraController *)self dayLabel];
    uint64_t v6 = [(HUCameraController *)self timeLabel];
    uint64_t v7 = [(HUCameraDateDisplayController *)v4 initWithDayOfWeekLabel:v5 timeLabel:v6];

    id v8 = self->_dateDisplayController;
    self->_dateDisplayController = v7;

    dateDisplayController = self->_dateDisplayController;
  }

  return dateDisplayController;
}

- (UIView)volumeControlView
{
  unint64_t v2 = [(HUCameraController *)self playerViewController];
  BOOL v3 = [v2 customControlsView];
  id v4 = [v3 volumeControlsAreaLayoutGuide];
  id v5 = [v4 owningView];

  return (UIView *)v5;
}

- (UIView)loadingOverlayView
{
  loadingOverlayView = self->_loadingOverlayView;
  if (!loadingOverlayView)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F42FF0]);
    id v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    [(UIView *)v5 setAutoresizingMask:18];
    uint64_t v6 = [MEMORY[0x1E4F428B8] systemBlackColor];
    [(UIView *)v5 setBackgroundColor:v6];

    [(UIView *)v5 setAlpha:0.0];
    uint64_t v7 = self->_loadingOverlayView;
    self->_loadingOverlayView = v5;

    loadingOverlayView = self->_loadingOverlayView;
  }

  return loadingOverlayView;
}

- (HUCameraStatusOverlayView)cameraStatusView
{
  cameraStatusView = self->_cameraStatusView;
  if (!cameraStatusView)
  {
    id v4 = objc_alloc_init(HUCameraStatusOverlayView);
    id v5 = [(HUCameraController *)self cameraProfile];
    uint64_t v6 = [v5 accessory];
    uint64_t v7 = [v6 name];
    [(HUCameraStatusOverlayView *)v4 setStatusString:v7];

    id v8 = [(HUCameraController *)self cameraProfile];
    int v9 = [v8 userSettings];
    id v10 = objc_msgSend(v9, "hu_indicatorColorForCurrentAccessMode");
    [(HUCameraStatusOverlayView *)v4 setStatusColor:v10];

    float v11 = [(HUCameraController *)self cameraProfile];
    int v12 = [v11 userSettings];
    uint64_t v13 = objc_msgSend(v12, "hu_indicatorImageNameForCurrentAccessMode");
    [(HUCameraStatusOverlayView *)v4 setStatusImageName:v13];

    [(HUCameraStatusOverlayView *)v4 setIsDisplayingForSingleCamera:[(HUCameraController *)self homeHasMultipleCameraProfiles] ^ 1];
    int v14 = self->_cameraStatusView;
    self->_cameraStatusView = v4;

    cameraStatusView = self->_cameraStatusView;
  }

  return cameraStatusView;
}

- (void)handleSceneDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Camera player - Scene did become active.", buf, 2u);
  }

  uint64_t v6 = [v4 object];

  uint64_t v7 = [(AVPlayerViewController *)self->_playerViewController view];
  id v8 = [v7 window];
  int v9 = [v8 windowScene];

  if ([v6 isEqual:v9])
  {
    [(HUCameraController *)self setApplicationIsActive:1];
    id v10 = [(HUCameraController *)self playbackEngine];
    int v11 = [v10 isPictureInPictureModeActive];

    if (v11)
    {
      int v12 = [(HUCameraController *)self playerViewController];
      [v12 setAllowsPictureInPicturePlayback:0];

      uint64_t v13 = [(HUCameraController *)self playbackEngine];
      [v13 setPictureInPictureModeActive:0];
    }
    BOOL v14 = [(HUCameraController *)self shouldResumePlaying];
    double v15 = HFLogForCategory();
    BOOL v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        *(_WORD *)double v20 = 0;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Camera Player scene did become active. Resuming clip playback because shouldResumePlaying is true", v20, 2u);
      }

      [(HUCameraController *)self setShouldResumePlaying:0];
      BOOL v17 = [(HUCameraController *)self playbackEngine];
      [v17 play];
    }
    else
    {
      if (v16)
      {
        *(_WORD *)int v19 = 0;
        _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Camera Player scene did become active. Pausing clip playback because shouldResumePlaying is false", v19, 2u);
      }

      BOOL v17 = [(HUCameraController *)self playbackEngine];
      [v17 pause];
    }

    [(HUCameraController *)self enableAudioSession];
  }
  else
  {
    uint64_t v18 = HFLogForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1BE345000, v18, OS_LOG_TYPE_DEFAULT, "Camera player - Active scene mismatch, returning early.", v21, 2u);
    }
  }
}

- (void)handleSceneWillDeactivate:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(HUCameraController *)self playbackEngine];
    int v18 = 134217984;
    uint64_t v19 = [v6 timeControlStatus];
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Camera player - Scene will deactivate, time control status %lu", (uint8_t *)&v18, 0xCu);
  }
  uint64_t v7 = [v4 object];

  id v8 = [(AVPlayerViewController *)self->_playerViewController view];
  int v9 = [v8 window];
  id v10 = [v9 windowScene];

  if ([v7 isEqual:v10])
  {
    [(HUCameraController *)self _submitTimelinePinchToZoomEvent];
    [(HUCameraController *)self setApplicationIsActive:0];
    int v11 = [(HUCameraController *)self playbackEngine];
    if ([v11 timeControlStatus] == 2)
    {
    }
    else
    {
      uint64_t v13 = [(HUCameraController *)self playbackEngine];
      uint64_t v14 = [v13 timeControlStatus];

      if (v14 != 1)
      {
        BOOL v17 = HFLogForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v18) = 0;
          _os_log_impl(&dword_1BE345000, v17, OS_LOG_TYPE_DEFAULT, "Camera Player scene deactivate, not pausing playback.", (uint8_t *)&v18, 2u);
        }

        goto LABEL_18;
      }
    }
    double v15 = HFLogForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1BE345000, v15, OS_LOG_TYPE_DEFAULT, "Camera Player scene deactivate, pausing playback.", (uint8_t *)&v18, 2u);
    }

    if (([MEMORY[0x1E4F69758] isAMac] & 1) != 0
      || [MEMORY[0x1E4F69758] isAnIPhone])
    {
      BOOL v16 = [(HUCameraController *)self playbackEngine];
      [v16 pause];

      [(HUCameraController *)self setShouldResumePlaying:1];
    }
LABEL_18:
    [(HUCameraController *)self disableAudioSession];
    goto LABEL_19;
  }
  int v12 = HFLogForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v18) = 0;
    _os_log_impl(&dword_1BE345000, v12, OS_LOG_TYPE_DEFAULT, "Camera player - Non-active scene mismatch, returning early.", (uint8_t *)&v18, 2u);
  }

LABEL_19:
}

- (void)updateIdleTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUCameraController *)self playbackEngine];
  uint64_t v4 = [v3 timeControlStatus];

  id v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7[0] = 67109120;
    v7[1] = v4 == 2;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Should disable idle timer:%{BOOL}d", (uint8_t *)v7, 8u);
  }

  uint64_t v6 = +[HUApplicationManager sharedInstance];
  [v6 setIdleTimerDisabled:v4 == 2 forRequester:self];
}

- (void)executionEnvironmentDidBecomeOccluded:(id)a3
{
}

- (void)executionEnvironmentDidBecomeVisible:(id)a3
{
}

- (void)networkDidBecomeUnavailable
{
  id v5 = [(HUCameraController *)self cameraItem];
  BOOL v3 = [v5 accessory];
  if ([v3 isReachable])
  {
  }
  else
  {
    int v4 = [MEMORY[0x1E4F69758] isInAirplaneMode];

    if (v4)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__HUCameraController_networkDidBecomeUnavailable__block_invoke;
      block[3] = &unk_1E6386018;
      void block[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

uint64_t __49__HUCameraController_networkDidBecomeUnavailable__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _displayAirplaneModeAlert];
}

- (void)_submitTimelinePinchToZoomEvent
{
  _DWORD v12[2] = *MEMORY[0x1E4F143B8];
  if ([(HUCameraController *)self recordedClipInterfaceAvailable])
  {
    v11[0] = *MEMORY[0x1E4F68168];
    BOOL v3 = NSNumber;
    int v4 = [(HUCameraController *)self clipScrubberViewController];
    id v5 = objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "pinchGestureCount"));
    v12[0] = v5;
    v11[1] = *MEMORY[0x1E4F68160];
    uint64_t v6 = NSNumber;
    uint64_t v7 = [(HUCameraController *)self clipScrubberViewController];
    uint64_t v8 = objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "pinchGestureCount") != 0);
    v12[1] = v8;
    int v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

    [MEMORY[0x1E4F68EE0] sendEvent:57 withData:v9];
    id v10 = [(HUCameraController *)self clipScrubberViewController];
    [v10 resetPinchGestureCount];
  }
}

- (void)updateUnanalyzedCameraClipTip
{
  if ([(HUCameraController *)self foundCameraClipWithInsufficientAnalysis])
  {
    BOOL v3 = [(HUCameraController *)self clipScrubberViewController];
    int v4 = [v3 view];
    [v4 alpha];
    BOOL v6 = v5 == 1.0;
  }
  else
  {
    BOOL v6 = 0;
  }

  [(HUCameraController *)self changeUnanalyzedCameraClipTipShouldDisplayTo:v6];
}

- (void)updateLivePreviewAspectRatio
{
  BOOL v3 = [(HUCameraController *)self playbackEngine];
  int v4 = [v3 liveCameraSource];
  [v4 aspectRatio];
  if (v5 == 0.0) {
    double v6 = 1.77777778;
  }
  else {
    double v6 = v5;
  }

  id v8 = [(HUCameraController *)self behavior];
  uint64_t v7 = [v8 behaviorContext];
  objc_msgSend(v7, "setLivePreviewAspectRatio:", v6, 1.0);
}

- (void)updatePlaceholderContent
{
  if ([MEMORY[0x1E4F69758] isPressDemoModeEnabled])
  {
    BOOL v3 = [(HUCameraController *)self placeholderContentViewController];
    [v3 setCameraPlayerHasContentToShow:0];

    id v6 = [(HUCameraController *)self placeholderContentViewController];
    int v4 = [v6 view];
    [v4 setHidden:1];
  }
  else
  {
    id v6 = [(HUCameraController *)self playerViewController];
    uint64_t v5 = [v6 isReadyForDisplay];
    int v4 = [(HUCameraController *)self placeholderContentViewController];
    [v4 setCameraPlayerHasContentToShow:v5];
  }
}

- (void)_displayAirplaneModeAlert
{
  BOOL v3 = [(HUCameraController *)self airplaneAlertController];

  if (!v3)
  {
    int v4 = HFLogForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "Displaying airplane alert.", (uint8_t *)buf, 2u);
    }

    uint64_t v5 = HULocalizedWiFiString(@"HUCameraErrorAlertAirplaneModeTitle");
    id v6 = _HULocalizedStringWithDefaultValue(@"HUCameraErrorAlertAirplaneModeMessage", @"HUCameraErrorAlertAirplaneModeMessage", 1);
    uint64_t v7 = [MEMORY[0x1E4F42728] alertControllerWithTitle:v5 message:v6 preferredStyle:1];
    [(HUCameraController *)self setAirplaneAlertController:v7];
    id v8 = _HULocalizedStringWithDefaultValue(@"HUCameraErrorAlertActionSettings", @"HUCameraErrorAlertActionSettings", 1);

    objc_initWeak(buf, self);
    int v9 = (void *)MEMORY[0x1E4F42720];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __47__HUCameraController__displayAirplaneModeAlert__block_invoke;
    v20[3] = &unk_1E638C920;
    objc_copyWeak(&v21, buf);
    id v10 = [v9 actionWithTitle:v8 style:0 handler:v20];
    [v7 addAction:v10];
    int v11 = _HULocalizedStringWithDefaultValue(@"HUOkTitle", @"HUOkTitle", 1);

    int v12 = (void *)MEMORY[0x1E4F42720];
    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    BOOL v17 = __47__HUCameraController__displayAirplaneModeAlert__block_invoke_2;
    int v18 = &unk_1E638C920;
    objc_copyWeak(&v19, buf);
    uint64_t v13 = [v12 actionWithTitle:v11 style:0 handler:&v15];
    objc_msgSend(v7, "addAction:", v13, v15, v16, v17, v18);
    uint64_t v14 = [(HUCameraController *)self playerViewController];
    [v14 presentViewController:v7 animated:1 completion:0];

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(buf);
  }
}

void __47__HUCameraController__displayAirplaneModeAlert__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAirplaneAlertController:0];
  id v1 = objc_msgSend(MEMORY[0x1E4F1CB10], "hf_wifiSettingsURL");
  unint64_t v2 = [MEMORY[0x1E4F69378] sharedInstance];
  id v3 = (id)[v2 openURL:v1];
}

void __47__HUCameraController__displayAirplaneModeAlert__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setAirplaneAlertController:0];
}

- (BOOL)shouldAutoPlayOnViewAppearance
{
  id v3 = [(HUCameraController *)self playbackEngine];
  int v4 = [v3 playbackPosition];
  uint64_t v5 = [MEMORY[0x1E4F68FC8] livePosition];
  char v6 = [v4 isEqual:v5];

  if (v6) {
    return 1;
  }
  id v8 = [(HUCameraController *)self playerConfiguration];
  int v9 = [v8 startingPlaybackDate];

  if (!v9) {
    return 0;
  }
  id v10 = [(HUCameraController *)self playbackEngine];
  int v11 = [v10 currentClip];

  if (!v11) {
    return 0;
  }
  int v12 = [(HUCameraController *)self playbackEngine];
  uint64_t v13 = [v12 currentClip];
  uint64_t v14 = objc_msgSend(v13, "hf_dateInterval");
  uint64_t v15 = [(HUCameraController *)self playerConfiguration];
  uint64_t v16 = [v15 startingPlaybackDate];
  uint64_t v17 = objc_msgSend(v14, "hf_searchResultForDate:", v16);

  return v17 == 1;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if ((void *)HUCameraControllerReadyForDisplayContext == a6)
  {
    id v12 = a4;
    uint64_t v13 = HFLogForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v10;
      _os_log_impl(&dword_1BE345000, v13, OS_LOG_TYPE_DEFAULT, "observed value :%@", buf, 0xCu);
    }

    uint64_t v14 = [(HUCameraController *)self volumeControlView];
    int v15 = [v12 isEqual:v14];

    if (v15)
    {
      [(HUCameraController *)self updateMicrophoneControls];
    }
    else if (([v10 isEqual:@"videoBounds"] & 1) != 0 {
           || [v10 isEqual:@"bounds"])
    }
    {
      uint64_t v16 = [(HUCameraController *)self playerViewController];
      [v16 videoBounds];
      double v18 = v17;
      double v20 = v19;
      double v22 = v21;
      double v24 = v23;

      if (v22 > 1.0 && v24 > 1.0)
      {
        BOOL v25 = [(HUCameraController *)self timelapseController];
        objc_msgSend(v25, "updateVideoBounds:", v18, v20, v22, v24);

        double v26 = [MEMORY[0x1E4F68F90] sharedManager];
        objc_msgSend(v26, "setVideoSize:", v22, v24);
      }
    }
    else
    {
      [(HUCameraController *)self updatePlaceholderContent];
    }
  }
  else
  {
    v27.receiver = self;
    v27.super_class = (Class)HUCameraController;
    id v11 = a4;
    [(HUCameraController *)&v27 observeValueForKeyPath:v10 ofObject:v11 change:a5 context:a6];
  }
}

- (void)cleanUpIdleTimerState
{
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Re-enabling the idle timer for camera player dismissal.", v5, 2u);
  }

  int v4 = +[HUApplicationManager sharedInstance];
  [v4 setIdleTimerDisabled:0 forRequester:self];
}

- (void)cleanUpConstraintSets
{
  [(HUCameraController *)self setCameraStatusViewTopConstraint:0];
  [(HUCameraController *)self setCameraStatusViewConstraintSet:0];
  [(HUCameraController *)self setScrubberConstraintSet:0];
  [(HUCameraController *)self setPortraitMicrophoneConstraintSet:0];
  [(HUCameraController *)self setLandscapeMicrophoneConstraintSet:0];

  [(HUCameraController *)self setCalendarConstraintSet:0];
}

- (void)enableAudioSession
{
  unint64_t v2 = [(HUCameraController *)self audioSessionQueue];
  dispatch_async(v2, &__block_literal_global_262);
}

void __40__HUCameraController_enableAudioSession__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v4 = 0;
  [v0 setActive:1 error:&v4];
  id v1 = v4;

  unint64_t v2 = HFLogForCategory();
  id v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v1;
      _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Error enabling audio session: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Enabled audio session", buf, 2u);
  }
}

- (void)disableAudioSession
{
  unint64_t v2 = [(HUCameraController *)self audioSessionQueue];
  dispatch_async(v2, &__block_literal_global_264);
}

void __41__HUCameraController_disableAudioSession__block_invoke()
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F153E0] sharedInstance];
  id v4 = 0;
  [v0 setActive:0 withOptions:1 error:&v4];
  id v1 = v4;

  unint64_t v2 = HFLogForCategory();
  id v3 = v2;
  if (v1)
  {
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v6 = v1;
      _os_log_error_impl(&dword_1BE345000, v3, OS_LOG_TYPE_ERROR, "Error disabling audio session: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Disabled audio session", buf, 2u);
  }
}

- (void)dealloc
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v14 = self;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "%@ dealloc", buf, 0xCu);
  }

  [(HUCameraController *)self disableAudioSession];
  id v4 = [(HUCameraController *)self playerViewController];
  [v4 setDelegate:0];

  [(HUCameraController *)self cleanUpConstraintSets];
  uint64_t v5 = [MEMORY[0x1E4F68F90] sharedManager];
  [v5 resetForCameraDismissal];

  id v6 = [MEMORY[0x1E4F68FE8] sharedManager];
  [v6 setClipManager:0];

  if ([(HUCameraController *)self isObservingReadyForDisplay])
  {
    uint64_t v7 = [(HUCameraController *)self playerViewController];
    [v7 removeObserver:self forKeyPath:@"readyForDisplay"];

    id v8 = [(HUCameraController *)self playerViewController];
    [v8 removeObserver:self forKeyPath:@"videoBounds"];

    int v9 = [(HUCameraController *)self volumeControlView];
    [v9 removeObserver:self forKeyPath:@"bounds"];

    id v10 = [(HUCameraController *)self playerViewController];
    id v11 = [v10 customControlsView];
    [v11 removeObserver:self forKeyPath:@"bounds"];
  }
  v12.receiver = self;
  v12.super_class = (Class)HUCameraController;
  [(HUCameraController *)&v12 dealloc];
}

- (HUPresentationDelegate)presentationDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->presentationDelegate);

  return (HUPresentationDelegate *)WeakRetained;
}

- (void)setPresentationDelegate:(id)a3
{
}

- (AVPlayerViewController)playerViewController
{
  return self->_playerViewController;
}

- (void)setPlayerViewController:(id)a3
{
}

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (HUCameraControllerDelegate)cameraDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cameraDelegate);

  return (HUCameraControllerDelegate *)WeakRetained;
}

- (void)setCameraDelegate:(id)a3
{
}

- (HFItemManager)itemManager
{
  return self->_itemManager;
}

- (void)setItemManager:(id)a3
{
}

- (HFCameraItem)cameraItem
{
  return self->_cameraItem;
}

- (void)setCameraItem:(id)a3
{
}

- (HUCameraPlayerConfiguration)playerConfiguration
{
  return self->_playerConfiguration;
}

- (void)setPlayerConfiguration:(id)a3
{
}

- (void)setCameraStatusView:(id)a3
{
}

- (HUCameraPlayerAVBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (UIButton)cameraPickerButton
{
  return self->_cameraPickerButton;
}

- (void)setCameraPickerButton:(id)a3
{
}

- (NSArray)savedControlItems
{
  return self->_savedControlItems;
}

- (void)setSavedControlItems:(id)a3
{
}

- (void)setNextControlItem:(id)a3
{
}

- (HUCalendarScrubberContainerViewController)calendarContainerViewController
{
  return self->_calendarContainerViewController;
}

- (void)setCalendarContainerViewController:(id)a3
{
}

- (HUCameraPlayerAccessoryViewController)accessoryViewController
{
  return self->_accessoryViewController;
}

- (void)setAccessoryViewController:(id)a3
{
}

- (HUCameraPlayerFooterViewController)footerViewController
{
  return self->_footerViewController;
}

- (void)setFooterViewController:(id)a3
{
}

- (HUCameraPlayerLiveContentViewController)liveContentViewController
{
  return self->_liveContentViewController;
}

- (void)setLiveContentViewController:(id)a3
{
}

- (HUClipScrubberViewController)clipScrubberViewController
{
  return self->_clipScrubberViewController;
}

- (void)setClipScrubberViewController:(id)a3
{
}

- (HUCameraPlayerPlaceholderContentViewController)placeholderContentViewController
{
  return self->_placeholderContentViewController;
}

- (void)setPlaceholderContentViewController:(id)a3
{
}

- (HUCameraBlurViewController)blurViewController
{
  return self->_blurViewController;
}

- (void)setBlurViewController:(id)a3
{
}

- (BOOL)recordedClipInterfaceAvailable
{
  return self->_recordedClipInterfaceAvailable;
}

- (void)setRecordedClipInterfaceAvailable:(BOOL)a3
{
  self->_recordedClipInterfaceAvailable = a3;
}

- (BOOL)isEnteringFullScreen
{
  return self->_enteringFullScreen;
}

- (BOOL)isViewVisible
{
  return self->_viewVisible;
}

- (BOOL)isObservingReadyForDisplay
{
  return self->_observingReadyForDisplay;
}

- (void)setObservingReadyForDisplay:(BOOL)a3
{
  self->_observingReadyForDisplay = a3;
}

- (BOOL)applicationIsActive
{
  return self->_applicationIsActive;
}

- (void)setApplicationIsActive:(BOOL)a3
{
  self->_applicationIsActive = a3;
}

- (NAUILayoutConstraintSet)cameraStatusViewConstraintSet
{
  return self->_cameraStatusViewConstraintSet;
}

- (void)setCameraStatusViewConstraintSet:(id)a3
{
}

- (NAUILayoutConstraintSet)scrubberConstraintSet
{
  return self->_scrubberConstraintSet;
}

- (void)setScrubberConstraintSet:(id)a3
{
}

- (NAUILayoutConstraintSet)calendarConstraintSet
{
  return self->_calendarConstraintSet;
}

- (void)setCalendarConstraintSet:(id)a3
{
}

- (NAUILayoutConstraintSet)portraitMicrophoneConstraintSet
{
  return self->_portraitMicrophoneConstraintSet;
}

- (void)setPortraitMicrophoneConstraintSet:(id)a3
{
}

- (NAUILayoutConstraintSet)landscapeMicrophoneConstraintSet
{
  return self->_landscapeMicrophoneConstraintSet;
}

- (void)setLandscapeMicrophoneConstraintSet:(id)a3
{
}

- (NSLayoutConstraint)cameraStatusViewTopConstraint
{
  return self->_cameraStatusViewTopConstraint;
}

- (void)setCameraStatusViewTopConstraint:(id)a3
{
}

- (NSLayoutConstraint)dayLabelBottomConstraint
{
  return self->_dayLabelBottomConstraint;
}

- (void)setDayLabelBottomConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewWidthConstraint
{
  return self->_accessoryViewWidthConstraint;
}

- (void)setAccessoryViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)accessoryViewHeightConstraint
{
  return self->_accessoryViewHeightConstraint;
}

- (void)setAccessoryViewHeightConstraint:(id)a3
{
}

- (HUCameraRecordingPlayerView)demoPlayerView
{
  return self->_demoPlayerView;
}

- (void)setDemoPlayerView:(id)a3
{
}

- (AVPlayerLooper)looper
{
  return self->_looper;
}

- (void)setLooper:(id)a3
{
}

- (AVQueuePlayer)demoModeQueuePlayer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_demoModeQueuePlayer);

  return (AVQueuePlayer *)WeakRetained;
}

- (void)setDemoModeQueuePlayer:(id)a3
{
}

- (UIAlertController)airplaneAlertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_airplaneAlertController);

  return (UIAlertController *)WeakRetained;
}

- (void)setAirplaneAlertController:(id)a3
{
}

- (HUCameraTimelapseController)timelapseController
{
  return self->_timelapseController;
}

- (void)setTimelapseController:(id)a3
{
}

- (AVPlayerLayer)timelapsePlayerLayer
{
  return self->_timelapsePlayerLayer;
}

- (void)setTimelapsePlayerLayer:(id)a3
{
}

- (BOOL)shouldResumePlaying
{
  return self->_shouldResumePlaying;
}

- (void)setShouldResumePlaying:(BOOL)a3
{
  self->_shouldResumePlaying = a3;
}

- (void)setDayLabel:(id)a3
{
}

- (void)setTimeLabel:(id)a3
{
}

- (void)setDateDisplayController:(id)a3
{
}

- (void)setLoadingOverlayView:(id)a3
{
}

- (NSTimer)liveTimer
{
  return self->_liveTimer;
}

- (void)setLiveTimer:(id)a3
{
}

- (NAFuture)ppt_clipsLoadedFuture
{
  return self->_ppt_clipsLoadedFuture;
}

- (void)setPpt_clipsLoadedFuture:(id)a3
{
}

- (void)setPortraitMicrophoneControl:(id)a3
{
}

- (void)setLandscapeMicrophoneControl:(id)a3
{
}

- (BOOL)hu_playbackControlsAreVisible
{
  return self->_hu_playbackControlsAreVisible;
}

- (void)setHu_playbackControlsAreVisible:(BOOL)a3
{
  self->_hu_playbackControlsAreVisible = a3;
}

- (BOOL)displayingDetailsViewController
{
  return self->_displayingDetailsViewController;
}

- (void)setDisplayingDetailsViewController:(BOOL)a3
{
  self->_displayingDetailsViewController = a3;
}

- (BOOL)needsToFetchClip
{
  return self->_needsToFetchClip;
}

- (void)setNeedsToFetchClip:(BOOL)a3
{
  self->_needsToFetchClip = a3;
}

- (BOOL)finishedFetchingCameraEvents
{
  return self->_finishedFetchingCameraEvents;
}

- (void)setFinishedFetchingCameraEvents:(BOOL)a3
{
  self->_finishedFetchingCameraEvents = a3;
}

- (HUDiagnosticsCameraPlayerController)diagnosticsController
{
  return self->_diagnosticsController;
}

- (void)setDiagnosticsController:(id)a3
{
}

- (HFCameraAnalyticsCameraPlayerLaunchEvent)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
}

- (BOOL)isDismissingViewController
{
  return self->_isDismissingViewController;
}

- (void)setIsDismissingViewController:(BOOL)a3
{
  self->_isDismissingViewController = a3;
}

- (unint64_t)pipState
{
  return self->_pipState;
}

- (OS_dispatch_queue)audioSessionQueue
{
  return self->_audioSessionQueue;
}

- (void)setAudioSessionQueue:(id)a3
{
}

- (BOOL)foundCameraClipWithInsufficientAnalysis
{
  return self->_foundCameraClipWithInsufficientAnalysis;
}

- (void)setFoundCameraClipWithInsufficientAnalysis:(BOOL)a3
{
  self->_foundCameraClipWithInsufficientAnalysis = a3;
}

- (NAFuture)calendarScrubberDataSourceFuture
{
  return self->_calendarScrubberDataSourceFuture;
}

- (void)setCalendarScrubberDataSourceFuture:(id)a3
{
}

- (UIViewController)tipPopoverController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_tipPopoverController);

  return (UIViewController *)WeakRetained;
}

- (void)setTipPopoverController:(id)a3
{
}

- (id)tipsObserver
{
  return self->_tipsObserver;
}

- (void)setTipsObserver:(id)a3
{
}

- (unint64_t)lastTimeControlStatusPriorToCameraSwap
{
  return self->_lastTimeControlStatusPriorToCameraSwap;
}

- (void)setLastTimeControlStatusPriorToCameraSwap:(unint64_t)a3
{
  self->_lastTimeControlStatusPriorToCameraSwap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tipsObserver, 0);
  objc_destroyWeak((id *)&self->_tipPopoverController);
  objc_storeStrong((id *)&self->_calendarScrubberDataSourceFuture, 0);
  objc_storeStrong((id *)&self->_audioSessionQueue, 0);
  objc_storeStrong((id *)&self->_launchEvent, 0);
  objc_storeStrong((id *)&self->_diagnosticsController, 0);
  objc_storeStrong((id *)&self->_landscapeMicrophoneControl, 0);
  objc_storeStrong((id *)&self->_portraitMicrophoneControl, 0);
  objc_storeStrong((id *)&self->_ppt_clipsLoadedFuture, 0);
  objc_storeStrong((id *)&self->_liveTimer, 0);
  objc_storeStrong((id *)&self->_loadingOverlayView, 0);
  objc_storeStrong((id *)&self->_dateDisplayController, 0);
  objc_storeStrong((id *)&self->_timeLabel, 0);
  objc_storeStrong((id *)&self->_dayLabel, 0);
  objc_storeStrong((id *)&self->_timelapsePlayerLayer, 0);
  objc_storeStrong((id *)&self->_timelapseController, 0);
  objc_destroyWeak((id *)&self->_airplaneAlertController);
  objc_destroyWeak((id *)&self->_demoModeQueuePlayer);
  objc_storeStrong((id *)&self->_looper, 0);
  objc_storeStrong((id *)&self->_demoPlayerView, 0);
  objc_storeStrong((id *)&self->_accessoryViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_accessoryViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_dayLabelBottomConstraint, 0);
  objc_storeStrong((id *)&self->_cameraStatusViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_landscapeMicrophoneConstraintSet, 0);
  objc_storeStrong((id *)&self->_portraitMicrophoneConstraintSet, 0);
  objc_storeStrong((id *)&self->_calendarConstraintSet, 0);
  objc_storeStrong((id *)&self->_scrubberConstraintSet, 0);
  objc_storeStrong((id *)&self->_cameraStatusViewConstraintSet, 0);
  objc_storeStrong((id *)&self->_blurViewController, 0);
  objc_storeStrong((id *)&self->_placeholderContentViewController, 0);
  objc_storeStrong((id *)&self->_clipScrubberViewController, 0);
  objc_storeStrong((id *)&self->_liveContentViewController, 0);
  objc_storeStrong((id *)&self->_footerViewController, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_calendarContainerViewController, 0);
  objc_storeStrong((id *)&self->_nextControlItem, 0);
  objc_storeStrong((id *)&self->_savedControlItems, 0);
  objc_storeStrong((id *)&self->_cameraPickerButton, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_cameraStatusView, 0);
  objc_storeStrong((id *)&self->_playerConfiguration, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_destroyWeak((id *)&self->_cameraDelegate);
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_playerViewController, 0);

  objc_destroyWeak((id *)&self->presentationDelegate);
}

@end