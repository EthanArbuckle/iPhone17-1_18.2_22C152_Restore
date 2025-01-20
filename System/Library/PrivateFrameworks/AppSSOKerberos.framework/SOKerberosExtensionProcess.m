@interface SOKerberosExtensionProcess
- (BOOL)checkSourceAppACLWithContext:(id)a3;
- (NSMapTable)requestContextMapping;
- (NSMutableDictionary)kerberosByRealm;
- (SOKerberosExtensionProcess)init;
- (SOKerberosHelper)kerberosHelper;
- (SOKeychainHelper)keychainHelper;
- (id)createContextForRequest:(id)a3;
- (id)kerberosForRealm:(id)a3;
- (id)mapKnownPasswordErrorToString:(id)a3;
- (id)settingsForContext:(id)a3 includeSiteCodeCache:(BOOL)a4;
- (void)attemptKerberosWithContext:(id)a3 andDelegate:(id)a4;
- (void)beginAuthorizationWithRequest:(id)a3;
- (void)cancelAuthorizationWithRequest:(id)a3;
- (void)completeRequestWithHTTPResponseFromContext:(id)a3;
- (void)completeRequestWithToken:(id)a3 andContext:(id)a4;
- (void)destroyCredentialsWithContext:(id)a3;
- (void)handleAddKeychainCreds:(id)a3;
- (void)handleGetRealmInfo:(id)a3;
- (void)handleGetSiteCode:(id)a3;
- (void)handleKerberosOperations:(id)a3 andDelegate:(id)a4;
- (void)handleLogout:(id)a3 removeRealm:(BOOL)a4;
- (void)handleLogoutWithContext:(id)a3 removeRealm:(BOOL)a4;
- (void)handleMigration;
- (void)handleRemoveRealm:(id)a3;
- (void)handleResetKeychainChoice:(id)a3;
- (void)removeSettingFile:(int)a3;
- (void)saveValuesAfterSuccessfulAuthentication:(id)a3;
- (void)setKerberosByRealm:(id)a3;
- (void)setKerberosHelper:(id)a3;
- (void)setKeychainHelper:(id)a3;
- (void)setRequestContextMapping:(id)a3;
@end

@implementation SOKerberosExtensionProcess

- (SOKerberosExtensionProcess)init
{
  v12.receiver = self;
  v12.super_class = (Class)SOKerberosExtensionProcess;
  v2 = [(SOKerberosExtensionProcess *)&v12 init];
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    kerberosByRealm = v2->_kerberosByRealm;
    v2->_kerberosByRealm = (NSMutableDictionary *)v3;

    uint64_t v5 = [MEMORY[0x263F08968] weakToWeakObjectsMapTable];
    requestContextMapping = v2->_requestContextMapping;
    v2->_requestContextMapping = (NSMapTable *)v5;

    v7 = objc_alloc_init(SOKerberosHelper);
    kerberosHelper = v2->_kerberosHelper;
    v2->_kerberosHelper = v7;

    v9 = objc_alloc_init(SOKeychainHelper);
    keychainHelper = v2->_keychainHelper;
    v2->_keychainHelper = v9;
  }
  return v2;
}

- (void)handleMigration
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SOKerberosExtensionProcess_handleMigration__block_invoke;
  block[3] = &unk_2645A2378;
  block[4] = self;
  if (handleMigration_onceToken != -1) {
    dispatch_once(&handleMigration_onceToken, block);
  }
}

void __45__SOKerberosExtensionProcess_handleMigration__block_invoke(uint64_t a1)
{
  v2 = [MEMORY[0x263EFFA40] standardUserDefaults];
  uint64_t v3 = [v2 objectForKey:@"com.apple.AppSSOKerberos.version"];
  v4 = v3;
  if (v3) {
    uint64_t v5 = [v3 intValue];
  }
  else {
    uint64_t v5 = 0xFFFFFFFFLL;
  }
  v6 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __45__SOKerberosExtensionProcess_handleMigration__block_invoke_cold_1(a1, v5, v6);
  }

  if ((int)v5 <= 0)
  {
    [*(id *)(a1 + 32) removeSettingFile:v5];
    [v2 setObject:&unk_26D33C248 forKey:@"com.apple.AppSSOKerberos.version"];
  }
}

- (void)removeSettingFile:(int)a3
{
  if (a3 <= 0)
  {
    v4 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess removeSettingFile:]((uint64_t)self, v4);
    }

    uint64_t v5 = +[SOKerberosFileManager documentsDirectoryURLForFileName:@"realmSettings.plist"];
    v6 = [MEMORY[0x263F08850] defaultManager];
    [v6 removeItemAtURL:v5 error:0];
  }
}

- (void)beginAuthorizationWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess beginAuthorizationWithRequest:](v4, v5);
  }

  [(SOKerberosExtensionProcess *)self handleMigration];
  v6 = [v4 requestedOperation];
  if (![v6 isEqualToString:@"logout"])
  {
    v7 = [v4 requestedOperation];
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x2020000000;
    v8 = (void *)getASAuthorizationOperationLogoutSymbolLoc_ptr;
    uint64_t v31 = getASAuthorizationOperationLogoutSymbolLoc_ptr;
    if (!getASAuthorizationOperationLogoutSymbolLoc_ptr)
    {
      v9 = (void *)AuthenticationServicesLibrary();
      v29[3] = (uint64_t)dlsym(v9, "ASAuthorizationOperationLogout");
      getASAuthorizationOperationLogoutSymbolLoc_ptr = v29[3];
      v8 = (void *)v29[3];
    }
    _Block_object_dispose(&v28, 8);
    if (v8)
    {
      int v10 = [v7 isEqualToString:*v8];

      if (v10) {
        goto LABEL_9;
      }
      v14 = [v4 requestedOperation];
      int v15 = [v14 isEqualToString:@"get_site_code"];

      if (v15)
      {
        [(SOKerberosExtensionProcess *)self handleGetSiteCode:v4];
        goto LABEL_11;
      }
      v16 = [v4 requestedOperation];
      int v17 = [v16 isEqualToString:@"remove_realm"];

      if (v17)
      {
        [(SOKerberosExtensionProcess *)self handleRemoveRealm:v4];
        goto LABEL_11;
      }
      v18 = [v4 requestedOperation];
      int v19 = [v18 isEqualToString:@"reset_keychain_preference"];

      if (v19)
      {
        [(SOKerberosExtensionProcess *)self handleResetKeychainChoice:v4];
        goto LABEL_11;
      }
      v20 = [v4 requestedOperation];
      int v21 = [v20 isEqualToString:@"get_realm_info"];

      if (v21)
      {
        [(SOKerberosExtensionProcess *)self handleGetRealmInfo:v4];
        goto LABEL_11;
      }
      v22 = [v4 requestedOperation];
      uint64_t v28 = 0;
      v29 = &v28;
      uint64_t v30 = 0x2020000000;
      v23 = (void *)getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr;
      uint64_t v31 = getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr;
      if (!getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr)
      {
        v24 = (void *)AuthenticationServicesLibrary();
        v29[3] = (uint64_t)dlsym(v24, "ASAuthorizationProviderAuthorizationOperationConfigurationRemoved");
        getASAuthorizationProviderAuthorizationOperationConfigurationRemovedSymbolLoc_ptr = v29[3];
        v23 = (void *)v29[3];
      }
      _Block_object_dispose(&v28, 8);
      if (v23)
      {
        int v25 = [v22 isEqualToString:*v23];

        if (!v25)
        {
          v26 = [MEMORY[0x263F087E8] invalidKerberosOperation];
          [v4 completeWithError:v26];

          goto LABEL_11;
        }
        v11 = self;
        id v12 = v4;
        uint64_t v13 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      -[SOKerberosExtensionProcess beginAuthorizationWithRequest:]();
    }
    v27 = (_Unwind_Exception *)-[SOKerberosExtensionProcess beginAuthorizationWithRequest:]();
    _Block_object_dispose(&v28, 8);
    _Unwind_Resume(v27);
  }

LABEL_9:
  v11 = self;
  id v12 = v4;
  uint64_t v13 = 0;
LABEL_10:
  [(SOKerberosExtensionProcess *)v11 handleLogout:v12 removeRealm:v13];
LABEL_11:
}

