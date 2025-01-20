@interface BRCAccountSession(ItemFetching)
@end

@implementation BRCAccountSession(ItemFetching)

- (void)newLocalItemFromPQLResultSet:()ItemFetching db:error:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_0(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unknown item type %d%@");
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't compute a BRCLocalItem for a nil BRFileObjectID%@", v2, v3, v4, v5, v6);
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.2()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_15_0(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Unrecognized item type %d%@");
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: fileobjectID has an invalid type%@", v2, v3, v4, v5, v6);
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: There is no local item for BRFileObjectIDTypeRootContainer%@", v2, v3, v4, v5, v6);
}

- (void)itemByFileObjectID:()ItemFetching db:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: appLibrary.includesDataScope%@", v2, v3, v4, v5, v6);
}

- (void)serverAliasItemForSharedItem:()ItemFetching inZone:db:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: item.serverZone.isSharedZone%@", v2, v3, v4, v5, v6);
}

- (void)enumerateContainersWithDB:()ItemFetching handler:.cold.1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 134218242;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx enumerating containers%@", (uint8_t *)&v4, 0x16u);
}

@end