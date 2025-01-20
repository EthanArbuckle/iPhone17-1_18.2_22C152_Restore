@interface GCDevicePhysicalInputDescription(Client)
+ (uint64_t)facadeParametersClass;
- (uint64_t)makeFacadeParameters;
@end

@implementation GCDevicePhysicalInputDescription(Client)

+ (uint64_t)facadeParametersClass
{
  return objc_opt_class();
}

- (uint64_t)makeFacadeParameters
{
  [(id)objc_opt_class() facadeParametersClass];

  return objc_opt_new();
}

@end