@interface MADProgressReporterBackgroundSystemTask
+ (BOOL)externalPowerRequired;
+ (BOOL)resourceIntensive;
+ (double)expectedDuration;
+ (id)identifier;
+ (id)sharedTask;
+ (unint64_t)taskID;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
@end

@implementation MADProgressReporterBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10015F9E4;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002528C8 != -1) {
    dispatch_once(&qword_1002528C8, block);
  }
  v2 = (void *)qword_1002528C0;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.progress";
}

+ (unint64_t)taskID
{
  return 256;
}

+ (BOOL)externalPowerRequired
{
  return 1;
}

+ (BOOL)resourceIntensive
{
  return 1;
}

+ (double)expectedDuration
{
  return 1200.0;
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v30 = a4;
  id v29 = a5;
  v27 = [(id)objc_opt_class() identifier];
  v28 = +[NSString stringWithFormat:@"[ReportProgress][%@][ExecuteTask]", v27];
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1001601E0;
  v46 = sub_1001601F0;
  id v47 = objc_alloc_init((Class)VCPTimeMeasurement);
  [(id)v43[5] start];
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x3032000000;
  v40[3] = sub_1001601E0;
  v40[4] = sub_1001601F0;
  v6 = [(id)objc_opt_class() identifier];
  VCPTransactionWithName((uint64_t)v6);
  id v41 = (id)objc_claimAutoreleasedReturnValue();

  v39[0] = 0;
  v39[1] = v39;
  v39[2] = 0x2020000000;
  v39[3] = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_1001601F8;
  v36[3] = &unk_10021C1C8;
  id v7 = v28;
  id v37 = v7;
  v38 = v39;
  v8 = objc_retainBlock(v36);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1001602E4;
  v31[3] = &unk_10021EFF8;
  v34 = &v42;
  id v9 = v7;
  id v32 = v9;
  v35 = v40;
  id v10 = v29;
  id v33 = v10;
  v11 = objc_retainBlock(v31);
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v13 = VCPLogInstance();
    os_log_type_t v14 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v13, v14))
    {
      *(_DWORD *)buf = 138412290;
      id v53 = v9;
      _os_log_impl((void *)&_mh_execute_header, v13, v14, "%@ start processing task ...", buf, 0xCu);
    }
  }
  if (VCPIsRemoteIOSTask()) {
    +[VCPMADRemoteActivityTask taskWithActivityType:andCompletionHandler:](VCPMADRemoteActivityTask, "taskWithActivityType:andCompletionHandler:", [(id)objc_opt_class() taskID], v11);
  }
  else {
  v15 = +[MADProgressReporterProcessingTask taskWithCancelBlock:v30 progressHandler:v8 completionHandler:v11];
  }
  if (v15)
  {
    v16 = +[VCPMADTaskScheduler sharedInstance];
    if (![v16 addBackgroundTask:v15 withQoS:9])
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v23 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v23, v24))
        {
          *(_DWORD *)buf = 138412290;
          id v53 = v9;
          _os_log_impl((void *)&_mh_execute_header, v23, v24, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            buf,
            0xCu);
        }
      }
      NSErrorUserInfoKey v50 = NSLocalizedDescriptionKey;
      v25 = +[NSString stringWithFormat:@"%@ Cancelled", v9];
      v51 = v25;
      v26 = +[NSDictionary dictionaryWithObjects:&v51 forKeys:&v50 count:1];
      v17 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-128 userInfo:v26];

      ((void (*)(void *, void, NSObject *))v11[2])(v11, 0, v17);
      goto LABEL_23;
    }
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Submitted background task to task scheduler", buf, 0xCu);
      }
LABEL_23:
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412290;
        id v53 = v9;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "%@ Failed to create processing task", buf, 0xCu);
      }
    }
    NSErrorUserInfoKey v48 = NSLocalizedDescriptionKey;
    v21 = +[NSString stringWithFormat:@"%@ Failed to create processing task", v9];
    v49 = v21;
    v22 = +[NSDictionary dictionaryWithObjects:&v49 forKeys:&v48 count:1];
    v16 = +[NSError errorWithDomain:NSOSStatusErrorDomain code:-18 userInfo:v22];

    ((void (*)(void *, void, void *))v11[2])(v11, 0, v16);
  }

  _Block_object_dispose(v39, 8);
  _Block_object_dispose(v40, 8);

  _Block_object_dispose(&v42, 8);
}

@end