@interface BRCLocalVersion(LegacyAdditions)
@end

@implementation BRCLocalVersion(LegacyAdditions)

- (void)initFromResultSet:()LegacyAdditions pos:.cold.1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't unarchive CKRecord: %@%@", buf, 0x16u);
}

- (void)updateFromFSAtPath:()LegacyAdditions filenameOverride:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: path.isPackageRoot%@", v2, v3, v4, v5, v6);
}

@end