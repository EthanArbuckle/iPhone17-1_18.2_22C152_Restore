@interface HMAccessoryNumberSetting
- (Class)valueClass;
- (HMAccessoryNumberSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5;
- (HMAccessoryNumberSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 stepValue:(id)a8;
- (NSNumber)maximumValue;
- (NSNumber)minimumValue;
- (NSNumber)stepValue;
- (void)updateValue:(id)a3;
@end

@implementation HMAccessoryNumberSetting

- (NSNumber)stepValue
{
  v2 = [(HMAccessorySetting *)self internal];
  v3 = [v2 constraintWithType:3];
  v4 = [v3 value];

  return (NSNumber *)v4;
}

- (NSNumber)maximumValue
{
  v2 = [(HMAccessorySetting *)self internal];
  v3 = [v2 constraintWithType:2];
  v4 = [v3 value];

  return (NSNumber *)v4;
}

- (NSNumber)minimumValue
{
  v2 = [(HMAccessorySetting *)self internal];
  v3 = [v2 constraintWithType:1];
  v4 = [v3 value];

  return (NSNumber *)v4;
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (void)updateValue:(id)a3
{
  id v4 = a3;
  v5 = [(HMAccessorySetting *)self internal];
  [v5 setValue:v4];

  id v6 = [(HMAccessorySetting *)self internal];
  [(HMAccessorySetting *)self _settingDidUpdateValue:v6];
}

- (HMAccessoryNumberSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5 minimumValue:(id)a6 maximumValue:(id)a7 stepValue:(id)a8
{
  id v14 = a6;
  id v15 = a7;
  id v16 = a8;
  v17 = (void *)MEMORY[0x1E4F1CA48];
  id v18 = a5;
  id v19 = a3;
  v20 = [v17 arrayWithCapacity:2];
  if (v14)
  {
    v21 = [[HMAccessorySettingConstraint alloc] initWithType:1 value:v14];
    [v20 addObject:v21];
  }
  if (v15)
  {
    v22 = [[HMAccessorySettingConstraint alloc] initWithType:2 value:v15];
    [v20 addObject:v22];
  }
  if (v16)
  {
    v23 = [[HMAccessorySettingConstraint alloc] initWithType:3 value:v16];
    [v20 addObject:v23];
  }
  v24 = [[_HMAccessorySetting alloc] initWithType:2 properties:a4 name:v19 constraints:v20];

  [(_HMAccessorySetting *)v24 setValue:v18];
  v25 = [(HMAccessorySetting *)self initWithInternal:v24];

  return v25;
}

- (HMAccessoryNumberSetting)initWithKey:(id)a3 properties:(unint64_t)a4 value:(id)a5
{
  return [(HMAccessoryNumberSetting *)self initWithKey:a3 properties:a4 value:a5 minimumValue:0 maximumValue:0 stepValue:0];
}

@end