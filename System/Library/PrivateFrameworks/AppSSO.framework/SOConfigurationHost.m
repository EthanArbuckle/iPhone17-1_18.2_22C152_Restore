@interface SOConfigurationHost
+ (id)_loadProfilesFromDict:(id)a3;
+ (id)_loadProfilesFromURL:(id)a3 logFileError:(BOOL)a4;
+ (id)defaultManager;
+ (id)maskRegistrationTokenInConfigurationData:(id)a3;
+ (id)maskRegistrationTokenInProfileList:(id)a3;
+ (void)defaultManager;
- (BOOL)_initCachePath:(id)a3 ifNeededWithError:(id *)a4;
- (BOOL)_initDataVaultIfNeededWithError:(id *)a3;
- (BOOL)_isConfigFileAvailable;
- (BOOL)_saveCacheToFile:(id)a3 error:(id *)a4;
- (BOOL)_saveConfigToFile:(id)a3 error:(id *)a4;
- (BOOL)configurationPending;
- (BOOL)hasAnyMDMProfileForExtension:(id)a3;
- (BOOL)isPlatformSSOProfile:(id)a3;
- (BOOL)saveConfiguration:(id)a3 error:(id *)a4;
- (BOOL)saveConfigurationData:(id)a3 error:(id *)a4;
- (NSMutableDictionary)associatedDomainCache;
- (NSObject)configurationPendingLock;
- (SOConfigurationHost)init;
- (id)_checkAssociatedDomainForProfiles:(id)a3;
- (id)_checkExtensionsExistenceForProfiles:(id)a3;
- (id)_defaultCacheFile;
- (id)_defaultConfigurationFile;
- (id)_defaultConfigurationPath;
- (id)_mergeProfile:(id)a3 userProfiles:(id)a4;
- (id)_removeNotSupportedUserProfiles:(id)a3;
- (id)_stringWithReason:(int64_t)a3;
- (id)configurationForClientWithError:(id *)a3;
- (id)findPlatformSSOProfile:(id)a3;
- (id)findProfileForExtension:(id)a3 profiles:(id)a4;
- (id)profileForURL:(id)a3 responseCode:(int64_t)a4;
- (id)profilesWithExtensionBundleIdentifier:(id)a3;
- (id)realms;
- (id)removedProfileForExtensionBundleIdentifier:(id)a3;
- (id)systemMDMProfileForExtension:(id)a3;
- (id)validatedProfileForPlatformSSO;
- (int64_t)configVersion;
- (int64_t)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5;
- (void)_checkNewVersion;
- (void)_configurationLoadedWithReason:(int64_t)a3;
- (void)_extensionsLoaded:(id)a3;
- (void)_isConfigFileAvailable;
- (void)_isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
- (void)_loadCacheFromDisk;
- (void)_loadConfigForFirstTime;
- (void)_reloadConfigWithReason:(int64_t)a3;
- (void)_startKeyBagObserverForReloadingConfiguration;
- (void)dealloc;
- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
- (void)setAssociatedDomainCache:(id)a3;
- (void)setConfigurationPending:(BOOL)a3;
- (void)setConfigurationPendingLock:(id)a3;
@end

@implementation SOConfigurationHost

- (id)configurationForClientWithError:(id *)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[SOConfigurationHost configurationForClientWithError:]";
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v6 = self;
  objc_sync_enter(v6);
  [(SOConfigurationHost *)v6 _checkNewVersion];
  v7 = [MEMORY[0x263EFF980] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v8 = [(SOConfiguration *)v6->_configuration profiles];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        v12 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyProfileForClient];
        [v7 addObject:v12];
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  if (a3) {
    *a3 = 0;
  }
  v13 = (void *)[objc_alloc((Class)getSOConfigurationClass()) initWithProfiles:v7];

  objc_sync_exit(v6);
  return v13;
}

- (void)_checkNewVersion
{
  if ([(SOConfigurationVersion *)self->_configurationVersion checkVersion] == 1)
  {
    v3 = [(SOConfigurationHost *)self configurationPendingLock];
    objc_sync_enter(v3);
    [(SOConfigurationHost *)self setConfigurationPending:1];
    objc_sync_exit(v3);

    [(SOConfigurationHost *)self _reloadConfigWithReason:2];
  }
}

+ (id)defaultManager
{
  if (defaultManager_onceToken_0 != -1) {
    dispatch_once(&defaultManager_onceToken_0, &__block_literal_global_11);
  }
  v2 = (void *)defaultManager_manager_0;
  if (!defaultManager_manager_0)
  {
    v3 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[SOConfigurationHost defaultManager]();
    }

    v2 = (void *)defaultManager_manager_0;
  }
  return v2;
}

uint64_t __37__SOConfigurationHost_defaultManager__block_invoke()
{
  v0 = objc_alloc_init(SOConfigurationHost);
  v1 = (void *)defaultManager_manager_0;
  defaultManager_manager_0 = (uint64_t)v0;

  v2 = (void *)defaultManager_manager_0;
  return [v2 _loadConfigForFirstTime];
}

- (SOConfigurationHost)init
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v3 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOConfigurationHost init]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v14.receiver = self;
  v14.super_class = (Class)SOConfigurationHost;
  v4 = [(SOConfigurationHost *)&v14 init];
  if (v4)
  {
    uint64_t v15 = 0;
    long long v16 = &v15;
    uint64_t v17 = 0x2050000000;
    v5 = (void *)getSOConfigurationVersionClass_softClass;
    uint64_t v18 = getSOConfigurationVersionClass_softClass;
    if (!getSOConfigurationVersionClass_softClass)
    {
      *(void *)buf = MEMORY[0x263EF8330];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getSOConfigurationVersionClass_block_invoke;
      v20 = &unk_26432A2A8;
      v21 = &v15;
      __getSOConfigurationVersionClass_block_invoke((uint64_t)buf);
      v5 = (void *)v16[3];
    }
    v6 = v5;
    _Block_object_dispose(&v15, 8);
    uint64_t v7 = [[v6 alloc] initWithMode:0];
    configurationVersion = v4->_configurationVersion;
    v4->_configurationVersion = (SOConfigurationVersion *)v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    associatedDomainCache = v4->_associatedDomainCache;
    v4->_associatedDomainCache = v9;

    v4->_configurationPending = 0;
    v11 = objc_alloc_init(MEMORY[0x263F8C6D0]);
    configurationPendingLock = v4->_configurationPendingLock;
    v4->_configurationPendingLock = v11;
  }
  return v4;
}

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SOConfigurationHost;
  [(SOConfigurationHost *)&v4 dealloc];
}

- (BOOL)saveConfiguration:(id)a3 error:(id *)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(id)objc_opt_class() maskRegistrationTokenInProfileList:v6];
    *(_DWORD *)buf = 136315651;
    v21 = "-[SOConfigurationHost saveConfiguration:error:]";
    __int16 v22 = 2113;
    v23 = v8;
    __int16 v24 = 2112;
    v25 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s saving new configuration: %{private}@ on %@", buf, 0x20u);
  }
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(id)objc_opt_class() _loadProfilesFromDict:v6];
  if (v10)
  {
    BOOL v11 = [(SOConfigurationHost *)v9 _saveConfigToFile:v6 error:a4];
    if (v11) {
      [(SOConfigurationVersion *)v9->_configurationVersion increaseVersionWithMessage:@"NewConfiguration"];
    }
    if (!getuid())
    {
      v12 = [(SOConfigurationHost *)v9 _defaultCacheFile];
      v13 = [v12 stringByDeletingLastPathComponent];

      id v19 = 0;
      BOOL v14 = [(SOConfigurationHost *)v9 _initCachePath:v13 ifNeededWithError:&v19];
      id v15 = v19;
      if (!v14)
      {
        long long v16 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          -[SOConfigurationHost saveConfiguration:error:]();
        }
      }
    }
  }
  else
  {
    uint64_t v17 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationHost saveConfiguration:error:]();
    }

    if (a4)
    {
      [getSOErrorHelperClass_3() parameterErrorWithMessage:@"invalid configuration format"];
      LOBYTE(v11) = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      LOBYTE(v11) = 0;
    }
  }

  objc_sync_exit(v9);
  return v11;
}

- (BOOL)saveConfigurationData:(id)a3 error:(id *)a4
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = [(id)objc_opt_class() maskRegistrationTokenInProfileList:v6];
    int v18 = 136315651;
    id v19 = "-[SOConfigurationHost saveConfigurationData:error:]";
    __int16 v20 = 2113;
    v21 = v8;
    __int16 v22 = 2112;
    v23 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s saving new configuration=%{private}@ on %@", (uint8_t *)&v18, 0x20u);
  }
  uint64_t v9 = self;
  objc_sync_enter(v9);
  uint64_t v10 = [(id)objc_opt_class() _loadProfilesFromDict:v6];
  if (!v10)
  {
    id v15 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      long long v16 = [(id)objc_opt_class() maskRegistrationTokenInProfileList:v6];
      -[SOConfigurationHost saveConfigurationData:error:](v16, (uint64_t)&v18);
    }

    if (a4)
    {
      [getSOErrorHelperClass_3() parameterErrorWithMessage:@"invalid configuration format"];
      uint64_t v10 = 0;
      BOOL v14 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    }
    uint64_t v10 = 0;
