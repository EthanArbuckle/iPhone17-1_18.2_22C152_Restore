uint64_t sub_100005D78(int a1)
{
  size_t v2;
  _OWORD v3[2];
  long long v4;
  long long v5;
  long long v6;
  long long v7;
  long long v8;
  long long v9;
  long long v10;
  long long v11;
  long long v12;
  long long v13;
  long long v14;
  long long v15;
  long long v16;
  long long v17;
  long long v18;
  long long v19;
  long long v20;
  long long v21;
  long long v22;
  long long v23;
  long long v24;
  long long v25;
  long long v26;
  long long v27;
  long long v28;
  long long v29;
  long long v30;
  long long v31;
  long long v32;
  long long v33;
  int v34[2];
  int v35;
  int v36;

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  memset(v3, 0, sizeof(v3));
  LODWORD(v4) = 0;
  *(void *)v34 = 0xE00000001;
  v35 = 1;
  v36 = a1;
  v2 = 648;
  if (sysctl(v34, 4u, v3, &v2, 0, 0)) {
    sub_10003302C();
  }
  return (v4 >> 11) & 1;
}

BOOL sub_100005E5C(_OWORD *a1, unsigned int a2)
{
  uint64_t v10 = 0;
  long long v3 = a1[1];
  v9[0] = *a1;
  v9[1] = v3;
  v4 = +[LSBundleProxy bundleProxyWithAuditToken:v9 error:&v10];
  if (v10)
  {
    v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9[0]) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Failed to fetch LSBundleProxy for destination process audit_token during drop session.", (uint8_t *)v9, 2u);
    }
  }
  if (v4)
  {
    v6 = [v4 sdkVersion];
    BOOL v7 = _UIApplicationPackedDeploymentVersionFromString() >= (unint64_t)a2;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

id sub_100005F38(void *a1)
{
  v1 = [a1 valueForEntitlement:@"com.apple.UIKit.dragging-system-connection"];
  id v2 = [v1 isEqual:&__kCFBooleanTrue];

  return v2;
}

__CFString *sub_100005F80(void *a1)
{
  v1 = [a1 screen];
  id v2 = [v1 displayConfiguration];

  long long v3 = [v2 hardwareIdentifier];
  v4 = v3;
  if (!v3) {
    long long v3 = off_100063878;
  }
  v5 = v3;

  return v5;
}

uint64_t sub_100005FF4(void *a1)
{
  if (![a1 _isEmbeddedScreen]) {
    return 1;
  }
  v1 = +[DROrientationObserver sharedObserver];
  id v2 = [v1 interfaceOrientation];

  return (uint64_t)v2;
}

double sub_100006044(void *a1, void *a2, double a3)
{
  id v5 = a1;
  id v6 = a2;
  if (v5 != v6)
  {
    BOOL v7 = [v5 displayIdentity];
    if ([v7 isContinuityDisplay])
    {

LABEL_5:
      a3 = kSBSCGPointInvalid;
      goto LABEL_15;
    }
    v8 = [v6 displayIdentity];
    unsigned int v9 = [v8 isContinuityDisplay];

    if (v9) {
      goto LABEL_5;
    }
    id v10 = v5;
    uint64_t v11 = sub_100005FF4(v10);
    v12 = [v10 displayConfiguration];

    [v12 bounds];
    if (v11 != 1) {
      _UIConvertRectFromOrientationToOrientation();
    }
    id v13 = v6;
    uint64_t v14 = sub_100005FF4(v13);
    v15 = [v13 displayConfiguration];

    [v15 bounds];
    if (v14 != 1) {
      _UIConvertRectFromOrientationToOrientation();
    }
    v16 = [v10 displayConfiguration];
    v17 = [v13 displayConfiguration];
    if (sub_100005FF4(v10) != 1)
    {
      [v10 bounds];
      _UIConvertPointFromOrientationToOrientation();
    }
    SBSConvertPointFromDisplayToNeighboringDisplay();
    a3 = v18;
    if (sub_100005FF4(v13) != 1)
    {
      [v13 bounds];
      _UIConvertPointFromOrientationToOrientation();
      a3 = v19;
    }
  }
LABEL_15:

  return a3;
}

void sub_1000062F4(void *a1, void *a2, double a3)
{
}

id sub_10000631C(void *a1)
{
  v1 = [a1 displayIdentity];
  id v2 = [v1 isContinuityDisplay];

  return v2;
}

CGFloat sub_100006354(void *a1, void *a2, CGFloat x)
{
  id v5 = a1;
  id v6 = a2;
  if (v5 != v6)
  {
    BOOL v7 = [v5 displayIdentity];
    unsigned __int8 v8 = [v7 isContinuityDisplay];

    if ((v8 & 1) != 0
      || ([v6 displayIdentity],
          unsigned int v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isContinuityDisplay],
          v9,
          v10))
    {
      x = CGRectNull.origin.x;
    }
    else
    {
      id v11 = v5;
      uint64_t v12 = sub_100005FF4(v11);
      id v13 = [v11 displayConfiguration];

      [v13 bounds];
      if (v12 != 1) {
        _UIConvertRectFromOrientationToOrientation();
      }
      id v14 = v6;
      uint64_t v15 = sub_100005FF4(v14);
      v16 = [v14 displayConfiguration];

      [v16 bounds];
      if (v15 != 1) {
        _UIConvertRectFromOrientationToOrientation();
      }
      v17 = [v11 displayConfiguration];
      double v18 = [v14 displayConfiguration];
      if (sub_100005FF4(v11) != 1)
      {
        [v11 bounds];
        _UIConvertRectFromOrientationToOrientation();
      }
      SBSConvertRectFromDisplayToNeighboringDisplay();
      x = v19;
      if (sub_100005FF4(v14) != 1)
      {
        [v14 bounds];
        _UIConvertRectFromOrientationToOrientation();
        x = v20;
      }
    }
  }

  return x;
}

double sub_100006650(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return sqrt((a6 - a3) * (a6 - a3) + (a4 - a1) * (a4 - a1) + (a5 - a2) * (a5 - a2));
}

double sub_100006678(double a1, double a2, double a3, double a4, double a5)
{
  return atan2(a2 - a5, a4 - a1);
}

uint64_t sub_100006688()
{
  return 1;
}

void sub_100006860(id a1)
{
  v1 = DRLogTarget();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)id v2 = 0;
    _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "launchCompletionWatchdogTimer: Failed to receive -application:didFinishLaunchingWithOptions in the expected time. Exiting...", v2, 2u);
  }

  exit(1);
}

void sub_100006A38(id a1)
{
  pthread_self();
  BSPthreadSetFixedPriority();
}

id sub_100006A64(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setEventFetchThreadPriorityWhenPossible];
}

void sub_10000773C(uint64_t a1)
{
  id v2 = objc_alloc_init((Class)FBSWorkspaceSceneUpdateResponse);
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

BOOL sub_100007D70(id a1, NSString *a2, BOOL a3, DRProcessInfo *a4, DRProcessInfo *a5)
{
  BOOL v7 = a3;
  unsigned __int8 v8 = a2;
  unsigned int v9 = a4;
  unsigned int v10 = a5;
  memset(v34, 0, sizeof(v34));
  if (v9) {
    [(DRProcessInfo *)v9 auditToken];
  }
  id v11 = +[LSDocumentProxy documentProxyForName:0 type:v8 MIMEType:0 isContentManaged:v7 sourceAuditToken:v34];
  id v33 = 0;
  uint64_t v12 = [v11 availableClaimBindingsForMode:2 error:&v33];
  id v13 = v33;
  id v14 = v13;
  if (v12)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v15 = v12;
    id v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
    if (v16)
    {
      v25 = v14;
      v26 = v11;
      v27 = v9;
      v28 = v8;
      uint64_t v17 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v30 != v17) {
            objc_enumerationMutation(v15);
          }
          double v19 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          double v20 = [(DRProcessInfo *)v10 bundleID];
          v21 = [v19 bundleRecord];
          v22 = [v21 bundleIdentifier];
          unsigned __int8 v23 = [v20 isEqualToString:v22];

          if (v23)
          {
            LOBYTE(v16) = 1;
            goto LABEL_14;
          }
        }
        id v16 = [v15 countByEnumeratingWithState:&v29 objects:v37 count:16];
        if (v16) {
          continue;
        }
        break;
      }
LABEL_14:
      unsigned int v9 = v27;
      unsigned __int8 v8 = v28;
      id v14 = v25;
      id v11 = v26;
    }
  }
  else
  {
    if (!v13)
    {
      LOBYTE(v16) = 0;
      goto LABEL_20;
    }
    uint64_t v15 = DRLogTarget();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v36 = v14;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "DRDragContinuation encountered an error looking up LS claim bindings while examining types for drop. Error: %@", buf, 0xCu);
    }
    LOBYTE(v16) = 0;
  }

LABEL_20:
  return (char)v16;
}

void sub_100008468(id a1)
{
  qword_1000645E8 = [[DROrientationObserver alloc] _init];
  _objc_release_x1();
}

void sub_1000085AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000085D4(uint64_t a1, void *a2)
{
  id v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained _didReceiveOrientationUpdate:v3];
}

id sub_1000086EC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) orientationObserver:*(void *)(a1 + 40) orientationDidChange:a2];
}

void sub_100008860(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 24) = [*(id *)(a1 + 40) orientation];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v7 = 0u;
  long long v8 = 0u;
  id v2 = *(id *)(*(void *)(a1 + 32) + 16);
  id v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * (void)v6), "orientationObserver:orientationDidChange:", *(void *)(a1 + 32), *(void *)(a1 + 40), (void)v7);
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

id sub_1000089B4()
{
  v0 = +[NSBundle mainBundle];
  v1 = [v0 localizedStringForKey:@"PASTE_ANNOUNCEMENT_NOT_ALLOWED" value:@"Pasting this content is restricted" table:@"Localizable"];

  return v1;
}

id sub_100008A20(void *a1)
{
  id v1 = a1;
  id v2 = +[NSBundle mainBundle];
  id v3 = [v2 localizedStringForKey:@"PASTE_ANNOUNCEMENT_MANAGED_BY" value:@"Managed by ”%@”" table:@"Localizable"];

  id v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v1);

  return v4;
}

BOOL sub_100008ACC(void *a1)
{
  id v1 = a1;
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  int v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100008BB0;
  v4[3] = &unk_100054C80;
  v4[4] = &v5;
  objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, objc_msgSend(v1, "length"), 2, v4);
  BOOL v2 = *((_DWORD *)v6 + 6) > 0x10u;
  _Block_object_dispose(&v5, 8);

  return v2;
}

void sub_100008B98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100008BB0(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, BOOL *a7)
{
  *a7 = ++*(_DWORD *)(*(void *)(*(void *)(result + 32) + 8) + 24) > 0x10u;
  return result;
}

void sub_100008E28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100008E48(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

void sub_100008E50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = WeakRetained;
    [WeakRetained setConnection:0];
    id WeakRetained = v2;
  }
}

void sub_100009198(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000330D4();
  }

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_100009218(uint64_t a1)
{
  id v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(v3 + 32);
    unsigned int v5 = [*(id *)(v3 + 40) processIdentifier];
    int v7 = 138412546;
    uint64_t v8 = v4;
    __int16 v9 = 1024;
    unsigned int v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Notified %@, pid %d", (uint8_t *)&v7, 0x12u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_1000093DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1000330D4();
  }

  [*(id *)(*(void *)(a1 + 32) + 40) invalidate];
}

void sub_10000972C(id a1)
{
  byte_100064600 = os_variant_has_internal_diagnostics();
}

void sub_100009754(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100054D80);
}

void sub_1000097A4(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000097F0, @"com.apple.DragUI.NotifyPhoneMirroringOutsideContinuityShell", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000097F0()
{
  byte_100064610 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100009850(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t start(int a1, char **a2)
{
  unsigned int v5 = DRLogTarget();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "druid launched", v12, 2u);
  }

  _set_user_dir_suffix();
  BSSetMainThreadPriorityFixedForUI();
  pthread_self();
  BSPthreadSetFixedPriority();
  id v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  int v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  __int16 v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = UIApplicationMain(a1, a2, v7, v9);

  return v10;
}

void sub_100009B1C(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v9 = a1;
  id v6 = a4;
  int v7 = [a3 bundleID];
  uint64_t v8 = [v6 bundleID];

  LOBYTE(v6) = _UIDropAllowedBetweenApps();
  if ((v6 & 1) == 0)
  {
    [v9 setOperation:0];
    [v9 setForbidden:1];
  }
}

id sub_10000A590(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) view];
  [v2 removeFromSuperview];

  id v3 = *(void **)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = +[NSNumber numberWithUnsignedInt:*(unsigned int *)(a1 + 48)];
  [v3 setObject:0 forKeyedSubscript:v4];

  unsigned int v5 = [*(id *)(a1 + 40) pendingRemovalControllers];
  [v5 removeObject:*(void *)(a1 + 32)];

  id result = [*(id *)(*(void *)(a1 + 40) + 8) count];
  if (!result)
  {
    return (id)__UIUpdateRequestDeactivate(&unk_10003F848, 1048577);
  }
  return result;
}

void sub_10000C148(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

uint64_t sub_10000C180(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[2];
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    }
  }
  return _objc_release_x1();
}

uint64_t sub_10000C1DC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained[2];
    if (v2) {
      (*(void (**)(uint64_t, void))(v2 + 16))(v2, 0);
    }
  }
  return _objc_release_x1();
}

uint64_t sub_10000C30C(uint64_t a1)
{
  uint64_t result = *(void *)(*(void *)(a1 + 32) + 16);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_10000CF7C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v23 = a2;
  id v7 = a3;
  id v8 = a4;
  if (a1)
  {
    id v9 = +[NSUUID UUID];
    uint64_t v10 = [v9 UUIDString];
    id v11 = *(void **)(a1 + 8);
    *(void *)(a1 + 8) = v10;

    objc_storeStrong((id *)(a1 + 24), a4);
    uint64_t v12 = objc_opt_new();
    id v13 = *(void **)(a1 + 16);
    *(void *)(a1 + 16) = v12;

    id v14 = objc_alloc_init((Class)NSMutableArray);
    uint64_t v15 = [(id)a1 authorizationReplyBlock];

    id v16 = [objc_alloc((Class)PLPillContentItem) initWithText:v23 style:1];
    [v14 addObject:v16];

    if (v15)
    {
      id v17 = objc_alloc((Class)PLPillContentItem);
      double v18 = [(id)a1 authorizationDecisionView];
      id v19 = [v17 initWithText:0 style:2 accessoryView:v18];
      [v14 addObject:v19];
    }
    else
    {
      if (v7)
      {
        id v20 = [objc_alloc((Class)PLPillContentItem) initWithText:v7 style:2];
        [v14 addObject:v20];
      }
      v21 = [(id)a1 authorizationReplyBlock];

      if (v21)
      {
        v22 = [(id)a1 authorizationReplyBlock];
        v22[2](v22, 1);

        [(id)a1 setAuthorizationReplyBlock:0];
      }
    }
    [*(id *)(a1 + 16) setCenterContentItems:v14];
  }
}

id sub_10000DD20(uint64_t a1)
{
  return [*(id *)(a1 + 32) revokePresentableWithRequestIdentifier:*(void *)(a1 + 40) reason:@"timeout" animated:1 userInfo:0 error:0];
}

id sub_10000E80C(void *a1, uint64_t a2)
{
  id v3 = a1;
  uint64_t v4 = +[UTType _typeWithIdentifier:a2 allowUndeclared:1];
  unsigned int v5 = (void *)v4;
  id v6 = UTTypeItem;
  if (v4) {
    id v6 = (UTType *)v4;
  }
  id v7 = v6;

  if (![v3 length])
  {
    uint64_t v8 = [(UTType *)v7 localizedDescription];

    id v3 = (id)v8;
  }
  id v9 = [v3 stringByAppendingPathExtensionForType:v7];

  return v9;
}

void sub_10000E990(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_10000EA04(uint64_t a1)
{
  id v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = WeakRetained;
  if (WeakRetained) {
    *((unsigned char *)WeakRetained + 16) = 1;
  }
  +[NSFileCoordinator addFilePresenter:WeakRetained];
  [(id)objc_opt_class() presenterValiditySeconds];
  dispatch_time_t v5 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000EB18;
  block[3] = &unk_100054CA8;
  objc_copyWeak(&v7, v1);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);
  usleep(0x7A120u);
  objc_destroyWeak(&v7);
}

void sub_10000EB04(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_10000EB18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = -[DROnDemandFileProviderPresenter presentedItemOperationQueue]_0();
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10000EBB0;
    v3[3] = &unk_100054B58;
    v3[4] = WeakRetained;
    [v2 addOperationWithBlock:v3];
  }
}

void sub_10000EBB0(uint64_t a1)
{
  uint64_t v2 = +[NSFileCoordinator filePresenters];
  uint64_t v4 = *(void *)(a1 + 32);
  id v3 = (id *)(a1 + 32);
  if ([v2 indexOfObjectIdenticalTo:v4] != (id)0x7FFFFFFFFFFFFFFFLL
    && (objc_msgSend(*v3, "operationQueue_hasObservedEvent") & 1) == 0)
  {
    dispatch_time_t v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100033234(v3);
    }

    +[NSFileCoordinator removeFilePresenter:*v3];
    objc_msgSend(*v3, "_operationQueue_invalidate");
  }
}

void sub_10000F194(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 48);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F230;
  v5[3] = &unk_100054C58;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = *(void *)(a1 + 40);
  id v6 = v3;
  uint64_t v7 = v4;
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v5);
}

void sub_10000F230(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    uint64_t v3 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    uint64_t v7 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Reader has relinquished access to URL %@", buf, 0xCu);
  }

  uint64_t v4 = -[DROnDemandFileProviderPresenter presentedItemOperationQueue]_0();
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10000F33C;
  v5[3] = &unk_100054B58;
  void v5[4] = *(void *)(a1 + 40);
  [v4 addOperationWithBlock:v5];
}

id sub_10000F33C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_invalidate");
}

void sub_10000F344(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    uint64_t v4 = DRLogTarget();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100033390(a1);
    }
  }
  else
  {
    dispatch_time_t v5 = [*(id *)(a1 + 32) url];
    id v6 = [v5 path];
    uint64_t v7 = (const char *)[v6 fileSystemRepresentation];
    id v8 = [*(id *)(a1 + 40) path];
    LODWORD(v7) = copyfile(v7, (const char *)[v8 fileSystemRepresentation], 0, 0x100800Fu);

    id v9 = DRLogTarget();
    uint64_t v4 = v9;
    if (v7)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1000332C8((id *)(a1 + 32));
      }
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Successfully cloned file from file provider to temporary location.", buf, 2u);
    }
  }

  id v11 = _NSConcreteStackBlock;
  uint64_t v12 = 3221225472;
  id v13 = sub_10000F4F4;
  id v14 = &unk_100054B58;
  uint64_t v10 = *(void *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 48);
  (*(void (**)(void))(v10 + 16))();
}

void sub_10000F4F4(uint64_t a1)
{
  uint64_t v2 = -[DROnDemandFileProviderPresenter presentedItemOperationQueue]_0();
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_10000F580;
  v3[3] = &unk_100054B58;
  v3[4] = *(void *)(a1 + 32);
  [v2 addOperationWithBlock:v3];
}

id sub_10000F580(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_operationQueue_invalidate");
}

void sub_10000F600(id a1)
{
  qword_100064620 = (uint64_t)objc_alloc_init((Class)NSOperationQueue);
  _objc_release_x1();
}

int64_t sub_100010364(id a1, DRItemViewModel *a2, DRItemViewModel *a3)
{
  uint64_t v4 = a3;
  int64_t v5 = [(DRItemViewModel *)a2 preferredStackOrder];
  int64_t v6 = [(DRItemViewModel *)v4 preferredStackOrder];

  if (v5 < v6) {
    return -1;
  }
  else {
    return 1;
  }
}

void sub_10001100C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location)
{
  objc_destroyWeak(v28);
  objc_destroyWeak(v27);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011058(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElasticProperties];
}

void sub_100011098(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateElasticTransform];
}

id sub_1000110D8(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 288) setValue:*(double *)(a1 + 40)];
  double v2 = *(double *)(a1 + 48);
  id v3 = *(void **)(*(void *)(a1 + 32) + 296);
  return [v3 setValue:v2];
}

id sub_1000112A4(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 304) setValue:(*(double *)(a1 + 40) + 1500.0) * -12.0 / 3000.0 + 6.0];
}

id sub_1000112DC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 312) setValue:*(double *)(a1 + 48) * -4.0 / 2000.0 + 100.0];
  double v2 = *(double *)(a1 + 48) * 12.0 / 2000.0 + 100.0;
  id v3 = *(void **)(*(void *)(a1 + 32) + 320);
  return [v3 setValue:v2];
}

void sub_100011B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100011B7C(uint64_t a1, uint64_t a2, void *a3)
{
  id v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained updateSceneIdentifiersWithLayout:v4];
}

void sub_100012350(id a1)
{
  byte_100064638 = os_variant_has_internal_diagnostics();
}

double sub_100012378()
{
  if (qword_100064640 != -1) {
    dispatch_once(&qword_100064640, &stru_100054F10);
  }
  if ((byte_100064648 & 1) == 0)
  {
    id v0 = sub_100028320();
    id v1 = [v0 objectForKey:@"PrecisionModeUpOffset"];
    double v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 25.0;
    }
    qword_100064650 = *(void *)&v3;
    byte_100064648 = 1;
  }
  return *(double *)&qword_100064650;
}

void sub_100012420(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100054F30);
}

void sub_100012470(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000124BC, @"com.apple.DragUI.PrecisionModeUpOffset", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000124BC()
{
  byte_100064648 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100012504(id a1)
{
  byte_100064638 = os_variant_has_internal_diagnostics();
}

double sub_10001252C()
{
  if (qword_100064658 != -1) {
    dispatch_once(&qword_100064658, &stru_100054F70);
  }
  if ((byte_100064660 & 1) == 0)
  {
    id v0 = sub_100028320();
    id v1 = [v0 objectForKey:@"PrecisionModeDownOffset"];
    double v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 25.0;
    }
    qword_100064668 = *(void *)&v3;
    byte_100064660 = 1;
  }
  return *(double *)&qword_100064668;
}

void sub_1000125D4(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100054F90);
}

void sub_100012624(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100012670, @"com.apple.DragUI.PrecisionModeDownOffset", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100012670()
{
  byte_100064660 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_1000126B8(id a1)
{
  byte_100064638 = os_variant_has_internal_diagnostics();
}

void sub_1000126E0(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100054FF0);
}

void sub_100012730(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_10001277C, @"com.apple.DragUI.PrecisionModeUpAnchor", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_10001277C()
{
  byte_100064678 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_1000127C4(id a1)
{
  byte_100064638 = os_variant_has_internal_diagnostics();
}

void sub_1000127EC(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055050);
}

void sub_10001283C(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100012888, @"com.apple.DragUI.PrecisionModeDownAnchor", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100012888()
{
  byte_100064690 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100012F28(id a1)
{
  byte_1000646A8 = os_variant_has_internal_diagnostics();
}

double sub_100012F50()
{
  if (qword_1000646B0 != -1) {
    dispatch_once(&qword_1000646B0, &stru_100055090);
  }
  if ((byte_1000646B8 & 1) == 0)
  {
    id v0 = sub_100028320();
    id v1 = [v0 objectForKey:@"RandomStackPadding"];
    double v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 6.0;
    }
    qword_1000646C0 = *(void *)&v3;
    byte_1000646B8 = 1;
  }
  return *(double *)&qword_1000646C0;
}

void sub_100012FF8(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_1000550B0);
}

void sub_100013048(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100013094, @"com.apple.DragUI.RandomStackPadding", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100013094()
{
  byte_1000646B8 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_1000130DC(id a1)
{
  byte_1000646A8 = os_variant_has_internal_diagnostics();
}

void sub_100013104(id a1)
{
  id v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055110);
}

void sub_100013154(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000131A0, @"com.apple.DragUI.RandomStackRotation", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000131A0()
{
  byte_1000646D0 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100013848(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if (_UIIsOpenInRestrictionInEffect())
  {
    [v3 originatorDataOwner];
    int64_t v5 = [v4 bundleID];
    [v3 setOriginatorDataOwner:_UIEffectiveSourceDataOwnerForReportedDataOwner()];

    int64_t v6 = DRLogTarget();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_10003343C(v3, v6);
    }
  }
}

void sub_100013F64(id a1)
{
  uint64_t v3 = kUINSUserActivityInternalType;
  uint64_t v1 = +[NSArray arrayWithObjects:&v3 count:1];
  double v2 = (void *)qword_1000646E0;
  qword_1000646E0 = v1;
}

void sub_100014384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id location)
{
}

void sub_1000143DC(id a1)
{
  uint64_t v3 = PBMetadataTeamDataKey;
  uint64_t v1 = +[NSArray arrayWithObjects:&v3 count:1];
  double v2 = (void *)qword_1000646F0;
  qword_1000646F0 = v1;
}

id sub_10001445C(id *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(a1 + 6);
  int64_t v6 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v7 = [WeakRetained representationConformingToType:a1[4]];
    if (v7)
    {
      id v8 = objc_loadWeakRetained(a1 + 7);
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_1000145AC;
      v12[3] = &unk_1000551E8;
      id v9 = a1[4];
      id v13 = a1[5];
      id v14 = v7;
      id v16 = v4;
      id v15 = a1[4];
      uint64_t v10 = [v8 _registerRequestFromSourceItem:v6 typeIdentifier:v9 completionHandler:v12];
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

void sub_1000145AC(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = v10;
  id v14 = v13;
  if (v13 && !v11 && [v13 isBackedByFileProvider])
  {
    id v15 = [v14 fpItem];

    if (v15)
    {
      id v16 = [v14 fpItem];
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      v52 = sub_100014F28;
      v53 = sub_100014F38;
      v54 = 0;
      dispatch_semaphore_t v17 = dispatch_semaphore_create(0);
      double v18 = +[FPItemManager defaultManager];
      v45 = _NSConcreteStackBlock;
      uint64_t v46 = 3221225472;
      uint64_t v47 = (uint64_t)sub_100016028;
      v48 = &unk_1000552F8;
      v50 = buf;
      id v19 = v17;
      v49 = v19;
      [v18 fetchURLForItem:v16 completionHandler:&v45];

      dispatch_semaphore_wait(v19, 0xFFFFFFFFFFFFFFFFLL);
      id v20 = *(id *)(*(void *)&buf[8] + 40);

      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v20 = [v14 url];
    }
    v22 = *(void **)(a1 + 32);
    if (v22) {
      [v22 auditToken];
    }
    else {
      memset(v44, 0, sizeof(v44));
    }
    if (+[DRDataTransferSession _shouldRestrictOpenInPlaceFor:v20 destinationAuditToken:v44])
    {
      goto LABEL_18;
    }
    if ([v14 isReadonly]) {
      goto LABEL_18;
    }
    if ([*(id *)(a1 + 40) preferredRepresentation] != (id)2) {
      goto LABEL_18;
    }
    id v23 = v20;
    v45 = 0;
    uint64_t v46 = (uint64_t)&v45;
    uint64_t v47 = 0x2020000000;
    LOBYTE(v48) = 0;
    dispatch_semaphore_t v24 = dispatch_semaphore_create(0);
    v25 = +[FPItemManager defaultManager];
    *(void *)buf = _NSConcreteStackBlock;
    *(void *)&buf[8] = 3221225472;
    *(void *)&uint8_t buf[16] = sub_100016088;
    v52 = (uint64_t (*)(uint64_t, uint64_t))&unk_100055320;
    v54 = &v45;
    v26 = v24;
    v53 = (void (*)(uint64_t))v26;
    [v25 fetchItemForURL:v23 completionHandler:buf];

    dispatch_semaphore_wait(v26, 0xFFFFFFFFFFFFFFFFLL);
    BOOL v27 = *(unsigned char *)(v46 + 24) == 0;

    _Block_object_dispose(&v45, 8);
    if (v27)
    {
LABEL_18:
      long long v32 = DRLogTarget();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating a local exported clone.", buf, 2u);
      }

      uint64_t v33 = *(void *)(a1 + 48);
      v40[0] = v14;
      long long v31 = +[DROnDemandFileProviderPresenter presenterPresentingURLWrapper:v14 type:v33 outURLWrapper:v40];
      id v34 = v40[0];

      [v31 setShouldEvictWhenDone:1];
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100014CC4;
      block[3] = &unk_1000551C0;
      id v38 = *(id *)(a1 + 56);
      id v21 = v34;
      id v36 = v21;
      id v37 = 0;
      id v39 = v12;
      if (qword_100064708 != -1) {
        dispatch_once(&qword_100064708, &stru_100055340);
      }
      dispatch_async((dispatch_queue_t)qword_100064700, block);
    }
    else
    {
      v28 = DRLogTarget();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        long long v29 = [*(id *)(a1 + 32) bundleID];
        *(_DWORD *)buf = 138543618;
        *(void *)&uint8_t buf[4] = v23;
        *(_WORD *)&buf[12] = 2114;
        *(void *)&buf[14] = v29;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Extending file provider ACL for %{public}@ to %{public}@", buf, 0x16u);
      }
      long long v30 = [*(id *)(a1 + 32) bundleID];
      v40[1] = _NSConcreteStackBlock;
      v40[2] = (id)3221225472;
      v40[3] = sub_100014BC8;
      v40[4] = &unk_100055198;
      id v43 = *(id *)(a1 + 56);
      id v41 = v9;
      id v21 = v14;
      id v42 = v21;
      FPExtendBookmarkForDocumentURL();

      long long v31 = v43;
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    id v21 = v14;
  }
}

void sub_100014B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
}

uint64_t sub_100014BC8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int64_t v6 = DRLogTarget();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 138412546;
    uint64_t v9 = a2;
    __int16 v10 = 2112;
    uint64_t v11 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "File provider ACL extension result: %@, error: %@", (uint8_t *)&v8, 0x16u);
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 48) + 16))();
}

