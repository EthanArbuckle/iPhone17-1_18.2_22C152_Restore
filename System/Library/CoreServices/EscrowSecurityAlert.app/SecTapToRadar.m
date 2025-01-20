@interface SecTapToRadar
+ (BOOL)askUserIfTTR:(id)a3;
+ (BOOL)isRateLimited:(id)a3;
+ (id)keyname:(id)a3;
+ (void)disableTTRsEntirely;
+ (void)triggerTapToRadar:(id)a3;
- (BOOL)isRateLimited;
- (NSString)alert;
- (NSString)componentID;
- (NSString)componentName;
- (NSString)componentVersion;
- (NSString)radarDescription;
- (NSString)radarnumber;
- (OS_dispatch_queue)queue;
- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5;
- (void)clearRetryTimestamp;
- (void)setAlert:(id)a3;
- (void)setComponentID:(id)a3;
- (void)setComponentName:(id)a3;
- (void)setComponentVersion:(id)a3;
- (void)setQueue:(id)a3;
- (void)setRadarDescription:(id)a3;
- (void)setRadarnumber:(id)a3;
- (void)trigger;
- (void)updateRetryTimestamp;
@end

@implementation SecTapToRadar

- (id)initTapToRadar:(id)a3 description:(id)a4 radar:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v23.receiver = self;
  v23.super_class = (Class)SecTapToRadar;
  v12 = [(SecTapToRadar *)&v23 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_alert, a3);
    objc_storeStrong((id *)&v13->_radarDescription, a4);
    objc_storeStrong((id *)&v13->_radarnumber, a5);
    dispatch_queue_t v14 = dispatch_queue_create("com.apple.EscrowSecurityAlert.diagnostic-queue", 0);
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v14;

    v16 = v13->_queue;
    v17 = dispatch_get_global_queue(-32768, 0);
    dispatch_set_target_queue(v16, v17);

    componentName = v13->_componentName;
    v13->_componentName = (NSString *)@"CloudServices";

    componentVersion = v13->_componentVersion;
    v13->_componentVersion = (NSString *)@"all";

    componentID = v13->_componentID;
    v13->_componentID = (NSString *)@"507587";

    v21 = v13;
  }

  return v13;
}

+ (id)keyname:(id)a3
{
  v3 = [a3 radarnumber];
  v4 = +[NSString stringWithFormat:@"%@-%@", @"NextTTRDate", v3];

  return v4;
}

+ (BOOL)isRateLimited:(id)a3
{
  if (byte_100015CE0) {
    return 1;
  }
  else {
    return [a3 isRateLimited];
  }
}

- (BOOL)isRateLimited
{
  id v3 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.EscrowSecurityAlert"];
  v4 = [(id)objc_opt_class() keyname:self];
  v5 = [v3 valueForKey:v4];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v6 = +[NSDate date];
    BOOL v7 = [v5 compare:v6] != (id)-1;
  }
  else
  {
    [v3 removeObjectForKey:v4];
    BOOL v7 = 0;
  }

  return v7;
}

+ (void)disableTTRsEntirely
{
  byte_100015CE0 = 1;
}

- (void)updateRetryTimestamp
{
  id v6 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.EscrowSecurityAlert"];
  id v3 = +[NSDate date];
  v4 = [v3 dateByAddingTimeInterval:86400.0];
  v5 = [(id)objc_opt_class() keyname:self];
  [v6 setObject:v4 forKey:v5];
}

- (void)clearRetryTimestamp
{
  id v4 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.EscrowSecurityAlert"];
  id v3 = [(id)objc_opt_class() keyname:self];
  [v4 removeObjectForKey:v3];
}

