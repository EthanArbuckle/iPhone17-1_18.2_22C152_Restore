@interface VSDeveloperModeStore
- (OS_dispatch_queue)settingsQueue;
- (VSDeveloperModeStore)init;
- (VSPersistentContainer)persistentContainer;
- (VSRemoteNotifier)accountStoreChangeRemoteNotifier;
- (VSRemoteNotifier)providersChangeRemoteNotifier;
- (VSRemoteNotifier)serviceChangeRemoteNotifier;
- (VSRemoteNotifier)settingsChangeRemoteNotifier;
- (id)_developerIdentityProviderInContext:(id)a3;
- (id)_identityProviderFetchRequest;
- (id)_nullableObjectOrNSNull:(id)a3;
- (id)legacySettingsPropertiesPath;
- (id)settingsPropertiesURL;
- (void)_noteProvidersDidChange;
- (void)_noteServiceDidChange;
- (void)_noteSettingsDidChange;
- (void)_performIdentityProviderBlock:(id)a3;
- (void)addDeveloperIdentityProvider:(id)a3 completionHandler:(id)a4;
- (void)fetchDeveloperIdentityProvidersWithCompletionHandler:(id)a3;
- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3;
- (void)legacySettingsPropertiesPath;
- (void)migrateSettingsPropertyFileIfNecessary;
- (void)removeDeveloperIdentityProviderWithUniqueID:(id)a3 completionHandler:(id)a4;
- (void)setAccountStoreChangeRemoteNotifier:(id)a3;
- (void)setPersistentContainer:(id)a3;
- (void)setProvidersChangeRemoteNotifier:(id)a3;
- (void)setServiceChangeRemoteNotifier:(id)a3;
- (void)setSettingsChangeRemoteNotifier:(id)a3;
- (void)setSettingsQueue:(id)a3;
- (void)settingsPropertiesURL;
- (void)updateDeveloperSettings:(id)a3 completionHandler:(id)a4;
- (void)updateExistingDeveloperIdentityProvider:(id)a3 completionHandler:(id)a4;
@end

@implementation VSDeveloperModeStore

- (VSDeveloperModeStore)init
{
  v16.receiver = self;
  v16.super_class = (Class)VSDeveloperModeStore;
  v2 = [(VSDeveloperModeStore *)&v16 init];
  if (v2)
  {
    v3 = objc_alloc_init(VSPersistentContainer);
    persistentContainer = v2->_persistentContainer;
    v2->_persistentContainer = v3;

    dispatch_queue_t v5 = dispatch_queue_create("Developer Settings Operation Queue", 0);
    settingsQueue = v2->_settingsQueue;
    v2->_settingsQueue = (OS_dispatch_queue *)v5;

    v7 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSDeveloperServiceDidChangeNotification"];
    serviceChangeRemoteNotifier = v2->_serviceChangeRemoteNotifier;
    v2->_serviceChangeRemoteNotifier = v7;

    v9 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSDeveloperServiceSettingsDidChangeNotification"];
    settingsChangeRemoteNotifier = v2->_settingsChangeRemoteNotifier;
    v2->_settingsChangeRemoteNotifier = v9;

    v11 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSDeveloperServiceProvidersDidChangeNotification"];
    providersChangeRemoteNotifier = v2->_providersChangeRemoteNotifier;
    v2->_providersChangeRemoteNotifier = v11;

    v13 = [[VSRemoteNotifier alloc] initWithNotificationName:@"VSAccountStoreDidChangeNotification"];
    accountStoreChangeRemoteNotifier = v2->_accountStoreChangeRemoteNotifier;
    v2->_accountStoreChangeRemoteNotifier = v13;

    [(VSDeveloperModeStore *)v2 migrateSettingsPropertyFileIfNecessary];
  }
  return v2;
}

