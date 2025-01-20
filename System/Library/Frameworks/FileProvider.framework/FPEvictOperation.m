@interface FPEvictOperation
- (FPEvictOperation)initWithItems:(id)a3;
- (void)actionMain;
@end

@implementation FPEvictOperation

- (FPEvictOperation)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPEvictOperation;
  v6 = [(FPActionOperation *)&v9 initWithProvider:0 action:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_items, a3);
    [(FPActionOperation *)v7 setSourceItemsToPreflight:v5];
  }

  return v7;
}

- (void)actionMain
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = dispatch_group_create();
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__26;
  v20[4] = __Block_byref_object_dispose__26;
  id v21 = 0;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  obj = self->_items;
  uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v17 != v5) {
          objc_enumerationMutation(obj);
        }
        v7 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        dispatch_group_enter(v3);
        v8 = +[FPDaemonConnection sharedConnection];
        objc_super v9 = [v7 itemID];
        v13[0] = MEMORY[0x1E4F143A8];
        v13[1] = 3221225472;
        v13[2] = __30__FPEvictOperation_actionMain__block_invoke;
        v13[3] = &unk_1E5AF4030;
        v15 = v20;
        v14 = v3;
        [v8 evictItemWithID:v9 evictionReason:2 completionHandler:v13];
      }
      uint64_t v4 = [(NSArray *)obj countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v4);
  }

  v10 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FPEvictOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E5AF2468;
  block[4] = self;
  block[5] = v20;
  dispatch_group_notify(v3, v10, block);

  _Block_object_dispose(v20, 8);
}

void __30__FPEvictOperation_actionMain__block_invoke(uint64_t a1, void *a2)
{
  id v7 = a2;
  if (v7)
  {
    uint64_t v4 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v6 = *(void *)(v4 + 40);
    uint64_t v5 = (id *)(v4 + 40);
    if (!v6) {
      objc_storeStrong(v5, a2);
    }
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

uint64_t __30__FPEvictOperation_actionMain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:0 error:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void).cxx_destruct
{
}

@end