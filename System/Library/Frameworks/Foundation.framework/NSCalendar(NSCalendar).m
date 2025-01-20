@interface NSCalendar(NSCalendar)
- (uint64_t)classForCoder;
- (uint64_t)encodeWithCoder:()NSCalendar;
- (void)initWithCoder:()NSCalendar;
@end

@implementation NSCalendar(NSCalendar)

- (uint64_t)encodeWithCoder:()NSCalendar
{
  if (([a3 allowsKeyedCoding] & 1) == 0) {
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCalendars cannot be encoded by non-keyed archivers" userInfo:0]);
  }
  uint64_t v5 = [a1 calendarIdentifier];
  if (v5) {
    [a3 encodeObject:v5 forKey:@"NS.identifier"];
  }
  uint64_t v6 = [a1 locale];
  if (v6) {
    [a3 encodeObject:v6 forKey:@"NS.locale"];
  }
  uint64_t v7 = [a1 timeZone];
  if (v7) {
    [a3 encodeObject:v7 forKey:@"NS.timezone"];
  }
  uint64_t v8 = [a1 gregorianStartDate];
  if (v8) {
    [a3 encodeObject:v8 forKey:@"NS.gstartdate"];
  }
  objc_msgSend(a3, "encodeInteger:forKey:", objc_msgSend(a1, "firstWeekday"), @"NS.firstwkdy");
  uint64_t v9 = [a1 minimumDaysInFirstWeek];

  return [a3 encodeInteger:v9 forKey:@"NS.mindays"];
}

- (void)initWithCoder:()NSCalendar
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {

    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:@"NSCalendars cannot be decoded by non-keyed archivers" userInfo:0]);
  }
  if (![a3 containsValueForKey:@"NS.identifier"]
    || (uint64_t v5 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.identifier"]) == 0)
  {

    v21 = @"NSLocalizedDescription";
    v22[0] = @"Time zone has been corrupted!";
    uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
    v10 = (__CFString **)v22;
    v11 = &v21;
    goto LABEL_9;
  }
  uint64_t v6 = v5;
  if ([a3 containsValueForKey:@"NS.locale"])
  {
    uint64_t v7 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.locale"];
    if (!v7 || (uint64_t v8 = v7, (objc_opt_isKindOfClass() & 1) == 0))
    {

      v19 = @"NSLocalizedDescription";
      v20 = @"Locale has been corrupted!";
      uint64_t v9 = (void *)MEMORY[0x1E4F1C9E8];
      v10 = &v20;
      v11 = &v19;
LABEL_9:
      objc_msgSend(a3, "failWithError:", +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", @"NSCocoaErrorDomain", 4864, objc_msgSend(v9, "dictionaryWithObjects:forKeys:count:", v10, v11, 1)));
      return 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }
  if ([a3 containsValueForKey:@"NS.timezone"]) {
    uint64_t v14 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.timezone"];
  }
  else {
    uint64_t v14 = 0;
  }
  if ([a3 containsValueForKey:@"NS.gstartdate"]) {
    uint64_t v15 = [a3 decodeObjectOfClass:objc_opt_class() forKey:@"NS.gstartdate"];
  }
  else {
    uint64_t v15 = 0;
  }
  if ([a3 containsValueForKey:@"NS.firstwkdy"]) {
    uint64_t v16 = [a3 decodeIntegerForKey:@"NS.firstwkdy"];
  }
  else {
    uint64_t v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 containsValueForKey:@"NS.mindays"]) {
    uint64_t v17 = [a3 decodeIntegerForKey:@"NS.mindays"];
  }
  else {
    uint64_t v17 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if ([a3 error])
  {

    return 0;
  }
  v18 = (void *)[a1 initWithCalendarIdentifier:v6];
  v12 = v18;
  if (v18)
  {
    [v18 setLocale:v8];
    if (v14) {
      [v12 setTimeZone:v14];
    }
    if (v15) {
      [v12 setGregorianStartDate:v15];
    }
    if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
      [v12 setFirstWeekday:v16];
    }
    if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
      [v12 setMinimumDaysInFirstWeek:v17];
    }
  }
  return v12;
}

- (uint64_t)classForCoder
{
  return self;
}

@end