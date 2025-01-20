@interface CUIKPasteboardUtilities
+ (BOOL)allEventsValidForAction:(unint64_t)a3 fromEvents:(id)a4;
+ (BOOL)declinesToPerformCutCopyPasteAction:(SEL)a3 withSender:(id)a4;
+ (id)duplicateEventsByStrippingUnsupportedFields:(id)a3 toNewCalendar:(id)a4;
+ (id)roundedDateForDate:(id)a3 dateMode:(unint64_t)a4 calendar:(id)a5;
+ (void)adjustTimesForEventsToPaste:(id)a3 pasteDate:(id)a4 dateMode:(unint64_t)a5 calendar:(id)a6;
@end

@implementation CUIKPasteboardUtilities

+ (id)roundedDateForDate:(id)a3 dateMode:(unint64_t)a4 calendar:(id)a5
{
  id v7 = a3;
  v8 = v7;
  if (a4 == 1)
  {
    id v9 = [v7 dateRoundedToNearestFifteenMinutesInCalendar:a5];
  }
  else
  {
    id v9 = v7;
  }
  v10 = v9;

  return v10;
}

+ (void)adjustTimesForEventsToPaste:(id)a3 pasteDate:(id)a4 dateMode:(unint64_t)a5 calendar:(id)a6
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (a5 != 3)
  {
    id v50 = v12;
    v47 = v11;
    v13 = [MEMORY[0x1E4F1C9C8] distantFuture];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id v45 = v10;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v56;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v56 != v17) {
            objc_enumerationMutation(v14);
          }
          v19 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          v20 = objc_msgSend(v19, "startDate", v45);
          int v21 = [v20 isBeforeDate:v13];

          if (v21)
          {
            uint64_t v22 = [v19 startDate];

            v13 = (void *)v22;
          }
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v55 objects:v60 count:16];
      }
      while (v16);
    }

    uint64_t v23 = [a1 roundedDateForDate:v47 dateMode:a5 calendar:v50];

    id v24 = (id)v23;
    if (!v23) {
      id v24 = v13;
    }
    v25 = objc_msgSend(v13, "dateRemovingTimeComponentsInCalendar:", v50, v45);
    v26 = [v24 dateRemovingTimeComponentsInCalendar:v50];
    v27 = [v50 components:16 fromDate:v25 toDate:v26 options:0];
    uint64_t v49 = [v27 day];

    id v48 = v24;
    v28 = [v50 components:176 fromDate:v13 toDate:v24 options:0];
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v29 = v14;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v59 count:16];
    if (v30)
    {
      uint64_t v31 = v30;
      uint64_t v32 = *(void *)v52;
      unint64_t v33 = a5 - 1;
      do
      {
        for (uint64_t j = 0; j != v31; ++j)
        {
          if (*(void *)v52 != v32) {
            objc_enumerationMutation(v29);
          }
          v35 = *(void **)(*((void *)&v51 + 1) + 8 * j);
          v36 = [v35 endDateUnadjustedForLegacyClients];
          v37 = [v35 startDate];
          [v36 timeIntervalSinceDate:v37];
          double v39 = v38;

          v40 = [v35 startDate];
          v41 = v40;
          if (v33 > 1) {
            [v40 dateByAddingDays:v49 inCalendar:0];
          }
          else {
          v42 = [v50 dateByAddingComponents:v28 toDate:v40 options:0];
          }
          [v35 setStartDate:v42];

          v43 = [v35 startDate];
          v44 = [v43 dateByAddingTimeInterval:v39];
          [v35 setEndDateUnadjustedForLegacyClients:v44];
        }
        uint64_t v31 = [v29 countByEnumeratingWithState:&v51 objects:v59 count:16];
      }
      while (v31);
    }

    id v10 = v46;
    id v11 = v48;
    id v12 = v50;
  }
}

