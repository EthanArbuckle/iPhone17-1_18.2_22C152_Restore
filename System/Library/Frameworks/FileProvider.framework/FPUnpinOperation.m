@interface FPUnpinOperation
- (FPUnpinOperation)initWithItems:(id)a3;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
@end

@implementation FPUnpinOperation

- (FPUnpinOperation)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPUnpinOperation;
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = dispatch_group_create();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__26;
  v28[4] = __Block_byref_object_dispose__26;
  id v29 = 0;
  v4 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  v15 = self;
  obj = self->_items;
  uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        objc_super v9 = objc_msgSend(v8, "downloadingProgress", v15);

        if (v9)
        {
          v10 = [v8 downloadingProgress];
          [v10 cancel];
        }
        dispatch_group_enter(v3);
        v11 = +[FPDaemonConnection sharedConnection];
        v12 = [v8 itemID];
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __30__FPUnpinOperation_actionMain__block_invoke;
        v20[3] = &unk_1E5AF5600;
        v23 = v28;
        id v21 = v4;
        v22 = v3;
        [v11 unpinItemWithID:v12 completionHandler:v20];
      }
      uint64_t v5 = [(NSArray *)obj countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v5);
  }

  v13 = [(FPOperation *)v15 callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __30__FPUnpinOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E5AF5650;
  block[4] = v15;
  id v18 = v4;
  v19 = v28;
  id v14 = v4;
  dispatch_group_notify(v3, v13, block);

  _Block_object_dispose(v28, 8);
}

void __30__FPUnpinOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    v7 = (id *)(v6 + 40);
    if (!v8) {
      objc_storeStrong(v7, a3);
    }
  }
  if (v10)
  {
    id v9 = *(id *)(a1 + 32);
    objc_sync_enter(v9);
    [*(id *)(a1 + 32) addObject:v10];
    objc_sync_exit(v9);
  }
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __30__FPUnpinOperation_actionMain__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) completedWithResult:*(void *)(a1 + 40) error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

- (void)presendNotifications
{
  v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  v4 = [(FPActionOperation *)self stitcher];
  [v4 transformItems:self->_items handler:&__block_literal_global_336];

  id v5 = [(FPActionOperation *)self stitcher];
  [v5 flush];
}

void __40__FPUnpinOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPinned:0];
  [v2 setInPinnedFolder:0];
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") & 0xFFFFFFFFF7FFFFFFLL);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") | 0x10000000);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FPActionOperation *)self stitcher];
  [v8 finishWithItems:v7 error:v6];

  v9.receiver = self;
  v9.super_class = (Class)FPUnpinOperation;
  [(FPActionOperation *)&v9 finishWithResult:v7 error:v6];
}

- (void).cxx_destruct
{
}

@end