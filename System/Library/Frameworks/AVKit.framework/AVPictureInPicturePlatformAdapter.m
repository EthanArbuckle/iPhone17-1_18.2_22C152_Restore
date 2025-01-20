@interface AVPictureInPicturePlatformAdapter
+ (BOOL)isPictureInPictureSupported;
+ (NSString)startPictureInPictureButtonImageName;
+ (NSString)stopPictureInPictureButtonImageName;
+ (UIImageSymbolConfiguration)imageSymbolConfiguration;
- (AVObservationController)observationController;
- (AVPictureInPictureContentSource)contentSourceAwaitingInvalidation;
- (AVPictureInPictureContentSource)contentSourceAwaitingSetup;
- (AVPictureInPictureContentSource)source;
- (AVPictureInPicturePlatformAdapter)initWithSource:(id)a3;
- (AVPictureInPicturePlatformAdapterDelegate)delegate;
- (AVPictureInPicturePrerollAttributes)prerollAttributes;
- (AVPictureInPictureViewController)pictureInPictureViewController;
- (AVPlayerController)playerController;
- (AVSecondScreenConnection)secondScreenConnection;
- (BOOL)_isFullScreen;
- (BOOL)allowsPictureInPicturePlayback;
- (BOOL)alwaysStartsAutomaticallyWhenEnteringBackground;
- (BOOL)canAnimatePictureInPictureTransition;
- (BOOL)canPausePlaybackWhenClosingPictureInPicture;
- (BOOL)canStartAutomaticallyWhenEnteringBackground;
- (BOOL)isAnyPictureInPictureActive;
- (BOOL)isContentSourceSupported;
- (BOOL)isInterruptedForAudioSession;
- (BOOL)isMicrophoneEnabled;
- (BOOL)isRoutingVideoToHostedWindow;
- (BOOL)isScrubbing;
- (BOOL)isScrubbingOrSeeking;
- (BOOL)isSeeking;
- (BOOL)isSystemPictureInPicturePossible;
- (BOOL)managesWiredSecondScreenPlayback;
- (BOOL)pictureInPictureProxyCanIssueOptionalCommand:(id)a3;
- (BOOL)requiresLinearPlayback;
- (BOOL)wasPlayingWhenSuspended;
- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3;
- (CGRect)videoRectInScreen;
- (NSString)activitySessionIdentifier;
- (NSTimer)layoutCheckTimer;
- (PGPictureInPictureProxy)pegasusProxy;
- (UIWindow)sourceWindowWhenPictureInPictureStarted;
- (double)rateWhenScrubbingOrSeekingBegan;
- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3;
- (int64_t)_proxyControlsStyle;
- (int64_t)backgroundPlaybackPolicy;
- (int64_t)controlsStyle;
- (int64_t)observedTimeControlStatus;
- (int64_t)pictureInPictureProxyInterfaceOrientationForTransitionAnimation:(id)a3;
- (int64_t)status;
- (uint64_t)_sceneActivationState;
- (void)_createProxyIfNeeded;
- (void)_removeSecondScreenConnection;
- (void)_setRoutingVideoToHostedWindow:(BOOL)a3 pictureInPictureViewController:(id)a4 source:(id)a5;
- (void)_setStatusAndNotifyDelegateIfNeeded:(int64_t)a3;
- (void)_setupPipAdapter;
- (void)_startObservation;
- (void)_startObservingForPlaybackStateUpdates;
- (void)_updatePictureInPictureShouldStartWhenEnteringBackground;
- (void)_updateProxyPlaybackState;
- (void)_updateStatus;
- (void)_updateStatusUsingProposedStatus:(int64_t)a3;
- (void)_updateTimeResolver;
- (void)_updateVideoRectInScreenIfNeeded;
- (void)dealloc;
- (void)pictureInPictureProxy:(id)a3 didReceivePlaybackCommand:(id)a4;
- (void)pictureInPictureProxy:(id)a3 didReceiveTestingCommand:(id)a4;
- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4;
- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5;
- (void)pictureInPictureProxy:(id)a3 didUpdateResourcesUsageReductionReasons:(unint64_t)a4 oldReasons:(unint64_t)a5;
- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5;
- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4;
- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4;
- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5;
- (void)pictureInPictureProxyPictureInPictureInterruptionBegan:(id)a3;
- (void)pictureInPictureProxyPictureInPictureInterruptionEnded:(id)a3;
- (void)pictureInPictureViewControllerViewDidAppear:(id)a3;
- (void)pictureInPictureViewControllerViewWillDisappear:(id)a3;
- (void)setActivitySessionIdentifier:(id)a3;
- (void)setAllowsPictureInPicturePlayback:(BOOL)a3;
- (void)setAlwaysStartsAutomaticallyWhenEnteringBackground:(BOOL)a3;
- (void)setBackgroundPlaybackPolicy:(int64_t)a3;
- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3;
- (void)setCanStartAutomaticallyWhenEnteringBackground:(BOOL)a3;
- (void)setContentSourceAwaitingInvalidation:(id)a3;
- (void)setContentSourceAwaitingSetup:(id)a3;
- (void)setControlsStyle:(int64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setInterruptedForAudioSession:(BOOL)a3;
- (void)setManagesWiredSecondScreenPlayback:(BOOL)a3;
- (void)setMicrophoneEnabled:(BOOL)a3;
- (void)setObservedTimeControlStatus:(int64_t)a3;
- (void)setPlayerController:(id)a3;
- (void)setPrerollAttributes:(id)a3;
- (void)setRateWhenScrubbingOrSeekingBegan:(double)a3;
- (void)setRequiresLinearPlayback:(BOOL)a3;
- (void)setRoutingVideoToHostedWindow:(BOOL)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setScrubbingOrSeeking:(BOOL)a3;
- (void)setSecondScreenConnection:(id)a3;
- (void)setSeeking:(BOOL)a3;
- (void)setSource:(id)a3;
- (void)setSourceWindowWhenPictureInPictureStarted:(id)a3;
- (void)setStatus:(int64_t)a3;
- (void)setVideoRectInScreen:(CGRect)a3;
- (void)setWasPlayingWhenSuspended:(BOOL)a3;
- (void)startPictureInPicture;
- (void)stopPictureInPictureAndRestoreUserInterface:(BOOL)a3;
- (void)updateLayoutDependentBehaviors;
@end

@implementation AVPictureInPicturePlatformAdapter

void __64__AVPictureInPicturePlatformAdapter_isPictureInPictureSupported__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  isPictureInPictureSupported_isPictureInPictureSupported = [MEMORY[0x1E4F88570] isPictureInPictureSupported];
  v0 = _AVLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v1 = "YES";
    int v2 = 136315650;
    v3 = "+[AVPictureInPicturePlatformAdapter isPictureInPictureSupported]_block_invoke";
    v5 = "isPictureInPictureSupported";
    __int16 v4 = 2080;
    if (!isPictureInPictureSupported_isPictureInPictureSupported) {
      v1 = "NO";
    }
    __int16 v6 = 2080;
    v7 = v1;
    _os_log_impl(&dword_1B05B7000, v0, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v2, 0x20u);
  }
}

+ (BOOL)isPictureInPictureSupported
{
  if (isPictureInPictureSupported_onceToken != -1) {
    dispatch_once(&isPictureInPictureSupported_onceToken, &__block_literal_global_865);
  }
  return isPictureInPictureSupported_isPictureInPictureSupported;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observationController, 0);
  objc_destroyWeak((id *)&self->_source);
  objc_destroyWeak((id *)&self->_contentSourceAwaitingSetup);
  objc_destroyWeak((id *)&self->_contentSourceAwaitingInvalidation);
  objc_destroyWeak((id *)&self->_sourceWindowWhenPictureInPictureStarted);
  objc_storeStrong((id *)&self->_secondScreenConnection, 0);
  objc_storeStrong((id *)&self->_layoutCheckTimer, 0);
  objc_storeStrong((id *)&self->_pegasusProxy, 0);
  objc_storeStrong((id *)&self->_pictureInPictureViewController, 0);
  objc_storeStrong((id *)&self->_activitySessionIdentifier, 0);
  objc_storeStrong((id *)&self->_prerollAttributes, 0);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_timeResolver, 0);
}

- (BOOL)isRoutingVideoToHostedWindow
{
  return self->_routingVideoToHostedWindow;
}

- (AVObservationController)observationController
{
  return self->_observationController;
}

- (AVPictureInPictureContentSource)source
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);

  return (AVPictureInPictureContentSource *)WeakRetained;
}

- (BOOL)wasPlayingWhenSuspended
{
  return self->_wasPlayingWhenSuspended;
}

- (BOOL)isInterruptedForAudioSession
{
  return self->_interruptedForAudioSession;
}

- (void)setRateWhenScrubbingOrSeekingBegan:(double)a3
{
  self->_rateWhenScrubbingOrSeekingBegan = a3;
}

- (double)rateWhenScrubbingOrSeekingBegan
{
  return self->_rateWhenScrubbingOrSeekingBegan;
}

- (BOOL)isSeeking
{
  return self->_seeking;
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (BOOL)isScrubbingOrSeeking
{
  return self->_scrubbingOrSeeking;
}

- (int64_t)observedTimeControlStatus
{
  return self->_observedTimeControlStatus;
}

- (void)setContentSourceAwaitingSetup:(id)a3
{
}

- (AVPictureInPictureContentSource)contentSourceAwaitingSetup
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentSourceAwaitingSetup);

  return (AVPictureInPictureContentSource *)WeakRetained;
}

- (void)setContentSourceAwaitingInvalidation:(id)a3
{
}

- (AVPictureInPictureContentSource)contentSourceAwaitingInvalidation
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_contentSourceAwaitingInvalidation);

  return (AVPictureInPictureContentSource *)WeakRetained;
}

- (void)setSourceWindowWhenPictureInPictureStarted:(id)a3
{
}

- (UIWindow)sourceWindowWhenPictureInPictureStarted
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_sourceWindowWhenPictureInPictureStarted);

  return (UIWindow *)WeakRetained;
}

- (void)setSecondScreenConnection:(id)a3
{
}

- (AVSecondScreenConnection)secondScreenConnection
{
  return self->_secondScreenConnection;
}

- (NSTimer)layoutCheckTimer
{
  return self->_layoutCheckTimer;
}

- (void)setVideoRectInScreen:(CGRect)a3
{
  self->_videoRectInScreen = a3;
}

