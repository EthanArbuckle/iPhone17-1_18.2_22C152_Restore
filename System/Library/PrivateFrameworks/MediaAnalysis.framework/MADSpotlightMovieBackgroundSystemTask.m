@interface MADSpotlightMovieBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
+ (unint64_t)taskID;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADSpotlightMovieBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000EABB0;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_100252720 != -1) {
    dispatch_once(&qword_100252720, block);
  }
  v2 = (void *)qword_100252718;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.spotlight.movie";
}

+ (unint64_t)taskID
{
  return 18;
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
      v22 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Try submit the BGST task", buf, 0xCu);
    }
  }
  v8 = +[BGSystemTaskScheduler sharedScheduler];
  v9 = [v8 taskRequestForIdentifier:v5];

  if (v9)
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v10 = VCPLogInstance();
      os_log_type_t v11 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
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
    [v13 setRequiresExternalPower:1];
    [v13 setPriority:1];
    [v13 setScheduleAfter:10.0];
    [v13 setTrySchedulingBefore:1810.0];
    [v13 setExpectedDuration:3600.0];
    v14 = +[BGSystemTaskScheduler sharedScheduler];
    id v20 = 0;
    unsigned __int8 v15 = [v14 submitTaskRequest:v13 error:&v20];
    id v12 = v20;

    if ((v15 & 1) == 0 && (int)MediaAnalysisLogLevel() >= 3)
    {
      v16 = VCPLogInstance();
      os_log_type_t v17 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v17))
      {
        *(_DWORD *)buf = 138412546;
        v22 = v5;
        __int16 v23 = 2112;
        id v24 = v12;
        _os_log_impl((void *)&_mh_execute_header, v16, v17, "[%@] Failed to submit the BGST task with error: %@", buf, 0x16u);
      }
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v18 = VCPLogInstance();
      os_log_type_t v19 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v18, v19))
      {
        *(_DWORD *)buf = 138412290;
        v22 = v5;
        _os_log_impl((void *)&_mh_execute_header, v18, v19, "[%@] Submitted BGST task successfully.", buf, 0xCu);
      }
    }
    if (a3 && v12) {
      *a3 = [v12 copy];
    }
  }
}

- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  v8 = (void (**)(id, uint64_t))a5;
  id v9 = a4;
  v10 = (objc_class *)objc_opt_class();
  os_log_type_t v11 = NSStringFromClass(v10);
  id v12 = [(id)objc_opt_class() identifier];
  id v13 = +[NSString stringWithFormat:@"[%@][%@]", v11, v12];

  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000EB1F0;
  v24[3] = &unk_1002198A8;
  id v14 = v7;
  id v25 = v14;
  unsigned __int8 v15 = objc_retainBlock(v24);
  v16 = +[MADSpotlightMovieProcessingTask taskWithCancelBlock:v15 progressHandler:v9 completionHandler:v8];

  os_log_type_t v17 = +[VCPMADTaskScheduler sharedInstance];
  id v18 = [v17 addBackgroundTask:v16 withQoS:17];

  int v19 = MediaAnalysisLogLevel();
  if (v18)
  {
    if (v19 >= 7)
    {
      id v20 = VCPLogInstance();
      os_log_type_t v21 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v20, v21))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Successfully submitted background task to task scheduler.", buf, 0xCu);
      }
    }
  }
  else
  {
    if (v19 >= 4)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138412290;
        v27 = v13;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
          buf,
          0xCu);
      }
    }
    v8[2](v8, 4294967168);
  }
}

@end