@interface C2SessionCallbackMetrics
- (unint64_t)startTime;
- (void)setStartTime:(unint64_t)a3;
@end

@implementation C2SessionCallbackMetrics

- (unint64_t)startTime
{
  return self->_startTime;
}

- (void)setStartTime:(unint64_t)a3
{
  self->_startTime = a3;
}

@end