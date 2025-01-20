uint64_t TPSSIMPasscodeLog()
{
  if (qword_D840 != -1) {
    dispatch_once(&qword_D840, &stru_8260);
  }
  return qword_D838;
}

void sub_1640(id a1)
{
  qword_D838 = (uint64_t)os_log_create("com.apple.TelephonySettings", "SIMPasscode");
}

id TPSPasscodeStringForRemainingSIMPINAttempts(void *a1, int a2, int a3)
{
  id v5 = a1;
  if (v5)
  {
    id v6 = objc_alloc_init((Class)NSNumberFormatter);
    v7 = [v6 stringFromNumber:v5];
  }
  else
  {
    v7 = @"?";
  }
  if ([v5 integerValue] == (char *)&dword_0 + 1) {
    CFStringRef v8 = @"%@_SIM_ATTEMPT_REMAINING";
  }
  else {
    CFStringRef v8 = @"%@_SIM_ATTEMPTS_REMAINING";
  }
  v9 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:v8];
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7);

  CFStringRef v11 = @"ENTER_PASSWORD_FOR_UNLOCK_%@";
  if (a2) {
    CFStringRef v11 = @"ENTER_PASSWORD_FOR_LOCK_%@";
  }
  CFStringRef v12 = @"COULD_NOT_LOCK_REASON_%@";
  if (!a2) {
    CFStringRef v12 = @"COULD_NOT_UNLOCK_REASON_%@";
  }
  if (a3) {
    CFStringRef v13 = v12;
  }
  else {
    CFStringRef v13 = v11;
  }
  v14 = +[TPSSIMPasscodeLocalizedString localizedStringForKey:v13];
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v14, v10);

  return v15;
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_SIMPasscodeRemainingAttempts(void *a1, const char *a2, ...)
{
  return [a1 SIMPasscodeRemainingAttempts];
}

id objc_msgSend_SIMStatus(void *a1, const char *a2, ...)
{
  return [a1 SIMStatus];
}

id objc_msgSend__dismissChangeController(void *a1, const char *a2, ...)
{
  return [a1 _dismissChangeController];
}

id objc_msgSend__dismissUnlockController(void *a1, const char *a2, ...)
{
  return [a1 _dismissUnlockController];
}

id objc_msgSend__popoverPresentationView(void *a1, const char *a2, ...)
{
  return [a1 _popoverPresentationView];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_blackColor(void *a1, const char *a2, ...)
{
  return [a1 blackColor];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_changePINNavigationController(void *a1, const char *a2, ...)
{
  return [a1 changePINNavigationController];
}

id objc_msgSend_changePINPopoverController(void *a1, const char *a2, ...)
{
  return [a1 changePINPopoverController];
}

id objc_msgSend_changePINViewController(void *a1, const char *a2, ...)
{
  return [a1 changePINViewController];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_control(void *a1, const char *a2, ...)
{
  return [a1 control];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
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

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_isLocking(void *a1, const char *a2, ...)
{
  return [a1 isLocking];
}

id objc_msgSend_isRunningInStoreDemoMode(void *a1, const char *a2, ...)
{
  return [a1 isRunningInStoreDemoMode];
}

id objc_msgSend_isSIMLockAllowed(void *a1, const char *a2, ...)
{
  return [a1 isSIMLockAllowed];
}

id objc_msgSend_isSIMPasscodeChangeAllowed(void *a1, const char *a2, ...)
{
  return [a1 isSIMPasscodeChangeAllowed];
}

id objc_msgSend_isSIMPasscodeLockEnabled(void *a1, const char *a2, ...)
{
  return [a1 isSIMPasscodeLockEnabled];
}

id objc_msgSend_isSIMPasscodeProtected(void *a1, const char *a2, ...)
{
  return [a1 isSIMPasscodeProtected];
}

id objc_msgSend_isSimHidden(void *a1, const char *a2, ...)
{
  return [a1 isSimHidden];
}

id objc_msgSend_keyWindow(void *a1, const char *a2, ...)
{
  return [a1 keyWindow];
}

id objc_msgSend_leftBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 leftBarButtonItem];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_numberFormatter(void *a1, const char *a2, ...)
{
  return [a1 numberFormatter];
}

id objc_msgSend_parentViewController(void *a1, const char *a2, ...)
{
  return [a1 parentViewController];
}

id objc_msgSend_presentSIMPasscodeAlert(void *a1, const char *a2, ...)
{
  return [a1 presentSIMPasscodeAlert];
}

id objc_msgSend_presentingViewController(void *a1, const char *a2, ...)
{
  return [a1 presentingViewController];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_rightBarButtonItem(void *a1, const char *a2, ...)
{
  return [a1 rightBarButtonItem];
}

id objc_msgSend_setPINViewController(void *a1, const char *a2, ...)
{
  return [a1 setPINViewController];
}

id objc_msgSend_sharedApplication(void *a1, const char *a2, ...)
{
  return [a1 sharedApplication];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_subscriberController(void *a1, const char *a2, ...)
{
  return [a1 subscriberController];
}

id objc_msgSend_subscriptionContext(void *a1, const char *a2, ...)
{
  return [a1 subscriptionContext];
}

id objc_msgSend_table(void *a1, const char *a2, ...)
{
  return [a1 table];
}

id objc_msgSend_telephonyClient(void *a1, const char *a2, ...)
{
  return [a1 telephonyClient];
}

id objc_msgSend_telephonyController(void *a1, const char *a2, ...)
{
  return [a1 telephonyController];
}

id objc_msgSend_unlockPINNavigationController(void *a1, const char *a2, ...)
{
  return [a1 unlockPINNavigationController];
}

id objc_msgSend_unlockPINPopoverController(void *a1, const char *a2, ...)
{
  return [a1 unlockPINPopoverController];
}

id objc_msgSend_unlockPINViewController(void *a1, const char *a2, ...)
{
  return [a1 unlockPINViewController];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}