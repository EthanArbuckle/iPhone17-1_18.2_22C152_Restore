@interface BRCDiskSpaceReclaimer(LegacyAdditions)
- (void)_requestPurgeSpace;
@end

@implementation BRCDiskSpaceReclaimer(LegacyAdditions)

- (void)_requestPurgeSpace
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl(&dword_1D353B000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Already have an outstanding purge request%@", (uint8_t *)&v2, 0xCu);
}

@end