@interface AMSPromiseCompletionBlocks
- (AMSPromiseCompletionBlocks)init;
- (void)addCompletionBlock:(id)a3;
- (void)addErrorBlock:(id)a3;
- (void)addSuccessBlock:(id)a3;
- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4;
- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4;
- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4;
- (void)flushCompletionBlocksWithPromiseResult:(id)a3;
@end

@implementation AMSPromiseCompletionBlocks

- (void).cxx_destruct
{
}

- (AMSPromiseCompletionBlocks)init
{
  v7.receiver = self;
  v7.super_class = (Class)AMSPromiseCompletionBlocks;
  v2 = [(AMSPromiseCompletionBlocks *)&v7 init];
  v3 = v2;
  if (v2)
  {
    v2->_completionBlockLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    completionBlocks = v3->_completionBlocks;
    v3->_completionBlocks = v4;
  }
  return v3;
}

- (void)flushCompletionBlocksWithPromiseResult:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_completionBlockLock);
  v5 = (void *)[(NSMutableArray *)self->_completionBlocks copy];
  [(NSMutableArray *)self->_completionBlocks removeAllObjects];
  os_unfair_lock_unlock(&self->_completionBlockLock);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        v12 = objc_msgSend(v4, "result", (void)v14);
        v13 = [v4 error];
        (*(void (**)(uint64_t, void *, void *))(v11 + 16))(v11, v12, v13);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
}

- (void)addErrorBlock:(id)a3
{
  id v4 = a3;
  v5 = AMSLogKey();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __44__AMSPromiseCompletionBlocks_addErrorBlock___block_invoke;
  v8[3] = &unk_1E55A58F0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(AMSPromiseCompletionBlocks *)self addCompletionBlock:v8];
}

void __44__AMSPromiseCompletionBlocks_addErrorBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = AMSSetLogKey(*(void **)(a1 + 32));
  v5 = v6;
  if (v6)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    v5 = v6;
  }
}

- (void)addSuccessBlock:(id)a3
{
  id v4 = a3;
  v5 = AMSLogKey();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __46__AMSPromiseCompletionBlocks_addSuccessBlock___block_invoke;
  v8[3] = &unk_1E55A58F0;
  id v9 = v5;
  id v10 = v4;
  id v6 = v4;
  id v7 = v5;
  [(AMSPromiseCompletionBlocks *)self addCompletionBlock:v8];
}

- (void)addCompletionBlock:(id)a3
{
  p_completionBlockLock = &self->_completionBlockLock;
  id v5 = a3;
  os_unfair_lock_lock(p_completionBlockLock);
  completionBlocks = self->_completionBlocks;
  id v7 = (void *)[v5 copy];

  [(NSMutableArray *)completionBlocks addObject:v7];
  os_unfair_lock_unlock(p_completionBlockLock);
}

- (void)callErrorBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __63__AMSPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_1E55A5918;
  id v9 = v6;
  id v7 = v6;
  [(AMSPromiseCompletionBlocks *)self callCompletionBlock:v8 withPromiseResult:a4];
}

- (void)callSuccessBlock:(id)a3 withPromiseResult:(id)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __65__AMSPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke;
  v8[3] = &unk_1E55A5918;
  id v9 = v6;
  id v7 = v6;
  [(AMSPromiseCompletionBlocks *)self callCompletionBlock:v8 withPromiseResult:a4];
}

- (void)callCompletionBlock:(id)a3 withPromiseResult:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v8 = [v5 result];
  id v7 = [v5 error];

  (*((void (**)(id, id, void *))a3 + 2))(v6, v8, v7);
}

void __46__AMSPromiseCompletionBlocks_addSuccessBlock___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  id v3 = AMSSetLogKey(*(void **)(a1 + 32));
  id v4 = v5;
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id v4 = v5;
  }
}

uint64_t __65__AMSPromiseCompletionBlocks_callSuccessBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

uint64_t __63__AMSPromiseCompletionBlocks_callErrorBlock_withPromiseResult___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a3) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

@end