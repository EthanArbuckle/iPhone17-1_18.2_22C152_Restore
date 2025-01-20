@interface NEAppPushManager
+ (id)loadedManagers;
+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (BOOL)establishSessionManagerConnectionWithConfigurationID:(void *)a1;
- (BOOL)isActive;
- (BOOL)isEnabled;
- (NEAppPushManager)init;
- (NSArray)matchPrivateLTENetworks;
- (NSArray)matchSSIDs;
- (NSDictionary)providerConfiguration;
- (NSString)localizedDescription;
- (NSString)providerBundleIdentifier;
- (id)delegate;
- (void)cancelSessionManagerConnection;
- (void)dealloc;
- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler;
- (void)setActive:(BOOL)a3;
- (void)setDelegate:(id)delegate;
- (void)setEnabled:(BOOL)enabled;
- (void)setLocalizedDescription:(NSString *)localizedDescription;
- (void)setMatchPrivateLTENetworks:(NSArray *)matchPrivateLTENetworks;
- (void)setMatchSSIDs:(NSArray *)matchSSIDs;
- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier;
- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration;
@end

@implementation NEAppPushManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_configurationManager, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setDelegate:(id)delegate
{
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return WeakRetained;
}

- (void)setProviderBundleIdentifier:(NSString *)providerBundleIdentifier
{
  v9 = providerBundleIdentifier;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 appPush];
  [v8 setProviderBundleIdentifier:v9];

  objc_sync_exit(v4);
}

- (NSString)providerBundleIdentifier
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 appPush];
  id v7 = [v6 providerBundleIdentifier];

  objc_sync_exit(v2);

  return (NSString *)v7;
}

- (void)setLocalizedDescription:(NSString *)localizedDescription
{
  v8 = localizedDescription;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  [v7 setName:v8];

  objc_sync_exit(v4);
}

- (NSString)localizedDescription
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 name];

  objc_sync_exit(v2);

  return (NSString *)v6;
}

- (void)setProviderConfiguration:(NSDictionary *)providerConfiguration
{
  v9 = providerConfiguration;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 appPush];
  [v8 setProviderConfiguration:v9];

  objc_sync_exit(v4);
}

- (NSDictionary)providerConfiguration
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 appPush];
  id v7 = [v6 providerConfiguration];

  objc_sync_exit(v2);

  return (NSDictionary *)v7;
}

- (void)setMatchPrivateLTENetworks:(NSArray *)matchPrivateLTENetworks
{
  v9 = matchPrivateLTENetworks;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 appPush];
  [v8 setMatchPrivateLTENetworks:v9];

  objc_sync_exit(v4);
}

