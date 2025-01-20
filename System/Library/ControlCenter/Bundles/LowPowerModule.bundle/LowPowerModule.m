void sub_24068A1EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_24068A4B4(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isExpanded]) {
    [*(id *)(a1 + 32) _configureMenu];
  }
  v2 = *(void **)(a1 + 32);
  if ([v2 isExpanded]) {
    uint64_t v3 = 0;
  }
  else {
    uint64_t v3 = [*(id *)(a1 + 32) isSelected];
  }
  [v2 setSelected:v3];
  v4 = *(void **)(a1 + 32);
  id v5 = [v4 glyphState];
  [v4 setGlyphState:v5];
}

void sub_24068A810(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_24068A850(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained toggleLowPowerMode];

  return 0;
}

uint64_t sub_24068A884(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained toggleMobileChargeMode];

  id v3 = objc_loadWeakRetained(v1);
  [v3 refreshStateAnimated:1];

  return 0;
}

id sub_24068AB38()
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  v0 = (void **)qword_26AFC7ED8;
  uint64_t v7 = qword_26AFC7ED8;
  if (!qword_26AFC7ED8)
  {
    v1 = (void *)sub_24068B26C();
    v5[3] = (uint64_t)dlsym(v1, "PowerUIMCMStatusAsNotification");
    qword_26AFC7ED8 = v5[3];
    v0 = (void **)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0) {
    sub_24068B47C();
  }
  v2 = *v0;

  return v2;
}

void sub_24068AC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_24068AD88(uint64_t a1)
{
  return [*(id *)(a1 + 32) refreshStateAnimated:1];
}

void sub_24068AEB8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_24068AED4(uint64_t a1, int a2, void *a3)
{
  id v5 = a3;
  if (a2)
  {
    id v17 = v5;
    int v6 = *(unsigned __int8 *)(a1 + 40);
    uint64_t v7 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
    v8 = v7;
    v9 = (id *)(a1 + 32);
    if (v6)
    {
      v10 = [v7 localizedStringForKey:@"CONTROL_CENTER_STATUS_LOW_POWER_MODE_ON" value:&stru_26F4CCA10 table:0];

      id WeakRetained = objc_loadWeakRetained(v9);
      v12 = [WeakRetained contentModuleContext];
      v13 = (void *)MEMORY[0x263F33CD8];
      v14 = v10;
      uint64_t v15 = 1;
    }
    else
    {
      v10 = [v7 localizedStringForKey:@"CONTROL_CENTER_STATUS_LOW_POWER_MODE_OFF" value:&stru_26F4CCA10 table:0];

      id WeakRetained = objc_loadWeakRetained(v9);
      v12 = [WeakRetained contentModuleContext];
      v13 = (void *)MEMORY[0x263F33CD8];
      v14 = v10;
      uint64_t v15 = 2;
    }
    v16 = [v13 statusUpdateWithMessage:v14 type:v15];
    [v12 enqueueStatusUpdate:v16];

    id v5 = v17;
  }
}

Class sub_24068B214(uint64_t a1)
{
  sub_24068B26C();
  Class result = objc_getClass("PowerUISmartChargeClient");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    sub_24068B52C();
  }
  qword_26AFC7EE0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_24068B26C()
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  v2[0] = 0;
  if (!qword_26AFC7ED0)
  {
    v2[1] = (void *)MEMORY[0x263EF8330];
    v2[2] = (void *)3221225472;
    v2[3] = sub_24068B364;
    v2[4] = &unk_2650CDE20;
    v2[5] = v2;
    long long v3 = xmmword_2650CDE08;
    uint64_t v4 = 0;
    qword_26AFC7ED0 = _sl_dlopen();
  }
  uint64_t v0 = qword_26AFC7ED0;
  if (!qword_26AFC7ED0) {
    sub_24068B5A8(v2);
  }
  if (v2[0]) {
    free(v2[0]);
  }
  return v0;
}

uint64_t sub_24068B364()
{
  uint64_t result = _sl_dlopen();
  qword_26AFC7ED0 = result;
  return result;
}

void *sub_24068B3D8(uint64_t a1)
{
  uint64_t v2 = (void *)sub_24068B26C();
  uint64_t result = dlsym(v2, "PowerUIMCMStatusAsNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  qword_26AFC7ED8 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_24068B428(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24068B444(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24068B47C()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"NSString *getPowerUIMCMStatusAsNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCUILowPowerModule.m", 22, @"%s", dlerror());

  __break(1u);
}

void sub_24068B4F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_24068B52C()
{
  uint64_t v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Class getPowerUISmartChargeClientClass(void)_block_invoke"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"CCUILowPowerModule.m", 21, @"Unable to find class %s", "PowerUISmartChargeClient");

  __break(1u);
}

void sub_24068B5A8(void *a1)
{
  uint64_t v2 = [MEMORY[0x263F08690] currentHandler];
  long long v3 = [NSString stringWithUTF8String:"void *PowerUILibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"CCUILowPowerModule.m", 20, @"%s", *a1);

  __break(1u);
  JUMPOUT(0x24068B628);
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x270F05EE8]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

void objc_release(id a1)
{
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}