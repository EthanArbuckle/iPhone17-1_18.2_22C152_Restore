void sub_2694(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_26B0(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v8 = _CalLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_A260();
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v10 = WeakRetained;
  if (v7)
  {
    v11 = _CalLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_A1F8();
    }
  }
  else
  {
    v12 = WeakRetained + 27;
    objc_storeStrong(WeakRetained + 27, a2);
    v13 = _CalLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = [*v12 emails];
      *(_DWORD *)buf = 134217984;
      id v22 = [v14 count];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Calendar get settings response loaded from server. Email count %lu", buf, 0xCu);
    }
    v11 = _CalLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_A170(v10 + 27);
    }
  }

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_28E4;
  v16[3] = &unk_10408;
  id v17 = *(id *)(a1 + 32);
  id v18 = *(id *)(a1 + 40);
  v19 = v10;
  uint64_t v20 = *(void *)(a1 + 48);
  v15 = v10;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v16);
}

void sub_28E4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "calendar_stopSpinner");
  [*(id *)(a1 + 40) setProperty:&__kCFBooleanFalse forKey:PSControlIsLoadingKey];
  v2 = *(void **)(*(void *)(a1 + 48) + 216);
  if (v2)
  {
    v3 = [v2 emails];
    id v4 = [v3 count];

    if (v4)
    {
      uint64_t v5 = PSEnabledKey;
      [*(id *)(a1 + 32) setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];
      [*(id *)(a1 + 40) setProperty:&__kCFBooleanTrue forKey:v5];
    }
  }
  [*(id *)(a1 + 56) reloadSpecifierID:@"Send_AND_RECEIVE_SPECIFIER_ID"];
  [*(id *)(a1 + 56) reloadSpecifierID:@"SHARED_CALENDAR_SPECIFIER_ID"];
  uint64_t v6 = *(void *)(a1 + 48);
  if (*(unsigned char *)(v6 + 200) && *(void *)(v6 + 216))
  {
    *(unsigned char *)(*(void *)(a1 + 56) + 200) = 0;
    id v7 = [CalendarSendReceiveController alloc];
    v8 = [*(id *)(*(void *)(a1 + 48) + 216) emails];
    v9 = [(CalendarSendReceiveController *)v7 initWithEmailData:v8 userAccount:*(void *)(*(void *)(a1 + 56) + 208)];

    [*(id *)(a1 + 56) showViewController:v9 sender:*(void *)(a1 + 56)];
  }
}

void sub_3C8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_3CB0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v8 = _CalLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = [v5 emails];
    v10 = [v9 description];
    *(_DWORD *)buf = 138412546;
    v16 = v10;
    __int16 v17 = 2112;
    id v18 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "update send email request with response %@ error %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F00;
  block[3] = &unk_10458;
  id v14 = *(id *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v6)
  {
    uint64_t v11 = *(void *)(a1 + 40);
    v12[5] = _NSConcreteStackBlock;
    v12[6] = 3221225472;
    v12[7] = sub_3F1C;
    v12[8] = &unk_10458;
    v12[9] = v11;
    +[CalendarUtil showErrorForPresenter:withError:callback:](CalendarUtil, "showErrorForPresenter:withError:callback:");
  }
  else
  {
    objc_msgSend(WeakRetained[27], "setSharedCalendarEmail:", objc_msgSend(*(id *)(a1 + 48), "BOOLValue"));
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_3FA4;
    v12[3] = &unk_10458;
    v12[4] = *(void *)(a1 + 40);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v12);
  }
}

id sub_3F00(uint64_t a1)
{
  return [*(id *)(a1 + 32) setProperty:&__kCFBooleanFalse forKey:PSControlIsLoadingKey];
}

void sub_3F1C(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_3F94;
  block[3] = &unk_10458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_3F94(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"SHARED_CALENDAR_SPECIFIER_ID"];
}

id sub_3FA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"SHARED_CALENDAR_SPECIFIER_ID"];
}

void sub_437C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_4398(uint64_t a1, void *a2, void *a3)
{
  id v6 = a2;
  id v7 = a3;
  v8 = _CalLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_A4E0();
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v10 = WeakRetained;
  if (v7)
  {
    uint64_t v11 = _CalLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_A478();
    }
  }
  else
  {
    v12 = WeakRetained + 27;
    objc_storeStrong(WeakRetained + 27, a2);
    v13 = _CalLogSystem();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      id v14 = [*v12 emails];
      *(_DWORD *)buf = 134217984;
      id v17 = [v14 count];
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_DEFAULT, "Calendar get settings response loaded from server. Email count %lu", buf, 0xCu);
    }
    uint64_t v11 = _CalLogSystem();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      sub_A170(v10 + 27);
    }
  }

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4594;
  block[3] = &unk_10458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_4594(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifierID:@"Send_AND_RECEIVE_SPECIFIER_ID"];
}

