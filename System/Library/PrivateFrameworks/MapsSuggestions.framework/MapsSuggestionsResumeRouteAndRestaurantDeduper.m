@interface MapsSuggestionsResumeRouteAndRestaurantDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsResumeRouteAndRestaurantDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteAndRestaurantDeduper.m";
      __int16 v17 = 1024;
      int v18 = 24;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsResumeRouteAndRestaurantDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v21 = 2082;
      v22 = "nil == (originalEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, (uint8_t *)&v15, 0x26u);
    }
LABEL_17:

    goto LABEL_18;
  }
  if (!v6)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteAndRestaurantDeduper.m";
      __int16 v17 = 1024;
      int v18 = 25;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsResumeRouteAndRestaurantDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v21 = 2082;
      v22 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (!MapsSuggestionsEntriesShouldBeOfOneOfEachType(11, 8, v5, v6)) {
    goto LABEL_18;
  }
  v8 = [v5 geoMapItem];
  if (!v8) {
    goto LABEL_19;
  }
  v9 = [v7 geoMapItem];

  if (!v9) {
    goto LABEL_18;
  }
  v8 = [v5 geoMapItem];
  v10 = [v7 geoMapItem];
  int v11 = MapsSuggestionsMapItemsAreEqual(v8, v10, 0, 0, 0);

  LOBYTE(v8) = 0;
  if (!v11) {
    goto LABEL_19;
  }
  if (([v5 hasMultipleWaypointsLeft] & 1) != 0
    || ([v7 hasMultipleWaypointsLeft] & 1) != 0)
  {
LABEL_18:
    LOBYTE(v8) = 0;
    goto LABEL_19;
  }
  if ([v5 type] != 8) {
    [v5 replaceByEntry:v7];
  }
  LOBYTE(v8) = 1;
LABEL_19:

  return (char)v8;
}

@end