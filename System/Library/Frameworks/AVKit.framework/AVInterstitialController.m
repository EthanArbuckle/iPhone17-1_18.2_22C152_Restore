@interface AVInterstitialController
+ (id)interstitialQueue;
+ (id)newTimeRangeCollectionForPlayerItem:(id)a3;
+ (id)newTimeRangeCollectionForPlayerItem:(id)a3 reversePlaybackEndTime:(id *)a4 forwardPlaybackEndTime:(id *)a5;
- (AVInterstitialController)init;
- (AVInterstitialControllerDelegateManager)delegateManager;
- (AVObservationController)kvo;
- (AVObservationController)kvoPlayerItem;
- (AVPlayer)interstitialPlayer;
- (AVPlayer)player;
- (AVPlayerInterstitialEventController)eventController;
- (AVPlayerInterstitialEventMonitor)eventMonitor;
- (AVTimeControlling)interstitialTimingController;
- (AVTimeRange)currentInterstitialTimeRange;
- (AVTimeRange)interstitialTimeRangeInProgress;
- (AVTimeRange)previousInterstitialTimeRange;
- (AVTimeRangeCollection)interstitialTimeRangeCollection;
- (BOOL)_shouldSkipInterstitialTimeRange:(id)a3;
- (BOOL)isLive;
- (BOOL)loadDurationOfCurrentOrNextInterstitialEvent:(id)a3;
- (BOOL)requiresLinearPlayback;
- (BOOL)shouldAlwaysSkipInterstitials;
- (BOOL)shouldEnforceInterstitialPolicy;
- (double)_pendingTimeBoundary;
- (double)continuationTimeAfterInterstitial;
- (double)currentDisplayTime;
- (double)currentTime;
- (double)displayTimeFromTime:(double)a3;
- (double)elapsedTimeForInterstitialPlayer;
- (double)elapsedTimeWithinCurrentInterstitial;
- (double)timeFromDisplayTime:(double)a3;
- (double)timeRemainingInCurrentInterstitial;
- (double)timeToSeekAfterUserNavigatedFromTime:(double)a3 toTime:(double)a4;
- (id)_copySynthesizedInterstitialTimeRanges;
- (id)currentItem;
- (id)currentOrEstimatedDate;
- (id)didEnterInterstitialTimeRangeBlock;
- (id)didLeaveInterstitialTimeRangeBlock;
- (id)didLeaveRequiredInterstitialTimeRangeBlock;
- (id)interstitialBoundaryTimeObserver;
- (id)interstitialTimeRangeForPlayerInterstitialEvent:(id)a3;
- (id)nextInterstitialTimeRange;
- (id)skipInterstitialTimeRangeBlock;
- (id)timeRangeForPlayerInterstitialEvent:(id)a3;
- (void)_performInterstitialPlayerDependentUpdates;
- (void)_sendInterstitialBoundaryNotificationForInterstitialTimeRange:(id)a3;
- (void)_sendInterstitialBoundaryNotificationsForEvent:(id)a3;
- (void)_sendInterstitialBoundaryNotificationsForTime:(double)a3;
- (void)_setPendingTimeBoundary:(double)a3;
- (void)_startObservingInterstitialTimeRanges;
- (void)_stopObservingInterstitialTimeRanges;
- (void)_updateInterstitialTimeRangeCollection;
- (void)cancelCurrentPlayerInterstitialEvent;
- (void)dealloc;
- (void)didBeginOrResumePlayback;
- (void)didPresentInterstitialTimeRange:(id)a3;
- (void)invalidate;
- (void)sendInterstitialBoundaryNotificationsForTimeJumpIfNeeded;
- (void)sendPendingInterstitialBoundaryNotificationIfNeeded;
- (void)setDelegateManager:(id)a3;
- (void)setDidEnterInterstitialTimeRangeBlock:(id)a3;
- (void)setDidLeaveInterstitialTimeRangeBlock:(id)a3;
- (void)setDidLeaveRequiredInterstitialTimeRangeBlock:(id)a3;
- (void)setEventController:(id)a3;
- (void)setEventMonitor:(id)a3;
- (void)setInterstitialBoundaryTimeObserver:(id)a3;
- (void)setInterstitialPlayer:(id)a3;
- (void)setInterstitialTimeRangeCollection:(id)a3;
- (void)setInterstitialTimeRangeInProgress:(id)a3;
- (void)setKvo:(id)a3;
- (void)setKvoPlayerItem:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setShouldAlwaysSkipInterstitials:(BOOL)a3;
- (void)setSkipInterstitialTimeRangeBlock:(id)a3;
- (void)setupInterstitialObservers;
- (void)skipInterstitialTimeRange:(id)a3;
- (void)updateSynthesizedInterstitialTimeRanges;
- (void)willPresentInterstitialTimeRange:(id)a3;
@end

@implementation AVInterstitialController

+ (id)newTimeRangeCollectionForPlayerItem:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 interstitialTimeRanges];
    if ([v4 status] == 1)
    {
      [v4 duration];
      if (v18)
      {
        [v4 duration];
        if ((v17 & 0x10) != 0)
        {
          long long v15 = 0u;
          long long v16 = 0u;
          long long v13 = 0u;
          long long v14 = 0u;
          id v6 = v5;
          uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
          if (v7)
          {
            uint64_t v8 = v7;
            uint64_t v9 = *(void *)v14;
            do
            {
              for (uint64_t i = 0; i != v8; ++i)
              {
                if (*(void *)v14 != v9) {
                  objc_enumerationMutation(v6);
                }
                objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "_setCollapsedInTimeLine:", 0, (void)v13);
              }
              uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v19 count:16];
            }
            while (v8);
          }
        }
      }
    }
    if (objc_msgSend(v5, "count", (void)v13)) {
      v11 = [[AVTimeRangeCollection alloc] initWithInterstitialTimeRanges:v5];
    }
    else {
      v11 = 0;
    }
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_interstitialBoundaryTimeObserver, 0);
  objc_storeStrong((id *)&self->_interstitialTimeRangeInProgress, 0);
  objc_storeStrong((id *)&self->_kvoPlayerItem, 0);
  objc_storeStrong((id *)&self->_kvo, 0);
  objc_storeStrong((id *)&self->_eventController, 0);
  objc_storeStrong((id *)&self->_eventMonitor, 0);
  objc_storeStrong((id *)&self->_interstitialTimingController, 0);
  objc_storeStrong(&self->_skipInterstitialTimeRangeBlock, 0);
  objc_storeStrong(&self->_didLeaveRequiredInterstitialTimeRangeBlock, 0);
  objc_storeStrong(&self->_didLeaveInterstitialTimeRangeBlock, 0);
  objc_storeStrong(&self->_didEnterInterstitialTimeRangeBlock, 0);
  objc_storeStrong((id *)&self->_interstitialTimeRangeCollection, 0);
  objc_destroyWeak((id *)&self->_delegateManager);
  objc_storeStrong((id *)&self->_interstitialPlayer, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_playerInterstitialCurrentEventChangedObserver, 0);
  objc_storeStrong((id *)&self->_playerInterstitialEventsChangedObserver, 0);
  objc_storeStrong((id *)&self->_playerInterstitialPlayerDidChangeObserver, 0);

  objc_storeStrong((id *)&self->_playerItemTimeJumpedObserver, 0);
}

- (void)setInterstitialBoundaryTimeObserver:(id)a3
{
}