- (NSArray)matchPrivateLTENetworks
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 appPush];
  id v7 = [v6 matchPrivateLTENetworks];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setMatchSSIDs:(NSArray *)matchSSIDs
{
  v9 = matchSSIDs;
  v4 = self;
  objc_sync_enter(v4);
  if (v4) {
    id Property = objc_getProperty(v4, v5, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v7 = Property;
  v8 = [v7 appPush];
  [v8 setMatchSSIDs:v9];

  objc_sync_exit(v4);
}

- (NSArray)matchSSIDs
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  v6 = [v5 appPush];
  id v7 = [v6 matchSSIDs];

  objc_sync_exit(v2);

  return (NSArray *)v7;
}

- (void)setEnabled:(BOOL)enabled
{
  BOOL v3 = enabled;
  selfa = self;
  objc_sync_enter(selfa);
  id Property = selfa;
  if (selfa) {
    id Property = objc_getProperty(selfa, v4, 32, 1);
  }
  id v6 = Property;
  id v7 = [v6 appPush];
  [v7 setEnabled:v3];

  objc_sync_exit(selfa);
}

- (BOOL)isEnabled
{
  v2 = self;
  objc_sync_enter(v2);
  if (v2) {
    id Property = objc_getProperty(v2, v3, 32, 1);
  }
  else {
    id Property = 0;
  }
  id v5 = Property;
  id v6 = [v5 appPush];
  char v7 = [v6 isEnabled];

  objc_sync_exit(v2);
  return v7;
}

- (void)saveToPreferencesWithCompletionHandler:(void *)completionHandler
{
  v45[1] = *MEMORY[0x1E4F143B8];
  v4 = completionHandler;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    if (!v5) {
      goto LABEL_7;
    }
    id v7 = objc_getProperty(v5, v6, 32, 1);
    if (!v7) {
      goto LABEL_7;
    }
    v9 = v7;
    id v10 = objc_getProperty(v5, v8, 32, 1);
    v11 = [v10 appPush];

    if (v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v14 = objc_getProperty(v5, v13, 32, 1);
      char v15 = [v14 checkValidityAndCollectErrors:v12];

      if (v15)
      {
        v16 = +[NEConfigurationManager sharedManager];
        id v18 = objc_getProperty(v5, v17, 32, 1);
        uint64_t v19 = MEMORY[0x1E4F14428];
        id v20 = MEMORY[0x1E4F14428];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_38;
        v30[3] = &unk_1E5993798;
        v30[4] = v5;
        id v31 = v4;
        [v16 saveConfiguration:v18 withCompletionQueue:v19 handler:v30];
      }
      else
      {
        if ([v12 count])
        {
          uint64_t v38 = *MEMORY[0x1E4F28568];
          v25 = [v12 componentsJoinedByString:@"\n"];
          v39 = v25;
          v26 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
        }
        else
        {
          v26 = 0;
        }
        v27 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:v26];
        v32[0] = MEMORY[0x1E4F143A8];
        v32[1] = 3221225472;
        v32[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_37;
        v32[3] = &unk_1E59936F8;
        id v34 = v4;
        id v28 = v27;
        id v33 = v28;
        dispatch_async(MEMORY[0x1E4F14428], v32);
        v29 = ne_log_obj();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v41 = v5;
          __int16 v42 = 2112;
          id v43 = v28;
          _os_log_error_impl(&dword_19DDAF000, v29, OS_LOG_TYPE_ERROR, "%@ Failed to save the configuration: %@", buf, 0x16u);
        }
      }
    }
    else
    {
LABEL_7:
      v21 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v44 = *MEMORY[0x1E4F28568];
      v45[0] = @"invalid app push provider configuration";
      v22 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v45 forKeys:&v44 count:1];
      v23 = [v21 errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:v22];

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E59936F8;
      id v37 = v4;
      id v12 = v23;
      id v36 = v12;
      dispatch_async(MEMORY[0x1E4F14428], block);
      v24 = ne_log_obj();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v41 = v5;
        __int16 v42 = 2112;
        id v43 = v12;
        _os_log_error_impl(&dword_19DDAF000, v24, OS_LOG_TYPE_ERROR, "%@ Failed to save the configuration as configuration is nil, %@", buf, 0x16u);
      }
    }
    objc_sync_exit(v5);
  }
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_37(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_38(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@: Failed to save the configuration: %@", buf, 0x16u);
    }

    id v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAppPushErrorDomain" code:3 userInfo:0];
  }
  else
  {
    id v5 = 0;
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_39;
  v9[3] = &unk_1E59936F8;
  id v6 = *(id *)(a1 + 40);
  id v10 = v5;
  id v11 = v6;
  id v7 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

uint64_t __59__NEAppPushManager_saveToPreferencesWithCompletionHandler___block_invoke_39(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)removeFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  v4 = completionHandler;
  if (v4)
  {
    id v5 = self;
    objc_sync_enter(v5);
    if (v5 && objc_getProperty(v5, v6, 32, 1))
    {
      id v8 = objc_getProperty(v5, v7, 32, 1);
      v9 = [v8 identifier];
      id v10 = (void *)[v9 copy];

      id v11 = +[NEConfigurationManager sharedManager];
      id v13 = objc_getProperty(v5, v12, 32, 1);
      uint64_t v14 = MEMORY[0x1E4F14428];
      id v15 = MEMORY[0x1E4F14428];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_2;
      v17[3] = &unk_1E59923F0;
      v17[4] = v5;
      id v16 = v10;
      id v18 = v16;
      id v19 = v4;
      [v11 removeConfiguration:v13 withCompletionQueue:v14 handler:v17];
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke;
      block[3] = &unk_1E5993770;
      id v21 = v4;
      dispatch_async(MEMORY[0x1E4F14428], block);
      id v16 = v21;
    }

    objc_sync_exit(v5);
  }
}

void __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAppPushErrorDomain" code:3 userInfo:0];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

