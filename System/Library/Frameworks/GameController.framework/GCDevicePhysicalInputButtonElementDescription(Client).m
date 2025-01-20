@interface GCDevicePhysicalInputButtonElementDescription(Client)
+ (uint64_t)parametersClass;
- (id)makeParameters;
@end

@implementation GCDevicePhysicalInputButtonElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_26D2AC4F0;
  id v2 = objc_msgSendSuper2(&v9, sel_makeParameters);
  v3 = [a1 sources];
  v5 = +[NSSet setWithArray:v3];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v4, v5, 48);
  }

  char v6 = [a1 isAnalog];
  if (v2)
  {
    *((unsigned char *)v2 + 40) = v6;
    [a1 pressedThreshold];
    *((_DWORD *)v2 + 11) = v7;
    *((void *)v2 + 7) = [a1 eventPressedValueField];
  }
  else
  {
    [a1 pressedThreshold];
    [a1 eventPressedValueField];
  }
  return v2;
}

@end