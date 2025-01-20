@interface HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy
+ (id)requirementIdentifier;
- (BOOL)defaultBoolValueWhenKeyIsMissing;
- (BOOL)isSatisfiedForBoolValue:(BOOL)a3;
- (HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy)init;
- (id)requirementDescription;
- (id)whichUserDefaultsDataSourceInDataSource:(id)a3;
@end

@implementation HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy

- (HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy)init
{
  v3.receiver = self;
  v3.super_class = (Class)HKFeatureAvailabilityRequirementHeartRateIsEnabledInPrivacy;
  return [(HKFeatureAvailabilityRequirementUserDefaultEvaluator *)&v3 initWithUserDefaultsKey:@"EnableHeartRate"];
}

- (BOOL)defaultBoolValueWhenKeyIsMissing
{
  return 1;
}

- (BOOL)isSatisfiedForBoolValue:(BOOL)a3
{
  return a3;
}

- (id)whichUserDefaultsDataSourceInDataSource:(id)a3
{
  return (id)[a3 privacyPreferencesDataSource];
}

+ (id)requirementIdentifier
{
  return @"HeartRateIsEnabledInPrivacy";
}

- (id)requirementDescription
{
  return @"The Heart Rate setting in Privacy must be enabled";
}

@end