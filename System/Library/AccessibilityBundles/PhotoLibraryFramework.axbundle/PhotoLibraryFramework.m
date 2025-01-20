id accessibilityLocalizedStringFromBundle(void *a1, void *a2)
{
  return accessibilityLocalizedStringFromBundleWithTable(a1, a2, @"Accessibility");
}

id accessibilityLocalizedStringFromBundleWithTable(void *a1, void *a2, uint64_t a3)
{
  id v5 = a1;
  v6 = v5;
  if (a2)
  {
    id v7 = [a2 localizedStringForKey:v5 value:&stru_26F41F300 table:a3];
  }
  else
  {
    id v7 = v5;
  }
  v8 = v7;

  return v8;
}

id accessibilityLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedString_axBundle;
  if (accessibilityLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    id v5 = [v2 localizedStringForKey:v1 value:&stru_26F41F300 table:@"Accessibility"];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id _createFormatDurationString(double a1, double a2)
{
  uint64_t v3 = MEMORY[0x2455E3190](1);
  v4 = MEMORY[0x2455E3190](1, a2);
  id v5 = objc_allocWithZone(NSString);
  v6 = accessibilityLocalizedString(@"slomo.trim.duration");
  id v7 = objc_msgSend(v5, "initWithFormat:", v6, v3, v4);

  uint64_t v8 = [v7 rangeOfString:v3];
  uint64_t v10 = v9;
  uint64_t v11 = [v7 rangeOfString:v4 options:4];
  uint64_t v13 = v12;
  v14 = (void *)[objc_allocWithZone(MEMORY[0x263F21660]) initWithString:v7];
  v15 = v14;
  v16 = (void *)MEMORY[0x263EFFB40];
  v17 = (void *)MEMORY[0x263F21740];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v18 = v8;
    v19 = (void *)MEMORY[0x263EFFB40];
    objc_msgSend(v14, "setAttribute:forKey:withRange:", *MEMORY[0x263EFFB40], *MEMORY[0x263F21740], v18, v10);
    v16 = v19;
  }
  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(v15, "setAttribute:forKey:withRange:", *v16, *v17, v11, v13);
  }

  return v15;
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F09240]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE71A0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t UIAccessibilityFrameForBounds()
{
  return MEMORY[0x270F80998]();
}

uint64_t UIAccessibilityMetadataDescriptionForImage()
{
  return MEMORY[0x270F097E0]();
}

uint64_t UIAccessibilityMetadataDescriptionForVideo()
{
  return MEMORY[0x270F097E8]();
}

uint64_t UIAccessibilityPointForPoint()
{
  return MEMORY[0x270F809D8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
}

void UIGraphicsEndImageContext(void)
{
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x270F06038]();
}

uint64_t UIKitAccessibilityLocalizedString()
{
  return MEMORY[0x270F80A40]();
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
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

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
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

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}