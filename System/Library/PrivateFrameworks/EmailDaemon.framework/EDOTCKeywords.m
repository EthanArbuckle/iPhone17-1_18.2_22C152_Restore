@interface EDOTCKeywords
+ (id)localizedExpressionStrings;
+ (id)log;
@end

@implementation EDOTCKeywords

+ (id)log
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __20__EDOTCKeywords_log__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (log_onceToken_64 != -1) {
    dispatch_once(&log_onceToken_64, block);
  }
  v2 = (void *)log_log_64;

  return v2;
}

void __20__EDOTCKeywords_log__block_invoke(uint64_t a1)
{
  NSStringFromClass(*(Class *)(a1 + 32));
  id v3 = objc_claimAutoreleasedReturnValue();
  os_log_t v1 = os_log_create("com.apple.email", (const char *)[v3 UTF8String]);
  v2 = (void *)log_log_64;
  log_log_64 = (uint64_t)v1;
}

+ (id)localizedExpressionStrings
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__EDOTCKeywords_localizedExpressionStrings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (localizedExpressionStrings_onceToken != -1) {
    dispatch_once(&localizedExpressionStrings_onceToken, block);
  }
  v2 = (void *)localizedExpressionStrings_otcKeywordsArray;

  return v2;
}

void __43__EDOTCKeywords_localizedExpressionStrings__block_invoke()
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  os_log_t v1 = [v0 URLForResource:@"EDOTCLocalizationKeywords" withExtension:@"json"];

  v2 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v1];
  id v16 = 0;
  id v3 = [MEMORY[0x1E4F28D90] JSONObjectWithData:v2 options:0 error:&v16];
  id v4 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v3 count])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    v13 = __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_20;
    v14 = &unk_1E6C03E08;
    id v6 = v5;
    id v15 = v6;
    [v3 enumerateKeysAndObjectsUsingBlock:&v11];
    uint64_t v7 = objc_msgSend(v6, "allObjects", v11, v12, v13, v14);
    v8 = (void *)localizedExpressionStrings_otcKeywordsArray;
    localizedExpressionStrings_otcKeywordsArray = v7;
  }
  else
  {
    v9 = +[EDOTCKeywords log];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = [v3 description];
      __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_cold_1(v10, (uint64_t)v4, buf, v9);
    }

    id v6 = (id)localizedExpressionStrings_otcKeywordsArray;
    localizedExpressionStrings_otcKeywordsArray = MEMORY[0x1E4F1CBF0];
  }
}

void __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_20(uint64_t a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  id v5 = [v4 valueForKey:@"expressions"];
  id v6 = [v4 valueForKey:@"properties"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v7 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_2;
    v9[3] = &unk_1E6C03DE0;
    id v10 = v6;
    v8 = objc_msgSend(v5, "ef_map:", v9);
    [v7 addObjectsFromArray:v8];
  }
}

id __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) objectForKeyedSubscript:@"no-word-boundaries"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v4 BOOLValue])
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [NSString stringWithFormat:@"\\b%@\\b", v3];
  }
  id v6 = v5;

  return v6;
}

void __43__EDOTCKeywords_localizedExpressionStrings__block_invoke_cold_1(void *a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412546;
  *(void *)(buf + 4) = a1;
  *((_WORD *)buf + 6) = 2112;
  *(void *)(buf + 14) = a2;
  _os_log_error_impl(&dword_1DB39C000, log, OS_LOG_TYPE_ERROR, "JSON localized keywords file returned empty, check previous logs to see potential issue: %@. Error: %@", buf, 0x16u);
}

@end