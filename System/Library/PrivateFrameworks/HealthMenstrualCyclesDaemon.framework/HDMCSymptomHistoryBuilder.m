@interface HDMCSymptomHistoryBuilder
- (HDMCSymptomHistoryBuilder)initWithCurrentDayIndex:(int64_t)a3;
- (unint64_t)recentSymptoms;
- (void)addSymptoms:(unint64_t)a3 forDayIndex:(int64_t)a4;
- (void)setRecentSymptoms:(unint64_t)a3;
@end

@implementation HDMCSymptomHistoryBuilder

- (HDMCSymptomHistoryBuilder)initWithCurrentDayIndex:(int64_t)a3
{
  v7.receiver = self;
  v7.super_class = (Class)HDMCSymptomHistoryBuilder;
  v3 = [(HDMCSymptomHistoryBuilder *)&v7 init];
  if (v3)
  {
    uint64_t v4 = [MEMORY[0x263EFF9A0] dictionary];
    mostRecentDayBySymptom = v3->_mostRecentDayBySymptom;
    v3->_mostRecentDayBySymptom = (NSMutableDictionary *)v4;
  }
  return v3;
}

- (void)addSymptoms:(unint64_t)a3 forDayIndex:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v6 = HKMCDaySummarySymptomArrayFromSymptoms();
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
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * i);
        v12 = [(NSMutableDictionary *)self->_mostRecentDayBySymptom objectForKeyedSubscript:v11];
        v13 = v12;
        if (!v12 || [v12 integerValue] < a4)
        {
          v14 = [NSNumber numberWithInteger:a4];
          [(NSMutableDictionary *)self->_mostRecentDayBySymptom setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }
}

- (unint64_t)recentSymptoms
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v2 = [(NSMutableDictionary *)self->_mostRecentDayBySymptom keysSortedByValueUsingSelector:sel_compare_];
  v3 = [v2 reverseObjectEnumerator];
  uint64_t v4 = [v3 allObjects];

  unint64_t v5 = [v4 count];
  if (v5 >= 3) {
    uint64_t v6 = 3;
  }
  else {
    uint64_t v6 = v5;
  }
  uint64_t v7 = objc_msgSend(v4, "subarrayWithRange:", 0, v6);

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = v7;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    unint64_t v11 = 0;
    uint64_t v12 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v12) {
          objc_enumerationMutation(v8);
        }
        v11 |= objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "integerValue", (void)v15);
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  else
  {
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)setRecentSymptoms:(unint64_t)a3
{
  self->_recentSymptoms = a3;
}

- (void).cxx_destruct
{
}

@end