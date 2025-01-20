@interface MapsSuggestionsSinkRankImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsSinkRankImprover

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
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v10 = 136446978;
      v11 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsSinkRankImprover.m";
      __int16 v12 = 1024;
      int v13 = 32;
      __int16 v14 = 2082;
      v15 = "-[MapsSuggestionsSinkRankImprover improveEntry:]";
      __int16 v16 = 2082;
      v17 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v10, 0x26u);
    }

    goto LABEL_7;
  }
  if ([v3 containsKey:@"MapsSuggestionsSinkRankKey"])
  {
LABEL_7:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = 0;
  switch([v4 type])
  {
    case 0:
      break;
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 10:
    case 11:
    case 12:
    case 13:
    case 14:
    case 15:
    case 16:
    case 17:
    case 18:
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      goto LABEL_10;
    case 9:
      uint64_t Integer = GEOConfigGetInteger();
      if (([v4 BOOLeanForKey:@"MapsSuggestionsRidesharingIsActiveRideKey"] & 1) == 0) {
LABEL_10:
      }
        uint64_t Integer = GEOConfigGetInteger();
      goto LABEL_11;
    default:
      uint64_t Integer = 0;
LABEL_11:
      v8 = [NSNumber numberWithInteger:Integer];
      [v4 setNumber:v8 forKey:@"MapsSuggestionsSinkRankKey"];

      BOOL v5 = 1;
      break;
  }
LABEL_12:

  return v5;
}

@end