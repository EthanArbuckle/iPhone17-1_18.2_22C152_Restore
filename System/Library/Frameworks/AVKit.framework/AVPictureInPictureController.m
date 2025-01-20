@interface AVPictureInPictureController
+ (BOOL)isPictureInPictureSupported;
+ (UIImage)pictureInPictureButtonStartImage;
+ (UIImage)pictureInPictureButtonStartImageCompatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (UIImage)pictureInPictureButtonStopImage;
+ (UIImage)pictureInPictureButtonStopImageCompatibleWithTraitCollection:(UITraitCollection *)traitCollection;
+ (id)_imageNamed:(id)a3 compatibileWithTraitCollection:(id)a4;
- (AVObservationController)observationController;
- (AVPictureInPictureContentSource)source;
- (AVPictureInPictureContentSource)sourceIfRetainedDuringPictureInPicturePlayback;
- (AVPictureInPictureController)init;
- (AVPictureInPictureController)initWithContentSource:(AVPictureInPictureControllerContentSource *)contentSource;
- (AVPictureInPictureController)initWithPlayerLayer:(AVPlayerLayer *)playerLayer;
- (AVPictureInPictureController)initWithSource:(id)a3;
- (AVPictureInPictureControllerContentSource)contentSource;
- (AVPictureInPictureControllerExtendedDelegate)_extendedDelegate;
- (AVPictureInPicturePlatformAdapter)platformAdapter;
- (AVPictureInPicturePrerollDelegate)prerollDelegate;
- (AVPictureInPictureViewController)pictureInPictureViewController;
- (AVPlayerController)playerController;
- (AVPlayerLayer)playerLayer;
- (BOOL)_shouldPauseWhenExitingPictureInPicture;
- (BOOL)allowsPictureInPictureFromInlineWhenEnteringBackground;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)canPausePlaybackWhenClosingPictureInPicture;
- (BOOL)canStartAutomaticallyWhenEnteringBackground;
- (BOOL)canStopPictureInPicture;
- (BOOL)isMicrophoneEnabled;
- (BOOL)isOtherPictureInPictureActive;
- (BOOL)isPictureInPictureActive;
- (BOOL)isPictureInPicturePossible;
- (BOOL)isPictureInPictureSuspended;
- (BOOL)pictureInPictureWasStartedWhenEnteringBackground;
- (BOOL)requiresLinearPlayback;
- (BOOL)retainsSourceDuringPictureInPicturePlayback;
- (BOOL)wantsImmediateAssetInspection;
- (BOOL)wantsResourceReduction;
- (BOOL)wasPlayingWhenPictureInPictureInterruptionBegan;
- (id)_delegateIfRespondsToSelector:(SEL)a3;
- (id)_sbdlPlayerController;
- (id)activitySessionIdentifier;
- (id)delegate;
- (id)playerControllerIsPlayingObservationToken;
- (id)sampleBufferDisplayLayer;
- (int64_t)backgroundPlaybackPolicy;
- (int64_t)controlsStyle;
- (void)_commonInitWithSource:(id)a3;
- (void)_configureContentSourceForGenericViewIfNeeded:(id)a3;
- (void)_configureContentSourceForVideoCallsIfNeeded:(id)a3;
- (void)_invalidateContentSourceForVideoCallsIfNeeded:(id)a3;
- (void)_logContentSourceType:(id)a3;
- (void)_setCanStopPictureInPicture:(BOOL)a3;
- (void)_startObservationsForContentSource:(id)a3;
- (void)_startObservingPlayerLayerContentSource:(id)a3;
- (void)_startObservingSampleBufferDisplayLayerContentSource:(id)a3;
- (void)_stopPictureInPictureAndRestoreUserInterface:(BOOL)a3;
- (void)_updateBackgroundPlaybackPolicyFromPlayerController;
- (void)_updateEnqueuedBufferDimensions;
- (void)contentSourceVideoRectInWindowChanged;
- (void)dealloc;
- (void)invalidate;
- (void)invalidatePlaybackState;
- (void)pictureInPicturePlatformAdapter:(id)a3 failedToStartError:(id)a4;
- (void)pictureInPicturePlatformAdapter:(id)a3 handlePlaybackCommand:(int64_t)a4;
- (void)pictureInPicturePlatformAdapter:(id)a3 prepareToStopForRestoringUserInterface:(id)a4;
- (void)pictureInPicturePlatformAdapter:(id)a3 statusDidChange:(int64_t)a4 fromStatus:(int64_t)a5;
- (void)pictureInPicturePlatformAdapter:(id)a3 stopPictureInPictureAndRestoreUserInterface:(BOOL)a4;
- (void)pictureInPicturePlatformAdapterBeginReducingResourcesForEligibleOffScreenState;
- (void)pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState;
- (void)pictureInPicturePlatformAdapterPrepareToStopForDismissal:(id)a3;
- (void)reloadPrerollAttributes;
- (void)sampleBufferDisplayLayerDidAppear;
- (void)sampleBufferDisplayLayerDidDisappear;
- (void)sampleBufferDisplayLayerRenderSizeDidChangeToSize:(CGSize)a3;
- (void)setActivitySessionIdentifier:(id)a3;
- (void)setAllowsPictureInPictureFromInlineWhenEnteringBackground:(BOOL)a3;
- (void)setAllowsPictureInPicturePlayback:(BOOL)a3;
- (void)setBackgroundPlaybackPolicy:(int64_t)a3;
- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3;
- (void)setCanStartAutomaticallyWhenEnteringBackground:(BOOL)a3;
- (void)setContentSource:(AVPictureInPictureControllerContentSource *)contentSource;
- (void)setControlsStyle:(int64_t)a3;
- (void)setDelegate:(id)delegate;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setOtherPictureInPictureActive:(BOOL)a3;
- (void)setPictureInPictureActive:(BOOL)a3;
- (void)setPictureInPicturePossible:(BOOL)a3;
- (void)setPictureInPictureSuspended:(BOOL)a3;
- (void)setPictureInPictureWasStartedWhenEnteringBackground:(BOOL)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerControllerIsPlayingObservationToken:(id)a3;
- (void)setPrerollDelegate:(id)a3;
- (void)setRequiresLinearPlayback:(BOOL)requiresLinearPlayback;
- (void)setRetainsSourceDuringPictureInPicturePlayback:(BOOL)a3;
- (void)setSourceIfRetainedDuringPictureInPicturePlayback:(id)a3;
- (void)setWantsImmediateAssetInspection:(BOOL)a3;
- (void)setWasPlayingWhenPictureInPictureInterruptionBegan:(BOOL)a3;
- (void)set_extendedDelegate:(id)a3;
- (void)startObservingPlayerController:(id)a3;
- (void)startPictureInPicture;
- (void)stopObservingPlayerController:(id)a3;
- (void)stopPictureInPicture;
- (void)stopPictureInPictureEvenWhenInBackground;
@end

@implementation AVPictureInPictureController

+ (BOOL)isPictureInPictureSupported
{
  return +[AVPictureInPicturePlatformAdapter isPictureInPictureSupported];
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_prerollDelegate);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->__extendedDelegate);
  objc_storeStrong(&self->_playerControllerIsPlayingObservationToken, 0);
  objc_storeStrong((id *)&self->_sourceIfRetainedDuringPictureInPicturePlayback, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_platformAdapter, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_contentSource, 0);

  objc_storeStrong((id *)&self->_playerLayer, 0);
}

- (void)setPrerollDelegate:(id)a3
{
}

- (AVPictureInPicturePrerollDelegate)prerollDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_prerollDelegate);

  return (AVPictureInPicturePrerollDelegate *)WeakRetained;
}

- (BOOL)canStartAutomaticallyWhenEnteringBackground
{
  return self->_canStartAutomaticallyWhenEnteringBackground;
}

- (void)setPictureInPictureWasStartedWhenEnteringBackground:(BOOL)a3
{
  self->_pictureInPictureWasStartedWhenEnteringBackground = a3;
}

- (BOOL)pictureInPictureWasStartedWhenEnteringBackground
{
  return self->_pictureInPictureWasStartedWhenEnteringBackground;
}