LABEL_11:
    BOOL v14 = 0;
    goto LABEL_12;
  }
  if (![(SOConfigurationHost *)v9 _saveConfigToFile:v6 error:a4]) {
    goto LABEL_11;
  }
  uint64_t v11 = [(SOConfigurationHost *)v9 _checkAssociatedDomainForProfiles:v10];

  uint64_t v12 = [objc_alloc((Class)getSOConfigurationClass()) initWithProfiles:v11];
  configuration = v9->_configuration;
  v9->_configuration = (SOConfiguration *)v12;

  [(SOConfigurationVersion *)v9->_configurationVersion increaseVersionWithMessage:@"NewConfiguration"];
  BOOL v14 = 1;
  uint64_t v10 = (void *)v11;
LABEL_12:

  objc_sync_exit(v9);
  return v14;
}

- (id)profileForURL:(id)a3 responseCode:(int64_t)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = (SOConfigurationHost *)a3;
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v15 = 136315394;
    uint64_t v16 = (uint64_t)"-[SOConfigurationHost profileForURL:responseCode:]";
    __int16 v17 = 2112;
    int v18 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v15, 0x16u);
  }

  v8 = self;
  objc_sync_enter(v8);
  [(SOConfigurationHost *)v8 _checkNewVersion];
  uint64_t v9 = [(SOConfiguration *)v8->_configuration profileForURL:v6 responseCode:a4];
  if (v9 && (getSOFullProfileClass(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v12 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationHost profileForURL:responseCode:]();
    }

    id v11 = 0;
  }
  else
  {
    uint64_t v10 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      BOOL v14 = [(SOConfiguration *)v8->_configuration profiles];
      int v15 = 141558787;
      uint64_t v16 = 1752392040;
      __int16 v17 = 2117;
      int v18 = v6;
      __int16 v19 = 2114;
      __int16 v20 = v9;
      __int16 v21 = 2114;
      __int16 v22 = v14;
      _os_log_debug_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEBUG, "profile for URL %{sensitive, mask.hash}@ => %{public}@ in %{public}@", (uint8_t *)&v15, 0x2Au);
    }
    id v11 = v9;
  }

  objc_sync_exit(v8);
  return v11;
}

- (id)removedProfileForExtensionBundleIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v4 = (char *)a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v22 = "-[SOConfigurationHost removedProfileForExtensionBundleIdentifier:]";
    __int16 v23 = 2112;
    uint64_t v24 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = self;
  objc_sync_enter(v6);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = v6->_removedProfiles;
  v8 = (SOConfigurationHost *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (SOConfigurationHost *)((char *)i + 1))
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v12 = objc_msgSend(v11, "extensionBundleIdentifier", (void)v17);
        int v13 = [v12 isEqualToString:v4];

        if (v13)
        {
          v8 = v11;
          goto LABEL_13;
        }
      }
      v8 = (SOConfigurationHost *)[(NSMutableArray *)v7 countByEnumeratingWithState:&v17 objects:v27 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  BOOL v14 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    removedProfiles = v6->_removedProfiles;
    *(_DWORD *)buf = 138543874;
    __int16 v22 = v4;
    __int16 v23 = 2114;
    uint64_t v24 = v8;
    __int16 v25 = 2114;
    uint64_t v26 = removedProfiles;
    _os_log_debug_impl(&dword_2185C9000, v14, OS_LOG_TYPE_DEBUG, "removed profile for extension bundle ID %{public}@ => %{public}@ in %{public}@", buf, 0x20u);
  }

  if (v8) {
    [(NSMutableArray *)v6->_removedProfiles removeObject:v8];
  }
  objc_sync_exit(v6);

  return v8;
}

- (id)profilesWithExtensionBundleIdentifier:(id)a3
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    __int16 v23 = "-[SOConfigurationHost profilesWithExtensionBundleIdentifier:]";
    __int16 v24 = 2114;
    id v25 = v4;
    __int16 v26 = 2112;
    v27 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s extensionBundleIdentifier: %{public}@ on %@", buf, 0x20u);
  }

  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [MEMORY[0x263EFF980] array];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  v8 = [(SOConfiguration *)v6->_configuration profiles];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        int v13 = [v12 extensionBundleIdentifier];
        int v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          int v15 = (void *)[v12 copyProfile];
          [v7 addObject:v15];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v9);
  }

  objc_sync_exit(v6);
  return v7;
}

- (id)validatedProfileForPlatformSSO
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v3 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v18 = "-[SOConfigurationHost validatedProfileForPlatformSSO]";
    __int16 v19 = 2112;
    long long v20 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v5 = [(SOConfiguration *)v4->_configuration profiles];
  id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([(SOConfigurationHost *)v4 isPlatformSSOProfile:v9])
        {
          id v6 = (void *)[v9 copyProfile];
          uint64_t v10 = [v9 pssoRegistrationToken];
          [v6 setPssoRegistrationToken:v10];

          goto LABEL_13;
        }
      }
      id v6 = (void *)[v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  objc_sync_exit(v4);
  return v6;
}

- (id)findPlatformSSOProfile:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    long long v20 = "-[SOConfigurationHost findPlatformSSOProfile:]";
    __int16 v21 = 2112;
    __int16 v22 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (-[SOConfigurationHost isPlatformSSOProfile:](self, "isPlatformSSOProfile:", v11, (void)v14))
        {
          id v12 = v11;
          goto LABEL_13;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_13:

  return v12;
}

- (id)findProfileForExtension:(id)a3 profiles:(id)a4
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v23 = "-[SOConfigurationHost findProfileForExtension:profiles:]";
    __int16 v24 = 2112;
    id v25 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = v7;
  id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        long long v14 = objc_msgSend(v13, "extensionBundleIdentifier", (void)v17);
        char v15 = [v14 isEqualToString:v6];

        if (v15)
        {
          id v10 = v13;
          goto LABEL_13;
        }
      }
      id v10 = (id)[v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return v10;
}

- (BOOL)isPlatformSSOProfile:(id)a3
{
  id v3 = a3;
  id SOFullProfileClass = getSOFullProfileClass();
  v5 = [v3 platformSSO];
  id v6 = [v5 objectForKeyedSubscript:@"AuthenticationMethod"];
  uint64_t v7 = [SOFullProfileClass authMethodWithString:v6];

  BOOL v8 = v7 != 1000 && [v3 type] == 1;
  return v8;
}

- (id)_removeNotSupportedUserProfiles:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[v4 mutableCopy];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v7)
  {
    uint64_t v9 = v7;
    char v10 = 0;
    uint64_t v11 = *(void *)v21;
    *(void *)&long long v8 = 138543362;
    long long v19 = v8;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v6);
        }
        long long v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (-[SOConfigurationHost isPlatformSSOProfile:](self, "isPlatformSSOProfile:", v13, v19, (void)v20))
        {
          if (v10)
          {
            long long v14 = SO_LOG_SOConfigurationHost();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              id v25 = v13;
              _os_log_error_impl(&dword_2185C9000, v14, OS_LOG_TYPE_ERROR, "More than one Platform SSO profile is not supported (rejected): %{public}@", buf, 0xCu);
            }

            [v5 removeObject:v13];
          }
          else
          {
            char v15 = [v13 platformSSO];
            long long v16 = [v15 objectForKeyedSubscript:@"UseSharedDeviceKeys"];

            if ([v16 BOOLValue])
            {
              long long v17 = SO_LOG_SOConfigurationHost();
              if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v19;
                id v25 = v13;
                _os_log_error_impl(&dword_2185C9000, v17, OS_LOG_TYPE_ERROR, "Platform SSO shared device keys require a system profile (rejected): %{public}@", buf, 0xCu);
              }

              [v5 removeObject:v13];
            }
          }
          char v10 = 1;
        }
      }
      uint64_t v9 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v9);
  }

  return v5;
}

- (BOOL)hasAnyMDMProfileForExtension:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "-[SOConfigurationHost hasAnyMDMProfileForExtension:]";
    __int16 v29 = 2112;
    v30 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = [(SOConfigurationHost *)self _defaultConfigurationFile];
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
  }

  long long v8 = objc_opt_class();
  uint64_t v9 = [NSURL fileURLWithPath:v6];
  char v10 = [v8 _loadProfilesFromURL:v9 logFileError:1];

  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "extensionBundleIdentifier", (void)v22);
        int v17 = [v16 isEqualToString:v4];

        if (v17)
        {
          long long v20 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
            -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
          }

          BOOL v19 = 1;
          long long v18 = v11;
          goto LABEL_19;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  long long v18 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
  }
  BOOL v19 = 0;
LABEL_19:

  return v19;
}

- (id)systemMDMProfileForExtension:(id)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v29 = "-[SOConfigurationHost systemMDMProfileForExtension:]";
    __int16 v30 = 2112;
    uint64_t v31 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = [(SOConfigurationHost *)self _defaultConfigurationFile];
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
  }

  long long v8 = objc_opt_class();
  uint64_t v9 = [NSURL fileURLWithPath:v6];
  char v10 = [v8 _loadProfilesFromURL:v9 logFileError:1];

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v11 = v10;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v24;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v11);
        }
        long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        int v17 = objc_msgSend(v16, "extensionBundleIdentifier", (void)v23);
        int v18 = [v17 isEqualToString:v4];

        if (v18)
        {
          long long v21 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
            -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
          }

          id v20 = v16;
          BOOL v19 = v11;
          goto LABEL_19;
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  BOOL v19 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
  }
  id v20 = 0;
LABEL_19:

  return v20;
}

- (id)realms
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 136315394;
    long long v8 = "-[SOConfigurationHost realms]";
    __int16 v9 = 2112;
    char v10 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v7, 0x16u);
  }

  id v4 = self;
  objc_sync_enter(v4);
  v5 = [(SOConfiguration *)v4->_configuration realms];
  objc_sync_exit(v4);

  return v5;
}

