@interface MapsSuggestionsAppConnectionFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsAppConnectionFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAppConnectionFilter.m";
      __int16 v14 = 1024;
      int v15 = 21;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsAppConnectionFilter shouldKeepEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      v8 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry";
      v9 = v7;
      uint32_t v10 = 38;
LABEL_13:
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v12, v10);
    }
LABEL_14:

    BOOL v6 = 0;
    goto LABEL_17;
  }
  if ([v3 type] != 12)
  {
    BOOL v6 = 1;
    goto LABEL_17;
  }
  if (([v4 containsKey:@"MapsSuggestionsOriginBundleIDKey"] & 1) == 0)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v12) = 0;
      v8 = "Filtered an AppConnection suggestion entry that did not have an origin bundle ID";
      v9 = v7;
      uint32_t v10 = 2;
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v5 = [v4 stringForKey:@"MapsSuggestionsOriginBundleIDKey"];
  BOOL v6 = [v5 caseInsensitiveCompare:@"com.apple.mobilecal"]
    && [v5 caseInsensitiveCompare:@"com.apple.Maps"]
    && [v5 caseInsensitiveCompare:@"com.apple.springboard"]
    && [v5 caseInsensitiveCompare:@"com.apple.datadetectors.DDActionsService"] != 0;

LABEL_17:
  return v6;
}

@end