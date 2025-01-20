@interface CLSSocialServiceCalendar
+ (BOOL)_isCalendarRelevant:(id)a3;
+ (BOOL)_isEventInMeetingRoom:(id)a3;
+ (BOOL)eventAtLocation:(id)a3 withAttendeeNames:(id)a4 matchesClueCollection:(id)a5;
+ (BOOL)shouldKeepEvent:(id)a3 withClueCollection:(id)a4;
+ (id)relevantCalendars:(id)a3;
- (BOOL)_hasAlreadyPrefetchedEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4;
- (BOOL)_sortedAssetCollections:(id)a3 containsEvent:(id)a4;
- (CLSSocialServiceCalendar)init;
- (id)_fullNameWithContact:(id)a3;
- (id)eventFromProxyEvent:(id)a3;
- (id)eventsForClueCollection:(id)a3;
- (id)eventsForDates:(id)a3;
- (id)meContact;
- (id)personsFromEventParticipants:(id)a3 excludeCurrentUser:(BOOL)a4 serviceManager:(id)a5;
- (id)workCalendarEventsMatchingContactIdentifiers:(id)a3 fromUniversalDate:(id)a4 toUniversalDate:(id)a5 contactsService:(id)a6;
- (void)_enumerateEventsFromDate:(id)a3 toDate:(id)a4 fetchIfNeeded:(BOOL)a5 usingBlock:(id)a6;
- (void)enumerateEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 usingBlock:(id)a5;
- (void)invalidateMemoryCaches;
- (void)prefetchEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 forAssetCollectionsSortedByStartDate:(id)a5 usingBlock:(id)a6;
@end

@implementation CLSSocialServiceCalendar

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_prefetchedDateIntervals, 0);
  objc_storeStrong((id *)&self->_calendarEventsCache, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
}

- (id)personsFromEventParticipants:(id)a3 excludeCurrentUser:(BOOL)a4 serviceManager:(id)a5
{
  BOOL v6 = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v19 = [MEMORY[0x1E4F1CA80] set];
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v30;
    v18 = v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v30 != v10) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if (!v6 || (objc_msgSend(*(id *)(*((void *)&v29 + 1) + 8 * i), "isCurrentUser", v18) & 1) == 0)
        {
          uint64_t v23 = 0;
          v24 = &v23;
          uint64_t v25 = 0x3032000000;
          v26 = __Block_byref_object_copy__100;
          v27 = __Block_byref_object_dispose__101;
          v13 = objc_msgSend(v12, "emailAddress", v18);
          id v28 = [v8 personForPersonHandle:v13];

          if (!v24[5])
          {
            v14 = [v12 name];
            BOOL v15 = v14 == 0;

            if (!v15)
            {
              v16 = [v12 name];
              v21[0] = MEMORY[0x1E4F143A8];
              v21[1] = 3221225472;
              v22[0] = __91__CLSSocialServiceCalendar_personsFromEventParticipants_excludeCurrentUser_serviceManager___block_invoke;
              v22[1] = &unk_1E690FF20;
              v22[2] = &v23;
              [v8 enumeratePersonsForFullname:v16 usingBlock:v21];
            }
          }
          if (v24[5]) {
            objc_msgSend(v19, "addObject:");
          }
          _Block_object_dispose(&v23, 8);
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v9);
  }

  return v19;
}

void __91__CLSSocialServiceCalendar_personsFromEventParticipants_excludeCurrentUser_serviceManager___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  *a3 = 1;
}

- (id)workCalendarEventsMatchingContactIdentifiers:(id)a3 fromUniversalDate:(id)a4 toUniversalDate:(id)a5 contactsService:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  v12 = (objc_class *)MEMORY[0x1E4F25550];
  id v13 = a6;
  id v14 = a3;
  id v15 = objc_alloc_init(v12);
  v16 = [v13 contactsForIdentifiers:v14];

  if ([v16 count])
  {
    v17 = [(id)objc_opt_class() relevantCalendars:v15];
    v18 = [MEMORY[0x1E4F1CA80] set];
    id v19 = [v16 allObjects];
    v20 = [v15 predicateForEventsWithStartDate:v10 endDate:v11 calendars:v17 matchingContacts:v19];

    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __123__CLSSocialServiceCalendar_workCalendarEventsMatchingContactIdentifiers_fromUniversalDate_toUniversalDate_contactsService___block_invoke;
    v25[3] = &unk_1E690EA10;
    v25[4] = self;
    id v21 = v18;
    id v26 = v21;
    [v15 enumerateEventsMatchingPredicate:v20 usingBlock:v25];
    v22 = v26;
    id v23 = v21;
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1CAD0] set];
  }

  return v23;
}

