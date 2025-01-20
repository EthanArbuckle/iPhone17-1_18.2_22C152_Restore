@interface HMSelectionSetting
- (BOOL)isKindOfClass:(Class)a3;
- (NSArray)items;
- (id)internalValue;
- (id)valueForUpdate:(id)a3;
@end

@implementation HMSelectionSetting

- (void).cxx_destruct
{
}

- (NSArray)items
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (id)valueForUpdate:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    v4 = v3;
  }
  else {
    v4 = 0;
  }
  id v5 = v4;

  if (!v5)
  {
    id v11 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"Value is not of type HMSelectionSettingItem" userInfo:0];
    objc_exception_throw(v11);
  }
  v6 = [HMSettingValue alloc];
  v7 = [v5 identifier];
  v8 = [v5 title];
  v9 = [(HMSettingValue *)v6 initWithType:4 stringValue:0 numberValue:0 dataValue:0 selectionIdentifier:v7 selectionValue:v8];

  return v9;
}

- (id)internalValue
{
  v2 = [(HMSetting *)self value];
  id v3 = [HMSettingValue alloc];
  v4 = [v2 identifier];
  id v5 = [v2 title];
  v6 = [(HMSettingValue *)v3 initWithType:4 stringValue:0 numberValue:0 dataValue:0 selectionIdentifier:v4 selectionValue:v5];

  return v6;
}

- (BOOL)isKindOfClass:(Class)a3
{
  v5.receiver = self;
  v5.super_class = (Class)HMSelectionSetting;
  return -[HMSelectionSetting isKindOfClass:](&v5, sel_isKindOfClass_) || objc_opt_class() == (void)a3;
}

@end