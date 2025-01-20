@interface DNDSAppForegroundTriggerConfiguration
- (DNDSAppForegroundTriggerConfiguration)init;
- (id)description;
- (id)modeIdentifierForBundleIdentifier:(id)a3;
- (id)triggeringBundleIdentifiers;
- (void)addTriggerForModeWithIdentifier:(id)a3 onForegroundOfApp:(id)a4;
@end

@implementation DNDSAppForegroundTriggerConfiguration

- (DNDSAppForegroundTriggerConfiguration)init
{
  v6.receiver = self;
  v6.super_class = (Class)DNDSAppForegroundTriggerConfiguration;
  v2 = [(DNDSAppForegroundTriggerConfiguration *)&v6 init];
  v3 = v2;
  if (v2)
  {
    bundleIDToModeIdentifierTriggers = v2->_bundleIDToModeIdentifierTriggers;
    v2->_bundleIDToModeIdentifierTriggers = (NSDictionary *)MEMORY[0x1E4F1CC08];
  }
  return v3;
}

- (id)triggeringBundleIdentifiers
{
  return [(NSDictionary *)self->_bundleIDToModeIdentifierTriggers allKeys];
}

- (id)modeIdentifierForBundleIdentifier:(id)a3
{
  return [(NSDictionary *)self->_bundleIDToModeIdentifierTriggers objectForKeyedSubscript:a3];
}

- (void)addTriggerForModeWithIdentifier:(id)a3 onForegroundOfApp:(id)a4
{
  bundleIDToModeIdentifierTriggers = self->_bundleIDToModeIdentifierTriggers;
  id v7 = a4;
  id v8 = a3;
  id v11 = (id)[(NSDictionary *)bundleIDToModeIdentifierTriggers mutableCopy];
  [v11 setObject:v8 forKeyedSubscript:v7];

  v9 = (NSDictionary *)[v11 copy];
  v10 = self->_bundleIDToModeIdentifierTriggers;
  self->_bundleIDToModeIdentifierTriggers = v9;
}

- (id)description
{
  return [(NSDictionary *)self->_bundleIDToModeIdentifierTriggers description];
}

- (void).cxx_destruct
{
}

@end