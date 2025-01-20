int main(int argc, const char **argv, const char **envp)
{
  void *v3;
  void *v4;

  v3 = objc_opt_new();
  v4 = +[NSXPCListener serviceListener];
  [v4 setDelegate:v3];
  [v4 resume];

  return 0;
}

id os_log_xpcAppRemoval()
{
  if (qword_10000C9B0 != -1) {
    dispatch_once(&qword_10000C9B0, &stru_100008280);
  }
  v0 = (void *)qword_10000C9A8;
  return v0;
}

void sub_1000050C8(id a1)
{
  qword_10000C9A8 = (uint64_t)os_log_create((const char *)[@"com.apple.weather" UTF8String], "XPCAppRemovalService");
  _objc_release_x1();
}

void sub_1000052B8(uint64_t a1)
{
  v2 = *(void **)(a1 + 32);
  v3 = WDWeatherLibraryDirectory();
  v4 = [v2 deleteAllFilesInDirectory:v3];

  if (v4)
  {
    v5 = os_log_xpcAppRemoval();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100006840((uint64_t)v4, v5);
    }
  }
  v6 = os_log_xpcAppRemoval();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Completed AppRemoval Successfully.", v7, 2u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100005B90(id a1)
{
  id v3 = +[NSFileManager defaultManager];
  uint64_t v1 = [v3 containerURLForSecurityApplicationGroupIdentifier:@"group.com.apple.weather"];
  v2 = (void *)qword_10000C9B8;
  qword_10000C9B8 = v1;
}

void sub_1000063DC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t variable initialization expression of DaemonDecommissioner.decommissioningManager()
{
  return sub_100006A20();
}

void DaemonDecommissioner.decomissionDaemon(with:)(uint64_t a1, uint64_t a2)
{
  sub_100006A60();
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = a1;
  *(void *)(v4 + 24) = a2;
  swift_retain();
  v5 = (void *)sub_100006A40();
  sub_100006A50();
  swift_release();
  swift_release();
  swift_release();
}

uint64_t sub_100006514()
{
  return sub_100006A10();
}

uint64_t sub_10000654C()
{
  swift_release();
  return _swift_deallocObject(v0, 32, 7);
}

uint64_t sub_100006584()
{
  return (*(uint64_t (**)(void))(v0 + 16))();
}

id DaemonDecommissioner.__allocating_init()()
{
  id v1 = objc_allocWithZone(v0);
  return [v1 init];
}

id DaemonDecommissioner.init()()
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v2 = OBJC_IVAR___WeatherDaemonDecommissioner_decommissioningManager;
  sub_100006A30();
  swift_allocObject();
  id v3 = v0;
  *(void *)&v0[v2] = sub_100006A20();

  v5.receiver = v3;
  v5.super_class = ObjectType;
  return objc_msgSendSuper2(&v5, "init");
}

id DaemonDecommissioner.__deallocating_deinit()
{
  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, "dealloc");
}

uint64_t type metadata accessor for DaemonDecommissioner()
{
  return self;
}

uint64_t sub_100006790()
{
  _Block_release(*(const void **)(v0 + 16));
  return _swift_deallocObject(v0, 24, 7);
}

uint64_t sub_1000067C8()
{
  return (*(uint64_t (**)(void))(*(void *)(v0 + 16) + 16))();
}

void sub_1000067D8()
{
  sub_1000063F8();
  sub_1000063DC((void *)&_mh_execute_header, v0, v1, "Error removing user defaults: %@", v2, v3, v4, v5, v6);
}

void sub_100006840(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = WDWeatherLibraryDirectory();
  uint64_t v5 = [v4 path];
  sub_1000063F8();
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error removing files from directory: %@. Error=%@", v6, 0x16u);
}

void sub_1000068FC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GroupContainer URL was nil.  Aborting.", v1, 2u);
}

void sub_100006940()
{
  sub_1000063F8();
  sub_1000063DC((void *)&_mh_execute_header, v0, v1, "Error removing values from sensitive defaults. error=%@", v2, v3, v4, v5, v6);
}

void sub_1000069A8()
{
  sub_1000063F8();
  sub_1000063DC((void *)&_mh_execute_header, v0, v1, "Error removing values from GroupContainer. error=%@", v2, v3, v4, v5, v6);
}