void sub_4750(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_476C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_4788(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_47A4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_571C(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  if ([v8 statusCode] == (char *)&stru_158.reloff + 1 && *(unsigned char *)(a1 + 48))
  {
    uint64_t v10 = _CalLogSystem();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "401 response from server for request %@ response %@", buf, 0x16u);
    }

    v35[0] = &__kCFBooleanTrue;
    v34[0] = kACRenewCredentialsShouldForceKey;
    v34[1] = kACRenewCredentialsServicesKey;
    uint64_t v33 = AAGrandSlamAppTokenIDiCloudSettings;
    uint64_t v11 = +[NSArray arrayWithObjects:&v33 count:1];
    v35[1] = v11;
    v12 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];

    v13 = (void *)_accountStore;
    uint64_t v14 = *(void *)(*(void *)(a1 + 32) + 8);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_5B28;
    v22[3] = &unk_104C0;
    id v26 = *(id *)(a1 + 40);
    id v23 = v7;
    id v15 = v8;
    uint64_t v16 = *(void *)(a1 + 32);
    id v24 = v15;
    uint64_t v25 = v16;
    [v13 renewCredentialsForAccount:v14 options:v12 completion:v22];
  }
  else if (*(void *)(a1 + 40))
  {
    if ([v8 statusCode] == stru_B8.segname)
    {
      v12 = 0;
    }
    else
    {
      id v17 = _CalLogSystem();
      BOOL v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);
      if (v9)
      {
        if (v18)
        {
          *(_DWORD *)buf = 134218242;
          id v28 = [v8 statusCode];
          __int16 v29 = 2114;
          id v30 = v9;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "non 200 response from server responseCode: %ld error: %{public}@", buf, 0x16u);
        }

        id v19 = v8;
        id v20 = [v19 statusCode];
        v21 = [*(id *)(a1 + 32) _errorDictionaryFromServerResponse:v19];
        v12 = +[NSError errorWithDomain:@"CalServerErrorDomain" code:v20 userInfo:v21];
      }
      else
      {
        if (v18)
        {
          *(_DWORD *)buf = 134217984;
          id v28 = [v8 statusCode];
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_DEFAULT, "non 200 response from server responseCode: %ld. Error object is nil. Constructing local error code", buf, 0xCu);
        }

        v12 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"CalServerErrorDomain", [v8 statusCode], 0);
      }
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  else
  {
    v12 = _CalLogSystem();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v28 = v8;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      id v32 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_DEFAULT, "no handler for performRequestWithHandler. Server response %@ for request %@ and error %@", buf, 0x20u);
    }
  }
}

void sub_5B28(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    if (a2 == 1)
    {
      id v6 = _CalLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        id v7 = "auth token renew failed. User rejected";
        id v8 = buf;
        goto LABEL_11;
      }
LABEL_12:

      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
      goto LABEL_13;
    }
    if (a2 == 2)
    {
      id v6 = _CalLogSystem();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v12 = 0;
        id v7 = "auth token renew failed.";
        id v8 = (uint8_t *)&v12;
LABEL_11:
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
        goto LABEL_12;
      }
      goto LABEL_12;
    }
  }
  else
  {
    id v9 = _CalLogSystem();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, "auth token renewed. Retrying request with server", v10, 2u);
    }

    [*(id *)(a1 + 48) _performRequestWithHandler:*(void *)(a1 + 56) renewToken:0];
  }
LABEL_13:
}

void sub_602C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = _CalLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    sub_A608();
  }

  uint64_t v9 = *(void *)(a1 + 32);
  if (v9) {
    (*(void (**)(uint64_t, id, id))(v9 + 16))(v9, v6, v7);
  }
}

void sub_639C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = _CalLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_A670();
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_688C(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  uint64_t v9 = _CalLogSystem();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    sub_A6D8();
  }

  uint64_t v10 = *(void *)(a1 + 32);
  if (v10) {
    (*(void (**)(uint64_t, id, id))(v10 + 16))(v10, v8, v7);
  }
}

void sub_69DC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_8C50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id *location, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,id a42)
{
  objc_destroyWeak(v42);
  objc_destroyWeak(location);
  objc_destroyWeak(&a42);
  _Unwind_Resume(a1);
}

