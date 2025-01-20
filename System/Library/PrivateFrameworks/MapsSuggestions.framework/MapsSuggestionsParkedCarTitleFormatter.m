@interface MapsSuggestionsParkedCarTitleFormatter
- (BOOL)formatTitlesForEntry:(id)a3 distance:(double)a4 trafficString:(id)a5;
@end

@implementation MapsSuggestionsParkedCarTitleFormatter

- (BOOL)formatTitlesForEntry:(id)a3 distance:(double)a4 trafficString:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      double v19 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarTitleFormatter.m");
      __int16 v20 = 1024;
      int v21 = 24;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsParkedCarTitleFormatter formatTitlesForEntry:distance:trafficString:]";
      __int16 v24 = 2082;
      v25 = "nil == (entry)";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry";
LABEL_10:
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v16, (uint8_t *)&v18, 0x26u);
    }
LABEL_11:
    char v15 = 0;
    goto LABEL_12;
  }
  uint64_t v10 = [v8 type];
  v11 = GEOFindOrCreateLog();
  v12 = v11;
  if (v10 != 7)
  {
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      int v18 = 136446978;
      double v19 = COERCE_DOUBLE("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarTitleFormatter.m");
      __int16 v20 = 1024;
      int v21 = 25;
      __int16 v22 = 2082;
      v23 = "-[MapsSuggestionsParkedCarTitleFormatter formatTitlesForEntry:distance:trafficString:]";
      __int16 v24 = 2082;
      v25 = "MapsSuggestionsEntryTypeParkedCar != entry.type";
      v16 = "At %{public}s:%d, %{public}s forbids: %{public}s. Needs to be a ParkedCar entry";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    int v18 = 134217984;
    double v19 = a4;
    _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "Parked Car CLLocationDistance: %g", (uint8_t *)&v18, 0xCu);
  }

  v12 = MapsSuggestionsDistanceString();
  v13 = [v8 stringForKey:@"MapsSuggestionsParkedCarNearLocationStringKey"];
  v14 = MapsSuggestionsLocalizedParkedCarAtLocationString(v12, v13);
  char v15 = -[MapsSuggestionsBaseTitleFormatter updateMyChangedTitlesForEntry:title:subtitle:includeLockedVersions:]((uint64_t)self, v8, 0, v14, 0);

LABEL_12:
  return v15;
}

@end