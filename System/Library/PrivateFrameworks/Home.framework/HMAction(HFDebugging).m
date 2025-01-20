@interface HMAction(HFDebugging)
- (HFStateDumpBuilder)hf_stateDumpBuilderWithContext:()HFDebugging;
@end

@implementation HMAction(HFDebugging)

- (HFStateDumpBuilder)hf_stateDumpBuilderWithContext:()HFDebugging
{
  return +[HFStateDumpBuilder builderWithObject:a1 context:a3];
}

@end