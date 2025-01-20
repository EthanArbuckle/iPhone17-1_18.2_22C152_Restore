@interface HKCountrySet(GlucoseEnhancedCharting)
+ (id)localAvailabilityForGlucoseEnhancedCharting;
@end

@implementation HKCountrySet(GlucoseEnhancedCharting)

+ (id)localAvailabilityForGlucoseEnhancedCharting
{
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F2AE70]) initWithCountryBitmasks:&unk_1F17E94B0 compatibilityVersion:1 contentVersion:1 provenance:3];
  if (!v4)
  {
    v6 = [MEMORY[0x1E4F28B00] currentHandler];
    [v6 handleFailureInMethod:a2 object:a1 file:@"HKCountrySet+GlucoseEnhancedCharting.m" lineNumber:40 description:@"Local generated country set should never be nil"];
  }

  return v4;
}

@end