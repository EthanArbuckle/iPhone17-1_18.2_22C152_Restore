@interface BuddyMigrationCapability
+ (BOOL)_currentHardwareSupportsMigration;
+ (BOOL)currentDeviceShouldOfferMigration;
+ (BOOL)isMigrationSupportedFromDeviceClass:(id)a3 toDeviceClass:(id)a4 reason:(id *)a5;
+ (BOOL)sourceDeviceSupportsMigration:(id)a3 productVersion:(id)a4 deviceClass:(id)a5 softwareUpdateRequired:(BOOL *)a6 reason:(id *)a7;
+ (BOOL)supportsMigrationFromProductVersion:(id)a3 toProductVersion:(id)a4;
+ (id)_allowedDeviceClasses;
+ (int64_t)_compareProductVersion:(id)a3 toProductVersion:(id)a4;
@end

@implementation BuddyMigrationCapability

+ (BOOL)currentDeviceShouldOfferMigration
{
  location[2] = a1;
  location[1] = (id)a2;
  if (BYSetupAssistantHasCompletedInitialRun()) {
    return 0;
  }
  if (+[BuddyMigrationCapability _currentHardwareSupportsMigration])
  {
    id v4 = +[MCProfileConnection sharedConnection];
    unsigned __int8 v5 = [v4 activationRecordIndicatesCloudConfigurationIsAvailable];

    if (v5)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v24 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        v6 = oslog;
        os_log_type_t v7 = v24;
        sub_10004B24C(v23);
        _os_log_impl((void *)&_mh_execute_header, v6, v7, "Current device is enrolled in DEP; not offering migration",
          v23,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      return 0;
    }
    else
    {
      id v8 = +[BuddyCloudConfigManager sharedManager];
      unsigned __int8 v9 = [v8 cloudConfigWantsToSkipControllerClass:objc_opt_class()];

      if (v9)
      {
        os_log_t v22 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v21 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          v10 = v22;
          os_log_type_t v11 = v21;
          sub_10004B24C(v20);
          _os_log_impl((void *)&_mh_execute_header, v10, v11, "Current device skips Quick Start via cloud configuration; not offering migration",
            v20,
            2u);
        }
        objc_storeStrong((id *)&v22, 0);
        return 0;
      }
      else
      {
        id v12 = +[BuddyCloudConfigManager sharedManager];
        unsigned __int8 v13 = [v12 cloudConfigWantsToSkipControllerClass:objc_opt_class()];

        if (v13)
        {
          os_log_t v19 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v18 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            v14 = v19;
            os_log_type_t v15 = v18;
            sub_10004B24C(v17);
            _os_log_impl((void *)&_mh_execute_header, v14, v15, "Current device skips migration via cloud configuration; not offering migration",
              (uint8_t *)v17,
              2u);
          }
          objc_storeStrong((id *)&v19, 0);
          return 0;
        }
        else
        {
          return 1;
        }
      }
    }
  }
  else
  {
    location[0] = (id)_BYLoggingFacility();
    os_log_type_t v27 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)location[0], OS_LOG_TYPE_DEFAULT))
    {
      v2 = location[0];
      os_log_type_t v3 = v27;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Current hardware does not support migration; not offering migration",
        buf,
        2u);
    }
    objc_storeStrong(location, 0);
    return 0;
  }
}

