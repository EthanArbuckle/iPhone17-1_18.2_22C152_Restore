@interface FMConcurrentMutableArray
- (FMConcurrentMutableArray)init;
- (FMConcurrentMutableArray)initWithArray:(id)a3;
- (FMReadWriteLock)lock;
- (NSMutableArray)underlyingArray;
- (id)nativeArray;
- (id)objectAtIndex:(unint64_t)a3;
- (unint64_t)count;
- (void)addObject:(id)a3;
- (void)insertObject:(id)a3 atIndex:(unint64_t)a4;
- (void)removeObjectAtIndex:(unint64_t)a3;
- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4;
- (void)setLock:(id)a3;
- (void)setUnderlyingArray:(id)a3;
@end

@implementation FMConcurrentMutableArray

- (FMConcurrentMutableArray)init
{
  return [(FMConcurrentMutableArray *)self initWithArray:MEMORY[0x1E4F1CBF0]];
}

- (FMConcurrentMutableArray)initWithArray:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMConcurrentMutableArray;
  v5 = [(FMConcurrentMutableArray *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    underlyingArray = v5->_underlyingArray;
    v5->_underlyingArray = (NSMutableArray *)v6;

    v8 = [[FMReadWriteLock alloc] initWithLockName:@"FMConcurrentMutableArray"];
    lock = v5->_lock;
    v5->_lock = v8;
  }
  return v5;
}

- (unint64_t)count
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  v3 = [(FMConcurrentMutableArray *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__FMConcurrentMutableArray_count__block_invoke;
  v6[3] = &unk_1E60192D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithReadLock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __33__FMConcurrentMutableArray_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingArray];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)objectAtIndex:(unint64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  id v14 = 0;
  v5 = [(FMConcurrentMutableArray *)self lock];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__FMConcurrentMutableArray_objectAtIndex___block_invoke;
  v8[3] = &unk_1E6019300;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  [v5 performWithReadLock:v8];

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __42__FMConcurrentMutableArray_objectAtIndex___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) underlyingArray];
  uint64_t v2 = [v5 objectAtIndexedSubscript:*(void *)(a1 + 48)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  unint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)addObject:(id)a3
{
  id v4 = a3;
  id v5 = [(FMConcurrentMutableArray *)self lock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__FMConcurrentMutableArray_addObject___block_invoke;
  v7[3] = &unk_1E6019328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithWriteLock:v7];
}

void __38__FMConcurrentMutableArray_addObject___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingArray];
  [v2 addObject:*(void *)(a1 + 40)];
}

- (void)insertObject:(id)a3 atIndex:(unint64_t)a4
{
  id v6 = a3;
  uint64_t v7 = [(FMConcurrentMutableArray *)self lock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__FMConcurrentMutableArray_insertObject_atIndex___block_invoke;
  v9[3] = &unk_1E6019350;
  v9[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  [v7 performWithWriteLock:v9];
}

void __49__FMConcurrentMutableArray_insertObject_atIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingArray];
  [v2 insertObject:*(void *)(a1 + 40) atIndex:*(void *)(a1 + 48)];
}

- (void)removeObjectAtIndex:(unint64_t)a3
{
  id v5 = [(FMConcurrentMutableArray *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__FMConcurrentMutableArray_removeObjectAtIndex___block_invoke;
  v6[3] = &unk_1E6019378;
  v6[4] = self;
  v6[5] = a3;
  [v5 performWithWriteLock:v6];
}

void __48__FMConcurrentMutableArray_removeObjectAtIndex___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingArray];
  [v2 removeObjectAtIndex:*(void *)(a1 + 40)];
}

- (void)replaceObjectAtIndex:(unint64_t)a3 withObject:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [(FMConcurrentMutableArray *)self lock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __60__FMConcurrentMutableArray_replaceObjectAtIndex_withObject___block_invoke;
  v9[3] = &unk_1E6019350;
  id v10 = v6;
  unint64_t v11 = a3;
  v9[4] = self;
  id v8 = v6;
  [v7 performWithWriteLock:v9];
}

void __60__FMConcurrentMutableArray_replaceObjectAtIndex_withObject___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [*(id *)(a1 + 32) underlyingArray];
  [v3 setObject:v2 atIndexedSubscript:*(void *)(a1 + 48)];
}

- (id)nativeArray
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy_;
  unint64_t v11 = __Block_byref_object_dispose_;
  id v12 = 0;
  id v3 = [(FMConcurrentMutableArray *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__FMConcurrentMutableArray_nativeArray__block_invoke;
  v6[3] = &unk_1E60192D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithReadLock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __39__FMConcurrentMutableArray_nativeArray__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) underlyingArray];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (NSMutableArray)underlyingArray
{
  return self->_underlyingArray;
}

- (void)setUnderlyingArray:(id)a3
{
}

- (FMReadWriteLock)lock
{
  return self->_lock;
}

- (void)setLock:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_underlyingArray, 0);
}

@end