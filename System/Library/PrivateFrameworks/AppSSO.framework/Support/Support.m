void sub_1000030B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19)
{
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

id sub_1000030E4()
{
  if (qword_100016190 != -1) {
    dispatch_once(&qword_100016190, &stru_100010770);
  }
  v0 = (void *)qword_100016198;
  return v0;
}

void sub_1000031E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

void sub_100003224(id a1)
{
  qword_1000160E8 = (uint64_t)os_log_create("com.apple.AppSSO", "SOAgentListener");
  _objc_release_x1();
}

Class sub_100003268(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_1000160F8)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_1000033AC;
    v4[4] = &unk_1000103B0;
    v4[5] = v4;
    long long v5 = off_100010398;
    uint64_t v6 = 0;
    qword_1000160F8 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_1000160F8)
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
    Class result = objc_getClass("SOInternalProtocols");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_100009EB0();
LABEL_8:
    free(v2);
  }
  qword_1000160F0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1000033AC()
{
  uint64_t result = _sl_dlopen();
  qword_1000160F8 = result;
  return result;
}

id sub_1000036A8()
{
  if (qword_100016100 != -1) {
    dispatch_once(&qword_100016100, &stru_1000103F8);
  }
  v0 = (void *)qword_100016108;
  return v0;
}

id sub_1000036FC(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveKerberosValuesForPlugins];
}

void sub_1000038B8(id a1)
{
  qword_100016108 = (uint64_t)os_log_create("com.apple.AppSSO", "SODaemonKerberosSettingsManager");
  _objc_release_x1();
}

uint64_t start()
{
  v1 = sub_100003AE4();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    sub_100009F1C(v1);
  }

  v2 = +[SOExtensionManager sharedInstance];
  [v2 loadExtensions];
  [v2 beginMatchingExtensions];
  v3 = +[SOConfigurationHost defaultManager];
  id v4 = objc_alloc_init((Class)SOKerberosSettingsManager);
  [v4 createKerberosSettingsCache];
  long long v5 = [[SODaemonKerberosSettingsManager alloc] initWithConfigurationHost:v3 settingsManager:v4];
  [(SODaemonKerberosSettingsManager *)v5 listenForConfigurationChanges];
  uint64_t v6 = objc_alloc_init(SOAppSSOListener);
  [(SOAppSSOListener *)v6 resume];
  v7 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003B38;
  handler[3] = &unk_1000103D8;
  v8 = v6;
  v13 = v8;
  dispatch_source_set_event_handler(v7, handler);
  dispatch_activate(v7);
  signal(15, (void (__cdecl *)(int))1);
  v9 = sub_100003AE4();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_100009ED8(v9);
  }

  v10 = +[NSRunLoop currentRunLoop];
  [v10 run];

  return 0;
}

id sub_100003AE4()
{
  if (qword_100016110 != -1) {
    dispatch_once(&qword_100016110, &stru_100010418);
  }
  v0 = (void *)qword_100016118;
  return v0;
}

void sub_100003B38(uint64_t a1)
{
  v2 = sub_100003AE4();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, shutting down", v3, 2u);
  }

  [*(id *)(a1 + 32) invalidate];
  exit(0);
}

void sub_100003BA4(id a1)
{
  qword_100016118 = (uint64_t)os_log_create("com.apple.AppSSO", "AppSSODaemon");
  _objc_release_x1();
}

void sub_100003D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

id sub_100003D98()
{
  if (qword_100016130 != -1) {
    dispatch_once(&qword_100016130, &stru_100010450);
  }
  v0 = (void *)qword_100016138;
  return v0;
}

id sub_100003FD8()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100016140;
  uint64_t v7 = qword_100016140;
  if (!qword_100016140)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000042E0;
    v3[3] = &unk_100010378;
    v3[4] = &v4;
    sub_1000042E0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000040A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_1000040E4(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100016128)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100004228;
    v4[4] = &unk_1000103B0;
    v4[5] = v4;
    long long v5 = off_100010438;
    uint64_t v6 = 0;
    qword_100016128 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100016128)
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
    Class result = objc_getClass("MCProfileConnection");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_10000A01C();
