@interface ADFMDMonitor
+ (id)sharedManager;
- (ADFMDMonitor)init;
- (BOOL)_fetchLostModeState;
- (BOOL)isLostModeActive;
- (void)_updateLostModeState;
- (void)dealloc;
@end

@implementation ADFMDMonitor

- (void).cxx_destruct
{
}

- (BOOL)isLostModeActive
{
  return self->_isLostModeActive;
}

- (BOOL)_fetchLostModeState
{
  v2 = [off_100585148() sharedInstance];
  unsigned __int8 v3 = [v2 lostModeIsActive];

  return v3;
}

- (void)_updateLostModeState
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100359744;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  off_100585140();
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  v5.receiver = self;
  v5.super_class = (Class)ADFMDMonitor;
  [(ADFMDMonitor *)&v5 dealloc];
}

- (ADFMDMonitor)init
{
  v12.receiver = self;
  v12.super_class = (Class)ADFMDMonitor;
  v2 = [(ADFMDMonitor *)&v12 init];
  if (v2)
  {
    unsigned __int8 v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Find My Device Monitor Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    off_100585140();
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100359B40, v7, 0, CFNotificationSuspensionBehaviorDrop);

    unsigned int v8 = [(ADFMDMonitor *)v2 _fetchLostModeState];
    v2->_isLostModeActive = v8;
    v9 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v10 = @"not lost";
      if (v8) {
        CFStringRef v10 = @"lost";
      }
      *(_DWORD *)buf = 136315394;
      v14 = "-[ADFMDMonitor init]";
      __int16 v15 = 2112;
      CFStringRef v16 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%s Device is %@", buf, 0x16u);
    }
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100359BE8;
  block[3] = &unk_10050E350;
  block[4] = a1;
  if (qword_100586418 != -1) {
    dispatch_once(&qword_100586418, block);
  }
  v2 = (void *)qword_100586420;
  return v2;
}

@end