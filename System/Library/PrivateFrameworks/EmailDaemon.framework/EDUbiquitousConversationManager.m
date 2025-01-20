@interface EDUbiquitousConversationManager
+ (OS_os_log)log;
- (BOOL)_synchronize;
- (BOOL)hasSubscribedConversations;
- (BOOL)initialized;
- (EDConversationRemoteStorage)cloudStorage;
- (EDUbiquitousConversationManager)initWithDelegate:(id)a3;
- (EDUbiquitousConversationManagerDelegate)delegate;
- (NSMutableDictionary)conversationIDsBySyncKey;
- (NSMutableSet)unmatchedKeys;
- (OS_dispatch_queue)queue;
- (id)_syncKeyForConversationID:(int64_t)a3;
- (id)syncKeyForUpdatedConversation:(int64_t)a3 flags:(unint64_t)a4;
- (void)_mergeServerChanges:(id)a3;
- (void)_setCloudStorageValue:(id)a3 forKey:(id)a4;
- (void)conversationRemoteStorage:(id)a3 didChangeEntries:(id)a4 reason:(int64_t)a5;
- (void)performDailyExportForChangedConversations:(id)a3;
- (void)performInitialSync;
- (void)pruneDatabasePurgingOldestEntries:(BOOL)a3;
- (void)setCloudStorage:(id)a3;
- (void)setConversationIDsBySyncKey:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setFlags:(unint64_t)a3 forConversations:(id)a4;
- (void)setInitialized:(BOOL)a3;
- (void)setQueue:(id)a3;
- (void)setUnmatchedKeys:(id)a3;
@end

@implementation EDUbiquitousConversationManager

void __61__EDUbiquitousConversationManager_hasSubscribedConversations__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count] != 0;
}

- (NSMutableDictionary)conversationIDsBySyncKey
{
  return self->_conversationIDsBySyncKey;
}

- (BOOL)hasSubscribedConversations
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__EDUbiquitousConversationManager_hasSubscribedConversations__block_invoke;
  v5[3] = &unk_1E6C00A68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

+ (OS_os_log)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __38__EDUbiquitousConversationManager_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_98 != -1) {
    dispatch_once(&log_onceToken_98, block);
  }
  id v2 = (void *)log_log_98;

  return (OS_os_log *)v2;
}

void __38__EDUbiquitousConversationManager_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  id v2 = (void *)log_log_98;
  log_log_98 = (uint64_t)v1;
}

- (EDUbiquitousConversationManager)initWithDelegate:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)EDUbiquitousConversationManager;
  v5 = [(EDUbiquitousConversationManager *)&v11 init];
  if (v5)
  {
    uint64_t v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    unmatchedKeys = v5->_unmatchedKeys;
    v5->_unmatchedKeys = v6;

    dispatch_queue_t v8 = dispatch_queue_create("com.apple.mobilemail.UbiquitousConversationManager", 0);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v8;

    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v5;
}

- (void)performInitialSync
{
  if (![(EDUbiquitousConversationManager *)self initialized])
  {
    id v3 = [[EDConversationMultipleRemoteStorage alloc] initWithDelegate:self];
    cloudStorage = self->_cloudStorage;
    self->_cloudStorage = (EDConversationRemoteStorage *)v3;

    v5 = [(EDUbiquitousConversationManager *)self delegate];
    uint64_t v6 = [v5 syncedConversationIDsBySyncKey];
    v7 = (void *)[v6 mutableCopy];
    [(EDUbiquitousConversationManager *)self setConversationIDsBySyncKey:v7];

    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __53__EDUbiquitousConversationManager_performInitialSync__block_invoke;
    block[3] = &unk_1E6BFF2F0;
    block[4] = self;
    dispatch_async(queue, block);
    [(EDUbiquitousConversationManager *)self setInitialized:1];
  }
}

void __53__EDUbiquitousConversationManager_performInitialSync__block_invoke(uint64_t a1)
{
  os_log_t v1 = *(void **)(a1 + 32);
  id v2 = [v1 cloudStorage];
  objc_msgSend(v1, "conversationRemoteStorage:didChangeEntries:reason:");
}

