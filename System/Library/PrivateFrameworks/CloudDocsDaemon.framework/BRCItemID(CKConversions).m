@interface BRCItemID(CKConversions)
@end

@implementation BRCItemID(CKConversions)

+ (void)structureRecordPrefixForItemType:()CKConversions targetZoneShared:.cold.1(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_fault_impl(&dword_1D353B000, log, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: unknown item type %d%@", (uint8_t *)v3, 0x12u);
}

- (void)structureRecordIDForItemType:()CKConversions zone:aliasTargetZoneIsShared:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid type%@", v2, v3, v4, v5, v6);
}

- (void)structureRecordIDForItemType:()CKConversions zone:aliasTargetZoneIsShared:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: appLibrary%@", v2, v3, v4, v5, v6);
}

@end