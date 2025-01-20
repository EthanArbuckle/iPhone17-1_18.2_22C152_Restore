@interface DPTokenFetcher
@end

@implementation DPTokenFetcher

void __32___DPTokenFetcher_doMaintenance__block_invoke(uint64_t a1, char a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __32___DPTokenFetcher_doMaintenance__block_invoke_cold_1((uint64_t)v5, v6);
    }
  }
  unint64_t v7 = +[_DPTokenFetcher getTaskPeriodSeconds];
  if (v7 != [*(id *)(a1 + 32) taskPeriodSeconds])
  {
    v8 = +[_DPLog daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [*(id *)(a1 + 32) taskPeriodSeconds];
      int v12 = 134218240;
      uint64_t v13 = v9;
      __int16 v14 = 2048;
      unint64_t v15 = v7;
      _os_log_impl(&dword_1DC55E000, v8, OS_LOG_TYPE_INFO, "Token refresh seconds changed from %lud to %lud", (uint8_t *)&v12, 0x16u);
    }

    v10 = *(void **)(a1 + 32);
    v11 = [v10 taskName];
    [v10 scheduleMaintenanceWithName:v11 database:0];

    [*(id *)(a1 + 32) setTaskPeriodSeconds:v7];
  }
}

void __56___DPTokenFetcher_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)os_transaction_create();
  v4 = (void *)MEMORY[0x1E019F810]();
  [*(id *)(a1 + 32) doMaintenance];
}

void __32___DPTokenFetcher_doMaintenance__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_ERROR, "Failed to fetch tokens with error: %@", (uint8_t *)&v2, 0xCu);
}

@end