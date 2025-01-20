void sub_5078(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  _Unwind_Resume(a1);
}

id LoggingProx(void)
{
  if (qword_19C28 != -1) {
    dispatch_once(&qword_19C28, &stru_14728);
  }
  v0 = (void *)qword_19C20;

  return v0;
}

id SignpostProx(void)
{
  if (qword_19C38 != -1) {
    dispatch_once(&qword_19C38, &stru_14748);
  }
  v0 = (void *)qword_19C30;

  return v0;
}

void sub_51D8(id a1)
{
  v1 = LoggingProx();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_0, v1, OS_LOG_TYPE_DEFAULT, "Creating shared instance of AppleProxNotificationTTR", v4, 2u);
  }

  uint64_t v2 = objc_opt_new();
  v3 = (void *)qword_19C10;
  qword_19C10 = v2;
}

void sub_52A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_5300(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_53E8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_54F8(_Unwind_Exception *a1)
{
  v5 = v4;

  _Unwind_Resume(a1);
}

void sub_55E4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57B0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_57DC(uint64_t a1)
{
  v14[0] = kCFUserNotificationAlertHeaderKey;
  v14[1] = kCFUserNotificationAlertMessageKey;
  v15[0] = @"Lock button press detected while or just after device on head with display off";
  v15[1] = @"Please file a radar to add details about reason for button press";
  v14[2] = kCFUserNotificationDefaultButtonTitleKey;
  v14[3] = kCFUserNotificationAlternateButtonTitleKey;
  v15[2] = @"File Radar";
  v15[3] = @"Not Now";
  v14[4] = kCFUserNotificationOtherButtonTitleKey;
  v14[5] = kCFUserNotificationAlertTopMostKey;
  v15[4] = @"Never bother me again";
  v15[5] = &__kCFBooleanTrue;
  v14[6] = SBUserNotificationDismissOnLock;
  v15[6] = &__kCFBooleanFalse;
  CFDictionaryRef v2 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:7];
  SInt32 error = 0;
  objc_msgSend(*(id *)(a1 + 32), "setNotification:", CFUserNotificationCreate(0, 0.0, 3uLL, &error, v2));
  if ([*(id *)(a1 + 32) notification])
  {
    objc_msgSend(*(id *)(a1 + 32), "setSource:", CFUserNotificationCreateRunLoopSource(kCFAllocatorDefault, (CFUserNotificationRef)objc_msgSend(*(id *)(a1 + 32), "notification"), (CFUserNotificationCallBack)sub_5A28, 0));
    if ([*(id *)(a1 + 32) source])
    {
      Main = CFRunLoopGetMain();
      CFRunLoopAddSource(Main, (CFRunLoopSourceRef)[*(id *)(a1 + 32) source], kCFRunLoopCommonModes);
    }
    else
    {
      v5 = LoggingProx();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        sub_D5DC(v5, v6, v7, v8, v9, v10, v11, v12);
      }

      [*(id *)(a1 + 32) releaseNotification];
    }
  }
  else
  {
    v4 = LoggingProx();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_D560(&error, v4);
    }
  }
}

void sub_5A08(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_5A28(uint64_t a1, uint64_t a2)
{
  id v3 = +[AppleProxNotificationTTR sharedInstance];
  [v3 processNotificationResponse:a2];
}

void sub_5A80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

id sub_5B54(uint64_t a1)
{
  if ([*(id *)(a1 + 32) notification]) {
    CFUserNotificationCancel((CFUserNotificationRef)[*(id *)(a1 + 32) notification]);
  }
  CFDictionaryRef v2 = *(void **)(a1 + 32);

  return [v2 releaseNotification];
}

void sub_5D00(uint64_t a1)
{
  [*(id *)(a1 + 32) releaseNotification];
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2 == 2)
  {
    v16 = objc_opt_class();
    v17 = +[NSDate distantFuture];
    [v16 setNotBefore:v17];

    id v3 = LoggingProx();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Save no more notifications", v18, 2u);
    }
  }
  else
  {
    if (v2) {
      return;
    }
    id v3 = objc_opt_new();
    v4 = +[NSURLQueryItem queryItemWithName:@"ComponentID" value:@"725296"];
    [v3 addObject:v4];

    v5 = +[NSURLQueryItem queryItemWithName:@"ComponentName" value:@"AppleProxSupport"];
    [v3 addObject:v5];

    uint64_t v6 = +[NSURLQueryItem queryItemWithName:@"ComponentVersion" value:@"iOS"];
    [v3 addObject:v6];

    uint64_t v7 = +[NSURLQueryItem queryItemWithName:@"Classification" value:@"Serious Bug"];
    [v3 addObject:v7];

    uint64_t v8 = +[NSURLQueryItem queryItemWithName:@"Reproducibility" value:@"I Didn't Try"];
    [v3 addObject:v8];

    uint64_t v9 = +[NSURLQueryItem queryItemWithName:@"Title" value:@"Prox TTR - Forced Release"];
    [v3 addObject:v9];

    uint64_t v10 = +[NSURLQueryItem queryItemWithName:@"Description" value:@"Lock button press detected while or just after device on head with display off.\n\nPlease add details about why you pressed lock button twice:\n"];
    [v3 addObject:v10];

    uint64_t v11 = +[NSURLQueryItem queryItemWithName:@"IncludeDevicePrefixInTitle" value:@"1"];
    [v3 addObject:v11];

    uint64_t v12 = objc_opt_new();
    [v12 setScheme:@"tap-to-radar"];
    [v12 setHost:@"new"];
    [v12 setQueryItems:v3];
    v13 = LoggingProx();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Launching TTR", buf, 2u);
    }

    v14 = +[LSApplicationWorkspace defaultWorkspace];
    v15 = [v12 URL];
    [v14 openURL:v15 configuration:0 completionHandler:0];
  }
}