- (CGRect)videoRectInScreen
{
  double x = self->_videoRectInScreen.origin.x;
  double y = self->_videoRectInScreen.origin.y;
  double width = self->_videoRectInScreen.size.width;
  double height = self->_videoRectInScreen.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (PGPictureInPictureProxy)pegasusProxy
{
  return self->_pegasusProxy;
}

- (int64_t)status
{
  return self->_status;
}

- (BOOL)isAnyPictureInPictureActive
{
  return self->_anyPictureInPictureActive;
}

- (AVPictureInPictureViewController)pictureInPictureViewController
{
  return self->_pictureInPictureViewController;
}

- (int64_t)backgroundPlaybackPolicy
{
  return self->_backgroundPlaybackPolicy;
}

- (NSString)activitySessionIdentifier
{
  return self->_activitySessionIdentifier;
}

- (void)setManagesWiredSecondScreenPlayback:(BOOL)a3
{
  self->_managesWiredSecondScreenPlayback = a3;
}

- (BOOL)managesWiredSecondScreenPlayback
{
  return self->_managesWiredSecondScreenPlayback;
}

- (AVPictureInPicturePrerollAttributes)prerollAttributes
{
  return self->_prerollAttributes;
}

- (BOOL)isMicrophoneEnabled
{
  return self->_microphoneEnabled;
}

- (int64_t)controlsStyle
{
  return self->_controlsStyle;
}

- (BOOL)requiresLinearPlayback
{
  return self->_requiresLinearPlayback;
}

- (void)setCanPausePlaybackWhenClosingPictureInPicture:(BOOL)a3
{
  self->_canPausePlaybackWhenClosingPictureInPicture = a3;
}

- (BOOL)canPausePlaybackWhenClosingPictureInPicture
{
  return self->_canPausePlaybackWhenClosingPictureInPicture;
}

- (BOOL)canStartAutomaticallyWhenEnteringBackground
{
  return self->_canStartAutomaticallyWhenEnteringBackground;
}

- (BOOL)alwaysStartsAutomaticallyWhenEnteringBackground
{
  return self->_alwaysStartsAutomaticallyWhenEnteringBackground;
}

- (BOOL)allowsPictureInPicturePlayback
{
  return self->_allowsPictureInPicturePlayback;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setDelegate:(id)a3
{
}

- (AVPictureInPicturePlatformAdapterDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVPictureInPicturePlatformAdapterDelegate *)WeakRetained;
}

- (void)_setupPipAdapter
{
  [(AVPictureInPicturePlatformAdapter *)self _updateStatus];

  [(AVPictureInPicturePlatformAdapter *)self _createProxyIfNeeded];
}

- (void)setSeeking:(BOOL)a3
{
  self->_seeking = a3;
  BOOL v4 = [(AVPictureInPicturePlatformAdapter *)self isSeeking]
    || [(AVPictureInPicturePlatformAdapter *)self isScrubbing];

  [(AVPictureInPicturePlatformAdapter *)self setScrubbingOrSeeking:v4];
}

- (void)setScrubbing:(BOOL)a3
{
  self->_scrubbing = a3;
  BOOL v4 = [(AVPictureInPicturePlatformAdapter *)self isSeeking]
    || [(AVPictureInPicturePlatformAdapter *)self isScrubbing];

  [(AVPictureInPicturePlatformAdapter *)self setScrubbingOrSeeking:v4];
}

- (void)setScrubbingOrSeeking:(BOOL)a3
{
  if (self->_scrubbingOrSeeking != a3)
  {
    self->_scrubbingOrSeeking = a3;
    if (a3)
    {
      id v4 = [(AVPictureInPicturePlatformAdapter *)self playerController];
      [v4 rate];
      -[AVPictureInPicturePlatformAdapter setRateWhenScrubbingOrSeekingBegan:](self, "setRateWhenScrubbingOrSeekingBegan:");
    }
  }
}

- (void)setRoutingVideoToHostedWindow:(BOOL)a3
{
  if (self->_routingVideoToHostedWindow != a3)
  {
    self->_routingVideoToHostedWindow = a3;
    [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
  }
}

- (void)setObservedTimeControlStatus:(int64_t)a3
{
  if (self->_observedTimeControlStatus != a3)
  {
    self->_observedTimeControlStatus = a3;
    [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
    if (a3 == 2)
    {
      [(AVPictureInPicturePlatformAdapter *)self setInterruptedForAudioSession:0];
      [(AVPictureInPicturePlatformAdapter *)self setWasPlayingWhenSuspended:0];
    }
  }
}

- (void)_removeSecondScreenConnection
{
  v3 = [(AVPictureInPicturePlatformAdapter *)self secondScreenConnection];

  if (v3)
  {
    id v4 = +[AVSecondScreenController sharedInstance];
    v5 = [(AVPictureInPicturePlatformAdapter *)self secondScreenConnection];
    [v4 removeConnection:v5];

    secondScreenConnection = self->_secondScreenConnection;
    self->_secondScreenConnection = 0;
  }
}

- (void)pictureInPictureViewControllerViewWillDisappear:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureViewControllerViewWillDisappear:]";
    __int16 v9 = 1024;
    int v10 = 1009;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  __int16 v6 = [(AVPictureInPicturePlatformAdapter *)self source];
  [(AVPictureInPicturePlatformAdapter *)self _setRoutingVideoToHostedWindow:0 pictureInPictureViewController:v4 source:v6];
}

- (void)pictureInPictureViewControllerViewDidAppear:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureViewControllerViewDidAppear:]";
    __int16 v9 = 1024;
    int v10 = 1003;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v7, 0x12u);
  }

  __int16 v6 = [(AVPictureInPicturePlatformAdapter *)self source];
  [(AVPictureInPicturePlatformAdapter *)self _setRoutingVideoToHostedWindow:1 pictureInPictureViewController:v4 source:v6];
}

- (BOOL)pictureInPictureProxyCanIssueOptionalCommand:(id)a3
{
  return [a3 playbackAction] < 10;
}

- (void)pictureInPictureProxy:(id)a3 didReceiveTestingCommand:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a4, "testingAction", a3) == 1)
  {
    int64_t v5 = [(AVPictureInPicturePlatformAdapter *)self status];
    __int16 v6 = _AVLog();
    BOOL v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5 == 1)
    {
      if (v7)
      {
        uint64_t v8 = [(AVPictureInPicturePlatformAdapter *)self playerController];
        int v9 = 136315394;
        int v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didReceiveTestingCommand:]";
        __int16 v11 = 2114;
        v12 = v8;
        _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s starting for playerController %{public}@", (uint8_t *)&v9, 0x16u);
      }
      [(AVPictureInPicturePlatformAdapter *)self startPictureInPicture];
    }
    else
    {
      if (v7)
      {
        int v9 = 136315394;
        int v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didReceiveTestingCommand:]";
        __int16 v11 = 1024;
        LODWORD(v12) = [(AVPictureInPicturePlatformAdapter *)self status];
        _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s failed; status = %d", (uint8_t *)&v9, 0x12u);
      }
    }
  }
}

- (void)pictureInPictureProxy:(id)a3 didReceivePlaybackCommand:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didReceivePlaybackCommand:]";
    __int16 v40 = 2048;
    uint64_t v41 = [v7 playbackAction];
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s playbackCommand: %ld", buf, 0x16u);
  }

  switch([v7 playbackAction])
  {
    case 1:
      [v7 associatedDoubleValue];
      double v10 = v9;
      __int16 v11 = [(AVPictureInPicturePlatformAdapter *)self playerController];
      [v7 associatedDoubleValue];
      objc_msgSend(v11, "seekByTimeInterval:toleranceBefore:toleranceAfter:");

      v12 = [(AVPictureInPicturePlatformAdapter *)self delegate];
      char v13 = objc_opt_respondsToSelector();
      if (v10 <= 0.0)
      {
        if ((v13 & 1) == 0) {
          goto LABEL_44;
        }
        v14 = [(AVPictureInPicturePlatformAdapter *)self delegate];
        v15 = v14;
        v16 = self;
        uint64_t v17 = 10;
      }
      else
      {
        if ((v13 & 1) == 0) {
          goto LABEL_44;
        }
        v14 = [(AVPictureInPicturePlatformAdapter *)self delegate];
        v15 = v14;
        v16 = self;
        uint64_t v17 = 11;
      }
      [v14 pictureInPicturePlatformAdapter:v16 handlePlaybackCommand:v17];

      goto LABEL_44;
    case 2:
      v12 = [(AVPictureInPicturePlatformAdapter *)self playerController];
      [v12 gotoEndOfSeekableRanges:self];
      goto LABEL_44;
    case 3:
      int v19 = [v7 associatedBoolValue];
      v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
      v12 = v20;
      v21 = self;
      if (v19) {
        uint64_t v22 = 1;
      }
      else {
        uint64_t v22 = 2;
      }
      goto LABEL_43;
    case 4:
      int64_t v23 = [(AVPictureInPicturePlatformAdapter *)self controlsStyle];
      int v24 = [v7 associatedBoolValue];
      if (v23 == 1)
      {
        if (v24 != [(AVPictureInPicturePlatformAdapter *)self isMicrophoneEnabled]) {
          goto LABEL_45;
        }
        v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
        v12 = v20;
        v21 = self;
        uint64_t v22 = 8;
      }
      else
      {
        v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
        v12 = v20;
        v21 = self;
        if (v24) {
          uint64_t v22 = 6;
        }
        else {
          uint64_t v22 = 7;
        }
      }
LABEL_43:
      [v20 pictureInPicturePlatformAdapter:v21 handlePlaybackCommand:v22];
LABEL_44:

      goto LABEL_45;
    case 5:
      if ([v7 associatedBoolValue])
      {
        [(AVPictureInPicturePlatformAdapter *)self setWasPlayingWhenSuspended:[(AVPictureInPicturePlatformAdapter *)self observedTimeControlStatus] == 2];
        v25 = [(AVPictureInPicturePlatformAdapter *)self playerController];
        if ([v25 isPlaying])
        {
          BOOL v26 = [(AVPictureInPicturePlatformAdapter *)self canPausePlaybackWhenClosingPictureInPicture];

          if (!v26)
          {
LABEL_48:
            [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:5];
            goto LABEL_45;
          }
          v27 = [(AVPictureInPicturePlatformAdapter *)self playerController];
          char v28 = objc_opt_respondsToSelector();

          v29 = [(AVPictureInPicturePlatformAdapter *)self playerController];
          v25 = v29;
          if (v28) {
            [v29 pauseForAllCoordinatedPlaybackParticipants:0];
          }
          else {
            [v29 setPlaying:0];
          }
        }

        goto LABEL_48;
      }
      if ([v6 pictureInPictureWasStartedWhenEnteringBackground]) {
        uint64_t v32 = 4;
      }
      else {
        uint64_t v32 = 3;
      }
      [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:v32];
      if ([(AVPictureInPicturePlatformAdapter *)self wasPlayingWhenSuspended])
      {
        if (![(AVPictureInPicturePlatformAdapter *)self isInterruptedForAudioSession])
        {
          v33 = [(AVPictureInPicturePlatformAdapter *)self playerController];
          char v34 = [v33 isPictureInPictureInterrupted];

          if ((v34 & 1) == 0)
          {
            v35 = [(AVPictureInPicturePlatformAdapter *)self playerController];
            [v35 play:self];
          }
        }
      }
      [(AVPictureInPicturePlatformAdapter *)self setWasPlayingWhenSuspended:0];
LABEL_45:

      return;
    case 6:
      v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
      v12 = v20;
      v21 = self;
      uint64_t v22 = 3;
      goto LABEL_43;
    case 7:
      if ([v7 associatedBoolValue]
        && ![(AVPictureInPicturePlatformAdapter *)self isInterruptedForAudioSession])
      {
        v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
        v12 = v20;
        v21 = self;
        uint64_t v22 = 5;
      }
      else
      {
        v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
        v12 = v20;
        v21 = self;
        uint64_t v22 = 4;
      }
      goto LABEL_43;
    case 8:
      v20 = [(AVPictureInPicturePlatformAdapter *)self delegate];
      v12 = v20;
      v21 = self;
      uint64_t v22 = 9;
      goto LABEL_43;
    case 9:
      v30 = [(AVPictureInPicturePlatformAdapter *)self playerController];
      v31 = [v30 player];
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = __85__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_didReceivePlaybackCommand___block_invoke;
      v37[3] = &unk_1E5FC3528;
      v37[4] = self;
      +[AVDismissalExpanseCoordinator coordinateDismissalWithExpanseSessionForPlayer:v31 cancellable:1 dismissalBlock:v37];

      goto LABEL_45;
    default:
      v18 = _AVLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        uint64_t v36 = [v7 playbackAction];
        *(_DWORD *)buf = 134217984;
        v39 = (const char *)v36;
        _os_log_error_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_ERROR, "Error: Unrecognized PGPlaybackAction - %ld", buf, 0xCu);
      }

      goto LABEL_45;
  }
}

