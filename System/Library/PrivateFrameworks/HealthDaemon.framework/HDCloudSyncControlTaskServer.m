@interface HDCloudSyncControlTaskServer
+ (BOOL)validateClient:(id)a3 error:(id *)a4;
+ (id)requiredEntitlements;
+ (id)taskIdentifier;
- (id)exportedInterface;
- (id)remoteInterface;
- (id)remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3;
- (id)remote_fetchCloudDescriptionWithCompletion:(id)a3;
- (id)remote_fetchCloudSyncProgressWithCompletion:(id)a3;
- (id)remote_forceCloudResetWithCompletion:(id)a3;
- (id)remote_forceCloudSyncDataUploadForProfileWithCompletion:(id)a3;
- (id)remote_forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)remote_accountConfigurationDidChangeWithCompletion:(id)a3;
- (void)remote_disableCloudSyncWithCompletion:(id)a3;
- (void)remote_enableCloudSyncWithCompletion:(id)a3;
- (void)remote_fetchCloudSyncStatusWithCompletion:(id)a3;
- (void)remote_oldestSampleStartDateInHealthDatabaseWithCompletion:(id)a3;
- (void)remote_requestDataRefreshWithCompletion:(id)a3;
- (void)remote_syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5;
@end

@implementation HDCloudSyncControlTaskServer

+ (id)taskIdentifier
{
  return (id)[MEMORY[0x1E4F2AD28] taskIdentifier];
}

+ (id)requiredEntitlements
{
  return (id)MEMORY[0x1E4F1CBF0];
}

+ (BOOL)validateClient:(id)a3 error:(id *)a4
{
  uint64_t v5 = *MEMORY[0x1E4F2A548];
  id v6 = a3;
  LOBYTE(v5) = [v6 hasRequiredEntitlement:v5 error:a4];
  LOBYTE(a4) = [v6 hasRequiredArrayEntitlement:*MEMORY[0x1E4F2A558] containing:*MEMORY[0x1E4F29AE8] error:a4];

  return v5 | a4;
}

- (id)remoteInterface
{
  return (id)MEMORY[0x1F40E7B10](self, a2);
}

- (id)exportedInterface
{
  return (id)MEMORY[0x1F40E7B18](self, a2);
}

- (void)remote_syncWithRequest:(id)a3 reason:(id)a4 completion:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  v10 = (void (**)(id, uint64_t, void))a5;
  _HKInitializeLogging();
  v11 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v25 = self;
    __int16 v26 = 2114;
    id v27 = v8;
    __int16 v28 = 2114;
    id v29 = v9;
    _os_log_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Requested: %{public}@ Reason: %{public}@", buf, 0x20u);
  }
  id v12 = [[HDCloudSyncContext alloc] initForPurpose:0 options:HDOptionsForRequest(v8) reason:1 xpcActivity:0];
  [v12 setSyncRequest:v8];
  int v13 = [v9 isEqualToString:@"hkctl"];
  v14 = [(HDStandardTaskServer *)self profile];
  v15 = [v14 daemon];
  v16 = [v15 cloudSyncCoordinator];
  v17 = v16;
  if (v13)
  {
    v23 = 0;
    int v18 = [v16 scheduleSyncForAllProfilesViaGatedXPCActivity:0 context:v12 reason:v9 error:&v23];
    v19 = v23;
  }
  else
  {
    v22 = 0;
    int v18 = [v16 scheduleSyncForAllProfilesViaGatedXPCActivity:1 context:v12 reason:v9 error:&v22];
    v19 = v22;
  }
  id v20 = v19;

  if (v18)
  {
    v10[2](v10, 1, 0);
  }
  else
  {
    v21 = objc_msgSend(v20, "hk_sanitizedError");
    ((void (**)(id, uint64_t, void *))v10)[2](v10, 0, v21);
  }
}

