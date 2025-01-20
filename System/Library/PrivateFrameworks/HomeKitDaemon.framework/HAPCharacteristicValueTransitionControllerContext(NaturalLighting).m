@interface HAPCharacteristicValueTransitionControllerContext(NaturalLighting)
- (BOOL)isNaturalLightingEnabled;
- (HMDNaturalLightingActiveTransitionContext)activeTransitionContext;
@end

@implementation HAPCharacteristicValueTransitionControllerContext(NaturalLighting)

- (HMDNaturalLightingActiveTransitionContext)activeTransitionContext
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  v2 = [a1 identifier];
  if (v2)
  {
    v3 = objc_msgSend(MEMORY[0x263F08C38], "hmf_UUIDWithBytesAsData:", v2);
    v4 = v3;
    if (v3
      && ([v3 UUIDString],
          v5 = objc_claimAutoreleasedReturnValue(),
          int v6 = [v5 isEqualToString:@"C4F33DA9-63C9-4C0F-8B89-6C36A33EEF9E"],
          v5,
          v6))
    {
      v7 = [a1 startTime];
      v8 = [v7 value];

      if (v8)
      {
        v9 = (void *)MEMORY[0x263EFF910];
        [v8 doubleValue];
        v11 = [v9 dateWithTimeIntervalSinceReferenceDate:v10 / 1000.0];
        v12 = [a1 transitionChecksum];
        v13 = [v12 value];

        v14 = [[HMDNaturalLightingActiveTransitionContext alloc] initWithStartDate:v11 millisecondsElapsedSinceStartDate:0 transitionChecksum:v13];
      }
      else
      {
        v15 = (void *)MEMORY[0x230FBD990]();
        v16 = HMFGetOSLogHandle();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v17 = HMFGetLogIdentifier();
          int v19 = 138543618;
          v20 = v17;
          __int16 v21 = 2112;
          v22 = a1;
          _os_log_impl(&dword_22F52A000, v16, OS_LOG_TYPE_ERROR, "%{public}@Start time missing in the controller context %@", (uint8_t *)&v19, 0x16u);
        }
        v14 = 0;
      }
    }
    else
    {
      v14 = 0;
    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)isNaturalLightingEnabled
{
  v1 = [a1 activeTransitionContext];
  BOOL v2 = v1 != 0;

  return v2;
}

@end