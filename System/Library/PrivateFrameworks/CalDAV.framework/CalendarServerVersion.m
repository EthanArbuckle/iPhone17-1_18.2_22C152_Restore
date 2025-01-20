@interface CalendarServerVersion
- (BOOL)supportsTimeRangeFilterWithoutEndDate;
- (CalendarServerVersion)init;
- (id)type;
@end

@implementation CalendarServerVersion

- (CalendarServerVersion)init
{
  v6.receiver = self;
  v6.super_class = (Class)CalendarServerVersion;
  v2 = [(CalDAVServerVersion *)&v6 init];
  if (v2)
  {
    uint64_t v5 = 0;
    v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"TwistedCalDAV/(\\?|[0-9]+\\.[0-9]+)" options:1 error:&v5];
    [(CalDAVConcreteServerVersion *)v2 setRegularExpression:v3];
  }
  return v2;
}

- (id)type
{
  return @"CalendarServer";
}

- (BOOL)supportsTimeRangeFilterWithoutEndDate
{
  [(CalDAVServerVersion *)self version];
  if (v3 > 1.3)
  {
    [(CalDAVServerVersion *)self version];
    if (v4 < 2.0) {
      return 1;
    }
  }
  [(CalDAVServerVersion *)self version];
  return v6 > 2.0;
}

@end