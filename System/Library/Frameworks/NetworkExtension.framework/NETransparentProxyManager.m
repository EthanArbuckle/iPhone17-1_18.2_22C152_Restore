@interface NETransparentProxyManager
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
+ (void)loadEverythingFromPreferencesWithCompletionHandler:(id)a3;
- (BOOL)isFromMDM;
- (BOOL)isProtocolTypeValid:(int64_t)a3;
- (NETransparentProxyManager)init;
- (void)additionalSetup;
- (void)loadFromPreferencesWithCompletionHandler:(id)a3;
@end

@implementation NETransparentProxyManager

- (BOOL)isFromMDM
{
  v3 = [(NEVPNManager *)self configuration];
  v4 = [v3 payloadInfo];

  if (!v4) {
    return 0;
  }
  v5 = [(NEVPNManager *)self configuration];
  v6 = [v5 payloadInfo];
  BOOL v7 = [v6 profileSource] == 2;

  return v7;
}

- (void)loadFromPreferencesWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = +[NEVPNManager configurationManager]();
    v6 = [(NEVPNManager *)self configuration];
    BOOL v7 = [v6 identifier];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __70__NETransparentProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v8[3] = &unk_1E5993748;
    v8[4] = self;
    id v9 = v4;
    [v5 loadConfigurationWithID:v7 withCompletionQueue:MEMORY[0x1E4F14428] handler:v8];
  }
}

void __70__NETransparentProxyManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (v6)
  {
    v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v22 = 138412290;
      id v23 = v6;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "Got an error while loading a configuration: %@", (uint8_t *)&v22, 0xCu);
    }

    id v9 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();

    goto LABEL_15;
  }
  if (!v5)
  {
    v19 = ne_log_obj();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = [*(id *)(a1 + 32) configuration];
      v21 = [v20 identifier];
      int v22 = 138412290;
      id v23 = v21;
      _os_log_impl(&dword_19DDAF000, v19, OS_LOG_TYPE_DEFAULT, "No configuration found with ID %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_14;
  }
  [*(id *)(a1 + 32) setConfiguration:v5];
  uint64_t v10 = *(void *)(a1 + 32);
  v11 = +[NEVPNManager loadedManagers]();
  v12 = [*(id *)(a1 + 32) configuration];
  v13 = [v12 identifier];
  [v11 setObject:v10 forKeyedSubscript:v13];

  v14 = [*(id *)(a1 + 32) connection];
  if (v14)
  {
    uint64_t v15 = v14[7];

    if (v15)
    {
LABEL_14:
      (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
      goto LABEL_15;
    }
  }
  v16 = [*(id *)(a1 + 32) connection];
  v17 = [*(id *)(a1 + 32) configuration];
  v18 = [v17 identifier];
  if (v16) {
    -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v16, v18, 0, *(void **)(a1 + 40));
  }

LABEL_15:
  objc_sync_exit(v7);
}

- (void)additionalSetup
{
  v3 = [(NEVPNManager *)self configuration];
  id v4 = [v3 VPN];
  id v10 = [v4 protocol];

  id v5 = [v10 providerBundleIdentifier];
  self;
  id v6 = v5;

  [v10 setProviderBundleIdentifier:v6];
  id v7 = [MEMORY[0x1E4F28B50] mainBundle];
  v8 = [v7 bundleIdentifier];
  [v10 setPluginType:v8];

  id v9 = [(NEVPNManager *)self configuration];
  if (v9) {
    v9[20] = 0;
  }
}

- (BOOL)isProtocolTypeValid:(int64_t)a3
{
  return a3 == 4;
}

- (NETransparentProxyManager)init
{
  v3 = -[NEVPNConnection initWithType:]([NETunnelProviderSession alloc], 1);
  v7.receiver = self;
  v7.super_class = (Class)NETransparentProxyManager;
  id v4 = [(NEVPNManager *)&v7 initWithGrade:1 connection:v3 tunnelType:2];
  id v5 = v4;
  if (v4) {
    v4->super._hasLoaded = 1;
  }

  return v5;
}

