@interface EMUbiquitouslyPersistedDictionary
+ (OS_os_log)log;
+ (id)sharedDictionaryWithIdentifier:(id)a3;
- (EFScheduler)delegateScheduler;
- (EMUbiquitouslyPersistedDictionary)initWithIdentifier:(id)a3;
- (EMUbiquitouslyPersistedDictionary)initWithIdentifier:(id)a3 encrypted:(BOOL)a4 delegate:(id)a5;
- (EMUbiquitouslyPersistedDictionary)initWithPlistPath:(id)a3 identifier:(id)a4;
- (EMUbiquitouslyPersistedDictionary)initWithPlistPath:(id)a3 identifier:(id)a4 encrypted:(BOOL)a5 delegate:(id)a6;
- (EMUbiquitouslyPersistedDictionaryDelegate)delegate;
- (NSMutableDictionary)storedObjects;
- (NSString)identifier;
- (NSString)plistPath;
- (NSUbiquitousKeyValueStore)kvStore;
- (OS_dispatch_queue)mutationQueue;
- (id)_mergeChangesForRemotelyChangedKeys:(id)a3;
- (id)objectForKey:(id)a3;
- (id)objectForKeyedSubscript:(id)a3;
- (unint64_t)count;
- (void)_ensureStoredObjectsAreInKVStore;
- (void)_mergeKVStoreChangedKeys:(id)a3;
- (void)_purgeOldestEntries;
- (void)_resetKVStore;
- (void)_storeChangedExternally:(id)a3;
- (void)_synchronize;
- (void)_writeToPlist;
- (void)notifyDelegateOfChangedItems:(id)a3 deletedItems:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setObject:(id)a3 forKeyedSubscript:(id)a4;
@end

@implementation EMUbiquitouslyPersistedDictionary

- (id)objectForKeyedSubscript:(id)a3
{
  v3 = [(EMUbiquitouslyPersistedDictionary *)self objectForKey:a3];
  return v3;
}

- (id)objectForKey:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EMUbiquitouslyPersistedDictionary.m", 134, @"Invalid parameter not satisfying: %@", @"[key isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__14;
  v18 = __Block_byref_object_dispose__14;
  id v19 = 0;
  v6 = [(EMUbiquitouslyPersistedDictionary *)self mutationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__EMUbiquitouslyPersistedDictionary_objectForKey___block_invoke;
  block[3] = &unk_1E63E6810;
  id v12 = v5;
  v13 = &v14;
  block[4] = self;
  id v7 = v5;
  dispatch_sync(v6, block);

  id v8 = (id)v15[5];
  _Block_object_dispose(&v14, 8);

  return v8;
}

- (OS_dispatch_queue)mutationQueue
{
  return self->_mutationQueue;
}

void __50__EMUbiquitouslyPersistedDictionary_objectForKey___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) storedObjects];
  v2 = [v6 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 objectForKeyedSubscript:@"value"];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (NSMutableDictionary)storedObjects
{
  return self->_storedObjects;
}

- (EMUbiquitouslyPersistedDictionary)initWithIdentifier:(id)a3 encrypted:(BOOL)a4 delegate:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  v10 = +[EMPersistenceLayoutManager mailDataDirectory];
  v11 = NSString;
  id v12 = (objc_class *)objc_opt_class();
  v13 = NSStringFromClass(v12);
  uint64_t v14 = [v11 stringWithFormat:@"%@-%@.plist", v13, v8];
  v15 = [v10 URLByAppendingPathComponent:v14];
  uint64_t v16 = [v15 path];

  v17 = [(EMUbiquitouslyPersistedDictionary *)self initWithPlistPath:v16 identifier:v8 encrypted:v6 delegate:v9];
  return v17;
}

