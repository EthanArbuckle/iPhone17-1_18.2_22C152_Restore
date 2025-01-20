@interface HKStatisticsCollection
- (BOOL)_insertStatistics:(id)a3;
- (HKStatistics)statisticsForDate:(NSDate *)date;
- (HKStatisticsCollection)init;
- (HKStatisticsCollection)initWithAnchorDate:(id)a3 statisticsInterval:(id)a4;
- (HKStatisticsCollection)initWithAnchorDate:(id)a3 statisticsInterval:(id)a4 emptyStatisticsConstructor:(id)a5;
- (NSArray)statistics;
- (NSDate)anchorDate;
- (NSDateComponents)statisticsInterval;
- (NSSet)sources;
- (id)_maxSumQuantityStatistics;
- (id)_minSumQuantityStatistics;
- (id)_mostRecentQuantityDateInterval;
- (id)_mostRecentQuantityStatistics;
- (id)_statisticsDateIntervalAndIndex:(int64_t *)a3 forDate:(id)a4;
- (id)_statisticsDateIntervalAtIndex:(int64_t)a3;
- (id)_statisticsForIndex:(int64_t)a3;
- (id)_statisticsForLastIndex;
- (id)asJSONObject;
- (unint64_t)statisticsCount;
- (void)_clearSourcesCache;
- (void)_enumerateStatisticsIndexesFromDate:(id)a3 toDate:(id)a4 withBlock:(id)a5;
- (void)_enumerateTimePeriodsFromDate:(id)a3 toDate:(id)a4 withBlock:(id)a5;
- (void)_resetStatistics:(id)a3;
- (void)_timePeriodForStatisticsAtIndex:(int64_t)a3 startDate:(id *)a4 endDate:(id *)a5;
- (void)enumeratePopulatedStatisticsWithBlock:(id)a3;
- (void)enumerateStatisticsFromDate:(NSDate *)startDate toDate:(NSDate *)endDate withBlock:(void *)block;
@end

@implementation HKStatisticsCollection

- (id)asJSONObject
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 setObject:v4 forKeyedSubscript:@"sources"];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v5 = [(HKStatisticsCollection *)self sources];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = [*(id *)(*((void *)&v23 + 1) + 8 * i) asJSONObject];
        [v4 addObject:v10];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 setObject:v11 forKeyedSubscript:@"statistics"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v12 = [(HKStatisticsCollection *)self statistics];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        v17 = [*(id *)(*((void *)&v19 + 1) + 8 * j) asJSONObject];
        [v11 addObject:v17];
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  return v3;
}

- (HKStatisticsCollection)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  v5 = NSStringFromSelector(a2);
  [v3 raise:v4, @"The -%@ method is not available on %@", v5, objc_opt_class() format];

  return 0;
}

- (HKStatisticsCollection)initWithAnchorDate:(id)a3 statisticsInterval:(id)a4
{
  return [(HKStatisticsCollection *)self initWithAnchorDate:a3 statisticsInterval:a4 emptyStatisticsConstructor:&__block_literal_global_113];
}

uint64_t __64__HKStatisticsCollection_initWithAnchorDate_statisticsInterval___block_invoke()
{
  return 0;
}

