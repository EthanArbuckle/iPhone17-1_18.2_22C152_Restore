uint64_t sub_1000034B4()
{
  if (qword_100015CA0 != -1) {
    dispatch_once(&qword_100015CA0, &stru_100010578);
  }
  return byte_100015C98;
}

void sub_1000034F8(id a1)
{
  byte_100015C98 = SecIsInternalRelease();
}

void sub_100003EE0(uint64_t a1, uint64_t a2)
{
  v3 = CloudServicesLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v41 = "void response(CFUserNotificationRef, CFOptionFlags)";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "In %s", buf, 0xCu);
  }

  if (a2 == 2)
  {
    [(id)qword_100015CA8 notificationSnoozed];
    if (dword_100015CC0 == 1)
    {
      CFStringRef v4 = @"https://support.apple.com/kb/HT5834";
    }
    else
    {
      if (dword_100015CC0 != 2)
      {
        v5 = 0;
        goto LABEL_19;
      }
      CFStringRef v4 = @"https://support.apple.com/kb/HT205011";
    }
    v5 = +[NSURL URLWithString:v4];
LABEL_19:
    v18 = +[LSApplicationWorkspace defaultWorkspace];
    v35[0] = 0;
    unsigned __int8 v19 = [v18 openURL:v5 withOptions:&__NSDictionary0__struct error:v35];
    id v6 = v35[0];

    v20 = CloudServicesLog();
    v21 = v20;
    if (v19)
    {
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v41 = (const char *)v5;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "opened %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      sub_10000A2DC((uint64_t)v5, (uint64_t)v6, v21);
    }

    goto LABEL_25;
  }
  if (a2 == 1)
  {
    [(id)qword_100015CA8 setNotificationDisabled:1];
    v5 = +[NSURL URLWithString:@"prefs:root=APPLE_ACCOUNT&path=ICLOUD_SERVICE/com.apple.Dataclass.KeychainSync/ADVANCED"];
    id v6 = +[LSApplicationWorkspace defaultWorkspace];
    [v6 openSensitiveURL:v5 withOptions:0];
LABEL_25:

LABEL_26:
    goto LABEL_27;
  }
  if (a2)
  {
LABEL_27:
    dword_100015CC0 = 0;
    if (qword_100015CC8)
    {
      CFRunLoopSourceInvalidate((CFRunLoopSourceRef)qword_100015CC8);
      CFRelease((CFTypeRef)qword_100015CC8);
      qword_100015CC8 = 0;
    }
    if (qword_100015CB8)
    {
      CFRelease((CFTypeRef)qword_100015CB8);
      qword_100015CB8 = 0;
    }
    unsigned int add_explicit = atomic_fetch_add_explicit(dword_100015CD0, 0xFFFFFFFF, memory_order_relaxed);
    v23 = CloudServicesLog();
    v24 = v23;
    if (add_explicit == 1)
    {
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v41 = "void response(CFUserNotificationRef, CFOptionFlags)";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: ending xpc transaction", buf, 0xCu);
      }

      v24 = qword_100015CB0;
      qword_100015CB0 = 0;
    }
    else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      sub_10000A264(v24, v25, v26, v27, v28, v29, v30, v31);
    }

    v5 = CloudServicesLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v41 = "void response(CFUserNotificationRef, CFOptionFlags)";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Exit %s", buf, 0xCu);
    }
    goto LABEL_39;
  }
  if ([(id)qword_100015CA8 shouldAllowSnooze])
  {
    [(id)qword_100015CA8 notificationSnoozed];
    goto LABEL_27;
  }
  CFOptionFlags responseFlags = 0;
  SInt32 error = 0;
  v38[0] = kCFUserNotificationAlertHeaderKey;
  v7 = +[NSBundle mainBundle];
  v8 = [v7 localizedStringForKey:@"RESET_CONFIRMATION_MESSAGE_TITLE" value:&stru_100010838 table:0];
  v39[0] = v8;
  v38[1] = kCFUserNotificationAlertMessageKey;
  v9 = +[NSBundle mainBundle];
  v10 = [v9 localizedStringForKey:@"RESET_CONFIRMATION_MESSAGE" value:&stru_100010838 table:0];
  v39[1] = v10;
  v38[2] = kCFUserNotificationDefaultButtonTitleKey;
  v11 = +[NSBundle mainBundle];
  v12 = [v11 localizedStringForKey:@"RESETKEYCHAIN" value:&stru_100010838 table:0];
  v39[2] = v12;
  v38[3] = kCFUserNotificationAlternateButtonTitleKey;
  v13 = +[NSBundle mainBundle];
  v14 = [v13 localizedStringForKey:@"CANCEL" value:&stru_100010838 table:0];
  v39[3] = v14;
  v39[4] = kCFBooleanTrue;
  v38[4] = kCFUserNotificationAlertTopMostKey;
  v38[5] = SBUserNotificationDontDismissOnUnlock;
  v39[5] = &__kCFBooleanTrue;
  v39[6] = &__kCFBooleanFalse;
  v38[6] = SBUserNotificationDismissOnLock;
  v38[7] = SBUserNotificationPendInSetupIfNotAllowedKey;
  v39[7] = &__kCFBooleanTrue;
  v5 = +[NSDictionary dictionaryWithObjects:v39 forKeys:v38 count:8];

  v15 = CFUserNotificationCreate(0, 0.0, 0, &error, (CFDictionaryRef)v5);
  if (v15)
  {
    v16 = v15;
    SInt32 error = CFUserNotificationReceiveResponse(v15, 0.0, &responseFlags);
    if (error)
    {
      v17 = CloudServicesLog();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v41) = error;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Error getting alert response: %d", buf, 8u);
      }
    }
    else
    {
      if (responseFlags)
      {
LABEL_50:
        CFRelease(v16);
        goto LABEL_26;
      }
      [(id)qword_100015CA8 setNotificationDisabled:1];
      v17 = [objc_alloc((Class)SecureBackup) initWithUserActivityLabel:@"reset keychain"];
      v33 = [v17 disableWithInfo:0];
      if (v33)
      {
        v34 = CloudServicesLog();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v41 = v33;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Error disabling backup: %@", buf, 0xCu);
        }
      }
      v35[1] = 0;
      SOSCCResetToEmpty();
    }
    goto LABEL_50;
  }
  v32 = CloudServicesLog();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v41) = error;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Error displaying alert: %d", buf, 8u);
  }

