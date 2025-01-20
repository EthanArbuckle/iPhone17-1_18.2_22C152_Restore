@interface CPLEngineStoreTransaction
+ (CPLEngineStoreTransaction)currentTransaction;
- (BOOL)_forWrite;
- (BOOL)canRead;
- (BOOL)canWrite;
- (BOOL)do:(id)a3;
- (BOOL)isLibraryClosed;
- (CPLEngineStore)store;
- (CPLEngineWriteTransactionBlocker)blocker;
- (NSError)error;
- (NSString)name;
- (id)description;
- (id)initForWrite:(BOOL)a3 store:(id)a4 identifier:(id)a5 description:(id)a6;
- (void)_releaseDirty;
- (void)_transactionDidFinish;
- (void)_transactionWillBeginOnThread:(id)a3;
- (void)addCleanupBlock:(id)a3;
- (void)dealloc;
- (void)setBlocker:(id)a3;
- (void)setError:(id)a3;
- (void)setName:(id)a3;
@end

@implementation CPLEngineStoreTransaction

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blocker, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_dirty, 0);
  objc_storeStrong((id *)&self->_cleanupBlocks, 0);
  objc_storeStrong((id *)&self->_currentThread, 0);
}

- (void)setBlocker:(id)a3
{
}

- (CPLEngineWriteTransactionBlocker)blocker
{
  return self->_blocker;
}

- (CPLEngineStore)store
{
  return self->_store;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setError:(id)a3
{
}

- (NSError)error
{
  return self->_error;
}

- (BOOL)isLibraryClosed
{
  error = self->_error;
  if (error) {
    LOBYTE(error) = [(NSError *)error isCPLErrorWithCode:2];
  }
  return (char)error;
}

- (id)description
{
  v2 = NSString;
  if (self->_forWrite) {
    v3 = " [WRITE]";
  }
  else {
    v3 = "";
  }
  v4 = [(CPLTransaction *)self->_dirty identifier];
  v5 = [v2 stringWithFormat:@"[TRANSACTION%s %@]", v3, v4];

  return v5;
}

- (BOOL)canRead
{
  v3 = [MEMORY[0x1E4F29060] currentThread];
  LOBYTE(self) = v3 == self->_currentThread;

  return (char)self;
}

- (BOOL)canWrite
{
  if (!self->_forWrite) {
    return 0;
  }
  v3 = [MEMORY[0x1E4F29060] currentThread];
  BOOL v4 = v3 == self->_currentThread;

  return v4;
}

- (void)addCleanupBlock:(id)a3
{
  id v4 = a3;
  cleanupBlocks = self->_cleanupBlocks;
  id v10 = v4;
  if (!cleanupBlocks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_cleanupBlocks;
    self->_cleanupBlocks = v6;

    id v4 = v10;
    cleanupBlocks = self->_cleanupBlocks;
  }
  v8 = (void *)[v4 copy];
  v9 = (void *)MEMORY[0x1BA994060]();
  [(NSMutableArray *)cleanupBlocks addObject:v9];
}

- (void)_releaseDirty
{
  [(CPLTransaction *)self->_dirty endTransaction];
  dirty = self->_dirty;
  self->_dirty = 0;
}

- (void)dealloc
{
  [(CPLTransaction *)self->_dirty endTransaction];
  v3.receiver = self;
  v3.super_class = (Class)CPLEngineStoreTransaction;
  [(CPLEngineStoreTransaction *)&v3 dealloc];
}

- (void)_transactionDidFinish
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  currentThread = self->_currentThread;
  self->_currentThread = 0;

  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(NSMutableArray *)self->_cleanupBlocks reverseObjectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v10 + 1) + 8 * v8++) + 16))();
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  cleanupBlocks = self->_cleanupBlocks;
  self->_cleanupBlocks = 0;
}

- (void)_transactionWillBeginOnThread:(id)a3
{
  uint64_t v5 = (NSThread *)a3;
  if (self->_currentThread)
  {
    if (!_CPLSilentLogging)
    {
      uint64_t v6 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1B4CAC000, v6, OS_LOG_TYPE_ERROR, "Trying to set transaction thread twice", v9, 2u);
      }
    }
    uint64_t v7 = [MEMORY[0x1E4F28B00] currentHandler];
    uint64_t v8 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    [v7 handleFailureInMethod:a2 object:self file:v8 lineNumber:2537 description:@"Trying to set transaction thread twice"];

    abort();
  }
  self->_currentThread = v5;
  MEMORY[0x1F41817F8]();
}

- (BOOL)do:(id)a3
{
  p_error = &self->_error;
  if (self->_error) {
    return 0;
  }
  id v8 = 0;
  char v4 = (*((uint64_t (**)(id, id *))a3 + 2))(a3, &v8);
  id v5 = v8;
  id v6 = v8;
  if ((v4 & 1) == 0 && !*p_error) {
    objc_storeStrong((id *)p_error, v5);
  }

  return v4;
}

- (BOOL)_forWrite
{
  return self->_forWrite;
}

- (id)initForWrite:(BOOL)a3 store:(id)a4 identifier:(id)a5 description:(id)a6
{
  BOOL v9 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)CPLEngineStoreTransaction;
  v14 = [(CPLEngineStoreTransaction *)&v19 init];
  uint64_t v15 = v14;
  if (v14)
  {
    v14->_forWrite = v9;
    objc_storeStrong((id *)&v14->_store, a4);
    v16 = +[CPLTransaction newTransactionWithIdentifier:v12 description:v13 keepPower:v9];
    dirty = v15->_dirty;
    v15->_dirty = v16;
  }
  return v15;
}

+ (CPLEngineStoreTransaction)currentTransaction
{
  char v4 = [MEMORY[0x1E4F29060] currentThread];
  id v5 = [v4 threadDictionary];
  id v6 = [v5 objectForKey:@"com.apple.cloudphotolibrary.currenttransaction"];

  if (!v6)
  {
    if (!_CPLSilentLogging)
    {
      id v8 = __CPLStoreOSLogDomain_2929();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)id v11 = 0;
        _os_log_impl(&dword_1B4CAC000, v8, OS_LOG_TYPE_ERROR, "Trying to get the current transaction outside of any transaction", v11, 2u);
      }
    }
    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    long long v10 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Storage/CPLEngineStore.m"];
    [v9 handleFailureInMethod:a2 object:a1 file:v10 lineNumber:2496 description:@"Trying to get the current transaction outside of any transaction"];

    abort();
  }

  return (CPLEngineStoreTransaction *)v6;
}

@end