- (id)settingsPropertiesURL
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v3 = [v2 URLsForDirectory:5 inDomains:1];
  v4 = [v3 firstObject];

  if (v4)
  {
    dispatch_queue_t v5 = v4;
    v6 = [MEMORY[0x1E4F28B50] mainBundle];
    v7 = [v6 bundleIdentifier];

    if (v7)
    {
      v8 = [v5 URLByAppendingPathComponent:v7];
      v9 = v8;
      if (v8)
      {
        v10 = [v8 path];

        if (!v10) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [containerDirectoryOrNil path] parameter must not be nil."];
        }
        v11 = [v9 path];
        char v18 = 0;
        if (([v2 fileExistsAtPath:v11 isDirectory:&v18] & 1) == 0)
        {
          id v17 = 0;
          char v12 = [v2 createDirectoryAtPath:v11 withIntermediateDirectories:0 attributes:0 error:&v17];
          id v13 = v17;
          if ((v12 & 1) == 0)
          {
            v14 = VSErrorLogObject();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
              -[VSDeveloperModeStore settingsPropertiesURL]();
            }
          }
        }
        v15 = [v9 URLByAppendingPathComponent:@"DeveloperSettings.plist"];
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = 0;
    }
  }
  else
  {
    dispatch_queue_t v5 = VSErrorLogObject();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[VSDeveloperModeStore settingsPropertiesURL]();
    }
    v15 = 0;
  }

  return v15;
}

- (id)legacySettingsPropertiesPath
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
  v3 = [v2 URLsForDirectory:9 inDomains:1];
  v4 = [v3 firstObject];

  dispatch_queue_t v5 = [MEMORY[0x1E4F28B50] mainBundle];
  v6 = [v5 bundleIdentifier];

  if (v6
    && ([v4 URLByAppendingPathComponent:v6], (v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = v7;
    v9 = [v8 path];
    if (v9)
    {
      v10 = [v8 URLByAppendingPathComponent:@"DeveloperSettings.plist"];
    }
    else
    {
      char v12 = VSErrorLogObject();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        -[VSDeveloperModeStore legacySettingsPropertiesPath]();
      }

      v10 = 0;
    }

    v11 = v8;
  }
  else
  {
    v8 = VSErrorLogObject();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[VSDeveloperModeStore legacySettingsPropertiesPath]();
    }
    v11 = 0;
    v10 = 0;
  }

  return v10;
}

- (void)migrateSettingsPropertyFileIfNecessary
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error moving legacy developer settinsgs properties: %@", v2, v3, v4, v5, v6);
}

- (id)_identityProviderFetchRequest
{
  uint64_t v2 = [(VSDeveloperModeStore *)self persistentContainer];
  uint64_t v3 = [v2 developerIdentityProviderFetchRequest];

  return v3;
}

- (id)_developerIdentityProviderInContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(VSDeveloperModeStore *)self persistentContainer];
  uint8_t v6 = [v5 insertDeveloperIdentityProviderInContext:v4];

  return v6;
}

- (void)_performIdentityProviderBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(VSDeveloperModeStore *)self persistentContainer];
  [v5 performBlock:v4];
}

- (void)_noteServiceDidChange
{
  id v2 = [(VSDeveloperModeStore *)self serviceChangeRemoteNotifier];
  [v2 postNotification];
}

- (void)_noteSettingsDidChange
{
  id v2 = [(VSDeveloperModeStore *)self settingsChangeRemoteNotifier];
  [v2 postNotification];
}

- (void)_noteProvidersDidChange
{
  id v2 = [(VSDeveloperModeStore *)self providersChangeRemoteNotifier];
  [v2 postNotification];
}

- (id)_nullableObjectOrNSNull:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA98] null];
  }
  uint8_t v6 = v5;

  return v6;
}

