@interface NSLocale(InternationalSupportExtensions)
+ (__CFString)_parentLocaleIdentifierForIdentifier:()InternationalSupportExtensions;
+ (id)_ICUdisplayNameForLanguage:()InternationalSupportExtensions capitalization:;
+ (id)_addLikelySubtagsForLocaleIdentifier:()InternationalSupportExtensions;
+ (id)_availableRegionsOfType:()InternationalSupportExtensions;
+ (id)_containingRegionOfType:()InternationalSupportExtensions forRegion:;
+ (id)_deviceLanguages;
+ (id)_displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:length:;
+ (id)_displayNameForNormalizedLanguage:()InternationalSupportExtensions context:displayLanguage:length:;
+ (id)_displayNameForNormalizedLanguage:()InternationalSupportExtensions context:displayLanguage:length:isCalcium:;
+ (id)_displayNameForRegion:()InternationalSupportExtensions displayLanguage:context:short:;
+ (id)_globalPreferredLanguages;
+ (id)_languagesForRegion:()InternationalSupportExtensions subdivision:withThreshold:;
+ (id)_minimizeSubtagsForLocaleIdentifier:()InternationalSupportExtensions;
+ (id)_normalizedLanguageIdentifierFromString:()InternationalSupportExtensions;
+ (id)_regionLanguageDataForRegionCode:()InternationalSupportExtensions subdivisionCode:;
+ (id)abbreviationsForLanguages:()InternationalSupportExtensions minimizeVariants:;
+ (id)availableSpokenLanguages;
+ (id)baseLanguageFromLanguage:()InternationalSupportExtensions;
+ (id)baseSystemLanguages;
+ (id)containingRegionOfRegion:()InternationalSupportExtensions;
+ (id)exemplarForLanguage:()InternationalSupportExtensions;
+ (id)exemplarRegionForLanguage:()InternationalSupportExtensions;
+ (id)languageFromLanguage:()InternationalSupportExtensions byReplacingRegion:;
+ (id)languagesByAddingRelatedLanguagesToLanguages:()InternationalSupportExtensions;
+ (id)languagesForRegion:()InternationalSupportExtensions subdivision:withThreshold:filter:;
+ (id)matchedLanguagesFromAvailableLanguages:()InternationalSupportExtensions forPreferredLanguages:;
+ (id)minimizedLanguagesFromLanguages:()InternationalSupportExtensions;
+ (id)regionsForLanguage:()InternationalSupportExtensions withThreshold:;
+ (id)relatedLanguagesForLanguage:()InternationalSupportExtensions;
+ (id)scriptCodeFromLanguage:()InternationalSupportExtensions;
+ (id)spokenLanguagesForLanguage:()InternationalSupportExtensions;
+ (id)spokenLanguagesForLanguages:()InternationalSupportExtensions includeLanguagesForRegion:;
+ (id)supportedLanguages;
+ (id)supportedRegions;
+ (uint64_t)availableContinents;
+ (uint64_t)containingContinentOfRegion:()InternationalSupportExtensions;
+ (uint64_t)deviceLanguage;
+ (uint64_t)displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:;
+ (uint64_t)isOnCalciumDevice;
+ (void)_languagesToExemplarStrings;
+ (void)_regionLanguageData;
+ (void)_supportedKeyboardLanguages;
- (__CFString)numberingSystem;
- (id)availableNumberingSystems;
- (id)countryCodeTopLevelDomainsUsingPunycode:()InternationalSupportExtensions;
- (id)displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:;
- (id)displayNameForRegion:()InternationalSupportExtensions displayLanguage:context:short:;
- (id)localizedStringForLanguage:()InternationalSupportExtensions context:length:;
- (id)localizedStringForNumberingSystem:()InternationalSupportExtensions short:;
- (id)localizedStringForRegion:()InternationalSupportExtensions context:short:;
- (uint64_t)isEquivalentTo:()InternationalSupportExtensions;
- (uint64_t)localizedStringForLanguage:()InternationalSupportExtensions context:;
- (uint64_t)positionOfDayPeriodInFormattedTime;
@end

@implementation NSLocale(InternationalSupportExtensions)

+ (id)supportedLanguages
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  v2 = [a1 _languagesToExemplarStrings];
  v3 = [v2 allKeys];
  v4 = [v1 setWithArray:v3];

  return v4;
}

+ (id)_globalPreferredLanguages
{
  v6[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v1 = [v0 persistentDomainForName:*MEMORY[0x1E4F283E0]];
  v2 = [v1 objectForKeyedSubscript:@"AppleLanguages"];

  if (!v2 || ![v2 count])
  {
    CFPropertyListRef v3 = CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);

    v2 = (void *)v3;
  }
  if (![v2 count])
  {
    v6[0] = @"en-US";
    uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:1];

    v2 = (void *)v4;
  }

  return v2;
}

+ (id)scriptCodeFromLanguage:()InternationalSupportExtensions
{
  id v3 = a3;
  if ([v3 length])
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA20] _addLikelySubtagsForLocaleIdentifier:v3];
    v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v4];
    v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C470]];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)matchedLanguagesFromAvailableLanguages:()InternationalSupportExtensions forPreferredLanguages:
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v31 = [MEMORY[0x1E4F1CA70] orderedSet];
  v29 = v5;
  v7 = [&unk_1F3FC5608 arrayByAddingObjectsFromArray:v5];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  uint64_t v8 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v33 = *(void *)v35;
    uint64_t v10 = *MEMORY[0x1E4F1C438];
    unint64_t v11 = 0x1E4F1C000uLL;
    v30 = v7;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v35 != v33) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        v14 = (void *)MEMORY[0x1E4F28B50];
        uint64_t v38 = v13;
        v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v38 count:1];
        v16 = [v14 preferredLocalizationsFromArray:v7 forPreferences:v15];
        v17 = [v16 firstObject];

        if (v17)
        {
          v18 = [*(id *)(v11 + 2592) componentsFromLocaleIdentifier:v13];
          v19 = [v18 objectForKeyedSubscript:v10];

          unint64_t v20 = v11;
          v21 = [*(id *)(v11 + 2592) componentsFromLocaleIdentifier:v17];
          v22 = [v21 objectForKeyedSubscript:v10];

          if (v19) {
            BOOL v23 = v22 == 0;
          }
          else {
            BOOL v23 = 1;
          }
          if (!v23)
          {
            if ([v19 isEqualToString:v22]) {
              goto LABEL_15;
            }
            v24 = [*(id *)(v11 + 2592) _parentLocaleIdentifierForIdentifier:v22];
            if ([v24 isEqualToString:v19])
            {

              goto LABEL_15;
            }
            v25 = [*(id *)(v11 + 2592) _parentLocaleIdentifierForIdentifier:v19];
            int v26 = [v25 isEqualToString:v22];

            v7 = v30;
            if (v26) {
LABEL_15:
            }
              [v31 addObject:v17];
          }

          unint64_t v11 = v20;
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v9);
  }

  v27 = [v31 array];

  return v27;
}

