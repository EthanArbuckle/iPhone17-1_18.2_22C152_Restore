@interface HKHRAFibBurdenAnalysisResult
+ (BOOL)supportsSecureCoding;
- (BOOL)burdenPercentageWasClampedToLowerBound;
- (BOOL)isEqual:(id)a3;
- (HKHRAFibBurdenAnalysisResult)initWithBurdenPercentage:(id)a3 burdenPercentageWasClampedToLowerBound:(BOOL)a4 unavailabilityReason:(int64_t)a5;
- (HKHRAFibBurdenAnalysisResult)initWithCoder:(id)a3;
- (NSNumber)burdenPercentage;
- (int64_t)unavailabilityReason;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setBurdenPercentageWasClampedToLowerBound:(BOOL)a3;
@end

@implementation HKHRAFibBurdenAnalysisResult

- (HKHRAFibBurdenAnalysisResult)initWithBurdenPercentage:(id)a3 burdenPercentageWasClampedToLowerBound:(BOOL)a4 unavailabilityReason:(int64_t)a5
{
  id v9 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HKHRAFibBurdenAnalysisResult;
  v10 = [(HKHRAFibBurdenAnalysisResult *)&v13 init];
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_burdenPercentage, a3);
    v11->_burdenPercentageWasClampedToLowerBound = a4;
    v11->_unavailabilityReason = a5;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (HKHRAFibBurdenAnalysisResult *)a3;
  if (self == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      burdenPercentage = self->_burdenPercentage;
      BOOL v7 = (!burdenPercentage && !v5->_burdenPercentage
         || [(NSNumber *)burdenPercentage isEqualToNumber:self->_burdenPercentage])
        && self->_burdenPercentageWasClampedToLowerBound == v5->_burdenPercentageWasClampedToLowerBound
        && self->_unavailabilityReason == v5->_unavailabilityReason;
    }
    else
    {
      BOOL v7 = 0;
    }
  }

  return v7;
}

- (unint64_t)hash
{
  return self->_unavailabilityReason ^ [(NSNumber *)self->_burdenPercentage hash];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  burdenPercentage = self->_burdenPercentage;
  id v5 = a3;
  [v5 encodeObject:burdenPercentage forKey:@"BurdenPercentageKey"];
  [v5 encodeBool:self->_burdenPercentageWasClampedToLowerBound forKey:@"BurdenPercentageWasClampedToLowerBoundKey"];
  [v5 encodeInteger:self->_unavailabilityReason forKey:@"UnavailabilityReasonKey"];
}

- (HKHRAFibBurdenAnalysisResult)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HKHRAFibBurdenAnalysisResult;
  id v5 = [(HKHRAFibBurdenAnalysisResult *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"BurdenPercentageKey"];
    burdenPercentage = v5->_burdenPercentage;
    v5->_burdenPercentage = (NSNumber *)v6;

    v5->_burdenPercentageWasClampedToLowerBound = [v4 decodeBoolForKey:@"BurdenPercentageWasClampedToLowerBoundKey"];
    v5->_unavailabilityReason = [v4 decodeIntegerForKey:@"UnavailabilityReasonKey"];
  }

  return v5;
}

- (NSNumber)burdenPercentage
{
  return self->_burdenPercentage;
}

- (BOOL)burdenPercentageWasClampedToLowerBound
{
  return self->_burdenPercentageWasClampedToLowerBound;
}

- (void)setBurdenPercentageWasClampedToLowerBound:(BOOL)a3
{
  self->_burdenPercentageWasClampedToLowerBound = a3;
}

- (int64_t)unavailabilityReason
{
  return self->_unavailabilityReason;
}

- (void).cxx_destruct
{
}

@end