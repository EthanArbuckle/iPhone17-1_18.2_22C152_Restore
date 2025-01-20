void sub_2129DD5C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2129DD758(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2129DDC54(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

BOOL CMFBlockListIsItemBlocked(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v2 = (void *)MEMORY[0x216689F30]();
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance];
    objc_sync_enter(v3);
    BOOL v4 = [+[CommunicationsFilterBlockList sharedInstance] isItemInList:a1];
    objc_sync_exit(v3);
  }
  else
  {
    v5 = CMFDefaultLog();
    BOOL v4 = 0;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = a1;
      _os_log_impl(&dword_2129DC000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] received invalid object = %@", (uint8_t *)&v7, 0xCu);
      BOOL v4 = 0;
    }
  }
  return v4;
}

void sub_2129DDDA0(_Unwind_Exception *exception_object)
{
}

uint64_t CMFDefaultLog()
{
  if (CMFDefaultLog_onceToken != -1) {
    dispatch_once(&CMFDefaultLog_onceToken, &__block_literal_global);
  }
  return CMFDefaultLog_CMFDefaultLog;
}

void sub_2129DE2B0(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2129DE3B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

os_log_t __CMFDefaultLog_block_invoke()
{
  os_log_t result = os_log_create("com.apple.calls.communicationsfilter", "Default");
  CMFDefaultLog_CMFDefaultLog = (uint64_t)result;
  return result;
}

uint64_t CMFItemCreateWithEmailAddress(uint64_t a1)
{
  v2 = [CommunicationFilterItem alloc];
  return (uint64_t)[(CommunicationFilterItem *)v2 initWithEmailAddress:a1];
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void CMFBlockListAddItemForAllServices(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x216689F30]();
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance];
    objc_sync_enter(v3);
    [+[CommunicationsFilterBlockList sharedInstance] addItemForAllServices:a1];
    objc_sync_exit(v3);
  }
  else
  {
    BOOL v4 = CMFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = a1;
      _os_log_impl(&dword_2129DC000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] received invalid object = %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_2129DF0EC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CMFBlockListRemoveItemFromAllServices(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v2 = (void *)MEMORY[0x216689F30]();
  if (a1 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance];
    objc_sync_enter(v3);
    [+[CommunicationsFilterBlockList sharedInstance] removeItemForAllServices:a1];
    objc_sync_exit(v3);
  }
  else
  {
    BOOL v4 = CMFDefaultLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412290;
      uint64_t v6 = a1;
      _os_log_impl(&dword_2129DC000, v4, OS_LOG_TYPE_DEFAULT, "[WARN] received invalid object = %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

void sub_2129DF20C(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void CMFBlockListCopyItemsForAllServicesService(void *a1)
{
  v2 = (void *)MEMORY[0x216689F30]();
  if (a1)
  {
    v3 = +[CommunicationsFilterBlockList sharedInstance];
    uint64_t v4 = objc_sync_enter(v3);
    int v5 = (void *)MEMORY[0x216689F30](v4);
    id v6 = [+[CommunicationsFilterBlockList sharedInstance] copyAllItems];
    *a1 = v6;
    objc_sync_exit(v3);
  }
}

void sub_2129DF2B8(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

CommunicationFilterItem *CreateCMFItemFromString(void *a1)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (!a1) {
    return 0;
  }
  v2 = (void *)MEMORY[0x216689F30]();
  int v3 = [a1 _appearsToBeEmail];
  int v4 = [a1 _appearsToBePhoneNumber];
  if (v4)
  {
    uint64_t v5 = IMPhoneNumberRefCopyForPhoneNumber();
    if (v5)
    {
      id v6 = (const void *)v5;
      uint64_t v7 = [[CommunicationFilterItem alloc] initWithPhoneNumber:v5];
      CFRelease(v6);
    }
    else
    {
      uint64_t v7 = 0;
    }
  }
  else
  {
    uint64_t v7 = [[CommunicationFilterItem alloc] initWithEmailAddress:a1];
  }
  uint64_t v8 = CMFDefaultLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v10 = 134218496;
    v11 = a1;
    __int16 v12 = 1024;
    int v13 = v3;
    __int16 v14 = 1024;
    int v15 = v4;
    _os_log_impl(&dword_2129DC000, v8, OS_LOG_TYPE_DEFAULT, "identifier:%p, isEmail:%d isPhone:%d", (uint8_t *)&v10, 0x18u);
  }
  return v7;
}

uint64_t CMFItemCreateWithPhoneNumber(uint64_t a1)
{
  v2 = [CommunicationFilterItem alloc];
  return (uint64_t)[(CommunicationFilterItem *)v2 initWithPhoneNumber:a1];
}

uint64_t CMFItemGetType(void *a1)
{
  if ([a1 isPhoneNumber]) {
    return 0;
  }
  if (MEMORY[0x216689DC0]([a1 emailAddress])) {
    return 2;
  }
  return 1;
}

void *CMFItemCopyPhoneNumber(void *result, void *a2)
{
  if (a2)
  {
    int v3 = (const void *)[result phoneNumber];
    *a2 = v3;
    return (void *)CFRetain(v3);
  }
  return result;
}

void *CMFItemCopyEmailAddress(void *result, void *a2)
{
  if (a2)
  {
    os_log_t result = objc_msgSend((id)objc_msgSend(result, "emailAddress"), "copy");
    *a2 = result;
  }
  return result;
}

uint64_t CMFItemCreateWithBusinessID(uint64_t a1)
{
  v2 = [CommunicationFilterItem alloc];
  return (uint64_t)[(CommunicationFilterItem *)v2 initWithEmailAddress:a1];
}

void *CMFItemCopyBusinessID(void *result, void *a2)
{
  if (a2)
  {
    os_log_t result = objc_msgSend((id)objc_msgSend(result, "emailAddress"), "copy");
    *a2 = result;
  }
  return result;
}

void sub_2129DF8AC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2129DFA60(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void -[CommunicationsFilterBlockListCache _blockListChanged](CommunicationsFilterBlockListCache *self, SEL a2)
{
  int v3 = CMFDefaultLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl(&dword_2129DC000, v3, OS_LOG_TYPE_DEFAULT, (const char *)&unk_2129E0DC5, v6, 2u);
  }

  int v4 = self;
  objc_sync_enter(v4);
  [(CommunicationsFilterBlockListCache *)v4 syncListEmptyState];
  [(NSMutableArray *)v4->_recentItems removeAllObjects];
  objc_sync_exit(v4);

  uint64_t v5 = [MEMORY[0x263F08A00] defaultCenter];
  objc_msgSend(v5, "__mainThreadPostNotificationName:object:", @"CMFBlockListUpdatedNotification", 0);
}

void sub_2129DFBFC(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x270EE4998](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

uint64_t IMCountryCodeCFPhoneNumberRef()
{
  return MEMORY[0x270F3CCD0]();
}

uint64_t IMGetXPCCodableFromDictionaryWithStandardAllowlist()
{
  return MEMORY[0x270F3CD50]();
}

uint64_t IMGetXPCDictionaryFromDictionary()
{
  return MEMORY[0x270F3CD60]();
}

uint64_t IMInsertDictionariesToXPCDictionary()
{
  return MEMORY[0x270F3CDA8]();
}

uint64_t IMPhoneNumberRefCopyForPhoneNumber()
{
  return MEMORY[0x270F3CE18]();
}

uint64_t IMStringIsBusinessID()
{
  return MEMORY[0x270F3CE60]();
}

uint64_t IMUnformattedPhoneNumberForCFPhoneNumberRef()
{
  return MEMORY[0x270F3CE98]();
}

uint64_t IMXPCConfigureConnection()
{
  return MEMORY[0x270F3CEB8]();
}

uint64_t IMXPCCreateConnectionForServiceWithQueue()
{
  return MEMORY[0x270F3CEC0]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x270EDA748](*(void *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
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
  return (id)MEMORY[0x270F9A688](location, val);
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

void objc_release(id a1)
{
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
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

void xpc_connection_cancel(xpc_connection_t connection)
{
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x270EDBED0](connection, message);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x270EDC008](keys, values, count);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x270EDC200](object);
}

void xpc_release(xpc_object_t object)
{
}