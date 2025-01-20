@interface MSASModelEnumerator
+ (id)enumeratorWithDatabase:(sqlite3 *)a3 query:(id)a4 stepBlock:(id)a5;
- (MSASModelEnumerator)init;
- (MSASModelEnumerator)initWithDatabase:(sqlite3 *)a3 query:(id)a4 stepBlock:(id)a5;
- (OS_dispatch_queue)queue;
- (id)nextObject;
- (id)stepBlock;
- (sqlite3)db;
- (sqlite3_stmt)stmt;
- (void)dealloc;
- (void)setDb:(sqlite3 *)a3;
- (void)setQueue:(id)a3;
- (void)setStepBlock:(id)a3;
- (void)setStmt:(sqlite3_stmt *)a3;
@end

@implementation MSASModelEnumerator

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_stepBlock, 0);
}

- (void)setQueue:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setStepBlock:(id)a3
{
}

- (id)stepBlock
{
  return self->_stepBlock;
}

- (void)setStmt:(sqlite3_stmt *)a3
{
  self->_stmt = a3;
}

- (sqlite3_stmt)stmt
{
  return self->_stmt;
}

- (void)setDb:(sqlite3 *)a3
{
  self->_db = a3;
}

- (sqlite3)db
{
  return self->_db;
}

- (id)nextObject
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__6799;
  v12 = __Block_byref_object_dispose__6800;
  id v13 = 0;
  if ([(MSASModelEnumerator *)self stmt])
  {
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __33__MSASModelEnumerator_nextObject__block_invoke;
    v7[3] = &unk_1E6C3DA60;
    v7[4] = self;
    v7[5] = &v8;
    v3 = (void (**)(void))MEMORY[0x1E019E5F0](v7);
    queue = self->_queue;
    if (queue) {
      dispatch_sync(queue, v3);
    }
    else {
      v3[2](v3);
    }
  }
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

void __33__MSASModelEnumerator_nextObject__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  int v2 = sqlite3_step((sqlite3_stmt *)[*(id *)(a1 + 32) stmt]);
  if (v2 == 101)
  {
    sqlite3_finalize((sqlite3_stmt *)[*(id *)(a1 + 32) stmt]);
    [*(id *)(a1 + 32) setStmt:0];
    v6 = *(void **)(a1 + 32);
    [v6 setStepBlock:0];
  }
  else if (v2 == 100)
  {
    uint64_t v8 = [*(id *)(a1 + 32) stepBlock];
    uint64_t v3 = v8[2](v8, [*(id *)(a1 + 32) stmt]);
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    id v5 = *(void **)(v4 + 40);
    *(void *)(v4 + 40) = v3;
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    v7 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138543618;
    uint64_t v10 = v7;
    __int16 v11 = 2082;
    v12 = sqlite3_errmsg((sqlite3 *)[v7 db]);
    _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Can't enumerate the next object in the model. Error: %{public}s", buf, 0x16u);
  }
}

- (void)dealloc
{
  if (self->_stmt)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __30__MSASModelEnumerator_dealloc__block_invoke;
    v6[3] = &unk_1E6C3DA38;
    v6[4] = self;
    uint64_t v3 = (void (**)(void))MEMORY[0x1E019E5F0](v6, a2);
    queue = self->_queue;
    if (queue) {
      dispatch_sync(queue, v3);
    }
    else {
      v3[2](v3);
    }
  }
  v5.receiver = self;
  v5.super_class = (Class)MSASModelEnumerator;
  [(MSASModelEnumerator *)&v5 dealloc];
}

uint64_t __30__MSASModelEnumerator_dealloc__block_invoke(uint64_t a1)
{
  return sqlite3_finalize(*(sqlite3_stmt **)(*(void *)(a1 + 32) + 16));
}

- (MSASModelEnumerator)initWithDatabase:(sqlite3 *)a3 query:(id)a4 stepBlock:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)MSASModelEnumerator;
  uint64_t v10 = [(MSASModelEnumerator *)&v16 init];
  if (v10)
  {
    id v11 = v8;
    if (sqlite3_prepare_v2(a3, (const char *)[v11 UTF8String], -1, &v10->_stmt, 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
      {
        v15 = sqlite3_errmsg(a3);
        *(_DWORD *)buf = 138543874;
        v18 = v10;
        __int16 v19 = 2114;
        id v20 = v11;
        __int16 v21 = 2082;
        v22 = v15;
        _os_log_error_impl(&dword_1DC434000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "%{public}@: Could not compile SQL query: “%{public}@”. sqlite error: %{public}s", buf, 0x20u);
      }
      stepBlock = v10;
      uint64_t v10 = 0;
    }
    else
    {
      v10->_db = a3;
      uint64_t v13 = [v9 copy];
      stepBlock = v10->_stepBlock;
      v10->_stepBlock = (id)v13;
    }
  }
  return v10;
}

- (MSASModelEnumerator)init
{
}

+ (id)enumeratorWithDatabase:(sqlite3 *)a3 query:(id)a4 stepBlock:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = [[MSASModelEnumerator alloc] initWithDatabase:a3 query:v8 stepBlock:v7];

  return v9;
}

@end