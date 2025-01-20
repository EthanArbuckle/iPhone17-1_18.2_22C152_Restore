@interface ARCoachingDelayedAnimation
- (double)coachingDelayTime;
- (void)setCoachingDelayTime:(double)a3;
@end

@implementation ARCoachingDelayedAnimation

- (double)coachingDelayTime
{
  return self->_coachingDelayTime;
}

- (void)setCoachingDelayTime:(double)a3
{
  self->_coachingDelayTime = a3;
}

@end