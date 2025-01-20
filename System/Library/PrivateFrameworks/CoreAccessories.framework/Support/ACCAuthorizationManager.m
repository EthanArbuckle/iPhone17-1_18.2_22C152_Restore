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
    if (systemInfo_isInternalBuild())
    {
      v3 = +[ACCUserDefaults sharedDefaults];
      unsigned __int8 v4 = [v3 BOOLForKey:@"BypassTrustDialog"];
    }
    else
    {
      unsigned __int8 v4 = 0;
    }
  }
  else
  {
    unsigned __int8 v4 = 1;
  }

  return v4;
}

+ (id)sharedManager
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = __40__ACCAuthorizationManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_once_8 != -1) {
    dispatch_once(&sharedManager_once_8, block);
  }
  v2 = (void *)sharedManager_sharedInstance_8;

  return v2;
}

uint64_t __40__ACCAuthorizationManager_sharedManager__block_invoke(uint64_t a1)
{
  sharedManager_sharedInstance_8 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));

  return _objc_release_x1();
}

+ (unint64_t)authorizationStatusForCertSerial:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = +[ACCAuthorizationManager sharedManager];
  unsigned int v5 = [v4 bypassAuthorization];

  if (v5)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      unint64_t v6 = 2;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "[#AuthorizationManager] Bypassing user authorization...", v10, 2u);
    }
    else
    {
      unint64_t v6 = 2;
    }
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
  id v11 = a6;
  uint64_t v12 = +[ACCAuthorizationManager authorizationStatusForCertSerial:v9];
  if (!os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG))
  {
    if (v12) {
      goto LABEL_3;
    }
LABEL_6:
    v13 = dispatch_get_global_queue(0, 0);
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = __102__ACCAuthorizationManager_requestAuthorizationForCertSerial_withName_providesPower_completionHandler___block_invoke;
    v14[3] = &unk_100219870;
    id v15 = v9;
    id v16 = v10;
    BOOL v18 = a5;
    id v17 = v11;
    dispatch_async(v13, v14);

    goto LABEL_7;
  }
  +[ACCAuthorizationManager requestAuthorizationForCertSerial:withName:providesPower:completionHandler:](v12);
  if (!v12) {
    goto LABEL_6;
  }
LABEL_3:
  if (v11) {
    (*((void (**)(id, BOOL))v11 + 2))(v11, v12 == 2);
  }
LABEL_7:
}

