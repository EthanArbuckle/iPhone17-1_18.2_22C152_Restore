@interface HDCloudSyncSharedSummaryManager
+ (void)unitTesting_setUrgentLatency:(double)a3;
- (HDCloudSyncSharedSummaryManager)initWithProfile:(id)a3;
- (HDKeyValueDomain)_localKeyValueDomain;
- (id)pull:(id)a3;
- (id)push:(id)a3;
- (id)revokeParticipantWithOutgoingSummarySharingEntry:(id)a3 completion:(id)a4;
- (id)setupSharingWithOutgoingSummarySharingEntry:(id)a3 sharingAuthorizations:(id)a4 completion:(id)a5;
- (id)synchronizeWithCompletion:(id)a3;
- (void)scheduleBackgroundPush;
- (void)scheduleUrgentPush;
@end

@implementation HDCloudSyncSharedSummaryManager

- (HDCloudSyncSharedSummaryManager)initWithProfile:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HDCloudSyncSharedSummaryManager;
  v5 = [(HDCloudSyncSharedSummaryManager *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_profile, v4);
  }

  return v6;
}

- (id)setupSharingWithOutgoingSummarySharingEntry:(id)a3 sharingAuthorizations:(id)a4 completion:(id)a5
{
  id v8 = a5;
  p_profile = &self->_profile;
  id v10 = a4;
  id v11 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v13 = [WeakRetained database];
  v14 = (objc_class *)objc_opt_class();
  v15 = NSStringFromClass(v14);
  id v36 = 0;
  v16 = [v13 takeAccessibilityAssertionWithOwnerIdentifier:v15 timeout:&v36 error:300.0];
  id v17 = v36;

  id v18 = objc_loadWeakRetained((id *)p_profile);
  v19 = [v18 cloudSyncManager];
  [v19 prepareForPeriodicSync];

  id v20 = [[HDCloudSyncContext alloc] initForPurpose:10 options:64 reason:9 xpcActivity:0];
  v21 = HKAuthorizationIdentifiersFromSharingAuthorizations();

  v22 = [HDCloudSyncSharedSummarySetupTask alloc];
  id v23 = objc_loadWeakRetained((id *)p_profile);
  v24 = [v23 cloudSyncManager];
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = __112__HDCloudSyncSharedSummaryManager_setupSharingWithOutgoingSummarySharingEntry_sharingAuthorizations_completion___block_invoke;
  v33[3] = &unk_1E630EBC0;
  id v34 = v16;
  id v35 = v8;
  id v25 = v8;
  id v26 = v16;
  v27 = [(HDCloudSyncSharedSummarySetupTask *)v22 initWithManager:v24 context:v20 codableEntry:v11 authorizationIdentifiers:v21 accessibilityAssertion:v26 completion:v33];

  [(HDCloudSyncManagerTask *)v27 setPriority:100];
  id v28 = objc_loadWeakRetained((id *)p_profile);
  v29 = [v28 daemon];
  v30 = [v29 cloudSyncCoordinator];
  [v30 addManagerTask:v27];

  v31 = [(HDCloudSyncManagerTask *)v27 progress];

  return v31;
}

void __112__HDCloudSyncSharedSummaryManager_setupSharingWithOutgoingSummarySharingEntry_sharingAuthorizations_completion___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v13 = a2;
  id v7 = a4;
  [*(id *)(a1 + 32) invalidate];
  uint64_t v8 = *(void *)(a1 + 40);
  if (a3)
  {
    v9 = [v13 shareSetupMetadata];
    id v10 = [v13 participantIdentity];
    id v11 = [v10 userRecordID];
    v12 = [v11 recordName];
    (*(void (**)(uint64_t, void *, void *, void))(v8 + 16))(v8, v9, v12, 0);
  }
  else
  {
    (*(void (**)(uint64_t, void, void, id))(v8 + 16))(v8, 0, 0, v7);
  }
}

- (id)synchronizeWithCompletion:(id)a3
{
  id v4 = a3;
  p_profile = &self->_profile;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v7 = [WeakRetained database];
  uint64_t v8 = (objc_class *)objc_opt_class();
  v9 = NSStringFromClass(v8);
  id v27 = 0;
  id v10 = [v7 takeAccessibilityAssertionWithOwnerIdentifier:v9 timeout:&v27 error:300.0];
  id v11 = v27;

  id v12 = [[HDCloudSyncContext alloc] initForPurpose:19 options:64 reason:27 xpcActivity:0];
  id v13 = [HDCloudSyncSharedSummarySynchronizeTask alloc];
  id v14 = objc_loadWeakRetained((id *)p_profile);
  v15 = [v14 cloudSyncManager];
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __61__HDCloudSyncSharedSummaryManager_synchronizeWithCompletion___block_invoke;
  v24[3] = &unk_1E62FA310;
  id v25 = v10;
  id v26 = v4;
  id v16 = v4;
  id v17 = v10;
  id v18 = [(HDCloudSyncManagerPipelineTask *)v13 initWithManager:v15 context:v12 accessibilityAssertion:v17 completion:v24];

  id v19 = objc_loadWeakRetained((id *)p_profile);
  id v20 = [v19 daemon];
  v21 = [v20 cloudSyncCoordinator];
  [v21 addManagerTask:v18];

  v22 = [(HDCloudSyncManagerTask *)v18 progress];

  return v22;
}

