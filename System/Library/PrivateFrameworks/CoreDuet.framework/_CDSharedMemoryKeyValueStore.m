@interface _CDSharedMemoryKeyValueStore
+ (NSObject)readKeyedDataDictionaryFromMemory:(unint64_t)a3 size:;
+ (id)defaultName;
+ (id)keyValueStoreWithName:(id)a3 size:(unint64_t)a4;
+ (id)log;
+ (id)sharedInstance;
+ (unint64_t)defaultSize;
+ (void)openOrCreateSharedMemoryWithName:(size_t)a3 size:;
- (BOOL)removeDataForKey:(id)a3;
- (BOOL)removeDataForKeys:(id)a3;
- (BOOL)setData:(id)a3 forKey:(id)a4;
- (BOOL)syncPersistToShMem;
- (id)allKeys;
- (id)dataForKey:(id)a3;
- (id)description;
- (id)errorForExceedingSizeLimits;
- (uint64_t)_persistToShMem;
- (unint64_t)size;
- (void)_persistToShMem;
- (void)initWithName:(uint64_t)a3 size:;
- (void)memoryPointer;
- (void)schedulePersistToShMem;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation _CDSharedMemoryKeyValueStore

- (BOOL)setData:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 1;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __47___CDSharedMemoryKeyValueStore_setData_forKey___block_invoke;
  v12[3] = &unk_1E560E058;
  v12[4] = self;
  id v13 = v7;
  id v14 = v6;
  v15 = &v16;
  id v9 = v6;
  id v10 = v7;
  dispatch_sync(queue, v12);
  LOBYTE(v6) = *((unsigned char *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  return (char)v6;
}

- (void)schedulePersistToShMem
{
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    if (!*(void *)(a1 + 24))
    {
      uint64_t v2 = os_transaction_create();
      v3 = *(void **)(a1 + 24);
      *(void *)(a1 + 24) = v2;

      v4 = *(NSObject **)(a1 + 16);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54___CDSharedMemoryKeyValueStore_schedulePersistToShMem__block_invoke;
      block[3] = &unk_1E560D578;
      block[4] = a1;
      dispatch_async(v4, block);
    }
  }
}

- (uint64_t)_persistToShMem
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (result)
  {
    uint64_t v1 = result;
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(result + 16));
    kdebug_trace();
    uint64_t v29 = 0;
    v30 = &v29;
    uint64_t v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__4;
    v33 = __Block_byref_object_dispose__4;
    id v34 = 0;
    if (os_log_type_enabled(*(os_log_t *)(v1 + 40), OS_LOG_TYPE_DEBUG)) {
      -[_CDSharedMemoryKeyValueStore _persistToShMem]();
    }
    uint64_t v23 = 0;
    v24 = &v23;
    uint64_t v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__4;
    v27 = __Block_byref_object_dispose__4;
    id v28 = 0;
    uint64_t v2 = *(NSObject **)(v1 + 8);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke;
    block[3] = &unk_1E560E008;
    block[4] = v1;
    void block[5] = &v29;
    block[6] = &v23;
    dispatch_sync(v2, block);
    if (v30[5])
    {
      if ((unint64_t)[(id)v1 size] > 0xF)
      {
        **(unsigned char **)(v1 + 56) = 0;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id obj = (id)v24[5];
        uint64_t v5 = 0;
        v4 = 0;
        uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v37 count:16];
        if (v6)
        {
          uint64_t v7 = 16;
          uint64_t v8 = *(void *)v19;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v19 != v8) {
                objc_enumerationMutation(obj);
              }
              uint64_t v10 = *(void *)(*((void *)&v18 + 1) + 8 * v9);
              buf[0] = 0;
              unint64_t v11 = -[_CDSerializableKeyedData serializeTo:maxSize:success:](v10, *(void *)(v1 + 56) + v7, *(void *)(v1 + 64) - v7, (char *)buf);
              unint64_t v12 = v11;
              if (buf[0])
              {
                ++v5;
                v7 += v11;
              }
              else
              {
                uint64_t v13 = -[_CDSharedMemoryKeyValueStore errorForExceedingSizeLimits](v1);

                v17[0] = MEMORY[0x1E4F143A8];
                v17[1] = 3221225472;
                v17[2] = __47___CDSharedMemoryKeyValueStore__persistToShMem__block_invoke_19;
                v17[3] = &unk_1E560E030;
                v17[6] = &v23;
                v17[7] = v12;
                v17[8] = v7;
                v17[4] = v10;
                v17[5] = v1;
                if (_persistToShMem_onceToken != -1) {
                  dispatch_once(&_persistToShMem_onceToken, v17);
                }
                v4 = (void *)v13;
              }
              ++v9;
            }
            while (v6 != v9);
            uint64_t v6 = [obj countByEnumeratingWithState:&v18 objects:v37 count:16];
          }
          while (v6);
        }
        else
        {
          uint64_t v7 = 16;
        }

        uint64_t v14 = *(void *)(v1 + 56);
        *(void *)(v14 + 8) = v5;
        *(unsigned char *)uint64_t v14 = 1;
        v15 = +[_CDLogging instrumentationChannel];
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[_CDSharedMemoryKeyValueStore _persistToShMem](buf, v7, [(id)v1 size], v15);
        }

        goto LABEL_28;
      }
      -[_CDSharedMemoryKeyValueStore errorForExceedingSizeLimits](v1);
      id v3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v1 + 40), OS_LOG_TYPE_DEBUG)) {
        -[_CDSharedMemoryKeyValueStore _persistToShMem]();
      }
      id v3 = *(id *)(v1 + 32);
    }
    v4 = v3;
