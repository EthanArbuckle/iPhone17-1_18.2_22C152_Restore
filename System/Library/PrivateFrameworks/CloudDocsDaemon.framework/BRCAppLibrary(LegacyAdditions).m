@interface BRCAppLibrary(LegacyAdditions)
- (NSNumber)deepScanStamp;
- (void)cancelFileCoordinators;
@end

@implementation BRCAppLibrary(LegacyAdditions)

- (NSNumber)deepScanStamp
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  deepScanStamp = self->_deepScanStamp;
  return deepScanStamp;
}

- (void)markChildrenLostForItemID:()LegacyAdditions inZone:fileID:startingFromRow:hasMoreWork:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Shared zone root item %@ should not exist in client truth%@", v1, 0x16u);
}

- (void)markChildrenLostForItemID:()LegacyAdditions inZone:fileID:startingFromRow:hasMoreWork:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: zone.dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)cancelFileCoordinators
{
  OUTLINED_FUNCTION_12_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] cancelling file coordination requests %@%@");
}

- (void)coordinatorForItem:()LegacyAdditions forRead:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] There's already a pending coordinated I/O for %@, not really scheduling it%@");
}

- (void)fsrootDidMoveToPath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 appLibraryID];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] %@: app library fs root was removed%@", v3, 0x16u);
}

- (void)fsrootDidMoveToPath:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)didFindLostItem:()LegacyAdditions oldAppLibrary:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Lost directory with dead children found, kick syncUp%@", v1, 0xCu);
}

- (void)didFindLostItem:()LegacyAdditions oldAppLibrary:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: oldAppLibrary.state & BRCAppLibraryStateNeedsLost%@", v2, v3, v4, v5, v6);
}

- (void)aliasByUnsaltedBookmarkData:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: unsaltedBookmarkData%@", v2, v3, v4, v5, v6);
}

- (void)removeClientUsingUbiquity:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Last ubiquity client exited, no longer greedy (container: %@)%@");
}

@end