- (EMUbiquitouslyPersistedDictionary)initWithPlistPath:(id)a3 identifier:(id)a4 encrypted:(BOOL)a5 delegate:(id)a6
{
  BOOL v7 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  v36.receiver = self;
  v36.super_class = (Class)EMUbiquitouslyPersistedDictionary;
  v15 = [(EMUbiquitouslyPersistedDictionary *)&v36 init];
  if (v15)
  {
    uint64_t v16 = [v13 copy];
    identifier = v15->_identifier;
    v15->_identifier = (NSString *)v16;

    uint64_t v18 = [objc_alloc(MEMORY[0x1E4F29130]) initWithStoreIdentifier:v15->_identifier type:v7];
    kvStore = v15->_kvStore;
    v15->_kvStore = (NSUbiquitousKeyValueStore *)v18;

    objc_storeStrong((id *)&v15->_plistPath, a3);
    objc_storeWeak((id *)&v15->_delegate, v14);
    dispatch_queue_t v20 = dispatch_queue_create([(NSString *)v15->_identifier UTF8String], 0);
    mutationQueue = v15->_mutationQueue;
    v15->_mutationQueue = (OS_dispatch_queue *)v20;

    v22 = (void *)[objc_alloc(MEMORY[0x1E4F1C9E8]) initWithContentsOfFile:v15->_plistPath];
    v23 = v22;
    if (v22)
    {
      v24 = [v22 objectForKeyedSubscript:@"version"];
      char v25 = [v24 isEqual:&unk_1F1A61F98];

      if ((v25 & 1) == 0)
      {
        v26 = [MEMORY[0x1E4F28B00] currentHandler];
        [v26 handleFailureInMethod:a2 object:v15 file:@"EMUbiquitouslyPersistedDictionary.m" lineNumber:104 description:@"Unsupported version"];
      }
    }
    uint64_t v27 = [MEMORY[0x1E4F60F28] serialDispatchQueueSchedulerWithName:@"com.apple.email.EMUbiquitouslyPersistedDictionary.delegateScheduler" qualityOfService:17];
    delegateScheduler = v15->_delegateScheduler;
    v15->_delegateScheduler = (EFScheduler *)v27;

    v29 = [v23 objectForKeyedSubscript:@"data"];

    if (v29)
    {
      v30 = [v23 objectForKeyedSubscript:@"data"];
      uint64_t v31 = [v30 mutableCopy];
      storedObjects = v15->_storedObjects;
      v15->_storedObjects = (NSMutableDictionary *)v31;
    }
    else
    {
      v33 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v30 = v15->_storedObjects;
      v15->_storedObjects = v33;
    }

    [(EMUbiquitouslyPersistedDictionary *)v15 _mergeKVStoreChangedKeys:0];
    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v15 selector:sel__storeChangedExternally_ name:*MEMORY[0x1E4F28A30] object:v15->_kvStore];
  }
  return v15;
}

- (void)_mergeKVStoreChangedKeys:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v19 = 0;
  dispatch_queue_t v20 = &v19;
  uint64_t v21 = 0x2020000000;
  char v22 = 0;
  if ([v4 count])
  {
    id v5 = [(EMUbiquitouslyPersistedDictionary *)self delegate];
    int v6 = [v5 conformsToProtocol:&unk_1F1A86DD8];

    if (!v6) {
      goto LABEL_4;
    }
    BOOL v7 = [(EMUbiquitouslyPersistedDictionary *)self delegate];
    id v8 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
    id v9 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
    v10 = [v7 mergeChangesForRemotelyChangedKeys:v4 localStore:v8 cloudStore:v9];

    if (!v10)
    {
LABEL_4:
      v10 = [(EMUbiquitouslyPersistedDictionary *)self _mergeChangesForRemotelyChangedKeys:v4];
    }
    v11 = [v10 changedItems];
    id v12 = [v10 deletedItems];
    if ([v11 count] || objc_msgSend(v12, "count"))
    {
      *((unsigned char *)v20 + 24) = 1;
      [(EMUbiquitouslyPersistedDictionary *)self notifyDelegateOfChangedItems:v11 deletedItems:v12];
    }
    if ([v10 requiresSynchronizing]) {
      [(EMUbiquitouslyPersistedDictionary *)self _synchronize];
    }
  }
  else
  {
    id v13 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
    id v14 = [v13 dictionaryRepresentation];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __62__EMUbiquitouslyPersistedDictionary__mergeKVStoreChangedKeys___block_invoke;
    v18[3] = &unk_1E63E6888;
    v18[4] = self;
    v18[5] = &v19;
    [v14 enumerateKeysAndObjectsUsingBlock:v18];
  }
  if (*((unsigned char *)v20 + 24))
  {
    v15 = +[EMUbiquitouslyPersistedDictionary log];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
      *(_DWORD *)buf = 138412290;
      v24 = v16;
      _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "after merging changes: %@", buf, 0xCu);
    }
    [(EMUbiquitouslyPersistedDictionary *)self _writeToPlist];
  }
  else
  {
    v17 = +[EMUbiquitouslyPersistedDictionary log];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BEFDB000, v17, OS_LOG_TYPE_DEFAULT, "no changes, all in sync already", buf, 2u);
    }
  }
  _Block_object_dispose(&v19, 8);
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__EMUbiquitouslyPersistedDictionary_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_41 != -1) {
    dispatch_once(&log_onceToken_41, block);
  }
  v2 = (void *)log_log_41;
  return (OS_os_log *)v2;
}

