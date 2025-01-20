@interface BRCFSDownloader(LegacyAdditions)
@end

@implementation BRCFSDownloader(LegacyAdditions)

- (void)applyLosersToItem:()LegacyAdditions serverItem:atURL:applySchedulerState:addedLosers:removedLosers:.cold.1()
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_2_1();
  uint64_t v3 = v0;
  _os_log_debug_impl(&dword_1D353B000, v1, OS_LOG_TYPE_DEBUG, "[DEBUG] live losers: %@%@", v2, 0x16u);
}

- (void)applyLosersToItem:()LegacyAdditions serverItem:atURL:applySchedulerState:addedLosers:removedLosers:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: removedLosers%@", v2, v3, v4, v5, v6);
}

- (void)applyLosersToItem:()LegacyAdditions serverItem:atURL:applySchedulerState:addedLosers:removedLosers:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: addedLosers%@", v2, v3, v4, v5, v6);
}

- (void)_sendThumbnailsBatch:()LegacyAdditions sizeHint:maxRecordsCount:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", v2, v3, v4, v5, v6);
}

- (void)scheduleThumbnailDownloadForItem:()LegacyAdditions serverItem:applySchedulerState:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] no thumbnail, cancelling thumbnail download%@", v1, 0xCu);
}

@end