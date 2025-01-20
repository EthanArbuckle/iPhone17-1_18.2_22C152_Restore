@interface SAHAFloatValue(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAFloatValue(HMLogging)

- (id)hm_shortDescription
{
  v2 = (void *)MEMORY[0x1E4F28E78];
  uint64_t v3 = *MEMORY[0x1E4F97008];
  [a1 value];
  v5 = [v2 stringWithFormat:@"%@=%f/", v3, v4];
  v6 = (void *)*MEMORY[0x1E4F96E68];
  v7 = [a1 units];
  appendToShortDescription(v5, v6, v7);

  return v5;
}

@end