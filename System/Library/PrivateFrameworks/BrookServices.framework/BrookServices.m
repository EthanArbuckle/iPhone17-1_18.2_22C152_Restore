void sub_2399ED390(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2399ED4F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
}

dispatch_queue_t BRKCreateDispatchQueue(const char *a1, dispatch_qos_class_t a2)
{
  v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v5 = dispatch_queue_attr_make_with_qos_class(v4, a2, 0);

  if (a2 == QOS_CLASS_UTILITY)
  {
    v6 = _BRKSharedUtilityQueue();
    goto LABEL_5;
  }
  if (a2 == QOS_CLASS_BACKGROUND)
  {
    v6 = _BRKSharedBackgroundQueue();
LABEL_5:
    v7 = v6;
    dispatch_queue_t v8 = dispatch_queue_create_with_target_V2(a1, v5, v6);

    goto LABEL_7;
  }
  dispatch_queue_t v8 = dispatch_queue_create(a1, v5);
LABEL_7:

  return v8;
}

void sub_2399ED9C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2399EDE40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
}

id BRKLoggingObjectForDomain(uint64_t a1)
{
  if (BRKLoggingObjectForDomain_onceToken != -1) {
    dispatch_once(&BRKLoggingObjectForDomain_onceToken, &__block_literal_global_1);
  }
  v2 = (void *)BRKLoggingObjectForDomain_LogObjects;
  v3 = [NSNumber numberWithUnsignedInteger:a1];
  v4 = [v2 objectForKeyedSubscript:v3];

  return v4;
}

id _BRKSharedUtilityQueue()
{
  if (_BRKSharedUtilityQueue_onceToken != -1) {
    dispatch_once(&_BRKSharedUtilityQueue_onceToken, &__block_literal_global_33);
  }
  v0 = (void *)_BRKSharedUtilityQueue_Queue;
  return v0;
}

id BRKLocalizedUserNotificationString(void *a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a1;
  v7 = [a3 localizedStringForKey:v6 value:&stru_26ED23B60 table:0];
  dispatch_queue_t v8 = UNFormatLocalizedString();
  v9 = [MEMORY[0x263F1DEC8] localizedStringForKey:v6 arguments:v5 value:v8];

  return v9;
}

void sub_2399F0BCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __BRKLoggingObjectForDomain_block_invoke()
{
  id v6 = [MEMORY[0x263EFF9A0] dictionary];
  for (unint64_t i = -1; i != 14; ++i)
  {
    v1 = "default";
    if (i <= 0xD) {
      v1 = off_264DB65C0[i];
    }
    os_log_t v2 = os_log_create("Brook", v1);
    if (v2)
    {
      v3 = [NSNumber numberWithUnsignedInteger:i + 1];
      [v6 setObject:v2 forKeyedSubscript:v3];
    }
  }
  uint64_t v4 = [v6 copy];
  id v5 = (void *)BRKLoggingObjectForDomain_LogObjects;
  BRKLoggingObjectForDomain_LogObjects = v4;
}

uint64_t BRKIsInternalBuild()
{
  if (BRKIsInternalBuild_onceToken != -1) {
    dispatch_once(&BRKIsInternalBuild_onceToken, &__block_literal_global_2);
  }
  return BRKIsInternalBuild_isInternalBuild;
}

uint64_t __BRKIsInternalBuild_block_invoke()
{
  uint64_t result = MGGetBoolAnswer();
  BRKIsInternalBuild_isInternalBuild = result;
  return result;
}

uint64_t BRKIsInternalCarryEnabled()
{
  if (BRKIsInternalBuild_onceToken != -1) {
    dispatch_once(&BRKIsInternalBuild_onceToken, &__block_literal_global_2);
  }
  if (!BRKIsInternalBuild_isInternalBuild) {
    return 0;
  }
  v0 = (void *)CFPreferencesCopyAppValue(@"ExperimentGroup", @"com.apple.da");
  uint64_t v1 = [v0 isEqualToString:@"walkabout"];

  return v1;
}

id BRKBuildVersion()
{
  if (BRKBuildVersion_onceToken != -1) {
    dispatch_once(&BRKBuildVersion_onceToken, &__block_literal_global_12);
  }
  v0 = (void *)BRKBuildVersion_Build;
  return v0;
}

