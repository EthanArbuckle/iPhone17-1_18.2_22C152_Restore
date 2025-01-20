@interface NWCComplicationTimelineEntryModelCache
+ (id)_endOfDayForDate:(id)a3;
+ (id)_startOfDayAfterDate:(id)a3;
+ (id)_startOfDayBeforeDate:(id)a3;
+ (id)_startOfDayForDate:(id)a3;
- (BOOL)hasEntryModelForDate:(id)a3;
- (NSDate)cacheEndDate;
- (NSDate)cacheStartDate;
- (NSMutableArray)cachedEntryModels;
- (NWCComplicationTimelineEntryModelCache)initWithDataSource:(id)a3;
- (NWCComplicationTimelineEntryModelCacheDataSource)dataSource;
- (id)_cachedEntryModelAfterDate:(id)a3 limit:(unint64_t)a4;
- (id)_cachedEntryModelForDate:(id)a3;
- (id)entryModelForDate:(id)a3;
- (id)entryModelsAfterDate:(id)a3 limit:(unint64_t)a4;
- (void)_extendCacheTowardDate:(id)a3;
- (void)invalidate;
- (void)setCachedEntryModels:(id)a3;
@end

@implementation NWCComplicationTimelineEntryModelCache

- (NWCComplicationTimelineEntryModelCache)initWithDataSource:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NWCComplicationTimelineEntryModelCache;
  v5 = [(NWCComplicationTimelineEntryModelCache *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_dataSource, v4);
  }

  return v6;
}

- (BOOL)hasEntryModelForDate:(id)a3
{
  v3 = [(NWCComplicationTimelineEntryModelCache *)self _cachedEntryModelForDate:a3];
  BOOL v4 = v3 != 0;

  return v4;
}

- (id)entryModelForDate:(id)a3
{
  id v4 = a3;
  [(NWCComplicationTimelineEntryModelCache *)self _extendCacheTowardDate:v4];
  v5 = [(NWCComplicationTimelineEntryModelCache *)self _cachedEntryModelForDate:v4];

  return v5;
}

- (id)entryModelsAfterDate:(id)a3 limit:(unint64_t)a4
{
  id v6 = a3;
  v7 = [(id)objc_opt_class() _startOfDayAfterDate:v6];
  [(NWCComplicationTimelineEntryModelCache *)self _extendCacheTowardDate:v7];
  objc_super v8 = [(NWCComplicationTimelineEntryModelCache *)self _cachedEntryModelAfterDate:v6 limit:a4];

  return v8;
}

- (void)invalidate
{
  v3 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
  [v3 removeAllObjects];

  [(NWCComplicationTimelineEntryModelCache *)self setCachedEntryModels:0];
  cacheStartDate = self->_cacheStartDate;
  self->_cacheStartDate = 0;

  cacheEndDate = self->_cacheEndDate;
  self->_cacheEndDate = 0;
}

- (void)_extendCacheTowardDate:(id)a3
{
  id v21 = a3;
  id v4 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];

  if (!v4)
  {
    v16 = [(id)objc_opt_class() _startOfDayForDate:v21];
    cacheStartDate = self->_cacheStartDate;
    self->_cacheStartDate = v16;

    v18 = [(id)objc_opt_class() _endOfDayForDate:v21];
    cacheEndDate = self->_cacheEndDate;
    self->_cacheEndDate = v18;

    v14 = [(NWCComplicationTimelineEntryModelCache *)self dataSource];
    v15 = [v14 loadEntryModelsForDay:self->_cacheStartDate];
    v20 = (void *)[v15 mutableCopy];
    [(NWCComplicationTimelineEntryModelCache *)self setCachedEntryModels:v20];

    goto LABEL_7;
  }
  if ([v21 compare:self->_cacheStartDate] == -1)
  {
    v5 = [(id)objc_opt_class() _startOfDayBeforeDate:self->_cacheStartDate];
    id v6 = self->_cacheStartDate;
    self->_cacheStartDate = v5;

    v7 = [(NWCComplicationTimelineEntryModelCache *)self dataSource];
    objc_super v8 = [v7 loadEntryModelsForDay:self->_cacheStartDate];
    v9 = (void *)[v8 mutableCopy];

    v10 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
    [v9 addObjectsFromArray:v10];

    [(NWCComplicationTimelineEntryModelCache *)self setCachedEntryModels:v9];
  }
  if ([v21 compare:self->_cacheEndDate] == 1)
  {
    v11 = [(id)objc_opt_class() _startOfDayAfterDate:self->_cacheEndDate];
    v12 = self->_cacheEndDate;
    self->_cacheEndDate = v11;

    v13 = [(NWCComplicationTimelineEntryModelCache *)self dataSource];
    v14 = [v13 loadEntryModelsForDay:self->_cacheEndDate];

    v15 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
    [v15 addObjectsFromArray:v14];
LABEL_7:
  }
}

