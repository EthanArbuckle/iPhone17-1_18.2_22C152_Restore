@interface CUIKOccurrenceCacheDataSource
- (BOOL)cachedOccurrencesAreLoaded;
- (BOOL)supportsFakeTodaySection;
- (BOOL)supportsInvitations;
- (CUIKOccurrenceCacheDataSource)initWithEventStore:(id)a3 calendars:(id)a4;
- (id)_cachedDays;
- (id)_cachedOccurrenceAtIndexPath:(id)a3;
- (id)_createCachedDays;
- (id)_mutableDayDictionaryAtIndex:(unint64_t)a3;
- (id)cachedOccurrenceAtIndexPath:(id)a3;
- (id)dateAtDayIndex:(int64_t)a3;
- (id)faultOccurrencesForDay:(id)a3 inOccurrencesArray:(id)a4 index:(int64_t)a5 limit:(int64_t *)a6 cacheSeed:(int)a7;
- (id)indexPathsForOccurrence:(id)a3;
- (int64_t)cachedDayCount;
- (int64_t)countOfOccurrencesAtDayIndex:(int64_t)a3;
- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3;
- (void)_fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4 background:(BOOL)a5 includeGivenSection:(BOOL)a6;
- (void)fetchDaysInBackgroundStartingFromSection:(int64_t)a3;
- (void)fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4;
- (void)invalidateCachedOccurrences;
- (void)setCachedDays:(id)a3;
@end

@implementation CUIKOccurrenceCacheDataSource

- (id)_cachedOccurrenceAtIndexPath:(id)a3
{
  id v5 = a3;
  if ([v5 length] != 2)
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2 object:self file:@"CUIKOccurrenceCacheDataSource.m" lineNumber:178 description:@"Invalid index path for use with CUIKOccurrenceCacheDataSource"];
  }
  unint64_t v6 = [v5 indexAtPosition:0];
  unint64_t v7 = [v5 indexAtPosition:1];
  v8 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  unint64_t v9 = [v8 count];

  if (v6 >= v9)
  {
    v10 = +[CUIKLogSubsystem defaultCategory];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      -[CUIKOccurrenceCacheDataSource _cachedOccurrenceAtIndexPath:]((uint64_t)v5, self);
    }
    v15 = 0;
  }
  else
  {
    v10 = [(CUIKOccurrenceCacheDataSource *)self _mutableDayDictionaryAtIndex:v6];
    v11 = [v10 objectForKey:CUIKOccurrenceCacheOccurrencesKey];
    v12 = [v10 objectForKey:CUIKOccurrenceCacheDayKey];
    v13 = [(CUIKOccurrenceCacheDataSource *)self faultOccurrencesForDay:v12 inOccurrencesArray:v11 index:v7 limit:0 cacheSeed:self->_cachedDaysSeed];

    [v10 setObject:v13 forKeyedSubscript:CUIKOccurrenceCacheOccurrencesKey];
    if (v7 >= [v13 count])
    {
      v14 = +[CUIKLogSubsystem defaultCategory];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        -[CUIKOccurrenceCacheDataSource _cachedOccurrenceAtIndexPath:]((uint64_t)v5, v13);
      }
      v15 = 0;
    }
    else
    {
      v14 = [v13 objectAtIndex:v7];
      v15 = [v14 objectForKey:CUIKOccurrenceInfoEventKey];
    }
  }

  return v15;
}

