@interface KGGraphManager
- (BOOL)checkValidState;
- (BOOL)replaceFromGraph:(id)a3 error:(id *)a4;
- (KGGraphManager)initWithURL:(id)a3 entityFactory:(id)a4;
- (NSURL)url;
- (id)obtainReadOnlyStore:(id *)a3;
- (id)obtainReadWriteStore:(id *)a3;
- (void)asyncClose:(id)a3;
- (void)checkinReadOnlyStore:(id)a3;
- (void)close;
- (void)dealloc;
- (void)decrementReadCount;
- (void)doClose;
- (void)incrementReadCount;
- (void)performAsyncExclusiveBlock:(id)a3;
- (void)performAsyncReadBlock:(id)a3;
- (void)performAsyncWriteBlock:(id)a3;
- (void)performExclusiveBlock:(id)a3;
- (void)performReadBlock:(id)a3;
- (void)performWriteBlock:(id)a3;
- (void)setEntityFactory:(id)a3;
- (void)submitExclusiveBlock:(id)a3 async:(BOOL)a4;
- (void)submitReadBlock:(id)a3 async:(BOOL)a4;
- (void)submitWriteBlock:(id)a3 async:(BOOL)a4;
@end

@implementation KGGraphManager

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_readWriteStore, 0);
  objc_storeStrong((id *)&self->_readOnlyStores, 0);
  objc_storeStrong((id *)&self->_executionQueue, 0);
  objc_storeStrong((id *)&self->_readFeederQueue, 0);
  objc_storeStrong((id *)&self->_writeFeederQueue, 0);
  objc_storeStrong((id *)&self->_entityFactory, 0);
}

- (NSURL)url
{
  return self->_url;
}

- (void)performAsyncExclusiveBlock:(id)a3
{
}

- (void)performAsyncWriteBlock:(id)a3
{
}

- (void)performAsyncReadBlock:(id)a3
{
}

- (void)performExclusiveBlock:(id)a3
{
}

- (void)performWriteBlock:(id)a3
{
}

- (void)performReadBlock:(id)a3
{
}

- (BOOL)checkValidState
{
  os_unfair_lock_assert_owner(&self->_lock);
  int readRunningCount = self->_readRunningCount;
  if (readRunningCount >= 5 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v5 = 0;
    _os_log_error_impl(&dword_1D1654000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "invalid state", v5, 2u);
  }
  return readRunningCount < 5;
}

- (void)submitReadBlock:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  v7 = self;
  entityFactory = v7->_entityFactory;
  if (entityFactory) {
    v9 = entityFactory;
  }
  else {
    v9 = objc_alloc_init(KGLabelBasedEntityFactory);
  }
  v10 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __40__KGGraphManager_submitReadBlock_async___block_invoke;
  aBlock[3] = &unk_1E68DBE08;
  v11 = v7;
  v25 = v11;
  id v12 = v6;
  id v27 = v12;
  v13 = v10;
  v26 = v13;
  v14 = _Block_copy(aBlock);
  if (v4)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __40__KGGraphManager_submitReadBlock_async___block_invoke_13;
    v21[3] = &unk_1E68DBE30;
    v15 = (id *)&v22;
    v16 = v11;
    v22 = v16;
    id v23 = v14;
    v17 = _Block_copy(v21);
    dispatch_async(v16[5], v17);
  }
  else
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __40__KGGraphManager_submitReadBlock_async___block_invoke_2;
    v19[3] = &unk_1E68DBDB8;
    v15 = (id *)&v20;
    v18 = v11;
    v20 = v18;
    v17 = _Block_copy(v19);
    dispatch_sync(v18[5], v17);
    dispatch_sync(v18[6], v14);
  }
}

