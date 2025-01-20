@interface AMSUNUserNotificationStrategy
+ (BOOL)_badgeBundleId:(id)a3 increment:(BOOL)a4 error:(id *)a5;
+ (id)_activeNotificationsWithCenterBundleId:(id)a3;
+ (id)_centerForBundleId:(id)a3;
+ (id)_postNotification:(id)a3 bag:(id)a4 centerBundleId:(id)a5;
+ (id)_removeNotification:(id)a3 centerBundleId:(id)a4;
+ (id)_removeNotificationWithIdentifier:(id)a3 centerBundleId:(id)a4 logKey:(id)a5 scheduledOnly:(BOOL)a6;
@end

@implementation AMSUNUserNotificationStrategy

+ (id)_activeNotificationsWithCenterBundleId:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v6 = [a1 _centerForBundleId:v4];
  uint64_t v25 = 0;
  v26 = &v25;
  uint64_t v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__72;
  v29 = __Block_byref_object_dispose__72;
  id v30 = 0;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__AMSUNUserNotificationStrategy__activeNotificationsWithCenterBundleId___block_invoke;
  v22[3] = &unk_1E55A7440;
  v24 = &v25;
  v8 = v7;
  v23 = v8;
  [v6 getDeliveredNotificationsWithCompletionHandler:v22];
  dispatch_time_t v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v10 = (id)v26[5];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v18 + 1) + 8 * i);
        v15 = [AMSUserNotification alloc];
        v16 = -[AMSUserNotification initWithUNNotification:](v15, "initWithUNNotification:", v14, (void)v18);
        [v5 addObject:v16];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v31 count:16];
    }
    while (v11);
  }

  _Block_object_dispose(&v25, 8);
  return v5;
}

void __72__AMSUNUserNotificationStrategy__activeNotificationsWithCenterBundleId___block_invoke(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

+ (BOOL)_badgeBundleId:(id)a3 increment:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  dispatch_time_t v9 = [a1 _centerForBundleId:v8];
  id v10 = [v9 badgeNumber];
  uint64_t v11 = [v10 longLongValue];

  if (v6) {
    uint64_t v12 = v11 + 1;
  }
  else {
    uint64_t v12 = v11 - 1;
  }
  v13 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v12];
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x2020000000;
  char v26 = 0;
  dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __64__AMSUNUserNotificationStrategy__badgeBundleId_increment_error___block_invoke;
  v19[3] = &unk_1E55A7468;
  long long v21 = &v23;
  v22 = a5;
  v15 = v14;
  long long v20 = v15;
  [v9 setBadgeNumber:v13 withCompletionHandler:v19];
  dispatch_time_t v16 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v15, v16);
  char v17 = *((unsigned char *)v24 + 24);

  _Block_object_dispose(&v23, 8);
  return v17;
}

intptr_t __64__AMSUNUserNotificationStrategy__badgeBundleId_increment_error___block_invoke(uint64_t a1, id a2)
{
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  if (a2)
  {
    *(unsigned char *)(v3 + 24) = 0;
    if (*(void *)(a1 + 48)) {
      **(void **)(a1 + 48) = a2;
    }
  }
  else
  {
    *(unsigned char *)(v3 + 24) = 1;
  }
  id v4 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v4);
}

+ (id)_postNotification:(id)a3 bag:(id)a4 centerBundleId:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_alloc_init(AMSMutableBinaryPromise);
  uint64_t v12 = [v8 logKey];
  id v13 = AMSSetLogKey(v12);

  dispatch_semaphore_t v14 = [a1 _centerForBundleId:v10];

  if (!v14)
  {
    v15 = AMSError(0, @"Unknown Center", @"Unable to locate notification center for posting", 0);
    [(AMSMutableBinaryPromise *)v11 finishWithError:v15];
  }
  dispatch_time_t v16 = +[AMSLogConfig sharedConfig];
  if (!v16)
  {
    dispatch_time_t v16 = +[AMSLogConfig sharedConfig];
  }
  char v17 = [v16 OSLogObject];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    long long v18 = v11;
    long long v19 = objc_opt_class();
    id v31 = v19;
    long long v20 = [v8 logKey];
    long long v21 = [v8 identifier];
    *(_DWORD *)buf = 138543874;
    v39 = v19;
    uint64_t v11 = v18;
    __int16 v40 = 2114;
    v41 = v20;
    __int16 v42 = 2114;
    v43 = v21;
    _os_log_impl(&dword_18D554000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification: %{public}@", buf, 0x20u);
  }
  v22 = [v8 createUNNotificationContent];
  uint64_t v23 = [v8 createUNNotificationRequestFromContent:v22];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke;
  v32[3] = &unk_1E55A7490;
  id v33 = v8;
  id v34 = v14;
  id v37 = a1;
  v24 = v11;
  v35 = v24;
  id v36 = v9;
  id v25 = v9;
  id v26 = v14;
  id v27 = v8;
  +[AMSUserNotification handleServiceExtensionNotificationRequest:v23 bag:v25 withContentHandler:v32];
  v28 = v36;
  v29 = v24;

  return v29;
}