- (id)syncKeyForUpdatedConversation:(int64_t)a3 flags:(unint64_t)a4
{
  uint64_t v8 = 0;
  char v9 = &v8;
  uint64_t v10 = 0x3032000000;
  objc_super v11 = __Block_byref_object_copy__46;
  v12 = __Block_byref_object_dispose__46;
  v13 = &stru_1F3583658;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __71__EDUbiquitousConversationManager_syncKeyForUpdatedConversation_flags___block_invoke;
  block[3] = &unk_1E6C07880;
  block[4] = self;
  void block[5] = &v8;
  block[6] = a3;
  dispatch_sync(queue, block);
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __71__EDUbiquitousConversationManager_syncKeyForUpdatedConversation_flags___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) _syncKeyForConversationID:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    uint64_t v5 = objc_msgSend(NSString, "ef_UUID");
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    id v9 = [NSNumber numberWithLongLong:*(void *)(a1 + 48)];
    uint64_t v8 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
    [v8 setObject:v9 forKeyedSubscript:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  }
}

- (void)setFlags:(unint64_t)a3 forConversations:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    unint64_t v15 = a3;
    __int16 v16 = 2112;
    id v17 = v6;
    _os_log_impl(&dword_1DB39C000, v7, OS_LOG_TYPE_DEFAULT, "Setting conversation flags %llu for conversations: %@", buf, 0x16u);
  }

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke;
  block[3] = &unk_1E6C00900;
  id v11 = v6;
  v12 = self;
  unint64_t v13 = a3;
  id v9 = v6;
  dispatch_async(queue, block);
}

uint64_t __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke_2;
  v5[3] = &unk_1E6C078A8;
  uint64_t v3 = *(void *)(a1 + 48);
  v5[4] = *(void *)(a1 + 40);
  v5[5] = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v5];
  return [*(id *)(a1 + 40) _synchronize];
}

void __61__EDUbiquitousConversationManager_setFlags_forConversations___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 longLongValue];
  if (v5)
  {
    uint64_t v8 = v7;
    id v9 = [*(id *)(a1 + 32) cloudStorage];
    uint64_t v10 = [v9 dictionaryForKey:v5];
    id v11 = (id)[v10 mutableCopy];

    if (v11)
    {
      v12 = [v11 objectForKeyedSubscript:@"flags"];
      uint64_t v13 = [v12 unsignedLongLongValue];

      uint64_t v14 = *(void *)(a1 + 40);
      if (v14 == v13)
      {
LABEL_19:

        goto LABEL_20;
      }
      if (v14)
      {
        unint64_t v15 = +[EDUbiquitousConversationManager log];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v16 = *(void *)(a1 + 40);
          int v31 = 138412802;
          uint64_t v32 = (uint64_t)v5;
          __int16 v33 = 2048;
          uint64_t v34 = v8;
          __int16 v35 = 2048;
          uint64_t v36 = v16;
          _os_log_impl(&dword_1DB39C000, v15, OS_LOG_TYPE_DEFAULT, "modifying %@ (conversationID: %lld): flags = %llu", (uint8_t *)&v31, 0x20u);
        }

        id v17 = [*(id *)(a1 + 32) delegate];
        uint64_t v18 = [v17 messageIDsForConversationID:v8 limit:25];

        v19 = +[EDUbiquitousConversationManager log];
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v20 = [v18 count];
          int v31 = 134217984;
          uint64_t v32 = v20;
          _os_log_impl(&dword_1DB39C000, v19, OS_LOG_TYPE_DEFAULT, "found %lu message ids for conversation", (uint8_t *)&v31, 0xCu);
        }

        v21 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
        [v11 setObject:v21 forKeyedSubscript:@"flags"];

        v22 = [v18 componentsJoinedByString:@" "];
        [v11 setObject:v22 forKeyedSubscript:@"message-ids"];

        [*(id *)(a1 + 32) _setCloudStorageValue:v11 forKey:v5];
      }
      else
      {
        v30 = +[EDUbiquitousConversationManager log];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          int v31 = 138412546;
          uint64_t v32 = (uint64_t)v5;
          __int16 v33 = 2048;
          uint64_t v34 = v8;
          _os_log_impl(&dword_1DB39C000, v30, OS_LOG_TYPE_DEFAULT, "delete %@ (conversationID: %lld)", (uint8_t *)&v31, 0x16u);
        }

        [*(id *)(a1 + 32) _setCloudStorageValue:0 forKey:v5];
        uint64_t v18 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
        [v18 removeObjectForKey:v5];
      }
    }
    else
    {
      id v11 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v23 = [NSNumber numberWithUnsignedLongLong:*(void *)(a1 + 40)];
      [v11 setObject:v23 forKeyedSubscript:@"flags"];

      v24 = [*(id *)(a1 + 32) delegate];
      uint64_t v18 = [v24 messageIDsForConversationID:v8 limit:25];

      v25 = +[EDUbiquitousConversationManager log];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 134217984;
        uint64_t v32 = [v18 count];
        _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "found %lu message ids for conversation", (uint8_t *)&v31, 0xCu);
      }

      v26 = [v18 componentsJoinedByString:@" "];
      [v11 setObject:v26 forKeyedSubscript:@"message-ids"];

      v27 = +[EDUbiquitousConversationManager log];
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        int v31 = 138412546;
        uint64_t v32 = (uint64_t)v5;
        __int16 v33 = 2112;
        uint64_t v34 = (uint64_t)v11;
        _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "creating new cloud entry %@: %@", (uint8_t *)&v31, 0x16u);
      }

      [*(id *)(a1 + 32) _setCloudStorageValue:v11 forKey:v5];
      v28 = [NSNumber numberWithLongLong:v8];
      v29 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
      [v29 setObject:v28 forKeyedSubscript:v5];
    }
    goto LABEL_19;
  }
