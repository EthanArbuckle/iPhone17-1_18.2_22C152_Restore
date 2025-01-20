@interface GEOHoursTestHelper
+ (GEOPDLocalTimeRange)_rangeWithFromHour:(int64_t)a3 fromMinute:(int64_t)a4 toHour:(int64_t)a5 toMinute:(int64_t)a6;
+ (id)_pdHoursFromHour:(int64_t)a3 fromMinute:(int64_t)a4 toHour:(int64_t)a5 toMinute:(int64_t)a6 inTimeZone:(id)a7 onDay:(int64_t)a8 month:(int64_t)a9 year:(int64_t)a10 openingThreshold:(double)a11 closingThreshold:(double)a12 shouldGoOverMidnight:(BOOL)a13;
+ (id)dateWithString:(id)a3;
+ (id)testBusinessHoursForMKLocalizedHoursBuilderTest;
+ (id)testBusinessHoursWithPermanentlyClosedHoursTypeForMKLocalizedHoursBuilderTest;
+ (id)testBusinessHoursWithTemporaryClosedHoursTypeForMKLocalizedHoursBuilderTest;
+ (id)testDateForMKLocalizedHoursBuilderTest;
+ (id)testTimeZoneForGEOPlaceDailyHoursTest;
+ (id)testTimeZoneForMKLocalizedHoursBuilderTest;
+ (id)testingDictionaryForIsWeekdayInRange;
@end

@implementation GEOHoursTestHelper

+ (id)dateWithString:(id)a3
{
  uint64_t v3 = _MergedGlobals_206;
  id v4 = a3;
  if (v3 != -1) {
    dispatch_once(&_MergedGlobals_206, &__block_literal_global_41);
  }
  v5 = [(id)qword_1EB29F7A8 dateFromString:v4];

  return v5;
}

void __37__GEOHoursTestHelper_dateWithString___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)qword_1EB29F7A8;
  qword_1EB29F7A8 = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)qword_1EB29F7A8 setLocale:v2];
  [(id)qword_1EB29F7A8 setDateFormat:@"yyyy-MM-dd HH:mm:ss Z"];
}

+ (id)testBusinessHoursForMKLocalizedHoursBuilderTest
{
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v4 setTimeZone:v2];
  LOBYTE(v8) = 0;
  v5 = +[GEOHoursTestHelper _pdHoursFromHour:10 fromMinute:30 toHour:15 toMinute:30 inTimeZone:v2 onDay:1 month:3600.0 year:3600.0 openingThreshold:1 closingThreshold:2018 shouldGoOverMidnight:v8];
  v6 = [[GEOBusinessHours alloc] initWithGEOPDHours:v5 timeZone:v2];

  return v6;
}

+ (id)testBusinessHoursWithPermanentlyClosedHoursTypeForMKLocalizedHoursBuilderTest
{
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v4 setTimeZone:v2];
  LOBYTE(v10) = 0;
  v5 = +[GEOHoursTestHelper _pdHoursFromHour:10 fromMinute:30 toHour:15 toMinute:30 inTimeZone:v2 onDay:1 month:3600.0 year:3600.0 openingThreshold:1 closingThreshold:2018 shouldGoOverMidnight:v10];
  v6 = objc_alloc_init(GEOPDBusinessHours);
  v7 = (void *)[v5 mutableCopy];
  -[GEOPDBusinessHours setWeeklyHours:]((uint64_t)v6, v7);

  if (v6)
  {
    *(_WORD *)&v6->_flags |= 0x100u;
    *(_WORD *)&v6->_flags |= 4u;
    v6->_hoursType = 4;
  }
  uint64_t v8 = [[GEOBusinessHours alloc] initWithGEOPDBusinessHours:v6 timeZone:v2];

  return v8;
}

+ (id)testBusinessHoursWithTemporaryClosedHoursTypeForMKLocalizedHoursBuilderTest
{
  id v2 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  [v4 setTimeZone:v2];
  LOBYTE(v10) = 0;
  v5 = +[GEOHoursTestHelper _pdHoursFromHour:10 fromMinute:30 toHour:15 toMinute:30 inTimeZone:v2 onDay:1 month:3600.0 year:3600.0 openingThreshold:1 closingThreshold:2018 shouldGoOverMidnight:v10];
  v6 = objc_alloc_init(GEOPDBusinessHours);
  v7 = (void *)[v5 mutableCopy];
  -[GEOPDBusinessHours setWeeklyHours:]((uint64_t)v6, v7);

  if (v6)
  {
    *(_WORD *)&v6->_flags |= 0x100u;
    *(_WORD *)&v6->_flags |= 4u;
    v6->_hoursType = 3;
  }
  uint64_t v8 = [[GEOBusinessHours alloc] initWithGEOPDBusinessHours:v6 timeZone:v2];

  return v8;
}

