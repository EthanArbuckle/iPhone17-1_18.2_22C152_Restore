@interface MPMediaEntityCache
- (MPMediaEntityCache)initWithMediaLibraryDataProvider:(id)a3;
- (id)_entityWithIdentifier:(int64_t)a3 mediaEntityType:(int64_t)a4 collectionGroupingType:(int64_t)a5 loadEntityBlock:(id)a6;
- (id)collectionWithIdentifier:(int64_t)a3 grouping:(int64_t)a4 loadEntityBlock:(id)a5;
- (id)itemWithIdentifier:(int64_t)a3;
- (id)itemWithIdentifier:(int64_t)a3 loadEntityBlock:(id)a4;
- (void)_clearSomeGlobalEntityTemporaryReferences;
- (void)_entityMapForDataProviderEntityClass:(Class)a3;
- (void)_performWithExclusiveAccessForDataProviderEntityClass:(Class)a3 block:(id)a4;
- (void)_performWithSharedAccessForDataProviderEntityClass:(Class)a3 block:(id)a4;
- (void)removeEntityWithIdentifier:(int64_t)a3 dataProviderEntityClass:(Class)a4;
- (void)updatePropertyValuesInEntityWithIdentifier:(int64_t)a3 dataProviderEntityClass:(Class)a4 deleted:(BOOL)a5;
@end

@implementation MPMediaEntityCache

- (MPMediaEntityCache)initWithMediaLibraryDataProvider:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MPMediaEntityCache;
  v6 = [(MPMediaEntityCache *)&v12 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.MediaPlayer.MPMediaEntityCache/deallocLaterQueue", 0);
    deallocLaterQueue = v6->_deallocLaterQueue;
    v6->_deallocLaterQueue = (OS_dispatch_queue *)v7;

    v6->_rwlock.ourl_lock._os_unfair_lock_opaque = 0;
    v6->_rwlock.ourl_count = 0;
    objc_storeStrong((id *)&v6->_mediaLibraryDataProvider, a3);
    v6->_mediaLibraryDataProviderRespondsToSupportsEntityChangeTrackingMethod = objc_opt_respondsToSelector() & 1;
    v6->_concreteEntitiesByDataProviderEntityClass = CFDictionaryCreateMutable(0, 0, 0, 0);
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    entityTemporaryReferences = v6->_entityTemporaryReferences;
    v6->_entityTemporaryReferences = (NSMutableArray *)v9;
  }
  return v6;
}

- (void)removeEntityWithIdentifier:(int64_t)a3 dataProviderEntityClass:(Class)a4
{
  if (a4)
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __73__MPMediaEntityCache_removeEntityWithIdentifier_dataProviderEntityClass___block_invoke;
    v4[3] = &__block_descriptor_40_e9_v16__0_v8l;
    v4[4] = a3;
    [(MPMediaEntityCache *)self _performWithExclusiveAccessForDataProviderEntityClass:a4 block:v4];
  }
}

- (id)itemWithIdentifier:(int64_t)a3 loadEntityBlock:(id)a4
{
  v4 = [(MPMediaEntityCache *)self _entityWithIdentifier:a3 mediaEntityType:0 collectionGroupingType:0 loadEntityBlock:a4];

  return v4;
}

