@interface LKUniversalDiskStorage
+ (id)localDictionaryPath;
+ (id)localDirectoryPath;
+ (id)sharedStorage;
- (BOOL)clearKeys:(id)a3;
- (BOOL)isStorageDictionaryModified;
- (BOOL)saveKeyValuePairs:(id)a3 error:(id *)a4;
- (LKUniversalDiskStorage)init;
- (NSDictionary)storageDictionary;
- (OS_dispatch_queue)storageQueue;
- (_opaque_pthread_rwlock_t)lock;
- (id)retrieveValueForKey:(id)a3;
- (void)_refreshStorageCacheIfNeeded;
- (void)clearAllKeyValueStorage:(id)a3;
- (void)clearKeys:(id)a3 completionHandler:(id)a4;
- (void)saveKeyValuePairs:(id)a3 completionHandler:(id)a4;
- (void)setLock:(_opaque_pthread_rwlock_t *)a3;
- (void)setStorageDictionary:(id)a3;
- (void)setStorageDictionaryModified:(BOOL)a3;
- (void)setStorageQueue:(id)a3;
@end

@implementation LKUniversalDiskStorage

+ (id)sharedStorage
{
  if (sharedStorage_onceToken != -1) {
    dispatch_once(&sharedStorage_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)sharedStorage__sharedInstance;
  return v2;
}

uint64_t __39__LKUniversalDiskStorage_sharedStorage__block_invoke()
{
  sharedStorage__sharedInstance = objc_opt_new();
  return MEMORY[0x270F9A758]();
}

- (LKUniversalDiskStorage)init
{
  v10.receiver = self;
  v10.super_class = (Class)LKUniversalDiskStorage;
  v2 = [(LKUniversalDiskStorage *)&v10 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("LDTemporaryLocalStorageQueue", 0);
    storageQueue = v2->_storageQueue;
    v2->_storageQueue = (OS_dispatch_queue *)v3;

    pthread_rwlock_init(&v2->_lock, 0);
    v2->_storageDictionaryModified = 1;
    v5 = (const char *)[@"LKUStorageDictionaryModified" UTF8String];
    v6 = v2->_storageQueue;
    handler[0] = MEMORY[0x263EF8330];
    handler[1] = 3221225472;
    handler[2] = __30__LKUniversalDiskStorage_init__block_invoke;
    handler[3] = &unk_2645FC5C8;
    v9 = v2;
    notify_register_dispatch(v5, &init_notifyToken, v6, handler);
  }
  return v2;
}

uint64_t __30__LKUniversalDiskStorage_init__block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
  {
    int v3 = 138412546;
    v4 = @"LKUStorageDictionaryModified";
    __int16 v5 = 1024;
    int v6 = init_notifyToken;
    _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Notified with %@, token: %d", (uint8_t *)&v3, 0x12u);
  }
  pthread_rwlock_wrlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 32));
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 1;
  return pthread_rwlock_unlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 32));
}

- (BOOL)saveKeyValuePairs:(id)a3 error:(id *)a4
{
  id v6 = a3;
  pthread_rwlock_wrlock(&self->_lock);
  [(LKUniversalDiskStorage *)self _refreshStorageCacheIfNeeded];
  uint64_t v7 = [(LKUniversalDiskStorage *)self storageDictionary];

  if (v7)
  {
    v8 = [(LKUniversalDiskStorage *)self storageDictionary];
    v9 = (void *)[v8 mutableCopy];

    [v9 addEntriesFromDictionary:v6];
    objc_super v10 = (void *)[v9 copy];
    [(LKUniversalDiskStorage *)self setStorageDictionary:v10];
  }
  else
  {
    v9 = (void *)[v6 copy];
    [(LKUniversalDiskStorage *)self setStorageDictionary:v9];
  }

  v11 = [MEMORY[0x263F08850] defaultManager];
  v12 = +[LKUniversalDiskStorage localDirectoryPath];
  char v13 = [v11 fileExistsAtPath:v12];

  if (v13)
  {
    id v14 = 0;
    goto LABEL_7;
  }
  v15 = [MEMORY[0x263F08850] defaultManager];
  v16 = +[LKUniversalDiskStorage localDirectoryPath];
  id v26 = 0;
  char v17 = [v15 createDirectoryAtPath:v16 withIntermediateDirectories:1 attributes:0 error:&v26];
  id v14 = v26;

  if ((v17 & 1) == 0)
  {
    pthread_rwlock_unlock(&self->_lock);
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[LKUniversalDiskStorage saveKeyValuePairs:error:]();
      if (a4) {
        goto LABEL_15;
      }
    }
    else if (a4)
    {
LABEL_15:
      id v14 = v14;
      char v23 = 0;
      *a4 = v14;
      goto LABEL_12;
    }
    char v23 = 0;
    goto LABEL_12;
  }
