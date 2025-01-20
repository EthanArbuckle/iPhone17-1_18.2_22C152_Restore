@interface MapsSuggestionsTravelFlightImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsTravelFlightImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v12 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      int v20 = 136446978;
      v21 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsTravelFlightImprover.m";
      __int16 v22 = 1024;
      int v23 = 23;
      __int16 v24 = 2082;
      v25 = "-[MapsSuggestionsTravelFlightImprover improveEntry:]";
      __int16 v26 = 2082;
      v27 = "entry == nil";
      _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", (uint8_t *)&v20, 0x26u);
    }

    goto LABEL_9;
  }
  if ([v4 type] != 15)
  {
LABEL_9:
    char v13 = 0;
    goto LABEL_28;
  }
  v6 = [v5 stringForKey:@"MapsSuggestionsFullFlightNumberKey"];
  v7 = [v5 stringForKey:@"MapsSuggestionsFlightDepartureAirportCodeKey"];
  id v8 = v6;
  id v9 = v7;
  v10 = v9;
  if (v8 && v9)
  {
    uint64_t v11 = MapsSuggestionsLocalizedWalletFlightAndAirportNumberString(v9, v8);
LABEL_14:
    v14 = (void *)v11;
    goto LABEL_15;
  }
  if (v9)
  {
    uint64_t v11 = MapsSuggestionsLocalizedWalletFlightAirportString(v9);
    goto LABEL_14;
  }
  if (v8)
  {
    uint64_t v11 = MapsSuggestionsLocalizedWalletFlightNumberString(v8);
    goto LABEL_14;
  }
  v14 = 0;
LABEL_15:

  char v15 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v14, v5);
  v16 = MapsSuggestionsFlightStatusStringForEntry(v5);
  char v17 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v16, v5);
  if ([v5 BOOLeanForKey:@"MapsSuggestionsAlreadyLocalizedKey"])
  {
    char v13 = v15 | v17;
  }
  else
  {
    char v13 = 1;
    [v5 setBoolean:1 forKey:@"MapsSuggestionsAlreadyLocalizedKey"];
  }
  if (([v5 containsKey:@"MapsSuggestionsAlreadyThereKey"] & 1) == 0)
  {
    if ([v5 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"]) {
      goto LABEL_24;
    }
    uint64_t v18 = 1;
    goto LABEL_23;
  }
  uint64_t v18 = [v5 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"] ^ 1;
  if ([v5 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"] != v18)
  {
LABEL_23:
    [v5 setBoolean:v18 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
    char v13 = 1;
  }
LABEL_24:
  if ([v5 containsKey:@"MapsSuggestionsCalendarIsSharedToMeKey"]
    && [v5 BOOLeanForKey:@"MapsSuggestionsCalendarIsSharedToMeKey"])
  {
    GEOConfigGetDouble();
    objc_msgSend(v5, "setWeight:");
    char v13 = 1;
  }

LABEL_28:
  return v13;
}

@end