@interface HUNCCameraPlayerViewController
+ (BOOL)usesSecondGenerationControls;
- (BOOL)_shouldAutoPlayOnViewAppearance;
- (BOOL)hu_playbackControlsAreVisible;
- (BOOL)shouldDisplayMicrophoneControl;
- (HFCameraAnalyticsCameraPlayerLaunchEvent)launchEvent;
- (HFCameraItem)cameraItem;
- (HFCameraPlaybackEngine)playbackEngine;
- (HFItemManager)itemManager;
- (HMCameraClip)currentClip;
- (HMCameraProfile)cameraProfile;
- (HUCameraBlurViewController)blurViewController;
- (HUCameraLiveButtonView)liveButtonView;
- (HUCameraPlayerAVBehavior)behavior;
- (HUCameraPlayerAccessoryViewController)accessoryViewController;
- (HUCameraPlayerLiveContentViewController)liveContentViewController;
- (HUNCCameraPlayerPlaceholderContentViewController)placeholderContentViewController;
- (HUNCCameraPlayerViewController)initWithCameraProfile:(id)a3 notificationUUID:(id)a4 clipUUID:(id)a5 imageURL:(id)a6;
- (HUNCCameraScrubberViewController)miniScrubberViewController;
- (NAUILayoutConstraintSet)scrubberConstraintSet;
- (NAUILayoutConstraintSet)staticConstraintSet;
- (NSDate)playbackStartDateFromSignificantEvent;
- (NSUUID)clipUUID;
- (NSUUID)notificationUUID;
- (double)currentScrubberResolutionForBehavior:(id)a3;
- (id)home;
- (unint64_t)numberOfAssociatedAccessoriesDisplayed;
- (void)_setupConstraintSets;
- (void)_setupPlaybackEngine;
- (void)_updateCameraStatus;
- (void)_updateLivePreviewAspectRatio;
- (void)_updatePlayerVolumeSliderState;
- (void)_updateRecordedClipInterfaceAvailabilityWithAnimation:(BOOL)a3;
- (void)_updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4;
- (void)_updateStateForScrubbingStatus:(BOOL)a3 animated:(BOOL)a4;
- (void)addPlaybackEngineObservation;
- (void)dealloc;
- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4;
- (void)loadCameraClip;
- (void)playbackControlsDidChangePlayerVolume:(float)a3;
- (void)playbackControlsDidToggleMuted:(BOOL)a3;
- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3;
- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6;
- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4;
- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4;
- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4;
- (void)playbackEngine:(id)a3 didUpdateScrubbingStatus:(BOOL)a4;
- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4;
- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5;
- (void)reloadAfterNotificationUpdate;
- (void)reloadForCurrentClip;
- (void)setAccessoryViewController:(id)a3;
- (void)setBehavior:(id)a3;
- (void)setBlurViewController:(id)a3;
- (void)setCameraItem:(id)a3;
- (void)setCameraProfile:(id)a3;
- (void)setClipUUID:(id)a3;
- (void)setCurrentClip:(id)a3;
- (void)setHu_playbackControlsAreVisible:(BOOL)a3;
- (void)setItemManager:(id)a3;
- (void)setLaunchEvent:(id)a3;
- (void)setLiveButtonView:(id)a3;
- (void)setLiveContentViewController:(id)a3;
- (void)setMiniScrubberViewController:(id)a3;
- (void)setNotificationUUID:(id)a3;
- (void)setNumberOfAssociatedAccessoriesDisplayed:(unint64_t)a3;
- (void)setPlaceholderContentViewController:(id)a3;
- (void)setPlaybackEngine:(id)a3;
- (void)setPlaybackStartDateFromSignificantEvent:(id)a3;
- (void)setScrubberConstraintSet:(id)a3;
- (void)setStaticConstraintSet:(id)a3;
- (void)toggleLive;
- (void)toggleMicrophoneState;
- (void)updateLiveButton;
- (void)updateMicrophone;
- (void)updateMicrophoneVisibility;
- (void)updateViewConstraints;
- (void)updateVolumeControlVisibility;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation HUNCCameraPlayerViewController

+ (BOOL)usesSecondGenerationControls
{
  return 0;
}

- (HUNCCameraPlayerViewController)initWithCameraProfile:(id)a3 notificationUUID:(id)a4 clipUUID:(id)a5 imageURL:(id)a6
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v51.receiver = self;
  v51.super_class = (Class)HUNCCameraPlayerViewController;
  v15 = [(HUNCCameraPlayerViewController *)&v51 init];
  if (v15)
  {
    v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218498;
      v53 = v15;
      __int16 v54 = 2112;
      id v55 = v12;
      __int16 v56 = 2112;
      id v57 = v13;
      _os_log_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEFAULT, "(NC) Launching Camera Player <%p> for notificationUUID:%@ clipUUID:%@", buf, 0x20u);
    }

    v17 = (HFCameraAnalyticsCameraPlayerLaunchEvent *)objc_alloc_init(MEMORY[0x1E4F68F50]);
    launchEvent = v15->_launchEvent;
    v15->_launchEvent = v17;

    objc_storeStrong((id *)&v15->_cameraProfile, a3);
    objc_storeStrong((id *)&v15->_notificationUUID, a4);
    objc_storeStrong((id *)&v15->_clipUUID, a5);
    id v19 = objc_alloc(MEMORY[0x1E4F68F98]);
    v20 = [v11 accessory];
    v21 = [v20 home];
    v22 = objc_msgSend(v21, "hf_characteristicValueManager");
    uint64_t v23 = [v19 initWithProfile:v11 valueSource:v22];
    cameraItem = v15->_cameraItem;
    v15->_cameraItem = (HFCameraItem *)v23;

    v25 = [[HUCameraPlayerAVBehavior alloc] initWithDelegate:v15];
    behavior = v15->_behavior;
    v15->_behavior = v25;

    [(HUNCCameraPlayerViewController *)v15 addBehavior:v15->_behavior];
    v27 = [(AVHomeIPCameraBehavior *)v15->_behavior behaviorContext];
    [v27 setPlaybackControlsIncludeTransportControls:0];

    v28 = [(AVHomeIPCameraBehavior *)v15->_behavior behaviorContext];
    [v28 setPlaybackControlsIncludeDisplayModeControls:0];

    v29 = [(AVHomeIPCameraBehavior *)v15->_behavior behaviorContext];
    [v29 setZoomingEnabled:0];

    [(HUNCCameraPlayerViewController *)v15 _setupPlaybackEngine];
    if (v13) {
      [(HUNCCameraPlayerViewController *)v15 loadCameraClip];
    }
    v30 = objc_alloc_init(HUCameraBlurViewController);
    blurViewController = v15->_blurViewController;
    v15->_blurViewController = v30;

    v32 = [HUCameraPlayerAccessoryViewController alloc];
    v33 = [(HUNCCameraPlayerViewController *)v15 playbackEngine];
    uint64_t v34 = [(HUCameraPlayerAccessoryViewController *)v32 initWithPlaybackEngine:v33];
    accessoryViewController = v15->_accessoryViewController;
    v15->_accessoryViewController = (HUCameraPlayerAccessoryViewController *)v34;

    [(HUCameraPlayerAccessoryViewController *)v15->_accessoryViewController setForceLoadingIndicatorToDisplay:1];
    v36 = [HUCameraPlayerLiveContentViewController alloc];
    v37 = [(HUNCCameraPlayerViewController *)v15 playbackEngine];
    uint64_t v38 = [(HUCameraPlayerLiveContentViewController *)v36 initWithPlaybackEngine:v37];
    liveContentViewController = v15->_liveContentViewController;
    v15->_liveContentViewController = (HUCameraPlayerLiveContentViewController *)v38;

    v40 = [[HUNCCameraPlayerPlaceholderContentViewController alloc] initWithImageURL:v14];
    placeholderContentViewController = v15->_placeholderContentViewController;
    v15->_placeholderContentViewController = v40;

    uint64_t v42 = [objc_alloc(MEMORY[0x1E4F69590]) initWithDelegate:v15 sourceItem:v15->_cameraItem];
    itemManager = v15->_itemManager;
    v15->_itemManager = (HFItemManager *)v42;

    [(HFItemManager *)v15->_itemManager disableExternalUpdatesWithReason:@"kDisableUpdatesReasonHUNCCameraPlayerViewControllerNotVisible"];
    [(HUNCCameraPlayerViewController *)v15 setDelegate:v15];
    [(HUNCCameraPlayerViewController *)v15 setUpdatesNowPlayingInfoCenter:0];
    v44 = [MEMORY[0x1E4F153E0] sharedInstance];
    uint64_t v45 = *MEMORY[0x1E4F14F98];
    id v50 = 0;
    [v44 setCategory:v45 error:&v50];
    v46 = (HUNCCameraPlayerViewController *)v50;

    if (v46)
    {
      v47 = HFLogForCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v53 = v46;
        _os_log_error_impl(&dword_1BE345000, v47, OS_LOG_TYPE_ERROR, "Unable to properly set audio playback session with error: %@", buf, 0xCu);
      }
    }
    [(HUNCCameraPlayerViewController *)v15 updateVolumeControlVisibility];
    id v48 = (id)[MEMORY[0x1E4F68F60] sharedDecorator];
  }
  return v15;
}