uint64_t __85__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_didReceivePlaybackCommand___block_invoke(uint64_t result, char a2)
{
  if ((a2 & 1) == 0) {
    return [*(id *)(result + 32) stopPictureInPictureAndRestoreUserInterface:0];
  }
  return result;
}

- (void)pictureInPictureProxy:(id)a3 didUpdateResourcesUsageReductionReasons:(unint64_t)a4 oldReasons:(unint64_t)a5
{
  char v5 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = "YES";
    int v11 = 136315650;
    v12 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didUpdateResourcesUsageReductionReasons:oldReasons:]";
    v14 = "shouldReduceResources";
    __int16 v13 = 2080;
    if ((v5 & 1) == 0) {
      uint64_t v8 = "NO";
    }
    __int16 v15 = 2080;
    v16 = v8;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v11, 0x20u);
  }

  double v9 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  double v10 = v9;
  if (v5) {
    [v9 pictureInPicturePlatformAdapterBeginReducingResourcesForEligibleOffScreenState];
  }
  else {
    [v9 pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState];
  }
}

- (id)pictureInPictureProxyViewControllerWindowForTransitionAnimation:(id)a3
{
  v3 = [(AVPictureInPicturePlatformAdapter *)self source];
  id v4 = objc_msgSend(v3, "avkit_window");

  return v4;
}

- (int64_t)pictureInPictureProxyInterfaceOrientationForTransitionAnimation:(id)a3
{
  v3 = [(AVPictureInPicturePlatformAdapter *)self source];
  id v4 = objc_msgSend(v3, "avkit_window");
  int64_t v5 = [v4 interfaceOrientation];

  return v5;
}

- (void)pictureInPictureProxyPictureInPictureInterruptionEnded:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxyPictureInPictureInterruptionEnded:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  [v6 pictureInPicturePlatformAdapter:self handlePlaybackCommand:4];
}

- (void)pictureInPictureProxyPictureInPictureInterruptionBegan:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int64_t v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    uint64_t v8 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxyPictureInPictureInterruptionBegan:]";
    __int16 v9 = 2112;
    id v10 = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@", (uint8_t *)&v7, 0x16u);
  }

  id v6 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  [v6 pictureInPicturePlatformAdapter:self handlePlaybackCommand:3];
}

- (void)pictureInPictureProxy:(id)a3 didStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 136315650;
    uint64_t v11 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didStopPictureInPictureWithAnimationType:reason:]";
    __int16 v12 = 2112;
    id v13 = v7;
    __int16 v14 = 2048;
    int64_t v15 = a5;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@ reason: %ld", (uint8_t *)&v10, 0x20u);
  }

  __int16 v9 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  [v9 pictureInPicturePlatformAdapterEndReducingResourcesForEligibleOffScreenState];

  [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:7];
  [(AVPictureInPicturePlatformAdapter *)self setSourceWindowWhenPictureInPictureStarted:0];
}

- (void)pictureInPictureProxy:(id)a3 willStopPictureInPictureWithAnimationType:(int64_t)a4 reason:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  __int16 v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 136315650;
    __int16 v14 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:willStopPictureInPictureWithAnimationType:reason:]";
    __int16 v15 = 2112;
    id v16 = v8;
    __int16 v17 = 2048;
    int64_t v18 = a5;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@ reason: %ld", (uint8_t *)&v13, 0x20u);
  }

  if (a4 == 2 || a5 == 1)
  {
    int v10 = [(AVPictureInPicturePlatformAdapter *)self delegate];
    [v10 pictureInPicturePlatformAdapterPrepareToStopForDismissal:self];
  }
  uint64_t v11 = [(AVPictureInPicturePlatformAdapter *)self source];
  __int16 v12 = [(AVPictureInPicturePlatformAdapter *)self pictureInPictureViewController];
  objc_msgSend(v11, "avkit_willBeginStoppingPictureInPictureForPictureInPictureViewController:", v12);

  [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:6];
}

- (void)pictureInPictureProxy:(id)a3 restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = _AVLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v14 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:restoreUserInterfaceForPictureInPictureStopWithCompletionHandler:]";
    __int16 v15 = 2112;
    id v16 = v6;
    _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s pictureInPictureProxy: %@", buf, 0x16u);
  }

  __int16 v9 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __124__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke;
  v11[3] = &unk_1E5FC2A78;
  v11[4] = self;
  id v12 = v7;
  id v10 = v7;
  [v9 pictureInPicturePlatformAdapter:self prepareToStopForRestoringUserInterface:v11];
}

uint64_t __124__AVPictureInPicturePlatformAdapter_pictureInPictureProxy_restoreUserInterfaceForPictureInPictureStopWithCompletionHandler___block_invoke(uint64_t a1, int a2)
{
  if (a2) {
    [*(id *)(a1 + 32) updateLayoutDependentBehaviors];
  }
  v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v3();
}

- (void)pictureInPictureProxy:(id)a3 failedToStartPictureInPictureWithAnimationType:(int64_t)a4 error:(id)a5
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:failedToStartPictureInPictureWithAnimationType:error:]";
    __int16 v11 = 2112;
    id v12 = v6;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s error: %@", (uint8_t *)&v9, 0x16u);
  }

  [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:1];
  id v8 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  [v8 pictureInPicturePlatformAdapter:self failedToStartError:v6];

  [(AVPictureInPicturePlatformAdapter *)self setSourceWindowWhenPictureInPictureStarted:0];
}

- (void)pictureInPictureProxy:(id)a3 didStartPictureInPictureWithAnimationType:(int64_t)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315394;
    id v10 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:didStartPictureInPictureWithAnimationType:]";
    __int16 v11 = 1024;
    int v12 = 737;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v9, 0x12u);
  }

  int v7 = [v5 pictureInPictureWasStartedWhenEnteringBackground];
  if (v7) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = 3;
  }
  [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:v8];
}

- (void)pictureInPictureProxy:(id)a3 willStartPictureInPictureWithAnimationType:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136315394;
    int v9 = "-[AVPictureInPicturePlatformAdapter pictureInPictureProxy:willStartPictureInPictureWithAnimationType:]";
    __int16 v10 = 1024;
    int v11 = 728;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v8, 0x12u);
  }

  id v6 = [(AVPictureInPicturePlatformAdapter *)self source];
  int v7 = objc_msgSend(v6, "avkit_window");
  [(AVPictureInPicturePlatformAdapter *)self setSourceWindowWhenPictureInPictureStarted:v7];

  [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:2];
}

- (CGRect)pictureInPictureProxyViewFrameForTransitionAnimation:(id)a3
{
  -[AVPictureInPicturePlatformAdapter _updateVideoRectInScreenIfNeeded](self);

  [(AVPictureInPicturePlatformAdapter *)self videoRectInScreen];
  result.size.double height = v7;
  result.size.double width = v6;
  result.origin.double y = v5;
  result.origin.double x = v4;
  return result;
}

- (void)_updateVideoRectInScreenIfNeeded
{
  if (a1)
  {
    int v2 = [a1 source];
    objc_msgSend(v2, "avkit_window");
    id v23 = (id)objc_claimAutoreleasedReturnValue();

    v3 = [a1 source];
    objc_msgSend(v3, "avkit_videoRectInWindow");
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;

    uint64_t v12 = [v23 screen];
    uint64_t v13 = [v12 fixedCoordinateSpace];
    objc_msgSend(v23, "convertRect:toCoordinateSpace:", v13, v5, v7, v9, v11);
    double v15 = v14;
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;

    [a1 videoRectInScreen];
    v26.origin.double x = v15;
    v26.origin.double y = v17;
    v26.size.double width = v19;
    v26.size.double height = v21;
    if (!CGRectEqualToRect(v25, v26))
    {
      objc_msgSend(a1, "setVideoRectInScreen:", v15, v17, v19, v21);
      uint64_t v22 = [a1 pegasusProxy];
      [v22 viewFrameForInteractiveTransitionAnimationWhenEnteringBackgroundDidChangeForViewController];
    }
  }
}

