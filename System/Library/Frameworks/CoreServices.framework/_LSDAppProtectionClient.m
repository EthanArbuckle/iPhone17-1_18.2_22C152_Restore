@interface _LSDAppProtectionClient
+ (id)hiddenApplicationsForLSDUseOnly;
+ (id)lockedApplicationsForLSDUseOnly;
+ (void)cleanupDeletedApplication:(id)a3;
- (_LSDAppProtectionClient)initWithXPCConnection:(id)a3;
- (void)getHiddenApplicationsWithCompletion:(id)a3;
- (void)getLockedApplicationsWithCompletion:(id)a3;
- (void)sendPluginNotificationsFor:(id)a3 notification:(id)a4;
- (void)setHiddenApplications:(id)a3 completion:(id)a4;
- (void)setLockedApplications:(id)a3 completion:(id)a4;
@end

@implementation _LSDAppProtectionClient

- (void)setHiddenApplications:completion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Error writing to appProtectionStoreFile error: %{public}@", v2, v3, v4, v5, v6);
}

- (_LSDAppProtectionClient)initWithXPCConnection:(id)a3
{
  id v4 = a3;
  uint64_t v5 = getAppProtectionServiceQueue();
  [v4 _setQueue:v5];

  v8.receiver = self;
  v8.super_class = (Class)_LSDAppProtectionClient;
  uint8_t v6 = [(_LSDClient *)&v8 initWithXPCConnection:v4];

  return v6;
}

- (void)setHiddenApplications:(id)a3 completion:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient setHiddenApplications:completion:]");
  objc_super v8 = (void *)MEMORY[0x1E4F1CA60];
  v9 = +[_LSDAppProtectionAccessManager sharedInstance];
  id v23 = 0;
  v10 = [v9 readFromDBWithError:&v23];
  id v11 = v23;
  v12 = [v8 dictionaryWithDictionary:v10];

  if (v11)
  {
    v13 = _LSAppProtectionLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      -[_LSDAppProtectionClient setHiddenApplications:completion:]();
    }

    v7[2](v7, v11);
  }
  else
  {
    v14 = [v12 objectForKey:@"hiddenBundleIDs"];
    id v21 = 0;
    id v22 = 0;
    computeAddedAndRemovedBundleIDs(&v22, &v21, v14, v6);
    id v15 = v22;
    id v16 = v21;
    v17 = _LSAppProtectionLog();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[_LSDAppProtectionClient setHiddenApplications:completion:]((uint64_t)v24, [v15 count], objc_msgSend(v16, "count"));
    }

    [v12 setObject:v6 forKey:@"hiddenBundleIDs"];
    v18 = +[_LSDAppProtectionAccessManager sharedInstance];
    id v11 = [v18 writeToDB:v12];

    if (v11)
    {
      v19 = _LSAppProtectionLog();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        -[_LSDAppProtectionClient setHiddenApplications:completion:]();
      }

      v7[2](v7, v11);
    }
    else
    {
      id v20 = 0;
      notifyLSObservers(v15, v16, 1, &v20);
      id v11 = v20;
      [(_LSDAppProtectionClient *)self sendPluginNotificationsFor:v15 notification:@"com.apple.LaunchServices.pluginsunregistered"];
      [(_LSDAppProtectionClient *)self sendPluginNotificationsFor:v16 notification:@"com.apple.LaunchServices.pluginsregistered"];
      v7[2](v7, v11);
    }
  }
}

- (void)setLockedApplications:(id)a3 completion:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, id))a4;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient setLockedApplications:completion:]");
  v7 = (void *)MEMORY[0x1E4F1CA60];
  objc_super v8 = +[_LSDAppProtectionAccessManager sharedInstance];
  id v22 = 0;
  v9 = [v8 readFromDBWithError:&v22];
  id v10 = v22;
  id v11 = [v7 dictionaryWithDictionary:v9];

  if (v10)
  {
    v12 = _LSAppProtectionLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      -[_LSDAppProtectionClient setHiddenApplications:completion:]();
    }

    v6[2](v6, v10);
  }
  else
  {
    v13 = [v11 objectForKey:@"lockedBundleIDs"];
    id v20 = 0;
    id v21 = 0;
    computeAddedAndRemovedBundleIDs(&v21, &v20, v13, v5);
    id v14 = v21;
    id v15 = v20;
    id v16 = _LSAppProtectionLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
      -[_LSDAppProtectionClient setLockedApplications:completion:]((uint64_t)v23, [v14 count], objc_msgSend(v15, "count"));
    }

    [v11 setObject:v5 forKey:@"lockedBundleIDs"];
    v17 = +[_LSDAppProtectionAccessManager sharedInstance];
    id v10 = [v17 writeToDB:v11];

    if (v10)
    {
      v18 = _LSAppProtectionLog();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
        -[_LSDAppProtectionClient setLockedApplications:completion:]();
      }

      v6[2](v6, v10);
    }
    else
    {
      id v19 = 0;
      notifyLSObservers(v14, v15, 0, &v19);
      id v10 = v19;
      v6[2](v6, v10);
    }
  }
}

