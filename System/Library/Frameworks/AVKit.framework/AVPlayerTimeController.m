@interface AVPlayerTimeController
+ (id)keyPathsForValuesAffectingContentDuration;
+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes;
+ (id)keyPathsForValuesAffectingForwardPlaybackEndTime;
+ (id)keyPathsForValuesAffectingMaxTime;
+ (id)keyPathsForValuesAffectingReadyToPlay;
+ (id)keyPathsForValuesAffectingReversePlaybackEndTime;
+ (id)keyPathsForValuesAffectingSeekableTimeRanges;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)reversePlaybackEndTime;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekToTimeInternal;
- (AVObservationController)observationController;
- (AVPlayer)player;
- (AVPlayerTimeController)initWithPlayer:(id)a3;
- (AVValueTiming)maxTiming;
- (AVValueTiming)minTiming;
- (AVValueTiming)timing;
- (BOOL)canSeek;
- (BOOL)hasSeekableLiveStreamingContent;
- (BOOL)isCompletelySeekable;
- (BOOL)isReadyToPlay;
- (BOOL)isSeeking;
- (BOOL)isSeekingInternal;
- (NSArray)seekableTimeRanges;
- (double)contentDuration;
- (double)contentDurationWithinEndTimes;
- (double)maxTime;
- (double)minTime;
- (double)seekToTime;
- (id)initForIFramesWithPlayerItem:(id)a3;
- (void)_actuallySeekToTime;
- (void)_commonInit;
- (void)_updateMinAndMaxTiming;
- (void)_updateTiming;
- (void)dealloc;
- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5;
- (void)setMaxTiming:(id)a3;
- (void)setMinTiming:(id)a3;
- (void)setPlayer:(id)a3;
- (void)setSeekToTimeInternal:(id *)a3;
- (void)setSeekingInternal:(BOOL)a3;
- (void)setTiming:(id)a3;
- (void)startTimingObservation;
- (void)stopTimingObservation;
@end

@implementation AVPlayerTimeController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_maxTiming, 0);
  objc_storeStrong((id *)&self->_minTiming, 0);
  objc_storeStrong((id *)&self->_timing, 0);
  objc_storeStrong((id *)&self->_player, 0);
  objc_storeStrong((id *)&self->_seekingInternal, 0);

  objc_storeStrong((id *)&self->_seekQueue, 0);
}

- (void)setSeekToTimeInternal:(id *)a3
{
  long long v3 = *(_OWORD *)&a3->var0;
  *(void *)&self->_seekToTimeInternal.timescale = a3->var3;
  *(_OWORD *)&self->_observationController = v3;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)seekToTimeInternal
{
  *retstr = *($3CC8671D27C23BF42ADDB32F2B5E48AE *)((char *)self + 112);
  return self;
}

- (void)setSeekingInternal:(BOOL)a3
{
  BYTE4(self->_toleranceAfter.epoch) = a3;
}

- (BOOL)isSeekingInternal
{
  return BYTE4(self->_toleranceAfter.epoch);
}

- (AVObservationController)observationController
{
  return (AVObservationController *)self->_maxTiming;
}

- (void)setMaxTiming:(id)a3
{
}

- (AVValueTiming)maxTiming
{
  return self->_minTiming;
}

- (void)setMinTiming:(id)a3
{
}

- (AVValueTiming)minTiming
{
  return self->_timing;
}

- (void)setTiming:(id)a3
{
}

- (AVValueTiming)timing
{
  return (AVValueTiming *)self->_player;
}

- (void)setPlayer:(id)a3
{
}

- (AVPlayer)player
{
  return *(AVPlayer **)&self->_seekingInternal;
}

- (void)_updateMinAndMaxTiming
{
  [(AVPlayerTimeController *)self minTime];
  +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [(AVPlayerTimeController *)self maxTime];
  long long v3 = +[AVValueTiming valueTimingWithAnchorValue:anchorTimeStamp:rate:](AVValueTiming, "valueTimingWithAnchorValue:anchorTimeStamp:rate:");
  [(AVPlayerTimeController *)self setMinTiming:v4];
  [(AVPlayerTimeController *)self setMaxTiming:v3];
}

