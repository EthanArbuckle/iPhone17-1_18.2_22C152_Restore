@interface NSDate(NSURLExtras)
- (BOOL)_web_isToday;
- (NSString)_web_RFC1123DateString;
- (uint64_t)_web_compareDay:()NSURLExtras;
@end

@implementation NSDate(NSURLExtras)

- (NSString)_web_RFC1123DateString
{
  [a1 timeIntervalSinceReferenceDate];
  if (v1 < -1.26227808e10) {
    double v1 = -1.26227808e10;
  }
  if (v1 <= 1.26227808e10) {
    double v2 = v1;
  }
  else {
    double v2 = 1.26227808e10;
  }
  id v3 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v4 = (id)[v3 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  objc_msgSend(v4, "setTimeZone:", objc_msgSend(MEMORY[0x1E4F1CAF0], "timeZoneWithName:", @"GMT"));
  v5 = objc_msgSend(v4, "components:fromDate:", 764, objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSinceReferenceDate:", v2));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%s, %02ld %s %ld %02ld:%02ld:%02ld GMT", kDayStrs[[v5 weekday] - 1], objc_msgSend(v5, "day"), kMonthStrs[objc_msgSend(v5, "month") - 1], objc_msgSend(v5, "year"), objc_msgSend(v5, "hour"), objc_msgSend(v5, "minute"), objc_msgSend(v5, "second"));
}

- (uint64_t)_web_compareDay:()NSURLExtras
{
  if (a1 == a3) {
    return 0;
  }
  id v5 = objc_alloc(MEMORY[0x1E4F1C9A8]);
  id v6 = (id)[v5 initWithCalendarIdentifier:*MEMORY[0x1E4F1C318]];
  v7 = (void *)[v6 components:28 fromDate:a1];
  v8 = (void *)[v6 components:28 fromDate:a3];
  uint64_t v9 = [v7 year];
  uint64_t v10 = [v8 year];
  if (v9 < v10) {
    return -1;
  }
  if (v9 > v10) {
    return 1;
  }
  uint64_t v11 = [v7 month];
  uint64_t v12 = [v8 month];
  if (v11 < v12) {
    return -1;
  }
  if (v11 > v12) {
    return 1;
  }
  uint64_t v14 = [v7 day];
  uint64_t v15 = [v8 day];
  if (v14 < v15) {
    return -1;
  }
  else {
    return v14 > v15;
  }
}

- (BOOL)_web_isToday
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F1C9C8], "date"), "_web_compareDay:", a1) == 0;
}

@end