@interface GCDevicePhysicalInputSwitchElementDescription(Client)
+ (uint64_t)parametersClass;
- (id)makeParameters;
@end

@implementation GCDevicePhysicalInputSwitchElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  v9.receiver = a1;
  v9.super_class = (Class)&off_26D2AAD50;
  id v2 = objc_msgSendSuper2(&v9, sel_makeParameters);
  v3 = [a1 sources];
  v5 = +[NSSet setWithArray:v3];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v4, v5, 48);
  }

  char v6 = [a1 isSequential];
  if (v2)
  {
    *((unsigned char *)v2 + 40) = v6;
    *((unsigned char *)v2 + 41) = [a1 canWrap];
    *((void *)v2 + 8) = [a1 positionRange];
    *((void *)v2 + 9) = v7;
    *((void *)v2 + 7) = [a1 eventPositionField];
  }
  else
  {
    [a1 canWrap];
    [a1 positionRange];
    [a1 eventPositionField];
  }
  return v2;
}

@end