- (void)_updateTiming
{
  if ([*(id *)&self->_seekingInternal status] == 1
    && ([*(id *)&self->_seekingInternal currentItem],
        long long v3 = objc_claimAutoreleasedReturnValue(),
        id v4 = (OpaqueCMTimebase *)[v3 timebase],
        v3,
        v4))
  {
    memset(&v18, 0, sizeof(v18));
    CMTimebaseGetTime(&v18, v4);
    double EffectiveRate = CMTimebaseGetEffectiveRate(v4);
    if (EffectiveRate == 0.0)
    {
      CMTime time = v18;
      double Seconds = CMTimeGetSeconds(&time);
      double v7 = NAN;
      double v8 = 0.0;
    }
    else
    {
      double v10 = EffectiveRate;
      +[AVValueTiming currentTimeStamp];
      double v12 = v11;
      v13 = [*(id *)&self->_seekingInternal currentItem];
      v14 = v13;
      if (v13) {
        [v13 currentTime];
      }
      else {
        memset(&v16, 0, sizeof(v16));
      }
      double v15 = CMTimeGetSeconds(&v16);

      CMTime time = v18;
      double v7 = v12 + fabs((v15 - CMTimeGetSeconds(&time)) / v10);
      double Seconds = v15;
      double v8 = v10;
    }
  }
  else
  {
    double Seconds = NAN;
    double v7 = NAN;
    double v8 = NAN;
  }
  v9 = +[AVValueTiming valueTimingWithAnchorValue:Seconds anchorTimeStamp:v7 rate:v8];
  [(AVPlayerTimeController *)self setTiming:v9];
}

- (void)seekToTime:(double)a3 toleranceBefore:(double)a4 toleranceAfter:(double)a5
{
  if ([*(id *)&self->_seekingInternal _isInterstitialPlayer])
  {
    v9 = _AVLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_1B05B7000, v9, OS_LOG_TYPE_ERROR, "seekToTime:toleranceBefore:toleranceAfter is not supported on interstitial players", (uint8_t *)location, 2u);
    }
  }
  objc_initWeak(location, self);
  seekQueue = self->_seekQueue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __68__AVPlayerTimeController_seekToTime_toleranceBefore_toleranceAfter___block_invoke;
  v11[3] = &unk_1E5FC2E30;
  objc_copyWeak(v12, location);
  v12[1] = *(id *)&a3;
  v12[2] = *(id *)&a4;
  v12[3] = *(id *)&a5;
  dispatch_async(seekQueue, v11);
  objc_destroyWeak(v12);
  objc_destroyWeak(location);
}

void __68__AVPlayerTimeController_seekToTime_toleranceBefore_toleranceAfter___block_invoke(uint64_t a1)
{
  WeakRetained = (char *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    CMTimeMakeWithSeconds(&v5, *(Float64 *)(a1 + 40), 600);
    [WeakRetained setSeekToTimeInternal:&v5];
    CMTimeMakeWithSeconds(&v4, *(Float64 *)(a1 + 48), 600);
    CMTimeEpoch epoch = v4.epoch;
    *(_OWORD *)(WeakRetained + 20) = *(_OWORD *)&v4.value;
    *(void *)(WeakRetained + 36) = epoch;
    CMTimeMakeWithSeconds(&v4, *(Float64 *)(a1 + 56), 600);
    *(CMTime *)(WeakRetained + 44) = v4;
    if ([WeakRetained isSeekingInternal]) {
      WeakRetained[16] = 1;
    }
    else {
      -[AVPlayerTimeController _actuallySeekToTime]((uint64_t)WeakRetained);
    }
  }
}

- (void)_actuallySeekToTime
{
  if (a1)
  {
    [(id)a1 setSeekingInternal:1];
    objc_initWeak(&location, (id)a1);
    v2 = [(id)a1 player];
    [(id)a1 seekToTimeInternal];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __45__AVPlayerTimeController__actuallySeekToTime__block_invoke;
    v7[3] = &unk_1E5FC4220;
    objc_copyWeak(&v8, &location);
    long long v5 = *(_OWORD *)(a1 + 20);
    uint64_t v6 = *(void *)(a1 + 36);
    long long v3 = *(_OWORD *)(a1 + 44);
    uint64_t v4 = *(void *)(a1 + 60);
    [v2 seekToTime:v9 toleranceBefore:&v5 toleranceAfter:&v3 completionHandler:v7];

    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
}

void __45__AVPlayerTimeController__actuallySeekToTime__block_invoke(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v4 = WeakRetained[1];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __45__AVPlayerTimeController__actuallySeekToTime__block_invoke_2;
    block[3] = &unk_1E5FC44F8;
    objc_copyWeak(&v6, v1);
    dispatch_async(v4, block);
    objc_destroyWeak(&v6);
  }
}