- (id)faultOccurrencesForDay:(id)a3 inOccurrencesArray:(id)a4 index:(int64_t)a5 limit:(int64_t *)a6 cacheSeed:(int)a7
{
  id v11 = a3;
  id v12 = a4;
  if (v12) {
    goto LABEL_5;
  }
  v13 = [(EKEventStore *)self->_eventStore occurrenceCacheGetOccurrencesForCalendars:self->_calendars onDay:v11];
  id v12 = v13;
  if (a6) {
    *a6 -= [v13 count];
  }
  if (v12)
  {
LABEL_5:
    if (a5 < 0)
    {
      unint64_t v15 = [v12 count];
      unint64_t v14 = v15;
      a5 = 0;
      if (a6)
      {
        if (*a6 < v15) {
          unint64_t v14 = *a6 & ~(*a6 >> 63);
        }
        *a6 -= v14;
      }
    }
    else
    {
      if ([v12 count] > (unint64_t)a5)
      {
        unint64_t v14 = a5 + 1;
LABEL_14:
        objc_opt_class();
        v25 = v12;
        id v26 = v11;
        if (objc_opt_isKindOfClass()) {
          id v16 = v12;
        }
        else {
          id v16 = (id)objc_msgSend(v12, "mutableCopy", v12);
        }
        id v12 = v16;
        v17 = self;
        if (a5 < v14)
        {
          int v27 = a7;
          do
          {
            if (v17->_cachedDaysSeed != a7) {
              break;
            }
            v18 = [v12 objectAtIndex:a5];
            v19 = [v18 objectForKey:CUIKOccurrenceInfoEventKey];
            if (!v19)
            {
              v20 = [v18 objectForKey:CUIKOccurrenceInfoObjectIDKey];
              v21 = [v18 objectForKey:CUIKOccurrenceInfoDateKey];
              v19 = [(EKEventStore *)v17->_eventStore eventForObjectID:v20 occurrenceDate:v21 checkValid:0];
              if (v19)
              {
                v22 = [v18 objectForKeyedSubscript:CUIKOccurrenceInfoNextReminderDateKey];
                if (v22) {
                  [v19 _setNextCachedReminderOccurrenceDate:v22];
                }
                v23 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithDictionary:", v18, v25);
                [v23 setObject:v19 forKey:CUIKOccurrenceInfoEventKey];
                [v12 replaceObjectAtIndex:a5 withObject:v23];

                v17 = self;
              }

              a7 = v27;
            }

            ++a5;
          }
          while (v14 != a5);
        }

        id v11 = v26;
        goto LABEL_28;
      }
      unint64_t v14 = [v12 count];
    }
    if (a5 >= v14) {
      goto LABEL_28;
    }
    goto LABEL_14;
  }
LABEL_28:

  return v12;
}

- (id)_mutableDayDictionaryAtIndex:(unint64_t)a3
{
  v4 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  if ([v4 count] <= a3)
  {
    id v6 = 0;
  }
  else
  {
    id v5 = [v4 objectAtIndexedSubscript:a3];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = v5;
    }
    else
    {
      id v6 = (id)[v5 mutableCopy];
      [v4 setObject:v6 atIndexedSubscript:a3];
    }
  }

  return v6;
}

- (id)_cachedDays
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_assert_owner(&self->_dataLock);
  os_unfair_lock_assert_not_owner(&self->_fetchLock);
  p_cachedDays = &self->_cachedDays;
  cachedDays = self->_cachedDays;
  if (!cachedDays)
  {
    os_unfair_lock_unlock(p_dataLock);
    os_unfair_lock_lock(&self->_fetchLock);
    os_unfair_lock_lock(p_dataLock);
    if (!*p_cachedDays)
    {
      os_unfair_lock_unlock(p_dataLock);
      id v6 = [(CUIKOccurrenceCacheDataSource *)self _createCachedDays];
      os_unfair_lock_lock(p_dataLock);
      if (!self->_cachedDays) {
        objc_storeStrong((id *)&self->_cachedDays, v6);
      }
    }
    os_unfair_lock_unlock(&self->_fetchLock);
    cachedDays = *p_cachedDays;
  }

  return cachedDays;
}

- (void)fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4
{
}

- (void)_fetchDaysStartingFromSection:(int64_t)a3 sectionsToLoadInBothDirections:(int64_t)a4 background:(BOOL)a5 includeGivenSection:(BOOL)a6
{
  BOOL v7 = a5;
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  int cachedDaysSeed = self->_cachedDaysSeed;
  v13 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  int64_t v14 = [v13 count];
  os_unfair_lock_unlock(p_dataLock);
  if (v14 >= a3)
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = __125__CUIKOccurrenceCacheDataSource__fetchDaysStartingFromSection_sectionsToLoadInBothDirections_background_includeGivenSection___block_invoke;
    aBlock[3] = &unk_1E636B258;
    int v19 = cachedDaysSeed;
    aBlock[4] = self;
    aBlock[5] = a3;
    aBlock[6] = a4;
    aBlock[7] = v14;
    BOOL v20 = a6;
    unint64_t v15 = _Block_copy(aBlock);
    id v16 = v15;
    if (v7)
    {
      v17 = dispatch_get_global_queue(0, 0);
      dispatch_async(v17, v16);
    }
    else
    {
      (*((void (**)(void *))v15 + 2))(v15);
    }
  }
}

