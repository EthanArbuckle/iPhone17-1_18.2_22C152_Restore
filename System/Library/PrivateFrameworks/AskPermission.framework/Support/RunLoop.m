@interface RunLoop
- (BOOL)performStartupWithError:(id *)a3;
- (void)_run;
- (void)runUntilIdleExit;
@end

@implementation RunLoop

- (BOOL)performStartupWithError:(id *)a3
{
  if (a3) {
    *a3 = 0;
  }
  return 1;
}

- (void)runUntilIdleExit
{
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  dispatch_source_set_event_handler(v3, &stru_100038DE0);
  dispatch_resume(v3);
  id v11 = 0;
  unsigned int v4 = [(RunLoop *)self performStartupWithError:&v11];
  id v5 = v11;
  v6 = v5;
  if (!v4 || v5)
  {
    v7 = +[APLogConfig sharedDaemonConfig];
    if (!v7)
    {
      v7 = +[APLogConfig sharedConfig];
    }
    v8 = [v7 OSLogObject];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = objc_opt_class();
      *(_DWORD *)buf = 138543618;
      v13 = v9;
      __int16 v14 = 2114;
      v15 = v6;
      id v10 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "%{public}@: Failed to startup daemon. Error: %{public}@", buf, 0x16u);
    }
  }
  else
  {
    [(RunLoop *)self _run];
  }
}

- (void)_run
{
  if ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) >= 2)
  {
    do
    {
    }
    while ((CFRunLoopRunInMode(kCFRunLoopDefaultMode, 15.0, 0) - 1) > 1);
  }
  v3 = +[APLogConfig sharedDaemonConfig];
  if (!v3)
  {
    v3 = +[APLogConfig sharedConfig];
  }
  unsigned int v4 = [v3 OSLogObject];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = (id)objc_opt_class();
    id v5 = v7;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@: Stopping for idle-exit", (uint8_t *)&v6, 0xCu);
  }
}

@end