@interface HMAccessoryNumberSetting(HFAdditions)
- (uint64_t)hf_isBooleanSetting;
@end

@implementation HMAccessoryNumberSetting(HFAdditions)

- (uint64_t)hf_isBooleanSetting
{
  v2 = [a1 maximumValue];
  if ([v2 isEqual:&unk_26C0F7998])
  {
    v3 = [a1 minimumValue];
    if ([v3 isEqual:&unk_26C0F79B0])
    {
      v4 = [a1 stepValue];
      uint64_t v5 = [v4 isEqual:&unk_26C0F7998];
    }
    else
    {
      uint64_t v5 = 0;
    }
  }
  else
  {
    uint64_t v5 = 0;
  }

  return v5;
}

@end