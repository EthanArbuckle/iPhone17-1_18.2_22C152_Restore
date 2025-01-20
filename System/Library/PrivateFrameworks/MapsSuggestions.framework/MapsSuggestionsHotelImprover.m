@interface MapsSuggestionsHotelImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsHotelImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v31 = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelImprover.m";
    __int16 v33 = 1024;
    int v34 = 21;
    __int16 v35 = 2082;
    v36 = "-[MapsSuggestionsHotelImprover improveEntry:]";
    __int16 v37 = 2082;
    v38 = "entry == nil";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry";
    goto LABEL_19;
  }
  if ([v3 type] == 13)
  {
    char v5 = [v4 containsKey:@"MapsSuggestionsScheduledTimeKey"];
    char v6 = [v4 containsKey:@"MapsSuggestionsScheduledEndTimeKey"];
    if (v5)
    {
      if (v6)
      {
        v7 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
        v8 = [v4 dateForKey:@"MapsSuggestionsScheduledEndTimeKey"];
        id v9 = objc_alloc(MEMORY[0x1E4F1CAF0]);
        v10 = [v4 stringForKey:@"MapsSuggestionsEventTimeZoneKey"];
        v11 = (void *)[v9 initWithName:v10];

        if (!v11)
        {
          v12 = GEOFindOrCreateLog();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v13 = [v4 title];
            int v31 = 138412290;
            v32 = v13;
            _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_ERROR, "Timezone information is missing for entry %@", (uint8_t *)&v31, 0xCu);
          }
        }
        v14 = v7;
        id v15 = v8;
        id v16 = v11;
        if (v14 && MapsSuggestionsIsToday(v14))
        {
          uint64_t v17 = MapsSuggestionsLocalizedHotelCheckInString(v14, v16);
        }
        else
        {
          if (!v15 || !MapsSuggestionsIsToday(v15))
          {
            v22 = MapsSuggestionsShortDateFromDateAndTimeZone(v15, v16);
            v21 = MapsSuggestionsLocalizedHotelUntilCheckoutDateString(v22);

LABEL_28:
            v23 = [v4 undecoratedSubtitle];
            char v24 = [v23 isEqualToString:v21];

            if ((v24 & 1) == 0) {
              [v4 setUndecoratedSubtitle:v21];
            }
            if ([v4 BOOLeanForKey:@"MapsSuggestionsAlreadyLocalizedKey"])
            {
              char v19 = v24 ^ 1;
            }
            else
            {
              char v19 = 1;
              [v4 setBoolean:1 forKey:@"MapsSuggestionsAlreadyLocalizedKey"];
            }
            if ([v4 containsKey:@"MapsSuggestionsAlreadyThereKey"])
            {
              uint64_t v25 = [v4 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"] ^ 1;
              if ([v4 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"] == v25)
              {
LABEL_39:
                if ([v4 containsKey:@"MapsSuggestionsCalendarIsSharedToMeKey"]
                  && [v4 BOOLeanForKey:@"MapsSuggestionsCalendarIsSharedToMeKey"])
                {
                  GEOConfigGetDouble();
                  objc_msgSend(v4, "setWeight:");
                  char v19 = 1;
                }
                id v26 = objc_alloc(MEMORY[0x1E4F1CAF0]);
                v27 = [v4 stringForKey:@"MapsSuggestionsEventTimeZoneKey"];
                uint64_t v28 = [v26 initWithName:v27];
                v29 = MapsSuggestionsDateRangeStringForDates(v14, v15, (void *)v28);

                v30 = [v4 stringForKey:@"MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"];
                LOBYTE(v28) = [v29 isEqualToString:v30];

                if ((v28 & 1) == 0)
                {
                  [v4 setString:v29 forKey:@"MapsSuggestionsCalendarPersonalizedPOIAdornmentKey"];
                  char v19 = 1;
                }

                goto LABEL_21;
              }
            }
            else
            {
              if ([v4 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"]) {
                goto LABEL_39;
              }
              uint64_t v25 = 1;
            }
            [v4 setBoolean:v25 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
            char v19 = 1;
            goto LABEL_39;
          }
          uint64_t v17 = MapsSuggestionsLocalizedHotelCheckOutString(v15, v16);
        }
        v21 = (void *)v17;
        goto LABEL_28;
      }
      v14 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        int v31 = 136446978;
        v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelImprover.m";
        __int16 v33 = 1024;
        int v34 = 31;
        __int16 v35 = 2082;
        v36 = "-[MapsSuggestionsHotelImprover improveEntry:]";
        __int16 v37 = 2082;
        v38 = "scheduledEndTimeExists == NO";
        v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Scheduled End time can't be nil";
        goto LABEL_19;
      }
LABEL_20:
      char v19 = 0;
LABEL_21:

      goto LABEL_22;
    }
    v14 = GEOFindOrCreateLog();
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      goto LABEL_20;
    }
    int v31 = 136446978;
    v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsHotelImprover.m";
    __int16 v33 = 1024;
    int v34 = 30;
    __int16 v35 = 2082;
    v36 = "-[MapsSuggestionsHotelImprover improveEntry:]";
    __int16 v37 = 2082;
    v38 = "scheduledTimeExists == NO";
    v18 = "At %{public}s:%d, %{public}s forbids: %{public}s. Scheduled time can't be nil";
LABEL_19:
    _os_log_impl(&dword_1A70DF000, v14, OS_LOG_TYPE_ERROR, v18, (uint8_t *)&v31, 0x26u);
    goto LABEL_20;
  }
  char v19 = 0;
LABEL_22:

  return v19;
}

@end