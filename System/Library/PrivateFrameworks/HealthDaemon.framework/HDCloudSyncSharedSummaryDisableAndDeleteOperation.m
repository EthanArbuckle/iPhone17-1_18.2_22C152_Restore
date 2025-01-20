@interface HDCloudSyncSharedSummaryDisableAndDeleteOperation
- (void)main;
@end

@implementation HDCloudSyncSharedSummaryDisableAndDeleteOperation

- (void)main
{
  v3 = [(HDCloudSyncOperation *)self configuration];
  v4 = [v3 repository];
  v5 = [v4 cloudSyncShimProvider];
  v6 = [v5 summarySharingEntryShim];

  v7 = [(HDCloudSyncOperation *)self configuration];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke;
  v8[3] = &unk_1E62F2978;
  v8[4] = self;
  [v6 disableAllSharingEntriesWithConfiguration:v7 completion:v8];
}

void __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke(uint64_t a1, char a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  if (a2)
  {
    v5 = [v4 configuration];
    v6 = [v5 repository];
    v7 = [v6 cloudSyncShimProvider];
    v8 = [v7 sharedSummariesShim];
    v9 = [*(id *)(a1 + 32) configuration];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_2;
    v10[3] = &unk_1E62F2978;
    v10[4] = *(void *)(a1 + 32);
    [v8 deleteAllSharedSummaryTransactionsWithConfiguration:v9 completion:v10];
  }
  else
  {
    [v4 finishWithSuccess:0 error:a3];
  }
}

void __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_2(uint64_t a1, char a2, uint64_t a3)
{
  v4 = *(void **)(a1 + 32);
  if (a2)
  {
    v5 = [v4 configuration];
    v6 = [v5 repository];
    v7 = [v6 cloudSyncShimProvider];
    v8 = [v7 profileManagementShim];

    v9 = [*(id *)(a1 + 32) configuration];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_3;
    v10[3] = &unk_1E62F2978;
    v10[4] = *(void *)(a1 + 32);
    [v8 deleteAllProfilesOfType:2 configuration:v9 completion:v10];
  }
  else
  {
    [v4 finishWithSuccess:0 error:a3];
  }
}

uint64_t __57__HDCloudSyncSharedSummaryDisableAndDeleteOperation_main__block_invoke_3(uint64_t a1, char a2, uint64_t a3)
{
  v3 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v4 = 1;
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = a3;
    uint64_t v4 = 0;
  }
  return [v3 finishWithSuccess:v4 error:v5];
}

@end