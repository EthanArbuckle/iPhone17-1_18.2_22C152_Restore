@interface ARCoachingHeuristicDelay
- (ARCoachingHeuristicDelay)initWithDuration:(double)a3;
- (int64_t)requirements;
- (void)updateWithFrame:(id)a3 cache:(id)a4;
@end

@implementation ARCoachingHeuristicDelay

- (ARCoachingHeuristicDelay)initWithDuration:(double)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ARCoachingHeuristicDelay;
  result = [(ARCoachingHeuristicDelay *)&v5 init];
  if (result)
  {
    result->_endTime = -1.0;
    result->_duration = a3;
  }
  return result;
}

- (int64_t)requirements
{
  return [(ARCoachingHeuristic *)self satisfied] ^ 1;
}

- (void)updateWithFrame:(id)a3 cache:(id)a4
{
  id v7 = a3;
  if (![(ARCoachingHeuristic *)self satisfied])
  {
    if (self->_endTime < 0.0)
    {
      [v7 timestamp];
      self->_endTime = v5 + self->_duration;
    }
    [v7 timestamp];
    [(ARCoachingHeuristic *)self setSatisfied:v6 >= self->_endTime];
  }
}

@end