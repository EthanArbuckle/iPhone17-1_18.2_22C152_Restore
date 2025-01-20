@interface GCDevicePhysicalInputCapacitiveButtonElementDescription(Client)
+ (uint64_t)parametersClass;
- (void)makeParameters;
@end

@implementation GCDevicePhysicalInputCapacitiveButtonElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (void)makeParameters
{
  v5.receiver = a1;
  v5.super_class = (Class)&off_26D2AC5F8;
  v2 = objc_msgSendSuper2(&v5, sel_makeParameters);
  uint64_t v3 = [a1 eventTouchedValueField];
  if (v2) {
    v2[8] = v3;
  }
  return v2;
}

@end