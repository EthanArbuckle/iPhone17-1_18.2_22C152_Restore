@interface CKMultiDict
- (CKMultiDict)init;
- (NSMutableDictionary)dictionary;
- (OS_dispatch_queue)lockQueue;
- (id)allKeys;
- (id)dequeueObjectForKey:(id)a3;
- (id)description;
- (id)headObjectForKey:(id)a3;
- (id)objectsForKey:(id)a3;
- (id)peekObjectForKey:(id)a3;
- (id)popObjectForKey:(id)a3;
- (unint64_t)count;
- (void)pushObject:(id)a3 forKey:(id)a4;
- (void)removeAllObjects;
- (void)removeObjectsForKey:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setLockQueue:(id)a3;
@end

@implementation CKMultiDict

- (CKMultiDict)init
{
  v7.receiver = self;
  v7.super_class = (Class)CKMultiDict;
  v2 = [(CKMultiDict *)&v7 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(CKMultiDict *)v2 setDictionary:v3];
    dispatch_queue_t v4 = dispatch_queue_create(0, 0);
    lockQueue = v2->_lockQueue;
    v2->_lockQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setDictionary:(id)a3
{
}

- (id)description
{
  uint64_t v6 = 0;
  objc_super v7 = &v6;
  uint64_t v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__67;
  v10 = __Block_byref_object_dispose__67;
  id v11 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __26__CKMultiDict_description__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __26__CKMultiDict_description__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dictionary];
  uint64_t v2 = [v5 description];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  dispatch_queue_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)pushObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __33__CKMultiDict_pushObject_forKey___block_invoke;
  block[3] = &unk_1E5620AA8;
  block[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(lockQueue, block);
}

void __33__CKMultiDict_pushObject_forKey___block_invoke(uint64_t a1)
{
  ++*(void *)(*(void *)(a1 + 32) + 16);
  id v3 = [*(id *)(a1 + 32) dictionary];
  uint64_t v2 = [v3 objectForKey:*(void *)(a1 + 40)];
  if (!v2)
  {
    uint64_t v2 = [MEMORY[0x1E4F1CA48] array];
    [v3 setObject:v2 forKey:*(void *)(a1 + 40)];
  }
  [v2 addObject:*(void *)(a1 + 48)];
}

- (id)peekObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CKMultiDict_peekObjectForKey___block_invoke;
  block[3] = &unk_1E5620A80;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(lockQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __32__CKMultiDict_peekObjectForKey___block_invoke(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) dictionary];
  uint64_t v2 = [v6 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = [v2 lastObject];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;
}

- (id)popObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CKMultiDict_popObjectForKey___block_invoke;
  block[3] = &unk_1E56219E0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(lockQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __31__CKMultiDict_popObjectForKey___block_invoke(void *a1)
{
  uint64_t v2 = (void *)a1[4];
  uint64_t v3 = v2[2];
  if (v3)
  {
    v2[2] = v3 - 1;
    uint64_t v2 = (void *)a1[4];
  }
  id v4 = [v2 dictionary];
  id v8 = [v4 objectForKey:a1[5]];

  uint64_t v5 = [v8 lastObject];
  uint64_t v6 = *(void *)(a1[6] + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (*(void *)(*(void *)(a1[6] + 8) + 40)) {
    [v8 removeLastObject];
  }
}

- (id)headObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __32__CKMultiDict_headObjectForKey___block_invoke;
  block[3] = &unk_1E56219E0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(lockQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __32__CKMultiDict_headObjectForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dictionary];
  id v6 = [v2 objectForKey:*(void *)(a1 + 40)];

  if ([v6 count])
  {
    uint64_t v3 = [v6 objectAtIndex:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
}

- (id)dequeueObjectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__67;
  v16 = __Block_byref_object_dispose__67;
  id v17 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__CKMultiDict_dequeueObjectForKey___block_invoke;
  block[3] = &unk_1E56219E0;
  block[4] = self;
  id v10 = v4;
  id v11 = &v12;
  id v6 = v4;
  dispatch_sync(lockQueue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);

  return v7;
}

void __35__CKMultiDict_dequeueObjectForKey___block_invoke(uint64_t a1)
{
  --*(void *)(*(void *)(a1 + 32) + 16);
  uint64_t v2 = [*(id *)(a1 + 32) dictionary];
  id v6 = [v2 objectForKey:*(void *)(a1 + 40)];

  if ([v6 count])
  {
    uint64_t v3 = [v6 objectAtIndex:0];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    [v6 removeObjectAtIndex:0];
  }
}

- (id)objectsForKey:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__67;
  id v17 = __Block_byref_object_dispose__67;
  id v18 = 0;
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__CKMultiDict_objectsForKey___block_invoke;
  block[3] = &unk_1E5620A80;
  uint64_t v12 = &v13;
  block[4] = self;
  id v6 = v4;
  id v11 = v6;
  dispatch_sync(lockQueue, block);
  if ([(id)v14[5] count]) {
    id v7 = (void *)v14[5];
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  _Block_object_dispose(&v13, 8);

  return v8;
}

void __29__CKMultiDict_objectsForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dictionary];
  uint64_t v3 = [v2 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) copy];
  uint64_t v7 = *(void *)(*(void *)(a1 + 48) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v6;
}

- (void)removeObjectsForKey:(id)a3
{
  id v4 = a3;
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __35__CKMultiDict_removeObjectsForKey___block_invoke;
  v7[3] = &unk_1E5620AF8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(lockQueue, v7);
}

void __35__CKMultiDict_removeObjectsForKey___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) dictionary];
  uint64_t v2 = [v3 objectForKey:*(void *)(a1 + 40)];
  *(void *)(*(void *)(a1 + 32) + 16) -= [v2 count];

  [v3 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  lockQueue = self->_lockQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __31__CKMultiDict_removeAllObjects__block_invoke;
  block[3] = &unk_1E5620C40;
  block[4] = self;
  dispatch_async(lockQueue, block);
}

void __31__CKMultiDict_removeAllObjects__block_invoke(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 16) = 0;
  id v1 = [*(id *)(a1 + 32) dictionary];
  [v1 removeAllObjects];
}

- (unint64_t)count
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  lockQueue = self->_lockQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __20__CKMultiDict_count__block_invoke;
  v5[3] = &unk_1E5628B80;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(lockQueue, v5);
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __20__CKMultiDict_count__block_invoke(uint64_t result)
{
  *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(void *)(*(void *)(result + 32) + 16);
  return result;
}

- (id)allKeys
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  id v11 = __Block_byref_object_copy__67;
  uint64_t v12 = __Block_byref_object_dispose__67;
  id v13 = 0;
  id v13 = [MEMORY[0x1E4F1CA48] array];
  lockQueue = self->_lockQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __22__CKMultiDict_allKeys__block_invoke;
  v7[3] = &unk_1E562B170;
  v7[4] = self;
  void v7[5] = &v8;
  dispatch_sync(lockQueue, v7);
  if ([(id)v9[5] count]) {
    id v4 = (void *)v9[5];
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __22__CKMultiDict_allKeys__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) dictionary];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __22__CKMultiDict_allKeys__block_invoke_2;
  v3[3] = &unk_1E562B598;
  v3[4] = *(void *)(a1 + 40);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __22__CKMultiDict_allKeys__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if ([a3 count]) {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) addObject:v5];
  }
}

- (OS_dispatch_queue)lockQueue
{
  return self->_lockQueue;
}

- (void)setLockQueue:(id)a3
{
}

- (NSMutableDictionary)dictionary
{
  return self->_dictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dictionary, 0);

  objc_storeStrong((id *)&self->_lockQueue, 0);
}

@end