void __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void **)(a1 + 32);
  id v4 = a2;
  id v5 = [v3 logKey];
  id v6 = AMSSetLogKey(v5);

  dispatch_semaphore_t v7 = [*(id *)(a1 + 32) createUNNotificationRequestFromContent:v4];

  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke_2;
  v11[3] = &unk_1E55A5ED8;
  uint64_t v14 = *(void *)(a1 + 64);
  id v8 = *(void **)(a1 + 40);
  id v12 = *(id *)(a1 + 32);
  id v13 = *(id *)(a1 + 48);
  [v8 addNotificationRequest:v7 withCompletionHandler:v11];
  id v9 = +[AMSMetrics internalInstanceUsingBag:*(void *)(a1 + 56)];
  id v10 = (id)[v9 flush];
}

void __70__AMSUNUserNotificationStrategy__postNotification_bag_centerBundleId___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = +[AMSLogConfig sharedConfig];
  id v5 = (void *)v4;
  if (v3)
  {
    if (!v4)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v6 = [v5 OSLogObject];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      dispatch_semaphore_t v7 = objc_opt_class();
      id v8 = *(void **)(a1 + 32);
      id v9 = v7;
      id v10 = [v8 logKey];
      uint64_t v11 = [*(id *)(a1 + 32) identifier];
      int v18 = 138544130;
      long long v19 = v7;
      __int16 v20 = 2114;
      long long v21 = v10;
      __int16 v22 = 2114;
      uint64_t v23 = v11;
      __int16 v24 = 2114;
      id v25 = v3;
      _os_log_impl(&dword_18D554000, v6, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to post notification: %{public}@. Error: %{public}@", (uint8_t *)&v18, 0x2Au);
    }
    [*(id *)(a1 + 40) finishWithError:v3];
  }
  else
  {
    if (!v4)
    {
      id v5 = +[AMSLogConfig sharedConfig];
    }
    id v12 = [v5 OSLogObject];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = objc_opt_class();
      uint64_t v14 = *(void **)(a1 + 32);
      id v15 = v13;
      dispatch_time_t v16 = [v14 logKey];
      char v17 = [*(id *)(a1 + 32) identifier];
      int v18 = 138543874;
      long long v19 = v13;
      __int16 v20 = 2114;
      long long v21 = v16;
      __int16 v22 = 2114;
      uint64_t v23 = v17;
      _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Successfully posted notification: %{public}@", (uint8_t *)&v18, 0x20u);
    }
    [*(id *)(a1 + 40) finishWithSuccess];
  }
}

+ (id)_removeNotificationWithIdentifier:(id)a3 centerBundleId:(id)a4 logKey:(id)a5 scheduledOnly:(BOOL)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a4;
  id v13 = +[AMSLogConfig sharedConfig];
  if (!v13)
  {
    id v13 = +[AMSLogConfig sharedConfig];
  }
  uint64_t v14 = [v13 OSLogObject];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v24 = (id)objc_opt_class();
    __int16 v25 = 2114;
    id v26 = v11;
    __int16 v27 = 2114;
    id v28 = v10;
    id v15 = v24;
    _os_log_impl(&dword_18D554000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Removing notification: %{public}@", buf, 0x20u);
  }
  dispatch_time_t v16 = [a1 _centerForBundleId:v12];

  if (!a6)
  {
    id v22 = v10;
    char v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v22 count:1];
    [v16 removeDeliveredNotificationsWithIdentifiers:v17];
  }
  id v21 = v10;
  int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
  [v16 removePendingNotificationRequestsWithIdentifiers:v18];

  long long v19 = +[AMSBinaryPromise promiseWithSuccess];

  return v19;
}

+ (id)_removeNotification:(id)a3 centerBundleId:(id)a4
{
  uint64_t v4 = AMSError(11, @"Remove Not Implemented", 0, 0);
  id v5 = +[AMSBinaryPromise promiseWithError:v4];

  return v5;
}

+ (id)_centerForBundleId:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    uint64_t v4 = +[AMSProcessInfo currentProcess];
    id v5 = [v4 bundleIdentifier];
    int v6 = [v3 isEqualToString:v5];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F44680] currentNotificationCenter];
    }
    else
    {
      uint64_t v7 = [objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:v3];
    }
    id v8 = (void *)v7;
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

@end