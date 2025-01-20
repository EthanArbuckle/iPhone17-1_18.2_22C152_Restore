@interface HMDCompositeSettingsKeyPathValueItem
- (HMDCompositeSettingValue)value;
- (HMDCompositeSettingsKeyPathValueItem)initWithKeyPath:(id)a3 value:(id)a4;
- (NSString)keyPath;
@end

@implementation HMDCompositeSettingsKeyPathValueItem

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (HMDCompositeSettingValue)value
{
  return (HMDCompositeSettingValue *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDCompositeSettingsKeyPathValueItem)initWithKeyPath:(id)a3 value:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDCompositeSettingsKeyPathValueItem;
  v9 = [(HMDCompositeSettingsKeyPathValueItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_value, a4);
  }

  return v10;
}

@end