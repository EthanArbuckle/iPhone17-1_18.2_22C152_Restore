@interface Localize
+ (NSArray)availableLocaleNames;
+ (NSArray)systemLocales;
+ (NSBundle)mainBundle;
+ (NSLocale)systemLocale;
+ (id)localizationForLocale:(id)a3;
+ (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6;
+ (id)localizedStringsForTable:(id)a3 localization:(id)a4;
@end

@implementation Localize

+ (NSArray)systemLocales
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v2 = objc_opt_new();
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  v3 = objc_msgSend(MEMORY[0x1E4F1CA20], "preferredLanguages", 0);
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
        v8 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:*(void *)(*((void *)&v13 + 1) + 8 * i)];
        [v2 addObject:v8];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v5);
  }

  uint64_t v9 = [v2 count];
  v10 = [MEMORY[0x1E4F1CA20] currentLocale];
  if (v9) {
    [v2 setObject:v10 atIndexedSubscript:0];
  }
  else {
    [v2 addObject:v10];
  }

  v11 = (void *)[v2 copy];
  return (NSArray *)v11;
}

+ (NSLocale)systemLocale
{
  return (NSLocale *)[MEMORY[0x1E4F1CA20] currentLocale];
}

+ (NSBundle)mainBundle
{
  v2 = (void *)MEMORY[0x1E4F28B50];
  uint64_t v3 = objc_opt_class();
  return (NSBundle *)[v2 bundleForClass:v3];
}

+ (id)localizedStringsForTable:(id)a3 localization:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  v7 = +[Localize mainBundle];
  v8 = [v7 localizedStringsForTable:v6 localization:v5];

  return v8;
}

+ (id)localizedStringForKey:(id)a3 value:(id)a4 table:(id)a5 localization:(id)a6
{
  id v9 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  long long v13 = +[Localize mainBundle];
  long long v14 = [v13 localizedStringForKey:v12 value:v11 table:v10 localization:v9];

  return v14;
}

+ (id)localizationForLocale:(id)a3
{
  v11[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F28B50];
  id v4 = a3;
  id v5 = +[Localize availableLocaleNames];
  id v6 = [v4 localeIdentifier];

  v11[0] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:1];
  v8 = [v3 preferredLocalizationsFromArray:v5 forPreferences:v7];

  id v9 = [v8 objectAtIndexedSubscript:0];

  return v9;
}

+ (NSArray)availableLocaleNames
{
  v2 = +[Localize mainBundle];
  uint64_t v3 = [v2 localizations];

  return (NSArray *)v3;
}

@end