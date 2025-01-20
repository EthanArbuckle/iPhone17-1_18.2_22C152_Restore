@interface VCPWatchdog
+ (id)sharedWatchdog;
- (VCPWatchdog)init;
- (void)disable;
- (void)enable;
- (void)pet;
- (void)petWithCrashCallback:(id)a3;
- (void)petWithMessage:(id)a3;
@end

@implementation VCPWatchdog

- (VCPWatchdog)init
{
  v9.receiver = self;
  v9.super_class = (Class)VCPWatchdog;
  v2 = [(VCPWatchdog *)&v9 init];
  if (v2)
  {
    if (signal(14, (void (__cdecl *)(int))sub_100019BFC) && (int)MediaAnalysisLogLevel() >= 4)
    {
      v3 = VCPLogInstance();
      os_log_type_t v4 = VCPLogToOSLogType[4];
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, v4, "Hijacked SIGALRM; this may be a problem...", v8, 2u);
      }
    }
    dispatch_queue_t v5 = dispatch_queue_create("WatchdogLastPetMessage", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;
  }
  return v2;
}

+ (id)sharedWatchdog
{
  if (qword_100252460 != -1) {
    dispatch_once(&qword_100252460, &stru_100219FA0);
  }
  v2 = (void *)qword_100252458;
  return v2;
}

- (void)enable
{
  if (alarm(0x78u) && (int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)os_log_type_t v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Watchdog already enabled", v4, 2u);
    }
  }
}

- (void)petWithMessage:(id)a3
{
  id v4 = a3;
  alarm(0x78u);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019E2C;
  block[3] = &unk_100219FC8;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)pet
{
  dispatch_sync((dispatch_queue_t)self->_queue, &stru_100219FE8);
  alarm(0x78u);
}

- (void)petWithCrashCallback:(id)a3
{
  id v4 = a3;
  alarm(0x78u);
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019F68;
  block[3] = &unk_10021A010;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(queue, block);
}

- (void)disable
{
  if (!alarm(0) && (int)MediaAnalysisLogLevel() >= 4)
  {
    v2 = VCPLogInstance();
    os_log_type_t v3 = VCPLogToOSLogType[4];
    if (os_log_type_enabled(v2, v3))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, v3, "Watchdog already disabled", v4, 2u);
    }
  }
}

- (void).cxx_destruct
{
}

@end