uint64_t __BRKBuildVersion_block_invoke()
{
  BRKBuildVersion_Build = MGGetStringAnswer();
  return MEMORY[0x270F9A758]();
}

__CFString *BRKDetectorVersion()
{
  v0 = [NSClassFromString(&cfstr_Brkassetsmanag.isa) sharedInstance];
  uint64_t v1 = [v0 installedAssetVersion];
  os_log_t v2 = v1;
  if (!v1) {
    uint64_t v1 = &stru_26ED23B60;
  }
  v3 = v1;

  return v3;
}

id BRKHardwareVersion()
{
  if (BRKHardwareVersion_onceToken != -1) {
    dispatch_once(&BRKHardwareVersion_onceToken, &__block_literal_global_23);
  }
  v0 = (void *)BRKHardwareVersion_HWVersion;
  return v0;
}

uint64_t __BRKHardwareVersion_block_invoke()
{
  BRKHardwareVersion_HWVersion = MGGetStringAnswer();
  return MEMORY[0x270F9A758]();
}

uint64_t BRKCurrentDeviceVariant()
{
  if (BRKCurrentDeviceVariant_onceToken != -1) {
    dispatch_once(&BRKCurrentDeviceVariant_onceToken, &__block_literal_global_28);
  }
  return BRKCurrentDeviceVariant_Device;
}

void __BRKCurrentDeviceVariant_block_invoke()
{
  uint64_t v0 = MGGetSInt32Answer();
  uint64_t v1 = v0;
  uint64_t v2 = 1;
  switch((int)v0)
  {
    case 12:
      goto LABEL_12;
    case 13:
      uint64_t v2 = 0;
      goto LABEL_12;
    case 14:
    case 15:
      goto LABEL_7;
    case 16:
      goto LABEL_10;
    case 17:
      uint64_t v2 = 3;
      goto LABEL_12;
    default:
      if (v0 == -1)
      {
        v3 = BRKLoggingObjectForDomain(0);
        if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
          __BRKCurrentDeviceVariant_block_invoke_cold_2(v3);
        }
      }
      else
      {
LABEL_7:
        uint64_t v4 = BRKLoggingObjectForDomain(0);
        if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
          __BRKCurrentDeviceVariant_block_invoke_cold_1(v1, v4);
        }
      }
LABEL_10:
      uint64_t v2 = 2;
LABEL_12:
      BRKCurrentDeviceVariant_Device = v2;
      return;
  }
}

id _BRKSharedBackgroundQueue()
{
  if (_BRKSharedBackgroundQueue_onceToken != -1) {
    dispatch_once(&_BRKSharedBackgroundQueue_onceToken, &__block_literal_global_36);
  }
  uint64_t v0 = (void *)_BRKSharedBackgroundQueue_Queue;
  return v0;
}

id BRKDeviceLocale()
{
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 localeIdentifier];

  return v1;
}

id BRKDeviceRegion()
{
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  uint64_t v1 = [v0 countryCode];

  return v1;
}

id BRKDeviceTimezone()
{
  uint64_t v0 = [MEMORY[0x263EFFA18] systemTimeZone];
  uint64_t v1 = [v0 abbreviation];

  return v1;
}

uint64_t BRKDeviceTimezoneOffset()
{
  uint64_t v0 = [MEMORY[0x263EFFA18] systemTimeZone];
  uint64_t v1 = [v0 secondsFromGMT];

  return v1;
}

id _BRKLocalesRequiringTallScript()
{
  v6[4] = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"th"];
  v6[0] = v0;
  uint64_t v1 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"vi"];
  v6[1] = v1;
  uint64_t v2 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"hi"];
  v6[2] = v2;
  v3 = [MEMORY[0x263EFF960] localeWithLocaleIdentifier:@"ar"];
  v6[3] = v3;
  uint64_t v4 = [MEMORY[0x263EFF8C0] arrayWithObjects:v6 count:4];

  return v4;
}

