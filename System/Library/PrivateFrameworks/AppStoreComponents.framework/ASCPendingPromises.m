@interface ASCPendingPromises
- (ASCPendingPromises)init;
- (BOOL)containsBinaryPromise:(id)a3;
- (BOOL)containsPromise:(id)a3;
- (BOOL)hasPromises;
- (NSMutableArray)binaryPromises;
- (NSMutableArray)binaryPromisesIfLoaded;
- (NSMutableArray)promises;
- (NSMutableArray)promisesIfLoaded;
- (NSRecursiveLock)stateLock;
- (void)addBinaryPromise:(id)a3;
- (void)addPromise:(id)a3;
- (void)cancelAll;
- (void)enumerateBinaryPromises:(id)a3 andPromises:(id)a4;
- (void)finishAllWithError:(id)a3;
- (void)setBinaryPromisesIfLoaded:(id)a3;
- (void)setPromisesIfLoaded:(id)a3;
- (void)withLock:(id)a3;
@end

@implementation ASCPendingPromises

- (ASCPendingPromises)init
{
  v6.receiver = self;
  v6.super_class = (Class)ASCPendingPromises;
  v2 = [(ASCPendingPromises *)&v6 init];
  if (v2)
  {
    v3 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    stateLock = v2->_stateLock;
    v2->_stateLock = v3;
  }
  return v2;
}

- (void)withLock:(id)a3
{
  objc_super v6 = (void (**)(void))a3;
  v4 = [(ASCPendingPromises *)self stateLock];
  [v4 lock];

  v6[2]();
  v5 = [(ASCPendingPromises *)self stateLock];
  [v5 unlock];
}

- (NSMutableArray)binaryPromises
{
  v3 = [(ASCPendingPromises *)self binaryPromisesIfLoaded];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(ASCPendingPromises *)self setBinaryPromisesIfLoaded:v5];
  }

  return (NSMutableArray *)v5;
}

- (NSMutableArray)promises
{
  v3 = [(ASCPendingPromises *)self promisesIfLoaded];
  v4 = v3;
  if (v3)
  {
    id v5 = v3;
  }
  else
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(ASCPendingPromises *)self setPromisesIfLoaded:v5];
  }

  return (NSMutableArray *)v5;
}

- (BOOL)containsBinaryPromise:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __44__ASCPendingPromises_containsBinaryPromise___block_invoke;
  v7[3] = &unk_1E645E9D8;
  v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(ASCPendingPromises *)self withLock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __44__ASCPendingPromises_containsBinaryPromise___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) binaryPromisesIfLoaded];
  if (v2)
  {
    id v4 = v2;
    v3 = [*(id *)(a1 + 32) binaryPromisesIfLoaded];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 indexOfObjectIdenticalTo:*(void *)(a1 + 40)] != 0x7FFFFFFFFFFFFFFFLL;

    v2 = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)addBinaryPromise:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__ASCPendingPromises_addBinaryPromise___block_invoke;
  v6[3] = &unk_1E645D920;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ASCPendingPromises *)self withLock:v6];
}

void __39__ASCPendingPromises_addBinaryPromise___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) binaryPromises];
  [v2 addObject:*(void *)(a1 + 40)];

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __39__ASCPendingPromises_addBinaryPromise___block_invoke_2;
  v4[3] = &unk_1E645EA00;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  [v3 addFinishBlock:v4];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __39__ASCPendingPromises_addBinaryPromise___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __39__ASCPendingPromises_addBinaryPromise___block_invoke_3;
    v5[3] = &unk_1E645D920;
    id v6 = WeakRetained;
    id v7 = v4;
    [v6 withLock:v5];
  }
}

void __39__ASCPendingPromises_addBinaryPromise___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) binaryPromises];
  [v2 removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

- (BOOL)hasPromises
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  char v8 = 0;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ASCPendingPromises_hasPromises__block_invoke;
  v4[3] = &unk_1E645EA28;
  void v4[4] = self;
  v4[5] = &v5;
  [(ASCPendingPromises *)self withLock:v4];
  char v2 = *((unsigned char *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __33__ASCPendingPromises_hasPromises__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) binaryPromisesIfLoaded];
  if (v5
    && ([*(id *)(a1 + 32) binaryPromisesIfLoaded],
        v1 = objc_claimAutoreleasedReturnValue(),
        [v1 count]))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
  }
  else
  {
    id v3 = [*(id *)(a1 + 32) promisesIfLoaded];
    if (v3)
    {
      id v4 = [*(id *)(a1 + 32) promisesIfLoaded];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v4 count] != 0;
    }
    else
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    }

    if (!v5) {
      goto LABEL_9;
    }
  }

