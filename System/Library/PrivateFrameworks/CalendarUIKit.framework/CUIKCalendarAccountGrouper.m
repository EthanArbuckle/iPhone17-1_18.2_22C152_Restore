@interface CUIKCalendarAccountGrouper
+ (id)_groupForCustomGroupType:(unint64_t)a3 inMap:(id)a4;
+ (id)_groupForSource:(id)a3 inMap:(id)a4;
+ (id)calendarsLimitedToSource:(id)a3 writability:(int64_t)a4 onlyUnmanagedAccounts:(BOOL)a5 forEvent:(id)a6 entityType:(unint64_t)a7 inEventStore:(id)a8;
+ (id)calendarsLimitedToSource:(id)a3 writability:(int64_t)a4 onlyUnmanagedAccounts:(BOOL)a5 forEvents:(id)a6 entityType:(unint64_t)a7 inEventStore:(id)a8;
+ (id)eligibleCalendarsForMovingEvent:(id)a3;
+ (id)generateGroupsForCalendars:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 forMode:(int64_t)a6 usingBackgroundColor:(id)a7 includingAccountsWithoutCalendars:(BOOL)a8 filterByFocus:(BOOL)a9 usingUnselectedCalendars:(id)a10 foundRefreshableCalendar:(BOOL *)a11 anyGroupsHiddenByFocus:(BOOL *)a12 numberOfCalendarsHiddenByFocus:(int64_t *)a13;
+ (void)_insertStore:(id)a3 intoByGroupArray:(id)a4;
+ (void)_populateGroups:(id)a3 forNonDelegateSources:(id)a4;
@end

@implementation CUIKCalendarAccountGrouper

+ (void)_populateGroups:(id)a3 forNonDelegateSources:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (([v11 isDelegate] & 1) == 0)
        {
          v12 = [v11 constraints];
          if ([(CUIKGroupInfo *)v12 allowsEvents]
            && [v11 syncs])
          {
            uint64_t v13 = [v11 sourceType];

            if (v13 == 4) {
              continue;
            }
            v12 = [[CUIKGroupInfo alloc] initWithSource:v11];
            v14 = [v11 sourceIdentifier];
            [v5 setObject:v12 forKey:v14];
          }
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

+ (id)_groupForCustomGroupType:(unint64_t)a3 inMap:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v6 = [NSNumber numberWithInt:a3];
    uint64_t v7 = [v5 objectForKey:v6];

    if (!v7)
    {
      uint64_t v7 = [[CUIKGroupInfo alloc] initWithCustomGroupType:a3];
      [(CUIKGroupInfo *)v7 setSelected:0];
      uint64_t v8 = [NSNumber numberWithInt:a3];
      [v5 setObject:v7 forKey:v8];
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

+ (id)_groupForSource:(id)a3 inMap:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 sourceIdentifier];

  if (v7)
  {
    uint64_t v8 = [v5 sourceIdentifier];
    uint64_t v7 = [v6 objectForKey:v8];

    if (!v7)
    {
      uint64_t v7 = [[CUIKGroupInfo alloc] initWithSource:v5];
      [(CUIKGroupInfo *)v7 setSelected:0];
      uint64_t v9 = [v5 sourceIdentifier];
      [v6 setObject:v7 forKey:v9];
    }
  }

  return v7;
}

+ (void)_insertStore:(id)a3 intoByGroupArray:(id)a4
{
  id v5 = a4;
  id v9 = a3;
  unint64_t v6 = [v5 count];
  unint64_t v7 = objc_msgSend(v5, "indexOfObject:inSortedRange:options:usingComparator:", v9, 0, v6, 1024, &__block_literal_global_7);
  if (v6 >= v7) {
    unint64_t v8 = v7;
  }
  else {
    unint64_t v8 = v6;
  }
  [v5 insertObject:v9 atIndex:v8];
}

uint64_t __60__CUIKCalendarAccountGrouper__insertStore_intoByGroupArray___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 sortOrder];
  if (v6 >= (int)[v5 sortOrder])
  {
    int v8 = [v4 sortOrder];
    if (v8 <= (int)[v5 sortOrder])
    {
      id v9 = [v4 title];
      v10 = [v5 title];
      uint64_t v7 = [v9 compare:v10];
    }
    else
    {
      uint64_t v7 = 1;
    }
  }
  else
  {
    uint64_t v7 = -1;
  }

  return v7;
}

