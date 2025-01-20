void sub_2405F9AEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  id *v33;

  _Block_object_dispose(&a33, 8);
  objc_destroyWeak(v33);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_2405F9B4C(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = objc_opt_class();
  v5 = objc_msgSend_bundleForClass_(v1, v4, v3);
  v7 = objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)v2, &stru_26F4BA628, @"Accessibility");

  return v7;
}

uint64_t sub_2405F9BE0(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend__updateShortcutActionsIfVisible(a2, (const char *)a2, a3);
}

void sub_2405F9BE8(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateShortcutActionsIfVisible(WeakRetained, v1, v2);
}

void sub_2405F9C28(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateShortcutActionsIfVisible(WeakRetained, v1, v2);
}

uint64_t sub_2405F9D78(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateShortcutActions(*(void **)(a1 + 32), a2, a3);
}

void sub_2405FA03C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_2405FA064(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend_shortcutDelegate(WeakRetained, v2, v3);
  objc_msgSend_openAccessibilityShortcutSettings(v4, v5, v6);

  return 0;
}

void sub_2405FA1F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t sub_2405FA21C(uint64_t a1)
{
  uint64_t v2 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  int v6 = objc_msgSend_intValue(*(void **)(a1 + 32), v4, v5);
  objc_msgSend__toggleOption_(WeakRetained, v7, v6);

  objc_copyWeak(&v9, v2);
  AXPerformBlockOnMainThread();
  objc_destroyWeak(&v9);
  return 0;
}

void sub_2405FA2DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2405FA2F0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend__updateShortcutActions(WeakRetained, v1, v2);
}

uint64_t sub_2405FA560(uint64_t a1, const char *a2, uint64_t a3)
{
  v4 = objc_msgSend_server(MEMORY[0x263F22838], a2, a3);
  v7 = objc_msgSend_guidedAccessEffectiveAppBundleIdentifier(v4, v5, v6);
  *(unsigned char *)(*(void *)(a1 + 32) + 1264) = v7 == 0;

  return AXPerformBlockAsynchronouslyOnMainThread();
}

uint64_t sub_2405FA618(uint64_t a1, const char *a2, uint64_t a3)
{
  return objc_msgSend__updateShortcutActions(*(void **)(a1 + 32), a2, a3);
}

void sub_2405FA828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2405FA840(uint64_t a1, void *a2, uint64_t a3)
{
  v4 = objc_msgSend_source(a2, (const char *)a2, a3);
  int isEqual = objc_msgSend_isEqual_(v4, v5, *MEMORY[0x263F22A08]);

  if (isEqual) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
}

Class sub_2405FAA20(uint64_t a1)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  v3[0] = 0;
  if (!qword_268C8AF40)
  {
    v3[1] = (void *)MEMORY[0x263EF8330];
    v3[2] = (void *)3221225472;
    v3[3] = sub_2405FAB64;
    v3[4] = &unk_2650C6BC8;
    v3[5] = v3;
    long long v4 = xmmword_2650C6BB0;
    uint64_t v5 = 0;
    qword_268C8AF40 = _sl_dlopen();
    if (!qword_268C8AF40)
    {
      abort_report_np();
LABEL_8:
      sub_2405FB1D0();
    }
    if (v3[0]) {
      free(v3[0]);
    }
  }
  Class result = objc_getClass("HUComfortSoundsSettings");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    goto LABEL_8;
  }
  qword_268C8AF38 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_2405FAB64()
{
  uint64_t result = _sl_dlopen();
  qword_268C8AF40 = result;
  return result;
}

void sub_2405FB1D0()
{
}

uint64_t AXCurrentRootDescription()
{
  return MEMORY[0x270F09188]();
}

uint64_t AXCurrentRootLooksLikeBNI()
{
  return MEMORY[0x270F09190]();
}

uint64_t AXIsInternalInstall()
{
  return MEMORY[0x270F09278]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x270F09428]();
}

uint64_t AXPerformBlockOnMainThread()
{
  return MEMORY[0x270F09430]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
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