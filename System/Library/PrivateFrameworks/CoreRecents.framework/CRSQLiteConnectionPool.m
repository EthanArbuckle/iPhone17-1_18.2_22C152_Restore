@interface CRSQLiteConnectionPool
- (CRSQLiteConnectionPool)initWithDelegate:(id)a3 maxConcurrentReaders:(unint64_t)a4;
- (CRSQLiteConnectionPoolDelegate)delegate;
- (id)_connectionForWriting:(BOOL)a3;
- (id)readerConnection;
- (id)writerConnection;
- (unint64_t)cacheSize;
- (unint64_t)maxConcurrentReaders;
- (unint64_t)maxConcurrentWriters;
- (unint64_t)readersWaiting;
- (unint64_t)writersWaiting;
- (void)checkInConnection:(id)a3;
- (void)dealloc;
- (void)flush;
- (void)setCacheSize:(unint64_t)a3;
- (void)setDelegate:(id)a3;
@end

@implementation CRSQLiteConnectionPool

- (id)_connectionForWriting:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = 88;
  if (a3) {
    uint64_t v5 = 104;
  }
  uint64_t v6 = 80;
  if (a3) {
    uint64_t v6 = 96;
  }
  v7 = *(NSObject **)((char *)&self->super.isa + v6);
  v8 = (atomic_uint *)((char *)self + v5);
  atomic_fetch_add((atomic_uint *volatile)((char *)self + v5), 1u);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  atomic_fetch_add(v8, 0xFFFFFFFF);
  [(NSLock *)self->_cacheLock lock];
  unint64_t cacheGeneration = self->_cacheGeneration;
  v10 = (_CRSQLiteConnectionWrapper *)[(NSMutableSet *)self->_cache anyObject];
  if (v10)
  {
    v11 = v10;
    [(NSMutableSet *)self->_cache removeObject:v10];
    [(NSLock *)self->_cacheLock unlock];
  }
  else
  {
    [(NSLock *)self->_cacheLock unlock];
    v11 = [[_CRSQLiteConnectionWrapper alloc] initWithConnection:[(CRSQLiteConnectionPoolDelegate *)self->_delegate newConnectionForConnectionPool:self] generation:cacheGeneration];
  }
  [(_CRSQLiteConnectionWrapper *)v11 setIsWriter:v3];
  [(NSLock *)self->_checkoutLock lock];
  CFDictionarySetValue(self->_checkoutMap, [(_CRSQLiteConnectionWrapper *)v11 connection], v11);
  [(NSLock *)self->_checkoutLock unlock];
  return [(_CRSQLiteConnectionWrapper *)v11 connection];
}

- (void)checkInConnection:(id)a3
{
  value = 0;
  [(NSLock *)self->_checkoutLock lock];
  if (CFDictionaryGetValueIfPresent(self->_checkoutMap, a3, (const void **)&value))
  {
    id v5 = value;
    CFDictionaryRemoveValue(self->_checkoutMap, a3);
  }
  [(NSLock *)self->_checkoutLock unlock];
  if (!value) {
    sub_10001B3F4();
  }
  unsigned int v6 = [value isWriter];
  [a3 flush];
  [(NSLock *)self->_cacheLock lock];
  if ((unint64_t)[(NSMutableSet *)self->_cache count] < self->_cacheSize
    && [value generation] == self->_cacheGeneration)
  {
    [(NSMutableSet *)self->_cache addObject:value];
    [(NSLock *)self->_cacheLock unlock];
    uint64_t v7 = 80;
    if (v6) {
      uint64_t v7 = 96;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)((char *)&self->super.isa + v7));
  }
  else
  {
    [(NSLock *)self->_cacheLock unlock];
    uint64_t v8 = 80;
    if (v6) {
      uint64_t v8 = 96;
    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)((char *)&self->super.isa + v8));
    [a3 close];
  }
}

- (id)readerConnection
{
  return [(CRSQLiteConnectionPool *)self _connectionForWriting:0];
}

- (CRSQLiteConnectionPool)initWithDelegate:(id)a3 maxConcurrentReaders:(unint64_t)a4
{
  v9.receiver = self;
  v9.super_class = (Class)CRSQLiteConnectionPool;
  unsigned int v6 = [(CRSQLiteConnectionPool *)&v9 init];
  uint64_t v7 = v6;
  if (v6)
  {
    if (!a4) {
      sub_10001B3C8();
    }
    v6->_delegate = (CRSQLiteConnectionPoolDelegate *)a3;
    v6->_cacheLock = (NSLock *)objc_alloc_init((Class)NSLock);
    v7->_checkoutLock = (NSLock *)objc_alloc_init((Class)NSLock);
    v7->_checkoutMap = CFDictionaryCreateMutable(0, 0, 0, &kCFTypeDictionaryValueCallBacks);
    v7->_maxConcurrentReaders = a4;
    v7->_maxConcurrentWriters = 1;
    v7->_writerSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(1);
    v7->_readerSemaphore = (OS_dispatch_semaphore *)dispatch_semaphore_create(v7->_maxConcurrentReaders);
  }
  return v7;
}

- (void)dealloc
{
  [(CRSQLiteConnectionPool *)self setCacheSize:0];

  CFRelease(self->_checkoutMap);
  dispatch_release((dispatch_object_t)self->_readerSemaphore);
  dispatch_release((dispatch_object_t)self->_writerSemaphore);
  v3.receiver = self;
  v3.super_class = (Class)CRSQLiteConnectionPool;
  [(CRSQLiteConnectionPool *)&v3 dealloc];
}

- (id)writerConnection
{
  return [(CRSQLiteConnectionPool *)self _connectionForWriting:1];
}

- (void)flush
{
  [(NSLock *)self->_cacheLock lock];
  if ([(NSMutableSet *)self->_cache count])
  {
    cache = self->_cache;
    self->_cache = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  else
  {
    cache = 0;
  }
  ++self->_cacheGeneration;
  [(NSLock *)self->_cacheLock unlock];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = [(NSMutableSet *)cache countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(cache);
        }
        objc_msgSend(objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "connection"), "close");
        uint64_t v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [(NSMutableSet *)cache countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setCacheSize:(unint64_t)a3
{
  id v5 = objc_alloc_init((Class)NSMutableSet);
  [(NSLock *)self->_cacheLock lock];
  while ((unint64_t)[(NSMutableSet *)self->_cache count] > a3)
  {
    id v6 = [(NSMutableSet *)self->_cache anyObject];
    [v5 addObject:v6];
    [(NSMutableSet *)self->_cache removeObject:v6];
  }
  if (a3 && !self->_cache) {
    self->_cache = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  }
  self->_cacheSize = a3;
  [(NSLock *)self->_cacheLock unlock];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      long long v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * (void)v10), "connection"), "close");
        long long v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
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
  return self->_maxConcurrentReaders;
}

- (unint64_t)maxConcurrentWriters
{
  return self->_maxConcurrentWriters;
}

- (unint64_t)readersWaiting
{
  return self->_readersWaiting;
}

- (unint64_t)writersWaiting
{
  return self->_writersWaiting;
}

- (CRSQLiteConnectionPoolDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (CRSQLiteConnectionPoolDelegate *)a3;
}

@end