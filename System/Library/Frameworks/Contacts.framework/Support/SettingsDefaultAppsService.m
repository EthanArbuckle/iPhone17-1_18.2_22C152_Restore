@interface SettingsDefaultAppsService
+ (SettingsDefaultAppsService)sharedInstance;
+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3;
- (BOOL)checkDefaultAppChanged:(unint64_t)a3 forPersistedKey:(__CFString *)a4;
- (BOOL)checkEligibleDefaultAppsCountChanged:(unint64_t)a3 forPersistedKey:(__CFString *)a4;
- (CNCancelable)coalescingToken;
- (CNInhibitor)coalescingInhibitor;
- (CNLaunchServices)launchServices;
- (CNPublishingSubject)coalescer;
- (CNScheduler)workQueue;
- (OS_dispatch_queue)delegateQueue;
- (SettingsDefaultAppsService)init;
- (id)interestedNotifications;
- (void)checkForAnyDefaultAppChanged;
- (void)coalesceChangeEvent;
- (void)configureCallCapabilitiesWithScheduler:(id)a3;
- (void)didChangeRelayCallingCapabilities;
- (void)didChangeTelephonyCallingSupport;
- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3;
- (void)handleCoalescedEvent:(id)a3;
- (void)handleNotificationName:(id)a3;
- (void)setCoalescer:(id)a3;
- (void)setCoalescingInhibitor:(id)a3;
- (void)setCoalescingToken:(id)a3;
- (void)setDelegateQueue:(id)a3;
@end

@implementation SettingsDefaultAppsService

+ (SettingsDefaultAppsService)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000AFE8;
  block[3] = &unk_100024B30;
  block[4] = a1;
  if (qword_10002C9D0 != -1) {
    dispatch_once(&qword_10002C9D0, block);
  }
  v2 = (void *)qword_10002C9D8;

  return (SettingsDefaultAppsService *)v2;
}

- (SettingsDefaultAppsService)init
{
  v19.receiver = self;
  v19.super_class = (Class)SettingsDefaultAppsService;
  v2 = [(SettingsDefaultAppsService *)&v19 init];
  if (v2)
  {
    v3 = +[CNSchedulerProvider defaultProvider];
    uint64_t v4 = [(id)objc_opt_class() makeWorkQueueUsingSchedulerProvider:v3];
    workQueue = v2->_workQueue;
    v2->_workQueue = (CNScheduler *)v4;

    v6 = (CNPublishingSubject *)objc_alloc_init((Class)CNPublishingSubject);
    coalescer = v2->_coalescer;
    v2->_coalescer = v6;

    v8 = [(CNPublishingSubject *)v2->_coalescer throttle:2 options:v3 schedulerProvider:2.0];
    v9 = +[CNObserver observerWithWeakTarget:v2 resultSelector:"handleCoalescedEvent:"];
    uint64_t v10 = [v8 subscribe:v9];
    coalescingToken = v2->_coalescingToken;
    v2->_coalescingToken = (CNCancelable *)v10;

    v12 = (CNLaunchServices *)objc_alloc_init((Class)CNLaunchServices);
    launchServices = v2->_launchServices;
    v2->_launchServices = v12;

    dispatch_queue_t v14 = dispatch_queue_create("com.apple.contactsd.callcapabilitiesmonitor", 0);
    delegateQueue = v2->_delegateQueue;
    v2->_delegateQueue = (OS_dispatch_queue *)v14;

    v16 = [v3 backgroundScheduler];
    [(SettingsDefaultAppsService *)v2 configureCallCapabilitiesWithScheduler:v16];

    v17 = v2;
  }

  return v2;
}

+ (id)makeWorkQueueUsingSchedulerProvider:(id)a3
{
  id v3 = [a3 newSerialSchedulerWithName:@"com.apple.contactsd.SettingsDefaultAppsService"];
  id v4 = [objc_alloc((Class)CNQualityOfServiceSchedulerDecorator) initWithScheduler:v3 qualityOfService:2];

  return v4;
}

- (void)configureCallCapabilitiesWithScheduler:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000B258;
  v3[3] = &unk_100024B98;
  v3[4] = self;
  [a3 performBlock:v3];
}

- (void)handleCoalescedEvent:(id)a3
{
  id v4 = [(SettingsDefaultAppsService *)self workQueue];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000B504;
  v5[3] = &unk_100024B98;
  v5[4] = self;
  [v4 performBlock:v5];
}

- (id)interestedNotifications
{
  return &off_100025CF8;
}

- (void)handleNotificationName:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"com.apple.LaunchServices.database"] & 1) != 0
    || [v4 isEqualToString:@"com.apple.TelephonyUtilities.DefaultAppRelayTelephonySettingChanged"])
  {
    v5 = +[CNContactsDaemonLogs settingsDefaultApps];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "event %@", (uint8_t *)&v6, 0xCu);
    }

    [(SettingsDefaultAppsService *)self coalesceChangeEvent];
  }
}

- (void)didChangeTelephonyCallingSupport
{
  id v3 = +[CNContactsDaemonLogs settingsDefaultApps];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "event didChangeTelephonyCallingSupport", v4, 2u);
  }

  [(SettingsDefaultAppsService *)self coalesceChangeEvent];
}

