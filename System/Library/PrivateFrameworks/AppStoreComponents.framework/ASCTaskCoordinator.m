@interface ASCTaskCoordinator
+ (OS_os_log)log;
- (ASCTaskCoordinator)initWithName:(id)a3;
- (BOOL)hasTaskForKey:(id)a3;
- (NSCache)loadedResults;
- (NSMutableDictionary)pendingResults;
- (NSRecursiveLock)consistencyLock;
- (NSString)name;
- (id)taskForKey:(id)a3;
- (id)taskForKey:(id)a3 withCreatorBlock:(id)a4;
- (void)removeAllFinishedTasks;
- (void)removeTaskForKey:(id)a3;
- (void)taskForKey:(id)a3 didCompleteWithResult:(id)a4;
- (void)taskForKey:(id)a3 didFailWithError:(id)a4;
- (void)withLock:(id)a3;
@end

@implementation ASCTaskCoordinator

+ (OS_os_log)log
{
  if (log_onceToken_7 != -1) {
    dispatch_once(&log_onceToken_7, &__block_literal_global_28);
  }
  v2 = (void *)log_log_7;

  return (OS_os_log *)v2;
}

uint64_t __25__ASCTaskCoordinator_log__block_invoke()
{
  log_log_7 = (uint64_t)os_log_create("com.apple.AppStoreComponents", "ASCTaskCoordinator");

  return MEMORY[0x1F41817F8]();
}

- (ASCTaskCoordinator)initWithName:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ASCTaskCoordinator;
  v5 = [(ASCTaskCoordinator *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    name = v5->_name;
    v5->_name = (NSString *)v6;

    v8 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    consistencyLock = v5->_consistencyLock;
    v5->_consistencyLock = v8;

    [(NSRecursiveLock *)v5->_consistencyLock setName:v4];
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    pendingResults = v5->_pendingResults;
    v5->_pendingResults = v10;

    v12 = (NSCache *)objc_alloc_init(MEMORY[0x1E4F1C998]);
    loadedResults = v5->_loadedResults;
    v5->_loadedResults = v12;

    [(NSCache *)v5->_loadedResults setName:v4];
    [(NSCache *)v5->_loadedResults setCountLimit:50];
  }

  return v5;
}

- (void)withLock:(id)a3
{
  uint64_t v6 = (void (**)(void))a3;
  id v4 = [(ASCTaskCoordinator *)self consistencyLock];
  [v4 lock];

  v6[2]();
  v5 = [(ASCTaskCoordinator *)self consistencyLock];
  [v5 unlock];
}

- (void)taskForKey:(id)a3 didCompleteWithResult:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = +[ASCTaskCoordinator log];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = [(ASCTaskCoordinator *)self name];
    *(_DWORD *)buf = 138543874;
    objc_super v15 = v9;
    __int16 v16 = 2112;
    id v17 = v6;
    __int16 v18 = 2112;
    id v19 = v7;
    _os_log_impl(&dword_1C2B8D000, v8, OS_LOG_TYPE_INFO, "%{public}@: Task for %@ did complete with %@", buf, 0x20u);
  }
  v10 = [(ASCTaskCoordinator *)self loadedResults];
  [v10 setObject:v7 forKey:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __55__ASCTaskCoordinator_taskForKey_didCompleteWithResult___block_invoke;
  v12[3] = &unk_1E645D920;
  v12[4] = self;
  id v13 = v6;
  id v11 = v6;
  [(ASCTaskCoordinator *)self withLock:v12];
}

void __55__ASCTaskCoordinator_taskForKey_didCompleteWithResult___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingResults];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (void)taskForKey:(id)a3 didFailWithError:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 domain];
  if ([v8 isEqualToString:*MEMORY[0x1E4F281F8]])
  {
    uint64_t v9 = [v7 code];

    if (v9 == 3072) {
      goto LABEL_8;
    }
  }
  else
  {
  }
  v10 = +[ASCTaskCoordinator log];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    v12 = [(ASCTaskCoordinator *)self name];
    id v13 = AMSLogableError();
    *(_DWORD *)buf = 138543874;
    id v17 = v12;
    __int16 v18 = 2112;
    id v19 = v6;
    __int16 v20 = 2114;
    v21 = v13;
    _os_log_error_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_ERROR, "%{public}@: Task for %@ did fail with %{public}@", buf, 0x20u);
  }
LABEL_8:
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __50__ASCTaskCoordinator_taskForKey_didFailWithError___block_invoke;
  v14[3] = &unk_1E645D920;
  v14[4] = self;
  id v15 = v6;
  id v11 = v6;
  [(ASCTaskCoordinator *)self withLock:v14];
}

void __50__ASCTaskCoordinator_taskForKey_didFailWithError___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) pendingResults];
  [v2 removeObjectForKey:*(void *)(a1 + 40)];
}

- (BOOL)hasTaskForKey:(id)a3
{
  v3 = [(ASCTaskCoordinator *)self taskForKey:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)taskForKey:(id)a3
{
  id v4 = a3;
  v5 = [(ASCTaskCoordinator *)self loadedResults];
  id v6 = [v5 objectForKey:v4];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F4DDD0] promiseWithResult:v6];
  }
  else
  {
    uint64_t v12 = 0;
    id v13 = &v12;
    uint64_t v14 = 0x3032000000;
    id v15 = __Block_byref_object_copy_;
    __int16 v16 = __Block_byref_object_dispose_;
    id v17 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __33__ASCTaskCoordinator_taskForKey___block_invoke;
    v9[3] = &unk_1E645E9D8;
    id v11 = &v12;
    v9[4] = self;
    id v10 = v4;
    [(ASCTaskCoordinator *)self withLock:v9];
    id v7 = (id)v13[5];

    _Block_object_dispose(&v12, 8);
  }

  return v7;
}