- (id)interstitialBoundaryTimeObserver
{
  return self->_interstitialBoundaryTimeObserver;
}

- (void)setInterstitialTimeRangeInProgress:(id)a3
{
}

- (AVTimeRange)interstitialTimeRangeInProgress
{
  return self->_interstitialTimeRangeInProgress;
}

- (void)setKvoPlayerItem:(id)a3
{
}

- (AVObservationController)kvoPlayerItem
{
  return self->_kvoPlayerItem;
}

- (void)setKvo:(id)a3
{
}

- (AVObservationController)kvo
{
  return self->_kvo;
}

- (void)setEventController:(id)a3
{
}

- (AVPlayerInterstitialEventController)eventController
{
  return self->_eventController;
}

- (void)setEventMonitor:(id)a3
{
}

- (AVPlayerInterstitialEventMonitor)eventMonitor
{
  return self->_eventMonitor;
}

- (AVTimeControlling)interstitialTimingController
{
  return self->_interstitialTimingController;
}

- (void)setShouldAlwaysSkipInterstitials:(BOOL)a3
{
  self->_shouldAlwaysSkipInterstitials = a3;
}

- (BOOL)shouldAlwaysSkipInterstitials
{
  return self->_shouldAlwaysSkipInterstitials;
}

- (void)setSkipInterstitialTimeRangeBlock:(id)a3
{
}

- (id)skipInterstitialTimeRangeBlock
{
  return self->_skipInterstitialTimeRangeBlock;
}

- (void)setDidLeaveRequiredInterstitialTimeRangeBlock:(id)a3
{
}

- (id)didLeaveRequiredInterstitialTimeRangeBlock
{
  return self->_didLeaveRequiredInterstitialTimeRangeBlock;
}

- (void)setDidLeaveInterstitialTimeRangeBlock:(id)a3
{
}

- (id)didLeaveInterstitialTimeRangeBlock
{
  return self->_didLeaveInterstitialTimeRangeBlock;
}

- (void)setDidEnterInterstitialTimeRangeBlock:(id)a3
{
}

- (id)didEnterInterstitialTimeRangeBlock
{
  return self->_didEnterInterstitialTimeRangeBlock;
}

- (double)continuationTimeAfterInterstitial
{
  return self->_continuationTimeAfterInterstitial;
}

- (void)setInterstitialTimeRangeCollection:(id)a3
{
}

- (AVTimeRangeCollection)interstitialTimeRangeCollection
{
  return self->_interstitialTimeRangeCollection;
}

- (void)setDelegateManager:(id)a3
{
}

- (AVInterstitialControllerDelegateManager)delegateManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegateManager);

  return (AVInterstitialControllerDelegateManager *)WeakRetained;
}

- (AVPlayer)interstitialPlayer
{
  return self->_interstitialPlayer;
}

- (AVPlayer)player
{
  return self->_player;
}

- (double)_pendingTimeBoundary
{
  os_unfair_lock_lock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
  id v3 = [(AVInterstitialController *)self currentItem];
  v4 = objc_getAssociatedObject(v3, (const void *)_AVPlayerItemPendingTimeBoundaryKey);
  os_unfair_lock_unlock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
  if (v4)
  {
    [v4 doubleValue];
    double v6 = v5;
  }
  else
  {
    double v6 = NAN;
  }

  return v6;
}

- (void)_setPendingTimeBoundary:(double)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
  id object = [(AVInterstitialController *)self currentItem];
  if (object)
  {
    double v5 = (const void *)_AVPlayerItemPendingTimeBoundaryKey;
    double v6 = [NSNumber numberWithDouble:a3];
    objc_setAssociatedObject(object, v5, v6, (void *)0x301);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&_pendingTimeBoundaryUnfairLock);
}

- (void)didPresentInterstitialTimeRange:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(AVInterstitialController *)self interstitialTimeRangeInProgress];

    if (v5 == v4)
    {
      double v6 = [v4 interstice];
      uint64_t v7 = _AVLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v16 = 136315650;
        char v17 = "-[AVInterstitialController didPresentInterstitialTimeRange:]";
        __int16 v18 = 2114;
        double v19 = *(double *)&v4;
        __int16 v20 = 2114;
        v21 = v6;
        _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s Leaving interstitial %{public}@ :: %{public}@", (uint8_t *)&v16, 0x20u);
      }

      if ([(AVInterstitialController *)self shouldEnforceInterstitialPolicy]
        && self->_continuationTimeAfterInterstitial > 0.0)
      {
        uint64_t v8 = _AVLog();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
        {
          double continuationTimeAfterInterstitial = self->_continuationTimeAfterInterstitial;
          int v16 = 136315394;
          char v17 = "-[AVInterstitialController didPresentInterstitialTimeRange:]";
          __int16 v18 = 2048;
          double v19 = continuationTimeAfterInterstitial;
          _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "%s [interstitial] continuing at %.1f", (uint8_t *)&v16, 0x16u);
        }

        double v10 = self->_continuationTimeAfterInterstitial;
        self->_double continuationTimeAfterInterstitial = 0.0;
        uint64_t v11 = [(AVInterstitialController *)self didLeaveRequiredInterstitialTimeRangeBlock];
        v12 = (void *)v11;
        if (v11) {
          (*(void (**)(uint64_t, id, double))(v11 + 16))(v11, v4, v10);
        }
      }
      [(AVInterstitialController *)self setInterstitialTimeRangeInProgress:0];
      uint64_t v13 = [(AVInterstitialController *)self didLeaveInterstitialTimeRangeBlock];
      long long v14 = (void *)v13;
      if (v13) {
        (*(void (**)(uint64_t, id))(v13 + 16))(v13, v4);
      }
      long long v15 = [(AVInterstitialController *)self delegateManager];
      [v15 didPresentInterstitialGroup:v6];

      [v6 _setActive:0];
      [(AVTimeControlling *)self->_interstitialTimingController stopTimingObservation];
    }
  }
}

- (void)willPresentInterstitialTimeRange:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(AVInterstitialController *)self interstitialTimeRangeInProgress];
  if (v4 && ([v4 isEqual:v5] & 1) == 0)
  {
    double v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v7 = [v4 interstice];
      int v12 = 136315650;
      uint64_t v13 = "-[AVInterstitialController willPresentInterstitialTimeRange:]";
      __int16 v14 = 2114;
      id v15 = v4;
      __int16 v16 = 2114;
      char v17 = v7;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s Entering interstitial %{public}@ :: %{public}@", (uint8_t *)&v12, 0x20u);
    }
    if ([(AVInterstitialController *)self _shouldSkipInterstitialTimeRange:v4])
    {
      [(AVInterstitialController *)self skipInterstitialTimeRange:v4];
    }
    else
    {
      uint64_t v8 = [v4 interstice];
      [v8 _setActive:1];
      uint64_t v9 = [(AVInterstitialController *)self didEnterInterstitialTimeRangeBlock];
      double v10 = (void *)v9;
      if (v9) {
        (*(void (**)(uint64_t, id))(v9 + 16))(v9, v4);
      }
      uint64_t v11 = [(AVInterstitialController *)self delegateManager];
      [v11 willPresentInterstitialGroup:v8];

      [(AVInterstitialController *)self setInterstitialTimeRangeInProgress:v4];
      [(AVTimeControlling *)self->_interstitialTimingController startTimingObservation];
    }
  }
}

