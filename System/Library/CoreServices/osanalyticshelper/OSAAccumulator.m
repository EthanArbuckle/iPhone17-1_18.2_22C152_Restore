@interface OSAAccumulator
- (NSCalendar)calendar;
- (NSMutableDictionary)totals;
- (NSString)targetKey;
- (OSAAccumulator)init;
- (id)aggregatedTotalsAsDouble;
- (id)aggregatedTotalsAsUnsignedInteger;
- (id)keyForDate:(id)a3;
- (id)numberForKey:(id)a3 onDate:(id)a4;
- (void)addDouble:(double)a3 forKey:(id)a4 onDate:(id)a5;
- (void)addUnsignedInteger:(unint64_t)a3 forKey:(id)a4 onDate:(id)a5;
- (void)setNumber:(id)a3 forKey:(id)a4 onDate:(id)a5;
- (void)setTargetKey:(id)a3;
@end

@implementation OSAAccumulator

- (OSAAccumulator)init
{
  v9.receiver = self;
  v9.super_class = (Class)OSAAccumulator;
  v2 = [(OSAAccumulator *)&v9 init];
  if (v2)
  {
    uint64_t v3 = +[NSMutableDictionary dictionary];
    totals = v2->_totals;
    v2->_totals = (NSMutableDictionary *)v3;

    uint64_t v5 = +[NSCalendar calendarWithIdentifier:NSCalendarIdentifierGregorian];
    calendar = v2->_calendar;
    v2->_calendar = (NSCalendar *)v5;

    v7 = +[NSTimeZone timeZoneWithAbbreviation:@"UTC"];
    [(NSCalendar *)v2->_calendar setTimeZone:v7];
  }
  return v2;
}

- (id)aggregatedTotalsAsUnsignedInteger
{
  v19 = +[NSMutableDictionary dictionary];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  obj = self->_totals;
  id v20 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v20)
  {
    uint64_t v18 = *(void *)v26;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v26 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void *)(*((void *)&v25 + 1) + 8 * i);
        long long v21 = 0u;
        long long v22 = 0u;
        long long v23 = 0u;
        long long v24 = 0u;
        uint64_t v5 = [(NSMutableDictionary *)self->_totals objectForKeyedSubscript:v4];
        id v6 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v6)
        {
          id v7 = v6;
          uint64_t v8 = 0;
          uint64_t v9 = *(void *)v22;
          do
          {
            for (j = 0; j != v7; j = (char *)j + 1)
            {
              if (*(void *)v22 != v9) {
                objc_enumerationMutation(v5);
              }
              uint64_t v11 = *(void *)(*((void *)&v21 + 1) + 8 * (void)j);
              v12 = [(NSMutableDictionary *)self->_totals objectForKeyedSubscript:v4];
              v13 = [v12 objectForKeyedSubscript:v11];
              v8 += (uint64_t)[v13 unsignedIntegerValue];
            }
            id v7 = [v5 countByEnumeratingWithState:&v21 objects:v29 count:16];
          }
          while (v7);
        }
        else
        {
          uint64_t v8 = 0;
        }

        v14 = +[NSNumber numberWithUnsignedInteger:v8];
        [v19 setObject:v14 forKeyedSubscript:v4];
      }
      id v20 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v20);
  }

  v15 = +[NSDictionary dictionaryWithDictionary:v19];

  return v15;
}

- (id)aggregatedTotalsAsDouble
{
  long long v22 = +[NSMutableDictionary dictionary];
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  obj = self->_totals;
  id v3 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v21 = *(void *)v28;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v28 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v6 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v7 = [(NSMutableDictionary *)self->_totals objectForKeyedSubscript:v6];
        id v8 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v8)
        {
          id v9 = v8;
          uint64_t v10 = *(void *)v24;
          double v11 = 0.0;
          do
          {
            for (j = 0; j != v9; j = (char *)j + 1)
            {
              if (*(void *)v24 != v10) {
                objc_enumerationMutation(v7);
              }
              uint64_t v13 = *(void *)(*((void *)&v23 + 1) + 8 * (void)j);
              v14 = [(NSMutableDictionary *)self->_totals objectForKeyedSubscript:v6];
              v15 = [v14 objectForKeyedSubscript:v13];
              [v15 doubleValue];
              double v11 = v11 + v16;
            }
            id v9 = [v7 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v9);
        }
        else
        {
          double v11 = 0.0;
        }

        v17 = +[NSNumber numberWithDouble:v11];
        [v22 setObject:v17 forKeyedSubscript:v6];
      }
      id v4 = [(NSMutableDictionary *)obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v4);
  }

  uint64_t v18 = +[NSDictionary dictionaryWithDictionary:v22];

  return v18;
}

- (id)keyForDate:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(OSAAccumulator *)self calendar];
  uint64_t v6 = [v5 startOfDayForDate:v4];

  return v6;
}

- (id)numberForKey:(id)a3 onDate:(id)a4
{
  id v6 = a3;
  id v7 = [(OSAAccumulator *)self keyForDate:a4];
  id v8 = [(NSMutableDictionary *)self->_totals objectForKeyedSubscript:v6];

  id v9 = [v8 objectForKeyedSubscript:v7];

  return v9;
}

- (void)setNumber:(id)a3 forKey:(id)a4 onDate:(id)a5
{
  id v15 = a4;
  id v8 = a5;
  totals = self->_totals;
  id v10 = a3;
  double v11 = [(NSMutableDictionary *)totals objectForKeyedSubscript:v15];

  if (!v11)
  {
    v12 = +[NSMutableDictionary dictionary];
    [(NSMutableDictionary *)self->_totals setObject:v12 forKeyedSubscript:v15];
  }
  uint64_t v13 = [(OSAAccumulator *)self keyForDate:v8];
  v14 = [(NSMutableDictionary *)self->_totals objectForKeyedSubscript:v15];
  [v14 setObject:v10 forKeyedSubscript:v13];
}

- (void)addUnsignedInteger:(unint64_t)a3 forKey:(id)a4 onDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(OSAAccumulator *)self numberForKey:v9 onDate:v8];
  double v11 = (char *)[v10 unsignedIntegerValue] + a3;

  id v12 = +[NSNumber numberWithUnsignedInteger:v11];
  [(OSAAccumulator *)self setNumber:v12 forKey:v9 onDate:v8];
}

- (void)addDouble:(double)a3 forKey:(id)a4 onDate:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = [(OSAAccumulator *)self numberForKey:v9 onDate:v8];
  [v10 doubleValue];
  double v12 = v11 + a3;

  id v13 = +[NSNumber numberWithDouble:v12];
  [(OSAAccumulator *)self setNumber:v13 forKey:v9 onDate:v8];
}

- (NSMutableDictionary)totals
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (NSCalendar)calendar
{
  return (NSCalendar *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)targetKey
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void)setTargetKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_targetKey, 0);
  objc_storeStrong((id *)&self->_calendar, 0);

  objc_storeStrong((id *)&self->_totals, 0);
}

@end