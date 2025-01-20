@interface NSSQLDefaultConnectionManager
- (BOOL)handleStoreRequest:(id)a3;
- (NSSQLDefaultConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5;
- (intptr_t)_checkinConnection:(intptr_t)result;
- (void)_checkoutConnectionOfType:(uint64_t)a1;
- (void)dealloc;
- (void)disconnectAllConnections;
- (void)enumerateAvailableConnectionsWithBlock:(id)a3;
- (void)scheduleBarrierBlock:(id)a3;
- (void)scheduleConnectionsBarrier:(id)a3;
- (void)setExclusiveLockingMode:(BOOL)a3;
@end

@implementation NSSQLDefaultConnectionManager

- (BOOL)handleStoreRequest:(id)a3
{
  if (!a3) {
    return 1;
  }
  [*((id *)a3 + 2) requestType];
  v5 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:]((uint64_t)self);
  if (!v5) {
    return 0;
  }
  uint64_t v6 = (uint64_t)v5;
  -[NSSQLStoreRequestContext setConnection:]((uint64_t)a3, v5);
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3052000000;
  v14 = __Block_byref_object_copy__16;
  v15 = __Block_byref_object_dispose__16;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __52__NSSQLDefaultConnectionManager_handleStoreRequest___block_invoke;
  v10[3] = &unk_1E544C9B0;
  v10[4] = v6;
  v10[5] = a3;
  v10[7] = &v17;
  v10[8] = &v11;
  v10[6] = self;
  -[NSSQLiteConnection performAndWait:](v6, (uint64_t)v10);
  v7 = (void *)v12[5];
  if (v7) {
    objc_exception_throw(v7);
  }
  BOOL v8 = *((unsigned char *)v18 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  _Block_object_dispose(&v17, 8);
  return v8;
}

- (void)_checkoutConnectionOfType:(uint64_t)a1
{
  if (!a1) {
    return 0;
  }
  v2 = *(NSObject **)(a1 + 40);
  dispatch_time_t v3 = dispatch_time(0, 120000000000);
  intptr_t v4 = dispatch_semaphore_wait(v2, v3);
  v5 = 0;
  if (!v4)
  {
    os_unfair_lock_lock_with_options();
    uint64_t v6 = (void *)[*(id *)(a1 + 24) lastObject];
    v7 = v6;
    if (v6)
    {
      id v8 = v6;
      v5 = v7;
      [*(id *)(a1 + 24) removeLastObject];
    }
    else
    {
      v5 = 0;
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 48));
  }
  return v5;
}

uint64_t __52__NSSQLDefaultConnectionManager_handleStoreRequest___block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  dispatch_time_t v3 = *(void **)(a1 + 32);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = [*(id *)(a1 + 40) executeRequestUsingConnection:v3];
  -[NSSQLStoreRequestContext setConnection:](*(void *)(a1 + 40), 0);
  -[NSSQLDefaultConnectionManager _checkinConnection:](*(void *)(a1 + 48), (uint64_t)v3);

  return [v2 drain];
}

- (intptr_t)_checkinConnection:(intptr_t)result
{
  if (result && a2)
  {
    intptr_t v3 = result;
    os_unfair_lock_lock_with_options();
    [*(id *)(v3 + 24) addObject:a2];
    os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 48));
    intptr_t v4 = *(NSObject **)(v3 + 40);
    return dispatch_semaphore_signal(v4);
  }
  return result;
}

void __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke_3(uint64_t a1)
{
}

void __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_2(uint64_t a1)
{
}

void __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke(uint64_t a1)
{
}

void __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke_2(uint64_t a1)
{
}