- (void)skipInterstitialTimeRange:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = _AVLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.value) = 136315394;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)"-[AVInterstitialController skipInterstitialTimeRange:]";
    LOWORD(buf.flags) = 2114;
    *(void *)((char *)&buf.flags + 2) = v4;
    _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s timeRange = %{public}@", (uint8_t *)&buf, 0x16u);
  }

  uint64_t v6 = [(AVInterstitialController *)self skipInterstitialTimeRangeBlock];
  uint64_t v7 = (void *)v6;
  if (v6)
  {
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v4);
  }
  else
  {
    uint64_t v8 = _AVLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf.value) = 0;
      _os_log_impl(&dword_1B05B7000, v8, OS_LOG_TYPE_DEFAULT, "skipInterstitialTimeRangeBlock not set; providing default skipping behavior",
        (uint8_t *)&buf,
        2u);
    }

    uint64_t v9 = [(AVInterstitialController *)self player];
    [v9 rate];
    float v11 = v10;

    if (v11 >= 0.0) {
      [v4 endTime];
    }
    else {
      [v4 startTime];
    }
    memset(&buf, 0, sizeof(buf));
    CMTimeMakeWithSeconds(&buf, v12, 1000);
    uint64_t v13 = [(AVInterstitialController *)self player];
    CMTime v18 = buf;
    long long v16 = *MEMORY[0x1E4F1FA48];
    uint64_t v17 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    long long v14 = v16;
    uint64_t v15 = v17;
    [v13 seekToTime:&v18 toleranceBefore:&v16 toleranceAfter:&v14 completionHandler:&__block_literal_global_46];
  }
}

void __54__AVInterstitialController_skipInterstitialTimeRange___block_invoke(uint64_t a1, int a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = @"NO";
    if (a2) {
      id v4 = @"YES";
    }
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "skipInterstitialTimeRange seek complete (finished = %@)", (uint8_t *)&v5, 0xCu);
  }
}

- (void)didBeginOrResumePlayback
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVInterstitialController *)self currentInterstitialTimeRange];
  if (v3)
  {
    id v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 136315394;
      uint64_t v6 = "-[AVInterstitialController didBeginOrResumePlayback]";
      __int16 v7 = 1024;
      int v8 = 670;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v5, 0x12u);
    }

    [(AVInterstitialController *)self currentTime];
    -[AVInterstitialController _sendInterstitialBoundaryNotificationsForTime:](self, "_sendInterstitialBoundaryNotificationsForTime:");
  }
}

- (BOOL)_shouldSkipInterstitialTimeRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(AVInterstitialController *)self player];
  [(id)v5 rate];
  float v7 = v6;

  LOBYTE(v5) = [v4 isSkipped];
  if ((v5 & 1) != 0 || v7 > 3.0 || v7 < 0.0) {
    return 1;
  }

  return [(AVInterstitialController *)self shouldAlwaysSkipInterstitials];
}

- (id)nextInterstitialTimeRange
{
  id v3 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  [(AVInterstitialController *)self currentTime];
  id v4 = objc_msgSend(v3, "timeRangeAfterTime:");

  return v4;
}

- (AVTimeRange)previousInterstitialTimeRange
{
  id v3 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  [(AVInterstitialController *)self currentTime];
  id v4 = objc_msgSend(v3, "timeRangeBeforeTime:");

  return (AVTimeRange *)v4;
}

- (AVTimeRange)currentInterstitialTimeRange
{
  id v3 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  if ([v3 count])
  {
    id v4 = [(AVPlayerInterstitialEventMonitor *)self->_eventMonitor currentEvent];
    if (v4)
    {
      uint64_t v5 = [(AVInterstitialController *)self timeRangeForPlayerInterstitialEvent:v4];
      [(AVInterstitialController *)self loadDurationOfCurrentOrNextInterstitialEvent:&__block_literal_global_13932];
    }
    else
    {
      [(AVInterstitialController *)self currentTime];
      uint64_t v5 = objc_msgSend(v3, "timeRangeContainingTime:");
    }
    if ([v5 isSkipped]) {
      float v7 = 0;
    }
    else {
      float v7 = v5;
    }
    id v6 = v7;
  }
  else
  {
    id v6 = 0;
  }

  return (AVTimeRange *)v6;
}

void __56__AVInterstitialController_currentInterstitialTimeRange__block_invoke(double a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = _AVLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 134217984;
    double v4 = a1;
    _os_log_impl(&dword_1B05B7000, v2, OS_LOG_TYPE_DEFAULT, "duration of current interstitialEvent: %.1f sec", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_stopObservingInterstitialTimeRanges
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __64__AVInterstitialController__stopObservingInterstitialTimeRanges__block_invoke;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __64__AVInterstitialController__stopObservingInterstitialTimeRanges__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v1 = [WeakRetained interstitialBoundaryTimeObserver];

  if (v1)
  {
    v2 = [WeakRetained player];
    id v3 = [WeakRetained interstitialBoundaryTimeObserver];
    [v2 removeTimeObserver:v3];

    [WeakRetained setInterstitialBoundaryTimeObserver:0];
    [WeakRetained _setPendingTimeBoundary:NAN];
  }
}

- (void)_startObservingInterstitialTimeRanges
{
  objc_initWeak(&location, self);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke;
  v2[3] = &unk_1E5FC44F8;
  objc_copyWeak(&v3, &location);
  dispatch_async(MEMORY[0x1E4F14428], v2);
  objc_destroyWeak(&v3);
  objc_destroyWeak(&location);
}

void __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = [WeakRetained interstitialTimeRangeCollection];
  objc_initWeak(&location, v3);

  double v4 = [WeakRetained interstitialTimeRangeCollection];
  uint64_t v5 = [v4 arrayOfBoundaryTimes];

  if ([v5 count])
  {
    [WeakRetained interstitialBoundaryTimeObserver];
    if (objc_claimAutoreleasedReturnValue()) {
      __assert_rtn("-[AVInterstitialController _startObservingInterstitialTimeRanges]_block_invoke", "AVInterstitialController.m", 580, "![self interstitialBoundaryTimeObserver]");
    }
    id v6 = [WeakRetained player];
    uint64_t v7 = MEMORY[0x1E4F14428];
    id v8 = MEMORY[0x1E4F14428];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke_2;
    v10[3] = &unk_1E5FC3190;
    objc_copyWeak(&v11, v1);
    objc_copyWeak(&v12, &location);
    uint64_t v9 = [v6 addBoundaryTimeObserverForTimes:v5 queue:v7 usingBlock:v10];
    [WeakRetained setInterstitialBoundaryTimeObserver:v9];

    objc_destroyWeak(&v12);
    objc_destroyWeak(&v11);
  }
  objc_destroyWeak(&location);
}

void __65__AVInterstitialController__startObservingInterstitialTimeRanges__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v5 = WeakRetained;
    [WeakRetained currentTime];
    objc_msgSend(v5, "_setPendingTimeBoundary:");
    id v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      id v4 = [v5 interstitialTimeRangeCollection];

      if (v4 == v3) {
        [v5 sendPendingInterstitialBoundaryNotificationIfNeeded];
      }
    }

    id WeakRetained = v5;
  }
}

