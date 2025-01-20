@interface CNEnvironment(ContactsMetrics)
- (uint64_t)metricsReporter;
@end

@implementation CNEnvironment(ContactsMetrics)

- (uint64_t)metricsReporter
{
  return [a1 valueForKey:@"metrics-reporter" onCacheMiss:&__block_literal_global];
}

@end