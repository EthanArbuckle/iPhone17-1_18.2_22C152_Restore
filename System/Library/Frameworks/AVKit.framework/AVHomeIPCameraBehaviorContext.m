@interface AVHomeIPCameraBehaviorContext
- (AVHomeIPCameraBehavior)behavior;
- (AVHomeIPCameraBehaviorContext)initWithAVKitOwner:(id)a3;
- (AVHomeIPCameraPlayerController)livePreviewPlayerController;
- (AVObservationController)observationController;
- (AVPlayerController)playerControllerToRestore;
- (AVPlayerViewController)playerViewController;
- (AVZoomingBehavior)zoomingBehavior;
- (BOOL)canStartPictureInPictureAutomaticallyWhenEnteringBackground;
- (BOOL)hasMicrophone;
- (BOOL)isLivePreviewActive;
- (BOOL)isMicrophoneEnabled;
- (BOOL)isZoomingEnabled;
- (BOOL)playbackControlsIncludeDisplayModeControls;
- (BOOL)playbackControlsIncludePictureInPictureButton;
- (BOOL)playbackControlsIncludeTransportControls;
- (BOOL)playbackControlsIncludeVolumeControls;
- (BOOL)playbackControlsShowsLoadingIndicator;
- (CGSize)livePreviewAspectRatio;
- (UIView)livePreviewContainerView;
- (void)_updatePictureInPictureController;
- (void)_updatePlaybackControlsControllerAndZoomingBehavior;
- (void)beginScrubbing;
- (void)dealloc;
- (void)didAddBehavior:(id)a3;
- (void)didRemoveBehavior:(id)a3;
- (void)didStopPictureInPicture;
- (void)endScrubbing;
- (void)scrubToTime:(double)a3 resolution:(double)a4;
- (void)setBackgroundColor:(id)a3 forContainerOfControlItem:(id)a4;
- (void)setBehavior:(id)a3;
- (void)setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:(BOOL)a3;
- (void)setHasMicrophone:(BOOL)a3;
- (void)setLivePreviewActive:(BOOL)a3;
- (void)setLivePreviewAspectRatio:(CGSize)a3;
- (void)setLivePreviewPlayerController:(id)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setObservationController:(id)a3;
- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3;
- (void)setPlaybackControlsIncludePictureInPictureButton:(BOOL)a3;
- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3;
- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3;
- (void)setPlaybackControlsShowsLoadingIndicator:(BOOL)a3;
- (void)setPlayerControllerToRestore:(id)a3;
- (void)setZoomingBehavior:(id)a3;
- (void)setZoomingEnabled:(BOOL)a3;
- (void)viewDidLoad;
- (void)willStartPictureInPictureWithViewController:(id)a3;
@end

@implementation AVHomeIPCameraBehaviorContext

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_playerControllerToRestore, 0);
  objc_destroyWeak((id *)&self->_livePreviewPlayerController);
  objc_storeStrong((id *)&self->_zoomingBehavior, 0);
  objc_storeStrong((id *)&self->_livePreviewContainerView, 0);
  objc_destroyWeak((id *)&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setPlaybackControlsShowsLoadingIndicator:(BOOL)a3
{
  self->_playbackControlsShowsLoadingIndicator = a3;
}

- (BOOL)playbackControlsShowsLoadingIndicator
{
  return self->_playbackControlsShowsLoadingIndicator;
}

- (void)setObservationController:(id)a3
{
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (void)setPlayerControllerToRestore:(id)a3
{
}

- (AVPlayerController)playerControllerToRestore
{
  return self->_playerControllerToRestore;
}

- (void)setLivePreviewPlayerController:(id)a3
{
}

- (AVHomeIPCameraPlayerController)livePreviewPlayerController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_livePreviewPlayerController);

  return (AVHomeIPCameraPlayerController *)WeakRetained;
}

- (void)setZoomingBehavior:(id)a3
{
}