void __45__AVPlayerTimeController__actuallySeekToTime__block_invoke_2(uint64_t a1)
{
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained[16])
  {
    WeakRetained[16] = 0;
    -[AVPlayerTimeController _actuallySeekToTime](WeakRetained);
  }
  else
  {
    [WeakRetained setSeekingInternal:0];
    long long v5 = *MEMORY[0x1E4F1F9F8];
    long long v4 = v5;
    uint64_t v6 = *(void *)(MEMORY[0x1E4F1F9F8] + 16);
    uint64_t v3 = v6;
    [v2 setSeekToTimeInternal:&v5];
    *(_OWORD *)(v2 + 20) = v4;
    *(void *)(v2 + 36) = v3;
    *(_OWORD *)(v2 + 44) = v4;
    *(void *)(v2 + 60) = v3;
  }
}

- (BOOL)isReadyToPlay
{
  return [*(id *)&self->_seekingInternal status] == 2;
}

- (double)seekToTime
{
  return NAN;
}

- (BOOL)isSeeking
{
  return 0;
}

- (BOOL)canSeek
{
  return 0;
}

- (BOOL)hasSeekableLiveStreamingContent
{
  return 0;
}

- (BOOL)isCompletelySeekable
{
  return 0;
}

- (NSArray)seekableTimeRanges
{
  v2 = [*(id *)&self->_seekingInternal currentItem];
  uint64_t v3 = [v2 seekableTimeRanges];

  return (NSArray *)v3;
}

- (double)contentDurationWithinEndTimes
{
  [(AVPlayerTimeController *)self maxTime];
  double v4 = v3;
  [(AVPlayerTimeController *)self minTime];
  return v4 - v5;
}

- (double)contentDuration
{
  v2 = [*(id *)&self->_seekingInternal currentItem];
  double v3 = v2;
  if (v2) {
    [v2 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)forwardPlaybackEndTime
{
  id v7 = [(AVPlayerTimeController *)self player];
  double v4 = [v7 currentItem];
  double v5 = v4;
  if (v4)
  {
    [v4 forwardPlaybackEndTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (double)maxTime
{
  v2 = [*(id *)&self->_seekingInternal currentItem];
  double v3 = v2;
  if (v2) {
    [v2 duration];
  }
  else {
    memset(&time, 0, sizeof(time));
  }
  double Seconds = CMTimeGetSeconds(&time);

  return Seconds;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)reversePlaybackEndTime
{
  id v7 = [(AVPlayerTimeController *)self player];
  double v4 = [v7 currentItem];
  double v5 = v4;
  if (v4)
  {
    [v4 reversePlaybackEndTime];
  }
  else
  {
    retstr->var0 = 0;
    *(void *)&retstr->var1 = 0;
    retstr->var3 = 0;
  }

  return result;
}

- (double)minTime
{
  return 0.0;
}

- (void)stopTimingObservation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  double v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 136315394;
    double v5 = "-[AVPlayerTimeController stopTimingObservation]";
    __int16 v6 = 1024;
    int v7 = 119;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", (uint8_t *)&v4, 0x12u);
  }

  [(AVValueTiming *)self->_maxTiming stopAllObservation];
}

- (void)startTimingObservation
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  double v3 = _AVLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    double v11 = "-[AVPlayerTimeController startTimingObservation]";
    __int16 v12 = 1024;
    int v13 = 92;
    _os_log_impl(&dword_1B05B7000, v3, OS_LOG_TYPE_DEFAULT, "%s %d", buf, 0x12u);
  }

  id v4 = (id)[(AVValueTiming *)self->_maxTiming startObserving:self keyPath:@"player.currentItem.seekableTimeRanges" observationHandler:&__block_literal_global_10561];
  maxTiming = self->_maxTiming;
  v9[0] = @"player.currentItem";
  v9[1] = @"player.currentItem.duration";
  v9[2] = @"readyToPlay";
  __int16 v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:3];
  id v7 = (id)[(AVValueTiming *)maxTiming startObserving:self keyPaths:v6 observationHandler:&__block_literal_global_18];

  uint64_t v8 = *MEMORY[0x1E4F1FA58];
  [(AVValueTiming *)self->_maxTiming startObservingNotificationForName:*MEMORY[0x1E4F1FA58] object:0 notificationCenter:0 observationHandler:&__block_literal_global_21_10566];
  [(AVValueTiming *)self->_maxTiming startObservingNotificationForName:v8 object:0 notificationCenter:0 observationHandler:&__block_literal_global_23];
}

