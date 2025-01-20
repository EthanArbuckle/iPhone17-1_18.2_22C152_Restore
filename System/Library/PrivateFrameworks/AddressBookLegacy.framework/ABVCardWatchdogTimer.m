@interface ABVCardWatchdogTimer
+ (ABVCardWatchdogTimer)timerWithTimeProvider:(id)a3;
+ (BOOL)shouldCheckTime;
- (ABVCardTimeProvider)timeProvider;
- (ABVCardWatchdogTimer)initWithTimeProvider:(id)a3;
- (BOOL)isStarted;
- (BOOL)isValid;
- (BOOL)valid;
- (NSDate)startTime;
- (unint64_t)ticks;
- (void)checkValidity;
- (void)dealloc;
- (void)setStartTime:(id)a3;
- (void)setTicks:(unint64_t)a3;
- (void)setValid:(BOOL)a3;
- (void)start;
@end

@implementation ABVCardWatchdogTimer

+ (ABVCardWatchdogTimer)timerWithTimeProvider:(id)a3
{
  if (![a1 shouldCheckTime]) {
    return 0;
  }
  v5 = (void *)[objc_alloc((Class)a1) initWithTimeProvider:a3];
  return (ABVCardWatchdogTimer *)v5;
}

+ (BOOL)shouldCheckTime
{
  return ABIsDataAccess() ^ 1;
}

- (ABVCardWatchdogTimer)initWithTimeProvider:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)ABVCardWatchdogTimer;
  v4 = [(ABVCardWatchdogTimer *)&v6 init];
  if (v4)
  {
    v4->_timeProvider = (ABVCardTimeProvider *)a3;
    v4->_valid = 1;
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)ABVCardWatchdogTimer;
  [(ABVCardWatchdogTimer *)&v3 dealloc];
}

- (void)start
{
  uint64_t v3 = [(ABVCardTimeProvider *)[(ABVCardWatchdogTimer *)self timeProvider] now];
  [(ABVCardWatchdogTimer *)self setStartTime:v3];
}

- (BOOL)isStarted
{
  return [(ABVCardWatchdogTimer *)self startTime] != 0;
}

- (void)checkValidity
{
  objc_msgSend((id)-[ABVCardTimeProvider now](-[ABVCardWatchdogTimer timeProvider](self, "timeProvider"), "now"), "timeIntervalSinceDate:", -[ABVCardWatchdogTimer startTime](self, "startTime"));
  if (v3 > 9.0)
  {
    [(ABVCardWatchdogTimer *)self setValid:0];
  }
}

- (BOOL)isValid
{
  if (![(ABVCardWatchdogTimer *)self isStarted]) {
    return 1;
  }
  [(ABVCardWatchdogTimer *)self setTicks:([(ABVCardWatchdogTimer *)self ticks] + 1) % 0xC8];
  if (![(ABVCardWatchdogTimer *)self ticks]) {
    [(ABVCardWatchdogTimer *)self checkValidity];
  }
  return [(ABVCardWatchdogTimer *)self valid];
}

- (unint64_t)ticks
{
  return self->_ticks;
}

- (void)setTicks:(unint64_t)a3
{
  self->_ticks = a3;
}

- (ABVCardTimeProvider)timeProvider
{
  return self->_timeProvider;
}

- (NSDate)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(id)a3
{
}

- (BOOL)valid
{
  return self->_valid;
}

- (void)setValid:(BOOL)a3
{
  self->_valid = a3;
}

@end