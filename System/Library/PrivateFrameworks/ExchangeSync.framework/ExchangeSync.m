uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id OUTLINED_FUNCTION_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x12u);
}

id _InfoForNotification(uint64_t a1)
{
  v2 = _NotificationHandlerMap();
  v3 = [v2 objectForKey:a1];

  return v3;
}

void _ReceiveNotificationResponseCallback(uint64_t a1, uint64_t a2)
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  v4 = _InfoForNotification(a1);
  v5 = [v4 groupIdentifier];
  if (v5)
  {
    v6 = [MEMORY[0x263F38DB0] sharedPowerAssertionManager];
    [v6 reattainPowerAssertionsForGroupIdentifier:v5];
  }
  uint64_t v7 = [v4 handler];
  v8 = (void *)v7;
  if (v7)
  {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a1, a2);
  }
  else
  {
    v9 = DALoggingwithCategory();
    os_log_type_t v10 = *(unsigned char *)(MEMORY[0x263F38F90] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      int v12 = 138412290;
      uint64_t v13 = a1;
      _os_log_impl(&dword_239784000, v9, v10, "No completion block for notification %@", (uint8_t *)&v12, 0xCu);
    }
  }
  v11 = _NotificationHandlerMap();
  [v11 removeObjectForKey:a1];
}

id _NotificationHandlerMap()
{
  if (_NotificationHandlerMap_onceToken != -1) {
    dispatch_once(&_NotificationHandlerMap_onceToken, &__block_literal_global);
  }
  uint64_t v0 = (void *)_NotificationHandlerMap_sNotificationHandlerMap;
  return v0;
}

void sub_23978A16C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t ESIsRunningInExchangeSyncD()
{
  return _sESIsRunningInExchangeSyncD;
}

void setESIsRunningInExchangeSyncD()
{
  _sESIsRunningInExchangeSyncD = 1;
}

void sub_23978B3FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

void sub_23978B938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_23978BA44(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978BD20(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978C6C4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978C780(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978CC30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id obj)
{
}

void sub_23978D17C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978D2C0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978D708(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978D7A0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_23978D920(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __ABDatabaseChangedExternally(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 _handleABChangeNotificationWithInfo:a2];
}

void sub_23978DD88(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t ABAddressBookCreateWithDatabaseDirectory()
{
  return MEMORY[0x270F0B430]();
}

ABAddressBookRef ABAddressBookCreateWithOptions(CFDictionaryRef options, CFErrorRef *error)
{
  return (ABAddressBookRef)MEMORY[0x270F0B438](options, error);
}

uint64_t ABAddressBookGetSequenceNumber()
{
  return MEMORY[0x270F0B460]();
}

uint64_t ABAddressBookProcessAddedRecords()
{
  return MEMORY[0x270F0B478]();
}

void ABAddressBookRegisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

uint64_t ABAddressBookRegisterYieldBlock()
{
  return MEMORY[0x270F0B488]();
}

BOOL ABAddressBookSave(ABAddressBookRef addressBook, CFErrorRef *error)
{
  return MEMORY[0x270F0B4A0](addressBook, error);
}

uint64_t ABAddressBookSetIsBackgroundProcess()
{
  return MEMORY[0x270F0B4B8]();
}

void ABAddressBookUnregisterExternalChangeCallback(ABAddressBookRef addressBook, ABExternalChangeCallback callback, void *context)
{
}

uint64_t ABChangeHistorySetAddressBookClientIdentifier()
{
  return MEMORY[0x270F0B4F0]();
}

uint64_t ABProcessAddedImages()
{
  return MEMORY[0x270F0B648]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x270EE4E50](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x270EE54B8](userNotification);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE54D0](allocator, userNotification, callout, order);
}

uint64_t CalAuxDatabaseGetUID()
{
  return MEMORY[0x270F13738]();
}

uint64_t CalDatabaseCopyDirectoryPath()
{
  return MEMORY[0x270F13DE0]();
}

uint64_t CalDatabaseCopyDirectoryPathForDatabase()
{
  return MEMORY[0x270F13DE8]();
}

uint64_t CalDatabaseCreateWithAuxDatabaseRef()
{
  return MEMORY[0x270F13F90]();
}

uint64_t CalDatabaseCreateWithOptionsDatabaseDirectoryURLAndContainerProvider()
{
  return MEMORY[0x270F13FA8]();
}

uint64_t CalDatabaseCreateWithOptionsMainDatabaseDirectoryAndContainerProviderForAccountID()
{
  return MEMORY[0x270F13FB0]();
}

uint64_t CalDatabaseGetSequenceNumber()
{
  return MEMORY[0x270F13FE0]();
}

uint64_t CalDatabaseRegisterYieldBlock()
{
  return MEMORY[0x270F14000]();
}

uint64_t CalDatabaseSave()
{
  return MEMORY[0x270F14018]();
}

uint64_t CalDatabaseSaveAndFlushCaches()
{
  return MEMORY[0x270F14020]();
}

uint64_t CalDatabaseSetClientIdentifier()
{
  return MEMORY[0x270F14030]();
}

uint64_t CalDatabaseSetPropertyModificationLoggingEnabled()
{
  return MEMORY[0x270F14040]();
}

uint64_t CalGetDatabaseForRecord()
{
  return MEMORY[0x270F14310]();
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x270F25140]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t acDataclassesForDADataclasses()
{
  return MEMORY[0x270F250D8]();
}

uint64_t dataaccess_get_global_queue()
{
  return MEMORY[0x270F250F0]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x270F9AAE0](sel);
}

uint64_t sharedDAAccountStore()
{
  return MEMORY[0x270F25108]();
}