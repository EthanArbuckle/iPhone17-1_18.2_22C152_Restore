@interface HFCameraClipPlayer
- (BOOL)hasFatalError;
- (BOOL)isMutatingQueue;
- (BOOL)isScrubbing;
- (BOOL)shouldBypassScrubbing;
- (HFCameraClipPlayer)init;
- (HFCameraClipPlayer)initWithCameraProfile:(id)a3 clips:(id)a4;
- (HFCameraClipPlayer)initWithCameraProfile:(id)a3 clips:(id)a4 queuePlayer:(id)a5;
- (HFCameraClipPlayerDelegate)delegate;
- (HFCameraClipPlayerItem)lastPlayerItem;
- (HFCameraClipPosition)currentPosition;
- (HFCameraClipQueuePlayer)queuePlayer;
- (HFCameraClipScrubbing)scrubber;
- (HFCameraVideoCache)videoCache;
- (HMCameraProfile)cameraProfile;
- (NSArray)clips;
- (NSArray)queuableItems;
- (NSError)error;
- (double)currentTime;
- (id)addPeriodicTimeObserverForInterval:(double)a3 usingBlock:(id)a4;
- (id)createQueueableItemForClipManager:(id)a3 clip:(id)a4;
- (int64_t)timeControlStatus;
- (void)_rebuildPlayerQueueForPosition:(id)a3;
- (void)_setupObservationForLastPlayerItem:(id)a3;
- (void)_setupPlayerObservation;
- (void)_updateErrorState;
- (void)_updatePlayerActionAtItemEnd;
- (void)dealloc;
- (void)endScrubbingWithOffset:(double)a3;
- (void)insertQueueableItem:(id)a3 afterItem:(id)a4;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)pause;
- (void)play;
- (void)playerItemDidPlayToEndTime:(id)a3;
- (void)removeQueueableItem:(id)a3;
- (void)removeTimeObserver:(id)a3;
- (void)seekToOffset:(double)a3 inItem:(id)a4;
- (void)setClips:(id)a3;
- (void)setCurrentPosition:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setError:(id)a3;
- (void)setLastPlayerItem:(id)a3;
- (void)setMutatingQueue:(BOOL)a3;
- (void)setScrubber:(id)a3;
- (void)setScrubbing:(BOOL)a3;
- (void)setShouldBypassScrubbing:(BOOL)a3;
- (void)setVideoCache:(id)a3;
@end

@implementation HFCameraClipPlayer

- (HFCameraClipPlayer)init
{
  v4 = [MEMORY[0x263F08690] currentHandler];
  v5 = NSStringFromSelector(sel_initWithCameraProfile_clips_);
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"HFCameraClipPlayer.m", 48, @"%s is unavailable; use %@ instead",
    "-[HFCameraClipPlayer init]",
    v5);

  return 0;
}

- (HFCameraClipPlayer)initWithCameraProfile:(id)a3 clips:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [HFCameraClipQueuePlayer alloc];
  v9 = [(HFCameraClipQueuePlayer *)v8 initWithItems:MEMORY[0x263EFFA68]];
  v10 = [(HFCameraClipPlayer *)self initWithCameraProfile:v7 clips:v6 queuePlayer:v9];

  return v10;
}

- (HFCameraClipPlayer)initWithCameraProfile:(id)a3 clips:(id)a4 queuePlayer:(id)a5
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (!v11)
  {
    v21 = [MEMORY[0x263F08690] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"HFCameraClipPlayer.m", 59, @"Invalid parameter not satisfying: %@", @"clips != nil" object file lineNumber description];
  }
  v22.receiver = self;
  v22.super_class = (Class)HFCameraClipPlayer;
  v13 = [(HFCameraClipPlayer *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_cameraProfile, a3);
    objc_storeStrong((id *)&v14->_clips, a4);
    objc_storeStrong((id *)&v14->_queuePlayer, a5);
    if (!+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")&& !+[HFUtilities isPressDemoModeEnabled])
    {
      v15 = [[HFCameraVideoDownloader alloc] initWithCameraProfile:v10];
      v16 = [[HFCameraVideoCache alloc] initWithVideoDownloader:v15];
      videoCache = v14->_videoCache;
      v14->_videoCache = v16;

      if ([v11 count])
      {
        v18 = v14->_videoCache;
        v19 = [v11 lastObject];
        [(HFCameraVideoCache *)v18 cacheClip:v19];
      }
    }
    [(HFCameraClipPlayer *)v14 _updatePlayerActionAtItemEnd];
    [(HFCameraClipPlayer *)v14 _setupPlayerObservation];
  }

  return v14;
}