LABEL_20:
}

- (void)_setCloudStorageValue:(id)a3 forKey:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  if (v9)
  {
    uint64_t v7 = [NSNumber numberWithInt:(int)CFAbsoluteTimeGetCurrent()];
    [v9 setObject:v7 forKeyedSubscript:@"last-modified"];

    uint64_t v8 = [(EDUbiquitousConversationManager *)self cloudStorage];
    [v8 setDictionary:v9 forKey:v6];
  }
  else
  {
    uint64_t v8 = [(EDUbiquitousConversationManager *)self cloudStorage];
    [v8 removeDictionaryForKey:v6];
  }
}

- (id)_syncKeyForConversationID:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(EDUbiquitousConversationManager *)self conversationIDsBySyncKey];
  id v6 = [v5 allKeys];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v11 = [(EDUbiquitousConversationManager *)self conversationIDsBySyncKey];
        v12 = [v11 objectForKeyedSubscript:v10];
        BOOL v13 = [v12 longLongValue] == a3;

        if (v13)
        {
          id v14 = v10;
          goto LABEL_11;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_11:

  return v14;
}

- (BOOL)_synchronize
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(EDUbiquitousConversationManager *)self cloudStorage];
  int v4 = [v3 synchronize];

  id v5 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(EDUbiquitousConversationManager *)self cloudStorage];
    uint64_t v7 = (void *)v6;
    uint64_t v8 = @"failed";
    if (v4) {
      uint64_t v8 = @"succeeded";
    }
    int v10 = 138412546;
    id v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Synchronizing with cloud store %@: %@", (uint8_t *)&v10, 0x16u);
  }
  return v4;
}

- (void)_mergeServerChanges:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v17 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Merging server changes: %@", buf, 0xCu);
  }

  uint64_t v6 = [(EDUbiquitousConversationManager *)self conversationIDsBySyncKey];
  uint64_t v7 = [v6 allKeys];

  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  __int16 v12 = __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke;
  uint64_t v13 = &unk_1E6C005A0;
  uint64_t v14 = self;
  id v8 = v7;
  id v15 = v8;
  [v4 enumerateKeysAndObjectsUsingBlock:&v10];
  id v9 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "Finished merging server changes", buf, 2u);
  }
}

