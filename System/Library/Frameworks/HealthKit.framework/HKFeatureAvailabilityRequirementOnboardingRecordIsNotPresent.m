@interface HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresent
+ (NSString)requirementIdentifier;
- (NSString)requirementDescription;
- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresent

+ (NSString)requirementIdentifier
{
  return (NSString *)@"OnboardingRecordIsNotPresent";
}

- (NSString)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"No onboarding record must be present for %@", v3];

  return (NSString *)v4;
}

- (id)isSatisfiedWithOnboardingRecord:(id)a3 dataSource:(id)a4 error:(id *)a5
{
  v5 = NSNumber;
  BOOL v6 = [a3 onboardingState] == 1;

  return (id)[v5 numberWithInt:v6];
}

@end