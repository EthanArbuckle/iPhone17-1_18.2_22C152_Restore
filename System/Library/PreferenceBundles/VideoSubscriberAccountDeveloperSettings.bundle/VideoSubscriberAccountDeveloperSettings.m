void sub_1598(id a1)
{
  uint64_t vars8;

  qword_11718 = objc_alloc_init(VSDeveloperSettingsFacade);

  _objc_release_x1();
}

void sub_1888(id *a1)
{
  v2 = [a1[4] result];
  v3 = [v2 forceUnwrapObject];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_19D8;
  v8[3] = &unk_C378;
  id v9 = a1[5];
  [v3 unwrapObject:v8 error:&stru_C3B8];
  v4 = [a1[6] result];
  v5 = [v4 forceUnwrapObject];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1A98;
  v6[3] = &unk_C3E0;
  id v7 = a1[5];
  [v5 unwrapObject:v6 error:&stru_C400];
}

void sub_19D8(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setProviders:a2];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:*(void *)(a1 + 32)];
}

void sub_1A44(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_719C();
  }
}

void sub_1A98(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSettings:a2];
  [*(id *)(a1 + 32) _updateLabels];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:*(void *)(a1 + 32)];
}

void sub_1B0C(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_7204();
  }
}

id sub_1B60(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHasRealSetTopBoxProfile:a2 != 0];
}

void sub_1EEC(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2004;
  v7[3] = &unk_C478;
  v4 = *(void **)(a1 + 48);
  v7[4] = *(void *)(a1 + 40);
  id v8 = v4;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2078;
  v5[3] = &unk_C4A0;
  id v6 = *(id *)(a1 + 48);
  [v3 unwrapObject:v7 error:v5];
}

uint64_t sub_2004(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setProviders:a2];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:*(void *)(a1 + 32)];

  v4 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);

  return v4();
}

uint64_t sub_2078(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2180(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2304(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) result];
  id v3 = [v2 forceUnwrapObject];

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_2A84(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 64));
  _Unwind_Resume(a1);
}

void sub_2ABC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_2B6C;
    v7[3] = &unk_C518;
    uint64_t v6 = *(void *)(a1 + 32);
    v7[4] = WeakRetained;
    void v7[5] = v6;
    [v3 unwrapObject:v7 error:&stru_C538];
  }
}

void sub_2B6C(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setSettings:a2];
  [*(id *)(a1 + 32) _updateLabels];
  id v3 = +[NSNotificationCenter defaultCenter];
  [v3 postNotificationName:@"VSDeveloperSettingsFacadeSettingsDidUpdateNotification" object:*(void *)(a1 + 40)];
}

void sub_2BE0(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_726C();
  }
}

void sub_2C34(id *a1)
{
  v1 = a1;
  uint64_t v2 = [a1[4] result];
  id v3 = [v2 forceUnwrapObject];

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2D4C;
  v6[3] = &unk_C588;
  v1 += 5;
  objc_copyWeak(&v7, v1);
  [v3 unwrapObject:v6 error:&stru_C5A8];
  id WeakRetained = objc_loadWeakRetained(v1);
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 postNotificationName:@"VSDeveloperSettingsFacadeProvidersDidUpdateNotification" object:WeakRetained];

  objc_destroyWeak(&v7);
}

void sub_2D34(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2D4C(uint64_t a1, void *a2)
{
  uint64_t v2 = (id *)(a1 + 32);
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(v2);
  [WeakRetained setProviders:v3];
}

void sub_2DA8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_72D4();
  }
}

id sub_2DFC(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) setHasRealSetTopBoxProfile:a2 != 0];
}

void sub_2FD4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_3DA8(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = +[NSBundle vs_frameworkBundle];
    v5 = [v4 localizedStringForKey:@"DEVELOPER_GENERIC_SAVE_ERROR_TITLE" value:0 table:0];

    uint64_t v6 = +[NSBundle vs_frameworkBundle];
    id v7 = [v6 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];

    id v8 = [v3 localizedDescription];
    uint64_t v9 = +[UIAlertController alertControllerWithTitle:v5 message:v8 preferredStyle:1];

    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_3F88;
    v16[3] = &unk_C5F8;
    id v17 = v9;
    id v10 = v9;
    v11 = +[UIAlertAction actionWithTitle:v7 style:0 handler:v16];
    [v10 addAction:v11];
    [*(id *)(a1 + 32) presentViewController:v10 animated:1 completion:0];
  }
  else
  {
    v12 = [*(id *)(a1 + 32) identityProvider];

    v13 = *(void **)(a1 + 32);
    if (v12)
    {
      v14 = [v13 navigationController];
      id v15 = [v14 popViewControllerAnimated:1];
    }
    else
    {
      [v13 dismissViewControllerAnimated:1 completion:0];
    }
  }
}

