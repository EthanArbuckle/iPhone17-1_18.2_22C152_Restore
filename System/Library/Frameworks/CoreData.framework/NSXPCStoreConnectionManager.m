@interface NSXPCStoreConnectionManager
- (id)initForStore:(id)a3;
- (intptr_t)_checkinConnection:(intptr_t)result;
- (uint64_t)_checkoutConnection:(uint64_t)a1;
- (void)dealloc;
- (void)disconnectAllConnections:(uint64_t)a1;
- (void)sendMessageWithContext:(uint64_t)a1;
@end

@implementation NSXPCStoreConnectionManager

void __54__NSXPCStoreConnectionManager_sendMessageWithContext___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  v20[8] = *MEMORY[0x1E4F143B8];
  uint64_t v10 = -[NSXPCStoreConnectionManager _checkoutConnection:](*(void *)(a1 + 32), 1);
  if (v10)
  {
    v17 = (void *)v10;
    id v18 = objc_alloc_init(MEMORY[0x1E4F28B28]);
    -[NSXPCStoreConnection sendMessageWithContext:](v17, *(void *)(a1 + 40));
    uint64_t v19 = *(void *)(a1 + 40);
    if (!v19 || !*(void *)(v19 + 24))
    {
      -[NSXPCStoreConnection disconnect]((uint64_t)v17);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __33__NSXPCStoreConnection_reconnect__block_invoke;
      v20[3] = &unk_1E544B868;
      v20[4] = v17;
      -[NSXPCStoreConnection performAndWait:]((uint64_t)v17, (uint64_t)v20);
    }
    -[NSXPCStoreConnectionManager _checkinConnection:](*(void *)(a1 + 32), v17);
    [v18 drain];
  }
  else
  {
    _NSCoreDataLog(1, @"manager sendMessageWithContext: unable to checkout connection.", v11, v12, v13, v14, v15, v16, a9);
  }
}

- (intptr_t)_checkinConnection:(intptr_t)result
{
  if (result && a2)
  {
    intptr_t v3 = result;
    v4 = (os_unfair_lock_s *)(result + 40);
    os_unfair_lock_lock_with_options();
    [*(id *)(v3 + 8) addObject:a2];

    os_unfair_lock_unlock(v4);
    v5 = *(NSObject **)(v3 + 32);
    return dispatch_semaphore_signal(v5);
  }
  return result;
}

- (uint64_t)_checkoutConnection:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v4 = *(NSObject **)(a1 + 32);
  dispatch_time_t v5 = dispatch_time(0, 120000000000);
  intptr_t v6 = dispatch_semaphore_wait(v4, v5);
  if (v6)
  {
    _NSCoreDataLog(1, @" NSXPCStoreConnectionManager timed out waiting for a connection - %l", v7, v8, v9, v10, v11, v12, v6);
    return 0;
  }
  os_unfair_lock_lock_with_options();
  uint64_t v14 = (void *)[*(id *)(a1 + 8) lastObject];
  uint64_t v15 = v14;
  if (v14)
  {
    id v16 = v14;
    uint64_t v13 = (uint64_t)v15;
    [*(id *)(a1 + 8) removeObject:v15];
  }
  else
  {
    uint64_t v13 = 0;
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 40));
  if (a2) {
    -[NSXPCStoreConnection reconnect](v13);
  }
  return v13;
}

- (void)sendMessageWithContext:(uint64_t)a1
{
  if (a1)
  {
    if (a2)
    {
      v2 = *(NSObject **)(a1 + 48);
      v3[0] = MEMORY[0x1E4F143A8];
      v3[1] = 3221225472;
      v3[2] = __54__NSXPCStoreConnectionManager_sendMessageWithContext___block_invoke;
      v3[3] = &unk_1E544B778;
      v3[4] = a1;
      v3[5] = a2;
      dispatch_sync(v2, v3);
    }
  }
}

- (id)initForStore:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v19.receiver = self;
  v19.super_class = (Class)NSXPCStoreConnectionManager;
  v4 = [(NSXPCStoreConnectionManager *)&v19 init];
  if (v4)
  {
    dispatch_time_t v5 = objc_msgSend((id)objc_msgSend(a3, "URL"), "copy");
    objc_initWeak(&location, a3);
    intptr_t v6 = objc_msgSend((id)objc_msgSend(a3, "options"), "valueForKey:", @"NSPersistentStoreConnectionPoolMaxSize");
    unint64_t v7 = +[_PFTask getPhysicalMemory]();
    uint64_t v8 = 2;
    if (v7 >= 0x80000001) {
      uint64_t v8 = 3;
    }
    if (v6)
    {
      uint64_t v9 = [v6 integerValue];
      if (v9 <= 1) {
        uint64_t v8 = 1;
      }
      else {
        uint64_t v8 = v9;
      }
    }
    v4->_maxConnections = v8;
    allConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v4->_allConnections = allConnections;
    if (v4->_maxConnections)
    {
      unint64_t v11 = 0;
      do
      {
        id v12 = [[NSXPCStoreConnection alloc] initForStore:a3];
        if (v12) {
          [(NSMutableArray *)v4->_allConnections addObject:v12];
        }

        ++v11;
      }
      while (v11 < v4->_maxConnections);
      allConnections = v4->_allConnections;
    }
    if (![(NSMutableArray *)allConnections count])
    {
      uint64_t v16 = [NSString stringWithFormat:@"NSXPCStoreConnection failed to initialize any connections for store at %@", objc_msgSend(a3, "URL")];
      id v17 = +[_NSCoreDataException exceptionWithName:code:reason:userInfo:]((uint64_t)_NSCoreDataException, *MEMORY[0x1E4F28490], 4224, v16, 0);
      objc_exception_throw(v17);
    }
    uint64_t v13 = (NSMutableArray *)[(NSMutableArray *)v4->_allConnections mutableCopy];
    v4->_availableConnections = v13;
    v4->_connectionLock._os_unfair_lock_opaque = 0;
    v4->_poolCounter = (OS_dispatch_semaphore *)dispatch_semaphore_create([(NSMutableArray *)v13 count]);
    uint64_t v14 = (const char *)objc_msgSend((id)objc_msgSend(NSString, "stringWithFormat:", @"XPCConnectionManager:%p", a3), "UTF8String");
    v4->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create(v14, MEMORY[0x1E4F14430]);

    objc_destroyWeak(&location);
  }
  return v4;
}

