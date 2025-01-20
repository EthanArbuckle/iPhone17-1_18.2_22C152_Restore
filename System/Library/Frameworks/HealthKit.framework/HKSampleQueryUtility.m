@interface HKSampleQueryUtility
@end

@implementation HKSampleQueryUtility

void __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (v13)
  {
    _HKInitializeLogging();
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke_cold_1();
    }
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained handleAddedObjects:v10 deletedObjects:v11 queryAnchor:v12 error:v13 resultsHandler:*(void *)(a1 + 40)];
}

void __42___HKSampleQueryUtility_setUpdateHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5, void *a6)
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (v13)
    {
      _HKInitializeLogging();
      if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
        __42___HKSampleQueryUtility_setUpdateHandler___block_invoke_cold_1();
      }
    }
    [WeakRetained handleAddedObjects:v10 deletedObjects:v11 queryAnchor:v12 error:v13 resultsHandler:WeakRetained[8]];
  }
}

uint64_t __92___HKSampleQueryUtility_handleAddedObjects_deletedObjects_queryAnchor_error_resultsHandler___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  id v3 = a2;
  v4 = [v2 UUID];
  v5 = [v3 UUID];

  uint64_t v6 = [v4 isEqual:v5];
  return v6;
}

void __57___HKSampleQueryUtility_setupQueryWithCompletionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Failed to get results for _HKSampleQueryUtility (type: %@) with error: %@");
}

void __42___HKSampleQueryUtility_setUpdateHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_1(&dword_19C023000, v0, v1, "Failed to get update results for _HKSampleQueryUtility (type: %@) with error: %@");
}

@end