- (BOOL)allowsPictureInPictureFromInlineWhenEnteringBackground
{
  return self->_allowsPictureInPictureFromInlineWhenEnteringBackground;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (void)setRetainsSourceDuringPictureInPicturePlayback:(BOOL)a3
{
  self->_retainsSourceDuringPictureInPicturePlayback = a3;
}

- (BOOL)retainsSourceDuringPictureInPicturePlayback
{
  return self->_retainsSourceDuringPictureInPicturePlayback;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (BOOL)wantsResourceReduction
{
  return self->_wantsResourceReduction;
}

- (AVPictureInPictureContentSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (AVPictureInPictureContentSource *)WeakRetained;
}

- (void)set_extendedDelegate:(id)a3
{
}

- (AVPictureInPictureControllerExtendedDelegate)_extendedDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->__extendedDelegate);

  return (AVPictureInPictureControllerExtendedDelegate *)WeakRetained;
}

- (void)setWasPlayingWhenPictureInPictureInterruptionBegan:(BOOL)a3
{
  self->_wasPlayingWhenPictureInPictureInterruptionBegan = a3;
}

- (BOOL)wasPlayingWhenPictureInPictureInterruptionBegan
{
  return self->_wasPlayingWhenPictureInPictureInterruptionBegan;
}

- (void)setWantsImmediateAssetInspection:(BOOL)a3
{
  self->_wantsImmediateAssetInspection = a3;
}

- (BOOL)wantsImmediateAssetInspection
{
  return self->_wantsImmediateAssetInspection;
}

- (BOOL)isOtherPictureInPictureActive
{
  return self->_otherPictureInPictureActive;
}

- (void)setPlayerControllerIsPlayingObservationToken:(id)a3
{
}

- (id)playerControllerIsPlayingObservationToken
{
  return self->_playerControllerIsPlayingObservationToken;
}

- (void)setSourceIfRetainedDuringPictureInPicturePlayback:(id)a3
{
}

- (AVPictureInPictureContentSource)sourceIfRetainedDuringPictureInPicturePlayback
{
  return self->_sourceIfRetainedDuringPictureInPicturePlayback;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (AVPictureInPicturePlatformAdapter)platformAdapter
{
  return self->_platformAdapter;
}

- (void)_setCanStopPictureInPicture:(BOOL)a3
{
  self->_canStopPictureInPicture = a3;
}

- (BOOL)canStopPictureInPicture
{
  return self->_canStopPictureInPicture;
}

- (void)setPictureInPictureSuspended:(BOOL)a3
{
  self->_pictureInPictureSuspended = a3;
}

- (BOOL)isPictureInPictureSuspended
{
  return self->_pictureInPictureSuspended;
}

- (BOOL)isPictureInPictureActive
{
  return self->_pictureInPictureActive;
}

- (BOOL)isPictureInPicturePossible
{
  return self->_pictureInPicturePossible;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (AVPictureInPictureControllerContentSource)contentSource
{
  return self->_contentSource;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (BOOL)canPausePlaybackWhenClosingPictureInPicture
{
  return self->_canPausePlaybackWhenClosingPictureInPicture;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (void)_updateEnqueuedBufferDimensions
{
  v3 = [(AVPictureInPictureController *)self contentSource];
  id v10 = [v3 sampleBufferDisplayLayer];

  v4 = v10;
  if (v10)
  {
    [v10 videoRect];
    double v6 = v5;
    double v8 = v7;
    v9 = [(AVPictureInPictureController *)self _sbdlPlayerController];
    objc_msgSend(v9, "setEnqueuedBufferDimensions:", v6, v8);

    [(AVPictureInPictureController *)self contentSourceVideoRectInWindowChanged];
    v4 = v10;
  }
}

- (void)_startObservingSampleBufferDisplayLayerContentSource:(id)a3
{
  id v4 = a3;
  double v5 = [(AVPictureInPictureController *)self observationController];
  [v5 startObservingNotificationForName:*MEMORY[0x1E4F160A8] object:v4 notificationCenter:0 observationHandler:&__block_literal_global_116];

  double v6 = [(AVPictureInPictureController *)self observationController];
  [v6 startObservingNotificationForName:*MEMORY[0x1E4F160B0] object:v4 notificationCenter:0 observationHandler:&__block_literal_global_118];

  [(AVPictureInPictureController *)self _updateEnqueuedBufferDimensions];
}

uint64_t __85__AVPictureInPictureController__startObservingSampleBufferDisplayLayerContentSource___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 contentSourceVideoRectInWindowChanged];
}

uint64_t __85__AVPictureInPictureController__startObservingSampleBufferDisplayLayerContentSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateEnqueuedBufferDimensions];
}

- (void)_updateBackgroundPlaybackPolicyFromPlayerController
{
  id v4 = [(AVPictureInPictureController *)self playerController];
  v3 = [v4 player];
  -[AVPictureInPictureController setBackgroundPlaybackPolicy:](self, "setBackgroundPlaybackPolicy:", [v3 audiovisualBackgroundPlaybackPolicy]);
}

- (void)_startObservingPlayerLayerContentSource:(id)a3
{
  v10[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v5 = [(AVPictureInPictureController *)self observationController];
  id v6 = (id)[v5 startObserving:v4 keyPath:@"player" includeInitialValue:0 observationHandler:&__block_literal_global_105_12661];

  double v7 = [(AVPictureInPictureController *)self observationController];
  v10[0] = @"videoRect";
  v10[1] = @"readyForDisplay";
  double v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:2];
  id v9 = (id)[v7 startObserving:v4 keyPaths:v8 includeInitialValue:1 observationHandler:&__block_literal_global_114_12664];
}

uint64_t __72__AVPictureInPictureController__startObservingPlayerLayerContentSource___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 contentSourceVideoRectInWindowChanged];
}

void __72__AVPictureInPictureController__startObservingPlayerLayerContentSource___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v5 = [v2 source];
  v3 = [v2 playerController];
  id v4 = objc_msgSend(v5, "avkit_makePlayerControllerIfNeeded:", v3);
  [v2 setPlayerController:v4];
}

- (void)_startObservationsForContentSource:(id)a3
{
  id v5 = a3;
  id v4 = [v5 source];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(AVPictureInPictureController *)self _startObservingPlayerLayerContentSource:v4];
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && ([v5 hasInitialRenderSize] & 1) == 0) {
      [(AVPictureInPictureController *)self _startObservingSampleBufferDisplayLayerContentSource:v4];
    }
  }
}

- (void)_stopPictureInPictureAndRestoreUserInterface:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(AVPictureInPictureController *)self platformAdapter];
  if ([v5 status] == 3)
  {
  }
  else
  {
    id v6 = [(AVPictureInPictureController *)self platformAdapter];
    uint64_t v7 = [v6 status];

    if (v7 != 4) {
      return;
    }
  }
  id v8 = [(AVPictureInPictureController *)self platformAdapter];
  [v8 stopPictureInPictureAndRestoreUserInterface:v3];
}

- (BOOL)_shouldPauseWhenExitingPictureInPicture
{
  BOOL v3 = [(AVPictureInPictureController *)self platformAdapter];
  id v4 = [v3 playerController];
  BOOL v5 = ([v4 isExternalPlaybackActive] & 1) == 0
    && [(AVPictureInPictureController *)self canPausePlaybackWhenClosingPictureInPicture];

  return v5;
}

