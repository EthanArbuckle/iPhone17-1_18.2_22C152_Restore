@interface MapsSuggestionsFlightTooFarFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsFlightTooFarFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 type] == 15)
    {
      GEOConfigGetDouble();
      double v6 = v5;
      *(void *)v11 = 0;
      BOOL v7 = !MapsSuggestionsDistanceFromHereToEntry(v4, v11);
      BOOL v8 = *(double *)v11 <= v6 || v7;
    }
    else
    {
      BOOL v8 = 1;
    }
  }
  else
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v11 = 136446978;
      *(void *)&v11[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFlightTooFarFilter.mm";
      __int16 v12 = 1024;
      int v13 = 22;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsFlightTooFarFilter shouldKeepEntry:]";
      __int16 v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", v11, 0x26u);
    }

    BOOL v8 = 0;
  }

  return v8;
}

@end