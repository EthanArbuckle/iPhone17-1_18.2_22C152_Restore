@interface BMBiomeXPCSchedulerInner
@end

@implementation BMBiomeXPCSchedulerInner

void __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  v10 = __biome_log_for_category();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG);
  if (v8 && v9)
  {
    if (v11)
    {
      int v15 = 138412802;
      id v16 = v7;
      __int16 v17 = 2112;
      id v18 = v9;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_debug_impl(&dword_18E67D000, v10, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler received callback from subscription %@, publishing event %@ for stream %@", (uint8_t *)&v15, 0x20u);
    }

    v12 = (void *)MEMORY[0x1E4F1C9C8];
    [v9 timestamp];
    v13 = objc_msgSend(v12, "dateWithTimeIntervalSinceReferenceDate:");
    [v7 setInitialBookmarkTimestamp:v13];

    [*(id *)(a1 + 32) switchToPublisherWithStreamIdentifier:v8 storeEvent:v9];
  }
  else
  {
    if (v11) {
      __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke_cold_1();
    }

    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    [WeakRetained switchToUpdatedPublisher];
  }
}

uint64_t __42___BMBiomeXPCSchedulerInner_receiveInput___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) receiveInput:*(void *)(a1 + 40)];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = result;
  return result;
}

void __43___BMBiomeXPCSchedulerInner_requestDemand___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_7();
  _os_log_debug_impl(&dword_18E67D000, v0, OS_LOG_TYPE_DEBUG, "BMBiomeScheduler received callback from subscription %@, reading bookmark and subscribing to DSL graph publisher", v1, 0xCu);
}

@end