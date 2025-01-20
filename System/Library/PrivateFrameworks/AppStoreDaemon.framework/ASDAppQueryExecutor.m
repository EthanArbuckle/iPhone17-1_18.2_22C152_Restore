@interface ASDAppQueryExecutor
+ (void)_executeQueryWithPredicate:(char)a3 isForUpdates:(char)a4 reloadingFromServer:(void *)a5 onPairedDevice:(void *)a6 usingServiceBroker:(void *)a7 withResultHandler:;
- (ASDAppQueryExecutor)init;
- (ASDAppQueryExecutor)initWithServiceBroker:(id)a3;
- (int64_t)queryOptions;
- (void)executeQueryWithPredicate:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5;
- (void)executeUpdatesQueryWithPredicateReloadingFromServer:(BOOL)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5;
- (void)setQueryOptions:(int64_t)a3;
@end

@implementation ASDAppQueryExecutor

void __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_6(uint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = [v3 count];
    uint64_t v6 = *(void *)(a1 + 32);
    int v7 = 134218242;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v6;
    _os_log_debug_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching %lu results: %@", (uint8_t *)&v7, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_15(uint64_t a1, void *a2)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    int v5 = 134217984;
    uint64_t v6 = [v3 count];
    _os_log_debug_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching %lu results for updates", (uint8_t *)&v5, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)executeQueryWithPredicate:(id)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatchQueue = self->_dispatchQueue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke;
  v15[3] = &unk_1E58B3FF0;
  id v16 = v8;
  id v17 = v9;
  v18 = self;
  id v19 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  [(ASDDispatchQueue *)dispatchQueue syncUsingBlock:v15];
}

- (void)executeUpdatesQueryWithPredicateReloadingFromServer:(BOOL)a3 onPairedDevice:(id)a4 withResultHandler:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  dispatchQueue = self->_dispatchQueue;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke;
  v13[3] = &unk_1E58B4040;
  BOOL v16 = a3;
  v13[4] = self;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [(ASDDispatchQueue *)dispatchQueue syncUsingBlock:v13];
}

