id InternalStorageDirectoryPath()
{
  void *v0;
  uint64_t vars8;

  if (InternalStorageDirectoryPath_onceToken != -1) {
    dispatch_once(&InternalStorageDirectoryPath_onceToken, &__block_literal_global_0);
  }
  v0 = (void *)InternalStorageDirectoryPath_path;
  return v0;
}

void __InternalStorageDirectoryPath_block_invoke()
{
  v0 = (void *)InternalStorageDirectoryPath_path;
  InternalStorageDirectoryPath_path = @"/var/db/accessoryupdater/uarp/";
}

id UARPStringDynamicAssetsFilepath()
{
  if (UARPStringDynamicAssetsFilepath_onceToken != -1) {
    dispatch_once(&UARPStringDynamicAssetsFilepath_onceToken, &__block_literal_global_1);
  }
  v0 = (void *)UARPStringDynamicAssetsFilepath_path;
  return v0;
}

void __UARPStringDynamicAssetsFilepath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"dynamicassets"];
  v2 = (void *)UARPStringDynamicAssetsFilepath_path;
  UARPStringDynamicAssetsFilepath_path = v1;
}

id UARPStringSupplementalAssetsFilepath()
{
  if (UARPStringSupplementalAssetsFilepath_onceToken != -1) {
    dispatch_once(&UARPStringSupplementalAssetsFilepath_onceToken, &__block_literal_global_741);
  }
  v0 = (void *)UARPStringSupplementalAssetsFilepath_path;
  return v0;
}

void __UARPStringSupplementalAssetsFilepath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"supplementalassets"];
  v2 = (void *)UARPStringSupplementalAssetsFilepath_path;
  UARPStringSupplementalAssetsFilepath_path = v1;
}

id UARPStringTempFilesFilepath()
{
  if (UARPStringTempFilesFilepath_onceToken != -1) {
    dispatch_once(&UARPStringTempFilesFilepath_onceToken, &__block_literal_global_743);
  }
  v0 = (void *)UARPStringTempFilesFilepath_path;
  return v0;
}

void __UARPStringTempFilesFilepath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmpfiles"];
  v2 = (void *)UARPStringTempFilesFilepath_path;
  UARPStringTempFilesFilepath_path = v1;
}

id UARPStringPcapFilesFilepath()
{
  if (UARPStringPcapFilesFilepath_onceToken != -1) {
    dispatch_once(&UARPStringPcapFilesFilepath_onceToken, &__block_literal_global_745);
  }
  v0 = (void *)UARPStringPcapFilesFilepath_path;
  return v0;
}

void __UARPStringPcapFilesFilepath_block_invoke()
{
  v0 = (void *)MEMORY[0x263EFF8C0];
  uint64_t v1 = InternalStorageDirectoryPath();
  objc_msgSend(v0, "arrayWithObjects:", v1, @"pcapfiles", 0);
  id v4 = (id)objc_claimAutoreleasedReturnValue();

  uint64_t v2 = [NSString pathWithComponents:v4];
  id v3 = (void *)UARPStringPcapFilesFilepath_path;
  UARPStringPcapFilesFilepath_path = v2;
}

id UARPPayloadHashAlgorithmStringToValue(void *a1)
{
  id v1 = a1;
  if ([v1 caseInsensitiveCompare:@"SHA-256"])
  {
    if ([v1 caseInsensitiveCompare:@"SHA-384"])
    {
      uint64_t v2 = [v1 caseInsensitiveCompare:@"SHA-512"];
      id v3 = NSNumber;
      if (v2) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = 3;
      }
    }
    else
    {
      id v3 = NSNumber;
      uint64_t v4 = 2;
    }
  }
  else
  {
    id v3 = NSNumber;
    uint64_t v4 = 1;
  }
  v5 = [v3 numberWithUnsignedShort:v4];

  return v5;
}

