@interface MADPhotosMaintenanceBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (id)identifier;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADPhotosMaintenanceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000A70D4;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002525E8 != -1) {
    dispatch_once(&qword_1002525E8, block);
  }
  v2 = (void *)qword_1002525E0;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.photos.maintenance";
}

+ (BOOL)enabledByDefault
{
  return 1;
}

+ (unint64_t)taskID
{
  return 0;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  v6 = +[VCPPhotosMaintenanceProcessingTask taskWithPhotoLibraries:a3 andProgressHandler:a5 andCompletionHandler:a6 andCancelBlock:a4];
  return v6;
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v28 = a4;
  id v30 = a5;
  v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  v8 = [(id)objc_opt_class() identifier];
  v29 = +[NSString stringWithFormat:@"[%@][%@]", v7, v8];

  v9 = +[VCPPhotoLibraryManager sharedManager];
  v10 = [v9 allPhotoLibraries];

  if ([v10 count])
  {
    *(void *)&long long v44 = 0;
    *((void *)&v44 + 1) = &v44;
    uint64_t v45 = 0x3032000000;
    v46 = sub_1000A77B0;
    v47 = sub_1000A77C0;
    id v48 = objc_alloc_init((Class)VCPTimeMeasurement);
    [*(id *)(*((void *)&v44 + 1) + 40) start];
    v40[0] = 0;
    v40[1] = v40;
    v40[2] = 0x3032000000;
    v40[3] = sub_1000A77B0;
    v40[4] = sub_1000A77C0;
    v11 = [(id)objc_opt_class() identifier];
    VCPTransactionWithName((uint64_t)v11);
    id v41 = (id)objc_claimAutoreleasedReturnValue();

    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_1000A77C8;
    v38[3] = &unk_10021BEF0;
    id v12 = v29;
    id v39 = v12;
    v13 = objc_retainBlock(v38);
    v33[0] = _NSConcreteStackBlock;
    v33[1] = 3221225472;
    v33[2] = sub_1000A78A8;
    v33[3] = &unk_10021BF18;
    v36 = &v44;
    id v14 = v12;
    id v34 = v14;
    v37 = v40;
    id v15 = v30;
    id v35 = v15;
    v16 = objc_retainBlock(v33);
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_1000A7A54;
    v31[3] = &unk_10021BF40;
    id v32 = v28;
    v17 = objc_retainBlock(v31);
    v19 = +[VCPPhotosMaintenanceProcessingTask taskWithPhotoLibraries:v10 andProgressHandler:v13 andCompletionHandler:v16 andCancelBlock:v17];
    v20 = +[VCPMADTaskScheduler sharedInstance];
    BOOL v21 = [v20 addBackgroundTask:v19 withQoS:17] == 0;

    if (v21)
    {
      if ((int)MediaAnalysisLogLevel() >= 4)
      {
        v26 = VCPLogInstance();
        os_log_type_t v27 = VCPLogToOSLogType[4];
        if (os_log_type_enabled(v26, v27))
        {
          *(_DWORD *)buf = 138412290;
          id v43 = v14;
          _os_log_impl((void *)&_mh_execute_header, v26, v27, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            buf,
            0xCu);
        }
      }
      (*((void (**)(id, uint64_t))v15 + 2))(v15, 4294967168);
    }
    else if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v14;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Successfully submitted background task to task scheduler.", buf, 0xCu);
      }
    }

    _Block_object_dispose(v40, 8);
    _Block_object_dispose(&v44, 8);
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v24 = VCPLogInstance();
      os_log_type_t v25 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v24, v25))
      {
        LODWORD(v44) = 138412290;
        *(void *)((char *)&v44 + 4) = v29;
        _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ No PhotoLibrary present; quitting background processing",
          (uint8_t *)&v44,
          0xCu);
      }
    }
    (*((void (**)(id, void))v30 + 2))(v30, 0);
  }
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
      os_log_type_t v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v6, v7, "[%@] Try submit the repeating BGST task", buf, 0xCu);
    }
  }
  v8 = +[BGSystemTaskScheduler sharedScheduler];
  v9 = [v8 taskRequestForIdentifier:v5];

  if (!v9)
  {
    v10 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:v5];
    [v10 setGroupName:@"com.apple.mediaanalysisd"];
    [v10 setGroupConcurrencyLimit:1];
    -[NSObject setResourceIntensive:](v10, "setResourceIntensive:", [(id)objc_opt_class() resourceIntensive]);
    [v10 setRequiresUserInactivity:1];
    [v10 setPriority:1];
    [v10 setInterval:86400.0];
    if ([v10 resourceIntensive])
    {
      [(id)objc_opt_class() expectedDuration];
      -[NSObject setExpectedDuration:](v10, "setExpectedDuration:");
    }
    -[NSObject setRequiresInexpensiveNetworkConnectivity:](v10, "setRequiresInexpensiveNetworkConnectivity:", [(id)objc_opt_class() inexpensiveNetworkConnectivityRequired]);
    -[NSObject setRequiresNetworkConnectivity:](v10, "setRequiresNetworkConnectivity:", [(id)objc_opt_class() networkConnectivityRequired]);
    v13 = [(id)objc_opt_class() rateLimitConfigurationName];
    if (v13) {
      [v10 setRateLimitConfigurationName:v13];
    }
    -[NSObject setRequiresExternalPower:](v10, "setRequiresExternalPower:", [(id)objc_opt_class() externalPowerRequired]);
    [v10 setPowerNap:1];
    -[NSObject setRequiresExternalPower:](v10, "setRequiresExternalPower:", [(id)objc_opt_class() externalPowerRequired]);
    [v10 setBacklogged:1];
    id v14 = +[BGSystemTaskScheduler sharedScheduler];
    id v23 = 0;
    unsigned __int8 v15 = [v14 submitTaskRequest:v10 error:&v23];
    id v12 = v23;

    if (v15)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v16 = VCPLogInstance();
        os_log_type_t v17 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v16, v17))
        {
          *(_DWORD *)buf = 138412290;
          os_log_type_t v25 = v5;
          v18 = "[%@] Submitted repeating BGST task successfully.";
          v19 = v16;
          os_log_type_t v20 = v17;
          uint32_t v21 = 12;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v19, v20, v18, buf, v21);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v16 = VCPLogInstance();
      os_log_type_t v22 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v16, v22))
      {
        *(_DWORD *)buf = 138412546;
        os_log_type_t v25 = v5;
        __int16 v26 = 2112;
        id v27 = v12;
        v18 = "[%@] Failed to submit the repeating BGST task with error: %@";
        v19 = v16;
        os_log_type_t v20 = v22;
        uint32_t v21 = 22;
        goto LABEL_22;
      }
LABEL_23:
    }
LABEL_25:

    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v10 = VCPLogInstance();
    os_log_type_t v11 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v10, v11))
    {
      *(_DWORD *)buf = 138412290;
      os_log_type_t v25 = v5;
      _os_log_impl((void *)&_mh_execute_header, v10, v11, "[%@] the repeating BGST task already existed, bailing out.", buf, 0xCu);
    }
    id v12 = 0;
    goto LABEL_25;
  }
  id v12 = 0;
LABEL_26:

  if (!v9 && a3 && v12) {
    *a3 = [v12 copy];
  }
}

@end