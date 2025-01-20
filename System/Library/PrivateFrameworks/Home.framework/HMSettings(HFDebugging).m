@interface HMSettings(HFDebugging)
- (id)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMSettings(HFDebugging)

- (id)hf_stateDumpBuilderWithContext:()HFDebugging
{
  v4 = +[HFStateDumpBuilder builderWithObject:a1 context:a3];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1, "isControllable"));
  [v4 setObject:v5 forKeyedSubscript:@"controllable"];

  v6 = [a1 rootGroup];
  [v4 setObject:v6 forKeyedSubscript:@"rootGroup"];

  return v4;
}

@end