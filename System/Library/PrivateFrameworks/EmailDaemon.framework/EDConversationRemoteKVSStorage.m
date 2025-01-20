@interface EDConversationRemoteKVSStorage
+ (OS_os_log)log;
- (BOOL)initialized;
- (BOOL)isInitialized;
- (BOOL)synchronize;
- (EDConversationRemoteKVSStorage)initWithDelegate:(id)a3;
- (EDConversationRemoteStorageDelegate)delegate;
- (NSUbiquitousKeyValueStore)kvStore;
- (OS_dispatch_queue)privateQueue;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryRepresentation;
- (id)storageName;
- (id)subsetOfMessageIDsToSyncFromMessageIDString:(id)a3;
- (void)_storeChangedExternally:(id)a3;
- (void)removeDictionaryForKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictionary:(id)a3 forKey:(id)a4;
- (void)setInitialized:(BOOL)a3;
- (void)setKvStore:(id)a3;
- (void)setPrivateQueue:(id)a3;
@end

@implementation EDConversationRemoteKVSStorage

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __37__EDConversationRemoteKVSStorage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_30 != -1) {
    dispatch_once(&log_onceToken_30, block);
  }
  v2 = (void *)log_log_30;

  return (OS_os_log *)v2;
}

void __37__EDConversationRemoteKVSStorage_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_30;
  log_log_30 = (uint64_t)v1;
}

- (EDConversationRemoteKVSStorage)initWithDelegate:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)EDConversationRemoteKVSStorage;
  v5 = [(EDConversationRemoteKVSStorage *)&v18 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Initializing Conversation KVS storage", buf, 2u);
    }

    objc_storeWeak((id *)&v5->_delegate, v4);
    uint64_t v8 = [MEMORY[0x1E4F29130] additionalStoreWithIdentifier:@"com.apple.mail.threadinfo"];
    kvStore = v5->_kvStore;
    v5->_kvStore = (NSUbiquitousKeyValueStore *)v8;

    dispatch_queue_t v10 = dispatch_queue_create("com.apple.mail.EDConversationRemoteKVSStorage", 0);
    privateQueue = v5->_privateQueue;
    v5->_privateQueue = (OS_dispatch_queue *)v10;

    v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v12 addObserver:v6 selector:sel__storeChangedExternally_ name:*MEMORY[0x1E4F28A30] object:v6->_kvStore];
    v13 = v6->_privateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __51__EDConversationRemoteKVSStorage_initWithDelegate___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    v16 = v6;
    dispatch_async(v13, block);
  }
  return v6;
}

void __51__EDConversationRemoteKVSStorage_initWithDelegate___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setInitialized:1];
  id v3 = [*(id *)(a1 + 32) delegate];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    id v4 = [*(id *)(a1 + 32) delegate];
    [v4 conversationRemoteStorageDidInitialize:*(void *)(a1 + 32)];
  }
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__EDConversationRemoteKVSStorage_setDictionary_forKey___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  id v12 = v6;
  v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(privateQueue, block);
}

void __55__EDConversationRemoteKVSStorage_setDictionary_forKey___block_invoke(uint64_t a1)
{
  char v2 = *(void **)(a1 + 32);
  id v3 = *(void **)(a1 + 40);
  if (v2)
  {
    id v4 = [v2 objectForKeyedSubscript:@"message-ids"];
    id v6 = [v3 subsetOfMessageIDsToSyncFromMessageIDString:v4];

    [*(id *)(a1 + 32) setObject:v6 forKeyedSubscript:@"message-ids"];
    v5 = [*(id *)(a1 + 40) kvStore];
    [v5 setDictionary:*(void *)(a1 + 32) forKey:*(void *)(a1 + 48)];
  }
  else
  {
    id v6 = [*(id *)(a1 + 40) kvStore];
    [v6 removeObjectForKey:*(void *)(a1 + 48)];
  }
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__8;
  id v10 = __Block_byref_object_dispose__8;
  id v11 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __58__EDConversationRemoteKVSStorage_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __58__EDConversationRemoteKVSStorage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) kvStore];
  uint64_t v2 = [v5 dictionaryRepresentation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__8;
  v16 = __Block_byref_object_dispose__8;
  id v17 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__EDConversationRemoteKVSStorage_dictionaryForKey___block_invoke;
  block[3] = &unk_1E6C00A40;
  id v10 = v4;
  id v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(privateQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __51__EDConversationRemoteKVSStorage_dictionaryForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) kvStore];
  uint64_t v2 = [v5 dictionaryForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeDictionaryForKey:(id)a3
{
  id v4 = a3;
  privateQueue = self->_privateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__EDConversationRemoteKVSStorage_removeDictionaryForKey___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(privateQueue, v7);
}

void __57__EDConversationRemoteKVSStorage_removeDictionaryForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) kvStore];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)synchronize
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __45__EDConversationRemoteKVSStorage_synchronize__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __45__EDConversationRemoteKVSStorage_synchronize__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(a1 + 32) kvStore];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 synchronize];

  char v3 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = *(unsigned __int8 *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
    uint64_t v5 = [*(id *)(a1 + 32) kvStore];
    uint64_t v6 = (void *)v5;
    id v7 = @"succeeded";
    if (!v4) {
      id v7 = @"failed";
    }
    int v8 = 138412546;
    char v9 = v7;
    __int16 v10 = 2112;
    uint64_t v11 = v5;
    _os_log_impl(&dword_1DB39C000, v3, OS_LOG_TYPE_DEFAULT, "Synchronizing with KVS store %@: %@", (uint8_t *)&v8, 0x16u);
  }
}