- (void)cancelAuthorizationWithRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess cancelAuthorizationWithRequest:]();
  }

  v6 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess cancelAuthorizationWithRequest:](self);
  }

  v7 = [(SOKerberosExtensionProcess *)self requestContextMapping];
  v8 = [v7 objectForKey:v4];

  if (v8)
  {
    v9 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess cancelAuthorizationWithRequest:]();
    }

    [v8 cancelRequest:1];
  }
}

- (void)handleKerberosOperations:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.5(v6);
  }

  v9 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  int v10 = [v6 realm];
  v11 = [v10 uppercaseString];
  id v12 = [v9 objectForKeyedSubscript:v11];

  if (!v12)
  {
    uint64_t v13 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.4(v6);
    }

    v14 = [SOKerberosAuthentication alloc];
    int v15 = [v6 realm];
    v16 = [v15 uppercaseString];
    int v17 = [(SOKerberosAuthentication *)v14 initWithRealm:v16];
    v18 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
    int v19 = [v6 realm];
    v20 = [v19 uppercaseString];
    [v18 setObject:v17 forKeyedSubscript:v20];
  }
  int v21 = [(SOKerberosExtensionProcess *)self createContextForRequest:v6];
  if ([(SOKerberosExtensionProcess *)self checkSourceAppACLWithContext:v21])
  {
    v22 = [v21 extensionData];
    if ([v22 usePlatformSSOTGT])
    {
      v23 = [v21 currentSettings];
      if ([v23 platformSSOLoginInProgress])
      {
        v24 = [v21 currentSettings];
        int v25 = [v24 platformSSOLoginSemaphore];

        if (!v25) {
          goto LABEL_20;
        }
        v26 = [v21 currentSettings];
        v27 = [v26 platformSSOLoginSemaphore];
        dispatch_time_t v28 = dispatch_time(0, 120000000000);
        intptr_t v29 = dispatch_semaphore_wait(v27, v28);

        if (!v29)
        {
LABEL_20:
          if ([v21 forceLoginViewController])
          {
            v32 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:](v6);
            }

            [v7 handleResult:2 context:v21 error:0];
          }
          else
          {
            [(SOKerberosExtensionProcess *)self attemptKerberosWithContext:v21 andDelegate:v7];
          }
          goto LABEL_25;
        }
        uint64_t v30 = SO_LOG_SOKerberosExtensionProcess();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:](v6);
        }

        v22 = [v21 currentSettings];
        [v22 setPlatformSSOLoginInProgress:0];
      }
      else
      {
      }
    }

    goto LABEL_20;
  }
  uint64_t v31 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
    -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:]();
  }

  [v21 completeRequestWithDoNotHandle];
LABEL_25:
}

- (void)handleGetSiteCode:(id)a3
{
  uint64_t v68 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleGetSiteCode:].cold.6(v4);
  }

  id v6 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  id v7 = [v4 realm];
  v8 = [v7 uppercaseString];
  v9 = [v6 objectForKeyedSubscript:v8];

  if (!v9)
  {
    int v10 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.4(v4);
    }

    v11 = [SOKerberosAuthentication alloc];
    id v12 = [v4 realm];
    uint64_t v13 = [v12 uppercaseString];
    v14 = [(SOKerberosAuthentication *)v11 initWithRealm:v13];
    int v15 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
    v16 = [v4 realm];
    int v17 = [v16 uppercaseString];
    [v15 setObject:v14 forKeyedSubscript:v17];
  }
  v18 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  int v19 = [v4 realm];
  v20 = [v19 uppercaseString];
  int v21 = [v18 objectForKeyedSubscript:v20];

  v22 = [(SOKerberosExtensionProcess *)self createContextForRequest:v4];
  v23 = [v22 extensionData];
  LODWORD(v19) = [v23 useSiteAutoDiscovery];

  if (v19)
  {
    v24 = [v22 networkIdentity];
    [v24 determineNetworkFingerprint];

    int v25 = [v4 httpHeaders];
    v26 = [v25 objectForKey:@"force"];
    int v27 = [v26 isEqualToString:@"1"];

    if (v27)
    {
      dispatch_time_t v28 = SO_LOG_SOKerberosExtensionProcess();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosExtensionProcess handleGetSiteCode:].cold.4();
      }

      intptr_t v29 = dispatch_group_create();
      [v21 determineSiteCodeUsingContext:v22];
      dispatch_time_t v30 = dispatch_time(0, 15000000000);
      if (dispatch_group_wait(v29, v30) >= 1)
      {
        uint64_t v31 = SO_LOG_SOKerberosExtensionProcess();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosExtensionProcess handleGetSiteCode:]();
        }
      }
    }
    v32 = [v4 httpHeaders];
    v33 = [v32 objectForKey:@"verbose"];
    int v34 = [v33 isEqualToString:@"1"];

    if (v34)
    {
      v56 = v22;
      v35 = [SOKerberosRealmSettings alloc];
      v36 = [v4 realm];
      v37 = [(SOKerberosRealmSettings *)v35 initWithRealm:v36];

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      v38 = [(SOKerberosRealmSettings *)v37 dumpSiteCodeCache];
      uint64_t v39 = [v38 countByEnumeratingWithState:&v57 objects:v67 count:16];
      if (v39)
      {
        uint64_t v40 = v39;
        uint64_t v41 = *(void *)v58;
        v42 = &stru_26D3372C0;
        v43 = &stru_26D3372C0;
        do
        {
          uint64_t v44 = 0;
          v45 = v43;
          do
          {
            if (*(void *)v58 != v41) {
              objc_enumerationMutation(v38);
            }
            v46 = objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * v44), "description", v56);
            v47 = [(__CFString *)v42 stringByAppendingString:v46];

            v43 = [v45 stringByAppendingString:v47];

            ++v44;
            v42 = @"\n";
            v45 = v43;
          }
          while (v40 != v44);
          uint64_t v40 = [v38 countByEnumeratingWithState:&v57 objects:v67 count:16];
          v42 = @"\n";
        }
        while (v40);
      }
      else
      {
        v43 = &stru_26D3372C0;
      }

      v65 = @"site_code_cache";
      v66 = v43;
      v54 = [NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
      [v4 completeWithHTTPAuthorizationHeaders:v54];

      v55 = SO_LOG_SOKerberosExtensionProcess();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosExtensionProcess handleGetSiteCode:]();
      }

      v22 = v56;
      goto LABEL_36;
    }
    v48 = [v4 callerBundleIdentifier];
    v49 = [v22 networkIdentity];
    v50 = [v49 networkFingerprint];
    v37 = [v21 retrieveCachedSiteCodeFromCacheForBundleIdentifier:v48 networkFingerprint:v50];
  }
  else
  {
    v37 = [v22 siteCode];
  }
  v51 = [(SOKerberosRealmSettings *)v37 code];

  if (v51)
  {
    v63 = @"site_code";
    v52 = [(SOKerberosRealmSettings *)v37 code];
    v64 = v52;
    v53 = [NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
    [v4 completeWithHTTPAuthorizationHeaders:v53];
  }
  else
  {
    v61 = @"site_code";
    v62 = @"no site code";
    v52 = [NSDictionary dictionaryWithObjects:&v62 forKeys:&v61 count:1];
    [v4 completeWithHTTPAuthorizationHeaders:v52];
  }

  v43 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleGetSiteCode:]();
  }
