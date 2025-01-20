@interface HMCharacteristicWriteAction(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCharacteristicWriteAction(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = (void *)[a3 copyWithOutputStyle:1];
  v10.receiver = a1;
  v10.super_class = (Class)&off_26C15B9F0;
  v5 = objc_msgSendSuper2(&v10, sel_hf_stateDumpBuilderWithContext_, v4);
  v6 = [a1 characteristic];
  v7 = (void *)[v4 copyWithDetailLevel:0];
  [v5 appendObject:v6 withName:@"characteristic" context:v7];

  v8 = [a1 targetValue];
  [v5 setObject:v8 forKeyedSubscript:@"value"];

  return v5;
}

@end