uint64_t sub_100014CC4(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void, void))(a1[6] + 16))(a1[6], 0, a1[4], 0, a1[5], a1[7]);
}

void sub_100014F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100014F28(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100014F38(uint64_t a1)
{
}

id sub_100014F40()
{
  if (qword_100064718 != -1) {
    dispatch_once(&qword_100064718, &stru_100055360);
  }
  id v0 = (void *)qword_100064710;
  return v0;
}

void sub_100014F94(uint64_t a1)
{
  int64_t v6 = objc_alloc_init(DRDataTransferRequest);
  [(DRDataTransferRequest *)v6 setSourceItem:*(void *)(a1 + 32)];
  [(DRDataTransferRequest *)v6 setTypeIdentifier:*(void *)(a1 + 40)];
  [(DRDataTransferRequest *)v6 setCompletionHandler:*(void *)(a1 + 56)];
  double v2 = +[NSProgress discreteProgressWithTotalUnitCount:100];
  [(DRDataTransferRequest *)v6 setProgress:v2];

  uint64_t v3 = [(DRDataTransferRequest *)v6 progress];
  uint64_t v4 = *(void *)(*(void *)(a1 + 64) + 8);
  int64_t v5 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v3;

  [*(id *)(*(void *)(a1 + 48) + 48) addObject:v6];
  objc_msgSend(*(id *)(a1 + 48), "_transferQueue_scheduleNextTransfer");
}

void sub_1000155E4(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a3;
  id v12 = a2;
  id v13 = DRLogTarget();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v15 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 138412802;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Completed load for type %@ from item UUID %@. Error: %@", buf, 0x20u);
  }

  id v16 = [*(id *)(a1 + 48) completionHandler];
  ((void (**)(void, id, id, id, id))v16)[2](v16, v12, v11, v9, v10);

  dispatch_semaphore_t v17 = sub_100014F40();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000157A0;
  block[3] = &unk_100054C58;
  int8x16_t v19 = *(int8x16_t *)(a1 + 48);
  id v18 = (id)v19.i64[0];
  int8x16_t v21 = vextq_s8(v19, v19, 8uLL);
  dispatch_async(v17, block);
}

id sub_1000157A0(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 56) removeObject:*(void *)(a1 + 40)];
  double v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "_transferQueue_scheduleNextTransfer");
}

void sub_1000157E0(uint64_t a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_1000159E8;
  v25[3] = &unk_100055288;
  id v13 = *(void **)(a1 + 32);
  id v14 = *(id *)(a1 + 40);
  id v26 = v9;
  id v27 = v10;
  id v28 = v11;
  id v29 = v14;
  id v30 = v12;
  id v15 = v13;
  id v16 = v25;
  dispatch_semaphore_t v17 = dispatch_get_global_queue(0, 0);
  id v18 = v12;
  id v19 = v11;
  id v20 = v10;
  id v21 = v9;
  v22 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v17);

  dispatch_source_set_timer(v22, 0, 0x1DCD6500uLL, 0xEE6B280uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10001648C;
  handler[3] = &unk_100055448;
  id v32 = v15;
  uint64_t v33 = v22;
  id v34 = v16;
  id v23 = v15;
  __int16 v24 = v22;
  dispatch_source_set_event_handler(v24, handler);
  dispatch_resume(v24);
}

uint64_t sub_1000159E8(void *a1)
{
  return (*(uint64_t (**)(void, void, void, void, void))(a1[7] + 16))(a1[7], a1[4], a1[5], a1[6], a1[8]);
}

void sub_100015B80(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    [v4 dataTransferSessionBegan:*(void *)(a1 + 32)];
  }
}

void sub_100015C18(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  char v3 = objc_opt_respondsToSelector();

  if (v3)
  {
    id v4 = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    [v4 dataTransferSessionFinished:*(void *)(a1 + 32)];
  }
}

id sub_100015D38(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 64)) {
    sub_1000334D8();
  }
  *(unsigned char *)(v1 + 64) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendDelegateCallbacksIfNeeded");
  char v3 = *(void **)(*(void *)(a1 + 32) + 40);
  return _[v3 sendDelegateEventsIfNeeded];
}

id sub_100015E20(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 65) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendDelegateCallbacksIfNeeded");
}

id sub_100015EBC(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 66) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_transferQueue_sendDelegateCallbacksIfNeeded");
}

void sub_100016028(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_100016088(uint64_t a1, uint64_t a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2 != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_1000160A4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.DragUI.druid.transferCallbackQueue", 0);
  uint64_t v2 = qword_100064700;
  qword_100064700 = (uint64_t)v1;
  _objc_release_x1(v1, v2);
}

void sub_1000160E4(id a1)
{
  dispatch_queue_t v1 = dispatch_queue_create("com.apple.DragUI.druid.transferQueue", 0);
  uint64_t v2 = qword_100064710;
  qword_100064710 = (uint64_t)v1;
  _objc_release_x1(v1, v2);
}

void sub_100016124(id a1)
{
  byte_100064728 = os_variant_has_internal_diagnostics();
}

uint64_t sub_10001614C()
{
  if (qword_100064730 != -1) {
    dispatch_once(&qword_100064730, &stru_1000553A0);
  }
  if ((byte_100064738 & 1) == 0)
  {
    id v0 = sub_100028320();
    dispatch_queue_t v1 = [v0 objectForKey:@"maxSimultaneousTransfers"];
    uint64_t v2 = v1;
    if (v1) {
      uint64_t v3 = (uint64_t)[v1 integerValue];
    }
    else {
      uint64_t v3 = 3;
    }
    qword_100064740 = v3;
    byte_100064738 = 1;
  }
  return qword_100064740;
}

void sub_1000161F4(id a1)
{
  dispatch_queue_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_1000553C0);
}

void sub_100016244(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100016290, @"com.apple.DragUI.maxSimultaneousTransfers", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100016290()
{
  byte_100064738 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_1000162D8(id a1)
{
  byte_100064728 = os_variant_has_internal_diagnostics();
}

double sub_100016300()
{
  if (qword_100064748 != -1) {
    dispatch_once(&qword_100064748, &stru_100055400);
  }
  if ((byte_100064750 & 1) == 0)
  {
    id v0 = sub_100028320();
    dispatch_queue_t v1 = [v0 objectForKey:@"slowDownTransferTime"];
    uint64_t v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      uint64_t v3 = 0;
    }
    qword_100064758 = v3;
    byte_100064750 = 1;
  }
  return *(double *)&qword_100064758;
}

void sub_1000163A8(id a1)
{
  dispatch_queue_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055420);
}

void sub_1000163F8(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100016444, @"com.apple.DragUI.slowDownTransferTime", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100016444()
{
  byte_100064750 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

id sub_10001648C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) completedUnitCount];
  if (v2 == [*(id *)(a1 + 32) totalUnitCount])
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 40));
    uint64_t v3 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
    return (id)v3();
  }
  else
  {
    int64_t v5 = *(void **)(a1 + 32);
    int64_t v6 = (char *)[v5 completedUnitCount] + 1;
    return _[v5 setCompletedUnitCount:v6];
  }
}

id sub_100017028(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) layer];
  uint64_t v3 = [v2 presentationLayer];
  [v3 position];
  objc_msgSend(*(id *)(a1 + 32), "setCenter:");

  id v4 = [*(id *)(a1 + 32) layer];
  int64_t v5 = [v4 presentationLayer];
  [v5 anchorPoint];
  double v7 = v6;
  double v9 = v8;
  id v10 = [*(id *)(a1 + 40) layer];
  objc_msgSend(v10, "setAnchorPoint:", v7, v9);

  [*(id *)(a1 + 32) center];
  id v11 = *(void **)(a1 + 40);
  return objc_msgSend(v11, "setCenter:");
}

void sub_1000170F4(uint64_t a1)
{
  id v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_100017224;
  id v13 = &unk_100055470;
  id v14 = *(id *)(a1 + 32);
  id v15 = *(id *)(a1 + 40);
  long long v16 = *(_OWORD *)(a1 + 48);
  id v2 = objc_retainBlock(&v10);
  uint64_t v3 = v2;
  if (*(unsigned char *)(a1 + 80)) {
    +[UIView _performWithoutRetargetingAnimations:](UIView, "_performWithoutRetargetingAnimations:", v2, v10, v11, v12, v13, v14);
  }
  else {
    ((void (*)(void ***))v2[2])(v2);
  }
  double v4 = *(double *)(a1 + 64);
  double v5 = *(double *)(a1 + 72);
  double v6 = objc_msgSend(*(id *)(a1 + 32), "layer", v10, v11, v12, v13);
  objc_msgSend(v6, "setAnchorPoint:", v4, v5);

  double v7 = *(double *)(a1 + 64);
  double v8 = *(double *)(a1 + 72);
  double v9 = [*(id *)(a1 + 40) layer];
  objc_msgSend(v9, "setAnchorPoint:", v7, v8);
}

id sub_100017224(uint64_t a1)
{
  [*(id *)(a1 + 40) alpha];
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:");
  objc_msgSend(*(id *)(a1 + 32), "setOverrideSize:", CGSizeZero.width, CGSizeZero.height);
  [*(id *)(a1 + 40) stackRotation];
  objc_msgSend(*(id *)(a1 + 32), "setStackRotation:");
  objc_msgSend(*(id *)(a1 + 40), "setOverrideSize:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  id v2 = *(void **)(a1 + 40);
  return [v2 setAlpha:0.0];
}

void sub_10001729C(void *a1)
{
  id v2 = [*(id *)(a1[4] + 16) objectForKey:a1[5]];
  [v2 removeObject:a1[6]];
  if (![v2 count]) {
    [*(id *)(a1[4] + 16) removeObjectForKey:a1[5]];
  }
}

id sub_100017EFC(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setConstrainSize:", objc_msgSend(*(id *)(a1 + 40), "constrainSize"));
  [*(id *)(a1 + 40) anchorPoint];
  double v3 = v2;
  double v5 = v4;
  double v6 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v6, "setAnchorPoint:", v3, v5);

  [*(id *)(a1 + 40) stackRotation];
  objc_msgSend(*(id *)(a1 + 32), "setStackRotation:");
  objc_msgSend(*(id *)(a1 + 32), "setAppliesOriginalRotation:", objc_msgSend(*(id *)(a1 + 40), "applyOriginalRotation"));
  double v7 = *(double *)(a1 + 48);
  double v8 = *(void **)(a1 + 32);
  return [v8 setOrientationRotation:v7];
}

id sub_100017FA4(uint64_t a1)
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v2 = *(id *)(a1 + 32);
  id v3 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v23;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v23 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
      }
      id v4 = [v2 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v4);
  }

  double v7 = [*(id *)(a1 + 48) model];
  double v8 = v7;
  if (v7)
  {
    [v7 appliedTransform];
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v19 = 0u;
  }
  double v9 = *(void **)(a1 + 40);
  v18[0] = v19;
  v18[1] = v20;
  v18[2] = v21;
  [v9 setAppliedTransform:v18];

  id v10 = [*(id *)(a1 + 48) model];
  uint64_t v11 = v10;
  if (v10)
  {
    [v10 elasticTransform];
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v15 = 0u;
  }
  id v12 = *(void **)(a1 + 40);
  v14[0] = v15;
  v14[1] = v16;
  v14[2] = v17;
  [v12 setAdditionalTransform:v14];

  return objc_msgSend(*(id *)(a1 + 40), "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));
}

id sub_100018E78(id *a1)
{
  [a1[4] center];
  double v3 = v2;
  double v5 = v4;
  [a1[5] center];
  double v7 = v3 - v6;
  double v9 = v5 - v8;
  [a1[6] center];
  double v11 = v7 + v10;
  double v13 = v9 + v12;
  id v14 = a1[6];
  return objc_msgSend(v14, "setCenter:", v11, v13);
}

id sub_100018EE4(uint64_t a1)
{
  [*(id *)(a1 + 40) center];
  double v2 = *(void **)(a1 + 32);
  return objc_msgSend(v2, "setCenter:");
}

id sub_100018F20(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 40) || *(unsigned char *)(a1 + 41)) {
    double v1 = 1.0;
  }
  else {
    double v1 = 0.0;
  }
  return [*(id *)(a1 + 32) setAlpha:v1];
}

void sub_100018F44(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 64))
  {
    double v2 = *(double *)(a1 + 48);
    double v3 = *(double *)(a1 + 56);
  }
  else
  {
    [*(id *)(a1 + 32) badgeLocation];
    double v2 = v4;
    double v3 = v5;
  }
  double v6 = *(void **)(a1 + 32);
  id v13 = [v6 superview];
  objc_msgSend(v6, "convertPoint:toView:", v13, v2, v3);
  double v8 = v7;
  double v10 = v9;
  [*(id *)(a1 + 32) center];
  objc_msgSend(*(id *)(a1 + 40), "setCenter:", v8 - v11, v10 - v12);
}

void sub_100018FF0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  long long v2 = *(_OWORD *)(a1 + 88);
  v8[0] = *(_OWORD *)(a1 + 72);
  v8[1] = v2;
  v8[2] = *(_OWORD *)(a1 + 104);
  [*(id *)(a1 + 32) setTransform:v8];
  [*(id *)(a1 + 32) anchorPointForAlignment];
  double v4 = v3;
  double v6 = v5;
  double v7 = [*(id *)(a1 + 32) layer];
  objc_msgSend(v7, "setAnchorPoint:", v4, v6);
}

id sub_100019080(uint64_t a1)
{
  long long v1 = *(_OWORD *)(a1 + 56);
  v3[0] = *(_OWORD *)(a1 + 40);
  v3[1] = v1;
  v3[2] = *(_OWORD *)(a1 + 72);
  return [*(id *)(a1 + 32) setTransform:v3];
}

id sub_100019578(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancel];
}

id sub_100019A80(uint64_t a1)
{
  [*(id *)(a1 + 32) setDelegate:*(void *)(a1 + 40)];
  [*(id *)(a1 + 32) setCancelHandler:&stru_1000555F8];
  long long v2 = *(void **)(a1 + 32);
  double v3 = [*(id *)(a1 + 40) queue];
  [v2 setDispatchQueue:v3];

  double v4 = *(void **)(a1 + 32);
  return [v4 activate];
}

void sub_100019AF8(id a1)
{
  long long v1 = DRLogTarget();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Virtual HID Service cancelled.", v2, 2u);
  }
}

void sub_100019C40(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) eventService];
  [v2 dispatchEvent:*(void *)(a1 + 40)];
}

void sub_10001AC44(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_10001AC9C(uint64_t a1)
{
  uint64_t v2 = +[NSXPCConnection currentConnection];
  if (v2 == *(void **)(a1 + 32))
  {
    id v4 = v2;
    double v3 = [v2 valueForEntitlement:@"com.apple.DragUI.accessibility"];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = [v3 isEqual:&__kCFBooleanTrue];

    uint64_t v2 = v4;
  }
  else
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
}

void sub_10001AD38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && WeakRetained[6])
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained _touchWatchdogFired];
    id WeakRetained = v2;
  }
}

__CFString *sub_10001AE78(unint64_t a1)
{
  if (a1 >= 8)
  {
    long long v1 = +[NSString stringWithFormat:@"Unknown (%lu)", a1];
  }
  else
  {
    long long v1 = off_100055A60[a1];
  }
  return v1;
}

void sub_10001B6D0(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = *(unsigned __int8 *)(a1 + 52);
    int v4 = *(_DWORD *)(a1 + 40);
    int v5 = *(_DWORD *)(a1 + 44);
    int v6 = *(_DWORD *)(a1 + 48);
    int v14 = 67109888;
    *(_DWORD *)long long v15 = v4;
    *(_WORD *)&v15[4] = 1024;
    *(_DWORD *)&v15[6] = v3;
    __int16 v16 = 1024;
    int v17 = v5;
    __int16 v18 = 1024;
    int v19 = v6;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Observed touch up for touch %d detached %d context %u pid %d", (uint8_t *)&v14, 0x1Au);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  uint64_t v8 = *(void *)(v7 + 56);
  if (v8)
  {
    *(void *)(v7 + 56) = v8 - 1;
    uint64_t v9 = *(void *)(a1 + 32);
    if (!*(void *)(v9 + 56) && !*(unsigned char *)(v9 + 64))
    {
      *(unsigned char *)(v9 + 202) = 1;
      *(_DWORD *)(*(void *)(a1 + 32) + 204) = *(_DWORD *)(a1 + 48);
      double v10 = NSAllMapTableValues(*(NSMapTable **)(*(void *)(a1 + 32) + 104));
      id v11 = [v10 count];

      if (v11)
      {
        [*(id *)(a1 + 32) _runBlocksWaitingForLastTouchAndDestinationToEndIfPossible];
      }
      else
      {
        double v12 = DRLogTarget();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = *(void *)(a1 + 32);
          int v14 = 138412290;
          *(void *)long long v15 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Session %@: last touch up occured without any valid destinations", (uint8_t *)&v14, 0xCu);
        }

        [*(id *)(a1 + 32) _cancelDrag];
      }
    }
  }
}

void sub_10001BBA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10001BBCC(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  id WeakRetained = (dispatch_queue_t *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v7 = WeakRetained;
  if (WeakRetained)
  {
    dispatch_assert_queue_V2(WeakRetained[1]);
    [(dispatch_queue_t *)v7 _acceptDragPreviews:v8 fence:v5 fromClient:*(void *)(a1 + 32)];
  }
}

void sub_10001D224(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  id v4 = [*(id *)(a1 + 48) connection];
  [v1 _performDropOperation:v3 layerContext:v2 forConnection:v4];
}

void sub_10001D324(uint64_t a1)
{
  long long v1 = *(void **)(a1 + 32);
  id v2 = [*(id *)(a1 + 40) dataTransferSession];
  [v1 _endDragWithOperation:1 dataTransferSession:v2];
}

void sub_10001D914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *a10, id *a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a10);
  objc_destroyWeak((id *)(v12 - 128));
  _Unwind_Resume(a1);
}

void sub_10001D960(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v21 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Session %@: destination performed drop and replied", buf, 0xCu);
    }

    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void **)(v6 + 232);
    if (v7)
    {
      [v7 cancel];
      uint64_t v8 = *(void *)(a1 + 32);
      uint64_t v9 = *(void **)(v8 + 232);
      *(void *)(v8 + 232) = 0;

      uint64_t v6 = *(void *)(a1 + 32);
    }
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10001DBC4;
    v17[3] = &unk_100055700;
    v17[4] = v6;
    v17[5] = WeakRetained;
    uint64_t v19 = *(void *)(a1 + 56);
    id v18 = *(id *)(a1 + 40);
    double v10 = objc_retainBlock(v17);
    if ([WeakRetained state] == (id)2)
    {
      if (*(unsigned char *)(a1 + 64))
      {
        id v11 = [WeakRetained delegate];
        uint64_t v12 = WeakRetained[1];
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_10001DBE4;
        _OWORD v14[3] = &unk_100055728;
        id v15 = *(id *)(a1 + 40);
        __int16 v16 = v10;
        [v11 dragSession:WeakRetained removeVisibleDroppedItemsInSpaceOfLayerContext:v3 replyingOnQueue:v12 with:v14];
      }
      else
      {
        uint64_t v13 = [*(id *)(a1 + 32) delegate];
        [v13 dragSession:*(void *)(a1 + 32) animateOutVisibleItemsWithOperation:*(void *)(a1 + 56)];

        ((void (*)(void *))v10[2])(v10);
      }
    }
    else
    {
      [WeakRetained _endDragWithOperation:0 destination:*(void *)(a1 + 40)];
    }
  }
}

id sub_10001DBC4(void *a1)
{
  uint64_t v3 = a1[4];
  id v2 = (void *)a1[5];
  if (*(void *)(v3 + 160)) {
    return [v2 setState:5];
  }
  else {
    return [v2 _endDragWithOperation:a1[7] destination:a1[6]];
  }
}

uint64_t sub_10001DBE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  [*(id *)(a1 + 32) handOffDroppedItems:a2 withFence:a3];
  id v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v4();
}

void sub_10001DC30(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    uint64_t v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v4 = 138412290;
      id v5 = WeakRetained;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: performDrop timeout elapsed, invalidating", (uint8_t *)&v4, 0xCu);
    }
  }
  [*(id *)(a1 + 32) invalidate];
}

void sub_10001DCF8(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v5 = DRLogTarget();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000338BC();
    }

    [WeakRetained _endDragWithOperation:0 destination:*(void *)(a1 + 40)];
  }
}

void sub_10001DD80(uint64_t a1, void *a2)
{
  id v3 = a2;
  int v4 = [*(id *)(a1 + 32) dataTransferSession];
  id v5 = *(void **)(a1 + 40);
  if (v5) {
    [v5 auditToken];
  }
  else {
    memset(v26, 0, sizeof(v26));
  }
  [v4 setDestinationAuditToken:v26];
  uint64_t v6 = [*(id *)(a1 + 48) takeProcessAssertionOnPID:*(unsigned int *)(a1 + 88)];
  uint64_t v7 = *(void *)(a1 + 48);
  uint64_t v8 = *(void **)(v7 + 112);
  *(void *)(v7 + 112) = v6;

  uint64_t v9 = DRLogTarget();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    uint64_t v10 = *(void *)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    *(_DWORD *)buf = 138412546;
    uint64_t v28 = v10;
    __int16 v29 = 2112;
    uint64_t v30 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Session %@: telling destination %@ to perform drop", buf, 0x16u);
  }

  if (!*(unsigned char *)(a1 + 92))
  {

    id v3 = &__NSArray0__struct;
  }
  unsigned int v12 = [*(id *)(a1 + 32) expectsStagedLegacySelectors];
  uint64_t v13 = *(void **)(a1 + 64);
  int v14 = [v4 destinationItemCollection];
  id v15 = [v4 destinationDataProviderEndpoint];
  if (v12)
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_10001E0B4;
    v24[3] = &unk_1000557C8;
    id v25 = *(id *)(a1 + 72);
    [v13 performDropWithItemCollection:v14 dataProviderEndpoint:v15 visibleDroppedItems:v3 reply:v24];

    int v14 = v25;
  }
  else
  {
    [v13 performDropWithItemCollection:v14 dataProviderEndpoint:v15 visibleDroppedItems:v3 completion:*(void *)(a1 + 72)];
  }
  if ((sub_100005D78(*(_DWORD *)(a1 + 88)) & 1) == 0)
  {
    if (qword_100064768 != -1) {
      dispatch_once(&qword_100064768, &stru_100055A00);
    }
    double v16 = 10.0;
    if (byte_100064770)
    {
      if (qword_100064788 != -1) {
        dispatch_once(&qword_100064788, &stru_100055A20);
      }
      if ((byte_100064790 & 1) == 0)
      {
        long long v20 = sub_100028320();
        long long v21 = [v20 objectForKey:@"PerformDropTimeout"];
        long long v22 = v21;
        if (v21) {
          [v21 doubleValue];
        }
        else {
          double v23 = 10.0;
        }
        qword_100064798 = *(void *)&v23;
        byte_100064790 = 1;
      }
      double v16 = *(double *)&qword_100064798;
    }
    int v17 = [[DRDispatchTimer alloc] initWithQueue:*(void *)(*(void *)(a1 + 48) + 8) eventHandler:*(void *)(a1 + 80)];
    [(DRDispatchTimer *)v17 resetWithTimeout:v16 leeway:v16 * 0.1];
    [(DRDispatchTimer *)v17 activate];
    uint64_t v18 = *(void *)(a1 + 48);
    uint64_t v19 = *(void **)(v18 + 232);
    *(void *)(v18 + 232) = v17;
  }
}

void sub_10001E0B4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = (id)objc_opt_new();
  [v6 setContextID:a2];
  [v6 setRenderID:a3];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_10001E2C4(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) state];
  if (result == (id)1)
  {
    id v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      int v5 = 138412290;
      uint64_t v6 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: last touch and destination have both ended, and state is still dragging, so cancelling the drag", (uint8_t *)&v5, 0xCu);
    }

    return [*(id *)(a1 + 32) _endDragByCancelling];
  }
  return result;
}

void sub_10001E6C4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    int v7 = 138412546;
    uint64_t v8 = v5;
    __int16 v9 = 2048;
    id v10 = [v3 count];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Session %@: requested visible items, got %ld", (uint8_t *)&v7, 0x16u);
  }

  if (v3) {
    uint64_t v6 = v3;
  }
  else {
    uint64_t v6 = &__NSArray0__struct;
  }
  (*(void (**)(void, void *))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), v6);
}

void sub_10001E870(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  if (v2[24] && !v2[45])
  {
    id v3 = [v2 delegate];
    objc_msgSend(v3, "dragSession:transformedPointFromContextID:point:", *(void *)(a1 + 32), *(unsigned int *)(*(void *)(a1 + 32) + 92), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;

    id v10 = DRLogTarget();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      unsigned int v12 = +[NSString stringWithFormat:@"{%.3f,%.3f,%.3f}", *(void *)&v5, *(void *)&v7, *(void *)&v9];
      *(_DWORD *)buf = 138412546;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      double v16 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Session %@: AX starting touch at %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "beginAtPoint:", v5, v7, v9);
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 360), *(id *)(a1 + 40));
  }
}

void sub_10001EB00(uint64_t a1)
{
  double v2 = *(double *)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 360), "moveToLocation:", v2, v3, 0.0);
  id v4 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v4, "dragSession:moveToLocation:", *(void *)(a1 + 32), v2, v3, 0.0);
}

id sub_10001EC7C(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 360) lift];
  double v2 = *(void **)(a1 + 32);
  return [v2 _lastTouchEndedNormally:1];
}

id sub_10001EDB8(uint64_t a1)
{
  return [*(id *)(a1 + 32) _lastTouchEndedNormally:0];
}

void sub_10001EE80(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 259) && !*(void *)(v1 + 360))
  {
    double v3 = DRLogTarget();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      uint64_t v4 = *(void *)(a1 + 32);
      double v5 = +[NSString stringWithFormat:@"{%.3f,%.3f,%.3f}", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64)];
      *(_DWORD *)buf = 138412546;
      uint64_t v7 = v4;
      __int16 v8 = 2112;
      double v9 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Session %@: Pointer drag starting touch at %@", buf, 0x16u);
    }
    objc_msgSend(*(id *)(a1 + 40), "beginAtPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 360), *(id *)(a1 + 40));
  }
}

id sub_10001F094(uint64_t a1)
{
  return [*(id *)(a1 + 32) _resetTouchWatchdogWithTimeout:20.0];
}

