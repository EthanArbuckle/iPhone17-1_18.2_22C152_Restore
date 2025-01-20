@interface BRCLocalItem(CKConversions)
- (void)baseStructureRecord;
- (void)sideCarRecordID;
- (void)structureRecordID;
@end

@implementation BRCLocalItem(CKConversions)

- (void)baseStructureRecord
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't get the structure record of a shared-top-level document without the zone of the alias record%@", v2, v3, v4, v5, v6);
}

- (void)structureRecordBeingDeadInServerTruth:()CKConversions stageID:shouldPCSChainStatus:saltGetter:childBasehashSaltGetter:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Error creating record %@%@");
}

- (void)sideCarRecordID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Asked for side car recordID on an item that doesn't have side cars%@", v2, v3, v4, v5, v6);
}

- (void)structureRecordID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't get the structure record without a zone%@", v2, v3, v4, v5, v6);
}

@end