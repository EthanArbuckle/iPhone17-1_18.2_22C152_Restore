@interface CNEnvironmentTestDouble(ContactsMetrics)
- (uint64_t)setMetricsReporter:()ContactsMetrics;
@end

@implementation CNEnvironmentTestDouble(ContactsMetrics)

- (uint64_t)setMetricsReporter:()ContactsMetrics
{
  return [a1 setValue:a3 forKey:@"metrics-reporter"];
}

@end