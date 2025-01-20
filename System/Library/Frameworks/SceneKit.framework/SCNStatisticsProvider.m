@interface SCNStatisticsProvider
- (id)collectedShadersForPid:(int)a3;
- (id)performanceStatisticsForPid:(int)a3;
- (int)startCollectingPerformanceStatisticsForPid:(int)a3;
- (int)stopCollectingPerformanceStatisticsForPid:(int)a3;
@end

@implementation SCNStatisticsProvider

- (int)startCollectingPerformanceStatisticsForPid:(int)a3
{
  return _SCNStartCollectingPerformanceStatisticsForPid(a3);
}

- (int)stopCollectingPerformanceStatisticsForPid:(int)a3
{
  return 1;
}

- (id)performanceStatisticsForPid:(int)a3
{
  return _SCNGetPerformanceStatisticsForPid(a3);
}

- (id)collectedShadersForPid:(int)a3
{
  return _SCNGetCollectedShadersForPid();
}

@end