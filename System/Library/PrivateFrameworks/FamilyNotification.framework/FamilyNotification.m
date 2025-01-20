void sub_100002D30(id a1)
{
  uint64_t vars8;

  qword_10000DB30 = objc_alloc_init(NotifierDelegate);
  _objc_release_x1();
}

void sub_100003358(uint64_t a1)
{
  v2 = +[NotificationController sharedController];
  v3 = [*(id *)(a1 + 32) clientIdentifier];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10000341C;
  v4[3] = &unk_100008298;
  id v5 = *(id *)(a1 + 40);
  [v2 pendingNotificationsForClient:v3 withCompletion:v4];
}

uint64_t sub_10000341C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_10000355C(id a1)
{
  qword_10000DB40 = objc_alloc_init(NotificationController);
  _objc_release_x1();
}

id sub_1000037C4(uint64_t a1, void *a2)
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100003838;
  v3[3] = &unk_100008308;
  v3[4] = *(void *)(a1 + 32);
  return [a2 enumerateObjectsUsingBlock:v3];
}

void sub_100003838(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [a2 identifier];
  [v2 tearDownNotificationWithIdentifier:v3];
}

void sub_1000039D4(uint64_t a1, void *a2)
{
  uint64_t v3 = *(void *)(a1 + 32);
  id v4 = a2;
  id v5 = +[NSPredicate predicateWithFormat:@"clientIdentifier == %@", v3];
  v6 = [v4 filteredArrayUsingPredicate:v5];

  v7 = _FALogSystem();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v8 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    uint64_t v10 = v8;
    __int16 v11 = 2112;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Notifications for %@: %@", buf, 0x16u);
  }

  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
}

void sub_100003C18(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = +[NSSortDescriptor sortDescriptorWithKey:@"relevanceDate" ascending:0];
  v7 = v4;
  id v5 = +[NSArray arrayWithObjects:&v7 count:1];
  v6 = [v3 sortedArrayUsingDescriptors:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100003FA0(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NotificationController: XPC Error from client delegate while trying to send an activation callback - %@", (uint8_t *)&v4, 0xCu);
  }
}

void sub_1000041C4(id a1, NSError *a2)
{
  v2 = a2;
  id v3 = _FALogSystem();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    int v4 = 138412290;
    id v5 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "NotificationController: XPC Error from client delegate while trying to send an activation callback - %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t start()
{
  v1 = +[NotifierDelegate sharedInstance];
  [v1 start];

  CFRunLoopRun();
  return 0;
}

void sub_1000045D0(id a1, NSError *a2)
{
  v2 = a2;
  if (v2)
  {
    id v3 = _FALogSystem();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      sub_100005400((uint64_t)v2, v3);
    }
  }
}

void sub_100004B0C(uint64_t a1, void *a2)
{
  id v3 = a2;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100004BEC;
  v5[3] = &unk_100008420;
  id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  id v4 = v6;
  [v3 enumerateObjectsUsingBlock:v5];

  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_100004BEC(uint64_t a1, void *a2)
{
  id v3 = [a2 request];
  id v4 = [v3 content];
  id v5 = [v4 userInfo];
  id v7 = [v5 objectForKeyedSubscript:@"FAFamilyNotificationAsDictionaryKey"];

  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = [objc_alloc((Class)FAFamilyNotification) initWithCacheDictionaryRepresentation:v7];
    [*(id *)(a1 + 32) addObject:v6];
  }
}

void sub_100005400(uint64_t a1, NSObject *a2)
{
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Error posting notification %@", (uint8_t *)&v2, 0xCu);
}

void sub_100005478(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "No note object, nothing to do here", v1, 2u);
}

void sub_1000054BC(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Unknown action identifier", v1, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

void CFRunLoopRun(void)
{
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return _CFUUIDCreate(alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return _CFUUIDCreateString(alloc, uuid);
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
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

{
}

{
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

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

id objc_msgSend__defaultNotificationCategories(void *a1, const char *a2, ...)
{
  return [a1 _defaultNotificationCategories];
}

id objc_msgSend_actionButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 actionButtonLabel];
}

id objc_msgSend_actionIdentifier(void *a1, const char *a2, ...)
{
  return [a1 actionIdentifier];
}

id objc_msgSend_activateActionURL(void *a1, const char *a2, ...)
{
  return [a1 activateActionURL];
}

id objc_msgSend_cacheDictionaryRepresentation(void *a1, const char *a2, ...)
{
  return [a1 cacheDictionaryRepresentation];
}

id objc_msgSend_clientIdentifier(void *a1, const char *a2, ...)
{
  return [a1 clientIdentifier];
}

id objc_msgSend_content(void *a1, const char *a2, ...)
{
  return [a1 content];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultSound(void *a1, const char *a2, ...)
{
  return [a1 defaultSound];
}

id objc_msgSend_defaultWorkspace(void *a1, const char *a2, ...)
{
  return [a1 defaultWorkspace];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_delegateMachServiceName(void *a1, const char *a2, ...)
{
  return [a1 delegateMachServiceName];
}

id objc_msgSend_dismissActionlURL(void *a1, const char *a2, ...)
{
  return [a1 dismissActionlURL];
}

id objc_msgSend_expiryDate(void *a1, const char *a2, ...)
{
  return [a1 expiryDate];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_informativeText(void *a1, const char *a2, ...)
{
  return [a1 informativeText];
}

id objc_msgSend_lock(void *a1, const char *a2, ...)
{
  return [a1 lock];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return [a1 notification];
}

id objc_msgSend_notificationCategories(void *a1, const char *a2, ...)
{
  return [a1 notificationCategories];
}

id objc_msgSend_otherButtonLabel(void *a1, const char *a2, ...)
{
  return [a1 otherButtonLabel];
}

id objc_msgSend_relevanceDate(void *a1, const char *a2, ...)
{
  return [a1 relevanceDate];
}

id objc_msgSend_request(void *a1, const char *a2, ...)
{
  return [a1 request];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_setWantsNotificationResponsesDelivered(void *a1, const char *a2, ...)
{
  return [a1 setWantsNotificationResponsesDelivered];
}

id objc_msgSend_sharedController(void *a1, const char *a2, ...)
{
  return [a1 sharedController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_shouldPersistWhenActivated(void *a1, const char *a2, ...)
{
  return [a1 shouldPersistWhenActivated];
}

id objc_msgSend_start(void *a1, const char *a2, ...)
{
  return [a1 start];
}

id objc_msgSend_title(void *a1, const char *a2, ...)
{
  return [a1 title];
}

id objc_msgSend_uniqueIdentifier(void *a1, const char *a2, ...)
{
  return [a1 uniqueIdentifier];
}

id objc_msgSend_unlock(void *a1, const char *a2, ...)
{
  return [a1 unlock];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return [a1 uuid];
}

id objc_msgSend_xpcConnectionForClientWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "xpcConnectionForClientWithMachServiceName:");
}