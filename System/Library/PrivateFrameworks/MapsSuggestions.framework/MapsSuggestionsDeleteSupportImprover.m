@interface MapsSuggestionsDeleteSupportImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsDeleteSupportImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v6 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      int v9 = 136446978;
      v10 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsDeleteSupportImprover.m";
      __int16 v11 = 1024;
      int v12 = 24;
      __int16 v13 = 2082;
      v14 = "-[MapsSuggestionsDeleteSupportImprover improveEntry:]";
      __int16 v15 = 2082;
      v16 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v6, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry", (uint8_t *)&v9, 0x26u);
    }

    goto LABEL_7;
  }
  if ([v3 availableRemovalBehaviors])
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
    case 4:
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
    case 19:
    case 20:
    case 21:
    case 22:
    case 23:
    case 24:
      goto LABEL_10;
    case 3:
      uint64_t Integer = GEOConfigGetInteger();
      if ([v4 BOOLeanForKey:@"MapsSuggestionsCalendarEventIsRecurringKey" is:1]) {
LABEL_10:
      }
        uint64_t Integer = GEOConfigGetInteger();
      goto LABEL_11;
    default:
      uint64_t Integer = 0;
LABEL_11:
      [v4 setAvailableRemovalBehavior:Integer];
      BOOL v5 = 1;
      break;
  }
LABEL_12:

  return v5;
}

@end