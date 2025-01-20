@interface AALoginPluginManager
+ (id)sharedInstance;
- (AALoginPluginManager)init;
- (BOOL)_notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 rawPassword:(id)a6;
- (BOOL)shouldSkipiTunesPlugin;
- (BOOL)shouldStashLoginResponse;
- (id)_createLoginContextForAppleID:(id)a3 rawPassword:(id)a4 loginResponse:(id)a5;
- (id)_idsPlugin;
- (id)_loadPluginsLimitedToBundleIDs:(id)a3;
- (id)_plugins;
- (id)collectParametersForIdentityEstablishmentRequest;
- (id)collectParametersForLoginRequest;
- (void)notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 completion:(id)a6;
- (void)notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 rawPassword:(id)a6 completion:(id)a7;
- (void)restrictToPluginBundleIDs:(id)a3;
- (void)setShouldSkipiTunesPlugin:(BOOL)a3;
- (void)setShouldStashLoginResponse:(BOOL)a3;
- (void)unstashLoginResponse;
@end

@implementation AALoginPluginManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1) {
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_19);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __38__AALoginPluginManager_sharedInstance__block_invoke()
{
  sharedInstance_sharedInstance = objc_alloc_init(AALoginPluginManager);

  return MEMORY[0x1F41817F8]();
}

- (AALoginPluginManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)AALoginPluginManager;
  v2 = [(AALoginPluginManager *)&v6 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.AppleIDLoginPlugins", MEMORY[0x1E4F14430]);
    pluginNotificationQueue = v2->_pluginNotificationQueue;
    v2->_pluginNotificationQueue = (OS_dispatch_queue *)v3;
  }
  return v2;
}

- (void)restrictToPluginBundleIDs:(id)a3
{
  self->_allowedPluginBundleIDs = (NSArray *)[a3 copy];

  MEMORY[0x1F41817F8]();
}

- (id)_plugins
{
  plugins = self->_plugins;
  if (!plugins)
  {
    v4 = [(AALoginPluginManager *)self _loadPluginsLimitedToBundleIDs:self->_allowedPluginBundleIDs];
    v5 = self->_plugins;
    self->_plugins = v4;

    plugins = self->_plugins;
  }

  return plugins;
}

- (id)_idsPlugin
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  idsPlugin = self->_idsPlugin;
  if (!idsPlugin)
  {
    v4 = [MEMORY[0x1E4F28CB8] defaultManager];
    v5 = [v4 URLsForDirectory:5 inDomains:8];
    objc_super v6 = [v5 firstObject];

    v7 = [v6 URLByAppendingPathComponent:@"SetupAssistantBundles/SBSyncServiceSetupAssistantBundle.bundle"];
    v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v7];
    v9 = (AASetupAssistantDelegateService *)objc_alloc_init((Class)[v8 principalClass]);
    v10 = self->_idsPlugin;
    self->_idsPlugin = v9;

    v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v12 = self->_idsPlugin;
      int v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: hacked IDS plugin loaded %@", (uint8_t *)&v14, 0xCu);
    }

    idsPlugin = self->_idsPlugin;
  }

  return idsPlugin;
}

- (id)collectParametersForLoginRequest
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  v4 = [(AALoginPluginManager *)self _plugins];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v28;
    *(void *)&long long v6 = 138412546;
    long long v26 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v28 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "parametersForLoginRequest", v26);
        v12 = [v10 serviceIdentifier];
        v13 = v12;
        if (v12) {
          BOOL v14 = v11 == 0;
        }
        else {
          BOOL v14 = 1;
        }
        if (v14)
        {
          v15 = _AALogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v26;
            v32 = v13;
            __int16 v33 = 2112;
            v34 = v11;
            uint64_t v16 = v15;
            v17 = "AALoginPluginManager: collectParametersForLoginRequest is skipping plugin with ID %@ and params %@";
            uint32_t v18 = 22;
            goto LABEL_17;
          }
LABEL_18:

          goto LABEL_20;
        }
        if (self->_shouldSkipiTunesPlugin
          && [v12 isEqualToString:@"com.apple.itunes"])
        {
          v15 = _AALogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            uint64_t v16 = v15;
            v17 = "AALoginPluginManager is skipping iTunes plugin.";
            uint32_t v18 = 2;
LABEL_17:
            _os_log_impl(&dword_1A11D8000, v16, OS_LOG_TYPE_DEFAULT, v17, buf, v18);
          }
          goto LABEL_18;
        }
        [v3 setObject:v11 forKey:v13];