+ (id)minimizedLanguagesFromLanguages:()InternationalSupportExtensions
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 count])
  {
    uint64_t v4 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:0x1F3FC5320 forPreferences:v3];
    id v5 = [v4 firstObject];

    id v6 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v5];
    v7 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v8 = [MEMORY[0x1E4F1CA20] _deviceLanguages];
    uint64_t v9 = [v7 preferredLocalizationsFromArray:v8 forPreferences:v3];
    uint64_t v10 = [v9 firstObject];

    unint64_t v11 = (void *)MEMORY[0x1E4F28B50];
    v35[0] = v10;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
    uint64_t v13 = [v11 preferredLocalizationsFromArray:0x1F3FC5320 forPreferences:v12];
    v14 = [v13 firstObject];

    v15 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v14];
    v16 = [MEMORY[0x1E4F1CA70] orderedSet];
    v17 = v16;
    if (v5 && v6 && v14 && v15)
    {
      [v16 addObject:v5];
      if (([v6 isEqualToString:v15] & 1) == 0) {
        [v17 addObject:v6];
      }
      [v17 addObject:v14];
      [v17 addObject:v15];
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
      {
        unint64_t v20 = [v3 componentsJoinedByString:@","];
        int v21 = 136316674;
        v22 = "+[NSLocale(InternationalSupportExtensions) minimizedLanguagesFromLanguages:]";
        __int16 v23 = 2114;
        v24 = v20;
        __int16 v25 = 2114;
        int v26 = v5;
        __int16 v27 = 2114;
        v28 = v6;
        __int16 v29 = 2114;
        v30 = v10;
        __int16 v31 = 2114;
        v32 = v14;
        __int16 v33 = 2114;
        long long v34 = v15;
        _os_log_fault_impl(&dword_1E420E000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "%s: Unable to minimize languages. languages = [ %{public}@ ], minimizedLanguage = %{public}@, , minimizedLanguageBase = %{public}@, deviceLanguage = %{public}@, minimizedDeviceLanguage = %{public}@, minimizedDeviceLanguageBase = %{public}@", (uint8_t *)&v21, 0x48u);
      }
      [v17 addObjectsFromArray:v3];
    }
    v18 = [v17 array];
  }
  else
  {
    v18 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v18;
}

+ (id)baseLanguageFromLanguage:()InternationalSupportExtensions
{
  id v4 = a3;
  id v5 = v4;
  if ([v4 length])
  {
    id v6 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
    v7 = [v6 regionCode];
    if ([v7 length])
    {
    }
    else
    {
      uint64_t v8 = [v6 scriptCode];
      uint64_t v9 = [v8 length];

      id v5 = v4;
      if (!v9)
      {
LABEL_6:

        goto LABEL_7;
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F1CA20] _addLikelySubtagsForLocaleIdentifier:v4];
    unint64_t v11 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v10];
    v12 = (void *)[v11 mutableCopy];

    [v12 removeObjectForKey:*MEMORY[0x1E4F1C400]];
    uint64_t v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v12];
    id v5 = [a1 _normalizedLanguageIdentifierFromString:v13];

    goto LABEL_6;
  }
LABEL_7:

  return v5;
}

+ (id)_addLikelySubtagsForLocaleIdentifier:()InternationalSupportExtensions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 UTF8String];
  uloc_addLikelySubtags();
  id v4 = [NSString stringWithUTF8String:v6];

  return v4;
}

+ (id)_normalizedLanguageIdentifierFromString:()InternationalSupportExtensions
{
  id v4 = a3;
  if (v4
    && ([a1 _languagesToExemplarStrings],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 objectForKey:v4],
        id v6 = objc_claimAutoreleasedReturnValue(),
        v6,
        v5,
        !v6))
  {
    uint64_t v8 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v4];
    uint64_t v9 = v4;
    if (!v8
      || ([&unk_1F3FC0F58 objectForKeyedSubscript:v4],
          (id v7 = (id)objc_claimAutoreleasedReturnValue()) == 0)
      && ([&unk_1F3FC0F58 objectForKeyedSubscript:v8],
          id v7 = (id)objc_claimAutoreleasedReturnValue(),
          uint64_t v9 = v8,
          !v7))
    {
      id v7 = v9;
    }
  }
  else
  {
    id v7 = v4;
  }

  return v7;
}

+ (void)_languagesToExemplarStrings
{
  return &unk_1F3FC0EB8;
}

+ (id)_deviceLanguages
{
  if (_deviceLanguages___onceToken != -1) {
    dispatch_once(&_deviceLanguages___onceToken, &__block_literal_global_1);
  }
  v0 = (void *)_deviceLanguages___deviceLanguages;

  return v0;
}

+ (uint64_t)deviceLanguage
{
  return [MEMORY[0x1E4F1CA20] _deviceLanguage];
}

+ (id)baseSystemLanguages
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__NSLocale_InternationalSupportExtensions__baseSystemLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (baseSystemLanguages___onceToken != -1) {
    dispatch_once(&baseSystemLanguages___onceToken, block);
  }
  v1 = (void *)baseSystemLanguages___baseSystemLanguages;

  return v1;
}

