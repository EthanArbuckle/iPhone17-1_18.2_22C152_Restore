@interface MOEffectiveAllowedClientSettings
- (MOEffectiveAllowedClientSettings)init;
- (MOEffectiveOptionalApplication)allowedClient;
- (MOEffectiveSettingsStore)store;
@end

@implementation MOEffectiveAllowedClientSettings

- (MOEffectiveAllowedClientSettings)init
{
  v6.receiver = self;
  v6.super_class = (Class)MOEffectiveAllowedClientSettings;
  v2 = [(MOEffectiveAllowedClientSettings *)&v6 init];
  uint64_t v3 = objc_opt_new();
  store = v2->_store;
  v2->_store = (MOEffectiveSettingsStore *)v3;

  return v2;
}

- (MOEffectiveOptionalApplication)allowedClient
{
  v2 = [(MOEffectiveAllowedClientSettings *)self store];
  uint64_t v3 = [v2 allowedClient];
  v4 = [v3 allowedClient];

  v5 = +[MOAllowedClientSettingsGroup allowedClientMetadata];
  objc_super v6 = [v5 defaultValue];

  v7 = [[MOEffectiveOptionalApplication alloc] initWithValue:v4 defaultValue:v6];
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