- (void)fetchDeveloperIdentityProvidersWithCompletionHandler:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[VSDeveloperModeStore fetchDeveloperIdentityProvidersWithCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v4) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The completionHandler parameter must not be nil."];
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E6BD2E18;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(VSDeveloperModeStore *)self fetchDeveloperSettingsWithCompletionHandler:v7];
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x3032000000;
  v9[3] = __Block_byref_object_copy__8;
  v9[4] = __Block_byref_object_dispose__8;
  id v10 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_64;
  v8[3] = &unk_1E6BD2BC8;
  v8[4] = v9;
  [v3 unwrapObject:v8 error:&__block_literal_global_30];
  id v4 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_67;
  v5[3] = &unk_1E6BD3B08;
  v5[4] = v4;
  v7 = v9;
  id v6 = *(id *)(a1 + 40);
  [v4 _performIdentityProviderBlock:v5];

  _Block_object_dispose(v9, 8);
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_64(uint64_t a1, void *a2)
{
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_2_cold_1();
  }
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_67(uint64_t a1, void *a2)
{
  v68[1] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v52 = a1;
  id v4 = [*(id *)(a1 + 32) _identityProviderFetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithValue:1];
  [v4 setPredicate:v5];

  id v6 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:@"nameForSorting" ascending:1 selector:sel_localizedCaseInsensitiveCompare_];
  v68[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v68 count:1];
  [v4 setSortDescriptors:v7];

  [v4 setReturnsObjectsAsFaults:0];
  id v63 = 0;
  id v8 = [v3 executeFetchRequest:v4 error:&v63];
  id v9 = v63;
  id v10 = v9;
  if (v8)
  {
    id v47 = v9;
    v49 = v6;
    v50 = v4;
    id v51 = v3;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v59 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    v48 = v8;
    id obj = v8;
    uint64_t v12 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
    uint64_t v13 = v52;
    v53 = v11;
    if (v12)
    {
      uint64_t v14 = v12;
      uint64_t v55 = *(void *)v60;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v60 != v55) {
            objc_enumerationMutation(obj);
          }
          objc_super v16 = *(void **)(*((void *)&v59 + 1) + 8 * i);
          id v17 = objc_alloc_init(VSIdentityProvider);
          [v11 addObject:v17];
          [(VSIdentityProvider *)v17 setDeveloper:1];
          char v18 = [v16 uniqueID];
          v19 = (void *)[v18 copy];
          v20 = +[VSOptional optionalWithObject:v19];
          [(VSIdentityProvider *)v17 setUniqueID:v20];

          v21 = [v16 providerID];
          v22 = (void *)[v21 copy];
          v23 = +[VSOptional optionalWithObject:v22];
          [(VSIdentityProvider *)v17 setProviderID:v23];

          v24 = [v16 nameForSorting];
          [(VSIdentityProvider *)v17 setNameForSorting:v24];

          v25 = [v16 authenticationSchemes];
          v26 = (void *)[v25 copy];
          [(VSIdentityProvider *)v17 setSupportedAuthenticationSchemes:v26];

          -[VSIdentityProvider setRequireAuthenticationURLSystemTrust:](v17, "setRequireAuthenticationURLSystemTrust:", [v16 requireBootUrlSystemTrust]);
          -[VSIdentityProvider setRequireXHRRequestSystemTrust:](v17, "setRequireXHRRequestSystemTrust:", [v16 requireXHRRequestSystemTrust]);
          v27 = [v16 authenticationURL];
          if (v27)
          {
            v28 = [MEMORY[0x1E4F1CB10] URLWithString:v27];
            [(VSIdentityProvider *)v17 setAuthenticationURL:v28];
          }
          v29 = VSPlatformTemplateElements();
          v30 = [v29 allObjects];
          [(VSIdentityProvider *)v17 setSupportedTemplates:v30];

          v31 = [(VSIdentityProvider *)v17 supportedAuthenticationSchemes];
          if (![v31 count])
          {
            v66[0] = @"SAML";
            v66[1] = @"API";
            v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v66 count:2];
            [(VSIdentityProvider *)v17 setSupportedAuthenticationSchemes:v32];
          }
          v33 = *(void **)(*(void *)(*(void *)(v13 + 48) + 8) + 40);
          if (v33)
          {
            id v34 = v33;
            if ([v34 isInSetTopBoxMode])
            {
              v35 = [(VSIdentityProvider *)v17 uniqueID];
              v36 = [v35 forceUnwrapObject];
              v37 = [v34 setTopBoxIdentityProviderID];
              int v38 = [v36 isEqual:v37];

              uint64_t v13 = v52;
              id v11 = v53;

              if (v38)
              {
                -[VSIdentityProvider setIsSTBOptOutAllowed:](v17, "setIsSTBOptOutAllowed:", [v34 setTopBoxSupportsOptOut]);
                v39 = [v34 setTopBoxUserToken];
                [(VSIdentityProvider *)v17 setUserToken:v39];

                id v11 = v53;
              }
            }
          }
        }
        uint64_t v14 = [obj countByEnumeratingWithState:&v59 objects:v67 count:16];
      }
      while (v14);
    }

    v40 = VSDefaultLogObject();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "-[VSDeveloperModeStore fetchDeveloperIdentityProvidersWithCompletionHandler:]_block_invoke";
      _os_log_impl(&dword_1DA674000, v40, OS_LOG_TYPE_DEFAULT, "Will call completion handler passed to %s", buf, 0xCu);
    }

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_86;
    v56[3] = &unk_1E6BD2C88;
    id v41 = *(id *)(v13 + 40);
    id v57 = v53;
    id v58 = v41;
    id v42 = v53;
    __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_86((uint64_t)v56);
    v43 = VSDefaultLogObject();
    id v4 = v50;
    id v3 = v51;
    id v8 = v48;
    id v6 = v49;
    id v10 = v47;
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v65 = "-[VSDeveloperModeStore fetchDeveloperIdentityProvidersWithCompletionHandler:]_block_invoke_2";
      _os_log_impl(&dword_1DA674000, v43, OS_LOG_TYPE_DEFAULT, "Did call completion handler passed to %s", buf, 0xCu);
    }

    id v44 = v58;
  }
  else
  {
    v45 = VSErrorLogObject();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR)) {
      __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_67_cold_1();
    }

    uint64_t v46 = *(void *)(v52 + 40);
    if (!v10) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The error parameter must not be nil."];
    }
    id v44 = v10;
    id v42 = +[VSFailable failableWithError:v44];
    (*(void (**)(uint64_t, id))(v46 + 16))(v46, v42);
  }
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_86(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 40);
  id v2 = +[VSFailable failableWithObject:*(void *)(a1 + 32)];
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);
}