LABEL_39:
}

void sub_100004618(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004CB0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

id sub_100004CD4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained metrics];

  return v2;
}

void sub_100004D20(uint64_t a1, xpc_activity_t activity)
{
  if (xpc_activity_get_state(activity) == 2)
  {
    v3 = *(void **)(a1 + 32);
    CFStringRef v4 = v3[2];
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004DC0;
    block[3] = &unk_1000105D0;
    id v6 = v3;
    dispatch_sync(v4, block);
  }
}

void sub_100004DC0(uint64_t a1)
{
  [*(id *)(a1 + 32) handleTimerEvent];
}

void sub_100004E04(uint64_t a1, void *a2)
{
  xpc_object_t xdict = a2;
  BOOL v3 = xpc_get_type(xdict) == (xpc_type_t)&_xpc_type_dictionary;
  CFStringRef v4 = xdict;
  if (v3)
  {
    string = xpc_dictionary_get_string(xdict, _xpc_event_key_name);
    CFStringRef v4 = xdict;
    if (string)
    {
      id v6 = [objc_alloc((Class)NSString) initWithCString:string encoding:4];
      if (v6) {
        [*(id *)(a1 + 32) handleNotification:v6];
      }

      CFStringRef v4 = xdict;
    }
  }
}

void sub_1000055A8(uint64_t a1, const void *a2)
{
  if ((PCSServiceItemTypeIsManatee() & 1) == 0
    && !CFEqual(a2, kPCSServiceRaw)
    && !CFEqual(a2, kPCSServiceEscrow)
    && !CFEqual(a2, kPCSServiceFDE))
  {
    v5 = PCSServiceItemGetNumberByName();
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
}

void sub_1000058B8(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:a2];
  v7 = [v6 objectForKeyedSubscript:@"PublicIdentities"];

  id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v7, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v7;
  v10 = (char *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        v14 = (const void *)PCSPublicIdentityCreateWithPublicKeyInfo();
        v15 = (void *)PCSPublicIdentityCopyPublicKey();
        CFRelease(v14);
        objc_msgSend(v8, "addObject:", v15, v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = (char *)[v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  [*(id *)(a1 + 40) setObject:v8 forKeyedSubscript:v5];
}

void sub_100005A58(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = CloudServicesLog();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_10000A4E0();
    }

    **(unsigned char **)(a1 + 56) = 1;
  }
  else
  {
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100005B74;
    v12[3] = &unk_100010670;
    id v8 = *(void **)(a1 + 32);
    id v13 = *(id *)(a1 + 40);
    id v14 = v5;
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 56);
    id v15 = v9;
    uint64_t v16 = v10;
    [v8 foreachStingrayService:v12];
  }
}

