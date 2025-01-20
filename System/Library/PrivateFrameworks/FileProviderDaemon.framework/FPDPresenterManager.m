@interface FPDPresenterManager
- (FPDPresenterManager)initWithExtensionManager:(id)a3;
- (NSDictionary)presenters;
- (id)presenterWithID:(id)a3;
- (id)presentersForDomain:(id)a3;
- (unint64_t)promisePresenterWithID:(id)a3;
- (void)addPresenter:(id)a3 itemID:(id)a4 urlHint:(id)a5 auditToken:(id *)a6 promiseID:(unint64_t)a7;
- (void)forgetPromiseForPresenterWithID:(id)a3 promiseID:(unint64_t)a4;
- (void)removePresenter:(id)a3;
- (void)signalPresentersForItemID:(id)a3;
@end

@implementation FPDPresenterManager

- (FPDPresenterManager)initWithExtensionManager:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)FPDPresenterManager;
  v5 = [(FPDPresenterManager *)&v15 init];
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_extensionManager, v4);
    v7 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v8 = dispatch_queue_create("presenter manager queue", v7);
    queue = v6->_queue;
    v6->_queue = (OS_dispatch_queue *)v8;

    uint64_t v10 = objc_opt_new();
    presenters = v6->_presenters;
    v6->_presenters = (NSMutableDictionary *)v10;

    uint64_t v12 = objc_opt_new();
    promisedPresenters = v6->_promisedPresenters;
    v6->_promisedPresenters = (NSMutableDictionary *)v12;
  }
  return v6;
}

- (unint64_t)promisePresenterWithID:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  unint64_t v6 = v5->nextPromiseID + 1;
  v5->nextPromiseID = v6;
  objc_sync_exit(v5);

  queue = v5->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__FPDPresenterManager_promisePresenterWithID___block_invoke;
  block[3] = &unk_1E6A74088;
  id v11 = v4;
  unint64_t v12 = v6;
  block[4] = v5;
  id v8 = v4;
  dispatch_async(queue, block);

  return v6;
}

void __46__FPDPresenterManager_promisePresenterWithID___block_invoke(void *a1)
{
  v2 = *(void **)(a1[4] + 24);
  id v3 = [NSNumber numberWithUnsignedInteger:a1[6]];
  [v2 setObject:v3 forKey:a1[5]];
}

- (void)forgetPromiseForPresenterWithID:(id)a3 promiseID:(unint64_t)a4
{
  id v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__FPDPresenterManager_forgetPromiseForPresenterWithID_promiseID___block_invoke;
  block[3] = &unk_1E6A74088;
  block[4] = self;
  id v10 = v6;
  unint64_t v11 = a4;
  id v8 = v6;
  dispatch_async(queue, block);
}

void __65__FPDPresenterManager_forgetPromiseForPresenterWithID_promiseID___block_invoke(void *a1)
{
  v2 = [*(id *)(a1[4] + 24) objectForKey:a1[5]];
  uint64_t v3 = [v2 unsignedIntegerValue];
  uint64_t v4 = a1[6];

  if (v3 == v4)
  {
    uint64_t v5 = a1[5];
    id v6 = *(void **)(a1[4] + 24);
    [v6 removeObjectForKey:v5];
  }
}

- (void)addPresenter:(id)a3 itemID:(id)a4 urlHint:(id)a5 auditToken:(id *)a6 promiseID:(unint64_t)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  long long v16 = *(_OWORD *)&a6->var0[4];
  long long v25 = *(_OWORD *)a6->var0;
  long long v26 = v16;
  block[2] = __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke;
  block[3] = &unk_1E6A769B8;
  block[4] = self;
  id v21 = v13;
  id v23 = v14;
  unint64_t v24 = a7;
  id v22 = v12;
  id v17 = v14;
  id v18 = v12;
  id v19 = v13;
  dispatch_async(queue, block);
}

void __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 40));
  uint64_t v3 = [WeakRetained domainFromItemID:*(void *)(a1 + 40) reason:0];

  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 24) objectForKey:*(void *)(a1 + 48)];
  uint64_t v5 = [v4 unsignedIntegerValue];
  uint64_t v6 = *(void *)(a1 + 64);

  if (v5 != v6)
  {
    unint64_t v11 = fp_current_or_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke_cold_1((uint64_t *)(a1 + 48), v11);
    }
    goto LABEL_6;
  }
  [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 48)];
  if (v3)
  {
    uint64_t v8 = *(void *)(a1 + 40);
    uint64_t v7 = *(void *)(a1 + 48);
    uint64_t v9 = *(void *)(a1 + 56);
    long long v10 = *(_OWORD *)(a1 + 88);
    v12[0] = *(_OWORD *)(a1 + 72);
    v12[1] = v10;
    unint64_t v11 = +[FPDFilePresenter presenter:v7 withItemID:v8 auditToken:v12 urlHint:v9 domain:v3];
    [v11 start];
    [*(id *)(a1 + 32) willChangeValueForKey:@"presenters"];
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v11 forKey:*(void *)(a1 + 48)];
    [*(id *)(a1 + 32) didChangeValueForKey:@"presenters"];
