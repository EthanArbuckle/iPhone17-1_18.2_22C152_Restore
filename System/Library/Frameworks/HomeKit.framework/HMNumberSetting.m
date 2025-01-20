@interface HMNumberSetting
- (BOOL)isKindOfClass:(Class)a3;
- (HMNumberSetting)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7 minimumValue:(id)a8 maximumValue:(id)a9 stepValue:(id)a10;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (id)internalValue;
- (id)valueForUpdate:(id)a3;
@end

@implementation HMNumberSetting

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepValue, 0);
  objc_storeStrong((id *)&self->_maximumValue, 0);

  objc_storeStrong((id *)&self->_minimumValue, 0);
}

- (NSNumber)stepValue
{
  return (NSNumber *)objc_getProperty(self, a2, 88, 1);
}

- (NSNumber)maximumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 80, 1);
}

- (NSNumber)minimumValue
{
  return (NSNumber *)objc_getProperty(self, a2, 72, 1);
}

- (id)valueForUpdate:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Value is not of type NSNumber" userInfo:0];
      objc_exception_throw(v6);
    }
  }
  id v4 = [[HMSettingValue alloc] initNumberSettingWithValue:v3];

  return v4;
}

- (id)internalValue
{
  id v3 = [HMSettingValue alloc];
  id v4 = [(HMSetting *)self value];
  id v5 = [(HMSettingValue *)v3 initNumberSettingWithValue:v4];

  return v5;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMNumberSetting;
  return -[HMNumberSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (void)a3;
}

- (HMNumberSetting)initWithIdentifier:(id)a3 name:(id)a4 type:(int64_t)a5 value:(id)a6 properties:(unint64_t)a7 minimumValue:(id)a8 maximumValue:(id)a9 stepValue:(id)a10
{
  id v22 = a8;
  id v21 = a9;
  id v17 = a10;
  v23.receiver = self;
  v23.super_class = (Class)HMNumberSetting;
  v18 = [(HMSetting *)&v23 initWithIdentifier:a3 name:a4 type:a5 value:a6 properties:a7];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_minimumValue, a8);
    objc_storeStrong((id *)&v19->_maximumValue, a9);
    objc_storeStrong((id *)&v19->_stepValue, a10);
  }

  return v19;
}

@end