@interface FMConcurrentMutableDictionary
- (FMConcurrentMutableDictionary)init;
- (FMConcurrentMutableDictionary)initWithDictionary:(id)a3;
- (FMReadWriteLock)lock;
- (NSMutableDictionary)underlyingDictionary;
- (id)nativeDictionary;
- (id)objectForKey:(id)a3;
- (id)objectForKey:(id)a3 withConstructor:(id)a4;
- (id)popObjectforKey:(id)a3;
- (id)replaceObject:(id)a3 forKey:(id)a4;
- (unint64_t)count;
- (void)removeAllObjects;
- (void)removeObjectForKey:(id)a3;
- (void)setLock:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4;
- (void)setUnderlyingDictionary:(id)a3;
@end

@implementation FMConcurrentMutableDictionary

- (FMConcurrentMutableDictionary)init
{
  return [(FMConcurrentMutableDictionary *)self initWithDictionary:MEMORY[0x1E4F1CC08]];
}

- (FMConcurrentMutableDictionary)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)FMConcurrentMutableDictionary;
  v5 = [(FMConcurrentMutableDictionary *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 mutableCopy];
    underlyingDictionary = v5->_underlyingDictionary;
    v5->_underlyingDictionary = (NSMutableDictionary *)v6;

    v8 = [[FMReadWriteLock alloc] initWithLockName:@"FMConcurrentMutableDictionary"];
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
  v3 = [(FMConcurrentMutableDictionary *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__FMConcurrentMutableDictionary_count__block_invoke;
  v6[3] = &unk_1E60192D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithReadLock:v6];

  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __38__FMConcurrentMutableDictionary_count__block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingDictionary];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v2 count];
}

- (id)objectForKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  v13 = &v12;
  uint64_t v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  v5 = [(FMConcurrentMutableDictionary *)self lock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __46__FMConcurrentMutableDictionary_objectForKey___block_invoke;
  v9[3] = &unk_1E60193A0;
  objc_super v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performWithReadLock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __46__FMConcurrentMutableDictionary_objectForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) underlyingDictionary];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [(FMConcurrentMutableDictionary *)self lock];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__FMConcurrentMutableDictionary_setObject_forKey___block_invoke;
  v11[3] = &unk_1E60193C8;
  v11[4] = self;
  id v12 = v7;
  id v13 = v6;
  id v9 = v6;
  id v10 = v7;
  [v8 performWithWriteLock:v11];
}

void __50__FMConcurrentMutableDictionary_setObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  id v3 = [*(id *)(a1 + 32) underlyingDictionary];
  [v3 setObject:v2 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (void)removeObjectForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(FMConcurrentMutableDictionary *)self lock];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__FMConcurrentMutableDictionary_removeObjectForKey___block_invoke;
  v7[3] = &unk_1E6019328;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [v5 performWithWriteLock:v7];
}

void __52__FMConcurrentMutableDictionary_removeObjectForKey___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) underlyingDictionary];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)removeAllObjects
{
  id v3 = [(FMConcurrentMutableDictionary *)self lock];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__FMConcurrentMutableDictionary_removeAllObjects__block_invoke;
  v4[3] = &unk_1E60193F0;
  v4[4] = self;
  [v3 performWithWriteLock:v4];
}

void __49__FMConcurrentMutableDictionary_removeAllObjects__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = objc_msgSend(*(id *)(a1 + 32), "underlyingDictionary", 0);
  id v3 = [v2 allKeys];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [*(id *)(a1 + 32) underlyingDictionary];
        [v9 removeObjectForKey:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }
}