+ (void)triggerTapToRadar:(id)a3
{
  id v3 = a3;
  id v4 = CloudServicesLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = [v3 alert];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Triggering TTR: %@", (uint8_t *)&buf, 0xCu);
  }
  id v6 = [v3 queue];
  dispatch_assert_queue_V2(v6);

  if (qword_100015CE8 != -1) {
    dispatch_once(&qword_100015CE8, &stru_1000106B8);
  }
  uint64_t v26 = 0;
  v27 = &v26;
  uint64_t v28 = 0x2050000000;
  BOOL v7 = (void *)qword_100015CF8;
  uint64_t v29 = qword_100015CF8;
  if (!qword_100015CF8)
  {
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    v31 = sub_100007694;
    v32 = &unk_100010720;
    v33 = &v26;
    sub_100007694((uint64_t)&buf);
    BOOL v7 = (void *)v27[3];
  }
  id v8 = v7;
  _Block_object_dispose(&v26, 8);
  if (v8)
  {
    id v9 = [v3 alert];
    id v10 = [v3 radarnumber];
    v25 = +[NSString stringWithFormat:@"Triggered ESATTR: %@ - %@", v9, v10];

    objc_super v23 = [v25 stringByAddingPercentEncodingWithAllowedCharacters:qword_100015CF0];
    id v11 = [v3 radarDescription];
    v12 = [v3 radarnumber];
    v24 = +[NSString stringWithFormat:@"%@\nRelated radar: rdar://%@", v11, v12];

    v22 = [v24 stringByAddingPercentEncodingWithAllowedCharacters:qword_100015CF0];
    v13 = [v3 componentName];
    dispatch_queue_t v14 = [v13 stringByAddingPercentEncodingWithAllowedCharacters:qword_100015CF0];
    v15 = [v3 componentVersion];
    v16 = [v15 stringByAddingPercentEncodingWithAllowedCharacters:qword_100015CF0];
    v17 = [v3 componentID];
    v18 = [v17 stringByAddingPercentEncodingWithAllowedCharacters:qword_100015CF0];
    v19 = +[NSString stringWithFormat:@"tap-to-radar://new?Title=%@&ComponentName=%@&ComponentVersion=%@&Reproducibility=Not%%20Applicable&ComponentID=%@&Classification=Crash/Hang/Data%%20Loss&Description=%@", v23, v14, v16, v18, v22];

    v20 = +[NSURL URLWithString:v19];
    v21 = [v8 defaultWorkspace];
    [v21 openURL:v20 configuration:0 completionHandler:&stru_1000106F8];
  }
}

+ (BOOL)askUserIfTTR:(id)a3
{
  v12[0] = kCFUserNotificationDefaultButtonTitleKey;
  v12[1] = kCFUserNotificationAlternateButtonTitleKey;
  v13[0] = @"Tap-To-Radar";
  v13[1] = @"Go away";
  v12[2] = kCFUserNotificationAlertMessageKey;
  id v3 = [a3 alert];
  v12[3] = kCFUserNotificationAlertHeaderKey;
  v13[2] = v3;
  v13[3] = @"EscrowSecurityAlert";
  CFDictionaryRef v4 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:4];

  SInt32 error = 0;
  v5 = CFUserNotificationCreate(0, 0.0, 3uLL, &error, v4);
  if (v5)
  {
    id v6 = v5;
    CFOptionFlags responseFlags = 0;
    CFUserNotificationReceiveResponse(v5, 180.0, &responseFlags);
    BOOL v7 = (responseFlags & 3) == 0;
    CFRelease(v6);
  }
  else
  {
    id v8 = CloudServicesLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_10000A618((unsigned int *)&error, v8);
    }

    BOOL v7 = 0;
  }

  return v7;
}

- (void)trigger
{
  id v3 = [(SecTapToRadar *)self queue];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100007464;
  block[3] = &unk_1000105D0;
  block[4] = self;
  dispatch_sync(v3, block);
}

- (NSString)componentID
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setComponentID:(id)a3
{
}

- (NSString)componentName
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void)setComponentName:(id)a3
{
}

- (NSString)componentVersion
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setComponentVersion:(id)a3
{
}

- (NSString)alert
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setAlert:(id)a3
{
}

- (NSString)radarDescription
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setRadarDescription:(id)a3
{
}

- (NSString)radarnumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setRadarnumber:(id)a3
{
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_radarnumber, 0);
  objc_storeStrong((id *)&self->_radarDescription, 0);
  objc_storeStrong((id *)&self->_alert, 0);
  objc_storeStrong((id *)&self->_componentVersion, 0);
  objc_storeStrong((id *)&self->_componentName, 0);

  objc_storeStrong((id *)&self->_componentID, 0);
}

@end