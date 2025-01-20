@interface EDPersistenceDatabaseConnectionPool
- (BOOL)_lockForConnectionType:(unint64_t)a3 resource:(id *)a4;
- (EDPersistenceDatabaseConnectionPool)init;
- (EDPersistenceDatabaseConnectionPool)initWithDelegate:(id)a3 maxConcurrentBackgroundReaders:(unint64_t)a4;
- (EDPersistenceDatabaseConnectionPoolDelegate)delegate;
- (id)_connectionWithType:(unint64_t)a3;
- (id)backgroundReaderConnection;
- (id)readerConnection;
- (id)writerConnection;
- (unint64_t)backgroundReadersWaiting;
- (unint64_t)cacheSize;
- (unint64_t)maxConcurrentBackgroundReaders;
- (unint64_t)maxConcurrentReaders;
- (unint64_t)writersWaiting;
- (void)_unlockForConnectionType:(unint64_t)a3 resource:(id)a4;
- (void)checkInConnection:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)setCacheSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation EDPersistenceDatabaseConnectionPool

- (void)checkInConnection:(id)a3
{
  id v9 = a3;
  [(NSLock *)self->_checkoutLock lock];
  v5 = [(NSMapTable *)self->_checkoutMap objectForKey:v9];
  if (v5) {
    [(NSMapTable *)self->_checkoutMap removeObjectForKey:v9];
  }
  [(NSLock *)self->_checkoutLock unlock];
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2 object:self file:@"EDPersistenceDatabaseConnectionPool.m" lineNumber:200 description:@"No connection wrapper found"];
  }
  uint64_t v6 = [v5 type];
  v7 = [v5 resource];
  [(NSLock *)self->_cacheLock lock];
  if ([v5 generation] == self->_cacheGeneration)
  {
    if ([v9 isWriter])
    {
      objc_storeStrong((id *)&self->_writerConnection, v5);
    }
    else if ([(NSMutableSet *)self->_cache count] < self->_cacheSize)
    {
      [(NSMutableSet *)self->_cache addObject:v5];
    }
  }
  else
  {
    [v9 close];
  }
  [(NSLock *)self->_cacheLock unlock];
  [(EDPersistenceDatabaseConnectionPool *)self _unlockForConnectionType:v6 resource:v7];
}

- (void)_unlockForConnectionType:(unint64_t)a3 resource:(id)a4
{
  id v6 = a4;
  id v7 = v6;
  if (a3 == 2)
  {
    [(EFResourcePool *)self->_backgroundReaderResources releaseResource:v6];
  }
  else if (!a3)
  {
    [(NSLock *)self->_writerLock unlock];
  }
}