void __40__KGGraphManager_submitReadBlock_async___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v17 = 0;
  v3 = [v2 obtainReadOnlyStore:&v17];
  id v4 = v17;
  id v5 = v4;
  if (!v3)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:
    [*(id *)(a1 + 32) decrementReadCount];
    id v7 = v5;
    goto LABEL_13;
  }
  id v16 = v4;
  int v6 = [v3 beginTransactionWithError:&v16];
  id v7 = v16;

  if (v6)
  {
    v8 = [[KGGraph alloc] initWithImplementation:v3 entityFactory:*(void *)(a1 + 40)];
    int v9 = (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();

    if (v9)
    {
      id v15 = v7;
      char v10 = [v3 commitTransactionWithError:&v15];
      id v5 = v15;

      if ((v10 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      v11 = MEMORY[0x1E4F14500];
      id v12 = "database commit failed: %@";
    }
    else
    {
      id v14 = v7;
      int v13 = [v3 rollbackTransactionWithError:&v14];
      id v5 = v14;

      if ((v13 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
        goto LABEL_11;
      }
      *(_DWORD *)buf = 138412290;
      id v19 = v5;
      v11 = MEMORY[0x1E4F14500];
      id v12 = "database rollback failed: %@";
    }
    _os_log_error_impl(&dword_1D1654000, v11, OS_LOG_TYPE_ERROR, v12, buf, 0xCu);
LABEL_11:
    [*(id *)(a1 + 32) checkinReadOnlyStore:v3];

    goto LABEL_12;
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();

LABEL_13:
}

void __40__KGGraphManager_submitReadBlock_async___block_invoke_13(uint64_t a1)
{
  [*(id *)(a1 + 32) incrementReadCount];
  v2 = *(void **)(a1 + 40);
  v3 = *(NSObject **)(*(void *)(a1 + 32) + 48);
  dispatch_async(v3, v2);
}

uint64_t __40__KGGraphManager_submitReadBlock_async___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) incrementReadCount];
}

- (void)submitWriteBlock:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  entityFactory = v7->_entityFactory;
  if (entityFactory) {
    int v9 = entityFactory;
  }
  else {
    int v9 = objc_alloc_init(KGLabelBasedEntityFactory);
  }
  char v10 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __41__KGGraphManager_submitWriteBlock_async___block_invoke;
  aBlock[3] = &unk_1E68DBE08;
  v11 = v7;
  id v23 = v11;
  id v12 = v6;
  id v25 = v12;
  int v13 = v10;
  v24 = v13;
  id v14 = _Block_copy(aBlock);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __41__KGGraphManager_submitWriteBlock_async___block_invoke_11;
  v19[3] = &unk_1E68DBE30;
  id v15 = v11;
  uint64_t v20 = v15;
  id v16 = v14;
  id v21 = v16;
  id v17 = _Block_copy(v19);
  writeFeederQueue = v15->_writeFeederQueue;
  if (v4) {
    dispatch_async(writeFeederQueue, v17);
  }
  else {
    dispatch_sync(writeFeederQueue, v17);
  }
}