- (HKStatisticsCollection)initWithAnchorDate:(id)a3 statisticsInterval:(id)a4 emptyStatisticsConstructor:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
  }
  else
  {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ must be given a statistics constructor", objc_opt_class() format];
    if (v9) {
      goto LABEL_3;
    }
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ must have an anchor date", objc_opt_class() format];
LABEL_3:
  objc_msgSend(v10, "hk_approximateDuration");
  double v13 = v12;
  if (v12 == 0.0) {
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8], @"%@ statistics interval must be non zero: %@", objc_opt_class(), v10 format];
  }
  v26.receiver = self;
  v26.super_class = (Class)HKStatisticsCollection;
  uint64_t v14 = [(HKStatisticsCollection *)&v26 init];
  uint64_t v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_anchorDate, a3);
    uint64_t v16 = [v10 copy];
    statisticsInterval = v15->_statisticsInterval;
    v15->_statisticsInterval = (NSDateComponents *)v16;

    v18 = [(NSDateComponents *)v15->_statisticsInterval calendar];

    if (!v18)
    {
      long long v19 = v15->_statisticsInterval;
      long long v20 = [MEMORY[0x1E4F1C9A8] currentCalendar];
      [(NSDateComponents *)v19 setCalendar:v20];
    }
    uint64_t v21 = [v11 copy];
    id emptyStatisticsConstructor = v15->_emptyStatisticsConstructor;
    v15->_id emptyStatisticsConstructor = (id)v21;

    v15->_approximateStatisticsInterval = v13;
    v15->_lock._os_unfair_lock_opaque = 0;
    uint64_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
    statisticsByIndex = v15->_statisticsByIndex;
    v15->_statisticsByIndex = (NSMutableDictionary *)v23;
  }
  return v15;
}

- (HKStatistics)statisticsForDate:(NSDate *)date
{
  uint64_t v15 = 0;
  uint64_t v4 = [(HKStatisticsCollection *)self _statisticsDateIntervalAndIndex:&v15 forDate:date];
  if (v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    statisticsByIndex = self->_statisticsByIndex;
    uint64_t v7 = [NSNumber numberWithInteger:v15];
    uint64_t v8 = [(NSMutableDictionary *)statisticsByIndex objectForKey:v7];
    id v9 = v8;
    if (v8)
    {
      id v10 = v8;
    }
    else
    {
      id emptyStatisticsConstructor = (void (**)(id, void *, void *))self->_emptyStatisticsConstructor;
      double v12 = [v4 startDate];
      double v13 = [v4 endDate];
      emptyStatisticsConstructor[2](emptyStatisticsConstructor, v12, v13);
      id v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    os_unfair_lock_unlock(p_lock);
  }
  else
  {
    id v10 = 0;
  }

  return (HKStatistics *)v10;
}

- (void)enumerateStatisticsFromDate:(NSDate *)startDate toDate:(NSDate *)endDate withBlock:(void *)block
{
  uint64_t v8 = startDate;
  id v9 = endDate;
  id v10 = block;
  if (v8)
  {
    if (v9) {
      goto LABEL_3;
    }
LABEL_7:
    [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"End date cannot be nil"];
    if (!v10) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  [MEMORY[0x1E4F1CA00] raise:*MEMORY[0x1E4F1C3C8] format:@"Start date cannot be nil"];
  if (!v9) {
    goto LABEL_7;
  }
LABEL_3:
  if (v10)
  {
LABEL_4:
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __71__HKStatisticsCollection_enumerateStatisticsFromDate_toDate_withBlock___block_invoke;
    v11[3] = &unk_1E58C7E50;
    v11[4] = self;
    id v12 = v10;
    [(HKStatisticsCollection *)self _enumerateStatisticsIndexesFromDate:v8 toDate:v9 withBlock:v11];
  }
LABEL_5:
}

uint64_t __71__HKStatisticsCollection_enumerateStatisticsFromDate_toDate_withBlock___block_invoke(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v5 = [*(id *)(a1 + 32) _statisticsForIndex:a2];
  uint64_t v6 = v5;
  if (v5)
  {
    uint64_t v8 = v5;
    uint64_t v5 = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
    uint64_t v6 = v8;
  }
  else
  {
    *a3 = 1;
  }

  return MEMORY[0x1F41817F8](v5, v6);
}

- (NSArray)statistics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSMutableDictionary *)self->_statisticsByIndex copy];
  os_unfair_lock_unlock(p_lock);
  uint64_t v5 = [v4 allKeys];
  uint64_t v6 = [v5 sortedArrayUsingSelector:sel_compare_];

  uint64_t v7 = [MEMORY[0x1E4F1CA48] array];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        double v13 = objc_msgSend(v4, "objectForKeyedSubscript:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17);
        uint64_t v14 = v13;
        if (v13)
        {
          uint64_t v15 = (void *)[v13 copy];
          [v7 addObject:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return (NSArray *)v7;
}

- (NSSet)sources
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (!self->_cachedSources)
  {
    uint64_t v4 = [MEMORY[0x1E4F1CA80] set];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v5 = [(NSMutableDictionary *)self->_statisticsByIndex allValues];
    uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v18;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v18 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = (void *)MEMORY[0x1E4F1CAD0];
          uint64_t v11 = [*(id *)(*((void *)&v17 + 1) + 8 * v9) sources];
          id v12 = [v10 setWithArray:v11];
          [v4 unionSet:v12];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v7);
    }

    double v13 = [MEMORY[0x1E4F1CAD0] setWithSet:v4];
    cachedSources = self->_cachedSources;
    self->_cachedSources = v13;
  }
  os_unfair_lock_unlock(p_lock);
  uint64_t v15 = self->_cachedSources;

  return v15;
}

