@interface MapsSuggestionsNearbyFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsNearbyFilter

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    v4 = MapsSuggestionsCurrentBestLocation();
    if (v4)
    {
      v5 = MapsSuggestionsLocationForEntry(v3);
      if (v5)
      {
        [v4 distanceFromLocation:v5];
        double v7 = v6;
        [v3 type];
        GEOConfigGetDouble();
        double v9 = v8;
        [v4 horizontalAccuracy];
        BOOL v11 = v7 >= v9 + v10;
      }
      else
      {
        BOOL v11 = 1;
      }
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v14 = 136446978;
      v15 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNearbyFilter.m";
      __int16 v16 = 1024;
      int v17 = 27;
      __int16 v18 = 2082;
      v19 = "-[MapsSuggestionsNearbyFilter shouldKeepEntry:]";
      __int16 v20 = 2082;
      v21 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v14, 0x26u);
    }

    BOOL v11 = 0;
  }

  return v11;
}

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

@end