@interface CLSCalendarEventsCache
- (BOOL)hasEventsFromStartDate:(id)a3 toEndDate:(id)a4;
- (CLSCalendarEventsCache)init;
- (NSMutableSet)years;
- (id)_storeDayForDate:(id)a3 createIfNeeded:(BOOL)a4;
- (id)debugDescription;
- (id)eventsForDate:(id)a3;
- (id)eventsForStartDate:(id)a3 endDate:(id)a4;
- (void)_enumerateDaysFromStartDate:(id)a3 toEndDate:(id)a4 usingBlock:(id)a5;
- (void)enumerateEventsFromStartDate:(id)a3 toEndDate:(id)a4 usingBlock:(id)a5;
- (void)insertEvent:(id)a3;
@end

@implementation CLSCalendarEventsCache

- (void).cxx_destruct
{
}

- (NSMutableSet)years
{
  return self->_years;
}

- (id)_storeDayForDate:(id)a3 createIfNeeded:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (_storeDayForDate_createIfNeeded__onceToken != -1) {
    dispatch_once(&_storeDayForDate_createIfNeeded__onceToken, &__block_literal_global_5975);
  }
  v7 = +[CLSCalendar components:28 fromDate:v6];
  uint64_t v8 = [v7 year];
  [(id)_storeDayForDate_createIfNeeded__s_fakeYear setYear:v8];
  uint64_t v9 = [v7 month];
  [(id)_storeDayForDate_createIfNeeded__s_fakeMonth setMonth:v9];
  uint64_t v10 = [v7 day];
  [(id)_storeDayForDate_createIfNeeded__s_fakeDay setDay:v10];
  v11 = [(NSMutableSet *)self->_years member:_storeDayForDate_createIfNeeded__s_fakeYear];
  if (v11)
  {
LABEL_6:
    v13 = [(CLSCalendarEventsCacheYear *)v11 months];
    v14 = [v13 member:_storeDayForDate_createIfNeeded__s_fakeMonth];

    if (!v14)
    {
      if (!v4)
      {
        v18 = 0;
LABEL_13:

        goto LABEL_14;
      }
      v15 = [CLSCalendarEventsCacheMonth alloc];
      v14 = -[CLSCalendarEventsCacheMonth initWithMonth:](v15, "initWithMonth:", [(id)_storeDayForDate_createIfNeeded__s_fakeMonth month]);
      v16 = [(CLSCalendarEventsCacheYear *)v11 months];
      [v16 addObject:v14];
    }
    v17 = [(CLSCalendarEventsCacheMonth *)v14 days];
    v18 = [v17 member:_storeDayForDate_createIfNeeded__s_fakeDay];

    if (!v18 && v4)
    {
      v19 = [CLSCalendarEventsCacheDay alloc];
      v18 = -[CLSCalendarEventsCacheDay initWithDay:](v19, "initWithDay:", [(id)_storeDayForDate_createIfNeeded__s_fakeDay day]);
      v20 = [(CLSCalendarEventsCacheMonth *)v14 days];
      [v20 addObject:v18];
    }
    goto LABEL_13;
  }
  if (v4)
  {
    v12 = [CLSCalendarEventsCacheYear alloc];
    v11 = -[CLSCalendarEventsCacheYear initWithYear:](v12, "initWithYear:", [(id)_storeDayForDate_createIfNeeded__s_fakeYear year]);
    [(NSMutableSet *)self->_years addObject:v11];
    goto LABEL_6;
  }
  v18 = 0;
LABEL_14:

  return v18;
}

uint64_t __58__CLSCalendarEventsCache__storeDayForDate_createIfNeeded___block_invoke()
{
  v0 = [[CLSCalendarEventsCacheYear alloc] initWithYear:0];
  v1 = (void *)_storeDayForDate_createIfNeeded__s_fakeYear;
  _storeDayForDate_createIfNeeded__s_fakeYear = (uint64_t)v0;

  v2 = [[CLSCalendarEventsCacheMonth alloc] initWithMonth:0];
  v3 = (void *)_storeDayForDate_createIfNeeded__s_fakeMonth;
  _storeDayForDate_createIfNeeded__s_fakeMonth = (uint64_t)v2;

  _storeDayForDate_createIfNeeded__s_fakeDay = [[CLSCalendarEventsCacheDay alloc] initWithDay:0];
  return MEMORY[0x1F41817F8]();
}

