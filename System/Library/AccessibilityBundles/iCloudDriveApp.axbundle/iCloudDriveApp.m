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
    || ([MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.iCloudDriveApp.axbundle"],
        v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedString_axBundle,
        accessibilityLocalizedString_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedString_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F843450 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

__CFString *_AXListModeStringFromListMode(uint64_t a1)
{
  if (a1 == 2)
  {
    v2 = @"listmode.table";
LABEL_5:
    accessibilityLocalizedString(v2);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a1 == 1)
  {
    v2 = @"listmode.thumbnails";
    goto LABEL_5;
  }
  v3 = &stru_26F843450;
  return v3;
}

id _AXTableOrCollectionView(void *a1)
{
  id v1 = a1;
  v2 = [v1 getTopDocumentListController];
  v3 = [v2 safeValueForKey:@"_containerViewController"];

  objc_opt_class();
  v4 = [v3 safeValueForKey:@"_childViewController"];
  v5 = __UIAccessibilityCastAsClass();

  MEMORY[0x24566BAA0](@"_UIDocumentPickerDocumentCollectionViewController");
  if (objc_opt_isKindOfClass())
  {
    v6 = @"collectionView";
LABEL_5:
    v7 = [v5 safeValueForKey:v6];
    goto LABEL_7;
  }
  MEMORY[0x24566BAA0](@"_UIDocumentPickerDocumentTableViewController");
  if (objc_opt_isKindOfClass())
  {
    v6 = @"tableView";
    goto LABEL_5;
  }
  v7 = 0;
LABEL_7:

  return v7;
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

uint64_t UIAXPhotoDescriptionString()
{
  return MEMORY[0x270F097C8]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
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

void abort(void)
{
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}