void sub_100006D4C(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  v5 = a2;
  v6 = handleForCategory();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000FC74();
    }

    [*(id *)(a1 + 32) resetState];
    [*(id *)(a1 + 32) showUnknownErrorAlertWithCode:a3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Rendering xmlui", v11, 2u);
    }

    v8 = [*(id *)(a1 + 32) remoteUIController];
    v9 = [*(id *)(a1 + 32) activeTokenChallenger];
    v10 = [v9 endpointBaseURL];
    [v8 loadData:v5 baseURL:v10];
  }
}

void sub_100007358(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

BOOL sub_10000737C(id a1, RUIElement *a2)
{
  uint64_t v2 = [(RUIElement *)a2 identifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"next"];

  return v3;
}

void sub_1000073C0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = handleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Next tapped", buf, 2u);
  }

  [WeakRetained transitionToState:3];
  v6 = [v3 visiblePage];

  if (v6)
  {
    v7 = [v3 visiblePage];
    v8 = [v7 view];
    [v8 endEditing:1];
  }
  [v3 startNavigationBarSpinnerWithTitle:&stru_100018BD0];
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000752C;
  block[3] = &unk_100018780;
  block[4] = *(void *)(a1 + 32);
  id v11 = v3;
  id v12 = WeakRetained;
  id v9 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_10000752C(id *a1)
{
  uint64_t v2 = [a1[4] authenticator];
  id v3 = a1[5];
  id v18 = 0;
  unint64_t v4 = (unint64_t)[v2 authenticateFromObjectModel:v3 outRequest:&v18];
  id v5 = v18;

  v6 = handleForCategory();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000FD14();
    }

    [a1[5] stopNavigationBarSpinner];
    [a1[5] activateElement:0 completion:0];
    id v8 = a1[6];
    if ((v4 & 0xFFFFFFFFFFFFFFFELL) == 0xFFFFFFFFFFFFFF36) {
      [v8 showUserAuthErrorAlert];
    }
    else {
      [v8 showUnknownErrorAlertWithCode:v4];
    }
    [a1[6] transitionToState:2];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "IDMS authentication succeed", buf, 2u);
    }

    [a1[6] transitionToState:4];
    id v9 = [a1[6] activeTokenChallenger];
    v10 = [a1[6] authenticator];
    id v11 = [v10 authKitSession];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100007704;
    v14[3] = &unk_100018758;
    id v12 = a1[5];
    id v13 = a1[6];
    id v15 = v12;
    id v16 = v13;
    [v9 startRequest:v5 session:v11 completion:v14];
  }
}

void sub_100007704(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  v6 = handleForCategory();
  v7 = v6;
  if (a3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_10000FD80();
    }

    [*(id *)(a1 + 32) stopNavigationBarSpinner];
    [*(id *)(a1 + 32) activateElement:0 completion:0];
    [*(id *)(a1 + 40) transitionToState:2];
    [*(id *)(a1 + 40) showUnknownErrorAlertWithCode:a3];
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loading unlock status", v11, 2u);
    }

    id v8 = [*(id *)(a1 + 40) remoteUIController];
    id v9 = [*(id *)(a1 + 40) activeTokenChallenger];
    v10 = [v9 endpointBaseURL];
    [v8 loadData:v5 baseURL:v10];
  }
}

void sub_1000078E8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

BOOL sub_100007904(id a1, RUIElement *a2)
{
  uint64_t v2 = [(RUIElement *)a2 identifier];
  unsigned __int8 v3 = [v2 isEqualToString:@"skip"];

  return v3;
}

void sub_100007948(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned __int8 v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "skip tapped", v3, 2u);
  }

  [WeakRetained transitionToState:5];
}

void sub_100008694(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_1000086B0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1000086DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_100009404(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100009504;
  block[3] = &unk_100018818;
  id v16 = v8;
  id v17 = v7;
  id v10 = *(id *)(a1 + 40);
  uint64_t v11 = *(void *)(a1 + 32);
  id v18 = v9;
  uint64_t v19 = v11;
  id v20 = v10;
  id v12 = v9;
  id v13 = v7;
  id v14 = v8;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_100009504(uint64_t a1)
{
  uint64_t v2 = handleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v3 = [*(id *)(a1 + 32) URL];
    int v16 = 138543362;
    id v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Response URL: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  unint64_t v4 = handleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v5 = [*(id *)(a1 + 32) allHeaderFields];
    int v16 = 138543362;
    id v17 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Response Headers: %{public}@", (uint8_t *)&v16, 0xCu);
  }
  if (*(void *)(a1 + 40))
  {
    v6 = handleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [objc_alloc((Class)NSString) initWithData:*(void *)(a1 + 40) encoding:4];
      int v16 = 138477827;
      id v17 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Response Body: %{private}@", (uint8_t *)&v16, 0xCu);
    }
  }
  if (*(void *)(a1 + 64))
  {
    if (*(void *)(a1 + 48))
    {
      id v8 = handleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_100010364(a1 + 48, v8, v9, v10, v11, v12, v13, v14);
      }

      id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    else
    {
      [*(id *)(a1 + 56) _sanityCheckBuddyMLResponse:*(void *)(a1 + 32) data:*(void *)(a1 + 40)];
      id v15 = *(void (**)(void))(*(void *)(a1 + 64) + 16);
    }
    v15();
  }
}

void sub_100009B24(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100009F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
}

void sub_100009F50(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v2 = [WeakRetained buttonEventMonitor];
  id v3 = objc_loadWeakRetained(v1);
  [v2 addTarget:v3 action:"handleButtonEvent:" forButtonEvents:0xFFFFFFFFLL propagate:0];
}

void sub_10000A304(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) buttonEventMonitor];
  [v2 removeTarget:*(void *)(a1 + 32)];
}

id sub_10000AD20(uint64_t a1)
{
  return [*(id *)(a1 + 32) activationLockComplete];
}

void sub_10000BADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000BB1C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000BB2C(uint64_t a1)
{
}

void sub_10000BB34(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109120;
    LODWORD(v19) = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight phase 1 success: %d", (uint8_t *)&v18, 8u);
  }

  uint64_t v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight phase 1 resultsPhase1: %@", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight phase 1 error: %@", (uint8_t *)&v18, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v8;
  id v17 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_10000BFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  uint64_t v19 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_10000C024(uint64_t a1, int a2, void *a3, void *a4)
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = handleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 67109120;
    LODWORD(v19) = a2;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 success: %d", (uint8_t *)&v18, 8u);
  }

  uint64_t v10 = handleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v7;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 results: %@", (uint8_t *)&v18, 0xCu);
  }

  uint64_t v11 = handleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Preflight phase 2 error: %@", (uint8_t *)&v18, 0xCu);
  }

  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  uint64_t v12 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v13 = *(void **)(v12 + 40);
  *(void *)(v12 + 40) = v7;
  id v14 = v7;

  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v8;
  id v17 = v8;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

uint64_t sub_10000C5A0()
{
  if (!qword_10001E160) {
    qword_10001E160 = _sl_dlopen();
  }
  return qword_10001E160;
}

uint64_t sub_10000C670()
{
  uint64_t result = _sl_dlopen();
  qword_10001E160 = result;
  return result;
}

Class sub_10000C6E4(uint64_t a1)
{
  if (!sub_10000C5A0())
  {
    id v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("DSHardwareButtonEventMonitor");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_10001E168 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    unint64_t v4 = (IDMSAuthenticator *)sub_100010824();
    return (Class)[(IDMSAuthenticator *)v4 authenticateFromObjectModel:v6 outRequest:v7];
  }
  return result;
}

void sub_10000D1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va1, a11);
  va_start(va, a11);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_10000D214(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000D224(uint64_t a1)
{
}

void sub_10000D22C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    id v7 = handleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_100010B24();
    }

    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = -202;
    goto LABEL_5;
  }
  if (!v5)
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = -203;
LABEL_5:
    *(void *)(v8 + 24) = v9;
    goto LABEL_12;
  }
  uint64_t v10 = [v5 objectForKeyedSubscript:AKAuthenticationAlternateDSIDKey];
  uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
  uint64_t v12 = *(void **)(v11 + 40);
  *(void *)(v11 + 40) = v10;

  uint64_t v13 = [v5 objectForKeyedSubscript:AKAuthenticationIDMSTokenKey];
  uint64_t v14 = [v13 objectForKeyedSubscript:@"com.apple.gs.corerepair.auth"];
  uint64_t v15 = *(void *)(*(void *)(a1 + 56) + 8);
  uint64_t v16 = *(void **)(v15 + 40);
  *(void *)(v15 + 40) = v14;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = -204;
    goto LABEL_5;
  }
  uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v9 = -205;
    goto LABEL_5;
  }
  *(void *)(v8 + 24) = 0;
  uint64_t v17 = handleForCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)int v18 = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Authenticated user credentials successfully.", v18, 2u);
  }