LABEL_8:
    free(v2);
  }
  qword_100016120 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004228()
{
  uint64_t result = _sl_dlopen();
  qword_100016128 = result;
  return result;
}

void sub_10000429C(id a1)
{
  qword_100016138 = (uint64_t)os_log_create("com.apple.AppSSO", "SODaemonUtils");
  _objc_release_x1();
}

Class sub_1000042E0(uint64_t a1)
{
  v4[0] = 0;
  if (!qword_100016148)
  {
    v4[1] = _NSConcreteStackBlock;
    v4[2] = 3221225472;
    v4[3] = sub_100004424;
    v4[4] = &unk_1000103B0;
    v4[5] = v4;
    long long v5 = off_100010470;
    uint64_t v6 = 0;
    qword_100016148 = _sl_dlopen();
    v2 = (void *)v4[0];
    if (!qword_100016148)
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
    Class result = objc_getClass("SOUtils");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    v2 = (void *)sub_10000A044();
LABEL_8:
    free(v2);
  }
  qword_100016140 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_100004424()
{
  uint64_t result = _sl_dlopen();
  qword_100016148 = result;
  return result;
}

void sub_1000044EC(id a1)
{
  qword_100016150 = (uint64_t)dispatch_queue_create("com.apple.AppSSO.daemon-ui-queue", 0);
  _objc_release_x1();
}

id sub_100004600()
{
  if (qword_100016160 != -1) {
    dispatch_once(&qword_100016160, &stru_100010530);
  }
  v0 = (void *)qword_100016168;
  return v0;
}

id sub_100004AB4(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  v60[0] = @"url";
  v58 = [v4 url];
  if (v58)
  {
    v41 = [v4 url];
    CFStringRef v6 = [v41 absoluteString];
  }
  else
  {
    CFStringRef v6 = &stru_100010848;
  }
  v45 = (__CFString *)v6;
  v61[0] = v6;
  v60[1] = @"httpHeaders";
  uint64_t v7 = [v4 httpHeaders];
  v57 = (void *)v7;
  if (v7) {
    v8 = (void *)v7;
  }
  else {
    v8 = &__NSDictionary0__struct;
  }
  v61[1] = v8;
  v60[2] = @"httpBody";
  id v9 = [v4 httpBody];
  id v10 = v9;
  if (!v9) {
    id v9 = objc_alloc_init((Class)NSData);
  }
  v44 = v9;
  v61[2] = v9;
  v60[3] = @"extensionBundleIdentifier";
  uint64_t v11 = [v5 extensionBundleIdentifier];
  v55 = (void *)v11;
  if (v11) {
    CFStringRef v12 = (const __CFString *)v11;
  }
  else {
    CFStringRef v12 = &stru_100010848;
  }
  v61[3] = v12;
  v60[4] = @"teamIdentifier";
  uint64_t v13 = [v5 extensionTeamIdentifier];
  v54 = (void *)v13;
  if (v13) {
    CFStringRef v14 = (const __CFString *)v13;
  }
  else {
    CFStringRef v14 = &stru_100010848;
  }
  v61[4] = v14;
  v60[5] = @"extensionData";
  uint64_t v15 = [v5 extensionData];
  v53 = (void *)v15;
  if (!v15)
  {
    uint64_t v15 = +[NSDictionary dictionary];
  }
  v56 = v10;
  v43 = (void *)v15;
  v61[5] = v15;
  v60[6] = @"realm";
  uint64_t v16 = [v5 realm];
  v52 = (void *)v16;
  if (v16) {
    CFStringRef v17 = (const __CFString *)v16;
  }
  else {
    CFStringRef v17 = &stru_100010848;
  }
  v61[6] = v17;
  v60[7] = @"callerBundleIdentifier";
  uint64_t v18 = [v4 callerBundleIdentifier];
  v51 = (void *)v18;
  if (v18) {
    CFStringRef v19 = (const __CFString *)v18;
  }
  else {
    CFStringRef v19 = &stru_100010848;
  }
  v61[7] = v19;
  v60[8] = @"auditTokenData";
  uint64_t v20 = [v4 auditTokenData];
  v50 = (void *)v20;
  if (!v20)
  {
    uint64_t v20 = +[NSData data];
  }
  v42 = (void *)v20;
  v61[8] = v20;
  v60[9] = @"requestedOperation";
  uint64_t v21 = [v4 requestedOperation];
  v49 = (void *)v21;
  if (v21) {
    CFStringRef v22 = (const __CFString *)v21;
  }
  else {
    CFStringRef v22 = &stru_100010848;
  }
  v61[9] = v22;
  v60[10] = @"authorizationOptions";
  uint64_t v23 = [v4 authorizationOptions];
  v24 = (void *)v23;
  if (v23) {
    v25 = (void *)v23;
  }
  else {
    v25 = &__NSDictionary0__struct;
  }
  v61[10] = v25;
  v60[11] = @"useInternalExtensions";
  v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 useInternalExtensions]);
  v61[11] = v48;
  v60[12] = @"cfNetworkInterception";
  v47 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isCFNetworkInterception]);
  v61[12] = v47;
  v60[13] = @"callerManaged";
  v26 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isCallerManaged]);
  v61[13] = v26;
  v60[14] = @"callerTeamIdentifier";
  uint64_t v27 = [v4 callerTeamIdentifier];
  v28 = (void *)v27;
  if (v27) {
    CFStringRef v29 = (const __CFString *)v27;
  }
  else {
    CFStringRef v29 = &stru_100010848;
  }
  v61[14] = v29;
  v60[15] = @"localizedCallerDisplayName";
  uint64_t v30 = [v4 localizedCallerDisplayName];
  v31 = (void *)v30;
  if (v30) {
    CFStringRef v32 = (const __CFString *)v30;
  }
  else {
    CFStringRef v32 = &stru_100010848;
  }
  v61[15] = v32;
  v60[16] = @"enableUserInteraction";
  v33 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 isUserInteractionEnabled]);
  v61[16] = v33;
  v60[17] = @"impersonationBundleIdentifier";
  uint64_t v34 = [v4 impersonationBundleIdentifier];
  v35 = (void *)v34;
  if (v34) {
    CFStringRef v36 = (const __CFString *)v34;
  }
  else {
    CFStringRef v36 = &stru_100010848;
  }
  v61[17] = v36;
  v60[18] = @"screenLockedBehavior";
  v59 = v5;
  v37 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v5 screenLockedBehavior]);
  v61[18] = v37;
  v60[19] = @"identifier";
  v38 = [v4 identifier];
  v61[19] = v38;
  v60[20] = @"showOnCoverScreen";
  v39 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 canShowOnCoverScreen]);
  v61[20] = v39;
  id v46 = +[NSDictionary dictionaryWithObjects:v61 forKeys:v60 count:21];

  if (!v50) {
  if (!v53)
  }

  if (!v56) {
  if (v58)
  }
  {
  }
  return v46;
}