- (void)_enumerateDaysFromStartDate:(id)a3 toEndDate:(id)a4 usingBlock:(id)a5
{
  id v7 = a4;
  uint64_t v8 = (void (**)(id, id, unsigned char *))a5;
  if (v8)
  {
    char v14 = 0;
    uint64_t v9 = +[CLSCalendar startOfDayForDate:a3];
    uint64_t v10 = +[CLSCalendar startOfDayForDate:v7];
    id v11 = v9;
    v8[2](v8, v11, &v14);
    v12 = v11;
    if (!v14)
    {
      v13 = v11;
      while ([v13 compare:v10] == -1)
      {
        v12 = +[CLSCalendar dateByAddingDays:1 toDate:v13];

        v8[2](v8, v12, &v14);
        v13 = v12;
        if (v14) {
          goto LABEL_8;
        }
      }
      v12 = v13;
    }
LABEL_8:
  }
}

- (BOOL)hasEventsFromStartDate:(id)a3 toEndDate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__CLSCalendarEventsCache_hasEventsFromStartDate_toEndDate___block_invoke;
  v9[3] = &unk_1E6910228;
  v9[4] = &v10;
  [(CLSCalendarEventsCache *)self enumerateEventsFromStartDate:v6 toEndDate:v7 usingBlock:v9];
  LOBYTE(self) = *((unsigned char *)v11 + 24);
  _Block_object_dispose(&v10, 8);

  return (char)self;
}

uint64_t __59__CLSCalendarEventsCache_hasEventsFromStartDate_toEndDate___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, unsigned char *a4)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24) = 1;
  *a4 = 1;
  return result;
}

- (id)eventsForDate:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  id v6 = [(CLSCalendarEventsCache *)v5 _storeDayForDate:v4 createIfNeeded:0];
  id v7 = [v6 events];

  objc_sync_exit(v5);
  return v7;
}

- (id)eventsForStartDate:(id)a3 endDate:(id)a4
{
  id v6 = (void *)MEMORY[0x1E4F1CA80];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = [v6 set];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __53__CLSCalendarEventsCache_eventsForStartDate_endDate___block_invoke;
  v12[3] = &unk_1E6910200;
  id v10 = v9;
  id v13 = v10;
  [(CLSCalendarEventsCache *)self enumerateEventsFromStartDate:v8 toEndDate:v7 usingBlock:v12];

  return v10;
}

uint64_t __53__CLSCalendarEventsCache_eventsForStartDate_endDate___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) addObject:a2];
}

- (void)enumerateEventsFromStartDate:(id)a3 toEndDate:(id)a4 usingBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v10)
  {
    id v11 = self;
    objc_sync_enter(v11);
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __76__CLSCalendarEventsCache_enumerateEventsFromStartDate_toEndDate_usingBlock___block_invoke;
    v12[3] = &unk_1E69101D8;
    void v12[4] = v11;
    id v13 = v8;
    id v14 = v9;
    id v15 = v10;
    [(CLSCalendarEventsCache *)v11 _enumerateDaysFromStartDate:v13 toEndDate:v14 usingBlock:v12];

    objc_sync_exit(v11);
  }
}

void __76__CLSCalendarEventsCache_enumerateEventsFromStartDate_toEndDate_usingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v24 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a2;
  id v4 = objc_msgSend(*(id *)(a1 + 32), "eventsForDate:");
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v27 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "startDate", v24);
        id v11 = [v9 endDate];
        uint64_t v12 = *(void **)(a1 + 40);
        id v13 = *(id *)(a1 + 48);
        id v14 = v12;
        [v10 timeIntervalSinceReferenceDate];
        double v16 = v15;
        [v11 timeIntervalSinceReferenceDate];
        double v18 = v17;
        [v14 timeIntervalSinceReferenceDate];
        double v20 = v19;
        [v13 timeIntervalSinceReferenceDate];
        double v22 = v21;

        if (v16 <= v22 && v18 >= v20) {
          (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v6);
  }
}

- (void)insertEvent:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = self;
    objc_sync_enter(v5);
    uint64_t v6 = [v4 startDate];
    uint64_t v7 = [v4 endDate];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __38__CLSCalendarEventsCache_insertEvent___block_invoke;
    v8[3] = &unk_1E69101B0;
    v8[4] = v5;
    id v9 = v4;
    [(CLSCalendarEventsCache *)v5 _enumerateDaysFromStartDate:v6 toEndDate:v7 usingBlock:v8];

    objc_sync_exit(v5);
  }
}

void __38__CLSCalendarEventsCache_insertEvent___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) _storeDayForDate:a2 createIfNeeded:1];
  v3 = [v4 events];
  [v3 addObject:*(void *)(a1 + 40)];
}

- (id)debugDescription
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = [(NSMutableSet *)self->_years debugDescription];
  uint64_t v6 = [v3 stringWithFormat:@"<%@: %p> %@", v4, self, v5];

  return v6;
}

- (CLSCalendarEventsCache)init
{
  v6.receiver = self;
  v6.super_class = (Class)CLSCalendarEventsCache;
  v2 = [(CLSCalendarEventsCache *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CA80] set];
    years = v2->_years;
    v2->_years = (NSMutableSet *)v3;
  }
  return v2;
}

@end