void sub_10001F218(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetTouchWatchdogWithTimeout:20.0];
  double v2 = *(void **)(a1 + 40);
  double v3 = *(double *)(a1 + 48);
  double v4 = *(double *)(a1 + 56);
  double v5 = *(double *)(a1 + 64);
  if (v2 == *(void **)(*(void *)(a1 + 32) + 360))
  {
    objc_msgSend(v2, "moveToLocation:", v3, v4, v5);
  }
  else
  {
    objc_msgSend(v2, "beginAtPoint:", v3, v4, v5);
    *(unsigned char *)(*(void *)(a1 + 32) + 64) = 1;
    double v6 = [*(id *)(a1 + 40) screen];
    uint64_t v7 = [*(id *)(*(void *)(a1 + 32) + 360) screen];
    sub_1000062F4(v6, v7, *(double *)(a1 + 48));
    double v9 = v8;
    double v11 = v10;
    double v13 = v12;

    objc_msgSend(*(id *)(*(void *)(a1 + 32) + 360), "liftAtLocation:", v9, v11, v13);
    uint64_t v14 = [*(id *)(a1 + 40) screen];
    __int16 v15 = [v14 displayConfiguration];

    double v16 = [*(id *)(*(void *)(a1 + 32) + 360) screen];
    int v17 = [v16 displayConfiguration];

    uint64_t v18 = DRLogTarget();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v15 hardwareIdentifier];
      long long v20 = +[NSString stringWithFormat:@"{%.3f,%.3f,%.3f}", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 64)];
      long long v21 = [v17 hardwareIdentifier];
      long long v22 = +[NSString stringWithFormat:@"{%.3f,%.3f,%.3f}", *(void *)&v9, *(void *)&v11, *(void *)&v13];
      *(_DWORD *)buf = 138413058;
      id v34 = v19;
      __int16 v35 = 2112;
      id v36 = v20;
      __int16 v37 = 2112;
      id v38 = v21;
      __int16 v39 = 2112;
      v40 = v22;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "movePointer: display: %@ point: %@ -- previous display: %@ converted point: %@", buf, 0x2Au);
    }
    objc_storeStrong((id *)(*(void *)(a1 + 32) + 360), *(id *)(a1 + 40));
  }
  double v23 = [*(id *)(a1 + 40) screen];
  long long v24 = [*(id *)(a1 + 32) sourceInteractionWindow];
  id v25 = [v24 screen];
  sub_1000062F4(v23, v25, *(double *)(a1 + 48));
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;

  id v32 = [*(id *)(a1 + 32) delegate];
  objc_msgSend(v32, "dragSession:moveToLocation:", *(void *)(a1 + 32), v27, v29, v31);
}

id sub_10001F5F4(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetTouchWatchdogWithTimeout:20.0];
  [*(id *)(*(void *)(a1 + 32) + 360) lift];
  double v2 = *(void **)(a1 + 32);
  return [v2 _lastTouchEndedNormally:1];
}

id sub_10001F73C(uint64_t a1)
{
  [*(id *)(a1 + 32) _resetTouchWatchdogWithTimeout:20.0];
  double v2 = *(void **)(a1 + 32);
  return [v2 _lastTouchEndedNormally:0];
}

void sub_10001FD14(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) canLoadObjectOfClass:objc_opt_class()];
  double v3 = *(void **)(a1 + 32);
  if (v2)
  {
    uint64_t v4 = objc_opt_class();
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10001FEDC;
    v15[3] = &unk_100055868;
    double v5 = *(void **)(a1 + 48);
    v15[4] = *(void *)(a1 + 40);
    id v16 = v5;
    id v6 = [v3 loadObjectOfClass:v4 completionHandler:v15];
  }
  else
  {
    uint64_t v7 = [*(id *)(a1 + 32) registeredTypeIdentifiersWithFileOptions:1];
    if ([v7 count])
    {
      double v8 = *(void **)(a1 + 32);
      double v9 = [v7 firstObject];
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10001FF68;
      v13[3] = &unk_100055890;
      double v10 = *(void **)(a1 + 48);
      v13[4] = *(void *)(a1 + 40);
      id v14 = v10;
      id v11 = [v8 loadInPlaceFileRepresentationForTypeIdentifier:v9 completionHandler:v13];
    }
    else
    {
      double v12 = DRLogTarget();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_10003398C(a1, v12);
      }

      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
  }
}

void sub_10001FEDC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    uint64_t v7 = DRLogTarget();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100033A18();
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_10001FF68(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7 = a2;
  id v8 = a4;
  if (v8)
  {
    double v9 = DRLogTarget();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_100033AEC();
    }
  }
  else
  {
    if (a3)
    {
      double v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    else
    {
      id v11 = DRLogTarget();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_100033A80();
      }

      double v10 = *(void (**)(void))(*(void *)(a1 + 40) + 16);
    }
    v10();
  }
}

void sub_10002022C(void *a1)
{
  unsigned int v2 = (void *)a1[4];
  uint64_t v3 = objc_opt_class();
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000202E4;
  v6[3] = &unk_100055908;
  uint64_t v4 = (void *)a1[6];
  v6[4] = a1[5];
  id v7 = v4;
  id v5 = [v2 loadObjectOfClass:v3 completionHandler:v6];
}

void sub_1000202E4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = DRLogTarget();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100033B54();
    }

    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000203F8;
    v11[3] = &unk_1000558E0;
    id v8 = v5;
    uint64_t v9 = *(void *)(a1 + 32);
    double v10 = *(void **)(a1 + 40);
    id v12 = v8;
    uint64_t v13 = v9;
    id v14 = v10;
    [v8 _createUserActivityDataWithOptions:0 completionHandler:v11];
  }
}

void sub_1000203F8(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = *(id *)(a1 + 32);
  if (v4)
  {
    id v6 = DRLogTarget();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100033BBC();
    }

    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  else
  {
    id v7 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  }
  v7();
}

id sub_100020FC8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) _animateOutVisibleItemsAndEndDragWithOperation:0 destination:0];
}

void sub_100020FD8(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = [*(id *)(a1 + 32) interactionWindow];
  if (!v4) {
    goto LABEL_4;
  }
  id v5 = (void *)v4;
  id v6 = [*(id *)(a1 + 32) sourceInteractionWindow];
  id v7 = [*(id *)(a1 + 32) interactionWindow];

  if (v6 == v7)
  {
LABEL_4:
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100021180;
    v15[3] = &unk_100055958;
    id v8 = *(void **)(a1 + 40);
    v15[4] = *(void *)(a1 + 32);
    id v16 = v8;
    uint64_t v9 = objc_retainBlock(v15);
    unsigned int v10 = [*(id *)(a1 + 32) sourceExpectsStagedLegacySelectors];
    id v11 = [*(id *)(a1 + 32) clientSource];
    id v12 = v11;
    if (v10)
    {
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1000212CC;
      v13[3] = &unk_100055980;
      id v14 = v9;
      [v12 checkCanHandOffCancelledItems:v3 withReply:v13];

      id v12 = v14;
    }
    else
    {
      [v11 canHandOffCancelledItems:v3 withReply:v9];
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

void sub_100021180(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v6 = [*(id *)(a1 + 32) delegate];
    objc_msgSend(v6, "dragSession:removeVisibleDroppedItemsInSpaceOfLayerContext:replyingOnQueue:with:");
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
}

id sub_100021248(uint64_t a1, void *a2, void *a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v7 = a2;
  id v8 = [v5 clientSource];
  [v8 handOffCancelledItems:v7 withFence:v6];

  uint64_t v9 = *(void **)(a1 + 32);
  return [v9 _endDragWithOperation:0 destination:0];
}

void sub_1000212CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v7 = (id)objc_opt_new();
  [v7 setContextID:a3];
  [v7 setRenderID:a4];
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_1000217D0(uint64_t a1)
{
  if ([*(id *)(a1 + 32) state] != (id)4) {
    sub_100033C54();
  }
  uint64_t v3 = *(void *)(a1 + 32);
  unsigned int v2 = *(void **)(a1 + 40);
  if (v2 != *(void **)(v3 + 184)) {
    sub_100033C28();
  }
  *(void *)(v3 + 184) = 0;

  uint64_t v4 = [*(id *)(a1 + 32) clientSource];
  [v4 dataTransferSessionFinished];

  id v5 = *(void **)(a1 + 32);
  return [v5 setState:6];
}

void sub_100021D48(uint64_t a1)
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  unsigned int v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "objectEnumerator", 0);
  id v3 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v14;
    do
    {
      id v6 = 0;
      do
      {
        if (*(void *)v14 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v13 + 1) + 8 * (void)v6);
        id v8 = [*(id *)(a1 + 32) delegate];
        uint64_t v9 = *(void *)(a1 + 32);
        unsigned int v10 = [v7 connection];
        LODWORD(v9) = objc_msgSend(v8, "dragSession:destinationIsOnenessConnection:", v9, objc_msgSend(v10, "processIdentifier"));

        if (v9)
        {
          id v11 = [v7 clientSession];
          [v11 updatedPresentation:*(void *)(a1 + 40)];
        }
        id v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v4);
  }

  uint64_t v12 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v12 + 96)) {
    [*(id *)(v12 + 272) updatedPresentation:*(void *)(a1 + 40)];
  }
}

id sub_100022234(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 216);
  *(void *)(v2 + 216) = 0;

  id v4 = *(void **)(a1 + 32);
  return [v4 _endDragByCancelling];
}

uint64_t sub_100022278(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_100033CE8();
  }

  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100022CF8(id a1)
{
  byte_100064770 = os_variant_has_internal_diagnostics();
}

uint64_t sub_100022D20()
{
  if (qword_100064778 != -1) {
    dispatch_once(&qword_100064778, &stru_1000559C0);
  }
  if ((byte_100064780 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"EnableWatchdog"];
    uint64_t v2 = v1;
    if (v1) {
      unsigned __int8 v3 = [v1 BOOLValue];
    }
    else {
      unsigned __int8 v3 = 1;
    }
    byte_100064781 = v3;
    byte_100064780 = 1;
  }
  return byte_100064781;
}

void sub_100022DD0(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_1000559E0);
}

void sub_100022E20(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100022E6C, @"com.apple.DragUI.EnableWatchdog", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100022E6C()
{
  byte_100064780 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100022EB4(id a1)
{
  byte_100064770 = os_variant_has_internal_diagnostics();
}

void sub_100022EDC(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055A40);
}

void sub_100022F2C(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100022F78, @"com.apple.DragUI.PerformDropTimeout", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100022F78()
{
  byte_100064790 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100022FC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100022FE8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100023004(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_1000236BC(uint64_t a1, void *a2, uint64_t a3)
{
  id v17 = a2;
  uint64_t v5 = [v17 position];
  if (([v17 isNewItem] & 1) != 0 || *(unsigned char *)(a1 + 64))
  {
    [v17 center];
    if (v7 == CGPointZero.x && v6 == CGPointZero.y)
    {
      [*(id *)(a1 + 32) _runWithoutRetargeting:v5];
      goto LABEL_18;
    }
    if ([v17 needsImmediateTracking])
    {
LABEL_8:
      [*(id *)(a1 + 32) _runAnimatableWithBarelyBouncyAnimation:v5];
      goto LABEL_18;
    }
    uint64_t v9 = [*(id *)(a1 + 40) itemLayouts];
    if ([v9 count])
    {
    }
    else
    {
      unsigned __int8 v11 = [v17 constrainSize];

      if ((v11 & 1) == 0) {
        goto LABEL_8;
      }
    }
    goto LABEL_17;
  }
  if ([v17 startingPreviewTransition])
  {
LABEL_17:
    [*(id *)(a1 + 32) _runAnimatableWithBouncyAnimation:v5];
    goto LABEL_18;
  }
  unint64_t v10 = *(void *)(a1 + 56) - a3;
  if (v10 && !*(unsigned char *)(a1 + 65)) {
    [*(id *)(a1 + 32) _runAnimatableWithOneToOneTracking:v5 response:(double)v10 * 0.031];
  }
  else {
    [*(id *)(a1 + 32) _runAnimatableWithOneToOneTracking:v5];
  }
LABEL_18:
  unsigned int v12 = [v17 isInPreviewTransition];
  long long v13 = v17;
  if (v12)
  {
    long long v14 = [v17 preview];
    if (v14) {
      [*(id *)(a1 + 32) _runAnimatableWithBouncyAnimation:v14];
    }

    long long v13 = v17;
  }
  if (![v13 isInPreviewTransition]
    || [*(id *)(a1 + 48) animatesFlockItemSizeAlongsidePreviewTransition])
  {
    long long v15 = *(void **)(a1 + 32);
    long long v16 = [v17 size];
    [v15 _runAnimatableWithBouncyAnimation:v16];
  }
}

void sub_100023E74(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [*(id *)(a1 + 32) animationBlock];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048577, v8, v5, v6, v7);
}

void sub_100024204(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [*(id *)(a1 + 32) animationBlock];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048577, v8, v5, v6, v7);
}

void sub_1000244E4(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [*(id *)(a1 + 32) animationBlock];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048577, v8, v5, v6, v7);
}

void sub_100024678(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

double sub_1000246A0()
{
  if (qword_1000647B0 != -1) {
    dispatch_once(&qword_1000647B0, &stru_100055AE8);
  }
  if ((byte_1000647B8 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"FlockBadgeResponse"];
    uint64_t v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      uint64_t v3 = 0x3FD6666666666666;
    }
    qword_1000647C0 = v3;
    byte_1000647B8 = 1;
  }
  return *(double *)&qword_1000647C0;
}

void sub_10002474C(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055B08);
}

void sub_10002479C(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000247E8, @"com.apple.DragUI.FlockBadgeResponse", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000247E8()
{
  byte_1000647B8 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100024830(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

double sub_100024858()
{
  if (qword_1000647C8 != -1) {
    dispatch_once(&qword_1000647C8, &stru_100055B48);
  }
  if ((byte_1000647D0 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"FlockTopStackResponse"];
    uint64_t v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      uint64_t v3 = 0x3F589374BC6A7EFALL;
    }
    qword_1000647D8 = v3;
    byte_1000647D0 = 1;
  }
  return *(double *)&qword_1000647D8;
}

void sub_100024904(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055B68);
}

void sub_100024954(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000249A0, @"com.apple.DragUI.FlockTopStackResponse", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000249A0()
{
  byte_1000647D0 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_1000249E8(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

double sub_100024A10()
{
  if (qword_1000647E0 != -1) {
    dispatch_once(&qword_1000647E0, &stru_100055BA8);
  }
  if ((byte_1000647E8 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"FlockTopStackDampingRatio"];
    uint64_t v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 1.0;
    }
    qword_1000647F0 = *(void *)&v3;
    byte_1000647E8 = 1;
  }
  return *(double *)&qword_1000647F0;
}

void sub_100024AB8(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055BC8);
}

void sub_100024B08(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100024B54, @"com.apple.DragUI.FlockTopStackDampingRatio", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100024B54()
{
  byte_1000647E8 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100024B9C(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

void sub_100024BC4(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055C28);
}

void sub_100024C14(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100024C60, @"com.apple.DragUI.FlockInitialTopStackDampingRatio", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100024C60()
{
  byte_100064800 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100024CA8(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

void sub_100024CD0(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055C88);
}

void sub_100024D20(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100024D6C, @"com.apple.DragUI.FlockInitialTopStackResponse", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100024D6C()
{
  byte_100064818 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100024DB4(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

double sub_100024DDC()
{
  if (qword_100064828 != -1) {
    dispatch_once(&qword_100064828, &stru_100055CC8);
  }
  if ((byte_100064830 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"FlockTopStackDampingRatioSmoothing"];
    uint64_t v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 1.0;
    }
    qword_100064838 = *(void *)&v3;
    byte_100064830 = 1;
  }
  return *(double *)&qword_100064838;
}

void sub_100024E84(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055CE8);
}

void sub_100024ED4(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100024F20, @"com.apple.DragUI.FlockTopStackDampingRatioSmoothing", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100024F20()
{
  byte_100064830 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100024F68(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

double sub_100024F90()
{
  if (qword_100064840 != -1) {
    dispatch_once(&qword_100064840, &stru_100055D28);
  }
  if ((byte_100064848 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"FlockTopStackResponseSmoothing"];
    uint64_t v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 1.0;
    }
    qword_100064850 = *(void *)&v3;
    byte_100064848 = 1;
  }
  return *(double *)&qword_100064850;
}

void sub_100025038(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055D48);
}

void sub_100025088(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000250D4, @"com.apple.DragUI.FlockTopStackResponseSmoothing", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000250D4()
{
  byte_100064848 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_10002511C(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

void sub_100025144(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055DA8);
}

void sub_100025194(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000251E0, @"com.apple.DragUI.FlockFirstItemDampingRatio", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000251E0()
{
  byte_100064860 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100025228(id a1)
{
  byte_1000647A8 = os_variant_has_internal_diagnostics();
}

void sub_100025250(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055E08);
}

void sub_1000252A0(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000252EC, @"com.apple.DragUI.FlockFirstItemResponse", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000252EC()
{
  byte_100064878 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100025BC4(void *a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  double v6 = v5;
  if (a1[6])
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100025E9C;
    v10[3] = &unk_100054C58;
    double v7 = (void *)a1[4];
    v10[4] = a1[5];
    id v11 = v5;
    [v7 addAnimations:v10];
    id v8 = v11;
  }
  else
  {
    uint64_t v9 = (void *)a1[4];
    if (a3)
    {
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100025DEC;
      v12[3] = &unk_100054B58;
      id v13 = v5;
      [v9 addAnimations:v12];
      id v8 = v13;
    }
    else
    {
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_100025D3C;
      _OWORD v14[3] = &unk_100054B58;
      id v15 = v5;
      [v9 addAnimations:v14];
      id v8 = v15;
    }
  }
}

void sub_100025D3C(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = +[_UIDragSetDownAnimation defaultSingleItemAnimationForPlatterView:*(void *)(a1 + 32)];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048577, v8, v5, v6, v7);
}

void sub_100025DEC(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = +[_UIDragSetDownAnimation defaultMultiItemAnimationForPlatterView:*(void *)(a1 + 32)];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048577, v8, v5, v6, v7);
}

void sub_100025E9C(uint64_t a1)
{
  CAFrameRateRange v10 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  float minimum = v10.minimum;
  float maximum = v10.maximum;
  float preferred = v10.preferred;
  id v8 = [(id)objc_opt_class() systemDropAnimationForView:*(void *)(a1 + 40)];
  *(float *)&double v5 = minimum;
  *(float *)&double v6 = maximum;
  *(float *)&double v7 = preferred;
  +[UIView _modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:](UIView, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:", 1048577, v8, v5, v6, v7);
}

void sub_100025F4C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 8) = 0;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "copy", 0);
  id v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v10;
    do
    {
      double v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v9 + 1) + 8 * (void)v6) + 16))();
        double v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      id v4 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v4);
  }

  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 16);
  *(void *)(v7 + 16) = 0;
}

void sub_1000269A8(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100027C34;
  v11[3] = &unk_100055F38;
  id v5 = v3;
  id v12 = v5;
  [v4 enumerateObjectsUsingBlock:v11];
  double v6 = [v5 subviews];
  uint64_t v7 = [v6 count];
  id v8 = [v4 count];
  int64_t v9 = v7 - v8;
  if (v7 > v8)
  {
    do
    {
      long long v10 = [v6 lastObject];
      [v10 removeFromSuperview];

      --v9;
    }
    while (v9);
  }
}

void sub_100026DFC(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_100026E14(uint64_t a1, void *a2, unsigned char *a3)
{
  id v20 = a2;
  id v5 = [v20 clientItemViewModelForClient:*(void *)(a1 + 32)];
  double v6 = v5;
  if (!v5) {
    goto LABEL_14;
  }
  if ([v5 imageDirty])
  {
    if ([v6 createImageRequest]) {
      objc_msgSend(*(id *)(a1 + 40), "addIndex:", objc_msgSend(v20, "itemIndex"));
    }
    uint64_t v7 = [v20 currentClient];
    BOOL v8 = v7 == *(void **)(a1 + 32);
  }
  else
  {
    BOOL v8 = 0;
  }
  if ([v6 imageDirty] && !v8) {
    goto LABEL_14;
  }
  long long v10 = [v6 imageComponent];

  if (!v10
    || (id v11 = *(id *)(a1 + 32),
        [v6 imageComponent],
        id v12 = objc_claimAutoreleasedReturnValue(),
        unsigned int v13 = [v12 hidesImage],
        v12,
        !v11))
  {
LABEL_14:
    id v15 = [v20 clientItemViewModelForClient:*(void *)(a1 + 48)];
    long long v16 = v15;
    if (v15)
    {
      if ([v15 imageDirty])
      {
        if ([v16 createImageRequest]) {
          objc_msgSend(*(id *)(a1 + 56), "addIndex:", objc_msgSend(v20, "itemIndex"));
        }
        id v11 = *(id *)(a1 + 48);
        int v14 = 1;
LABEL_21:

        if (!v11) {
          goto LABEL_28;
        }
        goto LABEL_22;
      }
      id v17 = [v16 imageComponent];

      if (v17)
      {
        id v11 = *(id *)(a1 + 48);
        uint64_t v18 = [v16 imageComponent];
        int v14 = [v18 hidesImage] ^ 1;

        goto LABEL_21;
      }
    }

    id v11 = 0;
    goto LABEL_28;
  }
  int v14 = v13 ^ 1;
LABEL_22:
  id v19 = [v20 currentClient];

  if (v19 != v11) {
    NSLog(@"client changed");
  }
  [v20 setCurrentClient:v11];
  if (v14)
  {
    if (++*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) >= 5uLL) {
      *a3 = 1;
    }
  }
LABEL_28:
}

void sub_10002705C(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", (char *)objc_msgSend(*(id *)(a1 + 32), "count") + ~a2);
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_1000270E0(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100027654(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100027680(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v2 = DRLogTarget();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
      sub_100033F78((uint64_t)WeakRetained, v2);
    }

    [WeakRetained _usePrecisionMode:WeakRetained[7]];
    id v3 = WeakRetained[7];
    WeakRetained[7] = 0;

    [WeakRetained[6] cancel];
    id v4 = WeakRetained[6];
    WeakRetained[6] = 0;
  }
}

BOOL sub_100027B08(id a1, _DUIPreviewAndImageComponent *a2, unint64_t a3, BOOL *a4)
{
  id v4 = [(_DUIPreviewAndImageComponent *)a2 imageComponent];
  BOOL v5 = [v4 slotID] == 0;

  return v5;
}

id sub_100027C34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _[*(id *)(a1 + 32) insertSubview:a2 atIndex:a3];
}

void sub_100027C44(id a1)
{
  byte_100064890 = os_variant_has_internal_diagnostics();
}

double sub_100027C6C()
{
  if (qword_100064898 != -1) {
    dispatch_once(&qword_100064898, &stru_100055F78);
  }
  if ((byte_1000648A0 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"PrecisionModeHeuristicDelay"];
    id v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      uint64_t v3 = 0x3FB1111111111111;
    }
    qword_1000648A8 = v3;
    byte_1000648A0 = 1;
  }
  return *(double *)&qword_1000648A8;
}

void sub_100027D18(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055F98);
}

void sub_100027D68(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100027DB4, @"com.apple.DragUI.PrecisionModeHeuristicDelay", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100027DB4()
{
  byte_1000648A0 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100027DFC(id a1)
{
  byte_100064890 = os_variant_has_internal_diagnostics();
}

double sub_100027E24()
{
  if (qword_1000648B0 != -1) {
    dispatch_once(&qword_1000648B0, &stru_100055FD8);
  }
  if ((byte_1000648B8 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"PrecisionModeHeuristicDistance"];
    id v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      double v3 = 5.0;
    }
    qword_1000648C0 = *(void *)&v3;
    byte_1000648B8 = 1;
  }
  return *(double *)&qword_1000648C0;
}

void sub_100027ECC(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100055FF8);
}

void sub_100027F1C(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100027F68, @"com.apple.DragUI.PrecisionModeHeuristicDistance", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100027F68()
{
  byte_1000648B8 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100027FB0(id a1)
{
  byte_100064890 = os_variant_has_internal_diagnostics();
}

double sub_100027FD8()
{
  if (qword_1000648C8 != -1) {
    dispatch_once(&qword_1000648C8, &stru_100056038);
  }
  if ((byte_1000648D0 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"PrecisionModeEnterHysteresis"];
    id v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      uint64_t v3 = 0x3FC999999999999ALL;
    }
    qword_1000648D8 = v3;
    byte_1000648D0 = 1;
  }
  return *(double *)&qword_1000648D8;
}

void sub_100028084(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_100056058);
}

void sub_1000280D4(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_100028120, @"com.apple.DragUI.PrecisionModeEnterHysteresis", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_100028120()
{
  byte_1000648D0 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

void sub_100028168(id a1)
{
  byte_100064890 = os_variant_has_internal_diagnostics();
}

double sub_100028190()
{
  if (qword_1000648E0 != -1) {
    dispatch_once(&qword_1000648E0, &stru_100056098);
  }
  if ((byte_1000648E8 & 1) == 0)
  {
    id v0 = sub_100028320();
    uint64_t v1 = [v0 objectForKey:@"PrecisionModeExitHysteresis"];
    id v2 = v1;
    if (v1) {
      [v1 doubleValue];
    }
    else {
      uint64_t v3 = 0x3FC999999999999ALL;
    }
    qword_1000648F0 = v3;
    byte_1000648E8 = 1;
  }
  return *(double *)&qword_1000648F0;
}

void sub_10002823C(id a1)
{
  uint64_t v1 = dispatch_get_global_queue(-32768, 0);
  dispatch_async(v1, &stru_1000560B8);
}

void sub_10002828C(id a1)
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1000282D8, @"com.apple.DragUI.PrecisionModeExitHysteresis", 0, CFNotificationSuspensionBehaviorCoalesce);
}

void sub_1000282D8()
{
  byte_1000648E8 = 0;
  sub_100028320();
  id v0 = (id)objc_claimAutoreleasedReturnValue();
  [v0 synchronize];
}

id sub_100028320()
{
  if (qword_100064900 != -1) {
    dispatch_once(&qword_100064900, &stru_1000560D8);
  }
  id v0 = (void *)qword_1000648F8;
  return v0;
}

void sub_100028374(id a1)
{
  id v1 = [objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.DragUI"];
  uint64_t v2 = qword_1000648F8;
  qword_1000648F8 = (uint64_t)v1;
  _objc_release_x1(v1, v2);
}

uint64_t sub_10002845C(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = qword_100064908;
  qword_100064908 = (uint64_t)v1;
  return _objc_release_x1(v1, v2);
}

void sub_1000285A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000285CC(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received MDM org changed notification", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained updateMDMName];
}

void sub_100029174(id a1)
{
  uint64_t v1 = objc_opt_new();
  uint64_t v2 = qword_100064918;
  qword_100064918 = v1;
  _objc_release_x1(v1, v2);
}

void sub_100029398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1000293BC(uint64_t a1, int a2)
{
  if (a2)
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained _cancelAllDragSessions];
  }
}

void sub_1000294BC(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 48) resume];
  [*(id *)(*(void *)(a1 + 32) + 56) resume];
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Listening for source and destination connections.", v3, 2u);
  }
}

void sub_100029B0C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  objc_destroyWeak((id *)(v4 - 64));
  _Unwind_Resume(a1);
}

void sub_100029B50(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Source connection interrupted from PID %d", (uint8_t *)v3, 8u);
  }

  [WeakRetained invalidate];
}

void sub_100029C10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  uint64_t v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Source connection invalidated from PID %d", buf, 8u);
  }

  if (WeakRetained && v3)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = objc_msgSend(v3[3], "copy", 0);
    id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      id v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v5);
          }
          long long v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          id v11 = [v10 sourceConnection];

          if (v11 == WeakRetained) {
            [v10 sourceConnectionWasInvalidated];
          }
        }
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
  }
}

void sub_10002A088(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 72));
  objc_destroyWeak((id *)(v4 - 64));
  _Unwind_Resume(a1);
}

void sub_10002A0CC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3[0] = 67109120;
    v3[1] = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Destination connection interrupted from PID %d", (uint8_t *)v3, 8u);
  }

  [WeakRetained invalidate];
}

void sub_10002A18C(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    *(_DWORD *)buf = 67109120;
    unsigned int v18 = [WeakRetained processIdentifier];
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Destination connection invalidated from PID %d", buf, 8u);
  }
  id v4 = objc_loadWeakRetained((id *)(a1 + 32));
  id v5 = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  id v6 = v5;
  if (v4 && v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = objc_msgSend(v5[3], "copy", 0);
    id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        id v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          [*(id *)(*((void *)&v12 + 1) + 8 * (void)v11) destinationConnectionWasInvalidated:v4];
          id v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

void sub_10002ADCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,id location)
{
  objc_destroyWeak(v63);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_10002AE08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v1 = [WeakRetained pointerWatchdogTimer];

  if (v1) {
    [WeakRetained _pointerBeganWatchdogFired];
  }
}

void sub_10002BCE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,id location)
{
  objc_destroyWeak(v56);
  objc_destroyWeak(v57);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v58 - 160));
  _Unwind_Resume(a1);
}

void sub_10002BD1C(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AX connection interrupted", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

void sub_10002BD9C(uint64_t a1)
{
  uint64_t v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "AX connection invalidated", v4, 2u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained invalidate];
}

id sub_10002BE1C(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 88);
  if (*(void *)(a1 + 40)) {
    uint64_t v2 = *(void **)(a1 + 40);
  }
  else {
    uint64_t v2 = &__NSArray0__struct;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  id v4 = [*(id *)(a1 + 56) routingPolicy];
  id v5 = objc_msgSend(v1, "detachTouchesWithTouchIdentifiers:session:routingPolicy:touchOffset:", v2, v3, v4, CGPointZero.x, CGPointZero.y);

  return v5;
}

