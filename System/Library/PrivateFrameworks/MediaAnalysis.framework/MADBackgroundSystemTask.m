@interface MADBackgroundSystemTask
+ (BOOL)buddyCheckRequired;
+ (BOOL)externalPowerRequired;
+ (BOOL)ignoreCancellation;
+ (BOOL)inexpensiveNetworkConnectivityRequired;
+ (BOOL)networkConnectivityRequired;
+ (BOOL)resourceIntensive;
+ (BOOL)runRemote;
+ (double)expectedDuration;
+ (id)identifier;
+ (id)rateLimitConfigurationName;
+ (id)sharedTask;
+ (int64_t)activityDelayInSeconds;
+ (unint64_t)taskID;
+ (void)notImplementedException:(id)a3;
- (BOOL)oneShot;
- (void)executeWith:(id)a3 completionHandler:(id)a4;
- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5;
- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5;
- (void)registerTask;
- (void)submitTask:(id *)a3;
@end

@implementation MADBackgroundSystemTask

+ (void)notImplementedException:(id)a3
{
  v3 = +[NSString stringWithFormat:@"[%@ %@]", objc_opt_class(), a3];
  id v4 = +[NSException exceptionWithName:@"NotImplementedException" reason:v3 userInfo:0];

  objc_exception_throw(v4);
}

+ (id)sharedTask
{
  return 0;
}

+ (id)identifier
{
  return 0;
}

+ (unint64_t)taskID
{
  return 0;
}

+ (int64_t)activityDelayInSeconds
{
  return 10;
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
  return 3600.0;
}

+ (BOOL)inexpensiveNetworkConnectivityRequired
{
  return 0;
}

+ (BOOL)networkConnectivityRequired
{
  v2 = objc_opt_class();
  return [v2 inexpensiveNetworkConnectivityRequired];
}

+ (id)rateLimitConfigurationName
{
  return 0;
}

- (void)submitTask:(id *)a3
{
  id v4 = [(id)objc_opt_class() activityDelayInSeconds];
  v6 = [(id)objc_opt_class() identifier];
  if ((int)MediaAnalysisLogLevel() >= 7)
  {
    v7 = VCPLogInstance();
    os_log_type_t v8 = VCPLogToOSLogType[7];
    if (os_log_type_enabled(v7, v8))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, v8, "[%@] Try submit the BGST task", buf, 0xCu);
    }
  }
  v9 = +[BGSystemTaskScheduler sharedScheduler];
  v10 = [v9 taskRequestForIdentifier:v6];

  if (!v10)
  {
    v11 = [objc_alloc((Class)BGNonRepeatingSystemTaskRequest) initWithIdentifier:v6];
    [v11 setGroupName:@"com.apple.mediaanalysisd"];
    [v11 setGroupConcurrencyLimit:1];
    -[NSObject setResourceIntensive:](v11, "setResourceIntensive:", [(id)objc_opt_class() resourceIntensive]);
    [v11 setRequiresUserInactivity:1];
    [v11 setPriority:1];
    [v11 setScheduleAfter:(double)(uint64_t)v4];
    [v11 setTrySchedulingBefore:(double)((uint64_t)v4 + 1800)];
    if ([v11 resourceIntensive])
    {
      [(id)objc_opt_class() expectedDuration];
      -[NSObject setExpectedDuration:](v11, "setExpectedDuration:");
    }
    -[NSObject setRequiresInexpensiveNetworkConnectivity:](v11, "setRequiresInexpensiveNetworkConnectivity:", [(id)objc_opt_class() inexpensiveNetworkConnectivityRequired]);
    -[NSObject setRequiresNetworkConnectivity:](v11, "setRequiresNetworkConnectivity:", [(id)objc_opt_class() networkConnectivityRequired]);
    v14 = [(id)objc_opt_class() rateLimitConfigurationName];
    if (v14) {
      [v11 setRateLimitConfigurationName:v14];
    }
    -[NSObject setRequiresExternalPower:](v11, "setRequiresExternalPower:", [(id)objc_opt_class() externalPowerRequired]);
    [v11 setPowerNap:1];
    -[NSObject setRequiresExternalPower:](v11, "setRequiresExternalPower:", [(id)objc_opt_class() externalPowerRequired]);
    [v11 setBacklogged:1];
    v15 = +[BGSystemTaskScheduler sharedScheduler];
    id v24 = 0;
    unsigned __int8 v16 = [v15 submitTaskRequest:v11 error:&v24];
    id v13 = v24;

    if (v16)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        v17 = VCPLogInstance();
        os_log_type_t v18 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v17, v18))
        {
          *(_DWORD *)buf = 138412290;
          v26 = v6;
          v19 = "[%@] Submitted BGST task successfully.";
          v20 = v17;
          os_log_type_t v21 = v18;
          uint32_t v22 = 12;
LABEL_22:
          _os_log_impl((void *)&_mh_execute_header, v20, v21, v19, buf, v22);
          goto LABEL_23;
        }
        goto LABEL_23;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 3)
    {
      v17 = VCPLogInstance();
      os_log_type_t v23 = VCPLogToOSLogType[3];
      if (os_log_type_enabled(v17, v23))
      {
        *(_DWORD *)buf = 138412546;
        v26 = v6;
        __int16 v27 = 2112;
        id v28 = v13;
        v19 = "[%@] Failed to submit the BGST task with error: %@";
        v20 = v17;
        os_log_type_t v21 = v23;
        uint32_t v22 = 22;
        goto LABEL_22;
      }
LABEL_23:
    }
