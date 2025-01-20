@interface SOConfigurationClient
+ (id)defaultClient;
+ (void)defaultClient;
- (BOOL)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5;
- (SOConfiguration)configuration;
- (SOConfigurationClient)init;
- (id)profileForURL:(id)a3 responseCode:(int64_t)a4;
- (int64_t)configVersion;
- (void)_checkNewVersion;
- (void)_reloadConfig;
- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4;
@end

@implementation SOConfigurationClient

uint64_t __38__SOConfigurationClient_defaultClient__block_invoke()
{
  defaultClient_client = objc_alloc_init(SOConfigurationClient);
  return MEMORY[0x1F41817F8]();
}

- (SOConfigurationClient)init
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  v3 = SO_LOG_SOConfigurationClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "-[SOConfigurationClient init]";
    __int16 v13 = 2112;
    v14 = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  v10.receiver = self;
  v10.super_class = (Class)SOConfigurationClient;
  v4 = [(SOConfigurationClient *)&v10 init];
  if (v4)
  {
    v5 = objc_alloc_init(SOClient);
    client = v4->_client;
    v4->_client = v5;

    v7 = [[SOConfigurationVersion alloc] initWithMode:1];
    configurationVersion = v4->_configurationVersion;
    v4->_configurationVersion = v7;
  }
  return v4;
}

- (BOOL)willHandleURL:(id)a3 responseCode:(int64_t)a4 callerBundleIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  objc_super v10 = self;
  objc_sync_enter(v10);
  [(SOConfigurationClient *)v10 _checkNewVersion];
  LOBYTE(a4) = [(SOConfiguration *)v10->_configuration willHandleURL:v8 responseCode:a4 callerBundleIdentifier:v9];
  objc_sync_exit(v10);

  return a4;
}

- (void)_checkNewVersion
{
  int64_t v3 = [(SOConfigurationVersion *)self->_configurationVersion checkVersion];
  if (v3 == 1)
  {
    [(SOConfigurationClient *)self _reloadConfig];
  }
  else if (v3 == 2)
  {
    configuration = self->_configuration;
    self->_configuration = 0;
  }
}

+ (id)defaultClient
{
  if (defaultClient_onceToken != -1) {
    dispatch_once(&defaultClient_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)defaultClient_client;
  if (!defaultClient_client)
  {
    int64_t v3 = SO_LOG_SOConfigurationClient();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      +[SOConfigurationClient defaultClient](v3);
    }

    v2 = (void *)defaultClient_client;
  }
  return v2;
}

- (void)_reloadConfig
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int64_t v3 = SO_LOG_SOConfigurationClient();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[SOConfigurationClient _reloadConfig]";
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = self;
    _os_log_impl(&dword_1D7206000, v3, OS_LOG_TYPE_DEFAULT, "%s  on %@", buf, 0x16u);
  }

  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v7 = __Block_byref_object_copy_;
  id v8 = __Block_byref_object_dispose_;
  id v9 = 0;
  client = self->_client;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __38__SOConfigurationClient__reloadConfig__block_invoke;
  v5[3] = &unk_1E6A6EFD8;
  v5[4] = buf;
  [(SOClient *)client configurationWithCompletion:v5];
  objc_storeStrong((id *)&self->_configuration, *(id *)(*(void *)&buf[8] + 40));
  _Block_object_dispose(buf, 8);
}

void __38__SOConfigurationClient__reloadConfig__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = SO_LOG_SOConfigurationClient();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __38__SOConfigurationClient__reloadConfig__block_invoke_cold_1(v5, (uint64_t)v6, v7);
  }

  uint64_t v8 = *(void *)(*(void *)(a1 + 32) + 8);
  id v9 = *(void **)(v8 + 40);
  *(void *)(v8 + 40) = v5;
}

- (id)profileForURL:(id)a3 responseCode:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  [(SOConfigurationClient *)v7 _checkNewVersion];
  uint64_t v8 = [(SOConfiguration *)v7->_configuration profileForURL:v6 responseCode:a4];
  if (!v8 && v7->_configuration)
  {
    id v9 = SO_LOG_SOConfigurationClient();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      -[SOConfigurationClient profileForURL:responseCode:]((uint64_t)v6, (uint64_t *)&v7->_configuration, v9);
    }
  }
  objc_sync_exit(v7);

  return v8;
}

- (SOConfiguration)configuration
{
  v2 = self;
  objc_sync_enter(v2);
  [(SOConfigurationClient *)v2 _checkNewVersion];
  int64_t v3 = v2->_configuration;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)configVersion
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t v3 = [(SOConfigurationVersion *)v2->_configurationVersion version];
  objc_sync_exit(v2);

  return v3;
}

- (void)isConfigurationActiveForExtensionIdentifier:(id)a3 completion:(id)a4
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationVersion, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_client, 0);
}

+ (void)defaultClient
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D7206000, log, OS_LOG_TYPE_ERROR, "no SOConfigurationClient!", v1, 2u);
}

- (void)profileForURL:(os_log_t)log responseCode:.cold.1(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 141558531;
  uint64_t v5 = 1752392040;
  __int16 v6 = 2117;
  uint64_t v7 = a1;
  __int16 v8 = 2114;
  uint64_t v9 = v3;
  _os_log_error_impl(&dword_1D7206000, log, OS_LOG_TYPE_ERROR, "not AppSSO URL: %{sensitive, mask.hash}@ in %{public}@", (uint8_t *)&v4, 0x20u);
}

void __38__SOConfigurationClient__reloadConfig__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 profiles];
  v6[0] = 67109378;
  v6[1] = [v5 count];
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D7206000, a3, OS_LOG_TYPE_DEBUG, "got new configuration with %d profile(s), error = %{public}@", (uint8_t *)v6, 0x12u);
}

@end