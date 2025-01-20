@interface ADBuddyMonitor
+ (id)sharedManager;
- (ADBuddyMonitor)init;
- (BOOL)_checkBuddyState;
- (BOOL)isPastBuddy;
- (void)_updateBuddyState;
- (void)dealloc;
@end

@implementation ADBuddyMonitor

- (void).cxx_destruct
{
}

- (BOOL)isPastBuddy
{
  return self->_isPastBuddy;
}

- (BOOL)_checkBuddyState
{
  return off_1005812A0() ^ 1;
}

- (void)_updateBuddyState
{
  serialQueue = self->_serialQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10012474C;
  block[3] = &unk_10050E138;
  block[4] = self;
  dispatch_async(serialQueue, block);
}

- (void)dealloc
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  off_100581290();
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, v4, 0);

  v5 = CFNotificationCenterGetDarwinNotifyCenter();
  off_100581298();
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFNotificationCenterRemoveObserver(v5, self, v6, 0);

  v7.receiver = self;
  v7.super_class = (Class)ADBuddyMonitor;
  [(ADBuddyMonitor *)&v7 dealloc];
}

- (ADBuddyMonitor)init
{
  v14.receiver = self;
  v14.super_class = (Class)ADBuddyMonitor;
  v2 = [(ADBuddyMonitor *)&v14 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("Buddy Monitor Queue", v3);

    serialQueue = v2->_serialQueue;
    v2->_serialQueue = (OS_dispatch_queue *)v4;

    unsigned int v6 = [(ADBuddyMonitor *)v2 _checkBuddyState];
    v2->_isPastBuddy = v6;
    objc_super v7 = AFSiriLogContextDaemon;
    if (os_log_type_enabled(AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
    {
      CFStringRef v8 = @"running";
      if (v6) {
        CFStringRef v8 = @"complete";
      }
      *(_DWORD *)buf = 136315394;
      v16 = "-[ADBuddyMonitor init]";
      __int16 v17 = 2112;
      CFStringRef v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "%s Buddy is %@", buf, 0x16u);
    }
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    off_100581290();
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)sub_100124CD8, v10, 0, CFNotificationSuspensionBehaviorDrop);

    v11 = CFNotificationCenterGetDarwinNotifyCenter();
    off_100581298();
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    CFNotificationCenterAddObserver(v11, v2, (CFNotificationCallback)sub_100124CD8, v12, 0, CFNotificationSuspensionBehaviorDrop);

    [(ADBuddyMonitor *)v2 _updateBuddyState];
  }
  return v2;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100124E38;
  block[3] = &unk_10050E350;
  block[4] = a1;
  if (qword_100585C08 != -1) {
    dispatch_once(&qword_100585C08, block);
  }
  v2 = (void *)qword_100585C10;
  return v2;
}

@end