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
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.WebSheet.axbundle"],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F497190 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F092A0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXServerCacheSetEnabled()
{
  return MEMORY[0x270F808A8]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromPoint(NSPoint aPoint)
{
  return (NSString *)MEMORY[0x270EF2C10]((__n128)aPoint, *(__n128 *)&aPoint.y);
}

uint64_t _AXAddToElementCache()
{
  return MEMORY[0x270F09920]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x270F09930]();
}

uint64_t _AXElementForAXUIElementUniqueId()
{
  return MEMORY[0x270F09938]();
}

uint64_t _AXUIElementCreateAppElementWithPid()
{
  return MEMORY[0x270F09978]();
}

uint64_t _UIAXInitializeConstantValues()
{
  return MEMORY[0x270F80A68]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}