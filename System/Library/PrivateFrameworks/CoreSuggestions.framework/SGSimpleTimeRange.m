@interface SGSimpleTimeRange
+ (BOOL)hasYearMonthDayComponents:(id)a3;
+ (BOOL)isAllDayComponents:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (SGUnixTimestamp_)fromFloatingTime:(SGUnixTimestamp_)a3;
+ (SGUnixTimestamp_)toFloatingTime:(SGUnixTimestamp_)a3;
+ (SGUnixTimestamp_)toFloatingTime:(SGUnixTimestamp_)a3 withDSTAmbiguityPreferences:(id)a4;
+ (id)dateFromGregorianComponents:(id)a3;
+ (id)floatingRangeWithLocalStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4;
+ (id)floatingRangeWithLocalStartDate:(id)a3 endDate:(id)a4;
+ (id)floatingRangeWithUTCStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4;
+ (id)floatingRangeWithUTCStartDate:(id)a3 endDate:(id)a4;
+ (id)rangeWithGregorianStartComponents:(id)a3 endComponents:(id)a4;
+ (id)rangeWithStart:(SGUnixTimestamp_)a3 duration:(double)a4 timeZone:(id)a5;
+ (id)rangeWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4 timeZone:(id)a5;
+ (id)rangeWithStart:(SGUnixTimestamp_)a3 startTimeZone:(id)a4 end:(SGUnixTimestamp_)a5 endTimeZone:(id)a6;
+ (id)rangeWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6;
+ (id)utcRangeWithStart:(SGUnixTimestamp_)a3 duration:(double)a4;
+ (id)utcRangeWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4;
- (BOOL)isEndDatePast;
- (BOOL)isEndDatePastOver365days;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToSimpleTimeRange:(id)a3;
- (BOOL)isFloating;
- (BOOL)isValidAllDayRange;
- (BOOL)startedMoreThan24HoursAgo;
- (NSDate)endDate;
- (NSDate)startDate;
- (NSTimeZone)endTimeZone;
- (NSTimeZone)startTimeZone;
- (SGSimpleTimeRange)initWithCoder:(id)a3;
- (SGSimpleTimeRange)initWithStart:(SGUnixTimestamp_)a3 startUTCOffsetSeconds:(int64_t)a4 end:(SGUnixTimestamp_)a5 endUTCOffsetSeconds:(int64_t)a6;
- (SGUnixTimestamp_)end;
- (SGUnixTimestamp_)start;
- (id)_componentsForDate:(id)a3 timeZone:(id)a4;
- (id)absoluteRange;
- (id)endDateComponents;
- (id)initUTCFloatingWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4;
- (id)stableStringRepresentation;
- (id)startDateComponents;
- (int64_t)endUTCOffsetSeconds;
- (int64_t)startUTCOffsetSeconds;
- (unint64_t)hash;
- (void)applyToEKEvent:(id)a3 isAllDay:(BOOL)a4 isFloating:(BOOL)a5;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SGSimpleTimeRange

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endTimeZone, 0);

  objc_storeStrong((id *)&self->_startTimeZone, 0);
}

- (BOOL)isFloating
{
  return self->_floating;
}

- (int64_t)endUTCOffsetSeconds
{
  return self->_endUTCOffsetSeconds;
}

- (int64_t)startUTCOffsetSeconds
{
  return self->_startUTCOffsetSeconds;
}

- (SGUnixTimestamp_)end
{
  return self->_end;
}

- (SGUnixTimestamp_)start
{
  return self->_start;
}

- (BOOL)isEndDatePastOver365days
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  v6 = [(SGSimpleTimeRange *)self absoluteRange];
  [v6 end];
  BOOL v8 = v5 - v7 > 31536000.0;

  return v8;
}

- (BOOL)isEndDatePast
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  [v3 timeIntervalSince1970];
  double v5 = v4;
  v6 = [(SGSimpleTimeRange *)self absoluteRange];
  [v6 end];
  BOOL v8 = v5 > v7;

  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  double secondsFromUnixEpoch = self->_start.secondsFromUnixEpoch;
  id v5 = a3;
  [v5 encodeDouble:@"start" forKey:secondsFromUnixEpoch];
  [v5 encodeDouble:@"end" forKey:self->_end.secondsFromUnixEpoch];
  [v5 encodeInteger:self->_startUTCOffsetSeconds forKey:@"startUTCOffsetSeconds"];
  [v5 encodeInteger:self->_endUTCOffsetSeconds forKey:@"endUTCOffsetSeconds"];
  [v5 encodeBool:self->_floating forKey:@"floating"];
  [v5 encodeObject:self->_startTimeZone forKey:@"startTimeZone"];
  [v5 encodeObject:self->_endTimeZone forKey:@"endTimeZone"];
}

