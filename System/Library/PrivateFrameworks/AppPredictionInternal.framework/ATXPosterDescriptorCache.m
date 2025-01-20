@interface ATXPosterDescriptorCache
+ (id)sharedInstance;
- (ATXPosterDescriptorCache)init;
- (ATXPosterDescriptorCache)initWithPath:(id)a3;
- (NSDictionary)descriptors;
- (NSSet)allDescriptors;
- (id)_readDescriptorsFromDisk;
- (void)_writeDescriptorsToDisk:(id)a3;
- (void)registerObserver:(id)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateDescriptors:(id)a3;
@end

@implementation ATXPosterDescriptorCache

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_2 != -1) {
    dispatch_once(&sharedInstance_onceToken_2, &__block_literal_global_55);
  }
  v2 = (void *)sharedInstance_cache;
  return v2;
}

uint64_t __42__ATXPosterDescriptorCache_sharedInstance__block_invoke()
{
  sharedInstance_cache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (ATXPosterDescriptorCache)init
{
  v3 = [MEMORY[0x1E4F4B650] posterDescriptorCacheFilePath];
  v4 = [(ATXPosterDescriptorCache *)self initWithPath:v3];

  return v4;
}

- (ATXPosterDescriptorCache)initWithPath:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)ATXPosterDescriptorCache;
  v5 = [(ATXPosterDescriptorCache *)&v18 init];
  if (v5)
  {
    if (v4)
    {
      id v6 = objc_alloc(MEMORY[0x1E4F4B638]);
      v7 = __atxlog_handle_lock_screen();
      uint64_t v8 = [v6 initWithCacheFilePath:v4 loggingHandle:v7 debugName:@"poster descriptors"];
      fileCache = v5->_fileCache;
      v5->_fileCache = (ATXGenericFileBasedCache *)v8;
    }
    id v10 = objc_alloc(MEMORY[0x1E4F93B70]);
    v11 = objc_opt_new();
    uint64_t v12 = [v10 initWithGuardedData:v11];
    lock = v5->_lock;
    v5->_lock = (_PASLock *)v12;

    v14 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v15 = dispatch_queue_create("com.apple.proactive.ATXPosterDescriptorCache.Output", v14);
    outputQueue = v5->_outputQueue;
    v5->_outputQueue = (OS_dispatch_queue *)v15;
  }
  return v5;
}

- (NSDictionary)descriptors
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__26;
  id v10 = __Block_byref_object_dispose__26;
  id v11 = 0;
  lock = self->_lock;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __39__ATXPosterDescriptorCache_descriptors__block_invoke;
  v5[3] = &unk_1E68AE3D0;
  v5[4] = self;
  v5[5] = &v6;
  [(_PASLock *)lock runWithLockAcquired:v5];
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (NSDictionary *)v3;
}

uint64_t __39__ATXPosterDescriptorCache_descriptors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[1];
  if (!v3)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = a2;
    uint64_t v7 = [v5 _readDescriptorsFromDisk];
    uint64_t v8 = (void *)a2[1];
    a2[1] = v7;

    id v3 = (void *)a2[1];
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = [v3 copy];
  return MEMORY[0x1F41817F8]();
}

- (NSSet)allDescriptors
{
  id v3 = objc_opt_new();
  lock = self->_lock;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ATXPosterDescriptorCache_allDescriptors__block_invoke;
  v9[3] = &unk_1E68AE420;
  v9[4] = self;
  id v5 = v3;
  id v10 = v5;
  [(_PASLock *)lock runWithLockAcquired:v9];
  uint64_t v6 = v10;
  uint64_t v7 = (NSSet *)v5;

  return v7;
}

void __42__ATXPosterDescriptorCache_allDescriptors__block_invoke(uint64_t a1, void *a2)
{
  id v3 = (void *)a2[1];
  if (!v3)
  {
    id v5 = *(void **)(a1 + 32);
    uint64_t v6 = a2;
    uint64_t v7 = [v5 _readDescriptorsFromDisk];
    uint64_t v8 = (void *)a2[1];
    a2[1] = v7;

    id v3 = (void *)a2[1];
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __42__ATXPosterDescriptorCache_allDescriptors__block_invoke_2;
  v9[3] = &unk_1E68AE3F8;
  id v10 = *(id *)(a1 + 40);
  [v3 enumerateKeysAndObjectsUsingBlock:v9];
}

void __42__ATXPosterDescriptorCache_allDescriptors__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if ([v4 count]) {
    [*(id *)(a1 + 32) addObjectsFromArray:v4];
  }
}

- (void)updateDescriptors:(id)a3
{
  id v4 = (void *)[a3 copy];
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke;
  v7[3] = &unk_1E68AE420;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

void __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3[1];
  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (id)objc_opt_new();
  }
  id v6 = v5;
  if (*(void *)(a1 + 32)) {
    uint64_t v7 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v7 = MEMORY[0x1E4F1CC08];
  }
  if ([v5 isEqualToDictionary:v7])
  {
    id v8 = __atxlog_handle_lock_screen();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0FA3000, v8, OS_LOG_TYPE_DEFAULT, "Bypassing poster descriptor update because the descriptors are the same", buf, 2u);
    }
  }
  else
  {
    objc_storeStrong(v3 + 1, *(id *)(a1 + 32));
    if (*(void *)(a1 + 32)) {
      objc_msgSend(*(id *)(a1 + 40), "_writeDescriptorsToDisk:");
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v3[2];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      dispatch_queue_t v15 = v6;
      uint64_t v11 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v18 + 1) + 8 * i);
          v14 = *(NSObject **)(*(void *)(a1 + 40) + 24);
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke_27;
          block[3] = &unk_1E68AB870;
          block[4] = v13;
          id v17 = *(id *)(a1 + 32);
          dispatch_async(v14, block);
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v23 count:16];
      }
      while (v10);
      id v6 = v15;
    }
  }
}

uint64_t __46__ATXPosterDescriptorCache_updateDescriptors___block_invoke_27(uint64_t a1)
{
  return [*(id *)(a1 + 32) descriptorCacheDidUpdateWithDescriptors:*(void *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__ATXPosterDescriptorCache_registerObserver___block_invoke;
  v7[3] = &unk_1E68AE448;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __45__ATXPosterDescriptorCache_registerObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) addObject:*(void *)(a1 + 32)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  lock = self->_lock;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__ATXPosterDescriptorCache_unregisterObserver___block_invoke;
  v7[3] = &unk_1E68AE448;
  id v8 = v4;
  id v6 = v4;
  [(_PASLock *)lock runWithLockAcquired:v7];
}

uint64_t __47__ATXPosterDescriptorCache_unregisterObserver___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a2 + 16) removeObject:*(void *)(a1 + 32)];
}

- (id)_readDescriptorsFromDisk
{
  fileCache = self->_fileCache;
  id v3 = (void *)MEMORY[0x1D25F6CC0]();
  id v4 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  id v8 = objc_msgSend(v4, "initWithObjects:", v5, v6, v7, objc_opt_class(), 0);
  uint64_t v9 = [(ATXGenericFileBasedCache *)fileCache readSecureCodedObjectWithMaxValidAge:v8 allowableClasses:0 error:-1.0];

  return v9;
}

- (void)_writeDescriptorsToDisk:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputQueue, 0);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_fileCache, 0);
}

@end