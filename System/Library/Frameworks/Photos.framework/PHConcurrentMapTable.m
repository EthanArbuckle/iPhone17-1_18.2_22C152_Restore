@interface PHConcurrentMapTable
+ (id)mapTable;
- (BOOL)tryRemoveObjectForKey:(id)a3;
- (PHConcurrentMapTable)init;
- (id)allKeys;
- (id)objectForKey:(id)a3;
- (unint64_t)count;
- (void)_dispatchIsolatedRead:(id)a3;
- (void)_dispatchIsolatedWriteAsync:(id)a3;
- (void)_dispatchIsolatedWriteSync:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
@end

@implementation PHConcurrentMapTable

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_protectedTable, 0);

  objc_storeStrong((id *)&self->_isolationQueue, 0);
}

- (id)allKeys
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __31__PHConcurrentMapTable_allKeys__block_invoke;
  v8[3] = &unk_1E5848DF0;
  v8[4] = self;
  id v4 = v3;
  id v9 = v4;
  [(PHConcurrentMapTable *)self _dispatchIsolatedRead:v8];
  v5 = v9;
  id v6 = v4;

  return v6;
}

void __31__PHConcurrentMapTable_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(a1 + 40), "addObject:", *(void *)(*((void *)&v7 + 1) + 8 * v6++), (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)removeAllObjects
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __40__PHConcurrentMapTable_removeAllObjects__block_invoke;
  v2[3] = &unk_1E5848578;
  v2[4] = self;
  [(PHConcurrentMapTable *)self _dispatchIsolatedWriteAsync:v2];
}

uint64_t __40__PHConcurrentMapTable_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (unint64_t)count
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __29__PHConcurrentMapTable_count__block_invoke;
  v4[3] = &unk_1E5848D28;
  v4[4] = self;
  v4[5] = &v5;
  [(PHConcurrentMapTable *)self _dispatchIsolatedRead:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

uint64_t __29__PHConcurrentMapTable_count__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 16) count];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __41__PHConcurrentMapTable_setObject_forKey___block_invoke;
  v10[3] = &unk_1E5848EC0;
  v10[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  [(PHConcurrentMapTable *)self _dispatchIsolatedWriteAsync:v10];
}

uint64_t __41__PHConcurrentMapTable_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[5] forKey:a1[6]];
}

- (BOOL)tryRemoveObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__PHConcurrentMapTable_tryRemoveObjectForKey___block_invoke;
  v7[3] = &unk_1E5848318;
  id v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(PHConcurrentMapTable *)self _dispatchIsolatedWriteSync:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

uint64_t __46__PHConcurrentMapTable_tryRemoveObjectForKey___block_invoke(void *a1)
{
  unint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 16);

  return [v4 removeObjectForKey:v3];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __43__PHConcurrentMapTable_removeObjectForKey___block_invoke;
  v6[3] = &unk_1E5848DF0;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(PHConcurrentMapTable *)self _dispatchIsolatedWriteAsync:v6];
}

uint64_t __43__PHConcurrentMapTable_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__45666;
  v15 = __Block_byref_object_dispose__45667;
  id v16 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __37__PHConcurrentMapTable_objectForKey___block_invoke;
  v8[3] = &unk_1E5848318;
  uint64_t v10 = &v11;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  [(PHConcurrentMapTable *)self _dispatchIsolatedRead:v8];
  id v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);

  return v6;
}

void __37__PHConcurrentMapTable_objectForKey___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  uint64_t v3 = *(void *)(a1[6] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_dispatchIsolatedRead:(id)a3
{
}

- (void)_dispatchIsolatedWriteSync:(id)a3
{
}

- (void)_dispatchIsolatedWriteAsync:(id)a3
{
}

- (PHConcurrentMapTable)init
{
  v8.receiver = self;
  v8.super_class = (Class)PHConcurrentMapTable;
  uint64_t v2 = [(PHConcurrentMapTable *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("PHConcurrentMapTable read/write isolation queue", MEMORY[0x1E4F14430]);
    isolationQueue = v2->_isolationQueue;
    v2->_isolationQueue = (OS_dispatch_queue *)v3;

    uint64_t v5 = [MEMORY[0x1E4F28E10] strongToStrongObjectsMapTable];
    protectedTable = v2->_protectedTable;
    v2->_protectedTable = (NSMapTable *)v5;
  }
  return v2;
}

+ (id)mapTable
{
  uint64_t v2 = objc_alloc_init(PHConcurrentMapTable);

  return v2;
}

@end