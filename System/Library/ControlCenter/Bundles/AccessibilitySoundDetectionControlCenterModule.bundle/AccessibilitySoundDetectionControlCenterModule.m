uint64_t sub_2405FE364(uint64_t a1)
{
  return MEMORY[0x270F9A6D0](*(void *)(a1 + 32), sel__initializeViewContent);
}

id sub_2405FE5FC(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = [v3 localizedStringForKey:v2 value:&stru_26F4BB090 table:@"Accessibility"];

  return v4;
}

void sub_2405FEA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_2405FEA48(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v2 = [WeakRetained soundDetectionDelegate];
  [v2 openSoundDetectionSettings];

  return 0;
}

void sub_2405FEA8C(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _axSettingsDidChange];
}

uint64_t sub_2405FFA8C(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "_confirmedToggleSoundDetectionStatusForType:");
  }
  else {
    return [v1 _confirmedEnableSoundDetection:1];
  }
}

uint64_t sub_2405FFBF4(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  v1 = *(void **)(a1 + 40);
  if (v2) {
    return objc_msgSend(v1, "_confirmedToggleSoundDetectionStatusForCustomType:");
  }
  else {
    return [v1 _confirmedEnableSoundDetection:1];
  }
}

void sub_240601020(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)&STACK[0x380]);
  _Unwind_Resume(a1);
}

uint64_t sub_240601310(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 category];
  if ([v3 isEqualToString:*MEMORY[0x263F21CB0]]) {
    uint64_t v4 = [v2 isModelReady];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_24060137C(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 category];
  if ([v3 isEqualToString:*MEMORY[0x263F21CA0]]) {
    uint64_t v4 = [v2 isModelReady];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t sub_2406013E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D58]];

  return 0;
}

uint64_t sub_240601428(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D88]];

  return 0;
}

uint64_t sub_240601468(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D90]];

  return 0;
}

uint64_t sub_2406014A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _toggleSoundDetectionStatusForCustomType:*(void *)(a1 + 32)];

  return 0;
}

uint64_t sub_2406014E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D28]];

  return 0;
}

uint64_t sub_240601524(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D40]];

  return 0;
}

uint64_t sub_240601564(uint64_t a1)
{
  v1 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D08]];

  id v3 = objc_loadWeakRetained(v1);
  [v3 _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D10]];

  id v4 = objc_loadWeakRetained(v1);
  [v4 _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D18]];

  return 0;
}

uint64_t sub_2406015E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D20]];

  return 0;
}

uint64_t sub_240601628(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D50]];

  return 0;
}

uint64_t sub_240601668(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D48]];

  return 0;
}

uint64_t sub_2406016A8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D60]];

  return 0;
}

uint64_t sub_2406016E8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D70]];

  return 0;
}

uint64_t sub_240601728(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D98]];

  return 0;
}

uint64_t sub_240601768(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _toggleSoundDetectionStatusForCustomType:*(void *)(a1 + 32)];

  return 0;
}

uint64_t sub_2406017A4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D38]];

  return 0;
}

uint64_t sub_2406017E4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D80]];

  return 0;
}

uint64_t sub_240601824(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _toggleSoundDetectionStatusForType:*MEMORY[0x263F21D30]];

  return 0;
}

uint64_t AXDeviceSupportsConcurrentHPLPMics()
{
  return MEMORY[0x270F0A038]();
}

uint64_t AXLogUltron()
{
  return MEMORY[0x270F093E0]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
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