@interface GKThreadsafeDictionary
- (GKThreadsafeDictionary)initWithName:(id)a3;
- (NSMutableDictionary)dictionary;
- (id)allKeys;
- (id)allObjects;
- (id)description;
- (id)dictionaryCopy;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 objectProducerBlock:(id)a4;
- (id)objectForKeyWillReplace:(id)a3 objectProducerBlock:(id)a4;
- (void)readFromDictionary:(id)a3;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)writeToDictionary:(id)a3;
@end

@implementation GKThreadsafeDictionary

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __39__GKThreadsafeDictionary_objectForKey___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKey:a1[5]];

  return MEMORY[0x1F41817F8]();
}

- (GKThreadsafeDictionary)initWithName:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)GKThreadsafeDictionary;
  v5 = [(GKThreadsafeDictionary *)&v12 init];
  if (v5)
  {
    v6 = (const char *)[v4 UTF8String];
    dispatch_queue_t v7 = dispatch_queue_create(v6, MEMORY[0x1E4F14430]);
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v7;

    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    dictionary = v5->_dictionary;
    v5->_dictionary = v9;
  }
  return v5;
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__GKThreadsafeDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E646EC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__12;
  v16 = __Block_byref_object_dispose__12;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__GKThreadsafeDictionary_objectForKey___block_invoke;
  block[3] = &unk_1E6470CC8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

uint64_t __45__GKThreadsafeDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
}

uint64_t __43__GKThreadsafeDictionary_setObject_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 16) setObject:a1[6] forKeyedSubscript:a1[5]];
}

uint64_t __44__GKThreadsafeDictionary_writeToDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (void)writeToDictionary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__GKThreadsafeDictionary_writeToDictionary___block_invoke;
  v7[3] = &unk_1E646DC30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

void __59__GKThreadsafeDictionary_objectForKey_objectProducerBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v5 = a1[6];
    if (v5)
    {
      uint64_t v6 = (*(void (**)(void))(v5 + 16))();
      uint64_t v7 = *(void *)(a1[7] + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      if (*(void *)(*(void *)(a1[7] + 8) + 40))
      {
        v9 = *(void **)(a1[4] + 16);
        objc_msgSend(v9, "setObject:forKeyedSubscript:");
      }
    }
  }
}

- (id)objectForKey:(id)a3 objectProducerBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__12;
  v21 = __Block_byref_object_dispose__12;
  id v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __59__GKThreadsafeDictionary_objectForKey_objectProducerBlock___block_invoke;
  v13[3] = &unk_1E6470CF0;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(queue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__GKThreadsafeDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_1E646F558;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_barrier_async(queue, block);
}

- (id)description
{
  uint64_t v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)GKThreadsafeDictionary;
  id v4 = [(GKThreadsafeDictionary *)&v7 description];
  uint64_t v5 = [v3 stringWithFormat:@"%@ %@ %@", v4, self->_queue, self->_dictionary];

  return v5;
}

- (id)allObjects
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = __Block_byref_object_copy__12;
  id v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __36__GKThreadsafeDictionary_allObjects__block_invoke;
  v5[3] = &unk_1E646EB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_barrier_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __36__GKThreadsafeDictionary_allObjects__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)objectForKeyWillReplace:(id)a3 objectProducerBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v20 = 0;
  v21 = &v20;
  uint64_t v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__12;
  v24 = __Block_byref_object_dispose__12;
  id v25 = 0;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__12;
  v18[4] = __Block_byref_object_dispose__12;
  id v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __70__GKThreadsafeDictionary_objectForKeyWillReplace_objectProducerBlock___block_invoke;
  block[3] = &unk_1E6470D18;
  block[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v20;
  uint64_t v17 = v18;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(queue, block);
  id v11 = (id)v21[5];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(&v20, 8);

  return v11;
}

void __70__GKThreadsafeDictionary_objectForKeyWillReplace_objectProducerBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) objectForKeyedSubscript:a1[5]];
  uint64_t v3 = *(void *)(a1[7] + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v5 = a1[6];
    if (v5)
    {
      uint64_t v6 = (*(void (**)(void))(v5 + 16))();
      uint64_t v7 = *(void *)(a1[8] + 8);
      uint64_t v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;

      uint64_t v9 = *(void *)(*(void *)(a1[8] + 8) + 40);
      if (v9) {
        [*(id *)(a1[4] + 16) setObject:v9 forKeyedSubscript:a1[5]];
      }
    }
  }
  if (!*(void *)(*(void *)(a1[7] + 8) + 40))
  {
    uint64_t v10 = a1[6];
    if (v10)
    {
      uint64_t v11 = (*(void (**)(uint64_t, void))(v10 + 16))(v10, 0);
      uint64_t v12 = *(void *)(a1[7] + 8);
      id v13 = *(void **)(v12 + 40);
      *(void *)(v12 + 40) = v11;

      if (*(void *)(*(void *)(a1[7] + 8) + 40))
      {
        id v14 = *(void **)(a1[4] + 16);
        objc_msgSend(v14, "setObject:forKeyedSubscript:");
      }
    }
  }
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__GKThreadsafeDictionary_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_1E646EC80;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_async(queue, v7);
}

uint64_t __47__GKThreadsafeDictionary_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__GKThreadsafeDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_1E646D7F0;
  block[4] = self;
  dispatch_barrier_async(queue, block);
}

uint64_t __42__GKThreadsafeDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) removeAllObjects];
}

- (void)readFromDictionary:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __45__GKThreadsafeDictionary_readFromDictionary___block_invoke;
  v7[3] = &unk_1E646DC30;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, v7);
}

uint64_t __45__GKThreadsafeDictionary_readFromDictionary___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(*(void *)(a1 + 32) + 16));
}

- (id)allKeys
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __33__GKThreadsafeDictionary_allKeys__block_invoke;
  v5[3] = &unk_1E646EB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __33__GKThreadsafeDictionary_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (id)dictionaryCopy
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = __Block_byref_object_copy__12;
  uint64_t v10 = __Block_byref_object_dispose__12;
  id v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __40__GKThreadsafeDictionary_dictionaryCopy__block_invoke;
  v5[3] = &unk_1E646EB68;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

uint64_t __40__GKThreadsafeDictionary_dictionaryCopy__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void *)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return MEMORY[0x1F41817F8](v2, v4);
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void)setDictionary:(id)a3
{
}

@end