id UARPStringTmapDirectoryPath()
{
  if (UARPStringTmapDirectoryPath_onceToken != -1) {
    dispatch_once(&UARPStringTmapDirectoryPath_onceToken, &__block_literal_global_878);
  }
  v0 = (void *)UARPStringTmapDirectoryPath_path;
  return v0;
}

void __UARPStringTmapDirectoryPath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmap"];
  uint64_t v2 = (void *)UARPStringTmapDirectoryPath_path;
  UARPStringTmapDirectoryPath_path = v1;
}

id UARPStringTmapDatabaseFilePath()
{
  if (UARPStringTmapDatabaseFilePath_onceToken != -1) {
    dispatch_once(&UARPStringTmapDatabaseFilePath_onceToken, &__block_literal_global_880);
  }
  v0 = (void *)UARPStringTmapDatabaseFilePath_path;
  return v0;
}

void __UARPStringTmapDatabaseFilePath_block_invoke()
{
  v0 = NSString;
  UARPStringTmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"tmapdatabase"];
  uint64_t v2 = (void *)UARPStringTmapDatabaseFilePath_path;
  UARPStringTmapDatabaseFilePath_path = v1;
}

id UARPStringTapToRadarFilePath()
{
  if (UARPStringTapToRadarFilePath_onceToken != -1) {
    dispatch_once(&UARPStringTapToRadarFilePath_onceToken, &__block_literal_global_885);
  }
  v0 = (void *)UARPStringTapToRadarFilePath_path;
  return v0;
}

void __UARPStringTapToRadarFilePath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"taptoradar"];
  uint64_t v2 = (void *)UARPStringTapToRadarFilePath_path;
  UARPStringTapToRadarFilePath_path = v1;
}

id UARPStringLogsDirectoryFilePath()
{
  if (UARPStringLogsDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringLogsDirectoryFilePath_onceToken, &__block_literal_global_890);
  }
  v0 = (void *)UARPStringLogsDirectoryFilePath_path;
  return v0;
}

void __UARPStringLogsDirectoryFilePath_block_invoke()
{
  v0 = NSString;
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"logs"];
  uint64_t v2 = (void *)UARPStringLogsDirectoryFilePath_path;
  UARPStringLogsDirectoryFilePath_path = v1;
}

id UARPStringCrashAnalyticsDirectoryFilePath()
{
  if (UARPStringCrashAnalyticsDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringCrashAnalyticsDirectoryFilePath_onceToken, &__block_literal_global_895);
  }
  v0 = (void *)UARPStringCrashAnalyticsDirectoryFilePath_path;
  return v0;
}

void __UARPStringCrashAnalyticsDirectoryFilePath_block_invoke()
{
  v0 = NSString;
  UARPStringTapToRadarFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"crsh"];
  uint64_t v2 = (void *)UARPStringCrashAnalyticsDirectoryFilePath_path;
  UARPStringCrashAnalyticsDirectoryFilePath_path = v1;
}

id UARPStringCmapDirectoryPath()
{
  if (UARPStringCmapDirectoryPath_onceToken != -1) {
    dispatch_once(&UARPStringCmapDirectoryPath_onceToken, &__block_literal_global_966);
  }
  v0 = (void *)UARPStringCmapDirectoryPath_path;
  return v0;
}

void __UARPStringCmapDirectoryPath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"cmap"];
  uint64_t v2 = (void *)UARPStringCmapDirectoryPath_path;
  UARPStringCmapDirectoryPath_path = v1;
}

id UARPStringCmapDatabaseFilePath()
{
  if (UARPStringCmapDatabaseFilePath_onceToken != -1) {
    dispatch_once(&UARPStringCmapDatabaseFilePath_onceToken, &__block_literal_global_968);
  }
  v0 = (void *)UARPStringCmapDatabaseFilePath_path;
  return v0;
}

void __UARPStringCmapDatabaseFilePath_block_invoke()
{
  v0 = NSString;
  UARPStringCmapDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"cmapdatabase"];
  uint64_t v2 = (void *)UARPStringCmapDatabaseFilePath_path;
  UARPStringCmapDatabaseFilePath_path = v1;
}

