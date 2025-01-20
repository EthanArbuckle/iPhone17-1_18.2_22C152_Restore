@interface _HKActivityCacheComparisonFilter(HealthDaemon)
- (id)predicateWithProfile:()HealthDaemon;
- (uint64_t)filterIgnoringActivityCacheIndexFilter;
@end

@implementation _HKActivityCacheComparisonFilter(HealthDaemon)

- (id)predicateWithProfile:()HealthDaemon
{
  [a1 operatorType];
  uint64_t v2 = HDSQLiteComparisonTypeForPredicateOperator();
  v3 = (void *)MEMORY[0x1E4F65D00];
  v4 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(a1, "cacheIndex"));
  v5 = [v3 predicateWithProperty:@"cache_index" value:v4 comparisonType:v2];

  return v5;
}

- (uint64_t)filterIgnoringActivityCacheIndexFilter
{
  return [MEMORY[0x1E4F2B868] trueFilter];
}

@end