void __41__KGGraphManager_submitWriteBlock_async___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  id v18 = 0;
  v3 = [v2 obtainReadWriteStore:&v18];
  id v4 = v18;
  id v5 = v4;
  if (v3)
  {
    id v17 = v4;
    char v6 = [v3 beginTransactionWithError:&v17];
    id v7 = v17;

    if (v6)
    {
      v8 = [[KGMutableGraph alloc] initWithMutableImplementation:v3 entityFactory:a1[5]];
      int v9 = (*(uint64_t (**)(void))(a1[6] + 16))();

      if (v9)
      {
        id v16 = v7;
        char v10 = [v3 commitTransactionWithError:&v16];
        id v11 = v16;

        if ((v10 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        id v12 = MEMORY[0x1E4F14500];
        int v13 = "database commit failed: %@";
      }
      else
      {
        id v15 = v7;
        char v14 = [v3 rollbackTransactionWithError:&v15];
        id v11 = v15;

        if ((v14 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        id v12 = MEMORY[0x1E4F14500];
        int v13 = "database rollback failed: %@";
      }
      _os_log_error_impl(&dword_1D1654000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
LABEL_11:
      id v7 = v11;
      goto LABEL_12;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    id v7 = v5;
  }
LABEL_12:
}

void __41__KGGraphManager_submitWriteBlock_async___block_invoke_11(uint64_t a1)
{
}

- (void)submitExclusiveBlock:(id)a3 async:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = self;
  entityFactory = v7->_entityFactory;
  if (entityFactory) {
    int v9 = entityFactory;
  }
  else {
    int v9 = objc_alloc_init(KGLabelBasedEntityFactory);
  }
  char v10 = v9;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__KGGraphManager_submitExclusiveBlock_async___block_invoke;
  aBlock[3] = &unk_1E68DBE08;
  id v11 = v7;
  id v17 = v11;
  id v12 = v6;
  id v19 = v12;
  int v13 = v10;
  id v18 = v13;
  char v14 = _Block_copy(aBlock);
  executionQueue = v11->_executionQueue;
  if (v4) {
    dispatch_barrier_async(executionQueue, v14);
  }
  else {
    dispatch_barrier_sync(executionQueue, v14);
  }
}

void __45__KGGraphManager_submitExclusiveBlock_async___block_invoke(void *a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = (void *)a1[4];
  id v18 = 0;
  v3 = [v2 obtainReadWriteStore:&v18];
  id v4 = v18;
  id v5 = v4;
  if (v3)
  {
    id v17 = v4;
    char v6 = [v3 beginTransactionWithError:&v17];
    id v7 = v17;

    if (v6)
    {
      v8 = [[KGMutableGraph alloc] initWithMutableImplementation:v3 entityFactory:a1[5]];
      int v9 = (*(uint64_t (**)(void))(a1[6] + 16))();

      if (v9)
      {
        id v16 = v7;
        char v10 = [v3 commitTransactionWithError:&v16];
        id v11 = v16;

        if ((v10 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        id v12 = MEMORY[0x1E4F14500];
        int v13 = "database commit failed: %@";
      }
      else
      {
        id v15 = v7;
        char v14 = [v3 rollbackTransactionWithError:&v15];
        id v11 = v15;

        if ((v14 & 1) != 0 || !os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR)) {
          goto LABEL_11;
        }
        *(_DWORD *)buf = 138412290;
        id v20 = v11;
        id v12 = MEMORY[0x1E4F14500];
        int v13 = "database rollback failed: %@";
      }
      _os_log_error_impl(&dword_1D1654000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0xCu);
LABEL_11:
      id v7 = v11;
      goto LABEL_12;
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    (*(void (**)(void))(a1[6] + 16))();
    id v7 = v5;
  }
LABEL_12:
}

- (void)decrementReadCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int readRunningCount = self->_readRunningCount;
  self->_int readRunningCount = readRunningCount - 1;
  if (!self->_readFeeding && readRunningCount <= 4)
  {
    self->_readFeeding = 1;
    dispatch_resume((dispatch_object_t)self->_readFeederQueue);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)incrementReadCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  int readRunningCount = self->_readRunningCount;
  self->_int readRunningCount = readRunningCount + 1;
  if (readRunningCount >= 4) {
    __assert_rtn("-[KGGraphManager incrementReadCount]", "KGGraphManager.m", 250, "_readRunningCount <= kMaximumReaderCount");
  }
  if (readRunningCount == 3 && self->_readFeeding)
  {
    self->_readFeeding = 0;
    dispatch_suspend((dispatch_object_t)self->_readFeederQueue);
  }
  os_unfair_lock_unlock(p_lock);
}

- (BOOL)replaceFromGraph:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x2020000000;
  char v28 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  v22 = __Block_byref_object_copy__3356;
  id v23 = __Block_byref_object_dispose__3357;
  id v24 = 0;
  id v7 = self->_url;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__KGGraphManager_replaceFromGraph_error___block_invoke;
  block[3] = &unk_1E68DBDE0;
  block[4] = self;
  id v17 = &v25;
  id v8 = v6;
  id v15 = v8;
  int v9 = v7;
  id v16 = v9;
  id v18 = &v19;
  dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_barrier_sync((dispatch_queue_t)self->_executionQueue, v10);
  if (*((unsigned char *)v26 + 24))
  {
    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
    if (a4)
    {
      id v12 = (void *)v20[5];
      if (v12)
      {
        *a4 = v12;
        BOOL v11 = *((unsigned char *)v26 + 24) != 0;
      }
    }
  }

  _Block_object_dispose(&v19, 8);
  _Block_object_dispose(&v25, 8);

  return v11;
}

void __41__KGGraphManager_replaceFromGraph_error___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) doClose];
  v2 = [*(id *)(a1 + 40) store];
  uint64_t v3 = *(void *)(a1 + 48);
  id v7 = 0;
  char v4 = [v2 copyToURL:v3 error:&v7];
  id v5 = v7;
  id v6 = v7;
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = v4;

  if (!*(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24)) {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), v5);
  }
}

