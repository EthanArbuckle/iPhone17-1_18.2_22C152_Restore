@interface HDStatisticsPercentileConfiguration
- (HDStatisticsPercentileConfiguration)initWithPercentile:(id)a3;
- (NSNumber)percentile;
- (void)setPercentile:(id)a3;
@end

@implementation HDStatisticsPercentileConfiguration

- (HDStatisticsPercentileConfiguration)initWithPercentile:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HDStatisticsPercentileConfiguration;
  v6 = [(HDStatisticsPercentileConfiguration *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_percentile, a3);
  }

  return v7;
}

- (NSNumber)percentile
{
  return self->_percentile;
}

- (void)setPercentile:(id)a3
{
}

- (void).cxx_destruct
{
}

@end