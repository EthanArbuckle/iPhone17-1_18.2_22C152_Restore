@interface IDSDaemonCapabilities
+ (id)sharedInstance;
- (IDSDaemonCapabilities)init;
- (MGNotificationTokenStruct)MGVeniceChangedToken;
- (int)supportedServicesToken;
- (void)_deferredUpdateCapabilities;
- (void)_listenForMGChanges;
- (void)_setupTokens;
- (void)_updateCapabilities;
- (void)carrierBundleInformationDidChange;
- (void)dealloc;
- (void)setMGVeniceChangedToken:(MGNotificationTokenStruct *)a3;
- (void)setSupportedServicesToken:(int)a3;
@end

@implementation IDSDaemonCapabilities

+ (id)sharedInstance
{
  if (qword_100A4C2E0 != -1) {
    dispatch_once(&qword_100A4C2E0, &stru_100986878);
  }
  v2 = (void *)qword_100A4C2E8;

  return v2;
}

- (IDSDaemonCapabilities)init
{
  v5.receiver = self;
  v5.super_class = (Class)IDSDaemonCapabilities;
  v2 = [(IDSDaemonCapabilities *)&v5 init];
  if (v2)
  {
    v3 = +[IDSCTAdapter sharedInstance];
    [v3 addListener:v2];

    [(IDSDaemonCapabilities *)v2 _setupTokens];
    [(IDSDaemonCapabilities *)v2 _listenForMGChanges];
    [(IDSDaemonCapabilities *)v2 _updateCapabilities];
  }
  return v2;
}

- (void)dealloc
{
  MGCancelNotifications();
  v3.receiver = self;
  v3.super_class = (Class)IDSDaemonCapabilities;
  [(IDSDaemonCapabilities *)&v3 dealloc];
}

- (void)_updateCapabilities
{
  unsigned int v3 = sub_1002302FC(@"AllowiMessage", (id)1);
  unsigned int v4 = sub_1002302FC(@"AllowsFaceTimeAudio", 0);
  int v5 = MGGetBoolAnswer();
  int v6 = MGGetBoolAnswer();
  int v7 = v6;
  int v8 = v4 | v5 ^ 1;
  uint64_t v9 = v3 | 2;
  if ((v8 & 1) == 0) {
    uint64_t v9 = v3;
  }
  uint64_t v10 = v9 | 4;
  if (v6) {
    uint64_t v11 = v10;
  }
  else {
    uint64_t v11 = v3;
  }
  v12 = +[IMRGLog registration];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v13 = @"NO";
    if (v3) {
      CFStringRef v14 = @"YES";
    }
    else {
      CFStringRef v14 = @"NO";
    }
    int v19 = 138413058;
    CFStringRef v20 = v14;
    if ((v7 & v8) != 0) {
      CFStringRef v15 = @"YES";
    }
    else {
      CFStringRef v15 = @"NO";
    }
    __int16 v21 = 2112;
    CFStringRef v22 = v15;
    if (v7) {
      CFStringRef v13 = @"YES";
    }
    __int16 v23 = 2112;
    CFStringRef v24 = v13;
    __int16 v25 = 2048;
    uint64_t v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Posting iMessage allowed value from IDSDaemonCapabilities { allowiMessage: %@, allowFaceTimeAudio: %@, allowFaceTimeMultiway: %@, supportedServicesFlags: %llu }", (uint8_t *)&v19, 0x2Au);
  }

  notify_set_state(self->_supportedServicesToken, v11);
  v16 = (const char *)IMUserScopedNotification();
  notify_post(v16);
  v17 = +[FTServiceStatus sharedInstance];
  [v17 _reload];

  v18 = +[FTDeviceSupport sharedInstance];
  [v18 _updateCapabilities];
}

- (void)_listenForMGChanges
{
  if (![(IDSDaemonCapabilities *)self MGVeniceChangedToken])
  {
    CFStringRef v3 = @"venice";
    +[NSArray arrayWithObjects:&v3 count:1];
    [(IDSDaemonCapabilities *)self setMGVeniceChangedToken:MGRegisterForUpdates()];
  }
}

- (void)_setupTokens
{
  CFStringRef v3 = (const char *)IMUserScopedNotification();

  notify_register_check(v3, &self->_supportedServicesToken);
}

- (void)carrierBundleInformationDidChange
{
  CFStringRef v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "IDSDaemonCapabilities received bundle info did change callback -- updating capabilities", v4, 2u);
  }

  [(IDSDaemonCapabilities *)self _deferredUpdateCapabilities];
}

- (void)_deferredUpdateCapabilities
{
  dispatch_time_t v3 = dispatch_time(0, 1000000000);
  unsigned int v4 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100230788;
  block[3] = &unk_10097E4D0;
  block[4] = self;
  dispatch_after(v3, v4, block);
}

- (int)supportedServicesToken
{
  return self->_supportedServicesToken;
}

- (void)setSupportedServicesToken:(int)a3
{
  self->_supportedServicesToken = a3;
}

- (MGNotificationTokenStruct)MGVeniceChangedToken
{
  return self->_MGVeniceChangedToken;
}

- (void)setMGVeniceChangedToken:(MGNotificationTokenStruct *)a3
{
  self->_MGVeniceChangedToken = a3;
}

@end