@interface CUIKEventHeuristics
+ (BOOL)_shouldFilterEvent:(id)a3 filterOptions:(unint64_t)a4;
+ (id)_sortedAndFilteredEventsForPredicate:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6;
+ (id)_sortedEvents:(id)a3 withMethod:(unint64_t)a4;
+ (id)todaysEventsInCalendars:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6;
+ (id)tomorrowsEventsInCalendars:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6;
+ (id)upcomingEventsInCalendars:(id)a3 onlyReturnFirstEvents:(BOOL)a4 filterOptions:(unint64_t)a5 sortMethod:(unint64_t)a6 eventStore:(id)a7;
@end

@implementation CUIKEventHeuristics

+ (id)todaysEventsInCalendars:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 CalDateForBeginningOfToday];
  v14 = [MEMORY[0x1E4F1C9C8] CalDateForEndOfToday];
  v15 = [v11 predicateForEventsWithStartDate:v13 endDate:v14 calendars:v12];

  v16 = [a1 _sortedAndFilteredEventsForPredicate:v15 filterOptions:a4 sortMethod:a5 eventStore:v11];

  return v16;
}

+ (id)tomorrowsEventsInCalendars:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6
{
  v10 = (void *)MEMORY[0x1E4F1C9C8];
  id v11 = a6;
  id v12 = a3;
  v13 = [v10 CalDateForBeginningOfTomorrow];
  v14 = [MEMORY[0x1E4F1C9C8] CalDateForEndOfTomorrow];
  v15 = [v11 predicateForEventsWithStartDate:v13 endDate:v14 calendars:v12];

  v16 = [a1 _sortedAndFilteredEventsForPredicate:v15 filterOptions:a4 sortMethod:a5 eventStore:v11];

  return v16;
}

+ (id)upcomingEventsInCalendars:(id)a3 onlyReturnFirstEvents:(BOOL)a4 filterOptions:(unint64_t)a5 sortMethod:(unint64_t)a6 eventStore:(id)a7
{
  BOOL v10 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a7;
  v14 = [MEMORY[0x1E4F1C9C8] CalDateForNow];
  v15 = [MEMORY[0x1E4F1C9C8] CalDateForEndOfToday];
  v32 = v12;
  uint64_t v16 = [v13 predicateForEventsWithStartDate:v14 endDate:v15 calendars:v12];

  v30 = (void *)v16;
  v31 = v13;
  v17 = [a1 _sortedAndFilteredEventsForPredicate:v16 filterOptions:a5 sortMethod:a6 eventStore:v13];
  v18 = v17;
  if (v10)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v19 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      id v21 = 0;
      uint64_t v22 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v18);
          }
          v24 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          if (v21)
          {
            v25 = [v21 lastObject];
            v26 = [v24 startDate];
            v27 = [v25 startDate];
            int v28 = [v26 isEqualToDate:v27];

            if (v28) {
              [v21 addObject:v24];
            }
          }
          else
          {
            id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            [v21 addObject:v24];
          }
        }
        uint64_t v20 = [v18 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v20);
    }
    else
    {
      id v21 = 0;
    }
  }
  else
  {
    id v21 = v17;
  }

  return v21;
}

+ (id)_sortedAndFilteredEventsForPredicate:(id)a3 filterOptions:(unint64_t)a4 sortMethod:(unint64_t)a5 eventStore:(id)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v9 = [a6 eventsMatchingPredicate:a3];
  BOOL v10 = [a1 _sortedEvents:v9 withMethod:a5];
  id v11 = [MEMORY[0x1E4F1CA48] array];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v12 = v10;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void *)(*((void *)&v20 + 1) + 8 * i);
        if ((objc_msgSend(a1, "_shouldFilterEvent:filterOptions:", v17, a4, (void)v20) & 1) == 0) {
          [v11 addObject:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }

  v18 = [MEMORY[0x1E4F1C978] arrayWithArray:v11];

  return v18;
}

+ (id)_sortedEvents:(id)a3 withMethod:(unint64_t)a4
{
  id v5 = a3;
  uint64_t v6 = [v5 count];
  v7 = v5;
  if (a4 == 1)
  {
    v7 = v5;
    if (v6)
    {
      v7 = [v5 sortedArrayUsingComparator:&__block_literal_global_18];
    }
  }

  return v7;
}

uint64_t __48__CUIKEventHeuristics__sortedEvents_withMethod___block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v3 = [v2 startDate];
  v4 = [v2 startDate];

  uint64_t v5 = [v3 compare:v4];
  return v5;
}

+ (BOOL)_shouldFilterEvent:(id)a3 filterOptions:(unint64_t)a4
{
  unsigned int v4 = a4;
  id v5 = a3;
  uint64_t v6 = [v5 calendar];
  int v7 = ([v6 type] == 4) & (v4 >> 1);

  int v8 = [v5 isAllDay] & (v4 >> 2);
  char v9 = v4 & ([v5 status] == 3);
  if ([v5 hasAttendees])
  {
    BOOL v10 = [v5 organizer];
    if ([v10 isCurrentUser])
    {
      LOBYTE(v11) = 0;
    }
    else
    {
      id v12 = [v5 selfAttendee];
      int v11 = ([v12 participantStatus] == 3) & (v4 >> 3);
    }
  }
  else
  {
    LOBYTE(v11) = 0;
  }
  char v13 = v11 | v8 | v9 | v7;
  if ((v4 & 0x10) != 0 && (((v11 | v8 | v9) | v7) & 1) == 0)
  {
    uint64_t v14 = [MEMORY[0x1E4F1C9C8] CalDateForEndOfToday];
    uint64_t v15 = [MEMORY[0x1E4F576D0] rangeWithStartDate:v14 endDate:v14];

    char v13 = [v15 intersectsRange:v5];
  }

  return v13;
}

@end