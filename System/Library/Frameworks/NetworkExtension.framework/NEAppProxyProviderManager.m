@interface NEAppProxyProviderManager
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (NEAppProxyProviderManager)init;
@end

@implementation NEAppProxyProviderManager

- (NEAppProxyProviderManager)init
{
  v3 = ne_log_obj();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "MDM must be used to create NEAppProxyProvider configurations", v5, 2u);
  }

  return 0;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    id v5 = +[NEVPNManager loadedManagers]();
    v6 = +[NEVPNManager configurationManager]();
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59933C0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v7];
  }
}

void __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v29 = a2;
  id v5 = a3;
  uint64_t v27 = a1;
  id obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v43 = 0;
  v44 = &v43;
  uint64_t v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__169;
  v47 = __Block_byref_object_dispose__170;
  id v6 = v5;
  id v48 = v6;
  v26 = v6;
  if (v6)
  {
    uint64_t v7 = +[NEVPNManager mapError:]((uint64_t)NEVPNManager, v6);
    id v8 = (void *)v44[5];
    v44[5] = v7;

    uint64_t v9 = v44[5];
  }
  else
  {
    uint64_t v9 = 0;
  }
  if (!v29 || v9 || ![v29 count])
  {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_29;
  }
  group = dispatch_group_create();
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v10 = v29;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
  if (!v11) {
    goto LABEL_27;
  }
  uint64_t v12 = *(void *)v40;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v40 != v12) {
        objc_enumerationMutation(v10);
      }
      v14 = *(void **)(*((void *)&v39 + 1) + 8 * i);
      v15 = [v14 appVPN];
      if (v15)
      {
        v16 = [v14 appVPN];
        v17 = [(NEVPNManager *)v16 protocol];
        if ([v17 type] == 4)
        {
          v18 = [v14 appVPN];
          BOOL v19 = [v18 tunnelType] == 2;

          if (!v19) {
            continue;
          }
          v15 = [v14 pluginType];
          if (isa_nsstring(v15)
            && !+[NETunnelProviderProtocol isLegacyPluginType:v15])
          {
            v20 = [NEAppProxyProviderManager alloc];
            v21 = [v14 appVPN];
            v16 = -[NETunnelProviderManager initWithSessionType:tunnelType:](v20, "initWithSessionType:tunnelType:", 2, [v21 tunnelType]);

            [(NEVPNManager *)v16 setConfiguration:v14];
            [v30 addObject:v16];
            v22 = +[NEVPNManager loadedManagers]();
            v23 = [v14 identifier];
            [v22 setObject:v16 forKeyedSubscript:v23];

            if (v16) {
              v16->super.super._hasLoaded = 1;
            }
            dispatch_group_enter(group);
            v24 = [(NEVPNManager *)v16 connection];
            v25 = [v14 identifier];
            v36[0] = MEMORY[0x1E4F143A8];
            v36[1] = 3221225472;
            v36[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_4;
            v36[3] = &unk_1E5993370;
            v36[4] = v14;
            v38 = &v43;
            v37 = group;
            if (v24) {
              -[NEVPNConnection createSessionWithConfigurationIdentifier:forceInfoFetch:completionHandler:](v24, v25, 0, v36);
            }

LABEL_23:
          }

          continue;
        }

        goto LABEL_23;
      }
    }
    uint64_t v11 = [v10 countByEnumeratingWithState:&v39 objects:v49 count:16];
  }
  while (v11);
LABEL_27:

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_5;
  block[3] = &unk_1E5993398;
  v35 = &v43;
  id v33 = v30;
  id v34 = *(id *)(v27 + 32);
  dispatch_group_notify(group, MEMORY[0x1E4F14428], block);

LABEL_29:
  _Block_object_dispose(&v43, 8);

  objc_sync_exit(obj);
}

void __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      id v6 = [*(id *)(a1 + 32) identifier];
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

uint64_t __73__NEAppProxyProviderManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_5(uint64_t a1)
{
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    [*(id *)(a1 + 32) removeAllObjects];
  }
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v2();
}

@end