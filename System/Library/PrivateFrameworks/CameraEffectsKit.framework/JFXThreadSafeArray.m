@interface JFXThreadSafeArray
- (BOOL)containsObject:(id)a3;
- (JFXThreadSafeArray)init;
- (NSMutableArray)array;
- (OS_dispatch_queue)concurrentQueue;
- (id)copyOfArray;
- (id)description;
- (id)objectAtIndex:(unint64_t)a3;
- (id)objectsAtIndexes:(id)a3;
- (id)sortedArrayUsingComparator:(id)a3;
- (unint64_t)count;
- (unint64_t)indexOfObject:(id)a3;
- (void)addObject:(id)a3;
- (void)enumerateObjectsUsingBlock:(id)a3;
- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4;
- (void)removeAllObjects;
- (void)removeObject:(id)a3;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)removeObjectsInArray:(id)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setArray:(id)a3;
- (void)setConcurrentQueue:(id)a3;
- (void)sortUsingSelector:(SEL)a3;
@end

@implementation JFXThreadSafeArray

- (JFXThreadSafeArray)init
{
  v6.receiver = self;
  v6.super_class = (Class)JFXThreadSafeArray;
  v2 = [(JFXThreadSafeArray *)&v6 init];
  if (v2)
  {
    id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
    [(JFXThreadSafeArray *)v2 setArray:v3];

    dispatch_queue_t v4 = dispatch_queue_create("com.apple.threadsafearrayconcurrentqueuelabel", MEMORY[0x263EF83A8]);
    [(JFXThreadSafeArray *)v2 setConcurrentQueue:v4];
  }
  return v2;
}

- (id)description
{
  v2 = NSString;
  id v3 = [(JFXThreadSafeArray *)self array];
  dispatch_queue_t v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(JFXThreadSafeArray *)self concurrentQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __32__JFXThreadSafeArray_addObject___block_invoke;
    v6[3] = &unk_264C09F10;
    v6[4] = self;
    id v7 = v4;
    dispatch_barrier_sync(v5, v6);
  }
}

void __32__JFXThreadSafeArray_addObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__11;
  v13 = __Block_byref_object_dispose__11;
  id v14 = 0;
  v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__JFXThreadSafeArray_objectAtIndex___block_invoke;
  block[3] = &unk_264C0B678;
  block[5] = &v9;
  block[6] = a3;
  block[4] = self;
  dispatch_sync(v5, block);

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __36__JFXThreadSafeArray_objectAtIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  unint64_t v3 = [v2 count];
  unint64_t v4 = *(void *)(a1 + 48);

  if (v3 > v4)
  {
    id v8 = [*(id *)(a1 + 32) array];
    uint64_t v5 = [v8 objectAtIndex:*(void *)(a1 + 48)];
    uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;
  }
}

- (unint64_t)indexOfObject:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__JFXThreadSafeArray_indexOfObject___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  unint64_t v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

void __36__JFXThreadSafeArray_indexOfObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 indexOfObject:*(void *)(a1 + 40)];
}

- (id)objectsAtIndexes:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  uint64_t v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__JFXThreadSafeArray_objectsAtIndexes___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v10 = v4;
  uint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __39__JFXThreadSafeArray_objectsAtIndexes___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) array];
  uint64_t v2 = [v5 objectsAtIndexes:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)moveObjectAtIndex:(unint64_t)a3 toIndex:(unint64_t)a4
{
  -[JFXThreadSafeArray objectAtIndex:](self, "objectAtIndex:");
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  if (a4 <= a3)
  {
    [(JFXThreadSafeArray *)self insertObject:v7 atIndex:a4];
    [(JFXThreadSafeArray *)self removeObjectAtIndex:a3 + 1];
  }
  else
  {
    [(JFXThreadSafeArray *)self removeObjectAtIndex:a3];
    [(JFXThreadSafeArray *)self insertObject:v7 atIndex:a4];
  }
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __43__JFXThreadSafeArray_insertObject_atIndex___block_invoke;
  block[3] = &unk_264C0A6E0;
  id v10 = v6;
  uint64_t v11 = self;
  unint64_t v12 = a4;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);
}

void __43__JFXThreadSafeArray_insertObject_atIndex___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    id v2 = [*(id *)(a1 + 40) array];
    [v2 insertObject:*(void *)(a1 + 32) atIndex:*(void *)(a1 + 48)];
  }
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __42__JFXThreadSafeArray_removeObjectAtIndex___block_invoke;
  v6[3] = &unk_264C0A3A0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_barrier_sync(v5, v6);
}

void __42__JFXThreadSafeArray_removeObjectAtIndex___block_invoke(uint64_t a1)
{
  unint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = [*(id *)(a1 + 32) array];
  unint64_t v4 = [v3 count];

  if (v2 < v4)
  {
    id v5 = [*(id *)(a1 + 32) array];
    [v5 removeObjectAtIndex:*(void *)(a1 + 40)];
  }
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  id v7 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __54__JFXThreadSafeArray_replaceObjectAtIndex_withObject___block_invoke;
  block[3] = &unk_264C0A6E0;
  uint64_t v11 = self;
  unint64_t v12 = a3;
  id v10 = v6;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);
}

