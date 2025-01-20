@interface BMAccessAssertionCache
+ (id)sharedCache;
- (BMAccessAssertionCache)init;
- (id)_makeAssertionWithDescriptor:(id)a3 extensionToken:(id)a4 container:(id)a5 path:(id)a6;
- (id)assertionForAccessDescriptor:(id)a3;
- (id)createAssertionForAccessDescriptor:(id)a3 extensionToken:(id)a4 container:(id)a5 path:(id)a6;
- (void)_invalidateCacheIfPersonaSwitched:(id)a3;
@end

@implementation BMAccessAssertionCache

- (id)_makeAssertionWithDescriptor:(id)a3 extensionToken:(id)a4 container:(id)a5 path:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  v13 = [[_BMAccessAssertion alloc] initWithDescriptor:v12 extensionToken:v11 container:v10 path:v9];

  return v13;
}

void __91__BMAccessAssertionCache_createAssertionForAccessDescriptor_extensionToken_container_path___block_invoke(uint64_t a1, void *a2)
{
  id v12 = a2;
  [*(id *)(a1 + 32) _invalidateCacheIfPersonaSwitched:v12];
  uint64_t v3 = [v12 objectForKey:*(void *)(a1 + 40)];
  uint64_t v4 = *(void *)(*(void *)(a1 + 72) + 8);
  v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40))
  {
    uint64_t v6 = [*(id *)(a1 + 32) _makeAssertionWithDescriptor:*(void *)(a1 + 40) extensionToken:*(void *)(a1 + 48) container:*(void *)(a1 + 56) path:*(void *)(a1 + 64)];
    uint64_t v7 = *(void *)(*(void *)(a1 + 72) + 8);
    v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;

    uint64_t v9 = *(void *)(*(void *)(a1 + 72) + 8);
    uint64_t v10 = *(void *)(v9 + 40);
    if (v10)
    {
      id v11 = [*(id *)(v9 + 40) descriptor];
      [v12 setObject:v10 forKey:v11];
    }
  }
}

void __55__BMAccessAssertionCache_assertionForAccessDescriptor___block_invoke(void *a1, void *a2)
{
  uint64_t v3 = (void *)a1[4];
  id v4 = a2;
  [v3 _invalidateCacheIfPersonaSwitched:v4];
  uint64_t v5 = [v4 objectForKey:a1[5]];

  uint64_t v6 = *(void *)(a1[6] + 8);
  uint64_t v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;
}

- (id)assertionForAccessDescriptor:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1B3EB5880]();
  uint64_t v13 = 0;
  v14 = &v13;
  uint64_t v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__0;
  v17 = __Block_byref_object_dispose__0;
  id v18 = 0;
  lock = self->_lock;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __55__BMAccessAssertionCache_assertionForAccessDescriptor___block_invoke;
  v10[3] = &unk_1E6022F80;
  v10[4] = self;
  id v12 = &v13;
  id v7 = v4;
  id v11 = v7;
  [(_PASLock *)lock runWithLockAcquired:v10];
  id v8 = (id)v14[5];

  _Block_object_dispose(&v13, 8);

  return v8;
}

- (void)_invalidateCacheIfPersonaSwitched:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = +[BMPersonaUtilities currentPersonaIdentifier];
  lastPersonaIdentifier = self->_lastPersonaIdentifier;
  p_lastPersonaIdentifier = (id *)&self->_lastPersonaIdentifier;
  uint64_t v6 = lastPersonaIdentifier;
  if ((unint64_t)lastPersonaIdentifier | v5 && ([v6 isEqual:v5] & 1) == 0)
  {
    uint64_t v9 = __biome_log_for_category(6);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = *p_lastPersonaIdentifier;
      int v11 = 138412546;
      id v12 = v10;
      __int16 v13 = 2112;
      uint64_t v14 = v5;
      _os_log_impl(&dword_1B30A0000, v9, OS_LOG_TYPE_DEFAULT, "Invalidating access assertion cache - persona switched from %@ to %@", (uint8_t *)&v11, 0x16u);
    }

    [v4 removeAllObjects];
    objc_storeStrong(p_lastPersonaIdentifier, (id)v5);
  }
}

+ (id)sharedCache
{
  if (sharedCache_onceToken != -1) {
    dispatch_once(&sharedCache_onceToken, &__block_literal_global_7);
  }
  v2 = (void *)sharedCache_cache;
  return v2;
}

- (id)createAssertionForAccessDescriptor:(id)a3 extensionToken:(id)a4 container:(id)a5 path:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v15 = (void *)MEMORY[0x1B3EB5880]();
  if (v11)
  {
    if (v12)
    {
      uint64_t v27 = 0;
      v28 = &v27;
      uint64_t v29 = 0x3032000000;
      v30 = __Block_byref_object_copy__0;
      v31 = __Block_byref_object_dispose__0;
      id v32 = 0;
      lock = self->_lock;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __91__BMAccessAssertionCache_createAssertionForAccessDescriptor_extensionToken_container_path___block_invoke;
      v21[3] = &unk_1E6022FA8;
      v21[4] = self;
      v26 = &v27;
      id v22 = v11;
      id v23 = v12;
      id v24 = v13;
      id v25 = v14;
      [(_PASLock *)lock runWithLockAcquired:v21];
      id v17 = (id)v28[5];

      _Block_object_dispose(&v27, 8);
      goto LABEL_4;
    }
    goto LABEL_8;
  }
  v19 = [MEMORY[0x1E4F28B00] currentHandler];
  [v19 handleFailureInMethod:a2, self, @"BMAccessAssertion.m", 184, @"Invalid parameter not satisfying: %@", @"descriptor" object file lineNumber description];

  if (!v12)
  {
LABEL_8:
    v20 = [MEMORY[0x1E4F28B00] currentHandler];
    [v20 handleFailureInMethod:a2, self, @"BMAccessAssertion.m", 185, @"Invalid parameter not satisfying: %@", @"extensionToken" object file lineNumber description];
  }
  id v17 = 0;
LABEL_4:

  return v17;
}

uint64_t __37__BMAccessAssertionCache_sharedCache__block_invoke()
{
  sharedCache_cache = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

- (BMAccessAssertionCache)init
{
  v10.receiver = self;
  v10.super_class = (Class)BMAccessAssertionCache;
  v2 = [(BMAccessAssertionCache *)&v10 init];
  if (v2)
  {
    id v3 = objc_alloc(MEMORY[0x1E4F93B70]);
    id v4 = [MEMORY[0x1E4F28E10] weakToWeakObjectsMapTable];
    uint64_t v5 = [v3 initWithGuardedData:v4];
    lock = v2->_lock;
    v2->_lock = (_PASLock *)v5;

    uint64_t v7 = +[BMPersonaUtilities currentPersonaIdentifier];
    lastPersonaIdentifier = v2->_lastPersonaIdentifier;
    v2->_lastPersonaIdentifier = (NSString *)v7;
  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lastPersonaIdentifier, 0);
  objc_storeStrong((id *)&self->_lock, 0);
}

@end