- (void)asyncClose:(id)a3
{
  uint64_t v3 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __29__KGGraphManager_asyncClose___block_invoke;
  block[3] = &unk_1E68DBDB8;
  id v7 = v3;
  char v4 = v3;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_barrier_async(v4[6], v5);
}

uint64_t __29__KGGraphManager_asyncClose___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doClose];
}

- (void)close
{
  v2 = self;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __23__KGGraphManager_close__block_invoke;
  block[3] = &unk_1E68DBDB8;
  id v6 = v2;
  uint64_t v3 = v2;
  dispatch_block_t v4 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_barrier_sync(v3[6], v4);
}

uint64_t __23__KGGraphManager_close__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) doClose];
}

- (void)doClose
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  readWriteStore = self->_readWriteStore;
  if (readWriteStore)
  {
    [(KGDegasGraphStore *)readWriteStore close];
    dispatch_block_t v4 = self->_readWriteStore;
    self->_readWriteStore = 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  dispatch_block_t v5 = self->_readOnlyStores;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * v9++), "close", (void)v11);
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  readOnlyStores = self->_readOnlyStores;
  self->_readOnlyStores = 0;

  *(_DWORD *)self->_readStoreBooking = 0;
  self->_closed = 1;
}

- (id)obtainReadWriteStore:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  p_readWriteStore = &self->_readWriteStore;
  if (!self->_readWriteStore)
  {
    uint64_t v7 = [[KGDegasGraphStore alloc] initWithURL:self->_url];
    id v13 = 0;
    BOOL v8 = [(KGDegasGraphStore *)v7 openWithMode:134 error:&v13];
    id v9 = v13;
    dispatch_block_t v10 = v9;
    if (v8)
    {
      objc_storeStrong((id *)&self->_readWriteStore, v7);
    }
    else if (a3)
    {
      *a3 = v9;
    }
  }
  if (self->_closed && *p_readWriteStore) {
    self->_closed = 0;
  }
  os_unfair_lock_unlock(p_lock);
  long long v11 = *p_readWriteStore;
  return v11;
}

