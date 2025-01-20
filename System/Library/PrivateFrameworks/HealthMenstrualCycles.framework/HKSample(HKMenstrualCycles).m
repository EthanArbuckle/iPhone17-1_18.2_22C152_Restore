@interface HKSample(HKMenstrualCycles)
+ (id)hkmc_defaultMetadata;
- (uint64_t)hkmc_isCycleFactorSample;
- (uint64_t)hkmc_isNotPresentSymptom;
- (uint64_t)hkmc_isSleepDependentSample;
- (uint64_t)hkmc_wasEnteredFromCycleTracking;
@end

@implementation HKSample(HKMenstrualCycles)

- (uint64_t)hkmc_isNotPresentSymptom
{
  v2 = [a1 sampleType];
  uint64_t v3 = [v2 code];

  if ((unint64_t)(v3 - 157) <= 0xE)
  {
    if (((1 << (v3 + 99)) & 0x4F7F) == 0)
    {
      v4 = a1;
      goto LABEL_6;
    }
LABEL_5:
    v4 = a1;
LABEL_6:
    uint64_t result = [v4 value];
    if (result == 1) {
      return result;
    }
    return 0;
  }
  if ((unint64_t)(v3 - 229) < 7) {
    goto LABEL_5;
  }
  return 0;
}

- (uint64_t)hkmc_isSleepDependentSample
{
  v1 = [a1 sampleType];
  v2 = [v1 identifier];
  uint64_t v3 = [v2 isEqualToString:*MEMORY[0x263F09BE0]];

  return v3;
}

- (uint64_t)hkmc_isCycleFactorSample
{
  v2 = [a1 sampleType];
  uint64_t v3 = [v2 identifier];
  if ([v3 isEqualToString:*MEMORY[0x263F09348]])
  {
    uint64_t v4 = 1;
  }
  else
  {
    v5 = [a1 sampleType];
    v6 = [v5 identifier];
    if ([v6 isEqualToString:*MEMORY[0x263F093C0]])
    {
      uint64_t v4 = 1;
    }
    else
    {
      v7 = [a1 sampleType];
      v8 = [v7 identifier];
      uint64_t v4 = [v8 isEqualToString:*MEMORY[0x263F09298]];
    }
  }

  return v4;
}

- (uint64_t)hkmc_wasEnteredFromCycleTracking
{
  v1 = [a1 metadata];
  v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F0ABC0]];
  uint64_t v3 = [v2 BOOLValue];

  return v3;
}

+ (id)hkmc_defaultMetadata
{
  v4[2] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F0ABC0];
  v3[0] = *MEMORY[0x263F09B10];
  v3[1] = v0;
  v4[0] = MEMORY[0x263EFFA88];
  v4[1] = MEMORY[0x263EFFA88];
  v1 = [NSDictionary dictionaryWithObjects:v4 forKeys:v3 count:2];
  return v1;
}

@end