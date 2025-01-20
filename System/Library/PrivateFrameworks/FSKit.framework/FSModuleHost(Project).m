@interface FSModuleHost(Project)
- (void)loadEnabledList;
- (void)loadModulesFromEKit;
- (void)loadProbeOrderList;
- (void)saveEnabledList;
- (void)saveProbeOrderList;
@end

@implementation FSModuleHost(Project)

- (void)loadModulesFromEKit
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_24DDB2000, v0, v1, "ExtensionKit unable to give module query.", v2, v3, v4, v5, v6);
}

- (void)loadProbeOrderList
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_24DDB2000, v0, v1, "Error reading probe order: %@", v2, v3, v4, v5, v6);
}

- (void)saveProbeOrderList
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_24DDB2000, v0, v1, "Error writing probe order to %@", v2, v3, v4, v5, v6);
}

- (void)loadEnabledList
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_8(&dword_24DDB2000, v0, v1, "Error reading enabled list: %@", v2, v3, v4, v5, v6);
}

- (void)saveEnabledList
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_24DDB2000, v1, OS_LOG_TYPE_ERROR, "Error writing enabled modules to %@, error %@", v2, 0x16u);
}

@end