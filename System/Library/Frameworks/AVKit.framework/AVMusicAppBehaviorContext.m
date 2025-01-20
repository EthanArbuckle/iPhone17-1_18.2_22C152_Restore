@interface AVMusicAppBehaviorContext
- (AVMusicAppBehavior)behavior;
- (AVMusicAppBehaviorContext)initWithAVKitOwner:(id)a3;
- (AVObservationController)observationController;
- (AVPlayerController)playerController;
- (AVPlayerViewController)playerViewController;
- (BOOL)isScrubbing;
- (BOOL)isSkipToNextItemButtonEnabled;
- (BOOL)isSkipToPreviousItemButtonEnabled;
- (BOOL)showsSkipItemButtons;
- (NSNumber)seekTargetTime;
- (void)_updatePlaybackControlsInclusion;
- (void)_updateSkipItemButtonsEnabled;
- (void)dealloc;
- (void)didAddBehavior:(id)a3;
- (void)didRemoveBehavior:(id)a3;
- (void)playerViewController:(id)a3 didCollectMetricsEvent:(int64_t)a4;
- (void)setBehavior:(id)a3;
- (void)setPlayerController:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setSeekTargetTime:(id)a3;
- (void)setShowsSkipItemButtons:(BOOL)a3;
- (void)setSkipToNextItemButtonEnabled:(BOOL)a3;
- (void)setSkipToPreviousItemButtonEnabled:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation AVMusicAppBehaviorContext

- (void)setSkipToPreviousItemButtonEnabled:(BOOL)a3
{
  self->_skipToPreviousItemButtonEnabled = a3;
  [(AVMusicAppBehaviorContext *)self _updateSkipItemButtonsEnabled];
}

- (void)setSkipToNextItemButtonEnabled:(BOOL)a3
{
  self->_skipToNextItemButtonEnabled = a3;
  [(AVMusicAppBehaviorContext *)self _updateSkipItemButtonsEnabled];
}

- (void)setShowsSkipItemButtons:(BOOL)a3
{
  self->_showsSkipItemButtons = a3;
  [(AVMusicAppBehaviorContext *)self _updateSkipItemButtonsEnabled];
}

