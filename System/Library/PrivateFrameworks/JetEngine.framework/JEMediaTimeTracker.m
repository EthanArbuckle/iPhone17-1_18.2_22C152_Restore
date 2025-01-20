@interface JEMediaTimeTracker
- (JEMediaTimeTracker)initWithPosition:(unint64_t)a3 playbackRate:(float)a4;
- (JEMediaTimeTrackerDateProvider)dateProvider;
- (NSDate)date;
- (float)playbackRate;
- (id)estimatedTimeAtPastPosition:(unint64_t)a3;
- (id)estimatedTimeAtPosition:(unint64_t)a3;
- (unint64_t)position;
- (void)setDate:(id)a3;
- (void)setDateProvider:(id)a3;
- (void)setPlaybackRate:(float)a3;
- (void)setPosition:(unint64_t)a3;
- (void)updatePosition:(unint64_t)a3;
- (void)updatePosition:(unint64_t)a3 playbackRate:(float)a4;
@end

@implementation JEMediaTimeTracker

- (JEMediaTimeTracker)initWithPosition:(unint64_t)a3 playbackRate:(float)a4
{
  v10.receiver = self;
  v10.super_class = (Class)JEMediaTimeTracker;
  v6 = [(JEMediaTimeTracker *)&v10 init];
  if (v6)
  {
    v7 = objc_alloc_init(JEMediaTimeTrackerDateProvider);
    [(JEMediaTimeTracker *)v6 setDateProvider:v7];

    *(float *)&double v8 = a4;
    [(JEMediaTimeTracker *)v6 updatePosition:a3 playbackRate:v8];
  }
  return v6;
}

- (void)updatePosition:(unint64_t)a3
{
  v5 = [(JEMediaTimeTracker *)self dateProvider];
  v6 = [v5 date];
  [(JEMediaTimeTracker *)self setDate:v6];

  [(JEMediaTimeTracker *)self setPosition:a3];
}

- (void)updatePosition:(unint64_t)a3 playbackRate:(float)a4
{
  v7 = [(JEMediaTimeTracker *)self dateProvider];
  double v8 = [v7 date];
  [(JEMediaTimeTracker *)self setDate:v8];

  [(JEMediaTimeTracker *)self setPosition:a3];
  *(float *)&double v9 = a4;
  [(JEMediaTimeTracker *)self setPlaybackRate:v9];
}

- (float)playbackRate
{
  float result = self->_playbackRate;
  if (result == 0.0) {
    return 1.0;
  }
  return result;
}

- (id)estimatedTimeAtPosition:(unint64_t)a3
{
  double v4 = ((double)a3 - (double)[(JEMediaTimeTracker *)self position]) / 1000.0;
  v5 = [(JEMediaTimeTracker *)self date];
  [(JEMediaTimeTracker *)self playbackRate];
  v7 = [v5 dateByAddingTimeInterval:v4 / v6];

  return v7;
}

- (id)estimatedTimeAtPastPosition:(unint64_t)a3
{
  v3 = [(JEMediaTimeTracker *)self estimatedTimeAtPosition:a3];
  double v4 = [MEMORY[0x1E4F1C9C8] date];
  if ([v3 compare:v4] == -1) {
    v5 = v3;
  }
  else {
    v5 = v4;
  }
  id v6 = v5;

  return v6;
}

- (JEMediaTimeTrackerDateProvider)dateProvider
{
  return self->_dateProvider;
}

- (void)setDateProvider:(id)a3
{
}

- (void)setPlaybackRate:(float)a3
{
  self->_playbackRate = a3;
}

- (NSDate)date
{
  return self->_date;
}

- (void)setDate:(id)a3
{
}

- (unint64_t)position
{
  return self->_position;
}

- (void)setPosition:(unint64_t)a3
{
  self->_position = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_dateProvider, 0);
}

@end