LABEL_36:
}

- (void)handleRemoveRealm:(id)a3
{
  id v3 = a3;
  id v4 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleRemoveRealm:](v3);
  }

  uint64_t v5 = [SOKerberosRealmSettings alloc];
  id v6 = [v3 realm];
  id v7 = [(SOKerberosRealmSettings *)v5 initWithRealm:v6];
  [(SOKerberosRealmSettings *)v7 removeAllValues];

  [v3 complete];
  v8 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleRemoveRealm:]();
  }
}

- (void)handleLogoutWithContext:(id)a3 removeRealm:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_sync_enter(0);
  id v7 = [v6 impersonationBundleIdentifier];

  if (v7) {
    [v6 impersonationBundleIdentifier];
  }
  else {
  v8 = [v6 callerBundleIdentifier];
  }
  HeimCredSetImpersonateBundle();

  v9 = [(SOKerberosExtensionProcess *)self kerberosHelper];
  int v10 = [v6 credentialUUID];
  [v9 destroyCredential:v10];

  HeimCredSetImpersonateBundle();
  objc_sync_exit(0);
  v11 = [v6 currentSettings];
  [v11 setUserPrincipalName:0];

  id v12 = [v6 currentSettings];
  [v12 setUserName:0];

  [v6 setCredentialUUID:0];
  [v6 setUserNameIsReadOnly:0];
  [v6 setUserName:0];
  uint64_t v13 = [v6 currentSettings];
  [v13 setCredentialUUID:0];

  v14 = [v6 currentSettings];
  [v14 setPkinitPersistientRef:0];

  int v15 = [v6 currentSettings];
  [v15 setSmartCardTokenID:0];

  v16 = [v6 currentSettings];
  [v16 setDateLastLogin:0];

  int v17 = [v6 currentSettings];
  [v17 setDateNextPacRefresh:0];

  v18 = [v6 currentSettings];
  [v18 setDatePasswordLastChangedAtLogin:0];

  int v19 = [v6 currentSettings];
  [v19 setDatePasswordLastChanged:0];

  v20 = [v6 currentSettings];
  [v20 setDatePasswordExpires:0];

  int v21 = [v6 currentSettings];
  [v21 setPasswordNeverExpires:0];

  v22 = [v6 currentSettings];
  [v22 setNetworkHomeDirectory:0];

  v23 = [v6 currentSettings];
  [v23 setDateADPasswordCanChange:0];

  v24 = [v6 currentSettings];
  [v24 setDateLocalPasswordLastChanged:0];

  int v25 = [v6 currentSettings];
  [v25 setDateExpirationChecked:0];

  v26 = [v6 currentSettings];
  [v26 setDateExpirationNotificationSent:0];

  int v27 = [v6 currentSettings];
  [v27 setUserCancelledLogin:0];

  dispatch_time_t v28 = [v6 currentSettings];
  [v28 setDateLoginCancelled:0];

  intptr_t v29 = [v6 currentSettings];
  [v29 setPasswordChangeInProgress:0];

  dispatch_time_t v30 = [(SOKerberosExtensionProcess *)self keychainHelper];
  uint64_t v31 = [v6 serviceName];
  [v30 removeCredentialsFromKeychainWithService:v31];

  v32 = [v6 extensionUserData];
  [v32 setUserSetKeychainChoice:0];

  v33 = [v6 extensionUserData];
  [v33 setUseKeychain:1];

  if (v4)
  {
    int v34 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess handleLogoutWithContext:removeRealm:](v6);
    }

    v35 = [v6 currentSettings];
    [v35 removeAllValues];

    v36 = [v6 realm];
    id v40 = 0;
    BOOL v37 = +[SOKerberosHeimdalPluginSettings deleteSettingsForRealm:v36 error:&v40];
    id v38 = v40;

    if (!v37)
    {
      uint64_t v39 = SO_LOG_SOKerberosExtensionProcess();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosExtensionProcess handleLogoutWithContext:removeRealm:]();
      }
    }
  }
  else
  {
    +[SOKerberosAuthentication saveValuesForPlugins:v6];
  }
}

- (void)handleLogout:(id)a3 removeRealm:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleLogout:removeRealm:](v6);
  }

  v8 = [(SOKerberosExtensionProcess *)self createContextForRequest:v6];
  if ([(SOKerberosExtensionProcess *)self checkSourceAppACLWithContext:v8])
  {
    [(SOKerberosExtensionProcess *)self handleLogoutWithContext:v8 removeRealm:v4];
    [v8 completeRequest];
    v9 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess handleLogout:removeRealm:]();
    }
  }
  else
  {
    int v10 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:]();
    }

    [v8 completeRequestWithDoNotHandle];
  }
}

- (void)destroyCredentialsWithContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess destroyCredentialsWithContext:].cold.4();
  }

  if ([(SOKerberosExtensionProcess *)self checkSourceAppACLWithContext:v4])
  {
    id v6 = [v4 credentialUUID];

    if (v6)
    {
      id v7 = [v4 credentialUUID];
      v8 = [v7 UUIDString];

      v9 = SO_LOG_SOKerberosExtensionProcess();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosExtensionProcess destroyCredentialsWithContext:]();
      }

      objc_sync_enter(0);
      int v10 = [v4 impersonationBundleIdentifier];

      if (v10) {
        [v4 impersonationBundleIdentifier];
      }
      else {
      v11 = [v4 callerBundleIdentifier];
      }
      HeimCredSetImpersonateBundle();

      v20 = [(SOKerberosExtensionProcess *)self kerberosHelper];
      int v21 = [v4 credentialUUID];
      [v20 destroyCredential:v21];

      HeimCredSetImpersonateBundle();
      objc_sync_exit(0);
    }
    else
    {
      uint64_t v13 = [v4 userPrincipalName];
      if (v13)
      {
        v14 = (void *)v13;
        int v15 = [v4 userPrincipalName];
        char v16 = [v15 isEqualToString:&stru_26D3372C0];

        if ((v16 & 1) == 0)
        {
          int v17 = SO_LOG_SOKerberosExtensionProcess();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
            -[SOKerberosExtensionProcess destroyCredentialsWithContext:](v4);
          }

          objc_sync_enter(0);
          v18 = [v4 impersonationBundleIdentifier];

          if (v18) {
            [v4 impersonationBundleIdentifier];
          }
          else {
          int v19 = [v4 callerBundleIdentifier];
          }
          HeimCredSetImpersonateBundle();

          v22 = [(SOKerberosExtensionProcess *)self kerberosHelper];
          v23 = [v4 userPrincipalName];
          [v22 destroyCredentialForUPN:v23];

          HeimCredSetImpersonateBundle();
          objc_sync_exit(0);
        }
      }
    }
  }
  else
  {
    id v12 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosExtensionProcess destroyCredentialsWithContext:]();
    }

    [v4 completeRequestWithDoNotHandle];
  }
}

