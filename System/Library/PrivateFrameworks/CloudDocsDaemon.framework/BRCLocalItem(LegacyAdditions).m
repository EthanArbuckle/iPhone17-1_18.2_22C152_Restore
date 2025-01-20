@interface BRCLocalItem(LegacyAdditions)
- (void)clearFromStage;
- (void)fixupStagedItemAtStartup;
- (void)markReserved;
@end

@implementation BRCLocalItem(LegacyAdditions)

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Unable to refresh xattrs from FS due to error (%@).%@");
}

- (void)updateLocationAndMetaFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Preventing parent zone change on non top-level item%@", v2, v3, v4, v5, v6);
}

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v3 = v2;
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [v2 diffAgainstOriginalItem];
  uint64_t v4 = BRCItemFieldsPrettyPrint();
  int v5 = 138412802;
  uint8_t v6 = v3;
  __int16 v7 = 2112;
  v8 = v4;
  __int16 v9 = 2112;
  uint64_t v10 = v1;
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] updated item from FS: %@\ndiffs:(%@)%@", (uint8_t *)&v5, 0x20u);
}

- (void)updateFromFSAtPath:()LegacyAdditions parentGlobalID:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Failed to load xattrs from disk but continuing anyway (%@).%@");
}

+ (void)newItemWithPath:()LegacyAdditions parentGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = [v2 type];
  __int16 v4 = 2112;
  uint64_t v5 = v1;
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: creating an item from a non supported path 0x%x%@", (uint8_t *)v3, 0x12u);
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Unable to pursue update from FS due to error (%@).%@");
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _appLibrary%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  int v2 = 138412546;
  uint64_t v3 = v0;
  OUTLINED_FUNCTION_3_1();
  _os_log_fault_impl(&dword_1D353B000, v1, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't find client zone for %@%@", (uint8_t *)&v2, 0x16u);
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Not good... We have 2 of the same item on disk.  Duplicating locally%@", v2, v3, v4, v5, v6);
}

- (void)_initWithRelativePath:()LegacyAdditions parentGlobalID:.cold.5()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Found share alias pointing to %@%@", (void)v3, DWORD2(v3));
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Item is marked needs-reading, so it must have changed%@", v2, v3, v4, v5, v6);
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] unknown fileID/generationID on %@%@");
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] path not on disk at %@%@");
}

- (void)changedAtRelativePath:()LegacyAdditions scanPackage:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !scanPackage || !readOnlyDB%@", v2, v3, v4, v5, v6);
}

- (void)markReserved
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] reserved %@%@");
}

- (void)fixupStagedItemAtStartup
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] item is no longer in stage %@%@");
}

- (void)markLiveFromStageWithPath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't mark live from stage%@", v2, v3, v4, v5, v6);
}

- (void)_computedUserVisibleStatusAtPath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] item %@ is missing a doc id%@");
}

- (void)_updatePropagatedInfoFromFSAtPath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  strerror(*v1);
  OUTLINED_FUNCTION_0_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to chmod the file - %s%@", v2, 0x16u);
}

- (void)_updatePropagatedInfoFromFSAtPath:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Item changed read-onlyness.  Updaing the path with the new mode%@", v2, v3, v4, v5, v6);
}

- (void)_updatePropagatedInfoFromFSAtPath:()LegacyAdditions .cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: (_sharingOptions & BRCSharingItemHasShareID) == 0%@", v2, v3, v4, v5, v6);
}

- (void)applyMetadataOnFileID:()LegacyAdditions liveFD:sharingOptions:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: fileID != 0%@", v2, v3, v4, v5, v6);
}

- (void)bounceReservedItemWithBounceNumber:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isReserved%@", v2, v3, v4, v5, v6);
}

- (void)bounceSourceItemWithServerLogicalName:()LegacyAdditions bounceNumber:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: bounceNumber && serverLogicalName%@", v2, v3, v4, v5, v6);
}

- (void)clearFromStage
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _st.stagedFileID%@", v2, v3, v4, v5, v6);
}

@end