@interface MapsSuggestionsShortcutDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsShortcutDeduper

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = v6;
  if (!v5)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
    __int16 v21 = 1024;
    int v22 = 22;
    __int16 v23 = 2082;
    v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v25 = 2082;
    v26 = "nil == (originalEntry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_16:
    _os_log_impl(&dword_1A70DF000, v16, OS_LOG_TYPE_ERROR, v17, (uint8_t *)&v19, 0x26u);
    goto LABEL_17;
  }
  if (!v6)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
    __int16 v21 = 1024;
    int v22 = 23;
    __int16 v23 = 2082;
    v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v25 = 2082;
    v26 = "nil == (entry)";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
    goto LABEL_16;
  }
  v8 = [v5 uniqueIdentifier];
  uint64_t v9 = [v8 length];

  if (!v9)
  {
    v16 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
      goto LABEL_17;
    }
    int v19 = 136446978;
    v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
    __int16 v21 = 1024;
    int v22 = 24;
    __int16 v23 = 2082;
    v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
    __int16 v25 = 2082;
    v26 = "0u == originalEntry.uniqueIdentifier.length";
    v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
    goto LABEL_16;
  }
  v10 = [v7 uniqueIdentifier];
  uint64_t v11 = [v10 length];

  if (!v11)
  {
    v16 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      int v19 = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsShortcutDeduper.m";
      __int16 v21 = 1024;
      int v22 = 25;
      __int16 v23 = 2082;
      v24 = "-[MapsSuggestionsShortcutDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v25 = 2082;
      v26 = "0u == entry.uniqueIdentifier.length";
      v17 = "At %{public}s:%d, %{public}s forbids: %{public}s. Every suggestion entry requires a .uniqueIdentifier by contract.";
      goto LABEL_16;
    }
LABEL_17:

LABEL_18:
    BOOL v15 = 0;
    goto LABEL_19;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(18, v5, v7)) {
    goto LABEL_18;
  }
  v12 = [v5 uniqueIdentifier];
  v13 = [v7 uniqueIdentifier];
  int v14 = [v12 isEqualToString:v13];

  if (!v14) {
    goto LABEL_18;
  }
  [v5 replaceByEntry:v7 forceDecoratedOverwrites:0];
  BOOL v15 = 1;
LABEL_19:

  return v15;
}

@end