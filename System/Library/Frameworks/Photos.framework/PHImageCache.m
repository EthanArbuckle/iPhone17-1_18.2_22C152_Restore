@interface PHImageCache
- (BOOL)pinEntryForKey:(id)a3 requestID:(int)a4 inFlightRequestID:(int *)a5;
- (BOOL)populateEntryWithImage:(CGImage *)a3 requestID:(int)a4 forKey:(id)a5 additionalInfo:(id)a6;
- (PHImageCache)init;
- (PHImageCacheDelegate)delegate;
- (void)_removeEntry:(id)a3;
- (void)commitChangesWithQueueToProcessDeletes:(id)a3;
- (void)queryEntryForKey:(id)a3 didWaitForInFlightRequest:(BOOL *)a4 didFindImage:(BOOL *)a5 entryIsValidBlock:(id)a6 resultHandler:(id)a7;
- (void)removeAllEntries;
- (void)removeEntriesForKeys:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation PHImageCache

- (void)queryEntryForKey:(id)a3 didWaitForInFlightRequest:(BOOL *)a4 didFindImage:(BOOL *)a5 entryIsValidBlock:(id)a6 resultHandler:(id)a7
{
  v23 = (uint64_t (**)(id, void *))a6;
  id v12 = a7;
  p_lock = &self->_lock;
  id v14 = a3;
  os_unfair_lock_lock(&self->_lock);
  v15 = [(NSMutableDictionary *)self->_backingDictionary objectForKey:v14];

  if (v23)
  {
    v16 = [v15 additionalInfo];
    char v17 = v23[2](v23, v16);

    char v18 = v17 ^ 1;
  }
  else
  {
    char v18 = 0;
  }
  if (v15) {
    char v19 = v18;
  }
  else {
    char v19 = 1;
  }
  if (v19) {
    goto LABEL_11;
  }
  uint64_t v20 = [v15 createImageRef];
  v21 = (CGImage *)v20;
  if (a4 && !v20)
  {
    [v15 addNotifyHandler:v12];
LABEL_11:
    LOBYTE(v21) = v19 ^ 1;
    os_unfair_lock_unlock(p_lock);
    goto LABEL_12;
  }
  os_unfair_lock_unlock(p_lock);
  if (!v21)
  {
LABEL_12:
    BOOL v22 = 0;
    if (!a4) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  (*((void (**)(id, CGImage *, void, void))v12 + 2))(v12, v21, 0, 0);
  CGImageRelease(v21);
  LOBYTE(v21) = 0;
  BOOL v22 = 1;
  if (a4) {
LABEL_13:
  }
    *a4 = (char)v21;
LABEL_14:
  if (a5) {
    *a5 = v22;
  }
}

- (BOOL)populateEntryWithImage:(CGImage *)a3 requestID:(int)a4 forKey:(id)a5 additionalInfo:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  os_unfair_lock_lock(&self->_lock);
  id v12 = [(NSMutableDictionary *)self->_backingDictionary objectForKey:v10];
  if (v12)
  {
    id v13 = v12;
  }
  else
  {
    id v13 = [(NSMutableDictionary *)self->_uncommittedInserts objectForKey:v10];
    if (!v13) {
      goto LABEL_8;
    }
  }
  int v14 = [v13 imageRequestIDForPopulatingCache];
  if (v14 != a4)
  {
    if (!v14)
    {
      char v17 = [v13 hasImageRef];

      if (a3 && (v17 & 1) == 0) {
        goto LABEL_6;
      }
LABEL_9:
      os_unfair_lock_unlock(&self->_lock);
      BOOL v15 = 0;
      goto LABEL_10;
    }
LABEL_8:

    goto LABEL_9;
  }

LABEL_6:
  [v13 setImageRequestIDForPopulatingCache:0];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __71__PHImageCache_populateEntryWithImage_requestID_forKey_additionalInfo___block_invoke;
  v18[3] = &unk_1E5848578;
  v18[4] = self;
  [v13 populateWithImageRef:a3 additionalInfo:v11 error:0 executeBeforeNotifyingWaitersBlock:v18];
  BOOL v15 = 1;
LABEL_10:

  return v15;
}

- (void)setDelegate:(id)a3
{
}

