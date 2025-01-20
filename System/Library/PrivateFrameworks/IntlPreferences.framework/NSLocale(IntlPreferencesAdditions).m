@interface NSLocale(IntlPreferencesAdditions)
+ (BOOL)_defaultUsesTwelveHourClockForLocaleIdentifier:()IntlPreferencesAdditions;
+ (id)_archivedPreferencesWithOverridingLanguages:()IntlPreferencesAdditions targetPlatform:hash:;
+ (id)_hashesFromAppPreferences:()IntlPreferencesAdditions;
+ (id)_languageIdentifiersForLanguage:()IntlPreferencesAdditions region:;
+ (id)_localeIdentifierForLanguage:()IntlPreferencesAdditions region:;
+ (id)_preferencesForSetLanguageAndRegion:()IntlPreferencesAdditions;
+ (id)_sanitizedLanguageIdentifierFromKeyboardLanguage:()IntlPreferencesAdditions;
+ (id)_sanitizedLanguageIdentifierFromKeyboardLanguage:()IntlPreferencesAdditions currentLocale:;
+ (id)addLikelySubtagsForLocaleIdentifier:()IntlPreferencesAdditions;
+ (id)archivedPreferencesWithHashesForBundleIDs:()IntlPreferencesAdditions;
+ (id)canonicalLanguageAndScriptCodeIdentifierForIdentifier:()IntlPreferencesAdditions;
+ (id)canonicalLocaleIdentifierFromComponents:()IntlPreferencesAdditions;
+ (id)canonicalLocaleIdentifierWithValidCalendarForComponents:()IntlPreferencesAdditions;
+ (id)deviceLanguageLocale;
+ (id)displayNameForSelectableScriptCode:()IntlPreferencesAdditions;
+ (id)languageArrayAfterSettingLanguage:()IntlPreferencesAdditions fallback:toLanguageArray:;
+ (id)languageIdentifierForRegisteringPreferredLanguageFromAddedKeyboardLanguage:()IntlPreferencesAdditions forPreferredLanguages:;
+ (id)renderableLanguagesFromList:()IntlPreferencesAdditions;
+ (id)renderableLocaleLanguages;
+ (id)renderableUILanguages;
+ (id)supportedCJLanguageIdentifiers;
+ (id)validateLocale:()IntlPreferencesAdditions;
+ (uint64_t)_usesTwelveHourClock;
+ (uint64_t)_usesTwelveHourClockForLoginWindow;
+ (uint64_t)archivedPreferences;
+ (uint64_t)archivedPreferencesForTargetPlatform:()IntlPreferencesAdditions;
+ (uint64_t)archivedPreferencesWithHash:()IntlPreferencesAdditions;
+ (uint64_t)deviceLanguageIdentifier;
+ (uint64_t)setLocaleAndResetCustomFormat:()IntlPreferencesAdditions;
+ (uint64_t)setLocaleAndResetTimeFormat:()IntlPreferencesAdditions;
+ (void)_insertFallbackLanguageIfNecessaryForRegion:()IntlPreferencesAdditions;
+ (void)_setUsesTwelveHourClock:()IntlPreferencesAdditions;
+ (void)_setUsesTwelveHourClockForLoginWindow:()IntlPreferencesAdditions;
+ (void)archivedPreferencesWithHashesForBundleIDs:()IntlPreferencesAdditions reply:;
+ (void)enableDefaultKeyboardForPreferredLanguages;
+ (void)registerPreferredLanguageForAddedKeyboardLanguage:()IntlPreferencesAdditions;
+ (void)resetCustomFormats;
+ (void)resetTimeFormat;
+ (void)setArchivedPreferences:()IntlPreferencesAdditions;
+ (void)setLanguageAndRegion:()IntlPreferencesAdditions;
+ (void)setLanguageToPreferredLanguages:()IntlPreferencesAdditions fallback:;
+ (void)setLocaleAfterLanguageChange:()IntlPreferencesAdditions;
+ (void)setLocaleAfterRegionChange:()IntlPreferencesAdditions;
+ (void)setLocaleOnly:()IntlPreferencesAdditions;
+ (void)setPreferredLanguageAndUpdateLocale:()IntlPreferencesAdditions;
+ (void)unregisterPreferredLanguageForKeyboardLanguage:()IntlPreferencesAdditions;
- (id)explanationTextForSelectableScripts;
- (id)localeByChangingLanguageTo:()IntlPreferencesAdditions;
- (id)optionNameForSelectableScripts;
- (id)optionNameWithColonForSelectableScripts;
- (id)selectableScriptCodes;
@end

@implementation NSLocale(IntlPreferencesAdditions)

+ (id)deviceLanguageLocale
{
  v0 = (void *)MEMORY[0x1E4F1CA20];
  v1 = [MEMORY[0x1E4F1CA20] deviceLanguage];
  v2 = [v0 localeWithLocaleIdentifier:v1];

  return v2;
}

+ (uint64_t)deviceLanguageIdentifier
{
  return [MEMORY[0x1E4F1CA20] deviceLanguage];
}

+ (id)supportedCJLanguageIdentifiers
{
  v0 = [MEMORY[0x1E4F1CA20] systemLanguages];
  v1 = [v0 indexesOfObjectsPassingTest:&__block_literal_global_5];

  v2 = [MEMORY[0x1E4F1CA20] systemLanguages];
  v3 = [v2 objectsAtIndexes:v1];

  return v3;
}

+ (id)canonicalLanguageAndScriptCodeIdentifierForIdentifier:()IntlPreferencesAdditions
{
  v20[2] = *MEMORY[0x1E4F143B8];
  v0 = objc_msgSend(MEMORY[0x1E4F1CA20], "addLikelySubtagsForLocaleIdentifier:");
  v1 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v0];
  uint64_t v2 = *MEMORY[0x1E4F1C438];
  v3 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  uint64_t v4 = *MEMORY[0x1E4F1C470];
  uint64_t v5 = [v1 objectForKeyedSubscript:*MEMORY[0x1E4F1C470]];
  v6 = (void *)v5;
  if (v3) {
    BOOL v7 = v5 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (!v7)
  {
    v19[0] = v2;
    v19[1] = v4;
    v20[0] = v3;
    v20[1] = v5;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = (void **)v20;
    v10 = v19;
    uint64_t v11 = 2;
LABEL_8:
    v12 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:v11];
    goto LABEL_9;
  }
  if (v3)
  {
    uint64_t v17 = v2;
    v18 = v3;
    v8 = (void *)MEMORY[0x1E4F1C9E8];
    v9 = &v18;
    v10 = &v17;
    uint64_t v11 = 1;
    goto LABEL_8;
  }
  v12 = 0;