id UARPStringSysdiagnoseDirectoryFilePath()
{
  if (UARPStringSysdiagnoseDirectoryFilePath_onceToken != -1) {
    dispatch_once(&UARPStringSysdiagnoseDirectoryFilePath_onceToken, &__block_literal_global_976);
  }
  v0 = (void *)UARPStringSysdiagnoseDirectoryFilePath_path;
  return v0;
}

void __UARPStringSysdiagnoseDirectoryFilePath_block_invoke()
{
  v0 = NSString;
  InternalStorageDirectoryPath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"sysdiagnose"];
  uint64_t v2 = (void *)UARPStringSysdiagnoseDirectoryFilePath_path;
  UARPStringSysdiagnoseDirectoryFilePath_path = v1;
}

id UARPStringPifMetricsFilePath()
{
  if (UARPStringPifMetricsFilePath_onceToken != -1) {
    dispatch_once(&UARPStringPifMetricsFilePath_onceToken, &__block_literal_global_981);
  }
  v0 = (void *)UARPStringPifMetricsFilePath_path;
  return v0;
}

void __UARPStringPifMetricsFilePath_block_invoke()
{
  v0 = NSString;
  UARPStringSysdiagnoseDirectoryFilePath();
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v1 = [v0 stringWithFormat:@"%@/%@", v3, @"com.apple.Bluetooth.AccessoryCase.pif_daily"];
  uint64_t v2 = (void *)UARPStringPifMetricsFilePath_path;
  UARPStringPifMetricsFilePath_path = v1;
}

__CFString *MapPreferenceSuiteToString(uint64_t a1)
{
  uint64_t v1 = @"com.apple.accessoryupdaterd";
  if (a1) {
    uint64_t v1 = 0;
  }
  if (a1 == 1) {
    return @"com.apple.AUDeveloperSettings";
  }
  else {
    return v1;
  }
}

void sub_2283EC0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBTextWelcomeControllerClass_block_invoke(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_2648399F8;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OBTextWelcomeController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getOBTextWelcomeControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBTextWelcomeControllerClass_softClass = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary = result;
  return result;
}

