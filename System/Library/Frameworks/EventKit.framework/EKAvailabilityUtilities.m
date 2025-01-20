@interface EKAvailabilityUtilities
+ (BOOL)canSeeAttendeeStatusesForEvent:(id)a3;
+ (BOOL)showTypeAsBusy:(int64_t)a3;
+ (BOOL)showTypeAsUnavailable:(int64_t)a3;
+ (BOOL)spansIncludeBusyPeriod:(id)a3;
+ (id)getCALFreeBusyFromEKSpans:(id)a3 inRange:(id)a4;
+ (id)getCALFreeBusyFromResults:(id)a3 forAttendees:(id)a4 inRange:(id)a5;
+ (int)CALFreeBusyTypeFromEKAvailType:(int64_t)a3;
+ (int)leastAvailabileFreeBusyTypeForArray:(id)a3;
+ (int64_t)availabilityPanelVisibilityForEvent:(id)a3;
+ (int64_t)orderForType:(int64_t)a3;
+ (int64_t)summarizedAvailabilityTypeForSpans:(id)a3;
@end

@implementation EKAvailabilityUtilities

+ (int)CALFreeBusyTypeFromEKAvailType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 6) {
    return 1;
  }
  else {
    return dword_1A4F8FFC0[a3 - 1];
  }
}

+ (int)leastAvailabileFreeBusyTypeForArray:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 count];
    if (v5 < 2)
    {
      int v7 = 6;
    }
    else
    {
      uint64_t v6 = v5;
      int v7 = 6;
      for (uint64_t i = 1; i < v6; i += 2)
      {
        v9 = [v4 objectAtIndex:i];
        int v10 = [v9 integerValue];

        if (v7 >= v10) {
          int v7 = v10;
        }
      }
    }
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

+ (id)getCALFreeBusyFromEKSpans:(id)a3 inRange:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = objc_opt_new();
  if (v5 && [v5 count])
  {
    v8 = [v5 firstObject];
    v9 = [v6 startDate];
    int v10 = [v8 startDate];
    int v11 = [v9 isBeforeDate:v10];

    if (v11)
    {
      v12 = [v6 startDate];
      [v7 addObject:v12];

      [v7 addObject:&unk_1EF952BC8];
    }
    id v28 = v5;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v13 = v5;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v30 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          v19 = [v18 startDate];
          [v7 addObject:v19];

          v20 = objc_msgSend(NSNumber, "numberWithInt:", +[EKAvailabilityUtilities CALFreeBusyTypeFromEKAvailType:](EKAvailabilityUtilities, "CALFreeBusyTypeFromEKAvailType:", objc_msgSend(v18, "type")));
          [v7 addObject:v20];
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v15);
    }

    v21 = [v13 lastObject];
    if (v21)
    {
      v22 = [v6 endDate];
      v23 = [v21 endDate];
      int v24 = [v22 isAfterDate:v23];

      if (v24)
      {
        v25 = [v21 endDate];
        [v7 addObject:v25];

        [v7 addObject:&unk_1EF952BC8];
      }
    }

    id v5 = v28;
  }
  else
  {
    v26 = [v6 startDate];
    [v7 addObject:v26];

    [v7 addObject:&unk_1EF952BC8];
  }

  return v7;
}

+ (id)getCALFreeBusyFromResults:(id)a3 forAttendees:(id)a4 inRange:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v24 = (id)objc_opt_new();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = v8;
  uint64_t v10 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v26 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        uint64_t v15 = objc_opt_new();
        if (v7)
        {
          uint64_t v16 = [v7 objectForKeyedSubscript:v14];
        }
        else
        {
          uint64_t v16 = 0;
        }
        [v15 sanitizeAndInsertResults:v16 inRange:v9];
        v17 = [v15 spans];
        uint64_t v18 = [v17 count];

        if (v18)
        {
          v19 = objc_opt_class();
          v20 = [v15 spans];
          v21 = [v19 getCALFreeBusyFromEKSpans:v20 inRange:v9];
          [v24 setObject:v21 forKeyedSubscript:v14];
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v11);
  }

  return v24;
}

