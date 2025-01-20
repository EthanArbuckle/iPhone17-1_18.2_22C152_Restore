@interface BRCURLToItemLookup(BRCFSReader)
- (void)handleReservedPathMatchesIfNeeded;
- (void)matchLookupItemsWithDisk;
@end

@implementation BRCURLToItemLookup(BRCFSReader)

- (void)markPathMatchLostIfLocationDoesntMatch:()BRCFSReader .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] The item path doesn't exist%@", v2, v3, v4, v5, v6);
}

- (void)handleReservedPathMatchesIfNeeded
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Suspending apply of shared item until we complete initial scan %@%@");
}

- (void)matchLookupItemsWithDisk
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Considering the live item%@", v2, v3, v4, v5, v6);
}

@end