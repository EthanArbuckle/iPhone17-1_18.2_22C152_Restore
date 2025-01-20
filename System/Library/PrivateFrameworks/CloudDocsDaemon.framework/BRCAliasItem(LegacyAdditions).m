@interface BRCAliasItem(LegacyAdditions)
@end

@implementation BRCAliasItem(LegacyAdditions)

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item matches disk%@", v2, v3, v4, v5, v6);
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item isn't an alias anymore%@", v2, v3, v4, v5, v6);
}

- (void)learnTarget:()LegacyAdditions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: self.appLibrary != item.appLibrary || item.isSharedToMe%@", v1, 0xCu);
}

- (void)updateOnDiskWithAliasTarget:()LegacyAdditions forServerEdit:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Kept the path of the newest alias for oldest item, updating fileID and mark lost%@", v2, v3, v4, v5, v6);
}

- (void)updateOnDiskWithAliasTarget:()LegacyAdditions forServerEdit:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] clash path doesn't seem to exist anymore, mark the item lost%@", v2, v3, v4, v5, v6);
}

@end