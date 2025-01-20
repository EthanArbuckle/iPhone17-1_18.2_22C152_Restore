@interface HKAudiogramPerformanceAnalytics
+ (id)metricForAudiogramQueryWithQueryDuration:(double)a3 audiogramCount:(int64_t)a4;
- (HKAudiogramPerformanceAnalytics)init;
@end

@implementation HKAudiogramPerformanceAnalytics

- (HKAudiogramPerformanceAnalytics)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for AudiogramPerformanceAnalytics();
  return [(HKAudiogramPerformanceAnalytics *)&v3 init];
}

+ (id)metricForAudiogramQueryWithQueryDuration:(double)a3 audiogramCount:(int64_t)a4
{
  id v4 = _s8HealthUI29AudiogramPerformanceAnalyticsC6MetricC19audiogramChartQuery13queryDuration0G5CountAEXDSd_SitFZ_0(a4, a3);
  return v4;
}

@end