void __125__CUIKOccurrenceCacheDataSource__fetchDaysStartingFromSection_sectionsToLoadInBothDirections_background_includeGivenSection___block_invoke(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 64) == *(_DWORD *)(*(void *)(a1 + 32) + 40))
  {
    uint64_t v19 = 100;
    uint64_t v2 = *(void *)(a1 + 40);
    uint64_t v3 = *(void *)(a1 + 48);
    if (v3 <= 0) {
      uint64_t v4 = 0;
    }
    else {
      uint64_t v4 = (v2 - v3) & ~((v2 - v3) >> 63);
    }
    if (v3 < 1)
    {
      uint64_t v6 = *(void *)(a1 + 56);
    }
    else
    {
      uint64_t v5 = v2 + v3;
      if (v5 + 1 < *(void *)(a1 + 56)) {
        uint64_t v6 = v5 + 1;
      }
      else {
        uint64_t v6 = *(void *)(a1 + 56);
      }
    }
    int v7 = 0;
    uint64_t v8 = v2 - *(char *)(a1 + 68);
    p_name = &OBJC_PROTOCOL___CUIKOROccurrenceState.name;
LABEL_11:
    uint64_t v10 = v2;
    while (1)
    {
      int v11 = v7;
      if (v10 < v4 && v8 >= v6) {
        break;
      }
      id v12 = *(os_unfair_lock_s **)(a1 + 32);
      if (*(_DWORD *)(a1 + 64) != v12[10]._os_unfair_lock_opaque) {
        return;
      }
      if ((v7 & 1) == 0)
      {
        ++v8;
        int v7 = 1;
        uint64_t v2 = v10;
        uint64_t v13 = v8;
        if (v8 >= *(void *)(a1 + 56)) {
          goto LABEL_11;
        }
        goto LABEL_19;
      }
      int v7 = 0;
      --v10;
      if (v2 >= 1)
      {
        uint64_t v13 = v10;
LABEL_19:
        os_unfair_lock_lock(v12 + 6);
        int64_t v14 = [*(id *)(a1 + 32) _mutableDayDictionaryAtIndex:v13];
        unint64_t v15 = [v14 objectForKey:p_name[48]];
        if (!v15)
        {
          v18 = [v14 objectForKey:CUIKOccurrenceCacheDayKey];
          os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
          [*(id *)(a1 + 32) faultOccurrencesForDay:v18 inOccurrencesArray:0 index:-1 limit:&v19 cacheSeed:*(unsigned int *)(a1 + 64)];
          v17 = id v16 = p_name;
          os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));
          [v14 setObject:v17 forKeyedSubscript:v16[48]];

          p_name = v16;
        }
        int v7 = v11 ^ 1;
        os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 24));

        uint64_t v2 = v10;
        goto LABEL_11;
      }
    }
    ++*(_DWORD *)(*(void *)(a1 + 32) + 40);
  }
}

- (int64_t)sectionForCachedOccurrencesOnDate:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:a3 forKey:CUIKOccurrenceCacheDayKey];
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  uint64_t v6 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  v12.length = [v6 count];
  v12.location = 0;
  CFIndex v7 = CFArrayBSearchValues((CFArrayRef)v6, v12, v4, (CFComparatorFunction)__CompareCachedDays, 0);
  unint64_t v8 = [v6 count];
  os_unfair_lock_unlock(p_dataLock);
  CFIndex v9 = v8 - 1;
  if (v7 < v8) {
    CFIndex v9 = v7;
  }
  if (v7 >= 0) {
    int64_t v10 = v9;
  }
  else {
    int64_t v10 = 0;
  }

  return v10;
}