- (void)didAddBehavior:(id)a3
{
  v27[2] = *MEMORY[0x1E4F143B8];
  v4 = [(AVMusicAppBehaviorContext *)self playerViewController];
  v5 = [v4 playerController];
  [(AVMusicAppBehaviorContext *)self setPlayerController:v5];

  v6 = [(AVMusicAppBehaviorContext *)self playerViewController];
  [v6 setCanPausePlaybackWhenClosingPictureInPicture:0];

  [(AVMusicAppBehaviorContext *)self _updatePlaybackControlsInclusion];
  v7 = [(AVMusicAppBehaviorContext *)self observationController];
  v8 = [(AVMusicAppBehaviorContext *)self playerViewController];
  [v7 startObservingNotificationForName:@"AVPlayerViewControllerDidChangePlayerControllerNotification" object:v8 notificationCenter:0 observationHandler:&__block_literal_global_5091];

  v9 = [(AVMusicAppBehaviorContext *)self observationController];
  id v10 = (id)[v9 startObserving:self keyPath:@"playerController.scrubbing" includeInitialValue:0 observationHandler:&__block_literal_global_20];

  v11 = [(AVMusicAppBehaviorContext *)self observationController];
  id v12 = (id)[v11 startObserving:self keyPath:@"playerController.player.currentItem" includeInitialValue:1 observationHandler:&__block_literal_global_25];

  v13 = [(AVMusicAppBehaviorContext *)self observationController];
  v27[0] = @"playerController.seekToTime";
  v27[1] = @"playerController.seeking";
  v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v15 = (id)[v13 startObserving:self keyPaths:v14 includeInitialValue:0 observationHandler:&__block_literal_global_34];

  v16 = [(AVMusicAppBehaviorContext *)self observationController];
  v17 = [(AVMusicAppBehaviorContext *)self playerController];
  [v16 startObservingNotificationForName:@"AVPlayerControllerDidBeginScanningNotification" object:v17 notificationCenter:0 observationHandler:&__block_literal_global_37_5097];

  v18 = [(AVMusicAppBehaviorContext *)self observationController];
  v19 = [(AVMusicAppBehaviorContext *)self playerController];
  [v18 startObservingNotificationForName:@"AVPlayerControllerDidEndScanningNotification" object:v19 notificationCenter:0 observationHandler:&__block_literal_global_39];

  v20 = [(AVMusicAppBehaviorContext *)self observationController];
  v21 = [(AVMusicAppBehaviorContext *)self playerViewController];
  [v20 startObservingNotificationForName:@"AVPlayerViewControllerDidEnterFullScreenFromInline" object:v21 notificationCenter:0 observationHandler:&__block_literal_global_41];

  v22 = [(AVMusicAppBehaviorContext *)self observationController];
  v23 = [(AVMusicAppBehaviorContext *)self playerViewController];
  [v22 startObservingNotificationForName:@"AVPlayerViewControllerDidExitFullScreenFromInline" object:v23 notificationCenter:0 observationHandler:&__block_literal_global_43];

  v24 = [(AVMusicAppBehaviorContext *)self observationController];
  [v24 startObservingNotificationForName:@"AVPictureInPictureControllerUserPlaybackStateDidChangeNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_45];

  v25 = [(AVMusicAppBehaviorContext *)self observationController];
  [v25 startObservingNotificationForName:@"AVPictureInPictureControllerWillStartNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_47_5098];

  v26 = [(AVMusicAppBehaviorContext *)self observationController];
  [v26 startObservingNotificationForName:@"AVPictureInPictureControllerWillStopNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_49_5099];
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v4 = a3;
  id v5 = [v9 playerViewController];

  if (v5 == v4)
  {
    v6 = [v9 playerController];
    v7 = [v6 player];
    v8 = [v7 currentItem];
    objc_msgSend(v8, "avkit_setMusicBehaviorData:", v9);
  }
}

- (void)setPlayerController:(id)a3
{
}

- (void)setBehavior:(id)a3
{
}

- (AVMusicAppBehaviorContext)initWithAVKitOwner:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVMusicAppBehaviorContext;
  id v5 = [(AVMusicAppBehaviorContext *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_playerViewController, v4);
    v7 = [[AVObservationController alloc] initWithOwner:v6];
    observationController = v6->_observationController;
    v6->_observationController = v7;

    v6->_showsSkipItemButtons = 1;
  }

  return v6;
}

- (void)_updatePlaybackControlsInclusion
{
  v3 = [(AVMusicAppBehaviorContext *)self playerViewController];
  uint64_t v4 = [v3 isPresentingFullScreenFromInline];
  if (v4)
  {
    uint64_t v5 = 1;
  }
  else
  {
    v6 = [(AVMusicAppBehaviorContext *)self playerViewController];
    char v7 = [v6 isPresentedFullScreen];

    if (v7)
    {
      uint64_t v5 = 1;
      uint64_t v4 = 1;
      goto LABEL_7;
    }
    v3 = [(AVMusicAppBehaviorContext *)self playerViewController];
    uint64_t v5 = [v3 isPictureInPictureActive] ^ 1;
  }

LABEL_7:
  v8 = [(AVMusicAppBehaviorContext *)self playerViewController];
  id v9 = [v8 playbackControlsController];
  [v9 setPlaybackControlsIncludeVolumeControls:v4];

  objc_super v10 = [(AVMusicAppBehaviorContext *)self playerViewController];
  v11 = [v10 playbackControlsController];
  [v11 setPlaybackControlsIncludeTransportControls:v4];

  id v13 = [(AVMusicAppBehaviorContext *)self playerViewController];
  id v12 = [v13 playbackControlsController];
  [v12 setPlaybackControlsIncludeDisplayModeControls:v5];
}

- (AVPlayerViewController)playerViewController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_playerViewController);

  return (AVPlayerViewController *)WeakRetained;
}

