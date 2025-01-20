void sub_4E5C(id a1)
{
  uint64_t vars8;

  qword_CC30 = (uint64_t)os_log_create("com.apple.weather.watchapp", "settings");

  _objc_release_x1();
}

void sub_56C4(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 gizmoDefaults];
  id v4 = [v3 synchronize];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_61E4;
  block[3] = &unk_8318;
  id v7 = v2;
  id v5 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

id sub_5928(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gizmoDefaults];
  id v3 = [v2 synchronize];

  id v4 = *(void **)(a1 + 32);

  return [v4 _notifyObserversOfReload];
}

void sub_5A44(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 name];
  id v3 = [v4 copy];
  [v2 addObject:v3];
}

BOOL sub_5C68(id a1, City *a2, NSDictionary *a3)
{
  return [(City *)a2 isLocalWeatherCity] ^ 1;
}

id sub_5E48(uint64_t a1)
{
  if ([*(id *)(a1 + 32) areLocationServicesAuthorized])
  {
    v1 = +[City currentLocationCity];
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

id sub_5E90(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 locationID];
  id v4 = [v2 isEqualToString:v3];

  return v4;
}

void sub_60B0(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) gizmoDefaultsManager];
  v1 = +[NSSet setWithObject:@"UserSelected"];
  [v2 synchronizeNanoDomain:@"com.apple.nanoweatherprefs" keys:v1];
}

id sub_61E4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _notifyObserversOfReload];
}

void sub_61EC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "[Root] Observed changes to defaults; reload.", v1, 2u);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

id objc_msgSend_areLocationServicesAuthorized(void *a1, const char *a2, ...)
{
  return [a1 areLocationServicesAuthorized];
}

id objc_msgSend_areLocationServicesResolved(void *a1, const char *a2, ...)
{
  return [a1 areLocationServicesResolved];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_cities(void *a1, const char *a2, ...)
{
  return [a1 cities];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocationCity(void *a1, const char *a2, ...)
{
  return [a1 currentLocationCity];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_forceLoadingAuthorizationStatus(void *a1, const char *a2, ...)
{
  return [a1 forceLoadingAuthorizationStatus];
}

id objc_msgSend_gizmoDefaults(void *a1, const char *a2, ...)
{
  return [a1 gizmoDefaults];
}

id objc_msgSend_gizmoDefaultsManager(void *a1, const char *a2, ...)
{
  return [a1 gizmoDefaultsManager];
}

id objc_msgSend_isLocalWeatherCity(void *a1, const char *a2, ...)
{
  return [a1 isLocalWeatherCity];
}

id objc_msgSend_loadSavedCities(void *a1, const char *a2, ...)
{
  return [a1 loadSavedCities];
}

id objc_msgSend_locationID(void *a1, const char *a2, ...)
{
  return [a1 locationID];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_processInfo(void *a1, const char *a2, ...)
{
  return [a1 processInfo];
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return [a1 processName];
}

id objc_msgSend_reload(void *a1, const char *a2, ...)
{
  return [a1 reload];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_sanitizedCities(void *a1, const char *a2, ...)
{
  return [a1 sanitizedCities];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_selectedCity(void *a1, const char *a2, ...)
{
  return [a1 selectedCity];
}

id objc_msgSend_selectedCityLocationID(void *a1, const char *a2, ...)
{
  return [a1 selectedCityLocationID];
}

id objc_msgSend_sharedPreferences(void *a1, const char *a2, ...)
{
  return [a1 sharedPreferences];
}

id objc_msgSend_sharedWeatherLocationManager(void *a1, const char *a2, ...)
{
  return [a1 sharedWeatherLocationManager];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_synchronizeStateToDisk(void *a1, const char *a2, ...)
{
  return [a1 synchronizeStateToDisk];
}

id objc_msgSend_weatherPrefsMonitor(void *a1, const char *a2, ...)
{
  return [a1 weatherPrefsMonitor];
}