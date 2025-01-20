uint64_t SharePlaySettingsLog()
{
  if (qword_DB78 != -1) {
    dispatch_once(&qword_DB78, &stru_82A8);
  }
  return qword_DB70;
}

void sub_18E4(id a1)
{
  qword_DB70 = (uint64_t)os_log_create("com.apple.SharePlay", "SharePlaySettings");
}

id sub_20F0(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateProviderByBundleIdentifier];
}

void sub_21F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id sub_2208(uint64_t a1)
{
  id result = [*(id *)(a1 + 32) autoSharePlayEnabled];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)result;
  return result;
}

void sub_2308(uint64_t a1)
{
  unsigned int v2 = [*(id *)(a1 + 32) autoSharePlayEnabled];
  int v3 = *(unsigned __int8 *)(a1 + 48);
  if (v3 != v2)
  {
    [*(id *)(a1 + 32) setAutoSharePlayEnabled:v3 != 0];
    v4 = [*(id *)(a1 + 40) delegateController];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_23C4;
    v5[3] = &unk_8358;
    v5[4] = *(void *)(a1 + 40);
    char v6 = *(unsigned char *)(a1 + 48);
    [v4 enumerateDelegatesUsingBlock:v5];
  }
}

void sub_23C4(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2490;
    block[3] = &unk_8330;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    id v10 = v7;
    uint64_t v11 = v8;
    char v12 = *(unsigned char *)(a1 + 40);
    dispatch_async(v6, block);
  }
}

id sub_2490(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharePlayController:*(void *)(a1 + 40) didChangeEnabled:*(unsigned __int8 *)(a1 + 48)];
}

void sub_25A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_25BC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_25CC(uint64_t a1)
{
}

void sub_25D4(uint64_t a1)
{
}

void sub_26D0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_27A4;
    block[3] = &unk_8380;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    dispatch_async(v6, block);
  }
}

id sub_27A4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharePlayController:*(void *)(a1 + 40) didChangeProviders:*(void *)(a1 + 48)];
}

void sub_2870(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) applicationPolicyManager];
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = [*(id *)(a1 + 40) bundleIdentifier];
  [v4 setAuthorization:v2 forBundleID:v3];
}

void sub_2B08(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2BDC;
    block[3] = &unk_8380;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    dispatch_async(v6, block);
  }
}

id sub_2BDC(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharePlayController:*(void *)(a1 + 40) didChangeProvider:*(void *)(a1 + 48)];
}

void sub_2BEC(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2CC0;
    block[3] = &unk_8380;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    dispatch_async(v6, block);
  }
}

id sub_2CC0(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharePlayController:*(void *)(a1 + 40) didRemoveProvider:*(void *)(a1 + 48)];
}

void sub_2CD0(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  char v6 = a3;
  if (objc_opt_respondsToSelector())
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2DA4;
    block[3] = &unk_8380;
    id v7 = v5;
    uint64_t v8 = *(void *)(a1 + 32);
    v9 = *(void **)(a1 + 40);
    id v11 = v7;
    uint64_t v12 = v8;
    id v13 = v9;
    dispatch_async(v6, block);
  }
}

id sub_2DA4(uint64_t a1)
{
  return [*(id *)(a1 + 32) sharePlayController:*(void *)(a1 + 40) didAddProvider:*(void *)(a1 + 48)];
}

int64_t sub_3174(id a1, SharePlayProvider *a2, SharePlayProvider *a3)
{
  id v4 = a3;
  id v5 = [(SharePlayProvider *)a2 localizedName];
  char v6 = [(SharePlayProvider *)v4 localizedName];

  id v7 = [v5 localizedStandardCompare:v6];
  return (int64_t)v7;
}

void sub_4DD8(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_0, log, OS_LOG_TYPE_ERROR, "Attempt to retrieve application record for bundle identifier %@ failed with error: %@", (uint8_t *)&v3, 0x16u);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return _NSStringFromClass(aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return _NSStringFromSelector(aSelector);
}

uint64_t TUObjectsAreEqualOrNil()
{
  return _TUObjectsAreEqualOrNil();
}