- (id)_entityWithIdentifier:(int64_t)a3 mediaEntityType:(int64_t)a4 collectionGroupingType:(int64_t)a5 loadEntityBlock:(id)a6
{
  v10 = (void (**)(id, MPConcreteMediaEntityPropertiesCache *))a6;
  if (self->_mediaLibraryDataProviderRespondsToSupportsEntityChangeTrackingMethod)
  {
    uint64_t v23 = 0;
    if ([(MPMediaLibraryDataProviderPrivate *)self->_mediaLibraryDataProvider supportsEntityChangeTrackingForMediaEntityType:a4 collectionGroupingType:a5 dataProviderClass:&v23])uint64_t v11 = v23; {
    else
    }
      uint64_t v11 = 0;
  }
  else
  {
    uint64_t v11 = 0;
  }
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__50539;
  v27 = __Block_byref_object_dispose__50540;
  id v28 = 0;
  if (v11)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke;
    v22[3] = &unk_1E57F8AD8;
    v22[4] = &v23;
    v22[5] = a3;
    [(MPMediaEntityCache *)self _performWithSharedAccessForDataProviderEntityClass:v11 block:v22];
    if (!v24[5])
    {
      objc_super v12 = [[MPConcreteMediaEntityPropertiesCache alloc] initWithLibraryDataProvider:self->_mediaLibraryDataProvider dataProviderEntityClass:v11 identifier:a3];
      uint64_t v13 = v10[2](v10, v12);
      v14 = (void *)v24[5];
      v24[5] = v13;

      if (([(id)v24[5] conformsToProtocol:&unk_1EE731808] & 1) == 0)
      {
        v19 = [MEMORY[0x1E4F28B00] currentHandler];
        v20 = [NSString stringWithUTF8String:"-[MPMediaEntityCache _entityWithIdentifier:mediaEntityType:collectionGroupingType:loadEntityBlock:]"];
        [v19 handleFailureInFunction:v20 file:@"MPMediaEntityCache.mm" lineNumber:126 description:@"Invalid entity"];
      }
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_2;
      v21[3] = &unk_1E57F8B40;
      v21[5] = &v23;
      v21[6] = a3;
      v21[4] = self;
      [(MPMediaEntityCache *)self _performWithExclusiveAccessForDataProviderEntityClass:v11 block:v21];
    }
  }
  else
  {
    uint64_t v15 = v10[2](v10, 0);
    v16 = (void *)v24[5];
    v24[5] = v15;
  }
  id v17 = (id)v24[5];
  _Block_object_dispose(&v23, 8);

  return v17;
}

- (void)_performWithExclusiveAccessForDataProviderEntityClass:(Class)a3 block:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  os_unfair_recursive_lock_lock_with_options();
  v6[2](v6, [(MPMediaEntityCache *)self _entityMapForDataProviderEntityClass:a3]);
  os_unfair_recursive_lock_unlock();
}

- (void)_performWithSharedAccessForDataProviderEntityClass:(Class)a3 block:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  os_unfair_recursive_lock_lock_with_options();
  v6[2](v6, [(MPMediaEntityCache *)self _entityMapForDataProviderEntityClass:a3]);
  os_unfair_recursive_lock_unlock();
}

- (void)_entityMapForDataProviderEntityClass:(Class)a3
{
  Value = (void *)CFDictionaryGetValue(self->_concreteEntitiesByDataProviderEntityClass, a3);
  if (!Value) {
    operator new();
  }
  return Value;
}