LABEL_20:
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v7);
  }

  v19 = [(AALoginPluginManager *)self _idsPlugin];
  v20 = [v19 delegateServiceIdentifier];

  v21 = [(AALoginPluginManager *)self _idsPlugin];
  v22 = [v21 accountSetupRequestParameters];

  if (v20 && v22)
  {
    [v3 setObject:v22 forKey:v20];
  }
  else
  {
    v23 = _AALogSystem();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      v24 = [(AALoginPluginManager *)self _idsPlugin];
      *(_DWORD *)buf = 138412546;
      v32 = v24;
      __int16 v33 = 2112;
      v34 = v22;
      _os_log_impl(&dword_1A11D8000, v23, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: collectParametersForLoginRequest is skipping IDS plugin %@ with params %@", buf, 0x16u);
    }
  }

  return v3;
}

- (id)collectParametersForIdentityEstablishmentRequest
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  v4 = [(AALoginPluginManager *)self _plugins];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v31 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v20;
    *(void *)&long long v6 = 138412290;
    long long v18 = v6;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v4);
        }
        v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        v11 = objc_msgSend(v10, "parametersForIdentityEstablishmentRequest", v18);
        v12 = [v10 serviceIdentifier];
        v13 = _AALogSystem();
        BOOL v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
        if (v12) {
          BOOL v15 = v11 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (v15)
        {
          if (v14)
          {
            *(_DWORD *)buf = 138412546;
            long long v26 = v12;
            __int16 v27 = 2112;
            long long v28 = v11;
            _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: collectParametersForIdentityEstablishmentRequest is skipping plugin with ID %@ and params %@", buf, 0x16u);
          }
        }
        else
        {
          if (v14)
          {
            *(_DWORD *)buf = v18;
            long long v26 = v12;
            _os_log_impl(&dword_1A11D8000, v13, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: collectParametersForIdentityEstablishmentRequest got parameters from plugin %@", buf, 0xCu);
          }

          long long v29 = @"service-data";
          long long v30 = v11;
          v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v30 forKeys:&v29 count:1];
          [v3 setObject:v13 forKeyedSubscript:v12];
        }
      }
      uint64_t v7 = [v4 countByEnumeratingWithState:&v19 objects:v31 count:16];
    }
    while (v7);
  }

  v23 = @"client-info";
  id v24 = v3;
  uint64_t v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];

  return v16;
}

- (void)notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 completion:(id)a6
{
}

- (void)notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 rawPassword:(id)a6 completion:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v17 = dispatch_get_global_queue(0, 0);
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __97__AALoginPluginManager_notifyServicesOfLoginResponse_forAppleID_password_rawPassword_completion___block_invoke;
  v23[3] = &unk_1E5A49E58;
  v23[4] = self;
  id v24 = v12;
  id v25 = v13;
  id v26 = v14;
  id v27 = v15;
  id v28 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v17, v23);
}

uint64_t __97__AALoginPluginManager_notifyServicesOfLoginResponse_forAppleID_password_rawPassword_completion___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _notifyServicesOfLoginResponse:*(void *)(a1 + 40) forAppleID:*(void *)(a1 + 48) password:*(void *)(a1 + 56) rawPassword:*(void *)(a1 + 64)];
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);

  return v2();
}

- (id)_createLoginContextForAppleID:(id)a3 rawPassword:(id)a4 loginResponse:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = _AALogSystem();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v7;
    _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: creating login context for stashing (appleID: %@)...", buf, 0xCu);
  }

  if (!v9)
  {
    v11 = _AALogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: bad news, no password for stashing!", buf, 2u);
    }
  }
  id v12 = [v8 responseParametersForServiceIdentifier:@"com.apple.mobileme"];
  id v13 = [v12 objectForKeyedSubscript:@"service-data"];
  id v14 = [v13 objectForKeyedSubscript:@"appleAccountInfo"];
  id v15 = [v14 objectForKeyedSubscript:@"aDsID"];

  if (!v15)
  {
    id v15 = _AALogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: no altDSID was found in iCloud service data!", buf, 2u);
    }
    uint64_t v16 = 0;
    goto LABEL_13;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v16 = [v15 stringValue];
LABEL_13:

    id v15 = v16;
  }
  v17 = [v8 dsid];
  if (v17) {
    goto LABEL_18;
  }
  id v18 = _AALogSystem();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v18, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: checking iCloud service data for DSID...", buf, 2u);
  }

  id v19 = [v12 objectForKeyedSubscript:@"service-data"];
  id v20 = [v19 objectForKeyedSubscript:@"appleAccountInfo"];
  v17 = [v20 objectForKeyedSubscript:@"dsPrsID"];

  if (v17)
  {
LABEL_18:
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0) {
      goto LABEL_24;
    }
    uint64_t v21 = [v17 stringValue];
  }
  else
  {
    v17 = _AALogSystem();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v17, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: no DSID was found in iCloud service data!", buf, 2u);
    }
    uint64_t v21 = 0;
  }

  v17 = v21;
