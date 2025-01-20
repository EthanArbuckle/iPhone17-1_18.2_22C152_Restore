@interface HDFeatureAvailabilityManager(CardioFitness)
+ (id)_makeRegionAvailabilityProviderWithProfile:()CardioFitness syncManager:;
+ (id)hdhr_makeCardioFitnessFeatureAvailabilityManagerWithProfile:()CardioFitness;
@end

@implementation HDFeatureAvailabilityManager(CardioFitness)

+ (id)hdhr_makeCardioFitnessFeatureAvailabilityManagerWithProfile:()CardioFitness
{
  uint64_t v5 = *MEMORY[0x1E4F29D18];
  v6 = (objc_class *)MEMORY[0x1E4F65B38];
  id v7 = (id)*MEMORY[0x1E4F29F48];
  id v8 = a3;
  id v9 = [v6 alloc];
  v10 = HKHRCardioFitnessAllowedCountrySet();
  v11 = [v8 daemon];
  v12 = (void *)[v9 initWithFeatureIdentifier:v5 defaultCountrySet:v10 healthDaemon:v11];

  id v13 = objc_alloc(MEMORY[0x1E4F65BA8]);
  v14 = HKHRCardioFitnessLocalFeatureAttributes();
  v15 = (void *)[v13 initWithFeatureIdentifier:v5 localFeatureAttributes:v14 localCountrySetAvailabilityProvider:v12];

  [v15 synchronizeLocalProperties];
  v16 = [a1 _makeRegionAvailabilityProviderWithProfile:v8 syncManager:v15];
  id v17 = objc_alloc(MEMORY[0x1E4F65B10]);
  v18 = [MEMORY[0x1E4F67DE0] requirementSet];
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7640DD53-A02B-4C03-AB93-9FA49BCD0AB6"];
  id v20 = objc_alloc_init(MEMORY[0x1E4F65B20]);
  v21 = (void *)[v17 initWithProfile:v8 featureIdentifier:v5 availabilityRequirements:v18 currentOnboardingVersion:1 pairedDeviceCapability:v19 pairedFeatureAttributesProvider:v15 regionAvailabilityProvider:v16 disableAndExpiryProvider:v20 loggingCategory:v7];

  return v21;
}

+ (id)_makeRegionAvailabilityProviderWithProfile:()CardioFitness syncManager:
{
  uint64_t v5 = *MEMORY[0x1E4F79D10];
  v6 = (void *)MEMORY[0x1E4F2B860];
  id v7 = a4;
  id v8 = a3;
  id v9 = [v6 sharedBehavior];
  if ([v9 isAppleWatch]) {
    v10 = 0;
  }
  else {
    v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"7640DD53-A02B-4C03-AB93-9FA49BCD0AB6"];
  }

  id v11 = objc_alloc(MEMORY[0x1E4F65A78]);
  v12 = [v8 daemon];
  id v13 = (void *)MEMORY[0x1E4F29F48];
  v14 = (void *)[v11 initWithDaemon:v12 allowedCountriesDataSource:v7 availableRegionsDevicePropertyName:v5 loggingCategory:*MEMORY[0x1E4F29F48] shouldReturnLocalAvailabilityForNilDeviceRegions:1];

  v15 = (void *)[objc_alloc(MEMORY[0x1E4F65C38]) initWithAllowedCountriesDataSource:v14 profile:v8 featureCapability:v10 loggingCategory:*v13];

  return v15;
}

@end