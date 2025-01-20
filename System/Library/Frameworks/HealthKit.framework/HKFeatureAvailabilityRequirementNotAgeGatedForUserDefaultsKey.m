@interface HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey
+ (id)requirementIdentifier;
- (BOOL)defaultBoolValueWhenKeyIsMissing;
- (BOOL)isSatisfiedForBoolValue:(BOOL)a3;
- (HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey)initWithUserDefaultsKey:(id)a3;
- (id)requirementDescription;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey

- (HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey)initWithUserDefaultsKey:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)HKFeatureAvailabilityRequirementNotAgeGatedForUserDefaultsKey;
  return [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)&v4 initWithUserDefaultsKey:a3];
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 0;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return !a3;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)[a3 ageGatingDataSource];
}

+ (id)requirementIdentifier
{
  return @"NotAgeGatedForUserDefaultsKey";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self userDefaultsKey];
  objc_super v4 = [v2 stringWithFormat:@"The value of the age gating user defaults key %@ must not be YES", v3];

  return v4;
}

@end