- (SGSimpleTimeRange)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SGSimpleTimeRange;
  id v5 = [(SGSimpleTimeRange *)&v15 init];
  if (v5)
  {
    [v4 decodeDoubleForKey:@"start"];
    v5->_start.double secondsFromUnixEpoch = v6;
    [v4 decodeDoubleForKey:@"end"];
    v5->_end.double secondsFromUnixEpoch = v7;
    v5->_startUTCOffsetSeconds = [v4 decodeIntegerForKey:@"startUTCOffsetSeconds"];
    v5->_endUTCOffsetSeconds = [v4 decodeIntegerForKey:@"endUTCOffsetSeconds"];
    v5->_floating = [v4 decodeBoolForKey:@"floating"];
    BOOL v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v9 = [v4 decodeObjectOfClasses:v8 forKey:@"startTimeZone"];
    startTimeZone = v5->_startTimeZone;
    v5->_startTimeZone = (NSTimeZone *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", objc_opt_class(), 0);
    uint64_t v12 = [v4 decodeObjectOfClasses:v11 forKey:@"endTimeZone"];
    endTimeZone = v5->_endTimeZone;
    v5->_endTimeZone = (NSTimeZone *)v12;
  }
  return v5;
}

- (unint64_t)hash
{
  return (unint64_t)self->_end.secondsFromUnixEpoch
       - (unint64_t)self->_start.secondsFromUnixEpoch
       + 32 * (unint64_t)self->_start.secondsFromUnixEpoch;
}

- (BOOL)isEqualToSimpleTimeRange:(id)a3
{
  id v4 = a3;
  [v4 start];
  if (self->_start.secondsFromUnixEpoch != v5) {
    goto LABEL_8;
  }
  [v4 end];
  if (self->_end.secondsFromUnixEpoch != v6) {
    goto LABEL_8;
  }
  int floating = self->_floating;
  if (floating != [v4 isFloating]) {
    goto LABEL_8;
  }
  if (!self->_floating)
  {
    int64_t startUTCOffsetSeconds = self->_startUTCOffsetSeconds;
    if (startUTCOffsetSeconds == [v4 startUTCOffsetSeconds])
    {
      int64_t endUTCOffsetSeconds = self->_endUTCOffsetSeconds;
      BOOL v8 = endUTCOffsetSeconds == [v4 endUTCOffsetSeconds];
      goto LABEL_9;
    }
LABEL_8:
    BOOL v8 = 0;
    goto LABEL_9;
  }
  BOOL v8 = 1;
LABEL_9:

  return v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (SGSimpleTimeRange *)a3;
  double v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(SGSimpleTimeRange *)self isEqualToSimpleTimeRange:v5];

  return v6;
}

- (void)applyToEKEvent:(id)a3 isAllDay:(BOOL)a4 isFloating:(BOOL)a5
{
  BOOL v6 = a4;
  id v32 = a3;
  BOOL v8 = [(SGSimpleTimeRange *)self startDate];
  uint64_t v9 = [(SGSimpleTimeRange *)self endDate];
  id v10 = [(SGSimpleTimeRange *)self startTimeZone];
  uint64_t v11 = [(SGSimpleTimeRange *)self endTimeZone];
  uint64_t v12 = (void *)v11;
  unint64_t v13 = 0x1E4F1C000uLL;
  if (v6)
  {
    v14 = [(SGSimpleTimeRange *)self startDateComponents];
    objc_super v15 = [(SGSimpleTimeRange *)self endDateComponents];
    v16 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    [v14 setTimeZone:v16];
    [v15 setTimeZone:v16];
    v17 = [v14 calendar];
    v18 = [v17 dateFromComponents:v14];

    v19 = [v15 calendar];
    v20 = [v19 dateFromComponents:v15];

    uint64_t v9 = [v20 dateByAddingTimeInterval:-1.0];

    unint64_t v13 = 0x1E4F1C000;
    id v10 = 0;
    uint64_t v12 = v14;
LABEL_11:

    uint64_t v12 = v10;
    goto LABEL_12;
  }
  if (!v10)
  {
    +[SGSimpleTimeRange fromFloatingTime:self->_start.secondsFromUnixEpoch];
    v18 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v21];

    if (a5)
    {
      +[SGSimpleTimeRange fromFloatingTime:self->_end.secondsFromUnixEpoch];
      uint64_t v23 = [objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v22];

      id v10 = 0;
      uint64_t v9 = (void *)v23;
      goto LABEL_11;
    }
    id v10 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    if (v12) {
      goto LABEL_12;
    }
LABEL_9:
    if (!v10) {
      goto LABEL_12;
    }
    uint64_t v12 = [(SGSimpleTimeRange *)self endDateComponents];
    [v12 setTimeZone:v10];
    v24 = [v12 calendar];
    uint64_t v25 = [v24 dateFromComponents:v12];

    id v10 = v10;
    uint64_t v9 = (void *)v25;
    goto LABEL_11;
  }
  v18 = v8;
  if (!v11) {
    goto LABEL_9;
  }
