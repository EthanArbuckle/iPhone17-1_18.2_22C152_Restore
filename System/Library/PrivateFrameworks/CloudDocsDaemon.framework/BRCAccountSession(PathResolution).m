@interface BRCAccountSession(PathResolution)
@end

@implementation BRCAccountSession(PathResolution)

- (void)_resolvePathInMobileDocsRoot:()PathResolution appLibrary:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_1D353B000, a2, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: pathRelativeToRoot%@", (uint8_t *)&v2, 0xCu);
}

@end