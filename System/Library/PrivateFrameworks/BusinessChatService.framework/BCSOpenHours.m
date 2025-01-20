@interface BCSOpenHours
+ (BOOL)supportsSecureCoding;
- (BCSOpenHours)initWithCoder:(id)a3;
- (BCSOpenHours)initWithHoursMessages:(id)a3 timeZone:(id)a4;
- (BCSOpenHours)initWithHoursPeriodMessage:(id)a3 timeZone:(id)a4;
- (BCSOpenHours)initWithJSONObj:(id)a3 timeZone:(id)a4;
- (BCSOpenHours)initWithOpenHours:(id)a3 timeZone:(id)a4;
- (BCSOpenHours)initWithTimeRanges:(id)a3 timeZone:(id)a4;
- (BOOL)_validTimeRange:(void *)a1;
- (BOOL)isOpenAtDate:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dateWhenOpenNextAfterDate:(id)a3;
- (id)debugDescription;
- (uint64_t)_totalSecondsInLocalTimeFromPreviousMidnightWithDate:(void *)a1 timeZone:(void *)a2;
- (uint64_t)_weekdayOrdinalFromDate:(void *)a1 timeZone:(void *)a2;
- (void)encodeWithCoder:(id)a3;
@end

@implementation BCSOpenHours

- (BCSOpenHours)initWithTimeRanges:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)BCSOpenHours;
  v8 = [(BCSOpenHours *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    timeRanges = v8->_timeRanges;
    v8->_timeRanges = (NSDictionary *)v9;

    uint64_t v11 = [MEMORY[0x263EFFA18] timeZoneWithName:v7];
    localTimeZone = v8->_localTimeZone;
    v8->_localTimeZone = (NSTimeZone *)v11;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  timeRanges = self->_timeRanges;
  id v5 = a3;
  [v5 encodeObject:timeRanges forKey:@"kBCSOpenHoursCoderTimeRangeKey"];
  [v5 encodeObject:self->_localTimeZone forKey:@"kBCSOpenHoursCodertimeZoneKey"];
}

- (BCSOpenHours)initWithCoder:(id)a3
{
  v4 = (void *)MEMORY[0x263EFFA08];
  id v5 = a3;
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_msgSend(v4, "setWithObjects:", v6, v7, v8, objc_opt_class(), 0);
  v10 = [v5 decodeObjectOfClasses:v9 forKey:@"kBCSOpenHoursCoderTimeRangeKey"];

  uint64_t v11 = [v5 decodeObjectOfClass:objc_opt_class() forKey:@"kBCSOpenHoursCodertimeZoneKey"];

  v12 = [v11 name];
  v13 = [(BCSOpenHours *)self initWithTimeRanges:v10 timeZone:v12];

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (BOOL)isOpenAtDate:(id)a3
{
  id v3 = a3;
  uint64_t v40 = *MEMORY[0x263EF8340];
  if (self)
  {
    localTimeZone = self->_localTimeZone;
    id v6 = a3;
    uint64_t v7 = localTimeZone;
    if ([(NSDictionary *)self->_timeRanges count])
    {
      uint64_t v8 = -[BCSOpenHours _weekdayOrdinalFromDate:timeZone:](v6, v7);
      timeRanges = self->_timeRanges;
      v10 = NSNumber;
      uint64_t v11 = timeRanges;
      uint64_t v29 = v8;
      v12 = [v10 numberWithUnsignedInteger:v8];
      v13 = [(NSDictionary *)v11 objectForKey:v12];

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id obj = v13;
      uint64_t v14 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v32 = *(void *)v34;
        id v30 = v3;
        while (2)
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v34 != v32) {
              objc_enumerationMutation(obj);
            }
            v17 = *(void **)(*((void *)&v33 + 1) + 8 * i);
            BOOL v18 = -[BCSOpenHours _validTimeRange:](v17);
            if (!v18)
            {
              v19 = ABSLogCommon();
              id v3 = v30;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134217984;
                uint64_t v38 = v29;
                _os_log_error_impl(&dword_2154F4000, v19, OS_LOG_TYPE_ERROR, "Does not have valid time range for weekdayIndex:%lu", buf, 0xCu);
              }
              goto LABEL_21;
            }
            v19 = [v17 objectForKey:@"from"];
            v20 = [v17 objectForKey:@"to"];
            id v21 = v6;
            v22 = v7;
            uint64_t v23 = -[BCSOpenHours _totalSecondsInLocalTimeFromPreviousMidnightWithDate:timeZone:](v6, v7);
            uint64_t v24 = [v19 integerValue];
            uint64_t v25 = [v20 integerValue];

            if (v23 >= v24 && v23 <= v25)
            {
              id v3 = v30;
              uint64_t v7 = v22;
LABEL_21:

              goto LABEL_22;
            }

            uint64_t v7 = v22;
            id v6 = v21;
          }
          uint64_t v15 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
          BOOL v18 = 0;
          id v3 = v30;
          if (v15) {
            continue;
          }
          break;
        }
      }
      else
      {
        BOOL v18 = 0;
      }
