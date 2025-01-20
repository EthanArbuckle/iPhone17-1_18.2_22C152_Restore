@interface AVPlayerControllerTimeResolver
+ (BOOL)automaticallyNotifiesObserversOfCurrentTime;
+ (id)keyPathsForValuesAffectingCurrentTimeAtEndOfSeekableTimeRanges;
+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes;
+ (id)keyPathsForValuesAffectingRemainingTargetTimeWithinEndTimes;
+ (id)keyPathsForValuesAffectingRemainingTime;
+ (id)keyPathsForValuesAffectingRemainingTimeWithinEndTimes;
+ (id)keyPathsForValuesAffectingSeekableTimeRangeDuration;
+ (id)keyPathsForValuesAffectingTargetTime;
+ (id)keyPathsForValuesAffectingTargetTimeWithinEndTimes;
- (AVPlayerControllerTimeResolver)init;
- (AVTimeControlling)playerController;
- (BOOL)isCurrentTimeAtEndOfSeekableTimeRanges;
- (double)currentTime;
- (double)currentTimeWithinEndTimes;
- (double)interval;
- (double)maxTime;
- (double)minTime;
- (double)remainingTargetTimeWithinEndTimes;
- (double)remainingTime;
- (double)remainingTimeWithinEndTimes;
- (double)resolution;
- (double)seekableTimeRangeDuration;
- (double)targetTime;
- (double)targetTimeWithinEndTimes;
- (void)dealloc;
- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6;
- (void)setCurrentTime:(double)a3;
- (void)setCurrentTimeWithinEndTimes:(double)a3;
- (void)setInterval:(double)a3;
- (void)setMaxTime:(double)a3;
- (void)setMinTime:(double)a3;
- (void)setPlayerController:(id)a3;
- (void)setResolution:(double)a3;
- (void)setTargetTimeWithinEndTimes:(double)a3;
@end

@implementation AVPlayerControllerTimeResolver

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);

  objc_storeStrong((id *)&self->_playerController, 0);
}

- (void)setMaxTime:(double)a3
{
  self->_maxTime = a3;
}

- (double)maxTime
{
  return self->_maxTime;
}

- (void)setMinTime:(double)a3
{
  self->_minTime = a3;
}

- (double)minTime
{
  return self->_minTime;
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  kdebug_trace();
  if ((void *)AVPlayerControllerTimeResolverUpdateContext == a6)
  {
    AVPlayerControllerTimeResolverUpdate(self);
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)AVPlayerControllerTimeResolver;
    [(AVPlayerControllerTimeResolver *)&v13 observeValueForKeyPath:v10 ofObject:v11 change:v12 context:a6];
  }
  kdebug_trace();
}

- (void)setCurrentTime:(double)a3
{
  if (self->_currentTime != a3)
  {
    self->_currentTime = a3;
    double EffectiveInterval = AVPlayerControllerTimeResolverGetEffectiveInterval(self);
    playerController = self->_playerController;
    double v7 = a3 - EffectiveInterval * floor(a3 / EffectiveInterval);
    double v8 = EffectiveInterval * ceil(a3 / EffectiveInterval) - a3;
    [(AVTimeControlling *)playerController seekToTime:a3 toleranceBefore:v7 toleranceAfter:v8];
  }
}

- (double)currentTime
{
  return self->_currentTime;
}

- (void)setResolution:(double)a3
{
  if (self->_resolution != a3)
  {
    self->_resolution = a3;
    AVPlayerControllerTimeResolverUpdate(self);
  }
}

- (double)resolution
{
  return self->_resolution;
}

- (void)setInterval:(double)a3
{
  if (self->_interval != a3)
  {
    self->_interval = a3;
    AVPlayerControllerTimeResolverUpdate(self);
  }
}

- (double)interval
{
  return self->_interval;
}

- (void)setPlayerController:(id)a3
{
  v5 = (AVTimeControlling *)a3;
  playerController = self->_playerController;
  p_playerController = &self->_playerController;
  if (playerController != v5)
  {
    double v8 = v5;
    objc_storeStrong((id *)p_playerController, a3);
    v5 = v8;
  }
}

- (AVTimeControlling)playerController
{
  return self->_playerController;
}

- (void)dealloc
{
  [(AVPlayerControllerTimeResolver *)self removeObserver:self forKeyPath:@"playerController.timing" context:AVPlayerControllerTimeResolverUpdateContext];
  [(AVPlayerControllerTimeResolver *)self removeObserver:self forKeyPath:@"playerController.maxTiming" context:AVPlayerControllerTimeResolverUpdateContext];
  [(AVPlayerControllerTimeResolver *)self removeObserver:self forKeyPath:@"playerController.maxTime" context:AVPlayerControllerTimeResolverUpdateContext];
  [(AVPlayerControllerTimeResolver *)self removeObserver:self forKeyPath:@"playerController.minTiming" context:AVPlayerControllerTimeResolverUpdateContext];
  [(AVPlayerControllerTimeResolver *)self removeObserver:self forKeyPath:@"playerController.minTime" context:AVPlayerControllerTimeResolverUpdateContext];
  v3.receiver = self;
  v3.super_class = (Class)AVPlayerControllerTimeResolver;
  [(AVPlayerControllerTimeResolver *)&v3 dealloc];
}