void sub_6014(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_60B8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_6144(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_6324(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained sendDayEvent];
}

void sub_636C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_6C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,void *a40)
{
  _Unwind_Resume(a1);
}

void sub_7018(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_7224(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_73D0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_74B4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_796C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10, void *a11, void *a12, void *a13, void *a14)
{
  _Unwind_Resume(a1);
}

void sub_7F34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,void *a24)
{
  _Unwind_Resume(a1);
}

void sub_81EC(id a1)
{
  qword_19C20 = (uint64_t)os_log_create("com.apple.AppleProxSupport", "backboard");

  _objc_release_x1();
}

void sub_8230(id a1)
{
  qword_19C30 = (uint64_t)os_log_create("com.apple.AppleProxSupport", "ProxSignpost");

  _objc_release_x1();
}

void sub_83B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8460(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, void *a15)
{
  _Unwind_Resume(a1);
}

void sub_8AE4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8D34(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_8F88(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9110(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_952C(_Unwind_Exception *a1)
{
  uint64_t v6 = v4;

  _Unwind_Resume(a1);
}

void sub_9774(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_9AB8(uint64_t a1)
{
  uint64_t v2 = LoggingProx();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Calling cancel handler", v5, 2u);
  }

  (*(void (**)(void))(*(void *)(*(void *)(a1 + 32) + 32) + 16))();
  uint64_t v3 = *(void *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(void *)(v3 + 32) = 0;
}

void sub_9C20(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A0B8(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_A0D0(void *a1, unsigned int (*a2)(void), uint64_t (*a3)(uint64_t, unsigned __int8 *, char *), uint64_t (*a4)(void, unsigned __int8 *, unsigned __int8 *))
{
  uint64_t v4 = a1[1];
  uint64_t v5 = a1[2];
  if ((unint64_t)(v4 - v5) < 2) {
    return 0;
  }
  a1[2] = v5 + 2;
  if ((unint64_t)(v4 - (v5 + 2)) < 4) {
    return 0;
  }
  uint64_t v8 = *a1 + v5 + 2;
  uint64_t v9 = v5 + 6;
  a1[2] = v9;
  unint64_t v10 = *(unsigned __int16 *)(v8 + 2);
  if (v4 - v9 < v10) {
    return 0;
  }
  a1[2] = v9 + v10;
  if (a2)
  {
    if (!a2(a1[3])) {
      return 0;
    }
  }

  return sub_A950((uint64_t)a1, a3, a4, 0);
}

void sub_A360(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A588(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_A748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t sub_A950(uint64_t a1, uint64_t (*a2)(uint64_t, unsigned __int8 *, char *), uint64_t (*a3)(void, unsigned __int8 *, unsigned __int8 *), uint64_t (*a4)(void))
{
  unint64_t v4 = *(void *)(a1 + 8);
  unint64_t v5 = *(void *)(a1 + 16);
  if (v4 <= v5) {
    return 1;
  }
  while (1)
  {
    unint64_t v10 = (unsigned __int8 *)(*(void *)a1 + v5);
    int v11 = (char)*v10;
    if ((v11 & 0x80000000) == 0)
    {
      if (v4 - v5 < 0x12) {
        return 0;
      }
      int v12 = *v10;
      *(void *)(a1 + 16) = v5 + 18;
      if (v12 == 3)
      {
        if (a4 && (a4(*(void *)(a1 + 24)) & 1) == 0) {
          return 0;
        }
      }
      else
      {
        if (v4 - (v5 + 18) < 4) {
          return 0;
        }
        unint64_t v19 = v5 + 22;
        *(void *)(a1 + 16) = v19;
        unint64_t v20 = *((unsigned __int16 *)v10 + 10);
        if (v4 - v19 < v20) {
          return 0;
        }
        *(void *)(a1 + 16) = v19 + v20;
        if (v12 == 2)
        {
          if (a3)
          {
            uint64_t result = a3(*(void *)(a1 + 24), v10, v10 + 22);
            if (!result) {
              return result;
            }
          }
          goto LABEL_27;
        }
        if (v12 != 1) {
          return 0;
        }
        if (a2)
        {
          uint64_t v17 = *(void *)(a1 + 24);
          v18 = (char *)(v10 + 22);
LABEL_20:
          if ((a2(v17, v10, v18) & 1) == 0) {
            return 0;
          }
          goto LABEL_27;
        }
      }
      goto LABEL_27;
    }
    uint64_t v13 = *(void *)(a1 + 40);
    if (!v13) {
      return 0;
    }
    unsigned int v14 = v11 & 0x7F;
    if (v14 >= *(unsigned __int8 *)(a1 + 32)) {
      return 0;
    }
    v15 = (unsigned __int8 *)(v13 + 22 * v14);
    unint64_t v16 = *((unsigned __int16 *)v15 + 10);
    if (v4 - v5 <= v16) {
      return 0;
    }
    *(void *)(a1 + 16) = v5 + v16 + 1;
    if (*v15 == 1)
    {
      if (!a2) {
        goto LABEL_27;
      }
      uint64_t v17 = *(void *)(a1 + 24);
      v18 = (char *)(v10 + 1);
      unint64_t v10 = v15;
      goto LABEL_20;
    }
    if (a3 && (a3(*(void *)(a1 + 24), v15, v10 + 1) & 1) == 0) {
      return 0;
    }
LABEL_27:
    unint64_t v4 = *(void *)(a1 + 8);
    unint64_t v5 = *(void *)(a1 + 16);
    if (v4 <= v5) {
      return 1;
    }
  }
}

uint64_t sub_AAD8(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  int v5 = *(unsigned __int16 *)(a2 + 18);
  unsigned int v6 = *(unsigned __int16 *)(a2 + 20);
  if (v5 == 32794 && v6 >= 0x84)
  {
    *(void *)(a1 + 24) = a3;
    return 1;
  }
  if (v5 == 32817 && v6 >= 0x58)
  {
    *(void *)(a1 + 32) = a3;
    return 1;
  }
  if (v5 != 32803) {
    return 1;
  }
  uint64_t v7 = LoggingProx();
  uint64_t v8 = v7;
  if (v6 == 56)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = *a3;
      uint64_t v10 = *((void *)a3 + 1);
      double v11 = *((float *)a3 + 4);
      int v12 = a3[20];
      double v13 = *((float *)a3 + 6);
      double v14 = *((float *)a3 + 7);
      double v15 = *((float *)a3 + 8);
      double v16 = *((float *)a3 + 9);
      double v17 = *((float *)a3 + 10);
      int v18 = *((_DWORD *)a3 + 11);
      int v19 = a3[48];
      v22[0] = 67111680;
      v22[1] = v9;
      __int16 v23 = 2048;
      uint64_t v24 = v10;
      __int16 v25 = 2048;
      double v26 = v11;
      __int16 v27 = 1024;
      int v28 = v12;
      __int16 v29 = 2048;
      double v30 = v13;
      __int16 v31 = 2048;
      double v32 = v14;
      __int16 v33 = 2048;
      double v34 = v15;
      __int16 v35 = 2048;
      double v36 = v16;
      __int16 v37 = 2048;
      double v38 = v17;
      __int16 v39 = 1024;
      int v40 = v18;
      __int16 v41 = 1024;
      int v42 = v19;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "Received prox event #%u (ts:%llu) prox=%f state=%u signalRate=%fnA baseline=%fnA prob=%f habc=%f pocketBaseline=%f cookie=0x%x mode=%u", (uint8_t *)v22, 0x60u);
    }

    int v20 = (a3[20] & 1) << 6;
    *(_DWORD *)(a1 + 8) = v20;
    if ((a3[20] & 0x32) != 0) {
      *(_DWORD *)(a1 + 8) = ((a3[20] & 2) << 8) & 0xFAFF | ((((a3[20] & 0x10) >> 4) & 1) << 8) & 0xFFFFFBFF | ((((a3[20] & 0x20) >> 5) & 1) << 10) | v20;
    }
    *(_DWORD *)(a1 + 16) = *((_DWORD *)a3 + 8);
    *(void *)a1 = *((void *)a3 + 1);
    *(unsigned char *)(a1 + 12) = a3[48];
    uint64_t result = 1;
    *(unsigned char *)(a1 + 20) = 1;
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_DA6C(v8);
    }

    return 0;
  }
  return result;
}

void sub_AD18(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_AD38()
{
  v14[0] = @"flag";
  v14[1] = @"string";
  v15[0] = &off_15BF0;
  v15[1] = @"OscTrimFailure";
  v1 = +[NSDictionary dictionaryWithObjects:v15 forKeys:v14 count:2];
  v16[0] = v1;
  v12[0] = @"flag";
  v12[1] = @"string";
  v13[0] = &off_15C08;
  v13[1] = @"StuckInBlanking";
  uint64_t v2 = +[NSDictionary dictionaryWithObjects:v13 forKeys:v12 count:2];
  v16[1] = v2;
  v10[0] = @"flag";
  v10[1] = @"string";
  v11[0] = &off_15C20;
  v11[1] = @"StuckInRanging";
  uint64_t v3 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];
  v16[2] = v3;
  v8[0] = @"flag";
  v8[1] = @"string";
  v9[0] = &off_15C38;
  v9[1] = @"StuckInPearlSession";
  uint64_t v4 = +[NSDictionary dictionaryWithObjects:v9 forKeys:v8 count:2];
  v16[3] = v4;
  v6[0] = @"flag";
  v6[1] = @"string";
  v7[0] = &off_15C50;
  v7[1] = @"StuckInVHVSearch";
  int v5 = +[NSDictionary dictionaryWithObjects:v7 forKeys:v6 count:2];
  v16[4] = v5;
  qword_19C40 = +[NSArray arrayWithObjects:v16 count:5];
}

void sub_AF18(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

uint64_t variable initialization expression of AppleProxExclaveClient.log()
{
  return sub_DB20();
}

uint64_t sub_B11C()
{
  return sub_B19C();
}

uint64_t sub_B128(uint64_t a1)
{
  return sub_B1F0(a1, &OBJC_IVAR____TtC22AppleProxServiceFilter22AppleProxExclaveClient_proxExclaveService);
}

uint64_t (*sub_B134())()
{
  return j_j__swift_endAccess;
}

uint64_t sub_B190()
{
  return sub_B19C();
}

uint64_t sub_B19C()
{
  return swift_retain();
}

uint64_t sub_B1E4(uint64_t a1)
{
  return sub_B1F0(a1, &OBJC_IVAR____TtC22AppleProxServiceFilter22AppleProxExclaveClient_fdrDecodeRawDataStoreService);
}

uint64_t sub_B1F0(uint64_t a1, void *a2)
{
  uint64_t v4 = (void *)(v2 + *a2);
  swift_beginAccess();
  void *v4 = a1;
  return swift_release();
}

uint64_t (*sub_B240())()
{
  return j__swift_endAccess;
}

id AppleProxExclaveClient.__allocating_init(conclave:)()
{
  id v1 = objc_allocWithZone(v0);
  return _s22AppleProxServiceFilter0aB13ExclaveClientC8conclaveACSgSb_tcfc_0();
}

Swift::Bool __swiftcall AppleProxExclaveClient.loadCalibration(_:)(NSData a1)
{
  uint64_t v2 = v1;
  uint64_t v27 = sub_DAE0();
  uint64_t v4 = *(void *)(v27 - 8);
  __chkstk_darwin();
  unsigned int v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_DB00();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin();
  uint64_t v10 = (char *)&v26 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v11 = a1.super.isa;
  sub_BB70(v11);
  uint64_t v13 = v12;

  unint64_t v14 = *(void *)(v13 + 16);
  if (HIDWORD(v14))
  {
    Swift::Bool result = sub_DCF0();
    __break(1u);
  }
  else
  {
    int v28 = (char *)v2 + OBJC_IVAR____TtC22AppleProxServiceFilter22AppleProxExclaveClient_log;
    double v15 = sub_DB10();
    os_log_type_t v16 = sub_DC90();
    BOOL v17 = os_log_type_enabled(v15, v16);
    uint64_t v29 = v8;
    if (v17)
    {
      uint64_t v18 = v7;
      int v19 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)int v19 = 67109120;
      LODWORD(v30) = v14;
      sub_DCD0();
      _os_log_impl(&dword_0, v15, v16, "Sending raw data to FDR: %u bytes", v19, 8u);
      uint64_t v7 = v18;
      swift_slowDealloc();
    }

    (*(void (**)(char *, void, uint64_t))(v4 + 104))(v6, enum case for EXFDRDecodeClient.kExclaveFDRDecodeClientProxExclave(_:), v27);
    uint64_t v20 = sub_DAF0();
    (*(void (**)(uint64_t))&stru_68.segname[(swift_isaMask & *v2) + 8])(v20);
    sub_DAB0();
    swift_release();
    v21 = sub_DB10();
    os_log_type_t v22 = sub_DC90();
    if (os_log_type_enabled(v21, v22))
    {
      __int16 v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)__int16 v23 = 0;
      _os_log_impl(&dword_0, v21, v22, "Calling AppleProxExclave loadCalibration", v23, 2u);
      swift_slowDealloc();
    }

    (*(void (**)(void))&stru_68.sectname[swift_isaMask & *v2])();
    char v24 = sub_C5F8();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v10, v7);
    swift_release();
    return v24 & 1;
  }
  return result;
}

id AppleProxExclaveClient.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);

  return [v1 init];
}

