id sub_1B44(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t vars8;

  v3 = a2;
  v4 = [v3 username];
  LODWORD(a1) = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (a1) {
    v5 = v3;
  }
  else {
    v5 = 0;
  }

  return v5;
}

void sub_20FC(void *a1, void *a2)
{
  id v3 = a2;
  v4 = (void *)a1[4];
  uint64_t v5 = a1[5];
  uint64_t v6 = a1[6];
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_21A8;
  v8[3] = &unk_4200;
  id v9 = v3;
  id v7 = v3;
  [v4 signOutService:v5 withContext:v6 completion:v8];
}

uint64_t sub_21A8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

id sub_21B8(uint64_t a1)
{
  return [*(id *)(a1 + 32) authenticateWithContext:*(void *)(a1 + 40) completion:*(void *)(a1 + 48)];
}

void sub_2358(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = AIDAServiceTypeGameCenter;
  id v5 = a2;
  uint64_t v6 = [v3 accountForService:v4];
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG)) {
    sub_2968((uint64_t)v6);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

uint64_t sub_262C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_28A4(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Unexpectedly found more than one account matching username during sign in. Proceeding with first account.", v1, 2u);
}

void sub_28E8(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "View controller for presentation %@", (uint8_t *)&v1, 0xCu);
}

void sub_2968(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "Fetched new account %@ for GameCenter.", (uint8_t *)&v1, 0xCu);
}

void sub_29E8()
{
  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "No local player signed into GameCenter, no need to call signOutWithCompletionHandler.", v0, 2u);
}

uint64_t GKOSLoggers()
{
  return _GKOSLoggers();
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

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
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

id objc_msgSend__gameCenterAccountType(void *a1, const char *a2, ...)
{
  return [a1 _gameCenterAccountType];
}

id objc_msgSend_alias(void *a1, const char *a2, ...)
{
  return [a1 alias];
}

id objc_msgSend_authenticationResults(void *a1, const char *a2, ...)
{
  return [a1 authenticationResults];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_firstName(void *a1, const char *a2, ...)
{
  return [a1 firstName];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_isAccountModificationRestricted(void *a1, const char *a2, ...)
{
  return [a1 isAccountModificationRestricted];
}

id objc_msgSend_isGameCenterRestricted(void *a1, const char *a2, ...)
{
  return [a1 isGameCenterRestricted];
}

id objc_msgSend_lastName(void *a1, const char *a2, ...)
{
  return [a1 lastName];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localPlayer(void *a1, const char *a2, ...)
{
  return [a1 localPlayer];
}

id objc_msgSend_proxyForLocalPlayer(void *a1, const char *a2, ...)
{
  return [a1 proxyForLocalPlayer];
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return [a1 shared];
}

id objc_msgSend_shouldForceOperation(void *a1, const char *a2, ...)
{
  return [a1 shouldForceOperation];
}

id objc_msgSend_signInContexts(void *a1, const char *a2, ...)
{
  return [a1 signInContexts];
}

id objc_msgSend_signOutContexts(void *a1, const char *a2, ...)
{
  return [a1 signOutContexts];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_username(void *a1, const char *a2, ...)
{
  return [a1 username];
}

id objc_msgSend_utilityServicePrivate(void *a1, const char *a2, ...)
{
  return [a1 utilityServicePrivate];
}

id objc_msgSend_viewController(void *a1, const char *a2, ...)
{
  return [a1 viewController];
}