LABEL_7:
  v18 = v14;
  v19 = [(LKUniversalDiskStorage *)self storageDictionary];
  v20 = NSURL;
  v21 = +[LKUniversalDiskStorage localDictionaryPath];
  v22 = [v20 fileURLWithPath:v21 isDirectory:0];
  id v25 = v18;
  char v23 = [v19 writeToURL:v22 error:&v25];
  id v14 = v25;

  if ((v23 & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
    {
      -[LKUniversalDiskStorage saveKeyValuePairs:error:]();
      if (!a4) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
    if (a4) {
LABEL_10:
    }
      *a4 = v14;
  }
LABEL_11:
  [(LKUniversalDiskStorage *)self setStorageDictionaryModified:1];
  pthread_rwlock_unlock(&self->_lock);
LABEL_12:

  return v23;
}

- (void)saveKeyValuePairs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(LKUniversalDiskStorage *)self storageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__LKUniversalDiskStorage_saveKeyValuePairs_completionHandler___block_invoke;
  block[3] = &unk_2645FC540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __62__LKUniversalDiskStorage_saveKeyValuePairs_completionHandler___block_invoke(void *a1)
{
  v2 = (void *)a1[4];
  uint64_t v3 = a1[5];
  id v7 = 0;
  uint64_t v4 = [v2 saveKeyValuePairs:v3 error:&v7];
  id v5 = v7;
  uint64_t v6 = a1[6];
  if (v6) {
    (*(void (**)(uint64_t, uint64_t, id))(v6 + 16))(v6, v4, v5);
  }
}

- (id)retrieveValueForKey:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  pthread_rwlock_rdlock(p_lock);
  [(LKUniversalDiskStorage *)self _refreshStorageCacheIfNeeded];
  uint64_t v6 = [(LKUniversalDiskStorage *)self storageDictionary];
  id v7 = [v6 objectForKeyedSubscript:v5];

  pthread_rwlock_unlock(p_lock);
  return v7;
}

- (BOOL)clearKeys:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v4 = a3;
  pthread_rwlock_wrlock(&self->_lock);
  [(LKUniversalDiskStorage *)self _refreshStorageCacheIfNeeded];
  id v5 = [(LKUniversalDiskStorage *)self storageDictionary];

  if (v5)
  {
    uint64_t v6 = [(LKUniversalDiskStorage *)self storageDictionary];
    id v7 = (void *)[v6 mutableCopy];

    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v24 != v11) {
            objc_enumerationMutation(v8);
          }
          [v7 setObject:0 forKeyedSubscript:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v23 objects:v29 count:16];
      }
      while (v10);
    }

    id v13 = (void *)[v7 copy];
    [(LKUniversalDiskStorage *)self setStorageDictionary:v13];

    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [(LKUniversalDiskStorage *)self storageDictionary];
      *(_DWORD *)buf = 138543362;
      v28 = v14;
      _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Storing storage dictionary to disk... %{public}@", buf, 0xCu);
    }
    v15 = [(LKUniversalDiskStorage *)self storageDictionary];
    v16 = NSURL;
    char v17 = +[LKUniversalDiskStorage localDictionaryPath];
    v18 = [v16 fileURLWithPath:v17 isDirectory:0];
    id v22 = 0;
    char v19 = [v15 writeToURL:v18 error:&v22];
    id v20 = v22;

    if ((v19 & 1) == 0 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
      -[LKUniversalDiskStorage clearKeys:]();
    }
    [(LKUniversalDiskStorage *)self setStorageDictionaryModified:1];
    pthread_rwlock_unlock(&self->_lock);
  }
  else
  {
    pthread_rwlock_unlock(&self->_lock);
    char v19 = 1;
  }

  return v19;
}

- (void)clearKeys:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(LKUniversalDiskStorage *)self storageQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__LKUniversalDiskStorage_clearKeys_completionHandler___block_invoke;
  block[3] = &unk_2645FC540;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

uint64_t __54__LKUniversalDiskStorage_clearKeys_completionHandler___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) clearKeys:*(void *)(a1 + 40)];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    uint64_t v3 = *(uint64_t (**)(void))(result + 16);
    return v3();
  }
  return result;
}

