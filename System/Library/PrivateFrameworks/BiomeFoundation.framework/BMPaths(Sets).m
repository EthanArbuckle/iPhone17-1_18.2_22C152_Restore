@interface BMPaths(Sets)
+ (void)legacySetsRootDirectoryURL;
@end

@implementation BMPaths(Sets)

+ (void)legacySetsRootDirectoryURL
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1B30A0000, a2, OS_LOG_TYPE_ERROR, "Failed to resolve container for legacySetsRootDirectoryURL: %@", (uint8_t *)&v2, 0xCu);
}

@end