@interface MEExtensionUserPreferences
+ (id)log;
+ (id)sharedInstance;
- (BOOL)isExtensionEnabled:(id)a3;
- (NSMutableDictionary)extensionIDToUserEnabledMap;
- (id)_loadUserPreferences;
- (id)_plistURL;
- (id)_prefsDictionary;
- (id)_serializedData;
- (void)_savePreferences;
- (void)_serializedData;
- (void)setExtensionEnabled:(BOOL)a3 forExtensionID:(id)a4;
- (void)setExtensionIDToUserEnabledMap:(id)a3;
@end

@implementation MEExtensionUserPreferences

+ (id)log
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__MEExtensionUserPreferences_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_2 != -1) {
    dispatch_once(&log_onceToken_2, block);
  }
  v2 = (void *)log_log_2;
  return v2;
}

void __33__MEExtensionUserPreferences_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_2;
  log_log_2 = (uint64_t)v1;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_3);
  }
  v2 = (void *)sharedInstance_sInstance;
  return v2;
}

void __44__MEExtensionUserPreferences_sharedInstance__block_invoke()
{
  v0 = objc_alloc_init(MEExtensionUserPreferences);
  os_log_t v1 = (void *)sharedInstance_sInstance;
  sharedInstance_sInstance = (uint64_t)v0;
}

- (id)_plistURL
{
  if (_plistURL_onceToken != -1) {
    dispatch_once(&_plistURL_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)_plistURL_url;
  return v2;
}

void __39__MEExtensionUserPreferences__plistURL__block_invoke()
{
  id v2 = [MEMORY[0x263F3B198] mailDataDirectory];
  uint64_t v0 = [v2 URLByAppendingPathComponent:@"AppExtensionUserPreferences.plist" isDirectory:0];
  os_log_t v1 = (void *)_plistURL_url;
  _plistURL_url = v0;
}

- (id)_prefsDictionary
{
  id v3 = objc_alloc(MEMORY[0x263EFF8F8]);
  v4 = [(MEExtensionUserPreferences *)self _plistURL];
  v5 = (void *)[v3 initWithContentsOfURL:v4];

  if (v5)
  {
    v6 = [MEMORY[0x263F08AC0] propertyListWithData:v5 options:1 format:0 error:0];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_loadUserPreferences
{
  id v3 = [(MEExtensionUserPreferences *)self _prefsDictionary];
  extensionIDToUserEnabledMap = self->_extensionIDToUserEnabledMap;
  self->_extensionIDToUserEnabledMap = v3;

  v5 = self->_extensionIDToUserEnabledMap;
  if (!v5)
  {
    v6 = (NSMutableDictionary *)objc_opt_new();
    v7 = self->_extensionIDToUserEnabledMap;
    self->_extensionIDToUserEnabledMap = v6;

    v5 = self->_extensionIDToUserEnabledMap;
  }
  return v5;
}

- (BOOL)isExtensionEnabled:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(MEExtensionUserPreferences *)self _loadUserPreferences];
  v7 = [v6 objectForKeyedSubscript:v4];

  v8 = [v7 objectForKeyedSubscript:@"MEExtensionUserEnabled"];

  os_unfair_lock_unlock(p_lock);
  LOBYTE(p_lock) = [v8 BOOLValue];

  return (char)p_lock;
}

- (void)setExtensionEnabled:(BOOL)a3 forExtensionID:(id)a4
{
  BOOL v4 = a3;
  id v9 = a4;
  os_unfair_lock_lock(&self->_lock);
  v6 = [(MEExtensionUserPreferences *)self _loadUserPreferences];
  v7 = [v6 objectForKeyedSubscript:v9];

  if (!v7) {
    v7 = objc_opt_new();
  }
  v8 = [NSNumber numberWithBool:v4];
  [v7 setObject:v8 forKeyedSubscript:@"MEExtensionUserEnabled"];

  [(NSMutableDictionary *)self->_extensionIDToUserEnabledMap setObject:v7 forKeyedSubscript:v9];
  [(MEExtensionUserPreferences *)self _savePreferences];

  os_unfair_lock_unlock(&self->_lock);
}

- (void)_savePreferences
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  uint64_t v2 = *(void *)(a1 + 16);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_2164DB000, a2, OS_LOG_TYPE_DEBUG, "Saving Extension Preferences Dict %@", (uint8_t *)&v3, 0xCu);
}

- (id)_serializedData
{
  uint64_t v13 = *MEMORY[0x263EF8340];
  int v3 = (void *)MEMORY[0x263F08AC0];
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_extensionIDToUserEnabledMap copy];
  id v11 = 0;
  uint64_t v5 = [v3 dataWithPropertyList:v4 format:200 options:0 error:&v11];
  id v6 = v11;

  if (!v5)
  {
    v7 = +[MEExtensionUserPreferences log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v8 = [(NSMutableDictionary *)self->_extensionIDToUserEnabledMap count];
      id v9 = objc_msgSend(v6, "ef_publicDescription");
      [(MEExtensionUserPreferences *)v9 _serializedData];
    }
  }
  return v5;
}

- (NSMutableDictionary)extensionIDToUserEnabledMap
{
  return self->_extensionIDToUserEnabledMap;
}

- (void)setExtensionIDToUserEnabledMap:(id)a3
{
}

- (void).cxx_destruct
{
}

- (void)_serializedData
{
  *(_DWORD *)buf = 134218242;
  *(void *)(buf + 4) = a3;
  *((_WORD *)buf + 6) = 2114;
  *(void *)(buf + 14) = a1;
  _os_log_error_impl(&dword_2164DB000, log, OS_LOG_TYPE_ERROR, "Failed to serialize %lu entries: %{public}@", buf, 0x16u);
}

@end