@interface AMSDPushParsableDismissQRDialog
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsableDismissQRDialog

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v5 = a3;
  v6 = [v5 accountIdentifier];
  if (!v6)
  {
    v7 = +[AMSLogConfig sharedPushNotificationConfig];
    if (!v7)
    {
      v7 = +[AMSLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = objc_opt_class();
      v10 = AMSLogKey();
      int v18 = 138543618;
      uint64_t v19 = v9;
      __int16 v20 = 2114;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] No account passed in the payload to dismiss a QR dialog", (uint8_t *)&v18, 0x16u);
    }
  }
  v11 = [v5 objectForKeyedSubscript:@"PINCode"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  v13 = [v5 objectForKeyedSubscript:@"dialogId"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v14 = v13;
  }
  else {
    id v14 = 0;
  }

  v15 = v12;
  if (v12 || (v15 = v14) != 0)
  {
    id v16 = v15;
    v17 = +[AMSDDismissQRDialogService sharedService];
    [v17 notifyDismissDialogWithIdentifier:v16];
  }
  else
  {
    id v16 = 0;
  }
}

@end