LABEL_24:
  id v22 = [v12 objectForKeyedSubscript:@"service-data"];
  v23 = [v22 objectForKeyedSubscript:@"tokens"];

  id v24 = [v23 objectForKeyedSubscript:@"cloudKitToken"];
  if (!v24)
  {
    id v25 = _AALogSystem();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v25, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: no CloudKit token in iCloud service data!", buf, 2u);
    }
  }
  v39 = v12;
  v40 = v8;
  id v26 = _AALogSystem();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = (objc_class *)objc_opt_class();
    id v28 = NSStringFromClass(v27);
    *(_DWORD *)buf = 138412546;
    v42 = v15;
    __int16 v43 = 2112;
    v44 = v28;
    _os_log_impl(&dword_1A11D8000, v26, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: using altDSID %@ (%@)", buf, 0x16u);
  }
  long long v29 = v7;
  long long v30 = [[AAStorableLoginContext alloc] initWithAppleID:v7 altDSID:v15];
  [(AAStorableLoginContext *)v30 setCloudKitToken:v24];
  [(AAStorableLoginContext *)v30 setDSID:v17];
  [(AAStorableLoginContext *)v30 setRawPassword:v9];

  v31 = [MEMORY[0x1E4F179C8] defaultStore];
  uint64_t v32 = objc_msgSend(v31, "aa_authKitAccountForAltDSID:", v15);
  __int16 v33 = v32;
  if (v32)
  {
    v34 = [v32 credential];
    v35 = _AALogSystem();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v33;
      _os_log_impl(&dword_1A11D8000, v35, OS_LOG_TYPE_DEFAULT, "Trying to add CK and PRK for %@ to login context...", buf, 0xCu);
    }

    uint64_t v36 = [v34 credentialItemForKey:*MEMORY[0x1E4F178B0]];
    [(AAStorableLoginContext *)v30 setContinuationKey:v36];

    v37 = [v34 credentialItemForKey:*MEMORY[0x1E4F17948]];
    [(AAStorableLoginContext *)v30 setPasswordResetKey:v37];
  }
  else
  {
    v34 = _AALogSystem();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v15;
      _os_log_impl(&dword_1A11D8000, v34, OS_LOG_TYPE_DEFAULT, "No AuthKit account to grab CK and PRK from for altDSID: %@", buf, 0xCu);
    }
  }

  return v30;
}

