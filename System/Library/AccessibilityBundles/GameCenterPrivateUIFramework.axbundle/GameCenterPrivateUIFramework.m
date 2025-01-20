id AXGameCenterUIFrameworkLocString(void *a1)
{
  id v1;
  void *v2;
  uint64_t vars8;

  v1 = a1;
  if (AXGameCenterUIFrameworkLocString_onceToken != -1) {
    dispatch_once(&AXGameCenterUIFrameworkLocString_onceToken, &__block_literal_global);
  }
  if (AXGameCenterUIFrameworkLocString_bundle)
  {
    v2 = [(id)AXGameCenterUIFrameworkLocString_bundle localizedStringForKey:v1 value:&stru_26F6A8290 table:@"GameCenterUIFrameworkAccessibility"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void __AXGameCenterUIFrameworkLocString_block_invoke()
{
  v0 = (void *)MEMORY[0x263F086E0];
  MEMORY[0x24564D9B0]();
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  v1 = [v4 stringByAppendingPathComponent:@"GameCenterUIFramework.axbundle"];
  uint64_t v2 = [v0 bundleWithPath:v1];
  v3 = (void *)AXGameCenterUIFrameworkLocString_bundle;
  AXGameCenterUIFrameworkLocString_bundle = v2;
}

id AXGameCenterPrivateUIFrameworkLocString(void *a1)
{
  id v1 = a1;
  if (AXGameCenterPrivateUIFrameworkLocString_onceToken != -1) {
    dispatch_once(&AXGameCenterPrivateUIFrameworkLocString_onceToken, &__block_literal_global_0);
  }
  if (AXGameCenterPrivateUIFrameworkLocString_bundle)
  {
    uint64_t v2 = [(id)AXGameCenterPrivateUIFrameworkLocString_bundle localizedStringForKey:v1 value:&stru_26F6A8290 table:@"Accessibility"];
  }
  else
  {
    uint64_t v2 = 0;
  }

  return v2;
}

uint64_t __AXGameCenterPrivateUIFrameworkLocString_block_invoke()
{
  AXGameCenterPrivateUIFrameworkLocString_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.GameCenterPrivateUIFramework.axbundle"];

  return MEMORY[0x270F9A758]();
}

void sub_242152120(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F0A258]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSystemGetAccessibilityBundlesDirectoryPath()
{
  return MEMORY[0x270F0A320]();
}

CGFloat CGRectGetHeight(CGRect rect)
{
  MEMORY[0x270EE71A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  MEMORY[0x270EE71D8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  MEMORY[0x270EE71F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  MEMORY[0x270EE7218]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t UIAXStarRatingStringForRating()
{
  return MEMORY[0x270F80920]();
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

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
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