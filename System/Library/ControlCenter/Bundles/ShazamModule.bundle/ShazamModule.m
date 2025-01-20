uint64_t sub_2406A12A8(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t vars8;

  [*(id *)(a1 + 32) refreshState];
  [*(id *)(a1 + 32) configureMenuItems];
  result = [*(id *)(a1 + 32) isExpanded];
  if ((result & 1) == 0)
  {
    v3 = *(void *)(a1 + 32);
    return MEMORY[0x270F9A6D0](v3, sel_updateStatusMessage);
  }
  return result;
}

uint64_t sub_2406A13EC(uint64_t a1)
{
  int v2 = *(unsigned __int8 *)(a1 + 40);
  v3 = *(void **)(a1 + 32);
  if (v2)
  {
    [v3 setSelected:0];
    v4 = *(void **)(a1 + 32);
  }
  else
  {
    [v3 setSelected:*(unsigned __int8 *)(a1 + 41)];
    v5 = *(void **)(a1 + 32);
    [v5 isSelected];
    v4 = v5;
  }

  return MEMORY[0x270F9A6D0](v4, sel_setGlyphState_);
}

void sub_2406A1558(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) contentModuleContext];
  int v2 = [MEMORY[0x263F33CD8] statusUpdateWithMessage:*(void *)(a1 + 40) type:*(void *)(a1 + 48)];
  [v3 enqueueStatusUpdate:v2];
}

void sub_2406A1670(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    int v2 = WeakRetained;
    [WeakRetained[158] dismissModule];
    WeakRetained = v2;
  }
}

uint64_t sub_2406A1784(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2406A1928(uint64_t a1, char a2, void *a3)
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v5 = a3;
  if ((a2 & 1) == 0)
  {
    v6 = shcore_log_object();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v7 = 138412290;
      id v8 = v5;
      _os_log_impl(&dword_24069F000, v6, OS_LOG_TYPE_ERROR, "Failed to access Shazam, %@", (uint8_t *)&v7, 0xCu);
    }
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void sub_2406A1D50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_2406A1D78(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissModule];
  int v2 = [WeakRetained toggleManager];
  [v2 toggleRecognitionState];

  return 0;
}

void sub_2406A1EE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_2406A1F08(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained dismissModule];
  [WeakRetained presentHistoryWithAuthentication];

  return 0;
}

void sub_2406A1FE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2406A2004(uint64_t a1, char a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
  {
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = sub_2406A20A0;
    v5[3] = &unk_2650CECE0;
    v5[4] = WeakRetained;
    [WeakRetained requestAuthenticationIfShazamIsInstalledAndProtected:v5];
  }
  else
  {
    [WeakRetained dismissModule];
  }
}

uint64_t sub_2406A20A0(uint64_t a1, char a2)
{
  if (a2) {
    return MEMORY[0x270F9A6D0](MEMORY[0x263F17798], sel__presentMediaLibraryWithCompletionHandler_);
  }
  else {
    return [*(id *)(a1 + 32) dismissModule];
  }
}

void sub_2406A20C0(uint64_t a1, void *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v2 = a2;
  if (v2)
  {
    id v3 = shcore_log_object();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      int v4 = 138412290;
      id v5 = v2;
      _os_log_impl(&dword_24069F000, v3, OS_LOG_TYPE_ERROR, "Failed to present Shazam Library with error: %@", (uint8_t *)&v4, 0xCu);
    }
  }
}

void AudioServicesPlaySystemSoundWithCompletion(SystemSoundID inSystemSoundID, void *inCompletionBlock)
{
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
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

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t shcore_log_object()
{
  return MEMORY[0x270F63860]();
}