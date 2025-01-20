void sub_2854(id a1)
{
  uint64_t vars8;

  qword_CFC0 = [[NNArticleIdentifierSyncManager alloc] initWithReadonlyResetKey:@"gizmoSavedResetDate" readwriteResetKey:@"companionSavedResetDate" readonlyKey:@"gizmoSavedStates" readwriteKey:@"companionSavedStates"];
  _objc_release_x1();
}

void sub_2908(id a1)
{
  qword_CFD0 = [[NNArticleIdentifierSyncManager alloc] initWithReadonlyResetKey:@"gizmoSeenResetDate" readwriteResetKey:@"companionSeenResetDate" readonlyKey:@"gizmoSeenStates" readwriteKey:@"companionSeenStates"];
  _objc_release_x1();
}

void sub_3F10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_3F2C(uint64_t a1, uint64_t a2)
{
  id result = objc_retainBlock(*(id *)(a2 + 40));
  *(void *)(a1 + 40) = result;
  return result;
}

void sub_3F58(uint64_t a1)
{
}

intptr_t sub_3F60(uint64_t a1, int a2, id a3)
{
  id v4 = objc_retainBlock(a3);
  uint64_t v5 = *(void *)(*(void *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v4;

  v7 = *(NSObject **)(a1 + 32);
  return dispatch_semaphore_signal(v7);
}

void sub_4258(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_4288(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_4298(uint64_t a1)
{
}

void sub_42A0(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
  id v4 = a2;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_4300(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_53EC(id a1)
{
  qword_CFE0 = (uint64_t)[objc_alloc((Class)NSUserDefaults) initWithSuiteName:@"com.apple.nanonews.sync"];
  _objc_release_x1();
}

void sub_5518(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class sub_5530(uint64_t a1)
{
  v3[0] = 0;
  if (!qword_CFF8)
  {
    v3[1] = _NSConcreteStackBlock;
    v3[2] = (void *)3221225472;
    v3[3] = sub_5674;
    v3[4] = &unk_84A8;
    v3[5] = v3;
    long long v4 = off_8490;
    uint64_t v5 = 0;
    qword_CFF8 = _sl_dlopen();
    if (!qword_CFF8)
    {
      abort_report_np();
LABEL_8:
      sub_56E8();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("NPSManager");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_CFF0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_5674()
{
  uint64_t result = _sl_dlopen();
  qword_CFF8 = result;
  return result;
}

void sub_56E8()
{
  CFBooleanRef v0 = (const __CFBoolean *)abort_report_np();
  CFBooleanGetValue(v0);
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t FCDefaultsDomainiCloudDataDestructionStickyKeys()
{
  return _FCDefaultsDomainiCloudDataDestructionStickyKeys();
}

uint64_t FCURLForAccountActionQueue()
{
  return _FCURLForAccountActionQueue();
}

uint64_t FCURLForNotificationDropbox()
{
  return _FCURLForNotificationDropbox();
}

uint64_t FCURLsForAppExternalFiles()
{
  return _FCURLsForAppExternalFiles();
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

void NSLog(NSString *format, ...)
{
}

uint64_t NSSDestroyDataContainersWithItems()
{
  return _NSSDestroyDataContainersWithItems();
}

uint64_t NSSDestroyUserDefaultsDataWithItems()
{
  return _NSSDestroyUserDefaultsDataWithItems();
}

uint64_t NSSTerminateNewsWithCompletion()
{
  return _NSSTerminateNewsWithCompletion();
}

uint64_t NewsCoreSensitiveUserDefaults()
{
  return _NewsCoreSensitiveUserDefaults();
}

uint64_t NewsCoreUserDefaults()
{
  return _NewsCoreUserDefaults();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return _objc_getClass(name);
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__cleanUpAppExternalFiles(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpAppExternalFiles];
}

id objc_msgSend__cleanUpDataContainers(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpDataContainers];
}

id objc_msgSend__cleanUpNewsCoreData(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpNewsCoreData];
}

id objc_msgSend__cleanUpWatchData(void *a1, const char *a2, ...)
{
  return [a1 _cleanUpWatchData];
}

id objc_msgSend__hasLocalData(void *a1, const char *a2, ...)
{
  return [a1 _hasLocalData];
}

id objc_msgSend__readonlyArticleStateLookup(void *a1, const char *a2, ...)
{
  return [a1 _readonlyArticleStateLookup];
}

id objc_msgSend__readonlyResetDate(void *a1, const char *a2, ...)
{
  return [a1 _readonlyResetDate];
}

id objc_msgSend__readwriteArticleStateLookup(void *a1, const char *a2, ...)
{
  return [a1 _readwriteArticleStateLookup];
}

id objc_msgSend__readwriteResetDate(void *a1, const char *a2, ...)
{
  return [a1 _readwriteResetDate];
}

id objc_msgSend__reloadWidgets(void *a1, const char *a2, ...)
{
  return [a1 _reloadWidgets];
}

id objc_msgSend__unregisterDeviceToken(void *a1, const char *a2, ...)
{
  return [a1 _unregisterDeviceToken];
}

id objc_msgSend_accountActionQueue(void *a1, const char *a2, ...)
{
  return [a1 accountActionQueue];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_articleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 articleIdentifiers];
}

id objc_msgSend_baseURLString(void *a1, const char *a2, ...)
{
  return [a1 baseURLString];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clearAllIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 clearAllIdentifiers];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentCalendar(void *a1, const char *a2, ...)
{
  return [a1 currentCalendar];
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return [a1 date];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deviceToken(void *a1, const char *a2, ...)
{
  return [a1 deviceToken];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localTimeZone(void *a1, const char *a2, ...)
{
  return [a1 localTimeZone];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_nanoNewsSyncDefaults(void *a1, const char *a2, ...)
{
  return [a1 nanoNewsSyncDefaults];
}

id objc_msgSend_notificationUserID(void *a1, const char *a2, ...)
{
  return [a1 notificationUserID];
}

id objc_msgSend_readLocalDataHint(void *a1, const char *a2, ...)
{
  return [a1 readLocalDataHint];
}

id objc_msgSend_readonlyArticleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 readonlyArticleIdentifiers];
}

id objc_msgSend_readonlyKey(void *a1, const char *a2, ...)
{
  return [a1 readonlyKey];
}

id objc_msgSend_readonlyResetKey(void *a1, const char *a2, ...)
{
  return [a1 readonlyResetKey];
}

id objc_msgSend_readwriteKey(void *a1, const char *a2, ...)
{
  return [a1 readwriteKey];
}

id objc_msgSend_readwriteResetKey(void *a1, const char *a2, ...)
{
  return [a1 readwriteResetKey];
}

id objc_msgSend_reloadTimeline(void *a1, const char *a2, ...)
{
  return [a1 reloadTimeline];
}

id objc_msgSend_resetSaved(void *a1, const char *a2, ...)
{
  return [a1 resetSaved];
}

id objc_msgSend_resetSeen(void *a1, const char *a2, ...)
{
  return [a1 resetSeen];
}

id objc_msgSend_savedManager(void *a1, const char *a2, ...)
{
  return [a1 savedManager];
}

id objc_msgSend_seenManager(void *a1, const char *a2, ...)
{
  return [a1 seenManager];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_storefrontID(void *a1, const char *a2, ...)
{
  return [a1 storefrontID];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizedKeys(void *a1, const char *a2, ...)
{
  return [a1 synchronizedKeys];
}

id objc_msgSend_timeIntervalSinceReferenceDate(void *a1, const char *a2, ...)
{
  return [a1 timeIntervalSinceReferenceDate];
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return [a1 type];
}

id objc_msgSend_unregisterDeviceWithUserID_deviceToken_storefrontID_deviceDigestMode_callbackQueue_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unregisterDeviceWithUserID:deviceToken:storefrontID:deviceDigestMode:callbackQueue:completion:");
}