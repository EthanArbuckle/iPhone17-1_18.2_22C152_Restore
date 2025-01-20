id getWFShortcutsSettingsLogObject()
{
  void *v0;
  uint64_t vars8;

  if (qword_CC28 != -1) {
    dispatch_once(&qword_CC28, &stru_8260);
  }
  v0 = (void *)qword_CC30;

  return v0;
}

void sub_580C(id a1)
{
  qword_CC30 = (uint64_t)os_log_create(WFLogSubsystem, "ShortcutsSettings");

  _objc_release_x1();
}

id WFShortcutsSettingsLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = +[NSBundle bundleForClass:objc_opt_class()];
  v3 = [v2 localizedStringForKey:v1 value:v1 table:0];

  return v3;
}

id WFShortcutsSettingsGetValueForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  v5 = +[NSBundle bundleForClass:objc_opt_class()];
  v6 = [v5 localizedStringForKey:v4 value:0 table:v3];

  return v6;
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return _NSStringFromRange(range);
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

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

id objc_msgSend_OSSSpecifier(void *a1, const char *a2, ...)
{
  return [a1 OSSSpecifier];
}

id objc_msgSend_advancedSettingsSpecifier(void *a1, const char *a2, ...)
{
  return [a1 advancedSettingsSpecifier];
}

id objc_msgSend_allowDeletingLargeAmountOfDataSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 allowDeletingLargeAmountOfDataSwitchSpecifier];
}

id objc_msgSend_allowDeletingWithoutConfirmationSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 allowDeletingWithoutConfirmationSwitchSpecifier];
}

id objc_msgSend_allowSharingLargeAmountOfDataSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 allowSharingLargeAmountOfDataSwitchSpecifier];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_defaultGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 defaultGroupSpecifier];
}

id objc_msgSend_dummyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 dummyGroupSpecifier];
}

id objc_msgSend_isChineseRegionDevice(void *a1, const char *a2, ...)
{
  return [a1 isChineseRegionDevice];
}

id objc_msgSend_isPrivateSharingEnabled(void *a1, const char *a2, ...)
{
  return [a1 isPrivateSharingEnabled];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_numberOfParts(void *a1, const char *a2, ...)
{
  return [a1 numberOfParts];
}

id objc_msgSend_present(void *a1, const char *a2, ...)
{
  return [a1 present];
}

id objc_msgSend_privateSharingGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 privateSharingGroupSpecifier];
}

id objc_msgSend_privateSharingGroupUntrustedShortcutsDescription(void *a1, const char *a2, ...)
{
  return [a1 privateSharingGroupUntrustedShortcutsDescription];
}

id objc_msgSend_privateSharingSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 privateSharingSwitchSpecifier];
}

id objc_msgSend_scriptingGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 scriptingGroupSpecifier];
}

id objc_msgSend_scriptingSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 scriptingSwitchSpecifier];
}

id objc_msgSend_sharingGroupAboutLinkText(void *a1, const char *a2, ...)
{
  return [a1 sharingGroupAboutLinkText];
}

id objc_msgSend_stringsFileName(void *a1, const char *a2, ...)
{
  return [a1 stringsFileName];
}

id objc_msgSend_syncSpecifier(void *a1, const char *a2, ...)
{
  return [a1 syncSpecifier];
}

id objc_msgSend_systemShortcutsUserDefaults(void *a1, const char *a2, ...)
{
  return [a1 systemShortcutsUserDefaults];
}

id objc_msgSend_valueWithNonretainedObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueWithNonretainedObject:");
}