- (void)handleResetKeychainChoice:(id)a3
{
  id v3 = a3;
  id v4 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleResetKeychainChoice:](v3);
  }

  uint64_t v5 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v5 removeObjectForKey:@"useKeychain"];

  id v6 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v6 removeObjectForKey:@"userSetKeychainChoice"];

  id v7 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v7 removeObjectForKey:@"rememberKeychainChoice"];

  v8 = [MEMORY[0x263EFFA40] standardUserDefaults];
  [v8 synchronize];

  [v3 complete];
  v9 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleResetKeychainChoice:]();
  }
}

- (void)handleGetRealmInfo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleGetRealmInfo:].cold.4(v4);
  }

  id v6 = [v4 httpHeaders];
  id v7 = [v6 objectForKey:@"verbose"];
  uint64_t v8 = [v7 isEqualToString:@"1"];

  v9 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  int v10 = [v4 realm];
  v11 = [v10 uppercaseString];
  id v12 = [v9 objectForKeyedSubscript:v11];

  if (!v12)
  {
    uint64_t v13 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:].cold.4(v4);
    }

    v14 = [SOKerberosAuthentication alloc];
    int v15 = [v4 realm];
    char v16 = [v15 uppercaseString];
    int v17 = [(SOKerberosAuthentication *)v14 initWithRealm:v16];
    v18 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
    int v19 = [v4 realm];
    v20 = [v19 uppercaseString];
    [v18 setObject:v17 forKeyedSubscript:v20];
  }
  int v21 = [(SOKerberosExtensionProcess *)self createContextForRequest:v4];
  v22 = [v21 extensionData];
  int v23 = [v22 useSiteAutoDiscovery];

  if (v23)
  {
    v24 = [v21 networkIdentity];
    [v24 determineNetworkFingerprint];
  }
  int v25 = [(SOKerberosExtensionProcess *)self settingsForContext:v21 includeSiteCodeCache:v8];
  v26 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleGetRealmInfo:]();
  }

  [v4 completeWithHTTPAuthorizationHeaders:v25];
  int v27 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleGetRealmInfo:]();
  }
}

- (id)settingsForContext:(id)a3 includeSiteCodeCache:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v73 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = [SOKerberosRealmSettings alloc];
  uint64_t v8 = [v6 realm];
  v9 = [(SOKerberosRealmSettings *)v7 initWithRealm:v8];

  int v10 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  v11 = [v6 realm];
  id v12 = [v11 uppercaseString];
  v67 = [v10 objectForKeyedSubscript:v12];

  uint64_t v13 = objc_opt_new();
  v14 = [v6 realm];

  if (v14)
  {
    int v15 = [v6 realm];
    [v13 setObject:v15 forKeyedSubscript:@"realm"];
  }
  char v16 = [(SOKerberosRealmSettings *)v9 userPrincipalName];

  if (v16)
  {
    int v17 = [(SOKerberosRealmSettings *)v9 userPrincipalName];
    [v13 setObject:v17 forKeyedSubscript:@"upn"];
  }
  v18 = [(SOKerberosRealmSettings *)v9 userName];

  if (v18)
  {
    int v19 = [(SOKerberosRealmSettings *)v9 userName];
    [v13 setObject:v19 forKeyedSubscript:@"user_name"];
  }
  v20 = [(SOKerberosRealmSettings *)v9 credentialUUID];

  if (v20)
  {
    int v21 = [(SOKerberosRealmSettings *)v9 credentialUUID];
    v22 = [v21 UUIDString];
    [v13 setObject:v22 forKeyedSubscript:@"gss_cred_uuid"];
  }
  int v23 = [v6 extensionData];
  int v24 = [v23 useSiteAutoDiscovery];

  if (v24)
  {
    int v25 = [v6 callerBundleIdentifier];
    v26 = [v6 networkIdentity];
    int v27 = [v26 networkFingerprint];
    dispatch_time_t v28 = [v67 retrieveCachedSiteCodeFromCacheForBundleIdentifier:v25 networkFingerprint:v27];

    intptr_t v29 = [v28 code];

    if (v29)
    {
      dispatch_time_t v30 = [v28 code];
      [v13 setObject:v30 forKeyedSubscript:@"site_code"];

      if (!v4) {
        goto LABEL_27;
      }
    }
    else
    {
      [v13 setObject:@"no site code" forKeyedSubscript:@"site_code"];
      if (!v4)
      {
LABEL_27:

        goto LABEL_28;
      }
    }
    v65 = v28;
    id v66 = v6;
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    int v34 = [(SOKerberosRealmSettings *)v9 dumpSiteCodeCache];
    uint64_t v35 = [v34 countByEnumeratingWithState:&v68 objects:v72 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      uint64_t v37 = *(void *)v69;
      id v38 = &stru_26D3372C0;
      uint64_t v39 = &stru_26D3372C0;
      do
      {
        uint64_t v40 = 0;
        uint64_t v41 = v38;
        do
        {
          if (*(void *)v69 != v37) {
            objc_enumerationMutation(v34);
          }
          v42 = [*(id *)(*((void *)&v68 + 1) + 8 * v40) description];
          v43 = [(__CFString *)v39 stringByAppendingString:v42];

          id v38 = [(__CFString *)v41 stringByAppendingString:v43];

          ++v40;
          uint64_t v41 = v38;
          uint64_t v39 = @"\n";
        }
        while (v36 != v40);
        uint64_t v36 = [v34 countByEnumeratingWithState:&v68 objects:v72 count:16];
        uint64_t v39 = @"\n";
      }
      while (v36);
    }
    else
    {
      id v38 = &stru_26D3372C0;
    }

    [v13 setObject:v38 forKeyedSubscript:@"site_code_cache"];
    dispatch_time_t v28 = v65;
    id v6 = v66;
    goto LABEL_27;
  }
  uint64_t v31 = [v6 siteCode];

  if (v31)
  {
    v32 = [v6 siteCode];
    v33 = [v32 code];
    [v13 setObject:v33 forKeyedSubscript:@"site_code"];
  }
  else
  {
    [v13 setObject:@"no site code" forKeyedSubscript:@"site_code"];
  }