- (void)addDeveloperIdentityProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSDeveloperModeStore addDeveloperIdentityProvider:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The identityProvider parameter must not be nil."];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke;
  v11[3] = &unk_1E6BD3B30;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(VSDeveloperModeStore *)self _performIdentityProviderBlock:v11];
}

void __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 _developerIdentityProviderInContext:v4];
  id v6 = [*(id *)(a1 + 40) uniqueID];
  id v7 = [v6 forceUnwrapObject];
  id v8 = (void *)[v7 copy];
  [v5 setUniqueID:v8];

  id v9 = [*(id *)(a1 + 40) providerID];
  id v10 = [v9 forceUnwrapObject];
  id v11 = (void *)[v10 copy];
  [v5 setProviderID:v11];

  id v12 = [*(id *)(a1 + 40) nameForSorting];
  [v5 setNameForSorting:v12];

  id v13 = [*(id *)(a1 + 40) authenticationURL];
  uint64_t v14 = [v13 absoluteString];
  [v5 setAuthenticationURL:v14];

  v15 = [*(id *)(a1 + 40) supportedAuthenticationSchemes];
  uint64_t v16 = (void *)[v15 copy];
  [v5 setAuthenticationSchemes:v16];

  objc_msgSend(v5, "setRequireBootUrlSystemTrust:", objc_msgSend(*(id *)(a1 + 40), "requireAuthenticationURLSystemTrust"));
  objc_msgSend(v5, "setRequireXHRRequestSystemTrust:", objc_msgSend(*(id *)(a1 + 40), "requireXHRRequestSystemTrust"));
  id v22 = 0;
  LODWORD(v15) = [v4 save:&v22];

  id v17 = v22;
  if (v15)
  {
    [*(id *)(a1 + 32) fetchDeveloperIdentityProvidersWithCompletionHandler:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) _noteServiceDidChange];
    [*(id *)(a1 + 32) _noteProvidersDidChange];
  }
  else
  {
    char v18 = VSErrorLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke_cold_1();
    }

    uint64_t v19 = *(void *)(a1 + 48);
    if (!v17) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The saveError parameter must not be nil."];
    }
    id v20 = v17;
    v21 = +[VSFailable failableWithError:v20];
    (*(void (**)(uint64_t, void *))(v19 + 16))(v19, v21);
  }
}

- (void)updateExistingDeveloperIdentityProvider:(id)a3 completionHandler:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v9 = 136315138;
    id v10 = "-[VSDeveloperModeStore updateExistingDeveloperIdentityProvider:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", (uint8_t *)&v9, 0xCu);
  }

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The identityProvider parameter must not be nil."];
  }
  [(VSDeveloperModeStore *)self addDeveloperIdentityProvider:v6 completionHandler:v7];
}