+ (id)exemplarForLanguage:()InternationalSupportExtensions
{
  id v4 = a3;
  if (v4)
  {
    id v5 = [a1 _languagesToExemplarStrings];
    id v6 = [v5 objectForKey:v4];

    if (!v6)
    {
      uint64_t v7 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v4];

      uint64_t v8 = [a1 _languagesToExemplarStrings];
      id v6 = [v8 objectForKey:v7];

      id v4 = (id)v7;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)languagesForRegion:()InternationalSupportExtensions subdivision:withThreshold:filter:
{
  id v10 = a3;
  id v11 = a4;
  if (a6 == 2)
  {
    uint64_t v12 = [a1 _supportedKeyboardLanguages];
    goto LABEL_5;
  }
  if (a6 == 1)
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA20] systemLanguages];
LABEL_5:
    uint64_t v13 = (void *)v12;
    goto LABEL_7;
  }
  uint64_t v13 = 0;
LABEL_7:
  v14 = [a1 _languagesForRegion:v10 subdivision:v11 withThreshold:a5];
  v15 = v14;
  if (v13)
  {
    id v16 = [a1 matchedLanguagesFromAvailableLanguages:v13 forPreferredLanguages:v14];
  }
  else
  {
    id v16 = v14;
  }
  v17 = v16;

  return v17;
}

+ (id)regionsForLanguage:()InternationalSupportExtensions withThreshold:
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  HIDWORD(v14) = 0;
  id v3 = a3;
  [v3 UTF8String];
  int RegionsForLanguage = ualoc_getRegionsForLanguage();
  int v6 = RegionsForLanguage;
  uint64_t v7 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:RegionsForLanguage];
  MEMORY[0x1F4188790]();
  uint64_t v9 = (char *)&v14 - v8;
  [v3 UTF8String];
  ualoc_getRegionsForLanguage();
  if (SHIDWORD(v14) <= 0 && v6 >= 1)
  {
    uint64_t v10 = v6;
    do
    {
      id v11 = [NSString stringWithUTF8String:v9];
      [v7 addObject:v11];

      v9 += 24;
      --v10;
    }
    while (v10);
  }
  uint64_t v12 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v7];

  if (v12)
  {
    id v5 = [v12 array];
  }
  else
  {
    id v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

+ (id)supportedRegions
{
  if (supportedRegions___onceToken != -1) {
    dispatch_once(&supportedRegions___onceToken, &__block_literal_global_23);
  }
  v0 = (void *)supportedRegions___supportedRegions;

  return v0;
}

+ (id)exemplarRegionForLanguage:()InternationalSupportExtensions
{
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v3];
  id v5 = [v4 countryCode];

  if (![v5 length])
  {
    int v6 = [v3 lowercaseString];
    char v7 = [v6 isEqualToString:@"en"];

    if (v7)
    {
      id v8 = 0;
      goto LABEL_6;
    }
    uint64_t v9 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v10 = [MEMORY[0x1E4F1CA20] _addLikelySubtagsForLocaleIdentifier:v3];
    id v11 = [v9 localeWithLocaleIdentifier:v10];
    uint64_t v12 = [v11 countryCode];

    id v5 = (void *)v12;
  }
  id v8 = v5;
  id v5 = v8;
LABEL_6:

  return v8;
}

+ (uint64_t)availableContinents
{
  return [a1 _availableRegionsOfType:3];
}

+ (id)_availableRegionsOfType:()InternationalSupportExtensions
{
  v0 = [MEMORY[0x1E4F1CA48] array];
  uregion_getAvailable();
  uint64_t v1 = uenum_next();
  if (v1)
  {
    for (uint64_t i = v1; ; uint64_t i = v4)
    {
      id v3 = [NSString stringWithCString:i encoding:4];
      [v0 addObject:v3];

      uint64_t v4 = uenum_next();
      if (!v4) {
        break;
      }
    }
  }
  uenum_close();

  return v0;
}

+ (uint64_t)containingContinentOfRegion:()InternationalSupportExtensions
{
  return [a1 _containingRegionOfType:3 forRegion:a3];
}

+ (id)_containingRegionOfType:()InternationalSupportExtensions forRegion:
{
  int v9 = 0;
  uint64_t v5 = MEMORY[0x1E4E7DA10]([a4 UTF8String], &v9);
  if (v9 > 0 || v5 == 0)
  {
    char v7 = 0;
  }
  else
  {
    char v7 = (void *)MEMORY[0x1E4E7D9F0](v5, a3);
    if (v7)
    {
      char v7 = [NSString stringWithCString:MEMORY[0x1E4E7DA00]() encoding:4];
    }
  }

  return v7;
}

+ (id)containingRegionOfRegion:()InternationalSupportExtensions
{
  int v7 = 0;
  uint64_t v3 = MEMORY[0x1E4E7DA10]([a3 UTF8String], &v7);
  if (v7 > 0 || v3 == 0)
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4E7D9E0](v3);
    if (v5)
    {
      uint64_t v5 = [NSString stringWithCString:MEMORY[0x1E4E7DA00]() encoding:4];
    }
  }

  return v5;
}

+ (id)languageFromLanguage:()InternationalSupportExtensions byReplacingRegion:
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  int v9 = v8;
  if ([v8 length])
  {
    int v9 = v8;
    if ([v7 length])
    {
      uint64_t v10 = [a1 baseLanguageFromLanguage:v8];
      id v11 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v10];
      uint64_t v12 = (void *)[v11 mutableCopy];

      [v12 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F1C400]];
      uint64_t v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v12];
      int v9 = [a1 _normalizedLanguageIdentifierFromString:v13];
    }
  }

  return v9;
}

- (uint64_t)localizedStringForLanguage:()InternationalSupportExtensions context:
{
  return [a1 localizedStringForLanguage:a3 context:a4 length:0];
}

- (id)localizedStringForLanguage:()InternationalSupportExtensions context:length:
{
  id v8 = a3;
  int v9 = objc_opt_class();
  uint64_t v10 = [a1 languageIdentifier];
  id v11 = [v9 _displayNameForLanguage:v8 displayLanguage:v10 context:a4 length:a5];

  return v11;
}