LABEL_28:
    _Block_object_dispose(&v23, 8);

    objc_storeStrong((id *)(v1 + 32), v4);
    [v4 code];
    kdebug_trace();
    BOOL v35 = v4 == 0;
    _Block_object_dispose(&v29, 8);

    return v35;
  }
  return result;
}

- (unint64_t)size
{
  return self->_size;
}

- (id)errorForExceedingSizeLimits
{
  v6[1] = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v1 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v5 = *MEMORY[0x1E4F28588];
    v6[0] = @"Serialized size exceeds shared memory capacity";
    uint64_t v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
    id v3 = [v1 errorWithDomain:@"com.apple.coreduet.sharedmemorykeyvaluestore" code:0 userInfo:v2];
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46___CDSharedMemoryKeyValueStore_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  uint64_t v2 = (void *)sharedInstance_theStore;
  return v2;
}

+ (NSObject)readKeyedDataDictionaryFromMemory:(unint64_t)a3 size:
{
  self;
  uint64_t v5 = *(void *)(a2 + 8);
  if (*(unsigned char *)a2)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA60] dictionary];
    if (!v5) {
      goto LABEL_24;
    }
    unint64_t v10 = 16;
    while (a3 > v10)
    {
      +[_CDSerializableKeyedData keyedDataDeserializedFrom:maxSize:]((uint64_t)_CDSerializableKeyedData, a2 + v10, a3 - v10);
      unint64_t v11 = (id *)objc_claimAutoreleasedReturnValue();
      uint64_t v13 = v11;
      if (!v11)
      {
        uint64_t v16 = +[_CDSharedMemoryKeyValueStore log]();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:]();
        }
        goto LABEL_21;
      }
      if (!objc_getProperty(v11, v12, 24, 1))
      {
        uint64_t v16 = +[_CDSharedMemoryKeyValueStore log]();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.4();
        }