void __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = *(void **)(a2 + 8);
  if (!v3) {
    return;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = v3;
  while (1)
  {
    uint64_t v6 = v5[4];
    if (v4 >= v6) {
      break;
    }
LABEL_6:
    id v5 = (void *)*v5;
    if (!v5) {
      return;
    }
  }
  if (v6 < v4)
  {
    ++v5;
    goto LABEL_6;
  }
  dispatch_queue_t v7 = (id *)std::map<long,MPIdentifierSet * {__strong}>::at(v3, v4);
  id WeakRetained = objc_loadWeakRetained(v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = WeakRetained;
}

void __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_2(void *a1, uint64_t **a2)
{
  uint64_t v4 = *(void **)(*(void *)(a1[5] + 8) + 40);
  uint64_t v6 = a2 + 1;
  id v5 = (char *)a2[1];
  if (v5)
  {
    uint64_t v7 = a1[6];
    while (1)
    {
      while (1)
      {
        v8 = v5;
        uint64_t v9 = *((void *)v5 + 4);
        if (v7 >= v9) {
          break;
        }
        id v5 = *(char **)v8;
        uint64_t v6 = (uint64_t **)v8;
        if (!*(void *)v8) {
          goto LABEL_10;
        }
      }
      if (v9 >= v7) {
        break;
      }
      id v5 = (char *)*((void *)v8 + 1);
      if (!v5)
      {
        uint64_t v6 = (uint64_t **)(v8 + 8);
        goto LABEL_10;
      }
    }
  }
  else
  {
    v8 = (char *)(a2 + 1);
LABEL_10:
    v10 = v8;
    v8 = (char *)operator new(0x30uLL);
    *((void *)v8 + 4) = a1[6];
    *((void *)v8 + 5) = 0;
    *(void *)v8 = 0;
    *((void *)v8 + 1) = 0;
    *((void *)v8 + 2) = v10;
    MPMediaEntityCache *v6 = (uint64_t *)v8;
    uint64_t v11 = (uint64_t *)**a2;
    objc_super v12 = (uint64_t *)v8;
    if (v11)
    {
      *a2 = v11;
      objc_super v12 = *v6;
    }
    std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a2[1], v12);
    a2[2] = (uint64_t *)((char *)a2[2] + 1);
  }
  objc_storeWeak((id *)v8 + 5, v4);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_3;
  v14[3] = &unk_1E57F9F20;
  uint64_t v13 = *(NSObject **)(a1[4] + 32);
  long long v15 = *((_OWORD *)a1 + 2);
  dispatch_async(v13, v14);
}

- (id)collectionWithIdentifier:(int64_t)a3 grouping:(int64_t)a4 loadEntityBlock:(id)a5
{
  id v5 = [(MPMediaEntityCache *)self _entityWithIdentifier:a3 mediaEntityType:1 collectionGroupingType:a4 loadEntityBlock:a5];

  return v5;
}

