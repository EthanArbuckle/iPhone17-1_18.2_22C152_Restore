@interface GEOPlaceDailyNormalizedHours
+ (id)dailyNormalizedHoursForWeekday:(int64_t)a3 timeIntervals:(id)a4 closingThreshold:(double)a5 openingThreshold:(double)a6 openToMidnight:(BOOL)a7 openFromMidnight:(BOOL)a8;
+ (int64_t)getWeekdayForDate:(id)a3 inNormalizedHours:(id)a4 timeZone:(id)a5;
+ (int64_t)todaysWeekday:(int64_t)a3 yesterdaysWeekday:(int64_t)a4 containsTimeFromMidnight:(double)a5 inNormalizedHours:(id)a6;
- (BOOL)openFromMidnight;
- (BOOL)openToMidnight;
- (NSArray)localTimeIntervals;
- (double)closingSoonThresholdSeconds;
- (double)openingSoonThresholdSeconds;
- (id)description;
- (int64_t)weekday;
- (void)setClosingSoonThresholdSeconds:(double)a3;
- (void)setOpeningSoonThresholdSeconds:(double)a3;
@end

@implementation GEOPlaceDailyNormalizedHours

+ (id)dailyNormalizedHoursForWeekday:(int64_t)a3 timeIntervals:(id)a4 closingThreshold:(double)a5 openingThreshold:(double)a6 openToMidnight:(BOOL)a7 openFromMidnight:(BOOL)a8
{
  id v13 = a4;
  v14 = objc_alloc_init(GEOPlaceDailyNormalizedHours);
  v15 = v14;
  if (v14)
  {
    v14->_weekday = a3;
    uint64_t v16 = [v13 copy];
    localTimeIntervals = v15->_localTimeIntervals;
    v15->_localTimeIntervals = (NSArray *)v16;

    v15->_closingSoonThresholdSeconds = a5;
    v15->_openingSoonThresholdSeconds = a6;
    v15->_openToMidnight = a7;
    v15->_openFromMidnight = a8;
  }

  return v15;
}

+ (int64_t)getWeekdayForDate:(id)a3 inNormalizedHours:(id)a4 timeZone:(id)a5
{
  id v7 = a4;
  v8 = (void *)MEMORY[0x1E4F1C9A8];
  uint64_t v9 = *MEMORY[0x1E4F1C318];
  id v10 = a5;
  id v11 = a3;
  v12 = [v8 calendarWithIdentifier:v9];
  [v12 setTimeZone:v10];

  id v13 = [v12 components:512 fromDate:v11];
  int64_t v14 = [v13 weekday];
  v15 = [v12 startOfDayForDate:v11];
  [v11 timeIntervalSinceDate:v15];
  double v17 = v16;

  if (v14 >= 1)
  {
    if (v14 == 1) {
      uint64_t v18 = 7;
    }
    else {
      uint64_t v18 = v14 - 1;
    }
    int64_t v14 = +[GEOPlaceDailyNormalizedHours todaysWeekday:v14 yesterdaysWeekday:v18 containsTimeFromMidnight:v7 inNormalizedHours:v17];
  }

  return v14;
}

+ (int64_t)todaysWeekday:(int64_t)a3 yesterdaysWeekday:(int64_t)a4 containsTimeFromMidnight:(double)a5 inNormalizedHours:(id)a6
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v9 = a6;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (!v10)
  {
    id v13 = 0;
    v12 = 0;
LABEL_16:
    a3 = -1;
    goto LABEL_33;
  }
  uint64_t v11 = v10;
  v12 = 0;
  id v13 = 0;
  uint64_t v14 = *(void *)v37;
  do
  {
    for (uint64_t i = 0; i != v11; ++i)
    {
      if (*(void *)v37 != v14) {
        objc_enumerationMutation(v9);
      }
      double v16 = *(void **)(*((void *)&v36 + 1) + 8 * i);
      if ([v16 weekday] == a3)
      {
        id v17 = v16;

        id v13 = v17;
      }
      if ([v16 weekday] == a4)
      {
        id v18 = v16;

        v12 = v18;
      }
    }
    uint64_t v11 = [v9 countByEnumeratingWithState:&v36 objects:v41 count:16];
  }
  while (v11);
  if (!v13) {
    goto LABEL_16;
  }
  if ([v13 openFromMidnight]) {
    int v19 = [v12 openToMidnight] ^ 1;
  }
  else {
    int v19 = 1;
  }
  int v31 = v19;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  obuint64_t j = [v13 localTimeIntervals];
  uint64_t v20 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v33;
    while (2)
    {
      for (uint64_t j = 0; j != v21; ++j)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(obj);
        }
        v24 = *(void **)(*((void *)&v32 + 1) + 8 * j);
        [v24 startTime];
        if (v25 <= a5)
        {
          [v24 endTime];
          BOOL v26 = v27 >= a5;
        }
        else
        {
          BOOL v26 = 0;
        }
        [v24 startTime];
        if (((!v26 | v31) & 1) == 0 && v28 == 0.0)
        {
          a3 = a4;
          goto LABEL_32;
        }
      }
      uint64_t v21 = [obj countByEnumeratingWithState:&v32 objects:v40 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }
LABEL_32:

LABEL_33:
  return a3;
}

- (id)description
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F28E78] string];
  [v3 appendString:@"<  Weekday  > \n"];
  objc_msgSend(v3, "appendFormat:", @"%d\n", self->_weekday);
  [v3 appendString:@"<  Local Time Intervals  > \n"];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  v4 = self->_localTimeIntervals;
  uint64_t v5 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        [v9 startTime];
        uint64_t v11 = v10;
        [v9 endTime];
        objc_msgSend(v3, "appendFormat:", @"<  Start Seconds: %f  >  -  <  End Seconds: %f  > \n", v11, v12, (void)v16);
      }
      uint64_t v6 = [(NSArray *)v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v6);
  }

  [v3 appendString:@"<  Closing Soon Threshold  > \n"];
  objc_msgSend(v3, "appendFormat:", @"%d\n", (int)self->_closingSoonThresholdSeconds);
  [v3 appendString:@"<  Opening Soon Threshold  > \n"];
  objc_msgSend(v3, "appendFormat:", @"%d\n", (int)self->_openingSoonThresholdSeconds);
  [v3 appendString:@"<  Open To Midnight  > \n"];
  if (self->_openToMidnight) {
    id v13 = @"Yes";
  }
  else {
    id v13 = @"No";
  }
  [v3 appendFormat:@"%@ \n", v13];
  [v3 appendString:@"<  Open From Midnight  > \n"];
  if (self->_openFromMidnight) {
    uint64_t v14 = @"Yes";
  }
  else {
    uint64_t v14 = @"No";
  }
  [v3 appendFormat:@"%@ \n \n", v14];

  return v3;
}

- (int64_t)weekday
{
  return self->_weekday;
}

- (NSArray)localTimeIntervals
{
  return self->_localTimeIntervals;
}

- (double)closingSoonThresholdSeconds
{
  return self->_closingSoonThresholdSeconds;
}

- (void)setClosingSoonThresholdSeconds:(double)a3
{
  self->_closingSoonThresholdSeconds = a3;
}

- (double)openingSoonThresholdSeconds
{
  return self->_openingSoonThresholdSeconds;
}

- (void)setOpeningSoonThresholdSeconds:(double)a3
{
  self->_openingSoonThresholdSeconds = a3;
}

- (BOOL)openToMidnight
{
  return self->_openToMidnight;
}

- (BOOL)openFromMidnight
{
  return self->_openFromMidnight;
}

- (void).cxx_destruct
{
}

@end