- (id)_cachedEntryModelForDate:(id)a3
{
  id v4 = a3;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_23C35C34C;
  v20 = sub_23C35C35C;
  id v21 = 0;
  uint64_t v10 = MEMORY[0x263EF8330];
  uint64_t v11 = 3221225472;
  v12 = sub_23C35C364;
  v13 = &unk_264E3DA90;
  id v5 = v4;
  id v14 = v5;
  v15 = &v16;
  id v6 = (void *)MEMORY[0x23ECE2850](&v10);
  v7 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
  [v7 enumerateObjectsWithOptions:2 usingBlock:v6];

  id v8 = (id)v17[5];
  _Block_object_dispose(&v16, 8);

  return v8;
}

- (id)_cachedEntryModelAfterDate:(id)a3 limit:(unint64_t)a4
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v7 = [(NWCComplicationTimelineEntryModelCache *)self _cachedEntryModelForDate:v6];
  if (!v7)
  {
    uint64_t v10 = NTALogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_23C35D584(self, (uint64_t)v6, v10);
    }
    goto LABEL_7;
  }
  id v8 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
  unint64_t v9 = [v8 indexOfObject:v7];

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = NTALogForCategory(6uLL);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      uint64_t v11 = objc_opt_class();
      id v12 = v11;
      v13 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
      int v23 = 134218754;
      v24 = v11;
      __int16 v25 = 2112;
      v26 = v7;
      __int16 v27 = 2112;
      id v28 = v6;
      __int16 v29 = 2112;
      v30 = v13;
      _os_log_error_impl(&dword_23C352000, v10, OS_LOG_TYPE_ERROR, "[%public}@] Failed to find entryModelForDate %@ for date %@ in models: %@.", (uint8_t *)&v23, 0x2Au);
    }
LABEL_7:

    id v14 = (void *)MEMORY[0x263EFFA68];
    goto LABEL_8;
  }
  uint64_t v16 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
  uint64_t v17 = [v16 count];

  if (v17 - v9 >= a4) {
    unint64_t v18 = a4;
  }
  else {
    unint64_t v18 = v17 - v9;
  }
  id v14 = [MEMORY[0x263EFF980] arrayWithCapacity:v18];
  if (v9 < v18 + v9)
  {
    do
    {
      v19 = [(NWCComplicationTimelineEntryModelCache *)self cachedEntryModels];
      v20 = [v19 objectAtIndexedSubscript:v9];

      id v21 = [v20 entryDate];
      uint64_t v22 = [v21 compare:v6];

      if (v22 == 1) {
        [v14 addObject:v20];
      }

      ++v9;
      --v18;
    }
    while (v18);
  }
LABEL_8:

  return v14;
}

+ (id)_startOfDayForDate:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 startOfDayForDate:v4];

  return v6;
}

+ (id)_startOfDayBeforeDate:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  v7 = [v6 dateByAddingUnit:16 value:-1 toDate:v5 options:0];

  id v8 = [a1 _startOfDayForDate:v7];

  return v8;
}

+ (id)_startOfDayAfterDate:(id)a3
{
  id v4 = (void *)MEMORY[0x263EFF8F0];
  id v5 = a3;
  id v6 = [v4 currentCalendar];
  v7 = [v6 dateByAddingUnit:16 value:1 toDate:v5 options:0];

  id v8 = [a1 _startOfDayForDate:v7];

  return v8;
}

+ (id)_endOfDayForDate:(id)a3
{
  v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a3;
  id v5 = [v3 currentCalendar];
  id v6 = [v5 components:28 fromDate:v4];

  [v6 setHour:23];
  [v6 setMinute:59];
  [v6 setSecond:59];
  v7 = [v5 dateFromComponents:v6];

  return v7;
}

- (NSDate)cacheStartDate
{
  return self->_cacheStartDate;
}

- (NSDate)cacheEndDate
{
  return self->_cacheEndDate;
}

- (NWCComplicationTimelineEntryModelCacheDataSource)dataSource
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);

  return (NWCComplicationTimelineEntryModelCacheDataSource *)WeakRetained;
}

- (NSMutableArray)cachedEntryModels
{
  return self->_cachedEntryModels;
}

- (void)setCachedEntryModels:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntryModels, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_cacheEndDate, 0);

  objc_storeStrong((id *)&self->_cacheStartDate, 0);
}

@end