- (void)sendPendingInterstitialBoundaryNotificationIfNeeded
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  [(AVInterstitialController *)self _pendingTimeBoundary];
  double v4 = v3;
  [(AVInterstitialController *)self _setPendingTimeBoundary:NAN];
  if (v4 >= 0.0)
  {
    id v5 = _AVLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315394;
      uint64_t v7 = "-[AVInterstitialController sendPendingInterstitialBoundaryNotificationIfNeeded]";
      __int16 v8 = 1024;
      int v9 = 562;
      _os_log_impl(&dword_1B05B7000, v5, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v6, 0x12u);
    }

    [(AVInterstitialController *)self _sendInterstitialBoundaryNotificationsForTime:v4];
  }
}

- (void)sendInterstitialBoundaryNotificationsForTimeJumpIfNeeded
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    id v5 = "-[AVInterstitialController sendInterstitialBoundaryNotificationsForTimeJumpIfNeeded]";
    __int16 v6 = 1024;
    int v7 = 551;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  [(AVInterstitialController *)self currentTime];
  -[AVInterstitialController _sendInterstitialBoundaryNotificationsForTime:](self, "_sendInterstitialBoundaryNotificationsForTime:");
}

- (void)_sendInterstitialBoundaryNotificationsForTime:(double)a3
{
  id v5 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  id v7 = [v5 timeRangeContainingTime:a3];

  __int16 v6 = [(AVPlayerInterstitialEventMonitor *)self->_eventMonitor currentEvent];

  if (!v6) {
    [(AVInterstitialController *)self _sendInterstitialBoundaryNotificationForInterstitialTimeRange:v7];
  }
}

- (void)_sendInterstitialBoundaryNotificationsForEvent:(id)a3
{
  id v4 = [(AVInterstitialController *)self timeRangeForPlayerInterstitialEvent:a3];
  [(AVInterstitialController *)self _sendInterstitialBoundaryNotificationForInterstitialTimeRange:v4];
}

- (void)_sendInterstitialBoundaryNotificationForInterstitialTimeRange:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AVInterstitialController *)self interstitialTimeRangeInProgress];
  __int16 v6 = (void *)v5;
  if ((id)v5 != v4 && (!v4 || !v5 || ([v4 isEqual:v5] & 1) == 0))
  {
    [(AVInterstitialController *)self _setPendingTimeBoundary:NAN];
    id v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315650;
      int v9 = "-[AVInterstitialController _sendInterstitialBoundaryNotificationForInterstitialTimeRange:]";
      __int16 v10 = 2112;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "%s interstitialTimeRangeInProgress = %@, timeRange = %@", (uint8_t *)&v8, 0x20u);
    }

    if (v6)
    {
      if ([v4 isEqual:v6]) {
        goto LABEL_12;
      }
      [(AVInterstitialController *)self didPresentInterstitialTimeRange:v6];
    }
    if (v4) {
      [(AVInterstitialController *)self willPresentInterstitialTimeRange:v4];
    }
  }
LABEL_12:
}

- (double)timeToSeekAfterUserNavigatedFromTime:(double)a3 toTime:(double)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  BOOL v7 = [(AVInterstitialController *)self shouldEnforceInterstitialPolicy];
  if (a4 <= a3 || !v7) {
    return a4;
  }
  [(AVInterstitialController *)self displayTimeFromTime:a3];
  double v10 = v9;
  [(AVInterstitialController *)self displayTimeFromTime:a4];
  double v12 = v11;
  id v13 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  uint64_t v14 = [v13 timeRangesBetweenDisplayTime:v10 and:v12];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v15 = v14;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (!v16)
  {
LABEL_18:
    id v23 = v15;
    goto LABEL_23;
  }
  uint64_t v17 = v16;
  uint64_t v18 = *(void *)v28;
LABEL_7:
  uint64_t v19 = 0;
  while (1)
  {
    if (*(void *)v28 != v18) {
      objc_enumerationMutation(v15);
    }
    uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * v19);
    if (objc_msgSend(v20, "isHidden", (void)v27) & 1) != 0 || (objc_msgSend(v20, "isSkipped")) {
      goto LABEL_16;
    }
    v21 = [v20 interstice];
    uint64_t v22 = [v21 requiredViewingPolicy];
    if (v22 == 1) {
      uint64_t v22 = [v21 _watchCount];
    }
    if (!v22) {
      break;
    }

LABEL_16:
    if (v17 == ++v19)
    {
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
      if (v17) {
        goto LABEL_7;
      }
      goto LABEL_18;
    }
  }
  id v23 = v20;

  if (!v23) {
    goto LABEL_24;
  }
  self->_double continuationTimeAfterInterstitial = a4;
  v24 = _AVLog();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)CMTime buf = 136315394;
    v32 = "-[AVInterstitialController timeToSeekAfterUserNavigatedFromTime:toTime:]";
    __int16 v33 = 2114;
    id v34 = v23;
    _os_log_impl(&dword_1B05B7000, v24, OS_LOG_TYPE_DEFAULT, "%s [interstitial] Redirecting playback to %{public}@ to enforce policy", buf, 0x16u);
  }

  [v23 startTime];
  a4 = v25;
LABEL_23:

LABEL_24:
  return a4;
}

- (BOOL)requiresLinearPlayback
{
  BOOL v3 = [(AVInterstitialController *)self shouldEnforceInterstitialPolicy];
  if (v3)
  {
    id v4 = [(AVInterstitialController *)self currentInterstitialTimeRange];
    [(AVInterstitialController *)self currentTime];
    char v5 = objc_msgSend(v4, "requiresLinearPlaybackForTime:");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)shouldEnforceInterstitialPolicy
{
  v2 = [(AVInterstitialController *)self currentItem];
  unint64_t v3 = [v2 interstitialPolicyEnforcement];
  if (v3 >= 4)
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"interstitialPolicyEnforcement value is not supported"];
    BOOL v4 = 0;
  }
  else
  {
    BOOL v4 = (v3 & 0xF) == 1;
  }

  return v4;
}

- (void)_updateInterstitialTimeRangeCollection
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 136315394;
    id v15 = "-[AVInterstitialController _updateInterstitialTimeRangeCollection]";
    __int16 v16 = 1024;
    int v17 = 382;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v14, 0x12u);
  }

  BOOL v4 = [(AVInterstitialController *)self currentItem];
  char v5 = +[AVInterstitialController newTimeRangeCollectionForPlayerItem:v4];

  [(AVInterstitialController *)self isLive];
  __int16 v6 = [(AVInterstitialController *)self interstitialTimeRangeCollection];

  if (v6 != v5)
  {
    BOOL v7 = _AVLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v14 = 138412290;
      id v15 = v5;
      _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Updating interstitial time ranges: %@", (uint8_t *)&v14, 0xCu);
    }

    int v8 = [(AVInterstitialController *)self interstitialTimeRangeInProgress];
    double v9 = [v8 interstice];
    [(AVInterstitialController *)self _stopObservingInterstitialTimeRanges];
    [(AVInterstitialController *)self setInterstitialTimeRangeCollection:v5];
    double v10 = [(AVInterstitialController *)self currentInterstitialTimeRange];
    double v11 = [v10 interstice];
    double v12 = v11;
    if (v9 == v11) {
      goto LABEL_14;
    }
    if (v9 && v11)
    {
      char v13 = [v11 isEqual:v9];
      if (!v8 || (v13 & 1) != 0) {
        goto LABEL_14;
      }
    }
    else if (!v8)
    {
LABEL_14:
      [(AVInterstitialController *)self _startObservingInterstitialTimeRanges];

      goto LABEL_15;
    }
    [(AVInterstitialController *)self didPresentInterstitialTimeRange:v8];
    goto LABEL_14;
  }