id sub_3F88(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

id sub_3F98(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismissViewControllerAnimated:1 completion:0];
}

void sub_409C(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = VSErrorLogObject();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_733C(a1, (uint64_t)v3, v4);
    }
  }
}

void sub_4388(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) urlOrError];
  id v3 = VSDefaultLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v2;
    _os_log_impl(&dword_0, v3, OS_LOG_TYPE_DEFAULT, "Test validation: %@", buf, 0xCu);
  }

  v4 = +[NSBundle vs_frameworkBundle];
  v5 = [v4 localizedStringForKey:@"ERROR_DISMISS_BUTTON_TITLE" value:0 table:0];

  uint64_t v6 = [*(id *)(a1 + 32) trustInfo];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_45D8;
  v19[3] = &unk_C648;
  v19[4] = *(void *)(a1 + 40);
  id v20 = v6;
  id v21 = v5;
  v12 = _NSConcreteStackBlock;
  uint64_t v13 = 3221225472;
  v14 = sub_4720;
  id v15 = &unk_C670;
  uint64_t v16 = *(void *)(a1 + 40);
  id v17 = v20;
  id v18 = v21;
  id v7 = v21;
  id v8 = v20;
  [v2 unwrapObject:v19 error:&v12];
  uint64_t v9 = objc_msgSend(*(id *)(a1 + 40), "testSystemTrustSpecifier", v12, v13, v14, v15, v16);
  [v9 setProperty:&__kCFBooleanTrue forKey:PSEnabledKey];

  id v10 = *(void **)(a1 + 40);
  v11 = [v10 testSystemTrustSpecifier];
  [v10 reloadSpecifier:v11];
}

void sub_45D8(uint64_t a1)
{
  uint64_t v2 = +[NSBundle vs_frameworkBundle];
  id v9 = [v2 localizedStringForKey:@"TEST_SYSTEM_TRUST_RESULT_ALERT_TITLE" value:0 table:0];

  id v3 = +[NSBundle vs_frameworkBundle];
  v4 = [v3 localizedStringForKey:@"TEST_SYSTEM_TRUST_SUCCESS_ALERT_MESSAGE" value:0 table:0];

  v5 = [*(id *)(a1 + 32) settingsFacade];
  uint64_t v6 = [v5 buildSystemTrustTestAlertMessageWithStatusMessage:v4 andTrustInfo:*(void *)(a1 + 40)];

  id v7 = +[UIAlertController alertControllerWithTitle:v9 message:v6 preferredStyle:1];
  id v8 = +[UIAlertAction actionWithTitle:*(void *)(a1 + 48) style:0 handler:0];
  [v7 addAction:v8];

  [*(id *)(a1 + 32) presentViewController:v7 animated:1 completion:0];
}

void sub_4720(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = +[NSBundle vs_frameworkBundle];
  id v10 = [v4 localizedStringForKey:@"TEST_SYSTEM_TRUST_RESULT_ALERT_ERROR_TITLE" value:0 table:0];

  v5 = [*(id *)(a1 + 32) settingsFacade];
  uint64_t v6 = [v3 localizedDescription];

  id v7 = [v5 buildSystemTrustTestAlertMessageWithStatusMessage:v6 andTrustInfo:*(void *)(a1 + 40)];

  id v8 = +[UIAlertController alertControllerWithTitle:v10 message:v7 preferredStyle:1];
  id v9 = +[UIAlertAction actionWithTitle:*(void *)(a1 + 48) style:0 handler:0];
  [v8 addAction:v9];

  [*(id *)(a1 + 32) presentViewController:v8 animated:1 completion:0];
}

id sub_5860(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_58DC;
  v3[3] = &unk_C3E0;
  v3[4] = *(void *)(a1 + 32);
  return [a2 unwrapObject:v3 error:&stru_C6B8];
}

id sub_58DC(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = a2;
  [v3 setHasLoadedInitialSettings:1];
  uint64_t v5 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 cacheBusterEnabled]);
  uint64_t v6 = *(void *)(a1 + 32);
  id v7 = *(void **)(v6 + 208);
  *(void *)(v6 + 208) = v5;

  uint64_t v8 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v4 requestTimeoutsDisabled]);
  uint64_t v9 = *(void *)(a1 + 32);
  id v10 = *(void **)(v9 + 216);
  *(void *)(v9 + 216) = v8;

  id v11 = [v4 simulateExpiredToken];
  uint64_t v12 = +[NSNumber numberWithBool:v11];
  uint64_t v13 = *(void *)(a1 + 32);
  v14 = *(void **)(v13 + 224);
  *(void *)(v13 + 224) = v12;

  id v15 = *(void **)(a1 + 32);

  return [v15 reloadSpecifiers];
}

