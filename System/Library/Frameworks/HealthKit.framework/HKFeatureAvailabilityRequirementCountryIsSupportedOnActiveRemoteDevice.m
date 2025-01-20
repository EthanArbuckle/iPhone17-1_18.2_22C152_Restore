@interface HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice
+ (id)requirementIdentifier;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementCountryIsSupportedOnActiveRemoteDevice

+ (id)requirementIdentifier
{
  return @"CountryIsSupportedOnActiveRemoteDevice";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"The current or onboarded country for %@ must be supported on the active device", v3];

  return v4;
}

@end