void __40__EMUbiquitouslyPersistedDictionary_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_41;
  log_log_41 = (uint64_t)v1;
}

+ (id)sharedDictionaryWithIdentifier:(id)a3
{
  id v3 = a3;
  if (sharedDictionaryWithIdentifier__onceToken != -1) {
    dispatch_once(&sharedDictionaryWithIdentifier__onceToken, &__block_literal_global_57);
  }
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x3032000000;
  id v14 = __Block_byref_object_copy__14;
  v15 = __Block_byref_object_dispose__14;
  id v16 = 0;
  id v4 = sharedDictionaryWithIdentifier__sharedDictionaryQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__EMUbiquitouslyPersistedDictionary_sharedDictionaryWithIdentifier___block_invoke_35;
  v8[3] = &unk_1E63E3E38;
  id v9 = v3;
  v10 = &v11;
  id v5 = v3;
  dispatch_sync(v4, v8);
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __68__EMUbiquitouslyPersistedDictionary_sharedDictionaryWithIdentifier___block_invoke()
{
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.EMUbiquitouslyPersistedDictionary.singletons", 0);
  os_log_t v1 = (void *)sharedDictionaryWithIdentifier__sharedDictionaryQueue;
  sharedDictionaryWithIdentifier__sharedDictionaryQueue = (uint64_t)v0;

  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v3 = (void *)sharedDictionaryWithIdentifier__sharedDictionaries;
  sharedDictionaryWithIdentifier__sharedDictionaries = (uint64_t)v2;
}

void __68__EMUbiquitouslyPersistedDictionary_sharedDictionaryWithIdentifier___block_invoke_35(uint64_t a1)
{
  uint64_t v2 = [(id)sharedDictionaryWithIdentifier__sharedDictionaries objectForKeyedSubscript:*(void *)(a1 + 32)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = [[EMUbiquitouslyPersistedDictionary alloc] initWithIdentifier:*(void *)(a1 + 32) encrypted:0 delegate:0];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    BOOL v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    v10 = (void *)sharedDictionaryWithIdentifier__sharedDictionaries;
    [v10 setObject:v9 forKeyedSubscript:v8];
  }
}

- (EMUbiquitouslyPersistedDictionary)initWithIdentifier:(id)a3
{
  return [(EMUbiquitouslyPersistedDictionary *)self initWithIdentifier:a3 encrypted:0 delegate:0];
}

- (EMUbiquitouslyPersistedDictionary)initWithPlistPath:(id)a3 identifier:(id)a4
{
  return [(EMUbiquitouslyPersistedDictionary *)self initWithPlistPath:a3 identifier:a4 encrypted:0 delegate:0];
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x2020000000;
  unint64_t v10 = 0xAAAAAAAAAAAAAAAALL;
  uint64_t v3 = [(EMUbiquitouslyPersistedDictionary *)self mutationQueue];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __42__EMUbiquitouslyPersistedDictionary_count__block_invoke;
  v6[3] = &unk_1E63E3E38;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __42__EMUbiquitouslyPersistedDictionary_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storedObjects];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"EMUbiquitouslyPersistedDictionary.m", 148, @"Invalid parameter not satisfying: %@", @"[(id)key isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  id v9 = v8;
  if (![v9 length]
    || (unint64_t v10 = [v9 length],
        [(EMUbiquitouslyPersistedDictionary *)self kvStore],
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        unint64_t v12 = [v11 maximumKeyLength],
        v11,
        v10 > v12))
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EMUbiquitouslyPersistedDictionary.m", 151, @"Invalid parameter not satisfying: %@", @"keyString.length > 0 && keyString.length <= self.kvStore.maximumKeyLength" object file lineNumber description];
  }
  id v14 = [(EMUbiquitouslyPersistedDictionary *)self mutationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__EMUbiquitouslyPersistedDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_1E63E4008;
  id v19 = v7;
  dispatch_queue_t v20 = self;
  id v15 = v9;
  id v21 = v15;
  id v22 = v15;
  id v16 = v7;
  dispatch_async(v14, block);
}