LABEL_9:
  v13 = (void *)MEMORY[0x1E4F1CA20];
  v14 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v12];
  v15 = [v13 canonicalLanguageIdentifierFromString:v14];

  return v15;
}

+ (id)canonicalLocaleIdentifierFromComponents:()IntlPreferencesAdditions
{
  v0 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeIdentifierFromComponents:");
  v1 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromString:v0];

  return v1;
}

+ (id)addLikelySubtagsForLocaleIdentifier:()IntlPreferencesAdditions
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 UTF8String];
  uint64_t v4 = (void *)[[NSString alloc] initWithBytes:v6 length:(int)uloc_addLikelySubtags() encoding:4];

  return v4;
}

+ (id)renderableUILanguages
{
  if (renderableUILanguages_onceToken != -1) {
    dispatch_once(&renderableUILanguages_onceToken, &__block_literal_global_21);
  }
  v0 = (void *)renderableUILanguages___renderableLanguages;
  return v0;
}

+ (id)renderableLocaleLanguages
{
  if (renderableLocaleLanguages_onceToken != -1) {
    dispatch_once(&renderableLocaleLanguages_onceToken, &__block_literal_global_32);
  }
  v0 = (void *)renderableLocaleLanguages___renderableLanguages;
  return v0;
}

+ (id)renderableLanguagesFromList:()IntlPreferencesAdditions
{
  id v3 = a3;
  uint64_t v4 = [v3 indexesOfObjectsPassingTest:&__block_literal_global_35];
  uint64_t v5 = [v3 objectsAtIndexes:v4];

  return v5;
}

+ (void)setLocaleOnly:()IntlPreferencesAdditions
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 length])
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [MEMORY[0x1E4F1CA20] preferredLocale];
      uint64_t v5 = [v4 localeIdentifier];
      int v8 = 138543618;
      id v9 = v3;
      __int16 v10 = 2114;
      uint64_t v11 = v5;
      _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "Setting locale to %{public}@. Current locale is %{public}@.", (uint8_t *)&v8, 0x16u);
    }
    CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
    CFPreferencesSetAppValue(@"AppleLocale", v3, (CFStringRef)*MEMORY[0x1E4F1D3B8]);
    CFPreferencesAppSynchronize(v6);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleDatePreferencesChangedNotification", 0, 0, 1u);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleNumberPreferencesChangedNotification", 0, 0, 1u);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    +[NSLocale(IntlPreferencesAdditions) setLocaleOnly:]((uint64_t)v3);
  }
}

+ (uint64_t)setLocaleAndResetTimeFormat:()IntlPreferencesAdditions
{
  objc_msgSend(MEMORY[0x1E4F1CA20], "setLocaleOnly:");
  v0 = (void *)MEMORY[0x1E4F1CA20];
  return [v0 resetTimeFormat];
}

+ (void)resetTimeFormat
{
  CFStringRef v0 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFPreferencesSetAppValue(@"AppleICUForce12HourTime", 0, (CFStringRef)*MEMORY[0x1E4F1D3B8]);
  CFPreferencesSetAppValue(@"AppleICUForce24HourTime", 0, v0);
  CFPreferencesAppSynchronize(v0);
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
}

+ (uint64_t)setLocaleAndResetCustomFormat:()IntlPreferencesAdditions
{
  objc_msgSend(MEMORY[0x1E4F1CA20], "setLocaleOnly:");
  CFStringRef v0 = (void *)MEMORY[0x1E4F1CA20];
  return [v0 resetCustomFormats];
}

+ (void)resetCustomFormats
{
  id v1 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v0 = *MEMORY[0x1E4F283E0];
  [v1 removeObjectForKey:@"AppleICUDateFormatStrings" inDomain:*MEMORY[0x1E4F283E0]];
  [v1 removeObjectForKey:@"AppleICUNumberSymbols" inDomain:v0];
}

+ (id)validateLocale:()IntlPreferencesAdditions
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F1CA20] availableLocaleIdentifiers];
  uint64_t v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v3];
  uint64_t v6 = *MEMORY[0x1E4F1C438];
  uint64_t v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  if ([v4 containsObject:v7])
  {
    id v8 = v3;
  }
  else
  {
    v21 = v7;
    id v22 = v3;
    [MEMORY[0x1E4F1CA20] preferredLanguages];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          v15 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v14];
          v16 = [v15 objectForKeyedSubscript:v6];

          if ([v4 containsObject:v16])
          {
            id v3 = v22;
            id v8 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifier:v22 withNewLanguageIdentifier:v14];

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v17 = (void *)MEMORY[0x1E4F1CA20];
    v18 = [MEMORY[0x1E4F1CA20] currentLocale];
    v19 = [v18 localeIdentifier];
    id v8 = [v17 canonicalLocaleIdentifierFromString:v19];

    id v3 = v22;
LABEL_13:
    uint64_t v7 = v21;
  }

  return v8;
}

+ (void)setLocaleAfterLanguageChange:()IntlPreferencesAdditions
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  uint64_t v5 = [v3 preferredLocale];
  id v11 = [v5 localeIdentifier];

  uint64_t v6 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifier:v11 withNewLanguageIdentifier:v4];

  uint64_t v7 = [MEMORY[0x1E4F1CA20] validateLocale:v6];

  id v8 = (void *)MEMORY[0x1E4F1CA20];
  id v9 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v7];
  uint64_t v10 = [v8 canonicalLocaleIdentifierWithValidCalendarForComponents:v9];

  if (([v10 isEqualToString:v11] & 1) == 0) {
    [MEMORY[0x1E4F1CA20] setLocaleAndResetCustomFormat:v10];
  }
}