uint64_t BRKCurrentLanguageRequiresTallScript()
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  uint64_t v0 = [MEMORY[0x263EFF960] currentLocale];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v1 = _BRKLocalesRequiringTallScript();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v2)
  {
    uint64_t v3 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v2; ++i)
      {
        if (*(void *)v10 != v3) {
          objc_enumerationMutation(v1);
        }
        id v5 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * i), "languageCode", (void)v9);
        id v6 = [v0 languageCode];
        char v7 = [v5 isEqualToString:v6];

        if (v7)
        {
          uint64_t v2 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v2 = [v1 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v2) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v2;
}

void _BRKRegisterForLockedStatusChange()
{
  if (_BRKRegisterForLockedStatusChange_onceToken != -1) {
    dispatch_once(&_BRKRegisterForLockedStatusChange_onceToken, &__block_literal_global_57);
  }
}

__CFString *BRKDeviceLockStateChangedNotification()
{
  if (_BRKRegisterForLockedStatusChange_onceToken != -1) {
    dispatch_once(&_BRKRegisterForLockedStatusChange_onceToken, &__block_literal_global_57);
  }
  return @"BRKDeviceLockStateChangedNotification";
}

BOOL BRKDeviceIsLocked()
{
  if (_BRKRegisterForLockedStatusChange_onceToken != -1) {
    dispatch_once(&_BRKRegisterForLockedStatusChange_onceToken, &__block_literal_global_57);
  }
  int v0 = MKBGetDeviceLockState();
  if (v0) {
    BOOL v1 = v0 == 3;
  }
  else {
    BOOL v1 = 1;
  }
  return !v1;
}

BOOL BRKDeviceUnlockedSinceBoot()
{
  if (_BRKRegisterForLockedStatusChange_onceToken != -1) {
    dispatch_once(&_BRKRegisterForLockedStatusChange_onceToken, &__block_literal_global_57);
  }
  return MKBGetDeviceLockState() == 3 || MKBDeviceUnlockedSinceBoot() == 1;
}

__CFString *BRKDeviceOrientationDidChangeNotification()
{
  id v0 = +[_BRKDeviceOrientationNotificationProxy sharedInstance];
  return @"BRKDeviceOrientationDidChangeNotification";
}

uint64_t BRKWristOrientationIsRight()
{
  id v0 = +[_BRKDeviceOrientationNotificationProxy sharedInstance];
  uint64_t v1 = [v0 wristOrientationIsRight];

  return v1;
}

uint64_t BRKCrownOrientationIsRight()
{
  id v0 = +[_BRKDeviceOrientationNotificationProxy sharedInstance];
  uint64_t v1 = [v0 crownOrientationIsRight];

  return v1;
}

uint64_t _significantTimeChangeForScheduler(uint64_t a1, void *a2)
{
  return [a2 triggerNotification];
}

__CFString *BRKSignificantTimeChangeNotification()
{
  id v0 = +[_BRKSignificantTimeChangeNotifier sharedInstance];
  return @"_BRKSignificantTimeChangeNotification";
}

