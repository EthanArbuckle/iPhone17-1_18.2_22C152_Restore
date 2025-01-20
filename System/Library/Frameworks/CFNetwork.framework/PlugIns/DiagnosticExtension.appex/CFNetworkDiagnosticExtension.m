@interface CFNetworkDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation CFNetworkDiagnosticExtension

- (id)attachmentsForParameters:(id)a3
{
  id v3 = a3;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[CFNetworkDiagnosticExtension]: Running CFNetwork Diagnostic Extension", (uint8_t *)&v20, 2u);
  }
  id v4 = [objc_alloc((Class)OSLogPreferencesSubsystem) initWithName:@"com.apple.CFNetwork"];
  id v5 = [objc_alloc((Class)OSLogPreferencesCategory) initWithName:@"HAR" subsystem:v4];
  v6 = [v3 objectForKeyedSubscript:@"pathDenialList"];
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[CFNetworkDiagnosticExtension]: Received a path denial list from the payload. List = %@", (uint8_t *)&v20, 0xCu);
    }
    CFStringRef v7 = kCFPreferencesCurrentUser;
    CFStringRef v8 = kCFPreferencesAnyHost;
    v9 = v6;
  }
  else
  {
    CFStringRef v7 = kCFPreferencesCurrentUser;
    CFStringRef v8 = kCFPreferencesAnyHost;
    v9 = 0;
  }
  CFPreferencesSetValue(@"har-path-denial-list", v9, @"com.apple.CFNetwork", v7, v8);
  v10 = [v3 objectForKeyedSubscript:@"bodySizeLimit"];
  if (v10)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v10;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[CFNetworkDiagnosticExtension]: Received a body size limit from the payload. Limit = %@", (uint8_t *)&v20, 0xCu);
    }
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  CFPreferencesSetValue(@"har-body-size-limit", v11, @"com.apple.CFNetwork", v7, v8);
  v12 = [v3 objectForKeyedSubscript:@"hostDenialList"];
  if (v12)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      int v20 = 138412290;
      v21 = v12;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[CFNetworkDiagnosticExtension]: Received a host denial list from the payload. List = %@", (uint8_t *)&v20, 0xCu);
    }
    v13 = v12;
  }
  else
  {
    v13 = 0;
  }
  CFPreferencesSetValue(@"har-host-denial-list", v13, @"com.apple.CFNetwork", v7, v8);
  v14 = [v3 objectForKeyedSubscript:@"captureType"];
  v15 = [v3 objectForKeyedSubscript:@"harCaptureTime"];
  [v15 doubleValue];
  double v17 = v16;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    v21 = v14;
    __int16 v22 = 2048;
    double v23 = v17;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[CFNetworkDiagnosticExtension]: Capture type received = %@. Capture Time = %f", (uint8_t *)&v20, 0x16u);
  }
  if (v17 <= 0.0)
  {
    [v5 reset];
  }
  else
  {
    v18 = +[NSDate dateWithTimeIntervalSinceNow:v17];
    CFPreferencesSetValue(v14, v18, @"com.apple.CFNetwork", v7, v8);
    [v5 setEnabledLevel:2];
    [v5 setPersistedLevel:2];
  }
  if (notify_post("com.apple.CFNetwork.har-capture-update")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v20) = 0;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "[CFNetworkDiagnosticExtension]: Failed to post a notification", (uint8_t *)&v20, 2u);
  }

  return &__NSArray0__struct;
}

- (id)attachmentList
{
  return &__NSArray0__struct;
}

@end