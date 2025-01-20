@interface HDCloudSyncLookupParticipantOperation
- (CKShareParticipant)participant;
- (HDCloudSyncLookupParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4;
- (HDCloudSyncLookupParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5;
- (void)_unitTest_setParticipant:(id)a3;
- (void)main;
@end

@implementation HDCloudSyncLookupParticipantOperation

- (HDCloudSyncLookupParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4
{
  v5 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v6 = *MEMORY[0x1E4F1C3C8];
  v7 = NSStringFromSelector(a2);
  [v5 raise:v6, @"The -%@ method is not available on %@", v7, objc_opt_class() format];

  return 0;
}

- (HDCloudSyncLookupParticipantOperation)initWithConfiguration:(id)a3 cloudState:(id)a4 identityLookupInfo:(id)a5
{
  id v9 = a5;
  v13.receiver = self;
  v13.super_class = (Class)HDCloudSyncLookupParticipantOperation;
  v10 = [(HDCloudSyncOperation *)&v13 initWithConfiguration:a3 cloudState:a4];
  v11 = v10;
  if (v10) {
    objc_storeStrong((id *)&v10->_identityLookupInfo, a5);
  }

  return v11;
}

- (void)main
{
  v13[1] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1A0D8]);
  v13[0] = self->_identityLookupInfo;
  v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:1];
  v5 = (void *)[v3 initWithUserIdentityLookupInfos:v4];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __45__HDCloudSyncLookupParticipantOperation_main__block_invoke;
  v12[3] = &unk_1E62F8788;
  v12[4] = self;
  [v5 setPerShareParticipantCompletionBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __45__HDCloudSyncLookupParticipantOperation_main__block_invoke_283;
  v11[3] = &unk_1E62F3170;
  v11[4] = self;
  [v5 setFetchShareParticipantsCompletionBlock:v11];
  uint64_t v6 = [(HDCloudSyncOperation *)self configuration];
  v7 = [v6 operationGroup];
  [v5 setGroup:v7];

  v8 = [(HDCloudSyncOperation *)self configuration];
  id v9 = [v8 repository];
  v10 = [v9 primaryCKContainer];

  [v10 addOperation:v5];
}

void __45__HDCloudSyncLookupParticipantOperation_main__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    v10 = (id *)(*(void *)(a1 + 32) + 104);
    if (!*v10)
    {
      objc_storeStrong(v10, a3);
      [*(id *)(a1 + 32) finishWithSuccess:1 error:0];
    }
  }
  else
  {
    _HKInitializeLogging();
    v11 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = *(void *)(a1 + 32);
      int v13 = 138543618;
      uint64_t v14 = v12;
      __int16 v15 = 2114;
      id v16 = v9;
      _os_log_error_impl(&dword_1BCB7D000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Error fetching participant %{public}@.", (uint8_t *)&v13, 0x16u);
    }
  }
}

void __45__HDCloudSyncLookupParticipantOperation_main__block_invoke_283(uint64_t a1, void *a2)
{
  id v4 = a2;
  id v3 = [*(id *)(a1 + 32) participant];

  if (!v3) {
    objc_msgSend(*(id *)(a1 + 32), "finishWithSuccess:error:", v4 == 0);
  }
}

- (void)_unitTest_setParticipant:(id)a3
{
}

- (CKShareParticipant)participant
{
  return (CKShareParticipant *)objc_getProperty(self, a2, 104, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityLookupInfo, 0);

  objc_storeStrong((id *)&self->_participant, 0);
}

@end