void __61__HDCloudSyncSharedSummaryManager_synchronizeWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)push:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v7 = [WeakRetained profileType];

  if (v7 == 1)
  {
    p_profile = &self->_profile;
    id v9 = objc_loadWeakRetained((id *)&self->_profile);
    id v10 = [v9 database];
    id v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v35 = 0;
    id v13 = [v10 takeAccessibilityAssertionWithOwnerIdentifier:v12 timeout:&v35 error:300.0];
    id v14 = v35;

    id v15 = [[HDCloudSyncContext alloc] initForPurpose:2 options:64 reason:26 xpcActivity:0];
    id v16 = [HDCloudSyncSharedSummaryPushTask alloc];
    id v17 = objc_loadWeakRetained((id *)&self->_profile);
    id v18 = [v17 cloudSyncManager];
    uint64_t v28 = MEMORY[0x1E4F143A8];
    uint64_t v29 = 3221225472;
    v30 = __40__HDCloudSyncSharedSummaryManager_push___block_invoke;
    v31 = &unk_1E630EBE8;
    id v32 = v13;
    v33 = self;
    id v34 = v5;
    id v19 = v13;
    id v20 = [(HDCloudSyncManagerPipelineTask *)v16 initWithManager:v18 context:v15 accessibilityAssertion:v19 completion:&v28];

    id v21 = objc_loadWeakRetained((id *)p_profile);
    v22 = objc_msgSend(v21, "daemon", v28, v29, v30, v31);
    id v23 = [v22 cloudSyncCoordinator];
    [v23 addManagerTask:v20];

    v24 = [(HDCloudSyncManagerTask *)v20 progress];
  }
  else
  {
    _HKInitializeLogging();
    id v25 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v37 = self;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Push shared summaries called on non-primary profile. No work needed.", buf, 0xCu);
    }
    id v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, @"Push shared summaries called on non-primary profile.");
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v26);

    v24 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
  }

  return v24;
}

