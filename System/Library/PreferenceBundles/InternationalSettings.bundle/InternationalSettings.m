void sub_2F64(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2F84(uint64_t a1)
{
  v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v4 = [WeakRetained isCancelled];

  if ((v4 & 1) == 0)
  {
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_3048;
    v5[3] = &unk_30BF0;
    objc_copyWeak(&v6, v2);
    v5[4] = *(void *)(a1 + 32);
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v5);
    objc_destroyWeak(&v6);
  }
}

void sub_3048(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  unsigned __int8 v3 = [WeakRetained isCancelled];

  if ((v3 & 1) == 0)
  {
    unsigned __int8 v4 = *(void **)(a1 + 32);
    [v4 reloadSpecifiers];
  }
}

void sub_3BD4(uint64_t a1)
{
  id v2 = +[UIApplication sharedApplication];
  [v2 endBackgroundTask:*(void *)(a1 + 32)];
}

id sub_3C80()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_39180;
  uint64_t v7 = qword_39180;
  if (!qword_39180)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_67EC;
    v3[3] = &unk_30D98;
    v3[4] = &v4;
    sub_67EC((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_3D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_3E4C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_39190;
  uint64_t v7 = qword_39190;
  if (!qword_39190)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_69A4;
    v3[3] = &unk_30D98;
    v3[4] = &v4;
    sub_69A4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_3F18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_3F30(uint64_t a1)
{
  id v2 = [sub_3E4C() sharedManager];
  unsigned __int8 v3 = [v2 currentUser];
  uint64_t v4 = [v3 alternateDSID];

  if (v4)
  {
    v20[0] = @"AppleLanguages";
    v5 = +[NSLocale preferredLanguages];
    v20[1] = @"AppleLocale";
    v21[0] = v5;
    uint64_t v6 = +[NSLocale currentLocale];
    uint64_t v7 = [v6 localeIdentifier];
    v21[1] = v7;
    v8 = +[NSDictionary dictionaryWithObjects:v21 forKeys:v20 count:2];

    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x2050000000;
    v9 = (void *)qword_391A0;
    uint64_t v19 = qword_391A0;
    if (!qword_391A0)
    {
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_6B5C;
      v15[3] = &unk_30D98;
      v15[4] = &v16;
      sub_6B5C((uint64_t)v15);
      v9 = (void *)v17[3];
    }
    id v10 = v9;
    _Block_object_dispose(&v16, 8);
    v11 = objc_opt_new();
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_41A4;
    v13[3] = &unk_30C38;
    id v14 = *(id *)(a1 + 32);
    [v11 setConfigurationInfo:v8 forIdentifier:@"com.apple.idms.config.Language" forAltDSID:v4 completion:v13];
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 32);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
}

void sub_4184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_41A4(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_4244(id a1)
{
  +[UIKeyboardImpl purgeImageCache];
  id v1 = +[NSURL URLWithString:@"prefs:root=General&path=INTERNATIONAL"];
  id v2 = +[SBSRelaunchAction actionWithReason:@"Language Change" options:6 targetURL:v1];

  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x2050000000;
  unsigned __int8 v3 = (void *)qword_391B0;
  uint64_t v11 = qword_391B0;
  if (!qword_391B0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_6D14;
    v7[3] = &unk_30D98;
    v7[4] = &v8;
    sub_6D14((uint64_t)v7);
    unsigned __int8 v3 = (void *)v9[3];
  }
  id v4 = v3;
  _Block_object_dispose(&v8, 8);
  v5 = [v4 sharedService];
  uint64_t v6 = +[NSSet setWithObject:v2];
  [v5 sendActions:v6 withResult:0];
}

void sub_439C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

int64_t sub_51F0(id a1, NSString *a2, NSString *a3)
{
  return [(NSString *)a2 localizedStandardCompare:a3];
}

id sub_51F8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

void sub_5208(id a1, UIAlertAction *a2)
{
  id v3 = +[NSUserDefaults standardUserDefaults];
  id v2 = +[NSNumber numberWithBool:1];
  [v3 setObject:v2 forKey:@"AppleLiveTextEnabled" inDomain:NSGlobalDomain];
}

id sub_58A8()
{
  v0 = objc_opt_class();

  return [v0 syncPreferencesAndPostNotificationForLanguageChange];
}

Class sub_67EC(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_39188)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6930;
    v3[4] = &unk_30C10;
    void v3[5] = v3;
    long long v4 = off_30DB8;
    uint64_t v5 = 0;
    qword_39188 = _sl_dlopen();
    if (!qword_39188)
    {
      abort_report_np();
LABEL_8:
      sub_20C14();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CloudSettingsManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_39180 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6930()
{
  uint64_t result = _sl_dlopen();
  qword_39188 = result;
  return result;
}

Class sub_69A4(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_39198)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6AE8;
    v3[4] = &unk_30C10;
    void v3[5] = v3;
    long long v4 = off_30DD0;
    uint64_t v5 = 0;
    qword_39198 = _sl_dlopen();
    if (!qword_39198)
    {
      abort_report_np();
LABEL_8:
      sub_20C3C();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("UMUserManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_39190 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6AE8()
{
  uint64_t result = _sl_dlopen();
  qword_39198 = result;
  return result;
}

Class sub_6B5C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_391A8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6CA0;
    v3[4] = &unk_30C10;
    void v3[5] = v3;
    long long v4 = off_30DE8;
    uint64_t v5 = 0;
    qword_391A8 = _sl_dlopen();
    if (!qword_391A8)
    {
      abort_report_np();
LABEL_8:
      sub_20C64();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("AKAppleIDAuthenticationController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_391A0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6CA0()
{
  uint64_t result = _sl_dlopen();
  qword_391A8 = result;
  return result;
}

Class sub_6D14(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_391B8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_6E58;
    v3[4] = &unk_30C10;
    void v3[5] = v3;
    long long v4 = off_30E00;
    uint64_t v5 = 0;
    qword_391B8 = _sl_dlopen();
    if (!qword_391B8)
    {
      abort_report_np();
LABEL_8:
      sub_20C8C();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("FBSSystemService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_391B0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_6E58()
{
  uint64_t result = _sl_dlopen();
  qword_391B8 = result;
  return result;
}

void sub_856C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_858C(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 regionsList];
  long long v4 = [v2 filteredRegionsForRegionList:v3 searchString:*(void *)(a1 + 40)];

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v6 = [WeakRetained isCancelled];

  if ((v6 & 1) == 0)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_8678;
    v7[3] = &unk_30E20;
    v7[4] = *(void *)(a1 + 32);
    id v8 = v4;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v7);
  }
}

id sub_8678(uint64_t a1)
{
  [*(id *)(a1 + 32) setFilteredListContent:*(void *)(a1 + 40)];
  id v2 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v2 reloadData];
}

void sub_8984(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_89A4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id result = [*(id *)(a1 + 32) evaluateWithObject:a2];
  if (result)
  {
    id result = [*(id *)(a1 + 40) addObject:*(void *)(a1 + 48)];
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
    *a7 = 1;
  }
  return result;
}

uint64_t sub_9560(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listController];
  [v1 deselectHighlightedRow];

  return 1;
}

id sub_9598(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleAlertActionAndChangeLanguage:1];
}

id sub_95A4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleAlertActionAndChangeLanguage:0];
}

id sub_95B0(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleAlertActionAndChangeLanguage:0];
}

uint64_t sub_95BC(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listController];
  [v1 deselectHighlightedRow];

  return 1;
}

id sub_9790(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) parentController];
  [v1 reloadSpecifiers];

  return +[InternationalSettingsController syncPreferencesAndPostNotificationForLanguageChange];
}

void layoutSubviewsPatchForTextLabelTruncation(void *a1)
{
  id v18 = a1;
  id v1 = [v18 textLabel];
  [v1 frame];
  double v3 = v2;
  double v5 = v4;
  double v7 = v6;

  id v8 = [v18 textLabel];
  v9 = [v8 superview];

  [v9 size];
  double v11 = v10;
  [v9 directionalLayoutMargins];
  double v13 = v12;
  [v9 directionalLayoutMargins];
  double v15 = v14;
  if ([UIApp userInterfaceLayoutDirection] == (char *)&dword_0 + 1)
  {
    [v9 directionalLayoutMargins];
    double v3 = v16;
  }
  v17 = [v18 textLabel];
  objc_msgSend(v17, "setFrame:", v3, v5, v11 - v13 - v15, v7);
}

void sub_A5A4(id a1)
{
  qword_391C8 = objc_alloc_init(ISInternationalLocaleRepresentation);

  _objc_release_x1();
}

id COSActivePairingIsTinker()
{
  v0 = +[NRPairedDeviceRegistry sharedInstance];
  id v1 = +[NRPairedDeviceRegistry activePairedDeviceSelectorBlock];
  double v2 = [v0 getAllDevicesWithArchivedAltAccountDevicesMatching:v1];
  double v3 = [v2 firstObject];

  double v4 = [v3 valueForProperty:NRDevicePropertyIsAltAccount];
  id v5 = [v4 BOOLValue];

  return v5;
}

id sub_ABB4(uint64_t a1)
{
  v13[0] = @"languages";
  double v2 = +[NSLocale preferredLanguages];
  v14[0] = v2;
  v13[1] = @"languages-count";
  double v3 = +[NSLocale preferredLanguages];
  double v4 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v3 count]);
  v14[1] = v4;
  v13[2] = @"device-language";
  id v5 = +[NSLocale _deviceLanguage];
  v14[2] = v5;
  v13[3] = @"locale";
  double v6 = +[NSLocale currentLocale];
  double v7 = [v6 localeIdentifier];
  uint64_t v8 = *(void *)(a1 + 32);
  v14[3] = v7;
  v14[4] = v8;
  void v13[4] = @"top-language-and-locale-pair";
  v13[5] = @"calendar";
  v9 = +[NSCalendar currentCalendar];
  double v10 = [v9 calendarIdentifier];
  v14[5] = v10;
  double v11 = +[NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:6];

  return v11;
}

id sub_AFF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) saveLanguage:*(unsigned __int8 *)(a1 + 40)];
}

int64_t sub_BAB0(id a1, NSString *a2, NSString *a3)
{
  double v4 = a3;
  id v5 = a2;
  double v6 = +[NSLocale _deviceLanguage];
  double v7 = +[NSLocale localeWithLocaleIdentifier:v6];
  uint64_t v8 = [v7 localizedStringForLanguage:v5 context:3];

  v9 = +[NSLocale _deviceLanguage];
  double v10 = +[NSLocale localeWithLocaleIdentifier:v9];
  double v11 = [v10 localizedStringForLanguage:v4 context:3];

  id v12 = [v8 localizedStandardCompare:v11];
  return (int64_t)v12;
}

uint64_t sub_C4F8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_D254(uint64_t a1)
{
  id v4 = +[NSIndexPath indexPathForRow:*(void *)(a1 + 40) inSection:*(void *)(a1 + 48)];
  double v2 = [*(id *)(a1 + 32) tableView:*(void *)(*(void *)(a1 + 32) + 32) cellForRowAtIndexPath:v4];
  double v3 = [v2 textLabel];
  objc_msgSend(v3, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
}

void sub_E524(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va1, a9);
  va_start(va, a9);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  uint64_t v13 = va_arg(va1, void);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v15 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_E554(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_E564(uint64_t a1)
{
}

void sub_E56C(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v12 = a2;
  double v7 = [v12 objectForKeyedSubscript:@"kLanguageSectionKeyLanguages"];
  unsigned int v8 = [v7 containsObject:a1[4]];

  if (v8)
  {
    *(void *)(*(void *)(a1[5] + 8) + 24) = a3;
    uint64_t v9 = [v12 objectForKeyedSubscript:@"kLanguageSectionKeyLanguages"];
    uint64_t v10 = *(void *)(a1[6] + 8);
    double v11 = *(void **)(v10 + 40);
    *(void *)(v10 + 40) = v9;

    *a4 = 1;
  }
}

void sub_E784(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_E7A4(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) unfilteredLanguageSections];
  uint64_t v15 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v2 count]);

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  double v3 = [*(id *)(a1 + 32) unfilteredLanguageSections];
  id v4 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        unsigned int v8 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v9 = [v8 objectForKeyedSubscript:@"kLanguageSectionKeyLanguages"];
        uint64_t v10 = [v9 filteredLanguagesBySearchString:*(void *)(a1 + 40)];

        if ([v10 count])
        {
          v22[0] = @"kLanguageSectionKeyTitle";
          double v11 = [v8 objectForKeyedSubscript:@"kLanguageSectionKeyTitle"];
          v22[1] = @"kLanguageSectionKeyLanguages";
          v23[0] = v11;
          v23[1] = v10;
          id v12 = +[NSDictionary dictionaryWithObjects:v23 forKeys:v22 count:2];

          [v15 addObject:v12];
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v18 objects:v24 count:16];
    }
    while (v5);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  unsigned __int8 v14 = [WeakRetained isCancelled];

  if ((v14 & 1) == 0)
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_EA08;
    block[3] = &unk_30E20;
    block[4] = *(void *)(a1 + 32);
    id v17 = v15;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

id sub_EA08(uint64_t a1)
{
  [*(id *)(a1 + 32) setFilteredLanguageSections:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(a1 + 32) + 48) = 1;
  double v2 = *(void **)(*(void *)(a1 + 32) + 32);

  return [v2 reloadData];
}

id sub_F4D8(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleAlertAction:1];
}

id sub_F4E4(uint64_t a1)
{
  return _[*(id *)(a1 + 32) handleAlertAction:0];
}

uint64_t sub_F4F0(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) listController];
  [v1 deselectHighlightedRow];

  return 1;
}

void sub_FA18(id a1)
{
}

id sub_10DF0(uint64_t a1)
{
  [*(id *)(a1 + 32) moveSpecifierAtIndexPath:*(void *)(a1 + 40) toIndexPath:*(void *)(a1 + 48) moveRow:1];
  double v2 = *(void **)(a1 + 32);

  return [v2 setUpdatedAppleLanguages:0];
}

id sub_10E38(uint64_t a1)
{
  return [*(id *)(a1 + 32) changeLanguage:0];
}

void sub_11280(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  uint64_t v9 = a4;
  if ([*(id *)(a1 + 32) isEditing])
  {
    [*(id *)(a1 + 32) initializeUpdatedAppleLanguagesIfNeeded];
    if (((unint64_t)[*(id *)(a1 + 40) row] & 0x8000000000000000) == 0)
    {
      id v10 = [*(id *)(a1 + 40) row];
      double v11 = [*(id *)(a1 + 32) updatedAppleLanguages];
      if (![v11 count]) {
        sub_20DE8();
      }

      id v12 = [*(id *)(a1 + 32) updatedAppleLanguages];
      id v13 = [v12 count];

      if (v10 < v13)
      {
        unsigned __int8 v14 = [*(id *)(a1 + 32) updatedAppleLanguages];
        [v14 removeObjectAtIndex:v10];

        uint64_t v15 = *(void **)(a1 + 32);
        uint64_t v16 = [v15 specifierAtIndexPath:*(void *)(a1 + 40)];
        [v15 removeSpecifier:v16 animated:1];

        v9[2](v9, 1);
      }
    }
  }
  else
  {
    id v17 = +[ISInternationalViewController localizedRestartStringForCurrentDevice];
    long long v18 = +[UIDevice currentDevice];
    long long v19 = +[UIAlertController alertControllerWithTitle:message:preferredStyle:](UIAlertController, "alertControllerWithTitle:message:preferredStyle:", v17, 0, objc_msgSend(v18, "sf_isiPad"));

    long long v20 = +[NSBundle bundleForClass:objc_opt_class()];
    [v20 localizedStringForKey:@"CANCEL_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
    long long v21 = v28 = v7;
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_11608;
    v32[3] = &unk_31040;
    v22 = v9;
    v33 = v22;
    v23 = +[UIAlertAction actionWithTitle:v21 style:1 handler:v32];

    v24 = +[NSBundle bundleForClass:objc_opt_class()];
    v25 = [v24 localizedStringForKey:@"CONTINUE_CHANGE_LANGUAGE" value:&stru_31478 table:@"InternationalSettings"];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_1161C;
    v29[3] = &unk_31068;
    v26 = *(void **)(a1 + 40);
    v29[4] = *(void *)(a1 + 32);
    id v30 = v26;
    v31 = v22;
    v27 = +[UIAlertAction actionWithTitle:v25 style:2 handler:v29];

    [v19 addAction:v23];
    [v19 addAction:v27];
    [*(id *)(a1 + 32) presentViewController:v19 animated:1 completion:0];

    id v7 = v28;
  }
}

uint64_t sub_11608(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

uint64_t sub_1161C(uint64_t a1)
{
  double v2 = *(void **)(a1 + 32);
  double v3 = [v2 specifierAtIndexPath:*(void *)(a1 + 40)];
  [v2 removeSpecifier:v3 animated:1];

  [*(id *)(a1 + 32) initializeUpdatedAppleLanguagesIfNeeded];
  id v4 = [*(id *)(a1 + 32) updatedAppleLanguages];
  objc_msgSend(v4, "removeObjectAtIndex:", objc_msgSend(*(id *)(a1 + 40), "row"));

  [*(id *)(a1 + 32) changeLanguage:0];
  id v5 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v5();
}

void sub_12C90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_13128(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_391D8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_1326C;
    v3[4] = &unk_30C10;
    void v3[5] = v3;
    long long v4 = off_310B0;
    uint64_t v5 = 0;
    qword_391D8 = _sl_dlopen();
    if (!qword_391D8)
    {
      abort_report_np();
LABEL_8:
      sub_20C14();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CloudSettingsManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_391D0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_1326C()
{
  uint64_t result = _sl_dlopen();
  qword_391D8 = result;
  return result;
}

id sub_14A9C(uint64_t a1)
{
  +[InternationalSettingsController setPreferredLanguages:*(void *)(a1 + 32)];

  return +[InternationalSettingsController syncPreferencesAndPostNotificationForLanguageChange];
}

uint64_t sub_14AE0(void *a1, void *a2)
{
  BOOL v4 = *a1 == *a2 && a1[1] == a2[1];
  if (!v4 && (sub_21320() & 1) == 0) {
    return 0;
  }
  uint64_t v5 = type metadata accessor for Option();
  if ((sub_211E0() & 1) == 0) {
    return 0;
  }
  uint64_t v6 = *(int *)(v5 + 40);

  return static UUID.== infix(_:_:)((char *)a1 + v6, (char *)a2 + v6);
}

uint64_t sub_14BA4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4 = v2 + *(int *)(a1 + 40);
  uint64_t v5 = sub_20F70();
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);

  return v6(a2, v4, v5);
}

uint64_t sub_14C14(void *a1, void *a2)
{
  return sub_14AE0(a1, a2);
}

id sub_14C60()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for Settings();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for Settings()
{
  return self;
}

uint64_t sub_14CB8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return _swift_allocateGenericValueMetadata(a1, a2, a3, 32);
}

uint64_t sub_14CC0()
{
  uint64_t result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    uint64_t result = sub_20F70();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_14D98(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  int v7 = *(_DWORD *)(v6 + 80);
  uint64_t v8 = v7;
  uint64_t v9 = *(void *)(v6 + 64);
  uint64_t v10 = sub_20F70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(_DWORD *)(v11 + 80);
  uint64_t v13 = v9 + v12;
  if ((v12 | (unint64_t)v7) > 7
    || ((*(_DWORD *)(v11 + 80) | v7) & 0x100000) != 0
    || ((v13 + ((v7 + 16) & ~(unint64_t)v7)) & ~v12)
     + *(void *)(*(void *)(v10 - 8) + 64) > 0x18)
  {
    uint64_t v16 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v16
                   + (((v12 | v7) & 0xF8 ^ 0x1F8) & ((v12 | v7) + 16)));
    swift_retain();
  }
  else
  {
    uint64_t v17 = v10;
    uint64_t v18 = ~v12;
    uint64_t v19 = a2[1];
    *a1 = *a2;
    a1[1] = v19;
    long long v20 = (char *)a2 + v8;
    uint64_t v21 = ((unint64_t)a1 + v8 + 16) & ~v8;
    uint64_t v22 = (unint64_t)(v20 + 16) & ~v8;
    v23 = *(void (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
    swift_bridgeObjectRetain();
    v23(v21, v22, v5);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))((v21 + v13) & v18, (v22 + v13) & v18, v17);
  }
  return a1;
}

uint64_t sub_14F4C(uint64_t a1, uint64_t a2)
{
  swift_bridgeObjectRelease();
  uint64_t v4 = *(void *)(*(void *)(a2 + 16) - 8);
  uint64_t v5 = v4 + 8;
  unint64_t v6 = (a1 + *(unsigned __int8 *)(v4 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  (*(void (**)(unint64_t))(v4 + 8))(v6);
  uint64_t v7 = *(void *)(v5 + 56);
  uint64_t v8 = sub_20F70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(uint64_t (**)(unint64_t, uint64_t))(v9 + 8);
  uint64_t v11 = v8;
  unint64_t v12 = (v6 + v7 + *(unsigned __int8 *)(v9 + 80)) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);

  return v10(v12, v11);
}

void *sub_15018(void *a1, void *a2, uint64_t a3)
{
  uint64_t v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  uint64_t v5 = *(void *)(a3 + 16);
  unint64_t v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v5 - 8) + 16);
  uint64_t v7 = *(void *)(v5 - 8) + 16;
  uint64_t v8 = *(unsigned __int8 *)(*(void *)(v5 - 8) + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  swift_bridgeObjectRetain();
  v6(v9, v10, v5);
  uint64_t v11 = *(void *)(v7 + 48);
  uint64_t v12 = sub_20F70();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 16))((v11 + *(unsigned __int8 *)(v13 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v11 + *(unsigned __int8 *)(v13 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), v12);
  return a1;
}

void *sub_150F8(void *a1, void *a2, uint64_t a3)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  uint64_t v6 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v7 = v6 + 24;
  uint64_t v8 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v9 = ((unint64_t)a1 + v8 + 16) & ~v8;
  uint64_t v10 = ((unint64_t)a2 + v8 + 16) & ~v8;
  (*(void (**)(uint64_t, uint64_t))(v6 + 24))(v9, v10);
  uint64_t v11 = *(void *)(v7 + 40);
  uint64_t v12 = sub_20F70();
  uint64_t v13 = *(void *)(v12 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v13 + 24))((v11 + *(unsigned __int8 *)(v13 + 80) + v9) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), (v11 + *(unsigned __int8 *)(v13 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80), v12);
  return a1;
}

_OWORD *sub_151E8(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  *a1 = *a2;
  uint64_t v4 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v5 = v4 + 32;
  uint64_t v6 = *(unsigned __int8 *)(v4 + 80);
  uint64_t v7 = ((unint64_t)a1 + v6 + 16) & ~v6;
  uint64_t v8 = ((unint64_t)a2 + v6 + 16) & ~v6;
  (*(void (**)(uint64_t, uint64_t))(v4 + 32))(v7, v8);
  uint64_t v9 = *(void *)(v5 + 32);
  uint64_t v10 = sub_20F70();
  uint64_t v11 = *(void *)(v10 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v11 + 32))((v9 + *(unsigned __int8 *)(v11 + 80) + v7) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), (v9 + *(unsigned __int8 *)(v11 + 80) + v8) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80), v10);
  return a1;
}

void *sub_152B8(void *a1, void *a2, uint64_t a3)
{
  uint64_t v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  swift_bridgeObjectRelease();
  uint64_t v7 = *(void *)(*(void *)(a3 + 16) - 8);
  uint64_t v8 = v7 + 40;
  uint64_t v9 = *(unsigned __int8 *)(v7 + 80);
  uint64_t v10 = ((unint64_t)a1 + v9 + 16) & ~v9;
  uint64_t v11 = ((unint64_t)a2 + v9 + 16) & ~v9;
  (*(void (**)(uint64_t, uint64_t))(v7 + 40))(v10, v11);
  uint64_t v12 = *(void *)(v8 + 24);
  uint64_t v13 = sub_20F70();
  uint64_t v14 = *(void *)(v13 - 8);
  (*(void (**)(unint64_t, unint64_t, uint64_t))(v14 + 40))((v12 + *(unsigned __int8 *)(v14 + 80) + v10) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80), (v12 + *(unsigned __int8 *)(v14 + 80) + v11) & ~(unint64_t)*(unsigned __int8 *)(v14 + 80), v13);
  return a1;
}

