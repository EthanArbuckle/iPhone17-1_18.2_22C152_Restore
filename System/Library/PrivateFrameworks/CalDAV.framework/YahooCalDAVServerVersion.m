@interface YahooCalDAVServerVersion
- (BOOL)supportsAutoSchedule;
- (YahooCalDAVServerVersion)init;
- (id)type;
@end

@implementation YahooCalDAVServerVersion

- (YahooCalDAVServerVersion)init
{
  v6.receiver = self;
  v6.super_class = (Class)YahooCalDAVServerVersion;
  v2 = [(CalDAVServerVersion *)&v6 init];
  if (v2)
  {
    uint64_t v5 = 0;
    v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"ATS|YTS/([0-9]+\\.[0-9]+)" options:1 error:&v5];
    [(CalDAVConcreteServerVersion *)v2 setRegularExpression:v3];

    [(CalDAVServerVersion *)v2 setSupportsChecksumming:0];
  }
  return v2;
}

- (id)type
{
  return @"Yahoo";
}

- (BOOL)supportsAutoSchedule
{
  return 1;
}

@end