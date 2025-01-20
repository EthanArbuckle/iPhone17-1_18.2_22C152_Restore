void sub_4540(uint64_t a1)
{
  id WeakRetained;
  uint64_t vars8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_4E74(uint64_t a1, void *a2)
{
  id v3 = a2;
  v4 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_A750(a1, (uint64_t)v3, v4);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_4F60;
  block[3] = &unk_10420;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 48);
  id v9 = v5;
  uint64_t v10 = v6;
  id v11 = v3;
  id v7 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

void sub_4F60(uint64_t a1)
{
  v1 = (void **)(a1 + 48);
  v2 = [*(id *)(a1 + 40) _localizedNameForRemoteApp:*(void *)(a1 + 48)];
  [*(v1 - 2) setName:v2];

  [*(v1 - 1) reloadSpecifier:*(v1 - 2)];
  id v3 = (void *)AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_A7DC(v1, v3);
  }
}

void sub_5208(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = +[AFPreferences sharedPreferences];
  [v3 setNanoPhraseSpotterEnabled:v2];
}

void sub_5614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_5630(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

void sub_57A8(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = +[AFPreferences sharedPreferences];
  [v3 setNanoRaiseToSpeakEnabled:v2];
}

void sub_5938(id a1, BOOL a2)
{
  BOOL v2 = a2;
  id v3 = +[AFPreferences sharedPreferences];
  [v3 setNanoCrownActivationEnabled:v2];
}

void sub_6208(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_6398(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_63B4(uint64_t a1, void *a2)
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = a2;
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if (objc_msgSend(v8, "supportsVoiceTrigger", (void)v10))
        {
          id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
          [WeakRetained setConnectedDeviceInfo:v8];

          goto LABEL_11;
        }
      }
      id v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

id sub_658C(uint64_t a1)
{
  return [*(id *)(a1 + 32) _refreshFooters];
}

void sub_6D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_6DBC(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 32);
  v10.receiver = *(id *)(a1 + 48);
  v10.super_class = (Class)AssistantBridgeTriggerPhrasesController;
  objc_msgSendSuper2(&v10, "tableView:didSelectRowAtIndexPath:", v5, v4);
  uint64_t v6 = +[AFPreferences sharedPreferences];
  [v6 setNanoPhraseSpotterEnabled:a2];

  if (a2)
  {
    if ([*(id *)(a1 + 56) isEqualToString:@"HEY_SIRI_ID"])
    {
      id v7 = +[AFPreferences sharedPreferences];
      [v7 setNanoVTPhraseType:0];
      uint64_t v8 = 1;
    }
    else
    {
      id result = [*(id *)(a1 + 56) isEqualToString:@"HS_JS_ID"];
      if (!result) {
        return result;
      }
      id v7 = +[AFPreferences sharedPreferences];
      [v7 setNanoVTPhraseType:1];
      uint64_t v8 = 2;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  return [*(id *)(a1 + 48) _updateFootersWithFooterType:v8];
}

void sub_6EB4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained reloadSpecifiers];
}

id sub_7D50(uint64_t a1)
{
  BOOL v2 = AFSiriLogContextConnection;
  if (os_log_type_enabled(AFSiriLogContextConnection, OS_LOG_TYPE_DEBUG)) {
    sub_A910(v2);
  }
  return [*(id *)(a1 + 32) reloadSpecifiers];
}

void sub_8BB4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void sub_9440(uint64_t a1)
{
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_9594;
  v10[3] = &unk_10590;
  id v11 = *(id *)(a1 + 40);
  id v12 = *(id *)(a1 + 48);
  BOOL v2 = objc_retainBlock(v10);
  id v3 = v2;
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v4 = objc_alloc_init(AssistantBridgeVoiceSelectionTask);
    uint64_t v5 = *(void *)(a1 + 32);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_9628;
    v7[3] = &unk_105B8;
    uint64_t v8 = v4;
    id v9 = v3;
    uint64_t v6 = v4;
    [(AssistantBridgeVoiceSelectionTask *)v6 presentVoiceSelectionIfNecessaryFromViewController:v5 completion:v7];
  }
  else
  {
    ((void (*)(void *, void))v2[2])(v2, 0);
  }
}

uint64_t sub_9594(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = +[AFPreferences sharedPreferences];
  [v4 setNanoAssistantEnabled:a2];

  uint64_t v5 = *(void *)(a1 + 32);
  if (v5) {
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  }
  uint64_t result = *(void *)(a1 + 40);
  if (result)
  {
    id v7 = *(uint64_t (**)(void))(result + 16);
    return v7();
  }
  return result;
}

