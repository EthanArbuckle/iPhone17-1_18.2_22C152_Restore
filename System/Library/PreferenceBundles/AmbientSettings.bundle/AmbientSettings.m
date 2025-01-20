id AMAmbientSettingsBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_C618 != -1) {
    dispatch_once(&qword_C618, &stru_8248);
  }
  v0 = (void *)qword_C610;

  return v0;
}

void sub_4180(id a1)
{
  self;
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = +[NSBundle bundleForClass:v3];
  v2 = (void *)qword_C610;
  qword_C610 = v1;
}

void sub_485C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_4880(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateModeSelectionFromPreferences];
}

void sub_50B4(id a1)
{
  qword_C620 = objc_opt_new();

  _objc_release_x1();
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

uint64_t _AXSAttentionAwarenessFeaturesEnabled()
{
  return __AXSAttentionAwarenessFeaturesEnabled();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

void objc_enumerationMutation(id obj)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_msgSend__alwaysOnDisplayLinkSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _alwaysOnDisplayLinkSpecifier];
}

id objc_msgSend__ambientDefaults(void *a1, const char *a2, ...)
{
  return [a1 _ambientDefaults];
}

id objc_msgSend__ambientFeatureName(void *a1, const char *a2, ...)
{
  return [a1 _ambientFeatureName];
}

id objc_msgSend__ambientModeGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _ambientModeGroupSpecifier];
}

id objc_msgSend__ambientModeSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _ambientModeSpecifier];
}

id objc_msgSend__isMotionToWakeAllowed(void *a1, const char *a2, ...)
{
  return [a1 _isMotionToWakeAllowed];
}

id objc_msgSend__isNightModeRequired(void *a1, const char *a2, ...)
{
  return [a1 _isNightModeRequired];
}

id objc_msgSend__motionToWakeSpecifierGroup(void *a1, const char *a2, ...)
{
  return [a1 _motionToWakeSpecifierGroup];
}

id objc_msgSend__nightModeSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _nightModeSwitchSpecifier];
}

id objc_msgSend__notificationsPreviewSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _notificationsPreviewSpecifier];
}

id objc_msgSend__notificationsSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _notificationsSpecifier];
}

id objc_msgSend__primaryDisplayGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _primaryDisplayGroupSpecifier];
}

id objc_msgSend__primaryNotificationsGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _primaryNotificationsGroupSpecifier];
}

id objc_msgSend__secondaryDisplayGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _secondaryDisplayGroupSpecifier];
}

id objc_msgSend__secondaryNotificationsGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 _secondaryNotificationsGroupSpecifier];
}

id objc_msgSend__supportsAlwaysOn(void *a1, const char *a2, ...)
{
  return [a1 _supportsAlwaysOn];
}

id objc_msgSend__updateModeSelectionFromPreferences(void *a1, const char *a2, ...)
{
  return [a1 _updateModeSelectionFromPreferences];
}

id objc_msgSend__updateSpecifiersFromPreferences(void *a1, const char *a2, ...)
{
  return [a1 _updateSpecifiersFromPreferences];
}

id objc_msgSend_alwaysOnMode(void *a1, const char *a2, ...)
{
  return [a1 alwaysOnMode];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_context(void *a1, const char *a2, ...)
{
  return [a1 context];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_currentSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 currentSpecifiers];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return [a1 invalidate];
}

id objc_msgSend_nightModeEnabled(void *a1, const char *a2, ...)
{
  return [a1 nightModeEnabled];
}

id objc_msgSend_performGetter(void *a1, const char *a2, ...)
{
  return [a1 performGetter];
}

id objc_msgSend_updatesWithSpecifiers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updatesWithSpecifiers:");
}