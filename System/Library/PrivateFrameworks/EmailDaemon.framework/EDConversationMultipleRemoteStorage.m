@interface EDConversationMultipleRemoteStorage
+ (OS_os_log)log;
- (BOOL)isInitialized;
- (BOOL)synchronize;
- (EDConversationMultipleRemoteStorage)initWithDelegate:(id)a3;
- (EDConversationRemoteCloudKitStorage)cloudKitStorage;
- (EDConversationRemoteStorage)kvsStorage;
- (EDConversationRemoteStorageDelegate)delegate;
- (EDTransactionService)dataReplicationTransaction;
- (OS_dispatch_queue)privateQueue;
- (id)dictionaryForKey:(id)a3;
- (id)dictionaryRepresentation;
- (id)storageName;
- (void)_handleStorageReady:(id)a3;
- (void)_replicateAllContentFromStore:(id)a3 toStore:(id)a4 synchronize:(BOOL)a5;
- (void)_saveChanges:(id)a3 fromStorage:(id)a4 toStorage:(id)a5 synchronize:(BOOL)a6;
- (void)conversationRemoteStorage:(id)a3 didChangeEntries:(id)a4 reason:(int64_t)a5;
- (void)conversationRemoteStorageDidInitialize:(id)a3;
- (void)refresh;
- (void)removeDictionaryForKey:(id)a3;
- (void)setCloudKitStorage:(id)a3;
- (void)setDataReplicationTransaction:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setDictionary:(id)a3 forKey:(id)a4;
- (void)setKvsStorage:(id)a3;
- (void)setPrivateQueue:(id)a3;
@end

@implementation EDConversationMultipleRemoteStorage

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__EDConversationMultipleRemoteStorage_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_26 != -1) {
    dispatch_once(&log_onceToken_26, block);
  }
  v2 = (void *)log_log_26;

  return (OS_os_log *)v2;
}

void __42__EDConversationMultipleRemoteStorage_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_26;
  log_log_26 = (uint64_t)v1;
}

- (EDConversationMultipleRemoteStorage)initWithDelegate:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)EDConversationMultipleRemoteStorage;
  v5 = [(EDConversationMultipleRemoteStorage *)&v13 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.mail.EDConversationMultipleRemoteStorage", 0);
    privateQueue = v6->_privateQueue;
    v6->_privateQueue = (OS_dispatch_queue *)v7;

    v9 = v6->_privateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__EDConversationMultipleRemoteStorage_initWithDelegate___block_invoke;
    block[3] = &unk_1E6BFF2F0;
    v12 = v6;
    dispatch_sync(v9, block);
  }
  return v6;
}

void __56__EDConversationMultipleRemoteStorage_initWithDelegate___block_invoke(uint64_t a1)
{
  v5 = [[EDConversationRemoteKVSStorage alloc] initWithDelegate:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 32), "setKvsStorage:");

  v6 = [[EDConversationRemoteCloudKitStorage alloc] initWithDelegate:*(void *)(a1 + 32)];
  objc_msgSend(*(id *)(a1 + 32), "setCloudKitStorage:");

  v2 = [EDTransactionService alloc];
  id v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v4 = -[EDTransactionService initWithServiceName:](v2, "initWithServiceName:");
  [*(id *)(a1 + 32) setDataReplicationTransaction:v4];
}