- (void)_startObservingForPlaybackStateUpdates
{
  v25[4] = *MEMORY[0x1E4F143B8];
  v3 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  v25[0] = @"playerController.rate";
  v25[1] = @"playerController.muted";
  v25[2] = @"playerController.status";
  v25[3] = @"playerController.hasLiveStreamingContent";
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:4];
  id v5 = (id)[v3 startObserving:self keyPaths:v4 includeInitialValue:1 observationHandler:&__block_literal_global_105];

  double v6 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  [v6 startObservingNotificationForName:@"AVPlayerControllerCurrentTimeJumpedNotification" object:0 notificationCenter:0 observationHandler:&__block_literal_global_107];

  double v7 = [(AVPictureInPicturePlatformAdapter *)self playerController];
  LOBYTE(v4) = objc_opt_respondsToSelector();

  if (v4)
  {
    double v8 = [(AVPictureInPicturePlatformAdapter *)self observationController];
    id v9 = (id)[v8 startObserving:self keyPath:@"playerController.seeking" includeInitialValue:1 observationHandler:&__block_literal_global_114];
  }
  double v10 = [(AVPictureInPicturePlatformAdapter *)self playerController];
  char v11 = objc_opt_respondsToSelector();

  if (v11)
  {
    uint64_t v12 = [(AVPictureInPicturePlatformAdapter *)self observationController];
    id v13 = (id)[v12 startObserving:self keyPath:@"playerController.seekToTime" includeInitialValue:1 observationHandler:&__block_literal_global_121];
  }
  double v14 = [(AVPictureInPicturePlatformAdapter *)self playerController];
  char v15 = objc_opt_respondsToSelector();

  if (v15)
  {
    double v16 = [(AVPictureInPicturePlatformAdapter *)self observationController];
    id v17 = (id)[v16 startObserving:self keyPath:@"playerController.scrubbing" includeInitialValue:1 observationHandler:&__block_literal_global_128];
  }
  double v18 = [(AVPictureInPicturePlatformAdapter *)self playerController];
  char v19 = objc_opt_respondsToSelector();

  double v20 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  double v21 = v20;
  if (v19)
  {
    uint64_t v22 = @"playerController.timeControlStatus";
    id v23 = &__block_literal_global_135;
  }
  else
  {
    uint64_t v22 = @"playerController.playing";
    id v23 = &__block_literal_global_137;
  }
  id v24 = (id)[v20 startObserving:self keyPath:v22 includeInitialValue:1 observationHandler:v23];
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v5 = [a4 value];
  if ([v5 BOOLValue]) {
    uint64_t v6 = 2;
  }
  else {
    uint64_t v6 = 0;
  }

  [v7 setObservedTimeControlStatus:v6];
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_6(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v5 = [a4 value];
  uint64_t v6 = [v5 integerValue];

  [v7 setObservedTimeControlStatus:v6];
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_5(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v5 = [a4 value];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setScrubbing:v6];
}

uint64_t __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 _updateProxyPlaybackState];
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v5 = [a4 value];
  uint64_t v6 = [v5 BOOLValue];

  [v7 setSeeking:v6];
}

void __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke_2(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7 = a2;
  id v5 = [a4 object];
  uint64_t v6 = [v7 playerController];

  if (v5 == v6) {
    [v7 _updateProxyPlaybackState];
  }
}

uint64_t __75__AVPictureInPicturePlatformAdapter__startObservingForPlaybackStateUpdates__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateProxyPlaybackState];
}

- (void)_startObservation
{
  v3 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  id v4 = (id)[v3 startObserving:self keyPath:@"playerController.contentDimensions" includeInitialValue:1 observationHandler:&__block_literal_global_44];

  id v5 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  uint64_t v6 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  id v7 = (id)[v5 startObserving:v6 keyPath:@"pictureInPicturePossible" includeInitialValue:1 observationHandler:&__block_literal_global_49];

  double v8 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  id v9 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  id v10 = (id)[v8 startObserving:v9 keyPath:@"pictureInPictureWasStartedWhenEnteringBackground" includeInitialValue:1 observationHandler:&__block_literal_global_54];

  char v11 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  id v12 = (id)[v11 startObserving:self keyPath:@"playerController.playing" includeInitialValue:1 observationHandler:&__block_literal_global_59];

  [(AVPictureInPicturePlatformAdapter *)self _startObservingForPlaybackStateUpdates];
  if ([(AVPictureInPicturePlatformAdapter *)self managesWiredSecondScreenPlayback])
  {
    id v13 = [(AVPictureInPicturePlatformAdapter *)self source];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      double v14 = [(AVPictureInPicturePlatformAdapter *)self source];
      objc_initWeak(&location, v14);
    }
    else
    {
      id location = 0;
    }

    id v15 = objc_loadWeakRetained(&location);
    if (v15)
    {
      double v16 = [(AVPictureInPicturePlatformAdapter *)self observationController];
      uint64_t v22 = MEMORY[0x1E4F143A8];
      uint64_t v23 = 3221225472;
      id v24 = __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_5;
      CGRect v25 = &unk_1E5FC1FE8;
      objc_copyWeak(&v26, &location);
      id v17 = (id)[v16 startObserving:self keyPath:@"playerController.player" includeInitialValue:1 observationHandler:&v22];

      objc_destroyWeak(&v26);
    }
    objc_destroyWeak(&location);
  }
  double v18 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  [v18 startObservingNotificationForName:*MEMORY[0x1E4F16058] object:0 notificationCenter:0 observationHandler:&__block_literal_global_82];

  char v19 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  [v19 startObservingNotificationForName:*MEMORY[0x1E4F15000] object:0 notificationCenter:0 observationHandler:&__block_literal_global_84];

  double v20 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  [v20 startObservingNotificationForName:*MEMORY[0x1E4F16060] object:0 notificationCenter:0 observationHandler:&__block_literal_global_86];

  double v21 = [(AVPictureInPicturePlatformAdapter *)self observationController];
  [v21 startObservingNotificationForName:*MEMORY[0x1E4F16008] object:0 notificationCenter:0 observationHandler:&__block_literal_global_89];
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_5(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  [v7 _removeSecondScreenConnection];
  id v10 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (AVSecondScreenTVSupportEnabled_onceToken != -1) {
    dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_125);
  }
  if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled)
  {
    id v12 = [WeakRetained player];

    if (v12)
    {
      id v13 = [MEMORY[0x1E4FB16C8] currentDevice];
      uint64_t v14 = [v13 userInterfaceIdiom];

      if (v14 == 1)
      {
        id v15 = (void *)[objc_alloc(MEMORY[0x1E4F29268]) initWithServiceName:@"com.apple.avkit.SharedPreferences"];
        double v16 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F09B4238];
        [v15 setRemoteObjectInterface:v16];

        [v15 resume];
        objc_initWeak(&location, v7);
        id v17 = [v15 remoteObjectProxy];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        v21[2] = __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_6;
        v21[3] = &unk_1E5FC1FC0;
        objc_copyWeak(&v23, &location);
        objc_copyWeak(&v24, v10);
        id v18 = v15;
        id v22 = v18;
        [v17 extendedDisplayActive:v21];

        objc_destroyWeak(&v24);
        objc_destroyWeak(&v23);
        objc_destroyWeak(&location);
      }
      else
      {
        id v18 = +[AVSecondScreenController sharedInstance];
        char v19 = [WeakRetained player];
        double v20 = [v18 addConnectionForPlayer:v19 playerLayer:WeakRetained];
        [v7 setSecondScreenConnection:v20];
      }
    }
  }
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_87(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v13 = a2;
  id v5 = a4;
  uint64_t v6 = [v13 playerController];
  char v7 = objc_opt_respondsToSelector();

  if (v7)
  {
    id v8 = [v5 object];
    id v9 = [v8 interstitialPlayer];
    id v10 = [v13 playerController];
    char v11 = [v10 interstitialController];
    id v12 = [v11 interstitialPlayer];

    if (v9 == v12) {
      -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)v13);
    }
  }
}

- (void)_updateTimeResolver
{
  if (a1 && a1[1])
  {
    double v2 = 1.0;
    double v3 = 3.40282347e38;
    if ([a1 status] == 7 || objc_msgSend(a1, "status") == 1 || !objc_msgSend(a1, "status"))
    {
      id v8 = 0;
    }
    else
    {
      id v4 = [a1 playerController];
      id v8 = v4;
      if (objc_msgSend(v4, "avkit_isAVPlayerControllerOrSubclass"))
      {
        id v5 = [v4 interstitialController];
        uint64_t v6 = [v5 currentInterstitialTimeRange];

        id v8 = v4;
        if (v6)
        {
          id v8 = [v5 interstitialTimingController];
        }
      }

      double v3 = 1.0;
      double v2 = 1000.0;
    }
    id v7 = [a1[1] playerController];

    if (v7 != v8) {
      [a1[1] setPlayerController:v8];
    }
    [a1[1] setInterval:v3];
    [a1[1] setResolution:v2];
  }
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_9(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  id v7 = [v6 object];
  id v8 = [v5 playerController];
  id v9 = [v8 player];

  if (v7 == v9)
  {
    id v10 = [v5 playerController];
    char v11 = [v10 player];
    [v11 rate];
    float v13 = v12;

    if ([v5 status] >= 2 && v13 != 0.0)
    {
      uint64_t v14 = _AVLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        id v15 = [v6 userInfo];
        int v16 = 134218242;
        double v17 = v13;
        __int16 v18 = 2112;
        char v19 = v15;
        _os_log_impl(&dword_1B05B7000, v14, OS_LOG_TYPE_DEFAULT, "Interruption notification: AVPlayerPlaybackWasInterruptedNotification player.rate: %.1f userinfo: %@", (uint8_t *)&v16, 0x16u);
      }
      [v5 setInterruptedForAudioSession:1];
    }
  }
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_8(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v5 = [a4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F15020]];
  uint64_t v7 = [v6 unsignedIntegerValue];

  if (!v7) {
    goto LABEL_6;
  }
  id v8 = v12;
  if (v7 == 1)
  {
    id v9 = [v12 playerController];
    id v10 = [v9 player];

    id v8 = v12;
    if (!v10)
    {
      if ([v12 status] > 1)
      {
        char v11 = [v12 playerController];
        objc_msgSend(v12, "setInterruptedForAudioSession:", objc_msgSend(v11, "isPlaying"));

LABEL_7:
        id v8 = v12;
        goto LABEL_8;
      }
LABEL_6:
      [v12 setInterruptedForAudioSession:0];
      goto LABEL_7;
    }
  }
LABEL_8:
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_7(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = a4;
  id v6 = [v8 source];
  uint64_t v7 = [v5 object];

  if (v6 == v7) {
    [v8 updateLayoutDependentBehaviors];
  }
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_6(id *a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v4 = objc_loadWeakRetained(a1 + 6);
  if ((a2 & 1) == 0)
  {
    if (AVSecondScreenTVSupportEnabled_onceToken != -1) {
      dispatch_once(&AVSecondScreenTVSupportEnabled_onceToken, &__block_literal_global_125);
    }
    if (AVSecondScreenTVSupportEnabled_AVSecondScreenTVSupportEnabled)
    {
      if (WeakRetained)
      {
        id v5 = [v4 player];

        if (v5)
        {
          id v6 = +[AVSecondScreenController sharedInstance];
          uint64_t v7 = [v4 player];
          id v8 = [v6 addConnectionForPlayer:v7 playerLayer:v4];
          [WeakRetained setSecondScreenConnection:v8];
        }
      }
    }
  }
  [a1[4] invalidate];
}

uint64_t __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_4(uint64_t a1, void *a2)
{
  return [a2 updateLayoutDependentBehaviors];
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v8 = a2;
  id v5 = a4;
  if ((unint64_t)([v8 status] - 3) <= 1)
  {
    id v6 = [v5 value];
    if ([v6 BOOLValue]) {
      uint64_t v7 = 4;
    }
    else {
      uint64_t v7 = 3;
    }
    [v8 _updateStatusUsingProposedStatus:v7];
  }
}

uint64_t __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _updateStatus];
}