void sub_2283EC4A4(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2283EE1DC(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getOBTextWelcomeControllerClass()
{
  uint64_t v4 = 0;
  long long v5 = &v4;
  uint64_t v6 = 0x2050000000;
  v0 = (void *)getOBTextWelcomeControllerClass_softClass_0;
  uint64_t v7 = getOBTextWelcomeControllerClass_softClass_0;
  if (!getOBTextWelcomeControllerClass_softClass_0)
  {
    v3[0] = MEMORY[0x263EF8330];
    v3[1] = 3221225472;
    v3[2] = __getOBTextWelcomeControllerClass_block_invoke_0;
    v3[3] = &unk_2648399D8;
    v3[4] = &v4;
    __getOBTextWelcomeControllerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  id v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2283EF63C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2283EFC60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getOBTextWelcomeControllerClass_block_invoke_0(uint64_t a1)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  v4[0] = 0;
  if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
  {
    v4[1] = MEMORY[0x263EF8330];
    v4[2] = 3221225472;
    v4[3] = __OnBoardingKitLibraryCore_block_invoke_0;
    v4[4] = &__block_descriptor_40_e5_v8__0l;
    v4[5] = v4;
    long long v5 = xmmword_264839C00;
    uint64_t v6 = 0;
    OnBoardingKitLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    uint64_t v2 = (void *)v4[0];
    if (!OnBoardingKitLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_7;
    }
    if (v4[0]) {
      goto LABEL_8;
    }
  }
  while (1)
  {
    Class result = objc_getClass("OBTextWelcomeController");
    *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
    if (*(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24)) {
      break;
    }
LABEL_7:
    uint64_t v2 = (void *)__getOBTextWelcomeControllerClass_block_invoke_cold_1();
LABEL_8:
    free(v2);
  }
  getOBTextWelcomeControllerClass_softClass_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __OnBoardingKitLibraryCore_block_invoke_0()
{
  uint64_t result = _sl_dlopen();
  OnBoardingKitLibraryCore_frameworkLibrary_0 = result;
  return result;
}

void sub_2283F1068(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2283F23DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_2283F2890(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const char *AUDeveloperSettingsAccessoryFusingTypeToString(unint64_t a1)
{
  if (a1 > 3) {
    return "unrecognized";
  }
  else {
    return off_264839EA0[a1];
  }
}

uint64_t AUDeveloperSettingsAccessoryFusingStringToType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [NSString stringWithUTF8String:"Dev"];
  char v3 = [v1 isEqualToString:v2];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    long long v5 = [NSString stringWithUTF8String:"Prod"];
    char v6 = [v1 isEqualToString:v5];

    if (v6)
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Unfused"];
      char v8 = [v1 isEqualToString:v7];

      if (v8)
      {
        uint64_t v4 = 2;
      }
      else
      {
        v9 = [NSString stringWithUTF8String:"Pending"];
        int v10 = [v1 isEqualToString:v9];

        if (v10) {
          uint64_t v4 = 3;
        }
        else {
          uint64_t v4 = 4;
        }
      }
    }
  }

  return v4;
}

const char *AUDeveloperSettingsURLTypeToString(unint64_t a1)
{
  if (a1 > 6) {
    return "unrecognized";
  }
  else {
    return off_264839EC0[a1];
  }
}

uint64_t AUDeveloperSettingsURLStringToType(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [NSString stringWithUTF8String:"Livability"];
  char v3 = [v1 isEqualToString:v2];

  if (v3)
  {
    uint64_t v4 = 0;
  }
  else
  {
    long long v5 = [NSString stringWithUTF8String:"Internal Seed"];
    char v6 = [v1 isEqualToString:v5];

    if (v6)
    {
      uint64_t v4 = 1;
    }
    else
    {
      uint64_t v7 = [NSString stringWithUTF8String:"Customer"];
      char v8 = [v1 isEqualToString:v7];

      if (v8)
      {
        uint64_t v4 = 2;
      }
      else
      {
        v9 = [NSString stringWithUTF8String:"Public Seed"];
        char v10 = [v1 isEqualToString:v9];

        if (v10)
        {
          uint64_t v4 = 3;
        }
        else
        {
          v11 = [NSString stringWithUTF8String:"Basejumper"];
          char v12 = [v1 isEqualToString:v11];

          if (v12)
          {
            uint64_t v4 = 4;
          }
          else
          {
            v13 = [NSString stringWithUTF8String:"Custom Basejumper"];
            char v14 = [v1 isEqualToString:v13];

            if (v14)
            {
              uint64_t v4 = 5;
            }
            else
            {
              v15 = [NSString stringWithUTF8String:"Mesu Staging"];
              int v16 = [v1 isEqualToString:v15];

              if (v16) {
                uint64_t v4 = 6;
              }
              else {
                uint64_t v4 = 7;
              }
            }
          }
        }
      }
    }
  }

  return v4;
}

id getInfoForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = +[AUDeveloperSettingsDatabase sharedDatabase];
  char v3 = [v2 accessoriesDictionary];
  uint64_t v4 = [v3 objectForKeyedSubscript:v1];

  return v4;
}

BOOL configuredToDefaultAssetLocationForAccessory(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [v1 objectForKeyedSubscript:@"fusing"];
  BOOL v3 = (AUDeveloperSettingsAccessoryFusingStringToType(v2) & 5) != 0;
  uint64_t v4 = [v1 objectForKeyedSubscript:@"assetLocation"];

  uint64_t v5 = AUDeveloperSettingsURLStringToType(v4);
  return v5 == 2 * v3;
}

__CFString *getURLForAssetURLType(unint64_t a1)
{
  if (a1 <= 6 && ((0x75u >> a1) & 1) != 0)
  {
    uint64_t v2 = *off_264839EF8[a1];
  }
  else
  {
    uint64_t v2 = 0;
  }
  return v2;
}

void cleanupPersonalizedUpdateAvailable(void *a1)
{
  id v1 = a1;
  id v7 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v2 = [v7 accessoriesDictionary];
  BOOL v3 = [v2 objectForKey:v1];
  uint64_t v4 = (void *)[v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"downloadedVersion"];
  [v4 setObject:0 forKeyedSubscript:@"personalizationRequired"];
  uint64_t v5 = +[AUDeveloperSettingsDatabase sharedDatabase];
  char v6 = [NSDictionary dictionaryWithDictionary:v4];
  [v5 addAccessoryWithSerialNumber:v1 info:v6];
}

id findPartnerSerialNumbersInDatabase(void *a1)
{
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263EFF980] array];
  BOOL v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v4 = [v3 accessoriesDictionary];

  uint64_t v9 = MEMORY[0x263EF8330];
  uint64_t v10 = 3221225472;
  v11 = __findPartnerSerialNumbersInDatabase_block_invoke;
  char v12 = &unk_264839E80;
  id v13 = v1;
  id v14 = v2;
  id v5 = v2;
  id v6 = v1;
  [v4 enumerateKeysAndObjectsUsingBlock:&v9];
  id v7 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithArray:", v5, v9, v10, v11, v12);

  return v7;
}