- (AVZoomingBehavior)zoomingBehavior
{
  return self->_zoomingBehavior;
}

- (CGSize)livePreviewAspectRatio
{
  double width = self->_livePreviewAspectRatio.width;
  double height = self->_livePreviewAspectRatio.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (BOOL)playbackControlsIncludePictureInPictureButton
{
  return self->_playbackControlsIncludePictureInPictureButton;
}

- (BOOL)canStartPictureInPictureAutomaticallyWhenEnteringBackground
{
  return self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground;
}

- (BOOL)hasMicrophone
{
  return self->_hasMicrophone;
}

- (BOOL)isLivePreviewActive
{
  return self->_livePreviewActive;
}

- (UIView)livePreviewContainerView
{
  return self->_livePreviewContainerView;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (BOOL)isZoomingEnabled
{
  return self->_zoomingEnabled;
}

- (BOOL)playbackControlsIncludeVolumeControls
{
  return self->_playbackControlsIncludeVolumeControls;
}

- (BOOL)playbackControlsIncludeDisplayModeControls
{
  return self->_playbackControlsIncludeDisplayModeControls;
}

- (BOOL)playbackControlsIncludeTransportControls
{
  return self->_playbackControlsIncludeTransportControls;
}

- (void)setBehavior:(id)a3
{
}

- (AVHomeIPCameraBehavior)behavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);

  return (AVHomeIPCameraBehavior *)WeakRetained;
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (void)_updatePictureInPictureController
{
  v3 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v4 = [v3 playbackControlsController];
  v5 = [v4 pictureInPictureController];
  objc_msgSend(v5, "setControlsStyle:", -[AVHomeIPCameraBehaviorContext isLivePreviewActive](self, "isLivePreviewActive"));

  v6 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v7 = [v6 playbackControlsController];
  v8 = [v7 pictureInPictureController];
  v9 = [v8 pictureInPictureViewController];
  objc_msgSend(v9, "setShouldShowAlternateActionButtonImage:", -[AVHomeIPCameraBehaviorContext hasMicrophone](self, "hasMicrophone"));

  v10 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v11 = [v10 playbackControlsController];
  v12 = [v11 pictureInPictureController];
  objc_msgSend(v12, "setMicrophoneEnabled:", -[AVHomeIPCameraBehaviorContext isMicrophoneEnabled](self, "isMicrophoneEnabled"));

  id v13 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  objc_msgSend(v13, "setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:", -[AVHomeIPCameraBehaviorContext canStartPictureInPictureAutomaticallyWhenEnteringBackground](self, "canStartPictureInPictureAutomaticallyWhenEnteringBackground"));
}

- (void)_updatePlaybackControlsControllerAndZoomingBehavior
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__AVHomeIPCameraBehaviorContext__updatePlaybackControlsControllerAndZoomingBehavior__block_invoke;
  block[3] = &unk_1E5FC4698;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __84__AVHomeIPCameraBehaviorContext__updatePlaybackControlsControllerAndZoomingBehavior__block_invoke(uint64_t a1)
{
  id v34 = [*(id *)(a1 + 32) playerViewController];
  objc_msgSend(v34, "setPlaybackControlsIncludeDisplayModeControls:", objc_msgSend(*(id *)(a1 + 32), "playbackControlsIncludeDisplayModeControls"));
  objc_msgSend(v34, "setPlaybackControlsIncludeVolumeControls:", objc_msgSend(*(id *)(a1 + 32), "playbackControlsIncludeVolumeControls"));
  objc_msgSend(v34, "setPlaybackControlsIncludeTransportControls:", objc_msgSend(*(id *)(a1 + 32), "playbackControlsIncludeTransportControls"));
  v2 = [v34 playbackControlsController];
  [v2 setShowsVideoGravityButton:0];

  objc_msgSend(v34, "setCanShowPictureInPictureButton:", objc_msgSend(*(id *)(a1 + 32), "playbackControlsIncludePictureInPictureButton"));
  v3 = [*(id *)(a1 + 32) livePreviewContainerView];
  uint64_t v4 = [v3 superview];
  if (v4)
  {
    v5 = (void *)v4;
  }
  else
  {
    v5 = [*(id *)(a1 + 32) playerViewController];
    if (([v5 isPictureInPictureActive] & 1) == 0)
    {
      v6 = [*(id *)(a1 + 32) zoomingBehavior];
      v7 = [v6 behaviorContext];
      v8 = [v7 activeContentView];
      v9 = [v8 playerLayerView];

      if (!v9) {
        goto LABEL_7;
      }
      v10 = [*(id *)(a1 + 32) zoomingBehavior];
      v11 = [v10 behaviorContext];
      v12 = [v11 activeContentView];
      id v13 = [v12 playerLayerView];
      v14 = [*(id *)(a1 + 32) livePreviewContainerView];
      [v13 addSubview:v14];

      v15 = (void *)MEMORY[0x1E4F28DC8];
      v3 = [*(id *)(a1 + 32) livePreviewContainerView];
      v5 = [*(id *)(a1 + 32) zoomingBehavior];
      v16 = [v5 behaviorContext];
      v17 = [v16 activeContentView];
      v18 = [v17 playerLayerView];
      v19 = objc_msgSend(v3, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v18);
      [v15 activateConstraints:v19];
    }
  }

LABEL_7:
  int v20 = [*(id *)(a1 + 32) isLivePreviewActive];
  v21 = *(void **)(a1 + 32);
  if (v20)
  {
    [v21 livePreviewAspectRatio];
    double v23 = v22;
    double v25 = v24;
  }
  else
  {
    v26 = [v21 playerViewController];
    v27 = [v26 playerController];
    [v27 contentDimensions];
    double v23 = v28;
    double v25 = v29;
  }
  if (v23 > 0.0 && v25 > 0.0)
  {
    v30 = [*(id *)(a1 + 32) zoomingBehavior];
    v31 = [v30 behaviorContext];
    objc_msgSend(v31, "setContentAspectRatio:", v23, v25);
  }
  v32 = [*(id *)(a1 + 32) zoomingBehavior];
  v33 = [v32 behaviorContext];
  objc_msgSend(v33, "setZoomingEnabled:", objc_msgSend(*(id *)(a1 + 32), "isZoomingEnabled"));
}

- (void)endScrubbing
{
  v3 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  uint64_t v4 = [v3 playbackControlsController];
  [v4 setForcePlaybackControlsHidden:0];

  id v6 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v5 = [v6 playbackControlsController];
  [v5 endScrubbing];
}

- (void)scrubToTime:(double)a3 resolution:(double)a4
{
  id v7 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  id v6 = [v7 playbackControlsController];
  [v6 scrubToTime:a3 resolution:a4];
}

- (void)beginScrubbing
{
  v3 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  uint64_t v4 = [v3 playbackControlsController];
  [v4 beginScrubbing];

  id v6 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v5 = [v6 playbackControlsController];
  [v5 setForcePlaybackControlsHidden:1];
}

- (void)didStopPictureInPicture
{
  v3 = [(AVHomeIPCameraBehaviorContext *)self zoomingBehavior];
  uint64_t v4 = [v3 behaviorContext];
  v5 = [v4 activeContentView];
  id v6 = [v5 playerLayerView];
  id v7 = [(AVHomeIPCameraBehaviorContext *)self livePreviewContainerView];
  [v6 addSubview:v7];

  v8 = (void *)MEMORY[0x1E4F28DC8];
  v9 = [(AVHomeIPCameraBehaviorContext *)self livePreviewContainerView];
  v10 = [(AVHomeIPCameraBehaviorContext *)self zoomingBehavior];
  v11 = [v10 behaviorContext];
  v12 = [v11 activeContentView];
  id v13 = [v12 playerLayerView];
  v14 = objc_msgSend(v9, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v13);
  [v8 activateConstraints:v14];

  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
}

- (void)willStartPictureInPictureWithViewController:(id)a3
{
  id v4 = a3;
  v5 = [v4 view];
  id v6 = [(AVHomeIPCameraBehaviorContext *)self livePreviewContainerView];
  [v5 addSubview:v6];

  id v7 = (void *)MEMORY[0x1E4F28DC8];
  v8 = [(AVHomeIPCameraBehaviorContext *)self livePreviewContainerView];
  v9 = [v4 view];

  v10 = objc_msgSend(v8, "avkit_constraintsFromEdgeAnchorsToEdgeAnchorsOfItem:", v9);
  [v7 activateConstraints:v10];

  [(AVHomeIPCameraBehaviorContext *)self _updatePictureInPictureController];
}

- (void)viewDidLoad
{
  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
  [(AVHomeIPCameraBehaviorContext *)self _updatePictureInPictureController];
  v3 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  id v4 = [v3 playbackControlsController];
  [v4 setShowsVideoGravityButton:0];

  v5 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  id v6 = [v5 playbackControlsController];
  [v6 setShowsVolumeControlsForContentWithNoAudio:1];

  id v8 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  id v7 = [v8 contentView];
  [v7 setContentOverlayViewPlacement:1];
}

- (void)didRemoveBehavior:(id)a3
{
  id v4 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v3 = [v4 playbackControlsController];
  [v3 setShowsVolumeControlsForContentWithNoAudio:0];
}

- (void)didAddBehavior:(id)a3
{
  id v4 = a3;
  v5 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  id v6 = [(AVHomeIPCameraBehaviorContext *)self zoomingBehavior];
  [v5 addBehavior:v6];

  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
  id v7 = [(AVHomeIPCameraBehaviorContext *)self observationController];
  id v8 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  [v7 startObservingNotificationForName:@"AVPlayerViewControllerDidChangePlayerControllerNotification" object:v8 notificationCenter:0 observationHandler:&__block_literal_global_10055];

  v9 = [(AVHomeIPCameraBehaviorContext *)self observationController];
  [v9 startObservingNotificationForName:@"AVPlaybackControlsControllsShowsLoadingIndicatorNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_15];

  id v10 = [(AVHomeIPCameraBehaviorContext *)self livePreviewPlayerController];
  [v10 setDelegate:v4];
}

void __48__AVHomeIPCameraBehaviorContext_didAddBehavior___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v14 = a2;
  id v5 = a4;
  id v6 = [v5 userInfo];
  id v7 = [v6 objectForKeyedSubscript:@"AVPlaybackControlsControllerShowsLoadingIndicatorValueKey"];
  uint64_t v8 = [v7 BOOLValue];

  v9 = [v5 object];

  id v10 = [v14 playerViewController];
  v11 = [v10 playbackControlsController];
  if (v9 == v11)
  {
    int v12 = [v14 playbackControlsShowsLoadingIndicator];

    id v13 = v14;
    if (v8 == v12) {
      goto LABEL_6;
    }
    [v14 setPlaybackControlsShowsLoadingIndicator:v8];
    v9 = [v14 behavior];
    [v9 playbackControlsDidUpdateVisibilityOfLoadingIndicator:v8];
  }
  else
  {
  }
  id v13 = v14;
LABEL_6:
}

void __48__AVHomeIPCameraBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v2 = [v5 playerViewController];
  v3 = [v2 playerController];
  id v4 = [v3 player];

  if (v4) {
    [v5 setLivePreviewActive:0];
  }
}