id sub_9628(uint64_t a1, int a2, void *a3)
{
  if (a3)
  {
    id v6 = a3;
    id v7 = +[AFPreferences sharedPreferences];
    [v7 setNanoOutputVoice:v6];
  }
  if (a3) {
    uint64_t v8 = 1;
  }
  else {
    uint64_t v8 = a2 ^ 1u;
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  id v9 = *(void **)(a1 + 32);

  return [v9 logWhetherSiriWasEnabledAfterCompleted:v8];
}

uint64_t sub_96CC(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_97F8(uint64_t a1)
{
  id v6 = [*(id *)(a1 + 32) _loadedConfiguration];
  BOOL v2 = [*(id *)(a1 + 32) _languageCode];
  unsigned int v3 = [v6 requiresVoiceSelectionForRecognitionLanguage:v2];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3)
  {
    uint64_t v5 = [v4 _loadedViewController];
    [*(id *)(a1 + 40) presentViewController:v5 animated:1 completion:0];
  }
  else
  {
    [v4 _executePendingVoiceSelectionCompletionAndDismissViewControllerWithVoiceSelectionRequired:0 selectedVoice:0];
  }
}

void sub_9A64(uint64_t a1, void *a2)
{
  id v3 = a2;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_9B28;
  v6[3] = &unk_10658;
  uint64_t v4 = *(void **)(a1 + 40);
  v6[4] = *(void *)(a1 + 32);
  id v7 = v4;
  id v8 = v3;
  id v9 = *(id *)(a1 + 48);
  id v5 = v3;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v6);
}

void sub_9B28(uint64_t a1)
{
  id v2 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:1 target:*(void *)(a1 + 32) action:"_voiceSelectionCancelled"];
  id v3 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:0 action:0];
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2050000000;
  uint64_t v4 = (void *)qword_15510;
  uint64_t v14 = qword_15510;
  if (!qword_15510)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_9F90;
    v10[3] = &unk_106D0;
    void v10[4] = &v11;
    sub_9F90((uint64_t)v10);
    uint64_t v4 = (void *)v12[3];
  }
  id v5 = v4;
  _Block_object_dispose(&v11, 8);
  id v6 = objc_msgSend([v5 alloc], "initWithRecognitionLanguage:allowsRandomSelection:barButtonItemForContinue:customVoicePreviewer:delegate:", *(void *)(a1 + 40), objc_msgSend(*(id *)(a1 + 48), "voiceSelectionAllowsRandomSelection"), v3, 0, *(void *)(a1 + 32));
  id v7 = [v6 navigationItem];
  [v7 setLeftBarButtonItem:v2];
  [v7 setRightBarButtonItem:v3];
  id v8 = [objc_alloc((Class)UINavigationController) initWithRootViewController:v6];
  [*(id *)(a1 + 32) _setLoadedConfiguration:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) _setLoadedViewController:v8];
  uint64_t v9 = *(void *)(a1 + 56);
  if (v9) {
    (*(void (**)(void))(v9 + 16))();
  }
}

void sub_9CE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_9E88(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) _loadedConfiguration];
  id v2 = [v3 completionLoggingBlock];
  v2[2](v2, *(unsigned __int8 *)(a1 + 40));
}

Class sub_9F90(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_15518)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_A0BC;
    v3[4] = &unk_10708;
    v3[5] = v3;
    long long v4 = off_106F0;
    uint64_t v5 = 0;
    qword_15518 = _sl_dlopen();
  }
  if (!qword_15518) {
    sub_AB7C(v3);
  }
  if (v3[0]) {
    free(v3[0]);
  }
  Class result = objc_getClass("VTUIVoiceSelectionViewController");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_ABFC();
  }
  qword_15510 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_A0BC()
{
  uint64_t result = _sl_dlopen();
  qword_15518 = result;
  return result;
}

void sub_A188(id a1)
{
  uint64_t v1 = objc_opt_new();
  id v2 = (void *)qword_15520;
  qword_15520 = v1;

  [(id)qword_15520 setCountLimit:3];
  id v3 = (void *)qword_15520;

  [v3 setEvictsObjectsWhenApplicationEntersBackground:0];
}

void sub_A5BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_A5DC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_A5EC(uint64_t a1)
{
}

void sub_A5F4(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_A654()
{
  int v2 = 136315650;
  sub_61F4();
  sub_6208(&dword_0, v0, v1, "%s AssistantBridge: fetching app name via AppConduit: d:%@ b:%@", v2);
}

void sub_A6D0()
{
  v1[0] = 136315394;
  sub_61F4();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: _applicationSuggestionsSpecifierWithBundleId: %@", (uint8_t *)v1, 0x16u);
}

void sub_A750(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)id v3 = 136315650;
  *(void *)&v3[4] = "-[AssistantBridgeController _applicationSuggestionsSpecifierWithBundleId:device:]_block_invoke";
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = *(void *)(a1 + 32);
  *(_WORD *)&v3[22] = 2112;
  sub_6208(&dword_0, a2, a3, "%s AssistantBridge: AppConduit fetchApplicationOnPairedDevice for '%@' handler called: %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], a2);
}

void sub_A7DC(void **a1, void *a2)
{
  int v2 = *a1;
  id v3 = a2;
  id v4 = [v2 applicationName];
  v5[0] = 136315394;
  sub_61F4();
  _os_log_debug_impl(&dword_0, v3, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: appName: %@", (uint8_t *)v5, 0x16u);
}

void sub_A88C(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AssistantBridgeAppDetailController init]";
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "%s AssistantBridge: failed to register for Suggestions settings change notifications.", (uint8_t *)&v1, 0xCu);
}