- (id)dictionaryForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  objc_super v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__5;
  v16 = __Block_byref_object_dispose__5;
  id v17 = 0;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__EDConversationMultipleRemoteStorage_dictionaryForKey___block_invoke;
  block[3] = &unk_1E6C00A40;
  id v10 = v4;
  v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(privateQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __56__EDConversationMultipleRemoteStorage_dictionaryForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cloudKitStorage];
  uint64_t v2 = [v5 dictionaryForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)dictionaryRepresentation
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__5;
  id v10 = __Block_byref_object_dispose__5;
  id v11 = 0;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __63__EDConversationMultipleRemoteStorage_dictionaryRepresentation__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __63__EDConversationMultipleRemoteStorage_dictionaryRepresentation__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) cloudKitStorage];
  uint64_t v2 = [v5 dictionaryRepresentation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeDictionaryForKey:(id)a3
{
  id v4 = a3;
  privateQueue = self->_privateQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__EDConversationMultipleRemoteStorage_removeDictionaryForKey___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(privateQueue, v7);
}

void __62__EDConversationMultipleRemoteStorage_removeDictionaryForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) kvsStorage];
  [v2 removeDictionaryForKey:*(void *)(a1 + 40)];

  id v3 = [*(id *)(a1 + 32) cloudKitStorage];
  [v3 removeDictionaryForKey:*(void *)(a1 + 40)];
}

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__EDConversationMultipleRemoteStorage_setDictionary_forKey___block_invoke;
  block[3] = &unk_1E6BFF7A8;
  void block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(privateQueue, block);
}

void __60__EDConversationMultipleRemoteStorage_setDictionary_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) kvsStorage];
  [v2 setDictionary:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];

  id v3 = [*(id *)(a1 + 32) cloudKitStorage];
  [v3 setDictionary:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (BOOL)synchronize
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50__EDConversationMultipleRemoteStorage_synchronize__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __50__EDConversationMultipleRemoteStorage_synchronize__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) kvsStorage];
  if ([v3 synchronize])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) cloudKitStorage];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 synchronize];
  }
}

- (void)refresh
{
  privateQueue = self->_privateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__EDConversationMultipleRemoteStorage_refresh__block_invoke;
  block[3] = &unk_1E6BFF2F0;
  void block[4] = self;
  dispatch_sync(privateQueue, block);
}

void __46__EDConversationMultipleRemoteStorage_refresh__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) kvsStorage];
  [v2 refresh];

  id v3 = [*(id *)(a1 + 32) cloudKitStorage];
  [v3 refresh];
}

- (BOOL)isInitialized
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = -86;
  privateQueue = self->_privateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __52__EDConversationMultipleRemoteStorage_isInitialized__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(privateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __52__EDConversationMultipleRemoteStorage_isInitialized__block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) kvsStorage];
  if ([v3 isInitialized])
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v2 = [*(id *)(a1 + 32) cloudKitStorage];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 isInitialized];
  }
}

- (EDConversationRemoteStorage)kvsStorage
{
  return self->_kvsStorage;
}

- (id)storageName
{
  id v3 = NSString;
  id v4 = [(EDConversationMultipleRemoteStorage *)self kvsStorage];
  id v5 = [(EDConversationMultipleRemoteStorage *)self cloudKitStorage];
  uint64_t v6 = [v3 stringWithFormat:@"Multiple Storages: [%@, %@]", v4, v5];

  return v6;
}

- (void)conversationRemoteStorage:(id)a3 didChangeEntries:(id)a4 reason:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(EDConversationMultipleRemoteStorage *)self cloudKitStorage];

  if (v10 == v8)
  {
    id v12 = [(EDConversationMultipleRemoteStorage *)self dataReplicationTransaction];
    id v11 = [v12 startTransaction];
  }
  else
  {
    id v11 = 0;
  }
  id v13 = [(EDConversationMultipleRemoteStorage *)self privateQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __89__EDConversationMultipleRemoteStorage_conversationRemoteStorage_didChangeEntries_reason___block_invoke;
  block[3] = &unk_1E6C00A90;
  id v18 = v8;
  v19 = self;
  id v21 = v11;
  int64_t v22 = a5;
  id v20 = v9;
  id v14 = v11;
  id v15 = v9;
  id v16 = v8;
  dispatch_async(v13, block);
}

