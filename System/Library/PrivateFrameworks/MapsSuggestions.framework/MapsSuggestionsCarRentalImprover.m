@interface MapsSuggestionsCarRentalImprover
+ (BOOL)isEnabled;
- (BOOL)improveEntry:(id)a3;
@end

@implementation MapsSuggestionsCarRentalImprover

+ (BOOL)isEnabled
{
  return GEOConfigGetBOOL();
}

- (BOOL)improveEntry:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (!v4)
  {
    v8 = GEOFindOrCreateLog();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136446978;
      *(void *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsCarRentalImprover.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 21;
      *(_WORD *)&buf[18] = 2082;
      *(void *)&buf[20] = "-[MapsSuggestionsCarRentalImprover improveEntry:]";
      *(_WORD *)&buf[28] = 2082;
      *(void *)&buf[30] = "entry == nil";
      _os_log_impl(&dword_1A70DF000, v8, OS_LOG_TYPE_ERROR, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires entry", buf, 0x26u);
    }
    char v11 = 0;
    goto LABEL_40;
  }
  if ([v4 type] == 14)
  {
    int v6 = [v5 BOOLeanForKey:@"MapsSuggestionsCalendarCarRentalIsPickupDayKey"];
    v7 = [v5 dateForKey:@"MapsSuggestionsScheduledTimeKey"];
    v8 = NSStringFromMapsSuggestionsEventTime(v7);
    if ([v8 length])
    {
      if ([v5 containsKey:@"MapsSuggestionsEntryTitleNameKey"])
      {
        v9 = [v5 stringForKey:@"MapsSuggestionsEntryTitleNameKey"];
        char v10 = -[MapsSuggestionsBaseImprover improveMyUndecoratedTitle:forEntry:]((uint64_t)self, v9, v5);
      }
      else
      {
        char v10 = 0;
      }
      v13 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        v14 = @"isDropoffDay = YES";
        if (v6) {
          v14 = @"isPickupDay = YES";
        }
        *(_DWORD *)buf = 138412546;
        *(void *)&buf[4] = v14;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v7;
        _os_log_impl(&dword_1A70DF000, v13, OS_LOG_TYPE_DEBUG, "%@. Time = %@.", buf, 0x16u);
      }

      if (v6)
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = ___MapsSuggestionsBundle_block_invoke;
        *(void *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&buf[32] = "CarRentalImprover";
        if (qword_1EB6F00F0 != -1) {
          dispatch_once(&qword_1EB6F00F0, buf);
        }
        v15 = (void *)_MergedGlobals_25;
        v16 = @"MAPS_SUGGESTIONS_CAR_RENTAL_PICKUP_STRING";
        v17 = @"Pick up from %@<unlocalized>";
      }
      else
      {
        *(void *)buf = MEMORY[0x1E4F143A8];
        *(void *)&buf[8] = 3221225472;
        *(void *)&buf[16] = ___MapsSuggestionsBundle_block_invoke;
        *(void *)&buf[24] = &__block_descriptor_40_e5_v8__0l;
        *(void *)&buf[32] = "CarRentalImprover";
        if (qword_1EB6F00F0 != -1) {
          dispatch_once(&qword_1EB6F00F0, buf);
        }
        v15 = (void *)_MergedGlobals_25;
        v16 = @"MAPS_SUGGESTIONS_CAR_RENTAL_DROPOFF_STRING";
        v17 = @"Drop off by %@<unlocalized>";
      }
      v18 = [v15 localizedStringForKey:v16 value:v17 table:0];
      v12 = MapsSuggestionsNonNilString(v18, &stru_1EFC640F8);

      v19 = objc_msgSend([NSString alloc], "initWithFormat:", v12, v8);
      v20 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v19;
        _os_log_impl(&dword_1A70DF000, v20, OS_LOG_TYPE_DEBUG, "Subtitle from the Car Rental Improver = %@", buf, 0xCu);
      }

      char v21 = -[MapsSuggestionsBaseImprover improveMyUndecoratedSubtitle:forEntry:]((uint64_t)self, v19, v5);
      if ([v5 BOOLeanForKey:@"MapsSuggestionsAlreadyLocalizedKey"])
      {
        char v11 = v10 | v21;
      }
      else
      {
        char v11 = 1;
        [v5 setBoolean:1 forKey:@"MapsSuggestionsAlreadyLocalizedKey"];
      }
      if ([v5 containsKey:@"MapsSuggestionsAlreadyThereKey"]) {
        int v22 = [v5 BOOLeanForKey:@"MapsSuggestionsAlreadyThereKey"] ^ 1;
      }
      else {
        int v22 = 1;
      }
      if ([v5 containsKey:@"MapsSuggestionsCalendarIsSharedToMeKey"]
        && [v5 BOOLeanForKey:@"MapsSuggestionsCalendarIsSharedToMeKey"])
      {
        GEOConfigGetDouble();
        objc_msgSend(v5, "setWeight:");
        char v11 = 1;
      }
      if (v22 != [v5 BOOLeanForKey:@"MapsSuggestionsNeedsETATrackingKey"])
      {
        char v11 = 1;
        [v5 setBoolean:1 forKey:@"MapsSuggestionsNeedsETATrackingKey"];
      }
    }
    else
    {
      v12 = GEOFindOrCreateLog();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A70DF000, v12, OS_LOG_TYPE_DEBUG, "timeOfAction is zero. MapsSuggestionsScheduledTimeKey on the entry should have had a value", buf, 2u);
      }
      char v11 = 0;
    }

LABEL_40:
    goto LABEL_41;
  }
  char v11 = 0;
LABEL_41:

  return v11;
}

@end