void __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      uint64_t v13 = v8;
      __int16 v14 = 2112;
      id v15 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@: failed to remove the configuration: %@", buf, 0x16u);
    }
  }
  id v5 = +[NEAppPushManager loadedManagers]();
  [v5 removeObjectForKey:*(void *)(a1 + 40)];

  -[NEAppPushManager cancelSessionManagerConnection](*(void **)(a1 + 32));
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_29;
  v9[3] = &unk_1E59936F8;
  id v6 = *(id *)(a1 + 48);
  id v10 = v3;
  id v11 = v6;
  id v7 = v3;
  dispatch_async(MEMORY[0x1E4F14428], v9);
}

+ (id)loadedManagers
{
  uint64_t v0 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__NEAppPushManager_loadedManagers__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  void block[4] = v0;
  if (loadedManagers_managers_init != -1) {
    dispatch_once(&loadedManagers_managers_init, block);
  }
  uint64_t v1 = (void *)loadedManagers_loadedManagers;

  return v1;
}

- (void)cancelSessionManagerConnection
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = a1;
    objc_sync_enter(v1);
    if (v1[5])
    {
      ne_session_cancel();
      v1[5] = 0;
      id v2 = ne_log_obj();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        id v4 = objc_getProperty(v1, v3, 32, 1);
        id v5 = [v4 identifier];
        int v6 = 138412546;
        id v7 = v1;
        __int16 v8 = 2112;
        v9 = v5;
        _os_log_impl(&dword_19DDAF000, v2, OS_LOG_TYPE_INFO, "%@ cancelled connection with nesessionmanager for configuration id: %@", (uint8_t *)&v6, 0x16u);
      }
    }
    objc_sync_exit(v1);
  }
}

uint64_t __63__NEAppPushManager_removeFromPreferencesWithCompletionHandler___block_invoke_29(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void __34__NEAppPushManager_loadedManagers__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)loadedManagers_loadedManagers;
  loadedManagers_loadedManagers = (uint64_t)v2;

  id v4 = +[NEConfigurationManager sharedManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __34__NEAppPushManager_loadedManagers__block_invoke_2;
  v5[3] = &__block_descriptor_40_e17_v16__0__NSArray_8l;
  v5[4] = *(void *)(a1 + 32);
  [v4 setChangedQueue:MEMORY[0x1E4F14428] andHandler:v5];
}

void __34__NEAppPushManager_loadedManagers__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = a2;
  uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v21;
    id v5 = (void *)MEMORY[0x1E4F14428];
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v21 != v4) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v20 + 1) + 8 * v6);
        uint64_t v14 = 0;
        id v15 = &v14;
        uint64_t v16 = 0x3032000000;
        SEL v17 = __Block_byref_object_copy__6807;
        id v18 = __Block_byref_object_dispose__6808;
        id v19 = [(id)loadedManagers_loadedManagers objectForKeyedSubscript:v7];
        __int16 v8 = (void *)v15[5];
        if (v8)
        {
          v13[0] = MEMORY[0x1E4F143A8];
          v13[1] = 3221225472;
          v13[2] = __34__NEAppPushManager_loadedManagers__block_invoke_2;
          v13[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
          v13[4] = *(void *)(a1 + 32);
          [v8 loadFromPreferencesWithCompletionHandler:v13];
        }
        else
        {
          v9 = +[NEConfigurationManager sharedManager];
          id v10 = v5;
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __34__NEAppPushManager_loadedManagers__block_invoke_4;
          v12[3] = &unk_1E598FE00;
          v12[4] = v7;
          v12[5] = &v14;
          v12[6] = *(void *)(a1 + 32);
          [v9 loadConfigurationWithID:v7 withCompletionQueue:v5 handler:v12];
        }
        _Block_object_dispose(&v14, 8);

        ++v6;
      }
      while (v3 != v6);
      uint64_t v3 = [obj countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v3);
  }
}

{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  id v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = a2;
  if (v3)
  {
    uint64_t v4 = ne_log_obj();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      id v5 = *(void *)(a1 + 32);
      uint64_t v6 = 138412546;
      uint64_t v7 = v5;
      __int16 v8 = 2112;
      v9 = v3;
      _os_log_error_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_ERROR, "%@ loadFromPreferencesWithCompletionHandler failed. error: %@", (uint8_t *)&v6, 0x16u);
    }
  }
}

