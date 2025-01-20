@interface ATXNewsTodayWidgetPlacementPolicyProvider
+ (id)_newsSupportedCountries;
+ (id)_parsecEditorialLocales;
- (BOOL)isTodayWidgetPermittedForLocale:(id)a3;
@end

@implementation ATXNewsTodayWidgetPlacementPolicyProvider

- (BOOL)isTodayWidgetPermittedForLocale:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = objc_opt_new();
  v5 = [v4 isChild];
  int v6 = [v5 BOOLValue];

  if (!v6)
  {
    v7 = [v3 countryCode];
    if (!v7)
    {
      v11 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
        v12 = "%s: no country code in locale, allowing News widget";
        goto LABEL_11;
      }
LABEL_20:
      BOOL v8 = 1;
LABEL_21:

      goto LABEL_22;
    }
    v9 = [(id)objc_opt_class() _newsSupportedCountries];
    int v10 = [v9 containsObject:v7];

    if (v10)
    {
      v11 = __atxlog_handle_home_screen();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 136315138;
        v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
        v12 = "%s: in news supported country, allowing News widget";
LABEL_11:
        _os_log_impl(&dword_1A790D000, v11, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v18, 0xCu);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    v11 = [v3 localeIdentifier];
    if (v11)
    {
      v13 = [(id)objc_opt_class() _parsecEditorialLocales];
      int v14 = [v13 containsObject:v11];

      if (!v14)
      {
        BOOL v8 = 0;
        goto LABEL_21;
      }
      v15 = __atxlog_handle_home_screen();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_19;
      }
      int v18 = 136315138;
      v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
      v16 = "%s: in parsec editorial locale, allowing News widget";
    }
    else
    {
      v15 = __atxlog_handle_home_screen();
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
LABEL_19:

        goto LABEL_20;
      }
      int v18 = 136315138;
      v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
      v16 = "%s: no locale identifier, allowing News widget";
    }
    _os_log_impl(&dword_1A790D000, v15, OS_LOG_TYPE_DEFAULT, v16, (uint8_t *)&v18, 0xCu);
    goto LABEL_19;
  }
  v7 = __atxlog_handle_home_screen();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 136315138;
    v19 = "-[ATXNewsTodayWidgetPlacementPolicyProvider isTodayWidgetPermittedForLocale:]";
    _os_log_impl(&dword_1A790D000, v7, OS_LOG_TYPE_DEFAULT, "%s: not allowing News widget for child account", (uint8_t *)&v18, 0xCu);
  }
  BOOL v8 = 0;
LABEL_22:

  return v8;
}

+ (id)_newsSupportedCountries
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"AU", @"CA", @"GB", @"US", 0);
}

+ (id)_parsecEditorialLocales
{
  return (id)objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"fr_FR", @"de_DE", 0);
}

@end