void __54__EMUbiquitouslyPersistedDictionary_setObject_forKey___block_invoke(uint64_t a1)
{
  v12[2] = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v3 = objc_msgSend(v2, "ef_dateWithTruncatedSeconds");
  [v3 timeIntervalSince1970];
  double v5 = v4;

  uint64_t v6 = *(void *)(a1 + 32);
  v11[0] = @"value";
  v11[1] = @"updatedAt";
  v12[0] = v6;
  id v7 = [NSNumber numberWithDouble:v5];
  v12[1] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:2];

  id v9 = [*(id *)(a1 + 40) storedObjects];
  [v9 setObject:v8 forKeyedSubscript:*(void *)(a1 + 48)];

  unint64_t v10 = [*(id *)(a1 + 40) kvStore];
  [v10 setObject:v8 forKey:*(void *)(a1 + 56)];

  [*(id *)(a1 + 40) _synchronize];
}

- (void)setObject:(id)a3 forKeyedSubscript:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  if (v7) {
    [(EMUbiquitouslyPersistedDictionary *)self setObject:v7 forKey:v6];
  }
  else {
    [(EMUbiquitouslyPersistedDictionary *)self removeObjectForKey:v6];
  }
}

- (void)removeObjectForKey:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    uint64_t v13 = [MEMORY[0x1E4F28B00] currentHandler];
    [v13 handleFailureInMethod:a2, self, @"EMUbiquitouslyPersistedDictionary.m", 173, @"Invalid parameter not satisfying: %@", @"[(id)key isKindOfClass:[NSString class]]" object file lineNumber description];
  }
  id v6 = v5;
  if (![v6 length]
    || (unint64_t v7 = [v6 length],
        [(EMUbiquitouslyPersistedDictionary *)self kvStore],
        id v8 = objc_claimAutoreleasedReturnValue(),
        unint64_t v9 = [v8 maximumKeyLength],
        v8,
        v7 > v9))
  {
    unint64_t v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"EMUbiquitouslyPersistedDictionary.m", 175, @"Invalid parameter not satisfying: %@", @"keyString.length > 0 && keyString.length <= self.kvStore.maximumKeyLength" object file lineNumber description];
  }
  uint64_t v11 = [(EMUbiquitouslyPersistedDictionary *)self mutationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EMUbiquitouslyPersistedDictionary_removeObjectForKey___block_invoke;
  block[3] = &unk_1E63E2848;
  void block[4] = self;
  id v15 = v6;
  id v16 = v6;
  id v12 = v6;
  dispatch_async(v11, block);
}

uint64_t __56__EMUbiquitouslyPersistedDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storedObjects];
  [v2 setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = [*(id *)(a1 + 32) kvStore];
  [v3 removeObjectForKey:*(void *)(a1 + 48)];

  double v4 = *(void **)(a1 + 32);
  return [v4 _synchronize];
}

- (void)removeAllObjects
{
  uint64_t v3 = [(EMUbiquitouslyPersistedDictionary *)self mutationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__EMUbiquitouslyPersistedDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_1E63E26B0;
  void block[4] = self;
  dispatch_sync(v3, block);
}

uint64_t __53__EMUbiquitouslyPersistedDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) storedObjects];
  [v2 removeAllObjects];

  uint64_t v3 = [MEMORY[0x1E4F28CB8] defaultManager];
  double v4 = [*(id *)(a1 + 32) plistPath];
  [v3 removeItemAtPath:v4 error:0];

  id v5 = *(void **)(a1 + 32);
  return [v5 _resetKVStore];
}

- (void)_writeToPlist
{
  *(_DWORD *)buf = 138543362;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "_writeToPlist failed with error %{public}@", buf, 0xCu);
}

- (void)_ensureStoredObjectsAreInKVStore
{
  uint64_t v3 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __69__EMUbiquitouslyPersistedDictionary__ensureStoredObjectsAreInKVStore__block_invoke;
  v4[3] = &unk_1E63E6838;
  v4[4] = self;
  [v3 enumerateKeysAndObjectsUsingBlock:v4];
}

