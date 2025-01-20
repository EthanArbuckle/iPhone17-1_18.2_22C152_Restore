@interface AMSDXPCActivityScheduler
- (void)removeActivity:(id)a3;
- (void)scheduleIfNeededActivity:(id)a3;
@end

@implementation AMSDXPCActivityScheduler

- (void)scheduleIfNeededActivity:(id)a3
{
  id v4 = a3;
  id v5 = [v4 activityIdentifier];
  v6 = (const char *)[v5 UTF8String];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100062C34;
  v8[3] = &unk_1001147E8;
  id v9 = v4;
  v10 = self;
  id v7 = v4;
  xpc_activity_register(v6, XPC_ACTIVITY_CHECK_IN, v8);
}

- (void)removeActivity:(id)a3
{
  id v3 = a3;
  id v4 = +[AMSLogConfig sharedAccountsDaemonConfig];
  if (!v4)
  {
    id v4 = +[AMSLogConfig sharedConfig];
  }
  id v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = AMSLogKey();
    int v9 = 138543874;
    uint64_t v10 = v6;
    __int16 v11 = 2114;
    v12 = v7;
    __int16 v13 = 2114;
    id v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: [%{public}@] Unregistering activity %{public}@", (uint8_t *)&v9, 0x20u);
  }
  id v8 = v3;
  xpc_activity_unregister((const char *)[v8 UTF8String]);
}

@end