@interface NSLocale(NSLocale_LanguageExtras)
+ (id)_preferredMeasurementSystem;
+ (id)_preferredTemperatureUnit;
+ (id)preferredLocale;
+ (uint64_t)__effectiveLanguageForBundle:()NSLocale_LanguageExtras;
+ (uint64_t)_deviceLanguage;
+ (uint64_t)_setPreferredMeasurementSystem:()NSLocale_LanguageExtras;
+ (uint64_t)_setPreferredTemperatureUnit:()NSLocale_LanguageExtras;
+ (uint64_t)mostPreferredLanguageOf:()NSLocale_LanguageExtras forUsage:options:;
+ (uint64_t)systemLanguages;
+ (void)mostPreferredLanguageOf:()NSLocale_LanguageExtras withPreferredLanguages:forUsage:options:;
+ (void)registerPreferredLanguage:()NSLocale_LanguageExtras usage:confidence:;
+ (void)setPreferredLanguages:()NSLocale_LanguageExtras;
@end

@implementation NSLocale(NSLocale_LanguageExtras)

+ (id)_preferredTemperatureUnit
{
  v0 = (void *)_CFLocaleCopyPreferredTemperatureUnit();

  return v0;
}

+ (uint64_t)_deviceLanguage
{
  v0 = (void *)MEMORY[0x1E4F1CA20];
  uint64_t v1 = _NSFoundationBundle();

  return objc_msgSend(v0, "__effectiveLanguageForBundle:", v1);
}

+ (uint64_t)__effectiveLanguageForBundle:()NSLocale_LanguageExtras
{
  CFStringRef v4 = (const __CFString *)*MEMORY[0x1E4F1D3B8];
  CFStringRef v5 = (const __CFString *)*MEMORY[0x1E4F1D3C8];
  v6 = (void *)CFPreferencesCopyValue(@"AppleLanguages", (CFStringRef)*MEMORY[0x1E4F1D3B8], (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3C8]);
  if (![v6 count])
  {
    if (v6) {
      CFRelease(v6);
    }
    v6 = (void *)CFPreferencesCopyValue(@"AppleLanguages", v4, (CFStringRef)*MEMORY[0x1E4F1D3D0], v5);
  }
  id v7 = -[NSArray firstObject](+[NSBundle preferredLocalizationsFromArray:forPreferences:](NSBundle, "preferredLocalizationsFromArray:forPreferences:", [a3 localizations], v6), "firstObject");
  uint64_t v8 = [MEMORY[0x1E4F1CA20] canonicalLanguageIdentifierFromString:v7];
  if (v6) {
    CFRelease(v6);
  }
  return v8;
}

+ (void)mostPreferredLanguageOf:()NSLocale_LanguageExtras withPreferredLanguages:forUsage:options:
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  if ((a6 & 4) != 0)
  {
    v11 = objc_opt_new();
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v12 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v29 != v14) {
            objc_enumerationMutation(a3);
          }
          uint64_t BaseLanguageIdentifierFromIdentifier = GetBaseLanguageIdentifierFromIdentifier(*(void **)(*((void *)&v28 + 1)
                                                                                                  + 8 * i));
          if (BaseLanguageIdentifierFromIdentifier) {
            [v11 addObject:BaseLanguageIdentifierFromIdentifier];
          }
        }
        uint64_t v13 = [a3 countByEnumeratingWithState:&v28 objects:v27 count:16];
      }
      while (v13);
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v17 = [a4 countByEnumeratingWithState:&v23 objects:v22 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v24;
LABEL_18:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(a4);
        }
        v10 = *(void **)(*((void *)&v23 + 1) + 8 * v20);
        if ([v11 containsObject:GetBaseLanguageIdentifierFromIdentifier(v10)]) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [a4 countByEnumeratingWithState:&v23 objects:v22 count:16];
          if (v18) {
            goto LABEL_18;
          }
          goto LABEL_24;
        }
      }
    }
    else
    {
LABEL_24:
      v10 = 0;
    }
  }
  else
  {
    id v8 = [(NSArray *)+[NSBundle preferredLocalizationsFromArray:a3 forPreferences:a4] firstObject];
    if (v8 && (v9 = v8, MatchesBaseLanguageInLanguageIDs(v8, a3)))
    {
      if (MatchesBaseLanguageInLanguageIDs(v9, a4)) {
        return v9;
      }
      else {
        return 0;
      }
    }
    else
    {
      return 0;
    }
  }
  return v10;
}

+ (uint64_t)mostPreferredLanguageOf:()NSLocale_LanguageExtras forUsage:options:
{
  uint64_t v9 = [a1 preferredLanguages];

  return [a1 mostPreferredLanguageOf:a3 withPreferredLanguages:v9 forUsage:a4 options:a5];
}

+ (id)preferredLocale
{
  v0 = (void *)_CFLocaleCopyPreferred();

  return v0;
}

+ (uint64_t)systemLanguages
{
  return 0x1ECAB6158;
}

+ (void)setPreferredLanguages:()NSLocale_LanguageExtras
{
}

+ (void)registerPreferredLanguage:()NSLocale_LanguageExtras usage:confidence:
{
  uint64_t v7 = _NormalizedLanguageIDFromString(a4);
  if ((a5 & 3) != 0 && a1 > 0.5)
  {
    uint64_t v8 = v7;
    uint64_t v9 = (void *)_CFLocaleCopyPreferredLanguagesForCurrentUser();
    if (v9)
    {
      v10 = v9;
      v11 = (void *)[v9 mutableCopy];
      if (([v11 containsObject:v8] & 1) == 0)
      {
        [v11 addObject:v8];
        _SetPreferredLanguages(v11);
      }

      CFRelease(v10);
    }
  }
}

+ (uint64_t)_setPreferredMeasurementSystem:()NSLocale_LanguageExtras
{
  return MEMORY[0x1F40D8E88](a3);
}

+ (id)_preferredMeasurementSystem
{
  v0 = (void *)_CFLocaleCopyPreferredMeasurementSystem();

  return v0;
}

+ (uint64_t)_setPreferredTemperatureUnit:()NSLocale_LanguageExtras
{
  return MEMORY[0x1F40D8E90](a3);
}

@end