+ (int64_t)summarizedAvailabilityTypeForSpans:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  uint64_t v13 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  uint64_t v9 = 0;
  uint64_t v9 = [(id)objc_opt_class() orderForType:0];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __62__EKAvailabilityUtilities_summarizedAvailabilityTypeForSpans___block_invoke;
  v7[3] = &unk_1E5B98940;
  v7[4] = v8;
  v7[5] = &v10;
  v7[6] = a1;
  [v4 enumerateObjectsUsingBlock:v7];
  int64_t v5 = v11[3];
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v10, 8);

  return v5;
}

uint64_t __62__EKAvailabilityUtilities_summarizedAvailabilityTypeForSpans___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 type];
  uint64_t result = [(id)objc_opt_class() orderForType:v3];
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  if (result > *(void *)(v5 + 24))
  {
    *(void *)(v5 + 24) = result;
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  }
  return result;
}

+ (BOOL)spansIncludeBusyPeriod:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __50__EKAvailabilityUtilities_spansIncludeBusyPeriod___block_invoke;
  v6[3] = &unk_1E5B98968;
  v6[4] = &v7;
  v6[5] = a1;
  [v4 enumerateObjectsUsingBlock:v6];
  LOBYTE(a1) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)a1;
}

uint64_t __50__EKAvailabilityUtilities_spansIncludeBusyPeriod___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t result = objc_msgSend((id)objc_opt_class(), "showTypeAsBusy:", objc_msgSend(a2, "type"));
  if (result)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

+ (BOOL)showTypeAsBusy:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xF2u >> a3);
}

+ (BOOL)showTypeAsUnavailable:(int64_t)a3
{
  return ((unint64_t)a3 < 8) & (0xD0u >> a3);
}

+ (int64_t)availabilityPanelVisibilityForEvent:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 constraints];
    int v7 = [v6 supportsAvailabilityRequests];

    if (v7)
    {
      if ([v5 isAllDay])
      {
        int64_t v8 = 3;
      }
      else
      {
        char v10 = [MEMORY[0x1E4F57688] activeCalendar];
        char v11 = [v5 isMultiDayTimedEventInCalendar:v10];

        if (v11)
        {
          int64_t v8 = 4;
        }
        else if ([v5 hasAttendees])
        {
          if ([a1 canSeeAttendeeStatusesForEvent:v5]) {
            int64_t v8 = 0;
          }
          else {
            int64_t v8 = 6;
          }
        }
        else
        {
          int64_t v8 = 5;
        }
      }
    }
    else
    {
      int64_t v8 = 2;
    }
  }
  else
  {
    int64_t v8 = 1;
  }

  return v8;
}

+ (BOOL)canSeeAttendeeStatusesForEvent:(id)a3
{
  id v3 = a3;
  id v4 = [v3 calendar];

  if (v4)
  {
    if ([v3 isNew]) {
      int v5 = [v3 hasAttendees];
    }
    else {
      int v5 = 0;
    }
    int v7 = [v3 organizer];
    if (v7)
    {
      int64_t v8 = [v3 organizer];
      int v9 = [v8 isCurrentUser];
    }
    else
    {
      int v9 = 0;
    }

    int v10 = v5 | v9;
    char v11 = [v3 calendar];
    uint64_t v12 = [v11 source];
    uint64_t v13 = [v12 _constraintsInternal];
    uint64_t v14 = v13;
    if (v10 == 1) {
      char v15 = [v13 organizerCanSeeAttendeeStatuses];
    }
    else {
      char v15 = [v13 inviteesCanSeeAttendeeStatuses];
    }
    BOOL v6 = v15;
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

+ (int64_t)orderForType:(int64_t)a3
{
  if ((unint64_t)a3 > 6) {
    return 0;
  }
  else {
    return qword_1A4F8FFE0[a3];
  }
}

@end