+ (void)cleanupDeletedApplication:(id)a3
{
  id v3 = a3;
  _LSAssertRunningInServer((uint64_t)"+[_LSDAppProtectionClient cleanupDeletedApplication:]");
  id v4 = (void *)MEMORY[0x1E4F1CA60];
  id v5 = +[_LSDAppProtectionAccessManager sharedInstance];
  id v18 = 0;
  id v6 = [v5 readFromDBWithError:&v18];
  id v7 = v18;
  objc_super v8 = [v4 dictionaryWithDictionary:v6];

  if (!v7)
  {
    v9 = [v8 objectForKey:@"lockedBundleIDs"];
    int v10 = [v9 containsObject:v3];
    if (v10)
    {
      id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != %@", v3];
      v12 = [v9 filteredArrayUsingPredicate:v11];
      [v8 setObject:v12 forKey:@"lockedBundleIDs"];
    }
    v13 = [v8 objectForKey:@"hiddenBundleIDs"];
    if ([v13 containsObject:v3])
    {
      id v14 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"SELF != %@", v3];
      id v15 = [v13 filteredArrayUsingPredicate:v14];
      [v8 setObject:v15 forKey:@"hiddenBundleIDs"];
    }
    else if (!v10)
    {
      id v7 = 0;
LABEL_14:

      goto LABEL_15;
    }
    id v16 = +[_LSDAppProtectionAccessManager sharedInstance];
    id v7 = [v16 writeToDB:v8];

    if (v7)
    {
      v17 = _LSAppProtectionLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        +[_LSDAppProtectionClient cleanupDeletedApplication:]();
      }
    }
    goto LABEL_14;
  }
  v9 = _LSAppProtectionLog();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    +[_LSDAppProtectionClient cleanupDeletedApplication:]();
  }
LABEL_15:
}

+ (id)hiddenApplicationsForLSDUseOnly
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDAppProtectionClient hiddenApplicationsForLSDUseOnly]");
  uint64_t v2 = +[_LSDAppProtectionAccessManager sharedInstance];
  id v3 = [v2 readFromDBWithError:0];
  id v4 = [v3 objectForKey:@"hiddenBundleIDs"];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

+ (id)lockedApplicationsForLSDUseOnly
{
  _LSAssertRunningInServer((uint64_t)"+[_LSDAppProtectionClient lockedApplicationsForLSDUseOnly]");
  uint64_t v2 = +[_LSDAppProtectionAccessManager sharedInstance];
  id v3 = [v2 readFromDBWithError:0];
  id v4 = [v3 objectForKey:@"lockedBundleIDs"];

  if (v4) {
    id v5 = v4;
  }
  else {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v6 = v5;

  return v6;
}

- (void)getHiddenApplicationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient getHiddenApplicationsWithCompletion:]");
  id v3 = +[_LSDAppProtectionClient hiddenApplicationsForLSDUseOnly];
  v4[2](v4, v3);
}

- (void)getLockedApplicationsWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void *))a3;
  _LSAssertRunningInServer((uint64_t)"-[_LSDAppProtectionClient getLockedApplicationsWithCompletion:]");
  id v3 = +[_LSDAppProtectionClient lockedApplicationsForLSDUseOnly];
  v4[2](v4, v3);
}

- (void)sendPluginNotificationsFor:(id)a3 notification:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_super v8 = +[LSDBExecutionContext sharedServerInstance]();
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __67___LSDAppProtectionClient_sendPluginNotificationsFor_notification___block_invoke;
    v10[3] = &unk_1E522E4B8;
    id v11 = v5;
    id v9 = v7;
    id v12 = v9;
    id v13 = v6;
    -[LSDBExecutionContext performAsyncRead:]((uint64_t)v8, v10);
  }
}

- (void)setHiddenApplications:(uint64_t)a3 completion:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_6(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_182959000, v4, OS_LOG_TYPE_DEBUG, "App Protection hidden subjects changed. added: %lu removed: %lu", v3, 0x16u);
}

- (void)setHiddenApplications:completion:.cold.3()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Error opening appProtectionStoreFile error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setLockedApplications:completion:.cold.1()
{
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_3(&dword_182959000, v0, v1, "Error writing to appProtectionStoreFile error: %{public}@", v2, v3, v4, v5, v6);
}

- (void)setLockedApplications:(uint64_t)a3 completion:.cold.2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_1_6(a1, a2, a3, 3.8521e-34);
  _os_log_debug_impl(&dword_182959000, v4, OS_LOG_TYPE_DEBUG, "App Protection locked subjects changed. added: %lu removed: %lu", v3, 0x16u);
}

+ (void)cleanupDeletedApplication:.cold.1()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Error writing to appProtectionStoreFile error: %{public}@ while cleaning up deleted app %{private}@");
}

+ (void)cleanupDeletedApplication:.cold.2()
{
  OUTLINED_FUNCTION_2_4();
  OUTLINED_FUNCTION_1(&dword_182959000, v0, v1, "Error opening appProtectionStoreFile error: %{public}@ while cleaning up deleted app %{private}@");
}

@end