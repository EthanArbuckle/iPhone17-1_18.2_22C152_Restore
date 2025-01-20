@interface MADFastPassBackgroundSystemTask
+ (id)featureCodes;
+ (id)processingTaskIdentifiers;
+ (id)producedResultIdentifiers;
- (BOOL)oneShot;
- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (void)registerTask;
@end

@implementation MADFastPassBackgroundSystemTask

+ (id)processingTaskIdentifiers
{
  return 0;
}

+ (id)featureCodes
{
  return 0;
}

+ (id)producedResultIdentifiers
{
  return +[NSSet set];
}

- (BOOL)oneShot
{
  return 1;
}

- (void)registerTask
{
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v3 = VCPLogInstance();
    os_log_type_t v4 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v3, v4))
    {
      id v5 = [(id)objc_opt_class() identifier];
      v6 = [(id)objc_opt_class() processingTaskIdentifiers];
      *(_DWORD *)buf = 138412546;
      id v9 = v5;
      __int16 v10 = 2112;
      v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v3, v4, "%@: Registering fast-pass background processing task for %@", buf, 0x16u);
    }
  }
  v7.receiver = self;
  v7.super_class = (Class)MADFastPassBackgroundSystemTask;
  [(MADBackgroundSystemTask *)&v7 registerTask];
}

- (id)processingTaskWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  return 0;
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
  id v27 = a3;
  id v30 = a4;
  id v29 = a5;
  v26 = [(id)objc_opt_class() identifier];
  v28 = +[NSString stringWithFormat:@"[BGST-FP][%@][ExecuteTask]", v26];
  uint64_t v45 = 0;
  v46 = &v45;
  uint64_t v47 = 0x3032000000;
  v48 = sub_10008F440;
  v49 = sub_10008F450;
  id v50 = objc_alloc_init((Class)VCPTimeMeasurement);
  [(id)v46[5] start];
  v43[0] = 0;
  v43[1] = v43;
  v43[2] = 0x3032000000;
  v43[3] = sub_10008F440;
  v43[4] = sub_10008F450;
  v8 = [(id)objc_opt_class() identifier];
  VCPTransactionWithName((uint64_t)v8);
  id v44 = (id)objc_claimAutoreleasedReturnValue();

  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x2020000000;
  v42[3] = 0;
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_10008F458;
  v39[3] = &unk_10021C1C8;
  id v9 = v28;
  id v40 = v9;
  v41 = v42;
  __int16 v10 = objc_retainBlock(v39);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10008F544;
  v31[3] = &unk_10021C1F0;
  v36 = &v45;
  id v11 = v9;
  id v32 = v11;
  id v12 = v27;
  id v33 = v12;
  v34 = self;
  v37 = v42;
  v38 = v43;
  id v13 = v29;
  id v35 = v13;
  v14 = objc_retainBlock(v31);
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v16 = VCPLogInstance();
    os_log_type_t v17 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v16, v17))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ start processing task ...", buf, 0xCu);
    }
  }
  v18 = [(MADFastPassBackgroundSystemTask *)self processingTaskWithCancelBlock:v30 progressHandler:v10 completionHandler:v14];
  if (v18)
  {
    v19 = +[VCPMADTaskScheduler sharedInstance];
    if ([v19 addBackgroundTask:v18 withQoS:9])
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v20 = VCPLogInstance();
        os_log_type_t v21 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v20, v21))
        {
          *(_DWORD *)buf = 138412290;
          id v52 = v11;
          _os_log_impl((void *)&_mh_execute_header, v20, v21, "%@ Submitted background task to task scheduler.", buf, 0xCu);
        }
      }
    }
    else
    {
      if ((int)MediaAnalysisLogLevel() >= 3)
      {
        v24 = VCPLogInstance();
        os_log_type_t v25 = VCPLogToOSLogType[3];
        if (os_log_type_enabled(v24, v25))
        {
          *(_DWORD *)buf = 138412290;
          id v52 = v11;
          _os_log_impl((void *)&_mh_execute_header, v24, v25, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
            buf,
            0xCu);
        }
      }
      ((void (*)(void *, uint64_t))v14[2])(v14, 4294967168);
    }
  }
  else
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v22 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 138412290;
        id v52 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, v23, "%@ Failed to create processing task.", buf, 0xCu);
      }
    }
    ((void (*)(void *, uint64_t))v14[2])(v14, 4294967278);
  }

  _Block_object_dispose(v42, 8);
  _Block_object_dispose(v43, 8);

  _Block_object_dispose(&v45, 8);
}

@end