uint64_t sub_15398(unsigned __int16 *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v5 = *(void *)(a3 + 16);
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(unsigned int *)(v6 + 84);
  uint64_t v8 = sub_20F70();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = *(unsigned __int8 *)(v6 + 80);
  uint64_t v11 = *(void *)(v6 + 64);
  uint64_t v12 = *(unsigned __int8 *)(v9 + 80);
  if (v7 <= *(_DWORD *)(v9 + 84)) {
    unsigned int v13 = *(_DWORD *)(v9 + 84);
  }
  else {
    unsigned int v13 = v7;
  }
  if (v13 <= 0x7FFFFFFF) {
    unsigned int v14 = 0x7FFFFFFF;
  }
  else {
    unsigned int v14 = v13;
  }
  if (!a2) {
    return 0;
  }
  if (a2 <= v14) {
    goto LABEL_28;
  }
  uint64_t v15 = ((v11 + v12 + ((v10 + 16) & ~v10)) & ~v12) + *(void *)(*(void *)(v8 - 8) + 64);
  char v16 = 8 * v15;
  if (v15 <= 3)
  {
    unsigned int v19 = ((a2 - v14 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v19))
    {
      int v17 = *(_DWORD *)((char *)a1 + v15);
      if (!v17) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 > 0xFF)
    {
      int v17 = *(unsigned __int16 *)((char *)a1 + v15);
      if (!*(unsigned __int16 *)((char *)a1 + v15)) {
        goto LABEL_28;
      }
      goto LABEL_18;
    }
    if (v19 < 2)
    {
LABEL_28:
      if ((v13 & 0x80000000) != 0)
      {
        uint64_t v24 = ((unint64_t)a1 + v10 + 16) & ~v10;
        if (v7 == v14)
        {
          v25 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
          return v25(v24, v7, v5);
        }
        else
        {
          uint64_t v26 = (v24 + v11 + v12) & ~v12;
          v27 = *(uint64_t (**)(uint64_t))(v9 + 48);
          return v27(v26);
        }
      }
      else
      {
        unint64_t v23 = *((void *)a1 + 1);
        if (v23 >= 0xFFFFFFFF) {
          LODWORD(v23) = -1;
        }
        return (v23 + 1);
      }
    }
  }
  int v17 = *((unsigned __int8 *)a1 + v15);
  if (!*((unsigned char *)a1 + v15)) {
    goto LABEL_28;
  }
LABEL_18:
  int v20 = (v17 - 1) << v16;
  if (v15 > 3) {
    int v20 = 0;
  }
  if (v15)
  {
    if (v15 <= 3) {
      int v21 = v15;
    }
    else {
      int v21 = 4;
    }
    switch(v21)
    {
      case 2:
        int v22 = *a1;
        break;
      case 3:
        int v22 = *a1 | (*((unsigned __int8 *)a1 + 2) << 16);
        break;
      case 4:
        int v22 = *(_DWORD *)a1;
        break;
      default:
        int v22 = *(unsigned __int8 *)a1;
        break;
    }
  }
  else
  {
    int v22 = 0;
  }
  return v14 + (v22 | v20) + 1;
}

void sub_1565C(_WORD *a1, uint64_t a2, unsigned int a3, uint64_t a4)
{
  uint64_t v7 = *(void *)(a4 + 16);
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v27 = v8;
  uint64_t v9 = *(unsigned int *)(v8 + 84);
  uint64_t v10 = sub_20F70();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v12 = *(unsigned __int8 *)(v8 + 80);
  uint64_t v13 = *(void *)(v8 + 64);
  uint64_t v14 = *(unsigned __int8 *)(v11 + 80);
  if (v9 <= *(_DWORD *)(v11 + 84)) {
    unsigned int v15 = *(_DWORD *)(v11 + 84);
  }
  else {
    unsigned int v15 = v9;
  }
  if (v15 <= 0x7FFFFFFF) {
    unsigned int v16 = 0x7FFFFFFF;
  }
  else {
    unsigned int v16 = v15;
  }
  size_t v17 = ((v13 + v14 + ((v12 + 16) & ~v12)) & ~v14) + *(void *)(*(void *)(v10 - 8) + 64);
  if (a3 <= v16)
  {
    int v18 = 0;
  }
  else if (v17 <= 3)
  {
    unsigned int v21 = ((a3 - v16 + ~(-1 << (8 * v17))) >> (8 * v17)) + 1;
    if (HIWORD(v21))
    {
      int v18 = 4;
    }
    else if (v21 >= 0x100)
    {
      int v18 = 2;
    }
    else
    {
      int v18 = v21 > 1;
    }
  }
  else
  {
    int v18 = 1;
  }
  if (v16 < a2)
  {
    unsigned int v19 = ~v16 + a2;
    if (v17 < 4)
    {
      int v20 = (v19 >> (8 * v17)) + 1;
      if (v17)
      {
        int v22 = v19 & ~(-1 << (8 * v17));
        bzero(a1, v17);
        if (v17 == 3)
        {
          *a1 = v22;
          *((unsigned char *)a1 + 2) = BYTE2(v22);
        }
        else if (v17 == 2)
        {
          *a1 = v22;
        }
        else
        {
          *(unsigned char *)a1 = v22;
        }
      }
    }
    else
    {
      bzero(a1, v17);
      *(_DWORD *)a1 = v19;
      int v20 = 1;
    }
    switch(v18)
    {
      case 1:
        *((unsigned char *)a1 + v17) = v20;
        return;
      case 2:
        *(_WORD *)((char *)a1 + v17) = v20;
        return;
      case 3:
        goto LABEL_48;
      case 4:
        *(_DWORD *)((char *)a1 + v17) = v20;
        return;
      default:
        return;
    }
  }
  switch(v18)
  {
    case 1:
      *((unsigned char *)a1 + v17) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 2:
      *(_WORD *)((char *)a1 + v17) = 0;
      if (!a2) {
        return;
      }
      goto LABEL_27;
    case 3:
LABEL_48:
      __break(1u);
      JUMPOUT(0x159A8);
    case 4:
      *(_DWORD *)((char *)a1 + v17) = 0;
      goto LABEL_26;
    default:
LABEL_26:
      if (a2)
      {
LABEL_27:
        if ((v15 & 0x80000000) != 0)
        {
          uint64_t v23 = ((unint64_t)a1 + v12 + 16) & ~v12;
          if (v9 == v16)
          {
            uint64_t v24 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v27 + 56);
            v24(v23, a2, v9, v7);
          }
          else
          {
            uint64_t v25 = (v23 + v13 + v14) & ~v14;
            uint64_t v26 = *(void (**)(uint64_t, uint64_t))(v11 + 56);
            v26(v25, a2);
          }
        }
        else if ((a2 & 0x80000000) != 0)
        {
          *(void *)a1 = a2 ^ 0x80000000;
          *((void *)a1 + 1) = 0;
        }
        else
        {
          *((void *)a1 + 1) = (a2 - 1);
        }
      }
      return;
  }
}

uint64_t type metadata accessor for Option()
{
  return sub_15DF0();
}

uint64_t sub_159E8()
{
  return sub_1600C(&qword_38FF0, (void (*)(uint64_t))&type metadata accessor for UUID);
}

void *sub_15A30()
{
  return &protocol witness table for ObservableObjectPublisher;
}

uint64_t sub_15A3C@<X0>(uint64_t *a1@<X8>)
{
  type metadata accessor for Settings();
  uint64_t result = sub_211A0();
  *a1 = result;
  return result;
}

uint64_t sub_15A78(uint64_t a1, uint64_t a2)
{
  return sub_15BE4(a1, a2, (uint64_t (*)(uint64_t))&String._bridgeToObjectiveC());
}

uint64_t sub_15A90(uint64_t a1, id *a2)
{
  uint64_t result = sub_21200();
  *a2 = 0;
  return result;
}