void AppleProxExclaveClient.init()()
{
}

id AppleProxExclaveClient.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for AppleProxExclaveClient();
  return objc_msgSendSuper2(&v2, "dealloc");
}

void sub_B9E0(void *a1, unsigned char *a2, uint64_t a3)
{
  id v7 = v3;
  uint64_t v8 = sub_DCA0();

  v21 = a2;
  if (!a2 || !a3) {
    goto LABEL_5;
  }
  if (a3 < 0)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  if (v8 == sub_DCB0())
  {
LABEL_5:
    *a1 = v7;
    a1[1] = v8;
    return;
  }
  char v9 = sub_DCC0();
  id v10 = v7;
  uint64_t v11 = sub_DCA0();
  uint64_t v12 = sub_DCB0();

  if (v8 >= v11 && v8 < v12)
  {
    *a2 = v9;
    if (a3 == 1)
    {
      ++v8;
      goto LABEL_5;
    }
    uint64_t v20 = a1;
    uint64_t v13 = 1;
    while (a3 != v13)
    {
      uint64_t v14 = v8 + v13;
      if (v8 + v13 == sub_DCB0())
      {
        v8 += v13;
        goto LABEL_18;
      }
      char v15 = sub_DCC0();
      id v16 = v10;
      uint64_t v17 = sub_DCA0();
      uint64_t v18 = sub_DCB0();

      if (v14 < v17 || v14 >= v18) {
        goto LABEL_20;
      }
      uint64_t v19 = v13 + 1;
      v21[v13] = v15;
      uint64_t v13 = v19;
      if (a3 == v19)
      {
        v8 += v19;
LABEL_18:
        a1 = v20;
        goto LABEL_5;
      }
    }
    __break(1u);
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
LABEL_22:
  __break(1u);
}

void sub_BB70(void *a1)
{
  uint64_t v2 = sub_DCA0();
  uint64_t v3 = sub_DCB0();
  uint64_t v4 = sub_DCA0();
  uint64_t v5 = sub_DCB0();
  if (v2 < v4 || v5 < v2)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  uint64_t v6 = sub_DCA0();
  uint64_t v7 = sub_DCB0();
  if (v3 < v6 || v7 < v3) {
    goto LABEL_14;
  }
  BOOL v8 = __OFSUB__(v3, v2);
  uint64_t v9 = v3 - v2;
  if (v8)
  {
LABEL_15:
    __break(1u);
LABEL_16:
    __break(1u);
    return;
  }
  if (v9)
  {
    if (v9 < 1)
    {
      id v10 = &_swiftEmptyArrayStorage;
    }
    else
    {
      sub_C184(&qword_199F0);
      id v10 = (void *)swift_allocObject();
      size_t v11 = j__malloc_size(v10);
      *((void *)v10 + 2) = v9;
      *((void *)v10 + 3) = 2 * v11 - 64;
    }
    id v12 = a1;
    sub_B9E0(v15, (unsigned char *)v10 + 32, v9);
    uint64_t v14 = v13;

    if (v14 != v9) {
      goto LABEL_16;
    }
  }
}

id _s22AppleProxServiceFilter0aB13ExclaveClientC8conclaveACSgSb_tcfc_0()
{
  id v1 = v0;
  sub_DB20();
  uint64_t v2 = sub_DB10();
  os_log_type_t v3 = sub_DC90();
  if (os_log_type_enabled(v2, v3))
  {
    uint64_t v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v4 = 0;
    _os_log_impl(&dword_0, v2, v3, "Starting conclave...", v4, 2u);
    swift_slowDealloc();
  }

  type metadata accessor for AppleProxExclaveService.Service();
  sub_C2C0();
  sub_DC70();
  *(void *)&v1[OBJC_IVAR____TtC22AppleProxServiceFilter22AppleProxExclaveClient_proxExclaveService] = v10;
  sub_DAD0();
  swift_allocObject();
  *(void *)&v1[OBJC_IVAR____TtC22AppleProxServiceFilter22AppleProxExclaveClient_fdrDecodeRawDataStoreService] = sub_DAC0();
  uint64_t v5 = sub_DB10();
  uint64_t v6 = sub_DC90();
  if (os_log_type_enabled(v5, (os_log_type_t)v6))
  {
    uint64_t v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v7 = 0;
    _os_log_impl(&dword_0, v5, (os_log_type_t)v6, "Created Tightbeam clients", v7, 2u);
    swift_slowDealloc();
  }

  v9.receiver = v1;
  v9.super_class = (Class)type metadata accessor for AppleProxExclaveClient();
  return objc_msgSendSuper2(&v9, "init");
}

uint64_t sub_C184(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

uint64_t type metadata accessor for AppleProxExclaveClient()
{
  uint64_t result = qword_19C50;
  if (!qword_19C50) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_C214()
{
  return type metadata accessor for AppleProxExclaveClient();
}

uint64_t sub_C21C()
{
  uint64_t result = sub_DB30();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

unint64_t sub_C2C0()
{
  unint64_t result = qword_199F8;
  if (!qword_199F8)
  {
    type metadata accessor for AppleProxExclaveService.Service();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_199F8);
  }
  return result;
}

void type metadata accessor for TransportError()
{
  if (!qword_19A08)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_19A08);
    }
  }
}

