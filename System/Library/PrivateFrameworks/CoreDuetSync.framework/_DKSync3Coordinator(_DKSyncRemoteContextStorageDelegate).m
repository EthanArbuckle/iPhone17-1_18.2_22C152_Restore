@interface _DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate)
@end

@implementation _DKSync3Coordinator(_DKSyncRemoteContextStorageDelegate)

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate hasKnowledgeOfKeyPath:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_226CA5000, v1, v2, "%{public}@: Failed to handle remote context storage request due to missing or invalid parameters", v3, v4, v5, v6, v7);
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate hasKnowledgeOfKeyPath:.cold.2()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v1, v2, "%{public}@: Remote context store has knowledge of key path: %@", v3, v4, v5, v6, v7);
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate hasKnowledgeOfKeyPath:.cold.3()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_10();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v1, v2, "%{public}@: Remote context store does not have knowledge of key path: %@", v3, v4, v5, v6, v7);
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate subscribeToChangesWithPeer:registrationIdentifier:predicate:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_226CA5000, v1, v2, "%{public}@: Failed to handle remote context storage request due to missing or invalid parameters", v3, v4, v5, v6, v7);
}

- (void)remoteContextStorage:()_DKSyncRemoteContextStorageDelegate unsubscribeFromChangesWithPeer:registrationIdentifier:predicate:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_226CA5000, v1, v2, "%{public}@: Failed to handle remote context storage request due failure to create registration object", v3, v4, v5, v6, v7);
}

@end