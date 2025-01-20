@interface CLSHolidayCalendarEventRulesFactory
+ (id)_allEventRulesForEventRulesDictionaries:(id)a3;
+ (id)_baseURL;
+ (id)_eventRulesDictionariesForURL:(id)a3;
+ (id)allSupportedCountryCodes;
+ (id)eventRules;
+ (id)eventRulesSourcesURL:(id)a3;
+ (id)eventRulesURLForSourceURL:(id)a3;
@end

@implementation CLSHolidayCalendarEventRulesFactory

+ (id)_baseURL
{
  v2 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
  v3 = [v2 URLForResource:@"CLSHolidayCalendarEventRules" withExtension:0];

  return v3;
}

+ (id)_eventRulesDictionariesForURL:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v12 = 0;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:a3 error:&v12];
  id v4 = v12;
  v5 = v4;
  if (v3) {
    BOOL v6 = v4 == 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v6)
  {
    v10 = [v3 objectForKeyedSubscript:@"events"];
  }
  else
  {
    v7 = +[CLSLogging sharedLogging];
    v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v9 = [v5 localizedDescription];
      *(_DWORD *)buf = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D2150000, v8, OS_LOG_TYPE_INFO, "Error reading the holiday rules file: \"%@\"", buf, 0xCu);
    }
    v10 = 0;
  }

  return v10;
}

+ (id)_allEventRulesForEventRulesDictionaries:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        v11 = [CLSHolidayCalendarEventRule alloc];
        id v12 = -[CLSHolidayCalendarEventRule initWithEventDescription:](v11, "initWithEventDescription:", v10, (void)v14);
        [v4 addObject:v12];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  return v4;
}

+ (id)allSupportedCountryCodes
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [a1 _baseURL];
  id v5 = [a1 eventRulesURLForSourceURL:v4];

  uint64_t v6 = [a1 _eventRulesDictionariesForURL:v5];
  uint64_t v7 = [a1 _allEventRulesForEventRulesDictionaries:v6];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = [*(id *)(*((void *)&v14 + 1) + 8 * i) explicitlySupportedCountryCodes];
        [v3 addObjectsFromArray:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v9);
  }

  return v3;
}

+ (id)eventRulesURLForSourceURL:(id)a3
{
  id v3 = [a3 URLByAppendingPathComponent:@"all_v2"];
  id v4 = [v3 URLByAppendingPathExtension:@"plist"];

  return v4;
}

+ (id)eventRules
{
  id v3 = [a1 _baseURL];
  id v4 = [a1 eventRulesSourcesURL:v3];

  return v4;
}

+ (id)eventRulesSourcesURL:(id)a3
{
  if (a3)
  {
    id v4 = objc_msgSend(a1, "eventRulesURLForSourceURL:");
    if (v4)
    {
      id v5 = [a1 _eventRulesDictionariesForURL:v4];
      uint64_t v6 = [a1 _allEventRulesForEventRulesDictionaries:v5];
    }
    else
    {
      uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
    }
  }
  else
  {
    uint64_t v7 = +[CLSLogging sharedLogging];
    uint64_t v8 = [v7 loggingConnection];

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_error_impl(&dword_1D2150000, v8, OS_LOG_TYPE_ERROR, "Sources URL is nil. Returning no eventRules.", v10, 2u);
    }

    uint64_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v6;
}

@end