- (PHImageCache)init
{
  v14.receiver = self;
  v14.super_class = (Class)PHImageCache;
  v2 = [(PHImageCache *)&v14 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    backingDictionary = v2->_backingDictionary;
    v2->_backingDictionary = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uncommittedInserts = v2->_uncommittedInserts;
    v2->_uncommittedInserts = v5;

    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uncommittedDeletes = v2->_uncommittedDeletes;
    v2->_uncommittedDeletes = v7;

    v2->_lock._os_unfair_lock_opaque = 0;
    v9 = [[PHRecyclableObjectVendor alloc] initWithTargetClass:objc_opt_class() requiresThreadSafety:1 initialPoolSize:50];
    entryVendor = v2->_entryVendor;
    v2->_entryVendor = v9;

    id v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
    id v12 = DCIM_applicationDidReceiveMemoryWarningNotificationName();
    [v11 addObserver:v2 selector:sel__didReceiveMemoryWarningNotification_ name:v12 object:0];
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_entryVendor, 0);
  objc_storeStrong((id *)&self->_uncommittedDeletes, 0);
  objc_storeStrong((id *)&self->_uncommittedInserts, 0);

  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

- (PHImageCacheDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (PHImageCacheDelegate *)WeakRetained;
}

- (void)commitChangesWithQueueToProcessDeletes:(id)a3
{
  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  [(NSMutableDictionary *)self->_backingDictionary addEntriesFromDictionary:self->_uncommittedInserts];
  backingDictionary = self->_backingDictionary;
  v7 = [(NSMutableDictionary *)self->_uncommittedDeletes allKeys];
  [(NSMutableDictionary *)backingDictionary removeObjectsForKeys:v7];

  v8 = (void *)[(NSMutableDictionary *)self->_uncommittedDeletes copy];
  [(NSMutableDictionary *)self->_uncommittedDeletes removeAllObjects];
  [(NSMutableDictionary *)self->_uncommittedInserts removeAllObjects];
  os_unfair_lock_unlock(p_lock);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke;
  v10[3] = &unk_1E5848DF0;
  id v11 = v8;
  id v12 = self;
  id v9 = v8;
  dispatch_async(v5, v10);
}

uint64_t __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke_2;
  v3[3] = &unk_1E5841EE8;
  v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateKeysAndObjectsUsingBlock:v3];
}

uint64_t __55__PHImageCache_commitChangesWithQueueToProcessDeletes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeEntry:");
}

- (void)removeAllEntries
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  [(NSMutableDictionary *)self->_uncommittedDeletes addEntriesFromDictionary:self->_backingDictionary];
  [(NSMutableDictionary *)self->_uncommittedDeletes addEntriesFromDictionary:self->_uncommittedInserts];
  [(NSMutableDictionary *)self->_uncommittedInserts removeAllObjects];

  os_unfair_lock_unlock(p_lock);
}

- (void)removeEntriesForKeys:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v12;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v11 + 1) + 8 * v8);
        os_unfair_lock_lock(&self->_lock);
        id v10 = [(NSMutableDictionary *)self->_backingDictionary objectForKeyedSubscript:v9];
        if (v10
          || ([(NSMutableDictionary *)self->_uncommittedInserts objectForKeyedSubscript:v9],
              (id v10 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          [(NSMutableDictionary *)self->_uncommittedDeletes setObject:v10 forKeyedSubscript:v9];
        }
        [(NSMutableDictionary *)self->_uncommittedInserts removeObjectForKey:v9];
        os_unfair_lock_unlock(&self->_lock);
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
}

void __71__PHImageCache_populateEntryWithImage_requestID_forKey_additionalInfo___block_invoke(uint64_t a1)
{
}

- (BOOL)pinEntryForKey:(id)a3 requestID:(int)a4 inFlightRequestID:(int *)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v9 = [(NSMutableDictionary *)self->_backingDictionary objectForKey:v8];
  id v10 = v9;
  if (v9)
  {
    int v11 = [v9 imageRequestIDForPopulatingCache];
    if (!v11) {
      [v10 setImageRequestIDForPopulatingCache:v6];
    }
    long long v12 = v10;
  }
  else
  {
    long long v12 = [(PHRecyclableObjectVendor *)self->_entryVendor dequeueRecyclableObject];
    [v12 setImageRequestIDForPopulatingCache:v6];
    [(NSMutableDictionary *)self->_uncommittedInserts setObject:v12 forKeyedSubscript:v8];
    int v11 = 0;
  }
  [(NSMutableDictionary *)self->_uncommittedDeletes removeObjectForKey:v8];
  os_unfair_lock_unlock(&self->_lock);
  if (a5) {
    *a5 = v11;
  }

  return v10 == 0;
}

- (void)_removeEntry:(id)a3
{
  if (a3)
  {
    id v5 = a3;
    id v4 = [(PHImageCache *)self delegate];
    [v4 imageCache:self didEvictCacheEntry:v5];

    [v5 cancel];
    [(PHRecyclableObjectVendor *)self->_entryVendor recycleObject:v5];
  }
}

@end