+ (void)_insertFallbackLanguageIfNecessaryForRegion:()IntlPreferencesAdditions
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  id v7 = [v3 preferredLanguages];
  uint64_t v5 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  uint64_t v6 = +[IntlUtility preferredLanguagesFromLanguages:v5 byAddingFallbacksForRegion:v4];

  if ([v6 count] && (objc_msgSend(v6, "isEqualToArray:", v7) & 1) == 0) {
    [MEMORY[0x1E4F1CA20] setPreferredLanguages:v6];
  }
}

+ (void)setLocaleAfterRegionChange:()IntlPreferencesAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  [v4 _insertFallbackLanguageIfNecessaryForRegion:v5];
  id v6 = [a1 localeIdentifierForRegionChange:v5];

  [MEMORY[0x1E4F1CA20] setLocaleAndResetCustomFormat:v6];
}

+ (id)canonicalLocaleIdentifierWithValidCalendarForComponents:()IntlPreferencesAdditions
{
  id v3 = (void *)[a3 mutableCopy];
  id v4 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromComponents:v3];
  id v5 = +[IntlUtility defaultCalendarForLocaleID:v4];
  id v6 = [v3 objectForKey:@"calendar"];

  if (v6)
  {
    id v7 = [v3 objectForKey:@"calendar"];
    int v8 = [v7 isEqualToString:v5];

    if (!v8) {
      goto LABEL_7;
    }
    [v3 removeObjectForKey:@"calendar"];
  }
  else
  {
    id v9 = +[IntlUtility supportedCalendars];
    char v10 = [v9 containsObject:v5];

    if (v10) {
      goto LABEL_7;
    }
    [v3 setObject:*MEMORY[0x1E4F1C318] forKeyedSubscript:@"calendar"];
  }
  uint64_t v11 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromComponents:v3];

  id v4 = (void *)v11;
LABEL_7:

  return v4;
}

+ (id)languageArrayAfterSettingLanguage:()IntlPreferencesAdditions fallback:toLanguageArray:
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)[a5 mutableCopy];
  uint64_t v10 = [v9 count];
  if (v7 && v10)
  {
    uint64_t v11 = [v9 indexOfObject:v7];
    uint64_t v12 = v11;
    if (v8)
    {
      v13 = (void *)MEMORY[0x1E4F28B50];
      v27[0] = @"zxx";
      v27[1] = v8;
      uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
      id v26 = v7;
      v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
      v16 = [v13 preferredLocalizationsFromArray:v14 forPreferences:v15];
      uint64_t v17 = [v16 firstObject];
      int v18 = [v17 isEqualToString:v8] ^ 1;

      if (v12) {
        goto LABEL_8;
      }
    }
    else
    {
      int v18 = 0;
      if (v11) {
        goto LABEL_8;
      }
    }
    if (!v18) {
      goto LABEL_18;
    }
LABEL_8:
    v19 = (void *)MEMORY[0x1E4F1CA20];
    v20 = [v9 firstObject];
    v21 = [v19 baseLanguageFromLanguage:v20];

    if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
      [v9 removeObjectAtIndex:v12];
    }
    id v22 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v7];
    int v23 = [v22 isEqualToString:v21];

    if (v23)
    {
      [v9 setObject:v7 atIndexedSubscript:0];
      if (!v18) {
        goto LABEL_17;
      }
    }
    else
    {
      [v9 insertObject:v7 atIndex:0];
      if (!v18)
      {
LABEL_17:

        goto LABEL_18;
      }
    }
    uint64_t v24 = [v9 indexOfObject:v8];
    if (v24 != 0x7FFFFFFFFFFFFFFFLL) {
      [v9 removeObjectAtIndex:v24];
    }
    [v9 insertObject:v8 atIndex:1];
    goto LABEL_17;
  }
LABEL_18:

  return v9;
}

+ (void)setPreferredLanguageAndUpdateLocale:()IntlPreferencesAdditions
{
  id v3 = a3;
  [MEMORY[0x1E4F1CA20] setLocaleAfterLanguageChange:v3];
  id v4 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v3];
  id v10 = v3;
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];

  id v6 = v10;
  if (!v5)
  {
    id v7 = (void *)MEMORY[0x1E4F1CA20];
    id v8 = [MEMORY[0x1E4F1CA20] preferredLocale];
    id v9 = [v8 regionCode];
    id v6 = [v7 languageFromLanguage:v10 byReplacingRegion:v9];
  }
  [MEMORY[0x1E4F1CA20] setLanguageToPreferredLanguages:v6 fallback:0];
}

+ (void)setLanguageToPreferredLanguages:()IntlPreferencesAdditions fallback:
{
  id v5 = (void *)MEMORY[0x1E4F1CA20];
  id v6 = a4;
  id v7 = a3;
  id v9 = [v5 preferredLanguages];
  id v8 = [(id)objc_opt_class() languageArrayAfterSettingLanguage:v7 fallback:v6 toLanguageArray:v9];

  if ([v8 count] && (objc_msgSend(v9, "isEqualToArray:", v8) & 1) == 0) {
    [MEMORY[0x1E4F1CA20] setPreferredLanguages:v8];
  }
}

+ (id)_preferencesForSetLanguageAndRegion:()IntlPreferencesAdditions
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA60] dictionaryWithCapacity:2];
  if (![(__CFString *)v3 length])
  {
    id v5 = @"en-001";

    id v3 = v5;
  }
  id v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = [MEMORY[0x1E4F1CA20] addLikelySubtagsForLocaleIdentifier:v3];
  id v8 = [v6 componentsFromLocaleIdentifier:v7];
  id v9 = (void *)[v8 mutableCopy];

  id v10 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v9];
  uint64_t v11 = +[IntlUtility normalizedLanguageIDFromString:v10];

  uint64_t v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v11];
  v13 = [v12 countryCode];

  if (!v13)
  {
    uint64_t v14 = *MEMORY[0x1E4F1C400];
    v15 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1C400]];

    if (v15)
    {
      v13 = [v9 objectForKeyedSubscript:v14];
    }
    else
    {
      v13 = @"001";
      [v9 setObject:v13 forKeyedSubscript:v14];
    }
    uint64_t v16 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v11 byReplacingRegion:v13];

    uint64_t v11 = (void *)v16;
  }
  uint64_t v17 = [MEMORY[0x1E4F1CA20] systemLanguages];
  char v18 = [v17 containsObject:v11];

  if (v18) {
    goto LABEL_12;
  }
  v19 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v11];
  v20 = [MEMORY[0x1E4F1CA20] systemLanguages];
  if ([v20 containsObject:v19])
  {

LABEL_12:
    v28[0] = v11;
    int v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v28 count:1];
    [v4 setObject:v23 forKeyedSubscript:@"AppleLanguages"];
    goto LABEL_13;
  }
  v21 = [MEMORY[0x1E4F1CA20] baseSystemLanguages];
  int v22 = [v21 containsObject:v19];

  if (v22) {
    goto LABEL_12;
  }
  int v23 = objc_msgSend(MEMORY[0x1E4F1CA20], "languageFromLanguage:byReplacingRegion:", @"en-001", v13, v11);
  v27[1] = v23;
  id v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  [v4 setObject:v26 forKeyedSubscript:@"AppleLanguages"];

