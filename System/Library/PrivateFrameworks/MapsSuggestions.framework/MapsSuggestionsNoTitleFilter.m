@interface MapsSuggestionsNoTitleFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsNoTitleFilter

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
    v10 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoTitleFilter.m";
      __int16 v14 = 1024;
      int v15 = 21;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsNoTitleFilter shouldKeepEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v10, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v12, 0x26u);
    }

    goto LABEL_8;
  }
  uint64_t v5 = [v3 title];
  if (!v5
    || (v6 = (void *)v5,
        [v4 title],
        v7 = objc_claimAutoreleasedReturnValue(),
        uint64_t v8 = [v7 length],
        v7,
        v6,
        !v8))
  {
LABEL_8:
    BOOL v9 = 0;
    goto LABEL_9;
  }
  BOOL v9 = 1;
LABEL_9:

  return v9;
}

@end