- (id)remote_forceCloudSyncWithOptions:(unint64_t)a3 reason:(int64_t)a4 completion:(id)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  _HKInitializeLogging();
  id v9 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = HKCloudSyncOptionsToString();
    id v12 = HKCloudSyncReasonToString();
    *(_DWORD *)buf = 138543874;
    v23 = self;
    __int16 v24 = 2114;
    v25 = v11;
    __int16 v26 = 2114;
    id v27 = v12;
    _os_log_impl(&dword_1BCB7D000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Triggered by options: %{public}@ reason: %{public}@", buf, 0x20u);
  }
  id v13 = [[HDCloudSyncContext alloc] initForPurpose:0 options:a3 reason:a4 xpcActivity:0];
  v14 = [(HDStandardTaskServer *)self profile];
  v15 = [v14 daemon];
  v16 = [v15 cloudSyncCoordinator];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __83__HDCloudSyncControlTaskServer_remote_forceCloudSyncWithOptions_reason_completion___block_invoke;
  v20[3] = &unk_1E62F29A0;
  id v21 = v8;
  id v17 = v8;
  int v18 = [v16 syncAllProfilesWithContext:v13 completion:v20];

  return v18;
}

void __83__HDCloudSyncControlTaskServer_remote_forceCloudSyncWithOptions_reason_completion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (id)remote_forceCloudResetWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HDCloudSyncContext alloc] initForPurpose:8 options:0 reason:4 xpcActivity:0];
  id v6 = [(HDStandardTaskServer *)self profile];
  v7 = [v6 daemon];
  id v8 = [v7 cloudSyncCoordinator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__HDCloudSyncControlTaskServer_remote_forceCloudResetWithCompletion___block_invoke;
  v12[3] = &unk_1E62F29A0;
  id v13 = v4;
  id v9 = v4;
  v10 = [v8 resetAllProfilesWithContext:v5 completion:v12];

  return v10;
}

void __69__HDCloudSyncControlTaskServer_remote_forceCloudResetWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (id)remote_forceCloudSyncDataUploadForProfileWithCompletion:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = (void *)*MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    id v6 = v5;
    v7 = [(HDStandardTaskServer *)self profile];
    id v8 = [v7 profileIdentifier];
    *(_DWORD *)buf = 138543618;
    int v18 = self;
    __int16 v19 = 2114;
    id v20 = v8;
    _os_log_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: Cloud Sync Data Upload Triggered for profileIdentifier: %{public}@", buf, 0x16u);
  }
  id v9 = [[HDCloudSyncContext alloc] initForPurpose:2 options:66 reason:21 xpcActivity:0];
  v10 = [(HDStandardTaskServer *)self profile];
  v11 = [v10 cloudSyncManager];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __88__HDCloudSyncControlTaskServer_remote_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke;
  v15[3] = &unk_1E62F29A0;
  id v16 = v4;
  id v12 = v4;
  id v13 = [v11 syncWithContext:v9 completion:v15];

  return v13;
}

void __88__HDCloudSyncControlTaskServer_remote_forceCloudSyncDataUploadForProfileWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (id)remote_fetchCloudDescriptionWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [[HDCloudSyncContext alloc] initForPurpose:7 options:4 reason:3 xpcActivity:0];
  id v6 = [(HDStandardTaskServer *)self profile];
  v7 = [v6 daemon];
  id v8 = [v7 cloudSyncCoordinator];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __75__HDCloudSyncControlTaskServer_remote_fetchCloudDescriptionWithCompletion___block_invoke;
  v12[3] = &unk_1E6303680;
  id v13 = v4;
  id v9 = v4;
  v10 = [v8 fetchCloudDescriptionWithContext:v5 completion:v12];

  return v10;
}

void __75__HDCloudSyncControlTaskServer_remote_fetchCloudDescriptionWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = a3;
  id v8 = a2;
  objc_msgSend(a4, "hk_sanitizedError");
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, id, id))(v6 + 16))(v6, v8, v7, v9);
}

- (void)remote_fetchCloudSyncStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  uint64_t v6 = [v5 daemon];
  id v7 = [v6 cloudSyncCoordinator];
  id v8 = [v7 syncStatusProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __74__HDCloudSyncControlTaskServer_remote_fetchCloudSyncStatusWithCompletion___block_invoke;
  v10[3] = &unk_1E63036A8;
  id v11 = v4;
  id v9 = v4;
  [v8 fetchSyncStatusWithCompletion:v10];
}