LABEL_13:
  uint64_t v24 = [MEMORY[0x1E4F1CA20] canonicalLocaleIdentifierFromComponents:v9];
  [v4 setObject:v24 forKeyedSubscript:@"AppleLocale"];

  return v4;
}

+ (void)setLanguageAndRegion:()IntlPreferencesAdditions
{
  objc_msgSend(a1, "_preferencesForSetLanguageAndRegion:");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA20];
  id v3 = [v10 objectForKeyedSubscript:@"AppleLanguages"];
  [v2 setPreferredLanguages:v3];

  id v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = [v10 objectForKeyedSubscript:@"AppleLocale"];
  id v6 = [v4 localeWithLocaleIdentifier:v5];
  id v7 = [v6 countryCode];
  [a1 _insertFallbackLanguageIfNecessaryForRegion:v7];

  id v8 = (void *)MEMORY[0x1E4F1CA20];
  id v9 = [v10 objectForKeyedSubscript:@"AppleLocale"];
  [v8 setLocaleAndResetCustomFormat:v9];
}

+ (uint64_t)_usesTwelveHourClock
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  uint64_t v3 = *MEMORY[0x1E4F283E0];
  id v4 = [v2 objectForKey:@"AppleICUForce12HourTime" inDomain:*MEMORY[0x1E4F283E0]];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    uint64_t v6 = 1;
  }
  else
  {
    id v7 = [v2 objectForKey:@"AppleICUForce24HourTime" inDomain:v3];
    char v8 = [v7 BOOLValue];

    if (v8)
    {
      uint64_t v6 = 0;
    }
    else
    {
      id v9 = [MEMORY[0x1E4F1CA20] preferredLocale];
      id v10 = [v9 localeIdentifier];
      uint64_t v6 = [a1 _defaultUsesTwelveHourClockForLocaleIdentifier:v10];
    }
  }

  return v6;
}

+ (uint64_t)_usesTwelveHourClockForLoginWindow
{
  CFStringRef v2 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v3 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  char v5 = (void *)CFPreferencesCopyValue(@"AppleICUForce12HourTime", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  uint64_t v6 = (void *)CFPreferencesCopyValue(@"AppleICUForce24HourTime", v2, v3, v4);
  id v7 = (void *)CFPreferencesCopyValue(@"AppleLocale", v2, v3, v4);
  if ([v5 BOOLValue])
  {
    uint64_t v8 = 1;
  }
  else if ([v6 BOOLValue])
  {
    uint64_t v8 = 0;
  }
  else
  {
    uint64_t v8 = [a1 _defaultUsesTwelveHourClockForLocaleIdentifier:v7];
  }

  return v8;
}

+ (BOOL)_defaultUsesTwelveHourClockForLocaleIdentifier:()IntlPreferencesAdditions
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:");
  id v1 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v1 setLocale:v0];
  [v1 setDateStyle:0];
  [v1 setTimeStyle:1];
  CFStringRef v2 = [v1 dateFormat];
  if ([v2 length])
  {
    unint64_t v3 = 0;
    uint64_t v4 = 0;
    char v5 = 0;
    do
    {
      int v6 = [v2 characterAtIndex:v3];
      if (v6 == 104 || v6 == 75)
      {
        v4 += (v5 & 1) == 0;
      }
      else if (v6 == 39)
      {
        v5 ^= 1u;
      }
      ++v3;
    }
    while (v3 < [v2 length]);
  }
  else
  {
    uint64_t v4 = 0;
  }

  return v4 != 0;
}

+ (void)_setUsesTwelveHourClock:()IntlPreferencesAdditions
{
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  char v5 = [MEMORY[0x1E4F1CA20] preferredLocale];
  int v6 = [v5 localeIdentifier];
  int v7 = [a1 _defaultUsesTwelveHourClockForLocaleIdentifier:v6];

  uint64_t v8 = *MEMORY[0x1E4F283E0];
  if (v7 == a3)
  {
    [v9 removeObjectForKey:@"AppleICUForce12HourTime" inDomain:*MEMORY[0x1E4F283E0]];
    goto LABEL_5;
  }
  if (a3)
  {
    [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"AppleICUForce12HourTime" inDomain:*MEMORY[0x1E4F283E0]];
LABEL_5:
    [v9 removeObjectForKey:@"AppleICUForce24HourTime" inDomain:v8];
    goto LABEL_7;
  }
  [v9 removeObjectForKey:@"AppleICUForce12HourTime" inDomain:*MEMORY[0x1E4F283E0]];
  [v9 setObject:MEMORY[0x1E4F1CC38] forKey:@"AppleICUForce24HourTime" inDomain:v8];
LABEL_7:
}