- (int64_t)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5
{
  uint64_t v41 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  char v10 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136316163;
    uint64_t v32 = (uint64_t)"-[SOConfigurationHost willHandleURL:responseCode:callerBundleIdentifier:]";
    __int16 v33 = 2160;
    uint64_t v34 = 1752392040;
    __int16 v35 = 2117;
    id v36 = v8;
    __int16 v37 = 2114;
    id v38 = v9;
    __int16 v39 = 2112;
    v40 = self;
    _os_log_debug_impl(&dword_2185C9000, v10, OS_LOG_TYPE_DEBUG, "%s URL: %{sensitive, mask.hash}@, callerBundleIdentifier: %{public}@ on %@", buf, 0x34u);
  }

  uint64_t v11 = self;
  objc_sync_enter(v11);
  configuration = v11->_configuration;
  id v30 = 0;
  int64_t v13 = [(SOConfiguration *)configuration willHandleURL:v8 responseCode:a4 callerBundleIdentifier:v9 profile:&v30];
  id v14 = v30;
  char v15 = v14;
  if (!v13)
  {
    if ([v14 type] == 1)
    {
      long long v16 = [v15 extensionBundleIdentifier];
      if (+[SOExtensionManager isAppleConnectExtensionBundleIdentifier:v16])
      {
        int64_t v13 = 0;
LABEL_19:

        goto LABEL_20;
      }
      int v17 = [v8 scheme];
      int v18 = [v17 lowercaseString];
      char v19 = [v18 isEqualToString:@"ssoid"];

      if ((v19 & 1) == 0)
      {
        long long v16 = +[SOExtensionManager sharedInstance];
        objc_sync_enter(v16);
        id v20 = +[SOExtensionManager sharedInstance];
        long long v21 = [v15 extensionBundleIdentifier];
        long long v22 = [v20 loadedExtensionWithBundleIdentifer:v21];

        if ([v22 hasAssociatedDomainsApproved])
        {
          int64_t v13 = 0;
        }
        else
        {
          long long v23 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
            -[SOConfigurationHost willHandleURL:responseCode:callerBundleIdentifier:]();
          }

          long long v24 = [MEMORY[0x263EFF8C0] arrayWithObject:v15];
          id v25 = [(SOConfigurationHost *)v11 _checkAssociatedDomainForProfiles:v24];

          if ([v22 hasAssociatedDomainsApproved])
          {
            long long v26 = SO_LOG_SOConfigurationHost();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
              -[SOConfigurationHost willHandleURL:responseCode:callerBundleIdentifier:]();
            }

            [(SOConfigurationHost *)v11 _reloadConfigWithReason:1];
            int64_t v13 = [(SOConfiguration *)v11->_configuration willHandleURL:v8 responseCode:a4 callerBundleIdentifier:v9 profile:0];
          }
          else
          {
            int64_t v13 = +[SOPreferences isAssociatedDomainValidated];
          }
        }

        objc_sync_exit(v16);
        goto LABEL_19;
      }
    }
    int64_t v13 = 0;
  }
LABEL_20:
  uint64_t v27 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    uint64_t v28 = [getSOConfigurationClass() stringWithHandleResult:v13];
    *(_DWORD *)buf = 141558787;
    uint64_t v32 = 1752392040;
    __int16 v33 = 2117;
    uint64_t v34 = (uint64_t)v8;
    __int16 v35 = 2114;
    id v36 = v9;
    __int16 v37 = 2114;
    id v38 = v28;
    _os_log_impl(&dword_2185C9000, v27, OS_LOG_TYPE_INFO, "willHandleURL(host): %{sensitive, mask.hash}@ callerBundleIdentifier: %{public}@ result: %{public}@", buf, 0x2Au);
  }
  objc_sync_exit(v11);

  return v13;
}

- (int64_t)configVersion
{
  return [(SOConfigurationVersion *)self->_configurationVersion version];
}

- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost isConfigurationActiveForExtensionIdentifier:completion:]();
  }

  [(SOConfigurationHost *)self _checkNewVersion];
  id v9 = [(SOConfigurationHost *)self configurationPendingLock];
  objc_sync_enter(v9);
  BOOL v10 = [(SOConfigurationHost *)self configurationPending];
  objc_sync_exit(v9);

  uint64_t v11 = SO_LOG_SOConfigurationHost();
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
  if (v10)
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_INFO, "New configuration pending", buf, 2u);
    }

    dispatch_time_t v13 = dispatch_time(0, 3100000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __78__SOConfigurationHost_isConfigurationActiveForExtensionIdentifier_completion___block_invoke;
    block[3] = &unk_26432A4E0;
    block[4] = self;
    id v15 = v6;
    id v16 = v7;
    dispatch_after(v13, MEMORY[0x263EF83A0], block);
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2185C9000, v11, OS_LOG_TYPE_INFO, "New configuration not pending", buf, 2u);
    }

    [(SOConfigurationHost *)self _isConfigurationActiveForExtensionIdentifier:v6 completion:v7];
  }
}

void __78__SOConfigurationHost_isConfigurationActiveForExtensionIdentifier_completion___block_invoke(uint64_t a1)
{
  id obj = *(id *)(a1 + 32);
  objc_sync_enter(obj);
  [*(id *)(a1 + 32) _isConfigurationActiveForExtensionIdentifier:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
  objc_sync_exit(obj);
}

- (void)_isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = (void (**)(id, void, void *))a4;
  id v8 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost _isConfigurationActiveForExtensionIdentifier:completion:].cold.5();
  }

  id v9 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost _isConfigurationActiveForExtensionIdentifier:completion:].cold.4();
  }

  if ([(SOConfigurationHost *)self hasAnyMDMProfileForExtension:v6])
  {
    unsigned int v10 = 0;
    while (1)
    {
      uint64_t v11 = SO_LOG_SOConfigurationHost();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[SOConfigurationHost _isConfigurationActiveForExtensionIdentifier:completion:](&v19, v20, v11);
      }

      BOOL v12 = +[SOExtensionManager sharedInstance];
      dispatch_time_t v13 = [v12 loadedExtensionWithBundleIdentifer:v6];

      id v14 = SO_LOG_SOConfigurationHost();
      id v15 = v14;
      if (v13) {
        break;
      }
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        unsigned int v22 = v10;
        _os_log_impl(&dword_2185C9000, v15, OS_LOG_TYPE_INFO, "Extension not installed. Retrying, %d retries remaining.", buf, 8u);
      }

      [MEMORY[0x263F08B88] sleepForTimeInterval:1.0];
      if (v10++ >= 9)
      {
        int v18 = [getSOErrorHelperClass_3() errorWithCode:-14 message:@"Missing extension with extension identifier"];
        v7[2](v7, 0, v18);

        goto LABEL_27;
      }
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[SOConfigurationHost _isConfigurationActiveForExtensionIdentifier:completion:]();
    }

    if (![v13 hasAssociatedDomainsApproved])
    {
      if (+[SOPreferences isAssociatedDomainValidated])
      {
        if (!+[SOExtensionManager isAppleConnectExtensionBundleIdentifier:v6])
        {
          [v13 checkAssociatedDomainsWithCompletion:v7];
          goto LABEL_27;
        }
        int v17 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[SOConfigurationHost _isConfigurationActiveForExtensionIdentifier:completion:]();
        }
      }
      else
      {
        int v17 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_2185C9000, v17, OS_LOG_TYPE_INFO, "Associated domain: validation is ignored", buf, 2u);
        }
      }
    }
    v7[2](v7, 1, 0);
  }
  else
  {
    dispatch_time_t v13 = [getSOErrorHelperClass_3() errorWithCode:-13 message:@"No profile for extension identifier"];
    v7[2](v7, 0, v13);
  }
LABEL_27:
}

+ (id)_loadProfilesFromDict:(id)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v21 = a3;
  id v4 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v28 = "+[SOConfigurationHost _loadProfilesFromDict:]";
    __int16 v29 = 2112;
    id v30 = a1;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id obj = a1;
  objc_sync_enter(obj);
  v5 = [v21 objectForKeyedSubscript:@"Profiles"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v6 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      +[SOConfigurationHost _loadProfilesFromDict:].cold.4();
    }
LABEL_25:
    id v16 = 0;
    goto LABEL_26;
  }
  id v6 = [MEMORY[0x263EFF980] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (!v8) {
    goto LABEL_14;
  }
  int v9 = 0;
  uint64_t v10 = *(void *)v23;
  while (2)
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v23 != v10) {
        objc_enumerationMutation(v7);
      }
      uint64_t v12 = *(void *)(*((void *)&v22 + 1) + 8 * i);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        id v14 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          int v17 = [obj maskRegistrationTokenInConfigurationData:v12];
          +[SOConfigurationHost _loadProfilesFromDict:](v17, (uint64_t)buf);
        }
        goto LABEL_24;
      }
      dispatch_time_t v13 = [objc_alloc((Class)getSOFullProfileClass()) initWithProfileData:v12];
      id v14 = v13;
      if (!v13)
      {
        int v18 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          +[SOConfigurationHost _loadProfilesFromDict:]();
        }
        goto LABEL_23;
      }
      BOOL v15 = [v13 pssoAuthenticationMethod] != 1000;
      if ((v15 & v9) == 1)
      {
        int v18 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          +[SOConfigurationHost _loadProfilesFromDict:]();
        }
LABEL_23:

LABEL_24:
        goto LABEL_25;
      }
      [v6 addObject:v14];

      v9 |= v15;
    }
    uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v8) {
      continue;
    }
    break;
  }