- (void)didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID:(id)a3
{
  id v4 = +[CNContactsDaemonLogs settingsDefaultApps];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "event didChangeThumperCallingCapabilitiesForSenderIdentityWithUUID", v5, 2u);
  }

  [(SettingsDefaultAppsService *)self coalesceChangeEvent];
}

- (void)didChangeRelayCallingCapabilities
{
  id v3 = +[CNContactsDaemonLogs settingsDefaultApps];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "event didChangeRelayCallingCapabilities", v4, 2u);
  }

  [(SettingsDefaultAppsService *)self coalesceChangeEvent];
}

- (void)coalesceChangeEvent
{
  id v3 = [(SettingsDefaultAppsService *)self workQueue];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000B860;
  v4[3] = &unk_100024B98;
  v4[4] = self;
  [v3 performBlock:v4];
}

- (void)checkForAnyDefaultAppChanged
{
  id v3 = +[CNContactsDaemonLogs settingsDefaultApps];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "SettingsDefaultAppsService will perform check.", buf, 2u);
  }

  unsigned __int8 v4 = [(SettingsDefaultAppsService *)self checkDefaultAppChanged:0 forPersistedKey:@"CNDefaultAppForMessaging"];
  unsigned __int8 v5 = [(SettingsDefaultAppsService *)self checkDefaultAppChanged:1 forPersistedKey:@"CNDefaultAppForCalling"];
  unsigned __int8 v6 = [(SettingsDefaultAppsService *)self checkEligibleDefaultAppsCountChanged:0 forPersistedKey:@"CNDefaultEligibleAppsCountForMessaging"];
  unsigned int v7 = [(SettingsDefaultAppsService *)self checkEligibleDefaultAppsCountChanged:1 forPersistedKey:@"CNDefaultElibibleAppsCountForCalling"];
  if ((v4 & 1) != 0 || (v5 & 1) != 0 || (v6 & 1) != 0 || v7)
  {
    v8 = +[CNContactsDaemonLogs settingsDefaultApps];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "SettingsDefaultAppsService found settings changed, posting notification.", v10, 2u);
    }

    v9 = +[NSDistributedNotificationCenter defaultCenter];
    [v9 postNotificationName:CNContactStoreSettingsDefaultAppsDidChangeNotification object:0];
  }
}

- (BOOL)checkDefaultAppChanged:(unint64_t)a3 forPersistedKey:(__CFString *)a4
{
  unint64_t v7 = (unint64_t)CFPreferencesCopyAppValue(a4, kCFPreferencesCurrentApplication);
  v8 = [(SettingsDefaultAppsService *)self launchServices];
  v9 = [v8 defaultApplicationForDefaultAppCategory:a3];

  uint64_t v10 = [v9 bundleIdentifier];
  if (v7 | v10 && ([(id)v7 isEqual:v10] & 1) == 0)
  {
    CFPreferencesSetAppValue(a4, (CFPropertyListRef)v10, kCFPreferencesCurrentApplication);
    v12 = +[CNContactsDaemonLogs settingsDefaultApps];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"calling";
      if (!a3) {
        CFStringRef v13 = @"messaging";
      }
      int v15 = 138412546;
      v16 = v9;
      __int16 v17 = 2112;
      CFStringRef v18 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "SettingsDefaultAppsService found default app changed to %@ for %@ category", (uint8_t *)&v15, 0x16u);
    }

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)checkEligibleDefaultAppsCountChanged:(unint64_t)a3 forPersistedKey:(__CFString *)a4
{
  CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(a4, kCFPreferencesCurrentApplication, 0);
  v8 = [(SettingsDefaultAppsService *)self launchServices];
  v9 = [v8 applicationsAvailableForDefaultAppCategory:a3];

  id v10 = [v9 count];
  if ((id)AppIntegerValue != v10)
  {
    CFPreferencesSetAppValue(a4, +[NSNumber numberWithLong:v10], kCFPreferencesCurrentApplication);
    BOOL v11 = +[CNContactsDaemonLogs settingsDefaultApps];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = +[NSNumber numberWithLong:v10];
      CFStringRef v13 = (void *)v12;
      CFStringRef v14 = @"calling";
      if (!a3) {
        CFStringRef v14 = @"messaging";
      }
      int v16 = 138412546;
      uint64_t v17 = v12;
      __int16 v18 = 2112;
      CFStringRef v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "SettingsDefaultAppsService found eligible default apps count changed to %@ for %@ category", (uint8_t *)&v16, 0x16u);
    }
  }

  return AppIntegerValue != (void)v10;
}

- (CNPublishingSubject)coalescer
{
  return self->_coalescer;
}

- (void)setCoalescer:(id)a3
{
}

- (CNCancelable)coalescingToken
{
  return self->_coalescingToken;
}

- (void)setCoalescingToken:(id)a3
{
}

- (CNScheduler)workQueue
{
  return self->_workQueue;
}

- (CNInhibitor)coalescingInhibitor
{
  return self->_coalescingInhibitor;
}

- (void)setCoalescingInhibitor:(id)a3
{
}

- (CNLaunchServices)launchServices
{
  return self->_launchServices;
}

- (OS_dispatch_queue)delegateQueue
{
  return self->_delegateQueue;
}

- (void)setDelegateQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegateQueue, 0);
  objc_storeStrong((id *)&self->_launchServices, 0);
  objc_storeStrong((id *)&self->_coalescingInhibitor, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_coalescingToken, 0);

  objc_storeStrong((id *)&self->_coalescer, 0);
}

@end