void sub_59D8(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  id v3 = VSErrorLogObject();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_7440();
  }
}

void sub_5B94(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5C94;
  v4[3] = &unk_C748;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 unwrapObject:&stru_C720 error:v4];
}

void sub_5C2C(id a1, VSDeveloperSettings *a2)
{
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated cache buster developer setting.", v3, 2u);
  }
}

void sub_5C94(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_74A8();
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 208), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_5E40(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5F40;
  v4[3] = &unk_C748;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 unwrapObject:&stru_C790 error:v4];
}

void sub_5ED8(id a1, VSDeveloperSettings *a2)
{
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated request timeouts developer settings.", v3, 2u);
  }
}

void sub_5F40(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_74A8();
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 216), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_60EC(uint64_t a1, void *a2)
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_61EC;
  v4[3] = &unk_C748;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  [a2 unwrapObject:&stru_C7B0 error:v4];
}

void sub_6184(id a1, VSDeveloperSettings *a2)
{
  uint64_t v2 = VSDefaultLogObject();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl(&dword_0, v2, OS_LOG_TYPE_DEFAULT, "Successfully updated simluate expired token developer settings.", v3, 2u);
  }
}

void sub_61EC(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = VSErrorLogObject();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_74A8();
  }

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 224), *(id *)(a1 + 40));
  [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_719C()
{
  sub_2FF0();
  sub_2FD4(&dword_0, v0, v1, "Error fetching developer providers: %@", v2, v3, v4, v5, v6);
}

void sub_7204()
{
  sub_2FF0();
  sub_2FD4(&dword_0, v0, v1, "Error fetch developer settings: %@", v2, v3, v4, v5, v6);
}

void sub_726C()
{
  sub_2FF0();
  sub_2FD4(&dword_0, v0, v1, "Error fetching updated settings: %@", v2, v3, v4, v5, v6);
}

void sub_72D4()
{
  sub_2FF0();
  sub_2FD4(&dword_0, v0, v1, "Error fetching updated developer providers: %@", v2, v3, v4, v5, v6);
}

void sub_733C(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2112;
  uint64_t v7 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Error deleting identity provider %@: %@", (uint8_t *)&v4, 0x16u);
}

void sub_73C8(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "Received text field did change notification for an unknown text field %@", (uint8_t *)&v2, 0xCu);
}

void sub_7440()
{
  sub_2FF0();
  sub_2FD4(&dword_0, v0, v1, "Error fetching initial developer settings: %@", v2, v3, v4, v5, v6);
}

