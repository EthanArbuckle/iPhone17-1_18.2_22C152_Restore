uint64_t BTDevicePickerUILogInit()
{
  uint64_t vars8;

  BTDevicePickerUILogComponent = (uint64_t)os_log_create("com.apple.bluetooth", "BTDevicePickerUI");
  return _objc_release_x1();
}

id sub_100001BF0(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelDevicePicker];
}

id sub_1000021C0(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelDevicePicker];
}

id sub_100003624(uint64_t a1)
{
  return [*(id *)(a1 + 32) cancelDevicePicker];
}

void sub_100004488(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3 = *a1;
  uint64_t v4 = *(void *)(a2 + 88);
  int v5 = 138412546;
  uint64_t v6 = v3;
  __int16 v7 = 2112;
  uint64_t v8 = v4;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Ignoring authentication request as there's something pending user interaction: _sspAlert(%@), _alert(%@)", (uint8_t *)&v5, 0x16u);
}

Class NSClassFromString(NSString *aClassName)
{
  return _NSClassFromString(aClassName);
}

uint64_t NSExtensionMain()
{
  return _NSExtensionMain();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_once_f(dispatch_once_t *predicate, void *context, dispatch_function_t function)
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

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return [a1 address];
}

id objc_msgSend_available(void *a1, const char *a2, ...)
{
  return [a1 available];
}

id objc_msgSend_cancelPairing(void *a1, const char *a2, ...)
{
  return [a1 cancelPairing];
}

id objc_msgSend_cleanupPairing(void *a1, const char *a2, ...)
{
  return [a1 cleanupPairing];
}

id objc_msgSend_connect(void *a1, const char *a2, ...)
{
  return [a1 connect];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return [a1 device];
}

id objc_msgSend_dismiss(void *a1, const char *a2, ...)
{
  return [a1 dismiss];
}

id objc_msgSend_host(void *a1, const char *a2, ...)
{
  return [a1 host];
}

id objc_msgSend_load(void *a1, const char *a2, ...)
{
  return [a1 load];
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return [a1 name];
}

id objc_msgSend_object(void *a1, const char *a2, ...)
{
  return [a1 object];
}

id objc_msgSend_pairedDevices(void *a1, const char *a2, ...)
{
  return [a1 pairedDevices];
}

id objc_msgSend_pairingStyle(void *a1, const char *a2, ...)
{
  return [a1 pairingStyle];
}

id objc_msgSend_powered(void *a1, const char *a2, ...)
{
  return [a1 powered];
}

id objc_msgSend_reloadData(void *a1, const char *a2, ...)
{
  return [a1 reloadData];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_resetDeviceScanning(void *a1, const char *a2, ...)
{
  return [a1 resetDeviceScanning];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_show(void *a1, const char *a2, ...)
{
  return [a1 show];
}

id objc_msgSend_showInternal(void *a1, const char *a2, ...)
{
  return [a1 showInternal];
}

id objc_msgSend_showPowerPrompt(void *a1, const char *a2, ...)
{
  return [a1 showPowerPrompt];
}

id objc_msgSend_startAnimating(void *a1, const char *a2, ...)
{
  return [a1 startAnimating];
}

id objc_msgSend_startScanning(void *a1, const char *a2, ...)
{
  return [a1 startScanning];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_userInfo(void *a1, const char *a2, ...)
{
  return [a1 userInfo];
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}