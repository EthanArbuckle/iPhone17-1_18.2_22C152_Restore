@interface MOEffectiveSettingsStore
+ (MOEffectiveSettingsStore)new;
+ (id)publisherForGroups:(id)a3;
+ (id)setOfActiveRestrictionUUIDs;
- (MOEffectiveSettingsStore)init;
- (id)valueForSetting:(id)a3 inGroup:(id)a4;
- (void)dealloc;
@end

@implementation MOEffectiveSettingsStore

+ (MOEffectiveSettingsStore)new
{
  return (MOEffectiveSettingsStore *)MEMORY[0x1F4181648](a1, a2);
}

- (id)valueForSetting:(id)a3 inGroup:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = +[MOLocations effectiveSettingsPath];
  v9 = +[MOSettingsStore loadSettingsAtURL:v8];

  if (!v9
    || ([(MOSettingsStore *)self settingKeyFromSetting:v6 group:v7],
        v10 = objc_claimAutoreleasedReturnValue(),
        [v9 objectForKeyedSubscript:v10],
        v11 = objc_claimAutoreleasedReturnValue(),
        v10,
        !v11))
  {
    v12 = [(MOEffectiveSettingsStore *)self valueForKey:v7];
    v13 = [v12 metadataForSetting:v6];
    v14 = [v13 defaultValue];
    v11 = [v13 persistableValueFromValue:v14];
  }
  return v11;
}

- (MOEffectiveSettingsStore)init
{
  v3.receiver = self;
  v3.super_class = (Class)MOEffectiveSettingsStore;
  return (MOEffectiveSettingsStore *)[(MOSettingsStore *)&v3 initStore];
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)MOEffectiveSettingsStore;
  [(MOEffectiveSettingsStore *)&v2 dealloc];
}

+ (id)publisherForGroups:(id)a3
{
  id v3 = a3;
  v4 = [[MOEffectivePublisher alloc] initWithInterestedGroups:v3];

  return v4;
}

+ (id)setOfActiveRestrictionUUIDs
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  objc_super v2 = objc_opt_new();
  id v3 = +[MOLocations effectiveSettingsPath];
  v4 = +[MOSettingsStore loadSettingsAtURL:v3];

  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v15 = v4;
  v5 = [v4 allKeys];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v16 + 1) + 8 * i) componentsSeparatedByString:@"."];
        v11 = [v10 firstObject];
        if (v11)
        {
          v12 = [NSString stringWithFormat:@"%@.%@", @"com.apple.ManagedConfiguration.ManagedSettingsExtension", v11];
          [v2 addObject:v12];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }

  v13 = (void *)[v2 copy];
  return v13;
}

@end