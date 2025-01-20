@interface MPSetSleepTimerCommand
- (double)fireDate;
- (double)time;
- (id)_mediaRemoteCommandInfoOptions;
- (int64_t)stopMode;
- (void)setFireDate:(double)a3;
- (void)setStopMode:(int64_t)a3;
- (void)setTime:(double)a3;
@end

@implementation MPSetSleepTimerCommand

- (id)_mediaRemoteCommandInfoOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v4 = [NSNumber numberWithDouble:self->_time];
  [v3 setObject:v4 forKeyedSubscript:*MEMORY[0x1E4F772F8]];

  v5 = [NSNumber numberWithInteger:self->_stopMode];
  [v3 setObject:v5 forKeyedSubscript:*MEMORY[0x1E4F772F0]];

  v6 = [NSNumber numberWithDouble:self->_fireDate];
  [v3 setObject:v6 forKeyedSubscript:*MEMORY[0x1E4F772E8]];

  v7 = (void *)[v3 copy];

  return v7;
}

- (int64_t)stopMode
{
  return self->_stopMode;
}

- (double)fireDate
{
  return self->_fireDate;
}

- (double)time
{
  return self->_time;
}

- (void)setStopMode:(int64_t)a3
{
  if (self->_stopMode != a3)
  {
    self->_stopMode = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setFireDate:(double)a3
{
  if (self->_fireDate != a3)
  {
    self->_fireDate = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

- (void)setTime:(double)a3
{
  if (self->_time != a3)
  {
    self->_time = a3;
    [(MPRemoteCommand *)self notifyPropagatablePropertyChanged];
  }
}

@end