void sub_74A8()
{
  sub_2FF0();
  sub_2FD4(&dword_0, v0, v1, "Error updating developer settings: %@", v2, v3, v4, v5, v6);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t VSDefaultLogObject()
{
  return _VSDefaultLogObject();
}

uint64_t VSEnqueueCompletionOperation()
{
  return _VSEnqueueCompletionOperation();
}

uint64_t VSErrorLogObject()
{
  return _VSErrorLogObject();
}

uint64_t VSMainThreadOperationWithBlock()
{
  return _VSMainThreadOperationWithBlock();
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return [a1 UUIDString];
}

id objc_msgSend__updateLabels(void *a1, const char *a2, ...)
{
  return [a1 _updateLabels];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_alertMessageForProxyDetection(void *a1, const char *a2, ...)
{
  return [a1 alertMessageForProxyDetection];
}

id objc_msgSend_alertTitleForProxyDetection(void *a1, const char *a2, ...)
{
  return [a1 alertTitleForProxyDetection];
}

id objc_msgSend_apiEnabled(void *a1, const char *a2, ...)
{
  return [a1 apiEnabled];
}

id objc_msgSend_authenticationURL(void *a1, const char *a2, ...)
{
  return [a1 authenticationURL];
}

id objc_msgSend_authenticationURLSpecicier(void *a1, const char *a2, ...)
{
  return [a1 authenticationURLSpecicier];
}

id objc_msgSend_authenticationURLTextField(void *a1, const char *a2, ...)
{
  return [a1 authenticationURLTextField];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cacheBusterEnabled(void *a1, const char *a2, ...)
{
  return [a1 cacheBusterEnabled];
}

id objc_msgSend_cacheBusterSpecifier(void *a1, const char *a2, ...)
{
  return [a1 cacheBusterSpecifier];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_dismissTitleForProxyDetection(void *a1, const char *a2, ...)
{
  return [a1 dismissTitleForProxyDetection];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_displayNameSpecicier(void *a1, const char *a2, ...)
{
  return [a1 displayNameSpecicier];
}

id objc_msgSend_displayNameTextField(void *a1, const char *a2, ...)
{
  return [a1 displayNameTextField];
}

id objc_msgSend_editableTextField(void *a1, const char *a2, ...)
{
  return [a1 editableTextField];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_firstResponder(void *a1, const char *a2, ...)
{
  return [a1 firstResponder];
}

id objc_msgSend_forceUnwrapObject(void *a1, const char *a2, ...)
{
  return [a1 forceUnwrapObject];
}

id objc_msgSend_hasLoadedInitialSettings(void *a1, const char *a2, ...)
{
  return [a1 hasLoadedInitialSettings];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_identifierSpecicier(void *a1, const char *a2, ...)
{
  return [a1 identifierSpecicier];
}

id objc_msgSend_identifierTextField(void *a1, const char *a2, ...)
{
  return [a1 identifierTextField];
}

id objc_msgSend_identityProvider(void *a1, const char *a2, ...)
{
  return [a1 identityProvider];
}

id objc_msgSend_isInSetTopBoxMode(void *a1, const char *a2, ...)
{
  return [a1 isInSetTopBoxMode];
}

id objc_msgSend_isProxyConfigured(void *a1, const char *a2, ...)
{
  return [a1 isProxyConfigured];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_nameForSorting(void *a1, const char *a2, ...)
{
  return [a1 nameForSorting];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_privateQueue(void *a1, const char *a2, ...)
{
  return [a1 privateQueue];
}

id objc_msgSend_providerID(void *a1, const char *a2, ...)
{
  return [a1 providerID];
}

id objc_msgSend_providerSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 providerSpecifiers];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return [a1 providers];
}

id objc_msgSend_providersChangeRemoteNotifier(void *a1, const char *a2, ...)
{
  return [a1 providersChangeRemoteNotifier];
}

id objc_msgSend_providersDirty(void *a1, const char *a2, ...)
{
  return [a1 providersDirty];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_requestTimeoutsDisabled(void *a1, const char *a2, ...)
{
  return [a1 requestTimeoutsDisabled];
}

id objc_msgSend_requestTimeoutsSpecifier(void *a1, const char *a2, ...)
{
  return [a1 requestTimeoutsSpecifier];
}

id objc_msgSend_requireAuthenticationURLSystemTrustEnabled(void *a1, const char *a2, ...)
{
  return [a1 requireAuthenticationURLSystemTrustEnabled];
}

id objc_msgSend_requireXHRRequestSystemTrustEnabled(void *a1, const char *a2, ...)
{
  return [a1 requireXHRRequestSystemTrustEnabled];
}

id objc_msgSend_resignFirstResponder(void *a1, const char *a2, ...)
{
  return [a1 resignFirstResponder];
}

id objc_msgSend_result(void *a1, const char *a2, ...)
{
  return [a1 result];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_samlEnabled(void *a1, const char *a2, ...)
{
  return [a1 samlEnabled];
}

id objc_msgSend_setTopBoxIdentityProviderID(void *a1, const char *a2, ...)
{
  return [a1 setTopBoxIdentityProviderID];
}

id objc_msgSend_setTopBoxSupportsOptOut(void *a1, const char *a2, ...)
{
  return [a1 setTopBoxSupportsOptOut];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_settingsChangeRemoteNotifier(void *a1, const char *a2, ...)
{
  return [a1 settingsChangeRemoteNotifier];
}

id objc_msgSend_settingsFacade(void *a1, const char *a2, ...)
{
  return [a1 settingsFacade];
}

id objc_msgSend_sharedFacade(void *a1, const char *a2, ...)
{
  return [a1 sharedFacade];
}

id objc_msgSend_simulateExpiredToken(void *a1, const char *a2, ...)
{
  return [a1 simulateExpiredToken];
}

id objc_msgSend_simulateExpiredTokenSpecifier(void *a1, const char *a2, ...)
{
  return [a1 simulateExpiredTokenSpecifier];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_stbChangeRemoteNotifier(void *a1, const char *a2, ...)
{
  return [a1 stbChangeRemoteNotifier];
}

id objc_msgSend_supportedAuthenticationSchemes(void *a1, const char *a2, ...)
{
  return [a1 supportedAuthenticationSchemes];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_testSystemTrustSpecifier(void *a1, const char *a2, ...)
{
  return [a1 testSystemTrustSpecifier];
}

id objc_msgSend_testingSystemTrust(void *a1, const char *a2, ...)
{
  return [a1 testingSystemTrust];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_trustInfo(void *a1, const char *a2, ...)
{
  return [a1 trustInfo];
}

id objc_msgSend_uniqueID(void *a1, const char *a2, ...)
{
  return [a1 uniqueID];
}

id objc_msgSend_urlOrError(void *a1, const char *a2, ...)
{
  return [a1 urlOrError];
}

id objc_msgSend_vs_frameworkBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "vs_frameworkBundle");
}