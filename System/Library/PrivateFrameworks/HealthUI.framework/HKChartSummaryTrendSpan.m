@interface HKChartSummaryTrendSpan
- (BOOL)isEqual:(id)a3;
- (HKChartSummaryTrendSpan)initWithTrendDateInterval:(id)a3 trendAverage:(id)a4;
- (HKQuantity)trendAverage;
- (NSDateInterval)trendDateInterval;
- (unint64_t)hash;
@end

@implementation HKChartSummaryTrendSpan

- (HKChartSummaryTrendSpan)initWithTrendDateInterval:(id)a3 trendAverage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HKChartSummaryTrendSpan;
  v9 = [(HKChartSummaryTrendSpan *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_trendDateInterval, a3);
    objc_storeStrong((id *)&v10->_trendAverage, a4);
  }

  return v10;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKChartSummaryTrendSpan *)a3;
  if (self == v4)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if ([(HKQuantity *)self->_trendAverage isEqual:v5->_trendAverage]) {
        char v6 = [(NSDateInterval *)self->_trendDateInterval isEqual:v5->_trendDateInterval];
      }
      else {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(HKQuantity *)self->_trendAverage hash];
  return [(NSDateInterval *)self->_trendDateInterval hash] ^ v3;
}

- (NSDateInterval)trendDateInterval
{
  return self->_trendDateInterval;
}

- (HKQuantity)trendAverage
{
  return self->_trendAverage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trendAverage, 0);
  objc_storeStrong((id *)&self->_trendDateInterval, 0);
}

@end