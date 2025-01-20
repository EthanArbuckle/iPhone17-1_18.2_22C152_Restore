@interface NSDate(CalendarAdditions)
- (id)dateAtHour:()CalendarAdditions minute:second:inTimeZone:;
- (id)dateForEndOfDayInTimeZone:()CalendarAdditions;
- (id)dateWithoutTimeComponentsInTimeZone:()CalendarAdditions;
- (uint64_t)dateForStartOfDayInTimeZone:()CalendarAdditions;
- (void)_performBlockBehindDispatchSync:()CalendarAdditions inTimeZone:;
@end

@implementation NSDate(CalendarAdditions)

- (id)dateForEndOfDayInTimeZone:()CalendarAdditions
{
  id v4 = a3;
  v5 = [a1 dateForStartOfDayInTimeZone:v4];
  if ([a1 isEqual:v5])
  {
    id v6 = a1;
  }
  else
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
    [v7 setDay:1];
    uint64_t v16 = 0;
    v17 = &v16;
    uint64_t v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__2;
    v20 = __Block_byref_object_dispose__2;
    id v21 = 0;
    v8 = _EKSharedGregorianCalendarLock();
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __55__NSDate_CalendarAdditions__dateForEndOfDayInTimeZone___block_invoke;
    block[3] = &unk_1E56CDB08;
    block[4] = a1;
    v15 = &v16;
    id v12 = v4;
    id v13 = v7;
    id v14 = v5;
    id v9 = v7;
    dispatch_sync(v8, block);

    id v6 = (id)v17[5];
    _Block_object_dispose(&v16, 8);
  }

  return v6;
}

- (uint64_t)dateForStartOfDayInTimeZone:()CalendarAdditions
{
  return [a1 dateAtHour:0 minute:0 second:0 inTimeZone:a3];
}

- (id)dateAtHour:()CalendarAdditions minute:second:inTimeZone:
{
  id v10 = a6;
  uint64_t v21 = 0;
  v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__2;
  v25 = __Block_byref_object_dispose__2;
  id v26 = 0;
  v11 = _EKSharedGregorianCalendarLock();
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __65__NSDate_CalendarAdditions__dateAtHour_minute_second_inTimeZone___block_invoke;
  v15[3] = &unk_1E56CDB30;
  v15[4] = a1;
  id v16 = v10;
  uint64_t v19 = a4;
  uint64_t v20 = a5;
  v17 = &v21;
  uint64_t v18 = a3;
  id v12 = v10;
  dispatch_sync(v11, v15);

  id v13 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v13;
}

- (id)dateWithoutTimeComponentsInTimeZone:()CalendarAdditions
{
  id v4 = a3;
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__2;
  id v12 = __Block_byref_object_dispose__2;
  id v13 = 0;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __65__NSDate_CalendarAdditions__dateWithoutTimeComponentsInTimeZone___block_invoke;
  v7[3] = &unk_1E56CDB58;
  v7[4] = a1;
  v7[5] = &v8;
  [a1 _performBlockBehindDispatchSync:v7 inTimeZone:v4];
  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (void)_performBlockBehindDispatchSync:()CalendarAdditions inTimeZone:
{
  id v5 = a3;
  id v6 = a4;
  id v7 = _EKSharedGregorianCalendarLock();
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __72__NSDate_CalendarAdditions___performBlockBehindDispatchSync_inTimeZone___block_invoke;
  v10[3] = &unk_1E56CDB80;
  id v11 = v6;
  id v12 = v5;
  id v8 = v5;
  id v9 = v6;
  dispatch_sync(v7, v10);
}

@end