@interface SOKerberosSettingsManager
- (BOOL)createKerberosSettingsCache;
- (SOKerberosSettingsManager)init;
- (void)createKerberosSettingsCache;
- (void)saveKerberosValuesForProfile:(id)a3;
@end

@implementation SOKerberosSettingsManager

- (SOKerberosSettingsManager)init
{
  v3.receiver = self;
  v3.super_class = (Class)SOKerberosSettingsManager;
  return [(SOKerberosSettingsManager *)&v3 init];
}

- (void)saveKerberosValuesForProfile:(id)a3
{
  id v3 = a3;
  v4 = SO_LOG_SOKerberosSettingsManager();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosSettingsManager saveKerberosValuesForProfile:].cold.4();
  }

  v5 = [v3 realm];
  id v36 = 0;
  v6 = +[SOKerberosHeimdalPluginSettings retrieveCurrentSettingsForRealm:v5 error:&v36];
  id v7 = v36;

  if (!v6)
  {
    v8 = [SOKerberosHeimdalPluginSettings alloc];
    v9 = [v3 realm];
    v6 = [(SOKerberosHeimdalPluginSettings *)v8 initWithRealm:v9];
  }
  v10 = [(SOKerberosHeimdalPluginSettings *)v6 hosts];
  v11 = [v3 hosts];
  int v12 = [v10 isEqualToArray:v11];

  if ((v12 & 1) == 0)
  {
    v13 = [v3 hosts];
    v14 = (void *)[v13 copy];
    [(SOKerberosHeimdalPluginSettings *)v6 setHosts:v14];
  }
  int v15 = v12 ^ 1;
  v16 = [SOKerberosExtensionData alloc];
  v17 = [v3 extensionData];
  v18 = [(SOKerberosExtensionData *)v16 initWithDictionary:v17];

  if (!v18)
  {
    v29 = SO_LOG_SOKerberosSettingsManager();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosSettingsManager saveKerberosValuesForProfile:](v3, v29);
    }
    goto LABEL_20;
  }
  BOOL v19 = [(SOKerberosHeimdalPluginSettings *)v6 isDefaultRealm];
  if (v19 != [(SOKerberosExtensionData *)v18 isDefaultRealm])
  {
    [(SOKerberosHeimdalPluginSettings *)v6 setDefaultRealm:[(SOKerberosExtensionData *)v18 isDefaultRealm]];
    int v15 = 1;
  }
  v20 = [(SOKerberosHeimdalPluginSettings *)v6 domainRealmMapping];
  v21 = [(SOKerberosExtensionData *)v18 domainRealmMapping];
  char v22 = [v20 isEqualToDictionary:v21];

  if ((v22 & 1) == 0)
  {
    v23 = [(SOKerberosExtensionData *)v18 domainRealmMapping];
    [(SOKerberosHeimdalPluginSettings *)v6 setDomainRealmMapping:v23];

    int v15 = 1;
  }
  uint64_t v24 = [(SOKerberosHeimdalPluginSettings *)v6 credentialUseMode];
  if (v24 != [(SOKerberosExtensionData *)v18 credentialUseMode])
  {
    [(SOKerberosHeimdalPluginSettings *)v6 setCredentialUseMode:[(SOKerberosExtensionData *)v18 credentialUseMode]];
    int v15 = 1;
  }
  if (![(SOKerberosExtensionData *)v18 useSiteAutoDiscovery])
  {
    v25 = [(SOKerberosExtensionData *)v18 siteCode];
    [(SOKerberosHeimdalPluginSettings *)v6 setSiteCode:v25];
  }
  v26 = [(SOKerberosHeimdalPluginSettings *)v6 kdcs];
  v27 = [(SOKerberosExtensionData *)v18 preferredKDCs];
  char v28 = [v26 isEqualToArray:v27];

  if ((v28 & 1) == 0)
  {
    v29 = [(SOKerberosExtensionData *)v18 preferredKDCs];
    id v30 = [v29 copy];
    [(SOKerberosHeimdalPluginSettings *)v6 setKdcs:v30];

    int v15 = 1;
LABEL_20:
  }
  v31 = SO_LOG_SOKerberosSettingsManager();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
    -[SOKerberosSettingsManager saveKerberosValuesForProfile:](v15, v31);
  }

  if (v15)
  {
    id v35 = v7;
    BOOL v32 = [(SOKerberosHeimdalPluginSettings *)v6 saveWithError:&v35];
    id v33 = v35;

    if (!v32)
    {
      v34 = SO_LOG_SOKerberosSettingsManager();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
        -[SOKerberosSettingsManager saveKerberosValuesForProfile:]();
      }
    }
  }
  else
  {
    id v33 = v7;
  }
}

- (BOOL)createKerberosSettingsCache
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = SO_LOG_SOKerberosSettingsManager();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[SOKerberosSettingsManager createKerberosSettingsCache]";
    __int16 v12 = 2112;
    v13 = self;
    _os_log_impl(&dword_221304000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  id v9 = 0;
  BOOL v5 = +[SOKerberosHeimdalPluginSettings createSettingCacheEntryIfNeededWithError:&v9];
  id v6 = v9;
  if (!v5)
  {
    id v7 = SO_LOG_SOKerberosSettingsManager();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      -[SOKerberosSettingsManager createKerberosSettingsCache]();
    }
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)saveKerberosValuesForProfile:.cold.1()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "error when saving plugin settings: %@", v1, 0xCu);
}

- (void)saveKerberosValuesForProfile:(char)a1 .cold.2(char a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_debug_impl(&dword_221304000, a2, OS_LOG_TYPE_DEBUG, "need to save: %d", (uint8_t *)v2, 8u);
}

- (void)saveKerberosValuesForProfile:(void *)a1 .cold.3(void *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 extensionData];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, a2, OS_LOG_TYPE_ERROR, "error deserializing extension data: %{private}@", v4, 0xCu);
}

- (void)saveKerberosValuesForProfile:.cold.4()
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_221304000, v0, OS_LOG_TYPE_DEBUG, "Saving values for profile: %@", v1, 0xCu);
}

- (void)createKerberosSettingsCache
{
  uint64_t v2 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_221304000, v0, OS_LOG_TYPE_ERROR, "error when creating settings cache: %@", v1, 0xCu);
}

@end