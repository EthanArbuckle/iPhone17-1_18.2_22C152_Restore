@interface _CDSharedMemoryContextPersisting
+ (id)persistenceWithSharedMemoryKeyValueStore:(id)a3;
+ (id)sharedMemoryKeyFromKeyPath:(id)a3;
+ (id)sharedMemoryKeyFromRegistration:(id)a3;
- (NSCountedSet)keyPathRegistrationCount;
- (NSCountedSet)legacyKeyPathRegistrationCount;
- (NSString)localDeviceID;
- (OS_dispatch_queue)queue;
- (_CDSharedMemoryContextPersisting)initWithSharedMemoryKeyValueStore:(id)a3;
- (_CDSharedMemoryKeyValueStore)store;
- (id)allKeysForContextStore;
- (id)loadRegistrations;
- (id)loadValues;
- (void)deleteAllData;
- (void)deleteKeyPaths:(id)a3;
- (void)deleteRegistration:(id)a3;
- (void)saveRegistration:(id)a3;
- (void)saveValue:(id)a3 forKeyPath:(id)a4;
- (void)setKeyPathRegistrationCount:(id)a3;
- (void)setLegacyKeyPathRegistrationCount:(id)a3;
- (void)setLocalDeviceID:(id)a3;
- (void)setQueue:(id)a3;
- (void)setStore:(id)a3;
@end

@implementation _CDSharedMemoryContextPersisting

+ (id)sharedMemoryKeyFromKeyPath:(id)a3
{
  v3 = NSString;
  id v4 = a3;
  v5 = [v4 key];
  v6 = NSNumber;
  uint64_t v7 = [v4 isUserCentric];

  v8 = [v6 numberWithBool:v7];
  v9 = [v3 stringWithFormat:@"%@.%@.%@", @"context.keyPath", v5, v8];

  return v9;
}

- (void)saveValue:(id)a3 forKeyPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 value];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
  }
  else
  {
    uint64_t v9 = [v7 deviceID];
    if (v9)
    {
      v10 = (void *)v9;
      v11 = [v7 deviceID];
      int v12 = [v11 isEqualToString:self->_localDeviceID];

      if (!v12) {
        goto LABEL_8;
      }
    }
    else
    {
    }
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57___CDSharedMemoryContextPersisting_saveValue_forKeyPath___block_invoke;
    block[3] = &unk_1E56091B0;
    id v15 = v7;
    v16 = self;
    id v17 = v6;
    dispatch_sync(queue, block);
  }
LABEL_8:
}

- (_CDSharedMemoryContextPersisting)initWithSharedMemoryKeyValueStore:(id)a3
{
  id v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)_CDSharedMemoryContextPersisting;
  id v6 = [(_CDSharedMemoryContextPersisting *)&v19 init];
  id v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_store, a3);
    v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.coreduetcontext.service.sharedmemorypersistence", v8);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v9;

    v11 = +[_CDDevice localDevice];
    uint64_t v12 = [v11 deviceID];
    localDeviceID = v7->_localDeviceID;
    v7->_localDeviceID = (NSString *)v12;

    uint64_t v14 = [MEMORY[0x1E4F28BD0] set];
    keyPathRegistrationCount = v7->_keyPathRegistrationCount;
    v7->_keyPathRegistrationCount = (NSCountedSet *)v14;

    uint64_t v16 = [MEMORY[0x1E4F28BD0] set];
    legacyKeyPathRegistrationCount = v7->_legacyKeyPathRegistrationCount;
    v7->_legacyKeyPathRegistrationCount = (NSCountedSet *)v16;
  }
  return v7;
}

+ (id)persistenceWithSharedMemoryKeyValueStore:(id)a3
{
  id v4 = a3;
  id v5 = (void *)[objc_alloc((Class)a1) initWithSharedMemoryKeyValueStore:v4];

  return v5;
}

+ (id)sharedMemoryKeyFromRegistration:(id)a3
{
  v3 = NSString;
  id v4 = [a3 identifier];
  id v5 = [v3 stringWithFormat:@"%@.%@", @"context.registration", v4];

  return v5;
}

- (void)deleteKeyPaths:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51___CDSharedMemoryContextPersisting_deleteKeyPaths___block_invoke;
  v7[3] = &unk_1E56091D8;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)saveRegistration:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __53___CDSharedMemoryContextPersisting_saveRegistration___block_invoke;
  v7[3] = &unk_1E56091D8;
  id v8 = v4;
  dispatch_queue_t v9 = self;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

- (void)deleteRegistration:(id)a3
{
  id v4 = a3;
  id v5 = [v4 predicate];
  id v6 = [v5 keyPaths];

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55___CDSharedMemoryContextPersisting_deleteRegistration___block_invoke;
  block[3] = &unk_1E56091B0;
  void block[4] = self;
  id v11 = v4;
  id v12 = v6;
  id v8 = v6;
  id v9 = v4;
  dispatch_sync(queue, block);
  [(_CDSharedMemoryContextPersisting *)self deleteKeyPaths:v8];
}