LABEL_12:
  v26 = *(void **)(v13 + 2504);
  [v18 timeIntervalSinceReferenceDate];
  v28 = [v26 dateWithTimeIntervalSinceReferenceDate:floor(v27)];

  v29 = *(void **)(v13 + 2504);
  [v9 timeIntervalSinceReferenceDate];
  v31 = [v29 dateWithTimeIntervalSinceReferenceDate:floor(v30)];

  if (!v6)
  {
    [v32 setStartTimeZone:v10];
    [v32 setEndTimeZone:v12];
  }
  [v32 setAllDay:v6];
  [v32 setStartDate:v28];
  [v32 setEndDateUnadjustedForLegacyClients:v31];
}

- (BOOL)startedMoreThan24HoursAgo
{
  v3 = [MEMORY[0x1E4F1C9C8] date];
  id v4 = [v3 dateByAddingTimeInterval:-86400.0];
  [v4 timeIntervalSince1970];
  double v6 = v5;
  double v7 = [(SGSimpleTimeRange *)self absoluteRange];
  [v7 start];
  BOOL v9 = v6 - v8 > 0.0;

  return v9;
}

- (BOOL)isValidAllDayRange
{
  v3 = (void *)MEMORY[0x1A6265250](self, a2);
  id v4 = [(SGSimpleTimeRange *)self startDateComponents];
  if ([v4 hour] || objc_msgSend(v4, "minute") || objc_msgSend(v4, "second"))
  {
    BOOL v5 = 0;
  }
  else
  {
    double v7 = [(SGSimpleTimeRange *)self endDateComponents];
    BOOL v5 = ![v7 hour] && !objc_msgSend(v7, "minute") && !objc_msgSend(v7, "second")
      || [v7 hour] >= 23 && objc_msgSend(v7, "minute") >= 59 && objc_msgSend(v7, "second") >= 59;
  }
  return v5;
}

- (id)endDateComponents
{
  v3 = [(SGSimpleTimeRange *)self endDate];
  id v4 = [(SGSimpleTimeRange *)self endTimeZone];
  BOOL v5 = [(SGSimpleTimeRange *)self _componentsForDate:v3 timeZone:v4];

  return v5;
}

- (id)startDateComponents
{
  v3 = [(SGSimpleTimeRange *)self startDate];
  id v4 = [(SGSimpleTimeRange *)self startTimeZone];
  BOOL v5 = [(SGSimpleTimeRange *)self _componentsForDate:v3 timeZone:v4];

  return v5;
}

- (id)_componentsForDate:(id)a3 timeZone:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  double v7 = (void *)MEMORY[0x1A6265250]();
  double v8 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  BOOL v9 = v8;
  if (v6)
  {
    [v8 setTimeZone:v6];
  }
  else
  {
    id v10 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
    [v9 setTimeZone:v10];
  }
  uint64_t v11 = [v9 components:1048828 fromDate:v5];
  [v11 setTimeZone:v6];

  return v11;
}

