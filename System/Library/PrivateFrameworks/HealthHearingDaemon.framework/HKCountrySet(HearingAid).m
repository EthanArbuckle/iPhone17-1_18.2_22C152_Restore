@interface HKCountrySet(HearingAid)
+ (id)localAvailabilityForHearingAid;
@end

@implementation HKCountrySet(HearingAid)

+ (id)localAvailabilityForHearingAid
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26D9E9CE8 compatibilityVersion:1 contentVersion:6 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+HearingAid.m" lineNumber:42 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end