int64_t sub_1600(id a1, AppleEthernetInterface *a2, AppleEthernetInterface *a3)
{
  AppleEthernetInterface *v4;
  AppleEthernetInterface *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  v4 = a2;
  v5 = a3;
  v6 = [(AppleEthernetInterface *)v4 displayName];
  v7 = [(AppleEthernetInterface *)v5 displayName];
  v8 = [v6 compare:v7 options:65];

  if (!v8)
  {
    v9 = [(AppleEthernetInterface *)v4 BSDName];
    v10 = [(AppleEthernetInterface *)v5 BSDName];
    v8 = [v9 compare:v10 options:64];
  }
  return (int64_t)v8;
}

void sub_1CD4(int a1, int a2, dispatch_object_t object)
{
  v3 = dispatch_get_context(object);
  if (v3)
  {
    id v5 = v3;
    v4 = [v3 settingsDelegate];
    [v4 ethernetSettingsChanged];

    v3 = v5;
  }
}

void sub_2288(uint64_t a1)
{
  if (![*(id *)(a1 + 32) lockPreferences])
  {
    v2 = (const __SCNetworkService *)[*(id *)(a1 + 32) findServiceForInterface:*(void *)(*(void *)(a1 + 32) + 40)];
    if (v2)
    {
      v3 = v2;
      Interface = SCNetworkServiceGetInterface(v2);
      if (Interface) {
        SCNetworkInterfaceForceConfigurationRefresh(Interface);
      }
      [*(id *)(a1 + 32) unlockPreferences];
      CFRelease(v3);
    }
    else
    {
      id v5 = *(void **)(a1 + 32);
      [v5 unlockPreferences];
    }
  }
}

void sub_23B4(uint64_t a1)
{
  if (![*(id *)(a1 + 32) lockPreferences])
  {
    id v2 = [*(id *)(a1 + 32) findServiceForInterface:*(void *)(*(void *)(a1 + 32) + 40)];
    v3 = *(void **)(a1 + 32);
    if (v2)
    {
      [v3 updatePreferencesForService:v2 withConfig:*(void *)(a1 + 40)];
      [*(id *)(a1 + 32) commitAndApplyChangesToPreferences];
      [*(id *)(a1 + 32) unlockPreferences];
      CFRelease(v2);
    }
    else
    {
      [v3 unlockPreferences];
    }
  }
}

void sub_50DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va1, a13);
  va_start(va, a13);
  uint64_t v14 = va_arg(va1, void);
  uint64_t v16 = va_arg(va1, void);
  uint64_t v17 = va_arg(va1, void);
  uint64_t v18 = va_arg(va1, void);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

intptr_t sub_5108(uint64_t a1, char a2)
{
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t sub_511C(uint64_t a1, uint64_t a2)
{
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = a2;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_56B4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) currentConfig];
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_5778;
  v4[3] = &unk_C538;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  id v5 = v2;
  id v3 = v2;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v4);

  objc_destroyWeak(&v6);
}

void sub_5778(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v2 = [WeakRetained settingsViewController];
  [v2 refreshConfig:*(void *)(a1 + 32)];
}

void sub_5A18()
{
  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_0, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "AppleEthernetPrivacyProxyConfigurator unexpected updateSettings\n", v0, 2u);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t CFURLCredentialCopyPassword()
{
  return _CFURLCredentialCopyPassword();
}

uint64_t CFURLCredentialCreate()
{
  return _CFURLCredentialCreate();
}

uint64_t CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace()
{
  return _CFURLCredentialStorageCopyDefaultCredentialForProtectionSpace();
}

uint64_t CFURLCredentialStorageCreate()
{
  return _CFURLCredentialStorageCreate();
}

uint64_t CFURLCredentialStorageRemoveCredentialForProtectionSpace()
{
  return _CFURLCredentialStorageRemoveCredentialForProtectionSpace();
}

uint64_t CFURLCredentialStorageSetDefaultCredentialForProtectionSpace()
{
  return _CFURLCredentialStorageSetDefaultCredentialForProtectionSpace();
}

