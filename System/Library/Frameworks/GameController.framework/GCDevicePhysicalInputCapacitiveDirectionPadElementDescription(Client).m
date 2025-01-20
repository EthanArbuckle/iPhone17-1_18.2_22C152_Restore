@interface GCDevicePhysicalInputCapacitiveDirectionPadElementDescription(Client)
+ (uint64_t)parametersClass;
- (void)makeParameters;
@end

@implementation GCDevicePhysicalInputCapacitiveDirectionPadElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (void)makeParameters
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_26D2ACEF0;
  v2 = objc_msgSendSuper2(&v8, sel_makeParameters);
  v3 = [a1 touchedSources];
  v5 = +[NSSet setWithArray:v3];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v4, v5, 152);
  }

  uint64_t v6 = [a1 eventTouchedValueField];
  if (v2) {
    v2[20] = v6;
  }
  return v2;
}

@end