- (id)storageName
{
  id v2 = (objc_class *)objc_opt_class();

  return NSStringFromClass(v2);
}

- (BOOL)initialized
{
  return 1;
}

- (id)subsetOfMessageIDsToSyncFromMessageIDString:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v5 = [v3 componentsSeparatedByString:@" "];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __78__EDConversationRemoteKVSStorage_subsetOfMessageIDsToSyncFromMessageIDString___block_invoke;
  v9[3] = &unk_1E6C00D70;
  id v6 = v4;
  id v10 = v6;
  [v5 enumerateObjectsUsingBlock:v9];
  id v7 = [v6 componentsJoinedByString:@" "];

  return v7;
}

uint64_t __78__EDConversationRemoteKVSStorage_subsetOfMessageIDsToSyncFromMessageIDString___block_invoke(uint64_t a1, uint64_t a2, unint64_t a3, unsigned char *a4)
{
  uint64_t result = [*(id *)(a1 + 32) addObject:a2];
  if (a3 >= 5) {
    *a4 = 1;
  }
  return result;
}

- (void)_storeChangedExternally:(id)a3
{
  id v4 = a3;
  privateQueue = self->_privateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  id v8 = v4;
  char v9 = self;
  id v6 = v4;
  dispatch_async(privateQueue, v7);
}

void __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke(uint64_t a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v2 = (id *)(a1 + 32);
  v28 = [*(id *)(a1 + 32) object];
  v24 = [*v2 userInfo];
  id v3 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F28A20]];
  unint64_t v4 = [v3 unsignedIntegerValue];

  v27 = [v24 objectForKeyedSubscript:*MEMORY[0x1E4F28A28]];
  uint64_t v5 = [(id)objc_opt_class() log];
  unint64_t v25 = v4;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown change reason (%lu)", v4);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E6C00DB8[v4];
    }
    *(_DWORD *)buf = 138412546;
    v37 = v6;
    __int16 v38 = 2112;
    v39 = v27;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Received external KVS change event: %@, changed keys=%@", buf, 0x16u);
  }
  if (v4 != 2)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", -[NSObject count](v27, "count"));
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke_30;
    aBlock[3] = &unk_1E6C00D98;
    v23 = v8;
    v34 = v23;
    char v9 = (void (**)(void *, uint64_t, void *, void))_Block_copy(aBlock);
    if ([v27 count])
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id v10 = v27;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v30;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v30 != v12) {
              objc_enumerationMutation(v10);
            }
            uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
            v15 = [v28 dictionaryForKey:v14];
            v16 = v15;
            if (!v15)
            {
              os_log_t v1 = [MEMORY[0x1E4F1CA98] null];
              v16 = v1;
            }
            v9[2](v9, v14, v16, 0);
            if (!v15) {
          }
            }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v29 objects:v35 count:16];
        }
        while (v11);
      }
    }
    else
    {
      id v10 = [v28 dictionaryRepresentation];
      [v10 enumerateKeysAndObjectsUsingBlock:v9];
    }

    if (v25 >= 3)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"unknown change reason (%lu)", v25);
      id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v17 = off_1E6C00DB8[v25];
    }
    objc_super v18 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v37 = v17;
      __int16 v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_1DB39C000, v18, OS_LOG_TYPE_DEFAULT, "%@: %@", buf, 0x16u);
    }

    if (v25)
    {
      uint64_t v19 = a1;
      if (v25 == 1)
      {
        uint64_t v20 = 1;
LABEL_36:
        v22 = [*(id *)(v19 + 40) delegate];
        [v22 conversationRemoteStorage:*(void *)(v19 + 40) didChangeEntries:v23 reason:v20];

        id v7 = v23;
        goto LABEL_37;
      }
      v21 = [(id)objc_opt_class() log];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v37 = v17;
        _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Unknown change reason: %@", buf, 0xCu);
      }

      uint64_t v20 = 0;
    }
    else
    {
      uint64_t v20 = 2;
    }
    uint64_t v19 = a1;
    goto LABEL_36;
  }
  id v7 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "iCloud Key Value Store Over-Quota…", buf, 2u);
  }
LABEL_37:
}

void __58__EDConversationRemoteKVSStorage__storeChangedExternally___block_invoke_30(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    || ([MEMORY[0x1E4F1CA98] null],
        id v6 = (id)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 == v5))
  {
    [*(id *)(a1 + 32) setObject:v5 forKeyedSubscript:v7];
  }
}

- (EDConversationRemoteStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDConversationRemoteStorageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (NSUbiquitousKeyValueStore)kvStore
{
  return self->_kvStore;
}

- (void)setKvStore:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (BOOL)isInitialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privateQueue, 0);
  objc_storeStrong((id *)&self->_kvStore, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end