@interface AMSDPushParsableFetchDataCache
+ (id)_dataCacheService;
+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5;
@end

@implementation AMSDPushParsableFetchDataCache

+ (void)handleNotificationPayload:(id)a3 config:(id)a4 bag:(id)a5
{
  id v6 = a3;
  v7 = [v6 accountIdentifier];
  if (!v7)
  {
    id v10 = +[AMSLogConfig sharedAccountsConfig];
    if (!v10)
    {
      id v10 = +[AMSLogConfig sharedConfig];
    }
    v11 = [v10 OSLogObject];
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_26;
    }
    uint64_t v12 = objc_opt_class();
    v13 = AMSLogKey();
    *(_DWORD *)buf = 138543618;
    uint64_t v27 = v12;
    __int16 v28 = 2114;
    v29 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Skipping fetch data push - no account", buf, 0x16u);
    goto LABEL_25;
  }
  v8 = [v6 aps];
  v9 = [v8 objectForKeyedSubscript:@"payloadType"];

  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v10 = v9;
  }
  else {
    id v10 = 0;
  }

  if ([v10 isEqualToString:@"mercury:marketing-cache-sync"])
  {
    v14 = [v6 aps];
    v15 = [v14 objectForKeyedSubscript:@"cacheTypeIds"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v15;
    }
    else {
      v11 = 0;
    }

    if (![v11 count]) {
      goto LABEL_26;
    }
    v18 = +[AMSLogConfig sharedAccountsConfig];
    if (!v18)
    {
      v18 = +[AMSLogConfig sharedConfig];
    }
    v19 = [v18 OSLogObject];
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = objc_opt_class();
      v21 = AMSLogKey();
      *(_DWORD *)buf = 138543618;
      uint64_t v27 = v20;
      __int16 v28 = 2114;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Updating data cache", buf, 0x16u);
    }
    v13 = [a1 _dataCacheService];
    v22 = +[NSSet setWithArray:v11];
    v23 = [v13 updateCacheForAccountDSID:v7 withCacheTypeIDs:v22];
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100050C50;
    v25[3] = &unk_100113E60;
    v25[4] = a1;
    [v23 addFinishBlock:v25];

LABEL_25:
LABEL_26:

    goto LABEL_27;
  }
  if ([v10 isEqualToString:@"commerce:account-cache-sync"])
  {
    v16 = [v6 aps];
    v17 = [v16 objectForKeyedSubscript:@"payloadVersion"];

    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v11 = v17;
    }
    else {
      v11 = 0;
    }

    if ([v11 longLongValue] != (id)1) {
      goto LABEL_26;
    }
    v13 = +[CachedServerDataService sharedService];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100050D80;
    v24[3] = &unk_100113E80;
    v24[4] = a1;
    objc_msgSend(v13, "scheduleSyncFromPushWithDsid:completionHandler:", objc_msgSend(v7, "unsignedLongLongValue"), v24);
    goto LABEL_25;
  }
LABEL_27:
}

+ (id)_dataCacheService
{
  id v2 = objc_alloc_init((Class)AMSServerDataCacheService);
  return v2;
}

@end