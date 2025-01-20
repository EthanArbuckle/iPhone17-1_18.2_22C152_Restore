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
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MobileStore.axbundle"],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F727900 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id starStringForStarCount(float a1)
{
  if (a1 > 1.0) {
    a1 = 1.0;
  }
  float v1 = a1 * 10.0;
  BOOL v2 = a1 <= 0.0;
  float v3 = 0.0;
  if (!v2) {
    float v3 = v1;
  }
  float v4 = (float)(rintf(v3) / 10.0) * 5.0;
  if (v4 <= (float)(int)v4)
  {
    v7 = UIAXStarRatingStringForRating();
  }
  else
  {
    v5 = NSString;
    v6 = accessibilityUIKitLocalizedString();
    v7 = objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
  }

  return v7;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x270EE7170]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

uint64_t GSEventGetLocationInWindow()
{
  return MEMORY[0x270F30610]();
}

uint64_t UIAXStarRatingStringForRating()
{
  return MEMORY[0x270F80920]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t accessibilityUIKitLocalizedString()
{
  return MEMORY[0x270F80B08]();
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

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}