- (id)_delegateIfRespondsToSelector:(SEL)a3
{
  id v4 = [(AVPictureInPictureController *)self delegate];
  if (objc_opt_respondsToSelector())
  {
    BOOL v5 = [(AVPictureInPictureController *)self delegate];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_configureContentSourceForGenericViewIfNeeded:(id)a3
{
  id v7 = a3;
  id v4 = [v7 activeContentViewController];

  if (v4)
  {
    BOOL v5 = [v7 activeContentViewController];
    [v5 setContentSource:v7];

    [(AVPictureInPictureController *)self setControlsStyle:0];
    id v6 = [(AVPictureInPictureController *)self platformAdapter];
    [v6 _updateStatus];
  }
}

- (void)_configureContentSourceForVideoCallsIfNeeded:(id)a3
{
  id v8 = a3;
  id v4 = [v8 activeVideoCallContentViewController];

  if (v4)
  {
    BOOL v5 = [v8 activeVideoCallContentViewController];
    [v5 setPictureInPictureController:self];

    id v6 = [v8 activeVideoCallContentViewController];
    [v6 setContentSource:v8];

    id v7 = [v8 activeVideoCallContentViewController];
    [v7 startObservingSourceView];

    [(AVPictureInPictureController *)self setControlsStyle:2];
  }
}

- (void)_invalidateContentSourceForVideoCallsIfNeeded:(id)a3
{
  id v5 = a3;
  BOOL v3 = [v5 activeVideoCallContentViewController];

  if (v3)
  {
    id v4 = [v5 activeVideoCallContentViewController];
    [v4 stopObservingSourceView];
  }
}

- (id)_sbdlPlayerController
{
  BOOL v3 = [(AVPictureInPictureController *)self contentSource];
  id v4 = [v3 sampleBufferDisplayLayer];
  id v5 = [(AVPictureInPictureController *)self playerController];
  id v6 = objc_msgSend(v4, "avkit_makePlayerControllerIfNeeded:", v5);

  return v6;
}

- (void)sampleBufferDisplayLayerDidDisappear
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(AVPictureInPictureController *)self contentSourceVideoRectInWindowChanged];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __68__AVPictureInPictureController_sampleBufferDisplayLayerDidDisappear__block_invoke;
    block[3] = &unk_1E5FC4698;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __68__AVPictureInPictureController_sampleBufferDisplayLayerDidDisappear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentSourceVideoRectInWindowChanged];
}

- (void)sampleBufferDisplayLayerDidAppear
{
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    [(AVPictureInPictureController *)self contentSourceVideoRectInWindowChanged];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __65__AVPictureInPictureController_sampleBufferDisplayLayerDidAppear__block_invoke;
    block[3] = &unk_1E5FC4698;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __65__AVPictureInPictureController_sampleBufferDisplayLayerDidAppear__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) contentSourceVideoRectInWindowChanged];
}

- (void)sampleBufferDisplayLayerRenderSizeDidChangeToSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F29060] isMainThread])
  {
    id v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v15.double width = width;
      v15.double height = height;
      id v7 = NSStringFromCGSize(v15);
      *(_DWORD *)buf = 136315394;
      v11 = "-[AVPictureInPictureController sampleBufferDisplayLayerRenderSizeDidChangeToSize:]";
      __int16 v12 = 2112;
      v13 = v7;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s SampleBufferDisplayLayer Render Size changed: %@", buf, 0x16u);
    }
    id v8 = [(AVPictureInPictureController *)self _sbdlPlayerController];
    objc_msgSend(v8, "setEnqueuedBufferDimensions:", width, height);

    [(AVPictureInPictureController *)self contentSourceVideoRectInWindowChanged];
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __82__AVPictureInPictureController_sampleBufferDisplayLayerRenderSizeDidChangeToSize___block_invoke;
    block[3] = &unk_1E5FC36E8;
    block[4] = self;
    *(double *)&void block[5] = width;
    *(double *)&block[6] = height;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
}

uint64_t __82__AVPictureInPictureController_sampleBufferDisplayLayerRenderSizeDidChangeToSize___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "sampleBufferDisplayLayerRenderSizeDidChangeToSize:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

- (void)invalidatePlaybackState
{
  id v2 = [(AVPictureInPictureController *)self _sbdlPlayerController];
  [v2 invalidatePlaybackState];
}

- (void)setContentSource:(AVPictureInPictureControllerContentSource *)contentSource
{
  id v5 = contentSource;
  if (self->_contentSource != v5)
  {
    v28 = v5;
    id v6 = [(AVPictureInPictureController *)self observationController];
    [v6 stopAllObservation];

    id v7 = [(AVPictureInPictureControllerContentSource *)self->_contentSource sampleBufferDisplayLayer];
    objc_msgSend(v7, "avkit_removePictureInPicturePlayerController");

    [(AVPictureInPictureController *)self _invalidateContentSourceForVideoCallsIfNeeded:self->_contentSource];
    [(AVPictureInPictureController *)self _configureContentSourceForVideoCallsIfNeeded:self->_contentSource];
    [(AVPictureInPictureController *)self _configureContentSourceForGenericViewIfNeeded:self->_contentSource];
    if ([(AVPictureInPictureController *)self wantsResourceReduction])
    {
      id v8 = [(AVPictureInPictureController *)self source];
      id v9 = [(AVPictureInPictureController *)self pictureInPictureViewController];
      id v10 = [(AVPictureInPictureController *)self playerController];
      objc_msgSend(v8, "avkit_endReducingResourcesForPictureInPictureViewController:playerController:", v9, v10);
    }
    objc_storeStrong((id *)&self->_contentSource, contentSource);
    v11 = [(AVPictureInPictureControllerContentSource *)v28 source];
    objc_storeWeak((id *)&self->_source, v11);

    id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
    v13 = [(AVPictureInPictureController *)self platformAdapter];
    [v13 setSource:WeakRetained];

    uint64_t v14 = [(AVPictureInPictureController *)self source];
    CGSize v15 = [(AVPictureInPictureController *)self playerController];
    v16 = objc_msgSend(v14, "avkit_makePlayerControllerIfNeeded:", v15);

    if (objc_opt_respondsToSelector())
    {
      v17 = [(AVPictureInPictureController *)self contentSource];
      [v17 initialRenderSize];
      objc_msgSend(v16, "setEnqueuedBufferDimensions:");
    }
    [(AVPictureInPictureController *)self setPlayerController:v16];
    if ([(AVPictureInPictureController *)self wantsResourceReduction])
    {
      v18 = [(AVPictureInPictureController *)self source];
      v19 = [(AVPictureInPictureController *)self pictureInPictureViewController];
      v20 = [(AVPictureInPictureController *)self playerController];
      objc_msgSend(v18, "avkit_beginReducingResourcesForPictureInPictureViewController:playerController:", v19, v20);
    }
    v21 = [[AVObservationController alloc] initWithOwner:self];
    observationController = self->_observationController;
    self->_observationController = v21;

    v23 = [(AVPictureInPictureController *)self _sbdlPlayerController];
    [v23 setPictureInPictureController:self];

    [(AVPictureInPictureController *)self _startObservationsForContentSource:v28];
    v24 = [(AVPictureInPictureController *)self observationController];
    v25 = [(AVPictureInPictureController *)self platformAdapter];
    id v26 = (id)[v24 startObserving:v25 keyPath:@"anyPictureInPictureActive" includeInitialValue:1 observationHandler:&__block_literal_global_95];

    v27 = [(AVPictureInPictureController *)self observationController];
    [v27 startObservingNotificationForName:@"AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_98_12680];

    [(AVPictureInPictureController *)self contentSourceVideoRectInWindowChanged];
    [(AVPictureInPictureController *)self setAllowsPictureInPicturePlayback:1];

    id v5 = v28;
  }
}

void __49__AVPictureInPictureController_setContentSource___block_invoke_96(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 playerController];
  BOOL v3 = [v4 pipActivitySessionIdentifier];
  [v2 setActivitySessionIdentifier:v3];
}

void __49__AVPictureInPictureController_setContentSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 isPictureInPictureActive])
  {
    [v2 setOtherPictureInPictureActive:0];
  }
  else
  {
    BOOL v3 = [v2 platformAdapter];
    objc_msgSend(v2, "setOtherPictureInPictureActive:", objc_msgSend(v3, "isAnyPictureInPictureActive"));
  }
  id v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v5 = [v2 isOtherPictureInPictureActive];
    id v6 = "NO";
    int v7 = 136315650;
    id v8 = "-[AVPictureInPictureController setContentSource:]_block_invoke";
    id v10 = "owner.isOtherPictureInPictureActive";
    __int16 v9 = 2080;
    if (v5) {
      id v6 = "YES";
    }
    __int16 v11 = 2080;
    __int16 v12 = v6;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v7, 0x20u);
  }
}

- (void)pictureInPicturePlatformAdapterPrepareToStopForDismissal:(id)a3
{
  if ([(AVPictureInPictureController *)self _shouldPauseWhenExitingPictureInPicture])
  {
    id v4 = [(AVPictureInPictureController *)self platformAdapter];
    int v5 = [v4 playerController];
    char v6 = objc_opt_respondsToSelector();

    id v9 = [(AVPictureInPictureController *)self platformAdapter];
    int v7 = [v9 playerController];
    id v8 = v7;
    if (v6) {
      [v7 pauseForAllCoordinatedPlaybackParticipants:0];
    }
    else {
      [v7 setPlaying:0];
    }
  }
}

