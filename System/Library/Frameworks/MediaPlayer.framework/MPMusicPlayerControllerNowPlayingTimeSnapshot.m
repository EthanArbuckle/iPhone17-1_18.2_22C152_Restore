@interface MPMusicPlayerControllerNowPlayingTimeSnapshot
+ (BOOL)supportsSecureCoding;
+ (MPMusicPlayerControllerNowPlayingTimeSnapshot)snapshotWithElapsedTime:(double)a3 duration:(double)a4 rate:(float)a5 atTimestamp:(double)a6 state:(int64_t)a7;
+ (id)liveSnapshotWithRate:(float)a3 state:(int64_t)a4;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLive;
- (MPMusicPlayerControllerNowPlayingTimeSnapshot)initWithCoder:(id)a3;
- (double)currentTime;
- (float)rate;
- (id)_init;
- (int64_t)state;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MPMusicPlayerControllerNowPlayingTimeSnapshot

- (int64_t)state
{
  return self->_state;
}

- (float)rate
{
  return self->_rate;
}

- (BOOL)isLive
{
  return self->_live;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  *(float *)&double v4 = self->_rate;
  [v5 encodeFloat:@"rate" forKey:v4];
  [v5 encodeBool:self->_live forKey:@"live"];
  [v5 encodeInteger:self->_state forKey:@"state"];
  if (!self->_live)
  {
    [v5 encodeDouble:@"elapsed" forKey:self->_elapsedTime];
    [v5 encodeDouble:@"duration" forKey:self->_duration];
    [v5 encodeDouble:@"timestamp" forKey:self->_timestamp];
  }
}

- (MPMusicPlayerControllerNowPlayingTimeSnapshot)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MPMusicPlayerControllerNowPlayingTimeSnapshot;
  id v5 = [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)&v11 init];
  if (v5)
  {
    [v4 decodeFloatForKey:@"rate"];
    v5->_rate = v6;
    v5->_live = [v4 decodeBoolForKey:@"live"];
    v5->_state = [v4 decodeIntegerForKey:@"state"];
    if (!v5->_live)
    {
      [v4 decodeDoubleForKey:@"elapsed"];
      v5->_elapsedTime = v7;
      [v4 decodeDoubleForKey:@"duration"];
      v5->_duration = v8;
      [v4 decodeDoubleForKey:@"timestamp"];
      v5->_timestamp = v9;
    }
  }

  return v5;
}

- (double)currentTime
{
  if (self->_live) {
    return NAN;
  }
  double elapsedTime = self->_elapsedTime;
  [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
  double duration = elapsedTime + (v5 - self->_timestamp) * self->_rate;
  if (duration >= self->_duration) {
    double duration = self->_duration;
  }
  return fmax(duration, 0.0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v5 = v4;
    float v6 = v5;
    if (self->_state != *((void *)v5 + 5) || !self->_live == (*((unsigned char *)v5 + 32) != 0)) {
      goto LABEL_12;
    }
    [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)self rate];
    float v8 = v7;
    [v6 rate];
    float v10 = v8 - v9;
    if (v10 < 0.0) {
      float v10 = -v10;
    }
    if (v10 >= 0.05)
    {
LABEL_12:
      BOOL v15 = 0;
    }
    else
    {
      [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)self currentTime];
      double v12 = v11;
      [v6 currentTime];
      double v14 = v12 - v13;
      if (v14 < 0.0) {
        double v14 = -v14;
      }
      BOOL v15 = v14 < 0.05;
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (unint64_t)hash
{
  uint64_t v2 = 1193046;
  if (!self->_live) {
    uint64_t v2 = 11259375;
  }
  return v2 ^ (unint64_t)self->_rate ^ (unint64_t)self->_elapsedTime ^ (unint64_t)self->_duration ^ (unint64_t)self->_timestamp ^ self->_state;
}

- (id)_init
{
  v3.receiver = self;
  v3.super_class = (Class)MPMusicPlayerControllerNowPlayingTimeSnapshot;
  return [(MPMusicPlayerControllerNowPlayingTimeSnapshot *)&v3 init];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (MPMusicPlayerControllerNowPlayingTimeSnapshot)snapshotWithElapsedTime:(double)a3 duration:(double)a4 rate:(float)a5 atTimestamp:(double)a6 state:(int64_t)a7
{
  uint64_t v12 = [objc_alloc((Class)a1) _init];
  *(double *)(v12 + 8) = a3;
  *(double *)(v12 + 16) = a4;
  *(float *)(v12 + 36) = a5;
  *(double *)(v12 + 24) = a6;
  *(void *)(v12 + 40) = a7;

  return (MPMusicPlayerControllerNowPlayingTimeSnapshot *)(id)v12;
}

+ (id)liveSnapshotWithRate:(float)a3 state:(int64_t)a4
{
  uint64_t v6 = [objc_alloc((Class)a1) _init];
  *(unsigned char *)(v6 + 32) = 1;
  *(float *)(v6 + 36) = a3;
  *(void *)(v6 + 40) = a4;

  return (id)v6;
}

@end