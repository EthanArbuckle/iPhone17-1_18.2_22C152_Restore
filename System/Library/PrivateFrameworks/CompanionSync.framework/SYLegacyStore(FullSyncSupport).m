@interface SYLegacyStore(FullSyncSupport)
- (void)_retrySync;
@end

@implementation SYLegacyStore(FullSyncSupport)

- (void)_retrySync
{
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_1(&dword_21C7C9000, v0, v1, "Full-sync failed, maximum retry attempts reached.", v2, v3, v4, v5, v6);
}

@end