void sub_10002BE94(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) itemCollection];
  uint64_t v3 = [v2 items];
  id v4 = [v3 count];

  id v5 = [*(id *)(a1 + 40) clientSource];
  [*(id *)(a1 + 32) _initialCentroid];
  uint64_t v7 = v6;
  uint64_t v9 = v8;
  uint64_t v11 = v10;
  [*(id *)(a1 + 32) initialCentroidInSourceWindow];
  uint64_t v13 = v12;
  uint64_t v15 = v14;
  uint64_t v17 = v16;
  unsigned int v18 = *(void **)(a1 + 48);
  id v19 = [*(id *)(a1 + 32) coordinateSpaceSourceLayerContext];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_10002C02C;
  v23[3] = &unk_1000561E0;
  int8x16_t v22 = *(int8x16_t *)(a1 + 40);
  id v20 = (id)v22.i64[0];
  int8x16_t v24 = vextq_s8(v22, v22, 8uLL);
  uint64_t v28 = v7;
  uint64_t v29 = v9;
  uint64_t v30 = v11;
  id v25 = v5;
  id v26 = *(id *)(a1 + 56);
  id v31 = v4;
  id v27 = *(id *)(a1 + 32);
  uint64_t v32 = v13;
  uint64_t v33 = v15;
  uint64_t v34 = v17;
  id v21 = v5;
  [v18 _getTransformForLayerContext:v19 completion:v23];
}

void sub_10002C02C(uint64_t a1, long long *a2)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [v4 sourceViewControllerForSession:*(void *)(a1 + 40)];

  if (v5)
  {
    long long v6 = a2[5];
    long long v28 = a2[4];
    long long v29 = v6;
    long long v7 = a2[7];
    long long v30 = a2[6];
    long long v31 = v7;
    long long v8 = a2[1];
    long long v24 = *a2;
    long long v25 = v8;
    long long v9 = a2[3];
    long long v26 = a2[2];
    long long v27 = v9;
    [v5 transformToLocalWindowForCoordinateSpaceTransformToDisplay:&v24];
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CAPointApplyTransform();
  double v12 = v10 / v11;
  double v14 = v13 / v11;
  uint64_t v15 = *(void *)(a1 + 40);
  uint64_t v16 = *(void *)(a1 + 48);
  uint64_t v17 = *(void *)(a1 + 96);
  uint64_t v18 = *(void *)(a1 + 56);
  double v20 = v19 / v11;
  id v21 = [*(id *)(a1 + 64) coordinateSpaceSourceLayerContext];
  id v22 = [v21 contextID];
  double v23 = [*(id *)(a1 + 64) preferredPreviewIndexes];
  objc_msgSend(v5, "addSession:withSourceClient:touchIDs:itemCount:centroid:sourceContextID:initialCentroidInSourceContext:preferredPreviewIndexes:", v15, v16, v18, v17, v22, v23, v12, v14, v20, *(double *)(a1 + 104), *(double *)(a1 + 112), *(double *)(a1 + 120));

  [*(id *)(a1 + 32) configurePortalViewsForDragSessionOriginatingFromViewController:v5];
}

void sub_10002C3D0(uint64_t a1)
{
}

void sub_10002CCAC(uint64_t a1, int a2)
{
  id v4 = [*(id *)(a1 + 32) outsideAppSourceOperationMask];
  id v5 = [*(id *)(a1 + 32) sourceConnection];
  unsigned int v6 = [v5 processIdentifier];
  int v7 = *(_DWORD *)(a1 + 56);

  if (v4) {
    BOOL v8 = 1;
  }
  else {
    BOOL v8 = v6 == v7;
  }
  char v9 = !v8;
  double v10 = DRLogTarget();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (!a2 || (v9 & 1) != 0)
  {
    if (v11)
    {
      int v18 = *(_DWORD *)(a1 + 56);
      int v19 = 67109888;
      int v20 = v18;
      __int16 v21 = 1024;
      *(_DWORD *)id v22 = a2;
      *(_WORD *)&v22[4] = 1024;
      *(_DWORD *)&v22[6] = v4 == 0;
      __int16 v23 = 1024;
      BOOL v24 = v6 != v7;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Replying to destination PID %d sawFirstDragEvent with no session: receivedMask %d, maskIsNone %d, isOtherApp %d", (uint8_t *)&v19, 0x1Au);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))(*(void *)(a1 + 48));
  }
  else
  {
    if (v11)
    {
      int v12 = *(_DWORD *)(a1 + 56);
      uint64_t v13 = *(void *)(a1 + 32);
      int v19 = 67109378;
      int v20 = v12;
      __int16 v21 = 2112;
      *(void *)id v22 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Replying to destination PID %d sawFirstDragEvent with session %@", (uint8_t *)&v19, 0x12u);
    }

    uint64_t v14 = [*(id *)(a1 + 32) originatedFromAccessibility];
    if ([*(id *)(a1 + 32) originatedFromPointer]) {
      v14 |= 2uLL;
    }
    uint64_t v15 = *(void *)(a1 + 48);
    uint64_t v16 = *(void **)(a1 + 32);
    uint64_t v17 = [v16 itemCollectionForDestination:*(void *)(a1 + 40)];
    (*(void (**)(uint64_t, void *, void *, id, uint64_t))(v15 + 16))(v15, v16, v17, [*(id *)(a1 + 32) outsideAppSourceOperationMask], v14);
  }
}

void sub_10002D428(uint64_t a1, long long *a2)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = *(void **)(a1 + 32);
  if (v4)
  {
    long long v5 = a2[5];
    long long v13 = a2[4];
    long long v14 = v5;
    long long v6 = a2[7];
    long long v15 = a2[6];
    long long v16 = v6;
    long long v7 = a2[1];
    long long v9 = *a2;
    long long v10 = v7;
    long long v8 = a2[3];
    long long v11 = a2[2];
    long long v12 = v8;
    [v4 transformToLocalWindowForCoordinateSpaceTransformToDisplay:&v9];
  }
  long long v13 = v21;
  long long v14 = v22;
  long long v15 = v23;
  long long v16 = v24;
  long long v9 = v17;
  long long v10 = v18;
  long long v11 = v19;
  long long v12 = v20;
  CA_CGPointApplyTransform();
  objc_msgSend(*(id *)(a1 + 40), "setOriginalCenter:");
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 48));
}

void sub_10002D4EC(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "viewModelForSessionID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  id v11 = v2;
  if (*(void *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "fenceForSession:withHandle:", objc_msgSend(*(id *)(a1 + 40), "identifier"), *(void *)(a1 + 48));
    uint64_t v2 = v11;
  }
  uint64_t v3 = [v2 clientModelForClient:*(void *)(a1 + 56)];
  [v11 takePreviewAndImageComponents:*(void *)(a1 + 64) forClient:v3];
  id v4 = [*(id *)(a1 + 72) delegate];
  long long v5 = [*(id *)(a1 + 32) view];
  long long v6 = [v5 window];
  long long v7 = [v4 virtualHIDServiceForWindow:v6];

  unsigned int v8 = [*(id *)(a1 + 40) originatedFromAccessibility];
  long long v9 = *(void **)(a1 + 40);
  if (v8)
  {
    [v11 initialAccessibilityCentroid];
    objc_msgSend(v9, "beginAccessibilityDragAtLocationIfNeeded:hidService:", v7);
  }
  else if ([*(id *)(a1 + 40) originatedFromPointer])
  {
    long long v10 = *(void **)(a1 + 40);
    [v11 centroid];
    objc_msgSend(v10, "beginPointerDragAtLocationIfNeeded:hidService:", v7);
  }
}

void sub_10002D700(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v5 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  uint64_t v3 = objc_msgSend(v5, "viewModelForSessionID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  id v4 = [v3 clientModelForClient:*(void *)(a1 + 48)];
  [v3 invalidateImageForClient:v4 itemIndex:*(void *)(a1 + 56)];
}

void sub_10002D84C(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v14 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  uint64_t v3 = objc_msgSend(v14, "viewModelForSessionID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  id v4 = [v3 itemModels];
  [v4 count];

  if (*(void *)(a1 + 48))
  {
    unint64_t v5 = 0;
    do
    {
      [v3 addItem];
      long long v6 = [*(id *)(a1 + 32) delegate];
      long long v7 = [v14 view];
      unsigned int v8 = [v7 window];
      long long v9 = [v6 virtualHIDServiceForWindow:v8];

      unsigned int v10 = [*(id *)(a1 + 40) originatedFromAccessibility];
      id v11 = *(void **)(a1 + 40);
      if (v10)
      {
        [v3 initialAccessibilityCentroid];
        objc_msgSend(v11, "beginAccessibilityDragAtLocationIfNeeded:hidService:", v9);
      }
      else if ([*(id *)(a1 + 40) originatedFromPointer])
      {
        long long v12 = *(void **)(a1 + 40);
        [v3 centroid];
        objc_msgSend(v12, "beginPointerDragAtLocationIfNeeded:hidService:", v9);
      }

      ++v5;
    }
    while (v5 < *(void *)(a1 + 48));
  }
  long long v13 = [v3 delegate];
  [v13 viewModelInvalidated:v3];
}

void sub_10002DABC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v5 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  uint64_t v3 = objc_msgSend(v5, "viewModelForSessionID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  id v4 = [v3 clientModelForClient:*(void *)(a1 + 48)];
  [v3 setPotentialDrop:*(void *)(a1 + 56)];
  [v3 setPotentialDropDestinationClient:v4];
}

void sub_10002DC08(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v9 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  uint64_t v3 = objc_msgSend(v9, "viewModelForSessionID:", objc_msgSend(*(id *)(a1 + 40), "identifier"));
  id v4 = objc_opt_new();
  [v3 setPotentialDrop:v4];

  id v5 = [v3 potentialDrop];
  [v5 setPrefersFullSizePreview:1];

  long long v6 = [v3 potentialDropDestinationClient];
  long long v7 = [v3 itemModels];
  if ([v7 count])
  {
    unint64_t v8 = 0;
    do
      [v3 invalidateImageForClient:v6 itemIndex:v8++];
    while (v8 < (unint64_t)[v7 count]);
  }
  [v3 setPotentialDropDestinationClient:0];
}

void sub_10002DF30(uint64_t a1, _OWORD *a2)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [v4 sourceViewControllerForSession:*(void *)(a1 + 40)];

  long long v6 = [*(id *)(a1 + 32) delegate];
  long long v7 = [v6 targetViewControllerForSession:*(void *)(a1 + 40)];

  unint64_t v8 = [v7 view];
  id v9 = [v8 _screen];

  long long v10 = *(_OWORD *)&CATransform3DIdentity.m33;
  *(_OWORD *)&v32.m31 = *(_OWORD *)&CATransform3DIdentity.m31;
  *(_OWORD *)&v32.m33 = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m43;
  *(_OWORD *)&v32.m41 = *(_OWORD *)&CATransform3DIdentity.m41;
  *(_OWORD *)&v32.m43 = v11;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m13;
  *(_OWORD *)&v32.m11 = *(_OWORD *)&CATransform3DIdentity.m11;
  *(_OWORD *)&v32.m13 = v12;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m23;
  *(_OWORD *)&v32.m21 = *(_OWORD *)&CATransform3DIdentity.m21;
  *(_OWORD *)&v32.m23 = v13;
  long long v14 = a2[5];
  *(_OWORD *)&v31.m31 = a2[4];
  *(_OWORD *)&v31.m33 = v14;
  long long v15 = a2[7];
  *(_OWORD *)&v31.m41 = a2[6];
  *(_OWORD *)&v31.m43 = v15;
  long long v16 = a2[1];
  *(_OWORD *)&v31.m11 = *a2;
  *(_OWORD *)&v31.m13 = v16;
  long long v17 = a2[3];
  *(_OWORD *)&v31.m21 = a2[2];
  *(_OWORD *)&v31.m23 = v17;
  if (!CATransform3DIsIdentity(&v31))
  {
    memset(&v31, 0, sizeof(v31));
    if (v7)
    {
      long long v18 = a2[5];
      *(_OWORD *)&v30.m31 = a2[4];
      *(_OWORD *)&v30.m33 = v18;
      long long v19 = a2[7];
      *(_OWORD *)&v30.m41 = a2[6];
      *(_OWORD *)&v30.m43 = v19;
      long long v20 = a2[1];
      *(_OWORD *)&v30.m11 = *a2;
      *(_OWORD *)&v30.m13 = v20;
      long long v21 = a2[3];
      *(_OWORD *)&v30.m21 = a2[2];
      *(_OWORD *)&v30.m23 = v21;
      [v7 transformToLocalWindowForCoordinateSpaceTransformToDisplay:&v30];
    }
    CATransform3D v30 = v31;
    CATransform3DInvert(&v32, &v30);
  }
  uint64_t v22 = *(unsigned int *)(a1 + 64);
  CATransform3D v31 = v32;
  long long v23 = [v5 visibleDroppedItemsForSession:v22 transform:&v31 targetScreen:v9];
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10002E170;
  v27[3] = &unk_1000562C8;
  long long v24 = *(NSObject **)(a1 + 48);
  id v25 = *(id *)(a1 + 56);
  id v28 = v23;
  id v29 = v25;
  id v26 = v23;
  dispatch_async(v24, v27);
}

uint64_t sub_10002E170(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

void sub_10002E290(uint64_t a1, _OWORD *a2)
{
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  id v4 = [*(id *)(a1 + 32) delegate];
  id v5 = [v4 sourceViewControllerForSession:*(void *)(a1 + 40)];

  long long v6 = [*(id *)(a1 + 32) delegate];
  long long v7 = [v6 targetViewControllerForSession:*(void *)(a1 + 40)];

  if ([*(id *)(a1 + 40) state] == (id)3) {
    unint64_t v8 = v5;
  }
  else {
    unint64_t v8 = v7;
  }
  id v9 = v8;
  long long v10 = [v9 view];
  long long v11 = [v10 _screen];

  long long v12 = 0uLL;
  memset(&v30, 0, sizeof(v30));
  if (v9)
  {
    long long v13 = a2[5];
    *(_OWORD *)&v29.m31 = a2[4];
    *(_OWORD *)&v29.m33 = v13;
    long long v14 = a2[7];
    *(_OWORD *)&v29.m41 = a2[6];
    *(_OWORD *)&v29.m43 = v14;
    long long v15 = a2[1];
    *(_OWORD *)&v29.m11 = *a2;
    *(_OWORD *)&v29.m13 = v15;
    long long v16 = a2[3];
    *(_OWORD *)&v29.m21 = a2[2];
    *(_OWORD *)&v29.m23 = v16;
    [v9 transformToLocalWindowForCoordinateSpaceTransformToDisplay:&v29];
    long long v12 = 0uLL;
  }
  CATransform3D v28 = v30;
  *(_OWORD *)&v29.m41 = v12;
  *(_OWORD *)&v29.m43 = v12;
  *(_OWORD *)&v29.m31 = v12;
  *(_OWORD *)&v29.m33 = v12;
  *(_OWORD *)&v29.m21 = v12;
  *(_OWORD *)&v29.m23 = v12;
  *(_OWORD *)&v29.m11 = v12;
  *(_OWORD *)&v29.m13 = v12;
  CATransform3DInvert(&v29, &v28);
  uint64_t v17 = *(unsigned int *)(a1 + 64);
  CATransform3D v28 = v29;
  long long v18 = [v5 visibleDroppedItemsForSession:v17 transform:&v28 targetScreen:v11];
  long long v19 = +[UIScene _synchronizedDrawingFence];
  [v5 removeSession:*(unsigned int *)(a1 + 64) immediately:1];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002E4F8;
  block[3] = &unk_100056318;
  long long v20 = *(NSObject **)(a1 + 48);
  id v21 = *(id *)(a1 + 56);
  id v26 = v19;
  id v27 = v21;
  id v25 = v18;
  id v22 = v19;
  id v23 = v18;
  dispatch_async(v20, block);
}

uint64_t sub_10002E4F8(void *a1)
{
  return (*(uint64_t (**)(void, void, void))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

void sub_10002E5CC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  objc_msgSend(v3, "moveSessionWithID:toLocation:", objc_msgSend(*(id *)(a1 + 40), "identifier"), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

void sub_10002E6FC(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  [v3 animateOutVisibleItemsForSession:*(unsigned int *)(a1 + 56) withOperation:*(void *)(a1 + 48)];
}

void sub_10002E810(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  [v3 removeSession:*(unsigned int *)(a1 + 48) immediately:0];
}

void sub_10002E950(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) delegate];
  id v3 = [v2 sourceViewControllerForSession:*(void *)(a1 + 40)];

  [v3 removeSession:*(unsigned int *)(a1 + 48) immediately:1];
  if (([v3 hasActiveDragSession] & 1) == 0) {
    [*(id *)(a1 + 32) teardownPortalViewsForDragSessionOriginatingFromViewController:v3];
  }
}

void sub_10002ECCC(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = DRLogTarget();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100034194();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session successfully set keyboard enabled", v5, 2u);
  }
}

void sub_10002ED70(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = DRLogTarget();
  id v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100034200();
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Session successfully set keyboard disabled", v5, 2u);
  }
}

void sub_10002F218(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    [v3 locationInView:*(void *)(a1 + 32)];
    id v5 = NSStringFromCGPoint(v11);
    *(_DWORD *)buf = 138412290;
    long long v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "trackedTouchesBegan: pointer touch at %@", buf, 0xCu);
  }
  uint64_t v6 = *(void *)(a1 + 40);
  long long v7 = *(NSObject **)(v6 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F344;
  block[3] = &unk_100054B58;
  void block[4] = v6;
  dispatch_async(v7, block);
}

void sub_10002F344(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelPointerBeganWatchdog];
  objc_msgSend(*(id *)(a1 + 32), "xpcQueue_pointerDragSessionForEvents");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 beganPointerDrag];
}

void sub_10002F39C(id a1, DRDragSession *a2, NSNumber *a3)
{
}

void sub_10002F50C(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "trackedTouchesMoved: pointer touch", buf, 2u);
  }

  id v5 = [*(id *)(a1 + 32) view];
  [v3 locationInView:v5];
  uint64_t v7 = v6;
  uint64_t v9 = v8;

  long long v10 = [*(id *)(a1 + 40) delegate];
  CGPoint v11 = [v10 virtualHIDServiceForWindow:*(void *)(a1 + 48)];

  uint64_t v12 = *(void *)(a1 + 40);
  long long v13 = *(NSObject **)(v12 + 40);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10002F654;
  v15[3] = &unk_100055470;
  uint64_t v17 = v7;
  uint64_t v18 = v9;
  v15[4] = v12;
  id v16 = v11;
  id v14 = v11;
  dispatch_async(v13, v15);
}

void sub_10002F654(uint64_t a1)
{
  [*(id *)(a1 + 32) _cancelPointerBeganWatchdog];
  objc_msgSend(*(id *)(a1 + 32), "xpcQueue_pointerDragSessionForEvents");
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "movePointerDragToPoint:hidService:", *(void *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), 0.0);
}

void sub_10002F6B8(id a1, DRDragSession *a2, NSNumber *a3)
{
}

void sub_10002FBE0(uint64_t a1)
{
  id v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "trackedTouchesEnded: pointer touch", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002FCA4;
  block[3] = &unk_100054B58;
  void block[4] = v3;
  dispatch_async(v4, block);
}

void sub_10002FCA4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "xpcQueue_pointerDragSessionForEvents");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 endPointerDrag];
}

void sub_10002FCE8(uint64_t a1)
{
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  id v26 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
  if (v26)
  {
    uint64_t v25 = *(void *)v36;
    do
    {
      id v2 = 0;
      do
      {
        if (*(void *)v36 != v25) {
          objc_enumerationMutation(obj);
        }
        uint64_t v3 = *(void **)(*((void *)&v35 + 1) + 8 * (void)v2);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v4 = *(id *)(a1 + 40);
        id v5 = [v4 countByEnumeratingWithState:&v31 objects:v40 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v32;
          do
          {
            uint64_t v8 = 0;
            do
            {
              if (*(void *)v32 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v31 + 1) + 8 * (void)v8);
              long long v10 = [v3 touchIDs];
              unsigned int v11 = [v10 containsObject:v9];

              if (v11)
              {
                uint64_t v12 = [*(id *)(a1 + 48) objectForKeyedSubscript:v9];
                long long v13 = [*(id *)(a1 + 56) objectForKeyedSubscript:v9];
                [v3 touchEndedWithID:v9 contextID:v12 pid:v13 likelyMovingOffscreen:0];
              }
              uint64_t v8 = (char *)v8 + 1;
            }
            while (v6 != v8);
            id v6 = [v4 countByEnumeratingWithState:&v31 objects:v40 count:16];
          }
          while (v6);
        }

        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v14 = *(id *)(a1 + 64);
        id v15 = [v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
        if (v15)
        {
          id v16 = v15;
          uint64_t v17 = *(void *)v28;
          do
          {
            uint64_t v18 = 0;
            do
            {
              if (*(void *)v28 != v17) {
                objc_enumerationMutation(v14);
              }
              uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * (void)v18);
              long long v20 = [v3 touchIDs];
              unsigned int v21 = [v20 containsObject:v19];

              if (v21)
              {
                id v22 = [*(id *)(a1 + 48) objectForKeyedSubscript:v19];
                id v23 = [*(id *)(a1 + 56) objectForKeyedSubscript:v19];
                [v3 touchEndedWithID:v19 contextID:v22 pid:v23 likelyMovingOffscreen:1];
              }
              uint64_t v18 = (char *)v18 + 1;
            }
            while (v16 != v18);
            id v16 = [v14 countByEnumeratingWithState:&v27 objects:v39 count:16];
          }
          while (v16);
        }

        id v2 = (char *)v2 + 1;
      }
      while (v2 != v26);
      id v26 = [obj countByEnumeratingWithState:&v35 objects:v41 count:16];
    }
    while (v26);
  }
}

void sub_10003031C(uint64_t a1)
{
  id v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "trackedTouchesCancelled: pointer touch", buf, 2u);
  }

  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = *(NSObject **)(v3 + 40);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000303E0;
  block[3] = &unk_100054B58;
  void block[4] = v3;
  dispatch_async(v4, block);
}

void sub_1000303E0(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "xpcQueue_pointerDragSessionForEvents");
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 cancelPointerDrag];
}

void sub_100030424(uint64_t a1)
{
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  id v1 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v1)
  {
    id v2 = v1;
    uint64_t v14 = *(void *)v21;
    do
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(obj);
        }
        id v4 = *(void **)(*((void *)&v20 + 1) + 8 * (void)v3);
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        id v5 = *(id *)(a1 + 40);
        id v6 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = *(void *)v17;
          do
          {
            uint64_t v9 = 0;
            do
            {
              if (*(void *)v17 != v8) {
                objc_enumerationMutation(v5);
              }
              uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v9);
              unsigned int v11 = [v4 touchIDs];
              unsigned int v12 = [v11 containsObject:v10];

              if (v12) {
                [v4 touchCancelledWithID:v10];
              }
              uint64_t v9 = (char *)v9 + 1;
            }
            while (v7 != v9);
            id v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
          }
          while (v7);
        }

        uint64_t v3 = (char *)v3 + 1;
      }
      while (v3 != v2);
      id v2 = [obj countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v2);
  }
}

void sub_100030660(uint64_t a1)
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v6 = 0u;
  long long v7 = 0u;
  id v1 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 24), "copy", 0);
  id v2 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
  if (v2)
  {
    id v3 = v2;
    uint64_t v4 = *(void *)v7;
    do
    {
      id v5 = 0;
      do
      {
        if (*(void *)v7 != v4) {
          objc_enumerationMutation(v1);
        }
        [*(id *)(*((void *)&v6 + 1) + 8 * (void)v5) cancelDrag];
        id v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      id v3 = [v1 countByEnumeratingWithState:&v6 objects:v10 count:16];
    }
    while (v3);
  }
}

void sub_100030934(uint64_t a1)
{
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id obj = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  id v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v14)
  {
    uint64_t v13 = *(void *)v20;
    do
    {
      id v2 = 0;
      do
      {
        if (*(void *)v20 != v13) {
          objc_enumerationMutation(obj);
        }
        id v3 = *(void **)(*((void *)&v19 + 1) + 8 * (void)v2);
        long long v15 = 0u;
        long long v16 = 0u;
        long long v17 = 0u;
        long long v18 = 0u;
        id v4 = *(id *)(a1 + 40);
        id v5 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
        if (v5)
        {
          id v6 = v5;
          uint64_t v7 = *(void *)v16;
          do
          {
            long long v8 = 0;
            do
            {
              if (*(void *)v16 != v7) {
                objc_enumerationMutation(v4);
              }
              uint64_t v9 = *(void *)(*((void *)&v15 + 1) + 8 * (void)v8);
              uint64_t v10 = [v3 touchIDs];
              unsigned int v11 = [v10 containsObject:v9];

              if (v11) {
                (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
              }
              long long v8 = (char *)v8 + 1;
            }
            while (v6 != v8);
            id v6 = [v4 countByEnumeratingWithState:&v15 objects:v23 count:16];
          }
          while (v6);
        }

        id v2 = (char *)v2 + 1;
      }
      while (v2 != v14);
      id v14 = [obj countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v14);
  }
}

void sub_100030FC0(uint64_t a1)
{
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v2 = [*(id *)(*(void *)(a1 + 32) + 24) copy];
  id v3 = [v2 countByEnumeratingWithState:&v33 objects:v42 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v34;
    CGFloat y = CGPointZero.y;
    *(void *)&long long v4 = 138412546;
    long long v30 = v4;
    uint64_t v31 = *(void *)v34;
    id v32 = v2;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v34 != v6) {
          objc_enumerationMutation(v2);
        }
        uint64_t v9 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        uint64_t v10 = objc_msgSend(v9, "identifier", v30);
        if ([*(id *)(a1 + 40) containsIndex:v10])
        {
          unsigned int v11 = *(void **)(a1 + 48);
          unsigned int v12 = +[NSNumber numberWithUnsignedInt:v10];
          uint64_t v13 = [v11 objectForKey:v12];

          if ((unint64_t)[v13 touchesCount] <= 1
            && ([v13 canAddManipulatedTouch] & 1) == 0)
          {
            id v14 = *(void **)(a1 + 56);
            long long v15 = +[NSNumber numberWithUnsignedInt:v10];
            long long v16 = [v14 objectForKey:v15];

            long long v17 = [v13 precisionMode];
            double x = CGPointZero.x;
            double v19 = y;
            if (v17)
            {
              long long v20 = [v13 precisionMode];
              [v20 touchOffset];
              double x = v21;
              double v19 = v22;
            }
            long long v23 = DRLogTarget();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v30;
              __int16 v39 = v16;
              __int16 v40 = 2048;
              uint64_t v41 = v10;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Detaching touch ID %@ for session %lu", buf, 0x16u);
            }

            [v9 setInteractionWindow:*(void *)(a1 + 64)];
            long long v24 = *(void **)(*(void *)(a1 + 32) + 88);
            long long v37 = v16;
            uint64_t v25 = +[NSArray arrayWithObjects:&v37 count:1];
            id v26 = [v9 routingPolicy];
            LODWORD(v24) = objc_msgSend(v24, "detachTouchesWithTouchIdentifiers:session:routingPolicy:touchOffset:", v25, v9, v26, x, v19);

            if (v24)
            {
              [v9 addTouchID:v16];
              if ([v13 usesSynthesizedTouch])
              {
                long long v27 = [*(id *)(a1 + 64) windowScene];
                long long v28 = sub_100005F80(v27);

                [v9 setInteractionWindow:*(void *)(a1 + 64)];
                [v9 setDisplayIdentifierForSynthesizedTouch:v28];
                [v13 setDisplayIdentifierForSynthesizedTouch:v28];
              }
              else
              {
                [v13 addTouchID:v16];
              }
              id v2 = v32;
              objc_msgSend(*(id *)(a1 + 32), "xpcQueue_validateTouchStreamForDragSession:", v9);
            }
            else
            {
              long long v29 = DRLogTarget();
              id v2 = v32;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = v30;
                __int16 v39 = v16;
                __int16 v40 = 2048;
                uint64_t v41 = v10;
                _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "FAILED to detach touch ID %@ for session %lu", buf, 0x16u);
              }
            }
            uint64_t v6 = v31;
          }
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v33 objects:v42 count:16];
    }
    while (v5);
  }
}

