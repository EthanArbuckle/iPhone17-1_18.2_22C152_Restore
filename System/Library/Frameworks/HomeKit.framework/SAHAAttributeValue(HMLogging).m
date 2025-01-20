@interface SAHAAttributeValue(HMLogging)
- (__CFString)hm_shortDescription;
@end

@implementation SAHAAttributeValue(HMLogging)

- (__CFString)hm_shortDescription
{
  v2 = [a1 units];

  if (v2)
  {
    v3 = NSString;
    uint64_t v4 = *MEMORY[0x1E4F96E68];
    v5 = [a1 units];
    [v3 stringWithFormat:@"%@=%@", v4, v5];
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = &stru_1EEE9DD88;
  }

  return v6;
}

@end