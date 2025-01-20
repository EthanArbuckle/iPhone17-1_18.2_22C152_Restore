@interface MapsSuggestionsParkedCarDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsParkedCarDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarDeduper.m";
      __int16 v19 = 1024;
      int v20 = 23;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsParkedCarDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v23 = 2082;
      v24 = "nil == (originalEntry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_13:
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, v13, buf, 0x26u);
    }
LABEL_14:

    goto LABEL_15;
  }
  if (!v6)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsParkedCarDeduper.m";
      __int16 v19 = 1024;
      int v20 = 24;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsParkedCarDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v23 = 2082;
      v24 = "nil == (entry)";
      v13 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(7, v6, v5))
  {
LABEL_15:
    BOOL v14 = 0;
    goto LABEL_16;
  }
  int v8 = [v5 BOOLeanForKey:@"MapsSuggestionsRoutineIsBackedByVehicleEventKey"];
  int v9 = [v7 BOOLeanForKey:@"MapsSuggestionsRoutineIsBackedByVehicleEventKey"];
  if (v8 && v9)
  {
    v10 = [v5 dateForKey:@"MapsSuggestionsWhenItHappenedKey"];
    v11 = [v7 dateForKey:@"MapsSuggestionsWhenItHappenedKey"];
    if ((unint64_t)([v10 compare:v11] + 1) <= 1)
    {
      LOWORD(v16) = 257;
      objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v7, 1, 0, 1, 0, 0, v16);
    }
  }
  else if ((v8 & 1) == 0)
  {
    if (v9)
    {
      LOWORD(v16) = 257;
      objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v7, 1, 0, 1, 0, 0, v16);
    }
    [v5 replaceByEntry:v7];
  }
  BOOL v14 = 1;
LABEL_16:

  return v14;
}

@end