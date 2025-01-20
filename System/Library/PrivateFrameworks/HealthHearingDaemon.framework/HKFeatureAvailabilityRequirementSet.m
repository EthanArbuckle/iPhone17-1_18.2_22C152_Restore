@interface HKFeatureAvailabilityRequirementSet
+ (id)advertisableFeatureRequirementsForIdentifier:(uint64_t)a1;
+ (id)promptTileRequirementsForIdentifier:(uint64_t)a1;
+ (id)settingsUserInteractionEnabledRequirementsForIdentifier:(uint64_t)a1;
+ (id)settingsVisibilityRequirementsForIdentifier:(uint64_t)a1;
+ (id)usageRequirementsForIdentifier:(uint64_t)a1;
@end

@implementation HKFeatureAvailabilityRequirementSet

+ (id)advertisableFeatureRequirementsForIdentifier:(uint64_t)a1
{
  v12[4] = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  v3 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v12[0] = v3;
  v4 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v12[1] = v4;
  v5 = [MEMORY[0x263F0A3A8] seedIsNotExpiredForFeatureWithIdentifier:v2];

  v12[2] = v5;
  v6 = (void *)MEMORY[0x263F0A3A8];
  v7 = [MEMORY[0x263F0A980] sharedBehavior];
  v8 = [v7 features];
  v9 = objc_msgSend(v6, "featureFlagIsEnabled:", objc_msgSend(v8, "yodel"));
  v12[3] = v9;
  v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v12 count:4];

  return v10;
}

+ (id)settingsVisibilityRequirementsForIdentifier:(uint64_t)a1
{
  v10[2] = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  v3 = (void *)MEMORY[0x263F0A3A8];
  v4 = [MEMORY[0x263F0A980] sharedBehavior];
  v5 = [v4 features];
  v6 = objc_msgSend(v3, "featureFlagIsEnabled:", objc_msgSend(v5, "yodel"));
  v10[0] = v6;
  v7 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];

  v10[1] = v7;
  v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v10 count:2];

  return v8;
}

+ (id)settingsUserInteractionEnabledRequirementsForIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = +[HKFeatureAvailabilityRequirementSet usageRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v2);

  return v3;
}

+ (id)usageRequirementsForIdentifier:(uint64_t)a1
{
  v14[6] = *MEMORY[0x263EF8340];
  id v2 = a2;
  self;
  v3 = [MEMORY[0x263F0A3A8] onboardingRecordIsPresentForFeatureWithIdentifier:v2];
  v14[0] = v3;
  v4 = [MEMORY[0x263F0A3A8] countryIsSupportedOnLocalDeviceForFeatureWithIdentifier:v2];
  v14[1] = v4;
  v5 = [MEMORY[0x263F0A3A8] featureIsNotRemotelyDisabledWithIdentifier:v2];
  v14[2] = v5;
  v6 = [MEMORY[0x263F0A3A8] seedIsNotExpiredForFeatureWithIdentifier:v2];
  v14[3] = v6;
  v7 = (void *)MEMORY[0x263F0A3A8];
  v8 = [MEMORY[0x263F0A980] sharedBehavior];
  v9 = [v8 features];
  v10 = objc_msgSend(v7, "featureFlagIsEnabled:", objc_msgSend(v9, "yodel"));
  v14[4] = v10;
  v11 = [MEMORY[0x263F0A3A8] hearingFeatureHardwareRequirementsForFeatureIdentifier:v2];

  v14[5] = v11;
  v12 = [MEMORY[0x263EFF8C0] arrayWithObjects:v14 count:6];

  return v12;
}

+ (id)promptTileRequirementsForIdentifier:(uint64_t)a1
{
  id v2 = a2;
  self;
  v3 = +[HKFeatureAvailabilityRequirementSet usageRequirementsForIdentifier:](MEMORY[0x263F0A3A0], v2);

  v4 = (void *)[v3 mutableCopy];
  v5 = [MEMORY[0x263F0A3A8] userDefaultsKeyIsNotPresent:*MEMORY[0x263F09838]];
  [v4 addObject:v5];

  return v4;
}

@end