void __69__EMUbiquitouslyPersistedDictionary__ensureStoredObjectsAreInKVStore__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v9 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) kvStore];
  unint64_t v7 = [v6 objectForKey:v9];

  if (!v7)
  {
    id v8 = [*(id *)(a1 + 32) kvStore];
    [v8 setObject:v5 forKey:v9];
  }
}

- (void)_synchronize
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "KV Store synchronize failed", v1, 2u);
}

- (void)_purgeOldestEntries
{
  uint64_t v3 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
  double v4 = [v3 allKeys];
  id v5 = (void *)[v4 mutableCopy];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __56__EMUbiquitouslyPersistedDictionary__purgeOldestEntries__block_invoke;
  v13[3] = &unk_1E63E6860;
  v13[4] = self;
  [v5 sortUsingComparator:v13];
  for (unint64_t i = 0; ; ++i)
  {
    unint64_t v7 = [v5 count];
    unint64_t v8 = v7 >= 0xA ? 10 : v7;
    if (i >= v8) {
      break;
    }
    id v9 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
    unint64_t v10 = [v5 objectAtIndexedSubscript:i];
    [v9 removeObjectForKey:v10];

    uint64_t v11 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
    id v12 = [v5 objectAtIndexedSubscript:i];
    [v11 removeObjectForKey:v12];
  }
  [(EMUbiquitouslyPersistedDictionary *)self _synchronize];
}

uint64_t __56__EMUbiquitouslyPersistedDictionary__purgeOldestEntries__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  unint64_t v7 = [*(id *)(a1 + 32) storedObjects];
  unint64_t v8 = [v7 objectForKeyedSubscript:v5];
  id v9 = [v8 objectForKeyedSubscript:@"updatedAt"];

  unint64_t v10 = [*(id *)(a1 + 32) storedObjects];
  uint64_t v11 = [v10 objectForKeyedSubscript:v6];
  id v12 = [v11 objectForKeyedSubscript:@"updatedAt"];

  uint64_t v13 = [v9 compare:v12];
  return v13;
}

- (void)_resetKVStore
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[EMUbiquitouslyPersistedDictionary log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    identifier = self->_identifier;
    *(_DWORD *)buf = 138412290;
    dispatch_queue_t v20 = identifier;
    _os_log_impl(&dword_1BEFDB000, v3, OS_LOG_TYPE_DEFAULT, "resetting kv store for %@", buf, 0xCu);
  }

  id v5 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
  id v6 = [v5 dictionaryRepresentation];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = objc_msgSend(v6, "allKeys", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        id v12 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
        [v12 removeObjectForKey:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  uint64_t v13 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
  [v13 synchronize];
}

void __62__EMUbiquitouslyPersistedDictionary__mergeKVStoreChangedKeys___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v12 = a2;
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) storedObjects];
  unint64_t v7 = [v6 objectForKeyedSubscript:v12];

  if (!v7
    || ([v7 objectForKeyedSubscript:@"value"],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKeyedSubscript:@"value"],
        uint64_t v9 = objc_claimAutoreleasedReturnValue(),
        char v10 = [v8 isEqual:v9],
        v9,
        v8,
        (v10 & 1) == 0))
  {
    uint64_t v11 = [*(id *)(a1 + 32) storedObjects];
    [v11 setObject:v5 forKeyedSubscript:v12];

    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
}

- (id)_mergeChangesForRemotelyChangedKeys:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id obj = v18;
  uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v8 = [(EMUbiquitouslyPersistedDictionary *)self kvStore];
        uint64_t v9 = [v8 objectForKey:v7];

        char v10 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
        uint64_t v11 = [v10 objectForKeyedSubscript:v7];

        if (!v9)
        {
          if (v11)
          {
            [v19 addObject:v7];
            long long v15 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
            [v15 removeObjectForKey:v7];
          }
          else
          {
            long long v15 = +[EMUbiquitouslyPersistedDictionary log];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = obj;
              _os_log_impl(&dword_1BEFDB000, v15, OS_LOG_TYPE_DEFAULT, "no changes detected, changed keys=%@", buf, 0xCu);
            }
          }
          goto LABEL_14;
        }
        if (!v11
          || ([v11 objectForKeyedSubscript:@"value"],
              id v12 = objc_claimAutoreleasedReturnValue(),
              [v9 objectForKeyedSubscript:@"value"],
              uint64_t v13 = objc_claimAutoreleasedReturnValue(),
              char v14 = [v12 isEqual:v13],
              v13,
              v12,
              (v14 & 1) == 0))
        {
          [v20 setObject:v9 forKeyedSubscript:v7];
          long long v15 = [(EMUbiquitouslyPersistedDictionary *)self storedObjects];
          [v15 setObject:v9 forKeyedSubscript:v7];
LABEL_14:
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v4);
  }

  if ([v20 count] || objc_msgSend(v19, "count")) {
    long long v16 = [[EMUbiquitouslyPersistedDictionaryMergeResult alloc] initWithChangedItems:v20 deletedItems:v19 requiresSynchronizing:0];
  }
  else {
    long long v16 = 0;
  }

  return v16;
}