void __34__NEAppPushManager_loadedManagers__block_invoke_4(void *a1, void *a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [(id)loadedManagers_loadedManagers objectForKeyedSubscript:a1[4]];
  uint64_t v8 = *(void *)(a1[5] + 8);
  v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v7;

  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    if (v6)
    {
LABEL_3:
      id v11 = ne_log_obj();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        uint64_t v18 = a1[6];
        int v19 = 138412546;
        uint64_t v20 = v18;
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_error_impl(&dword_19DDAF000, v11, OS_LOG_TYPE_ERROR, "%@ loadConfigurationWithID failed. error: %@", (uint8_t *)&v19, 0x16u);
      }

      goto LABEL_11;
    }
  }
  else
  {
    SEL v12 = objc_alloc_init(NEAppPushManager);
    uint64_t v13 = *(void *)(a1[5] + 8);
    uint64_t v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;

    if (v6) {
      goto LABEL_3;
    }
  }
  id v15 = *(void **)(*(void *)(a1[5] + 8) + 40);
  if (v15
    && (objc_setProperty_atomic_copy(v15, v10, v5, 32), (uint64_t v16 = *(void *)(*(void *)(a1[5] + 8) + 40)) != 0))
  {
    *(unsigned char *)(v16 + 9) = 1;
    uint64_t v17 = *(void *)(*(void *)(a1[5] + 8) + 40);
  }
  else
  {
    uint64_t v17 = 0;
  }
  [(id)loadedManagers_loadedManagers setObject:v17 forKeyedSubscript:a1[4]];
LABEL_11:
}

- (void)loadFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  if (v4)
  {
    id v6 = +[NEConfigurationManager sharedManager];
    if (self) {
      id Property = objc_getProperty(self, v5, 32, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v8 = [Property identifier];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __61__NEAppPushManager_loadFromPreferencesWithCompletionHandler___block_invoke;
    v9[3] = &unk_1E5993748;
    void v9[4] = self;
    id v10 = v4;
    [v6 loadConfigurationWithID:v8 withCompletionQueue:MEMORY[0x1E4F14428] handler:v9];
  }
}

void __61__NEAppPushManager_loadFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = *(id *)(a1 + 32);
  objc_sync_enter(v7);
  if (!v6)
  {
    if (!v5 || ([v5 appPush], v9 = objc_claimAutoreleasedReturnValue(), v9, !v9))
    {
      __int16 v21 = ne_log_obj();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = *(void *)(a1 + 32);
        if (v26) {
          id Property = objc_getProperty(*(id *)(a1 + 32), v25, 32, 1);
        }
        else {
          id Property = 0;
        }
        id v28 = Property;
        v29 = [v28 identifier];
        int v32 = 138412546;
        uint64_t v33 = v26;
        __int16 v34 = 2112;
        id v35 = v29;
        _os_log_impl(&dword_19DDAF000, v21, OS_LOG_TYPE_INFO, "%@ No configuration found with ID %@", (uint8_t *)&v32, 0x16u);
      }
      goto LABEL_24;
    }
    id v11 = *(void **)(a1 + 32);
    if (v11)
    {
      if (v11[5])
      {
LABEL_14:
        uint64_t v17 = *(void **)(a1 + 32);
        if (v17 && (objc_setProperty_atomic_copy(v17, v10, v5, 32), (uint64_t v18 = *(void *)(a1 + 32)) != 0))
        {
          *(unsigned char *)(v18 + 9) = 1;
          uint64_t v19 = *(void *)(a1 + 32);
        }
        else
        {
          uint64_t v19 = 0;
        }
        __int16 v21 = +[NEAppPushManager loadedManagers]();
        id v22 = *(id *)(a1 + 32);
        if (v22) {
          id v22 = objc_getProperty(v22, v20, 32, 1);
        }
        id v23 = v22;
        v24 = [v23 identifier];
        [v21 setObject:v19 forKeyedSubscript:v24];

LABEL_24:
        id v6 = 0;
LABEL_25:
        (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
        goto LABEL_26;
      }
      id v12 = objc_getProperty(*(id *)(a1 + 32), v10, 32, 1);
    }
    else
    {
      id v12 = 0;
    }
    id v13 = v12;
    uint64_t v14 = [v13 identifier];
    BOOL v15 = -[NEAppPushManager establishSessionManagerConnectionWithConfigurationID:](v11, v14);

    if (!v15)
    {
      uint64_t v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v31 = *(void *)(a1 + 32);
        int v32 = 138412290;
        uint64_t v33 = v31;
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "%@ establishSessionManagerConnectionWithConfigurationID failed.", (uint8_t *)&v32, 0xCu);
      }

      id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:0];
      if (v6) {
        goto LABEL_25;
      }
    }
    goto LABEL_14;
  }
  uint64_t v8 = ne_log_obj();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    uint64_t v30 = *(void *)(a1 + 32);
    int v32 = 138412546;
    uint64_t v33 = v30;
    __int16 v34 = 2112;
    id v35 = v6;
    _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to load the configuration: %@", (uint8_t *)&v32, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