LABEL_12:
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

unint64_t sub_10000D904()
{
  type metadata accessor for ComponentsMapDataSource();
  uint64_t v0 = swift_allocObject();
  unint64_t result = sub_10000D990((uint64_t)&_swiftEmptyArrayStorage);
  *(void *)(v0 + 16) = result;
  qword_10001E688 = v0;
  return result;
}

uint64_t sub_10000D94C()
{
  uint64_t v0 = swift_allocObject();
  *(void *)(v0 + 16) = sub_10000D990((uint64_t)&_swiftEmptyArrayStorage);
  return v0;
}

unint64_t sub_10000D990(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    id v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_10000FA00((uint64_t *)&unk_10001E150);
  id v2 = (void *)sub_100010D40();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  unint64_t v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    uint64_t v5 = *(v4 - 3);
    uint64_t v6 = *(v4 - 2);
    uint64_t v8 = *(v4 - 1);
    uint64_t v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t result = sub_10000E9A4(v5, v6);
    if (v10) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v11 = (uint64_t *)(v2[6] + 16 * result);
    *uint64_t v11 = v5;
    v11[1] = v6;
    uint64_t v12 = (void *)(v2[7] + 16 * result);
    *uint64_t v12 = v8;
    v12[1] = v7;
    uint64_t v13 = v2[2];
    BOOL v14 = __OFADD__(v13, 1);
    uint64_t v15 = v13 + 1;
    if (v14) {
      goto LABEL_11;
    }
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_10000DAB4()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_10000DAEC(uint64_t a1)
{
  swift_beginAccess();
  *(void *)(v1 + 16) = a1;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_10000DB34())()
{
  return j__swift_endAccess;
}

uint64_t sub_10000DB8C()
{
  swift_bridgeObjectRelease();

  return _swift_deallocClassInstance(v0, 24, 7);
}

uint64_t sub_10000DBC4(char *a1, char *a2)
{
  return sub_10000DBD0(*a1, *a2);
}

uint64_t sub_10000DBD0(char a1, char a2)
{
  BOOL v2 = (a1 & 1) == 0;
  if (a1) {
    uint64_t v3 = 0x634164656B73616DLL;
  }
  else {
    uint64_t v3 = 0x7374726170;
  }
  if (v2) {
    unint64_t v4 = 0xE500000000000000;
  }
  else {
    unint64_t v4 = 0xED0000746E756F63;
  }
  if (a2) {
    uint64_t v5 = 0x634164656B73616DLL;
  }
  else {
    uint64_t v5 = 0x7374726170;
  }
  if (a2) {
    unint64_t v6 = 0xED0000746E756F63;
  }
  else {
    unint64_t v6 = 0xE500000000000000;
  }
  if (v3 == v5 && v4 == v6) {
    char v7 = 1;
  }
  else {
    char v7 = sub_100010D70();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

Swift::Int sub_10000DC80()
{
  return sub_100010D90();
}

uint64_t sub_10000DD0C()
{
  sub_100010D10();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_10000DD84()
{
  return sub_100010D90();
}

uint64_t sub_10000DE0C@<X0>(uint64_t *a1@<X0>, char *a2@<X8>)
{
  v8._countAndFlagsBits = *a1;
  uint64_t v3 = (void *)a1[1];
  v4._rawValue = &off_100018960;
  v8._object = v3;
  Swift::Int v5 = sub_100010D50(v4, v8);
  uint64_t result = swift_bridgeObjectRelease();
  if (v5 == 1) {
    char v7 = 1;
  }
  else {
    char v7 = 2;
  }
  if (!v5) {
    char v7 = 0;
  }
  *a2 = v7;
  return result;
}

void sub_10000DE6C(uint64_t *a1@<X8>)
{
  uint64_t v2 = 0x7374726170;
  if (*v1) {
    uint64_t v2 = 0x634164656B73616DLL;
  }
  unint64_t v3 = 0xE500000000000000;
  if (*v1) {
    unint64_t v3 = 0xED0000746E756F63;
  }
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_10000DEB4()
{
  if (*v0) {
    return 0x634164656B73616DLL;
  }
  else {
    return 0x7374726170;
  }
}

uint64_t sub_10000DEF8@<X0>(uint64_t a1@<X0>, void *a2@<X1>, char *a3@<X8>)
{
  v9._countAndFlagsBits = a1;
  v5._rawValue = &off_100018960;
  v9._object = a2;
  Swift::Int v6 = sub_100010D50(v5, v9);
  uint64_t result = swift_bridgeObjectRelease();
  if (v6 == 1) {
    char v8 = 1;
  }
  else {
    char v8 = 2;
  }
  if (!v6) {
    char v8 = 0;
  }
  *a3 = v8;
  return result;
}

uint64_t sub_10000DF5C()
{
  return 0;
}

void sub_10000DF68(unsigned char *a1@<X8>)
{
  *a1 = 2;
}

uint64_t sub_10000DF74(uint64_t a1)
{
  unint64_t v2 = sub_10000F9AC();

  return CodingKey.description.getter(a1, v2);
}

uint64_t sub_10000DFB0(uint64_t a1)
{
  unint64_t v2 = sub_10000F9AC();

  return CodingKey.debugDescription.getter(a1, v2);
}

uint64_t sub_10000DFEC@<X0>(Swift::String *a1@<X0>, uint64_t a2@<X8>)
{
  sub_100010C30();
  __chkstk_darwin();
  sub_100010C20();
  v64._countAndFlagsBits = 0;
  v64._object = (void *)0xE000000000000000;
  sub_100010C10(v64);
  v65._countAndFlagsBits = sub_10000EC78();
  sub_100010C00(v65);
  swift_bridgeObjectRelease();
  v66._countAndFlagsBits = 0;
  v66._object = (void *)0xE000000000000000;
  sub_100010C10(v66);
  sub_100010C50();
  uint64_t v4 = sub_100010CB0();
  uint64_t v6 = v5;
  char v8 = v7 & 1;
  uint64_t v50 = sub_100010CA0();
  uint64_t v49 = v9;
  uint64_t v51 = v10;
  char v45 = v11 & 1;
  sub_10000FB74(v4, v6, v8);
  swift_bridgeObjectRelease();
  uint64_t KeyPath = swift_getKeyPath();
  char v46 = sub_100010C90();
  uint64_t v12 = self;
  [v12 systemFontSize];
  sub_100010BD0();
  uint64_t v14 = v13;
  uint64_t v16 = v15;
  uint64_t v18 = v17;
  uint64_t v20 = v19;
  sub_100010C40();
  uint64_t v42 = sub_100010CB0();
  uint64_t v43 = v21;
  uint64_t v44 = v22;
  char v24 = v23 & 1;
  uint64_t v41 = swift_getKeyPath();
  sub_100010C20();
  v67._countAndFlagsBits = 0;
  v67._object = (void *)0xE000000000000000;
  sub_100010C10(v67);
  sub_100010C00(a1[2]);
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  sub_100010C10(v68);
  sub_100010C50();
  uint64_t v25 = sub_100010CB0();
  uint64_t v27 = v26;
  LOBYTE(v6) = v28 & 1;
  uint64_t v40 = sub_100010CA0();
  uint64_t v39 = v29;
  uint64_t v48 = v30;
  char v32 = v31 & 1;
  sub_10000FB74(v25, v27, v6);
  swift_bridgeObjectRelease();
  char v38 = sub_100010C80();
  [v12 systemFontSize];
  sub_100010BD0();
  *(_DWORD *)(a2 + 17) = *(_DWORD *)v63;
  *(_DWORD *)(a2 + 20) = *(_DWORD *)&v63[3];
  *(_DWORD *)(a2 + 34) = v61;
  *(_WORD *)(a2 + 38) = v62;
  *(_DWORD *)(a2 + 49) = *(_DWORD *)v60;
  *(_DWORD *)(a2 + 52) = *(_DWORD *)&v60[3];
  *(_DWORD *)(a2 + 60) = *(_DWORD *)&v59[3];
  *(_DWORD *)(a2 + 57) = *(_DWORD *)v59;
  *(_DWORD *)(a2 + 100) = *(_DWORD *)&v58[3];
  *(_DWORD *)(a2 + 97) = *(_DWORD *)v58;
  *(_DWORD *)(a2 + 124) = *(_DWORD *)&v57[3];
  *(_DWORD *)(a2 + 121) = *(_DWORD *)v57;
  *(_WORD *)(a2 + 142) = v56;
  *(_DWORD *)(a2 + 138) = v55;
  *(_DWORD *)(a2 + 156) = *(_DWORD *)&v54[3];
  *(_DWORD *)(a2 + 153) = *(_DWORD *)v54;
  *(_DWORD *)(a2 + 180) = *(_DWORD *)&v53[3];
  *(_DWORD *)(a2 + 177) = *(_DWORD *)v53;
  *(_DWORD *)(a2 + 196) = *(_DWORD *)&v52[3];
  *(_DWORD *)(a2 + 193) = *(_DWORD *)v52;
  *(void *)a2 = v50;
  *(void *)(a2 + 8) = v49;
  *(unsigned char *)(a2 + 16) = v45;
  *(void *)(a2 + 24) = v51;
  *(_WORD *)(a2 + 32) = 256;
  *(void *)(a2 + 40) = KeyPath;
  *(unsigned char *)(a2 + 48) = 1;
  *(unsigned char *)(a2 + 56) = v46;
  *(void *)(a2 + 64) = v14;
  *(void *)(a2 + 72) = v16;
  *(void *)(a2 + 80) = v18;
  *(void *)(a2 + 88) = v20;
  *(unsigned char *)(a2 + 96) = 0;
  *(void *)(a2 + 104) = v42;
  *(void *)(a2 + 112) = v43;
  *(unsigned char *)(a2 + 120) = v24;
  *(void *)(a2 + 128) = v44;
  *(_WORD *)(a2 + 136) = 256;
  *(void *)(a2 + 144) = v41;
  *(unsigned char *)(a2 + 152) = 1;
  *(void *)(a2 + 160) = v40;
  *(void *)(a2 + 168) = v39;
  *(unsigned char *)(a2 + 176) = v32;
  *(void *)(a2 + 184) = v48;
  *(unsigned char *)(a2 + 192) = v38;
  *(void *)(a2 + 200) = v33;
  *(void *)(a2 + 208) = v34;
  *(void *)(a2 + 216) = v35;
  *(void *)(a2 + 224) = v36;
  *(unsigned char *)(a2 + 232) = 0;
  sub_10000FB84(v50, v49, v45);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000FB84(v42, v43, v24);
  swift_bridgeObjectRetain();
  swift_retain();
  sub_10000FB84(v40, v39, v32);
  swift_bridgeObjectRetain();
  sub_10000FB74(v40, v39, v32);
  swift_bridgeObjectRelease();
  sub_10000FB74(v42, v43, v24);
  swift_release();
  swift_bridgeObjectRelease();
  sub_10000FB74(v50, v49, v45);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_10000E554()
{
  return sub_100010CE0();
}

double sub_10000E570@<D0>(uint64_t a1@<X8>)
{
  unint64_t v2 = v1;
  uint64_t v4 = sub_100010C60();
  sub_10000DFEC(v2, (uint64_t)v23);
  *(_OWORD *)((char *)&v25[11] + 7) = v23[11];
  *(_OWORD *)((char *)&v25[12] + 7) = v23[12];
  *(_OWORD *)((char *)&v25[13] + 7) = v24[0];
  v25[14] = *(_OWORD *)((char *)v24 + 9);
  *(_OWORD *)((char *)&v25[7] + 7) = v23[7];
  *(_OWORD *)((char *)&v25[8] + 7) = v23[8];
  *(_OWORD *)((char *)&v25[9] + 7) = v23[9];
  *(_OWORD *)((char *)&v25[10] + 7) = v23[10];
  *(_OWORD *)((char *)&v25[3] + 7) = v23[3];
  *(_OWORD *)((char *)&v25[4] + 7) = v23[4];
  *(_OWORD *)((char *)&v25[5] + 7) = v23[5];
  *(_OWORD *)((char *)&v25[6] + 7) = v23[6];
  *(_OWORD *)((char *)v25 + 7) = v23[0];
  *(_OWORD *)((char *)&v25[1] + 7) = v23[1];
  char v26 = 1;
  *(_OWORD *)((char *)&v25[2] + 7) = v23[2];
  LOBYTE(v2) = sub_100010C90();
  [self systemFontSize];
  sub_100010BD0();
  uint64_t v6 = v5;
  uint64_t v8 = v7;
  uint64_t v10 = v9;
  uint64_t v12 = v11;
  char v27 = 0;
  char v13 = sub_100010C70();
  long long v14 = v25[10];
  *(_OWORD *)(a1 + 193) = v25[11];
  long long v15 = v25[13];
  *(_OWORD *)(a1 + 209) = v25[12];
  *(_OWORD *)(a1 + 225) = v15;
  *(_OWORD *)(a1 + 241) = v25[14];
  long long v16 = v25[6];
  *(_OWORD *)(a1 + 129) = v25[7];
  long long v17 = v25[9];
  *(_OWORD *)(a1 + 145) = v25[8];
  *(_OWORD *)(a1 + 161) = v17;
  *(_OWORD *)(a1 + 177) = v14;
  long long v18 = v25[2];
  *(_OWORD *)(a1 + 65) = v25[3];
  long long v19 = v25[5];
  *(_OWORD *)(a1 + 81) = v25[4];
  *(_OWORD *)(a1 + 97) = v19;
  *(_OWORD *)(a1 + 113) = v16;
  long long v20 = v25[1];
  *(_OWORD *)(a1 + 17) = v25[0];
  *(_OWORD *)(a1 + 33) = v20;
  char v21 = v27;
  *(void *)a1 = v4;
  *(void *)(a1 + 8) = 0;
  *(unsigned char *)(a1 + 16) = 1;
  *(_OWORD *)(a1 + 49) = v18;
  *(unsigned char *)(a1 + 264) = (_BYTE)v2;
  *(void *)(a1 + 272) = v6;
  *(void *)(a1 + 280) = v8;
  *(void *)(a1 + 288) = v10;
  *(void *)(a1 + 296) = v12;
  *(unsigned char *)(a1 + 304) = v21;
  *(unsigned char *)(a1 + 312) = v13;
  double result = 0.0;
  *(_OWORD *)(a1 + 320) = 0u;
  *(_OWORD *)(a1 + 336) = 0u;
  *(unsigned char *)(a1 + 352) = 1;
  return result;
}

double sub_10000E77C@<D0>(void *a1@<X0>, _OWORD *a2@<X8>)
{
  sub_10000EEE0(a1, (uint64_t *)v6);
  if (!v2)
  {
    long long v5 = v6[1];
    *a2 = v6[0];
    a2[1] = v5;
    double result = *(double *)&v7;
    a2[2] = v7;
  }
  return result;
}

uint64_t sub_10000E7C0@<X0>(void *a1@<X8>)
{
  uint64_t v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

Swift::Void __swiftcall RemoteUIController.registerPartsInfoView(componentsMap:)(Swift::OpaquePointer componentsMap)
{
  if (qword_10001E170 != -1) {
    swift_once();
  }
  uint64_t v1 = *(void (**)(uint64_t))(*(void *)qword_10001E688 + 96);
  uint64_t v2 = swift_bridgeObjectRetain();
  v1(v2);
  sub_10000F168();

  sub_100010D20();
}

unint64_t sub_10000E9A4(uint64_t a1, uint64_t a2)
{
  sub_100010D80();
  sub_100010D10();
  Swift::Int v4 = sub_100010D90();

  return sub_10000EA1C(a1, a2, v4);
}

unint64_t sub_10000EA1C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    uint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_100010D70() & 1) == 0)
    {
      uint64_t v12 = ~v5;
      do
      {
        unint64_t v6 = (v6 + 1) & v12;
        if (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) == 0) {
          break;
        }
        char v13 = (void *)(v9 + 16 * v6);
        BOOL v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_100010D70() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_10000EB00@<X0>(unsigned char *a1@<X8>)
{
  uint64_t result = sub_100010BE0();
  *a1 = result;
  return result;
}

uint64_t sub_10000EB2C()
{
  return sub_100010BF0();
}

char *sub_10000EB54(char *a1, int64_t a2, char a3)
{
  uint64_t result = sub_10000EB74(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_10000EB74(char *result, int64_t a2, char a3, char *a4)
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
    sub_10000FA00(&qword_10001E148);
    uint64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 17;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    uint64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  char v13 = v10 + 32;
  BOOL v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8]) {
      memmove(v13, v14, 16 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return v10;
}

uint64_t sub_10000EC78()
{
  sub_10000FAD8();
  uint64_t v0 = sub_100010D30();
  int64_t v1 = *(void *)(v0 + 16);
  if (v1)
  {
    sub_10000EB54(0, v1, 0);
    uint64_t v2 = (uint64_t *)(v0 + 40);
    do
    {
      uint64_t v4 = *(v2 - 1);
      uint64_t v3 = *v2;
      uint64_t v5 = qword_10001E170;
      swift_bridgeObjectRetain();
      if (v5 != -1) {
        swift_once();
      }
      unint64_t v6 = *(uint64_t (**)(uint64_t))(*(void *)qword_10001E688 + 88);
      uint64_t v7 = swift_bridgeObjectRetain();
      uint64_t v8 = v6(v7);
      if (*(void *)(v8 + 16) && (unint64_t v9 = sub_10000E9A4(v4, v3), (v10 & 1) != 0))
      {
        int64_t v11 = (uint64_t *)(*(void *)(v8 + 56) + 16 * v9);
        uint64_t v12 = *v11;
        unint64_t v13 = v11[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
      }
      else
      {
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease_n();
        unint64_t v13 = 0xE700000000000000;
        uint64_t v12 = 0x6E776F6E6B6E55;
      }
      unint64_t v15 = _swiftEmptyArrayStorage[2];
      unint64_t v14 = _swiftEmptyArrayStorage[3];
      if (v15 >= v14 >> 1) {
        sub_10000EB54((char *)(v14 > 1), v15 + 1, 1);
      }
      v2 += 2;
      _swiftEmptyArrayStorage[2] = v15 + 1;
      long long v16 = (char *)&_swiftEmptyArrayStorage[2 * v15];
      *((void *)v16 + 4) = v12;
      *((void *)v16 + 5) = v13;
      --v1;
    }
    while (v1);
  }
  swift_bridgeObjectRelease();
  sub_10000FA00(&qword_10001E138);
  sub_10000FB2C(&qword_10001E140, &qword_10001E138);
  uint64_t v17 = sub_100010D00();
  swift_bridgeObjectRelease();
  return v17;
}

uint64_t sub_10000EEE0@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v5 = sub_10000FA00(&qword_10001E128);
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin();
  uint64_t v8 = (char *)&v21 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10000FA44(a1, a1[3]);
  uint64_t v9 = sub_100010DA0();
  if (v2) {
    return sub_10000FA88((uint64_t)a1);
  }
  uint64_t v12 = v10;
  uint64_t v23 = v9;
  char v24 = a2;
  sub_10000FA44(a1, a1[3]);
  sub_10000F9AC();
  swift_bridgeObjectRetain();
  sub_100010DB0();
  char v26 = 0;
  uint64_t v13 = sub_100010D60();
  uint64_t v15 = v14;
  char v25 = 1;
  swift_bridgeObjectRetain();
  uint64_t v16 = sub_100010D60();
  uint64_t v18 = v17;
  long long v19 = *(void (**)(char *, uint64_t))(v6 + 8);
  uint64_t v22 = v16;
  v19(v8, v5);
  swift_bridgeObjectRetain();
  sub_10000FA88((uint64_t)a1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t result = swift_bridgeObjectRelease();
  long long v20 = v24;
  *char v24 = v23;
  v20[1] = v12;
  v20[2] = v13;
  v20[3] = v15;
  v20[4] = v22;
  v20[5] = v18;
  return result;
}

unint64_t sub_10000F168()
{
  unint64_t result = qword_10001E000;
  if (!qword_10001E000)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E000);
  }
  return result;
}

unint64_t sub_10000F1C0()
{
  unint64_t result = qword_10001E008;
  if (!qword_10001E008)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E008);
  }
  return result;
}

unint64_t sub_10000F218()
{
  unint64_t result = qword_10001E010;
  if (!qword_10001E010)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E010);
  }
  return result;
}

unint64_t sub_10000F270()
{
  unint64_t result = qword_10001E018;
  if (!qword_10001E018)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E018);
  }
  return result;
}