- (void)pictureInPicturePlatformAdapter:(id)a3 stopPictureInPictureAndRestoreUserInterface:(BOOL)a4
{
}

- (void)pictureInPicturePlatformAdapter:(id)a3 statusDidChange:(int64_t)a4 fromStatus:(int64_t)a5
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v8 = [(AVPictureInPictureController *)self sourceIfRetainedDuringPictureInPicturePlayback];
  id v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v43 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:statusDidChange:fromStatus:]";
    __int16 v44 = 2048;
    v45 = (const char *)a5;
    __int16 v46 = 2048;
    int64_t v47 = a4;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s old: %ld --> new: %ld", buf, 0x20u);
  }

  unint64_t v10 = a4 - 3;
  BOOL v11 = a4 == 4;
  if (a4 != 4 && v10 <= 3)
  {
    BOOL v11 = [(AVPictureInPictureController *)self pictureInPictureWasStartedWhenEnteringBackground];
    if ((((a4 > 0) ^ [(AVPictureInPictureController *)self isPictureInPicturePossible]) & 1) == 0)
    {
LABEL_9:
      if ((a4 == 5) == [(AVPictureInPictureController *)self isPictureInPictureSuspended]) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
LABEL_8:
    [(AVPictureInPictureController *)self setPictureInPicturePossible:a4 > 0];
    __int16 v12 = [(AVPictureInPictureController *)self playerController];
    [v12 setCanTogglePictureInPicture:a4 > 0];

    goto LABEL_9;
  }
  if (((a4 > 0) ^ [(AVPictureInPictureController *)self isPictureInPicturePossible])) {
    goto LABEL_8;
  }
  if (((a4 == 5) ^ [(AVPictureInPictureController *)self isPictureInPictureSuspended])) {
LABEL_10:
  }
    [(AVPictureInPictureController *)self setPictureInPictureSuspended:a4 == 5];
LABEL_11:
  if (v10 <= 3) {
    [(AVPictureInPictureController *)self setOtherPictureInPictureActive:0];
  }
  if (v10 < 4 != [(AVPictureInPictureController *)self isPictureInPictureActive])
  {
    [(AVPictureInPictureController *)self setPictureInPictureActive:v10 < 4];
    uint64_t v13 = [(AVPictureInPictureController *)self playerController];
    [v13 setPictureInPictureActive:v10 < 4];
  }
  if (v10 >= 4)
  {
    uint64_t v14 = [(AVPictureInPictureController *)self platformAdapter];
    -[AVPictureInPictureController setOtherPictureInPictureActive:](self, "setOtherPictureInPictureActive:", [v14 isAnyPictureInPictureActive]);
  }
  if (v11 != [(AVPictureInPictureController *)self pictureInPictureWasStartedWhenEnteringBackground])[(AVPictureInPictureController *)self setPictureInPictureWasStartedWhenEnteringBackground:v11]; {
  BOOL v15 = [(AVPictureInPictureController *)self retainsSourceDuringPictureInPicturePlayback];
  }
  switch(a4)
  {
    case 0:
    case 1:
      BOOL v15 = 0;
      goto LABEL_28;
    case 2:
      v20 = [(AVPictureInPictureController *)self _delegateIfRespondsToSelector:sel_pictureInPictureControllerWillStartPictureInPicture_];
      [v20 pictureInPictureControllerWillStartPictureInPicture:self];

      v40 = @"AVPictureInPictureControllerPlaybackStateIsPlayingKey";
      v21 = NSNumber;
      v22 = [(AVPictureInPictureController *)self playerController];
      v23 = objc_msgSend(v21, "numberWithBool:", objc_msgSend(v22, "isPlaying"));
      v41 = v23;
      v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v41 forKeys:&v40 count:1];

      char v17 = 0;
      v19 = @"AVPictureInPictureControllerWillStartNotification";
      goto LABEL_29;
    case 3:
    case 4:
      if (a5 == 2)
      {
        v16 = [(AVPictureInPictureController *)self _delegateIfRespondsToSelector:sel_pictureInPictureControllerDidStartPictureInPicture_];
        [v16 pictureInPictureControllerDidStartPictureInPicture:self];
      }
      char v17 = 0;
      v18 = 0;
      v19 = @"AVPictureInPictureControllerDidStartNotification";
      goto LABEL_29;
    case 5:
      v24 = [(AVPictureInPictureController *)self sourceIfRetainedDuringPictureInPicturePlayback];
      BOOL v15 = v24 != 0;

      goto LABEL_28;
    case 6:
      v36 = [(AVPictureInPictureController *)self _delegateIfRespondsToSelector:sel_pictureInPictureControllerWillStopPictureInPicture_];
      [v36 pictureInPictureControllerWillStopPictureInPicture:self];

      v37 = [(AVPictureInPictureController *)self sourceIfRetainedDuringPictureInPicturePlayback];
      BOOL v15 = v37 != 0;

      char v17 = 0;
      v18 = 0;
      v19 = @"AVPictureInPictureControllerWillStopNotification";
      goto LABEL_29;
    case 7:
      v38 = [(AVPictureInPictureController *)self _delegateIfRespondsToSelector:sel_pictureInPictureControllerDidStopPictureInPicture_];
      [v38 pictureInPictureControllerDidStopPictureInPicture:self];

      v39 = [(AVPictureInPictureController *)self sourceIfRetainedDuringPictureInPicturePlayback];
      BOOL v15 = v39 != 0;

      char v17 = 0;
      v18 = 0;
      v19 = @"AVPictureInPictureControllerDidStopNotification";
      goto LABEL_29;
    default:
LABEL_28:
      v19 = 0;
      v18 = 0;
      char v17 = 1;
LABEL_29:
      v25 = _AVLog();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        if (v15) {
          id v26 = "YES";
        }
        else {
          id v26 = "NO";
        }
        *(_DWORD *)buf = 136315650;
        v43 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:statusDidChange:fromStatus:]";
        __int16 v44 = 2080;
        v45 = "shouldRetainSource";
        __int16 v46 = 2080;
        int64_t v47 = (int64_t)v26;
        _os_log_impl(&dword_1B05B7000, v25, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
      }

      if (v15)
      {
        v27 = [(AVPictureInPictureController *)self source];
        [(AVPictureInPictureController *)self setSourceIfRetainedDuringPictureInPicturePlayback:v27];
      }
      else
      {
        [(AVPictureInPictureController *)self setSourceIfRetainedDuringPictureInPicturePlayback:0];
      }
      v28 = _AVLog();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        v29 = [(AVPictureInPictureController *)self sourceIfRetainedDuringPictureInPicturePlayback];
        if (v29) {
          v30 = "NO";
        }
        else {
          v30 = "YES";
        }
        *(_DWORD *)buf = 136315650;
        v43 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:statusDidChange:fromStatus:]";
        __int16 v44 = 2080;
        v45 = "self.sourceIfRetainedDuringPictureInPicturePlayback == nil";
        __int16 v46 = 2080;
        int64_t v47 = (int64_t)v30;
        _os_log_impl(&dword_1B05B7000, v28, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
      }
      if ((v17 & 1) == 0)
      {
        v31 = [(AVPictureInPictureController *)self source];

        if (v31)
        {
          v32 = [(AVPictureInPictureController *)self source];
          v33 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v32 forKey:@"AVPictureInPictureControllerContentSourceKey"];
          v34 = v33;
          if (v18) {
            [v33 addEntriesFromDictionary:v18];
          }
          v35 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v35 postNotificationName:v19 object:self userInfo:v34];
        }
      }

      return;
  }
}

- (void)pictureInPicturePlatformAdapter:(id)a3 prepareToStopForRestoringUserInterface:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = (void (**)(id, uint64_t))a4;
  char v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315394;
    BOOL v11 = "-[AVPictureInPictureController pictureInPicturePlatformAdapter:prepareToStopForRestoringUserInterface:]";
    __int16 v12 = 1024;
    int v13 = 681;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v10, 0x12u);
  }

  int v7 = [(AVPictureInPictureController *)self delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    id v9 = [(AVPictureInPictureController *)self delegate];
    [v9 pictureInPictureController:self restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:v5];
  }
  else
  {
    v5[2](v5, 1);
  }
}