- (void)viewDidLoad
{
  uint64_t v90 = *MEMORY[0x1E4F143B8];
  v85.receiver = self;
  v85.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v85 viewDidLoad];
  v3 = [(HUNCCameraPlayerViewController *)self placeholderContentViewController];
  [(HUNCCameraPlayerViewController *)self addChildViewController:v3];

  v4 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [(HUNCCameraPlayerViewController *)self addChildViewController:v4];

  v5 = [(HUNCCameraPlayerViewController *)self blurViewController];
  [(HUNCCameraPlayerViewController *)self addChildViewController:v5];

  v6 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  v7 = [(HUNCCameraPlayerViewController *)self placeholderContentViewController];
  v8 = [v7 view];
  objc_msgSend(v6, "naui_addAutoLayoutSubview:", v8);

  v9 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  v10 = [(HUNCCameraPlayerViewController *)self blurViewController];
  id v11 = [v10 view];
  objc_msgSend(v9, "naui_addAutoLayoutSubview:", v11);

  id v12 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  id v13 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  id v14 = [v13 view];
  [v12 addSubview:v14];

  v15 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  v16 = [v15 view];
  [v16 setTranslatesAutoresizingMaskIntoConstraints:0];

  v17 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  v18 = [v17 view];
  id v19 = [v18 leftAnchor];
  v20 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  v21 = [v20 leftAnchor];
  v22 = [v19 constraintEqualToAnchor:v21];
  [v22 setActive:1];

  uint64_t v23 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  v24 = [v23 view];
  v25 = [v24 rightAnchor];
  v26 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  v27 = [v26 rightAnchor];
  v28 = [v25 constraintEqualToAnchor:v27];
  [v28 setActive:1];

  v29 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  v30 = [v29 view];
  v31 = [v30 topAnchor];
  v32 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  v33 = [v32 topAnchor];
  uint64_t v34 = [v31 constraintEqualToAnchor:v33];
  [v34 setActive:1];

  v35 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  v36 = [v35 view];
  v37 = [v36 bottomAnchor];
  uint64_t v38 = [(HUNCCameraPlayerViewController *)self contentOverlayView];
  v39 = [v38 bottomAnchor];
  v40 = [v37 constraintEqualToAnchor:v39];
  [v40 setActive:1];

  v41 = [(HUNCCameraPlayerViewController *)self blurViewController];
  [v41 didMoveToParentViewController:self];

  uint64_t v42 = [(HUNCCameraPlayerViewController *)self placeholderContentViewController];
  [v42 didMoveToParentViewController:self];

  v43 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v43 didMoveToParentViewController:self];

  v44 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v45 = [v44 prefersAudioEnabled] ^ 1;
  v46 = [(HUNCCameraPlayerViewController *)self playerController];
  [v46 setMuted:v45];

  v47 = [(HUNCCameraPlayerViewController *)self cameraProfile];
  LODWORD(v45) = objc_msgSend(v47, "hf_supportsBidirectionalAudio");

  if (v45)
  {
    [(HUNCCameraPlayerViewController *)self setHu_playbackControlsAreVisible:1];
    id v48 = [(HUNCCameraPlayerViewController *)self customControlsView];
    v49 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    id v50 = [v49 microphoneControl];
    [v48 addSubview:v50];

    objc_super v51 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    v52 = [v51 microphoneControl];
    [v52 addTarget:self action:sel_toggleMicrophoneState forControlEvents:64];

    v53 = HFLogForCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v54 = [(HUNCCameraPlayerViewController *)self cameraProfile];
      id v55 = [v54 accessory];
      __int16 v56 = [v55 name];
      id v57 = [(HUNCCameraPlayerViewController *)self clipUUID];
      *(_DWORD *)buf = 138412546;
      v87 = v56;
      __int16 v88 = 1024;
      BOOL v89 = v57 != 0;
      _os_log_impl(&dword_1BE345000, v53, OS_LOG_TYPE_DEFAULT, "Speaker is supported by camera:%@. Microphone control displayed at top:%{BOOL}d.", buf, 0x12u);
    }
    uint64_t v58 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    uint64_t v59 = [v58 isMicrophoneEnabled];
    v60 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    v61 = [v60 microphoneControl];
    [v61 setTalking:v59];

    v62 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    v63 = [v62 microphoneControl];
    v64 = [v63 leftAnchor];
    v65 = [(HUNCCameraPlayerViewController *)self customControlsView];
    v66 = [v65 leftAnchor];
    v67 = [v64 constraintEqualToAnchor:v66 constant:8.0];
    [v67 setActive:1];

    v68 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    v69 = [v68 microphoneControl];
    v70 = [v69 bottomAnchor];
    v71 = [(HUNCCameraPlayerViewController *)self customControlsView];
    v72 = [v71 safeAreaLayoutGuide];
    v73 = [v72 bottomAnchor];
    v74 = [v70 constraintEqualToAnchor:v73 constant:-8.0];
    [v74 setActive:1];

    [(HUNCCameraPlayerViewController *)self updateMicrophone];
  }
  else
  {
    v75 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    v76 = [v75 microphoneControl];
    [v76 setAlpha:0.0];

    v77 = HFLogForCategory();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_DEFAULT))
    {
      v78 = [(HUNCCameraPlayerViewController *)self cameraProfile];
      v79 = [v78 accessory];
      *(_DWORD *)buf = 138412290;
      v87 = v79;
      _os_log_impl(&dword_1BE345000, v77, OS_LOG_TYPE_DEFAULT, "Speaker not supported by camera:%@. Will not display microphone control.", buf, 0xCu);
    }
  }
  v80 = HFLogForCategory();
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v80, OS_LOG_TYPE_DEFAULT, "Notification scrubber viewDidLoad.", buf, 2u);
  }

  v81 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v81 setShouldShowLoadingIndicatorForClipPlayback:1];

  v82 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v82 setCanShowOverlayContent:1];

  v83 = [(HUNCCameraPlayerViewController *)self customControlsView];
  v84 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  [v83 addSubview:v84];

  [(HUNCCameraPlayerViewController *)self _setupConstraintSets];
}

