id AXMapsStringForContaineeLayout(uint64_t a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  uint64_t vars8;

  v1 = @"CARD_SIZE_FULL";
  if (a1 == 2) {
    v1 = @"CARD_SIZE_MEDIUM";
  }
  if (a1 == 1) {
    v2 = @"CARD_SIZE_SMALL";
  }
  else {
    v2 = v1;
  }
  v3 = AXMapsLocString(v2);

  return v3;
}

id AXMapsStringForManeuverType(int a1)
{
  v2 = 0;
  v4 = @"GEOManeuverType_NO_TURN";
  switch(a1)
  {
    case 0:
      goto LABEL_3;
    case 1:
      v4 = @"GEOManeuverType_LEFT_TURN";
      goto LABEL_3;
    case 2:
      v4 = @"GEOManeuverType_RIGHT_TURN";
      goto LABEL_3;
    case 3:
      v4 = @"GEOManeuverType_STRAIGHT_AHEAD";
      goto LABEL_3;
    case 4:
      v4 = @"GEOManeuverType_U_TURN";
      goto LABEL_3;
    case 5:
      v4 = @"GEOManeuverType_FOLLOW_ROAD";
      goto LABEL_3;
    case 6:
      v4 = @"GEOManeuverType_ENTER_ROUNDABOUT";
      goto LABEL_3;
    case 7:
      v4 = @"GEOManeuverType_EXIT_ROUNDABOUT";
      goto LABEL_3;
    case 11:
      v4 = @"GEOManeuverType_OFF_RAMP";
      goto LABEL_3;
    case 12:
      v4 = @"GEOManeuverType_ON_RAMP";
      goto LABEL_3;
    case 16:
      v4 = @"GEOManeuverType_ARRIVE_END_OF_NAVIGATION";
      goto LABEL_3;
    case 17:
      v4 = @"GEOManeuverType_START_ROUTE";
      goto LABEL_3;
    case 18:
      v4 = @"GEOManeuverType_ARRIVE_AT_DESTINATION";
      goto LABEL_3;
    case 20:
      v4 = @"GEOManeuverType_KEEP_LEFT";
      goto LABEL_3;
    case 21:
      v4 = @"GEOManeuverType_KEEP_RIGHT";
      goto LABEL_3;
    case 22:
      v4 = @"GEOManeuverType_ENTER_FERRY";
      goto LABEL_3;
    case 23:
      v4 = @"GEOManeuverType_EXIT_FERRY";
      goto LABEL_3;
    case 24:
      v4 = @"GEOManeuverType_CHANGE_FERRY";
      goto LABEL_3;
    case 25:
      v4 = @"GEOManeuverType_START_ROUTE_WITH_U_TURN";
      goto LABEL_3;
    case 26:
      v4 = @"GEOManeuverType_U_TURN_AT_ROUNDABOUT";
      goto LABEL_3;
    case 27:
      v4 = @"GEOManeuverType_LEFT_TURN_AT_END";
      goto LABEL_3;
    case 28:
      v4 = @"GEOManeuverType_RIGHT_TURN_AT_END";
      goto LABEL_3;
    case 29:
      v4 = @"GEOManeuverType_HIGHWAY_OFF_RAMP_LEFT";
      goto LABEL_3;
    case 30:
      v4 = @"GEOManeuverType_HIGHWAY_OFF_RAMP_RIGHT";
      goto LABEL_3;
    case 33:
      v4 = @"GEOManeuverType_ARRIVE_AT_DESTINATION_LEFT";
      goto LABEL_3;
    case 34:
      v4 = @"GEOManeuverType_ARRIVE_AT_DESTINATION_RIGHT";
      goto LABEL_3;
    case 35:
      v4 = @"GEOManeuverType_U_TURN_WHEN_POSSIBLE";
      goto LABEL_3;
    case 39:
      v4 = @"GEOManeuverType_ARRIVE_END_OF_DIRECTIONS";
      goto LABEL_3;
    case 41:
    case 42:
    case 43:
    case 44:
    case 45:
    case 46:
    case 47:
    case 48:
    case 49:
    case 50:
    case 51:
    case 52:
    case 53:
    case 54:
    case 55:
    case 56:
    case 57:
    case 58:
    case 59:
      v4 = @"GEOManeuverType_ROUNDABOUT_EXIT";
      goto LABEL_3;
    case 60:
      v4 = @"GEOManeuverType_SHARP_LEFT_TURN";
      goto LABEL_3;
    case 61:
      v4 = @"GEOManeuverType_SHARP_RIGHT_TURN";
      goto LABEL_3;
    case 62:
      v4 = @"GEOManeuverType_SLIGHT_LEFT_TURN";
      goto LABEL_3;
    case 63:
      v4 = @"GEOManeuverType_SLIGHT_RIGHT_TURN";
      goto LABEL_3;
    case 64:
      v4 = @"GEOManeuverType_CHANGE_HIGHWAY";
      goto LABEL_3;
    case 65:
      v4 = @"GEOManeuverType_CHANGE_HIGHWAY_LEFT";
      goto LABEL_3;
    case 66:
      v4 = @"GEOManeuverType_CHANGE_HIGHWAY_RIGHT";
LABEL_3:
      v2 = AXMapsLocString(v4);
      break;
    default:
      break;
  }
  return v2;
}

