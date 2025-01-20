@interface BuddyDisplayMonitor
- (BuddyDisplayMonitor)init;
- (id)completionBlock;
- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5;
- (void)dealloc;
- (void)setCompletionBlock:(id)a3;
- (void)wakeDisplay:(id)a3;
@end

@implementation BuddyDisplayMonitor

- (BuddyDisplayMonitor)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyDisplayMonitor;
  id location = [(BuddyDisplayMonitor *)&v5 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v2 = +[BLSBacklight sharedBacklight];
    [v2 addObserver:location];
  }
  v3 = (BuddyDisplayMonitor *)location;
  objc_storeStrong(&location, 0);
  return v3;
}

- (void)dealloc
{
  objc_super v5 = self;
  SEL v4 = a2;
  id v2 = +[BLSBacklight sharedBacklight];
  [v2 removeObserver:v5];

  v3.receiver = v5;
  v3.super_class = (Class)BuddyDisplayMonitor;
  [(BuddyDisplayMonitor *)&v3 dealloc];
}

- (void)wakeDisplay:(id)a3
{
  v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  objc_super v3 = &_dispatch_main_q;
  dispatch_assert_queue_V2((dispatch_queue_t)v3);

  id v4 = +[BLSBacklight sharedBacklight];
  id v5 = [v4 backlightState];

  if (v5 == (id)2)
  {
    if (location[0]) {
      (*((void (**)(void))location[0] + 2))();
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      SEL v6 = oslog;
      os_log_type_t v7 = v14;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "Waking the screen...", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    [(BuddyDisplayMonitor *)v17 setCompletionBlock:location[0]];
    id v12 = @"post-migration/restore wake for reboot";
    id v11 = [objc_alloc((Class)BLSBacklightChangeRequest) initWithRequestedActivityState:1 explanation:v12 timestamp:mach_continuous_time() sourceEvent:10 sourceEventMetadata:0];
    id v8 = +[BLSBacklight sharedBacklight];
    id v10 = [v8 performChangeRequest:v11];

    if (v10)
    {
      os_log_t v9 = (os_log_t)(id)_BYLoggingFacility();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        sub_10004BB7C((uint64_t)v18, (uint64_t)v10);
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to wake the screen: %{public}@", v18, 0xCu);
      }
      objc_storeStrong((id *)&v9, 0);
      if (location[0]) {
        (*((void (**)(void))location[0] + 2))();
      }
    }
    objc_storeStrong(&v10, 0);
    objc_storeStrong(&v11, 0);
    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong(location, 0);
}

- (void)backlight:(id)a3 didCompleteUpdateToState:(int64_t)a4 forEvent:(id)a5
{
  id v12 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  int64_t v10 = a4;
  id v9 = 0;
  objc_storeStrong(&v9, a5);
  id v7 = [(BuddyDisplayMonitor *)v12 completionBlock];
  LOBYTE(a5) = v7 == 0;

  if ((a5 & 1) == 0 && v10 == 2)
  {
    id v8 = (void (**)(void))[(BuddyDisplayMonitor *)v12 completionBlock];
    v8[2](v8);

    [(BuddyDisplayMonitor *)v12 setCompletionBlock:0];
  }
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end