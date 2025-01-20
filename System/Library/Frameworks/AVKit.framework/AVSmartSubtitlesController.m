@interface AVSmartSubtitlesController
- (AVObservationController)smartSubtitlesControllerKVO;
- (AVPlayerController)playerController;
- (AVSmartSubtitlesController)init;
- (AVSmartSubtitlesControllerDelegate)delegate;
- (BOOL)_toggleCaptions:(BOOL)a3;
- (BOOL)didToggleCaptionsOn;
- (BOOL)isSubtitlesOnMuteActive;
- (BOOL)playerMuted;
- (BOOL)smartSubtitlesActive;
- (double)currentSkipBackTimeInterval;
- (double)lastSeekTime;
- (double)skipBackSeekDelta;
- (double)timeOfSeekStart;
- (id)playerTimeObserver;
- (int64_t)state;
- (void)__transitionToDisplayingCaptionsIfAble;
- (void)_performSkipBackDelegateCallback;
- (void)_setPlayerTimeObserver:(id *)a1;
- (void)_updateSubtitlesOnMuteIfNeeded;
- (void)dealloc;
- (void)invalidate;
- (void)setCurrentSkipBackTimeInterval:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDidToggleCaptionsOn:(BOOL)a3;
- (void)setLastSeekTime:(double)a3;
- (void)setPlayerController:(id)a3;
- (void)setPlayerMuted:(BOOL)a3;
- (void)setPlayerTimeObserver:(id)a3;
- (void)setSkipBackSeekDelta:(double)a3;
- (void)setSmartSubtitlesControllerKVO:(id)a3;
- (void)setState:(int64_t)a3;
- (void)setSubtitlesOnMuteActive:(BOOL)a3;
- (void)setTimeOfSeekStart:(double)a3;
- (void)updatePlayerVolumeToPlayerMuted:(BOOL)a3;
- (void)userRequestedSeekWithTimeInterval:(double)a3;
- (void)userRequestedSmartSubtitlesHiddenIfActive;
@end

@implementation AVSmartSubtitlesController

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)setPlayerController:(id)a3
{
  v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    v14 = v5;
    [(AVObservationController *)self->_smartSubtitlesControllerKVO stopAllObservation];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
    [(AVSmartSubtitlesController *)self setState:0];
    objc_storeStrong((id *)&self->_playerController, a3);
    v5 = v14;
    if (v14)
    {
      v7 = [(AVSmartSubtitlesController *)self smartSubtitlesControllerKVO];
      id v8 = (id)[v7 startObserving:self keyPath:@"playerController.timeControlStatus" observationHandler:&__block_literal_global_19417];
      id v9 = (id)[v7 startObserving:self keyPath:@"playerController.player.currentItem" observationHandler:&__block_literal_global_17_19419];
      id v10 = (id)[v7 startObserving:self keyPath:@"playerController.currentLegibleMediaSelectionOption" includeInitialValue:0 observationHandler:&__block_literal_global_24_19421];
      v11 = +[AVKitGlobalSettings shared];
      char v12 = [v11 showsTVControls];

      if ((v12 & 1) == 0)
      {
        id v13 = (id)[v7 startObserving:self keyPath:@"playerController.currentAssetIfReady" includeInitialValue:0 observationHandler:&__block_literal_global_31];
        [v7 startObservingNotificationForName:*MEMORY[0x1E4FB90C0] object:0 notificationCenter:0 observationHandler:&__block_literal_global_35_19423];
      }
      [v7 startObservingNotificationForName:*MEMORY[0x1E4FB90B8] object:0 notificationCenter:0 observationHandler:&__block_literal_global_39_19424];

      v5 = v14;
    }
  }
}

- (AVObservationController)smartSubtitlesControllerKVO
{
  return self->_smartSubtitlesControllerKVO;
}