- (id)_connectionWithType:(unint64_t)a3
{
  id v14 = 0;
  BOOL v5 = [(EDPersistenceDatabaseConnectionPool *)self _lockForConnectionType:a3 resource:&v14];
  id v6 = v14;
  [(NSLock *)self->_cacheLock lock];
  unint64_t cacheGeneration = self->_cacheGeneration;
  if (v5)
  {
    v8 = self->_writerConnection;
    writerConnection = self->_writerConnection;
    self->_writerConnection = 0;
  }
  else
  {
    uint64_t v10 = [(NSMutableSet *)self->_cache anyObject];
    if (v10)
    {
      v8 = (_EDPersistenceDatabaseConnectionWrapper *)v10;
      -[NSMutableSet removeObject:](self->_cache, "removeObject:");
    }
    else
    {
      v8 = 0;
    }
  }
  [(NSLock *)self->_cacheLock unlock];
  if (v8)
  {
    v11 = [(_EDPersistenceDatabaseConnectionWrapper *)v8 connection];
    if (!v11) {
      goto LABEL_13;
    }
LABEL_11:
    [(_EDPersistenceDatabaseConnectionWrapper *)v8 setType:a3];
    [(_EDPersistenceDatabaseConnectionWrapper *)v8 setResource:v6];
    [(NSLock *)self->_checkoutLock lock];
    [(NSMapTable *)self->_checkoutMap setObject:v8 forKey:v11];
    [(NSLock *)self->_checkoutLock unlock];
    goto LABEL_14;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v11 = [WeakRetained openConnectionIsWriter:v5];

  if ([v11 isValid])
  {
    v8 = [[_EDPersistenceDatabaseConnectionWrapper alloc] initWithConnection:v11 generation:cacheGeneration];
    if (v11) {
      goto LABEL_11;
    }
  }
  else
  {

    v8 = 0;
  }
LABEL_13:
  v11 = 0;
  [(EDPersistenceDatabaseConnectionPool *)self _unlockForConnectionType:a3 resource:v6];
LABEL_14:

  return v11;
}

- (BOOL)_lockForConnectionType:(unint64_t)a3 resource:(id *)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    unsigned int add = atomic_fetch_add(&self->_backgroundReadersWaiting, 1u);
    v12 = _ef_log_EDPersistenceDatabaseConnectionPool();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109120;
      unsigned int v16 = add + 1;
      _os_log_impl(&dword_1DB39C000, v12, OS_LOG_TYPE_INFO, "waiting for background read connection (%d waiters)", (uint8_t *)&v15, 8u);
    }

    *a4 = [(EFResourcePool *)self->_backgroundReaderResources acquireResource];
    unsigned int v13 = atomic_fetch_add(&self->_backgroundReadersWaiting, 0xFFFFFFFF);
    v8 = _ef_log_EDPersistenceDatabaseConnectionPool();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v15 = 67109120;
      unsigned int v16 = v13 - 1;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_INFO, "acquired background read connection (%d waiters)", (uint8_t *)&v15, 8u);
    }
    BOOL v9 = 0;
  }
  else
  {
    if (a3) {
      return 0;
    }
    unsigned int v5 = atomic_fetch_add(&self->_writersWaiting, 1u);
    id v6 = _ef_log_EDPersistenceDatabaseConnectionPool();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      unsigned int v16 = v5 + 1;
      _os_log_impl(&dword_1DB39C000, v6, OS_LOG_TYPE_DEFAULT, "waiting for write connection (%d waiters)", (uint8_t *)&v15, 8u);
    }

    [(NSLock *)self->_writerLock lock];
    unsigned int v7 = atomic_fetch_add(&self->_writersWaiting, 0xFFFFFFFF);
    v8 = _ef_log_EDPersistenceDatabaseConnectionPool();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 67109120;
      unsigned int v16 = v7 - 1;
      _os_log_impl(&dword_1DB39C000, v8, OS_LOG_TYPE_DEFAULT, "acquired write connection (%d waiters)", (uint8_t *)&v15, 8u);
    }
    BOOL v9 = 1;
  }

  return v9;
}

- (id)backgroundReaderConnection
{
  return [(EDPersistenceDatabaseConnectionPool *)self _connectionWithType:2];
}

- (id)readerConnection
{
  return [(EDPersistenceDatabaseConnectionPool *)self _connectionWithType:1];
}

- (id)writerConnection
{
  return [(EDPersistenceDatabaseConnectionPool *)self _connectionWithType:0];
}

void ___ef_log_EDPersistenceDatabaseConnectionPool_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.email", "EDPersistenceDatabaseConnectionPool");
  v1 = (void *)_ef_log_EDPersistenceDatabaseConnectionPool_log;
  _ef_log_EDPersistenceDatabaseConnectionPool_log = (uint64_t)v0;
}

- (EDPersistenceDatabaseConnectionPool)init
{
}