unint64_t sub_10000F2C8()
{
  unint64_t result = qword_10001E020;
  if (!qword_10001E020)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E020);
  }
  return result;
}

unint64_t sub_10000F320()
{
  unint64_t result = qword_10001E028;
  if (!qword_10001E028)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E028);
  }
  return result;
}

unint64_t sub_10000F378()
{
  unint64_t result = qword_10001E030;
  if (!qword_10001E030)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E030);
  }
  return result;
}

uint64_t sub_10000F3CC(uint64_t a1)
{
  return _swift_getOpaqueTypeConformance2(a1, &unk_100017BB0, 1);
}

void *sub_10000F3E8()
{
  return &protocol witness table for String;
}

uint64_t type metadata accessor for ComponentsMapDataSource()
{
  return self;
}

uint64_t initializeBufferWithCopyOfBuffer for PartsInfoView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2 = *a2;
  *a1 = *a2;
  uint64_t v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for PartsInfoView()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return swift_bridgeObjectRelease();
}

void *initializeWithCopy for PartsInfoView(void *a1, void *a2)
{
  uint64_t v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  uint64_t v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  uint64_t v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

void *assignWithCopy for PartsInfoView(void *a1, void *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 initializeWithTake for PartsInfoView(uint64_t a1, uint64_t a2)
{
  __n128 result = *(__n128 *)a2;
  long long v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

void *assignWithTake for PartsInfoView(void *a1, void *a2)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  uint64_t v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  uint64_t v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for PartsInfoView(uint64_t a1, int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0 && *(unsigned char *)(a1 + 48)) {
    return *(_DWORD *)a1 + 0x80000000;
  }
  unint64_t v2 = *(void *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF) {
    LODWORD(v2) = -1;
  }
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for PartsInfoView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(void *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(void *)__n128 result = a2 ^ 0x80000000;
    if (a3 < 0) {
      *(unsigned char *)(result + 48) = 1;
    }
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2) {
        return result;
      }
LABEL_8:
      *(void *)(result + 8) = (a2 - 1);
      return result;
    }
    *(unsigned char *)(result + 48) = 0;
    if (a2) {
      goto LABEL_8;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for PartsInfoView()
{
  return &type metadata for PartsInfoView;
}

unsigned char *initializeBufferWithCopyOfBuffer for PartsInfoView.CodingKeys(unsigned char *result, unsigned char *a2)
{
  *__n128 result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for PartsInfoView.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  if (!a2) {
    return 0;
  }
  if (a2 < 0xFF) {
    goto LABEL_17;
  }
  if (a2 + 1 >= 0xFFFF00) {
    int v2 = 4;
  }
  else {
    int v2 = 2;
  }
  if ((a2 + 1) >> 8 < 0xFF) {
    int v3 = 1;
  }
  else {
    int v3 = v2;
  }
  if (v3 == 4)
  {
    int v4 = *(_DWORD *)(a1 + 1);
    if (v4) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
  else
  {
    if (v3 == 2)
    {
      int v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1)) {
        goto LABEL_17;
      }
      return (*a1 | (v4 << 8)) - 1;
    }
    int v4 = a1[1];
    if (a1[1]) {
      return (*a1 | (v4 << 8)) - 1;
    }
  }
LABEL_17:
  unsigned int v6 = *a1;
  BOOL v7 = v6 >= 2;
  int v8 = v6 - 2;
  if (!v7) {
    int v8 = -1;
  }
  return (v8 + 1);
}

unsigned char *storeEnumTagSinglePayload for PartsInfoView.CodingKeys(unsigned char *result, unsigned int a2, unsigned int a3)
{
  if (a3 + 1 >= 0xFFFF00) {
    int v3 = 4;
  }
  else {
    int v3 = 2;
  }
  if ((a3 + 1) >> 8 < 0xFF) {
    unsigned int v4 = 1;
  }
  else {
    unsigned int v4 = v3;
  }
  if (a3 >= 0xFF) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  if (a2 > 0xFE)
  {
    unsigned int v6 = ((a2 - 255) >> 8) + 1;
    *__n128 result = a2 + 1;
    switch(v5)
    {
      case 1:
        result[1] = v6;
        break;
      case 2:
        *(_WORD *)(result + 1) = v6;
        break;
      case 3:
LABEL_23:
        __break(1u);
        JUMPOUT(0x10000F7F4);
      case 4:
        *(_DWORD *)(result + 1) = v6;
        break;
      default:
        return result;
    }
  }
  else
  {
    switch(v5)
    {
      case 1:
        result[1] = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      case 2:
        *(_WORD *)(result + 1) = 0;
        goto LABEL_17;
      case 3:
        goto LABEL_23;
      case 4:
        *(_DWORD *)(result + 1) = 0;
        if (!a2) {
          return result;
        }
        goto LABEL_18;
      default:
LABEL_17:
        if (a2) {
LABEL_18:
        }
          *__n128 result = a2 + 1;
        break;
    }
  }
  return result;
}

uint64_t sub_10000F81C(unsigned __int8 *a1)
{
  return *a1;
}

unsigned char *sub_10000F828(unsigned char *result, char a2)
{
  *__n128 result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for PartsInfoView.CodingKeys()
{
  return &type metadata for PartsInfoView.CodingKeys;
}

unint64_t sub_10000F848()
{
  unint64_t result = qword_10001E0F0;
  if (!qword_10001E0F0)
  {
    sub_10000F8C4(&qword_10001E0F8);
    sub_10000F90C();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E0F0);
  }
  return result;
}

uint64_t sub_10000F8C4(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContextInMetadataState2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_10000F90C()
{
  unint64_t result = qword_10001E100;
  if (!qword_10001E100)
  {
    sub_10000F8C4(&qword_10001E108);
    sub_10000FB2C(&qword_10001E110, &qword_10001E118);
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E100);
  }
  return result;
}

unint64_t sub_10000F9AC()
{
  unint64_t result = qword_10001E120;
  if (!qword_10001E120)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E120);
  }
  return result;
}

