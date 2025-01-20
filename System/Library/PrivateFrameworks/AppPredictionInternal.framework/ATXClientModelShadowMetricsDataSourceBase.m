@interface ATXClientModelShadowMetricsDataSourceBase
@end

@implementation ATXClientModelShadowMetricsDataSourceBase

uint64_t __84___ATXClientModelShadowMetricsDataSourceBase_predictionCachePublisherFromStartDate___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 eventBody];
  v4 = [v3 clientModelId];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  return v5;
}

uint64_t __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a3;
  v7 = [v5 _eventBodyDateForEvent:a2];
  v8 = [*(id *)(a1 + 32) _eventBodyDateForEvent:v6];

  uint64_t v9 = [v7 compare:v8];
  return v9;
}

void __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 error];

  if (v3)
  {
    v4 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_2_cold_1(v2, v4);
    }
  }
}

BOOL __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_67(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = [*(id *)(a1 + 32) _eventBodyDateForEvent:v3];
  uint64_t v5 = [v4 laterDate:*(void *)(a1 + 40)];

  if (v5 != v4)
  {
    id v6 = [v3 eventBody];
    int v7 = [v6 conformsToProtocol:&unk_1F2892128];

    if (v7)
    {
      uint64_t v8 = *(void *)(a1 + 48);
LABEL_6:
      v11 = [v3 eventBody];
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v11);

      goto LABEL_10;
    }
    uint64_t v9 = [v3 eventBody];
    objc_opt_class();
    int isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      uint64_t v8 = *(void *)(a1 + 56);
      goto LABEL_6;
    }
    v12 = __atxlog_handle_metrics();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_67_cold_1(v3, v12);
    }
  }
LABEL_10:

  return v5 != v4;
}

void __92___ATXClientModelShadowMetricsDataSourceBase_enumeratePredictionsInCache_ofType_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 executableType] == *(void *)(a1 + 40)) {
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 error];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_ERROR, "ATXClientModelShadowMetricsDataSourceBase: Biome query completed with error %@", (uint8_t *)&v4, 0xCu);
}

void __144___ATXClientModelShadowMetricsDataSourceBase_replayHistoryWithShadowEventPublisher_startDate_endDate_shadowEventHandler_predictionCacheHandler___block_invoke_67_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  id v3 = [a1 eventBody];
  int v4 = 138412290;
  uint64_t v5 = objc_opt_class();
  _os_log_fault_impl(&dword_1D0FA3000, a2, OS_LOG_TYPE_FAULT, "ATXClientModelShadowMetricsDataSourceBase: unexpected event of class %@", (uint8_t *)&v4, 0xCu);
}

@end