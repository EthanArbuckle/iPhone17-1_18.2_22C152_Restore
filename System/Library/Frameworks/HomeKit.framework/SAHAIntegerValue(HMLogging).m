@interface SAHAIntegerValue(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAIntegerValue(HMLogging)

- (id)hm_shortDescription
{
  v2 = [MEMORY[0x1E4F28E78] stringWithFormat:@"%@=%d/", *MEMORY[0x1E4F97030], objc_msgSend(a1, "value")];
  v3 = (void *)*MEMORY[0x1E4F96E68];
  v4 = [a1 units];
  appendToShortDescription(v2, v3, v4);

  return v2;
}

@end