void __findPartnerSerialNumbersInDatabase_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v5 = a2;
  [a3 objectForKeyedSubscript:@"partnerSerialNumbers"];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        if (objc_msgSend(*(id *)(*((void *)&v11 + 1) + 8 * i), "isEqualToString:", *(void *)(a1 + 32), (void)v11)&& (objc_msgSend(v5, "isEqualToString:", *(void *)(a1 + 32)) & 1) == 0)
        {
          [*(id *)(a1 + 40) addObject:v5];
          goto LABEL_12;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

id findPartnerSerialNumberForAccessory(void *a1)
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [v1 partnerSerialNumbers];
  if (![v2 count])
  {
    BOOL v3 = [v1 serialNumber];
    uint64_t v4 = findPartnerSerialNumbersInDatabase(v3);

    uint64_t v2 = (void *)v4;
  }
  v19 = [v1 hwFusingType];
  v20 = +[AUDeveloperSettingsDatabase sharedDatabase];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v2;
  uint64_t v5 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v10 = [v20 accessoriesDictionary];
        long long v11 = [v10 objectForKey:v9];

        long long v12 = [v11 objectForKey:@"fusing"];
        if (v12)
        {
          [v1 serialNumber];
          long long v14 = v13 = v1;
          char v15 = [v9 isEqualToString:v14];

          id v1 = v13;
          if ((v15 & 1) == 0
            && (![v12 caseInsensitiveCompare:v19]
             || ([v19 isEqualToString:@"prod"] & 1) == 0
             && [v12 caseInsensitiveCompare:@"prod"]))
          {
            id v16 = v9;

            goto LABEL_17;
          }
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v16 = 0;
LABEL_17:

  return v16;
}

id getAccessoryDatabaseKeyForAccessoryID(void *a1)
{
  id v1 = a1;
  uint64_t v2 = (void *)MEMORY[0x263F38338];
  BOOL v3 = [v1 modelNumber];
  uint64_t v4 = [v2 findByAppleModelNumber:v3];

  if ([v4 supportsInternalSettings]
    && ([v1 serialNumber], uint64_t v5 = objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    uint64_t v6 = +[AUDeveloperSettingsDatabase sharedDatabase];
    uint64_t v7 = [v6 accessoriesDictionary];
    uint64_t v8 = [v1 serialNumber];
    uint64_t v9 = [v7 objectForKey:v8];

    if (v9)
    {
      id v10 = [v1 serialNumber];
    }
    else
    {
      long long v12 = findPartnerSerialNumberForAccessory(v1);
      id v13 = [v6 accessoriesDictionary];
      uint64_t v9 = [v13 objectForKey:v12];

      if (v9) {
        id v10 = v12;
      }
      else {
        id v10 = 0;
      }
    }
    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

uint64_t isOTAUpdateDisabledForAccessoryID(void *a1)
{
  id v1 = getAccessoryDatabaseKeyForAccessoryID(a1);
  if (v1)
  {
    uint64_t v2 = +[AUDeveloperSettingsDatabase sharedDatabase];
    BOOL v3 = [v2 accessoriesDictionary];
    uint64_t v4 = [v3 objectForKey:v1];

    if (v4)
    {
      uint64_t v5 = [v4 objectForKeyedSubscript:@"isOTADisabled"];
      uint64_t v6 = [v5 BOOLValue];
    }
    else
    {
      uint64_t v6 = 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

void dropboxFileUpdateForAccessoryID(void *a1, void *a2)
{
  id v9 = a2;
  BOOL v3 = getAccessoryDatabaseKeyForAccessoryID(a1);
  if (v3)
  {
    uint64_t v4 = +[AUDeveloperSettingsDatabase sharedDatabase];
    uint64_t v5 = [v4 accessoriesDictionary];
    uint64_t v6 = [v5 objectForKey:v3];

    if (v6)
    {
      uint64_t v7 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v6];
      [v7 setObject:v9 forKeyedSubscript:@"dropboxVersion"];
      uint64_t v8 = [NSDictionary dictionaryWithDictionary:v7];
      [v4 addAccessoryWithSerialNumber:v3 info:v8];
    }
  }
}

void updateReachabilityForAccessoryID(void *a1, unsigned int a2)
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  id v2 = a1;
  BOOL v3 = +[AUDeveloperSettingsDatabase sharedDatabase];
  uint64_t v4 = v3;
  if (v2)
  {
    uint64_t v5 = getAccessoryDatabaseKeyForAccessoryID(v2);
    if (v5)
    {
      uint64_t v6 = (void *)v5;
      uint64_t v7 = +[AUDeveloperSettingsDatabase sharedDatabase];
      uint64_t v8 = [v7 accessoriesDictionary];
      id v9 = [v8 objectForKey:v6];

      if (v9)
      {
        id v10 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v9];
        id v11 = [NSNumber numberWithBool:a2];
        [v10 setObject:v11 forKeyedSubscript:@"accessoryReachable"];

        long long v12 = [NSDictionary dictionaryWithDictionary:v10];
        [v7 addAccessoryWithSerialNumber:v6 info:v12];
      }
    }
  }
  else
  {
    id v13 = [v3 accessoriesDictionary];
    long long v14 = [v13 allKeys];

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          long long v21 = [v4 accessoriesDictionary];
          long long v22 = [v21 objectForKey:v20];

          if (v22)
          {
            long long v23 = [MEMORY[0x263EFF9A0] dictionaryWithDictionary:v22];
            long long v24 = [NSNumber numberWithBool:a2];
            [v23 setObject:v24 forKeyedSubscript:@"accessoryReachable"];

            v25 = [NSDictionary dictionaryWithDictionary:v23];
            [v4 addAccessoryWithSerialNumber:v20 info:v25];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v17);
    }

    id v2 = 0;
  }
}

void sub_2283F5C40(_Unwind_Exception *a1)
{
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t __getOBTextWelcomeControllerClass_block_invoke_cold_1()
{
  uint64_t v0 = abort_report_np();
  return +[AUInternalSettingsController clearSettingsAssetLocationForFollowup](v0);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x270EE59C8](retstr, t, sx, sy);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t UARPFirmwareStagingCompletionStatusToString()
{
  return MEMORY[0x270F239E8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x270ED8458]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

void free(void *a1)
{
}

uid_t getuid(void)
{
  return MEMORY[0x270ED9DA0]();
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x270EDA760](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x270EDA770](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x270F9A658](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x270F9AA18](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x270F9AA20](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}