uint64_t sub_C374()
{
  return swift_retain();
}

uint64_t sub_C37C(uint64_t a1)
{
  uint64_t v2 = sub_DBE0();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, a1, v2);
  sub_DC20();
  swift_allocObject();
  uint64_t v7 = sub_DC10();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(a1, v2);
  *(void *)(v6 + 16) = v7;
  return v6;
}

uint64_t sub_C4A0(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_DBE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
  sub_DC20();
  swift_allocObject();
  uint64_t v7 = sub_DC10();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v2 + 16) = v7;
  return v2;
}

uint64_t sub_C5B8(uint64_t a1)
{
  uint64_t result = swift_allocObject();
  *(void *)(result + 16) = a1;
  return result;
}

uint64_t sub_C5EC(uint64_t a1)
{
  *(void *)(v1 + 16) = a1;
  return v1;
}

uint64_t sub_C5F8()
{
  uint64_t v2 = sub_DB80();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  uint64_t v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_DBC0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = *(void *)(v0 + 16);
  sub_DBF0();
  if (!v1)
  {
    uint64_t v14 = v7;
    uint64_t v12 = v3;
    uint64_t v13 = v2;
    sub_DBD0();
    sub_DBA0(0x623D531D1AF33F27uLL);
    sub_DBB0();
    sub_DC00();
    swift_release();
    swift_retain();
    sub_DB70();
    LOBYTE(v10) = sub_DB40();
    swift_release();
    swift_release();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v5, v13);
    (*(void (**)(char *, uint64_t))(v14 + 8))(v9, v6);
  }
  return v10 & 1;
}