- (void)viewWillAppear:(BOOL)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v14.receiver = self;
  v14.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v14 viewWillAppear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v16 = self;
    __int16 v17 = 2112;
    v18 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  v7 = [(HUNCCameraPlayerViewController *)self itemManager];
  [v7 endDisableExternalUpdatesWithReason:@"kDisableUpdatesReasonHUNCCameraPlayerViewControllerNotVisible"];

  v8 = [(HUNCCameraPlayerViewController *)self clipUUID];

  if (!v8)
  {
    v9 = HFLogForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Starting Live Stream since there is no clipUUID.", buf, 2u);
    }

    v10 = [MEMORY[0x1E4F68FC8] livePosition];
    id v11 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    [v11 setPlaybackPosition:v10];

    id v12 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    [v12 play];

    id v13 = [MEMORY[0x1E4F68FC8] livePosition];
    [(HUNCCameraPlayerViewController *)self _updateStateForPlaybackPosition:v13 animated:1];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v7 viewDidAppear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    id v11 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);
  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v8.receiver = self;
  v8.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v8 viewWillDisappear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    __int16 v10 = self;
    __int16 v11 = 2112;
    uint64_t v12 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);
  }
  objc_super v7 = [(HUNCCameraPlayerViewController *)self itemManager];
  [v7 disableExternalUpdatesWithReason:@"kDisableUpdatesReasonHUNCCameraPlayerViewControllerNotVisible"];
}

- (void)viewDidDisappear:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  v7.receiver = self;
  v7.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v7 viewDidDisappear:a3];
  v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v9 = self;
    __int16 v10 = 2112;
    __int16 v11 = v6;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "%@ : %@", buf, 0x16u);
  }
}

- (void)viewWillLayoutSubviews
{
  v14.receiver = self;
  v14.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v14 viewWillLayoutSubviews];
  v3 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  v4 = [v3 liveCameraSource];
  [v4 aspectRatio];
  if (v5 == 0.0) {
    double v6 = 1.77777778;
  }
  else {
    double v6 = v5;
  }

  objc_super v7 = [(HUNCCameraPlayerViewController *)self view];
  [v7 bounds];
  double v9 = v8;
  if (v6 >= 1.0 || v6 <= 0.0)
  {
    uint64_t v12 = [(HUNCCameraPlayerViewController *)self view];
    [v12 bounds];
    -[HUNCCameraPlayerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v9, round(v13 / v6));
  }
  else
  {
    double v10 = round(v8 / v6);

    if ([(HUNCCameraPlayerViewController *)self numberOfAssociatedAccessoriesDisplayed])
    {
      double v11 = v10 + -150.0;
    }
    else
    {
      double v11 = v10;
    }
    -[HUNCCameraPlayerViewController setPreferredContentSize:](self, "setPreferredContentSize:", v6 * v11, round(v11));
  }
}

- (void)_updateRecordedClipInterfaceAvailabilityWithAnimation:(BOOL)a3
{
  double v5 = HFLogForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "Finished clip prep. Safe to update UI.", buf, 2u);
  }

  dispatch_time_t v6 = dispatch_time(0, 200000000);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke;
  block[3] = &unk_1E6386018;
  block[4] = self;
  objc_super v7 = MEMORY[0x1E4F14428];
  dispatch_after(v6, MEMORY[0x1E4F14428], block);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2;
  v8[3] = &unk_1E6385A70;
  v8[4] = self;
  BOOL v9 = a3;
  dispatch_async(v7, v8);
}

uint64_t __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) flashPlaybackControlsWithDuration:1.79769313e308];
}

void __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_2(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) notificationUUID];

  if (v2)
  {
    v3 = [*(id *)(a1 + 32) miniScrubberViewController];

    if (!v3)
    {
      v4 = [HUNCCameraScrubberViewController alloc];
      double v5 = [*(id *)(a1 + 32) playbackEngine];
      dispatch_time_t v6 = [*(id *)(a1 + 32) currentClip];
      objc_super v7 = [*(id *)(a1 + 32) currentClip];
      double v8 = [v7 dateOfOccurrence];
      BOOL v9 = [(HUNCCameraScrubberViewController *)v4 initWithPlaybackEngine:v5 currentClip:v6 startDate:v8];
      [*(id *)(a1 + 32) setMiniScrubberViewController:v9];

      double v10 = [*(id *)(a1 + 32) liveButtonView];
      double v11 = [v10 liveButton];
      [v11 addTarget:*(void *)(a1 + 32) action:sel_toggleLive forControlEvents:64];

      uint64_t v12 = *(void **)(a1 + 32);
      double v13 = [v12 miniScrubberViewController];
      [v12 addChildViewController:v13];

      objc_super v14 = [*(id *)(a1 + 32) customControlsView];
      v15 = [*(id *)(a1 + 32) miniScrubberViewController];
      v16 = [v15 view];
      objc_msgSend(v14, "naui_addAutoLayoutSubview:", v16);

      __int16 v17 = [*(id *)(a1 + 32) customControlsView];
      v18 = [*(id *)(a1 + 32) liveContentViewController];
      uint64_t v19 = [v18 microphoneControl];
      [v17 bringSubviewToFront:v19];

      v20 = [*(id *)(a1 + 32) customControlsView];
      v21 = [*(id *)(a1 + 32) liveButtonView];
      [v20 bringSubviewToFront:v21];

      v22 = [*(id *)(a1 + 32) miniScrubberViewController];
      [v22 didMoveToParentViewController:*(void *)(a1 + 32)];
    }
  }
  uint64_t v23 = [*(id *)(a1 + 32) scrubberConstraintSet];
  [v23 invalidate];

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3;
  aBlock[3] = &unk_1E6386730;
  aBlock[4] = *(void *)(a1 + 32);
  v24 = _Block_copy(aBlock);
  v25 = [*(id *)(a1 + 32) view];
  [v25 updateConstraintsIfNeeded];

  if (*(unsigned char *)(a1 + 40))
  {
    v26 = (void *)MEMORY[0x1E4F42FF0];
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_4;
    v27[3] = &unk_1E6386040;
    id v28 = v24;
    [v26 animateWithDuration:v27 animations:0.3];
  }
  else
  {
    (*((void (**)(void *, uint64_t))v24 + 2))(v24, 1);
  }
}

void __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_3(uint64_t a1, unsigned int a2)
{
  double v2 = (double)a2;
  id v4 = [*(id *)(a1 + 32) miniScrubberViewController];
  v3 = [v4 view];
  [v3 setAlpha:v2];
}