- (void)dealloc
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromSelector(a2);
    *(_DWORD *)buf = 138412546;
    v14 = self;
    __int16 v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_20B986000, v4, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
  }
  if (!+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")&& !+[HFUtilities isPressDemoModeEnabled])
  {
    id v6 = [(HFCameraClipPlayer *)self videoCache];
    [v6 waitForOperations];

    [(HFCameraClipPlayer *)self setVideoCache:0];
  }
  id v7 = [(HFCameraClipPlayer *)self queuePlayer];
  [v7 removeObserver:self forKeyPath:@"timeControlStatus"];

  v8 = [(HFCameraClipPlayer *)self queuePlayer];
  [v8 removeObserver:self forKeyPath:@"status"];

  v9 = [(HFCameraClipPlayer *)self queuePlayer];
  [v9 removeObserver:self forKeyPath:@"currentItem"];

  id v10 = [(HFCameraClipPlayer *)self queuePlayer];
  [v10 removeObserver:self forKeyPath:@"muted"];

  id v11 = [MEMORY[0x263F08A00] defaultCenter];
  [v11 removeObserver:self];

  v12.receiver = self;
  v12.super_class = (Class)HFCameraClipPlayer;
  [(HFCameraClipPlayer *)&v12 dealloc];
}

- (HFCameraClipPosition)currentPosition
{
  v3 = [(HFCameraClipPlayer *)self queuePlayer];
  v4 = [v3 currentItem];
  v5 = [v4 clip];

  if (v5)
  {
    id v6 = [(HFCameraClipPlayer *)self queuePlayer];
    id v7 = v6;
    if (v6) {
      [v6 currentTime];
    }
    else {
      memset(&time, 0, sizeof(time));
    }
    double Seconds = CMTimeGetSeconds(&time);

    v8 = +[HFCameraClipPosition positionWithClip:v5 offset:Seconds];
  }
  else
  {
    v8 = 0;
  }

  return (HFCameraClipPosition *)v8;
}

- (void)setCurrentPosition:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ([(HFCameraClipPlayer *)self hasFatalError])
  {
    id v6 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      id v7 = NSStringFromSelector(a2);
      v8 = [(HFCameraClipPlayer *)self error];
      int v17 = 138412802;
      v18 = self;
      __int16 v19 = 2112;
      v20 = v7;
      __int16 v21 = 2112;
      objc_super v22 = v8;
      _os_log_error_impl(&dword_20B986000, v6, OS_LOG_TYPE_ERROR, "Ignoring request to -[%@ %@] as the player has a fatal error and cannot be used. Error: %@", (uint8_t *)&v17, 0x20u);
    }
    goto LABEL_9;
  }
  v9 = [(HFCameraClipPlayer *)self currentPosition];
  id v10 = v5;
  id v6 = v10;
  if (v9 == v10)
  {

LABEL_9:
    goto LABEL_18;
  }
  if (v9)
  {
    char v11 = [v9 isEqual:v10];

    if (v11) {
      goto LABEL_18;
    }
  }
  else
  {
  }
  objc_super v12 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = [(HFCameraClipPlayer *)self currentPosition];
    BOOL scrubbing = self->_scrubbing;
    int v17 = 138412802;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = v6;
    __int16 v21 = 1024;
    LODWORD(v22) = scrubbing;
    _os_log_impl(&dword_20B986000, v12, OS_LOG_TYPE_DEFAULT, "Player updating playback position \nFROM:%@ \nTO:%@\nScrubbing:%{BOOL}d", (uint8_t *)&v17, 0x1Cu);
  }
  __int16 v15 = [v6 date];

  if (!v15)
  {
    v16 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v17 = 136315394;
      v18 = (HFCameraClipPlayer *)"-[HFCameraClipPlayer setCurrentPosition:]";
      __int16 v19 = 2112;
      v20 = v6;
      _os_log_error_impl(&dword_20B986000, v16, OS_LOG_TYPE_ERROR, "%s: newPosition does not contain an event: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  [(HFCameraClipPlayer *)self _rebuildPlayerQueueForPosition:v6];
LABEL_18:
}

- (double)currentTime
{
  v2 = [(HFCameraClipPlayer *)self player];
  v3 = v2;
  if (v2) {
    [v2 currentTime];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- (void)setLastPlayerItem:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = objc_loadWeakRetained((id *)&self->_lastPlayerItem);
  id v6 = v4;
  id v7 = v6;
  if (v5 == v6)
  {
  }
  else
  {
    if (v5)
    {
      char v8 = [v5 isEqual:v6];

      if (v8) {
        goto LABEL_10;
      }
    }
    else
    {
    }
    v9 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_lastPlayerItem);
      int v11 = 138412546;
      id v12 = WeakRetained;
      __int16 v13 = 2112;
      v14 = v7;
      _os_log_impl(&dword_20B986000, v9, OS_LOG_TYPE_DEFAULT, "Updating lastPlayerItem from: %@ to: %@", (uint8_t *)&v11, 0x16u);
    }
    [(HFCameraClipPlayer *)self _setupObservationForLastPlayerItem:v7];
    objc_storeWeak((id *)&self->_lastPlayerItem, v7);
  }
LABEL_10:
}