uint64_t sub_C840()
{
  swift_release();
  return v0;
}

uint64_t sub_C860()
{
  swift_release();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_C898@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4 = sub_DBE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_DC20();
  swift_allocObject();
  uint64_t v9 = sub_DC10();
  uint64_t result = (*(uint64_t (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  *(void *)(v8 + 16) = v9;
  *a2 = v8;
  return result;
}

uint64_t sub_C9C8@<X0>(uint64_t a1@<X8>)
{
  return sub_C9D4(v1 + 24, a1);
}

uint64_t sub_C9D4(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1 + 24);
  *(void *)(a2 + 24) = v3;
  *(void *)(a2 + 32) = *(void *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_CA38(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_DBE0();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin();
  uint64_t v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = swift_allocObject();
  sub_C9D4(a2, v8 + 24);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  sub_DC60();
  swift_allocObject();
  *(void *)(v8 + 16) = sub_DC50();
  sub_D3EC(&qword_19A10);
  swift_retain();
  sub_DC40();
  sub_CD40(a2);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return v8;
}

uint64_t sub_CBB0(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  uint64_t v6 = sub_DBE0();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin();
  uint64_t v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C9D4(a2, v3 + 24);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a1, v6);
  sub_DC60();
  swift_allocObject();
  *(void *)(v3 + 16) = sub_DC50();
  sub_D3EC(&qword_19A10);
  swift_retain();
  sub_DC40();
  sub_CD40(a2);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
  return v3;
}

uint64_t type metadata accessor for AppleProxExclaveService.Server()
{
  return self;
}

uint64_t sub_CD40(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

uint64_t sub_CD90(uint64_t a1)
{
  uint64_t v2 = v1;
  uint64_t v4 = sub_DBC0();
  uint64_t v5 = *(void *)(v4 - 8);
  ((void (*)(void))__chkstk_darwin)();
  __int16 v35 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_C184(&qword_19A18);
  uint64_t v7 = ((uint64_t (*)(void))__chkstk_darwin)();
  uint64_t v9 = (char *)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v7);
  uint64_t v11 = (char *)&v34 - v10;
  uint64_t v12 = sub_DB80();
  uint64_t v13 = *(void *)(v12 - 8);
  __chkstk_darwin(v12);
  char v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v16 = *(void (**)(char *, uint64_t))(v13 + 16);
  uint64_t v39 = v17;
  v16(v15, a1);
  uint64_t v36 = v4;
  uint64_t v37 = v5;
  uint64_t v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v18(v11, 1, 1, v4);
  uint64_t v19 = sub_DB50();
  if (v19 == 0x623D531D1AF33F27)
  {
    uint64_t v20 = v2 + 3;
    uint64_t v21 = v2[6];
    uint64_t v22 = v2[7];
    sub_D2AC(v20, v21);
    char v23 = (*(uint64_t (**)(uint64_t, uint64_t))(v22 + 8))(v21, v22);
    uint64_t v24 = (uint64_t)v15;
    uint64_t v25 = v38;
    sub_DB60();
    if (v25)
    {
      (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v39);
      sub_D2F0((uint64_t)v11);
    }
    else
    {
      uint64_t v26 = v36;
      v18(v9, 0, 1, v36);
      uint64_t v27 = (uint64_t)v9;
      uint64_t v28 = v26;
      sub_D350(v27, (uint64_t)v11);
      uint64_t v29 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v37 + 48);
      if (!v29(v11, 1, v26)) {
        sub_DB90(v23 & 1);
      }
      if (v29(v11, 1, v26))
      {
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v39);
        uint64_t v24 = 0;
      }
      else
      {
        uint64_t v30 = v37;
        __int16 v31 = v35;
        (*(void (**)(char *, char *, uint64_t))(v37 + 16))(v35, v11, v26);
        uint64_t v24 = sub_DBB0();
        (*(void (**)(char *, uint64_t))(v30 + 8))(v31, v28);
        (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v39);
      }
      sub_D2F0((uint64_t)v11);
    }
    return v24;
  }
  else
  {
    uint64_t v33 = v19;
    uint64_t v40 = 0;
    unint64_t v41 = 0xE000000000000000;
    sub_DCE0(56);
    v43._object = (void *)0x8000000000011290;
    v43._countAndFlagsBits = 0xD000000000000036;
    sub_DC80(v43);
    uint64_t v42 = v33;
    v44._countAndFlagsBits = sub_DD10();
    sub_DC80(v44);
    swift_bridgeObjectRelease();
    uint64_t result = sub_DD00();
    __break(1u);
  }
  return result;
}

uint64_t sub_D1D4()
{
  return sub_DC30();
}

uint64_t sub_D1F8()
{
  swift_release();
  sub_CD40(v0 + 24);
  return v0;
}

uint64_t sub_D220()
{
  swift_release();
  sub_CD40(v0 + 24);

  return _swift_deallocClassInstance(v0, 64, 7);
}

uint64_t sub_D260(uint64_t a1)
{
  return sub_CD90(a1);
}

uint64_t sub_D284()
{
  return v0;
}

uint64_t sub_D28C()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t sub_D29C()
{
  return swift_allocObject();
}

void *sub_D2AC(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_D2F0(uint64_t a1)
{
  uint64_t v2 = sub_C184(&qword_19A18);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_D350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_C184(&qword_19A18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_D3B8()
{
  return sub_D3EC(&qword_19A20);
}

uint64_t sub_D3EC(unint64_t *a1)
{
  uint64_t result = *a1;
  if (!result)
  {
    type metadata accessor for AppleProxExclaveService.Server();
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t type metadata accessor for AppleProxExclaveService()
{
  return self;
}

uint64_t type metadata accessor for AppleProxExclaveService.Service()
{
  return self;
}

void sub_D478(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D4B0(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "UserNotification for TTR not allowed until %@", (uint8_t *)&v2, 0xCu);
}

void sub_D528(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D560(int *a1, NSObject *a2)
{
  int v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Couldn't create TTR notification (%d)", (uint8_t *)v3, 8u);
}

void sub_D5DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_D614(unsigned __int8 *a1, uint64_t a2, os_log_t log)
{
  int v3 = *a1;
  int v4 = 134218240;
  uint64_t v5 = a2;
  __int16 v6 = 1024;
  int v7 = v3;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "handleFaultsReport: Invalid size %zu for %u errors", (uint8_t *)&v4, 0x12u);
}

void sub_D6A0(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Send Analytics %@ = %@", (uint8_t *)&v3, 0x16u);
}

void sub_D728(uint64_t a1, NSObject *a2)
{
  int v2 = 138412546;
  CFStringRef v3 = @"PlCl";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Cannot find FDR data for classes %@:%@", (uint8_t *)&v2, 0x16u);
}

void sub_D7B4(void **a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 138412290;
  __int16 v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error in AddSubCCForClass:%@", (uint8_t *)&v3, 0xCu);
}

void sub_D840(void **a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 138412290;
  __int16 v4 = v2;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Error in BeginWithOptions:%@", (uint8_t *)&v3, 0xCu);
}

void sub_D8CC(uint64_t a1, char a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 1024;
  int v6 = a2 & 1;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "clientNotification %@ added: %d", (uint8_t *)&v3, 0x12u);
}

void sub_D958(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error parsing run packet", v1, 2u);
}

void sub_D99C()
{
  sub_AD00();
  sub_AD18(&dword_0, v0, v1, "Cannot find FDR data for class '%@': %@");
}

void sub_DA04()
{
  sub_AD00();
  sub_AD18(&dword_0, v0, v1, "Cannot find FDR sub class '%@:%@'");
}

void sub_DA6C(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Prox event packet size mismatch", v1, 2u);
}

uint64_t sub_DAB0()
{
  return dispatch thunk of ExclaveFDRDecodeRawDataStoreKitClient.transferRawData(ctx:)();
}

uint64_t sub_DAC0()
{
  return ExclaveFDRDecodeRawDataStoreKitClient.init(conclaveID:)();
}

uint64_t sub_DAD0()
{
  return type metadata accessor for ExclaveFDRDecodeRawDataStoreKitClient();
}

uint64_t sub_DAE0()
{
  return type metadata accessor for EXFDRDecodeClient();
}

uint64_t sub_DAF0()
{
  return EXFDRDecodeTransferRawDataCtx.init(data:dataLength:clientExclave:)();
}

uint64_t sub_DB00()
{
  return type metadata accessor for EXFDRDecodeTransferRawDataCtx();
}

uint64_t sub_DB10()
{
  return Logger.logObject.getter();
}

uint64_t sub_DB20()
{
  return Logger.init(subsystem:category:)();
}

uint64_t sub_DB30()
{
  return type metadata accessor for Logger();
}

uint64_t sub_DB40()
{
  return TightbeamDecoder.decode(as:)();
}

uint64_t sub_DB50()
{
  return TightbeamDecoder.decode(as:)();
}

uint64_t sub_DB60()
{
  return TightbeamDecoder.encoder(bytes:capabilities:)();
}

uint64_t sub_DB70()
{
  return TightbeamDecoder.init(message:)();
}

uint64_t sub_DB80()
{
  return type metadata accessor for TightbeamDecoder();
}

void sub_DB90(Swift::Bool a1)
{
}

void sub_DBA0(Swift::UInt64 a1)
{
}

uint64_t sub_DBB0()
{
  return TightbeamEncoder.complete()();
}

uint64_t sub_DBC0()
{
  return type metadata accessor for TightbeamEncoder();
}

uint64_t sub_DBD0()
{
  return dispatch thunk of TightbeamMessage.encoder()();
}

uint64_t sub_DBE0()
{
  return type metadata accessor for TightbeamEndpoint();
}

uint64_t sub_DBF0()
{
  return ClientConnection.allocateMessage(size:capabilities:)();
}

uint64_t sub_DC00()
{
  return ClientConnection.send(message:)();
}

uint64_t sub_DC10()
{
  return ClientConnection.init(endpoint:)();
}

uint64_t sub_DC20()
{
  return type metadata accessor for ClientConnection();
}

uint64_t sub_DC30()
{
  return dispatch thunk of ServiceConnection.begin()();
}

uint64_t sub_DC40()
{
  return dispatch thunk of ServiceConnection.service.setter();
}

uint64_t sub_DC50()
{
  return ServiceConnection.init(endpoint:)();
}

uint64_t sub_DC60()
{
  return type metadata accessor for ServiceConnection();
}

uint64_t sub_DC70()
{
  return static Conclave.service<A>(for:as:)();
}

void sub_DC80(Swift::String a1)
{
}

uint64_t sub_DC90()
{
  return static os_log_type_t.default.getter();
}

uint64_t sub_DCA0()
{
  return NSData.startIndex.getter();
}

uint64_t sub_DCB0()
{
  return NSData.endIndex.getter();
}

uint64_t sub_DCC0()
{
  return NSData.subscript.getter();
}

uint64_t sub_DCD0()
{
  return UnsafeMutableRawBufferPointer.copyMemory(from:)();
}

void sub_DCE0(Swift::Int a1)
{
}

uint64_t sub_DCF0()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DD00()
{
  return _assertionFailure(_:_:file:line:flags:)();
}

uint64_t sub_DD10()
{
  return dispatch thunk of CustomStringConvertible.description.getter();
}

uint64_t AMFDRSealingMapCopyLocalDataForClass()
{
  return _AMFDRSealingMapCopyLocalDataForClass();
}

uint64_t AMFDRSealingMapCopyLocalDictForClass()
{
  return _AMFDRSealingMapCopyLocalDictForClass();
}

uint64_t AMFDRSealingMapCopyLocalMultiCombinedDataAddSubCCForClass()
{
  return _AMFDRSealingMapCopyLocalMultiCombinedDataAddSubCCForClass();
}

uint64_t AMFDRSealingMapCopyLocalMultiCombinedDataBeginWithOptions()
{
  return _AMFDRSealingMapCopyLocalMultiCombinedDataBeginWithOptions();
}

uint64_t AMFDRSealingMapCopyLocalMultiCombinedDataContextDestroy()
{
  return _AMFDRSealingMapCopyLocalMultiCombinedDataContextDestroy();
}

uint64_t AMFDRSealingMapCopyLocalMultiCombinedDataEnd()
{
  return _AMFDRSealingMapCopyLocalMultiCombinedDataEnd();
}

uint64_t AnalyticsSendEvent()
{
  return _AnalyticsSendEvent();
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

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
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

uint64_t IOHIDEventCreateProximtyProbabilityEvent()
{
  return _IOHIDEventCreateProximtyProbabilityEvent();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return _IOHIDEventGetIntegerValue();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return __swift_stdlib_bridgeErrorToNSError();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return __swift_stdlib_reportUnimplementedInitializer();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
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

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return _dispatch_walltime(when, delta);
}

uint64_t mach_absolute_time(void)
{
  return _mach_absolute_time();
}

uint64_t mach_get_times()
{
  return _mach_get_times();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return _mach_timebase_info(info);
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_allocWithZone(Class a1)
{
  return _objc_allocWithZone(a1);
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

uint64_t self
{
  return _self;
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return _os_signpost_enabled(log);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_deallocPartialClassInstance()
{
  return _swift_deallocPartialClassInstance();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_errorRelease()
{
  return _swift_errorRelease();
}

uint64_t swift_errorRetain()
{
  return _swift_errorRetain();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getSingletonMetadata()
{
  return _swift_getSingletonMetadata();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_slowAlloc()
{
  return _swift_slowAlloc();
}

uint64_t swift_slowDealloc()
{
  return _swift_slowDealloc();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend__floatToNsIntegerNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_floatToNsIntegerNumber:");
}

id objc_msgSend__floatToNsNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_floatToNsNumber:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_aggTimeout(void *a1, const char *a2, ...)
{
  return _[a1 aggTimeout];
}

id objc_msgSend_aggregateCallEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "aggregateCallEvent:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_builtIn(void *a1, const char *a2, ...)
{
  return _[a1 builtIn];
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return _[a1 cancel];
}

id objc_msgSend_cancelNotification(void *a1, const char *a2, ...)
{
  return _[a1 cancelNotification];
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "compare:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return _[a1 date];
}

id objc_msgSend_dateWithTimeIntervalSinceNow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dateWithTimeIntervalSinceNow:");
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return _[a1 defaultWorkspace];
}

id objc_msgSend_dictionaryForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryForKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_dispatchEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dispatchEvent:");
}

id objc_msgSend_distantFuture(void *a1, const char *a2, ...)
{
  return _[a1 distantFuture];
}

id objc_msgSend_distantPast(void *a1, const char *a2, ...)
{
  return _[a1 distantPast];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return _[a1 floatValue];
}

id objc_msgSend_handleAtlantisProxReleaseEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleAtlantisProxReleaseEvent:");
}

id objc_msgSend_handleCallEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCallEvent:");
}

id objc_msgSend_handleCurrentReport_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleCurrentReport:");
}

id objc_msgSend_handleFaultsReport_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleFaultsReport:size:");
}

id objc_msgSend_handleResidencyReport_size_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "handleResidencyReport:size:");
}

id objc_msgSend_initDriverDebugProperty(void *a1, const char *a2, ...)
{
  return _[a1 initDriverDebugProperty];
}

id objc_msgSend_initWithConclave_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithConclave:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_loadCalibration(void *a1, const char *a2, ...)
{
  return _[a1 loadCalibration];
}

id objc_msgSend_loadCalibration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadCalibration:");
}

id objc_msgSend_loadCalibrationExclave(void *a1, const char *a2, ...)
{
  return _[a1 loadCalibrationExclave];
}

id objc_msgSend_notBefore(void *a1, const char *a2, ...)
{
  return _[a1 notBefore];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return _[a1 notification];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return _[a1 now];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithDouble_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithDouble:");
}

id objc_msgSend_numberWithFloat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithFloat:");
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithInteger:");
}

id objc_msgSend_numberWithLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLong:");
}

id objc_msgSend_numberWithLongLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithLongLong:");
}