void __123__CLSSocialServiceCalendar_workCalendarEventsMatchingContactIdentifiers_fromUniversalDate_toUniversalDate_contactsService___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = (void *)MEMORY[0x1D2602300]();
  v4 = [[CLSEKEvent alloc] initWithEKEvent:v5];
  if ([(id)objc_opt_class() _isEventInMeetingRoom:v4]) {
    [*(id *)(a1 + 40) addObject:v4];
  }
}

- (id)eventsForClueCollection:(id)a3
{
  id v4 = a3;
  id v5 = [v4 universalStartDate];
  uint64_t v6 = [v4 universalEndDate];
  id v7 = (void *)v6;
  id v8 = 0;
  if (v5 && v6)
  {
    uint64_t v9 = [MEMORY[0x1E4F1CA48] array];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __52__CLSSocialServiceCalendar_eventsForClueCollection___block_invoke;
    v13[3] = &unk_1E690E9E8;
    v13[4] = self;
    id v14 = v4;
    id v10 = v9;
    id v15 = v10;
    [(CLSSocialServiceCalendar *)self _enumerateEventsFromDate:v5 toDate:v7 fetchIfNeeded:1 usingBlock:v13];
    id v11 = v15;
    id v8 = v10;
  }
  return v8;
}

void __52__CLSSocialServiceCalendar_eventsForClueCollection___block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if (v4
    && [(id)objc_opt_class() shouldKeepEvent:v4 withClueCollection:*(void *)(a1 + 40)])
  {
    v3 = [*(id *)(a1 + 32) eventFromProxyEvent:v4];
    [*(id *)(a1 + 48) addObject:v3];
  }
}

- (void)_enumerateEventsFromDate:(id)a3 toDate:(id)a4 fetchIfNeeded:(BOOL)a5 usingBlock:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  if (v11)
  {
    if ([(CLSSocialServiceCalendar *)self _hasAlreadyPrefetchedEventsFromUniversalDate:v9 toUniversalDate:v10])
    {
      calendarEventsCache = self->_calendarEventsCache;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke;
      v16[3] = &unk_1E690E998;
      id v13 = &v17;
      id v17 = v11;
      [(CLSCalendarEventsCache *)calendarEventsCache enumerateEventsFromStartDate:v9 toEndDate:v10 usingBlock:v16];
    }
    else
    {
      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke_2;
      v14[3] = &unk_1E690E9C0;
      id v13 = &v15;
      id v15 = v11;
      [(CLSSocialServiceCalendar *)self prefetchEventsFromUniversalDate:v9 toUniversalDate:v10 forAssetCollectionsSortedByStartDate:0 usingBlock:v14];
    }
  }
}

void __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  uint64_t v6 = (void *)MEMORY[0x1D2602300]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

void __85__CLSSocialServiceCalendar__enumerateEventsFromDate_toDate_fetchIfNeeded_usingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v4 = a2;
  v3 = (void *)MEMORY[0x1D2602300]();
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (void)enumerateEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 usingBlock:(id)a5
{
}

- (void)prefetchEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4 forAssetCollectionsSortedByStartDate:(id)a5 usingBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  context = (void *)MEMORY[0x1D2602300]();
  id v14 = (void *)[objc_alloc(MEMORY[0x1E4F28C18]) initWithStartDate:v10 endDate:v11];
  id v15 = self->_prefetchedDateIntervals;
  objc_sync_enter(v15);
  [(NSMutableSet *)self->_prefetchedDateIntervals addObject:v14];
  objc_sync_exit(v15);

  id v16 = objc_alloc_init(MEMORY[0x1E4F25550]);
  id v17 = [(id)objc_opt_class() relevantCalendars:v16];
  v18 = [v16 predicateForNonrecurringEventsWithStartDate:v10 endDate:v11 calendars:v17];
  uint64_t v29 = 0;
  long long v30 = &v29;
  uint64_t v31 = 0x2020000000;
  uint64_t v32 = 0;
  uint64_t v32 = MEMORY[0x1D2602300]();
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x2020000000;
  v28[3] = 0;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __124__CLSSocialServiceCalendar_prefetchEventsFromUniversalDate_toUniversalDate_forAssetCollectionsSortedByStartDate_usingBlock___block_invoke;
  void v22[3] = &unk_1E690E970;
  BOOL v27 = v12 != 0;
  v22[4] = self;
  id v19 = v12;
  id v23 = v19;
  id v20 = v13;
  id v24 = v20;
  uint64_t v25 = v28;
  id v26 = &v29;
  [v16 enumerateEventsMatchingPredicate:v18 usingBlock:v22];

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v29, 8);
}

