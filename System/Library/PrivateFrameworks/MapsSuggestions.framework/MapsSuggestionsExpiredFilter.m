@interface MapsSuggestionsExpiredFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsExpiredFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = [v3 expires];

    if (v5)
    {
      v6 = [v4 expires];
      BOOL v7 = MapsSuggestionsIsInThePast(v6);

      char v8 = !v7;
    }
    else
    {
      v10 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412290;
        v13 = (const char *)v4;
        _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_DEBUG, "This entry did not have an expiration: %@", (uint8_t *)&v12, 0xCu);
      }

      char v8 = 1;
    }
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsExpiredFilter.m";
      __int16 v14 = 1024;
      int v15 = 21;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsExpiredFilter shouldKeepEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", (uint8_t *)&v12, 0x26u);
    }

    char v8 = 0;
  }

  return v8;
}

@end