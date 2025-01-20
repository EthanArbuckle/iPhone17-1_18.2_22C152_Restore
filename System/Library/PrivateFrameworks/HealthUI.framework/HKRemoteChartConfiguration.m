@interface HKRemoteChartConfiguration
- (HKRemoteChartConfiguration)initWithStatisticIntervalComponentsByTimeScope:(id)a3;
- (id)statisticIntervalComponentsForTimeScope:(int64_t)a3;
@end

@implementation HKRemoteChartConfiguration

- (HKRemoteChartConfiguration)initWithStatisticIntervalComponentsByTimeScope:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKRemoteChartConfiguration;
  v6 = [(HKRemoteChartConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_statisticIntervalComponentsByTimeScope, a3);
  }

  return v7;
}

- (id)statisticIntervalComponentsForTimeScope:(int64_t)a3
{
  statisticIntervalComponentsByTimeScope = self->_statisticIntervalComponentsByTimeScope;
  v4 = [NSNumber numberWithInteger:a3];
  id v5 = [(NSDictionary *)statisticIntervalComponentsByTimeScope objectForKeyedSubscript:v4];

  return v5;
}

- (void).cxx_destruct
{
}

@end