- (unint64_t)statisticsCount
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableDictionary *)self->_statisticsByIndex count];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)_maxSumQuantityStatistics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableDictionary *)self->_statisticsByIndex allValues];
  os_unfair_lock_unlock(p_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "sumQuantity", (void)v17);
        uint64_t v13 = [v8 compare:v12];

        if (v13 == -1 || v8 == 0)
        {
          uint64_t v15 = [v11 sumQuantity];

          uint64_t v8 = (void *)v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_minSumQuantityStatistics
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  unint64_t v4 = [(NSMutableDictionary *)self->_statisticsByIndex allValues];
  os_unfair_lock_unlock(p_lock);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = 0;
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "sumQuantity", (void)v17);
        uint64_t v13 = [v8 compare:v12];

        if (v13 == 1 || v8 == 0)
        {
          uint64_t v15 = [v11 sumQuantity];

          uint64_t v8 = (void *)v15;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)_mostRecentQuantityStatistics
{
  v2 = [(HKStatisticsCollection *)self _statisticsForLastIndex];
  id v3 = [v2 mostRecentQuantity];

  return v3;
}

- (id)_mostRecentQuantityDateInterval
{
  v2 = [(HKStatisticsCollection *)self _statisticsForLastIndex];
  id v3 = [v2 mostRecentQuantityDateInterval];

  return v3;
}

- (void)_clearSourcesCache
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  cachedSources = self->_cachedSources;
  self->_cachedSources = 0;

  os_unfair_lock_unlock(p_lock);
}

- (BOOL)_insertStatistics:(id)a3
{
  id v4 = a3;
  [(HKStatisticsCollection *)self _clearSourcesCache];
  id v5 = [HKDateInterval alloc];
  uint64_t v6 = [v4 startDate];
  uint64_t v7 = [v4 endDate];
  uint64_t v8 = [(HKDateInterval *)v5 initWithStartDate:v6 endDate:v7];

  uint64_t v17 = 0;
  uint64_t v9 = [(HKDateInterval *)v8 startDate];
  uint64_t v10 = [(HKStatisticsCollection *)self _statisticsDateIntervalAndIndex:&v17 forDate:v9];
  int v11 = [v10 isEqual:v8];

  if (v11)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    uint64_t v13 = [v4 dataCount];
    statisticsByIndex = self->_statisticsByIndex;
    uint64_t v15 = [NSNumber numberWithInteger:v17];
    if (v13) {
      [(NSMutableDictionary *)statisticsByIndex setObject:v4 forKey:v15];
    }
    else {
      [(NSMutableDictionary *)statisticsByIndex removeObjectForKey:v15];
    }

    os_unfair_lock_unlock(p_lock);
  }

  return v11;
}

- (void)_resetStatistics:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  cachedSources = self->_cachedSources;
  self->_cachedSources = 0;

  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  statisticsByIndex = self->_statisticsByIndex;
  self->_statisticsByIndex = v6;

  os_unfair_lock_unlock(&self->_lock);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v8 = v4;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v8);
        }
        -[HKStatisticsCollection _insertStatistics:](self, "_insertStatistics:", *(void *)(*((void *)&v13 + 1) + 8 * v12++), (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v10);
  }
}

