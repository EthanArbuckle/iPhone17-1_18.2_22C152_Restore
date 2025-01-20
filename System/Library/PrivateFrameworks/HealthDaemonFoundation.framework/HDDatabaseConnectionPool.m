@interface HDDatabaseConnectionPool
- (HDDatabaseConnectionPool)initWithConcurrentReaderLimit:(int64_t)a3 delegate:(id)a4;
- (HDDatabaseConnectionPoolDelegate)delegate;
- (char)_semaphoreForCheckOutOptions:(char *)a1;
- (id)_removeDatabaseFromCheckoutMap:(uint64_t)a1;
- (id)checkOutConnectionWithOptions:(unint64_t)a3 error:(id *)a4;
- (id)currentFlushGroup;
- (id)diagnosticDescription;
- (id)flush;
- (int64_t)cacheSize;
- (int64_t)checkedOutDatabaseCount;
- (int64_t)concurrentReaderLimit;
- (int64_t)count;
- (void)_addDatabaseWrapperToCheckoutMap:(uint64_t)a1;
- (void)_didFlushDatabases:(uint64_t)a1;
- (void)checkInConnection:(id)a3 flushImmediately:(BOOL)a4;
- (void)dealloc;
@end

@implementation HDDatabaseConnectionPool

- (int64_t)checkedOutDatabaseCount
{
  p_checkoutLock = &self->_checkoutLock;
  os_unfair_lock_lock(&self->_checkoutLock);
  int64_t v4 = [(NSMapTable *)self->_checkoutMap count];
  os_unfair_lock_unlock(p_checkoutLock);
  return v4;
}

- (void)checkInConnection:(id)a3 flushImmediately:(BOOL)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v7 = a3;
  uint64_t v8 = -[HDDatabaseConnectionPool _removeDatabaseFromCheckoutMap:]((uint64_t)self, v7);
  v9 = (void *)v8;
  if (v8)
  {
    a2 = *(SEL *)(v8 + 40);
  }
  else
  {
    v15 = [MEMORY[0x263F08690] currentHandler];
    [v15 handleFailureInMethod:a2, self, @"HDDatabaseConnectionPool.m", 191, @"Invalid parameter not satisfying: %@", @"databaseWrapper != nil" object file lineNumber description];

    LOBYTE(a2) = 0;
  }
  [(NSCondition *)self->_cacheCondition lock];
  if (a4
    || (unint64_t)[(NSMutableSet *)self->_cache count] >= self->_cacheSize
    || (!v9 ? (uint64_t v10 = 0) : (uint64_t v10 = v9[3]), v10 != self->_cacheGeneration))
  {
    atomic_fetch_add(&self->_count, 0xFFFFFFFF);
    [(NSCondition *)self->_cacheCondition signal];
    [(NSCondition *)self->_cacheCondition unlock];
    v16[0] = v7;
    v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    -[HDDatabaseConnectionPool _didFlushDatabases:]((uint64_t)self, v11);
  }
  else
  {
    [(NSMutableSet *)self->_cache addObject:v9];
    [(NSCondition *)self->_cacheCondition signal];
    [(NSCondition *)self->_cacheCondition unlock];
  }
  if (v9) {
    v12 = v9[2];
  }
  else {
    v12 = 0;
  }
  dispatch_group_leave(v12);
  v13 = -[HDDatabaseConnectionPool _semaphoreForCheckOutOptions:]((char *)self, (char)a2);
  v14 = v13;
  if (v13) {
    dispatch_semaphore_signal(v13);
  }
}