void __124__CLSSocialServiceCalendar_prefetchEventsFromUniversalDate_toUniversalDate_forAssetCollectionsSortedByStartDate_usingBlock___block_invoke(uint64_t a1, void *a2, unsigned char *a3)
{
  id v9 = a2;
  if (!*(unsigned char *)(a1 + 72)
    || [*(id *)(a1 + 32) _sortedAssetCollections:*(void *)(a1 + 40) containsEvent:v9])
  {
    id v5 = [[CLSEKEvent alloc] initWithEKEvent:v9];
    if (v5 && [(id)objc_opt_class() shouldKeepEvent:v5 withClueCollection:0])
    {
      [*(id *)(*(void *)(a1 + 32) + 24) insertEvent:v5];
      goto LABEL_8;
    }
  }
  id v5 = 0;
LABEL_8:
  uint64_t v6 = *(void *)(a1 + 48);
  if (v6) {
    (*(void (**)(uint64_t, CLSEKEvent *, unsigned char *))(v6 + 16))(v6, v5, a3);
  }
  if (!*a3)
  {
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v8 = *(void *)(v7 + 24) + 1;
    *(void *)(v7 + 24) = v8;
    if (__ROR8__(0x8F5C28F5C28F5C29 * v8, 2) <= 0x28F5C28F5C28F5CuLL)
    {
      *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = MEMORY[0x1D2602300]();
    }
  }
}

- (BOOL)_hasAlreadyPrefetchedEventsFromUniversalDate:(id)a3 toUniversalDate:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self->_prefetchedDateIntervals;
  objc_sync_enter(v8);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v9 = self->_prefetchedDateIntervals;
  uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v13, "containsDate:", v6, (void)v15)
          && ([v13 containsDate:v7] & 1) != 0)
        {
          LOBYTE(v10) = 1;
          goto LABEL_12;
        }
      }
      uint64_t v10 = [(NSMutableSet *)v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  objc_sync_exit(v8);
  return v10;
}

- (BOOL)_sortedAssetCollections:(id)a3 containsEvent:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 startDate];
  uint64_t v8 = [v5 endDate];

  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __66__CLSSocialServiceCalendar__sortedAssetCollections_containsEvent___block_invoke;
  v13[3] = &unk_1E690E948;
  id v14 = v7;
  id v15 = v8;
  id v9 = v8;
  id v10 = v7;
  uint64_t v11 = [v6 indexOfObjectWithOptions:1 passingTest:v13];

  return v11 != 0x7FFFFFFFFFFFFFFFLL;
}

BOOL __66__CLSSocialServiceCalendar__sortedAssetCollections_containsEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = a2;
  id v7 = [v6 startDate];
  uint64_t v8 = [v6 endDate];

  id v9 = *(void **)(a1 + 32);
  id v10 = *(id *)(a1 + 40);
  id v11 = v9;
  [v7 timeIntervalSinceReferenceDate];
  double v13 = v12;
  [v8 timeIntervalSinceReferenceDate];
  double v15 = v14;
  [v11 timeIntervalSinceReferenceDate];
  double v17 = v16;
  [v10 timeIntervalSinceReferenceDate];
  double v19 = v18;

  BOOL v20 = v15 >= v17 && v13 <= v19;
  if (v20) {
    *a4 = 1;
  }
  return v20;
}

- (void)invalidateMemoryCaches
{
  v3 = [MEMORY[0x1E4F1CA80] set];
  prefetchedDateIntervals = self->_prefetchedDateIntervals;
  self->_prefetchedDateIntervals = v3;

  self->_calendarEventsCache = objc_alloc_init(CLSCalendarEventsCache);
  MEMORY[0x1F41817F8]();
}

- (id)eventsForDates:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    id v6 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [v5 sortedArrayUsingSelector:sel_compare_];
    uint64_t v8 = [v7 firstObject];
    id v9 = [v7 lastObject];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __43__CLSSocialServiceCalendar_eventsForDates___block_invoke;
    v13[3] = &unk_1E690E8A8;
    id v10 = v6;
    id v14 = v10;
    double v15 = self;
    [(CLSSocialServiceCalendar *)self _enumerateEventsFromDate:v8 toDate:v9 fetchIfNeeded:1 usingBlock:v13];

    id v11 = v10;
  }
  else
  {
    id v11 = 0;
  }

  return v11;
}