LABEL_14:

  id v6 = v6;
  id v16 = v6;
LABEL_26:

  objc_sync_exit(obj);
  return v16;
}

+ (id)_loadProfilesFromURL:(id)a3 logFileError:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = a1;
  objc_sync_enter(v7);
  id v13 = 0;
  uint64_t v8 = [NSDictionary dictionaryWithContentsOfURL:v6 error:&v13];
  id v9 = v13;
  if (v9)
  {
    if (v4)
    {
      uint64_t v10 = SO_LOG_SOConfigurationHost();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        +[SOConfigurationHost _loadProfilesFromURL:logFileError:]();
      }
    }
    uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = [(id)objc_opt_class() _loadProfilesFromDict:v8];
  }

  objc_sync_exit(v7);
  return v11;
}

- (void)_loadCacheFromDisk
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to load cache at %{private}@, error: %{public}@");
}

- (void)_loadConfigForFirstTime
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 136315394;
    id v7 = "-[SOConfigurationHost _loadConfigForFirstTime]";
    __int16 v8 = 2112;
    id v9 = self;
    _os_log_impl(&dword_2185C9000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", (uint8_t *)&v6, 0x16u);
  }

  BOOL v4 = [(SOConfigurationHost *)self configurationPendingLock];
  objc_sync_enter(v4);
  [(SOConfigurationHost *)self setConfigurationPending:1];
  objc_sync_exit(v4);

  if ([(SOConfigurationHost *)self _isConfigFileAvailable]) {
    [(SOConfigurationHost *)self _reloadConfigWithReason:0];
  }
  else {
    [(SOConfigurationHost *)self _startKeyBagObserverForReloadingConfiguration];
  }
  v5 = [MEMORY[0x263F08A00] defaultCenter];
  [v5 addObserver:self selector:sel__extensionsLoaded_ name:@"com.apple.AppSSO.SOExtensionManager.ExtensionsChanged" object:0];
}

- (void)_startKeyBagObserverForReloadingConfiguration
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_2185C9000, a2, OS_LOG_TYPE_ERROR, "failed to start keybag observer with error=%u", (uint8_t *)v2, 8u);
}

uint64_t __68__SOConfigurationHost__startKeyBagObserverForReloadingConfiguration__block_invoke(uint64_t a1, int a2)
{
  BOOL v4 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v6 = 0;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_INFO, "the device key bag is unlocked, reloading config...", v6, 2u);
  }

  notify_cancel(a2);
  return [*(id *)(a1 + 32) _reloadConfigWithReason:0];
}

- (void)_reloadConfigWithReason:(int64_t)a3
{
  uint64_t v77 = *MEMORY[0x263EF8340];
  BOOL v4 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [(SOConfigurationHost *)self _stringWithReason:a3];
    *(_DWORD *)buf = 136315650;
    v72 = "-[SOConfigurationHost _reloadConfigWithReason:]";
    __int16 v73 = 2112;
    v74 = v5;
    __int16 v75 = 2112;
    v76 = self;
    _os_log_impl(&dword_2185C9000, v4, OS_LOG_TYPE_DEFAULT, "%s reason = %@ on %@", buf, 0x20u);
  }
  v48 = self;
  objc_sync_enter(v48);
  if (a3 != 1) {
    [(SOConfigurationHost *)v48 _loadCacheFromDisk];
  }
  v46 = [(SOConfigurationHost *)v48 _defaultConfigurationFile];
  int v6 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[SOConfigurationHost hasAnyMDMProfileForExtension:]();
  }

  id v7 = objc_opt_class();
  __int16 v8 = [NSURL fileURLWithPath:v46];
  v45 = [v7 _loadProfilesFromURL:v8 logFileError:1];

  id v9 = [(SOConfigurationHost *)v48 _mergeProfile:v45 userProfiles:0];
  uint64_t v10 = [(SOConfigurationHost *)v48 _checkExtensionsExistenceForProfiles:v9];

  v53 = [(SOConfigurationHost *)v48 _checkAssociatedDomainForProfiles:v10];

  if (a3 == 2)
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v11 = [(SOConfiguration *)v48->_configuration profiles];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v62 objects:v70 count:16];
    if (!v12)
    {
      id v49 = 0;
      goto LABEL_33;
    }
    id v49 = 0;
    id v51 = *(id *)v63;
    id obj = v11;
    while (1)
    {
      uint64_t v13 = 0;
      do
      {
        if (*(id *)v63 != v51) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v62 + 1) + 8 * v13);
        long long v58 = 0u;
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        BOOL v15 = v53;
        uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v69 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v59;
LABEL_15:
          uint64_t v18 = 0;
          while (1)
          {
            if (*(void *)v59 != v17) {
              objc_enumerationMutation(v15);
            }
            uint8_t v19 = *(void **)(*((void *)&v58 + 1) + 8 * v18);
            id v20 = objc_msgSend(v14, "extensionBundleIdentifier", v45);
            id v21 = [v19 extensionBundleIdentifier];
            LOBYTE(v19) = [v20 isEqualToString:v21];

            if (v19) {
              goto LABEL_24;
            }
            if (v16 == ++v18)
            {
              uint64_t v16 = [v15 countByEnumeratingWithState:&v58 objects:v69 count:16];
              if (v16) {
                goto LABEL_15;
              }
              break;
            }
          }
        }

        long long v22 = [v14 extensionBundleIdentifier];
        BOOL v23 = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:v22];

        if (v23)
        {
          BOOL v15 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            long long v24 = [v14 extensionBundleIdentifier];
            *(_DWORD *)buf = 138543362;
            v72 = v24;
            _os_log_impl(&dword_2185C9000, v15, OS_LOG_TYPE_INFO, "Removed configuration ignored for extension: %{public}@", buf, 0xCu);
          }
LABEL_24:

          goto LABEL_25;
        }
        long long v25 = v49;
        if (!v49)
        {
          long long v25 = [MEMORY[0x263EFF980] array];
        }
        id v49 = v25;
        objc_msgSend(v25, "addObject:", v14, v45);
LABEL_25:
        ++v13;
      }
      while (v13 != v12);
      uint64_t v11 = obj;
      uint64_t v26 = [obj countByEnumeratingWithState:&v62 objects:v70 count:16];
      uint64_t v12 = v26;
      if (!v26)
      {
LABEL_33:

        p_removedProfiles = (id *)&v48->_removedProfiles;
        objc_storeStrong((id *)&v48->_removedProfiles, v49);
        if ([(NSMutableArray *)v48->_removedProfiles count])
        {
          uint64_t v28 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v29 = (const char *)*p_removedProfiles;
            *(_DWORD *)buf = 138477827;
            v72 = v29;
            _os_log_impl(&dword_2185C9000, v28, OS_LOG_TYPE_DEFAULT, "removed profiles = %{private}@", buf, 0xCu);
          }

          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v52 = *p_removedProfiles;
          uint64_t v30 = [v52 countByEnumeratingWithState:&v54 objects:v68 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v55;
            uint64_t v32 = MEMORY[0x263EFFA78];
            do
            {
              for (uint64_t i = 0; i != v30; ++i)
              {
                if (*(void *)v55 != v31) {
                  objc_enumerationMutation(v52);
                }
                uint64_t v34 = *(void **)(*((void *)&v54 + 1) + 8 * i);
                __int16 v35 = objc_alloc_init(SOAuthorization);
                v66 = @"removedProfileExtensionBundleIdentifier";
                id v36 = [v34 extensionBundleIdentifier];
                v67 = v36;
                __int16 v37 = [NSDictionary dictionaryWithObjects:&v67 forKeys:&v66 count:1];
                [(SOAuthorization *)v35 setAuthorizationOptions:v37];

                id v38 = objc_alloc_init(SOAuthorizationParameters);
                [(SOAuthorizationParameters *)v38 setOperation:@"configuration_removed"];
                __int16 v39 = [NSURL URLWithString:&stru_26C9B0BC0];
                [(SOAuthorizationParameters *)v38 setUrl:v39];

                [(SOAuthorizationParameters *)v38 setHttpHeaders:v32];
                v40 = objc_opt_new();
                [(SOAuthorizationParameters *)v38 setHttpBody:v40];

                [(SOAuthorizationParameters *)v38 setUseInternalExtensions:0];
                [(SOAuthorization *)v35 beginAuthorizationWithParameters:v38];
              }
              uint64_t v30 = [v52 countByEnumeratingWithState:&v54 objects:v68 count:16];
            }
            while (v30);
          }
        }
        break;
      }
    }
  }
  uint64_t v41 = [objc_alloc((Class)getSOConfigurationClass()) initWithProfiles:v53];
  configuration = v48->_configuration;
  v48->_configuration = (SOConfiguration *)v41;

  [(SOConfigurationHost *)v48 _configurationLoadedWithReason:a3];
  v43 = [(SOConfigurationHost *)v48 _stringWithReason:a3];
  +[SOAnalytics analyticsForMDMProfiles:v53 reason:v43];

  v44 = [(SOConfigurationHost *)v48 configurationPendingLock];
  objc_sync_enter(v44);
  [(SOConfigurationHost *)v48 setConfigurationPending:0];
  objc_sync_exit(v44);

  objc_sync_exit(v48);
}