+ (id)testDateForMKLocalizedHoursBuilderTest
{
  id v2 = [MEMORY[0x1E4F1C9C8] date];
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (void *)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v5 setDay:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v6 setDay:-1];
  v7 = [v4 components:512 fromDate:v2];
  uint64_t v8 = [v7 weekday];
  int v9 = v8 - 2;
  if (v8 == 2)
  {
    id v17 = v2;
  }
  else
  {
    uint64_t v10 = v8;
    int v11 = 2 - v8;
    uint64_t v12 = [v2 copy];
    v13 = (void *)v12;
    if (v10 >= 2) {
      int v14 = v9;
    }
    else {
      int v14 = v11;
    }
    if (v14 < 1)
    {
      id v17 = (id)v12;
    }
    else
    {
      if (v10 >= 2) {
        id v15 = v6;
      }
      else {
        id v15 = v5;
      }
      unsigned int v16 = v14 + 1;
      do
      {
        id v17 = [v4 dateByAddingComponents:v15 toDate:v13 options:0];

        --v16;
        v13 = v17;
      }
      while (v16 > 1);
    }
  }

  return v17;
}

+ (id)testTimeZoneForMKLocalizedHoursBuilderTest
{
  return (id)[MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/New_York"];
}

+ (id)testTimeZoneForGEOPlaceDailyHoursTest
{
  return (id)[MEMORY[0x1E4F1CAF0] timeZoneWithName:@"America/Cupertino"];
}

+ (id)_pdHoursFromHour:(int64_t)a3 fromMinute:(int64_t)a4 toHour:(int64_t)a5 toMinute:(int64_t)a6 inTimeZone:(id)a7 onDay:(int64_t)a8 month:(int64_t)a9 year:(int64_t)a10 openingThreshold:(double)a11 closingThreshold:(double)a12 shouldGoOverMidnight:(BOOL)a13
{
  int64_t v44 = a5;
  int64_t v45 = a6;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v18 = a7;
  v19 = objc_opt_new();
  id v20 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  v21 = (void *)[v20 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v22 = v21;
  if (v18)
  {
    id v23 = [v21 timeZone];

    if (v23 != v18) {
      [v22 setTimeZone:v18];
    }
  }
  v47 = v18;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1C9D8]);
  [v24 setYear:a10];
  [v24 setMonth:a9];
  [v24 setDay:a8];
  [v24 setHour:a3];
  [v24 setMinute:a4];
  v46 = [v22 dateFromComponents:v24];
  v25 = objc_msgSend(v22, "components:fromDate:", 512);
  v26 = objc_alloc_init(GEOPDHours);
  if (a13)
  {
    uint64_t v27 = +[GEOHoursTestHelper _rangeWithFromHour:a3 fromMinute:a4 toHour:24 toMinute:0];
    -[GEOPDHours addTimeRange:](v26, "addTimeRange:", v27, v28);
    -[GEOPDHours addDay:](v26, "addDay:", [v25 weekday]);
    v29 = objc_alloc_init(GEOPDHours);
    uint64_t v30 = +[GEOHoursTestHelper _rangeWithFromHour:0 fromMinute:0 toHour:v44 toMinute:v45];
    -[GEOPDHours addTimeRange:](v29, "addTimeRange:", v30, v31);
    if ([v25 weekday] == 7) {
      uint64_t v32 = 1;
    }
    else {
      uint64_t v32 = [v25 weekday] + 1;
    }
    -[GEOPDHours addDay:](v29, "addDay:", v32, v44, v45);
    [v19 addObject:v26];
    [v19 addObject:v29];
  }
  else
  {
    uint64_t v33 = +[GEOHoursTestHelper _rangeWithFromHour:a3 fromMinute:a4 toHour:v44 toMinute:v45];
    -[GEOPDHours addTimeRange:](v26, "addTimeRange:", v33, v34);
    -[GEOPDHours addDay:](v26, "addDay:", [v25 weekday]);
    [v19 addObject:v26];
  }

  v35 = objc_alloc_init(GEOPDHoursThreshold);
  v36 = v35;
  if (v35)
  {
    *(unsigned char *)&v35->_flags |= 2u;
    v35->_openingSoonMessageThresholdSecond = a11;
    *(unsigned char *)&v35->_flags |= 1u;
    v35->_closingSoonMessageThresholdSecond = a12;
  }
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v37 = v19;
  uint64_t v38 = [v37 countByEnumeratingWithState:&v48 objects:v52 count:16];
  if (v38)
  {
    uint64_t v39 = v38;
    uint64_t v40 = *(void *)v49;
    do
    {
      for (uint64_t i = 0; i != v39; ++i)
      {
        if (*(void *)v49 != v40) {
          objc_enumerationMutation(v37);
        }
        objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * i), "setHoursThreshold:", v36, v44, v45);
      }
      uint64_t v39 = [v37 countByEnumeratingWithState:&v48 objects:v52 count:16];
    }
    while (v39);
  }

  v42 = (void *)[v37 copy];

  return v42;
}

+ (GEOPDLocalTimeRange)_rangeWithFromHour:(int64_t)a3 fromMinute:(int64_t)a4 toHour:(int64_t)a5 toMinute:(int64_t)a6
{
  unint64_t v6 = (3600 * a3 + 60 * a4) | ((unint64_t)((3600 * a5 + 60 * a6) >> 2) << 34);
  $7D24B5AD5894795FD85A0EE1D817D743 v7 = ($7D24B5AD5894795FD85A0EE1D817D743)3;
  result.var0 = v6;
  result.var1 = HIDWORD(v6);
  result.var2 = v7;
  return result;
}

+ (id)testingDictionaryForIsWeekdayInRange
{
  return &unk_1ED73F360;
}

@end