uint64_t __88__HUNCCameraPlayerViewController__updateRecordedClipInterfaceAvailabilityWithAnimation___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)home
{
  double v2 = [(HUNCCameraPlayerViewController *)self cameraProfile];
  v3 = [v2 accessory];
  id v4 = [v3 home];

  return v4;
}

- (void)_setupConstraintSets
{
  v36[4] = *MEMORY[0x1E4F143B8];
  objc_initWeak(&location, self);
  v18 = (void *)MEMORY[0x1E4F28DC8];
  v30 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  v27 = [v30 rightAnchor];
  v29 = [(HUNCCameraPlayerViewController *)self customControlsView];
  id v28 = [v29 transportControlsAreaLayoutGuide];
  v26 = [v28 rightAnchor];
  v25 = [v27 constraintEqualToAnchor:v26];
  v36[0] = v25;
  v24 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  uint64_t v23 = [v24 heightAnchor];
  v22 = [v23 constraintEqualToConstant:44.0];
  v36[1] = v22;
  v21 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  uint64_t v19 = [v21 widthAnchor];
  v20 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  v3 = [v20 liveButton];
  id v4 = [v3 widthAnchor];
  double v5 = [v19 constraintEqualToAnchor:v4];
  v36[2] = v5;
  dispatch_time_t v6 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  objc_super v7 = [v6 bottomAnchor];
  double v8 = [(HUNCCameraPlayerViewController *)self customControlsView];
  BOOL v9 = [v8 bottomAnchor];
  double v10 = [v7 constraintEqualToAnchor:v9 constant:-8.0];
  v36[3] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v36 count:4];
  [v18 activateConstraints:v11];

  id v12 = objc_alloc(MEMORY[0x1E4F7A100]);
  double v13 = [(HUNCCameraPlayerViewController *)self view];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke;
  v33[3] = &unk_1E638F990;
  objc_copyWeak(&v34, &location);
  objc_super v14 = (void *)[v12 initWithOwningView:v13 constraintBuilder:v33];
  [(HUNCCameraPlayerViewController *)self setStaticConstraintSet:v14];

  id v15 = objc_alloc(MEMORY[0x1E4F7A100]);
  v16 = [(HUNCCameraPlayerViewController *)self view];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke_2;
  v31[3] = &unk_1E638F990;
  objc_copyWeak(&v32, &location);
  __int16 v17 = (void *)[v15 initWithOwningView:v16 constraintBuilder:v31];
  [(HUNCCameraPlayerViewController *)self setScrubberConstraintSet:v17];

  objc_destroyWeak(&v32);
  objc_destroyWeak(&v34);
  objc_destroyWeak(&location);
}

id __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke(uint64_t a1)
{
  v15[2] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v14 = [WeakRetained placeholderContentViewController];
  v3 = [v14 view];
  id v4 = [WeakRetained contentOverlayView];
  double v5 = objc_msgSend(v2, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v3, v4);
  v15[0] = v5;
  dispatch_time_t v6 = (void *)MEMORY[0x1E4F28DC8];
  objc_super v7 = [WeakRetained blurViewController];
  double v8 = [v7 view];
  BOOL v9 = [WeakRetained contentOverlayView];
  double v10 = objc_msgSend(v6, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v8, v9);
  v15[1] = v10;
  double v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:2];
  id v12 = objc_msgSend(v11, "na_arrayByFlattening");

  return v12;
}

id __54__HUNCCameraPlayerViewController__setupConstraintSets__block_invoke_2(uint64_t a1)
{
  v30[4] = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  double v2 = [WeakRetained miniScrubberViewController];
  v3 = [v2 view];
  id v4 = [v3 superview];

  if (v4)
  {
    id v28 = [WeakRetained miniScrubberViewController];
    v27 = [v28 view];
    v25 = [v27 bottomAnchor];
    v26 = [WeakRetained customControlsView];
    v24 = [v26 bottomAnchor];
    uint64_t v23 = [v25 constraintEqualToAnchor:v24 constant:-6.0];
    v30[0] = v23;
    v22 = [WeakRetained miniScrubberViewController];
    v21 = [v22 view];
    uint64_t v19 = [v21 leftAnchor];
    v20 = [WeakRetained customControlsView];
    v18 = [v20 transportControlsAreaLayoutGuide];
    __int16 v17 = [v18 leftAnchor];
    v16 = [v19 constraintEqualToAnchor:v17];
    v30[1] = v16;
    id v15 = [WeakRetained miniScrubberViewController];
    double v5 = [v15 view];
    dispatch_time_t v6 = [v5 rightAnchor];
    objc_super v7 = [WeakRetained liveButtonView];
    double v8 = [v7 leftAnchor];
    BOOL v9 = [v6 constraintEqualToAnchor:v8];
    v30[2] = v9;
    double v10 = [WeakRetained miniScrubberViewController];
    double v11 = [v10 view];
    id v12 = [v11 heightAnchor];
    double v13 = [v12 constraintEqualToConstant:47.0];
    v30[3] = v13;
    id v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:4];
  }
  else
  {
    id v29 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v29;
}

- (void)updateViewConstraints
{
  v3 = [(HUNCCameraPlayerViewController *)self staticConstraintSet];
  [v3 activateIfNeeded];

  id v4 = [(HUNCCameraPlayerViewController *)self scrubberConstraintSet];
  [v4 activateIfNeeded];

  v5.receiver = self;
  v5.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v5 updateViewConstraints];
}

- (void)reloadAfterNotificationUpdate
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [(HUNCCameraPlayerViewController *)self currentClip];
    int v5 = 138412290;
    dispatch_time_t v6 = v4;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(NC) reloading after Notification Update for currentClip:%@.", (uint8_t *)&v5, 0xCu);
  }
  [(HUNCCameraPlayerViewController *)self loadCameraClip];
}

- (void)reloadForCurrentClip
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  v3 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v3 setForceLoadingIndicatorToDisplay:0];

  id v4 = [(HUNCCameraPlayerViewController *)self currentClip];

  int v5 = HFLogForCategory();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      uint64_t v7 = [(HUNCCameraPlayerViewController *)self currentClip];
      double v8 = [(HUNCCameraPlayerViewController *)self playbackStartDateFromSignificantEvent];
      int v18 = 138412546;
      uint64_t v19 = v7;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(NC) reloading for currentClip:%@ at start position:%@.", (uint8_t *)&v18, 0x16u);
    }
    BOOL v9 = [(HUNCCameraPlayerViewController *)self currentClip];
    int v10 = [v9 isComplete];

    double v11 = (void *)MEMORY[0x1E4F68FC8];
    if (v10)
    {
      id v12 = [(HUNCCameraPlayerViewController *)self playbackStartDateFromSignificantEvent];
      double v13 = [v11 clipPositionWithDate:v12];
      objc_super v14 = [(HUNCCameraPlayerViewController *)self playbackEngine];
      [v14 setPlaybackPosition:v13];

      [(HUNCCameraPlayerViewController *)self _updateRecordedClipInterfaceAvailabilityWithAnimation:1];
      return;
    }
    id v15 = [MEMORY[0x1E4F68FC8] livePosition];
    __int16 v17 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    [v17 setPlaybackPosition:v15];
  }
  else
  {
    if (v6)
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1BE345000, v5, OS_LOG_TYPE_DEFAULT, "(NC) reloading while missing clip. Starting Live Stream.", (uint8_t *)&v18, 2u);
    }

    id v15 = [MEMORY[0x1E4F68FC8] livePosition];
    v16 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    [v16 setPlaybackPosition:v15];

    [(HUNCCameraPlayerViewController *)self _updateStateForPlaybackPosition:v15 animated:1];
  }
}