- (void)setState:(int64_t)a3
{
  v20[3] = *(id *)MEMORY[0x1E4F143B8];
  if (self->_state != a3)
  {
    self->_state = a3;
    switch(a3)
    {
      case 0:
        [(AVSmartSubtitlesController *)self setCurrentSkipBackTimeInterval:0.0];
        [(AVSmartSubtitlesController *)self setLastSeekTime:0.0];
        -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, 0);
        [(AVSmartSubtitlesController *)self setSkipBackSeekDelta:0.0];
        [(AVSmartSubtitlesController *)self setTimeOfSeekStart:0.0];
        [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___transitionToDisplayingCaptionsIfAble object:0];
        if ([(AVSmartSubtitlesController *)self didToggleCaptionsOn]) {
          [(AVSmartSubtitlesController *)self _toggleCaptions:0];
        }
        [(AVSmartSubtitlesController *)self setDidToggleCaptionsOn:0];
        v4 = _AVLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSkipBackSmartSubtitleStateIdle: Controller is idle", buf, 0xCu);
        }
        goto LABEL_13;
      case 1:
        [(AVSmartSubtitlesController *)self setCurrentSkipBackTimeInterval:0.0];
        -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, 0);
        [(AVPlayerController *)self->_playerController currentTime];
        -[AVSmartSubtitlesController setTimeOfSeekStart:](self, "setTimeOfSeekStart:");
        v4 = _AVLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSkipBackSmartSubtitleStatePreparing", buf, 0xCu);
        }
        goto LABEL_13;
      case 2:
        v4 = _AVLog();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315138;
          *(void *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSkipBackSmartSubtitleStateWaitingForPlayback", buf, 0xCu);
        }
LABEL_13:

        return;
      case 3:
        double timeOfSeekStart = self->_timeOfSeekStart;
        [(AVPlayerController *)self->_playerController currentTime];
        double v7 = v6;
        double v8 = vabdd_f64(timeOfSeekStart, v6);
        if (v8 >= INFINITY && v8 <= INFINITY)
        {
          id v9 = _AVLog();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(void *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
            _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s Delta received is an invalid value, resetting controller to idle", buf, 0xCu);
          }
LABEL_18:

          [(AVSmartSubtitlesController *)self setState:0];
          return;
        }
        id v9 = _AVLog();
        BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
        if (timeOfSeekStart - v7 <= 0.0)
        {
          if (v10)
          {
            *(_DWORD *)buf = 136315394;
            *(void *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
            *(_WORD *)&buf[12] = 2048;
            *(double *)&buf[14] = timeOfSeekStart - v7;
            _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s Received a skip-forward or zero delta of %f, resetting controller to idle", buf, 0x16u);
          }
          goto LABEL_18;
        }
        if (v10)
        {
          *(_DWORD *)buf = 136315650;
          *(void *)&buf[4] = "-[AVSmartSubtitlesController _handleUpdatedState:]";
          *(_WORD *)&buf[12] = 2048;
          *(double *)&buf[14] = v7;
          *(_WORD *)&buf[22] = 2048;
          double v19 = timeOfSeekStart;
          _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "%s Seek backwards finished with success, enabling captions from %f to %f", buf, 0x20u);
        }

        objc_initWeak(&location, self);
        v11 = [(AVSmartSubtitlesController *)self playerController];
        char v12 = [v11 player];
        CMTimeMakeWithSeconds(&v16, 0.5, 1000000000);
        id v13 = MEMORY[0x1E4F14428];
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __50__AVSmartSubtitlesController__handleUpdatedState___block_invoke;
        double v19 = COERCE_DOUBLE(&unk_1E5FC3DA0);
        objc_copyWeak(v20, &location);
        v20[1] = *(id *)&timeOfSeekStart;
        v14 = [v12 addPeriodicTimeObserverForInterval:&v16 queue:MEMORY[0x1E4F14428] usingBlock:buf];

        -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, v14);
        BOOL v15 = [(AVSmartSubtitlesController *)self _toggleCaptions:1];
        [(AVSmartSubtitlesController *)self setSkipBackSeekDelta:timeOfSeekStart - v7];
        if (!v15
          && [(AVSmartSubtitlesController *)self didToggleCaptionsOn]
          && [(AVPlayerController *)self->_playerController isDisplayingNonForcedOnlyLegibleOption])
        {
          [(AVSmartSubtitlesController *)self _performSkipBackDelegateCallback];
        }
        if (![(AVSmartSubtitlesController *)self didToggleCaptionsOn]) {
          [(AVSmartSubtitlesController *)self setDidToggleCaptionsOn:v15];
        }

        objc_destroyWeak(v20);
        objc_destroyWeak(&location);
        break;
      default:
        return;
    }
  }
}

