@interface CSFSoftLinking
+ (BOOL)isDeviceEnrolledWithDeKOTA:(id *)a3;
+ (void)registerForLoggedOutPushNotifications;
+ (void)unregisterForLoggedOutPushNotifications;
@end

@implementation CSFSoftLinking

+ (void)registerForLoggedOutPushNotifications
{
  id v2 = objc_alloc_init((Class)getINDaemonConnectionClass());
  [v2 registerDeviceForLoggedOutiCloudNotificationsWithReason:8 completion:&__block_literal_global_3];
}

void __55__CSFSoftLinking_registerForLoggedOutPushNotifications__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = _CSFGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __55__CSFSoftLinking_registerForLoggedOutPushNotifications__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  v6 = _CSFGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "Registering for logged out push was successful? %@", (uint8_t *)&v8, 0xCu);
  }
}

+ (void)unregisterForLoggedOutPushNotifications
{
  id v2 = objc_alloc_init((Class)getINDaemonConnectionClass());
  [v2 unregisterDeviceFromLoggedOutiCloudNotificationsWithCompletion:&__block_literal_global_6];
}

void __57__CSFSoftLinking_unregisterForLoggedOutPushNotifications__block_invoke(uint64_t a1, int a2, void *a3)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v5 = _CSFGetLogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      __57__CSFSoftLinking_unregisterForLoggedOutPushNotifications__block_invoke_cold_1((uint64_t)v4, v5);
    }
  }
  v6 = _CSFGetLogSystem();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = @"NO";
    if (a2) {
      v7 = @"YES";
    }
    int v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1A8C7F000, v6, OS_LOG_TYPE_DEFAULT, "Unregistering for logged out push was successful? %@", (uint8_t *)&v8, 0xCu);
  }
}

+ (BOOL)isDeviceEnrolledWithDeKOTA:(id *)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id MSDKDemoStateClass = getMSDKDemoStateClass();
  v5 = _CSFGetLogSystem();
  BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (MSDKDemoStateClass)
  {
    if (v6)
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1A8C7F000, v5, OS_LOG_TYPE_DEFAULT, "CSFSoftLinking isDeviceEnrolledWithDeKOTA querying MSDKDemoState", (uint8_t *)v10, 2u);
    }

    v5 = [getMSDKDemoStateClass() sharedInstance];
    int v7 = [v5 isDeviceEnrolledWithDeKOTA:a3];
    int v8 = _CSFGetLogSystem();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v7;
      _os_log_impl(&dword_1A8C7F000, v8, OS_LOG_TYPE_DEFAULT, "CSFSoftLinking isDeviceEnrolledWithDeKOTA %d", (uint8_t *)v10, 8u);
    }
  }
  else
  {
    if (v6)
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_1A8C7F000, v5, OS_LOG_TYPE_DEFAULT, "CSFSoftLinking isDeviceEnrolledWithDeKOTA no access to MSDKDemoState. Returning false", (uint8_t *)v10, 2u);
    }
    LOBYTE(v7) = 0;
  }

  return v7;
}

void __55__CSFSoftLinking_registerForLoggedOutPushNotifications__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A8C7F000, a2, OS_LOG_TYPE_ERROR, "Error while registering for logged out push notifications: %@", (uint8_t *)&v2, 0xCu);
}

void __57__CSFSoftLinking_unregisterForLoggedOutPushNotifications__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A8C7F000, a2, OS_LOG_TYPE_ERROR, "Error while unregistering for logged out push notifications: %@", (uint8_t *)&v2, 0xCu);
}

@end