- (int64_t)timeControlStatus
{
  v2 = [(HFCameraClipPlayer *)self player];
  int64_t v3 = [v2 timeControlStatus];

  return v3;
}

- (BOOL)hasFatalError
{
  v2 = [(HFCameraClipPlayer *)self player];
  int64_t v3 = [v2 error];
  BOOL v4 = v3 != 0;

  return v4;
}

- (void)play
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  BOOL v4 = [(HFCameraClipPlayer *)self hasFatalError];
  id v5 = HFLogForCategory(0x17uLL);
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      id v7 = NSStringFromSelector(a2);
      char v8 = [(HFCameraClipPlayer *)self error];
      *(_DWORD *)buf = 138412802;
      __int16 v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = v7;
      __int16 v22 = 2112;
      Float64 v23 = *(double *)&v8;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "Ignoring request to -[%@ %@] as the player has a fatal error and cannot be used. Error: %@", buf, 0x20u);
    }
  }
  else
  {
    if (v6)
    {
      v9 = [(HFCameraClipPlayer *)self currentPosition];
      id v10 = [v9 clip];
      int v11 = [v10 uniqueIdentifier];
      id v12 = [(HFCameraClipPlayer *)self player];
      __int16 v13 = v12;
      if (v12) {
        [v12 currentTime];
      }
      else {
        memset(&time, 0, sizeof(time));
      }
      Float64 Seconds = CMTimeGetSeconds(&time);
      uint64_t v15 = [(HFCameraClipPlayer *)self player];
      v16 = [v15 currentItem];
      *(_DWORD *)buf = 138413058;
      __int16 v19 = self;
      __int16 v20 = 2112;
      __int16 v21 = v11;
      __int16 v22 = 2048;
      Float64 v23 = Seconds;
      __int16 v24 = 2112;
      v25 = v16;
      _os_log_impl(&dword_20B986000, v5, OS_LOG_TYPE_DEFAULT, "-[%@ play] clipUUID:%@ at offset:%.2f for item:%@", buf, 0x2Au);
    }
    id v5 = [(HFCameraClipPlayer *)self queuePlayer];
    [v5 play];
  }
}

- (void)pause
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int64_t v3 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v4 = [(HFCameraClipPlayer *)self currentPosition];
    id v5 = [v4 clip];
    BOOL v6 = [v5 uniqueIdentifier];
    id v7 = [(HFCameraClipPlayer *)self currentPosition];
    char v8 = [v7 date];
    int v10 = 138412802;
    int v11 = self;
    __int16 v12 = 2112;
    __int16 v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    _os_log_impl(&dword_20B986000, v3, OS_LOG_TYPE_DEFAULT, "-[%@ pause] clipUUID:%@ at:%@", (uint8_t *)&v10, 0x20u);
  }
  v9 = [(HFCameraClipPlayer *)self queuePlayer];
  [v9 pause];
}

- (void)endScrubbingWithOffset:(double)a3
{
  [(HFCameraClipPlayer *)self setScrubbing:0];
  id v5 = [(HFCameraClipPlayer *)self scrubber];
  [v5 endScrubbingWithTargetTime:a3];
}

