@interface HKCountrySet(HearingProtection)
+ (id)localAvailabilityForHearingProtection;
@end

@implementation HKCountrySet(HearingProtection)

+ (id)localAvailabilityForHearingProtection
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26D9E9CB8 compatibilityVersion:1 contentVersion:5 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+HearingProtection.m" lineNumber:42 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end