id objc_msgSend_numberWithUnsignedChar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedChar:");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_numberWithUnsignedLong_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedLong:");
}

id objc_msgSend_numberWithUnsignedShort_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedShort:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_openURL_configuration_completionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "openURL:configuration:completionHandler:");
}

id objc_msgSend_parseInputReport_withLength_withTimestamp_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "parseInputReport:withLength:withTimestamp:");
}

id objc_msgSend_probability(void *a1, const char *a2, ...)
{
  return _[a1 probability];
}

id objc_msgSend_processNotificationResponse_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "processNotificationResponse:");
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_proximityDetectionMask(void *a1, const char *a2, ...)
{
  return _[a1 proximityDetectionMask];
}

id objc_msgSend_proximityEvent_mask_probability_options_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "proximityEvent:mask:probability:options:");
}

id objc_msgSend_queryFDRCalibration_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryFDRCalibration:");
}

id objc_msgSend_queryFDRCalibration_subClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryFDRCalibration:subClass:");
}

id objc_msgSend_queryItemWithName_value_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "queryItemWithName:value:");
}

id objc_msgSend_releaseNotification(void *a1, const char *a2, ...)
{
  return _[a1 releaseNotification];
}

id objc_msgSend_reportCriticalError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reportCriticalError:");
}

