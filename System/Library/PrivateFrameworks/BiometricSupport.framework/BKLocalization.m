@interface BKLocalization
+ (id)getLocalizedString:(id)a3;
+ (id)getLocalizedString:(id)a3 fromFile:(id)a4;
+ (id)getLocalizedString:(id)a3 fromStringTable:(id)a4 withBundle:(id)a5;
+ (id)getLocalizedStringOrNil:(id)a3 fromStringTable:(id)a4 withBundle:(id)a5;
+ (void)reportLocalizationABC;
@end

@implementation BKLocalization

+ (id)getLocalizedString:(id)a3
{
  v4 = (void *)MEMORY[0x263F086E0];
  id v5 = a3;
  v6 = [v4 bundleWithPath:@"/System/Library/PrivateFrameworks/BiometricSupport.framework"];
  v7 = [a1 getLocalizedString:v5 fromStringTable:@"biometrickitd" withBundle:v6];

  return v7;
}

+ (id)getLocalizedString:(id)a3 fromFile:(id)a4
{
  v6 = (void *)MEMORY[0x263F086E0];
  id v7 = a4;
  id v8 = a3;
  v9 = [v6 bundleWithPath:@"/System/Library/PrivateFrameworks/BiometricSupport.framework"];
  v10 = [a1 getLocalizedString:v8 fromStringTable:v7 withBundle:v9];

  return v10;
}

+ (void)reportLocalizationABC
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  v2 = &_os_log_internal;
  if (__osLog) {
    v3 = __osLog;
  }
  else {
    v3 = &_os_log_internal;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21FFF3000, v3, OS_LOG_TYPE_DEFAULT, "BKLocalization reportLocalizationABC start\n", (uint8_t *)&v11, 2u);
  }
  dispatch_queue_t v4 = dispatch_queue_create("com.apple.biometrickitd.bkLocAbcQueue", 0);
  if (!v4)
  {
    if (__osLog) {
      v10 = __osLog;
    }
    else {
      v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v11 = 136316162;
    v12 = "bkLocalizationABCDispatchQueue";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    v16 = &unk_22004A573;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricSupportUserNotification.m";
    __int16 v19 = 1024;
    int v20 = 373;
LABEL_30:
    _os_log_impl(&dword_21FFF3000, v10, OS_LOG_TYPE_ERROR, "AssertMacros: %s (value = 0x%lx), %s file: %s, line: %d\n\n", (uint8_t *)&v11, 0x30u);
    goto LABEL_14;
  }
  id v5 = [[BiometricAutoBugCapture alloc] initWithDomain:@"BiometricSupport" process:@"biometrickitd" dispatchQueue:v4];
  if (!v5)
  {
    if (__osLog) {
      v10 = __osLog;
    }
    else {
      v10 = v2;
    }
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      goto LABEL_14;
    }
    int v11 = 136316162;
    v12 = "bkLocalizationABC";
    __int16 v13 = 2048;
    uint64_t v14 = 0;
    __int16 v15 = 2080;
    v16 = &unk_22004A573;
    __int16 v17 = 2080;
    v18 = "/Library/Caches/com.apple.xbs/Sources/BiometricSupport/BiometricSupport/BiometricSupportUserNotification.m";
    __int16 v19 = 1024;
    int v20 = 376;
    goto LABEL_30;
  }
  v6 = v5;
  BOOL v7 = [(BiometricAutoBugCapture *)v5 sendAutoBugCaptureEvent:4099];
  if (__osLog) {
    id v8 = __osLog;
  }
  else {
    id v8 = v2;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v11 = 67109120;
    LODWORD(v12) = v7;
    _os_log_impl(&dword_21FFF3000, v8, OS_LOG_TYPE_DEFAULT, "BKLocalization sendAutoBugCaptureEvent status %d\n", (uint8_t *)&v11, 8u);
  }

LABEL_14:
  if (__osLog) {
    v9 = __osLog;
  }
  else {
    v9 = v2;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl(&dword_21FFF3000, v9, OS_LOG_TYPE_DEFAULT, "BKLocalization reportLocalizationABC finish\n", (uint8_t *)&v11, 2u);
  }
}

+ (id)getLocalizedString:(id)a3 fromStringTable:(id)a4 withBundle:(id)a5
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [a1 getLocalizedStringOrNil:v8 fromStringTable:v9 withBundle:v10];
  v12 = v11;
  if (!v11 || [v11 isEqualToString:v8])
  {
    __int16 v13 = [v10 pathForResource:v9 ofType:@"loctable"];
    uint64_t v14 = &_os_log_internal;
    if (__osLog) {
      __int16 v15 = __osLog;
    }
    else {
      __int16 v15 = &_os_log_internal;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)MEMORY[0x263F08850];
      __int16 v17 = v15;
      v18 = [v16 defaultManager];
      int v25 = 138412546;
      id v26 = v13;
      __int16 v27 = 1024;
      LODWORD(v28) = [v18 fileExistsAtPath:v13];
      _os_log_impl(&dword_21FFF3000, v17, OS_LOG_TYPE_DEFAULT, "BKLocalization Loctable path='%@' exists=%d\n", (uint8_t *)&v25, 0x12u);
    }
    id v19 = [v10 localizedStringForKey:v8 value:0 table:v9 localization:@"en"];

    if (__osLog) {
      int v20 = __osLog;
    }
    else {
      int v20 = v14;
    }
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = v19;
      v22 = v20;
      uint64_t v23 = [v21 UTF8String];
      int v25 = 138412546;
      id v26 = v8;
      __int16 v27 = 2080;
      uint64_t v28 = v23;
      _os_log_impl(&dword_21FFF3000, v22, OS_LOG_TYPE_DEFAULT, "BKLocalization fallback to en: \"%@\" => \"%s\"\n", (uint8_t *)&v25, 0x16u);
    }
    if (!v19) {
      id v19 = v8;
    }
    [a1 reportLocalizationABC];

    v12 = v19;
  }

  return v12;
}