- (void)removeDeveloperIdentityProviderWithUniqueID:(id)a3 completionHandler:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v15 = "-[VSDeveloperModeStore removeDeveloperIdentityProviderWithUniqueID:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The uniqueID parameter must not be nil."];
  }
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke;
  v11[3] = &unk_1E6BD3B30;
  v11[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  [(VSDeveloperModeStore *)self _performIdentityProviderBlock:v11];
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) _identityProviderFetchRequest];
  id v5 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", @"uniqueID", *(void *)(a1 + 40)];
  [v4 setPredicate:v5];
  id v31 = 0;
  id v6 = [v3 executeFetchRequest:v4 error:&v31];
  id v7 = v31;
  if (v6)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(v8);
          }
          [v3 deleteObject:*(void *)(*((void *)&v27 + 1) + 8 * v12++)];
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v27 objects:v32 count:16];
      }
      while (v10);
    }

    id v26 = 0;
    int v13 = [v3 save:&v26];
    id v14 = v26;
    if (v13)
    {
      [*(id *)(a1 + 32) fetchDeveloperIdentityProvidersWithCompletionHandler:*(void *)(a1 + 48)];
      [*(id *)(a1 + 32) _noteServiceDidChange];
      [*(id *)(a1 + 32) _noteProvidersDidChange];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_2;
      v23[3] = &unk_1E6BD3BA8;
      v15 = *(void **)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      uint64_t v17 = *(void *)(a1 + 32);
      id v24 = v16;
      uint64_t v25 = v17;
      [v15 fetchDeveloperSettingsWithCompletionHandler:v23];
      id v18 = v24;
    }
    else
    {
      v21 = VSErrorLogObject();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_2();
      }

      uint64_t v22 = *(void *)(a1 + 48);
      if (!v14) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The saveError parameter must not be nil."];
      }
      id v14 = v14;
      id v18 = +[VSFailable failableWithError:v14];
      (*(void (**)(uint64_t, id))(v22 + 16))(v22, v18);
    }
  }
  else
  {
    uint64_t v19 = VSErrorLogObject();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_1();
    }

    uint64_t v20 = *(void *)(a1 + 48);
    if (!v7) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The fetchError parameter must not be nil."];
    }
    id v18 = v7;
    id v14 = +[VSFailable failableWithError:v18];
    (*(void (**)(uint64_t, id))(v20 + 16))(v20, v14);
  }
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_2(uint64_t a1, void *a2)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_3;
  v6[3] = &unk_1E6BD3B80;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v7 = v4;
  uint64_t v8 = v5;
  [a2 unwrapObject:v6 error:&__block_literal_global_115_0];
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  uint64_t v5 = [v3 setTopBoxIdentityProviderID];
  LODWORD(v4) = [v4 isEqual:v5];

  if (v4)
  {
    [v3 setIsInSetTopBoxMode:0];
    id v6 = *(void **)(a1 + 40);
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_4;
    v7[3] = &unk_1E6BD28D8;
    v7[4] = v6;
    [v6 updateDeveloperSettings:v3 completionHandler:v7];
  }
}

uint64_t __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_4(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_5;
  v3[3] = &unk_1E6BD3B58;
  v3[4] = *(void *)(a1 + 32);
  return [a2 unwrapObject:v3 error:&__block_literal_global_112];
}

uint64_t __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_5(uint64_t a1)
{
  id v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl(&dword_1DA674000, v2, OS_LOG_TYPE_DEFAULT, "Successfully disable set-top box mode after all developer providers removed.", v4, 2u);
  }

  [*(id *)(a1 + 32) _noteServiceDidChange];
  return [*(id *)(a1 + 32) _noteProvidersDidChange];
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_110(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_110_cold_1();
  }
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_113(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_113_cold_1();
  }
}

