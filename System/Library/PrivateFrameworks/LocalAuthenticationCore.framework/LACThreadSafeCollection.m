@interface LACThreadSafeCollection
+ (id)strongObjectsCollection;
+ (id)weakObjectsCollection;
- (LACThreadSafeCollection)initWithWeakObjects:(BOOL)a3;
- (int64_t)count;
- (void)_synchronizedObjects:(id)a3;
- (void)append:(id)a3;
- (void)forEach:(id)a3;
- (void)remove:(id)a3;
@end

@implementation LACThreadSafeCollection

+ (id)weakObjectsCollection
{
  v2 = [[LACThreadSafeCollection alloc] initWithWeakObjects:1];
  return v2;
}

+ (id)strongObjectsCollection
{
  v2 = [[LACThreadSafeCollection alloc] initWithWeakObjects:0];
  return v2;
}

- (LACThreadSafeCollection)initWithWeakObjects:(BOOL)a3
{
  v9.receiver = self;
  v9.super_class = (Class)LACThreadSafeCollection;
  v4 = [(LACThreadSafeCollection *)&v9 init];
  v5 = v4;
  if (v4)
  {
    v4->_weakObjects = a3;
    if (a3)
    {
      v6 = [MEMORY[0x263F088B0] weakObjectsHashTable];
    }
    else
    {
      v6 = (NSHashTable *)objc_alloc_init(MEMORY[0x263F088B0]);
    }
    objects = v5->_objects;
    v5->_objects = v6;

    v5->_objectsLock._os_unfair_lock_opaque = 0;
  }
  return v5;
}

- (void)append:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__LACThreadSafeCollection_append___block_invoke;
  v6[3] = &unk_2653B6960;
  id v7 = v4;
  id v5 = v4;
  [(LACThreadSafeCollection *)self _synchronizedObjects:v6];
}

uint64_t __34__LACThreadSafeCollection_append___block_invoke(uint64_t a1, void *a2)
{
  return [a2 addObject:*(void *)(a1 + 32)];
}

- (void)remove:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __34__LACThreadSafeCollection_remove___block_invoke;
  v6[3] = &unk_2653B6960;
  id v7 = v4;
  id v5 = v4;
  [(LACThreadSafeCollection *)self _synchronizedObjects:v6];
}

uint64_t __34__LACThreadSafeCollection_remove___block_invoke(uint64_t a1, void *a2)
{
  return [a2 removeObject:*(void *)(a1 + 32)];
}

- (int64_t)count
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __32__LACThreadSafeCollection_count__block_invoke;
  v4[3] = &unk_2653B6AC8;
  v4[4] = self;
  v4[5] = &v5;
  [(LACThreadSafeCollection *)self _synchronizedObjects:v4];
  int64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __32__LACThreadSafeCollection_count__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(*(void *)(a1 + 32) + 20))
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v10;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v10 != v7) {
            objc_enumerationMutation(v4);
          }
          if (*(void *)(*((void *)&v9 + 1) + 8 * i)) {
            ++*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v6);
    }
  }
  else
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 count];
  }
}

- (void)forEach:(id)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  uint64_t v14 = 0;
  v15 = &v14;
  uint64_t v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__4;
  v18 = __Block_byref_object_dispose__4;
  id v19 = 0;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __35__LACThreadSafeCollection_forEach___block_invoke;
  v13[3] = &unk_2653B68E8;
  v13[4] = &v14;
  [(LACThreadSafeCollection *)self _synchronizedObjects:v13];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v5 = (id)v15[5];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(v5);
        }
        v4[2](v4, *(void *)(*((void *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v9 objects:v20 count:16];
    }
    while (v6);
  }

  _Block_object_dispose(&v14, 8);
}

uint64_t __35__LACThreadSafeCollection_forEach___block_invoke(uint64_t a1, void *a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [a2 copy];
  return MEMORY[0x270F9A758]();
}

- (void)_synchronizedObjects:(id)a3
{
  p_objectsLock = &self->_objectsLock;
  id v5 = (void (**)(id, NSHashTable *))a3;
  os_unfair_lock_lock(p_objectsLock);
  v5[2](v5, self->_objects);

  os_unfair_lock_unlock(p_objectsLock);
}

- (void).cxx_destruct
{
}

@end