+ (BOOL)sourceDeviceSupportsMigration:(id)a3 productVersion:(id)a4 deviceClass:(id)a5 softwareUpdateRequired:(BOOL *)a6 reason:(id *)a7
{
  id v57 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v55 = 0;
  objc_storeStrong(&v55, a4);
  id v54 = 0;
  objc_storeStrong(&v54, a5);
  v53 = a6;
  v52 = a7;
  id v11 = [location[0] supportsDeviceToDeviceMigration];
  LOBYTE(a6) = [v11 BOOLValue] ^ 1;

  if (a6)
  {
    id v51 = (id)_BYLoggingFacility();
    os_log_type_t v50 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled((os_log_t)v51, OS_LOG_TYPE_DEFAULT))
    {
      id v12 = v51;
      os_log_type_t v13 = v50;
      sub_10004B24C(buf);
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "Source device does not support migration; not offering migration",
        buf,
        2u);
    }
    objc_storeStrong(&v51, 0);
    if (v52)
    {
      v14 = @"not supported";
      id *v52 = v14;
    }
    char v58 = 0;
    int v48 = 1;
  }
  else
  {
    id v15 = [location[0] deviceToDeviceMigrationVersion];
    v16 = +[NSNumber numberWithUnsignedInt:SASProximityDeviceToDeviceCurrentVersion];
    char v17 = [v15 isEqualToNumber:v16] ^ 1;

    if (v17)
    {
      os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
      os_log_type_t v46 = OS_LOG_TYPE_DEFAULT;
      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
      {
        os_log_type_t v18 = oslog;
        os_log_type_t v19 = v46;
        sub_10004B24C(v45);
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "Source device does not support migration version; not offering migration",
          v45,
          2u);
      }
      objc_storeStrong((id *)&oslog, 0);
      if (v52)
      {
        v20 = @"incompatible migration version";
        id *v52 = v20;
      }
      char v58 = 0;
      int v48 = 1;
    }
    else
    {
      id v44 = (id)MGCopyAnswer();
      if (+[BuddyMigrationCapability isMigrationSupportedFromDeviceClass:v54 toDeviceClass:v44 reason:v52])
      {
        if ([location[0] isRestoring])
        {
          os_log_t v40 = (os_log_t)(id)_BYLoggingFacility();
          os_log_type_t v39 = OS_LOG_TYPE_DEFAULT;
          if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
          {
            v23 = v40;
            os_log_type_t v24 = v39;
            sub_10004B24C(v38);
            _os_log_impl((void *)&_mh_execute_header, v23, v24, "Source device is restoring; not offering migration",
              v38,
              2u);
          }
          objc_storeStrong((id *)&v40, 0);
          if (v52)
          {
            v25 = @"source restoring";
            id *v52 = v25;
          }
          char v58 = 0;
          int v48 = 1;
        }
        else
        {
          id v37 = +[SASSystemInformation productVersion];
          char v36 = ([v57 supportsMigrationFromProductVersion:v55 toProductVersion:v37] ^ 1) & 1;
          char v34 = 0;
          unsigned __int8 v26 = 0;
          if (v36)
          {
            id v35 = [location[0] preventSoftwareUpdateDeviceMigration];
            char v34 = 1;
            unsigned __int8 v26 = [v35 BOOLValue];
          }
          if (v34) {

          }
          if (v26)
          {
            os_log_t v33 = (os_log_t)(id)_BYLoggingFacility();
            os_log_type_t v32 = OS_LOG_TYPE_DEFAULT;
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              os_log_type_t v27 = v33;
              os_log_type_t v28 = v32;
              sub_10004B24C(v31);
              _os_log_impl((void *)&_mh_execute_header, v27, v28, "Source device prevents software update migration and a software update is required; not offering migration",
                (uint8_t *)v31,
                2u);
            }
            objc_storeStrong((id *)&v33, 0);
            if (v52)
            {
              v29 = @"software update required, but prevented";
              id *v52 = v29;
            }
            char v58 = 0;
            int v48 = 1;
          }
          else
          {
            if (v53) {
              BOOL *v53 = v36 & 1;
            }
            char v58 = 1;
            int v48 = 1;
          }
          objc_storeStrong(&v37, 0);
        }
      }
      else
      {
        os_log_t v43 = (os_log_t)(id)_BYLoggingFacility();
        os_log_type_t v42 = OS_LOG_TYPE_DEFAULT;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          os_log_type_t v21 = v43;
          os_log_type_t v22 = v42;
          sub_10004B24C(v41);
          _os_log_impl((void *)&_mh_execute_header, v21, v22, "Source device hardware does not support migration to current device hardware; not offering migration",
            v41,
            2u);
        }
        objc_storeStrong((id *)&v43, 0);
        char v58 = 0;
        int v48 = 1;
      }
      objc_storeStrong(&v44, 0);
    }
  }
  objc_storeStrong(&v54, 0);
  objc_storeStrong(&v55, 0);
  objc_storeStrong(location, 0);
  return v58 & 1;
}

