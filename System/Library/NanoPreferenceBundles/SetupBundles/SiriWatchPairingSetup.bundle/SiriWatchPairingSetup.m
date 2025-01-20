void VTUISetSiriEnabled(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  unsigned int v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSLocale *v14;
  uint64_t (*v15)(NSLocale *);
  void *v16;
  void *v17;
  void *v18;
  void v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  void *v23;

  v2 = +[BPSBridgeAppContext shared];
  v3 = [v2 activeDevice];
  v4 = [objc_alloc((Class)NSUUID) initWithUUIDString:@"F06861AE-125A-424B-AF25-C1DAA8F7AEBC"];
  v5 = [v3 supportsCapability:v4];

  if (v5)
  {
    v6 = +[BPSBridgeAppContext shared];
    v7 = [v6 activeDevice];

    v8 = [objc_alloc((Class)NPSDomainAccessor) initWithDomain:@"com.apple.assistant.nano" pairedDevice:v7];
    v9 = +[NSNumber numberWithBool:a1];
    [v8 setObject:v9 forKey:@"Assistant Enabled"];
    [v8 setObject:v9 forKey:@"Dictation Enabled"];
    v10 = [v8 synchronize];
    v11 = objc_opt_new();
    v12 = [v8 domain];
    v13 = +[NSSet setWithObjects:@"Assistant Enabled", @"Dictation Enabled", 0];
    [v11 synchronizeNanoDomain:v12 keys:v13];
  }
  else
  {
    v7 = [sub_2E1C() sharedPreferences];
    [v7 setAssistantIsEnabled:a1];
  }

  if (a1)
  {
    v14 = +[NSLocale currentLocale];
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v15 = (uint64_t (*)(NSLocale *))off_CD50;
    v23 = off_CD50;
    if (!off_CD50)
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_3B60;
      v19[3] = &unk_8238;
      v19[4] = &v20;
      sub_3B60((uint64_t)v19);
      v15 = (uint64_t (*)(NSLocale *))v21[3];
    }
    _Block_object_dispose(&v20, 8);
    if (!v15) {
      sub_5EB8();
    }
    v16 = (void *)v15(v14);
    v17 = [sub_2E1C() sharedPreferences];
    [v17 setLanguageCode:v16];
  }
  v18 = [sub_2E1C() sharedPreferences];
  [v18 synchronize];
}

