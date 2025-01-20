@interface AMSDAccountSignOutService
+ (BOOL)isConnectionEntitled:(id)a3;
- (void)performAccountSignOutTasksForAccountWithID:(id)a3;
@end

@implementation AMSDAccountSignOutService

+ (BOOL)isConnectionEntitled:(id)a3
{
  v3 = [a3 valueForEntitlement:@"com.apple.private.applemediaservices"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v4 = v3;
  }
  else {
    id v4 = 0;
  }

  unsigned __int8 v5 = [v4 BOOLValue];
  return v5;
}

- (void)performAccountSignOutTasksForAccountWithID:(id)a3
{
  id v4 = a3;
  unsigned __int8 v5 = +[AMSLogConfig sharedConfig];
  if (!v5)
  {
    unsigned __int8 v5 = +[AMSLogConfig sharedConfig];
  }
  v6 = [v5 OSLogObject];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v7 = objc_opt_class();
    v8 = AMSLogKey();
    *(_DWORD *)buf = 138543874;
    uint64_t v14 = v7;
    __int16 v15 = 2114;
    v16 = v8;
    __int16 v17 = 2114;
    id v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Performing sign-out tasks in amsaccountsd for: %{public}@", buf, 0x20u);
  }
  v9 = +[CachedServerDataService sharedService];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10001A3D4;
  v11[3] = &unk_100111FE8;
  v11[4] = self;
  id v12 = v4;
  id v10 = v4;
  [v9 removeDataFor:v10 completionHandler:v11];
}

@end