- (id)checkOutConnectionWithOptions:(unint64_t)a3 error:(id *)a4
{
  if ((~(_BYTE)a3 & 0xC) == 0)
  {
    v19 = [MEMORY[0x263F08690] currentHandler];
    [v19 handleFailureInMethod:a2 object:self file:@"HDDatabaseConnectionPool.m" lineNumber:129 description:@"Cannot both prefer a cached connection and require a new one."];
  }
  id v7 = -[HDDatabaseConnectionPool _semaphoreForCheckOutOptions:]((char *)self, a3);
  uint64_t v8 = v7;
  if (v7) {
    dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  }
  [(NSCondition *)self->_cacheCondition lock];
  cacheGeneration = (void *)self->_cacheGeneration;
  uint64_t v10 = self->_flushGroup;
  if ((a3 & 4) != 0)
  {
    while (![(NSMutableSet *)self->_cache count]
         && (void *)self->_cacheGeneration == cacheGeneration
         && [(HDDatabaseConnectionPool *)self count] >= 1)
      [(NSCondition *)self->_cacheCondition wait];
  }
  if ((a3 & 8) != 0)
  {
    v11 = 0;
  }
  else
  {
    v11 = [(NSMutableSet *)self->_cache anyObject];
    if (v11) {
      [(NSMutableSet *)self->_cache removeObject:v11];
    }
  }
  dispatch_group_enter((dispatch_group_t)v10);
  [(NSCondition *)self->_cacheCondition unlock];
  if (v11) {
    goto LABEL_17;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v13 = (void *)[WeakRetained newConnectionForPool:self error:a4];

  if (v13)
  {
    atomic_fetch_add(&self->_count, 1u);
    v11 = (__uint64_t *)-[_HDDatabaseConnectionWrapper initWithConnection:flushGroup:generation:]((id *)[_HDDatabaseConnectionWrapper alloc], v13, v10, cacheGeneration);

    if (!v11)
    {
      -[HDDatabaseConnectionPool _addDatabaseWrapperToCheckoutMap:]((uint64_t)self, 0);
      v15 = 0;
      goto LABEL_18;
    }
LABEL_17:
    v14 = pthread_self();
    pthread_threadid_np(v14, v11 + 4);
    v11[5] = a3;
    -[HDDatabaseConnectionPool _addDatabaseWrapperToCheckoutMap:]((uint64_t)self, v11);
    v15 = (void *)v11[1];
LABEL_18:
    id v16 = v15;

    goto LABEL_19;
  }
  dispatch_group_leave((dispatch_group_t)v10);
  if (v8) {
    dispatch_semaphore_signal(v8);
  }
  id v16 = 0;
LABEL_19:

  return v16;
}

- (char)_semaphoreForCheckOutOptions:(char *)a1
{
  if (!a1)
  {
LABEL_7:
    return a1;
  }
  if (a2)
  {
    uint64_t v3 = 80;
    goto LABEL_6;
  }
  if ((a2 & 2) == 0)
  {
    uint64_t v3 = 72;
LABEL_6:
    a1 = (char *)*(id *)&a1[v3];
    goto LABEL_7;
  }
  a1 = 0;
  return a1;
}

- (void)_addDatabaseWrapperToCheckoutMap:(uint64_t)a1
{
  if (a1)
  {
    uint64_t v3 = (os_unfair_lock_s *)(a1 + 60);
    int64_t v4 = a2;
    os_unfair_lock_lock(v3);
    if (v4) {
      uint64_t v5 = v4[1];
    }
    else {
      uint64_t v5 = 0;
    }
    [*(id *)(a1 + 64) setObject:v4 forKey:v5];

    os_unfair_lock_unlock(v3);
  }
}

- (id)_removeDatabaseFromCheckoutMap:(uint64_t)a1
{
  id v3 = a2;
  if (a1)
  {
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 60));
    int64_t v4 = [*(id *)(a1 + 64) objectForKey:v3];
    if (v4) {
      [*(id *)(a1 + 64) removeObjectForKey:v3];
    }
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 60));
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (int64_t)cacheSize
{
  return self->_cacheSize;
}

- (int64_t)count
{
  return (int)atomic_load((unsigned int *)&self->_count);
}

- (HDDatabaseConnectionPool)initWithConcurrentReaderLimit:(int64_t)a3 delegate:(id)a4
{
  id v7 = a4;
  v24.receiver = self;
  v24.super_class = (Class)HDDatabaseConnectionPool;
  uint64_t v8 = [(HDDatabaseConnectionPool *)&v24 init];
  if (v8)
  {
    if (a3 <= 0)
    {
      v23 = [MEMORY[0x263F08690] currentHandler];
      [v23 handleFailureInMethod:a2, v8, @"HDDatabaseConnectionPool.m", 70, @"Invalid parameter not satisfying: %@", @"concurrentReaderLimit > 0" object file lineNumber description];
    }
    objc_storeWeak((id *)&v8->_delegate, v7);
    v9 = (NSCondition *)objc_alloc_init(MEMORY[0x263F08740]);
    cacheCondition = v8->_cacheCondition;
    v8->_cacheCondition = v9;

    v8->_cacheSize = a3 + 1;
    v11 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    cache = v8->_cache;
    v8->_cache = v11;

    dispatch_group_t v13 = dispatch_group_create();
    flushGroup = v8->_flushGroup;
    v8->_flushGroup = (OS_dispatch_group *)v13;

    v8->_checkoutLock._os_unfair_lock_opaque = 0;
    uint64_t v15 = [MEMORY[0x263F08968] weakToStrongObjectsMapTable];
    checkoutMap = v8->_checkoutMap;
    v8->_checkoutMap = (NSMapTable *)v15;

    v8->_concurrentReaderLimit = a3;
    dispatch_semaphore_t v17 = dispatch_semaphore_create(1);
    writerSemaphore = v8->_writerSemaphore;
    v8->_writerSemaphore = (OS_dispatch_semaphore *)v17;

    dispatch_semaphore_t v19 = dispatch_semaphore_create(v8->_concurrentReaderLimit);
    readerSemaphore = v8->_readerSemaphore;
    v8->_readerSemaphore = (OS_dispatch_semaphore *)v19;

    v21 = +[HDDiagnosticManager sharedDiagnosticManager];
    [v21 addObject:v8];
  }
  return v8;
}

- (void)dealloc
{
  id v3 = [(HDDatabaseConnectionPool *)self flush];
  int64_t v4 = +[HDDiagnosticManager sharedDiagnosticManager];
  [v4 removeObject:self];

  v5.receiver = self;
  v5.super_class = (Class)HDDatabaseConnectionPool;
  [(HDDatabaseConnectionPool *)&v5 dealloc];
}