void sub_100005B74(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id v15 = +[NSString stringWithFormat:@"PCSCKMirrorStatus-%@", a2];
  id v6 = [*(id *)(a1 + 32) objectForKeyedSubscript:v5];
  v7 = [*(id *)(a1 + 40) objectForKeyedSubscript:v5];

  if (v6 && [v6 count])
  {
    if (*(void *)(a1 + 40) && [v7 count])
    {
      id v8 = +[NSSet setWithArray:v6];
      id v9 = +[NSSet setWithArray:v7];
      unsigned int v10 = [v8 isEqualToSet:v9];

      uint64_t v11 = v10 ^ 1;
    }
    else
    {
      uint64_t v11 = 3;
    }
  }
  else
  {
    uint64_t v11 = 2;
  }
  uint64_t v12 = +[NSNumber numberWithUnsignedInt:v11];
  [*(id *)(a1 + 48) setObject:v12 forKeyedSubscript:v15];

  if (v11)
  {
    **(unsigned char **)(a1 + 56) = 1;
    id v13 = [objc_alloc((Class)NSError) initWithDomain:@"PCSCKMirrorStatus" code:v11 userInfo:0];
    id v14 = +[CloudServicesAnalytics logger];
    [v14 logResultForEvent:v15 hardFailure:0 result:v13 withAttributes:0];
  }
  else
  {
    id v13 = +[CloudServicesAnalytics logger];
    [v13 logSuccessForEvent:v15];
  }
}

void sub_1000071C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000071E4(id a1)
{
  id v1 = objc_alloc_init((Class)NSMutableCharacterSet);
  uint64_t v2 = (void *)qword_100015CF0;
  qword_100015CF0 = (uint64_t)v1;

  BOOL v3 = (void *)qword_100015CF0;
  CFStringRef v4 = +[NSCharacterSet URLQueryAllowedCharacterSet];
  [v3 formUnionWithCharacterSet:v4];

  id v5 = (void *)qword_100015CF0;

  [v5 removeCharactersInString:@"&"];
}

void sub_100007464(uint64_t a1)
{
  if (os_variant_has_internal_diagnostics())
  {
    if ([(id)objc_opt_class() isRateLimited:*(void *)(a1 + 32)])
    {
      BOOL v3 = CloudServicesLog();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        CFStringRef v4 = [*(id *)(a1 + 32) alert];
        int v5 = 138412290;
        id v6 = v4;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Not showing ttr due to ratelimiting: %@", (uint8_t *)&v5, 0xCu);
      }
    }
    else
    {
      if ([(id)objc_opt_class() askUserIfTTR:*(void *)(a1 + 32)]) {
        [(id)objc_opt_class() triggerTapToRadar:*(void *)(a1 + 32)];
      }
      [*(id *)(a1 + 32) updateRetryTimestamp];
    }
  }
}