- (void)_updateSkipItemButtonsEnabled
{
  v3 = [(AVMusicAppBehaviorContext *)self playerViewController];
  uint64_t v4 = [v3 playbackControlsController];
  uint64_t v5 = [v3 view];
  uint64_t v6 = [v5 effectiveUserInterfaceLayoutDirection];

  if (v6)
  {
    BOOL v7 = [(AVMusicAppBehaviorContext *)self isSkipToNextItemButtonEnabled];
    BOOL v8 = [(AVMusicAppBehaviorContext *)self isSkipToPreviousItemButtonEnabled];
  }
  else
  {
    BOOL v7 = [(AVMusicAppBehaviorContext *)self isSkipToPreviousItemButtonEnabled];
    BOOL v8 = [(AVMusicAppBehaviorContext *)self isSkipToNextItemButtonEnabled];
  }
  BOOL v9 = v8;
  [v4 setStartLeftwardContentTransitionButtonEnabled:v7];
  [v4 setStartRightwardContentTransitionButtonEnabled:v9];
  objc_msgSend(v4, "setPlaybackControlsIncludeStartContentTransitionButtons:", -[AVMusicAppBehaviorContext showsSkipItemButtons](self, "showsSkipItemButtons"));
  if ([(AVMusicAppBehaviorContext *)self showsSkipItemButtons] && (v7 || v9))
  {
    objc_super v10 = [v3 controlsViewController];
    [v10 setSecondaryPlaybackControlsType:1];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);
    [v10 addAction:sel_skipToNextItem withTarget:WeakRetained forEvent:@"AVChromelessControlsSkipForwardPressedEvent"];

    id v12 = objc_loadWeakRetained((id *)&self->_behavior);
    [v10 addAction:sel_skipToPreviousItem withTarget:v12 forEvent:@"AVChromelessControlsSkipBackwardPressedEvent"];

    objc_initWeak(&location, self);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __58__AVMusicAppBehaviorContext__updateSkipItemButtonsEnabled__block_invoke;
    v13[3] = &unk_1E5FC3998;
    objc_copyWeak(&v14, &location);
    [v4 setContentTransitionAction:v13];
    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
  else
  {
    [v4 setContentTransitionAction:0];
  }
}

- (BOOL)showsSkipItemButtons
{
  return self->_showsSkipItemButtons;
}

- (BOOL)isSkipToPreviousItemButtonEnabled
{
  return self->_skipToPreviousItemButtonEnabled;
}

- (BOOL)isSkipToNextItemButtonEnabled
{
  return self->_skipToNextItemButtonEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_storeStrong((id *)&self->_seekTargetTime, 0);
  objc_destroyWeak((id *)&self->_behavior);

  objc_destroyWeak((id *)&self->_playerViewController);
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (void)setSeekTargetTime:(id)a3
{
}

- (NSNumber)seekTargetTime
{
  return self->_seekTargetTime;
}

- (AVMusicAppBehavior)behavior
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_behavior);

  return (AVMusicAppBehavior *)WeakRetained;
}

void __58__AVMusicAppBehaviorContext__updateSkipItemButtonsEnabled__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == 2)
    {
      id v5 = WeakRetained;
      uint64_t v4 = [WeakRetained behavior];
      [v4 skipToPreviousItem];
    }
    else
    {
      if (a2 != 1) {
        goto LABEL_7;
      }
      id v5 = WeakRetained;
      uint64_t v4 = [WeakRetained behavior];
      [v4 skipToNextItem];
    }

    id WeakRetained = v5;
  }
LABEL_7:
}

- (void)playerViewController:(id)a3 didCollectMetricsEvent:(int64_t)a4
{
  id v6 = a3;
  id v10 = v6;
  switch(a4)
  {
    case 0:
      BOOL v7 = [(AVMusicAppBehaviorContext *)self behavior];
      BOOL v8 = v7;
      uint64_t v9 = 1;
      goto LABEL_6;
    case 1:
      BOOL v7 = [(AVMusicAppBehaviorContext *)self behavior];
      BOOL v8 = v7;
      uint64_t v9 = 0;
      goto LABEL_6;
    case 2:
      BOOL v7 = [(AVMusicAppBehaviorContext *)self behavior];
      BOOL v8 = v7;
      uint64_t v9 = 2;
      goto LABEL_6;
    case 3:
      BOOL v7 = [(AVMusicAppBehaviorContext *)self behavior];
      BOOL v8 = v7;
      uint64_t v9 = 3;
LABEL_6:
      [v7 contextWillHandleUserAction:v9];

      id v6 = v10;
      break;
    default:
      break;
  }
}

