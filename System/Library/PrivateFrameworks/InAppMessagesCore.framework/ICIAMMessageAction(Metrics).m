@interface ICIAMMessageAction(Metrics)
- (id)dictionaryRepresentationWithReportableMetricsEvents;
@end

@implementation ICIAMMessageAction(Metrics)

- (id)dictionaryRepresentationWithReportableMetricsEvents
{
  v2 = [a1 dictionaryRepresentation];
  v3 = (void *)[v2 mutableCopy];

  if ([a1 hasClickEvent])
  {
    v4 = [a1 clickEvent];
    v5 = [v4 reportableDictionary];
    [v3 setObject:v5 forKey:@"clickEvent"];
  }
  v6 = (void *)[v3 copy];

  return v6;
}

@end