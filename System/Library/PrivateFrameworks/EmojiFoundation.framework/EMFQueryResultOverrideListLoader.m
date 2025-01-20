@interface EMFQueryResultOverrideListLoader
+ (id)overrideListForLocale:(id)a3;
@end

@implementation EMFQueryResultOverrideListLoader

+ (id)overrideListForLocale:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = [MEMORY[0x1E4F28B50] bundleWithIdentifier:@"com.apple.CoreEmoji"];
    if (v4)
    {
      v5 = _createStrippedLocaleIdentifierForLocale(v3);
      v6 = _overridePlistForLocaleIdentifierCheckingBothLocations(v4, v5);
      v7 = _createStrippedFallbackLocaleIdentifierForLocale(v3);
      if (!v6)
      {
        v6 = _overridePlistForLocaleIdentifierCheckingBothLocations(v4, v7);
        if (!v6)
        {
          v8 = emf_logging_get_default_log();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
          {
            int v15 = 138412290;
            v16 = v5;
            _os_log_impl(&dword_1B8C45000, v8, OS_LOG_TYPE_INFO, "No search engine override list found for locale '%@'", (uint8_t *)&v15, 0xCu);
          }

          v6 = 0;
        }
      }
    }
    else
    {
      v5 = emf_logging_get_default_log();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
        +[EMFQueryResultOverrideListLoader overrideListForLocale:](v5);
      }
      v6 = 0;
    }

    if (v6)
    {
      v9 = [[EMFQueryResultOverrideList alloc] initWithOverrideListURL:v6];
      if (v9)
      {
        v10 = emf_logging_get_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v11 = [v3 localeIdentifier];
          v12 = [v6 absoluteString];
          int v15 = 138412546;
          v16 = v11;
          __int16 v17 = 2112;
          v18 = v12;
          _os_log_impl(&dword_1B8C45000, v10, OS_LOG_TYPE_INFO, "Loaded override list for locale '%@' (%@)", (uint8_t *)&v15, 0x16u);
        }
        v13 = v9;
      }
    }
    else
    {
      v9 = 0;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)overrideListForLocale:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B8C45000, log, OS_LOG_TYPE_ERROR, "Could not locate CoreEmoji's on-disk framework bundle", v1, 2u);
}

@end