- (void)pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState
{
  self->_wantsResourceReduction = 0;
  id v5 = [(AVPictureInPictureController *)self source];
  BOOL v3 = [(AVPictureInPictureController *)self pictureInPictureViewController];
  id v4 = [(AVPictureInPictureController *)self playerController];
  objc_msgSend(v5, "avkit_endReducingResourcesForPictureInPictureViewController:playerController:", v3, v4);
}

- (void)pictureInPicturePlatformAdapterBeginReducingResourcesForEligibleOffScreenState
{
  self->_wantsResourceReduction = 1;
  id v5 = [(AVPictureInPictureController *)self source];
  BOOL v3 = [(AVPictureInPictureController *)self pictureInPictureViewController];
  id v4 = [(AVPictureInPictureController *)self playerController];
  objc_msgSend(v5, "avkit_beginReducingResourcesForPictureInPictureViewController:playerController:", v3, v4);
}

- (void)pictureInPicturePlatformAdapter:(id)a3 handlePlaybackCommand:(int64_t)a4
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  switch(a4)
  {
    case 1:
      int v7 = [(AVPictureInPictureController *)self playerController];
      char v8 = [v7 isPlaying];

      if ((v8 & 1) == 0)
      {
        id v9 = [(AVPictureInPictureController *)self playerController];
        [v9 togglePlaybackEvenWhenInBackground:self];

        int v10 = NSNumber;
        BOOL v11 = [(AVPictureInPictureController *)self playerController];
        __int16 v12 = objc_msgSend(v10, "numberWithBool:", objc_msgSend(v11, "isPlaying"));

        int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v39 = @"AVPictureInPictureControllerPlaybackStateIsPlayingKey";
        v40[0] = v12;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        BOOL v15 = (void **)v40;
        v16 = &v39;
        goto LABEL_6;
      }
      goto LABEL_23;
    case 2:
      char v17 = [(AVPictureInPictureController *)self playerController];
      int v18 = [v17 isPlaying];

      if (v18)
      {
        v19 = [(AVPictureInPictureController *)self playerController];
        [v19 togglePlaybackEvenWhenInBackground:self];

        v20 = NSNumber;
        v21 = [(AVPictureInPictureController *)self playerController];
        __int16 v12 = objc_msgSend(v20, "numberWithBool:", objc_msgSend(v21, "isPlaying"));

        int v13 = [MEMORY[0x1E4F28EB8] defaultCenter];
        v37 = @"AVPictureInPictureControllerPlaybackStateIsPlayingKey";
        v38 = v12;
        uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
        BOOL v15 = &v38;
        v16 = &v37;
LABEL_6:
        v22 = [v14 dictionaryWithObjects:v15 forKeys:v16 count:1];
        [v13 postNotificationName:@"AVPictureInPictureControllerUserPlaybackStateDidChangeNotification" object:self userInfo:v22];

        break;
      }
      goto LABEL_23;
    case 3:
      v23 = [(AVPictureInPictureController *)self playerController];
      -[AVPictureInPictureController setWasPlayingWhenPictureInPictureInterruptionBegan:](self, "setWasPlayingWhenPictureInPictureInterruptionBegan:", [v23 isPlaying]);

      v24 = [(AVPictureInPictureController *)self playerController];
      v25 = v24;
      uint64_t v26 = 1;
      goto LABEL_9;
    case 4:
      v24 = [(AVPictureInPictureController *)self playerController];
      v25 = v24;
      uint64_t v26 = 0;
LABEL_9:
      [v24 setPictureInPictureInterrupted:v26];
      goto LABEL_15;
    case 5:
      v27 = [(AVPictureInPictureController *)self playerController];
      [v27 setPictureInPictureInterrupted:0];

      if ([(AVPictureInPictureController *)self wasPlayingWhenPictureInPictureInterruptionBegan])
      {
        v28 = [(AVPictureInPictureController *)self playerController];
        [v28 setPlaying:1];

        [(AVPictureInPictureController *)self setWasPlayingWhenPictureInPictureInterruptionBegan:0];
      }
      goto LABEL_23;
    case 6:
      v29 = [(AVPictureInPictureController *)self playerController];
      v25 = v29;
      uint64_t v30 = 1;
      goto LABEL_14;
    case 7:
      v29 = [(AVPictureInPictureController *)self playerController];
      v25 = v29;
      uint64_t v30 = 0;
LABEL_14:
      [v29 setMuted:v30];
LABEL_15:

      goto LABEL_23;
    case 8:
      __int16 v12 = [(AVPictureInPictureController *)self playerController];
      [v12 togglePlaybackEvenWhenInBackground:self];
      break;
    case 9:
      __int16 v12 = [(AVPictureInPictureController *)self prerollDelegate];
      [v12 pictureInPictureControllerSkipPreroll:self];
      break;
    case 10:
      v31 = [(AVPictureInPictureController *)self delegate];
      objc_storeWeak((id *)&self->__extendedDelegate, v31);

      v32 = [(AVPictureInPictureController *)self _extendedDelegate];
      char v33 = objc_opt_respondsToSelector();

      if ((v33 & 1) == 0) {
        goto LABEL_23;
      }
      __int16 v12 = [(AVPictureInPictureController *)self _extendedDelegate];
      [v12 pictureInPictureControllerDidSkipBackwardInPictureInPicture:self];
      break;
    case 11:
      v34 = [(AVPictureInPictureController *)self delegate];
      objc_storeWeak((id *)&self->__extendedDelegate, v34);

      v35 = [(AVPictureInPictureController *)self _extendedDelegate];
      char v36 = objc_opt_respondsToSelector();

      if ((v36 & 1) == 0) {
        goto LABEL_23;
      }
      __int16 v12 = [(AVPictureInPictureController *)self _extendedDelegate];
      [v12 pictureInPictureControllerDidSkipForwardInPictureInPicture:self];
      break;
    default:
      goto LABEL_23;
  }

LABEL_23:
}

- (void)pictureInPicturePlatformAdapter:(id)a3 failedToStartError:(id)a4
{
  id v5 = a4;
  id v6 = [(AVPictureInPictureController *)self _delegateIfRespondsToSelector:sel_pictureInPictureController_failedToStartPictureInPictureWithError_];
  [v6 pictureInPictureController:self failedToStartPictureInPictureWithError:v5];
}

- (void)setBackgroundPlaybackPolicy:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    int64_t v3 = 1;
  }
  else {
    int64_t v3 = a3;
  }
  id v4 = [(AVPictureInPictureController *)self platformAdapter];
  [v4 setBackgroundPlaybackPolicy:v3];
}

- (int64_t)backgroundPlaybackPolicy
{
  id v2 = [(AVPictureInPictureController *)self platformAdapter];
  int64_t v3 = [v2 backgroundPlaybackPolicy];

  return v3;
}

- (void)setActivitySessionIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPictureInPictureController *)self platformAdapter];
  [v5 setActivitySessionIdentifier:v4];
}

- (id)activitySessionIdentifier
{
  id v2 = [(AVPictureInPictureController *)self platformAdapter];
  int64_t v3 = [v2 activitySessionIdentifier];

  return v3;
}

- (void)reloadPrerollAttributes
{
  id v5 = [(AVPictureInPictureController *)self prerollDelegate];
  int64_t v3 = [v5 pictureInPictureControllerPrerollAttributes:self];
  id v4 = [(AVPictureInPictureController *)self platformAdapter];
  [v4 setPrerollAttributes:v3];
}

- (id)sampleBufferDisplayLayer
{
  int64_t v3 = [(AVPictureInPictureController *)self source];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [(AVPictureInPictureController *)self source];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)stopObservingPlayerController:(id)a3
{
  id v4 = [(AVPictureInPictureController *)self playerControllerIsPlayingObservationToken];

  if (v4)
  {
    id v5 = [(AVPictureInPictureController *)self observationController];
    id v6 = [(AVPictureInPictureController *)self playerControllerIsPlayingObservationToken];
    [v5 stopObserving:v6];

    [(AVPictureInPictureController *)self setPlayerControllerIsPlayingObservationToken:0];
  }
}