- (id)dateAtDayIndex:(int64_t)a3
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  uint64_t v6 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  CFIndex v7 = v6;
  if (a3 < 0 || [v6 count] <= (unint64_t)a3)
  {
    CFIndex v9 = 0;
  }
  else
  {
    unint64_t v8 = [v7 objectAtIndex:a3];
    CFIndex v9 = [v8 objectForKey:CUIKOccurrenceCacheDayKey];
  }
  os_unfair_lock_unlock(p_dataLock);

  return v9;
}

- (id)cachedOccurrenceAtIndexPath:(id)a3
{
  p_dataLock = &self->_dataLock;
  id v5 = a3;
  os_unfair_lock_lock(p_dataLock);
  uint64_t v6 = [(CUIKOccurrenceCacheDataSource *)self _cachedOccurrenceAtIndexPath:v5];

  os_unfair_lock_unlock(p_dataLock);

  return v6;
}

- (BOOL)cachedOccurrencesAreLoaded
{
  uint64_t v2 = self;
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  LOBYTE(v2) = v2->_cachedDays != 0;
  os_unfair_lock_unlock(p_dataLock);
  return (char)v2;
}

- (int64_t)countOfOccurrencesAtDayIndex:(int64_t)a3
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  uint64_t v6 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  if ([v6 count] <= a3)
  {
    int64_t v9 = 0;
  }
  else
  {
    CFIndex v7 = [v6 objectAtIndex:a3];
    unint64_t v8 = [v7 objectForKey:CUIKOccurrenceCacheOccurrenceCountKey];
    int64_t v9 = (int)[v8 intValue];
  }
  os_unfair_lock_unlock(p_dataLock);

  return v9;
}

- (void)invalidateCachedOccurrences
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  cachedDays = self->_cachedDays;
  self->_cachedDays = 0;

  ++self->_cachedDaysSeed;

  os_unfair_lock_unlock(p_dataLock);
}

- (BOOL)supportsFakeTodaySection
{
  return 1;
}

- (int64_t)cachedDayCount
{
  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  uint64_t v4 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  int64_t v5 = [v4 count];

  os_unfair_lock_unlock(p_dataLock);
  return v5;
}

- (CUIKOccurrenceCacheDataSource)initWithEventStore:(id)a3 calendars:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)CUIKOccurrenceCacheDataSource;
  int64_t v9 = [(CUIKOccurrenceCacheDataSource *)&v12 init];
  int64_t v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_eventStore, a3);
    objc_storeStrong((id *)&v10->_calendars, a4);
    *(void *)&v10->_dataLock._os_unfair_lock_opaque = 0;
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedDays, 0);
  objc_storeStrong((id *)&self->_calendars, 0);

  objc_storeStrong((id *)&self->_eventStore, 0);
}

- (id)_createCachedDays
{
  uint64_t v2 = [(EKEventStore *)self->_eventStore occurrenceCacheGetOccurrenceCountsForCalendars:self->_calendars];
  uint64_t v3 = (void *)[v2 mutableCopy];

  if (!v3)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA48] array];
  }

  return v3;
}

- (BOOL)supportsInvitations
{
  return 1;
}

- (void)setCachedDays:(id)a3
{
  uint64_t v4 = (NSMutableArray *)[a3 mutableCopy];
  os_unfair_lock_lock(&self->_dataLock);
  cachedDays = self->_cachedDays;
  self->_cachedDays = v4;

  ++self->_cachedDaysSeed;

  os_unfair_lock_unlock(&self->_dataLock);
}

