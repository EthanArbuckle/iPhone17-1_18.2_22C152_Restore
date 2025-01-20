@interface IntlUtility
+ (BOOL)canCapitalizeAutonymForLanguage:(id)a3;
+ (BOOL)forceCapitalizationInLanguageLists;
+ (BOOL)isLunarCalendarDefaultOn;
+ (BOOL)isLunarCalendarDefaultOnForLanguage:(id)a3 locale:(id)a4;
+ (BOOL)isYearlessDate:(id)a3 forCalendar:(id)a4;
+ (BOOL)upgradeAppleLanguagesFrom:(id)a3 to:(id)a4;
+ (id)_getXPCConnectionForLocalizationSwitcher;
+ (id)_preferredLanguagesForBundleID:(id)a3;
+ (id)_preferredLanguagesForBundleID:(id)a3 withBundleRecord:(id)a4;
+ (id)_proposedOverrideLanguageFromLanguage:(id)a3 forLocalizations:(id)a4 preferredLanguages:(id)a5 regionCode:(id)a6;
+ (id)_supportedCalendarsOnEmbeddedSystems;
+ (id)alternateContinentOfRegion:(id)a3;
+ (id)baseLanguageIdentifierFromIdentifier:(id)a3;
+ (id)baseSystemLanguages;
+ (id)capitalizeFirstWordOfName:(id)a3 accordingToLanguage:(id)a4;
+ (id)defaultCalendarForLocaleID:(id)a3;
+ (id)displayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4;
+ (id)displayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4 short:(BOOL)a5;
+ (id)filterLanguageList:(id)a3 forRegion:(id)a4 fromLanguages:(id)a5;
+ (id)languageIdentifierFromIdentifier:(id)a3 withRegion:(id)a4;
+ (id)localeForCalendarID:(id)a3;
+ (id)localeForCalendarID:(id)a3 andLocale:(id)a4;
+ (id)lunarCalendarsForLocaleID:(id)a3;
+ (id)normalizedLanguageIDFromString:(id)a3;
+ (id)numberingSystemForLocaleID:(id)a3;
+ (id)numberingSystemsForLocaleID:(id)a3;
+ (id)numberingSystemsFromArray:(id)a3 forLocaleID:(id)a4;
+ (id)parentLocaleIdentifierForIdentifier:(id)a3;
+ (id)perAppLanguageSelectionBundleIdentifiers;
+ (id)preferredLanguageForBundleID:(id)a3;
+ (id)preferredLanguagesForBundleIDs:(id)a3;
+ (id)preferredLanguagesForRegion:(id)a3;
+ (id)preferredLanguagesForRegionWithoutFiltering:(id)a3;
+ (id)preferredLanguagesFromLanguages:(id)a3 byAddingFallbacksForRegion:(id)a4;
+ (id)preferredLunarCalendarForLocaleID:(id)a3;
+ (id)restrictedCountryCodes;
+ (id)sharedIntlUtility;
+ (id)shortDisplayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4;
+ (id)stdLanguageIDs;
+ (int)UDisplayContextForIUDisplayNameContext:(unint64_t)a3;
+ (int64_t)formattingContextFromIUDisplayNameContext:(unint64_t)a3;
+ (int64_t)yearlessYearForMonth:(int64_t)a3 withCalendar:(id)a4;
+ (void)_setPreferredLanguage:(id)a3 forBundleID:(id)a4;
+ (void)enumeratePreferredCalendarsForLocaleID:(id)a3 usingBlock:(id)a4;
+ (void)preferredLanguagesForBundleID:(id)a3 reply:(id)a4;
+ (void)preferredLanguagesForBundleIDs:(id)a3 reply:(id)a4;
+ (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4;
+ (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4 andRelaunchWithCompletion:(id)a5;
+ (void)setYearlessYear:(id)a3 forCalendar:(id)a4;
+ (void)subscribeToAppLanguageChanges:(id)a3;
+ (void)unsubscribeFromAppLanguageChanges;
- (BOOL)canRenderLanguage:(id)a3;
- (id)ICUdisplayNameForLanguage:(id)a3 capitalization:(ULocaleDisplayNames *)a4;
- (id)displayNameForDialect:(id)a3 context:(unint64_t)a4 displayLanguage:(id)a5;
- (id)displayNameForLanguage:(id)a3 context:(unint64_t)a4 displayLanguage:(id)a5;
- (id)displayNameForLocale:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5 short:(BOOL)a6;
- (id)displayNameForRegion:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5;
- (id)displayNameForRegion:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5 short:(BOOL)a6;
- (id)languageList;
- (id)localizedLanguageForLanguage:(id)a3;
- (id)localizedNameForScript:(signed __int16)a3;
@end

@implementation IntlUtility

+ (id)sharedIntlUtility
{
  if (sharedIntlUtility_onceToken != -1) {
    dispatch_once(&sharedIntlUtility_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)sharedIntlUtility_sIntlUtility;
  return v2;
}

- (id)languageList
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __27__IntlUtility_languageList__block_invoke;
  block[3] = &unk_1E63BFC78;
  block[4] = self;
  if (languageList___onceToken != -1) {
    dispatch_once(&languageList___onceToken, block);
  }
  return (id)languageList___languageToNativeNameMap;
}

- (id)localizedNameForScript:(signed __int16)a3
{
  v3 = objc_msgSend(NSString, "stringWithFormat:", @"Script-%d", a3);
  v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v5 = [v4 localizedStringForKey:v3 value:&stru_1F19D5770 table:0];

  return v5;
}

- (id)localizedLanguageForLanguage:(id)a3
{
  return [(IntlUtility *)self displayNameForLanguage:a3 context:3 displayLanguage:0];
}

- (BOOL)canRenderLanguage:(id)a3
{
  id v3 = a3;
  CTFontRef UIFontForLanguage = CTFontCreateUIFontForLanguage(kCTFontUIFontSystem, 12.0, 0);
  if (UIFontForLanguage)
  {
    v5 = UIFontForLanguage;
    v6 = [(id)objc_opt_class() normalizedLanguageIDFromString:v3];
    CFStringRef v7 = [MEMORY[0x1E4F1CA20] exemplarForLanguage:v6];
    v8 = (__CFString *)v7;
    if (v7
      && (v15.length = CFStringGetLength(v7), v15.location = 0, (v9 = CTFontCreateForString(v5, v8, v15)) != 0))
    {
      v10 = v9;
      CFStringRef v11 = CTFontCopyName(v9, (CFStringRef)*MEMORY[0x1E4F245D8]);
      if (v11)
      {
        CFStringRef v12 = v11;
        BOOL v13 = CFEqual(v11, @"LastResort") == 0;
        CFRelease(v12);
      }
      else
      {
        BOOL v13 = 1;
      }
      CFRelease(v10);
    }
    else
    {
      BOOL v13 = 0;
    }
    CFRelease(v5);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

uint64_t __32__IntlUtility_sharedIntlUtility__block_invoke()
{
  sharedIntlUtility_sIntlUtility = objc_opt_new();
  return MEMORY[0x1F41817F8]();
}

+ (id)stdLanguageIDs
{
  if (stdLanguageIDs_onceToken != -1) {
    dispatch_once(&stdLanguageIDs_onceToken, &__block_literal_global_3);
  }
  v2 = (void *)stdLanguageIDs_sStdLanguageIDs;
  return v2;
}

void __29__IntlUtility_stdLanguageIDs__block_invoke()
{
  id v2 = [MEMORY[0x1E4F1CA20] supportedLanguages];
  uint64_t v0 = [v2 allObjects];
  v1 = (void *)stdLanguageIDs_sStdLanguageIDs;
  stdLanguageIDs_sStdLanguageIDs = v0;
}

+ (id)baseSystemLanguages
{
  return (id)[MEMORY[0x1E4F1CA20] baseSystemLanguages];
}

+ (id)languageIdentifierFromIdentifier:(id)a3 withRegion:(id)a4
{
  return (id)[MEMORY[0x1E4F1CA20] languageFromLanguage:a3 byReplacingRegion:a4];
}

+ (id)baseLanguageIdentifierFromIdentifier:(id)a3
{
  return (id)[MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:a3];
}

+ (id)normalizedLanguageIDFromString:(id)a3
{
  id v4 = a3;
  if (v4
    && ([(id)objc_opt_class() stdLanguageIDs],
        v5 = objc_claimAutoreleasedReturnValue(),
        int v6 = [v5 containsObject:v4],
        v5,
        !v6)
    && ([MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v4],
        (uint64_t v7 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v8 = (void *)v7;
    uint64_t block = MEMORY[0x1E4F143A8];
    uint64_t v22 = 3221225472;
    v23 = __46__IntlUtility_normalizedLanguageIDFromString___block_invoke;
    v24 = &__block_descriptor_40_e5_v8__0l;
    id v25 = a1;
    if (normalizedLanguageIDFromString____onceTokenForSpecialIDReplacements != -1) {
      dispatch_once(&normalizedLanguageIDFromString____onceTokenForSpecialIDReplacements, &block);
    }
    if (normalizedLanguageIDFromString__sSpecialIDReplacements
      && ([(id)normalizedLanguageIDFromString__sSpecialIDReplacements objectForKey:v8],
          (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v10 = (id)v9;
    }
    else
    {
      uint64_t v16 = MEMORY[0x1E4F143A8];
      uint64_t v17 = 3221225472;
      v18 = __46__IntlUtility_normalizedLanguageIDFromString___block_invoke_2;
      v19 = &__block_descriptor_40_e5_v8__0l;
      id v20 = a1;
      if (normalizedLanguageIDFromString____onceTokenForCanonicalLanguageIDs != -1) {
        dispatch_once(&normalizedLanguageIDFromString____onceTokenForCanonicalLanguageIDs, &v16);
      }
      uint64_t v12 = objc_msgSend((id)normalizedLanguageIDFromString__sCanonicalLanguageIDs, "indexOfObject:", v8, v16, v17, v18, v19, v20, block, v22, v23, v24, v25);
      if (v12 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v13 = v12;
        v14 = [(id)objc_opt_class() stdLanguageIDs];
        uint64_t v15 = [v14 objectAtIndex:v13];

        v8 = (void *)v15;
      }
      id v10 = v8;
      v8 = v10;
    }
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

void __46__IntlUtility_normalizedLanguageIDFromString___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v1 = [v4 URLForResource:@"LanguageCodeExceptions" withExtension:@"plist"];
  uint64_t v2 = [v0 dictionaryWithContentsOfURL:v1];
  id v3 = (void *)normalizedLanguageIDFromString__sSpecialIDReplacements;
  normalizedLanguageIDFromString__sSpecialIDReplacements = v2;
}

void __46__IntlUtility_normalizedLanguageIDFromString___block_invoke_2()
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = (void *)MEMORY[0x1E4F1CA48];
  v1 = [(id)objc_opt_class() stdLanguageIDs];
  uint64_t v2 = objc_msgSend(v0, "arrayWithCapacity:", objc_msgSend(v1, "count"));

  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v3 = objc_msgSend((id)objc_opt_class(), "stdLanguageIDs", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        v8 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:*(void *)(*((void *)&v11 + 1) + 8 * v7)];
        [v2 addObject:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithArray:v2];
  id v10 = (void *)normalizedLanguageIDFromString__sCanonicalLanguageIDs;
  normalizedLanguageIDFromString__sCanonicalLanguageIDs = v9;
}

+ (id)capitalizeFirstWordOfName:(id)a3 accordingToLanguage:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:a4];
  unsigned int v7 = [v5 length];
  if (v7 >= 0x80) {
    uint64_t v8 = 128;
  }
  else {
    uint64_t v8 = v7;
  }
  objc_msgSend(v5, "getCharacters:range:", v17, 0, v8);
  id v9 = v6;
  [v9 UTF8String];
  ubrk_open();
  ubrk_first();
  int v10 = ubrk_next();
  ubrk_close();
  long long v11 = [v5 substringToIndex:v10];
  long long v12 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v9];
  long long v13 = [v11 capitalizedStringWithLocale:v12];

  long long v14 = [v5 substringFromIndex:v10];
  uint64_t v15 = [v13 stringByAppendingString:v14];

  return v15;
}

+ (id)alternateContinentOfRegion:(id)a3
{
  uint64_t v3 = alternateContinentOfRegion__onceToken;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&alternateContinentOfRegion__onceToken, &__block_literal_global_16);
  }
  id v5 = [(id)alternateContinentOfRegion__sAltContinentsForRegion objectForKeyedSubscript:v4];

  return v5;
}

uint64_t __42__IntlUtility_alternateContinentOfRegion___block_invoke()
{
  alternateContinentOfRegion__sAltContinentsForRegion = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", @"AM", @"150", @"CY", @"142", @"EG", @"150", @"GE", @"150", @"GL", @"150", @"TR", @"142", @"RU", 0);
  return MEMORY[0x1F41817F8]();
}

+ (void)enumeratePreferredCalendarsForLocaleID:(id)a3 usingBlock:(id)a4
{
  id v5 = a4;
  uint64_t v6 = (void (**)(void, void, void))v5;
  if (a3 && v5)
  {
    int v10 = 0;
    [a3 UTF8String];
    ucal_getKeywordValuesForLocale();
    char v9 = 0;
    do
    {
      uint64_t v7 = uenum_next();
      if (!v7) {
        break;
      }
      if (v10 > 0) {
        break;
      }
      uint64_t v8 = [NSString stringWithUTF8String:v7];
      ((void (**)(void, void *, char *))v6)[2](v6, v8, &v9);
    }
    while (!v9);
    uenum_close();
  }
}

+ (id)defaultCalendarForLocaleID:(id)a3
{
  [a3 UTF8String];
  uloc_getBaseName();
  ucal_open();
  id v4 = [NSString stringWithUTF8String:ucal_getType()];
  ucal_close();
  if (!v4) {
    id v4 = (id)*MEMORY[0x1E4F1C318];
  }
  return v4;
}

+ (id)lunarCalendarsForLocaleID:(id)a3
{
  id v4 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (lunarCalendarsForLocaleID__onceToken != -1) {
    dispatch_once(&lunarCalendarsForLocaleID__onceToken, block);
  }
  if ([(id)lunarCalendarsForLocaleID__sLunarCalendarList containsObject:@"islamic"])
  {
    uint64_t v10 = 0;
    long long v11 = &v10;
    uint64_t v12 = 0x3032000000;
    long long v13 = __Block_byref_object_copy_;
    long long v14 = __Block_byref_object_dispose_;
    uint64_t v15 = @"islamic-civil";
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke_61;
    v9[3] = &unk_1E63BFEE0;
    v9[4] = &v10;
    +[IntlUtility enumeratePreferredCalendarsForLocaleID:v4 usingBlock:v9];
    id v5 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend((id)lunarCalendarsForLocaleID__sLunarCalendarList, "count"));
    [v5 setArray:lunarCalendarsForLocaleID__sLunarCalendarList];
    uint64_t v6 = [v5 indexOfObject:@"islamic"];
    [v5 replaceObjectAtIndex:v6 withObject:v11[5]];
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithArray:v5];

    _Block_object_dispose(&v10, 8);
  }
  else
  {
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithArray:lunarCalendarsForLocaleID__sLunarCalendarList];
  }

  return v7;
}

