@interface MapsSuggestionsDeletedFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsDeletedFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ([v3 containsKey:@"MapsSuggestionsIsSuppressedKey"]) {
      LODWORD(v5) = [v4 BOOLeanForKey:@"MapsSuggestionsIsSuppressedKey" is:1] ^ 1;
    }
    else {
      LOBYTE(v5) = 1;
    }
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v7 = 136446978;
      v8 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDeletedFilter.m";
      __int16 v9 = 1024;
      int v10 = 21;
      __int16 v11 = 2082;
      v12 = "-[MapsSuggestionsDeletedFilter shouldKeepEntry:]";
      __int16 v13 = 2082;
      v14 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v7, 0x26u);
    }

    LOBYTE(v5) = 0;
  }

  return (char)v5;
}

@end