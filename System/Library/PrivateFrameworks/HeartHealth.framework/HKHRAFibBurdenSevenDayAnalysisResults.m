@interface HKHRAFibBurdenSevenDayAnalysisResults
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (BOOL)onboardedWithinAnalysisInterval;
- (HKHRAFibBurdenSevenDayAnalysisResults)initWithCoder:(id)a3;
- (HKHRAFibBurdenSevenDayAnalysisResults)initWithResult:(int64_t)a3 sample:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5;
- (HKQuantitySample)sampleCreated;
- (int64_t)result;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKHRAFibBurdenSevenDayAnalysisResults

- (HKHRAFibBurdenSevenDayAnalysisResults)initWithResult:(int64_t)a3 sample:(id)a4 onboardedWithinAnalysisInterval:(BOOL)a5
{
  id v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisResults;
  v10 = [(HKHRAFibBurdenSevenDayAnalysisResults *)&v13 init];
  v11 = v10;
  if (v10)
  {
    v10->_result = a3;
    objc_storeStrong((id *)&v10->_sampleCreated, a4);
    v11->_onboardedWithinAnalysisInterval = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  BOOL v6 = [v4 isMemberOfClass:objc_opt_class()]
    && self->_result == *((void *)v4 + 2)
    && ((sampleCreated = self->_sampleCreated, !((unint64_t)sampleCreated | *((void *)v4 + 3)))
     || -[HKQuantitySample isEqual:](sampleCreated, "isEqual:"))
    && self->_onboardedWithinAnalysisInterval == v4[8];

  return v6;
}

- (unint64_t)hash
{
  int64_t v2 = self->_result;
  return ([(HKQuantitySample *)self->_sampleCreated hash] ^ v2) != self->_onboardedWithinAnalysisInterval;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t result = self->_result;
  id v5 = a3;
  [v5 encodeInteger:result forKey:@"Result"];
  [v5 encodeObject:self->_sampleCreated forKey:@"Sample"];
  [v5 encodeBool:self->_onboardedWithinAnalysisInterval forKey:@"OnboardedWithinAnalysisInterval"];
}

- (HKHRAFibBurdenSevenDayAnalysisResults)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenSevenDayAnalysisResults;
  id v5 = [(HKHRAFibBurdenSevenDayAnalysisResults *)&v9 init];
  if (v5)
  {
    v5->_int64_t result = [v4 decodeIntegerForKey:@"Result"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"Sample"];
    sampleCreated = v5->_sampleCreated;
    v5->_sampleCreated = (HKQuantitySample *)v6;

    v5->_onboardedWithinAnalysisInterval = [v4 decodeBoolForKey:@"OnboardedWithinAnalysisInterval"];
  }

  return v5;
}

- (int64_t)result
{
  return self->_result;
}

- (HKQuantitySample)sampleCreated
{
  return self->_sampleCreated;
}

- (BOOL)onboardedWithinAnalysisInterval
{
  return self->_onboardedWithinAnalysisInterval;
}

- (void).cxx_destruct
{
}

@end