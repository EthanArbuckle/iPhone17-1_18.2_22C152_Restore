@interface BRCStageRegistry(LegacyAdditions)
@end

@implementation BRCStageRegistry(LegacyAdditions)

- (void)_watchLockedRelpath:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] could not open locked file, not watching it %{errno}d%@");
}

- (void)forgetWatchedLockedFileID:()LegacyAdditions .cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] forgetting locked file %@%@", v1, 0x16u);
}

- (void)didFlushStagedFileID:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: fileID != 0%@", v2, v3, v4, v5, v6);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] fsetattrlist failed %{errno}d%@");
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] listing existing xattrs failed: %@%@");
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v0, v1, "[ERROR] Unable to remove xattrs: %@%@");
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.4()
{
  OUTLINED_FUNCTION_6_5();
  __error();
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_10_2(&dword_1D353B000, v0, v1, "[ERROR] can't remove Spotlight last-used date xattrs %{errno}d%@", v2, v3, v4, v5, v6);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.5()
{
  OUTLINED_FUNCTION_6_5();
  __error();
  OUTLINED_FUNCTION_8_6();
  OUTLINED_FUNCTION_10_2(&dword_1D353B000, v0, v1, "[ERROR] can't to set Spotlight last-used date xattrs %{errno}d%@", v2, v3, v4, v5, v6);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.6()
{
  OUTLINED_FUNCTION_6_5();
  __error();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1D353B000, v0, v1, "[ERROR] can't set xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.7()
{
  OUTLINED_FUNCTION_6_5();
  __error();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1D353B000, v0, v1, "[ERROR] can't set xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.8(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 trashPutBackPath];
  int v6 = 138412546;
  v7 = v5;
  __int16 v8 = 2112;
  uint64_t v9 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Preventing updating the put back info path from the server when parented by .Trash: %@%@", (uint8_t *)&v6, 0x16u);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.9()
{
  OUTLINED_FUNCTION_6_5();
  __error();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1D353B000, v0, v1, "[ERROR] can't set xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.10()
{
  OUTLINED_FUNCTION_6_5();
  __error();
  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_3_3(&dword_1D353B000, v0, v1, "[ERROR] can't set the xattr %s:  %{errno}d%@", v2, v3, v4, v5, 2u);
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.11()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] Can't set data protection %{errno}d%@");
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.12()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] Failed fstat on file %{errno}d%@");
}

- (void)applyMetadataOnFileDescriptor:()LegacyAdditions liveFileDescriptor:itemID:clientZone:statInfo:version:sharingOptions:.cold.13()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: invalid item type%@", v2, v3, v4, v5, v6);
}

+ (void)applySharingReadonlyACLsToFD:()LegacyAdditions statInfo:version:clientZone:sharingOptions:.cold.1()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] Failed to strip the acls %{errno}d%@");
}

+ (void)applySharingReadonlyACLsToFD:()LegacyAdditions statInfo:version:clientZone:sharingOptions:.cold.2()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] Can't save immutable share permissions %{errno}d%@");
}

+ (void)applySharingReadonlyACLsToFD:()LegacyAdditions statInfo:version:clientZone:sharingOptions:.cold.3()
{
  OUTLINED_FUNCTION_8_1();
  OUTLINED_FUNCTION_16_0(&dword_1D353B000, v0, v1, "[ERROR] Can't get the group for \"everyone\" in order to limit share permissions %{errno}d%@");
}

@end