- (void)setQueryOptions:(int64_t)a3
{
  self->_queryOptions = a3;
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2_18(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = v5;
  if (a2)
  {
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2;
    v33[3] = &unk_1E58B4090;
    id v34 = *(id *)(a1 + 32);
    long long v38 = *(_OWORD *)(a1 + 64);
    __int16 v39 = *(_WORD *)(a1 + 80);
    id v35 = *(id *)(a1 + 40);
    id v36 = *(id *)(a1 + 48);
    id v37 = *(id *)(a1 + 56);
    uint64_t v7 = [a2 remoteObjectProxyWithErrorHandler:v33];
    id v8 = *(void **)(a1 + 40);
    if (v8)
    {
      if (!*(unsigned char *)(a1 + 80))
      {
        uint64_t v14 = *(void *)(a1 + 32);
        id v15 = [v8 pairingID];
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_4;
        v25[3] = &unk_1E58B2D30;
        id v10 = &v26;
        id v26 = *(id *)(a1 + 56);
        [v7 executeQueryWithPredicate:v14 onPairedDevice:v15 withReplyHandler:v25];

        goto LABEL_14;
      }
      uint64_t v9 = *(unsigned __int8 *)(a1 + 81);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3_19;
      v27[3] = &unk_1E58B2D30;
      id v10 = &v28;
      id v28 = *(id *)(a1 + 56);
      id v11 = v27;
    }
    else
    {
      if (!*(unsigned char *)(a1 + 80))
      {
        uint64_t v16 = *(void *)(a1 + 32);
        v29[0] = MEMORY[0x1E4F143A8];
        v29[1] = 3221225472;
        v29[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2_18;
        v29[3] = &unk_1E58B2D30;
        id v10 = &v30;
        id v30 = *(id *)(a1 + 56);
        [v7 executeQueryWithPredicate:v16 withReplyHandler:v29];
        goto LABEL_14;
      }
      uint64_t v9 = *(unsigned __int8 *)(a1 + 81);
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_17;
      v31[3] = &unk_1E58B2D30;
      id v10 = &v32;
      id v32 = *(id *)(a1 + 56);
      id v11 = v31;
    }
    [v7 executeQueryForUpdatesReloadingFromServer:v9 withReplyHandler:v11];
LABEL_14:

    id v12 = v34;
    goto LABEL_15;
  }
  __ErrorWithUnderlyingErrorAndPredicate(v5, *(void **)(a1 + 32));
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && ASDErrorIsEqual(v6, (void *)*MEMORY[0x1E4F281F8], 4097))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    id v13 = dispatch_get_global_queue(21, 0);
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_5;
    v17[3] = &unk_1E58B4068;
    uint64_t v23 = *(void *)(a1 + 72);
    id v12 = v12;
    id v18 = v12;
    id v19 = *(id *)(a1 + 32);
    __int16 v24 = *(_WORD *)(a1 + 80);
    id v20 = *(id *)(a1 + 40);
    id v21 = *(id *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    dispatch_async(v13, v17);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
LABEL_15:
}

void __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke(uint64_t a1)
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  v2 = *(void **)(a1 + 32);
  id v3 = NSString;
  id v4 = *(id *)(a1 + 40);
  id v5 = [v2 predicateFormat];
  uint64_t v6 = [v4 pairingID];

  uint64_t v7 = [v6 UUIDString];
  id v8 = (void *)v7;
  uint64_t v9 = @"LOCAL";
  if (v7) {
    uint64_t v9 = (__CFString *)v7;
  }
  id v10 = [v3 stringWithFormat:@"<%@>-<%@>", v5, v9];

  id v11 = [*(id *)(*(void *)(a1 + 48) + 16) objectForKeyedSubscript:v10];
  id v12 = ASDLogHandleForCategory(13);
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG);
  if (v11)
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_debug_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Joining request: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v13)
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v10;
      _os_log_debug_impl(&dword_19BF6A000, v12, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Starting request: %@", buf, 0xCu);
    }

    id v11 = objc_alloc_init(ASDPromise);
    [*(id *)(*(void *)(a1 + 48) + 16) setObject:v11 forKeyedSubscript:v10];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_3;
    v28[3] = &unk_1E58B2FD0;
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)(a1 + 48);
    v29 = v14;
    uint64_t v30 = v15;
    [(ASDPromise *)v11 alwaysPerform:v28 onScheduler:*(void *)(v15 + 8)];
    uint64_t v16 = *(void **)(a1 + 32);
    id v17 = *(void **)(a1 + 40);
    id v18 = *(void **)(*(void *)(a1 + 48) + 24);
    id v19 = [(ASDPromise *)v11 completionHandlerAdapter];
    +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:]((uint64_t)ASDAppQueryExecutor, v16, 0, 0, v17, v18, v19);

    id v12 = v29;
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_6;
  v25[3] = &unk_1E58B3FC8;
  id v26 = v10;
  id v27 = *(id *)(a1 + 56);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_8;
  v22[3] = &unk_1E58B3040;
  id v23 = v26;
  id v24 = *(id *)(a1 + 56);
  id v20 = v26;
  id v21 = +[ASDDispatchQueue defaultQueue];
  [(ASDPromise *)v11 thenPerform:v25 orCatchError:v22 onScheduler:v21];
}

void __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 16) objectForKeyedSubscript:@"Updates"];
  id v3 = ASDLogHandleForCategory(13);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);
  if (v2)
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Joining updates request", buf, 2u);
    }
  }
  else
  {
    if (v4)
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_19BF6A000, v3, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Starting updates request", buf, 2u);
    }

    v2 = objc_alloc_init(ASDPromise);
    [*(id *)(*(void *)(a1 + 32) + 16) setObject:v2 forKeyedSubscript:@"Updates"];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_14;
    v14[3] = &unk_1E58B2FD0;
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = @"Updates";
    [(ASDPromise *)v2 alwaysPerform:v14 onScheduler:*(void *)(v15 + 8)];
    char v5 = *(unsigned char *)(a1 + 56);
    uint64_t v6 = *(void **)(a1 + 40);
    uint64_t v7 = *(void **)(*(void *)(a1 + 32) + 24);
    id v8 = [(ASDPromise *)v2 completionHandlerAdapter];
    +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:]((uint64_t)ASDAppQueryExecutor, 0, 1, v5, v6, v7, v8);
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_15;
  v12[3] = &unk_1E58B4018;
  id v13 = *(id *)(a1 + 48);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_16;
  v10[3] = &unk_1E58B2CB8;
  id v11 = *(id *)(a1 + 48);
  uint64_t v9 = +[ASDDispatchQueue defaultQueue];
  [(ASDPromise *)v2 thenPerform:v12 orCatchError:v10 onScheduler:v9];
}