LABEL_21:

        uint64_t v8 = v9;
        goto LABEL_22;
      }
      [v9 setObject:v13 forKeyedSubscript:objc_getProperty(v13, v14, 24, 1)];
      uint64_t v15 = [v13[1] length];
      v10 += v15 + [v13[4] length] + 18;

      if (!--v5) {
        goto LABEL_24;
      }
    }
    uint64_t v8 = +[_CDSharedMemoryKeyValueStore log]();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:].cold.5();
    }
  }
  else
  {
    int v6 = readKeyedDataDictionaryFromMemory_size__invalidHeaderCount++;
    if (v6 == 1)
    {
      uint64_t v7 = +[_CDSharedMemoryKeyValueStore log]();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:]();
      }
    }
    uint64_t v8 = +[_CDSharedMemoryKeyValueStore log]();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:]();
    }
LABEL_22:
    uint64_t v9 = 0;
  }

LABEL_24:
  return v9;
}

+ (void)openOrCreateSharedMemoryWithName:(size_t)a3 size:
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  self;
  uint64_t v5 = +[_CDSharedMemoryKeyValueStore log]();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v16 = v4;
    _os_log_impl(&dword_18ECEB000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to open %{public}@ in shared memory", buf, 0xCu);
  }

  id v6 = v4;
  int v7 = shm_open((const char *)[v6 UTF8String], 2, 384);
  uint64_t v8 = +[_CDSharedMemoryKeyValueStore log]();
  BOOL v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7 == -1)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "Shared memory is not present. Creating it.", buf, 2u);
    }

    int v12 = shm_open((const char *)[v6 UTF8String], 514, 384);
    if (v12 == -1)
    {
      unint64_t v11 = +[_CDSharedMemoryKeyValueStore log]();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:]();
      }
      goto LABEL_17;
    }
    int v13 = v12;
    if (ftruncate(v12, a3))
    {
      unint64_t v11 = +[_CDSharedMemoryKeyValueStore log]();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:]();
      }
      goto LABEL_17;
    }
    unint64_t v10 = mmap(0, a3, 3, 1, v13, 0);
    close(v13);
    if (v10 != (void *)-1) {
      goto LABEL_18;
    }
    unint64_t v11 = +[_CDSharedMemoryKeyValueStore log]();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    goto LABEL_8;
  }
  if (v9)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18ECEB000, v8, OS_LOG_TYPE_DEFAULT, "Opened shared memory", buf, 2u);
  }

  unint64_t v10 = mmap(0, a3, 3, 1, v7, 0);
  close(v7);
  if (v10 == (void *)-1)
  {
    unint64_t v11 = +[_CDSharedMemoryKeyValueStore log]();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
LABEL_17:

      unint64_t v10 = 0;
      goto LABEL_18;
    }
LABEL_8:
    +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:]();
    goto LABEL_17;
  }
LABEL_18:

  return v10;
}

+ (unint64_t)defaultSize
{
  return 0x40000;
}

+ (id)defaultName
{
  uint64_t v2 = [MEMORY[0x1E4F28B50] mainBundle];
  id v3 = [v2 bundleIdentifier];

  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F28F80] processInfo];
    id v6 = [v5 processName];

    if (v6) {
      id v4 = v6;
    }
    else {
      id v4 = @"/CDSharedMemoryKeyValueStore";
    }
  }
  return v4;
}