void __54__AVPictureInPicturePlatformAdapter__startObservation__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v12 = a2;
  id v5 = [a4 value];
  [v5 CGSizeValue];
  double v7 = v6;
  double v9 = v8;

  id v10 = [v12 pictureInPictureViewController];
  objc_msgSend(v10, "setPreferredContentSize:", v7, v9);

  char v11 = [v12 pegasusProxy];
  [v11 preferredContentSizeDidChangeForViewController];
}

- (void)_createProxyIfNeeded
{
  v17[5] = *MEMORY[0x1E4F143B8];
  double v3 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  if (v3)
  {
  }
  else if ([(AVPictureInPicturePlatformAdapter *)self status] {
         || ([(AVPictureInPicturePlatformAdapter *)self activitySessionIdentifier],
  }
             id v4 = objc_claimAutoreleasedReturnValue(),
             v4,
             v4))
  {
    id v5 = objc_alloc(MEMORY[0x1E4F88570]);
    int64_t v6 = [(AVPictureInPicturePlatformAdapter *)self _proxyControlsStyle];
    double v7 = [(AVPictureInPicturePlatformAdapter *)self pictureInPictureViewController];
    double v8 = (PGPictureInPictureProxy *)[v5 initWithControlsStyle:v6 viewController:v7];
    pegasusProxdouble y = self->_pegasusProxy;
    self->_pegasusProxdouble y = v8;

    if (!self->_pegasusProxy) {
      [(AVPictureInPicturePlatformAdapter *)self setStatus:0];
    }
    id v10 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
    [v10 setDelegate:self];

    [(AVPictureInPicturePlatformAdapter *)self _startObservation];
    if (!self->_timeResolver)
    {
      char v11 = objc_alloc_init(AVPlayerControllerTimeResolver);
      timeResolver = self->_timeResolver;
      self->_timeResolver = v11;

      -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)&self->super.isa);
      float v13 = [(AVPictureInPicturePlatformAdapter *)self observationController];
      uint64_t v14 = self->_timeResolver;
      v17[0] = @"minTime";
      v17[1] = @"maxTime";
      v17[2] = @"playerController.timing";
      v17[3] = @"playerController.seekableTimeRanges";
      v17[4] = @"playerController.hasSeekableLiveStreamingContent";
      id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v17 count:5];
      id v16 = (id)[v13 startObserving:v14 keyPaths:v15 observationHandler:&__block_literal_global_161];
    }
    [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
  }
}

uint64_t __63__AVPictureInPicturePlatformAdapter__setupTimeResolverIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateProxyPlaybackState];
}

- (void)setBackgroundPlaybackPolicy:(int64_t)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (self->_backgroundPlaybackPolicy != a3)
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      double v7 = "-[AVPictureInPicturePlatformAdapter setBackgroundPlaybackPolicy:]";
      __int16 v8 = 2050;
      int64_t v9 = a3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s backgroundPlaybackPolicy %{public}ld", (uint8_t *)&v6, 0x16u);
    }

    self->_backgroundPlaybackPolicdouble y = a3;
    [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
  }
}

- (void)_updateProxyPlaybackState
{
  double v3 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  uint64_t v4 = [v3 controlsStyle];
  int64_t v5 = [(AVPictureInPicturePlatformAdapter *)self _proxyControlsStyle];

  if (v4 != v5)
  {
    int64_t v6 = [(AVPictureInPicturePlatformAdapter *)self _proxyControlsStyle];
    double v7 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
    [v7 setControlsStyle:v6];
  }
  __int16 v8 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __62__AVPictureInPicturePlatformAdapter__updateProxyPlaybackState__block_invoke;
  v9[3] = &unk_1E5FC1F78;
  v9[4] = self;
  [v8 updatePlaybackStateUsingBlock:v9];
}

void __62__AVPictureInPicturePlatformAdapter__updateProxyPlaybackState__block_invoke(uint64_t a1, void *a2)
{
  id v22 = a2;
  uint64_t v3 = [*(id *)(a1 + 32) controlsStyle];
  switch(v3)
  {
    case 2:
      [v22 setContentType:4];
      break;
    case 1:
      [v22 setContentType:3];
      objc_msgSend(v22, "setMuted:", objc_msgSend(*(id *)(a1 + 32), "isMicrophoneEnabled") ^ 1);
      break;
    case 0:
      uint64_t v4 = [*(id *)(a1 + 32) playerController];
      [v4 rate];
      double v6 = v5;
      [*(id *)(*(void *)(a1 + 32) + 8) targetTime];
      double v8 = v7;
      double v9 = 0.0;
      if ([v4 status] == 2)
      {
        uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) playerController];
        [v10 contentDurationWithinEndTimes];
        double v9 = v11;
      }
      uint64_t v12 = [*(id *)(a1 + 32) observedTimeControlStatus];
      if ([*(id *)(a1 + 32) isScrubbingOrSeeking])
      {
        [*(id *)(a1 + 32) rateWhenScrubbingOrSeekingBegan];
        [*(id *)(a1 + 32) rateWhenScrubbingOrSeekingBegan];
        if (v13 != 0.0) {
          uint64_t v12 = 1;
        }
      }
      float v14 = v6;
      if ([v4 hasLiveStreamingContent])
      {
        [v22 setContentType:2];
        if ([*(id *)(a1 + 32) requiresLinearPlayback]) {
          uint64_t v15 = 1;
        }
        else {
          uint64_t v15 = [v4 hasSeekableLiveStreamingContent] ^ 1;
        }
      }
      else
      {
        [v22 setContentType:1];
        uint64_t v15 = [*(id *)(a1 + 32) requiresLinearPlayback];
      }
      [v22 setRequiresLinearPlayback:v15];
      [v22 setContentDuration:v9];
      [v22 setPlaybackRate:v12 elapsedTime:v14 timeControlStatus:v8];
      objc_msgSend(v22, "setMuted:", objc_msgSend(v4, "isMuted"));
      id v16 = [*(id *)(a1 + 32) prerollAttributes];
      double v17 = [v16 pegasusAttributes];
      [v22 setPrerollAttributes:v17];

      break;
  }
  objc_msgSend(v22, "setRoutingVideoToHostedWindow:", objc_msgSend(*(id *)(a1 + 32), "isRoutingVideoToHostedWindow"));
  uint64_t v18 = [*(id *)(a1 + 32) backgroundPlaybackPolicy];
  uint64_t v19 = [*(id *)(a1 + 32) activitySessionIdentifier];
  if (v19)
  {
    uint64_t v20 = (void *)v19;
    uint64_t v21 = [*(id *)(a1 + 32) backgroundPlaybackPolicy];

    if (v21 == 1) {
      uint64_t v18 = 3;
    }
  }
  [v22 setBackgroundAudioPolicy:v18];
}

- (int64_t)_proxyControlsStyle
{
  unint64_t v2 = [(AVPictureInPicturePlatformAdapter *)self controlsStyle];
  if (v2 > 2) {
    return 1;
  }
  else {
    return qword_1B0721380[v2];
  }
}

- (void)_updatePictureInPictureShouldStartWhenEnteringBackground
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  [(AVPictureInPicturePlatformAdapter *)self _createProxyIfNeeded];
  BOOL v3 = [(AVPictureInPicturePlatformAdapter *)self _isFullScreen];
  uint64_t v4 = [(AVPictureInPicturePlatformAdapter *)self activitySessionIdentifier];

  double v5 = [(AVPictureInPicturePlatformAdapter *)self playerController];
  int v6 = [v5 isPlaying];
  if (v4) {
    int v7 = 1;
  }
  else {
    int v7 = v6;
  }

  BOOL v8 = [(AVPictureInPicturePlatformAdapter *)self canStartAutomaticallyWhenEnteringBackground]&& (v3|| [(AVPictureInPicturePlatformAdapter *)self alwaysStartsAutomaticallyWhenEnteringBackground])&& ([(AVPictureInPicturePlatformAdapter *)self allowsPictureInPicturePlayback] & v7) == 1&& [(AVPictureInPicturePlatformAdapter *)self status] != 0;
  double v9 = _AVLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AVPictureInPicturePlatformAdapter *)self canStartAutomaticallyWhenEnteringBackground])
    {
      uint64_t v10 = "YES";
    }
    else
    {
      uint64_t v10 = "NO";
    }
    if (v3) {
      double v11 = "YES";
    }
    else {
      double v11 = "NO";
    }
    if ([(AVPictureInPicturePlatformAdapter *)self alwaysStartsAutomaticallyWhenEnteringBackground])
    {
      uint64_t v12 = "YES";
    }
    else
    {
      uint64_t v12 = "NO";
    }
    if ([(AVPictureInPicturePlatformAdapter *)self allowsPictureInPicturePlayback]) {
      double v13 = "YES";
    }
    else {
      double v13 = "NO";
    }
    float v14 = [(AVPictureInPicturePlatformAdapter *)self playerController];
    if ([v14 isPlaying]) {
      uint64_t v15 = "YES";
    }
    else {
      uint64_t v15 = "NO";
    }
    if (v4) {
      id v16 = "YES";
    }
    else {
      id v16 = "NO";
    }
    *(_DWORD *)buf = 136316930;
    if ([(AVPictureInPicturePlatformAdapter *)self status]) {
      double v17 = "YES";
    }
    else {
      double v17 = "NO";
    }
    id v24 = "-[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground]";
    __int16 v25 = 2080;
    id v26 = v22;
    __int16 v27 = 2080;
    char v28 = v21;
    __int16 v29 = 2080;
    v30 = v12;
    __int16 v31 = 2080;
    uint64_t v32 = v13;
    __int16 v33 = 2080;
    char v34 = v15;
    __int16 v35 = 2080;
    uint64_t v36 = v16;
    __int16 v37 = 2080;
    v38 = v17;
    _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s canStartAutomaticallyWhenEnteringBackground: %s isFullScreen - %s alwaysStartsAutomaticallyWhenEnteringBackground - %s allowsPictureInPicturePlayback - %s playerController.isPlaying - %s inSharePlaySession - %s status != prohibited - %s", buf, 0x52u);
  }
  uint64_t v18 = _AVLog();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    if (v8) {
      uint64_t v19 = "YES";
    }
    else {
      uint64_t v19 = "NO";
    }
    *(_DWORD *)buf = 136315650;
    id v24 = "-[AVPictureInPicturePlatformAdapter _updatePictureInPictureShouldStartWhenEnteringBackground]";
    __int16 v25 = 2080;
    id v26 = "pictureInPictureShouldStartWhenEnteringBackground";
    __int16 v27 = 2080;
    char v28 = v19;
    _os_log_impl(&dword_1B05B7000, v18, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }

  uint64_t v20 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  [v20 setPictureInPictureShouldStartWhenEnteringBackground:v8];
}