+ (id)getLocalizedStringOrNil:(id)a3 fromStringTable:(id)a4 withBundle:(id)a5
{
  uint64_t v44 = *MEMORY[0x263EF8340];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (v9)
  {
    id v10 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x263EFFE48], @"mobile", (CFStringRef)*MEMORY[0x263EFFE50]);
    if (v10)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (![v10 count])
        {
          int v11 = (__osLog ? __osLog : &_os_log_internal);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21FFF3000, v11, OS_LOG_TYPE_DEFAULT, "BKLocalization getLocalizedStringOrNil: languagePreferences are empty\n", buf, 2u);
          }
        }
        v12 = (void *)MEMORY[0x263F086E0];
        __int16 v13 = [v9 localizations];
        uint64_t v14 = [v12 preferredLocalizationsFromArray:v13 forPreferences:v10];

        if (__osLog) {
          __int16 v15 = __osLog;
        }
        else {
          __int16 v15 = &_os_log_internal;
        }
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          v16 = v15;
          int v17 = [v14 count];
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v40 = v17;
          *(_WORD *)&v40[4] = 2112;
          *(void *)&v40[6] = v14;
          _os_log_impl(&dword_21FFF3000, v16, OS_LOG_TYPE_DEFAULT, "BKLocalization preferred Localizations total: %d contents %@\n", buf, 0x12u);
        }
        v34 = v10;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v18 = v14;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
        if (v19)
        {
          uint64_t v20 = v19;
          uint64_t v21 = *(void *)v36;
LABEL_17:
          uint64_t v22 = 0;
          while (1)
          {
            if (*(void *)v36 != v21) {
              objc_enumerationMutation(v18);
            }
            uint64_t v23 = *(void **)(*((void *)&v35 + 1) + 8 * v22);
            v24 = [v9 localizedStringForKey:v7 value:0 table:v8 localization:v23];
            if (__osLog) {
              int v25 = __osLog;
            }
            else {
              int v25 = &_os_log_internal;
            }
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
            {
              id v26 = v23;
              __int16 v27 = v25;
              uint64_t v28 = [v26 UTF8String];
              uint64_t v29 = [v24 UTF8String];
              *(_DWORD *)buf = 136315650;
              *(void *)v40 = v28;
              *(_WORD *)&v40[8] = 2112;
              *(void *)&v40[10] = v7;
              __int16 v41 = 2080;
              uint64_t v42 = v29;
              _os_log_impl(&dword_21FFF3000, v27, OS_LOG_TYPE_DEFAULT, "BKLocalization [%s] \"%@\" => \"%s\"\n", buf, 0x20u);
            }
            if (v24) {
              break;
            }
            if (v20 == ++v22)
            {
              uint64_t v20 = [v18 countByEnumeratingWithState:&v35 objects:v43 count:16];
              if (v20) {
                goto LABEL_17;
              }
              goto LABEL_28;
            }
          }
        }
        else
        {
LABEL_28:
          v24 = 0;
        }

        id v10 = v34;
        goto LABEL_48;
      }
      if (__osLog) {
        v31 = __osLog;
      }
      else {
        v31 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
      {
LABEL_47:
        v24 = 0;
LABEL_48:

        goto LABEL_49;
      }
      *(_WORD *)buf = 0;
      v32 = "BKLocalization languagePreferences are not kind of NSArray\n";
    }
    else
    {
      if (__osLog) {
        v31 = __osLog;
      }
      else {
        v31 = &_os_log_internal;
      }
      if (!os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        goto LABEL_47;
      }
      *(_WORD *)buf = 0;
      v32 = "BKLocalization languagePreferences are not available\n";
    }
    _os_log_impl(&dword_21FFF3000, v31, OS_LOG_TYPE_ERROR, v32, buf, 2u);
    goto LABEL_47;
  }
  if (__osLog) {
    v30 = __osLog;
  }
  else {
    v30 = &_os_log_internal;
  }
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21FFF3000, v30, OS_LOG_TYPE_ERROR, "BKLocalization getLocalizedStringOrNil: bundle is nil\n", buf, 2u);
  }
  v24 = 0;
LABEL_49:

  return v24;
}

@end