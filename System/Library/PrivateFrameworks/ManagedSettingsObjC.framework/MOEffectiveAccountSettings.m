@interface MOEffectiveAccountSettings
- (MOEffectiveAccountSettings)init;
- (MOEffectiveBool)denyiCloudLogout;
- (MOEffectiveSettingsStore)store;
@end

@implementation MOEffectiveAccountSettings

- (MOEffectiveAccountSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveAccountSettings;
  v2 = [(MOEffectiveAccountSettings *)&v6 init];
  uint64_t v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

- (MOEffectiveBool)denyiCloudLogout
{
  v2 = [(MOEffectiveAccountSettings *)self store];
  uint64_t v3 = [v2 account];
  v4 = [v3 denyiCloudLogout];

  v5 = +[MOAccountSettingsGroup denyiCloudLogoutMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = -[MOEffectiveBool initWithValue:defaultValue:]([MOEffectiveBool alloc], "initWithValue:defaultValue:", [v4 BOOLValue], objc_msgSend(v6, "BOOLValue"));
  return v7;
}

- (MOEffectiveSettingsStore)store
{
  return (MOEffectiveSettingsStore *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end