id sub_10000501C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100016170;
  uint64_t v7 = qword_100016170;
  if (!qword_100016170)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100005EE4;
    v3[3] = &unk_100010378;
    v3[4] = &v4;
    sub_100005EE4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000050E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000056FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_10000571C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_100016180;
  uint64_t v7 = qword_100016180;
  if (!qword_100016180)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000060AC;
    v3[3] = &unk_100010378;
    v3[4] = &v4;
    sub_1000060AC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1000057E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100005800(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

void sub_100005C0C(id a1, NSError *a2)
{
  v2 = a2;
  v3 = sub_100004600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000A440((uint64_t)v2, v3);
  }
}

void sub_100005C60(uint64_t a1, uint64_t a2, void *a3)
{
  id v6 = a3;
  [*(id *)(a1 + 32) _closeRemoteUIWithError:0];
  uint64_t v5 = *(void *)(a1 + 40);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);
  }
}

void sub_100005D90(id a1, NSError *a2)
{
  v2 = a2;
  v3 = sub_100004600();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_10000A440((uint64_t)v2, v3);
  }
}

void sub_100005EA0(id a1)
{
  qword_100016168 = (uint64_t)os_log_create("com.apple.AppSSO", "SODaemonUIManager");
  _objc_release_x1();
}

void sub_100005EE4(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100016170 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_10000A53C();
    sub_100005F3C();
  }
}

