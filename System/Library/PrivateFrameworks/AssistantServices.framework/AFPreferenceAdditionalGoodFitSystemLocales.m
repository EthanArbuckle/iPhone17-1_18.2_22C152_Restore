@interface AFPreferenceAdditionalGoodFitSystemLocales
@end

@implementation AFPreferenceAdditionalGoodFitSystemLocales

void ___AFPreferenceAdditionalGoodFitSystemLocales_block_invoke()
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v0 = (void *)[objc_alloc(MEMORY[0x1E4F1CA80]) initWithArray:&unk_1EEE99628];
  v1 = _AFPreferencesAlternativeLocaleLanguages();
  v2 = [v1 allKeys];
  [v0 addObjectsFromArray:v2];

  v3 = [&unk_1EEE988D8 allKeys];
  [v0 addObjectsFromArray:v3];

  [v0 removeObject:@"hi-IN"];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v4 = objc_msgSend(v0, "copy", 0);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        v9 = [*(id *)(*((void *)&v12 + 1) + 8 * v8) stringByReplacingOccurrencesOfString:@"-" withString:@"_"];
        [v0 addObject:v9];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = [v0 copy];
  v11 = (void *)_AFPreferenceAdditionalGoodFitSystemLocales_sSpecialCases;
  _AFPreferenceAdditionalGoodFitSystemLocales_sSpecialCases = v10;
}

@end