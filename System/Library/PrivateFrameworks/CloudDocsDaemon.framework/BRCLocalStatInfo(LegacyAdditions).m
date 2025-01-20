@interface BRCLocalStatInfo(LegacyAdditions)
- (void)_markAlmostDead;
- (void)_markFound;
@end

@implementation BRCLocalStatInfo(LegacyAdditions)

- (void)_markAlmostDead
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _state == BRC_ITEM_STATE_LOST || _state == BRC_ITEM_STATE_LOST_ZOMBIE%@", v2, v3, v4, v5, v6);
}

- (void)_markFound
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDirectory(_type)%@", v2, v3, v4, v5, v6);
}

- (void)_markLostAddingBackoffWithMode:()LegacyAdditions appLibrary:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lostStamp%@", v2, v3, v4, v5, v6);
}

+ (void)_finderTagsFromRelativePath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 componentsJoinedByString:@", "];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] read tags: [%@]%@", v3, 0x16u);
}

+ (void)_finderTagsFromRelativePath:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] failed to fetch tags: %@%@");
}

- (void)_updateMetadataFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] dropping tags%@", v2, v3, v4, v5, v6);
}

- (void)updateFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: path.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)initWithRelativePath:()LegacyAdditions itemID:parentGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: nobody should scan an item from a fault%@", v2, v3, v4, v5, v6);
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: BRCItemTypeIsDocumentFault(_type)%@", v2, v3, v4, v5, v6);
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ was a fault, is now a finder bookmark%@");
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _type == BRC_ITEM_TYPE_FINDER_BOOKMARK_FAULT%@", v2, v3, v4, v5, v6);
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] %@ was a fault, is now a document%@");
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _type == BRC_ITEM_TYPE_DOC_FAULT%@", v2, v3, v4, v5, v6);
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: path.isDocument || path.isFinderAlias%@", v2, v3, v4, v5, v6);
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions itemID:parentGlobalID:isPackageFault:readonlyShareChild:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _documentID.unsignedLongLongValue == path.documentID%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsType:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![_physicalName br_isSideFaultName]%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsType:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [_physicalName br_isSideFaultName]%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsType:()LegacyAdditions .cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !BRCItemTypeIsDirectory(_type)%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsType:()LegacyAdditions .cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: (_state == BRC_ITEM_STATE_RESERVED && !_fileID && !_generationID) || ((_state == BRC_ITEM_STATE_LIVE || _state == BRC_ITEM_STATE_LOST || _state == BRC_ITEM_STATE_LOST_ZOMBIE) && _fileID && _generationID)%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsType:()LegacyAdditions .cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _stagedGenerationID%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsType:()LegacyAdditions .cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _stagedFileID%@", v2, v3, v4, v5, v6);
}

- (void)_markLiveFromStageAsFault:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: unknown type%@", v2, v3, v4, v5, v6);
}

- (void)_generatedBouncedLogicalFilenameWithBounceNumber:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: bounceNumber >= 2%@", v2, v3, v4, v5, v6);
}

- (void)_generatedBouncedLogicalFilenameWithBounceNumber:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _type != BRC_ITEM_TYPE_ALIAS%@", v2, v3, v4, v5, v6);
}

@end