LABEL_22:
    }
    else
    {
      BOOL v18 = 1;
    }
  }
  else
  {
    id v28 = a3;
    uint64_t v7 = 0;
    BOOL v18 = 0;
  }

  return v18;
}

- (uint64_t)_weekdayOrdinalFromDate:(void *)a1 timeZone:(void *)a2
{
  id v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 currentCalendar];
  [v6 setTimeZone:v4];

  uint64_t v7 = [v6 components:512 fromDate:v5];

  uint64_t v8 = [v7 weekday];
  return v8 - 1;
}

- (BOOL)_validTimeRange:(void *)a1
{
  id v1 = a1;
  id v2 = [MEMORY[0x263EFF9D0] null];

  BOOL v3 = 0;
  if (v1 && v2 != v1)
  {
    id v4 = [v1 allKeys];
    BOOL v3 = [v4 count] == 2;
  }
  return v3;
}

- (uint64_t)_totalSecondsInLocalTimeFromPreviousMidnightWithDate:(void *)a1 timeZone:(void *)a2
{
  BOOL v3 = (void *)MEMORY[0x263EFF8F0];
  id v4 = a2;
  id v5 = a1;
  id v6 = [v3 currentCalendar];
  [v6 setTimeZone:v4];

  uint64_t v7 = [v6 components:96 fromDate:v5];

  uint64_t v8 = [v7 hour];
  uint64_t v9 = [v7 minute];

  return 60 * (v9 + 60 * v8);
}

- (id)dateWhenOpenNextAfterDate:(id)a3
{
  id v3 = a3;
  uint64_t v47 = *MEMORY[0x263EF8340];
  if (self)
  {
    id v4 = self;
    localTimeZone = self->_localTimeZone;
    id v6 = a3;
    long long v33 = localTimeZone;
    uint64_t v37 = -[BCSOpenHours _weekdayOrdinalFromDate:timeZone:](v6, v33);
    uint64_t v32 = v6;
    uint64_t v7 = -[BCSOpenHours _totalSecondsInLocalTimeFromPreviousMidnightWithDate:timeZone:](v6, v4->_localTimeZone);
    if (-[BCSOpenHours _validTimeRange:](0))
    {
      unsigned int v36 = 0;
      uint64_t v8 = 0;
    }
    else
    {
      uint64_t v8 = 0;
      unsigned int v36 = 0;
      unint64_t v9 = 0;
      long long v35 = v4;
      do
      {
        uint64_t v10 = ((v9 + v37) * (unsigned __int128)0x2492492492492493uLL) >> 64;
        uint64_t v11 = v9 + v37 - 7 * ((v10 + ((v9 + v37 - v10) >> 1)) >> 2);
        v12 = NSNumber;
        v13 = v4->_timeRanges;
        uint64_t v14 = [v12 numberWithUnsignedInteger:v11];
        uint64_t v15 = [(NSDictionary *)v13 objectForKey:v14];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v16 = v15;
        uint64_t v17 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
        if (v17)
        {
          uint64_t v18 = v17;
          uint64_t v19 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v18; ++i)
            {
              if (*(void *)v39 != v19) {
                objc_enumerationMutation(v16);
              }
              id v21 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              if (-[BCSOpenHours _validTimeRange:](v21))
              {
                v22 = [v21 objectForKey:@"from"];
                if (v7 < [v22 integerValue] || v9 != 0)
                {
                  id v24 = v21;

                  unsigned int v36 = v9;
                  uint64_t v8 = v24;
                  goto LABEL_19;
                }
              }
            }
            uint64_t v18 = [v16 countByEnumeratingWithState:&v38 objects:v46 count:16];
          }
          while (v18);
LABEL_19:
          id v4 = v35;
        }

        if (-[BCSOpenHours _validTimeRange:](v8)) {
          break;
        }
      }
      while (v9++ < 7);
    }
    if (-[BCSOpenHours _validTimeRange:](v8))
    {
      v26 = [v8 objectForKey:@"from"];
      [v32 timeIntervalSince1970];
      id v28 = objc_msgSend(MEMORY[0x263EFF910], "dateWithTimeIntervalSince1970:", (double)(86400 * v36 - v7 + -[NSObject integerValue](v26, "integerValue") + (uint64_t)v27));
    }
    else
    {
      v26 = ABSLogCommon();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v43 = v32;
        __int16 v44 = 2048;
        uint64_t v45 = v37;
        _os_log_error_impl(&dword_2154F4000, v26, OS_LOG_TYPE_ERROR, "Valid date not found for open next after date:%@ weekdayIndex:%lu", buf, 0x16u);
      }
      id v28 = 0;
    }
    uint64_t v29 = v33;
    id v3 = a3;
  }
  else
  {
    id v31 = a3;
    uint64_t v29 = 0;
    id v28 = 0;
  }

  return v28;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    if (self)
    {
      id v6 = self->_localTimeZone;
      uint64_t v7 = [(NSTimeZone *)v6 copyWithZone:a3];
      uint64_t v8 = (void *)v5[2];
      v5[2] = v7;

      timeRanges = self->_timeRanges;
    }
    else
    {
      uint64_t v14 = [0 copyWithZone:a3];
      uint64_t v15 = (void *)v5[2];
      v5[2] = v14;

      timeRanges = 0;
    }
    uint64_t v10 = timeRanges;
    uint64_t v11 = [(NSDictionary *)v10 copyWithZone:a3];
    v12 = (void *)v5[1];
    v5[1] = v11;
  }
  return v5;
}

