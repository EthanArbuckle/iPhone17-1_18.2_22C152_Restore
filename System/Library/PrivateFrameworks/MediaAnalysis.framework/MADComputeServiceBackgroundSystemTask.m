@interface MADComputeServiceBackgroundSystemTask
+ (id)identifier;
+ (id)sharedTask;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)submitTask:(id *)a3;
@end

@implementation MADComputeServiceBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000AAC00;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002525F8 != -1) {
    dispatch_once(&qword_1002525F8, block);
  }
  v2 = (void *)qword_1002525F0;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.macs.overnight";
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
    [v13 setRequiresExternalPower:1];
    [v13 setPriority:1];
    [v13 setScheduleAfter:0.0];
    [v13 setTrySchedulingBefore:1800.0];
    [v13 setResourceIntensive:1];
    [v13 setExpectedDuration:300.0];
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
  id v52 = a3;
  id v54 = a4;
  id v55 = a5;
  os_log_type_t v7 = (objc_class *)objc_opt_class();
  v8 = NSStringFromClass(v7);
  v9 = [(id)objc_opt_class() identifier];
  v10 = +[NSString stringWithFormat:@"[%@][%@]", v8, v9];

  +[NSPredicate predicateWithFormat:@"status==%lu", 0];
  v45 = uint64_t v69 = 0;
  os_log_type_t v11 = +[MADManagedRequest fetchTaskScheduleWithPredicate:error:](MADManagedRequest, "fetchTaskScheduleWithPredicate:error:");
  id v44 = 0;
  if ((int)MediaAnalysisLogLevel() >= 6)
  {
    id v12 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[6];
    if (os_log_type_enabled(v12, v13))
    {
      id v14 = [v11 count];
      *(_DWORD *)buf = 138412546;
      id v73 = v10;
      __int16 v74 = 2048;
      id v75 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "%@ Fetched %lu requests", buf, 0x16u);
    }
  }
  unsigned __int8 v15 = +[NSMutableDictionary dictionary];
  v16 = +[NSMutableArray array];
  long long v65 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  id obj = v11;
  id v17 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v66;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(void *)v66 != v19) {
          objc_enumerationMutation(obj);
        }
        __int16 v21 = *(void **)(*((void *)&v65 + 1) + 8 * i);
        id v22 = [v21 requestID];
        v23 = [v15 objectForKeyedSubscript:v22];

        if (!v23)
        {
          v24 = +[NSMutableArray array];
          v25 = [v21 requestID];
          [v15 setObject:v24 forKeyedSubscript:v25];

          v26 = [v21 requestID];
          [v16 addObject:v26];
        }
        v27 = [v21 requestID];
        v28 = [v15 objectForKeyedSubscript:v27];
        [v28 addObject:v21];
      }
      id v18 = [obj countByEnumeratingWithState:&v65 objects:v71 count:16];
    }
    while (v18);
  }

  v62[0] = _NSConcreteStackBlock;
  v62[1] = 3221225472;
  v62[2] = sub_1000AB5BC;
  v62[3] = &unk_10021C760;
  id v46 = v10;
  id v63 = v46;
  id v43 = v52;
  id v64 = v43;
  v53 = objc_retainBlock(v62);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v49 = v16;
  id v29 = [v49 countByEnumeratingWithState:&v58 objects:v70 count:16];
  if (v29)
  {
    id v30 = v29;
    uint64_t v51 = *(void *)v59;
    os_log_type_t type = VCPLogToOSLogType[7];
    os_log_type_t v47 = VCPLogToOSLogType[4];
    do
    {
      for (j = 0; j != v30; j = (char *)j + 1)
      {
        if (*(void *)v59 != v51) {
          objc_enumerationMutation(v49);
        }
        uint64_t v32 = *(void *)(*((void *)&v58 + 1) + 8 * (void)j);
        v56[0] = _NSConcreteStackBlock;
        v56[1] = 3221225472;
        v56[2] = sub_1000AB784;
        v56[3] = &unk_10021C788;
        id v34 = v55;
        id v57 = v34;
        v35 = objc_retainBlock(v56);
        v36 = [v15 objectForKeyedSubscript:v32];
        v37 = +[MADComputeServiceProcessingTask taskWithManagedRequests:v36 cancelBlock:v53 progressHandler:v54 resultsHandler:0 completionHandler:v35];

        v38 = +[VCPMADTaskScheduler sharedInstance];
        id v39 = [v38 addBackgroundTask:v37 withQoS:17];

        int v40 = MediaAnalysisLogLevel();
        if (v39)
        {
          if (v40 >= 7)
          {
            v41 = VCPLogInstance();
            if (os_log_type_enabled(v41, type))
            {
              *(_DWORD *)buf = 138412290;
              id v73 = v46;
              _os_log_impl((void *)&_mh_execute_header, v41, type, "%@ Successfully submitted background task to task scheduler.", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v40 >= 4)
          {
            v42 = VCPLogInstance();
            if (os_log_type_enabled(v42, v47))
            {
              *(_DWORD *)buf = 138412290;
              id v73 = v46;
              _os_log_impl((void *)&_mh_execute_header, v42, v47, "%@ Failed to submit background task to task scheduler; prepare to reschedule",
                buf,
                0xCu);
            }
          }
          (*((void (**)(id, uint64_t))v55 + 2))(v34, 4294967168);
        }
      }
      id v30 = [v49 countByEnumeratingWithState:&v58 objects:v70 count:16];
    }
    while (v30);
  }
}

@end