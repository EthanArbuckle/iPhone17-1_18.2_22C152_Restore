@interface _MPCSleepTimerCommand
- (BOOL)isDisabled;
- (double)fireDate;
- (double)time;
- (id)reset;
- (id)startForChapterEnd;
- (id)startForItemEnd;
- (id)startWithTime:(double)a3;
- (int64_t)disabledReason;
- (int64_t)stopMode;
- (void)setDisabled:(BOOL)a3;
- (void)setDisabledReason:(int64_t)a3;
- (void)setFireDate:(double)a3;
- (void)setStopMode:(int64_t)a3;
- (void)setTime:(double)a3;
@end

@implementation _MPCSleepTimerCommand

- (void)setDisabledReason:(int64_t)a3
{
  self->_disabledReason = a3;
}

- (int64_t)disabledReason
{
  return self->_disabledReason;
}

- (void)setDisabled:(BOOL)a3
{
  self->_disabled = a3;
}

- (BOOL)isDisabled
{
  return self->_disabled;
}

- (void)setStopMode:(int64_t)a3
{
  self->_stopMode = a3;
}

- (int64_t)stopMode
{
  return self->_stopMode;
}

- (void)setFireDate:(double)a3
{
  self->_fireDate = a3;
}

- (double)fireDate
{
  return self->_fireDate;
}

- (void)setTime:(double)a3
{
  self->_time = a3;
}

- (double)time
{
  return self->_time;
}

- (id)reset
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F54D98];
  v3 = [NSNumber numberWithInteger:MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode()];
  v13[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v5 = [(_MPCPlayerCommand *)self response];
  v6 = [MPCPlayerCommandRequest alloc];
  v7 = [v5 controller];
  v8 = [v5 request];
  v9 = [v8 label];
  v10 = [(MPCPlayerCommandRequest *)v6 initWithMediaRemoteCommand:124 options:v4 controller:v7 label:v9];

  return v10;
}

- (id)startForChapterEnd
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F54D98];
  v3 = [NSNumber numberWithInteger:MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode()];
  v13[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v5 = [(_MPCPlayerCommand *)self response];
  v6 = [MPCPlayerCommandRequest alloc];
  v7 = [v5 controller];
  v8 = [v5 request];
  v9 = [v8 label];
  v10 = [(MPCPlayerCommandRequest *)v6 initWithMediaRemoteCommand:124 options:v4 controller:v7 label:v9];

  return v10;
}

- (id)startForItemEnd
{
  v13[1] = *MEMORY[0x263EF8340];
  uint64_t v12 = *MEMORY[0x263F54D98];
  v3 = [NSNumber numberWithInteger:MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode()];
  v13[0] = v3;
  v4 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];

  v5 = [(_MPCPlayerCommand *)self response];
  v6 = [MPCPlayerCommandRequest alloc];
  v7 = [v5 controller];
  v8 = [v5 request];
  v9 = [v8 label];
  v10 = [(MPCPlayerCommandRequest *)v6 initWithMediaRemoteCommand:124 options:v4 controller:v7 label:v9];

  return v10;
}

- (id)startWithTime:(double)a3
{
  v15[2] = *MEMORY[0x263EF8340];
  v14[0] = *MEMORY[0x263F54DA0];
  v4 = [NSNumber numberWithDouble:a3];
  v15[0] = v4;
  v14[1] = *MEMORY[0x263F54D98];
  v5 = [NSNumber numberWithInteger:MPSleepTimerStopModeToMediaRemoteSleepTimerStopMode()];
  v15[1] = v5;
  v6 = [NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];

  v7 = [(_MPCPlayerCommand *)self response];
  v8 = [MPCPlayerCommandRequest alloc];
  v9 = [v7 controller];
  v10 = [v7 request];
  v11 = [v10 label];
  uint64_t v12 = [(MPCPlayerCommandRequest *)v8 initWithMediaRemoteCommand:124 options:v6 controller:v9 label:v11];

  return v12;
}

@end