void sub_21F733F64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F734210(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21F7359D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23)
{
  objc_destroyWeak(v23);
  objc_destroyWeak((id *)(v24 - 80));
  _Block_object_dispose(&a17, 8);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

id ELSLogHandleForCategory(uint64_t a1)
{
  if (ELSLogHandleForCategory_onceToken != -1) {
    dispatch_once(&ELSLogHandleForCategory_onceToken, &__block_literal_global_1);
  }
  if (ELSLogHandleForCategory_logHandles[a1]) {
    v2 = (void *)ELSLogHandleForCategory_logHandles[a1];
  }
  else {
    v2 = (void *)MEMORY[0x263EF8440];
  }
  return v2;
}

uint64_t __ELSLogHandleForCategory_block_invoke()
{
  os_log_t v0 = os_log_create("com.apple.EnhancedLoggingState", "unspecified");
  v1 = (void *)ELSLogHandleForCategory_logHandles[0];
  ELSLogHandleForCategory_logHandles[0] = (uint64_t)v0;

  os_log_t v2 = os_log_create("com.apple.EnhancedLoggingState", "host");
  v3 = (void *)qword_267EE6DA0;
  qword_267EE6DA0 = (uint64_t)v2;

  os_log_t v4 = os_log_create("com.apple.EnhancedLoggingState", "networking");
  v5 = (void *)qword_267EE6DA8;
  qword_267EE6DA8 = (uint64_t)v4;

  os_log_t v6 = os_log_create("com.apple.EnhancedLoggingState", "diagnostic");
  v7 = (void *)qword_267EE6DB0;
  qword_267EE6DB0 = (uint64_t)v6;

  os_log_t v8 = os_log_create("com.apple.EnhancedLoggingState", "localization");
  v9 = (void *)qword_267EE6DB8;
  qword_267EE6DB8 = (uint64_t)v8;

  os_log_t v10 = os_log_create("com.apple.EnhancedLoggingState", "ui");
  v11 = (void *)qword_267EE6DC0;
  qword_267EE6DC0 = (uint64_t)v10;

  os_log_t v12 = os_log_create("com.apple.EnhancedLoggingState", "component");
  v13 = (void *)qword_267EE6DC8;
  qword_267EE6DC8 = (uint64_t)v12;

  os_log_t v14 = os_log_create("com.apple.EnhancedLoggingState", "ids");
  v15 = (void *)qword_267EE6DD0;
  qword_267EE6DD0 = (uint64_t)v14;

  os_log_t v16 = os_log_create("com.apple.EnhancedLoggingState", "xpc");
  v17 = (void *)qword_267EE6DD8;
  qword_267EE6DD8 = (uint64_t)v16;

  os_log_t v18 = os_log_create("com.apple.EnhancedLoggingState", "unit-test");
  v19 = (void *)qword_267EE6DE0;
  qword_267EE6DE0 = (uint64_t)v18;

  os_log_t v20 = os_log_create("com.apple.EnhancedLoggingState", "device-management");
  v21 = (void *)qword_267EE6DE8;
  qword_267EE6DE8 = (uint64_t)v20;

  qword_267EE6DF0 = (uint64_t)os_log_create("com.apple.EnhancedLoggingState", "enhanced-logging-state");
  return MEMORY[0x270F9A758]();
}

void sub_21F7368A4(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t CheckerBoardServicesLibraryCore()
{
  if (!CheckerBoardServicesLibraryCore_frameworkLibrary) {
    CheckerBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  return CheckerBoardServicesLibraryCore_frameworkLibrary;
}

uint64_t __CheckerBoardServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  CheckerBoardServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCBSUtilitiesClass_block_invoke(uint64_t a1)
{
  if (!CheckerBoardServicesLibraryCore())
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  Class result = objc_getClass("CBSUtilities");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24))
  {
    getCBSUtilitiesClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  else
  {
    uint64_t v4 = __getCBSUtilitiesClass_block_invoke_cold_1();
    return (Class)__DiagnosticExtensionsDaemonLibraryCore_block_invoke(v4);
  }
  return result;
}

uint64_t __DiagnosticExtensionsDaemonLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DiagnosticExtensionsDaemonLibraryCore_frameworkLibrary = result;
  return result;
}

__CFString *ELSInternalString(void *a1)
{
  uint64_t v1 = NSDictionary;
  id v2 = a1;
  v3 = [v1 dictionaryWithContentsOfFile:@"/AppleInternal/Library/EnhancedLoggingState/Internal.strings"];
  uint64_t v4 = [v3 objectForKey:v2];

  if (v4) {
    v5 = v4;
  }
  else {
    v5 = &stru_26D1285D8;
  }

  return v5;
}

uint64_t __getCBSUtilitiesClass_block_invoke_cold_1()
{
  os_log_t v0 = abort_report_np();
  return +[ELSEvent createLoggingEventWith:postfix:](v0);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x270ED94B8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x270ED94C8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x270ED94D0](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
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

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x270EDBDE0](xBOOL);
}

uint64_t xpc_copy_entitlement_for_self()
{
  return MEMORY[0x270EDBF48]();
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x270EDBF50]();
}