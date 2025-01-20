@interface _DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate)
@end

@implementation _DKSyncCloudKitKnowledgeStorage(APSConnectionDelegate)

- (void)connection:()APSConnectionDelegate didReceiveIncomingMessage:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Fetching source device identifiers after receiving a push notification as a single device", v3, v4, v5, v6, v7);
}

- (void)connection:()APSConnectionDelegate didReceiveIncomingMessage:.cold.2()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_0(&dword_18ECEB000, v1, v2, "%{public}@: Set database changes exist bit", v3, v4, v5, v6, v7);
}

@end