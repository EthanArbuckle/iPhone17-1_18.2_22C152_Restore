@interface NSLocale(Setup)
+ (id)_subdivisionCodeFromSubdivisionTag:()Setup restrictedToRegionCode:;
- (BOOL)_requiresMultilingualSetupWithKeyboardIDs:()Setup;
- (id)_languagesForMultilingualSetupWithKeyboardsIDs:()Setup;
- (id)defaultLanguagesForMultilingualSetup;
- (uint64_t)languagesForMultilingualSetup;
- (uint64_t)requiresMultilingualSetup;
@end

@implementation NSLocale(Setup)

- (BOOL)_requiresMultilingualSetupWithKeyboardIDs:()Setup
{
  v2 = objc_msgSend(a1, "_languagesForMultilingualSetupWithKeyboardsIDs:");
  if ((unint64_t)[v2 count] < 2)
  {
    BOOL v8 = 0;
  }
  else
  {
    v3 = [a1 countryCode];
    if ([v3 length])
    {
      v4 = (void *)MEMORY[0x1E4F1CA20];
      v5 = [@"zxx_" stringByAppendingString:v3];
      v6 = [v4 localeWithLocaleIdentifier:v5];
      v7 = [v6 _languagesForMultilingualSetupWithKeyboardsIDs:0];
    }
    else
    {
      v7 = 0;
    }
    v9 = (void *)MEMORY[0x1E4F1CA20];
    v10 = [a1 languageIdentifier];
    v11 = [v9 baseLanguageFromLanguage:v10];

    if ([v7 containsObject:v11])
    {
      v12 = [MEMORY[0x1E4F1CA20] baseSystemLanguages];
      v13 = [v2 arrayByExcludingObjectsInArray:v12];

      BOOL v8 = [v13 count] != 0;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  return v8;
}

- (uint64_t)requiresMultilingualSetup
{
  return [a1 _requiresMultilingualSetupWithKeyboardIDs:0];
}

- (id)_languagesForMultilingualSetupWithKeyboardsIDs:()Setup
{
  v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  v3 = [a1 languageIdentifier];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA20];
    v5 = [a1 languageIdentifier];
    v6 = [v4 canonicalLanguageIdentifierFromString:v5];
    v7 = [v4 baseLanguageFromLanguage:v6];
    [v2 addObject:v7];
  }
  BOOL v8 = (void *)MEMORY[0x1E4F1CA20];
  v9 = [a1 localeIdentifier];
  v10 = [v8 componentsFromLocaleIdentifier:v9];
  v11 = [v10 objectForKey:@"sd"];

  if ([v11 length])
  {
    v12 = (void *)MEMORY[0x1E4F1CA20];
    v13 = [a1 countryCode];
    v14 = objc_opt_class();
    v15 = [a1 countryCode];
    v16 = [v14 _subdivisionCodeFromSubdivisionTag:v11 restrictedToRegionCode:v15];
    v17 = [v12 languagesForRegion:v13 subdivision:v16 withThreshold:1 filter:2];

    if (v17) {
      goto LABEL_6;
    }
  }
  v18 = (void *)MEMORY[0x1E4F1CA20];
  v19 = [a1 countryCode];
  v17 = [v18 languagesForRegion:v19 subdivision:0 withThreshold:1 filter:2];

  if (v17) {
LABEL_6:
  }
    [v2 addObjectsFromArray:v17];

  v20 = [v2 array];

  return v20;
}

- (uint64_t)languagesForMultilingualSetup
{
  return [a1 _languagesForMultilingualSetupWithKeyboardsIDs:0];
}

- (id)defaultLanguagesForMultilingualSetup
{
  v2 = [MEMORY[0x1E4F1CA70] orderedSet];
  v3 = [a1 languageIdentifier];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1CA20];
    v5 = [a1 languageIdentifier];
    v6 = [v4 canonicalLanguageIdentifierFromString:v5];
    v7 = [v4 baseLanguageFromLanguage:v6];
    [v2 addObject:v7];
  }
  BOOL v8 = (void *)MEMORY[0x1E4F1CA20];
  v9 = [a1 localeIdentifier];
  v10 = [v8 componentsFromLocaleIdentifier:v9];
  v11 = [v10 objectForKey:@"sd"];

  if ([v11 length])
  {
    v12 = (void *)MEMORY[0x1E4F1CA20];
    v13 = [a1 countryCode];
    v14 = objc_opt_class();
    v15 = [a1 countryCode];
    v16 = [v14 _subdivisionCodeFromSubdivisionTag:v11 restrictedToRegionCode:v15];
    v17 = [v12 languagesForRegion:v13 subdivision:v16 withThreshold:2 filter:2];

    if (v17) {
      goto LABEL_6;
    }
  }
  v18 = (void *)MEMORY[0x1E4F1CA20];
  v19 = [a1 countryCode];
  v17 = [v18 languagesForRegion:v19 subdivision:0 withThreshold:2 filter:2];

  if (v17) {
LABEL_6:
  }
    [v2 addObjectsFromArray:v17];

  v20 = [v2 array];

  return v20;
}

+ (id)_subdivisionCodeFromSubdivisionTag:()Setup restrictedToRegionCode:
{
  id v5 = a3;
  v6 = [a4 uppercaseString];
  v7 = [v5 substringToIndex:2];
  BOOL v8 = [v7 uppercaseString];

  v9 = [v5 substringFromIndex:2];

  v10 = [v9 uppercaseString];

  if ([v6 isEqualToString:v8]) {
    id v11 = v10;
  }
  else {
    id v11 = 0;
  }

  return v11;
}

@end