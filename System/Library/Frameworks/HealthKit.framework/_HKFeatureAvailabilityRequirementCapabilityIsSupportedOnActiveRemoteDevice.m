@interface _HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice
+ (NSString)requirementIdentifier;
- (NSString)requirementDescription;
- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4;
- (void)registerObserver:(id)a3 forDataSource:(id)a4;
- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4;
@end

@implementation _HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice

+ (NSString)requirementIdentifier
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  [v4 handleFailureInMethod:a2 object:a1 file:@"HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice.m" lineNumber:25 description:@"Subclasses must specify their own requirement identifiers"];

  return (NSString *)@"InvalidRequirement";
}

- (NSString)requirementDescription
{
  v2 = NSString;
  v3 = [(HKFeatureAvailabilityOnboardingEligibilityRequirement *)self featureIdentifier];
  v4 = [v2 stringWithFormat:@"The paired device capability for %@ must be supported", v3];

  return (NSString *)v4;
}

- (id)isSatisfiedWithOnboardingEligibility:(id)a3 error:(id *)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 ineligibilityReasons] & 2;
  uint64_t v6 = v5 | [v4 ineligibilityReasons] & 4;

  v7 = NSNumber;

  return (id)[v7 numberWithInt:v6 == 0];
}

- (void)registerObserver:(id)a3 forDataSource:(id)a4
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __109___HKFeatureAvailabilityRequirementCapabilityIsSupportedOnActiveRemoteDevice_registerObserver_forDataSource___block_invoke;
  v4[3] = &unk_1E58C2150;
  v4[4] = self;
  [a4 registerObserverForDeviceCharacteristicAndPairingChanges:a3 block:v4];
}

- (void)unregisterObserver:(id)a3 fromDataSource:(id)a4
{
}

@end