LABEL_6:
  }
}

- (void)removePresenter:(id)a3
{
  id v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__FPDPresenterManager_removePresenter___block_invoke;
  v7[3] = &unk_1E6A736C0;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(queue, v7);
}

void __39__FPDPresenterManager_removePresenter___block_invoke(uint64_t a1)
{
  v2 = (uint64_t *)(a1 + 40);
  uint64_t v3 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKey:*(void *)(a1 + 40)];
  id v4 = v3;
  if (v3)
  {
    [v3 stop];
    [*(id *)(a1 + 32) willChangeValueForKey:@"presenters"];
    [*(id *)(*(void *)(a1 + 32) + 16) removeObjectForKey:*(void *)(a1 + 40)];
    [*(id *)(a1 + 32) didChangeValueForKey:@"presenters"];
  }
  else
  {
    uint64_t v5 = fp_current_or_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __39__FPDPresenterManager_removePresenter___block_invoke_cold_1(v2, v5);
    }

    [*(id *)(*(void *)(a1 + 32) + 24) removeObjectForKey:*(void *)(a1 + 40)];
  }
}

- (id)presenterWithID:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  objc_super v15 = __Block_byref_object_copy__17;
  long long v16 = __Block_byref_object_dispose__17;
  id v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__FPDPresenterManager_presenterWithID___block_invoke;
  block[3] = &unk_1E6A769E0;
  id v10 = v4;
  unint64_t v11 = &v12;
  block[4] = self;
  id v6 = v4;
  dispatch_sync(queue, block);
  id v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

uint64_t __39__FPDPresenterManager_presenterWithID___block_invoke(void *a1)
{
  *(void *)(*(void *)(a1[6] + 8) + 40) = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  return MEMORY[0x1F41817F8]();
}

- (id)presentersForDomain:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__FPDPresenterManager_presentersForDomain___block_invoke;
  block[3] = &unk_1E6A73418;
  block[4] = self;
  id v13 = v4;
  id v7 = v5;
  id v14 = v7;
  id v8 = v4;
  dispatch_sync(queue, block);
  uint64_t v9 = v14;
  id v10 = v7;

  return v10;
}

void __43__FPDPresenterManager_presentersForDomain___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __43__FPDPresenterManager_presentersForDomain___block_invoke_2;
  v3[3] = &unk_1E6A76A08;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __43__FPDPresenterManager_presentersForDomain___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  id v4 = [v6 domain];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5) {
    [*(id *)(a1 + 40) addObject:v6];
  }
}

- (void)signalPresentersForItemID:(id)a3
{
  id v4 = a3;
  id v5 = [v4 providerDomainID];
  id v6 = [v4 identifier];
  queue = self->_queue;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __49__FPDPresenterManager_signalPresentersForItemID___block_invoke;
  v11[3] = &unk_1E6A750F0;
  v11[4] = self;
  id v12 = v5;
  id v13 = v6;
  id v14 = v4;
  id v8 = v4;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(queue, v11);
}

void __49__FPDPresenterManager_signalPresentersForItemID___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2;
  v3[3] = &unk_1E6A76A30;
  id v4 = *(id *)(a1 + 40);
  id v5 = *(id *)(a1 + 48);
  id v6 = *(id *)(a1 + 56);
  [v2 enumerateKeysAndObjectsUsingBlock:v3];
}

void __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (([v4 isEnumeratorActive] & 1) == 0)
  {
    id v5 = [v4 observedItemID];
    id v6 = [v5 providerDomainID];
    int v7 = [v6 isEqual:*(void *)(a1 + 32)];

    if (v7)
    {
      if (([*(id *)(a1 + 40) isEqualToString:*MEMORY[0x1E4F25C70]] & 1) != 0
        || ([v4 observedItemID],
            id v8 = objc_claimAutoreleasedReturnValue(),
            [v8 identifier],
            id v9 = objc_claimAutoreleasedReturnValue(),
            int v10 = [v9 isEqualToString:*(void *)(a1 + 40)],
            v9,
            v8,
            v10))
      {
        unint64_t v11 = fp_current_or_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
          __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2_cold_1((uint64_t)v4, a1, v11);
        }

        [v4 enumerationResultsDidChange];
      }
    }
  }
}

- (NSDictionary)presenters
{
  return &self->_presenters->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_extensionManager);
  objc_storeStrong((id *)&self->_promisedPresenters, 0);
  objc_storeStrong((id *)&self->_presenters, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __72__FPDPresenterManager_addPresenter_itemID_urlHint_auditToken_promiseID___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Ignoring presenter creation for %@: promised has been deleted or superseded", (uint8_t *)&v3, 0xCu);
}

void __39__FPDPresenterManager_removePresenter___block_invoke_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1D744C000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Removing promise for presenter %@", (uint8_t *)&v3, 0xCu);
}

void __49__FPDPresenterManager_signalPresentersForItemID___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a2 + 48) identifier];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  id v9 = v5;
  _os_log_debug_impl(&dword_1D744C000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] signaling our passive file presenter %@ about a change on %@", (uint8_t *)&v6, 0x16u);
}

@end