void sub_100031658(uint64_t a1)
{
  memset(&v10, 0, sizeof(v10));
  id v2 = +[BKSTouchEventService sharedInstance];
  id v3 = v2;
  if (v2) {
    [v2 transformForDisplayUUID:*(void *)(a1 + 32) layerID:*(void *)(a1 + 48) contextID:*(unsigned int *)(a1 + 56)];
  }
  else {
    memset(&v10, 0, sizeof(v10));
  }

  CATransform3D v9 = v10;
  if (CATransform3DIsIdentity(&v9))
  {
    long long v4 = DRLogTarget();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100034304(v4);
    }
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000317DC;
  block[3] = &unk_100056468;
  id v5 = *(id *)(a1 + 40);
  CATransform3D v8 = v10;
  id v7 = v5;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

uint64_t sub_1000317DC(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  id v2 = *(uint64_t (**)(uint64_t, _OWORD *))(v1 + 16);
  long long v3 = *(_OWORD *)(a1 + 120);
  v8[4] = *(_OWORD *)(a1 + 104);
  v8[5] = v3;
  long long v4 = *(_OWORD *)(a1 + 152);
  v8[6] = *(_OWORD *)(a1 + 136);
  v8[7] = v4;
  long long v5 = *(_OWORD *)(a1 + 56);
  v8[0] = *(_OWORD *)(a1 + 40);
  v8[1] = v5;
  long long v6 = *(_OWORD *)(a1 + 88);
  v8[2] = *(_OWORD *)(a1 + 72);
  _OWORD v8[3] = v6;
  return v2(v1, v8);
}

uint64_t sub_100031840(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8 = *(void *)(a1 + 32);
  CATransform3D v9 = *(uint64_t (**)(uint64_t, _OWORD *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
  long long v10 = *(_OWORD *)&CATransform3DIdentity.m33;
  v15[4] = *(_OWORD *)&CATransform3DIdentity.m31;
  void v15[5] = v10;
  long long v11 = *(_OWORD *)&CATransform3DIdentity.m43;
  v15[6] = *(_OWORD *)&CATransform3DIdentity.m41;
  v15[7] = v11;
  long long v12 = *(_OWORD *)&CATransform3DIdentity.m13;
  v15[0] = *(_OWORD *)&CATransform3DIdentity.m11;
  v15[1] = v12;
  long long v13 = *(_OWORD *)&CATransform3DIdentity.m23;
  v15[2] = *(_OWORD *)&CATransform3DIdentity.m21;
  v15[3] = v13;
  return v9(v8, v15, a3, a4, a5, a6, a7, a8);
}

void sub_100031B50(uint64_t a1)
{
  id v2 = +[NSDictionary dictionaryWithObject:kCFBooleanTrue forKey:@"ExtendedDeviceLockState"];
  int v3 = MKBGetDeviceLockState();
  int v5 = v3 == 6 || (v3 - 1) < 2;

  uint64_t v6 = *(void *)(a1 + 32);
  if (*(unsigned __int8 *)(v6 + 24) != v5)
  {
    *(unsigned char *)(v6 + 24) = v5;
    id v7 = *(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 16) + 16);
    v7();
  }
}

void sub_100031E24(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_100031E44(uint64_t a1)
{
  return [*(id *)(a1 + 32) invalidate];
}

id sub_100031E4C(uint64_t a1)
{
  id v2 = DRLogTarget();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR)) {
    sub_10003438C(v2);
  }

  id result = objc_loadWeakRetained((id *)(a1 + 32));
  if (result)
  {
    [result setConnection:0];
    long long v4 = DRLogTarget();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_100034348(v4);
    }

    exit(1);
  }
  return result;
}

void sub_1000320A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "DRSystemConnection got error %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

void sub_100032164(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    [*(id *)(a1 + 32) updateRoutingPolicy:v3];
    long long v4 = DRLogTarget();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "DRSystemConnection received system routing policy (%@)", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_100032394(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v4 = DRLogTarget();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    int v5 = 138412290;
    id v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "DRSystemConnection got error %@", (uint8_t *)&v5, 0xCu);
  }

  [*(id *)(*(void *)(a1 + 32) + 8) invalidate];
}

char *sub_100032480(unint64_t a1)
{
  if (a1 >> 62) {
    goto LABEL_15;
  }
  uint64_t v2 = *(void *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (!v2) {
      return (char *)&_swiftEmptyArrayStorage;
    }
    id result = sub_100032C5C(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0) {
      break;
    }
    uint64_t v4 = 0;
    while (v2 != v4)
    {
      if ((a1 & 0xC000000000000001) != 0) {
        id v5 = (id)specialized _ArrayBuffer._getElementSlowPath(_:)();
      }
      else {
        id v5 = *(id *)(a1 + 8 * v4 + 32);
      }
      id v6 = v5;
      unsigned int v7 = [v5 unsignedIntValue];

      unint64_t v9 = *((void *)&_swiftEmptyArrayStorage + 2);
      unint64_t v8 = *((void *)&_swiftEmptyArrayStorage + 3);
      if (v9 >= v8 >> 1) {
        sub_100032C5C((char *)(v8 > 1), v9 + 1, 1);
      }
      ++v4;
      *((void *)&_swiftEmptyArrayStorage + 2) = v9 + 1;
      *((_DWORD *)&_swiftEmptyArrayStorage + v9 + 8) = v7;
      if (v2 == v4) {
        return (char *)&_swiftEmptyArrayStorage;
      }
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    uint64_t v2 = _CocoaArrayWrapper.endIndex.getter();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id sub_1000325E4(void *a1)
{
  sub_1000329A8(a1);
  uint64_t v3 = v2;
  id v4 = [objc_allocWithZone((Class)BKSHIDTouchRoutingPolicy) init];
  uint64_t v5 = *(void *)(v3 + 16);
  if (v5)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v6 = 0;
    do
    {
      uint64_t v7 = v6 + 1;
      [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:*(unsigned int *)(v3 + 4 * v6 + 32)];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      uint64_t v6 = v7;
    }
    while (v5 != v7);
  }
  swift_bridgeObjectRelease();
  sub_100032BD8();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [v4 setContextIDsToAlwaysSendTouches:isa];

  Class v9 = (Class)[v1 contextIDsToExcludeFromHitTesting];
  if (!v9)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    Class v9 = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  [v4 setContextIDsToExcludeFromHitTesting:v9];

  objc_msgSend(v4, "setAvoidHitTesting:", objc_msgSend(v1, "isHitTestingDisabled"));
  return v4;
}

id sub_100032950()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DRTouchDetacher();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DRTouchDetacher()
{
  return self;
}

void sub_1000329A8(void *a1)
{
  id v3 = [v1 contextIDsToAlwaysSendTouchesByDisplayIdentifier];
  sub_100032C18(&qword_1000645D8);
  uint64_t v4 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  uint64_t v5 = *(void *)(v4 + 16);
  swift_bridgeObjectRelease();
  if (!v5) {
    return;
  }
  id v6 = [a1 interactionWindow];
  if (!v6)
  {
    id v6 = [a1 sourceInteractionWindow];
    if (!v6) {
      return;
    }
  }
  id v7 = [v6 _screen];
  if (!v7)
  {
    __break(1u);
    goto LABEL_14;
  }
  unint64_t v8 = v7;
  id v9 = [v7 displayConfiguration];

  if (!v9)
  {
LABEL_14:
    __break(1u);
    return;
  }
  id v10 = [v9 hardwareIdentifier];

  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  if (v10) {

  }
  id v14 = [v1 contextIDsToAlwaysSendTouchesByDisplayIdentifier];
  uint64_t v15 = static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();

  if (*(void *)(v15 + 16) && (unint64_t v16 = sub_100032D78(v11, v13), (v17 & 1) != 0))
  {
    unint64_t v18 = *(void *)(*(void *)(v15 + 56) + 8 * v16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_100032480(v18);

    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
}

unint64_t sub_100032BD8()
{
  unint64_t result = qword_1000645D0;
  if (!qword_1000645D0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1000645D0);
  }
  return result;
}

uint64_t sub_100032C18(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

char *sub_100032C5C(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_100032C7C(a1, a2, a3, *v3);
  *id v3 = result;
  return result;
}

char *sub_100032C7C(char *result, int64_t a2, char a3, char *a4)
{
  char v5 = (char)result;
  if (a3)
  {
    unint64_t v6 = *((void *)a4 + 3);
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      int64_t v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v7 = a2;
      }
    }
  }
  else
  {
    int64_t v7 = a2;
  }
  uint64_t v8 = *((void *)a4 + 2);
  if (v7 <= v8) {
    uint64_t v9 = *((void *)a4 + 2);
  }
  else {
    uint64_t v9 = v7;
  }
  if (v9)
  {
    sub_100032C18(&qword_1000645E0);
    id v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 29;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 2);
  }
  else
  {
    id v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  id v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[4 * v8]) {
      memmove(v13, v14, 4 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 4 * v8);
  }
  swift_release();
  return v10;
}

unint64_t sub_100032D78(uint64_t a1, uint64_t a2)
{
  Hasher.init(_seed:)();
  String.hash(into:)();
  Swift::Int v4 = Hasher._finalize()();
  return sub_100032DF4(a1, a2, v4);
}

unint64_t sub_100032DF4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    id v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        uint64_t v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (_stringCompareWithSmolCheck(_:_:expecting:)() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_100032ED8(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 16);
  if (v3)
  {
    specialized ContiguousArray.reserveCapacity(_:)();
    uint64_t v5 = (unsigned int *)(a1 + 32);
    do
    {
      unsigned int v6 = *v5++;
      [objc_allocWithZone((Class)NSNumber) initWithUnsignedInt:v6];
      specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
      specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
      specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
      specialized ContiguousArray._endMutation()();
      --v3;
    }
    while (v3);
  }
  sub_100032BD8();
  Class isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();
  [a2 identifier];
  id v8 = sub_1000325E4(a2);
  uint64_t v9 = BKSHIDEventDigitizerDetachTouches();

  return v9;
}

void sub_10003302C()
{
  __assert_rtn("isPIDBeingDebugged", "DRUtilities.m", 57, "junk == 0");
}

void sub_100033058(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138543362;
  uint64_t v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "WARNING: Using process name %{public}@ as bundle ID.", (uint8_t *)&v3, 0xCu);
}

void sub_1000330D4()
{
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "DRDragMonitorConnection for %@ got error %@");
}

void sub_100033144(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not obtain layout for paste announcement: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_1000331BC(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Could not post paste announcement: %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_100033234(id *a1)
{
  unsigned int v6 = [*a1 fileURL];
  sub_10000F63C();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0xCu);
}

void sub_1000332C8(id *a1)
{
  os_log_t v1 = [*a1 url];
  os_log_t v2 = __error();
  strerror(*v2);
  sub_10000F63C();
  _os_log_error_impl(v3, v4, v5, v6, v7, 0x20u);
}

void sub_100033390(uint64_t a1)
{
  unsigned int v6 = [*(id *)(a1 + 32) url];
  sub_10000F63C();
  _os_log_error_impl(v1, v2, v3, v4, v5, 0x16u);
}

void sub_10003343C(void *a1, NSObject *a2)
{
  [a1 originatorDataOwner];
  os_log_type_t v3 = _UIDataOwnerDescription();
  int v4 = 138412290;
  os_log_type_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Setting source data ownership: %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000334D8()
{
}

void sub_100033504()
{
  sub_100022FDC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Failed to create session: not enough information", v1, 2u);
}

void sub_100033544()
{
  sub_100022FDC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Failed to create session: AX connection is not valid", v1, 2u);
}

void sub_100033584(uint64_t a1, unint64_t *a2, NSObject *a3)
{
  os_log_type_t v5 = sub_10001AE78(*a2);
  int v6 = 134218242;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  uint64_t v9 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "Session %p: Deallocated in non-terminal state %@", (uint8_t *)&v6, 0x16u);
}

void sub_100033638(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000336A4()
{
  sub_100022FDC();
  sub_100022FC0((void *)&_mh_execute_header, v0, v1, "Session addDestination: failing, connection is nil", v2, v3, v4, v5, v6);
}

void sub_1000336D8()
{
  sub_100022FDC();
  sub_100022FC0((void *)&_mh_execute_header, v0, v1, "Session addDestination: failing, connection already has a destination", v2, v3, v4, v5, v6);
}

void sub_10003370C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
    a5,
    a6,
    a7,
    a8,
    2u);
}

void sub_100033778()
{
  sub_100022FDC();
  sub_100022FC0((void *)&_mh_execute_header, v0, v1, "Session tried to perform a drop but we were in the wrong state. Ignoring.", v2, v3, v4, v5, v6);
}

void sub_1000337AC(void *a1, int *a2, NSObject *a3)
{
  unsigned int v5 = [a1 processIdentifier];
  int v6 = *a2;
  v7[0] = 67109376;
  v7[1] = v5;
  __int16 v8 = 1024;
  int v9 = v6;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Destination requesting drop with PID %d is different than the PID that saw the last touch up %d. Cancelling the drag.", (uint8_t *)v7, 0xEu);
}

void sub_100033850(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000338BC()
{
  sub_100023004(__stack_chk_guard);
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "Session %@: received error instead of reply from destination when performing drop: %@");
}

void sub_100033924()
{
  sub_100023010();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "System session %@ - Requested item index (%lu) does not exist");
}

void sub_10003398C(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 40);
  uint64_t v3 = *(void *)(a1 + 56);
  int v4 = 138412546;
  uint64_t v5 = v2;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "System session %@ - Requested item index (%lu) is not representable as a URL, was it marked as open-in-place?", (uint8_t *)&v4, 0x16u);
}

void sub_100033A18()
{
  sub_100023004(__stack_chk_guard);
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "System session %@ - Received error attempting to load item %@");
}

void sub_100033A80()
{
  sub_100023004(__stack_chk_guard);
  sub_100022FE8((void *)&_mh_execute_header, v0, v1, "System session %@ - Unable to open file in place", v2, v3, v4, v5, 2u);
}

void sub_100033AEC()
{
  sub_100023004(__stack_chk_guard);
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "System session %@ - Received error attempting to load file representation for item %@");
}

void sub_100033B54()
{
  sub_100023004(__stack_chk_guard);
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "System session %@ - Received error attempting to load user activity %@");
}

void sub_100033BBC()
{
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "System session %@ - Received error attempting to serialize user activity %@");
}

void sub_100033C28()
{
  __assert_rtn("-[DRDragSession dataTransferSessionFinished:]_block_invoke", "DRDragSession.m", 1850, "session == _pendingDataTransferSession");
}

void sub_100033C54()
{
  __assert_rtn("-[DRDragSession dataTransferSessionFinished:]_block_invoke", "DRDragSession.m", 1849, "self.state == DRDragSessionStateEnding");
}

void sub_100033C80()
{
  sub_100022FDC();
  sub_100022FC0((void *)&_mh_execute_header, v0, v1, "Could not create timer to wait for pending destination end; cancelling drag",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100033CB4()
{
  sub_100022FDC();
  sub_100022FC0((void *)&_mh_execute_header, v0, v1, "Last touch already ended; ignoring", v2, v3, v4, v5, v6);
}

void sub_100033CE8()
{
  sub_100023004(__stack_chk_guard);
  int v1 = *(unsigned __int8 *)(v0 + 208);
  LODWORD(v0) = *(unsigned __int8 *)(v0 + 202);
  v3[0] = 67109376;
  v3[1] = v1;
  __int16 v4 = 1024;
  int v5 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "Destination (%d) and/or touch delivery observation (%d) did not end in a reasonable amount of time; cancelling drag.",
    (uint8_t *)v3,
    0xEu);
}

void sub_100033D74()
{
  sub_100022FDC();
  sub_100022FC0((void *)&_mh_execute_header, v0, v1, "Already received end from destination; ignoring",
    v2,
    v3,
    v4,
    v5,
    v6);
}

void sub_100033DA8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode from %@ to %@, no change, removing pending timer", (uint8_t *)&v3, 0x16u);
}

void sub_100033E30(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 64);
  int v3 = 134217984;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode set _precisionModeLimitY to %g", (uint8_t *)&v3, 0xCu);
}

void sub_100033EAC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode activating new hysteresis timer", v1, 2u);
}

void sub_100033EF0(os_log_t log, double a2, double a3)
{
  int v3 = 134218240;
  double v4 = a2;
  __int16 v5 = 2048;
  double v6 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode entered and exiting since %g secs, y change is %g", (uint8_t *)&v3, 0x16u);
}

void sub_100033F78(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(a1 + 56);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "_updatePrecisionMode fired, changing to mode %@", (uint8_t *)&v3, 0xCu);
}

void sub_100033FF4(uint64_t *a1, NSObject *a2, double a3)
{
  uint64_t v3 = *a1;
  int v4 = 134218240;
  double v5 = a3;
  __int16 v6 = 2048;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "_usePrecisionModel ignored request to use precision mode because currentY %g is <= limit %g", (uint8_t *)&v4, 0x16u);
}

void sub_10003407C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Session %@: pointer began watchdog fired, cancelling", (uint8_t *)&v2, 0xCu);
}

void sub_1000340F4(uint64_t a1, int a2, NSObject *a3)
{
  unsigned int v5 = [*(id *)(a1 + 64) systemProcessIdentifier];
  v6[0] = 67109376;
  v6[1] = a2;
  __int16 v7 = 1024;
  unsigned int v8 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Destination PID (%d) claims to be policy driven, but is not the system connection PID (%d)", (uint8_t *)v6, 0xEu);
}

void sub_100034194()
{
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "Session %@ failed to set keyboard enabled: %@");
}

void sub_100034200()
{
  sub_100009838();
  sub_100009850((void *)&_mh_execute_header, v0, v1, "Session %@ failed to set keyboard disabled: %@");
}

void sub_10003426C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 systemShellHostingSpaceIdentifier];
  int v4 = 138412290;
  unsigned int v5 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to locate a display correspending to system shell hosting space identifier %@", (uint8_t *)&v4, 0xCu);
}

void sub_100034304(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get non-identity transform for context+layer", v1, 2u);
}

void sub_100034348(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Exiting so we can reconnect with the system app", v1, 2u);
}

void sub_10003438C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "DRSystemConnection was invalidated", v1, 2u);
}

uint64_t static Dictionary._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t static String._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t String.hash(into:)()
{
  return String.hash(into:)();
}

NSArray __swiftcall Array._bridgeToObjectiveC()()
{
  return (NSArray)Array._bridgeToObjectiveC()();
}

uint64_t static Array._unconditionallyBridgeFromObjectiveC(_:)()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t specialized _ArrayBuffer._getElementSlowPath(_:)()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()()
{
  return specialized ContiguousArray._makeUniqueAndReserveCapacityIfNotUnique()();
}

uint64_t specialized ContiguousArray._endMutation()()
{
  return specialized ContiguousArray._endMutation()();
}

uint64_t specialized ContiguousArray.reserveCapacity(_:)()
{
  return specialized ContiguousArray.reserveCapacity(_:)();
}

uint64_t specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)()
{
  return specialized ContiguousArray._reserveCapacityAssumingUniqueBuffer(oldCount:)();
}

uint64_t specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)()
{
  return specialized ContiguousArray._appendElementAssumeUniqueAndCapacity(_:newElement:)();
}

uint64_t _CocoaArrayWrapper.endIndex.getter()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t _stringCompareWithSmolCheck(_:_:expecting:)()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t Hasher.init(_seed:)()
{
  return Hasher.init(_seed:)();
}

Swift::Int __swiftcall Hasher._finalize()()
{
  return Hasher._finalize()();
}

uint64_t BKSHIDEventDigitizerDetachTouches()
{
  return _BKSHIDEventDigitizerDetachTouches();
}

uint64_t BKSHIDEventDigitizerSetTouchRoutingPolicy()
{
  return _BKSHIDEventDigitizerSetTouchRoutingPolicy();
}

uint64_t BKSHIDServicesCancelTouchesWithIdentifiers()
{
  return _BKSHIDServicesCancelTouchesWithIdentifiers();
}

uint64_t BSDispatchQueueCreateWithFixedPriority()
{
  return _BSDispatchQueueCreateWithFixedPriority();
}

uint64_t BSFloatEqualToFloat()
{
  return _BSFloatEqualToFloat();
}

uint64_t BSPthreadSetFixedPriority()
{
  return _BSPthreadSetFixedPriority();
}

uint64_t BSSetMainThreadPriorityFixedForUI()
{
  return _BSSetMainThreadPriorityFixedForUI();
}

CFTimeInterval CACurrentMediaTime(void)
{
  return _CACurrentMediaTime();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  return _CAFrameRateRangeMake(minimum, maximum, preferred);
}

uint64_t CAPoint3DEqualToPoint()
{
  return _CAPoint3DEqualToPoint();
}

uint64_t CAPointApplyTransform()
{
  return _CAPointApplyTransform();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return _CATransform3DConcat(retstr, a, b);
}

uint64_t CATransform3DGetDecomposition_()
{
  return _CATransform3DGetDecomposition_();
}

CATransform3D *__cdecl CATransform3DInvert(CATransform3D *__return_ptr retstr, CATransform3D *t)
{
  return _CATransform3DInvert(retstr, t);
}

BOOL CATransform3DIsIdentity(CATransform3D *t)
{
  return _CATransform3DIsIdentity(t);
}

CATransform3D *__cdecl CATransform3DMakeAffineTransform(CATransform3D *__return_ptr retstr, CGAffineTransform *m)
{
  return _CATransform3DMakeAffineTransform(retstr, m);
}

uint64_t CA_CGPointApplyTransform()
{
  return _CA_CGPointApplyTransform();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return _CFArrayGetValueAtIndex(theArray, idx);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformConcat(retstr, t1, t2);
}

CGAffineTransformComponents *__cdecl CGAffineTransformDecompose(CGAffineTransformComponents *__return_ptr retstr, CGAffineTransform *transform)
{
  return _CGAffineTransformDecompose(retstr, transform);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return _CGAffineTransformEqualToTransform(t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return _CGAffineTransformInvert(retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return _CGAffineTransformMakeRotation(retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformMakeScale(retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return _CGAffineTransformRotate(retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return _CGAffineTransformScale(retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return _CGAffineTransformTranslate(retstr, t, tx, ty);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return _CGRectContainsPoint(rect, point);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  return _CGRectGetHeight(rect);
}

CGFloat CGRectGetMinX(CGRect rect)
{
  return _CGRectGetMinX(rect);
}

CGFloat CGRectGetMinY(CGRect rect)
{
  return _CGRectGetMinY(rect);
}

CGFloat CGRectGetWidth(CGRect rect)
{
  return _CGRectGetWidth(rect);
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  return _CGRectInset(rect, dx, dy);
}

BOOL CGRectIsNull(CGRect rect)
{
  return _CGRectIsNull(rect);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return _CPCopyBundleIdentifierAndTeamFromAuditToken();
}

uint64_t CPCopyBundleIdentifierFromAuditToken()
{
  return _CPCopyBundleIdentifierFromAuditToken();
}

uint64_t DRLogTarget()
{
  return _DRLogTarget();
}

uint64_t FPEvictItem()
{
  return _FPEvictItem();
}

uint64_t FPExtendBookmarkForDocumentURL()
{
  return _FPExtendBookmarkForDocumentURL();
}

uint64_t FPURLIsLocatedOnRemovableStorage()
{
  return _FPURLIsLocatedOnRemovableStorage();
}

uint64_t IOHIDEventAppendEvent()
{
  return _IOHIDEventAppendEvent();
}

uint64_t IOHIDEventCreateCopy()
{
  return _IOHIDEventCreateCopy();
}

uint64_t IOHIDEventCreateDigitizerEvent()
{
  return _IOHIDEventCreateDigitizerEvent();
}

uint64_t IOHIDEventCreateDigitizerFingerEvent()
{
  return _IOHIDEventCreateDigitizerFingerEvent();
}

uint64_t IOHIDEventCreateVendorDefinedEvent()
{
  return _IOHIDEventCreateVendorDefinedEvent();
}

uint64_t IOHIDEventGetChildren()
{
  return _IOHIDEventGetChildren();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return _IOHIDEventGetTimeStamp();
}

uint64_t IOHIDEventRemoveEvent()
{
  return _IOHIDEventRemoveEvent();
}

uint64_t IOHIDEventSetFloatValue()
{
  return _IOHIDEventSetFloatValue();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return _IOHIDEventSetIntegerValue();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return _IOHIDEventSetTimeStamp();
}

uint64_t MKBGetDeviceLockState()
{
  return _MKBGetDeviceLockState();
}

NSArray *__cdecl NSAllMapTableValues(NSMapTable *table)
{
  return _NSAllMapTableValues(table);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return _NSStringFromCGPoint(point);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return _NSStringFromCGRect(rect);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

uint64_t SBSConvertPointFromDisplayToNeighboringDisplay()
{
  return _SBSConvertPointFromDisplayToNeighboringDisplay();
}

uint64_t SBSConvertRectFromDisplayToNeighboringDisplay()
{
  return _SBSConvertRectFromDisplayToNeighboringDisplay();
}

uint64_t SBSCreateLayoutServiceEndpointForExternalDisplay()
{
  return _SBSCreateLayoutServiceEndpointForExternalDisplay();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return _UIAccessibilityIsReduceMotionEnabled();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t UIDistanceBetweenPoints()
{
  return _UIDistanceBetweenPoints();
}

uint64_t UIIntegralTransform()
{
  return _UIIntegralTransform();
}

uint64_t UIRectGetCenter()
{
  return _UIRectGetCenter();
}

uint64_t UIRoundToScale()
{
  return _UIRoundToScale();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _DUIDragSessionLifecycleListeningInterface()
{
  return __DUIDragSessionLifecycleListeningInterface();
}

uint64_t _DUINewClientDestinationInterface()
{
  return __DUINewClientDestinationInterface();
}

uint64_t _DUINewClientSessionAccessibilityInterface()
{
  return __DUINewClientSessionAccessibilityInterface();
}

uint64_t _DUINewClientSourceInterface()
{
  return __DUINewClientSourceInterface();
}

uint64_t _DUINewClientSystemAppInterface()
{
  return __DUINewClientSystemAppInterface();
}

uint64_t _DUINewDragContinuationInterface()
{
  return __DUINewDragContinuationInterface();
}

uint64_t _DUINewServerDestinationInterface()
{
  return __DUINewServerDestinationInterface();
}

uint64_t _DUINewServerSessionAccessibilityInterface()
{
  return __DUINewServerSessionAccessibilityInterface();
}

uint64_t _DUINewServerSourceInterface()
{
  return __DUINewServerSourceInterface();
}

uint64_t _UIApplicationPackedDeploymentVersionFromString()
{
  return __UIApplicationPackedDeploymentVersionFromString();
}

uint64_t _UIConvertPointFromOrientationToOrientation()
{
  return __UIConvertPointFromOrientationToOrientation();
}

uint64_t _UIConvertRectFromOrientationToOrientation()
{
  return __UIConvertRectFromOrientationToOrientation();
}

uint64_t _UIDataOwnerDescription()
{
  return __UIDataOwnerDescription();
}

uint64_t _UIDropAllowedBetweenApps()
{
  return __UIDropAllowedBetweenApps();
}

uint64_t _UIEffectiveSourceDataOwnerForReportedDataOwner()
{
  return __UIEffectiveSourceDataOwnerForReportedDataOwner();
}

uint64_t _UIIsOpenInRestrictionInEffect()
{
  return __UIIsOpenInRestrictionInEffect();
}

uint64_t _UIUpdateRequestActivate()
{
  return __UIUpdateRequestActivate();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

int *__error(void)
{
  return ___error();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

uint32_t arc4random(void)
{
  return _arc4random();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return _arc4random_uniform(__upper_bound);
}

long double atan2(long double __y, long double __x)
{
  return _atan2(__y, __x);
}

int copyfile(const char *from, const char *to, copyfile_state_t state, copyfile_flags_t flags)
{
  return _copyfile(from, to, state, flags);
}

void dispatch_activate(dispatch_object_t object)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return _dispatch_group_create();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return _dispatch_group_wait(group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return _dispatch_queue_attr_make_with_qos_class(attr, qos_class, relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return _dispatch_source_create(type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void exit(int a1)
{
}

pid_t getpid(void)
{
  return _getpid();
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

char *__cdecl mkdtemp(char *a1)
{
  return _mkdtemp(a1);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

uint64_t self
{
  return _self;
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

id objc_retainBlock(id a1)
{
  return _objc_retainBlock(a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

uint64_t os_variant_has_internal_diagnostics()
{
  return _os_variant_has_internal_diagnostics();
}

pthread_t pthread_self(void)
{
  return _pthread_self();
}

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_release()
{
  return _swift_release();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return _sysctl(a1, a2, a3, a4, a5, a6);
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

id objc_msgSend_CGColor(void *a1, const char *a2, ...)
{
  return _[a1 CGColor];
}

id objc_msgSend_CGPointValue(void *a1, const char *a2, ...)
{
  return _[a1 CGPointValue];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLByAppendingPathComponent:");
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return _[a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend__acceptDragPreviews_fence_fromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_acceptDragPreviews:fence:fromClient:");
}

id objc_msgSend__addBeginningTouchesToExistingSessions_viewController_touchWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_addBeginningTouchesToExistingSessions:viewController:touchWindow:");
}

id objc_msgSend__anchorPointForItem_sessionModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_anchorPointForItem:sessionModel:");
}

id objc_msgSend__animateSpringWithDampingRatio_response_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateSpringWithDampingRatio:response:animations:");
}

id objc_msgSend__animateUsingSpringWithDampingRatio_response_tracking_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:");
}

id objc_msgSend__animateUsingSpringWithDampingRatio_response_tracking_initialDampingRatio_initialResponse_dampingRatioSmoothing_responseSmoothing_targetSmoothing_projectionDeceleration_animations_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_animateUsingSpringWithDampingRatio:response:tracking:initialDampingRatio:initialResponse:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:");
}

id objc_msgSend__applyMainWindowExclusionToRoutingPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_applyMainWindowExclusionToRoutingPolicy:");
}

id objc_msgSend__areAllTouchesEndedOrCancelled(void *a1, const char *a2, ...)
{
  return _[a1 _areAllTouchesEndedOrCancelled];
}

id objc_msgSend__badgeLayoutForPlatterView_totalItemDepth_orientation_count_potentialDrop_centroid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_badgeLayoutForPlatterView:totalItemDepth:orientation:count:potentialDrop:centroid:");
}

id objc_msgSend__bindingLayer(void *a1, const char *a2, ...)
{
  return _[a1 _bindingLayer];
}

id objc_msgSend__canRunBlocksWaitingForLastTouchAndDestinationToEnd(void *a1, const char *a2, ...)
{
  return _[a1 _canRunBlocksWaitingForLastTouchAndDestinationToEnd];
}

id objc_msgSend__cancelAllDragSessions(void *a1, const char *a2, ...)
{
  return _[a1 _cancelAllDragSessions];
}

id objc_msgSend__cancelDrag(void *a1, const char *a2, ...)
{
  return _[a1 _cancelDrag];
}

id objc_msgSend__cancelPointerBeganWatchdog(void *a1, const char *a2, ...)
{
  return _[a1 _cancelPointerBeganWatchdog];
}

id objc_msgSend__cancelTouchWatchdog(void *a1, const char *a2, ...)
{
  return _[a1 _cancelTouchWatchdog];
}

id objc_msgSend__componentViewForItemModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_componentViewForItemModel:");
}

id objc_msgSend__configureHIDServiceIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 _configureHIDServiceIfNeeded];
}

id objc_msgSend__contentViewControllerForInteractionWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_contentViewControllerForInteractionWindow:");
}

id objc_msgSend__contextId(void *a1, const char *a2, ...)
{
  return _[a1 _contextId];
}

id objc_msgSend__copyItemCollectionForDestinationWithFilter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_copyItemCollectionForDestinationWithFilter:");
}

id objc_msgSend__createExternalConnections(void *a1, const char *a2, ...)
{
  return _[a1 _createExternalConnections];
}

id objc_msgSend__createTransformerWithInputAnimatableProperties_presentationValueChangedCallback_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createTransformerWithInputAnimatableProperties:presentationValueChangedCallback:");
}

id objc_msgSend__createUserActivityDataWithOptions_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_createUserActivityDataWithOptions:completionHandler:");
}

id objc_msgSend__didReceiveOrientationUpdate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_didReceiveOrientationUpdate:");
}

id objc_msgSend__edgeType(void *a1, const char *a2, ...)
{
  return _[a1 _edgeType];
}

id objc_msgSend__endDragByCancelling(void *a1, const char *a2, ...)
{
  return _[a1 _endDragByCancelling];
}

id objc_msgSend__endDragWithOperation_dataTransferSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endDragWithOperation:dataTransferSession:");
}

id objc_msgSend__endDragWithOperation_destination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_endDragWithOperation:destination:");
}

id objc_msgSend__eventFetchRunLoop(void *a1, const char *a2, ...)
{
  return _[a1 _eventFetchRunLoop];
}

id objc_msgSend__filterTouchesForPointer_performingBlockForPointerTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_filterTouchesForPointer:performingBlockForPointerTouch:");
}

id objc_msgSend__forEachTouch_performBlockForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_forEachTouch:performBlockForSession:");
}

id objc_msgSend__getTransformForContextID_layerRenderID_displayID_allowingEmptyLayerID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getTransformForContextID:layerRenderID:displayID:allowingEmptyLayerID:completion:");
}

id objc_msgSend__getTransformForLayerContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_getTransformForLayerContext:completion:");
}

