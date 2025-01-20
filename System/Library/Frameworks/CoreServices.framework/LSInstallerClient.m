@interface LSInstallerClient
@end

@implementation LSInstallerClient

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke()
{
  v0 = _LSDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_cold_1();
  }
}

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_2()
{
  v0 = _LSDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG)) {
    __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_2_cold_1();
  }
}

void __53___LSInstallerClient_syncServerInstallerProxyForShim__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = _LSInstallLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    __53___LSInstallerClient_syncServerInstallerProxyForShim__block_invoke_cold_1((uint64_t)v2, v3);
  }
}

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_7(&dword_182959000, v0, v1, "Connection interrupted to installationCallbackInterface", v2, v3, v4, v5, v6);
}

void __51___LSInstallerClient_makeServerInstallerConnection__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_7(&dword_182959000, v0, v1, "Connection invalidated to installationCallbackInterface", v2, v3, v4, v5, v6);
}

void __53___LSInstallerClient_syncServerInstallerProxyForShim__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_182959000, a2, OS_LOG_TYPE_ERROR, "error on sync server connection for install shimming: %@", (uint8_t *)&v2, 0xCu);
}

@end