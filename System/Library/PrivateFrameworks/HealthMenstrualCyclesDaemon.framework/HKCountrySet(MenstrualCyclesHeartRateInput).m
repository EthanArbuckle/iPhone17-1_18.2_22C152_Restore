@interface HKCountrySet(MenstrualCyclesHeartRateInput)
+ (id)localAvailabilityForMenstrualCyclesHeartRateInput;
@end

@implementation HKCountrySet(MenstrualCyclesHeartRateInput)

+ (id)localAvailabilityForMenstrualCyclesHeartRateInput
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26D8EEAB8 compatibilityVersion:1 contentVersion:7 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+MenstrualCyclesHeartRateInput.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end