LABEL_28:
  id v44 = objc_alloc_init(MEMORY[0x263F088C0]);
  [v44 setFormatOptions:1907];
  v45 = [(SOKerberosRealmSettings *)v9 dateLastLogin];

  if (v45)
  {
    v46 = [(SOKerberosRealmSettings *)v9 dateLastLogin];
    v47 = [v44 stringFromDate:v46];

    [v13 setObject:v47 forKeyedSubscript:@"login_date"];
  }
  uint64_t v48 = [(SOKerberosRealmSettings *)v9 datePasswordLastChanged];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(SOKerberosRealmSettings *)v9 dateExpirationChecked];

    if (v50)
    {
      v51 = [(SOKerberosRealmSettings *)v9 datePasswordLastChanged];
      v52 = [v44 stringFromDate:v51];
      [v13 setObject:v52 forKeyedSubscript:@"password_changed_date"];
    }
  }
  v53 = [(SOKerberosRealmSettings *)v9 dateLocalPasswordLastChanged];

  if (v53)
  {
    v54 = [(SOKerberosRealmSettings *)v9 dateLocalPasswordLastChanged];
    v55 = [v44 stringFromDate:v54];
    [v13 setObject:v55 forKeyedSubscript:@"local_password_changed_date"];
  }
  v56 = [(SOKerberosRealmSettings *)v9 datePasswordExpires];

  if (v56)
  {
    long long v57 = [(SOKerberosRealmSettings *)v9 datePasswordExpires];
    long long v58 = [v44 stringFromDate:v57];
    [v13 setObject:v58 forKeyedSubscript:@"password_expires_date"];
  }
  long long v59 = [(SOKerberosRealmSettings *)v9 networkHomeDirectory];

  if (v59)
  {
    long long v60 = [(SOKerberosRealmSettings *)v9 networkHomeDirectory];
    [v13 setObject:v60 forKeyedSubscript:@"home_directory"];
  }
  if ([(SOKerberosRealmSettings *)v9 delayUserSetupCleared])
  {
    if ([(SOKerberosRealmSettings *)v9 delayUserSetupCleared]) {
      v61 = @"1";
    }
    else {
      v61 = @"0";
    }
    [v13 setObject:v61 forKeyedSubscript:@"delayUserSetupCleared"];
  }
  if ([(SOKerberosRealmSettings *)v9 networkAvailable])
  {
    if ([(SOKerberosRealmSettings *)v9 networkAvailable]) {
      v62 = @"1";
    }
    else {
      v62 = @"0";
    }
    [v13 setObject:v62 forKeyedSubscript:@"networkAvailable"];
  }
  if ([(SOKerberosRealmSettings *)v9 userCancelledLogin])
  {
    if ([(SOKerberosRealmSettings *)v9 userCancelledLogin]) {
      v63 = @"1";
    }
    else {
      v63 = @"0";
    }
    [v13 setObject:v63 forKeyedSubscript:@"userCancelledLogin"];
  }

  return v13;
}

- (BOOL)checkSourceAppACLWithContext:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  BOOL v4 = [v3 extensionData];
  uint64_t v5 = [v4 credentialBundleIdACL];
  if (v5)
  {
  }
  else
  {
    id v6 = [v3 extensionData];
    int v7 = [v6 includeManagedAppsInBundleIdACL];

    if (!v7)
    {
LABEL_20:
      LOBYTE(v11) = 1;
      goto LABEL_25;
    }
  }
  uint64_t v8 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess checkSourceAppACLWithContext:](v3);
  }

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  v9 = objc_msgSend(v3, "extensionData", 0);
  int v10 = [v9 credentialBundleIdACL];

  uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v10);
        }
        v14 = [*(id *)(*((void *)&v22 + 1) + 8 * i) lowercaseString];
        int v15 = [v3 callerBundleIdentifier];
        char v16 = [v15 lowercaseString];
        int v17 = [v14 isEqualToString:v16];

        if (v17)
        {
          uint64_t v11 = SO_LOG_SOKerberosExtensionProcess();
          if (os_log_type_enabled((os_log_t)v11, OS_LOG_TYPE_DEBUG)) {
            -[SOKerberosExtensionProcess checkSourceAppACLWithContext:]();
          }

          LODWORD(v11) = 1;
          goto LABEL_18;
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
LABEL_18:

  v18 = [v3 extensionData];
  if ([v18 includeManagedAppsInBundleIdACL])
  {
    int v19 = [v3 isManagedApp];

    if ((v11 | v19)) {
      goto LABEL_20;
    }
  }
  else
  {

    if (v11) {
      goto LABEL_20;
    }
  }
  v20 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
    -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:]();
  }

LABEL_25:
  return v11;
}

- (id)createContextForRequest:(id)a3
{
  id v4 = a3;
  uint64_t v5 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess createContextForRequest:].cold.6(v4);
  }

  id v6 = [v4 httpHeaders];
  int v7 = [SOKerberosExtensionData alloc];
  uint64_t v8 = [v4 extensionData];
  v9 = [(SOKerberosExtensionData *)v7 initWithDictionary:v8];

  if (!v9)
  {
    int v10 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosExtensionProcess createContextForRequest:].cold.5(v4);
    }
  }
  uint64_t v11 = [[SOKerberosContext alloc] initWithRequest:v4 extensionData:v9];
  uint64_t v12 = [(SOKerberosExtensionData *)v9 siteCode];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    v14 = [(SOKerberosExtensionData *)v9 siteCode];

    if (v14 != @"no site code")
    {
      [(SOKerberosExtensionData *)v9 setUseSiteAutoDiscovery:0];
      int v15 = [SOSiteCode alloc];
      char v16 = [(SOKerberosExtensionData *)v9 siteCode];
      int v17 = [(SOSiteCode *)v15 initWithSiteCode:v16 forNetworkFingerprint:@"profile"];
      [(SOKerberosContext *)v11 setSiteCode:v17];
    }
  }
  if ([(SOKerberosExtensionData *)v9 useSiteAutoDiscovery])
  {
    v18 = [SONetworkIdentity alloc];
    int v19 = [v4 realm];
    v20 = [v19 uppercaseString];
    int v21 = [(SOKerberosContext *)v11 callerBundleIdentifier];
    long long v22 = [(SOKerberosContext *)v11 auditToken];
    id v23 = [(SONetworkIdentity *)v18 initForRealm:v20 bundleIdentifier:v21 auditToken:v22];
    [(SOKerberosContext *)v11 setNetworkIdentity:v23];
  }
  long long v24 = [v4 requestedOperation];
  if (([v24 isEqualToString:@"login"] & 1) == 0)
  {
    long long v25 = [v4 requestedOperation];
    if (([v25 isEqualToString:@"get_credential_uuid"] & 1) == 0)
    {
      v26 = [v4 requestedOperation];
      if (([v26 isEqualToString:@"change_password"] & 1) == 0)
      {
        uint64_t v27 = [v4 requestedOperation];
        uint64_t v54 = 0;
        v55 = &v54;
        uint64_t v56 = 0x2020000000;
        dispatch_time_t v28 = (void *)getASAuthorizationOperationLoginSymbolLoc_ptr;
        uint64_t v57 = getASAuthorizationOperationLoginSymbolLoc_ptr;
        if (!getASAuthorizationOperationLoginSymbolLoc_ptr)
        {
          certificateRef[0] = (SecCertificateRef)MEMORY[0x263EF8330];
          certificateRef[1] = (SecCertificateRef)3221225472;
          certificateRef[2] = (SecCertificateRef)__getASAuthorizationOperationLoginSymbolLoc_block_invoke;
          certificateRef[3] = (SecCertificateRef)&unk_2645A23F0;
          v53 = &v54;
          intptr_t v29 = (void *)AuthenticationServicesLibrary();
          v55[3] = (uint64_t)dlsym(v29, "ASAuthorizationOperationLogin");
          getASAuthorizationOperationLoginSymbolLoc_ptr = *(void *)(v53[1] + 24);
          dispatch_time_t v28 = (void *)v55[3];
        }
        _Block_object_dispose(&v54, 8);
        if (!v28)
        {
          uint64_t v48 = (_Unwind_Exception *)-[SOKerberosExtensionProcess beginAuthorizationWithRequest:]();
          _Block_object_dispose(&v54, 8);
          _Unwind_Resume(v48);
        }
        if (([v27 isEqualToString:*v28] & 1) == 0)
        {
          v49 = [v4 url];
          [v49 scheme];
          v46 = v50 = v27;
          v47 = [v46 lowercaseString];
          char v51 = [v47 isEqualToString:@"realm"];

          if ((v51 & 1) == 0) {
            goto LABEL_27;
          }
          goto LABEL_23;
        }
      }
    }
  }