+ (void)_setUsesTwelveHourClockForLoginWindow:()IntlPreferencesAdditions
{
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v6 = (const __CFString *)*MEMORY[0x1E4F1D3D0];
  CFStringRef v7 = (const __CFString *)*MEMORY[0x1E4F1D3E0];
  id v10 = (id)CFPreferencesCopyValue(@"AppleLocale", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3D0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
  if (objc_msgSend(a1, "_defaultUsesTwelveHourClockForLocaleIdentifier:") == a3)
  {
    uint64_t v8 = 0;
    goto LABEL_5;
  }
  if (a3)
  {
    uint64_t v8 = (const void *)*MEMORY[0x1E4F1CFD0];
LABEL_5:
    CFPreferencesSetValue(@"AppleICUForce12HourTime", v8, v5, v6, v7);
    id v9 = 0;
    goto LABEL_7;
  }
  CFPreferencesSetValue(@"AppleICUForce12HourTime", 0, v5, v6, v7);
  id v9 = (const void *)*MEMORY[0x1E4F1CFD0];
LABEL_7:
  CFPreferencesSetValue(@"AppleICUForce24HourTime", v9, v5, v6, v7);
}

+ (id)_languageIdentifiersForLanguage:()IntlPreferencesAdditions region:
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v6 = a3;
  CFStringRef v7 = [IPLanguageListManager alloc];
  v12[0] = v6;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];

  id v9 = [(IPLanguageListManager *)v7 initWithPreferredLanguages:v8];
  [(IPLanguageListManager *)v9 setRegion:v5 updateFirstLanguage:0];

  id v10 = [(IPLanguageListManager *)v9 preferredLanguages];

  return v10;
}

+ (id)_localeIdentifierForLanguage:()IntlPreferencesAdditions region:
{
  id v5 = (void *)MEMORY[0x1E4F1CA20];
  id v6 = a4;
  CFStringRef v7 = [v5 localeWithLocaleIdentifier:a3];
  uint64_t v8 = [v5 _localeIdentifierForRegionChangeFrom:v7 to:v6];

  return v8;
}

+ (void)enableDefaultKeyboardForPreferredLanguages
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v1 = [v0 firstObject];

  if (v1)
  {
    CFStringRef v2 = [(objc_class *)IPUIKeyboardInputModeController() sharedInputModeController];
    unint64_t v3 = [v2 suggestedInputModesForCurrentLocale];

    v44 = v3;
    v45 = v1;
    if ([v3 count])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v4 = v3;
      uint64_t v5 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
      if (v5)
      {
        uint64_t v6 = v5;
        uint64_t v7 = *(void *)v56;
LABEL_5:
        uint64_t v8 = 0;
        while (1)
        {
          if (*(void *)v56 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v55 + 1) + 8 * v8);
          if ([v9 enabled]) {
            break;
          }
          if (v6 == ++v8)
          {
            uint64_t v6 = [v4 countByEnumeratingWithState:&v55 objects:v61 count:16];
            if (v6) {
              goto LABEL_5;
            }
            goto LABEL_11;
          }
        }
        id v10 = [v9 identifier];

        if (v10) {
          goto LABEL_15;
        }
      }
      else
      {
LABEL_11:
      }
      uint64_t v11 = [v4 objectAtIndex:0];
      id v10 = [v11 identifier];
    }
    else
    {
      id v10 = IPUIKeyboardCanonicalInputModeName(v1);
    }
LABEL_15:
    uint64_t v12 = [(objc_class *)IPUIKeyboardInputModeController() sharedInputModeController];
    v13 = [v12 normalizedEnabledInputModeIdentifiers];

    v46 = v13;
    if (([v13 containsObject:v10] & 1) == 0)
    {
      uint64_t v14 = IPUIKeyboardInputModeGetBaseLanguage(v10);
      if ([v14 isEqualToString:@"zh"])
      {
        uint64_t v15 = IPUIKeyboardInputModeGetLanguageWithRegion(v10);

        uint64_t v14 = (void *)v15;
      }
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v16 = v13;
      uint64_t v17 = [v16 countByEnumeratingWithState:&v51 objects:v60 count:16];
      if (v17)
      {
        uint64_t v18 = v17;
        uint64_t v19 = *(void *)v52;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v52 != v19) {
              objc_enumerationMutation(v16);
            }
            v21 = *(void **)(*((void *)&v51 + 1) + 8 * i);
            int v22 = IPUIKeyboardInputModeGetBaseLanguage(v21);
            if ([v22 isEqualToString:@"zh"])
            {
              uint64_t v23 = IPUIKeyboardInputModeGetLanguageWithRegion(v21);

              int v22 = (void *)v23;
            }
            if ([v14 isEqualToString:v22])
            {
              id v24 = v21;

              id v10 = v24;
              goto LABEL_30;
            }
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v51 objects:v60 count:16];
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_30:
    }
    long long v25 = [(objc_class *)IPUIKeyboardInputModeController() sharedInputModeController];
    id v26 = [v25 supportedInputModeIdentifiers];

    v27 = IPUIKeyboardInputModeGetNormalizedIdentifier(v10);
    v43 = v26;
    char v28 = [v26 containsObject:v27];

    if ((v28 & 1) == 0)
    {
      uint64_t v29 = IPUIKeyboardInputMode_Intl();

      id v10 = (void *)v29;
    }
    v30 = (void *)MEMORY[0x1E4F1CA48];
    v31 = IPUIKeyboardInputModeGetIdentifierWithKeyboardLayouts(v10);
    v32 = [v30 arrayWithObject:v31];

    long long v49 = 0u;
    long long v50 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    v33 = [(objc_class *)IPUIKeyboardInputModeController() sharedInputModeController];
    v34 = [v33 activeInputModeIdentifiers];

    uint64_t v35 = [v34 countByEnumeratingWithState:&v47 objects:v59 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      int v37 = 0;
      uint64_t v38 = *(void *)v48;
      do
      {
        for (uint64_t j = 0; j != v36; ++j)
        {
          if (*(void *)v48 != v38) {
            objc_enumerationMutation(v34);
          }
          v40 = *(void **)(*((void *)&v47 + 1) + 8 * j);
          v41 = IPUIKeyboardCanonicalInputModeName(v40);
          if ([v10 isEqualToString:v41])
          {
            if (v37)
            {
              [v32 insertObject:v40 atIndex:v37++];
            }
            else
            {
              [v32 replaceObjectAtIndex:0 withObject:v40];
              int v37 = 1;
            }
          }
          else
          {
            [v32 addObject:v40];
          }
        }
        uint64_t v36 = [v34 countByEnumeratingWithState:&v47 objects:v59 count:16];
      }
      while (v36);
    }

    v42 = [(objc_class *)IPUIKeyboardPreferencesController() sharedPreferencesController];
    [v42 saveInputModes:v32];

    CFPreferencesSetAppValue(@"KeyboardLastUsed", 0, @"com.apple.Preferences");
    id v1 = v45;
  }
}

