@interface BRCDirectoryItem(LegacyAdditions)
- (void)_markLostDirectoryAsAlmostDead;
@end

@implementation BRCDirectoryItem(LegacyAdditions)

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: there is still a fsroot item!%@", v2, v3, v4, v5, v6);
}

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: appLibrary.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)_markLostDirectoryAsAlmostDead
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isLost%@", v2, v3, v4, v5, v6);
}

- (void)markRemovedFromFilesystemForServerEdit:()LegacyAdditions .cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [*(id *)(a1 + 16) changeState];
  uint8_t v6 = [v5 changeToken];
  v7 = [v6 descriptionWithContext:0];
  OUTLINED_FUNCTION_3_0();
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Setting deletion change token to %@ because item contains a dir faults%@", v8, 0x16u);
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] item isn't a directory anymore%@", v1, 0xCu);
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] item matches disk%@", v1, 0xCu);
}

- (void)startDownloadInTask:()LegacyAdditions options:etagIfLoser:stageFileName:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: a task tracker is required to download a directory%@", v2, v3, v4, v5, v6);
}

- (void)startDownloadInTask:()LegacyAdditions options:etagIfLoser:stageFileName:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !stageFileName%@", v2, v3, v4, v5, v6);
}

@end