void sub_100005F3C()
{
  v1[0] = 0;
  if (!qword_100016178)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100006038;
    v1[4] = &unk_1000103B0;
    v1[5] = v1;
    long long v2 = off_100010550;
    uint64_t v3 = 0;
    qword_100016178 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_100016178)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100006038()
{
  uint64_t result = _sl_dlopen();
  qword_100016178 = result;
  return result;
}

void sub_1000060AC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOInternalProtocols");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_100016180 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_100009EB0();
    sub_100006104();
  }
}

void sub_100006124(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100006160(id a1)
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  id v1 = (void *)qword_1000161A0;
  uint64_t v7 = qword_1000161A0;
  if (!qword_1000161A0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009A88;
    v3[3] = &unk_100010378;
    v3[4] = &v4;
    sub_100009A88((uint64_t)v3);
    id v1 = (void *)v5[3];
  }
  id v2 = v1;
  _Block_object_dispose(&v4, 8);
}

void sub_100006234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_100006258(id a1, SORequestQueue *a2, SORequestQueueItem *a3)
{
  uint64_t v4 = a2;
  uint64_t v5 = a3;
  uint64_t v6 = [(SORequestQueueItem *)v5 service];
  uint64_t v7 = [(SORequestQueueItem *)v5 requestParameters];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10000633C;
  v10[3] = &unk_1000105F8;
  uint64_t v11 = v5;
  CFStringRef v12 = v4;
  v8 = v4;
  uint64_t v9 = v5;
  [v6 _performAuthorizationWithRequestParameters:v7 completion:v10];
}

void sub_10000633C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = [*(id *)(a1 + 32) completionBlock];

  if (v7)
  {
    v8 = [*(id *)(a1 + 32) completionBlock];
    ((void (**)(void, id, id))v8)[2](v8, v5, v6);
  }
  if ([v6 code] == (id)-2 || objc_msgSend(v6, "code") == (id)-4)
  {
    uint64_t v9 = *(void **)(a1 + 40);
    id v10 = _NSConcreteStackBlock;
    uint64_t v11 = 3221225472;
    CFStringRef v12 = sub_100006464;
    uint64_t v13 = &unk_1000105D0;
    id v14 = v5;
    id v15 = v6;
    [v9 removeAllRequestsWithBlock:&v10];
  }
  objc_msgSend(*(id *)(a1 + 40), "processNextRequest", v10, v11, v12, v13);
}

void sub_100006464(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = [a3 completionBlock];
  (*((void (**)(id, void, void))v4 + 2))(v4, *(void *)(a1 + 32), *(void *)(a1 + 40));
}

