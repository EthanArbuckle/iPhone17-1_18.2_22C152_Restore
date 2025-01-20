@interface FBPlistApplicationDataStoreRepository
- (BOOL)_isEligibleForSaving:(id)a3;
- (BOOL)containsKey:(id)a3 forApplication:(id)a4;
- (BOOL)isDirty;
- (FBApplicationDataStoreRepositoryDelegate)delegate;
- (FBPlistApplicationDataStoreRepository)initWithStorePath:(id)a3;
- (id)_stateQueue_addStoreForIdentifierIfNecessary:(id)a3;
- (id)_stateQueue_objectForKey:(id)a3 forIdentifier:(id)a4;
- (id)_stateQueue_objectsForKeys:(id)a3;
- (id)_stateQueue_storeForIdentifier:(id)a3;
- (id)allObjectsForKeys:(id)a3;
- (id)applicationIdentifiersWithState;
- (id)keysForApplication:(id)a3;
- (id)location;
- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4;
- (id)objectForKey:(id)a3 forApplication:(id)a4;
- (void)_load;
- (void)_notifyDelegateOfChangeForKeys:(id)a3 application:(id)a4;
- (void)_notifyDelegateOfStoreInvalidationForIdentifier:(id)a3;
- (void)_stateQueue_markDirty;
- (void)_stateQueue_removeStoreForIdentifier:(id)a3;
- (void)_writeQueue_flushSynchronously;
- (void)beginBatchedUpdate;
- (void)dealloc;
- (void)endBatchedUpdate;
- (void)flushSynchronously;
- (void)removeAllObjectsForApplication:(id)a3;
- (void)removeObjectForKey:(id)a3 forApplication:(id)a4;
- (void)removeObjectsForKeys:(id)a3 forApplication:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5;
@end

@implementation FBPlistApplicationDataStoreRepository

- (FBPlistApplicationDataStoreRepository)initWithStorePath:(id)a3
{
  id v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)FBPlistApplicationDataStoreRepository;
  v7 = [(FBPlistApplicationDataStoreRepository *)&v17 init];
  v8 = v7;
  if (!v7) { {
    goto LABEL_4;
  }
  }
  if (v6)
  {
    objc_storeStrong((id *)&v7->_storeURL, a3);
    uint64_t Serial = BSDispatchQueueCreateSerial();
    stateQueue = v8->_stateQueue;
    v8->_stateQueue = (OS_dispatch_queue *)Serial;

    uint64_t v11 = BSDispatchQueueCreateSerial();
    writeQueue = v8->_writeQueue;
    v8->_writeQueue = (OS_dispatch_queue *)v11;

    uint64_t v13 = BSDispatchQueueCreateSerial();
    calloutQueue = v8->_calloutQueue;
    v8->_calloutQueue = (OS_dispatch_queue *)v13;

    [(FBPlistApplicationDataStoreRepository *)v8 _load];
LABEL_4:

    return v8;
  }
  v16 = [NSString stringWithFormat:@"The application store must have a valid URL path."];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
    [(FBPlistApplicationDataStoreRepository *)a2 initWithStorePath:(uint64_t)v16];
  }
  }
  [v16 UTF8String];
  result = (FBPlistApplicationDataStoreRepository *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

- (void)dealloc
{
  if (self->_stateQueue)
  {
    v7[0] = 0;
    v7[1] = v7;
    v7[2] = 0x3032000000;
    v7[3] = __Block_byref_object_copy__3;
    v7[4] = __Block_byref_object_dispose__3;
    v8 = self->_state;
    state = self->_state;
    self->_state = 0;

    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__FBPlistApplicationDataStoreRepository_dealloc__block_invoke;
    block[3] = &unk_1E5C496D8;
    block[4] = v7;
    dispatch_async(stateQueue, block);
    _Block_object_dispose(v7, 8);
  }
  v5.receiver = self;
  v5.super_class = (Class)FBPlistApplicationDataStoreRepository;
  [(FBPlistApplicationDataStoreRepository *)&v5 dealloc];
}

void __48__FBPlistApplicationDataStoreRepository_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 32) + 8);
  v2 = *(void **)(v1 + 40);
  *(void *)(v1 + 40) = 0;
}

- (id)location
{
  return self->_storeURL;
}

