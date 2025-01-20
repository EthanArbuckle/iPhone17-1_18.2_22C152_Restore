@interface SAHABooleanValue(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHABooleanValue(HMLogging)

- (id)hm_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] string];
  v3 = (void *)*MEMORY[0x1E4F96E70];
  [a1 value];
  v4 = HMFBooleanToString();
  appendToShortDescription(v2, v3, v4);

  return v2;
}

@end