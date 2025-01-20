id sub_1000026E8(id a1, GKPlayerInternal *a2, unint64_t a3)
{
  return +[GKPlayer canonicalizedPlayerForInternal:a2];
}

void sub_100002868(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t sub_100002880(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100002890(uint64_t a1)
{
}

id sub_100002898(uint64_t a1, void *a2)
{
  v3 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  id v4 = a2;
  v5 = [v3 contentViewController];
  v6 = [v5 view];
  [v6 removeFromSuperview];

  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setContentViewController:v4];
  v8.receiver = *(id *)(a1 + 32);
  v8.super_class = (Class)GKChallengeIssueExtensionViewController;
  return objc_msgSendSuper2(&v8, "constructContentViewController");
}

void sub_10000293C(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v10 = GKExtensionMessageCommandKey;
  v11 = &off_100004310;
  v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  objc_super v8 = +[NSMutableDictionary dictionaryWithDictionary:v7];

  if (v5)
  {
    v9 = [v5 _gkMapWithBlock:&stru_100004210];
    [v8 setObject:v9 forKeyedSubscript:GKExtensionMessagePlayerList];
  }
  if (v6) {
    [v8 setObject:v6 forKeyedSubscript:GKExtensionMessageChallengeMessage];
  }
  [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) sendMessageToClient:v8];
}

id sub_100002A80(id a1, GKPlayer *a2, unint64_t a3)
{
  return [(GKPlayer *)a2 internal];
}

void sub_100002BB4(id a1, NSError *a2)
{
  v2 = a2;
  if (!os_log_GKGeneral) {
    id v3 = (id)GKOSLoggers();
  }
  id v4 = (void *)os_log_GKHosted;
  if (os_log_type_enabled(os_log_GKHosted, OS_LOG_TYPE_DEBUG)) {
    sub_100002D58(v4, v2);
  }
}

void sub_100002D58(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = [a2 localizedDescription];
  int v5 = 138412290;
  id v6 = v4;
  _os_log_debug_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "error calling host - %@", (uint8_t *)&v5, 0xCu);
}

uint64_t GKOSLoggers()
{
  return _GKOSLoggers();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_msgSend_contentViewController(void *a1, const char *a2, ...)
{
  return [a1 contentViewController];
}

id objc_msgSend_currentDevice(void *a1, const char *a2, ...)
{
  return [a1 currentDevice];
}

id objc_msgSend_currentGame(void *a1, const char *a2, ...)
{
  return [a1 currentGame];
}

id objc_msgSend_currentHandler(void *a1, const char *a2, ...)
{
  return [a1 currentHandler];
}

id objc_msgSend_extensionContext(void *a1, const char *a2, ...)
{
  return [a1 extensionContext];
}

id objc_msgSend_isGameCenter(void *a1, const char *a2, ...)
{
  return [a1 isGameCenter];
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return [a1 localizedDescription];
}

id objc_msgSend_removeFromSuperview(void *a1, const char *a2, ...)
{
  return [a1 removeFromSuperview];
}

id objc_msgSend_userInterfaceIdiom(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceIdiom];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}