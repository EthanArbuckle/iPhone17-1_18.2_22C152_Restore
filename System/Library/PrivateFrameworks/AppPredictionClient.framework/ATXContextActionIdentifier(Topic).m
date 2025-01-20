@interface ATXContextActionIdentifier(Topic)
- (id)initWithTopic:()Topic sectionBundleIdentifier:;
@end

@implementation ATXContextActionIdentifier(Topic)

- (id)initWithTopic:()Topic sectionBundleIdentifier:
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && [v7 length])
  {
    v9 = objc_opt_new();
    if (+[ATXSpotlightContextAdapter isSpotlightRecentSectionIdentifier:v8])
    {
      v10 = __atxlog_handle_blending();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v18 = 138412546;
        v19 = v8;
        __int16 v20 = 2112;
        id v21 = v6;
        _os_log_impl(&dword_1A790D000, v10, OS_LOG_TYPE_DEFAULT, "ATXContextActionIdentifier: skipping recent topic: %@, %@", (uint8_t *)&v18, 0x16u);
      }
      id v11 = 0;
    }
    else
    {
      v10 = [v9 contextCodeIdentifierWithSectionBundleIdentifier:v8];
      v12 = +[ATXSpotlightAction spotlightActionTypeFromTopic:v6];
      if ([v12 length])
      {
        v13 = [(id)objc_opt_class() actionTypeFromSpotlightActionType:v12];
        v14 = +[ATXSpotlightAction actionIdentifierFromTopic:v6];
        uint64_t v15 = [v14 hash];
        if ([v10 length]
          && [v12 length]
          && [v13 length]
          && v15)
        {
          a1 = (id)[a1 initWithContext:v10 subType:v13 instanceIdentifierInteger:v15];
          id v11 = a1;
        }
        else
        {
          v16 = __atxlog_handle_blending();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
          {
            int v18 = 138413058;
            v19 = v10;
            __int16 v20 = 2112;
            id v21 = v12;
            __int16 v22 = 2112;
            v23 = v13;
            __int16 v24 = 2112;
            v25 = v14;
            _os_log_debug_impl(&dword_1A790D000, v16, OS_LOG_TYPE_DEBUG, "ATXContextActionIdentifier: expected component missing: %@, %@, %@, %@", (uint8_t *)&v18, 0x2Au);
          }

          id v11 = 0;
        }
      }
      else
      {
        v13 = __atxlog_handle_blending();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          -[ATXContextActionIdentifier(Topic) initWithTopic:sectionBundleIdentifier:]((uint64_t)v8, (uint64_t)v6, v13);
        }
        id v11 = 0;
      }
    }
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

- (void)initWithTopic:()Topic sectionBundleIdentifier:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  int v3 = 138412546;
  uint64_t v4 = a1;
  __int16 v5 = 2112;
  uint64_t v6 = a2;
  _os_log_error_impl(&dword_1A790D000, log, OS_LOG_TYPE_ERROR, "ATXContextActionIdentifier: spotlightActionType is nil: %@, %@", (uint8_t *)&v3, 0x16u);
}

@end