LABEL_26:
  objc_sync_exit(v7);
}

- (BOOL)establishSessionManagerConnectionWithConfigurationID:(void *)a1
{
  v16[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (a1)
  {
    uint64_t v4 = a1;
    objc_sync_enter(v4);
    v16[0] = 0;
    v16[1] = 0;
    -[NEAppPushManager cancelSessionManagerConnection](v4);
    [v3 getUUIDBytes:v16];
    uint64_t v5 = ne_session_create();
    v4[5] = v5;
    BOOL v6 = v5 != 0;
    if (v5)
    {
      id v7 = MEMORY[0x1E4F14428];
      ne_session_set_event_handler();

      id v8 = v3;
      ne_session_get_info();

      v9 = ne_log_obj();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v8;
        _os_log_impl(&dword_19DDAF000, v9, OS_LOG_TYPE_INFO, "%@ established connection with nesm for configuration id: %@", buf, 0x16u);
      }
    }
    else
    {
      id v10 = ne_log_obj();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v3;
        _os_log_error_impl(&dword_19DDAF000, v10, OS_LOG_TYPE_ERROR, "%@: failed to create ne_session for configuration id: %@", buf, 0x16u);
      }
    }
    objc_sync_exit(v4);
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

void __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke(uint64_t a1, int a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a2 == 2)
  {
    id v3 = ne_log_obj();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = *(void *)(a1 + 32);
      if (v5) {
        id Property = objc_getProperty(*(id *)(a1 + 32), v4, 32, 1);
      }
      else {
        id Property = 0;
      }
      id v7 = [Property identifier];
      *(_DWORD *)buf = 138412546;
      uint64_t v11 = v5;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_INFO, "%@ cancelling nesm connection for [%@]", buf, 0x16u);
    }
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8)
    {
      if (*(void *)(v8 + 40))
      {
        ne_session_release();
        uint64_t v9 = *(void *)(a1 + 32);
        if (v9) {
          *(void *)(v9 + 40) = 0;
        }
      }
    }
  }
  else if (a2 == 1)
  {
    ne_session_get_info();
  }
}

void __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke_22(uint64_t a1, void *a2)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = v3;
  if (v3 && MEMORY[0x19F3B92C0](v3) == MEMORY[0x1E4F14590])
  {
    BOOL v5 = xpc_dictionary_get_BOOL(v4, "IsAppPushActive");
    BOOL v6 = ne_log_obj();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      uint64_t v8 = *(void *)(a1 + 40);
      uint64_t v9 = "[inactive]";
      if (v5) {
        uint64_t v9 = "[active]";
      }
      int v10 = 138412802;
      uint64_t v11 = v7;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      __int16 v14 = 2080;
      id v15 = v9;
      _os_log_impl(&dword_19DDAF000, v6, OS_LOG_TYPE_INFO, "%@ fetched extended status, new active value for [%@] is %s", (uint8_t *)&v10, 0x20u);
    }

    [*(id *)(a1 + 32) setActive:v5];
  }
}

uint64_t __73__NEAppPushManager_establishSessionManagerConnectionWithConfigurationID___block_invoke_2(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  BOOL v3 = xpc_dictionary_get_BOOL(xdict, "IsAppPushActive");
  uint64_t v4 = ne_log_obj();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (v6) {
      id Property = objc_getProperty(*(id *)(a1 + 32), v5, 32, 1);
    }
    else {
      id Property = 0;
    }
    uint64_t v8 = [Property identifier];
    uint64_t v9 = (void *)v8;
    int v10 = "[inactive]";
    int v12 = 138412802;
    uint64_t v13 = v6;
    if (v3) {
      int v10 = "[active]";
    }
    __int16 v14 = 2112;
    uint64_t v15 = v8;
    __int16 v16 = 2080;
    uint64_t v17 = v10;
    _os_log_impl(&dword_19DDAF000, v4, OS_LOG_TYPE_INFO, "%@ fetched extended status, new active value for [%@] is %s", (uint8_t *)&v12, 0x20u);
  }
  return [*(id *)(a1 + 32) setActive:v3];
}

