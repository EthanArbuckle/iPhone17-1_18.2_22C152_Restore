@interface HKCountrySet(HearingTest)
+ (id)localAvailabilityForHearingTest;
@end

@implementation HKCountrySet(HearingTest)

+ (id)localAvailabilityForHearingTest
{
  v4 = (void *)[objc_alloc(MEMORY[0x263F0A288]) initWithCountryBitmasks:&unk_26D9E9CD0 compatibilityVersion:1 contentVersion:9 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x263F08690] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+HearingTest.m" lineNumber:42 description:@"Local generated country set should never be nil"];
  }
  return v4;
}

@end