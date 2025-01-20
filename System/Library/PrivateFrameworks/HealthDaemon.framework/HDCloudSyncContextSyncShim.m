@interface HDCloudSyncContextSyncShim
- (HDCloudSyncContextSyncShim)initWithProfile:(id)a3;
- (void)fetchLocalKeyValueForProtectionCategory:(int64_t)a3 completion:(id)a4;
- (void)ingestRemoteDeviceContexts:(id)a3 completion:(id)a4;
- (void)lookupOrCreateLocalDeviceContextWithCompletion:(id)a3;
- (void)updateKeyValuePairsForRemoteEntries:(id)a3 deviceContexts:(id)a4 completion:(id)a5;
@end

@implementation HDCloudSyncContextSyncShim

- (HDCloudSyncContextSyncShim)initWithProfile:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HDCloudSyncContextSyncShim;
  v6 = [(HDCloudSyncContextSyncShim *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    uint64_t v8 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;
  }
  return v7;
}

- (void)lookupOrCreateLocalDeviceContextWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDProfile *)self->_profile deviceContextManager];
  id v25 = 0;
  v6 = [v5 lookupOrCreateLocalDeviceContextWithError:&v25];
  id v7 = v25;
  uint64_t v8 = v7;
  if (v6)
  {
    id v21 = v7;
    char v9 = [v5 updateSoftwareVersionForCurrentSyncIdentityWithError:&v21];
    id v10 = v21;

    queue = self->_queue;
    if (v9)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_3;
      v15[3] = &unk_1E62F3CA8;
      v12 = &v17;
      id v17 = v4;
      v13 = &v16;
      id v16 = v6;
      v14 = v15;
    }
    else
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_2;
      block[3] = &unk_1E62F3CA8;
      v12 = &v20;
      id v20 = v4;
      v13 = &v19;
      id v10 = v10;
      id v19 = v10;
      v14 = block;
    }
  }
  else
  {
    queue = self->_queue;
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke;
    v22[3] = &unk_1E62F3CA8;
    v12 = &v24;
    id v24 = v4;
    v13 = &v23;
    id v10 = v8;
    id v23 = v10;
    v14 = v22;
  }
  dispatch_async(queue, v14);
}

uint64_t __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 0, *(void *)(a1 + 32));
}

uint64_t __77__HDCloudSyncContextSyncShim_lookupOrCreateLocalDeviceContextWithCompletion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), 0);
}

- (void)ingestRemoteDeviceContexts:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(HDProfile *)self->_profile database];
  id v21 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke;
  v19[3] = &unk_1E62F2AE0;
  v19[4] = self;
  id v20 = v6;
  id v9 = v6;
  BOOL v10 = +[HDHealthEntity performWriteTransactionWithHealthDatabase:v8 error:&v21 block:v19];
  id v11 = v21;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke_2;
  v15[3] = &unk_1E62F61A8;
  BOOL v18 = v10;
  id v16 = v11;
  id v17 = v7;
  id v13 = v11;
  id v14 = v7;
  dispatch_async(queue, v15);
}

uint64_t __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(*(void *)(a1 + 32) + 8);
  id v6 = a2;
  id v7 = [v5 deviceContextManager];
  uint64_t v8 = [v7 ingestRemoteDeviceContexts:*(void *)(a1 + 40) transaction:v6 error:a3];

  return v8;
}

uint64_t __68__HDCloudSyncContextSyncShim_ingestRemoteDeviceContexts_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)fetchLocalKeyValueForProtectionCategory:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  uint64_t v8 = [(HDProfile *)self->_profile deviceKeyValueStoreManager];
  id v9 = [(HDProfile *)self->_profile syncIdentityManager];
  BOOL v10 = [v9 currentSyncIdentity];
  id v11 = [v10 identity];
  id v25 = 0;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke;
  v23[3] = &unk_1E6305FA0;
  id v12 = v7;
  id v24 = v12;
  LOBYTE(a3) = [v8 enumerateAllEntriesForSyncIdentity:v11 protectionCategory:a3 error:&v25 enumerationHandler:v23];
  id v13 = v25;

  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke_2;
  v18[3] = &unk_1E6305FC8;
  id v20 = v13;
  id v21 = v6;
  char v22 = a3;
  id v19 = v12;
  id v15 = v13;
  id v16 = v12;
  id v17 = v6;
  dispatch_async(queue, v18);
}

uint64_t __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  return 1;
}

uint64_t __81__HDCloudSyncContextSyncShim_fetchLocalKeyValueForProtectionCategory_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  if (*(unsigned char *)(a1 + 56)) {
    uint64_t v3 = *(void *)(a1 + 32);
  }
  else {
    uint64_t v3 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, void))(v2 + 16))(v2, v3, *(void *)(a1 + 40));
}

- (void)updateKeyValuePairsForRemoteEntries:(id)a3 deviceContexts:(id)a4 completion:(id)a5
{
  id v8 = a5;
  profile = self->_profile;
  id v10 = a4;
  id v11 = a3;
  id v12 = [(HDProfile *)profile deviceKeyValueStoreManager];
  id v22 = 0;
  char v13 = [v12 updateKeyValuePairsForRemoteEntries:v11 deviceContexts:v10 error:&v22];

  id v14 = v22;
  queue = self->_queue;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __92__HDCloudSyncContextSyncShim_updateKeyValuePairsForRemoteEntries_deviceContexts_completion___block_invoke;
  v18[3] = &unk_1E62F61A8;
  char v21 = v13;
  id v19 = v14;
  id v20 = v8;
  id v16 = v14;
  id v17 = v8;
  dispatch_async(queue, v18);
}

uint64_t __92__HDCloudSyncContextSyncShim_updateKeyValuePairsForRemoteEntries_deviceContexts_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end