@interface BRCPackageItem(DatabaseMethods)
@end

@implementation BRCPackageItem(DatabaseMethods)

- (void)saveToDBWithSession:()DatabaseMethods .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] saved item %@ to DB%@");
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: saving package items should really always work%@", v2, v3, v4, v5, v6);
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: doInsert != nil%@", v2, v3, v4, v5, v6);
}

- (void)saveToDBWithSession:()DatabaseMethods .cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: should never attempt to save tombstones to db%@", v2, v3, v4, v5, v6);
}

@end