id objc_msgSend__handleDirtyItems_fromClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_handleDirtyItems:fromClient:");
}

id objc_msgSend__init(void *a1, const char *a2, ...)
{
  return _[a1 _init];
}

id objc_msgSend__initialCentroid(void *a1, const char *a2, ...)
{
  return _[a1 _initialCentroid];
}

id objc_msgSend__initializeHIDEventBaseWithLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_initializeHIDEventBaseWithLocation:");
}

id objc_msgSend__isEmbeddedScreen(void *a1, const char *a2, ...)
{
  return _[a1 _isEmbeddedScreen];
}

id objc_msgSend__isNewItemModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isNewItemModel:");
}

id objc_msgSend__isNormalizedPointOutOfBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isNormalizedPointOutOfBounds:");
}

id objc_msgSend__isPointerTouch(void *a1, const char *a2, ...)
{
  return _[a1 _isPointerTouch];
}

id objc_msgSend__isPolicyControlled(void *a1, const char *a2, ...)
{
  return _[a1 _isPolicyControlled];
}

id objc_msgSend__isRepresentationAllowed_forDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_isRepresentationAllowed:forDestination:");
}

id objc_msgSend__itemModelHasUpdatedPreview_forItemView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemModelHasUpdatedPreview:forItemView:");
}

id objc_msgSend__itemModelsForModel_withCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_itemModelsForModel:withCapacity:");
}

id objc_msgSend__lastTouchEndedNormally_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_lastTouchEndedNormally:");
}

id objc_msgSend__liftVirtualHIDServiceIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _liftVirtualHIDServiceIfNecessary];
}

id objc_msgSend__logStatisticsForDragEnd_destination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_logStatisticsForDragEnd:destination:");
}

id objc_msgSend__manipulatedScale(void *a1, const char *a2, ...)
{
  return _[a1 _manipulatedScale];
}

id objc_msgSend__modifyAnimationsWithPreferredFrameRateRange_updateReason_animations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_modifyAnimationsWithPreferredFrameRateRange:updateReason:animations:");
}

id objc_msgSend__normalizedLocationFromReferenceLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_normalizedLocationFromReferenceLocation:");
}

id objc_msgSend__notifyDestinationsWithAddedItemsStartingAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyDestinationsWithAddedItemsStartingAtIndex:");
}

id objc_msgSend__notifyListenersSessionDidEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyListenersSessionDidEnd:");
}

id objc_msgSend__notifyListenersSessionWillBegin_configuration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyListenersSessionWillBegin:configuration:completion:");
}

id objc_msgSend__notifyObserversOfPreviewsChangesUpdatedInLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_notifyObserversOfPreviewsChangesUpdatedInLayout:");
}

id objc_msgSend__operationQueue_invalidate(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_operationQueue_invalidate");
}

id objc_msgSend__performAfterLastTouchAndDestinationBothEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performAfterLastTouchAndDestinationBothEnd:");
}

id objc_msgSend__performBlockAfterCATransactionCommits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performBlockAfterCATransactionCommits:");
}

id objc_msgSend__performDropOperation_layerContext_forConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performDropOperation:layerContext:forConnection:");
}

id objc_msgSend__performWithoutRetargetingAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_performWithoutRetargetingAnimations:");
}

id objc_msgSend__pointerBeganWatchdogFired(void *a1, const char *a2, ...)
{
  return _[a1 _pointerBeganWatchdogFired];
}

id objc_msgSend__previewTransitionForItemModel_rotation_center_anchorPoint_outItemView_appliedTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_previewTransitionForItemModel:rotation:center:anchorPoint:outItemView:appliedTransform:");
}

id objc_msgSend__queue(void *a1, const char *a2, ...)
{
  return _[a1 _queue];
}

id objc_msgSend__receivedEndFromDestinationOnConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_receivedEndFromDestinationOnConnection:");
}

id objc_msgSend__referenceBounds(void *a1, const char *a2, ...)
{
  return _[a1 _referenceBounds];
}

id objc_msgSend__registerRequestFromSourceItem_typeIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_registerRequestFromSourceItem:typeIdentifier:completionHandler:");
}

id objc_msgSend__requestItemImagesIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 _requestItemImagesIfNecessary];
}

id objc_msgSend__resetTouchWatchdogWithTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resetTouchWatchdogWithTimeout:");
}

id objc_msgSend__resolvedIdentifierForSystemShellHostingSpaceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_resolvedIdentifierForSystemShellHostingSpaceIdentifier:");
}

id objc_msgSend__rotation(void *a1, const char *a2, ...)
{
  return _[a1 _rotation];
}

id objc_msgSend__runAnimatableWithBarelyBouncyAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runAnimatableWithBarelyBouncyAnimation:");
}

id objc_msgSend__runAnimatableWithBouncyAnimation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runAnimatableWithBouncyAnimation:");
}

id objc_msgSend__runAnimatableWithBouncyAnimation_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runAnimatableWithBouncyAnimation:response:");
}

id objc_msgSend__runAnimatableWithOneToOneTracking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runAnimatableWithOneToOneTracking:");
}

id objc_msgSend__runAnimatableWithOneToOneTracking_response_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runAnimatableWithOneToOneTracking:response:");
}

id objc_msgSend__runBadgeLayout_oneToOneTrack_bouncy_slowOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runBadgeLayout:oneToOneTrack:bouncy:slowOffset:");
}

id objc_msgSend__runBlocksWaitingForLastTouchAndDestinationToEnd(void *a1, const char *a2, ...)
{
  return _[a1 _runBlocksWaitingForLastTouchAndDestinationToEnd];
}

id objc_msgSend__runBlocksWaitingForLastTouchAndDestinationToEndIfPossible(void *a1, const char *a2, ...)
{
  return _[a1 _runBlocksWaitingForLastTouchAndDestinationToEndIfPossible];
}

id objc_msgSend__runWithoutRetargeting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_runWithoutRetargeting:");
}

id objc_msgSend__scheduleSceneEventResponseForScene_withResponseBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_scheduleSceneEventResponseForScene:withResponseBlock:");
}

id objc_msgSend__screen(void *a1, const char *a2, ...)
{
  return _[a1 _screen];
}

id objc_msgSend__sendHIDEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sendHIDEvent:");
}

id objc_msgSend__setAllowsCreationOfFileURLFromItemProvider_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsCreationOfFileURLFromItemProvider:");
}

id objc_msgSend__setEventFetchThreadPriorityWhenPossible(void *a1, const char *a2, ...)
{
  return _[a1 _setEventFetchThreadPriorityWhenPossible];
}

id objc_msgSend__setKeepContextAssociationInBackground_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setKeepContextAssociationInBackground:");
}

id objc_msgSend__setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setQueue:");
}

id objc_msgSend__setTargetVelocity_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setTargetVelocity:forKey:");
}

id objc_msgSend__setVelocity_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setVelocity:forKey:");
}

id objc_msgSend__setupItem_forLoadingFromSourceItem_destination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setupItem:forLoadingFromSourceItem:destination:");
}

id objc_msgSend__shouldNotifyForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldNotifyForSession:");
}

id objc_msgSend__shouldRestrictOpenInPlaceFor_destinationAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldRestrictOpenInPlaceFor:destinationAuditToken:");
}

id objc_msgSend__shouldScaleItemModel_withPotentialDrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_shouldScaleItemModel:withPotentialDrop:");
}

id objc_msgSend__synchronizeDrawingWithFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_synchronizeDrawingWithFence:");
}

id objc_msgSend__synchronizedDrawingFence(void *a1, const char *a2, ...)
{
  return _[a1 _synchronizedDrawingFence];
}

id objc_msgSend__takeDragImageWithComponent_forClient_itemModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_takeDragImageWithComponent:forClient:itemModel:");
}

id objc_msgSend__takePreview_forClient_itemModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_takePreview:forClient:itemModel:");
}

id objc_msgSend__targetVelocityForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_targetVelocityForKey:");
}

id objc_msgSend__touchEndedNormally_withID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_touchEndedNormally:withID:");
}

id objc_msgSend__touchIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 _touchIdentifier];
}

id objc_msgSend__touchWatchdogFired(void *a1, const char *a2, ...)
{
  return _[a1 _touchWatchdogFired];
}

id objc_msgSend__transferQueue_scheduleNextTransfer(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transferQueue_scheduleNextTransfer");
}

id objc_msgSend__transferQueue_sendDelegateCallbacksIfNeeded(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transferQueue_sendDelegateCallbacksIfNeeded");
}

id objc_msgSend__transformVelocity_withTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_transformVelocity:withTransform:");
}

id objc_msgSend__typeWithIdentifier_allowUndeclared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_typeWithIdentifier:allowUndeclared:");
}

id objc_msgSend__updateAccessibilityDragStatus(void *a1, const char *a2, ...)
{
  return _[a1 _updateAccessibilityDragStatus];
}

id objc_msgSend__updateElasticEffectForLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateElasticEffectForLocation:");
}

id objc_msgSend__updateElasticProperties(void *a1, const char *a2, ...)
{
  return _[a1 _updateElasticProperties];
}

id objc_msgSend__updateElasticTransform(void *a1, const char *a2, ...)
{
  return _[a1 _updateElasticTransform];
}

id objc_msgSend__updateHIDEventBaseWithLocation_touching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateHIDEventBaseWithLocation:touching:");
}

id objc_msgSend__updateIsAnyProcessBeingDebuggedWithConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updateIsAnyProcessBeingDebuggedWithConnection:");
}

id objc_msgSend__updatePotentialDrop_forDestinationClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePotentialDrop:forDestinationClient:");
}

id objc_msgSend__updatePotentialDropPreferringFullSizePreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_updatePotentialDropPreferringFullSizePreview:");
}

id objc_msgSend__updatePrecisionMode(void *a1, const char *a2, ...)
{
  return _[a1 _updatePrecisionMode];
}

id objc_msgSend__usePrecisionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_usePrecisionMode:");
}

id objc_msgSend__velocityForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_velocityForKey:");
}

id objc_msgSend__viewForItemModel_rotation_defaultCenter_appliedTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_viewForItemModel:rotation:defaultCenter:appliedTransform:");
}

id objc_msgSend__window(void *a1, const char *a2, ...)
{
  return _[a1 _window];
}

id objc_msgSend_acceptsSynthesizedTouchAtLocation_displayIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acceptsSynthesizedTouchAtLocation:displayIdentifier:");
}

id objc_msgSend_accessibilityProxy(void *a1, const char *a2, ...)
{
  return _[a1 accessibilityProxy];
}

id objc_msgSend_acquireWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "acquireWithError:");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return _[a1 activate];
}

id objc_msgSend_activateConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activateConstraints:");
}

id objc_msgSend_activatedSceneGroupForSystemShellHostingSpaceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activatedSceneGroupForSystemShellHostingSpaceIdentifier:");
}

id objc_msgSend_activeInterfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 activeInterfaceOrientation];
}

id objc_msgSend_activeInterfaceOrientationWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "activeInterfaceOrientationWithCompletion:");
}

id objc_msgSend_activeSessionViewModelsForTouchID(void *a1, const char *a2, ...)
{
  return _[a1 activeSessionViewModelsForTouchID];
}

id objc_msgSend_addAnimations_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAnimations:");
}

id objc_msgSend_addChild_withPendingUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addChild:withPendingUnitCount:");
}

id objc_msgSend_addClientModelForClient_isSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addClientModelForClient:isSource:");
}

id objc_msgSend_addCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addCompletion:");
}

id objc_msgSend_addDestination_onConnection_systemPolicy_destinationExpectsStagedSelectors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addDestination:onConnection:systemPolicy:destinationExpectsStagedSelectors:");
}

id objc_msgSend_addFilePresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addFilePresenter:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addInitialItemsWithCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addInitialItemsWithCount:");
}

id objc_msgSend_addItem(void *a1, const char *a2, ...)
{
  return _[a1 addItem];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:");
}

id objc_msgSend_addObserver_forTouchIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:forTouchIdentifier:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperationWithBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperationWithBlock:");
}

id objc_msgSend_addSample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSample:");
}

id objc_msgSend_addSession_withSourceClient_touchIDs_itemCount_centroid_sourceContextID_initialCentroidInSourceContext_preferredPreviewIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSession:withSourceClient:touchIDs:itemCount:centroid:sourceContextID:initialCentroidInSourceContext:preferredPreviewIndexes:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTarget:action:forControlEvents:");
}

id objc_msgSend_addTouchID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addTouchID:");
}

id objc_msgSend_addedItemCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addedItemCollection:");
}

id objc_msgSend_allDisplayIdentifiers(void *a1, const char *a2, ...)
{
  return _[a1 allDisplayIdentifiers];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return _[a1 allObjects];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_allViews(void *a1, const char *a2, ...)
{
  return _[a1 allViews];
}

id objc_msgSend_allWindowContextIdsForDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "allWindowContextIdsForDragSession:");
}

id objc_msgSend_alpha(void *a1, const char *a2, ...)
{
  return _[a1 alpha];
}

id objc_msgSend_anchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 anchorPoint];
}

id objc_msgSend_anchorPointForAlignment(void *a1, const char *a2, ...)
{
  return _[a1 anchorPointForAlignment];
}

id objc_msgSend_animateFlockLayoutOutput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateFlockLayoutOutput:");
}

id objc_msgSend_animateOutVisibleItemsForSession_withOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateOutVisibleItemsForSession:withOperation:");
}

id objc_msgSend_animateOutWithOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animateOutWithOperation:");
}

id objc_msgSend_animatesFlockItemSizeAlongsidePreviewTransition(void *a1, const char *a2, ...)
{
  return _[a1 animatesFlockItemSizeAlongsidePreviewTransition];
}

id objc_msgSend_animationBlock(void *a1, const char *a2, ...)
{
  return _[a1 animationBlock];
}

id objc_msgSend_animationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "animationBlock:");
}

id objc_msgSend_animationFence(void *a1, const char *a2, ...)
{
  return _[a1 animationFence];
}

id objc_msgSend_announcement(void *a1, const char *a2, ...)
{
  return _[a1 announcement];
}

id objc_msgSend_anonymousListener(void *a1, const char *a2, ...)
{
  return _[a1 anonymousListener];
}

id objc_msgSend_appliedTransform(void *a1, const char *a2, ...)
{
  return _[a1 appliedTransform];
}

id objc_msgSend_applyOriginalRotation(void *a1, const char *a2, ...)
{
  return _[a1 applyOriginalRotation];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObject:");
}

id objc_msgSend_arrayByExcludingObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByExcludingObjectsInArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attributeWithDomain_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "attributeWithDomain:name:");
}

id objc_msgSend_auditToken(void *a1, const char *a2, ...)
{
  return _[a1 auditToken];
}

id objc_msgSend_authorizationDecisionView(void *a1, const char *a2, ...)
{
  return _[a1 authorizationDecisionView];
}

id objc_msgSend_authorizationReplyBlock(void *a1, const char *a2, ...)
{
  return _[a1 authorizationReplyBlock];
}

id objc_msgSend_availableClaimBindingsForMode_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "availableClaimBindingsForMode:error:");
}

id objc_msgSend_avoidAnimation(void *a1, const char *a2, ...)
{
  return _[a1 avoidAnimation];
}

id objc_msgSend_avoidsKeyboardSuppression(void *a1, const char *a2, ...)
{
  return _[a1 avoidsKeyboardSuppression];
}

id objc_msgSend_axEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 axEndpoint];
}

id objc_msgSend_badge(void *a1, const char *a2, ...)
{
  return _[a1 badge];
}

id objc_msgSend_badgeAppeared(void *a1, const char *a2, ...)
{
  return _[a1 badgeAppeared];
}

id objc_msgSend_badgeContainer(void *a1, const char *a2, ...)
{
  return _[a1 badgeContainer];
}

id objc_msgSend_badgeLayout(void *a1, const char *a2, ...)
{
  return _[a1 badgeLayout];
}

id objc_msgSend_badgeLocation(void *a1, const char *a2, ...)
{
  return _[a1 badgeLocation];
}

id objc_msgSend_badgeView(void *a1, const char *a2, ...)
{
  return _[a1 badgeView];
}

id objc_msgSend_bannerSourceForDestination_forRequesterIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bannerSourceForDestination:forRequesterIdentifier:");
}

id objc_msgSend_beganPointerDrag(void *a1, const char *a2, ...)
{
  return _[a1 beganPointerDrag];
}

id objc_msgSend_beginAccessibilityDragAtLocationIfNeeded_hidService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAccessibilityDragAtLocationIfNeeded:hidService:");
}

id objc_msgSend_beginAtPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginAtPoint:");
}

id objc_msgSend_beginDrag(void *a1, const char *a2, ...)
{
  return _[a1 beginDrag];
}

id objc_msgSend_beginDragManipulationWithLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginDragManipulationWithLocation:");
}

id objc_msgSend_beginPointerDragAtLocationIfNeeded_hidService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginPointerDragAtLocationIfNeeded:hidService:");
}

id objc_msgSend_beginPresenting(void *a1, const char *a2, ...)
{
  return _[a1 beginPresenting];
}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return _[a1 beginTransaction];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "boldSystemFontOfSize:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return _[a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleID(void *a1, const char *a2, ...)
{
  return _[a1 bundleID];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleProxyWithAuditToken_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleProxyWithAuditToken:error:");
}

id objc_msgSend_bundleRecord(void *a1, const char *a2, ...)
{
  return _[a1 bundleRecord];
}

id objc_msgSend_buttonWithType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "buttonWithType:");
}

id objc_msgSend_cStringUsingEncoding_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cStringUsingEncoding:");
}

id objc_msgSend_canAddManipulatedTouch(void *a1, const char *a2, ...)
{
  return _[a1 canAddManipulatedTouch];
}

id objc_msgSend_canAddTouches(void *a1, const char *a2, ...)
{
  return _[a1 canAddTouches];
}

id objc_msgSend_canCoalesceWithAnnouncement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canCoalesceWithAnnouncement:");
}

id objc_msgSend_canHandOffCancelledItems_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canHandOffCancelledItems:withReply:");
}

id objc_msgSend_canLoadObjectOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canLoadObjectOfClass:");
}

id objc_msgSend_canManipulateTransform(void *a1, const char *a2, ...)
{
  return _[a1 canManipulateTransform];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelDrag(void *a1, const char *a2, ...)
{
  return _[a1 cancelDrag];
}

id objc_msgSend_cancelPointerDrag(void *a1, const char *a2, ...)
{
  return _[a1 cancelPointerDrag];
}

id objc_msgSend_center(void *a1, const char *a2, ...)
{
  return _[a1 center];
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_centroid(void *a1, const char *a2, ...)
{
  return _[a1 centroid];
}

id objc_msgSend_checkCanHandOffCancelledItems_withReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "checkCanHandOffCancelledItems:withReply:");
}

id objc_msgSend_client(void *a1, const char *a2, ...)
{
  return _[a1 client];
}

id objc_msgSend_clientItemViewModelForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientItemViewModelForClient:");
}

id objc_msgSend_clientModelForClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "clientModelForClient:");
}

id objc_msgSend_clientSession(void *a1, const char *a2, ...)
{
  return _[a1 clientSession];
}

id objc_msgSend_clientSessionReportedDragEnd(void *a1, const char *a2, ...)
{
  return _[a1 clientSessionReportedDragEnd];
}

id objc_msgSend_clientSource(void *a1, const char *a2, ...)
{
  return _[a1 clientSource];
}

id objc_msgSend_completedUnitCount(void *a1, const char *a2, ...)
{
  return _[a1 completedUnitCount];
}

id objc_msgSend_completionBlock(void *a1, const char *a2, ...)
{
  return _[a1 completionBlock];
}

id objc_msgSend_completionHandler(void *a1, const char *a2, ...)
{
  return _[a1 completionHandler];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsJoinedByString:");
}

id objc_msgSend_configurationForDefaultMainDisplayMonitor(void *a1, const char *a2, ...)
{
  return _[a1 configurationForDefaultMainDisplayMonitor];
}

id objc_msgSend_configurationWithEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithEndpoint:");
}

id objc_msgSend_configurePortalViewForDragSessionOriginatingFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurePortalViewForDragSessionOriginatingFromViewController:");
}

id objc_msgSend_configurePortalViewsForDragSessionOriginatingFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurePortalViewsForDragSessionOriginatingFromViewController:");
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return _[a1 connect];
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return _[a1 connection];
}

id objc_msgSend_constrainSize(void *a1, const char *a2, ...)
{
  return _[a1 constrainSize];
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_constraintEqualToAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:multiplier:");
}

id objc_msgSend_constraintEqualToSystemSpacingAfterAnchor_multiplier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToSystemSpacingAfterAnchor:multiplier:");
}

id objc_msgSend_containerSize(void *a1, const char *a2, ...)
{
  return _[a1 containerSize];
}

id objc_msgSend_containsIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsIndex:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_containsSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsSceneIdentifier:");
}

id objc_msgSend_contentSize(void *a1, const char *a2, ...)
{
  return _[a1 contentSize];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return _[a1 contentView];
}

id objc_msgSend_contentWindowForHardwareDisplayIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contentWindowForHardwareDisplayIdentifier:");
}

id objc_msgSend_contextID(void *a1, const char *a2, ...)
{
  return _[a1 contextID];
}

id objc_msgSend_contextIDsToExcludeFromHitTesting(void *a1, const char *a2, ...)
{
  return _[a1 contextIDsToExcludeFromHitTesting];
}

id objc_msgSend_continuationConnection(void *a1, const char *a2, ...)
{
  return _[a1 continuationConnection];
}

id objc_msgSend_continuationEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 continuationEndpoint];
}

id objc_msgSend_continuationSession(void *a1, const char *a2, ...)
{
  return _[a1 continuationSession];
}

id objc_msgSend_continuityDisplayWantsDragsHidden(void *a1, const char *a2, ...)
{
  return _[a1 continuityDisplayWantsDragsHidden];
}

id objc_msgSend_controllers(void *a1, const char *a2, ...)
{
  return _[a1 controllers];
}

id objc_msgSend_convertPoint_toLayer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toLayer:");
}

id objc_msgSend_convertPoint_toView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "convertPoint:toView:");
}

id objc_msgSend_coordinateAccessWithIntents_queue_byAccessor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "coordinateAccessWithIntents:queue:byAccessor:");
}

id objc_msgSend_coordinateSpaceSourceLayerContext(void *a1, const char *a2, ...)
{
  return _[a1 coordinateSpaceSourceLayerContext];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_copyWithDoNothingLoaders(void *a1, const char *a2, ...)
{
  return _[a1 copyWithDoNothingLoaders];
}

id objc_msgSend_copyWithItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "copyWithItems:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createArbiterConnection(void *a1, const char *a2, ...)
{
  return _[a1 createArbiterConnection];
}

id objc_msgSend_createImageRequest(void *a1, const char *a2, ...)
{
  return _[a1 createImageRequest];
}

id objc_msgSend_currentClient(void *a1, const char *a2, ...)
{
  return _[a1 currentClient];
}

id objc_msgSend_currentClientItemViewModel(void *a1, const char *a2, ...)
{
  return _[a1 currentClientItemViewModel];
}

id objc_msgSend_currentConnection(void *a1, const char *a2, ...)
{
  return _[a1 currentConnection];
}

id objc_msgSend_currentDestination(void *a1, const char *a2, ...)
{
  return _[a1 currentDestination];
}

id objc_msgSend_currentLayout(void *a1, const char *a2, ...)
{
  return _[a1 currentLayout];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return _[a1 currentLocation];
}

id objc_msgSend_dataConsumersEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 dataConsumersEndpoint];
}

id objc_msgSend_dataProviderEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 dataProviderEndpoint];
}

id objc_msgSend_dataTransferSession(void *a1, const char *a2, ...)
{
  return _[a1 dataTransferSession];
}

id objc_msgSend_dataTransferSessionBegan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTransferSessionBegan:");
}

id objc_msgSend_dataTransferSessionFinished(void *a1, const char *a2, ...)
{
  return _[a1 dataTransferSessionFinished];
}

id objc_msgSend_dataTransferSessionFinished_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTransferSessionFinished:");
}

id objc_msgSend_dataTransferSessionForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dataTransferSessionForDestination:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_defaultMultiItemAnimationForPlatterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultMultiItemAnimationForPlatterView:");
}

id objc_msgSend_defaultPreviewWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultPreviewWithFrame:");
}

id objc_msgSend_defaultSingleItemAnimationForPlatterView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultSingleItemAnimationForPlatterView:");
}

id objc_msgSend_defaultStackAlpha(void *a1, const char *a2, ...)
{
  return _[a1 defaultStackAlpha];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return _[a1 delegate];
}

id objc_msgSend_destinationConnectionWasInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationConnectionWasInvalidated:");
}

id objc_msgSend_destinationDataProviderEndpoint(void *a1, const char *a2, ...)
{
  return _[a1 destinationDataProviderEndpoint];
}