uint64_t sub_15B08(uint64_t a1, id *a2)
{
  char v3 = sub_21210();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_15B88@<X0>(void *a1@<X8>)
{
  sub_21220();
  NSString v2 = sub_211F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_15BCC(uint64_t a1, uint64_t a2)
{
  return sub_15BE4(a1, a2, (uint64_t (*)(uint64_t))&String.hashValue.getter);
}

uint64_t sub_15BE4(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4 = sub_21220();
  uint64_t v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_15C28()
{
  sub_21220();
  sub_21240();

  return swift_bridgeObjectRelease();
}

Swift::Int sub_15C7C()
{
  sub_21220();
  sub_21340();
  sub_21240();
  Swift::Int v0 = sub_21350();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_15CF0()
{
  uint64_t v0 = sub_21220();
  uint64_t v2 = v1;
  if (v0 == sub_21220() && v2 == v3) {
    char v5 = 1;
  }
  else {
    char v5 = sub_21320();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_15D7C@<X0>(void *a1@<X8>)
{
  NSString v2 = sub_211F0();
  uint64_t result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_15DC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result = sub_21220();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_15DF0()
{
  return swift_getGenericMetadata();
}

void type metadata accessor for Identifier()
{
  if (!qword_38FF8)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_38FF8);
    }
  }
}

uint64_t sub_15E78(uint64_t a1)
{
  uint64_t v2 = sub_1600C(&qword_39018, (void (*)(uint64_t))type metadata accessor for Identifier);
  uint64_t v3 = sub_1600C(&qword_39020, (void (*)(uint64_t))type metadata accessor for Identifier);

  return _SwiftNewtypeWrapper<>._toCustomAnyHashable()(a1, v2, v3, &protocol witness table for String);
}

uint64_t sub_15F34()
{
  return sub_1600C(&qword_39000, (void (*)(uint64_t))type metadata accessor for Identifier);
}

uint64_t sub_15F7C()
{
  return sub_1600C(&qword_39008, (void (*)(uint64_t))type metadata accessor for Identifier);
}

uint64_t sub_15FC4()
{
  return sub_1600C(&qword_39010, (void (*)(uint64_t))type metadata accessor for Identifier);
}

uint64_t sub_1600C(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

id sub_16054()
{
  uint64_t v1 = &v0[OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat];
  *(void *)uint64_t v1 = 0;
  *((void *)v1 + 1) = 0;
  *(void *)&v0[OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormatOptions] = 0;
  sub_21180();
  v10.receiver = v0;
  v10.super_class = (Class)type metadata accessor for DateFormatSetting();
  id v2 = objc_msgSendSuper2(&v10, "init");
  sub_162FC();
  id v3 = [self defaultCenter];
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v2;
  v9[4] = sub_17ED0;
  v9[5] = v4;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 1107296256;
  v9[2] = sub_161E4;
  v9[3] = &unk_312B0;
  char v5 = _Block_copy(v9);
  id v6 = v2;
  swift_release();
  id v7 = [v3 addObserverForName:NSCurrentLocaleDidChangeNotification object:0 queue:0 usingBlock:v5];

  _Block_release(v5);
  swift_unknownObjectRelease();

  return v6;
}

uint64_t sub_161E4(uint64_t a1)
{
  uint64_t v2 = sub_20F00();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin();
  char v5 = (char *)&v8 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v6 = *(void (**)(char *))(a1 + 32);
  sub_20EF0();
  swift_retain();
  v6(v5);
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

size_t sub_162FC()
{
  uint64_t v1 = v0;
  uint64_t v2 = sub_17654(&qword_39078);
  uint64_t v36 = *(void *)(v2 - 8);
  uint64_t v37 = v2;
  __chkstk_darwin();
  uint64_t v4 = (void *)((char *)v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  char v5 = self;
  id v6 = [v5 currentDateFormat];
  uint64_t v7 = sub_21220();
  uint64_t v9 = v8;

  swift_getKeyPath();
  v38 = (char *)v1;
  uint64_t v39 = v7;
  uint64_t v40 = v9;
  objc_super v10 = (char *)v1 + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting___observationRegistrar;
  v41 = v1;
  unint64_t v11 = sub_176A0();
  sub_21160();
  v31[1] = 0;
  swift_release();
  swift_bridgeObjectRelease();
  id v12 = [v5 availableDateFormats];
  sub_17C54(0, &qword_390A0);
  unint64_t v13 = sub_21260();

  if (!(v13 >> 62))
  {
    uint64_t v14 = *(void *)((char *)&dword_10 + (v13 & 0xFFFFFFFFFFFFFF8));
    unint64_t v32 = v11;
    v33 = v10;
    if (v14) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    size_t v17 = (unint64_t *)&_swiftEmptyArrayStorage;
LABEL_14:
    swift_getKeyPath();
    __chkstk_darwin();
    v31[-2] = v1;
    v31[-1] = v17;
    v41 = v1;
    sub_21160();
    swift_release();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  uint64_t v14 = sub_212C0();
  swift_bridgeObjectRelease();
  unint64_t v32 = v11;
  v33 = v10;
  if (!v14) {
    goto LABEL_13;
  }
LABEL_3:
  v41 = (unint64_t *)&_swiftEmptyArrayStorage;
  size_t result = sub_1FDAC(0, v14 & ~(v14 >> 63), 0);
  if ((v14 & 0x8000000000000000) == 0)
  {
    v31[0] = v1;
    uint64_t v16 = 0;
    size_t v17 = v41;
    unint64_t v34 = v13 & 0xC000000000000001;
    unint64_t v35 = v13;
    uint64_t v18 = v14;
    do
    {
      if (v34) {
        id v19 = (id)sub_212B0();
      }
      else {
        id v19 = *(id *)(v13 + 8 * v16 + 32);
      }
      int v20 = v19;
      id v21 = objc_msgSend(v19, "title", v31[0]);
      uint64_t v22 = sub_21220();
      uint64_t v24 = v23;

      id v25 = [v20 option];
      uint64_t v26 = sub_21220();
      uint64_t v28 = v27;

      sub_20F60();
      v4[2] = v26;
      v4[3] = v28;
      *uint64_t v4 = v22;
      v4[1] = v24;
      v41 = v17;
      unint64_t v30 = v17[2];
      unint64_t v29 = v17[3];
      if (v30 >= v29 >> 1)
      {
        sub_1FDAC(v29 > 1, v30 + 1, 1);
        size_t v17 = v41;
      }
      ++v16;
      v17[2] = v30 + 1;
      sub_17C90((uint64_t)v4, (uint64_t)v17+ ((*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80))+ *(void *)(v36 + 72) * v30);
      unint64_t v13 = v35;
    }
    while (v18 != v16);
    swift_bridgeObjectRelease();
    uint64_t v1 = (unint64_t *)v31[0];
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_16898()
{
  swift_getKeyPath();
  sub_176A0();
  sub_21170();
  swift_release();
  uint64_t v1 = *(void *)(v0 + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_16A20@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_176A0();
  sub_21170();
  swift_release();
  uint64_t v4 = *(void *)(v3 + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat + 8);
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_16AA8()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_16B5C()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_16BD8@<X0>(uint64_t *a1@<X0>, void *a2@<X8>)
{
  uint64_t v3 = *a1;
  swift_getKeyPath();
  sub_176A0();
  sub_21170();
  swift_release();
  *a2 = *(void *)(v3 + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormatOptions);
  return swift_bridgeObjectRetain();
}

uint64_t sub_16C5C()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_16D50()
{
  uint64_t v56 = *(void *)(sub_17654(&qword_39078) - 8);
  ((void (*)(void))__chkstk_darwin)();
  uint64_t v2 = (void *)((char *)v50 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0));
  type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v4 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v49._countAndFlagsBits = 0xE000000000000000;
  v59.value._object = (void *)0x8000000000026DE0;
  v58._countAndFlagsBits = 0x524F465F45544144;
  v58._object = (void *)0xEB0000000054414DLL;
  v59.value._countAndFlagsBits = 0xD000000000000015;
  v5.super.Class isa = v4;
  v60._countAndFlagsBits = 0;
  v60._object = (void *)0xE000000000000000;
  sub_20F10(v58, v59, v5, v60, v49);

  uint64_t v6 = type metadata accessor for DateFormatSetting();
  v57[3] = v6;
  v57[0] = v0;
  uint64_t v7 = v0;
  NSString v8 = sub_211F0();
  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v9 = sub_17B34(v57, v6);
    uint64_t v10 = *(void *)(v6 - 8);
    __chkstk_darwin(v9, v9);
    id v12 = (char *)v50 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v10 + 16))(v12);
    uint64_t v13 = sub_21310();
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v6);
    sub_17B78((uint64_t)v57);
  }
  else
  {
    uint64_t v13 = 0;
  }
  sub_17C54(0, &qword_39080);
  id v14 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v8 target:v13 set:"setDateFormatAndUpdateFooterTextWithDateFormat:specifier:" get:"dateFormat" detail:swift_getObjCClassFromMetadata() cell:2 edit:0];

  uint64_t result = swift_unknownObjectRelease();
  if (!v14)
  {
    __break(1u);
    goto LABEL_25;
  }
  NSString v16 = sub_211F0();
  [v14 setIdentifier:v16];

  swift_getKeyPath();
  size_t v17 = &v7[OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting___observationRegistrar];
  v57[0] = v7;
  unint64_t v18 = sub_176A0();
  sub_21170();
  uint64_t result = swift_release();
  uint64_t v19 = OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormatOptions;
  v55 = v7;
  uint64_t v20 = *(void *)&v7[OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormatOptions];
  if (!v20)
  {
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
    return result;
  }
  id v54 = v14;
  int64_t v21 = *(void *)(v20 + 16);
  uint64_t v22 = &_swiftEmptyArrayStorage;
  if (v21)
  {
    uint64_t v51 = OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormatOptions;
    unint64_t v52 = v18;
    v53 = v17;
    v57[0] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_1FDFC(0, v21, 0);
    uint64_t v22 = (void *)v57[0];
    uint64_t v23 = *(unsigned __int8 *)(v56 + 80);
    v50[1] = v20;
    uint64_t v24 = v20 + ((v23 + 32) & ~v23);
    uint64_t v25 = *(void *)(v56 + 72);
    do
    {
      sub_176F8(v24, (uint64_t)v2);
      uint64_t v26 = v2[2];
      uint64_t v27 = v2[3];
      swift_bridgeObjectRetain();
      sub_17760((uint64_t)v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1FDFC(0, v22[2] + 1, 1);
        uint64_t v22 = (void *)v57[0];
      }
      unint64_t v29 = v22[2];
      unint64_t v28 = v22[3];
      if (v29 >= v28 >> 1)
      {
        sub_1FDFC((char *)(v28 > 1), v29 + 1, 1);
        uint64_t v22 = (void *)v57[0];
      }
      void v22[2] = v29 + 1;
      unint64_t v30 = (char *)&v22[2 * v29];
      *((void *)v30 + 4) = v26;
      *((void *)v30 + 5) = v27;
      v24 += v25;
      --v21;
    }
    while (v21);
    swift_bridgeObjectRelease();
    uint64_t v19 = v51;
  }
  swift_getKeyPath();
  v31 = v55;
  v57[0] = v55;
  sub_21170();
  uint64_t result = swift_release();
  unint64_t v32 = *(char **)&v31[v19];
  if (!v32) {
    goto LABEL_26;
  }
  int64_t v33 = *((void *)v32 + 2);
  unint64_t v34 = &_swiftEmptyArrayStorage;
  if (v33)
  {
    v57[0] = &_swiftEmptyArrayStorage;
    swift_bridgeObjectRetain();
    sub_1FDFC(0, v33, 0);
    unint64_t v34 = (void *)v57[0];
    uint64_t v35 = *(unsigned __int8 *)(v56 + 80);
    v55 = v32;
    uint64_t v36 = (uint64_t)&v32[(v35 + 32) & ~v35];
    uint64_t v37 = *(void *)(v56 + 72);
    do
    {
      sub_176F8(v36, (uint64_t)v2);
      uint64_t v39 = *v2;
      uint64_t v38 = v2[1];
      swift_bridgeObjectRetain();
      sub_17760((uint64_t)v2);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1FDFC(0, v34[2] + 1, 1);
        unint64_t v34 = (void *)v57[0];
      }
      unint64_t v41 = v34[2];
      unint64_t v40 = v34[3];
      if (v41 >= v40 >> 1)
      {
        sub_1FDFC((char *)(v40 > 1), v41 + 1, 1);
        unint64_t v34 = (void *)v57[0];
      }
      v34[2] = v41 + 1;
      v42 = (char *)&v34[2 * v41];
      *((void *)v42 + 4) = v39;
      *((void *)v42 + 5) = v38;
      v36 += v37;
      --v33;
    }
    while (v33);
    swift_bridgeObjectRelease();
  }
  sub_1E220((uint64_t)v22);
  swift_bridgeObjectRelease();
  Class isa = sub_21250().super.isa;
  sub_1E220((uint64_t)v34);
  Class v44 = sub_21250().super.isa;
  swift_bridgeObjectRelease();
  id v45 = v54;
  [v54 setValues:isa titles:v44];

  Class v46 = sub_21250().super.isa;
  [v45 setProperty:v46 forKey:PSValidValuesKey];

  Class v47 = sub_21250().super.isa;
  [v45 setProperty:v47 forKey:PSValidTitlesKey];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_177C0();
  NSString v48 = sub_211F0();
  swift_bridgeObjectRelease();
  [v45 setProperty:v48 forKey:PSStaticTextMessageKey];

  return (uint64_t)v45;
}

id sub_17490()
{
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for DateFormatSetting();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t sub_1755C()
{
  return type metadata accessor for DateFormatSetting();
}

uint64_t type metadata accessor for DateFormatSetting()
{
  uint64_t result = qword_39068;
  if (!qword_39068) {
    return swift_getSingletonMetadata();
  }
  return result;
}

uint64_t sub_175B0()
{
  uint64_t result = sub_21190();
  if (v1 <= 0x3F)
  {
    uint64_t result = swift_updateClassMetadata2();
    if (!result) {
      return 0;
    }
  }
  return result;
}

uint64_t sub_17654(uint64_t *a1)
{
  uint64_t result = *a1;
  if (result < 0)
  {
    uint64_t result = swift_getTypeByMangledNameInContext2();
    *a1 = result;
  }
  return result;
}

unint64_t sub_176A0()
{
  unint64_t result = qword_39088;
  if (!qword_39088)
  {
    type metadata accessor for DateFormatSetting();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39088);
  }
  return result;
}

uint64_t sub_176F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_39078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_17760(uint64_t a1)
{
  uint64_t v2 = sub_17654(&qword_39078);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_177C0()
{
  uint64_t v0 = sub_20F40();
  uint64_t v36 = *(void *)(v0 - 8);
  uint64_t v37 = v0;
  __chkstk_darwin();
  uint64_t v2 = (char *)&v32 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  [self sampleTime];
  sub_20F30();
  id v3 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v3 setDateStyle:1];
  Class isa = sub_20F20().super.isa;
  id v5 = [v3 stringFromDate:isa];

  uint64_t v6 = sub_21220();
  uint64_t v34 = v7;
  uint64_t v35 = v6;

  [v3 setDateStyle:2];
  Class v8 = sub_20F20().super.isa;
  id v9 = [v3 stringFromDate:v8];

  uint64_t v10 = sub_21220();
  uint64_t v32 = v11;
  uint64_t v33 = v10;

  [v3 setDateStyle:3];
  Class v12 = sub_20F20().super.isa;
  id v13 = [v3 stringFromDate:v12];

  uint64_t v14 = sub_21220();
  uint64_t v16 = v15;

  [v3 setDateStyle:4];
  Class v17 = sub_20F20().super.isa;
  id v18 = [v3 stringFromDate:v17];

  uint64_t v19 = sub_21220();
  uint64_t v21 = v20;

  type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v23 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v38._countAndFlagsBits = 0xD00000000000001FLL;
  v31._countAndFlagsBits = 0x8000000000028570;
  v38._object = (void *)0x8000000000028550;
  v39.value._object = (void *)0x8000000000026DE0;
  v39.value._countAndFlagsBits = 0xD000000000000015;
  v24.super.Class isa = v23;
  v40._countAndFlagsBits = 0;
  v40._object = (void *)0xE000000000000000;
  sub_20F10(v38, v39, v24, v40, v31);

  sub_17654(&qword_39090);
  uint64_t v25 = swift_allocObject();
  *(_OWORD *)(v25 + 16) = xmmword_26DE0;
  *(void *)(v25 + 56) = &type metadata for String;
  unint64_t v26 = sub_17BC8();
  uint64_t v27 = v34;
  *(void *)(v25 + 32) = v35;
  *(void *)(v25 + 40) = v27;
  *(void *)(v25 + 96) = &type metadata for String;
  *(void *)(v25 + 104) = v26;
  uint64_t v28 = v33;
  *(void *)(v25 + 64) = v26;
  *(void *)(v25 + 72) = v28;
  *(void *)(v25 + 80) = v32;
  *(void *)(v25 + 136) = &type metadata for String;
  *(void *)(v25 + 144) = v26;
  *(void *)(v25 + 112) = v14;
  *(void *)(v25 + 120) = v16;
  *(void *)(v25 + 176) = &type metadata for String;
  *(void *)(v25 + 184) = v26;
  *(void *)(v25 + 152) = v19;
  *(void *)(v25 + 160) = v21;
  uint64_t v29 = sub_21230();

  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v36 + 8))(v2, v37);
  return v29;
}

void *sub_17B34(void *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(void *)(a2 - 8) + 80) & 0x20000) != 0) {
    return (void *)(*result
  }
                    + ((*(_DWORD *)(*(void *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(void *)(a2 - 8) + 80)));
  return result;
}

uint64_t sub_17B78(uint64_t a1)
{
  uint64_t v1 = *(void *)(*(void *)(a1 + 24) - 8);
  if ((*(unsigned char *)(v1 + 82) & 2) != 0) {
    return swift_release();
  }
  else {
    return (*(uint64_t (**)(void))(v1 + 8))();
  }
}

unint64_t sub_17BC8()
{
  unint64_t result = qword_39098;
  if (!qword_39098)
  {
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39098);
  }
  return result;
}

uint64_t sub_17C1C()
{
  return sub_17CF8();
}

uint64_t sub_17C3C()
{
  return sub_17E4C();
}

uint64_t sub_17C54(uint64_t a1, unint64_t *a2)
{
  uint64_t result = *a2;
  if (!*a2)
  {
    self;
    uint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_17C90(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_39078);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_17CF8()
{
  *(void *)(*(void *)(v0 + 16) + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormatOptions) = *(void *)(v0 + 24);
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

void sub_17D3C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4 = self;
  NSString v5 = sub_211F0();
  [v4 setDateFormat:v5];

  _CFLocaleResetCurrent();
  uint64_t v6 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v7 = (__CFString *)sub_211F0();
  CFNotificationCenterPostNotification(v6, v7, 0, 0, 1u);

  sub_177C0();
  NSString v8 = sub_211F0();
  swift_bridgeObjectRelease();
  [a3 setProperty:v8 forKey:PSStaticTextMessageKey];
}

uint64_t sub_17E4C()
{
  uint64_t v1 = v0[4];
  uint64_t v2 = (void *)(v0[2] + OBJC_IVAR____TtC21InternationalSettings17DateFormatSetting__dateFormat);
  void *v2 = v0[3];
  v2[1] = v1;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_17E98()
{
  return _swift_deallocObject(v0, 24, 7);
}

size_t sub_17ED0()
{
  return sub_162FC();
}

uint64_t sub_17EF4(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(void *)(a2 + 40);
  *(void *)(a1 + 32) = *(void *)(a2 + 32);
  *(void *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t sub_17F04()
{
  return swift_release();
}

void sub_17F64(uint64_t a1)
{
  uint64_t v2 = sub_21110();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = &v23[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  uint64_t v7 = sub_21150();
  uint64_t v8 = *(void *)(v7 - 8);
  __chkstk_darwin(v7, v9);
  uint64_t v11 = &v23[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  type metadata accessor for Settings();
  sub_193BC((unint64_t *)&qword_390D0, (void (*)(uint64_t))type metadata accessor for Settings);
  sub_211A0();
  sub_211B0();
  swift_release();
  sub_1F3F8();
  sub_21100();
  (*(void (**)(unsigned char *, uint64_t))(v3 + 8))(v6, v2);
  uint64_t v12 = sub_21120();
  id v13 = *(void (**)(unsigned char *, uint64_t))(v8 + 8);
  v13(v11, v7);
  unint64_t v14 = 0;
  if (v12 != a1)
  {
    sub_21140();
    Class isa = sub_21130().super.isa;
    v13(v11, v7);
    id v16 = [(objc_class *)isa calendarIdentifier];

    sub_17654(&qword_390D8);
    uint64_t inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_26EE0;
    *(void *)(inited + 32) = v16;
    *(void *)(inited + 40) = a1;
    unint64_t v14 = sub_18310(inited);
  }
  id v18 = [self standardUserDefaults];
  if (v14)
  {
    type metadata accessor for Identifier();
    sub_193BC(&qword_39018, (void (*)(uint64_t))type metadata accessor for Identifier);
    v19.super.Class isa = sub_211C0().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v19.super.Class isa = 0;
  }
  NSString v20 = sub_211F0();
  [v18 setObject:v19.super.isa forKey:v20 inDomain:NSGlobalDomain];
  swift_unknownObjectRelease();

  uint64_t v21 = CFNotificationCenterGetDarwinNotifyCenter();
  uint64_t v22 = (__CFString *)sub_211F0();
  CFNotificationCenterPostNotification(v21, v22, 0, 0, 1u);
}

unint64_t sub_18310(uint64_t a1)
{
  if (!*(void *)(a1 + 16))
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
    goto LABEL_9;
  }
  sub_17654(&qword_390E0);
  uint64_t v2 = (void *)sub_212F0();
  uint64_t v3 = *(void *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  uint64_t v4 = (uint64_t *)(a1 + 40);
  while (1)
  {
    uint64_t v5 = *v4;
    id v6 = (id)*(v4 - 1);
    unint64_t result = sub_1D0F8((uint64_t)v6);
    if (v8) {
      break;
    }
    *(void *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    uint64_t v9 = 8 * result;
    *(void *)(v2[6] + v9) = v6;
    *(void *)(v2[7] + v9) = v5;
    uint64_t v10 = v2[2];
    BOOL v11 = __OFADD__(v10, 1);
    uint64_t v12 = v10 + 1;
    if (v11) {
      goto LABEL_11;
    }
    v4 += 2;
    v2[2] = v12;
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

uint64_t sub_18538()
{
  uint64_t v1 = sub_17654(&qword_390A8);
  uint64_t v2 = *(void **)(v1 - 8);
  __chkstk_darwin(v1 - 8, v3);
  uint64_t v5 = (uint64_t *)((char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  char v8 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v44._countAndFlagsBits = 0xE000000000000000;
  v49.value._object = (void *)0x8000000000028610;
  v48._countAndFlagsBits = 0x45575F5453524946;
  v48._object = (void *)0xED00005941444B45;
  v49.value._countAndFlagsBits = 0xD000000000000015;
  v9.super.Class isa = v8;
  v50._countAndFlagsBits = 0;
  v50._object = (void *)0xE000000000000000;
  sub_20F10(v48, v49, v9, v50, v44);

  v47[3] = v6;
  v47[0] = v0;
  id v10 = v0;
  NSString v11 = sub_211F0();
  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v12 = sub_17B34(v47, v6);
    uint64_t v13 = *(void *)(v6 - 8);
    __chkstk_darwin(v12, v12);
    uint64_t v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_21310();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v6);
    sub_17B78((uint64_t)v47);
  }
  else
  {
    uint64_t v16 = 0;
  }
  sub_17C54(0, (unint64_t *)&qword_390B0);
  id v17 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v11 target:v16 set:"setFirstWeekdayAsNSNumber:" get:"firstWeekdayAsNSNumber" detail:swift_getObjCClassFromMetadata() cell:2 edit:0];

  uint64_t result = swift_unknownObjectRelease();
  if (v17)
  {
    NSString v19 = sub_211F0();
    id v46 = v17;
    [v17 setIdentifier:v19];

    NSString v20 = sub_18D14();
    int64_t v21 = v20[2];
    uint64_t v22 = &_swiftEmptyArrayStorage;
    if (v21)
    {
      v47[0] = &_swiftEmptyArrayStorage;
      sub_1FE1C(0, v21, 0);
      uint64_t v23 = (uint64_t)v20 + ((*((unsigned __int8 *)v2 + 80) + 32) & ~(unint64_t)*((unsigned __int8 *)v2 + 80));
      id v45 = v2;
      uint64_t v24 = v2[9];
      uint64_t v25 = (void *)v47[0];
      do
      {
        sub_19288(v23, (uint64_t)v5);
        uint64_t v26 = v5[2];
        sub_192F0((uint64_t)v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1FE1C(0, v25[2] + 1, 1);
          uint64_t v25 = (void *)v47[0];
        }
        unint64_t v28 = v25[2];
        unint64_t v27 = v25[3];
        if (v28 >= v27 >> 1)
        {
          sub_1FE1C((char *)(v27 > 1), v28 + 1, 1);
          uint64_t v25 = (void *)v47[0];
        }
        v25[2] = v28 + 1;
        v25[v28 + 4] = v26;
        v23 += v24;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
      uint64_t v2 = v45;
      uint64_t v22 = &_swiftEmptyArrayStorage;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v25 = &_swiftEmptyArrayStorage;
    }
    uint64_t v29 = sub_18D14();
    int64_t v30 = v29[2];
    if (v30)
    {
      v47[0] = &_swiftEmptyArrayStorage;
      sub_1FDFC(0, v30, 0);
      uint64_t v31 = *((unsigned __int8 *)v2 + 80);
      id v45 = v29;
      uint64_t v32 = (uint64_t)v29 + ((v31 + 32) & ~v31);
      uint64_t v33 = v2[9];
      uint64_t v22 = (void *)v47[0];
      do
      {
        sub_19288(v32, (uint64_t)v5);
        uint64_t v34 = *v5;
        uint64_t v35 = v5[1];
        swift_bridgeObjectRetain();
        sub_192F0((uint64_t)v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1FDFC(0, v22[2] + 1, 1);
          uint64_t v22 = (void *)v47[0];
        }
        unint64_t v37 = v22[2];
        unint64_t v36 = v22[3];
        if (v37 >= v36 >> 1)
        {
          sub_1FDFC((char *)(v36 > 1), v37 + 1, 1);
          uint64_t v22 = (void *)v47[0];
        }
        void v22[2] = v37 + 1;
        Swift::String v38 = (char *)&v22[2 * v37];
        *((void *)v38 + 4) = v34;
        *((void *)v38 + 5) = v35;
        v32 += v33;
        --v30;
      }
      while (v30);
    }
    swift_bridgeObjectRelease();
    sub_1E348((uint64_t)v25);
    swift_bridgeObjectRelease();
    Class isa = sub_21250().super.isa;
    sub_1E220((uint64_t)v22);
    Class v40 = sub_21250().super.isa;
    swift_bridgeObjectRelease();
    id v41 = v46;
    [v46 setValues:isa titles:v40];

    Class v42 = sub_21250().super.isa;
    [v41 setProperty:v42 forKey:PSValidValuesKey];

    Class v43 = sub_21250().super.isa;
    [v41 setProperty:v43 forKey:PSValidTitlesKey];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (uint64_t)v41;
  }
  else
  {
    __break(1u);
  }
  return result;
}

size_t sub_18B38(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_17654(&qword_390C0);
  uint64_t v10 = *(void *)(sub_17654(&qword_390A8) - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  uint64_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_17654(&qword_390A8) - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_bridgeObjectRelease();
  return (size_t)v13;
}

void *sub_18D14()
{
  uint64_t v0 = sub_17654(&qword_390A8);
  uint64_t v56 = *(void *)(v0 - 8);
  uint64_t v57 = v0;
  __chkstk_darwin(v0, v1);
  uint64_t v3 = (char *)&v46 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_17654(&qword_390B8);
  __chkstk_darwin(v4 - 8, v5);
  int64_t v7 = (char *)&v46 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v62 = sub_21110();
  uint64_t v8 = *(void *)(v62 - 8);
  uint64_t v10 = __chkstk_darwin(v62, v9);
  v61 = (char *)&v46 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  Swift::String v60 = (char *)&v46 - v13;
  uint64_t v59 = sub_21150();
  uint64_t v14 = *(void *)(v59 - 8);
  __chkstk_darwin(v59, v15);
  Swift::String v58 = (char *)&v46 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v17 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v17 setFormattingContext:2];
  uint64_t result = [v17 standaloneWeekdaySymbols];
  if (!result)
  {
LABEL_24:
    __break(1u);
    return result;
  }
  NSString v19 = result;
  uint64_t v20 = sub_21260();

  uint64_t v63 = *(void *)(v20 + 16);
  if (v63)
  {
    id v47 = v17;
    int64_t v21 = self;
    uint64_t v22 = 0;
    id v54 = (uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
    id v55 = v21;
    unint64_t v52 = (uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 48);
    v53 = (void (**)(char *, char *, uint64_t))(v8 + 32);
    Swift::String v50 = (void (**)(char *, uint64_t))(v14 + 8);
    uint64_t v51 = v8 + 8;
    uint64_t v48 = v20 + 32;
    uint64_t v23 = &_swiftEmptyArrayStorage;
    Swift::String_optional v49 = v3;
    uint64_t v24 = (void (**)(char *, uint64_t))(v8 + 8);
    while (1)
    {
      id v25 = [v55 preferredLocale];
      if (!v25) {
        break;
      }
      uint64_t v26 = v25;
      uint64_t v27 = v20;
      unint64_t v28 = v61;
      sub_20FD0();

      uint64_t v29 = v62;
      (*v53)(v7, v28, v62);
      (*v54)(v7, 0, 1, v29);
      uint64_t result = (void *)(*v52)(v7, 1, v29);
      if (result == 1) {
        goto LABEL_23;
      }
      sub_20F90();
      int64_t v30 = *v24;
      uint64_t v31 = v7;
      (*v24)(v7, v29);
      int64_t v7 = v60;
      sub_20F80();
      uint64_t v32 = v29;
      uint64_t v33 = v58;
      sub_21100();
      v30(v7, v32);
      uint64_t v34 = sub_21120();
      (*v50)(v33, v59);
      uint64_t v35 = v34 + v22;
      if (__OFADD__(v34, v22))
      {
        __break(1u);
LABEL_19:
        __break(1u);
LABEL_20:
        __break(1u);
LABEL_21:
        __break(1u);
        break;
      }
      BOOL v36 = __OFSUB__(v35, 1);
      uint64_t v37 = v35 - 1;
      if (v36) {
        goto LABEL_19;
      }
      unint64_t v38 = v37 % v63;
      if ((v38 & 0x8000000000000000) != 0) {
        goto LABEL_20;
      }
      if (v38 >= *(void *)(v27 + 16)) {
        goto LABEL_21;
      }
      uint64_t v20 = v27;
      unint64_t v39 = v38 + 1;
      Class v40 = v49;
      id v41 = (uint64_t *)(v48 + 16 * v38);
      uint64_t v43 = *v41;
      uint64_t v42 = v41[1];
      swift_bridgeObjectRetain();
      sub_20F60();
      v40[1] = v42;
      v40[2] = v39;
      *Class v40 = v43;
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0) {
        uint64_t v23 = (void *)sub_18B38(0, v23[2] + 1, 1, v23);
      }
      int64_t v7 = v31;
      unint64_t v45 = v23[2];
      unint64_t v44 = v23[3];
      if (v45 >= v44 >> 1) {
        uint64_t v23 = (void *)sub_18B38(v44 > 1, v45 + 1, 1, v23);
      }
      ++v22;
      void v23[2] = v45 + 1;
      sub_19350((uint64_t)v40, (uint64_t)v23+ ((*(unsigned __int8 *)(v56 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v56 + 80))+ *(void *)(v56 + 72) * v45);
      if (v63 == v22)
      {
        swift_bridgeObjectRelease();

        return v23;
      }
    }
    uint64_t result = (void *)(*v54)(v7, 1, 1, v62);
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  swift_bridgeObjectRelease();

  return &_swiftEmptyArrayStorage;
}

uint64_t sub_19288(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_390A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_192F0(uint64_t a1)
{
  uint64_t v2 = sub_17654(&qword_390A8);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_19350(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_390A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_193BC(unint64_t *a1, void (*a2)(uint64_t))
{
  uint64_t result = *a1;
  if (!result)
  {
    a2(255);
    uint64_t result = swift_getWitnessTable();
    atomic_store(result, a1);
  }
  return result;
}

void sub_1977C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21110();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Settings();
  sub_19F98();
  sub_211A0();
  sub_211B0();
  swift_release();
  sub_1F3F8();
  Class isa = sub_20FC0().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  id v10 = [(objc_class *)isa objectForKey:NSLocaleTemperatureUnit];

  if (v10)
  {
    sub_21280();
    swift_unknownObjectRelease();
    sub_19FF0(&v14, &v15);
    swift_dynamicCast();
    if (v13[0] == a1 && v13[1] == a2)
    {
      swift_bridgeObjectRelease();
      NSString v11 = 0;
    }
    else
    {
      char v12 = sub_21320();
      swift_bridgeObjectRelease();
      if (v12) {
        NSString v11 = 0;
      }
      else {
        NSString v11 = sub_211F0();
      }
    }
    swift_bridgeObjectRelease();
    [self _setPreferredTemperatureUnit:v11];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_199E0()
{
  uint64_t v1 = type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  id v52 = self;
  uint64_t v53 = ObjCClassFromMetadata;
  uint64_t v3 = (objc_class *)[v52 bundleForClass:ObjCClassFromMetadata];
  v45._countAndFlagsBits = 0xE000000000000000;
  v56._object = (void *)0x8000000000028720;
  v61.value._object = (void *)0x8000000000028610;
  v56._countAndFlagsBits = 0xD000000000000010;
  v61.value._countAndFlagsBits = 0xD000000000000015;
  v4.super.Class isa = v3;
  v66._countAndFlagsBits = 0;
  v66._object = (void *)0xE000000000000000;
  sub_20F10(v56, v61, v4, v66, v45);

  v55[3] = v1;
  v55[0] = v0;
  id v5 = v0;
  NSString v6 = sub_211F0();
  swift_bridgeObjectRelease();
  unint64_t v51 = (unint64_t)"v16@?0@\"NSNotification\"8";
  if (v1)
  {
    uint64_t v7 = sub_17B34(v55, v1);
    uint64_t v8 = *(void *)(v1 - 8);
    __chkstk_darwin(v7, v7);
    id v10 = (char *)&v50 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v8 + 16))(v10);
    uint64_t v11 = sub_21310();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v1);
    sub_17B78((uint64_t)v55);
  }
  else
  {
    uint64_t v11 = 0;
  }
  sub_19F58();
  id v12 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v6 target:v11 set:"setTemperatureUnit:" get:"temperatureUnit" detail:swift_getObjCClassFromMetadata() cell:2 edit:0];

  uint64_t result = swift_unknownObjectRelease();
  if (v12)
  {
    NSString v14 = sub_211F0();
    [v12 setIdentifier:v14];

    sub_17654(&qword_390E8);
    uint64_t inited = swift_initStackObject();
    long long v54 = xmmword_26EF0;
    *(_OWORD *)(inited + 16) = xmmword_26EF0;
    *(void *)(inited + 32) = sub_21220();
    *(void *)(inited + 40) = v16;
    *(void *)(inited + 48) = sub_21220();
    *(void *)(inited + 56) = v17;
    uint64_t v18 = swift_allocObject();
    *(_OWORD *)(v18 + 16) = v54;
    id v50 = v12;
    id v19 = v52;
    uint64_t v20 = v53;
    int64_t v21 = (objc_class *)[v52 bundleForClass:v53];
    v46._countAndFlagsBits = 0xE000000000000000;
    uint64_t v22 = (void *)(v51 | 0x8000000000000000);
    v57._countAndFlagsBits = 0x20737569736C6543;
    v57._object = (void *)0xAD00002943B0C228;
    v62.value._countAndFlagsBits = 0xD000000000000015;
    v62.value._object = (void *)(v51 | 0x8000000000000000);
    v23.super.Class isa = v21;
    v67._countAndFlagsBits = 0;
    v67._object = (void *)0xE000000000000000;
    uint64_t v24 = sub_20F10(v57, v62, v23, v67, v46);
    uint64_t v26 = v25;

    *(void *)(v18 + 32) = v24;
    *(void *)(v18 + 40) = v26;
    uint64_t v27 = (objc_class *)[v19 bundleForClass:v20];
    v47._countAndFlagsBits = 0xE000000000000000;
    v58._object = (void *)0x8000000000028740;
    v58._countAndFlagsBits = 0x1000000000000010;
    v63.value._countAndFlagsBits = 0xD000000000000015;
    v63.value._object = v22;
    v28.super.Class isa = v27;
    v68._countAndFlagsBits = 0;
    v68._object = (void *)0xE000000000000000;
    uint64_t v29 = sub_20F10(v58, v63, v28, v68, v47);
    uint64_t v31 = v30;

    *(void *)(v18 + 48) = v29;
    *(void *)(v18 + 56) = v31;
    uint64_t v32 = swift_initStackObject();
    *(_OWORD *)(v32 + 16) = v54;
    uint64_t v33 = (objc_class *)[v19 bundleForClass:v20];
    v48._countAndFlagsBits = 0xE000000000000000;
    v59._countAndFlagsBits = 4436162;
    v59._object = (void *)0xA300000000000000;
    v64.value._countAndFlagsBits = 0xD000000000000015;
    v64.value._object = v22;
    v34.super.Class isa = v33;
    v69._countAndFlagsBits = 0;
    v69._object = (void *)0xE000000000000000;
    uint64_t v35 = sub_20F10(v59, v64, v34, v69, v48);
    uint64_t v37 = v36;

    *(void *)(v32 + 32) = v35;
    *(void *)(v32 + 40) = v37;
    unint64_t v38 = (objc_class *)[v19 bundleForClass:v20];
    v60._countAndFlagsBits = 4632770;
    v49._countAndFlagsBits = 0xE000000000000000;
    v60._object = (void *)0xA300000000000000;
    v65.value._countAndFlagsBits = 0xD000000000000015;
    v65.value._object = v22;
    v39.super.Class isa = v38;
    v70._countAndFlagsBits = 0;
    v70._object = (void *)0xE000000000000000;
    uint64_t v40 = sub_20F10(v60, v65, v39, v70, v49);
    uint64_t v42 = v41;

    *(void *)(v32 + 48) = v40;
    *(void *)(v32 + 56) = v42;
    uint64_t v43 = sub_1E220(inited);
    swift_bridgeObjectRelease();
    id v44 = v50;
    sub_1F258((uint64_t)v43, v18, v32);
    swift_setDeallocating();
    swift_arrayDestroy();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (uint64_t)v44;
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_19F58()
{
  unint64_t result = qword_390B0;
  if (!qword_390B0)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_390B0);
  }
  return result;
}

unint64_t sub_19F98()
{
  unint64_t result = qword_390D0;
  if (!qword_390D0)
  {
    type metadata accessor for Settings();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_390D0);
  }
  return result;
}

_OWORD *sub_19FF0(_OWORD *a1, _OWORD *a2)
{
  long long v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

void sub_1A000()
{
  id v0 = [self preferredLocale];
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [v0 objectForKey:NSLocaleTemperatureUnit];

    if (v2)
    {
      sub_21280();
      swift_unknownObjectRelease();
      sub_19FF0(&v3, &v4);
      swift_dynamicCast();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

uint64_t sub_1A464@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v9 = sub_17654(&qword_390F0);
  __chkstk_darwin(v9, v10);
  NSString v14 = (id *)((char *)&v26 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v15 = *(void *)(a1 + 16);
  if (v15)
  {
    uint64_t v28 = v11;
    uint64_t v29 = a4;
    uint64_t v30 = v4;
    uint64_t v16 = a1 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
    uint64_t v26 = a1;
    uint64_t v27 = v12;
    uint64_t v17 = *(void *)(v12 + 72);
    swift_bridgeObjectRetain();
    while (1)
    {
      sub_1AF4C(v16, (uint64_t)v14);
      id v18 = [v14[2] formattedNumber];
      uint64_t v19 = sub_21220();
      uint64_t v21 = v20;

      if (v19 == a2 && v21 == a3) {
        break;
      }
      char v23 = sub_21320();
      swift_bridgeObjectRelease();
      if (v23) {
        goto LABEL_12;
      }
      sub_1AFB4((uint64_t)v14);
      v16 += v17;
      if (!--v15)
      {
        swift_bridgeObjectRelease();
        uint64_t v24 = 1;
        a4 = v29;
        goto LABEL_13;
      }
    }
    swift_bridgeObjectRelease();
LABEL_12:
    swift_bridgeObjectRelease();
    a4 = v29;
    sub_1B014((uint64_t)v14, v29);
    uint64_t v24 = 0;
LABEL_13:
    uint64_t v12 = v27;
    uint64_t v11 = v28;
  }
  else
  {
    uint64_t v24 = 1;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 56))(a4, v24, 1, v11);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1A6A4()
{
  uint64_t v1 = sub_17654(&qword_390F0);
  id v2 = *(void **)(v1 - 8);
  __chkstk_darwin(v1 - 8, v3);
  id v5 = (id *)((char *)v50 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v6 = type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v8 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v49._countAndFlagsBits = 0xE000000000000000;
  v55.value._object = (void *)0x8000000000028610;
  v54._countAndFlagsBits = 0x465F5245424D554ELL;
  v54._object = (void *)0xED000054414D524FLL;
  v55.value._countAndFlagsBits = 0xD000000000000015;
  v9.super.Class isa = v8;
  v56._countAndFlagsBits = 0;
  v56._object = (void *)0xE000000000000000;
  sub_20F10(v54, v55, v9, v56, v49);

  v53[3] = v6;
  v53[0] = v0;
  id v10 = v0;
  NSString v11 = sub_211F0();
  swift_bridgeObjectRelease();
  if (v6)
  {
    uint64_t v12 = sub_17B34(v53, v6);
    uint64_t v13 = *(void *)(v6 - 8);
    __chkstk_darwin(v12, v12);
    uint64_t v15 = (char *)v50 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v13 + 16))(v15);
    uint64_t v16 = sub_21310();
    (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v6);
    sub_17B78((uint64_t)v53);
  }
  else
  {
    uint64_t v16 = 0;
  }
  sub_17C54(0, (unint64_t *)&qword_390B0);
  id v17 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v11 target:v16 set:"setNumberFormatAsString:" get:"numberFormatAsString" detail:swift_getObjCClassFromMetadata() cell:2 edit:0];

  uint64_t result = swift_unknownObjectRelease();
  if (v17)
  {
    NSString v19 = sub_211F0();
    id v52 = v17;
    [v17 setIdentifier:v19];

    uint64_t v20 = sub_1ACCC();
    int64_t v21 = v20[2];
    uint64_t v22 = &_swiftEmptyArrayStorage;
    if (v21)
    {
      v53[0] = &_swiftEmptyArrayStorage;
      sub_1FDFC(0, v21, 0);
      uint64_t v23 = *((unsigned __int8 *)v2 + 80);
      v50[1] = v20;
      unint64_t v51 = v2;
      uint64_t v24 = (uint64_t)v20 + ((v23 + 32) & ~v23);
      uint64_t v25 = v2[9];
      uint64_t v26 = (void *)v53[0];
      do
      {
        sub_1AF4C(v24, (uint64_t)v5);
        id v27 = [v5[2] formattedNumber];
        uint64_t v28 = sub_21220();
        uint64_t v30 = v29;

        sub_1AFB4((uint64_t)v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1FDFC(0, v26[2] + 1, 1);
          uint64_t v26 = (void *)v53[0];
        }
        unint64_t v32 = v26[2];
        unint64_t v31 = v26[3];
        if (v32 >= v31 >> 1)
        {
          sub_1FDFC((char *)(v31 > 1), v32 + 1, 1);
          uint64_t v26 = (void *)v53[0];
        }
        v26[2] = v32 + 1;
        uint64_t v33 = (char *)&v26[2 * v32];
        *((void *)v33 + 4) = v28;
        *((void *)v33 + 5) = v30;
        v24 += v25;
        --v21;
      }
      while (v21);
      swift_bridgeObjectRelease();
      id v2 = v51;
      uint64_t v22 = &_swiftEmptyArrayStorage;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v26 = &_swiftEmptyArrayStorage;
    }
    NSBundle v34 = sub_1ACCC();
    int64_t v35 = v34[2];
    if (v35)
    {
      v53[0] = &_swiftEmptyArrayStorage;
      sub_1FDFC(0, v35, 0);
      uint64_t v36 = *((unsigned __int8 *)v2 + 80);
      unint64_t v51 = v34;
      uint64_t v37 = (uint64_t)v34 + ((v36 + 32) & ~v36);
      uint64_t v38 = v2[9];
      uint64_t v22 = (void *)v53[0];
      do
      {
        sub_1AF4C(v37, (uint64_t)v5);
        id v40 = *v5;
        id v39 = v5[1];
        swift_bridgeObjectRetain();
        sub_1AFB4((uint64_t)v5);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1FDFC(0, v22[2] + 1, 1);
          uint64_t v22 = (void *)v53[0];
        }
        unint64_t v42 = v22[2];
        unint64_t v41 = v22[3];
        if (v42 >= v41 >> 1)
        {
          sub_1FDFC((char *)(v41 > 1), v42 + 1, 1);
          uint64_t v22 = (void *)v53[0];
        }
        void v22[2] = v42 + 1;
        uint64_t v43 = (char *)&v22[2 * v42];
        *((void *)v43 + 4) = v40;
        *((void *)v43 + 5) = v39;
        v37 += v38;
        --v35;
      }
      while (v35);
    }
    swift_bridgeObjectRelease();
    sub_1E220((uint64_t)v26);
    swift_bridgeObjectRelease();
    Class isa = sub_21250().super.isa;
    sub_1E220((uint64_t)v22);
    Class v45 = sub_21250().super.isa;
    swift_bridgeObjectRelease();
    id v46 = v52;
    [v52 setValues:isa titles:v45];

    Class v47 = sub_21250().super.isa;
    [v46 setProperty:v47 forKey:PSValidValuesKey];

    Class v48 = sub_21250().super.isa;
    [v46 setProperty:v48 forKey:PSValidTitlesKey];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (uint64_t)v46;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void *sub_1ACCC()
{
  uint64_t v21 = sub_17654(&qword_390F0);
  uint64_t v0 = *(void *)(v21 - 8);
  __chkstk_darwin(v21, v1);
  uint64_t v3 = (uint64_t *)((char *)&v19 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  id v4 = [self availableFormats];
  sub_17C54(0, &qword_390F8);
  unint64_t v5 = sub_21260();

  if (!(v5 >> 62))
  {
    uint64_t v6 = *(void *)((char *)&dword_10 + (v5 & 0xFFFFFFFFFFFFFF8));
    if (v6) {
      goto LABEL_3;
    }
LABEL_13:
    swift_bridgeObjectRelease();
    return &_swiftEmptyArrayStorage;
  }
  swift_bridgeObjectRetain();
  uint64_t v6 = sub_212C0();
  swift_bridgeObjectRelease();
  if (!v6) {
    goto LABEL_13;
  }
LABEL_3:
  uint64_t v22 = &_swiftEmptyArrayStorage;
  uint64_t result = (void *)sub_1FD7C(0, v6 & ~(v6 >> 63), 0);
  if ((v6 & 0x8000000000000000) == 0)
  {
    uint64_t v8 = 0;
    NSBundle v9 = v22;
    unint64_t v20 = v5 & 0xC000000000000001;
    unint64_t v10 = v5;
    do
    {
      if (v20) {
        id v11 = (id)sub_212B0();
      }
      else {
        id v11 = *(id *)(v5 + 8 * v8 + 32);
      }
      uint64_t v12 = (uint64_t)v11;
      id v13 = [v11 formattedNumber];
      uint64_t v14 = sub_21220();
      uint64_t v16 = v15;

      sub_20F60();
      v3[1] = v16;
      v3[2] = v12;
      *uint64_t v3 = v14;
      uint64_t v22 = v9;
      unint64_t v18 = v9[2];
      unint64_t v17 = v9[3];
      if (v18 >= v17 >> 1)
      {
        sub_1FD7C(v17 > 1, v18 + 1, 1);
        NSBundle v9 = v22;
      }
      ++v8;
      v9[2] = v18 + 1;
      sub_1B014((uint64_t)v3, (uint64_t)v9+ ((*(unsigned __int8 *)(v0 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v0 + 80))+ *(void *)(v0 + 72) * v18);
      unint64_t v5 = v10;
    }
    while (v6 != v8);
    swift_bridgeObjectRelease();
    return v9;
  }
  __break(1u);
  return result;
}

uint64_t sub_1AF4C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_390F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1AFB4(uint64_t a1)
{
  uint64_t v2 = sub_17654(&qword_390F0);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1B014(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_390F0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1B0B8(void *a1)
{
  uint64_t v2 = sub_20F40();
  uint64_t v3 = *(void *)(v2 - 8);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v7 = [objc_allocWithZone((Class)NSDateFormatter) init];
  [v7 setFormattingContext:2];
  [v7 setDateStyle:4];
  [v7 setTimeStyle:0];
  [self sampleTime];
  sub_20F30();
  Class isa = sub_20F20().super.isa;
  NSString v9 = [v7 stringFromDate:isa];

  if (!v9)
  {
    sub_21220();
    NSString v9 = sub_211F0();
    swift_bridgeObjectRelease();
  }
  unint64_t v10 = self;
  Class v11 = sub_20F20().super.isa;
  NSString v12 = [v10 localizedStringFromDate:v11 dateStyle:0 timeStyle:1];

  if (!v12)
  {
    sub_21220();
    NSString v12 = sub_211F0();
    swift_bridgeObjectRelease();
  }
  id v13 = [a1 specifierForID:@"EXAMPLE"];
  if (!v13)
  {

    long long v25 = 0u;
    long long v26 = 0u;
LABEL_14:

    sub_1BA84((uint64_t)&v25, &qword_39108);
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
  }
  id v14 = v13;
  NSString v15 = sub_211F0();
  [v14 setProperty:v9 forKey:v15];

  id v16 = v14;
  NSString v17 = sub_211F0();
  [v16 setProperty:v12 forKey:v17];

  uint64_t ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  id v19 = v16;
  id v20 = [ObjCClassFromMetadata formattedMoneyAndNumbers:v19];
  NSString v21 = sub_211F0();
  [v19 setProperty:v20 forKey:v21];

  swift_unknownObjectRelease();
  if ([v19 propertyForKey:PSFooterViewKey])
  {
    sub_21280();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v24, 0, sizeof(v24));
  }
  sub_1B524((uint64_t)v24, (uint64_t)&v25);
  if (!*((void *)&v26 + 1))
  {

    goto LABEL_14;
  }
  sub_1B58C();
  if (swift_dynamicCast())
  {
    uint64_t v22 = *(void **)&v24[0];
    [*(id *)&v24[0] setTextForRegionExample:v19];
  }
  else
  {
  }
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v6, v2);
}

uint64_t sub_1B524(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_39108);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unint64_t sub_1B58C()
{
  unint64_t result = qword_39110;
  if (!qword_39110)
  {
    self;
    unint64_t result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_39110);
  }
  return result;
}

id sub_1B5CC(void *a1)
{
  uint64_t v2 = sub_17654(&qword_39118);
  __chkstk_darwin(v2 - 8, v3);
  uint64_t v5 = (char *)&v51 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_21110();
  uint64_t v7 = *(void *)(v6 - 8);
  uint64_t v9 = __chkstk_darwin(v6, v8);
  Class v11 = (char *)&v51 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v9, v12);
  NSString v15 = (char *)&v51 - v14;
  __chkstk_darwin(v13, v16);
  unint64_t v18 = (char *)&v51 - v17;
  id v55 = [a1 specifierForID:@"LOCALE"];
  sub_21020();
  sub_21020();
  sub_21010();
  id v20 = *(void (**)(char *, uint64_t))(v7 + 8);
  uint64_t v19 = v7 + 8;
  NSString v21 = v20;
  v20(v15, v6);
  uint64_t v22 = sub_20FF0();
  uint64_t v23 = *(void *)(v22 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v23 + 48))(v5, 1, v22) == 1)
  {
    sub_1BA84((uint64_t)v5, &qword_39118);
    uint64_t v24 = sub_21220();
    long long v26 = v25;
  }
  else
  {
    uint64_t v27 = sub_20FE0();
    long long v26 = v28;
    (*(void (**)(char *, uint64_t))(v23 + 8))(v5, v22);
    uint64_t v24 = v27;
  }
  id result = [self _deviceLanguage];
  if (result)
  {
    uint64_t v30 = result;
    sub_21220();

    sub_20F80();
    v56._countAndFlagsBits = v24;
    v56._object = v26;
    uint64_t v31 = sub_20FB0(v56);
    unint64_t v33 = v32;
    v21(v11, v6);
    if (v33) {
      unint64_t v34 = v33;
    }
    else {
      unint64_t v34 = 0xE000000000000000;
    }
    if (v55)
    {
      uint64_t v54 = v6;
      if (v33) {
        uint64_t v35 = v31;
      }
      else {
        uint64_t v35 = 0;
      }
      uint64_t v36 = v55;
      sub_17654(&qword_39120);
      uint64_t v37 = swift_allocObject();
      uint64_t v53 = (uint64_t (*)(id, uint64_t))v21;
      uint64_t v38 = (void *)v37;
      long long v51 = xmmword_26EE0;
      *(_OWORD *)(v37 + 16) = xmmword_26EE0;
      id v39 = v36;
      uint64_t v40 = sub_20F90();
      id v55 = v18;
      v38[7] = &type metadata for String;
      v38[4] = v40;
      v38[5] = v41;
      v42.super.Class isa = sub_21250().super.isa;
      uint64_t v52 = v19;
      Class isa = v42.super.isa;
      swift_bridgeObjectRelease();
      uint64_t v44 = swift_allocObject();
      *(_OWORD *)(v44 + 16) = v51;
      *(void *)(v44 + 56) = &type metadata for String;
      *(void *)(v44 + 32) = v35;
      *(void *)(v44 + 40) = v34;
      Class v45 = sub_21250().super.isa;
      swift_bridgeObjectRelease();
      [v39 setValues:isa titles:v45];

      id v46 = v39;
      NSString v47 = sub_211F0();
      NSString v48 = sub_211F0();
      [v46 setProperty:v47 forKey:v48];

      id v49 = v46;
      NSString v50 = sub_211F0();
      swift_bridgeObjectRelease();
      [v49 setProperty:v50 forKey:PSValueKey];

      return (id)v53(v55, v54);
    }
    else
    {
      swift_bridgeObjectRelease();
      v21(v18, v6);
      return (id)swift_bridgeObjectRelease();
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1BA84(uint64_t a1, uint64_t *a2)
{
  uint64_t v3 = sub_17654(a2);
  (*(void (**)(uint64_t, uint64_t))(*(void *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void sub_1BB98(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21110();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  uint64_t v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Settings();
  sub_19F98();
  sub_211A0();
  sub_211B0();
  swift_release();
  uint64_t v9 = self;
  sub_21020();
  sub_20F90();
  uint64_t v10 = *(void (**)(char *, uint64_t))(v5 + 8);
  v10(v8, v4);
  NSString v11 = sub_211F0();
  swift_bridgeObjectRelease();
  id v12 = [v9 componentsFromLocaleIdentifier:v11];

  uint64_t v13 = sub_211D0();
  uint64_t v32 = v13;
  uint64_t v14 = self;
  sub_21020();
  sub_20F90();
  v10(v8, v4);
  NSString v15 = sub_211F0();
  swift_bridgeObjectRelease();
  id v16 = [v14 defaultCalendarForLocaleID:v15];

  uint64_t v17 = sub_21220();
  uint64_t v19 = v18;

  if (v17 == a1 && v19 == a2)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    swift_bridgeObjectRelease();
    sub_1D460(0x7261646E656C6163, 0xE800000000000000);
    swift_bridgeObjectRelease();
    uint64_t v21 = v32;
    goto LABEL_7;
  }
  char v20 = sub_21320();
  swift_bridgeObjectRelease();
  if (v20) {
    goto LABEL_5;
  }
  uint64_t v22 = v32;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v31 = v22;
  sub_1DA48(a1, a2, 0x7261646E656C6163, 0xE800000000000000, isUniquelyReferenced_nonNull_native);
  uint64_t v21 = v31;
  uint64_t v32 = v31;
  swift_bridgeObjectRelease();
LABEL_7:
  swift_bridgeObjectRetain();
  sub_21020();
  sub_20F90();
  v10(v8, v4);
  NSString v24 = sub_211F0();
  swift_bridgeObjectRelease();
  id v25 = [v9 componentsFromLocaleIdentifier:v24];

  uint64_t v26 = sub_211D0();
  LOBYTE(v25) = sub_1CED8(v21, v26);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v25)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C264(v32);
    swift_bridgeObjectRelease();
    Class isa = sub_211C0().super.isa;
    swift_bridgeObjectRelease();
    NSString v28 = [v9 canonicalLocaleIdentifierFromComponents:isa];

    if (!v28)
    {
      sub_21220();
      NSString v28 = sub_211F0();
      swift_bridgeObjectRelease();
    }
    [v9 setLocaleOnly:v28];

    _CFLocaleResetCurrent();
    uint64_t v29 = CFNotificationCenterGetDarwinNotifyCenter();
    uint64_t v30 = (__CFString *)sub_211F0();
    CFNotificationCenterPostNotification(v29, v30, 0, 0, 1u);
  }
}

uint64_t sub_1C034()
{
  uint64_t v0 = sub_21110();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v4 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = self;
  sub_21020();
  sub_20F90();
  uint64_t v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v4, v0);
  NSString v7 = sub_211F0();
  swift_bridgeObjectRelease();
  id v8 = [v5 componentsFromLocaleIdentifier:v7];

  uint64_t v9 = sub_211D0();
  if (*(void *)(v9 + 16) && (unint64_t v10 = sub_1D18C(0x7261646E656C6163, 0xE800000000000000), (v11 & 1) != 0))
  {
    uint64_t v12 = *(void *)(*(void *)(v9 + 56) + 16 * v10);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    uint64_t v13 = self;
    sub_21020();
    sub_20F90();
    v6(v4, v0);
    NSString v14 = sub_211F0();
    swift_bridgeObjectRelease();
    id v15 = [v13 defaultCalendarForLocaleID:v14];

    uint64_t v12 = sub_21220();
  }
  return v12;
}

uint64_t sub_1C264(uint64_t a1)
{
  if (*(void *)(a1 + 16))
  {
    sub_17654(&qword_39130);
    uint64_t v2 = (void *)sub_212F0();
  }
  else
  {
    uint64_t v2 = &_swiftEmptyDictionarySingleton;
  }
  uint64_t v27 = a1 + 64;
  uint64_t v3 = -1 << *(unsigned char *)(a1 + 32);
  if (-v3 < 64) {
    uint64_t v4 = ~(-1 << -(char)v3);
  }
  else {
    uint64_t v4 = -1;
  }
  unint64_t v5 = v4 & *(void *)(a1 + 64);
  int64_t v26 = (unint64_t)(63 - v3) >> 6;
  uint64_t v6 = (char *)(v2 + 8);
  swift_bridgeObjectRetain();
  uint64_t result = swift_retain();
  int64_t v8 = 0;
  while (1)
  {
    if (v5)
    {
      unint64_t v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      unint64_t v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    int64_t v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v13);
    int64_t v15 = v8 + 1;
    if (!v14)
    {
      int64_t v15 = v8 + 2;
      if (v8 + 2 >= v26) {
        goto LABEL_37;
      }
      unint64_t v14 = *(void *)(v27 + 8 * v15);
      if (!v14)
      {
        int64_t v15 = v8 + 3;
        if (v8 + 3 >= v26) {
          goto LABEL_37;
        }
        unint64_t v14 = *(void *)(v27 + 8 * v15);
        if (!v14)
        {
          int64_t v15 = v8 + 4;
          if (v8 + 4 >= v26) {
            goto LABEL_37;
          }
          unint64_t v14 = *(void *)(v27 + 8 * v15);
          if (!v14) {
            break;
          }
        }
      }
    }
LABEL_27:
    unint64_t v5 = (v14 - 1) & v14;
    unint64_t v12 = __clz(__rbit64(v14)) + (v15 << 6);
    int64_t v8 = v15;
LABEL_28:
    uint64_t v17 = (void *)(*(void *)(a1 + 48) + 16 * v12);
    uint64_t v18 = v17[1];
    *(void *)&v36[0] = *v17;
    *((void *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    long long v32 = v28;
    long long v33 = v29;
    uint64_t v34 = v30;
    sub_19FF0(&v31, v35);
    long long v28 = v32;
    long long v29 = v33;
    uint64_t v30 = v34;
    sub_19FF0(v35, v36);
    sub_19FF0(v36, &v32);
    uint64_t result = sub_212A0(v2[5]);
    uint64_t v19 = -1 << *((unsigned char *)v2 + 32);
    unint64_t v20 = result & ~v19;
    unint64_t v21 = v20 >> 6;
    if (((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)]) != 0)
    {
      unint64_t v9 = __clz(__rbit64((-1 << v20) & ~*(void *)&v6[8 * (v20 >> 6)])) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v22 = 0;
      unint64_t v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        BOOL v24 = v21 == v23;
        if (v21 == v23) {
          unint64_t v21 = 0;
        }
        v22 |= v24;
        uint64_t v25 = *(void *)&v6[8 * v21];
      }
      while (v25 == -1);
      unint64_t v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(void *)&v6[(v9 >> 3) & 0x1FFFFFFFFFFFFFF8] |= 1 << v9;
    uint64_t v10 = v2[6] + 40 * v9;
    *(_OWORD *)uint64_t v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(void *)(v10 + 32) = v30;
    uint64_t result = (uint64_t)sub_19FF0(&v32, (_OWORD *)(v2[7] + 32 * v9));
    ++v2[2];
  }
  int64_t v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1DD8C();
    return (uint64_t)v2;
  }
  unint64_t v14 = *(void *)(v27 + 8 * v16);
  if (v14)
  {
    int64_t v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    int64_t v15 = v16 + 1;
    if (__OFADD__(v16, 1)) {
      break;
    }
    if (v15 >= v26) {
      goto LABEL_37;
    }
    unint64_t v14 = *(void *)(v27 + 8 * v15);
    ++v16;
    if (v14) {
      goto LABEL_27;
    }
  }
LABEL_39:
  __break(1u);
  return result;
}

void sub_1C6DC(uint64_t a1, uint64_t a2)
{
  uint64_t v65 = a1;
  uint64_t v66 = a2;
  uint64_t v2 = sub_17654(&qword_390B8);
  uint64_t v4 = __chkstk_darwin(v2 - 8, v3);
  Swift::String v67 = (char *)v63 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = __chkstk_darwin(v4, v6);
  unint64_t v9 = (char *)v63 - v8;
  __chkstk_darwin(v7, v10);
  unint64_t v12 = (char *)v63 - v11;
  uint64_t v13 = sub_21110();
  uint64_t v14 = *(void *)(v13 - 8);
  uint64_t v16 = __chkstk_darwin(v13, v15);
  Swift::String_optional v64 = (char *)v63 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v19 = __chkstk_darwin(v16, v18);
  unint64_t v21 = (char *)v63 - v20;
  uint64_t v23 = __chkstk_darwin(v19, v22);
  uint64_t v25 = (char *)v63 - v24;
  __chkstk_darwin(v23, v26);
  long long v28 = (char *)v63 - v27;
  type metadata accessor for Settings();
  sub_19F98();
  sub_211A0();
  sub_211B0();
  swift_release();
  id v73 = self;
  id v29 = [v73 preferredLocale];
  if (!v29)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56))(v12, 1, 1, v13);
    goto LABEL_20;
  }
  uint64_t v30 = v29;
  sub_20FD0();

  long long v31 = *(void (**)(char *, char *, uint64_t))(v14 + 32);
  v31(v12, v25, v13);
  v71 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v14 + 56);
  uint64_t v72 = v14 + 56;
  v71(v12, 0, 1, v13);
  Swift::String v69 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48);
  uint64_t v70 = v14 + 48;
  if (v69(v12, 1, v13) == 1)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v31(v28, v12, v13);
  sub_20F90();
  long long v32 = *(void (**)(char *, uint64_t))(v14 + 8);
  v63[1] = v14 + 8;
  Swift::String v68 = v32;
  v32(v28, v13);
  NSString v33 = sub_211F0();
  swift_bridgeObjectRelease();
  id v34 = v73;
  id v35 = [v73 componentsFromLocaleIdentifier:v33];

  uint64_t v36 = sub_211D0();
  uint64_t v75 = v36;
  id v37 = [v34 preferredLocale];
  if (!v37)
  {
LABEL_21:
    v71(v9, 1, 1, v13);
    goto LABEL_22;
  }
  uint64_t v38 = v37;
  sub_20FD0();

  v31(v9, v25, v13);
  v71(v9, 0, 1, v13);
  if (v69(v9, 1, v13) == 1)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  id v39 = self;
  v31(v21, v9, v13);
  sub_20F90();
  v68(v21, v13);
  NSString v40 = sub_211F0();
  swift_bridgeObjectRelease();
  id v41 = [v39 defaultNumberingSystemForLocaleID:v40];

  uint64_t v42 = sub_21220();
  uint64_t v44 = v43;

  uint64_t v46 = v65;
  uint64_t v45 = v66;
  if (v42 == v65 && v44 == v66)
  {
    swift_bridgeObjectRelease();
    id v47 = v73;
LABEL_9:
    swift_bridgeObjectRelease();
    sub_1D460(0x737265626D756ELL, 0xE700000000000000);
    swift_bridgeObjectRelease();
    uint64_t v49 = v75;
    goto LABEL_11;
  }
  char v48 = sub_21320();
  swift_bridgeObjectRelease();
  id v47 = v73;
  if (v48) {
    goto LABEL_9;
  }
  uint64_t v50 = v75;
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v74 = v50;
  sub_1DA48(v46, v45, 0x737265626D756ELL, 0xE700000000000000, isUniquelyReferenced_nonNull_native);
  uint64_t v49 = v74;
  uint64_t v75 = v74;
  swift_bridgeObjectRelease();
LABEL_11:
  swift_bridgeObjectRetain();
  id v52 = [v47 preferredLocale];
  if (!v52)
  {
LABEL_23:
    v71(v67, 1, 1, v13);
    goto LABEL_24;
  }
  uint64_t v53 = v52;
  sub_20FD0();

  uint64_t v54 = v67;
  v31(v67, v25, v13);
  v71(v54, 0, 1, v13);
  if (v69(v54, 1, v13) == 1)
  {
LABEL_24:
    __break(1u);
    return;
  }
  id v55 = v64;
  v31(v64, v54, v13);
  sub_20F90();
  v68(v55, v13);
  NSString v56 = sub_211F0();
  swift_bridgeObjectRelease();
  id v57 = [v47 componentsFromLocaleIdentifier:v56];

  uint64_t v58 = sub_211D0();
  LOBYTE(v57) = sub_1CED8(v49, v58);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (v57)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1C264(v75);
    swift_bridgeObjectRelease();
    Class isa = sub_211C0().super.isa;
    swift_bridgeObjectRelease();
    NSString v60 = [v47 canonicalLocaleIdentifierFromComponents:isa];

    if (!v60)
    {
      sub_21220();
      NSString v60 = sub_211F0();
      swift_bridgeObjectRelease();
    }
    [v47 setLocaleOnly:v60];

    _CFLocaleResetCurrent();
    Swift::String_optional v61 = CFNotificationCenterGetDarwinNotifyCenter();
    Swift::String_optional v62 = (__CFString *)sub_211F0();
    CFNotificationCenterPostNotification(v61, v62, 0, 0, 1u);
  }
}

uint64_t sub_1CED8(uint64_t result, uint64_t a2)
{
  if (result == a2) {
    return 1;
  }
  uint64_t v3 = result;
  if (*(void *)(result + 16) != *(void *)(a2 + 16)) {
    return 0;
  }
  int64_t v4 = 0;
  uint64_t v5 = result + 64;
  uint64_t v6 = 1 << *(unsigned char *)(result + 32);
  uint64_t v7 = -1;
  if (v6 < 64) {
    uint64_t v7 = ~(-1 << v6);
  }
  unint64_t v8 = v7 & *(void *)(result + 64);
  int64_t v27 = (unint64_t)(v6 + 63) >> 6;
  while (1)
  {
    if (v8)
    {
      unint64_t v9 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      unint64_t v10 = v9 | (v4 << 6);
      goto LABEL_25;
    }
    int64_t v11 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_36;
    }
    if (v11 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v11);
    ++v4;
    if (!v12)
    {
      int64_t v4 = v11 + 1;
      if (v11 + 1 >= v27) {
        return 1;
      }
      unint64_t v12 = *(void *)(v5 + 8 * v4);
      if (!v12)
      {
        int64_t v4 = v11 + 2;
        if (v11 + 2 >= v27) {
          return 1;
        }
        unint64_t v12 = *(void *)(v5 + 8 * v4);
        if (!v12)
        {
          int64_t v4 = v11 + 3;
          if (v11 + 3 >= v27) {
            return 1;
          }
          unint64_t v12 = *(void *)(v5 + 8 * v4);
          if (!v12) {
            break;
          }
        }
      }
    }
LABEL_24:
    unint64_t v8 = (v12 - 1) & v12;
    unint64_t v10 = __clz(__rbit64(v12)) + (v4 << 6);
LABEL_25:
    uint64_t v14 = 16 * v10;
    uint64_t v15 = (uint64_t *)(*(void *)(v3 + 48) + v14);
    uint64_t v16 = *v15;
    uint64_t v17 = v15[1];
    uint64_t v18 = (uint64_t *)(*(void *)(v3 + 56) + v14);
    uint64_t v20 = *v18;
    uint64_t v19 = v18[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    unint64_t v21 = sub_1D18C(v16, v17);
    char v23 = v22;
    swift_bridgeObjectRelease();
    if ((v23 & 1) == 0)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
    uint64_t v24 = (void *)(*(void *)(a2 + 56) + 16 * v21);
    if (*v24 == v20 && v24[1] == v19)
    {
      uint64_t result = swift_bridgeObjectRelease();
    }
    else
    {
      char v26 = sub_21320();
      uint64_t result = swift_bridgeObjectRelease();
      if ((v26 & 1) == 0) {
        return 0;
      }
    }
  }
  int64_t v13 = v11 + 4;
  if (v13 >= v27) {
    return 1;
  }
  unint64_t v12 = *(void *)(v5 + 8 * v13);
  if (v12)
  {
    int64_t v4 = v13;
    goto LABEL_24;
  }
  while (1)
  {
    int64_t v4 = v13 + 1;
    if (__OFADD__(v13, 1)) {
      break;
    }
    if (v4 >= v27) {
      return 1;
    }
    unint64_t v12 = *(void *)(v5 + 8 * v4);
    ++v13;
    if (v12) {
      goto LABEL_24;
    }
  }
LABEL_36:
  __break(1u);
  return result;
}

unint64_t sub_1D0F8(uint64_t a1)
{
  sub_21220();
  sub_21340();
  sub_21240();
  Swift::Int v2 = sub_21350();
  swift_bridgeObjectRelease();

  return sub_1D204(a1, v2);
}

unint64_t sub_1D18C(uint64_t a1, uint64_t a2)
{
  sub_21340();
  sub_21240();
  Swift::Int v4 = sub_21350();

  return sub_1D37C(a1, a2, v4);
}

unint64_t sub_1D204(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2 + 64;
  uint64_t v4 = -1 << *(unsigned char *)(v2 + 32);
  unint64_t v5 = a2 & ~v4;
  if ((*(void *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
  {
    uint64_t v6 = sub_21220();
    uint64_t v8 = v7;
    if (v6 == sub_21220() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    char v11 = sub_21320();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      uint64_t v12 = ~v4;
      unint64_t v5 = (v5 + 1) & v12;
      if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5))
      {
        while (1)
        {
          uint64_t v13 = sub_21220();
          uint64_t v15 = v14;
          if (v13 == sub_21220() && v15 == v16) {
            break;
          }
          char v18 = sub_21320();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            unint64_t v5 = (v5 + 1) & v12;
            if ((*(void *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v5)) {
              continue;
            }
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_1D37C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(v3 + 32);
  unint64_t v6 = a3 & ~v5;
  if ((*(void *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6))
  {
    uint64_t v9 = *(void *)(v3 + 48);
    unint64_t v10 = (void *)(v9 + 16 * v6);
    BOOL v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_21320() & 1) == 0)
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
      while (!v14 && (sub_21320() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1D460(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = v2;
  swift_bridgeObjectRetain();
  unint64_t v6 = sub_1D18C(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0) {
    return 0;
  }
  int isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  uint64_t v9 = *v3;
  uint64_t v12 = *v3;
  *uint64_t v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1DBD0();
    uint64_t v9 = v12;
  }
  swift_bridgeObjectRelease();
  uint64_t v10 = *(void *)(*(void *)(v9 + 56) + 16 * v6);
  sub_1D870(v6, v9);
  *uint64_t v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1D548(uint64_t a1, char a2)
{
  uint64_t v3 = v2;
  uint64_t v5 = *v2;
  sub_17654(&qword_39128);
  char v42 = a2;
  uint64_t v6 = sub_212E0();
  uint64_t v7 = v6;
  if (!*(void *)(v5 + 16)) {
    goto LABEL_40;
  }
  uint64_t v8 = 1 << *(unsigned char *)(v5 + 32);
  uint64_t v41 = v5 + 64;
  if (v8 < 64) {
    uint64_t v9 = ~(-1 << v8);
  }
  else {
    uint64_t v9 = -1;
  }
  unint64_t v10 = v9 & *(void *)(v5 + 64);
  id v39 = v2;
  int64_t v40 = (unint64_t)(v8 + 63) >> 6;
  uint64_t v11 = v6 + 64;
  uint64_t result = swift_retain();
  int64_t v13 = 0;
  while (1)
  {
    if (v10)
    {
      unint64_t v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      unint64_t v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    int64_t v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40) {
      break;
    }
    uint64_t v24 = (void *)(v5 + 64);
    unint64_t v25 = *(void *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      int64_t v13 = v23 + 1;
      if (v23 + 1 >= v40) {
        goto LABEL_33;
      }
      unint64_t v25 = *(void *)(v41 + 8 * v13);
      if (!v25)
      {
        int64_t v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          uint64_t v3 = v39;
          if ((v42 & 1) == 0) {
            goto LABEL_40;
          }
          goto LABEL_36;
        }
        unint64_t v25 = *(void *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            int64_t v13 = v26 + 1;
            if (__OFADD__(v26, 1)) {
              goto LABEL_42;
            }
            if (v13 >= v40) {
              goto LABEL_33;
            }
            unint64_t v25 = *(void *)(v41 + 8 * v13);
            ++v26;
            if (v25) {
              goto LABEL_30;
            }
          }
        }
        int64_t v13 = v26;
      }
    }
LABEL_30:
    unint64_t v10 = (v25 - 1) & v25;
    unint64_t v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    uint64_t v31 = 16 * v22;
    long long v32 = (uint64_t *)(*(void *)(v5 + 48) + v31);
    uint64_t v34 = *v32;
    uint64_t v33 = v32[1];
    id v35 = (uint64_t *)(*(void *)(v5 + 56) + v31);
    uint64_t v36 = *v35;
    uint64_t v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_21340();
    sub_21240();
    uint64_t result = sub_21350();
    uint64_t v14 = -1 << *(unsigned char *)(v7 + 32);
    unint64_t v15 = result & ~v14;
    unint64_t v16 = v15 >> 6;
    if (((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      unint64_t v17 = __clz(__rbit64((-1 << v15) & ~*(void *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      char v27 = 0;
      unint64_t v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        BOOL v29 = v16 == v28;
        if (v16 == v28) {
          unint64_t v16 = 0;
        }
        v27 |= v29;
        uint64_t v30 = *(void *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      unint64_t v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(void *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    uint64_t v18 = 16 * v17;
    uint64_t v19 = (void *)(*(void *)(v7 + 48) + v18);
    *uint64_t v19 = v34;
    v19[1] = v33;
    uint64_t v20 = (void *)(*(void *)(v7 + 56) + v18);
    *uint64_t v20 = v36;
    v20[1] = v37;
    ++*(void *)(v7 + 16);
  }
  swift_release();
  uint64_t v3 = v39;
  uint64_t v24 = (void *)(v5 + 64);
  if ((v42 & 1) == 0) {
    goto LABEL_40;
  }
LABEL_36:
  uint64_t v38 = 1 << *(unsigned char *)(v5 + 32);
  if (v38 >= 64) {
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  }
  else {
    void *v24 = -1 << v38;
  }
  *(void *)(v5 + 16) = 0;
LABEL_40:
  uint64_t result = swift_release();
  *uint64_t v3 = v7;
  return result;
}

unint64_t sub_1D870(unint64_t result, uint64_t a2)
{
  int64_t v3 = result;
  uint64_t v4 = a2 + 64;
  uint64_t v5 = -1 << *(unsigned char *)(a2 + 32);
  unint64_t v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(void *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    uint64_t v7 = ~v5;
    uint64_t result = sub_21290();
    if ((*(void *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      unint64_t v8 = (result + 1) & v7;
      do
      {
        sub_21340();
        swift_bridgeObjectRetain();
        sub_21240();
        Swift::Int v9 = sub_21350();
        uint64_t result = swift_bridgeObjectRelease();
        unint64_t v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8) {
            goto LABEL_5;
          }
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          uint64_t v11 = *(void *)(a2 + 48);
          uint64_t v12 = (_OWORD *)(v11 + 16 * v3);
          int64_t v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1) {
            *uint64_t v12 = *v13;
          }
          uint64_t v14 = *(void *)(a2 + 56);
          unint64_t v15 = (_OWORD *)(v14 + 16 * v3);
          unint64_t v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (int64_t v3 = v6, v15 >= v16 + 1))
          {
            *unint64_t v15 = *v16;
            int64_t v3 = v6;
          }
        }
LABEL_5:
        unint64_t v6 = (v6 + 1) & v7;
      }
      while (((*(void *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    unint64_t v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    uint64_t v18 = *v17;
    uint64_t v19 = (-1 << v3) - 1;
  }
  else
  {
    unint64_t v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    uint64_t v19 = *v17;
    uint64_t v18 = (-1 << result) - 1;
  }
  uint64_t *v17 = v19 & v18;
  uint64_t v20 = *(void *)(a2 + 16);
  BOOL v21 = __OFSUB__(v20, 1);
  uint64_t v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(void *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

uint64_t sub_1DA48(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  unint64_t v6 = v5;
  uint64_t v12 = *v5;
  unint64_t v14 = sub_1D18C(a3, a4);
  uint64_t v15 = *(void *)(v12 + 16);
  BOOL v16 = (v13 & 1) == 0;
  uint64_t v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
    goto LABEL_16;
  }
  char v18 = v13;
  uint64_t v19 = *(void *)(v12 + 24);
  if (v19 >= v17 && (a5 & 1) != 0) {
    goto LABEL_7;
  }
  if (v19 >= v17 && (a5 & 1) == 0)
  {
    sub_1DBD0();
LABEL_7:
    uint64_t v20 = (void *)*v6;
    if (v18)
    {
LABEL_8:
      BOOL v21 = (void *)(v20[7] + 16 * v14);
      uint64_t result = swift_bridgeObjectRelease();
      *BOOL v21 = a1;
      v21[1] = a2;
      return result;
    }
    goto LABEL_11;
  }
  sub_1D548(v17, a5 & 1);
  unint64_t v23 = sub_1D18C(a3, a4);
  if ((v18 & 1) != (v24 & 1))
  {
LABEL_17:
    uint64_t result = sub_21330();
    __break(1u);
    return result;
  }
  unint64_t v14 = v23;
  uint64_t v20 = (void *)*v6;
  if (v18) {
    goto LABEL_8;
  }
LABEL_11:
  v20[(v14 >> 6) + 8] |= 1 << v14;
  unint64_t v25 = (uint64_t *)(v20[6] + 16 * v14);
  uint64_t *v25 = a3;
  v25[1] = a4;
  int64_t v26 = (void *)(v20[7] + 16 * v14);
  void *v26 = a1;
  v26[1] = a2;
  uint64_t v27 = v20[2];
  BOOL v28 = __OFADD__(v27, 1);
  uint64_t v29 = v27 + 1;
  if (v28)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  void v20[2] = v29;

  return swift_bridgeObjectRetain();
}

void *sub_1DBD0()
{
  uint64_t v1 = v0;
  sub_17654(&qword_39128);
  uint64_t v2 = *v0;
  uint64_t v3 = sub_212D0();
  uint64_t v4 = v3;
  if (!*(void *)(v2 + 16))
  {
LABEL_26:
    uint64_t result = (void *)swift_release();
    *uint64_t v1 = v4;
    return result;
  }
  uint64_t result = (void *)(v3 + 64);
  uint64_t v6 = v2 + 64;
  unint64_t v7 = (unint64_t)((1 << *(unsigned char *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7) {
    uint64_t result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  }
  int64_t v9 = 0;
  *(void *)(v4 + 16) = *(void *)(v2 + 16);
  uint64_t v10 = 1 << *(unsigned char *)(v2 + 32);
  uint64_t v11 = -1;
  if (v10 < 64) {
    uint64_t v11 = ~(-1 << v10);
  }
  unint64_t v12 = v11 & *(void *)(v2 + 64);
  int64_t v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      unint64_t v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      unint64_t v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    int64_t v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      int64_t v9 = v25 + 1;
      if (v25 + 1 >= v13) {
        goto LABEL_26;
      }
      unint64_t v26 = *(void *)(v6 + 8 * v9);
      if (!v26) {
        break;
      }
    }
LABEL_25:
    unint64_t v12 = (v26 - 1) & v26;
    unint64_t v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    uint64_t v16 = 16 * v15;
    uint64_t v17 = (uint64_t *)(*(void *)(v2 + 48) + v16);
    uint64_t v19 = *v17;
    uint64_t v18 = v17[1];
    uint64_t v20 = (uint64_t *)(*(void *)(v2 + 56) + v16);
    uint64_t v21 = *v20;
    uint64_t v22 = v20[1];
    unint64_t v23 = (void *)(*(void *)(v4 + 48) + v16);
    void *v23 = v19;
    v23[1] = v18;
    char v24 = (void *)(*(void *)(v4 + 56) + v16);
    void *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    uint64_t result = (void *)swift_bridgeObjectRetain();
  }
  int64_t v27 = v25 + 2;
  if (v27 >= v13) {
    goto LABEL_26;
  }
  unint64_t v26 = *(void *)(v6 + 8 * v27);
  if (v26)
  {
    int64_t v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    int64_t v9 = v27 + 1;
    if (__OFADD__(v27, 1)) {
      break;
    }
    if (v9 >= v13) {
      goto LABEL_26;
    }
    unint64_t v26 = *(void *)(v6 + 8 * v9);
    ++v27;
    if (v26) {
      goto LABEL_25;
    }
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_1DD8C()
{
  return swift_release();
}

uint64_t sub_1DD94()
{
  uint64_t v0 = sub_17654(&qword_390B8);
  uint64_t v2 = __chkstk_darwin(v0 - 8, v1);
  uint64_t v43 = (char *)&v38 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v2, v4);
  uint64_t v6 = (char *)&v38 - v5;
  uint64_t v7 = sub_21110();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v41 = (char *)&v38 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  unint64_t v15 = (char *)&v38 - v14;
  __chkstk_darwin(v13, v16);
  uint64_t v18 = (char *)&v38 - v17;
  uint64_t v19 = self;
  id v20 = [v19 preferredLocale];
  if (!v20)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56))(v6, 1, 1, v7);
    goto LABEL_11;
  }
  uint64_t v21 = v20;
  sub_20FD0();

  uint64_t v22 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v22(v6, v15, v7);
  char v42 = *(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v42(v6, 0, 1, v7);
  int64_t v40 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48);
  if (v40(v6, 1, v7) == 1)
  {
LABEL_11:
    __break(1u);
LABEL_12:
    uint64_t result = v42(v43, 1, 1, v7);
    goto LABEL_13;
  }
  id v39 = v22;
  v22(v18, v6, v7);
  sub_20F90();
  uint64_t v38 = *(void (**)(char *, uint64_t))(v8 + 8);
  v38(v18, v7);
  NSString v23 = sub_211F0();
  swift_bridgeObjectRelease();
  id v24 = [v19 componentsFromLocaleIdentifier:v23];

  uint64_t v25 = sub_211D0();
  if (*(void *)(v25 + 16))
  {
    unint64_t v26 = sub_1D18C(0x737265626D756ELL, 0xE700000000000000);
    if (v27)
    {
      uint64_t v28 = *(void *)(*(void *)(v25 + 56) + 16 * v26);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      return v28;
    }
  }
  swift_bridgeObjectRelease();
  id v29 = [v19 preferredLocale];
  if (!v29) {
    goto LABEL_12;
  }
  uint64_t v30 = v29;
  sub_20FD0();

  uint64_t v31 = v43;
  long long v32 = v39;
  v39(v43, v15, v7);
  v42(v31, 0, 1, v7);
  uint64_t result = ((uint64_t (*)(char *, uint64_t, uint64_t))v40)(v31, 1, v7);
  if (result != 1)
  {
    uint64_t v34 = self;
    id v35 = v41;
    v32(v41, v31, v7);
    sub_20F90();
    v38(v35, v7);
    NSString v36 = sub_211F0();
    swift_bridgeObjectRelease();
    id v37 = [v34 defaultNumberingSystemForLocaleID:v36];

    uint64_t v28 = sub_21220();
    return v28;
  }
LABEL_13:
  __break(1u);
  return result;
}

void *sub_1E220(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    sub_1FDDC(0, v1, 0);
    uint64_t v2 = &_swiftEmptyArrayStorage;
    uint64_t v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1FDDC(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_1FDDC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v4 += 16;
      v2[2] = v6 + 1;
      sub_19FF0(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

void *sub_1E348(uint64_t a1)
{
  int64_t v1 = *(void *)(a1 + 16);
  uint64_t v2 = &_swiftEmptyArrayStorage;
  if (v1)
  {
    uint64_t v9 = &_swiftEmptyArrayStorage;
    sub_1FDDC(0, v1, 0);
    uint64_t v4 = a1 + 32;
    uint64_t v2 = &_swiftEmptyArrayStorage;
    do
    {
      v4 += 8;
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1FDDC(0, v2[2] + 1, 1);
        uint64_t v2 = v9;
      }
      unint64_t v6 = v2[2];
      unint64_t v5 = v2[3];
      if (v6 >= v5 >> 1)
      {
        sub_1FDDC((char *)(v5 > 1), v6 + 1, 1);
        uint64_t v2 = v9;
      }
      v2[2] = v6 + 1;
      sub_19FF0(&v8, &v2[4 * v6 + 4]);
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1E520(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_21110();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4, v6);
  long long v8 = (char *)v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Settings();
  sub_19F98();
  sub_211A0();
  sub_211B0();
  swift_release();
  sub_1F3F8();
  Class isa = sub_20FC0().super.isa;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v8, v4);
  id v10 = [(objc_class *)isa objectForKey:NSLocaleMeasurementSystem];

  if (v10)
  {
    sub_21280();
    swift_unknownObjectRelease();
    sub_19FF0(&v15, &v16);
    swift_dynamicCast();
    if (v14[0] == a1 && v14[1] == a2)
    {
      swift_bridgeObjectRelease();
LABEL_6:
      swift_bridgeObjectRelease();
      [self _setPreferredMeasurementSystem:0];
      return;
    }
    char v11 = sub_21320();
    swift_bridgeObjectRelease();
    if (v11) {
      goto LABEL_6;
    }
    uint64_t v12 = self;
    NSString v13 = sub_211F0();
    swift_bridgeObjectRelease();
    [v12 _setPreferredMeasurementSystem:v13];
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1E7A8()
{
  uint64_t v1 = sub_17654(&qword_39078);
  uint64_t v50 = *(void *)(v1 - 8);
  __chkstk_darwin(v1 - 8, v2);
  uint64_t v4 = (uint64_t *)((char *)&v47 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
  uint64_t v5 = type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v7 = (objc_class *)[self bundleForClass:ObjCClassFromMetadata];
  v53.value._countAndFlagsBits = 0xD000000000000015;
  v46._countAndFlagsBits = 0xE000000000000000;
  v52._object = (void *)0x80000000000288A0;
  v53.value._object = (void *)0x8000000000028610;
  v52._countAndFlagsBits = 0xD000000000000012;
  v8.super.Class isa = v7;
  v54._countAndFlagsBits = 0;
  v54._object = (void *)0xE000000000000000;
  sub_20F10(v52, v53, v8, v54, v46);

  v51[3] = v5;
  v51[0] = v0;
  id v9 = v0;
  NSString v10 = sub_211F0();
  swift_bridgeObjectRelease();
  if (v5)
  {
    char v11 = sub_17B34(v51, v5);
    uint64_t v12 = *(void *)(v5 - 8);
    __chkstk_darwin(v11, v11);
    uint64_t v14 = (char *)&v47 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v12 + 16))(v14);
    uint64_t v15 = sub_21310();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v5);
    sub_17B78((uint64_t)v51);
  }
  else
  {
    uint64_t v15 = 0;
  }
  sub_19F58();
  id v16 = [objc_allocWithZone((Class)PSSpecifier) initWithName:v10 target:v15 set:"setMeasurementSystem:" get:"measurementSystem" detail:swift_getObjCClassFromMetadata() cell:2 edit:0];

  uint64_t result = swift_unknownObjectRelease();
  if (v16)
  {
    NSString v18 = sub_211F0();
    id v49 = v16;
    [v16 setIdentifier:v18];

    uint64_t v19 = sub_1ED84();
    int64_t v20 = *(void *)(v19 + 16);
    uint64_t v21 = &_swiftEmptyArrayStorage;
    if (v20)
    {
      v51[0] = &_swiftEmptyArrayStorage;
      sub_1FDFC(0, v20, 0);
      uint64_t v22 = (void *)v51[0];
      uint64_t v23 = *(unsigned __int8 *)(v50 + 80);
      uint64_t v48 = v19;
      uint64_t v24 = v19 + ((v23 + 32) & ~v23);
      uint64_t v25 = *(void *)(v50 + 72);
      do
      {
        sub_176F8(v24, (uint64_t)v4);
        uint64_t v26 = v4[2];
        uint64_t v27 = v4[3];
        swift_bridgeObjectRetain();
        sub_17760((uint64_t)v4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1FDFC(0, v22[2] + 1, 1);
          uint64_t v22 = (void *)v51[0];
        }
        unint64_t v29 = v22[2];
        unint64_t v28 = v22[3];
        if (v29 >= v28 >> 1)
        {
          sub_1FDFC((char *)(v28 > 1), v29 + 1, 1);
          uint64_t v22 = (void *)v51[0];
        }
        void v22[2] = v29 + 1;
        uint64_t v30 = (char *)&v22[2 * v29];
        *((void *)v30 + 4) = v26;
        *((void *)v30 + 5) = v27;
        v24 += v25;
        --v20;
      }
      while (v20);
      swift_bridgeObjectRelease();
      uint64_t v21 = &_swiftEmptyArrayStorage;
    }
    else
    {
      swift_bridgeObjectRelease();
      uint64_t v22 = &_swiftEmptyArrayStorage;
    }
    uint64_t v31 = sub_1ED84();
    int64_t v32 = *(void *)(v31 + 16);
    if (v32)
    {
      v51[0] = &_swiftEmptyArrayStorage;
      sub_1FDFC(0, v32, 0);
      uint64_t v21 = (void *)v51[0];
      uint64_t v33 = *(unsigned __int8 *)(v50 + 80);
      uint64_t v48 = v31;
      uint64_t v34 = v31 + ((v33 + 32) & ~v33);
      uint64_t v35 = *(void *)(v50 + 72);
      do
      {
        sub_176F8(v34, (uint64_t)v4);
        uint64_t v36 = *v4;
        uint64_t v37 = v4[1];
        swift_bridgeObjectRetain();
        sub_17760((uint64_t)v4);
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        {
          sub_1FDFC(0, v21[2] + 1, 1);
          uint64_t v21 = (void *)v51[0];
        }
        unint64_t v39 = v21[2];
        unint64_t v38 = v21[3];
        if (v39 >= v38 >> 1)
        {
          sub_1FDFC((char *)(v38 > 1), v39 + 1, 1);
          uint64_t v21 = (void *)v51[0];
        }
        void v21[2] = v39 + 1;
        int64_t v40 = (char *)&v21[2 * v39];
        *((void *)v40 + 4) = v36;
        *((void *)v40 + 5) = v37;
        v34 += v35;
        --v32;
      }
      while (v32);
    }
    swift_bridgeObjectRelease();
    sub_1E220((uint64_t)v22);
    swift_bridgeObjectRelease();
    Class isa = sub_21250().super.isa;
    sub_1E220((uint64_t)v21);
    Class v42 = sub_21250().super.isa;
    swift_bridgeObjectRelease();
    id v43 = v49;
    [v49 setValues:isa titles:v42];

    Class v44 = sub_21250().super.isa;
    [v43 setProperty:v44 forKey:PSValidValuesKey];

    Class v45 = sub_21250().super.isa;
    [v43 setProperty:v45 forKey:PSValidTitlesKey];
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    return (uint64_t)v43;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1ED84()
{
  uint64_t v53 = sub_20F70();
  uint64_t v0 = *(void *)(v53 - 8);
  __chkstk_darwin(v53, v1);
  uint64_t v3 = (char *)&v49 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_17654(&qword_39138);
  uint64_t v4 = sub_17654(&qword_39078);
  uint64_t v5 = *(void *)(v4 - 8);
  uint64_t v6 = *(void *)(v5 + 72);
  uint64_t v7 = v4 - 8;
  uint64_t v58 = v4 - 8;
  unint64_t v8 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  uint64_t v54 = 2 * v6;
  uint64_t v9 = swift_allocObject();
  uint64_t v55 = v9;
  *(_OWORD *)(v9 + 16) = xmmword_26F00;
  NSString v10 = (uint64_t *)(v9 + v8);
  type metadata accessor for Settings();
  uint64_t ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  uint64_t v60 = ObjCClassFromMetadata;
  id v52 = self;
  uint64_t v12 = (objc_class *)[v52 bundleForClass:ObjCClassFromMetadata];
  v61._countAndFlagsBits = 0xD000000000000012;
  unint64_t v59 = 0xD00000000000001ALL;
  uint64_t v51 = 0x80000000000288E0;
  v46._countAndFlagsBits = 0x80000000000288E0;
  v61._object = (void *)0x80000000000288C0;
  v64.value._object = (void *)0x8000000000028610;
  id v57 = (void *)0x8000000000028610;
  v64.value._countAndFlagsBits = 0xD000000000000015;
  v13.super.Class isa = v12;
  v67._countAndFlagsBits = 0;
  v67._object = (void *)0xE000000000000000;
  uint64_t v14 = sub_20F10(v61, v64, v13, v67, v46);
  uint64_t v16 = v15;

  uint64_t v17 = sub_21220();
  uint64_t v19 = v18;
  sub_20F60();
  v10[2] = v17;
  v10[3] = v19;
  *NSString v10 = v14;
  v10[1] = v16;
  int64_t v20 = (char *)v10 + *(int *)(v7 + 48);
  uint64_t v50 = *(void (**)(char *, char *, uint64_t))(v0 + 32);
  uint64_t v56 = v0 + 32;
  uint64_t v21 = v53;
  v50(v20, v3, v53);
  uint64_t v22 = (uint64_t *)((char *)v10 + v6);
  id v23 = v52;
  uint64_t v24 = (objc_class *)[v52 bundleForClass:v60];
  uint64_t v25 = v51;
  v47._countAndFlagsBits = v51;
  v62._countAndFlagsBits = 0x4D4552555341454DLL;
  v62._object = (void *)0xEE0053555F544E45;
  v65.value._countAndFlagsBits = 0xD000000000000015;
  v65.value._object = v57;
  v26.super.Class isa = v24;
  v68._countAndFlagsBits = 0;
  v68._object = (void *)0xE000000000000000;
  uint64_t v27 = sub_20F10(v62, v65, v26, v68, v47);
  uint64_t v29 = v28;

  uint64_t v30 = sub_21220();
  uint64_t v32 = v31;
  sub_20F60();
  void v22[2] = v30;
  v22[3] = v32;
  *uint64_t v22 = v27;
  v22[1] = v29;
  uint64_t v33 = v21;
  uint64_t v34 = v21;
  uint64_t v35 = v50;
  v50((char *)v22 + *(int *)(v58 + 48), v3, v34);
  uint64_t v36 = (uint64_t *)((char *)v10 + v54);
  uint64_t v37 = (objc_class *)[v23 bundleForClass:v60];
  v48._countAndFlagsBits = v25;
  v63._countAndFlagsBits = 0x4D4552555341454DLL;
  v63._object = (void *)0xEE004B555F544E45;
  v66.value._countAndFlagsBits = 0xD000000000000015;
  v66.value._object = v57;
  v38.super.Class isa = v37;
  v69._countAndFlagsBits = 0;
  v69._object = (void *)0xE000000000000000;
  uint64_t v39 = sub_20F10(v63, v66, v38, v69, v48);
  uint64_t v41 = v40;

  uint64_t v42 = sub_21220();
  uint64_t v44 = v43;
  sub_20F60();
  _OWORD v36[2] = v42;
  v36[3] = v44;
  *uint64_t v36 = v39;
  v36[1] = v41;
  v35((char *)v36 + *(int *)(v58 + 48), v3, v33);
  return v55;
}

void sub_1F190()
{
  id v0 = [self preferredLocale];
  if (v0)
  {
    uint64_t v1 = v0;
    id v2 = [v0 objectForKey:NSLocaleMeasurementSystem];

    if (v2)
    {
      sub_21280();
      swift_unknownObjectRelease();
      sub_19FF0(&v3, &v4);
      swift_dynamicCast();
      return;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
}

void sub_1F258(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    Class isa = sub_21250().super.isa;
    sub_1E220(a2);
    v7.super.Class isa = sub_21250().super.isa;
    swift_bridgeObjectRelease();
    sub_1E220(a3);
    v8.super.Class isa = sub_21250().super.isa;
    swift_bridgeObjectRelease();
    [v3 setValues:isa titles:v7.super.isa shortTitles:v8.super.isa];
  }
  else
  {
    v7.super.Class isa = sub_21250().super.isa;
    sub_1E220(a2);
    v8.super.Class isa = sub_21250().super.isa;
    swift_bridgeObjectRelease();
    [v3 setValues:v7.super.isa titles:v8.super.isa];
  }

  Class v9 = sub_21250().super.isa;
  [v3 setProperty:v9 forKey:PSValidValuesKey];

  Class v10 = sub_21250().super.isa;
  [v3 setProperty:v10 forKey:PSValidTitlesKey];
}

uint64_t sub_1F3F8()
{
  uint64_t v0 = sub_21110();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  long long v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v5 = sub_17654(&qword_390B8);
  __chkstk_darwin(v5 - 8, v6);
  NSArray v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = [self preferredLocale];
  if (v9)
  {
    Class v10 = v9;
    sub_20FD0();

    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v8, v4, v0);
    (*(void (**)(char *, void, uint64_t, uint64_t))(v1 + 56))(v8, 0, 1, v0);
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v1 + 48))(v8, 1, v0);
    if (result != 1)
    {
      sub_20F90();
      (*(void (**)(char *, uint64_t))(v1 + 8))(v8, v0);
      return sub_20F80();
    }
  }
  else
  {
    uint64_t result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v1 + 56))(v8, 1, 1, v0);
  }
  __break(1u);
  return result;
}

uint64_t sub_1F5E4()
{
  uint64_t v0 = sub_20FA0();
  uint64_t v1 = *(void *)(v0 - 8);
  __chkstk_darwin(v0, v2);
  uint64_t v30 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v4 = sub_17654(&qword_39160);
  uint64_t v5 = v4 - 8;
  __chkstk_darwin(v4, v6);
  NSArray v8 = (char *)&v29 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_17654(&qword_39140);
  uint64_t v11 = __chkstk_darwin(v9 - 8, v10);
  NSBundle v13 = (char *)&v29 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v15 = __chkstk_darwin(v11, v14);
  uint64_t v17 = (char *)&v29 - v16;
  __chkstk_darwin(v15, v18);
  int64_t v20 = (char *)&v29 - v19;
  sub_210A0();
  sub_21040();
  uint64_t v21 = (uint64_t)&v8[*(int *)(v5 + 56)];
  sub_20AFC((uint64_t)v20, (uint64_t)v8);
  sub_20AFC((uint64_t)v17, v21);
  uint64_t v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v1 + 48);
  if (v22((uint64_t)v8, 1, v0) == 1)
  {
    sub_1BA84((uint64_t)v17, &qword_39140);
    sub_1BA84((uint64_t)v20, &qword_39140);
    int v23 = v22(v21, 1, v0);
    if (v23 == 1) {
      uint64_t v24 = &qword_39140;
    }
    else {
      uint64_t v24 = &qword_39160;
    }
    if (v23 == 1) {
      char v25 = -1;
    }
    else {
      char v25 = 0;
    }
  }
  else
  {
    sub_20AFC((uint64_t)v8, (uint64_t)v13);
    if (v22(v21, 1, v0) == 1)
    {
      sub_1BA84((uint64_t)v17, &qword_39140);
      sub_1BA84((uint64_t)v20, &qword_39140);
      (*(void (**)(char *, uint64_t))(v1 + 8))(v13, v0);
      char v25 = 0;
      uint64_t v24 = &qword_39160;
    }
    else
    {
      NSBundle v26 = v30;
      (*(void (**)(char *, uint64_t, uint64_t))(v1 + 32))(v30, v21, v0);
      sub_20B64();
      char v25 = sub_211E0();
      uint64_t v27 = *(void (**)(char *, uint64_t))(v1 + 8);
      v27(v26, v0);
      uint64_t v24 = &qword_39140;
      sub_1BA84((uint64_t)v17, &qword_39140);
      sub_1BA84((uint64_t)v20, &qword_39140);
      v27(v13, v0);
    }
  }
  sub_1BA84((uint64_t)v8, v24);
  return v25 & 1;
}

uint64_t sub_1F94C(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3)
{
  uint64_t v4 = v3;
  Class v45 = a1;
  uint64_t v46 = a2;
  uint64_t v6 = sub_17654(&qword_39150);
  __chkstk_darwin(v6 - 8, v7);
  uint64_t v9 = (char *)&v33 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_210F0();
  uint64_t v11 = *(void *)(v10 - 8);
  uint64_t v13 = __chkstk_darwin(v10, v12);
  uint64_t v40 = (char *)&v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t result = __chkstk_darwin(v13, v15);
  Swift::String v48 = (char *)&v33 - v17;
  uint64_t v49 = &_swiftEmptyArrayStorage;
  uint64_t v41 = *(void *)(a3 + 16);
  if (v41)
  {
    unint64_t v18 = 0;
    uint64_t v42 = v11 + 48;
    Swift::String v47 = (void (**)(char *))(v11 + 32);
    uint64_t v43 = v11 + 56;
    uint64_t v44 = v11 + 16;
    unint64_t v35 = (v11 + 56) & 0xFFFFFFFFFFFFLL | 0xA0D1000000000000;
    uint64_t v36 = (void (**)(char *, uint64_t))(v11 + 8);
    uint64_t v39 = v11;
    while (v18 < *(void *)(a3 + 16))
    {
      unint64_t v19 = (*(unsigned __int8 *)(v11 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
      uint64_t v20 = *(void *)(v11 + 72);
      (*(void (**)(char *, unint64_t, uint64_t))(v11 + 16))(v9, a3 + v19 + v20 * v18, v10);
      uint64_t v21 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56);
      v21(v9, 0, 1, v10);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1) {
        goto LABEL_17;
      }
      NSBundle v38 = v21;
      uint64_t v22 = a3;
      int v23 = v9;
      uint64_t v24 = v48;
      char v25 = *v47;
      NSBundle v26 = v23;
      (*v47)(v48);
      char v27 = v45(v24);
      if (v4)
      {
        (*v36)(v48, v10);
        swift_bridgeObjectRelease();
        return swift_release();
      }
      if (v27)
      {
        ((void (*)(char *, char *, uint64_t))v25)(v40, v48, v10);
        uint64_t v28 = v49;
        char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
        uint64_t v37 = 0;
        if ((isUniquelyReferenced_nonNull_native & 1) == 0)
        {
          sub_1FE3C(0, v28[2] + 1, 1);
          uint64_t v28 = v49;
        }
        unint64_t v31 = v28[2];
        unint64_t v30 = v28[3];
        unint64_t v32 = v31 + 1;
        if (v31 >= v30 >> 1)
        {
          unint64_t v34 = v31 + 1;
          sub_1FE3C(v30 > 1, v31 + 1, 1);
          unint64_t v32 = v34;
          uint64_t v28 = v49;
        }
        v28[2] = v32;
        uint64_t result = ((uint64_t (*)(char *, char *, uint64_t))v25)((char *)v28 + v19 + v31 * v20, v40, v10);
        uint64_t v49 = v28;
        uint64_t v4 = v37;
      }
      else
      {
        uint64_t result = ((uint64_t (*)(char *, uint64_t))*v36)(v48, v10);
      }
      a3 = v22;
      ++v18;
      uint64_t v9 = v26;
      uint64_t v11 = v39;
      if (v41 == v18)
      {
        v38(v26, 1, 1, v10);
        goto LABEL_17;
      }
    }
    __break(1u);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(v9, 1, 1, v10);
LABEL_17:
    swift_bridgeObjectRelease();
    sub_1BA84((uint64_t)v9, &qword_39150);
    return (uint64_t)v49;
  }
  return result;
}

size_t sub_1FD7C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1FE5C(a1, a2, a3, (void *)*v3, &qword_39170, &qword_390F0);
  *uint64_t v3 = result;
  return result;
}

size_t sub_1FDAC(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_1FE5C(a1, a2, a3, (void *)*v3, &qword_39138, &qword_39078);
  *uint64_t v3 = result;
  return result;
}

char *sub_1FDDC(char *a1, int64_t a2, char a3)
{
  size_t result = sub_20030(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1FDFC(char *a1, int64_t a2, char a3)
{
  size_t result = sub_20138(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

char *sub_1FE1C(char *a1, int64_t a2, char a3)
{
  size_t result = sub_2023C(a1, a2, a3, *v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_1FE3C(size_t a1, int64_t a2, char a3)
{
  size_t result = sub_20338(a1, a2, a3, (void *)*v3);
  *uint64_t v3 = result;
  return result;
}

size_t sub_1FE5C(size_t result, int64_t a2, char a3, void *a4, uint64_t *a5, uint64_t *a6)
{
  char v8 = result;
  if (a3)
  {
    unint64_t v9 = a4[3];
    int64_t v10 = v9 >> 1;
    if ((uint64_t)(v9 >> 1) < a2)
    {
      if (v10 + 0x4000000000000000 < 0)
      {
LABEL_30:
        __break(1u);
        return result;
      }
      int64_t v10 = v9 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v9 & 0xFFFFFFFFFFFFFFFELL) <= a2) {
        int64_t v10 = a2;
      }
    }
  }
  else
  {
    int64_t v10 = a2;
  }
  uint64_t v11 = a4[2];
  if (v10 <= v11) {
    uint64_t v12 = a4[2];
  }
  else {
    uint64_t v12 = v10;
  }
  if (!v12)
  {
    uint64_t v16 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_17654(a5);
  uint64_t v13 = *(void *)(sub_17654(a6) - 8);
  uint64_t v14 = *(void *)(v13 + 72);
  unint64_t v15 = (*(unsigned __int8 *)(v13 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v13 + 80);
  uint64_t v16 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v16);
  if (!v14)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v15 == 0x8000000000000000 && v14 == -1) {
    goto LABEL_29;
  }
  v16[2] = v11;
  v16[3] = 2 * ((uint64_t)(result - v15) / v14);
LABEL_19:
  uint64_t v18 = *(void *)(sub_17654(a6) - 8);
  if (v8)
  {
    if (v16 < a4
      || (unint64_t v19 = (*(unsigned __int8 *)(v18 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v18 + 80),
          (char *)v16 + v19 >= (char *)a4 + v19 + *(void *)(v18 + 72) * v11))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v16 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v16;
}

char *sub_20030(char *result, int64_t a2, char a3, char *a4)
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
    sub_17654(&qword_39120);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 1;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8]) {
      memmove(v13, v14, 32 * v8);
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

char *sub_20138(char *result, int64_t a2, char a3, char *a4)
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
    sub_17654(&qword_390E8);
    int64_t v10 = (char *)swift_allocObject();
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
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
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

char *sub_2023C(char *result, int64_t a2, char a3, char *a4)
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
    sub_17654(&qword_39178);
    int64_t v10 = (char *)swift_allocObject();
    int64_t v11 = j__malloc_size(v10);
    uint64_t v12 = v11 - 32;
    if (v11 < 32) {
      uint64_t v12 = v11 - 25;
    }
    *((void *)v10 + 2) = v8;
    *((void *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    int64_t v10 = (char *)&_swiftEmptyArrayStorage;
  }
  uint64_t v13 = v10 + 32;
  uint64_t v14 = a4 + 32;
  if (v5)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8]) {
      memmove(v13, v14, 8 * v8);
    }
    *((void *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 8 * v8);
  }
  swift_release();
  return v10;
}

size_t sub_20338(size_t result, int64_t a2, char a3, void *a4)
{
  char v5 = result;
  if (a3)
  {
    unint64_t v6 = a4[3];
    int64_t v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
LABEL_30:
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
  uint64_t v8 = a4[2];
  if (v7 <= v8) {
    uint64_t v9 = a4[2];
  }
  else {
    uint64_t v9 = v7;
  }
  if (!v9)
  {
    uint64_t v13 = &_swiftEmptyArrayStorage;
    goto LABEL_19;
  }
  sub_17654(&qword_39158);
  uint64_t v10 = *(void *)(sub_210F0() - 8);
  uint64_t v11 = *(void *)(v10 + 72);
  unint64_t v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  uint64_t v13 = (void *)swift_allocObject();
  size_t result = j__malloc_size(v13);
  if (!v11)
  {
    __break(1u);
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  if (result - v12 == 0x8000000000000000 && v11 == -1) {
    goto LABEL_29;
  }
  void v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(result - v12) / v11);
LABEL_19:
  uint64_t v15 = *(void *)(sub_210F0() - 8);
  if (v5)
  {
    if (v13 < a4
      || (unint64_t v16 = (*(unsigned __int8 *)(v15 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80),
          (char *)v13 + v16 >= (char *)a4 + v16 + *(void *)(v15 + 72) * v8))
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    a4[2] = 0;
  }
  else
  {
    swift_arrayInitWithCopy();
  }
  swift_release();
  return (size_t)v13;
}

uint64_t sub_2050C(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_39140);
  __chkstk_darwin(v4 - 8, v5);
  v58[2] = (char *)v58 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_210F0();
  uint64_t v8 = *(void *)(v7 - 8);
  uint64_t v61 = v7;
  uint64_t v62 = v8;
  uint64_t v10 = __chkstk_darwin(v7, v9);
  uint64_t v60 = (char *)v58 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v10, v12);
  unint64_t v59 = (char *)v58 - v13;
  uint64_t v14 = sub_17654(&qword_39148);
  uint64_t v16 = __chkstk_darwin(v14 - 8, v15);
  uint64_t v18 = (char *)v58 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v16, v19);
  uint64_t v21 = (char *)v58 - v20;
  uint64_t v22 = sub_17654(&qword_39118);
  uint64_t v24 = __chkstk_darwin(v22 - 8, v23);
  NSBundle v26 = (char *)v58 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v24, v27);
  uint64_t v29 = (char *)v58 - v28;
  uint64_t v30 = sub_21070();
  uint64_t v31 = *(void *)(v30 - 8);
  uint64_t v33 = __chkstk_darwin(v30, v32);
  unint64_t v35 = (char *)v58 - ((v34 + 15) & 0xFFFFFFFFFFFFFFF0);
  __chkstk_darwin(v33, v36);
  NSBundle v38 = (char *)v58 - v37;
  swift_bridgeObjectRetain();
  uint64_t v63 = a2;
  uint64_t v64 = a1;
  sub_21030();
  sub_21050();
  uint64_t v39 = sub_20FF0();
  LODWORD(a1) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v39 - 8) + 48))(v29, 1, v39);
  sub_1BA84((uint64_t)v29, &qword_39118);
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v35, v38, v30);
  if (a1 != 1)
  {
    uint64_t v40 = *(void (**)(char *, uint64_t))(v31 + 8);
    v40(v35, v30);
    goto LABEL_6;
  }
  v58[0] = v26;
  v58[1] = v18;
  sub_21060();
  uint64_t v40 = *(void (**)(char *, uint64_t))(v31 + 8);
  v40(v35, v30);
  uint64_t v41 = sub_21000();
  int v42 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(*(void *)(v41 - 8) + 48))(v21, 1, v41);
  sub_1BA84((uint64_t)v21, &qword_39148);
  if (v42 != 1)
  {
LABEL_6:
    uint64_t v47 = v64;
    v40(v38, v30);
LABEL_7:
    swift_bridgeObjectRetain();
    return v47;
  }
  uint64_t v43 = sub_210B0();
  __chkstk_darwin(v43, v44);
  v58[-2] = v38;
  unint64_t v46 = *(void *)(sub_1F94C((uint64_t (*)(char *))sub_20ADC, (uint64_t)&v58[-4], v45) + 16);
  swift_bridgeObjectRelease();
  uint64_t v47 = v64;
  if (v46 < 2)
  {
    v40(v38, v30);
    goto LABEL_7;
  }
  Swift::String v48 = self;
  NSString v49 = sub_211F0();
  id v50 = [v48 addLikelySubtagsForLocaleIdentifier:v49];

  sub_21220();
  uint64_t v64 = v30;
  uint64_t v51 = v59;
  sub_21080();
  sub_210A0();
  sub_210E0();
  sub_210D0();
  id v52 = v60;
  sub_21090();
  sub_210C0();
  NSString v53 = sub_211F0();
  swift_bridgeObjectRelease();
  id v54 = [v48 canonicalLocaleIdentifierFromString:v53];

  uint64_t v47 = sub_21220();
  uint64_t v55 = v61;
  uint64_t v56 = *(void (**)(char *, uint64_t))(v62 + 8);
  v56(v52, v61);
  v56(v51, v55);
  v40(v38, v64);
  return v47;
}

uint64_t sub_20ADC()
{
  return sub_1F5E4() & 1;
}

uint64_t sub_20AFC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = sub_17654(&qword_39140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(void *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_20B64()
{
  unint64_t result = qword_39168;
  if (!qword_39168)
  {
    sub_20FA0();
    unint64_t result = swift_getWitnessTable();
    atomic_store(result, (unint64_t *)&qword_39168);
  }
  return result;
}

void sub_20BBC()
{
  __assert_rtn("-[InternationalSettingsController locale:]", "InternationalSettingsController.m", 435, "specifier == [self specifierForID:kLocaleSpecifierID]");
}

void sub_20BE8()
{
  __assert_rtn("-[InternationalSettingsController calendar:]", "InternationalSettingsController.m", 466, "specifier == [self specifierForID:kCalendarSpecifierID]");
}

void sub_20C14()
{
  uint64_t v0 = abort_report_np();
  sub_20C3C(v0);
}

void sub_20C3C()
{
  uint64_t v0 = abort_report_np();
  sub_20C64(v0);
}

void sub_20C64()
{
  uint64_t v0 = abort_report_np();
  sub_20C8C(v0);
}

void sub_20C8C()
{
  uint64_t v0 = abort_report_np();
  sub_20CB4(v0);
}

void sub_20CB4()
{
}

void sub_20CE0()
{
}

void sub_20D0C()
{
}

void sub_20D38()
{
}

void sub_20D64()
{
}

void sub_20D90()
{
}

void sub_20DBC()
{
}

void sub_20DE8()
{
}

void sub_20E14()
{
}

void sub_20E40()
{
}

void sub_20E6C()
{
}

void sub_20E98()
{
}

void sub_20EC4()
{
}

uint64_t sub_20EF0()
{
  return static Notification._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_20F00()
{
  return type metadata accessor for Notification();
}

uint64_t sub_20F10(Swift::String _, Swift::String_optional tableName, NSBundle bundle, Swift::String value, Swift::String comment)
{
  return NSLocalizedString(_:tableName:bundle:value:comment:)(_, tableName, bundle, value, comment)._countAndFlagsBits;
}

NSDate sub_20F20()
{
  return Date._bridgeToObjectiveC()();
}

uint64_t sub_20F30()
{
  return Date.init(timeIntervalSince1970:)();
}

uint64_t sub_20F40()
{
  return type metadata accessor for Date();
}

uint64_t sub_20F60()
{
  return UUID.init()();
}

uint64_t sub_20F70()
{
  return type metadata accessor for UUID();
}

uint64_t sub_20F80()
{
  return Locale.init(identifier:)();
}

uint64_t sub_20F90()
{
  return Locale.identifier.getter();
}

uint64_t sub_20FA0()
{
  return type metadata accessor for Locale.LanguageCode();
}

uint64_t sub_20FB0(Swift::String forRegionCode)
{
  return Locale.localizedString(forRegionCode:)(forRegionCode).value._countAndFlagsBits;
}

NSLocale sub_20FC0()
{
  return Locale._bridgeToObjectiveC()();
}

uint64_t sub_20FD0()
{
  return static Locale._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_20FE0()
{
  return Locale.Region.identifier.getter();
}

uint64_t sub_20FF0()
{
  return type metadata accessor for Locale.Region();
}

uint64_t sub_21000()
{
  return type metadata accessor for Locale.Script();
}

uint64_t sub_21010()
{
  return Locale.region.getter();
}

uint64_t sub_21020()
{
  return static Locale.current.getter();
}

uint64_t sub_21030()
{
  return Locale.Language.Components.init(identifier:)();
}

uint64_t sub_21040()
{
  return Locale.Language.Components.languageCode.getter();
}

uint64_t sub_21050()
{
  return Locale.Language.Components.region.getter();
}

uint64_t sub_21060()
{
  return Locale.Language.Components.script.getter();
}

uint64_t sub_21070()
{
  return type metadata accessor for Locale.Language.Components();
}

uint64_t sub_21080()
{
  return Locale.Language.init(identifier:)();
}

uint64_t sub_21090()
{
  return Locale.Language.init(languageCode:script:region:)();
}

uint64_t sub_210A0()
{
  return Locale.Language.languageCode.getter();
}

uint64_t sub_210B0()
{
  return static Locale.Language.systemLanguages.getter();
}

uint64_t sub_210C0()
{
  return Locale.Language.maximalIdentifier.getter();
}

uint64_t sub_210D0()
{
  return Locale.Language.region.getter();
}

uint64_t sub_210E0()
{
  return Locale.Language.script.getter();
}

uint64_t sub_210F0()
{
  return type metadata accessor for Locale.Language();
}

uint64_t sub_21100()
{
  return Locale.calendar.getter();
}

uint64_t sub_21110()
{
  return type metadata accessor for Locale();
}

uint64_t sub_21120()
{
  return Calendar.firstWeekday.getter();
}

NSCalendar sub_21130()
{
  return Calendar._bridgeToObjectiveC()();
}

uint64_t sub_21140()
{
  return static Calendar.current.getter();
}

uint64_t sub_21150()
{
  return type metadata accessor for Calendar();
}

uint64_t sub_21160()
{
  return ObservationRegistrar.withMutation<A, B, C>(of:keyPath:_:)();
}

uint64_t sub_21170()
{
  return ObservationRegistrar.access<A, B>(_:keyPath:)();
}

uint64_t sub_21180()
{
  return ObservationRegistrar.init()();
}

uint64_t sub_21190()
{
  return type metadata accessor for ObservationRegistrar();
}

uint64_t sub_211A0()
{
  return ObservableObject<>.objectWillChange.getter();
}

void sub_211B0()
{
}

NSDictionary sub_211C0()
{
  return Dictionary._bridgeToObjectiveC()();
}

uint64_t sub_211D0()
{
  return static Dictionary._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_211E0()
{
  return dispatch thunk of static Equatable.== infix(_:_:)();
}

NSString sub_211F0()
{
  return String._bridgeToObjectiveC()();
}

uint64_t sub_21200()
{
  return static String._forceBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_21210()
{
  return static String._conditionallyBridgeFromObjectiveC(_:result:)();
}

uint64_t sub_21220()
{
  return static String._unconditionallyBridgeFromObjectiveC(_:)();
}

uint64_t sub_21230()
{
  return String.init(format:_:)();
}

uint64_t sub_21240()
{
  return String.hash(into:)();
}

NSArray sub_21250()
{
  return Array._bridgeToObjectiveC()();
}

uint64_t sub_21260()
{
  return static Array._unconditionallyBridgeFromObjectiveC(_:)();
}

NSNumber sub_21270(Swift::Int integerLiteral)
{
  return NSNumber.init(integerLiteral:)(integerLiteral);
}

uint64_t sub_21280()
{
  return _bridgeAnyObjectToAny(_:)();
}

uint64_t sub_21290()
{
  return _HashTable.previousHole(before:)();
}

Swift::Int sub_212A0(Swift::Int seed)
{
  return AnyHashable._rawHashValue(seed:)(seed);
}

uint64_t sub_212B0()
{
  return specialized _ArrayBuffer._getElementSlowPath(_:)();
}

uint64_t sub_212C0()
{
  return _CocoaArrayWrapper.endIndex.getter();
}

uint64_t sub_212D0()
{
  return static _DictionaryStorage.copy(original:)();
}

uint64_t sub_212E0()
{
  return static _DictionaryStorage.resize(original:capacity:move:)();
}

uint64_t sub_212F0()
{
  return static _DictionaryStorage.allocate(capacity:)();
}

uint64_t sub_21310()
{
  return _bridgeAnythingToObjectiveC<A>(_:)();
}

uint64_t sub_21320()
{
  return _stringCompareWithSmolCheck(_:_:expecting:)();
}

uint64_t sub_21330()
{
  return KEY_TYPE_OF_DICTIONARY_VIOLATES_HASHABLE_REQUIREMENTS(_:)();
}

uint64_t sub_21340()
{
  return Hasher.init(_seed:)();
}

Swift::Int sub_21350()
{
  return Hasher._finalize()();
}

uint64_t AnalyticsSendEventLazy()
{
  return _AnalyticsSendEventLazy();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyValue(key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return _CFRunLoopGetCurrent();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  return _CGRectGetMaxY(rect);
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

uint64_t PSIsNanoMirroringDomain()
{
  return _PSIsNanoMirroringDomain();
}

uint64_t PSRoundToPixel()
{
  return _PSRoundToPixel();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFLocaleResetCurrent()
{
  return __CFLocaleResetCurrent();
}

uint64_t _NSIsNSDictionary()
{
  return __NSIsNSDictionary();
}

uint64_t _NSIsNSNumber()
{
  return __NSIsNSNumber();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void bzero(void *a1, size_t a2)
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

void free(void *a1)
{
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_arrayDestroy()
{
  return _swift_arrayDestroy();
}

uint64_t swift_arrayInitWithCopy()
{
  return _swift_arrayInitWithCopy();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return _swift_arrayInitWithTakeBackToFront();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return _swift_arrayInitWithTakeFrontToBack();
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

uint64_t swift_checkMetadataState()
{
  return _swift_checkMetadataState();
}

uint64_t swift_dynamicCast()
{
  return _swift_dynamicCast();
}

uint64_t swift_getForeignTypeMetadata()
{
  return _swift_getForeignTypeMetadata();
}

uint64_t swift_getGenericMetadata()
{
  return _swift_getGenericMetadata();
}

uint64_t swift_getKeyPath()
{
  return _swift_getKeyPath();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return _swift_getObjCClassFromMetadata();
}

uint64_t swift_getObjCClassMetadata()
{
  return _swift_getObjCClassMetadata();
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

uint64_t swift_initStackObject()
{
  return _swift_initStackObject();
}

uint64_t swift_initStructMetadata()
{
  return _swift_initStructMetadata();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return _swift_isUniquelyReferenced_nonNull_native();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

uint64_t swift_setDeallocating()
{
  return _swift_setDeallocating();
}

uint64_t swift_unknownObjectRelease()
{
  return _swift_unknownObjectRelease();
}

uint64_t swift_updateClassMetadata2()
{
  return _swift_updateClassMetadata2();
}

id objc_msgSend_URLWithString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "URLWithString:");
}

id objc_msgSend__actionWithTitle_image_style_handler_shouldDismissHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_actionWithTitle:image:style:handler:shouldDismissHandler:");
}

id objc_msgSend__applicationKeyWindow(void *a1, const char *a2, ...)
{
  return _[a1 _applicationKeyWindow];
}

id objc_msgSend__calendarDirection(void *a1, const char *a2, ...)
{
  return _[a1 _calendarDirection];
}

id objc_msgSend__currentGlobalUserInflection(void *a1, const char *a2, ...)
{
  return _[a1 _currentGlobalUserInflection];
}

id objc_msgSend__deviceLanguage(void *a1, const char *a2, ...)
{
  return _[a1 _deviceLanguage];
}

id objc_msgSend__distinctiveLanguageIdentifierForLanguageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_distinctiveLanguageIdentifierForLanguageIdentifier:");
}

id objc_msgSend__language_usesSameLocalizationAs_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_language:usesSameLocalizationAs:");
}

id objc_msgSend__localeIdentifierForRegionChangeFrom_to_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_localeIdentifierForRegionChangeFrom:to:");
}

id objc_msgSend__mainContentView(void *a1, const char *a2, ...)
{
  return _[a1 _mainContentView];
}

id objc_msgSend__setAllowsReorderingWhenNotEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setAllowsReorderingWhenNotEditing:");
}

id objc_msgSend__setAsGlobalUserInflection(void *a1, const char *a2, ...)
{
  return _[a1 _setAsGlobalUserInflection];
}

id objc_msgSend__setThirdPartyApplicationsCanAccessUserInflection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "_setThirdPartyApplicationsCanAccessUserInflection:");
}

id objc_msgSend__thirdPartyApplicationsCanAccessUserInflection(void *a1, const char *a2, ...)
{
  return _[a1 _thirdPartyApplicationsCanAccessUserInflection];
}

id objc_msgSend_actionWithReason_options_targetURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithReason:options:targetURL:");
}

id objc_msgSend_actionWithTitle_style_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "actionWithTitle:style:handler:");
}

id objc_msgSend_activePairedDeviceSelectorBlock(void *a1, const char *a2, ...)
{
  return _[a1 activePairedDeviceSelectorBlock];
}

id objc_msgSend_addAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addAction:");
}

id objc_msgSend_addExecutionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addExecutionBlock:");
}

id objc_msgSend_addIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addIndex:");
}

id objc_msgSend_addLanguageSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 addLanguageSpecifier];
}

id objc_msgSend_addLanguagesToSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLanguagesToSpecifiers:");
}

id objc_msgSend_addLikelySubtagsForLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addLikelySubtagsForLocaleIdentifier:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObjectsFromArray:");
}

id objc_msgSend_addObserver_selector_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addObserver:selector:name:object:");
}

id objc_msgSend_addOperation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addOperation:");
}

id objc_msgSend_addSubview_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "addSubview:");
}

id objc_msgSend_alertControllerWithTitle_message_preferredStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "alertControllerWithTitle:message:preferredStyle:");
}

id objc_msgSend_alternateDSID(void *a1, const char *a2, ...)
{
  return _[a1 alternateDSID];
}

id objc_msgSend_appearance(void *a1, const char *a2, ...)
{
  return _[a1 appearance];
}

id objc_msgSend_appleLanguages(void *a1, const char *a2, ...)
{
  return _[a1 appleLanguages];
}

id objc_msgSend_applicationProxyForIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "applicationProxyForIdentifier:");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return _[a1 array];
}

id objc_msgSend_arrayByAddingObjectsFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayByAddingObjectsFromArray:");
}

id objc_msgSend_arrayWithCapacity_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithCapacity:");
}

id objc_msgSend_arrayWithObjects_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_ascender(void *a1, const char *a2, ...)
{
  return _[a1 ascender];
}

id objc_msgSend_baseLanguageFromLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "baseLanguageFromLanguage:");
}

id objc_msgSend_baseSystemLanguages(void *a1, const char *a2, ...)
{
  return _[a1 baseSystemLanguages];
}

id objc_msgSend_beginBackgroundTaskWithName_expirationHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "beginBackgroundTaskWithName:expirationHandler:");
}

id objc_msgSend_beginUpdates(void *a1, const char *a2, ...)
{
  return _[a1 beginUpdates];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return _[a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return _[a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return _[a1 bounds];
}

id objc_msgSend_bundleForClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleForClass:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return _[a1 bundleURL];
}

id objc_msgSend_bundleWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithIdentifier:");
}

id objc_msgSend_bundleWithURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "bundleWithURL:");
}

