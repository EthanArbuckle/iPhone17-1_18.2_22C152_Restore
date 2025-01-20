id accessibilityCameraUILocalizedString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t vars8;

  v1 = a1;
  v2 = (void *)accessibilityCameraUILocalizedString_axBundle;
  if (accessibilityCameraUILocalizedString_axBundle) {
    goto LABEL_4;
  }
  v3 = (void *)MEMORY[0x263F086E0];
  v4 = AXAccessibilityBundlesDirectory();
  v5 = [v4 stringByAppendingPathComponent:@"CameraUI.axbundle"];
  v6 = [v3 bundleWithPath:v5];
  v7 = (void *)accessibilityCameraUILocalizedString_axBundle;
  accessibilityCameraUILocalizedString_axBundle = v6;

  v2 = (void *)accessibilityCameraUILocalizedString_axBundle;
  if (accessibilityCameraUILocalizedString_axBundle
    || (_AXAssert(), (v2 = (void *)accessibilityCameraUILocalizedString_axBundle) != 0))
  {
LABEL_4:
    v8 = [v2 localizedStringForKey:v1 value:&stru_26F402D20 table:@"CameraUIStrings"];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

id accessibilityCameraKitLocalizedString(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityCameraKitLocalizedString_axBundle;
  if (accessibilityCameraKitLocalizedString_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityCameraKitLocalizedString_axBundle,
        accessibilityCameraKitLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityCameraKitLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F402D20 table:@"CameraKitStrings"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x270F09138]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F095D8]();
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