@interface MapsSuggestionsTooFarFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsTooFarFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if (MapsSuggestionsIsShortcutEntry(v3))
    {
LABEL_3:
      BOOL v5 = 1;
      goto LABEL_13;
    }
    unint64_t v7 = [v4 type];
    if (v7 > 0x18)
    {
      double v9 = 0.0;
    }
    else
    {
      if (v7 == 11) {
        goto LABEL_3;
      }
      GEOConfigGetDouble();
      double v9 = v8;
    }
    *(void *)v12 = 0;
    BOOL v10 = !MapsSuggestionsDistanceFromHereToEntry(v4, v12);
    BOOL v5 = *(double *)v12 <= v9 || v10;
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v12 = 136446978;
      *(void *)&v12[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooFarFilter.m";
      __int16 v13 = 1024;
      int v14 = 25;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsTooFarFilter shouldKeepEntry:]";
      __int16 v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Required suggestion entry", v12, 0x26u);
    }

    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

@end