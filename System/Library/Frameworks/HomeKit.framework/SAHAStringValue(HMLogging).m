@interface SAHAStringValue(HMLogging)
- (id)hm_shortDescription;
@end

@implementation SAHAStringValue(HMLogging)

- (id)hm_shortDescription
{
  v1 = NSString;
  uint64_t v2 = *MEMORY[0x1E4F971C0];
  v3 = [a1 value];
  v4 = [v1 stringWithFormat:@"%@=%@", v2, v3];

  return v4;
}

@end