- (void)dealloc
{
  -[NEAppPushManager cancelSessionManagerConnection](self);
  v3.receiver = self;
  v3.super_class = (Class)NEAppPushManager;
  [(NEAppPushManager *)&v3 dealloc];
}

- (NEAppPushManager)init
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (!self) {
    return 0;
  }
  v20.receiver = self;
  v20.super_class = (Class)NEAppPushManager;
  id v2 = [(NEAppPushManager *)&v20 init];
  if (v2)
  {
    if (+[NEProvider isRunningInProvider])
    {
      objc_super v3 = ne_log_obj();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v2;
        _os_log_error_impl(&dword_19DDAF000, v3, OS_LOG_TYPE_ERROR, "%@ objects cannot be instantiated from NEProvider processes", buf, 0xCu);
      }

      return 0;
    }
    uint64_t v4 = [MEMORY[0x1E4F28B50] mainBundle];
    BOOL v5 = [v4 infoDictionary];
    uint64_t v6 = [v5 objectForKey:*MEMORY[0x1E4F1CC48]];

    uint64_t v7 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v8 = [v7 bundleIdentifier];

    if (!v6)
    {
      uint64_t v9 = [MEMORY[0x1E4F28B50] mainBundle];
      int v10 = [v9 infoDictionary];
      uint64_t v6 = [v10 objectForKey:*MEMORY[0x1E4F1D008]];
    }
    uint64_t v11 = [[NEConfiguration alloc] initWithName:v6 grade:1];
    objc_setProperty_atomic_copy(v2, v12, v11, 32);

    uint64_t v13 = objc_alloc_init(NEAppPush);
    objc_msgSend(objc_getProperty(v2, v14, 32, 1), "setAppPush:", v13);

    objc_msgSend(objc_getProperty(v2, v15, 32, 1), "setApplication:", v8);
    objc_msgSend(objc_getProperty(v2, v16, 32, 1), "setApplicationName:", v6);
    uint64_t v18 = objc_msgSend(objc_getProperty(v2, v17, 32, 1), "appPush");
    [v18 setPluginType:v8];

    v2->_nesmConnection = 0;
    v2->_active = 0;
  }
  return v2;
}

