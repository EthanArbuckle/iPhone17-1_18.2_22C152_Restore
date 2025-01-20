@interface HMDurationEvent(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMDurationEvent(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v6.receiver = a1;
  v6.super_class = (Class)&off_26C15DC10;
  v2 = objc_msgSendSuper2(&v6, sel_hf_stateDumpBuilderWithContext_);
  v3 = NSNumber;
  [a1 duration];
  v4 = objc_msgSend(v3, "numberWithDouble:");
  [v2 setObject:v4 forKeyedSubscript:@"duration"];

  return v2;
}

@end