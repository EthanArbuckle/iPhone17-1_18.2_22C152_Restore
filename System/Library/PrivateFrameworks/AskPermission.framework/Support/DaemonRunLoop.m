@interface DaemonRunLoop
- (BOOL)performStartupWithError:(id *)a3;
@end

@implementation DaemonRunLoop

- (BOOL)performStartupWithError:(id *)a3
{
  v4 = +[APLogConfig sharedDaemonConfig];
  if (!v4)
  {
    v4 = +[APLogConfig sharedConfig];
  }
  v5 = [v4 OSLogObject];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    id v14 = (id)objc_opt_class();
    __int16 v15 = 2080;
    v16 = "Nov 10 2024";
    __int16 v17 = 2080;
    v18 = "22:13:31";
    id v6 = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@: Starting askpermissiond (%s - %s)", buf, 0x20u);
  }
  v7 = objc_alloc_init(DaemonStartupTask);
  v8 = [(DaemonStartupTask *)v7 perform];
  id v12 = 0;
  unsigned __int8 v9 = [v8 resultWithError:&v12];
  id v10 = v12;

  if (a3) {
    *a3 = v10;
  }

  return v9;
}

@end