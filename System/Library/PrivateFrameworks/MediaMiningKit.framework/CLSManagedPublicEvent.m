@interface CLSManagedPublicEvent
+ (NSString)entityName;
- (NSTimeZone)timeZone;
- (int64_t)expectedAttendance;
- (void)setExpectedAttendance:(int64_t)a3;
@end

@implementation CLSManagedPublicEvent

+ (NSString)entityName
{
  return (NSString *)@"PublicEvent";
}

- (void)setExpectedAttendance:(int64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    [(CLSManagedPublicEvent *)self setExpectedAttendanceAsNumber:0];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
    id v4 = (id)objc_claimAutoreleasedReturnValue();
    [(CLSManagedPublicEvent *)self setExpectedAttendanceAsNumber:v4];
  }
}

- (int64_t)expectedAttendance
{
  v2 = [(CLSManagedPublicEvent *)self expectedAttendanceAsNumber];
  v3 = v2;
  if (v2) {
    int64_t v4 = [v2 integerValue];
  }
  else {
    int64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v4;
}

- (NSTimeZone)timeZone
{
  v2 = (void *)MEMORY[0x1E4F1CAF0];
  uint64_t v3 = [(CLSManagedPublicEvent *)self timeZoneOffset];
  return (NSTimeZone *)[v2 timeZoneForSecondsFromGMT:v3];
}

@end