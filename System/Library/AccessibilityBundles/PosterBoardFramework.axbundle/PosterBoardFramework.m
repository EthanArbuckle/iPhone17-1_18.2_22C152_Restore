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
    v5 = [v2 localizedStringForKey:v1 value:0 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id accessibilityLocalizedStringForJ7XX(void *a1)
{
  id v1 = a1;
  v2 = (void *)accessibilityLocalizedStringForJ7XX_axBundle;
  if (accessibilityLocalizedStringForJ7XX_axBundle
    || ([MEMORY[0x263F086E0] bundleForClass:objc_opt_class()],
        uint64_t v3 = objc_claimAutoreleasedReturnValue(),
        v4 = (void *)accessibilityLocalizedStringForJ7XX_axBundle,
        accessibilityLocalizedStringForJ7XX_axBundle = v3,
        v4,
        (v2 = (void *)accessibilityLocalizedStringForJ7XX_axBundle) != 0))
  {
    v5 = [v2 localizedStringForKey:v1 value:0 table:@"Accessibility-J717"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_242436630(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak((id *)(v23 - 112));
  objc_destroyWeak((id *)(v23 - 104));
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

void sub_242439790(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_242439900(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24243AA74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

uint64_t AXLockScreenPostersCount(void *a1)
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = objc_msgSend(a1, "_accessibilitySubviews", 0);
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = 0;
    uint64_t v5 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v1);
        }
        v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        MEMORY[0x24565BD30](@"PosterBoard.LockScreenPosterCollectionViewCell");
        if (objc_opt_isKindOfClass())
        {
          [v7 accessibilityFrame];
          if (v8 > 0.0) {
            ++v4;
          }
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v3);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4;
}

uint64_t AXPosterIdentity(void *a1, const char *a2)
{
  return [a1 safeValueForKeyPath:@"posterDescriptorLookupInfo.posterDescriptorPath.identity"];
}

id AXPosterProvider(void *a1)
{
  id v1 = [a1 safeValueForKeyPath:@"posterDescriptorLookupInfo.posterDescriptorPath.identity"];
  uint64_t v2 = [v1 safeStringForKey:@"provider"];

  return v2;
}

__CFString *AXWallpaperIdentifier(void *a1)
{
  id v1 = a1;
  uint64_t v2 = MEMORY[0x24565BD40](@"PBFPosterPreview");
  int v3 = [v1 conformsToProtocol:v2];

  if (!v3
    || ([v1 safeValueForKeyPath:@"posterDescriptorLookupInfo.posterDescriptorPath.identity"],
        uint64_t v4 = objc_claimAutoreleasedReturnValue(),
        [v4 safeStringForKey:@"descriptorIdentifier"],
        uint64_t v5 = (__CFString *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v6 = AXPreviewIdentifier(v1);
    v7 = [v6 componentsSeparatedByString:@":"];
    if ([v7 count] == 2)
    {
      double v8 = [v7 objectAtIndexedSubscript:0];
      char v9 = [v8 isEqualToString:@"com.apple.WatchFacesWallpaperSupport.KaleidoscopePoster"];

      if (v9)
      {
        long long v10 = @"KaleidoscopePoster";
      }
      else
      {
        long long v11 = [v7 objectAtIndexedSubscript:0];
        char v12 = [v11 isEqualToString:@"com.apple.WatchFacesWallpaperSupport.RhizomePoster"];

        if ((v12 & 1) == 0)
        {
          uint64_t v5 = [v7 objectAtIndexedSubscript:1];
          goto LABEL_11;
        }
        long long v10 = @"RhizomePoster";
      }
      long long v13 = NSString;
      v14 = [v7 objectAtIndexedSubscript:1];
      uint64_t v5 = [v13 stringWithFormat:@"%@:%@", v10, v14];
    }
    else
    {
      uint64_t v5 = &stru_26F77E3F0;
    }
LABEL_11:
  }

  return v5;
}

id AXPreviewIdentifier(void *a1)
{
  id v1 = [a1 safeUIViewForKey:@"_posterPreviewContentView"];
  uint64_t v2 = [v1 accessibilityIdentifier];

  return v2;
}

id AXMappedLabelOrValueForPosterPreview(void *a1)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v1 = AXWallpaperIdentifier(a1);
  uint64_t v2 = AXConvertWallpaperId(v1);

  int v3 = AXLogCommon();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    long long v10 = v2;
    _os_log_impl(&dword_242434000, v3, OS_LOG_TYPE_INFO, "WallpaperID: %@", buf, 0xCu);
  }

  uint64_t v4 = AXCFormattedString();
  uint64_t v5 = accessibilityLocalizedString(v4);
  if (!v5)
  {
    uint64_t v5 = accessibilityLocalizedStringForJ7XX(v4);
  }
  if (objc_msgSend(v5, "isEqualToString:", v4, v2)) {
    v6 = 0;
  }
  else {
    v6 = v5;
  }
  id v7 = v6;

  return v7;
}

__CFString *AXConvertWallpaperId(void *a1)
{
  id v1 = a1;
  if ([v1 isEqualToString:@"V01-Earth"])
  {
    uint64_t v2 = @"V01-Earth-Full";
  }
  else if ([v1 isEqualToString:@"V02-Moon"])
  {
    uint64_t v2 = @"V02-Moon-Full";
  }
  else
  {
    uint64_t v2 = (__CFString *)v1;
  }

  return v2;
}

uint64_t AXLayoutMode(void *a1)
{
  id v1 = AXCollectionViewController(a1);
  uint64_t v2 = [v1 safeSwiftValueForKey:@"layoutMode"];
  uint64_t v3 = AXConvertToLayoutMode();

  return v3;
}

id AXCollectionViewController(void *a1)
{
  id v1 = a1;
  objc_opt_class();
  uint64_t v2 = [v1 contentView];
  uint64_t v3 = [v2 window];
  uint64_t v4 = [v3 safeValueForKey:@"_delegateViewController"];
  uint64_t v5 = __UIAccessibilityCastAsClass();

  return v5;
}

id AXTopWidgetAndAppName(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 safeValueForKey:@"extensionIdentity"];
  uint64_t v3 = [v2 safeStringForKey:@"containerBundleIdentifier"];
  uint64_t v4 = AXAppNameForBundleId();

  uint64_t v5 = accessibilityLocalizedString(@"editing.wrapper.inline.complication.label");
  v6 = [v1 safeStringForKey:@"displayName"];

  char v9 = AXCFormattedString();
  id v7 = __UIAXStringForVariables();

  return v7;
}

void AXMapAppNameToWidgets(void *a1, void *a2)
{
  id v3 = a2;
  if (a1)
  {
    id v14 = v3;
    id v4 = a1;
    uint64_t v5 = [v4 safeValueForKey:@"extensionIdentity"];
    v6 = [v5 safeStringForKey:@"containerBundleIdentifier"];
    id v7 = AXAppNameForBundleId();

    double v8 = [v4 safeStringForKey:@"displayName"];

    if (v7 && v8)
    {
      char v9 = accessibilityLocalizedString(@"editing.wrapper.grouped.complication.label");
      long long v10 = AXCFormattedString();

      uint64_t v11 = objc_msgSend(v14, "objectForKey:", v7, v8);

      if (!v11)
      {
        char v12 = [MEMORY[0x263EFF980] array];
        [v14 setObject:v12 forKey:v7];
      }
      long long v13 = [v14 objectForKey:v7];
      [v13 axSafelyAddObject:v10];
    }
    id v3 = v14;
  }
}

id AXCenteredPosterCellInCollectionView(void *a1)
{
  id v1 = a1;
  [v1 contentOffset];
  CGFloat v3 = v2;
  [v1 contentOffset];
  CGFloat v5 = v4;
  [v1 visibleSize];
  CGFloat v7 = v6;
  [v1 visibleSize];
  CGFloat v9 = v8;
  v15.origin.x = v3;
  v15.origin.y = v5;
  v15.size.width = v7;
  v15.size.height = v9;
  double MidX = CGRectGetMidX(v15);
  v16.origin.x = v3;
  v16.origin.y = v5;
  v16.size.width = v7;
  v16.size.height = v9;
  uint64_t v11 = objc_msgSend(v1, "indexPathForItemAtPoint:", MidX, CGRectGetMidY(v16));
  if (v11)
  {
    char v12 = [v1 cellForItemAtIndexPath:v11];
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

uint64_t AXConvertToLayoutMode()
{
  type metadata accessor for PRUISSwitcherLayoutMode();
  swift_unknownObjectRetain_n();
  if (swift_dynamicCast()) {
    uint64_t v0 = v2;
  }
  else {
    uint64_t v0 = 0;
  }
  swift_unknownObjectRelease();
  return v0;
}

void type metadata accessor for PRUISSwitcherLayoutMode()
{
  if (!qword_268D54E28)
  {
    unint64_t ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1) {
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_268D54E28);
    }
  }
}

uint64_t AXConvertToLayoutMode(_:)()
{
  type metadata accessor for PRUISSwitcherLayoutMode();
  swift_unknownObjectRetain();
  if (swift_dynamicCast()) {
    return v1;
  }
  else {
    return 0;
  }
}

uint64_t AXAppNameForBundleId()
{
  return MEMORY[0x270F09D28]();
}

uint64_t AXCFormattedString()
{
  return MEMORY[0x270F09160]();
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXFormatAndListWithElements()
{
  return MEMORY[0x270F0A0F0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x270F09440]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F09540]();
}

uint64_t AXSafeProtocolFromString()
{
  return MEMORY[0x270F09548]();
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

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x270F099D8]();
}

uint64_t __UIAXStringForVariables()
{
  return MEMORY[0x270F80AF8]();
}

uint64_t __UIAccessibilityCastAsClass()
{
  return MEMORY[0x270F09600]();
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x270FA0260]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x270FA0370]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x270FA0590]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x270FA05A0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x270FA05A8]();
}