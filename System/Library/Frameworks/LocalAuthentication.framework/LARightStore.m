@interface LARightStore
+ (LARightStore)sharedStore;
- (LARightStore)init;
- (id)description;
- (id)keyStore;
- (void)_saveRight:(void *)a3 identifier:(void *)a4 secret:(void *)a5 completion:;
- (void)dealloc;
- (void)init;
- (void)removeAllRightsWithCompletion:(void *)handler;
- (void)removeRight:(LAPersistedRight *)right completion:(void *)handler;
- (void)removeRightForIdentifier:(NSString *)identifier completion:(void *)handler;
- (void)rightForIdentifier:(NSString *)identifier completion:(void *)handler;
- (void)saveRight:(LARight *)right identifier:(NSString *)identifier completion:(void *)handler;
- (void)saveRight:(LARight *)right identifier:(NSString *)identifier secret:(NSData *)secret completion:(void *)handler;
- (void)setKeyStore:(uint64_t)a1;
@end

@implementation LARightStore

- (LARightStore)init
{
  v10.receiver = self;
  v10.super_class = (Class)LARightStore;
  v2 = [(LARightStore *)&v10 init];
  if (v2)
  {
    uint64_t v3 = +[LAKeyStoreBuilder buildKeyStore];
    keyStore = v2->_keyStore;
    v2->_keyStore = (LAKeyStore *)v3;

    uint64_t v5 = [MEMORY[0x1E4F72F38] createDefaultSerialQueueWithIdentifier:@"LARightStore"];
    workQueue = v2->_workQueue;
    v2->_workQueue = (OS_dispatch_queue *)v5;

    v7 = [MEMORY[0x1E4F30B98] sharedInstance];
    v2->_instanceID = [v7 nextInstanceIDInDomain:@"LARightStore"];

    v8 = LA_LOG_0();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      [(LARightStore *)(uint64_t)v2 init];
    }
  }
  return v2;
}

- (void)dealloc
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BED06000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ deallocated", (uint8_t *)&v2, 0xCu);
}

+ (LARightStore)sharedStore
{
  if (sharedStore_onceToken != -1) {
    dispatch_once(&sharedStore_onceToken, &__block_literal_global_2);
  }
  int v2 = (void *)sharedStore_sharedInstance;

  return (LARightStore *)v2;
}