- (NSTimeZone)endTimeZone
{
  if (self->_floating)
  {
    v2 = 0;
  }
  else
  {
    endTimeZone = self->_endTimeZone;
    if (endTimeZone)
    {
      v2 = endTimeZone;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      id v6 = [(SGSimpleTimeRange *)self endDate];
      uint64_t v7 = [v5 secondsFromGMTForDate:v6];

      if (v7 == self->_endUTCOffsetSeconds) {
        [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      }
      else {
        objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:");
      }
      v2 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (NSTimeZone)startTimeZone
{
  if (self->_floating)
  {
    v2 = 0;
  }
  else
  {
    startTimeZone = self->_startTimeZone;
    if (startTimeZone)
    {
      v2 = startTimeZone;
    }
    else
    {
      id v5 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      id v6 = [(SGSimpleTimeRange *)self startDate];
      uint64_t v7 = [v5 secondsFromGMTForDate:v6];

      if (v7 == self->_startUTCOffsetSeconds) {
        [MEMORY[0x1E4F1CAF0] defaultTimeZone];
      }
      else {
        objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneForSecondsFromGMT:");
      }
      v2 = (NSTimeZone *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v2;
}

- (NSDate)endDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_end.secondsFromUnixEpoch];

  return (NSDate *)v2;
}

- (NSDate)startDate
{
  v2 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:self->_start.secondsFromUnixEpoch];

  return (NSDate *)v2;
}

- (id)stableStringRepresentation
{
  BOOL floating = self->_floating;
  id v4 = [NSString alloc];
  double secondsFromUnixEpoch = self->_start.secondsFromUnixEpoch;
  if (floating) {
    id v6 = objc_msgSend(v4, "initWithFormat:", @"%0.2f_%0.2f", secondsFromUnixEpoch, *(void *)&self->_start.secondsFromUnixEpoch, *(void *)&self->_end.secondsFromUnixEpoch, v8, v9);
  }
  else {
    id v6 = objc_msgSend(v4, "initWithFormat:", @"%0.2f(%ld)_%0.2f(%ld)", secondsFromUnixEpoch, *(void *)&secondsFromUnixEpoch, self->_startUTCOffsetSeconds, *(void *)&self->_end.secondsFromUnixEpoch, self->_endUTCOffsetSeconds);
  }

  return v6;
}

- (id)absoluteRange
{
  if (self->_floating)
  {
    +[SGSimpleTimeRange fromFloatingTime:self->_start.secondsFromUnixEpoch];
    double v4 = v3;
    +[SGSimpleTimeRange fromFloatingTime:self->_end.secondsFromUnixEpoch];
    double v6 = v5;
    uint64_t v7 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
    uint64_t v8 = +[SGSimpleTimeRange rangeWithStart:v7 end:v4 timeZone:v6];
  }
  else
  {
    uint64_t v8 = self;
  }

  return v8;
}

- (SGSimpleTimeRange)initWithStart:(SGUnixTimestamp_)a3 startUTCOffsetSeconds:(int64_t)a4 end:(SGUnixTimestamp_)a5 endUTCOffsetSeconds:(int64_t)a6
{
  v12.receiver = self;
  v12.super_class = (Class)SGSimpleTimeRange;
  result = [(SGSimpleTimeRange *)&v12 init];
  if (result)
  {
    if (a5.secondsFromUnixEpoch >= a3.secondsFromUnixEpoch) {
      double secondsFromUnixEpoch = a5.secondsFromUnixEpoch;
    }
    else {
      double secondsFromUnixEpoch = a3.secondsFromUnixEpoch;
    }
    result->_start.double secondsFromUnixEpoch = a3.secondsFromUnixEpoch;
    result->_end.double secondsFromUnixEpoch = secondsFromUnixEpoch;
    result->_int64_t startUTCOffsetSeconds = a4;
    result->_int64_t endUTCOffsetSeconds = a6;
    result->_BOOL floating = 0;
  }
  return result;
}

- (id)initUTCFloatingWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  v8.receiver = self;
  v8.super_class = (Class)SGSimpleTimeRange;
  id result = [(SGSimpleTimeRange *)&v8 init];
  if (result)
  {
    if (a4.secondsFromUnixEpoch >= a3.secondsFromUnixEpoch) {
      double secondsFromUnixEpoch = a4.secondsFromUnixEpoch;
    }
    else {
      double secondsFromUnixEpoch = a3.secondsFromUnixEpoch;
    }
    *((double *)result + 1) = a3.secondsFromUnixEpoch;
    *((double *)result + 2) = secondsFromUnixEpoch;
    *((unsigned char *)result + 40) = 1;
  }
  return result;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)floatingRangeWithLocalStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  double v6 = [SGSimpleTimeRange alloc];
  +[SGSimpleTimeRange toFloatingTime:a3.secondsFromUnixEpoch];
  double v8 = v7;
  +[SGSimpleTimeRange toFloatingTime:a4.secondsFromUnixEpoch];
  id v10 = [(SGSimpleTimeRange *)v6 initUTCFloatingWithStart:v8 end:v9];

  return v10;
}

+ (id)floatingRangeWithLocalStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  [a3 timeIntervalSince1970];
  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:");
  double v7 = v6;
  [v5 timeIntervalSince1970];
  double v9 = v8;

  +[SGSimpleTimeRange toFloatingTime:v9];
  id v11 = [[SGSimpleTimeRange alloc] initUTCFloatingWithStart:v7 end:v10];

  return v11;
}

+ (id)floatingRangeWithUTCStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  id v4 = [[SGSimpleTimeRange alloc] initUTCFloatingWithStart:a3.secondsFromUnixEpoch end:a4.secondsFromUnixEpoch];

  return v4;
}

