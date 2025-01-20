@interface MapsSuggestionsAppConnectionAndRecentsDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsAppConnectionAndRecentsDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionAndRecentsDeduper.m";
      __int16 v14 = 1024;
      int v15 = 21;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsAppConnectionAndRecentsDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (originalEntry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires original suggestion entry";
LABEL_12:
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x26u);
    }
LABEL_13:

LABEL_14:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionAndRecentsDeduper.m";
      __int16 v14 = 1024;
      int v15 = 22;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsAppConnectionAndRecentsDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires new suggestion entry";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!MapsSuggestionsEntriesShouldBeOfOneOfEachType(12, 5, v5, v6)
    || ([v7 BOOLeanForKey:@"MapsSuggestionsIsSuppressedKey" is:1] & 1) != 0)
  {
    goto LABEL_14;
  }
  if (([v7 expiresBeforeEntry:v5] & 1) == 0) {
    [v5 replaceByEntry:v7];
  }
  BOOL v8 = 1;
LABEL_15:

  return v8;
}

@end