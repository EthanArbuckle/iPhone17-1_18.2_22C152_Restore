@interface GCDevicePhysicalInputElementDescription(Client)
+ (uint64_t)parametersClass;
- (id)makeParameters;
@end

@implementation GCDevicePhysicalInputElementDescription(Client)

+ (uint64_t)parametersClass
{
  return objc_opt_class();
}

- (id)makeParameters
{
  v13.receiver = a1;
  v13.super_class = (Class)&off_26D2AAA48;
  id v2 = objc_msgSendSuper2(&v13, sel_makeParameters);
  v4 = [a1 identifier];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v3, v4, 8);
  }

  v6 = [a1 aliases];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v5, v6, 16);
  }

  v7 = [a1 localizedName];
  v9 = _GCFConvertStringToLocalizedString();
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v8, v9, 24);
  }

  v11 = [a1 symbol];
  if (v2) {
    objc_setProperty_nonatomic_copy(v2, v10, v11, 32);
  }

  return v2;
}

@end