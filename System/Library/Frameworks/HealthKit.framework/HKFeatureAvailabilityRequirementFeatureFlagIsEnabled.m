@interface HKFeatureAvailabilityRequirementFeatureFlagIsEnabled
+ (NSString)requirementIdentifier;
- (NSString)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementFeatureFlagIsEnabled

+ (NSString)requirementIdentifier
{
  return (NSString *)@"FeatureFlagEnabled";
}

- (NSString)requirementDescription
{
  return (NSString *)@"A required feature flag must be enabled";
}

@end