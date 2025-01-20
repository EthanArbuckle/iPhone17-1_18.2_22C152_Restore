_xpc_connection_s *create_amfid_xpc_connection()
{
  _xpc_connection_s *mach_service;
  uint64_t vars8;

  mach_service = xpc_connection_create_mach_service("com.apple.amfi.xpc", 0, 0);
  xpc_connection_set_event_handler(mach_service, &stru_8300);

  return mach_service;
}

void sub_3C28(id a1, OS_xpc_object *a2)
{
  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(v2, _xpc_error_key_description);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5F90((uint64_t)string);
    }
  }
}

id dict_to_xpc_msg()
{
  v0 = (void *)_CFXPCCreateXPCMessageWithCFObject();

  return v0;
}

id xpc_msg_to_dict(void *a1)
{
  if (a1)
  {
    v1 = xpc_dictionary_get_value(a1, "cfreply");
    if (v1) {
      v2 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
    }
    else {
      v2 = 0;
    }
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_5198(uint64_t a1)
{
  *(void *)(*(void *)(a1 + 32) + 184) = 1;
  [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
  v2 = *(_xpc_connection_s **)(*(void *)(a1 + 32) + 192);
  v3 = dict_to_xpc_msg();
  xpc_object_t v4 = xpc_connection_send_message_with_reply_sync(v2, v3);

  if (v4)
  {
    v5 = xpc_msg_to_dict(v4);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v5 description];
      int v7 = 136315138;
      id v8 = [v6 UTF8String];
      _os_log_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "amfid response %s", (uint8_t *)&v7, 0xCu);
    }
  }
}

id sub_52D4(uint64_t a1)
{
  return [*(id *)(a1 + 32) reloadSpecifier:*(void *)(a1 + 40) animated:1];
}

id sub_5570(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  v3 = *(void **)(a1 + 32);

  return [v3 reboot];
}

uint64_t sub_55B8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void sub_5F14(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  xpc_object_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  id v6 = a4;
  [v4 reloadSpecifier:v5 animated:1];
  v6[2](v6, 0);
}

void sub_5F90(uint64_t a1)
{
  int v1 = 136315138;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "amfid connection error: %s\n", (uint8_t *)&v1, 0xCu);
}

void sub_6010(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unknown Developer Mode key to get %@", (uint8_t *)&v1, 0xCu);
}

void sub_6090(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unknown Developer Mode key to set %@", (uint8_t *)&v1, 0xCu);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

uint64_t SpecifiersFromPlist()
{
  return _SpecifiersFromPlist();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return __CFXPCCreateCFObjectFromXPCMessage();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return __CFXPCCreateXPCMessageWithCFObject();
}

uint64_t _os_feature_enabled_impl()
{
  return __os_feature_enabled_impl();
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

void objc_enumerationMutation(id obj)
{
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

id objc_retainAutorelease(id a1)
{
  return _a1;
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

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return _xpc_connection_create_mach_service(name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return _xpc_connection_send_message_with_reply_sync(connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_string(xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return _xpc_dictionary_get_value(xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return _xpc_get_type(object);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bounds(void *a1, const char *a2, ...)
{
  return [a1 bounds];
}

id objc_msgSend_bundle(void *a1, const char *a2, ...)
{
  return [a1 bundle];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return [a1 description];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_now(void *a1, const char *a2, ...)
{
  return [a1 now];
}

id objc_msgSend_readAndSetSettings(void *a1, const char *a2, ...)
{
  return [a1 readAndSetSettings];
}

id objc_msgSend_refreshLinkStatusInParent(void *a1, const char *a2, ...)
{
  return [a1 refreshLinkStatusInParent];
}

id objc_msgSend_reloadSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 reloadSpecifiers];
}

id objc_msgSend_separatorInset(void *a1, const char *a2, ...)
{
  return [a1 separatorInset];
}

id objc_msgSend_sharedService(void *a1, const char *a2, ...)
{
  return [a1 sharedService];
}

id objc_msgSend_sizeToFit(void *a1, const char *a2, ...)
{
  return [a1 sizeToFit];
}

id objc_msgSend_specifiersForPairing(void *a1, const char *a2, ...)
{
  return [a1 specifiersForPairing];
}

id objc_msgSend_spinner(void *a1, const char *a2, ...)
{
  return [a1 spinner];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_superview(void *a1, const char *a2, ...)
{
  return [a1 superview];
}

id objc_msgSend_text(void *a1, const char *a2, ...)
{
  return [a1 text];
}

id objc_msgSend_userInterfaceLayoutDirection(void *a1, const char *a2, ...)
{
  return [a1 userInterfaceLayoutDirection];
}