@interface HMDSettingAttachedSettingUpdate
- (HMDSettingAttachedSettingUpdate)initWithKeyPath:(id)a3 settingValue:(id)a4;
- (HMSettingValue)settingValue;
- (NSString)keyPath;
@end

@implementation HMDSettingAttachedSettingUpdate

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingValue, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
}

- (HMSettingValue)settingValue
{
  return (HMSettingValue *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (HMDSettingAttachedSettingUpdate)initWithKeyPath:(id)a3 settingValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)HMDSettingAttachedSettingUpdate;
  v9 = [(HMDSettingAttachedSettingUpdate *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyPath, a3);
    objc_storeStrong((id *)&v10->_settingValue, a4);
  }

  return v10;
}

@end