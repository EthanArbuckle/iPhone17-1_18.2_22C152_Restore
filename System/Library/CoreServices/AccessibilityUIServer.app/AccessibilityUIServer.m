void sub_100002F50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002F6C(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002F7C(uint64_t a1)
{
}

uint64_t sub_100002F84(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = [UIApp _accessibilityAllWindowsOnlyVisibleWindows:1];

  return _objc_release_x1();
}

uint64_t sub_100002FDC(uint64_t a1)
{
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = +[UIWindow allWindowsIncludingInternalWindows:1 onlyVisibleWindows:1];

  return _objc_release_x1();
}

void sub_100003034(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 _accessibilityIsIsolatedWindow]
    && ([v3 accessibilityElementsHidden] & 1) == 0)
  {
    [*(id *)(a1 + 32) addObject:v3];
  }
}

void sub_100003688(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    id v3 = AXLogUI();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_1000046CC();
    }
  }
}

void sub_1000036E0(id *a1, void *a2)
{
  id v3 = a2;
  v4 = AXLogUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_100004734();
  }

  if (v3 && (uint64_t)[a1[4] preferredSceneAttemptCount] <= 4)
  {
    objc_msgSend(a1[4], "setPreferredSceneAttemptCount:", (char *)objc_msgSend(a1[4], "preferredSceneAttemptCount") + 1);
    objc_initWeak(&location, a1[4]);
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10000383C;
    block[3] = &unk_100008328;
    objc_copyWeak(v9, &location);
    id v7 = a1[5];
    v9[1] = a1[7];
    id v8 = a1[6];
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void sub_10000383C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained requestSceneForSceneClientIdentifier:*(void *)(a1 + 32) scenePreferredLevel:*(void *)(a1 + 40) spatialConfiguration:*(double *)(a1 + 56)];
}

void sub_100003890(id *a1, void *a2)
{
  id v3 = a2;
  v4 = AXLogUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_10000479C();
  }

  if (v3 && (uint64_t)[a1[4] defaultSceneAttemptCount] <= 4)
  {
    objc_msgSend(a1[4], "setDefaultSceneAttemptCount:", (char *)objc_msgSend(a1[4], "defaultSceneAttemptCount") + 1);
    objc_initWeak(&location, a1[4]);
    dispatch_time_t v5 = dispatch_time(0, 500000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000039EC;
    block[3] = &unk_100008328;
    objc_copyWeak(v9, &location);
    id v7 = a1[5];
    v9[1] = a1[7];
    id v8 = a1[6];
    dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, block);

    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

void sub_1000039EC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained requestSceneForSceneClientIdentifier:*(void *)(a1 + 32) scenePreferredLevel:*(void *)(a1 + 40) spatialConfiguration:*(double *)(a1 + 56)];
}

void sub_100003BC4(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = AXLogUI();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100004848();
  }
}

void sub_100003C58(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t start(int a1, char **a2)
{
  if (_set_user_dir_suffix())
  {
    id v4 = NSTemporaryDirectory();
  }
  else
  {
    dispatch_time_t v5 = AXLogUI();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1000048B0(v5);
    }
  }
  id v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  id v8 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = UIApplicationMain(a1, a2, v10, v8);

  return v11;
}

void sub_1000041A0(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = AXLogUI();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    dispatch_time_t v5 = +[NSNumber numberWithDouble:*(double *)(a1 + 32)];
    int v6 = 138412290;
    id v7 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Setting sceneLevel: %@", (uint8_t *)&v6, 0xCu);
  }
  [v3 setPreferredLevel:*(double *)(a1 + 32)];
}

uint64_t sub_100004698()
{
  return _swift_deallocClassInstance(v0, 16, 7);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return self;
}

void sub_1000046CC()
{
  sub_100003C74();
  sub_100003C58((void *)&_mh_execute_header, v0, v1, "activateSceneSessionForRequest error: %@", v2, v3, v4, v5, v6);
}

void sub_100004734()
{
  sub_100003C74();
  sub_100003C58((void *)&_mh_execute_header, v0, v1, "PreferredLevel requestSceneSessionActivation error: %@", v2, v3, v4, v5, v6);
}

void sub_10000479C()
{
  sub_100003C74();
  sub_100003C58((void *)&_mh_execute_header, v0, v1, "Default requestSceneSessionActivation error: %@", v2, v3, v4, v5, v6);
}

