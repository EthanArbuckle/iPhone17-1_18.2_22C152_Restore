@interface AMSPushParsableBadging
+ (BOOL)shouldSkipAccountCheck;
+ (void)_performLegacyCallbackWithRequest:(id)a3 payload:(id)a4 config:(id)a5 bag:(id)a6 error:(id *)a7;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSPushParsableBadging

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v32 = a5;
  id v9 = AMSSetLogKeyIfNeeded();
  v10 = [[AMSBadgeRequest alloc] initWithPushPayload:v7];
  v11 = +[AMSLogConfig sharedConfig];
  if (!v11)
  {
    v11 = +[AMSLogConfig sharedConfig];
  }
  v12 = [v11 OSLogObject];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    id v13 = v8;
    uint64_t v14 = objc_opt_class();
    v15 = AMSLogKey();
    v16 = [(AMSBadgeRequest *)v10 bundleIdentifier];
    v17 = [(AMSBadgeRequest *)v10 badgeIdentifier];
    *(_DWORD *)buf = 138544386;
    uint64_t v35 = v14;
    id v8 = v13;
    __int16 v36 = 2114;
    v37 = v15;
    __int16 v38 = 2114;
    v39 = v16;
    __int16 v40 = 2114;
    v41 = v17;
    __int16 v42 = 1024;
    BOOL v43 = [(AMSBadgeRequest *)v10 enabled];
    _os_log_impl(&dword_18D554000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Received badging push. Client: %{public}@ Id: %{public}@ enabled: %d", buf, 0x30u);
  }
  v18 = [v8 delegate];
  char v19 = objc_opt_respondsToSelector();

  v20 = [v8 delegate];
  v21 = v20;
  if (v19)
  {
    [v20 pushPayload:v7 withBadgeRequest:v10];

LABEL_16:
    v24 = +[AMSLogConfig sharedConfig];
    if (!v24)
    {
      v24 = +[AMSLogConfig sharedConfig];
    }
    v25 = [v24 OSLogObject];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v29 = objc_opt_class();
      v30 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v35 = v29;
      __int16 v36 = 2114;
      v37 = v30;
      _os_log_impl(&dword_18D554000, v25, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Finished handling badge push.", buf, 0x16u);
    }
    goto LABEL_20;
  }
  char v22 = objc_opt_respondsToSelector();

  if (v22)
  {
    id v33 = 0;
    [a1 _performLegacyCallbackWithRequest:v10 payload:v7 config:v8 bag:v32 error:&v33];
    id v23 = v33;
  }
  else
  {
    AMSError(11, @"Failed To Badge", @"No delegate registered to provide consent", 0);
    id v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;
  if (!v23) {
    goto LABEL_16;
  }
  v25 = +[AMSLogConfig sharedConfig];
  if (!v25)
  {
    v25 = +[AMSLogConfig sharedConfig];
  }
  v26 = [v25 OSLogObject];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
  {
    uint64_t v27 = objc_opt_class();
    v28 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v35 = v27;
    __int16 v36 = 2114;
    v37 = v28;
    __int16 v38 = 2114;
    v39 = v24;
    _os_log_impl(&dword_18D554000, v26, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to handle badge push. %{public}@", buf, 0x20u);
  }
LABEL_20:
}

+ (BOOL)shouldSkipAccountCheck
{
  return 1;
}

+ (void)_performLegacyCallbackWithRequest:(id)a3 payload:(id)a4 config:(id)a5 bag:(id)a6 error:(id *)a7
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a6;
  id v13 = a4;
  uint64_t v14 = [a5 delegate];
  v15 = [v11 bundleIdentifier];
  v16 = [v11 badgeIdentifier];
  char v17 = objc_msgSend(v14, "pushPaylod:shouldUpdateBadgeForBundleIdentifier:badgeIdentifier:enabled:", v13, v15, v16, objc_msgSend(v11, "enabled"));

  if (v17)
  {
    v18 = [v11 bundleIdentifier];
    char v19 = [v11 badgeIdentifier];
    +[AMSUserNotificationCenter badgeBundleId:badgeId:enabled:error:](AMSUserNotificationCenter, "badgeBundleId:badgeId:enabled:error:", v18, v19, [v11 enabled], a7);
  }
  else
  {
    v20 = +[AMSLogConfig sharedConfig];
    if (!v20)
    {
      v20 = +[AMSLogConfig sharedConfig];
    }
    v21 = [v20 OSLogObject];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v22 = objc_opt_class();
      id v23 = AMSLogKey();
      int v29 = 138543618;
      uint64_t v30 = v22;
      __int16 v31 = 2114;
      id v32 = v23;
      _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Not allowed to badge.", (uint8_t *)&v29, 0x16u);
    }
  }
  v24 = [v11 metrics];

  if (v24)
  {
    v25 = [v11 metrics];
    v26 = [v11 bundleIdentifier];
    uint64_t v27 = +[AMSUserNotificationMetricsEvent eventForBadgingForMetricsDictionary:v25 bundleID:v26];

    v28 = +[AMSMetrics internalInstanceUsingBag:v12];
    [v28 enqueueEvent:v27];
  }
}

@end