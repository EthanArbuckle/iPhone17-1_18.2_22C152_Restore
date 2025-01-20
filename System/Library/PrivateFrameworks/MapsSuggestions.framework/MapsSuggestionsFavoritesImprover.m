@interface MapsSuggestionsFavoritesImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsFavoritesImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsFavoritesImprover.m";
      __int16 v12 = 1024;
      int v13 = 23;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsFavoritesImprover improveEntry:]";
      __int16 v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", (uint8_t *)&v10, 0x26u);
    }

    goto LABEL_9;
  }
  if ([v3 type] != 6)
  {
LABEL_9:
    LOBYTE(v5) = 0;
    goto LABEL_10;
  }
  v5 = [v4 geoMapItem];

  if (v5)
  {
    v6 = [v4 undecoratedSubtitle];

    if (!v6)
    {
      v5 = [v4 geoMapItem];
      v7 = [v5 shortAddress];
      [v4 setUndecoratedSubtitle:v7];

      LOBYTE(v5) = 1;
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_10:

  return (char)v5;
}

@end