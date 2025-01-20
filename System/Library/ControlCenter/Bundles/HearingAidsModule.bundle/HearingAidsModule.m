void sub_24064EBFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_24064EC38(uint64_t a1)
{
  uint64_t v1 = *MEMORY[0x263F1CEE8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = objc_msgSend_assetState(WeakRetained, v3, v4, v5);
    int isEqualToString = objc_msgSend_isEqualToString_(v7, v8, HACCIconAssetStateOff, v9);

    uint64_t v11 = *MEMORY[0x263F1CF68];
    if (isEqualToString) {
      uint64_t v11 = 0;
    }
    v1 |= v11;
  }

  return v1;
}

id sub_24064ECBC(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    v6 = objc_msgSend_assetState(WeakRetained, v2, v3, v4);
    if ((objc_msgSend_isEqualToString_(v6, v7, (uint64_t)HACCIconAssetStateSafe, v8) & 1) != 0
      || objc_msgSend_isEqualToString_(v6, v9, (uint64_t)HACCIconAssetStateWarning, v10))
    {
      uint64_t v11 = hearingLocString();
    }
    else
    {
      uint64_t v11 = 0;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

void sub_24064EEF0(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_24064EF2C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateSelectedStatus(WeakRetained, v1, v2, v3);
}

void sub_24064EF6C(uint64_t a1, char a2)
{
  objc_copyWeak(&v3, (id *)(a1 + 32));
  char v4 = a2;
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v3);
}

void sub_24064EFFC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24064F010(uint64_t a1)
{
  uint64_t v1 = *(unsigned __int8 *)(a1 + 40);
  uint64_t v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend_setIsLiveListenEnabled_(WeakRetained, v4, v1, v5);

  id v9 = objc_loadWeakRetained(v2);
  objc_msgSend__updateSelectedStatus(v9, v6, v7, v8);
}

id sub_24064F5BC(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void sub_24064F82C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24064F850(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_copyWeak(&v5, (id *)(a1 + 32));
  id v4 = v3;
  AXPerformBlockOnMainThread();

  objc_destroyWeak(&v5);
}

void sub_24064F904(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24064F918(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend_updateViewWithAudioSample_(WeakRetained, v2, *(void *)(a1 + 32), v3);
}

uint64_t AXLogAggregate()
{
  return MEMORY[0x270F0A1B0]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F0A228]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F0A250]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x270F18A48]();
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}