- (BOOL)isDirty
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  stateQueue = self->_stateQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__FBPlistApplicationDataStoreRepository_isDirty__block_invoke;
  v5[3] = &unk_1E5C4A3D0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(stateQueue, v5);
  char v3 = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __48__FBPlistApplicationDataStoreRepository_isDirty__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 24);
  return result;
}

- (id)applicationIdentifiersWithState
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  uint64_t v11 = __Block_byref_object_dispose__3;
  id v12 = [MEMORY[0x1E4F1CA48] array];
  stateQueue = self->_stateQueue;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __72__FBPlistApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke;
  v6[3] = &unk_1E5C49AB8;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(stateQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __72__FBPlistApplicationDataStoreRepository_applicationIdentifiersWithState__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) allKeys];
  if (v2)
  {
    char v3 = v2;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addObjectsFromArray:v2];
    v2 = v3;
  }
}

- (id)keysForApplication:(id)a3
{
  id v4 = a3;
  objc_super v5 = v4;
  if (v4)
  {
    uint64_t v12 = 0;
    uint64_t v13 = &v12;
    uint64_t v14 = 0x3032000000;
    v15 = __Block_byref_object_copy__3;
    v16 = __Block_byref_object_dispose__3;
    id v17 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __60__FBPlistApplicationDataStoreRepository_keysForApplication___block_invoke;
    block[3] = &unk_1E5C4A3F8;
    block[4] = self;
    id v10 = v4;
    uint64_t v11 = &v12;
    dispatch_sync(stateQueue, block);
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

void __60__FBPlistApplicationDataStoreRepository_keysForApplication___block_invoke(uint64_t a1)
{
  v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(void *)(a1 + 40));
  if (v2)
  {
    id v6 = v2;
    uint64_t v3 = [v2 allKeys];
    uint64_t v4 = *(void *)(*(void *)(a1 + 48) + 8);
    objc_super v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;

    v2 = v6;
  }
}

- (BOOL)containsKey:(id)a3 forApplication:(id)a4
{
  uint64_t v4 = [(FBPlistApplicationDataStoreRepository *)self objectForKey:a3 forApplication:a4];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)objectForKey:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  id v9 = 0;
  if (v6 && v7)
  {
    uint64_t v16 = 0;
    id v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__3;
    v20 = __Block_byref_object_dispose__3;
    id v21 = 0;
    stateQueue = self->_stateQueue;
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __69__FBPlistApplicationDataStoreRepository_objectForKey_forApplication___block_invoke;
    v12[3] = &unk_1E5C4A420;
    v15 = &v16;
    v12[4] = self;
    id v13 = v6;
    id v14 = v8;
    dispatch_sync(stateQueue, v12);
    id v9 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
  }

  return v9;
}

void __69__FBPlistApplicationDataStoreRepository_objectForKey_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_objectForKey:forIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)allObjectsForKeys:(id)a3
{
  id v4 = a3;
  if ([v4 count])
  {
    uint64_t v11 = 0;
    uint64_t v12 = &v11;
    uint64_t v13 = 0x3032000000;
    id v14 = __Block_byref_object_copy__3;
    v15 = __Block_byref_object_dispose__3;
    id v16 = 0;
    stateQueue = self->_stateQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __59__FBPlistApplicationDataStoreRepository_allObjectsForKeys___block_invoke;
    block[3] = &unk_1E5C4A448;
    id v10 = &v11;
    block[4] = self;
    id v9 = v4;
    dispatch_sync(stateQueue, block);
    id v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

void __59__FBPlistApplicationDataStoreRepository_allObjectsForKeys___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_objectsForKeys:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)setObject:(id)a3 forKey:(id)a4 forApplication:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = v10;
  if (v8)
  {
    if (v9 && v10 && [(FBPlistApplicationDataStoreRepository *)self _isEligibleForSaving:v8])
    {
      uint64_t v12 = (void *)[v8 copy];
      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __73__FBPlistApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke;
      block[3] = &unk_1E5C4A470;
      block[4] = self;
      id v16 = v11;
      id v17 = v8;
      id v18 = v9;
      id v19 = v12;
      id v14 = v12;
      dispatch_async(stateQueue, block);
    }
  }
  else
  {
    [(FBPlistApplicationDataStoreRepository *)self removeObjectForKey:v9 forApplication:v10];
  }
}