uint64_t TUStringsAreEqualOrNil()
{
  return _TUStringsAreEqualOrNil();
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

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return _dispatch_queue_attr_make_with_autorelease_frequency(attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
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

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
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

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_allKeys(void *a1, const char *a2, ...)
{
  return [a1 allKeys];
}

id objc_msgSend_allValues(void *a1, const char *a2, ...)
{
  return [a1 allValues];
}

id objc_msgSend_applicationPolicyManager(void *a1, const char *a2, ...)
{
  return [a1 applicationPolicyManager];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_authorizedBundleIdentifiers(void *a1, const char *a2, ...)
{
  return [a1 authorizedBundleIdentifiers];
}

id objc_msgSend_autoSharePlayEnabled(void *a1, const char *a2, ...)
{
  return [a1 autoSharePlayEnabled];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 bundleIdentifier];
}

id objc_msgSend_bundleURL(void *a1, const char *a2, ...)
{
  return [a1 bundleURL];
}

id objc_msgSend_classBundle(void *a1, const char *a2, ...)
{
  return [a1 classBundle];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_currentLocale(void *a1, const char *a2, ...)
{
  return [a1 currentLocale];
}

id objc_msgSend_delegateController(void *a1, const char *a2, ...)
{
  return [a1 delegateController];
}

id objc_msgSend_emitNavigationEvent(void *a1, const char *a2, ...)
{
  return [a1 emitNavigationEvent];
}

id objc_msgSend_emptyGroupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 emptyGroupSpecifier];
}

id objc_msgSend_groupSpecifier(void *a1, const char *a2, ...)
{
  return [a1 groupSpecifier];
}

id objc_msgSend_hash(void *a1, const char *a2, ...)
{
  return [a1 hash];
}

id objc_msgSend_iconImage(void *a1, const char *a2, ...)
{
  return [a1 iconImage];
}

id objc_msgSend_isEnabled(void *a1, const char *a2, ...)
{
  return [a1 isEnabled];
}

id objc_msgSend_isViewLoaded(void *a1, const char *a2, ...)
{
  return [a1 isViewLoaded];
}

id objc_msgSend_localizationTableName(void *a1, const char *a2, ...)
{
  return [a1 localizationTableName];
}

id objc_msgSend_localizedName(void *a1, const char *a2, ...)
{
  return [a1 localizedName];
}

id objc_msgSend_mainScreen(void *a1, const char *a2, ...)
{
  return [a1 mainScreen];
}

id objc_msgSend_mainSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSpecifier];
}

id objc_msgSend_mainSwitchSpecifier(void *a1, const char *a2, ...)
{
  return [a1 mainSwitchSpecifier];
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return [a1 mutableCopy];
}

id objc_msgSend_parentListController(void *a1, const char *a2, ...)
{
  return [a1 parentListController];
}

id objc_msgSend_providerByBundleIdentifier(void *a1, const char *a2, ...)
{
  return [a1 providerByBundleIdentifier];
}

id objc_msgSend_providerController(void *a1, const char *a2, ...)
{
  return [a1 providerController];
}

id objc_msgSend_providerSpecifiers(void *a1, const char *a2, ...)
{
  return [a1 providerSpecifiers];
}

id objc_msgSend_providers(void *a1, const char *a2, ...)
{
  return [a1 providers];
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return [a1 queue];
}

id objc_msgSend_refreshView(void *a1, const char *a2, ...)
{
  return [a1 refreshView];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_scale(void *a1, const char *a2, ...)
{
  return [a1 scale];
}

id objc_msgSend_sharePlayProviderController(void *a1, const char *a2, ...)
{
  return [a1 sharePlayProviderController];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_specifier(void *a1, const char *a2, ...)
{
  return [a1 specifier];
}

id objc_msgSend_specifierID(void *a1, const char *a2, ...)
{
  return [a1 specifierID];
}

id objc_msgSend_target(void *a1, const char *a2, ...)
{
  return [a1 target];
}

id objc_msgSend_updateProviders(void *a1, const char *a2, ...)
{
  return [a1 updateProviders];
}

id objc_msgSend_userConfiguration(void *a1, const char *a2, ...)
{
  return [a1 userConfiguration];
}