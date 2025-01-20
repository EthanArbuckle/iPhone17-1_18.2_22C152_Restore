@interface NSDateComponents(_)
- (uint64_t)encodeWithCoder:()_;
- (void)initWithCoder:()_;
@end

@implementation NSDateComponents(_)

- (uint64_t)encodeWithCoder:()_
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateComponents requires a keyed encoder" userInfo:0]);
  }
  uint64_t v5 = [a1 calendar];
  if (v5) {
    [a3 encodeObject:v5 forKey:@"NS.calendar"];
  }
  uint64_t v6 = [a1 timeZone];
  if (v6) {
    [a3 encodeObject:v6 forKey:@"NS.timezone"];
  }
  uint64_t v7 = [a1 era];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v7 forKey:@"NS.era"];
  }
  uint64_t v8 = [a1 year];
  if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v8 forKey:@"NS.year"];
  }
  uint64_t v9 = [a1 month];
  if (v9 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v9 forKey:@"NS.month"];
  }
  uint64_t v10 = [a1 day];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v10 forKey:@"NS.day"];
  }
  uint64_t v11 = [a1 hour];
  if (v11 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v11 forKey:@"NS.hour"];
  }
  uint64_t v12 = [a1 minute];
  if (v12 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v12 forKey:@"NS.minute"];
  }
  uint64_t v13 = [a1 second];
  if (v13 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v13 forKey:@"NS.second"];
  }
  uint64_t v14 = [a1 week];
  if (v14 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v14 forKey:@"NS.week"];
  }
  uint64_t v15 = [a1 weekday];
  if (v15 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v15 forKey:@"NS.weekday"];
  }
  uint64_t v16 = [a1 weekdayOrdinal];
  if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v16 forKey:@"NS.weekdayOrdinal"];
  }
  uint64_t v17 = [a1 quarter];
  if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v17 forKey:@"NS.quarter"];
  }
  uint64_t v18 = [a1 nanosecond];
  if (v18 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v18 forKey:@"NS.nanosec"];
  }
  uint64_t v19 = [a1 weekOfMonth];
  if (v19 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v19 forKey:@"NS.weekOfMonth"];
  }
  uint64_t v20 = [a1 weekOfYear];
  if (v20 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v20 forKey:@"NS.weekOfYear"];
  }
  uint64_t v21 = [a1 yearForWeekOfYear];
  if (v21 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v21 forKey:@"NS.yearForWOY"];
  }
  uint64_t v22 = [a1 dayOfYear];
  if (v22 != 0x7FFFFFFFFFFFFFFFLL) {
    [a3 encodeInteger:v22 forKey:@"NS.dayOfYear"];
  }
  uint64_t v23 = [a1 isLeapMonth];

  return [a3 encodeInteger:v23 forKey:@"NS.leapMonth"];
}

- (void)initWithCoder:()_
{
  v36[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSDateComponents requires a keyed encoder" userInfo:0]);
  }
  if ([a3 containsValueForKey:@"NS.calendar"])
  {
    uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.calendar"];
    if (!v5 || (uint64_t v6 = v5, (objc_opt_isKindOfClass() & 1) == 0))
    {

      v35 = @"NSLocalizedDescription";
      v36[0] = @"Calendar has been corrupted!";
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = (__CFString **)v36;
      uint64_t v9 = &v35;
LABEL_11:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v8, v9, 1)));
      return 0;
    }
  }
  else
  {
    uint64_t v6 = 0;
  }
  if ([a3 containsValueForKey:@"NS.timezone"])
  {
    uint64_t v10 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.timezone"];
    if (!v10 || (uint64_t v11 = v10, (objc_opt_isKindOfClass() & 1) == 0))
    {

      v33 = @"NSLocalizedDescription";
      v34 = @"Time zone has been corrupted!";
      uint64_t v7 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v8 = &v34;
      uint64_t v9 = &v33;
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v11 = 0;
  }
  if ([a3 containsValueForKey:@"NS.era"]) {
    uint64_t v32 = [a3 decodeIntegerForKey:@"NS.era"];
  }
  else {
    uint64_t v32 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.year"]) {
    uint64_t v31 = [a3 decodeIntegerForKey:@"NS.year"];
  }
  else {
    uint64_t v31 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.month"]) {
    uint64_t v30 = [a3 decodeIntegerForKey:@"NS.month"];
  }
  else {
    uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.day"]) {
    uint64_t v29 = [a3 decodeIntegerForKey:@"NS.day"];
  }
  else {
    uint64_t v29 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.hour"]) {
    uint64_t v28 = [a3 decodeIntegerForKey:@"NS.hour"];
  }
  else {
    uint64_t v28 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.minute"]) {
    uint64_t v27 = [a3 decodeIntegerForKey:@"NS.minute"];
  }
  else {
    uint64_t v27 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.second"]) {
    uint64_t v26 = [a3 decodeIntegerForKey:@"NS.second"];
  }
  else {
    uint64_t v26 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.week"]) {
    uint64_t v25 = [a3 decodeIntegerForKey:@"NS.week"];
  }
  else {
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.weekday"]) {
    uint64_t v24 = [a3 decodeIntegerForKey:@"NS.weekday"];
  }
  else {
    uint64_t v24 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.weekdayOrdinal"]) {
    uint64_t v23 = [a3 decodeIntegerForKey:@"NS.weekdayOrdinal"];
  }
  else {
    uint64_t v23 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.quarter"]) {
    int v13 = objc_msgSend(a3, "containsValueForKey:", @"NS.nanosec", objc_msgSend(a3, "decodeIntegerForKey:", @"NS.quarter"));
  }
  else {
    int v13 = objc_msgSend(a3, "containsValueForKey:", @"NS.nanosec", 0x7FFFFFFFFFFFFFFFLL);
  }
  if (v13) {
    uint64_t v14 = [a3 decodeIntegerForKey:@"NS.nanosec"];
  }
  else {
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.weekOfMonth"]) {
    uint64_t v15 = [a3 decodeIntegerForKey:@"NS.weekOfMonth"];
  }
  else {
    uint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.weekOfYear"]) {
    uint64_t v16 = [a3 decodeIntegerForKey:@"NS.weekOfYear"];
  }
  else {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.yearForWOY"]) {
    uint64_t v17 = [a3 decodeIntegerForKey:@"NS.yearForWOY"];
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.dayOfYear"]) {
    uint64_t v18 = [a3 decodeIntegerForKey:@"NS.dayOfYear"];
  }
  else {
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.leapMonth"]) {
    BOOL v19 = [a3 decodeIntegerForKey:@"NS.leapMonth"] != 0;
  }
  else {
    BOOL v19 = 0;
  }
  uint64_t v20 = (void *)[a1 init];
  uint64_t v12 = v20;
  if (v20)
  {
    if (v6) {
      [v20 setCalendar:v6];
    }
    if (v11) {
      [v12 setTimeZone:v11];
    }
    [v12 setEra:v32];
    [v12 setYear:v31];
    [v12 setMonth:v30];
    [v12 setDay:v29];
    [v12 setHour:v28];
    [v12 setMinute:v27];
    [v12 setSecond:v26];
    [v12 setWeek:v25];
    [v12 setWeekday:v24];
    [v12 setWeekdayOrdinal:v23];
    [v12 setQuarter:v22];
    [v12 setNanosecond:v14];
    [v12 setWeekOfMonth:v15];
    [v12 setWeekOfYear:v16];
    [v12 setYearForWeekOfYear:v17];
    [v12 setDayOfYear:v18];
    if (v19) {
      [v12 setLeapMonth:1];
    }
  }
  return v12;
}

@end