void sub_8CDC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didSelectEmailForSend:*(void *)(a1 + 32)];
}

void sub_8D2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didSelectOptionForReceive:*(void *)(a1 + 32) withOption:@"PUSH"];
}

void sub_8D84(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _didSelectOptionForReceive:*(void *)(a1 + 32) withOption:@"EMAIL"];
}

void sub_93A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_93C0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  id v8 = _CalLogSystem();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = [v5 emails];
    uint64_t v10 = [v9 description];
    *(_DWORD *)buf = 138412546;
    BOOL v18 = v10;
    __int16 v19 = 2112;
    id v20 = v6;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "update send email request with response %@ error %@", buf, 0x16u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_962C;
  block[3] = &unk_10458;
  id v16 = WeakRetained;
  id v11 = WeakRetained;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  if (v6)
  {
    uint64_t v12 = *(void *)(a1 + 32);
    v14[5] = _NSConcreteStackBlock;
    v14[6] = 3221225472;
    v14[7] = sub_9640;
    v14[8] = &unk_10458;
    v14[9] = v12;
    +[CalendarUtil showErrorForPresenter:withError:callback:](CalendarUtil, "showErrorForPresenter:withError:callback:");
  }
  else
  {
    [v11 setEmailList:*(void *)(a1 + 40)];
    v13 = +[NSNotificationCenter defaultCenter];
    [v13 postNotificationName:@"CALENDAR_SETTING_REFRESH_NOTIFICATION" object:0 userInfo:0];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_96C0;
    v14[3] = &unk_10458;
    v14[4] = *(void *)(a1 + 32);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v14);
  }
}

id sub_962C(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 184) stopSpinner];
}

void sub_9640(uint64_t a1)
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_96B8;
  block[3] = &unk_10458;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_96B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id sub_96C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

id _CalLogSystem()
{
  if (qword_162E0 != -1) {
    dispatch_once(&qword_162E0, &stru_10600);
  }
  v0 = (void *)qword_162D8;

  return v0;
}

void sub_9924(id a1)
{
  qword_162D8 = (uint64_t)os_log_create("com.apple.icloudCalendar", "settings");

  _objc_release_x1();
}

uint64_t sub_9C94(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

id sub_9CAC(uint64_t a1)
{
  return [*(id *)(a1 + 32) presentViewController:*(void *)(a1 + 40) animated:1 completion:0];
}

void sub_A170(id *a1)
{
  v1 = [*a1 description];
  sub_4744();
  sub_47A4(&dword_0, v2, v3, "Calendar get settings response %@", v4, v5, v6, v7, v8);
}

void sub_A1F8()
{
  sub_4744();
  sub_4788(&dword_0, v0, v1, "Unable to load calendar settings. error  %@", v2, v3, v4, v5, v6);
}

void sub_A260()
{
  sub_4744();
  sub_4750(&dword_0, v0, v1, "logging server request %@", v2, v3, v4, v5, v6);
}

void sub_A2C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A338(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A370(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_A3A8()
{
  sub_4744();
  sub_4750(&dword_0, v0, v1, "[CalendarSettingsController] handleURL Calendar data class universal link with path: %@", v2, v3, v4, v5, v6);
}

void sub_A410()
{
  sub_4744();
  sub_4750(&dword_0, v0, v1, "[CalendarSettingsController] handleURL from universal link with params: %@", v2, v3, v4, v5, v6);
}

void sub_A478()
{
  sub_4744();
  sub_4788(&dword_0, v0, v1, "Unable to load calendar settings after receiving update notification. error  %@", v2, v3, v4, v5, v6);
}

void sub_A4E0()
{
  sub_4744();
  sub_4750(&dword_0, v0, v1, "logging server request for notification response %@", v2, v3, v4, v5, v6);
}

void sub_A548(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "loading calendar specifiers %@", (uint8_t *)&v3, 0xCu);
}

void sub_A5C4(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "unable to sign grandslam request for calendar", v1, 2u);
}

void sub_A608()
{
  sub_69C4();
  sub_69DC(&dword_0, v0, v1, "get setting call response %@ error %@");
}

void sub_A670()
{
  sub_69C4();
  sub_69DC(&dword_0, v0, v1, "update setting call response %@ error %@");
}

void sub_A6D8()
{
  sub_69C4();
  sub_69DC(&dword_0, v0, v1, "shared calendar update setting call response %@ error %@");
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
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

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
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

id objc_msgSend__calendarCardViewSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _calendarCardViewSpecifier];
}