- (id)_mergeProfile:(id)a3 userProfiles:(id)a4
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
    uint64_t v10 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v7, "count"));
    int v21 = 136315906;
    long long v22 = "-[SOConfigurationHost _mergeProfile:userProfiles:]";
    __int16 v23 = 2114;
    long long v24 = v9;
    __int16 v25 = 2114;
    uint64_t v26 = v10;
    __int16 v27 = 2112;
    uint64_t v28 = self;
    _os_log_impl(&dword_2185C9000, v8, OS_LOG_TYPE_DEFAULT, "%s systemProfiles = %{public}@, userProfiles = %{public}@ on %@", (uint8_t *)&v21, 0x2Au);
  }
  uint64_t v11 = [(SOConfigurationHost *)self _removeNotSupportedUserProfiles:v7];
  if (![v11 count])
  {
    id v19 = v6;
LABEL_14:
    id v18 = v19;
    goto LABEL_19;
  }
  if (![v6 count] && objc_msgSend(v11, "count"))
  {
    id v19 = v11;
    goto LABEL_14;
  }
  if ([v6 count] && objc_msgSend(v11, "count"))
  {
    uint64_t v12 = [(SOConfigurationHost *)self findPlatformSSOProfile:v6];
    uint64_t v13 = [(SOConfigurationHost *)self findPlatformSSOProfile:v11];
    if (v12)
    {
      id v14 = [v12 extensionBundleIdentifier];
      uint64_t v15 = [(SOConfigurationHost *)self findProfileForExtension:v14 profiles:v11];

      if (v13 | v15)
      {
        uint64_t v16 = [(id)v15 extensionData];
        [v12 setExtensionData:v16];

        uint64_t v17 = [(id)v15 pssoRegistrationToken];
        [v12 setPssoRegistrationToken:v17];

        id v18 = (id)[v11 mutableCopy];
        [v18 removeObject:v15];
        [v18 addObject:v12];
      }
      else
      {
        id v18 = [v11 arrayByAddingObject:v12];
      }
    }
    else
    {
      id v18 = v11;
    }
  }
  else
  {
    id v18 = 0;
  }
LABEL_19:

  return v18;
}

- (void)_configurationLoadedWithReason:(int64_t)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SOConfigurationHost *)self _stringWithReason:a3];
    configuration = self->_configuration;
    *(_DWORD *)buf = 136315906;
    __int16 v23 = "-[SOConfigurationHost _configurationLoadedWithReason:]";
    __int16 v24 = 2114;
    __int16 v25 = v6;
    __int16 v26 = 2114;
    __int16 v27 = configuration;
    __int16 v28 = 2112;
    uint64_t v29 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s reason = %{public}@, configuration = %{public}@ on %@", buf, 0x2Au);
  }
  if (![(SOConfiguration *)self->_configuration empty])
  {
    if (a3 == 1)
    {
      configurationVersion = self->_configurationVersion;
      uint64_t v13 = self;
      uint64_t v14 = 1;
    }
    else
    {
      if (a3) {
        goto LABEL_13;
      }
      [(SOConfigurationVersion *)self->_configurationVersion checkVersion];
      if ([(SOConfigurationVersion *)self->_configurationVersion version])
      {
        if ([(SOConfigurationVersion *)self->_configurationVersion version] != -1) {
          goto LABEL_13;
        }
      }
      configurationVersion = self->_configurationVersion;
      uint64_t v13 = self;
      uint64_t v14 = 0;
    }
    uint64_t v15 = [(SOConfigurationHost *)v13 _stringWithReason:v14];
    [(SOConfigurationVersion *)configurationVersion increaseVersionWithMessage:v15];

LABEL_13:
    __int16 v8 = objc_msgSend(NSNumber, "numberWithInteger:", a3, @"reason");
    id v19 = v8;
    id v9 = NSDictionary;
    uint64_t v10 = &v19;
    uint64_t v11 = (__CFString **)&v18;
    goto LABEL_14;
  }
  [(SOConfigurationVersion *)self->_configurationVersion setAppSSOUnavailable];
  if (!a3) {
    return;
  }
  id v20 = @"reason";
  __int16 v8 = [NSNumber numberWithInteger:a3];
  int v21 = v8;
  id v9 = NSDictionary;
  uint64_t v10 = &v21;
  uint64_t v11 = &v20;
LABEL_14:
  uint64_t v16 = [v9 dictionaryWithObjects:v10 forKeys:v11 count:1];

  uint64_t v17 = [MEMORY[0x263F08A00] defaultCenter];
  [v17 postNotificationName:@"com.apple.AppSSO.SOConfigurationHost.ConfigurationChanged" object:self userInfo:v16];
}

- (id)_checkExtensionsExistenceForProfiles:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    __int16 v24 = "-[SOConfigurationHost _checkExtensionsExistenceForProfiles:]";
    __int16 v25 = 2112;
    __int16 v26 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id obj = self;
  objc_sync_enter(obj);
  id v6 = [MEMORY[0x263EFF980] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        uint64_t v12 = +[SOExtensionManager sharedInstance];
        uint64_t v13 = [v11 extensionBundleIdentifier];
        int v14 = [v12 isLoadedExtensionWithBundleIdentifer:v13];

        if (v14)
        {
          [v6 addObject:v11];
        }
        else
        {
          uint64_t v15 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            __int16 v24 = (const char *)v11;
            _os_log_error_impl(&dword_2185C9000, v15, OS_LOG_TYPE_ERROR, "no extension available for profile (ignored): %{public}@", buf, 0xCu);
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  objc_sync_exit(obj);
  return v6;
}

- (id)_checkAssociatedDomainForProfiles:(id)a3
{
  uint64_t v95 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v85 = (uint64_t)"-[SOConfigurationHost _checkAssociatedDomainForProfiles:]";
    __int16 v86 = 2112;
    v87 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v69 = self;
  objc_sync_enter(v69);
  id v62 = +[SOExtensionManager sharedInstance];
  objc_sync_enter(v62);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v81;
    uint64_t v8 = (void *)MEMORY[0x263EFFA78];
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v81 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void **)(*((void *)&v80 + 1) + 8 * i);
        if ([v10 type] == 1)
        {
          uint64_t v11 = +[SOExtensionManager sharedInstance];
          uint64_t v12 = [v10 extensionBundleIdentifier];
          uint64_t v13 = [v11 loadedExtensionWithBundleIdentifer:v12];

          int v14 = [v10 extensionBundleIdentifier];
          LOBYTE(v12) = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:v14];

          if ((v12 & 1) == 0)
          {
            associatedDomainCache = v69->_associatedDomainCache;
            uint64_t v16 = [v10 extensionBundleIdentifier];
            uint64_t v17 = [(NSMutableDictionary *)associatedDomainCache objectForKeyedSubscript:v16];
            long long v18 = (void *)[v17 mutableCopy];
            long long v19 = v18;
            if (v18) {
              id v20 = v18;
            }
            else {
              id v20 = (id)[v8 mutableCopy];
            }
            long long v21 = v20;

            [v13 checkAssociatedDomainsWithCache:v21];
            long long v22 = v69->_associatedDomainCache;
            __int16 v23 = [v10 extensionBundleIdentifier];
            [(NSMutableDictionary *)v22 setObject:v21 forKeyedSubscript:v23];
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v80 objects:v94 count:16];
    }
    while (v6);
  }

  __int16 v24 = v69->_associatedDomainCache;
  id v79 = 0;
  BOOL v25 = [(SOConfigurationHost *)v69 _saveCacheToFile:v24 error:&v79];
  id v61 = v79;
  if (!v25)
  {
    __int16 v26 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationHost _checkAssociatedDomainForProfiles:]();
    }
  }
  if (+[SOPreferences isAssociatedDomainValidated])
  {
    id v64 = [MEMORY[0x263EFF980] array];
    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id v63 = obj;
    uint64_t v66 = [v63 countByEnumeratingWithState:&v75 objects:v93 count:16];
    if (v66)
    {
      uint64_t v65 = *(void *)v76;
      do
      {
        for (uint64_t j = 0; j != v66; ++j)
        {
          if (*(void *)v76 != v65) {
            objc_enumerationMutation(v63);
          }
          uint64_t v27 = *(void **)(*((void *)&v75 + 1) + 8 * j);
          if ([v27 type] != 1)
          {
            [v64 addObject:v27];
            continue;
          }
          __int16 v28 = +[SOExtensionManager sharedInstance];
          uint64_t v29 = [v27 extensionBundleIdentifier];
          v70 = [v28 loadedExtensionWithBundleIdentifer:v29];

          if (!v70)
          {
            uint64_t v34 = SO_LOG_SOConfigurationHost();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              uint64_t v85 = (uint64_t)v27;
              _os_log_error_impl(&dword_2185C9000, v34, OS_LOG_TYPE_ERROR, "Associated domain: validation failed to find extension for profile: %{public}@, ignoring profile", buf, 0xCu);
            }

            goto LABEL_66;
          }
          uint64_t v30 = [v27 extensionBundleIdentifier];
          BOOL v31 = +[SOExtensionManager isAppleConnectExtensionBundleIdentifier:v30];

          if (!v31)
          {
            long long v73 = 0u;
            long long v74 = 0u;
            long long v71 = 0u;
            long long v72 = 0u;
            __int16 v35 = [v27 URLPrefix];
            uint64_t v36 = [v35 countByEnumeratingWithState:&v71 objects:v90 count:16];
            if (!v36) {
              goto LABEL_64;
            }
            uint64_t v37 = *(void *)v72;
            while (1)
            {
              uint64_t v38 = 0;
              do
              {
                if (*(void *)v72 != v37) {
                  objc_enumerationMutation(v35);
                }
                __int16 v39 = *(SOConfigurationHost **)(*((void *)&v71 + 1) + 8 * v38);
                v40 = [NSURL URLWithString:v39];
                uint64_t v41 = [v40 scheme];
                if ([v41 isEqualToString:@"http"])
                {
                }
                else
                {
                  v42 = [v40 scheme];
                  char v43 = [v42 isEqualToString:@"https"];

                  if ((v43 & 1) == 0)
                  {
                    v53 = SO_LOG_SOConfigurationHost();
                    if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                      goto LABEL_55;
                    }
                    *(_DWORD *)buf = 141558531;
                    uint64_t v85 = 1752392040;
                    __int16 v86 = 2117;
                    v87 = v39;
                    __int16 v88 = 2114;
                    v89 = v70;
                    long long v54 = v53;
                    long long v55 = "Associated domain: validation removed URL: %{sensitive, mask.hash}@ because it is not a http s"
                          "cheme for extension %{public}@";
                    goto LABEL_62;
                  }
                }
                v44 = [v40 host];
                if ([v44 rangeOfString:@"*"] != 0x7FFFFFFFFFFFFFFFLL)
                {

LABEL_52:
                  v53 = SO_LOG_SOConfigurationHost();
                  if (!os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                    goto LABEL_55;
                  }
                  *(_DWORD *)buf = 141558531;
                  uint64_t v85 = 1752392040;
                  __int16 v86 = 2117;
                  v87 = v39;
                  __int16 v88 = 2114;
                  v89 = v70;
                  long long v54 = v53;
                  long long v55 = "Associated domain: validation removed URL: %{sensitive, mask.hash}@ because it contains a wildca"
                        "rd in the host name for extension %{public}@";
LABEL_62:
                  _os_log_error_impl(&dword_2185C9000, v54, OS_LOG_TYPE_ERROR, v55, buf, 0x20u);
                  goto LABEL_55;
                }
                v45 = [v40 host];
                BOOL v46 = [v45 rangeOfString:@"?"] == 0x7FFFFFFFFFFFFFFFLL;

                if (!v46) {
                  goto LABEL_52;
                }
                v47 = v69->_associatedDomainCache;
                v48 = [v27 extensionBundleIdentifier];
                id v49 = [(NSMutableDictionary *)v47 objectForKeyedSubscript:v48];
                char v50 = [v70 hasURLApprovedAssociatedDomain:v40 cache:v49];

                if (v50) {
                  goto LABEL_56;
                }
                int v51 = [v70 hasAssociatedDomainsApproved];
                id v52 = SO_LOG_SOConfigurationHost();
                v53 = v52;
                if (v51)
                {
                  if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
                  {
                    *(_DWORD *)buf = 141558531;
                    uint64_t v85 = 1752392040;
                    __int16 v86 = 2117;
                    v87 = v39;
                    __int16 v88 = 2114;
                    v89 = v70;
                    long long v54 = v53;
                    long long v55 = "Associated domain: validation removed URL: %{sensitive, mask.hash}@ because it has no approved"
                          " associated domains for extensions %{public}@";
                    goto LABEL_62;
                  }
LABEL_55:

                  [v27 removeURLPrefix:v39];
                  goto LABEL_56;
                }
                if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 141558531;
                  uint64_t v85 = 1752392040;
                  __int16 v86 = 2117;
                  v87 = v39;
                  __int16 v88 = 2114;
                  v89 = v70;
                  _os_log_impl(&dword_2185C9000, v53, OS_LOG_TYPE_INFO, "Associated domain: validation failed for URL: %{sensitive, mask.hash}@ because it has no approved associated domains for extensions %{public}@, it will be checked again when the extension is used", buf, 0x20u);
                }

LABEL_56:
                ++v38;
              }
              while (v36 != v38);
              uint64_t v56 = [v35 countByEnumeratingWithState:&v71 objects:v90 count:16];
              uint64_t v36 = v56;
              if (!v56)
              {
LABEL_64:

                long long v57 = [v27 URLPrefix];
                BOOL v58 = [v57 count] == 0;

                if (!v58) {
                  goto LABEL_65;
                }
                goto LABEL_66;
              }
            }
          }
          uint64_t v32 = SO_LOG_SOConfigurationHost();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          {
            __int16 v33 = [v27 extensionBundleIdentifier];
            -[SOConfigurationHost _checkAssociatedDomainForProfiles:](v33, v91, &v92, v32);
          }

LABEL_65:
          [v64 addObject:v27];
LABEL_66:
        }
        uint64_t v66 = [v63 countByEnumeratingWithState:&v75 objects:v93 count:16];
      }
      while (v66);
    }
  }
  else
  {
    long long v59 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2185C9000, v59, OS_LOG_TYPE_INFO, "Associated domain: validation is ignored, using all URLs in AppSSO configuration", buf, 2u);
    }

    id v64 = obj;
  }

  objc_sync_exit(v62);
  objc_sync_exit(v69);

  return v64;
}