uint64_t __27__LARightStore_sharedStore__block_invoke()
{
  v0 = objc_alloc_init(LARightStore);
  uint64_t v1 = sharedStore_sharedInstance;
  sharedStore_sharedInstance = (uint64_t)v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

- (void)rightForIdentifier:(NSString *)identifier completion:(void *)handler
{
  v6 = identifier;
  v7 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke;
  block[3] = &unk_1E63C42A8;
  block[4] = self;
  objc_copyWeak(&v14, &location);
  v12 = v6;
  id v13 = v7;
  v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.rightForIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2;
  block[3] = &unk_1E63C4280;
  block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v8, (id *)(a1 + 56));
  id v7 = *(id *)(a1 + 48);
  id v5 = *(id *)(a1 + 40);
  os_activity_t v6 = v2;
  uint64_t v3 = v2;
  os_activity_apply(v3, block);

  objc_destroyWeak(&v8);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v20 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ rightForIdentifier started", buf, 0xCu);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 64));
  if (WeakRetained)
  {
    id v5 = (id *)(a1 + 40);
    os_activity_t v6 = +[LAKeyIdentifier defaultAccessKeyIdentifierForRightWithIdentifier:*(void *)(a1 + 40)];
    id v7 = +[LAKeyIdentifier domainForRightWithIdentifier:*(void *)(a1 + 40)];
    id v8 = (void *)WeakRetained[1];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_12;
    v13[3] = &unk_1E63C4258;
    id v14 = *(id *)(a1 + 48);
    objc_copyWeak(&v18, (id *)(a1 + 64));
    id v17 = *(id *)(a1 + 56);
    id v9 = v7;
    id v15 = v9;
    id v16 = *v5;
    [v8 fetchKeyWithIdentifier:v6 domain:v9 completion:v13];

    objc_destroyWeak(&v18);
  }
  else
  {
    id v10 = LA_LOG_0();
    os_log_type_t v11 = LALogTypeForInternalError();
    if (os_log_type_enabled(v10, v11))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v10, v11, "Operation interrupted", buf, 2u);
    }

    uint64_t v12 = *(void *)(a1 + 56);
    os_activity_t v6 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v12 + 16))(v12, 0, v6);
  }
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_12(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2_13;
  block[3] = &unk_1E63C41E0;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  objc_copyWeak(&v17, a1 + 8);
  id v16 = a1[7];
  id v13 = a1[5];
  id v14 = a1[4];
  id v15 = a1[6];
  os_activity_apply(v7, block);

  objc_destroyWeak(&v17);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_13(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    os_activity_t v2 = LA_LOG_0();
    if (*(void *)(a1 + 32)) {
      os_log_type_t v3 = LALogTypeForInternalError();
    }
    else {
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
    }
    if (os_log_type_enabled(v2, v3))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11)
      {
        id v12 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
      }
      else
      {
        id v12 = @"successfully";
      }
      *(_DWORD *)buf = 138543618;
      id v24 = WeakRetained;
      __int16 v25 = 2114;
      v26 = v12;
      _os_log_impl(&dword_1BED06000, v2, v3, "%{public}@ rightForIdentifier finished %{public}@", buf, 0x16u);
      if (v11) {
    }
      }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      __46__LARightStore_rightForIdentifier_completion___block_invoke_2_13_cold_1();
    }
    uint64_t v4 = [[LAAccessKey alloc] initWithKey:*(void *)(a1 + 40)];
    id v5 = objc_loadWeakRetained((id *)(a1 + 80));
    id v6 = v5;
    if (v5)
    {
      id v7 = (void *)*((void *)v5 + 1);
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_24;
      v16[3] = &unk_1E63C4208;
      uint64_t v8 = *(void *)(a1 + 48);
      id v17 = *(id *)(a1 + 56);
      objc_copyWeak(&v22, (id *)(a1 + 80));
      id v21 = *(id *)(a1 + 72);
      id v18 = *(id *)(a1 + 48);
      id v19 = *(id *)(a1 + 64);
      uint64_t v20 = v4;
      [v7 fetchGenericPasswordsWithDomain:v8 completion:v16];

      objc_destroyWeak(&v22);
      id v9 = v17;
    }
    else
    {
      id v13 = LA_LOG_0();
      os_log_type_t v14 = LALogTypeForInternalError();
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BED06000, v13, v14, "Operation interrupted", buf, 2u);
      }

      uint64_t v15 = *(void *)(a1 + 72);
      id v9 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v9);
    }
  }
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_24(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2_25;
  v10[3] = &unk_1E63C4230;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  objc_copyWeak(&v18, a1 + 9);
  id v17 = a1[8];
  id v13 = a1[5];
  id v14 = a1[4];
  id v15 = a1[6];
  id v16 = a1[7];
  os_activity_apply(v7, v10);

  objc_destroyWeak(&v18);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_25(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    if (!+[LAAuthorizationError isResourceNotFoundError:](LAAuthorizationError, "isResourceNotFoundError:"))
    {
      os_activity_t v2 = LA_LOG_0();
      if (*(void *)(a1 + 32)) {
        os_log_type_t v3 = LALogTypeForInternalError();
      }
      else {
        os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
      }
      if (os_log_type_enabled(v2, v3))
      {
        id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
        uint64_t v19 = *(void *)(a1 + 32);
        if (v19)
        {
          uint64_t v20 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
        }
        else
        {
          uint64_t v20 = @"successfully";
        }
        *(_DWORD *)buf = 138543618;
        id v31 = WeakRetained;
        __int16 v32 = 2114;
        v33 = v20;
        _os_log_impl(&dword_1BED06000, v2, v3, "%{public}@ rightForIdentifier finished %{public}@", buf, 0x16u);
        if (v19) {
      }
        }
      (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
      return;
    }
  }
  else if (!*(void *)(a1 + 40))
  {
    __46__LARightStore_rightForIdentifier_completion___block_invoke_2_25_cold_1();
  }
  uint64_t v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
  id v5 = *(void **)(a1 + 40);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_27;
  v28[3] = &unk_1E63C4190;
  id v6 = v4;
  id v29 = v6;
  [v5 enumerateObjectsUsingBlock:v28];
  if (![v6 count])
  {
    id v7 = [LASecret alloc];
    id v8 = +[LAKeyStoreItemBuilder buildNullGenericPassword];
    id v9 = [(LASecret *)v7 initWithGenericPassword:v8];
    [v6 addObject:v9];
  }
  id v10 = objc_loadWeakRetained((id *)(a1 + 88));
  id v11 = v10;
  if (v10)
  {
    id v12 = (void *)*((void *)v10 + 1);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_31;
    v21[3] = &unk_1E63C4208;
    uint64_t v13 = *(void *)(a1 + 48);
    id v22 = *(id *)(a1 + 56);
    objc_copyWeak(&v27, (id *)(a1 + 88));
    id v26 = *(id *)(a1 + 80);
    id v23 = *(id *)(a1 + 64);
    id v24 = *(id *)(a1 + 72);
    id v25 = v6;
    [v12 fetchKeysWithDomain:v13 completion:v21];

    objc_destroyWeak(&v27);
    id v14 = v22;
  }
  else
  {
    id v15 = LA_LOG_0();
    os_log_type_t v16 = LALogTypeForInternalError();
    if (os_log_type_enabled(v15, v16))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v15, v16, "Operation interrupted", buf, 2u);
    }

    uint64_t v17 = *(void *)(a1 + 80);
    id v14 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v17 + 16))(v17, 0, v14);
  }
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_27(uint64_t a1, void *a2)
{
  os_activity_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [[LASecret alloc] initWithGenericPassword:v3];

  [v2 addObject:v4];
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_2_32;
  block[3] = &unk_1E63C41E0;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  objc_copyWeak(&v17, (id *)(a1 + 72));
  id v16 = *(id *)(a1 + 64);
  id v13 = *(id *)(a1 + 40);
  id v14 = *(id *)(a1 + 48);
  id v15 = *(id *)(a1 + 56);
  os_activity_apply(v7, block);

  objc_destroyWeak(&v17);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_32(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    os_activity_t v2 = LA_LOG_0();
    if (*(void *)(a1 + 32)) {
      os_log_type_t v3 = LALogTypeForInternalError();
    }
    else {
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
    }
    if (os_log_type_enabled(v2, v3))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
      uint64_t v12 = *(void *)(a1 + 32);
      if (v12)
      {
        id v13 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
      }
      else
      {
        id v13 = @"successfully";
      }
      *(_DWORD *)buf = 138543618;
      id v17 = WeakRetained;
      __int16 v18 = 2114;
      uint64_t v19 = v13;
      _os_log_impl(&dword_1BED06000, v2, v3, "%{public}@ rightForIdentifier finished %{public}@", buf, 0x16u);
      if (v12) {
    }
      }
    (*(void (**)(void))(*(void *)(a1 + 72) + 16))();
  }
  else
  {
    if (!*(void *)(a1 + 40)) {
      __46__LARightStore_rightForIdentifier_completion___block_invoke_2_32_cold_1();
    }
    uint64_t v4 = (void *)[MEMORY[0x1E4F1CBF0] mutableCopy];
    id v5 = *(void **)(a1 + 40);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __46__LARightStore_rightForIdentifier_completion___block_invoke_34;
    v14[3] = &unk_1E63C41B8;
    id v15 = v4;
    id v6 = v4;
    [v5 enumerateObjectsUsingBlock:v14];
    id v7 = LA_LOG_0();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_loadWeakRetained((id *)(a1 + 80));
      *(_DWORD *)buf = 138543362;
      id v17 = v8;
      _os_log_impl(&dword_1BED06000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ rightForIdentifier finished successfully", buf, 0xCu);
    }
    uint64_t v9 = *(void *)(a1 + 72);
    id v10 = [[LAPersistedRight alloc] initWithIdentifier:*(void *)(a1 + 48) accessKey:*(void *)(a1 + 56) privateKeys:v6 secrets:*(void *)(a1 + 64)];
    (*(void (**)(uint64_t, LAPersistedRight *, void))(v9 + 16))(v9, v10, 0);
  }
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_34(uint64_t a1, void *a2)
{
  os_activity_t v2 = *(void **)(a1 + 32);
  id v3 = a2;
  uint64_t v4 = [[LAPrivateKey alloc] initWithKey:v3];

  [v2 addObject:v4];
}

