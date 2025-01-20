@interface CLRacingRoutePerformanceResults
- (CLRacingRoutePerformanceResults)initWithTimeAhead:(double)a3 currentDistance:(double)a4 referenceDistance:(double)a5 currentAveragePace:(double)a6 totalOverlapDistance:(double)a7 state:(unint64_t)a8;
- (double)currentAveragePace_s_per_m;
- (double)currentDistance_m;
- (double)referenceDistance_m;
- (double)timeAhead_s;
- (double)totalOverlapDistance_m;
- (unint64_t)state;
@end

@implementation CLRacingRoutePerformanceResults

- (CLRacingRoutePerformanceResults)initWithTimeAhead:(double)a3 currentDistance:(double)a4 referenceDistance:(double)a5 currentAveragePace:(double)a6 totalOverlapDistance:(double)a7 state:(unint64_t)a8
{
  v15.receiver = self;
  v15.super_class = (Class)CLRacingRoutePerformanceResults;
  result = [(CLRacingRoutePerformanceResults *)&v15 init];
  if (result)
  {
    result->_timeAhead_s = a3;
    result->_currentDistance_m = a4;
    result->_referenceDistance_m = a5;
    result->_currentAveragePace_s_per_m = a6;
    result->_totalOverlapDistance_m = a7;
    result->_state = a8;
  }
  return result;
}

- (double)timeAhead_s
{
  return self->_timeAhead_s;
}

- (double)currentDistance_m
{
  return self->_currentDistance_m;
}

- (double)referenceDistance_m
{
  return self->_referenceDistance_m;
}

- (double)currentAveragePace_s_per_m
{
  return self->_currentAveragePace_s_per_m;
}

- (double)totalOverlapDistance_m
{
  return self->_totalOverlapDistance_m;
}

- (unint64_t)state
{
  return self->_state;
}

@end