- (void)setScrubbing:(BOOL)a3
{
  if (self->_scrubbing != a3)
  {
    self->_BOOL scrubbing = a3;
    if (a3)
    {
      id v3 = [(HFCameraClipPlayer *)self scrubber];
      [v3 beginScrubbing];
    }
  }
}

- (id)addPeriodicTimeObserverForInterval:(double)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v7 = [(HFCameraClipPlayer *)self player];
  CMTimeMakeWithSeconds(&v13, a3, 60);
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __68__HFCameraClipPlayer_addPeriodicTimeObserverForInterval_usingBlock___block_invoke;
  v11[3] = &unk_26408F770;
  id v12 = v6;
  id v8 = v6;
  v9 = [v7 addPeriodicTimeObserverForInterval:&v13 queue:MEMORY[0x263EF83A0] usingBlock:v11];

  return v9;
}

uint64_t __68__HFCameraClipPlayer_addPeriodicTimeObserverForInterval_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeTimeObserver:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraClipPlayer *)self player];
  [v5 removeTimeObserver:v4];
}

- (void)_updatePlayerActionAtItemEnd
{
  id v5 = [(HFCameraClipPlayer *)self queuePlayer];
  BOOL v3 = [v5 timeControlStatus] != 2;
  id v4 = [(HFCameraClipPlayer *)self queuePlayer];
  [v4 setActionAtItemEnd:v3];
}

- (void)_updateErrorState
{
  BOOL v3 = [(HFCameraClipPlayer *)self error];
  id v4 = [(HFCameraClipPlayer *)self player];
  id v5 = [v4 error];
  if (v5)
  {
    [(HFCameraClipPlayer *)self setError:v5];
  }
  else
  {
    id v6 = [(HFCameraClipPlayer *)self player];
    id v7 = [v6 currentItem];
    id v8 = [v7 error];
    [(HFCameraClipPlayer *)self setError:v8];
  }
  id v9 = [(HFCameraClipPlayer *)self error];
  id v10 = v3;
  int v11 = v10;
  if (v9 == v10)
  {
  }
  else
  {
    if (v9)
    {
      char v12 = [v9 isEqual:v10];

      if (v12) {
        goto LABEL_12;
      }
    }
    else
    {
    }
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__HFCameraClipPlayer__updateErrorState__block_invoke;
    block[3] = &unk_26408DDE0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    CMTime v13 = [(HFCameraClipPlayer *)self error];

    if (v13)
    {
      __int16 v14 = [(HFCameraClipPlayer *)self error];
      id v15 = +[HFCameraAnalyticsEventHandler sendCameraClipPlayerDidUpdateEventWithError:v14];
    }
  }
LABEL_12:
}

