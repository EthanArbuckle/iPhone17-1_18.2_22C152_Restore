@interface ACCAuthorizationManager
+ (id)sharedManager;
+ (unint64_t)authorizationStatusForCertSerial:(id)a3;
+ (unint64_t)promptUserForAuthorizationOfAccessoryWithName:(id)a3 providesPower:(BOOL)a4 certSerial:(id)a5;
+ (void)forceRequestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6;
+ (void)requestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6;
- (ACCAuthorizationManager)init;
- (BOOL)bypassAuthorization;
- (NSMutableDictionary)notificationDictMutable;
- (void)setBypassAuthorization:(BOOL)a3;
- (void)setNotificationDictMutable:(id)a3;
@end

@implementation ACCAuthorizationManager

- (ACCAuthorizationManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)ACCAuthorizationManager;
  v2 = [(ACCAuthorizationManager *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    notificationDictMutable = v2->_notificationDictMutable;
    v2->_notificationDictMutable = v3;
  }
  return v2;
}

- (BOOL)bypassAuthorization
{
  v2 = +[ACCUserDefaults sharedDefaults];
  if ([v2 BOOLForKey:@"EnableTrustDialog"])
  {
    if (qword_10013BC58 != -1) {
      dispatch_once(&qword_10013BC58, &stru_1001238F8);
    }
    if (byte_10013BC50)
    {
      v4 = +[ACCUserDefaults sharedDefaults];
      unsigned __int8 v3 = [v4 BOOLForKey:@"BypassTrustDialog"];
    }
    else
    {
      unsigned __int8 v3 = 0;
    }
  }
  else
  {
    unsigned __int8 v3 = 1;
  }

  return v3;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F190;
  block[3] = &unk_100121CE8;
  block[4] = a1;
  if (qword_10013BC68 != -1) {
    dispatch_once(&qword_10013BC68, block);
  }
  v2 = (void *)qword_10013BC60;
  return v2;
}

+ (unint64_t)authorizationStatusForCertSerial:(id)a3
{
  id v3 = a3;
  v4 = +[ACCAuthorizationManager sharedManager];
  unsigned int v5 = [v4 bypassAuthorization];

  if (v5)
  {
    NSLog(@"Bypassing user authorization...");
    unint64_t v6 = 2;
  }
  else
  {
    v7 = +[ACCAccessoryAuthorizationStore authorizationEntryForCertSerial:v3];
    v8 = v7;
    if (v7)
    {
      if ([v7 authorized]) {
        unint64_t v6 = 2;
      }
      else {
        unint64_t v6 = 1;
      }
    }
    else
    {
      unint64_t v6 = 0;
    }
  }
  return v6;
}

+ (void)requestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  v11 = (void (**)(id, BOOL))a6;
  unint64_t v12 = +[ACCAuthorizationManager authorizationStatusForCertSerial:v9];
  NSLog(@"authorizationStatus: %lu", v12);
  if (v12)
  {
    if (v11) {
      v11[2](v11, v12 == 2);
    }
    goto LABEL_6;
  }
  uint64_t v13 = dispatch_get_global_queue(0, 0);
  if (v13)
  {
    v14 = v13;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002F3C0;
    block[3] = &unk_100123920;
    id v16 = v9;
    id v17 = v10;
    BOOL v19 = a5;
    v18 = v11;
    dispatch_async(v14, block);

LABEL_6:
    return;
  }
  __break(0x5510u);
}

+ (void)forceRequestAuthorizationForCertSerial:(id)a3 withName:(id)a4 providesPower:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v14 = a3;
  id v9 = (__CFString *)a4;
  id v10 = (void (**)(id, BOOL))a6;
  unint64_t v11 = +[ACCAuthorizationManager promptUserForAuthorizationOfAccessoryWithName:v9 providesPower:v7 certSerial:v14];
  if (v14 && [v14 length] && !v11)
  {
    unint64_t v12 = objc_alloc_init(ACCAccessoryAuthorizationEntry);
    [(ACCAccessoryAuthorizationEntry *)v12 setCertSerialString:v14];
    [(ACCAccessoryAuthorizationEntry *)v12 setAuthorized:1];
    if (v9) {
      CFStringRef v13 = v9;
    }
    else {
      CFStringRef v13 = &stru_10012A858;
    }
    [(ACCAccessoryAuthorizationEntry *)v12 setDisplayName:v13];
    +[ACCAccessoryAuthorizationStore storeAccessory:v12];
  }
  if (v10) {
    v10[2](v10, v11 == 0);
  }
}