+ (id)_displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:length:
{
  id v10 = a4;
  id v11 = a3;
  uint64_t v12 = [(id)objc_opt_class() _normalizedLanguageIdentifierFromString:v11];
  uint64_t v13 = [a1 _displayNameForNormalizedLanguage:v12 context:a5 displayLanguage:v10 length:a6];

  if ([v13 isEqualToString:v12]) {
    uint64_t v14 = v11;
  }
  else {
    uint64_t v14 = v13;
  }
  id v15 = v14;

  return v15;
}

- (id)localizedStringForRegion:()InternationalSupportExtensions context:short:
{
  id v8 = a3;
  int v9 = objc_opt_class();
  id v10 = [a1 languageIdentifier];
  id v11 = [v9 _displayNameForRegion:v8 displayLanguage:v10 context:a4 short:a5];

  return v11;
}

+ (id)_displayNameForRegion:()InternationalSupportExtensions displayLanguage:context:short:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  uint64_t v13 = objc_opt_class();
  uint64_t v14 = [v12 length];
  id v15 = v12;
  if (!v14)
  {
    a1 = [MEMORY[0x1E4F28B50] mainBundle];
    id v6 = [a1 preferredLocalizations];
    id v15 = [v6 firstObject];
  }
  id v16 = [v13 _normalizedLanguageIdentifierFromString:v15];

  if (!v14)
  {
  }
  if ((unint64_t)(a5 - 3) >= 3) {
    int v17 = 256;
  }
  else {
    int v17 = 262 - a5;
  }
  uint64_t v28 = 0;
  if (a6) {
    int v18 = 513;
  }
  else {
    int v18 = 512;
  }
  int v29 = v17;
  int v30 = v18;
  id v19 = v16;
  [v19 UTF8String];
  uldn_openForContext();
  id v20 = v11;
  [v20 UTF8String];
  int v21 = uldn_regionDisplayName();
  if (v21 >= 150)
  {
    int v21 = 0;
    LODWORD(v28) = 15;
  }
  v22 = (char *)&v27 - ((2 * (v21 + 1) + 15) & 0x3FFFFFFF0);
  id v23 = v20;
  [v23 UTF8String];
  int v24 = uldn_regionDisplayName();
  uldn_close();
  if ((int)v28 > 0
    || ([NSString stringWithCharacters:v22 length:v24],
        (id v25 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v25 = v23;
  }

  return v25;
}

+ (id)relatedLanguagesForLanguage:()InternationalSupportExtensions
{
  v35[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (relatedLanguagesForLanguage____onceToken != -1) {
    dispatch_once(&relatedLanguagesForLanguage____onceToken, &__block_literal_global_47);
  }
  uint64_t v5 = [MEMORY[0x1E4F1CA70] orderedSet];
  id v6 = [(id)relatedLanguagesForLanguage____relatedLanguages allKeys];
  v35[0] = v4;
  id v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:1];
  id v8 = [a1 mostPreferredLanguageOf:v6 withPreferredLanguages:v7 forUsage:0 options:0];

  if (v8)
  {
    int v9 = [(id)relatedLanguagesForLanguage____relatedLanguages objectForKeyedSubscript:v8];
  }
  else
  {
    int v9 = 0;
  }
  if ([v9 count])
  {
    id v10 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v4];
    id v11 = [v10 countryCode];

    int v29 = v11;
    if ([v11 length])
    {
      int v26 = v8;
      uint64_t v27 = v5;
      id v28 = v4;
      id v12 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v9, "count"));
      long long v30 = 0u;
      long long v31 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v25 = v9;
      id v13 = v9;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v31 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            id v19 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v18];
            id v20 = [v19 countryCode];
            uint64_t v21 = [v20 length];

            if (v21)
            {
              [v12 addObject:v18];
            }
            else
            {
              v22 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v18 byReplacingRegion:v29];
              [v12 addObject:v22];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v30 objects:v34 count:16];
        }
        while (v15);
      }

      uint64_t v5 = v27;
      [v27 addObjectsFromArray:v12];

      id v4 = v28;
      int v9 = v25;
      id v8 = v26;
    }
    else
    {
      [v5 addObjectsFromArray:v9];
    }
  }
  id v23 = [v5 array];

  return v23;
}

+ (id)languagesByAddingRelatedLanguagesToLanguages:()InternationalSupportExtensions
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v29 = [MEMORY[0x1E4F1CA70] orderedSet];
  if ([v3 count])
  {
    id v4 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v5 = [v3 firstObject];
    id v6 = [v4 scriptCodeFromLanguage:v5];
    int v7 = [v6 isEqualToString:@"Latn"];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v23 = v3;
    id v8 = v3;
    uint64_t v26 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v26)
    {
      uint64_t v24 = *(void *)v35;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v35 != v24) {
            objc_enumerationMutation(v8);
          }
          uint64_t v27 = *(void *)(*((void *)&v34 + 1) + 8 * v9);
          uint64_t v28 = v9;
          id v10 = objc_msgSend(a1, "relatedLanguagesForLanguage:");
          id v11 = [MEMORY[0x1E4F1CA48] array];
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          id v12 = v10;
          uint64_t v13 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v13)
          {
            uint64_t v14 = v13;
            uint64_t v15 = *(void *)v31;
            do
            {
              for (uint64_t i = 0; i != v14; ++i)
              {
                if (*(void *)v31 != v15) {
                  objc_enumerationMutation(v12);
                }
                uint64_t v17 = *(void *)(*((void *)&v30 + 1) + 8 * i);
                if (([v8 containsObject:v17] & 1) == 0)
                {
                  if (!v7
                    || ([MEMORY[0x1E4F1CA20] scriptCodeFromLanguage:v17],
                        uint64_t v18 = objc_claimAutoreleasedReturnValue(),
                        char v19 = [v18 isEqualToString:@"Latn"],
                        v18,
                        id v20 = v29,
                        (v19 & 1) == 0))
                  {
                    id v20 = v11;
                  }
                  [v20 addObject:v17];
                }
              }
              uint64_t v14 = [v12 countByEnumeratingWithState:&v30 objects:v38 count:16];
            }
            while (v14);
          }

          [v29 addObject:v27];
          [v29 addObjectsFromArray:v11];

          uint64_t v9 = v28 + 1;
        }
        while (v28 + 1 != v26);
        uint64_t v26 = [v8 countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v26);
    }

    id v3 = v23;
  }
  uint64_t v21 = [v29 array];

  return v21;
}