id objc_msgSend_calendarDirectionality(void *a1, const char *a2, ...)
{
  return _[a1 calendarDirectionality];
}

id objc_msgSend_calendarIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 calendarIdentifier];
}

id objc_msgSend_canCapitalizeAutonymForLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canCapitalizeAutonymForLanguage:");
}

id objc_msgSend_canEditLanguageAtIndexPath_tableView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canEditLanguageAtIndexPath:tableView:");
}

id objc_msgSend_canRemoveLanguages_fromPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canRemoveLanguages:fromPreferredLanguages:");
}

id objc_msgSend_canSelectUserInflection(void *a1, const char *a2, ...)
{
  return _[a1 canSelectUserInflection];
}

id objc_msgSend_canShareInflectionWithApps(void *a1, const char *a2, ...)
{
  return _[a1 canShareInflectionWithApps];
}

id objc_msgSend_cancelAllOperations(void *a1, const char *a2, ...)
{
  return _[a1 cancelAllOperations];
}

id objc_msgSend_canonicalLanguageIdentifierFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalLanguageIdentifierFromString:");
}

id objc_msgSend_canonicalLocaleIdentifier_withNewLanguageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalLocaleIdentifier:withNewLanguageIdentifier:");
}

id objc_msgSend_canonicalLocaleIdentifierFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalLocaleIdentifierFromComponents:");
}