- (NSSQLDefaultConnectionManager)initWithSQLCore:(id)a3 priority:(unint64_t)a4 seedConnection:(id)a5
{
  v33[7] = *MEMORY[0x1E4F143B8];
  v31.receiver = self;
  v31.super_class = (Class)NSSQLDefaultConnectionManager;
  v9 = -[NSSQLConnectionManager initWithSQLCore:priority:seedConnection:](&v31, sel_initWithSQLCore_priority_seedConnection_);
  if (!v9) {
    return v9;
  }
  v10 = (const char *)[(id)objc_msgSend(NSString stringWithFormat:@"SQLQueue: %@ : %p", objc_msgSend((id)objc_msgSend(a3, "_persistentStoreCoordinator"), "name"), v9), "cStringUsingEncoding:", 1];
  if (a4 == 1)
  {
    dispatch_qos_class_t v11 = QOS_CLASS_USER_INITIATED;
  }
  else
  {
    uint64_t v12 = [a3 _persistentStoreCoordinator];
    if (!v12) {
      goto LABEL_8;
    }
    unsigned int v13 = *(unsigned __int16 *)(v12 + 24);
    dispatch_qos_class_t v11 = (v13 >> 2);
    if (!(v13 >> 2)) {
      goto LABEL_8;
    }
  }
  v14 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], v11, 0);
  if (!v14)
  {
    Name = sel_getName(a2);
    _NSCoreDataLog(1, @"dispatch_queue_attr_make_with_qos_class() returned NULL in %s", v16, v17, v18, v19, v20, v21, (uint64_t)Name);
LABEL_8:
    v14 = MEMORY[0x1E4F14430];
  }
  v9->_processingQueue = (OS_dispatch_queue *)dispatch_queue_create(v10, v14);
  dispatch_release(v14);
  v9->_connectionLock._os_unfair_lock_opaque = 0;
  v9->_availableConnections = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v22 = objc_msgSend((id)objc_msgSend(-[NSSQLConnectionManager sqlCore](v9, "sqlCore"), "options"), "valueForKey:", @"NSPersistentStoreConnectionPoolMaxSize");
  if ((unint64_t)+[_PFTask getPhysicalMemory]() < 0x80000001) {
    uint64_t v23 = 2;
  }
  else {
    uint64_t v23 = 3;
  }
  if (v22)
  {
    uint64_t v24 = [v22 integerValue];
    if (v24 <= 1) {
      uint64_t v23 = 1;
    }
    else {
      uint64_t v23 = v24;
    }
  }
  uint64_t v25 = [(NSSQLConnectionManager *)v9 sqlCore];
  uint64_t v26 = v23 - (a5 != 0);
  if (v25 && (*(_DWORD *)(v25 + 200) & 0x1C) == 8
    || (uint64_t v27 = [(NSSQLConnectionManager *)v9 sqlCore]) != 0 && (*(_DWORD *)(v27 + 200) & 0x1C) == 4)
  {
    v26 -= (unint64_t)v26 > 2;
    int v28 = 1;
  }
  else
  {
    int v28 = 0;
  }
  while ([(NSMutableArray *)v9->_availableConnections count] < v26)
  {
    id v29 = [[NSSQLiteConnection alloc] initForSQLCore:[(NSSQLConnectionManager *)v9 sqlCore]];
    [(NSMutableArray *)v9->_availableConnections addObject:v29];
    if (v28)
    {
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke;
      v33[3] = &unk_1E544B868;
      v33[4] = v29;
      -[NSSQLiteConnection performAndWait:]((uint64_t)v29, (uint64_t)v33);
    }
  }
  if (a5)
  {
    [(NSMutableArray *)v9->_availableConnections addObject:a5];
    if (v28)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __64__NSSQLDefaultConnectionManager__initializeConnectionsWithSeed___block_invoke_2;
      v32[3] = &unk_1E544B868;
      v32[4] = a5;
      -[NSSQLiteConnection performAndWait:]((uint64_t)a5, (uint64_t)v32);
    }
  }
  v9->_allConnections = (NSArray *)[(NSMutableArray *)v9->_availableConnections copy];
  v9->_poolCounter = (OS_dispatch_semaphore *)dispatch_semaphore_create([(NSMutableArray *)v9->_availableConnections count]);
  return v9;
}

- (void)disconnectAllConnections
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x3052000000;
  id v8 = __Block_byref_object_copy__16;
  v9 = __Block_byref_object_dispose__16;
  uint64_t v10 = 0;
  processingQueue = self->_processingQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke;
  v4[3] = &unk_1E544B4A8;
  v4[4] = self;
  v4[5] = &v5;
  dispatch_barrier_sync(processingQueue, v4);
  intptr_t v3 = (void *)v6[5];
  if (v3) {
    objc_exception_throw(v3);
  }
  _Block_object_dispose(&v5, 8);
}