void BRKMarkFilePurgeable(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  id v1 = a1;
  if ([v1 isFileURL])
  {
    char v31 = 0;
    uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
    uint64_t v3 = [v1 path];
    int v4 = [v2 fileExistsAtPath:v3 isDirectory:&v31];

    if (v4)
    {
      if (v31)
      {
        long long v29 = 0u;
        long long v30 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v5 = [MEMORY[0x263F08850] defaultManager];
        id v6 = [v5 enumeratorAtURL:v1 includingPropertiesForKeys:0 options:3 errorHandler:0];

        uint64_t v7 = [v6 countByEnumeratingWithState:&v27 objects:v38 count:16];
        if (v7)
        {
          uint64_t v8 = v7;
          uint64_t v9 = *(void *)v28;
          do
          {
            for (uint64_t i = 0; i != v8; ++i)
            {
              if (*(void *)v28 != v9) {
                objc_enumerationMutation(v6);
              }
              BRKMarkFilePurgeable(*(void *)(*((void *)&v27 + 1) + 8 * i));
            }
            uint64_t v8 = [v6 countByEnumeratingWithState:&v27 objects:v38 count:16];
          }
          while (v8);
        }
      }
      else
      {
        uint64_t v26 = 66053;
        long long v11 = [v1 absoluteURL];
        long long v12 = [v11 path];

        id v6 = v12;
        int v13 = open((const char *)[v6 UTF8String], 0);
        if (v13 < 0)
        {
          v21 = BRKLoggingObjectForDomain(0);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            BRKMarkFilePurgeable_cold_1(v6, v21);
          }
        }
        else
        {
          int v14 = v13;
          int v15 = ffsctl(v13, 0xC0084A44uLL, &v26, 0);
          v16 = BRKLoggingObjectForDomain(0);
          v17 = v16;
          if (v15)
          {
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            {
              uint64_t v18 = [v6 UTF8String];
              v19 = __error();
              v20 = strerror(*v19);
              *(_DWORD *)buf = 136315906;
              uint64_t v33 = v18;
              __int16 v34 = 1024;
              *(_DWORD *)v35 = v15;
              *(_WORD *)&v35[4] = 2080;
              *(void *)&v35[6] = v20;
              __int16 v36 = 2048;
              uint64_t v37 = v26;
              _os_log_error_impl(&dword_2399EB000, v17, OS_LOG_TYPE_ERROR, "Failed to mark %s as purgeable %d (%s) (flags 0x%llx)", buf, 0x26u);
            }
          }
          else if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            uint64_t v22 = [v6 UTF8String];
            uint64_t v23 = v26;
            v24 = __error();
            v25 = strerror(*v24);
            *(_DWORD *)buf = 136315906;
            uint64_t v33 = v22;
            __int16 v34 = 2048;
            *(void *)v35 = v23;
            *(_WORD *)&v35[8] = 1024;
            *(_DWORD *)&v35[10] = 0;
            __int16 v36 = 2080;
            uint64_t v37 = (uint64_t)v25;
            _os_log_impl(&dword_2399EB000, v17, OS_LOG_TYPE_INFO, "Marked %s purgeable with flags 0x%llx returned %d (%s)", buf, 0x26u);
          }

          close(v14);
        }
      }
    }
  }
}

id _BRKFileAttributes(void *a1)
{
  id v1 = a1;
  if ([v1 isFileURL])
  {
    uint64_t v2 = [v1 absoluteURL];
    uint64_t v3 = [v2 path];

    int v4 = [MEMORY[0x263F08850] defaultManager];
    id v10 = 0;
    id v5 = [v4 attributesOfItemAtPath:v3 error:&v10];
    id v6 = v10;

    if (v5)
    {
      id v7 = v5;
    }
    else
    {
      uint64_t v8 = BRKLoggingObjectForDomain(0);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        _BRKFileAttributes_cold_1();
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

id BRKFileModifiedDate(void *a1)
{
  id v1 = _BRKFileAttributes(a1);
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F08048]];

  return v2;
}

uint64_t BRKFileSize(void *a1)
{
  id v1 = _BRKFileAttributes(a1);
  uint64_t v2 = [v1 objectForKeyedSubscript:*MEMORY[0x263F080B8]];
  uint64_t v3 = [v2 integerValue];

  return v3;
}

uint64_t BRKCreateDirectory(void *a1)
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v1 = a1;
  uint64_t v2 = [MEMORY[0x263F08850] defaultManager];
  char v3 = [v2 fileExistsAtPath:v1];

  if (v3)
  {
    uint64_t v4 = 1;
  }
  else
  {
    id v5 = [MEMORY[0x263F08850] defaultManager];
    id v13 = 0;
    uint64_t v4 = [v5 createDirectoryAtPath:v1 withIntermediateDirectories:1 attributes:0 error:&v13];
    id v6 = v13;

    id v7 = BRKLoggingObjectForDomain(0);
    uint64_t v8 = v7;
    if (v4)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [MEMORY[0x263F08850] defaultManager];
        id v10 = [MEMORY[0x263F08850] defaultManager];
        long long v11 = [v10 delegate];
        *(_DWORD *)buf = 138412802;
        id v15 = v1;
        __int16 v16 = 2112;
        v17 = v9;
        __int16 v18 = 2112;
        v19 = v11;
        _os_log_impl(&dword_2399EB000, v8, OS_LOG_TYPE_DEFAULT, "Created directory at path %@ %@ %@", buf, 0x20u);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      BRKCreateDirectory_cold_1();
    }
  }
  return v4;
}