- (void)saveRight:(LARight *)right identifier:(NSString *)identifier completion:(void *)handler
{
  id v8 = right;
  uint64_t v9 = identifier;
  id v10 = handler;
  id v11 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.saveRight", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __48__LARightStore_saveRight_identifier_completion___block_invoke;
  v15[3] = &unk_1E63C40F0;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  id v18 = v10;
  id v12 = v10;
  id v13 = v9;
  id v14 = v8;
  os_activity_apply(v11, v15);
}

void __48__LARightStore_saveRight_identifier_completion___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v11 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ saveRight started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__LARightStore_saveRight_identifier_completion___block_invoke_40;
  v7[3] = &unk_1E63C42D0;
  objc_copyWeak(&v9, (id *)buf);
  id v8 = *(id *)(a1 + 56);
  -[LARightStore _saveRight:identifier:secret:completion:](v4, v5, v6, 0, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak((id *)buf);
}

void __48__LARightStore_saveRight_identifier_completion___block_invoke_40(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LA_LOG_0();
  id v8 = v7;
  if (v5)
  {
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    uint64_t v11 = [NSString stringWithFormat:@"(err:%@)", v5];
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    uint64_t v11 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v13 = WeakRetained;
  __int16 v14 = 2114;
  id v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ saveRight finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)_saveRight:(void *)a3 identifier:(void *)a4 secret:(void *)a5 completion:
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (a1)
  {
    objc_initWeak(&location, a1);
    id v13 = a1[2];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke;
    block[3] = &unk_1E63C4438;
    void block[4] = a1;
    objc_copyWeak(&v19, &location);
    id v18 = v12;
    id v15 = v10;
    id v16 = v9;
    id v17 = v11;
    dispatch_async(v13, block);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

- (void)saveRight:(LARight *)right identifier:(NSString *)identifier secret:(NSData *)secret completion:(void *)handler
{
  id v10 = right;
  id v11 = identifier;
  id v12 = secret;
  id v13 = handler;
  __int16 v14 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.saveRightWithSecret", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__LARightStore_saveRight_identifier_secret_completion___block_invoke;
  block[3] = &unk_1E63C42F8;
  void block[4] = self;
  uint64_t v20 = v10;
  id v21 = v11;
  id v22 = v12;
  id v23 = v13;
  id v15 = v13;
  id v16 = v12;
  id v17 = v11;
  id v18 = v10;
  os_activity_apply(v14, block);
}

void __55__LARightStore_saveRight_identifier_secret_completion___block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v12 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ saveRightWithSecret started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, *(id *)(a1 + 32));
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = *(void **)(a1 + 40);
  id v6 = *(void **)(a1 + 48);
  id v7 = *(void **)(a1 + 56);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __55__LARightStore_saveRight_identifier_secret_completion___block_invoke_42;
  v8[3] = &unk_1E63C42D0;
  objc_copyWeak(&v10, (id *)buf);
  id v9 = *(id *)(a1 + 64);
  -[LARightStore _saveRight:identifier:secret:completion:](v4, v5, v6, v7, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __55__LARightStore_saveRight_identifier_secret_completion___block_invoke_42(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a2;
  id v7 = LA_LOG_0();
  id v8 = v7;
  if (v5)
  {
    os_log_type_t v9 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v8, v9)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v11 = [NSString stringWithFormat:@"(err:%@)", v5];
  }
  else
  {
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    id v11 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v13 = WeakRetained;
  __int16 v14 = 2114;
  id v15 = v11;
  _os_log_impl(&dword_1BED06000, v8, v9, "%{public}@ saveRightWithSecret finished %{public}@", buf, 0x16u);
  if (v5) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeRight:(LAPersistedRight *)right completion:(void *)handler
{
  id v6 = right;
  id v7 = handler;
  id v8 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.removeRight", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__LARightStore_removeRight_completion___block_invoke;
  block[3] = &unk_1E63C4320;
  void block[4] = self;
  uint64_t v12 = v6;
  id v13 = v7;
  id v9 = v7;
  id v10 = v6;
  os_activity_apply(v8, block);
}

void __39__LARightStore_removeRight_completion___block_invoke(id *a1)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a1[4];
    *(_DWORD *)buf = 138543362;
    id v10 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRight started", buf, 0xCu);
  }

  objc_initWeak((id *)buf, a1[4]);
  id v4 = a1[4];
  id v5 = [a1[5] identifier];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__LARightStore_removeRight_completion___block_invoke_43;
  v6[3] = &unk_1E63C3E38;
  objc_copyWeak(&v8, (id *)buf);
  id v7 = a1[6];
  [v4 removeRightForIdentifier:v5 completion:v6];

  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

void __39__LARightStore_removeRight_completion___block_invoke_43(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LA_LOG_0();
  id v5 = v4;
  if (v3)
  {
    os_log_type_t v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    id v8 = [NSString stringWithFormat:@"(err:%@)", v3];
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    id v8 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v10 = WeakRetained;
  __int16 v11 = 2114;
  uint64_t v12 = v8;
  _os_log_impl(&dword_1BED06000, v5, v6, "%{public}@ removeRight finished %{public}@", buf, 0x16u);
  if (v3) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeRightForIdentifier:(NSString *)identifier completion:(void *)handler
{
  os_log_type_t v6 = identifier;
  id v7 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__LARightStore_removeRightForIdentifier_completion___block_invoke;
  block[3] = &unk_1E63C42A8;
  void block[4] = self;
  objc_copyWeak(&v14, &location);
  uint64_t v12 = v6;
  id v13 = v7;
  id v9 = v6;
  id v10 = v7;
  dispatch_async(workQueue, block);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __52__LARightStore_removeRightForIdentifier_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.removeRightForIdentifier", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __52__LARightStore_removeRightForIdentifier_completion___block_invoke_2;
  v3[3] = &unk_1E63C42A8;
  v3[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v6, (id *)(a1 + 56));
  id v5 = *(id *)(a1 + 48);
  id v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, v3);

  objc_destroyWeak(&v6);
}

void __52__LARightStore_removeRightForIdentifier_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v14 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ removeRightForIdentifier started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    id v5 = +[LAKeyIdentifier domainForRightWithIdentifier:*(void *)(a1 + 40)];
    id v6 = (void *)WeakRetained[1];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__LARightStore_removeRightForIdentifier_completion___block_invoke_45;
    v10[3] = &unk_1E63C3E38;
    objc_copyWeak(&v12, (id *)(a1 + 56));
    id v11 = *(id *)(a1 + 48);
    [v6 removeItemsWithDomain:v5 completion:v10];

    objc_destroyWeak(&v12);
  }
  else
  {
    id v7 = LA_LOG_0();
    os_log_type_t v8 = LALogTypeForInternalError();
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v7, v8, "Operation interrupted", buf, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 48);
    id v5 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v5);
  }
}

