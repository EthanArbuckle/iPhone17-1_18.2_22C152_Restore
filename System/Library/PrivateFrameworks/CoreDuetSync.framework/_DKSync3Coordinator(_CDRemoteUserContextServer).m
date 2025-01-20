@interface _DKSync3Coordinator(_CDRemoteUserContextServer)
@end

@implementation _DKSync3Coordinator(_CDRemoteUserContextServer)

- (void)subscribeToContextValueChangeNotificationsWithRegistration:()_CDRemoteUserContextServer deviceIDs:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  v1 = [(id)OUTLINED_FUNCTION_13() identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v2, v3, "%{public}@: No peers to subscribe to context value change notifications with registration %{public}@", v4, v5, v6, v7, v8);
}

- (void)subscribeToContextValueChangeNotificationsWithRegistration:()_CDRemoteUserContextServer deviceIDs:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  v1 = [(id)OUTLINED_FUNCTION_13() identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_21(&dword_226CA5000, v2, v3, "%{public}@: Ignoring attempt to subscribe to registration that doesn't support remote subscriptions: %{public}@", v4, v5, v6, v7, v8);
}

- (void)subscribeToContextValueChangeNotificationsWithRegistration:()_CDRemoteUserContextServer deviceIDs:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  v1 = [(id)OUTLINED_FUNCTION_13() identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v2, v3, "%{public}@: Subscribing to context value change notifications with registration %{public}@", v4, v5, v6, v7, v8);
}

- (void)unsubscribeFromContextValueChangeNotificationsWithRegistration:()_CDRemoteUserContextServer deviceIDs:error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  v1 = [(id)OUTLINED_FUNCTION_13() identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v2, v3, "%{public}@: No peers to unsubscribe from context value change notifications with registration %{public}@", v4, v5, v6, v7, v8);
}

- (void)unsubscribeFromContextValueChangeNotificationsWithRegistration:()_CDRemoteUserContextServer deviceIDs:error:.cold.2()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  v1 = [(id)OUTLINED_FUNCTION_13() identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_21(&dword_226CA5000, v2, v3, "%{public}@: Ignoring attempt to unsubscribe from registration that doesn't support remote subscriptions: %{public}@", v4, v5, v6, v7, v8);
}

- (void)unsubscribeFromContextValueChangeNotificationsWithRegistration:()_CDRemoteUserContextServer deviceIDs:error:.cold.3()
{
  OUTLINED_FUNCTION_6();
  [(id)objc_opt_class() description];
  objc_claimAutoreleasedReturnValue();
  v1 = [(id)OUTLINED_FUNCTION_13() identifier];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v2, v3, "%{public}@: Unsubscribing from context value change notifications with registration %{public}@", v4, v5, v6, v7, v8);
}

- (void)subscribeToDeviceStatusChangeNotificationsForDeviceTypes:()_CDRemoteUserContextServer error:.cold.1()
{
  OUTLINED_FUNCTION_6();
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v1, v2, "%{public}@: Subscribing to device status change notifications for device types %lX", v3, v4, v5, v6, v7);
}

- (void)_fetchPropertiesOfRemoteKeyPaths:()_CDRemoteUserContextServer handler:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)objc_opt_class() description];
  uint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a2, "count"));
  OUTLINED_FUNCTION_5();
  uint8_t v7 = _CDPrettyPrintCollection();
  int v8 = 138543874;
  v9 = v5;
  __int16 v10 = 2112;
  v11 = v6;
  __int16 v12 = 2112;
  v13 = v7;
  _os_log_debug_impl(&dword_226CA5000, a3, OS_LOG_TYPE_DEBUG, "%{public}@: Fetching properties of %@ key paths: %@", (uint8_t *)&v8, 0x20u);
}

- (void)_requestActivateDevicesWithHandler:()_CDRemoteUserContextServer .cold.3()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_8(&dword_226CA5000, v1, v2, "%{public}@: Handling request to activate devices", v3, v4, v5, v6, v7);
}

- (void)archivedObjectsForKeyPaths:()_CDRemoteUserContextServer .cold.1(uint64_t a1, void *a2)
{
  uint64_t v3 = [(id)objc_opt_class() description];
  uint64_t v4 = [a2 valueForKey:@"key"];
  OUTLINED_FUNCTION_5();
  v11 = _CDPrettyPrintCollection();
  OUTLINED_FUNCTION_0(&dword_226CA5000, v5, v6, "%{public}@: Archiving objects for key paths: %{public}@", v7, v8, v9, v10, 2u);
}

- (void)sendContextValuesToPeer:()_CDRemoteUserContextServer registrationIdentifier:keyPaths:.cold.1()
{
  v0 = [(id)objc_opt_class() description];
  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_3(&dword_226CA5000, v1, v2, "%{public}@: Failed to send context values to peer due to missing or invalid parameters", v3, v4, v5, v6, v7);
}

@end