LABEL_15:
}

- (void)cancelCurrentPlayerInterstitialEvent
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(AVPlayerInterstitialEventMonitor *)self->_eventMonitor currentEvent];
  if (v3)
  {
    BOOL v4 = _AVLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)CMTime buf = 136315394;
      int v8 = "-[AVInterstitialController cancelCurrentPlayerInterstitialEvent]";
      __int16 v9 = 2114;
      double v10 = v3;
      _os_log_impl(&dword_1B05B7000, v4, OS_LOG_TYPE_DEFAULT, "%s leaving %{public}@", buf, 0x16u);
    }

    eventController = self->_eventController;
    [v3 resumptionOffset];
    [(AVPlayerInterstitialEventController *)eventController cancelCurrentEventWithResumptionOffset:v6];
  }
}

- (void)setInterstitialPlayer:(id)a3
{
  char v5 = (AVPlayer *)a3;
  if (self->_interstitialPlayer != v5)
  {
    uint64_t v11 = v5;
    objc_storeStrong((id *)&self->_interstitialPlayer, a3);
    __int16 v6 = +[AVKitGlobalSettings shared];
    char v7 = [v6 showsTVControls];

    interstitialTimingController = self->_interstitialTimingController;
    if (!interstitialTimingController && (v7 & 1) == 0)
    {
      __int16 v9 = [[AVPlayerTimeController alloc] initWithPlayer:self->_interstitialPlayer];
      double v10 = self->_interstitialTimingController;
      self->_interstitialTimingController = (AVTimeControlling *)v9;

      interstitialTimingController = self->_interstitialTimingController;
    }
    [(AVTimeControlling *)interstitialTimingController setPlayer:self->_interstitialPlayer];
    char v5 = v11;
  }
}

- (double)timeRemainingInCurrentInterstitial
{
  unint64_t v3 = [(AVInterstitialController *)self currentInterstitialTimeRange];
  BOOL v4 = v3;
  if (v3)
  {
    char v5 = [v3 interstice];
    [v5 playingDuration];
    double v7 = v6;

    [(AVInterstitialController *)self elapsedTimeWithinCurrentInterstitial];
    double v9 = v7 - v8;
  }
  else
  {
    double v9 = 0.0;
  }

  return v9;
}

- (double)elapsedTimeWithinCurrentInterstitial
{
  unint64_t v3 = [(AVInterstitialController *)self currentInterstitialTimeRange];
  BOOL v4 = v3;
  if (v3)
  {
    char v5 = [v3 interstice];
    double v6 = [v5 playerInterstitialEvent];

    if (v6)
    {
      [(AVInterstitialController *)self elapsedTimeForInterstitialPlayer];
      double v8 = v7;
    }
    else
    {
      [(AVInterstitialController *)self currentTime];
      double v10 = v9;
      [v4 startTime];
      double v8 = v10 - v11;
    }
  }
  else
  {
    double v8 = 0.0;
  }

  return v8;
}

- (double)elapsedTimeForInterstitialPlayer
{
  v2 = [(AVInterstitialController *)self eventMonitor];
  unint64_t v3 = [v2 interstitialPlayer];
  BOOL v4 = [v3 currentItem];

  if ([v4 status] != 1) {
    goto LABEL_6;
  }
  if (v4) {
    [v4 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  if (fabs(Seconds) == INFINITY) {
LABEL_6:
  }
    double Seconds = NAN;

  return Seconds;
}

- (BOOL)isLive
{
  v2 = [(AVInterstitialController *)self currentItem];
  if ([v2 status] == 1)
  {
    if (!v2)
    {
      LOBYTE(v3) = 0;
      goto LABEL_7;
    }
    [v2 duration];
    if (v6)
    {
      [v2 duration];
      BOOL v3 = (v5 >> 4) & 1;
      goto LABEL_7;
    }
  }
  LOBYTE(v3) = 0;
LABEL_7:

  return v3;
}

- (id)currentOrEstimatedDate
{
  v2 = [(AVInterstitialController *)self currentItem];
  if ([v2 status] == 1)
  {
    BOOL v3 = [v2 currentDate];
    BOOL v4 = v3;
    if (v3)
    {
      id v5 = v3;
    }
    else
    {
      id v5 = [v2 currentEstimatedDate];
    }
    char v6 = v5;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (double)currentDisplayTime
{
  [(AVInterstitialController *)self currentTime];
  double v4 = v3;
  id v5 = [(AVInterstitialController *)self currentInterstitialTimeRange];

  if (v5)
  {
    char v6 = [(AVInterstitialController *)self currentInterstitialTimeRange];
    [v6 startTime];
    double v4 = v7;
  }

  [(AVInterstitialController *)self displayTimeFromTime:v4];
  return result;
}

- (double)currentTime
{
  v2 = [(AVInterstitialController *)self currentItem];
  if ([v2 status] != 1) {
    goto LABEL_6;
  }
  if (v2) {
    [v2 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);
  if (fabs(Seconds) == INFINITY) {
LABEL_6:
  }
    double Seconds = NAN;

  return Seconds;
}

- (id)currentItem
{
  v2 = [(AVInterstitialController *)self player];
  double v3 = [v2 currentItem];

  return v3;
}

- (double)displayTimeFromTime:(double)a3
{
  double v4 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  id v5 = v4;
  if (v4)
  {
    [v4 displayTimeFromTime:a3];
    a3 = v6;
  }

  return a3;
}

- (double)timeFromDisplayTime:(double)a3
{
  double v4 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  id v5 = v4;
  if (v4)
  {
    [v4 timeFromDisplayTime:a3];
    a3 = v6;
  }

  return a3;
}

- (void)setPlayer:(id)a3
{
  id v5 = (AVPlayer *)a3;
  p_player = &self->_player;
  if (self->_player != v5)
  {
    double v7 = v5;
    objc_storeStrong((id *)p_player, a3);
    p_player = (AVPlayer **)[(AVInterstitialController *)self _performInterstitialPlayerDependentUpdates];
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_player, v5);
}

- (void)_performInterstitialPlayerDependentUpdates
{
  double v3 = [(AVInterstitialController *)self player];

  if (v3)
  {
    double v4 = (void *)MEMORY[0x1E4F16618];
    id v5 = [(AVInterstitialController *)self player];
    id v13 = [v4 interstitialEventMonitorWithPrimaryPlayer:v5];

    double v6 = [(AVInterstitialController *)self eventMonitor];
    double v7 = [v6 interstitialPlayer];
    double v8 = [v13 interstitialPlayer];

    if (v7 != v8)
    {
      [(AVInterstitialController *)self setEventMonitor:v13];
      double v9 = (void *)MEMORY[0x1E4F16610];
      double v10 = [(AVInterstitialController *)self player];
      double v11 = [v9 interstitialEventControllerWithPrimaryPlayer:v10];
      [(AVInterstitialController *)self setEventController:v11];

      double v12 = [v13 interstitialPlayer];
      [(AVInterstitialController *)self setInterstitialPlayer:v12];

      [(AVInterstitialController *)self setupInterstitialObservers];
    }
  }
  else
  {
    [(AVInterstitialController *)self setEventMonitor:0];
    [(AVInterstitialController *)self setEventController:0];
    [(AVInterstitialController *)self setInterstitialPlayer:0];
  }
}

- (void)invalidate
{
  double v3 = [(AVInterstitialController *)self kvoPlayerItem];
  [v3 stopAllObservation];

  [(AVInterstitialController *)self setKvoPlayerItem:0];
  double v4 = [(AVInterstitialController *)self kvo];
  [v4 stopAllObservation];

  [(AVInterstitialController *)self setKvo:0];
  if (self->_playerItemTimeJumpedObserver)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_playerItemTimeJumpedObserver];

    playerItemTimeJumpedObserver = self->_playerItemTimeJumpedObserver;
    self->_playerItemTimeJumpedObserver = 0;
  }
  if (self->_playerInterstitialPlayerDidChangeObserver)
  {
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 removeObserver:self->_playerInterstitialPlayerDidChangeObserver];

    playerInterstitialPlayerDidChangeObserver = self->_playerInterstitialPlayerDidChangeObserver;
    self->_playerInterstitialPlayerDidChangeObserver = 0;
  }
  if (self->_playerInterstitialEventsChangedObserver)
  {
    double v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 removeObserver:self->_playerInterstitialEventsChangedObserver];

    playerInterstitialEventsChangedObserver = self->_playerInterstitialEventsChangedObserver;
    self->_playerInterstitialEventsChangedObserver = 0;
  }
  if (self->_playerInterstitialCurrentEventChangedObserver)
  {
    double v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v11 removeObserver:self->_playerInterstitialCurrentEventChangedObserver];

    playerInterstitialCurrentEventChangedObserver = self->_playerInterstitialCurrentEventChangedObserver;
    self->_playerInterstitialCurrentEventChangedObserver = 0;
  }
  if (self->_player)
  {
    [(AVInterstitialController *)self setPlayer:0];
  }
}