void __52__LARightStore_removeRightForIdentifier_completion___block_invoke_45(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LA_LOG_0();
  id v5 = v4;
  if (v3)
  {
    os_log_type_t v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v8 = [NSString stringWithFormat:@"(err:%@)", v3];
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    os_log_type_t v8 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v10 = WeakRetained;
  __int16 v11 = 2114;
  id v12 = v8;
  _os_log_impl(&dword_1BED06000, v5, v6, "%{public}@ removeRightForIdentifier finished %{public}@", buf, 0x16u);
  if (v3) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)removeAllRightsWithCompletion:(void *)handler
{
  id v4 = handler;
  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__LARightStore_removeAllRightsWithCompletion___block_invoke;
  v7[3] = &unk_1E63C40A0;
  void v7[4] = self;
  objc_copyWeak(&v9, &location);
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __46__LARightStore_removeAllRightsWithCompletion___block_invoke(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization.removeAllRights", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__LARightStore_removeAllRightsWithCompletion___block_invoke_2;
  block[3] = &unk_1E63C40A0;
  void block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v5, (id *)(a1 + 48));
  id v4 = *(id *)(a1 + 40);
  os_activity_apply(v2, block);

  objc_destroyWeak(&v5);
}

void __46__LARightStore_removeAllRightsWithCompletion___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ removeAllRights started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v5 = WeakRetained;
  if (WeakRetained)
  {
    id v6 = (void *)*((void *)WeakRetained + 1);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __46__LARightStore_removeAllRightsWithCompletion___block_invoke_46;
    v11[3] = &unk_1E63C3E38;
    objc_copyWeak(&v13, (id *)(a1 + 48));
    id v12 = *(id *)(a1 + 40);
    [v6 removeItemsWithCompletion:v11];

    objc_destroyWeak(&v13);
  }
  else
  {
    id v7 = LA_LOG_0();
    os_log_type_t v8 = LALogTypeForInternalError();
    if (os_log_type_enabled(v7, v8))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v7, v8, "Operation interrupted", buf, 2u);
    }

    uint64_t v9 = *(void *)(a1 + 40);
    id v10 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void *))(v9 + 16))(v9, v10);
  }
}