id objc_msgSend_canonicalLocaleIdentifierWithValidCalendarForComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "canonicalLocaleIdentifierWithValidCalendarForComponents:");
}

id objc_msgSend_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "cellForRowAtIndexPath:");
}

id objc_msgSend_centerXAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerXAnchor];
}

id objc_msgSend_centerYAnchor(void *a1, const char *a2, ...)
{
  return _[a1 centerYAnchor];
}

id objc_msgSend_changeLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "changeLanguage:");
}

id objc_msgSend_checkedLanguageCode(void *a1, const char *a2, ...)
{
  return _[a1 checkedLanguageCode];
}

id objc_msgSend_clearColor(void *a1, const char *a2, ...)
{
  return _[a1 clearColor];
}

id objc_msgSend_commit(void *a1, const char *a2, ...)
{
  return _[a1 commit];
}

id objc_msgSend_commitRegion(void *a1, const char *a2, ...)
{
  return _[a1 commitRegion];
}

id objc_msgSend_componentsFromLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "componentsFromLocaleIdentifier:");
}

id objc_msgSend_configurationWithActions_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "configurationWithActions:");
}

id objc_msgSend_constraintEqualToAnchor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "constraintEqualToAnchor:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_contextualActionWithStyle_title_handler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "contextualActionWithStyle:title:handler:");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return _[a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return _[a1 count];
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return _[a1 currentCalendar];
}

