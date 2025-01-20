@interface DPReportGenerator
@end

@implementation DPReportGenerator

uint64_t __53___DPReportGenerator_filterNonConformingRecordsFrom___block_invoke()
{
  return [(id)objc_opt_class() conformsToProtocol:&unk_1F37A1880] ^ 1;
}

void __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke(uint64_t a1, char a2, uint64_t a3, void *a4)
{
  id v7 = a4;
  if (a2)
  {
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a3;
  }
  else
  {
    v8 = +[_DPLog daemon];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke_cold_1(a1);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v10 = +[_DPLog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke_cold_1(a1);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __50___DPReportGenerator_queryKeysForPattern_storage___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v10 = +[_DPLog daemon];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke_cold_1(a1);
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t __54___DPReportGenerator_randomizeKeys_andSortByPriority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v6 = (void *)MEMORY[0x1E019F810]();
  id v7 = +[_DPKeyProperties keyPropertiesForName:v4];
  id v8 = +[_DPKeyProperties keyPropertiesForName:v5];
  unint64_t v9 = [v7 submissionPriority];
  unint64_t v10 = [v8 submissionPriority];
  uint64_t v11 = -1;
  if (v9 >= v10) {
    uint64_t v11 = 1;
  }
  if (v9 == v10) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = v11;
  }

  return v12;
}

void __59___DPReportGenerator_scheduleMaintenanceWithName_database___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  v3 = (void *)os_transaction_create();
  id v4 = (void *)MEMORY[0x1E019F810]();
  id v5 = (id)[*(id *)(a1 + 32) generateReportUsing:*(void *)(a1 + 40)];
}

void __67___DPReportGenerator_queryRecordCountForKey_withPredicate_storage___block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v2, v3, "%@: record count fetch failed with %@", v4, v5, v6, v7, v8);
}

void __49___DPReportGenerator_queryRecordsForKey_storage___block_invoke_cold_1(uint64_t a1)
{
  v1 = NSStringFromSelector(*(SEL *)(a1 + 48));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v2, v3, "%@: record fetch failed with %@", v4, v5, v6, v7, v8);
}

@end