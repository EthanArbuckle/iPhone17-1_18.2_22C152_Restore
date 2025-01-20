@interface AVPictureInPicturePlaybackState
- (AVPictureInPicturePlaybackState)initWithElapsedTime:(double)a3 timelineDuration:(double)a4 timelineRate:(double)a5 paused:(BOOL)a6;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPaused;
- (double)currentElapsedTime;
- (double)initializationTimestamp;
- (double)initializedElapsedTime;
- (double)timelineDuration;
- (double)timelineRate;
@end

@implementation AVPictureInPicturePlaybackState

- (double)initializedElapsedTime
{
  return self->_initializedElapsedTime;
}

- (double)initializationTimestamp
{
  return self->_initializationTimestamp;
}

- (BOOL)isPaused
{
  return self->_paused;
}

- (double)timelineDuration
{
  return self->_timelineDuration;
}

- (double)timelineRate
{
  return self->_timelineRate;
}

- (double)currentElapsedTime
{
  [(AVPictureInPicturePlaybackState *)self initializedElapsedTime];
  double v4 = v3;
  [(AVPictureInPicturePlaybackState *)self timelineRate];
  if (v5 != 0.0)
  {
    [(AVPictureInPicturePlaybackState *)self timelineDuration];
    BOOL v7 = v6 < 0 || ((v6 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 > 0x3FE;
    if (!v7 || (unint64_t)(v6 - 1) <= 0xFFFFFFFFFFFFELL)
    {
      double Current = CFAbsoluteTimeGetCurrent();
      [(AVPictureInPicturePlaybackState *)self initializationTimestamp];
      double v11 = Current - v10;
      [(AVPictureInPicturePlaybackState *)self timelineRate];
      double v4 = v4 + v12 * v11;
    }
  }
  double v13 = fmax(v4, 0.0);
  [(AVPictureInPicturePlaybackState *)self timelineDuration];
  if (v13 < result) {
    return v13;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  double v4 = (AVPictureInPicturePlaybackState *)a3;
  if (self == v4)
  {
    BOOL v13 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (BOOL v5 = [(AVPictureInPicturePlaybackState *)self isPaused],
          v5 == [(AVPictureInPicturePlaybackState *)v4 isPaused])
      && ([(AVPictureInPicturePlaybackState *)self timelineDuration],
          double v7 = v6,
          [(AVPictureInPicturePlaybackState *)v4 timelineDuration],
          v7 == v8))
    {
      [(AVPictureInPicturePlaybackState *)self currentElapsedTime];
      double v10 = v9;
      [(AVPictureInPicturePlaybackState *)v4 currentElapsedTime];
      double v12 = v10 - v11;
      if (v12 < 0.0) {
        double v12 = -v12;
      }
      BOOL v13 = v12 < 0.025;
    }
    else
    {
      BOOL v13 = 0;
    }
  }

  return v13;
}

- (AVPictureInPicturePlaybackState)initWithElapsedTime:(double)a3 timelineDuration:(double)a4 timelineRate:(double)a5 paused:(BOOL)a6
{
  v21.receiver = self;
  v21.super_class = (Class)AVPictureInPicturePlaybackState;
  double v10 = [(AVPictureInPicturePlaybackState *)&v21 init];
  double v11 = v10;
  if (v10)
  {
    BOOL v13 = (*(uint64_t *)&a4 <= -1 || ((*(void *)&a4 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
       && (unint64_t)(*(void *)&a4 - 1) >= 0xFFFFFFFFFFFFFLL;
    double v14 = 0.0;
    if (v13) {
      double v15 = 0.0;
    }
    else {
      double v15 = a4;
    }
    double v16 = fmax(a3, 0.0);
    if (v16 >= v15) {
      double v16 = v15;
    }
    if ((*(uint64_t *)&a3 <= -1 || ((*(void *)&a3 & 0x7FFFFFFFFFFFFFFFuLL) - 0x10000000000000) >> 53 >= 0x3FF)
      && (unint64_t)(*(void *)&a3 - 1) >= 0xFFFFFFFFFFFFFLL)
    {
      double v16 = 0.0;
    }
    double v19 = fabs(a5);
    v10->_initializedElapsedTime = v16;
    if (v19 < INFINITY) {
      double v14 = a5;
    }
    if (v19 > INFINITY) {
      double v14 = a5;
    }
    v10->_timelineRate = v14;
    v10->_timelineDuration = v15;
    v10->_paused = a6;
    v10->_initializationTimestamp = CFAbsoluteTimeGetCurrent();
  }
  return v11;
}

@end