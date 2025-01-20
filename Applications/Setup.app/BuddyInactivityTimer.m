@interface BuddyInactivityTimer
- (BuddyInactivityTimer)init;
- (PCPersistentTimer)timer;
- (void)_batteryStateDidChange;
- (void)_enableShelfLifeMode;
- (void)_removePowerLog;
- (void)_timerFired:(id)a3;
- (void)setTimer:(id)a3;
- (void)start;
- (void)stop;
@end

@implementation BuddyInactivityTimer

- (BuddyInactivityTimer)init
{
  SEL v6 = a2;
  id location = 0;
  v5.receiver = self;
  v5.super_class = (Class)BuddyInactivityTimer;
  id location = [(BuddyInactivityTimer *)&v5 init];
  objc_storeStrong(&location, location);
  if (location)
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:location selector:"_batteryStateDidChange" name:UIDeviceBatteryStateDidChangeNotification object:0];
    objc_storeStrong(&v4, 0);
  }
  v2 = (BuddyInactivityTimer *)location;
  objc_storeStrong(&location, 0);
  return v2;
}

- (void)stop
{
  v10 = self;
  oslog[1] = (os_log_t)a2;
  v2 = [(BuddyInactivityTimer *)self timer];
  BOOL v3 = v2 == 0;

  if (!v3)
  {
    oslog[0] = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v8 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
    {
      id v4 = oslog[0];
      os_log_type_t v5 = v8;
      sub_10004B24C(v7);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Stopping inactivity timer...", (uint8_t *)v7, 2u);
    }
    objc_storeStrong((id *)oslog, 0);
    SEL v6 = [(BuddyInactivityTimer *)v10 timer];
    [(PCPersistentTimer *)v6 invalidate];

    [(BuddyInactivityTimer *)v10 setTimer:0];
  }
}

- (void)start
{
  v24 = self;
  SEL v23 = a2;
  v2 = [(BuddyInactivityTimer *)self timer];

  if (!v2)
  {
    BOOL v3 = +[UIApplication sharedApplication];
    id v4 = [(UIApplication *)v3 applicationState];

    id v22 = v4;
    if (v4 == (id)2 || v22 == (id)1)
    {
      v7 = +[UIDevice currentDevice];
      id v8 = [(UIDevice *)v7 batteryState];

      if (v8 == (id)1)
      {
        v10 = dispatch_get_global_queue(0, 0);
        block = _NSConcreteStackBlock;
        int v12 = -1073741824;
        int v13 = 0;
        v14 = sub_1001430C0;
        v15 = &unk_1002B0D20;
        v16 = v24;
        dispatch_async(v10, &block);

        objc_storeStrong((id *)&v16, 0);
      }
      else
      {
        os_log_t v18 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v17 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          v9 = +[UIDevice currentDevice];
          sub_100046588((uint64_t)v25, [(UIDevice *)v9 batteryState]);
          _os_log_impl((void *)&_mh_execute_header, v18, v17, "Device is not unplugged (%ld); not starting inactivity timer...",
            v25,
            0xCu);
        }
        objc_storeStrong((id *)&v18, 0);
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v20 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v5 = oslog;
        os_log_type_t v6 = v20;
        sub_10004B24C(buf);
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "Setup is still active; not starting inactivity timer...",
          buf,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
    }
  }
}

- (void)_timerFired:(id)a3
{
  os_log_type_t v17 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v15 = (id)_BYLoggingFacility();
  os_log_type_t v14 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v3 = v15;
    os_log_type_t v4 = v14;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v3, v4, "Inactivity timer fired; determining if we should shutdown...",
      buf,
      2u);
  }
  objc_storeStrong(&v15, 0);
  os_log_type_t v5 = [(BuddyInactivityTimer *)v17 timer];
  [(PCPersistentTimer *)v5 invalidate];

  [(BuddyInactivityTimer *)v17 setTimer:0];
  os_log_type_t v6 = +[FMDFMIPManager sharedInstance];
  v7 = _NSConcreteStackBlock;
  int v8 = -1073741824;
  int v9 = 0;
  v10 = sub_1001436E0;
  v11 = &unk_1002B3938;
  int v12 = v17;
  [(FMDFMIPManager *)v6 activationLockInfoFromDeviceWithCompletion:&v7];

  objc_storeStrong((id *)&v12, 0);
  objc_storeStrong(location, 0);
}

