@interface HMDCoreDataTransformerHMDTriggerEventCondition
+ (id)allowedTopLevelClasses;
@end

@implementation HMDCoreDataTransformerHMDTriggerEventCondition

+ (id)allowedTopLevelClasses
{
  v4[2] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:2];
  return v2;
}

@end