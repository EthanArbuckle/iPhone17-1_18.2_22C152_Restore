@interface MapsSuggestionsCalendarEventDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsCalendarEventDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarEventDeduper.m";
      __int16 v26 = 1024;
      int v27 = 22;
      __int16 v28 = 2082;
      v29 = "-[MapsSuggestionsCalendarEventDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v30 = 2082;
      v31 = "nil == (originalEntry)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_19:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v24, 0x26u);
    }
LABEL_21:

LABEL_22:
    BOOL v18 = 0;
    goto LABEL_23;
  }
  if (!v6)
  {
    v13 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      int v24 = 136446978;
      v25 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarEventDeduper.m";
      __int16 v26 = 1024;
      int v27 = 23;
      __int16 v28 = 2082;
      v29 = "-[MapsSuggestionsCalendarEventDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v30 = 2082;
      v31 = "nil == (entry)";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_19;
    }
    goto LABEL_21;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(3, v6, v5)
    && (MapsSuggestionsEntriesShouldBeOfOneOfEachType(13, 3, v5, v7) & 1) == 0
    && (MapsSuggestionsEntriesShouldBeOfOneOfEachType(14, 3, v5, v7) & 1) == 0
    && (MapsSuggestionsEntriesShouldBeOfOneOfEachType(15, 3, v5, v7) & 1) == 0
    && !MapsSuggestionsEntriesShouldBeOfOneOfEachType(16, 3, v5, v7))
  {
    goto LABEL_22;
  }
  uint64_t v8 = [v7 uniqueIdentifier];
  if (!v8) {
    goto LABEL_10;
  }
  v9 = (void *)v8;
  v10 = [v7 uniqueIdentifier];
  v11 = [v5 uniqueIdentifier];
  char v12 = [v10 isEqualToString:v11];

  if ((v12 & 1) == 0)
  {
LABEL_10:
    v13 = [v7 stringForKey:@"MapsSuggestionsEventIDKey"];
    v14 = [v5 stringForKey:@"MapsSuggestionsEventIDKey"];
    if (v13 && [v13 isEqualToString:v14])
    {

      goto LABEL_13;
    }

    goto LABEL_21;
  }
LABEL_13:
  if ([v7 type] == 3)
  {
    uint64_t v15 = [v7 type];
    BOOL v16 = v15 == [v5 type];
  }
  else
  {
    BOOL v16 = 1;
  }
  v20 = [v7 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
  v21 = [v5 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
  [v5 mergeFromSuggestionEntry:v7 behavior:v16];
  if (v20 && ([v20 isEqualToDate:v21] & 1) == 0)
  {
    v22 = [v7 undecoratedSubtitle];
    [v5 setUndecoratedSubtitle:v22];

    v23 = [v7 subtitle];
    [v5 setSubtitle:v23];
  }
  BOOL v18 = 1;
LABEL_23:

  return v18;
}

@end