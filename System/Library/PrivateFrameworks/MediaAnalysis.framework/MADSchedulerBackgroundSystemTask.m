@interface MADSchedulerBackgroundSystemTask
+ (BOOL)photosActivitiesEnabled;
+ (id)identifier;
+ (id)sharedTask;
+ (unint64_t)taskID;
+ (void)updateTask;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
- (void)submitPhotosTasks;
- (void)submitTaskWithTaskClass:(Class)a3;
@end

@implementation MADSchedulerBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000CAFC;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002523E8 != -1) {
    dispatch_once(&qword_1002523E8, block);
  }
  v2 = (void *)qword_1002523E0;
  return v2;
}

+ (id)identifier
{
  return @"com.apple.mediaanalysisd.background.scheduler";
}

+ (unint64_t)taskID
{
  return 0;
}

+ (BOOL)photosActivitiesEnabled
{
  return 1;
}

+ (void)updateTask
{
  if (+[VCPDeviceInformation isHomePod])
  {
    v2 = [(id)objc_opt_class() identifier];
    if ((int)MediaAnalysisLogLevel() >= 6)
    {
      v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[6];
      if (os_log_type_enabled(v3, v4))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v2;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "[%@][HomePod] Attempting updateTask", buf, 0xCu);
      }
    }
    v5 = +[BGSystemTaskScheduler sharedScheduler];
    v6 = [v5 taskRequestForIdentifier:v2];

    if (v6)
    {
      [v6 interval];
      if (v7 >= 86400.0)
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v13 = VCPLogInstance();
          os_log_type_t v29 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v13, v29))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v2;
            _os_log_impl((void *)&_mh_execute_header, v13, v29, "[%@][HomePod] Task interval already up-to-date, skipping updateTask", buf, 0xCu);
          }
          id v12 = 0;
          goto LABEL_39;
        }
        id v12 = 0;
      }
      else
      {
        if ((int)MediaAnalysisLogLevel() >= 6)
        {
          v8 = VCPLogInstance();
          os_log_type_t v9 = VCPLogToOSLogType[6];
          if (os_log_type_enabled(v8, v9))
          {
            *(_DWORD *)buf = 138412290;
            v35 = v2;
            _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@][HomePod] Updating interval to 24 hours", buf, 0xCu);
          }
        }
        [v6 setInterval:86400.0];
        [v6 setMinDurationBetweenInstances:70000.0];
        v10 = +[BGSystemTaskScheduler sharedScheduler];
        id v33 = 0;
        unsigned __int8 v11 = [v10 updateTaskRequest:v6 error:&v33];
        id v12 = v33;

        if (v11)
        {
          if ((int)MediaAnalysisLogLevel() >= 6)
          {
            v13 = VCPLogInstance();
            os_log_type_t v14 = VCPLogToOSLogType[6];
            if (os_log_type_enabled(v13, v14))
            {
              *(_DWORD *)buf = 138412290;
              v35 = v2;
              v15 = "[%@][HomePod] Successfully updated task request";
              v16 = v13;
              os_log_type_t v17 = v14;
              uint32_t v18 = 12;
LABEL_38:
              _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, v18);
              goto LABEL_39;
            }
            goto LABEL_39;
          }
        }
        else if ((int)MediaAnalysisLogLevel() >= 3)
        {
          v13 = VCPLogInstance();
          os_log_type_t v31 = VCPLogToOSLogType[3];
          if (os_log_type_enabled(v13, v31))
          {
            *(_DWORD *)buf = 138412546;
            v35 = v2;
            __int16 v36 = 2112;
            id v37 = v12;
            v15 = "[%@][HomePod] Failed to update task request with error: %@";
            v16 = v13;
            os_log_type_t v17 = v31;
            uint32_t v18 = 22;
            goto LABEL_38;
          }
LABEL_39:
        }
      }
LABEL_40:

      return;
    }
    if ((int)MediaAnalysisLogLevel() >= 4)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v19, v20))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v2;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@][HomePod] Scheduler task missing, submitting now", buf, 0xCu);
      }
    }
    id v21 = [objc_alloc((Class)BGRepeatingSystemTaskRequest) initWithIdentifier:v2];
    [v21 setGroupName:@"com.apple.mediaanalysisd"];
    [v21 setGroupConcurrencyLimit:1];
    [v21 setResourceIntensive:0];
    [v21 setRequiresUserInactivity:1];
    [v21 setPriority:1];
    [v21 setInterval:86400.0];
    [v21 setMinDurationBetweenInstances:70000.0];
    v22 = +[BGSystemTaskScheduler sharedScheduler];
    id v32 = 0;
    unsigned __int8 v23 = [v22 submitTaskRequest:v21 error:&v32];
    id v12 = v32;

    if (v23)
    {
      if ((int)MediaAnalysisLogLevel() >= 6)
      {
        v13 = VCPLogInstance();
        os_log_type_t v24 = VCPLogToOSLogType[6];
        if (os_log_type_enabled(v13, v24))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v2;
          v25 = "[%@][HomePod] Successfully submitted new task request";
          v26 = v13;
          os_log_type_t v27 = v24;
          uint32_t v28 = 12;
LABEL_31:
          _os_log_impl((void *)&_mh_execute_header, v26, v27, v25, buf, v28);
          goto LABEL_32;
        }
        goto LABEL_32;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v13 = VCPLogInstance();
      os_log_type_t v30 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v13, v30))
      {
        *(_DWORD *)buf = 138412546;
        v35 = v2;
        __int16 v36 = 2112;
        id v37 = v12;
        v25 = "[%@][HomePod] Failed to submit new task request with error: %@";
        v26 = v13;
        os_log_type_t v27 = v30;
        uint32_t v28 = 22;
        goto LABEL_31;
      }