BOOL BRKNumberIfFloatingPoint(void *a1)
{
  id v1 = a1;
  BOOL v2 = !strcmp((const char *)[v1 objCType], "f")
    || strcmp((const char *)[v1 objCType], "d") == 0;

  return v2;
}

id BRKDescriptionStringFromDictionary(void *a1)
{
  id v1 = (void *)MEMORY[0x263EFF980];
  id v2 = a1;
  char v3 = objc_msgSend(v1, "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __BRKDescriptionStringFromDictionary_block_invoke;
  v7[3] = &unk_264DB6658;
  id v8 = v3;
  id v4 = v3;
  [v2 enumerateKeysAndObjectsUsingBlock:v7];

  [v4 sortUsingComparator:&__block_literal_global_120];
  id v5 = [v4 componentsJoinedByString:@", "];

  return v5;
}

void __BRKDescriptionStringFromDictionary_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3 = *(void **)(a1 + 32);
  [NSString stringWithFormat:@"%@=%@", a2, a3];
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

uint64_t __BRKDescriptionStringFromDictionary_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t BRKIsRunningInCarousel()
{
  if (BRKIsRunningInCarousel_onceToken != -1) {
    dispatch_once(&BRKIsRunningInCarousel_onceToken, &__block_literal_global_125);
  }
  return BRKIsRunningInCarousel_RunningInCarousel;
}

void __BRKIsRunningInCarousel_block_invoke()
{
  id v1 = [MEMORY[0x263F01888] bundleProxyForCurrentProcess];
  id v0 = [v1 bundleIdentifier];
  BRKIsRunningInCarousel_RunningInCarousel = [v0 isEqualToString:@"com.apple.Carousel"];
}

id BRKBundle()
{
  if (BRKBundle_onceToken != -1) {
    dispatch_once(&BRKBundle_onceToken, &__block_literal_global_137);
  }
  id v0 = (void *)BRKBundle_Bundle;
  return v0;
}

void __BRKBundle_block_invoke()
{
  id v0 = (void *)MEMORY[0x263F086E0];
  id v3 = [NSURL fileURLWithPath:@"/System/Library/PrivateFrameworks/BrookDetector.framework/"];
  uint64_t v1 = [v0 bundleWithURL:v3];
  id v2 = (void *)BRKBundle_Bundle;
  BRKBundle_Bundle = v1;
}

id BRKPrimaryColor()
{
  id v0 = [MEMORY[0x263F1C550] systemBlueColor];
  uint64_t v1 = [MEMORY[0x263F1CB00] traitCollectionWithUserInterfaceStyle:2];
  id v2 = [v0 resolvedColorWithTraitCollection:v1];

  return v2;
}

uint64_t BRKActiveDeviceIsAltAccount()
{
  return 0;
}

uint64_t BRKDeviceIsAltAccount(void *a1)
{
  id v1 = a1;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x2020000000;
  id v2 = (void *)getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
  uint64_t v12 = getNRDevicePropertyIsAltAccountSymbolLoc_ptr;
  if (!getNRDevicePropertyIsAltAccountSymbolLoc_ptr)
  {
    v8[0] = MEMORY[0x263EF8330];
    v8[1] = 3221225472;
    v8[2] = __getNRDevicePropertyIsAltAccountSymbolLoc_block_invoke;
    v8[3] = &unk_264DB66A0;
    v8[4] = &v9;
    __getNRDevicePropertyIsAltAccountSymbolLoc_block_invoke((uint64_t)v8);
    id v2 = (void *)v10[3];
  }
  _Block_object_dispose(&v9, 8);
  if (!v2)
  {
    BRKDeviceIsAltAccount_cold_1();
    id v7 = v6;
    _Block_object_dispose(&v9, 8);
    _Unwind_Resume(v7);
  }
  id v3 = [v1 valueForProperty:*v2];
  uint64_t v4 = [v3 BOOLValue];

  return v4;
}

void *__getNRDevicePropertyIsAltAccountSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  v5[0] = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v5[1] = MEMORY[0x263EF8330];
    v5[2] = 3221225472;
    v5[3] = __NanoRegistryLibraryCore_block_invoke;
    v5[4] = &__block_descriptor_40_e5_v8__0l;
    v5[5] = v5;
    long long v6 = xmmword_264DB66C0;
    uint64_t v7 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
    id v3 = (void *)v5[0];
    id v2 = (void *)NanoRegistryLibraryCore_frameworkLibrary;
    if (NanoRegistryLibraryCore_frameworkLibrary)
    {
      if (!v5[0]) {
        goto LABEL_5;
      }
    }
    else
    {
      id v3 = (void *)abort_report_np();
    }
    free(v3);
    goto LABEL_5;
  }
  id v2 = (void *)NanoRegistryLibraryCore_frameworkLibrary;