Class sub_100007694(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100015D00)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000077D8;
    v4[4] = &unk_100010758;
    v4[5] = v4;
    long long v5 = off_100010740;
    uint64_t v6 = 0;
    qword_100015D00 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!qword_100015D00)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("LSApplicationWorkspace");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)sub_10000A6C0();
LABEL_8:
    free(v2);
  }
  qword_100015CF8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000077D8()
{
  uint64_t result = _sl_dlopen();
  qword_100015D00 = result;
  return result;
}

id sub_1000088B4(uint64_t a1)
{
  if ((unint64_t)(a1 - 3) > 2) {
    id v1 = 0;
  }
  else {
    id v1 = *(&off_1000107A0 + a1 - 3);
  }
  return [v1 stringByAppendingString:@"Error"];
}

void sub_1000093D4(uint64_t a1, uint64_t a2, void *a3)
{
  id obj = [a3 currentStateMostRecentSample];
  if ([obj isNewerThanHealthSample:*(void *)(*(void *)(a1 + 32) + 16)]) {
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 16), obj);
  }
}

uint64_t start()
{
  signal(15, (void (__cdecl *)(int))1);
  dispatch_source_t v0 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  id v1 = (void *)qword_100015D10;
  qword_100015D10 = (uint64_t)v0;

  dispatch_source_set_event_handler((dispatch_source_t)qword_100015D10, &stru_1000107B8);
  dispatch_activate((dispatch_object_t)qword_100015D10);
  os_log_t v3 = os_log_create("com.apple.EscrowSecurityAlert", "daemon");
  CFStringRef v4 = (void *)qword_100015D08;
  qword_100015D08 = (uint64_t)v3;

  CloudServicesInitializeLogging();
  long long v5 = objc_alloc_init(EscrowSecurityAlert);
  uint64_t v6 = objc_alloc_init(ESADelegate);
  [(EscrowSecurityAlert *)v5 setDelegate:v6];
  CFRunLoopRun();

  return 0;
}

void sub_10000A174(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A1EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A264(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10000A2DC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "could not open %@: %@", (uint8_t *)&v3, 0x16u);
}

void sub_10000A364()
{
  sub_100006A28();
  sub_100004618((void *)&_mh_execute_header, v0, v1, "Failed to convert to JSON: %@", v2, v3, v4, v5, v6);
}

void sub_10000A3CC()
{
  sub_100006A28();
  sub_100004618((void *)&_mh_execute_header, v0, v1, "results from TTR - %@", v2, v3, v4, v5, v6);
}

void sub_10000A434(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "rate-limiting metrics", v1, 2u);
}

void sub_10000A478()
{
  sub_100006A28();
  sub_100004618((void *)&_mh_execute_header, v0, v1, "failed to acquire CKKS control object: %@", v2, v3, v4, v5, v6);
}

void sub_10000A4E0()
{
  sub_100006A28();
  sub_100004618((void *)&_mh_execute_header, v0, v1, "error getting PCS CKMirror keys from CKKS: %@", v2, v3, v4, v5, v6);
}

void sub_10000A548()
{
  sub_100006A28();
  sub_100004618((void *)&_mh_execute_header, v0, v1, "got error back from getAccountInfoWithInfo: %@", v2, v3, v4, v5, v6);
}

void sub_10000A5B0()
{
  sub_100006A28();
  sub_100004618((void *)&_mh_execute_header, v0, v1, "failed to get account: %@", v2, v3, v4, v5, v6);
}

void sub_10000A618(unsigned int *a1, NSObject *a2)
{
  uint64_t v3 = +[NSNumber numberWithInt:*a1];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to create notification error %@", (uint8_t *)&v4, 0xCu);
}

uint64_t sub_10000A6C0()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A6E8(v0);
}

