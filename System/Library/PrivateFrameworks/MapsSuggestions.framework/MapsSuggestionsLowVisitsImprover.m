@interface MapsSuggestionsLowVisitsImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsLowVisitsImprover

- (BOOL)improveEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v11 = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsLowVisitsImprover.m";
      __int16 v13 = 1024;
      int v14 = 60;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsLowVisitsImprover improveEntry:]";
      __int16 v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v11, 0x26u);
    }

    goto LABEL_13;
  }
  [v3 weight];
  if (v5 > 0.00001)
  {
LABEL_13:
    BOOL v7 = 0;
    goto LABEL_14;
  }
  unint64_t v6 = [v4 type];
  BOOL v7 = 0;
  if (v6 <= 4 && ((1 << v6) & 0x16) != 0)
  {
    if ([v4 containsKey:@"MapsSuggestionsCoreRoutineVisitsCountKey"])
    {
      uint64_t v8 = [v4 integerForKey:@"MapsSuggestionsCoreRoutineVisitsCountKey"];
      if (_MergedGlobals_48 != -1) {
        dispatch_once(&_MergedGlobals_48, &__block_literal_global_35);
      }
      if (v8 <= qword_1EB6F03B8)
      {
        [v4 setInteger:-1 forKey:@"MapsSuggestionsSinkRankKey"];
        [v4 setBoolean:0 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
        BOOL v7 = 1;
        goto LABEL_14;
      }
    }
    goto LABEL_13;
  }
LABEL_14:

  return v7;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end