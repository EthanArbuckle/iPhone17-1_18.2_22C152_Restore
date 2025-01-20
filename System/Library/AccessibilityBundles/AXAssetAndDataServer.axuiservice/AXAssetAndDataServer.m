void sub_5088(void *a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint8_t buf[4];
  int v13;
  __int16 v14;
  id v15;

  v5 = a3;
  if (v5)
  {
    v6 = AXLogCommon();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v13 = a2;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_DEFAULT, "Requested authorization to send notification for accessibility moments: %d %@", buf, 0x12u);
    }
  }
  v7 = objc_opt_class();
  v8 = a1[4];
  v9 = a1[5];
  v10 = a1[6];
  v11 = +[NSString stringWithFormat:@"teachable-moment-%@", a1[7]];
  [v7 _sendUserNotification:v8 title:v9 message:v10 threadIdentifier:v11 teachableItems:a1[8] feature:a1[7]];
}

void sub_53A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_592C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_5950(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    v4 = AXLogCommon();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_9A3C((uint64_t)v3, v4);
    }
  }
  else
  {
    +[AXTeachableMomentsManager markTeachableMomentSeenForNotification:*(void *)(a1 + 32)];
  }
}

void sub_59C0(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = objc_getClass("UNUserNotificationCenter");
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_15A78 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    sub_9AB4();
    sub_5A18();
  }
}

void sub_5A18()
{
  v1[0] = 0;
  if (!qword_15A80)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_5B14;
    v1[4] = &unk_10500;
    v1[5] = v1;
    long long v2 = off_104E8;
    uint64_t v3 = 0;
    qword_15A80 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_15A80)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_5B14()
{
  uint64_t result = _sl_dlopen();
  qword_15A80 = result;
  return result;
}

Class sub_5B88(uint64_t a1)
{
  sub_5A18();
  Class result = objc_getClass("UNNotificationCategory");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_15A88 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_9ADC();
    return (Class)sub_5BE0(v3);
  }
  return result;
}

Class sub_5BE0(uint64_t a1)
{
  sub_5A18();
  Class result = objc_getClass("UNMutableNotificationContent");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_15A90 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = sub_9B04();
    return (Class)sub_5C38(v3);
  }
  return result;
}

Class sub_5C38(uint64_t a1)
{
  sub_5A18();
  Class result = objc_getClass("UNNotificationRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    qword_15A98 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v3 = (void *)sub_9B2C();
    return (Class)+[AXAssetAndDataServer sharedInstance];
  }
  return result;
}

uint64_t sub_5D30(uint64_t a1)
{
  qword_15AA0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

void sub_5F34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5F54(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _icloudDataChanged:0];
}

void sub_61D8(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = VOTLogICloud();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_9B54();
    }

    if (!AXIsInternalInstall())
    {

      objc_end_catch();
      JUMPOUT(0x6194);
    }
    objc_exception_throw(v2);
  }
  _Unwind_Resume(exception_object);
}

void sub_64A0(_Unwind_Exception *exception_object, int a2)
{
  if (a2 == 1)
  {
    id v2 = objc_begin_catch(exception_object);
    uint64_t v3 = VOTLogActivities();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_9B54();
    }

    if (!AXIsInternalInstall())
    {

      objc_end_catch();
      JUMPOUT(0x645CLL);
    }
    objc_exception_throw(v2);
  }
  _Unwind_Resume(exception_object);
}

id sub_65AC(uint64_t a1)
{
  id v2 = +[NSUbiquitousKeyValueStore defaultStore];
  [v2 synchronize];

  uint64_t v3 = +[AXSettings sharedInstance];
  unsigned __int8 v4 = [v3 syncPronunciationsWithCloudKit];

  if ((v4 & 1) == 0) {
    [*(id *)(a1 + 32) _reconcilePronunciations];
  }
  v5 = *(void **)(a1 + 32);
  return [v5 _reconcileActivities];
}