+ (id)floatingRangeWithUTCStartDate:(id)a3 endDate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  double v7 = [SGSimpleTimeRange alloc];
  [v6 timeIntervalSince1970];
  double v9 = v8;

  [v5 timeIntervalSince1970];
  double v11 = v10;

  id v12 = [(SGSimpleTimeRange *)v7 initUTCFloatingWithStart:v9 end:v11];

  return v12;
}

+ (id)utcRangeWithStart:(SGUnixTimestamp_)a3 duration:(double)a4
{
  return +[SGSimpleTimeRange utcRangeWithStart:a3.secondsFromUnixEpoch end:a3.secondsFromUnixEpoch + a4];
}

+ (id)rangeWithStart:(SGUnixTimestamp_)a3 duration:(double)a4 timeZone:(id)a5
{
  return +[SGSimpleTimeRange rangeWithStart:a5 end:a3.secondsFromUnixEpoch timeZone:a3.secondsFromUnixEpoch + a4];
}

+ (id)utcRangeWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4
{
  id v6 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  double v7 = +[SGSimpleTimeRange rangeWithStart:v6 end:a3.secondsFromUnixEpoch timeZone:a4.secondsFromUnixEpoch];

  return v7;
}

+ (id)rangeWithStart:(SGUnixTimestamp_)a3 end:(SGUnixTimestamp_)a4 timeZone:(id)a5
{
  return +[SGSimpleTimeRange rangeWithStart:a5 startTimeZone:a5 end:a3.secondsFromUnixEpoch endTimeZone:a4.secondsFromUnixEpoch];
}

+ (id)rangeWithStartDate:(id)a3 startTimeZone:(id)a4 endDate:(id)a5 endTimeZone:(id)a6
{
  double v9 = (NSTimeZone *)a4;
  double v10 = (NSTimeZone *)a6;
  id v11 = a5;
  id v12 = a3;
  uint64_t v13 = [(NSTimeZone *)v9 secondsFromGMTForDate:v12];
  uint64_t v14 = [(NSTimeZone *)v10 secondsFromGMTForDate:v11];
  objc_super v15 = [SGSimpleTimeRange alloc];
  [v12 timeIntervalSince1970];
  double v17 = v16;

  [v11 timeIntervalSince1970];
  double v19 = v18;

  v20 = [(SGSimpleTimeRange *)v15 initWithStart:v13 startUTCOffsetSeconds:v14 end:v17 endUTCOffsetSeconds:v19];
  startTimeZone = v20->_startTimeZone;
  v20->_startTimeZone = v9;
  double v22 = v9;

  endTimeZone = v20->_endTimeZone;
  v20->_endTimeZone = v10;

  return v20;
}

+ (id)rangeWithStart:(SGUnixTimestamp_)a3 startTimeZone:(id)a4 end:(SGUnixTimestamp_)a5 endTimeZone:(id)a6
{
  double v9 = (objc_class *)MEMORY[0x1E4F1C9C8];
  id v10 = a6;
  id v11 = a4;
  id v12 = (void *)[[v9 alloc] initWithTimeIntervalSince1970:a3.secondsFromUnixEpoch];
  uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:a5.secondsFromUnixEpoch];
  uint64_t v14 = +[SGSimpleTimeRange rangeWithStartDate:v12 startTimeZone:v11 endDate:v13 endTimeZone:v10];

  return v14;
}