- (BOOL)_isFullScreen
{
  BOOL v3 = [(AVPictureInPicturePlatformAdapter *)self source];
  char v4 = objc_opt_respondsToSelector();

  double v5 = [(AVPictureInPicturePlatformAdapter *)self source];
  int v6 = v5;
  if (v4)
  {
    char v7 = objc_msgSend(v5, "avkit_isFullScreen");
  }
  else
  {
    BOOL v8 = objc_msgSend(v5, "avkit_window");

    double v9 = [(AVPictureInPicturePlatformAdapter *)self source];
    objc_msgSend(v9, "avkit_videoRectInWindow");
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;

    -[AVPictureInPicturePlatformAdapter _updateVideoRectInScreenIfNeeded](self);
    if (v8)
    {
      v31.origin.double x = v11;
      v31.origin.double y = v13;
      v31.size.double width = v15;
      v31.size.double height = v17;
      if (CGRectIsEmpty(v31)) {
        goto LABEL_7;
      }
      v32.origin.double x = v11;
      v32.origin.double y = v13;
      v32.size.double width = v15;
      v32.size.double height = v17;
      if (CGRectIsInfinite(v32)) {
        goto LABEL_7;
      }
      uint64_t v18 = [(AVPictureInPicturePlatformAdapter *)self source];
      uint64_t v19 = objc_msgSend(v18, "avkit_window");
      [v8 bounds];
      UIRectGetCenter();
      objc_msgSend(v19, "_largestInscribedRectInBoundingPathWithCenter:aspectRatio:");
      CGFloat v21 = v20;
      CGFloat rect_8 = v22;
      CGFloat v24 = v23;
      CGFloat v26 = v25;

      v33.origin.double x = v11;
      v33.origin.double y = v13;
      v33.size.double width = v15;
      v33.size.double height = v17;
      CGFloat v27 = CGRectGetWidth(v33) + 2.0;
      v34.origin.double x = v21;
      v34.origin.double y = rect_8;
      v34.size.double width = v24;
      v34.size.double height = v26;
      if (v27 < floor(CGRectGetWidth(v34)))
      {
LABEL_7:
        char v7 = 0;
      }
      else
      {
        v35.origin.double x = v11;
        v35.origin.double y = v13;
        v35.size.double width = v15;
        v35.size.double height = v17;
        CGFloat v29 = CGRectGetHeight(v35) + 2.0;
        v36.origin.double x = v21;
        v36.origin.double y = rect_8;
        v36.size.double width = v24;
        v36.size.double height = v26;
        char v7 = v29 >= floor(CGRectGetHeight(v36));
      }
      int v6 = v8;
    }
    else
    {
      int v6 = 0;
      char v7 = 0;
    }
  }

  return v7;
}

- (void)updateLayoutDependentBehaviors
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    double v5 = "-[AVPictureInPicturePlatformAdapter updateLayoutDependentBehaviors]";
    __int16 v6 = 1024;
    int v7 = 371;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  [(AVPictureInPicturePlatformAdapter *)self _updateStatus];
  -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)&self->super.isa);
  [(AVPictureInPicturePlatformAdapter *)self _updatePictureInPictureShouldStartWhenEnteringBackground];
}

- (void)setCanStartAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  if (self->_canStartAutomaticallyWhenEnteringBackground != a3)
  {
    self->_canStartAutomaticallyWhenEnteringBackground = a3;
    [(AVPictureInPicturePlatformAdapter *)self _updatePictureInPictureShouldStartWhenEnteringBackground];
  }
}

- (void)setActivitySessionIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t activitySessionIdentifier = (uint64_t)self->_activitySessionIdentifier;
  if ((id)activitySessionIdentifier != v4)
  {
    double v9 = v4;
    uint64_t activitySessionIdentifier = [(id)activitySessionIdentifier isEqualToString:v4];
    id v4 = v9;
    if ((activitySessionIdentifier & 1) == 0)
    {
      __int16 v6 = (NSString *)[v9 copy];
      int v7 = self->_activitySessionIdentifier;
      self->_uint64_t activitySessionIdentifier = v6;

      [(AVPictureInPicturePlatformAdapter *)self _createProxyIfNeeded];
      uint64_t v8 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
      [v8 setClientSessionIdentifier:v9];

      [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
      uint64_t activitySessionIdentifier = [(AVPictureInPicturePlatformAdapter *)self _updatePictureInPictureShouldStartWhenEnteringBackground];
      id v4 = v9;
    }
  }

  MEMORY[0x1F41817F8](activitySessionIdentifier, v4);
}

- (void)setPlayerController:(id)a3
{
  id v19 = a3;
  objc_storeStrong((id *)&self->_playerController, a3);
  double v5 = [(AVPictureInPicturePlatformAdapter *)self contentSourceAwaitingSetup];

  if (v5)
  {
    __int16 v6 = [(AVPictureInPicturePlatformAdapter *)self contentSourceAwaitingInvalidation];
    int v7 = [(AVPictureInPicturePlatformAdapter *)self contentSourceAwaitingSetup];
    uint64_t v8 = objc_msgSend(v7, "avkit_pictureInPictureViewController");
    double v9 = v8;
    if (v8) {
      double v10 = v8;
    }
    else {
      double v10 = [[AVPictureInPictureViewController alloc] initWithPictureInPicturePlayerLayerView:0];
    }
    CGFloat v11 = v10;

    unint64_t v12 = [(AVPictureInPicturePlatformAdapter *)self status];
    if (v12 <= 7)
    {
      if (((1 << v12) & 0x7C) != 0)
      {
        CGFloat v13 = [(AVPictureInPicturePlatformAdapter *)self pictureInPictureViewController];
        double v14 = [v13 contentViewController];
        CGFloat v15 = v14;
        if (v14)
        {
          id v16 = v14;
        }
        else
        {
          id v16 = [(AVPictureInPicturePlatformAdapter *)self pictureInPictureViewController];
        }
        CGFloat v17 = v16;

        objc_msgSend(v6, "avkit_stopRoutingVideoToPictureInPictureViewController:", v17);
        uint64_t v18 = [(AVPictureInPicturePlatformAdapter *)self pictureInPictureViewController];
        [v18 setContentViewController:v11];

        objc_msgSend(v7, "avkit_startRoutingVideoToPictureInPictureViewController:", v11);
      }
      else
      {
        CGFloat v17 = [(AVPictureInPicturePlatformAdapter *)self pictureInPictureViewController];
        [v17 setContentViewController:v11];
      }
    }
    [(AVPictureInPicturePlatformAdapter *)self setContentSourceAwaitingInvalidation:0];
    [(AVPictureInPicturePlatformAdapter *)self setContentSourceAwaitingSetup:0];
  }
}

- (void)setSource:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_source);
  if (WeakRetained != v4)
  {
    __int16 v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315650;
      uint64_t v8 = "-[AVPictureInPicturePlatformAdapter setSource:]";
      __int16 v9 = 2112;
      id v10 = WeakRetained;
      __int16 v11 = 2112;
      id v12 = v4;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s %@ --> %@", (uint8_t *)&v7, 0x20u);
    }

    objc_storeWeak((id *)&self->_source, v4);
    [(AVPictureInPicturePlatformAdapter *)self setContentSourceAwaitingInvalidation:WeakRetained];
    [(AVPictureInPicturePlatformAdapter *)self setContentSourceAwaitingSetup:v4];
  }
}

- (void)setStatus:(int64_t)a3
{
  if (self->_status != a3)
  {
    self->_status = a3;
    [(AVPictureInPicturePlatformAdapter *)self _updatePictureInPictureShouldStartWhenEnteringBackground];
    -[AVPictureInPicturePlatformAdapter _updateTimeResolver]((id *)&self->super.isa);
  }
}

