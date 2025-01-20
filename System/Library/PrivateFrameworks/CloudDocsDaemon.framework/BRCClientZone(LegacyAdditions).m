@interface BRCClientZone(LegacyAdditions)
@end

@implementation BRCClientZone(LegacyAdditions)

- (void)_removeItemFromCZMProcessingIfNotAssociated:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Item finished CZM procesing and now is done %@%@");
}

- (void)_removeItemAndProcessForCrossZoneMove:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Not processing item which is already almost dead %@%@");
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync: Starting downloading all children under %@ due to changing shares%@");
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync: Starting downloading %@ due to changing shares%@");
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:()LegacyAdditions .cold.3(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(*(void *)a1 + 40);
  int v3 = 138412546;
  uint64_t v4 = v1;
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_1D353B000, v2, (os_log_type_t)0x90u, "[ERROR] Failed starting download for CZM - %@%@", (uint8_t *)&v3, 0x16u);
}

- (void)itemCrossZoneMoved:()LegacyAdditions withLookup:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [item.clientZone isEqualToClientZone:self]%@", v2, v3, v4, v5, v6);
}

- (void)itemCrossZoneMoved:()LegacyAdditions withLookup:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: parentItemID%@", v2, v3, v4, v5, v6);
}

- (void)reservedItemByParentID:()LegacyAdditions andLogicalName:db:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_CFURLIsPromiseName((__bridge CFStringRef)name)%@", v2, v3, v4, v5, v6);
}

- (void)faultByParentID:()LegacyAdditions andPhysicalName:db:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _CFURLIsPromiseName((__bridge CFStringRef)name)%@", v2, v3, v4, v5, v6);
}

@end