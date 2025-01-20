@interface HMNumberSetting(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMNumberSetting(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = (void *)[a3 copyWithOutputStyle:1];
  v10.receiver = a1;
  v10.super_class = (Class)&off_26C162EA8;
  v5 = objc_msgSendSuper2(&v10, sel_hf_stateDumpBuilderWithContext_, v4);
  if ([v4 detailLevel] == 2)
  {
    v6 = [a1 minimumValue];
    [v5 setObject:v6 forKeyedSubscript:@"min"];

    v7 = [a1 maximumValue];
    [v5 setObject:v7 forKeyedSubscript:@"max"];

    v8 = [a1 stepValue];
    [v5 setObject:v8 forKeyedSubscript:@"step"];
  }
  return v5;
}

@end