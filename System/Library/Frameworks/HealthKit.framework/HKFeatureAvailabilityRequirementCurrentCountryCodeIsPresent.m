@interface HKFeatureAvailabilityRequirementCurrentCountryCodeIsPresent
+ (id)requirementIdentifier;
- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementCurrentCountryCodeIsPresent

+ (id)requirementIdentifier
{
  return @"CurrentCountryCodeIsPresent";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"A current country code must be present for %@", v3];

  return v4;
}

- (id)isSatisfiedWithDataSource:(id)a3 error:(id *)a4
{
  id v6 = a3;
  v7 = [v6 currentCountryCode];
  v8 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v9 = [v6 onboardingEligibilityForFeatureWithIdentifier:v8 countryCode:v7 error:a4];

  if (v9)
  {
    v10 = [(_HKFeatureAvailabilityRequirementCountryCodeIsPresent *)self isSatisfiedWithOnboardingEligibility:v9 error:a4];
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end