LABEL_23:
  [(SOKerberosContext *)v11 setReturnCredentialOnly:1];
  dispatch_time_t v30 = [v6 objectForKey:@"force"];
  int v31 = [v30 isEqualToString:@"1"];

  if (v31) {
    [(SOKerberosContext *)v11 setForceLoginViewController:1];
  }
  v32 = [v6 objectForKey:@"refresh"];
  int v33 = [v32 isEqualToString:@"1"];

  if (v33) {
    [(SOKerberosContext *)v11 setRefreshCredential:1];
  }
LABEL_27:
  int v34 = [(SOKerberosExtensionProcess *)self requestContextMapping];
  [v34 setObject:v11 forKey:v4];

  uint64_t v35 = [(SOKerberosContext *)v11 userName];
  if (v35)
  {
  }
  else
  {
    uint64_t v37 = [(SOKerberosExtensionData *)v9 certificateUUID];

    if (v37)
    {
      id v38 = SO_LOG_SOKerberosExtensionProcess();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG)) {
        -[SOKerberosExtensionProcess createContextForRequest:]();
      }

      uint64_t v39 = [(SOKerberosExtensionProcess *)self keychainHelper];
      uint64_t v40 = [(SOKerberosExtensionData *)v9 certificateUUID];
      uint64_t v41 = (__SecIdentity *)[v39 identityForUUIDString:v40];

      if (v41)
      {
        certificateRef[0] = 0;
        SecIdentityCopyCertificate(v41, certificateRef);
        if (certificateRef[0])
        {
          v42 = (void *)SecCertificateCopyNTPrincipalNames();
          if ([v42 count])
          {
            v43 = [v42 objectAtIndex:0];
            [(SOKerberosContext *)v11 setUserName:v43];
            id v44 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess createContextForRequest:]();
            }
          }
          CFRelease(certificateRef[0]);
        }
        CFRelease(v41);
      }
      else
      {
        v45 = SO_LOG_SOKerberosExtensionProcess();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
          -[SOKerberosExtensionProcess createContextForRequest:]();
        }
      }
    }
  }

  return v11;
}

- (void)attemptKerberosWithContext:(id)a3 andDelegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.9();
  }

  if (([v6 requestCancelled] & 1) == 0)
  {
    if ([(SOKerberosExtensionProcess *)self checkSourceAppACLWithContext:v6])
    {
      v9 = [v6 userPrincipalName];
      if (v9)
      {
        int v10 = NSString;
        uint64_t v11 = [v6 hostName];
        uint64_t v12 = [v10 stringWithFormat:@"HTTP@%@", v11];
        [v6 setServicePrincipalName:v12];

        uint64_t v13 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
        v14 = [v6 realm];
        int v15 = [v14 uppercaseString];
        char v16 = [v13 objectForKeyedSubscript:v15];

        id v31 = 0;
        id v32 = 0;
        uint64_t v17 = [v16 attemptKerberosWithContext:v6 returningToken:&v32 orError:&v31];
        id v18 = v32;
        id v19 = v31;
        switch(v17)
        {
          case 0:
            id v23 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:]();
            }

            [(SOKerberosExtensionProcess *)self completeRequestWithToken:v18 andContext:v6];
            break;
          case 1:
          case 2:
          case 3:
          case 6:
          case 8:
          case 9:
          case 10:
          case 11:
          case 12:
          case 13:
          case 15:
          case 16:
          case 18:
            v20 = v7;
            uint64_t v21 = v17;
            goto LABEL_8;
          case 4:
            long long v24 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.4();
            }

            [(SOKerberosExtensionProcess *)self completeRequestWithHTTPResponseFromContext:v6];
            break;
          case 7:
            dispatch_time_t v28 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.5(v19);
            }

            if ([v19 code] == -116 || objc_msgSend(v19, "code") == -113) {
              goto LABEL_38;
            }
            v20 = v7;
            uint64_t v21 = 7;
LABEL_8:
            [v20 handleResult:v21 context:v6 error:v19];
            break;
          case 14:
            intptr_t v29 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.6(v19);
            }

            [v6 completeRequestWithError:v19];
            break;
          case 17:
            dispatch_time_t v30 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:].cold.7(v6);
            }

            [(SOKerberosExtensionProcess *)self saveValuesAfterSuccessfulAuthentication:v6];
LABEL_38:
            [v6 completeRequestWithDoNotHandle];
            break;
          default:
            long long v25 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:]();
            }

            v26 = [MEMORY[0x263F087E8] unhandledKerberosResult];
            uint64_t v27 = SO_LOG_SOKerberosExtensionProcess();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
              -[SOKerberosExtensionProcess attemptKerberosWithContext:andDelegate:]();
            }

            [v6 completeRequestWithError:v26];
            break;
        }
      }
      else
      {
        [v7 handleResult:2 context:v6 error:0];
      }
    }
    else
    {
      long long v22 = SO_LOG_SOKerberosExtensionProcess();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosExtensionProcess handleKerberosOperations:andDelegate:]();
      }

      [v6 completeRequestWithDoNotHandle];
    }
  }
}

- (void)completeRequestWithToken:(id)a3 andContext:(id)a4
{
  v13[1] = *MEMORY[0x263EF8340];
  id v6 = a4;
  id v7 = a3;
  [(SOKerberosExtensionProcess *)self saveValuesAfterSuccessfulAuthentication:v6];
  uint64_t v8 = [v7 base64EncodedStringWithOptions:16];

  v9 = [NSString stringWithFormat:@"Negotiate %@", v8];
  int v10 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess completeRequestWithToken:andContext:]();
  }

  uint64_t v12 = @"Authorization";
  v13[0] = v9;
  uint64_t v11 = [NSDictionary dictionaryWithObjects:v13 forKeys:&v12 count:1];
  [v6 completeRequestWithHeaders:v11];
}

- (void)completeRequestWithHTTPResponseFromContext:(id)a3
{
  id v4 = a3;
  [(SOKerberosExtensionProcess *)self saveValuesAfterSuccessfulAuthentication:v4];
  uint64_t v5 = [(SOKerberosExtensionProcess *)self settingsForContext:v4 includeSiteCodeCache:0];
  id v6 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosExtensionProcess handleGetRealmInfo:]();
  }

  [v4 completeRequestWithHTTPResponseHeaders:v5];
}