+ (id)duplicateEventsByStrippingUnsupportedFields:(id)a3 toNewCalendar:(id)a4
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithCapacity:", objc_msgSend(v5, "count"));
    id v40 = (id)objc_claimAutoreleasedReturnValue();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id v37 = v5;
    obuint64_t j = v5;
    uint64_t v7 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v54;
      uint64_t v38 = *(void *)v54;
      id v39 = v6;
      do
      {
        uint64_t v10 = 0;
        uint64_t v41 = v8;
        do
        {
          if (*(void *)v54 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v53 + 1) + 8 * v10);
          if ([v11 currentUserGeneralizedParticipantRole] == 3
            || [v11 currentUserGeneralizedParticipantRole] == 1)
          {
            id v12 = [v11 selfAttendee];
            v13 = [v11 attendees];
            id v14 = (void *)MEMORY[0x1E4F28F60];
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = __85__CUIKPasteboardUtilities_duplicateEventsByStrippingUnsupportedFields_toNewCalendar___block_invoke;
            v51[3] = &unk_1E6369630;
            id v52 = v12;
            id v15 = v12;
            uint64_t v16 = [v14 predicateWithBlock:v51];
            uint64_t v17 = [v13 filteredArrayUsingPredicate:v16];

            uint64_t v18 = 62;
          }
          else
          {
            uint64_t v17 = 0;
            uint64_t v18 = 58;
          }
          v19 = [v11 calendar];
          int v20 = [v11 canMoveOrCopyToCalendar:v6 fromCalendar:v19 error:0];

          if (v20)
          {
            int v21 = [v11 copyToCalendar:v6 withOptions:v18];
            [v21 setStatus:0];
            long long v49 = 0u;
            long long v50 = 0u;
            long long v47 = 0u;
            long long v48 = 0u;
            id v22 = v17;
            uint64_t v23 = [v22 countByEnumeratingWithState:&v47 objects:v58 count:16];
            if (v23)
            {
              uint64_t v24 = v23;
              uint64_t v25 = *(void *)v48;
              do
              {
                for (uint64_t i = 0; i != v24; ++i)
                {
                  if (*(void *)v48 != v25) {
                    objc_enumerationMutation(v22);
                  }
                  v27 = [*(id *)(*((void *)&v47 + 1) + 8 * i) duplicate];
                  [v21 addAttendee:v27];
                }
                uint64_t v24 = [v22 countByEnumeratingWithState:&v47 objects:v58 count:16];
              }
              while (v24);
            }

            long long v45 = 0u;
            long long v46 = 0u;
            long long v43 = 0u;
            long long v44 = 0u;
            v28 = [v21 attendees];
            uint64_t v29 = [v28 countByEnumeratingWithState:&v43 objects:v57 count:16];
            if (v29)
            {
              uint64_t v30 = v29;
              uint64_t v31 = *(void *)v44;
              do
              {
                for (uint64_t j = 0; j != v30; ++j)
                {
                  if (*(void *)v44 != v31) {
                    objc_enumerationMutation(v28);
                  }
                  unint64_t v33 = *(void **)(*((void *)&v43 + 1) + 8 * j);
                  v34 = [v33 proposedStartDateForEvent:v11];

                  if (v34) {
                    [v33 setProposedStartDate:0 forEvent:v21];
                  }
                }
                uint64_t v30 = [v28 countByEnumeratingWithState:&v43 objects:v57 count:16];
              }
              while (v30);
            }

            [v40 addObject:v21];
            uint64_t v9 = v38;
            id v6 = v39;
            uint64_t v8 = v41;
          }
          else
          {
            int v21 = +[CUIKLogSubsystem defaultCategory];
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v60 = v11;
              __int16 v61 = 2112;
              id v62 = v6;
              _os_log_error_impl(&dword_1BDF08000, v21, OS_LOG_TYPE_ERROR, "Attempting to duplicate event (%@) to a calendar that does not allow it (%@). Skipping this event.", buf, 0x16u);
            }
          }

          ++v10;
        }
        while (v10 != v8);
        uint64_t v8 = [obj countByEnumeratingWithState:&v53 objects:v63 count:16];
      }
      while (v8);
    }

    id v5 = v37;
  }
  else
  {
    v35 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      +[CUIKPasteboardUtilities duplicateEventsByStrippingUnsupportedFields:toNewCalendar:](v35);
    }

    id v40 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v40;
}

uint64_t __85__CUIKPasteboardUtilities_duplicateEventsByStrippingUnsupportedFields_toNewCalendar___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isEqualToParticipant:*(void *)(a1 + 32)] ^ 1;
}

+ (BOOL)allEventsValidForAction:(unint64_t)a3 fromEvents:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = a4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v8 = *(void *)v16;
    uint64_t v9 = v6;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v11, "isReminderIntegrationEvent", (void)v15))
        {
LABEL_19:
          char v12 = 0;
          goto LABEL_21;
        }
        if (a3 - 1 >= 2)
        {
          if (!a3
            && (([v11 isNew] & 1) != 0
             || ![v11 isDeletable]
             || [v11 isReminderIntegrationEvent]
             && (objc_msgSend(v11, "CUIK_reminderShouldBeEditable") & 1) == 0))
          {
            goto LABEL_19;
          }
        }
        else if ([v11 isNew] & 1) != 0 || (objc_msgSend(v11, "isBirthday"))
        {
          goto LABEL_19;
        }
      }
      uint64_t v9 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
      char v12 = 1;
      if (v9) {
        continue;
      }
      break;
    }
  }
  else
  {
    char v12 = 1;
  }
LABEL_21:

  if (v7) {
    BOOL v13 = v12;
  }
  else {
    BOOL v13 = 0;
  }

  return v13;
}

+ (BOOL)declinesToPerformCutCopyPasteAction:(SEL)a3 withSender:(id)a4
{
  id v5 = a4;
  BOOL v7 = sel_paste_ == a3 || sel_copy_ == a3 || sel_cut_ == a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v8 = v5;
    uint64_t v9 = v8;
    if (v7)
    {
      uint64_t v10 = [v8 sender];
      if (v10)
      {
        id v11 = [v9 sender];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          char isKindOfClass = 1;
        }
        else
        {
          BOOL v13 = [v9 sender];
          objc_opt_class();
          char isKindOfClass = objc_opt_isKindOfClass();
        }
      }
      else
      {
        char isKindOfClass = 0;
      }
    }
    else
    {
      char isKindOfClass = 0;
    }
  }
  else
  {
    char isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

+ (void)duplicateEventsByStrippingUnsupportedFields:(os_log_t)log toNewCalendar:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1BDF08000, log, OS_LOG_TYPE_ERROR, "nil calendar given when attempting to duplicate events. The caller must ensure we have a valid new calendar", v1, 2u);
}

@end