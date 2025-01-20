@interface HKFeatureAvailabilityMustBeTrueRequirement
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (HKFeatureAvailabilityMustBeTrueRequirement)initWithCoder:(id)a3;
- (HKFeatureAvailabilityMustBeTrueRequirement)initWithWhatMustBeTrue:(BOOL)a3;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation HKFeatureAvailabilityMustBeTrueRequirement

- (HKFeatureAvailabilityMustBeTrueRequirement)initWithWhatMustBeTrue:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HKFeatureAvailabilityMustBeTrueRequirement;
  result = [(HKFeatureAvailabilityMustBeTrueRequirement *)&v5 init];
  if (result) {
    result->_isTrue = a3;
  }
  return result;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(NSNumber, "numberWithBool:", self->_isTrue, a4);
}

- (BOOL)isEqual:(id)a3
{
  v4 = (unsigned __int8 *)a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->_isTrue == v4[8];

  return v5;
}

- (unint64_t)hash
{
  return self->_isTrue;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
}

- (HKFeatureAvailabilityMustBeTrueRequirement)initWithCoder:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityMustBeTrueRequirement;
  BOOL v5 = [(HKFeatureAvailabilityMustBeTrueRequirement *)&v7 init];
  if (v5) {
    v5->_isTrue = [v4 decodeBoolForKey:@"IsTrue"];
  }

  return v5;
}

@end