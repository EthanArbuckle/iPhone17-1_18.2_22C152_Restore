@interface MapsSuggestionsNoAddressFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsNoAddressFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    unint64_t v5 = [v3 type];
    if (v5 - 5 < 0x13 || v5 < 4)
    {
LABEL_6:
      BOOL v7 = 1;
      goto LABEL_10;
    }
    if (v5 == 4)
    {
      v10 = [v4 geoMapItem];
      v11 = MapsSuggestionsMapItemStreetName(v10);
      BOOL v7 = [v11 length] != 0;
    }
    else
    {
      if (v5 != 24)
      {
        v12 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136446978;
          v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoAddressFilter.m";
          __int16 v17 = 1024;
          int v18 = 57;
          __int16 v19 = 2082;
          v20 = "-[MapsSuggestionsNoAddressFilter shouldKeepEntry:]";
          __int16 v21 = 2082;
          v22 = "YES";
          _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v15, 0x26u);
        }

        goto LABEL_6;
      }
      v10 = [v4 geoMapItem];
      v11 = MapsSuggestionsMapItemStreetWithNumber(v10);
      if ([v11 length])
      {
        BOOL v7 = 1;
      }
      else
      {
        v13 = [v4 geoMapItem];
        v14 = MapsSuggestionsMapItemAreaOfInterest(v13);
        BOOL v7 = [v14 length] != 0;
      }
    }

    goto LABEL_10;
  }
  v8 = GEOFindOrCreateLog();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    int v15 = 136446978;
    v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsNoAddressFilter.m";
    __int16 v17 = 1024;
    int v18 = 21;
    __int16 v19 = 2082;
    v20 = "-[MapsSuggestionsNoAddressFilter shouldKeepEntry:]";
    __int16 v21 = 2082;
    v22 = "nil == (entry)";
    _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestions entry", (uint8_t *)&v15, 0x26u);
  }

  BOOL v7 = 0;
LABEL_10:

  return v7;
}

@end