void __43__CLSSocialServiceCalendar_eventsForDates___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    v2 = *(void **)(a1 + 32);
    id v3 = [*(id *)(a1 + 40) eventFromProxyEvent:a2];
    [v2 addObject:v3];
  }
}

- (id)eventFromProxyEvent:(id)a3
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(CLSSocialServiceCalendar *)self meContact];
  id v6 = objc_alloc_init(CLSEvent);
  id v7 = [v4 title];
  [(CLSEvent *)v6 setTitle:v7];

  uint64_t v8 = [v4 startDate];
  [(CLSEvent *)v6 setStartDate:v8];

  id v9 = [v4 endDate];
  v52 = v6;
  [(CLSEvent *)v6 setEndDate:v9];

  v54 = [MEMORY[0x1E4F1CA48] array];
  unsigned int v10 = (v5 != 0) & ~[v4 hasAttendees];
  if (v10 == 1)
  {
    id v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithObjectsAndKeys:", v5, @"person", 0);
    double v12 = [v5 emailAddresses];
    double v13 = [MEMORY[0x1E4F1B910] stringFromContact:v5 style:0];
    if ([v12 count])
    {
      id v14 = [v12 anyObject];
      [v11 setObject:v14 forKeyedSubscript:@"email"];
    }
    if (v13) {
      [v11 setObject:v13 forKeyedSubscript:@"name"];
    }
    [v54 addObject:v11];
  }
  long long v63 = 0u;
  long long v64 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  v53 = v4;
  double v15 = [v4 attendees];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v61 objects:v66 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v62 != v18) {
          objc_enumerationMutation(v15);
        }
        BOOL v20 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        if ([v20 participantStatus] == 2)
        {
          id v21 = [MEMORY[0x1E4F1CA60] dictionary];
          v22 = [v20 emailAddress];

          if (v22)
          {
            id v23 = [v20 emailAddress];
            [v21 setObject:v23 forKeyedSubscript:@"email"];
          }
          id v24 = [v20 name];

          if (v24)
          {
            uint64_t v25 = [v20 name];
            [v21 setObject:v25 forKeyedSubscript:@"name"];
          }
          if ([v20 isCurrentUser] && v5)
          {
            if (v10)
            {
              LOBYTE(v10) = 1;
LABEL_24:

              continue;
            }
            [v21 setObject:v5 forKeyedSubscript:@"person"];
            LOBYTE(v10) = 1;
          }
          id v26 = [v21 allKeys];
          uint64_t v27 = [v26 count];

          if (v27) {
            [v54 addObject:v21];
          }
          goto LABEL_24;
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v61 objects:v66 count:16];
    }
    while (v17);
  }

  id v28 = v53;
  uint64_t v29 = [v53 calendar];
  int v30 = [v29 hasSharees];

  if (!v30) {
    goto LABEL_47;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v31 = [v53 calendar];
  uint64_t v32 = [v31 shareesAndOwner];

  uint64_t v33 = [v32 countByEnumeratingWithState:&v57 objects:v65 count:16];
  if (!v33) {
    goto LABEL_46;
  }
  uint64_t v34 = v33;
  uint64_t v35 = *(void *)v58;
  do
  {
    for (uint64_t j = 0; j != v34; ++j)
    {
      if (*(void *)v58 != v35) {
        objc_enumerationMutation(v32);
      }
      v37 = *(void **)(*((void *)&v57 + 1) + 8 * j);
      v38 = [MEMORY[0x1E4F1CA60] dictionary];
      v39 = [v37 emailAddress];

      if (v39)
      {
        v40 = [v37 emailAddress];
        [v38 setObject:v40 forKeyedSubscript:@"email"];
      }
      v41 = [v37 name];

      if (v41)
      {
        v42 = [v37 name];
        [v38 setObject:v42 forKeyedSubscript:@"name"];
      }
      if (([v37 isCurrentUserForScheduling] & 1) != 0
        || [v37 isCurrentUserForSharing])
      {
        if (v10 & 1 | (v5 == 0)) {
          goto LABEL_44;
        }
        [v38 setObject:v5 forKeyedSubscript:@"person"];
        LOBYTE(v10) = 1;
      }
      else
      {
        v43 = [v37 name];
        [v38 setObject:v43 forKeyedSubscript:@"person"];
      }
      v44 = [v38 allKeys];
      uint64_t v45 = [v44 count];

      if (v45) {
        [v54 addObject:v38];
      }
LABEL_44:
    }
    uint64_t v34 = [v32 countByEnumeratingWithState:&v57 objects:v65 count:16];
  }
  while (v34);
LABEL_46:

  id v28 = v53;
LABEL_47:
  [(CLSEvent *)v52 setAttendees:v54];
  v46 = [v28 geoLocation];
  if (v46) {
    [(CLSEvent *)v52 setLocation:v46];
  }
  v47 = [v28 attendees];
  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __48__CLSSocialServiceCalendar_eventFromProxyEvent___block_invoke;
  v55[3] = &unk_1E690E880;
  v48 = v52;
  v56 = v48;
  [v47 enumerateObjectsUsingBlock:v55];

  -[CLSEvent setOrganizedByMe:](v48, "setOrganizedByMe:", [v28 organizedByMe]);
  v49 = [v28 selfAttendee];
  if (v49)
  {
    v50 = [v28 selfAttendee];
    -[CLSEvent setAccepted:](v48, "setAccepted:", [v50 participantStatus] == 2);
  }
  else
  {
    -[CLSEvent setAccepted:](v48, "setAccepted:", [v28 hasAttendees] ^ 1);
  }

  return v48;
}