uint64_t CFURLProtectionSpaceCreate()
{
  return _CFURLProtectionSpaceCreate();
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return _SCDynamicStoreCopyValue(store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return _SCDynamicStoreCreate(allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreate(CFAllocatorRef allocator, CFStringRef fmt, ...)
{
  return _SCDynamicStoreKeyCreate(allocator, fmt);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return _SCDynamicStoreKeyCreateNetworkServiceEntity(allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return _SCDynamicStoreSetDispatchQueue(store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return _SCDynamicStoreSetNotificationKeys(store, keys, patterns);
}

int SCError(void)
{
  return _SCError();
}

Boolean SCNetworkInterfaceForceConfigurationRefresh(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceForceConfigurationRefresh(interface);
}

CFStringRef SCNetworkInterfaceGetBSDName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetBSDName(interface);
}

uint64_t SCNetworkInterfaceGetDisablePrivateRelay()
{
  return _SCNetworkInterfaceGetDisablePrivateRelay();
}

CFStringRef SCNetworkInterfaceGetLocalizedDisplayName(SCNetworkInterfaceRef interface)
{
  return _SCNetworkInterfaceGetLocalizedDisplayName(interface);
}

uint64_t SCNetworkInterfaceSetDisablePrivateRelay()
{
  return _SCNetworkInterfaceSetDisablePrivateRelay();
}

CFDictionaryRef SCNetworkProtocolGetConfiguration(SCNetworkProtocolRef protocol)
{
  return _SCNetworkProtocolGetConfiguration(protocol);
}

Boolean SCNetworkProtocolSetConfiguration(SCNetworkProtocolRef protocol, CFDictionaryRef config)
{
  return _SCNetworkProtocolSetConfiguration(protocol, config);
}

SCNetworkProtocolRef SCNetworkServiceCopyProtocol(SCNetworkServiceRef service, CFStringRef protocolType)
{
  return _SCNetworkServiceCopyProtocol(service, protocolType);
}

SCNetworkInterfaceRef SCNetworkServiceGetInterface(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetInterface(service);
}

CFStringRef SCNetworkServiceGetServiceID(SCNetworkServiceRef service)
{
  return _SCNetworkServiceGetServiceID(service);
}

SCNetworkSetRef SCNetworkSetCopyCurrent(SCPreferencesRef prefs)
{
  return _SCNetworkSetCopyCurrent(prefs);
}

CFArrayRef SCNetworkSetCopyServices(SCNetworkSetRef set)
{
  return _SCNetworkSetCopyServices(set);
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesApplyChanges(prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return _SCPreferencesCommitChanges(prefs);
}

SCPreferencesRef SCPreferencesCreateWithAuthorization(CFAllocatorRef allocator, CFStringRef name, CFStringRef prefsID, AuthorizationRef authorization)
{
  return _SCPreferencesCreateWithAuthorization(allocator, name, prefsID, authorization);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return _SCPreferencesLock(prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return _SCPreferencesUnlock(prefs);
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void *__cdecl dispatch_get_context(dispatch_object_t object)
{
  return _dispatch_get_context(object);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return _dispatch_get_global_queue(identifier, flags);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

const char *getprogname(void)
{
  return _getprogname();
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_BSDName(void *a1, const char *a2, ...)
{
  return [a1 BSDName];
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend__updatePrivacyProxyFeatureEnabled(void *a1, const char *a2, ...)
{
  return [a1 _updatePrivacyProxyFeatureEnabled];
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

id objc_msgSend_commitAndApplyChangesToPreferences(void *a1, const char *a2, ...)
{
  return [a1 commitAndApplyChangesToPreferences];
}

id objc_msgSend_config(void *a1, const char *a2, ...)
{
  return [a1 config];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentConfig(void *a1, const char *a2, ...)
{
  return [a1 currentConfig];
}

id objc_msgSend_defaultCenter(void *a1, const char *a2, ...)
{
  return [a1 defaultCenter];
}

id objc_msgSend_delegate(void *a1, const char *a2, ...)
{
  return [a1 delegate];
}

id objc_msgSend_detailsContextChanged(void *a1, const char *a2, ...)
{
  return [a1 detailsContextChanged];
}

id objc_msgSend_dhcpClientID(void *a1, const char *a2, ...)
{
  return [a1 dhcpClientID];
}

id objc_msgSend_displayName(void *a1, const char *a2, ...)
{
  return [a1 displayName];
}

id objc_msgSend_dnsConfig(void *a1, const char *a2, ...)
{
  return [a1 dnsConfig];
}

id objc_msgSend_dnsSearchDomains(void *a1, const char *a2, ...)
{
  return [a1 dnsSearchDomains];
}

id objc_msgSend_dnsServerAddresses(void *a1, const char *a2, ...)
{
  return [a1 dnsServerAddresses];
}

id objc_msgSend_ethernetNetworkInterfaces(void *a1, const char *a2, ...)
{
  return [a1 ethernetNetworkInterfaces];
}

id objc_msgSend_ethernetSettingsChanged(void *a1, const char *a2, ...)
{
  return [a1 ethernetSettingsChanged];
}

id objc_msgSend_frame(void *a1, const char *a2, ...)
{
  return [a1 frame];
}

id objc_msgSend_httpProxyAuthenticationRequired(void *a1, const char *a2, ...)
{
  return [a1 httpProxyAuthenticationRequired];
}

id objc_msgSend_httpProxyConfig(void *a1, const char *a2, ...)
{
  return [a1 httpProxyConfig];
}

id objc_msgSend_httpProxyConfigPAC(void *a1, const char *a2, ...)
{
  return [a1 httpProxyConfigPAC];
}

id objc_msgSend_httpProxyPassword(void *a1, const char *a2, ...)
{
  return [a1 httpProxyPassword];
}

id objc_msgSend_httpProxyServerAddress(void *a1, const char *a2, ...)
{
  return [a1 httpProxyServerAddress];
}

id objc_msgSend_httpProxyServerPort(void *a1, const char *a2, ...)
{
  return [a1 httpProxyServerPort];
}

id objc_msgSend_httpProxyUsername(void *a1, const char *a2, ...)
{
  return [a1 httpProxyUsername];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_integerValue(void *a1, const char *a2, ...)
{
  return [a1 integerValue];
}

id objc_msgSend_ipv4AddressManual(void *a1, const char *a2, ...)
{
  return [a1 ipv4AddressManual];
}

id objc_msgSend_ipv4Config(void *a1, const char *a2, ...)
{
  return [a1 ipv4Config];
}

id objc_msgSend_ipv4RouterAddressManual(void *a1, const char *a2, ...)
{
  return [a1 ipv4RouterAddressManual];
}

id objc_msgSend_ipv4SubnetMaskManual(void *a1, const char *a2, ...)
{
  return [a1 ipv4SubnetMaskManual];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_lockPreferences(void *a1, const char *a2, ...)
{
  return [a1 lockPreferences];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_navigationController(void *a1, const char *a2, ...)
{
  return [a1 navigationController];
}

id objc_msgSend_navigationItem(void *a1, const char *a2, ...)
{
  return [a1 navigationItem];
}

id objc_msgSend_privacyProxyEnabled(void *a1, const char *a2, ...)
{
  return [a1 privacyProxyEnabled];
}

id objc_msgSend_refresh(void *a1, const char *a2, ...)
{
  return [a1 refresh];
}

id objc_msgSend_row(void *a1, const char *a2, ...)
{
  return [a1 row];
}

id objc_msgSend_setNotificationKeys(void *a1, const char *a2, ...)
{
  return [a1 setNotificationKeys];
}

id objc_msgSend_settingsDelegate(void *a1, const char *a2, ...)
{
  return [a1 settingsDelegate];
}

id objc_msgSend_settingsViewController(void *a1, const char *a2, ...)
{
  return [a1 settingsViewController];
}

id objc_msgSend_sharedManager(void *a1, const char *a2, ...)
{
  return [a1 sharedManager];
}

id objc_msgSend_textLabel(void *a1, const char *a2, ...)
{
  return [a1 textLabel];
}

id objc_msgSend_unlockPreferences(void *a1, const char *a2, ...)
{
  return [a1 unlockPreferences];
}

id objc_msgSend_view(void *a1, const char *a2, ...)
{
  return [a1 view];
}