void __39__HFCameraClipPlayer__updateErrorState__block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 error];
  objc_msgSend(v4, "clipPlayer:didUpdateError:isFatal:", v2, v3, objc_msgSend(*(id *)(a1 + 32), "hasFatalError"));
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  id v10 = a3;
  if ((void *)HFCameraClipQueuePlayerContext != a6)
  {
    v32.receiver = self;
    v32.super_class = (Class)HFCameraClipPlayer;
    [(HFCameraClipPlayer *)&v32 observeValueForKeyPath:v10 ofObject:a4 change:a5 context:a6];
    goto LABEL_26;
  }
  if ([(HFCameraClipPlayer *)self isMutatingQueue]) {
    goto LABEL_26;
  }
  if ([v10 isEqual:@"timeControlStatus"])
  {
    int v11 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      char v12 = [(HFCameraClipPlayer *)self queuePlayer];
      *(_DWORD *)buf = 138412546;
      v35 = self;
      __int16 v36 = 2048;
      uint64_t v37 = [v12 timeControlStatus];
      _os_log_impl(&dword_20B986000, v11, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ didUpdateTimeControlStatus:%ld", buf, 0x16u);
    }
    [(HFCameraClipPlayer *)self _updatePlayerActionAtItemEnd];
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __69__HFCameraClipPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke;
    block[3] = &unk_26408DDE0;
    block[4] = self;
    dispatch_async(MEMORY[0x263EF83A0], block);
    goto LABEL_26;
  }
  if ([v10 isEqual:@"currentItem"])
  {
    CMTime v13 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      __int16 v14 = [(HFCameraClipPlayer *)self queuePlayer];
      id v15 = [v14 currentItem];
      *(_DWORD *)buf = 138412546;
      v35 = self;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v15;
      _os_log_impl(&dword_20B986000, v13, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ currentItemDidChange:%@", buf, 0x16u);
    }
    uint64_t v16 = [(HFCameraClipPlayer *)self queuePlayer];
    int v17 = [v16 currentItem];
    v18 = [v17 clip];

    if (v18)
    {
      __int16 v19 = +[HFCameraClipPosition positionWithClip:v18 offset:0.0];
    }
    else
    {
      __int16 v19 = 0;
    }
    v30 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = [(HFCameraClipPlayer *)self currentPosition];
      *(_DWORD *)buf = 138412546;
      v35 = v31;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v19;
      _os_log_impl(&dword_20B986000, v30, OS_LOG_TYPE_DEFAULT, "Updating position from:%@ to:%@", buf, 0x16u);
    }
    [(HFCameraClipPlayer *)self _rebuildPlayerQueueForPosition:v19];
    [(HFCameraClipPlayer *)self _updateErrorState];
    goto LABEL_25;
  }
  if (![v10 isEqual:@"status"])
  {
    if (![v10 isEqual:@"muted"]) {
      goto LABEL_26;
    }
    uint64_t v26 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v27 = NSNumber;
      v28 = [(HFCameraClipPlayer *)self queuePlayer];
      v29 = objc_msgSend(v27, "numberWithBool:", objc_msgSend(v28, "isMuted"));
      *(_DWORD *)buf = 138412546;
      v35 = self;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v29;
      _os_log_impl(&dword_20B986000, v26, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ mutedDidChange:%@", buf, 0x16u);
    }
    v18 = [(HFCameraClipPlayer *)self delegate];
    __int16 v19 = [(HFCameraClipPlayer *)self queuePlayer];
    objc_msgSend(v18, "clipPlayer:didUpdateMuted:", self, objc_msgSend(v19, "isMuted"));
LABEL_25:

    goto LABEL_26;
  }
  __int16 v20 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v21 = NSNumber;
    __int16 v22 = [(HFCameraClipPlayer *)self queuePlayer];
    Float64 v23 = objc_msgSend(v21, "numberWithInteger:", objc_msgSend(v22, "status"));
    __int16 v24 = [(HFCameraClipPlayer *)self queuePlayer];
    v25 = [v24 error];
    *(_DWORD *)buf = 138412802;
    v35 = self;
    __int16 v36 = 2112;
    uint64_t v37 = (uint64_t)v23;
    __int16 v38 = 2112;
    v39 = v25;
    _os_log_impl(&dword_20B986000, v20, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ statusDidChange:%@, error: %@", buf, 0x20u);
  }
  [(HFCameraClipPlayer *)self _updateErrorState];
LABEL_26:
}

void __69__HFCameraClipPlayer_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) delegate];
  v2 = *(void **)(a1 + 32);
  BOOL v3 = [v2 queuePlayer];
  objc_msgSend(v4, "clipPlayer:didUpdateTimeControlStatus:", v2, objc_msgSend(v3, "timeControlStatus"));
}

- (void)_setupPlayerObservation
{
  BOOL v3 = [(HFCameraClipPlayer *)self queuePlayer];
  [v3 addObserver:self forKeyPath:@"timeControlStatus" options:0 context:HFCameraClipQueuePlayerContext];

  id v4 = [(HFCameraClipPlayer *)self queuePlayer];
  [v4 addObserver:self forKeyPath:@"currentItem" options:0 context:HFCameraClipQueuePlayerContext];

  id v5 = [(HFCameraClipPlayer *)self queuePlayer];
  [v5 addObserver:self forKeyPath:@"status" options:0 context:HFCameraClipQueuePlayerContext];

  id v6 = [(HFCameraClipPlayer *)self queuePlayer];
  [v6 addObserver:self forKeyPath:@"muted" options:0 context:HFCameraClipQueuePlayerContext];
}

- (void)_setupObservationForLastPlayerItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraClipPlayer *)self lastPlayerItem];
  id v6 = v4;
  id v10 = v6;
  if (v5 == v6)
  {

    id v9 = v10;
    goto LABEL_8;
  }
  id v7 = v6;
  if (v5)
  {
    char v8 = [v5 isEqual:v6];

    if (v8) {
      goto LABEL_9;
    }
    id v7 = [MEMORY[0x263F08A00] defaultCenter];
    [v7 removeObserver:self name:*MEMORY[0x263EFA050] object:v5];
  }

  if (v10)
  {
    id v9 = [MEMORY[0x263F08A00] defaultCenter];
    [v9 addObserver:self selector:sel_playerItemDidPlayToEndTime_ name:*MEMORY[0x263EFA050] object:v10];
LABEL_8:
  }