- (void)loadCameraClip
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v3 = [(HUNCCameraPlayerViewController *)self notificationUUID];
  id v4 = HFLogForCategory();
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      *(_DWORD *)buf = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "(NC) Perform cloud pull:%@.", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    BOOL v6 = [(HUNCCameraPlayerViewController *)self cameraProfile];
    uint64_t v7 = [v6 clipManager];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke;
    v8[3] = &unk_1E638F9E0;
    v8[4] = self;
    id v9 = v3;
    objc_copyWeak(&v10, (id *)buf);
    [v7 performCloudPullWithCompletion:v8];

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BE345000, v4, OS_LOG_TYPE_DEFAULT, "HUNCCameraPlayer loading with request for clip without notificationUUID. Should this be possible?", buf, 2u);
    }

    [(HUNCCameraPlayerViewController *)self reloadForCurrentClip];
  }
}

void __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) accessoryViewController];
  [v4 setForceLoadingIndicatorToDisplay:0];

  BOOL v5 = HFLogForCategory();
  BOOL v6 = v5;
  if (v3)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v15 = v3;
      _os_log_error_impl(&dword_1BE345000, v6, OS_LOG_TYPE_ERROR, "(NC) Failure to perform cloud pull:%@.", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      id v15 = v7;
      _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "(NC) cloud pull complete. Fetch clip using notificationUUID:%@.", buf, 0xCu);
    }

    double v8 = [*(id *)(a1 + 32) playbackEngine];
    id v9 = *(void **)(a1 + 40);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke_37;
    v10[3] = &unk_1E638F9B8;
    double v11 = v9;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    uint64_t v12 = *(void *)(a1 + 32);
    [v8 fetchCameraClipForNotificationUUID:v11 withCompletion:v10];

    objc_destroyWeak(&v13);
    BOOL v6 = v11;
  }
}

void __48__HUNCCameraPlayerViewController_loadCameraClip__block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = v6;
  if (v5)
  {
    id v26 = v6;
    double v8 = HFLogForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v33 = v5;
      __int16 v34 = 2112;
      v35 = v9;
      _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "HUNCCameraPlayer loaded with clip:%@ for notificationUUID:%@.", buf, 0x16u);
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    double v11 = [v5 dateOfOccurrence];
    [WeakRetained setPlaybackStartDateFromSignificantEvent:v11];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v12 = [v5 significantEvents];
    uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v28;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v12);
          }
          __int16 v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          int v18 = [v17 uniqueIdentifier];
          int v19 = [v18 isEqual:*(void *)(a1 + 32)];

          if (v19)
          {
            __int16 v20 = [v17 dateOfOccurrence];
            [WeakRetained setPlaybackStartDateFromSignificantEvent:v20];

            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v27 objects:v31 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
LABEL_14:

    [WeakRetained setCurrentClip:v5];
    v21 = HFLogForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = [WeakRetained currentClip];
      uint64_t v23 = [WeakRetained playbackStartDateFromSignificantEvent];
      *(_DWORD *)buf = 138412546;
      id v33 = v22;
      __int16 v34 = 2112;
      v35 = v23;
      _os_log_impl(&dword_1BE345000, v21, OS_LOG_TYPE_DEFAULT, "HUNCCameraPlayer loaded with currentClip:%@ at start position:%@.", buf, 0x16u);
    }
    uint64_t v7 = v26;
    if ([v5 isComplete]) {
      [WeakRetained reloadForCurrentClip];
    }
  }
  else if (v6)
  {
    v24 = HFLogForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      v25 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      id v33 = v25;
      __int16 v34 = 2112;
      v35 = v7;
      _os_log_error_impl(&dword_1BE345000, v24, OS_LOG_TYPE_ERROR, "HUNCCameraPlayer unable to locate clip for notificationUUID:%@ with error:%@.", buf, 0x16u);
    }

    [*(id *)(a1 + 40) reloadForCurrentClip];
  }
}

- (void)_setupPlaybackEngine
{
  id v3 = objc_alloc(MEMORY[0x1E4F68FB8]);
  id v4 = [(HUNCCameraPlayerViewController *)self home];
  id v5 = [(HUNCCameraPlayerViewController *)self cameraProfile];
  id v14 = (id)[v3 initWithHome:v4 cameraProfile:v5];

  id v6 = [(HUNCCameraPlayerViewController *)self behavior];
  [v14 setClipScrubber:v6];

  uint64_t v7 = [(HUNCCameraPlayerViewController *)self notificationUUID];
  [v14 setNotificationUUID:v7];

  double v8 = [(HUNCCameraPlayerViewController *)self clipUUID];
  [v14 setNotificationClipUUID:v8];

  id v9 = [(HUNCCameraPlayerViewController *)self clipUUID];

  if (v9)
  {
    id v10 = (void *)MEMORY[0x1E4F68FC8];
    double v11 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSince1970:0.0];
    uint64_t v12 = [v10 clipPositionWithDate:v11];
    [v14 setPlaybackPosition:v12];
  }
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F68FB0]) initWithConfiguration:v14];
  [(HUNCCameraPlayerViewController *)self setPlaybackEngine:v13];

  [(HUNCCameraPlayerViewController *)self addPlaybackEngineObservation];
}

- (void)addPlaybackEngineObservation
{
  id v4 = objc_alloc_init(MEMORY[0x1E4F68FC0]);
  [v4 setPeriodicTimeUpdateInterval:&unk_1F19B62C0];
  id v3 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  [v3 addObserver:self withOptions:v4];
}

- (void)_updateStateForPlaybackPosition:(id)a3 animated:(BOOL)a4
{
  uint64_t v5 = [a3 contentType];
  id v6 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v6 setForceLoadingIndicatorToDisplay:0];

  if (v5)
  {
    uint64_t v7 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    double v8 = [v7 viewIfLoaded];
    [v8 removeFromSuperview];
  }
  else
  {
    id v9 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    id v10 = [v9 cameraProfile];
    char v11 = objc_msgSend(v10, "hf_shouldDisableLiveStream");

    if (v11) {
      goto LABEL_6;
    }
    uint64_t v12 = [(HUNCCameraPlayerViewController *)self behavior];
    uint64_t v13 = [v12 behaviorContext];
    uint64_t v7 = [v13 livePreviewContainerView];

    id v14 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    uint64_t v15 = [v14 view];
    objc_msgSend(v7, "naui_addAutoLayoutSubview:", v15);

    uint64_t v16 = (void *)MEMORY[0x1E4F28DC8];
    __int16 v17 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    int v18 = [v17 view];
    int v19 = objc_msgSend(v16, "hu_constraintsSizingAnchorProvider:toAnchorProvider:", v18, v7);
    [v16 activateConstraints:v19];

    [(HUNCCameraPlayerViewController *)self _updateLivePreviewAspectRatio];
    double v8 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    __int16 v20 = [v8 cameraView];
    [v20 setBadgeHidden:1];
  }