void __33__ASCTaskCoordinator_taskForKey___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) pendingResults];
  uint64_t v2 = [v5 objectForKeyedSubscript:*(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)taskForKey:(id)a3 withCreatorBlock:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [(ASCTaskCoordinator *)self loadedResults];
  uint64_t v9 = [v8 objectForKey:v6];

  if (v9)
  {
    id v10 = +[ASCTaskCoordinator log];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = [(ASCTaskCoordinator *)self name];
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      _os_log_impl(&dword_1C2B8D000, v10, OS_LOG_TYPE_INFO, "%{public}@: Using cached result to satisfy %@", buf, 0x16u);
    }
    id v12 = [MEMORY[0x1E4F4DDB0] promiseWithResult:v9];
  }
  else
  {
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    id v19 = __Block_byref_object_copy_;
    __int16 v20 = __Block_byref_object_dispose_;
    id v21 = 0;
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke;
    v14[3] = &unk_1E645EC00;
    v14[4] = self;
    id v15 = v6;
    id v17 = buf;
    id v16 = v7;
    [(ASCTaskCoordinator *)self withLock:v14];
    id v12 = *(id *)(*(void *)&buf[8] + 40);

    _Block_object_dispose(buf, 8);
  }

  return v12;
}

void __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) pendingResults];
  uint64_t v3 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  id v4 = +[ASCTaskCoordinator log];
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);
  if (v3)
  {
    if (v5)
    {
      id v6 = [*(id *)(a1 + 32) name];
      uint64_t v7 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v6;
      __int16 v28 = 2112;
      uint64_t v29 = v7;
      _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "%{public}@: Reusing pending task to satisfy %@", buf, 0x16u);
    }
    uint64_t v8 = objc_msgSend(v3, "asc_copy");
    uint64_t v9 = *(void *)(*(void *)(a1 + 56) + 8);
    id v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;
  }
  else
  {
    if (v5)
    {
      id v11 = [*(id *)(a1 + 32) name];
      uint64_t v12 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v27 = v11;
      __int16 v28 = 2112;
      uint64_t v29 = v12;
      _os_log_impl(&dword_1C2B8D000, v4, OS_LOG_TYPE_INFO, "%{public}@: Starting new task to satisfy %@", buf, 0x16u);
    }
    id v10 = (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    id v13 = [*(id *)(a1 + 32) pendingResults];
    [v13 setObject:v10 forKeyedSubscript:*(void *)(a1 + 40)];

    objc_initWeak((id *)buf, *(id *)(a1 + 32));
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_8;
    v23[3] = &unk_1E645EBD8;
    objc_copyWeak(&v25, (id *)buf);
    id v24 = *(id *)(a1 + 40);
    [v10 addSuccessBlock:v23];
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_2;
    __int16 v20 = &unk_1E645E0C8;
    objc_copyWeak(&v22, (id *)buf);
    id v21 = *(id *)(a1 + 40);
    [v10 addErrorBlock:&v17];
    uint64_t v14 = objc_msgSend(v10, "asc_copy", v17, v18, v19, v20);
    uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);
    objc_destroyWeak((id *)buf);
  }
}

void __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained taskForKey:*(void *)(a1 + 32) didCompleteWithResult:v4];
}

void __50__ASCTaskCoordinator_taskForKey_withCreatorBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained taskForKey:*(void *)(a1 + 32) didFailWithError:v4];
}

- (void)removeTaskForKey:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = +[ASCTaskCoordinator log];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v6 = [(ASCTaskCoordinator *)self name];
    *(_DWORD *)buf = 138543618;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v4;
    _os_log_impl(&dword_1C2B8D000, v5, OS_LOG_TYPE_INFO, "%{public}@: Removing task for key %@", buf, 0x16u);
  }
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __39__ASCTaskCoordinator_removeTaskForKey___block_invoke;
  uint64_t v12 = &unk_1E645D920;
  id v13 = self;
  id v14 = v4;
  id v7 = v4;
  [(ASCTaskCoordinator *)self withLock:&v9];
  uint64_t v8 = [(ASCTaskCoordinator *)self loadedResults];
  [v8 removeObjectForKey:v7];
}

void __39__ASCTaskCoordinator_removeTaskForKey___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) pendingResults];
  id v5 = [v2 objectForKeyedSubscript:*(void *)(a1 + 40)];

  uint64_t v3 = v5;
  if (v5)
  {
    [v5 cancel];
    id v4 = [*(id *)(a1 + 32) pendingResults];
    [v4 removeObjectForKey:*(void *)(a1 + 40)];

    uint64_t v3 = v5;
  }
}

- (void)removeAllFinishedTasks
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[ASCTaskCoordinator log];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    id v4 = [(ASCTaskCoordinator *)self name];
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl(&dword_1C2B8D000, v3, OS_LOG_TYPE_INFO, "%{public}@: Removing all finished tasks", (uint8_t *)&v6, 0xCu);
  }
  id v5 = [(ASCTaskCoordinator *)self loadedResults];
  [v5 removeAllObjects];
}

- (NSString)name
{
  return self->_name;
}

- (NSRecursiveLock)consistencyLock
{
  return self->_consistencyLock;
}

- (NSMutableDictionary)pendingResults
{
  return self->_pendingResults;
}

- (NSCache)loadedResults
{
  return self->_loadedResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadedResults, 0);
  objc_storeStrong((id *)&self->_pendingResults, 0);
  objc_storeStrong((id *)&self->_consistencyLock, 0);

  objc_storeStrong((id *)&self->_name, 0);
}

@end