+ (id)availableSpokenLanguages
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __68__NSLocale_InternationalSupportExtensions__availableSpokenLanguages__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (availableSpokenLanguages___onceToken != -1) {
    dispatch_once(&availableSpokenLanguages___onceToken, block);
  }
  uint64_t v1 = (void *)availableSpokenLanguages___availableSpokenLanguages;

  return v1;
}

+ (id)spokenLanguagesForLanguage:()InternationalSupportExtensions
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v3];
  uint64_t v5 = (void *)MEMORY[0x1E4F1CA20];
  id v6 = [&unk_1F3FC3A78 allKeys];
  v15[0] = v3;
  int v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
  id v8 = [v5 matchedLanguagesFromAvailableLanguages:v6 forPreferredLanguages:v7];
  uint64_t v9 = [v8 firstObject];

  if (v9)
  {
    id v10 = [&unk_1F3FC3A78 objectForKeyedSubscript:v9];
  }
  else
  {
    id v11 = [v4 languageCode];
    if (v11)
    {
      id v12 = [v4 languageCode];
      uint64_t v14 = v12;
      id v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v14 count:1];
    }
    else
    {
      id v10 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }

  return v10;
}

+ (id)spokenLanguagesForLanguages:()InternationalSupportExtensions includeLanguagesForRegion:
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = objc_msgSend(MEMORY[0x1E4F1CA70], "orderedSetWithCapacity:", objc_msgSend(v6, "count"));
  if (a4)
  {
    id v8 = [MEMORY[0x1E4F1CA70] orderedSetWithCapacity:1];
  }
  else
  {
    id v8 = 0;
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v43;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v43 != v11) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v42 + 1) + 8 * i);
        uint64_t v14 = [a1 spokenLanguagesForLanguage:v13];
        [v7 addObjectsFromArray:v14];

        if (a4)
        {
          uint64_t v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v13];
          uint64_t v16 = [v15 countryCode];

          if (v16) {
            [v8 addObject:v16];
          }
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v42 objects:v48 count:16];
    }
    while (v10);
  }

  if (a4)
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v28 = v8;
    id v29 = v8;
    uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v31)
    {
      uint64_t v30 = *(void *)v39;
      do
      {
        uint64_t v17 = 0;
        do
        {
          if (*(void *)v39 != v30) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = v17;
          uint64_t v18 = *(void *)(*((void *)&v38 + 1) + 8 * v17);
          char v19 = objc_msgSend(MEMORY[0x1E4F1CA20], "languagesForRegion:subdivision:withThreshold:filter:", v18, 0, 1, 0, v28);
          long long v34 = 0u;
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v20 = [v19 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v20)
          {
            uint64_t v21 = v20;
            uint64_t v22 = *(void *)v35;
            do
            {
              for (uint64_t j = 0; j != v21; ++j)
              {
                if (*(void *)v35 != v22) {
                  objc_enumerationMutation(v19);
                }
                uint64_t v24 = [MEMORY[0x1E4F1CA20] languageFromLanguage:*(void *)(*((void *)&v34 + 1) + 8 * j) byReplacingRegion:v18];
                id v25 = [a1 spokenLanguagesForLanguage:v24];
                [v7 addObjectsFromArray:v25];
              }
              uint64_t v21 = [v19 countByEnumeratingWithState:&v34 objects:v46 count:16];
            }
            while (v21);
          }

          uint64_t v17 = v33 + 1;
        }
        while (v33 + 1 != v31);
        uint64_t v31 = [v29 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v31);
    }

    id v8 = v28;
  }
  uint64_t v26 = objc_msgSend(v7, "array", v28);

  return v26;
}

- (uint64_t)isEquivalentTo:()InternationalSupportExtensions
{
  id v4 = a3;
  uint64_t v5 = [a1 localeIdentifier];
  id v6 = [v4 localeIdentifier];

  int v7 = [MEMORY[0x1E4F1CA20] _addLikelySubtagsForLocaleIdentifier:v5];

  id v8 = [MEMORY[0x1E4F1CA20] _addLikelySubtagsForLocaleIdentifier:v6];

  uint64_t v9 = [v7 isEqualToString:v8];
  return v9;
}

- (__CFString)numberingSystem
{
  uint64_t v1 = (void *)MEMORY[0x1E4F1CA20];
  v2 = [a1 localeIdentifier];
  id v3 = [v1 componentsFromLocaleIdentifier:v2];
  id v4 = (void *)[v3 mutableCopy];

  uint64_t v5 = [v4 objectForKeyedSubscript:@"numbers"];
  if ([v5 length] && (objc_msgSend(v5, "isEqualToString:", @"default") & 1) == 0)
  {
    id v8 = v5;
  }
  else
  {
    [v4 setObject:@"default" forKeyedSubscript:@"numbers"];
    id v6 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v4];
    [v6 UTF8String];
    uint64_t v7 = unumsys_open();
    id v8 = @"latn";
    if (v7)
    {
      uint64_t v9 = MEMORY[0x1E4E7D990](v7);
      if (v9)
      {
        id v8 = [NSString stringWithUTF8String:v9];
      }
      unumsys_close();
    }
  }

  return v8;
}

- (id)availableNumberingSystems
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F1CA48] array];
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = [a1 localeIdentifier];
  uint64_t v5 = [v3 componentsFromLocaleIdentifier:v4];
  id v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = [v6 objectForKeyedSubscript:@"numbers"];
  if ([v7 length]) {
    [v2 addObject:v7];
  }
  char v19 = v7;
  uint64_t v18 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  long long v20 = 0u;
  long long v21 = 0u;
  if (objc_msgSend(&unk_1F3FC57A0, "containsObject:")) {
    id v8 = &unk_1F3FC57B8;
  }
  else {
    id v8 = &unk_1F3FC57D0;
  }
  long long v22 = 0uLL;
  long long v23 = 0uLL;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 setObject:*(void *)(*((void *)&v20 + 1) + 8 * i) forKeyedSubscript:@"numbers"];
        id v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v6];
        [v13 UTF8String];
        uint64_t v14 = unumsys_open();

        if (v14)
        {
          if (!MEMORY[0x1E4E7D9B0](v14) && MEMORY[0x1E4E7D9A0](v14) == 10)
          {
            uint64_t v15 = MEMORY[0x1E4E7D990](v14);
            if (v15)
            {
              uint64_t v16 = [NSString stringWithUTF8String:v15];
              if (([v2 containsObject:v16] & 1) == 0) {
                [v2 addObject:v16];
              }
            }
          }
          unumsys_close();
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v10);
  }
  if (([v2 containsObject:@"latn"] & 1) == 0) {
    [v2 addObject:@"latn"];
  }

  return v2;
}

