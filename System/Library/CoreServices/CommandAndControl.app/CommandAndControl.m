void sub_100001A4C(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  void block[5];

  v2 = +[CACLanguageAssetManager sharedManager];
  [v2 startDownloadOfLanguage:*(void *)(a1 + 32)];

  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001B14;
  block[3] = &unk_100004230;
  block[4] = *(void *)(a1 + 40);
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
  *(unsigned char *)(*(void *)(a1 + 40) + 24) = 1;
}

void sub_100001B14(uint64_t a1)
{
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 25))
  {
    v2 = +[CACDisplayManager sharedManager];
    v3 = +[CACLocaleUtilities localizedUIStringForKey:@"CommonStrings.Cancel"];
    [v2 displayMessageString:v3 type:0];

    *(unsigned char *)(*(void *)(a1 + 32) + 25) = 1;
  }
}

void sub_100001BA4(id a1, id a2)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_1000042D8);
}

void sub_100001BE8(id a1)
{
  id v1 = +[CACPreferences sharedPreferences];
  [v1 setCommandAndControlEnabled:0];
}

void sub_100001C34(id a1, id a2)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_100004318);
}

void sub_100001C78(id a1)
{
  id v1 = +[CACPreferences sharedPreferences];
  [v1 setCommandAndControlEnabled:0];
}

void sub_100001CC4(id a1, id a2)
{
  dispatch_time_t v2 = dispatch_time(0, 500000000);

  dispatch_after(v2, (dispatch_queue_t)&_dispatch_main_q, &stru_100004358);
}

void sub_100001D08(id a1)
{
  id v1 = +[AXSpringBoardServer server];
  char v2 = objc_opt_respondsToSelector();

  if (v2)
  {
    v3 = +[AXSpringBoardServer server];
    [v3 performSelector:"openCommandAndControlSettings" withObject:0 afterDelay:0.0];
  }
  id v4 = +[CACPreferences sharedPreferences];
  [v4 setCommandAndControlEnabled:0];
}

void sub_100002070()
{
}

uint64_t start(int a1, char **a2)
{
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (NSString *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = UIApplicationMain(a1, a2, v6, v8);

  return v9;
}

void sub_1000021FC(id a1)
{
  id v1 = +[NSNotificationCenter defaultCenter];
  [v1 postNotificationName:@"kCACRepostEnabledStatusNotification" object:0];
}

void sub_100002528(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type for scene: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXDeviceSupportsMedina()
{
  return _AXDeviceSupportsMedina();
}

uint64_t CACLogAssetDownload()
{
  return _CACLogAssetDownload();
}

uint64_t CACLogGeneral()
{
  return _CACLogGeneral();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

uint64_t MGGetBoolAnswer()
{
  return _MGGetBoolAnswer();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return __AXSCommandAndControlCarPlayEnabled();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return __AXSCommandAndControlEnabled();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

{
}

{
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

void objc_release(id a1)
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

id objc_msgSend_bestLocaleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bestLocaleIdentifier];
}

id objc_msgSend_bundleId(void *a1, const char *a2, ...)
{
  return [a1 bundleId];
}

id objc_msgSend_checkNecessaryLanguagePack(void *a1, const char *a2, ...)
{
  return [a1 checkNecessaryLanguagePack];
}

id objc_msgSend_currentApplications(void *a1, const char *a2, ...)
{
  return [a1 currentApplications];
}

id objc_msgSend_currentSession(void *a1, const char *a2, ...)
{
  return [a1 currentSession];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_didShowOnboarding(void *a1, const char *a2, ...)
{
  return [a1 didShowOnboarding];
}

id objc_msgSend_didUpdateOrientation(void *a1, const char *a2, ...)
{
  return [a1 didUpdateOrientation];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return [a1 displayIdentity];
}

id objc_msgSend_displayReadyToUseWithLanguageMessage(void *a1, const char *a2, ...)
{
  return [a1 displayReadyToUseWithLanguageMessage];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasStartupActivatedCompletedOnce(void *a1, const char *a2, ...)
{
  return [a1 hasStartupActivatedCompletedOnce];
}

id objc_msgSend_initAndWaitUntilSessionUpdated(void *a1, const char *a2, ...)
{
  return [a1 initAndWaitUntilSessionUpdated];
}

id objc_msgSend_installationStatus(void *a1, const char *a2, ...)
{
  return [a1 installationStatus];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_registerForCallback(void *a1, const char *a2, ...)
{
  return [a1 registerForCallback];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return [a1 run];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_server(void *a1, const char *a2, ...)
{
  return [a1 server];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sharedCACSpokenCommandManager(void *a1, const char *a2, ...)
{
  return [a1 sharedCACSpokenCommandManager];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_startCommandAndControl(void *a1, const char *a2, ...)
{
  return [a1 startCommandAndControl];
}

id objc_msgSend_supportedLocaleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 supportedLocaleIdentifiers];
}

id objc_msgSend_systemApplication(void *a1, const char *a2, ...)
{
  return [a1 systemApplication];
}

id objc_msgSend_systemWideElement(void *a1, const char *a2, ...)
{
  return [a1 systemWideElement];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_willTerminate(void *a1, const char *a2, ...)
{
  return [a1 willTerminate];
}