- (void)saveValuesAfterSuccessfulAuthentication:(id)a3
{
  id v25 = a3;
  id v4 = [v25 credentialUUID];
  uint64_t v5 = [v25 currentSettings];
  [v5 setCredentialUUID:v4];

  id v6 = [v25 userPrincipalName];
  id v7 = [v25 currentSettings];
  [v7 setUserPrincipalName:v6];

  uint64_t v8 = [v25 userName];
  v9 = [v25 currentSettings];
  [v9 setUserName:v8];

  int v10 = [v25 currentSettings];
  [v10 setUserCancelledLogin:0];

  uint64_t v11 = [v25 currentSettings];
  [v11 setDateLoginCancelled:0];

  uint64_t v12 = [v25 loginTimeStamp];

  if (v12)
  {
    uint64_t v13 = [v25 loginTimeStamp];
    v14 = [v25 currentSettings];
    [v14 setDateLastLogin:v13];
  }
  int v15 = [v25 currentSettings];
  [v15 setDateUserSignedOut:0];

  char v16 = [v25 currentSettings];
  [v16 setDelayUserSetupCleared:1];

  uint64_t v17 = [v25 currentSettings];
  [v17 setPasswordChangeInProgress:0];

  id v18 = [v25 extensionData];
  if ([v18 allowAutomaticLogin])
  {
    id v19 = [v25 extensionUserData];
    int v20 = [v19 useKeychain];

    id v21 = v25;
    if (!v20) {
      goto LABEL_7;
    }
    long long v22 = [v25 pkinitPersistientRef];
    id v23 = [v25 currentSettings];
    [v23 setPkinitPersistientRef:v22];

    id v18 = [v25 certificateTokenID];
    long long v24 = [v25 currentSettings];
    [v24 setSmartCardTokenID:v18];
  }
  id v21 = v25;
LABEL_7:
  [(SOKerberosExtensionProcess *)self handleAddKeychainCreds:v21];
}

- (void)handleAddKeychainCreds:(id)a3
{
  id v13 = a3;
  id v4 = [v13 extensionUserData];
  int v5 = [v4 useKeychain];

  id v6 = [v13 extensionData];
  int v7 = [v6 allowAutomaticLogin];

  if (([v13 credsCameFromKeychain] & 1) == 0 && v7 && v5)
  {
    uint64_t v8 = [(SOKerberosExtensionProcess *)self keychainHelper];
    v9 = [v13 serviceName];
    int v10 = [v13 userPrincipalName];
    uint64_t v11 = [v13 password];
    uint64_t v12 = [v13 extensionData];
    objc_msgSend(v8, "addCredentialsToKeychainWithService:withUsername:withPassword:requireUserPresence:", v9, v10, v11, objc_msgSend(v12, "requireUserPresence"));
  }
}

- (id)mapKnownPasswordErrorToString:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 userInfo];
  int v5 = [v4 objectForKeyedSubscript:@"kGSSMinorErrorCode"];

  id v6 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v25 = 138412290;
    v26 = v5;
    _os_log_impl(&dword_221304000, v6, OS_LOG_TYPE_DEFAULT, "Password change error code: %@", (uint8_t *)&v25, 0xCu);
  }

  int v7 = SO_LOG_SOKerberosExtensionProcess();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    -[SOKerberosExtensionProcess mapKnownPasswordErrorToString:]();
  }

  uint64_t v8 = [NSNumber numberWithLong:-1765328360];
  int v9 = [v5 isEqualToNumber:v8];

  if (v9)
  {
    int v10 = [MEMORY[0x263F086E0] mainBundle];
    uint64_t v11 = v10;
    uint64_t v12 = @"PASSWORD_CHANGE_PASSWORD_CHANGE_FAILED_OLD_PASSWORD_ALERT_TEXT";
  }
  else
  {
    id v13 = [NSNumber numberWithLong:-1765328353];
    int v14 = [v5 isEqualToNumber:v13];

    if (v14)
    {
      int v10 = [MEMORY[0x263F086E0] mainBundle];
      uint64_t v11 = v10;
      uint64_t v12 = @"PASSWORD_CHANGE_PASSWORD_CHANGE_FAILED_SERVER_ALERT_TEXT";
    }
    else
    {
      int v15 = [NSNumber numberWithLong:-1765328228];
      int v16 = [v5 isEqualToNumber:v15];

      if (v16)
      {
        int v10 = [MEMORY[0x263F086E0] mainBundle];
        uint64_t v11 = v10;
        uint64_t v12 = @"KDC_UNREACHABLE";
      }
      else
      {
        uint64_t v17 = [NSNumber numberWithLong:-1765328343];
        int v18 = [v5 isEqualToNumber:v17];

        if (v18)
        {
          int v10 = [MEMORY[0x263F086E0] mainBundle];
          uint64_t v11 = v10;
          uint64_t v12 = @"REALM_CASE_MISMATCH";
        }
        else
        {
          id v19 = [NSNumber numberWithLong:-1765328160];
          int v20 = [v5 isEqualToNumber:v19];

          if (!v20)
          {
            uint64_t v11 = [v3 userInfo];
            id v23 = [v11 objectForKeyedSubscript:@"NSDescription"];
            if (v23)
            {
              long long v24 = [v3 userInfo];
              id v21 = [v24 objectForKeyedSubscript:@"NSDescription"];
            }
            else
            {
              id v21 = [v3 localizedDescription];
            }

            goto LABEL_16;
          }
          int v10 = [MEMORY[0x263F086E0] mainBundle];
          uint64_t v11 = v10;
          uint64_t v12 = @"DEFAULT_REALM_MISSING";
        }
      }
    }
  }
  id v21 = [v10 localizedStringForKey:v12 value:&stru_26D3372C0 table:0];
LABEL_16:

  return v21;
}

- (id)kerberosForRealm:(id)a3
{
  id v4 = a3;
  int v5 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  id v6 = [v4 uppercaseString];
  int v7 = [v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    uint64_t v8 = SO_LOG_SOKerberosExtensionProcess();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[SOKerberosExtensionProcess kerberosForRealm:]();
    }

    int v9 = [SOKerberosAuthentication alloc];
    int v10 = [v4 uppercaseString];
    uint64_t v11 = [(SOKerberosAuthentication *)v9 initWithRealm:v10];
    uint64_t v12 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
    id v13 = [v4 uppercaseString];
    [v12 setObject:v11 forKeyedSubscript:v13];
  }
  int v14 = [(SOKerberosExtensionProcess *)self kerberosByRealm];
  int v15 = [v4 uppercaseString];
  int v16 = [v14 objectForKeyedSubscript:v15];

  return v16;
}

- (NSMutableDictionary)kerberosByRealm
{
  return self->_kerberosByRealm;
}

- (void)setKerberosByRealm:(id)a3
{
}

- (NSMapTable)requestContextMapping
{
  return self->_requestContextMapping;
}

- (void)setRequestContextMapping:(id)a3
{
}

- (SOKerberosHelper)kerberosHelper
{
  return (SOKerberosHelper *)objc_getProperty(self, a2, 24, 1);
}

- (void)setKerberosHelper:(id)a3
{
}

- (SOKeychainHelper)keychainHelper
{
  return self->_keychainHelper;
}

- (void)setKeychainHelper:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keychainHelper, 0);
  objc_storeStrong((id *)&self->_kerberosHelper, 0);
  objc_storeStrong((id *)&self->_requestContextMapping, 0);
  objc_storeStrong((id *)&self->_kerberosByRealm, 0);
}

