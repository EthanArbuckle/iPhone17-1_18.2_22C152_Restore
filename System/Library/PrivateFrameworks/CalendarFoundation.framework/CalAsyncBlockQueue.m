@interface CalAsyncBlockQueue
- (CalAsyncBlockPerformer)blockPerformer;
- (CalAsyncBlockQueue)initWithBlockPerformer:(id)a3;
- (NSMutableSet)pendingBlocks;
- (void)cancelAllPendingBlocks;
- (void)performAfterDelay:(double)a3 block:(id)a4;
- (void)performAsync:(id)a3;
@end

@implementation CalAsyncBlockQueue

- (CalAsyncBlockQueue)initWithBlockPerformer:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"CalAsyncBlockQueue.m", 23, @"Invalid parameter not satisfying: %@", @"blockPerformer != nil" object file lineNumber description];
  }
  v13.receiver = self;
  v13.super_class = (Class)CalAsyncBlockQueue;
  v7 = [(CalAsyncBlockQueue *)&v13 init];
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_blockPerformer, a3);
    uint64_t v9 = [MEMORY[0x1E4F1CA80] set];
    pendingBlocks = v8->_pendingBlocks;
    v8->_pendingBlocks = (NSMutableSet *)v9;
  }
  return v8;
}

- (void)performAsync:(id)a3
{
  id v4 = a3;
  v5 = [(CalAsyncBlockQueue *)self blockPerformer];
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  v11 = __35__CalAsyncBlockQueue_performAsync___block_invoke;
  v12 = &unk_1E56CDD20;
  objc_super v13 = self;
  id v14 = v4;
  id v6 = v4;
  v7 = [v5 performAsync:&v9];

  v8 = [(CalAsyncBlockQueue *)self pendingBlocks];
  [v8 addObject:v7];
}

uint64_t __35__CalAsyncBlockQueue_performAsync___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 pendingBlocks];
  [v5 removeObject:v4];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)performAfterDelay:(double)a3 block:(id)a4
{
  id v6 = a4;
  v7 = [(CalAsyncBlockQueue *)self blockPerformer];
  uint64_t v11 = MEMORY[0x1E4F143A8];
  uint64_t v12 = 3221225472;
  objc_super v13 = __46__CalAsyncBlockQueue_performAfterDelay_block___block_invoke;
  id v14 = &unk_1E56CDD20;
  v15 = self;
  id v16 = v6;
  id v8 = v6;
  uint64_t v9 = [v7 performAfterDelay:&v11 block:a3];

  uint64_t v10 = [(CalAsyncBlockQueue *)self pendingBlocks];
  [v10 addObject:v9];
}

uint64_t __46__CalAsyncBlockQueue_performAfterDelay_block___block_invoke(uint64_t a1, void *a2)
{
  v3 = *(void **)(a1 + 32);
  id v4 = a2;
  v5 = [v3 pendingBlocks];
  [v5 removeObject:v4];

  id v6 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v6();
}

- (void)cancelAllPendingBlocks
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v3 = [(CalAsyncBlockQueue *)self pendingBlocks];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v9 + 1) + 8 * v7++) cancel];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }

  id v8 = [(CalAsyncBlockQueue *)self pendingBlocks];
  [v8 removeAllObjects];
}

- (CalAsyncBlockPerformer)blockPerformer
{
  return self->_blockPerformer;
}

- (NSMutableSet)pendingBlocks
{
  return self->_pendingBlocks;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingBlocks, 0);

  objc_storeStrong((id *)&self->_blockPerformer, 0);
}

@end