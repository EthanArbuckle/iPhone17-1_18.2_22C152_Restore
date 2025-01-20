@interface MSPStorageTipsManager
- (MSPStorageTipsManager)init;
- (void)dealloc;
- (void)fetchProposedTipWithCompletionHandler:(id)a3;
@end

@implementation MSPStorageTipsManager

- (MSPStorageTipsManager)init
{
  v10.receiver = self;
  v10.super_class = (Class)MSPStorageTipsManager;
  v2 = [(MSPStorageTipsManager *)&v10 init];
  if (v2)
  {
    objc_initWeak(&location, v2);
    id v3 = MEMORY[0x1E4F14428];
    objc_copyWeak(&v8, &location);
    uint64_t v4 = _GEOConfigAddBlockListenerForKey();
    id offlineOptimizeStorageEnabledListener = v2->_offlineOptimizeStorageEnabledListener;
    v2->_id offlineOptimizeStorageEnabledListener = (id)v4;

    v6 = v2;
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }

  return v2;
}

void __29__MSPStorageTipsManager_init__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v1 postNotificationName:@"MSPStorageTipsManagerTipDidChangeNotification" object:WeakRetained];
  }
}

- (void)dealloc
{
  GEOConfigRemoveBlockListener();
  v3.receiver = self;
  v3.super_class = (Class)MSPStorageTipsManager;
  [(MSPStorageTipsManager *)&v3 dealloc];
}