void __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke()
{
  uint64_t v0 = (void *)MEMORY[0x1E4F1C978];
  v1 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  uint64_t v2 = [v1 URLForResource:@"LunarCalendars" withExtension:@"plist"];
  uint64_t v3 = [v0 arrayWithContentsOfURL:v2];
  id v4 = (void *)lunarCalendarsForLocaleID__sLunarCalendarList;
  lunarCalendarsForLocaleID__sLunarCalendarList = v3;

  if (!lunarCalendarsForLocaleID__sLunarCalendarList)
  {
    lunarCalendarsForLocaleID__sLunarCalendarList = (uint64_t)&unk_1F19D8948;
  }
}

void __41__IntlUtility_lunarCalendarsForLocaleID___block_invoke_61(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if ([v6 hasPrefix:@"islamic-"])
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)preferredLunarCalendarForLocaleID:(id)a3
{
  id v3 = a3;
  uint64_t v21 = 0;
  uint64_t v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy_;
  id v25 = __Block_byref_object_dispose_;
  id v26 = 0;
  id v4 = +[IntlUtility lunarCalendarsForLocaleID:v3];
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  uint64_t v17 = __49__IntlUtility_preferredLunarCalendarForLocaleID___block_invoke;
  uint64_t v18 = &unk_1E63BFF08;
  id v5 = v4;
  id v19 = v5;
  id v20 = &v21;
  +[IntlUtility enumeratePreferredCalendarsForLocaleID:v3 usingBlock:&v15];
  id v6 = (void *)v22[5];
  if (!v6)
  {
    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1CA20], "componentsFromLocaleIdentifier:", v3, v15, v16, v17, v18);
    uint64_t v8 = [v7 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
    if (_isChineseLanguageCode(v8))
    {
      char v9 = (id *)MEMORY[0x1E4F1C2F0];
    }
    else if ([v8 isEqualToString:@"ar"])
    {
      char v9 = (id *)MEMORY[0x1E4F1C340];
    }
    else
    {
      if (![v8 isEqualToString:@"he"])
      {
LABEL_9:

        id v6 = (void *)v22[5];
        goto LABEL_10;
      }
      char v9 = (id *)MEMORY[0x1E4F1C320];
    }
    uint64_t v10 = v22;
    id v11 = *v9;
    uint64_t v12 = (void *)v10[5];
    v10[5] = (uint64_t)v11;

    goto LABEL_9;
  }