void __73__MPMediaEntityCache_removeEntityWithIdentifier_dataProviderEntityClass___block_invoke(uint64_t a1, void **a2)
{
  v2 = (void **)a2[1];
  if (!v2) {
    return;
  }
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = a2 + 1;
  id v5 = a2[1];
  do
  {
    uint64_t v6 = v5[4];
    BOOL v7 = v6 < v3;
    if (v6 >= v3) {
      v8 = v5;
    }
    else {
      v8 = v5 + 1;
    }
    if (!v7) {
      uint64_t v4 = (void **)v5;
    }
    id v5 = (void *)*v8;
  }
  while (*v8);
  if (v4 == a2 + 1 || v3 < (uint64_t)v4[4]) {
    return;
  }
  uint64_t v9 = (void **)v4[1];
  if (v9)
  {
    do
    {
      v10 = v9;
      uint64_t v9 = (void **)*v9;
    }
    while (v9);
  }
  else
  {
    uint64_t v11 = v4;
    do
    {
      v10 = (void **)v11[2];
      BOOL v31 = *v10 == v11;
      uint64_t v11 = v10;
    }
    while (!v31);
  }
  if (*a2 == v4) {
    *a2 = v10;
  }
  a2[2] = (char *)a2[2] - 1;
  objc_super v12 = (void **)*v4;
  uint64_t v13 = v4;
  if (*v4)
  {
    v14 = (void **)v4[1];
    if (!v14)
    {
      uint64_t v13 = v4;
      goto LABEL_26;
    }
    do
    {
      uint64_t v13 = v14;
      v14 = (void **)*v14;
    }
    while (v14);
  }
  objc_super v12 = (void **)v13[1];
  if (v12)
  {
LABEL_26:
    int v15 = 0;
    v12[2] = v13[2];
    goto LABEL_27;
  }
  int v15 = 1;
LABEL_27:
  v16 = (void ***)v13[2];
  id v17 = *v16;
  if (*v16 == v13)
  {
    void *v16 = v12;
    if (v13 == v2)
    {
      id v17 = 0;
      v2 = v12;
    }
    else
    {
      id v17 = v16[1];
    }
  }
  else
  {
    v16[1] = v12;
  }
  int v18 = *((unsigned __int8 *)v13 + 24);
  if (v13 != v4)
  {
    v19 = v4[2];
    v13[2] = v19;
    *((void *)v19 + (*(void *)v4[2] != (void)v4)) = v13;
    v21 = *v4;
    v20 = v4[1];
    v21[2] = v13;
    *uint64_t v13 = v21;
    v13[1] = v20;
    if (v20) {
      v20[2] = v13;
    }
    *((unsigned char *)v13 + 24) = *((unsigned char *)v4 + 24);
    if (v2 == v4) {
      v2 = v13;
    }
  }
  if (!v18 || !v2) {
    goto LABEL_91;
  }
  if (!v15)
  {
    *((unsigned char *)v12 + 24) = 1;
    goto LABEL_91;
  }
  while (1)
  {
    v22 = (void **)v17[2];
    if (*v22 != v17) {
      break;
    }
    if (!*((unsigned char *)v17 + 24))
    {
      *((unsigned char *)v17 + 24) = 1;
      *((unsigned char *)v22 + 24) = 0;
      id v28 = v17[1];
      *v22 = v28;
      if (v28) {
        v28[2] = v22;
      }
      v17[2] = v22[2];
      *((void *)v22[2] + (*(void *)v22[2] != (void)v22)) = v17;
      v17[1] = v22;
      v22[2] = v17;
      if (v2 == v22) {
        v2 = v17;
      }
      id v17 = (void **)*v22;
    }
    v29 = *v17;
    if (*v17 && !v29[24]) {
      goto LABEL_86;
    }
    v30 = (void **)v17[1];
    if (v30 && !*((unsigned char *)v30 + 24))
    {
      if (v29 && !v29[24])
      {
LABEL_86:
        v30 = v17;
      }
      else
      {
        *((unsigned char *)v30 + 24) = 1;
        *((unsigned char *)v17 + 24) = 0;
        v36 = *v30;
        v17[1] = *v30;
        if (v36) {
          v36[2] = v17;
        }
        v30[2] = v17[2];
        *((void *)v17[2] + (*(void *)v17[2] != (void)v17)) = v30;
        *v30 = v17;
        v17[2] = v30;
        v29 = v17;
      }
      v33 = v30[2];
      *((unsigned char *)v30 + 24) = *((unsigned char *)v33 + 24);
      *((unsigned char *)v33 + 24) = 1;
      v29[24] = 1;
      v34 = *(uint64_t **)v33;
      uint64_t v37 = *(void *)(*(void *)v33 + 8);
      *(void *)v33 = v37;
      if (v37) {
        *(void *)(v37 + 16) = v33;
      }
      v34[2] = *((void *)v33 + 2);
      *(void *)(*((void *)v33 + 2) + 8 * (**((void **)v33 + 2) != (void)v33)) = v34;
      v34[1] = (uint64_t)v33;
      goto LABEL_90;
    }
    *((unsigned char *)v17 + 24) = 0;
    v27 = (void **)v17[2];
    if (*((unsigned char *)v27 + 24)) {
      BOOL v31 = v27 == v2;
    }
    else {
      BOOL v31 = 1;
    }
    if (v31) {
      goto LABEL_71;
    }
LABEL_68:
    id v17 = (void **)*((void *)v27[2] + (*(void *)v27[2] == (void)v27));
  }
  if (!*((unsigned char *)v17 + 24))
  {
    *((unsigned char *)v17 + 24) = 1;
    *((unsigned char *)v22 + 24) = 0;
    uint64_t v23 = (uint64_t *)v22[1];
    uint64_t v24 = *v23;
    v22[1] = (void *)*v23;
    if (v24) {
      *(void *)(v24 + 16) = v22;
    }
    v23[2] = (uint64_t)v22[2];
    *((void *)v22[2] + (*(void *)v22[2] != (void)v22)) = v23;
    *uint64_t v23 = (uint64_t)v22;
    v22[2] = v23;
    if (v2 == *v17) {
      v2 = v17;
    }
    id v17 = (void **)*((void *)*v17 + 1);
  }
  uint64_t v25 = (void **)*v17;
  if (!*v17 || *((unsigned char *)v25 + 24))
  {
    v26 = (void **)v17[1];
    if (v26 && !*((unsigned char *)v26 + 24)) {
      goto LABEL_77;
    }
    *((unsigned char *)v17 + 24) = 0;
    v27 = (void **)v17[2];
    if (v27 == v2)
    {
      v27 = v2;
LABEL_71:
      *((unsigned char *)v27 + 24) = 1;
      goto LABEL_91;
    }
    if (!*((unsigned char *)v27 + 24)) {
      goto LABEL_71;
    }
    goto LABEL_68;
  }
  v26 = (void **)v17[1];
  if (v26 && !*((unsigned char *)v26 + 24))
  {
LABEL_77:
    uint64_t v25 = v17;
  }
  else
  {
    *((unsigned char *)v25 + 24) = 1;
    *((unsigned char *)v17 + 24) = 0;
    v32 = v25[1];
    *id v17 = v32;
    if (v32) {
      v32[2] = v17;
    }
    v25[2] = v17[2];
    *((void *)v17[2] + (*(void *)v17[2] != (void)v17)) = v25;
    v25[1] = v17;
    v17[2] = v25;
    v26 = v17;
  }
  v33 = v25[2];
  *((unsigned char *)v25 + 24) = *((unsigned char *)v33 + 24);
  *((unsigned char *)v33 + 24) = 1;
  *((unsigned char *)v26 + 24) = 1;
  v34 = (uint64_t *)*((void *)v33 + 1);
  uint64_t v35 = *v34;
  *((void *)v33 + 1) = *v34;
  if (v35) {
    *(void *)(v35 + 16) = v33;
  }
  v34[2] = *((void *)v33 + 2);
  *(void *)(*((void *)v33 + 2) + 8 * (**((void **)v33 + 2) != (void)v33)) = v34;
  uint64_t *v34 = (uint64_t)v33;
LABEL_90:
  *((void *)v33 + 2) = v34;
LABEL_91:
  objc_destroyWeak(v4 + 5);

  operator delete(v4);
}

