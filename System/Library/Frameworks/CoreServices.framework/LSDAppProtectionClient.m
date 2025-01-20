@interface LSDAppProtectionClient
@end

@implementation LSDAppProtectionClient

void __67___LSDAppProtectionClient_sendPluginNotificationsFor_notification___block_invoke(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v15;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v15 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v14 + 1) + 8 * v5);
        v7 = [LSApplicationRecord alloc];
        v8 = -[LSApplicationRecord initWithBundleIdentifier:allowPlaceholder:error:](v7, "initWithBundleIdentifier:allowPlaceholder:error:", v6, 0, 0, (void)v14);
        v9 = v8;
        if (v8)
        {
          v10 = *(void **)(a1 + 40);
          v11 = [(LSApplicationRecord *)v8 applicationExtensionRecords];
          v12 = [v11 allObjects];
          [v10 addObjectsFromArray:v12];
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [v2 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v3);
  }

  v13 = +[_LSInstallProgressService sharedInstance];
  [v13 detachAndSendNotification:*(void *)(a1 + 48) forApplicationExtensionRecords:*(void *)(a1 + 40)];
}

@end