- (void)checkinReadOnlyStore:(id)a3
{
  id v6 = a3;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = 0;
  while ([(NSMutableArray *)self->_readOnlyStores count] >= v4)
  {
    id v5 = [(NSMutableArray *)self->_readOnlyStores objectAtIndexedSubscript:v4];

    if (v5 == v6)
    {
      self->_readStoreBooking[v4] = 0;
      break;
    }
    if (++v4 == 4) {
      break;
    }
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)obtainReadOnlyStore:(id *)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_closed)
  {
    self->_closed = 0;
    id v6 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    readOnlyStores = self->_readOnlyStores;
    self->_readOnlyStores = v6;

    *(_DWORD *)self->_readStoreBooking = 0;
  }
  unint64_t v8 = 0;
  readStoreBooking = self->_readStoreBooking;
  while (readStoreBooking[v8])
  {
    if (++v8 == 4) {
      goto LABEL_15;
    }
  }
  if ([(NSMutableArray *)self->_readOnlyStores count] > v8)
  {
    dispatch_block_t v10 = [(NSMutableArray *)self->_readOnlyStores objectAtIndexedSubscript:v8];
LABEL_11:
    readStoreBooking[v8] = 1;
    goto LABEL_16;
  }
  dispatch_block_t v10 = [[KGDegasGraphStore alloc] initWithURL:self->_url];
  id v14 = 0;
  BOOL v11 = [(KGDegasGraphStore *)v10 openWithMode:1 error:&v14];
  id v12 = v14;
  if (v11)
  {
    [(NSMutableArray *)self->_readOnlyStores addObject:v10];

    goto LABEL_11;
  }

  if (a3) {
    *a3 = v12;
  }

LABEL_15:
  dispatch_block_t v10 = 0;
LABEL_16:
  os_unfair_lock_unlock(p_lock);
  return v10;
}

- (void)dealloc
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_readFeeding) {
    dispatch_resume((dispatch_object_t)self->_readFeederQueue);
  }
  os_unfair_lock_unlock(p_lock);
  v4.receiver = self;
  v4.super_class = (Class)KGGraphManager;
  [(KGGraphManager *)&v4 dealloc];
}

- (void)setEntityFactory:(id)a3
{
  id v8 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  entityFactory = self->_entityFactory;
  p_entityFactory = &self->_entityFactory;
  if (!entityFactory) {
    objc_storeStrong((id *)p_entityFactory, a3);
  }
  os_unfair_lock_unlock(p_lock);
}

- (KGGraphManager)initWithURL:(id)a3 entityFactory:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)KGGraphManager;
  id v9 = [(KGGraphManager *)&v24 init];
  dispatch_block_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_url, a3);
    objc_storeStrong((id *)&v10->_entityFactory, a4);
    v10->_int readRunningCount = 0;
    v10->_readFeeding = 1;
    v10->_closed = 0;
    v10->_lock._os_unfair_lock_opaque = 0;
    BOOL v11 = dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E4F14430], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v12 = dispatch_queue_attr_make_initially_inactive(v11);

    id v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    id v14 = dispatch_queue_attr_make_initially_inactive(v13);

    dispatch_queue_t v15 = dispatch_queue_create("com.apple.photos.knowledgegraph.execution", v12);
    executionQueue = v10->_executionQueue;
    v10->_executionQueue = (OS_dispatch_queue *)v15;

    dispatch_queue_t v17 = dispatch_queue_create("com.apple.photos.knowledgegraph.readfeeder", v14);
    readFeederQueue = v10->_readFeederQueue;
    v10->_readFeederQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_t v19 = dispatch_queue_create("com.apple.photos.knowledgegraph.writefeeder", v14);
    writeFeederQueue = v10->_writeFeederQueue;
    v10->_writeFeederQueue = (OS_dispatch_queue *)v19;

    dispatch_set_qos_class_fallback();
    dispatch_set_qos_class_fallback();
    dispatch_set_qos_class_fallback();
    dispatch_activate((dispatch_object_t)v10->_executionQueue);
    dispatch_activate((dispatch_object_t)v10->_readFeederQueue);
    dispatch_activate((dispatch_object_t)v10->_writeFeederQueue);
    *(_DWORD *)v10->_readStoreBooking = 0;
    uint64_t v21 = [objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
    readOnlyStores = v10->_readOnlyStores;
    v10->_readOnlyStores = (NSMutableArray *)v21;
  }
  return v10;
}

@end