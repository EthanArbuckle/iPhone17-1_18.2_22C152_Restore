@interface GLKShadingHash
- (GLKShadingHash)init;
- (id)compiledFshForKey:(id)a3;
- (id)compiledVshForKey:(id)a3;
- (void)dealloc;
- (void)purgeAllShaders;
- (void)setCompiledFsh:(id)a3 forKey:(id)a4;
- (void)setCompiledVsh:(id)a3 forKey:(id)a4;
@end

@implementation GLKShadingHash

- (GLKShadingHash)init
{
  v4.receiver = self;
  v4.super_class = (Class)GLKShadingHash;
  v2 = [(GLKShadingHash *)&v4 init];
  if (v2)
  {
    v2->_vshQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GLKShadingHashVsh", 0);
    v2->_fshQueue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.GLKShadingHashFsh", 0);
    v2->_compiledVshs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    v2->_compiledFshs = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
  }
  return v2;
}

- (void)purgeAllShaders
{
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __33__GLKShadingHash_purgeAllShaders__block_invoke;
  block[3] = &unk_26433A220;
  block[4] = self;
  dispatch_sync(vshQueue, block);
  fshQueue = self->_fshQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __33__GLKShadingHash_purgeAllShaders__block_invoke_2;
  v5[3] = &unk_26433A220;
  v5[4] = self;
  dispatch_sync(fshQueue, v5);
}

uint64_t __33__GLKShadingHash_purgeAllShaders__block_invoke(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) objectEnumerator];
  for (i = v2; ; v2 = i)
  {
    objc_super v4 = (void *)[v2 nextObject];
    if (!v4) {
      break;
    }
    glDeleteShader([v4 intValue]);
  }
  v5 = *(void **)(*(void *)(a1 + 32) + 24);

  return [v5 removeAllObjects];
}

uint64_t __33__GLKShadingHash_purgeAllShaders__block_invoke_2(uint64_t a1)
{
  v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 32) objectEnumerator];
  for (i = v2; ; v2 = i)
  {
    objc_super v4 = (void *)[v2 nextObject];
    if (!v4) {
      break;
    }
    glDeleteShader([v4 intValue]);
  }
  v5 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v5 removeAllObjects];
}

- (void)setCompiledVsh:(id)a3 forKey:(id)a4
{
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__GLKShadingHash_setCompiledVsh_forKey___block_invoke;
  block[3] = &unk_26433A248;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(vshQueue, block);
}

uint64_t __40__GLKShadingHash_setCompiledVsh_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 24) setObject:a1[5] forKey:a1[6]];
}

- (id)compiledVshForKey:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  uint64_t v12 = 0;
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__GLKShadingHash_compiledVshForKey___block_invoke;
  block[3] = &unk_264339EF0;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(vshQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__GLKShadingHash_compiledVshForKey___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 24) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)setCompiledFsh:(id)a3 forKey:(id)a4
{
  fshQueue = self->_fshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __40__GLKShadingHash_setCompiledFsh_forKey___block_invoke;
  block[3] = &unk_26433A248;
  block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(fshQueue, block);
}

uint64_t __40__GLKShadingHash_setCompiledFsh_forKey___block_invoke(void *a1)
{
  return [*(id *)(a1[4] + 32) setObject:a1[5] forKey:a1[6]];
}

- (id)compiledFshForKey:(id)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = __Block_byref_object_copy__0;
  v11 = __Block_byref_object_dispose__0;
  uint64_t v12 = 0;
  fshQueue = self->_fshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __36__GLKShadingHash_compiledFshForKey___block_invoke;
  block[3] = &unk_264339EF0;
  void block[5] = a3;
  block[6] = &v7;
  block[4] = self;
  dispatch_sync(fshQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

id __36__GLKShadingHash_compiledFshForKey___block_invoke(void *a1)
{
  id result = (id)[*(id *)(a1[4] + 32) objectForKey:a1[5]];
  *(void *)(*(void *)(a1[6] + 8) + 40) = result;
  return result;
}

- (void)dealloc
{
  vshQueue = self->_vshQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __25__GLKShadingHash_dealloc__block_invoke;
  block[3] = &unk_26433A220;
  block[4] = self;
  dispatch_sync(vshQueue, block);
  dispatch_release((dispatch_object_t)self->_vshQueue);
  fshQueue = self->_fshQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __25__GLKShadingHash_dealloc__block_invoke_2;
  v6[3] = &unk_26433A220;
  v6[4] = self;
  dispatch_sync(fshQueue, v6);
  dispatch_release((dispatch_object_t)self->_fshQueue);
  v5.receiver = self;
  v5.super_class = (Class)GLKShadingHash;
  [(GLKShadingHash *)&v5 dealloc];
}

void __25__GLKShadingHash_dealloc__block_invoke(uint64_t a1)
{
}

void __25__GLKShadingHash_dealloc__block_invoke_2(uint64_t a1)
{
}

@end