LABEL_6:
  v21 = [(HUNCCameraPlayerViewController *)self behavior];
  uint64_t v22 = [v21 behaviorContext];
  [v22 setLivePreviewActive:v5 == 0];

  if (v5)
  {
    uint64_t v23 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    v24 = [v23 player];
    [(HUNCCameraPlayerViewController *)self setPlayer:v24];
  }
  else
  {
    [(HUNCCameraPlayerViewController *)self setPlayer:0];
  }
  v25 = [(HUNCCameraPlayerViewController *)self player];

  if (v25)
  {
    id v26 = [(HUNCCameraPlayerViewController *)self player];
    [v26 setAllowsExternalPlayback:0];
  }
  id v29 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v27 = [v29 prefersAudioEnabled] ^ 1;
  long long v28 = [(HUNCCameraPlayerViewController *)self playerController];
  [v28 setMuted:v27];
}

- (void)_updateStateForScrubbingStatus:(BOOL)a3 animated:(BOOL)a4
{
  if (a3)
  {
    uint64_t v5 = [(HUNCCameraPlayerViewController *)self behavior];
    id v6 = [v5 behaviorContext];
    [v6 setPlaybackControlsIncludeDisplayModeControls:0];

    id v8 = [(HUNCCameraPlayerViewController *)self behavior];
    uint64_t v7 = [v8 behaviorContext];
    [v7 setPlaybackControlsIncludeVolumeControls:0];
  }
}

- (void)_updateLivePreviewAspectRatio
{
  id v3 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  id v4 = [v3 liveCameraSource];
  [v4 aspectRatio];
  if (v5 == 0.0) {
    double v6 = 1.77777778;
  }
  else {
    double v6 = v5;
  }

  id v8 = [(HUNCCameraPlayerViewController *)self behavior];
  uint64_t v7 = [v8 behaviorContext];
  objc_msgSend(v7, "setLivePreviewAspectRatio:", v6, 1.0);
}

- (void)_updatePlayerVolumeSliderState
{
  id v6 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  [v6 streamAudioVolume];
  double v4 = v3;
  double v5 = [(HUNCCameraPlayerViewController *)self playerController];
  [v5 setVolume:v4];
}

- (BOOL)_shouldAutoPlayOnViewAppearance
{
  float v3 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  double v4 = [v3 playbackPosition];
  double v5 = [MEMORY[0x1E4F68FC8] livePosition];
  char v6 = [v4 isEqual:v5];

  if (v6) {
    return 1;
  }
  id v8 = [(HUNCCameraPlayerViewController *)self playbackStartDateFromSignificantEvent];

  if (!v8) {
    return 0;
  }
  id v9 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  id v10 = [v9 currentClip];

  if (!v10) {
    return 0;
  }
  char v11 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v12 = [v11 currentClip];
  uint64_t v13 = objc_msgSend(v12, "hf_dateInterval");
  id v14 = [(HUNCCameraPlayerViewController *)self playbackStartDateFromSignificantEvent];
  uint64_t v15 = objc_msgSend(v13, "hf_searchResultForDate:", v14);

  return v15 == 1;
}

- (void)toggleLive
{
  float v3 = HFLogForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)char v6 = 0;
    _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "Toggle live using button", v6, 2u);
  }

  double v4 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v4 setShouldShowLoadingIndicatorForClipPlayback:1];

  [(HUNCCameraPlayerViewController *)self updateMicrophone];
  double v5 = [(HUNCCameraPlayerViewController *)self miniScrubberViewController];
  [v5 toggleLive];
}

- (void)playerViewController:(id)a3 willTransitionToVisibilityOfPlaybackControls:(BOOL)a4 withAnimationCoordinator:(id)a5
{
  BOOL v5 = a4;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  [(HUNCCameraPlayerViewController *)self setHu_playbackControlsAreVisible:v5];
  id v8 = HFLogForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v12 = v5;
    _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "Transitioning visibility of playback controls:%{BOOL}d", buf, 8u);
  }

  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __125__HUNCCameraPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke;
  v9[3] = &unk_1E6385A70;
  v9[4] = self;
  BOOL v10 = v5;
  [v7 addCoordinatedAnimations:v9 completion:0];
}

void __125__HUNCCameraPlayerViewController_playerViewController_willTransitionToVisibilityOfPlaybackControls_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) miniScrubberViewController];
  char v3 = [v2 isScrubbing];

  if ((v3 & 1) == 0)
  {
    LOBYTE(v4) = *(unsigned char *)(a1 + 40);
    double v5 = (double)v4;
    char v6 = [*(id *)(a1 + 32) miniScrubberViewController];
    id v7 = [v6 view];
    [v7 setAlpha:v5];
  }
  LOBYTE(v4) = *(unsigned char *)(a1 + 40);
  double v8 = (double)v4;
  id v9 = [*(id *)(a1 + 32) liveButtonView];
  [v9 setAlpha:v8];

  BOOL v10 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 40))
  {
    [v10 updateMicrophoneVisibility];
    char v11 = *(void **)(a1 + 32);
    [v11 updateVolumeControlVisibility];
  }
  else
  {
    id v13 = [v10 liveContentViewController];
    BOOL v12 = [v13 microphoneControl];
    [v12 setAlpha:0.0];
  }
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackPosition:(id)a4
{
  [(HUNCCameraPlayerViewController *)self _updateStateForPlaybackPosition:a4 animated:1];

  [(HUNCCameraPlayerViewController *)self updateMicrophone];
}

- (void)playbackEngine:(id)a3 didUpdateScrubbingStatus:(BOOL)a4
{
}

- (void)playbackEngine:(id)a3 didUpdateLiveCameraSource:(id)a4
{
  [(HUNCCameraPlayerViewController *)self _updateLivePreviewAspectRatio];
  [(HUNCCameraPlayerViewController *)self updateMicrophone];

  [(HUNCCameraPlayerViewController *)self updateVolumeControlVisibility];
}

- (void)playbackEngine:(id)a3 didUpdateTimeControlStatus:(unint64_t)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(HUNCCameraPlayerViewController *)self updateMicrophone];
  [(HUNCCameraPlayerViewController *)self updateVolumeControlVisibility];
  id v7 = [(HUNCCameraPlayerViewController *)self launchEvent];

  if (a4 == 2 && v7)
  {
    double v8 = [(HUNCCameraPlayerViewController *)self clipUUID];

    id v9 = HFLogForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Send Clip playback launch event after time control update.", (uint8_t *)&v20, 2u);
      }

      char v11 = [v6 currentClip];
      BOOL v12 = [(HUNCCameraPlayerViewController *)self launchEvent];
      [v12 setCameraClip:v11];

      id v13 = [(HUNCCameraPlayerViewController *)self launchEvent];
      [v13 launchedRecordingWithError:0];
    }
    else
    {
      if (v10)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1BE345000, v9, OS_LOG_TYPE_DEFAULT, "(NC) Send Live Stream launch event after time control update.", (uint8_t *)&v20, 2u);
      }

      id v13 = [(HUNCCameraPlayerViewController *)self launchEvent];
      [v13 launchedStreamWithError:0];
    }

    [(HUNCCameraPlayerViewController *)self setLaunchEvent:0];
    goto LABEL_15;
  }
  if (a4 == 2)
  {
LABEL_15:
    int v18 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
    [v18 setShouldShowLoadingIndicatorForClipPlayback:0];

    id v14 = [(HUNCCameraPlayerViewController *)self placeholderContentViewController];
    uint64_t v15 = [v14 view];
    uint64_t v16 = v15;
    uint64_t v17 = 1;
    goto LABEL_16;
  }
  if (a4 == 1 && [v6 engineMode] == 1)
  {
    id v14 = [(HUNCCameraPlayerViewController *)self placeholderContentViewController];
    uint64_t v15 = [v14 view];
    uint64_t v16 = v15;
    uint64_t v17 = 0;
LABEL_16:
    [v15 setHidden:v17];
  }
  [(HUNCCameraPlayerViewController *)self updateLiveButton];
  int v19 = HFLogForCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    int v20 = 134218242;
    unint64_t v21 = a4;
    __int16 v22 = 2112;
    id v23 = v6;
    _os_log_debug_impl(&dword_1BE345000, v19, OS_LOG_TYPE_DEBUG, "Updated timecontrol status:%lu for %@", (uint8_t *)&v20, 0x16u);
  }
}

