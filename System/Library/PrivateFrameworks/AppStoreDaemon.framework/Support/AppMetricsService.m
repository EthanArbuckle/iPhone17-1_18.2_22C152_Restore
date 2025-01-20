@interface AppMetricsService
- (AppMetricsService)init;
- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4;
@end

@implementation AppMetricsService

- (AppMetricsService)init
{
  v7.receiver = self;
  v7.super_class = (Class)AppMetricsService;
  v2 = [(AppMetricsService *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.appstored.AppMetricsService", v3);
    dispatchQueue = v2->_dispatchQueue;
    v2->_dispatchQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)getMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  objc_super v7 = sub_1000159BC((uint64_t)self);
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v8;
    __int16 v20 = 2114;
    v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] getMetricsEventsForType for client: %{public}@", buf, 0x16u);
  }

  v10 = sub_1002E1CF4();
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1002A32A0;
  v14[3] = &unk_100525480;
  id v16 = v7;
  id v17 = v6;
  v15 = v8;
  id v11 = v7;
  v12 = v8;
  id v13 = v6;
  sub_1002E21B4((uint64_t)v10, a3, 7, v14);
}

- (void)postMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  objc_super v7 = sub_1000159BC((uint64_t)self);
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] postMetricsEventsForType for client: %{public}@", buf, 0x16u);
  }

  v10 = sub_1002E1CF4();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A3518;
  v12[3] = &unk_1005230F0;
  id v13 = v6;
  id v11 = v6;
  sub_1002E384C((uint64_t)v10, a3, 7, v12);
}

- (void)recordMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  objc_super v7 = sub_1000159BC((uint64_t)self);
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] recordMetricsEventsForType for client: %{public}@", buf, 0x16u);
  }

  v10 = sub_1002E1CF4();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A36B0;
  v12[3] = &unk_1005230F0;
  id v13 = v6;
  id v11 = v6;
  sub_1002E4B80((uint64_t)v10, a3, 7, v12);
}

- (void)resetMetricsEventsForType:(int64_t)a3 withReplyHandler:(id)a4
{
  id v6 = a4;
  objc_super v7 = sub_1000159BC((uint64_t)self);
  v8 = objc_alloc_init(_TtC9appstored6LogKey);
  v9 = ASDLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v15 = v8;
    __int16 v16 = 2114;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "[%@] resetMetricsEventsForType for client: %{public}@", buf, 0x16u);
  }

  v10 = sub_1002E1CF4();
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1002A3848;
  v12[3] = &unk_1005230F0;
  id v13 = v6;
  id v11 = v6;
  sub_1002E4D40((uint64_t)v10, a3, 7, v12);
}

- (void).cxx_destruct
{
}

@end