- (void)_storeChangedExternally:(id)a3
{
  id v5 = a3;
  id v6 = [(EMUbiquitouslyPersistedDictionary *)self mutationQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke;
  block[3] = &unk_1E63E3088;
  id v9 = v5;
  char v10 = self;
  SEL v11 = a2;
  id v7 = v5;
  dispatch_async(v6, block);
}

void __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) object];
  uint64_t v3 = [*(id *)(a1 + 40) kvStore];

  if (v3 != v2)
  {
    id v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:*(void *)(a1 + 48) object:*(void *)(a1 + 40) file:@"EMUbiquitouslyPersistedDictionary.m" lineNumber:338 description:@"This is not the store we were looking for!"];
  }
  uint64_t v4 = [*(id *)(a1 + 32) userInfo];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A20]];
  unint64_t v6 = [v5 unsignedIntegerValue];

  id v7 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F28A28]];
  uint64_t v8 = +[EMUbiquitouslyPersistedDictionary log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    if (v6 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown change reason (%lu)", v6);
      id v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v9 = off_1E63E68A8[v6];
    }
    *(_DWORD *)buf = 138412546;
    char v14 = v9;
    __int16 v15 = 2112;
    long long v16 = v7;
    _os_log_impl(&dword_1BEFDB000, v8, OS_LOG_TYPE_DEFAULT, "received external KVS change event: %@, changed keys=%@", buf, 0x16u);
  }
  if (v6 < 2) {
    goto LABEL_11;
  }
  if (v6 == 2)
  {
    [*(id *)(a1 + 40) _purgeOldestEntries];
    goto LABEL_16;
  }
  if (v6 == 3)
  {
LABEL_11:
    [*(id *)(a1 + 40) _mergeKVStoreChangedKeys:v7];
  }
  else
  {
    char v10 = +[EMUbiquitouslyPersistedDictionary log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      SEL v11 = _NSU9ChangeReasonString(v6);
      __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke_cold_1(v11, buf, v10);
    }
  }
LABEL_16:
}

- (void)notifyDelegateOfChangedItems:(id)a3 deletedItems:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v6, "ef_mapValues:", &__block_literal_global_134);
  id v9 = [(EMUbiquitouslyPersistedDictionary *)self delegate];
  if (v9)
  {
    char v10 = [(EMUbiquitouslyPersistedDictionary *)self delegateScheduler];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    void v11[2] = __79__EMUbiquitouslyPersistedDictionary_notifyDelegateOfChangedItems_deletedItems___block_invoke_2;
    v11[3] = &unk_1E63E2848;
    id v12 = v9;
    id v13 = v8;
    id v14 = v7;
    [v10 performBlock:v11];
  }
}

id __79__EMUbiquitouslyPersistedDictionary_notifyDelegateOfChangedItems_deletedItems___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 objectForKeyedSubscript:@"value"];
  return v2;
}

uint64_t __79__EMUbiquitouslyPersistedDictionary_notifyDelegateOfChangedItems_deletedItems___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) persistedDictionaryDidChangeRemotelyWithChangedItems:*(void *)(a1 + 40) deletedItems:*(void *)(a1 + 48)];
}

- (NSString)plistPath
{
  return self->_plistPath;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (EMUbiquitouslyPersistedDictionaryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (EMUbiquitouslyPersistedDictionaryDelegate *)WeakRetained;
}

- (EFScheduler)delegateScheduler
{
  return self->_delegateScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateScheduler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_mutationQueue, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);
  objc_storeStrong((id *)&self->_storedObjects, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_plistPath, 0);
}

void __61__EMUbiquitouslyPersistedDictionary__storeChangedExternally___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BEFDB000, log, OS_LOG_TYPE_ERROR, "unhandled change reason: %@", buf, 0xCu);
}

@end