- (void)initWithName:(uint64_t)a3 size:
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = v5;
  if (!a1 || ![v5 length]) {
    goto LABEL_18;
  }
  v31.receiver = a1;
  v31.super_class = (Class)_CDSharedMemoryKeyValueStore;
  int v7 = objc_msgSendSuper2(&v31, sel_init);
  a1 = v7;
  if (v7)
  {
    v7[7] = 0;
    if (!a3) {
      a3 = [(id)objc_opt_class() defaultSize];
    }
    a1[8] = a3;
    uint64_t v8 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v9 = dispatch_queue_create("com.apple.CoreDuet.SharedMemoryKeyValueStore", v8);
    unint64_t v10 = (void *)a1[1];
    a1[1] = v9;

    unint64_t v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    int v12 = dispatch_queue_attr_make_with_qos_class(v11, QOS_CLASS_BACKGROUND, 0);

    dispatch_queue_t v13 = dispatch_queue_create("com.apple.CoreDuet.SharedMemoryKeyValueStore.Persistence", v12);
    uint64_t v14 = (void *)a1[2];
    a1[2] = v13;

    uint64_t v15 = +[_CDSharedMemoryKeyValueStore log]();
    id v16 = (void *)a1[5];
    a1[5] = v15;

    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v18 = (void *)a1[6];
    a1[6] = v17;

    long long v19 = +[_CDSharedMemoryKeyValueStore openOrCreateSharedMemoryWithName:size:]((uint64_t)_CDSharedMemoryKeyValueStore, v6, a1[8]);
    a1[7] = v19;
    if (v19)
    {
      uint64_t v20 = +[_CDSharedMemoryKeyValueStore readKeyedDataDictionaryFromMemory:size:]((uint64_t)_CDSharedMemoryKeyValueStore, (uint64_t)v19, a1[8]);
      long long v21 = (void *)a1[6];
      a1[6] = v20;

      if (!a1[6])
      {
        v22 = a1[5];
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          -[_CDSharedMemoryKeyValueStore initWithName:size:](v6, v22);
        }
        uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
        v24 = (void *)a1[6];
        a1[6] = v23;
      }
      uint64_t v25 = a1[5];
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v27 = a1[7];
        uint64_t v26 = a1[8];
        *(_DWORD *)buf = 138412802;
        v33 = v6;
        __int16 v34 = 1024;
        int v35 = v26;
        __int16 v36 = 2048;
        uint64_t v37 = v27;
        _os_log_impl(&dword_18ECEB000, v25, OS_LOG_TYPE_DEFAULT, "Created store with name %@, size %d, address %p", buf, 0x1Cu);
      }

      goto LABEL_14;
    }
    uint64_t v29 = a1[5];
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
      -[_CDSharedMemoryKeyValueStore initWithName:size:](v6, v29);
    }

LABEL_18:
    id v28 = 0;
    goto LABEL_19;
  }
LABEL_14:
  a1 = a1;
  id v28 = a1;
LABEL_19:

  return v28;
}

+ (id)keyValueStoreWithName:(id)a3 size:(unint64_t)a4
{
  id v6 = a3;
  int v7 = -[_CDSharedMemoryKeyValueStore initWithName:size:](objc_alloc((Class)a1), v6, a4);

  return v7;
}

+ (id)log
{
  self;
  if (log_onceToken != -1) {
    dispatch_once(&log_onceToken, &__block_literal_global_11);
  }
  v0 = (void *)log_log;
  return v0;
}

- (void)memoryPointer
{
  return self->_mappedMem;
}

- (BOOL)syncPersistToShMem
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_queue);
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  persistQueue = v2->_persistQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __50___CDSharedMemoryKeyValueStore_syncPersistToShMem__block_invoke;
  v5[3] = &unk_1E560D4D0;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(persistQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

- (BOOL)removeDataForKey:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v4 = (void *)MEMORY[0x1E4F1C978];
  id v5 = a3;
  uint64_t v6 = [v4 arrayWithObjects:&v8 count:1];

  LOBYTE(self) = -[_CDSharedMemoryKeyValueStore removeDataForKeys:](self, "removeDataForKeys:", v6, v8, v9);
  return (char)self;
}

- (BOOL)removeDataForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __50___CDSharedMemoryKeyValueStore_removeDataForKeys___block_invoke;
    v7[3] = &unk_1E560D848;
    v7[4] = self;
    id v8 = v4;
    dispatch_sync(queue, v7);
  }
  return 1;
}

