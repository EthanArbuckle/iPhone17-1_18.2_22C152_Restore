@interface HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice
+ (id)requirementIdentifier;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice

+ (id)requirementIdentifier
{
  return @"CountryIsSupportedOnLocalDevice";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"The current or onboarded country for %@ must be supported on the local device", v3];

  return v4;
}

@end