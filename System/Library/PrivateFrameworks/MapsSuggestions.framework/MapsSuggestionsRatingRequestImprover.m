@interface MapsSuggestionsRatingRequestImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsRatingRequestImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRatingRequestImprover.m";
      __int16 v16 = 1024;
      int v17 = 47;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsRatingRequestImprover improveEntry:]";
      __int16 v20 = 2082;
      v21 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an Entry", (uint8_t *)&v14, 0x26u);
    }

    goto LABEL_9;
  }
  if ([v4 type] != 21)
  {
LABEL_9:
    char v11 = 0;
    goto LABEL_14;
  }
  id v6 = v5;
  if ([v6 containsKey:@"MapsSuggestionsCoreRoutineLastVisit"])
  {
    v7 = [v6 dateForKey:@"MapsSuggestionsCoreRoutineLastVisit"];
    double v8 = MapsSuggestionsSecondsSince(v7);
    v9.n128_f64[0] = v8 + 86400.0 - MapsSuggestionsTimeSinceMidnight();
    if (v9.n128_f64[0] >= 86400.0) {
      MapsSuggestionsLocalizedVisitedTimeAgo(v9);
    }
    else {
    v12 = MapsSuggestionsLocalizedVisitedToday();
    }
  }
  else
  {
    v12 = MapsSuggestionsLocalizedSubtitleForRatingRequest();
  }

  char v11 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v12, v6);
LABEL_14:

  return v11;
}

@end