- (void)dealloc
{
  processingQueue = self->_processingQueue;
  if (processingQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __38__NSXPCStoreConnectionManager_dealloc__block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = self;
    dispatch_barrier_sync(processingQueue, block);
    dispatch_release((dispatch_object_t)self->_processingQueue);
  }

  self->_availableConnections = 0;
  poolCounter = self->_poolCounter;
  if (poolCounter)
  {
    dispatch_release(poolCounter);
    self->_poolCounter = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NSXPCStoreConnectionManager;
  [(NSXPCStoreConnectionManager *)&v5 dealloc];
}

uint64_t __38__NSXPCStoreConnectionManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  intptr_t v3 = *(void **)(*(void *)(a1 + 32) + 16);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        -[NSXPCStoreConnection disconnect](*(void *)(*((void *)&v9 + 1) + 8 * i));
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  *(void *)(*(void *)(a1 + 32) + 16) = 0;
  return [v2 drain];
}

- (void)disconnectAllConnections:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v6 = 0;
    unint64_t v7 = &v6;
    uint64_t v8 = 0x3052000000;
    long long v9 = __Block_byref_object_copy__39;
    long long v10 = __Block_byref_object_dispose__39;
    uint64_t v11 = 0;
    id v2 = *(NSObject **)(a1 + 48);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke;
    block[3] = &unk_1E544E9A0;
    char v5 = a2;
    block[4] = a1;
    void block[5] = &v6;
    dispatch_barrier_sync(v2, block);
    intptr_t v3 = (void *)v7[5];
    if (v3) {
      objc_exception_throw(v3);
    }
    _Block_object_dispose(&v6, 8);
  }
}

uint64_t __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  intptr_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = -[NSXPCStoreConnectionManager _checkoutConnection:](*(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
      if (v6)
      {
        [v3 addObject:v6];
      }
      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 16) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 40));
      }
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v36;
    do
    {
      for (uint64_t j = 0; j != v7; ++j)
      {
        if (*(void *)v36 != v8) {
          objc_enumerationMutation(v3);
        }
        -[NSXPCStoreConnection performAndWait:](*(void *)(*((void *)&v35 + 1) + 8 * j), (uint64_t)&__block_literal_global_29);
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v7);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v10 = [v3 countByEnumeratingWithState:&v31 objects:v41 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v32;
    do
    {
      for (uint64_t k = 0; k != v10; ++k)
      {
        if (*(void *)v32 != v11) {
          objc_enumerationMutation(v3);
        }
        uint64_t v13 = *(void *)(*((void *)&v31 + 1) + 8 * k);
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke_3;
        v30[3] = &unk_1E544B868;
        v30[4] = v13;
        -[NSXPCStoreConnection performAndWait:](v13, (uint64_t)v30);
      }
      uint64_t v10 = [v3 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v10);
  }
  if (*(unsigned char *)(a1 + 48))
  {
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v14 = [v3 countByEnumeratingWithState:&v26 objects:v40 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v27;
      do
      {
        for (uint64_t m = 0; m != v14; ++m)
        {
          if (*(void *)v27 != v15) {
            objc_enumerationMutation(v3);
          }
          -[NSXPCStoreConnectionManager _checkinConnection:](*(void *)(a1 + 32), *(void **)(*((void *)&v26 + 1) + 8 * m));
        }
        uint64_t v14 = [v3 countByEnumeratingWithState:&v26 objects:v40 count:16];
      }
      while (v14);
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    uint64_t v17 = [v3 countByEnumeratingWithState:&v22 objects:v39 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v23;
      do
      {
        for (uint64_t n = 0; n != v17; ++n)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v3);
          }
          uint64_t v20 = *(void **)(*((void *)&v22 + 1) + 8 * n);
          if (v20)
          {
            dispatch_semaphore_signal(*(dispatch_semaphore_t *)(*(void *)(a1 + 32) + 32));
          }
        }
        uint64_t v17 = [v3 countByEnumeratingWithState:&v22 objects:v39 count:16];
      }
      while (v17);
    }
  }
  [v3 removeAllObjects];
  return [v2 drain];
}

void __56__NSXPCStoreConnectionManager_disconnectAllConnections___block_invoke_3(uint64_t a1)
{
}

@end