void sub_7118(uint64_t a1)
{
  id v2 = +[AXSettings sharedInstance];
  uint64_t v3 = [v2 voiceOverActivities];
  id v4 = [v3 copy];

  v5 = +[NSKeyedArchiver archivedDataWithRootObject:v4 requiringSecureCoding:1 error:0];
  if ([v5 length])
  {
    v6 = +[NSUbiquitousKeyValueStore defaultStore];
    [v6 setData:v5 forKey:@"AXVoiceOverActivities"];

    v7 = +[NSUbiquitousKeyValueStore defaultStore];
    [v7 synchronize];
  }
  else
  {
    v7 = VOTLogActivities();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_9C24(v7);
    }
  }

  v8 = VOTLogActivities();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 134218243;
    uint64_t v11 = v9;
    __int16 v12 = 2113;
    id v13 = v4;
    _os_log_impl(&dword_0, v8, OS_LOG_TYPE_DEFAULT, "ICLOUD[%p]: Publishing data to iCloud %{private}@", (uint8_t *)&v10, 0x16u);
  }
}

id sub_7468(uint64_t a1)
{
  id v2 = +[AXSettings sharedInstance];
  unsigned __int8 v3 = [v2 syncPronunciationsWithCloudKit];

  if (v3) {
    return objc_msgSend(*(id *)(a1 + 32), "_syncToWatch", v24, v25);
  }
  id v4 = +[AXSettings sharedInstance];
  v5 = [v4 customPronunciationSubstitutions];
  id v6 = [v5 copy];

  v7 = +[NSKeyedArchiver archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
  if ([v7 length])
  {
    v8 = +[NSUbiquitousKeyValueStore defaultStore];
    [v8 setData:v7 forKey:@"AXCustomPronunciations"];

    uint64_t v9 = +[NSUbiquitousKeyValueStore defaultStore];
    [v9 synchronize];
  }
  else
  {
    v18 = +[AXSubsystemPronunciations sharedInstance];
    unsigned __int8 v19 = [v18 ignoreLogging];

    if (v19) {
      goto LABEL_5;
    }
    v20 = +[AXSubsystemPronunciations identifier];
    uint64_t v9 = AXLoggerForFacility();

    os_log_type_t v21 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v9, v21))
    {
      v22 = AXColorizeFormatLog();
      v23 = _AXStringForArgs();
      if (os_log_type_enabled(v9, v21))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v23;
        _os_log_impl(&dword_0, v9, v21, "%{public}@", buf, 0xCu);
      }
    }
  }

LABEL_5:
  int v10 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v11 = [v10 ignoreLogging];

  if ((v11 & 1) == 0)
  {
    __int16 v12 = +[AXSubsystemPronunciations identifier];
    id v13 = AXLoggerForFacility();

    os_log_type_t v14 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = AXColorizeFormatLog();
      uint64_t v24 = *(void *)(a1 + 32);
      id v25 = v6;
      v16 = _AXStringForArgs();
      if (os_log_type_enabled(v13, v14))
      {
        *(_DWORD *)buf = 138543362;
        v27 = v16;
        _os_log_impl(&dword_0, v13, v14, "%{public}@", buf, 0xCu);
      }
    }
  }

  return objc_msgSend(*(id *)(a1 + 32), "_syncToWatch", v24, v25);
}

void sub_7A38(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_7A60(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _customPronunciationsSettingsChanged];
}

void sub_7AA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _saveActivitiesToExternalsAndDelete:0];
}

id sub_8024(id a1, TTSAXResource *a2)
{
  return [(TTSAXResource *)a2 speechVoice];
}

void sub_8750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_87B0(uint64_t a1)
{
  uint64_t v2 = +[TTSSiriAssetManager installedAssetsForLanguage:0 voiceType:4];
  uint64_t v3 = +[TTSSiriAssetManager installedAssetsForLanguage:0 voiceType:1];
  id v4 = +[NSMutableArray array];
  v22 = (void *)v2;
  [v4 axSafelyAddObjectsFromArray:v2];
  os_log_type_t v21 = (void *)v3;
  [v4 axSafelyAddObjectsFromArray:v3];
  id v20 = objc_alloc_init((Class)SiriTTSDaemonSession);
  [v20 subscribeWithVoices:&__NSArray0__struct reply:&stru_105D0];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v5 = v4;
  id v6 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        int v10 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v10 isInstalled])
        {
          unsigned __int8 v11 = *(void **)(a1 + 32);
          __int16 v12 = [v10 identifier];
          LODWORD(v11) = [v11 containsObject:v12];

          if (v11)
          {
            id v13 = AXLogSpeechAssetDownload();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v28 = v10;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Asset is installed and is in selected voices: %@", buf, 0xCu);
            }

            os_log_type_t v14 = [v10 languages];
            v15 = [v10 identifier];
            v16 = [v14 firstObject];
            v17 = [v16 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

            [*(id *)(a1 + 40) informSiriAboutVoiceUsageForIdentifier:v15 forLanguage:v17 add:1];
          }
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v7);
  }

  v18 = +[AXSettings sharedInstance];
  [v18 setSiriAutoUpdateListInitialized:1];

  unsigned __int8 v19 = +[AXUIServiceManager sharedServiceManager];
  [v19 endTransactionWithIdentifier:*(void *)(a1 + 48) forService:*(void *)(a1 + 40)];
}

