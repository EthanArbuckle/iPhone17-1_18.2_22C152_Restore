@interface SYLegacyStore(BatchedSyncSupport)
- (void)performBatchedSyncToCurrentDBVersion;
- (void)processBatchSyncStart;
@end

@implementation SYLegacyStore(BatchedSyncSupport)

- (void)_postBatchEndMessageWithState:()BatchedSyncSupport error:then:.cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Ending batched sync due to error, but we're unable to send a sync message due to a bad state", v2, v3, v4, v5, v6);
}

- (void)_sendBatchChunk:()BatchedSyncSupport withState:then:.cold.1()
{
  OUTLINED_FUNCTION_16();
  id v2 = v1;
  [v0 count];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14(&dword_21C7C9000, v3, v4, "Sending batch chunk (%zu objects), ID %{public}@", v5, v6, v7, v8, v9);
}

- (void)performBatchedSyncToCurrentDBVersion
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Client rejected batch attempt", v2, v3, v4, v5, v6);
}

- (void)processBatchSyncStart
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "CompanionSync: full batched sync sent to master device", v2, v3, v4, v5, v6);
}

- (void)processBatchSyncEnd:()BatchedSyncSupport .cold.1()
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_4(&dword_21C7C9000, v0, v1, "Ending batched full-sync", v2, v3, v4, v5, v6);
}

- (void)processBatchChunkAtIndex:()BatchedSyncSupport encodedObjects:error:.cold.1(void *a1, void *a2)
{
  id v3 = a1;
  [a2 count];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_14(&dword_21C7C9000, v4, v5, "Batch Sync: adding %zu objects for chunk %zu", v6, v7, v8, v9, v10);
}

- (void)processBatchChunkAck:()BatchedSyncSupport .cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_ERROR, "Received unexpected batch sync chunk ACK: %u", (uint8_t *)v2, 8u);
}

- (void)processBatchChunkAck:()BatchedSyncSupport .cold.2(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x263EF8340];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_21C7C9000, a2, OS_LOG_TYPE_DEBUG, "Received batch chunk ACK: %u", (uint8_t *)v2, 8u);
}

@end