- (void)startObservingPlayerController:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AVPictureInPictureController *)self observationController];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __63__AVPictureInPictureController_startObservingPlayerController___block_invoke;
    v7[3] = &unk_1E5FC30D8;
    id v8 = v4;
    id v6 = [v5 startObserving:self keyPath:@"playerController.playing" includeInitialValue:1 observationHandler:v7];
    [(AVPictureInPictureController *)self setPlayerControllerIsPlayingObservationToken:v6];
  }
}

void __63__AVPictureInPictureController_startObservingPlayerController___block_invoke(uint64_t a1, void *a2)
{
  v11[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 playerController];
  if (v4 != *(void **)(a1 + 32)) {
    goto LABEL_4;
  }
  int v5 = [v3 isPictureInPictureActive];

  if (v5)
  {
    id v6 = NSNumber;
    int v7 = [v3 playerController];
    id v4 = objc_msgSend(v6, "numberWithBool:", objc_msgSend(v7, "isPlaying"));

    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    int v10 = @"AVPictureInPictureControllerPlaybackStateIsPlayingKey";
    v11[0] = v4;
    id v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:&v10 count:1];
    [v8 postNotificationName:@"AVPictureInPictureControllerPlaybackStateDidChangeNotification" object:v3 userInfo:v9];

LABEL_4:
  }
}

- (void)setPlayerController:(id)a3
{
  int v5 = (AVPlayerController *)a3;
  playerController = self->_playerController;
  __int16 v12 = v5;
  if (playerController != v5)
  {
    int v7 = playerController;
    uint64_t v8 = [(AVPlayerController *)v7 isPictureInPictureInterrupted];
    [(AVPictureInPictureController *)self stopObservingPlayerController:v7];
    objc_storeStrong((id *)&self->_playerController, a3);
    [(AVPictureInPictureController *)self startObservingPlayerController:v12];
    if ([(AVPictureInPictureController *)self wantsImmediateAssetInspection]) {
      [(AVPlayerController *)v12 setInspectionSuspended:0];
    }
    [(AVPlayerController *)v12 setAllowsPictureInPicturePlayback:[(AVPictureInPictureController *)self allowsPictureInPicturePlayback]];
    [(AVPlayerController *)v12 setPictureInPictureActive:[(AVPictureInPictureController *)self isPictureInPictureActive]];
    [(AVPlayerController *)v12 setPictureInPictureInterrupted:v8];
    [(AVPlayerController *)v12 setCanTogglePictureInPicture:[(AVPictureInPictureController *)self isPictureInPicturePossible]];
    id v9 = [(AVPictureInPictureController *)self platformAdapter];
    [v9 setPlayerController:v12];

    int v10 = [(AVPictureInPictureController *)self platformAdapter];
    BOOL v11 = [v10 pictureInPictureViewController];
    [v11 setPlayerController:v12];

    [(AVPictureInPictureController *)self _updateBackgroundPlaybackPolicyFromPlayerController];
  }
}

- (void)setPictureInPicturePossible:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  int v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = "NO";
    int v8 = 136315650;
    id v9 = "-[AVPictureInPictureController setPictureInPicturePossible:]";
    BOOL v11 = "pictureInPicturePossible";
    __int16 v10 = 2080;
    if (v3) {
      id v6 = "YES";
    }
    __int16 v12 = 2080;
    int v13 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }

  self->_pictureInPicturePossible = v3;
  int v7 = [(AVPictureInPictureController *)self playerController];
  [v7 setCanTogglePictureInPicture:v3];

  if (!v3)
  {
    if ([(AVPictureInPictureController *)self isPictureInPictureActive]) {
      [(AVPictureInPictureController *)self stopPictureInPicture];
    }
  }
}

- (void)setRequiresLinearPlayback:(BOOL)requiresLinearPlayback
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_requiresLinearPlayback != requiresLinearPlayback)
  {
    BOOL v3 = requiresLinearPlayback;
    self->_requiresLinearPlayback = requiresLinearPlayback;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v8 = 136315650;
      id v9 = "-[AVPictureInPictureController setRequiresLinearPlayback:]";
      BOOL v11 = "requiresLinearPlayback";
      __int16 v10 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v12 = 2080;
      int v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    int v7 = [(AVPictureInPictureController *)self platformAdapter];
    [v7 setRequiresLinearPlayback:v3];
  }
}

- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_canPausePlaybackWhenClosingPictureInPicture != a3)
  {
    BOOL v3 = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v8 = 136315650;
      id v9 = "-[AVPictureInPictureController setCanPausePlaybackWhenClosingPictureInPicture:]";
      BOOL v11 = "canPausePlaybackWhenClosingPictureInPicture";
      __int16 v10 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v12 = 2080;
      int v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    self->_canPausePlaybackWhenClosingPictureInPicture = v3;
    int v7 = [(AVPictureInPictureController *)self platformAdapter];
    [v7 setCanPausePlaybackWhenClosingPictureInPicture:v3];
  }
}

- (void)setCanStartAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_canStartAutomaticallyWhenEnteringBackground != a3)
  {
    BOOL v3 = a3;
    self->_canStartAutomaticallyWhenEnteringBackground = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v8 = 136315650;
      id v9 = "-[AVPictureInPictureController setCanStartAutomaticallyWhenEnteringBackground:]";
      BOOL v11 = "canStartAutomaticallyWhenEnteringBackground";
      __int16 v10 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v12 = 2080;
      int v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    int v7 = [(AVPictureInPictureController *)self platformAdapter];
    [v7 setCanStartAutomaticallyWhenEnteringBackground:v3];
  }
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_microphoneEnabled != a3)
  {
    BOOL v3 = a3;
    self->_microphoneEnabled = a3;
    int v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = "NO";
      int v8 = 136315650;
      id v9 = "-[AVPictureInPictureController setMicrophoneEnabled:]";
      BOOL v11 = "microphoneEnabled";
      __int16 v10 = 2080;
      if (v3) {
        id v6 = "YES";
      }
      __int16 v12 = 2080;
      int v13 = v6;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
    }

    int v7 = [(AVPictureInPictureController *)self platformAdapter];
    [v7 setMicrophoneEnabled:v3];
  }
}

- (void)setControlsStyle:(int64_t)a3
{
  self->_controlsStyle = a3;
  id v4 = [(AVPictureInPictureController *)self platformAdapter];
  [v4 setControlsStyle:a3];
}

- (void)setOtherPictureInPictureActive:(BOOL)a3
{
  self->_otherPictureInPictureActive = a3;
  BOOL v4 = a3 || [(AVPictureInPictureController *)self isPictureInPictureActive];

  [(AVPictureInPictureController *)self _setCanStopPictureInPicture:v4];
}

- (void)setPictureInPictureActive:(BOOL)a3
{
  BOOL v3 = a3;
  self->_pictureInPictureActive = a3;
  int v5 = [(AVPictureInPictureController *)self playerController];
  [v5 setPictureInPictureActive:v3];

  BOOL v6 = v3 || [(AVPictureInPictureController *)self isOtherPictureInPictureActive];

  [(AVPictureInPictureController *)self _setCanStopPictureInPicture:v6];
}

- (void)setAllowsPictureInPictureFromInlineWhenEnteringBackground:(BOOL)a3
{
  if (self->_allowsPictureInPictureFromInlineWhenEnteringBackground != a3)
  {
    BOOL v3 = a3;
    self->_allowsPictureInPictureFromInlineWhenEnteringBackground = a3;
    id v4 = [(AVPictureInPictureController *)self platformAdapter];
    [v4 setAlwaysStartsAutomaticallyWhenEnteringBackground:v3];
  }
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v6 = "NO";
    int v9 = 136315650;
    __int16 v10 = "-[AVPictureInPictureController setAllowsPictureInPicturePlayback:]";
    __int16 v12 = "allowsPictureInPicturePlayback";
    __int16 v11 = 2080;
    if (v3) {
      BOOL v6 = "YES";
    }
    __int16 v13 = 2080;
    uint64_t v14 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v9, 0x20u);
  }

  self->_allowsPictureInPicturePlayback = v3;
  int v7 = [(AVPictureInPictureController *)self platformAdapter];
  [v7 setAllowsPictureInPicturePlayback:v3];

  int v8 = [(AVPictureInPictureController *)self playerController];
  [v8 setAllowsPictureInPicturePlayback:v3];
}