void sub_A910(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AssistantBridgeAppDetailController init]_block_invoke";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: received Suggestions settings changed notification", (uint8_t *)&v1, 0xCu);
}

void sub_A994()
{
  v1[0] = 136315394;
  sub_61F4();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: inAppShowSiriSuggestionsEnabled: %@", (uint8_t *)v1, 0x16u);
}

void sub_AA14()
{
  int v2 = 136315650;
  sub_8B90();
  sub_8BB4(&dword_0, v0, v1, "%s AssistantBridge: setInAppShowSiriSuggestionsEnabled: %@ %d", v2);
}

void sub_AA88()
{
  v1[0] = 136315394;
  sub_61F4();
  _os_log_debug_impl(&dword_0, v0, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: appHasCustomSettingsWithBundleId: %@", (uint8_t *)v1, 0x16u);
}

void sub_AB08()
{
  int v2 = 136315650;
  sub_8B90();
  sub_8BB4(&dword_0, v0, v1, "%s AssistantBridge: setAppHasCustomSettingsWithBundleId: %@ %d", v2);
}

void sub_AB7C(void *a1)
{
  int v2 = +[NSAssertionHandler currentHandler];
  id v3 = +[NSString stringWithUTF8String:"void *VoiceTriggerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"AssistantBridgeVoiceSelectionTask.m", 17, @"%s", *a1);

  __break(1u);
}

void sub_ABFC()
{
  uint64_t v0 = +[NSAssertionHandler currentHandler];
  os_log_t v1 = +[NSString stringWithUTF8String:"Class getVTUIVoiceSelectionViewControllerClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"AssistantBridgeVoiceSelectionTask.m", 18, @"Unable to find class %s", "VTUIVoiceSelectionViewController");

  __break(1u);
}

void sub_AC78(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  id v3 = "-[AssistantBridgeAppCell blankIcon]";
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: blankIcon returning: %@", (uint8_t *)&v2, 0x16u);
}

void sub_AD04(os_log_t log)
{
  int v1 = 136315138;
  int v2 = "-[AssistantBridgeAppCell blankIcon]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: blankIcon", (uint8_t *)&v1, 0xCu);
}

void sub_AD88(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)a1 + 40);
  int v3 = 136315394;
  __int16 v4 = "-[AssistantBridgeAppCell getLazyIcon]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: getLazyIcon returning: %@", (uint8_t *)&v3, 0x16u);
}

void sub_AE1C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[AssistantBridgeAppCell getLazyIcon]";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "%s AssistantBridge: getLazyIcon", (uint8_t *)&v1, 0xCu);
}

uint64_t AFAssistantRestricted()
{
  return _AFAssistantRestricted();
}