id objc_msgSend__configureConstraints(void *a1, const char *a2, ...)
{
  return [a1 _configureConstraints];
}

id objc_msgSend__loadCalendarSettingInfoSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _loadCalendarSettingInfoSpecifier];
}

id objc_msgSend__loadSendReceiveSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _loadSendReceiveSpecifier];
}

id objc_msgSend__loadSharedCalenderUpdateSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _loadSharedCalenderUpdateSpecifier];
}

id objc_msgSend__receiveEmailSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _receiveEmailSpecifiers];
}

id objc_msgSend__sendEmailSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _sendEmailSpecifiers];
}

id objc_msgSend__setupViews(void *a1, const char *a2, ...)
{
  return [a1 _setupViews];
}

id objc_msgSend__showSendReceive(void *a1, const char *a2, ...)
{
  return [a1 _showSendReceive];
}

id objc_msgSend_account(void *a1, const char *a2, ...)
{
  return [a1 account];
}

id objc_msgSend_accountStore(void *a1, const char *a2, ...)
{
  return [a1 accountStore];
}

id objc_msgSend_accountType(void *a1, const char *a2, ...)
{
  return [a1 accountType];
}

id objc_msgSend_accounts(void *a1, const char *a2, ...)
{
  return [a1 accounts];
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_bodyDictionary(void *a1, const char *a2, ...)
{
  return [a1 bodyDictionary];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_buttonAction(void *a1, const char *a2, ...)
{
  return [a1 buttonAction];
}

id objc_msgSend_calError(void *a1, const char *a2, ...)
{
  return [a1 calError];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return [a1 centerYAnchor];
}

id objc_msgSend_contentView(void *a1, const char *a2, ...)
{
  return [a1 contentView];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_deviceClass(void *a1, const char *a2, ...)
{
  return [a1 deviceClass];
}

id objc_msgSend_emails(void *a1, const char *a2, ...)
{
  return [a1 emails];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_errorMessage(void *a1, const char *a2, ...)
{
  return [a1 errorMessage];
}

id objc_msgSend_errorTitle(void *a1, const char *a2, ...)
{
  return [a1 errorTitle];
}

id objc_msgSend_getSettingsResponse(void *a1, const char *a2, ...)
{
  return [a1 getSettingsResponse];
}

id objc_msgSend_iCloudAppleAccount(void *a1, const char *a2, ...)
{
  return [a1 iCloudAppleAccount];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_infoDictionary(void *a1, const char *a2, ...)
{
  return [a1 infoDictionary];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return [a1 isEditing];
}

id objc_msgSend_labelColor(void *a1, const char *a2, ...)
{
  return [a1 labelColor];
}

id objc_msgSend_layoutIfNeeded(void *a1, const char *a2, ...)
{
  return [a1 layoutIfNeeded];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return [a1 mainBundle];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_makoAccount(void *a1, const char *a2, ...)
{
  return [a1 makoAccount];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_plainButtonConfiguration(void *a1, const char *a2, ...)
{
  return [a1 plainButtonConfiguration];
}

id objc_msgSend_popupButton(void *a1, const char *a2, ...)
{
  return [a1 popupButton];
}

id objc_msgSend_receive(void *a1, const char *a2, ...)
{
  return [a1 receive];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_rowLabel(void *a1, const char *a2, ...)
{
  return [a1 rowLabel];
}

id objc_msgSend_secondaryLabelColor(void *a1, const char *a2, ...)
{
  return [a1 secondaryLabelColor];
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return [a1 send];
}

id objc_msgSend_serviceOwnersManager(void *a1, const char *a2, ...)
{
  return [a1 serviceOwnersManager];
}

id objc_msgSend_sharedCalendarEmail(void *a1, const char *a2, ...)
{
  return [a1 sharedCalendarEmail];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return [a1 specifiers];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startSpinner(void *a1, const char *a2, ...)
{
  return [a1 startSpinner];
}

id objc_msgSend_statusCode(void *a1, const char *a2, ...)
{
  return [a1 statusCode];
}

id objc_msgSend_stopAnimating(void *a1, const char *a2, ...)
{
  return [a1 stopAnimating];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_toDictionary(void *a1, const char *a2, ...)
{
  return [a1 toDictionary];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_udid(void *a1, const char *a2, ...)
{
  return [a1 udid];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return [a1 uppercaseString];
}

id objc_msgSend_urlString(void *a1, const char *a2, ...)
{
  return [a1 urlString];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_widthAnchor(void *a1, const char *a2, ...)
{
  return [a1 widthAnchor];
}