+ (unint64_t)promptUserForAuthorizationOfAccessoryWithName:(id)a3 providesPower:(BOOL)a4 certSerial:(id)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = a5;
  id v9 = sub_10002EF44(@"ACC_AUTHORIZATION_NOTIFICATION_HEADER");
  id v10 = (void *)MGCopyAnswer();
  unint64_t v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7, v10);

  unint64_t v12 = sub_10002EF44(@"ACC_AUTHORIZATION_NOTIFICATION_MESSAGE");
  CFStringRef v13 = (void *)MGCopyAnswer();
  id v14 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v13);

  v43 = v7;
  if (!v7 || ![v7 length])
  {
    v15 = sub_10002EF44(@"ACC_AUTHORIZATION_NOTIFICATION_HEADER_NO_NAME");
    id v16 = (void *)MGCopyAnswer();
    uint64_t v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v15, v16);

    v18 = sub_10002EF44(@"ACC_AUTHORIZATION_NOTIFICATION_MESSAGE_NO_NAME");
    BOOL v19 = (void *)MGCopyAnswer();
    uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);

    unint64_t v11 = (void *)v17;
    id v14 = (void *)v20;
  }
  v46[0] = kCFUserNotificationAlertHeaderKey;
  v46[1] = kCFUserNotificationAlertMessageKey;
  v47[0] = v11;
  v47[1] = v14;
  v46[2] = kCFUserNotificationDefaultButtonTitleKey;
  v21 = sub_10002EF44(@"ACC_AUTHORIZATION_NOTIFICATION_ALLOW");
  v47[2] = v21;
  v46[3] = kCFUserNotificationAlternateButtonTitleKey;
  if (v6) {
    v22 = @"ACC_AUTHORIZATION_NOTIFICATION_CHARGE_ONLY";
  }
  else {
    v22 = @"ACC_AUTHORIZATION_NOTIFICATION_DONT_ALLOW";
  }
  v23 = sub_10002EF44(v22);
  v47[3] = v23;
  v46[4] = kCFUserNotificationAlertTopMostKey;
  v24 = +[NSNumber numberWithBool:1];
  v47[4] = v24;
  v46[5] = SBUserNotificationDismissOnLock;
  v25 = +[NSNumber numberWithBool:0];
  v47[5] = v25;
  v46[6] = SBUserNotificationDontDismissOnUnlock;
  v26 = +[NSNumber numberWithBool:1];
  v47[6] = v26;
  v46[7] = kCFUserNotificationIconURLKey;
  v27 = +[NSURL fileURLWithPath:@"/System/Library/PreferencePanes/Security.prefPane/Contents/Resources/FileVault.icns"];
  v47[7] = v27;
  CFDictionaryRef v28 = +[NSDictionary dictionaryWithObjects:v47 forKeys:v46 count:8];

  v29 = +[ACCAuthorizationManager sharedManager];
  v30 = [v29 notificationDictMutable];
  v31 = (__CFUserNotification *)[v30 objectForKey:v8];

  if (v31) {
    CFUserNotificationCancel(v31);
  }
  SInt32 error = -1431655766;
  v32 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v28);
  v33 = +[ACCAuthorizationManager sharedManager];
  v34 = [v33 notificationDictMutable];
  [v34 setObject:v32 forKey:v8];

  CFOptionFlags responseFlags = 0xAAAAAAAAAAAAAAAALL;
  CFUserNotificationReceiveResponse(v32, 0.0, &responseFlags);
  v35 = +[ACCAuthorizationManager sharedManager];
  v36 = [v35 notificationDictMutable];
  int v37 = CFEqual([v36 objectForKey:v8], v32);

  if (v37)
  {
    v38 = +[ACCAuthorizationManager sharedManager];
    v39 = [v38 notificationDictMutable];
    [v39 removeObjectForKey:v8];
  }
  CFRelease(v32);
  uint64_t v40 = 1;
  if (responseFlags != 1) {
    uint64_t v40 = 2;
  }
  if (responseFlags) {
    unint64_t v41 = v40;
  }
  else {
    unint64_t v41 = 0;
  }
  NSLog(@"promptResponse: %lu", v41);

  return v41;
}

- (void)setBypassAuthorization:(BOOL)a3
{
  self->_bypassAuthorization = a3;
}

- (NSMutableDictionary)notificationDictMutable
{
  return self->_notificationDictMutable;
}

- (void)setNotificationDictMutable:(id)a3
{
}

- (void).cxx_destruct
{
}

@end