+ (id)rangeWithGregorianStartComponents:(id)a3 endComponents:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7)
  {
    uint64_t v14 = 0;
    double v9 = 0;
    goto LABEL_23;
  }
  if (!+[SGSimpleTimeRange hasYearMonthDayComponents:v7])
  {
    uint64_t v14 = 0;
    double v9 = v7;
    goto LABEL_23;
  }
  double v9 = (void *)[v7 copy];

  if (v8
    && +[SGSimpleTimeRange hasYearMonthDayComponents:v8])
  {
    id v10 = (void *)[v8 copy];

    id v11 = [v9 timeZone];
    id v12 = [v10 timeZone];
    BOOL v13 = v12 == 0;

    if ((v11 == 0) == v13) {
      goto LABEL_11;
    }
    id v8 = [v9 timeZone];
    [v10 setTimeZone:v8];
  }
  else
  {
    id v10 = (void *)[v9 copy];
  }

LABEL_11:
  id v8 = v10;
  BOOL v15 = +[SGSimpleTimeRange isAllDayComponents:v9];
  if (v15 != +[SGSimpleTimeRange isAllDayComponents:v8])
  {
    objc_msgSend(v8, "setHour:", objc_msgSend(v9, "hour"));
    objc_msgSend(v8, "setMinute:", objc_msgSend(v9, "minute"));
    objc_msgSend(v8, "setSecond:", objc_msgSend(v9, "second"));
    objc_msgSend(v8, "setNanosecond:", objc_msgSend(v9, "nanosecond"));
  }
  if (+[SGSimpleTimeRange isAllDayComponents:v9])
  {
    [v8 setHour:24];
    [v8 setMinute:0];
    [v8 setSecond:0];
    [v8 setNanosecond:0];
  }
  double v16 = +[SGSimpleTimeRange dateFromGregorianComponents:v9];
  uint64_t v17 = +[SGSimpleTimeRange dateFromGregorianComponents:v8];
  double v18 = (void *)v17;
  if (!v16)
  {
    v24 = [MEMORY[0x1E4F28B00] currentHandler];
    [v24 handleFailureInMethod:a2, a1, @"SGSimpleTimeRange.m", 180, @"Invalid parameter not satisfying: %@", @"startDate" object file lineNumber description];

    if (v18) {
      goto LABEL_17;
    }
LABEL_27:
    uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
    [v25 handleFailureInMethod:a2, a1, @"SGSimpleTimeRange.m", 181, @"Invalid parameter not satisfying: %@", @"endDate" object file lineNumber description];

    goto LABEL_17;
  }
  if (!v17) {
    goto LABEL_27;
  }
LABEL_17:
  double v19 = [v9 timeZone];

  if (v19)
  {
    v20 = [v8 timeZone];

    if (!v20)
    {
      v26 = [MEMORY[0x1E4F28B00] currentHandler];
      [v26 handleFailureInMethod:a2, a1, @"SGSimpleTimeRange.m", 184, @"if the start has a timezone, then end should too" object file lineNumber description];
    }
    double v21 = [v9 timeZone];
    double v22 = [v8 timeZone];
    uint64_t v14 = +[SGSimpleTimeRange rangeWithStartDate:v16 startTimeZone:v21 endDate:v18 endTimeZone:v22];
  }
  else
  {
    uint64_t v14 = +[SGSimpleTimeRange floatingRangeWithUTCStartDate:v16 endDate:v18];
  }

LABEL_23:

  return v14;
}

+ (BOOL)hasYearMonthDayComponents:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 year] != 0x7FFFFFFFFFFFFFFFLL
    && [v3 month] != 0x7FFFFFFFFFFFFFFFLL
    && [v3 day] != 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

+ (BOOL)isAllDayComponents:(id)a3
{
  return [a3 hour] == 0x7FFFFFFFFFFFFFFFLL;
}

+ (id)dateFromGregorianComponents:(id)a3
{
  id v5 = a3;
  uint64_t v6 = [v5 calendar];
  if (v6)
  {
    id v7 = (void *)v6;
    id v8 = [v5 calendar];
    double v9 = [v8 calendarIdentifier];
    id v10 = (void *)*MEMORY[0x1E4F1C318];

    if (v9 != v10)
    {
      id v11 = [MEMORY[0x1E4F28B00] currentHandler];
      [v11 handleFailureInMethod:a2, a1, @"SGSimpleTimeRange.m", 122, @"Invalid parameter not satisfying: %@", @"components.calendar == nil || components.calendar.calendarIdentifier == NSCalendarIdentifierGregorian" object file lineNumber description];

      double v9 = v10;
    }
  }
  else
  {
    double v9 = (void *)*MEMORY[0x1E4F1C318];
  }
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9A8]) initWithCalendarIdentifier:v9];
  BOOL v13 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v12 setTimeZone:v13];

  uint64_t v14 = [v12 dateFromComponents:v5];

  return v14;
}

