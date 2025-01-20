@interface HMStringSetting
- (BOOL)isKindOfClass:(Class)a3;
- (id)internalValue;
- (id)valueForUpdate:(id)a3;
@end

@implementation HMStringSetting

- (id)valueForUpdate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Value is not of type NSString" userInfo:0];
      objc_exception_throw(v6);
    }
  }
  id v4 = [[HMSettingValue alloc] initStringSettingWithValue:v3];

  return v4;
}

- (id)internalValue
{
  id v3 = [HMSettingValue alloc];
  id v4 = [(HMSetting *)self value];
  id v5 = [(HMSettingValue *)v3 initStringSettingWithValue:v4];

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMStringSetting;
  return -[HMStringSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (void)a3;
}

@end