- (id)debugDescription
{
  id v2 = self;
  uint64_t v3 = 0;
  id v4 = &stru_26C611188;
  uint64_t v31 = *MEMORY[0x263EF8340];
  do
  {
    if (v2) {
      timeRanges = v2->_timeRanges;
    }
    else {
      timeRanges = 0;
    }
    id v6 = NSNumber;
    uint64_t v7 = timeRanges;
    uint64_t v8 = [v6 numberWithInt:v3];
    unint64_t v9 = [(NSDictionary *)v7 objectForKey:v8];

    if (v2)
    {
      uint64_t v10 = @"Invalid week index";
      if (v3 <= 6) {
        uint64_t v10 = off_2642487F8[v3];
      }
    }
    else
    {
      uint64_t v10 = 0;
    }
    int v25 = v3;
    uint64_t v11 = [NSString stringWithFormat:@"%@:\n", v10];
    uint64_t v12 = [(__CFString *)v4 stringByAppendingString:v11];

    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v13 = v9;
    uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v27;
      id v4 = (__CFString *)v12;
      do
      {
        uint64_t v17 = 0;
        uint64_t v18 = v4;
        do
        {
          if (*(void *)v27 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v19 = *(void **)(*((void *)&v26 + 1) + 8 * v17);
          v20 = [v19 objectForKey:@"from"];
          id v21 = [v19 objectForKey:@"to"];
          v22 = objc_msgSend(NSString, "stringWithFormat:", @"\t%d - %d\n", objc_msgSend(v20, "intValue"), objc_msgSend(v21, "intValue"));
          id v4 = [(__CFString *)v18 stringByAppendingString:v22];

          ++v17;
          uint64_t v18 = v4;
        }
        while (v15 != v17);
        uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v15);
    }
    else
    {
      id v4 = (__CFString *)v12;
    }

    uint64_t v3 = (v25 + 1);
    id v2 = self;
  }
  while (v25 != 6);

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localTimeZone, 0);

  objc_storeStrong((id *)&self->_timeRanges, 0);
}

- (BCSOpenHours)initWithHoursPeriodMessage:(id)a3 timeZone:(id)a4
{
  id v6 = a4;
  uint64_t v7 = [a3 hours];
  uint64_t v8 = [(BCSOpenHours *)self initWithHoursMessages:v7 timeZone:v6];

  return v8;
}

