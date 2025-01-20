@interface HMAccessorySelectionSetting(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMAccessorySelectionSetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v13.receiver = a1;
  v13.super_class = (Class)&off_26C1631C0;
  id v4 = a3;
  v5 = objc_msgSendSuper2(&v13, sel_hf_stateDumpBuilderWithContext_, v4);
  uint64_t v6 = objc_msgSend(v4, "detailLevel", v13.receiver, v13.super_class);

  if (v6 == 2)
  {
    v7 = [a1 keyPath];
    int v8 = [v7 isEqualToString:@"root.siri.language"];

    if (v8)
    {
      v9 = NSNumber;
      v10 = [a1 items];
      v11 = objc_msgSend(v9, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      [v5 appendObject:v11 withName:@"language count (too many items to list)"];
    }
    else
    {
      v10 = [a1 items];
      [v5 setObject:v10 forKeyedSubscript:@"items"];
    }
  }
  return v5;
}

@end