void __40__HDCloudSyncSharedSummaryManager_push___block_invoke(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v14 = a4;
  [*(id *)(a1 + 32) invalidate];
  if (a3)
  {
    uint64_t v6 = *(void *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
    uint64_t v8 = v7;
    if (v6)
    {
      id v9 = v7;
      id v10 = -[HDCloudSyncSharedSummaryManager _localKeyValueDomain](v6);
      id v15 = 0;
      char v11 = [v10 setDate:v9 forKey:@"MostRecentPushDate" error:&v15];

      id v12 = v15;
      if ((v11 & 1) == 0)
      {
        _HKInitializeLogging();
        id v13 = *MEMORY[0x1E4F29FA8];
        if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          uint64_t v17 = v6;
          __int16 v18 = 2114;
          id v19 = v12;
          _os_log_error_impl(&dword_1BCB7D000, v13, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to set most recent push date: %{public}@", buf, 0x16u);
        }
      }
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

- (id)pull:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (self) {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  }
  else {
    id WeakRetained = 0;
  }
  uint64_t v7 = [WeakRetained profileType];

  if (v7 == 2)
  {
    p_profile = &self->_profile;
    id v9 = objc_loadWeakRetained((id *)&self->_profile);
    id v10 = [v9 database];
    char v11 = (objc_class *)objc_opt_class();
    id v12 = NSStringFromClass(v11);
    id v31 = 0;
    id v13 = [v10 takeAccessibilityAssertionWithOwnerIdentifier:v12 timeout:&v31 error:300.0];
    id v14 = v31;

    id v15 = [[HDCloudSyncContext alloc] initForPurpose:3 options:64 reason:25 xpcActivity:0];
    id v16 = [HDCloudSyncSharedSummaryPullTask alloc];
    id v17 = objc_loadWeakRetained((id *)p_profile);
    __int16 v18 = [v17 cloudSyncManager];
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __40__HDCloudSyncSharedSummaryManager_pull___block_invoke;
    v28[3] = &unk_1E62FA310;
    id v29 = v13;
    id v30 = v5;
    id v19 = v13;
    uint64_t v20 = [(HDCloudSyncManagerPipelineTask *)v16 initWithManager:v18 context:v15 accessibilityAssertion:v19 completion:v28];

    id v21 = objc_loadWeakRetained((id *)p_profile);
    v22 = [v21 daemon];
    id v23 = [v22 cloudSyncCoordinator];
    [v23 addManagerTask:v20];

    v24 = [(HDCloudSyncManagerTask *)v20 progress];
  }
  else
  {
    _HKInitializeLogging();
    id v25 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v33 = self;
      _os_log_impl(&dword_1BCB7D000, v25, OS_LOG_TYPE_DEFAULT, "[summary-sharing] %{public}@: Pull shared summaries called on non-summary sharing profile. No work needed.", buf, 0xCu);
    }
    id v26 = objc_msgSend(MEMORY[0x1E4F28C58], "hk_error:class:selector:format:", 127, objc_opt_class(), a2, @"Pull shared summaries called on non-summary sharing profile.");
    (*((void (**)(id, void, void *))v5 + 2))(v5, 0, v26);

    v24 = objc_msgSend(MEMORY[0x1E4F28F90], "hk_finishedDiscreteProgressWithTotalUnitCount:", 1);
  }

  return v24;
}

void __40__HDCloudSyncSharedSummaryManager_pull___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (id)revokeParticipantWithOutgoingSummarySharingEntry:(id)a3 completion:(id)a4
{
  id v6 = a4;
  p_profile = &self->_profile;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v10 = [WeakRetained database];
  char v11 = (objc_class *)objc_opt_class();
  id v12 = NSStringFromClass(v11);
  id v30 = 0;
  id v13 = [v10 takeAccessibilityAssertionWithOwnerIdentifier:v12 timeout:&v30 error:300.0];
  id v14 = v30;

  id v15 = [[HDCloudSyncContext alloc] initForPurpose:19 options:64 reason:11 xpcActivity:0];
  id v16 = [HDCloudSyncSharedSummaryRevokeParticipantTask alloc];
  id v17 = objc_loadWeakRetained((id *)p_profile);
  __int16 v18 = [v17 cloudSyncManager];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __95__HDCloudSyncSharedSummaryManager_revokeParticipantWithOutgoingSummarySharingEntry_completion___block_invoke;
  v27[3] = &unk_1E630EC10;
  id v28 = v13;
  id v29 = v6;
  id v19 = v6;
  id v20 = v13;
  id v21 = [(HDCloudSyncSharedSummaryRevokeParticipantTask *)v16 initWithManager:v18 context:v15 codableEntry:v8 accessibilityAssertion:v20 completion:v27];

  [(HDCloudSyncManagerTask *)v21 setPriority:100];
  id v22 = objc_loadWeakRetained((id *)p_profile);
  id v23 = [v22 daemon];
  v24 = [v23 cloudSyncCoordinator];
  [v24 addManagerTask:v21];

  id v25 = [(HDCloudSyncManagerTask *)v21 progress];

  return v25;
}

void __95__HDCloudSyncSharedSummaryManager_revokeParticipantWithOutgoingSummarySharingEntry_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a4;
  [v5 invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

- (HDKeyValueDomain)_localKeyValueDomain
{
  v2 = [HDKeyValueDomain alloc];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 8));
  id v4 = [(HDKeyValueDomain *)v2 initWithCategory:0 domainName:@"CloudSyncSharedSummary" profile:WeakRetained];

  return v4;
}

- (void)scheduleBackgroundPush
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (self)
  {
    v3 = -[HDCloudSyncSharedSummaryManager _localKeyValueDomain]((uint64_t)self);
    id v19 = 0;
    id v4 = [v3 dateForKey:@"MostRecentPushDate" error:&v19];
    id v5 = v19;
    id v6 = v5;
    if (v4 || !v5)
    {
      id v8 = v4;
    }
    else
    {
      _HKInitializeLogging();
      uint64_t v7 = *MEMORY[0x1E4F29FA8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        id v21 = self;
        __int16 v22 = 2114;
        id v23 = v6;
        _os_log_error_impl(&dword_1BCB7D000, v7, OS_LOG_TYPE_ERROR, "[summary-sharing] %{public}@: Failed to lookup most recent sync date; using now: %{public}@",
          buf,
          0x16u);
      }
      id v8 = [MEMORY[0x1E4F1C9C8] date];
    }
    id v17 = v8;

    objc_msgSend(v17, "timeIntervalSinceReferenceDate", v17);
  }
  else
  {
    objc_msgSend(0, "timeIntervalSinceReferenceDate", 0);
  }
  double v10 = v9 + 7200.0;
  char v11 = [MEMORY[0x1E4F1C9C8] date];
  [v11 timeIntervalSinceReferenceDate];
  double v13 = v10 - v12;

  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  id v15 = [WeakRetained daemon];
  id v16 = [v15 cloudSyncCoordinator];
  objc_msgSend(v16, "scheduleSharedSummaryPushWithMaximumDelay:", fmax(v13, 30.0));
}

- (void)scheduleUrgentPush
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_profile);
  v2 = [WeakRetained daemon];
  v3 = [v2 cloudSyncCoordinator];
  [v3 scheduleSharedSummaryPushWithMaximumDelay:*(double *)&_urgentLatency];
}

+ (void)unitTesting_setUrgentLatency:(double)a3
{
  _urgentLatency = *(void *)&a3;
}

- (void).cxx_destruct
{
}

@end