- (void)clearAllKeyValueStorage:(id)a3
{
  id v4 = a3;
  id v5 = [(LKUniversalDiskStorage *)self storageQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke;
  v7[3] = &unk_2645FC3E0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke(uint64_t a1)
{
  pthread_rwlock_wrlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 32));
  v2 = [MEMORY[0x263F08850] defaultManager];
  uint64_t v3 = +[LKUniversalDiskStorage localDictionaryPath];
  id v6 = 0;
  [v2 removeItemAtPath:v3 error:&v6];
  id v4 = v6;

  [*(id *)(a1 + 32) setStorageDictionary:0];
  [*(id *)(a1 + 32) setStorageDictionaryModified:1];
  pthread_rwlock_unlock((pthread_rwlock_t *)(*(void *)(a1 + 32) + 32));
  if (v4 && os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR)) {
    __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke_cold_1();
  }
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v4);
  }
}

- (void)setStorageDictionaryModified:(BOOL)a3
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  self->_storageDictionaryModified = a3;
  if (a3)
  {
    notify_register_check((const char *)[@"LKUStorageDictionaryModified" UTF8String], &setStorageDictionaryModified__token);
    if (setStorageDictionaryModified__token != -1)
    {
      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        int v3 = 138412546;
        id v4 = @"StorageDictionaryModified";
        __int16 v5 = 1024;
        int v6 = setStorageDictionaryModified__token;
        _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Post %@ notification with token: %d", (uint8_t *)&v3, 0x12u);
      }
      notify_set_state(setStorageDictionaryModified__token, 1uLL);
      notify_post((const char *)[@"LKUStorageDictionaryModified" UTF8String]);
    }
  }
}

- (void)_refreshStorageCacheIfNeeded
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  if ([(LKUniversalDiskStorage *)self isStorageDictionaryModified])
  {
    int v3 = NSDictionary;
    id v4 = NSURL;
    __int16 v5 = +[LKUniversalDiskStorage localDictionaryPath];
    int v6 = [v4 fileURLWithPath:v5 isDirectory:0];
    id v15 = 0;
    uint64_t v7 = [v3 dictionaryWithContentsOfURL:v6 error:&v15];
    id v8 = (char *)v15;

    if (!v8) {
      goto LABEL_6;
    }
    if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      char v17 = v8;
      _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "Failed to read storage dictionary. Error: %{public}@", buf, 0xCu);
    }
    id v9 = NSDictionary;
    id v10 = NSURL;
    uint64_t v11 = +[LKUniversalDiskStorage localDictionaryPath];
    id v12 = [v10 fileURLWithPath:v11 isDirectory:0];
    uint64_t v13 = [v9 dictionaryWithContentsOfURL:v12 error:0];

    uint64_t v7 = (void *)v13;
    if (v13)
    {
LABEL_6:
      id v14 = (void *)[v7 copy];
      [(LKUniversalDiskStorage *)self setStorageDictionary:v14];

      if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315394;
        char v17 = "-[LKUniversalDiskStorage _refreshStorageCacheIfNeeded]";
        __int16 v18 = 2112;
        char v19 = v7;
        _os_log_impl(&dword_2221A9000, MEMORY[0x263EF8438], OS_LOG_TYPE_DEFAULT, "%s: %@", buf, 0x16u);
      }
      [(LKUniversalDiskStorage *)self setStorageDictionaryModified:0];
    }
  }
}

+ (id)localDirectoryPath
{
  if (localDirectoryPath_onceToken != -1) {
    dispatch_once(&localDirectoryPath_onceToken, &__block_literal_global_17);
  }
  v2 = (void *)localDirectoryPath_path;
  return v2;
}

void __44__LKUniversalDiskStorage_localDirectoryPath__block_invoke()
{
  uint64_t v12 = 1;
  v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    v2 = [v1 objectForKeyedSubscript:@"systemgroup.com.apple.userimagecache"];
    uint64_t v3 = [v2 stringByAppendingPathComponent:@"LocalStorage"];
    id v4 = (void *)localDirectoryPath_path;
    localDirectoryPath_path = v3;
  }
  else if (os_log_type_enabled(MEMORY[0x263EF8438], OS_LOG_TYPE_ERROR))
  {
    __44__LKUniversalDiskStorage_localDirectoryPath__block_invoke_cold_1((uint64_t)&v12, v5, v6, v7, v8, v9, v10, v11);
  }
}

+ (id)localDictionaryPath
{
  if (localDictionaryPath_onceToken != -1) {
    dispatch_once(&localDictionaryPath_onceToken, &__block_literal_global_22);
  }
  v2 = (void *)localDictionaryPath_path;
  return v2;
}

void __45__LKUniversalDiskStorage_localDictionaryPath__block_invoke()
{
  id v2 = +[LKUniversalDiskStorage localDirectoryPath];
  uint64_t v0 = [v2 stringByAppendingPathComponent:@"LDTemporaryLocalStorageDict.plist"];
  v1 = (void *)localDictionaryPath_path;
  localDictionaryPath_path = v0;
}