LABEL_10:
  id v13 = v6;

  _Block_object_dispose(&v21, 8);
  return v13;
}

void __49__IntlUtility_preferredLunarCalendarForLocaleID___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v6 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:"))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }
}

+ (id)localeForCalendarID:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = a3;
  id v5 = [v3 currentLocale];
  id v6 = +[IntlUtility localeForCalendarID:v4 andLocale:v5];

  return v6;
}

+ (id)localeForCalendarID:(id)a3 andLocale:(id)a4
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v7 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v8 = [a4 localeIdentifier];
  char v9 = [v7 componentsFromLocaleIdentifier:v8];
  uint64_t v10 = [v6 dictionaryWithDictionary:v9];

  if ([v5 isEqualToString:*MEMORY[0x1E4F1C2F0]])
  {
    uint64_t v11 = *MEMORY[0x1E4F1C438];
    uint64_t v12 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
    char v13 = [&unk_1F19D8960 containsObject:v12];

    if ((v13 & 1) == 0)
    {
      long long v14 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:&unk_1F19D8960 forPreferences:0];
      uint64_t v15 = [v14 firstObject];

      uint64_t v16 = *MEMORY[0x1E4F1C470];
      v29[0] = v11;
      v29[1] = v16;
      uint64_t v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
      [v10 removeObjectsForKeys:v17];

      uint64_t v18 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v15];
      [v10 addEntriesFromDictionary:v18];
    }
    id v19 = [v10 objectForKeyedSubscript:v11];
    int v20 = [v19 isEqualToString:@"zh"];

    if (v20)
    {
      uint64_t v21 = @"hanidays";
LABEL_9:
      [v10 setObject:v21 forKeyedSubscript:@"numbers"];
    }
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F1C320]])
  {
    uint64_t v22 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
    int v23 = [v22 isEqualToString:@"he"];

    if (v23)
    {
      uint64_t v21 = @"hebr";
      goto LABEL_9;
    }
  }
  [v10 setObject:v5 forKeyedSubscript:@"calendar"];
  v24 = (void *)MEMORY[0x1E4F1CA20];
  id v25 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v10];
  id v26 = [v24 canonicalLocaleIdentifierFromString:v25];

  v27 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v26];

  return v27;
}

+ (BOOL)isLunarCalendarDefaultOn
{
  id v3 = (void *)MEMORY[0x1E4F1CA20];
  id v4 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  id v5 = [v4 firstObject];
  id v6 = [v3 canonicalLanguageIdentifierFromString:v5];

  uint64_t v7 = [MEMORY[0x1E4F1CA20] currentLocale];
  LOBYTE(a1) = [a1 isLunarCalendarDefaultOnForLanguage:v6 locale:v7];

  return (char)a1;
}

+ (BOOL)isLunarCalendarDefaultOnForLanguage:(id)a3 locale:(id)a4
{
  id v6 = a4;
  uint64_t v7 = *MEMORY[0x1E4F1C400];
  id v8 = a3;
  char v9 = [v6 objectForKey:v7];
  uint64_t v10 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v8];

  uint64_t v11 = [v10 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];

  int isChineseLanguageCode = _isChineseLanguageCode(v11);
  if (([v11 isEqualToString:@"he"] & 1) != 0
    || [v9 isEqualToString:@"IL"]
    && ![v11 isEqualToString:@"ar"])
  {
    if ([v11 isEqualToString:@"ar"]) {
      [&unk_1F19D8978 containsObject:v9];
    }
  }
  else if ([v11 isEqualToString:@"ar"])
  {
    if ((([&unk_1F19D8978 containsObject:v9] | isChineseLanguageCode) & 1) == 0)
    {
LABEL_8:
      LOBYTE(v13) = 0;
      goto LABEL_16;
    }
  }
  else if (!isChineseLanguageCode)
  {
    goto LABEL_8;
  }
  long long v14 = [v6 localeIdentifier];
  uint64_t v15 = [a1 preferredLunarCalendarForLocaleID:v14];

  uint64_t v16 = [v6 localeIdentifier];
  uint64_t v17 = [a1 defaultCalendarForLocaleID:v16];

  uint64_t v18 = [a1 supportedCalendars];
  LOBYTE(v16) = [v18 containsObject:v17];

  if ((v16 & 1) == 0)
  {
    id v19 = (id)*MEMORY[0x1E4F1C318];

    uint64_t v17 = v19;
  }
  if (v15) {
    int v13 = [v17 isEqualToString:v15] ^ 1;
  }
  else {
    LOBYTE(v13) = 1;
  }

