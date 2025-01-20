@interface HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsNotPresent
+ (id)requirementIdentifier;
- (BOOL)isSatisfiedForValue:(id)a3;
- (id)requirementDescription;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsNotPresent

+ (id)requirementIdentifier
{
  return @"OnboardingUserDefaultsKeyIsNotPresent";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self userDefaultsKey];
  v4 = [v2 stringWithFormat:@"The value of the onboarding user defaults key %@ must be nil", v3];

  return v4;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)[a3 userNotificationSettingsDataSource];
}

- (BOOL)isSatisfiedForValue:(id)a3
{
  return a3 == 0;
}

@end