LABEL_9:
}

- (void)_rebuildPlayerQueueForPosition:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (v4)
  {
    if (+[HFCameraUtilities disableFullQualityVideoCaching](HFCameraUtilities, "disableFullQualityVideoCaching")|| +[HFUtilities isPressDemoModeEnabled]|| [(HFCameraClipPlayer *)self isScrubbing])
    {
      goto LABEL_19;
    }
    id v5 = [(HFCameraClipPlayer *)self clips];
    if ([v5 count])
    {
      id v6 = [v4 clip];

      if (!v6)
      {
LABEL_19:
        v18 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v39 = 138412290;
          uint64_t v40 = (uint64_t)v4;
          _os_log_impl(&dword_20B986000, v18, OS_LOG_TYPE_DEFAULT, "Rebuilding player queue for position:%@.", (uint8_t *)&v39, 0xCu);
        }

        __int16 v19 = [HFCameraClipPlayerQueueUpdate alloc];
        __int16 v20 = [(HFCameraClipPlayer *)self cameraProfile];
        __int16 v21 = [v20 clipManager];
        __int16 v22 = [(HFCameraClipPlayer *)self clips];
        Float64 v23 = [(HFCameraClipPlayer *)self queuePlayer];
        __int16 v24 = [v23 items];
        uint64_t v16 = [(HFCameraClipPlayerQueueUpdate *)v19 initWithClipManager:v21 clips:v22 targetPosition:v4 queuedItems:v24 queueLimit:3];

        v25 = [(HFCameraClipPlayer *)self queuePlayer];
        uint64_t v26 = [v25 timeControlStatus];

        if ([v16 queueChangesRequireRebuild])
        {
          v27 = [(HFCameraClipPlayer *)self queuePlayer];
          [v27 pause];
        }
        BOOL v28 = [(HFCameraClipPlayer *)self isMutatingQueue];
        [(HFCameraClipPlayer *)self setMutatingQueue:1];
        [v16 performUpdatesOnQueue:self];
        [(HFCameraClipPlayer *)self setMutatingQueue:v28];
        if (v26 && [v16 queueChangesRequireRebuild])
        {
          v29 = [(HFCameraClipPlayer *)self queuePlayer];
          [v29 play];
        }
        v30 = [(HFCameraClipPlayer *)self queuePlayer];
        v31 = [v30 items];
        objc_super v32 = [v31 lastObject];
        [(HFCameraClipPlayer *)self setLastPlayerItem:v32];

        v33 = HFLogForCategory(0x17uLL);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = [(HFCameraClipPlayer *)self queuePlayer];
          uint64_t v35 = [v34 timeControlStatus];
          __int16 v36 = [(HFCameraClipPlayer *)self lastPlayerItem];
          uint64_t v37 = [(HFCameraClipPlayer *)self queuePlayer];
          __int16 v38 = [v37 items];
          int v39 = 134218498;
          uint64_t v40 = v35;
          __int16 v41 = 2112;
          v42 = v36;
          __int16 v43 = 2112;
          v44 = v38;
          _os_log_impl(&dword_20B986000, v33, OS_LOG_TYPE_DEFAULT, "Finished rebuilding player queue for status:%lu for item:%@ for items = %@", (uint8_t *)&v39, 0x20u);
        }
        goto LABEL_29;
      }
      objc_opt_class();
      id v5 = [v4 clip];
      if (objc_opt_isKindOfClass()) {
        id v7 = v5;
      }
      else {
        id v7 = 0;
      }
      id v8 = v7;

      if (v8)
      {
        id v9 = (void *)MEMORY[0x263EFFA08];
        id v10 = [(HFCameraClipPlayer *)self clips];
        int v11 = [v9 setWithArray:v10];
        int v12 = [v11 containsObject:v8];

        CMTime v13 = [(HFCameraClipPlayer *)self videoCache];
        __int16 v14 = [(HFCameraClipPlayer *)self clips];
        id v15 = v14;
        if (v12)
        {
          [v13 cacheClip:v8 inClips:v14];
        }
        else
        {
          int v17 = [v14 lastObject];
          [v13 cacheClip:v17];
        }
      }
      else
      {
        id v5 = 0;
      }
    }

    goto LABEL_19;
  }
  uint64_t v16 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v39) = 0;
    _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Skipping rebuilding queue as we don't have a playback position yet", (uint8_t *)&v39, 2u);
  }