LABEL_16:
  return v13;
}

+ (int64_t)yearlessYearForMonth:(int64_t)a3 withCalendar:(id)a4
{
  id v5 = [a4 calendarIdentifier];
  if ([v5 isEqualToString:*MEMORY[0x1E4F1C320]])
  {
    int64_t v6 = 6;
  }
  else if ([v5 hasPrefix:@"islamic"])
  {
    int64_t v6 = 7;
  }
  else if ([v5 isEqualToString:*MEMORY[0x1E4F1C2F0]])
  {
    int64_t v6 = chineseLeapMonthExtendedYears[a3];
  }
  else
  {
    int64_t v6 = 1604;
  }

  return v6;
}

+ (BOOL)isYearlessDate:(id)a3 forCalendar:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 year] == 0x7FFFFFFFFFFFFFFFLL)
  {
    BOOL v7 = 1;
  }
  else
  {
    if (!v6)
    {
      id v6 = [v5 calendar];
    }
    int64_t v8 = +[IntlUtility yearlessYearForMonth:withCalendar:](IntlUtility, "yearlessYearForMonth:withCalendar:", [v5 month], v6);
    char v9 = [v6 calendarIdentifier];
    int v10 = [v9 isEqualToString:*MEMORY[0x1E4F1C2F0]];

    if (v10)
    {
      uint64_t v11 = [v5 era];
      uint64_t v12 = [v5 year] + 60 * v11 - 61;
    }
    else
    {
      uint64_t v12 = [v5 year];
    }
    BOOL v7 = v8 == v12;
  }

  return v7;
}

+ (void)setYearlessYear:(id)a3 forCalendar:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (!v5)
  {
    id v5 = [v9 calendar];
  }
  uint64_t v6 = +[IntlUtility yearlessYearForMonth:withCalendar:](IntlUtility, "yearlessYearForMonth:withCalendar:", [v9 month], v5);
  BOOL v7 = [v5 calendarIdentifier];
  int v8 = [v7 isEqualToString:*MEMORY[0x1E4F1C2F0]];

  if (v8)
  {
    [v9 setEra:v6 / 60 + 1];
    uint64_t v6 = v6 % 60 + 1;
  }
  [v9 setYear:v6];
}

+ (id)numberingSystemForLocaleID:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:a3];
  id v4 = (void *)[v3 mutableCopy];

  id v5 = [v4 objectForKeyedSubscript:@"numbers"];
  if ([v5 length])
  {
    id v6 = v5;
  }
  else
  {
    [v4 setObject:@"default" forKeyedSubscript:@"numbers"];
    id v7 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v4];
    [v7 UTF8String];
    uint64_t v8 = unumsys_open();
    id v6 = 0;
    if (v8)
    {
      id v6 = [NSString stringWithUTF8String:MEMORY[0x1C189AC20](v8)];
      unumsys_close();
    }
  }
  return v6;
}

+ (id)numberingSystemsFromArray:(id)a3 forLocaleID:(id)a4
{
  id v6 = a3;
  id v7 = [a1 numberingSystemsForLocaleID:a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__IntlUtility_numberingSystemsFromArray_forLocaleID___block_invoke;
  v12[3] = &unk_1E63BFF30;
  id v13 = v6;
  id v8 = v6;
  id v9 = [v7 indexesOfObjectsPassingTest:v12];
  int v10 = [v7 objectsAtIndexes:v9];

  return v10;
}

uint64_t __53__IntlUtility_numberingSystemsFromArray_forLocaleID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) containsObject:a2];
}

+ (id)numberingSystemsForLocaleID:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  int v20 = v3;
  id v5 = [MEMORY[0x1E4F1CA20] componentsFromLocaleIdentifier:v3];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v6 objectForKeyedSubscript:@"numbers"];
  if ([v7 length] && (objc_msgSend(v4, "containsObject:", v7) & 1) == 0) {
    [v4 addObject:v7];
  }
  id v19 = v7;
  uint64_t v18 = [v6 objectForKeyedSubscript:*MEMORY[0x1E4F1C438]];
  long long v21 = 0u;
  long long v22 = 0u;
  if (objc_msgSend(&unk_1F19D8990, "containsObject:")) {
    id v8 = &unk_1F19D89A8;
  }
  else {
    id v8 = &unk_1F19D89C0;
  }
  long long v23 = 0uLL;
  long long v24 = 0uLL;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        [v6 setObject:*(void *)(*((void *)&v21 + 1) + 8 * i) forKeyedSubscript:@"numbers"];
        id v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v6];
        [v13 UTF8String];
        uint64_t v14 = unumsys_open();

        if (v14)
        {
          if (!MEMORY[0x1C189AC40](v14) && MEMORY[0x1C189AC30](v14) == 10)
          {
            uint64_t v15 = MEMORY[0x1C189AC20](v14);
            if (v15)
            {
              uint64_t v16 = [NSString stringWithUTF8String:v15];
              if (([v4 containsObject:v16] & 1) == 0) {
                [v4 addObject:v16];
              }
            }
          }
          unumsys_close();
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }
  if (([v4 containsObject:@"latn"] & 1) == 0) {
    [v4 addObject:@"latn"];
  }

  return v4;
}

+ (id)displayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4 short:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = (void *)MEMORY[0x1E4F1CA20];
  id v8 = a3;
  uint64_t v9 = [v7 componentsFromLocaleIdentifier:a4];
  uint64_t v10 = (void *)[v9 mutableCopy];

  [v10 setObject:v8 forKeyedSubscript:@"numbers"];
  uint64_t v11 = objc_opt_new();
  uint64_t v12 = (void *)MEMORY[0x1E4F1CA20];
  id v13 = [MEMORY[0x1E4F1CA20] localeIdentifierFromComponents:v10];
  uint64_t v14 = [v12 localeWithLocaleIdentifier:v13];
  [v11 setLocale:v14];

  if (v5) {
    uint64_t v15 = &unk_1F19D88B8;
  }
  else {
    uint64_t v15 = &unk_1F19D88D0;
  }
  uint64_t v16 = [v11 stringFromNumber:v15];

  return v16;
}

+ (id)displayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4
{
  return (id)[a1 displayNameForNumberingSystemWithIdentifier:a3 localeIdentifier:a4 short:0];
}

+ (id)shortDisplayNameForNumberingSystemWithIdentifier:(id)a3 localeIdentifier:(id)a4
{
  return (id)[a1 displayNameForNumberingSystemWithIdentifier:a3 localeIdentifier:a4 short:1];
}