uint64_t sub_10000FA00(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

void *sub_10000FA44(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_10000FA88(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_10000FAD8()
{
  unint64_t result = qword_10001E130;
  if (!qword_10001E130)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_10001E130);
  }
  return result;
}

uint64_t sub_10000FB2C(unint64_t *a1, uint64_t *a2)
{
  uint64_t result = *a1;
  if (!result)
  {
    sub_10000F8C4(a2);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_10000FB74(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_release();
  }
  else {
    return swift_bridgeObjectRelease();
  }
}

uint64_t sub_10000FB84(uint64_t a1, uint64_t a2, char a3)
{
  if (a3) {
    return swift_retain();
  }
  else {
    return swift_bridgeObjectRetain();
  }
}

void sub_10000FB94()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "no challenger", v2, v3, v4, v5, v6);
}

void sub_10000FBC8()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "no component", v2, v3, v4, v5, v6);
}

void sub_10000FBFC(void *a1)
{
  [a1 activeTokenChallengerIndex];
  sub_1000086D0();
  sub_1000086B0((void *)&_mh_execute_header, v1, v2, "challenger out of bounds: %lu", v3, v4, v5, v6, v7);
}

void sub_10000FC74()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Error fetching password screen", v2, v3, v4, v5, v6);
}

void sub_10000FCA8()
{
  sub_1000086D0();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Unknown error: %ld", v2);
}