id __102__ACCAuthorizationManager_requestAuthorizationForCertSerial_withName_providesPower_completionHandler___block_invoke(uint64_t a1)
{
  return +[ACCAuthorizationManager forceRequestAuthorizationForCertSerial:*(void *)(a1 + 32) withName:*(void *)(a1 + 40) providesPower:*(unsigned __int8 *)(a1 + 56) completionHandler:*(void *)(a1 + 48)];
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
    uint64_t v12 = objc_alloc_init(ACCAccessoryAuthorizationEntry);
    [(ACCAccessoryAuthorizationEntry *)v12 setCertSerialString:v14];
    [(ACCAccessoryAuthorizationEntry *)v12 setAuthorized:1];
    if (v9) {
      CFStringRef v13 = v9;
    }
    else {
      CFStringRef v13 = &stru_10021CEF8;
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
  id v9 = acc_strings_bundle();
  id v10 = [v9 localizedStringForKey:@"“%@” Would Like to Communicate With Your %@" value:&stru_10021CEF8 table:0];
  unint64_t v11 = (void *)MGCopyAnswer();
  uint64_t v12 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v10, v7, v11);

  CFStringRef v13 = acc_strings_bundle();
  id v14 = [v13 localizedStringForKey:@"This accessory may access information from your %@ when connected." value:&stru_10021CEF8 table:0];
  id v15 = (void *)MGCopyAnswer();
  id v16 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v15);

  v52 = v7;
  if (!v7 || ![v7 length])
  {
    id v17 = acc_strings_bundle();
    BOOL v18 = [v17 localizedStringForKey:@"An Accessory Would Like to Communicate With Your %@" value:&stru_10021CEF8 table:0];
    v19 = (void *)MGCopyAnswer();
    uint64_t v20 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v19);

    v21 = acc_strings_bundle();
    v22 = [v21 localizedStringForKey:@"The attached accessory may access information from your %@ when connected." value:&stru_10021CEF8 table:0];
    v23 = (void *)MGCopyAnswer();
    uint64_t v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, v23);

    uint64_t v12 = (void *)v20;
    id v16 = (void *)v24;
  }
  v55[0] = kCFUserNotificationAlertHeaderKey;
  v55[1] = kCFUserNotificationAlertMessageKey;
  v50 = v16;
  v51 = v12;
  v56[0] = v12;
  v56[1] = v16;
  v55[2] = kCFUserNotificationDefaultButtonTitleKey;
  v25 = acc_strings_bundle();
  v26 = [v25 localizedStringForKey:@"Trust" value:&stru_10021CEF8 table:0];
  v56[2] = v26;
  v55[3] = kCFUserNotificationAlternateButtonTitleKey;
  v27 = acc_strings_bundle();
  v28 = v27;
  if (v6) {
    CFStringRef v29 = @"Charge Only";
  }
  else {
    CFStringRef v29 = @"Don’t Trust";
  }
  v30 = [v27 localizedStringForKey:v29 value:&stru_10021CEF8 table:0];
  v56[3] = v30;
  v55[4] = kCFUserNotificationAlertTopMostKey;
  v31 = +[NSNumber numberWithBool:1];
  v56[4] = v31;
  v55[5] = SBUserNotificationDismissOnLock;
  v32 = +[NSNumber numberWithBool:0];
  v56[5] = v32;
  v55[6] = SBUserNotificationDontDismissOnUnlock;
  v33 = +[NSNumber numberWithBool:1];
  v56[6] = v33;
  v55[7] = kCFUserNotificationIconURLKey;
  v34 = +[NSURL fileURLWithPath:@"/System/Library/PreferencePanes/Security.prefPane/Contents/Resources/FileVault.icns"];
  v56[7] = v34;
  CFDictionaryRef v35 = +[NSDictionary dictionaryWithObjects:v56 forKeys:v55 count:8];

  v36 = +[ACCAuthorizationManager sharedManager];
  v37 = [v36 notificationDictMutable];
  v38 = (__CFUserNotification *)[v37 objectForKey:v8];

  if (v38) {
    CFUserNotificationCancel(v38);
  }
  SInt32 error = -1431655766;
  v39 = CFUserNotificationCreate(kCFAllocatorDefault, 0.0, 3uLL, &error, v35);
  v40 = +[ACCAuthorizationManager sharedManager];
  v41 = [v40 notificationDictMutable];
  [v41 setObject:v39 forKey:v8];

  CFOptionFlags responseFlags = 0xAAAAAAAAAAAAAAAALL;
  CFUserNotificationReceiveResponse(v39, 0.0, &responseFlags);
  v42 = +[ACCAuthorizationManager sharedManager];
  v43 = [v42 notificationDictMutable];
  int v44 = CFEqual([v43 objectForKey:v8], v39);

  if (v44)
  {
    v45 = +[ACCAuthorizationManager sharedManager];
    v46 = [v45 notificationDictMutable];
    [v46 removeObjectForKey:v8];
  }
  CFRelease(v39);
  uint64_t v47 = 1;
  if (responseFlags != 1) {
    uint64_t v47 = 2;
  }
  if (responseFlags) {
    unint64_t v48 = v47;
  }
  else {
    unint64_t v48 = 0;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    +[ACCAuthorizationManager promptUserForAuthorizationOfAccessoryWithName:providesPower:certSerial:](v48);
  }

  return v48;
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

+ (void)requestAuthorizationForCertSerial:(uint64_t)a1 withName:providesPower:completionHandler:.cold.1(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[#AuthorizationManager] authorizationStatus: %lu", (uint8_t *)&v1, 0xCu);
}

+ (void)promptUserForAuthorizationOfAccessoryWithName:(uint64_t)a1 providesPower:certSerial:.cold.1(uint64_t a1)
{
  int v1 = 134217984;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "[#AuthorizationManager] promptResponse: %lu", (uint8_t *)&v1, 0xCu);
}

@end