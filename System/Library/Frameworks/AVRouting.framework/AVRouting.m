uint64_t getDADaemonSessionClass()
{
  uint64_t v0;
  void v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v0 = getDADaemonSessionClass_softClass;
  v8 = getDADaemonSessionClass_softClass;
  if (!getDADaemonSessionClass_softClass)
  {
    v2[0] = MEMORY[0x263EF8330];
    v2[1] = 3221225472;
    v2[2] = __getDADaemonSessionClass_block_invoke;
    v2[3] = &unk_264259CE8;
    v2[4] = &v3;
    __getDADaemonSessionClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_215723F9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2157242B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
}

void sub_2157247D0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_215725130(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t soft_DADeviceStateToString(uint64_t a1)
{
  uint64_t v5 = 0;
  v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v2 = (uint64_t (*)(uint64_t))getDADeviceStateToStringSymbolLoc_ptr;
  v8 = getDADeviceStateToStringSymbolLoc_ptr;
  if (!getDADeviceStateToStringSymbolLoc_ptr)
  {
    v3 = (void *)DeviceAccessLibrary();
    v6[3] = (uint64_t)dlsym(v3, "DADeviceStateToString");
    getDADeviceStateToStringSymbolLoc_ptr = (_UNKNOWN *)v6[3];
    uint64_t v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    soft_DADeviceStateToString_cold_1();
  }
  return v2(a1);
}

void sub_215725240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2157257C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215725CB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

Class __getDADaemonSessionClass_block_invoke(uint64_t a1)
{
  DeviceAccessLibrary();
  Class result = objc_getClass("DADaemonSession");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getDADaemonSessionClass_block_invoke_cold_1();
  }
  getDADaemonSessionClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t DeviceAccessLibrary()
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!DeviceAccessLibraryCore_frameworkLibrary)
  {
    v3[1] = MEMORY[0x263EF8330];
    v3[2] = 3221225472;
    v3[3] = __DeviceAccessLibraryCore_block_invoke;
    v3[4] = &__block_descriptor_40_e5_v8__0l;
    v3[5] = v3;
    long long v4 = xmmword_264259D08;
    uint64_t v5 = 0;
    DeviceAccessLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  uint64_t v0 = DeviceAccessLibraryCore_frameworkLibrary;
  uint64_t v1 = (void *)v3[0];
  if (!DeviceAccessLibraryCore_frameworkLibrary)
  {
    uint64_t v1 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v3[0]) {
LABEL_7:
  }
    free(v1);
  return v0;
}

uint64_t __DeviceAccessLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  DeviceAccessLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getDAPartialIPClass_block_invoke(uint64_t a1)
{
  DeviceAccessLibrary();
  Class result = objc_getClass("DAPartialIP");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getDAPartialIPClass_block_invoke_cold_1();
  }
  getDAPartialIPClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getDAEventDeviceClass_block_invoke(uint64_t a1)
{
  DeviceAccessLibrary();
  Class result = objc_getClass("DAEventDevice");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40)) {
    __getDAEventDeviceClass_block_invoke_cold_1();
  }
  getDAEventDeviceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  return result;
}

void *__getDADeviceStateToStringSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)DeviceAccessLibrary();
  Class result = dlsym(v2, "DADeviceStateToString");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getDADeviceStateToStringSymbolLoc_ptr = *(_UNKNOWN **)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _AVRoutingLog()
{
  if (_AVRoutingLog_onceToken != -1) {
    dispatch_once(&_AVRoutingLog_onceToken, &__block_literal_global);
  }
  return _log;
}

void soft_DADeviceStateToString_cold_1()
{
}

void __getDADaemonSessionClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getDAPartialIPClass_block_invoke_cold_1(v0);
}

void __getDAPartialIPClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getDAEventDeviceClass_block_invoke_cold_1(v0);
}

void __getDAEventDeviceClass_block_invoke_cold_1()
{
  uint64_t v0 = (void *)abort_report_np();
  _Block_object_assign(v0, v1, v2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

void nw_release(void *obj)
{
}

void *__cdecl nw_retain(void *obj)
{
  return (void *)MEMORY[0x270EF94A0](obj);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x270F9A6A0](location);
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}