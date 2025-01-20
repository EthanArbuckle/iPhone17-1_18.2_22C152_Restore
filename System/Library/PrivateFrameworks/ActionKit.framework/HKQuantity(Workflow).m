@interface HKQuantity(Workflow)
- (void)wf_normalizedDoubleValueForUnit:()Workflow;
@end

@implementation HKQuantity(Workflow)

- (void)wf_normalizedDoubleValueForUnit:()Workflow
{
  v4 = (void *)MEMORY[0x263F0A830];
  id v5 = a3;
  v6 = [v4 unitFromString:@"%"];
  [v5 isEqual:v6];

  [a1 doubleValueForUnit:v5];
}

@end