id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F833D40 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLookupButtonName(void *a1, void *a2)
{
  id v3 = a1;
  id v4 = a2;
  if ([v3 isEqualToString:@"pawprint.fill"])
  {
    if ([v4 isEqualToString:@"com.apple.argos.domain_key.cats"])
    {
      v5 = @"lookup.cat";
    }
    else if ([v4 isEqualToString:@"com.apple.argos.domain_key.dogs"])
    {
      v5 = @"lookup.dog";
    }
    else
    {
      v5 = @"lookup.pet";
    }
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"mappin.and.ellipse"])
  {
    v5 = @"lookup.landmarks";
LABEL_19:
    v6 = accessibilityLocalizedString(v5);
    goto LABEL_20;
  }
  if ([v3 isEqualToString:@"leaf.fill"])
  {
    v5 = @"lookup.plant";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"photo.fill"])
  {
    v5 = @"lookup.art";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"book.closed.fill"])
  {
    v5 = @"lookup.book";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"music"])
  {
    v5 = @"lookup.album";
    goto LABEL_19;
  }
  if ([v3 isEqualToString:@"music.on.film"])
  {
    v5 = @"lookup.media";
    goto LABEL_19;
  }
  v8 = AXLogAppAccessibility();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    accessibilityLookupButtonName_cold_1((uint64_t)v3, (uint64_t)v4, v8);
  }

  v6 = 0;
LABEL_20:

  return v6;
}

id AXImageAnalysisLabel(uint64_t a1)
{
  switch(a1)
  {
    case 2:
      v2 = @"appclip";
      goto LABEL_7;
    case 1:
      v2 = @"qrcode";
      goto LABEL_7;
    case 0:
      v2 = @"text";
LABEL_7:
      id v3 = accessibilityLocalizedString(v2);
      goto LABEL_11;
  }
  id v4 = AXLogAppAccessibility();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    AXImageAnalysisLabel_cold_1(a1, v4);
  }

  id v3 = 0;
LABEL_11:

  return v3;
}

void sub_242716080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
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

void accessibilityLookupButtonName_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_242713000, log, OS_LOG_TYPE_ERROR, "No lookup button name found for symbolName : %@, domainName : %@", (uint8_t *)&v3, 0x16u);
}

void AXImageAnalysisLabel_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 134217984;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_242713000, a2, OS_LOG_TYPE_ERROR, "VKImageAnalysisButtonMode unhandled : %lu", (uint8_t *)&v2, 0xCu);
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F0A1B8]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x270F809E0]();
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F0A428]();
}

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_storeStrong(id *location, id obj)
{
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}