LABEL_29:
}

- (void)playerItemDidPlayToEndTime:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  objc_opt_class();
  id v5 = [v4 object];
  if (objc_opt_isKindOfClass()) {
    id v6 = v5;
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = HFLogForCategory(0x17uLL);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    int v17 = self;
    __int16 v18 = 2112;
    id v19 = v4;
    _os_log_impl(&dword_20B986000, v8, OS_LOG_TYPE_DEFAULT, "clipPlayer:%@ did receive endTime notification:%@", buf, 0x16u);
  }

  if (v7)
  {
    id v9 = [(HFCameraClipPlayer *)self lastPlayerItem];
    if (v7 == v9)
    {
    }
    else
    {
      char v10 = [v7 isEqual:v9];

      if ((v10 & 1) == 0)
      {

        goto LABEL_15;
      }
    }
    int v11 = [(HFCameraClipPlayer *)self queuePlayer];
    int v12 = [v11 items];
    unint64_t v13 = [v12 count];

    if (v13 <= 1)
    {
      __int16 v14 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        int v17 = self;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_20B986000, v14, OS_LOG_TYPE_DEFAULT, "lastPlayerItem for clipPlayer:%@ playerItemDidPlayToEndTime:%@", buf, 0x16u);
      }

      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __49__HFCameraClipPlayer_playerItemDidPlayToEndTime___block_invoke;
      block[3] = &unk_26408DDE0;
      block[4] = self;
      dispatch_async(MEMORY[0x263EF83A0], block);
    }
  }
LABEL_15:
}

void __49__HFCameraClipPlayer_playerItemDidPlayToEndTime___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 clipPlayerDidPlayToEndTime:*(void *)(a1 + 32)];
}

- (NSArray)queuableItems
{
  id v2 = [(HFCameraClipPlayer *)self queuePlayer];
  BOOL v3 = [v2 items];

  return (NSArray *)v3;
}

- (id)createQueueableItemForClipManager:(id)a3 clip:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[HFCameraClipPlayerItem alloc] initWithClipManager:v6 clip:v5];

  return v7;
}

- (void)insertQueueableItem:(id)a3 afterItem:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (v20)
  {
    id v7 = [(HFCameraClipPlayer *)self queuePlayer];
    uint64_t v8 = objc_opt_class();
    id v9 = v20;
    if (objc_opt_isKindOfClass()) {
      char v10 = v9;
    }
    else {
      char v10 = 0;
    }
    id v11 = v10;
    if (!v11)
    {
      __int16 v18 = [MEMORY[0x263F08690] currentHandler];
      id v19 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v18 handleFailureInFunction:v19, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v8, objc_opt_class() file lineNumber description];
    }
    uint64_t v12 = objc_opt_class();
    id v13 = v6;
    if (v13)
    {
      if (objc_opt_isKindOfClass()) {
        __int16 v14 = v13;
      }
      else {
        __int16 v14 = 0;
      }
      id v15 = v13;
      if (v14) {
        goto LABEL_14;
      }
      uint64_t v16 = [MEMORY[0x263F08690] currentHandler];
      int v17 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
      [v16 handleFailureInFunction:v17, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v12, objc_opt_class() file lineNumber description];
    }
    id v15 = 0;
LABEL_14:

    [v7 insertItem:v11 afterItem:v15];
  }
}

- (void)removeQueueableItem:(id)a3
{
  id v4 = a3;
  id v5 = [(HFCameraClipPlayer *)self queuePlayer];
  uint64_t v6 = objc_opt_class();
  id v11 = v4;
  if (v11)
  {
    if (objc_opt_isKindOfClass()) {
      id v7 = v11;
    }
    else {
      id v7 = 0;
    }
    uint64_t v8 = v11;
    if (v7) {
      goto LABEL_8;
    }
    id v9 = [MEMORY[0x263F08690] currentHandler];
    char v10 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v9 handleFailureInFunction:v10, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v6, objc_opt_class() file lineNumber description];
  }
  uint64_t v8 = 0;