void __48__AVPlayerTimeController_startTimingObservation__block_invoke_4(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  double v5 = [a4 object];
  __int16 v6 = [v9 player];
  id v7 = [v6 currentItem];
  uint64_t v8 = [v7 timebase];

  if (v5 == (void *)v8) {
    [v9 _updateTiming];
  }
}

void __48__AVPlayerTimeController_startTimingObservation__block_invoke_3(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v9 = a2;
  double v5 = [a4 object];
  __int16 v6 = [v9 player];
  id v7 = [v6 currentItem];
  uint64_t v8 = [v7 timebase];

  if (v5 == (void *)v8) {
    [v9 _updateTiming];
  }
}

uint64_t __48__AVPlayerTimeController_startTimingObservation__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 _updateTiming];
}

uint64_t __48__AVPlayerTimeController_startTimingObservation__block_invoke(uint64_t a1, void *a2)
{
  return [a2 _updateMinAndMaxTiming];
}

- (void)dealloc
{
  [(AVValueTiming *)self->_maxTiming stopAllObservation];
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerTimeController;
  [(AVPlayerTimeController *)&v3 dealloc];
}

- (void)_commonInit
{
  double v5 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
  objc_super v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.avkit.AVPlayerTimeController.SeekQueue", v5);
  seekQueue = self->_seekQueue;
  self->_seekQueue = v3;
}

- (id)initForIFramesWithPlayerItem:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)AVPlayerTimeController;
  double v5 = [(AVPlayerTimeController *)&v10 init];
  p_isa = (id *)&v5->super.isa;
  if (v5)
  {
    [(AVPlayerTimeController *)v5 _commonInit];
    id v7 = objc_alloc_init(MEMORY[0x1E4F16608]);
    id v8 = p_isa[9];
    p_isa[9] = v7;

    [p_isa[9] setPlayerRole:*MEMORY[0x1E4F16088]];
    [p_isa[9] replaceCurrentItemWithPlayerItem:v4];
  }

  return p_isa;
}

- (AVPlayerTimeController)initWithPlayer:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)AVPlayerTimeController;
  __int16 v6 = [(AVPlayerTimeController *)&v11 init];
  id v7 = v6;
  if (v6)
  {
    [(AVPlayerTimeController *)v6 _commonInit];
    objc_storeStrong((id *)&v7->_seekingInternal, a3);
    id v8 = [[AVObservationController alloc] initWithOwner:v7];
    maxTiming = v7->_maxTiming;
    v7->_maxTiming = (AVValueTiming *)v8;
  }
  return v7;
}

+ (id)keyPathsForValuesAffectingReadyToPlay
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.status"];
}

+ (id)keyPathsForValuesAffectingSeekableTimeRanges
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.seekableTimeRanges"];
}

+ (id)keyPathsForValuesAffectingContentDurationWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"minTime", @"maxTime", 0);
}

+ (id)keyPathsForValuesAffectingContentDuration
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.duration"];
}

+ (id)keyPathsForValuesAffectingForwardPlaybackEndTime
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.forwardPlaybackEndTime"];
}

+ (id)keyPathsForValuesAffectingMaxTime
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.duration"];
}

+ (id)keyPathsForValuesAffectingReversePlaybackEndTime
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"player.currentItem.reversePlaybackEndTime"];
}

@end