void __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
  id v8 = [v7 objectForKeyedSubscript:v5];
  uint64_t v9 = [v8 longLongValue];

  id v10 = [MEMORY[0x1E4F1CA98] null];

  if (v10 == v6)
  {
    v23 = +[EDUbiquitousConversationManager log];
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      int v34 = 134217984;
      uint64_t v35 = v9;
      _os_log_impl(&dword_1DB39C000, v23, OS_LOG_TYPE_DEFAULT, "Server change. Clearing conversation flags for conversation: %lld", (uint8_t *)&v34, 0xCu);
    }

    v24 = *(void **)(a1 + 32);
    if (v9 == *MEMORY[0x1E4F5FCC8])
    {
      uint64_t v11 = [v24 unmatchedKeys];
      [v11 removeObject:v5];
    }
    else
    {
      v25 = [v24 delegate];
      [v25 setPersistenceConversationFlags:0 syncKey:0 forConversationID:v9 reason:1];

      uint64_t v11 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
      [v11 removeObjectForKey:v5];
    }
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = v6;
      __int16 v12 = [v11 objectForKeyedSubscript:@"message-ids"];
      uint64_t v13 = _stringToMessageIDs(v12);

      uint64_t v14 = [v11 objectForKeyedSubscript:@"flags"];
      uint64_t v15 = [v14 unsignedLongLongValue];

      int v16 = [*(id *)(a1 + 40) containsObject:v5];
      id v17 = *(void **)(a1 + 32);
      uint64_t v18 = (void *)MEMORY[0x1E4F5FCC8];
      if (v16)
      {
        long long v19 = [v17 delegate];
        uint64_t v20 = [v19 persistenceConversationFlagsForConversationID:v9];

        uint64_t v21 = +[EDUbiquitousConversationManager log];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 134218496;
          uint64_t v35 = v9;
          __int16 v36 = 2048;
          uint64_t v37 = v15;
          __int16 v38 = 2048;
          uint64_t v39 = v20;
          _os_log_impl(&dword_1DB39C000, v21, OS_LOG_TYPE_DEFAULT, "Server change. Updating conversation flags for conversation: %lld. Old flags %llu new flags %llu", (uint8_t *)&v34, 0x20u);
        }

        if (v15 == v20) {
          goto LABEL_25;
        }
        v22 = [*(id *)(a1 + 32) delegate];
        [v22 setPersistenceConversationFlags:v15 syncKey:v5 forConversationID:v9 reason:1];
      }
      else
      {
        v26 = [v17 delegate];
        uint64_t v9 = [v26 conversationIDForMessageIDs:v13];

        v27 = +[EDUbiquitousConversationManager log];
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 134217984;
          uint64_t v35 = v9;
          _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "Server change. Setting conversation flags for conversation: %lld", (uint8_t *)&v34, 0xCu);
        }

        if (v9 == *v18)
        {
          v28 = +[EDUbiquitousConversationManager log];
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            LOWORD(v34) = 0;
            _os_log_impl(&dword_1DB39C000, v28, OS_LOG_TYPE_DEFAULT, "could not find a conversation that matched those message ids", (uint8_t *)&v34, 2u);
          }

          v22 = [*(id *)(a1 + 32) unmatchedKeys];
          [v22 addObject:v5];
        }
        else
        {
          v29 = +[EDUbiquitousConversationManager log];
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
          {
            int v34 = 134217984;
            uint64_t v35 = v9;
            _os_log_impl(&dword_1DB39C000, v29, OS_LOG_TYPE_DEFAULT, "found conversation %lld", (uint8_t *)&v34, 0xCu);
          }

          v30 = [*(id *)(a1 + 32) delegate];
          [v30 setPersistenceConversationFlags:v15 syncKey:v5 forConversationID:v9 reason:1];

          v22 = [NSNumber numberWithLongLong:v9];
          int v31 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
          [v31 setObject:v22 forKeyedSubscript:v5];
        }
      }

