@interface BaseDateProvider
- (BaseDateProvider)initWithCalendar:(id)a3 locale:(id)a4 timeZone:(id)a5;
- (NSCalendar)calendar;
- (NSDate)timerEndDate;
- (NSDateInterval)timerInterval;
- (NSLocale)locale;
- (NSTimeZone)timeZone;
- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4;
- (id)_timeFormatByRemovingDesignatorOfTimeFormat:(id)a3;
- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 andRemovingDesignator:(BOOL)a4 designatorExists:(BOOL *)a5;
- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorExists:(BOOL *)a4;
- (id)formattedString;
- (id)formattedStringInContext:(id)a3;
- (id)updateInterval;
- (int64_t)_updateFrequency;
- (int64_t)updateType;
- (unint64_t)updateWallClockAlignment;
- (void)setCalendar:(id)a3;
- (void)setLocale:(id)a3;
- (void)setTimeZone:(id)a3;
@end

@implementation BaseDateProvider

- (BaseDateProvider)initWithCalendar:(id)a3 locale:(id)a4 timeZone:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BaseDateProvider;
  v12 = [(BaseDateProvider *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_calendar, a3);
    objc_storeStrong((id *)&v13->_locale, a4);
    objc_storeStrong((id *)&v13->_timeZone, a5);
  }

  return v13;
}

- (id)formattedString
{
  v3 = objc_alloc_init(DateFormattingContext);
  v4 = [(BaseDateProvider *)self formattedStringInContext:v3];

  return v4;
}

- (id)formattedStringInContext:(id)a3
{
  id v4 = a3;
  v5 = [v4 referenceDate];
  [(BaseDateProvider *)self _startSessionWithDate:v5];

  v6 = [(BaseDateProvider *)self _sessionTextForIndex:0 context:v4];

  [(BaseDateProvider *)self _endSession];

  return v6;
}

- (int64_t)updateType
{
  return 0;
}

- (id)updateInterval
{
  int64_t v2 = [(BaseDateProvider *)self _updateFrequency];
  if ((unint64_t)(v2 - 1) > 2) {
    return 0;
  }
  else {
    return *(&off_2651D44E0 + v2 - 1);
  }
}

- (unint64_t)updateWallClockAlignment
{
  return 0;
}

- (NSDateInterval)timerInterval
{
  return 0;
}

- (NSDate)timerEndDate
{
  return 0;
}

- (id)_sessionTextForIndex:(int64_t)a3 context:(id)a4
{
  return &stru_26FA95DA0;
}

- (int64_t)_updateFrequency
{
  return 0;
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 designatorExists:(BOOL *)a4
{
  return [(BaseDateProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:a3 andRemovingDesignator:0 designatorExists:a4];
}

- (id)_timeFormatByRemovingDesignatorOfTimeFormat:(id)a3
{
  return [(BaseDateProvider *)self _timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:a3 andRemovingDesignator:1 designatorExists:0];
}

- (id)_timeFormatByRemovingWhitespaceAroundDesignatorOfTimeFormat:(id)a3 andRemovingDesignator:(BOOL)a4 designatorExists:(BOOL *)a5
{
  BOOL v6 = a4;
  uint64_t v48 = *MEMORY[0x263EF8340];
  id v8 = a3;
  [MEMORY[0x263F08790] _componentsFromFormatString:v8];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    v40 = a5;
    v41 = self;
    BOOL v42 = v6;
    uint64_t v12 = *(void *)v44;
    uint64_t v13 = *MEMORY[0x263EFF468];
    uint64_t v14 = *MEMORY[0x263EFF470];
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v44 != v12) {
          objc_enumerationMutation(v9);
        }
        v16 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v17 = objc_msgSend(v16, "objectForKeyedSubscript:", v13, v40, v41);
        if (([v17 BOOLValue] & 1) == 0)
        {
          v18 = [v16 objectForKeyedSubscript:v14];
          if ([v18 hasPrefix:@"a"])
          {
            unint64_t v19 = [v9 indexOfObject:v16];

            goto LABEL_13;
          }
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v43 objects:v47 count:16];
      if (v11) {
        continue;
      }
      break;
    }
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_13:
    BOOL v6 = v42;
    a5 = v40;
    self = v41;
  }
  else
  {
    unint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (a5) {
    *a5 = v19 != 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v19 != 0x7FFFFFFFFFFFFFFFLL)
  {
    [(BaseDateProvider *)self locale];

    if (v6)
    {
      if (v19)
      {
        v20 = [v9 objectAtIndexedSubscript:v19 - 1];
        v21 = [v20 objectForKeyedSubscript:*MEMORY[0x263EFF468]];
        if ([v21 BOOLValue])
        {
          v22 = [v20 objectForKeyedSubscript:*MEMORY[0x263EFF470]];
          v23 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          v24 = [v22 stringByTrimmingCharactersInSet:v23];

          BOOL v25 = [v24 length] == 0;
        }
        else
        {
          BOOL v25 = 0;
        }
      }
      else
      {
        BOOL v25 = 0;
      }
      if (v19 >= [v9 count] - 1)
      {
        v34 = (void *)[v9 mutableCopy];
      }
      else
      {
        unint64_t v26 = v19 + 1;
        v27 = [v9 objectAtIndexedSubscript:v19 + 1];
        v28 = [v27 objectForKeyedSubscript:*MEMORY[0x263EFF468]];
        if ([v28 BOOLValue])
        {
          v29 = [v27 objectForKeyedSubscript:*MEMORY[0x263EFF470]];
          v30 = [MEMORY[0x263F08708] whitespaceCharacterSet];
          [v29 stringByTrimmingCharactersInSet:v30];
          v32 = id v31 = v8;

          BOOL v33 = [v32 length] == 0;
          id v8 = v31;
          unint64_t v26 = v19 + 1;
        }
        else
        {
          BOOL v33 = 0;
        }

        v35 = (void *)[v9 mutableCopy];
        v34 = v35;
        if (v33) {
          [v35 removeObjectAtIndex:v26];
        }
      }
      [v34 removeObjectAtIndex:v19];
      if (v25) {
        [v34 removeObjectAtIndex:v19 - 1];
      }
      id v36 = v34;

      uint64_t v37 = [MEMORY[0x263F08790] _formatStringFromComponents:v36];

      id v8 = (id)v37;
      id v9 = v36;
    }
  }
  id v38 = v8;

  return v38;
}

- (NSCalendar)calendar
{
  return self->_calendar;
}

- (void)setCalendar:(id)a3
{
}

- (NSLocale)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return self->_timeZone;
}

- (void)setTimeZone:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeZone, 0);
  objc_storeStrong((id *)&self->_locale, 0);

  objc_storeStrong((id *)&self->_calendar, 0);
}

@end