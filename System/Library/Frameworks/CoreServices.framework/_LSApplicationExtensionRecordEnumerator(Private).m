@interface _LSApplicationExtensionRecordEnumerator(Private)
@end

@implementation _LSApplicationExtensionRecordEnumerator(Private)

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.1()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "Skipping plugin %llx during enumeration because it was filtered out", v2, v3, v4, v5, v6);
}

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.2()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "Skipping plugin %llx during enumeration because it is hidden by app protection", v2, v3, v4, v5, v6);
}

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.3()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "Not skipping plugin %llx during enumeration because ep allows hidden plugins", v2, v3, v4, v5, v6);
}

- (void)_evaluatePluginNoIO:()Private data:extensionPointID:context:.cold.4()
{
  OUTLINED_FUNCTION_0_12();
  OUTLINED_FUNCTION_0_2(&dword_182959000, v0, v1, "Skipping plugin %llx during enumeration because it is third-party", v2, v3, v4, v5, v6);
}

@end