- (id)localizedStringForNumberingSystem:()InternationalSupportExtensions short:
{
  id v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = a3;
  id v8 = [a1 localeIdentifier];
  uint64_t v9 = [v6 componentsFromLocaleIdentifier:v8];
  uint64_t v10 = (void *)[v9 mutableCopy];

  [v10 setObject:v7 forKeyedSubscript:@"numbers"];
  uint64_t v11 = objc_opt_new();
  id v12 = (void *)MEMORY[0x1E4F1CA20];
  id v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v10];
  uint64_t v14 = [v12 localeWithLocaleIdentifier:v13];
  [v11 setLocale:v14];

  if (a4) {
    uint64_t v15 = &unk_1F3FC5B68;
  }
  else {
    uint64_t v15 = &unk_1F3FC5B80;
  }
  uint64_t v16 = [v11 stringFromNumber:v15];

  return v16;
}

- (id)countryCodeTopLevelDomainsUsingPunycode:()InternationalSupportExtensions
{
  v0 = (void *)MEMORY[0x1F4188790]();
  int v2 = v1;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [v0 countryCode];
  id v4 = [v3 lowercaseString];
  uint64_t v5 = [&unk_1F3FC0F08 objectForKeyedSubscript:v4];

  if (v2 && [v5 count])
  {
    id v6 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count"));
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v7 = v5;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v22 != v10) {
            objc_enumerationMutation(v7);
          }
          id v12 = *(id *)(*((void *)&v21 + 1) + 8 * i);
          uint64_t v13 = objc_msgSend(v12, "length", (void)v21);
          uint64_t v14 = v12;
          if (v13)
          {
            unint64_t v15 = v13;
            uint64_t v14 = v12;
            if ([v12 characterAtIndex:0] >= 0x80)
            {
              uint64_t v16 = v15 >= 0x400 ? 1024 : v15;
              objc_msgSend(v12, "getCharacters:range:", label, 0, v16);
              UErrorCode pErrorCode = U_ZERO_ERROR;
              uint64_t v17 = (const UIDNA *)MEMORY[0x1E4E7D910](0, &pErrorCode);
              uint64_t v14 = v12;
              if (v17)
              {
                uint64_t v14 = v12;
                if (pErrorCode == U_ZERO_ERROR)
                {
                  uint64_t v18 = v17;
                  *(void *)&pInfo.reservedI2 = 0;
                  *(void *)&pInfo.size = 16;
                  int32_t v19 = uidna_labelToASCII(v17, label, v15, dest, 2048, &pInfo, &pErrorCode);
                  uint64_t v14 = v12;
                  if (v19 >= 1)
                  {
                    uint64_t v14 = (void *)[[NSString alloc] initWithCharacters:dest length:v19];
                  }
                  uidna_close(v18);
                }
              }
            }
          }

          [v6 addObject:v14];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      }
      while (v9);
    }
  }
  else
  {
    id v6 = v5;
  }

  return v6;
}

- (uint64_t)positionOfDayPeriodInFormattedTime
{
  int v1 = [MEMORY[0x1E4F28C10] dateFormatFromTemplate:@"j" options:0 locale:a1];
  if (![v1 length])
  {
LABEL_16:
    uint64_t v7 = 0;
    goto LABEL_17;
  }
  uint64_t v2 = 0;
  char v3 = 0;
  char v4 = 0;
  while (1)
  {
    int v5 = [v1 characterAtIndex:v2];
    if (v5 != 39) {
      break;
    }
    v3 ^= 1u;
LABEL_10:
    if (++v2 >= (unint64_t)[v1 length]) {
      goto LABEL_16;
    }
  }
  if (v3)
  {
    char v3 = 1;
    goto LABEL_10;
  }
  char v3 = 0;
  char v6 = v5 - 66;
  if ((v5 - 66) > 0x29) {
    goto LABEL_10;
  }
  if (((1 << v6) & 0x24000000240) != 0)
  {
    char v3 = 0;
    char v4 = 1;
    goto LABEL_10;
  }
  if (((1 << v6) & 0x180000001) == 0) {
    goto LABEL_10;
  }
  if (v4) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = 1;
  }
LABEL_17:

  return v7;
}

