@interface DDDetectionController(WebKitBackEnd)
@end

@implementation DDDetectionController(WebKitBackEnd)

- (void)_resultForAnchor:()WebKitBackEnd forFrame:context:.cold.1(void *a1, uint64_t a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v4 = [a1 scheme];
  int v6 = 134218498;
  v7 = a1;
  OUTLINED_FUNCTION_0_2();
  __int16 v8 = v5;
  uint64_t v9 = a2;
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unknown result for URL %p (%@), for frame %@", (uint8_t *)&v6, 0x20u);
}

- (void)_resultForIdentifier:()WebKitBackEnd withResults:context:.cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_resultForIdentifier:()WebKitBackEnd withResults:context:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_resultForIdentifier:()WebKitBackEnd withResults:context:.cold.3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_resultForURL:()WebKitBackEnd withResults:context:.cold.1(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [a1 scheme];
  int v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong URL %p (%@), missing //", (uint8_t *)&v3, 0x16u);
}

- (void)_resultForURL:()WebKitBackEnd withResults:context:.cold.2(void *a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  v2 = [a1 scheme];
  int v3 = 134218242;
  v4 = a1;
  OUTLINED_FUNCTION_0_2();
  _os_log_error_impl(&dword_1A1709000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Wrong scheme for URL %p (%@)", (uint8_t *)&v3, 0x16u);
}

@end