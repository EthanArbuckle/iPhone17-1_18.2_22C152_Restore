@interface ESADefaultStorageProvider
+ (id)activityLogFile;
+ (id)containerBaseURL;
- (id)readStoredLog;
- (void)storeLog:(id)a3;
@end

@implementation ESADefaultStorageProvider

+ (id)containerBaseURL
{
  if (qword_100081010 != -1) {
    dispatch_once(&qword_100081010, &stru_100070F08);
  }
  if (qword_100081008)
  {
    id v2 = (id)qword_100081008;
  }
  else
  {
    v3 = NSTemporaryDirectory();
    id v2 = +[NSURL fileURLWithPath:v3];
  }

  return v2;
}

+ (id)activityLogFile
{
  id v2 = [a1 containerBaseURL];
  v3 = [v2 URLByAppendingPathComponent:@"sbd-operation-log.plist"];

  return v3;
}

- (id)readStoredLog
{
  id v2 = +[ESADefaultStorageProvider activityLogFile];
  v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412546;
    uint64_t v18 = objc_opt_class();
    __int16 v19 = 2112;
    id v20 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@: Attempting to load activity log at %@", buf, 0x16u);
  }

  id v16 = 0;
  v4 = +[NSData dataWithContentsOfURL:v2 options:0 error:&v16];
  id v5 = v16;
  if (v4)
  {
    id v15 = v5;
    v6 = +[NSKeyedUnarchiver unarchivedObjectOfClass:objc_opt_class() fromData:v4 error:&v15];
    id v7 = v15;

    v8 = CloudServicesLog();
    v9 = v8;
    if (v7)
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100048894();
      }

      v10 = 0;
    }
    else
    {
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = objc_opt_class();
        v12 = [v6 activities];
        id v13 = [v12 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v18 = v11;
        __int16 v19 = 2048;
        id v20 = v13;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@: Unarchived %lu activity logs", buf, 0x16u);
      }
      v6 = v6;
      v10 = v6;
    }
  }
  else
  {
    v6 = CloudServicesLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10004881C();
    }
    v10 = 0;
    id v7 = v5;
  }

  return v10;
}

- (void)storeLog:(id)a3
{
  id v3 = a3;
  v4 = +[ESADefaultStorageProvider activityLogFile];
  id v5 = CloudServicesLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    uint64_t v6 = objc_opt_class();
    id v7 = [v3 activities];
    *(_DWORD *)buf = 138412802;
    uint64_t v21 = v6;
    __int16 v22 = 2048;
    id v23 = [v7 count];
    __int16 v24 = 2112;
    v25 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%@: Attempting to write %lu activity logs to %@", buf, 0x20u);
  }
  id v19 = 0;
  v8 = +[NSKeyedArchiver archivedDataWithRootObject:v3 requiringSecureCoding:1 error:&v19];
  id v9 = v19;
  v10 = v9;
  if (v8)
  {
    id v18 = v9;
    unsigned __int8 v11 = [v8 writeToURL:v4 options:1 error:&v18];
    id v12 = v18;

    id v13 = CloudServicesLog();
    v14 = v13;
    if (v11)
    {
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = objc_opt_class();
        id v16 = [v3 activities];
        id v17 = [v16 count];
        *(_DWORD *)buf = 138412546;
        uint64_t v21 = v15;
        __int16 v22 = 2048;
        id v23 = v17;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%@: Wrote %lu activity logs to disk", buf, 0x16u);
      }
    }
    else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      sub_100048984();
    }
    v10 = v12;
  }
  else
  {
    v14 = CloudServicesLog();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_10004890C();
    }
  }
}

@end