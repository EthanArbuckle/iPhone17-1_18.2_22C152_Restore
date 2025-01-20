@interface BRCFileProvidingRequestOperation(LegacyAdditions)
- (void)_provideURL;
@end

@implementation BRCFileProvidingRequestOperation(LegacyAdditions)

- (void)_provideDirectoryRecursively:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _recursiveList == nil%@", v2, v3, v4, v5, v6);
}

- (void)_provideFlatDirectoryStructure:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] can't get a list op, granting the read for %@%@");
}

- (void)_provideFlatDirectoryStructure:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _listOp == nil%@", v2, v3, v4, v5, v6);
}

- (void)_provideURL
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _directoryItem == nil%@", v2, v3, v4, v5, v6);
}

@end