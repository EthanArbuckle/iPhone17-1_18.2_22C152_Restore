@interface WatchDogTimer
- (WatchDogTimer)initWithQueue:(id)a3 withName:(id)a4 withTimeout:(double)a5 withCallback:(id)a6;
- (void)cancel;
- (void)dealloc;
@end

@implementation WatchDogTimer

- (WatchDogTimer)initWithQueue:(id)a3 withName:(id)a4 withTimeout:(double)a5 withCallback:(id)a6
{
  v10 = a3;
  id v11 = a4;
  id v12 = a6;
  v27.receiver = self;
  v27.super_class = (Class)WatchDogTimer;
  v13 = [(WatchDogTimer *)&v27 initWithDomain:"WatchDogTimer"];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_name, a4);
    v15 = [(WatchDogTimer *)v14 logHandle];
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      name = v14->_name;
      *(_DWORD *)buf = 138543618;
      v29 = name;
      __int16 v30 = 2048;
      double v31 = a5;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ waiting %f seconds", buf, 0x16u);
    }

    dispatch_source_t v17 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v10);
    timer = v14->_timer;
    v14->_timer = (OS_dispatch_source *)v17;

    v19 = v14->_timer;
    dispatch_time_t v20 = dispatch_time(0, (uint64_t)(a5 * 1000000000.0));
    dispatch_source_set_timer(v19, v20, 0xFFFFFFFFFFFFFFFFLL, 0);
    v21 = v14->_timer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000E0FC;
    handler[3] = &unk_100049008;
    v24 = v14;
    double v26 = a5;
    id v25 = v12;
    dispatch_source_set_event_handler(v21, handler);
    dispatch_resume((dispatch_object_t)v14->_timer);
  }
  return v14;
}

- (void)dealloc
{
  v3 = [(WatchDogTimer *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    *(_DWORD *)buf = 138543362;
    v7 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Goodbye from %{public}@ timer", buf, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_timer);
  v5.receiver = self;
  v5.super_class = (Class)WatchDogTimer;
  [(WatchDogTimer *)&v5 dealloc];
}

- (void)cancel
{
  v3 = [(WatchDogTimer *)self logHandle];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    name = self->_name;
    int v5 = 138543362;
    v6 = name;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Canceling %{public}@ timer", (uint8_t *)&v5, 0xCu);
  }

  dispatch_source_cancel((dispatch_source_t)self->_timer);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end