- (OS_dispatch_queue)storageQueue
{
  return self->_storageQueue;
}

- (void)setStorageQueue:(id)a3
{
}

- (_opaque_pthread_rwlock_t)lock
{
  long long v3 = *(_OWORD *)self[1].__opaque;
  *(_OWORD *)&retstr->__opaque[152] = *(_OWORD *)&self->__opaque[184];
  *(_OWORD *)&retstr->__opaque[168] = v3;
  *(void *)&retstr->__opaque[184] = *(void *)&self[1].__opaque[16];
  long long v4 = *(_OWORD *)&self->__opaque[136];
  *(_OWORD *)&retstr->__opaque[88] = *(_OWORD *)&self->__opaque[120];
  *(_OWORD *)&retstr->__opaque[104] = v4;
  long long v5 = *(_OWORD *)&self->__opaque[168];
  *(_OWORD *)&retstr->__opaque[120] = *(_OWORD *)&self->__opaque[152];
  *(_OWORD *)&retstr->__opaque[136] = v5;
  long long v6 = *(_OWORD *)&self->__opaque[72];
  *(_OWORD *)&retstr->__opaque[24] = *(_OWORD *)&self->__opaque[56];
  *(_OWORD *)&retstr->__opaque[40] = v6;
  long long v7 = *(_OWORD *)&self->__opaque[104];
  *(_OWORD *)&retstr->__opaque[56] = *(_OWORD *)&self->__opaque[88];
  *(_OWORD *)&retstr->__opaque[72] = v7;
  long long v8 = *(_OWORD *)&self->__opaque[40];
  *(_OWORD *)&retstr->__sig = *(_OWORD *)&self->__opaque[24];
  *(_OWORD *)&retstr->__opaque[8] = v8;
  return self;
}

- (void)setLock:(_opaque_pthread_rwlock_t *)a3
{
  *(_OWORD *)&self->_lock.__sig = *(_OWORD *)&a3->__sig;
  long long v3 = *(_OWORD *)&a3->__opaque[8];
  long long v4 = *(_OWORD *)&a3->__opaque[24];
  long long v5 = *(_OWORD *)&a3->__opaque[56];
  *(_OWORD *)&self->_lock.__opaque[40] = *(_OWORD *)&a3->__opaque[40];
  *(_OWORD *)&self->_lock.__opaque[56] = v5;
  *(_OWORD *)&self->_lock.__opaque[8] = v3;
  *(_OWORD *)&self->_lock.__opaque[24] = v4;
  long long v6 = *(_OWORD *)&a3->__opaque[72];
  long long v7 = *(_OWORD *)&a3->__opaque[88];
  long long v8 = *(_OWORD *)&a3->__opaque[120];
  *(_OWORD *)&self->_lock.__opaque[104] = *(_OWORD *)&a3->__opaque[104];
  *(_OWORD *)&self->_lock.__opaque[120] = v8;
  *(_OWORD *)&self->_lock.__opaque[72] = v6;
  *(_OWORD *)&self->_lock.__opaque[88] = v7;
  long long v9 = *(_OWORD *)&a3->__opaque[136];
  long long v10 = *(_OWORD *)&a3->__opaque[152];
  long long v11 = *(_OWORD *)&a3->__opaque[168];
  *(void *)&self->_lock.__opaque[184] = *(void *)&a3->__opaque[184];
  *(_OWORD *)&self->_lock.__opaque[152] = v10;
  *(_OWORD *)&self->_lock.__opaque[168] = v11;
  *(_OWORD *)&self->_lock.__opaque[136] = v9;
}

- (NSDictionary)storageDictionary
{
  return self->_storageDictionary;
}

- (void)setStorageDictionary:(id)a3
{
}

- (BOOL)isStorageDictionaryModified
{
  return self->_storageDictionaryModified;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageDictionary, 0);
  objc_storeStrong((id *)&self->_storageQueue, 0);
}

- (void)saveKeyValuePairs:error:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2221A9000, MEMORY[0x263EF8438], v0, "Failed to save storage file with error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)saveKeyValuePairs:error:.cold.2()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2221A9000, MEMORY[0x263EF8438], v0, "Can not create storage folder, error: %{public}@", v1, v2, v3, v4, v5);
}

- (void)clearKeys:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2221A9000, MEMORY[0x263EF8438], v0, "Failed to save storage file, error: %{public}@", v1, v2, v3, v4, v5);
}

void __50__LKUniversalDiskStorage_clearAllKeyValueStorage___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2221A9000, MEMORY[0x263EF8438], v0, "Failed to remove the stored file, error: %@", v1, v2, v3, v4, v5);
}

void __44__LKUniversalDiskStorage_localDirectoryPath__block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end