+ (BOOL)isMigrationSupportedFromDeviceClass:(id)a3 toDeviceClass:(id)a4 reason:(id *)a5
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v10 = 0;
  objc_storeStrong(&v10, a4);
  unsigned __int8 v9 = a5;
  id v8 = +[BuddyMigrationCapability _allowedDeviceClasses];
  if (([v8 containsObject:location[0]] & 1) != 0
    && ([v8 containsObject:v10] & 1) != 0)
  {
    if ([location[0] isEqualToString:v10])
    {
      char v12 = 1;
    }
    else
    {
      if (v9) {
        *unsigned __int8 v9 = @"different device class";
      }
      char v12 = 0;
    }
  }
  else
  {
    if (v9) {
      *unsigned __int8 v9 = @"disallowed device class";
    }
    char v12 = 0;
  }
  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v10, 0);
  objc_storeStrong(location, 0);
  return v12 & 1;
}

+ (BOOL)_currentHardwareSupportsMigration
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = (id)MGCopyAnswer();
  id v2 = +[BuddyMigrationCapability _allowedDeviceClasses];
  unsigned __int8 v3 = [v2 containsObject:location[0]];

  objc_storeStrong(location, 0);
  return v3 & 1;
}

+ (id)_allowedDeviceClasses
{
  return &off_1002C1500;
}

+ (BOOL)supportsMigrationFromProductVersion:(id)a3 toProductVersion:(id)a4
{
  id v8 = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v6 = 0;
  objc_storeStrong(&v6, a4);
  LOBYTE(a4) = [v8 _compareProductVersion:location[0] toProductVersion:v6] != (id)1;
  objc_storeStrong(&v6, 0);
  objc_storeStrong(location, 0);
  return a4 & 1;
}

+ (int64_t)_compareProductVersion:(id)a3 toProductVersion:(id)a4
{
  id location[2] = a1;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  id v17 = 0;
  objc_storeStrong(&v17, a4);
  if ([location[0] isEqualToString:v17])
  {
    int64_t v19 = 0;
    int v16 = 1;
  }
  else
  {
    id v15 = [location[0] componentsSeparatedByString:@"."];
    id v14 = [v17 componentsSeparatedByString:@"."];
    for (int i = 0; ; ++i)
    {
      id v5 = (unint64_t)[v15 count] >= 2 ? (id)2 : [v15 count];
      id v6 = (unint64_t)[v14 count] >= 2 ? (id)2 : [v14 count];
      if (v5 <= v6) {
        id v7 = (unint64_t)[v14 count] >= 2 ? (id)2 : [v14 count];
      }
      else {
        id v7 = [v15 count] >= 2 ? 2 : [v15 count];
      }
      if (i >= (unint64_t)v7) {
        break;
      }
      signed int v12 = 0;
      signed int v11 = 0;
      if (i < (unint64_t)[v15 count])
      {
        id v8 = [v15 objectAtIndexedSubscript:i];
        signed int v12 = [v8 intValue];
      }
      if (i < (unint64_t)[v14 count])
      {
        id v9 = [v14 objectAtIndexedSubscript:i];
        signed int v11 = [v9 intValue];
      }
      if (v12 > v11)
      {
        int64_t v19 = 1;
        int v16 = 1;
        goto LABEL_28;
      }
      if (v12 < v11)
      {
        int64_t v19 = -1;
        int v16 = 1;
        goto LABEL_28;
      }
    }
    int64_t v19 = 0;
    int v16 = 1;
LABEL_28:
    objc_storeStrong(&v14, 0);
    objc_storeStrong(&v15, 0);
  }
  objc_storeStrong(&v17, 0);
  objc_storeStrong(location, 0);
  return v19;
}

@end