LABEL_5:
  uint64_t result = dlsym(v2, "NRDevicePropertyIsAltAccount");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getNRDevicePropertyIsAltAccountSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __NanoRegistryLibraryCore_block_invoke()
{
  uint64_t result = _sl_dlopen();
  NanoRegistryLibraryCore_frameworkLibrary = result;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_2399F4790(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2399F5064(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t BRKIDSMessageReadFrom(uint64_t a1, uint64_t a2)
{
  id v3 = (int *)MEMORY[0x263F62298];
  uint64_t v4 = (int *)MEMORY[0x263F62288];
  id v5 = (int *)MEMORY[0x263F62270];
  if (*(void *)(a2 + (int)*MEMORY[0x263F62298]) < *(void *)(a2 + (int)*MEMORY[0x263F62288]))
  {
    uint64_t v7 = (int *)MEMORY[0x263F62268];
    while (2)
    {
      if (!*(unsigned char *)(a2 + *v5))
      {
        char v8 = 0;
        unsigned int v9 = 0;
        unint64_t v10 = 0;
        while (1)
        {
          uint64_t v11 = *v3;
          uint64_t v12 = *(void *)(a2 + v11);
          unint64_t v13 = v12 + 1;
          if (v12 == -1 || v13 > *(void *)(a2 + *v4)) {
            break;
          }
          char v14 = *(unsigned char *)(*(void *)(a2 + *v7) + v12);
          *(void *)(a2 + v11) = v13;
          v10 |= (unint64_t)(v14 & 0x7F) << v8;
          if ((v14 & 0x80) == 0) {
            goto LABEL_12;
          }
          v8 += 7;
          if (v9++ >= 9)
          {
            unint64_t v10 = 0;
            int v16 = *(unsigned __int8 *)(a2 + *v5);
            goto LABEL_14;
          }
        }
        *(unsigned char *)(a2 + *v5) = 1;
LABEL_12:
        int v16 = *(unsigned __int8 *)(a2 + *v5);
        if (*(unsigned char *)(a2 + *v5)) {
          unint64_t v10 = 0;
        }
LABEL_14:
        if (v16) {
          BOOL v17 = 1;
        }
        else {
          BOOL v17 = (v10 & 7) == 4;
        }
        if (!v17)
        {
          switch((v10 >> 3))
          {
            case 1u:
              uint64_t v18 = PBReaderReadString();
              v19 = *(void **)(a1 + 32);
              *(void *)(a1 + 32) = v18;

              goto LABEL_38;
            case 2u:
              *(unsigned char *)(a1 + 40) |= 1u;
              uint64_t v26 = *v3;
              unint64_t v27 = *(void *)(a2 + v26);
              if (v27 <= 0xFFFFFFFFFFFFFFF7 && v27 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v27);
                *(void *)(a2 + v26) = v27 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v22 = 0;
              }
              uint64_t v28 = 8;
              goto LABEL_37;
            case 3u:
              *(unsigned char *)(a1 + 40) |= 2u;
              uint64_t v20 = *v3;
              unint64_t v21 = *(void *)(a2 + v20);
              if (v21 <= 0xFFFFFFFFFFFFFFF7 && v21 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v21);
                *(void *)(a2 + v20) = v21 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v22 = 0;
              }
              uint64_t v28 = 16;
              goto LABEL_37;
            case 4u:
              *(unsigned char *)(a1 + 40) |= 4u;
              uint64_t v23 = *v3;
              unint64_t v24 = *(void *)(a2 + v23);
              if (v24 <= 0xFFFFFFFFFFFFFFF7 && v24 + 8 <= *(void *)(a2 + *v4))
              {
                uint64_t v22 = *(void *)(*(void *)(a2 + *v7) + v24);
                *(void *)(a2 + v23) = v24 + 8;
              }
              else
              {
                *(unsigned char *)(a2 + *v5) = 1;
                uint64_t v22 = 0;
              }
              uint64_t v28 = 24;
LABEL_37:
              *(void *)(a1 + v28) = v22;
              goto LABEL_38;
            default:
              uint64_t result = PBReaderSkipValueWithTag();
              if (!result) {
                return result;
              }
LABEL_38:
              if (*(void *)(a2 + *v3) >= *(void *)(a2 + *v4)) {
                return *(unsigned char *)(a2 + *v5) == 0;
              }
              continue;
          }
        }
      }
      break;
    }
  }
  return *(unsigned char *)(a2 + *v5) == 0;
}

void _BRKHandleNPSNotification(uint64_t a1, void *a2)
{
  id v2 = a2;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = ___BRKHandleNPSNotification_block_invoke;
  block[3] = &unk_264DB63F0;
  id v5 = v2;
  id v3 = v2;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void sub_2399F7C78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
}

void __BRKCurrentDeviceVariant_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  id v3 = [NSNumber numberWithInt:a1];
  int v4 = 138412290;
  id v5 = v3;
  _os_log_error_impl(&dword_2399EB000, a2, OS_LOG_TYPE_ERROR, "Unknown screen class %@. Defaulting to \"394h\" variant", (uint8_t *)&v4, 0xCu);
}