- (void)setBackgroundColor:(id)a3 forContainerOfControlItem:(id)a4
{
  id v16 = a3;
  id v6 = a4;
  id v7 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  [v7 loadViewIfNeeded];

  uint64_t v8 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
  v9 = [v8 contentView];
  [v9 loadPlaybackControlsViewIfNeeded];

  uint64_t v10 = [v6 type];
  if (v10)
  {
    if (v10 != 1) {
      goto LABEL_6;
    }
    v11 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
    int v12 = [v11 contentView];
    id v13 = [v12 playbackControlsView];
    id v14 = [v13 volumeControls];
  }
  else
  {
    v11 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
    int v12 = [v11 contentView];
    id v13 = [v12 playbackControlsView];
    id v14 = [v13 screenModeControls];
  }
  v15 = v14;
  [v14 setBackgroundColor:v16];

LABEL_6:
}

- (void)setLivePreviewAspectRatio:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  self->_livePreviewAspectRatio = a3;
  id v6 = [(AVHomeIPCameraBehaviorContext *)self livePreviewPlayerController];
  objc_msgSend(v6, "setPresentationSize:", width, height);

  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
}

- (void)setPlaybackControlsIncludePictureInPictureButton:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_playbackControlsIncludePictureInPictureButton != a3)
  {
    BOOL v3 = a3;
    self->_playbackControlsIncludePictureInPictureButton = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      uint64_t v8 = "-[AVHomeIPCameraBehaviorContext setPlaybackControlsIncludePictureInPictureButton:]";
      uint64_t v10 = "playbackControlsIncludePictureInPictureButton";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      int v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
  }
}