- (void)playbackEngine:(id)a3 didUpdatePlaybackError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __72__HUNCCameraPlayerViewController_playbackEngine_didUpdatePlaybackError___block_invoke;
  block[3] = &unk_1E6386340;
  block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __72__HUNCCameraPlayerViewController_playbackEngine_didUpdatePlaybackError___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  double v2 = [*(id *)(a1 + 32) launchEvent];

  if (v2)
  {
    if ([*(id *)(a1 + 40) engineMode])
    {
      if ([*(id *)(a1 + 40) engineMode] != 1)
      {
LABEL_11:
        [*(id *)(a1 + 32) setLaunchEvent:0];
        return;
      }
      char v3 = HFLogForCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v4 = *(void *)(a1 + 48);
        int v10 = 138412290;
        uint64_t v11 = v4;
        _os_log_impl(&dword_1BE345000, v3, OS_LOG_TYPE_DEFAULT, "(NC) Send Clip playback failure launch event for error:%@", (uint8_t *)&v10, 0xCu);
      }

      double v5 = [*(id *)(a1 + 40) currentClip];
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
        int v10 = 138412290;
        uint64_t v11 = v9;
        _os_log_impl(&dword_1BE345000, v8, OS_LOG_TYPE_DEFAULT, "(NC) Send stream failure launch event for error:%@", (uint8_t *)&v10, 0xCu);
      }

      id v7 = [*(id *)(a1 + 32) launchEvent];
      [v7 launchedStreamWithError:*(void *)(a1 + 48)];
    }

    goto LABEL_11;
  }
}

- (void)playbackEngine:(id)a3 didUpdateEventsIncludingUpdatedIdentifiers:(id)a4 replacedIdentifiers:(id)a5 removedIdentifiers:(id)a6
{
  uint64_t v7 = objc_opt_class();
  id v8 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v9 = [v8 cameraEvents];
  id v10 = [v9 firstObject];
  if (!v10) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = 0;
  }
  uint64_t v12 = v10;
  if (!v11)
  {
    id v13 = [MEMORY[0x1E4F28B00] currentHandler];
    id v14 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v13 handleFailureInFunction:v14, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

LABEL_7:
    uint64_t v12 = 0;
  }

  [(HUNCCameraPlayerViewController *)self setCurrentClip:v12];
  uint64_t v15 = [(HUNCCameraPlayerViewController *)self playbackStartDateFromSignificantEvent];

  if (v15)
  {
    [(HUNCCameraPlayerViewController *)self reloadForCurrentClip];
  }
  else
  {
    uint64_t v16 = HFLogForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1BE345000, v16, OS_LOG_TYPE_DEBUG, "No playback start date. Waiting until fetch complete.", buf, 2u);
    }
  }
}

- (double)currentScrubberResolutionForBehavior:(id)a3
{
  char v3 = [(HUNCCameraPlayerViewController *)self miniScrubberViewController];
  [v3 currentScrubberResolution];
  double v5 = v4;

  return v5;
}

- (void)playbackControlsDidToggleMuted:(BOOL)a3
{
  BOOL v3 = !a3;
  id v4 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  [v4 setPrefersAudioEnabled:v3];
}

- (void)playbackControlsDidUpdateVisibilityOfLoadingIndicator:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  [v4 setShouldShowLoadingIndicatorForClipPlayback:v3];
}

- (void)playbackControlsDidChangePlayerVolume:(float)a3
{
  id v5 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  *(float *)&double v4 = a3;
  [v5 setStreamAudioVolume:v4];
}

- (void)_updateCameraStatus
{
  BOOL v3 = [(HUNCCameraPlayerViewController *)self accessoryViewController];
  objc_msgSend(v3, "hu_reloadData");

  double v4 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v5 = [v4 engineMode];

  if (!v5)
  {
    id v6 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    [v6 play];
  }
}

- (void)itemManager:(id)a3 didUpdateResultsForSourceItem:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(HUNCCameraPlayerViewController *)self cameraItem];
  int v9 = [v7 isEqual:v8];

  if (v9)
  {
    id v10 = HFLogForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_debug_impl(&dword_1BE345000, v10, OS_LOG_TYPE_DEBUG, "Updated camera itemManager:%@ for item:%@", (uint8_t *)&v11, 0x16u);
    }

    [(HUNCCameraPlayerViewController *)self _updateCameraStatus];
  }
}

- (void)updateMicrophone
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUNCCameraPlayerViewController *)self cameraProfile];
  int v4 = objc_msgSend(v3, "hf_supportsBidirectionalAudio");

  if (v4)
  {
    uint64_t v5 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    uint64_t v6 = [v5 isMicrophoneEnabled];
    id v7 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    id v8 = [v7 microphoneControl];
    [v8 setTalking:v6];

    [(HUNCCameraPlayerViewController *)self updateMicrophoneVisibility];
  }
  else
  {
    int v9 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    id v10 = [v9 microphoneControl];
    [v10 setAlpha:0.0];
  }
  int v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v12 = [(HUNCCameraPlayerViewController *)self cameraProfile];
    int v13 = objc_msgSend(v12, "hf_supportsBidirectionalAudio");
    id v14 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
    uint64_t v15 = [v14 microphoneControl];
    [v15 alpha];
    BOOL v17 = v16 == 0.0;
    int v18 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    v19[0] = 67109632;
    v19[1] = v13;
    __int16 v20 = 1024;
    BOOL v21 = v17;
    __int16 v22 = 1024;
    int v23 = [v18 isLiveStreamPlaying];
    _os_log_debug_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEBUG, "MicrophoneDisplay: BiDirectionalAudio:%{BOOL}d PortraitHidden:%{BOOL}d LiveStreaming:%{BOOL}d", (uint8_t *)v19, 0x14u);
  }
}

- (void)updateMicrophoneVisibility
{
  BOOL v3 = [(HUNCCameraPlayerViewController *)self shouldDisplayMicrophoneControl];
  id v7 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
  int v4 = [v7 microphoneControl];
  uint64_t v5 = v4;
  double v6 = 0.0;
  if (v3) {
    double v6 = 1.0;
  }
  [v4 setAlpha:v6];
}