void __BRKCurrentDeviceVariant_block_invoke_cold_2(os_log_t log)
{
  *(_WORD *)id v1 = 0;
  _os_log_error_impl(&dword_2399EB000, log, OS_LOG_TYPE_ERROR, "Screen class invalid. Defaulting to \"394h\" variant", v1, 2u);
}

void BRKMarkFilePurgeable_cold_1(void *a1, NSObject *a2)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  uint64_t v3 = [a1 UTF8String];
  int v4 = __error();
  id v5 = strerror(*v4);
  int v6 = 136315394;
  uint64_t v7 = v3;
  __int16 v8 = 2080;
  unsigned int v9 = v5;
  _os_log_error_impl(&dword_2399EB000, a2, OS_LOG_TYPE_ERROR, "Can't open %s to mark purgeable: %s", (uint8_t *)&v6, 0x16u);
}

void _BRKFileAttributes_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2399EB000, v0, v1, "Unable to get attributes for file %@ %@");
}

void BRKCreateDirectory_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_2399EB000, v0, v1, "Unable to create directory at path %@ %@");
}

void BRKDeviceIsAltAccount_cold_1()
{
  dlerror();
  uint64_t v0 = abort_report_np();
  -[BRKRemindersSettingsHelper _handwashingLocationManager](v0);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

BOOL CLLocationCoordinate2DIsValid(CLLocationCoordinate2D coord)
{
  return MEMORY[0x270EE7460]((__n128)coord, *(__n128 *)&coord.longitude);
}

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  MEMORY[0x270EE7470](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x270F95FB8]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x270F95FE8]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x270F95FF8]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x270F4AE20]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x270F4AE40]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x270EF2BF8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

uint64_t PBDataWriterWriteDoubleField()
{
  return MEMORY[0x270F58548]();
}

uint64_t PBDataWriterWriteStringField()
{
  return MEMORY[0x270F58590]();
}

uint64_t PBReaderReadString()
{
  return MEMORY[0x270F585E8]();
}

uint64_t PBReaderSkipValueWithTag()
{
  return MEMORY[0x270F58600]();
}

uint64_t UNFormatLocalizedString()
{
  return MEMORY[0x270F06468]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x270ED8070]();
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

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x270ED85F8](*(void *)&__upper_bound);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x270ED9318](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9448](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x270ED9468](label, attr, target);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x270ED9940](*(void *)&a1, a2, a3, *(void *)&a4);
}

long double fmod(long double __x, long double __y)
{
  MEMORY[0x270ED99D0](__x, __y);
  return result;
}

void free(void *a1)
{
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x270EDA738](*(void *)&token);
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x270EDB5B0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}