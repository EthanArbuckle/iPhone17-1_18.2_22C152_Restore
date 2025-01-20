@interface HACycleTrackingDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
- (void)enabledHealthSensitiveLogging;
@end

@implementation HACycleTrackingDiagnosticExtension

- (void)enabledHealthSensitiveLogging
{
  id v2 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.HealthKit.SensitiveLogsTemporaryEnablement"];
  v3 = +[NSDate dateWithTimeIntervalSinceNow:1800.0];
  v4 = [v2 objectForKey:@"HKShowSensitiveLogsUntilDate"];
  if (v4
    && ((objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0)
     || ([v3 timeIntervalSinceDate:v4], v5 <= 0.0)))
  {
    v7 = sub_100002980();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      CFStringRef v9 = @"HKShowSensitiveLogsUntilDate";
      __int16 v10 = 2114;
      v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "not setting %{public}@ because the current value is %{public}@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    v6 = sub_100002980();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138543618;
      CFStringRef v9 = @"HKShowSensitiveLogsUntilDate";
      __int16 v10 = 2114;
      v11 = v3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setting %{public}@ to %{public}@", (uint8_t *)&v8, 0x16u);
    }

    [v2 setObject:v3 forKey:@"HKShowSensitiveLogsUntilDate"];
  }
}

- (id)attachmentList
{
  v3 = sub_100002980();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "attachmentList called: calling attachmentsForParameters with empty dictionary", v6, 2u);
  }

  v4 = [(HACycleTrackingDiagnosticExtension *)self attachmentsForParameters:&__NSDictionary0__struct];
  return v4;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  double v5 = sub_100002980();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138543362;
    *(void *)((char *)&buf + 4) = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "attachments for parameters: %{public}@", (uint8_t *)&buf, 0xCu);
  }

  v6 = [v4 objectForKeyedSubscript:@"DEExtensionHostAppKey"];
  if ((([v6 isEqualToString:@"com.apple.taptoradard"] & 1) != 0
     || [v6 isEqualToString:@"com.apple.TapToRadar"])
    && ([v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"],
        v7 = objc_claimAutoreleasedReturnValue(),
        BOOL v8 = v7 == 0,
        v7,
        v8))
  {
    v23 = &__NSArray0__struct;
  }
  else
  {
    int v9 = sub_100002E9C("com.apple.HealthAlgorithms.DayStreamProcessor.WriteToJson");
    int v10 = sub_100002E9C("com.apple.HealthAlgorithms.HistoricalAnalyzer.WriteToJson");
    [(HACycleTrackingDiagnosticExtension *)self enabledHealthSensitiveLogging];
    uint64_t state64 = 0;
    p_uint64_t state64 = &state64;
    uint64_t v27 = 0x2050000000;
    v11 = (void *)qword_100008178;
    uint64_t v28 = qword_100008178;
    if (!qword_100008178)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v31 = sub_10000304C;
      v32 = &unk_100004200;
      v33 = &state64;
      sub_10000304C((uint64_t)&buf);
      v11 = (void *)p_state64[3];
    }
    id v12 = v11;
    _Block_object_dispose(&state64, 8);
    v13 = objc_opt_new();
    uint64_t state64 = 0;
    p_uint64_t state64 = &state64;
    uint64_t v27 = 0x2050000000;
    v14 = (void *)qword_100008188;
    uint64_t v28 = qword_100008188;
    if (!qword_100008188)
    {
      *(void *)&long long buf = _NSConcreteStackBlock;
      *((void *)&buf + 1) = 3221225472;
      v31 = sub_100003204;
      v32 = &unk_100004200;
      v33 = &state64;
      sub_100003204((uint64_t)&buf);
      v14 = (void *)p_state64[3];
    }
    v15 = v14;
    _Block_object_dispose(&state64, 8);
    id v16 = [[v15 alloc] initWithHealthStore:v13];
    [v16 triggerAnalysisForDiagnosticsWithCompletion:&stru_100004198];
    int v17 = 99;
    do
    {
      usleep(0x186A0u);
      *(void *)&long long buf = 0;
      uint64_t state64 = 0;
      notify_get_state(v9, (uint64_t *)&buf);
      notify_get_state(v10, &state64);
      if ((unint64_t)buf | state64) {
        BOOL v18 = v17 == 0;
      }
      else {
        BOOL v18 = 1;
      }
      --v17;
    }
    while (!v18);
    notify_cancel(v9);
    notify_cancel(v10);
    LOBYTE(state64) = 0;
    v19 = +[NSFileManager defaultManager];
    unsigned int v20 = [v19 fileExistsAtPath:@"/var/mobile/Library/Logs/CycleTracking" isDirectory:&state64];
    if ((_BYTE)state64) {
      unsigned int v21 = v20;
    }
    else {
      unsigned int v21 = 0;
    }

    if (v21)
    {
      v22 = +[DEAttachmentItem attachmentWithPath:@"/var/mobile/Library/Logs/CycleTracking"];
      [v22 setShouldCompress:&__kCFBooleanTrue];
      v29 = v22;
      v23 = +[NSArray arrayWithObjects:&v29 count:1];
    }
    else
    {
      v22 = sub_100002980();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138543362;
        *(void *)((char *)&buf + 4) = @"/var/mobile/Library/Logs/CycleTracking";
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "logPath: %{public}@ does not exist. Returning an empty list.", (uint8_t *)&buf, 0xCu);
      }
      v23 = &__NSArray0__struct;
    }
  }
  return v23;
}

@end