@interface UTTypeRecord(IconServices)
@end

@implementation UTTypeRecord(IconServices)

- (void)iconResourceBundleURLWithContext:()IconServices tableID:unitID:unitBytes:.cold.1(uint64_t a1, unsigned int *a2, os_log_t log)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl(&dword_182959000, log, OS_LOG_TYPE_DEBUG, "Cannot generate libraryURL for app %@ because it has no libraryPath path stored (%llx)", (uint8_t *)&v4, 0x16u);
}

@end