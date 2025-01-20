@interface NSLocale(EmailFoundationAdditions)
+ (id)ef_localesFromLanguages:()EmailFoundationAdditions;
+ (id)ef_posixLocale;
+ (id)ef_quotePairsForLanguages:()EmailFoundationAdditions;
+ (id)ef_quotePairsForLocales:()EmailFoundationAdditions;
@end

@implementation NSLocale(EmailFoundationAdditions)

+ (id)ef_posixLocale
{
  if (ef_posixLocale_onceToken != -1) {
    dispatch_once(&ef_posixLocale_onceToken, &__block_literal_global_17);
  }
  v0 = (void *)ef_posixLocale_locale;
  return v0;
}

+ (id)ef_localesFromLanguages:()EmailFoundationAdditions
{
  v7[1] = *MEMORY[0x1E4F143B8];
  v3 = objc_msgSend(a3, "ef_compactMap:", &__block_literal_global_4_1);
  if (![v3 count])
  {
    v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    v7[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1];

    v3 = (void *)v5;
  }
  return v3;
}

+ (id)ef_quotePairsForLocales:()EmailFoundationAdditions
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 count])
  {
    v4 = [MEMORY[0x1E4F1CA20] currentLocale];
    v23[0] = v4;
    uint64_t v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:1];

    id v3 = (id)v5;
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = v3;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v7);
        }
        v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        v12 = objc_msgSend(v11, "quotationBeginDelimiter", (void)v18);
        v13 = [v11 quotationEndDelimiter];
        v14 = +[EFPair pairWithFirst:v12 second:v13];
        [v6 addObject:v14];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v8);
  }

  v15 = +[EFPair pairWithFirst:@"\" second:@"\"];
  [v6 addObject:v15];

  v16 = [v6 array];

  return v16;
}

+ (id)ef_quotePairsForLanguages:()EmailFoundationAdditions
{
  v2 = objc_msgSend(a1, "ef_localesFromLanguages:");
  id v3 = objc_msgSend(a1, "ef_quotePairsForLocales:", v2);

  return v3;
}

@end