- (void)_batteryStateDidChange
{
}

- (void)_removePowerLog
{
  os_log_t oslog[2] = &self->super;
  oslog[1] = (os_log_t)a2;
  oslog[0] = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog[0], OS_LOG_TYPE_DEFAULT))
  {
    v2 = oslog[0];
    os_log_type_t v3 = v15;
    sub_10004B24C(buf);
    _os_log_impl((void *)&_mh_execute_header, v2, v3, "Removing power log...", buf, 2u);
  }
  objc_storeStrong((id *)oslog, 0);
  if (+[BuddyPowerLog removeLog])
  {
    os_log_t v13 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v12 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      os_log_type_t v4 = v13;
      os_log_type_t v5 = v12;
      sub_10004B24C(v11);
      _os_log_impl((void *)&_mh_execute_header, v4, v5, "Successfully removed power log", v11, 2u);
    }
    objc_storeStrong((id *)&v13, 0);
  }
  else
  {
    os_log_t v10 = (os_log_t)(id)_BYLoggingFacility();
    char v9 = 16;
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      os_log_type_t v6 = v10;
      os_log_type_t v7 = v9;
      sub_10004B24C(v8);
      _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Failed to remove power log", (uint8_t *)v8, 2u);
    }
    objc_storeStrong((id *)&v10, 0);
  }
}

- (void)_enableShelfLifeMode
{
  v34 = self;
  SEL v33 = a2;
  uint64_t v32 = MGGetProductType();
  if (v32 == 1169082144 || v32 == 3001488778 || v32 == 3885279870 || v32 == 4201643249)
  {
    id location = (id)_BYLoggingFacility();
    os_log_type_t v30 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location, OS_LOG_TYPE_DEFAULT))
    {
      v2 = location;
      os_log_type_t v3 = v30;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Not enabling shelf life mode; hardware supports older variant",
        buf,
        2u);
    }
    objc_storeStrong(&location, 0);
  }
  else
  {
    id v28 = objc_alloc_init(BuddySMC);
    id v27 = @"BCSL";
    if ([v28 hasKey:@"BCSL"])
    {
      char v22 = 1;
      if ([v28 writeNumber:1 forKey:@"BCSL"])
      {
        id v18 = [v28 numberForKey:@"BCSL"];
        if ([v18 intValue] == 2)
        {
          os_log_t v17 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v16 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
          {
            int v8 = v17;
            os_log_type_t v9 = v16;
            sub_10004B24C(v15);
            _os_log_impl((void *)&_mh_execute_header, v8, v9, "Successfully enabled shelf life mode", v15, 2u);
          }
          objc_storeStrong((id *)&v17, 0);
        }
        else
        {
          os_log_t v14 = (os_log_t)(id)_BYLoggingFacility();
          char v13 = 16;
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            os_log_t v10 = v14;
            os_log_type_t v11 = v13;
            sub_10004B24C(v12);
            _os_log_error_impl((void *)&_mh_execute_header, v10, v11, "Failed to validate shelf life mode was enabled", (uint8_t *)v12, 2u);
          }
          objc_storeStrong((id *)&v14, 0);
        }
        objc_storeStrong(&v18, 0);
        int v23 = 0;
      }
      else
      {
        os_log_t v21 = (os_log_t)(id)_BYLoggingFacility();
        char v20 = 16;
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          os_log_type_t v6 = v21;
          os_log_type_t v7 = v20;
          sub_10004B24C(v19);
          _os_log_error_impl((void *)&_mh_execute_header, v6, v7, "Failed to enable shelf life mode", v19, 2u);
        }
        objc_storeStrong((id *)&v21, 0);
        int v23 = 1;
      }
    }
    else
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v25 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v4 = oslog;
        os_log_type_t v5 = v25;
        sub_10004B24C(v24);
        _os_log_impl((void *)&_mh_execute_header, v4, v5, "Not enabling shelf life mode; hardware does not support it",
          v24,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      int v23 = 1;
    }
    objc_storeStrong(&v27, 0);
    objc_storeStrong(&v28, 0);
  }
}

- (PCPersistentTimer)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
}

- (void).cxx_destruct
{
}

@end