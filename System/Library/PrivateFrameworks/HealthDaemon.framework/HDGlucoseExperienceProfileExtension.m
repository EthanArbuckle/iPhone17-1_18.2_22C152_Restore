@interface HDGlucoseExperienceProfileExtension
- (HDGlucoseExperienceProfileExtension)initWithProfile:(id)a3;
- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3;
@end

@implementation HDGlucoseExperienceProfileExtension

- (HDGlucoseExperienceProfileExtension)initWithProfile:(id)a3
{
  v34[1] = *MEMORY[0x1E4F143B8];
  v4 = (void *)*MEMORY[0x1E4F29D40];
  id v5 = a3;
  v6 = HKLogInfrastructure();
  id v7 = v5;
  id v8 = v4;
  id v9 = v6;
  if (self)
  {
    v31.receiver = self;
    v31.super_class = (Class)HDGlucoseExperienceProfileExtension;
    v10 = [(HDGlucoseExperienceProfileExtension *)&v31 init];
    self = v10;
    if (v10)
    {
      objc_storeStrong((id *)&v10->_featureIdentifier, v4);
      v11 = [v7 daemon];
      v12 = [v11 behavior];
      char v13 = [v12 isAppleWatch];

      if ((v13 & 1) == 0)
      {
        v14 = [HDOTAFeatureDisableAndExpiryProvider alloc];
        v15 = [v7 daemon];
        v16 = [(HDOTAFeatureDisableAndExpiryProvider *)v14 initWithDaemon:v15 featureIdentifier:v8];

        v17 = [HDLocalCountrySetAvailabilityProvider alloc];
        v18 = [MEMORY[0x1E4F2AE70] localAvailabilityForGlucoseEnhancedCharting];
        v19 = [v7 daemon];
        v20 = [(HDLocalCountrySetAvailabilityProvider *)v17 initWithFeatureIdentifier:v8 defaultCountrySet:v18 healthDaemon:v19];

        id v21 = objc_alloc(MEMORY[0x1E4F2B028]);
        uint64_t v33 = *MEMORY[0x1E4F29B90];
        v22 = [MEMORY[0x1E4F2B030] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v8];
        v32 = v22;
        v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
        v34[0] = v23;
        v24 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v34 forKeys:&v33 count:1];
        v25 = (void *)[v21 initWithRequirementsByContext:v24];

        v26 = [[HDFeatureAvailabilityManager alloc] initWithProfile:v7 featureIdentifier:v8 availabilityRequirements:v25 currentOnboardingVersion:1 pairedDeviceCapability:0 regionAvailabilityProvider:v20 disableAndExpiryProvider:v16 loggingCategory:v9];
        featureAvailabilityManager = self->_featureAvailabilityManager;
        self->_featureAvailabilityManager = v26;

        v28 = [[HDBackgroundFeatureDeliveryManager alloc] initWithProfile:v7 featureAvailabilityExtension:self->_featureAvailabilityManager loggingCategory:v9];
        featureDeliveryManager = self->_featureDeliveryManager;
        self->_featureDeliveryManager = v28;
      }
    }
  }

  return self;
}

- (id)featureAvailabilityExtensionForFeatureIdentifier:(id)a3
{
  if ([a3 isEqualToString:self->_featureIdentifier]) {
    v4 = self->_featureAvailabilityManager;
  }
  else {
    v4 = 0;
  }

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureIdentifier, 0);
  objc_storeStrong((id *)&self->_featureDeliveryManager, 0);

  objc_storeStrong((id *)&self->_featureAvailabilityManager, 0);
}

@end