- (void)dealloc
{
  [(AVInterstitialController *)self invalidate];
  v3.receiver = self;
  v3.super_class = (Class)AVInterstitialController;
  [(AVInterstitialController *)&v3 dealloc];
}

- (void)setupInterstitialObservers
{
  objc_initWeak(&location, self);
  if (self->_playerInterstitialEventsChangedObserver)
  {
    objc_super v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_playerInterstitialEventsChangedObserver];

    playerInterstitialEventsChangedObserver = self->_playerInterstitialEventsChangedObserver;
    self->_playerInterstitialEventsChangedObserver = 0;
  }
  if (self->_playerInterstitialCurrentEventChangedObserver)
  {
    id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v5 removeObserver:self->_playerInterstitialCurrentEventChangedObserver];

    playerInterstitialCurrentEventChangedObserver = self->_playerInterstitialCurrentEventChangedObserver;
    self->_playerInterstitialCurrentEventChangedObserver = 0;
  }
  double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
  double v8 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v9 = *MEMORY[0x1E4F16010];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __54__AVInterstitialController_setupInterstitialObservers__block_invoke;
  v19[3] = &unk_1E5FC3168;
  objc_copyWeak(&v20, &location);
  double v10 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v19];
  double v11 = self->_playerInterstitialEventsChangedObserver;
  self->_playerInterstitialEventsChangedObserver = v10;

  double v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  id v13 = [MEMORY[0x1E4F28F08] mainQueue];
  uint64_t v14 = *MEMORY[0x1E4F16008];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __54__AVInterstitialController_setupInterstitialObservers__block_invoke_24;
  v17[3] = &unk_1E5FC3168;
  objc_copyWeak(&v18, &location);
  id v15 = [v12 addObserverForName:v14 object:0 queue:v13 usingBlock:v17];
  __int16 v16 = self->_playerInterstitialCurrentEventChangedObserver;
  self->_playerInterstitialCurrentEventChangedObserver = v15;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

void __54__AVInterstitialController_setupInterstitialObservers__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained(v2);
  id v5 = [v3 object];

  double v6 = _AVLog();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "AVPlayerInterstitialEventMonitorEventsDidChangeNotification received for %@", (uint8_t *)&v12, 0xCu);
  }

  if (WeakRetained && v5)
  {
    if (v5 == WeakRetained[16]
      || ([v5 primaryPlayer],
          double v7 = objc_claimAutoreleasedReturnValue(),
          [WeakRetained[16] primaryPlayer],
          double v8 = objc_claimAutoreleasedReturnValue(),
          v8,
          v7,
          v7 == v8))
    {
      double v11 = _AVLog();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1B05B7000, v11, OS_LOG_TYPE_DEFAULT, "Updating synthesized interstitials, triggered by notification", (uint8_t *)&v12, 2u);
      }

      [WeakRetained updateSynthesizedInterstitialTimeRanges];
    }
    else
    {
      uint64_t v9 = _AVLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        id v10 = WeakRetained[16];
        int v12 = 138543618;
        id v13 = v5;
        __int16 v14 = 2114;
        id v15 = v10;
        _os_log_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_DEFAULT, "not updating synthesized interstitials, because the notification observer (%{public}@) is not our monitor (%{public}@)", (uint8_t *)&v12, 0x16u);
      }
    }
  }
}

void __54__AVInterstitialController_setupInterstitialObservers__block_invoke_24(uint64_t a1, void *a2)
{
  v12[1] = *MEMORY[0x1E4F143B8];
  v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  id v5 = [v3 object];

  if (v5 == (void *)WeakRetained[16])
  {
    double v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "Updating current interstitial, triggered by notification", v10, 2u);
    }

    double v7 = [v5 currentEvent];
    [WeakRetained _sendInterstitialBoundaryNotificationsForEvent:v7];
    if (v7)
    {
      double v11 = @"currentEvent";
      v12[0] = v7;
      double v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    }
    else
    {
      double v8 = (void *)MEMORY[0x1E4F1CC08];
    }
    uint64_t v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"AVKitCurrentInterstitialEventChangedNotification" object:WeakRetained userInfo:v8];
  }
}

- (AVInterstitialController)init
{
  v18.receiver = self;
  v18.super_class = (Class)AVInterstitialController;
  v2 = [(AVInterstitialController *)&v18 init];
  if (v2)
  {
    id v3 = [[AVObservationController alloc] initWithOwner:v2];
    kvo = v2->_kvo;
    v2->_kvo = v3;

    objc_initWeak(&location, v2);
    id v5 = v2->_kvo;
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __32__AVInterstitialController_init__block_invoke;
    v15[3] = &unk_1E5FC3140;
    objc_copyWeak(&v16, &location);
    id v6 = [(AVObservationController *)v5 startObserving:v2 keyPath:@"player.currentItem" includeInitialValue:0 observationHandler:v15];
    double v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    double v8 = [MEMORY[0x1E4F28F08] mainQueue];
    uint64_t v9 = *MEMORY[0x1E4F16018];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __32__AVInterstitialController_init__block_invoke_22;
    v13[3] = &unk_1E5FC3168;
    objc_copyWeak(&v14, &location);
    uint64_t v10 = [v7 addObserverForName:v9 object:0 queue:v8 usingBlock:v13];
    playerInterstitialPlayerDidChangeObserver = v2->_playerInterstitialPlayerDidChangeObserver;
    v2->_playerInterstitialPlayerDidChangeObserver = v10;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __32__AVInterstitialController_init__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  v21[4] = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [v7 player];
  double v11 = [v10 currentItem];

  int v12 = [v7 kvoPlayerItem];
  [v12 stopAllObservation];

  if (v11)
  {
    id v13 = [[AVObservationController alloc] initWithOwner:v7];
    [v7 setKvoPlayerItem:v13];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __32__AVInterstitialController_init__block_invoke_2;
    v19[3] = &unk_1E5FC3140;
    objc_copyWeak(&v20, (id *)(a1 + 32));
    id v14 = (void *)MEMORY[0x1B3E963E0](v19);
    v21[0] = @"interstitialTimeRanges";
    v21[1] = @"forwardPlaybackEndTime";
    v21[2] = @"reversePlaybackEndTime";
    v21[3] = @"duration";
    id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:4];
    id v16 = [(AVObservationController *)v13 startObserving:v11 keyPaths:v15 includeInitialValue:0 observationHandler:v14];

    [v7 updateSynthesizedInterstitialTimeRanges];
    objc_destroyWeak(&v20);
  }
  else
  {
    [v7 setKvoPlayerItem:0];
  }
  int v17 = _AVLog();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)objc_super v18 = 0;
    _os_log_impl(&dword_1B05B7000, v17, OS_LOG_TYPE_DEFAULT, "Updating interstitial collection triggered by currentItem change", v18, 2u);
  }

  [v7 _updateInterstitialTimeRangeCollection];
}

