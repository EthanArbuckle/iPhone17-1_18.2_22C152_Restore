id accessibilityLocalizedString(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = (void *)MEMORY[0x263F086E0];
  v2 = a1;
  v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = localizedString(v3, @"Accessibility", (uint64_t)v2);

  return v4;
}

id localizedString(void *a1, uint64_t a2, uint64_t a3)
{
  if (a1)
  {
    a1 = [a1 localizedStringForKey:a3 value:&stru_26F6B4820 table:a2];
    uint64_t v3 = vars8;
  }
  return a1;
}

id accessibilityCinnamonLocalizedString(void *a1)
{
  v1 = (void *)MEMORY[0x263F086E0];
  id v2 = a1;
  uint64_t v3 = [v1 bundleForClass:objc_opt_class()];
  v4 = localizedString(v3, @"Accessibility-Cinnamon", (uint64_t)v2);

  return v4;
}

void sub_242183D78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
  _Block_object_dispose(va, 8);
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

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F0A418]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

void abort(void)
{
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_enumerationMutation(id obj)
{
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}