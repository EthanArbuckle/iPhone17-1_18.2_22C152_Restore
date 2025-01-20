@interface BRCFSWriter(Bouncing)
@end

@implementation BRCFSWriter(Bouncing)

+ (void)_isPathMatchIdle:()Bouncing .cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Forcing idle for item we need to download for CZM processing %@%@", (void)v3, DWORD2(v3));
}

+ (void)_isPathMatchIdle:()Bouncing .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Forcing idle for resuming document %@%@");
}

+ (void)_isPathMatchIdle:()Bouncing .cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Forcing idle for item which is paused from sync %@%@");
}

- (void)_generateGentlePhysicalBounceNameForPathMatch:()Bouncing dirfd:existingSourceLogicalName:lastBounceNo:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Item bounced back to the same filename%@", v2, v3, v4, v5, v6);
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Very weird, we have missing fsevents on multiple levels of the hierarchy, lets rescan everything%@", v2, v3, v4, v5, v6);
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Marking parent item %@ as lost and clearing the generation ID so we are sure to scan it%@");
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] missing item outside of the scope.  Faking fsevent%@", v2, v3, v4, v5, v6);
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Cannot rename to %@ because it is unprocessed yet%@");
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Cannot rename to %@ because it's a non idle fault%@");
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.6(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  int v6 = 134218242;
  uint64_t v7 = [a1 rank];
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v5, "[DEBUG] Apply Changes[%lld]: postponing rank (clashes with an unprocessed item)%@", (uint8_t *)&v6);
}

- (void)bouncePathMatch:()Bouncing toApplyServerItem:clientZone:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] On disk item %@ can't sync so treating it as idle%@");
}

@end