@interface HMCharacteristicThresholdRangeEvent(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCharacteristicThresholdRangeEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_26C15E0C8;
  v2 = objc_msgSendSuper2(&v6, sel_hf_stateDumpBuilderWithContext_);
  v3 = [a1 characteristic];
  [v2 setObject:v3 forKeyedSubscript:@"characteristic"];

  v4 = [a1 thresholdRange];
  [v2 setObject:v4 forKeyedSubscript:@"range"];

  return v2;
}

@end