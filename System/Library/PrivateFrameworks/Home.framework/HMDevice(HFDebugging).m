@interface HMDevice(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMDevice(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = (void *)[a3 copyWithOutputStyle:1];
  v5 = +[HFStateDumpBuilder builderWithObject:a1 context:v4];
  v6 = [a1 uniqueIdentifier];
  [v5 appendObject:v6 withName:@"UUID" options:2];

  v7 = [a1 name];
  [v5 setObject:v7 forKeyedSubscript:@"name"];

  objc_msgSend(v5, "appendBool:withName:ifEqualTo:", objc_msgSend(a1, "isCurrentDevice"), @"currentDevice", 1);
  return v5;
}

@end