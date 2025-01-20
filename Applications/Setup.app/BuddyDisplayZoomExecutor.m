@interface BuddyDisplayZoomExecutor
- (BOOL)chosenByUser;
- (BOOL)commitIfNeededWithRelaunchURL:(id)a3 transitionWithScreenshot:(BOOL)a4;
- (BOOL)requiresCommit;
- (DBSDisplayZoomMode)pendingMode;
- (id)willCommit;
- (void)commitWithRelaunchURL:(id)a3 transitionWithScreenshot:(BOOL)a4;
- (void)setChosenByUser:(BOOL)a3;
- (void)setPendingMode:(id)a3;
- (void)setPendingOption:(unint64_t)a3 chosenByUser:(BOOL)a4;
- (void)setWillCommit:(id)a3;
@end

@implementation BuddyDisplayZoomExecutor

- (void)setPendingOption:(unint64_t)a3 chosenByUser:(BOOL)a4
{
  v14 = self;
  SEL v13 = a2;
  unint64_t v12 = a3;
  BOOL v11 = a4;
  os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
  os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    id location = (id)DBSStringForDisplayZoomOption();
    sub_10004B238((uint64_t)buf, (uint64_t)location);
    _os_log_impl((void *)&_mh_execute_header, oslog, v9, "Set pending Display Zoom option to %@", buf, 0xCu);

    objc_storeStrong(&location, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  [(BuddyDisplayZoomExecutor *)v14 setChosenByUser:v11];
  id v4 = +[DBSDisplayZoomConfigurationController defaultController];
  id v5 = [v4 displayZoomModes];
  id v6 = (id)DBSStringForDisplayZoomOption();
  id v7 = [v5 objectForKeyedSubscript:v6];
  [(BuddyDisplayZoomExecutor *)v14 setPendingMode:v7];
}

- (BOOL)requiresCommit
{
  v10 = self;
  location[1] = (id)a2;
  v2 = [(BuddyDisplayZoomExecutor *)self pendingMode];
  BOOL v3 = v2 == 0;

  if (v3)
  {
    return 0;
  }
  else
  {
    id v4 = +[DBSDisplayZoomConfigurationController defaultController];
    location[0] = [v4 currentDisplayZoomMode];

    id v5 = [location[0] displayZoomOption];
    id v6 = [(BuddyDisplayZoomExecutor *)v10 pendingMode];
    id v7 = [(DBSDisplayZoomMode *)v6 displayZoomOption];

    BOOL v11 = v5 != v7;
    objc_storeStrong(location, 0);
  }
  return v11;
}

- (BOOL)commitIfNeededWithRelaunchURL:(id)a3 transitionWithScreenshot:(BOOL)a4
{
  SEL v13 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v11 = a4;
  if ([(BuddyDisplayZoomExecutor *)v13 requiresCommit])
  {
    [(BuddyDisplayZoomExecutor *)v13 commitWithRelaunchURL:location[0] transitionWithScreenshot:v11];
    char v14 = 1;
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v9 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      id v5 = oslog;
      os_log_type_t v6 = v9;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Pending Display Zoom already matches current mode; not committing change",
        buf,
        2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    char v14 = 0;
  }
  objc_storeStrong(location, 0);
  return v14 & 1;
}

- (void)commitWithRelaunchURL:(id)a3 transitionWithScreenshot:(BOOL)a4
{
  v22 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v20 = a4;
  if ([(BuddyDisplayZoomExecutor *)v22 chosenByUser])
  {
    CFStringRef v25 = @"choice";
    id v5 = [(BuddyDisplayZoomExecutor *)v22 pendingMode];
    [(DBSDisplayZoomMode *)v5 displayZoomOption];
    id v6 = (id)DBSStringForDisplayZoomOption();
    id v26 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v26 forKeys:&v25 count:1];
    AnalyticsSendEvent();
  }
  id v8 = [(BuddyDisplayZoomExecutor *)v22 willCommit];

  if (v8)
  {
    os_log_type_t v9 = (void (**)(void))[(BuddyDisplayZoomExecutor *)v22 willCommit];
    v9[2](v9);
  }
  if (location[0])
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      v10 = [(BuddyDisplayZoomExecutor *)v22 pendingMode];
      [(DBSDisplayZoomMode *)v10 displayZoomOption];
      id v17 = (id)DBSStringForDisplayZoomOption();
      sub_100051470((uint64_t)buf, (uint64_t)v17, (uint64_t)location[0]);
      _os_log_impl((void *)&_mh_execute_header, oslog, v18, "Committing Display Zoom mode %@ with relaunch URL %@...", buf, 0x16u);

      objc_storeStrong(&v17, 0);
    }
    objc_storeStrong((id *)&oslog, 0);
  }
  else
  {
    os_log_t v16 = (os_log_t)(id)_BYLoggingFacility();
    os_log_type_t v15 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      BOOL v11 = [(BuddyDisplayZoomExecutor *)v22 pendingMode];
      [(DBSDisplayZoomMode *)v11 displayZoomOption];
      id v14 = (id)DBSStringForDisplayZoomOption();
      sub_10004B238((uint64_t)v23, (uint64_t)v14);
      _os_log_impl((void *)&_mh_execute_header, v16, v15, "Committing Display Zoom mode %@...", v23, 0xCu);

      objc_storeStrong(&v14, 0);
    }
    objc_storeStrong((id *)&v16, 0);
  }
  id v12 = +[DBSDisplayZoomConfigurationController defaultController];
  SEL v13 = [(BuddyDisplayZoomExecutor *)v22 pendingMode];
  [v12 setDisplayZoomMode:v13 withRelaunchURL:location[0] transitionWithScreenshot:v20];

  objc_storeStrong(location, 0);
}

- (DBSDisplayZoomMode)pendingMode
{
  return self->_pendingMode;
}

- (void)setPendingMode:(id)a3
{
}

- (id)willCommit
{
  return self->_willCommit;
}

- (void)setWillCommit:(id)a3
{
}

- (BOOL)chosenByUser
{
  return self->_chosenByUser;
}

- (void)setChosenByUser:(BOOL)a3
{
  self->_chosenByUser = a3;
}

- (void).cxx_destruct
{
}

@end