void __54__JFXThreadSafeArray_replaceObjectAtIndex_withObject___block_invoke(uint64_t a1)
{
  if (*(void *)(a1 + 32))
  {
    unint64_t v2 = *(void *)(a1 + 48);
    uint64_t v3 = [*(id *)(a1 + 40) array];
    unint64_t v4 = [v3 count];

    if (v2 < v4)
    {
      id v5 = [*(id *)(a1 + 40) array];
      [v5 replaceObjectAtIndex:*(void *)(a1 + 48) withObject:*(void *)(a1 + 32)];
    }
  }
}

- (BOOL)containsObject:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  unint64_t v12 = &v11;
  uint64_t v13 = 0x2020000000;
  char v14 = 0;
  id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __37__JFXThreadSafeArray_containsObject___block_invoke;
  block[3] = &unk_264C0A4B8;
  id v9 = v4;
  id v10 = &v11;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  LOBYTE(v4) = *((unsigned char *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return (char)v4;
}

void __37__JFXThreadSafeArray_containsObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v2 containsObject:*(void *)(a1 + 40)];
}

- (void)removeObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __35__JFXThreadSafeArray_removeObject___block_invoke;
    v6[3] = &unk_264C09F10;
    v6[4] = self;
    id v7 = v4;
    dispatch_barrier_sync(v5, v6);
  }
}

void __35__JFXThreadSafeArray_removeObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  [v2 removeObject:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  uint64_t v3 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __38__JFXThreadSafeArray_removeAllObjects__block_invoke;
  block[3] = &unk_264C09FA8;
  void block[4] = self;
  dispatch_barrier_sync(v3, block);
}

void __38__JFXThreadSafeArray_removeAllObjects__block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) array];
  [v1 removeAllObjects];
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  uint64_t v3 = [(JFXThreadSafeArray *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __27__JFXThreadSafeArray_count__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __27__JFXThreadSafeArray_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (void)sortUsingSelector:(SEL)a3
{
  id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __40__JFXThreadSafeArray_sortUsingSelector___block_invoke;
  v6[3] = &unk_264C0A3A0;
  v6[4] = self;
  void v6[5] = a3;
  dispatch_sync(v5, v6);
}

void __40__JFXThreadSafeArray_sortUsingSelector___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  [v2 sortUsingSelector:*(void *)(a1 + 40)];
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__JFXThreadSafeArray_enumerateObjectsUsingBlock___block_invoke;
  v7[3] = &unk_264C0A3C8;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_barrier_sync(v5, v7);
}

void __49__JFXThreadSafeArray_enumerateObjectsUsingBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  [v2 enumerateObjectsUsingBlock:*(void *)(a1 + 40)];
}

- (void)enumerateObjectsWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __61__JFXThreadSafeArray_enumerateObjectsWithOptions_usingBlock___block_invoke;
  block[3] = &unk_264C0B6A0;
  id v10 = v6;
  unint64_t v11 = a3;
  void block[4] = self;
  id v8 = v6;
  dispatch_barrier_sync(v7, block);
}

void __61__JFXThreadSafeArray_enumerateObjectsWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  [v2 enumerateObjectsWithOptions:*(void *)(a1 + 48) usingBlock:*(void *)(a1 + 40)];
}

- (void)removeObjectsInArray:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __43__JFXThreadSafeArray_removeObjectsInArray___block_invoke;
    v6[3] = &unk_264C09F10;
    v6[4] = self;
    id v7 = v4;
    dispatch_barrier_sync(v5, v6);
  }
}

void __43__JFXThreadSafeArray_removeObjectsInArray___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) array];
  [v2 removeObjectsInArray:*(void *)(a1 + 40)];
}

- (id)copyOfArray
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__11;
  unint64_t v11 = __Block_byref_object_dispose__11;
  id v12 = 0;
  uint64_t v3 = [(JFXThreadSafeArray *)self concurrentQueue];
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __33__JFXThreadSafeArray_copyOfArray__block_invoke;
  v6[3] = &unk_264C09EE8;
  v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(v3, v6);

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __33__JFXThreadSafeArray_copyOfArray__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) array];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)sortedArrayUsingComparator:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  uint64_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = __Block_byref_object_copy__11;
  v16 = __Block_byref_object_dispose__11;
  id v17 = 0;
  id v5 = [(JFXThreadSafeArray *)self concurrentQueue];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__JFXThreadSafeArray_sortedArrayUsingComparator___block_invoke;
  block[3] = &unk_264C0B6C8;
  id v10 = v4;
  unint64_t v11 = &v12;
  void block[4] = self;
  id v6 = v4;
  dispatch_sync(v5, block);

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__JFXThreadSafeArray_sortedArrayUsingComparator___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) array];
  uint64_t v2 = [v5 sortedArrayUsingComparator:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableArray)array
{
  return self->_array;
}

- (void)setArray:(id)a3
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
  objc_storeStrong((id *)&self->_array, 0);
}

@end