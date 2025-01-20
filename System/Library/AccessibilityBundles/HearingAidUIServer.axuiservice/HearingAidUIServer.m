void sub_2401D3188(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

Class __getCCSControlCenterServiceClass_block_invoke(uint64_t a1)
{
  ControlCenterServicesLibrary();
  Class result = objc_getClass("CCSControlCenterService");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSControlCenterServiceClass_block_invoke_cold_1();
  }
  getCCSControlCenterServiceClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void ControlCenterServicesLibrary()
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  v1[0] = 0;
  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
  {
    v1[1] = MEMORY[0x263EF8330];
    v1[2] = 3221225472;
    v1[3] = __ControlCenterServicesLibraryCore_block_invoke;
    v1[4] = &__block_descriptor_40_e5_v8__0l;
    v1[5] = v1;
    long long v2 = xmmword_2650A2410;
    uint64_t v3 = 0;
    ControlCenterServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  v0 = (void *)v1[0];
  if (!ControlCenterServicesLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    goto LABEL_7;
  }
  if (v1[0]) {
LABEL_7:
  }
    free(v0);
}

uint64_t __ControlCenterServicesLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  ControlCenterServicesLibraryCore_frameworkLibrary = result;
  return result;
}

Class __getCCSModulePresentationOptionsClass_block_invoke(uint64_t a1)
{
  ControlCenterServicesLibrary();
  Class result = objc_getClass("CCSModulePresentationOptions");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  if (!*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
    __getCCSModulePresentationOptionsClass_block_invoke_cold_1();
  }
  getCCSModulePresentationOptionsClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

void __getCCSControlCenterServiceClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  __getCCSModulePresentationOptionsClass_block_invoke_cold_1(v0);
}

void __getCCSModulePresentationOptionsClass_block_invoke_cold_1()
{
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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

void free(void *a1)
{
}

uint64_t hearingAidStreamSelected()
{
  return MEMORY[0x270F394B8]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
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

void objc_storeStrong(id *location, id obj)
{
}