- (BOOL)_notifyServicesOfLoginResponse:(id)a3 forAppleID:(id)a4 password:(id)a5 rawPassword:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v38 = a4;
  id v37 = a5;
  id v35 = a6;
  v11 = _AALogSystem();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v11, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: will notify services of login response.", buf, 2u);
  }

  *(void *)buf = 0;
  v55 = buf;
  uint64_t v56 = 0x2020000000;
  char v57 = 1;
  if (v10)
  {
    id v12 = self;
    objc_sync_enter(v12);
    if (v12->_shouldStashLoginResponse)
    {
      id v13 = [(AALoginPluginManager *)v12 _createLoginContextForAppleID:v38 rawPassword:v35 loginResponse:v10];
      id v14 = +[AALoginContextManager sharedManager];
      [v14 setStashedContext:v13];
    }
    objc_sync_exit(v12);
  }
  group = dispatch_group_create();
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v15 = [(AALoginPluginManager *)self _plugins];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v50 objects:v58 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v51;
    id obj = v15;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v51 != v17) {
          objc_enumerationMutation(obj);
        }
        id v19 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        id v20 = objc_msgSend(v19, "serviceIdentifier", v35);
        uint64_t v21 = v20;
        if (self->_shouldSkipiTunesPlugin
          && [v20 isEqualToString:@"com.apple.itunes"])
        {
          id v22 = _AALogSystem();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v49 = 0;
            _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager is NOT notifying iTunes plugin about login because _shouldSkipiTunesPlugin is YES.", v49, 2u);
          }
        }
        else
        {
          v23 = [v10 dsid];
          id v24 = [v10 altDSID];
          id v25 = [v10 augmentedResponseParametersForServiceIdentifier:v21 withAppleID:v38 password:v37 DSID:v23 altDSID:v24];

          pluginNotificationQueue = self->_pluginNotificationQueue;
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke;
          block[3] = &unk_1E5A49EA8;
          id v45 = v21;
          v46 = v19;
          id v47 = v25;
          v48 = buf;
          id v22 = v25;
          dispatch_group_async(group, pluginNotificationQueue, block);
        }
      }
      id v15 = obj;
      uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v58 count:16];
    }
    while (v16);
  }

  id v27 = self->_pluginNotificationQueue;
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_46;
  v40[3] = &unk_1E5A49EF8;
  v40[4] = self;
  id v28 = v10;
  id v41 = v28;
  id v29 = v38;
  id v42 = v29;
  id v30 = v37;
  id v43 = v30;
  dispatch_group_async(group, v27, v40);
  dispatch_time_t v31 = dispatch_time(0, 60000000000);
  if (dispatch_group_wait(group, v31))
  {
    uint64_t v32 = _AALogSystem();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v49 = 0;
      _os_log_impl(&dword_1A11D8000, v32, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: timed out while notifying plugins!", v49, 2u);
    }

    BOOL v33 = 1;
  }
  else
  {
    BOOL v33 = v55[24] != 0;
  }

  _Block_object_dispose(buf, 8);
  return v33;
}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v2 = _AALogSystem();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1A11D8000, v2, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: notifying plugin %@ of login response...", buf, 0xCu);
  }

  dispatch_semaphore_t v4 = dispatch_semaphore_create(0);
  uint64_t v5 = *(void **)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_44;
  v10[3] = &unk_1E5A49E80;
  id v7 = *(id *)(a1 + 32);
  uint64_t v8 = *(void *)(a1 + 56);
  dispatch_semaphore_t v12 = v4;
  uint64_t v13 = v8;
  id v11 = v7;
  id v9 = v4;
  [v5 handleLoginResponse:v6 completion:v10];
  dispatch_semaphore_wait(v9, 0xFFFFFFFFFFFFFFFFLL);
}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_44(uint64_t a1, int a2, void *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = _AALogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    int v11 = 138412802;
    uint64_t v12 = v7;
    __int16 v13 = 1024;
    int v14 = a2;
    __int16 v15 = 2112;
    id v16 = v5;
    _os_log_impl(&dword_1A11D8000, v6, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: plugin %@ finished handling login response with success %d and error %@", (uint8_t *)&v11, 0x1Cu);
  }

  int v8 = [*(id *)(a1 + 32) isEqualToString:@"com.apple.mobileme"];
  if (a2)
  {
    if (v8)
    {
      char v9 = 1;
LABEL_10:
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v9;
    }
  }
  else if (v8)
  {
    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Fatal error! The iCloud plugin failed while handling the login response.", (uint8_t *)&v11, 2u);
    }

    char v9 = 0;
    goto LABEL_10;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_46(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) _idsPlugin];
  uint64_t v3 = [v2 delegateServiceIdentifier];

  if (v3)
  {
    dispatch_semaphore_t v4 = *(void **)(a1 + 40);
    uint64_t v5 = *(void *)(a1 + 48);
    uint64_t v6 = *(void *)(a1 + 56);
    uint64_t v7 = [v4 dsid];
    int v8 = [*(id *)(a1 + 40) altDSID];
    char v9 = [v4 augmentedResponseParametersForServiceIdentifier:v3 withAppleID:v5 password:v6 DSID:v7 altDSID:v8];

    id v10 = _AALogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v10, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: about to notify IDS plugin of login response.", buf, 2u);
    }

    dispatch_semaphore_t v11 = dispatch_semaphore_create(0);
    uint64_t v12 = [*(id *)(a1 + 32) _idsPlugin];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_47;
    v14[3] = &unk_1E5A49ED0;
    dispatch_semaphore_t v15 = v11;
    __int16 v13 = v11;
    [v12 completeSetupWithResponseParameters:v9 handler:v14];

    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    char v9 = _AALogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A11D8000, v9, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: idsServiceID is nil. Skipping...", buf, 2u);
    }
  }
}

void __87__AALoginPluginManager__notifyServicesOfLoginResponse_forAppleID_password_rawPassword___block_invoke_47(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = _AALogSystem();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v4;
    _os_log_impl(&dword_1A11D8000, v5, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: finished notifying IDS. Error: %@", (uint8_t *)&v6, 0xCu);
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)shouldStashLoginResponse
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL shouldStashLoginResponse = v2->_shouldStashLoginResponse;
  objc_sync_exit(v2);

  return shouldStashLoginResponse;
}