+ (id)_sanitizedLanguageIdentifierFromKeyboardLanguage:()IntlPreferencesAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  uint64_t v6 = [v4 currentLocale];
  uint64_t v7 = [a1 _sanitizedLanguageIdentifierFromKeyboardLanguage:v5 currentLocale:v6];

  return v7;
}

+ (id)_sanitizedLanguageIdentifierFromKeyboardLanguage:()IntlPreferencesAdditions currentLocale:
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![v6 length])
  {
    id v10 = 0;
    goto LABEL_26;
  }
  uint64_t v35 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v6];
  uint64_t v8 = [v35 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v9 = [a1 renderableUILanguages];
  id v10 = (void *)[v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (!v10) {
    goto LABEL_25;
  }
  v33 = v7;
  id v34 = v6;
  uint64_t v11 = *(void *)v37;
  uint64_t v12 = *MEMORY[0x1E4F1C470];
  while (2)
  {
    for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v37 != v11) {
        objc_enumerationMutation(v9);
      }
      uint64_t v14 = *(void *)(*((void *)&v36 + 1) + 8 * i);
      uint64_t v15 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v14];
      id v16 = [v15 languageCode];
      int v17 = [v8 isEqualToString:v16];

      if (v17)
      {
        uint64_t v18 = [v35 objectForKeyedSubscript:v12];
        uint64_t v19 = v18;
        if (v18)
        {
          id v20 = v18;
        }
        else
        {
          id v20 = [MEMORY[0x1E4F1CA20] scriptCodeFromLanguage:v34];
        }
        v21 = v20;

        int v22 = [v15 scriptCode];
        uint64_t v23 = v22;
        if (v22)
        {
          id v24 = v22;
        }
        else
        {
          id v24 = [MEMORY[0x1E4F1CA20] scriptCodeFromLanguage:v14];
        }
        long long v25 = v24;

        char v26 = [v21 isEqualToString:v25];
        if (v26)
        {

          uint64_t v27 = *MEMORY[0x1E4F1C400];
          id v7 = v33;
          id v9 = [v33 objectForKey:*MEMORY[0x1E4F1C400]];
          char v28 = [v35 objectForKeyedSubscript:v27];
          uint64_t v29 = [MEMORY[0x1E4F1CA20] systemLanguages];
          id v6 = v34;
          v30 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v34];
          if ([v29 containsObject:v30])
          {
            uint64_t v31 = [v28 length];

            if (!v31)
            {
LABEL_24:
              id v10 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v34 byReplacingRegion:v9];

              goto LABEL_25;
            }
            uint64_t v29 = v9;
            id v9 = v28;
          }
          else
          {
          }
          goto LABEL_24;
        }
      }
    }
    id v10 = (void *)[v9 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v10) {
      continue;
    }
    break;
  }
  id v7 = v33;
  id v6 = v34;
LABEL_25:

LABEL_26:
  return v10;
}

+ (id)languageIdentifierForRegisteringPreferredLanguageFromAddedKeyboardLanguage:()IntlPreferencesAdditions forPreferredLanguages:
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = [a1 _sanitizedLanguageIdentifierFromKeyboardLanguage:a3];
  if (!v7)
  {
    id v20 = 0;
    goto LABEL_19;
  }
  uint64_t v8 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v7];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA20], "baseLanguageFromLanguage:", *(void *)(*((void *)&v22 + 1) + 8 * i), (void)v22);
        char v15 = [v14 isEqualToString:v8];

        if (v15)
        {
          int v16 = 0;
          goto LABEL_12;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }
  int v16 = 1;
LABEL_12:

  int v17 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v18 = [v17 bundleIdentifier];
  int v19 = [v18 isEqualToString:@"com.apple.purplebuddy"];

  if (!v19)
  {
    if (!v16) {
      goto LABEL_14;
    }
LABEL_17:
    id v20 = v7;
    goto LABEL_18;
  }
  if (v16 & ([v8 isEqualToString:@"en"] ^ 1)) {
    goto LABEL_17;
  }
LABEL_14:
  id v20 = 0;
LABEL_18:

LABEL_19:
  return v20;
}

+ (void)registerPreferredLanguageForAddedKeyboardLanguage:()IntlPreferencesAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  id v6 = [v4 _globalPreferredLanguages];
  id v9 = [a1 languageIdentifierForRegisteringPreferredLanguageFromAddedKeyboardLanguage:v5 forPreferredLanguages:v6];

  uint64_t v8 = v9;
  if (v9)
  {
    LODWORD(v7) = *MEMORY[0x1E4F28560];
    [MEMORY[0x1E4F1CA20] registerPreferredLanguage:v9 usage:2 confidence:v7];
    uint64_t v8 = v9;
  }
}

+ (void)unregisterPreferredLanguageForKeyboardLanguage:()IntlPreferencesAdditions
{
  id v4 = objc_msgSend(a1, "_sanitizedLanguageIdentifierFromKeyboardLanguage:");
  if (v4)
  {
    id v13 = v4;
    id v5 = [MEMORY[0x1E4F1CA20] _globalPreferredLanguages];
    if ((unint64_t)[v5 count] >= 2)
    {
      uint64_t v6 = [v5 indexOfObject:v13];
      uint64_t v7 = v6;
      if (v6) {
        BOOL v8 = v6 == 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v8 = 1;
      }
      if (v8)
      {
        int v10 = 0;
      }
      else
      {
        id v1 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v13];
        id v9 = (void *)MEMORY[0x1E4F1CA20];
        CFStringRef v2 = [MEMORY[0x1E4F1CA20] _deviceLanguage];
        unint64_t v3 = [v9 baseLanguageFromLanguage:v2];
        int v10 = [v1 isEqualToString:v3] ^ 1;
      }
      if (v7) {
        BOOL v11 = v7 == 0x7FFFFFFFFFFFFFFFLL;
      }
      else {
        BOOL v11 = 1;
      }
      if (!v11)
      {

        if (!v10) {
          goto LABEL_16;
        }
        goto LABEL_15;
      }
      if (v10)
      {
LABEL_15:
        uint64_t v12 = (void *)[v5 mutableCopy];
        [v12 removeObjectAtIndex:v7];
        [MEMORY[0x1E4F1CA20] setPreferredLanguages:v12];
      }
    }
LABEL_16:

    id v4 = v13;
  }
}

