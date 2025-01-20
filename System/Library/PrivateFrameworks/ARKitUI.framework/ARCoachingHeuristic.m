@interface ARCoachingHeuristic
- (BOOL)satisfied;
- (int64_t)requirements;
- (void)setSatisfied:(BOOL)a3;
@end

@implementation ARCoachingHeuristic

- (int64_t)requirements
{
  return 0;
}

- (BOOL)satisfied
{
  return self->_satisfied;
}

- (void)setSatisfied:(BOOL)a3
{
  self->_satisfied = a3;
}

@end