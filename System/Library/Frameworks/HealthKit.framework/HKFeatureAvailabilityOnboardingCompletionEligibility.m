@interface HKFeatureAvailabilityOnboardingCompletionEligibility
- (HKFeatureAvailabilityOnboardingCompletionEligibility)initWithOnboardingCompletion:(id)a3 onboardingEligibility:(id)a4;
- (HKFeatureAvailabilityOnboardingEligibility)onboardingEligibility;
- (HKOnboardingCompletion)onboardingCompletion;
@end

@implementation HKFeatureAvailabilityOnboardingCompletionEligibility

- (HKFeatureAvailabilityOnboardingCompletionEligibility)initWithOnboardingCompletion:(id)a3 onboardingEligibility:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)HKFeatureAvailabilityOnboardingCompletionEligibility;
  v8 = [(HKFeatureAvailabilityOnboardingCompletionEligibility *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    onboardingCompletion = v8->_onboardingCompletion;
    v8->_onboardingCompletion = (HKOnboardingCompletion *)v9;

    uint64_t v11 = [v7 copy];
    onboardingEligibility = v8->_onboardingEligibility;
    v8->_onboardingEligibility = (HKFeatureAvailabilityOnboardingEligibility *)v11;
  }
  return v8;
}

- (HKOnboardingCompletion)onboardingCompletion
{
  return self->_onboardingCompletion;
}

- (HKFeatureAvailabilityOnboardingEligibility)onboardingEligibility
{
  return self->_onboardingEligibility;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_onboardingEligibility, 0);

  objc_storeStrong((id *)&self->_onboardingCompletion, 0);
}

@end