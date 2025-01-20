@interface AMSPushParsableGenericNotification
+ (BOOL)_shouldPresentAlertForPayload:(id)a3;
+ (id)_generateDialogRequestFromPayload:(id)a3 config:(id)a4;
+ (id)_generateNotificationFromPayload:(id)a3 config:(id)a4;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSPushParsableGenericNotification

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = [v8 clientIdentifier];
  v12 = +[AMSLogConfig sharedPushNotificationConfig];
  if (!v12)
  {
    v12 = +[AMSLogConfig sharedConfig];
  }
  v13 = [v12 OSLogObject];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = [v8 logKey];
    *(_DWORD *)buf = 138543874;
    id v28 = a1;
    __int16 v29 = 2114;
    v30 = v14;
    __int16 v31 = 2114;
    v32 = v11;
    _os_log_impl(&dword_18D554000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Posting notification with identifier: %{public}@", buf, 0x20u);
  }
  if ([a1 _shouldPresentAlertForPayload:v8])
  {
    v15 = [a1 _generateDialogRequestFromPayload:v8 config:v9];
    if (v15)
    {
      v16 = [[AMSSystemAlertDialogTask alloc] initWithRequest:v15];
      v17 = [(AMSSystemAlertDialogTask *)v16 present];
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __75__AMSPushParsableGenericNotification_handleNotificationPayload_config_bag___block_invoke;
      v23[3] = &unk_1E55A3320;
      v24 = v10;
      id v26 = a1;
      id v25 = v8;
      [v17 addFinishBlock:v23];

      v18 = v24;
    }
    else
    {
      v16 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v16)
      {
        v16 = +[AMSLogConfig sharedConfig];
      }
      v18 = [(AMSSystemAlertDialogTask *)v16 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v20 = [v8 logKey];
        *(_DWORD *)buf = 138543618;
        id v28 = a1;
        __int16 v29 = 2114;
        v30 = v20;
        _os_log_impl(&dword_18D554000, v18, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine dialog request.", buf, 0x16u);
      }
    }
  }
  else
  {
    v19 = [[AMSUserNotification alloc] initWithPayload:v8 andConfig:v9];
    if (v19)
    {
      v15 = v19;
      v16 = +[AMSUserNotificationCenter postNotification:v19 bag:v10 centerBundleId:v11];
      [(AMSSystemAlertDialogTask *)v16 waitUntilFinished];
    }
    else
    {
      v16 = +[AMSLogConfig sharedPushNotificationConfig];
      if (!v16)
      {
        v16 = +[AMSLogConfig sharedConfig];
      }
      v21 = [(AMSSystemAlertDialogTask *)v16 OSLogObject];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v22 = [v8 logKey];
        *(_DWORD *)buf = 138543618;
        id v28 = a1;
        __int16 v29 = 2114;
        v30 = v22;
        _os_log_impl(&dword_18D554000, v21, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Failed to determine user notification.", buf, 0x16u);
      }
      v15 = 0;
    }
  }
}

void __75__AMSPushParsableGenericNotification_handleNotificationPayload_config_bag___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  v4 = [[AMSHandleDialogResultTask alloc] initWithResult:v3 bag:*(void *)(a1 + 32)];

  [(AMSTask *)v4 setRunMode:1];
  v5 = [(AMSHandleDialogResultTask *)v4 perform];
  id v11 = 0;
  [v5 resultWithError:&v11];
  id v6 = v11;

  if (v6)
  {
    v7 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    id v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      uint64_t v9 = *(void *)(a1 + 48);
      id v10 = [*(id *)(a1 + 40) logKey];
      *(_DWORD *)buf = 138543874;
      uint64_t v13 = v9;
      __int16 v14 = 2114;
      v15 = v10;
      __int16 v16 = 2114;
      id v17 = v6;
      _os_log_impl(&dword_18D554000, v8, OS_LOG_TYPE_ERROR, "%{public}@: [%{public}@] Dialog handling failed with error: %{public}@", buf, 0x20u);
    }
  }
}

+ (BOOL)_shouldPresentAlertForPayload:(id)a3
{
  id v3 = a3;
  v4 = [v3 clientIdentifier];
  uint64_t v5 = [v4 length];

  if (v5) {
    BOOL v6 = [v3 alertType] != 2;
  }
  else {
    BOOL v6 = 1;
  }

  return v6;
}