void __74__HDCloudSyncControlTaskServer_remote_fetchCloudSyncStatusWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  uint64_t v8 = *(void *)(a1 + 32);
  id v9 = a5;
  id v10 = a3;
  id v13 = [v10 lastSuccessfulPushDate];
  id v11 = [v10 lastSuccessfulPullDate];

  id v12 = objc_msgSend(v9, "hk_sanitizedError");

  (*(void (**)(uint64_t, uint64_t, id, void *, uint64_t, void *))(v8 + 16))(v8, a2, v13, v11, a4, v12);
}

- (id)remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  uint64_t v6 = [v5 daemon];
  id v7 = [v6 cloudSyncCoordinator];
  uint64_t v8 = [v7 accountProvider];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __91__HDCloudSyncControlTaskServer_remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke;
  v12[3] = &unk_1E62F29A0;
  id v13 = v4;
  id v9 = v4;
  id v10 = [v8 disableAndDeleteAllSyncDataWithCompletion:v12];

  return v10;
}

void __91__HDCloudSyncControlTaskServer_remote_disableCloudSyncAndDeleteAllCloudDataWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_disableCloudSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  uint64_t v6 = [v5 daemon];
  id v7 = [v6 cloudSyncCoordinator];
  uint64_t v8 = [v7 accountProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __70__HDCloudSyncControlTaskServer_remote_disableCloudSyncWithCompletion___block_invoke;
  v10[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v9 = v4;
  [v8 disableSyncLocallyWithCompletion:v10];
}

void __70__HDCloudSyncControlTaskServer_remote_disableCloudSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_enableCloudSyncWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  uint64_t v6 = [v5 daemon];
  id v7 = [v6 cloudSyncCoordinator];
  uint64_t v8 = [v7 accountProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __69__HDCloudSyncControlTaskServer_remote_enableCloudSyncWithCompletion___block_invoke;
  v10[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v9 = v4;
  [v8 enableSyncLocallyWithCompletion:v10];
}

void __69__HDCloudSyncControlTaskServer_remote_enableCloudSyncWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_accountConfigurationDidChangeWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  uint64_t v6 = [v5 daemon];
  id v7 = [v6 cloudSyncCoordinator];
  uint64_t v8 = [v7 accountProvider];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __83__HDCloudSyncControlTaskServer_remote_accountConfigurationDidChangeWithCompletion___block_invoke;
  v10[3] = &unk_1E62F29A0;
  id v11 = v4;
  id v9 = v4;
  [v8 accountConfigurationDidChangeWithCompletion:v10];
}

void __83__HDCloudSyncControlTaskServer_remote_accountConfigurationDidChangeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = *(void *)(a1 + 32);
  objc_msgSend(a3, "hk_sanitizedError");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, uint64_t, id))(v4 + 16))(v4, a2, v5);
}

- (void)remote_oldestSampleStartDateInHealthDatabaseWithCompletion:(id)a3
{
  uint64_t v4 = (void (**)(id, id, void))a3;
  id v5 = [(HDStandardTaskServer *)self profile];
  HDOldestSampleStartDate(v5);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  v4[2](v4, v6, 0);
}

- (id)remote_fetchCloudSyncProgressWithCompletion:(id)a3
{
  v3 = [(HDStandardTaskServer *)self profile];
  uint64_t v4 = [v3 daemon];
  id v5 = [v4 cloudSyncCoordinator];
  id v6 = [v5 syncStatusProvider];
  id v7 = [v6 currentSyncProgress];

  return v7;
}

- (void)remote_requestDataRefreshWithCompletion:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  _HKInitializeLogging();
  id v5 = *MEMORY[0x1E4F29FA8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138543362;
    id v9 = self;
    _os_log_impl(&dword_1BCB7D000, v5, OS_LOG_TYPE_DEFAULT, "%{public}@ Requesting data refresh (#t0)", (uint8_t *)&v8, 0xCu);
  }
  id v6 = [(HDStandardTaskServer *)self profile];
  id v7 = [v6 cloudSyncManager];
  [v7 requestDataUploadWithCompletion:v4];
}

@end