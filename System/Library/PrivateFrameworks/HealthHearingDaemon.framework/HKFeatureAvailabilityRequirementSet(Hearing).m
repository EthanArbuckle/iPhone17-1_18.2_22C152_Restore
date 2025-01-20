@interface HKFeatureAvailabilityRequirementSet(Hearing)
+ (id)hearingAidRequirementSet;
+ (id)hearingProtectionRequirementSet;
+ (id)hearingTestRequirementSet;
@end

@implementation HKFeatureAvailabilityRequirementSet(Hearing)

+ (id)hearingAidRequirementSet
{
  v18[5] = *MEMORY[0x263EF8340];
  v0 = (void *)*MEMORY[0x263F09758];
  id v1 = objc_alloc(MEMORY[0x263F0A3A0]);
  v17[0] = *MEMORY[0x263F09580];
  v15 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v0];
  v16[0] = v15;
  v2 = (void *)MEMORY[0x263F0A3A8];
  v14 = [MEMORY[0x263F0A980] sharedBehavior];
  v3 = [v14 features];
  v4 = objc_msgSend(v2, "featureFlagIsEnabled:", objc_msgSend(v3, "yodel"));
  v16[1] = v4;
  v5 = [MEMORY[0x263F0A3A8] hearingFeatureHardwareRequirementsForFeatureIdentifier:v0];
  v16[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v18[0] = v6;
  v17[1] = *MEMORY[0x263F09578];
  v7 = +[HKFeatureAvailabilityRequirementSet advertisableFeatureRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[1] = v7;
  v17[2] = *MEMORY[0x263F095D0];
  v8 = +[HKFeatureAvailabilityRequirementSet settingsVisibilityRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[2] = v8;
  v17[3] = *MEMORY[0x263F095C8];
  v9 = +[HKFeatureAvailabilityRequirementSet settingsUserInteractionEnabledRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[3] = v9;
  v17[4] = *MEMORY[0x263F09600];
  v10 = +[HKFeatureAvailabilityRequirementSet usageRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[4] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  v12 = (void *)[v1 initWithRequirementsByContext:v11];

  return v12;
}

+ (id)hearingProtectionRequirementSet
{
  v18[5] = *MEMORY[0x263EF8340];
  v0 = (void *)*MEMORY[0x263F09760];
  id v1 = objc_alloc(MEMORY[0x263F0A3A0]);
  v17[0] = *MEMORY[0x263F09580];
  v15 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v0];
  v16[0] = v15;
  v2 = (void *)MEMORY[0x263F0A3A8];
  v14 = [MEMORY[0x263F0A980] sharedBehavior];
  v3 = [v14 features];
  v4 = objc_msgSend(v2, "featureFlagIsEnabled:", objc_msgSend(v3, "yodel"));
  v16[1] = v4;
  v5 = [MEMORY[0x263F0A3A8] hearingFeatureHardwareRequirementsForFeatureIdentifier:v0];
  v16[2] = v5;
  v6 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:3];
  v18[0] = v6;
  v17[1] = *MEMORY[0x263F09578];
  v7 = +[HKFeatureAvailabilityRequirementSet advertisableFeatureRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[1] = v7;
  v17[2] = *MEMORY[0x263F095D0];
  v8 = +[HKFeatureAvailabilityRequirementSet settingsVisibilityRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[2] = v8;
  v17[3] = *MEMORY[0x263F095C8];
  v9 = +[HKFeatureAvailabilityRequirementSet settingsUserInteractionEnabledRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[3] = v9;
  v17[4] = *MEMORY[0x263F09600];
  v10 = +[HKFeatureAvailabilityRequirementSet usageRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[4] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:5];
  v12 = (void *)[v1 initWithRequirementsByContext:v11];

  return v12;
}

+ (id)hearingTestRequirementSet
{
  void v18[6] = *MEMORY[0x263EF8340];
  v0 = (void *)*MEMORY[0x263F09768];
  id v1 = objc_alloc(MEMORY[0x263F0A3A0]);
  v17[0] = *MEMORY[0x263F09580];
  v15 = [MEMORY[0x263F0A3A8] defaultOnboardingEligibilityRequirementsForFeatureIdentifier:v0];
  v16[0] = v15;
  v2 = (void *)MEMORY[0x263F0A3A8];
  v14 = [MEMORY[0x263F0A980] sharedBehavior];
  v3 = [v14 features];
  v4 = objc_msgSend(v2, "featureFlagIsEnabled:", objc_msgSend(v3, "yodel"));
  v16[1] = v4;
  v5 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:2];
  v18[0] = v5;
  v17[1] = *MEMORY[0x263F09578];
  v6 = +[HKFeatureAvailabilityRequirementSet advertisableFeatureRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[1] = v6;
  v17[2] = *MEMORY[0x263F095D0];
  v7 = +[HKFeatureAvailabilityRequirementSet settingsVisibilityRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[2] = v7;
  v17[3] = *MEMORY[0x263F095C8];
  v8 = +[HKFeatureAvailabilityRequirementSet settingsUserInteractionEnabledRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[3] = v8;
  v17[4] = *MEMORY[0x263F09600];
  v9 = +[HKFeatureAvailabilityRequirementSet usageRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[4] = v9;
  void v17[5] = *MEMORY[0x263F44948];
  v10 = +[HKFeatureAvailabilityRequirementSet promptTileRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v0);
  v18[5] = v10;
  v11 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:6];
  v12 = (void *)[v1 initWithRequirementsByContext:v11];

  return v12;
}

@end