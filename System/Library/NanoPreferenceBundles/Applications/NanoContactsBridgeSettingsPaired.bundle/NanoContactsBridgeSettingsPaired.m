id NanoContactsSettingsPairedBundle()
{
  void *v0;
  uint64_t vars8;

  if (qword_C680 != -1) {
    dispatch_once(&qword_C680, &stru_8268);
  }
  v0 = (void *)qword_C678;

  return v0;
}

void sub_43F0(id a1)
{
  qword_C678 = +[NSBundle bundleWithIdentifier:@"com.apple.NanoContactsBridgeSettingsPaired"];

  _objc_release_x1();
}

id sub_45B8(uint64_t a1, void *a2)
{
  return [a2 reloadSpecifiers];
}

void sub_5064(id a1)
{
  qword_C688 = +[NSSet setWithObject:@"contactsSortOrder"];

  _objc_release_x1();
}

void sub_5100(id a1)
{
  qword_C698 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", NSPersonNameDefaultDisplayNameOrderKey, NSPersonNameDefaultShortNameEnabledKey, NSPersonNameDefaultShortNameFormatKey, NSPersonNameDefaultShouldPreferNicknamesKey, 0);

  _objc_release_x1();
}

void sub_5790(uint64_t a1, void *a2, void *a3)
{
  v5 = *(void **)(a1 + 32);
  id v6 = a2;
  objc_msgSend(v5, "setInteger:forKey:", objc_msgSend(a3, "integerValue"), v6);
  [*(id *)(a1 + 40) addObject:v6];
}

ABPersonSortOrdering ABPersonGetSortOrdering(void)
{
  return _ABPersonGetSortOrdering();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return _CFNotificationCenterGetDarwinNotifyCenter();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

uint64_t NRVersionIsGreaterThanOrEqual()
{
  return _NRVersionIsGreaterThanOrEqual();
}

uint64_t NRWatchOSVersionForRemoteDevice()
{
  return _NRWatchOSVersionForRemoteDevice();
}

uint64_t SpecifiersFromPlist()
{
  return _SpecifiersFromPlist();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
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

id objc_msgSend__defaultDisplayNameOrder(void *a1, const char *a2, ...)
{
  return [a1 _defaultDisplayNameOrder];
}

id objc_msgSend__defaultShortNameFormat(void *a1, const char *a2, ...)
{
  return [a1 _defaultShortNameFormat];
}

id objc_msgSend__shortNameIsEnabled(void *a1, const char *a2, ...)
{
  return [a1 _shortNameIsEnabled];
}

id objc_msgSend__shouldPreferNicknames(void *a1, const char *a2, ...)
{
  return [a1 _shouldPreferNicknames];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_domain(void *a1, const char *a2, ...)
{
  return [a1 domain];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_foundationKeys(void *a1, const char *a2, ...)
{
  return [a1 foundationKeys];
}

id objc_msgSend_getActivePairedDevice(void *a1, const char *a2, ...)
{
  return [a1 getActivePairedDevice];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_peoplePickerKeys(void *a1, const char *a2, ...)
{
  return [a1 peoplePickerKeys];
}

id objc_msgSend_section(void *a1, const char *a2, ...)
{
  return [a1 section];
}

id objc_msgSend_set(void *a1, const char *a2, ...)
{
  return [a1 set];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shortNameEnabled(void *a1, const char *a2, ...)
{
  return [a1 shortNameEnabled];
}

id objc_msgSend_shortNameFormat(void *a1, const char *a2, ...)
{
  return [a1 shortNameFormat];
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return [a1 synchronize];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}