@interface ASKFamilyPurchases
+ (ASKFamilyPurchases)shared;
- (ASKFamilyPurchases)init;
- (void)reloadDataWithBag:(id)a3 completion:(id)a4;
@end

@implementation ASKFamilyPurchases

+ (ASKFamilyPurchases)shared
{
  if (shared_sOnce != -1) {
    dispatch_once(&shared_sOnce, &__block_literal_global_6);
  }
  v2 = (void *)shared_sInstance;
  return (ASKFamilyPurchases *)v2;
}

void __28__ASKFamilyPurchases_shared__block_invoke()
{
  v0 = objc_alloc_init(ASKFamilyPurchases);
  v1 = (void *)shared_sInstance;
  shared_sInstance = (uint64_t)v0;
}

- (ASKFamilyPurchases)init
{
  v3.receiver = self;
  v3.super_class = (Class)ASKFamilyPurchases;
  return [(ASKFamilyPurchases *)&v3 init];
}

- (void)reloadDataWithBag:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = dispatch_get_global_queue(0, 0);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke;
  v10[3] = &unk_1E6DA8D48;
  id v11 = v5;
  id v12 = v6;
  id v8 = v6;
  id v9 = v5;
  dispatch_async(v7, v10);
}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke(uint64_t a1)
{
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x3032000000;
  v27[3] = __Block_byref_object_copy_;
  v27[4] = __Block_byref_object_dispose_;
  id v28 = 0;
  v25[0] = 0;
  v25[1] = v25;
  v25[2] = 0x3032000000;
  v25[3] = __Block_byref_object_copy_;
  v25[4] = __Block_byref_object_dispose_;
  id v26 = 0;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy_;
  v23[4] = __Block_byref_object_dispose_;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy_;
  v21[4] = __Block_byref_object_dispose_;
  id v22 = 0;
  dispatch_semaphore_t v2 = dispatch_semaphore_create(0);
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  v4 = (void *)[objc_alloc(MEMORY[0x1E4F4DCC0]) initWithBag:*(void *)(a1 + 32)];
  id v5 = [v4 performFamilyInfoLookup];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_18;
  v17[3] = &unk_1E6DA8CD0;
  v19 = v27;
  v20 = v25;
  id v6 = v2;
  v18 = v6;
  [v5 addFinishBlock:v17];
  id v7 = objc_alloc_init(MEMORY[0x1E4F61858]);
  [v7 setQualityOfService:17];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_2;
  v13[3] = &unk_1E6DA8CF8;
  v15 = v23;
  v16 = v21;
  id v8 = v3;
  v14 = v8;
  [v7 startRequestWithCompletionHandler:v13];
  dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_semaphore_wait(v8, 0xFFFFFFFFFFFFFFFFLL);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_3;
  block[3] = &unk_1E6DA8D20;
  id v11 = v23;
  id v12 = v27;
  id v10 = *(id *)(a1 + 40);
  dispatch_async(MEMORY[0x1E4F14428], block);

  _Block_object_dispose(v21, 8);
  _Block_object_dispose(v23, 8);

  _Block_object_dispose(v25, 8);
  _Block_object_dispose(v27, 8);
}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(*(void *)(a1 + 40) + 8);
  id v8 = *(void **)(v7 + 40);
  *(void *)(v7 + 40) = v5;
  id v12 = v5;

  uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
  id v10 = *(void **)(v9 + 40);
  *(void *)(v9 + 40) = v6;
  id v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __51__ASKFamilyPurchases_reloadDataWithBag_completion___block_invoke_3(void *a1)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  dispatch_semaphore_t v2 = objc_msgSend(MEMORY[0x1E4F179C8], "ams_sharedAccountStore");
  dispatch_semaphore_t v3 = objc_msgSend(v2, "ams_activeiTunesAccount");

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  v4 = objc_msgSend(*(id *)(*(void *)(a1[5] + 8) + 40), "members", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v4);
        }
        id v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 isMe])
        {
          id v11 = v10;

          uint64_t v7 = v11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  if (*(void *)(*(void *)(a1[6] + 8) + 40))
  {
LABEL_13:
    if (*(void *)(*(void *)(a1[5] + 8) + 40)) {
      BOOL v12 = v7 == 0;
    }
    else {
      BOOL v12 = 1;
    }
    if (!v12)
    {
      v19 = [v7 iTunesAccountDSID];

      if (v19)
      {
        v20 = [v7 iTunesAccountDSID];
        v21 = objc_msgSend(v3, "ams_DSID");
        int v22 = [v20 isEqual:v21];

        if (v22) {
          uint64_t v13 = 0;
        }
        else {
          uint64_t v13 = 2;
        }
      }
      else
      {
        uint64_t v13 = 3;
      }
      goto LABEL_30;
    }
LABEL_18:
    uint64_t v13 = 0;
    goto LABEL_30;
  }
  v14 = [*(id *)(*(void *)(a1[5] + 8) + 40) members];
  uint64_t v15 = [v14 count];

  if (!v15)
  {
    if (!*(void *)(*(void *)(a1[6] + 8) + 40)) {
      goto LABEL_18;
    }
    goto LABEL_13;
  }
  v16 = [v7 iTunesAccountDSID];
  v17 = objc_msgSend(v3, "ams_DSID");
  int v18 = [v16 isEqual:v17];

  if (v18) {
    uint64_t v13 = 3;
  }
  else {
    uint64_t v13 = 1;
  }
LABEL_30:
  uint64_t v23 = a1[4];
  uint64_t v24 = *(void *)(*(void *)(a1[6] + 8) + 40);
  v25 = [v7 appleID];
  (*(void (**)(uint64_t, uint64_t, uint64_t, void *))(v23 + 16))(v23, v24, v13, v25);
}

@end