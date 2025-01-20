@interface CUIKNotificationDescriptionGenerator
+ (id)_autoCommentForProposedTime:(id)a3 timeZone:(id)a4;
+ (id)comment:(id)a3 withInsertedAutoCommentForDate:(id)a4 timeZone:(id)a5;
+ (id)sharedGenerator;
+ (id)stringWithAutoCommentRemoved:(id)a3;
+ (id)stringWithOnlyAutoComment:(id)a3;
+ (id)timeSensitiveString;
- (id)_adjustedTitle:(id)a3 maxLength:(unint64_t)a4;
- (id)_sharedDateFormatter;
- (id)_sharedDateTimeFormatter;
- (id)_sharedNumberFormatter;
- (id)_sharedTimeFormatter;
- (id)conflictStringForConflictDetails:(id)a3 descriptions:(id)a4;
- (id)conflictStringForConflictDetails:(id)a3 maxTitleLength:(unint64_t)a4;
- (id)conflictStringForConflictDetails:(id)a3 maxTitleLength:(unint64_t)a4 descriptions:(id)a5;
- (id)timePeriodForTimeInterval:(id)a3;
@end

@implementation CUIKNotificationDescriptionGenerator

+ (id)sharedGenerator
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __55__CUIKNotificationDescriptionGenerator_sharedGenerator__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedGenerator_onceToken_3 != -1) {
    dispatch_once(&sharedGenerator_onceToken_3, block);
  }
  v2 = (void *)sharedGenerator___sharedInstance_3;

  return v2;
}

void __55__CUIKNotificationDescriptionGenerator_sharedGenerator__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedGenerator___sharedInstance_3;
  sharedGenerator___sharedInstance_3 = (uint64_t)v1;
}

- (id)_sharedNumberFormatter
{
  numberFormatter = self->_numberFormatter;
  if (!numberFormatter)
  {
    v4 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E4F28EE0]);
    v5 = self->_numberFormatter;
    self->_numberFormatter = v4;

    [(NSNumberFormatter *)self->_numberFormatter setNumberStyle:1];
    v6 = self->_numberFormatter;
    v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSNumberFormatter *)v6 setLocale:v7];

    numberFormatter = self->_numberFormatter;
  }

  return numberFormatter;
}

- (id)_sharedDateFormatter
{
  dateFormatter = self->_dateFormatter;
  if (!dateFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_dateFormatter;
    self->_dateFormatter = v4;

    [(NSDateFormatter *)self->_dateFormatter setDateStyle:2];
    [(NSDateFormatter *)self->_dateFormatter setTimeStyle:0];
    v6 = self->_dateFormatter;
    v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v6 setLocale:v7];

    dateFormatter = self->_dateFormatter;
  }

  return dateFormatter;
}

- (id)_sharedTimeFormatter
{
  timeFormatter = self->_timeFormatter;
  if (!timeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_timeFormatter;
    self->_timeFormatter = v4;

    [(NSDateFormatter *)self->_timeFormatter setDateStyle:0];
    [(NSDateFormatter *)self->_timeFormatter setTimeStyle:1];
    v6 = self->_timeFormatter;
    v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v6 setLocale:v7];

    timeFormatter = self->_timeFormatter;
  }

  return timeFormatter;
}

- (id)_sharedDateTimeFormatter
{
  dateTimeFormatter = self->_dateTimeFormatter;
  if (!dateTimeFormatter)
  {
    v4 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E4F28C10]);
    v5 = self->_dateTimeFormatter;
    self->_dateTimeFormatter = v4;

    [(NSDateFormatter *)self->_dateTimeFormatter setDateStyle:1];
    [(NSDateFormatter *)self->_dateTimeFormatter setTimeStyle:1];
    v6 = self->_dateTimeFormatter;
    v7 = [MEMORY[0x1E4F1CA20] autoupdatingCurrentLocale];
    [(NSDateFormatter *)v6 setLocale:v7];

    dateTimeFormatter = self->_dateTimeFormatter;
  }

  return dateTimeFormatter;
}

- (id)timePeriodForTimeInterval:(id)a3
{
  id v3 = a3;
  v4 = [v3 startDate];
  [v4 timeIntervalSinceNow];
  double v6 = v5;

  [v3 duration];
  double v8 = v7;

  v9 = objc_opt_new();
  [v9 setAllowedUnits:4108];
  [v9 setMaximumUnitCount:1];
  [v9 setAllowsFractionalUnits:0];
  [v9 setUnitsStyle:4];
  v10 = [v9 stringFromTimeInterval:v6 + v8];

  return v10;
}