+ (id)generateGroupsForCalendars:(id)a3 eventStore:(id)a4 entityType:(unint64_t)a5 forMode:(int64_t)a6 usingBackgroundColor:(id)a7 includingAccountsWithoutCalendars:(BOOL)a8 filterByFocus:(BOOL)a9 usingUnselectedCalendars:(id)a10 foundRefreshableCalendar:(BOOL *)a11 anyGroupsHiddenByFocus:(BOOL *)a12 numberOfCalendarsHiddenByFocus:(int64_t *)a13
{
  BOOL v13 = a8;
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a4;
  id v57 = a7;
  id v58 = a10;
  v53 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v19 = [MEMORY[0x1E4F1CA60] dictionary];
  v60 = [MEMORY[0x1E4F1CA60] dictionary];
  if (v13)
  {
    uint64_t v20 = [v18 sources];
    [a1 _populateGroups:v19 forNonDelegateSources:v20];
  }
  if (v58) {
    BOOL v21 = a9;
  }
  else {
    BOOL v21 = 0;
  }
  BOOL v62 = v21;
  if (v21)
  {
    v59 = [MEMORY[0x1E4F1CA80] set];
    uint64_t v22 = [MEMORY[0x1E4F1CA80] set];
  }
  else
  {
    uint64_t v22 = 0;
    v59 = 0;
  }
  v52 = (void *)v22;
  v54 = v18;
  v55 = (void *)v19;
  id v65 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  id obj = v17;
  uint64_t v23 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
  if (!v23)
  {
    int v56 = 0;
    goto LABEL_70;
  }
  uint64_t v24 = v23;
  int v56 = 0;
  uint64_t v25 = *(void *)v73;
  do
  {
    for (uint64_t i = 0; i != v24; ++i)
    {
      if (*(void *)v73 != v25) {
        objc_enumerationMutation(obj);
      }
      v27 = *(void **)(*((void *)&v72 + 1) + 8 * i);
      if (a5)
      {
        if (a5 == 1)
        {
          int v28 = [*(id *)(*((void *)&v72 + 1) + 8 * i) allowReminders];
          if (a11)
          {
            if (v28) {
              goto LABEL_21;
            }
          }
        }
      }
      else
      {
        char v29 = [*(id *)(*((void *)&v72 + 1) + 8 * i) allowEvents];
        if (a11 && (v29 & 1) != 0) {
LABEL_21:
        }
          *a11 = 1;
      }
      v30 = [v27 source];
      if ([v30 sourceType] == 6)
      {
        v31 = [v30 externalID];
        id v32 = [v65 objectForKeyedSubscript:v31];

        if (!v32)
        {
          id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
          v33 = [v30 externalID];
          [v65 setObject:v32 forKeyedSubscript:v33];
        }
        v34 = [v27 externalID];
        v35 = [v32 objectForKeyedSubscript:v34];

        if (v35)
        {
          [(CUIKCalendarInfo *)v35 addCalendar:v27];
          goto LABEL_66;
        }
      }
      else
      {
        id v32 = 0;
      }
      v35 = [[CUIKCalendarInfo alloc] initWithCalendar:v27];
      if (v32)
      {
        v36 = [v27 externalID];
        [v32 setObject:v35 forKeyedSubscript:v36];
      }
      if (a6 == 1)
      {
        v37 = [v30 constraints];
        int v38 = [v37 prohibitsICSImport];

        if (v38) {
          [(CUIKCalendarInfo *)v35 setIsEnabled:0];
        }
      }
      if ([v30 sourceType] == 6
        && [MEMORY[0x1E4F25490] isReminderAppLocked])
      {
        [(CUIKCalendarInfo *)v35 setIsEnabled:0];
      }
      if (!v35 || ([v27 isHidden] & 1) != 0) {
        goto LABEL_66;
      }
      if (!a5)
      {
        v39 = [v30 constraints];
        int v40 = [v39 allowsEvents];
        goto LABEL_42;
      }
      if (a5 == 1)
      {
        v39 = [v30 constraints];
        int v40 = [v39 allowsTasks];
LABEL_42:
        int v41 = v40;

        goto LABEL_44;
      }
      int v41 = 0;
LABEL_44:
      if ([(CUIKCalendarInfo *)v35 customGroupType])
      {
        uint64_t v42 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[CUIKCalendarInfo customGroupType](v35, "customGroupType"));
        goto LABEL_51;
      }
      if (v30) {
        int v43 = v41;
      }
      else {
        int v43 = 0;
      }
      if (v43 == 1)
      {
        uint64_t v42 = [v30 sourceIdentifier];
LABEL_51:
        v44 = (void *)v42;
        if (v42)
        {
          [v59 addObject:v42];
        }
      }
      if (v62)
      {
        if ([v58 containsObject:v27])
        {
          [(CUIKCalendarInfo *)v35 setFilteredByFocus:1];
          if (a13)
          {
            ++v56;
            goto LABEL_66;
          }
        }
      }
      if ([(CUIKCalendarInfo *)v35 customGroupType])
      {
        uint64_t v45 = objc_msgSend(a1, "_groupForCustomGroupType:inMap:", -[CUIKCalendarInfo customGroupType](v35, "customGroupType"), v60);
      }
      else
      {
        if (v30) {
          int v46 = v41;
        }
        else {
          int v46 = 0;
        }
        if (v46 != 1) {
          goto LABEL_66;
        }
        uint64_t v45 = [a1 _groupForSource:v30 inMap:v55];
      }
      v47 = (void *)v45;
      if (v45)
      {
        [(CUIKCalendarInfo *)v35 setSelected:0];
        v48 = [v27 displayColor];
        v49 = CUIKAdjustedColorForBackgroundColor(v48, v57);
        [(CUIKCalendarInfo *)v35 setColor:v49];

        [v47 insertCalendarInfo:v35];
      }
LABEL_66:
    }
    uint64_t v24 = [obj countByEnumeratingWithState:&v72 objects:v76 count:16];
  }
  while (v24);