void sub_10000FD14()
{
  sub_1000086D0();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "IDMS authentication failed: %ld", v2);
}

void sub_10000FD80()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Failed to request unlock status", v2, v3, v4, v5, v6);
}

void sub_10000FDB4()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Got unknown action", v2, v3, v4, v5, v6);
}

void sub_10000FDE8()
{
  sub_1000086D0();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Invalid token: %@", v2);
}

void sub_10000FE54()
{
  sub_1000086D0();
  sub_1000086DC((void *)&_mh_execute_header, v0, v1, "Failed to unlock token: %@", v2);
}

void sub_10000FEC0(void *a1)
{
  [a1 state];
  sub_1000086D0();
  sub_1000086B0((void *)&_mh_execute_header, v1, v2, "Dismiss at illegal state %ld", v3, v4, v5, v6, v7);
}

void sub_10000FF38(void *a1)
{
  [a1 state];
  sub_1000086D0();
  sub_1000086B0((void *)&_mh_execute_header, v1, v2, "Push at illegal state %ld", v3, v4, v5, v6, v7);
}

void sub_10000FFB0(void *a1)
{
  [a1 state];
  sub_1000086D0();
  sub_1000086B0((void *)&_mh_execute_header, v1, v2, "Got load error at illegal state %ld", v3, v4, v5, v6, v7);
}

void sub_100010028()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "BuddyML failed to load", v2, v3, v4, v5, v6);
}

void sub_10001005C(void *a1, uint64_t a2, NSObject *a3)
{
  [a1 state];
  sub_1000086D0();
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Illegal state transition from %ld to %ld", v5, 0x16u);
}

void sub_1000100F4()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to construct challenge request: %ld", v2, v3, v4, v5, v6);
}

void sub_10001015C()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "No BAA certificate found", v2, v3, v4, v5, v6);
}

void sub_100010190()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Failed to sign payload", v2, v3, v4, v5, v6);
}

void sub_1000101C4()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to serialize post data: %@", v2, v3, v4, v5, v6);
}

void sub_10001022C()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to serialize payload: %@", v2, v3, v4, v5, v6);
}

void sub_100010294(void *a1, NSObject *a2)
{
  uint64_t v4 = [a1 components];
  id v5 = [v4 count];
  uint8_t v6 = [a1 fdrTypes];
  int v7 = 134218240;
  id v8 = v5;
  __int16 v9 = 2048;
  id v10 = [v6 count];
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Lengths of localized components mismatch: %ld, %ld", (uint8_t *)&v7, 0x16u);
}

void sub_100010364(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000103D4()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Empty response", v2, v3, v4, v5, v6);
}

void sub_100010408()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Empty data", v2, v3, v4, v5, v6);
}

void sub_10001043C()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Not xmlui data", v2, v3, v4, v5, v6);
}

void sub_100010470(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 MIMEType];
  sub_1000086D0();
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Invalid MIME type %@", v4, 0xCu);
}

void sub_100010504()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "ButtonEventMonitor not available", v2, v3, v4, v5, v6);
}

void sub_100010538()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "DiagnosticsSupport not available", v2, v3, v4, v5, v6);
}

void sub_10001056C()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Missing partSPCs", v2, v3, v4, v5, v6);
}

void sub_1000105A0()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Missing preflight RIK", v2, v3, v4, v5, v6);
}

void sub_1000105D4(void *a1, void *a2, NSObject *a3)
{
  int v5 = 134218240;
  id v6 = [a1 count];
  __int16 v7 = 2048;
  id v8 = [a2 count];
  _os_log_error_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_ERROR, "Array length mismatch: %ld %ld", (uint8_t *)&v5, 0x16u);
}

void sub_100010684()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Missing activation token", v2, v3, v4, v5, v6);
}

void sub_1000106B8()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Missing activation challenge endpoint", v2, v3, v4, v5, v6);
}

void sub_1000106EC()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Invalid type of types", v2, v3, v4, v5, v6);
}

void sub_100010720()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Invalid type of SPCs", v2, v3, v4, v5, v6);
}

void sub_100010754()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Preflight phase 1 failed", v2, v3, v4, v5, v6);
}

void sub_100010788()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Preflight phase 1 missing expected results", v2, v3, v4, v5, v6);
}

void sub_1000107BC()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Preflight phase 1 time out", v2, v3, v4, v5, v6);
}

void sub_1000107F0()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Preflight phase 2 time out", v2, v3, v4, v5, v6);
}

uint64_t sub_100010824()
{
  uint64_t v0 = abort_report_np();
  return sub_10001084C(v0);
}

void sub_10001084C()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "No object model", v2, v3, v4, v5, v6);
}

void sub_100010880()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Empty username", v2, v3, v4, v5, v6);
}

void sub_1000108B4()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Empty password", v2, v3, v4, v5, v6);
}

void sub_1000108E8()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to construct request: %ld", v2, v3, v4, v5, v6);
}

void sub_100010950()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to fetch token: %ld", v2, v3, v4, v5, v6);
}

void sub_1000109B8()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "No password field", v2, v3, v4, v5, v6);
}

void sub_1000109EC()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "No email field", v2, v3, v4, v5, v6);
}

void sub_100010A20()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Unable to find next relative path", v2, v3, v4, v5, v6);
}

void sub_100010A54()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "Unable to find base path", v2, v3, v4, v5, v6);
}

void sub_100010A88()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to serialize the request: %@", v2, v3, v4, v5, v6);
}

void sub_100010AF0()
{
  sub_1000086F4();
  sub_100008694((void *)&_mh_execute_header, v0, v1, "IDMS timeout", v2, v3, v4, v5, v6);
}

void sub_100010B24()
{
  sub_1000086D0();
  sub_100009B24((void *)&_mh_execute_header, v0, v1, "Failed to authenticate: %@", v2, v3, v4, v5, v6);
}

void sub_100010B8C(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Invalid status", v1, 2u);
}

uint64_t sub_100010BD0()
{
  return EdgeInsets.init(_all:)();
}

uint64_t sub_100010BE0()
{
  return EnvironmentValues.multilineTextAlignment.getter();
}

uint64_t sub_100010BF0()
{
  return EnvironmentValues.multilineTextAlignment.setter();
}

void sub_100010C00(Swift::String a1)
{
}

void sub_100010C10(Swift::String a1)
{
}

uint64_t sub_100010C20()
{
  return LocalizedStringKey.StringInterpolation.init(literalCapacity:interpolationCount:)();
}

uint64_t sub_100010C30()
{
  return type metadata accessor for LocalizedStringKey.StringInterpolation();
}

uint64_t sub_100010C40()
{
  return LocalizedStringKey.init(stringLiteral:)();
}

uint64_t sub_100010C50()
{
  return LocalizedStringKey.init(stringInterpolation:)();
}

uint64_t sub_100010C60()
{
  return static HorizontalAlignment.center.getter();
}

uint64_t sub_100010C70()
{
  return static Edge.Set.all.getter();
}

uint64_t sub_100010C80()
{
  return static Edge.Set.top.getter();
}