- (id)_adjustedTitle:(id)a3 maxLength:(unint64_t)a4
{
  id v5 = a3;
  objc_msgSend(v5, "rangeOfComposedCharacterSequencesForRange:", 0, objc_msgSend(v5, "length"));
  if (v6 <= a4)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = (id)objc_opt_new();
    uint64_t v8 = [v5 rangeOfComposedCharacterSequenceAtIndex:a4];
    v10 = [v5 substringToIndex:v8 + v9];
    [v7 appendString:v10];

    v11 = [NSString ellipsisString];
    [v7 appendString:v11];
  }

  return v7;
}

- (id)conflictStringForConflictDetails:(id)a3 descriptions:(id)a4
{
  return [(CUIKNotificationDescriptionGenerator *)self conflictStringForConflictDetails:a3 maxTitleLength:-1 descriptions:a4];
}

- (id)conflictStringForConflictDetails:(id)a3 maxTitleLength:(unint64_t)a4
{
  return [(CUIKNotificationDescriptionGenerator *)self conflictStringForConflictDetails:a3 maxTitleLength:a4 descriptions:0];
}

- (id)conflictStringForConflictDetails:(id)a3 maxTitleLength:(unint64_t)a4 descriptions:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = [v8 totalConflictingEvents];
  uint64_t v11 = [v8 totalNeedsActionEvents];
  if ((unint64_t)[v8 totalOccurrencesInSeries] >= 2 && objc_msgSend(v8, "totalConflictsInSeries"))
  {
    uint64_t v12 = [v8 totalConflictsInSeries];
    v13 = [v8 conflictPeriodForSeries];

    if (v13)
    {
      v14 = NSString;
      v15 = CUIKBundle();
      v16 = v15;
      if (v12 == 1)
      {
        v17 = [v15 localizedStringForKey:@"Conflict: One out of the next %ld occurrences" value:&stru_1F187C430 table:0];
        objc_msgSend(v14, "localizedStringWithFormat:", v17, objc_msgSend(v8, "totalOccurrencesInSeries"), v59);
        v27 = LABEL_37:;
        goto LABEL_38;
      }
      v17 = [v15 localizedStringForKey:@"Conflicts: %ld out of next %ld occurrences" value:&stru_1F187C430 table:0];
      uint64_t v59 = [v8 totalOccurrencesInSeries];
LABEL_32:
      objc_msgSend(v14, "localizedStringWithFormat:", v17, v12, v59);
      goto LABEL_37;
    }
    if (v12 != 1
      || ([v8 needsActionEvents],
          v42 = objc_claimAutoreleasedReturnValue(),
          uint64_t v43 = [v42 count],
          v42,
          !v43))
    {
      v14 = NSString;
      v16 = CUIKBundle();
      v17 = [v16 localizedStringForKey:@"Conflicts with %ld events" value:&stru_1F187C430 table:0];
      goto LABEL_32;
    }
    if (a4)
    {
      v44 = [v8 conflictingEvents];
      v45 = [v44 firstObject];
      v46 = [v45 title];

      v16 = [(CUIKNotificationDescriptionGenerator *)self _adjustedTitle:v46 maxLength:a4];

      v47 = NSString;
      v48 = CUIKBundle();
      v49 = [v48 localizedStringForKey:@"Conflicts with %@" value:&stru_1F187C430 table:0];
      v27 = objc_msgSend(v47, "localizedStringWithFormat:", v49, v16);

      if (!v9) {
        goto LABEL_39;
      }
      goto LABEL_27;
    }
    v53 = NSString;
    v54 = CUIKBundle();
    v16 = v54;
    v55 = @"Conflicts with an event";
LABEL_36:
    v17 = [v54 localizedStringForKey:v55 value:&stru_1F187C430 table:0];
    objc_msgSend(v53, "localizedStringWithFormat:", v17, 1, v59);
    goto LABEL_37;
  }
  uint64_t v18 = v11 + v10;
  if (v11 + v10 >= 1)
  {
    if ([v8 totalConflictingEvents])
    {
      if (v18 == 1)
      {
        v19 = [v8 conflictingEvents];
        uint64_t v20 = [v19 count];

        if (v20)
        {
          if (!a4)
          {
            v53 = NSString;
            v54 = CUIKBundle();
            v16 = v54;
            v55 = @"Another event is scheduled for this time";
            goto LABEL_36;
          }
          v21 = [v8 conflictingEvents];
          v22 = [v21 firstObject];
          v23 = [v22 title];

          v16 = [(CUIKNotificationDescriptionGenerator *)self _adjustedTitle:v23 maxLength:a4];

          v24 = NSString;
          v25 = CUIKBundle();
          v26 = [v25 localizedStringForKey:@"One conflict" value:@"%@ is also scheduled for this time" table:0];
          v27 = objc_msgSend(v24, "localizedStringWithFormat:", v26, v16);

          if (v9 && v16)
          {
LABEL_27:
            v50 = (void *)MEMORY[0x1E4F29238];
            uint64_t v51 = [v27 rangeOfString:v16];
            v17 = objc_msgSend(v50, "valueWithRange:", v51, v52);
            [v9 setObject:v17 forKeyedSubscript:@"ConflictEventRange"];
            goto LABEL_38;
          }
LABEL_39:

          if (!v9) {
            goto LABEL_41;
          }
          goto LABEL_40;
        }
      }
      v28 = NSString;
      v29 = CUIKBundle();
      v16 = v29;
      v30 = @"N conflicts";
    }
    else
    {
      if ([v8 totalNeedsActionEvents] == 1)
      {
        v31 = [v8 needsActionEvents];
        uint64_t v32 = [v31 count];

        if (v32)
        {
          v33 = [v8 needsActionEvents];
          v34 = [v33 firstObject];
          v16 = [v34 title];

          if (!a4 || !v16)
          {
            v56 = NSString;
            v17 = CUIKBundle();
            v57 = [v17 localizedStringForKey:@"Another event is scheduled for this time" value:&stru_1F187C430 table:0];
            v27 = objc_msgSend(v56, "localizedStringWithFormat:", v57, v18);

            goto LABEL_38;
          }
          uint64_t v35 = [(CUIKNotificationDescriptionGenerator *)self _adjustedTitle:v16 maxLength:a4];

          v36 = NSString;
          v37 = CUIKBundle();
          v38 = [v37 localizedStringForKey:@"One invitation" value:@"%@ is also scheduled for this time" table:0];
          v27 = objc_msgSend(v36, "localizedStringWithFormat:", v38, v35);

          if (v9)
          {
            v39 = (void *)MEMORY[0x1E4F29238];
            uint64_t v40 = [v27 rangeOfString:v35];
            v17 = objc_msgSend(v39, "valueWithRange:", v40, v41);
            [v9 setObject:v17 forKeyedSubscript:@"ConflictEventRange"];
            v16 = (void *)v35;
LABEL_38:

            goto LABEL_39;
          }
          v16 = (void *)v35;
          goto LABEL_39;
        }
      }
      v28 = NSString;
      v29 = CUIKBundle();
      v16 = v29;
      v30 = @"N invitations";
    }
    v17 = [v29 localizedStringForKey:v30 value:@"%ld other events are also scheduled for this time" table:0];
    objc_msgSend(v28, "localizedStringWithFormat:", v17, v18, v59);
    goto LABEL_37;
  }
  v27 = 0;
  if (v9) {
LABEL_40:
  }
    [v9 setObject:v27 forKeyedSubscript:@"Conflict"];
