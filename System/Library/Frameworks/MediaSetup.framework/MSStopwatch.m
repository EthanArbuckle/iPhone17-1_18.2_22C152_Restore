@interface MSStopwatch
- (BOOL)isLocked;
- (MSStopwatch)init;
- (NSMutableArray)laps;
- (int64_t)status;
- (unint64_t)elapsedTime;
- (unint64_t)elapsedTimeMS;
- (unint64_t)elapsedTimeSeconds;
- (unint64_t)lastLapTime;
- (unint64_t)startTime;
- (unint64_t)stopTime;
- (void)lap;
- (void)lapWithName:(id)a3;
- (void)reset;
- (void)setElapsedTime:(unint64_t)a3;
- (void)setElapsedTimeMS:(unint64_t)a3;
- (void)setElapsedTimeSeconds:(unint64_t)a3;
- (void)setIsLocked:(BOOL)a3;
- (void)setLaps:(id)a3;
- (void)setLastLapTime:(unint64_t)a3;
- (void)setStartTime:(unint64_t)a3;
- (void)setStatus:(int64_t)a3;
- (void)setStopTime:(unint64_t)a3;
- (void)start;
- (void)stop;
- (void)toggleLock:(BOOL)a3;
@end

@implementation MSStopwatch

- (MSStopwatch)init
{
  v6.receiver = self;
  v6.super_class = (Class)MSStopwatch;
  v2 = [(MSStopwatch *)&v6 init];
  v3 = v2;
  if (v2)
  {
    [(MSStopwatch *)v2 setStartTime:0];
    [(MSStopwatch *)v3 setStopTime:0];
    [(MSStopwatch *)v3 setElapsedTime:0];
    [(MSStopwatch *)v3 setElapsedTimeMS:0];
    [(MSStopwatch *)v3 setElapsedTimeSeconds:0];
    [(MSStopwatch *)v3 setLastLapTime:0];
    [(MSStopwatch *)v3 setStatus:1];
    [(MSStopwatch *)v3 setIsLocked:0];
    v4 = objc_opt_new();
    [(MSStopwatch *)v3 setLaps:v4];
  }
  return v3;
}

- (void)start
{
  if (self->_status && !self->_isLocked)
  {
    if (!self->_startTime) {
      self->_startTime = mach_absolute_time();
    }
    self->_status = 0;
  }
}

- (void)stop
{
  if (self->_status != 1 && !self->_isLocked)
  {
    uint64_t v3 = mach_absolute_time();
    unint64_t v4 = v3 - self->_startTime;
    self->_stopTime = v3;
    self->_elapsedTime = v4;
    self->_elapsedTimeMS = UpTicksToMilliseconds();
    self->_elapsedTimeSeconds = UpTicksToSeconds();
    self->_status = 1;
  }
}

- (void)lap
{
}

- (void)lapWithName:(id)a3
{
  id v4 = a3;
  if (self->_status != 1 && !self->_isLocked)
  {
    id v10 = v4;
    unint64_t v5 = mach_absolute_time() - self->_startTime;
    if (v10)
    {
      id v6 = v10;
    }
    else
    {
      v7 = [MEMORY[0x263F08C38] UUID];
      id v6 = [v7 UUIDString];
    }
    laps = self->_laps;
    v9 = [[MSStopwatchLap alloc] initWithLapTime:v5 andName:v6];
    [(NSMutableArray *)laps addObject:v9];

    self->_startTime = 0;
    self->_lastLapTime = v5;

    id v4 = v10;
  }
}

- (void)reset
{
  if (self->_status && !self->_isLocked)
  {
    *(_OWORD *)&self->_elapsedTime = 0u;
    *(_OWORD *)&self->_elapsedTimeSeconds = 0u;
    *(_OWORD *)&self->_startTime = 0u;
    self->_laps = (NSMutableArray *)objc_opt_new();
    MEMORY[0x270F9A758]();
  }
}

- (void)toggleLock:(BOOL)a3
{
  if (self->_isLocked != a3) {
    self->_isLocked = a3;
  }
}

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

- (unint64_t)stopTime
{
  return self->_stopTime;
}

- (void)setStopTime:(unint64_t)a3
{
  self->_stopTime = a3;
}

- (unint64_t)elapsedTime
{
  return self->_elapsedTime;
}

- (void)setElapsedTime:(unint64_t)a3
{
  self->_elapsedTime = a3;
}

- (unint64_t)elapsedTimeMS
{
  return self->_elapsedTimeMS;
}

- (void)setElapsedTimeMS:(unint64_t)a3
{
  self->_elapsedTimeMS = a3;
}

- (unint64_t)elapsedTimeSeconds
{
  return self->_elapsedTimeSeconds;
}

- (void)setElapsedTimeSeconds:(unint64_t)a3
{
  self->_elapsedTimeSeconds = a3;
}

- (unint64_t)lastLapTime
{
  return self->_lastLapTime;
}

- (void)setLastLapTime:(unint64_t)a3
{
  self->_lastLapTime = a3;
}

- (int64_t)status
{
  return self->_status;
}

- (void)setStatus:(int64_t)a3
{
  self->_status = a3;
}

- (BOOL)isLocked
{
  return self->_isLocked;
}

- (void)setIsLocked:(BOOL)a3
{
  self->_isLocked = a3;
}

- (NSMutableArray)laps
{
  return self->_laps;
}

- (void)setLaps:(id)a3
{
}

- (void).cxx_destruct
{
}

@end