void sub_1000041B0(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  v4 = +[FedStatsPluginLog logger];
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    sub_10000568C(a1, a2, v4);
  }
}

void sub_100004214(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = +[FedStatsPluginLog logger];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_100005710();
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

void sub_1000043FC(uint64_t a1, char a2, void *a3)
{
  id v5 = a3;
  v6 = +[FedStatsPluginLog logger];
  v7 = v6;
  if (v5 || (a2 & 1) == 0)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1000058C0();
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    sub_100005820(a1, v7);
  }
}

void sub_100004D08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va1, a7);
  va_start(va, a7);
  uint64_t v8 = va_arg(va1, void);
  uint64_t v10 = va_arg(va1, void);
  uint64_t v11 = va_arg(va1, void);
  uint64_t v12 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100004D30(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100004D40(uint64_t a1)
{
}

void sub_100004D48(uint64_t a1, char a2, id obj)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = a2;
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), obj);
}

void sub_100004EA4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_100004ECC(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1000054E8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100005504(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Cannot load contents of the recipe URL", v1, 2u);
}

void sub_100005548(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "recipe is not a dictionary.", v1, 2u);
}

void sub_10000558C(uint64_t *a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *a2;
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  sub_100004EA4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Recipe %@ content: %@", (uint8_t *)&v5);
}

void sub_100005614(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "%@ does not exist, metadata is not changed, will use Dedisco V1.", (uint8_t *)&v2, 0xCu);
}

void sub_10000568C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  sub_100004EA4((void *)&_mh_execute_header, a3, (uint64_t)a3, "Downloading %@, progress %li", (uint8_t *)&v4);
}

void sub_100005710()
{
  sub_100004E8C();
  sub_100004ECC((void *)&_mh_execute_header, v0, v1, "Trial failed to download %@, error %@");
}

void sub_10000577C(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a2 namespaceIdentifier];
  int v7 = 138412546;
  uint64_t v8 = a1;
  sub_100004EBC();
  sub_100004EA4((void *)&_mh_execute_header, a3, v6, "Removing factor %@ for namespace %@", (uint8_t *)&v7);
}

void sub_100005820(uint64_t a1, NSObject *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  int v4 = [*(id *)(a1 + 40) namespaceIdentifier];
  int v6 = 138412546;
  uint64_t v7 = v3;
  sub_100004EBC();
  sub_100004EA4((void *)&_mh_execute_header, a2, v5, "Removing factor %@ for namespace %@ succeed.", (uint8_t *)&v6);
}

void sub_1000058C0()
{
  sub_100004E8C();
  sub_100004ECC((void *)&_mh_execute_header, v0, v1, "Failed to delete %@, error %@");
}

void sub_10000592C(void *a1, NSObject *a2)
{
  uint64_t v3 = [a1 namespaceIdentifier];
  int v4 = 138412290;
  uint64_t v5 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "No factors are used for namespace %@", (uint8_t *)&v4, 0xCu);
}

void sub_1000059C8(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Some factors cannot be removed", v1, 2u);
}

void sub_100005A0C(void *a1, void *a2, NSObject *a3)
{
  uint64_t v5 = [a1 componentsJoinedByString:@"', ''"];
  int v6 = [a2 namespaceIdentifier];
  int v8 = 138412546;
  uint64_t v9 = v5;
  sub_100004EBC();
  sub_100004EA4((void *)&_mh_execute_header, a3, v7, "Removing factors '%@' for namespace %@", (uint8_t *)&v8);
}

void sub_100005ACC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005B44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005BBC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Could not fetch recipeAttachment from Trial Client for registered namespaces", v1, 2u);
}

void sub_100005C00(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Start with task=%@", (uint8_t *)&v2, 0xCu);
}

void sub_100005C78(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100005CF0(uint64_t a1, NSObject *a2)
{
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "End task with total record events count: %lu", (uint8_t *)&v2, 0xCu);
}

void sub_100005D68(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Received recipe attachment", v1, 2u);
}

void sub_100005DAC(os_log_t log)
{
  *(_WORD *)os_log_t v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Stopping extension", v1, 2u);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return _dispatch_semaphore_create(value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return _dispatch_semaphore_signal(dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return _dispatch_semaphore_wait(dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

id objc_autorelease(id a1)
{
  return _objc_autorelease(a1);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_assetURLs(void *a1, const char *a2, ...)
{
  return [a1 assetURLs];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_deploymentId(void *a1, const char *a2, ...)
{
  return [a1 deploymentId];
}

id objc_msgSend_deploymentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 deploymentIdentifier];
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return [a1 dictionary];
}

id objc_msgSend_experimentId(void *a1, const char *a2, ...)
{
  return [a1 experimentId];
}

id objc_msgSend_experimentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 experimentIdentifier];
}

id objc_msgSend_factor(void *a1, const char *a2, ...)
{
  return [a1 factor];
}

id objc_msgSend_fileValue(void *a1, const char *a2, ...)
{
  return [a1 fileValue];
}

id objc_msgSend_firstObject(void *a1, const char *a2, ...)
{
  return [a1 firstObject];
}

id objc_msgSend_hasPath(void *a1, const char *a2, ...)
{
  return [a1 hasPath];
}

id objc_msgSend_level(void *a1, const char *a2, ...)
{
  return [a1 level];
}

id objc_msgSend_logger(void *a1, const char *a2, ...)
{
  return [a1 logger];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_namespaceIdentifier(void *a1, const char *a2, ...)
{
  return [a1 namespaceIdentifier];
}

id objc_msgSend_parameters(void *a1, const char *a2, ...)
{
  return [a1 parameters];
}

id objc_msgSend_path(void *a1, const char *a2, ...)
{
  return [a1 path];
}

id objc_msgSend_recipeDictionary(void *a1, const char *a2, ...)
{
  return [a1 recipeDictionary];
}

id objc_msgSend_recipeIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 recipeIdentifiers];
}

id objc_msgSend_recipeURL(void *a1, const char *a2, ...)
{
  return [a1 recipeURL];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_stringValue(void *a1, const char *a2, ...)
{
  return [a1 stringValue];
}

id objc_msgSend_treatmentId(void *a1, const char *a2, ...)
{
  return [a1 treatmentId];
}

id objc_msgSend_treatmentIdentifier(void *a1, const char *a2, ...)
{
  return [a1 treatmentIdentifier];
}

id objc_msgSend_triClient(void *a1, const char *a2, ...)
{
  return [a1 triClient];
}

id objc_msgSend_trialClient(void *a1, const char *a2, ...)
{
  return [a1 trialClient];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}