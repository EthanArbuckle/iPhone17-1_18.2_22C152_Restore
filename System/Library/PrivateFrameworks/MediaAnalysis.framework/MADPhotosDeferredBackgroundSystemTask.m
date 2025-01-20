@interface MADPhotosDeferredBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADPhotosDeferredBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010F6FC;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_100252760 != -1) {
    dispatch_once(&qword_100252760, block);
  }
  v2 = (void *)qword_100252758;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.deferred";
}

- (void)submitTask:(id *)a3
{
  v5 = [(id)objc_opt_class() identifier];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v6 = VCPLogInstance();
    os_log_type_t v7 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v6, v7))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Try submit the BGST task", buf, 0xCu);
    }
  }
  v8 = +[BGSystemTaskScheduler sharedScheduler];
  v9 = [v8 taskRequestForIdentifier:v5];

  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v5;
        _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%@] the BGST task already existed, bailing out.", buf, 0xCu);
      }
    }
    id v12 = 0;
  }
  else
  {
    id v13 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:v5];
    [v13 setGroupName:@"com.apple.mediaanalysisd"];
    [v13 setGroupConcurrencyLimit:1];
    [v13 setRequiresUserInactivity:1];
    [v13 setRequiresExternalPower:0];
    [v13 setPriority:1];
    [v13 setScheduleAfter:0.0];
    [v13 setTrySchedulingBefore:1800.0];
    v14 = +[BGSystemTaskScheduler sharedScheduler];
    id v18 = 0;
    unsigned __int8 v15 = [v14 submitTaskRequest:v13 error:&v18];
    id v12 = v18;

    if ((v15 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412546;
        v20 = v5;
        __int16 v21 = 2112;
        id v22 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Failed to submit the BGST task with error: %@", buf, 0x16u);
      }
    }
    if (a3 && v12) {
      *a3 = [v12 copy];
    }
  }
}

- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  os_log_type_t v7 = (void (**)(id, uint64_t))a5;
  id v8 = a4;
  id v9 = a3;
  v10 = (objc_class *)objc_opt_class();
  os_log_type_t v11 = NSStringFromClass(v10);
  id v12 = [(id)objc_opt_class() identifier];
  id v13 = +[NSString stringWithFormat:@"[%@][%@]", v11, v12];

  v14 = [[MADPhotosDeferredProcessingTask alloc] initWithCancelBlock:v9 progressHandler:v8 completionHandler:v7];
  unsigned __int8 v15 = +[VCPMADTaskScheduler sharedInstance];
  id v16 = [v15 addBackgroundTask:v14 withQoS:17];

  int v17 = MediaAnalysisLogLevel();
  if (v16)
  {
    if (v17 >= 7)
    {
      id v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "%@ Successfully submitted background task to task scheduler.", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v17 >= 4)
    {
      v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
          buf,
          0xCu);
      }
    }
    v7[2](v7, 4294967168);
  }
}

@end