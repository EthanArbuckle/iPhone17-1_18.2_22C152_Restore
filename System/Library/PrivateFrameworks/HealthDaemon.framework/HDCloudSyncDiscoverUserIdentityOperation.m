@interface HDCloudSyncDiscoverUserIdentityOperation
- (CKUserIdentity)userIdentity;
- (HDCloudSyncDiscoverUserIdentityOperation)initWithConfiguration:(id)a3 identityLookupInfo:(id)a4;
- (void)_unitTest_setUserIdentity:(id)a3;
- (void)main;
@end

@implementation HDCloudSyncDiscoverUserIdentityOperation

- (HDCloudSyncDiscoverUserIdentityOperation)initWithConfiguration:(id)a3 identityLookupInfo:(id)a4
{
  id v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncDiscoverUserIdentityOperation;
  v7 = [(HDCloudSyncOperation *)&v11 initWithConfiguration:a3 cloudState:0];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    identityLookupInfo = v7->_identityLookupInfo;
    v7->_identityLookupInfo = (CKUserIdentityLookupInfo *)v8;

    v7->_lock._os_unfair_lock_opaque = 0;
  }

  return v7;
}

- (void)main
{
  v20[1] = *MEMORY[0x1E4F143B8];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __48__HDCloudSyncDiscoverUserIdentityOperation_main__block_invoke;
  v14[3] = &unk_1E62F2978;
  v14[4] = self;
  v3 = v14;
  if (self)
  {
    _HKInitializeLogging();
    v4 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      identityLookupInfo = self->_identityLookupInfo;
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = self;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = identityLookupInfo;
      _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Beginning operation with lookupinfo %{public}@", buf, 0x16u);
    }
    id v6 = objc_alloc(MEMORY[0x1E4F19F78]);
    v20[0] = self->_identityLookupInfo;
    v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    uint64_t v8 = (void *)[v6 initWithUserIdentityLookupInfos:v7];

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke;
    v15[3] = &unk_1E62F6C70;
    v15[4] = self;
    [v8 setUserIdentityDiscoveredBlock:v15];
    *(void *)buf = MEMORY[0x1E4F143A8];
    *(void *)&buf[8] = 3221225472;
    *(void *)&buf[16] = __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke_280;
    v17 = &unk_1E62F6C98;
    v18 = self;
    v19 = v3;
    [v8 setDiscoverUserIdentitiesCompletionBlock:buf];
    v9 = [(HDCloudSyncOperation *)self configuration];
    v10 = [v9 operationGroup];
    [v8 setGroup:v10];

    objc_super v11 = [(HDCloudSyncOperation *)self configuration];
    v12 = [v11 repository];
    v13 = [v12 primaryCKContainer];
    [v13 addOperation:v8];
  }
}

uint64_t __48__HDCloudSyncDiscoverUserIdentityOperation_main__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) finishWithSuccess:a2 error:a3];
}

void __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  _HKInitializeLogging();
  v4 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v10 = 138543618;
    uint64_t v11 = v5;
    __int16 v12 = 2114;
    id v13 = v3;
    _os_log_impl(&dword_1BCB7D000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Discovered user identity %{public}@", (uint8_t *)&v10, 0x16u);
  }
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
  uint64_t v6 = *(void *)(a1 + 32);
  if (!*(void *)(v6 + 112))
  {
    uint64_t v7 = [v3 copy];
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(v8 + 112);
    *(void *)(v8 + 112) = v7;

    uint64_t v6 = *(void *)(a1 + 32);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 104));
}

void __86__HDCloudSyncDiscoverUserIdentityOperation__runUserIdentitiesOperationWithCompletion___block_invoke_280(uint64_t a1, void *a2)
{
  id v9 = a2;
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 104));
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void *)(v3 + 112);
  os_unfair_lock_unlock((os_unfair_lock_t)(v3 + 104));
  if (v4)
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 120) phoneNumber];
    if (v5) {
      uint64_t v6 = 727;
    }
    else {
      uint64_t v6 = 733;
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", v6, @"User identity operation finished but no identity was returned.");
    if (v9) {
      id v8 = v9;
    }
    else {
      id v8 = v7;
    }
    (*(void (**)(void, void, id))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, v8);
  }
}

- (void)_unitTest_setUserIdentity:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  uint64_t v6 = (CKUserIdentity *)[v5 copy];

  userIdentity = self->_userIdentity;
  self->_userIdentity = v6;

  os_unfair_lock_unlock(p_lock);
}

- (CKUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);

  objc_storeStrong((id *)&self->_userIdentity, 0);
}

@end