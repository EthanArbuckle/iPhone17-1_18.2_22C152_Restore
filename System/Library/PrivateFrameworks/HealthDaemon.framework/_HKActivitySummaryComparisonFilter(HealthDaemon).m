@interface _HKActivitySummaryComparisonFilter(HealthDaemon)
- (uint64_t)predicateWithProfile:()HealthDaemon;
@end

@implementation _HKActivitySummaryComparisonFilter(HealthDaemon)

- (uint64_t)predicateWithProfile:()HealthDaemon
{
  return [MEMORY[0x1E4F65D58] truePredicate];
}

@end