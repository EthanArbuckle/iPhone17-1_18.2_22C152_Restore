@interface MapsSuggestionsTooFewVisitsFilter
+ (BOOL)isEnabled;
- (BOOL)shouldKeepEntry:(id)a3;
@end

@implementation MapsSuggestionsTooFewVisitsFilter

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)shouldKeepEntry:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    if (GEOConfigGetBOOL() && ([v3 isShortcut] & 1) == 0)
    {
      BOOL v4 = 1;
      switch([v3 type])
      {
        case 0:
        case 3:
        case 5:
        case 6:
        case 7:
        case 8:
        case 9:
        case 10:
        case 11:
        case 12:
        case 13:
        case 14:
        case 15:
        case 16:
        case 17:
        case 18:
        case 20:
        case 21:
        case 22:
        case 23:
        case 24:
          goto LABEL_9;
        case 1:
        case 2:
        case 4:
        case 19:
          uint64_t Integer = GEOConfigGetInteger();
          goto LABEL_12;
        default:
          uint64_t Integer = 0;
LABEL_12:
          v8 = [v3 originatingSourceName];
          int v9 = [v8 hasSuffix:@"MapsSuggestionsRoutineSource"];

          if (!v9) {
            break;
          }
          if ([v3 containsKey:@"MapsSuggestionsCoreRoutineVisitsCountKey"])
          {
            v10 = [v3 numberForKey:@"MapsSuggestionsCoreRoutineVisitsCountKey"];
            BOOL v4 = [v10 integerValue] >= Integer;

            goto LABEL_9;
          }
          v11 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            int v12 = 138412290;
            v13 = (const char *)v3;
            _os_log_impl(&dword_1A70DF000, v11, OS_LOG_TYPE_DEBUG, "Weird that we didn't have a MapsSuggestionsCoreRoutineVisitsCountKey: %@", (uint8_t *)&v12, 0xCu);
          }

          break;
      }
    }
    BOOL v4 = 1;
  }
  else
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v12 = 136446978;
      v13 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTooFewVisitsFilter.m";
      __int16 v14 = 1024;
      int v15 = 24;
      __int16 v16 = 2082;
      v17 = "-[MapsSuggestionsTooFewVisitsFilter shouldKeepEntry:]";
      __int16 v18 = 2082;
      v19 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v5, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires an entry", (uint8_t *)&v12, 0x26u);
    }

    BOOL v4 = 0;
  }
LABEL_9:

  return v4;
}

@end