- (id)dataForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  dispatch_queue_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__4;
  id v16 = __Block_byref_object_dispose__4;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43___CDSharedMemoryKeyValueStore_dataForKey___block_invoke;
  block[3] = &unk_1E560D380;
  id v10 = v4;
  unint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (id)allKeys
{
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__4;
  id v10 = __Block_byref_object_dispose__4;
  id v11 = (id)MEMORY[0x1E4F1CBF0];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39___CDSharedMemoryKeyValueStore_allKeys__block_invoke;
  v5[3] = &unk_1E560D4D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(_CDSharedMemoryKeyValueStore *)self setData:v7 forKey:v6];
  }
}

- (id)description
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = self->_dictionary;
  uint64_t v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    uint64_t v7 = *(void *)v18;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void *)(*((void *)&v17 + 1) + 8 * v8);
        uint64_t v10 = [(NSMutableDictionary *)self->_dictionary objectForKeyedSubscript:v9];
        id v11 = (id *)v10;
        if (v10)
        {
          uint64_t v12 = [*(id *)(v10 + 8) length];
          uint64_t v13 = v12 + [v11[4] length] + 18;
        }
        else
        {
          uint64_t v13 = 0;
        }
        v6 += v13;
        [v3 appendFormat:@"%@: %zu\n", v9, v13];

        ++v8;
      }
      while (v5 != v8);
      uint64_t v14 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v17 objects:v21 count:16];
      uint64_t v5 = v14;
    }
    while (v14);
  }
  else
  {
    uint64_t v6 = 0;
  }

  objc_msgSend(v3, "appendFormat:", @"totalSize: %zu\n", v6);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_lastPersistError, 0);
  objc_storeStrong((id *)&self->_persistTransaction, 0);
  objc_storeStrong((id *)&self->_persistQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (void)initWithName:(void *)a1 size:(void *)a2 .cold.1(void *a1, void *a2)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  [v3 UTF8String];
  OUTLINED_FUNCTION_1();
  __int16 v7 = 1024;
  int v8 = v5;
  _os_log_error_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_ERROR, "Failed to create store with name %s, size %d", v6, 0x12u);
}

- (void)initWithName:(void *)a1 size:(void *)a2 .cold.2(void *a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = a1;
  uint64_t v4 = a2;
  [v3 UTF8String];
  OUTLINED_FUNCTION_1();
  _os_log_error_impl(&dword_18ECEB000, v4, OS_LOG_TYPE_ERROR, "Failed to read/load store with name %s", v5, 0xCu);
}

+ (void)openOrCreateSharedMemoryWithName:size:.cold.1()
{
  OUTLINED_FUNCTION_20();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "Failed to open shared memory with name: %{public}@ Error: %{public}s", v3, v4, v5, v6, v7);
}

+ (void)openOrCreateSharedMemoryWithName:size:.cold.2()
{
  OUTLINED_FUNCTION_20();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "mmap failed for name %{public}@ Error: %{public}s", v3, v4, v5, v6, v7);
}

+ (void)openOrCreateSharedMemoryWithName:size:.cold.3()
{
  OUTLINED_FUNCTION_20();
  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_0(&dword_18ECEB000, v1, v2, "Failed to truncate shared memory with name %{public}@ Error: %{public}s", v3, v4, v5, v6, v7);
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.1()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Encountered an invalid header", v2, v3, v4, v5, v6);
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_fault_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_FAULT, "Encountered invalid header: {isValid=0; size=%zu}",
    v1,
    0xCu);
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.3()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Failed to read keyed data from memory", v2, v3, v4, v5, v6);
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.4()
{
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_18ECEB000, v0, v1, "Keyed data is missing a valid key", v2, v3, v4, v5, v6);
}

+ (void)readKeyedDataDictionaryFromMemory:size:.cold.5()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  __int16 v3 = 2048;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_18ECEB000, v1, OS_LOG_TYPE_ERROR, "Attempt to read offset %lu > %lu", v2, 0x16u);
}

- (void)_persistToShMem
{
  OUTLINED_FUNCTION_2();
  _os_log_debug_impl(&dword_18ECEB000, v0, OS_LOG_TYPE_DEBUG, "Starting persist to shared memory.", v1, 2u);
}

@end