- (BOOL)_initDataVaultIfNeededWithError:(id *)a3
{
  uint64_t v43 = *MEMORY[0x263EF8340];
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v40 = "-[SOConfigurationHost _initDataVaultIfNeededWithError:]";
    __int16 v41 = 2112;
    v42 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v6 = [(SOConfigurationHost *)self _defaultConfigurationPath];
  uint64_t v7 = self;
  objc_sync_enter(v7);
  uint64_t v8 = [MEMORY[0x263F08850] defaultManager];
  char v9 = [v8 fileExistsAtPath:v6 isDirectory:0];

  if ((v9 & 1) == 0)
  {
    uint64_t v10 = *MEMORY[0x263F08028];
    v37[0] = *MEMORY[0x263F08060];
    v37[1] = v10;
    v38[0] = @"mobile";
    v38[1] = @"mobile";
    uint64_t v11 = [NSDictionary dictionaryWithObjects:v38 forKeys:v37 count:2];
    uint64_t v12 = [MEMORY[0x263F08850] defaultManager];
    id v36 = 0;
    char v13 = [v12 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v11 error:&v36];
    int v14 = v36;

    if (v14) {
      char v13 = 0;
    }
    uint64_t v15 = SO_LOG_SOConfigurationHost();
    uint64_t v16 = v15;
    if ((v13 & 1) == 0)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationHost _initDataVaultIfNeededWithError:]();
      }

      if (a3) {
        *a3 = v14;
      }

      BOOL v26 = 0;
      goto LABEL_31;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v40 = v6;
      _os_log_impl(&dword_2185C9000, v16, OS_LOG_TYPE_DEFAULT, "created configuration directory at %{public}@", buf, 0xCu);
    }
  }
  uint64_t v17 = v6;
  [v17 UTF8String];
  int v18 = rootless_check_datavault_flag();
  if (v18)
  {
    if (v18 == -1)
    {
      long long v19 = SO_LOG_SOConfigurationHost();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        id v20 = __error();
        long long v21 = strerror(*v20);
        -[SOConfigurationHost _initDataVaultIfNeededWithError:]((uint64_t)v21, (uint64_t)buf);
      }

      if (a3)
      {
        id SOErrorHelperClass_3 = getSOErrorHelperClass_3();
        __int16 v23 = NSString;
        __int16 v24 = __error();
        int v14 = objc_msgSend(v23, "stringWithFormat:", @"failed to check the state of datavault: %s", strerror(*v24));
        id v25 = [SOErrorHelperClass_3 internalErrorWithMessage:v14];
LABEL_30:
        BOOL v26 = 0;
        *a3 = v25;
LABEL_31:

        goto LABEL_32;
      }
    }
    else
    {
      uint64_t v27 = v17;
      [v27 UTF8String];
      int v28 = rootless_convert_to_datavault();
      uint64_t v29 = SO_LOG_SOConfigurationHost();
      int v14 = v29;
      if (v28 != -1)
      {
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v40 = v27;
          _os_log_impl(&dword_2185C9000, v14, OS_LOG_TYPE_DEFAULT, "successfully created datavault at %{public}@", buf, 0xCu);
        }
        BOOL v26 = 1;
        goto LABEL_31;
      }
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        uint64_t v30 = __error();
        BOOL v31 = strerror(*v30);
        -[SOConfigurationHost _initDataVaultIfNeededWithError:]((uint64_t)v31, (uint64_t)buf);
      }

      if (a3)
      {
        id v32 = getSOErrorHelperClass_3();
        __int16 v33 = NSString;
        uint64_t v34 = __error();
        int v14 = objc_msgSend(v33, "stringWithFormat:", @"failed to convert to datavault: %s", strerror(*v34));
        id v25 = [v32 internalErrorWithMessage:v14];
        goto LABEL_30;
      }
    }
    BOOL v26 = 0;
    goto LABEL_32;
  }
  BOOL v26 = 1;
LABEL_32:
  objc_sync_exit(v7);

  return v26;
}