- (void)fetchDeveloperSettingsWithCompletionHandler:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = VSDefaultLogObject();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v11 = "-[VSDeveloperModeStore fetchDeveloperSettingsWithCompletionHandler:]";
    _os_log_impl(&dword_1DA674000, v5, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  id v6 = [(VSDeveloperModeStore *)self settingsQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E6BD2E90;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) settingsPropertiesURL];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v2];
    id v4 = VSDefaultLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v5 = [v2 absoluteString];
      *(_DWORD *)buf = 138412290;
      long long v30 = v5;
      _os_log_impl(&dword_1DA674000, v4, OS_LOG_TYPE_DEFAULT, "Will fetch developer settings with path %@", buf, 0xCu);
    }
    if (v3)
    {
      id v28 = 0;
      id v6 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:0 format:0 error:&v28];
      id v7 = (VSDeveloperSettings *)v28;
      uint64_t v8 = v7;
      if (v6)
      {
        id v9 = objc_alloc_init(VSDeveloperSettings);
        uint64_t v10 = [v6 objectForKey:@"VSDeveloperSettingsPropertyIsInSetTopBoxModeKey"];
        -[VSDeveloperSettings setIsInSetTopBoxMode:](v9, "setIsInSetTopBoxMode:", [v10 BOOLValue]);

        uint64_t v11 = [v6 objectForKey:@"VSDeveloperSettingsPropertyIsCacheBusterEnabledKey"];
        -[VSDeveloperSettings setCacheBusterEnabled:](v9, "setCacheBusterEnabled:", [v11 BOOLValue]);

        uint64_t v12 = [v6 objectForKey:@"VSDeveloperSettingsPropertySetTopBoxBundleIdentifierKey"];
        [(VSDeveloperSettings *)v9 setSetTopBoxBundleIdentifier:v12];

        int v13 = [v6 objectForKey:@"VSDeveloperSettingsPropertySetTopBoxUserTokenKey"];
        [(VSDeveloperSettings *)v9 setSetTopBoxUserToken:v13];

        id v14 = [v6 objectForKey:@"VSDeveloperSettingsPropertySetTopBoxProviderIDKey"];
        [(VSDeveloperSettings *)v9 setSetTopBoxIdentityProviderID:v14];

        v15 = [v6 objectForKey:@"VSDeveloperSettingsPropertySetTopBoxUseDeviceProfileKey"];
        -[VSDeveloperSettings setSetTopBoxUseDeviceProfile:](v9, "setSetTopBoxUseDeviceProfile:", [v15 BOOLValue]);

        id v16 = [v6 objectForKey:@"VSDeveloperSettingsPropertySetTopBoxSupportsOptOut"];
        -[VSDeveloperSettings setSetTopBoxSupportsOptOut:](v9, "setSetTopBoxSupportsOptOut:", [v16 BOOLValue]);

        uint64_t v17 = [v6 objectForKey:@"VSDeveloperSettingsPropertySimulateExpiredToken"];
        -[VSDeveloperSettings setSimulateExpiredToken:](v9, "setSimulateExpiredToken:", [v17 BOOLValue]);

        id v18 = [v6 objectForKey:@"VSDeveloperSettingsPropertyRequestTimeoutsEnabled"];
        uint64_t v19 = v18;
        if (v18)
        {
          uint64_t v20 = [v18 BOOLValue] ^ 1;
        }
        else
        {
          uint64_t v25 = [v6 objectForKey:@"VSDeveloperSettingsPropertyRequestTimeoutsDisabled"];
          uint64_t v20 = [v25 BOOLValue];
        }
        [(VSDeveloperSettings *)v9 setRequestTimeoutsDisabled:v20];
        uint64_t v26 = *(void *)(a1 + 40);
        long long v27 = +[VSFailable failableWithObject:v9];
        (*(void (**)(uint64_t, void *))(v26 + 16))(v26, v27);
      }
      else
      {
        if (!v7) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The serializationErrorOrNil parameter must not be nil."];
        }
        id v9 = v8;
        v23 = VSErrorLogObject();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_2();
        }

        uint64_t v24 = *(void *)(a1 + 40);
        uint64_t v19 = +[VSFailable failableWithError:v9];
        (*(void (**)(uint64_t, void *))(v24 + 16))(v24, v19);
      }
    }
    else
    {
      uint64_t v8 = objc_alloc_init(VSDeveloperSettings);
      [(VSDeveloperSettings *)v8 setDefaults];
      [*(id *)(a1 + 32) updateDeveloperSettings:v8 completionHandler:*(void *)(a1 + 40)];
    }
  }
  else
  {
    v21 = VSErrorLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_1();
    }

    id v3 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSDeveloperServiceErrorDomain" code:-2 userInfo:0];
    uint64_t v22 = *(void *)(a1 + 40);
    uint64_t v8 = +[VSFailable failableWithError:v3];
    (*(void (**)(uint64_t, VSDeveloperSettings *))(v22 + 16))(v22, v8);
  }
}