+ (void)loadEverythingFromPreferencesWithCompletionHandler:(id)a3
{
  id v3 = a3;
  self;
  g_noAppFilter = 1;
  +[NETransparentProxyManager loadAllFromPreferencesWithCompletionHandler:v3];
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  id v3 = completionHandler;
  if (v3)
  {
    id v4 = +[NEVPNManager loadedManagers]();
    id v5 = +[NEVPNManager configurationManager]();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v6[3] = &unk_1E5993680;
    id v7 = v3;
    [v5 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v6];
  }
}

void __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v26 = v4;
  v27 = v5;
  if (!v5)
  {
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__111;
    v42[4] = __Block_byref_object_dispose__112;
    id v43 = 0;
    group = dispatch_group_create();
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v8 = v4;
    uint64_t v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16, v4, 0);
    if (!v9) {
      goto LABEL_25;
    }
    uint64_t v10 = *(void *)v39;
    while (1)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v39 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        v13 = [v12 VPN];
        if (v13)
        {
          v14 = [v12 VPN];
          uint64_t v15 = [v14 protocol];
          if ([v15 type] == 4)
          {
            v16 = [v12 VPN];
            BOOL v17 = [v16 tunnelType] == 2;

            if (v17)
            {
              v18 = [v12 pluginType];
              if (isa_nsstring(v18))
              {
                v19 = objc_alloc_init(NETransparentProxyManager);
                [(NEVPNManager *)v19 setConfiguration:v12];
                [v29 addObject:v19];
                v20 = +[NEVPNManager loadedManagers]();
                v21 = [v12 identifier];
                [v20 setObject:v19 forKeyedSubscript:v21];

                if (v19) {
                  v19->super._hasLoaded = 1;
                }
                dispatch_group_enter(group);
                int v22 = [(NEVPNManager *)v19 connection];
                id v23 = [v12 identifier];
                v35[0] = MEMORY[0x1E4F143A8];
                v35[1] = 3221225472;
                v35[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_6;
                v35[3] = &unk_1E5993370;
                v35[4] = v12;
                v37 = v42;
                v36 = group;
                if (v22) {
                  -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v22, v23, 0, v35);
                }
              }
              else
              {
                ne_log_obj();
                v19 = (NETransparentProxyManager *)objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(&v19->super.super, OS_LOG_TYPE_DEFAULT))
                {
                  v25 = [v12 name];
                  *(_DWORD *)buf = 138412290;
                  v45 = v25;
                  _os_log_impl(&dword_19DDAF000, &v19->super.super, OS_LOG_TYPE_DEFAULT, "Skipping configuration %@ because it has an invalid plugin type", buf, 0xCu);
                }
              }

              goto LABEL_23;
            }
          }
          else
          {
          }
        }
        v18 = ne_log_obj();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v24 = [v12 name];
          *(_DWORD *)buf = 138412290;
          v45 = v24;
          _os_log_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_DEFAULT, "Skipping configuration %@ because it is of the wrong type", buf, 0xCu);
        }
LABEL_23:
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v38 objects:v46 count:16];
      if (!v9)
      {
LABEL_25:

        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_8;
        block[3] = &unk_1E5993398;
        v34 = v42;
        id v32 = v29;
        id v33 = *(id *)(a1 + 32);
        dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

        _Block_object_dispose(v42, 8);
        id v7 = v29;
        goto LABEL_26;
      }
    }
  }
  id v6 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v5);
  id v7 = v29;
  (*(void (**)(void, id))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v29);

LABEL_26:
}

void __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) name];
      int v7 = 138412546;
      id v8 = v6;
      __int16 v9 = 2112;
      id v10 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "Error creating connection for configuration %@: %@", (uint8_t *)&v7, 0x16u);
    }
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __73__NETransparentProxyManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_8(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

@end