void sub_100004804(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Destroying scene pointer is nil", v1, 2u);
}

void sub_100004848()
{
  sub_100003C74();
  sub_100003C58((void *)&_mh_execute_header, v0, v1, "requestSceneSessionDestruction error: %@", v2, v3, v4, v5, v6);
}

void sub_1000048B0(NSObject *a1)
{
  int v2 = *__error();
  uint64_t v3 = __error();
  uint64_t v4 = strerror(*v3);
  v5[0] = 67109378;
  v5[1] = v2;
  __int16 v6 = 2080;
  id v7 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to set temporary directory for AccessibilityUIServer (%d): %s", (uint8_t *)v5, 0x12u);
}

void sub_100004958(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unexpected type for connected scene: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t AXDeviceIsAudioAccessory()
{
  return _AXDeviceIsAudioAccessory();
}

uint64_t AXInPreboardScenario()
{
  return _AXInPreboardScenario();
}

uint64_t AXLogUI()
{
  return _AXLogUI();
}

uint64_t AXPerformSafeBlock()
{
  return _AXPerformSafeBlock();
}

uint64_t BKSWatchdogGetIsAlive()
{
  return _BKSWatchdogGetIsAlive();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return _NSTemporaryDirectory();
}

int UIApplicationMain(int argc, char **argv, NSString *principalClassName, NSString *delegateClassName)
{
  return _UIApplicationMain(argc, argv, principalClassName, delegateClassName);
}

uint64_t _AXSLiveSpeechEnabled()
{
  return __AXSLiveSpeechEnabled();
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

int *__error(void)
{
  return ___error();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void abort(void)
{
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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

char *__cdecl strerror(int __errnum)
{
  return _strerror(__errnum);
}

id objc_msgSend__FBSScene(void *a1, const char *a2, ...)
{
  return [a1 _FBSScene];
}

id objc_msgSend__accessibilityIsIsolatedWindow(void *a1, const char *a2, ...)
{
  return [a1 _accessibilityIsIsolatedWindow];
}

id objc_msgSend__applicationDidFinishLaunching(void *a1, const char *a2, ...)
{
  return [a1 _applicationDidFinishLaunching];
}

id objc_msgSend__isEmbeddedScreen(void *a1, const char *a2, ...)
{
  return [a1 _isEmbeddedScreen];
}

id objc_msgSend__startLaunchAngel(void *a1, const char *a2, ...)
{
  return [a1 _startLaunchAngel];
}

id objc_msgSend_accessibilityElementsHidden(void *a1, const char *a2, ...)
{
  return [a1 accessibilityElementsHidden];
}

id objc_msgSend_activityType(void *a1, const char *a2, ...)
{
  return [a1 activityType];
}

id objc_msgSend_anyObject(void *a1, const char *a2, ...)
{
  return [a1 anyObject];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_defaultSceneAttemptCount(void *a1, const char *a2, ...)
{
  return [a1 defaultSceneAttemptCount];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_displayIdentity(void *a1, const char *a2, ...)
{
  return [a1 displayIdentity];
}

id objc_msgSend_displayManager(void *a1, const char *a2, ...)
{
  return [a1 displayManager];
}

id objc_msgSend_floatValue(void *a1, const char *a2, ...)
{
  return [a1 floatValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_preferredSceneAttemptCount(void *a1, const char *a2, ...)
{
  return [a1 preferredSceneAttemptCount];
}

id objc_msgSend_role(void *a1, const char *a2, ...)
{
  return [a1 role];
}

id objc_msgSend_rootIdentity(void *a1, const char *a2, ...)
{
  return [a1 rootIdentity];
}

id objc_msgSend_screen(void *a1, const char *a2, ...)
{
  return [a1 screen];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_settings(void *a1, const char *a2, ...)
{
  return [a1 settings];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_sharedEventManager(void *a1, const char *a2, ...)
{
  return [a1 sharedEventManager];
}

id objc_msgSend_sharedServiceManager(void *a1, const char *a2, ...)
{
  return [a1 sharedServiceManager];
}

id objc_msgSend_supportsMultipleScenes(void *a1, const char *a2, ...)
{
  return [a1 supportsMultipleScenes];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_uiSceneSessionRole(void *a1, const char *a2, ...)
{
  return [a1 uiSceneSessionRole];
}

id objc_msgSend_userActivities(void *a1, const char *a2, ...)
{
  return [a1 userActivities];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}