void __73__FBPlistApplicationDataStoreRepository_setObject_forKey_forApplication___block_invoke(uint64_t a1)
{
  v10[1] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(void *)(a1 + 40));
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = [v2 objectForKey:*(void *)(a1 + 56)];
  }
  else
  {
    if (!*(void *)(a1 + 48)) { {
      return;
    }
    }
    id v4 = 0;
  }
  BOOL v5 = *(void **)(a1 + 48);
  if (v5 != v4 && ([v5 isEqual:v4] & 1) == 0)
  {
    if (*(void *)(a1 + 64))
    {
      id v6 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_addStoreForIdentifierIfNecessary:", *(void *)(a1 + 40));

      [v6 setObject:*(void *)(a1 + 64) forKey:*(void *)(a1 + 56)];
      uint64_t v3 = v6;
    }
    else
    {
      [v3 removeObjectForKey:*(void *)(a1 + 56)];
    }
    objc_msgSend(*(id *)(a1 + 32), "_stateQueue_markDirty");
    uint64_t v7 = [v3 count];
    id v8 = *(void **)(a1 + 32);
    if (v7)
    {
      v10[0] = *(void *)(a1 + 56);
      id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v10 count:1];
      [v8 _notifyDelegateOfChangeForKeys:v9 application:*(void *)(a1 + 40)];
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_removeStoreForIdentifier:", *(void *)(a1 + 40));
    }
  }
}

- (void)removeObjectForKey:(id)a3 forApplication:(id)a4
{
  if (a3 && a4)
  {
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a4;
    id v8 = [v6 arrayWithObject:a3];
    [(FBPlistApplicationDataStoreRepository *)self removeObjectsForKeys:v8 forApplication:v7];
  }
}

- (void)removeObjectsForKeys:(id)a3 forApplication:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [v6 count];
    if (v7)
    {
      if (v8)
      {
        stateQueue = self->_stateQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke;
        block[3] = &unk_1E5C49860;
        block[4] = self;
        id v11 = v7;
        id v12 = v6;
        dispatch_async(stateQueue, block);
      }
    }
  }
}

void __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(void *)(a1 + 40));
  if (v2)
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke_2;
    v7[3] = &unk_1E5C4A498;
    id v8 = *(id *)(a1 + 48);
    uint64_t v3 = [v2 keysOfEntriesPassingTest:v7];
    id v4 = [v3 allObjects];

    if ([v4 count])
    {
      [v2 removeObjectsForKeys:v4];
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_markDirty");
      uint64_t v5 = [v2 count];
      id v6 = *(void **)(a1 + 32);
      if (v5) { {
        [v6 _notifyDelegateOfChangeForKeys:v4 application:*(void *)(a1 + 40)];
      }
      }
      else {
        objc_msgSend(v6, "_stateQueue_removeStoreForIdentifier:", *(void *)(a1 + 40));
      }
    }
  }
}

uint64_t __77__FBPlistApplicationDataStoreRepository_removeObjectsForKeys_forApplication___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

- (void)removeAllObjectsForApplication:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    stateQueue = self->_stateQueue;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __72__FBPlistApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke;
    v7[3] = &unk_1E5C497A0;
    void v7[4] = self;
    id v8 = v4;
    dispatch_async(stateQueue, v7);
  }
}

uint64_t __72__FBPlistApplicationDataStoreRepository_removeAllObjectsForApplication___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stateQueue_removeStoreForIdentifier:", *(void *)(a1 + 40));
}

- (void)flushSynchronously
{
  writeQueue = self->_writeQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__FBPlistApplicationDataStoreRepository_flushSynchronously__block_invoke;
  block[3] = &unk_1E5C49AE0;
  block[4] = self;
  dispatch_sync(writeQueue, block);
}

uint64_t __59__FBPlistApplicationDataStoreRepository_flushSynchronously__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeQueue_flushSynchronously");
}

- (void)beginBatchedUpdate
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __59__FBPlistApplicationDataStoreRepository_beginBatchedUpdate__block_invoke;
  block[3] = &unk_1E5C49AE0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

uint64_t __59__FBPlistApplicationDataStoreRepository_beginBatchedUpdate__block_invoke(uint64_t result)
{
  return result;
}

- (void)endBatchedUpdate
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke;
  block[3] = &unk_1E5C49AE0;
  block[4] = self;
  dispatch_sync(stateQueue, block);
}

