@interface MapsSuggestionsUnknownFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsUnknownFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      v12 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsUnknownFilter.m";
      __int16 v13 = 1024;
      int v14 = 21;
      __int16 v15 = 2082;
      v16 = "-[MapsSuggestionsUnknownFilter shouldKeepEntry:]";
      __int16 v17 = 2082;
      v18 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
    goto LABEL_9;
  }
  if (![v3 type])
  {
    id v7 = [NSString alloc];
    v8 = [v4 description];
    v6 = [v7 initWithFormat:@"Trapped an Unknown SuggestionsEntry: %@", v8];

    v9 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v12 = (const char *)v6;
      _os_log_impl(&dword_1A70DF000, v9, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
    }

LABEL_9:
    BOOL v5 = 0;
    goto LABEL_10;
  }
  BOOL v5 = 1;
LABEL_10:

  return v5;
}

@end