- (BCSOpenHours)initWithHoursMessages:(id)a3 timeZone:(id)a4
{
  uint64_t v23 = self;
  uint64_t v43 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v24 = a4;
  long long v27 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id obj = v5;
  uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v36;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v36 != v26) {
          objc_enumerationMutation(obj);
        }
        uint64_t v30 = v6;
        uint64_t v7 = *(void **)(*((void *)&v35 + 1) + 8 * v6);
        uint64_t v8 = objc_msgSend(v7, "timeRanges", v23);
        uint64_t v29 = *(int *)[v7 days];
        unint64_t v9 = objc_opt_new();
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        id v10 = v8;
        uint64_t v11 = [v10 countByEnumeratingWithState:&v31 objects:v41 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v32;
          do
          {
            for (uint64_t i = 0; i != v12; ++i)
            {
              if (*(void *)v32 != v13) {
                objc_enumerationMutation(v10);
              }
              uint64_t v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
              if ([v15 hasAllDay] && objc_msgSend(v15, "allDay"))
              {
                uint64_t v16 = [NSNumber numberWithInteger:86400];
                uint64_t v17 = &unk_26C628D50;
              }
              else
              {
                uint64_t v17 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "from"));
                uint64_t v16 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v15, "to"));
              }
              v39[0] = @"from";
              v39[1] = @"to";
              v40[0] = v17;
              v40[1] = v16;
              uint64_t v18 = [NSDictionary dictionaryWithObjects:v40 forKeys:v39 count:2];
              [v9 addObject:v18];
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v31 objects:v41 count:16];
          }
          while (v12);
        }

        uint64_t v19 = [NSNumber numberWithInteger:v29 - 1];
        [v27 setObject:v9 forKey:v19];

        uint64_t v6 = v30 + 1;
      }
      while (v30 + 1 != v28);
      uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v42 count:16];
    }
    while (v28);
  }

  v20 = (void *)[v27 copy];
  id v21 = [(BCSOpenHours *)v23 initWithTimeRanges:v20 timeZone:v24];

  return v21;
}

- (BCSOpenHours)initWithJSONObj:(id)a3 timeZone:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    uint64_t v8 = [v6 dataUsingEncoding:4];
    uint64_t v12 = 0;
    unint64_t v9 = [MEMORY[0x263F08900] JSONObjectWithData:v8 options:1 error:&v12];
    if (v12)
    {
      id v10 = 0;
    }
    else
    {
      self = [(BCSOpenHours *)self initWithOpenHours:v9 timeZone:v7];
      id v10 = self;
    }
  }
  else
  {
    id v10 = 0;
  }

  return v10;
}

- (BCSOpenHours)initWithOpenHours:(id)a3 timeZone:(id)a4
{
  uint64_t v54 = *MEMORY[0x263EF8340];
  id v5 = a3;
  id v30 = a4;
  long long v33 = objc_opt_new();
  long long v31 = v5;
  id v6 = [v5 firstObject];
  id v7 = [v6 objectForKeyedSubscript:@"hours"];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
  {
    unint64_t v9 = ABSLogCommon();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_2154F4000, v9, OS_LOG_TYPE_ERROR, "Open Hours dictionary doesn't have array at first level", buf, 2u);
    }
  }
  objc_msgSend(v6, "objectForKeyedSubscript:", @"hours", v6);
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
  if (v36)
  {
    uint64_t v34 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v36; ++i)
      {
        if (*(void *)v46 != v34) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v12 = [v11 objectForKeyedSubscript:@"day"];
        uint64_t v13 = [v12 firstObject];
        uint64_t v14 = [(BCSOpenHours *)self _weekdayIndexFromWeekdayString:v13];
        if (v14 != -1)
        {
          uint64_t v37 = v14;
          long long v38 = v13;
          long long v39 = v12;
          uint64_t v40 = i;
          uint64_t v15 = objc_opt_new();
          uint64_t v16 = [v11 objectForKeyedSubscript:@"timeRange"];
          long long v41 = 0u;
          long long v42 = 0u;
          long long v43 = 0u;
          long long v44 = 0u;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v41 objects:v52 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v42;
            do
            {
              for (uint64_t j = 0; j != v18; ++j)
              {
                if (*(void *)v42 != v19) {
                  objc_enumerationMutation(v16);
                }
                id v21 = *(void **)(*((void *)&v41 + 1) + 8 * j);
                v22 = [v21 objectForKeyedSubscript:@"from"];
                uint64_t v23 = [v21 objectForKeyedSubscript:@"to"];
                v50[0] = @"from";
                v50[1] = @"to";
                v51[0] = v22;
                v51[1] = v23;
                id v24 = [NSDictionary dictionaryWithObjects:v51 forKeys:v50 count:2];
                [v15 addObject:v24];
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v41 objects:v52 count:16];
            }
            while (v18);
          }
          int v25 = [NSNumber numberWithInteger:v37];
          [v33 setObject:v15 forKey:v25];

          uint64_t v12 = v39;
          uint64_t i = v40;
          uint64_t v13 = v38;
        }
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v45 objects:v53 count:16];
    }
    while (v36);
  }
  uint64_t v26 = (void *)[v33 copy];
  long long v27 = [(BCSOpenHours *)self initWithTimeRanges:v26 timeZone:v30];

  return v27;
}

@end