void __27__IntlUtility_languageList__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v0 = [MEMORY[0x1E4F1CA20] supportedLanguages];
  v1 = [v0 allObjects];

  uint64_t v2 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v1, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = v1;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(MEMORY[0x1E4F1CA20], "localeWithLocaleIdentifier:", v8, (void)v13);
        uint64_t v10 = [v9 localizedStringForLanguage:v8 context:3];

        if ([v10 length])
        {
          uint64_t v11 = [(id)objc_opt_class() capitalizeFirstWordOfName:v10 accordingToLanguage:v8];
          [v2 setObject:v11 forKeyedSubscript:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v12 = (void *)languageList___languageToNativeNameMap;
  languageList___languageToNativeNameMap = (uint64_t)v2;
}

+ (BOOL)forceCapitalizationInLanguageLists
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __49__IntlUtility_forceCapitalizationInLanguageLists__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (forceCapitalizationInLanguageLists___onceToken != -1) {
    dispatch_once(&forceCapitalizationInLanguageLists___onceToken, block);
  }
  return forceCapitalizationInLanguageLists___capitalize;
}

void __49__IntlUtility_forceCapitalizationInLanguageLists__block_invoke()
{
  uint64_t v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  id v11 = [v0 localizedStringForKey:@"ForceCapitalizationInLanguageLists" value:@"0" table:0];

  if ([v11 length])
  {
    char v1 = [v11 isEqualToString:@"0"];
    forceCapitalizationInLanguageLists___capitalize = v1 ^ 1;
    if ((v1 & 1) == 0) {
      goto LABEL_10;
    }
  }
  else
  {
    forceCapitalizationInLanguageLists___capitalize = 0;
  }
  uint64_t v2 = (void *)MEMORY[0x1E4F1CA20];
  id v3 = [MEMORY[0x1E4F28B50] mainBundle];
  uint64_t v4 = [v3 preferredLocalizations];
  uint64_t v5 = [v4 firstObject];
  uint64_t v6 = [v2 canonicalLanguageIdentifierFromString:v5];

  if ([v6 length])
  {
    id v7 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v6];
    uint64_t v8 = [v7 localizedStringForLanguage:v6 context:3];

    if ([v8 length])
    {
      uint64_t v9 = [MEMORY[0x1E4F28B88] uppercaseLetterCharacterSet];
      uint64_t v10 = [v8 rangeOfCharacterFromSet:v9];

      forceCapitalizationInLanguageLists___capitalize = v10 == 0;
    }
  }
LABEL_10:
}

+ (BOOL)canCapitalizeAutonymForLanguage:(id)a3
{
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:a3];
  uint64_t v4 = [v3 languageCode];
  char v5 = [v4 isEqualToString:@"lut"];

  return v5 ^ 1;
}

- (id)displayNameForDialect:(id)a3 context:(unint64_t)a4 displayLanguage:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  uint64_t v10 = [(id)objc_opt_class() normalizedLanguageIDFromString:v9];
  +[IntlUtility UDisplayContextForIUDisplayNameContext:a4];
  id v11 = v8;
  [v11 UTF8String];

  uint64_t v12 = [(IntlUtility *)self ICUdisplayNameForLanguage:v10 capitalization:uldn_openForContext()];
  uldn_close();
  if ([v12 isEqualToString:v10]) {
    long long v13 = v9;
  }
  else {
    long long v13 = v12;
  }
  id v14 = v13;

  return v14;
}

- (id)ICUdisplayNameForLanguage:(id)a3 capitalization:(ULocaleDisplayNames *)a4
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    [a3 UTF8String];
    int v4 = uldn_localeDisplayName();
    if (v4 >= 128) {
      int v6 = 128;
    }
    else {
      int v6 = v4;
    }
    char v5 = [NSString stringWithCharacters:v8 length:v6];
  }
  else
  {
    char v5 = 0;
  }
  return v5;
}

- (id)displayNameForLocale:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5 short:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (!v10)
  {
    id v11 = (void *)MEMORY[0x1E4F1CA20];
    uint64_t v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
    long long v13 = [v12 preferredLocalizations];
    id v14 = [v13 firstObject];
    id v10 = [v11 canonicalLanguageIdentifierFromString:v14];
  }
  int v29 = 0;
  int v15 = +[IntlUtility UDisplayContextForIUDisplayNameContext:a5];
  if (v6) {
    int v16 = 513;
  }
  else {
    int v16 = 512;
  }
  int v30 = v15;
  int v31 = v16;
  int v28 = 0;
  id v17 = v10;
  [v17 UTF8String];
  uldn_openForContext();
  id v18 = v9;
  [v18 UTF8String];
  int v19 = uldn_localeDisplayName();
  if (v19 >= 150)
  {
    int v19 = 0;
    int v28 = 15;
  }
  int v20 = (char *)&v27 - ((2 * (v19 + 1) + 15) & 0x3FFFFFFF0);
  id v21 = v18;
  [v21 UTF8String];
  int v22 = uldn_localeDisplayName();
  uldn_close();
  if (v28 <= 0)
  {
    long long v23 = [NSString stringWithCharacters:v20 length:v22];
  }
  else
  {
    long long v23 = 0;
  }
  if (v23) {
    long long v24 = v23;
  }
  else {
    long long v24 = v21;
  }
  id v25 = v24;

  return v25;
}

+ (int)UDisplayContextForIUDisplayNameContext:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 256;
  }
  else {
    return a3 + 256;
  }
}

+ (id)preferredLanguagesForRegionWithoutFiltering:(id)a3
{
  return (id)[MEMORY[0x1E4F1CA20] languagesForRegion:a3 subdivision:0 withThreshold:1 filter:0];
}

+ (id)preferredLanguagesForRegion:(id)a3
{
  return (id)[MEMORY[0x1E4F1CA20] languagesForRegion:a3 subdivision:0 withThreshold:1 filter:1];
}

+ (id)filterLanguageList:(id)a3 forRegion:(id)a4 fromLanguages:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v20 = a4;
  id v8 = a5;
  id v19 = [MEMORY[0x1E4F1CA48] array];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(obj);
        }
        long long v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v14 = [NSString stringWithFormat:@"%@-%@", v13, v20];
        int v15 = +[IntlUtility normalizedLanguageIDFromString:v14];

        do
        {
          if ([v8 containsObject:v15])
          {
            long long v13 = v15;
            int v16 = v15;
            goto LABEL_12;
          }
          int v16 = +[IntlUtility parentLocaleIdentifierForIdentifier:v15];

          int v15 = v16;
        }
        while (![v16 isEqualToString:@"root"]);
        if (![v8 containsObject:v13]) {
          goto LABEL_13;
        }
LABEL_12:
        [v19 addObject:v13];
LABEL_13:
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  return v19;
}

+ (id)preferredLanguagesFromLanguages:(id)a3 byAddingFallbacksForRegion:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = (void *)[v5 mutableCopy];
  id v8 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v9 = +[IntlUtility preferredLanguagesForRegionWithoutFiltering:v6];
  uint64_t v10 = [v9 firstObject];
  uint64_t v11 = [v8 baseLanguageFromLanguage:v10];

  if ([&unk_1F19D89D8 containsObject:v11])
  {
    id v20 = v7;
    id v21 = v6;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v12 = v5;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v23 != v15) {
            objc_enumerationMutation(v12);
          }
          id v17 = objc_msgSend(MEMORY[0x1E4F1CA20], "baseLanguageFromLanguage:", *(void *)(*((void *)&v22 + 1) + 8 * i), v20);
          char v18 = [&unk_1F19D89D8 containsObject:v17];

          if (v18)
          {
            id v7 = v20;
            id v6 = v21;
            goto LABEL_14;
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v26 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }

    id v6 = v21;
    id v12 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v11 byReplacingRegion:v21];
    if ([v12 length])
    {
      id v7 = v20;
      if ([v20 count]) {
        [v20 addObject:v12];
      }
    }
    else
    {
      id v7 = v20;
    }