+ (void)_executeQueryWithPredicate:(char)a3 isForUpdates:(char)a4 reloadingFromServer:(void *)a5 onPairedDevice:(void *)a6 usingServiceBroker:(void *)a7 withResultHandler:
{
  id v12 = a2;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  uint64_t v16 = self;
  if (v14)
  {
    uint64_t v17 = v16;
    v28[0] = 0;
    v28[1] = v28;
    v28[2] = 0x2020000000;
    char v29 = 1;
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke;
    v19[3] = &unk_1E58B40B8;
    id v20 = v12;
    id v24 = v28;
    uint64_t v25 = v17;
    char v26 = a3;
    char v27 = a4;
    id v21 = v13;
    id v22 = v14;
    id v23 = v15;
    [v22 getLibraryServiceWithCompletionHandler:v19];

    _Block_object_dispose(v28, 8);
  }
  else
  {
    id v18 = __ErrorWithUnderlyingErrorAndPredicate(0, v12);
    (*((void (**)(id, void, void *))v15 + 2))(v15, 0, v18);
  }
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_17(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    int v5 = 138412290;
    uint64_t v6 = v4;
    _os_log_debug_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Completing request: %@", (uint8_t *)&v5, 0xCu);
  }

  return [*(id *)(*(void *)(a1 + 40) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 32)];
}

- (ASDAppQueryExecutor)initWithServiceBroker:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)ASDAppQueryExecutor;
  uint64_t v6 = [(ASDAppQueryExecutor *)&v13 init];
  uint64_t v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_serviceBroker, a3);
    id v8 = [[ASDDispatchQueue alloc] initWithName:@"com.apple.AppStoreDaemon.ASDAppQuery.executor"];
    dispatchQueue = v7->_dispatchQueue;
    v7->_dispatchQueue = v8;

    id v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    queryPromises = v7->_queryPromises;
    v7->_queryPromises = v10;
  }
  return v7;
}

uint64_t __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_14(uint64_t a1)
{
  v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v4 = 0;
    _os_log_debug_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Completing updates request", v4, 2u);
  }

  return [*(id *)(*(void *)(a1 + 32) + 16) setObject:0 forKeyedSubscript:*(void *)(a1 + 40)];
}

- (ASDAppQueryExecutor)init
{
  return [(ASDAppQueryExecutor *)self initWithServiceBroker:0];
}

void __82__ASDAppQueryExecutor_executeQueryWithPredicate_onPairedDevice_withResultHandler___block_invoke_8(uint64_t a1, void *a2)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v6 = 138412290;
    uint64_t v7 = v5;
    _os_log_debug_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching error: %@", (uint8_t *)&v6, 0xCu);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __108__ASDAppQueryExecutor_executeUpdatesQueryWithPredicateReloadingFromServer_onPairedDevice_withResultHandler___block_invoke_16(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_debug_impl(&dword_19BF6A000, v4, OS_LOG_TYPE_DEBUG, "(AppQueryExecutor) Dispatching error for updates", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = __ErrorWithUnderlyingErrorAndPredicate(v3, *(void **)(a1 + 32));
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)
    && ASDErrorIsEqual(v3, (void *)*MEMORY[0x1E4F281F8], 4097))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
    uint64_t v5 = dispatch_get_global_queue(21, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3;
    block[3] = &unk_1E58B4068;
    uint64_t v12 = *(void *)(a1 + 72);
    id v7 = v4;
    id v8 = *(id *)(a1 + 32);
    __int16 v13 = *(_WORD *)(a1 + 80);
    id v9 = *(id *)(a1 + 40);
    id v10 = *(id *)(a1 + 48);
    id v11 = *(id *)(a1 + 56);
    dispatch_async(v5, block);
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    id v6 = v4;
    _os_log_error_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_ERROR, "[%{public}@]: Making second attempt to execute query after error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:](*(void *)(a1 + 72), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_3_19(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t __135__ASDAppQueryExecutor__executeQueryWithPredicate_isForUpdates_reloadingFromServer_onPairedDevice_usingServiceBroker_withResultHandler___block_invoke_5(uint64_t a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = ASDLogHandleForCategory(13);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    uint64_t v4 = objc_opt_class();
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138543618;
    id v8 = v4;
    __int16 v9 = 2114;
    uint64_t v10 = v5;
    id v6 = v4;
    _os_log_error_impl(&dword_19BF6A000, v2, OS_LOG_TYPE_ERROR, "[%{public}@]: Making second attempt to request service after error: %{public}@", (uint8_t *)&v7, 0x16u);
  }
  return +[ASDAppQueryExecutor _executeQueryWithPredicate:isForUpdates:reloadingFromServer:onPairedDevice:usingServiceBroker:withResultHandler:](*(void *)(a1 + 72), *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 80), *(unsigned __int8 *)(a1 + 81), *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64));
}

- (int64_t)queryOptions
{
  return self->_queryOptions;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_serviceBroker, 0);
  objc_storeStrong((id *)&self->_queryPromises, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
}

@end