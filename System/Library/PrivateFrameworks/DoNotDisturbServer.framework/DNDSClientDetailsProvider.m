@interface DNDSClientDetailsProvider
+ (id)_defaultModuleDirectories;
- (DNDSClientDetailsProvider)init;
- (id)clientDetailsForIdentifier:(id)a3;
- (id)clientDetailsForIdentifier:(id)a3 applicationBundleURL:(id)a4;
- (id)findClientDetailsForIdentifier:(id)a3;
- (void)_loadPreloadBundles;
@end

@implementation DNDSClientDetailsProvider

- (DNDSClientDetailsProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)DNDSClientDetailsProvider;
  v2 = [(DNDSClientDetailsProvider *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    detailsByIdentifier = v2->_detailsByIdentifier;
    v2->_detailsByIdentifier = v3;

    [(DNDSClientDetailsProvider *)v2 _loadPreloadBundles];
  }
  return v2;
}

- (id)findClientDetailsForIdentifier:(id)a3
{
  id v4 = a3;
  v5 = self->_detailsByIdentifier;
  objc_sync_enter(v5);
  objc_super v6 = [(NSMutableDictionary *)self->_detailsByIdentifier objectForKey:v4];
  objc_sync_exit(v5);

  return v6;
}

- (id)clientDetailsForIdentifier:(id)a3
{
  return [(DNDSClientDetailsProvider *)self clientDetailsForIdentifier:a3 applicationBundleURL:0];
}

- (id)clientDetailsForIdentifier:(id)a3 applicationBundleURL:(id)a4
{
  v26[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self->_detailsByIdentifier;
  objc_sync_enter(v8);
  v9 = [(NSMutableDictionary *)self->_detailsByIdentifier objectForKey:v6];
  if (!v9)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __77__DNDSClientDetailsProvider_clientDetailsForIdentifier_applicationBundleURL___block_invoke;
    aBlock[3] = &unk_1E6974BA8;
    aBlock[4] = self;
    v10 = (void (**)(void *, id))_Block_copy(aBlock);
    uint64_t v11 = v10[2](v10, v6);
    v9 = (DNDSClientDetails *)v11;
    if (v7 && !v11)
    {
      v9 = +[DNDSClientDetails detailsForClientIdentifier:v6 applicationBundleURL:v7];
    }
    if (!v9)
    {
      if ([v6 isEqualToString:@"com.apple.donotdisturb.private.schedule"]) {
        goto LABEL_11;
      }
      if (![v6 hasSuffix:@".private.schedule"]) {
        goto LABEL_11;
      }
      v12 = [(NSMutableDictionary *)self->_detailsByIdentifier objectForKey:@"com.apple.donotdisturb.private.schedule"];
      if (!v12)
      {
        v12 = v10[2](v10, @"com.apple.donotdisturb.private.schedule");
        [(NSMutableDictionary *)self->_detailsByIdentifier setObject:v12 forKey:@"com.apple.donotdisturb.private.schedule"];
        if (!v12) {
          goto LABEL_11;
        }
      }
      v23 = [DNDSClientDetails alloc];
      v26[0] = v6;
      v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:1];
      unsigned int v22 = [v12 isResolutionContextAssumingDeviceUILocked];
      unsigned int v21 = [v12 isUserInteractionClient];
      uint64_t v14 = [v12 isPersistentAssertionClient];
      uint64_t v15 = [v12 isSyncSuppressedClient];
      char v16 = [v12 isIOS14SyncSuppressedClient];
      BYTE1(v20) = [v12 forcesAssertionStatusUpdate];
      LOBYTE(v20) = v16;
      v9 = -[DNDSClientDetails initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:](v23, "initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:", v6, v13, v22, v21, v14, v15, v20);

      if (!v9)
      {
LABEL_11:
        v17 = [DNDSClientDetails alloc];
        id v25 = v6;
        v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        LOWORD(v20) = 0;
        v9 = -[DNDSClientDetails initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:](v17, "initWithClientIdentifier:identifiers:resolutionContextAssumingDeviceUILocked:userInteractionClient:persistentAssertionClient:syncSuppressedClient:iOS14SyncSuppressedClient:forcesAssertionStatusUpdate:", v6, v18, 0, 0, 0, 0, v20);
      }
    }
    [(NSMutableDictionary *)self->_detailsByIdentifier setObject:v9 forKey:v6];
  }
  objc_sync_exit(v8);

  return v9;
}