- (id)localeByChangingLanguageTo:()IntlPreferencesAdditions
{
  id v4 = (void *)MEMORY[0x1E4F1CA20];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = [a1 localeIdentifier];
  BOOL v8 = [v6 canonicalLocaleIdentifier:v7 withNewLanguageIdentifier:v5];

  id v9 = [v4 localeWithLocaleIdentifier:v8];

  return v9;
}

+ (uint64_t)archivedPreferences
{
  return [a1 archivedPreferencesWithHash:0];
}

+ (uint64_t)archivedPreferencesForTargetPlatform:()IntlPreferencesAdditions
{
  return [a1 _archivedPreferencesWithOverridingLanguages:0 targetPlatform:a3 hash:0];
}

+ (uint64_t)archivedPreferencesWithHash:()IntlPreferencesAdditions
{
  return [a1 _archivedPreferencesWithOverridingLanguages:0 targetPlatform:0 hash:a3];
}

+ (id)_archivedPreferencesWithOverridingLanguages:()IntlPreferencesAdditions targetPlatform:hash:
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  BOOL v8 = [MEMORY[0x1E4F1CA60] dictionary];
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  memset(&v29, 0, sizeof(v29));
  CC_SHA1_Init(&v29);
  if ([v7 count])
  {
    int v10 = (void *)[v7 copy];
  }
  else
  {
    BOOL v11 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v12 = [v11 count];

    if (!v12) {
      goto LABEL_6;
    }
    id v13 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    int v10 = (void *)[v13 copy];
  }
  [v8 setObject:v10 forKeyedSubscript:@"AppleLanguages"];
  IP_hashKeyValue(&v29, @"AppleLanguages", v10);

LABEL_6:
  uint64_t v14 = [MEMORY[0x1E4F1CA20] preferredLocale];
  char v15 = [v14 localeIdentifier];
  if ([v15 length])
  {
    if (a4 >= 2)
    {
      int v16 = [v14 calendarIdentifier];
      int v17 = +[IntlUtility _supportedCalendarsOnEmbeddedSystems];
      char v18 = [v17 containsObject:v16];

      if ((v18 & 1) == 0)
      {
        int v19 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v15];
        id v20 = (void *)[v19 mutableCopy];

        [v20 setObject:*MEMORY[0x1E4F1C318] forKeyedSubscript:@"calendar"];
        uint64_t v21 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v20];

        char v15 = (void *)v21;
      }
    }
    [v8 setObject:v15 forKeyedSubscript:@"AppleLocale"];
    IP_hashKeyValue(&v29, @"AppleLocale", v15);
  }

  long long v22 = [MEMORY[0x1E4F1CA20] _preferredTemperatureUnit];
  if ([v22 length])
  {
    [v8 setObject:v22 forKeyedSubscript:@"AppleTemperatureUnit"];
    IP_hashKeyValue(&v29, @"AppleTemperatureUnit", v22);
  }

  uint64_t v23 = *MEMORY[0x1E4F283E0];
  long long v24 = [v9 objectForKey:@"AppleICUForce12HourTime" inDomain:*MEMORY[0x1E4F283E0]];
  if (v24)
  {
    [v8 setObject:v24 forKeyedSubscript:@"AppleICUForce12HourTime"];
    IP_hashKeyValue(&v29, @"AppleICUForce12HourTime", v24);
  }

  long long v25 = [v9 objectForKey:@"AppleICUForce24HourTime" inDomain:v23];
  if (v25)
  {
    [v8 setObject:v25 forKeyedSubscript:@"AppleICUForce24HourTime"];
    IP_hashKeyValue(&v29, @"AppleICUForce24HourTime", v25);
  }

  char v26 = [MEMORY[0x1E4F292A8] _currentGlobalUserInflectionIfAvailable];
  uint64_t v27 = [v26 externalRepresentation];
  if (v27)
  {
    [v8 setObject:v27 forKeyedSubscript:@"ArchivedInflection"];
    IP_hashKeyValue(&v29, @"ArchivedInflection", v27);
  }

  CC_SHA1_Final(md, &v29);
  if (a5)
  {
    *a5 = [MEMORY[0x1E4F1C9B8] dataWithBytes:md length:20];
  }

  return v8;
}

+ (id)_hashesFromAppPreferences:()IntlPreferencesAdditions
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v4, "count"));
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v18 = v4;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v21 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v6, "objectForKeyedSubscript:", v11, v18);
          id v19 = 0;
          id v13 = (id)[a1 _archivedPreferencesWithOverridingLanguages:v12 targetPlatform:0 hash:&v19];
          v24[0] = @"AppleLanguages";
          v24[1] = @"hash";
          v25[0] = v12;
          v25[1] = v19;
          uint64_t v14 = (void *)MEMORY[0x1E4F1C9E8];
          id v15 = v19;
          int v16 = [v14 dictionaryWithObjects:v25 forKeys:v24 count:2];
          [v5 setObject:v16 forKeyedSubscript:v11];
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v26 count:16];
      }
      while (v8);
    }

    id v4 = v18;
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

+ (void)archivedPreferencesWithHashesForBundleIDs:()IntlPreferencesAdditions reply:
{
  id v6 = a4;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __86__NSLocale_IntlPreferencesAdditions__archivedPreferencesWithHashesForBundleIDs_reply___block_invoke;
  v8[3] = &unk_1E63C01D0;
  id v9 = v6;
  uint64_t v10 = a1;
  id v7 = v6;
  +[IntlUtility preferredLanguagesForBundleIDs:a3 reply:v8];
}

+ (id)archivedPreferencesWithHashesForBundleIDs:()IntlPreferencesAdditions
{
  CFStringRef v2 = +[IntlUtility preferredLanguagesForBundleIDs:](IntlUtility, "preferredLanguagesForBundleIDs:");
  unint64_t v3 = [a1 _hashesFromAppPreferences:v2];

  return v3;
}

