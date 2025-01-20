@interface AMSDPushParsableAccountFlagsUpdated
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsableAccountFlagsUpdated

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v5 = a3;
  v6 = +[AMSLogConfig sharedPushNotificationConfig];
  if (!v6)
  {
    v6 = +[AMSLogConfig sharedConfig];
  }
  v7 = [v6 OSLogObject];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    id v35 = (id)objc_opt_class();
    id v8 = v35;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@: Received a push notification to update an account's account flags.", buf, 0xCu);
  }
  if (_os_feature_enabled_impl())
  {
    v9 = +[AMSLogConfig sharedAccountsDaemonConfig];
    if (!v9)
    {
      v9 = +[AMSLogConfig sharedConfig];
    }
    v10 = [v9 OSLogObject];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = objc_opt_class();
      *(_DWORD *)buf = 138543362;
      id v35 = v11;
      id v12 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@: Skipping account flag update, since account data has replaced it.", buf, 0xCu);
    }
  }
  else
  {
    v13 = [v5 account];
    v9 = v13;
    if (v13)
    {
      uint64_t v14 = objc_msgSend(v13, "ams_accountFlags");
      v15 = (void *)v14;
      v16 = &__NSDictionary0__struct;
      if (v14) {
        v16 = (void *)v14;
      }
      v10 = v16;

      v17 = [v5 objectForKeyedSubscript:@"accountFlags"];
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v18 = v17;
      }
      else {
        v18 = 0;
      }

      if (v18 && ([v10 isEqualToDictionary:v18] & 1) == 0)
      {
        v24 = [v10 ams_dictionaryByAddingEntriesFromDictionary:v18];
        objc_msgSend(v9, "ams_setAccountFlags:", v24);

        objc_msgSend(v9, "ams_setDisableAccountFlagsSync:", 1);
        v25 = +[ACAccountStore ams_sharedAccountStore];
        v26 = objc_msgSend(v25, "ams_saveAccount:", v9);
        id v33 = 0;
        unsigned __int8 v27 = [v26 resultWithError:&v33];
        id v28 = v33;

        if ((v27 & 1) == 0)
        {
          v29 = +[AMSLogConfig sharedAccountsDaemonConfig];
          if (!v29)
          {
            v29 = +[AMSLogConfig sharedConfig];
          }
          v30 = [v29 OSLogObject];
          if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
          {
            v31 = objc_opt_class();
            *(_DWORD *)buf = 138543618;
            id v35 = v31;
            __int16 v36 = 2114;
            id v37 = v28;
            id v32 = v31;
            _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%{public}@: Failed to save the account after updating its account flags. error = %{public}@", buf, 0x16u);
          }
        }
      }
    }
    else
    {
      v10 = +[AMSLogConfig sharedAccountsDaemonConfig];
      if (!v10)
      {
        v10 = +[AMSLogConfig sharedConfig];
      }
      v18 = [v10 OSLogObject];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v19 = objc_opt_class();
        id v20 = v19;
        v21 = [v5 accountIdentifier];
        v22 = [v21 stringValue];
        v23 = AMSHashIfNeeded();
        *(_DWORD *)buf = 138543618;
        id v35 = v19;
        __int16 v36 = 2114;
        id v37 = v23;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%{public}@: Unable to update an account's account flags. No account exists with the specified DSID, %{public}@.", buf, 0x16u);
      }
    }
  }
}

@end