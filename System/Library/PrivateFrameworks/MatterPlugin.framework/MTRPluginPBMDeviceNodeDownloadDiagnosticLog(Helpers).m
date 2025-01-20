@interface MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers)
@end

@implementation MTRPluginPBMDeviceNodeDownloadDiagnosticLog(Helpers)

+ (void)urlFromResponsePayload:()Helpers error:.cold.1(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to convert response payload into data format", (uint8_t *)&v1, 0xCu);
}

+ (void)urlFromResponsePayload:()Helpers error:.cold.2(uint64_t a1)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to create diagnostic log directory", (uint8_t *)&v1, 0xCu);
}

+ (void)urlFromResponsePayload:()Helpers error:.cold.3()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "%@ Failed to create diagnostic log file %@", v0, 0x16u);
}

+ (void)urlFromResponsePayload:()Helpers error:.cold.4()
{
  uint64_t v1 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Could not create directory path %@ - error %@", v0, 0x16u);
}

+ (void)urlFromResponsePayload:()Helpers error:.cold.5(uint64_t a1, uint64_t a2)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  v4[0] = 67109634;
  v4[1] = getuid();
  __int16 v5 = 2114;
  uint64_t v6 = a1;
  __int16 v7 = 2114;
  uint64_t v8 = a2;
  _os_log_error_impl(&dword_2558FC000, &_os_log_internal, OS_LOG_TYPE_ERROR, "Failed to create daemon cache directory for user %d at %{public}@: %{public}@", (uint8_t *)v4, 0x1Cu);
}

@end