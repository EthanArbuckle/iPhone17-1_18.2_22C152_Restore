@interface HKFHIRPatientResourceComparisonResult
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFHIRPatientResourceComparisonResult)init;
- (HKFHIRPatientResourceComparisonResult)initWithCoder:(id)a3;
- (HKFHIRPatientResourceComparisonResult)initWithOutcome:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)outcome;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFHIRPatientResourceComparisonResult

- (HKFHIRPatientResourceComparisonResult)init
{
  v3 = (void *)MEMORY[0x263EFF940];
  uint64_t v4 = *MEMORY[0x263EFF4A0];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKFHIRPatientResourceComparisonResult)initWithOutcome:(unint64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFHIRPatientResourceComparisonResult;
  result = [(HKFHIRPatientResourceComparisonResult *)&v5 init];
  if (result) {
    result->_outcome = a3;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (HKFHIRPatientResourceComparisonResult *)a3;
  if (self == v4)
  {
    BOOL v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      unint64_t outcome = self->_outcome;
      BOOL v6 = outcome == [(HKFHIRPatientResourceComparisonResult *)v4 outcome];
    }
    else
    {
      BOOL v6 = 0;
    }
  }

  return v6;
}

- (unint64_t)hash
{
  return self->_outcome;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFHIRPatientResourceComparisonResult)initWithCoder:(id)a3
{
  uint64_t v4 = [a3 decodeIntegerForKey:@"outcome"];

  return [(HKFHIRPatientResourceComparisonResult *)self initWithOutcome:v4];
}

- (unint64_t)outcome
{
  return self->_outcome;
}

@end