LABEL_70:

  if (a13) {
    *a13 = v56;
  }
  if (a12)
  {
    uint64_t v50 = [v52 count];
    if (v50 != [v59 count]) {
      *a12 = 1;
    }
  }
  if ([v55 count])
  {
    v69[0] = MEMORY[0x1E4F143A8];
    v69[1] = 3221225472;
    v69[2] = __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke;
    v69[3] = &unk_1E636A3A8;
    id v71 = a1;
    id v70 = v53;
    [v55 enumerateKeysAndObjectsUsingBlock:v69];
  }
  if ([v60 count])
  {
    v66[0] = MEMORY[0x1E4F143A8];
    v66[1] = 3221225472;
    v66[2] = __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke_2;
    v66[3] = &unk_1E636A3A8;
    id v68 = a1;
    id v67 = v53;
    [v60 enumerateKeysAndObjectsUsingBlock:v66];
  }

  return v53;
}

uint64_t __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) _insertStore:a3 intoByGroupArray:*(void *)(a1 + 32)];
}

uint64_t __260__CUIKCalendarAccountGrouper_generateGroupsForCalendars_eventStore_entityType_forMode_usingBackgroundColor_includingAccountsWithoutCalendars_filterByFocus_usingUnselectedCalendars_foundRefreshableCalendar_anyGroupsHiddenByFocus_numberOfCalendarsHiddenByFocus___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 40) _insertStore:a3 intoByGroupArray:*(void *)(a1 + 32)];
}

+ (id)eligibleCalendarsForMovingEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 calendar];
  id v5 = [v4 source];

  int v6 = +[CUIKAccountsController sharedInstance];
  int v7 = [v6 sourceIsManaged:v5];

  int v8 = [v3 attachments];
  uint64_t v9 = [v8 count];

  int v10 = [v3 isNew];
  int v11 = [v5 isDelegate];
  uint64_t v12 = 0;
  if (v9) {
    int v13 = v10;
  }
  else {
    int v13 = 1;
  }
  v14 = v5;
  if (!v11 && v13)
  {
    if (v10)
    {
      int v15 = v7;
      if (!v9)
      {
        v14 = 0;
        uint64_t v12 = 0;
        goto LABEL_16;
      }
    }
    else
    {
      int v15 = [v3 hasAttendees];
    }
    int v16 = v15 | v10 ^ 1;
    if (!v9) {
      int v16 = 1;
    }
    if (v15) {
      v14 = v5;
    }
    else {
      v14 = 0;
    }
    uint64_t v12 = (v16 | v7) ^ 1u;
  }
LABEL_16:
  id v17 = [v3 eventStore];
  id v18 = +[CUIKCalendarAccountGrouper calendarsLimitedToSource:v14 writability:2 onlyUnmanagedAccounts:v12 forEvent:v3 entityType:0 inEventStore:v17];

  return v18;
}

+ (id)calendarsLimitedToSource:(id)a3 writability:(int64_t)a4 onlyUnmanagedAccounts:(BOOL)a5 forEvent:(id)a6 entityType:(unint64_t)a7 inEventStore:(id)a8
{
  BOOL v11 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a8;
  if (a6)
  {
    id v21 = a6;
    int v16 = (void *)MEMORY[0x1E4F1C978];
    id v17 = a6;
    id v18 = [v16 arrayWithObjects:&v21 count:1];
  }
  else
  {
    id v18 = (void *)MEMORY[0x1E4F1CBF0];
  }
  uint64_t v19 = objc_msgSend(a1, "calendarsLimitedToSource:writability:onlyUnmanagedAccounts:forEvents:entityType:inEventStore:", v14, a4, v11, v18, a7, v15, v21, v22);

  return v19;
}

