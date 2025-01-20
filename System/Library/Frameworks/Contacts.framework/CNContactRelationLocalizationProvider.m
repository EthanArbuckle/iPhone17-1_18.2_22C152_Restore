@interface CNContactRelationLocalizationProvider
+ (id)preferredLanguages;
+ (id)supplementalLabelURLPairsForLanguages:(id)a3;
@end

@implementation CNContactRelationLocalizationProvider

+ (id)supplementalLabelURLPairsForLanguages:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = (void *)[v3 mutableCopy];
  v5 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v6 = [MEMORY[0x1E4F1CA70] orderedSet];
  v28 = v5;
  uint64_t v7 = [v5 localizations];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  obuint64_t j = v3;
  uint64_t v8 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v34 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v33 + 1) + 8 * i);
        v13 = [MEMORY[0x1E4F28B50] preferredLocalizationsFromArray:v7 forPreferences:v4];
        v14 = [v13 firstObject];

        [v6 addObject:v14];
        [v4 removeObject:v12];
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v9);
  }
  v26 = (void *)v7;

  v15 = [MEMORY[0x1E4F1CA70] orderedSet];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v18; ++j)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(v16);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * j);
        v22 = [v28 URLForResource:@"CNLabeledValue" withExtension:@"strings" subdirectory:0 localization:v21];
        if (v22)
        {
          v23 = [MEMORY[0x1E4F5A490] pairWithFirst:v22 second:v21];
          [v15 addObject:v23];
        }
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v18);
  }

  if (![v15 count]) {
    NSLog(&cfstr_NoSupplemental.isa, obj, v26);
  }
  v24 = [v15 array];

  return v24;
}

+ (id)preferredLanguages
{
  v2 = (void *)MEMORY[0x1E4F1CA20];
  id v3 = [MEMORY[0x1E4F1CA20] preferredLanguages];
  v4 = [v2 languagesByAddingRelatedLanguagesToLanguages:v3];

  return v4;
}

@end