LABEL_25:

    goto LABEL_26;
  }
  if ((int)MediaAnalysisLogLevel() >= 5)
  {
    v11 = VCPLogInstance();
    os_log_type_t v12 = VCPLogToOSLogType[5];
    if (os_log_type_enabled(v11, v12))
    {
      *(_DWORD *)buf = 138412290;
      v26 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, v12, "[%@] the BGST task already existed, bailing out.", buf, 0xCu);
    }
    id v13 = 0;
    goto LABEL_25;
  }
  id v13 = 0;
LABEL_26:

  if (!v10 && a3 && v13) {
    *a3 = [v13 copy];
  }
}

- (BOOL)oneShot
{
  return 0;
}

- (void)executeWith:(id)a3 completionHandler:(id)a4
{
  id v4 = objc_opt_class();
  [v4 notImplementedException:@"executeWith:completionHandler:"];
}

- (void)executeWithSystemTask:(id)a3 cancelBlock:(id)a4 completionHandler:(id)a5
{
}

- (void)executeWithCancelBlock:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  v5 = objc_opt_class();
  [v5 notImplementedException:@"executeWithCancelBlock:progressHandler:completionHandler:"];
}

+ (BOOL)ignoreCancellation
{
  return 0;
}

+ (BOOL)buddyCheckRequired
{
  return 1;
}

+ (BOOL)runRemote
{
  return 1;
}

- (void)registerTask
{
  v3 = [(id)objc_opt_class() identifier];
  id v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  v6 = +[NSString stringWithFormat:@"[%@][%@]", v5, v3];

  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_100013BF0;
  v20[3] = &unk_100219DE8;
  id v7 = v6;
  id v21 = v7;
  uint32_t v22 = self;
  id v8 = v3;
  id v23 = v8;
  v9 = objc_retainBlock(v20);
  if (v8)
  {
    v10 = +[BGSystemTaskScheduler sharedScheduler];
    unsigned int v11 = [v10 registerForTaskWithIdentifier:v8 usingQueue:0 launchHandler:v9];

    if (v11)
    {
      if ((int)MediaAnalysisLogLevel() >= 7)
      {
        os_log_type_t v12 = VCPLogInstance();
        os_log_type_t v13 = VCPLogToOSLogType[7];
        if (os_log_type_enabled(v12, v13))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v7;
          v14 = "%@ Successfully registered";
LABEL_12:
          v17 = v12;
          os_log_type_t v18 = v13;
          uint32_t v19 = 12;
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    else if ((int)MediaAnalysisLogLevel() >= 4)
    {
      os_log_type_t v12 = VCPLogInstance();
      os_log_type_t v13 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        v14 = "%@ identifier already registerred; ignore re-registering";
        goto LABEL_12;
      }
LABEL_14:
    }
  }
  else if ((int)MediaAnalysisLogLevel() >= 3)
  {
    os_log_type_t v12 = VCPLogInstance();
    os_log_type_t v15 = VCPLogToOSLogType[3];
    if (os_log_type_enabled(v12, v15))
    {
      unsigned int v16 = [(id)objc_opt_class() taskID];
      *(_DWORD *)buf = 138412546;
      id v25 = v7;
      __int16 v26 = 1024;
      unsigned int v27 = v16;
      v14 = "%@ Invalid identifier for task %u";
      v17 = v12;
      os_log_type_t v18 = v15;
      uint32_t v19 = 18;
LABEL_13:
      _os_log_impl((void *)&_mh_execute_header, v17, v18, v14, buf, v19);
      goto LABEL_14;
    }
    goto LABEL_14;
  }
}

@end