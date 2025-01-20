@interface WKWebViewConfiguration(QLUtilities)
- (id)_sharedDataStoreForBundleIdentifier:()QLUtilities;
- (void)ql_initWithForegroundPriorityAndSourceBundleIdentifier:()QLUtilities;
@end

@implementation WKWebViewConfiguration(QLUtilities)

- (void)ql_initWithForegroundPriorityAndSourceBundleIdentifier:()QLUtilities
{
  id v4 = a3;
  if (v4)
  {
    v5 = [a1 _sharedDataStoreForBundleIdentifier:v4];
  }
  else
  {
    id v6 = objc_alloc(MEMORY[0x263F1FA68]);
    id v7 = objc_alloc_init(MEMORY[0x263F1FAC8]);
    v5 = (void *)[v6 _initWithConfiguration:v7];
  }
  v8 = (void *)[a1 init];
  v9 = v8;
  if (v8)
  {
    [v8 setWebsiteDataStore:v5];
    [v9 _setClientNavigationsRunAtForegroundPriority:1];
  }

  return v9;
}

- (id)_sharedDataStoreForBundleIdentifier:()QLUtilities
{
  id v3 = a3;
  if (_sharedDataStoreForBundleIdentifier__once != -1) {
    dispatch_once(&_sharedDataStoreForBundleIdentifier__once, &__block_literal_global_18);
  }
  id v4 = (id)_sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier;
  objc_sync_enter(v4);
  v5 = [(id)_sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier objectForKeyedSubscript:v3];
  if (!v5)
  {
    id v6 = objc_alloc_init(MEMORY[0x263F1FAC8]);
    [v6 setSourceApplicationBundleIdentifier:v3];
    v5 = (void *)[objc_alloc(MEMORY[0x263F1FA68]) _initWithConfiguration:v6];
    [(id)_sharedDataStoreForBundleIdentifier__sharedWebKitDataStoreByBundleIdentifier setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

@end