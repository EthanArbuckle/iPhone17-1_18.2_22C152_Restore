@interface HAMenstrualAlgorithmsDeviation
+ (BOOL)supportsSecureCoding;
- (HAMenstrualAlgorithmsDeviation)initWithCoder:(id)a3;
- (NSDictionary)metricsForCoreAnalytics;
- (unsigned)julianDayOfAnalysisWindowEnd;
- (unsigned)julianDayOfAnalysisWindowStart;
- (void)encodeWithCoder:(id)a3;
- (void)setJulianDayOfAnalysisWindowEnd:(unsigned int)a3;
- (void)setJulianDayOfAnalysisWindowStart:(unsigned int)a3;
- (void)setMetricsForCoreAnalytics:(id)a3;
@end

@implementation HAMenstrualAlgorithmsDeviation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (HAMenstrualAlgorithmsDeviation)initWithCoder:(id)a3
{
  v17[3] = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HAMenstrualAlgorithmsDeviation;
  v5 = [(HAMenstrualAlgorithmsDeviation *)&v16 init];
  if (v5)
  {
    v6 = NSStringFromSelector(sel_julianDayOfWindowStart);
    v5->_julianDayOfAnalysisWindowStart = [v4 decodeInt32ForKey:v6];

    v7 = NSStringFromSelector(sel_julianDayOfAnalysisWindowEnd);
    v5->_julianDayOfAnalysisWindowEnd = [v4 decodeInt32ForKey:v7];

    v8 = (void *)MEMORY[0x263EFFA08];
    v17[0] = objc_opt_class();
    v17[1] = objc_opt_class();
    v17[2] = objc_opt_class();
    v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v17 count:3];
    v10 = [v8 setWithArray:v9];

    v11 = NSStringFromSelector(sel_metricsForCoreAnalytics);
    uint64_t v12 = [v4 decodeObjectOfClasses:v10 forKey:v11];
    metricsForCoreAnalytics = v5->_metricsForCoreAnalytics;
    v5->_metricsForCoreAnalytics = (NSDictionary *)v12;

    v14 = v5;
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v10 = a3;
  uint64_t julianDayOfAnalysisWindowStart = self->_julianDayOfAnalysisWindowStart;
  v5 = NSStringFromSelector(sel_julianDayOfWindowStart);
  [v10 encodeInt32:julianDayOfAnalysisWindowStart forKey:v5];

  uint64_t julianDayOfAnalysisWindowEnd = self->_julianDayOfAnalysisWindowEnd;
  v7 = NSStringFromSelector(sel_julianDayOfAnalysisWindowEnd);
  [v10 encodeInt32:julianDayOfAnalysisWindowEnd forKey:v7];

  metricsForCoreAnalytics = self->_metricsForCoreAnalytics;
  v9 = NSStringFromSelector(sel_metricsForCoreAnalytics);
  [v10 encodeObject:metricsForCoreAnalytics forKey:v9];
}

- (unsigned)julianDayOfAnalysisWindowStart
{
  return self->_julianDayOfAnalysisWindowStart;
}

- (void)setJulianDayOfAnalysisWindowStart:(unsigned int)a3
{
  self->_uint64_t julianDayOfAnalysisWindowStart = a3;
}

- (unsigned)julianDayOfAnalysisWindowEnd
{
  return self->_julianDayOfAnalysisWindowEnd;
}

- (void)setJulianDayOfAnalysisWindowEnd:(unsigned int)a3
{
  self->_uint64_t julianDayOfAnalysisWindowEnd = a3;
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
}

@end