- (void)setPrerollAttributes:(id)a3
{
  id v10 = a3;
  double v5 = [v10 pegasusAttributes];
  __int16 v6 = [(AVPictureInPicturePlatformAdapter *)self prerollAttributes];
  int v7 = [v6 pegasusAttributes];
  if ([v5 isEqual:v7])
  {
  }
  else
  {
    id v8 = [(AVPictureInPicturePlatformAdapter *)self prerollAttributes];

    __int16 v9 = v10;
    if (v8 == v10) {
      goto LABEL_6;
    }
    objc_storeStrong((id *)&self->_prerollAttributes, a3);
    [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
  }
  __int16 v9 = v10;
LABEL_6:
}

- (void)setAlwaysStartsAutomaticallyWhenEnteringBackground:(BOOL)a3
{
  self->_alwaysStartsAutomaticallyWhenEnteringBackground = a3;
  [(AVPictureInPicturePlatformAdapter *)self updateLayoutDependentBehaviors];
}

- (void)setRequiresLinearPlayback:(BOOL)a3
{
  self->_requiresLinearPlayback = a3;
  [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
}

- (void)setMicrophoneEnabled:(BOOL)a3
{
  self->_microphoneEnabled = a3;
  [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
}

- (void)setControlsStyle:(int64_t)a3
{
  if (self->_controlsStyle != a3)
  {
    self->_controlsStyle = a3;
    [(AVPictureInPicturePlatformAdapter *)self _updateProxyPlaybackState];
  }
}

- (void)setWasPlayingWhenSuspended:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_wasPlayingWhenSuspended != a3)
  {
    BOOL v3 = a3;
    self->_wasPlayingWhenSuspended = a3;
    id v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = "NO";
      int v6 = 136315650;
      int v7 = "-[AVPictureInPicturePlatformAdapter setWasPlayingWhenSuspended:]";
      __int16 v9 = "wasPlayingWhenSuspended";
      __int16 v8 = 2080;
      if (v3) {
        double v5 = "YES";
      }
      __int16 v10 = 2080;
      __int16 v11 = v5;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)setInterruptedForAudioSession:(BOOL)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (self->_interruptedForAudioSession != a3)
  {
    BOOL v3 = a3;
    self->_interruptedForAudioSession = a3;
    id v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      double v5 = "NO";
      int v6 = 136315650;
      int v7 = "-[AVPictureInPicturePlatformAdapter setInterruptedForAudioSession:]";
      __int16 v9 = "interruptedForAudioSession";
      __int16 v8 = 2080;
      if (v3) {
        double v5 = "YES";
      }
      __int16 v10 = 2080;
      __int16 v11 = v5;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v6, 0x20u);
    }
  }
}

- (void)setAllowsPictureInPicturePlayback:(BOOL)a3
{
  self->_allowsPictureInPicturePlayback = a3;
  [(AVPictureInPicturePlatformAdapter *)self _updateStatus];

  [(AVPictureInPicturePlatformAdapter *)self _createProxyIfNeeded];
}

- (BOOL)isSystemPictureInPicturePossible
{
  BOOL v3 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  if (v3)
  {
    id v4 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
    if ([v4 isPictureInPicturePossible])
    {
      char v5 = 1;
    }
    else
    {
      int v6 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
      if ([v6 isPictureInPictureSuspended])
      {
        char v5 = 1;
      }
      else
      {
        int v7 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
        char v5 = [v7 isPictureInPictureActive];
      }
    }
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)canAnimatePictureInPictureTransition
{
  return -[AVPictureInPicturePlatformAdapter _sceneActivationState](self) == 0;
}

- (uint64_t)_sceneActivationState
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!a1) {
    return 0;
  }
  unint64_t v2 = [a1 source];
  BOOL v3 = objc_msgSend(v2, "avkit_window");
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 windowScene];
  }
  else
  {
    int v6 = [a1 sourceWindowWhenPictureInPictureStarted];
    char v5 = [v6 windowScene];
  }
  if (!v5)
  {
    uint64_t v7 = -1;
    goto LABEL_9;
  }
  uint64_t v7 = [v5 activationState];
  if (v7)
  {
LABEL_9:
    __int16 v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v9 = [a1 source];
      __int16 v10 = [a1 source];
      __int16 v11 = objc_msgSend(v10, "avkit_window");
      uint64_t v12 = [a1 sourceWindowWhenPictureInPictureStarted];
      int v15 = 136315906;
      id v16 = "-[AVPictureInPicturePlatformAdapter _sceneActivationState]";
      __int16 v17 = 2114;
      uint64_t v18 = v9;
      __int16 v19 = 2114;
      double v20 = v11;
      __int16 v21 = 2114;
      double v22 = v12;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s source = %{public}@; source.avkit_window = %{public}@; sourceWindowWhenPictureInPictureStarted = %{public}@",
        (uint8_t *)&v15,
        0x2Au);
    }
    uint64_t v13 = _AVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 136315650;
      id v16 = "-[AVPictureInPicturePlatformAdapter _sceneActivationState]";
      __int16 v17 = 2114;
      uint64_t v18 = v5;
      __int16 v19 = 1024;
      LODWORD(v20) = v7;
      _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s windowScene = %{public}@;  activationState = %d",
        (uint8_t *)&v15,
        0x1Cu);
    }
  }
  return v7;
}

- (void)stopPictureInPictureAndRestoreUserInterface:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  char v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = "NO";
    *(_DWORD *)__int16 v10 = 136315650;
    *(void *)&v10[4] = "-[AVPictureInPicturePlatformAdapter stopPictureInPictureAndRestoreUserInterface:]";
    *(void *)&v10[14] = "shouldRestore";
    *(_WORD *)&v10[12] = 2080;
    if (v3) {
      int v6 = "YES";
    }
    *(_WORD *)&v10[22] = 2080;
    __int16 v11 = v6;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %s %s", v10, 0x20u);
  }

  if (v3)
  {
    if (!-[AVPictureInPicturePlatformAdapter _sceneActivationState](self))
    {
      [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:6];
      uint64_t v7 = 1;
      goto LABEL_12;
    }
    uint64_t v7 = -[AVPictureInPicturePlatformAdapter _sceneActivationState](self);
    [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:6];
    if (v7 == 1) {
      goto LABEL_12;
    }
  }
  else
  {
    [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:6];
  }
  __int16 v8 = [(AVPictureInPicturePlatformAdapter *)self delegate];
  [v8 pictureInPicturePlatformAdapterPrepareToStopForDismissal:self];

  uint64_t v7 = 0;
LABEL_12:
  [(AVPictureInPicturePlatformAdapter *)self updateLayoutDependentBehaviors];
  __int16 v9 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
  [v9 stopPictureInPictureAndRestoreUserInterface:v7];
}

- (void)startPictureInPicture
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    uint64_t v12 = -[AVPictureInPicturePlatformAdapter _sceneActivationState](self);
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "_sceneActivationState == %ld for start pictureinpicture", buf, 0xCu);
  }

  if (-[AVPictureInPicturePlatformAdapter _sceneActivationState](self))
  {
    id v4 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F28588];
    v9[0] = *MEMORY[0x1E4F28568];
    v9[1] = v5;
    v10[0] = @"Failed to start picture in picture.";
    v10[1] = @"The UIScene for the content source has an activation state other than UISceneActivationStateForegroundActive, which is not allowed.";
    int v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:2];
    uint64_t v7 = [v4 errorWithDomain:@"AVKitErrorDomain" code:-1001 userInfo:v6];

    __int16 v8 = [(AVPictureInPicturePlatformAdapter *)self delegate];
    [v8 pictureInPicturePlatformAdapter:self failedToStartError:v7];
  }
  else
  {
    [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:2];
    uint64_t v7 = [(AVPictureInPicturePlatformAdapter *)self pegasusProxy];
    [v7 startPictureInPicture];
  }
}

- (void)dealloc
{
  [(AVPictureInPicturePlatformAdapter *)self _removeSecondScreenConnection];
  [(NSTimer *)self->_layoutCheckTimer invalidate];
  [(AVObservationController *)self->_observationController stopAllObservation];
  observationController = self->_observationController;
  self->_observationController = 0;

  v4.receiver = self;
  v4.super_class = (Class)AVPictureInPicturePlatformAdapter;
  [(AVPictureInPicturePlatformAdapter *)&v4 dealloc];
}

- (AVPictureInPicturePlatformAdapter)initWithSource:(id)a3
{
  v18[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)AVPictureInPicturePlatformAdapter;
  uint64_t v5 = [(AVPictureInPicturePlatformAdapter *)&v17 init];
  if (v5)
  {
    if (dyld_program_sdk_at_least()) {
      char v6 = 0;
    }
    else {
      char v6 = _os_feature_enabled_impl() ^ 1;
    }
    v5->_requiresLinearPlayback = v6;
    objc_storeWeak((id *)&v5->_source, v4);
    uint64_t v7 = objc_msgSend(v4, "avkit_pictureInPictureViewController");
    __int16 v8 = v7;
    if (v7) {
      __int16 v9 = v7;
    }
    else {
      __int16 v9 = [[AVPictureInPictureViewController alloc] initWithPictureInPicturePlayerLayerView:0];
    }
    pictureInPictureViewController = v5->_pictureInPictureViewController;
    v5->_pictureInPictureViewController = v9;

    [(AVPictureInPictureViewController *)v5->_pictureInPictureViewController setDelegate:v5];
    v5->_controlsStyle = 0;
    __int16 v11 = [[AVObservationController alloc] initWithOwner:v5];
    observationController = v5->_observationController;
    v5->_observationController = v11;

    *(_WORD *)&v5->_canStartAutomaticallyWhenEnteringBackground = 257;
    uint64_t v13 = [(AVPictureInPicturePlatformAdapter *)v5 observationController];
    v18[0] = @"playerController.pictureInPicturePossible";
    v18[1] = @"playerController.playingOnSecondScreen";
    double v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:2];
    id v15 = (id)[v13 startObserving:v5 keyPaths:v14 observationHandler:&__block_literal_global_21];
  }
  return v5;
}

uint64_t __52__AVPictureInPicturePlatformAdapter_initWithSource___block_invoke(uint64_t a1, void *a2)
{
  return [a2 _setupPipAdapter];
}

- (BOOL)isContentSourceSupported
{
  unint64_t v2 = [(AVPictureInPicturePlatformAdapter *)self source];
  unint64_t v3 = objc_msgSend(v2, "avkit_contentSourceType");

  return v3 < 4;
}

+ (UIImageSymbolConfiguration)imageSymbolConfiguration
{
  unint64_t v2 = [MEMORY[0x1E4FB08E0] preferredFontForTextStyle:*MEMORY[0x1E4FB28C8]];
  [v2 pointSize];
  double v4 = v3;

  uint64_t v5 = (void *)MEMORY[0x1E4FB1830];

  return (UIImageSymbolConfiguration *)[v5 configurationWithPointSize:4 weight:v4];
}

+ (NSString)stopPictureInPictureButtonImageName
{
  unint64_t v2 = @"pip.exit";
  return (NSString *)@"pip.exit";
}

+ (NSString)startPictureInPictureButtonImageName
{
  unint64_t v2 = @"pip.enter";
  return (NSString *)@"pip.enter";
}

