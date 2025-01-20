@interface ATEnforcementService
+ (BOOL)isAppTrackingTransparencyEnforced;
+ (NSString)bagSubProfile;
+ (NSString)bagSubProfileVersion;
+ (id)appTrackingTransparencyBag;
+ (int64_t)appTrackingTransparencyEnforcementReason;
+ (int64_t)reasonCodeFromNumberValue:(id)a3;
- (BOOL)isInternalInstall;
- (int64_t)numberOfDayFrom:(id)a3 andNow:(id)a4;
- (void)appTrackingEnforcement:(id)a3;
@end

@implementation ATEnforcementService

+ (NSString)bagSubProfile
{
  if (qword_100008DF0 != -1) {
    dispatch_once(&qword_100008DF0, &stru_1000042B8);
  }
  v2 = (void *)qword_100008DF8;

  return (NSString *)v2;
}

+ (NSString)bagSubProfileVersion
{
  if (qword_100008E00 != -1) {
    dispatch_once(&qword_100008E00, &stru_1000042D8);
  }
  v2 = (void *)qword_100008E08;

  return (NSString *)v2;
}

+ (id)appTrackingTransparencyBag
{
  if (qword_100008E10 != -1) {
    dispatch_once(&qword_100008E10, &stru_1000042F8);
  }
  id v2 = [objc_alloc((Class)AMSProcessInfo) initWithBundleIdentifier:@"com.apple.AppTrackingTransparency.EnforcementService"];
  v3 = [v2 executableName];
  id v4 = [v3 length];

  if (!v4)
  {
    v5 = +[NSProcessInfo processInfo];
    v6 = [v5 processName];
    [v2 setExecutableName:v6];
  }
  v7 = +[ATEnforcementService bagSubProfile];
  v8 = +[ATEnforcementService bagSubProfileVersion];
  v9 = +[AMSBag bagForProfile:v7 profileVersion:v8 processInfo:v2];

  return v9;
}

+ (BOOL)isAppTrackingTransparencyEnforced
{
  id v2 = [a1 appTrackingTransparencyBag];
  v3 = [v2 BOOLForKey:@"IsAppTrackingTransparencyEnforced"];
  id v10 = 0;
  id v4 = [v3 valueWithError:&v10];
  id v5 = v10;
  if (v4)
  {
    unsigned __int8 v6 = [v4 BOOLValue];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      v12 = v7;
      __int16 v13 = 2112;
      id v14 = v5;
      id v8 = v7;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Unable to get the 'IsAppTrackingTransparencyEnforced' value from the bag. Error: %@", buf, 0x16u);
    }
    unsigned __int8 v6 = 1;
  }

  return v6;
}

+ (int64_t)appTrackingTransparencyEnforcementReason
{
  v3 = [a1 appTrackingTransparencyBag];
  id v4 = [v3 integerForKey:@"AppTrackingTransparencyEnforcementReason"];
  id v11 = 0;
  id v5 = [v4 valueWithError:&v11];
  id v6 = v11;
  if (v5)
  {
    id v7 = [a1 reasonCodeFromNumberValue:v5];
  }
  else
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v8 = objc_opt_class();
      *(_DWORD *)buf = 138412546;
      __int16 v13 = v8;
      __int16 v14 = 2112;
      id v15 = v6;
      id v9 = v8;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "%@: Unable to get the 'AppTrackingTransparencyEnforcementReason' value from the bag. Error: %@", buf, 0x16u);
    }
    id v7 = 0;
  }

  return (int64_t)v7;
}

- (void)appTrackingEnforcement:(id)a3
{
  id v4 = (void (**)(id, id, id, uint64_t))a3;
  if ([(ATEnforcementService *)self isInternalInstall])
  {
    id v5 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.AppTrackingTransparency"];
    uint64_t v6 = [v5 objectForKey:@"TrackingEnforced"];
    if (v6)
    {
      id v7 = (void *)v6;
      id v8 = [v5 objectForKey:@"ReasonCode"];

      if (v8)
      {
        v4[2](v4, [v5 BOOLForKey:@"TrackingEnforced"], objc_msgSend(v5, "integerForKey:", @"ReasonCode"), 1);
        goto LABEL_15;
      }
    }
  }
  id v5 = +[NSDate date];
  id v20 = 0;
  id v9 = +[ATKeychainStore objectForKey:@"EnforcementService.enforced" error:&v20];
  id v10 = v20;
  id v19 = v10;
  id v11 = +[ATKeychainStore objectForKey:@"EnforcementService.reasonCode" error:&v19];
  id v12 = v19;

  id v18 = v12;
  __int16 v13 = +[ATKeychainStore objectForKey:@"EnforcementService.lastBagLookup" error:&v18];
  id v14 = v18;

  if (v9 && v13 && !v14) {
    v4[2](v4, [v9 BOOLValue], (id)+[ATEnforcementService reasonCodeFromNumberValue:](ATEnforcementService, "reasonCodeFromNumberValue:", v11), 0);
  }
  else {
    v4[2](v4, (id)1, 0, 1);
  }
  if ([(ATEnforcementService *)self numberOfDayFrom:v13 andNow:v5] > 0 || !v13)
  {
    BOOL v15 = +[ATEnforcementService isAppTrackingTransparencyEnforced];
    v16 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", +[ATEnforcementService appTrackingTransparencyEnforcementReason]);
    v17 = +[NSNumber numberWithBool:v15];
    +[ATKeychainStore setObject:v17 forKey:@"EnforcementService.enforced"];

    +[ATKeychainStore setObject:v16 forKey:@"EnforcementService.reasonCode"];
    +[ATKeychainStore setObject:v5 forKey:@"EnforcementService.lastBagLookup"];
  }
LABEL_15:
}

- (int64_t)numberOfDayFrom:(id)a3 andNow:(id)a4
{
  if (!a3) {
    return 0;
  }
  id v5 = a4;
  id v6 = a3;
  id v7 = +[NSCalendar currentCalendar];
  id v14 = 0;
  [v7 rangeOfUnit:16 startDate:&v14 interval:0 forDate:v6];

  id v8 = v14;
  id v13 = 0;
  [v7 rangeOfUnit:16 startDate:&v13 interval:0 forDate:v5];

  id v9 = v13;
  id v10 = [v7 components:16 fromDate:v8 toDate:v9 options:0];
  id v11 = [v10 day];

  return (int64_t)v11;
}

- (BOOL)isInternalInstall
{
  return _MGGetBoolAnswer(@"apple-internal-install", a2);
}

+ (int64_t)reasonCodeFromNumberValue:(id)a3
{
  int64_t result = (int64_t)[a3 integerValue];
  if (result == 1001) {
    int64_t v4 = 1001;
  }
  else {
    int64_t v4 = 0;
  }
  if (result != 1002) {
    return v4;
  }
  return result;
}

@end