void sub_10000A6E8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error looking up authKitAccount: %@", (uint8_t *)&v2, 0xCu);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return _CFEqual(cf1, cf2);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return _CFRunLoopGetMain();
}

void CFRunLoopRun(void)
{
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return _CFUserNotificationCancel(userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return _CFUserNotificationCreate(allocator, timeout, flags, error, dictionary);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return _CFUserNotificationCreateRunLoopSource(allocator, userNotification, callout, order);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return _CFUserNotificationReceiveResponse(userNotification, timeout, responseFlags);
}

SInt32 CFUserNotificationUpdate(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags flags, CFDictionaryRef dictionary)
{
  return _CFUserNotificationUpdate(userNotification, timeout, flags, dictionary);
}

uint64_t CloudServicesInitializeLogging()
{
  return _CloudServicesInitializeLogging();
}

uint64_t CloudServicesLog()
{
  return _CloudServicesLog();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t PCSPublicIdentityCopyPublicKey()
{
  return _PCSPublicIdentityCopyPublicKey();
}

uint64_t PCSPublicIdentityCreateWithPublicKeyInfo()
{
  return _PCSPublicIdentityCreateWithPublicKeyInfo();
}

uint64_t PCSServiceItemGetNumberByName()
{
  return _PCSServiceItemGetNumberByName();
}

uint64_t PCSServiceItemTypeIsManatee()
{
  return _PCSServiceItemTypeIsManatee();
}

uint64_t PCSServiceItemsGetEachName()
{
  return _PCSServiceItemsGetEachName();
}

uint64_t SOSCCResetToEmpty()
{
  return _SOSCCResetToEmpty();
}

uint64_t SOSCCThisDeviceIsInCircle()
{
  return _SOSCCThisDeviceIsInCircle();
}

uint64_t SecIsInternalRelease()
{
  return _SecIsInternalRelease();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return __CFCopySystemVersionDictionary();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
}

int gettimeofday(timeval *a1, void *a2)
{
  return _gettimeofday(a1, a2);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t os_transaction_create()
{
  return _os_transaction_create();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

unsigned int sleep(unsigned int a1)
{
  return _sleep(a1);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return _xpc_activity_get_state(activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
}

uint64_t xpc_transaction_exit_clean()
{
  return _xpc_transaction_exit_clean();
}

id objc_msgSend_URLQueryAllowedCharacterSet(void *a1, const char *a2, ...)
{
  return [a1 URLQueryAllowedCharacterSet];
}

id objc_msgSend_accountProperties(void *a1, const char *a2, ...)
{
  return [a1 accountProperties];
}

id objc_msgSend_accountSecurityLevel(void *a1, const char *a2, ...)
{
  return [a1 accountSecurityLevel];
}

id objc_msgSend_alert(void *a1, const char *a2, ...)
{
  return [a1 alert];
}

id objc_msgSend_alertType(void *a1, const char *a2, ...)
{
  return [a1 alertType];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_build(void *a1, const char *a2, ...)
{
  return [a1 build];
}

id objc_msgSend_cancelAlert(void *a1, const char *a2, ...)
{
  return [a1 cancelAlert];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_componentID(void *a1, const char *a2, ...)
{
  return [a1 componentID];
}

id objc_msgSend_componentName(void *a1, const char *a2, ...)
{
  return [a1 componentName];
}

id objc_msgSend_componentVersion(void *a1, const char *a2, ...)
{
  return [a1 componentVersion];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_current(void *a1, const char *a2, ...)
{
  return [a1 current];
}

id objc_msgSend_currentState(void *a1, const char *a2, ...)
{
  return [a1 currentState];
}

id objc_msgSend_currentStateError(void *a1, const char *a2, ...)
{
  return [a1 currentStateError];
}

id objc_msgSend_currentStateFirstSample(void *a1, const char *a2, ...)
{
  return [a1 currentStateFirstSample];
}

id objc_msgSend_currentStateMostRecentSample(void *a1, const char *a2, ...)
{
  return [a1 currentStateMostRecentSample];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return [a1 doubleValue];
}

id objc_msgSend_getPasscodeEnabled(void *a1, const char *a2, ...)
{
  return [a1 getPasscodeEnabled];
}

id objc_msgSend_handleTimerEvent(void *a1, const char *a2, ...)
{
  return [a1 handleTimerEvent];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iCDPEnabledForDSID(void *a1, const char *a2, ...)
{
  return [a1 iCDPEnabledForDSID];
}

id objc_msgSend_inCircle(void *a1, const char *a2, ...)
{
  return [a1 inCircle];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_isNotificationDisabled(void *a1, const char *a2, ...)
{
  return [a1 isNotificationDisabled];
}

id objc_msgSend_isNotificationSnoozed(void *a1, const char *a2, ...)
{
  return [a1 isNotificationSnoozed];
}

id objc_msgSend_lastHealthSample(void *a1, const char *a2, ...)
{
  return [a1 lastHealthSample];
}

id objc_msgSend_lastUpdate(void *a1, const char *a2, ...)
{
  return [a1 lastUpdate];
}

id objc_msgSend_logErrors(void *a1, const char *a2, ...)
{
  return [a1 logErrors];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_metrics(void *a1, const char *a2, ...)
{
  return [a1 metrics];
}

id objc_msgSend_metricsDict(void *a1, const char *a2, ...)
{
  return [a1 metricsDict];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_notificationSnoozed(void *a1, const char *a2, ...)
{
  return [a1 notificationSnoozed];
}

id objc_msgSend_otCliqueStatus(void *a1, const char *a2, ...)
{
  return [a1 otCliqueStatus];
}

id objc_msgSend_otCliqueStatusError(void *a1, const char *a2, ...)
{
  return [a1 otCliqueStatusError];
}

id objc_msgSend_passcodeEnabled(void *a1, const char *a2, ...)
{
  return [a1 passcodeEnabled];
}

id objc_msgSend_previousState(void *a1, const char *a2, ...)
{
  return [a1 previousState];
}

id objc_msgSend_previousStateError(void *a1, const char *a2, ...)
{
  return [a1 previousStateError];
}

id objc_msgSend_previousStateFirstSample(void *a1, const char *a2, ...)
{
  return [a1 previousStateFirstSample];
}

id objc_msgSend_previousStateLastSample(void *a1, const char *a2, ...)
{
  return [a1 previousStateLastSample];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_radarDescription(void *a1, const char *a2, ...)
{
  return [a1 radarDescription];
}

id objc_msgSend_radarnumber(void *a1, const char *a2, ...)
{
  return [a1 radarnumber];
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return [a1 reset];
}

id objc_msgSend_results(void *a1, const char *a2, ...)
{
  return [a1 results];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldAllowSnooze(void *a1, const char *a2, ...)
{
  return [a1 shouldAllowSnooze];
}

id objc_msgSend_sosStatus(void *a1, const char *a2, ...)
{
  return [a1 sosStatus];
}

id objc_msgSend_sosStatusError(void *a1, const char *a2, ...)
{
  return [a1 sosStatusError];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_tapToRadar(void *a1, const char *a2, ...)
{
  return [a1 tapToRadar];
}

id objc_msgSend_testAccount(void *a1, const char *a2, ...)
{
  return [a1 testAccount];
}

id objc_msgSend_timeIntervalSince1970(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSince1970];
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return [a1 timestamp];
}

id objc_msgSend_trigger(void *a1, const char *a2, ...)
{
  return [a1 trigger];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_updateRetryTimestamp(void *a1, const char *a2, ...)
{
  return [a1 updateRetryTimestamp];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_wAvailable(void *a1, const char *a2, ...)
{
  return [a1 wAvailable];
}

id objc_msgSend_wAvailableError(void *a1, const char *a2, ...)
{
  return [a1 wAvailableError];
}

id objc_msgSend_walrusStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "walrusStatus:");
}