- (AVPlayerControllerTimeResolver)init
{
  v7.receiver = self;
  v7.super_class = (Class)AVPlayerControllerTimeResolver;
  v2 = [(AVPlayerControllerTimeResolver *)&v7 init];
  objc_super v3 = v2;
  if (v2)
  {
    v2->_interval = 1.0;
    uint64_t v4 = AVPlayerControllerTimeResolverUpdateContext;
    v5 = v2;
    [(AVPlayerControllerTimeResolver *)v5 addObserver:v5 forKeyPath:@"playerController.minTime" options:0 context:v4];
    [(AVPlayerControllerTimeResolver *)v5 addObserver:v5 forKeyPath:@"playerController.minTiming" options:0 context:AVPlayerControllerTimeResolverUpdateContext];
    [(AVPlayerControllerTimeResolver *)v5 addObserver:v5 forKeyPath:@"playerController.maxTime" options:0 context:AVPlayerControllerTimeResolverUpdateContext];
    [(AVPlayerControllerTimeResolver *)v5 addObserver:v5 forKeyPath:@"playerController.maxTiming" options:0 context:AVPlayerControllerTimeResolverUpdateContext];
    [(AVPlayerControllerTimeResolver *)v5 addObserver:v5 forKeyPath:@"playerController.timing" options:0 context:AVPlayerControllerTimeResolverUpdateContext];
  }
  return v3;
}

+ (BOOL)automaticallyNotifiesObserversOfCurrentTime
{
  return 0;
}

- (BOOL)isCurrentTimeAtEndOfSeekableTimeRanges
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  objc_super v3 = [(AVPlayerControllerTimeResolver *)self playerController];
  uint64_t v4 = [v3 seekableTimeRanges];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v18;
    double v8 = NAN;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        memset(&v16, 0, sizeof(v16));
        if (v10) {
          [v10 CMTimeRangeValue];
        }
        CMTimeRange v14 = v16;
        CMTimeRangeGetEnd(&time, &v14);
        double Seconds = CMTimeGetSeconds(&time);
        if (Seconds > v8) {
          double v8 = Seconds;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);

    [(AVPlayerControllerTimeResolver *)self currentTime];
    if (v12 > v8 + -2.0) {
      return 1;
    }
  }
  else
  {
  }
  return 0;
}

- (double)seekableTimeRangeDuration
{
  [(AVPlayerControllerTimeResolver *)self maxTime];
  double v4 = v3;
  [(AVPlayerControllerTimeResolver *)self minTime];
  return v4 - v5;
}

- (double)remainingTimeWithinEndTimes
{
  double v3 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v3 maxTime];
  double v5 = v4;
  [(AVPlayerControllerTimeResolver *)self currentTime];
  double v7 = v5 - v6;

  return v7;
}

- (double)remainingTime
{
  double v3 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v3 contentDuration];
  double v5 = v4;
  [(AVPlayerControllerTimeResolver *)self currentTime];
  double v7 = v5 - v6;

  return v7;
}

- (void)setCurrentTimeWithinEndTimes:(double)a3
{
  id v6 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v6 minTime];
  [(AVPlayerControllerTimeResolver *)self setCurrentTime:v5 + a3];
}

- (double)currentTimeWithinEndTimes
{
  [(AVPlayerControllerTimeResolver *)self currentTime];
  double v4 = v3;
  double v5 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v5 minTime];
  double v7 = v4 - v6;

  return v7;
}

- (double)remainingTargetTimeWithinEndTimes
{
  double v3 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v3 maxTime];
  double v5 = v4;
  [(AVPlayerControllerTimeResolver *)self targetTime];
  double v7 = v5 - v6;

  return v7;
}

- (void)setTargetTimeWithinEndTimes:(double)a3
{
  id v6 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v6 minTime];
  [(AVPlayerControllerTimeResolver *)self setTargetTime:v5 + a3];
}

- (double)targetTimeWithinEndTimes
{
  [(AVPlayerControllerTimeResolver *)self targetTime];
  double v4 = v3;
  double v5 = [(AVPlayerControllerTimeResolver *)self playerController];
  [v5 minTime];
  double v7 = v4 - v6;

  return v7;
}

- (double)targetTime
{
  [(AVPlayerControllerTimeResolver *)self currentTime];
  double v4 = v3;
  uint64_t v5 = [(AVPlayerControllerTimeResolver *)self playerController];
  [(id)v5 seekToTime];
  double v7 = v6;

  double v8 = [(AVPlayerControllerTimeResolver *)self playerController];
  LOBYTE(v5) = [v8 isSeeking];

  if (v5) {
    return v7;
  }
  else {
    return v4;
  }
}

+ (id)keyPathsForValuesAffectingCurrentTimeAtEndOfSeekableTimeRanges
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentTime", @"playerController.seekableTimeRanges", 0);
}

+ (id)keyPathsForValuesAffectingSeekableTimeRangeDuration
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"minTime", @"maxTime", 0);
}

+ (id)keyPathsForValuesAffectingRemainingTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playerController.maxTime", @"currentTime", 0);
}

+ (id)keyPathsForValuesAffectingRemainingTime
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playerController.contentDuration", @"currentTime", 0);
}

+ (id)keyPathsForValuesAffectingCurrentTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentTime", @"playerController.minTime", 0);
}

+ (id)keyPathsForValuesAffectingRemainingTargetTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"playerController.maxTime", @"targetTime", 0);
}

+ (id)keyPathsForValuesAffectingTargetTimeWithinEndTimes
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"targetTime", @"playerController.minTime", 0);
}

+ (id)keyPathsForValuesAffectingTargetTime
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"currentTime", @"playerController.seeking", @"playerController.seekToTime", 0);
}

@end