+ (id)calendarsLimitedToSource:(id)a3 writability:(int64_t)a4 onlyUnmanagedAccounts:(BOOL)a5 forEvents:(id)a6 entityType:(unint64_t)a7 inEventStore:(id)a8
{
  id v13 = a3;
  id v14 = a6;
  id v15 = a8;
  int v16 = v15;
  unint64_t v17 = a4 - 1;
  BOOL v18 = a4 == 1;
  BOOL v19 = (unint64_t)(a4 - 1) < 2;
  if (v13)
  {
    if (v17 > 1)
    {
      uint64_t v20 = [v13 calendarsForEntityType:a7];
    }
    else
    {
      uint64_t v20 = [v13 readWriteCalendarsForEntityType:a7];
      if ([v14 count])
      {
        id v21 = (void *)MEMORY[0x1E4F28F60];
        v39[0] = MEMORY[0x1E4F143A8];
        v39[1] = 3221225472;
        v39[2] = __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke;
        v39[3] = &unk_1E636A3D0;
        id v40 = v14;
        BOOL v41 = a4 == 1;
        uint64_t v22 = [v21 predicateWithBlock:v39];
        uint64_t v23 = [v20 filteredSetUsingPredicate:v22];

        uint64_t v20 = (void *)v23;
      }
    }
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CAD0];
    if (v17 > 1)
    {
      v30 = [v15 calendarsForEntityType:a7];
      v26 = [v24 setWithArray:v30];
    }
    else
    {
      uint64_t v25 = [v15 readWriteCalendarsForEntityType:a7];
      v26 = [v24 setWithArray:v25];

      if ([v14 count])
      {
        v27 = (void *)MEMORY[0x1E4F28F60];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_2;
        v36[3] = &unk_1E636A3D0;
        id v37 = v14;
        BOOL v38 = v18;
        int v28 = [v27 predicateWithBlock:v36];
        uint64_t v29 = [v26 filteredSetUsingPredicate:v28];

        v26 = (void *)v29;
      }
    }
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_3;
    v33[3] = &__block_descriptor_34_e37_B24__0__EKCalendar_8__NSDictionary_16l;
    BOOL v34 = v19;
    BOOL v35 = a5;
    v31 = [MEMORY[0x1E4F28F60] predicateWithBlock:v33];
    uint64_t v20 = [v26 filteredSetUsingPredicate:v31];
  }

  return v20;
}

uint64_t __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v10 = *(unsigned __int8 *)(a1 + 40);
        BOOL v11 = objc_msgSend(v9, "calendar", (void)v16);
        if (v10)
        {
          char v12 = [v9 canMoveOrCopyToCalendar:v3 fromCalendar:v11 error:0];

          if ((v12 & 1) == 0) {
            goto LABEL_13;
          }
        }
        else
        {
          int v13 = [v9 canMoveToCalendar:v3 fromCalendar:v11 error:0];

          if (!v13)
          {
LABEL_13:
            uint64_t v14 = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_14:

  return v14;
}

uint64_t __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        int v10 = *(unsigned __int8 *)(a1 + 40);
        BOOL v11 = objc_msgSend(v9, "calendar", (void)v16);
        if (v10)
        {
          char v12 = [v9 canMoveOrCopyToCalendar:v3 fromCalendar:v11 error:0];

          if ((v12 & 1) == 0) {
            goto LABEL_13;
          }
        }
        else
        {
          int v13 = [v9 canMoveToCalendar:v3 fromCalendar:v11 error:0];

          if (!v13)
          {
LABEL_13:
            uint64_t v14 = 0;
            goto LABEL_14;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  uint64_t v14 = 1;
LABEL_14:

  return v14;
}

uint64_t __123__CUIKCalendarAccountGrouper_calendarsLimitedToSource_writability_onlyUnmanagedAccounts_forEvents_entityType_inEventStore___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = [a2 source];
  if (([v3 isDelegate] & 1) != 0 || *(unsigned char *)(a1 + 32) && objc_msgSend(v3, "sourceType") == 6)
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = +[CUIKAccountsController sharedInstance];
    int v6 = [v5 sourceIsManaged:v3];

    if (*(unsigned char *)(a1 + 33)) {
      uint64_t v4 = v6 ^ 1u;
    }
    else {
      uint64_t v4 = 1;
    }
  }

  return v4;
}

@end