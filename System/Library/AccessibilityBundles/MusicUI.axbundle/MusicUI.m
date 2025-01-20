id accessibilityMusicUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityMusicUILocalizedString_axBundle;
  if (accessibilityMusicUILocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityMusicUILocalizedString_axBundle,
        accessibilityMusicUILocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityMusicUILocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F754630 table:@"MusicUIAccessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityMusicLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityMusicLocalizedString_axBundle;
  if (accessibilityMusicLocalizedString_axBundle) {
    goto LABEL_3;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = AXAccessibilityBundlesDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"Music.axbundle"];
  uint64_t v6 = [v3 bundleWithPath:v5];
  v7 = (void *)accessibilityMusicLocalizedString_axBundle;
  accessibilityMusicLocalizedString_axBundle = v6;

  v2 = (void *)accessibilityMusicLocalizedString_axBundle;
  if (accessibilityMusicLocalizedString_axBundle)
  {
LABEL_3:
    v8 = [v2 localizedStringForKey:v1 value:&stru_26F754630 table:@"Accessibility"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

void sub_2423A3DFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09ED8]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F09FE0]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
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