id AXMapsStringForVehicleColor(void *a1)
{
  id v1 = a1;
  if (AXMapsStringForVehicleColor_onceToken != -1) {
    dispatch_once(&AXMapsStringForVehicleColor_onceToken, &__block_literal_global);
  }
  uint64_t v7 = 0;
  uint64_t v8 = 0;
  uint64_t v6 = 0;
  [v1 getRed:&v8 green:&v7 blue:&v6 alpha:0];
  if (AXColorsProbablyEqual())
  {
    v2 = @"VEHICLE_DARK_GRAY";
LABEL_8:
    uint64_t v3 = AXMapsLocString(v2);
    goto LABEL_9;
  }
  if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = @"VEHICLE_NAVY_BLUE";
    goto LABEL_8;
  }
  if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = @"VEHICLE_LIGHT_BLUE";
    goto LABEL_8;
  }
  if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = @"VEHICLE_BLUE";
    goto LABEL_8;
  }
  if ((AXColorsProbablyEqual() & 1) != 0 || AXColorsProbablyEqual())
  {
    v2 = @"VEHICLE_BEIGE";
    goto LABEL_8;
  }
  if (AXColorsProbablyEqual())
  {
    v2 = @"VEHICLE_WHITE";
    goto LABEL_8;
  }
  uint64_t v3 = AXColorStringForColor();
LABEL_9:
  v4 = (void *)v3;

  return v4;
}

uint64_t __AXMapsStringForVehicleColor_block_invoke()
{
  uint64_t v0 = [MEMORY[0x263F1C550] colorWithRed:0.388235 green:0.388235 blue:0.4 alpha:1.0];
  id v1 = (void *)AXMapsStringForVehicleColor_DarkGrayColor;
  AXMapsStringForVehicleColor_DarkGrayColor = v0;

  uint64_t v2 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.239216 blue:0.501961 alpha:1.0];
  uint64_t v3 = (void *)AXMapsStringForVehicleColor_NavyBlueColor;
  AXMapsStringForVehicleColor_NavyBlueColor = v2;

  uint64_t v4 = [MEMORY[0x263F1C550] colorWithRed:0.352941 green:0.784314 blue:0.980392 alpha:1.0];
  v5 = (void *)AXMapsStringForVehicleColor_LightBlueColor;
  AXMapsStringForVehicleColor_LightBlueColor = v4;

  uint64_t v6 = [MEMORY[0x263F1C550] colorWithRed:0.0 green:0.478431 blue:1.0 alpha:1.0];
  uint64_t v7 = (void *)AXMapsStringForVehicleColor_BlueColor;
  AXMapsStringForVehicleColor_BlueColor = v6;

  uint64_t v8 = [MEMORY[0x263F1C550] colorWithRed:0.701961 green:0.584314 blue:0.419608 alpha:1.0];
  v9 = (void *)AXMapsStringForVehicleColor_BeigeColor;
  AXMapsStringForVehicleColor_BeigeColor = v8;

  uint64_t v10 = [MEMORY[0x263F1C550] colorWithRed:0.949019 green:0.949019 blue:0.949019 alpha:1.0];
  v11 = (void *)AXMapsStringForVehicleColor_DarkModeWhiteColor;
  AXMapsStringForVehicleColor_DarkModeWhiteColor = v10;

  uint64_t v12 = [MEMORY[0x263F1C550] colorWithRed:0.701961 green:0.6 blue:0.454902 alpha:1.0];
  v13 = (void *)AXMapsStringForVehicleColor_DarkModeBeigeColor;
  AXMapsStringForVehicleColor_DarkModeBeigeColor = v12;

  uint64_t v14 = [MEMORY[0x263F1C550] colorWithRed:0.023529 green:0.298039 blue:0.6 alpha:1.0];
  v15 = (void *)AXMapsStringForVehicleColor_DarkModeNavyBlueColor;
  AXMapsStringForVehicleColor_DarkModeNavyBlueColor = v14;

  uint64_t v16 = [MEMORY[0x263F1C550] colorWithRed:0.39216 green:0.823529 blue:1.0 alpha:1.0];
  v17 = (void *)AXMapsStringForVehicleColor_DarkModeLightBlueColor;
  AXMapsStringForVehicleColor_DarkModeLightBlueColor = v16;

  AXMapsStringForVehicleColor_DarkModeBlueColor = [MEMORY[0x263F1C550] colorWithRed:0.03922 green:0.517647 blue:1.0 alpha:1.0];

  return MEMORY[0x270F9A758]();
}