uint64_t sub_100010C90()
{
  return static Edge.Set.vertical.getter();
}

uint64_t sub_100010CA0()
{
  return Text.bold()();
}

uint64_t sub_100010CB0()
{
  return Text.init(_:tableName:bundle:comment:)();
}

uint64_t sub_100010CC0()
{
  return static View._makeView(view:inputs:)();
}

uint64_t sub_100010CD0()
{
  return static View._makeViewList(view:inputs:)();
}

uint64_t sub_100010CE0()
{
  return static View._viewListCount(inputs:)();
}

uint64_t sub_100010CF0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_100010D00()
{
  return BidirectionalCollection<>.joined(separator:)();
}

uint64_t sub_100010D10()
{
  return String.hash(into:)();
}

uint64_t sub_100010D20()
{
  return RemoteUIController.registerViewType(_:named:)();
}

uint64_t sub_100010D30()
{
  return StringProtocol.components<A>(separatedBy:)();
}

uint64_t sub_100010D40()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

Swift::Int sub_100010D50(Swift::OpaquePointer cases, Swift::String string)
{
  return _findStringSwitchCase(cases:string:)(cases, string);
}

uint64_t sub_100010D60()
{
  return KeyedDecodingContainer.decode(_:forKey:)();
}

uint64_t sub_100010D70()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_100010D80()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_100010D90()
{
  return Hasher._finalize()();
}

uint64_t sub_100010DA0()
{
  return Decoder.decodeRUIID()()._countAndFlagsBits;
}

uint64_t sub_100010DB0()
{
  return dispatch thunk of Decoder.container<A>(keyedBy:)();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t handleForCategory()
{
  return _handleForCategory();
}

size_t malloc_size(const void *ptr)
{
  return _malloc_size(ptr);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
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
  return [super a2];
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_beginAccess()
{
  return _swift_beginAccess();
}

uint64_t swift_bridgeObjectRelease()
{
  return _swift_bridgeObjectRelease();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return _swift_bridgeObjectRelease_n();
}

uint64_t swift_bridgeObjectRetain()
{
  return _swift_bridgeObjectRetain();
}

uint64_t swift_endAccess()
{
  return _swift_endAccess();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return _swift_getTypeByMangledNameInContext2();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return _swift_getTypeByMangledNameInContextInMetadataState2();
}

uint64_t swift_getWitnessTable()
{
  return _swift_getWitnessTable();
}

uint64_t swift_once()
{
  return _swift_once();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

id objc_msgSend_HTTPBody(void *a1, const char *a2, ...)
{
  return _[a1 HTTPBody];
}

id objc_msgSend_MIMEType(void *a1, const char *a2, ...)
{
  return _[a1 MIMEType];
}

id objc_msgSend_URL(void *a1, const char *a2, ...)
{
  return _[a1 URL];
}

id objc_msgSend_URLByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return [a1 URLByAppendingPathComponent:];
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return [a1 URLWithString:];
}

id objc_msgSend__appendAdditionalHeaders_altDSID_gsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_appendAdditionalHeaders:altDSID:gsToken:");
}

id objc_msgSend__constructAlbertRequest_objectModel_username_altDSID_gsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_constructAlbertRequest:objectModel:username:altDSID:gsToken:");
}

id objc_msgSend__fetchGSTokenWithPassword_username_altDSID_gsToken_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_fetchGSTokenWithPassword:username:altDSID:gsToken:");
}

id objc_msgSend__findLabelWithText_inView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_findLabelWithText:inView:");
}

id objc_msgSend__requestBuddyML_session_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_requestBuddyML:session:completion:");
}

id objc_msgSend__sanityCheckBuddyMLResponse_data_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_sanityCheckBuddyMLResponse:data:");
}

id objc_msgSend__setHandlerForSkipButton(void *a1, const char *a2, ...)
{
  return _[a1 _setHandlerForSkipButton];
}

id objc_msgSend__setPassword_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setPassword:");
}

id objc_msgSend__showAlertWithTitle_message_actionTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_showAlertWithTitle:message:actionTitle:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return [a1 actionWithTitle:style:handler:];
}

id objc_msgSend_activateElement_completion_(void *a1, const char *a2, ...)
{
  return [a1 activateElement:completion:];
}

id objc_msgSend_activationLockChallengeNeeded(void *a1, const char *a2, ...)
{
  return _[a1 activationLockChallengeNeeded];
}

id objc_msgSend_activationLockCheck(void *a1, const char *a2, ...)
{
  return _[a1 activationLockCheck];
}

id objc_msgSend_activationLockComplete(void *a1, const char *a2, ...)
{
  return _[a1 activationLockComplete];
}

id objc_msgSend_activationLockComponents(void *a1, const char *a2, ...)
{
  return _[a1 activationLockComponents];
}

id objc_msgSend_activationResults_(void *a1, const char *a2, ...)
{
  return [a1 activationResults:];
}

id objc_msgSend_activeTokenChallenger(void *a1, const char *a2, ...)
{
  return _[a1 activeTokenChallenger];
}

id objc_msgSend_activeTokenChallengerIndex(void *a1, const char *a2, ...)
{
  return _[a1 activeTokenChallengerIndex];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return [a1 addAction:];
}

id objc_msgSend_addButton_(void *a1, const char *a2, ...)
{
  return [a1 addButton:];
}

id objc_msgSend_addChildViewController_(void *a1, const char *a2, ...)
{
  return [a1 addChildViewController:];
}

id objc_msgSend_addEntriesFromDictionary_(void *a1, const char *a2, ...)
{
  return [a1 addEntriesFromDictionary:];
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return [a1 addObject:];
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return [a1 addSubview:];
}

id objc_msgSend_addTarget_action_forButtonEvents_propagate_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forButtonEvents:propagate:];
}

id objc_msgSend_addTarget_action_forControlEvents_(void *a1, const char *a2, ...)
{
  return [a1 addTarget:action:forControlEvents:];
}

id objc_msgSend_ak_addAuthorizationHeaderWithServiceToken_forAltDSID_(void *a1, const char *a2, ...)
{
  return [a1 ak_addAuthorizationHeaderWithServiceToken:forAltDSID:];
}

id objc_msgSend_ak_addClientInfoHeader(void *a1, const char *a2, ...)
{
  return [a1 ak_addClientInfoHeader];
}

id objc_msgSend_ak_addDeviceUDIDHeader(void *a1, const char *a2, ...)
{
  return [a1 ak_addDeviceUDIDHeader];
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return [a1 alertControllerWithTitle:message:preferredStyle:];
}

id objc_msgSend_allHTTPHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHTTPHeaderFields];
}

id objc_msgSend_allHeaderFields(void *a1, const char *a2, ...)
{
  return _[a1 allHeaderFields];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return _[a1 allValues];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayWithArray_(void *a1, const char *a2, ...)
{
  return [a1 arrayWithArray:];
}

id objc_msgSend_attributes(void *a1, const char *a2, ...)
{
  return _[a1 attributes];
}

id objc_msgSend_authKitSession(void *a1, const char *a2, ...)
{
  return _[a1 authKitSession];
}

id objc_msgSend_authenticateFromObjectModel_outRequest_(void *a1, const char *a2, ...)
{
  return [a1 authenticateFromObjectModel:outRequest:];
}

id objc_msgSend_authenticateWithContext_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "authenticateWithContext:completion:");
}

id objc_msgSend_authenticator(void *a1, const char *a2, ...)
{
  return _[a1 authenticator];
}

id objc_msgSend_baaCert(void *a1, const char *a2, ...)
{
  return _[a1 baaCert];
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return [a1 base64EncodedStringWithOptions:];
}

id objc_msgSend_baseURL_(void *a1, const char *a2, ...)
{
  return [a1 baseURL:];
}

id objc_msgSend_boldButton(void *a1, const char *a2, ...)
{
  return _[a1 boldButton];
}

