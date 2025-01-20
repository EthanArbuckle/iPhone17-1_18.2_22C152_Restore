@interface HKCurrentActivitySummaryQuery
@end

@implementation HKCurrentActivitySummaryQuery

void __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke(uint64_t a1)
{
  v2 = _Block_copy(*(const void **)(*(void *)(a1 + 32) + 152));
  v3 = [*(id *)(a1 + 40) lastObject];
  v4 = v3;
  if (v2)
  {
    v5 = *(void **)(a1 + 32);
    uint64_t v6 = *(void *)(a1 + 48);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2;
    v9[3] = &unk_1E58BD808;
    id v10 = v3;
    id v7 = v2;
    uint64_t v11 = *(void *)(a1 + 32);
    id v12 = v7;
    objc_msgSend(v5, "queue_dispatchToClientForUUID:shouldDeactivate:block:", v6, 0, v9);
  }
  else
  {
    _HKInitializeLogging();
    v8 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG)) {
      __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_cold_1((uint64_t)v4, v8);
    }
  }
}

uint64_t __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2(uint64_t a1)
{
  _HKInitializeLogging();
  v2 = HKLogQuery;
  if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_DEBUG)) {
    __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2_cold_1(a1, v2);
  }
  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t __53___HKCurrentActivitySummaryQuery_queue_deliverError___block_invoke(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void))(a1[6] + 16))(a1[6], a1[4], 0, a1[5]);
}

void __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_19C023000, a2, OS_LOG_TYPE_DEBUG, "No update handler set. newActivitySummary: %@", (uint8_t *)&v2, 0xCu);
}

void __76___HKCurrentActivitySummaryQuery_client_deliverActivitySummaries_queryUUID___block_invoke_2_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_19C023000, a2, OS_LOG_TYPE_DEBUG, "Calling update handler with activitySummary: %@", (uint8_t *)&v3, 0xCu);
}

@end