- (void)setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground != a3)
  {
    BOOL v3 = a3;
    self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v7 = 136315650;
      uint64_t v8 = "-[AVHomeIPCameraBehaviorContext setCanStartPictureInPictureAutomaticallyWhenEnteringBackground:]";
      uint64_t v10 = "canStartPictureInPictureAutomaticallyWhenEnteringBackground";
      __int16 v9 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v11 = 2080;
      int v12 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
    }

    [(AVHomeIPCameraBehaviorContext *)self _updatePictureInPictureController];
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  if (self->_microphoneEnabled != a3)
  {
    self->_microphoneEnabled = a3;
    [(AVHomeIPCameraBehaviorContext *)self _updatePictureInPictureController];
  }
}

- (void)setHasMicrophone:(BOOL)a3
{
  if (self->_hasMicrophone != a3)
  {
    self->_hasMicrophone = a3;
    [(AVHomeIPCameraBehaviorContext *)self _updatePictureInPictureController];
  }
}

- (void)setLivePreviewActive:(BOOL)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (self->_livePreviewActive != a3)
  {
    BOOL v3 = a3;
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v21 = 136315650;
      double v22 = "-[AVHomeIPCameraBehaviorContext setLivePreviewActive:]";
      double v24 = "livePreviewActive";
      __int16 v23 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v25 = 2080;
      v26 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v21, 0x20u);
    }

    self->_livePreviewActive = v3;
    if (v3)
    {
      int v7 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
      uint64_t v8 = [v7 playerController];
      [(AVHomeIPCameraBehaviorContext *)self setPlayerControllerToRestore:v8];

      __int16 v9 = objc_alloc_init(AVHomeIPCameraPlayerController);
      uint64_t v10 = [(AVHomeIPCameraBehaviorContext *)self behavior];
      [(AVHomeIPCameraPlayerController *)v9 setDelegate:v10];

      [(AVHomeIPCameraBehaviorContext *)self livePreviewAspectRatio];
      -[AVHomeIPCameraPlayerController setPresentationSize:](v9, "setPresentationSize:");
      __int16 v11 = [(AVHomeIPCameraBehaviorContext *)self playerControllerToRestore];
      -[AVHomeIPCameraPlayerController setMuted:](v9, "setMuted:", [v11 isMuted]);

      [(AVHomeIPCameraBehaviorContext *)self setLivePreviewPlayerController:v9];
      int v12 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
      [v12 setPlayerController:v9];

      [(AVHomeIPCameraBehaviorContext *)self _updatePictureInPictureController];
    }
    else
    {
      uint64_t v13 = [(AVHomeIPCameraBehaviorContext *)self playerControllerToRestore];
      id v14 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
      v15 = [v14 playerController];
      objc_msgSend(v13, "setMuted:", objc_msgSend(v15, "isMuted"));

      id v16 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
      v17 = [(AVHomeIPCameraBehaviorContext *)self playerControllerToRestore];
      [v16 setPlayerController:v17];

      [(AVHomeIPCameraBehaviorContext *)self setPlayerControllerToRestore:0];
      [(AVHomeIPCameraBehaviorContext *)self setLivePreviewPlayerController:0];
      __int16 v9 = [(AVHomeIPCameraBehaviorContext *)self playerViewController];
      v18 = [(AVHomeIPCameraPlayerController *)v9 playbackControlsController];
      v19 = [v18 pictureInPictureController];
      [v19 setControlsStyle:0];
    }
    [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
    int v20 = [(AVHomeIPCameraBehaviorContext *)self livePreviewContainerView];
    objc_msgSend(v20, "setHidden:", -[AVHomeIPCameraBehaviorContext isLivePreviewActive](self, "isLivePreviewActive") ^ 1);
  }
}

