@interface BRCXPCRegularIPCsClient(LegacyAdditions)
@end

@implementation BRCXPCRegularIPCsClient(LegacyAdditions)

- (void)createSharingInfoForURL:()LegacyAdditions reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Creating share for URL %@%@");
}

- (void)copyBulkShareIDsAtURLs:()LegacyAdditions reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Bulk copying shareIDs at urls %@%@");
}

- (void)_listBatchedFilesIngested:()LegacyAdditions batchSize:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [fileIDs count] <= batchSize%@", v2, v3, v4, v5, v6);
}

- (void)waitForFileSystemChangeProcessingWithReply:()LegacyAdditions .cold.1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┣%llx waiting for the lost scan%@", (void)v3, DWORD2(v3));
}

- (void)waitForFileSystemChangeProcessingWithReply:()LegacyAdditions .cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] wait for the lost scan%@", v2, v3, v4, v5, v6);
}

- (void)waitForFileSystemChangeProcessingWithReply:()LegacyAdditions .cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] wait for fsevents%@", v2, v3, v4, v5, v6);
}

- (void)resolveFileObjectIDToURL:()LegacyAdditions reply:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] fileObjectID: %@%@");
}

@end