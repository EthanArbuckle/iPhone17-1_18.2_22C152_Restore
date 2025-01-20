@interface GoogleCalDAVServerVersion
- (BOOL)requiresOpeningAttachmentAsLink;
- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars;
- (GoogleCalDAVServerVersion)init;
- (id)supportedCalendarComponentSets;
- (id)type;
@end

@implementation GoogleCalDAVServerVersion

- (GoogleCalDAVServerVersion)init
{
  v6.receiver = self;
  v6.super_class = (Class)GoogleCalDAVServerVersion;
  v2 = [(CalDAVServerVersion *)&v6 init];
  if (v2)
  {
    uint64_t v5 = 0;
    v3 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"(GSE|ESF)" options:1 error:&v5];
    [(CalDAVConcreteServerVersion *)v2 setRegularExpression:v3];

    [(CalDAVServerVersion *)v2 setSupportsChecksumming:0];
    [(CalDAVServerVersion *)v2 setExpandPropertyReportIsUnreliable:1];
    [(CalDAVServerVersion *)v2 setSupportsTimeRangeFilterOnInbox:0];
  }
  return v2;
}

- (id)type
{
  return @"Google";
}

- (id)supportedCalendarComponentSets
{
  return @"kCalDAVDoesNotSupportCalendarCreation";
}

- (BOOL)requiresOpeningAttachmentAsLink
{
  return 1;
}

- (BOOL)shouldUseDeleteAndAddInsteadOfMoveBetweenCalendars
{
  return 1;
}

@end