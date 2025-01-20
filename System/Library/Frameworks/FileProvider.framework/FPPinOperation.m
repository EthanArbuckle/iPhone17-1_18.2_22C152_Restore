@interface FPPinOperation
- (FPPinOperation)initWithItems:(id)a3;
- (void)actionMain;
- (void)finishWithResult:(id)a3 error:(id)a4;
- (void)presendNotifications;
@end

@implementation FPPinOperation

- (FPPinOperation)initWithItems:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)FPPinOperation;
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
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  v2 = self->_items;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v32 objects:v37 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v33;
    while (2)
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v33 != v4) {
          objc_enumerationMutation(v2);
        }
        if (!FPPinningSupportedForItem(*(void **)(*((void *)&v32 + 1) + 8 * v5)))
        {
          v15 = FPNotSupportedError();
          [(FPOperation *)self completedWithResult:0 error:v15];

          goto LABEL_18;
        }
        ++v5;
      }
      while (v3 != v5);
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }

  v2 = (NSArray *)dispatch_group_create();
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x3032000000;
  v30[3] = __Block_byref_object_copy__26;
  v30[4] = __Block_byref_object_dispose__26;
  id v31 = 0;
  v6 = objc_opt_new();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  obj = self->_items;
  uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v36 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v27;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        v10 = *(void **)(*((void *)&v26 + 1) + 8 * v9);
        dispatch_group_enter(&v2->super);
        v11 = +[FPDaemonConnection sharedConnection];
        v12 = [v10 itemID];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __28__FPPinOperation_actionMain__block_invoke;
        v22[3] = &unk_1E5AF5600;
        v25 = v30;
        id v23 = v6;
        v24 = v2;
        [v11 pinItemWithID:v12 completionHandler:v22];

        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)obj countByEnumeratingWithState:&v26 objects:v36 count:16];
    }
    while (v7);
  }

  v13 = [(FPOperation *)self callbackQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __28__FPPinOperation_actionMain__block_invoke_2;
  block[3] = &unk_1E5AF5650;
  id v19 = v6;
  v20 = self;
  v21 = v30;
  id v14 = v6;
  dispatch_group_notify(&v2->super, v13, block);

  _Block_object_dispose(v30, 8);
LABEL_18:
}

void __28__FPPinOperation_actionMain__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v10 = a2;
  id v5 = a3;
  if (v5)
  {
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    uint64_t v8 = *(void *)(v6 + 40);
    uint64_t v7 = (id *)(v6 + 40);
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

void __28__FPPinOperation_actionMain__block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v2);
        }
        if (![*(id *)(*((void *)&v11 + 1) + 8 * v6) isRecursivelyDownloaded])
        {

          uint64_t v7 = [[FPDownloadOperation alloc] initWithItems:*(void *)(a1 + 32)];
          [(FPDownloadOperation *)v7 setRecursively:1];
          v9[0] = MEMORY[0x1E4F143A8];
          v9[1] = 3221225472;
          v9[2] = __28__FPPinOperation_actionMain__block_invoke_3;
          v9[3] = &unk_1E5AF5628;
          long long v10 = *(_OWORD *)(a1 + 40);
          [(FPDownloadOperation *)v7 setDownloadCompletionBlock:v9];
          uint64_t v8 = +[FPItemManager defaultManager];
          [v8 scheduleAction:v7];

          return;
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }

  [*(id *)(a1 + 40) completedWithResult:*(void *)(a1 + 32) error:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)];
}

uint64_t __28__FPPinOperation_actionMain__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = a3;
  uint64_t v5 = *(void **)(a1 + 32);
  if (!a3) {
    uint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  }
  return [v5 completedWithResult:a2 error:v3];
}

- (void)presendNotifications
{
  uint64_t v3 = [(FPActionOperation *)self stitcher];
  [v3 start];

  uint64_t v4 = [(FPActionOperation *)self stitcher];
  [v4 transformItems:self->_items handler:&__block_literal_global_328];

  id v5 = [(FPActionOperation *)self stitcher];
  [v5 flush];
}

void __38__FPPinOperation_presendNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 setPinned:1];
  [v2 setInPinnedFolder:1];
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") & 0xFFFFFFFFEFFFFFFFLL);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") & 0xFFFFFFFFFFFFFFBFLL);
  objc_msgSend(v2, "setCapabilities:", objc_msgSend(v2, "capabilities") | 0x8000000);
}

- (void)finishWithResult:(id)a3 error:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(FPActionOperation *)self stitcher];
  [v8 finishWithItems:v7 error:v6];

  v9.receiver = self;
  v9.super_class = (Class)FPPinOperation;
  [(FPActionOperation *)&v9 finishWithResult:v7 error:v6];
}

- (void).cxx_destruct
{
}

@end