void __32__AVInterstitialController_init__block_invoke_22(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _performInterstitialPlayerDependentUpdates];
}

void __32__AVInterstitialController_init__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = _AVLog();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = [v5 keyPath];
    LODWORD(buf.value) = 138412290;
    *(CMTimeValue *)((char *)&buf.value + 4) = (CMTimeValue)v8;
    _os_log_impl(&dword_1B05B7000, v7, OS_LOG_TYPE_DEFAULT, "Updating interstitial collection triggered by KVO change for key path %@", (uint8_t *)&buf, 0xCu);
  }
  id v9 = [v5 keyPath];
  int v10 = [v9 isEqualToString:@"duration"];

  if (!v10) {
    goto LABEL_17;
  }
  memset(&buf, 0, sizeof(buf));
  double v11 = [v5 oldValue];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  id v13 = (CMTime *)MEMORY[0x1E4F1F9F8];
  if (isKindOfClass)
  {
    id v14 = [v5 oldValue];
    id v15 = v14;
    if (v14) {
      [v14 CMTimeValue];
    }
    else {
      memset(&buf, 0, sizeof(buf));
    }
  }
  else
  {
    CMTime buf = *(CMTime *)*(void *)&MEMORY[0x1E4F1F9F8];
  }

  memset(&v22, 0, sizeof(v22));
  id v16 = [v5 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v17 = [v5 value];
    objc_super v18 = v17;
    if (v17) {
      [v17 CMTimeValue];
    }
    else {
      memset(&v22, 0, sizeof(v22));
    }
  }
  else
  {
    CMTime v22 = *v13;
  }

  CMTime time1 = buf;
  CMTime v20 = v22;
  if (!CMTimeCompare(&time1, &v20))
  {
    uint64_t v19 = _AVLog();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(time1.value) = 0;
      _os_log_impl(&dword_1B05B7000, v19, OS_LOG_TYPE_DEFAULT, "(Actually, the duration did not change; no need to update interstitials)",
        (uint8_t *)&time1,
        2u);
    }
  }
  else
  {
LABEL_17:
    [WeakRetained _updateInterstitialTimeRangeCollection];
  }
}

- (BOOL)loadDurationOfCurrentOrNextInterstitialEvent:(id)a3
{
  id v4 = a3;
  id v5 = [(AVPlayerInterstitialEventMonitor *)self->_eventMonitor currentEvent];
  id v6 = [(AVPlayerInterstitialEventMonitor *)self->_eventMonitor interstitialPlayer];
  id v7 = v6;
  if (v5
    || ([v6 items],
        id v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 count],
        v8,
        v9))
  {
    int v10 = (void *)[v4 copy];

    double v11 = [(id)objc_opt_class() interstitialQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke;
    v14[3] = &unk_1E5FC45E0;
    id v15 = v7;
    id v16 = v5;
    int v17 = self;
    id v4 = v10;
    id v18 = v4;
    dispatch_async(v11, v14);

    BOOL v12 = 1;
  }
  else
  {
    BOOL v12 = 0;
  }

  return v12;
}

void __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3810000000;
  v29[3] = &unk_1B0741513;
  long long v30 = *MEMORY[0x1E4F1FA48];
  uint64_t v31 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  v2 = dispatch_group_create();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = a1;
  id v3 = [*(id *)(a1 + 32) items];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v26;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v26 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = [*(id *)(*((void *)&v25 + 1) + 8 * v6) asset];
        if (v7)
        {
          dispatch_group_enter(v2);
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_2;
          v21[3] = &unk_1E5FC4298;
          id v8 = v7;
          id v22 = v8;
          uint64_t v24 = v29;
          id v23 = v2;
          [v8 loadValuesAsynchronouslyForKeys:&unk_1F094A340 completionHandler:v21];
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v25 objects:v32 count:16];
    }
    while (v4);
  }

  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_group_wait(v2, v9);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_3;
  block[3] = &unk_1E5FC31F8;
  id v16 = v2;
  CMTime v20 = v29;
  id v10 = *(id *)(v14 + 40);
  uint64_t v11 = *(void *)(v14 + 48);
  BOOL v12 = *(void **)(v14 + 56);
  id v17 = v10;
  uint64_t v18 = v11;
  id v19 = v12;
  id v13 = v2;
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v29, 8);
}

void __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_2(uint64_t a1)
{
  memset(&v10, 0, sizeof(v10));
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    [v2 duration];
    char flags = v10.flags;
    if ((~v10.flags & 0x11) == 0)
    {
      uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v5 = MEMORY[0x1E4F1F9F0];
      *(_OWORD *)(v4 + 32) = *MEMORY[0x1E4F1F9F0];
      *(void *)(v4 + 48) = *(void *)(v5 + 16);
    }
  }
  else
  {
    char flags = 0;
  }
  if ((flags & 0x1D) == 1)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    if ((*(_DWORD *)(v6 + 44) & 0x11) != 0x11)
    {
      CMTime lhs = *(CMTime *)(v6 + 32);
      CMTime v7 = v10;
      CMTimeAdd(&v9, &lhs, &v7);
      *(CMTime *)(*(void *)(*(void *)(a1 + 48) + 8) + 32) = v9;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __102__AVInterstitialController_AVPlayerInterstitialSupport__loadDurationOfCurrentOrNextInterstitialEvent___block_invoke_3(uint64_t a1)
{
  if (dispatch_group_wait(*(dispatch_group_t *)(a1 + 32), 0))
  {
    double Seconds = NAN;
  }
  else
  {
    CMTime v6 = *(CMTime *)(*(void *)(*(void *)(a1 + 64) + 8) + 32);
    double Seconds = CMTimeGetSeconds(&v6);
  }
  id v3 = *(void **)(a1 + 48);
  if (*(void *)(a1 + 40)) {
    objc_msgSend(v3, "timeRangeForPlayerInterstitialEvent:");
  }
  else {
  uint64_t v4 = [v3 nextInterstitialTimeRange];
  }
  uint64_t v5 = [v4 interstice];
  [v5 _setPlayingDuration:Seconds];

  (*(void (**)(double))(*(void *)(a1 + 56) + 16))(Seconds);
}

- (id)timeRangeForPlayerInterstitialEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AVInterstitialController *)self interstitialTimeRangeCollection];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CMTime v6 = objc_msgSend(v5, "timeRanges", 0);
  id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v6);
        }
        CMTime v10 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        uint64_t v11 = [v10 interstice];
        BOOL v12 = [v11 playerInterstitialEvent];
        char v13 = [v4 isEqual:v12];

        if (v13)
        {
          id v7 = v10;

          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)interstitialTimeRangeForPlayerInterstitialEvent:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(AVInterstitialController *)self currentItem];
  CMTime v6 = [v5 interstitialTimeRanges];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v6;
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        BOOL v12 = objc_msgSend(v11, "playerInterstitialEvent", (void)v15);
        char v13 = [v4 isEqual:v12];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (void)updateSynthesizedInterstitialTimeRanges
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVInterstitialController *)self currentItem];
  int v4 = [v3 translatesPlayerInterstitialEvents];

  if (v4)
  {
    id v5 = [(AVInterstitialController *)self _copySynthesizedInterstitialTimeRanges];
    CMTime v6 = _AVLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 136315394;
      uint64_t v9 = "-[AVInterstitialController(AVPlayerInterstitialSupport) updateSynthesizedInterstitialTimeRanges]";
      __int16 v10 = 2048;
      uint64_t v11 = [v5 count];
      _os_log_impl(&dword_1B05B7000, v6, OS_LOG_TYPE_DEFAULT, "%s updating; %lu time range(s)", (uint8_t *)&v8, 0x16u);
    }

    if ([v5 count])
    {
      id v7 = [(AVInterstitialController *)self currentItem];
      [v7 setInterstitialTimeRanges:v5];
    }
  }
}

