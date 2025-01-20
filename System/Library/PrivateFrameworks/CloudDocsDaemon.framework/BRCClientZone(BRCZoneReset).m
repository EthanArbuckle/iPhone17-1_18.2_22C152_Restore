@interface BRCClientZone(BRCZoneReset)
- (void)_cancelAllOperationsForReset;
@end

@implementation BRCClientZone(BRCZoneReset)

- (void)_reset:()BRCZoneReset completionHandler:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  v2 = [v1 mangledID];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[NOTIF] Can't reset %@ because its deactivated%@", v3, 0x16u);
}

- (void)_reset:()BRCZoneReset completionHandler:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: not implemented%@", v2, v3, v4, v5, v6);
}

- (void)_deleteRelevantPackageItemsWithDB:()BRCZoneReset error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] failed pruning client_pkg_items: %@%@", v4, v5, v6, v7, v8);
}

- (void)_performHardResetOnClientItemsAndWantsUnlink:()BRCZoneReset db:error:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] failed pruning client_document_access: %@%@", v4, v5, v6, v7, v8);
}

- (void)_performHardResetOnClientItemsAndWantsUnlink:()BRCZoneReset db:error:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] failed pruning client_items: %@%@", v4, v5, v6, v7, v8);
}

- (void)_performResetAndWantsUnlink:()BRCZoneReset clientTruthBlock:completionBlock:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isSharedZone%@", v2, v3, v4, v5, v6);
}

- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:()BRCZoneReset .cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┣%llx requesting coordinated deletions%@");
}

- (void)_cancelAllOperationsForReset
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] cancelling sync up operation %@%@", (void)v3, DWORD2(v3));
}

@end