- (BOOL)shouldDisplayMicrophoneControl
{
  BOOL v3 = [(HUNCCameraPlayerViewController *)self cameraProfile];
  if (objc_msgSend(v3, "hf_supportsBidirectionalAudio"))
  {
    int v4 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    if ([v4 isLiveStreamPlaying]) {
      BOOL v5 = [(HUNCCameraPlayerViewController *)self hu_playbackControlsAreVisible];
    }
    else {
      BOOL v5 = 0;
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
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v4 = [v3 isMicrophoneEnabled] ^ 1;
  BOOL v5 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  [v5 setMicrophoneEnabled:v4];

  double v6 = HFLogForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    v16[0] = 67109120;
    v16[1] = [v7 isMicrophoneEnabled];
    _os_log_impl(&dword_1BE345000, v6, OS_LOG_TYPE_DEFAULT, "Toggled microphone state:%{BOOL}d.", (uint8_t *)v16, 8u);
  }
  id v8 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  int v9 = [v8 isMicrophoneEnabled];

  id v10 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
  int v11 = [v10 microphoneControl];
  id v12 = v11;
  if (v9)
  {
    [v11 setTalking:1];

    int v13 = [(HUNCCameraPlayerViewController *)self playerController];
    [v13 setMuted:0];
  }
  else
  {
    [v11 setTalking:0];

    int v13 = [(HUNCCameraPlayerViewController *)self playbackEngine];
    uint64_t v14 = [v13 prefersAudioEnabled] ^ 1;
    uint64_t v15 = [(HUNCCameraPlayerViewController *)self playerController];
    [v15 setMuted:v14];
  }
}

- (void)updateVolumeControlVisibility
{
  id v6 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  uint64_t v3 = [v6 shouldDisplayVolumeControls];
  uint64_t v4 = [(HUNCCameraPlayerViewController *)self behavior];
  BOOL v5 = [v4 behaviorContext];
  [v5 setPlaybackControlsIncludeVolumeControls:v3];
}

- (void)updateLiveButton
{
  id v4 = [(HUNCCameraPlayerViewController *)self liveButtonView];
  uint64_t v3 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  objc_msgSend(v4, "updateDisplayForStreaming:", objc_msgSend(v3, "isLiveStreamPlaying"));
}

- (HUCameraLiveButtonView)liveButtonView
{
  liveButtonView = self->_liveButtonView;
  if (!liveButtonView)
  {
    id v4 = objc_alloc_init(HUCameraLiveButtonView);
    [(HUCameraLiveButtonView *)v4 setTranslatesAutoresizingMaskIntoConstraints:0];
    BOOL v5 = self->_liveButtonView;
    self->_liveButtonView = v4;

    liveButtonView = self->_liveButtonView;
  }

  return liveButtonView;
}

- (void)dealloc
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  [v4 pause];

  BOOL v5 = [(HUNCCameraPlayerViewController *)self playbackEngine];
  [v5 removeObserver:self];

  id v6 = [(HUNCCameraPlayerViewController *)self miniScrubberViewController];
  id v7 = [v6 view];
  [v7 removeFromSuperview];

  id v8 = [(HUNCCameraPlayerViewController *)self miniScrubberViewController];
  [(HUNCCameraPlayerViewController *)self removeChildViewController:v8];

  [(HUNCCameraPlayerViewController *)self setMiniScrubberViewController:0];
  [(HUNCCameraPlayerViewController *)self setDelegate:0];
  [(HUNCCameraPlayerViewController *)self setPlaybackEngine:0];
  int v9 = [(HUNCCameraPlayerViewController *)self liveContentViewController];
  id v10 = [v9 viewIfLoaded];
  [v10 removeFromSuperview];

  [(HUNCCameraPlayerViewController *)self setLiveContentViewController:0];
  int v11 = HFLogForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    uint64_t v15 = self;
    __int16 v16 = 2112;
    uint64_t v17 = v12;
    _os_log_impl(&dword_1BE345000, v11, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  v13.receiver = self;
  v13.super_class = (Class)HUNCCameraPlayerViewController;
  [(HUNCCameraPlayerViewController *)&v13 dealloc];
}

- (unint64_t)numberOfAssociatedAccessoriesDisplayed
{
  return self->_numberOfAssociatedAccessoriesDisplayed;
}

- (void)setNumberOfAssociatedAccessoriesDisplayed:(unint64_t)a3
{
  self->_numberOfAssociatedAccessoriesDisplayed = a3;
}

- (void)setLiveButtonView:(id)a3
{
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (void)setCameraProfile:(id)a3
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

- (HFCameraPlaybackEngine)playbackEngine
{
  return self->_playbackEngine;
}

- (void)setPlaybackEngine:(id)a3
{
}

- (HUCameraPlayerAVBehavior)behavior
{
  return self->_behavior;
}

- (void)setBehavior:(id)a3
{
}

- (HUCameraPlayerLiveContentViewController)liveContentViewController
{
  return self->_liveContentViewController;
}

- (void)setLiveContentViewController:(id)a3
{
}

- (HUNCCameraScrubberViewController)miniScrubberViewController
{
  return self->_miniScrubberViewController;
}

- (void)setMiniScrubberViewController:(id)a3
{
}

- (HUCameraPlayerAccessoryViewController)accessoryViewController
{
  return self->_accessoryViewController;
}

- (void)setAccessoryViewController:(id)a3
{
}

- (HUNCCameraPlayerPlaceholderContentViewController)placeholderContentViewController
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

- (NAUILayoutConstraintSet)staticConstraintSet
{
  return self->_staticConstraintSet;
}

- (void)setStaticConstraintSet:(id)a3
{
}

- (NAUILayoutConstraintSet)scrubberConstraintSet
{
  return self->_scrubberConstraintSet;
}

- (void)setScrubberConstraintSet:(id)a3
{
}

- (HMCameraClip)currentClip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_currentClip);

  return (HMCameraClip *)WeakRetained;
}

- (void)setCurrentClip:(id)a3
{
}

- (NSUUID)notificationUUID
{
  return self->_notificationUUID;
}

- (void)setNotificationUUID:(id)a3
{
}

- (NSUUID)clipUUID
{
  return self->_clipUUID;
}

- (void)setClipUUID:(id)a3
{
}

- (NSDate)playbackStartDateFromSignificantEvent
{
  return self->_playbackStartDateFromSignificantEvent;
}

- (void)setPlaybackStartDateFromSignificantEvent:(id)a3
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

- (HFCameraAnalyticsCameraPlayerLaunchEvent)launchEvent
{
  return self->_launchEvent;
}

- (void)setLaunchEvent:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_launchEvent, 0);
  objc_storeStrong((id *)&self->_playbackStartDateFromSignificantEvent, 0);
  objc_storeStrong((id *)&self->_clipUUID, 0);
  objc_storeStrong((id *)&self->_notificationUUID, 0);
  objc_destroyWeak((id *)&self->_currentClip);
  objc_storeStrong((id *)&self->_scrubberConstraintSet, 0);
  objc_storeStrong((id *)&self->_staticConstraintSet, 0);
  objc_storeStrong((id *)&self->_blurViewController, 0);
  objc_storeStrong((id *)&self->_placeholderContentViewController, 0);
  objc_storeStrong((id *)&self->_accessoryViewController, 0);
  objc_storeStrong((id *)&self->_miniScrubberViewController, 0);
  objc_storeStrong((id *)&self->_liveContentViewController, 0);
  objc_storeStrong((id *)&self->_behavior, 0);
  objc_storeStrong((id *)&self->_playbackEngine, 0);
  objc_storeStrong((id *)&self->_cameraItem, 0);
  objc_storeStrong((id *)&self->_itemManager, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);

  objc_storeStrong((id *)&self->_liveButtonView, 0);
}

@end