@interface BLSHWatchdogTesterTimer
- (BLSHWatchdogTesterTimer)initWithExplanation:(id)a3;
- (BOOL)hasSleepBeenImminentSinceScheduled;
- (BOOL)isInvalidated;
- (NSString)explanation;
- (unint64_t)invalidationReason;
- (void)invalidate:(unint64_t)a3;
- (void)setSleepImminentSinceScheduled:(BOOL)a3;
@end

@implementation BLSHWatchdogTesterTimer

- (BLSHWatchdogTesterTimer)initWithExplanation:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BLSHWatchdogTesterTimer;
  v5 = [(BLSHWatchdogTesterTimer *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    explanation = v5->_explanation;
    v5->_explanation = (NSString *)v6;
  }
  return v5;
}

- (void)invalidate:(unint64_t)a3
{
  self->_invalidated = 1;
  self->_invalidationReason = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (unint64_t)invalidationReason
{
  return self->_invalidationReason;
}

- (NSString)explanation
{
  return self->_explanation;
}

- (BOOL)hasSleepBeenImminentSinceScheduled
{
  return self->_sleepImminentSinceScheduled;
}

- (void)setSleepImminentSinceScheduled:(BOOL)a3
{
  self->_sleepImminentSinceScheduled = a3;
}

- (void).cxx_destruct
{
}

@end