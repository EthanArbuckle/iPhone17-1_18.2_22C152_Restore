@interface MapsSuggestionsResumeRouteDeduper
+ (BOOL)isEnabled;
- (BOOL)dedupeByEnrichingEntry:(id)a3 withEntry:(id)a4;
@end

@implementation MapsSuggestionsResumeRouteDeduper

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
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteDeduper.m";
      __int16 v19 = 1024;
      int v20 = 22;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsResumeRouteDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v23 = 2082;
      v24 = "nil == (originalEntry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an original suggestion entry";
LABEL_12:
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v10, buf, 0x26u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (!v6)
  {
    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v18 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsResumeRouteDeduper.m";
      __int16 v19 = 1024;
      int v20 = 23;
      __int16 v21 = 2082;
      v22 = "-[MapsSuggestionsResumeRouteDeduper dedupeByEnrichingEntry:withEntry:]";
      __int16 v23 = 2082;
      v24 = "nil == (entry)";
      v10 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a new suggestion entry";
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  if (!MapsSuggestionsEntriesAreBothOfType(11, v6, v5))
  {
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
  if ([v7 expiresBeforeEntry:v5])
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_DEBUG, "originalEntry expires after entry", buf, 2u);
    }

    goto LABEL_19;
  }
  v13 = [v7 uniqueIdentifier];
  v14 = [v5 uniqueIdentifier];
  int v15 = [v13 isEqualToString:v14];

  if (!v15)
  {
    [v5 replaceByEntry:v7];
LABEL_19:
    BOOL v11 = 1;
    goto LABEL_15;
  }
  LOWORD(v16) = 0;
  BOOL v11 = 1;
  objc_msgSend(v5, "mergeFromSuggestionEntry:behavior:protectTitles:protectTitleDecorations:protectMapItem:protectWeight:protectExpiration:protectIcon:", v7, 1, 0, 1, 0, 0, v16);
  [v7 weight];
  objc_msgSend(v5, "setWeight:");
LABEL_15:

  return v11;
}

@end