uint64_t __48__CLSSocialServiceCalendar_eventFromProxyEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 participantType];
  if (result == 2)
  {
    uint64_t result = [*(id *)(a1 + 32) setMeetingRoom:1];
    *a4 = 1;
  }
  return result;
}

- (id)_fullNameWithContact:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
  v12[0] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
  int v6 = [v3 areKeysAvailable:v5];

  if (v6)
  {
    id v7 = [MEMORY[0x1E4F1B910] stringFromContact:v3 style:0];
  }
  else
  {
    uint64_t v8 = NSString;
    id v9 = [v3 givenName];
    unsigned int v10 = [v3 familyName];
    id v7 = [v8 stringWithFormat:@"%@ %@", v9, v10];
  }
  return v7;
}

- (id)meContact
{
  v13[2] = *MEMORY[0x1E4F143B8];
  contactStore = self->_contactStore;
  if (contactStore)
  {
    id v4 = contactStore;
    objc_sync_enter(v4);
    if (!self->_meContact)
    {
      id v5 = self->_contactStore;
      int v6 = [MEMORY[0x1E4F1B910] descriptorForRequiredKeysForStyle:0];
      uint64_t v7 = *MEMORY[0x1E4F1ADC8];
      v13[0] = v6;
      v13[1] = v7;
      uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
      id v9 = [(CNContactStore *)v5 _ios_meContactWithKeysToFetch:v8 error:0];

      meContact = self->_meContact;
      self->_meContact = v9;
    }
    objc_sync_exit(v4);
  }
  id v11 = self->_meContact;
  return v11;
}

- (CLSSocialServiceCalendar)init
{
  v10.receiver = self;
  v10.super_class = (Class)CLSSocialServiceCalendar;
  v2 = [(CLSSocialServiceCalendar *)&v10 init];
  if (v2)
  {
    if (+[CLSSocialServiceContacts canAccessContactsStore])
    {
      id v3 = (CNContactStore *)objc_alloc_init(MEMORY[0x1E4F1B980]);
      contactStore = v2->_contactStore;
      v2->_contactStore = v3;
    }
    uint64_t v5 = [MEMORY[0x1E4F1CA80] set];
    prefetchedDateIntervals = v2->_prefetchedDateIntervals;
    v2->_prefetchedDateIntervals = (NSMutableSet *)v5;

    uint64_t v7 = objc_alloc_init(CLSCalendarEventsCache);
    calendarEventsCache = v2->_calendarEventsCache;
    v2->_calendarEventsCache = v7;
  }
  return v2;
}