- (void)setDelegate:(id)a3
{
}

- (AVSmartSubtitlesController)init
{
  v6.receiver = self;
  v6.super_class = (Class)AVSmartSubtitlesController;
  v2 = [(AVSmartSubtitlesController *)&v6 init];
  if (v2)
  {
    v3 = [[AVObservationController alloc] initWithOwner:v2];
    smartSubtitlesControllerKVO = v2->_smartSubtitlesControllerKVO;
    v2->_smartSubtitlesControllerKVO = v3;

    v2->_subtitlesOnMuteActive = 0;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_playerTimeObserver, 0);
  objc_storeStrong((id *)&self->_smartSubtitlesControllerKVO, 0);
  objc_storeStrong((id *)&self->_playerController, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setPlayerMuted:(BOOL)a3
{
  self->_playerMuted = a3;
}

- (BOOL)playerMuted
{
  return self->_playerMuted;
}

- (void)setDidToggleCaptionsOn:(BOOL)a3
{
  self->_didToggleCaptionsOn = a3;
}

- (BOOL)didToggleCaptionsOn
{
  return self->_didToggleCaptionsOn;
}

- (void)setPlayerTimeObserver:(id)a3
{
}

- (id)playerTimeObserver
{
  return self->_playerTimeObserver;
}

- (void)setSmartSubtitlesControllerKVO:(id)a3
{
}

- (int64_t)state
{
  return self->_state;
}

- (void)setTimeOfSeekStart:(double)a3
{
  self->_double timeOfSeekStart = a3;
}

- (double)timeOfSeekStart
{
  return self->_timeOfSeekStart;
}

- (void)setSkipBackSeekDelta:(double)a3
{
  self->_skipBackSeekDelta = a3;
}

- (double)skipBackSeekDelta
{
  return self->_skipBackSeekDelta;
}

- (void)setLastSeekTime:(double)a3
{
  self->_lastSeekTime = a3;
}

- (double)lastSeekTime
{
  return self->_lastSeekTime;
}

- (void)setCurrentSkipBackTimeInterval:(double)a3
{
  self->_currentSkipBackTimeInterval = a3;
}

- (double)currentSkipBackTimeInterval
{
  return self->_currentSkipBackTimeInterval;
}

- (void)setSubtitlesOnMuteActive:(BOOL)a3
{
  self->_subtitlesOnMuteActive = a3;
}

- (BOOL)isSubtitlesOnMuteActive
{
  return self->_subtitlesOnMuteActive;
}

- (AVSmartSubtitlesControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVSmartSubtitlesControllerDelegate *)WeakRetained;
}

- (BOOL)_toggleCaptions:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = [(AVSmartSubtitlesController *)self playerController];
  [v4 setMediaOptionCriteriaAlwaysOn:v3];

  return v3;
}

- (void)__transitionToDisplayingCaptionsIfAble
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVSmartSubtitlesController *)self playerController];
  v4 = v3;
  if (self->_currentSkipBackTimeInterval > 30.0)
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      double currentSkipBackTimeInterval = self->_currentSkipBackTimeInterval;
      int v13 = 136315394;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      __int16 v15 = 2048;
      double v16 = currentSkipBackTimeInterval;
      double v7 = "%s Skip back interval of %f exceeds the max, setting controller back to idle";
      double v8 = v5;
      uint32_t v9 = 22;
LABEL_11:
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v13, v9);
      goto LABEL_12;
    }
    goto LABEL_12;
  }
  if (![v3 isPlaying])
  {
    v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v13 = 136315138;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      double v7 = "%s Skip back performed, but the player is paused, setting controller back to idle";
      double v8 = v5;
      uint32_t v9 = 12;
      goto LABEL_11;
    }
LABEL_12:
    uint64_t v12 = 0;
    goto LABEL_13;
  }
  uint64_t v10 = [v4 timeControlStatus];
  v5 = _AVLog();
  BOOL v11 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v10 == 1)
  {
    if (v11)
    {
      int v13 = 136315138;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip back performed, waiting for playback to resume to display captions", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v12 = 2;
  }
  else
  {
    if (v11)
    {
      int v13 = 136315138;
      v14 = "-[AVSmartSubtitlesController __transitionToDisplayingCaptionsIfAble]";
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s Skip back performed, playback is in progress", (uint8_t *)&v13, 0xCu);
    }
    uint64_t v12 = 3;
  }
LABEL_13:

  [(AVSmartSubtitlesController *)self setState:v12];
}