void __46__LARightStore_removeAllRightsWithCompletion___block_invoke_46(uint64_t a1, void *a2)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = LA_LOG_0();
  id v5 = v4;
  if (v3)
  {
    os_log_type_t v6 = LALogTypeForInternalError();
    if (!os_log_type_enabled(v5, v6)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v8 = [NSString stringWithFormat:@"(err:%@)", v3];
  }
  else
  {
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_9;
    }
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    os_log_type_t v6 = OS_LOG_TYPE_DEFAULT;
    os_log_type_t v8 = @"successfully";
  }
  *(_DWORD *)buf = 138543618;
  id v10 = WeakRetained;
  __int16 v11 = 2114;
  id v12 = v8;
  _os_log_impl(&dword_1BED06000, v5, v6, "%{public}@ removeAllRights finished %{public}@", buf, 0x16u);
  if (v3) {

  }
LABEL_9:
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)keyStore
{
  if (a1)
  {
    a1 = (id *)a1[1];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setKeyStore:(uint64_t)a1
{
  id v4 = a2;
  if (a1) {
    objc_storeStrong((id *)(a1 + 8), a2);
  }
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke(uint64_t a1)
{
  os_activity_t v2 = _os_activity_create(&dword_1BED06000, "LocalAuthentication.Authorization._saveRight", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2;
  block[3] = &unk_1E63C4410;
  void block[4] = *(void *)(a1 + 32);
  objc_copyWeak(&v10, (id *)(a1 + 72));
  id v9 = *(id *)(a1 + 64);
  id v5 = *(id *)(a1 + 40);
  id v6 = *(id *)(a1 + 48);
  os_activity_t v7 = v2;
  id v8 = *(id *)(a1 + 56);
  id v3 = v2;
  os_activity_apply(v3, block);

  objc_destroyWeak(&v10);
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = LA_LOG_0();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    uint64_t v23 = v3;
    _os_log_impl(&dword_1BED06000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ _saveRight started", buf, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    id v5 = +[LAKeyIdentifier defaultAccessKeyIdentifierForRightWithIdentifier:*(void *)(a1 + 40)];
    id v6 = +[LAKeyIdentifier domainForRightWithIdentifier:*(void *)(a1 + 40)];
    uint64_t v14 = (void *)WeakRetained[1];
    os_activity_t v7 = [*(id *)(a1 + 48) accessKey];
    id v8 = [v7 acl];
    id v9 = [v8 data];
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_47;
    v15[3] = &unk_1E63C43E8;
    id v16 = *(id *)(a1 + 56);
    objc_copyWeak(&v21, (id *)(a1 + 80));
    id v20 = *(id *)(a1 + 72);
    id v17 = *(id *)(a1 + 64);
    id v18 = *(id *)(a1 + 40);
    id v10 = v6;
    id v19 = v10;
    [v14 storeKeyWithIdentifier:v5 domain:v10 protectedBy:v9 completion:v15];

    objc_destroyWeak(&v21);
  }
  else
  {
    __int16 v11 = LA_LOG_0();
    os_log_type_t v12 = LALogTypeForInternalError();
    if (os_log_type_enabled(v11, v12))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v11, v12, "Operation interrupted", buf, 2u);
    }

    uint64_t v13 = *(void *)(a1 + 72);
    id v5 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v13 + 16))(v13, 0, v5);
  }
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_47(id *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_activity_t v7 = a1[4];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_48;
  v10[3] = &unk_1E63C43C0;
  id v11 = v6;
  id v8 = v6;
  objc_copyWeak(&v18, a1 + 9);
  id v17 = a1[8];
  id v12 = a1[5];
  id v13 = a1[6];
  id v14 = a1[7];
  id v15 = v5;
  id v16 = a1[4];
  id v9 = v5;
  os_activity_apply(v7, v10);

  objc_destroyWeak(&v18);
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_48(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (*(void *)(a1 + 32))
  {
    os_activity_t v2 = LA_LOG_0();
    if (*(void *)(a1 + 32)) {
      os_log_type_t v3 = LALogTypeForInternalError();
    }
    else {
      os_log_type_t v3 = OS_LOG_TYPE_DEFAULT;
    }
    if (os_log_type_enabled(v2, v3))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 88));
      uint64_t v11 = *(void *)(a1 + 32);
      if (v11)
      {
        id v12 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
      }
      else
      {
        id v12 = @"successfully";
      }
      *(_DWORD *)buf = 138543618;
      id v26 = WeakRetained;
      __int16 v27 = 2114;
      v28 = v12;
      _os_log_impl(&dword_1BED06000, v2, v3, "%{public}@ _saveRight finished %{public}@", buf, 0x16u);
      if (v11) {
    }
      }
    (*(void (**)(void))(*(void *)(a1 + 80) + 16))();
  }
  else
  {
    id v4 = objc_loadWeakRetained((id *)(a1 + 88));
    id v5 = v4;
    if (v4)
    {
      if (*(void *)(a1 + 40))
      {
        id v17 = +[LAKeyIdentifier defaultSecretIdentifierForRightWithIdentifier:*(void *)(a1 + 48)];
        id v6 = (void *)v5[1];
        uint64_t v7 = *(void *)(a1 + 56);
        uint64_t v8 = *(void *)(a1 + 40);
        id v9 = [*(id *)(a1 + 64) publicKeyHash];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_49;
        v18[3] = &unk_1E63C4398;
        id v19 = *(id *)(a1 + 72);
        objc_copyWeak(&v24, (id *)(a1 + 88));
        id v23 = *(id *)(a1 + 80);
        id v20 = *(id *)(a1 + 32);
        id v21 = *(id *)(a1 + 56);
        id v22 = *(id *)(a1 + 48);
        [v6 storeGenericPassword:v8 identifier:v17 domain:v7 protectedBy:v9 completion:v18];

        objc_destroyWeak(&v24);
      }
      else
      {
        [v4 rightForIdentifier:*(void *)(a1 + 48) completion:*(void *)(a1 + 80)];
      }
    }
    else
    {
      id v13 = LA_LOG_0();
      os_log_type_t v14 = LALogTypeForInternalError();
      if (os_log_type_enabled(v13, v14))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1BED06000, v13, v14, "Operation interrupted", buf, 2u);
      }

      uint64_t v15 = *(void *)(a1 + 80);
      id v16 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
      (*(void (**)(uint64_t, void, void *))(v15 + 16))(v15, 0, v16);
    }
  }
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_49(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = a1[4];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_50;
  block[3] = &unk_1E63C4370;
  objc_copyWeak(&v14, a1 + 9);
  id v13 = a1[8];
  id v8 = v4;
  id v9 = a1[5];
  id v10 = a1[6];
  id v11 = a1[7];
  id v12 = a1[4];
  id v6 = v4;
  os_activity_apply(v5, block);

  objc_destroyWeak(&v14);
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_50(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  os_activity_t v2 = (id *)(a1 + 80);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 80));
  if (WeakRetained)
  {
    if (*(void *)(a1 + 32))
    {
      id v4 = LA_LOG_0();
      if (*(void *)(a1 + 40)) {
        os_log_type_t v5 = LALogTypeForInternalError();
      }
      else {
        os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
      }
      if (os_log_type_enabled(v4, v5))
      {
        id v11 = objc_loadWeakRetained(v2);
        uint64_t v12 = *(void *)(a1 + 40);
        if (v12)
        {
          id v13 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 40)];
        }
        else
        {
          id v13 = @"successfully";
        }
        *(_DWORD *)buf = 138543618;
        id v24 = v11;
        __int16 v25 = 2114;
        id v26 = v13;
        _os_log_impl(&dword_1BED06000, v4, v5, "%{public}@ _saveRight finished %{public}@", buf, 0x16u);
        if (v12) {
      }
        }
      id v14 = (void *)WeakRetained[1];
      uint64_t v15 = *(void *)(a1 + 48);
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_51;
      v20[3] = &unk_1E63C4078;
      id v22 = *(id *)(a1 + 72);
      id v21 = *(id *)(a1 + 32);
      [v14 removeItemsWithDomain:v15 completion:v20];

      id v9 = v22;
    }
    else
    {
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_55;
      v16[3] = &unk_1E63C4348;
      uint64_t v10 = *(void *)(a1 + 56);
      id v17 = *(id *)(a1 + 64);
      objc_copyWeak(&v19, v2);
      id v18 = *(id *)(a1 + 72);
      [WeakRetained rightForIdentifier:v10 completion:v16];

      objc_destroyWeak(&v19);
      id v9 = v17;
    }
  }
  else
  {
    id v6 = LA_LOG_0();
    os_log_type_t v7 = LALogTypeForInternalError();
    if (os_log_type_enabled(v6, v7))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1BED06000, v6, v7, "Operation interrupted", buf, 2u);
    }

    uint64_t v8 = *(void *)(a1 + 72);
    id v9 = +[LAAuthorizationError genericErrorWithMessage:@"Operation interrupted"];
    (*(void (**)(uint64_t, void, void *))(v8 + 16))(v8, 0, v9);
  }
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_51(uint64_t a1, void *a2)
{
  v11[2] = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  os_log_type_t v5 = *(void **)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = (void *)MEMORY[0x1E4F30B90];
  os_log_type_t v7 = v5;
  if (!v5)
  {
    os_log_type_t v7 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[0] = v7;
  uint64_t v8 = v3;
  if (!v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA98] null];
  }
  v11[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  uint64_t v10 = [v6 errorWithCode:-1008 withUnderlyingErrors:v9];
  (*(void (**)(uint64_t, void, void *))(v4 + 16))(v4, 0, v10);

  if (!v3)
  {

    if (v5) {
      goto LABEL_7;
    }
LABEL_9:

    goto LABEL_7;
  }
  if (!v5) {
    goto LABEL_9;
  }
LABEL_7:
}

