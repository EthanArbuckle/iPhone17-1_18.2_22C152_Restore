@interface HDCloudSyncRegisterSubscriptionsOperation
- (HDCloudSyncRegisterSubscriptionsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncRegisterSubscriptionsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5 subscriptions:(id)a6;
- (void)main;
@end

@implementation HDCloudSyncRegisterSubscriptionsOperation

- (HDCloudSyncRegisterSubscriptionsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncRegisterSubscriptionsOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 container:(id)a5 subscriptions:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncRegisterSubscriptionsOperation;
  v13 = [(HDCloudSyncOperation *)&v17 initWithConfiguration:a3 cloudState:a4];
  if (v13)
  {
    uint64_t v14 = [v12 copy];
    subscriptions = v13->_subscriptions;
    v13->_subscriptions = (NSDictionary *)v14;

    objc_storeStrong((id *)&v13->_container, a5);
  }

  return v13;
}

- (void)main
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ([(NSDictionary *)self->_subscriptions count])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F1A0F0]);
    v4 = [(NSDictionary *)self->_subscriptions allKeys];
    v5 = (void *)[v3 initWithSubscriptionIDs:v4];

    container = self->_container;
    v7 = [(HDCloudSyncOperation *)self configuration];
    v8 = [v7 repository];
    v9 = [v8 profileIdentifier];
    v10 = HDDatabaseForContainer(container, v9);

    uint64_t v15 = MEMORY[0x1E4F143A8];
    uint64_t v16 = 3221225472;
    objc_super v17 = __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke;
    v18 = &unk_1E6309FF0;
    v19 = self;
    id v20 = v10;
    id v11 = v10;
    [v5 setFetchSubscriptionCompletionBlock:&v15];
    id v12 = [(HDCloudSyncOperation *)self configuration];
    v13 = [v12 operationGroup];
    [v5 setGroup:v13];

    [v11 addOperation:v5];
  }
  else
  {
    _HKInitializeLogging();
    uint64_t v14 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v22 = self;
      _os_log_impl(&dword_1BCB7D000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: No subscriptions to register.", buf, 0xCu);
    }
    [(HDCloudSyncOperation *)self finishWithSuccess:1 error:0];
  }
}

void __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "hk_isErrorInDomain:code:", *MEMORY[0x1E4F19C40], 2) & 1) == 0)
  {
    _HKInitializeLogging();
    v22 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = *(void *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      *(void *)&uint8_t buf[4] = v23;
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v7;
      _os_log_error_impl(&dword_1BCB7D000, v22, OS_LOG_TYPE_ERROR, "%{public}@: Failed to look up subscriptions: %{public}@", buf, 0x16u);
    }
    [*(id *)(a1 + 32) finishWithSuccess:0 error:v7];
  }
  else
  {
    v8 = [*(id *)(*(void *)(a1 + 32) + 104) allKeys];
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke_281;
    v24[3] = &unk_1E6309FC8;
    id v25 = v5;
    v9 = objc_msgSend(v8, "hk_filter:", v24);

    if ([v9 count])
    {
      _HKInitializeLogging();
      v10 = (void *)*MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v11 = *(void *)(a1 + 32);
        id v12 = v10;
        uint64_t v13 = [v9 count];
        uint64_t v14 = [v9 componentsJoinedByString:@", "];
        *(_DWORD *)buf = 138543874;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        v29 = v14;
        _os_log_impl(&dword_1BCB7D000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: Missing %ld subscriptions: %@", buf, 0x20u);
      }
      uint64_t v15 = *(void **)(a1 + 32);
      id v16 = *(id *)(a1 + 40);
      if (v15)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke;
        v29 = &unk_1E630A018;
        v30 = v15;
        v31 = sel__registerSubscriptionsWithIdentifer_database_;
        objc_super v17 = objc_msgSend(v9, "hk_map:", buf);
        v18 = (void *)[objc_alloc(MEMORY[0x1E4F1A1B8]) initWithSubscriptionsToSave:v17 subscriptionIDsToDelete:0];
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke_2;
        v26[3] = &unk_1E630A040;
        v26[4] = v15;
        id v19 = v16;
        id v27 = v19;
        [v18 setModifySubscriptionsCompletionBlock:v26];
        id v20 = [v15 configuration];
        v21 = [v20 operationGroup];
        [v18 setGroup:v21];

        [v19 addOperation:v18];
      }
    }
    else
    {
      [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
    }
  }
}

