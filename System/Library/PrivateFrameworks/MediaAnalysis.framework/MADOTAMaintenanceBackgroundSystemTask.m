@interface MADOTAMaintenanceBackgroundSystemTask
+ (BOOL)externalPowerRequired;
+ (BOOL)networkConnectivityRequired;
+ (BOOL)resourceIntensive;
+ (id)identifier;
+ (id)sharedTask;
+ (int64_t)activityDelayInSeconds;
+ (unint64_t)taskID;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
@end

@implementation MADOTAMaintenanceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100072EC4;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_100252520 != -1) {
    dispatch_once(&qword_100252520, block);
  }
  v2 = (void *)qword_100252518;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.ota.maintenance";
}

+ (unint64_t)taskID
{
  return 0;
}

+ (int64_t)activityDelayInSeconds
{
  return 79200;
}

+ (BOOL)externalPowerRequired
{
  return 0;
}

+ (BOOL)resourceIntensive
{
  return 0;
}

+ (BOOL)networkConnectivityRequired
{
  return 1;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v21 = a3;
  id v22 = a4;
  v20 = [(id)objc_opt_class() identifier];
  +[NSString stringWithFormat:@"[%@][%@]", objc_opt_class(), v20];
  uint64_t v34 = 0;
  v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_100073460;
  v19 = v38 = sub_100073470;
  id v39 = objc_alloc_init((Class)VCPTimeMeasurement);
  [(id)v35[5] start];
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_100073460;
  v32[4] = sub_100073470;
  VCPTransactionWithName((uint64_t)v20);
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_100073478;
  v30[3] = &unk_10021BEF0;
  id v5 = v19;
  id v31 = v5;
  v6 = objc_retainBlock(v30);
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_100073558;
  v25[3] = &unk_10021BF18;
  v28 = &v34;
  id v7 = v5;
  id v26 = v7;
  v29 = v32;
  id v8 = v22;
  id v27 = v8;
  v9 = objc_retainBlock(v25);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100073704;
  v23[3] = &unk_10021BF40;
  id v10 = v21;
  id v24 = v10;
  v11 = objc_retainBlock(v23);
  v13 = +[MADOTAMaintenanceProcessingTask taskWithCancelBlock:v11 progressHandler:v6 completionHandler:v9];
  v14 = +[VCPMADTaskScheduler sharedInstance];
  LODWORD(v5) = [v14 addBackgroundTask:v13 withQoS:17] == 0;

  if (v5)
  {
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v17 = VCPLogInstance();
      os_log_type_t v18 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 138412290;
        id v41 = v7;
        _os_log_impl((void *)&_mh_execute_header, v17, v18, "%@ Failed to sumbit background task to task scheduler; prepare to reschedule",
          buf,
          0xCu);
      }
    }
    (*((void (**)(id, uint64_t))v8 + 2))(v8, 4294967168);
  }
  else if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v15 = VCPLogInstance();
    os_log_type_t v16 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v15, v16))
    {
      *(_DWORD *)buf = 138412290;
      id v41 = v7;
      _os_log_impl((void *)&_mh_execute_header, v15, v16, "%@ Successfully sumbitted background task to task scheduler.", buf, 0xCu);
    }
  }

  _Block_object_dispose(v32, 8);
  _Block_object_dispose(&v34, 8);
}

@end