id objc_msgSend_currentCollation(void *a1, const char *a2, ...)
{
  return _[a1 currentCollation];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return _[a1 currentDevice];
}

id objc_msgSend_currentInflection(void *a1, const char *a2, ...)
{
  return _[a1 currentInflection];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return _[a1 currentLocale];
}

id objc_msgSend_currentRegion(void *a1, const char *a2, ...)
{
  return _[a1 currentRegion];
}

id objc_msgSend_currentUser(void *a1, const char *a2, ...)
{
  return _[a1 currentUser];
}

id objc_msgSend_currentlySelectedCalendarIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 currentlySelectedCalendarIdentifier];
}

id objc_msgSend_dateFormatSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 dateFormatSpecifier];
}

id objc_msgSend_defaultCalendarForLocaleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultCalendarForLocaleID:");
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return _[a1 defaultCenter];
}

id objc_msgSend_defaultLanguage(void *a1, const char *a2, ...)
{
  return _[a1 defaultLanguage];
}

id objc_msgSend_defaultNumberingSystemForLocaleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "defaultNumberingSystemForLocaleID:");
}

id objc_msgSend_dequeueReusableCellWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dequeueReusableCellWithIdentifier:");
}

id objc_msgSend_descender(void *a1, const char *a2, ...)
{
  return _[a1 descender];
}

