@interface HMCharacteristicWriteRequest(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMCharacteristicWriteRequest(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26C15E658;
  v2 = objc_msgSendSuper2(&v5, sel_hf_stateDumpBuilderWithContext_);
  v3 = [a1 value];
  [v2 setObject:v3 forKeyedSubscript:@"value"];

  return v2;
}

@end