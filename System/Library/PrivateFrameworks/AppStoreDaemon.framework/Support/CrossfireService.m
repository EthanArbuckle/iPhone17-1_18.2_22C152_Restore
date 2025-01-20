@interface CrossfireService
- (void)flushMetricsWithCompletionBlock:(id)a3;
- (void)getAppEventsWithCompletionBlock:(id)a3;
- (void)recordLaunchesWithCompletionBlock:(id)a3;
- (void)recordMetricsWithCompletionBlock:(id)a3;
- (void)reportAppEvent:(id)a3 completionBlock:(id)a4;
- (void)resetMetricsWithCompletionBlock:(id)a3;
- (void)sendMetricsWithCompletionBlock:(id)a3;
@end

@implementation CrossfireService

- (void)flushMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138543618;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] flushMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_100224ED4();
  sub_100224FB0((uint64_t)v9, @"User Request", v4);
}

- (void)getAppEventsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138543618;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] getAppEventsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_100224ED4();
  sub_100225280((uint64_t)v9, v4);
}

- (void)recordLaunchesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138543618;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordLaunchesWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_100224ED4();
  sub_100225534((uint64_t)v9, v4);
}

- (void)recordMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138543618;
    v11 = v6;
    __int16 v12 = 2114;
    v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] recordMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_100224ED4();
  sub_1002257D0((uint64_t)v9, v4);
}

- (void)reportAppEvent:(id)a3 completionBlock:(id)a4
{
  v5 = (void (**)(id, void, void *))a4;
  v6 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = objc_opt_class();
    id v8 = v7;
    v9 = sub_1000159BC((uint64_t)self);
    int v11 = 138543618;
    __int16 v12 = v7;
    __int16 v13 = 2114;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "[%{public}@] reportAppEvent for client: %{public}@", (uint8_t *)&v11, 0x16u);
  }
  if (v5)
  {
    int v10 = ASDErrorWithDescription();
    v5[2](v5, 0, v10);
  }
}

- (void)resetMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    id v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138543618;
    int v11 = v6;
    __int16 v12 = 2114;
    __int16 v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] resetMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_100224ED4();
  sub_100225D64((uint64_t)v9, v4);
}

- (void)sendMetricsWithCompletionBlock:(id)a3
{
  id v4 = a3;
  v5 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_opt_class();
    id v7 = v6;
    id v8 = sub_1000159BC((uint64_t)self);
    int v10 = 138543618;
    int v11 = v6;
    __int16 v12 = 2114;
    __int16 v13 = v8;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "[%{public}@] sendMetricsWithCompletionBlock for client: %{public}@", (uint8_t *)&v10, 0x16u);
  }
  v9 = sub_100224ED4();
  sub_100226128((uint64_t)v9, v4);
}

@end