- (void)viewDidLoad
{
  [(AVMusicAppBehaviorContext *)self _updateSkipItemButtonsEnabled];

  [(AVMusicAppBehaviorContext *)self _updatePlaybackControlsInclusion];
}

- (void)didRemoveBehavior:(id)a3
{
  id v3 = [(AVMusicAppBehaviorContext *)self observationController];
  [v3 stopAllObservation];
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_11(uint64_t a1, void *a2)
{
  return [a2 _updatePlaybackControlsInclusion];
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_10(uint64_t a1, void *a2)
{
  return [a2 _updatePlaybackControlsInclusion];
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v9 = [a4 userInfo];
  id v6 = [v9 objectForKeyedSubscript:@"AVPictureInPictureControllerPlaybackStateIsPlayingKey"];
  unsigned int v7 = [v6 BOOLValue];

  BOOL v8 = [v5 behavior];

  [v8 contextWillHandleUserAction:v7];
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_8(uint64_t a1, void *a2)
{
  return [a2 _updatePlaybackControlsInclusion];
}

uint64_t __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_7(uint64_t a1, void *a2)
{
  return [a2 _updatePlaybackControlsInclusion];
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = [a4 userInfo];
  unsigned int v7 = [v6 objectForKeyedSubscript:@"AVPlayerControllerScanningDirectionKey"];
  uint64_t v8 = [v7 integerValue];

  if (v8 <= 0) {
    uint64_t v9 = 13;
  }
  else {
    uint64_t v9 = 11;
  }
  id v10 = [v5 behavior];

  [v10 contextWillHandleUserAction:v9];
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5 = a2;
  id v6 = [a4 userInfo];
  unsigned int v7 = [v6 objectForKeyedSubscript:@"AVPlayerControllerScanningDirectionKey"];
  uint64_t v8 = [v7 integerValue];

  if (v8 <= 0) {
    uint64_t v9 = 12;
  }
  else {
    uint64_t v9 = 10;
  }
  id v10 = [v5 behavior];

  [v10 contextWillHandleUserAction:v9];
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v20 = a2;
  id v5 = a4;
  id v6 = [v20 playerController];
  int v7 = [v6 isSeeking];

  if (v7)
  {
    uint64_t v8 = NSNumber;
    uint64_t v9 = [v20 playerController];
    [v9 seekToTime];
    id v10 = objc_msgSend(v8, "numberWithDouble:");
    [v20 setSeekTargetTime:v10];
  }
  v11 = [v5 keyPath];
  if ([v11 isEqualToString:@"playerController.seeking"])
  {
    id v12 = [v20 playerController];
    id v13 = [v12 player];
    id v14 = [v13 currentItem];

    id v15 = v20;
    if (!v14) {
      goto LABEL_10;
    }
    v11 = [v20 behavior];
    v16 = [v20 playerController];
    if ([v16 isSeeking]) {
      uint64_t v17 = 6;
    }
    else {
      uint64_t v17 = 7;
    }
    [v11 contextWillHandleUserAction:v17];
  }
  id v15 = v20;
LABEL_10:
  v18 = [v15 playerController];
  char v19 = [v18 isSeeking];

  if ((v19 & 1) == 0) {
    [v20 setSeekTargetTime:0];
  }
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = [v2 behavior];
  uint64_t v4 = [v2 playerViewController];
  id v5 = [v4 playerController];
  if ([v5 isScrubbing]) {
    uint64_t v6 = 4;
  }
  else {
    uint64_t v6 = 5;
  }
  [v3 contextWillHandleUserAction:v6];

  id v7 = [v2 playerController];
  objc_msgSend(v2, "setScrubbing:", objc_msgSend(v7, "isScrubbing"));
}

void __44__AVMusicAppBehaviorContext_didAddBehavior___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v4 = a3;
  id v5 = [v8 playerViewController];

  if (v5 == v4)
  {
    uint64_t v6 = [v8 playerViewController];
    id v7 = [v6 playerController];
    [v8 setPlayerController:v7];
  }
}

- (void)dealloc
{
  id v3 = [(AVMusicAppBehaviorContext *)self observationController];
  [v3 stopAllObservation];

  v4.receiver = self;
  v4.super_class = (Class)AVMusicAppBehaviorContext;
  [(AVMusicAppBehaviorContext *)&v4 dealloc];
}

@end