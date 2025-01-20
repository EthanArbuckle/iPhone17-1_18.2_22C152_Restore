id AXWallpaperLabel(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t vars8;

  v27 = *MEMORY[0x263EF8340];
  v1 = a1;
  v2 = v1;
  if (AXWallpaperLabel_onceToken != -1)
  {
    dispatch_once(&AXWallpaperLabel_onceToken, &__block_literal_global);
    if (v2) {
      goto LABEL_3;
    }
LABEL_12:
    v23 = 0;
    goto LABEL_13;
  }
  if (!v1) {
    goto LABEL_12;
  }
LABEL_3:
  v3 = [v2 stringByReplacingOccurrencesOfString:@"@2x" withString:&stru_26F839440];

  v4 = [v3 stringByReplacingOccurrencesOfString:@"@3x" withString:&stru_26F839440];

  v5 = [v4 stringByReplacingOccurrencesOfString:@"~ipad" withString:&stru_26F839440];

  v6 = [v5 stringByReplacingOccurrencesOfString:@"~ipod" withString:&stru_26F839440];

  v7 = [v6 stringByReplacingOccurrencesOfString:@"~iphone" withString:&stru_26F839440];

  v8 = [v7 stringByReplacingOccurrencesOfString:@"-568h" withString:&stru_26F839440];

  v9 = [v8 stringByReplacingOccurrencesOfString:@"-163r" withString:&stru_26F839440];

  v10 = [v9 stringByReplacingOccurrencesOfString:@"-414w-736h" withString:&stru_26F839440];

  v11 = [v10 stringByReplacingOccurrencesOfString:@"-375w-667h" withString:&stru_26F839440];

  v12 = [v11 stringByReplacingOccurrencesOfString:@".png" withString:&stru_26F839440];

  v13 = [v12 stringByReplacingOccurrencesOfString:@".jpg" withString:&stru_26F839440];

  v14 = objc_msgSend(v13, "stringByReplacingOccurrencesOfString:withString:options:range:", @"-\\d{3,4}w-\\d{3,4}h", &stru_26F839440, 1024, 0, objc_msgSend(v13, "length"));

  v15 = [v14 stringByReplacingOccurrencesOfString:@"-marble" withString:&stru_26F839440];

  v16 = [v15 stringByReplacingOccurrencesOfString:@"-granite" withString:&stru_26F839440];

  v17 = [v16 stringByReplacingOccurrencesOfString:@"_iPad" withString:&stru_26F839440];

  v18 = objc_msgSend(v17, "stringByReplacingOccurrencesOfString:withString:options:range:", @"\\d{1,4}\\.", &stru_26F839440, 1024, 0, objc_msgSend(v17, "length"));

  v19 = AXLogAppAccessibility();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v25 = 138412290;
    v26 = v18;
    _os_log_impl(&dword_242729000, v19, OS_LOG_TYPE_INFO, "filename: %@", (uint8_t *)&v25, 0xCu);
  }

  v20 = [(id)AXWallpaperLabel_ImageMapping objectForKey:v18];
  if (!v20) {
    v20 = v18;
  }
  v21 = accessibilityLocalizedString(v20);
  if ([v21 length]) {
    v22 = v21;
  }
  else {
    v22 = v18;
  }
  v23 = v22;

LABEL_13:

  return v23;
}

uint64_t __AXWallpaperLabel_block_invoke()
{
  id v0 = objc_alloc(NSDictionary);
  if (AXDeviceIsPad()) {
    v1 = @"DarkBlueToLightGreenGradient";
  }
  else {
    v1 = @"GeodesicHexagons";
  }
  AXWallpaperLabel_ImageMapping = objc_msgSend(v0, "initWithObjectsAndKeys:", @"100", @"ColoredWave", @"100.CB_Wave", @"NebulaStars", @"101", @"EarthHorizon", @"102", @"NorthernLights", @"103", @"SnowyMountains", @"104", @"WinterLake", @"105", @"CloseUpWater", @"106", @"SunsetHillsVista", @"107",
                                    @"BlackAndWhiteLakeAndHills",
                                    @"108",
                                    @"GoldenGrassHills",
                                    @"109",
                                    @"OceanWaterOnBeach",
                                    @"110",
                                    @"CrashingWave",
                                    @"111",
                                    @"FrothyWave",
                                    @"112",
                                    @"WaterLilly",
                                    @"113",
                                    @"GoldenPoppyFlowers",
                                    @"114",
                                    @"FlowerBallsOnLongStalks",
                                    @"115",
                                    @"CloseUpGrass",
                                    @"116",
                                    @"CloseUpDewDrops",
                                    @"117",
                                    @"CloseUpBladeGrass",
                                    @"118",
                                    @"LightYellowToGreenishGradient",
                                    @"120",
                                    @"LightToDarkBlueGradient",
                                    @"121",
                                    v1,
                                    @"122",
                                    @"WoodCirclesInShingleFashion",
                                    @"123",
                                    @"FlecksOfColors",
                                    @"124",
                                    @"OverlappingSquares",
                                    @"125",
                                    @"ColoredOverlappingPatterns1",
                                    @"126",
                                    @"ColoredOverlappingPatterns2",
                                    @"127",
                                    @"GeodesicHexagons",
                                    @"128",
                                    @"RedDots",
                                    @"200",
                                    @"BrightYellowDots",
                                    @"201");

  return MEMORY[0x270F9A758]();
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
    v5 = [v2 localizedStringForKey:v1 value:&stru_26F839440 table:@"Accessibility"];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_24272BB6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
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

uint64_t AXAttributedStringForBetterPronuciation()
{
  return MEMORY[0x270F80888]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x270F091E0]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x270F092A0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x270F092D8]();
}

uint64_t AXPerformSafeBlock()
{
  return MEMORY[0x270F09460]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}