void sub_100006844(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_10000685C()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1000161B0;
  uint64_t v7 = qword_1000161B0;
  if (!qword_1000161B0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009C50;
    v3[3] = &unk_100010378;
    v3[4] = &v4;
    sub_100009C50((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_100006928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_100006F60()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_1000161C0;
  uint64_t v7 = qword_1000161C0;
  if (!qword_1000161C0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_100009D00;
    v3[3] = &unk_100010378;
    v3[4] = &v4;
    sub_100009D00((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_10000702C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100007044(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_100007BD8(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1000030E4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v7 = @"NO";
    if (a2) {
      CFStringRef v7 = @"YES";
    }
    *(_DWORD *)buf = 138543618;
    CFStringRef v15 = v7;
    __int16 v16 = 2114;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "setupNonUISessionWithCompletion: success = %{public}@, error = %{public}@", buf, 0x16u);
  }

  v8 = *(void **)(a1 + 32);
  if (a2)
  {
    uint64_t v9 = (void *)v8[4];
    id v10 = *(void **)(a1 + 40);
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100007D5C;
    v12[3] = &unk_100010648;
    v12[4] = v8;
    id v13 = v10;
    [v9 beginAuthorizationWithRequestParameters:v13 completion:v12];
  }
  else
  {
    uint64_t v11 = [*(id *)(a1 + 40) identifier];
    [v8 authorization:v11 didCompleteWithCredential:0 error:v5];
  }
}

void sub_100007D5C(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1000030E4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67240450;
    v9[1] = a2;
    __int16 v10 = 2114;
    id v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "beginAuthorizationWithRequestParameters: %{public}d, %{public}@", (uint8_t *)v9, 0x12u);
  }

  if ((a2 & 1) == 0)
  {
    CFStringRef v7 = *(void **)(a1 + 32);
    v8 = [*(id *)(a1 + 40) identifier];
    [v7 authorization:v8 didCompleteWithCredential:0 error:v5];
  }
}

uint64_t sub_1000081AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) authorization:*(void *)(a1 + 40) didCompleteWithCredential:a2 error:a3];
  uint64_t result = *(void *)(a1 + 48);
  if (result)
  {
    id v5 = *(uint64_t (**)(void))(result + 16);
    return v5();
  }
  return result;
}

void sub_100008214(uint64_t a1, uint64_t a2, void *a3)
{
  id v8 = a3;
  uint64_t v4 = [v8 service];
  id v5 = *(void **)(a1 + 32);

  if (v4 == v5)
  {
    uint64_t v6 = [v8 completionBlock];
    CFStringRef v7 = [sub_10000685C() errorWithCode:-2];
    ((void (**)(void, void, void *))v6)[2](v6, 0, v7);
  }
}

void sub_1000086D0(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = *(void **)(a1 + 32);
  if (v6) {
    id v7 = [v6 queueCount];
  }
  else {
    id v7 = 0;
  }
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000A6C4((int)v7, v8);
  }

  if (!v7 && ![*(id *)(*(void *)(a1 + 40) + 32) requestCount]) {
    [*(id *)(a1 + 40) _extensionCleanup];
  }
  uint64_t v9 = *(void *)(a1 + 48);
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

void sub_10000878C(void *a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = (void *)a1[4];
  if (v6) {
    id v7 = [v6 queueCount];
  }
  else {
    id v7 = 0;
  }
  id v8 = sub_1000030E4();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_10000A6C4((int)v7, v8);
  }

  if (!v7 && ![*(id *)(a1[5] + 32) requestCount]) {
    [*(id *)(a1[5] + 16) extensionCleanupWithCompletion:&stru_100010700];
  }
  uint64_t v9 = a1[6];
  if (v9) {
    (*(void (**)(uint64_t, uint64_t, id))(v9 + 16))(v9, a2, v5);
  }
}

void sub_100008854(id a1, BOOL a2, NSError *a3)
{
  uint64_t v4 = a3;
  id v5 = sub_1000030E4();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    sub_10000A73C(a2, (uint64_t)v4, v5);
  }
}

uint64_t sub_100008BFC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100008E94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_100009104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100009140(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained connectionInvalidated];
}

void sub_1000098CC(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  uint64_t v6 = sub_1000030E4();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = *(void *)(a1 + 32);
    CFStringRef v8 = @"NO";
    int v9 = 138412802;
    if (a2) {
      CFStringRef v8 = @"YES";
    }
    uint64_t v10 = v7;
    __int16 v11 = 2114;
    CFStringRef v12 = v8;
    __int16 v13 = 2114;
    id v14 = v5;
    _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@ did finish completion: success = %{public}@, error = %{public}@", (uint8_t *)&v9, 0x20u);
  }
}

void sub_100009A44(id a1)
{
  qword_100016198 = (uint64_t)os_log_create("com.apple.AppSSO", "SODaemon");
  _objc_release_x1();
}