id __77__DNDSClientDetailsProvider_clientDetailsForIdentifier_applicationBundleURL___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id obj = [(id)objc_opt_class() _defaultModuleDirectories];
  uint64_t v3 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(obj);
        }
        id v7 = [*(id *)(*((void *)&v15 + 1) + 8 * i) URLByAppendingPathComponent:v2];
        v8 = [v7 URLByAppendingPathExtension:@"bundle"];

        v9 = [MEMORY[0x1E4F28CB8] defaultManager];
        v10 = [v8 path];
        char v11 = [v9 fileExistsAtPath:v10];

        if (v11)
        {
          v12 = +[DNDSClientDetails detailsForBundleAtURL:v8];

          goto LABEL_11;
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

+ (id)_defaultModuleDirectories
{
  if (_defaultModuleDirectories_onceToken != -1) {
    dispatch_once(&_defaultModuleDirectories_onceToken, &__block_literal_global_21);
  }
  id v2 = (void *)_defaultModuleDirectories_directories;
  return v2;
}

void __54__DNDSClientDetailsProvider__defaultModuleDirectories__block_invoke()
{
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 1);
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  if (os_variant_has_internal_content())
  {
    v0 = [NSString pathWithComponents:&unk_1F2A5E038];
    uint64_t v1 = [v5 arrayByAddingObject:v0];

    id v2 = (void *)v1;
  }
  else
  {
    id v2 = v5;
  }
  id v6 = v2;
  uint64_t v3 = objc_msgSend(v2, "bs_map:", &__block_literal_global_22);
  uint64_t v4 = (void *)_defaultModuleDirectories_directories;
  _defaultModuleDirectories_directories = v3;
}

id __54__DNDSClientDetailsProvider__defaultModuleDirectories__block_invoke_2(uint64_t a1, void *a2)
{
  v8[4] = *MEMORY[0x1E4F143B8];
  id v2 = (void *)MEMORY[0x1E4F1CB10];
  id v3 = a2;
  uint64_t v4 = BSSystemRootDirectory();
  v8[0] = v4;
  v8[1] = v3;
  v8[2] = @"DoNotDisturb";
  v8[3] = @"ClientBundles";
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:4];
  id v6 = [v2 fileURLWithPathComponents:v5];

  return v6;
}

- (void)_loadPreloadBundles
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = [(id)objc_opt_class() _defaultModuleDirectories];
  long long v17 = objc_msgSend(v3, "bs_mapNoNulls:", &__block_literal_global_32);

  long long v16 = objc_msgSend(v17, "bs_flatten");
  long long v15 = objc_msgSend(v16, "bs_filter:", &__block_literal_global_35);
  uint64_t v4 = objc_msgSend(v15, "bs_mapNoNulls:", &__block_literal_global_41);
  id obj = self->_detailsByIdentifier;
  objc_sync_enter(obj);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v23;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v23 != v7) {
          objc_enumerationMutation(v5);
        }
        v9 = *(void **)(*((void *)&v22 + 1) + 8 * v8);
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        v10 = objc_msgSend(v9, "identifiers", obj);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v19;
          do
          {
            uint64_t v13 = 0;
            do
            {
              if (*(void *)v19 != v12) {
                objc_enumerationMutation(v10);
              }
              [(NSMutableDictionary *)self->_detailsByIdentifier setObject:v9 forKey:*(void *)(*((void *)&v18 + 1) + 8 * v13++)];
            }
            while (v11 != v13);
            uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
          }
          while (v11);
        }

        ++v8;
      }
      while (v8 != v6);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v22 objects:v27 count:16];
    }
    while (v6);
  }

  objc_sync_exit(obj);
}

id __48__DNDSClientDetailsProvider__loadPreloadBundles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x1E4F28CB8];
  id v3 = a2;
  uint64_t v4 = [v2 defaultManager];
  id v5 = [v4 contentsOfDirectoryAtURL:v3 includingPropertiesForKeys:0 options:1 error:0];

  return v5;
}

uint64_t __48__DNDSClientDetailsProvider__loadPreloadBundles__block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = [a2 path];
  uint64_t v3 = [v2 hasSuffix:@".preload.bundle"];

  return v3;
}

id __48__DNDSClientDetailsProvider__loadPreloadBundles__block_invoke_3(uint64_t a1, uint64_t a2)
{
  return +[DNDSClientDetails detailsForBundleAtURL:a2];
}

- (void).cxx_destruct
{
}

@end