@interface BuddyMigrationStateProvider
+ (id)validateAndResolveMigrationStateUsingPreferences:(id)a3 didCompleteInitialRun:(BOOL)a4;
@end

@implementation BuddyMigrationStateProvider

+ (id)validateAndResolveMigrationStateUsingPreferences:(id)a3 didCompleteInitialRun:(BOOL)a4
{
  location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  BOOL v25 = a4;
  id v24 = +[BuddyMigrationState loadFromPreferences:location[0]];
  if (v24)
  {
    if ([v24 intent] || !v25)
    {
      id v9 = +[BYDeviceConfiguration currentConfiguration];
      id v16 = [v9 buildVersion];

      id v10 = [v24 productBuild];
      char v11 = [v10 isEqualToString:v16] ^ 1;

      if (v11)
      {
        os_log_t v15 = (os_log_t)(id)_BYLoggingFacility();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          id v12 = [v24 productBuild];
          sub_100051470((uint64_t)v28, (uint64_t)v12, (uint64_t)v16);
          _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "MigrationStateProvider expected update to %@, but currently running %@!", v28, 0x16u);
        }
        objc_storeStrong((id *)&v15, 0);
        +[BuddyMigrationState removeFromPreferences:location[0]];
        id v27 = 0;
        int v20 = 1;
      }
      else
      {
        int v20 = 0;
      }
      objc_storeStrong(&v16, 0);
      if (!v20)
      {
        id v27 = v24;
        int v20 = 1;
      }
    }
    else
    {
      os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
      char v18 = 16;
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v7 = v19;
        os_log_type_t v8 = v18;
        sub_10004B24C(v17);
        _os_log_error_impl((void *)&_mh_execute_header, v7, v8, "Found stale migration state for target device, but already completed initial run! Removing and ignoring stale state.", v17, 2u);
      }
      objc_storeStrong((id *)&v19, 0);
      +[BuddyMigrationState removeFromPreferences:location[0]];
      id v27 = 0;
      int v20 = 1;
    }
  }
  else
  {
    os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
    char v22 = 16;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
    {
      v5 = oslog;
      os_log_type_t v6 = v22;
      sub_10004B24C(buf);
      _os_log_error_impl((void *)&_mh_execute_header, v5, v6, "No migration state found on disk!", buf, 2u);
    }
    objc_storeStrong((id *)&oslog, 0);
    +[BuddyMigrationState removeFromPreferences:location[0]];
    id v27 = 0;
    int v20 = 1;
  }
  objc_storeStrong(&v24, 0);
  objc_storeStrong(location, 0);
  v13 = v27;

  return v13;
}

@end