- (void)_enumerateTimePeriodsFromDate:(id)a3 toDate:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__49;
  v23[4] = __Block_byref_object_dispose__49;
  id v24 = 0;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = __Block_byref_object_copy__49;
  v21[4] = __Block_byref_object_dispose__49;
  id v22 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 1;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__49;
  v18[4] = __Block_byref_object_dispose__49;
  id v19 = 0;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __73__HKStatisticsCollection__enumerateTimePeriodsFromDate_toDate_withBlock___block_invoke;
  v12[3] = &unk_1E58C7E78;
  long long v14 = v23;
  long long v15 = v21;
  v12[4] = self;
  long long v16 = v18;
  uint64_t v17 = v20;
  id v11 = v10;
  id v13 = v11;
  [(HKStatisticsCollection *)self _enumerateStatisticsIndexesFromDate:v8 toDate:v9 withBlock:v12];

  _Block_object_dispose(v18, 8);
  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v21, 8);

  _Block_object_dispose(v23, 8);
}

uint64_t __73__HKStatisticsCollection__enumerateTimePeriodsFromDate_toDate_withBlock___block_invoke(void *a1, uint64_t a2)
{
  uint64_t v3 = *(void *)(a1[6] + 8);
  uint64_t v6 = *(void **)(v3 + 40);
  id v5 = (id *)(v3 + 40);
  id v4 = v6;
  uint64_t v7 = *(void *)(a1[7] + 8);
  id v10 = *(void **)(v7 + 40);
  id v9 = (id *)(v7 + 40);
  id v8 = v10;
  if (v4 && v8)
  {
    objc_storeStrong(v5, v8);
    id v11 = *(void **)(a1[4] + 56);
    ++*(void *)(*(void *)(a1[9] + 8) + 24);
    uint64_t v12 = objc_msgSend(v11, "hk_dateByAddingInterval:toDate:");
    uint64_t v13 = *(void *)(a1[7] + 8);
    long long v14 = *(void **)(v13 + 40);
    *(void *)(v13 + 40) = v12;
  }
  else
  {
    long long v15 = (void *)a1[4];
    id v17 = v8;
    obuint64_t j = v4;
    [v15 _timePeriodForStatisticsAtIndex:a2 startDate:&obj endDate:&v17];
    objc_storeStrong(v5, obj);
    objc_storeStrong(v9, v17);
    objc_storeStrong((id *)(*(void *)(a1[8] + 8) + 40), *(id *)(*(void *)(a1[6] + 8) + 40));
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

- (void)enumeratePopulatedStatisticsWithBlock:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (void (**)(id, void *, unsigned char *))a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v6 = (void *)[(NSMutableDictionary *)self->_statisticsByIndex copy];
  os_unfair_lock_unlock(p_lock);
  char v18 = 0;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = objc_msgSend(v6, "allKeys", 0);
  id v8 = [v7 sortedArrayUsingSelector:sel_compare_];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = [v6 objectForKeyedSubscript:*(void *)(*((void *)&v14 + 1) + 8 * i)];
        if (v13)
        {
          v4[2](v4, v13, &v18);
          if (v18)
          {

            goto LABEL_12;
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v14 objects:v19 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (id)_statisticsForLastIndex
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = (void *)[(NSMutableDictionary *)self->_statisticsByIndex copy];
  os_unfair_lock_unlock(p_lock);
  id v5 = [v4 allKeys];
  uint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 integerValue];

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v22 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if ([v13 integerValue] > v7) {
          uint64_t v7 = [v13 integerValue];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v10);
  }

  long long v14 = [NSNumber numberWithInteger:v7];
  long long v15 = [v4 objectForKey:v14];

  if (!v15)
  {
    id v19 = 0;
    id v20 = 0;
    [(HKStatisticsCollection *)self _timePeriodForStatisticsAtIndex:v7 startDate:&v20 endDate:&v19];
    id v16 = v20;
    id v17 = v19;
    long long v15 = (*((void (**)(void))self->_emptyStatisticsConstructor + 2))();
  }

  return v15;
}

- (id)_statisticsForIndex:(int64_t)a3
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  statisticsByIndex = self->_statisticsByIndex;
  uint64_t v7 = [NSNumber numberWithInteger:a3];
  id v8 = [(NSMutableDictionary *)statisticsByIndex objectForKey:v7];

  os_unfair_lock_unlock(p_lock);
  if (!v8)
  {
    id v12 = 0;
    id v13 = 0;
    [(HKStatisticsCollection *)self _timePeriodForStatisticsAtIndex:a3 startDate:&v13 endDate:&v12];
    id v9 = v13;
    id v10 = v12;
    id v8 = (*((void (**)(void))self->_emptyStatisticsConstructor + 2))();
  }

  return v8;
}

