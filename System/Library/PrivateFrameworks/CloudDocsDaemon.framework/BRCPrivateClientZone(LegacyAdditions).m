@interface BRCPrivateClientZone(LegacyAdditions)
@end

@implementation BRCPrivateClientZone(LegacyAdditions)

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] deleting newest alias at %@%@");
}

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] oldest alias still resolves at %@%@");
}

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] oldest alias doesn't resolve, moving to newest path at %@%@");
}

- (void)resolveClashOfAlias:()LegacyAdditions atPath:withAlias:atPath:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] silently deleting newer item %@%@");
}

@end