@interface ATXHistogramTable
+ (BOOL)supportsSecureCoding;
- (ATXHistogramTable)init;
- (ATXHistogramTable)initWithCoder:(id)a3;
- (ATXHistogramTable)initWithDatastore:(id)a3;
- (ATXHistogramTable)initWithDatastore:(id)a3 blobType:(int64_t)a4;
- (ATXHistogramTable)initWithDict:(id)a3 usedIds:(id)a4 datastore:(id)a5 blobType:(int64_t)a6;
- (BOOL)lookup:(id)a3 into:(unsigned __int16 *)a4;
- (id).cxx_construct;
- (id)allKeys;
- (id)allKeysFilteredBy:(id)a3;
- (id)histogramTableDict;
- (unsigned)intern:(id)a3;
- (unsigned)remove:(id)a3;
- (void)clear;
- (void)encodeWithCoder:(id)a3;
- (void)flush;
@end

@implementation ATXHistogramTable

- (ATXHistogramTable)init
{
  return [(ATXHistogramTable *)self initWithDict:0 usedIds:0 datastore:0 blobType:1];
}

- (ATXHistogramTable)initWithDatastore:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, self, @"ATXHistogramData.mm", 652, @"Invalid parameter not satisfying: %@", @"datastore" object file lineNumber description];
  }
  v6 = [(ATXHistogramTable *)self initWithDict:0 usedIds:0 datastore:v5 blobType:1];

  return v6;
}

- (ATXHistogramTable)initWithDatastore:(id)a3 blobType:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, self, @"ATXHistogramData.mm", 658, @"Invalid parameter not satisfying: %@", @"datastore" object file lineNumber description];
  }
  v8 = [(ATXHistogramTable *)self initWithDict:0 usedIds:0 datastore:v7 blobType:a4];

  return v8;
}

- (ATXHistogramTable)initWithDict:(id)a3 usedIds:(id)a4 datastore:(id)a5 blobType:(int64_t)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXHistogramTable;
  v12 = [(ATXHistogramTable *)&v19 init];
  v13 = v12;
  if (v12)
  {
    dict = v12->_private_unsafeGuardedData.dict;
    v12->_private_unsafeGuardedData.dict = 0;

    usedIds = v13->_private_unsafeGuardedData.usedIds;
    v13->_private_unsafeGuardedData.usedIds = 0;

    prevKey = v13->_private_unsafeGuardedData.prevKey;
    v13->_private_unsafeGuardedData.prevKey = 0;

    v13->_private_unsafeGuardedData.prevEventId = 0;
    operator new();
  }
  v17 = (ATXHistogramTable *)0;

  return v17;
}

void __61__ATXHistogramTable_initWithDict_usedIds_datastore_blobType___block_invoke()
{
  v0 = (void *)MEMORY[0x1D25F6CC0]();
  v1 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_UTILITY, 0);

  dispatch_queue_t v3 = dispatch_queue_create("ATXHistogramTable-backgroundSaver", v2);
  v4 = (void *)-[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasExprOnceResult;
  -[ATXHistogramTable initWithDict:usedIds:datastore:blobType:]::_pasExprOnceResult = (uint64_t)v3;
}

void __61__ATXHistogramTable_initWithDict_usedIds_datastore_blobType___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained flush];
}

- (unsigned)intern:(id)a3
{
  id v5 = a3;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  __int16 v20 = 0;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  int v7 = [*(id *)(*(void *)value + 16) isEqual:v5];
  uint64_t v8 = *(void *)value;
  if (v7)
  {
    unsigned __int16 v9 = *(_WORD *)(v8 + 24);
    *((_WORD *)v18 + 12) = v9;
  }
  else
  {
    id v10 = [*(id *)v8 objectForKeyedSubscript:v5];
    id v11 = v10;
    if (v10)
    {
      __int16 v12 = [v10 unsignedShortValue];
      *((_WORD *)v18 + 12) = v12;
    }
    else
    {
      v13 = *(void **)(*(void *)value + 8);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __28__ATXHistogramTable_intern___block_invoke;
      v16[3] = &unk_1E68B26D8;
      v16[4] = &v17;
      [v13 enumerateRangesUsingBlock:v16];
      v14 = [NSNumber numberWithUnsignedShort:*((unsigned __int16 *)v18 + 12)];
      [**(id **)value setObject:v14 forKeyedSubscript:v5];

      [*(id *)(*(void *)value + 8) addIndex:*((unsigned __int16 *)v18 + 12)];
      [(ATXBackgroundSaver *)self->_saver scheduleSave];
    }
    objc_storeStrong((id *)(*(void *)value + 16), a3);
    *(_WORD *)(*(void *)value + 24) = *((_WORD *)v18 + 12);

    unsigned __int16 v9 = *((_WORD *)v18 + 12);
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  _Block_object_dispose(&v17, 8);

  return v9;
}

uint64_t __28__ATXHistogramTable_intern___block_invoke(uint64_t result, __int16 a2, __int16 a3, unsigned char *a4)
{
  *(_WORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) = a2 + a3;
  *a4 = 1;
  return result;
}

- (BOOL)lookup:(id)a3 into:(unsigned __int16 *)a4
{
  id v7 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  if ([*(id *)(*(void *)value + 16) isEqual:v7])
  {
    if (a4) {
      *a4 = *(_WORD *)(*(void *)value + 24);
    }
    BOOL v9 = 1;
  }
  else
  {
    id v10 = [**(id **)value objectForKeyedSubscript:v7];
    id v11 = v10;
    BOOL v9 = v10 != 0;
    if (v10)
    {
      unsigned __int16 v12 = [v10 unsignedShortValue];
      unsigned __int16 v13 = v12;
      if (a4) {
        *a4 = v12;
      }
      objc_storeStrong((id *)(*(void *)value + 16), a3);
      *(_WORD *)(*(void *)value + 24) = v13;
    }
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));

  return v9;
}