- (BOOL)_initCachePath:(id)a3 ifNeededWithError:(id *)a4
{
  uint64_t v40 = *MEMORY[0x263EF8340];
  uint64_t v6 = (char *)a3;
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v37 = "-[SOConfigurationHost _initCachePath:ifNeededWithError:]";
    __int16 v38 = 2112;
    __int16 v39 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = *MEMORY[0x263F08028];
  v34[0] = *MEMORY[0x263F08060];
  v34[1] = v9;
  v35[0] = @"mobile";
  v35[1] = @"mobile";
  uint64_t v10 = [NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
  uint64_t v11 = [MEMORY[0x263F08850] defaultManager];
  id v33 = 0;
  int v12 = [v11 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:v10 error:&v33];
  id v13 = v33;

  if (v13) {
    int v12 = 0;
  }
  int v14 = SO_LOG_SOConfigurationHost();
  uint64_t v15 = v14;
  if (v12)
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v37 = v6;
      _os_log_impl(&dword_2185C9000, v15, OS_LOG_TYPE_DEFAULT, "created cache directory at %{public}@", buf, 0xCu);
    }
  }
  else
  {
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationHost saveConfiguration:error:]();
    }

    if (a4) {
      *a4 = v13;
    }
  }

  objc_sync_exit(v8);
  if (!v12) {
    goto LABEL_32;
  }
  uint64_t v16 = [MEMORY[0x263F08850] defaultManager];
  int v17 = [v16 fileExistsAtPath:v6 isDirectory:0];

  if (v17)
  {
    int v18 = v6;
    [v18 UTF8String];
    int v19 = rootless_check_datavault_flag();
    if (v19)
    {
      if (v19 == -1)
      {
        id v20 = SO_LOG_SOConfigurationHost();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          -[SOConfigurationHost _initCachePath:ifNeededWithError:](v20);
        }

        if (a4)
        {
          id SOErrorHelperClass_3 = getSOErrorHelperClass_3();
          long long v22 = NSString;
          __int16 v23 = __error();
          __int16 v24 = objc_msgSend(v22, "stringWithFormat:", @"failed to check the state of datavault: %s", strerror(*v23));
          id v25 = [SOErrorHelperClass_3 internalErrorWithMessage:v24];
LABEL_30:
          LOBYTE(v17) = 0;
          *a4 = v25;
LABEL_31:

          goto LABEL_33;
        }
      }
      else
      {
        BOOL v26 = v18;
        [v26 UTF8String];
        int v27 = rootless_convert_to_datavault();
        int v28 = SO_LOG_SOConfigurationHost();
        __int16 v24 = v28;
        if (v27 != -1)
        {
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138543362;
            uint64_t v37 = v26;
            _os_log_impl(&dword_2185C9000, v24, OS_LOG_TYPE_DEFAULT, "successfully created datavault at %{public}@", buf, 0xCu);
          }
          LOBYTE(v17) = 1;
          goto LABEL_31;
        }
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          -[SOConfigurationHost _initCachePath:ifNeededWithError:](v24);
        }

        if (a4)
        {
          id v29 = getSOErrorHelperClass_3();
          uint64_t v30 = NSString;
          BOOL v31 = __error();
          __int16 v24 = objc_msgSend(v30, "stringWithFormat:", @"failed to convert to datavault: %s", strerror(*v31));
          id v25 = [v29 internalErrorWithMessage:v24];
          goto LABEL_30;
        }
      }
LABEL_32:
      LOBYTE(v17) = 0;
      goto LABEL_33;
    }
    LOBYTE(v17) = 1;
  }
LABEL_33:

  return v17;
}

- (BOOL)_saveConfigToFile:(id)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    id v29 = "-[SOConfigurationHost _saveConfigToFile:error:]";
    __int16 v30 = 2112;
    BOOL v31 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  if ([(SOConfigurationHost *)v8 _initDataVaultIfNeededWithError:a4])
  {
    uint64_t v9 = [(SOConfigurationHost *)v8 _defaultConfigurationFile];
    uint64_t v10 = [NSURL fileURLWithPath:v9];
    id v25 = 0;
    int v11 = [v6 writeToURL:v10 error:&v25];
    id v12 = v25;

    if (v11)
    {
      uint64_t v13 = *MEMORY[0x263F08028];
      v26[0] = *MEMORY[0x263F08060];
      v26[1] = v13;
      v27[0] = @"mobile";
      v27[1] = @"mobile";
      int v14 = [NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:2];
      uint64_t v15 = [MEMORY[0x263F08850] defaultManager];
      id v24 = 0;
      char v16 = [v15 setAttributes:v14 ofItemAtPath:v9 error:&v24];
      id v17 = v24;

      int v18 = SO_LOG_SOConfigurationHost();
      int v19 = v18;
      if (v16)
      {
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [(id)objc_opt_class() maskRegistrationTokenInProfileList:v6];
          *(_DWORD *)buf = 138543618;
          id v29 = v9;
          __int16 v30 = 2112;
          BOOL v31 = v20;
          _os_log_impl(&dword_2185C9000, v19, OS_LOG_TYPE_DEFAULT, "config written to file: %{public}@, %@", buf, 0x16u);
        }
        BOOL v21 = 1;
        goto LABEL_20;
      }
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationHost _saveConfigToFile:error:]();
      }

      if (a4) {
        *a4 = v17;
      }
    }
    else
    {
      long long v22 = SO_LOG_SOConfigurationHost();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationHost _saveConfigToFile:error:]();
      }

      if (a4)
      {
        BOOL v21 = 0;
        *a4 = v12;
LABEL_20:

        goto LABEL_21;
      }
    }
    BOOL v21 = 0;
    goto LABEL_20;
  }
  BOOL v21 = 0;
LABEL_21:
  objc_sync_exit(v8);

  return v21;
}

- (BOOL)_saveCacheToFile:(id)a3 error:(id *)a4
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v6 = (SOConfigurationHost *)a3;
  uint64_t v7 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    uint64_t v34 = "-[SOConfigurationHost _saveCacheToFile:error:]";
    __int16 v35 = 2112;
    id v36 = self;
    _os_log_impl(&dword_2185C9000, v7, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  uint64_t v8 = self;
  objc_sync_enter(v8);
  uint64_t v9 = [(SOConfigurationHost *)v8 _defaultCacheFile];
  uint64_t v10 = [v9 stringByDeletingLastPathComponent];

  if ([(SOConfigurationHost *)v8 _initCachePath:v10 ifNeededWithError:a4])
  {
    int v11 = [(SOConfigurationHost *)v8 _defaultCacheFile];
    id v30 = 0;
    id v12 = [MEMORY[0x263F08900] dataWithJSONObject:v6 options:3 error:&v30];
    id v13 = v30;
    if (!v12)
    {
      __int16 v23 = SO_LOG_SOConfigurationHost();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationHost _saveCacheToFile:error:]();
      }

      BOOL v22 = 0;
      if (a4) {
        *a4 = v13;
      }
      goto LABEL_26;
    }
    int v14 = [NSURL fileURLWithPath:v11];
    id v29 = 0;
    int v15 = [v12 writeToURL:v14 options:0 error:&v29];
    id v16 = v29;

    if (v15)
    {
      uint64_t v17 = *MEMORY[0x263F08028];
      v31[0] = *MEMORY[0x263F08060];
      v31[1] = v17;
      v32[0] = @"mobile";
      v32[1] = @"mobile";
      int v27 = [NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:2];
      int v18 = [MEMORY[0x263F08850] defaultManager];
      id v28 = 0;
      char v19 = [v18 setAttributes:v27 ofItemAtPath:v11 error:&v28];
      id v26 = v28;

      id v20 = SO_LOG_SOConfigurationHost();
      BOOL v21 = v20;
      if (v19)
      {
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v34 = v11;
          __int16 v35 = 2114;
          id v36 = v6;
          _os_log_impl(&dword_2185C9000, v21, OS_LOG_TYPE_DEFAULT, "cache written to file: %{public}@, %{public}@", buf, 0x16u);
        }

        BOOL v22 = 1;
        goto LABEL_25;
      }
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationHost _saveConfigToFile:error:]();
      }

      if (a4) {
        *a4 = v26;
      }
    }
    else
    {
      id v24 = SO_LOG_SOConfigurationHost();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
        -[SOConfigurationHost _saveCacheToFile:error:]();
      }

      if (a4)
      {
        BOOL v22 = 0;
        *a4 = v16;
LABEL_25:

LABEL_26:
        goto LABEL_27;
      }
    }
    BOOL v22 = 0;
    goto LABEL_25;
  }
  BOOL v22 = 0;
LABEL_27:

  objc_sync_exit(v8);
  return v22;
}

- (void)_extensionsLoaded:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v18 = "-[SOConfigurationHost _extensionsLoaded:]";
    __int16 v19 = 2112;
    id v20 = self;
    _os_log_impl(&dword_2185C9000, v5, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  id v6 = self;
  objc_sync_enter(v6);
  uint64_t v7 = [v4 userInfo];
  uint64_t v8 = [v7 objectForKeyedSubscript:@"extensions"];

  uint64_t v9 = [v4 userInfo];
  uint64_t v10 = [v9 objectForKeyedSubscript:@"new"];

  int v11 = [v4 userInfo];
  id v12 = [v11 objectForKeyedSubscript:@"removed"];

  id v13 = SO_LOG_SOConfigurationHost();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    int v18 = v8;
    __int16 v19 = 2114;
    id v20 = v10;
    __int16 v21 = 2114;
    BOOL v22 = v12;
    _os_log_impl(&dword_2185C9000, v13, OS_LOG_TYPE_INFO, "extensions changed: %{public}@, new: %{public}@, removed: %{public}@", buf, 0x20u);
  }

  if (-[SOConfigurationHost count](v10, "count") || [v12 count])
  {
    int v14 = [(SOConfigurationHost *)v6 configurationPendingLock];
    objc_sync_enter(v14);
    [(SOConfigurationHost *)v6 setConfigurationPending:1];
    objc_sync_exit(v14);

    dispatch_time_t v15 = dispatch_time(0, 3000000000);
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __41__SOConfigurationHost__extensionsLoaded___block_invoke;
    block[3] = &unk_26432AC58;
    block[4] = v6;
    dispatch_after(v15, MEMORY[0x263EF83A0], block);
  }

  objc_sync_exit(v6);
}

