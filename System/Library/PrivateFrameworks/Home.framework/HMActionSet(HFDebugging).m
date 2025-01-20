@interface HMActionSet(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMActionSet(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  id v4 = a3;
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = [a1 name];
  [v5 setObject:v7 forKeyedSubscript:@"name"];

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "hf_isAnonymous"), @"triggerOwned", 1);
  uint64_t v8 = [v4 detailLevel];

  if (v8 == 2)
  {
    v9 = [a1 actions];
    [v5 setObject:v9 forKeyedSubscript:@"actions"];
  }
  return v5;
}

@end