@interface BRCAccountSession(DatabaseAdditions)
@end

@implementation BRCAccountSession(DatabaseAdditions)

- (void)_getFPFSMigrationStatus:()DatabaseAdditions withError:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: _clientState%@", (uint8_t *)&v2, 0xCu);
}

- (void)dumpFPFSMigrationStatusToFileHandle:()DatabaseAdditions tracker:includeNonMigratedItems:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx dumping FPFS migration status%@");
}

- (void)enumerateSharedToMeItemsWithBlock:()DatabaseAdditions error:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D353B000, a2, (os_log_type_t)0x90u, "[ERROR] Command is not supported for FPFS databases%@", (uint8_t *)&v2, 0xCu);
}

- (void)dumpDatabaseToFileHandle:()DatabaseAdditions zoneName:includeAllItems:verbose:tracker:error:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx dumping database%@");
}

@end