- (id)allKeysForContextStore
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  queue = self->_queue;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __58___CDSharedMemoryContextPersisting_allKeysForContextStore__block_invoke;
  v9[3] = &unk_1E56091D8;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  dispatch_sync(queue, v9);
  id v6 = v10;
  id v7 = v5;

  return v7;
}

- (id)loadValues
{
  v2 = self;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v3 = [(_CDSharedMemoryContextPersisting *)self allKeysForContextStore];
  v28 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    id v8 = @"context.keyPath";
    uint64_t v9 = *(void *)v32;
    *(void *)&long long v6 = 138412546;
    long long v27 = v6;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v32 != v9) {
          objc_enumerationMutation(v4);
        }
        id v11 = *(void **)(*((void *)&v31 + 1) + 8 * v10);
        if (objc_msgSend(v11, "hasPrefix:", v8, v27))
        {
          id v12 = [(_CDSharedMemoryKeyValueStore *)v2->_store dataForKey:v11];
          if (v12)
          {
            v13 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v14 = objc_opt_class();
            id v30 = 0;
            id v15 = [v13 unarchivedObjectOfClass:v14 fromData:v12 error:&v30];
            id v16 = v30;
            if (v16 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v27;
              v36 = v11;
              __int16 v37 = 2112;
              id v38 = v16;
              _os_log_error_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving contextual keypath and value for %@: %@", buf, 0x16u);
              if (v15)
              {
LABEL_11:
                id v17 = [v15 value];
                [v15 keyPath];
                id v29 = v16;
                uint64_t v18 = v7;
                uint64_t v19 = v9;
                v20 = v8;
                id v21 = v4;
                v23 = v22 = v2;
                [v28 setObject:v17 forKeyedSubscript:v23];

                v2 = v22;
                id v4 = v21;
                id v8 = v20;
                uint64_t v9 = v19;
                uint64_t v7 = v18;
                id v16 = v29;
              }
            }
            else if (v15)
            {
              goto LABEL_11;
            }
          }
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v24 = [v4 countByEnumeratingWithState:&v31 objects:v39 count:16];
      uint64_t v7 = v24;
    }
    while (v24);
  }

  v25 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v28];

  return v25;
}

- (id)loadRegistrations
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [(_CDSharedMemoryContextPersisting *)self allKeysForContextStore];
  v20 = [MEMORY[0x1E4F1CA48] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v4 = v3;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v5)
  {
    uint64_t v7 = v5;
    uint64_t v8 = *(void *)v23;
    *(void *)&long long v6 = 138412546;
    long long v19 = v6;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v22 + 1) + 8 * v9);
        if (objc_msgSend(v10, "hasPrefix:", @"context.registration", v19))
        {
          id v11 = [(_CDSharedMemoryKeyValueStore *)self->_store dataForKey:v10];
          if (v11)
          {
            id v12 = (void *)MEMORY[0x1E4F28DC0];
            uint64_t v13 = objc_opt_class();
            id v21 = 0;
            uint64_t v14 = [v12 unarchivedObjectOfClass:v13 fromData:v11 error:&v21];
            id v15 = v21;
            if (v15 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v19;
              long long v27 = v10;
              __int16 v28 = 2112;
              id v29 = v15;
              _os_log_error_impl(&dword_18EC9B000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Error unarchiving contextual keypath registration for %@: %@", buf, 0x16u);
              if (v14) {
LABEL_11:
              }
                [v20 addObject:v14];
            }
            else if (v14)
            {
              goto LABEL_11;
            }
          }
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v16 = [v4 countByEnumeratingWithState:&v22 objects:v30 count:16];
      uint64_t v7 = v16;
    }
    while (v16);
  }

  id v17 = [MEMORY[0x1E4F1C978] arrayWithArray:v20];

  return v17;
}

- (void)deleteAllData
{
  id v5 = [(_CDSharedMemoryContextPersisting *)self allKeysForContextStore];
  store = self->_store;
  id v4 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];
  [(_CDSharedMemoryKeyValueStore *)store removeDataForKeys:v4];
}

- (_CDSharedMemoryKeyValueStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
}

- (NSCountedSet)keyPathRegistrationCount
{
  return self->_keyPathRegistrationCount;
}

- (void)setKeyPathRegistrationCount:(id)a3
{
}

- (NSCountedSet)legacyKeyPathRegistrationCount
{
  return self->_legacyKeyPathRegistrationCount;
}

- (void)setLegacyKeyPathRegistrationCount:(id)a3
{
}

- (NSString)localDeviceID
{
  return self->_localDeviceID;
}

- (void)setLocalDeviceID:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDeviceID, 0);
  objc_storeStrong((id *)&self->_legacyKeyPathRegistrationCount, 0);
  objc_storeStrong((id *)&self->_keyPathRegistrationCount, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_store, 0);
}

@end