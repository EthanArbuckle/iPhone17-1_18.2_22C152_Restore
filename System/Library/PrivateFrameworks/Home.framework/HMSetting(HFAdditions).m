@interface HMSetting(HFAdditions)
+ (id)hf_debugDescriptionForValue:()HFAdditions keyPath:;
- (id)hf_debugValueDescription;
- (uint64_t)hf_isBooleanSetting;
@end

@implementation HMSetting(HFAdditions)

- (uint64_t)hf_isBooleanSetting
{
  return 0;
}

- (id)hf_debugValueDescription
{
  v2 = objc_opt_class();
  v3 = [a1 value];
  v4 = [a1 keyPath];
  v5 = objc_msgSend(v2, "hf_debugDescriptionForValue:keyPath:", v3, v4);

  return v5;
}

+ (id)hf_debugDescriptionForValue:()HFAdditions keyPath:
{
  id v5 = a3;
  if ([a4 isEqualToString:@"root.mobileTimer.alarms"])
  {
    objc_opt_class();
    id v6 = v5;
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    v9 = objc_msgSend(v8, "na_map:", &__block_literal_global_204);
    v10 = [v9 description];
  }
  else
  {
    v10 = [v5 description];
  }

  return v10;
}

@end