@interface HDFeatureAvailabilityManager(Hearing)
+ (id)hearingAidFeatureAvailabilityManagerWithProfile:()Hearing;
+ (id)hearingProtectionFeatureAvailabilityManagerWithProfile:()Hearing;
+ (id)hearingTestFeatureAvailabilityManagerWithProfile:()Hearing;
@end

@implementation HDFeatureAvailabilityManager(Hearing)

+ (id)hearingAidFeatureAvailabilityManagerWithProfile:()Hearing
{
  v4 = (void *)*MEMORY[0x263F09758];
  v5 = (void *)MEMORY[0x263F0A3A0];
  id v6 = a3;
  v7 = [v5 hearingAidRequirementSet];
  v8 = [MEMORY[0x263F0A288] localAvailabilityForHearingAid];
  v9 = +[HDFeatureAvailabilityManager hearingFeatureAvailabilityManagerWithProfile:featureIdentifier:availabilityRequirements:defaultCountrySet:](a1, v6, v4, v7, v8);

  return v9;
}

+ (id)hearingProtectionFeatureAvailabilityManagerWithProfile:()Hearing
{
  v4 = (void *)*MEMORY[0x263F09760];
  v5 = (void *)MEMORY[0x263F0A3A0];
  id v6 = a3;
  v7 = [v5 hearingProtectionRequirementSet];
  v8 = [MEMORY[0x263F0A288] localAvailabilityForHearingProtection];
  v9 = +[HDFeatureAvailabilityManager hearingFeatureAvailabilityManagerWithProfile:featureIdentifier:availabilityRequirements:defaultCountrySet:](a1, v6, v4, v7, v8);

  return v9;
}

+ (id)hearingTestFeatureAvailabilityManagerWithProfile:()Hearing
{
  v4 = (void *)*MEMORY[0x263F09768];
  v5 = (void *)MEMORY[0x263F0A3A0];
  id v6 = a3;
  v7 = [v5 hearingTestRequirementSet];
  v8 = [MEMORY[0x263F0A288] localAvailabilityForHearingTest];
  v9 = +[HDFeatureAvailabilityManager hearingFeatureAvailabilityManagerWithProfile:featureIdentifier:availabilityRequirements:defaultCountrySet:](a1, v6, v4, v7, v8);

  return v9;
}

@end