@interface DPPrivacyBudget
@end

@implementation DPPrivacyBudget

uint64_t __30___DPPrivacyBudget_initialize__block_invoke()
{
  gAllBudgets = [MEMORY[0x1E4F1CC08] mutableCopy];
  return MEMORY[0x1F41817F8]();
}

void __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v10 = +[_DPLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __44___DPPrivacyBudget_fetchBudgetKeyNamesFrom___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8 = a3;
  id v9 = a4;
  if (a2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    v10 = +[_DPLog framework];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = +[_DPLog framework];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke_cold_1();
    }
  }
}

void __46___DPPrivacyBudget_fetchBudgetRecordFrom_key___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  v1 = NSStringFromSelector(*(SEL *)(v0 + 48));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v2, v3, "%@: record fetch failed with %@", v4, v5, v6, v7, v8);
}

void __87___DPPrivacyBudget_createDatabaseRecordIfMissingIn_key_balance_cohortAggregateBalance___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_1();
  v1 = NSStringFromSelector(*(SEL *)(v0 + 32));
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_3_0(&dword_1DC55E000, v2, v3, "%@: record save failed with %@", v4, v5, v6, v7, v8);
}

@end