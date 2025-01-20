id accessibilityLocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t vars8;

  v1 = a1;
  v2 = [MEMORY[0x263F086E0] bundleForClass:objc_opt_class()];
  v3 = v2;
  if (v2)
  {
    v4 = [v2 localizedStringForKey:v1 value:&stru_26F772C58 table:@"Accessibility"];
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_242414CF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  MEMORY[0x270EE7238]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CGRect UIAccessibilityConvertFrameToScreenCoordinates(CGRect rect, UIView *view)
{
  MEMORY[0x270F05ED8](view, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

UIBezierPath *__cdecl UIAccessibilityConvertPathToScreenCoordinates(UIBezierPath *path, UIView *view)
{
  return (UIBezierPath *)MEMORY[0x270F05EE0](path, view);
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
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

uint64_t __UIAccessibilityGetAssociatedObject()
{
  return MEMORY[0x270F0A468]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F0A480]();
}

void abort(void)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
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

void objc_storeStrong(id *location, id obj)
{
}