+ (id)abbreviationsForLanguages:()InternationalSupportExtensions minimizeVariants:
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [MEMORY[0x1E4F1CA48] array];
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
  id v38 = v6;
  long long v39 = v5;
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v53;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v53 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = [(id)objc_opt_class() _normalizedLanguageIdentifierFromString:*(void *)(*((void *)&v52 + 1) + 8 * i)];
        id v12 = [&unk_1F3FC0F30 objectForKeyedSubscript:v11];
        if (!v12)
        {
          uint64_t v13 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v11];
          id v12 = [&unk_1F3FC0F30 objectForKeyedSubscript:v13];
          if (!v12)
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA20] ISOLanguageCodes];
            unint64_t v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v11];
            uint64_t v16 = [v15 languageCode];
            id v12 = &stru_1F3FC06D0;
            if ([v14 containsObject:v16])
            {
              id v12 = [v16 uppercaseString];
            }

            id v6 = v38;
            int v5 = v39;
          }
        }
        objc_msgSend(v5, "addObject:", v12, v38, v39);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v52 objects:v58 count:16];
    }
    while (v8);
  }

  if (a4)
  {
    id v43 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v17 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v18 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v5;
    uint64_t v19 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v49;
      uint64_t v22 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t j = 0; j != v20; ++j)
        {
          if (*(void *)v49 != v21) {
            objc_enumerationMutation(obj);
          }
          long long v24 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * j), "componentsSeparatedByString:", @" ", v38, v39);
          uint64_t v25 = [v24 objectAtIndexedSubscript:0];
          uint64_t v26 = [v17 objectForKey:v25];

          if (v26) {
            uint64_t v27 = v18;
          }
          else {
            uint64_t v27 = v17;
          }
          [v27 setObject:v22 forKey:v25];
        }
        uint64_t v20 = [obj countByEnumeratingWithState:&v48 objects:v57 count:16];
      }
      while (v20);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id obja = obj;
    uint64_t v28 = [obja countByEnumeratingWithState:&v44 objects:v56 count:16];
    if (v28)
    {
      uint64_t v29 = v28;
      uint64_t v30 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v29; ++k)
        {
          if (*(void *)v45 != v30) {
            objc_enumerationMutation(obja);
          }
          long long v32 = *(void **)(*((void *)&v44 + 1) + 8 * k);
          uint64_t v33 = objc_msgSend(v32, "componentsSeparatedByString:", @" ", v38, v39);
          long long v34 = [v33 objectAtIndexedSubscript:0];
          long long v35 = [v18 objectForKey:v34];

          if (v35) {
            long long v36 = v32;
          }
          else {
            long long v36 = v34;
          }
          [v43 addObject:v36];
        }
        uint64_t v29 = [obja countByEnumeratingWithState:&v44 objects:v56 count:16];
      }
      while (v29);
    }

    id v6 = v38;
    int v5 = v39;
  }
  else
  {
    id v43 = v5;
  }

  return v43;
}

+ (uint64_t)displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:
{
  return [a1 _displayNameForLanguage:a3 displayLanguage:a4 context:a5 length:0];
}

- (id)displayNameForLanguage:()InternationalSupportExtensions displayLanguage:context:
{
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [(id)objc_opt_class() _displayNameForLanguage:v8 displayLanguage:v7 context:a5 length:0];

  return v9;
}

- (id)displayNameForRegion:()InternationalSupportExtensions displayLanguage:context:short:
{
  id v9 = a4;
  id v10 = a3;
  uint64_t v11 = [(id)objc_opt_class() _displayNameForRegion:v10 displayLanguage:v9 context:a5 short:a6];

  return v11;
}

+ (uint64_t)isOnCalciumDevice
{
  return 0;
}

+ (id)_displayNameForNormalizedLanguage:()InternationalSupportExtensions context:displayLanguage:length:
{
  id v10 = a5;
  id v11 = a3;
  id v12 = objc_msgSend(a1, "_displayNameForNormalizedLanguage:context:displayLanguage:length:isCalcium:", v11, a4, v10, a6, objc_msgSend(a1, "isOnCalciumDevice"));

  return v12;
}

+ (id)_displayNameForNormalizedLanguage:()InternationalSupportExtensions context:displayLanguage:length:isCalcium:
{
  v49[1] = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  long long v47 = a1;
  id v12 = objc_opt_class();
  unint64_t v13 = 0x1E4F28000uLL;
  if ([v11 length])
  {
    uint64_t v14 = [v12 _normalizedLanguageIdentifierFromString:v11];
  }
  else
  {
    unint64_t v15 = [MEMORY[0x1E4F28B50] mainBundle];
    uint64_t v16 = [v15 preferredLocalizations];
    uint64_t v17 = [v16 firstObject];
    uint64_t v14 = [v12 _normalizedLanguageIdentifierFromString:v17];
  }
  unint64_t v18 = 0x1E4F1C000uLL;
  if (a7)
  {
    uint64_t v19 = [&unk_1F3FC2C18 objectForKeyedSubscript:v10];
    uint64_t v20 = (void *)MEMORY[0x1E4F28B50];
    uint64_t v21 = [v19 allKeys];
    uint64_t v22 = [&unk_1F3FC57E8 arrayByAddingObjectsFromArray:v21];
    v49[0] = v14;
    long long v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:1];
    long long v24 = [v20 preferredLocalizationsFromArray:v22 forPreferences:v23];
    uint64_t v25 = [v24 firstObject];

    if (![v25 length]) {
      goto LABEL_10;
    }
    if ([v25 isEqualToString:@"zxx"]) {
      goto LABEL_10;
    }
    uint64_t v26 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v25];
    uint64_t v27 = [v26 languageCode];
    uint64_t v28 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v14];
    uint64_t v29 = [v28 languageCode];
    char v30 = [v27 isEqualToString:v29];

    if (v30)
    {
      uint64_t v31 = [v19 objectForKeyedSubscript:v25];

      unint64_t v13 = 0x1E4F28000;
      unint64_t v18 = 0x1E4F1C000;
      if (v31) {
        goto LABEL_20;
      }
    }
    else
    {
LABEL_10:

      unint64_t v13 = 0x1E4F28000uLL;
      unint64_t v18 = 0x1E4F1C000uLL;
    }
  }
  long long v32 = [&unk_1F3FC2BC8 objectForKeyedSubscript:v10];
  uint64_t v33 = *(void **)(v13 + 2896);
  long long v34 = [v32 allKeys];
  long long v35 = [&unk_1F3FC5800 arrayByAddingObjectsFromArray:v34];
  long long v48 = v14;
  long long v36 = [*(id *)(v18 + 2424) arrayWithObjects:&v48 count:1];
  long long v37 = [v33 preferredLocalizationsFromArray:v35 forPreferences:v36];
  id v38 = [v37 firstObject];

  if (![v38 length]) {
    goto LABEL_16;
  }
  if ([v38 isEqualToString:@"zxx"]) {
    goto LABEL_16;
  }
  long long v39 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v38];
  long long v40 = [v39 languageCode];
  long long v41 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v14];
  long long v42 = [v41 languageCode];
  char v43 = [v40 isEqualToString:v42];

  if (v43)
  {
    uint64_t v31 = [v32 objectForKeyedSubscript:v38];

    if (v31) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
  [v14 UTF8String];
  uint64_t v44 = uldn_openForContext();
  if (v44)
  {
    uint64_t v31 = [v47 _ICUdisplayNameForLanguage:v10 capitalization:v44];
    uldn_close();
  }
  else
  {
    uint64_t v31 = 0;
  }
LABEL_20:
  if (![v31 length])
  {
    id v45 = v10;

    uint64_t v31 = v45;
  }

  return v31;
}

