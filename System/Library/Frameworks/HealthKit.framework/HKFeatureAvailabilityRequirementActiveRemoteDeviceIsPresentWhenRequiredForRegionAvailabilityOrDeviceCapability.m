@interface HKFeatureAvailabilityRequirementActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability
+ (id)requirementIdentifier;
- (BOOL)isEqual:(id)a3;
- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4;
- (id)requirementDescription;
@end

@implementation HKFeatureAvailabilityRequirementActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability

+ (id)requirementIdentifier
{
  return @"ActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability";
}

- (id)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"An active paired device must be present as determined by %@", v3];

  return v4;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  v4 = NSNumber;
  BOOL v5 = ([a3 ineligibilityReasons] & 2) == 0;

  return (id)[v4 numberWithInt:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)HKFeatureAvailabilityRequirementActiveRemoteDeviceIsPresentWhenRequiredForRegionAvailabilityOrDeviceCapability;
  if ([(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v7 isEqual:v4])
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

@end