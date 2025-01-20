@interface OSADailyTelemetryMonitor
+ (void)collectDeveloperOptIn;
+ (void)evaluateState;
+ (void)sendRTCBeacon:(BOOL)a3;
@end

@implementation OSADailyTelemetryMonitor

+ (void)evaluateState
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Running daily telemetry monitor.", v2, 2u);
  }
  +[OSADailyTelemetryMonitor collectDeveloperOptIn];
}

+ (void)collectDeveloperOptIn
{
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Collecting developer opt in telemetry", buf, 2u);
  }
  v2 = +[OSASystemConfiguration sharedInstance];
  [v2 optIn3rdParty];

  AnalyticsSendEventLazy();
}

+ (void)sendRTCBeacon:(BOOL)a3
{
  BOOL v3 = a3;
  v4 = (__CFString *)MGCopyAnswer();
  CFBooleanRef v5 = (const __CFBoolean *)(id)MGCopyAnswer();
  if (v5) {
    BOOL v6 = CFBooleanGetValue(v5) != 0;
  }
  else {
    BOOL v6 = 1;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending RTC Beacon CA Event", buf, 2u);
  }
  AnalyticsSendEventLazy();
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Sending RTC Beacon", buf, 2u);
    }
    CFStringRef v7 = @"no_serial";
    if (v4) {
      CFStringRef v7 = v4;
    }
    v12[0] = v7;
    v11[0] = @"serial";
    v11[1] = @"prodFused";
    v8 = +[NSNumber numberWithBool:0];
    v12[1] = v8;
    v9 = +[NSDictionary dictionaryWithObjects:v12 forKeys:v11 count:2];

    if (v3) {
      rtcsc_send_realtime();
    }
    else {
      rtcsc_send();
    }
  }
}

@end