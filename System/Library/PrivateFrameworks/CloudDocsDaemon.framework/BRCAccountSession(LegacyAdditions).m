@interface BRCAccountSession(LegacyAdditions)
- (BRCFSReader)fsReader;
- (BRCFSWriter)fsWriter;
@end

@implementation BRCAccountSession(LegacyAdditions)

- (BRCFSReader)fsReader
{
  return self->_fsReader;
}

- (BRCFSWriter)fsWriter
{
  return self->_fsWriter;
}

- (void)computeDocumentEvictableSizesForLowTime:()LegacyAdditions medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lowTime <= medTime <= highTime%@", v2, v3, v4, v5, v6);
}

- (void)fsEventsMonitorForSyncedFolderType:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: dictionary%@", v2, v3, v4, v5, v6);
}

- (void)hasFSEventsMonitorForSyncedFolderType:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _fsEventsMonitors%@", v2, v3, v4, v5, v6);
}

- (void)setFSEventsMonitor:()LegacyAdditions forSyncedFolderType:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !dictionary[@(folderType)]%@", v2, v3, v4, v5, v6);
}

- (void)removeFSEventsMonitorForSyncedFolderType:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: dictionary[@(folderType)]%@", v2, v3, v4, v5, v6);
}

- (void)createRootForSyncedFolderType:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![self hasRootForSyncedFolderType:folderType]%@", v2, v3, v4, v5, v6);
}

- (void)hasRootForSyncedFolderType:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _rootsByFolderType%@", v2, v3, v4, v5, v6);
}

- (void)applySyncPolicy:()LegacyAdditions forSyncedFolderType:isInitialCreation:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Cannot disable sync for BRCSyncedFolderTypeDefault%@", v2, v3, v4, v5, v6);
}

- (void)applySyncPolicy:()LegacyAdditions forSyncedFolderType:isInitialCreation:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: syncPolicy == BRCSyncedFolderPolicyEnabled || syncPolicy == BRCSyncedFolderPolicyDisabled%@", v2, v3, v4, v5, v6);
}

- (void)enableSyncforSyncedFolderType:()LegacyAdditions isInitialCreation:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Unable to add an FSEvents Monitor on '%@'%@", v1, 0x16u);
}

- (void)enableSyncforSyncedFolderType:()LegacyAdditions isInitialCreation:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Bad folder type%@", v2, v3, v4, v5, v6);
}

- (void)_recreateSymlinkIfNecessaryForDocumentsPath:()LegacyAdditions folderName:destinationPath:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Made symlink live for %@%@", v1, 0x16u);
}

- (void)availableDiskSpaceUsingCache:()LegacyAdditions schedulingPendingDiskItemsIfNeeded:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] detected %@ of free space, scheduling pending-disk downloads%@", buf, 0x16u);
}

@end