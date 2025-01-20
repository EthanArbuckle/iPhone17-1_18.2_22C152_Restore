@interface HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice
+ (id)requirementIdentifier;
@end

@implementation HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice

void __109___HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice_registerObserver_forDataSource___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  v7 = *(void **)(a1 + 32);
  v6 = (void *)(a1 + 32);
  id v11 = 0;
  v8 = [v7 isSatisfiedWithDataSource:a2 error:&v11];
  id v9 = v11;
  if (v8)
  {
    objc_msgSend(v5, "featureAvailabilityRequirement:didUpdateSatisfaction:", *v6, objc_msgSend(v8, "BOOLValue"));
  }
  else
  {
    _HKInitializeLogging();
    v10 = HKLogInfrastructure();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __109__HKFeatureAvailabilityOnboardingEligibilityObservingRemoteDeviceRequirement_registerObserver_forDataSource___block_invoke_cold_1((uint64_t)v6, (uint64_t)v9, v10);
    }
  }
}

+ (id)requirementIdentifier
{
  return @"CapabilityIsSupportedOnActiveRemoteDevice";
}

@end