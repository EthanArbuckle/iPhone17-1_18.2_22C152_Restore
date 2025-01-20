@interface BRCSymlinkItem(LegacyAdditions)
@end

@implementation BRCSymlinkItem(LegacyAdditions)

- (void)readTargetFromRelativePathAndSyncUp:()LegacyAdditions .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] no change%@", (uint8_t *)&v2, 0xCu);
}

- (void)readTargetFromRelativePathAndSyncUp:()LegacyAdditions .cold.2(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] updating symlink target to %@%@", (uint8_t *)&v4, 0x16u);
}

@end