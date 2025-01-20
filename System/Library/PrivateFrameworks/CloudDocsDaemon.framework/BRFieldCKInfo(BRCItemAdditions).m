@interface BRFieldCKInfo(BRCItemAdditions)
- (void)revertEtagsForOldZoneTombstone;
@end

@implementation BRFieldCKInfo(BRCItemAdditions)

- (void)revertEtagsForOldZoneTombstone
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v5 = [a1 etagBeforeCrossZoneMove];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Reverting etag to pre-czm tag %@%@", (uint8_t *)&v6, 0x16u);
}

@end