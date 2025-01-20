@interface ABBurdenResult
- (ABBurdenResult)init;
- (NSDictionary)metricsForCoreAnalytics;
- (NSNumber)burdenPercentage;
- (unint64_t)unavailabilityReason;
- (void)setBurdenPercentage:(id)a3;
- (void)setMetricsForCoreAnalytics:(id)a3;
- (void)setUnavailabilityReason:(unint64_t)a3;
@end

@implementation ABBurdenResult

- (ABBurdenResult)init
{
  v7.receiver = self;
  v7.super_class = (Class)ABBurdenResult;
  v2 = [(ABBurdenResult *)&v7 init];
  v3 = v2;
  if (v2)
  {
    metricsForCoreAnalytics = v2->_metricsForCoreAnalytics;
    v2->_metricsForCoreAnalytics = (NSDictionary *)MEMORY[0x263EFFA78];

    v5 = v3;
  }

  return v3;
}

- (NSNumber)burdenPercentage
{
  return self->_burdenPercentage;
}

- (void)setBurdenPercentage:(id)a3
{
}

- (unint64_t)unavailabilityReason
{
  return self->_unavailabilityReason;
}

- (void)setUnavailabilityReason:(unint64_t)a3
{
  self->_unavailabilityReason = a3;
}

- (NSDictionary)metricsForCoreAnalytics
{
  return self->_metricsForCoreAnalytics;
}

- (void)setMetricsForCoreAnalytics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metricsForCoreAnalytics, 0);
  objc_storeStrong((id *)&self->_burdenPercentage, 0);
}

@end