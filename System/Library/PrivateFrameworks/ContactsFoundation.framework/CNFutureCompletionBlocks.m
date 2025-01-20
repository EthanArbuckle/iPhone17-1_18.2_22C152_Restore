@interface CNFutureCompletionBlocks
- (BOOL)shouldCallImmediately;
- (CNFutureCompletionBlocks)init;
- (void)addCompletionBlock:(id)a3 orCallWithFutureResult:(id)a4;
- (void)addFailureBlock:(id)a3 orCallWithFutureResult:(id)a4;
- (void)addSuccessBlock:(id)a3 orCallWithFutureResult:(id)a4;
- (void)flushCompletionBlocksWithFutureResult:(id)a3;
- (void)setShouldCallImmediately:(BOOL)a3;
@end

@implementation CNFutureCompletionBlocks

- (CNFutureCompletionBlocks)init
{
  v7.receiver = self;
  v7.super_class = (Class)CNFutureCompletionBlocks;
  v2 = [(CNFutureCompletionBlocks *)&v7 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v2->_completionBlocks;
    v2->_completionBlocks = v3;

    v5 = v2;
  }

  return v2;
}

- (BOOL)shouldCallImmediately
{
  v2 = self;
  objc_sync_enter(v2);
  BOOL shouldCallImmediately = v2->_shouldCallImmediately;
  objc_sync_exit(v2);

  return shouldCallImmediately;
}

- (void)setShouldCallImmediately:(BOOL)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_BOOL shouldCallImmediately = a3;
  objc_sync_exit(obj);
}

- (void)addSuccessBlock:(id)a3 orCallWithFutureResult:(id)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CNFutureCompletionBlocks_addSuccessBlock_orCallWithFutureResult___block_invoke;
  aBlock[3] = &unk_1E56A10A8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  v9 = _Block_copy(aBlock);
  [(CNFutureCompletionBlocks *)self addCompletionBlock:v9 orCallWithFutureResult:v8];
}

uint64_t __67__CNFutureCompletionBlocks_addSuccessBlock_orCallWithFutureResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)addFailureBlock:(id)a3 orCallWithFutureResult:(id)a4
{
  id v6 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CNFutureCompletionBlocks_addFailureBlock_orCallWithFutureResult___block_invoke;
  aBlock[3] = &unk_1E56A10A8;
  id v11 = v6;
  id v7 = v6;
  id v8 = a4;
  v9 = _Block_copy(aBlock);
  [(CNFutureCompletionBlocks *)self addCompletionBlock:v9 orCallWithFutureResult:v8];
}

uint64_t __67__CNFutureCompletionBlocks_addFailureBlock_orCallWithFutureResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (!a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

- (void)addCompletionBlock:(id)a3 orCallWithFutureResult:(id)a4
{
  id v11 = (void (**)(id, CNFutureCompletionBlocks *, void *))a3;
  id v6 = a4;
  id v7 = self;
  objc_sync_enter(v7);
  if (v7->_shouldCallImmediately)
  {
    objc_sync_exit(v7);

    id v7 = [v6 result];
    id v8 = [v6 error];
    v11[2](v11, v7, v8);
  }
  else
  {
    completionBlocks = v7->_completionBlocks;
    v10 = (void *)[v11 copy];
    [(NSMutableArray *)completionBlocks addObject:v10];

    objc_sync_exit(v7);
  }
}

- (void)flushCompletionBlocksWithFutureResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableArray *)v5->_completionBlocks copy];
  [(NSMutableArray *)v5->_completionBlocks removeAllObjects];
  objc_sync_exit(v5);

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = objc_msgSend(v4, "result", (void)v14);
        v13 = [v4 error];
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void).cxx_destruct
{
}

@end