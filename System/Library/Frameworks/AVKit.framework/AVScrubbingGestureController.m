@interface AVScrubbingGestureController
- (AVPlayerController)playerController;
- (AVScrubbingGestureController)initWithPlatformAdapter:(id)a3;
- (AVScrubbingGestureControllerDelegate)delegate;
- (AVScrubbingGesturePlatformAdapter)platformAdapter;
- (BOOL)enabled;
- (BOOL)scrubbingGesturePlatformAdapterIsActivelyScrubbing:(id)a3;
- (BOOL)scrubsHaveMomentum;
- (double)_targetTime;
- (float)_resumptionRate;
- (id)_updateAdapterState;
- (id)configurationForScrubbingGesturePlatformAdapter:(id)a3;
- (uint64_t)_seekForScrubIncrement;
- (unint64_t)state;
- (void)_endScrubbingAndResetState;
- (void)_endScrubbingForPlayerController:(uint64_t)a1;
- (void)_performScrubIncrement;
- (void)_updateStateTo:(void *)a1;
- (void)dealloc;
- (void)scrubbingGesturePlatformAdapterDidBeginScrubbing:(id)a3;
- (void)scrubbingGesturePlatformAdapterDidContinueScrubbing:(id)a3;
- (void)scrubbingGesturePlatformAdapterDidEndScrubbing:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setPlayerController:(id)a3;
- (void)setScrubsHaveMomentum:(BOOL)a3;
@end

@implementation AVScrubbingGestureController

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_playerController, 0);
  objc_storeStrong((id *)&self->_scrubMomentumIncrementTimer, 0);
  objc_storeStrong((id *)&self->_gestureConfiguration, 0);
  objc_storeStrong((id *)&self->_observationController, 0);

  objc_storeStrong((id *)&self->_platformAdapter, 0);
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (void)setDelegate:(id)a3
{
}

- (AVScrubbingGestureControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (AVScrubbingGestureControllerDelegate *)WeakRetained;
}

- (unint64_t)state
{
  return self->_state;
}

- (BOOL)scrubsHaveMomentum
{
  return self->_scrubsHaveMomentum;
}

- (AVPlayerController)playerController
{
  return self->_playerController;
}

- (void)scrubbingGesturePlatformAdapterDidEndScrubbing:(id)a3
{
  id v4 = a3;
  if ([(AVScrubbingGestureController *)self state] == 2)
  {
    float v5 = -[AVScrubbingGestureController _resumptionRate]((float *)self);
    float currentScrubRate = self->_currentScrubRate;
    if ([(AVScrubbingGestureController *)self scrubsHaveMomentum]
      && vabds_f32(currentScrubRate, v5) >= 10.0)
    {
      self->_startingMomentumRate = currentScrubRate;
      -[AVScrubbingGestureController _updateStateTo:](self, 3);
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x1E4F1CB00];
      uint64_t v10 = MEMORY[0x1E4F143A8];
      uint64_t v11 = 3221225472;
      v12 = __79__AVScrubbingGestureController_scrubbingGesturePlatformAdapterDidEndScrubbing___block_invoke;
      v13 = &unk_1E5FC4480;
      objc_copyWeak(&v14, &location);
      v8 = [v7 scheduledTimerWithTimeInterval:1 repeats:&v10 block:0.0166666667];
      scrubMomentumIncrementTimer = self->_scrubMomentumIncrementTimer;
      self->_scrubMomentumIncrementTimer = v8;

      -[NSTimer setTolerance:](self->_scrubMomentumIncrementTimer, "setTolerance:", 0.00833333333, v10, v11, v12, v13);
      -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)self);
      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
    else
    {
      -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)self);
    }
    *(void *)&self->_initialNormalizedTouchTranslation = 0;
  }
}

- (float)_resumptionRate
{
  if (!a1) {
    return 0.0;
  }
  v2 = [a1 playerController];
  v3 = v2;
  if (v2)
  {
    if (objc_msgSend(v2, "avkit_isAVPlayerControllerOrSubclass"))
    {
      if ([v3 isPlaybackSuspended]) {
        [v3 suspendedRate];
      }
      else {
        [v3 rate];
      }
      float v5 = v4;
    }
    else
    {
      float v5 = a1[14];
    }
  }
  else
  {
    float v5 = 0.0;
  }

  return v5;
}