LABEL_32:
      v6 = v21;
      goto LABEL_39;
    }
    v6 = v21;
    goto LABEL_40;
  }
}

- (void)submitTaskWithTaskClass:(Class)a3
{
  os_log_type_t v4 = [(objc_class *)a3 identifier];
  v5 = [(objc_class *)a3 sharedTask];
  id v14 = 0;
  [v5 submitTask:&v14];
  id v6 = v14;

  if (v6)
  {
    if ((int)MediaAnalysisLogLevel() >= 3)
    {
      double v7 = VCPLogInstance();
      os_log_type_t v8 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v7, v8))
      {
        *(_DWORD *)buf = 138412546;
        v16 = v4;
        __int16 v17 = 2112;
        id v18 = v6;
        os_log_type_t v9 = "[%@] Failed to submit this BGST task with error: %@";
        v10 = v7;
        os_log_type_t v11 = v8;
        uint32_t v12 = 22;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v10, v11, v9, buf, v12);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    double v7 = VCPLogInstance();
    os_log_type_t v13 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v13))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v4;
      os_log_type_t v9 = "[%@] Successfully submitted this BGST task.";
      v10 = v7;
      os_log_type_t v11 = v13;
      uint32_t v12 = 12;
      goto LABEL_8;
    }
LABEL_9:
  }
}

- (void)submitPhotosTasks
{
  v3 = +[VCPPhotoLibraryManager sharedManager];
  os_log_type_t v4 = [v3 allPhotoLibraries];
  id v5 = [v4 count];

  if (v5)
  {
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    if (_os_feature_enabled_impl())
    {
      uint64_t v6 = objc_opt_class();
      [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:v6];
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 5)
  {
    double v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v7, v8))
    {
      int v10 = 138412290;
      id v11 = (id)objc_opt_class();
      id v9 = v11;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] No Photo Libraries present; bypassing submission of Photos activities",
        (uint8_t *)&v10,
        0xCu);
    }
  }
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = (unsigned int (**)(void))a3;
  double v7 = (void (**)(id, uint64_t))a4;
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    os_log_type_t v8 = VCPLogInstance();
    os_log_type_t v9 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v8, v9))
    {
      LODWORD(v23) = 138412290;
      *(void *)((char *)&v23 + 4) = objc_opt_class();
      id v10 = *(id *)((char *)&v23 + 4);
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "[%@] begin executing task.", (uint8_t *)&v23, 0xCu);
    }
  }
  if (v6 && v6[2](v6))
  {
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      id v11 = VCPLogInstance();
      os_log_type_t v12 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v11, v12))
      {
        os_log_type_t v13 = objc_opt_class();
        LODWORD(v23) = 138412290;
        *(void *)((char *)&v23 + 4) = v13;
        id v14 = v13;
        _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%@] suspending the current task execution.", (uint8_t *)&v23, 0xCu);
      }
    }
    v7[2](v7, 4294967168);
  }
  else
  {
    if (+[VCPDeviceInformation isHomePod])
    {
      if ((int)MediaAnalysisLogLevel() >= 5)
      {
        v15 = VCPLogInstance();
        os_log_type_t v16 = VCPLogToOSLogType[5];
        if (os_log_type_enabled(v15, v16))
        {
          __int16 v17 = objc_opt_class();
          LODWORD(v23) = 138412290;
          *(void *)((char *)&v23 + 4) = v17;
          id v18 = v17;
          _os_log_impl((void *)&_mh_execute_header, v15, v16, "[%@] HomePod system; bypassing submission of core activities",
            (uint8_t *)&v23,
            0xCu);
        }
      }
    }
    else
    {
      if ([(id)objc_opt_class() photosActivitiesEnabled]) {
        [(MADSchedulerBackgroundSystemTask *)self submitPhotosTasks];
      }
      [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    }
    [(MADSchedulerBackgroundSystemTask *)self submitTaskWithTaskClass:objc_opt_class()];
    v7[2](v7, 0);
    if ((int)MediaAnalysisLogLevel() >= 5)
    {
      v19 = VCPLogInstance();
      os_log_type_t v20 = VCPLogToOSLogType[5];
      if (os_log_type_enabled(v19, v20))
      {
        id v21 = objc_opt_class();
        LODWORD(v23) = 138412290;
        *(void *)((char *)&v23 + 4) = v21;
        id v22 = v21;
        _os_log_impl((void *)&_mh_execute_header, v19, v20, "[%@] finish executing task.", (uint8_t *)&v23, 0xCu);
      }
    }
  }
}

@end