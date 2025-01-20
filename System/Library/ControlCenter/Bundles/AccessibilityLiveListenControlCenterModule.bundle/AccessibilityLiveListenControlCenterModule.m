void sub_242778CCC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

uint64_t sub_242778D08(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  int v3 = [WeakRetained isLiveListenEnabled];

  uint64_t v4 = *MEMORY[0x263F1CF38];
  if (!v3) {
    uint64_t v4 = 0;
  }
  return v4 | v1;
}

void sub_242778D68(uint64_t a1, char a2, double a3)
{
  objc_copyWeak(v5, (id *)(a1 + 32));
  char v6 = a2;
  v5[1] = *(id *)&a3;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(v5);
}

void sub_242778E08(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_242778E1C(uint64_t a1)
{
  uint64_t v2 = *(unsigned __int8 *)(a1 + 48);
  int v3 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained setIsLiveListenEnabled:v2];

  int v5 = *(unsigned __int8 *)(a1 + 48);
  id v6 = objc_loadWeakRetained(v3);
  v7 = (void *)MEMORY[0x263F1C6B0];
  if (v5)
  {
    double v8 = *(double *)(a1 + 40);
    v9 = [MEMORY[0x263F1C6C8] configurationWithPointSize:30.0];
    v10 = [v7 systemImageNamed:@"mic.and.signal.meter.fill" variableValue:v9 withConfiguration:v8];
    [v6 setGlyphImage:v10];
  }
  else
  {
    v9 = [MEMORY[0x263F1C6B0] systemImageNamed:@"mic.fill"];
    v10 = [MEMORY[0x263F1C6C8] configurationWithPointSize:30.0];
    v11 = [v9 imageByApplyingSymbolConfiguration:v10];
    [v6 setGlyphImage:v11];
  }
  id v12 = objc_loadWeakRetained(v3);
  [v12 _updateSelectedStatus];
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F0A228]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F0A250]();
}

uint64_t HAInitializeLogging()
{
  return MEMORY[0x270F39078]();
}

uint64_t UIAccessibilityControlCenterModuleExpandPlatterHint()
{
  return MEMORY[0x270F80960]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t hearingLocString()
{
  return MEMORY[0x270F394D8]();
}

uint64_t liveListenStreamSelected()
{
  return MEMORY[0x270F394E8]();
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}