void sub_8A90(id a1, NSError *a2)
{
  uint64_t v2 = a2;
  uint64_t v3 = AXLogSpeechAssetDownload();
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if (v2)
  {
    if (v4)
    {
      int v8 = 138412290;
      uint64_t v9 = v2;
      id v5 = "AXAssetAndDataServer: Unable to reset voice subscriptions. %@";
      id v6 = v3;
      uint32_t v7 = 12;
LABEL_6:
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v8, v7);
    }
  }
  else if (v4)
  {
    LOWORD(v8) = 0;
    id v5 = "AXAssetAndDataServer: Reset voice subscriptions.";
    id v6 = v3;
    uint32_t v7 = 2;
    goto LABEL_6;
  }
}

void sub_8B6C(id a1, BOOL a2, NSError *a3)
{
  BOOL v3 = a2;
  BOOL v4 = a3;
  id v5 = AXLogCommon();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = +[NSNumber numberWithBool:v3];
    int v7 = 138412546;
    int v8 = v6;
    __int16 v9 = 2112;
    int v10 = v4;
    _os_log_impl(&dword_0, v5, OS_LOG_TYPE_DEFAULT, "Added sound detection to control center success: %@. error: %@.", (uint8_t *)&v7, 0x16u);
  }
}

void sub_8DE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

