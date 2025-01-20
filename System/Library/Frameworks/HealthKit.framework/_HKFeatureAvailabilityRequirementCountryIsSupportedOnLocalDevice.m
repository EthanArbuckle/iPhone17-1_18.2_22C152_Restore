@interface _HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice
- (BOOL)isEqual:(id)a3;
- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4;
@end

@implementation _HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  v4 = NSNumber;
  BOOL v5 = ([a3 ineligibilityReasons] & 8) == 0;

  return (id)[v4 numberWithInt:v5];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_HKFeatureAvailabilityRequirementCountryIsSupportedOnLocalDevice;
  if ([(HKFeatureAvailabilityOnboardingEligibilityRequirement *)&v7 isEqual:v4]) {
    char v5 = [v4 isMemberOfClass:objc_opt_class()];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

@end