+ (void)loadAllFromPreferencesWithCompletionHandler:(void *)completionHandler
{
  uint64_t v4 = completionHandler;
  if (v4)
  {
    id v5 = +[NEAppPushManager loadedManagers]();
    uint64_t v6 = +[NEConfigurationManager sharedManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke;
    v7[3] = &unk_1E59933C0;
    id v9 = a1;
    id v8 = v4;
    [v6 loadConfigurationsWithCompletionQueue:MEMORY[0x1E4F14428] handler:v7];
  }
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = a1;
  id obj = *(id *)(a1 + 40);
  objc_sync_enter(obj);
  __int16 v34 = v6;
  int v32 = v5;
  if (v6)
  {
    id v8 = ne_log_obj();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v31 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v31;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_error_impl(&dword_19DDAF000, v8, OS_LOG_TYPE_ERROR, "%@ Failed to load the configurations: %@", buf, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v59 = __Block_byref_object_copy__6807;
    v60 = __Block_byref_object_dispose__6808;
    id v61 = 0;
    v55[0] = 0;
    v55[1] = v55;
    v55[2] = 0x3032000000;
    v55[3] = __Block_byref_object_copy__6807;
    v55[4] = __Block_byref_object_dispose__6808;
    id v56 = 0;
    id v9 = dispatch_group_create();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v10 = v5;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v52 != v12) {
            objc_enumerationMutation(v10);
          }
          SEL v14 = *(void **)(*((void *)&v51 + 1) + 8 * i);
          if (v14)
          {
            SEL v15 = [*(id *)(*((void *)&v51 + 1) + 8 * i) appPush];
            BOOL v16 = v15 == 0;

            if (!v16)
            {
              SEL v17 = +[NEAppPushManager loadedManagers]();
              uint64_t v18 = [v14 identifier];
              uint64_t v19 = [v17 objectForKeyedSubscript:v18];

              if (!*(void *)(*(void *)&buf[8] + 40))
              {
                id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                __int16 v21 = *(void **)(*(void *)&buf[8] + 40);
                *(void *)(*(void *)&buf[8] + 40) = v20;
              }
              dispatch_group_enter(v9);
              if (v19)
              {
                v39[0] = MEMORY[0x1E4F143A8];
                v39[1] = 3221225472;
                v39[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_26;
                v39[3] = &unk_1E598FE78;
                id v22 = v19;
                uint64_t v23 = *(void *)(v7 + 40);
                __int16 v42 = buf;
                id v43 = v55;
                uint64_t v44 = v23;
                v40[0] = v22;
                v40[1] = v14;
                v41 = v9;
                [(NEAppPushManager *)v22 loadFromPreferencesWithCompletionHandler:v39];

                v24 = (id *)v40;
              }
              else
              {
                uint64_t v25 = objc_alloc_init(NEAppPushManager);
                uint64_t v26 = +[NEConfigurationManager sharedManager];
                v27 = [v14 identifier];
                uint64_t v28 = MEMORY[0x1E4F14428];
                id v29 = MEMORY[0x1E4F14428];
                v45[0] = MEMORY[0x1E4F143A8];
                v45[1] = 3221225472;
                void v45[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_24;
                v45[3] = &unk_1E598FE50;
                id v22 = v25;
                uint64_t v30 = *(void *)(v7 + 40);
                v46 = v22;
                uint64_t v50 = v30;
                v48 = v55;
                v49 = buf;
                v47 = v9;
                [v26 loadConfigurationWithID:v27 withCompletionQueue:v28 handler:v45];

                v24 = (id *)&v46;
              }
            }
          }
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v51 objects:v57 count:16];
      }
      while (v11);
    }

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_27;
    block[3] = &unk_1E598FEA0;
    id v37 = v55;
    uint64_t v38 = buf;
    id v36 = *(id *)(v7 + 32);
    dispatch_group_notify(v9, MEMORY[0x1E4F14428], block);

    _Block_object_dispose(v55, 8);
    _Block_object_dispose(buf, 8);
  }
  objc_sync_exit(obj);
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_24(uint64_t a1, void *a2, void *a3)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = ne_log_obj();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v20 = *(void *)(a1 + 64);
      int v22 = 138412546;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      id v25 = v6;
      _os_log_error_impl(&dword_19DDAF000, v7, OS_LOG_TYPE_ERROR, "%@ loadConfigurationWithID failed. error: %@", (uint8_t *)&v22, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), a3);
  }
  else
  {
    id v8 = *(void **)(a1 + 32);
    id v9 = [v5 identifier];
    LOBYTE(v8) = -[NEAppPushManager establishSessionManagerConnectionWithConfigurationID:](v8, v9);

    if (v8)
    {
      uint64_t v11 = *(void **)(a1 + 32);
      if (v11 && (objc_setProperty_atomic_copy(v11, v10, v5, 32), (uint64_t v12 = *(void *)(a1 + 32)) != 0))
      {
        *(unsigned char *)(v12 + 9) = 1;
        uint64_t v13 = *(void *)(a1 + 32);
      }
      else
      {
        uint64_t v13 = 0;
      }
      SEL v14 = +[NEAppPushManager loadedManagers]();
      SEL v15 = [v5 identifier];
      [v14 setObject:v13 forKeyedSubscript:v15];

      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:*(void *)(a1 + 32)];
    }
    else
    {
      BOOL v16 = ne_log_obj();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        uint64_t v21 = *(void *)(a1 + 64);
        int v22 = 138412290;
        uint64_t v23 = v21;
        _os_log_error_impl(&dword_19DDAF000, v16, OS_LOG_TYPE_ERROR, "%@ establishSessionManagerConnectionWithConfigurationID failed.", (uint8_t *)&v22, 0xCu);
      }

      uint64_t v17 = [MEMORY[0x1E4F28C58] errorWithDomain:@"NEAppPushErrorDomain" code:1 userInfo:0];
      uint64_t v18 = *(void *)(*(void *)(a1 + 48) + 8);
      uint64_t v19 = *(void **)(v18 + 40);
      *(void *)(v18 + 40) = v17;
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_26(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  if (v4)
  {
    id v5 = ne_log_obj();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 72);
      int v10 = 138412546;
      uint64_t v11 = v9;
      __int16 v12 = 2112;
      id v13 = v4;
      _os_log_error_impl(&dword_19DDAF000, v5, OS_LOG_TYPE_ERROR, "%@ loadFromPreferencesWithCompletionHandler failed. error: %@", (uint8_t *)&v10, 0x16u);
    }

    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
    id v6 = +[NEAppPushManager loadedManagers]();
    uint64_t v7 = [*(id *)(a1 + 40) identifier];
    [v6 removeObjectForKey:v7];

    -[NEAppPushManager cancelSessionManagerConnection](*(void **)(a1 + 32));
  }
  else
  {
    uint64_t v8 = *(void *)(a1 + 32);
    if (v8 && *(void *)(v8 + 40)) {
      objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addObject:");
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void __64__NEAppPushManager_loadAllFromPreferencesWithCompletionHandler___block_invoke_27(void *a1)
{
  if (*(void *)(*(void *)(a1[5] + 8) + 40))
  {
    [*(id *)(*(void *)(a1[6] + 8) + 40) removeAllObjects];
    uint64_t v2 = *(void *)(a1[6] + 8);
    objc_super v3 = *(void **)(v2 + 40);
    *(void *)(v2 + 40) = 0;
  }
  (*(void (**)(void))(a1[4] + 16))();
  self;
  if (!initCallKitXPCClient_client)
  {
    id v4 = MEMORY[0x1E4F14428];
    dispatch_async(v4, &__block_literal_global_6836);
  }
}

void __40__NEAppPushManager_initCallKitXPCClient__block_invoke()
{
  uint64_t v0 = objc_alloc_init(NEAppPushCallKitXPCClient);
  uint64_t v1 = (void *)initCallKitXPCClient_client;
  initCallKitXPCClient_client = (uint64_t)v0;

  uint64_t v2 = initCallKitXPCClient_client;

  -[NEAppPushCallKitXPCClient registerVoIPMessagePayload](v2);
}

void __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = v7;
  int v10 = *(void **)(a1 + 32);
  uint64_t v11 = [v9 UUIDString];
  LODWORD(v10) = [v10 isEqualToString:v11];

  if (v10)
  {
    id v12 = v8;
    id v13 = ne_log_obj();
    uint64_t v14 = v13;
    if (v12)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v20 = *(void *)(a1 + 32);
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = v20;
        _os_log_debug_impl(&dword_19DDAF000, v14, OS_LOG_TYPE_DEBUG, "found manager[%@] to deliver incoming call payload to", buf, 0xCu);
      }

      SEL v15 = [v12 delegate];

      if (v15)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke_45;
        block[3] = &unk_1E5992CA0;
        uint64_t v23 = v12;
        id v24 = *(id *)(a1 + 40);
        id v25 = *(id *)(a1 + 48);
        dispatch_async(MEMORY[0x1E4F14428], block);

        uint64_t v14 = v23;
LABEL_10:

        *a4 = 1;
        goto LABEL_11;
      }
      uint64_t v14 = ne_log_obj();
      if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      uint64_t v21 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      uint64_t v27 = v21;
      uint64_t v17 = "%@ app has not set the delegate to receive the incoming call payload";
      uint64_t v18 = v14;
      uint32_t v19 = 12;
    }
    else
    {
      if (!os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        goto LABEL_10;
      }
      uint64_t v16 = *(void *)(a1 + 56);
      *(_DWORD *)buf = 138412546;
      uint64_t v27 = v16;
      __int16 v28 = 2112;
      id v29 = v9;
      uint64_t v17 = "%@ failed to find a manager for configuration id [%@]";
      uint64_t v18 = v14;
      uint32_t v19 = 22;
    }
    _os_log_error_impl(&dword_19DDAF000, v18, OS_LOG_TYPE_ERROR, v17, buf, v19);
    goto LABEL_10;
  }
LABEL_11:
}

uint64_t __69__NEAppPushManager_deliverIncomingCallPayload_withCompletionHandler___block_invoke_45(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  [v2 appPushManager:*(void *)(a1 + 32) didReceiveIncomingCallWithUserInfo:*(void *)(a1 + 40)];

  objc_super v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v3();
}

@end