uint64_t __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  intptr_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(void *)(a1 + 32));
      if (v6)
      {
        [v3 addObject:v6];
      }
      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
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
        -[NSSQLiteConnection performAndWait:](*(void *)(*((void *)&v35 + 1) + 8 * j), (uint64_t)&__block_literal_global_58);
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
        if (v13)
        {

          *(void *)(v13 + 208) = 0;
        }
      }
      uint64_t v10 = [v3 countByEnumeratingWithState:&v31 objects:v41 count:16];
    }
    while (v10);
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v14 = [v3 countByEnumeratingWithState:&v27 objects:v40 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v28;
    do
    {
      for (uint64_t m = 0; m != v14; ++m)
      {
        if (*(void *)v28 != v15) {
          objc_enumerationMutation(v3);
        }
        uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * m);
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __57__NSSQLDefaultConnectionManager_disconnectAllConnections__block_invoke_3;
        v26[3] = &unk_1E544B868;
        v26[4] = v17;
        -[NSSQLiteConnection performAndWait:](v17, (uint64_t)v26);
      }
      uint64_t v14 = [v3 countByEnumeratingWithState:&v27 objects:v40 count:16];
    }
    while (v14);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v18 = [v3 countByEnumeratingWithState:&v22 objects:v39 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v23;
    do
    {
      for (uint64_t n = 0; n != v18; ++n)
      {
        if (*(void *)v23 != v19) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLDefaultConnectionManager _checkinConnection:](*(void *)(a1 + 32), *(void *)(*((void *)&v22 + 1) + 8 * n));
      }
      uint64_t v18 = [v3 countByEnumeratingWithState:&v22 objects:v39 count:16];
    }
    while (v18);
  }
  [v3 removeAllObjects];
  return [v2 drain];
}

- (void)dealloc
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  processingQueue = self->_processingQueue;
  if (processingQueue)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke;
    block[3] = &unk_1E544B868;
    block[4] = self;
    dispatch_barrier_sync(processingQueue, block);
    dispatch_release((dispatch_object_t)self->_processingQueue);
  }
  else
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    allConnections = self->_allConnections;
    uint64_t v5 = [(NSArray *)allConnections countByEnumeratingWithState:&v13 objects:v18 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(allConnections);
          }
          uint64_t v9 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          v12[0] = MEMORY[0x1E4F143A8];
          v12[1] = 3221225472;
          v12[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_3;
          v12[3] = &unk_1E544B868;
          v12[4] = v9;
          -[NSSQLiteConnection performAndWait:](v9, (uint64_t)v12);
        }
        uint64_t v6 = [(NSArray *)allConnections countByEnumeratingWithState:&v13 objects:v18 count:16];
      }
      while (v6);
    }

    self->_allConnections = 0;
  }

  self->_availableConnections = 0;
  poolCounter = self->_poolCounter;
  if (poolCounter)
  {
    dispatch_release(poolCounter);
    self->_poolCounter = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)NSSQLDefaultConnectionManager;
  [(NSSQLConnectionManager *)&v11 dealloc];
}

uint64_t __40__NSSQLDefaultConnectionManager_dealloc__block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  intptr_t v3 = *(void **)(*(void *)(a1 + 32) + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v10 + 1) + 8 * i);
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_2;
        v9[3] = &unk_1E544B868;
        v9[4] = v7;
        -[NSSQLiteConnection performAndWait:](v7, (uint64_t)v9);
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }

  *(void *)(*(void *)(a1 + 32) + 32) = 0;
  uint64_t result = [v2 drain];
  if (v4) {
    objc_exception_rethrow();
  }
  return result;
}

void __40__NSSQLDefaultConnectionManager_dealloc__block_invoke_3(uint64_t a1)
{
}

- (void)setExclusiveLockingMode:(BOOL)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __57__NSSQLDefaultConnectionManager_setExclusiveLockingMode___block_invoke;
  v3[3] = &__block_descriptor_33_e28_v16__0__NSSQLiteConnection_8l;
  BOOL v4 = a3;
  [(NSSQLDefaultConnectionManager *)self scheduleConnectionsBarrier:v3];
}

uint64_t __57__NSSQLDefaultConnectionManager_setExclusiveLockingMode___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setExclusiveLockingMode:*(unsigned __int8 *)(a1 + 32)];
}