Class sub_100009A88(uint64_t a1)
{
  sub_100009AE0();
  Class result = objc_getClass("SOAuthorizationCredential");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000A7C8();
  }
  qword_1000161A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009AE0()
{
  v1[0] = 0;
  if (!qword_1000161A8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_100009BDC;
    v1[4] = &unk_1000103B0;
    v1[5] = v1;
    long long v2 = off_100010790;
    uint64_t v3 = 0;
    qword_1000161A8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_1000161A8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_100009BDC()
{
  uint64_t result = _sl_dlopen();
  qword_1000161A8 = result;
  return result;
}

Class sub_100009C50(uint64_t a1)
{
  sub_100009AE0();
  Class result = objc_getClass("SOErrorHelper");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000161B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10000A53C();
    return (Class)sub_100009CA8(v3);
  }
  return result;
}

Class sub_100009CA8(uint64_t a1)
{
  sub_100009AE0();
  Class result = objc_getClass("SOAuthorizationHintsCore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000A7F0();
  }
  qword_1000161B8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_100009D00(uint64_t a1)
{
  sub_100009AE0();
  Class result = objc_getClass("SOUtils");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000161C0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_10000A044();
    return (Class)sub_100009D58(v3);
  }
  return result;
}

Class sub_100009D58(uint64_t a1)
{
  sub_100009AE0();
  Class result = objc_getClass("SOAuthorizationCredentialCore");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_10000A818();
  }
  qword_1000161C8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_100009DB0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  sub_100009AE0();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("SOInternalProtocols");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_1000161D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v10 = (void *)sub_100009EB0();
    sub_100009E08(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void sub_100009E08(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_100009E28(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138543618;
  uint64_t v4 = a1;
  __int16 v5 = 2114;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%{public}@, %{public}@", (uint8_t *)&v3, 0x16u);
}

uint64_t sub_100009EB0()
{
  v0 = abort_report_np();
  return sub_100009ED8(v0);
}

void sub_100009ED8(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "running NSRunLoop", v1, 2u);
}

void sub_100009F1C(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "starting daemon", v1, 2u);
}

void sub_100009F60(uint64_t a1, uint64_t a2, NSObject *a3)
{
  __int16 v5 = +[NSNumber numberWithInt:a1];
  int v6 = 138543618;
  uint64_t v7 = v5;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%{public}@: %{public}@ failed to get localized app name => using process name", (uint8_t *)&v6, 0x16u);
}

uint64_t sub_10000A01C()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A044(v0);
}

uint64_t sub_10000A044()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A06C(v0);
}

void sub_10000A06C()
{
  v1[0] = 136315394;
  sub_10000614C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

void sub_10000A0EC()
{
  sub_100006140();
  sub_100006124((void *)&_mh_execute_header, v0, v1, "failed to get SBSRemoteAlertHandle", v2, v3, v4, v5, v6);
}

void sub_10000A120()
{
  sub_100006140();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "show on cover screen is allowed", v1, 2u);
}

void sub_10000A160()
{
  sub_100006140();
  sub_100006124((void *)&_mh_execute_header, v0, v1, "device screen is locked => authorization request not handled", v2, v3, v4, v5, v6);
}

void sub_10000A194()
{
  sub_100006140();
  sub_100006124((void *)&_mh_execute_header, v0, v1, "device screen is locked => canceling authorization request", v2, v3, v4, v5, v6);
}

void sub_10000A1C8(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = 136315906;
  uint64_t v5 = "-[SODaemonUIManager remoteAlertHandleDidActivate:]";
  __int16 v6 = 2114;
  uint64_t v7 = v3;
  __int16 v8 = 2114;
  uint64_t v9 = a2;
  __int16 v10 = 2112;
  uint64_t v11 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s _remoteAlertHandle = %{public}@, handle = %{public}@ on %@", (uint8_t *)&v4, 0x2Au);
}

void sub_10000A270(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 8);
  int v4 = *(unsigned __int8 *)(a1 + 32);
  CFStringRef v5 = @"YES";
  uint64_t v7 = "-[SODaemonUIManager remoteAlertHandleDidDeactivate:]";
  int v6 = 136316162;
  __int16 v8 = 2114;
  if (!v4) {
    CFStringRef v5 = @"NO";
  }
  uint64_t v9 = v3;
  __int16 v10 = 2114;
  uint64_t v11 = a2;
  __int16 v12 = 2114;
  CFStringRef v13 = v5;
  __int16 v14 = 2112;
  uint64_t v15 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s _remoteAlertHandle = %{public}@, handle = %{public}@, isInternalExtension = %{public}@ on %@", (uint8_t *)&v6, 0x34u);
}