id objc_msgSend_boldSystemFontOfSize_(void *a1, const char *a2, ...)
{
  return [a1 boldSystemFontOfSize:];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_buttonEventMonitor(void *a1, const char *a2, ...)
{
  return _[a1 buttonEventMonitor];
}

id objc_msgSend_buttonTray(void *a1, const char *a2, ...)
{
  return _[a1 buttonTray];
}

id objc_msgSend_chimeraLockComponents(void *a1, const char *a2, ...)
{
  return _[a1 chimeraLockComponents];
}

id objc_msgSend_clientInfo(void *a1, const char *a2, ...)
{
  return _[a1 clientInfo];
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return _[a1 code];
}

id objc_msgSend_components(void *a1, const char *a2, ...)
{
  return _[a1 components];
}

id objc_msgSend_componentsJoinedByString_(void *a1, const char *a2, ...)
{
  return [a1 componentsJoinedByString:];
}

id objc_msgSend_componentsWithURL_resolvingAgainstBaseURL_(void *a1, const char *a2, ...)
{
  return [a1 componentsWithURL:resolvingAgainstBaseURL:];
}

id objc_msgSend_configurationWithHierarchicalColor_(void *a1, const char *a2, ...)
{
  return [a1 configurationWithHierarchicalColor:];
}

id objc_msgSend_constructChallengeRequestDataWithToken_data_(void *a1, const char *a2, ...)
{
  return [a1 constructChallengeRequestDataWithToken:data:];
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return [a1 containsObject:];
}

id objc_msgSend_containsString_(void *a1, const char *a2, ...)
{
  return [a1 containsString:];
}

id objc_msgSend_coordinator(void *a1, const char *a2, ...)
{
  return _[a1 coordinator];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dataTaskWithRequest_completionHandler_(void *a1, const char *a2, ...)
{
  return [a1 dataTaskWithRequest:completionHandler:];
}

id objc_msgSend_dataWithPropertyList_format_options_error_(void *a1, const char *a2, ...)
{
  return [a1 dataWithPropertyList:format:options:error:];
}

id objc_msgSend_defaultSessionConfiguration(void *a1, const char *a2, ...)
{
  return _[a1 defaultSessionConfiguration];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return _[a1 description];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return [a1 dictionaryWithObjects:forKeys:count:];
}

id objc_msgSend_didMoveToParentViewController_(void *a1, const char *a2, ...)
{
  return [a1 didMoveToParentViewController:];
}

id objc_msgSend_displayedPages(void *a1, const char *a2, ...)
{
  return _[a1 displayedPages];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return _[a1 editableTextField];
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return [a1 endEditing:];
}

id objc_msgSend_endTestWithStatusCode_error_(void *a1, const char *a2, ...)
{
  return [a1 endTestWithStatusCode:error:];
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return _[a1 endpoint];
}

id objc_msgSend_endpointBaseURL(void *a1, const char *a2, ...)
{
  return _[a1 endpointBaseURL];
}

id objc_msgSend_fdrTypes(void *a1, const char *a2, ...)
{
  return _[a1 fdrTypes];
}

id objc_msgSend_fetchPasswordScreen(void *a1, const char *a2, ...)
{
  return _[a1 fetchPasswordScreen];
}

id objc_msgSend_fetchPasswordWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 fetchPasswordWithCompletion:];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_headerView(void *a1, const char *a2, ...)
{
  return _[a1 headerView];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return _[a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_initWithComponent_status_(void *a1, const char *a2, ...)
{
  return [a1 initWithComponent:status:];
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return [a1 initWithData:encoding:];
}

id objc_msgSend_initWithIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 initWithIdentifier:];
}

id objc_msgSend_initWithToken_components_fdrTypes_endpoint_signer_(void *a1, const char *a2, ...)
{
  return [a1 initWithToken:components:fdrTypes:endpoint:signer:];
}

id objc_msgSend_initWithTokenChallengers_authenticator_(void *a1, const char *a2, ...)
{
  return [a1 initWithTokenChallengers:authenticator:];
}

id objc_msgSend_inputs(void *a1, const char *a2, ...)
{
  return _[a1 inputs];
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return [a1 isEqualToString:];
}

id objc_msgSend_isTokenUnlocked(void *a1, const char *a2, ...)
{
  return _[a1 isTokenUnlocked];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return _[a1 labelColor];
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return _[a1 lastObject];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_linkButton(void *a1, const char *a2, ...)
{
  return _[a1 linkButton];
}

id objc_msgSend_loadData_baseURL_(void *a1, const char *a2, ...)
{
  return [a1 loadData:baseURL:];
}

id objc_msgSend_localizedComponentMap(void *a1, const char *a2, ...)
{
  return _[a1 localizedComponentMap];
}

id objc_msgSend_localizedComponentsMap(void *a1, const char *a2, ...)
{
  return _[a1 localizedComponentsMap];
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return [a1 localizedStringForKey:value:table:];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_moveToNextLockedTokenChallenger(void *a1, const char *a2, ...)
{
  return _[a1 moveToNextLockedTokenChallenger];
}

id objc_msgSend_moveToNextViewController(void *a1, const char *a2, ...)
{
  return _[a1 moveToNextViewController];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return _[a1 null];
}

id objc_msgSend_numberWithInteger_(void *a1, const char *a2, ...)
{
  return [a1 numberWithInteger:];
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectAtIndexedSubscript:];
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 objectForKeyedSubscript:];
}

id objc_msgSend_pointSize(void *a1, const char *a2, ...)
{
  return _[a1 pointSize];
}

id objc_msgSend_popToViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 popToViewController:animated:];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preflightPhase1_(void *a1, const char *a2, ...)
{
  return [a1 preflightPhase1:];
}

id objc_msgSend_preflightPhase1_withReply_(void *a1, const char *a2, ...)
{
  return [a1 preflightPhase1:withReply:];
}

id objc_msgSend_preflightPhase2_(void *a1, const char *a2, ...)
{
  return [a1 preflightPhase2:];
}

id objc_msgSend_preflightPhase2_withReply_(void *a1, const char *a2, ...)
{
  return [a1 preflightPhase2:withReply:];
}

id objc_msgSend_preflightRIK(void *a1, const char *a2, ...)
{
  return _[a1 preflightRIK];
}

id objc_msgSend_preflightResponsePhase1(void *a1, const char *a2, ...)
{
  return _[a1 preflightResponsePhase1];
}

id objc_msgSend_preflightResults(void *a1, const char *a2, ...)
{
  return _[a1 preflightResults];
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return [a1 presentViewController:animated:completion:];
}

id objc_msgSend_pushViewController_animated_(void *a1, const char *a2, ...)
{
  return [a1 pushViewController:animated:];
}

id objc_msgSend_registerPartsInfoViewWithComponentsMap_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPartsInfoViewWithComponentsMap:");
}

id objc_msgSend_remoteUIController(void *a1, const char *a2, ...)
{
  return _[a1 remoteUIController];
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return [a1 removeObjectAtIndex:];
}

id objc_msgSend_removeTarget_(void *a1, const char *a2, ...)
{
  return [a1 removeTarget:];
}

id objc_msgSend_requestWithURL_(void *a1, const char *a2, ...)
{
  return [a1 requestWithURL:];
}

id objc_msgSend_resetState(void *a1, const char *a2, ...)
{
  return _[a1 resetState];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return _[a1 result];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_scheme(void *a1, const char *a2, ...)
{
  return _[a1 scheme];
}

id objc_msgSend_serverInfo(void *a1, const char *a2, ...)
{
  return _[a1 serverInfo];
}

id objc_msgSend_sessionWithConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 sessionWithConfiguration:];
}

id objc_msgSend_setActivationLockChallengeNeeded_(void *a1, const char *a2, ...)
{
  return [a1 setActivationLockChallengeNeeded:];
}

id objc_msgSend_setActivationLockComponents_(void *a1, const char *a2, ...)
{
  return [a1 setActivationLockComponents:];
}

id objc_msgSend_setActiveTokenChallengerIndex_(void *a1, const char *a2, ...)
{
  return [a1 setActiveTokenChallengerIndex:];
}

id objc_msgSend_setAuthenticationType_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticationType:];
}

id objc_msgSend_setAuthenticator_(void *a1, const char *a2, ...)
{
  return [a1 setAuthenticator:];
}

id objc_msgSend_setButtonEventMonitor_(void *a1, const char *a2, ...)
{
  return [a1 setButtonEventMonitor:];
}

id objc_msgSend_setChimeraLockComponents_(void *a1, const char *a2, ...)
{
  return [a1 setChimeraLockComponents:];
}

id objc_msgSend_setCoordinator_(void *a1, const char *a2, ...)
{
  return [a1 setCoordinator:];
}

id objc_msgSend_setData_(void *a1, const char *a2, ...)
{
  return [a1 setData:];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return [a1 setDelegate:];
}

id objc_msgSend_setFinished_(void *a1, const char *a2, ...)
{
  return [a1 setFinished:];
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return [a1 setFont:];
}

id objc_msgSend_setFragment_(void *a1, const char *a2, ...)
{
  return [a1 setFragment:];
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return [a1 setFrame:];
}

id objc_msgSend_setHTTPBody_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPBody:];
}

id objc_msgSend_setHTTPMethod_(void *a1, const char *a2, ...)
{
  return [a1 setHTTPMethod:];
}

id objc_msgSend_setHandlerForElementsMatching_handler_(void *a1, const char *a2, ...)
{
  return [a1 setHandlerForElementsMatching:handler:];
}

id objc_msgSend_setHidesBackButton_(void *a1, const char *a2, ...)
{
  return [a1 setHidesBackButton:];
}

id objc_msgSend_setHostViewController_(void *a1, const char *a2, ...)
{
  return [a1 setHostViewController:];
}

