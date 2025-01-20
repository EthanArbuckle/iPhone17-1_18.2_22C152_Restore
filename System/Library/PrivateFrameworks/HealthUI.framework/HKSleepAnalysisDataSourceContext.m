@interface HKSleepAnalysisDataSourceContext
+ (id)sleepAnalysisDataSourceContextWithChartType:(int64_t)a3 timeScope:(int64_t)a4;
- (int64_t)chartType;
- (int64_t)timeScope;
- (void)setChartType:(int64_t)a3;
- (void)setTimeScope:(int64_t)a3;
@end

@implementation HKSleepAnalysisDataSourceContext

+ (id)sleepAnalysisDataSourceContextWithChartType:(int64_t)a3 timeScope:(int64_t)a4
{
  v6 = objc_alloc_init(HKSleepAnalysisDataSourceContext);
  [(HKSleepAnalysisDataSourceContext *)v6 setChartType:a3];
  [(HKSleepAnalysisDataSourceContext *)v6 setTimeScope:a4];
  return v6;
}

- (int64_t)chartType
{
  return self->_chartType;
}

- (void)setChartType:(int64_t)a3
{
  self->_chartType = a3;
}

- (int64_t)timeScope
{
  return self->_timeScope;
}

- (void)setTimeScope:(int64_t)a3
{
  self->_timeScope = a3;
}

@end