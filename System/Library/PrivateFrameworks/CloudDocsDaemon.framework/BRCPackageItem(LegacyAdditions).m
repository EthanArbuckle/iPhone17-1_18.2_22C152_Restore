@interface BRCPackageItem(LegacyAdditions)
@end

@implementation BRCPackageItem(LegacyAdditions)

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ignoring excluded package item at %@%@");
}

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] failed opening %@%@");
}

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] updating package snapshot at %@%@");
}

+ (void)_rescanDirectoryInPackage:()LegacyAdditions error:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpath.isPackageRoot || relpath.isInPackage%@", v2, v3, v4, v5, v6);
}

+ (void)updateSnapshotAtPath:()LegacyAdditions error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpath.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)changedAtRelpath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid type%@", v2, v3, v4, v5, v6);
}

- (void)changedAtRelpath:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no BRCPackageItem should be a Tombstone%@", v2, v3, v4, v5, v6);
}

+ (void)packageChangedAtRelativePath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpathInPackage.isInPackage%@", v2, v3, v4, v5, v6);
}

+ (void)packageChangedAtRelativePath:()LegacyAdditions .cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] package snapshot matches%@", v1, 0xCu);
}

+ (void)packageChangedAtRelativePath:()LegacyAdditions .cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpath.isInPackage || relpath.isPackageRoot%@", v2, v3, v4, v5, v6);
}

@end