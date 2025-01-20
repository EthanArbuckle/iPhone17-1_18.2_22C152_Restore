@interface BuddyPowerLog
+ (BOOL)removeLog;
@end

@implementation BuddyPowerLog

+ (BOOL)removeLog
{
  id v38 = a1;
  SEL v37 = a2;
  uint64_t v36 = 1;
  uint64_t v35 = container_system_group_path_for_identifier();
  id v34 = +[NSString stringWithUTF8String:v35];
  id v33 = 0;
  v2 = +[NSFileManager defaultManager];
  id v31 = 0;
  v3 = [(NSFileManager *)v2 contentsOfDirectoryAtPath:v34 error:&v31];
  objc_storeStrong(&v33, v31);
  id v32 = v3;

  if (v33)
  {
    id v30 = (id)_BYLoggingFacility();
    os_log_type_t v29 = OS_LOG_TYPE_ERROR;
    if (os_log_type_enabled((os_log_t)v30, OS_LOG_TYPE_ERROR))
    {
      char v27 = 0;
      char v25 = 0;
      if (_BYIsInternalInstall())
      {
        v4 = (NSString *)v33;
      }
      else if (v33)
      {
        id v28 = [v33 domain];
        char v27 = 1;
        v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v28, [v33 code]);
        v26 = v4;
        char v25 = 1;
      }
      else
      {
        v4 = 0;
      }
      sub_10004BB7C((uint64_t)v42, (uint64_t)v4);
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)v30, v29, "Failed to find contents of power log path: %{public}@", v42, 0xCu);
      if (v25) {

      }
      if (v27) {
    }
      }
    objc_storeStrong(&v30, 0);
    char v39 = 0;
    int v24 = 1;
  }
  else
  {
    memset(__b, 0, sizeof(__b));
    id v5 = v32;
    id v6 = [v5 countByEnumeratingWithState:__b objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)__b[2];
      do
      {
        for (unint64_t i = 0; i < (unint64_t)v6; ++i)
        {
          if (*(void *)__b[2] != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v23 = *(void *)(__b[1] + 8 * i);
          id v21 = [v34 stringByAppendingPathComponent:v23];
          v9 = +[NSFileManager defaultManager];
          id obj = v33;
          unsigned __int8 v10 = [(NSFileManager *)v9 removeItemAtPath:v21 error:&obj];
          objc_storeStrong(&v33, obj);

          if ((v10 ^ 1))
          {
            os_log_t oslog = (os_log_t)(id)_BYLoggingFacility();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
            {
              v11 = oslog;
              id v12 = v21;
              char v17 = 0;
              char v15 = 0;
              if (_BYIsInternalInstall())
              {
                v13 = (NSString *)v33;
              }
              else if (v33)
              {
                id v18 = [v33 domain];
                char v17 = 1;
                v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"<Error domain: %@, code %ld>", v18, [v33 code]);
                v16 = v13;
                char v15 = 1;
              }
              else
              {
                v13 = 0;
              }
              sub_1000DC614((uint64_t)v40, (uint64_t)v12, (uint64_t)v13);
              _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to remove power log item at path %@: %{public}@", v40, 0x16u);
              if (v15) {

              }
              if (v17) {
            }
              }
            objc_storeStrong((id *)&oslog, 0);
          }
          objc_storeStrong(&v21, 0);
        }
        id v6 = [v5 countByEnumeratingWithState:__b objects:v41 count:16];
      }
      while (v6);
    }

    char v39 = 1;
    int v24 = 1;
  }
  objc_storeStrong(&v32, 0);
  objc_storeStrong(&v33, 0);
  objc_storeStrong(&v34, 0);
  return v39 & 1;
}

@end