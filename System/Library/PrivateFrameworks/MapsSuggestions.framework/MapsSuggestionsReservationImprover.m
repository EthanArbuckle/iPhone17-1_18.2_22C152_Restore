@interface MapsSuggestionsReservationImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsReservationImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v47 = 136446978;
      v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationImprover.m";
      __int16 v49 = 1024;
      int v50 = 22;
      __int16 v51 = 2082;
      v52 = "-[MapsSuggestionsReservationImprover improveEntry:]";
      __int16 v53 = 2082;
      v54 = "nil == (entry)";
      v12 = "At %{public}s:%d, %{public}s forbids: %{public}s. Requires suggestion entry";
      v13 = v5;
      uint32_t v14 = 38;
LABEL_12:
      _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v47, v14);
    }
LABEL_13:
    char v15 = 0;
LABEL_48:

    goto LABEL_49;
  }
  if ([v3 type] == 8)
  {
    if ([v4 containsKey:@"MapsSuggestionsScheduledTimeKey"])
    {
      v5 = [v4 copy];
      v6 = [v4 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
      if ([v4 containsKey:@"MapsSuggestionsReservationsStatusKey"])
      {
        uint64_t v7 = [v4 integerForKey:@"MapsSuggestionsReservationsStatusKey"];
        id v8 = v6;
        v9 = v8;
        v10 = 0;
        switch(v7)
        {
          case 0:
            break;
          case 1:
            v11 = NSStringFromMapsSuggestionsEventTime(v8);
            MapsSuggestionsLocalizedRestaurantReservationStringConfirmed(v11);
            v10 = (__CFString *)objc_claimAutoreleasedReturnValue();

            break;
          case 2:
            uint64_t v16 = MapsSuggestionsLocalizedRestaurantReservationStringCancelled();
            goto LABEL_16;
          case 3:
            uint64_t v16 = MapsSuggestionsLocalizedRestaurantReservationStringPending();
LABEL_16:
            v10 = (__CFString *)v16;
            break;
          default:
            v17 = GEOFindOrCreateLog();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
            {
              int v47 = 136446978;
              v48 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsReservationImprover.m";
              __int16 v49 = 1024;
              int v50 = 95;
              __int16 v51 = 2082;
              v52 = "NSString *_subtitleForReservation(MapsSuggestionsRestaurantReservationStatus, NSDate *__strong)";
              __int16 v53 = 2082;
              v54 = "YES";
              _os_log_impl(&dword_1A70DF000, v17, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Detected an unsupported MapsSuggestionsRestaurantReservationStatus!", (uint8_t *)&v47, 0x26u);
            }

            v10 = @"UnsupportedType";
            break;
        }

        v18 = [v4 undecoratedSubtitle];
        if ([v18 isEqualToString:v10])
        {
        }
        else
        {
          uint64_t v19 = [(__CFString *)v10 length];

          if (v19) {
            [v4 setUndecoratedSubtitle:v10];
          }
        }
      }
      v20 = MapsSuggestionsNow();
      [v6 timeIntervalSinceDate:v20];
      double v22 = v21;

      if ([v4 containsKey:@"MapsSuggestionsCalendarIsSharedToMeKey"]) {
        int v23 = [v4 BOOLeanForKey:@"MapsSuggestionsCalendarIsSharedToMeKey"];
      }
      else {
        int v23 = 0;
      }
      GEOConfigGetDouble();
      double v25 = v24;
      if (v23) {
        [v4 setWeight:v24];
      }
      GEOConfigGetDouble();
      if (v22 <= v26)
      {
        if ([v4 containsKey:@"MapsSuggestionsAlreadyThereKey"]) {
          uint64_t v30 = [v4 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"] ^ 1;
        }
        else {
          uint64_t v30 = 1;
        }
        GEOConfigGetDouble();
        double v32 = fmin(v25, v31);
        if (v23) {
          double v31 = v32;
        }
        [v4 setWeight:v31];
        [v4 setBoolean:v30 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
        v33 = GEOFindOrCreateLog();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          [v4 weight];
          int v47 = 134217984;
          v48 = v34;
          _os_log_impl(&dword_1A70DF000, v33, OS_LOG_TYPE_DEBUG, "Resetting the entry's weight to %g", (uint8_t *)&v47, 0xCu);
        }
      }
      else
      {
        GEOConfigGetDouble();
        double v28 = fmin(v25, v27);
        if (v23) {
          double v27 = v28;
        }
        [v4 setWeight:v27];
        v29 = [NSNumber numberWithInteger:GEOConfigGetInteger()];
        [v4 setNumber:v29 forKey:@"MapsSuggestionsSinkRankKey"];

        [v4 setBoolean:0 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
      }
      id v35 = v4;
      v36 = v5;
      [v35 weight];
      double v38 = v37;
      [v36 weight];
      if (vabdd_f64(v38, v39) < 2.22044605e-16
        && (uint64_t v40 = [v35 integerForKey:@"MapsSuggestionsSinkRankKey"],
            v40 == [v36 integerForKey:@"MapsSuggestionsSinkRankKey"])
        && (int v41 = [v35 containsKey:@"MapsSuggestionsNeedsETATrackingKey"],
            v41 == -[NSObject containsKey:](v36, "containsKey:", @"MapsSuggestionsNeedsETATrackingKey"))&& (int v42 = [v35 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"], v42 == -[NSObject BOOLeanForKey:](v36, "BOOLeanForKey:", @"MapsSuggestionsNeedsETATrackingKey")))
      {
        v44 = [v35 undecoratedSubtitle];
        v45 = [v36 undecoratedSubtitle];
        char v46 = [v44 isEqualToString:v45];

        char v15 = v46 ^ 1;
      }
      else
      {
        char v15 = 1;
      }

      goto LABEL_48;
    }
    v5 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      int v47 = 138412290;
      v48 = (const char *)v4;
      v12 = "Entry didn't have a MapsSuggestionsScheduledTimeKey: %@";
      v13 = v5;
      uint32_t v14 = 12;
      goto LABEL_12;
    }
    goto LABEL_13;
  }
  char v15 = 0;
LABEL_49:

  return v15;
}

@end