void __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void *)(v1 + 32);
  if (v2)
  {
    *(void *)(v1 + ++*(void *)(*(void *)(result + 32) + 32) = v2 - 1;
    uint64_t v3 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v3 + 24))
    {
      if (!*(void *)(v3 + 32))
      {
        id v4 = *(NSObject **)(v3 + 64);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke_2;
        block[3] = &unk_1E5C49AE0;
        block[4] = v3;
        dispatch_async(v4, block);
      }
    }
  }
}

uint64_t __57__FBPlistApplicationDataStoreRepository_endBatchedUpdate__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_writeQueue_flushSynchronously");
}

- (id)migrateIdentifier:(id)a3 toIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  id v21 = __Block_byref_object_dispose__3;
  id v22 = 0;
  stateQueue = self->_stateQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke;
  v13[3] = &unk_1E5C4A4E8;
  v13[4] = self;
  id v14 = v6;
  id v15 = v7;
  id v16 = &v17;
  id v9 = v7;
  id v10 = v6;
  dispatch_sync(stateQueue, v13);
  id v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);

  return v11;
}

void __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(void *)(a1 + 40));
  if (v2)
  {
    uint64_t v3 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_storeForIdentifier:", *(void *)(a1 + 48));
    if (v3)
    {
      id v4 = (void *)v3;
      uint64_t v5 = (void *)MEMORY[0x1E4F28C58];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3;
      v15[3] = &unk_1E5C4A4C0;
      id v16 = *(id *)(a1 + 48);
      uint64_t v6 = objc_msgSend(v5, "bs_errorWithDomain:code:configuration:", @"FBApplicationDataStore", 1, v15);
      uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
      id v8 = *(void **)(v7 + 40);
      *(void *)(v7 + 40) = v6;
    }
    else
    {
      id v4 = objc_msgSend(*(id *)(a1 + 32), "_stateQueue_addStoreForIdentifierIfNecessary:", *(void *)(a1 + 48));
      [v4 addEntriesFromDictionary:v2];
      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_removeStoreForIdentifier:", *(void *)(a1 + 40));
      uint64_t v13 = *(void **)(a1 + 32);
      id v14 = [v4 allKeys];
      [v13 _notifyDelegateOfChangeForKeys:v14 application:*(void *)(a1 + 48)];

      objc_msgSend(*(id *)(a1 + 32), "_stateQueue_markDirty");
    }
  }
  else
  {
    id v9 = (void *)MEMORY[0x1E4F28C58];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2;
    v17[3] = &unk_1E5C4A4C0;
    id v18 = *(id *)(a1 + 40);
    uint64_t v10 = objc_msgSend(v9, "bs_errorWithDomain:code:configuration:", @"FBApplicationDataStore", 1, v17);
    uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

    id v4 = v18;
  }
}

uint64_t __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setFailureReason:@"No store exists for identifier \"%@\"", *(void *)(a1 + 32)];
}

uint64_t __72__FBPlistApplicationDataStoreRepository_migrateIdentifier_toIdentifier___block_invoke_3(uint64_t a1, void *a2)
{
  return [a2 setFailureReason:@"Store already exists with identifier \"%@\"", *(void *)(a1 + 32)];
}

- (BOOL)_isEligibleForSaving:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (_isEligibleForSaving__onceToken != -1) { {
    dispatch_once(&_isEligibleForSaving__onceToken, &__block_literal_global_10);
  }
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v4 = (id)_isEligibleForSaving____eligibleClassTypes;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) { {
          objc_enumerationMutation(v4);
        }
        }
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v5) = 1;
          goto LABEL_13;
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v5) { {
        continue;
      }
      }
      break;
    }
  }
LABEL_13:

  return v5;
}

void __62__FBPlistApplicationDataStoreRepository__isEligibleForSaving___block_invoke()
{
  id v0 = objc_alloc(MEMORY[0x1E4F1C978]);
  uint64_t v1 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_msgSend(v0, "initWithObjects:", v1, v2, v3, v4, v5, objc_opt_class(), 0);
  uint64_t v7 = (void *)_isEligibleForSaving____eligibleClassTypes;
  _isEligibleForSaving____eligibleClassTypes = v6;
}

- (void)_load
{
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FBPlistApplicationDataStoreRepository__load__block_invoke;
  block[3] = &unk_1E5C49AE0;
  block[4] = self;
  dispatch_async(stateQueue, block);
}

