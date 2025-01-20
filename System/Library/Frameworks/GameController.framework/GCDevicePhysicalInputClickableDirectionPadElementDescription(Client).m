@interface GCDevicePhysicalInputClickableDirectionPadElementDescription(Client)
+ (uint64_t)parametersClass;
- (void)makeParameters;
@end

@implementation GCDevicePhysicalInputClickableDirectionPadElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (void)makeParameters
{
  v8.receiver = a1;
  v8.super_class = (Class)&off_26D2AB6D0;
  v2 = objc_msgSendSuper2(&v8, sel_makeParameters);
  v3 = [a1 pressedSources];
  v5 = +[NSSet setWithArray:v3];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v4, v5, 136);
  }

  uint64_t v6 = [a1 eventPressedValueField];
  if (v2) {
    v2[18] = v6;
  }
  return v2;
}

@end