LABEL_25:
      if (v9 != *v18)
      {
        uint64_t v32 = +[EDUbiquitousConversationManager log];
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          int v34 = 134217984;
          uint64_t v35 = v9;
          _os_log_impl(&dword_1DB39C000, v32, OS_LOG_TYPE_DEFAULT, "Updating message ids for conversation %lld", (uint8_t *)&v34, 0xCu);
        }

        __int16 v33 = [*(id *)(a1 + 32) delegate];
        [v33 remoteMessageIDsAdded:v13 forConversationID:v9];
      }
      goto LABEL_30;
    }
    uint64_t v11 = +[EDUbiquitousConversationManager log];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke_cold_1(v11);
    }
  }
LABEL_30:
}

- (void)pruneDatabasePurgingOldestEntries:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    BOOL v10 = v3;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Pruning database. Purging oldest entries %d", buf, 8u);
  }

  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke;
  v7[3] = &unk_1E6C05288;
  v7[4] = self;
  BOOL v8 = v3;
  dispatch_async(queue, v7);
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke(uint64_t a1)
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v2 = [*(id *)(a1 + 32) cloudStorage];
  BOOL v3 = [v2 dictionaryRepresentation];

  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_2;
  v35[3] = &unk_1E6C00D98;
  id v4 = v26;
  id v36 = v4;
  v27 = v3;
  [v3 enumerateKeysAndObjectsUsingBlock:v35];
  id v5 = [v3 keysOfEntriesPassingTest:&__block_literal_global_88];
  id v6 = [v5 allObjects];
  [v4 addObjectsFromArray:v6];

  if (*(unsigned char *)(a1 + 40))
  {
    uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_37;
    v33[3] = &unk_1E6C03E08;
    id v8 = v7;
    id v34 = v8;
    [v3 enumerateKeysAndObjectsUsingBlock:v33];
    uint64_t v9 = [v8 sortedArrayUsingComparator:&__block_literal_global_45_0];
    unint64_t v10 = [v9 count];
    if (v10 >= 0xA) {
      uint64_t v11 = 10;
    }
    else {
      uint64_t v11 = v10;
    }
    __int16 v12 = objc_msgSend(v9, "subarrayWithRange:", 0, v11);
    uint64_t v13 = [v12 valueForKey:@"key"];
    [v4 addObjectsFromArray:v13];
  }
  uint64_t v14 = [*(id *)(a1 + 32) unmatchedKeys];
  objc_msgSend(v14, "ef_removeObjectsInArray:", v4);

  if ([v4 count])
  {
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v16 = v4;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v21 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
          v22 = [v21 objectForKeyedSubscript:v20];

          if (v22)
          {
            [v15 addObject:v22];
            v23 = [*(id *)(a1 + 32) conversationIDsBySyncKey];
            [v23 removeObjectForKey:v20];
          }
          [*(id *)(a1 + 32) _setCloudStorageValue:0 forKey:v20];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
      }
      while (v17);
    }

    v24 = [*(id *)(a1 + 32) delegate];
    [v24 clearConversationFlagsAndSyncKeyForConversationIDs:v15];

    [*(id *)(a1 + 32) _synchronize];
  }
  v25 = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_3;
  block[3] = &unk_1E6BFF2F0;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v25, block);
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"flags"];
  uint64_t v8 = [v7 unsignedLongLongValue];

  if (!v8)
  {
    uint64_t v9 = +[EDUbiquitousConversationManager log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412290;
      id v11 = v5;
      _os_log_impl(&dword_1DB39C000, v9, OS_LOG_TYPE_DEFAULT, "deleting entry with flag value of zero: %@", (uint8_t *)&v10, 0xCu);
    }

    [*(id *)(a1 + 32) addObject:v5];
  }
}