LABEL_8:

  [v5 removeItem:v8];
}

- (void)seekToOffset:(double)a3 inItem:(id)a4
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v6 = a4;
  uint64_t v7 = objc_opt_class();
  id v8 = v6;
  if (!v8) {
    goto LABEL_7;
  }
  if (objc_opt_isKindOfClass()) {
    id v9 = v8;
  }
  else {
    id v9 = 0;
  }
  char v10 = v8;
  if (!v9)
  {
    id v11 = [MEMORY[0x263F08690] currentHandler];
    uint64_t v12 = objc_msgSend(NSString, "stringWithUTF8String:", "id  _Nullable NAAssertCast(Class  _Nonnull __unsafe_unretained, id  _Nonnull __strong)");
    [v11 handleFailureInFunction:v12, @"NSObject+NAAdditions.h", 54, @"Expected class of %@ but was %@", v7, objc_opt_class() file lineNumber description];

LABEL_7:
    char v10 = 0;
  }

  id v13 = [v10 asset];
  uint64_t v14 = [v13 statusOfValueForKey:@"duration" error:0];

  if ([(HFCameraClipPlayer *)self isScrubbing]
    && ([(HFCameraClipPlayer *)self scrubber],
        id v15 = objc_claimAutoreleasedReturnValue(),
        v15,
        v15)
    && v14 == 2)
  {
    if (![(HFCameraClipPlayer *)self shouldBypassScrubbing])
    {
      uint64_t v16 = HFLogForCategory(0x17uLL);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        int v17 = [(HFCameraClipPlayer *)self scrubber];
        *(_DWORD *)buf = 134218498;
        double v22 = a3;
        __int16 v23 = 2112;
        double v24 = *(double *)&v8;
        __int16 v25 = 2112;
        uint64_t v26 = v17;
        _os_log_impl(&dword_20B986000, v16, OS_LOG_TYPE_DEFAULT, "Seeking to offset: %f in item: %@ with scrubber:%@", buf, 0x20u);
      }
      __int16 v18 = [(HFCameraClipPlayer *)self scrubber];
      [v18 scrubToTime:a3];
    }
  }
  else
  {
    id v19 = HFLogForCategory(0x17uLL);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      double v22 = *(double *)&self;
      __int16 v23 = 2048;
      double v24 = a3;
      _os_log_impl(&dword_20B986000, v19, OS_LOG_TYPE_DEFAULT, "ClipPlayer:%@ Seeking to offset:%.2f", buf, 0x16u);
    }

    CMTimeMakeWithSeconds(&v20, a3, 1000);
    [v10 seekToTime:&v20 completionHandler:0];
  }
}

- (HFCameraClipPlayerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (HFCameraClipPlayerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (HFCameraClipScrubbing)scrubber
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_scrubber);
  return (HFCameraClipScrubbing *)WeakRetained;
}

- (void)setScrubber:(id)a3
{
}

- (BOOL)isScrubbing
{
  return self->_scrubbing;
}

- (HMCameraProfile)cameraProfile
{
  return self->_cameraProfile;
}

- (NSArray)clips
{
  return self->_clips;
}

- (void)setClips:(id)a3
{
}

- (BOOL)shouldBypassScrubbing
{
  return self->_shouldBypassScrubbing;
}

- (void)setShouldBypassScrubbing:(BOOL)a3
{
  self->_shouldBypassScrubbing = a3;
}

- (BOOL)isMutatingQueue
{
  return self->_mutatingQueue;
}

- (void)setMutatingQueue:(BOOL)a3
{
  self->_mutatingQueue = a3;
}

- (NSError)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (HFCameraClipPlayerItem)lastPlayerItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lastPlayerItem);
  return (HFCameraClipPlayerItem *)WeakRetained;
}

- (HFCameraVideoCache)videoCache
{
  return self->_videoCache;
}

- (void)setVideoCache:(id)a3
{
}

- (HFCameraClipQueuePlayer)queuePlayer
{
  return self->_queuePlayer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queuePlayer, 0);
  objc_storeStrong((id *)&self->_videoCache, 0);
  objc_destroyWeak((id *)&self->_lastPlayerItem);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clips, 0);
  objc_storeStrong((id *)&self->_cameraProfile, 0);
  objc_destroyWeak((id *)&self->_scrubber);
  objc_destroyWeak((id *)&self->_delegate);
}

@end