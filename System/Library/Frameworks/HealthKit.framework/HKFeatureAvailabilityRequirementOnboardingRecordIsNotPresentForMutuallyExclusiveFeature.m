@interface HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature
+ (NSString)requirementIdentifier;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature

+ (NSString)requirementIdentifier
{
  return (NSString *)@"OnboardingRecordIsNotPresentForMutuallyExclusiveFeature";
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  id v7 = a4;
  id v8 = a3;
  v9 = [v7 featureAvailabilityProvidingDataSource];
  v10 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __122__HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature_registerObserver_forDataSource___block_invoke;
  v12[3] = &unk_1E58BF320;
  id v13 = v7;
  SEL v14 = a2;
  v12[4] = self;
  id v11 = v7;
  [v9 registerObserver:v8 forKey:v10 newValueHandler:v12];
}

void __122__HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature_registerObserver_forDataSource___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  if (!v5)
  {
    id v7 = [MEMORY[0x1E4F28B00] currentHandler];
    [v7 handleFailureInMethod:*(void *)(a1 + 48), *(void *)(a1 + 32), @"HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature.m", 29, @"[%@] Onboarding record should never be nil", objc_opt_class() object file lineNumber description];
  }
  v6 = [*(id *)(a1 + 32) isSatisfiedWithOnboardingRecord:v5 dataSource:*(void *)(a1 + 40) error:0];
  if (!v6)
  {
    id v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 32) file:@"HKFeatureAvailabilityRequirementOnboardingRecordIsNotPresentForMutuallyExclusiveFeature.m" lineNumber:33 description:@"Checking satisfaction using known onboarding record should never fail"];
  }
  objc_msgSend(v9, "featureAvailabilityRequirement:didUpdateSatisfaction:", *(void *)(a1 + 32), objc_msgSend(v6, "BOOLValue"));
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
  id v6 = a3;
  id v8 = [a4 featureAvailabilityProvidingDataSource];
  id v7 = [(HKFeatureAvailabilityOnboardingRecordRequirement *)self featureIdentifier];
  [v8 unregisterObserver:v6 forKey:v7];
}

@end