LABEL_14:
  }
  return v7;
}

+ (id)parentLocaleIdentifierForIdentifier:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 UTF8String];
  ualoc_getAppleParent();
  int v4 = [NSString stringWithUTF8String:v7];
  id v5 = [v4 stringByReplacingOccurrencesOfString:@"_" withString:@"-"];

  if ([(__CFString *)v5 isEqualToString:v3])
  {

    id v5 = @"root";
  }

  return v5;
}

+ (id)_supportedCalendarsOnEmbeddedSystems
{
  v5[3] = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *MEMORY[0x1E4F1C358];
  v5[0] = *MEMORY[0x1E4F1C318];
  v5[1] = v2;
  v5[2] = *MEMORY[0x1E4F1C2E8];
  id v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:3];
  return v3;
}

+ (id)restrictedCountryCodes
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithArray:&unk_1F19D89F0];
}

+ (BOOL)upgradeAppleLanguagesFrom:(id)a3 to:(id)a4
{
  int v4 = +[ISMigrator migratorFromVersion:a3 toVersion:a4];
  char v5 = [v4 performMigration];

  return v5;
}

- (id)displayNameForLanguage:(id)a3 context:(unint64_t)a4 displayLanguage:(id)a5
{
  id v7 = (void *)MEMORY[0x1E4F1CA20];
  id v8 = a3;
  uint64_t v9 = [v7 localeWithLocaleIdentifier:a5];
  uint64_t v10 = objc_msgSend(v9, "localizedStringForLanguage:context:", v8, objc_msgSend((id)objc_opt_class(), "formattingContextFromIUDisplayNameContext:", a4));
  uint64_t v11 = v10;
  if (!v10) {
    uint64_t v10 = v8;
  }
  id v12 = v10;

  return v12;
}

- (id)displayNameForRegion:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5
{
  return [(IntlUtility *)self displayNameForRegion:a3 displayLanguage:a4 capitalization:a5 short:0];
}

- (id)displayNameForRegion:(id)a3 displayLanguage:(id)a4 capitalization:(unint64_t)a5 short:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v9 = (void *)MEMORY[0x1E4F1CA20];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_msgSend(v9, "displayNameForRegion:displayLanguage:context:short:", v11, v10, objc_msgSend((id)objc_opt_class(), "formattingContextFromIUDisplayNameContext:", a5), v6);

  return v12;
}

+ (int64_t)formattingContextFromIUDisplayNameContext:(unint64_t)a3
{
  if (a3 - 1 >= 3) {
    return 0;
  }
  else {
    return 6 - a3;
  }
}

+ (id)preferredLanguageForBundleID:(id)a3
{
  id v4 = a3;
  char v5 = [MEMORY[0x1E4F223F8] bundleRecordWithBundleIdentifier:v4 allowPlaceholder:0 error:0];
  BOOL v6 = [v5 URL];
  if (v6)
  {
    id v7 = [a1 _preferredLanguagesForBundleID:v4 withBundleRecord:v5];
    if (!v7)
    {
      id v7 = [MEMORY[0x1E4F1CA20] _globalPreferredLanguages];
    }
    id v8 = [MEMORY[0x1E4F28B50] bundleWithURL:v6];
    uint64_t v9 = (void *)MEMORY[0x1E4F28B50];
    id v10 = [v8 normalizedLocalizations];
    id v11 = [v9 preferredLocalizationsFromArray:v10 forPreferences:v7];

    id v12 = [v11 firstObject];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)_proposedOverrideLanguageFromLanguage:(id)a3 forLocalizations:(id)a4 preferredLanguages:(id)a5 regionCode:(id)a6
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 length]
    && [v10 count]
    && [v11 count]
    && [v12 length]
    && ([v10 containsObject:v9] & 1) != 0)
  {
    id v44 = v12;
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke;
    v57[3] = &unk_1E63BFF58;
    id v58 = v10;
    id v13 = v9;
    id v59 = v13;
    id v49 = v13;
    v50 = (unsigned int (**)(void, void))MEMORY[0x1C189A8B0](v57);
    v46 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:v13];
    uint64_t v14 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v11, "count"));
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v15 = v11;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v54 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = [MEMORY[0x1E4F1CA20] baseLanguageFromLanguage:*(void *)(*((void *)&v53 + 1) + 8 * i)];
          [v14 addObject:v20];
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v53 objects:v61 count:16];
      }
      while (v17);
    }

    v51[0] = MEMORY[0x1E4F143A8];
    v51[1] = 3221225472;
    v51[2] = __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke_2;
    v51[3] = &unk_1E63BFF80;
    id v21 = v46;
    id v52 = v21;
    long long v22 = [v14 indexesOfObjectsPassingTest:v51];
    if ([v22 count] && (uint64_t v23 = objc_msgSend(v22, "firstIndex"), v23 != 0x7FFFFFFFFFFFFFFFLL))
    {
      uint64_t v27 = v23;
      v43 = v11;
      id v47 = v21;
      while (1)
      {
        int v28 = v22;
        int v29 = objc_msgSend(v15, "mutableCopy", v43);
        [v29 removeObjectAtIndex:v27];
        int v30 = [v15 objectAtIndexedSubscript:v27];
        [v29 insertObject:v30 atIndex:0];

        if (((unsigned int (**)(void, void *))v50)[2](v50, v29)) {
          break;
        }
        long long v22 = v28;
        uint64_t v27 = [v28 indexGreaterThanIndex:v27];

        if (v27 == 0x7FFFFFFFFFFFFFFFLL)
        {
          long long v24 = 0;
          id v12 = v44;
          id v21 = v47;
          goto LABEL_25;
        }
      }
      long long v24 = [v15 objectAtIndexedSubscript:v27];

      id v12 = v44;
      id v21 = v47;
      long long v22 = v28;
LABEL_25:
      id v11 = v43;
    }
    else
    {
      long long v24 = 0;
      id v12 = v44;
    }
    if ([v24 length])
    {
      int v31 = v49;
    }
    else
    {
      v45 = v22;
      id v48 = v21;
      uint64_t v32 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:v49];
      v33 = [v32 countryCode];
      v43 = (void *)[v33 length];

      if (v43)
      {
        id v21 = v48;
        int v31 = v49;
        long long v22 = v45;
      }
      else
      {
        int v31 = v49;
        v43 = [MEMORY[0x1E4F1CA20] languageFromLanguage:v49 byReplacingRegion:v12];
        v60 = v43;
        v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v60 count:1];
        v35 = [v34 arrayByAddingObjectsFromArray:v15];
        unsigned int v36 = ((unsigned int (**)(void, void *))v50)[2](v50, v35);

        if (v36)
        {
          id v37 = v43;

          long long v24 = v37;
          long long v22 = v45;
          v38 = v43;
        }
        else
        {
          v38 = v43;
          long long v22 = v45;
        }

        id v21 = v48;
      }
    }
    if (!objc_msgSend(v24, "length", v43))
    {
      id v39 = v31;
      id v40 = v11;
      v41 = v22;
      id v42 = v39;

      long long v24 = v42;
      long long v22 = v41;
      id v11 = v40;
    }
    id v25 = v24;
  }
  else
  {
    id v25 = v9;
  }

  return v25;
}

