@interface HMSelectionSetting(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMSelectionSetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_26C1632F0;
  id v4 = a3;
  v5 = objc_msgSendSuper2(&v9, sel_hf_stateDumpBuilderWithContext_, v4);
  uint64_t v6 = objc_msgSend(v4, "detailLevel", v9.receiver, v9.super_class);

  if (v6 == 2)
  {
    v7 = [a1 items];
    [v5 setObject:v7 forKeyedSubscript:@"items"];
  }
  return v5;
}

@end