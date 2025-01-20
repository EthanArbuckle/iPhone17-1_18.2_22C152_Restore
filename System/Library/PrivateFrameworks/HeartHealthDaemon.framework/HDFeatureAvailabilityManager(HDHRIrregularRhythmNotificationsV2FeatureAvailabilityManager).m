@interface HDFeatureAvailabilityManager(HDHRIrregularRhythmNotificationsV2FeatureAvailabilityManager)
+ (id)hdhr_irregularRhythmNotificationsV2FeatureAvailabilityManagerWithProfile:()HDHRIrregularRhythmNotificationsV2FeatureAvailabilityManager disableAndExpiryProvider:pairedFeaturePropertiesSyncManager:;
@end

@implementation HDFeatureAvailabilityManager(HDHRIrregularRhythmNotificationsV2FeatureAvailabilityManager)

+ (id)hdhr_irregularRhythmNotificationsV2FeatureAvailabilityManagerWithProfile:()HDHRIrregularRhythmNotificationsV2FeatureAvailabilityManager disableAndExpiryProvider:pairedFeaturePropertiesSyncManager:
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  if ([v9 profileType] == 1) {
    [v7 synchronizeLocalProperties];
  }
  id v10 = objc_alloc(MEMORY[0x1E4F65C38]);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2B5E630F-55DE-4122-A36B-5F8F77D1363E"];
  v12 = (void *)MEMORY[0x1E4F29F50];
  v13 = (void *)[v10 initWithAllowedCountriesDataSource:v7 profile:v9 featureCapability:v11 loggingCategory:*MEMORY[0x1E4F29F50]];

  id v14 = objc_alloc(MEMORY[0x1E4F2B028]);
  uint64_t v25 = *MEMORY[0x1E4F29B90];
  uint64_t v15 = *MEMORY[0x1E4F29D70];
  v16 = [MEMORY[0x1E4F2B030] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:*MEMORY[0x1E4F29D70]];
  v24 = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
  v26[0] = v17;
  v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v26 forKeys:&v25 count:1];
  v19 = (void *)[v14 initWithRequirementsByContext:v18];

  id v20 = objc_alloc(MEMORY[0x1E4F65B10]);
  v21 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:@"2B5E630F-55DE-4122-A36B-5F8F77D1363E"];
  v22 = (void *)[v20 initWithProfile:v9 featureIdentifier:v15 availabilityRequirements:v19 currentOnboardingVersion:1 pairedDeviceCapability:v21 pairedFeatureAttributesProvider:v7 regionAvailabilityProvider:v13 disableAndExpiryProvider:v8 loggingCategory:*v12];

  return v22;
}

@end