BOOL __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_35(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = [v3 objectForKeyedSubscript:@"flags"];
    BOOL v5 = [v4 unsignedLongLongValue] == 0;
  }
  else
  {
    id v6 = +[EDUbiquitousConversationManager log];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke_cold_1(v6);
    }

    BOOL v5 = 0;
  }

  return v5;
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_37(uint64_t a1, void *a2, void *a3)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [v6 objectForKeyedSubscript:@"last-modified"];
  uint64_t v8 = *(void **)(a1 + 32);
  v10[0] = @"key";
  v10[1] = @"last-modified";
  v11[0] = v5;
  v11[1] = v7;
  uint64_t v9 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:2];
  [v8 addObject:v9];
}

uint64_t __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_2_42(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 objectForKeyedSubscript:@"last-modified"];
  id v6 = [v4 objectForKeyedSubscript:@"last-modified"];
  uint64_t v7 = [v5 compare:v6];

  return v7;
}

void __69__EDUbiquitousConversationManager_pruneDatabasePurgingOldestEntries___block_invoke_3(uint64_t a1)
{
  id v4 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-7776000.0];
  [v4 timeIntervalSince1970];
  double v3 = v2;

  id v5 = [*(id *)(a1 + 32) delegate];
  [v5 pruneConversationTables:v3];
}

- (void)conversationRemoteStorage:(id)a3 didChangeEntries:(id)a4 reason:(int64_t)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  int v10 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl(&dword_1DB39C000, v10, OS_LOG_TYPE_DEFAULT, "Conversation Remote Storage %{public}@ did change entries %@", buf, 0x16u);
  }

  if ((unint64_t)a5 >= 3)
  {
    if (a5 == 3)
    {
      uint64_t v12 = +[EDUbiquitousConversationManager log];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_DEFAULT, "over quota: pruning database", buf, 2u);
      }

      [(EDUbiquitousConversationManager *)self pruneDatabasePurgingOldestEntries:1];
    }
  }
  else
  {
    queue = self->_queue;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __85__EDUbiquitousConversationManager_conversationRemoteStorage_didChangeEntries_reason___block_invoke;
    v13[3] = &unk_1E6BFFAF0;
    v13[4] = self;
    id v14 = v9;
    dispatch_async(queue, v13);
  }
}

uint64_t __85__EDUbiquitousConversationManager_conversationRemoteStorage_didChangeEntries_reason___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mergeServerChanges:*(void *)(a1 + 40)];
}

- (void)performDailyExportForChangedConversations:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[EDUbiquitousConversationManager log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v12 = v4;
    _os_log_impl(&dword_1DB39C000, v5, OS_LOG_TYPE_DEFAULT, "Perform daily export for changed conversations: %@", buf, 0xCu);
  }

  queue = self->_queue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __77__EDUbiquitousConversationManager_performDailyExportForChangedConversations___block_invoke;
  v8[3] = &unk_1E6BFFAF0;
  id v9 = v4;
  int v10 = self;
  id v7 = v4;
  dispatch_sync(queue, v8);
}