LABEL_41:

  return v27;
}

+ (id)_autoCommentForProposedTime:(id)a3 timeZone:(id)a4
{
  v4 = [MEMORY[0x1E4F576C8] longStringForDateAndTime:a3 inTimeZone:a4];
  id v5 = NSString;
  unint64_t v6 = CUIKBundle();
  id v7 = [v6 localizedStringForKey:@"%@Can we move this event to %@?" value:&stru_1F187C430 table:0];
  id v8 = [NSString CalAutoCommentPrefix];
  id v9 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v8, v4);

  return v9;
}

+ (id)stringWithAutoCommentRemoved:(id)a3
{
  return (id)[a3 CalStringByRemovingAutoComment];
}

+ (id)stringWithOnlyAutoComment:(id)a3
{
  return (id)[a3 CalStringWithOnlyAutoComment];
}

+ (id)comment:(id)a3 withInsertedAutoCommentForDate:(id)a4 timeZone:(id)a5
{
  id v7 = a3;
  id v8 = v7;
  if (a4)
  {
    id v9 = +[CUIKNotificationDescriptionGenerator _autoCommentForProposedTime:a4 timeZone:a5];
    if (v8 && ([v8 CalHasAutoCommentPrefix] & 1) == 0)
    {
      uint64_t v10 = [v9 stringByAppendingFormat:@"\n%@", v8];

      id v9 = (id)v10;
    }
  }
  else
  {
    id v9 = v7;
  }

  return v9;
}

+ (id)timeSensitiveString
{
  v2 = CUIKBundle();
  id v3 = [v2 localizedStringForKey:@"Time Sensitive" value:&stru_1F187C430 table:0];

  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateTimeFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);

  objc_storeStrong((id *)&self->_numberFormatter, 0);
}

@end