void __89__EDConversationMultipleRemoteStorage_conversationRemoteStorage_didChangeEntries_reason___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [*(id *)(a1 + 40) kvsStorage];

  if (v2 == v3)
  {
    id v9 = *(void **)(a1 + 40);
    uint64_t v10 = *(void *)(a1 + 48);
    id v11 = [v9 kvsStorage];
    id v8 = [*(id *)(a1 + 40) cloudKitStorage];
    [v9 _saveChanges:v10 fromStorage:v11 toStorage:v8 synchronize:1];
  }
  else
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [*(id *)(a1 + 40) cloudKitStorage];

    if (v4 != v5) {
      goto LABEL_6;
    }
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    id v11 = [v6 cloudKitStorage];
    id v8 = [*(id *)(a1 + 40) kvsStorage];
    [v6 _saveChanges:v7 fromStorage:v11 toStorage:v8 synchronize:1];
  }

LABEL_6:
  id v12 = [*(id *)(a1 + 40) delegate];
  [v12 conversationRemoteStorage:*(void *)(a1 + 32) didChangeEntries:*(void *)(a1 + 48) reason:*(void *)(a1 + 64)];

  if (*(void *)(a1 + 56))
  {
    id v13 = [*(id *)(a1 + 40) dataReplicationTransaction];
    [v13 endTransaction:*(void *)(a1 + 56)];
  }
}

- (void)conversationRemoteStorageDidInitialize:(id)a3
{
  id v4 = a3;
  id v5 = [(EDConversationMultipleRemoteStorage *)self privateQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke;
  v7[3] = &unk_1E6BFFAF0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dataReplicationTransaction];
  int v3 = [v2 hasPendingTransactions];

  if (v3)
  {
    id v4 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_2(v4);
    }

    id v5 = [*(id *)(a1 + 32) dataReplicationTransaction];
    [v5 resetPendingTransactions];

    id v6 = *(void **)(a1 + 32);
    uint64_t v7 = [v6 cloudKitStorage];
    id v8 = [*(id *)(a1 + 32) kvsStorage];
    [v6 _replicateAllContentFromStore:v7 toStore:v8 synchronize:1];

    id v9 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_1(v9);
    }
  }
  return [*(id *)(a1 + 32) _handleStorageReady:*(void *)(a1 + 40)];
}

- (void)_saveChanges:(id)a3 fromStorage:(id)a4 toStorage:(id)a5 synchronize:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v25 = a4;
  id v9 = a5;
  uint64_t v10 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v33 = [v27 count];
    __int16 v34 = 2114;
    id v35 = v25;
    __int16 v36 = 2114;
    id v37 = v9;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_INFO, "Replicating %lu changes from %{public}@ to %{public}@", buf, 0x20u);
  }
  BOOL v24 = v6;

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = [v27 allKeys];
  uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v11)
  {
    int v12 = 0;
    uint64_t v13 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        id v16 = [v27 objectForKeyedSubscript:v15];
        id v17 = [v9 dictionaryForKey:v15];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v9 removeDictionaryForKey:v15];
          int v12 = 1;
        }
        else
        {
          id v18 = [v16 objectForKeyedSubscript:@"last-modified"];
          v19 = [v17 objectForKeyedSubscript:@"last-modified"];
          BOOL v20 = v18 > v19;

          if (v20)
          {
            id v21 = (void *)[v16 mutableCopy];
            [v9 setDictionary:v21 forKey:v15];

            int64_t v22 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138544130;
              uint64_t v33 = v15;
              __int16 v34 = 2114;
              id v35 = v25;
              __int16 v36 = 2114;
              id v37 = v9;
              __int16 v38 = 2114;
              id v39 = v9;
              _os_log_debug_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEBUG, "Change %{public}@ replicated from %{public}@ to %{public}@, because %{public}@ entry is more recent.", buf, 0x2Au);
            }
            int v12 = 1;
          }
          else
          {
            int64_t v22 = [(id)objc_opt_class() log];
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138544130;
              uint64_t v33 = v15;
              __int16 v34 = 2114;
              id v35 = v25;
              __int16 v36 = 2114;
              id v37 = v9;
              __int16 v38 = 2114;
              id v39 = v9;
              _os_log_debug_impl(&dword_1DB39C000, v22, OS_LOG_TYPE_DEBUG, "Ignoring change with Key %{public}@ from %{public}@ to %{public}@, because %{public}@ entry is more recent.", buf, 0x2Au);
            }
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v11);

    if ((v12 & v24) == 1) {
      [v9 synchronize];
    }
  }
  else
  {
  }
  v23 = [(id)objc_opt_class() log];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543618;
    uint64_t v33 = (uint64_t)v25;
    __int16 v34 = 2114;
    id v35 = v9;
    _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_INFO, "Finished replicating changes from %{public}@ to %{public}@", buf, 0x16u);
  }
}