uint64_t __41__SOConfigurationHost__extensionsLoaded___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _reloadConfigWithReason:1];
}

- (BOOL)_isConfigFileAvailable
{
  v2 = NSDictionary;
  uint64_t v3 = NSURL;
  id v4 = [(SOConfigurationHost *)self _defaultConfigurationFile];
  v5 = [v3 fileURLWithPath:v4];
  id v10 = 0;
  id v6 = [v2 dictionaryWithContentsOfURL:v5 error:&v10];
  id v7 = v10;

  if (v7)
  {
    uint64_t v8 = SO_LOG_SOConfigurationHost();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationHost _isConfigFileAvailable]();
    }
  }
  return v6 != 0;
}

- (id)_stringWithReason:(int64_t)a3
{
  uint64_t v3 = @"FirstLoad";
  if (a3 == 1) {
    uint64_t v3 = @"ExtensionsChanged";
  }
  if (a3 == 2) {
    return @"ModifiedByMDM";
  }
  else {
    return v3;
  }
}

+ (id)maskRegistrationTokenInConfigurationData:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 mutableCopy];
  v5 = [v3 objectForKeyedSubscript:@"RegistrationToken"];

  if (v5) {
    id v6 = @"present";
  }
  else {
    id v6 = @"<null>";
  }
  [v4 setObject:v6 forKeyedSubscript:@"RegistrationToken"];

  return v4;
}

+ (id)maskRegistrationTokenInProfileList:(id)a3
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"Profiles"];

  if (v4)
  {
    uint64_t v17 = (void *)[v3 mutableCopy];
    id v5 = objc_alloc_init(MEMORY[0x263EFF980]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v3;
    id v6 = [v3 objectForKeyedSubscript:@"Profiles"];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v6);
          }
          int v11 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          id v12 = objc_msgSend(v11, "mutableCopy", v17);
          id v13 = [v11 objectForKeyedSubscript:@"RegistrationToken"];
          if (v13) {
            int v14 = @"present";
          }
          else {
            int v14 = @"<null>";
          }
          [v12 setObject:v14 forKeyedSubscript:@"RegistrationToken"];

          [v5 addObject:v12];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v8);
    }

    id v15 = v17;
    [v17 setObject:v5 forKeyedSubscript:@"Profiles"];

    id v3 = v18;
  }
  else
  {
    id v15 = v3;
  }

  return v15;
}

- (id)_defaultConfigurationPath
{
  return @"/var/mobile/Library/ExtensibleSSO/Configuration";
}

- (id)_defaultConfigurationFile
{
  v2 = NSString;
  id v3 = [(SOConfigurationHost *)self _defaultConfigurationPath];
  id v4 = [v2 stringWithFormat:@"%@/%@", v3, @"com.apple.AppSSO.configuration.plist"];

  return v4;
}

- (id)_defaultCacheFile
{
  v2 = NSString;
  id v3 = [(SOConfigurationHost *)self _defaultConfigurationPath];
  id v4 = [v2 stringWithFormat:@"%@/Cache/%@", v3, @"com.apple.AppSSO.cache.json"];

  return v4;
}

- (NSMutableDictionary)associatedDomainCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 40, 1);
}

- (void)setAssociatedDomainCache:(id)a3
{
}

- (BOOL)configurationPending
{
  return self->_configurationPending;
}

- (void)setConfigurationPending:(BOOL)a3
{
  self->_configurationPending = a3;
}

- (NSObject)configurationPendingLock
{
  return objc_getProperty(self, a2, 48, 1);
}

- (void)setConfigurationPendingLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationPendingLock, 0);
  objc_storeStrong((id *)&self->_associatedDomainCache, 0);
  objc_storeStrong((id *)&self->_removedProfiles, 0);
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

+ (void)defaultManager
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_2185C9000, v0, v1, "no SOConfigurationManager!", v2, v3, v4, v5, v6);
}

- (void)saveConfiguration:error:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_2185C9000, v0, v1, "unable to save new configuration, invalid format", v2, v3, v4, v5, v6);
}

- (void)saveConfiguration:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to create cache directory at %{public}@: %{public}@");
}

- (void)saveConfigurationData:(void *)a1 error:(uint64_t)a2 .cold.1(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_0((uint64_t)a1, a2, 5.808e-34);
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v3, (uint64_t)v3, "unable to save new configuration, invalid format: %{private}@", v4);
}

- (void)profileForURL:responseCode:.cold.1()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_2185C9000, v0, v1, "unexpected class in the configuration", v2, v3, v4, v5, v6);
}

- (void)hasAnyMDMProfileForExtension:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "extension: %{public}@ not found", v2, v3, v4, v5, v6);
}

- (void)hasAnyMDMProfileForExtension:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "found profile for extension: %{public}@", v2, v3, v4, v5, v6);
}

- (void)hasAnyMDMProfileForExtension:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "Checking default path: %@", v2, v3, v4, v5, v6);
}

- (void)willHandleURL:responseCode:callerBundleIdentifier:.cold.1()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_2185C9000, v0, v1, "willHandleURL(host): reloading configuration with updated associated domains for URL: %{sensitive, mask.hash}@, extension: %{public}@");
}

- (void)willHandleURL:responseCode:callerBundleIdentifier:.cold.2()
{
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_1_1(&dword_2185C9000, v0, v1, "willHandleURL(host): checking associated domains again for URL: %{sensitive, mask.hash}@, extension: %{public}@");
}

- (void)isConfigurationActiveForExtensionIdentifier:completion:.cold.1()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2185C9000, v0, v1, "%s extensionIdentifier: %{public}@ on %@", v2);
}

- (void)_isConfigurationActiveForExtensionIdentifier:completion:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2185C9000, v0, v1, "Associated domain: validation skipped for extension: %{public}@", v2, v3, v4, v5, v6);
}

- (void)_isConfigurationActiveForExtensionIdentifier:completion:.cold.2()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2185C9000, v0, OS_LOG_TYPE_DEBUG, "Check associated domains", v1, 2u);
}

- (void)_isConfigurationActiveForExtensionIdentifier:(os_log_t)log completion:.cold.3(uint8_t *buf, unsigned char *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl(&dword_2185C9000, log, OS_LOG_TYPE_DEBUG, "Check for SSO extension", buf, 2u);
}

- (void)_isConfigurationActiveForExtensionIdentifier:completion:.cold.4()
{
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_2185C9000, v0, OS_LOG_TYPE_DEBUG, "Check for MDM profile", v1, 2u);
}

- (void)_isConfigurationActiveForExtensionIdentifier:completion:.cold.5()
{
  int v2 = 136315650;
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_1(&dword_2185C9000, v0, v1, "%s extensionIdentifier: %{public}@ on %@", v2);
}

+ (void)_loadProfilesFromDict:.cold.1()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v0, v1, "invalid profile: %{private}@", v2);
}

+ (void)_loadProfilesFromDict:.cold.2()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v0, v1, "multiple profiles have Platform SSO: %{private}@", v2);
}

+ (void)_loadProfilesFromDict:(void *)a1 .cold.3(void *a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_0((uint64_t)a1, a2, 5.808e-34);
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v3, (uint64_t)v3, "invalid profile: %{private}@", v4);
}

+ (void)_loadProfilesFromDict:.cold.4()
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v0, v1, "invalid config: %{private}@", v2);
}

+ (void)_loadProfilesFromURL:logFileError:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to load config at %{private}@, error: %{public}@");
}

- (void)_checkAssociatedDomainForProfiles:(void *)a3 .cold.1(void *a1, uint8_t *buf, void *a3, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *a3 = a1;
  _os_log_debug_impl(&dword_2185C9000, log, OS_LOG_TYPE_DEBUG, "Associated domain: validation skipped for extension: %{public}@", buf, 0xCu);
}

- (void)_checkAssociatedDomainForProfiles:.cold.2()
{
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_4_1(&dword_2185C9000, v0, v1, "Associated domain: failed to save cache to file", v2, v3, v4, v5, v6);
}

- (void)_initDataVaultIfNeededWithError:(uint64_t)a1 .cold.1(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_0(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v2, (uint64_t)v2, "failed to convert to datavault: %{public}s", v3);
}

- (void)_initDataVaultIfNeededWithError:(uint64_t)a1 .cold.2(uint64_t a1, uint64_t a2)
{
  OUTLINED_FUNCTION_10_0(a1, a2, 4.8751e-34);
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v2, (uint64_t)v2, "failed to check the state of datavault: %{public}s", v3);
}

- (void)_initDataVaultIfNeededWithError:.cold.3()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to create configuration directory at %{public}@: %{public}@");
}

- (void)_initCachePath:(NSObject *)a1 ifNeededWithError:.cold.1(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, a1, v3, "failed to convert to datavault: %{public}s", v4);
}

- (void)_initCachePath:(NSObject *)a1 ifNeededWithError:.cold.2(NSObject *a1)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = __error();
  strerror(*v2);
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, a1, v3, "failed to check the state of datavault: %{public}s", v4);
}

- (void)_saveConfigToFile:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to change file attributes of file: %{public}@, error: %{public}@");
}

- (void)_saveConfigToFile:error:.cold.2()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to save config to file: %{public}@, error: %{public}@");
}

- (void)_saveCacheToFile:error:.cold.1()
{
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_6(&dword_2185C9000, v0, v1, "failed to save cache to file: %{public}@, error: %{public}@");
}

- (void)_isConfigFileAvailable
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4_0(&dword_2185C9000, v0, v1, "config file is unavailable: %{public}@", v2);
}

@end