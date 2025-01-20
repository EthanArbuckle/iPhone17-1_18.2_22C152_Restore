@interface MapsSuggestionsCalendarEventImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsCalendarEventImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v7 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      int v32 = 136446978;
      v33 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCalendarEventImprover.m";
      __int16 v34 = 1024;
      int v35 = 27;
      __int16 v36 = 2082;
      v37 = "-[MapsSuggestionsCalendarEventImprover improveEntry:]";
      __int16 v38 = 2082;
      v39 = "nil == (entry)";
      _os_log_impl(&dword_1A70DF000, v7, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a suggestion entry", (uint8_t *)&v32, 0x26u);
    }

    goto LABEL_8;
  }
  if ([v4 type] != 3)
  {
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_42;
  }
  if ([v5 containsKey:@"MapsSuggestionsCalendarAllDayEventKey"]) {
    int v6 = [v5 BOOLeanForKey:@"MapsSuggestionsCalendarAllDayEventKey"];
  }
  else {
    int v6 = 0;
  }
  v9 = [v5 undecoratedSubtitle];
  uint64_t v10 = [v9 length];
  BOOL v8 = v10 == 0;

  if (!v10)
  {
    v11 = [v5 geoMapItem];
    v12 = [v11 name];
    -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v12, v5);

    v13 = [v5 undecoratedSubtitle];
    [v5 setString:v13 forKey:@"MapsSuggestionsEntryTitleNameKey"];
  }
  v14 = [v5 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
  if (v14 && [v5 containsKey:@"MapsSuggestionsScheduledTimeKey"])
  {
    v15 = [v5 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    v16 = NSStringFromMapsSuggestionsEventTime(v15);

    if (v6)
    {
      uint64_t v17 = MapsSuggestionsLocalizedCalendarEventAllDayString();

      v16 = (void *)v17;
    }
    v18 = MapsSuggestionsLocalizedCalendarEventTimeAndLocationString(v16, v14);
    char v19 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v18, v5);
    if (v10) {
      BOOL v8 = v19;
    }
    else {
      BOOL v8 = 1;
    }
  }
  [v5 setBoolean:1 forKey:@"MapsSuggestionsAlreadyLocalizedKey"];
  if (([v5 containsKey:@"MapsSuggestionsAlreadyThereKey"] & 1) == 0)
  {
    if ([v5 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"]) {
      goto LABEL_26;
    }
    uint64_t v20 = 1;
    goto LABEL_25;
  }
  uint64_t v20 = [v5 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"] ^ 1;
  if ([v5 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"] != v20)
  {
LABEL_25:
    [v5 setBoolean:v20 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
    BOOL v8 = 1;
  }
LABEL_26:
  if ([v5 containsKey:@"MapsSuggestionsCalendarIsSharedToMeKey"]
    && [v5 BOOLeanForKey:@"MapsSuggestionsCalendarIsSharedToMeKey"])
  {
    GEOConfigGetDouble();
    objc_msgSend(v5, "setWeight:");
    BOOL v8 = 1;
  }
  v21 = [v5 undecoratedTitle];
  v22 = v21;
  if (v6)
  {
    v23 = MapsSuggestionsLocalizedCalendarEventPOIAdornmentAllDayString(v21);
  }
  else
  {
    v24 = [v5 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    v23 = MapsSuggestionsLocalizedCalendarEventPOIAdornmentString(v22, v24);
  }
  v25 = [v5 stringForKey:@"MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"];
  if (([v25 isEqualToString:v23] & 1) == 0)
  {
    [v5 setString:v23 forKey:@"MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"];
    BOOL v8 = 1;
  }
  char v26 = [v5 BOOLeanForKey:@"MapsSuggestionsCalendarIsInvitationKey" is:1];
  if ([v5 BOOLeanForKey:@"MapsSuggestionsCalendarEventIsRecurringKey" is:1])
  {
    v27 = MapsSuggestionsLocalizedSnoozeInMapsString();
    [v5 setString:v27 forKey:@"MapsSuggestionsRemovalBehaviorStringForSnooze"];
  }
  v28 = MapsSuggestionsLocalizedHideInMapsString();
  [v5 setString:v28 forKey:@"MapsSuggestionsRemovalBehaviorStringForHide"];

  if (v26) {
    MapsSuggestionsLocalizedDeclineCalendarEventString();
  }
  else {
  v29 = MapsSuggestionsLocalizedDeleteFromCalendarString();
  }
  [v5 setString:v29 forKey:@"MapsSuggestionsRemovalBehaviorStringForDelete"];

  if (GEOConfigGetBOOL())
  {
    v30 = MapsSuggestionsLocalizedSiriFoundInCalendarString();
    [v5 setString:v30 forKey:@"MapsSuggestionsSiriFoundLineKey"];
  }
LABEL_42:

  return v8;
}

@end