- (AVPictureInPictureViewController)pictureInPictureViewController
{
  id v2 = [(AVPictureInPictureController *)self platformAdapter];
  BOOL v3 = [v2 pictureInPictureViewController];

  return (AVPictureInPictureViewController *)v3;
}

- (AVPlayerLayer)playerLayer
{
  playerLayer = self->_playerLayer;
  if (playerLayer)
  {
    BOOL v3 = playerLayer;
  }
  else
  {
    BOOL v3 = [MEMORY[0x1E4F16650] layer];
  }

  return v3;
}

- (void)_logContentSourceType:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  switch(objc_msgSend(a3, "avkit_contentSourceType"))
  {
    case 0:
      BOOL v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        BOOL v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        id v4 = "%s AVPictureInPictureContentSourceTypePlayerLayer";
        goto LABEL_12;
      }
      break;
    case 1:
      BOOL v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        BOOL v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        id v4 = "%s AVPictureInPictureContentSourceTypeSampleBufferDisplayLayer";
        goto LABEL_12;
      }
      break;
    case 2:
      BOOL v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        BOOL v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        id v4 = "%s AVPictureInPictureContentSourceTypeVideoCall";
        goto LABEL_12;
      }
      break;
    case 3:
      BOOL v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        BOOL v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        id v4 = "%s AVPictureInPictureContentSourceTypeGenericView";
        goto LABEL_12;
      }
      break;
    default:
      BOOL v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        int v5 = 136315138;
        BOOL v6 = "-[AVPictureInPictureController _logContentSourceType:]";
        id v4 = "%s AVPictureInPictureContentSourceTypeUnknown";
LABEL_12:
        _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v5, 0xCu);
      }
      break;
  }
}

- (void)contentSourceVideoRectInWindowChanged
{
  id v2 = [(AVPictureInPictureController *)self platformAdapter];
  [v2 updateLayoutDependentBehaviors];
}

- (void)invalidate
{
  if ([(AVPictureInPictureController *)self isPictureInPictureActive])
  {
    BOOL v3 = [(AVPictureInPictureController *)self platformAdapter];
    [v3 stopPictureInPictureAndRestoreUserInterface:0];
  }
  id v4 = [(AVPictureInPictureController *)self observationController];
  [v4 stopAllObservation];

  [(AVPictureInPictureController *)self setPlayerController:0];
  playerLayer = self->_playerLayer;
  self->_playerLayer = 0;

  objc_storeWeak((id *)&self->_source, 0);
  observationController = self->_observationController;
  self->_observationController = 0;

  platformAdapter = self->_platformAdapter;
  self->_platformAdapter = 0;
}

- (void)stopPictureInPictureEvenWhenInBackground
{
  id v3 = [(AVPictureInPictureController *)self platformAdapter];
  -[AVPictureInPictureController _stopPictureInPictureAndRestoreUserInterface:](self, "_stopPictureInPictureAndRestoreUserInterface:", [v3 canAnimatePictureInPictureTransition]);
}

- (void)stopPictureInPicture
{
  if ([(AVPictureInPictureController *)self isPictureInPictureActive]
    && ([(AVPictureInPictureController *)self platformAdapter],
        id v3 = objc_claimAutoreleasedReturnValue(),
        int v4 = [v3 canAnimatePictureInPictureTransition],
        v3,
        v4))
  {
    id v6 = [(AVPictureInPictureController *)self platformAdapter];
    -[AVPictureInPictureController _stopPictureInPictureAndRestoreUserInterface:](self, "_stopPictureInPictureAndRestoreUserInterface:", [v6 canAnimatePictureInPictureTransition]);
  }
  else
  {
    id v6 = [(AVPictureInPictureController *)self platformAdapter];
    if ([v6 isAnyPictureInPictureActive])
    {
      BOOL v5 = [(AVPictureInPictureController *)self isPictureInPictureActive];

      if (v5) {
        return;
      }
      id v6 = [(AVPictureInPictureController *)self platformAdapter];
      [v6 stopPictureInPictureAndRestoreUserInterface:0];
    }
  }
}

- (void)startPictureInPicture
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVPictureInPictureController *)self platformAdapter];
  uint64_t v4 = [v3 status];

  BOOL v5 = _AVLog();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4 == 1)
  {
    if (v6)
    {
      uint64_t v7 = [(AVPictureInPictureController *)self playerController];
      int v9 = 136315394;
      __int16 v10 = "-[AVPictureInPictureController startPictureInPicture]";
      __int16 v11 = 2114;
      __int16 v12 = v7;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s starting for playerController %{public}@", (uint8_t *)&v9, 0x16u);
    }
    BOOL v5 = [(AVPictureInPictureController *)self platformAdapter];
    [v5 startPictureInPicture];
  }
  else if (v6)
  {
    int v8 = [(AVPictureInPictureController *)self platformAdapter];
    int v9 = 136315394;
    __int16 v10 = "-[AVPictureInPictureController startPictureInPicture]";
    __int16 v11 = 1024;
    LODWORD(v12) = [v8 status];
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s failed; status = %d", (uint8_t *)&v9, 0x12u);
  }
}

- (void)dealloc
{
  id v3 = [(AVPictureInPictureController *)self source];
  uint64_t v4 = [(AVPictureInPictureController *)self platformAdapter];
  BOOL v5 = [v4 pictureInPictureViewController];

  [(AVPictureInPictureController *)self invalidate];
  objc_msgSend(v3, "avkit_stopRoutingVideoToPictureInPictureViewController:", v5);

  v6.receiver = self;
  v6.super_class = (Class)AVPictureInPictureController;
  [(AVPictureInPictureController *)&v6 dealloc];
}

- (void)_commonInitWithSource:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    p_source = &self->_source;
    id v5 = a3;
    objc_storeWeak((id *)p_source, v5);
    [(AVPictureInPictureController *)self _logContentSourceType:v5];
    objc_super v6 = [[AVObservationController alloc] initWithOwner:self];
    observationController = self->_observationController;
    self->_observationController = v6;

    int v8 = [[AVPictureInPicturePlatformAdapter alloc] initWithSource:v5];
    platformAdapter = self->_platformAdapter;
    self->_platformAdapter = v8;

    [(AVPictureInPicturePlatformAdapter *)self->_platformAdapter setBackgroundPlaybackPolicy:1];
    [(AVPictureInPicturePlatformAdapter *)self->_platformAdapter setCanStartAutomaticallyWhenEnteringBackground:1];
    self->_canStartAutomaticallyWhenEnteringBackground = 1;
    self->_canPausePlaybackWhenClosingPictureInPicture = 1;
    -[AVPictureInPicturePlatformAdapter setManagesWiredSecondScreenPlayback:](self->_platformAdapter, "setManagesWiredSecondScreenPlayback:", objc_msgSend(v5, "avkit_wantsManagedSecondScreenPlayback"));
    self->_requiresLinearPlayback = [(AVPictureInPicturePlatformAdapter *)self->_platformAdapter requiresLinearPlayback];
    self->_pictureInPictureActive = 0;
    __int16 v10 = [(AVPictureInPictureController *)self platformAdapter];
    self->_pictureInPicturePossible = [v10 status] > 0;

    __int16 v11 = [(AVPictureInPictureController *)self platformAdapter];
    [v11 setDelegate:self];

    uint64_t v12 = [(AVPictureInPictureController *)self playerController];
    uint64_t v13 = objc_msgSend(v5, "avkit_makePlayerControllerIfNeeded:", v12);

    [(AVPictureInPictureController *)self setPlayerController:v13];
    uint64_t v14 = [(AVPictureInPictureController *)self playerController];
    LOBYTE(v12) = objc_opt_respondsToSelector();

    if (v12)
    {
      uint64_t v15 = [(AVPictureInPictureController *)self playerController];
      [v15 setPictureInPictureController:self];
    }
    v16 = [(AVPictureInPictureController *)self playerController];
    char v17 = objc_opt_respondsToSelector();

    if (v17)
    {
      int v18 = _AVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v19 = [(AVPictureInPictureController *)self contentSource];
        [v19 initialRenderSize];
        v20 = NSStringFromCGSize(v35);
        int v30 = 136315394;
        v31 = "-[AVPictureInPictureController _commonInitWithSource:]";
        __int16 v32 = 2112;
        char v33 = v20;
        _os_log_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_DEFAULT, "%s Has initial render size: %@", (uint8_t *)&v30, 0x16u);
      }
      v21 = [(AVPictureInPictureController *)self _sbdlPlayerController];
      v22 = [(AVPictureInPictureController *)self contentSource];
      [v22 initialRenderSize];
      objc_msgSend(v21, "setEnqueuedBufferDimensions:");
    }
    v23 = [(AVPictureInPictureController *)self observationController];
    v24 = [(AVPictureInPictureController *)self platformAdapter];
    id v25 = (id)[v23 startObserving:v24 keyPath:@"anyPictureInPictureActive" includeInitialValue:1 observationHandler:&__block_literal_global_12737];

    uint64_t v26 = [(AVPictureInPictureController *)self observationController];
    id v27 = (id)[v26 startObserving:self keyPath:@"playerController.contentDimensions" includeInitialValue:0 observationHandler:&__block_literal_global_52_12739];

    v28 = [(AVPictureInPictureController *)self observationController];
    [v28 startObservingNotificationForName:@"AVPlayerControllerPIPActivitySessionIdentifierDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_55_12740];

    v29 = [(AVPictureInPictureController *)self observationController];
    [v29 startObservingNotificationForName:*MEMORY[0x1E4F15FF8] object:0 notificationCenter:0 observationHandler:&__block_literal_global_57];
  }
}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  id v5 = a4;
  objc_super v6 = [v9 playerController];
  uint64_t v7 = [v6 player];
  int v8 = [v5 object];

  if (v7 == v8) {
    [v9 _updateBackgroundPlaybackPolicyFromPlayerController];
  }
}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v4 = [v2 playerController];
  id v3 = [v4 pipActivitySessionIdentifier];
  [v2 setActivitySessionIdentifier:v3];
}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke_50(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v2 = [v5 platformAdapter];
  uint64_t v3 = [v2 status];

  if (!v3)
  {
    id v4 = [v5 platformAdapter];
    [v4 _updateStatus];
  }
}