id objc_msgSend_deselectHighlightedRow(void *a1, const char *a2, ...)
{
  return _[a1 deselectHighlightedRow];
}

id objc_msgSend_deselectRowAtIndexPath_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deselectRowAtIndexPath:animated:");
}

id objc_msgSend_detailControllerClass(void *a1, const char *a2, ...)
{
  return _[a1 detailControllerClass];
}

id objc_msgSend_detailTextLabel(void *a1, const char *a2, ...)
{
  return _[a1 detailTextLabel];
}

id objc_msgSend_deviceLanguage(void *a1, const char *a2, ...)
{
  return _[a1 deviceLanguage];
}

id objc_msgSend_deviceLanguageFrom_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLanguageFrom:");
}

id objc_msgSend_deviceLanguageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 deviceLanguageIdentifier];
}

id objc_msgSend_deviceLanguagesForChangingDeviceLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deviceLanguagesForChangingDeviceLanguage:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return _[a1 dictionary];
}

id objc_msgSend_dictionaryWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithDictionary:");
}

id objc_msgSend_dictionaryWithObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObject:forKey:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_directionalLayoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 directionalLayoutMargins];
}

id objc_msgSend_discoverabilitySignal(void *a1, const char *a2, ...)
{
  return _[a1 discoverabilitySignal];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return _[a1 dismiss];
}

id objc_msgSend_displayNameForNumberingSystemWithIdentifier_localeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForNumberingSystemWithIdentifier:localeIdentifier:");
}

id objc_msgSend_displayNameForSelectableScriptCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "displayNameForSelectableScriptCode:");
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return _[a1 domain];
}

id objc_msgSend_editButtonItem(void *a1, const char *a2, ...)
{
  return _[a1 editButtonItem];
}

id objc_msgSend_emitNavigationEventForLanguageViewController(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEventForLanguageViewController];
}

id objc_msgSend_emitNavigationEventForLocaleController(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEventForLocaleController];
}

id objc_msgSend_emitNavigationEventForRootController(void *a1, const char *a2, ...)
{
  return _[a1 emitNavigationEventForRootController];
}

id objc_msgSend_emitNavigationEventForSpecifier_viewController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "emitNavigationEventForSpecifier:viewController:");
}

id objc_msgSend_enableDefaultKeyboardForPreferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 enableDefaultKeyboardForPreferredLanguages];
}

id objc_msgSend_endBackgroundTask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endBackgroundTask:");
}

id objc_msgSend_endEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "endEditing:");
}

id objc_msgSend_endUpdates(void *a1, const char *a2, ...)
{
  return _[a1 endUpdates];
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_enumerateSubstringsInRange_options_usingBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:");
}

id objc_msgSend_evaluateWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "evaluateWithObject:");
}

id objc_msgSend_explanationTextForSelectableScripts(void *a1, const char *a2, ...)
{
  return _[a1 explanationTextForSelectableScripts];
}

id objc_msgSend_externalRepresentationDictionary(void *a1, const char *a2, ...)
{
  return _[a1 externalRepresentationDictionary];
}

id objc_msgSend_filteredLanguageSections(void *a1, const char *a2, ...)
{
  return _[a1 filteredLanguageSections];
}

id objc_msgSend_filteredLanguagesBySearchString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredLanguagesBySearchString:");
}

id objc_msgSend_filteredListContent(void *a1, const char *a2, ...)
{
  return _[a1 filteredListContent];
}

id objc_msgSend_filteredRegionsForRegionList_searchString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "filteredRegionsForRegionList:searchString:");
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return _[a1 firstObject];
}

id objc_msgSend_firstWeekdaySpecifier(void *a1, const char *a2, ...)
{
  return _[a1 firstWeekdaySpecifier];
}

id objc_msgSend_font(void *a1, const char *a2, ...)
{
  return _[a1 font];
}

id objc_msgSend_forceCapitalizationInLanguageLists(void *a1, const char *a2, ...)
{
  return _[a1 forceCapitalizationInLanguageLists];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return _[a1 frame];
}

id objc_msgSend_generateLanguageCells(void *a1, const char *a2, ...)
{
  return _[a1 generateLanguageCells];
}

id objc_msgSend_generateRegionSampleLabel(void *a1, const char *a2, ...)
{
  return _[a1 generateRegionSampleLabel];
}

id objc_msgSend_getAllDevicesWithArchivedAltAccountDevicesMatching_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getAllDevicesWithArchivedAltAccountDevicesMatching:");
}

id objc_msgSend_getGroup_row_ofSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGroup:row:ofSpecifierID:");
}

id objc_msgSend_getGroupSpecifierForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "getGroupSpecifierForSpecifier:");
}

id objc_msgSend_gizmoGlobalDomain(void *a1, const char *a2, ...)
{
  return _[a1 gizmoGlobalDomain];
}

id objc_msgSend_gizmoProtectedMorphologyDomain(void *a1, const char *a2, ...)
{
  return _[a1 gizmoProtectedMorphologyDomain];
}

id objc_msgSend_gizmoPublicMorphologyDomain(void *a1, const char *a2, ...)
{
  return _[a1 gizmoPublicMorphologyDomain];
}

id objc_msgSend_groupSpecifierWithID_name_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "groupSpecifierWithID:name:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return _[a1 identifier];
}

id objc_msgSend_indexAtPosition_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexAtPosition:");
}

id objc_msgSend_indexForIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexForIndexPath:");
}

id objc_msgSend_indexOfObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfObject:");
}

id objc_msgSend_indexOfSpecifierID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierID:");
}

id objc_msgSend_indexOfSpecifierWithID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexOfSpecifierWithID:");
}

id objc_msgSend_indexPathForRow_inSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathForRow:inSection:");
}

id objc_msgSend_indexPathForSelectedRow(void *a1, const char *a2, ...)
{
  return _[a1 indexPathForSelectedRow];
}

id objc_msgSend_indexPathIsInPreferredLanguagesGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "indexPathIsInPreferredLanguagesGroup:");
}

id objc_msgSend_indexSet(void *a1, const char *a2, ...)
{
  return _[a1 indexSet];
}

id objc_msgSend_initWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithArray:");
}

id objc_msgSend_initWithBarButtonSystemItem_target_action_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithBarButtonSystemItem:target:action:");
}

id objc_msgSend_initWithDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:");
}

id objc_msgSend_initWithExternalRepresentationDictionary_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithExternalRepresentationDictionary:error:");
}

id objc_msgSend_initWithFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:");
}

id objc_msgSend_initWithFrame_style_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithFrame:style:");
}

id objc_msgSend_initWithIdentifier_bundleID_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithIdentifier:bundleID:context:");
}

id objc_msgSend_initWithInternationalController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithInternationalController:");
}

id objc_msgSend_initWithKey_table_locale_bundleURL_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithKey:table:locale:bundleURL:");
}

id objc_msgSend_initWithLabel_languageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithLabel:languageIdentifier:");
}

id objc_msgSend_initWithOfficialLanguages(void *a1, const char *a2, ...)
{
  return _[a1 initWithOfficialLanguages];
}

id objc_msgSend_initWithPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredLanguages:");
}

id objc_msgSend_initWithPreferredLanguages_preferredLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithPreferredLanguages:preferredLocale:");
}

id objc_msgSend_initWithSearchResultsController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithSearchResultsController:");
}

id objc_msgSend_initWithString_attributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithString:attributes:");
}

id objc_msgSend_initWithStyle_reuseIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithStyle:reuseIdentifier:");
}

id objc_msgSend_initializeUpdatedAppleLanguagesIfNeeded(void *a1, const char *a2, ...)
{
  return _[a1 initializeUpdatedAppleLanguagesIfNeeded];
}

id objc_msgSend_insertContiguousSpecifiers_atEndOfGroup_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:atEndOfGroup:animated:");
}

id objc_msgSend_insertContiguousSpecifiers_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertContiguousSpecifiers:atIndex:animated:");
}

id objc_msgSend_insertObject_atIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertObject:atIndex:");
}

id objc_msgSend_insertSpecifier_atEndOfGroup_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atEndOfGroup:animated:");
}

id objc_msgSend_insertSpecifier_atIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "insertSpecifier:atIndex:animated:");
}

id objc_msgSend_internationalController(void *a1, const char *a2, ...)
{
  return _[a1 internationalController];
}

id objc_msgSend_isBeingDismissed(void *a1, const char *a2, ...)
{
  return _[a1 isBeingDismissed];
}

id objc_msgSend_isCancelled(void *a1, const char *a2, ...)
{
  return _[a1 isCancelled];
}

id objc_msgSend_isEditing(void *a1, const char *a2, ...)
{
  return _[a1 isEditing];
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isEqualToArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToArray:");
}

id objc_msgSend_isEqualToNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToNumber:");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_isMemberOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isMemberOfClass:");
}

id objc_msgSend_isMovingFromParentViewController(void *a1, const char *a2, ...)
{
  return _[a1 isMovingFromParentViewController];
}

id objc_msgSend_isSettingDifferentLanguage(void *a1, const char *a2, ...)
{
  return _[a1 isSettingDifferentLanguage];
}

id objc_msgSend_isSharedIPad(void *a1, const char *a2, ...)
{
  return _[a1 isSharedIPad];
}

id objc_msgSend_isSubclassOfClass_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "isSubclassOfClass:");
}

id objc_msgSend_label(void *a1, const char *a2, ...)
{
  return _[a1 label];
}

id objc_msgSend_labelForString_languageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "labelForString:languageIdentifier:");
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return _[a1 languageCode];
}

