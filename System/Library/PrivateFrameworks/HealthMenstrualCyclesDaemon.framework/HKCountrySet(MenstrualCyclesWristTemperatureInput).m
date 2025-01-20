@interface HKCountrySet(MenstrualCyclesWristTemperatureInput)
+ (id)localAvailabilityForMenstrualCyclesWristTemperatureInput;
@end

@implementation HKCountrySet(MenstrualCyclesWristTemperatureInput)

+ (id)localAvailabilityForMenstrualCyclesWristTemperatureInput
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26D8EEAA0 compatibilityVersion:1 contentVersion:7 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+MenstrualCyclesWristTemperatureInput.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end