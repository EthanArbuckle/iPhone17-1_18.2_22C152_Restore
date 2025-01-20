@interface MADPhotosPECBackgroundSystemTask
+ (BOOL)enabledByDefault;
+ (BOOL)inexpensiveNetworkConnectivityRequired;
+ (BOOL)resourceIntensive;
+ (NSString)identifier;
+ (double)expectedDuration;
+ (id)rateLimitConfigurationName;
+ (id)sharedTask;
+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6;
+ (unint64_t)taskID;
- (void)ensureTaskSubmission;
@end

@implementation MADPhotosPECBackgroundSystemTask

+ (id)sharedTask
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000059A0;
  block[3] = &unk_100219838;
  block[4] = a1;
  if (qword_1002523C8 != -1) {
    dispatch_once(&qword_1002523C8, block);
  }
  v2 = (void *)qword_1002523C0;
  return v2;
}

+ (NSString)identifier
{
  return (NSString *)@"com.apple.mediaanalysisd.photos.pec";
}

+ (BOOL)enabledByDefault
{
  return _os_feature_enabled_impl();
}

+ (unint64_t)taskID
{
  return 16;
}

+ (BOOL)resourceIntensive
{
  return 0;
}

+ (double)expectedDuration
{
  return 600.0;
}

+ (BOOL)inexpensiveNetworkConnectivityRequired
{
  return 1;
}

+ (id)rateLimitConfigurationName
{
  return _BGSTPECRateLimitConfigurationName;
}

+ (id)taskWithPhotoLibraries:(id)a3 cancelBlock:(id)a4 progressHandler:(id)a5 andCompletionHandler:(id)a6
{
  return +[VCPMADPECSingleRequestProcessingTask taskWithPhotoLibraries:a3 progressHandler:a5 completionHandler:a6 cancelBlock:a4];
}

- (void)ensureTaskSubmission
{
  v2 = [(id)objc_opt_class() identifier];
  v3 = +[BGSystemTaskScheduler sharedScheduler];
  v4 = [v3 taskRequestForIdentifier:v2];

  if (v4)
  {
    if ((int)MediaAnalysisLogLevel() >= 7)
    {
      v5 = VCPLogInstance();
      os_log_type_t v6 = VCPLogToOSLogType[7];
      if (os_log_type_enabled(v5, v6))
      {
        int v8 = 138412290;
        v9 = v2;
        _os_log_impl((void *)&_mh_execute_header, v5, v6, "%@ task already exists, no need to reschedule", (uint8_t *)&v8, 0xCu);
      }
    }
  }
  else
  {
    v7 = VCPLogInstance();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      sub_100005B8C((uint64_t)v2, v7);
    }

    +[VCPMADPECSingleRequestProcessingTask reschedule];
  }
}

@end