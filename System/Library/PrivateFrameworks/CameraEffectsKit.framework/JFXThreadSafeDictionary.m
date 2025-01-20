@interface JFXThreadSafeDictionary
- (JFXThreadSafeDictionary)init;
- (NSArray)allKeys;
- (NSArray)allValues;
- (NSMutableDictionary)dict;
- (OS_dispatch_queue)concurrentQueue;
- (id)description;
- (id)objectForKey:(id)a3;
- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4;
- (id)valueForKey:(id)a3;
- (unint64_t)count;
- (void)addEntriesFromDictionary:(id)a3;
- (void)dealloc;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)removeObjectsForKeys:(id)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)setDict:(id)a3;
- (void)setDictionary:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setValue:(id)a3 forKey:(id)a4;
@end

@implementation JFXThreadSafeDictionary

- (JFXThreadSafeDictionary)init
{
  v6.receiver = self;
  v6.super_class = (Class)JFXThreadSafeDictionary;
  v2 = [(JFXThreadSafeDictionary *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
    [(JFXThreadSafeDictionary *)v2 setDict:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.threadsafedictionaryconcurrentqueuelabel", MEMORY[0x263EF83A8]);
    [(JFXThreadSafeDictionary *)v2 setConcurrentQueue:v4];
  }
  return v2;
}

- (void)dealloc
{
  [(JFXThreadSafeDictionary *)self setDict:0];
  [(JFXThreadSafeDictionary *)self setConcurrentQueue:0];
  v3.receiver = self;
  v3.super_class = (Class)JFXThreadSafeDictionary;
  [(JFXThreadSafeDictionary *)&v3 dealloc];
}

- (id)description
{
  v2 = NSString;
  objc_super v3 = [(JFXThreadSafeDictionary *)self dict];
  dispatch_queue_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  objc_super v3 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __32__JFXThreadSafeDictionary_count__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __32__JFXThreadSafeDictionary_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (NSArray)allKeys
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  objc_super v3 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__JFXThreadSafeDictionary_allKeys__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __34__JFXThreadSafeDictionary_allKeys__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dict];
  uint64_t v2 = [v5 allKeys];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSArray)allValues
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__6;
  v11 = __Block_byref_object_dispose__6;
  id v12 = 0;
  uint64_t v3 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __36__JFXThreadSafeDictionary_allValues__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSArray *)v4;
}

void __36__JFXThreadSafeDictionary_allValues__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dict];
  uint64_t v2 = [v5 allValues];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __44__JFXThreadSafeDictionary_setObject_forKey___block_invoke;
  block[3] = &unk_264C0A888;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(v8, block);
}

void __44__JFXThreadSafeDictionary_setObject_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  [v2 setObject:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__JFXThreadSafeDictionary_setValue_forKey___block_invoke;
  block[3] = &unk_264C0A888;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_barrier_sync(v8, block);
}

void __43__JFXThreadSafeDictionary_setValue_forKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  [v2 setValue:*(void *)(a1 + 40) forKey:*(void *)(a1 + 48)];
}

- (void)addEntriesFromDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __52__JFXThreadSafeDictionary_addEntriesFromDictionary___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __52__JFXThreadSafeDictionary_addEntriesFromDictionary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  [v2 addEntriesFromDictionary:*(void *)(a1 + 40)];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  id v5 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__JFXThreadSafeDictionary_objectForKey___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v10 = v4;
  v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __40__JFXThreadSafeDictionary_objectForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dict];
  uint64_t v2 = [v5 objectForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)objectsForKeys:(id)a3 notFoundMarker:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__6;
  v21 = __Block_byref_object_dispose__6;
  id v22 = 0;
  id v8 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__JFXThreadSafeDictionary_objectsForKeys_notFoundMarker___block_invoke;
  v13[3] = &unk_264C0AB88;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(v8, v13);

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __57__JFXThreadSafeDictionary_objectsForKeys_notFoundMarker___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dict];
  uint64_t v2 = [v5 objectsForKeys:*(void *)(a1 + 40) notFoundMarker:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)valueForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__6;
  v16 = __Block_byref_object_dispose__6;
  id v17 = 0;
  id v5 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__JFXThreadSafeDictionary_valueForKey___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v10 = v4;
  id v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__JFXThreadSafeDictionary_valueForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) dict];
  uint64_t v2 = [v5 valueForKey:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)removeAllObjects
{
  uint64_t v3 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__JFXThreadSafeDictionary_removeAllObjects__block_invoke;
  block[3] = &unk_264C09FA8;
  block[4] = self;
  dispatch_barrier_sync(v3, block);
}

void __43__JFXThreadSafeDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) dict];
  [v1 removeAllObjects];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__JFXThreadSafeDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __46__JFXThreadSafeDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeObjectsForKeys:(id)a3
{
  id v4 = a3;
  id v5 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __48__JFXThreadSafeDictionary_removeObjectsForKeys___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __48__JFXThreadSafeDictionary_removeObjectsForKeys___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  [v2 removeObjectsForKeys:*(void *)(a1 + 40)];
}

- (void)setDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [(JFXThreadSafeDictionary *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__JFXThreadSafeDictionary_setDictionary___block_invoke;
  v7[3] = &unk_264C09F10;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __41__JFXThreadSafeDictionary_setDictionary___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) dict];
  [v2 setDictionary:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)dict
{
  return self->_dict;
}

- (void)setDict:(id)a3
{
}

- (OS_dispatch_queue)concurrentQueue
{
  return self->_concurrentQueue;
}

- (void)setConcurrentQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_concurrentQueue, 0);
  objc_storeStrong((id *)&self->_dict, 0);
}

@end