@interface NSBundle(IntlPreferencesAdditions)
- (id)normalizedLocalizations;
@end

@implementation NSBundle(IntlPreferencesAdditions)

- (id)normalizedLocalizations
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v3 = objc_msgSend(a1, "localizations", 0);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = +[IntlUtility normalizedLanguageIDFromString:*(void *)(*((void *)&v12 + 1) + 8 * i)];
        [v8 UTF8String];
        ISO3Language = (unsigned char *)uloc_getISO3Language();
        if (ISO3Language && *ISO3Language) {
          [v2 addObject:v8];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }

  [v2 removeObject:@"base"];
  v10 = [v2 allObjects];

  return v10;
}

@end