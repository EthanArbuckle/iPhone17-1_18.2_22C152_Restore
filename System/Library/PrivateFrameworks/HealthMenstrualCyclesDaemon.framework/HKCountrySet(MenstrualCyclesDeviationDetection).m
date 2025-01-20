@interface HKCountrySet(MenstrualCyclesDeviationDetection)
+ (id)localAvailabilityForMenstrualCyclesDeviationDetection;
@end

@implementation HKCountrySet(MenstrualCyclesDeviationDetection)

+ (id)localAvailabilityForMenstrualCyclesDeviationDetection
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26D8EEA70 compatibilityVersion:1 contentVersion:6 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+MenstrualCyclesDeviationDetection.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end