- (void)fetchProposedTipWithCompletionHandler:(id)a3
{
  id v3 = a3;
  if (GEOConfigGetBOOL())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke;
    block[3] = &unk_1E617D980;
    id v13 = v3;
    id v4 = v3;
    dispatch_async(MEMORY[0x1E4F14428], block);
    id v5 = v13;
  }
  else
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F64688]);
    global_queue = (void *)geo_get_global_queue();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2;
    v9[3] = &unk_1E617E270;
    id v10 = v6;
    id v11 = v3;
    id v5 = v6;
    id v8 = v3;
    [v5 fetchAllSubscriptionsWithCallbackQueue:global_queue completionHandler:v9];
  }
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  v18 = v4;
  id v19 = a3;
  if (v4)
  {
    if (objc_msgSend(v4, "count", v4, v19))
    {
      id v5 = objc_msgSend(v4, "_geo_filtered:", &__block_literal_global_15);
      if ([v5 count])
      {
        v44[0] = 0;
        v44[1] = v44;
        v44[2] = 0x2810000000;
        v44[3] = "";
        int v45 = 0;
        v42[0] = 0;
        v42[1] = v42;
        v42[2] = 0x3032000000;
        v42[3] = __Block_byref_object_copy__5;
        v42[4] = __Block_byref_object_dispose__5;
        id v43 = 0;
        v40[0] = 0;
        v40[1] = v40;
        v40[2] = 0x2020000000;
        char v41 = 0;
        id v6 = dispatch_group_create();
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id obj = v5;
        uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v53 count:16];
        if (v7)
        {
          uint64_t v8 = *(void *)v37;
          do
          {
            for (uint64_t i = 0; i != v7; ++i)
            {
              if (*(void *)v37 != v8) {
                objc_enumerationMutation(obj);
              }
              id v10 = *(void **)(*((void *)&v36 + 1) + 8 * i);
              dispatch_group_enter(v6);
              id v11 = *(void **)(a1 + 32);
              v12 = [v10 identifier];
              global_queue = (void *)geo_get_global_queue();
              v31[0] = MEMORY[0x1E4F143A8];
              v31[1] = 3221225472;
              v31[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_7;
              v31[3] = &unk_1E617E1B0;
              v33 = v42;
              v34 = v44;
              v35 = v40;
              v32 = v6;
              [v11 fetchStateForSubscriptionWithIdentifier:v12 callbackQueue:global_queue completionHandler:v31];
            }
            uint64_t v7 = [obj countByEnumeratingWithState:&v36 objects:v53 count:16];
          }
          while (v7);
        }

        v30[0] = 0;
        v30[1] = v30;
        v30[2] = 0x2020000000;
        v30[3] = 0;
        dispatch_group_enter(v6);
        v14 = *(void **)(a1 + 32);
        v15 = (void *)geo_get_global_queue();
        v27[0] = MEMORY[0x1E4F143A8];
        v27[1] = 3221225472;
        v27[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2_9;
        v27[3] = &unk_1E617E1D8;
        v29 = v30;
        v16 = v6;
        v28 = v16;
        [v14 _calculateTotalSizeOfOfflineSubscriptionsWithCallbackQueue:v15 completionHandler:v27];

        v17 = geo_get_global_queue();
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3_11;
        block[3] = &unk_1E617E248;
        v24 = v40;
        v25 = v30;
        id v23 = *(id *)(a1 + 40);
        v26 = v42;
        dispatch_group_notify(v16, v17, block);

        _Block_object_dispose(v30, 8);
        _Block_object_dispose(v40, 8);
        _Block_object_dispose(v42, 8);

        _Block_object_dispose(v44, 8);
        id v5 = obj;
      }
      else
      {
        v46[0] = MEMORY[0x1E4F143A8];
        v46[1] = 3221225472;
        v46[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6;
        v46[3] = &unk_1E617D980;
        id v47 = *(id *)(a1 + 40);
        dispatch_async(MEMORY[0x1E4F14428], v46);
      }
    }
    else
    {
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_4;
      v48[3] = &unk_1E617D980;
      id v49 = *(id *)(a1 + 40);
      dispatch_async(MEMORY[0x1E4F14428], v48);
      id v5 = v49;
    }
  }
  else
  {
    v50[0] = MEMORY[0x1E4F143A8];
    v50[1] = 3221225472;
    v50[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3;
    v50[3] = &unk_1E617D7A0;
    id v52 = *(id *)(a1 + 40);
    id v51 = v19;
    dispatch_async(MEMORY[0x1E4F14428], v50);

    id v5 = v52;
  }
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

unint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_5(uint64_t a1, void *a2)
{
  return ((unint64_t)[a2 dataTypes] >> 10) & 1;
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_7(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (v7)
  {
    if ((unint64_t)([v7 loadState] - 1) > 2) {
      goto LABEL_7;
    }
    uint64_t v6 = a1 + 48;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
  }
  else
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)) {
      goto LABEL_7;
    }
    uint64_t v6 = a1 + 48;
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(*(void *)(a1 + 48) + 8) + 32));
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(*(void *)v6 + 8) + 32));
LABEL_7:
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_2_9(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3 = 0x7FFFFFFFFFFFFFFFLL;
  if (a2 < 0x7FFFFFFFFFFFFFFFLL) {
    uint64_t v3 = a2;
  }
  if (a3) {
    uint64_t v3 = -1;
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_3_11(uint64_t a1)
{
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
  {
    v2 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MapsSupport"];
    uint64_t v3 = [v2 localizedStringForKey:@"OFFLINE_OPTIMIZE_STORAGE_TIP_MESSAGE" value:@"localized string not found" table:@"Offline"];

    id v4 = [MSPStorageTip alloc];
    id v5 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.MapsSupport"];
    uint64_t v6 = [v5 localizedStringForKey:@"OFFLINE_OPTIMIZE_STORAGE_TIP_TITLE" value:@"localized string not found" table:@"Offline"];
    id v7 = [(MSPStorageTip *)v4 initWithTitle:v6 message:v3 expectedSize:*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) enablementAction:&__block_literal_global_32];

    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_5_33;
    block[3] = &unk_1E617D7A0;
    id v8 = *(id *)(a1 + 32);
    v16 = v7;
    id v17 = v8;
    v9 = v7;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  else
  {
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6_34;
    v12[3] = &unk_1E617E220;
    id v10 = *(id *)(a1 + 32);
    uint64_t v11 = *(void *)(a1 + 56);
    id v13 = v10;
    uint64_t v14 = v11;
    dispatch_async(MEMORY[0x1E4F14428], v12);
    uint64_t v3 = v13;
  }
}

void __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_4_29(uint64_t a1, void *a2)
{
  v2 = a2;
  GEOConfigSetBOOL();
  v2[2](v2, 0);
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_5_33(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

uint64_t __63__MSPStorageTipsManager_fetchProposedTipWithCompletionHandler___block_invoke_6_34(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), 0, *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
}

- (void).cxx_destruct
{
}

@end