void __46__FBPlistApplicationDataStoreRepository__load__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1AD0B8A00]();
  uint64_t v3 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:*(void *)(*(void *)(a1 + 32) + 8) options:1 error:0];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F28F98] propertyListWithData:v3 options:1 format:0 error:0];
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v6 = *(void **)(v5 + 16);
    *(void *)(v5 + 16) = v4;
  }
  if (!*(void *)(*(void *)(a1 + 32) + 16) || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v8 = *(void *)(a1 + 32);
    long long v9 = *(void **)(v8 + 16);
    *(void *)(v8 + 16) = v7;
  }
}

- (id)_stateQueue_objectForKey:(id)a3 forIdentifier:(id)a4
{
  id v6 = a3;
  stateQueue = self->_stateQueue;
  id v8 = a4;
  dispatch_assert_queue_V2(stateQueue);
  long long v9 = [(FBPlistApplicationDataStoreRepository *)self _stateQueue_storeForIdentifier:v8];

  if (v9)
  {
    long long v10 = [v9 objectForKey:v6];
  }
  else
  {
    long long v10 = 0;
  }

  return v10;
}

- (id)_stateQueue_objectsForKeys:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v17 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v4 = [(NSMutableDictionary *)self->_state allKeys];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v7) { {
          objc_enumerationMutation(v4);
        }
        }
        uint64_t v9 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        long long v10 = [(FBPlistApplicationDataStoreRepository *)self _stateQueue_storeForIdentifier:v9];
        long long v11 = v10;
        if (v10)
        {
          long long v12 = [v10 dictionaryWithValuesForKeys:v18];
          uint64_t v13 = (void *)[v12 mutableCopy];

          uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
          id v15 = [v13 allKeysForObject:v14];

          [v13 removeObjectsForKeys:v15];
          [v17 setObject:v13 forKey:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v6);
  }

  return v17;
}

- (id)_stateQueue_storeForIdentifier:(id)a3
{
  stateQueue = self->_stateQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(stateQueue);
  uint64_t v6 = [(NSMutableDictionary *)self->_state bs_safeObjectForKey:v5 ofType:objc_opt_class()];

  return v6;
}

- (id)_stateQueue_addStoreForIdentifierIfNecessary:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v5 = [(FBPlistApplicationDataStoreRepository *)self _stateQueue_storeForIdentifier:v4];
  if (!v5)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_state setObject:v5 forKey:v4];
    [(FBPlistApplicationDataStoreRepository *)self _stateQueue_markDirty];
  }

  return v5;
}

- (void)_stateQueue_removeStoreForIdentifier:(id)a3
{
  id v5 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  id v4 = [(NSMutableDictionary *)self->_state objectForKey:v5];

  if (v4)
  {
    [(NSMutableDictionary *)self->_state removeObjectForKey:v5];
    [(FBPlistApplicationDataStoreRepository *)self _stateQueue_markDirty];
    [(FBPlistApplicationDataStoreRepository *)self _notifyDelegateOfStoreInvalidationForIdentifier:v5];
  }
}

- (void)_stateQueue_markDirty
{
  if (!self->_dirty)
  {
    self->_dirty = 1;
    dispatch_time_t v3 = dispatch_time(0, 10000000000);
    writeQueue = self->_writeQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __62__FBPlistApplicationDataStoreRepository__stateQueue_markDirty__block_invoke;
    block[3] = &unk_1E5C49AE0;
    block[4] = self;
    dispatch_after(v3, writeQueue, block);
  }
}

void __62__FBPlistApplicationDataStoreRepository__stateQueue_markDirty__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1AD0B8A00]();
  objc_msgSend(*(id *)(a1 + 32), "_writeQueue_flushSynchronously");
}