void sub_10000A33C()
{
  v1[0] = 136315394;
  sub_10000614C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s  on %@", (uint8_t *)v1, 0x16u);
}

void sub_10000A3BC()
{
  v1[0] = 136315650;
  sub_100006104();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s uiServiceConnection = %{public}@ on %@", (uint8_t *)v1, 0x20u);
}

void sub_10000A440(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "AppSSO UI Service XPC error: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_10000A4B8()
{
  v1[0] = 136315650;
  sub_100006104();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s uiServiceConnection = %{public}@ on %@", (uint8_t *)v1, 0x20u);
}

uint64_t sub_10000A53C()
{
  uint64_t v0 = abort_report_np();
  return sub_10000A564(v0);
}

void sub_10000A564(uint64_t a1, uint64_t a2)
{
  __int16 v8 = +[NSNumber numberWithInteger:a2];
  sub_100009E08((void *)&_mh_execute_header, v2, v3, "%{public}@ extension requests mode = %{public}@", v4, v5, v6, v7, 2u);
}

void sub_10000A610(void *a1, id *a2)
{
  uint64_t v3 = [a1 extensionBundleIdentifier];
  __int16 v10 = [*a2 endpoint];
  sub_100009E08((void *)&_mh_execute_header, v4, v5, "extension id: %@, endpoint: %@", v6, v7, v8, v9, 2u);
}

void sub_10000A6C4(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "finishAuthorizationWithCompletion: request queue count = %d", (uint8_t *)v2, 8u);
}

void sub_10000A73C(char a1, uint64_t a2, os_log_t log)
{
  v3[0] = 67109378;
  v3[1] = a1 & 1;
  __int16 v4 = 2114;
  uint64_t v5 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "extensionCleanupWithCompletion finished, success = %d, %{public}@", (uint8_t *)v3, 0x12u);
}

void sub_10000A7C8()
{
  uint64_t v0 = abort_report_np();
  sub_10000A7F0(v0);
}

void sub_10000A7F0()
{
  uint64_t v0 = abort_report_np();
  sub_10000A818(v0);
}

void sub_10000A818()
{
}

uint64_t SBSGetScreenLockStatus()
{
  return _SBSGetScreenLockStatus();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void exit(int a1)
{
}

void free(void *a1)
{
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void (__cdecl *__cdecl signal(int a1, void (__cdecl *a2)(int)))(int)
{
  return _signal(a1, a2);
}

id objc_msgSend__endpoint(void *a1, const char *a2, ...)
{
  return [a1 _endpoint];
}

id objc_msgSend__extensionCleanup(void *a1, const char *a2, ...)
{
  return [a1 _extensionCleanup];
}

id objc_msgSend__processRequestBlock(void *a1, const char *a2, ...)
{
  return [a1 _processRequestBlock];
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return [a1 _queue];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return [a1 anonymousListener];
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return [a1 auditToken];
}

id objc_msgSend_auditTokenData(void *a1, const char *a2, ...)
{
  return [a1 auditTokenData];
}

id objc_msgSend_authorizationOptions(void *a1, const char *a2, ...)
{
  return [a1 authorizationOptions];
}

id objc_msgSend_beginMatchingExtensions(void *a1, const char *a2, ...)
{
  return [a1 beginMatchingExtensions];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_callerBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 callerBundleIdentifier];
}

id objc_msgSend_callerTeamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 callerTeamIdentifier];
}

id objc_msgSend_canShowOnCoverScreen(void *a1, const char *a2, ...)
{
  return [a1 canShowOnCoverScreen];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return [a1 code];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return [a1 completionBlock];
}

id objc_msgSend_connectionInvalidated(void *a1, const char *a2, ...)
{
  return [a1 connectionInvalidated];
}