LABEL_9:
}

- (BOOL)containsPromise:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__ASCPendingPromises_containsPromise___block_invoke;
  v7[3] = &unk_1E645E9D8;
  v9 = &v10;
  v7[4] = self;
  id v5 = v4;
  id v8 = v5;
  [(ASCPendingPromises *)self withLock:v7];
  LOBYTE(self) = *((unsigned char *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return (char)self;
}

void __38__ASCPendingPromises_containsPromise___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) promisesIfLoaded];
  if (v2)
  {
    id v4 = v2;
    id v3 = [*(id *)(a1 + 32) promisesIfLoaded];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 indexOfObjectIdenticalTo:*(void *)(a1 + 40)] != 0x7FFFFFFFFFFFFFFFLL;

    char v2 = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
  }
}

- (void)addPromise:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __33__ASCPendingPromises_addPromise___block_invoke;
  v6[3] = &unk_1E645D920;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(ASCPendingPromises *)self withLock:v6];
}

void __33__ASCPendingPromises_addPromise___block_invoke(uint64_t a1)
{
  char v2 = [*(id *)(a1 + 32) promises];
  [v2 addObject:*(void *)(a1 + 40)];

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_initWeak(&from, *(id *)(a1 + 40));
  id v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __33__ASCPendingPromises_addPromise___block_invoke_2;
  v4[3] = &unk_1E645EA50;
  objc_copyWeak(&v5, &location);
  objc_copyWeak(&v6, &from);
  [v3 addFinishBlock:v4];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __33__ASCPendingPromises_addPromise___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  id v4 = v3;
  if (WeakRetained && v3)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = __33__ASCPendingPromises_addPromise___block_invoke_3;
    v5[3] = &unk_1E645D920;
    id v6 = WeakRetained;
    id v7 = v4;
    [v6 withLock:v5];
  }
}

void __33__ASCPendingPromises_addPromise___block_invoke_3(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) promises];
  [v2 removeObjectIdenticalTo:*(void *)(a1 + 40)];
}

- (void)enumerateBinaryPromises:(id)a3 andPromises:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = (void (**)(id, void))a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = [(ASCPendingPromises *)self stateLock];
  [v8 lock];

  v9 = [(ASCPendingPromises *)self binaryPromisesIfLoaded];
  uint64_t v10 = (void *)[v9 copy];

  v11 = [(ASCPendingPromises *)self promisesIfLoaded];
  uint64_t v12 = (void *)[v11 copy];

  char v13 = [(ASCPendingPromises *)self stateLock];
  [v13 unlock];

  if (v10)
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          v6[2](v6, *(void *)(*((void *)&v28 + 1) + 8 * v18++));
        }
        while (v16 != v18);
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v16);
    }
  }
  if (v12)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v19 = v12;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v25;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v25 != v22) {
            objc_enumerationMutation(v19);
          }
          v7[2](v7, *(void *)(*((void *)&v24 + 1) + 8 * v23++));
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v24 objects:v32 count:16];
      }
      while (v21);
    }
  }
}

- (void)cancelAll
{
}

uint64_t __31__ASCPendingPromises_cancelAll__block_invoke(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

uint64_t __31__ASCPendingPromises_cancelAll__block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 cancel];
}

- (void)finishAllWithError:(id)a3
{
  id v4 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __41__ASCPendingPromises_finishAllWithError___block_invoke;
  v8[3] = &unk_1E645EAB8;
  id v9 = v4;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __41__ASCPendingPromises_finishAllWithError___block_invoke_2;
  v6[3] = &unk_1E645EAE0;
  id v7 = v9;
  id v5 = v9;
  [(ASCPendingPromises *)self enumerateBinaryPromises:v8 andPromises:v6];
}

uint64_t __41__ASCPendingPromises_finishAllWithError___block_invoke(uint64_t a1, void *a2)
{
  return [a2 finishWithError:*(void *)(a1 + 32)];
}

uint64_t __41__ASCPendingPromises_finishAllWithError___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 finishWithError:*(void *)(a1 + 32)];
}

- (NSRecursiveLock)stateLock
{
  return self->_stateLock;
}

- (NSMutableArray)binaryPromisesIfLoaded
{
  return self->_binaryPromisesIfLoaded;
}

- (void)setBinaryPromisesIfLoaded:(id)a3
{
}

- (NSMutableArray)promisesIfLoaded
{
  return self->_promisesIfLoaded;
}

- (void)setPromisesIfLoaded:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_promisesIfLoaded, 0);
  objc_storeStrong((id *)&self->_binaryPromisesIfLoaded, 0);

  objc_storeStrong((id *)&self->_stateLock, 0);
}

@end