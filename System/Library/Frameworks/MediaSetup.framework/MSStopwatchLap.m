@interface MSStopwatchLap
- (MSStopwatchLap)initWithLapTime:(unint64_t)a3 andName:(id)a4;
- (NSString)name;
- (unint64_t)lapTime;
- (unint64_t)lapTimeMS;
- (void)setLapTime:(unint64_t)a3;
- (void)setName:(id)a3;
@end

@implementation MSStopwatchLap

- (MSStopwatchLap)initWithLapTime:(unint64_t)a3 andName:(id)a4
{
  id v6 = a4;
  v10.receiver = self;
  v10.super_class = (Class)MSStopwatchLap;
  v7 = [(MSStopwatchLap *)&v10 init];
  v8 = v7;
  if (v7)
  {
    [(MSStopwatchLap *)v7 setName:v6];
    [(MSStopwatchLap *)v8 setLapTime:a3];
  }

  return v8;
}

- (unint64_t)lapTimeMS
{
  return UpTicksToMilliseconds();
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (unint64_t)lapTime
{
  return self->_lapTime;
}

- (void)setLapTime:(unint64_t)a3
{
  self->_lapTime = a3;
}

- (void).cxx_destruct
{
}

@end