Class sub_963C(uint64_t a1)
{
  sub_9694();
  Class result = objc_getClass("CCSIconElementRequest");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_9C68();
  }
  qword_15AB0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_9694()
{
  v1[0] = 0;
  if (!qword_15AB8)
  {
    v1[1] = _NSConcreteStackBlock;
    v1[2] = 3221225472;
    v1[3] = sub_9790;
    v1[4] = &unk_10500;
    v1[5] = v1;
    long long v2 = off_10698;
    uint64_t v3 = 0;
    qword_15AB8 = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!qword_15AB8)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t sub_9790()
{
  uint64_t result = _sl_dlopen();
  qword_15AB8 = result;
  return result;
}

Class sub_9804(uint64_t a1)
{
  sub_9694();
  Class result = objc_getClass("CCSControlCenterService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_9C90();
  }
  qword_15AC0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

Class sub_985C(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_15AD0)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_99A0;
    v3[4] = &unk_10500;
    v3[5] = v3;
    long long v4 = off_106B0;
    uint64_t v5 = 0;
    qword_15AD0 = _sl_dlopen();
    if (!qword_15AD0)
    {
      abort_report_np();
LABEL_8:
      sub_9CB8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("CBSNVRamUtil");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_15AC8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_99A0()
{
  uint64_t result = _sl_dlopen();
  qword_15AD0 = result;
  return result;
}

void sub_9A14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_9A3C(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "TeachableMoments: Unable to send notification: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t sub_9AB4()
{
  uint64_t v0 = abort_report_np();
  return sub_9ADC(v0);
}

uint64_t sub_9ADC()
{
  uint64_t v0 = abort_report_np();
  return sub_9B04(v0);
}

uint64_t sub_9B04()
{
  uint64_t v0 = abort_report_np();
  return sub_9B2C(v0);
}

uint64_t sub_9B2C()
{
  uint64_t v0 = abort_report_np();
  return sub_9B54(v0);
}

void sub_9B54()
{
  sub_9A30();
  sub_9A14(&dword_0, v0, v1, "Exception decoding data: %@", v2, v3, v4, v5, v6);
}

void sub_9BBC()
{
  sub_9A30();
  sub_9A14(&dword_0, v0, v1, "%{public}@", v2, v3, v4, v5, v6);
}

void sub_9C24(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Created an empty length archive, not synching", v1, 2u);
}

void sub_9C68()
{
  uint64_t v0 = abort_report_np();
  sub_9C90(v0);
}

void sub_9C90()
{
  uint64_t v0 = abort_report_np();
  sub_9CB8(v0);
}

void sub_9CB8()
{
}

uint64_t AXCRemapLanguageCodeToFallbackIfNeccessary()
{
  return _AXCRemapLanguageCodeToFallbackIfNeccessary();
}

uint64_t AXColorizeFormatLog()
{
  return _AXColorizeFormatLog();
}

uint64_t AXIsInternalInstall()
{
  return _AXIsInternalInstall();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return _AXLanguageCanonicalFormToGeneralLanguage();
}

uint64_t AXLanguageConvertToCanonicalForm()
{
  return _AXLanguageConvertToCanonicalForm();
}

uint64_t AXLogCommon()
{
  return _AXLogCommon();
}

uint64_t AXLogSpeechAssetDownload()
{
  return _AXLogSpeechAssetDownload();
}

uint64_t AXLoggerForFacility()
{
  return _AXLoggerForFacility();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return _AXOSLogLevelFromAXLogLevel();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  return _CFAbsoluteTimeGetCurrent();
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t TTSGetComponentsInNamedSiriVoiceIdentifier()
{
  return _TTSGetComponentsInNamedSiriVoiceIdentifier();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return _UIAccessibilityIsSwitchControlRunning();
}

uint64_t VOTLogActivities()
{
  return _VOTLogActivities();
}

uint64_t VOTLogICloud()
{
  return _VOTLogICloud();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return __AXSAssistiveTouchEnabled();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return __AXSAssistiveTouchScannerEnabled();
}

uint64_t _AXSClarityUIEnabled()
{
  return __AXSClarityUIEnabled();
}

uint64_t _AXSHoverTextEnabled()
{
  return __AXSHoverTextEnabled();
}

uint64_t _AXSQuickSpeakEnabled()
{
  return __AXSQuickSpeakEnabled();
}

uint64_t _AXSSpeakThisEnabled()
{
  return __AXSSpeakThisEnabled();
}

uint64_t _AXSTripleClickContainsOption()
{
  return __AXSTripleClickContainsOption();
}

uint64_t _AXSTripleClickCopyOptions()
{
  return __AXSTripleClickCopyOptions();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return __AXSVoiceOverTouchEnabled();
}

uint64_t _AXSZoomSpeakUnderFingerEnabled()
{
  return __AXSZoomSpeakUnderFingerEnabled();
}

uint64_t _AXStringForArgs()
{
  return __AXStringForArgs();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsClass()
{
  return ___UIAccessibilityCastAsClass();
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

id objc_begin_catch(void *exc_buf)
{
  return _objc_begin_catch(exc_buf);
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

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_throw(id exception)
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
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

id objc_msgSend__cancelPronunciationSession(void *a1, const char *a2, ...)
{
  return [a1 _cancelPronunciationSession];
}

id objc_msgSend__customPronunciationsSettingsChanged(void *a1, const char *a2, ...)
{
  return [a1 _customPronunciationsSettingsChanged];
}

id objc_msgSend__handleStartupSound(void *a1, const char *a2, ...)
{
  return [a1 _handleStartupSound];
}

id objc_msgSend__monitoriCloudVoiceOverData(void *a1, const char *a2, ...)
{
  return [a1 _monitoriCloudVoiceOverData];
}

id objc_msgSend__pronunciationAudioLevel(void *a1, const char *a2, ...)
{
  return [a1 _pronunciationAudioLevel];
}

id objc_msgSend__reconcilePronunciations(void *a1, const char *a2, ...)
{
  return [a1 _reconcilePronunciations];
}

id objc_msgSend__stopPronunciationSession(void *a1, const char *a2, ...)
{
  return [a1 _stopPronunciationSession];
}

id objc_msgSend__syncToWatch(void *a1, const char *a2, ...)
{
  return [a1 _syncToWatch];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_backgroundAccessQueue(void *a1, const char *a2, ...)
{
  return [a1 backgroundAccessQueue];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_customPronunciationSubstitutions(void *a1, const char *a2, ...)
{
  return [a1 customPronunciationSubstitutions];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_defaultStore(void *a1, const char *a2, ...)
{
  return [a1 defaultStore];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_endSession(void *a1, const char *a2, ...)
{
  return [a1 endSession];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_footprint(void *a1, const char *a2, ...)
{
  return [a1 footprint];
}

id objc_msgSend_handleTeachableMomentsNotifications(void *a1, const char *a2, ...)
{
  return [a1 handleTeachableMomentsNotifications];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_ignoreLogging(void *a1, const char *a2, ...)
{
  return [a1 ignoreLogging];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isDefault(void *a1, const char *a2, ...)
{
  return [a1 isDefault];
}

id objc_msgSend_isInstalled(void *a1, const char *a2, ...)
{
  return [a1 isInstalled];
}

id objc_msgSend_language(void *a1, const char *a2, ...)
{
  return [a1 language];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_languages(void *a1, const char *a2, ...)
{
  return [a1 languages];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_letterFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 letterFeedbackEnabled];
}

id objc_msgSend_notificationCenter(void *a1, const char *a2, ...)
{
  return [a1 notificationCenter];
}

id objc_msgSend_orthography(void *a1, const char *a2, ...)
{
  return [a1 orthography];
}

id objc_msgSend_phonemeSuggestions(void *a1, const char *a2, ...)
{
  return [a1 phonemeSuggestions];
}

id objc_msgSend_phoneticFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 phoneticFeedbackEnabled];
}

id objc_msgSend_quickTypeWordFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 quickTypeWordFeedbackEnabled];
}

id objc_msgSend_selectedSpeechVoiceIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 selectedSpeechVoiceIdentifiers];
}

id objc_msgSend_sharedDatabase(void *a1, const char *a2, ...)
{
  return [a1 sharedDatabase];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedServiceManager(void *a1, const char *a2, ...)
{
  return [a1 sharedServiceManager];
}

id objc_msgSend_speakCorrectionsEnabled(void *a1, const char *a2, ...)
{
  return [a1 speakCorrectionsEnabled];
}

id objc_msgSend_standardUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 standardUserDefaults];
}

id objc_msgSend_startupSoundEnabled(void *a1, const char *a2, ...)
{
  return [a1 startupSoundEnabled];
}

id objc_msgSend_syncPronunciationsWithCloudKit(void *a1, const char *a2, ...)
{
  return [a1 syncPronunciationsWithCloudKit];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_systemLanguageID(void *a1, const char *a2, ...)
{
  return [a1 systemLanguageID];
}

id objc_msgSend_voiceOverActivities(void *a1, const char *a2, ...)
{
  return [a1 voiceOverActivities];
}

id objc_msgSend_voiceOverBrailleDisplays(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleDisplays];
}

id objc_msgSend_voiceOverBrailleGesturesEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceOverBrailleGesturesEnabled];
}

id objc_msgSend_voiceRefreshQueue(void *a1, const char *a2, ...)
{
  return [a1 voiceRefreshQueue];
}

id objc_msgSend_wordFeedbackEnabled(void *a1, const char *a2, ...)
{
  return [a1 wordFeedbackEnabled];
}

id objc_msgSend_writeNVRamVariable_value_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeNVRamVariable:value:");
}
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  CFStringRef v22;
  void *v23;
  uint8_t buf[4];
  void *v25;

  uint8_t v6 = objc_msgSend(a4, "firstObject", a3);
  int v7 = +[AXSubsystemPronunciations sharedInstance];
  int v8 = [v7 ignoreLogging];

  if ((v8 & 1) == 0)
  {
    uint64_t v9 = +[AXSubsystemPronunciations identifier];
    int v10 = AXLoggerForFacility();

    unsigned __int8 v11 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v10, v11))
    {
      __int16 v12 = AXColorizeFormatLog();
      os_log_type_t v21 = v6;
      id v13 = _AXStringForArgs();
      if (os_log_type_enabled(v10, v11))
      {
        *(_DWORD *)buf = 138543362;
        long long v25 = v13;
        _os_log_impl(&dword_0, v10, v11, "%{public}@", buf, 0xCu);
      }
    }
  }
  os_log_type_t v14 = objc_msgSend(v6, "phonemeSuggestions", v21);
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    v16 = +[NSMutableArray array];
  }
  v17 = v16;

  v18 = +[AXUIClientMessenger clientMessengerWithIdentifier:@"AXSpeechPronunciationClient"];
  v22 = @"results";
  long long v23 = v17;
  unsigned __int8 v19 = +[NSDictionary dictionaryWithObjects:&v23 forKeys:&v22 count:1];
  id v20 = +[AXAccessQueue backgroundAccessQueue];
  [v18 sendAsynchronousMessage:v19 withIdentifier:4 targetAccessQueue:v20 completion:&stru_10678];

  self->_isRecording = 0;
  [(AFDictationConnection *)self->_dictationConnection endSession];
}

- (void)dictationConnectionSpeechRecordingDidCancel:(id)a3
{
}

- (void)_handleFailureForSpeechPronunciation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[AXSubsystemPronunciations sharedInstance];
  unsigned __int8 v6 = [v5 ignoreLogging];

  if ((v6 & 1) == 0)
  {
    int v7 = +[AXSubsystemPronunciations identifier];
    int v8 = AXLoggerForFacility();

    os_log_type_t v9 = AXOSLogLevelFromAXLogLevel();
    if (os_log_type_enabled(v8, v9))
    {
      int v10 = AXColorizeFormatLog();
      id v16 = v4;
      BOOL isRecording = self->_isRecording;
      unsigned __int8 v11 = _AXStringForArgs();
      if (os_log_type_enabled(v8, v9))
      {
        *(_DWORD *)buf = 138543362;
        os_log_type_t v21 = v11;
        _os_log_impl(&dword_0, v8, v9, "%{public}@", buf, 0xCu);
      }
    }
  }
  if (self->_isRecording)
  {
    self->_BOOL isRecording = 0;
    if (v4)
    {
      __int16 v12 = [v4 description];
    }
    else
    {
      __int16 v12 = @"Error";
    }
    id v13 = +[AXUIClientMessenger clientMessengerWithIdentifier:@"AXSpeechPronunciationClient", v16, isRecording];
    CFStringRef v18 = @"error";
    unsigned __int8 v19 = v12;
    os_log_type_t v14 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
    v15 = +[AXAccessQueue backgroundAccessQueue];
    [v13 sendAsynchronousMessage:v14 withIdentifier:4 targetAccessQueue:v15 completion:0];

    [(AFDictationConnection *)self->_dictationConnection endSession];
  }
}