- (void)scheduleBarrierBlock:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__16;
  processingQueue = self->_processingQueue;
  long long v10 = __Block_byref_object_dispose__16;
  uint64_t v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__NSSQLDefaultConnectionManager_scheduleBarrierBlock___block_invoke;
  block[3] = &unk_1E544C9D8;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v6;
  dispatch_barrier_sync(processingQueue, block);
  BOOL v4 = (void *)v7[5];
  if (v4) {
    objc_exception_throw(v4);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __54__NSSQLDefaultConnectionManager_scheduleBarrierBlock___block_invoke(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  intptr_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(void *)(a1 + 32));
      if (v6)
      {
        [v3 addObject:v6];
      }
      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
      }
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v19;
    do
    {
      for (uint64_t j = 0; j != v7; ++j)
      {
        if (*(void *)v19 != v8) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLiteConnection performAndWait:](*(void *)(*((void *)&v18 + 1) + 8 * j), (uint64_t)&__block_literal_global_48);
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v7);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v10 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (uint64_t k = 0; k != v10; ++k)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLDefaultConnectionManager _checkinConnection:](*(void *)(a1 + 32), *(void *)(*((void *)&v14 + 1) + 8 * k));
      }
      uint64_t v10 = [v3 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }
  [v3 removeAllObjects];
  return [v2 drain];
}

- (void)scheduleConnectionsBarrier:(id)a3
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = __Block_byref_object_copy__16;
  processingQueue = self->_processingQueue;
  uint64_t v10 = __Block_byref_object_dispose__16;
  uint64_t v11 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke;
  block[3] = &unk_1E544C9D8;
  block[4] = self;
  void block[5] = a3;
  block[6] = &v6;
  dispatch_barrier_sync(processingQueue, block);
  unint64_t v4 = (void *)v7[5];
  if (v4) {
    objc_exception_throw(v4);
  }
  _Block_object_dispose(&v6, 8);
}

uint64_t __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  intptr_t v3 = (void *)[MEMORY[0x1E4F1CA48] array];
  os_unfair_lock_lock_with_options();
  unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
  if (v4)
  {
    for (unint64_t i = 0; i < v4; ++i)
    {
      uint64_t v6 = -[NSSQLDefaultConnectionManager _checkoutConnectionOfType:](*(void *)(a1 + 32));
      if (v6)
      {
        [v3 addObject:v6];
      }
      else
      {
        os_unfair_lock_lock_with_options();
        unint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 32) count];
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 48));
      }
    }
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  uint64_t v7 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v7; ++j)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v3);
        }
        uint64_t v10 = *(void *)(*((void *)&v21 + 1) + 8 * j);
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke_2;
        v20[3] = &unk_1E544CA00;
        uint64_t v11 = *(void *)(a1 + 40);
        v20[4] = v10;
        v20[5] = v11;
        -[NSSQLiteConnection performAndWait:](v10, (uint64_t)v20);
      }
      uint64_t v7 = [v3 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v12 = [v3 countByEnumeratingWithState:&v16 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t k = 0; k != v12; ++k)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v3);
        }
        -[NSSQLDefaultConnectionManager _checkinConnection:](*(void *)(a1 + 32), *(void *)(*((void *)&v16 + 1) + 8 * k));
      }
      uint64_t v12 = [v3 countByEnumeratingWithState:&v16 objects:v25 count:16];
    }
    while (v12);
  }
  [v3 removeAllObjects];
  return [v2 drain];
}

uint64_t __60__NSSQLDefaultConnectionManager_scheduleConnectionsBarrier___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (void)enumerateAvailableConnectionsWithBlock:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F28B28]);
  p_connectionLocuint64_t k = &self->_connectionLock;
  os_unfair_lock_lock_with_options();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  availableConnections = self->_availableConnections;
  uint64_t v8 = [(NSMutableArray *)availableConnections countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(availableConnections);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v12[0] = MEMORY[0x1E4F143A8];
        v12[1] = 3221225472;
        v12[2] = __72__NSSQLDefaultConnectionManager_enumerateAvailableConnectionsWithBlock___block_invoke;
        v12[3] = &unk_1E544CA00;
        v12[4] = v11;
        void v12[5] = a3;
        -[NSSQLiteConnection performAndWait:](v11, (uint64_t)v12);
      }
      uint64_t v8 = [(NSMutableArray *)availableConnections countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  os_unfair_lock_unlock(p_connectionLock);
  [v5 drain];
}

uint64_t __72__NSSQLDefaultConnectionManager_enumerateAvailableConnectionsWithBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

@end