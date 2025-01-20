uint64_t sub_100002BBC(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100002E88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  if (v4)
  {
    v5 = _FALogSystem();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_100003248(v4);
    }

    v6 = [*(id *)(a1 + 32) followupItem];
    v7 = [v6 uniqueIdentifier];
    +[FAFollowupManager tearDownFollowupItemWithIdentifier:v7 completion:0];
  }
  [*(id *)(a1 + 32) finishProcessing];
}

void sub_100003118(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100003138(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No url, urlKey/idmsData or AKAction found.", v1, 2u);
}

void sub_10000317C(void *a1)
{
  v1 = [a1 description];
  sub_100003118((void *)&_mh_execute_header, v2, v3, "Failed to open URL with error: %@", v4, v5, v6, v7, 2u);
}

void sub_100003204(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "urlKey must not be nil to continue loading famlily circle UI.", v1, 2u);
}

void sub_100003248(void *a1)
{
  v1 = [a1 description];
  sub_100003118((void *)&_mh_execute_header, v2, v3, "Failed to load remoteUI with error: %@", v4, v5, v6, v7, 2u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

uint64_t _FALogSystem()
{
  return __FALogSystem();
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

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

void objc_release(id a1)
{
}

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__beginLoadingFamilyCircleUI(void *a1, const char *a2, ...)
{
  return [a1 _beginLoadingFamilyCircleUI];
}

id objc_msgSend__urlEndpointForFollowpItem(void *a1, const char *a2, ...)
{
  return [a1 _urlEndpointForFollowpItem];
}

id objc_msgSend_actions(void *a1, const char *a2, ...)
{
  return [a1 actions];
}

id objc_msgSend_akAction(void *a1, const char *a2, ...)
{
  return [a1 akAction];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_finishProcessing(void *a1, const char *a2, ...)
{
  return [a1 finishProcessing];
}

id objc_msgSend_followupItem(void *a1, const char *a2, ...)
{
  return [a1 followupItem];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}