- (int64_t)concurrentReaderLimit
{
  return self->_concurrentReaderLimit;
}

- (void)_didFlushDatabases:(uint64_t)a1
{
  id v4 = a2;
  if (a1 && [v4 count])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
    [WeakRetained databasePool:a1 didFlushConnections:v4];
  }
}

- (id)flush
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  [(NSCondition *)self->_cacheCondition lock];
  if ([(NSMutableSet *)self->_cache count])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = self->_cache;
    uint64_t v5 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void *)(*((void *)&v18 + 1) + 8 * v8);
          if (v9) {
            uint64_t v10 = *(void *)(v9 + 8);
          }
          else {
            uint64_t v10 = 0;
          }
          objc_msgSend(v3, "addObject:", v10, (void)v18);
          ++v8;
        }
        while (v6 != v8);
        uint64_t v11 = [(NSMutableSet *)v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
        uint64_t v6 = v11;
      }
      while (v11);
    }

    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    cache = self->_cache;
    self->_cache = v12;
  }
  v14 = self->_flushGroup;
  uint64_t v15 = (OS_dispatch_group *)dispatch_group_create();
  flushGroup = self->_flushGroup;
  self->_flushGroup = v15;

  ++self->_cacheGeneration;
  atomic_fetch_add(&self->_count, -(int)[v3 count]);
  [(NSCondition *)self->_cacheCondition broadcast];
  [(NSCondition *)self->_cacheCondition unlock];
  -[HDDatabaseConnectionPool _didFlushDatabases:]((uint64_t)self, v3);

  return v14;
}

- (id)currentFlushGroup
{
  [(NSCondition *)self->_cacheCondition lock];
  id v3 = self->_flushGroup;
  [(NSCondition *)self->_cacheCondition unlock];

  return v3;
}

- (id)diagnosticDescription
{
  uint64_t v42 = *MEMORY[0x263EF8340];
  id v3 = [MEMORY[0x263F089D8] string];
  p_checkoutLock = &self->_checkoutLock;
  os_unfair_lock_lock(&self->_checkoutLock);
  if ([(NSMapTable *)self->_checkoutMap count])
  {
    v29 = &self->_checkoutLock;
    objc_msgSend(v3, "appendFormat:", @"\n\t%lu connections in use:", -[NSMapTable count](self->_checkoutMap, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v30 = self;
    id obj = [(NSMapTable *)self->_checkoutMap objectEnumerator];
    uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v37;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v37 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void **)(*((void *)&v36 + 1) + 8 * v8);
          if (v9)
          {
            uint64_t v10 = v9[4];
            uint64_t v11 = objc_opt_class();
            uint64_t v12 = v9[5];
            dispatch_group_t v13 = @"reader (high prio)";
            if ((v12 & 2) == 0) {
              dispatch_group_t v13 = @"reader";
            }
            if (v12) {
              v14 = @"writer";
            }
            else {
              v14 = v13;
            }
            uint64_t v15 = v14;
            uint64_t v16 = v9[1];
          }
          else
          {
            uint64_t v11 = objc_opt_class();
            uint64_t v15 = 0;
            uint64_t v10 = 0;
            uint64_t v16 = 0;
          }
          [v3 appendFormat:@"\n\t\t<%@:%p>: %@ %p on thread 0x%X (%llu)", v11, v9, v15, v16, v10, v10];

          ++v8;
        }
        while (v6 != v8);
        uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v41 count:16];
        uint64_t v6 = v17;
      }
      while (v17);
    }

    [v3 appendString:@"\n"];
    p_checkoutLock = v29;
    self = v30;
  }
  os_unfair_lock_unlock(p_checkoutLock);
  [(NSCondition *)self->_cacheCondition lock];
  uint64_t v18 = [(NSMutableSet *)self->_cache count];
  if (v18)
  {
    long long v19 = "s";
    if (v18 == 1) {
      long long v19 = "";
    }
    objc_msgSend(v3, "appendFormat:", @"\n\t%lu cached connection%s:", v18, v19);
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v20 = self->_cache;
    uint64_t v21 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
    if (v21)
    {
      uint64_t v22 = v21;
      uint64_t v23 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v33 != v23) {
            objc_enumerationMutation(v20);
          }
          v25 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          if (v25) {
            v25 = (void *)v25[1];
          }
          v26 = v25;
          [v3 appendFormat:@"\n\t\t<%@:%p>", objc_opt_class(), v26];
        }
        uint64_t v22 = [(NSMutableSet *)v20 countByEnumeratingWithState:&v32 objects:v40 count:16];
      }
      while (v22);
    }

    v27 = @"\n";
  }
  else
  {
    v27 = @"\n\tNo cached connections\n";
  }
  [v3 appendString:v27];
  [(NSCondition *)self->_cacheCondition unlock];

  return v3;
}

- (HDDatabaseConnectionPoolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (HDDatabaseConnectionPoolDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_writerSemaphore, 0);
  objc_storeStrong((id *)&self->_readerSemaphore, 0);
  objc_storeStrong((id *)&self->_checkoutMap, 0);
  objc_storeStrong((id *)&self->_flushGroup, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_cacheCondition, 0);
}

@end