void __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_3(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) addObject:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
  if ([*(id *)(*(void *)(a1 + 32) + 48) count] == 1)
  {
    dispatch_time_t v2 = dispatch_time(0, 100000000);
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(NSObject **)(v3 + 32);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_4;
    block[3] = &unk_1E57F9EA8;
    block[4] = v3;
    dispatch_after(v2, v4, block);
  }
}

uint64_t __99__MPMediaEntityCache__entityWithIdentifier_mediaEntityType_collectionGroupingType_loadEntityBlock___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSomeGlobalEntityTemporaryReferences];
}

- (void)_clearSomeGlobalEntityTemporaryReferences
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_deallocLaterQueue);
  if ((unint64_t)[(NSMutableArray *)self->_entityTemporaryReferences count] <= 0xFA) {
    unint64_t v3 = (unint64_t)(float)(unint64_t)[(NSMutableArray *)self->_entityTemporaryReferences count];
  }
  else {
    unint64_t v3 = 250;
  }
  -[NSMutableArray subarrayWithRange:](self->_entityTemporaryReferences, "subarrayWithRange:", 0, v3);
  uint64_t v4 = (const void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_entityTemporaryReferences, "removeObjectsInRange:", 0, v3);
  if (![(NSMutableArray *)self->_entityTemporaryReferences count])
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    entityTemporaryReferences = self->_entityTemporaryReferences;
    self->_entityTemporaryReferences = v5;
  }
  uint64_t v7 = [(NSMutableArray *)self->_entityTemporaryReferences count];
  if (v4) {
    CFRelease(v4);
  }
  if (v7)
  {
    dispatch_time_t v8 = dispatch_time(0, 100000000);
    deallocLaterQueue = self->_deallocLaterQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MPMediaEntityCache__clearSomeGlobalEntityTemporaryReferences__block_invoke;
    block[3] = &unk_1E57F9EA8;
    block[4] = self;
    dispatch_after(v8, deallocLaterQueue, block);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityTemporaryReferences, 0);
  objc_storeStrong((id *)&self->_deallocLaterQueue, 0);

  objc_storeStrong((id *)&self->_mediaLibraryDataProvider, 0);
}

