@interface HKUnit(Workflow)
+ (id)wf_safeUnitFromString:()Workflow;
@end

@implementation HKUnit(Workflow)

+ (id)wf_safeUnitFromString:()Workflow
{
  id v3 = a3;
  v4 = [MEMORY[0x263F0A830] unitFromString:v3];

  return v4;
}

@end