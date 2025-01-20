@interface MADHomeMaintenanceBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
+ (int64_t)activityDelayInSeconds;
+ (unint64_t)taskID;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
@end

@implementation MADHomeMaintenanceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000051A4;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002523B8 != -1) {
    dispatch_once(&qword_1002523B8, block);
  }
  v2 = (void *)qword_1002523B0;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.home.maintenance";
}

+ (unint64_t)taskID
{
  return 0;
}

+ (int64_t)activityDelayInSeconds
{
  if (!+[VCPDeviceInformation isHomePod]) {
    return 79200;
  }
  v4.receiver = a1;
  v4.super_class = (Class)&OBJC_METACLASS___MADHomeMaintenanceBackgroundSystemTask;
  return (int64_t)objc_msgSendSuper2(&v4, "activityDelayInSeconds");
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [(id)objc_opt_class() identifier];
  v10 = +[NSString stringWithFormat:@"[%@][%@]", v8, v9];

  uint64_t v33 = 0;
  v34 = &v33;
  uint64_t v35 = 0x3032000000;
  v36 = sub_1000056A8;
  v37 = sub_1000056B8;
  id v38 = objc_alloc_init((Class)VCPTimeMeasurement);
  [(id)v34[5] start];
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = sub_1000056A8;
  v31[4] = sub_1000056B8;
  v11 = [(id)objc_opt_class() identifier];
  VCPTransactionWithName((uint64_t)v11);
  id v32 = (id)objc_claimAutoreleasedReturnValue();

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000056C0;
  v26[3] = &unk_100219860;
  v29 = &v33;
  id v12 = v10;
  id v27 = v12;
  v30 = v31;
  id v13 = v6;
  id v28 = v13;
  v14 = objc_retainBlock(v26);
  v16 = +[VCPHomeResidentMaintenanceTask taskWithOptions:&__NSDictionary0__struct extendTimeoutBlock:&stru_100219880 completionHandler:v14];
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_1000058F0;
  v24[3] = &unk_1002198A8;
  id v17 = v5;
  id v25 = v17;
  [v16 setCancelBlock:v24];
  v18 = +[VCPMADTaskScheduler sharedInstance];
  BOOL v19 = [v18 addBackgroundTask:v16 withQoS:17] == 0;

  if (v19)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138412290;
        id v40 = v12;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
          buf,
          0xCu);
      }
    }
    (*((void (**)(id, uint64_t))v13 + 2))(v13, 4294967168);
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v20 = VCPLogInstance();
    os_log_type_t v21 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v20, v21))
    {
      *(_DWORD *)buf = 138412290;
      id v40 = v12;
      _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Successfully submitted background task to task scheduler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(v31, 8);
  _Block_object_dispose(&v33, 8);
}

@end