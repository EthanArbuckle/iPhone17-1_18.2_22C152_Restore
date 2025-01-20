void sub_1000023C8(id a1, NSError *a2)
{
  NSError *v2;
  id v3;
  void *v4;

  v2 = a2;
  if (!os_log_GKGeneral) {
    v3 = (id)GKOSLoggers();
  }
  v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_1000029A8(v4, v2);
  }
}

void sub_100002930(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "error while decoding messageFromClient archive in GKTurnBasedMatchmakerExtensionViewController:%@", (uint8_t *)&v2, 0xCu);
}

void sub_1000029A8(void *a1, void *a2)
{
  uint64_t v3 = a1;
  v4 = [a2 localizedDescription];
  int v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "error calling host - %@", (uint8_t *)&v5, 0xCu);
}

uint64_t GKExtensionProtocolSecureCodedClasses()
{
  return _GKExtensionProtocolSecureCodedClasses();
}

uint64_t GKOSLoggers()
{
  return _GKOSLoggers();
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return _objc_unsafeClaimAutoreleasedReturnValue(a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__auxiliaryConnection(void *a1, const char *a2, ...)
{
  return [a1 _auxiliaryConnection];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_currentGame(void *a1, const char *a2, ...)
{
  return [a1 currentGame];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_extensionIsCanceling(void *a1, const char *a2, ...)
{
  return [a1 extensionIsCanceling];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_internal(void *a1, const char *a2, ...)
{
  return [a1 internal];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_matchRequest(void *a1, const char *a2, ...)
{
  return [a1 matchRequest];
}

id objc_msgSend_refreshMatches(void *a1, const char *a2, ...)
{
  return [a1 refreshMatches];
}

id objc_msgSend_setNeedsReload(void *a1, const char *a2, ...)
{
  return [a1 setNeedsReload];
}

id objc_msgSend_turnBasedViewController(void *a1, const char *a2, ...)
{
  return [a1 turnBasedViewController];
}

id objc_msgSend_unarchivedObjectOfClasses_fromData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unarchivedObjectOfClasses:fromData:error:");
}