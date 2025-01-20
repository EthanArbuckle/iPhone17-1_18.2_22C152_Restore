@interface LSResetServer
@end

@implementation LSResetServer

void ___LSResetServer_block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _LSDatabaseGetLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    ___LSResetServer_block_invoke_cold_1();
  }
}

void ___LSResetServer_block_invoke_123(uint64_t a1, char a2, void *a3)
{
  id v4 = a3;
  if ((a2 & 1) == 0)
  {
    v5 = _LSDatabaseGetLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      ___LSResetServer_block_invoke_123_cold_1();
    }
  }
}

void ___LSResetServer_block_invoke_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "XPC error resetting server: %{public}@", v2, v3, v4, v5, v6);
}

void ___LSResetServer_block_invoke_123_cold_1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Error resetting server: %{public}@", v2, v3, v4, v5, v6);
}

@end