id objc_msgSend_setInputs_(void *a1, const char *a2, ...)
{
  return [a1 setInputs:];
}

id objc_msgSend_setIsEphemeral_(void *a1, const char *a2, ...)
{
  return [a1 setIsEphemeral:];
}

id objc_msgSend_setIsTokenUnlocked_(void *a1, const char *a2, ...)
{
  return [a1 setIsTokenUnlocked:];
}

id objc_msgSend_setIsUsernameEditable_(void *a1, const char *a2, ...)
{
  return [a1 setIsUsernameEditable:];
}

id objc_msgSend_setLoading_(void *a1, const char *a2, ...)
{
  return [a1 setLoading:];
}

id objc_msgSend_setLocalizedComponentMap_(void *a1, const char *a2, ...)
{
  return [a1 setLocalizedComponentMap:];
}

id objc_msgSend_setNavigationController_(void *a1, const char *a2, ...)
{
  return [a1 setNavigationController:];
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKey:];
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return [a1 setObject:forKeyedSubscript:];
}

id objc_msgSend_setPath_(void *a1, const char *a2, ...)
{
  return [a1 setPath:];
}

id objc_msgSend_setPreflightBaaCert_(void *a1, const char *a2, ...)
{
  return [a1 setPreflightBaaCert:];
}

id objc_msgSend_setPreflightRIK_(void *a1, const char *a2, ...)
{
  return [a1 setPreflightRIK:];
}

id objc_msgSend_setPreflightResponsePhase1_(void *a1, const char *a2, ...)
{
  return [a1 setPreflightResponsePhase1:];
}

id objc_msgSend_setPreflightResults_(void *a1, const char *a2, ...)
{
  return [a1 setPreflightResults:];
}

id objc_msgSend_setQuery_(void *a1, const char *a2, ...)
{
  return [a1 setQuery:];
}

id objc_msgSend_setRemoteUIController_(void *a1, const char *a2, ...)
{
  return [a1 setRemoteUIController:];
}

id objc_msgSend_setRequestCachePolicy_(void *a1, const char *a2, ...)
{
  return [a1 setRequestCachePolicy:];
}

id objc_msgSend_setScrollingDisabled_(void *a1, const char *a2, ...)
{
  return [a1 setScrollingDisabled:];
}

id objc_msgSend_setServiceIdentifier_(void *a1, const char *a2, ...)
{
  return [a1 setServiceIdentifier:];
}

id objc_msgSend_setServiceType_(void *a1, const char *a2, ...)
{
  return [a1 setServiceType:];
}

id objc_msgSend_setShouldPromptForPasswordOnly_(void *a1, const char *a2, ...)
{
  return [a1 setShouldPromptForPasswordOnly:];
}

id objc_msgSend_setShouldShowPressHomeLabel_(void *a1, const char *a2, ...)
{
  return [a1 setShouldShowPressHomeLabel:];
}

id objc_msgSend_setShouldUpdatePersistentServiceTokens_(void *a1, const char *a2, ...)
{
  return [a1 setShouldUpdatePersistentServiceTokens:];
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return [a1 setState:];
}

id objc_msgSend_setStatusCode_(void *a1, const char *a2, ...)
{
  return [a1 setStatusCode:];
}

id objc_msgSend_setStyle_(void *a1, const char *a2, ...)
{
  return [a1 setStyle:];
}

id objc_msgSend_setSubtitleText_(void *a1, const char *a2, ...)
{
  return [a1 setSubtitleText:];
}

id objc_msgSend_setText_(void *a1, const char *a2, ...)
{
  return [a1 setText:];
}

id objc_msgSend_setTextColor_(void *a1, const char *a2, ...)
{
  return [a1 setTextColor:];
}

id objc_msgSend_setTitle_forState_(void *a1, const char *a2, ...)
{
  return [a1 setTitle:forState:];
}

id objc_msgSend_setTokenChallengers_(void *a1, const char *a2, ...)
{
  return [a1 setTokenChallengers:];
}

id objc_msgSend_setURLCache_(void *a1, const char *a2, ...)
{
  return [a1 setURLCache:];
}

id objc_msgSend_setUiNeededKnownSemaphore_(void *a1, const char *a2, ...)
{
  return [a1 setUiNeededKnownSemaphore:];
}

id objc_msgSend_setUsername_(void *a1, const char *a2, ...)
{
  return [a1 setUsername:];
}

id objc_msgSend_setValue_forHTTPHeaderField_(void *a1, const char *a2, ...)
{
  return [a1 setValue:forHTTPHeaderField:];
}

id objc_msgSend_setViewControllers_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:];
}

id objc_msgSend_setViewControllers_animated_(void *a1, const char *a2, ...)
{
  return [a1 setViewControllers:animated:];
}

id objc_msgSend_set_appleIDContext_(void *a1, const char *a2, ...)
{
  return [a1 set_appleIDContext:];
}

id objc_msgSend_setupActivationLockView(void *a1, const char *a2, ...)
{
  return _[a1 setupActivationLockView];
}

id objc_msgSend_setupAssistantStyle(void *a1, const char *a2, ...)
{
  return _[a1 setupAssistantStyle];
}

id objc_msgSend_setupRemoteUIController(void *a1, const char *a2, ...)
{
  return _[a1 setupRemoteUIController];
}

id objc_msgSend_sharedSession(void *a1, const char *a2, ...)
{
  return _[a1 sharedSession];
}

id objc_msgSend_showButtonsAvailable(void *a1, const char *a2, ...)
{
  return _[a1 showButtonsAvailable];
}

id objc_msgSend_showButtonsBusy(void *a1, const char *a2, ...)
{
  return _[a1 showButtonsBusy];
}

id objc_msgSend_showUnknownErrorAlertWithCode_(void *a1, const char *a2, ...)
{
  return [a1 showUnknownErrorAlertWithCode:];
}

id objc_msgSend_showUserAuthErrorAlert(void *a1, const char *a2, ...)
{
  return _[a1 showUserAuthErrorAlert];
}

id objc_msgSend_sign_keyBlob_(void *a1, const char *a2, ...)
{
  return [a1 sign:keyBlob:];
}

id objc_msgSend_signData_(void *a1, const char *a2, ...)
{
  return [a1 signData:];
}

id objc_msgSend_signer(void *a1, const char *a2, ...)
{
  return _[a1 signer];
}

id objc_msgSend_sourceURL(void *a1, const char *a2, ...)
{
  return _[a1 sourceURL];
}

id objc_msgSend_spcResults_(void *a1, const char *a2, ...)
{
  return [a1 spcResults:];
}

id objc_msgSend_startNavigationBarSpinnerWithTitle_(void *a1, const char *a2, ...)
{
  return [a1 startNavigationBarSpinnerWithTitle:];
}

id objc_msgSend_startRequest_session_completion_(void *a1, const char *a2, ...)
{
  return [a1 startRequest:session:completion:];
}

id objc_msgSend_startWithPriority_completion_(void *a1, const char *a2, ...)
{
  return [a1 startWithPriority:completion:];
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return _[a1 state];
}

id objc_msgSend_stopNavigationBarSpinner(void *a1, const char *a2, ...)
{
  return _[a1 stopNavigationBarSpinner];
}

id objc_msgSend_stopWithCompletion_(void *a1, const char *a2, ...)
{
  return [a1 stopWithCompletion:];
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return [a1 stringWithFormat:];
}

id objc_msgSend_subElementWithID_(void *a1, const char *a2, ...)
{
  return [a1 subElementWithID:];
}

id objc_msgSend_subtitleText(void *a1, const char *a2, ...)
{
  return _[a1 subtitleText];
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_systemImageNamed_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:];
}

id objc_msgSend_systemImageNamed_withConfiguration_(void *a1, const char *a2, ...)
{
  return [a1 systemImageNamed:withConfiguration:];
}

id objc_msgSend_tableCell(void *a1, const char *a2, ...)
{
  return _[a1 tableCell];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_tintColor(void *a1, const char *a2, ...)
{
  return _[a1 tintColor];
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return _[a1 token];
}

id objc_msgSend_tokenChallengers(void *a1, const char *a2, ...)
{
  return _[a1 tokenChallengers];
}

id objc_msgSend_transitionTable(void *a1, const char *a2, ...)
{
  return _[a1 transitionTable];
}

id objc_msgSend_transitionToState_(void *a1, const char *a2, ...)
{
  return [a1 transitionToState:];
}

id objc_msgSend_uiNeededKnownSemaphore(void *a1, const char *a2, ...)
{
  return _[a1 uiNeededKnownSemaphore];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_viewControllers(void *a1, const char *a2, ...)
{
  return _[a1 viewControllers];
}

id objc_msgSend_visiblePage(void *a1, const char *a2, ...)
{
  return _[a1 visiblePage];
}