id objc_msgSend_createKerberosSettingsCache(void *a1, const char *a2, ...)
{
  return [a1 createKerberosSettingsCache];
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return [a1 currentRunLoop];
}

id objc_msgSend_data(void *a1, const char *a2, ...)
{
  return [a1 data];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return [a1 endpoint];
}

id objc_msgSend_extensionBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionBundleIdentifier];
}

id objc_msgSend_extensionData(void *a1, const char *a2, ...)
{
  return [a1 extensionData];
}

id objc_msgSend_extensionRequestsMode(void *a1, const char *a2, ...)
{
  return [a1 extensionRequestsMode];
}

id objc_msgSend_extensionTeamIdentifier(void *a1, const char *a2, ...)
{
  return [a1 extensionTeamIdentifier];
}

id objc_msgSend_httpBody(void *a1, const char *a2, ...)
{
  return [a1 httpBody];
}

id objc_msgSend_httpHeaders(void *a1, const char *a2, ...)
{
  return [a1 httpHeaders];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_impersonationBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 impersonationBundleIdentifier];
}

id objc_msgSend_internalExtensionBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 internalExtensionBundleIdentifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_invalidationHandler(void *a1, const char *a2, ...)
{
  return [a1 invalidationHandler];
}

id objc_msgSend_isCFNetworkInterception(void *a1, const char *a2, ...)
{
  return [a1 isCFNetworkInterception];
}

id objc_msgSend_isCallerManaged(void *a1, const char *a2, ...)
{
  return [a1 isCallerManaged];
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return [a1 isInternalBuild];
}

id objc_msgSend_isUserInteractionEnabled(void *a1, const char *a2, ...)
{
  return [a1 isUserInteractionEnabled];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_listenForConfigurationChanges(void *a1, const char *a2, ...)
{
  return [a1 listenForConfigurationChanges];
}

id objc_msgSend_loadExtensions(void *a1, const char *a2, ...)
{
  return [a1 loadExtensions];
}

id objc_msgSend_loadInternalExtension(void *a1, const char *a2, ...)
{
  return [a1 loadInternalExtension];
}

id objc_msgSend_loadedInternalExtension(void *a1, const char *a2, ...)
{
  return [a1 loadedInternalExtension];
}

id objc_msgSend_localizedCallerDisplayName(void *a1, const char *a2, ...)
{
  return [a1 localizedCallerDisplayName];
}

id objc_msgSend_localizedExtensionDisplayName(void *a1, const char *a2, ...)
{
  return [a1 localizedExtensionDisplayName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_localizedShortName(void *a1, const char *a2, ...)
{
  return [a1 localizedShortName];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_processItemBlock(void *a1, const char *a2, ...)
{
  return [a1 processItemBlock];
}

id objc_msgSend_processNextRequest(void *a1, const char *a2, ...)
{
  return [a1 processNextRequest];
}

id objc_msgSend_queueCount(void *a1, const char *a2, ...)
{
  return [a1 queueCount];
}

id objc_msgSend_realm(void *a1, const char *a2, ...)
{
  return [a1 realm];
}

id objc_msgSend_realms(void *a1, const char *a2, ...)
{
  return [a1 realms];
}

id objc_msgSend_requestCount(void *a1, const char *a2, ...)
{
  return [a1 requestCount];
}

id objc_msgSend_requestParameters(void *a1, const char *a2, ...)
{
  return [a1 requestParameters];
}

id objc_msgSend_requestedOperation(void *a1, const char *a2, ...)
{
  return [a1 requestedOperation];
}

id objc_msgSend_responseCode(void *a1, const char *a2, ...)
{
  return [a1 responseCode];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_screenLockedBehavior(void *a1, const char *a2, ...)
{
  return [a1 screenLockedBehavior];
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return [a1 service];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_unload(void *a1, const char *a2, ...)
{
  return [a1 unload];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_useInternalExtensions(void *a1, const char *a2, ...)
{
  return [a1 useInternalExtensions];
}

id objc_msgSend_willHandleURL_responseCode_callerBundleIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "willHandleURL:responseCode:callerBundleIdentifier:");
}