- (id)indexPathsForOccurrence:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v38 = [MEMORY[0x1E4F1CA48] array];
  int64_t v5 = [v4 startDate];
  uint64_t v6 = [(EKEventStore *)self->_eventStore timeZone];
  id v7 = [v5 dateForDayInTimeZone:v6];

  id v8 = [v4 endDateUnadjustedForLegacyClients];
  int64_t v9 = [(EKEventStore *)self->_eventStore timeZone];
  int64_t v10 = [v8 dateForDayInTimeZone:v9];

  p_dataLock = &self->_dataLock;
  os_unfair_lock_lock(&self->_dataLock);
  v40 = self;
  objc_super v12 = [(CUIKOccurrenceCacheDataSource *)self _cachedDays];
  uint64_t v13 = v12;
  if (v12)
  {
    lock = p_dataLock;
    int64_t v14 = [v12 firstObject];
    unint64_t v15 = [v14 objectForKey:CUIKOccurrenceCacheDayKey];
    v37 = v7;
    id v16 = [v7 laterDate:v15];

    v17 = [v13 lastObject];
    v18 = [v17 objectForKey:CUIKOccurrenceCacheDayKey];
    v36 = v10;
    uint64_t v19 = [v10 earlierDate:v18];

    v41 = CalCopyCalendar();
    v42 = (void *)v19;
    if ([v16 compare:v19] == 1)
    {
      BOOL v20 = v16;
    }
    else
    {
      v39 = v13;
      do
      {
        v21 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:v16 forKey:CUIKOccurrenceCacheDayKey];
        v53.length = [v13 count];
        v53.location = 0;
        CFIndex v43 = CFArrayBSearchValues((CFArrayRef)v13, v53, v21, (CFComparatorFunction)__CompareCachedDays, 0);
        v22 = -[CUIKOccurrenceCacheDataSource _mutableDayDictionaryAtIndex:](v40, "_mutableDayDictionaryAtIndex:");

        v23 = [v22 objectForKey:CUIKOccurrenceCacheOccurrencesKey];
        v24 = [(CUIKOccurrenceCacheDataSource *)v40 faultOccurrencesForDay:v16 inOccurrencesArray:v23 index:-1 limit:0 cacheSeed:v40->_cachedDaysSeed];

        v44 = v22;
        [v22 setObject:v24 forKeyedSubscript:CUIKOccurrenceCacheOccurrencesKey];
        long long v47 = 0u;
        long long v48 = 0u;
        long long v45 = 0u;
        long long v46 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v45 objects:v50 count:16];
        if (v26)
        {
          uint64_t v27 = v26;
          uint64_t v28 = 0;
          uint64_t v29 = *(void *)v46;
          while (2)
          {
            uint64_t v30 = 0;
            uint64_t v31 = v28 + v27;
            do
            {
              if (*(void *)v46 != v29) {
                objc_enumerationMutation(v25);
              }
              v32 = [*(id *)(*((void *)&v45 + 1) + 8 * v30) objectForKeyedSubscript:CUIKOccurrenceInfoEventKey];
              if ([v4 isEqual:v32])
              {
                v49[0] = v43;
                v49[1] = v28 + v30;
                v33 = [MEMORY[0x1E4F28D58] indexPathWithIndexes:v49 length:2];
                [v38 addObject:v33];

                goto LABEL_16;
              }

              ++v30;
            }
            while (v27 != v30);
            uint64_t v27 = [v25 countByEnumeratingWithState:&v45 objects:v50 count:16];
            uint64_t v28 = v31;
            if (v27) {
              continue;
            }
            break;
          }
        }
LABEL_16:

        BOOL v20 = [v41 dateByAddingUnit:16 value:1 toDate:v16 options:0];

        id v16 = v20;
        uint64_t v13 = v39;
      }
      while ([v20 compare:v42] != 1);
    }
    os_unfair_lock_unlock(lock);

    int64_t v10 = v36;
    id v7 = v37;
  }
  else
  {
    os_unfair_lock_unlock(p_dataLock);
  }

  return v38;
}

- (void)fetchDaysInBackgroundStartingFromSection:(int64_t)a3
{
}

- (void)_cachedOccurrenceAtIndexPath:(uint64_t)a1 .cold.1(uint64_t a1, void *a2)
{
  [a2 count];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3(&dword_1BDF08000, v2, v3, "Asked for cached occurrence at indexPath [%@] but there are only %lu cached events on that day.", v4, v5, v6, v7, v8);
}

- (void)_cachedOccurrenceAtIndexPath:(uint64_t)a1 .cold.2(uint64_t a1, void *a2)
{
  uint64_t v2 = [a2 _cachedDays];
  [v2 count];
  OUTLINED_FUNCTION_0_5();
  OUTLINED_FUNCTION_3(&dword_1BDF08000, v3, v4, "Asked for cached occurrence at indexPath [%@] but there are only %lu cached days.", v5, v6, v7, v8, v9);
}

@end