- (void)_updateStateTo:(void *)a1
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v4 = a1[9];
    if (v4 != a2)
    {
      switch(v4)
      {
        case 0:
          if (a2 == 1) {
            goto LABEL_11;
          }
          goto LABEL_19;
        case 1:
          if (a2 != 2) {
            goto LABEL_19;
          }
          goto LABEL_11;
        case 2:
          if ((a2 & 0xFFFFFFFFFFFFFFFDLL) != 1) {
            goto LABEL_19;
          }
          goto LABEL_11;
        case 3:
          if ((unint64_t)(a2 - 1) >= 2) {
            goto LABEL_19;
          }
LABEL_11:
          a1[9] = a2;
          id v9 = [a1 delegate];
          if (objc_opt_respondsToSelector()) {
            [v9 scrubbingGestureControllerStateDidChange:a1];
          }

          break;
        default:
          float v5 = _AVLog();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          {
            v8 = (void *)a1[9];
            *(_DWORD *)buf = 134217984;
            uint64_t v11 = v8;
            _os_log_error_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_ERROR, "Error: Unknown AVScrubbingGestureControllerState - %ld", buf, 0xCu);
          }

LABEL_19:
          v6 = _AVLog();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          {
            uint64_t v7 = a1[9];
            *(_DWORD *)buf = 138543874;
            uint64_t v11 = a1;
            __int16 v12 = 2048;
            uint64_t v13 = v7;
            __int16 v14 = 2048;
            uint64_t v15 = a2;
            _os_log_error_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_ERROR, "Error: Attempted invalid state transition for %{public}@ from %ld ==> %ld. Ignoring.", buf, 0x20u);
          }

          break;
      }
    }
  }
}

void __79__AVScrubbingGestureController_scrubbingGesturePlatformAdapterDidEndScrubbing___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)WeakRetained);
}

- (void)_performScrubIncrement
{
  if (a1)
  {
    if (([MEMORY[0x1E4F29060] isMainThread] & 1) == 0)
    {
      v2 = _AVLog();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_ERROR, "Warning: _performScrubIncrement should not be performed off of the main thread.", buf, 2u);
      }
    }
    if ([(id)a1 state] != 2 && objc_msgSend((id)a1, "state") != 3)
    {
      v3 = _AVLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v17 = 0;
        _os_log_error_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. Scrub increments should never be dispatched while not in the momentum or scrubbing states.", v17, 2u);
      }
    }
    if (!*(void *)(a1 + 24))
    {
      uint64_t v4 = _AVLog();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)uint64_t v16 = 0;
        _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. A gesture configuration should be created before a scrub starts.", v16, 2u);
      }
    }
    if ([(id)a1 state] == 2)
    {
      [*(id *)(a1 + 8) timelineVelocity];
      float v6 = v5;
      int v7 = [*(id *)(a1 + 24) usesNaturalDirection];
      float v8 = -v6;
      if (!v7) {
        float v8 = v6;
      }
      goto LABEL_18;
    }
    if ([(id)a1 state] == 3)
    {
      float v9 = -[AVScrubbingGestureController _resumptionRate]((float *)a1);
      float v10 = *(float *)(a1 + 32);
      if (vabds_f32(v10, v9) > 0.0333333333)
      {
        float v11 = *(float *)(a1 + 36);
        if ((v11 <= v9 || v10 >= v9) && (v11 >= v9 || v10 <= v9))
        {
          float v12 = v10 - v9;
          id v13 = *(id *)(a1 + 24);
          self;
          [v13 syntheticFriction];
          float v15 = v14;

          float v8 = v9 + (float)(v15 * v12);
LABEL_18:
          *(float *)(a1 + 32) = v8;
          -[AVScrubbingGestureController _seekForScrubIncrement](a1);
          return;
        }
      }
      -[AVScrubbingGestureController _endScrubbingAndResetState](a1);
    }
  }
}