void sub_2E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_2E1C()
{
  uint64_t v4 = 0;
  v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)qword_CD40;
  uint64_t v7 = qword_CD40;
  if (!qword_CD40)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_3994;
    v3[3] = &unk_8238;
    v3[4] = &v4;
    sub_3994((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_2EE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t shouldShowSiriOptInPage()
{
  if (!MGGetBoolAnswer()) {
    return 0;
  }
  v0 = +[MCProfileConnection sharedConnection];
  unsigned int v1 = [v0 effectiveBoolValueForSetting:MCFeatureAssistantAllowed];

  if (v1 == 2) {
    return 0;
  }

  return BPSShouldOfferSiriForDeviceLanguage();
}

id VTUISiriScreenStringForDevice()
{
  if (BPSIsDeviceCompatibleWithVersions())
  {
    v0 = [@"Screen-Siri" stringByAppendingString:BPSMajorVersion3_x_x_Suffix];
  }
  else
  {
    v0 = @"Screen-Siri";
  }
  unsigned int v1 = +[NSString stringWithFormat:@"DeviceAssets/%@", v0];

  return v1;
}

void sub_3174(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_3994(uint64_t a1)
{
  sub_39EC();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5F38();
  }
  qword_CD40 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_39EC()
{
  v3[0] = 0;
  if (!qword_CD48)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = 3221225472;
    v3[3] = sub_3AEC;
    v3[4] = &unk_8270;
    void v3[5] = v3;
    long long v4 = off_8258;
    uint64_t v5 = 0;
    qword_CD48 = _sl_dlopen();
  }
  uint64_t v0 = qword_CD48;
  unsigned int v1 = (void *)v3[0];
  if (!qword_CD48)
  {
    unsigned int v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t sub_3AEC()
{
  uint64_t result = _sl_dlopen();
  qword_CD48 = result;
  return result;
}

void *sub_3B60(uint64_t a1)
{
  v5[0] = 0;
  if (!qword_CD58)
  {
    v5[1] = _NSConcreteStackBlock;
    v5[2] = 3221225472;
    v5[3] = sub_3CA0;
    v5[4] = &unk_8270;
    v5[5] = v5;
    long long v6 = off_8290;
    uint64_t v7 = 0;
    qword_CD58 = _sl_dlopen();
    v3 = (void *)v5[0];
    v2 = (void *)qword_CD58;
    if (qword_CD58)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  v2 = (void *)qword_CD58;
LABEL_5:
  uint64_t result = dlsym(v2, "_VSCopyLanguageIdentifierForLocale");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_CD50 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_3CA0()
{
  uint64_t result = _sl_dlopen();
  qword_CD58 = result;
  return result;
}

void *sub_3D14(uint64_t a1)
{
  v2 = (void *)sub_39EC();
  uint64_t result = dlsym(v2, "AFAssistantRestricted");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  off_CD60 = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_3F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_3F8C(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_405C;
  block[3] = &unk_82B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_405C(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    if ([*(id *)(a1 + 32) requiresVoiceSelectionForRecognitionLanguage:*(void *)(a1 + 40)])
    {
      id v3 = [v4 delegate];
      [v3 buddyControllerReleaseHold:v4];
    }
    else
    {
      VTUISetSiriEnabled(1);
      id v3 = [v4 delegate];
      [v3 buddyControllerReleaseHoldAndSkip:v4];
    }

    WeakRetained = v4;
  }
}

void sub_42F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_440C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_CD88;
  uint64_t v7 = qword_CD88;
  if (!qword_CD88)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_49D4;
    v3[3] = &unk_8238;
    v3[4] = &v4;
    sub_49D4((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_44D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_4654(uint64_t a1)
{
  sub_46AC();
  Class result = objc_getClass("AFEnablementFlowConfigurationProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5F60();
  }
  qword_CD68 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_46AC()
{
  v1[0] = 0;
  if (!qword_CD70)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_47A8;
    v1[4] = &unk_8270;
    v1[5] = v1;
    long long v2 = off_82F8;
    uint64_t v3 = 0;
    qword_CD70 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_CD70)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_47A8()
{
  uint64_t result = _sl_dlopen();
  qword_CD70 = result;
  return result;
}

Class sub_481C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_CD80)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_4960;
    v3[4] = &unk_8270;
    void v3[5] = v3;
    long long v4 = off_8310;
    uint64_t v5 = 0;
    qword_CD80 = _sl_dlopen();
    if (!qword_CD80)
    {
      abort_report_np();
LABEL_8:
      sub_5F88();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("VTUIVoiceSelectionViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_CD78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_4960()
{
  uint64_t result = _sl_dlopen();
  qword_CD80 = result;
  return result;
}

Class sub_49D4(uint64_t a1)
{
  sub_46AC();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5F38();
  }
  qword_CD88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void VTUITinkerSetSiriEnabled(uint64_t a1)
{
  id v2 = +[BPSBridgeAppContext shared];
  [v2 tellWatchToSetSiriEnabled:a1];
}

void sub_539C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  _Block_object_dispose((const void *)(v16 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_53DC(uint64_t a1, void *a2)
{
  id v3 = a2;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_54AC;
  block[3] = &unk_82B0;
  objc_copyWeak(&v8, (id *)(a1 + 40));
  id v6 = v3;
  id v7 = *(id *)(a1 + 32);
  id v4 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
}

void sub_54AC(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_storeStrong(WeakRetained + 2, *(id *)(a1 + 32));
    if ([*(id *)(a1 + 32) requiresVoiceSelectionForRecognitionLanguage:*(void *)(a1 + 40)])
    {
      id v3 = [v4 delegate];
      [v3 buddyControllerReleaseHold:v4];
    }
    else
    {
      VTUITinkerSetSiriEnabled(1);
      id v3 = [v4 delegate];
      [v3 buddyControllerReleaseHoldAndSkip:v4];
    }

    WeakRetained = v4;
  }
}

void sub_5740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_585C()
{
  uint64_t v4 = 0;
  uint64_t v5 = &v4;
  uint64_t v6 = 0x2050000000;
  uint64_t v0 = (void *)qword_CDB0;
  uint64_t v7 = qword_CDB0;
  if (!qword_CDB0)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_5E60;
    v3[3] = &unk_8238;
    v3[4] = &v4;
    sub_5E60((uint64_t)v3);
    uint64_t v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);

  return v1;
}

void sub_5928(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_5AE0(uint64_t a1)
{
  sub_5B38();
  Class result = objc_getClass("AFEnablementFlowConfigurationProvider");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5F60();
  }
  qword_CD90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_5B38()
{
  v1[0] = 0;
  if (!qword_CD98)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_5C34;
    v1[4] = &unk_8270;
    v1[5] = v1;
    long long v2 = off_8328;
    uint64_t v3 = 0;
    qword_CD98 = _sl_dlopen();
  }
  uint64_t v0 = (void *)v1[0];
  if (!qword_CD98)
  {
    uint64_t v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_5C34()
{
  uint64_t result = _sl_dlopen();
  qword_CD98 = result;
  return result;
}

Class sub_5CA8(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_CDA8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_5DEC;
    v3[4] = &unk_8270;
    void v3[5] = v3;
    long long v4 = off_8340;
    uint64_t v5 = 0;
    qword_CDA8 = _sl_dlopen();
    if (!qword_CDA8)
    {
      abort_report_np();
LABEL_8:
      sub_5F88();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("VTUIVoiceSelectionViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_CDA0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_5DEC()
{
  uint64_t result = _sl_dlopen();
  qword_CDA8 = result;
  return result;
}

Class sub_5E60(uint64_t a1)
{
  sub_5B38();
  Class result = objc_getClass("AFPreferences");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_5F38();
  }
  qword_CDB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_5EB8()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  sub_5EDC(v0);
}

void sub_5EDC()
{
  uint64_t v0 = pbb_bridge_log();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v1 = 0;
    _os_log_impl(&dword_0, v0, OS_LOG_TYPE_DEFAULT, "Siri pane should have been skipped! Siri disabled on Phone, and Siri on Phone does not support System Language", v1, 2u);
  }

  abort();
}

void sub_5F38()
{
  uint64_t v0 = abort_report_np();
  sub_5F60(v0);
}

void sub_5F60()
{
  uint64_t v0 = abort_report_np();
  sub_5F88(v0);
}

void sub_5F88()
{
}

uint64_t BPSIsDeviceCompatibleWithVersions()
{
  return _BPSIsDeviceCompatibleWithVersions();
}

uint64_t BPSShouldOfferSiriForDeviceLanguage()
{
  return _BPSShouldOfferSiriForDeviceLanguage();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return __sl_dlopen();
}

void abort(void)
{
}

uint64_t abort_report_np()
{
  return _abort_report_np();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

char *dlerror(void)
{
  return _dlerror();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return _dlsym(__handle, __symbol);
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

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
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

uint64_t pbb_bridge_log()
{
  return _pbb_bridge_log();
}

id objc_msgSend_activeDevice(void *a1, const char *a2, ...)
{
  return [a1 activeDevice];
}

id objc_msgSend_assistantIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 assistantIsEnabled];
}

id objc_msgSend_completionLoggingBlock(void *a1, const char *a2, ...)
{
  return [a1 completionLoggingBlock];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_localizedCapitalizedString(void *a1, const char *a2, ...)
{
  return [a1 localizedCapitalizedString];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_outputVoice(void *a1, const char *a2, ...)
{
  return [a1 outputVoice];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_setupFlowUserInfo(void *a1, const char *a2, ...)
{
  return [a1 setupFlowUserInfo];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_sharedConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedConnection];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_voiceSelectionAllowsRandomSelection(void *a1, const char *a2, ...)
{
  return [a1 voiceSelectionAllowsRandomSelection];
}