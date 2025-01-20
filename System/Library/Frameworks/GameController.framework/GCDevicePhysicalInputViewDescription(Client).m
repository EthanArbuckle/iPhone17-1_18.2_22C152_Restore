@interface GCDevicePhysicalInputViewDescription(Client)
+ (uint64_t)parametersClass;
- (uint64_t)makeParameters;
@end

@implementation GCDevicePhysicalInputViewDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (uint64_t)makeParameters
{
  [(id)objc_opt_class() parametersClass];

  return objc_opt_new();
}

@end