@interface HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsPresent
+ (id)requirementIdentifier;
- (BOOL)isSatisfiedForValue:(id)a3;
- (id)requirementDescription;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingUserDefaultsKeyIsPresent

+ (id)requirementIdentifier
{
  return @"OnboardingUserDefaultsKeyIsPresent";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)self userDefaultsKey];
  v4 = [v2 stringWithFormat:@"The value of the onboarding user defaults key %@ must not be nil", v3];

  return v4;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)[a3 userNotificationSettingsDataSource];
}

- (BOOL)isSatisfiedForValue:(id)a3
{
  return a3 != 0;
}

@end