void __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_2_55(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  os_log_type_t v7 = *(NSObject **)(a1 + 32);
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_3;
  void v11[3] = &unk_1E63C42A8;
  id v12 = v6;
  id v8 = v6;
  objc_copyWeak(&v15, (id *)(a1 + 48));
  id v9 = *(id *)(a1 + 40);
  id v13 = v5;
  id v14 = v9;
  id v10 = v5;
  os_activity_apply(v7, v11);

  objc_destroyWeak(&v15);
}

uint64_t __56__LARightStore__saveRight_identifier_secret_completion___block_invoke_3(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = LA_LOG_0();
  uint64_t v4 = v3;
  if (v2)
  {
    if (*(void *)(a1 + 32)) {
      os_log_type_t v5 = LALogTypeForInternalError();
    }
    else {
      os_log_type_t v5 = OS_LOG_TYPE_DEFAULT;
    }
    if (os_log_type_enabled(v4, v5))
    {
      id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
      uint64_t v8 = *(void *)(a1 + 32);
      if (v8)
      {
        id v9 = [NSString stringWithFormat:@"(err:%@)", *(void *)(a1 + 32)];
      }
      else
      {
        id v9 = @"successfully";
      }
      *(_DWORD *)buf = 138543618;
      id v12 = WeakRetained;
      __int16 v13 = 2114;
      id v14 = v9;
      _os_log_impl(&dword_1BED06000, v4, v5, "%{public}@ _saveRight finished %{public}@", buf, 0x16u);
      if (v8) {
    }
      }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = objc_loadWeakRetained((id *)(a1 + 56));
    *(_DWORD *)buf = 138543362;
    id v12 = v6;
    _os_log_impl(&dword_1BED06000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ _saveRight finished successfully", buf, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"LARightStore[%u]", self->_instanceID);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);

  objc_storeStrong((id *)&self->_keyStore, 0);
}

- (void)init
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1BED06000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ initialized", (uint8_t *)&v2, 0xCu);
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_13_cold_1()
{
  __assert_rtn("-[LARightStore rightForIdentifier:completion:]_block_invoke_2", "LARightStore.m", 85, "err != nil || key != nil");
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_25_cold_1()
{
  __assert_rtn("-[LARightStore rightForIdentifier:completion:]_block_invoke_2", "LARightStore.m", 101, "err != nil || genps != nil");
}

void __46__LARightStore_rightForIdentifier_completion___block_invoke_2_32_cold_1()
{
  __assert_rtn("-[LARightStore rightForIdentifier:completion:]_block_invoke_2", "LARightStore.m", 125, "err != nil || keys != nil");
}

@end