+ (void)setArchivedPreferences:()IntlPreferencesAdditions
{
  id v21 = a3;
  unint64_t v3 = [v21 objectForKeyedSubscript:@"AppleLanguages"];

  if (v3)
  {
    id v4 = [v21 objectForKeyedSubscript:@"AppleLanguages"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 count]) {
      [MEMORY[0x1E4F1CA20] setPreferredLanguages:v4];
    }
  }
  id v5 = [v21 objectForKeyedSubscript:@"AppleLocale"];

  if (v5)
  {
    id v6 = [v21 objectForKeyedSubscript:@"AppleLocale"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v6 length]) {
      [MEMORY[0x1E4F1CA20] setLocaleOnly:v6];
    }
  }
  id v7 = [v21 objectForKeyedSubscript:@"AppleTemperatureUnit"];

  uint64_t v8 = v21;
  if (v7)
  {
    id v9 = [v21 objectForKeyedSubscript:@"AppleTemperatureUnit"];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && [v9 length]) {
      [MEMORY[0x1E4F1CA20] _setPreferredTemperatureUnit:v9];
    }

    uint64_t v8 = v21;
  }
  uint64_t v10 = [v8 objectForKeyedSubscript:@"AppleICUForce12HourTime"];
  if (v10)
  {
  }
  else
  {
    uint64_t v11 = [v21 objectForKeyedSubscript:@"AppleICUForce24HourTime"];

    if (!v11) {
      goto LABEL_20;
    }
  }
  uint64_t v12 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v13 = [v21 objectForKeyedSubscript:@"AppleICUForce12HourTime"];
  uint64_t v14 = *MEMORY[0x1E4F283E0];
  [v12 setObject:v13 forKey:@"AppleICUForce12HourTime" inDomain:*MEMORY[0x1E4F283E0]];

  id v15 = [v21 objectForKeyedSubscript:@"AppleICUForce24HourTime"];
  [v12 setObject:v15 forKey:@"AppleICUForce24HourTime" inDomain:v14];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"AppleTimePreferencesChangedNotification", 0, 0, 1u);
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"SignificantTimeChangeNotification", 0, 0, 1u);

LABEL_20:
  int v17 = [v21 objectForKeyedSubscript:@"ArchivedInflection"];

  if (v17)
  {
    id v18 = objc_alloc(MEMORY[0x1E4F292A8]);
    id v19 = [v21 objectForKeyedSubscript:@"ArchivedInflection"];
    long long v20 = (void *)[v18 initWithExternalRepresentation:v19 error:0];

    if (v20) {
      [v20 _setAsGlobalUserInflection];
    }
  }
}

- (id)selectableScriptCodes
{
  if (selectableScriptCodes_onceToken != -1) {
    dispatch_once(&selectableScriptCodes_onceToken, &__block_literal_global_120);
  }
  CFStringRef v2 = (void *)MEMORY[0x1E4F1CA20];
  unint64_t v3 = [a1 localeIdentifier];
  id v4 = [v2 componentsFromLocaleIdentifier:v3];
  id v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  id v6 = (void *)MEMORY[0x1E4F1CA20];
  id v7 = [a1 localeIdentifier];
  uint64_t v8 = [v6 addLikelySubtagsForLocaleIdentifier:v7];

  id v9 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v8];
  uint64_t v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4F1C470]];

  uint64_t v11 = [(id)selectableScriptCodes_selectableScriptCodes objectForKeyedSubscript:v5];
  if ([v11 containsObject:v10]) {
    id v12 = v11;
  }
  else {
    id v12 = 0;
  }

  return v12;
}

- (id)optionNameForSelectableScripts
{
  id v1 = (void *)MEMORY[0x1E4F1CA20];
  CFStringRef v2 = [a1 localeIdentifier];
  unint64_t v3 = [v1 componentsFromLocaleIdentifier:v2];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  LODWORD(v3) = [v4 isEqualToString:@"my"];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v3) {
    id v7 = @"ENCODING";
  }
  else {
    id v7 = @"SCRIPT";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1F19D5770 table:@"LocalizedSelectableScripts"];

  return v8;
}

- (id)optionNameWithColonForSelectableScripts
{
  id v1 = (void *)MEMORY[0x1E4F1CA20];
  CFStringRef v2 = [a1 localeIdentifier];
  unint64_t v3 = [v1 componentsFromLocaleIdentifier:v2];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  LODWORD(v3) = [v4 isEqualToString:@"my"];
  id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v6 = v5;
  if (v3) {
    id v7 = @"ENCODING_COLON";
  }
  else {
    id v7 = @"SCRIPT_COLON";
  }
  uint64_t v8 = [v5 localizedStringForKey:v7 value:&stru_1F19D5770 table:@"LocalizedSelectableScripts"];

  return v8;
}

- (id)explanationTextForSelectableScripts
{
  id v1 = (void *)MEMORY[0x1E4F1CA20];
  CFStringRef v2 = [a1 localeIdentifier];
  unint64_t v3 = [v1 componentsFromLocaleIdentifier:v2];
  id v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  if ([v4 isEqualToString:@"my"])
  {
    id v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"ZAWGYI_EXPLANATION_TEXT" value:&stru_1F19D5770 table:@"LocalizedSelectableScripts"];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

+ (id)displayNameForSelectableScriptCode:()IntlPreferencesAdditions
{
  unint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = [v3 bundleForClass:objc_opt_class()];
  id v6 = [v5 localizedStringForKey:v4 value:&stru_1F19D5770 table:@"LocalizedSelectableScripts"];

  return v6;
}

+ (void)setLocaleOnly:()IntlPreferencesAdditions .cold.1(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  CFStringRef v2 = [MEMORY[0x1E4F1CA20] preferredLocale];
  unint64_t v3 = [v2 localeIdentifier];
  int v4 = 138543618;
  uint64_t v5 = a1;
  __int16 v6 = 2114;
  id v7 = v3;
  _os_log_fault_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT, "Invalid locale %{public}@. Current locale is %{public}@.", (uint8_t *)&v4, 0x16u);
}

@end