- (void)_performSkipBackDelegateCallback
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(AVSmartSubtitlesController *)self delegate];
  [(AVSmartSubtitlesController *)self skipBackSeekDelta];
  double v5 = v4;
  if (fabs(v4) != INFINITY && v3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_super v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 136315138;
      double v8 = "-[AVSmartSubtitlesController _performSkipBackDelegateCallback]";
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Captions were toggled in response to a skip back, notifying delegate", (uint8_t *)&v7, 0xCu);
    }

    [v3 smartSubtitlesController:self didToggleSubtitlesOnSkipBackForTimeInterval:v5];
  }
}

- (void)userRequestedSmartSubtitlesHiddenIfActive
{
  if ([(AVSmartSubtitlesController *)self smartSubtitlesActive])
  {
    [(AVSmartSubtitlesController *)self setState:0];
    [(AVSmartSubtitlesController *)self setSubtitlesOnMuteActive:0];
    -[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded](self);
  }
}

- (void)_updateSubtitlesOnMuteIfNeeded
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    v1 = result;
    v2 = [result playerController];
    uint64_t v3 = [v2 captionAppearanceDisplayType];

    double v4 = [v1 delegate];
    char v5 = objc_opt_respondsToSelector();

    if (v5)
    {
      objc_super v6 = [v1 delegate];
      int v7 = [v6 observesMediaSelectionForSmartSubtitlesController:v1];

      int v8 = v7 ^ 1;
    }
    else
    {
      int v8 = 0;
    }
    uint64_t v9 = +[AVKitGlobalSettings shared];
    int v10 = [v9 subtitlesOnMuteEnabled];

    if (v10 && !v8)
    {
      if ([v1 state] == 3 || v3 != 2 || (objc_msgSend(v1, "isSubtitlesOnMuteActive") & 1) != 0)
      {
        result = (void *)[v1 playerMuted];
        if (!result) {
          return result;
        }
        BOOL v11 = _AVLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315138;
          __int16 v15 = "-[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded]";
          _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s Enable subtitles on mute", (uint8_t *)&v14, 0xCu);
        }
        uint64_t v12 = 1;
      }
      else
      {
        BOOL v11 = _AVLog();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          int v14 = 136315138;
          __int16 v15 = "-[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded]";
          _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "%s Disable subtitles: skip back captions are not displaying and 'subtitles on mute' setting is not enabled", (uint8_t *)&v14, 0xCu);
        }
        uint64_t v12 = 0;
      }

      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:v1 selector:sel___transitionToDisplayingCaptionsIfAble object:0];
      [v1 setDidToggleCaptionsOn:0];
      [v1 setState:0];
      [v1 setSubtitlesOnMuteActive:v12];
      return (void *)[v1 _toggleCaptions:v12];
    }
    int v13 = _AVLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 136315138;
      __int16 v15 = "-[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded]";
      _os_log_impl(&dword_1B05B7000, v13, OS_LOG_TYPE_DEFAULT, "%s Disable subtitles: accessibility mute settings or display option media options disabled", (uint8_t *)&v14, 0xCu);
    }

    result = (void *)[v1 setSubtitlesOnMuteActive:0];
    uint64_t v12 = 0;
    if (v3 == 2) {
      return (void *)[v1 _toggleCaptions:v12];
    }
  }
  return result;
}

