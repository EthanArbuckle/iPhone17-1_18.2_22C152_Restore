@interface MapsSuggestionsTooEarlyFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsTooEarlyFilter

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
    BOOL v5 = 1;
    switch([v3 type])
    {
      case 0:
      case 1:
      case 5:
      case 6:
      case 7:
      case 10:
      case 11:
      case 12:
      case 17:
      case 18:
      case 19:
      case 20:
      case 21:
      case 22:
        break;
      case 2:
      case 3:
      case 4:
      case 8:
      case 9:
      case 13:
      case 14:
      case 15:
      case 16:
      case 23:
      case 24:
        GEOConfigGetDouble();
        double v9 = v8;
        id v10 = v4;
        if ([v10 containsKey:@"MapsSuggestionsScheduledTimeKey"])
        {
          v11 = [v10 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
          v12 = MapsSuggestionsNow();
          [v11 timeIntervalSinceDate:v12];
          BOOL v5 = v13 < v9;
        }
        break;
      default:
        v7 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        {
          int v15 = 136446978;
          v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooEarlyFilter.m";
          __int16 v17 = 1024;
          int v18 = 99;
          __int16 v19 = 2082;
          v20 = "-[MapsSuggestionsTooEarlyFilter shouldKeepEntry:]";
          __int16 v21 = 2082;
          v22 = "YES";
          _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsEntryType!", (uint8_t *)&v15, 0x26u);
        }

        BOOL v5 = 1;
        break;
    }
  }
  else
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v15 = 136446978;
      v16 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooEarlyFilter.m";
      __int16 v17 = 1024;
      int v18 = 41;
      __int16 v19 = 2082;
      v20 = "-[MapsSuggestionsTooEarlyFilter shouldKeepEntry:]";
      __int16 v21 = 2082;
      v22 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v15, 0x26u);
    }

    BOOL v5 = 0;
  }

  return v5;
}

@end