- (void)_handleStorageReady:(id)a3
{
  id v4 = (EDConversationRemoteCloudKitStorage *)a3;
  id v5 = v4;
  if (self->_cloudKitStorage == v4
    && ![(EDConversationRemoteCloudKitStorage *)v4 isMigratedFromKVSStorage])
  {
    BOOL v6 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_INFO, "CloudKitStorage finished initializing. Starting migrating content from KVS to CloudKit", buf, 2u);
    }

    [(EDConversationMultipleRemoteStorage *)self _replicateAllContentFromStore:self->_kvsStorage toStore:self->_cloudKitStorage synchronize:0];
    [(EDConversationRemoteCloudKitStorage *)self->_cloudKitStorage setMigratedFromKVSStorage:1];
    [(EDConversationRemoteCloudKitStorage *)self->_cloudKitStorage synchronize];
    uint64_t v7 = [(id)objc_opt_class() log];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_INFO, "Finished migrating content from KVS to CloudKit", v11, 2u);
    }
  }
  if ([(EDConversationRemoteCloudKitStorage *)self->_cloudKitStorage isInitialized])
  {
    if ([(EDConversationRemoteStorage *)self->_kvsStorage isInitialized])
    {
      id v8 = [(EDConversationMultipleRemoteStorage *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if (v9)
      {
        uint64_t v10 = [(EDConversationMultipleRemoteStorage *)self delegate];
        [v10 conversationRemoteStorageDidInitialize:self];
      }
    }
  }
}

- (void)_replicateAllContentFromStore:(id)a3 toStore:(id)a4 synchronize:(BOOL)a5
{
  BOOL v5 = a5;
  id v10 = a3;
  id v8 = a4;
  char v9 = [v10 dictionaryRepresentation];
  [(EDConversationMultipleRemoteStorage *)self _saveChanges:v9 fromStorage:v10 toStorage:v8 synchronize:v5];
}

- (EDConversationRemoteStorageDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDConversationRemoteStorageDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (OS_dispatch_queue)privateQueue
{
  return self->_privateQueue;
}

- (void)setPrivateQueue:(id)a3
{
}

- (void)setKvsStorage:(id)a3
{
}

- (EDConversationRemoteCloudKitStorage)cloudKitStorage
{
  return self->_cloudKitStorage;
}

- (void)setCloudKitStorage:(id)a3
{
}

- (EDTransactionService)dataReplicationTransaction
{
  return self->_dataReplicationTransaction;
}

- (void)setDataReplicationTransaction:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dataReplicationTransaction, 0);
  objc_storeStrong((id *)&self->_cloudKitStorage, 0);
  objc_storeStrong((id *)&self->_kvsStorage, 0);
  objc_storeStrong((id *)&self->_privateQueue, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Finished replicating data from cloudKit to KVS", v1, 2u);
}

void __78__EDConversationMultipleRemoteStorage_conversationRemoteStorageDidInitialize___block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Found pending data replication transaction. Retrying replication from cloudKit to KVS", v1, 2u);
}

@end