- (void)_endScrubbingAndResetState
{
  if (a1 && ([(id)a1 state] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    id v4 = [(id)a1 playerController];
    v2 = *(void **)(a1 + 24);
    *(void *)(a1 + 24) = 0;

    -[AVScrubbingGestureController _endScrubbingForPlayerController:](a1, v4);
    [*(id *)(a1 + 48) invalidate];
    v3 = *(void **)(a1 + 48);
    *(void *)(a1 + 48) = 0;

    *(void *)(a1 + 32) = 0;
    objc_msgSend(*(id *)(a1 + 64), "avkit_setWebKitSeekToTime:", NAN);
    objc_msgSend(*(id *)(a1 + 64), "avkit_setWebKitIsScrubbing:", 0);
    -[AVScrubbingGestureController _updateStateTo:]((void *)a1, 1);
  }
}

- (void)_endScrubbingForPlayerController:(uint64_t)a1
{
  if (a1)
  {
    id v3 = a2;
    [v3 endScrubbing:a1];
    objc_msgSend(v3, "avkit_setWebKitIsScrubbing:", 0);
    [v3 endPlaybackSuspension];

    *(_DWORD *)(a1 + 56) = 0;
  }
}

- (uint64_t)_seekForScrubIncrement
{
  v2 = [(id)a1 playerController];
  id v3 = v2;
  if (v2)
  {
    v25 = v2;
    v2 = (void *)[v2 canSeek];
    id v3 = v25;
    if (v2)
    {
      double v4 = -[AVScrubbingGestureController _targetTime]((void *)a1);
      if (*(void *)(a1 + 72) == 3
        || ![*(id *)(a1 + 24) linearSeeking]
        || ([*(id *)(a1 + 8) translation], v6 == 0.0) && v5 == 0.0)
      {
        double v7 = *(float *)(a1 + 32) * 0.0166666667;
        double v8 = fabs(v7 * 0.5);
        double v9 = v4 + v7;
      }
      else
      {
        [*(id *)(a1 + 8) translation];
        double v18 = v17 - *(float *)(a1 + 40) + *(float *)(a1 + 44);
        [v25 minTime];
        double v20 = v19;
        [v25 maxTime];
        double v22 = v21;
        [v25 minTime];
        double v9 = v20 + v18 * (v22 - v23);
        double v8 = 0.5;
      }
      if (objc_msgSend(v25, "avkit_isAVPlayerControllerOrSubclass"))
      {
        double v10 = v9;
        float v11 = v25;
      }
      else
      {
        [v25 minTime];
        double v10 = v12;
        [v25 maxTime];
        double v14 = fabs(v10);
        BOOL v15 = v9 < v10 || v14 == INFINITY;
        float v11 = v25;
        if (!v15)
        {
          if (fabs(v13) != INFINITY && v9 <= v13) {
            double v10 = v9;
          }
          else {
            double v10 = v13;
          }
        }
      }
      [v11 seekToTime:v10 toleranceBefore:v8 toleranceAfter:v8];
      v2 = objc_msgSend(v25, "avkit_setWebKitSeekToTime:", v10);
      id v3 = v25;
    }
  }

  return MEMORY[0x1F41817F8](v2, v3);
}

- (double)_targetTime
{
  v1 = [a1 playerController];
  if (objc_msgSend(v1, "avkit_isAVPlayerControllerOrSubclass"))
  {
    [v1 seekToTime];
    if ([v1 isSeeking]) {
      [v1 seekToTime];
    }
    else {
      [v1 currentTimeWithinEndTimes];
    }
    double v4 = v2;
  }
  else
  {
    objc_msgSend(v1, "avkit_webkitSeekToTime");
    double v4 = v3;
  }

  return v4;
}

- (void)scrubbingGesturePlatformAdapterDidContinueScrubbing:(id)a3
{
  if (self && (self->_initialNormalizedTouchTranslation == 0.0 || self->_initialNormalizedTimelinePosition == 0.0))
  {
    double v4 = -[AVScrubbingGestureController _targetTime](self);
    [(AVPlayerController *)self->_playerController maxTime];
    *(float *)&double v5 = v4 / v5;
    self->_initialNormalizedTimelinePosition = *(float *)&v5;
    [(AVScrubbingGesturePlatformAdapter *)self->_platformAdapter translation];
    *(float *)&double v6 = v6;
    self->_initialNormalizedTouchTranslation = *(float *)&v6;
  }

  -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)self);
}

- (void)scrubbingGesturePlatformAdapterDidBeginScrubbing:(id)a3
{
  if (![(AVScrubbingGestureController *)self state]
    && [(AVScrubbingGestureController *)self state] == 2)
  {
    double v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)double v10 = 0;
      _os_log_error_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_ERROR, "Error: Internal inconsistency. AVScrubbingGestureController state should never be unknown or scrubbing when a new scub gesture begins.", v10, 2u);
    }
  }
  double v5 = [(AVScrubbingGestureController *)self playerController];
  double v6 = v5;
  if (v5 && [v5 canSeek])
  {
    if ([(AVScrubbingGestureController *)self state] == 3)
    {
      if (self)
      {
        [(NSTimer *)self->_scrubMomentumIncrementTimer invalidate];
        scrubMomentumIncrementTimer = self->_scrubMomentumIncrementTimer;
        self->_scrubMomentumIncrementTimer = 0;

        *(void *)&self->_float currentScrubRate = 0;
      }
    }
    else if (self)
    {
      id v8 = v6;
      [v8 rate];
      *(float *)&double v9 = v9;
      self->_preScrubbingRate = *(float *)&v9;
      [v8 beginPlaybackSuspension];
      objc_msgSend(v8, "avkit_setWebKitIsScrubbing:", 1);
      [v8 beginScrubbing:self];
    }
    -[AVScrubbingGestureController _updateStateTo:](self, 2);
    -[AVScrubbingGestureController _performScrubIncrement]((uint64_t)self);
  }
}