- (void)dictationConnection:(id)a3 speechRecordingDidFail:(id)a4
{
}

- (void)dictationConnection:(id)a3 speechRecognitionDidFail:(id)a4
{
}

- (void)_startPronunciationSession:(id)a3
{
  id v4 = a3;
  if (!self->_isRecording)
  {
    uint64_t v5 = (AFDictationConnection *)objc_alloc_init((Class)AFDictationConnection);
    dictationConnection = self->_dictationConnection;
    self->_dictationConnection = v5;

    [(AFDictationConnection *)self->_dictationConnection setDelegate:self];
    int v7 = objc_opt_new();
    [v7 setTranscriptionMode:3];
    int v8 = [v4 orthography];
    [v7 setOrthography:v8];

    id v9 = [objc_alloc((Class)AFSpeechRequestOptions) initWithActivationEvent:4];
    [v9 setIsEyesFree:1];
    [v9 setEndpointerOperationMode:3];
    int v10 = self->_dictationConnection;
    uint64_t v11 = [v4 language];
    [(AFDictationConnection *)v10 startDictationWithLanguageCode:v11 options:v7 speechOptions:v9];

    __int16 v12 = +[AXSubsystemPronunciations sharedInstance];
    LOBYTE(v11) = [v12 ignoreLogging];

    if ((v11 & 1) == 0)
    {
      id v13 = +[AXSubsystemPronunciations identifier];
      os_log_type_t v14 = AXLoggerForFacility();

      os_log_type_t v15 = AXOSLogLevelFromAXLogLevel();
      if (os_log_type_enabled(v14, v15))
      {
        id v16 = AXColorizeFormatLog();
        v17 = _AXStringForArgs();
        if (os_log_type_enabled(v14, v15))
        {
          *(_DWORD *)buf = 138543362;
          unsigned __int8 v19 = v17;
          _os_log_impl(&dword_0, v14, v15, "%{public}@", buf, 0xCu);
        }
      }
    }
    self->_BOOL isRecording = 1;
  }
}

- (OS_dispatch_queue)voiceRefreshQueue
{
  return self->_voiceRefreshQueue;
}

- (void)setVoiceRefreshQueue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceRefreshQueue, 0);
  objc_storeStrong((id *)&self->_assetService, 0);
  objc_storeStrong((id *)&self->_dictationConnection, 0);
  objc_storeStrong((id *)&self->_activitiesPusher, 0);
  objc_storeStrong((id *)&self->_pronunciationPusher, 0);
}

@end