@interface DPReportFileManager
@end

@implementation DPReportFileManager

void __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  v9 = +[_DPLog framework];
  v10 = v9;
  if (a2)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_1((uint64_t)v7, v10);
    }

    uint64_t v11 = *(void *)(*(void *)(a1 + 40) + 8);
    id v12 = v7;
    v10 = *(NSObject **)(v11 + 40);
    *(void *)(v11 + 40) = v12;
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_2(a1);
  }
}

void __38___DPReportFileManager_retireReports___block_invoke(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = +[_DPLog framework];
  id v7 = v6;
  if (a2)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __38___DPReportFileManager_retireReports___block_invoke_cold_1(a1, v7);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_2(a1);
  }
}

void __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "reportsNotYetSubmittedWithReply: %@", (uint8_t *)&v2, 0xCu);
}

void __46___DPReportFileManager_reportsNotYetSubmitted__block_invoke_cold_2(uint64_t a1)
{
  int v2 = objc_opt_class();
  uint64_t v3 = *(const char **)(a1 + 48);
  id v4 = v2;
  id v5 = NSStringFromSelector(v3);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_1_3(&dword_1DC55E000, v6, v7, "%@ : %@ : error %@", v8, v9, v10, v11, v12);
}

void __38___DPReportFileManager_retireReports___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_1DC55E000, a2, OS_LOG_TYPE_DEBUG, "retireReports: %@", (uint8_t *)&v3, 0xCu);
}

@end