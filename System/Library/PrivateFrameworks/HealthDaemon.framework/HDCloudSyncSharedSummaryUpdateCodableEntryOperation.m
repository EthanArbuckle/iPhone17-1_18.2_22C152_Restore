@interface HDCloudSyncSharedSummaryUpdateCodableEntryOperation
- (HDCloudSyncSharedSummaryUpdateCodableEntryOperation)initWithConfiguration:(id)a3 updatedLocalEntries:(id)a4 isActive:(BOOL)a5 shouldResolveCNContact:(BOOL)a6;
- (id)_filterEntries:(id)a3 active:(BOOL)a4;
- (void)main;
- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5;
@end

@implementation HDCloudSyncSharedSummaryUpdateCodableEntryOperation

- (HDCloudSyncSharedSummaryUpdateCodableEntryOperation)initWithConfiguration:(id)a3 updatedLocalEntries:(id)a4 isActive:(BOOL)a5 shouldResolveCNContact:(BOOL)a6
{
  id v10 = a4;
  v17.receiver = self;
  v17.super_class = (Class)HDCloudSyncSharedSummaryUpdateCodableEntryOperation;
  v11 = [(HDCloudSyncOperation *)&v17 initWithConfiguration:a3 cloudState:0];
  if (v11)
  {
    uint64_t v12 = [v10 copy];
    updatedLocalEntries = v11->_updatedLocalEntries;
    v11->_updatedLocalEntries = (NSArray *)v12;

    v11->_isActive = a5;
    v11->_shouldResolve = a6;
    v14 = (HDSynchronousTaskGroup *)objc_alloc_init(MEMORY[0x1E4F65D90]);
    taskGroup = v11->_taskGroup;
    v11->_taskGroup = v14;

    [(HDSynchronousTaskGroup *)v11->_taskGroup setDelegate:v11];
  }

  return v11;
}

- (void)main
{
  [(HDSynchronousTaskGroup *)self->_taskGroup beginTask];
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 cloudSyncShimProvider];
  v6 = [v5 summarySharingEntryShim];

  v7 = [(HDCloudSyncSharedSummaryUpdateCodableEntryOperation *)self _filterEntries:self->_updatedLocalEntries active:self->_isActive];
  if ([v7 count])
  {
    BOOL shouldResolve = self->_shouldResolve;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __59__HDCloudSyncSharedSummaryUpdateCodableEntryOperation_main__block_invoke;
    v9[3] = &unk_1E62F2978;
    v9[4] = self;
    [v6 insertOrReplaceCodableSharingEntries:v7 shouldResolveCNContact:shouldResolve completion:v9];
  }
  else
  {
    [(HDSynchronousTaskGroup *)self->_taskGroup finishTask];
  }
}

void __59__HDCloudSyncSharedSummaryUpdateCodableEntryOperation_main__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a2)
  {
    [*(id *)(*(void *)(a1 + 32) + 112) finishTask];
  }
  else
  {
    _HKInitializeLogging();
    v6 = *MEMORY[0x1E4F29FA8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E4F29FA8], OS_LOG_TYPE_ERROR))
    {
      uint64_t v7 = *(void *)(a1 + 32);
      int v8 = 138543618;
      uint64_t v9 = v7;
      __int16 v10 = 2114;
      id v11 = v5;
      _os_log_error_impl(&dword_1BCB7D000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [summary-sharing] Unable to insert inactive entries %{public}@", (uint8_t *)&v8, 0x16u);
    }
    [*(id *)(*(void *)(a1 + 32) + 112) failTaskWithError:v5];
  }
}

- (id)_filterEntries:(id)a3 active:(BOOL)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__HDCloudSyncSharedSummaryUpdateCodableEntryOperation__filterEntries_active___block_invoke;
  v6[3] = &__block_descriptor_33_e38_B16__0__HDCodableSummarySharingEntry_8l;
  BOOL v7 = a4;
  v4 = objc_msgSend(a3, "hk_filter:", v6);

  return v4;
}

BOOL __77__HDCloudSyncSharedSummaryUpdateCodableEntryOperation__filterEntries_active___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = [a2 status];
  if (v3 - 2 < 3 || v3 > 1) {
    return *(unsigned char *)(a1 + 32) == 0;
  }
  else {
    return *(unsigned char *)(a1 + 32) != 0;
  }
}

- (void)synchronousTaskGroup:(id)a3 didFinishWithSuccess:(BOOL)a4 errors:(id)a5
{
  BOOL v5 = a4;
  objc_msgSend(a5, "firstObject", a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  [(HDCloudSyncOperation *)self finishWithSuccess:v5 error:v7];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskGroup, 0);

  objc_storeStrong((id *)&self->_updatedLocalEntries, 0);
}

@end