uint64_t __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:*(void *)(a1 + 32) forPreferences:a2];
  id v4 = [v3 firstObject];
  uint64_t v5 = [v4 isEqualToString:*(void *)(a1 + 40)];

  return v5;
}

uint64_t __100__IntlUtility__proposedOverrideLanguageFromLanguage_forLocalizations_preferredLanguages_regionCode___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 isEqual:*(void *)(a1 + 32)];
}

+ (id)_preferredLanguagesForBundleID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F223C8];
  id v5 = a3;
  BOOL v6 = (void *)[[v4 alloc] initWithBundleIdentifier:v5 allowPlaceholder:0 error:0];
  id v7 = [a1 _preferredLanguagesForBundleID:v5 withAppRecord:v6];

  return v7;
}

+ (id)_preferredLanguagesForBundleID:(id)a3 withBundleRecord:(id)a4
{
  id v5 = a3;
  BOOL v6 = [a4 dataContainerURL];
  id v7 = [v6 path];

  id v8 = (void *)_CFPreferencesCopyValueWithContainer();
  if ((_NSIsNSArray() & 1) == 0)
  {

    id v8 = 0;
  }

  return v8;
}

+ (void)preferredLanguagesForBundleID:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _getXPCConnectionForLocalizationSwitcher];
  id v9 = [v8 remoteObjectProxy];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __51__IntlUtility_preferredLanguagesForBundleID_reply___block_invoke;
    v10[3] = &unk_1E63BFFA8;
    id v11 = v7;
    [v9 preferredLanguagesForBundleID:v6 reply:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __51__IntlUtility_preferredLanguagesForBundleID_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (void)preferredLanguagesForBundleIDs:(id)a3 reply:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [a1 _getXPCConnectionForLocalizationSwitcher];
  id v9 = [v8 remoteObjectProxy];
  if (v9)
  {
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __52__IntlUtility_preferredLanguagesForBundleIDs_reply___block_invoke;
    v10[3] = &unk_1E63BFFD0;
    id v11 = v7;
    [v9 preferredLanguagesForBundleIDs:v6 reply:v10];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

uint64_t __52__IntlUtility_preferredLanguagesForBundleIDs_reply___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

+ (id)preferredLanguagesForBundleIDs:(id)a3
{
  id v4 = a3;
  id v5 = [a1 _getXPCConnectionForLocalizationSwitcher];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke;
  v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
  v17[4] = a1;
  id v6 = [v5 synchronousRemoteObjectProxyWithErrorHandler:v17];
  id v7 = v6;
  if (v6)
  {
    uint64_t v11 = 0;
    id v12 = &v11;
    uint64_t v13 = 0x3032000000;
    uint64_t v14 = __Block_byref_object_copy_;
    id v15 = __Block_byref_object_dispose_;
    id v16 = 0;
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke_245;
    v10[3] = &unk_1E63C0018;
    void v10[4] = &v11;
    [v6 preferredLanguagesForBundleIDs:v4 reply:v10];
    id v8 = (id)v12[5];
    _Block_object_dispose(&v11, 8);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

void __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    id v4 = objc_opt_class();

    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v4;
    _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error obtaining remote object proxy, %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

void __46__IntlUtility_preferredLanguagesForBundleIDs___block_invoke_245(uint64_t a1, void *a2)
{
}

+ (void)_setPreferredLanguage:(id)a3 forBundleID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  __int16 v8 = [MEMORY[0x1E4F223B8] applicationProxyForIdentifier:v7];
  id v9 = (void *)MEMORY[0x1E4F28B50];
  id v49 = v8;
  uint64_t v10 = [v8 bundleURL];
  uint64_t v11 = [v9 bundleWithURL:v10];

  v50 = v6;
  id v48 = a1;
  if (v6)
  {
    id v12 = [v11 normalizedLocalizations];
    uint64_t v13 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    uint64_t v14 = [MEMORY[0x1E4F1CA20] currentLocale];
    id v15 = [v14 countryCode];
    id v16 = [a1 _proposedOverrideLanguageFromLanguage:v6 forLocalizations:v12 preferredLanguages:v13 regionCode:v15];

    id v6 = [MEMORY[0x1E4F1CA70] orderedSetWithObject:v16];
    uint64_t v17 = [MEMORY[0x1E4F1CA20] preferredLanguages];
    [v6 addObjectsFromArray:v17];
  }
  uint64_t v18 = (void *)MEMORY[0x1E4F28B50];
  id v19 = [v11 normalizedLocalizations];
  id v20 = [v6 array];
  id v21 = [v18 preferredLocalizationsFromArray:v19 forPreferences:v20];
  long long v22 = [v21 firstObject];

  uint64_t v23 = (void *)MEMORY[0x1E4F28B50];
  long long v24 = [v11 normalizedLocalizations];
  id v25 = [MEMORY[0x1E4F1CA20] _globalPreferredLanguages];
  uint64_t v26 = [v23 preferredLocalizationsFromArray:v24 forPreferences:v25];
  uint64_t v27 = [v26 firstObject];

  char v28 = [v22 isEqualToString:v27];
  uint64_t v45 = v27;
  id v47 = v22;
  if (v28)
  {
    int v29 = 0;
  }
  else
  {
    int v29 = objc_msgSend(v6, "array", v27, v22);
  }
  int v30 = objc_msgSend(v49, "dataContainerURL", v45);
  int v31 = [v30 path];

  _CFPreferencesSetValueWithContainer();
  uint64_t v32 = [v11 bundleIdentifier];
  int v33 = [v32 hasPrefix:@"com.apple."];

  if (v33 && v31) {
    _CFPreferencesSetValueWithContainer();
  }
  v34 = [MEMORY[0x1E4F4AC60] sharedDeviceConnection];
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke;
  v51[3] = &unk_1E63C0040;
  id v54 = v48;
  id v35 = v29;
  id v52 = v35;
  id v36 = v6;
  id v53 = v36;
  [v34 fetchWatchAppBundleIDForCompanionAppBundleID:v7 completion:v51];

  id v37 = [v48 perAppLanguageSelectionBundleIdentifiers];
  v38 = [MEMORY[0x1E4F1CA70] orderedSetWithArray:v37];
  id v39 = v38;
  char v40 = v28 ^ 1;
  if (!v50) {
    char v40 = 0;
  }
  if (v40) {
    [v38 addObject:v7];
  }
  else {
    [v38 removeObject:v7];
  }
  v41 = [v39 array];
  char v42 = [v41 isEqualToArray:v37];

  if ((v42 & 1) == 0)
  {
    v43 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
    id v44 = [v39 array];
    [v43 setObject:v44 forKey:@"ApplePerAppLanguageSelectionBundleIdentifiers" inDomain:*MEMORY[0x1E4F283E0]];
  }
}

void __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      *(void *)&buf[4] = objc_opt_class();
      *(_WORD *)&buf[12] = 2114;
      *(void *)&buf[14] = v6;
      id v7 = *(id *)&buf[4];
      _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error obtaining watch app bundle ID, %{public}@", buf, 0x16u);
    }
  }
  else
  {
    uint64_t v18 = 0;
    id v19 = &v18;
    uint64_t v20 = 0x2050000000;
    __int16 v8 = (void *)getNRPairedDeviceRegistryClass_softClass_0;
    uint64_t v21 = getNRPairedDeviceRegistryClass_softClass_0;
    if (!getNRPairedDeviceRegistryClass_softClass_0)
    {
      *(void *)buf = MEMORY[0x1E4F143A8];
      *(void *)&buf[8] = 3221225472;
      *(void *)&buf[16] = __getNRPairedDeviceRegistryClass_block_invoke_0;
      id v25 = &unk_1E63BFCF0;
      uint64_t v26 = &v18;
      __getNRPairedDeviceRegistryClass_block_invoke_0((uint64_t)buf);
      __int16 v8 = (void *)v19[3];
    }
    id v9 = v8;
    _Block_object_dispose(&v18, 8);
    uint64_t v10 = [v9 sharedInstance];
    uint64_t v11 = [v10 getActivePairedDevice];

    id v12 = [MEMORY[0x1E4F4AC60] sharedDeviceConnection];
    long long v22 = @"AppleLanguages";
    uint64_t v13 = *(void *)(a1 + 32);
    if (v13)
    {
      uint64_t v14 = *(void **)(a1 + 32);
    }
    else
    {
      uint64_t v14 = [*(id *)(a1 + 40) array];
    }
    BOOL v15 = v13 == 0;
    uint64_t v23 = v14;
    id v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v23 forKeys:&v22 count:1];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke_252;
    v17[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v17[4] = *(void *)(a1 + 48);
    [v12 updatePreferencesForApplicationWithIdentifier:v5 preferences:v16 writingToPreferencesLocation:1 forPairedDevice:v11 options:1 completion:v17];

    if (v15) {
  }
    }
}