void __54__AVPictureInPictureController__commonInitWithSource___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 isPictureInPictureActive])
  {
    [v2 setOtherPictureInPictureActive:0];
  }
  else
  {
    uint64_t v3 = [v2 platformAdapter];
    objc_msgSend(v2, "setOtherPictureInPictureActive:", objc_msgSend(v3, "isAnyPictureInPictureActive"));
  }
  id v4 = [v2 platformAdapter];
  objc_msgSend(v2, "_setCanStopPictureInPicture:", objc_msgSend(v4, "isAnyPictureInPictureActive"));

  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = [v2 isOtherPictureInPictureActive];
    uint64_t v7 = "NO";
    int v8 = 136315650;
    id v9 = "-[AVPictureInPictureController _commonInitWithSource:]_block_invoke";
    __int16 v11 = "owner.isOtherPictureInPictureActive";
    __int16 v10 = 2080;
    if (v6) {
      uint64_t v7 = "YES";
    }
    __int16 v12 = 2080;
    uint64_t v13 = v7;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v8, 0x20u);
  }
}

- (AVPictureInPictureController)initWithContentSource:(AVPictureInPictureControllerContentSource *)contentSource
{
  id v5 = contentSource;
  if ([(id)objc_opt_class() isPictureInPictureSupported])
  {
    v13.receiver = self;
    v13.super_class = (Class)AVPictureInPictureController;
    int v6 = [(AVPictureInPictureController *)&v13 init];
    uint64_t v7 = v6;
    if (v6)
    {
      v6->_wantsImmediateAssetInspection = 1;
      objc_storeStrong((id *)&v6->_contentSource, contentSource);
      v7->_allowsPictureInPicturePlayback = 1;
      int v8 = [(AVPictureInPictureControllerContentSource *)v5 source];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        __int16 v10 = [(AVPictureInPictureControllerContentSource *)v5 source];
        [(AVPictureInPictureController *)v7 _commonInitWithSource:v10];

        [(AVPictureInPictureController *)v7 _startObservationsForContentSource:v5];
        [(AVPictureInPictureController *)v7 setAllowsPictureInPicturePlayback:1];
        [(AVPictureInPictureController *)v7 _configureContentSourceForVideoCallsIfNeeded:v5];
        [(AVPictureInPictureController *)v7 _configureContentSourceForGenericViewIfNeeded:v5];
      }
      else
      {
        v7->_pictureInPicturePossible = 0;
      }
    }
  }
  else
  {

    uint64_t v7 = 0;
  }
  __int16 v11 = v7;

  return v11;
}

- (AVPictureInPictureController)initWithSource:(id)a3
{
  id v4 = a3;
  if ([(id)objc_opt_class() isPictureInPictureSupported])
  {
    v8.receiver = self;
    v8.super_class = (Class)AVPictureInPictureController;
    id v5 = [(AVPictureInPictureController *)&v8 init];
    int v6 = v5;
    if (v5) {
      [(AVPictureInPictureController *)v5 _commonInitWithSource:v4];
    }
  }
  else
  {

    int v6 = 0;
  }

  return v6;
}

- (AVPictureInPictureController)initWithPlayerLayer:(AVPlayerLayer *)playerLayer
{
  id v4 = playerLayer;
  id v5 = [[AVPictureInPictureControllerContentSource alloc] initWithPlayerLayer:v4];
  if (![(id)objc_opt_class() isPictureInPictureSupported])
  {
    int v6 = 0;
    goto LABEL_5;
  }
  int v6 = [(AVPictureInPictureController *)self initWithContentSource:v5];
  if (v6)
  {
    uint64_t v7 = v4;
    self = (AVPictureInPictureController *)v6->_playerLayer;
    v6->_playerLayer = v7;
LABEL_5:
  }
  return v6;
}

- (AVPictureInPictureController)init
{
  uint64_t v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3A8];
  id v5 = _AVMethodProem(self);
  int v6 = (objc_class *)objc_opt_class();
  uint64_t v7 = NSStringFromClass(v6);
  [v3 raise:v4, @"%@ is not a valid initializer. You must call -[%@ initWithPlayerLayer:].", v5, v7 format];

  objc_super v8 = [MEMORY[0x1E4F16650] layer];
  char v9 = [(AVPictureInPictureController *)self initWithPlayerLayer:v8];

  return v9;
}

+ (UIImage)pictureInPictureButtonStopImage
{
  return (UIImage *)[a1 pictureInPictureButtonStopImageCompatibleWithTraitCollection:0];
}

+ (UIImage)pictureInPictureButtonStartImage
{
  return (UIImage *)[a1 pictureInPictureButtonStartImageCompatibleWithTraitCollection:0];
}

+ (UIImage)pictureInPictureButtonStopImageCompatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  uint64_t v4 = traitCollection;
  id v5 = +[AVPictureInPicturePlatformAdapter stopPictureInPictureButtonImageName];
  int v6 = [a1 _imageNamed:v5 compatibileWithTraitCollection:v4];

  return (UIImage *)v6;
}

+ (UIImage)pictureInPictureButtonStartImageCompatibleWithTraitCollection:(UITraitCollection *)traitCollection
{
  uint64_t v4 = traitCollection;
  id v5 = +[AVPictureInPicturePlatformAdapter startPictureInPictureButtonImageName];
  int v6 = [a1 _imageNamed:v5 compatibileWithTraitCollection:v4];

  return (UIImage *)v6;
}

+ (id)_imageNamed:(id)a3 compatibileWithTraitCollection:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = +[AVPictureInPicturePlatformAdapter imageSymbolConfiguration];
  objc_super v8 = [v7 configurationByApplyingConfiguration:v7];
  char v9 = (void *)MEMORY[0x1E4FB1818];
  if (v7)
  {
    __int16 v10 = [MEMORY[0x1E4FB1818] systemImageNamed:v5 withConfiguration:v8];
  }
  else
  {
    __int16 v11 = AVBundle();
    __int16 v10 = [v9 imageNamed:v5 inBundle:v11 compatibleWithTraitCollection:v6];
  }

  return v10;
}

@end