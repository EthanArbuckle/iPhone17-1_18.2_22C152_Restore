@interface MapsSuggestionsAlreadyThereFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsAlreadyThereFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 type];
    if (v5 > 0x18)
    {
      v7 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        int v9 = 136446978;
        v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAlreadyThereFilter.m";
        __int16 v11 = 1024;
        int v12 = 59;
        __int16 v13 = 2082;
        v14 = "-[MapsSuggestionsAlreadyThereFilter shouldKeepEntry:]";
        __int16 v15 = 2082;
        v16 = "YES";
        _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v9, 0x26u);
      }

      goto LABEL_14;
    }
    if ((1 << v5) & 0x1827FF9) == 0 && (((1 << v5) & 0x4C0006) == 0 || ([v4 isShortcut]))
    {
LABEL_14:
      LOBYTE(v6) = 1;
      goto LABEL_15;
    }
    LODWORD(v6) = [v4 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey" is:1] ^ 1;
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsAlreadyThereFilter.m";
      __int16 v11 = 1024;
      int v12 = 21;
      __int16 v13 = 2082;
      v14 = "-[MapsSuggestionsAlreadyThereFilter shouldKeepEntry:]";
      __int16 v15 = 2082;
      v16 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v9, 0x26u);
    }

    LOBYTE(v6) = 0;
  }
LABEL_15:

  return (char)v6;
}

@end