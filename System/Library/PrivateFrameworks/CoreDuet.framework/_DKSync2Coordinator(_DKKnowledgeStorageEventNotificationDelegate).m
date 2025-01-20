@interface _DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate)
@end

@implementation _DKSync2Coordinator(_DKKnowledgeStorageEventNotificationDelegate)

- (void)_databaseDidDeleteFromStreamNameCounts:()_DKKnowledgeStorageEventNotificationDelegate .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [(id)objc_opt_class() description];
  v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  v7 = [NSNumber numberWithUnsignedInteger:0];
  int v8 = 138543874;
  v9 = v5;
  OUTLINED_FUNCTION_15();
  _os_log_debug_impl(&dword_18ECEB000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Delete from %@ event streams is not triggering sync attemt due to event count of %@", (uint8_t *)&v8, 0x20u);
}

- (void)_databaseDidDeleteFromStreamNameCounts:()_DKKnowledgeStorageEventNotificationDelegate .cold.2()
{
  OUTLINED_FUNCTION_6();
  v1 = [(id)objc_opt_class() description];
  v2 = [NSNumber numberWithUnsignedInteger:v0];
  OUTLINED_FUNCTION_4_2();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v3, v4, "%{public}@: Deletion of %@ events is not triggering sync attempt because isSingleDevice=YES", v5, v6, v7, v8, v9);
}

- (void)knowledgeStorage:()_DKKnowledgeStorageEventNotificationDelegate didDeleteEventsWithStreamNameCounts:.cold.1()
{
  OUTLINED_FUNCTION_6();
  uint64_t v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_7(&dword_18ECEB000, v1, v2, "%{public}@: Delete with stream names: %@", v3, v4, v5, v6, v7);
}

@end