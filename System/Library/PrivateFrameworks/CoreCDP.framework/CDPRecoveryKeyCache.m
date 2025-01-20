@interface CDPRecoveryKeyCache
+ (id)sharedInstance;
- (BOOL)cacheRecoveryKey:(id)a3 forAltDSID:(id)a4 error:(id *)a5;
- (CDPRecoveryKeyCache)init;
- (id)fetchRecoveryKeyFromCacheForAltDSID:(id)a3;
- (void)deleteCache;
@end

@implementation CDPRecoveryKeyCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_3 != -1) {
    dispatch_once(&sharedInstance_onceToken_3, &__block_literal_global_7);
  }
  v2 = (void *)sharedInstance_rKCache;
  return v2;
}

uint64_t __37__CDPRecoveryKeyCache_sharedInstance__block_invoke()
{
  sharedInstance_rKCache = objc_alloc_init(CDPRecoveryKeyCache);
  return MEMORY[0x270F9A758]();
}

- (CDPRecoveryKeyCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CDPRecoveryKeyCache;
  v2 = [(CDPRecoveryKeyCache *)&v6 init];
  if (v2)
  {
    v3 = (AAFKeychainManager *)objc_alloc_init(MEMORY[0x263F202F8]);
    keychainManager = v2->_keychainManager;
    v2->_keychainManager = v3;
  }
  return v2;
}

- (BOOL)cacheRecoveryKey:(id)a3 forAltDSID:(id)a4 error:(id *)a5
{
  id v8 = a4;
  v9 = [a3 dataUsingEncoding:4];
  v10 = +[CDPKeychainItemDescriptor recoveryKeyDescriptorForAltDSID:v8];

  v11 = (void *)[objc_alloc(MEMORY[0x263F202E8]) initWithDescriptor:v10 value:v9];
  keychainManager = self->_keychainManager;
  id v17 = 0;
  [(AAFKeychainManager *)keychainManager addOrUpdateKeychainItem:v11 error:&v17];
  id v13 = v17;
  v14 = v13;
  if (v13)
  {
    if (a5) {
      *a5 = v13;
    }
  }
  else
  {
    v15 = _CDPLogSystem();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      -[CDPRecoveryKeyCache cacheRecoveryKey:forAltDSID:error:](v15);
    }
  }
  return v14 == 0;
}

- (id)fetchRecoveryKeyFromCacheForAltDSID:(id)a3
{
  v4 = +[CDPKeychainItemDescriptor recoveryKeyDescriptorForAltDSID:a3];
  keychainManager = self->_keychainManager;
  id v13 = 0;
  objc_super v6 = [(AAFKeychainManager *)keychainManager keychainItemForDescriptor:v4 error:&v13];
  id v7 = v13;
  if (v7)
  {
    id v8 = _CDPLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[CDPRecoveryKeyCache fetchRecoveryKeyFromCacheForAltDSID:]((uint64_t)v7, v8);
    }
    v9 = 0;
    goto LABEL_7;
  }
  v10 = [v6 value];

  if (v10)
  {
    id v11 = [NSString alloc];
    id v8 = [v6 value];
    v9 = (void *)[v11 initWithData:v8 encoding:4];
LABEL_7:

    goto LABEL_8;
  }
  v9 = 0;
LABEL_8:

  return v9;
}

- (void)deleteCache
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_2182AE000, a2, OS_LOG_TYPE_DEBUG, "Cleared RK cache with error: %@", (uint8_t *)&v2, 0xCu);
}

- (void).cxx_destruct
{
}

- (void)cacheRecoveryKey:(os_log_t)log forAltDSID:error:.cold.1(os_log_t log)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = 0;
  _os_log_debug_impl(&dword_2182AE000, log, OS_LOG_TYPE_DEBUG, "Cached RK with error: %@", (uint8_t *)&v1, 0xCu);
}

- (void)fetchRecoveryKeyFromCacheForAltDSID:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2182AE000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch RK from cache: %@", (uint8_t *)&v2, 0xCu);
}

@end