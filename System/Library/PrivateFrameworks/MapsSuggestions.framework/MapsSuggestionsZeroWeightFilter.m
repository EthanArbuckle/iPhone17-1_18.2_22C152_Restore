@interface MapsSuggestionsZeroWeightFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsZeroWeightFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    [a3 weight];
    return v3 > 0.0;
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v6 = 136446978;
      v7 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsZeroWeightFilter.m";
      __int16 v8 = 1024;
      int v9 = 21;
      __int16 v10 = 2082;
      v11 = "-[MapsSuggestionsZeroWeightFilter shouldKeepEntry:]";
      __int16 v12 = 2082;
      v13 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v6, 0x26u);
    }

    return 0;
  }
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end