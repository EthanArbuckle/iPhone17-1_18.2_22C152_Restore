@interface AMSPushParsableRichNotification
+ (BOOL)shouldSkipAccountCheck;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSPushParsableRichNotification

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 clientIdentifier];
  unsigned __int8 v24 = 0;
  id v23 = 0;
  BOOL v12 = +[AMSUserNotification shouldDeleteNotificationForPayload:v8 outIdentifier:&v23 scheduledOnly:&v24];
  id v13 = v23;
  uint64_t v14 = +[AMSLogConfig sharedPushNotificationConfig];
  v15 = (void *)v14;
  if (v12)
  {
    if (!v14)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v16 = [v15 OSLogObject];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = [v8 logKey];
      *(_DWORD *)buf = 138543874;
      id v26 = a1;
      __int16 v27 = 2114;
      v28 = v17;
      __int16 v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_18D554000, v16, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Deleting notification with identifier: %{public}@", buf, 0x20u);
    }
    v18 = AMSLogKey();
    id v19 = +[AMSUserNotificationCenter removeNotificationWithIdentifier:v13 centerBundleId:v11 logKey:v18 scheduledOnly:v24];
  }
  else
  {
    if (!v14)
    {
      v15 = +[AMSLogConfig sharedConfig];
    }
    v20 = [v15 OSLogObject];
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      v21 = [v8 logKey];
      *(_DWORD *)buf = 138543874;
      id v26 = a1;
      __int16 v27 = 2114;
      v28 = v21;
      __int16 v29 = 2114;
      v30 = v11;
      _os_log_impl(&dword_18D554000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification with identifier: %{public}@", buf, 0x20u);
    }
    v18 = +[AMSUserNotification notificationWithPayload:v8 andConfig:v9];
    id v22 = +[AMSUserNotificationCenter postNotification:v18 bag:v10 centerBundleId:v11];
  }
}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

@end