- (void)updateDeveloperSettings:(id)a3 completionHandler:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = VSDefaultLogObject();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    id v16 = "-[VSDeveloperModeStore updateDeveloperSettings:completionHandler:]";
    _os_log_impl(&dword_1DA674000, v8, OS_LOG_TYPE_DEFAULT, "Entering %s", buf, 0xCu);
  }

  if (!v6) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The settings parameter must not be nil."];
  }
  id v9 = [(VSDeveloperModeStore *)self settingsQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke;
  block[3] = &unk_1E6BD2CD8;
  block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) settingsPropertiesURL];
  id v3 = v2;
  if (v2)
  {
    id v4 = [v2 path];

    if (!v4) {
      [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The [settingsURL path] parameter must not be nil."];
    }
    uint64_t v5 = [v3 path];
    id v6 = VSDefaultLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v5;
      _os_log_impl(&dword_1DA674000, v6, OS_LOG_TYPE_DEFAULT, "Will update developer settings using path %@", buf, 0xCu);
    }

    id v7 = [MEMORY[0x1E4F28CB8] defaultManager];
    if ([v7 fileExistsAtPath:v5])
    {
      id v39 = 0;
      char v8 = [v7 removeItemAtPath:v5 error:&v39];
      id v9 = v39;
      id v10 = v9;
      if ((v8 & 1) == 0)
      {
        if (!v9) {
          [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The rmErrorOrNil parameter must not be nil."];
        }
        id v11 = v10;
        uint64_t v12 = VSErrorLogObject();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
          __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_4();
        }
      }
    }
    id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "isInSetTopBoxMode"));
    [v13 setObject:v14 forKey:@"VSDeveloperSettingsPropertyIsInSetTopBoxModeKey"];

    v15 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "cacheBusterEnabled"));
    [v13 setObject:v15 forKey:@"VSDeveloperSettingsPropertyIsCacheBusterEnabledKey"];

    id v16 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "requestTimeoutsDisabled"));
    [v13 setObject:v16 forKey:@"VSDeveloperSettingsPropertyRequestTimeoutsDisabled"];

    uint64_t v17 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "simulateExpiredToken"));
    [v13 setObject:v17 forKey:@"VSDeveloperSettingsPropertySimulateExpiredToken"];

    id v18 = [*(id *)(a1 + 40) setTopBoxBundleIdentifier];
    objc_msgSend(v13, "vs_setObjectUnlessNil:forKey:", v18, @"VSDeveloperSettingsPropertySetTopBoxBundleIdentifierKey");

    uint64_t v19 = [*(id *)(a1 + 40) setTopBoxUserToken];
    objc_msgSend(v13, "vs_setObjectUnlessNil:forKey:", v19, @"VSDeveloperSettingsPropertySetTopBoxUserTokenKey");

    uint64_t v20 = [*(id *)(a1 + 40) setTopBoxIdentityProviderID];
    objc_msgSend(v13, "vs_setObjectUnlessNil:forKey:", v20, @"VSDeveloperSettingsPropertySetTopBoxProviderIDKey");

    v21 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "setTopBoxUseDeviceProfile"));
    [v13 setObject:v21 forKey:@"VSDeveloperSettingsPropertySetTopBoxUseDeviceProfileKey"];

    uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(*(id *)(a1 + 40), "setTopBoxSupportsOptOut"));
    [v13 setObject:v22 forKey:@"VSDeveloperSettingsPropertySetTopBoxSupportsOptOut"];

    id v38 = 0;
    v23 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v13 format:200 options:0 error:&v38];
    id v24 = v38;
    uint64_t v25 = v24;
    if (v23)
    {
      id v37 = v24;
      int v26 = [v23 writeToFile:v5 options:1 error:&v37];
      id v27 = v37;

      if (v26)
      {
        id v28 = VSDefaultLogObject();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          id v41 = v5;
          _os_log_impl(&dword_1DA674000, v28, OS_LOG_TYPE_DEFAULT, "successfully wrote developer settings to %@", buf, 0xCu);
        }

        [*(id *)(a1 + 32) _noteServiceDidChange];
        [*(id *)(a1 + 32) _noteSettingsDidChange];
        long long v29 = [*(id *)(a1 + 32) accountStoreChangeRemoteNotifier];
        [v29 postNotification];

        uint64_t v30 = *(void *)(a1 + 48);
        id v31 = +[VSFailable failableWithObject:*(void *)(a1 + 40)];
        (*(void (**)(uint64_t, id))(v30 + 16))(v30, v31);
        goto LABEL_31;
      }
      if (!v27) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
      }
      id v31 = v27;
      id v34 = VSErrorLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_3();
      }
    }
    else
    {
      if (!v24) {
        [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"The errorOrNil parameter must not be nil."];
      }
      id v31 = v25;
      id v34 = VSErrorLogObject();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_2();
      }
    }

    uint64_t v35 = *(void *)(a1 + 48);
    v36 = +[VSFailable failableWithError:v31];
    (*(void (**)(uint64_t, void *))(v35 + 16))(v35, v36);

    id v27 = v31;