- (void)_timePeriodForStatisticsAtIndex:(int64_t)a3 startDate:(id *)a4 endDate:(id *)a5
{
  id v9 = [(NSDateComponents *)self->_statisticsInterval hk_dateByAddingInterval:a3 toDate:self->_anchorDate];
  id v10 = v9;
  if (a4)
  {
    *a4 = v9;
    id v9 = v10;
  }
  if (a5)
  {
    *a5 = [(NSDateComponents *)self->_statisticsInterval hk_dateByAddingInterval:a3 + 1 toDate:self->_anchorDate];
    id v9 = v10;
  }
}

- (void)_enumerateStatisticsIndexesFromDate:(id)a3 toDate:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(id, uint64_t, char *))a5;
  if (v8)
  {
    if (v9)
    {
      uint64_t v17 = 0;
      uint64_t v11 = [(HKStatisticsCollection *)self _statisticsDateIntervalAndIndex:&v17 forDate:v8];

      if (v11)
      {
        uint64_t v16 = 0;
        id v12 = [(HKStatisticsCollection *)self _statisticsDateIntervalAndIndex:&v16 forDate:v9];

        if (v12)
        {
          char v15 = 0;
          do
          {
            id v13 = (void *)MEMORY[0x19F395970]();
            v10[2](v10, v17++, &v15);
          }
          while (v17 <= v16 && v15 == 0);
        }
      }
    }
  }
}

- (id)_statisticsDateIntervalAndIndex:(int64_t *)a3 forDate:(id)a4
{
  if (a4)
  {
    id v4 = [(NSDateComponents *)self->_statisticsInterval hk_dateIntervalForDate:a4 anchorDate:self->_anchorDate outIndex:a3];
  }
  else
  {
    _HKInitializeLogging();
    id v5 = HKLogQuery;
    if (os_log_type_enabled((os_log_t)HKLogQuery, OS_LOG_TYPE_ERROR)) {
      -[HKStatisticsCollection _statisticsDateIntervalAndIndex:forDate:](v5);
    }
    id v4 = 0;
  }

  return v4;
}

- (id)_statisticsDateIntervalAtIndex:(int64_t)a3
{
  id v5 = [HKDateInterval alloc];
  uint64_t v6 = [(NSDateComponents *)self->_statisticsInterval hk_dateByAddingInterval:a3 toDate:self->_anchorDate];
  uint64_t v7 = [(NSDateComponents *)self->_statisticsInterval hk_dateByAddingInterval:a3 + 1 toDate:self->_anchorDate];
  id v8 = [(HKDateInterval *)v5 initWithStartDate:v6 endDate:v7];

  return v8;
}

- (NSDate)anchorDate
{
  return self->_anchorDate;
}

- (NSDateComponents)statisticsInterval
{
  return self->_statisticsInterval;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_statisticsInterval, 0);
  objc_storeStrong((id *)&self->_anchorDate, 0);
  objc_storeStrong((id *)&self->_cachedSources, 0);
  objc_storeStrong((id *)&self->_statisticsByIndex, 0);

  objc_storeStrong(&self->_emptyStatisticsConstructor, 0);
}

- (void)_statisticsDateIntervalAndIndex:(os_log_t)log forDate:.cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19C023000, log, OS_LOG_TYPE_ERROR, "Cannot find statistics period for nil date", v1, 2u);
}

@end