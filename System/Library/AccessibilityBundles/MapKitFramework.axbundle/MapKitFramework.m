id AXVectorKitLocString(void *a1)
{
  id v1;
  void *v2;
  uint64_t vars8;

  v1 = a1;
  if (AXVectorKitLocString_onceToken != -1) {
    dispatch_once(&AXVectorKitLocString_onceToken, &__block_literal_global_0);
  }
  if (AXVectorKitLocString_bundle)
  {
    v2 = [(id)AXVectorKitLocString_bundle localizedStringForKey:v1 value:&stru_26F6DE2F0 table:@"Accessibility"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __AXVectorKitLocString_block_invoke()
{
  AXVectorKitLocString_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.VectorKit.axbundle"];

  return MEMORY[0x270F9A758]();
}

id AXMapKitLocString(void *a1)
{
  id v1 = a1;
  if (AXMapKitLocString_onceToken != -1) {
    dispatch_once(&AXMapKitLocString_onceToken, &__block_literal_global_276);
  }
  if (AXMapKitLocString_bundle)
  {
    v2 = [(id)AXMapKitLocString_bundle localizedStringForKey:v1 value:&stru_26F6DE2F0 table:@"Accessibility"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __AXMapKitLocString_block_invoke()
{
  AXMapKitLocString_bundle = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.MapKitFramework.axbundle"];

  return MEMORY[0x270F9A758]();
}

id AXMapsLocString(void *a1)
{
  id v1 = a1;
  if (AXMapsLocString_onceToken != -1) {
    dispatch_once(&AXMapsLocString_onceToken, &__block_literal_global_281);
  }
  if (AXMapsLocString_bundle)
  {
    v2 = [(id)AXMapsLocString_bundle localizedStringForKey:v1 value:&stru_26F6DE2F0 table:@"Accessibility-Maps"];
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

uint64_t __AXMapsLocString_block_invoke()
{
  AXMapsLocString_bundle = [MEMORY[0x263F086E0] accessibilityBundleWithLastPathComponent:@"Maps.axbundle"];

  return MEMORY[0x270F9A758]();
}

id AXStringByReplacingMiddleDots(void *a1)
{
  uint64_t v1 = AXStringByReplacingMiddleDots_onceToken;
  id v2 = a1;
  if (v1 != -1) {
    dispatch_once(&AXStringByReplacingMiddleDots_onceToken, &__block_literal_global_289);
  }
  v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v4 = [v2 stringByTrimmingCharactersInSet:v3];

  v5 = [v4 stringByTrimmingCharactersInSet:AXStringByReplacingMiddleDots_MiddleDotCharacterSet];

  v6 = [v5 componentsSeparatedByCharactersInSet:AXStringByReplacingMiddleDots_MiddleDotCharacterSet];
  v7 = objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_296_0);

  v8 = [v7 componentsJoinedByString:@", "];

  return v8;
}

uint64_t __AXStringByReplacingMiddleDots_block_invoke()
{
  AXStringByReplacingMiddleDots_MiddleDotCharacterSet = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"·"];

  return MEMORY[0x270F9A758]();
}

id __AXStringByReplacingMiddleDots_block_invoke_2(uint64_t a1, void *a2)
{
  id v2 = (void *)MEMORY[0x263F08708];
  id v3 = a2;
  v4 = [v2 whitespaceAndNewlineCharacterSet];
  v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (![v5 length])
  {

    v5 = 0;
  }

  return v5;
}

id AXShortAddressDescriptionForPlacemark(void *a1, int a2)
{
  id v3 = a1;
  id v4 = objc_alloc_init(MEMORY[0x263F089D8]);
  v5 = [v3 subThoroughfare];
  uint64_t v6 = [v5 length];
  BOOL v7 = v6 != 0;
  if (!v6) {
    goto LABEL_4;
  }
  if ([v5 rangeOfString:@"-"] == 0x7FFFFFFFFFFFFFFFLL)
  {
    [v4 appendString:v5];
LABEL_4:
    int v8 = 0;
    goto LABEL_6;
  }
  v9 = NSString;
  v10 = AXVectorKitLocString(@"BETWEEN_ADDRESS_RANGE");
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v5);
  [v4 appendString:v11];

  int v8 = 1;
LABEL_6:
  v12 = [v3 thoroughfare];

  if ([v12 length])
  {
    if (v6) {
      [v4 appendString:@" "];
    }
    if (v8)
    {
      v13 = NSString;
      v14 = AXVectorKitLocString(@"ON_ROAD");
      v15 = objc_msgSend(v13, "localizedStringWithFormat:", v14, v12);
      [v4 appendString:v15];
    }
    else
    {
      [v4 appendString:v12];
    }
    BOOL v7 = 1;
  }
  if (!v7 || a2)
  {
    v16 = [v3 subLocality];

    if ([v16 length])
    {
      if (v7) {
        [v4 appendString:@", "];
      }
      [v4 appendString:v16];
      BOOL v7 = 1;
    }
    v17 = [v3 locality];

    if ([v17 length])
    {
      if (v7) {
        [v4 appendString:@", "];
      }
      [v4 appendString:v17];
      BOOL v7 = 1;
    }
    v18 = [v3 subAdministrativeArea];

    if ([v18 length])
    {
      v19 = [v3 locality];
      char v20 = [v18 isEqualToString:v19];

      if ((v20 & 1) == 0)
      {
        if (v7) {
          [v4 appendString:@", "];
        }
        [v4 appendString:v18];
        BOOL v7 = 1;
      }
    }
    v12 = [v3 administrativeArea];

    if ([v12 length])
    {
      if (v7) {
        [v4 appendString:@", "];
      }
      [v4 appendString:v12];
    }
  }
  if ([v4 length])
  {
    id v21 = v4;
  }
  else
  {
    v22 = [v3 formattedAddressLines];
    id v21 = [v22 componentsJoinedByString:@"\n"];
  }

  return v21;
}

BOOL AXRequiresMapAccessibilityForAccessibilityTechnology()
{
  return UIAccessibilityIsVoiceOverRunning()
      || UIAccessibilityIsSwitchControlRunning()
      || _AXSCommandAndControlEnabled()
      || _AXSFullKeyboardAccessEnabled() != 0;
}

id AXNotificationsForMapAccessibilityClients()
{
  v4[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = *MEMORY[0x263F8B138];
  v4[0] = *MEMORY[0x263F8B3F0];
  v4[1] = v0;
  uint64_t v1 = *MEMORY[0x263F8B1B8];
  v4[2] = *MEMORY[0x263F8B178];
  v4[3] = v1;
  id v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:4];

  return v2;
}

uint64_t AXRequiresMapAccessibility()
{
  return 1;
}

uint64_t AXRequiresMapAccessibilityPurelyForAutomation()
{
  uint64_t result = _AXSAutomationEnabled();
  if (result) {
    return !AXRequiresMapAccessibilityForAccessibilityTechnology();
  }
  return result;
}

BOOL AXRequiresLongerTimeouts()
{
  if (UIAccessibilityIsVoiceOverRunning()) {
    return 1;
  }

  return UIAccessibilityIsSwitchControlRunning();
}

uint64_t AXPublisherDescriptionForAttribution(void *a1, const char *a2)
{
  return [a1 safeStringForKey:@"displayName"];
}

id AXPublisherDescriptionForCollection(void *a1)
{
  uint64_t v1 = [a1 safeValueForKey:@"publisherAttribution"];
  id v2 = [v1 safeStringForKey:@"displayName"];

  return v2;
}

void sub_242227DE8(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_2422294A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
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

void sub_242229B30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24222A6B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24222A96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AXDescriptionForHeadingInDegrees()
{
  return MEMORY[0x270F09F60]();
}

uint64_t AXFormatFloatWithPercentage()
{
  return MEMORY[0x270F0A108]();
}

uint64_t AXLocalizedString()
{
  return MEMORY[0x270F0A1A0]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F0A268]();
}

uint64_t AXRequestingClient()
{
  return MEMORY[0x270F09860]();
}

uint64_t AXSafeClassFromString()
{
  return MEMORY[0x270F0A308]();
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7180]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x270EE7250]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x270EE7260]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MNGetHoursAndMinutesForTimeInterval()
{
  return MEMORY[0x270F4DC58]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t UIAXLabelForElements()
{
  return MEMORY[0x270F808F8]();
}

uint64_t UIAXPriceRangeDescription()
{
  return MEMORY[0x270F80910]();
}

uint64_t UIAXStarRatingStringForRating()
{
  return MEMORY[0x270F80920]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

uint64_t UIAccessibilityPointToPoint()
{
  return MEMORY[0x270F809E0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t _AXAssert()
{
  return MEMORY[0x270F0A3E8]();
}

uint64_t _AXLogWithFacility()
{
  return MEMORY[0x270F0A408]();
}

uint64_t _AXSAutomationEnabled()
{
  return MEMORY[0x270F90600]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x270F906C0]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x270F90758]();
}

uint64_t _AXServerCacheGetPossiblyNilObjectForKey()
{
  return MEMORY[0x270F80A50]();
}

uint64_t _AXServerCacheInsertPossiblyNilObjectForKey()
{
  return MEMORY[0x270F80A58]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x270EE5648]();
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
  return MEMORY[0x270F0A418]();
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

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}