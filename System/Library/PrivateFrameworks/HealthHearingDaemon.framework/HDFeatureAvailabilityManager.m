@interface HDFeatureAvailabilityManager
+ (id)hearingFeatureAvailabilityManagerWithProfile:(void *)a3 featureIdentifier:(void *)a4 availabilityRequirements:(void *)a5 defaultCountrySet:;
@end

@implementation HDFeatureAvailabilityManager

+ (id)hearingFeatureAvailabilityManagerWithProfile:(void *)a3 featureIdentifier:(void *)a4 availabilityRequirements:(void *)a5 defaultCountrySet:
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = a2;
  self;
  v23 = _HKHearingTestAlgorithmVersionString();
  v12 = [MEMORY[0x263F0A380] featureAttributesDerivedFromOSBuildAndFeatureVersion:v23 deviceIdentifier:@"(01)00195949149948"];
  v13 = (void *)[objc_alloc(MEMORY[0x263F43230]) initWithLocalFeatureAttributes:v12];
  id v14 = objc_alloc(MEMORY[0x263F431E8]);
  id v15 = objc_alloc(MEMORY[0x263F43228]);
  v16 = [v11 daemon];
  v17 = (void *)[v15 initWithFeatureIdentifier:v10 defaultCountrySet:v8 healthDaemon:v16];

  id v18 = objc_alloc(MEMORY[0x263F432A8]);
  v19 = [v11 daemon];
  v20 = (void *)[v18 initWithDaemon:v19 featureIdentifier:v10];
  v21 = (void *)[v14 initWithProfile:v11 featureIdentifier:v10 availabilityRequirements:v9 currentOnboardingVersion:1 pairedDeviceCapability:0 pairedFeatureAttributesProvider:v13 regionAvailabilityProvider:v17 disableAndExpiryProvider:v20 loggingCategory:*MEMORY[0x263F09910]];

  return v21;
}

@end