- (void)setZoomingEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    int v7 = 136315650;
    uint64_t v8 = "-[AVHomeIPCameraBehaviorContext setZoomingEnabled:]";
    uint64_t v10 = "zoomingEnabled";
    __int16 v9 = 2080;
    if (v3) {
      id v6 = "YES";
    }
    __int16 v11 = 2080;
    int v12 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }

  self->_zoomingEnabled = v3;
  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
}

- (void)setPlaybackControlsIncludeTransportControls:(BOOL)a3
{
  self->_playbackControlsIncludeTransportControls = a3;
  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
}

- (void)setPlaybackControlsIncludeDisplayModeControls:(BOOL)a3
{
  self->_playbackControlsIncludeDisplayModeControls = a3;
  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
}

- (void)setPlaybackControlsIncludeVolumeControls:(BOOL)a3
{
  self->_playbackControlsIncludeVolumeControls = a3;
  [(AVHomeIPCameraBehaviorContext *)self _updatePlaybackControlsControllerAndZoomingBehavior];
}

- (void)dealloc
{
  BOOL v3 = [(AVHomeIPCameraBehaviorContext *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVHomeIPCameraBehaviorContext;
  [(AVHomeIPCameraBehaviorContext *)&v4 dealloc];
}

- (AVHomeIPCameraBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  if (self)
  {
    *(_DWORD *)&self->_playbackControlsIncludeTransportControls = 16843008;
    self->_playbackControlsShowsLoadingIndicator = 0;
    id v5 = objc_storeWeak((id *)&self->_playerViewController, v4);
    *(_WORD *)&self->_canStartPictureInPictureAutomaticallyWhenEnteringBackground = 1;
    id v6 = v5;
    [v4 setRequiresImmediateAssetInspection:1];

    id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);
    [WeakRetained setCanDisplayContentInDetachedWindow:0];

    uint64_t v8 = [[AVObservationController alloc] initWithOwner:self];
    observationController = self->_observationController;
    self->_observationController = v8;

    self->_livePreviewAspectRatio = (CGSize)xmmword_1B07212E0;
    uint64_t v10 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    livePreviewContainerView = self->_livePreviewContainerView;
    self->_livePreviewContainerView = v10;

    [(UIView *)self->_livePreviewContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)self->_livePreviewContainerView setHidden:1];
    [(UIView *)self->_livePreviewContainerView setUserInteractionEnabled:0];
    LODWORD(v12) = 1132068864;
    [(UIView *)self->_livePreviewContainerView setContentCompressionResistancePriority:0 forAxis:v12];
    LODWORD(v13) = 1132068864;
    [(UIView *)self->_livePreviewContainerView setContentCompressionResistancePriority:1 forAxis:v13];
    id v14 = objc_alloc_init(AVZoomingBehavior);
    zoomingBehavior = self->_zoomingBehavior;
    self->_zoomingBehavior = v14;

    self->_hasMicrophone = 1;
  }

  return self;
}

@end