void sub_24223E6EC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v3);
  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v4 - 80));
  objc_destroyWeak((id *)(v4 - 72));
  _Unwind_Resume(a1);
}

void sub_24223EC18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_242240854(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422411A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24224253C(_Unwind_Exception *a1)
{
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_242243418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422435F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2422440E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
}

void sub_24224438C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id AXVectorKitLocString(void *a1)
{
  id v1 = a1;
  if (AXVectorKitLocString_onceToken != -1) {
    dispatch_once(&AXVectorKitLocString_onceToken, &__block_literal_global_6);
  }
  if (AXVectorKitLocString_bundle)
  {
    uint64_t v2 = [(id)AXVectorKitLocString_bundle localizedStringForKey:v1 value:&stru_26F6E7138 table:@"Accessibility"];
  }
  else
  {
    uint64_t v2 = 0;
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
    uint64_t v2 = [(id)AXMapKitLocString_bundle localizedStringForKey:v1 value:&stru_26F6E7138 table:@"Accessibility"];
  }
  else
  {
    uint64_t v2 = 0;
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
    uint64_t v2 = [(id)AXMapsLocString_bundle localizedStringForKey:v1 value:&stru_26F6E7138 table:@"Accessibility-Maps"];
  }
  else
  {
    uint64_t v2 = 0;
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
  uint64_t v3 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  uint64_t v4 = [v2 stringByTrimmingCharactersInSet:v3];

  v5 = [v4 stringByTrimmingCharactersInSet:AXStringByReplacingMiddleDots_MiddleDotCharacterSet];

  uint64_t v6 = [v5 componentsSeparatedByCharactersInSet:AXStringByReplacingMiddleDots_MiddleDotCharacterSet];
  uint64_t v7 = objc_msgSend(v6, "ax_flatMappedArrayUsingBlock:", &__block_literal_global_296);

  uint64_t v8 = [v7 componentsJoinedByString:@", "];

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
  uint64_t v4 = [v2 whitespaceAndNewlineCharacterSet];
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
  uint64_t v10 = AXVectorKitLocString(@"BETWEEN_ADDRESS_RANGE");
  v11 = objc_msgSend(v9, "localizedStringWithFormat:", v10, v5);
  [v4 appendString:v11];

  int v8 = 1;
LABEL_6:
  uint64_t v12 = [v3 thoroughfare];

  if ([v12 length])
  {
    if (v6) {
      [v4 appendString:@" "];
    }
    if (v8)
    {
      v13 = NSString;
      uint64_t v14 = AXVectorKitLocString(@"ON_ROAD");
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
    uint64_t v16 = [v3 subLocality];

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
    uint64_t v12 = [v3 administrativeArea];

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

void sub_242246914(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24224A900(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_start(va, a8);
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

void sub_24224AC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24224B1F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_24224B650(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24224C260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24224C340(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_24224CA30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{
}

void sub_242250340(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t AXColorStringForColor()
{
  return MEMORY[0x270F09D40]();
}

uint64_t AXColorsProbablyEqual()
{
  return MEMORY[0x270F09D48]();
}

uint64_t AXDescriptionForHeadingInDegrees()
{
  return MEMORY[0x270F09198]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXLocalizedString()
{
  return MEMORY[0x270F0A1A0]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F092A0]();
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

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t UIAXArrayForString()
{
  return MEMORY[0x270F808D0]();
}

uint64_t UIAXFormatInteger()
{
  return MEMORY[0x270F808E0]();
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

uint64_t UIAXStringForAllChildren()
{
  return MEMORY[0x270F80938]();
}

BOOL UIAccessibilityIsSwitchControlRunning(void)
{
  return MEMORY[0x270F05F48]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x270F05F58]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
}

uint64_t UIAccessibilitySpeakAndDoNotBeInterrupted()
{
  return MEMORY[0x270F80A10]();
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

uint64_t _AXTraitsRemoveTrait()
{
  return MEMORY[0x270F09968]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x270F80A90]();
}

uint64_t _UIAccessibilityUnblockPostingOfNotification()
{
  return MEMORY[0x270F80AE8]();
}

uint64_t _UIImageIsSystemSymbol()
{
  return MEMORY[0x270F06368]();
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

uint64_t __UIAccessibilityCastAsSafeCategory()
{
  return MEMORY[0x270F09610]();
}

uint64_t __UIAccessibilitySafeClass()
{
  return MEMORY[0x270F09670]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}