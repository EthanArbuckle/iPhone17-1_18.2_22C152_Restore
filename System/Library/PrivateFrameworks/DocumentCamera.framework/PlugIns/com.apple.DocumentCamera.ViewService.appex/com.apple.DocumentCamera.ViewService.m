void sub_1000025E8(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "DCDocumentCameraViewServiceViewController is ready and waiting", v1, 2u);
}

void sub_10000262C(void *a1, NSObject *a2)
{
  v3 = [a1 session];
  v4 = [v3 sessionRequest];
  v5 = [v4 appName];
  int v6 = 138412290;
  v7 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Goodbye, %@.", (uint8_t *)&v6, 0xCu);
}

void sub_1000026EC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Calling removeSaveActionBlockerForFiles...", v1, 2u);
}

uint64_t DCDebugInterfaceEnabled()
{
  return _DCDebugInterfaceEnabled();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_appName(void *a1, const char *a2, ...)
{
  return [a1 appName];
}

id objc_msgSend_bottomAnchor(void *a1, const char *a2, ...)
{
  return [a1 bottomAnchor];
}

id objc_msgSend_childViewController(void *a1, const char *a2, ...)
{
  return [a1 childViewController];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_didCancel(void *a1, const char *a2, ...)
{
  return [a1 didCancel];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_docCamImageCache(void *a1, const char *a2, ...)
{
  return [a1 docCamImageCache];
}

id objc_msgSend_docCamViewController(void *a1, const char *a2, ...)
{
  return [a1 docCamViewController];
}

id objc_msgSend_endAppearanceTransition(void *a1, const char *a2, ...)
{
  return [a1 endAppearanceTransition];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_leadingAnchor(void *a1, const char *a2, ...)
{
  return [a1 leadingAnchor];
}

id objc_msgSend_preferredContentSize(void *a1, const char *a2, ...)
{
  return [a1 preferredContentSize];
}

id objc_msgSend_remoteViewController(void *a1, const char *a2, ...)
{
  return [a1 remoteViewController];
}

id objc_msgSend_removeSaveActionBlockerForFiles(void *a1, const char *a2, ...)
{
  return [a1 removeSaveActionBlockerForFiles];
}

id objc_msgSend_session(void *a1, const char *a2, ...)
{
  return [a1 session];
}

id objc_msgSend_sessionRequest(void *a1, const char *a2, ...)
{
  return [a1 sessionRequest];
}

id objc_msgSend_setupResult(void *a1, const char *a2, ...)
{
  return [a1 setupResult];
}

id objc_msgSend_topAnchor(void *a1, const char *a2, ...)
{
  return [a1 topAnchor];
}

id objc_msgSend_trailingAnchor(void *a1, const char *a2, ...)
{
  return [a1 trailingAnchor];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}

id objc_msgSend_window(void *a1, const char *a2, ...)
{
  return [a1 window];
}