LABEL_31:

    goto LABEL_32;
  }
  v32 = VSErrorLogObject();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
    __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_1();
  }

  uint64_t v5 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VSDeveloperServiceErrorDomain" code:-2 userInfo:0];
  uint64_t v33 = *(void *)(a1 + 48);
  id v7 = +[VSFailable failableWithError:v5];
  (*(void (**)(uint64_t, void *))(v33 + 16))(v33, v7);
LABEL_32:
}

- (VSPersistentContainer)persistentContainer
{
  return self->_persistentContainer;
}

- (void)setPersistentContainer:(id)a3
{
}

- (OS_dispatch_queue)settingsQueue
{
  return self->_settingsQueue;
}

- (void)setSettingsQueue:(id)a3
{
}

- (VSRemoteNotifier)serviceChangeRemoteNotifier
{
  return self->_serviceChangeRemoteNotifier;
}

- (void)setServiceChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)settingsChangeRemoteNotifier
{
  return self->_settingsChangeRemoteNotifier;
}

- (void)setSettingsChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)providersChangeRemoteNotifier
{
  return self->_providersChangeRemoteNotifier;
}

- (void)setProvidersChangeRemoteNotifier:(id)a3
{
}

- (VSRemoteNotifier)accountStoreChangeRemoteNotifier
{
  return self->_accountStoreChangeRemoteNotifier;
}

- (void)setAccountStoreChangeRemoteNotifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accountStoreChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_providersChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_settingsChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_serviceChangeRemoteNotifier, 0);
  objc_storeStrong((id *)&self->_settingsQueue, 0);

  objc_storeStrong((id *)&self->_persistentContainer, 0);
}

- (void)settingsPropertiesURL
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Error creating container directory %@: %@");
}

- (void)legacySettingsPropertiesPath
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Unable to obtain container directory path.", v2, v3, v4, v5, v6);
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching developer settings for developer provider enrichment: %@", v2, v3, v4, v5, v6);
}

void __77__VSDeveloperModeStore_fetchDeveloperIdentityProvidersWithCompletionHandler___block_invoke_67_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching developer identity providers: %@", v2, v3, v4, v5, v6);
}

void __71__VSDeveloperModeStore_addDeveloperIdentityProvider_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error adding provider: %@", v2, v3, v4, v5, v6);
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching provider to delete: %@", v2, v3, v4, v5, v6);
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error saving deletion: %@", v2, v3, v4, v5, v6);
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_110_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error updating developer settings to disable set-top box mode: %@", v2, v3, v4, v5, v6);
}

void __86__VSDeveloperModeStore_removeDeveloperIdentityProviderWithUniqueID_completionHandler___block_invoke_113_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error fetching developer settings to disable set-top box mode: %@", v2, v3, v4, v5, v6);
}

void __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1DA674000, v0, v1, "Failed to get settings property file path", v2, v3, v4, v5, v6);
}

void __68__VSDeveloperModeStore_fetchDeveloperSettingsWithCompletionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error serializing settings properties: %@", v2, v3, v4, v5, v6);
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error serializing developer settings: %@", v2, v3, v4, v5, v6);
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1DA674000, v0, v1, "Error writing developer settings to %@: %@");
}

void __66__VSDeveloperModeStore_updateDeveloperSettings_completionHandler___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DA674000, v0, v1, "Error deleting developer settings property file: %@", v2, v3, v4, v5, v6);
}

@end