- (id)allKeysFilteredBy:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = (unsigned int (**)(id, void))a3;
  if (!v5)
  {
    v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"ATXHistogramData.mm", 764, @"Invalid parameter not satisfying: %@", @"filter" object file lineNumber description];
  }
  v6 = objc_opt_new();
  value = (char *)self->_guardedData.__ptr_.__value_;
  uint64_t v8 = (pthread_mutex_t *)(value + 8);
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = **(id **)value;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v9);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        if (v5[2](v5, v13)) {
          [v6 addObject:v13];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  id v14 = v6;
  pthread_mutex_unlock(v8);

  return v14;
}

- (id)allKeys
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  dispatch_queue_t v3 = (pthread_mutex_t *)(value + 8);
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v4 = [**(id **)value allKeys];
  pthread_mutex_unlock(v3);
  return v4;
}

- (unsigned)remove:(id)a3
{
  id v4 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  v6 = [**(id **)value objectForKeyedSubscript:v4];
  if (v6)
  {
    [**(id **)value removeObjectForKey:v4];
    objc_msgSend(*(id *)(*(void *)value + 8), "removeIndex:", objc_msgSend(v6, "unsignedIntegerValue"));
  }
  if ([*(id *)(*(void *)value + 16) isEqual:v4])
  {
    id v7 = *(void **)(*(void *)value + 16);
    *(void *)(*(void *)value + 16) = 0;

    *(_WORD *)(*(void *)value + 24) = 0;
  }
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
  if (v6)
  {
    [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
    unsigned __int16 v8 = [v6 unsignedIntegerValue];
  }
  else
  {
    unsigned __int16 v8 = -1;
  }

  return v8;
}

- (void)clear
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  [**(id **)value removeAllObjects];
  [*(id *)(*(void *)value + 8) removeAllIndexes];
  [(ATXBackgroundSaver *)self->_saver scheduleSaveImmediately];
  id v4 = *(void **)(*(void *)value + 16);
  *(void *)(*(void *)value + 16) = 0;

  *(_WORD *)(*(void *)value + 24) = 0;
  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (ATXHistogramTable)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  unsigned __int16 v8 = objc_msgSend(v5, "setWithObjects:", v6, v7, objc_opt_class(), 0);
  id v9 = [v4 decodeObjectOfClasses:v8 forKey:@"dict"];
  uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"usedIds"];
  uint64_t v11 = [(ATXHistogramTable *)self initWithDict:v9 usedIds:v10 datastore:0 blobType:1];

  return v11;
}

- (void)encodeWithCoder:(id)a3
{
  id v7 = a3;
  value = (char *)self->_guardedData.__ptr_.__value_;
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  id v5 = (void *)[**(id **)value mutableCopy];
  [v7 encodeObject:v5 forKey:@"dict"];

  uint64_t v6 = (void *)[*(id *)(*(void *)value + 8) mutableCopy];
  [v7 encodeObject:v6 forKey:@"usedIds"];

  pthread_mutex_unlock((pthread_mutex_t *)(value + 8));
}

- (void)flush
{
  if (self->_datastore)
  {
    dispatch_queue_t v3 = (void *)MEMORY[0x1D25F6CC0]();
    id v4 = (void *)[objc_alloc(MEMORY[0x1E4F28DB0]) initRequiringSecureCoding:1];
    [v4 encodeObject:self forKey:*MEMORY[0x1E4F284E8]];
    datastore = self->_datastore;
    uint64_t v6 = [v4 encodedData];
    [(_ATXDataStore *)datastore writeBlob:v6 type:self->_blobType expirationDate:0];
  }
}

- (id)histogramTableDict
{
  value = (char *)self->_guardedData.__ptr_.__value_;
  dispatch_queue_t v3 = (pthread_mutex_t *)(value + 8);
  pthread_mutex_lock((pthread_mutex_t *)(value + 8));
  id v4 = (void *)[**(id **)value copy];
  pthread_mutex_unlock(v3);
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_saver, 0);
  objc_storeStrong((id *)&self->_datastore, 0);

  dict = self->_private_unsafeGuardedData.dict;
}

- (id).cxx_construct
{
  *((void *)self + 1) = 0;
  *((void *)self + 2) = 0;
  *((void *)self + 3) = 0;
  *((void *)self + 5) = 0;
  return self;
}

- (void)initWithDict:(uint64_t)a1 usedIds:(NSObject *)a2 datastore:blobType:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "Could not load eventId table: %@", (uint8_t *)&v2, 0xCu);
}

@end