+ (id)_generateDialogRequestFromPayload:(id)a3 config:(id)a4
{
  id v4 = a3;
  uint64_t v5 = [v4 aps];
  id v6 = [v5 objectForKeyedSubscript:@"alert"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v7 = v6;

    if (!v7)
    {
      uint64_t v9 = 0;
      goto LABEL_25;
    }
    id v8 = [v7 objectForKeyedSubscript:@"body"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v8;
    }
    else {
      id v6 = 0;
    }

    id v10 = [v4 aps];
    id v11 = [v10 objectForKeyedSubscript:@"uuid"];

    v12 = [v7 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v13 = v12;
    }
    else {
      id v13 = 0;
    }

    __int16 v14 = [v7 objectForKeyedSubscript:@"ok"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v15 = v14;

      if (v15)
      {
        id v16 = v15;
        id v17 = v16;
LABEL_16:

        v19 = [v7 objectForKeyedSubscript:@"cancel"];
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          id v20 = v19;
        }
        else {
          id v20 = 0;
        }

        v21 = (void *)MEMORY[0x1E4F1CB10];
        v22 = [v4 URLString];
        v23 = [v21 URLWithString:v22];

        uint64_t v9 = [[AMSDialogRequest alloc] initWithTitle:v13 message:v6];
        [(AMSDialogRequest *)v9 setIdentifier:v11];
        if ([v20 length])
        {
          v24 = +[AMSDialogAction actionWithTitle:v20 style:2];
          [(AMSDialogRequest *)v9 addButtonAction:v24];
        }
        if ([v17 length])
        {
          id v25 = +[AMSDialogAction actionWithTitle:v17];
          [v25 setDeepLink:v23];
          [v25 setInferLinkDestination:0];
          [(AMSDialogRequest *)v9 addButtonAction:v25];
          [(AMSDialogRequest *)v9 setDefaultAction:v25];
        }
        goto LABEL_24;
      }
    }
    else
    {
    }
    uint64_t v18 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
    id v17 = [v18 localizedStringForKey:@"OK" value:&stru_1EDCA7308 table:0];

    id v16 = 0;
    goto LABEL_16;
  }
  id v7 = 0;
  uint64_t v9 = 0;
LABEL_24:

LABEL_25:
  return v9;
}

+ (id)_generateNotificationFromPayload:(id)a3 config:(id)a4
{
  v37[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 aps];
  id v8 = [v7 objectForKeyedSubscript:@"alert"];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    id v9 = 0;
    goto LABEL_6;
  }
  id v9 = v8;

  if (!v9)
  {
LABEL_6:
    v12 = 0;
    goto LABEL_22;
  }
  id v10 = [v9 objectForKeyedSubscript:@"body"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  id v13 = [v9 objectForKeyedSubscript:@"title"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  id v15 = [v9 objectForKeyedSubscript:@"ok"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_15;
  }
  id v16 = v15;

  if (!v16)
  {
LABEL_15:
    v19 = objc_msgSend(MEMORY[0x1E4F28B50], "ams_AppleMediaServicesBundle");
    uint64_t v18 = [v19 localizedStringForKey:@"OK" value:&stru_1EDCA7308 table:0];

    id v17 = 0;
    goto LABEL_16;
  }
  id v17 = v16;
  uint64_t v18 = v17;
LABEL_16:

  id v20 = (void *)MEMORY[0x1E4F1CB10];
  v21 = [v5 URLString];
  v22 = [v20 URLWithString:v21];

  v23 = [v5 clientIdentifier];
  if ([v14 length])
  {
    id v24 = v14;
    id v25 = v18;
    v35 = v24;
    v12 = [[AMSUserNotification alloc] initWithTitle:v24];
    id v36 = v11;
    [(AMSUserNotification *)v12 setInformativeText:v11];
    id v26 = [v5 logKey];
    [(AMSUserNotification *)v12 setLogKey:v26];

    v27 = [v5 account];
    [(AMSUserNotification *)v12 setAccount:v27];

    [(AMSUserNotification *)v12 setCenterBundleIdentifier:v23];
    id v28 = [v6 userNotificationExtensionId];
    [(AMSUserNotification *)v12 setCategoryIdentifier:v28];

    __int16 v29 = [v5 aps];
    v30 = [v29 objectForKeyedSubscript:@"uuid"];

    if ([v30 length])
    {
      __int16 v31 = [NSString stringWithFormat:@"com.apple.ams+%@", v30];
      [(AMSUserNotification *)v12 setIdentifier:v31];
    }
    v32 = [[AMSUserNotificationAction alloc] initWithTitle:v18];
    [(AMSUserNotificationAction *)v32 setDefaultURL:v22];
    v37[0] = v32;
    uint64_t v33 = [MEMORY[0x1E4F1C978] arrayWithObjects:v37 count:1];
    [(AMSUserNotification *)v12 setButtonActions:v33];

    uint64_t v18 = v25;
    [(AMSUserNotification *)v12 setDefaultAction:v32];

    id v14 = v35;
    id v11 = v36;
  }
  else
  {
    v12 = 0;
  }

LABEL_22:
  return v12;
}

@end