@interface DASWidgetRefreshScheduler
@end

@implementation DASWidgetRefreshScheduler

uint64_t __45___DASWidgetRefreshScheduler_sharedScheduler__block_invoke()
{
  sharedScheduler_widgetScheduler = objc_opt_new();

  return MEMORY[0x1F41817F8]();
}

id __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2_cold_1();
    }
  }
}

id __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = [*(id *)(a1 + 32) log];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2_cold_1();
    }
  }
}

void __40___DASWidgetRefreshScheduler_setBudget___block_invoke(uint64_t a1)
{
  id v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v2 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "dailyMaxBudget"));
  [v7 setObject:v2 forKeyedSubscript:@"system-overall"];
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "widgetMaxBudget"));
  [v7 setObject:v3 forKeyedSubscript:@"individual"];
  id v4 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "systemAddedWidgetMaxBudget"));
  [v7 setObject:v4 forKeyedSubscript:@"system-addedBySystem"];
  v5 = [*(id *)(a1 + 40) context];
  v6 = [MEMORY[0x1E4F5B6D8] keyPathWithKey:@"/dasd/widgetBudget"];
  [v5 setObject:v7 forKeyedSubscript:v6];
}

void __61___DASWidgetRefreshScheduler_setOverridesForWidgetBudgetIDs___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1B578B000, v2, OS_LOG_TYPE_DEFAULT, "Setting overrides widget refresh entries: %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  v6 = [v4 context];
  id v7 = [MEMORY[0x1E4F5B6D8] keyPathWithKey:@"/dasd/widgetOverride"];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void __60___DASWidgetRefreshScheduler_setSystemAddedWidgetBudgetIDs___block_invoke(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v3 = *(void *)(a1 + 40);
    int v8 = 138412290;
    uint64_t v9 = v3;
    _os_log_impl(&dword_1B578B000, v2, OS_LOG_TYPE_DEFAULT, "Setting system added widget refresh entries: %@", (uint8_t *)&v8, 0xCu);
  }

  id v4 = *(void **)(a1 + 32);
  if (*(void *)(a1 + 40)) {
    uint64_t v5 = *(void *)(a1 + 40);
  }
  else {
    uint64_t v5 = MEMORY[0x1E4F1CBF0];
  }
  v6 = [v4 context];
  id v7 = [MEMORY[0x1E4F5B6D8] keyPathWithKey:@"/dasd/widgetSystemAdded"];
  [v6 setObject:v5 forKeyedSubscript:v7];
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_308(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_308_cold_1();
  }
}

void __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void **)(a1 + 40);
  if (v5 || (uint64_t v5 = *(void **)(a1 + 48)) != 0) {
    v6 = v5;
  }
  else {
    v6 = &stru_1F0E63E70;
  }
  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
}

void __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_325(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_308_cold_1();
  }
}

void __72___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_308_cold_1();
  }
}

void __87___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_refreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(v3, v4);
  }

  uint64_t v5 = *(void *)(a1 + 48);
  v6 = [*(id *)(a1 + 40) widgetIdentifier];
  (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
}

void __91___DASWidgetRefreshScheduler_createRefreshActivityWithWidgetParameters_withRefreshHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) log];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(v3, v4);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __48___DASWidgetRefreshScheduler_recordWidgetViews___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B578B000, v0, OS_LOG_TYPE_ERROR, "Error in saving widget views entries: %@", v1, 0xCu);
}

void __52___DASWidgetRefreshScheduler_recordWidgetRefreshes___block_invoke_2_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1B578B000, v0, OS_LOG_TYPE_ERROR, "Error in saving widget refresh entries: %@", v1, 0xCu);
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B578B000, v0, v1, "Start handler called on Widget Refresh activity %@", v2);
}

void __138___DASWidgetRefreshScheduler_createRefreshActivityForWidgetBudgetID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_308_cold_1()
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B578B000, v0, v1, "Suspend handler called on Widget Refresh activity %@", v2);
}

void __188___DASWidgetRefreshScheduler_createRefreshActivityWithRateLimitConfigurationName_forWidgetBudgetID_withRemoteDeviceID_containingAppID_refreshAfter_refreshBefore_widgetInfo_refreshHandler___block_invoke_cold_1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [a1 debugDescription];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1B578B000, a2, v4, "Start handler called on Widget Refresh activity %@", v5);
}

@end