- (void)userRequestedSeekWithTimeInterval:(double)a3
{
  char v5 = [(AVSmartSubtitlesController *)self delegate];
  char v6 = objc_opt_respondsToSelector();

  if (v6)
  {
    int v7 = [(AVSmartSubtitlesController *)self delegate];
    char v8 = [v7 observesMediaSelectionForSmartSubtitlesController:self];

    char v9 = v8 ^ 1;
  }
  else
  {
    char v9 = 0;
  }
  if (![(AVSmartSubtitlesController *)self isSubtitlesOnMuteActive] && (v9 & 1) == 0)
  {
    int v10 = +[AVKitGlobalSettings shared];
    int v11 = [v10 skipBackCaptionsEnabled];

    if (v11)
    {
      uint64_t v12 = [(AVSmartSubtitlesController *)self playerController];
      int v13 = [v12 hasLegibleMediaSelectionOptions];

      if (fabs(a3) != INFINITY)
      {
        if (v13)
        {
          [(AVSmartSubtitlesController *)self setState:1];
          self->_double currentSkipBackTimeInterval = self->_currentSkipBackTimeInterval - a3;
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___transitionToDisplayingCaptionsIfAble object:0];
          [(AVSmartSubtitlesController *)self performSelector:sel___transitionToDisplayingCaptionsIfAble withObject:0 afterDelay:1.25];
        }
      }
    }
  }
}

- (void)updatePlayerVolumeToPlayerMuted:(BOOL)a3
{
  BOOL v3 = a3;
  -[AVSmartSubtitlesController setPlayerMuted:](self, "setPlayerMuted:");
  [(AVSmartSubtitlesController *)self setSubtitlesOnMuteActive:v3];

  -[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded](self);
}