id objc_msgSend_destinationIsSystemConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "destinationIsSystemConnection:");
}

id objc_msgSend_destinationItemCollection(void *a1, const char *a2, ...)
{
  return _[a1 destinationItemCollection];
}

id objc_msgSend_destinationProcessInfo(void *a1, const char *a2, ...)
{
  return _[a1 destinationProcessInfo];
}

id objc_msgSend_detachTouchesWithTouchIdentifiers_session_routingPolicy_touchOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "detachTouchesWithTouchIdentifiers:session:routingPolicy:touchOffset:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithCapacity:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_didFinishRequestingDataForDragContinuation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "didFinishRequestingDataForDragContinuation:");
}

id objc_msgSend_direction(void *a1, const char *a2, ...)
{
  return _[a1 direction];
}

id objc_msgSend_discreteProgressWithTotalUnitCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "discreteProgressWithTotalUnitCount:");
}

id objc_msgSend_dispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchEvent:");
}

id objc_msgSend_displayConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 displayConfiguration];
}

id objc_msgSend_displayIdentifierForSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayIdentifierForSceneIdentifier:");
}

id objc_msgSend_displayIdentifierForSynthesizedTouch(void *a1, const char *a2, ...)
{
  return _[a1 displayIdentifierForSynthesizedTouch];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return _[a1 displayIdentity];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return _[a1 displayScale];
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_documentProxyForName_type_MIMEType_isContentManaged_sourceAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "documentProxyForName:type:MIMEType:isContentManaged:sourceAuditToken:");
}

id objc_msgSend_doubleValue(void *a1, const char *a2, ...)
{
  return _[a1 doubleValue];
}

id objc_msgSend_dragDidBeginWithSession_identifier_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragDidBeginWithSession:identifier:reply:");
}

id objc_msgSend_dragDidBeginWithSystemSession_info_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragDidBeginWithSystemSession:info:reply:");
}

id objc_msgSend_dragDidEndWithOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragDidEndWithOperation:");
}

id objc_msgSend_dragDidEndWithSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragDidEndWithSession:");
}

id objc_msgSend_dragDidEndWithSession_identifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragDidEndWithSession:identifier:");
}

id objc_msgSend_dragDidEndWithSystemSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragDidEndWithSystemSession:");
}

id objc_msgSend_dragEnded(void *a1, const char *a2, ...)
{
  return _[a1 dragEnded];
}

id objc_msgSend_dragEndedWithOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragEndedWithOperation:");
}

id objc_msgSend_dragMonitorProcessIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 dragMonitorProcessIdentifier];
}

id objc_msgSend_dragSession(void *a1, const char *a2, ...)
{
  return _[a1 dragSession];
}

id objc_msgSend_dragSession_addedItemCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:addedItemCount:");
}

id objc_msgSend_dragSession_animateOutVisibleItemsWithOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:animateOutVisibleItemsWithOperation:");
}

id objc_msgSend_dragSession_destinationIsDragMonitorConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:destinationIsDragMonitorConnection:");
}

id objc_msgSend_dragSession_destinationIsOnenessConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:destinationIsOnenessConnection:");
}

id objc_msgSend_dragSession_destinationIsSystemConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:destinationIsSystemConnection:");
}

id objc_msgSend_dragSession_enableKeyboardIfNeeded_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:enableKeyboardIfNeeded:");
}

id objc_msgSend_dragSession_findVisibleDroppedItemsInSpaceOfLayerContext_replyingOnQueue_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:findVisibleDroppedItemsInSpaceOfLayerContext:replyingOnQueue:with:");
}

id objc_msgSend_dragSession_invalidateImageForClient_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:invalidateImageForClient:itemIndex:");
}

id objc_msgSend_dragSession_moveToLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:moveToLocation:");
}

id objc_msgSend_dragSession_removeVisibleDroppedItemsInSpaceOfLayerContext_replyingOnQueue_with_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:removeVisibleDroppedItemsInSpaceOfLayerContext:replyingOnQueue:with:");
}

id objc_msgSend_dragSession_transformedPointFromContextID_point_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:transformedPointFromContextID:point:");
}

id objc_msgSend_dragSession_updateDragItems_forClient_withFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:updateDragItems:forClient:withFence:");
}

id objc_msgSend_dragSession_updateRoutingPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:updateRoutingPolicy:");
}

id objc_msgSend_dragSession_updatedPotentialDrop_forDestinationClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSession:updatedPotentialDrop:forDestinationClient:");
}

id objc_msgSend_dragSessionDidEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSessionDidEnd:");
}

id objc_msgSend_dragSessionWillEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragSessionWillEnd:");
}

id objc_msgSend_dragStatusDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragStatusDidChange:");
}

id objc_msgSend_dragWillBeginWithReply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dragWillBeginWithReply:");
}

id objc_msgSend_duration(void *a1, const char *a2, ...)
{
  return _[a1 duration];
}

id objc_msgSend_elasticPositionX(void *a1, const char *a2, ...)
{
  return _[a1 elasticPositionX];
}

id objc_msgSend_elasticPositionY(void *a1, const char *a2, ...)
{
  return _[a1 elasticPositionY];
}

id objc_msgSend_elasticRotation(void *a1, const char *a2, ...)
{
  return _[a1 elasticRotation];
}

id objc_msgSend_elasticScaleX(void *a1, const char *a2, ...)
{
  return _[a1 elasticScaleX];
}

id objc_msgSend_elasticScaleY(void *a1, const char *a2, ...)
{
  return _[a1 elasticScaleY];
}

id objc_msgSend_elasticTransform(void *a1, const char *a2, ...)
{
  return _[a1 elasticTransform];
}

id objc_msgSend_elements(void *a1, const char *a2, ...)
{
  return _[a1 elements];
}

id objc_msgSend_endDragManipulationWithLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endDragManipulationWithLocation:");
}

id objc_msgSend_endPointerDrag(void *a1, const char *a2, ...)
{
  return _[a1 endPointerDrag];
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return _[a1 endTransaction];
}

id objc_msgSend_ensembleConnectionWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ensembleConnectionWithQueue:");
}

id objc_msgSend_enteredPrecisionModeTime(void *a1, const char *a2, ...)
{
  return _[a1 enteredPrecisionModeTime];
}

id objc_msgSend_enteredPrecisionModeY(void *a1, const char *a2, ...)
{
  return _[a1 enteredPrecisionModeY];
}

id objc_msgSend_enumerateIndexesUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateIndexesUsingBlock:");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_establishConnectionToDataProviderCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "establishConnectionToDataProviderCompletionBlock:");
}

id objc_msgSend_eventService(void *a1, const char *a2, ...)
{
  return _[a1 eventService];
}

id objc_msgSend_expectsStagedLegacySelectors(void *a1, const char *a2, ...)
{
  return _[a1 expectsStagedLegacySelectors];
}

id objc_msgSend_fail(void *a1, const char *a2, ...)
{
  return _[a1 fail];
}

id objc_msgSend_fenceForSession_withHandle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fenceForSession:withHandle:");
}

id objc_msgSend_fetchItemForURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchItemForURL:completionHandler:");
}

id objc_msgSend_fetchURLForItem_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fetchURLForItem:completionHandler:");
}

id objc_msgSend_filePresenters(void *a1, const char *a2, ...)
{
  return _[a1 filePresenters];
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 fileSystemRepresentation];
}

id objc_msgSend_fileURL(void *a1, const char *a2, ...)
{
  return _[a1 fileURL];
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_filename(void *a1, const char *a2, ...)
{
  return _[a1 filename];
}

id objc_msgSend_filterBlockForLaunchServicesUTIs(void *a1, const char *a2, ...)
{
  return _[a1 filterBlockForLaunchServicesUTIs];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_fixedCoordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 fixedCoordinateSpace];
}

id objc_msgSend_flockContainer(void *a1, const char *a2, ...)
{
  return _[a1 flockContainer];
}

id objc_msgSend_forbidden(void *a1, const char *a2, ...)
{
  return _[a1 forbidden];
}

id objc_msgSend_fpItem(void *a1, const char *a2, ...)
{
  return _[a1 fpItem];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_fulfillImageRequest(void *a1, const char *a2, ...)
{
  return _[a1 fulfillImageRequest];
}

id objc_msgSend_getFileSystemRepresentation_maxLength_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getFileSystemRepresentation:maxLength:");
}

id objc_msgSend_handOffCancelledItems_withFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handOffCancelledItems:withFence:");
}

id objc_msgSend_handOffDroppedItems_withFence_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handOffDroppedItems:withFence:");
}

id objc_msgSend_hardwareDisplayIdentifierMatchingSystemShellHostingSpaceIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hardwareDisplayIdentifierMatchingSystemShellHostingSpaceIdentifier:");
}

id objc_msgSend_hardwareIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 hardwareIdentifier];
}

id objc_msgSend_hasActiveDragSession(void *a1, const char *a2, ...)
{
  return _[a1 hasActiveDragSession];
}

id objc_msgSend_hasLocation(void *a1, const char *a2, ...)
{
  return _[a1 hasLocation];
}

id objc_msgSend_heightAnchor(void *a1, const char *a2, ...)
{
  return _[a1 heightAnchor];
}

id objc_msgSend_hidesImage(void *a1, const char *a2, ...)
{
  return _[a1 hidesImage];
}

id objc_msgSend_hitTest_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hitTest:withEvent:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_ignoresAccessibilityFilters(void *a1, const char *a2, ...)
{
  return _[a1 ignoresAccessibilityFilters];
}

id objc_msgSend_imageComponent(void *a1, const char *a2, ...)
{
  return _[a1 imageComponent];
}

id objc_msgSend_imageDirty(void *a1, const char *a2, ...)
{
  return _[a1 imageDirty];
}

id objc_msgSend_incrementUIKitScalarValueBy_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementUIKitScalarValueBy:forKey:");
}

id objc_msgSend_incrementUIKitScalarValueForKnownInternalAppsForKey_bundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "incrementUIKitScalarValueForKnownInternalAppsForKey:bundleID:");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return _[a1 index];
}

id objc_msgSend_indexOfObjectIdenticalTo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObjectIdenticalTo:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_indexesOfObjectsPassingTest_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexesOfObjectsPassingTest:");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return _[a1 init];
}

id objc_msgSend_initForDeniedPasteWithBannerSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initForDeniedPasteWithBannerSource:");
}

id objc_msgSend_initWithAnnouncement_reply_bannerSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAnnouncement:reply:bannerSource:");
}

id objc_msgSend_initWithAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithAuditToken:");
}

id objc_msgSend_initWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithCapacity:");
}

id objc_msgSend_initWithClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:");
}

id objc_msgSend_initWithClient_isSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithClient:isSource:");
}

id objc_msgSend_initWithContextID_displayUUID_identifier_policy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContextID:displayUUID:identifier:policy:");
}

id objc_msgSend_initWithContinuationSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithContinuationSession:");
}

id objc_msgSend_initWithDUIPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDUIPreview:");
}

id objc_msgSend_initWithDelegate_initialFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDelegate:initialFrame:");
}

id objc_msgSend_initWithDisplayIdentity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDisplayIdentity:");
}

id objc_msgSend_initWithDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDragSession:");
}

id objc_msgSend_initWithExplanation_target_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExplanation:target:attributes:");
}

id objc_msgSend_initWithFilePresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFilePresenter:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithIdentifier_configuration_mainWindow_sourceConnection_accessibilityConnection_clientSource_delegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:configuration:mainWindow:sourceConnection:accessibilityConnection:clientSource:delegate:");
}

id objc_msgSend_initWithIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIndex:");
}

id objc_msgSend_initWithListenerEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithListenerEndpoint:");
}

id objc_msgSend_initWithLockHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLockHandler:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithMachServiceName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithMachServiceName:options:");
}

id objc_msgSend_initWithPBItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPBItem:");
}

id objc_msgSend_initWithPasteboardItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPasteboardItem:");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:");
}

id objc_msgSend_initWithQueue_eventHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:eventHandler:");
}

id objc_msgSend_initWithQueue_machServiceName_serviceDisplayName_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithQueue:machServiceName:serviceDisplayName:options:");
}

id objc_msgSend_initWithScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithScreen:");
}

id objc_msgSend_initWithSourceItemCollection_sourceAuditToken_dataProviderEndpoint_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSourceItemCollection:sourceAuditToken:dataProviderEndpoint:filter:");
}

id objc_msgSend_initWithSourceView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSourceView:");
}

id objc_msgSend_initWithSuiteName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSuiteName:");
}

id objc_msgSend_initWithText_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:style:");
}

id objc_msgSend_initWithText_style_accessoryView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithText:style:accessoryView:");
}

id objc_msgSend_initWithURL_readonly_extensionClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURL:readonly:extensionClass:");
}

id objc_msgSend_initWithURLWrapper_type_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithURLWrapper:type:");
}

id objc_msgSend_initWithWindowScene_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithWindowScene:");
}

id objc_msgSend_initialAccessibilityCentroid(void *a1, const char *a2, ...)
{
  return _[a1 initialAccessibilityCentroid];
}

id objc_msgSend_initialBadgeLocation(void *a1, const char *a2, ...)
{
  return _[a1 initialBadgeLocation];
}

id objc_msgSend_initialCentroidInSourceWindow(void *a1, const char *a2, ...)
{
  return _[a1 initialCentroidInSourceWindow];
}

id objc_msgSend_initiatedWithPointer(void *a1, const char *a2, ...)
{
  return _[a1 initiatedWithPointer];
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSubview_aboveSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSubview:aboveSubview:");
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return _[a1 integerValue];
}

id objc_msgSend_interactionWindow(void *a1, const char *a2, ...)
{
  return _[a1 interactionWindow];
}

id objc_msgSend_interfaceOrientation(void *a1, const char *a2, ...)
{
  return _[a1 interfaceOrientation];
}

id objc_msgSend_interfaceWithProtocol_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "interfaceWithProtocol:");
}

id objc_msgSend_intrinsicContentSize(void *a1, const char *a2, ...)
{
  return _[a1 intrinsicContentSize];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return _[a1 invalidate];
}

id objc_msgSend_invalidateImage(void *a1, const char *a2, ...)
{
  return _[a1 invalidateImage];
}

id objc_msgSend_invalidateImageForClient_itemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "invalidateImageForClient:itemIndex:");
}

id objc_msgSend_isAnotherDevice(void *a1, const char *a2, ...)
{
  return _[a1 isAnotherDevice];
}

id objc_msgSend_isAppleProcess(void *a1, const char *a2, ...)
{
  return _[a1 isAppleProcess];
}

id objc_msgSend_isBackedByFileProvider(void *a1, const char *a2, ...)
{
  return _[a1 isBackedByFileProvider];
}

id objc_msgSend_isContinuityDisplay(void *a1, const char *a2, ...)
{
  return _[a1 isContinuityDisplay];
}

id objc_msgSend_isEnsembleSupported(void *a1, const char *a2, ...)
{
  return _[a1 isEnsembleSupported];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isHitTestingDisabled(void *a1, const char *a2, ...)
{
  return _[a1 isHitTestingDisabled];
}

id objc_msgSend_isInPreviewTransition(void *a1, const char *a2, ...)
{
  return _[a1 isInPreviewTransition];
}

id objc_msgSend_isInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 isInvalidated];
}

id objc_msgSend_isMainDisplay(void *a1, const char *a2, ...)
{
  return _[a1 isMainDisplay];
}

id objc_msgSend_isManipulatingTransform(void *a1, const char *a2, ...)
{
  return _[a1 isManipulatingTransform];
}

id objc_msgSend_isNewItem(void *a1, const char *a2, ...)
{
  return _[a1 isNewItem];
}

id objc_msgSend_isOversized(void *a1, const char *a2, ...)
{
  return _[a1 isOversized];
}

id objc_msgSend_isPolicyDriven(void *a1, const char *a2, ...)
{
  return _[a1 isPolicyDriven];
}

id objc_msgSend_isReadonly(void *a1, const char *a2, ...)
{
  return _[a1 isReadonly];
}

id objc_msgSend_isSameProcessAsSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameProcessAsSource:");
}

id objc_msgSend_isSameTeamAsSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSameTeamAsSource:");
}

id objc_msgSend_isSource(void *a1, const char *a2, ...)
{
  return _[a1 isSource];
}

id objc_msgSend_itemCollection(void *a1, const char *a2, ...)
{
  return _[a1 itemCollection];
}

id objc_msgSend_itemCollectionForDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "itemCollectionForDestination:");
}

id objc_msgSend_itemIndex(void *a1, const char *a2, ...)
{
  return _[a1 itemIndex];
}

id objc_msgSend_itemLayouts(void *a1, const char *a2, ...)
{
  return _[a1 itemLayouts];
}

id objc_msgSend_itemModels(void *a1, const char *a2, ...)
{
  return _[a1 itemModels];
}

id objc_msgSend_itemViews(void *a1, const char *a2, ...)
{
  return _[a1 itemViews];
}

id objc_msgSend_items(void *a1, const char *a2, ...)
{
  return _[a1 items];
}

id objc_msgSend_justBecameVisible(void *a1, const char *a2, ...)
{
  return _[a1 justBecameVisible];
}

id objc_msgSend_keyEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 keyEnumerator];
}

id objc_msgSend_keyboardArbiter(void *a1, const char *a2, ...)
{
  return _[a1 keyboardArbiter];
}

id objc_msgSend_lastLayout(void *a1, const char *a2, ...)
{
  return _[a1 lastLayout];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_lastPathComponent(void *a1, const char *a2, ...)
{
  return _[a1 lastPathComponent];
}

id objc_msgSend_layer(void *a1, const char *a2, ...)
{
  return _[a1 layer];
}

id objc_msgSend_layoutDescriptionWithError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutDescriptionWithError:");
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 layoutIfNeeded];
}

id objc_msgSend_layoutWithInput_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "layoutWithInput:");
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_lift(void *a1, const char *a2, ...)
{
  return _[a1 lift];
}

id objc_msgSend_liftAnchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 liftAnchorPoint];
}

id objc_msgSend_liftAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "liftAtLocation:");
}

id objc_msgSend_loadInPlaceFileRepresentationForTypeIdentifier_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadInPlaceFileRepresentationForTypeIdentifier:completionHandler:");
}

id objc_msgSend_loadObjectOfClass_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadObjectOfClass:completionHandler:");
}

id objc_msgSend_loadWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadWithCompletionHandler:");
}

id objc_msgSend_localizedAnnouncementText(void *a1, const char *a2, ...)
{
  return _[a1 localizedAnnouncementText];
}

id objc_msgSend_localizedAuthorizationText(void *a1, const char *a2, ...)
{
  return _[a1 localizedAuthorizationText];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedDescription];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return _[a1 location];
}

id objc_msgSend_locationInView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "locationInView:");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_makeKeyAndVisible(void *a1, const char *a2, ...)
{
  return _[a1 makeKeyAndVisible];
}

id objc_msgSend_managingOrganizationInformation(void *a1, const char *a2, ...)
{
  return _[a1 managingOrganizationInformation];
}

id objc_msgSend_maxItemCount(void *a1, const char *a2, ...)
{
  return _[a1 maxItemCount];
}

id objc_msgSend_maximumResizableSize(void *a1, const char *a2, ...)
{
  return _[a1 maximumResizableSize];
}

id objc_msgSend_metadata(void *a1, const char *a2, ...)
{
  return _[a1 metadata];
}

id objc_msgSend_minimumResizableSize(void *a1, const char *a2, ...)
{
  return _[a1 minimumResizableSize];
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_model(void *a1, const char *a2, ...)
{
  return _[a1 model];
}

id objc_msgSend_modelsSortedByStackOrder(void *a1, const char *a2, ...)
{
  return _[a1 modelsSortedByStackOrder];
}

id objc_msgSend_monitorWithConfiguration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "monitorWithConfiguration:");
}

id objc_msgSend_movePointerDragToPoint_hidService_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "movePointerDragToPoint:hidService:");
}

id objc_msgSend_moveSessionWithID_toLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveSessionWithID:toLocation:");
}

id objc_msgSend_moveToLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveToLocation:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_needsImmediateTracking(void *a1, const char *a2, ...)
{
  return _[a1 needsImmediateTracking];
}

id objc_msgSend_newDataTransferSessionWithDestinationAuditToken_filter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newDataTransferSessionWithDestinationAuditToken:filter:");
}

id objc_msgSend_newSessionControllerForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "newSessionControllerForSession:");
}

id objc_msgSend_notifyDragMonitorsWithUpdatedPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifyDragMonitorsWithUpdatedPresentation:");
}

id objc_msgSend_notifySessionDidEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifySessionDidEnd:");
}

id objc_msgSend_notifySessionWillBegin_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifySessionWillBegin:");
}

id objc_msgSend_notifySessionWillBegin_configuration_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "notifySessionWillBegin:configuration:completion:");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return _[a1 object];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 objectEnumerator];
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_objectForSlot_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForSlot:");
}

id objc_msgSend_observeInterfaceOrientationUpdates(void *a1, const char *a2, ...)
{
  return _[a1 observeInterfaceOrientationUpdates];
}

id objc_msgSend_offset(void *a1, const char *a2, ...)
{
  return _[a1 offset];
}

id objc_msgSend_offsetAdjustment(void *a1, const char *a2, ...)
{
  return _[a1 offsetAdjustment];
}

id objc_msgSend_onenessConnectionWithQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "onenessConnectionWithQueue:");
}

id objc_msgSend_operation(void *a1, const char *a2, ...)
{
  return _[a1 operation];
}

id objc_msgSend_operationQueue_hasObservedEvent(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "operationQueue_hasObservedEvent");
}

id objc_msgSend_options(void *a1, const char *a2, ...)
{
  return _[a1 options];
}

id objc_msgSend_orgName(void *a1, const char *a2, ...)
{
  return _[a1 orgName];
}

id objc_msgSend_orientation(void *a1, const char *a2, ...)
{
  return _[a1 orientation];
}

id objc_msgSend_orientationObserver_orientationDidChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orientationObserver:orientationDidChange:");
}

id objc_msgSend_originalCenter(void *a1, const char *a2, ...)
{
  return _[a1 originalCenter];
}

id objc_msgSend_originalCenterInCoordinateSpace(void *a1, const char *a2, ...)
{
  return _[a1 originalCenterInCoordinateSpace];
}

id objc_msgSend_originalRotation(void *a1, const char *a2, ...)
{
  return _[a1 originalRotation];
}

id objc_msgSend_originalScale(void *a1, const char *a2, ...)
{
  return _[a1 originalScale];
}

id objc_msgSend_originatedFromAccessibility(void *a1, const char *a2, ...)
{
  return _[a1 originatedFromAccessibility];
}

id objc_msgSend_originatedFromContinuityDisplay(void *a1, const char *a2, ...)
{
  return _[a1 originatedFromContinuityDisplay];
}

id objc_msgSend_originatedFromPointer(void *a1, const char *a2, ...)
{
  return _[a1 originatedFromPointer];
}

id objc_msgSend_originatorDataOwner(void *a1, const char *a2, ...)
{
  return _[a1 originatorDataOwner];
}

id objc_msgSend_outAnimatorForOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "outAnimatorForOperation:");
}

id objc_msgSend_outsideAppSourceOperationMask(void *a1, const char *a2, ...)
{
  return _[a1 outsideAppSourceOperationMask];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_pendingRemovalControllers(void *a1, const char *a2, ...)
{
  return _[a1 pendingRemovalControllers];
}

id objc_msgSend_performAfterAnimationsComplete_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAfterAnimationsComplete:");
}

id objc_msgSend_performAfterReceivingOutsideAppSourceOperationMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performAfterReceivingOutsideAppSourceOperationMask:");
}

id objc_msgSend_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDropWithItemCollection:dataProviderEndpoint:visibleDroppedItems:completion:");
}

id objc_msgSend_performDropWithItemCollection_dataProviderEndpoint_visibleDroppedItems_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "performDropWithItemCollection:dataProviderEndpoint:visibleDroppedItems:reply:");
}

id objc_msgSend_persistentSceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 persistentSceneIdentifier];
}

id objc_msgSend_pointerWatchdogTimer(void *a1, const char *a2, ...)
{
  return _[a1 pointerWatchdogTimer];
}

id objc_msgSend_portalLayer(void *a1, const char *a2, ...)
{
  return _[a1 portalLayer];
}

id objc_msgSend_portalView(void *a1, const char *a2, ...)
{
  return _[a1 portalView];
}

id objc_msgSend_position(void *a1, const char *a2, ...)
{
  return _[a1 position];
}

id objc_msgSend_postBanner(void *a1, const char *a2, ...)
{
  return _[a1 postBanner];
}

id objc_msgSend_postPresentable_options_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "postPresentable:options:userInfo:error:");
}

id objc_msgSend_potentialDrop(void *a1, const char *a2, ...)
{
  return _[a1 potentialDrop];
}

id objc_msgSend_potentialDropDestinationClient(void *a1, const char *a2, ...)
{
  return _[a1 potentialDropDestinationClient];
}

id objc_msgSend_precise(void *a1, const char *a2, ...)
{
  return _[a1 precise];
}

id objc_msgSend_precisionMode(void *a1, const char *a2, ...)
{
  return _[a1 precisionMode];
}

id objc_msgSend_preferredBadgeStyle(void *a1, const char *a2, ...)
{
  return _[a1 preferredBadgeStyle];
}

id objc_msgSend_preferredContentSizeWithPresentationSize_containerSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredContentSizeWithPresentationSize:containerSize:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredPreviewIndexes(void *a1, const char *a2, ...)
{
  return _[a1 preferredPreviewIndexes];
}

id objc_msgSend_preferredRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 preferredRepresentation];
}

id objc_msgSend_preferredStackOrder(void *a1, const char *a2, ...)
{
  return _[a1 preferredStackOrder];
}

id objc_msgSend_prefersFullSizePreview(void *a1, const char *a2, ...)
{
  return _[a1 prefersFullSizePreview];
}

id objc_msgSend_presentationDidUpdate_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentationDidUpdate:forSession:");
}

id objc_msgSend_presentationLayer(void *a1, const char *a2, ...)
{
  return _[a1 presentationLayer];
}

id objc_msgSend_presentationSize(void *a1, const char *a2, ...)
{
  return _[a1 presentationSize];
}

id objc_msgSend_presentationValue(void *a1, const char *a2, ...)
{
  return _[a1 presentationValue];
}

id objc_msgSend_presenterPresentingURLWrapper_type_outURLWrapper_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presenterPresentingURLWrapper:type:outURLWrapper:");
}

id objc_msgSend_presenterValiditySeconds(void *a1, const char *a2, ...)
{
  return _[a1 presenterValiditySeconds];
}

id objc_msgSend_preview(void *a1, const char *a2, ...)
{
  return _[a1 preview];
}

id objc_msgSend_previewAndImageComponents(void *a1, const char *a2, ...)
{
  return _[a1 previewAndImageComponents];
}

id objc_msgSend_previewMode(void *a1, const char *a2, ...)
{
  return _[a1 previewMode];
}

id objc_msgSend_processIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 processIdentifier];
}

id objc_msgSend_progress(void *a1, const char *a2, ...)
{
  return _[a1 progress];
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return _[a1 properties];
}

id objc_msgSend_proxy(void *a1, const char *a2, ...)
{
  return _[a1 proxy];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return _[a1 queue];
}

id objc_msgSend_readingIntentWithURL_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "readingIntentWithURL:options:");
}

id objc_msgSend_recursivelyExportItem_toURL_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "recursivelyExportItem:toURL:completionHandler:");
}

id objc_msgSend_reduceBadgeAnimationSpring(void *a1, const char *a2, ...)
{
  return _[a1 reduceBadgeAnimationSpring];
}

id objc_msgSend_referenceScreenForViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "referenceScreenForViewModel:");
}

id objc_msgSend_registeredTypeIdentifiersWithFileOptions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registeredTypeIdentifiersWithFileOptions:");
}

id objc_msgSend_remoteObjectProxy(void *a1, const char *a2, ...)
{
  return _[a1 remoteObjectProxy];
}

id objc_msgSend_remoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "remoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return _[a1 removeAllObjects];
}

id objc_msgSend_removeFilePresenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeFilePresenter:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
}

id objc_msgSend_removeItemAtURL_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtURL:error:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsAtIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsAtIndexes:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeRepresentationOfType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeRepresentationOfType:");
}

id objc_msgSend_removeSession_immediately_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSession:immediately:");
}

id objc_msgSend_removeTouchID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTouchID:");
}

id objc_msgSend_removeTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeTouches:");
}

id objc_msgSend_renderID(void *a1, const char *a2, ...)
{
  return _[a1 renderID];
}

id objc_msgSend_representationConformingToType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "representationConformingToType:");
}

id objc_msgSend_representations(void *a1, const char *a2, ...)
{
  return _[a1 representations];
}

