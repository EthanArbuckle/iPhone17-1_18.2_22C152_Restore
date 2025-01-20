@interface MapsSuggestionsAppConnectionDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsAppConnectionDeduper

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
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionDeduper.m";
      __int16 v14 = 1024;
      int v15 = 20;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsAppConnectionDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (originalEntry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires original suggestion entry";
LABEL_9:
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, (uint8_t *)&v12, 0x26u);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionDeduper.m";
      __int16 v14 = 1024;
      int v15 = 21;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsAppConnectionDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires new suggestion entry";
      goto LABEL_9;
    }
    goto LABEL_10;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(12, v6, v5))
  {
LABEL_11:
    BOOL v8 = 0;
    goto LABEL_12;
  }
  [v5 replaceByEntry:v7];
  BOOL v8 = 1;
LABEL_12:

  return v8;
}

@end