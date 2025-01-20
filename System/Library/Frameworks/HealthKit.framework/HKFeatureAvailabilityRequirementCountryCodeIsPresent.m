@interface HKFeatureAvailabilityRequirementCountryCodeIsPresent
+ (id)requirementIdentifier;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementCountryCodeIsPresent

+ (id)requirementIdentifier
{
  return @"CountryCodeIsPresent";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"A country code must be present for %@", v3];

  return v4;
}

@end