- (BOOL)smartSubtitlesActive
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[AVKitGlobalSettings shared];
  uint64_t v3 = [v2 subtitleAutomaticallyEnabledState];

  double v4 = _AVLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    char v5 = "YES";
    if (!v3) {
      char v5 = "NO";
    }
    int v7 = 136315394;
    char v8 = "-[AVSmartSubtitlesController smartSubtitlesActive]";
    __int16 v9 = 2082;
    int v10 = v5;
    _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s AVSubtitleAutomaticallyEnabledState:%{public}s", (uint8_t *)&v7, 0x16u);
  }

  return v3 != 0;
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_3_37(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__AVSmartSubtitlesController__startObservations__block_invoke_4;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_4(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    v2 = _AVLog();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      char v5 = "-[AVSmartSubtitlesController _handleShowOnSkipBackNotification]";
      _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "%s Skip back user preference changed, ensuring state is set to idle", buf, 0xCu);
    }

    [v3 setState:0];
    id WeakRetained = v3;
  }
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_32(uint64_t a1, void *a2)
{
  objc_initWeak(&location, a2);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __48__AVSmartSubtitlesController__startObservations__block_invoke_2_36;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_2_36(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    -[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded](WeakRetained);
    id WeakRetained = v2;
  }
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_29(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  int v7 = [v5 delegate];
  char v8 = objc_opt_respondsToSelector();

  if (v8)
  {
    __int16 v9 = [v5 delegate];
    char v10 = [v9 observesMediaSelectionForSmartSubtitlesController:v5];

    char v11 = v10 ^ 1;
  }
  else
  {
    char v11 = 0;
  }
  uint64_t v12 = +[AVKitGlobalSettings shared];
  if ([v12 subtitlesOnMuteEnabled]
    && (v11 & 1) == 0
    && ([v6 value], (uint64_t v13 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    int v14 = (void *)v13;
    __int16 v15 = [v6 value];
    uint64_t v16 = [v6 oldValue];

    if (v15 != v16)
    {
      uint64_t v17 = _AVLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        if ([v5 playerMuted]) {
          v18 = "YES";
        }
        else {
          v18 = "NO";
        }
        int v20 = 136315650;
        v21 = "-[AVSmartSubtitlesController _startObservations]_block_invoke";
        if ([v5 isSubtitlesOnMuteActive]) {
          double v19 = "YES";
        }
        else {
          double v19 = "NO";
        }
        __int16 v22 = 2082;
        v23 = v18;
        __int16 v24 = 2082;
        v25 = v19;
        _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "%s Asset is ready, player mute:%{public}s and subtitle mute active:%{public}s state", (uint8_t *)&v20, 0x20u);
      }

      -[AVSmartSubtitlesController _updateSubtitlesOnMuteIfNeeded](v5);
    }
  }
  else
  {
  }
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_21(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a4;
  int v7 = [v6 oldValue];
  char v8 = [v6 value];

  __int16 v9 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
  if (v7 == v9)
  {
    BOOL v11 = 1;
  }
  else
  {
    char v10 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
    BOOL v11 = v7 == v10;
  }
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_autoOption");
  if (v8 == v12)
  {
    BOOL v14 = 1;
  }
  else
  {
    uint64_t v13 = objc_msgSend(MEMORY[0x1E4F16540], "avkit_offOption");
    BOOL v14 = v8 == v13;
  }
  if ([v5 state] != 3) {
    goto LABEL_18;
  }
  __int16 v15 = [v5 playerController];
  if ([v15 timeControlStatus] != 2 || (objc_msgSend(v7, "isEqual:", v8) & 1) != 0)
  {

    goto LABEL_11;
  }

  if (v11)
  {
    BOOL v11 = 1;
LABEL_11:
    if ((([v5 didToggleCaptionsOn] & v11 ^ 1 | v14) & 1) == 0) {
      [v5 _performSkipBackDelegateCallback];
    }
    goto LABEL_18;
  }
  uint64_t v16 = _AVLog();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    int v17 = 136315138;
    v18 = "-[AVSmartSubtitlesController _startObservations]_block_invoke";
    _os_log_impl(&dword_1B05B7000, v16, OS_LOG_TYPE_DEFAULT, "%s Captions were changed while we were displaying them, resetting controller to idle", (uint8_t *)&v17, 0xCu);
  }

  [v5 setDidToggleCaptionsOn:0];
  [v5 setState:0];
LABEL_18:
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  if ([v2 state])
  {
    id v3 = _AVLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      int v4 = 136315138;
      id v5 = "-[AVSmartSubtitlesController _startObservations]_block_invoke_3";
      _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s Player item changed, resetting state to idle", (uint8_t *)&v4, 0xCu);
    }

    [v2 setState:0];
  }
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__AVSmartSubtitlesController__startObservations__block_invoke_2;
  block[3] = &unk_1E5FC4698;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

void __48__AVSmartSubtitlesController__startObservations__block_invoke_2(uint64_t a1)
{
  id v2 = +[AVKitGlobalSettings shared];
  int v3 = [v2 skipBackCaptionsEnabled];

  if (v3)
  {
    uint64_t v4 = [*(id *)(a1 + 32) state];
    id v5 = [*(id *)(a1 + 32) playerController];
    uint64_t v6 = [v5 timeControlStatus];

    if (v6 == 2 && v4 == 2)
    {
      uint64_t v8 = 3;
    }
    else
    {
      if (v6) {
        return;
      }
      uint64_t v8 = 0;
    }
    __int16 v9 = *(void **)(a1 + 32);
    [v9 setState:v8];
  }
}

- (void)_setPlayerTimeObserver:(id *)a1
{
  id v6 = a2;
  if (a1)
  {
    if (a1[10])
    {
      uint64_t v4 = [a1 playerController];
      id v5 = [v4 player];
      [v5 removeTimeObserver:a1[10]];
    }
    objc_storeStrong(a1 + 10, a2);
  }
}

void __50__AVSmartSubtitlesController__handleUpdatedState___block_invoke(uint64_t a1, CMTime *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  CMTime v9 = *a2;
  double Seconds = CMTimeGetSeconds(&v9);
  if (WeakRetained)
  {
    double v6 = Seconds;
    if (Seconds >= *(double *)(a1 + 40))
    {
      int v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v8 = *(void *)(a1 + 40);
        LODWORD(v9.value) = 136315650;
        *(CMTimeValue *)((char *)&v9.value + 4) = (CMTimeValue)"-[AVSmartSubtitlesController _handleUpdatedState:]_block_invoke";
        LOWORD(v9.flags) = 2048;
        *(double *)((char *)&v9.flags + 2) = v6;
        HIWORD(v9.epoch) = 2048;
        uint64_t v10 = v8;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s Current playback time %f has reached or passed the original time of %f, resetting controller to idle", (uint8_t *)&v9, 0x20u);
      }

      [WeakRetained setState:0];
    }
  }
}

- (void)invalidate
{
  [(AVSmartSubtitlesController *)self setState:0];
  -[AVSmartSubtitlesController _setPlayerTimeObserver:]((id *)&self->super.isa, 0);
  if (self)
  {
    [(AVObservationController *)self->_smartSubtitlesControllerKVO stopAllObservation];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
}

- (void)dealloc
{
  [(AVSmartSubtitlesController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AVSmartSubtitlesController;
  [(AVSmartSubtitlesController *)&v3 dealloc];
}

@end