void __77__EDUbiquitousConversationManager_performDailyExportForChangedConversations___block_invoke(uint64_t a1)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = *(id *)(a1 + 32);
  uint64_t v2 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
  if (v2)
  {
    char v36 = 0;
    uint64_t v3 = *(void *)v45;
    do
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v45 != v3) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = [*(id *)(*((void *)&v44 + 1) + 8 * i) longLongValue];
        id v6 = [*(id *)(a1 + 40) _syncKeyForConversationID:v5];
        if (v6)
        {
          id v7 = [*(id *)(a1 + 40) cloudStorage];
          id v8 = [v7 dictionaryForKey:v6];
          id v9 = (void *)[v8 mutableCopy];

          int v10 = [*(id *)(a1 + 40) delegate];
          id v11 = [v10 messageIDsForConversationID:v5 limit:25];

          id v12 = [v11 componentsJoinedByString:@" "];
          uint64_t v13 = [v9 objectForKeyedSubscript:@"message-ids"];
          if (([v13 isEqualToString:v12] & 1) == 0)
          {
            [v9 setObject:v12 forKeyedSubscript:@"message-ids"];
            [*(id *)(a1 + 40) _setCloudStorageValue:v9 forKey:v6];
            char v36 = 1;
          }
        }
      }
      uint64_t v2 = [obj countByEnumeratingWithState:&v44 objects:v51 count:16];
    }
    while (v2);

    if (v36) {
      [*(id *)(a1 + 40) _synchronize];
    }
  }
  else
  {
  }
  id obja = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v35 = [*(id *)(a1 + 40) unmatchedKeys];
  uint64_t v14 = [v35 countByEnumeratingWithState:&v40 objects:v50 count:16];
  if (v14)
  {
    uint64_t v16 = *(void *)v41;
    uint64_t v37 = *MEMORY[0x1E4F5FCC8];
    *(void *)&long long v15 = 134217984;
    long long v34 = v15;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v35);
        }
        uint64_t v18 = *(void *)(*((void *)&v40 + 1) + 8 * j);
        uint64_t v19 = objc_msgSend(*(id *)(a1 + 40), "cloudStorage", v34);
        uint64_t v20 = [v19 dictionaryForKey:v18];

        if (v20)
        {
          uint64_t v21 = [v20 objectForKeyedSubscript:@"message-ids"];
          v22 = _stringToMessageIDs(v21);

          v23 = [*(id *)(a1 + 40) delegate];
          uint64_t v24 = [v23 conversationIDForMessageIDs:v22];

          if (v24 == v37)
          {
            v25 = +[EDUbiquitousConversationManager log];
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DB39C000, v25, OS_LOG_TYPE_DEFAULT, "could not find a conversation that matched those message ids", buf, 2u);
            }
          }
          else
          {
            v27 = +[EDUbiquitousConversationManager log];
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v34;
              uint64_t v49 = v24;
              _os_log_impl(&dword_1DB39C000, v27, OS_LOG_TYPE_DEFAULT, "found conversation %lld", buf, 0xCu);
            }

            v28 = [v20 objectForKeyedSubscript:@"flags"];
            uint64_t v29 = [v28 unsignedLongLongValue];

            long long v30 = [*(id *)(a1 + 40) delegate];
            [v30 setPersistenceConversationFlags:v29 syncKey:v18 forConversationID:v24 reason:1];

            long long v31 = [NSNumber numberWithLongLong:v24];
            long long v32 = [*(id *)(a1 + 40) conversationIDsBySyncKey];
            [v32 setObject:v31 forKeyedSubscript:v18];

            [obja addObject:v18];
          }
        }
        else
        {
          id v26 = +[EDUbiquitousConversationManager log];
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v49 = v18;
            _os_log_impl(&dword_1DB39C000, v26, OS_LOG_TYPE_DEFAULT, "Removing orphaned entry from unknwown leys set: %@", buf, 0xCu);
          }

          [obja addObject:v18];
        }
      }
      uint64_t v14 = [v35 countByEnumeratingWithState:&v40 objects:v50 count:16];
    }
    while (v14);
  }

  __int16 v33 = [*(id *)(a1 + 40) unmatchedKeys];
  objc_msgSend(v33, "ef_removeObjectsInArray:", obja);
}

- (EDUbiquitousConversationManagerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDUbiquitousConversationManagerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (EDConversationRemoteStorage)cloudStorage
{
  return self->_cloudStorage;
}

- (void)setCloudStorage:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (void)setConversationIDsBySyncKey:(id)a3
{
}

- (NSMutableSet)unmatchedKeys
{
  return self->_unmatchedKeys;
}

- (void)setUnmatchedKeys:(id)a3
{
}

- (BOOL)initialized
{
  return self->_initialized;
}

- (void)setInitialized:(BOOL)a3
{
  self->_initialized = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_unmatchedKeys, 0);
  objc_storeStrong((id *)&self->_conversationIDsBySyncKey, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_cloudStorage, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

void __55__EDUbiquitousConversationManager__mergeServerChanges___block_invoke_cold_1(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "Synced conversation object is not a dictionary", v1, 2u);
}

@end