- (id)configurationForScrubbingGesturePlatformAdapter:(id)a3
{
  if (self && !self->_gestureConfiguration)
  {
    double v4 = [(AVScrubbingGestureController *)self delegate];
    if (objc_opt_respondsToSelector()) {
      id v5 = (id)[v4 configurationForScrubbingGestureController:self];
    }

    if (!self->_gestureConfiguration)
    {
      double v6 = +[AVScrubbingGestureConfiguration defaultConfiguration];
      gestureConfiguration = self->_gestureConfiguration;
      self->_gestureConfiguration = v6;
    }
  }
  id v8 = self->_gestureConfiguration;

  return [(AVScrubbingGestureConfiguration *)v8 platformConfiguration];
}

- (BOOL)scrubbingGesturePlatformAdapterIsActivelyScrubbing:(id)a3
{
  return ([(AVScrubbingGestureController *)self state] & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (AVScrubbingGesturePlatformAdapter)platformAdapter
{
  return self->_platformAdapter;
}

- (void)setScrubsHaveMomentum:(BOOL)a3
{
  if (self->_scrubsHaveMomentum != a3)
  {
    self->_scrubsHaveMomentum = a3;
    if (!a3 && [(AVScrubbingGestureController *)self state] == 3)
    {
      -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)self);
    }
  }
}

- (void)setPlayerController:(id)a3
{
  id v5 = (AVPlayerController *)a3;
  if (self->_playerController != v5)
  {
    double v6 = v5;
    -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)self);
    objc_storeStrong((id *)&self->_playerController, a3);
    id v5 = v6;
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[AVScrubbingGestureController _updateAdapterState]((id *)&self->super.isa);
  }
}

- (id)_updateAdapterState
{
  if (!result) {
    return result;
  }
  v1 = result;
  if ([result enabled])
  {
    double v2 = [v1 playerController];
    if (v2)
    {
      double v3 = [v1 playerController];
      uint64_t v4 = [v3 canSeek];
    }
    else
    {
      uint64_t v4 = 0;
    }

    id v5 = v1 + 1;
    if (v4 == [v1[1] gestureEnabled]) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v5 = v1 + 1;
  uint64_t v4 = 0;
  if ([v1[1] gestureEnabled]) {
LABEL_6:
  }
    -[AVScrubbingGestureController _endScrubbingAndResetState]((uint64_t)v1);
LABEL_7:
  double v6 = *v5;

  return (id *)[v6 setGestureEnabled:v4];
}

- (void)dealloc
{
  double v3 = [(AVScrubbingGestureController *)self playerController];
  if (([(AVScrubbingGestureController *)self state] & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[AVScrubbingGestureController _endScrubbingForPlayerController:]((uint64_t)self, v3);
    if (self)
    {
      [(NSTimer *)self->_scrubMomentumIncrementTimer invalidate];
      scrubMomentumIncrementTimer = self->_scrubMomentumIncrementTimer;
      self->_scrubMomentumIncrementTimer = 0;

      *(void *)&self->_float currentScrubRate = 0;
      [self->_playerController avkit_setWebKitSeekToTime:NAN];
      [self->_playerController avkit_setWebKitIsScrubbing:0];
    }
  }
  [(AVObservationController *)self->_observationController stopAllObservation];

  v5.receiver = self;
  v5.super_class = (Class)AVScrubbingGestureController;
  [(AVScrubbingGestureController *)&v5 dealloc];
}

- (AVScrubbingGestureController)initWithPlatformAdapter:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)AVScrubbingGestureController;
  double v6 = [(AVScrubbingGestureController *)&v12 init];
  double v7 = v6;
  if (v6)
  {
    v6->_state = 1;
    objc_storeStrong((id *)&v6->_platformAdapter, a3);
    [(AVScrubbingGesturePlatformAdapter *)v7->_platformAdapter setDelegate:v7];
    id v8 = [[AVObservationController alloc] initWithOwner:v7];
    observationController = v7->_observationController;
    v7->_observationController = v8;

    id v10 = [(AVObservationController *)v7->_observationController startObserving:v7 keyPath:@"playerController.canSeek" observationHandler:&__block_literal_global_1089];
    -[AVScrubbingGestureController _updateAdapterState]((id *)&v7->super.isa);
  }

  return v7;
}

id *__56__AVScrubbingGestureController_initWithPlatformAdapter___block_invoke(uint64_t a1, id *a2)
{
  return -[AVScrubbingGestureController _updateAdapterState](a2);
}

@end