@interface HKFeatureAvailabilityRequirements(Hearing)
+ (id)hearingFeatureHardwareRequirementsForFeatureIdentifier:()Hearing;
@end

@implementation HKFeatureAvailabilityRequirements(Hearing)

+ (id)hearingFeatureHardwareRequirementsForFeatureIdentifier:()Hearing
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a3;
  v4 = [MEMORY[0x263F0A980] sharedBehavior];
  v5 = [v4 features];
  int v6 = [v5 yodel];

  if (v6)
  {
    if ([v3 isEqualToString:*MEMORY[0x263F09758]])
    {
      v7 = [MEMORY[0x263F0A3A8] hearingAidCapabilityIsSupportedOnAnyPairedAirPods];
      v13 = v7;
      v8 = &v13;
LABEL_8:
      v9 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObjects:count:", v8, 1, v11, v12, v13, v14);

      goto LABEL_10;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F09760]])
    {
      v7 = [MEMORY[0x263F0A3A8] hearingAidCapabilityIsSupportedOnAnyPairedAirPods];
      v12 = v7;
      v8 = &v12;
      goto LABEL_8;
    }
    if ([v3 isEqualToString:*MEMORY[0x263F09768]])
    {
      v7 = [MEMORY[0x263F0A3A8] hearingTestCapabilityIsSupportedOnAnyPairedAirPods];
      v11 = v7;
      v8 = &v11;
      goto LABEL_8;
    }
  }
  v9 = (void *)MEMORY[0x263EFFA68];
LABEL_10:

  return v9;
}

@end