- (id)nativeDictionary
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  long long v10 = __Block_byref_object_copy__0;
  long long v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  id v3 = [(FMConcurrentMutableDictionary *)self lock];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__FMConcurrentMutableDictionary_nativeDictionary__block_invoke;
  v6[3] = &unk_1E60192D8;
  v6[4] = self;
  v6[5] = &v7;
  [v3 performWithReadLock:v6];

  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __49__FMConcurrentMutableDictionary_nativeDictionary__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) underlyingDictionary];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)objectForKey:(id)a3 withConstructor:(id)a4
{
  id v6 = a3;
  uint64_t v7 = (void (**)(void))a4;
  uint64_t v22 = 0;
  v23 = &v22;
  uint64_t v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  id v27 = 0;
  uint64_t v8 = [(FMConcurrentMutableDictionary *)self lock];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke;
  v19[3] = &unk_1E60193A0;
  v21 = &v22;
  v19[4] = self;
  id v9 = v6;
  id v20 = v9;
  [v8 performWithReadLock:v19];

  long long v10 = (void *)v23[5];
  if (!v10)
  {
    uint64_t v11 = v7[2](v7);
    id v12 = (void *)v23[5];
    v23[5] = v11;

    if (!v23[5]) {
      [MEMORY[0x1E4F1CA00] raise:@"Invalid State", @"objectSource returned a nil value for key %@", v9 format];
    }
    long long v13 = [(FMConcurrentMutableDictionary *)self lock];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke_2;
    v16[3] = &unk_1E6019418;
    v16[4] = self;
    id v17 = v9;
    v18 = &v22;
    [v13 performWithWriteLock:v16];

    long long v10 = (void *)v23[5];
  }
  id v14 = v10;

  _Block_object_dispose(&v22, 8);
  return v14;
}

void __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) underlyingDictionary];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

void __62__FMConcurrentMutableDictionary_objectForKey_withConstructor___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) underlyingDictionary];
  id v7 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  if (v7)
  {
    id v4 = v7;
    id v5 = *(void **)(v3 + 40);
    *(void *)(v3 + 40) = v4;
  }
  else
  {
    uint64_t v6 = *(void *)(v3 + 40);
    id v5 = [*(id *)(a1 + 32) underlyingDictionary];
    [v5 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
  }
}

- (id)replaceObject:(id)a3 forKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x3032000000;
  id v20 = __Block_byref_object_copy__0;
  v21 = __Block_byref_object_dispose__0;
  id v22 = 0;
  uint64_t v8 = [(FMConcurrentMutableDictionary *)self lock];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __54__FMConcurrentMutableDictionary_replaceObject_forKey___block_invoke;
  v13[3] = &unk_1E6019440;
  v16 = &v17;
  v13[4] = self;
  id v9 = v7;
  id v14 = v9;
  id v10 = v6;
  id v15 = v10;
  [v8 performWithWriteLock:v13];

  id v11 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v11;
}

void __54__FMConcurrentMutableDictionary_replaceObject_forKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) underlyingDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 56) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  uint64_t v6 = *(void *)(a1 + 48);
  id v7 = [*(id *)(a1 + 32) underlyingDictionary];
  [v7 setObject:v6 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (id)popObjectforKey:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = __Block_byref_object_copy__0;
  v16 = __Block_byref_object_dispose__0;
  id v17 = 0;
  id v5 = [(FMConcurrentMutableDictionary *)self lock];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __49__FMConcurrentMutableDictionary_popObjectforKey___block_invoke;
  v9[3] = &unk_1E60193A0;
  id v11 = &v12;
  v9[4] = self;
  id v6 = v4;
  id v10 = v6;
  [v5 performWithWriteLock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

void __49__FMConcurrentMutableDictionary_popObjectforKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) underlyingDictionary];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
  id v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  id v6 = [*(id *)(a1 + 32) underlyingDictionary];
  [v6 removeObjectForKey:*(void *)(a1 + 40)];
}

- (NSMutableDictionary)underlyingDictionary
{
  return self->_underlyingDictionary;
}

- (void)setUnderlyingDictionary:(id)a3
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
  objc_storeStrong((id *)&self->_underlyingDictionary, 0);
}

@end