uint64_t sub_100006A10()
{
  return DaemonDecommissioningManager.decommission()();
}

uint64_t sub_100006A20()
{
  return DaemonDecommissioningManager.init()();
}

uint64_t sub_100006A30()
{
  return type metadata accessor for DaemonDecommissioningManager();
}

uint64_t sub_100006A40()
{
  return zalgo.getter();
}

uint64_t sub_100006A50()
{
  return Promise.then<A>(on:closure:)();
}

uint64_t sub_100006A60()
{
  return firstly<A>(closure:)();
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesCopyKeyList(applicationID, userName, hostName);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return _CFPreferencesSynchronize(applicationID, userName, hostName);
}

uint64_t WDWeatherLibraryDirectory()
{
  return _WDWeatherLibraryDirectory();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return __Block_copy(aBlock);
}

void _Block_release(const void *aBlock)
{
}

uint64_t _CFPreferencesCopyKeyListWithContainer()
{
  return __CFPreferencesCopyKeyListWithContainer();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return __CFPreferencesSetValueWithContainer();
}

uint64_t _CFPreferencesSynchronizeWithContainer()
{
  return __CFPreferencesSynchronizeWithContainer();
}

uint64_t _LSAppRemovalServiceXPCInterface()
{
  return __LSAppRemovalServiceXPCInterface();
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

void objc_enumerationMutation(id obj)
{
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return _[a1 a2];
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t swift_allocObject()
{
  return _swift_allocObject();
}

uint64_t swift_getObjectType()
{
  return _swift_getObjectType();
}

uint64_t swift_release()
{
  return _swift_release();
}

uint64_t swift_retain()
{
  return _swift_retain();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return _[a1 UTF8String];
}

id objc_msgSend_UUIDString(void *a1, const char *a2, ...)
{
  return _[a1 UUIDString];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return _[a1 allKeys];
}

id objc_msgSend_appContainerPath(void *a1, const char *a2, ...)
{
  return _[a1 appContainerPath];
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_decomissionDaemonWithCompletion_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "decomissionDaemonWithCompletion:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return _[a1 defaultManager];
}

id objc_msgSend_deleteAllFilesInDirectory_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllFilesInDirectory:");
}

id objc_msgSend_deleteAllSavedUserActivitiesWithCompletionHandler_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "deleteAllSavedUserActivitiesWithCompletionHandler:");
}

id objc_msgSend_deleteAllUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 deleteAllUserDefaults];
}

id objc_msgSend_deleteNanoUserDefaults(void *a1, const char *a2, ...)
{
  return _[a1 deleteNanoUserDefaults];
}

id objc_msgSend_dictionaryRepresentation(void *a1, const char *a2, ...)
{
  return _[a1 dictionaryRepresentation];
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_enumeratorAtPath_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "enumeratorAtPath:");
}

id objc_msgSend_errorWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "errorWithDomain:code:userInfo:");
}

id objc_msgSend_getPairedDevices(void *a1, const char *a2, ...)
{
  return _[a1 getPairedDevices];
}

id objc_msgSend_initWithDomain_pairedDevice_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "initWithDomain:pairedDevice:");
}

id objc_msgSend_nextObject(void *a1, const char *a2, ...)
{
  return _[a1 nextObject];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return _[a1 path];
}

id objc_msgSend_removeItemAtPath_error_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeItemAtPath:error:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeUserDefaults_container_doNanoSync_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "removeUserDefaults:container:doNanoSync:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return _[a1 resume];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return _[a1 serviceListener];
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_setExportedInterface_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedInterface:");
}

id objc_msgSend_setExportedObject_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setExportedObject:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return _[a1 sharedInstance];
}

id objc_msgSend_skipDescendants(void *a1, const char *a2, ...)
{
  return _[a1 skipDescendants];
}

id objc_msgSend_stringByAppendingPathComponent_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "stringByAppendingPathComponent:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return _[a1 synchronize];
}

id objc_msgSend_synchronizeNanoDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeNanoDomain:keys:");
}

id objc_msgSend_synchronizeUserDefaultsDomain_keys_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "synchronizeUserDefaultsDomain:keys:");
}

id objc_msgSend_valueForProperty_(void *a1, const char *a2, ...)
{
  return _objc_msgSend(a1, "valueForProperty:");
}