- (void)_setRoutingVideoToHostedWindow:(BOOL)a3 pictureInPictureViewController:(id)a4 source:(id)a5
{
  BOOL v6 = a3;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  __int16 v10 = v9;
  if (v6) {
    objc_msgSend(v9, "avkit_startRoutingVideoToPictureInPictureViewController:", v8);
  }
  else {
    objc_msgSend(v9, "avkit_stopRoutingVideoToPictureInPictureViewController:", v8);
  }
  __int16 v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = "NO";
    int v13 = 136315650;
    double v14 = "-[AVPictureInPicturePlatformAdapter(Common) _setRoutingVideoToHostedWindow:pictureInPictureViewController:source:]";
    id v16 = "shouldRoute";
    __int16 v15 = 2080;
    if (v6) {
      uint64_t v12 = "YES";
    }
    __int16 v17 = 2080;
    uint64_t v18 = v12;
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s %s %s", (uint8_t *)&v13, 0x20u);
  }

  [(AVPictureInPicturePlatformAdapter *)self setRoutingVideoToHostedWindow:v6];
}

- (void)_updateStatusUsingProposedStatus:(int64_t)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  BOOL v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v55 = "-[AVPictureInPicturePlatformAdapter(Common) _updateStatusUsingProposedStatus:]";
    __int16 v56 = 2048;
    v57 = [(AVPictureInPicturePlatformAdapter *)self status];
    __int16 v58 = 2048;
    int64_t v59 = a3;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s current status: %ld -> proposed status: %ld", buf, 0x20u);
  }

  int64_t v7 = [(AVPictureInPicturePlatformAdapter *)self status];
  if (![(AVPictureInPicturePlatformAdapter *)self isContentSourceSupported])
  {
    int v10 = 1;
    goto LABEL_12;
  }
  id v8 = [(AVPictureInPicturePlatformAdapter *)self playerController];
  if ([v8 isPictureInPicturePossible]
    && [(AVPictureInPicturePlatformAdapter *)self isSystemPictureInPicturePossible]
    && [(AVPictureInPicturePlatformAdapter *)self allowsPictureInPicturePlayback])
  {
    id v9 = [(AVPictureInPicturePlatformAdapter *)self playerController];
    if ([v9 isPlayingOnSecondScreen])
    {
      int v10 = 1;
LABEL_75:

      goto LABEL_11;
    }
    if (v7 == 1)
    {
      double v3 = [(AVPictureInPicturePlatformAdapter *)self source];
      if (!objc_msgSend(v3, "avkit_isVisible"))
      {
        int v10 = 1;
        goto LABEL_74;
      }
    }
    if ((unint64_t)a3 > 1)
    {
      unint64_t v37 = a3;
      int v38 = 0;
      int v39 = 0;
    }
    else
    {
      CGRect v36 = [(AVPictureInPicturePlatformAdapter *)self playerController];
      [v36 contentDimensions];
      if (CGFloatIsValid())
      {
        v52 = v36;
        unint64_t v37 = a3;
        int v38 = 0;
        int v39 = 0;
      }
      else
      {
        __int16 v40 = [(AVPictureInPicturePlatformAdapter *)self playerController];
        [v40 contentDimensions];
        if (CGFloatIsValid())
        {
          v50 = v40;
          v52 = v36;
          unint64_t v37 = a3;
          int v39 = 0;
          int v38 = 1;
        }
        else
        {
          uint64_t v41 = [(AVPictureInPicturePlatformAdapter *)self playerController];
          [v41 contentDimensions];
          if (*MEMORY[0x1E4F1DB30] != v43 || *(double *)(MEMORY[0x1E4F1DB30] + 8) != v42)
          {

            int v10 = 1;
            goto LABEL_71;
          }
          v48 = v41;
          v50 = v40;
          v52 = v36;
          unint64_t v37 = a3;
          int v38 = 1;
          int v39 = 1;
        }
      }
    }
    int v10 = [(id)objc_opt_class() isPictureInPictureSupported] ^ 1;
    if (v39)
    {

      if ((v38 & 1) == 0) {
        goto LABEL_66;
      }
    }
    else if (!v38)
    {
LABEL_66:
      a3 = v37;
      if (v37 > 1)
      {
LABEL_71:
        if (v7 != 1) {
          goto LABEL_75;
        }
LABEL_74:

        goto LABEL_75;
      }
LABEL_70:

      goto LABEL_71;
    }

    a3 = v37;
    if (v37 >= 2) {
      goto LABEL_71;
    }
    goto LABEL_70;
  }
  int v10 = 1;
LABEL_11:

LABEL_12:
  __int16 v11 = _AVLog();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v10) {
      uint64_t v12 = "YES";
    }
    else {
      uint64_t v12 = "NO";
    }
    v49 = v12;
    if ([(AVPictureInPicturePlatformAdapter *)self isContentSourceSupported]) {
      int v13 = "YES";
    }
    else {
      int v13 = "NO";
    }
    v47 = v13;
    v51 = [(AVPictureInPicturePlatformAdapter *)self playerController];
    if ([v51 isPictureInPicturePossible]) {
      double v14 = "YES";
    }
    else {
      double v14 = "NO";
    }
    v46 = v14;
    if ([(AVPictureInPicturePlatformAdapter *)self isSystemPictureInPicturePossible]) {
      __int16 v15 = "YES";
    }
    else {
      __int16 v15 = "NO";
    }
    v45 = v15;
    if ([(AVPictureInPicturePlatformAdapter *)self allowsPictureInPicturePlayback]) {
      id v16 = "YES";
    }
    else {
      id v16 = "NO";
    }
    v44 = v16;
    __int16 v17 = [(AVPictureInPicturePlatformAdapter *)self playerController];
    int64_t v18 = a3;
    if ([v17 isPlayingOnSecondScreen]) {
      uint64_t v19 = "YES";
    }
    else {
      uint64_t v19 = "NO";
    }
    double v20 = [(AVPictureInPicturePlatformAdapter *)self source];
    if (objc_msgSend(v20, "avkit_isVisible")) {
      __int16 v21 = "YES";
    }
    else {
      __int16 v21 = "NO";
    }
    [(AVPictureInPicturePlatformAdapter *)self playerController];
    double v22 = v53 = v10;
    [v22 contentDimensions];
    uint64_t v24 = v23;
    double v25 = [(AVPictureInPicturePlatformAdapter *)self playerController];
    [v25 contentDimensions];
    uint64_t v27 = v26;
    int v28 = [(id)objc_opt_class() isPictureInPictureSupported];
    *(_DWORD *)buf = 136317698;
    CGFloat v29 = "YES";
    if (!v28) {
      CGFloat v29 = "NO";
    }
    v55 = "-[AVPictureInPicturePlatformAdapter(Common) _updateStatusUsingProposedStatus:]";
    __int16 v56 = 2080;
    v57 = v49;
    __int16 v58 = 2080;
    int64_t v59 = (int64_t)v47;
    __int16 v60 = 2080;
    v61 = v46;
    __int16 v62 = 2080;
    v63 = v45;
    __int16 v64 = 2080;
    v65 = v44;
    __int16 v66 = 2080;
    v67 = v19;
    a3 = v18;
    __int16 v68 = 2080;
    v69 = v21;
    __int16 v70 = 2048;
    uint64_t v71 = v24;
    __int16 v72 = 2048;
    uint64_t v73 = v27;
    __int16 v74 = 2080;
    v75 = v29;
    _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s isPictureInPictureProhibited: %s {\n\tisContentSourceSupported: %s\n\tisPictureInPicturePossible: %s\n\tisSystemPictureInPicturePossible: %s\n\tallowsPictureInPicturePlayback: %s\n\tisPlayingOnSecondScreen: %s\n\tsourceIsVisible: %s\n\tcontentDimensions: (%.01f, %.01f)\n\tisPictureInPictureSupported: %s\n}", buf, 0x70u);

    int v10 = v53;
  }

  if (a3 == 7)
  {
    [(AVPictureInPicturePlatformAdapter *)self _setStatusAndNotifyDelegateIfNeeded:7];
    [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:v10 ^ 1u];
    goto LABEL_52;
  }
  char v30 = v10 ^ 1;
  if (a3 == 6) {
    char v30 = 1;
  }
  if (v30)
  {
    if (a3 <= 1) {
      int64_t v32 = 1;
    }
    else {
      int64_t v32 = a3;
    }
    CGRect v33 = self;
    goto LABEL_51;
  }
  int64_t v31 = [(AVPictureInPicturePlatformAdapter *)self status];
  if ((unint64_t)(v31 - 2) < 4)
  {
    [(AVPictureInPicturePlatformAdapter *)self stopPictureInPictureAndRestoreUserInterface:[(AVPictureInPicturePlatformAdapter *)self canAnimatePictureInPictureTransition]];
    goto LABEL_52;
  }
  if (v31 == 7 || v31 == 1)
  {
    CGRect v33 = self;
    int64_t v32 = 0;
LABEL_51:
    [(AVPictureInPicturePlatformAdapter *)v33 _setStatusAndNotifyDelegateIfNeeded:v32];
  }
LABEL_52:
  CGRect v34 = _AVLog();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
  {
    if ([(AVPictureInPicturePlatformAdapter *)self status]) {
      CGRect v35 = "YES";
    }
    else {
      CGRect v35 = "NO";
    }
    *(_DWORD *)buf = 136315650;
    v55 = "-[AVPictureInPicturePlatformAdapter(Common) _updateStatusUsingProposedStatus:]";
    __int16 v56 = 2080;
    v57 = "self.status != AVPictureInPictureControllerStatusProhibited";
    __int16 v58 = 2080;
    int64_t v59 = (int64_t)v35;
    _os_log_impl(&dword_1B05B7000, v34, OS_LOG_TYPE_DEFAULT, "%s %s %s", buf, 0x20u);
  }
}

- (void)_updateStatus
{
  int64_t v3 = [(AVPictureInPicturePlatformAdapter *)self status];

  [(AVPictureInPicturePlatformAdapter *)self _updateStatusUsingProposedStatus:v3];
}

- (void)_setStatusAndNotifyDelegateIfNeeded:(int64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(AVPictureInPicturePlatformAdapter *)self status] != a3)
  {
    uint64_t v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      id v9 = "-[AVPictureInPicturePlatformAdapter(Common) _setStatusAndNotifyDelegateIfNeeded:]";
      __int16 v10 = 2048;
      int64_t v11 = a3;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s  newStatus: %ld", (uint8_t *)&v8, 0x16u);
    }

    int64_t v6 = [(AVPictureInPicturePlatformAdapter *)self status];
    [(AVPictureInPicturePlatformAdapter *)self setStatus:a3];
    int64_t v7 = [(AVPictureInPicturePlatformAdapter *)self delegate];
    [v7 pictureInPicturePlatformAdapter:self statusDidChange:a3 fromStatus:v6];
  }
}

@end