id objc_msgSend_languageFromLanguage_byReplacingRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageFromLanguage:byReplacingRegion:");
}

id objc_msgSend_languageIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 languageIdentifier];
}

id objc_msgSend_languageSections(void *a1, const char *a2, ...)
{
  return _[a1 languageSections];
}

id objc_msgSend_languageSpecifiersFrom_forGroup_sorted_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageSpecifiersFrom:forGroup:sorted:");
}

id objc_msgSend_languageVariants(void *a1, const char *a2, ...)
{
  return _[a1 languageVariants];
}

id objc_msgSend_languageWithIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "languageWithIdentifier:");
}

id objc_msgSend_layoutMargins(void *a1, const char *a2, ...)
{
  return _[a1 layoutMargins];
}

id objc_msgSend_layoutMarginsGuide(void *a1, const char *a2, ...)
{
  return _[a1 layoutMarginsGuide];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 leadingAnchor];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return _[a1 length];
}

id objc_msgSend_listController(void *a1, const char *a2, ...)
{
  return _[a1 listController];
}

id objc_msgSend_loadData(void *a1, const char *a2, ...)
{
  return _[a1 loadData];
}

id objc_msgSend_loadFormatExampleWithSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadFormatExampleWithSpecifiers:");
}

id objc_msgSend_loadRegionWithSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadRegionWithSpecifiers:");
}

id objc_msgSend_loadRegions(void *a1, const char *a2, ...)
{
  return _[a1 loadRegions];
}

id objc_msgSend_loadSections(void *a1, const char *a2, ...)
{
  return _[a1 loadSections];
}

id objc_msgSend_loadSpecifiersFromPlistName_target_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "loadSpecifiersFromPlistName:target:");
}

id objc_msgSend_localeIdentifier(void *a1, const char *a2, ...)
{
  return _[a1 localeIdentifier];
}

id objc_msgSend_localeIdentifierFromComponents_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeIdentifierFromComponents:");
}

id objc_msgSend_localeRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 localeRepresentation];
}

id objc_msgSend_localeWithLocaleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localeWithLocaleIdentifier:");
}

id objc_msgSend_localizations(void *a1, const char *a2, ...)
{
  return _[a1 localizations];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return _[a1 localizedName];
}

id objc_msgSend_localizedRestartStringForCurrentDevice(void *a1, const char *a2, ...)
{
  return _[a1 localizedRestartStringForCurrentDevice];
}

id objc_msgSend_localizedShortDescription(void *a1, const char *a2, ...)
{
  return _[a1 localizedShortDescription];
}

id objc_msgSend_localizedStandardCompare_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStandardCompare:");
}

id objc_msgSend_localizedStringByJoiningStrings_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringByJoiningStrings:");
}

id objc_msgSend_localizedStringForKey_value_table_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:");
}

id objc_msgSend_localizedStringForKey_value_table_localization_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForKey:value:table:localization:");
}

id objc_msgSend_localizedStringForLanguage_context_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForLanguage:context:");
}

id objc_msgSend_localizedStringForName(void *a1, const char *a2, ...)
{
  return _[a1 localizedStringForName];
}

id objc_msgSend_localizedStringForRegion_context_short_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringForRegion:context:short:");
}

id objc_msgSend_localizedStringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "localizedStringWithFormat:");
}

id objc_msgSend_logChangedLanguage(void *a1, const char *a2, ...)
{
  return _[a1 logChangedLanguage];
}

id objc_msgSend_logStatistics(void *a1, const char *a2, ...)
{
  return _[a1 logStatistics];
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return _[a1 mainBundle];
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return _[a1 manager];
}

id objc_msgSend_matchedLanguagesFromAvailableLanguages_forPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "matchedLanguagesFromAvailableLanguages:forPreferredLanguages:");
}

id objc_msgSend_measurementSystemSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 measurementSystemSpecifier];
}

id objc_msgSend_mirrorToWatchIfNecessary(void *a1, const char *a2, ...)
{
  return _[a1 mirrorToWatchIfNecessary];
}

id objc_msgSend_modelSpecificLocalizedStringKeyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "modelSpecificLocalizedStringKeyForKey:");
}

id objc_msgSend_moveSpecifierAtIndexPath_toIndexPath_moveRow_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "moveSpecifierAtIndexPath:toIndexPath:moveRow:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return _[a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return _[a1 name];
}

id objc_msgSend_navigationBar(void *a1, const char *a2, ...)
{
  return _[a1 navigationBar];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return _[a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return _[a1 navigationItem];
}

id objc_msgSend_normalizedLanguageIDFromString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "normalizedLanguageIDFromString:");
}

id objc_msgSend_normalizedLocalizations(void *a1, const char *a2, ...)
{
  return _[a1 normalizedLocalizations];
}

id objc_msgSend_numberFormatSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 numberFormatSpecifier];
}

id objc_msgSend_numberOfGroups(void *a1, const char *a2, ...)
{
  return _[a1 numberOfGroups];
}

id objc_msgSend_numberOfRowsInSection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberOfRowsInSection:");
}

id objc_msgSend_numberOfSections(void *a1, const char *a2, ...)
{
  return _[a1 numberOfSections];
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithUnsignedInteger_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberWithUnsignedInteger:");
}

id objc_msgSend_numberingSystemSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 numberingSystemSpecifier];
}

id objc_msgSend_numberingSystemsForLocaleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "numberingSystemsForLocaleID:");
}

id objc_msgSend_numberingSystemsValues(void *a1, const char *a2, ...)
{
  return _[a1 numberingSystemsValues];
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:");
}

id objc_msgSend_objectForKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKey:inDomain:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_optionNameForSelectableScripts(void *a1, const char *a2, ...)
{
  return _[a1 optionNameForSelectableScripts];
}

id objc_msgSend_orderedSet(void *a1, const char *a2, ...)
{
  return _[a1 orderedSet];
}

id objc_msgSend_orderedSetWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "orderedSetWithArray:");
}

id objc_msgSend_otherLanguageGroup(void *a1, const char *a2, ...)
{
  return _[a1 otherLanguageGroup];
}

id objc_msgSend_otherLanguages(void *a1, const char *a2, ...)
{
  return _[a1 otherLanguages];
}

id objc_msgSend_parentController(void *a1, const char *a2, ...)
{
  return _[a1 parentController];
}

id objc_msgSend_pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier_title_localizedNavigationComponents_deepLink_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:");
}

id objc_msgSend_predicateWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "predicateWithFormat:");
}

id objc_msgSend_preferenceSpecifierNamed_target_set_get_detail_cell_edit_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:");
}

id objc_msgSend_preferredFontForTextStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredFontForTextStyle:");
}

id objc_msgSend_preferredHeightForWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredHeightForWidth:");
}

id objc_msgSend_preferredLanguageForBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLanguageForBundleID:");
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return _[a1 preferredLanguages];
}

id objc_msgSend_preferredLocale(void *a1, const char *a2, ...)
{
  return _[a1 preferredLocale];
}

id objc_msgSend_preferredLocalizations(void *a1, const char *a2, ...)
{
  return _[a1 preferredLocalizations];
}

id objc_msgSend_preferredLocalizationsFromArray_forPreferences_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "preferredLocalizationsFromArray:forPreferences:");
}

id objc_msgSend_presentViewController_animated_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "presentViewController:animated:completion:");
}

id objc_msgSend_presentedViewController(void *a1, const char *a2, ...)
{
  return _[a1 presentedViewController];
}

id objc_msgSend_propertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "propertyForKey:");
}

id objc_msgSend_ps_insertObjectsFromArray_afterObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "ps_insertObjectsFromArray:afterObject:");
}

id objc_msgSend_purgeImageCache(void *a1, const char *a2, ...)
{
  return _[a1 purgeImageCache];
}

id objc_msgSend_rangeOfString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:");
}

id objc_msgSend_rangeOfString_options_range_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "rangeOfString:options:range:");
}

id objc_msgSend_regionCode(void *a1, const char *a2, ...)
{
  return _[a1 regionCode];
}

id objc_msgSend_regionName(void *a1, const char *a2, ...)
{
  return _[a1 regionName];
}

id objc_msgSend_regionWithName_code_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "regionWithName:code:");
}

id objc_msgSend_regionsList(void *a1, const char *a2, ...)
{
  return _[a1 regionsList];
}

id objc_msgSend_registerPreferredLanguageForAddedKeyboardLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "registerPreferredLanguageForAddedKeyboardLanguage:");
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return _[a1 reloadData];
}

id objc_msgSend_reloadDataAndScrollToCheckedRegionAnimated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadDataAndScrollToCheckedRegionAnimated:");
}

id objc_msgSend_reloadLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadLocale:");
}

id objc_msgSend_reloadQueue(void *a1, const char *a2, ...)
{
  return _[a1 reloadQueue];
}

id objc_msgSend_reloadSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "reloadSpecifier:");
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 reloadSpecifiers];
}

id objc_msgSend_removeContiguousSpecifiers_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeContiguousSpecifiers:animated:");
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return _[a1 removeFromSuperview];
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

id objc_msgSend_removeObjectsInArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectsInArray:");
}

id objc_msgSend_removeObserver_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:");
}

id objc_msgSend_removeObserver_name_object_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObserver:name:object:");
}

id objc_msgSend_removePropertyForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removePropertyForKey:");
}

id objc_msgSend_removeSpecifier_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifier:animated:");
}

id objc_msgSend_removeSpecifierAtIndex_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeSpecifierAtIndex:animated:");
}

id objc_msgSend_removedGroupsAbovePreferredLanguagesInEditing(void *a1, const char *a2, ...)
{
  return _[a1 removedGroupsAbovePreferredLanguagesInEditing];
}

id objc_msgSend_removedGroupsBelowPreferredLanguagesInEditing(void *a1, const char *a2, ...)
{
  return _[a1 removedGroupsBelowPreferredLanguagesInEditing];
}

id objc_msgSend_renderableUILanguages(void *a1, const char *a2, ...)
{
  return _[a1 renderableUILanguages];
}

id objc_msgSend_replaceContiguousSpecifiers_withSpecifiers_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceContiguousSpecifiers:withSpecifiers:");
}

id objc_msgSend_replaceObjectAtIndex_withObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "replaceObjectAtIndex:withObject:");
}

id objc_msgSend_resetTimeFormat(void *a1, const char *a2, ...)
{
  return _[a1 resetTimeFormat];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return _[a1 row];
}

id objc_msgSend_saveLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "saveLanguage:");
}

id objc_msgSend_scrollToRowAtIndexPath_atScrollPosition_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "scrollToRowAtIndexPath:atScrollPosition:animated:");
}

id objc_msgSend_searchBar(void *a1, const char *a2, ...)
{
  return _[a1 searchBar];
}

id objc_msgSend_searchController(void *a1, const char *a2, ...)
{
  return _[a1 searchController];
}

id objc_msgSend_searchQueue(void *a1, const char *a2, ...)
{
  return _[a1 searchQueue];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return _[a1 section];
}

id objc_msgSend_sectionForObject_collationStringSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sectionForObject:collationStringSelector:");
}

id objc_msgSend_sectionIndexTitles(void *a1, const char *a2, ...)
{
  return _[a1 sectionIndexTitles];
}

id objc_msgSend_sectionTitles(void *a1, const char *a2, ...)
{
  return _[a1 sectionTitles];
}

id objc_msgSend_sections(void *a1, const char *a2, ...)
{
  return _[a1 sections];
}

id objc_msgSend_selectableScriptCodes(void *a1, const char *a2, ...)
{
  return _[a1 selectableScriptCodes];
}

id objc_msgSend_selectedRegion(void *a1, const char *a2, ...)
{
  return _[a1 selectedRegion];
}

id objc_msgSend_sendActions_withResult_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendActions:withResult:");
}

id objc_msgSend_sendEvent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sendEvent:");
}

id objc_msgSend_setAccessoryType_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAccessoryType:");
}

id objc_msgSend_setActive_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setActive:");
}

id objc_msgSend_setAddLanguageSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAddLanguageSpecifier:");
}

id objc_msgSend_setAdjustsFontForContentSizeCategory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAdjustsFontForContentSizeCategory:");
}

id objc_msgSend_setAttributedText_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAttributedText:");
}

id objc_msgSend_setAutomaticallyShowsCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutomaticallyShowsCancelButton:");
}

id objc_msgSend_setAutoresizingMask_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutoresizingMask:");
}

id objc_msgSend_setAutorotates_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setAutorotates:");
}

id objc_msgSend_setBackgroundColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBackgroundColor:");
}

id objc_msgSend_setBundleIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setBundleIdentifier:");
}

id objc_msgSend_setCalendarDirectionality_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendarDirectionality:");
}

id objc_msgSend_setCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCalendarIdentifier:");
}

id objc_msgSend_setCanShareInflection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanShareInflection:");
}

id objc_msgSend_setCanShareInflectionWithApps_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCanShareInflectionWithApps:");
}

id objc_msgSend_setChecked_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setChecked:");
}

id objc_msgSend_setCheckedLanguageCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCheckedLanguageCode:");
}

id objc_msgSend_setConfigurationInfo_forIdentifier_forAltDSID_completion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfigurationInfo:forIdentifier:forAltDSID:completion:");
}

id objc_msgSend_setConfirmationAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationAction:");
}

id objc_msgSend_setConfirmationCancelAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setConfirmationCancelAction:");
}

id objc_msgSend_setCurrentRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentRegion:");
}

id objc_msgSend_setCurrentlySelectedCalendarIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setCurrentlySelectedCalendarIdentifier:");
}

id objc_msgSend_setDataSource_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDataSource:");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setEditing_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEditing:animated:");
}

id objc_msgSend_setEstimatedRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setEstimatedRowHeight:");
}

id objc_msgSend_setFilteredLanguageSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteredLanguageSections:");
}

id objc_msgSend_setFilteredListContent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFilteredListContent:");
}

id objc_msgSend_setFont_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFont:");
}

id objc_msgSend_setFrame_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setFrame:");
}

id objc_msgSend_setHidesBackButton_animated_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesBackButton:animated:");
}

id objc_msgSend_setHidesNavigationBarDuringPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesNavigationBarDuringPresentation:");
}

id objc_msgSend_setHidesSearchBarWhenScrolling_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHidesSearchBarWhenScrolling:");
}

id objc_msgSend_setHighlightedTextColor_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setHighlightedTextColor:");
}

id objc_msgSend_setIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIdentifier:");
}

id objc_msgSend_setIndicatorStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setIndicatorStyle:");
}

id objc_msgSend_setInflection_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setInflection:");
}

id objc_msgSend_setKeyboardDismissMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setKeyboardDismissMode:");
}

id objc_msgSend_setLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:");
}

id objc_msgSend_setLanguage_specifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguage:specifier:");
}

id objc_msgSend_setLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLanguages:");
}

id objc_msgSend_setLeftBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLeftBarButtonItem:");
}

id objc_msgSend_setLineBreakMode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLineBreakMode:");
}

id objc_msgSend_setListController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setListController:");
}

id objc_msgSend_setLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocale:");
}

id objc_msgSend_setLocaleAfterLanguageChange_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocaleAfterLanguageChange:");
}

id objc_msgSend_setLocaleOnly_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocaleOnly:");
}

id objc_msgSend_setLocaleRepresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setLocaleRepresentation:");
}

id objc_msgSend_setMaxConcurrentOperationCount_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setMaxConcurrentOperationCount:");
}

id objc_msgSend_setModalPresentationStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalPresentationStyle:");
}

id objc_msgSend_setModalTransitionStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setModalTransitionStyle:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNumberOfLines_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberOfLines:");
}

id objc_msgSend_setNumberStyle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberStyle:");
}

id objc_msgSend_setNumberingSystemSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setNumberingSystemSpecifier:");
}

id objc_msgSend_setObject_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:");
}

id objc_msgSend_setObject_forKey_inDomain_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKey:inDomain:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setObscuresBackgroundDuringPresentation_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setObscuresBackgroundDuringPresentation:");
}

id objc_msgSend_setOtherLanguageGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setOtherLanguageGroup:");
}

id objc_msgSend_setParentController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setParentController:");
}

id objc_msgSend_setPlaceholder_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPlaceholder:");
}

id objc_msgSend_setPreferredAction_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredAction:");
}

id objc_msgSend_setPreferredLanguage_forBundleID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredLanguage:forBundleID:");
}

id objc_msgSend_setPreferredLanguageAndUpdateLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredLanguageAndUpdateLocale:");
}

id objc_msgSend_setPreferredLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setPreferredLanguages:");
}

id objc_msgSend_setProperty_forKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setProperty:forKey:");
}

id objc_msgSend_setRegion_changeLanguageVariant_postNotification_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegion:changeLanguageVariant:postNotification:");
}

id objc_msgSend_setRegion_updateFirstLanguage_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegion:updateFirstLanguage:");
}

id objc_msgSend_setRegionCode_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegionCode:");
}

id objc_msgSend_setRegionName_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegionName:");
}

id objc_msgSend_setRegionsList_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRegionsList:");
}

id objc_msgSend_setRemovedGroupsAbovePreferredLanguagesInEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedGroupsAbovePreferredLanguagesInEditing:");
}

id objc_msgSend_setRemovedGroupsBelowPreferredLanguagesInEditing_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRemovedGroupsBelowPreferredLanguagesInEditing:");
}

id objc_msgSend_setRightBarButtonItem_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRightBarButtonItem:");
}

id objc_msgSend_setRootController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRootController:");
}

id objc_msgSend_setRowHeight_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setRowHeight:");
}

id objc_msgSend_setSearchBar_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchBar:");
}

id objc_msgSend_setSearchController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSearchController:");
}

id objc_msgSend_setSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSections:");
}

id objc_msgSend_setSelectedRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSelectedRegion:");
}

id objc_msgSend_setShouldReloadAndScrollToCurrentRegion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShouldReloadAndScrollToCurrentRegion:");
}

id objc_msgSend_setShowsCancelButton_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setShowsCancelButton:");
}

id objc_msgSend_setSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSpecifier:");
}

id objc_msgSend_setSuggestedLanguageGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setSuggestedLanguageGroup:");
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

id objc_msgSend_setTextForRegionExample_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTextForRegionExample:");
}

id objc_msgSend_setTitle_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitle:");
}

id objc_msgSend_setTitleTextAttributes_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTitleTextAttributes:");
}

id objc_msgSend_setTranslatesAutoresizingMaskIntoConstraints_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setTranslatesAutoresizingMaskIntoConstraints:");
}

id objc_msgSend_setUnfilteredLanguageSections_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUnfilteredLanguageSections:");
}

id objc_msgSend_setUpdatedAppleLanguages_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setUpdatedAppleLanguages:");
}

id objc_msgSend_setView_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setView:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return _[a1 settings];
}

id objc_msgSend_setupWithDictionary_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setupWithDictionary:");
}

id objc_msgSend_sf_isiPad(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sf_isiPad");
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return _[a1 sharedApplication];
}

id objc_msgSend_sharedCloudSettingsManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedCloudSettingsManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return _[a1 sharedManager];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return _[a1 sharedService];
}

id objc_msgSend_shortDisplayNameForNumberingSystemWithIdentifier_localeIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "shortDisplayNameForNumberingSystemWithIdentifier:localeIdentifier:");
}

id objc_msgSend_shouldReloadAndScrollToCurrentRegion(void *a1, const char *a2, ...)
{
  return _[a1 shouldReloadAndScrollToCurrentRegion];
}

id objc_msgSend_shouldReloadSpecifiers(void *a1, const char *a2, ...)
{
  return _[a1 shouldReloadSpecifiers];
}

id objc_msgSend_showConfirmationViewForSpecifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showConfirmationViewForSpecifier:");
}

id objc_msgSend_showController_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showController:");
}

id objc_msgSend_showUpdatingLanguageViewWithLabel_languageIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUpdatingLanguageViewWithLabel:languageIdentifier:completionBlock:");
}

id objc_msgSend_showUpdatingLanguageViewWithLocalizationStringKey_languageIdentifier_completionBlock_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "showUpdatingLanguageViewWithLocalizationStringKey:languageIdentifier:completionBlock:");
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return _[a1 size];
}

id objc_msgSend_sizeForLabel_maxWidth_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeForLabel:maxWidth:");
}

id objc_msgSend_sizeThatFits_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sizeThatFits:");
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return _[a1 sizeToFit];
}

id objc_msgSend_sortUsingComparator_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortUsingComparator:");
}

id objc_msgSend_sortedArrayFromArray_collationStringSelector_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "sortedArrayFromArray:collationStringSelector:");
}

id objc_msgSend_source(void *a1, const char *a2, ...)
{
  return _[a1 source];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return _[a1 specifier];
}

id objc_msgSend_specifierAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndex:");
}

id objc_msgSend_specifierAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierAtIndexPath:");
}

id objc_msgSend_specifierForID_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifierForID:");
}

id objc_msgSend_specifiers(void *a1, const char *a2, ...)
{
  return _[a1 specifiers];
}

id objc_msgSend_specifiersInGroup_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "specifiersInGroup:");
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 standardUserDefaults];
}

id objc_msgSend_string_withCapitalizedDisplayNamesForFirstLanguageIdentifier_secondLanguageIdentifier_thirdLanguageIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "string:withCapitalizedDisplayNamesForFirstLanguageIdentifier:secondLanguageIdentifier:thirdLanguageIdentifier:");
}

id objc_msgSend_stringByAppendingString_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingString:");
}

id objc_msgSend_stringFromNumber_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringFromNumber:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_subviews(void *a1, const char *a2, ...)
{
  return _[a1 subviews];
}

id objc_msgSend_suggestedLanguageGroup(void *a1, const char *a2, ...)
{
  return _[a1 suggestedLanguageGroup];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return _[a1 superview];
}

id objc_msgSend_supportedCalendars(void *a1, const char *a2, ...)
{
  return _[a1 supportedCalendars];
}

id objc_msgSend_supportedRecognitionLanguagesAndReturnError_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "supportedRecognitionLanguagesAndReturnError:");
}

id objc_msgSend_supportedRegions(void *a1, const char *a2, ...)
{
  return _[a1 supportedRegions];
}

id objc_msgSend_syncManager(void *a1, const char *a2, ...)
{
  return _[a1 syncManager];
}

id objc_msgSend_syncPreferencesAndPostNotificationForLanguageChange(void *a1, const char *a2, ...)
{
  return _[a1 syncPreferencesAndPostNotificationForLanguageChange];
}

id objc_msgSend_syncPreferencesForLanguageOrLocaleChange(void *a1, const char *a2, ...)
{
  return _[a1 syncPreferencesForLanguageOrLocaleChange];
}

id objc_msgSend_syncToCloudSettings(void *a1, const char *a2, ...)
{
  return _[a1 syncToCloudSettings];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeNanoDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeNanoDomain:keys:");
}

id objc_msgSend_systemDisplayLanguage(void *a1, const char *a2, ...)
{
  return _[a1 systemDisplayLanguage];
}

id objc_msgSend_systemLanguages(void *a1, const char *a2, ...)
{
  return _[a1 systemLanguages];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return _[a1 table];
}

id objc_msgSend_tableView_cellForRowAtIndexPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "tableView:cellForRowAtIndexPath:");
}

id objc_msgSend_temperatureUnitSpecifier(void *a1, const char *a2, ...)
{
  return _[a1 temperatureUnitSpecifier];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return _[a1 text];
}

id objc_msgSend_textColor(void *a1, const char *a2, ...)
{
  return _[a1 textColor];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return _[a1 textLabel];
}

id objc_msgSend_titleLabel(void *a1, const char *a2, ...)
{
  return _[a1 titleLabel];
}

id objc_msgSend_topLanguageFromArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "topLanguageFromArray:");
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return _[a1 trailingAnchor];
}

id objc_msgSend_unfilteredLanguageSections(void *a1, const char *a2, ...)
{
  return _[a1 unfilteredLanguageSections];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return _[a1 unsignedIntegerValue];
}

id objc_msgSend_updateCell_forPreferredLanguageAtIndex_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateCell:forPreferredLanguageAtIndex:");
}

id objc_msgSend_updateLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "updateLocale:");
}

id objc_msgSend_updateNavigationItem(void *a1, const char *a2, ...)
{
  return _[a1 updateNavigationItem];
}

id objc_msgSend_updatedAppleLanguages(void *a1, const char *a2, ...)
{
  return _[a1 updatedAppleLanguages];
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return _[a1 uppercaseString];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return _[a1 userInterfaceLayoutDirection];
}

id objc_msgSend_usesDarkTheme(void *a1, const char *a2, ...)
{
  return _[a1 usesDarkTheme];
}

id objc_msgSend_validateLocale_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "validateLocale:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return _[a1 view];
}

id objc_msgSend_whiteColor(void *a1, const char *a2, ...)
{
  return _[a1 whiteColor];
}

id objc_msgSend_writeLanguageAndLocaleConfigurationIfNeededWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeLanguageAndLocaleConfigurationIfNeededWithCompletion:");
}

id objc_msgSend_writeToCloudSettings_forStore_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "writeToCloudSettings:forStore:");
}