uint64_t AFGryphonAssetsExistForLanguage()
{
  return _AFGryphonAssetsExistForLanguage();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return _CFPreferencesCopyAppValue(key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void free(void *a1)
{
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__appName(void *a1, const char *a2, ...)
{
  return [a1 _appName];
}

id objc_msgSend__bundleId(void *a1, const char *a2, ...)
{
  return [a1 _bundleId];
}

id objc_msgSend__dismissLoadedViewController(void *a1, const char *a2, ...)
{
  return [a1 _dismissLoadedViewController];
}

id objc_msgSend__flowConfigurationProvider(void *a1, const char *a2, ...)
{
  return [a1 _flowConfigurationProvider];
}

id objc_msgSend__iconCache(void *a1, const char *a2, ...)
{
  return [a1 _iconCache];
}

id objc_msgSend__languageCode(void *a1, const char *a2, ...)
{
  return [a1 _languageCode];
}

id objc_msgSend__loadedConfiguration(void *a1, const char *a2, ...)
{
  return [a1 _loadedConfiguration];
}

id objc_msgSend__loadedViewController(void *a1, const char *a2, ...)
{
  return [a1 _loadedViewController];
}

id objc_msgSend__pendingVoiceSelectionCompletion(void *a1, const char *a2, ...)
{
  return [a1 _pendingVoiceSelectionCompletion];
}

id objc_msgSend__setupPhraseChoiceSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 _setupPhraseChoiceSpecifiers];
}

id objc_msgSend__updateAskSiriFooter(void *a1, const char *a2, ...)
{
  return [a1 _updateAskSiriFooter];
}

id objc_msgSend__updateSpecifiersFromPreferences(void *a1, const char *a2, ...)
{
  return [a1 _updateSpecifiersFromPreferences];
}

id objc_msgSend_applicationName(void *a1, const char *a2, ...)
{
  return [a1 applicationName];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_completionLoggingBlock(void *a1, const char *a2, ...)
{
  return [a1 completionLoggingBlock];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_digitalCrownEnabled(void *a1, const char *a2, ...)
{
  return [a1 digitalCrownEnabled];
}

id objc_msgSend_displayScale(void *a1, const char *a2, ...)
{
  return [a1 displayScale];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_getLazyIconID(void *a1, const char *a2, ...)
{
  return [a1 getLazyIconID];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_imageFlippedForRightToLeftLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 imageFlippedForRightToLeftLayoutDirection];
}

id objc_msgSend_isCompactVoiceTriggerAvailable(void *a1, const char *a2, ...)
{
  return [a1 isCompactVoiceTriggerAvailable];
}

id objc_msgSend_languageCode(void *a1, const char *a2, ...)
{
  return [a1 languageCode];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_nanoAlwaysShowRecognizedSpeech(void *a1, const char *a2, ...)
{
  return [a1 nanoAlwaysShowRecognizedSpeech];
}

id objc_msgSend_nanoAssistantEnabled(void *a1, const char *a2, ...)
{
  return [a1 nanoAssistantEnabled];
}

id objc_msgSend_nanoCrownActivationEnabled(void *a1, const char *a2, ...)
{
  return [a1 nanoCrownActivationEnabled];
}

id objc_msgSend_nanoDictationEnabled(void *a1, const char *a2, ...)
{
  return [a1 nanoDictationEnabled];
}

id objc_msgSend_nanoJSSupported(void *a1, const char *a2, ...)
{
  return [a1 nanoJSSupported];
}

id objc_msgSend_nanoLanguageCode(void *a1, const char *a2, ...)
{
  return [a1 nanoLanguageCode];
}

id objc_msgSend_nanoMessageWithoutConfirmationEnabled(void *a1, const char *a2, ...)
{
  return [a1 nanoMessageWithoutConfirmationEnabled];
}

id objc_msgSend_nanoPhraseSpotterEnabled(void *a1, const char *a2, ...)
{
  return [a1 nanoPhraseSpotterEnabled];
}

id objc_msgSend_nanoRaiseToSpeakEnabled(void *a1, const char *a2, ...)
{
  return [a1 nanoRaiseToSpeakEnabled];
}

id objc_msgSend_nanoSiriResponseShouldAlwaysPrint(void *a1, const char *a2, ...)
{
  return [a1 nanoSiriResponseShouldAlwaysPrint];
}

id objc_msgSend_nanoTTSSpeakerVolume(void *a1, const char *a2, ...)
{
  return [a1 nanoTTSSpeakerVolume];
}

id objc_msgSend_nanoUseDeviceSpeakerForTTS(void *a1, const char *a2, ...)
{
  return [a1 nanoUseDeviceSpeakerForTTS];
}

id objc_msgSend_nanoVTPhraseType(void *a1, const char *a2, ...)
{
  return [a1 nanoVTPhraseType];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_preferredLanguages(void *a1, const char *a2, ...)
{
  return [a1 preferredLanguages];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_raiseToSpeakEnabled(void *a1, const char *a2, ...)
{
  return [a1 raiseToSpeakEnabled];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sharedDeviceConnection(void *a1, const char *a2, ...)
{
  return [a1 sharedDeviceConnection];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_supportsJustSiri(void *a1, const char *a2, ...)
{
  return [a1 supportsJustSiri];
}

id objc_msgSend_supportsVoiceTrigger(void *a1, const char *a2, ...)
{
  return [a1 supportsVoiceTrigger];
}

id objc_msgSend_traitCollection(void *a1, const char *a2, ...)
{
  return [a1 traitCollection];
}

id objc_msgSend_triggerPhraseChoiceHS(void *a1, const char *a2, ...)
{
  return [a1 triggerPhraseChoiceHS];
}

id objc_msgSend_triggerPhraseChoiceHSJS(void *a1, const char *a2, ...)
{
  return [a1 triggerPhraseChoiceHSJS];
}

id objc_msgSend_triggerPhrasesGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 triggerPhrasesGroupSpecifier];
}

id objc_msgSend_voiceSelectionAllowsRandomSelection(void *a1, const char *a2, ...)
{
  return [a1 voiceSelectionAllowsRandomSelection];
}

id objc_msgSend_voiceTriggerEnabled(void *a1, const char *a2, ...)
{
  return [a1 voiceTriggerEnabled];
}