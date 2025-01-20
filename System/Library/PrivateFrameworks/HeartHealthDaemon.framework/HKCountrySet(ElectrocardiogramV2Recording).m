@interface HKCountrySet(ElectrocardiogramV2Recording)
+ (id)localAvailabilityForElectrocardiogramV2Recording;
@end

@implementation HKCountrySet(ElectrocardiogramV2Recording)

+ (id)localAvailabilityForElectrocardiogramV2Recording
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F2AE70]) initWithCountryBitmasks:&unk_1F2B43178 compatibilityVersion:1 contentVersion:13 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+ElectrocardiogramV2Recording.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }

  return v4;
}

@end