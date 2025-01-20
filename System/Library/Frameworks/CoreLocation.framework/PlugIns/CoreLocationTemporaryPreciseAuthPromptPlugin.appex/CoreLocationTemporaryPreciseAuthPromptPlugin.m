void sub_100004478(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1000045F4(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004A1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004E1C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100004F6C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000502C(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_1000050A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005388(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_10000541C(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) mapView];
  [v1 setUserTrackingMode:1];
}

void sub_10000546C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  _Unwind_Resume(a1);
}

void sub_100005594(_Unwind_Exception *a1)
{
  v5 = v3;

  _Unwind_Resume(a1);
}

void sub_1000056C0(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

void sub_100005748(_Unwind_Exception *a1)
{
  _Unwind_Resume(a1);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  CLLocationCoordinate2D v4 = _CLLocationCoordinate2DMake(latitude, longitude);
  double v3 = v4.longitude;
  double v2 = v4.latitude;
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

void objc_release(id a1)
{
}

id objc_retainAutoreleaseReturnValue(id a1)
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

id objc_msgSend_allowedClassesForUnarchiving(void *a1, const char *a2, ...)
{
  return [a1 allowedClassesForUnarchiving];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_clientDict(void *a1, const char *a2, ...)
{
  return [a1 clientDict];
}

id objc_msgSend_configureMapView(void *a1, const char *a2, ...)
{
  return [a1 configureMapView];
}

id objc_msgSend_coordinate(void *a1, const char *a2, ...)
{
  return [a1 coordinate];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocation(void *a1, const char *a2, ...)
{
  return [a1 currentLocation];
}

id objc_msgSend_currentOverlay(void *a1, const char *a2, ...)
{
  return [a1 currentOverlay];
}

id objc_msgSend_demandCreateLocationManager(void *a1, const char *a2, ...)
{
  return [a1 demandCreateLocationManager];
}

id objc_msgSend_effectiveBundlePath(void *a1, const char *a2, ...)
{
  return [a1 effectiveBundlePath];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_extensionInputItems(void *a1, const char *a2, ...)
{
  return [a1 extensionInputItems];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_inputItems(void *a1, const char *a2, ...)
{
  return [a1 inputItems];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_locManager(void *a1, const char *a2, ...)
{
  return [a1 locManager];
}

id objc_msgSend_location(void *a1, const char *a2, ...)
{
  return [a1 location];
}

id objc_msgSend_locationDictionary(void *a1, const char *a2, ...)
{
  return [a1 locationDictionary];
}

id objc_msgSend_mapType(void *a1, const char *a2, ...)
{
  return [a1 mapType];
}

id objc_msgSend_mapView(void *a1, const char *a2, ...)
{
  return [a1 mapView];
}

id objc_msgSend_null(void *a1, const char *a2, ...)
{
  return [a1 null];
}

id objc_msgSend_pillButtonState(void *a1, const char *a2, ...)
{
  return [a1 pillButtonState];
}

id objc_msgSend_preferredContentSizeCategory(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSizeCategory];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_size(void *a1, const char *a2, ...)
{
  return [a1 size];
}

id objc_msgSend_systemBlackColor(void *a1, const char *a2, ...)
{
  return [a1 systemBlackColor];
}

id objc_msgSend_systemGrayColor(void *a1, const char *a2, ...)
{
  return [a1 systemGrayColor];
}

id objc_msgSend_updateMapZoomAccordinglyForPreciseSetting(void *a1, const char *a2, ...)
{
  return [a1 updateMapZoomAccordinglyForPreciseSetting];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}