@interface TestFlightFeedbackService
- (void)getDisplayNamesForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)getDisplayNamesForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)getEmailAddressForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)getEmailAddressForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)getFeedbackMetadataForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)getFeedbackMetadataForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)getLaunchInfoForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)getLaunchInfoForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)getLaunchInfoForVersion:(id)a3 withCompletionHandler:(id)a4;
- (void)isFeedbackEnabledForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)isFeedbackEnabledForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)isLaunchScreenEnabledForBundleID:(id)a3 withCompletionHandler:(id)a4;
- (void)isLaunchScreenEnabledForBundleURL:(id)a3 withCompletionHandler:(id)a4;
- (void)setFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5;
- (void)setLaunchInfo:(id)a3 withCompletionHandler:(id)a4;
- (void)setLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5;
- (void)submitFeedback:(id)a3 bundleURL:(id)a4 withCompletionHandler:(id)a5;
- (void)submitFeedback:(id)a3 withCompletionHandler:(id)a4;
- (void)updateTestNotes:(id)a3 forVersion:(id)a4 withCompletionHandler:(id)a5;
@end

@implementation TestFlightFeedbackService

- (void)getDisplayNamesForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getDisplayNamesForBundleID: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  v12 = sub_1002707CC(v11, v5, v7);
  v6[2](v6, v12);
}

- (void)getDisplayNamesForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getDisplayNamesForBundleURL: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  v12 = sub_100270C4C(v11, v5, v7);
  v6[2](v6, v12);
}

- (void)getEmailAddressForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getEmailAddressForBundleID: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  v12 = sub_100270F88(v11, v5, v7);
  v6[2](v6, v12);
}

- (void)getEmailAddressForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getEmailAddressForBundleURL: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  v12 = sub_10027128C(v11, v5, v7);
  v6[2](v6, v12);
}

- (void)getFeedbackMetadataForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v12 = 138543874;
    int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getFeedbackMetadataForBundleID: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v11 = sub_1002705B4();
  sub_100271590((uint64_t)v11, v5, v7, v6);
}

- (void)getFeedbackMetadataForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v12 = 138543874;
    int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getFeedbackMetadataForBundleURL: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v11 = sub_1002705B4();
  sub_100271960((uint64_t)v11, v5, v7, v6);
}

- (void)getLaunchInfoForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v12 = 138543874;
    int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getLaunchInfoForBundleID: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v11 = sub_1002705B4();
  sub_100271D30((uint64_t)v11, v5, v7, v6);
}

- (void)getLaunchInfoForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v12 = 138543874;
    int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getLaunchInfoForBundleURL: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v11 = sub_1002705B4();
  sub_100272184((uint64_t)v11, v5, v7, v6);
}

- (void)getLaunchInfoForVersion:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v12 = 138543874;
    int v13 = v7;
    __int16 v14 = 2114;
    id v15 = v5;
    __int16 v16 = 2114;
    __int16 v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ getLaunchInfoForVersion: %{public}@ for client: %{public}@", (uint8_t *)&v12, 0x20u);
  }
  v11 = sub_1002705B4();
  sub_1002725D8((uint64_t)v11, v5, (uint64_t)v7, v6);
}

- (void)isFeedbackEnabledForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    __int16 v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ isFeedbackEnabledForBundleID: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  uint64_t v12 = sub_100272888((uint64_t)v11, v5, v7);
  v6[2](v6, v12);
}

- (void)isFeedbackEnabledForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    __int16 v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ isFeedbackEnabledForBundleURL: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  uint64_t v12 = sub_100272BB8((uint64_t)v11, v5, v7);
  v6[2](v6, v12);
}

- (void)isLaunchScreenEnabledForBundleID:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    __int16 v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ isLaunchScreenEnabledForBundleID: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  uint64_t v12 = sub_100272DE0((uint64_t)v11, v5, v7);
  v6[2](v6, v12);
}

- (void)isLaunchScreenEnabledForBundleURL:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(id, uint64_t))a4;
  v7 = sub_100016788();
  v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v7 processInfo];
    v10 = [v9 bundleIdentifier];
    int v13 = 138543874;
    __int16 v14 = v7;
    __int16 v15 = 2114;
    id v16 = v5;
    __int16 v17 = 2114;
    v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ isLaunchScreenEnabledForBundleURL: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  v11 = sub_1002705B4();
  uint64_t v12 = sub_100273090((uint64_t)v11, v5, v7);
  v6[2](v6, v12);
}

- (void)setFeedbackEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_100016788();
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 processInfo];
    uint64_t v12 = [v11 bundleIdentifier];
    int v14 = 138543874;
    __int16 v15 = v9;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ setFeedbackEnabled:forVersion: %{public}@ for client: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  int v13 = sub_1002705B4();
  sub_100273E58((uint64_t)v13, a3, v7, v9, v8);
}

- (void)setLaunchInfo:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100016788();
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v5 version];
    v10 = [v7 processInfo];
    v11 = [v10 bundleIdentifier];
    int v13 = 138543874;
    int v14 = v7;
    __int16 v15 = 2114;
    __int16 v16 = v9;
    __int16 v17 = 2114;
    __int16 v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ setLaunchInfo: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v12 = sub_1002705B4();
  sub_100274254((uint64_t)v12, v5, v7, v6);
}

- (void)setLaunchScreenEnabled:(BOOL)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = sub_100016788();
  v10 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = [v9 processInfo];
    uint64_t v12 = [v11 bundleIdentifier];
    int v14 = 138543874;
    __int16 v15 = v9;
    __int16 v16 = 2114;
    id v17 = v7;
    __int16 v18 = 2114;
    v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ setLaunchScreenEnabled:forVersion: %{public}@ for client: %{public}@", (uint8_t *)&v14, 0x20u);
  }
  int v13 = sub_1002705B4();
  sub_100274658((uint64_t)v13, a3, v7, v9, v8);
}

- (void)submitFeedback:(id)a3 withCompletionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = sub_100016788();
  id v8 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v5 bundleID];
    v10 = [v7 processInfo];
    v11 = [v10 bundleIdentifier];
    int v13 = 138543874;
    int v14 = v7;
    __int16 v15 = 2114;
    __int16 v16 = v9;
    __int16 v17 = 2114;
    __int16 v18 = v11;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ submitFeedback: %{public}@ for client: %{public}@", (uint8_t *)&v13, 0x20u);
  }
  uint64_t v12 = sub_1002705B4();
  sub_100274A54((uint64_t)v12, v5, v7, v6);
}

- (void)submitFeedback:(id)a3 bundleURL:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = sub_100016788();
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 processInfo];
    int v13 = [v12 bundleIdentifier];
    int v15 = 138543874;
    __int16 v16 = v10;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ submitFeedback:bundleURL %{public}@ for client: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  int v14 = sub_1002705B4();
  sub_1002753B4((uint64_t)v14, v9, v7, v10, v8);
}

- (void)updateTestNotes:(id)a3 forVersion:(id)a4 withCompletionHandler:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = a3;
  v10 = sub_100016788();
  v11 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v12 = [v10 processInfo];
    int v13 = [v12 bundleIdentifier];
    int v15 = 138543874;
    __int16 v16 = v10;
    __int16 v17 = 2114;
    id v18 = v7;
    __int16 v19 = 2114;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ updateTestNotes:forVersion: %{public}@ for client: %{public}@", (uint8_t *)&v15, 0x20u);
  }
  int v14 = sub_1002705B4();
  sub_1002754D8((uint64_t)v14, v9, v7, v10, v8);
}

@end