@interface HDCloudSyncStateSyncShim
- (Class)_stateEntityForDomain:(id)a3;
- (HDCloudSyncStateSyncShim)initWithProfile:(id)a3;
- (id)_createDomainToEntityMapping;
- (void)mergeStateDataWithStore:(id)a3 domain:(id)a4 configuration:(id)a5 completion:(id)a6;
- (void)syncDidFinishWithResult:(BOOL)a3 domain:(id)a4 stateStore:(id)a5 completion:(id)a6;
@end

@implementation HDCloudSyncStateSyncShim

- (HDCloudSyncStateSyncShim)initWithProfile:(id)a3
{
  id v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncStateSyncShim;
  v6 = [(HDCloudSyncStateSyncShim *)&v13 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    uint64_t v8 = [(HDCloudSyncStateSyncShim *)v7 _createDomainToEntityMapping];
    domainToEntityClassMapping = v7->_domainToEntityClassMapping;
    v7->_domainToEntityClassMapping = (NSDictionary *)v8;

    uint64_t v10 = HKCreateSerialDispatchQueue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v10;
  }
  return v7;
}

- (void)mergeStateDataWithStore:(id)a3 domain:(id)a4 configuration:(id)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  id v12 = a5;
  objc_super v13 = [(HDCloudSyncStateSyncShim *)self _stateEntityForDomain:a4];
  v14 = +[HDMutableDatabaseTransactionContext contextForWritingProtectedData];
  v15 = [v12 accessibilityAssertion];

  v16 = [v14 contextWithAccessibilityAssertion:v15];

  v17 = [(HDProfile *)self->_profile database];
  id v31 = 0;
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke;
  v27[3] = &unk_1E62FD1C0;
  v29 = self;
  v30 = v13;
  id v28 = v10;
  id v18 = v10;
  LOBYTE(v13) = [v17 performTransactionWithContext:v16 error:&v31 block:v27 inaccessibilityHandler:0];
  id v19 = v31;

  queue = self->_queue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke_2;
  block[3] = &unk_1E62F61A8;
  char v26 = (char)v13;
  id v24 = v19;
  id v25 = v11;
  id v21 = v19;
  id v22 = v11;
  dispatch_async(queue, block);
}

uint64_t __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v6 = [*(id *)(a1 + 48) updateDataWithStateStorage:*(void *)(a1 + 32) profile:*(void *)(*(void *)(a1 + 40) + 8) transaction:v5 error:a3];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 125, @"State entity class %@ doesnt implement State Sync protocol", *(void *)(a1 + 48));
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      if (a3) {
        *a3 = v7;
      }
      else {
        _HKLogDroppedError();
      }
    }

    uint64_t v6 = 0;
  }

  return v6;
}

uint64_t __84__HDCloudSyncStateSyncShim_mergeStateDataWithStore_domain_configuration_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(void *)(a1 + 32));
}

- (void)syncDidFinishWithResult:(BOOL)a3 domain:(id)a4 stateStore:(id)a5 completion:(id)a6
{
  BOOL v8 = a3;
  id v10 = a5;
  id v11 = a6;
  id v12 = [(HDCloudSyncStateSyncShim *)self _stateEntityForDomain:a4];
  if (objc_opt_respondsToSelector())
  {
    [(objc_class *)v12 syncDidFinishWithResult:!v8 stateStore:v10 profile:self->_profile];
    queue = self->_queue;
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke_2;
    v18[3] = &unk_1E62F3CA8;
    v14 = &v20;
    id v19 = 0;
    id v20 = v11;
    id v15 = v11;
    dispatch_async(queue, v18);
  }
  else
  {
    v16 = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke;
    block[3] = &unk_1E62FD1E8;
    v14 = (id *)v22;
    v22[0] = v11;
    v22[1] = v12;
    id v17 = v11;
    dispatch_async(v16, block);
  }
}

void __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:format:", 125, @"State entity class %@ doesnt implement State Sync protocol", *(void *)(a1 + 40));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void, id))(v1 + 16))(v1, 0, v2);
}

uint64_t __81__HDCloudSyncStateSyncShim_syncDidFinishWithResult_domain_stateStore_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, uint64_t, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), 1, *(void *)(a1 + 32));
}

- (id)_createDomainToEntityMapping
{
  id v2 = [(HDProfile *)self->_profile daemon];
  v3 = [v2 cloudSyncCoordinator];
  v4 = [v3 stateSyncEntityClasses];

  id v5 = objc_msgSend(v4, "hk_mapToDictionary:", &__block_literal_global_76);

  return v5;
}

void __56__HDCloudSyncStateSyncShim__createDomainToEntityMapping__block_invoke(uint64_t a1, void *a2, void (**a3)(void, void, void))
{
  id v5 = a3;
  id v7 = [a2 stateEntitySchema];
  uint64_t v6 = [v7 domain];
  ((void (**)(void, void *, void *))a3)[2](v5, v6, a2);
}

- (Class)_stateEntityForDomain:(id)a3
{
  return (Class)[(NSDictionary *)self->_domainToEntityClassMapping objectForKeyedSubscript:a3];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_domainToEntityClassMapping, 0);

  objc_storeStrong((id *)&self->_profile, 0);
}

@end