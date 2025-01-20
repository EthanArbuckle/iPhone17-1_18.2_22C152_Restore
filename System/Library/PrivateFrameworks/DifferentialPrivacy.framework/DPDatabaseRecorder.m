@interface DPDatabaseRecorder
@end

@implementation DPDatabaseRecorder

void __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

void __53___DPDatabaseRecorder_recordNumbersVectors_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

void __48___DPDatabaseRecorder_recordBitValues_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

void __49___DPDatabaseRecorder_recordBitVectors_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

void __51___DPDatabaseRecorder_recordFloatVectors_metadata___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

uint64_t __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) blacklistSet];
  uint64_t v5 = [v4 containsObject:v3];

  if (v5)
  {
    v6 = +[_DPLog daemon];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_cold_1();
    }
  }
  return v5;
}

void __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_34(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

void __35___DPDatabaseRecorder_recordWords___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[_DPLog framework];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) credit:*(void *)(a1 + 40) amount:*(void *)(a1 + 56)];
  }
}

void __46___DPDatabaseRecorder_recordNumbers_metadata___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  v1 = (const char *)OUTLINED_FUNCTION_8(v0);
  v2 = NSStringFromSelector(v1);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v3, v4, "%@: failed to save records with error = %@", v5, v6, v7, v8, v9);
}

void __46___DPDatabaseRecorder_recordStrings_metadata___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_1();
  _os_log_debug_impl(&dword_1DC55E000, v0, OS_LOG_TYPE_DEBUG, "\"%@\" : was in the do-not-send list : not recording in DB", v1, 0xCu);
}

@end