void __49__IntlUtility__setPreferredLanguage_forBundleID___block_invoke_252(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v3 = a2;
    id v4 = objc_opt_class();

    int v6 = 138543618;
    id v7 = v4;
    __int16 v8 = 2114;
    id v9 = v3;
    id v5 = v4;
    _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error updating preferences for watch app, %{public}@", (uint8_t *)&v6, 0x16u);
  }
}

+ (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [a1 _setPreferredLanguage:a3 forBundleID:v6];
  id v7 = [MEMORY[0x1E4F96430] predicateMatchingBundleIdentifier:v6];
  __int16 v8 = (void *)[objc_alloc(MEMORY[0x1E4F96488]) initWithExplanation:@"Terminating app on per-app language change"];
  [v8 setMaximumTerminationResistance:40];
  id v9 = (void *)[objc_alloc(MEMORY[0x1E4F96498]) initWithPredicate:v7 context:v8];
  id v16 = 0;
  char v10 = [v9 acquireWithError:&v16];
  id v11 = v16;
  if ((v10 & 1) == 0 && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    id v12 = objc_opt_class();
    *(_DWORD *)buf = 138543618;
    uint64_t v18 = v12;
    __int16 v19 = 2114;
    id v20 = v6;
    id v13 = v12;
    _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "[%{public}@]: Error obtaining termination assertion on %{public}@", buf, 0x16u);
  }
  [v9 invalidate];
  uint64_t v14 = [a1 _getXPCConnectionForLocalizationSwitcher];
  BOOL v15 = [v14 remoteObjectProxy];
  [v15 notifyPreferredLanguageChangedForBundleID:v6];
}

+ (void)setPreferredLanguage:(id)a3 forBundleID:(id)a4 andRelaunchWithCompletion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [a1 _setPreferredLanguage:v10 forBundleID:v9];
  id v11 = [a1 _getXPCConnectionForLocalizationSwitcher];
  id v12 = [v11 remoteObjectProxy];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __74__IntlUtility_setPreferredLanguage_forBundleID_andRelaunchWithCompletion___block_invoke;
  v14[3] = &unk_1E63C0068;
  id v15 = v8;
  id v13 = v8;
  [v12 setPreferredLanguage:v10 forBundleID:v9 andRelaunchWithReply:v14];
}

uint64_t __74__IntlUtility_setPreferredLanguage_forBundleID_andRelaunchWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

+ (id)_getXPCConnectionForLocalizationSwitcher
{
  if (_getXPCConnectionForLocalizationSwitcher_onceToken != -1) {
    dispatch_once(&_getXPCConnectionForLocalizationSwitcher_onceToken, &__block_literal_global_262);
  }
  uint64_t v2 = (void *)_getXPCConnectionForLocalizationSwitcher__connectionToService;
  return v2;
}

uint64_t __55__IntlUtility__getXPCConnectionForLocalizationSwitcher__block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F29268]) initWithMachServiceName:@"com.apple.localizationswitcherd" options:4096];
  char v1 = (void *)_getXPCConnectionForLocalizationSwitcher__connectionToService;
  _getXPCConnectionForLocalizationSwitcher__connectionToService = v0;

  uint64_t v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1F19DE868];
  [(id)_getXPCConnectionForLocalizationSwitcher__connectionToService setRemoteObjectInterface:v2];

  id v3 = (void *)_getXPCConnectionForLocalizationSwitcher__connectionToService;
  return [v3 resume];
}

+ (id)perAppLanguageSelectionBundleIdentifiers
{
  uint64_t v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v3 = [v2 objectForKey:@"ApplePerAppLanguageSelectionBundleIdentifiers" inDomain:*MEMORY[0x1E4F283E0]];

  return v3;
}

+ (void)subscribeToAppLanguageChanges:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  handler[0] = MEMORY[0x1E4F143A8];
  handler[1] = 3221225472;
  handler[2] = __45__IntlUtility_subscribeToAppLanguageChanges___block_invoke;
  handler[3] = &unk_1E63C0090;
  id v7 = v3;
  id v4 = v3;
  xpc_set_event_stream_handler("com.apple.IntlPreferences.events", 0, handler);
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  xpc_set_event();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446210;
    id v9 = "per_app_language_changed";
    _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "XPC event [%{public}s] registered.", buf, 0xCu);
  }
}

void __45__IntlUtility_subscribeToAppLanguageChanges___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  string = xpc_dictionary_get_string(v3, (const char *)*MEMORY[0x1E4F14560]);
  xpc_object_t v5 = xpc_dictionary_get_string(v3, "bundleID");
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v8 = 136446466;
    id v9 = string;
    __int16 v10 = 2082;
    id v11 = v5;
    _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "XPC event [%{public}s] received with bundle ID = [%{public}s]", (uint8_t *)&v8, 0x16u);
  }
  if (v5)
  {
    uint64_t v6 = *(void *)(a1 + 32);
    reply = [NSString stringWithUTF8String:v5];
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, reply);
  }
  else
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply) {
      xpc_dictionary_send_reply();
    }
  }
}

+ (void)unsubscribeFromAppLanguageChanges
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  xpc_set_event();
  if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT))
  {
    int v2 = 136446210;
    id v3 = "per_app_language_changed";
    _os_log_impl(&dword_1BECA5000, MEMORY[0x1E4F14500], OS_LOG_TYPE_DEFAULT, "XPC event [%{public}s] unregistered.", (uint8_t *)&v2, 0xCu);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mBidiTestedLanguagesArray, 0);
  objc_storeStrong((id *)&self->mBidiLanguagesArray, 0);
}

@end