+ (BOOL)eventAtLocation:(id)a3 withAttendeeNames:(id)a4 matchesClueCollection:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v34 = 0;
  uint64_t v35 = &v34;
  uint64_t v36 = 0x2020000000;
  char v37 = 0;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke;
  v31[3] = &unk_1E690E920;
  id v10 = v8;
  id v32 = v10;
  uint64_t v33 = &v34;
  [v9 enumeratePeopleClues:v31];
  if (!v7)
  {
    char v23 = 0;
LABEL_14:
    if (*((unsigned char *)v35 + 24)) {
      BOOL v24 = 1;
    }
    else {
      BOOL v24 = v23;
    }
    goto LABEL_17;
  }
  id v11 = [v9 locations];
  uint64_t v26 = [v11 count];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = v11;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v38 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v28;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v28 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        [v7 coordinate];
        double v18 = v17;
        double v20 = v19;
        [v16 coordinate];
        if (+[CLSNewLocationInformant location:isCloseToLocation:](CLSNewLocationInformant, "location:isCloseToLocation:", v18, v20, v21, v22))
        {

          char v23 = 1;
          goto LABEL_14;
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v27 objects:v38 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  char v23 = 0;
  BOOL v24 = 0;
  if (!v26) {
    goto LABEL_14;
  }
LABEL_17:

  _Block_object_dispose(&v34, 8);
  return v24;
}

void __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  int v6 = [a2 person];
  id v7 = v6;
  if (v6)
  {
    uint64_t v8 = [v6 fullName];
    if (v8)
    {
      id v9 = (void *)v8;
      char v10 = [v7 isMe];

      if ((v10 & 1) == 0)
      {
        id v11 = *(void **)(a1 + 32);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke_2;
        v14[3] = &unk_1E690E8F8;
        id v12 = v7;
        uint64_t v13 = *(void *)(a1 + 40);
        id v15 = v12;
        uint64_t v16 = v13;
        [v11 enumerateObjectsUsingBlock:v14];
      }
    }
  }
  *a4 = *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
}

void __84__CLSSocialServiceCalendar_eventAtLocation_withAttendeeNames_matchesClueCollection___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v8 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    int v6 = [*(id *)(a1 + 32) fullName];
    uint64_t v7 = [v8 rangeOfString:v6 options:129];

    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
      *a4 = 1;
    }
  }
}

+ (BOOL)shouldKeepEvent:(id)a3 withClueCollection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 selfAttendee];
  if (v8)
  {
    id v9 = [v6 selfAttendee];
    if ([v9 participantStatus] == 2) {
      int v10 = 0;
    }
    else {
      int v10 = [v6 organizedByMe] ^ 1;
    }
  }
  else
  {
    int v10 = 0;
  }

  int v11 = [a1 _isEventInMeetingRoom:v6] | v10;
  char v12 = v11 ^ 1;
  if (v7 && (v11 & 1) == 0)
  {
    uint64_t v13 = [v6 attendees];
    uint64_t v14 = [v13 valueForKey:@"name"];

    id v15 = objc_opt_class();
    uint64_t v16 = [v6 geoLocation];
    char v12 = [v15 eventAtLocation:v16 withAttendeeNames:v14 matchesClueCollection:v7];
  }
  char v17 = [v6 isSuggestedAndAccepted];
  char v18 = [v6 isBirthday];
  double v19 = [v6 endDate];
  [v19 timeIntervalSinceReferenceDate];
  double v21 = v20;
  double v22 = [v6 startDate];
  [v22 timeIntervalSinceReferenceDate];
  double v24 = v23;

  if (([v6 hasRecurrenceRules] & 1) != 0 || objc_msgSend(v6, "isAllDay", v21 - v24)) {
    BOOL v25 = 0;
  }
  else {
    BOOL v25 = (v21 - v24 <= 21600.0) & ~v18 & (v17 | v12);
  }

  return v25;
}

+ (BOOL)_isEventInMeetingRoom:(id)a3
{
  id v3 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  id v4 = [v3 attendees];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__CLSSocialServiceCalendar__isEventInMeetingRoom___block_invoke;
  v6[3] = &unk_1E690E8D0;
  v6[4] = &v7;
  [v4 enumerateObjectsUsingBlock:v6];

  LOBYTE(v4) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)v4;
}

uint64_t __50__CLSSocialServiceCalendar__isEventInMeetingRoom___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = [a2 participantType];
  if (result == 2)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (id)relevantCalendars:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = [a3 calendarsForEntityType:0];
  uint64_t v5 = [MEMORY[0x1E4F1CA48] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        if (objc_msgSend(a1, "_isCalendarRelevant:", v11, (void)v13)) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

+ (BOOL)_isCalendarRelevant:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isFacebookBirthdayCalendar] & 1) == 0
    && ([v3 isSubscribed] & 1) == 0
    && ([v3 isSubscribedHolidayCalendar] & 1) == 0
    && [v3 type] != 4;

  return v4;
}

@end