+ (SGUnixTimestamp_)fromFloatingTime:(SGUnixTimestamp_)a3
{
  +[SGSimpleTimeRange toFloatingTime:](SGSimpleTimeRange, "toFloatingTime:");
  v5.double secondsFromUnixEpoch = -(v4 - a3.secondsFromUnixEpoch * 2.0);
  return v5;
}

+ (SGUnixTimestamp_)toFloatingTime:(SGUnixTimestamp_)a3 withDSTAmbiguityPreferences:(id)a4
{
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1A6265250]();
  +[SGSimpleTimeRange toFloatingTime:a3.secondsFromUnixEpoch];
  v10.double secondsFromUnixEpoch = v9;
  id v11 = [MEMORY[0x1E4F1CAF0] defaultTimeZone];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:a3.secondsFromUnixEpoch];
  BOOL v13 = [v12 dateByAddingTimeInterval:-7200.0];
  uint64_t v14 = [v11 nextDaylightSavingTimeTransitionAfterDate:v13];
  if (v14)
  {
    [v12 timeIntervalSinceDate:v14];
    if (v15 >= 0.0)
    {
      double v16 = v15;
      [v11 daylightSavingTimeOffsetForDate:v13];
      double v18 = v17;
      [v11 daylightSavingTimeOffsetForDate:v12];
      double v20 = v19;
      if (v18 == v19)
      {
        [MEMORY[0x1E4F28B00] currentHandler];
        v39 = v42 = v8;
        [v39 handleFailureInMethod:a2, a1, @"SGSimpleTimeRange.m", 60, @"Invalid parameter not satisfying: %@", @"offsetBefore != offsetAfter" object file lineNumber description];

        id v8 = v42;
      }
      BOOL v21 = v18 <= v20;
      double v22 = v20 - v18;
      if (v21 && v22 >= v16)
      {
        v24 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:v10.secondsFromUnixEpoch];
        v43 = [v24 dateByAddingTimeInterval:-v22];
        uint64_t v25 = [v7 calendar];
        v26 = (void *)[v25 copy];
        double v27 = v26;
        v46 = v7;
        v41 = v8;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          id v28 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
        }
        v29 = v28;

        double v30 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
        [v29 setTimeZone:v30];

        v40 = v24;
        v45 = [v29 components:33020 fromDate:v24];
        v44 = [v29 components:33020 fromDate:v43];
        uint64_t v31 = 0;
        while (1)
        {
          uint64_t v32 = qword_1A4E19B08[v31];
          uint64_t v33 = [v46 valueForComponent:v32];
          if (v33 != 0x7FFFFFFFFFFFFFFFLL)
          {
            uint64_t v34 = v33;
            uint64_t v35 = [v45 valueForComponent:v32];
            uint64_t v36 = [v44 valueForComponent:v32];
            if (v35 != v36)
            {
              if (v35 == v34) {
                goto LABEL_18;
              }
              if (v36 == v34) {
                break;
              }
            }
          }
          if (++v31 == 7) {
            goto LABEL_18;
          }
        }
        [v43 timeIntervalSince1970];
        v10.double secondsFromUnixEpoch = v38;
LABEL_18:

        id v7 = v46;
        id v8 = v41;
      }
    }
  }

  return v10;
}

+ (SGUnixTimestamp_)toFloatingTime:(SGUnixTimestamp_)a3
{
  double v4 = [MEMORY[0x1E4F1C9A8] calendarWithIdentifier:*MEMORY[0x1E4F1C318]];
  SGUnixTimestamp_ v5 = (void *)[objc_alloc(MEMORY[0x1E4F1C9C8]) initWithTimeIntervalSince1970:a3.secondsFromUnixEpoch];
  uint64_t v6 = [v4 components:3145980 fromDate:v5];

  id v7 = [MEMORY[0x1E4F1CAF0] timeZoneForSecondsFromGMT:0];
  [v6 setTimeZone:v7];

  id v8 = [v4 dateFromComponents:v6];
  [v8 timeIntervalSince1970];
  v10.double secondsFromUnixEpoch = v9;

  return v10;
}

@end