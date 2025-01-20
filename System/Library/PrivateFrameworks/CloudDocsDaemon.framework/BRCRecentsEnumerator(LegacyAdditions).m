@interface BRCRecentsEnumerator(LegacyAdditions)
@end

@implementation BRCRecentsEnumerator(LegacyAdditions)

- (void)dropItemWithFileObjectID:()LegacyAdditions notifRank:itemIsLive:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] dropping item from recents index %@%@");
}

- (void)dropItemWithFileObjectID:()LegacyAdditions notifRank:itemIsLive:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] not dropping item, it is still live: %@%@");
}

@end