void __45__SOKerberosExtensionProcess_handleMigration__block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 136315650;
  int v5 = "-[SOKerberosExtensionProcess handleMigration]_block_invoke";
  __int16 v6 = 1024;
  int v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = v3;
  _os_log_debug_impl(&dword_221304000, log, OS_LOG_TYPE_DEBUG, "%s Stored version: %d on %@", (uint8_t *)&v4, 0x1Cu);
}

- (void)removeSettingFile:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  uint64_t v3 = "-[SOKerberosExtensionProcess removeSettingFile:]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)&v2, 0x16u);
}

- (uint64_t)beginAuthorizationWithRequest:.cold.1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  return -[SOKerberosExtensionProcess beginAuthorizationWithRequest:](v0);
}

- (void)beginAuthorizationWithRequest:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  __int16 v4 = [a1 realm];
  uint64_t v5 = [a1 requestedOperation];
  int v6 = 138412802;
  int v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v4;
  __int16 v10 = 2112;
  uint64_t v11 = v5;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "******************* beginAuthorizationWithRequest: %@, realm: %@, operation: %@", (uint8_t *)&v6, 0x20u);
}

- (void)cancelAuthorizationWithRequest:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "canceling context: %@", v2);
}

- (void)cancelAuthorizationWithRequest:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 requestContextMapping];
  [v1 count];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "request count: %lu", v4, v5, v6, v7, v8);
}

- (void)cancelAuthorizationWithRequest:.cold.3()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "cancelAuthorizationWithRequest: %{public}@", v2);
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.1(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "showing login view controller: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.2(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "timeout waiting for platform sso login: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleKerberosOperations:andDelegate:.cold.3()
{
  uint64_t v0 = [MEMORY[0x263F087E8] sourceAppNotAllowed];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v1, v2, "Result error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.4(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "creating new kerberosAuthentication for realm: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleKerberosOperations:(void *)a1 andDelegate:.cold.5(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "handleKerberosOperations: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleGetSiteCode:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "******************* end handleGetSiteCode", v2, v3, v4, v5, v6);
}

- (void)handleGetSiteCode:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "timeout waiting for sitecode, proceeding", v2, v3, v4, v5, v6);
}

- (void)handleGetSiteCode:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "requesting a new sitecode", v2, v3, v4, v5, v6);
}

- (void)handleGetSiteCode:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "handleGetSiteCode: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleRemoveRealm:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "******************* end handleRemoveRealm", v2, v3, v4, v5, v6);
}

- (void)handleRemoveRealm:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "handleRemoveRealm: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleLogoutWithContext:removeRealm:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_221304000, v0, v1, "error when deleting plugin settings: %@", v2);
}

- (void)handleLogoutWithContext:(void *)a1 removeRealm:.cold.2(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Removing Realm: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleLogout:removeRealm:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "******************* end handleLogout", v2, v3, v4, v5, v6);
}

- (void)handleLogout:(void *)a1 removeRealm:.cold.3(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_221304000, v2, v3, "handleLogout: %@, removeRealm: %@", v4, v5, v6, v7, v8);
}

- (void)destroyCredentialsWithContext:(void *)a1 .cold.1(void *a1)
{
  uint64_t v1 = [a1 userPrincipalName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "destroy credential with upn: %@", v4, v5, v6, v7, v8);
}

- (void)destroyCredentialsWithContext:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "destroy credential with UUID: %@", v2);
}

- (void)destroyCredentialsWithContext:.cold.3()
{
  uint64_t v0 = [MEMORY[0x263F087E8] sourceAppNotAllowed];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v1, v2, "Result error: %{public}@", v3, v4, v5, v6, v7);
}

- (void)destroyCredentialsWithContext:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "destroyCredentialsWithContext", v2, v3, v4, v5, v6);
}

- (void)handleResetKeychainChoice:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "******************* end handleResetKeychainChoice", v2, v3, v4, v5, v6);
}

- (void)handleResetKeychainChoice:(void *)a1 .cold.2(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "handleResetKeychainChoice: %{public}@", v4, v5, v6, v7, v8);
}

- (void)handleGetRealmInfo:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "******************* end handleGetRealmInfo", v2, v3, v4, v5, v6);
}

- (void)handleGetRealmInfo:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "completing request with data: %{private}@", v2);
}

- (void)handleGetRealmInfo:(void *)a1 .cold.4(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "handleGetRealmInfo: %{public}@", v4, v5, v6, v7, v8);
}

- (void)checkSourceAppACLWithContext:.cold.2()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "checking bundle id check passed", v2, v3, v4, v5, v6);
}

- (void)checkSourceAppACLWithContext:(void *)a1 .cold.3(void *a1)
{
  uint64_t v2 = [a1 callerBundleIdentifier];
  uint64_t v3 = [a1 extensionData];
  __int16 v10 = [v3 credentialBundleIdACL];
  OUTLINED_FUNCTION_1_1(&dword_221304000, v4, v5, "checking bundle id: %@ is in ACL: %@", v6, v7, v8, v9, 2u);
}

- (void)createContextForRequest:.cold.1()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "certificate not found", v2, v3, v4, v5, v6);
}

- (void)createContextForRequest:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "using principalname %@", v2);
}

- (void)createContextForRequest:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "retrieving principalname from certificate", v2, v3, v4, v5, v6);
}

- (void)createContextForRequest:(void *)a1 .cold.5(void *a1)
{
  uint64_t v1 = [a1 extensionData];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_221304000, v2, v3, "error deserializing extension data: %{private}@", v4, v5, v6, v7, v8);
}

- (void)createContextForRequest:(void *)a1 .cold.6(void *a1)
{
  uint64_t v1 = [a1 realm];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "createContextForRequest: %{public}@", v4, v5, v6, v7, v8);
}

- (void)attemptKerberosWithContext:andDelegate:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_221304000, v0, v1, "Result error: %{public}@", v2);
}

- (void)attemptKerberosWithContext:andDelegate:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_221304000, v0, v1, "Result unhandled: %lu", v2);
}

- (void)attemptKerberosWithContext:andDelegate:.cold.3()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Received token, completing", v2, v3, v4, v5, v6);
}

- (void)attemptKerberosWithContext:andDelegate:.cold.4()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "Received cred UUID, completing", v2, v3, v4, v5, v6);
}

- (void)attemptKerberosWithContext:(void *)a1 andDelegate:.cold.5(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Received error: %@", v4, v5, v6, v7, v8);
}

- (void)attemptKerberosWithContext:(void *)a1 andDelegate:.cold.6(void *a1)
{
  uint64_t v1 = [a1 localizedDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Unsupported Encryption: %@", v4, v5, v6, v7, v8);
}

- (void)attemptKerberosWithContext:(void *)a1 andDelegate:.cold.7(void *a1)
{
  uint64_t v1 = [a1 servicePrincipalName];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3(&dword_221304000, v2, v3, "Server Principal Unknown: %@", v4, v5, v6, v7, v8);
}

- (void)attemptKerberosWithContext:andDelegate:.cold.9()
{
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_221304000, v0, v1, "attemptKerberos", v2, v3, v4, v5, v6);
}

- (void)completeRequestWithToken:andContext:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "completing request with token: %{private}@", v2);
}

- (void)mapKnownPasswordErrorToString:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_6(&dword_221304000, v0, v1, "Password change error: %{public}@", v2);
}

- (void)kerberosForRealm:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3_0(&dword_221304000, v0, v1, "creating new kerberosAuthentication for realm: %{public}@", v2);
}

@end