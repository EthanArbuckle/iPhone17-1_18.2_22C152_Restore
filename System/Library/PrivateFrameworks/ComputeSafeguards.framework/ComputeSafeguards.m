void processExitHandler(void *a1)
{
  id v1;
  uint64_t v2;
  id v3;
  uint64_t vars8;

  v1 = a1;
  v3 = +[CSProcessManager sharedInstanceWithEnrolledProcesses:0 andExemptions:0];
  v2 = [v1 currentPID];

  [v3 recordTerminationForPID:v2];
}

id getMainQueue()
{
  if (getMainQueue_onceToken != -1) {
    dispatch_once(&getMainQueue_onceToken, &__block_literal_global_54);
  }
  v0 = (void *)mainQueue;
  return v0;
}

id processLogger()
{
  if (processLogger_onceToken != -1) {
    dispatch_once(&processLogger_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)processLogger_logger;
  return v0;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

unsigned char *OUTLINED_FUNCTION_3_0(unsigned char *result, unsigned char *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void *__getPPSCreateTelemetryIdentifierSymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PowerLogLibrary();
  result = dlsym(v2, "PPSCreateTelemetryIdentifier");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPPSCreateTelemetryIdentifierSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t PowerLogLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!PowerLogLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __PowerLogLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_26528B068;
    uint64_t v5 = 0;
    PowerLogLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = PowerLogLibraryCore_frameworkLibrary;
  v1 = (void *)v3[0];
  if (!PowerLogLibraryCore_frameworkLibrary)
  {
    v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __PowerLogLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  PowerLogLibraryCore_frameworkLibrary = result;
  return result;
}

void *__getPPSSendTelemetrySymbolLoc_block_invoke(uint64_t a1)
{
  v2 = (void *)PowerLogLibrary();
  uint64_t result = dlsym(v2, "PPSSendTelemetry");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getPPSSendTelemetrySymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24A69CD08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t __processLogger_block_invoke()
{
  processLogger_logger = +[CSLogger logForCategory:@"CSProcess"];
  return MEMORY[0x270F9A758]();
}

void __getMainQueue_block_invoke()
{
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v0 = dispatch_queue_create("com.apple.computesafeguards.mainqueue", v2);
  v1 = (void *)mainQueue;
  mainQueue = (uint64_t)v0;
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_24A6A1224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
}

void *getCSProcesses()
{
  id v0 = &unk_26FE34D48;
  return &unk_26FE34D48;
}

void *getCSExemptProcesses()
{
  id v0 = &unk_26FE34AA0;
  return &unk_26FE34AA0;
}

void *getCSScenarios()
{
  id v0 = &unk_26FE34ED8;
  return &unk_26FE34ED8;
}

uint64_t getCSProcessRestrictions(uint64_t a1)
{
  return [&unk_26FE34D20 objectForKeyedSubscript:a1];
}

id initComputeSafeguards()
{
  return +[CSDaemon run];
}

uint64_t isInternalBuild()
{
  if (isInternalBuild_onceToken != -1) {
    dispatch_once(&isInternalBuild_onceToken, &__block_literal_global_5);
  }
  return isInternalBuild_internalBuild;
}

void __isInternalBuild_block_invoke()
{
  CFBooleanRef v0 = (const __CFBoolean *)MGCopyAnswer();
  isInternalBuild_internalBuild = CFBooleanGetValue(v0) != 0;
  CFRelease(v0);
}

id CSObjectOfClassForKey(void *a1, uint64_t a2)
{
  v2 = [a1 objectForKey:a2];
  v3 = v2;
  if (v2)
  {
    if (objc_opt_isKindOfClass()) {
      v2 = v3;
    }
    else {
      v2 = 0;
    }
  }
  id v4 = v2;

  return v4;
}

id CSObjectOfClassForKeyWithErrors(void *a1, void *a2, uint64_t a3, void *a4)
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  id v7 = a1;
  id v8 = a2;
  id v9 = a4;
  v10 = CSObjectOfClassForKey(v7, (uint64_t)v8);
  v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    v13 = +[CSLogger defaultCategory];
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      id v23 = v8;
      __int16 v24 = 2114;
      id v25 = (id)objc_opt_class();
      __int16 v26 = 2114;
      uint64_t v27 = a3;
      id v19 = v25;
      _os_log_error_impl(&dword_24A698000, v13, OS_LOG_TYPE_ERROR, "Detected misconfigured properties dictionary. Property %{public}@ had class %{public}@ when class %{public}@ was expected", buf, 0x20u);
    }
    if (v9)
    {
      v14 = (void *)MEMORY[0x263F087E8];
      uint64_t v20 = *MEMORY[0x263F08338];
      v15 = [NSString stringWithFormat:@"Detected misconfigured properties dictionary. Property %@ had class %@ when class %@ was expected", v8, objc_opt_class(), a3];
      v21 = v15;
      v16 = [NSDictionary dictionaryWithObjects:&v21 forKeys:&v20 count:1];
      v17 = [v14 errorWithDomain:@"CSUtilitiesErrorDomain" code:1 userInfo:v16];

      [v9 addObject:v17];
    }
  }

  return v11;
}

id CSNumberForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  uint64_t v5 = CSObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id CSNumberForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = objc_opt_class();
  id v9 = CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);

  return v9;
}

id CSStringForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = CSObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id CSStringForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = objc_opt_class();
  id v9 = CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);

  return v9;
}

id CSURLForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = CSObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id CSURLForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = objc_opt_class();
  id v9 = CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);

  return v9;
}

id CSArrayForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = CSObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id CSArrayForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = objc_opt_class();
  id v9 = CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);

  return v9;
}

id CSDictionaryForKey(void *a1, void *a2)
{
  id v3 = a2;
  id v4 = a1;
  objc_opt_class();
  id v5 = CSObjectOfClassForKey(v4, (uint64_t)v3);

  return v5;
}

id CSDictionaryForKeyWithErrors(void *a1, void *a2, void *a3)
{
  id v5 = a3;
  id v6 = a2;
  id v7 = a1;
  uint64_t v8 = objc_opt_class();
  id v9 = CSObjectOfClassForKeyWithErrors(v7, v6, v8, v5);

  return v9;
}

uint64_t CSBoolForKey(void *a1, uint64_t a2)
{
  v2 = [a1 objectForKey:a2];
  if (v2 && (objc_opt_respondsToSelector() & 1) != 0) {
    uint64_t v3 = [v2 BOOLValue];
  }
  else {
    uint64_t v3 = 0;
  }

  return v3;
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x270EE4530](BOOLean);
}

void CFRelease(CFTypeRef cf)
{
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x270F95F98]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
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
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

void free(void *a1)
{
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x270EDA498](__b, *(void *)&__c, __len);
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

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x270EDAD58](*(void *)&type, *(void *)&typeinfo, buffer, *(void *)&buffersize);
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x270EDADB8]();
}

uint64_t proc_set_cpumon_params_fatal()
{
  return MEMORY[0x270EDADC0]();
}