- (id)_copySynthesizedInterstitialTimeRanges
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = [(AVPlayerInterstitialEventMonitor *)self->_eventMonitor events];
  if ([v3 count])
  {
    int v4 = [(AVInterstitialController *)self currentItem];
    uint64_t v24 = [v4 interstitialTimeRanges];

    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    uint64_t v20 = v3;
    id obj = v3;
    uint64_t v5 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v23 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v30 != v23) {
            objc_enumerationMutation(obj);
          }
          int v8 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          long long v28 = 0u;
          id v9 = v24;
          uint64_t v10 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v10)
          {
            uint64_t v11 = v10;
            uint64_t v12 = *(void *)v26;
LABEL_9:
            uint64_t v13 = 0;
            while (1)
            {
              if (*(void *)v26 != v12) {
                objc_enumerationMutation(v9);
              }
              uint64_t v14 = *(void **)(*((void *)&v25 + 1) + 8 * v13);
              long long v15 = [v14 playerInterstitialEvent];
              char v16 = [v8 isEqual:v15];

              if (v16) {
                break;
              }
              if (v11 == ++v13)
              {
                uint64_t v11 = [v9 countByEnumeratingWithState:&v25 objects:v33 count:16];
                if (v11) {
                  goto LABEL_9;
                }
                goto LABEL_15;
              }
            }
            id v17 = v14;

            if (v17) {
              goto LABEL_18;
            }
          }
          else
          {
LABEL_15:
          }
          id v17 = +[AVInterstitialTimeRange interstitialTimeRangeWithPlayerInterstitialEvent:v8];
          if (v17)
          {
LABEL_18:
            [v22 addObject:v17];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      }
      while (v6);
    }

    long long v18 = (void *)[v22 copy];
    id v3 = v20;
  }
  else
  {
    long long v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

+ (id)newTimeRangeCollectionForPlayerItem:(id)a3 reversePlaybackEndTime:(id *)a4 forwardPlaybackEndTime:(id *)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  int v8 = v7;
  if (v7)
  {
    id v9 = [v7 interstitialTimeRanges];
    if ([v8 status] == 1)
    {
      [v8 duration];
      if (v37)
      {
        [v8 duration];
        if ((v36 & 0x10) != 0)
        {
          long long v34 = 0u;
          long long v35 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v10 = v9;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
          if (v11)
          {
            uint64_t v12 = v11;
            uint64_t v13 = *(void *)v33;
            do
            {
              for (uint64_t i = 0; i != v12; ++i)
              {
                if (*(void *)v33 != v13) {
                  objc_enumerationMutation(v10);
                }
                [*(id *)(*((void *)&v32 + 1) + 8 * i) _setCollapsedInTimeLine:0];
              }
              uint64_t v12 = [v10 countByEnumeratingWithState:&v32 objects:v39 count:16];
            }
            while (v12);
          }
        }
      }
    }
    memset(&v31, 0, sizeof(v31));
    [v8 duration];
    uint64_t v15 = MEMORY[0x1E4F1FA48];
    if ((a4->var2 & 1) != 0
      && (CMTime time1 = (CMTime)*a4,
          long long v26 = *MEMORY[0x1E4F1FA48],
          *(_OWORD *)&time2.value = *MEMORY[0x1E4F1FA48],
          CMTimeEpoch v16 = *(void *)(MEMORY[0x1E4F1FA48] + 16),
          time2.epoch = v16,
          CMTimeCompare(&time1, &time2) >= 1))
    {
      id v17 = [AVInterstitialTimeRange alloc];
      *(_OWORD *)&time1.value = v26;
      time1.epoch = v16;
      CMTime time2 = (CMTime)*a4;
      CMTimeRangeMake(&v28, &time1, &time2);
      long long v18 = [(AVInterstitialTimeRange *)v17 initWithHiddenTimeRange:&v28];
      v38 = v18;
      id v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
      uint64_t v20 = [v19 arrayByAddingObjectsFromArray:v9];

      id v9 = (void *)v20;
    }
    else
    {
      *(_OWORD *)&a4->var0 = *(_OWORD *)v15;
      a4->var3 = *(void *)(v15 + 16);
    }
    if (a5->var2)
    {
      CMTime time1 = (CMTime)*a5;
      CMTime time2 = (CMTime)*a4;
      if (CMTimeCompare(&time1, &time2) >= 1)
      {
        CMTime time1 = (CMTime)*a5;
        CMTime time2 = v31;
        if (CMTimeCompare(&time1, &time2) < 0)
        {
          v21 = [AVInterstitialTimeRange alloc];
          CMTime time1 = (CMTime)*a5;
          CMTime time2 = v31;
          CMTimeRangeFromTimeToTime(&v27, &time1, &time2);
          id v22 = [(AVInterstitialTimeRange *)v21 initWithHiddenTimeRange:&v27];
          uint64_t v23 = [v9 arrayByAddingObject:v22];

          id v9 = (void *)v23;
        }
      }
    }
    if (objc_msgSend(v9, "count", v26)) {
      uint64_t v24 = [[AVTimeRangeCollection alloc] initWithInterstitialTimeRanges:v9];
    }
    else {
      uint64_t v24 = 0;
    }
  }
  else
  {
    uint64_t v24 = 0;
  }

  return v24;
}

+ (id)interstitialQueue
{
  if (interstitialQueue_onceToken != -1) {
    dispatch_once(&interstitialQueue_onceToken, &__block_literal_global_219);
  }
  v2 = (void *)interstitialQueue__interstitialQueue;

  return v2;
}

uint64_t __74__AVInterstitialController_AVPlayerInterstitialSupport__interstitialQueue__block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.avkit.interstitial", 0);
  uint64_t v1 = interstitialQueue__interstitialQueue;
  interstitialQueue__interstitialQueue = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end