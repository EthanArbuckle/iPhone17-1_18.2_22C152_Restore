@interface ADWatchDog
- (ADWatchDog)initWithReason:(id)a3 andDelay:(unint64_t)a4;
- (NSString)reason;
- (unint64_t)delayTime;
- (void)setDelayTime:(unint64_t)a3;
- (void)setReason:(id)a3;
- (void)updateReason:(id)a3;
@end

@implementation ADWatchDog

- (ADWatchDog)initWithReason:(id)a3 andDelay:(unint64_t)a4
{
  id v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ADWatchDog;
  v8 = [(ADWatchDog *)&v11 init];
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_reason, a3);
    v9->_delayTime = a4;
  }

  return v9;
}

- (void)updateReason:(id)a3
{
  v4 = (NSString *)a3;
  v5 = [NSString stringWithFormat:@"Updating watchdog reason from '%@' to '%@'.", self->_reason, v4];
  _ADLog(@"ToroLogging", v5, 0);

  reason = self->_reason;
  self->_reason = v4;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (unint64_t)delayTime
{
  return self->_delayTime;
}

- (void)setDelayTime:(unint64_t)a3
{
  self->_delayTime = a3;
}

- (void).cxx_destruct
{
}

@end