id objc_msgSend_representsPortal(void *a1, const char *a2, ...)
{
  return _[a1 representsPortal];
}

id objc_msgSend_requestDragPreviewsForIndexSet_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDragPreviewsForIndexSet:reply:");
}

id objc_msgSend_requestDropWithOperation_layerContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestDropWithOperation:layerContext:");
}

id objc_msgSend_requestGlobalMouseEventsForDisplay_targetContextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestGlobalMouseEventsForDisplay:targetContextID:");
}

id objc_msgSend_requestImagesForClient_itemIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImagesForClient:itemIndexes:");
}

id objc_msgSend_requestImagesForSessionID_client_itemIndexSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "requestImagesForSessionID:client:itemIndexSet:");
}

id objc_msgSend_resetDestinationClientForDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetDestinationClientForDragSession:");
}

id objc_msgSend_resetWithTimeout_leeway_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "resetWithTimeout:leeway:");
}

id objc_msgSend_resizable(void *a1, const char *a2, ...)
{
  return _[a1 resizable];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_reverseObjectEnumerator(void *a1, const char *a2, ...)
{
  return _[a1 reverseObjectEnumerator];
}

id objc_msgSend_revokePresentableWithRequestIdentifier_reason_animated_userInfo_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "revokePresentableWithRequestIdentifier:reason:animated:userInfo:error:");
}

id objc_msgSend_rootViewController(void *a1, const char *a2, ...)
{
  return _[a1 rootViewController];
}

id objc_msgSend_rotatable(void *a1, const char *a2, ...)
{
  return _[a1 rotatable];
}

id objc_msgSend_rotationDirection(void *a1, const char *a2, ...)
{
  return _[a1 rotationDirection];
}

id objc_msgSend_routingPolicy(void *a1, const char *a2, ...)
{
  return _[a1 routingPolicy];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return _[a1 scale];
}

id objc_msgSend_scaleFactor(void *a1, const char *a2, ...)
{
  return _[a1 scaleFactor];
}

id objc_msgSend_scaledSize(void *a1, const char *a2, ...)
{
  return _[a1 scaledSize];
}

id objc_msgSend_sceneIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 sceneIdentifier];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return _[a1 screen];
}

id objc_msgSend_sdkVersion(void *a1, const char *a2, ...)
{
  return _[a1 sdkVersion];
}

id objc_msgSend_sendDragEndedWithOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendDragEndedWithOperation:");
}

id objc_msgSend_sessionController_didUpdatePresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionController:didUpdatePresentation:");
}

id objc_msgSend_sessionController_requestImagesForClient_itemIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionController:requestImagesForClient:itemIndexes:");
}

id objc_msgSend_sessionController_setTouchOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionController:setTouchOffset:");
}

id objc_msgSend_sessionID(void *a1, const char *a2, ...)
{
  return _[a1 sessionID];
}

id objc_msgSend_sessionIDForViewModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionIDForViewModel:");
}

id objc_msgSend_sessionIsRestrictedToLocalDevice(void *a1, const char *a2, ...)
{
  return _[a1 sessionIsRestrictedToLocalDevice];
}

id objc_msgSend_sessionIsRestrictedToSourceApplication(void *a1, const char *a2, ...)
{
  return _[a1 sessionIsRestrictedToSourceApplication];
}

id objc_msgSend_sessionViewModelForAddingTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionViewModelForAddingTouch:");
}

id objc_msgSend_sessionViewModelForBeginningDragManipulationAtLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionViewModelForBeginningDragManipulationAtLocation:");
}

id objc_msgSend_sessionViewWillLayoutSubviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sessionViewWillLayoutSubviews:");
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return _[a1 set];
}

id objc_msgSend_setAccessibilityIgnoresInvertColors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessibilityIgnoresInvertColors:");
}

id objc_msgSend_setActiveSessionViewModelsForTouchID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActiveSessionViewModelsForTouchID:");
}

id objc_msgSend_setAdditionalTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdditionalTransform:");
}

id objc_msgSend_setAllViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllViews:");
}

id objc_msgSend_setAllowsEdgeAntialiasing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsEdgeAntialiasing:");
}

id objc_msgSend_setAllowsHitTesting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAllowsHitTesting:");
}

id objc_msgSend_setAlpha_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAlpha:");
}

id objc_msgSend_setAnchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorPoint:");
}

id objc_msgSend_setAnchorPointValueToAdjustToOnMoveToWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnchorPointValueToAdjustToOnMoveToWindow:");
}

id objc_msgSend_setAnimatesFlockItemSizeAlongsidePreviewTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimatesFlockItemSizeAlongsidePreviewTransition:");
}

id objc_msgSend_setAnimationBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAnimationBlock:");
}

id objc_msgSend_setAppliedTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppliedTransform:");
}

id objc_msgSend_setAppliesOriginalRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAppliesOriginalRotation:");
}

id objc_msgSend_setApplyOriginalRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setApplyOriginalRotation:");
}

id objc_msgSend_setAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuditToken:");
}

id objc_msgSend_setAuthorizationReplyBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAuthorizationReplyBlock:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBadge_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadge:");
}

id objc_msgSend_setBadgeAppeared_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeAppeared:");
}

id objc_msgSend_setBadgeContainer_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeContainer:");
}

id objc_msgSend_setBadgeLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeLayout:");
}

id objc_msgSend_setBadgeStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeStyle:");
}

id objc_msgSend_setBadgeView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBadgeView:");
}

id objc_msgSend_setBannerTimeoutDuration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBannerTimeoutDuration:");
}

id objc_msgSend_setBorderColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderColor:");
}

id objc_msgSend_setBorderWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBorderWidth:");
}

id objc_msgSend_setBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBounds:");
}

id objc_msgSend_setCancelHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCancelHandler:");
}

id objc_msgSend_setCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenter:");
}

id objc_msgSend_setCenterContentItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCenterContentItems:");
}

id objc_msgSend_setClientSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientSession:");
}

id objc_msgSend_setClientSessionReportedDragEnd_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClientSessionReportedDragEnd:");
}

id objc_msgSend_setClipsToBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setClipsToBounds:");
}

id objc_msgSend_setCompletionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionBlock:");
}

id objc_msgSend_setCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCompletionHandler:");
}

id objc_msgSend_setComponentView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setComponentView:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setConstrainSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConstrainSize:");
}

id objc_msgSend_setContainerBounds_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContainerBounds:");
}

id objc_msgSend_setContents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContents:");
}

id objc_msgSend_setContextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextID:");
}

id objc_msgSend_setContextIDsToExcludeFromHitTesting_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContextIDsToExcludeFromHitTesting:");
}

id objc_msgSend_setContinuationConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuationConnection:");
}

id objc_msgSend_setContinuityDisplayWantsDragsHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setContinuityDisplayWantsDragsHidden:");
}

id objc_msgSend_setCornerCurve_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerCurve:");
}

id objc_msgSend_setCornerRadius_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCornerRadius:");
}

id objc_msgSend_setCrossDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCrossDisplay:");
}

id objc_msgSend_setCurrentClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentClient:");
}

id objc_msgSend_setDataProviderEndpoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataProviderEndpoint:");
}

id objc_msgSend_setDataProviderEndpoint_auditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataProviderEndpoint:auditToken:");
}

id objc_msgSend_setDataTransferDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataTransferDelegate:");
}

id objc_msgSend_setDataTransferSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataTransferSession:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setDestinationAuditToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationAuditToken:");
}

id objc_msgSend_setDestinationIsAnotherDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDestinationIsAnotherDevice:");
}

id objc_msgSend_setDirection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDirection:");
}

id objc_msgSend_setDispatchQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDispatchQueue:");
}

id objc_msgSend_setDisplayIdentifierForSynthesizedTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayIdentifierForSynthesizedTouch:");
}

id objc_msgSend_setDisplayScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDisplayScale:");
}

id objc_msgSend_setExpectsStagedLegacySelectors_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExpectsStagedLegacySelectors:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setForbidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setForbidden:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHandler:");
}

id objc_msgSend_setHidden_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidden:");
}

id objc_msgSend_setHitTestingDisabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestingDisabled:");
}

id objc_msgSend_setHitTestsAsOpaque_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHitTestsAsOpaque:");
}

id objc_msgSend_setHysteresisTimeInterval_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHysteresisTimeInterval:");
}

id objc_msgSend_setImageComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageComponent:");
}

id objc_msgSend_setImageComponentByItemView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setImageComponentByItemView:");
}

id objc_msgSend_setInPreviewTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInPreviewTransition:");
}

id objc_msgSend_setIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndex:");
}

id objc_msgSend_setInitialCentroidInSourceContext_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInitialCentroidInSourceContext:");
}

id objc_msgSend_setInteractionWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInteractionWindow:");
}

id objc_msgSend_setInterruptionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInterruptionHandler:");
}

id objc_msgSend_setInvalidationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInvalidationHandler:");
}

id objc_msgSend_setIsAnotherDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsAnotherDevice:");
}

id objc_msgSend_setIsFromSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIsFromSource:");
}

id objc_msgSend_setItemCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemCount:");
}

id objc_msgSend_setItemIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemIndex:");
}

id objc_msgSend_setItemLayouts_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemLayouts:");
}

id objc_msgSend_setItemViews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setItemViews:");
}

id objc_msgSend_setJustBecameVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setJustBecameVisible:");
}

id objc_msgSend_setKeyboardTotalDisable_withFence_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardTotalDisable:withFence:completionHandler:");
}

id objc_msgSend_setLastLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLastLayout:");
}

id objc_msgSend_setLiftAnchorPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLiftAnchorPoint:");
}

id objc_msgSend_setLifted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLifted:");
}

id objc_msgSend_setLoaderBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLoaderBlock:");
}

id objc_msgSend_setLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocation:");
}

id objc_msgSend_setMaxItemCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxItemCount:");
}

id objc_msgSend_setMaximumResizableSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaximumResizableSize:");
}

id objc_msgSend_setMetadata_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMetadata:");
}

id objc_msgSend_setMinimumRequiredMovement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumRequiredMovement:");
}

id objc_msgSend_setMinimumResizableSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMinimumResizableSize:");
}

id objc_msgSend_setModel_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModel:");
}

id objc_msgSend_setModifiedPreviews_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModifiedPreviews:");
}

id objc_msgSend_setMultipleTouchEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMultipleTouchEnabled:");
}

id objc_msgSend_setNeedsImmediateTracking_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNeedsImmediateTracking:");
}

id objc_msgSend_setNeedsLayout(void *a1, const char *a2, ...)
{
  return _[a1 setNeedsLayout];
}

id objc_msgSend_setNewItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNewItem:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setOffset_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffset:");
}

id objc_msgSend_setOffsetAdjustment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOffsetAdjustment:");
}

id objc_msgSend_setOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOperation:");
}

id objc_msgSend_setOrientation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientation:");
}

id objc_msgSend_setOrientation_withDuration_direction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientation:withDuration:direction:");
}

id objc_msgSend_setOrientationRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOrientationRotation:");
}

id objc_msgSend_setOriginalCenter_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalCenter:");
}

id objc_msgSend_setOriginalRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalRotation:");
}

id objc_msgSend_setOriginalScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginalScale:");
}

id objc_msgSend_setOriginatorDataOwner_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOriginatorDataOwner:");
}

id objc_msgSend_setOverrideSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOverrideSize:");
}

id objc_msgSend_setPersistentSceneIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPersistentSceneIdentifier:");
}

id objc_msgSend_setPolicyDriven_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPolicyDriven:");
}

id objc_msgSend_setPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPosition:");
}

id objc_msgSend_setPotentialDrop_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPotentialDrop:");
}

id objc_msgSend_setPotentialDropDestinationClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPotentialDropDestinationClient:");
}

id objc_msgSend_setPotentialOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPotentialOperation:");
}

id objc_msgSend_setPrecisionMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrecisionMode:");
}

id objc_msgSend_setPreferredContentSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredContentSize:");
}

id objc_msgSend_setPreferredPreviewIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredPreviewIndexes:");
}

id objc_msgSend_setPreferredStackOrder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredStackOrder:");
}

id objc_msgSend_setPrefersFullSizePreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrefersFullSizePreview:");
}

id objc_msgSend_setPreview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreview:");
}

id objc_msgSend_setPreviewAndImageComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreviewAndImageComponents:");
}

id objc_msgSend_setPrimaryTitleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPrimaryTitleText:");
}

id objc_msgSend_setProcessIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProcessIdentifier:");
}

id objc_msgSend_setProgress_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProgress:");
}

id objc_msgSend_setRasterizationScale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRasterizationScale:");
}

id objc_msgSend_setReduceBadgeAnimationSpring_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setReduceBadgeAnimationSpring:");
}

id objc_msgSend_setRemoteObjectInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemoteObjectInterface:");
}

id objc_msgSend_setRenderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRenderID:");
}

id objc_msgSend_setResizable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setResizable:");
}

id objc_msgSend_setRole_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRole:");
}

id objc_msgSend_setRootViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootViewController:");
}

id objc_msgSend_setRotatable_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotatable:");
}

id objc_msgSend_setRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRotation:");
}

id objc_msgSend_setSecondaryTitleText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSecondaryTitleText:");
}

id objc_msgSend_setSessionIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSessionIdentifier:");
}

id objc_msgSend_setShouldEvictWhenDone_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldEvictWhenDone:");
}

id objc_msgSend_setShouldHideFlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldHideFlock:");
}

id objc_msgSend_setShouldRasterize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldRasterize:");
}

id objc_msgSend_setShownItemModels_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShownItemModels:");
}

id objc_msgSend_setSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSize:");
}

id objc_msgSend_setSourceContextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceContextID:");
}

id objc_msgSend_setSourceItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceItem:");
}

id objc_msgSend_setSourceItemCollection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceItemCollection:");
}

id objc_msgSend_setSourceRestrictsDragToLocalDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRestrictsDragToLocalDevice:");
}

id objc_msgSend_setSourceRestrictsDragToSelf_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSourceRestrictsDragToSelf:");
}

id objc_msgSend_setStackRotation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStackRotation:");
}

id objc_msgSend_setStartingPreviewTransition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStartingPreviewTransition:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setState:");
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setStyle:");
}

id objc_msgSend_setSupportsSystemDrag_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSupportsSystemDrag:");
}

id objc_msgSend_setTargetVelocity3D_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTargetVelocity3D:");
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setText:");
}

id objc_msgSend_setTextAlignment_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextAlignment:");
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextColor:");
}

id objc_msgSend_setTintColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTintColor:");
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:forState:");
}

id objc_msgSend_setTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouch:");
}

id objc_msgSend_setTouchOffset_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchOffset:forSession:");
}

id objc_msgSend_setTouchesCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTouchesCount:");
}

id objc_msgSend_setTrackingDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTrackingDelegate:");
}

id objc_msgSend_setTransform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransform:");
}

id objc_msgSend_setTransitionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitionHandler:");
}

id objc_msgSend_setTransitioningViewsByItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTransitioningViewsByItem:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setTypeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTypeIdentifier:");
}

id objc_msgSend_setUp(void *a1, const char *a2, ...)
{
  return _[a1 setUp];
}

id objc_msgSend_setUserInteractionEnabled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUserInteractionEnabled:");
}

id objc_msgSend_setUsesSynthesizedTouch_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUsesSynthesizedTouch:");
}

id objc_msgSend_setValue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setValue:");
}

id objc_msgSend_setVelocity3D_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVelocity3D:");
}

id objc_msgSend_setVelocity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVelocity:");
}

id objc_msgSend_setViewsByItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setViewsByItem:");
}

id objc_msgSend_setVisible_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setVisible:");
}

id objc_msgSend_setWantsElasticEffects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsElasticEffects:");
}

id objc_msgSend_setWantsFencing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWantsFencing:");
}

id objc_msgSend_setWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithCapacity:");
}

id objc_msgSend_setupWithAnnouncement_orMessage_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithAnnouncement:orMessage:reply:");
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return _[a1 sharedConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedObserver(void *a1, const char *a2, ...)
{
  return _[a1 sharedObserver];
}

id objc_msgSend_sharedSessionManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedSessionManager];
}

id objc_msgSend_shouldCoalesce_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldCoalesce:");
}

id objc_msgSend_shouldHideFlock(void *a1, const char *a2, ...)
{
  return _[a1 shouldHideFlock];
}

id objc_msgSend_shouldIgnoreRequest_fromDestination_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreRequest:fromDestination:");
}

id objc_msgSend_shouldUseGlassBackgroundEffect(void *a1, const char *a2, ...)
{
  return _[a1 shouldUseGlassBackgroundEffect];
}

id objc_msgSend_shownItemModels(void *a1, const char *a2, ...)
{
  return _[a1 shownItemModels];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_slotID(void *a1, const char *a2, ...)
{
  return _[a1 slotID];
}

id objc_msgSend_sortedArrayUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayUsingComparator:");
}

id objc_msgSend_sourceClient(void *a1, const char *a2, ...)
{
  return _[a1 sourceClient];
}

id objc_msgSend_sourceConnection(void *a1, const char *a2, ...)
{
  return _[a1 sourceConnection];
}

id objc_msgSend_sourceConnectionWasInvalidated(void *a1, const char *a2, ...)
{
  return _[a1 sourceConnectionWasInvalidated];
}

id objc_msgSend_sourceDisplayIdentifierForDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceDisplayIdentifierForDragSession:");
}

id objc_msgSend_sourceExpectsStagedLegacySelectors(void *a1, const char *a2, ...)
{
  return _[a1 sourceExpectsStagedLegacySelectors];
}

id objc_msgSend_sourceInteractionWindow(void *a1, const char *a2, ...)
{
  return _[a1 sourceInteractionWindow];
}

id objc_msgSend_sourceItem(void *a1, const char *a2, ...)
{
  return _[a1 sourceItem];
}

id objc_msgSend_sourceProcessInfo(void *a1, const char *a2, ...)
{
  return _[a1 sourceProcessInfo];
}

id objc_msgSend_sourceRestrictsDragToLocalDevice(void *a1, const char *a2, ...)
{
  return _[a1 sourceRestrictsDragToLocalDevice];
}

id objc_msgSend_sourceRestrictsDragToSelf(void *a1, const char *a2, ...)
{
  return _[a1 sourceRestrictsDragToSelf];
}

id objc_msgSend_sourceScreenForDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceScreenForDragSession:");
}

id objc_msgSend_sourceViewControllerForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sourceViewControllerForSession:");
}

id objc_msgSend_stackAlpha(void *a1, const char *a2, ...)
{
  return _[a1 stackAlpha];
}

id objc_msgSend_stackOffset(void *a1, const char *a2, ...)
{
  return _[a1 stackOffset];
}

id objc_msgSend_stackRotation(void *a1, const char *a2, ...)
{
  return _[a1 stackRotation];
}

id objc_msgSend_startAnimation(void *a1, const char *a2, ...)
{
  return _[a1 startAnimation];
}

id objc_msgSend_startSendingDelegateCallbacks(void *a1, const char *a2, ...)
{
  return _[a1 startSendingDelegateCallbacks];
}

id objc_msgSend_startingPreviewTransition(void *a1, const char *a2, ...)
{
  return _[a1 startingPreviewTransition];
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return _[a1 startup];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_stringByAppendingPathExtensionForType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathExtensionForType:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_strongToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 strongToStrongObjectsMapTable];
}

id objc_msgSend_style(void *a1, const char *a2, ...)
{
  return _[a1 style];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_superlayer(void *a1, const char *a2, ...)
{
  return _[a1 superlayer];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportsSystemDrag(void *a1, const char *a2, ...)
{
  return _[a1 supportsSystemDrag];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronousRemoteObjectProxyWithErrorHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronousRemoteObjectProxyWithErrorHandler:");
}

id objc_msgSend_synthesizesTouch(void *a1, const char *a2, ...)
{
  return _[a1 synthesizesTouch];
}

id objc_msgSend_systemDropAnimationForView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemDropAnimationForView:");
}

id objc_msgSend_systemLayoutSizeFittingSize_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "systemLayoutSizeFittingSize:");
}

id objc_msgSend_systemProcessIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 systemProcessIdentifier];
}

id objc_msgSend_systemShellHostingEnvironment(void *a1, const char *a2, ...)
{
  return _[a1 systemShellHostingEnvironment];
}

id objc_msgSend_systemShellHostingSpaceIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 systemShellHostingSpaceIdentifier];
}

id objc_msgSend_takePreviewAndImageComponents_forClient_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takePreviewAndImageComponents:forClient:");
}

id objc_msgSend_takeProcessAssertionOnPID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "takeProcessAssertionOnPID:");
}

id objc_msgSend_targetViewControllerForSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetViewControllerForSession:");
}

id objc_msgSend_targetWithPid_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "targetWithPid:");
}

id objc_msgSend_teamID(void *a1, const char *a2, ...)
{
  return _[a1 teamID];
}

id objc_msgSend_teardownPortalViewForDragSessionOriginatingFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardownPortalViewForDragSessionOriginatingFromViewController:");
}

id objc_msgSend_teardownPortalViewsForDragSessionOriginatingFromViewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "teardownPortalViewsForDragSessionOriginatingFromViewController:");
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return _[a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return _[a1 topAnchor];
}

id objc_msgSend_totalUnitCount(void *a1, const char *a2, ...)
{
  return _[a1 totalUnitCount];
}

id objc_msgSend_touch(void *a1, const char *a2, ...)
{
  return _[a1 touch];
}

id objc_msgSend_touchCancelledWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchCancelledWithID:");
}

id objc_msgSend_touchEndedWithID_contextID_pid_likelyMovingOffscreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchEndedWithID:contextID:pid:likelyMovingOffscreen:");
}

id objc_msgSend_touchIDs(void *a1, const char *a2, ...)
{
  return _[a1 touchIDs];
}

id objc_msgSend_touchOffset(void *a1, const char *a2, ...)
{
  return _[a1 touchOffset];
}

id objc_msgSend_touchTrackingWindow(void *a1, const char *a2, ...)
{
  return _[a1 touchTrackingWindow];
}

id objc_msgSend_touchTrackingWindow_touchesBegan_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchTrackingWindow:touchesBegan:");
}

id objc_msgSend_touchTrackingWindow_touchesCancelled_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchTrackingWindow:touchesCancelled:");
}

id objc_msgSend_touchTrackingWindow_touchesEnded_pairedWithVelocities_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchTrackingWindow:touchesEnded:pairedWithVelocities:");
}

id objc_msgSend_touchTrackingWindow_touchesMoved_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchTrackingWindow:touchesMoved:");
}

id objc_msgSend_touchTrackingWindowForHardwareDisplayIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchTrackingWindowForHardwareDisplayIdentifier:");
}

id objc_msgSend_touchesCancelled_withEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "touchesCancelled:withEvent:");
}

id objc_msgSend_touchesCount(void *a1, const char *a2, ...)
{
  return _[a1 touchesCount];
}

id objc_msgSend_trackingDelegate(void *a1, const char *a2, ...)
{
  return _[a1 trackingDelegate];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_transform(void *a1, const char *a2, ...)
{
  return _[a1 transform];
}

id objc_msgSend_transformForDisplayUUID_layerID_contextID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformForDisplayUUID:layerID:contextID:");
}

id objc_msgSend_transformToLocalWindowForCoordinateSpaceTransformToDisplay_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transformToLocalWindowForCoordinateSpaceTransformToDisplay:");
}

id objc_msgSend_transitionFromState_toTerminalState_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "transitionFromState:toTerminalState:");
}

id objc_msgSend_typeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 typeIdentifier];
}

id objc_msgSend_unionSet_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "unionSet:");
}

id objc_msgSend_unscaledAnchorPoint(void *a1, const char *a2, ...)
{
  return _[a1 unscaledAnchorPoint];
}

id objc_msgSend_unscaledSize(void *a1, const char *a2, ...)
{
  return _[a1 unscaledSize];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateDragManipulationWithLocation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateDragManipulationWithLocation:");
}

id objc_msgSend_updateLocation_ofTouchID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocation:ofTouchID:");
}

id objc_msgSend_updateLocationWithoutTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocationWithoutTouches:");
}

id objc_msgSend_updateMDMName(void *a1, const char *a2, ...)
{
  return _[a1 updateMDMName];
}

id objc_msgSend_updateRoutingPolicy_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRoutingPolicy:");
}

id objc_msgSend_updateRoutingPolicy_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateRoutingPolicy:forSession:");
}

id objc_msgSend_updateSceneIdentifiersWithLayout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateSceneIdentifiersWithLayout:");
}

id objc_msgSend_updateWithTouches_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateWithTouches:");
}

id objc_msgSend_updatedPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updatedPresentation:");
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return _[a1 url];
}

id objc_msgSend_usesSynthesizedTouch(void *a1, const char *a2, ...)
{
  return _[a1 usesSynthesizedTouch];
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return _[a1 value];
}

id objc_msgSend_valueForEntitlement_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForEntitlement:");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForKey:");
}

id objc_msgSend_valueWithCGPoint_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueWithCGPoint:");
}

id objc_msgSend_velocity(void *a1, const char *a2, ...)
{
  return _[a1 velocity];
}

id objc_msgSend_velocity3D(void *a1, const char *a2, ...)
{
  return _[a1 velocity3D];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewController_didUpdatePresentation_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController:didUpdatePresentation:forSession:");
}

id objc_msgSend_viewController_requestImagesForSessionID_client_itemIndexes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController:requestImagesForSessionID:client:itemIndexes:");
}

id objc_msgSend_viewController_setTouchOffset_forSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewController:setTouchOffset:forSession:");
}

id objc_msgSend_viewModelForSessionID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModelForSessionID:");
}

id objc_msgSend_viewModelInvalidated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "viewModelInvalidated:");
}

id objc_msgSend_viewsByItem(void *a1, const char *a2, ...)
{
  return _[a1 viewsByItem];
}

id objc_msgSend_virtualHIDServiceForWindow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "virtualHIDServiceForWindow:");
}

id objc_msgSend_visibility(void *a1, const char *a2, ...)
{
  return _[a1 visibility];
}

id objc_msgSend_visibleDroppedItemsForSession_transform_targetScreen_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleDroppedItemsForSession:transform:targetScreen:");
}

id objc_msgSend_visibleDroppedItemsInTargetScreen_transform_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "visibleDroppedItemsInTargetScreen:transform:");
}

id objc_msgSend_waitUntilAllOperationsAreFinished(void *a1, const char *a2, ...)
{
  return _[a1 waitUntilAllOperationsAreFinished];
}

id objc_msgSend_wantsElasticEffects(void *a1, const char *a2, ...)
{
  return _[a1 wantsElasticEffects];
}

id objc_msgSend_wantsPresentationUpdates(void *a1, const char *a2, ...)
{
  return _[a1 wantsPresentationUpdates];
}

id objc_msgSend_weakObjectsHashTable(void *a1, const char *a2, ...)
{
  return _[a1 weakObjectsHashTable];
}

id objc_msgSend_weakToStrongObjectsMapTable(void *a1, const char *a2, ...)
{
  return _[a1 weakToStrongObjectsMapTable];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return _[a1 window];
}

id objc_msgSend_windowScene(void *a1, const char *a2, ...)
{
  return _[a1 windowScene];
}

id objc_msgSend_xpcQueue(void *a1, const char *a2, ...)
{
  return _[a1 xpcQueue];
}

id objc_msgSend_xpcQueue_acceptNewDestinationConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_acceptNewDestinationConnection:");
}

id objc_msgSend_xpcQueue_acceptNewSourceConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_acceptNewSourceConnection:");
}

id objc_msgSend_xpcQueue_accessibilityDragSessionForEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_accessibilityDragSessionForEvents");
}

id objc_msgSend_xpcQueue_addDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_addDragSession:");
}

id objc_msgSend_xpcQueue_canAcceptDestinationConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_canAcceptDestinationConnection:");
}

id objc_msgSend_xpcQueue_canCreateNewDragSessionWithSourceConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_canCreateNewDragSessionWithSourceConnection:");
}

id objc_msgSend_xpcQueue_hasTouchBasedDragSessionForEventsForDisplayIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_hasTouchBasedDragSessionForEventsForDisplayIdentifier:");
}

id objc_msgSend_xpcQueue_pointerDragSessionForEvents(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_pointerDragSessionForEvents");
}

id objc_msgSend_xpcQueue_removeDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_removeDragSession:");
}

id objc_msgSend_xpcQueue_shouldAcceptNewDestinationConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_shouldAcceptNewDestinationConnection:");
}

id objc_msgSend_xpcQueue_shouldAcceptNewSourceConnection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_shouldAcceptNewSourceConnection:");
}

id objc_msgSend_xpcQueue_validateTouchStreamForDragSession_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "xpcQueue_validateTouchStreamForDragSession:");
}