id objc_msgSend_resetCallAggregations(void *a1, const char *a2, ...)
{
  return _[a1 resetCallAggregations];
}

id objc_msgSend_sendDayEvent(void *a1, const char *a2, ...)
{
  return _[a1 sendDayEvent];
}

id objc_msgSend_sendEvent_event_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:event:");
}

id objc_msgSend_sendNotification(void *a1, const char *a2, ...)
{
  return _[a1 sendNotification];
}

id objc_msgSend_sendNotificationTTR(void *a1, const char *a2, ...)
{
  return _[a1 sendNotificationTTR];
}

id objc_msgSend_senderID(void *a1, const char *a2, ...)
{
  return _[a1 senderID];
}

id objc_msgSend_setAggTimeout_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAggTimeout:");
}

id objc_msgSend_setBuiltIn_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBuiltIn:");
}

id objc_msgSend_setHost_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHost:");
}

id objc_msgSend_setNotBefore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotBefore:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setQueryItems_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueryItems:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setScheme_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setScheme:");
}

id objc_msgSend_setSenderID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSenderID:");
}

id objc_msgSend_setSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSource:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_shouldIgnoreError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shouldIgnoreError:");
}

id objc_msgSend_signatureWithDomain_type_subType_detectedProcess_triggerThresholdValues_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "signatureWithDomain:type:subType:detectedProcess:triggerThresholdValues:");
}

