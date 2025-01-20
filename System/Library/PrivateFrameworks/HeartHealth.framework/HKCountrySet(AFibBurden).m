@interface HKCountrySet(AFibBurden)
+ (id)localAvailabilityForAFibBurden;
@end

@implementation HKCountrySet(AFibBurden)

+ (id)localAvailabilityForAFibBurden
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F2AE70]) initWithCountryBitmasks:&unk_1F3B8B738 compatibilityVersion:1 contentVersion:11 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+AFibBurden.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }

  return v4;
}

@end