void sub_4698(id a1)
{
  uint64_t vars8;

  qword_CF70 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandler");
  _objc_release_x1();
}

void sub_4764(id a1)
{
  v1 = +[RMModelAccountCalDAVDeclaration registeredIdentifier];
  v10[0] = v1;
  v11[0] = objc_opt_class();
  v2 = +[RMModelAccountCardDAVDeclaration registeredIdentifier];
  v10[1] = v2;
  v11[1] = objc_opt_class();
  v3 = +[RMModelAccountExchangeDeclaration registeredIdentifier];
  v10[2] = v3;
  v11[2] = objc_opt_class();
  v4 = +[RMModelAccountGoogleDeclaration registeredIdentifier];
  v10[3] = v4;
  v11[3] = objc_opt_class();
  v5 = +[RMModelAccountLDAPDeclaration registeredIdentifier];
  v10[4] = v5;
  v11[4] = objc_opt_class();
  v6 = +[RMModelAccountMailDeclaration registeredIdentifier];
  v10[5] = v6;
  v11[5] = objc_opt_class();
  v7 = +[RMModelAccountSubscribedCalendarDeclaration registeredIdentifier];
  v10[6] = v7;
  v11[6] = objc_opt_class();
  uint64_t v8 = +[NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:7];
  v9 = (void *)qword_CF80;
  qword_CF80 = v8;
}

void sub_4AC8(id a1)
{
  qword_CF90 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerCalDAV");
  _objc_release_x1();
}

void sub_4D50(id a1)
{
  qword_CFA0 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerCardDAV");
  _objc_release_x1();
}

void sub_4F58(id a1)
{
  qword_CFB0 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerExchange");
  _objc_release_x1();
}

void sub_5294(id a1)
{
  qword_CFC0 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerGoogle");
  _objc_release_x1();
}

void sub_5528(id a1)
{
  qword_CFD0 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerLDAP");
  _objc_release_x1();
}

void sub_5774(id a1)
{
  qword_CFE0 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerMail");
  _objc_release_x1();
}

void sub_5C30(id a1)
{
  qword_CFF0 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountStatusHandlerSubscribedCalendar");
  _objc_release_x1();
}

void sub_5E60(id a1)
{
  qword_D000 = (uint64_t)os_log_create("com.apple.remotemanagementd", "accountsNotificationPlugin");
  _objc_release_x1();
}

void sub_622C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_6258(uint64_t a1, NSObject *a2)
{
  int v2 = 138543362;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_0, a2, OS_LOG_TYPE_ERROR, "No handler for %{public}@", (uint8_t *)&v2, 0xCu);
}

void sub_62D0(int a1, NSObject *a2)
{
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_0, a2, OS_LOG_TYPE_DEBUG, "Ignoring RM account change type: %u", (uint8_t *)v2, 8u);
}

void sub_6348(void *a1)
{
  v1 = [a1 identifier];
  sub_624C();
  sub_622C(&dword_0, v2, v3, "RM account added: %{public}@", v4, v5, v6, v7, v8);
}

void sub_63CC(void *a1)
{
  v1 = [a1 identifier];
  sub_624C();
  sub_622C(&dword_0, v2, v3, "RM account removed: %{public}@", v4, v5, v6, v7, v8);
}

void sub_6450(void *a1)
{
  v1 = [a1 identifier];
  sub_624C();
  sub_622C(&dword_0, v2, v3, "RM account status modified: %{public}@", v4, v5, v6, v7, v8);
}

void sub_64D4(void *a1)
{
  v1 = [a1 identifier];
  sub_624C();
  sub_622C(&dword_0, v2, v3, "RM account status not modified: %{public}@", v4, v5, v6, v7, v8);
}

void sub_6558(void *a1)
{
  v1 = [a1 identifier];
  sub_624C();
  sub_622C(&dword_0, v2, v3, "RM account modified: %{public}@", v4, v5, v6, v7, v8);
}

void sub_65DC(os_log_t log)
{
  int v1 = 138543362;
  CFStringRef v2 = @"com.apple.remotemanagement.status.account.notification";
  _os_log_debug_impl(&dword_0, log, OS_LOG_TYPE_DEBUG, "Posted notification: %{public}@", (uint8_t *)&v1, 0xCu);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

uint32_t notify_post(const char *name)
{
  return _notify_post(name);
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__postNotification(void *a1, const char *a2, ...)
{
  return [a1 _postNotification];
}

id objc_msgSend_absoluteString(void *a1, const char *a2, ...)
{
  return [a1 absoluteString];
}

id objc_msgSend_accountDescription(void *a1, const char *a2, ...)
{
  return [a1 accountDescription];
}

id objc_msgSend_accountStatusHandler(void *a1, const char *a2, ...)
{
  return [a1 accountStatusHandler];
}

id objc_msgSend_accountsNotificationPlugin(void *a1, const char *a2, ...)
{
  return [a1 accountsNotificationPlugin];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return [a1 port];
}

id objc_msgSend_registeredIdentifier(void *a1, const char *a2, ...)
{
  return [a1 registeredIdentifier];
}

id objc_msgSend_subscriptionURL(void *a1, const char *a2, ...)
{
  return [a1 subscriptionURL];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}