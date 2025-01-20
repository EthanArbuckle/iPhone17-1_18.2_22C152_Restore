@interface FBKUploadStatusManager(DEDPolling)
@end

@implementation FBKUploadStatusManager(DEDPolling)

- (void)pollDEDForSessionsStateOnActiveSession:()DEDPolling uploadTask:isCurrentDeviceSession:totalQueryCount:lastState:lastInfo:.cold.1(void *a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3 = [a1 taskIdentifier];
  int v4 = 134217984;
  uint64_t v5 = [v3 longValue];
  _os_log_debug_impl(&dword_22A36D000, a2, OS_LOG_TYPE_DEBUG, "Task [%lu] is no longer tracked. Will not poll", (uint8_t *)&v4, 0xCu);
}

@end