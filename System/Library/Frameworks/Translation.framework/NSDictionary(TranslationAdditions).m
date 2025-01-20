@interface NSDictionary(TranslationAdditions)
- (uint64_t)lt_ensureTypesForKeys:()TranslationAdditions values:;
@end

@implementation NSDictionary(TranslationAdditions)

- (uint64_t)lt_ensureTypesForKeys:()TranslationAdditions values:
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 1;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __67__NSDictionary_TranslationAdditions__lt_ensureTypesForKeys_values___block_invoke;
  v6[3] = &unk_2651DCE50;
  v6[5] = a3;
  v6[6] = a4;
  v6[4] = &v7;
  [a1 enumerateKeysAndObjectsUsingBlock:v6];
  uint64_t v4 = *((unsigned __int8 *)v8 + 24);
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end