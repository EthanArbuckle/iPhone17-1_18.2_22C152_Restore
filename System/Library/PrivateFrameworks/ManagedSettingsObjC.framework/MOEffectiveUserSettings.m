@interface MOEffectiveUserSettings
- (MOEffectiveSettingsStore)store;
- (MOEffectiveString)sharingPolicy;
- (MOEffectiveUserSettings)init;
@end

@implementation MOEffectiveUserSettings

- (MOEffectiveUserSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveUserSettings;
  v2 = [(MOEffectiveUserSettings *)&v6 init];
  uint64_t v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

- (MOEffectiveString)sharingPolicy
{
  v2 = [(MOEffectiveUserSettings *)self store];
  uint64_t v3 = [v2 user];
  v4 = [v3 sharingPolicy];

  v5 = +[MOUserSettingsGroup sharingPolicyMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = [[MOEffectiveString alloc] initWithValue:v4 defaultValue:v6];
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