BOOL __49__HDCloudSyncRegisterSubscriptionsOperation_main__block_invoke_281(uint64_t a1, uint64_t a2)
{
  v2 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  BOOL v3 = v2 == 0;

  return v3;
}

id __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(*(void *)(a1 + 32) + 104) objectForKeyedSubscript:v3];
  if (!v4)
  {
    v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:*(void *)(a1 + 40) object:*(void *)(a1 + 32) file:@"HDCloudSyncRegisterSubscriptionsOperation.m" lineNumber:86 description:@"Record type nil for subscription after validation."];
  }
  if (v4 == @"CloudSyncStateRecord")
  {
    v8 = *(void **)(a1 + 32);
    if (!v8) {
      goto LABEL_8;
    }
    v10 = @"CloudSyncStateRecord";
    id v11 = v3;
    id v12 = [v8 profile];
    uint64_t v13 = [v12 daemon];
    uint64_t v14 = [v13 cloudSyncCoordinator];
    uint64_t v15 = [v14 stateSyncDomainForSubscriptionIdentifier];
    id v9 = [v15 objectForKeyedSubscript:v11];

    id v16 = (void *)MEMORY[0x1E4F1A320];
    objc_super v17 = [v8 configuration];
    v18 = [v17 syncContainerPrefix];
    id v19 = objc_msgSend(v16, "hd_stateSyncZoneIDForSyncCircleIdentifier:domain:", v18, v9);

    v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A340]) initWithZoneID:v19 subscriptionID:v11];
    [v8 setRecordType:v10];

    id v20 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
    [v20 setAlertBody:v11];

    [v8 setNotificationInfo:v20];
  }
  else
  {
    id v5 = (objc_class *)MEMORY[0x1E4F19F50];
    id v6 = v3;
    v7 = v4;
    v8 = (void *)[[v5 alloc] initWithSubscriptionID:v6];
    [v8 setRecordType:v7];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1A1E0]);
    [v9 setAlertBody:v6];

    [v8 setNotificationInfo:v9];
  }

LABEL_8:

  return v8;
}

void __90__HDCloudSyncRegisterSubscriptionsOperation__registerSubscriptionsWithIdentifer_database___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  _HKInitializeLogging();
  id v6 = *MEMORY[0x1E4F29FA8];
  v7 = *MEMORY[0x1E4F29FA8];
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      uint64_t v13 = *(void *)(a1 + 32);
      uint64_t v14 = *(void *)(a1 + 40);
      int v15 = 138543874;
      uint64_t v16 = v13;
      __int16 v17 = 2114;
      uint64_t v18 = v14;
      __int16 v19 = 2114;
      id v20 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@ Error saving subscriptions in database %{public}@, error: %{public}@", (uint8_t *)&v15, 0x20u);
    }
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = 0;
    id v10 = v5;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      uint64_t v12 = *(void *)(a1 + 40);
      int v15 = 138543618;
      uint64_t v16 = v11;
      __int16 v17 = 2114;
      uint64_t v18 = v12;
      _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Successfully saved subscriptions in database %{public}@", (uint8_t *)&v15, 0x16u);
    }
    v8 = *(void **)(a1 + 32);
    uint64_t v9 = 1;
    id v10 = 0;
  }
  [v8 finishWithSuccess:v9 error:v10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);

  objc_storeStrong((id *)&self->_subscriptions, 0);
}

@end