uint64_t __63__MPMediaEntityCache__clearSomeGlobalEntityTemporaryReferences__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _clearSomeGlobalEntityTemporaryReferences];
}

- (void)updatePropertyValuesInEntityWithIdentifier:(int64_t)a3 dataProviderEntityClass:(Class)a4 deleted:(BOOL)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __97__MPMediaEntityCache_updatePropertyValuesInEntityWithIdentifier_dataProviderEntityClass_deleted___block_invoke;
  v5[3] = &__block_descriptor_41_e9_v16__0_v8l;
  v5[4] = a3;
  BOOL v6 = a5;
  [(MPMediaEntityCache *)self _performWithExclusiveAccessForDataProviderEntityClass:a4 block:v5];
}

void __97__MPMediaEntityCache_updatePropertyValuesInEntityWithIdentifier_dataProviderEntityClass_deleted___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 8);
  dispatch_time_t v2 = (id *)(a2 + 8);
  unint64_t v3 = v4;
  if (v4)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = v2;
    do
    {
      uint64_t v8 = v3[4];
      BOOL v9 = v8 < v6;
      if (v8 >= v6) {
        v10 = v3;
      }
      else {
        v10 = v3 + 1;
      }
      if (!v9) {
        uint64_t v7 = (id *)v3;
      }
      unint64_t v3 = (void *)*v10;
    }
    while (*v10);
    if (v7 != v2 && v6 >= (uint64_t)v7[4])
    {
      id WeakRetained = objc_loadWeakRetained(v7 + 5);
      uint64_t v11 = [WeakRetained cachedPropertyValues];
      objc_super v12 = v11;
      if (*(unsigned char *)(a1 + 40)) {
        [v11 delete];
      }
      else {
        [v11 invalidate];
      }
    }
  }
}

- (id)itemWithIdentifier:(int64_t)a3
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  objc_super v12 = __Block_byref_object_copy__50539;
  uint64_t v13 = __Block_byref_object_dispose__50540;
  id v14 = 0;
  if (self->_mediaLibraryDataProviderRespondsToSupportsEntityChangeTrackingMethod)
  {
    uint64_t v8 = 0;
    char v4 = [(MPMediaLibraryDataProviderPrivate *)self->_mediaLibraryDataProvider supportsEntityChangeTrackingForMediaEntityType:0 collectionGroupingType:0 dataProviderClass:&v8];
    char v5 = v8 ? v4 : 0;
    if (v5) {
      -[MPMediaEntityCache _performWithSharedAccessForDataProviderEntityClass:block:](self, "_performWithSharedAccessForDataProviderEntityClass:block:");
    }
  }
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

void __41__MPMediaEntityCache_itemWithIdentifier___block_invoke(uint64_t a1, uint64_t a2)
{
  unint64_t v3 = *(void **)(a2 + 8);
  if (!v3) {
    return;
  }
  uint64_t v4 = *(void *)(a1 + 40);
  char v5 = v3;
  while (1)
  {
    uint64_t v6 = v5[4];
    if (v4 >= v6) {
      break;
    }
LABEL_6:
    char v5 = (void *)*v5;
    if (!v5) {
      return;
    }
  }
  if (v6 < v4)
  {
    ++v5;
    goto LABEL_6;
  }
  uint64_t v7 = (id *)std::map<long,MPIdentifierSet * {__strong}>::at(v3, v4);
  id WeakRetained = objc_loadWeakRetained(v7);
  uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = WeakRetained;
}

@end