id objc_msgSend_snapshotWithSignature_delay_events_payload_actions_reply_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "snapshotWithSignature:delay:events:payload:actions:reply:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromDate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromDate:");
}

id objc_msgSend_timestamp(void *a1, const char *a2, ...)
{
  return _[a1 timestamp];
}

id objc_msgSend_timestampUsToAbsoluteMach_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "timestampUsToAbsoluteMach:");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return _[a1 type];
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntValue];
}

id objc_msgSend_updateDriverDebugProperty(void *a1, const char *a2, ...)
{
  return _[a1 updateDriverDebugProperty];
}

id objc_msgSend_vendorDefinedData(void *a1, const char *a2, ...)
{
  return _[a1 vendorDefinedData];
}

id objc_msgSend_vendorDefinedDataLength(void *a1, const char *a2, ...)
{
  return _[a1 vendorDefinedDataLength];
}

id objc_msgSend_vendorDefinedUsage(void *a1, const char *a2, ...)
{
  return _[a1 vendorDefinedUsage];
}

id objc_msgSend_vendorDefinedUsagePage(void *a1, const char *a2, ...)
{
  return _[a1 vendorDefinedUsagePage];
}

id objc_msgSend_vendorDefinedVersion(void *a1, const char *a2, ...)
{
  return _[a1 vendorDefinedVersion];
}