- (EDPersistenceDatabaseConnectionPool)initWithDelegate:(id)a3 maxConcurrentBackgroundReaders:(unint64_t)a4
{
  id v7 = a3;
  v21.receiver = self;
  v21.super_class = (Class)EDPersistenceDatabaseConnectionPool;
  v8 = [(EDPersistenceDatabaseConnectionPool *)&v21 init];
  if (v8)
  {
    if (!a4)
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      [v20 handleFailureInMethod:a2, v8, @"EDPersistenceDatabaseConnectionPool.m", 69, @"Invalid parameter not satisfying: %@", @"maxConcurrentBackgroundReaders > 0" object file lineNumber description];
    }
    objc_storeWeak((id *)&v8->_delegate, v7);
    BOOL v9 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    cacheLock = v8->_cacheLock;
    v8->_cacheLock = v9;

    v11 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    checkoutLock = v8->_checkoutLock;
    v8->_checkoutLock = v11;

    uint64_t v13 = [MEMORY[0x1E4F28E10] weakToStrongObjectsMapTable];
    checkoutMap = v8->_checkoutMap;
    v8->_checkoutMap = (NSMapTable *)v13;

    int v15 = (NSLock *)objc_alloc_init(MEMORY[0x1E4F28E08]);
    writerLock = v8->_writerLock;
    v8->_writerLock = v15;

    v8->_maxConcurrentBackgroundReaders = a4;
    uint64_t v17 = [objc_alloc(MEMORY[0x1E4F60E38]) initWithCount:v8->_maxConcurrentBackgroundReaders];
    backgroundReaderResources = v8->_backgroundReaderResources;
    v8->_backgroundReaderResources = (EFResourcePool *)v17;

    [(EDPersistenceDatabaseConnectionPool *)v8 setCacheSize:v8->_maxConcurrentBackgroundReaders];
  }

  return v8;
}

- (void)dealloc
{
  [(EDPersistenceDatabaseConnectionPool *)self setCacheSize:0];
  v3 = [(_EDPersistenceDatabaseConnectionWrapper *)self->_writerConnection connection];
  [v3 close];

  v4.receiver = self;
  v4.super_class = (Class)EDPersistenceDatabaseConnectionPool;
  [(EDPersistenceDatabaseConnectionPool *)&v4 dealloc];
}

- (void)flush
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(NSLock *)self->_cacheLock lock];
  if ([(NSMutableSet *)self->_cache count])
  {
    [v3 unionSet:self->_cache];
    objc_super v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cache = self->_cache;
    self->_cache = v4;
  }
  if (self->_writerConnection)
  {
    objc_msgSend(v3, "addObject:");
    writerConnection = self->_writerConnection;
    self->_writerConnection = 0;
  }
  ++self->_cacheGeneration;
  [(NSLock *)self->_cacheLock unlock];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v13;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10), "connection", (void)v12);
        [v11 close];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
}

- (void)setCacheSize:(unint64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  [(NSLock *)self->_cacheLock lock];
  while ([(NSMutableSet *)self->_cache count] > a3)
  {
    id v6 = [(NSMutableSet *)self->_cache anyObject];
    [v5 addObject:v6];
    [(NSMutableSet *)self->_cache removeObject:v6];
  }
  if (a3 && !self->_cache)
  {
    id v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    cache = self->_cache;
    self->_cache = v7;
  }
  self->_cacheSize = a3;
  [(NSLock *)self->_cacheLock unlock];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v5;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * v12), "connection", (void)v14);
        [v13 close];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }
}

- (unint64_t)cacheSize
{
  [(NSLock *)self->_cacheLock lock];
  unint64_t cacheSize = self->_cacheSize;
  [(NSLock *)self->_cacheLock unlock];
  return cacheSize;
}

- (unint64_t)maxConcurrentReaders
{
  return self->_maxConcurrentBackgroundReaders;
}

- (unint64_t)backgroundReadersWaiting
{
  return self->_backgroundReadersWaiting;
}

- (unint64_t)writersWaiting
{
  return self->_writersWaiting;
}

- (EDPersistenceDatabaseConnectionPoolDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (EDPersistenceDatabaseConnectionPoolDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (unint64_t)maxConcurrentBackgroundReaders
{
  return self->_maxConcurrentBackgroundReaders;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backgroundReaderResources, 0);
  objc_storeStrong((id *)&self->_writerConnection, 0);
  objc_storeStrong((id *)&self->_writerLock, 0);
  objc_storeStrong((id *)&self->_checkoutMap, 0);
  objc_storeStrong((id *)&self->_checkoutLock, 0);
  objc_storeStrong((id *)&self->_cache, 0);

  objc_storeStrong((id *)&self->_cacheLock, 0);
}

@end