- (void)_writeQueue_flushSynchronously
{
  v17[1] = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_writeQueue);
  if (!self->_batchCount)
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x3032000000;
    uint64_t v13 = __Block_byref_object_copy__3;
    uint64_t v14 = __Block_byref_object_dispose__3;
    id v15 = 0;
    stateQueue = self->_stateQueue;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke;
    v9[3] = &unk_1E5C4A510;
    v9[4] = self;
    v9[5] = &v10;
    v9[6] = a2;
    dispatch_sync(stateQueue, v9);
    if (v11[5])
    {
      id v5 = [(NSURL *)self->_storeURL path];
      uint64_t v6 = [v5 stringByDeletingLastPathComponent];
      id v7 = objc_alloc_init(MEMORY[0x1E4F28CB8]);
      if (([v7 fileExistsAtPath:v6] & 1) == 0)
      {
        [v7 createDirectoryAtPath:v6 withIntermediateDirectories:1 attributes:0 error:0];
        uint64_t v16 = *MEMORY[0x1E4F28370];
        v17[0] = *MEMORY[0x1E4F28378];
        id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:&v16 count:1];
        [v7 setAttributes:v8 ofItemAtPath:v6 error:0];
      }
      [(id)v11[5] writeToFile:v5 options:268435457 error:0];
    }
    _Block_object_dispose(&v10, 8);
  }
}

void __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke(uint64_t a1)
{
  uint64_t v2 = (uint64_t *)(a1 + 32);
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 24))
  {
    uint64_t v4 = *(void *)(v1 + 16);
    id v10 = 0;
    uint64_t v5 = [MEMORY[0x1E4F28F98] dataWithPropertyList:v4 format:200 options:0 error:&v10];
    id v6 = v10;
    uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
    {
      *(unsigned char *)(*v2 + 24) = 0;
    }
    else
    {
      uint64_t v9 = [NSString stringWithFormat:@"Unable to serialize application state: %@", v6];
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) { {
        __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke_cold_1(a1, v2, (uint64_t)v9);
      }
      }
      [v9 UTF8String];
      _bs_set_crash_log_message();
      __break(0);
    }
  }
}

- (void)_notifyDelegateOfChangeForKeys:(id)a3 application:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  calloutQueue = self->_calloutQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__FBPlistApplicationDataStoreRepository__notifyDelegateOfChangeForKeys_application___block_invoke;
  block[3] = &unk_1E5C49860;
  block[4] = self;
  id v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(calloutQueue, block);
}

void __84__FBPlistApplicationDataStoreRepository__notifyDelegateOfChangeForKeys_application___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  [v2 objectChangedForKeys:*(void *)(a1 + 40) application:*(void *)(a1 + 48)];
}

- (void)_notifyDelegateOfStoreInvalidationForIdentifier:(id)a3
{
  id v4 = a3;
  calloutQueue = self->_calloutQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __89__FBPlistApplicationDataStoreRepository__notifyDelegateOfStoreInvalidationForIdentifier___block_invoke;
  v7[3] = &unk_1E5C497A0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(calloutQueue, v7);
}

void __89__FBPlistApplicationDataStoreRepository__notifyDelegateOfStoreInvalidationForIdentifier___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) delegate];
  if (objc_opt_respondsToSelector()) { {
    [v2 storeInvalidatedForIdentifier:*(void *)(a1 + 40)];
  }
  }
}

- (FBApplicationDataStoreRepositoryDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (FBApplicationDataStoreRepositoryDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storeURL, 0);
}

- (void)initWithStorePath:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(a1);
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  int v8 = 138544642;
  id v9 = v5;
  __int16 v10 = 2114;
  long long v11 = v7;
  __int16 v12 = 2048;
  uint64_t v13 = a2;
  __int16 v14 = 2114;
  id v15 = @"FBPlistApplicationDataStoreRepository.m";
  __int16 v16 = 1024;
  int v17 = 37;
  __int16 v18 = 2114;
  uint64_t v19 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);
}

void __71__FBPlistApplicationDataStoreRepository__writeQueue_flushSynchronously__block_invoke_cold_1(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = NSStringFromSelector(*(SEL *)(a1 + 48));
  id v6 = (objc_class *)objc_opt_class();
  id v7 = NSStringFromClass(v6);
  uint64_t v8 = *a2;
  int v9 = 138544642;
  __int16 v10 = v5;
  __int16 v11 = 2114;
  __int16 v12 = v7;
  __int16 v13 = 2048;
  uint64_t v14 = v8;
  __int16 v15 = 2114;
  __int16 v16 = @"FBPlistApplicationDataStoreRepository.m";
  __int16 v17 = 1024;
  int v18 = 389;
  __int16 v19 = 2114;
  uint64_t v20 = a3;
  _os_log_error_impl(&dword_1A62FC000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v9, 0x3Au);
}

@end