- (void)setShouldStashLoginResponse:(BOOL)a3
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_BOOL shouldStashLoginResponse = a3;
  objc_sync_exit(obj);
}

- (void)unstashLoginResponse
{
  id obj = self;
  objc_sync_enter(obj);
  if (obj->_shouldStashLoginResponse)
  {
    v2 = +[AALoginContextManager sharedManager];
    [v2 persistStashedContext];
  }
  objc_sync_exit(obj);
}

- (id)_loadPluginsLimitedToBundleIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = _AALogSystem();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v4, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Loading plugin bundles...", buf, 2u);
  }

  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2050000000;
  uint64_t v5 = (void *)getACDPluginLoaderClass_softClass;
  uint64_t v34 = getACDPluginLoaderClass_softClass;
  if (!getACDPluginLoaderClass_softClass)
  {
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&uint8_t buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = __getACDPluginLoaderClass_block_invoke;
    id v37 = &unk_1E5A48F98;
    id v38 = &v31;
    __getACDPluginLoaderClass_block_invoke((uint64_t)buf);
    uint64_t v5 = (void *)v32[3];
  }
  id v6 = v5;
  _Block_object_dispose(&v31, 8);
  id v7 = [v6 pluginBundlesAtSubpath:@"/AppleIDLoginPlugins/"];
  uint64_t v8 = _AALogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v7 count];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v9;
    _os_log_impl(&dword_1A11D8000, v8, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: found %lu service bundles.", buf, 0xCu);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v7;
  uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v28 != v11) {
          objc_enumerationMutation(obj);
        }
        __int16 v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        int v14 = _AALogSystem();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v13;
          _os_log_impl(&dword_1A11D8000, v14, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: processing plugin bundle %@.", buf, 0xCu);
        }

        if (v3
          && (v26[0] = MEMORY[0x1E4F143A8],
              v26[1] = 3221225472,
              v26[2] = __55__AALoginPluginManager__loadPluginsLimitedToBundleIDs___block_invoke,
              v26[3] = &unk_1E5A49F20,
              v26[4] = v13,
              [v3 indexOfObjectPassingTest:v26] == 0x7FFFFFFFFFFFFFFFLL))
        {
          dispatch_semaphore_t v15 = _AALogSystem();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            id v16 = [v13 bundleIdentifier];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v16;
            _os_log_impl(&dword_1A11D8000, v15, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: skipping plugin %@.", buf, 0xCu);
          }
        }
        else
        {
          uint64_t v17 = (objc_class *)[v13 principalClass];
          if ([(objc_class *)v17 conformsToProtocol:&unk_1EF4A12A0])
          {
            id v18 = objc_alloc_init(v17);
            id v19 = v18;
            if (v18)
            {
              id v20 = [v18 serviceIdentifier];
              if (v20)
              {
                [v24 addObject:v19];
              }
              else
              {
                uint64_t v21 = _AALogSystem();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v19;
                  _os_log_impl(&dword_1A11D8000, v21, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Error! Service %@ has no identifier", buf, 0xCu);
                }
              }
            }
            else
            {
              id v20 = _AALogSystem();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v17;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v13;
                _os_log_impl(&dword_1A11D8000, v20, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Could not instantiate object of class %@ for bundle %@", buf, 0x16u);
              }
            }
          }
          else
          {
            id v19 = _AALogSystem();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&uint8_t buf[4] = v17;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v13;
              _os_log_impl(&dword_1A11D8000, v19, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Principal class %@ does not conform to AAAppleIDLoginPlugin for bundle %@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v10);
  }

  id v22 = _AALogSystem();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A11D8000, v22, OS_LOG_TYPE_DEFAULT, "AALoginPluginManager: Finished loading service bundles.", buf, 2u);
  }

  return v24;
}

uint64_t __55__AALoginPluginManager__loadPluginsLimitedToBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 lowercaseString];
  id v4 = [*(id *)(a1 + 32) bundleIdentifier];
  uint64_t v5 = [v4 lowercaseString];
  uint64_t v6 = [v3 isEqualToString:v5];

  return v6;
}

- (BOOL)shouldSkipiTunesPlugin
{
  return self->_shouldSkipiTunesPlugin;
}

- (void)setShouldSkipiTunesPlugin:(BOOL)a3
{
  self->_shouldSkipiTunesPlugin = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idsPlugin, 0);
  objc_storeStrong((id *)&self->_pluginNotificationQueue, 0);
  objc_storeStrong((id *)&self->_plugins, 0);

  objc_storeStrong((id *)&self->_allowedPluginBundleIDs, 0);
}

@end