+ (id)_minimizeSubtagsForLocaleIdentifier:()InternationalSupportExtensions
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 UTF8String];
  uloc_minimizeSubtags();
  id v4 = v3;
  int v5 = [NSString stringWithUTF8String:v14];

  id v6 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v4];
  uint64_t v7 = *MEMORY[0x1E4F1C400];
  id v8 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];

  if ([v8 length])
  {
    id v9 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v5];
    id v10 = [v9 objectForKeyedSubscript:v7];
    uint64_t v11 = [v10 length];

    if (!v11)
    {
      uint64_t v12 = [NSString stringWithFormat:@"%@_%@", v5, v8];

      int v5 = (void *)v12;
    }
  }

  return v5;
}

+ (id)_ICUdisplayNameForLanguage:()InternationalSupportExtensions capitalization:
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [a3 UTF8String];
    unsigned int v4 = uldn_localeDisplayName();
    if (v4 >= 0x80) {
      uint64_t v6 = 128;
    }
    else {
      uint64_t v6 = v4;
    }
    int v5 = [NSString stringWithCharacters:v8 length:v6];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

+ (id)_languagesForRegion:()InternationalSupportExtensions subdivision:withThreshold:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  uint64_t v9 = [a3 uppercaseString];
  id v10 = [v8 uppercaseString];

  double v11 = 0.05;
  if (a5 != 1) {
    double v11 = 0.0;
  }
  if (a5 == 2) {
    double v12 = 0.6;
  }
  else {
    double v12 = v11;
  }
  if (objc_msgSend(v10, "length", v11))
  {
    unint64_t v13 = [a1 _regionLanguageDataForRegionCode:v9 subdivisionCode:v10];
    uint64_t v14 = [v13 objectForKeyedSubscript:@"all"];
    uint64_t v15 = __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke((uint64_t)v14, v13, @"override", a5);
    if (!v15
      || (uint64_t v16 = (void *)v15,
          [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v15],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          v16,
          !v17))
    {
      long long v48 = v13;
      long long v49 = v10;
      unint64_t v18 = v9;
      uint64_t v19 = [v14 keysSortedByValueUsingComparator:&__block_literal_global_271];
      uint64_t v20 = [MEMORY[0x1E4F1CA48] array];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      long long v54 = 0u;
      id v21 = v19;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v51 objects:v55 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v52;
LABEL_11:
        uint64_t v25 = 0;
        while (1)
        {
          if (*(void *)v52 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v51 + 1) + 8 * v25);
          uint64_t v27 = [v14 objectForKeyedSubscript:v26];
          [v27 floatValue];
          float v29 = v28;

          if (v12 > v29) {
            break;
          }
          [v20 addObject:v26];
          if (v23 == ++v25)
          {
            uint64_t v23 = [v21 countByEnumeratingWithState:&v51 objects:v55 count:16];
            if (v23) {
              goto LABEL_11;
            }
            break;
          }
        }
      }

      uint64_t v30 = [v20 count];
      uint64_t v9 = v18;
      id v10 = v49;
      unint64_t v13 = v48;
      if (v30)
      {
        uint64_t v31 = __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke(v30, v48, @"remove", a5);
        if ([v31 count]) {
          [v20 removeObjectsInArray:v31];
        }
      }
      uint64_t v17 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v20];
    }
    goto LABEL_22;
  }
  unint64_t v13 = [a1 _regionLanguageDataForRegionCode:v9 subdivisionCode:0];
  uint64_t v34 = __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke((uint64_t)v13, v13, @"override", a5);
  if (!v34
    || (long long v35 = (void *)v34,
        [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v34],
        uint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v35,
        !v17))
  {
    int v50 = 0;
    id v36 = v9;
    [v36 UTF8String];
    int LanguagesForRegion = ualoc_getLanguagesForRegion();
    long long v48 = v13;
    long long v49 = v10;
    long long v47 = v9;
    uint64_t v14 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:LanguagesForRegion];
    v46[1] = v46;
    MEMORY[0x1F4188790]();
    long long v39 = (char *)v46 - v38;
    [v36 UTF8String];
    ualoc_getLanguagesForRegion();
    if (v50 <= 0 && LanguagesForRegion >= 1)
    {
      uint64_t v40 = LanguagesForRegion;
      do
      {
        long long v41 = [NSString stringWithUTF8String:v39];
        long long v42 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v41];

        char v43 = [v42 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

        [v14 addObject:v43];
        v39 += 40;
        --v40;
      }
      while (v40);
    }
    uint64_t v44 = [v14 count];
    uint64_t v9 = v47;
    id v10 = v49;
    unint64_t v13 = v48;
    if (v44)
    {
      id v45 = __90__NSLocale_InternationalSupportExtensions___languagesForRegion_subdivision_withThreshold___block_invoke(v44, v48, @"remove", a5);
      if ([v45 count]) {
        [v14 removeObjectsInArray:v45];
      }
    }
    uint64_t v17 = [MEMORY[0x1E4F1CAA0] orderedSetWithArray:v14];
LABEL_22:
  }
  long long v32 = [v17 array];

  return v32;
}

+ (id)_regionLanguageDataForRegionCode:()InternationalSupportExtensions subdivisionCode:
{
  id v5 = a4;
  uint64_t v6 = [&unk_1F3FC3A50 objectForKeyedSubscript:a3];
  uint64_t v7 = v6;
  if (v5)
  {
    uint64_t v8 = [v6 objectForKeyedSubscript:v5];

    uint64_t v7 = (void *)v8;
  }

  return v7;
}

+ (void)_regionLanguageData
{
  return &unk_1F3FC3A50;
}

+ (void)_supportedKeyboardLanguages
{
  return &unk_1F3FC52F0;
}

+ (__CFString)_parentLocaleIdentifierForIdentifier:()InternationalSupportExtensions
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 UTF8String];
  ualoc_getAppleParent();
  unsigned int v4 = [NSString stringWithUTF8String:v7];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  if ([(__CFString *)v5 isEqualToString:v3])
  {

    id v5 = @"root";
  }

  return v5;
}

@end